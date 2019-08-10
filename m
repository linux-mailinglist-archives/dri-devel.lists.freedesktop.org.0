Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F408B88AC7
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 12:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF396E2C8;
	Sat, 10 Aug 2019 10:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886596E2C0;
 Sat, 10 Aug 2019 10:28:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17952157-1500050 for multiple; Sat, 10 Aug 2019 11:28:34 +0100
MIME-Version: 1.0
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809222643.23142-7-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <20190809222643.23142-7-matthew.auld@intel.com>
Message-ID: <156543291193.2301.8287408833186233651@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v3 06/37] drm/i915: Add memory region information to
 device_info
Date: Sat, 10 Aug 2019 11:28:31 +0100
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

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMTktMDgtMDkgMjM6MjY6MTIpCj4gRnJvbTogQWJkaWVs
IEphbnVsZ3VlIDxhYmRpZWwuamFudWxndWVAbGludXguaW50ZWwuY29tPgo+IAo+IEV4cG9zZXMg
YXZhaWxhYmxlIHJlZ2lvbnMgZm9yIHRoZSBwbGF0Zm9ybS4gU2hhcmVkIG1lbW9yeSB3aWxsCj4g
YWx3YXlzIGJlIGF2YWlsYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBYmRpZWwgSmFudWxndWUg
PGFiZGllbC5qYW51bGd1ZUBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhl
dyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2Rydi5oICAgICAgICAgIHwgMiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9kZXZpY2VfaW5mby5oIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaAo+IGluZGV4IDM5Y2RmNGVhYzJhNi4uZDk0
N2Y3NDE1ODYxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCj4gQEAgLTIyMTIsNiArMjIx
Miw4IEBAIElTX1NVQlBMQVRGT1JNKGNvbnN0IHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1
LAo+ICAKPiAgI2RlZmluZSBIQVNfSVBDKGRldl9wcml2KSAgICAgICAgICAgICAgIChJTlRFTF9J
TkZPKGRldl9wcml2KS0+ZGlzcGxheS5oYXNfaXBjKQo+ICAKPiArI2RlZmluZSBIQVNfUkVHSU9O
KGk5MTUsIGkpIChJTlRFTF9JTkZPKGk5MTUpLT5tZW1vcnlfcmVnaW9ucyAmIChpKSkKPiArCj4g
ICNkZWZpbmUgSEFTX0dUX1VDKGRldl9wcml2KSAgICAoSU5URUxfSU5GTyhkZXZfcHJpdiktPmhh
c19ndF91YykKPiAgCj4gIC8qIEhhdmluZyBHdUMgaXMgbm90IHRoZSBzYW1lIGFzIHVzaW5nIEd1
QyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kZXZpY2VfaW5m
by5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGV2aWNlX2luZm8uaAo+IGluZGV4IDky
ZTBjMmUwOTU0Yy4uMzE2NmYzODkxMGY3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2ludGVsX2RldmljZV9pbmZvLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRl
bF9kZXZpY2VfaW5mby5oCj4gQEAgLTE1OSw2ICsxNTksOCBAQCBzdHJ1Y3QgaW50ZWxfZGV2aWNl
X2luZm8gewo+ICAKPiAgICAgICAgIHVuc2lnbmVkIGludCBwYWdlX3NpemVzOyAvKiBwYWdlIHNp
emVzIHN1cHBvcnRlZCBieSB0aGUgSFcgKi8KPiAgCj4gKyAgICAgICB1MzIgbWVtb3J5X3JlZ2lv
bnM7IC8qIHJlZ2lvbnMgc3VwcG9ydGVkIGJ5IHRoZSBIVyAqLwo+ICsKPiAgICAgICAgIHUzMiBk
aXNwbGF5X21taW9fb2Zmc2V0Owo+ICAKPiAgICAgICAgIHU4IG51bV9waXBlczsKCklmIHNoYXJl
ZCBtZW1vcnkgaXMgYWx3YXlzIGF2YWlsYWJsZSwgd2h5IGlzIGl0IGFic2VudD8KCkRvIHlvdSBw
bGFuIHRvIGRpc3Rpbmd1aXNoIHNjcnViYmVkIGFuZCB6ZXJvZWQgc3lzdGVtIHBhZ2VzLCBwcml2
YXRlCnBvb2xzIHRvIHRoZSBwcm9jZXNzIGV0Yz8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
