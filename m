Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DCE8EED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662CF6E4D0;
	Tue, 29 Oct 2019 18:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD526E4D0;
 Tue, 29 Oct 2019 18:04:11 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9THmvh5162100;
 Tue, 29 Oct 2019 18:04:08 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2vvdjub5xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 18:04:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9THn5ao120218;
 Tue, 29 Oct 2019 18:04:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2vxpfdfs71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 18:04:07 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9TI46jp012440;
 Tue, 29 Oct 2019 18:04:06 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Oct 2019 11:04:06 -0700
Date: Tue, 29 Oct 2019 21:03:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH] drm/sched:  Fix passing zero to 'PTR_ERR' warning
Message-ID: <20191029180357.GB3866@kadam>
References: <1572361484-9828-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572361484-9828-1-git-send-email-andrey.grodzovsky@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290159
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290159
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=Rc4FCy2olxS9XmfDAi9ABMzQABTTJ3Mlpe5JW1WWgkM=;
 b=kM11/ctlNnNHuOLX/XgNb+SMFH+656LiLO44/NHy0LImWe+JFEQnEwmjcG5pv6xZQPkQ
 kEpsBWfqjpmCam3wVdiJwQG80V6KU/kjKiHxPekqCxw8k1jTu27sLyCApFsaosxbJH7z
 7U7g1nRYe3VJLbepEeqRVzLAudD85vaAxchkOGTKbOjOPQDH4mgwjKe2zyNTo72mQfls
 bVcMGq25fweCYCccfOxs05xLnEquJ+f6WceAfdwzFk1QUitOLiQ+4xq+AkDciNWFndMX
 RaUnoKwCUXIEQT4bge8OGf9LiSf6Wu8gEKuIKE6EidAABGUV6JEN/4A1Gq5K73scHT7y HA== 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMTE6MDQ6NDRBTSAtMDQwMCwgQW5kcmV5IEdyb2R6b3Zz
a3kgd3JvdGU6Cj4gRml4IGEgc3RhdGljIGNvZGUgY2hlY2tlciB3YXJuaW5nLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDQgKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gaW5kZXggZjM5Yjk3ZS4uODk4YjBj
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gQEAgLTQ5Nyw3
ICs0OTcsNyBAQCB2b2lkIGRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3Nj
aGVkdWxlciAqc2NoZWQpCj4gCQlmZW5jZSA9IHNjaGVkLT5vcHMtPnJ1bl9qb2Ioc19qb2IpOwo+
ICAKPiAgCQlpZiAoSVNfRVJSX09SX05VTEwoZmVuY2UpKSB7Cj4gIAkJCXNfam9iLT5zX2ZlbmNl
LT5wYXJlbnQgPSBOVUxMOwo+IC0JCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNlLT5maW5p
c2hlZCwgUFRSX0VSUihmZW5jZSkpOwo+ICsJCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKCZzX2ZlbmNl
LT5maW5pc2hlZCwgUFRSX0VSUl9PUl9aRVJPKGZlbmNlKSk7CgpJIGZlZWwgbGlrZSBJIHNob3Vs
ZCBleHBsYWluIGJldHRlci4gIEl0J3MgZ2VuZXJhbGx5IGJhZCB0byBtaXggTlVMTCBhbmQKZXJy
b3IgcG9pbnRlcnMuICBUaGUgc2l0dWF0aW9uIHdoZXJlIHlvdSB3b3VsZCBkbyBpdCBpcyB3aGVu
IE5VTEwgaXMgYQpzcGVjaWFsIGNhc2Ugb2Ygc3VjY2Vzcy4gIEEgdHlwaWNhbCBzaXR1YXRpb24g
aXMgeW91IHJlcXVlc3QgYSBmZWF0dXJlLApsaWtlIG1heWJlIGxvZ2dpbmcgZm9yIGV4YW1wbGU6
CgoJcCA9IGdldF9sb2dnZXIoKTsKCklmIHRoZXJlIGlzbid0IGVub3VnaCBtZW1vcnkgdGhlbiBn
ZXRfbG9nZ2VyKCkgcmV0dXJucyBFUlJfUFRSKC1FTk9NRU0pOwpidXQgaWYgdGhlIHVzZXIgaGFz
IGRpc2FibGVkIGxvZ2dpbmcgdGhlbiB3ZSBjYW4ndCByZXR1cm4gYSB2YWxpZApwb2ludGVyIGJ1
dCBpdCdzIGFsc28gbm90IGFuIGVycm9yIHNvIHdlIHJldHVybiBOVUxMLiAgSXQncyBhIHNwZWNp
YWwKY2FzZSBvZiBzdWNjZXNzLgoKSW4gdGhpcyBzaXR1YXRpb24gc2NoZWQtPm9wcy0+cnVuX2pv
YihzX2pvYik7IGFwcGVhcnMgdG8gb25seSBldmVyCnJldHVybiBOVUxMIGFuZCBpdCdzIG5vdCBh
IHNwZWNpYWwgY2FzZSBvZiBzdWNjZXNzLCBpdCdzIGEgcmVndWxhciBvbGQKZXJyb3IuICBJIGd1
ZXNzIHdlIGFyZSB0cmFuc2l0aW9uaW5nIGZyb20gcmV0dXJuaW5nIE5VTEwgdG8gcmV0dXJuaW5n
CmVycm9yIHBvaW50ZXJzPwoKU28gd2Ugc2hvdWxkIGp1c3QgZG8gc29tZXRoaW5nIGxpa2U6CgoJ
ZmVuY2UgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsKCgkvKiBGSVhNRTogT2N0IDIwMTk6
IFJlbW92ZSB0aGlzIGNvZGUgd2hlbiBmZW5jZSBjYW4ndCBiZSBOVUxMLiAqLwoJaWYgKCFmZW5j
ZSkKCQlmZW5jZSA9IEVSUl9QVFIoLUVJTlZBTCk7CgoJaWYgKElTX0VSUihmZW5jZSkpIHsKCQku
Li4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
