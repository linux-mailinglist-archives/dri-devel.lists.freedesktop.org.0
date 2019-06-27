Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A658293
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FA96E184;
	Thu, 27 Jun 2019 12:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19ED66E184
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:27:23 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RCOvkT118930;
 Thu, 27 Jun 2019 12:27:02 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2t9cyqqwsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 12:27:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RCPYKS034383;
 Thu, 27 Jun 2019 12:27:01 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2t9acd7c4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 12:27:01 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5RCQrMe001253;
 Thu, 27 Jun 2019 12:26:53 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 27 Jun 2019 05:26:52 -0700
Date: Thu, 27 Jun 2019 15:26:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lukas Schneider <lukas.s.schneider@fau.de>
Subject: Re: [PATCH] fbtft: Cleanup line over 80 character warnings
Message-ID: <20190627122643.GB19015@kadam>
References: <20190627121240.31584-1-lukas.s.schneider@fau.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627121240.31584-1-lukas.s.schneider@fau.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=zN2Zg/SRNDfb3CjVSZPYtadej8e83QgIVYu0JKeZv2M=;
 b=LSSz5tEtvsn30+kW/ZMiVwWDJhDNdEbl4poSKdZ6DVKP1endvdQmtuPDqeV23SQIBFkd
 5x8uTEvWLyalfQF4XuVXqkWPiriKoX2qJR1Jye3znYRIpgGRLWP/2MkIcTcqLHREv4DB
 1HVzRKRdb7zZo799JKRZiEfm5ruRNm5sg3Z2t8dy77Axr5myTjHWnACRGxDWoa7yXycz
 MnV/ak611NQwjovqYd/fIQyt9A9kSrH4XpwO65SFV+a6kuEVTXw22p+DDY7wGq07NzXw
 lxNf+rwwwCaVfCdBBAr4jPRq/2HyRzZVJ8Hquft/pvK58SzPZdtcPw9MCLAZq/qccR14 lg== 
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
Cc: devel@driverdev.osuosl.org, leobras.c@gmail.com,
 linux-fbdev@vger.kernel.org, digholebhagyashri@gmail.com,
 linux-kernel@i4.cs.fau.de, daniel.vetter@ffwll.ch, der_wolf_@web.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bhanusreemahesh@gmail.com, payal.s.kshirsagar.98@gmail.com,
 Jannik Moritz <jannik.moritz@fau.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29ycnksIEkgZG9uJ3QgZmVlbCBsaWtlIHRoaXMgbWFrZXMgaXQgbW9yZSByZWFkYWJsZS4KCnJl
Z2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
