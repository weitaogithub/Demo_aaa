<%@page import="Dao.BaseDao"%>
<%@ page import="java.sql.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
	<tr>
		<td>sid</td>
			<td>sname</td>
			<td>sage</td>
		</tr>

<%
//数据库路径
	try {
	BaseDao basedao =new BaseDao();
	Connection con=basedao.getCon();
	String sql = "select * from stu ";	
	//通过PrepardStatement 准备sql语句
	PreparedStatement pst =con.prepareStatement(sql);
	//获取结果集
	ResultSet rs = pst.executeQuery();
	
	//对结果集进行遍历
	//out.println("sid");
	//out.println("sname");
	//out.println("sage");
	//out.println("<br>");
	while(rs.next())
	{	 
		out.println("<tr>");
		out.println("<td>"+rs.getInt(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getInt(3)+"</td>");
		out.println("</tr>");
		out.println("<br>");
	}

//关闭连接
	basedao.close(con, pst, rs);
		
}catch(Exception e)
{
	e.printStackTrace();
}
%>
</table>

</body>
</html>