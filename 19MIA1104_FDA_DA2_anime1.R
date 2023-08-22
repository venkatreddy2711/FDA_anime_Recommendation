#1q. Store  the  data  in  both  .txt  and  .csv  file  type.  Read  the  datasets  of  both  file  type
#getwd()
#setwd("C:\Users\91798\Documents\")
#list.files()
read.table("anime1.txt",header = FALSE,sep = "")
read.csv("anime1.csv",header = FALSE,sep = ",") 


#2q Discuss  the  purpose  of  data  cleaning  and  data  imputation  process for  your  dataset  by analyzing the various features in your data.



#3q Implement data cleaning process.
df = read.csv("anime1.csv",sep = ",")
df
# Removing Missing Values
#cases
complete.cases(df)
data_complete<-df[complete.cases(df),]
data_complete


#omit
df = read.csv("anime1.csv",sep = ",")
df <- na.omit(df)
df <- df[!(is.na(df$episodes)),]
df






#4q Implement data Imputation techniques.

#a, method 1 Imputing manually with 0/Mean/Median value
df = read.csv("anime1.csv",sep = ",")
df$rating[is.na(df$rating)]<-mean(df$rating,na.rm = T)
df



#b. Using Hmisc Library and imputing with Median value
library(Hmisc)
install.packages(Hmisc)
df = read.csv("anime1.csv",sep = ",")
impute(df$rating,median)

#Impute with a specific Constant value
impute(df$episodes,1)



#c. Impute the entire dataset:
df = read.csv("anime1.csv",sep = ",")
all_column_median <- apply(df,2,median,na.rm=TRUE)

for(i in colnames(df))
  df[,i][is.na(df[,i])]<-all_column_median[i]

df





#5q

# Visualization in R

library("graphics")
df = read.csv("anime1.csv",sep = ",")
plot(df$members)


#bar plot
table1 <- table(df$rating, df$members, dnn=c("Exit Count", "Geography")) 
barplot(table1, ylab="Frequency", xlab="Geography", main="Bar Chart", 
        col=c("turquoise4", "turquoise2" ), beside=TRUE, width=.2)

#histogram
hist(df$members)
hist(df$rating, breaks = 5)
hist(df$rating, breaks = 10)
hist(df$rating)


#Box plot
boxplot(df$members)
boxplot(df$rating)



library(lattice)
densityplot(df$rating)



library(ggplot2)
ggplot(df, aes(x = factor(rating))) + geom_bar()
ggplot(df, aes(x = factor(episodes))) + geom_bar()
ggplot(df, aes(x = members)) + geom_bar()
