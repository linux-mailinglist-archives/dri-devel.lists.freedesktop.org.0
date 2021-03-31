Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D8634FCC2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF886EA2B;
	Wed, 31 Mar 2021 09:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52ED6EA2B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:27:42 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12V9OR7I060721;
 Wed, 31 Mar 2021 09:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=SkQi6L1YpCjyyQ+30hgTUCtsiQe0eVn+005qMCLrx00=;
 b=u19C6xLdqq5BfnOwRrLoJdCwHXw+Q1l7FUKHgGWmiVVb2rWBbdz5TadX/MA4L3OS8z+8
 Ca+xVVs7sV96MQwrA76Z8AxAXKbvjWq5jVy9mfcYlFP/9JNIZ528okLwJFaCIQETHxYR
 iZjM7tUdHVJdbYbGmrKuLRATdeY57SW11RCdWM5bwVmR3rFI6sC307lusbgu9ll9F67a
 Ri9dnXD5fbU9Yr0vtjZVtIugLS1gSyeYp5TdZS28IgWB+BSIazXdYE/+se9Ypbgc1tx5
 4iDL140hcz7R3j+z7Wm9zvcxbatTbRPjjER7Z4lGSHNmImeL4Zp0FyqOTJJLB1e8UcWE PA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 37mp06r2vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 09:27:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12V9Jcjv067651;
 Wed, 31 Mar 2021 09:27:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 37mabp6c6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 09:27:39 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12V9Rcam029065;
 Wed, 31 Mar 2021 09:27:38 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 02:27:37 -0700
Date: Wed, 31 Mar 2021 12:27:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [bug report] drm/bridge: Introduce LT8912B DSI to HDMI bridge
Message-ID: <20210331092730.GJ2088@kadam>
References: <YGQu9uZ/d5ph+eS9@mwanda> <20210331081438.GF2088@kadam>
 <CABkfQAGZVsRV_hjjGXvK-7yY5vgg+1Bfr9xCvxdLeJwA7OwJyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABkfQAGZVsRV_hjjGXvK-7yY5vgg+1Bfr9xCvxdLeJwA7OwJyg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310068
X-Proofpoint-ORIG-GUID: f833ATpBRoKcAgW7cHFqKyxzwHJQV8pO
X-Proofpoint-GUID: f833ATpBRoKcAgW7cHFqKyxzwHJQV8pO
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310068
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 11:17:20AM +0200, Adrien Grassein wrote:
> Hello,
> 
> thanks for your review.
> 
> I will publish a patch soon.
> 
> What tag should I add to my commit to mention that you find bugs
> (Suggested-by for example)?

If there is a bug fix then please could you use Reported-by?

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
