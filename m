Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7D2C66D1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 14:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899F46EDB4;
	Fri, 27 Nov 2020 13:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981A96EDB3;
 Fri, 27 Nov 2020 13:27:59 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23133343-1500050 for multiple; Fri, 27 Nov 2020 13:27:55 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-94-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-94-matthew.auld@intel.com>
Subject: Re: [RFC PATCH 093/162] drm/i915/lmem: allocate cmd ring in lmem
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 13:27:55 +0000
Message-ID: <160648367563.2925.13388788354107103536@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Michel Thierry <michel.thierry@intel.com>,
 Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMjAtMTEtMjcgMTI6MDY6MDkpCj4gRnJvbTogTWljaGVs
IFRoaWVycnkgPG1pY2hlbC50aGllcnJ5QGludGVsLmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBN
aWNoZWwgVGhpZXJyeSA8bWljaGVsLnRoaWVycnlAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KPiBDYzogSm9vbmFzIExhaHRp
bmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgo+IENjOiBBYmRpZWwgSmFudWxn
dWUgPGFiZGllbC5qYW51bGd1ZUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX3JpbmcuYyB8IDE1ICsrKysrKysrKysrLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmluZy5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvaW50ZWxfcmluZy5jCj4gaW5kZXggZDYzNmM2ZWQ4OGI3Li5hYTc1ZTY0NGYzZjIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmluZy5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmluZy5jCj4gQEAgLTQsNiArNCw3IEBA
Cj4gICAqIENvcHlyaWdodCDCqSAyMDE5IEludGVsIENvcnBvcmF0aW9uCj4gICAqLwo+ICAKPiAr
I2luY2x1ZGUgImdlbS9pOTE1X2dlbV9sbWVtLmgiCj4gICNpbmNsdWRlICJnZW0vaTkxNV9nZW1f
b2JqZWN0LmgiCj4gICNpbmNsdWRlICJpOTE1X2Rydi5oIgo+ICAjaW5jbHVkZSAiaTkxNV92bWEu
aCIKPiBAQCAtMTExLDEwICsxMTIsMTYgQEAgc3RhdGljIHN0cnVjdCBpOTE1X3ZtYSAqY3JlYXRl
X3Jpbmdfdm1hKHN0cnVjdCBpOTE1X2dndHQgKmdndHQsIGludCBzaXplKQo+ICAgICAgICAgc3Ry
dWN0IGk5MTVfdm1hICp2bWE7Cj4gIAo+ICAgICAgICAgb2JqID0gRVJSX1BUUigtRU5PREVWKTsK
PiAtICAgICAgIGlmIChpOTE1X2dndHRfaGFzX2FwZXJ0dXJlKGdndHQpKQo+IC0gICAgICAgICAg
ICAgICBvYmogPSBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX3N0b2xlbihpOTE1LCBzaXplKTsKPiAt
ICAgICAgIGlmIChJU19FUlIob2JqKSkKPiAtICAgICAgICAgICAgICAgb2JqID0gaTkxNV9nZW1f
b2JqZWN0X2NyZWF0ZV9pbnRlcm5hbChpOTE1LCBzaXplKTsKPiArICAgICAgIGlmIChIQVNfTE1F
TShpOTE1KSkgewo+ICsgICAgICAgICAgICAgICBvYmogPSBpOTE1X2dlbV9vYmplY3RfY3JlYXRl
X2xtZW0oaTkxNSwgc2l6ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEk5MTVfQk9fQUxMT0NfQ09OVElHVU9VUyB8Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJOTE1X0JPX0FMTE9DX1ZPTEFUSUxF
KTsKCkp1c3QgY3JlYXRlLCBhbmQga2VlcCB0cnlpbmcgd2hlbiAhbG1lbSByZXR1cm5zIGFuIGVy
cm9yLgoKV2h5IGNvbnRpZ3VvdXMsIGl0J3Mgdm1hcHBlZCBhbnl3YXk/Cgo+ICsgICAgICAgfSBl
bHNlIHsKPiArICAgICAgICAgICAgICAgaWYgKGk5MTVfZ2d0dF9oYXNfYXBlcnR1cmUoZ2d0dCkp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgb2JqID0gaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9z
dG9sZW4oaTkxNSwgc2l6ZSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChJU19FUlIob2JqKSkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBvYmogPSBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX2ludGVy
bmFsKGk5MTUsIHNpemUpOwo+ICsgICAgICAgfQo+ICAgICAgICAgaWYgKElTX0VSUihvYmopKQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gRVJSX0NBU1Qob2JqKTsKPiAgCj4gLS0gCj4gMi4yNi4y
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
