Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F78B3AD0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 14:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCFF6E277;
	Mon, 16 Sep 2019 12:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315336E277
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 12:55:48 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7E82D28D2CE;
 Mon, 16 Sep 2019 13:55:45 +0100 (BST)
Date: Mon, 16 Sep 2019 14:55:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/2] drm/panfrost: Extend the bo_wait() ioctl
Message-ID: <20190916145541.3d02fa48@collabora.com>
In-Reply-To: <2f9a6efa-2361-ebe0-3e28-64081dd5043b@arm.com>
References: <20190913111748.21071-1-boris.brezillon@collabora.com>
 <20190913111748.21071-2-boris.brezillon@collabora.com>
 <2f9a6efa-2361-ebe0-3e28-64081dd5043b@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBTZXAgMjAxOSAxNDo0Njo0NiArMDEwMApTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPiB3cm90ZToKCj4gT24gMTMvMDkvMjAxOSAxMjoxNywgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+ID4gU28gd2UgY2FuIGNob29zZSB0byB3YWl0IGZvciBhbGwgQk8gdXNlcnMs
IG9yIGp1c3QgZm9yIHdyaXRlcnMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXpp
bGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ICAKPiAKPiBMb29rcyBnb29kIHRv
IG1lOgo+IAo+IFJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29t
Pgo+IAo+IEFsdGhvdWdoIEkgZG9uJ3Qga25vdyBpZiB0aGUgdGVybSAid3JpdGVycyIgc2hvdWxk
IGJlIGluIHRoZSBBUEkgb3IgaWYKPiAiZXhjbHVzaXZlIiBpcyB0aGUgcHJlZmVycmVkIHRlcm0/
CgpJJ2xsIGdvIGZvciBQQU5GUk9TVF9XQUlUX0JPX0VYQ0xVU0lWRSB0aGVuLgoKVGhhbmtzLAoK
Qm9yaXMKCj4gCj4gU3RldmUKPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kcnYuYyB8IDggKysrKysrLS0KPiA+ICBpbmNsdWRlL3VhcGkvZHJtL3BhbmZy
b3N0X2RybS5oICAgICAgICAgfCA0ICsrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZHJ2LmMKPiA+IGluZGV4IDA4MDgyZmQ1NTdjMy4uNmE5NGFlYTIxNDdmIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiA+IEBAIC0zMjIs
MTYgKzMyMiwyMCBAQCBwYW5mcm9zdF9pb2N0bF93YWl0X2JvKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKmRhdGEsCj4gPiAgCXN0cnVjdCBkcm1fcGFuZnJvc3Rfd2FpdF9ibyAqYXJncyA9
IGRhdGE7Cj4gPiAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtX29iajsKPiA+ICAJdW5zaWdu
ZWQgbG9uZyB0aW1lb3V0ID0gZHJtX3RpbWVvdXRfYWJzX3RvX2ppZmZpZXMoYXJncy0+dGltZW91
dF9ucyk7Cj4gPiArCWJvb2wgd2FpdF9hbGwgPSAhKGFyZ3MtPmZsYWdzICYgUEFORlJPU1RfV0FJ
VF9CT19XUklURVJTKTsKPiA+ICAKPiA+ICAJaWYgKGFyZ3MtPnBhZCkKPiA+ICAJCXJldHVybiAt
RUlOVkFMOwo+ID4gIAo+ID4gKwlpZiAoYXJncy0+ZmxhZ3MgJiB+UEFORlJPU1RfV0FJVF9CT19X
UklURVJTKQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gPiAgCWdlbV9vYmogPSBkcm1f
Z2VtX29iamVjdF9sb29rdXAoZmlsZV9wcml2LCBhcmdzLT5oYW5kbGUpOwo+ID4gIAlpZiAoIWdl
bV9vYmopCj4gPiAgCQlyZXR1cm4gLUVOT0VOVDsKPiA+ICAKPiA+IC0JcmV0ID0gZG1hX3Jlc3Zf
d2FpdF90aW1lb3V0X3JjdShnZW1fb2JqLT5yZXN2LCB0cnVlLAo+ID4gLQkJCQkJCSAgdHJ1ZSwg
dGltZW91dCk7Cj4gPiArCXJldCA9IGRtYV9yZXN2X3dhaXRfdGltZW91dF9yY3UoZ2VtX29iai0+
cmVzdiwgd2FpdF9hbGwsCj4gPiArCQkJCQl0cnVlLCB0aW1lb3V0KTsKPiA+ICAJaWYgKCFyZXQp
Cj4gPiAgCQlyZXQgPSB0aW1lb3V0ID8gLUVUSU1FRE9VVCA6IC1FQlVTWTsKPiA+ICAKPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oIGIvaW5jbHVkZS91YXBp
L2RybS9wYW5mcm9zdF9kcm0uaAo+ID4gaW5kZXggMDI5YzZhZTFiMWYwLi5hYzRmYWNiY2VlNDcg
MTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oCj4gPiArKysg
Yi9pbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oCj4gPiBAQCAtMTExLDYgKzExMSw5IEBA
IHN0cnVjdCBkcm1fcGFuZnJvc3Rfc3VibWl0IHsKPiA+ICAJX191MzIgcGFkOwo+ID4gIH07Cj4g
PiAgCj4gPiArI2RlZmluZSBQQU5GUk9TVF9XQUlUX0FMTF9CT19VU0VSUwkoMCA8PCAwKQo+ID4g
KyNkZWZpbmUgUEFORlJPU1RfV0FJVF9CT19XUklURVJTCSgxIDw8IDApCj4gPiArCj4gPiAgLyoq
Cj4gPiAgICogc3RydWN0IGRybV9wYW5mcm9zdF93YWl0X2JvIC0gaW9jdGwgYXJndW1lbnQgZm9y
IHdhaXRpbmcgZm9yCj4gPiAgICogY29tcGxldGlvbiBvZiB0aGUgbGFzdCBEUk1fUEFORlJPU1Rf
U1VCTUlUIG9uIGEgQk8uCj4gPiBAQCAtMTIzLDYgKzEyNiw3IEBAIHN0cnVjdCBkcm1fcGFuZnJv
c3Rfd2FpdF9ibyB7Cj4gPiAgCV9fdTMyIGhhbmRsZTsKPiA+ICAJX191MzIgcGFkOwo+ID4gIAlf
X3M2NCB0aW1lb3V0X25zOwkvKiBhYnNvbHV0ZSAqLwo+ID4gKwlfX3U2NCBmbGFnczsKPiA+ICB9
Owo+ID4gIAo+ID4gICNkZWZpbmUgUEFORlJPU1RfQk9fTk9FWEVDCTEKPiA+ICAgCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
