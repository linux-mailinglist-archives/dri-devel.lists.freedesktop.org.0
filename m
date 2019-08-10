Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F72E88B0E
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 13:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE106E3B7;
	Sat, 10 Aug 2019 11:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B436E3B5;
 Sat, 10 Aug 2019 11:38:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17952692-1500050 for multiple; Sat, 10 Aug 2019 12:38:54 +0100
MIME-Version: 1.0
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809222643.23142-33-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <20190809222643.23142-33-matthew.auld@intel.com>
Message-ID: <156543713224.2301.8512675615268137019@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v3 32/37] drm/i915: Add cpu and lmem fault handlers
Date: Sat, 10 Aug 2019 12:38:52 +0100
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMTktMDgtMDkgMjM6MjY6MzgpCj4gLXZvaWQgX19pOTE1
X2dlbV9vYmplY3RfcmVsZWFzZV9tbWFwKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmop
Cj4gK3N0YXRpYyB2bV9mYXVsdF90IGk5MTVfZ2VtX2ZhdWx0X2NwdShzdHJ1Y3Qgdm1fZmF1bHQg
KnZtZikKPiArewo+ICsgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICphcmVhID0gdm1mLT52
bWE7Cj4gKyAgICAgICBzdHJ1Y3QgaTkxNV9tbWFwX29mZnNldCAqcHJpdiA9IGFyZWEtPnZtX3By
aXZhdGVfZGF0YTsKPiArICAgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBw
cml2LT5vYmo7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gb2JqLT5iYXNlLmRl
djsKPiArICAgICAgIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUo
ZGV2KTsKPiArICAgICAgIHZtX2ZhdWx0X3Qgdm1mX3JldDsKPiArICAgICAgIHVuc2lnbmVkIGxv
bmcgc2l6ZSA9IGFyZWEtPnZtX2VuZCAtIGFyZWEtPnZtX3N0YXJ0Owo+ICsgICAgICAgYm9vbCB3
cml0ZSA9IGFyZWEtPnZtX2ZsYWdzICYgVk1fV1JJVEU7Cj4gKyAgICAgICBpbnQgaSwgcmV0Owo+
ICsKPiArICAgICAgIC8qIFNhbml0eSBjaGVjayB0aGF0IHdlIGFsbG93IHdyaXRpbmcgaW50byB0
aGlzIG9iamVjdCAqLwo+ICsgICAgICAgaWYgKGk5MTVfZ2VtX29iamVjdF9pc19yZWFkb25seShv
YmopICYmIHdyaXRlKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+
ICsKPiArICAgICAgIHJldCA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXMob2JqKTsKaWYgKGVy
cikKCXJldHVybiBpOTE1X2Vycm9yX3RvX3ZtZl9mYXVsdChlcnIpOwoKPiArICAgICAgICAgICAg
ICAgZ290byBlcnI7Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IHNpemUgPj4gUEFHRV9T
SElGVDsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlICpwYWdlID0gaTkxNV9n
ZW1fb2JqZWN0X2dldF9wYWdlKG9iaiwgaSk7Cj4gKyAgICAgICAgICAgICAgIHZtZl9yZXQgPSB2
bWZfaW5zZXJ0X3BmbihhcmVhLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHVuc2lnbmVkIGxvbmcpYXJlYS0+dm1fc3RhcnQgKyBpICogUEFHRV9TSVpFLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV90b19wZm4ocGFnZSkp
Owo+ICsgICAgICAgICAgICAgICBpZiAodm1mX3JldCAmIFZNX0ZBVUxUX0VSUk9SKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gdm1fZmF1bHRfdG9fZXJybm8odm1mX3JldCwgMCk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIH0KPiAr
ICAgICAgIH0KPiArCj4gKyAgICAgICBpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsK
CnJldHVybiB2bWZfcmV0OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
