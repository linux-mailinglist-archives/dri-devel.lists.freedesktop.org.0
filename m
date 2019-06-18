Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0D4A553
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 17:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9FF89346;
	Tue, 18 Jun 2019 15:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283E389346
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 15:28:12 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ICwfa1126644;
 Tue, 18 Jun 2019 12:58:47 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2t4rmp4aaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 12:58:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5ICw3jf034004;
 Tue, 18 Jun 2019 12:58:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t5cpe1f7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 12:58:46 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5ICwhMU024608;
 Tue, 18 Jun 2019 12:58:44 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 05:58:43 -0700
Date: Tue, 18 Jun 2019 15:58:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] drm: return -EFAULT if copy_one_buf() fails
Message-ID: <20190618125833.GG18776@kadam>
References: <20190618125623.GA24896@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618125623.GA24896@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=938
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906180107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=995 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906180107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=TQk1dSNmuyQhx/dVU9Ha+bmmx+zy4oC9lrmr0y3O+tY=;
 b=st1QU4gauwmAPp6/Tv/ITRMYwYr4f243hNds1I8PVnURxxc4C5NiOshMMI6y0Cr5zJ0G
 AT+fQFq4qe72Qbgqs5dwBBZV/LV/pXZncdxGOc7cMfp/bVafQPZAFMk4Qi+nDS5cy4gF
 wBUO5BOItDbqQfaXgMH4pvJkwrqxmCMgRJwOyenlo6bXhA1WgRwC1MroHX6BMLTsfK3B
 InO9n1BivWNmfU+Rrd44NuBgOWl/JKL1EWgmBTBN1xMIG1o8J6jp73wRcXIm/kiYfnh2
 CbEB/Ffsz5f8/YUxSH11HuGXL9MavoOEFyMgRnCWGfrXCgqy/i2imUlCRuAB2wGSwzum BQ== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWggY3JhcC4gIEkgbmVlZCB0byBmaXggY29weV9vbmVfYnVmMzIoKSBhcyB3ZWxsLiAgSSB3aWxs
IHNlbnQgYSB2Mi4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
