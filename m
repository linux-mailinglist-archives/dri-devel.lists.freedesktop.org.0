Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C5BAE998
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 13:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB256E061;
	Tue, 10 Sep 2019 11:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EED16E063
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 11:56:06 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ABrjjQ183698;
 Tue, 10 Sep 2019 11:56:03 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2uw1jy2u0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 11:56:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ABsLD0060248;
 Tue, 10 Sep 2019 11:56:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2uwqktmp1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 11:56:02 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8ABu0GM028873;
 Tue, 10 Sep 2019 11:56:00 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Sep 2019 04:56:00 -0700
Date: Tue, 10 Sep 2019 14:55:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Adam Zerella <adam.zerella@gmail.com>
Subject: Re: [PATCH] staging: android: ion: Replace strncpy() for stracpy()
Message-ID: <20190910115550.GA15977@kadam>
References: <20190908043450.1078-1-adam.zerella@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190908043450.1078-1-adam.zerella@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909100119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9375
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909100119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=ivdH+jkLdC2yHvpK29OWsjhzVtybUeJgo5z2e3uXc10=;
 b=eZ3fntW5pgwadibllzOdiuvGQQ4GkoD+0OHfJnnreNWlKwq3gOohSS7YUY7NHvQYQ1M+
 mnlaQyYRl+dsrqCT7JVOOR6yDsE3lLuou5QTv8u9Eg/GjEIAKRCFeILeGQ7pb+H9K00D
 o8sB50Y2Y1mZAPMkTpC2zqwApR8ZZKRNdCYtCxlSOtxU4VJcrkqCDIN2kS0KDYnu8VSR
 Xv3v3WIddvK+fJRdWqGrFu32QnqMw08nwMzB6ZMEAVlILL8gIGa0SJjp/I2u4U5ebjYu
 2qUbqWhiqt1IN3INIQC3H7hQzUJ7yDFkJMf0R9elOBC9R2l6cy2Bk/ISympMW0GFlDKZ uw== 
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
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMDgsIDIwMTkgYXQgMDI6MzQ6NTBQTSArMTAwMCwgQWRhbSBaZXJlbGxhIHdy
b3RlOgo+IFVzaW5nIHN0cm5jcHkoKSBkb2VzIG5vdCBhbHdheXMgdGVybWluYXRlIHRoZSBkZXN0
aW5hdGlvbiBzdHJpbmcuCj4gc3RyYWNweSgpIGlzIGEgYWx0ZXJuYXRpdmUgZnVuY3Rpb24gdGhh
dCBkb2VzLCBieSB1c2luZyB0aGlzIG5ldwo+IGZ1bmN0aW9uIHdlIHdpbGwgbm8gbG9uZ2VyIG5l
ZWQgdG8gaW5zZXJ0IGEgbnVsbCBzZXBhcmF0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRhbSBa
ZXJlbGxhIDxhZGFtLnplcmVsbGFAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcv
YW5kcm9pZC9pb24vaW9uLmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9hbmRy
b2lkL2lvbi9pb24uYyBiL2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9pb24uYwo+IGluZGV4
IGU2YjFjYTE0MWI5My4uMTc5MDFiZDYyNmJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9hbmRyb2lkL2lvbi9pb24uYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9p
b24uYwo+IEBAIC00MzMsOCArNDMzLDcgQEAgc3RhdGljIGludCBpb25fcXVlcnlfaGVhcHMoc3Ry
dWN0IGlvbl9oZWFwX3F1ZXJ5ICpxdWVyeSkKPiAgCW1heF9jbnQgPSBxdWVyeS0+Y250Owo+ICAK
PiAgCXBsaXN0X2Zvcl9lYWNoX2VudHJ5KGhlYXAsICZkZXYtPmhlYXBzLCBub2RlKSB7Cj4gLQkJ
c3RybmNweShoZGF0YS5uYW1lLCBoZWFwLT5uYW1lLCBNQVhfSEVBUF9OQU1FKTsKPiAtCQloZGF0
YS5uYW1lW3NpemVvZihoZGF0YS5uYW1lKSAtIDFdID0gJ1wwJzsKPiArCQlzdHJhY3B5KGhkYXRh
Lm5hbWUsIGhlYXAtPm5hbWUsIE1BWF9IRUFQX05BTUUpOwoKc3RyYWNweSgpIG9ubHkgdGFrZXMg
dHdvIGFyZ3VtZW50cy4gIFRoaXMgZG9lc24ndCBjb21waWxlLgoKcmVnYXJkcywKZGFuIGNhcnBl
bnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
