Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C188AD5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 12:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7386E2CA;
	Sat, 10 Aug 2019 10:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217D36E2C4;
 Sat, 10 Aug 2019 10:37:14 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17952212-1500050 for multiple; Sat, 10 Aug 2019 11:37:12 +0100
MIME-Version: 1.0
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809222643.23142-8-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <20190809222643.23142-8-matthew.auld@intel.com>
Message-ID: <156543343040.2301.8020420663847411412@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH v3 07/37] drm/i915: support creating LMEM
 objects
Date: Sat, 10 Aug 2019 11:37:10 +0100
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMTktMDgtMDkgMjM6MjY6MTMpCj4gQEAgLTEzNjksNiAr
MTM3MSw4IEBAIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlIHsKPiAgICAgICAgICAqLwo+ICAgICAg
ICAgcmVzb3VyY2Vfc2l6ZV90IHN0b2xlbl91c2FibGVfc2l6ZTsgICAgIC8qIFRvdGFsIHNpemUg
bWludXMgcmVzZXJ2ZWQgcmFuZ2VzICovCj4gIAo+ICsgICAgICAgc3RydWN0IGludGVsX21lbW9y
eV9yZWdpb24gKnJlZ2lvbnNbSU5URUxfTUVNT1JZX1VLTk9XTl07CgpJZiB0aGVyZSB3YXMgZXZl
ciBhbiBvYmplY3QgdG8gcHV0IGluc2lkZSBpOTE1X21tLCB0aGlzIGlzIHNvcmVseSB0aGUKb25l
IQoKPiAgICAgICAgIHN0cnVjdCBpbnRlbF91bmNvcmUgdW5jb3JlOwo+ICAKPiAgICAgICAgIHN0
cnVjdCBpOTE1X3ZpcnR1YWxfZ3B1IHZncHU7Cj4gQEAgLTIyMTMsNiArMjIxNyw3IEBAIElTX1NV
QlBMQVRGT1JNKGNvbnN0IHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LAo+ICAjZGVmaW5l
IEhBU19JUEMoZGV2X3ByaXYpICAgICAgICAgICAgICAgKElOVEVMX0lORk8oZGV2X3ByaXYpLT5k
aXNwbGF5Lmhhc19pcGMpCj4gIAo+ICAjZGVmaW5lIEhBU19SRUdJT04oaTkxNSwgaSkgKElOVEVM
X0lORk8oaTkxNSktPm1lbW9yeV9yZWdpb25zICYgKGkpKQo+ICsjZGVmaW5lIEhBU19MTUVNKGk5
MTUpIEhBU19SRUdJT04oaTkxNSwgUkVHSU9OX0xNRU0pCj4gIAo+ICAjZGVmaW5lIEhBU19HVF9V
QyhkZXZfcHJpdikgICAgKElOVEVMX0lORk8oZGV2X3ByaXYpLT5oYXNfZ3RfdWMpCj4gIAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9yZWdpb25fbG1lbS5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcmVnaW9uX2xtZW0uYwo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYTkwNmQxZmY2MzEKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcmVnaW9uX2xtZW0uYwo+IEBAIC0wLDAg
KzEsNDggQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAo+ICsvKgo+ICsgKiBD
b3B5cmlnaHQgwqkgMjAxOSBJbnRlbCBDb3Jwb3JhdGlvbgo+ICsgKi8KPiArCj4gKyNpbmNsdWRl
ICJpOTE1X2Rydi5oIgo+ICsjaW5jbHVkZSAiaW50ZWxfbWVtb3J5X3JlZ2lvbi5oIgo+ICsjaW5j
bHVkZSAiZ2VtL2k5MTVfZ2VtX2xtZW0uaCIKPiArI2luY2x1ZGUgImdlbS9pOTE1X2dlbV9yZWdp
b24uaCIKPiArI2luY2x1ZGUgImludGVsX3JlZ2lvbl9sbWVtLmgiCj4gKwo+ICtzdGF0aWMgc3Ry
dWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKgo+ICtsbWVtX2NyZWF0ZV9vYmplY3Qoc3RydWN0IGlu
dGVsX21lbW9yeV9yZWdpb24gKm1lbSwKPiArICAgICAgICAgICAgICAgICAgcmVzb3VyY2Vfc2l6
ZV90IHNpemUsCj4gKyAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKPiArewo+
ICsgICAgICAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBtZW0tPmk5MTU7Cj4gKyAg
ICAgICBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqOwo+ICsgICAgICAgdW5zaWduZWQg
aW50IGNhY2hlX2xldmVsOwo+ICsKPiArICAgICAgIGlmIChmbGFncyAmIEk5MTVfQk9fQUxMT0Nf
Q09OVElHVU9VUykKPiArICAgICAgICAgICAgICAgc2l6ZSA9IHJvdW5kdXBfcG93X29mX3R3byhz
aXplKTsKCj8gSSB3b3VsZCBzYXkgdGhhdCBpcyBub3QgeW91ciBkZWNpc2lvbiB0byBtYWtlLiBU
aGUgZmxhZyBzYXlzIHRoYXQgdGhlCmFsbG9jYXRpb24gc2hvdWxkIG9uZSBjb250aWd1b3VzIGJs
b2NrLgoKPiArCj4gKyAgICAgICBpZiAoc2l6ZSA+IEJJVChtZW0tPm1tLm1heF9vcmRlcikgKiBt
ZW0tPm1tLmNodW5rX3NpemUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FMkJJ
Ryk7Cj4gKwo+ICsgICAgICAgb2JqID0gaTkxNV9nZW1fb2JqZWN0X2FsbG9jKCk7Cj4gKyAgICAg
ICBpZiAoIW9iaikKPiArICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4g
Kwo+ICsgICAgICAgZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0KCZpOTE1LT5kcm0sICZvYmot
PmJhc2UsIHNpemUpOwo+ICsgICAgICAgaTkxNV9nZW1fb2JqZWN0X2luaXQob2JqLCAmaTkxNV9n
ZW1fbG1lbV9vYmpfb3BzKTsKPiArCj4gKyAgICAgICBvYmotPnJlYWRfZG9tYWlucyA9IEk5MTVf
R0VNX0RPTUFJTl9DUFUgfCBJOTE1X0dFTV9ET01BSU5fR1RUOwoKSXMgaXQgcmVhbGx5PyBEZXZp
Y2UgbG9jYWwgbWVtb3J5IHN0YXJ0cyBvZmYgaW5zaWRlIHRoZSBDUFUgY2FjaGU/Cgo+ICsgICAg
ICAgY2FjaGVfbGV2ZWwgPSBIQVNfTExDKGk5MTUpID8gSTkxNV9DQUNIRV9MTEMgOiBJOTE1X0NB
Q0hFX05PTkU7CgpUaGlzIHNlZW1zIHRvIGJlIGEgZmFsc2UgZ2VuZXJhbGlzYXRpb24uIFlvdSBz
aG91bGQgYmUgYXNraW5nIHRoZQptZW1vcnkgcmVnaW9uPwoKQmVzaWRlcywgdGhlIGN1cnJlbnQg
dGhpbmtpbmcgaXMgbm90IHRvIG1hcmsgYW55IG9iamVjdCBhcyBjYWNoZWFibGUKdW50aWwgdGhl
IHVzZXIgY29tbWFuZHMgaXQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
