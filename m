Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F385BCF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967BB6E794;
	Thu,  8 Aug 2019 07:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2019 08:56:04 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4346E69B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 08:56:04 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-219-Xw5AdrD2MRiS34lGOcsHNg-1; Wed, 07 Aug 2019 09:49:52 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 7 Aug 2019 09:49:52 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 7 Aug 2019 09:49:52 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Sasha Levin' <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 5.2 51/59] drm/exynos: fix missing decrement of
 retry counter
Thread-Topic: [PATCH AUTOSEL 5.2 51/59] drm/exynos: fix missing decrement of
 retry counter
Thread-Index: AQHVTJ/1OP2tfkMm3E2/Hf9p02kXJabvYCkQ
Date: Wed, 7 Aug 2019 08:49:52 +0000
Message-ID: <2ecde45912fc44b88df2ff5129b8ab67@AcuMS.aculab.com>
References: <20190806213319.19203-1-sashal@kernel.org>
 <20190806213319.19203-51-sashal@kernel.org>
In-Reply-To: <20190806213319.19203-51-sashal@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: Xw5AdrD2MRiS34lGOcsHNg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: Colin Ian King <colin.king@canonical.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2FzaGEgTGV2aW4KPiBTZW50OiAwNiBBdWd1c3QgMjAxOSAyMjozMwo+IAo+IEZyb206
IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gWyBVcHN0cmVh
bSBjb21taXQgMWJiYmFiMDk3YTA1Mjc2ZTMxMmRkMjQ2Mjc5MWQzMmIyMWNlYjFlZSBdCj4gCj4g
Q3VycmVudGx5IHRoZSByZXRyeSBjb3VudGVyIGlzIG5vdCBiZWluZyBkZWNyZW1lbnRlZCwgbGVh
ZGluZyB0byBhCj4gcG90ZW50aWFsIGluZmluaXRlIHNwaW4gaWYgdGhlIHNjYWxhcl9yZWFkcyBk
b24ndCBjaGFuZ2Ugc3RhdGUuCj4gCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIkluZmluaXRlIGxv
b3AiKQo+IEZpeGVzOiAyODBlNTRjOWY2MTQgKCJkcm0vZXh5bm9zOiBzY2FsZXI6IFJlc2V0IGhh
cmR3YXJlIGJlZm9yZSBzdGFydGluZyB0aGUgb3BlcmF0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBD
b2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9zY2FsZXIuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fc2NhbGVyLmMKPiBpbmRleCBlYzljMWI3ZDMxMDMzLi44OTg5ZjhhZjcxNmI3IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYwo+IEBAIC05NCwx
MiArOTQsMTIgQEAgc3RhdGljIGlubGluZSBpbnQgc2NhbGVyX3Jlc2V0KHN0cnVjdCBzY2FsZXJf
Y29udGV4dCAqc2NhbGVyKQo+ICAJc2NhbGVyX3dyaXRlKFNDQUxFUl9DRkdfU09GVF9SRVNFVCwg
U0NBTEVSX0NGRyk7Cj4gIAlkbyB7Cj4gIAkJY3B1X3JlbGF4KCk7Cj4gLQl9IHdoaWxlIChyZXRy
eSA+IDEgJiYKPiArCX0gd2hpbGUgKC0tcmV0cnkgPiAxICYmCj4gIAkJIHNjYWxlcl9yZWFkKFND
QUxFUl9DRkcpICYgU0NBTEVSX0NGR19TT0ZUX1JFU0VUKTsKPiAgCWRvIHsKPiAgCQljcHVfcmVs
YXgoKTsKPiAgCQlzY2FsZXJfd3JpdGUoMSwgU0NBTEVSX0lOVF9FTik7Cj4gLQl9IHdoaWxlIChy
ZXRyeSA+IDAgJiYgc2NhbGVyX3JlYWQoU0NBTEVSX0lOVF9FTikgIT0gMSk7Cj4gKwl9IHdoaWxl
ICgtLXJldHJ5ID4gMCAmJiBzY2FsZXJfcmVhZChTQ0FMRVJfSU5UX0VOKSAhPSAxKTsKPiAKPiAg
CXJldHVybiByZXRyeSA/IDAgOiAtRUlPOwoKSWYgdGhlIGZpcnN0IGxvb3AgaGl0cyB0aGUgcmV0
cnkgbGltaXQgdGhlIHNlY29uZCBsb29wIHdvbid0IGJlIHJpZ2h0CmFuZCB0aGUgZmluYWwgcmV0
dXJuIHZhbHVlIHdpbGwgYmUgMC4KCglEYXZpZAoKLQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNp
ZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsK
UmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
