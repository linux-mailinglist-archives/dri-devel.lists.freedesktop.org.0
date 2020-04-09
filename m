Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4A31A3263
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 12:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C614F6E0CC;
	Thu,  9 Apr 2020 10:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4225B6E0CC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 10:17:33 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 039AD75n162883;
 Thu, 9 Apr 2020 10:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=BQv+SFU9p0BAD68jJoZGU4GuYeJmyCacIu0TxHC5XrE=;
 b=zCw7BJTh6xHuF4KLGeTZOLnqIpZz43sntnvBpt26ZiOKmw2KhKwVxRVn7W+YXXYGZdu5
 +ZhUeDrec4ZKkm9AN/SiK4Orvstru5aSFF3o8tovRmAW8ZNkKzariO8xffXafpJ5UgNv
 XO1Qy4XVI+r5x3nKdOc/7DvAr8Xnk8uAGQ1rmDxS39XrCBDNCreD8RnfmNvlKdA2vyQm
 Mo7SSMqt/u/Qd8fAkWHG4i2qaMUlqpdkq7kNGAhQPp6OZa7pYhlVLElo4sPqjkGXeZaq
 Yf0SWAFRFlclEoz4/Q3Mh12H3X3/bBSUV5GRi8ZvbEvULiYajmBPjud25mgk+elCe4+U Kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 309gw4chm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Apr 2020 10:17:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 039AClOb148569;
 Thu, 9 Apr 2020 10:15:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 309ag478ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Apr 2020 10:15:26 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 039AFPpT017318;
 Thu, 9 Apr 2020 10:15:25 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 Apr 2020 03:15:24 -0700
Date: Thu, 9 Apr 2020 13:15:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: [PATCH v1] staging: fbtft: fb_st7789v: enabled inversion
Message-ID: <20200409101517.GO2001@kadam>
References: <1586424250-25897-1-git-send-email-oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586424250-25897-1-git-send-email-oliver.graute@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9585
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=667 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004090077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9585
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=745 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090077
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 gregkh@linuxfoundation.org, Oliver Graute <oliver.graute@kococonnector.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 11:24:05AM +0200, Oliver Graute wrote:
> From: Oliver Graute <oliver.graute@kococonnector.com>
> 
> Enable inversion mode

What the heck is an inversion mode and why would you want it?

regards,
dasn carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
