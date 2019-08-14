Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E88DC34
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124AC89CDD;
	Wed, 14 Aug 2019 17:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DC089CDD;
 Wed, 14 Aug 2019 17:48:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18109967-1500050 for multiple; Wed, 14 Aug 2019 18:48:26 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <156580430044.2301.14073232724312766697@skylake-alporthouse-com>
References: <20190807135312.1730-1-christian.koenig@amd.com>
 <20190807135312.1730-4-christian.koenig@amd.com>
 <156518744066.6198.17572013738158664135@skylake-alporthouse-com>
 <ccc20434-0380-c0b8-1ccb-1f7d9ae1a4a5@gmail.com>
 <20190814153908.GI7444@phenom.ffwll.local>
 <156580096818.2714.13643616122908209617@skylake-alporthouse-com>
 <156580237838.2301.9210706924490719639@skylake-alporthouse-com>
 <156580337387.2301.16070325716888990772@skylake-alporthouse-com>
 <156580430044.2301.14073232724312766697@skylake-alporthouse-com>
Message-ID: <156580490488.2301.13016323606611473445@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 4/4] dma-buf: nuke reservation_object seq number
Date: Wed, 14 Aug 2019 18:48:24 +0100
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgtMTQgMTg6Mzg6MjApCj4gUXVvdGluZyBDaHJp
cyBXaWxzb24gKDIwMTktMDgtMTQgMTg6MjI6NTMpCj4gPiBRdW90aW5nIENocmlzIFdpbHNvbiAo
MjAxOS0wOC0xNCAxODowNjoxOCkKPiA+ID4gUXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDgt
MTQgMTc6NDI6NDgpCj4gPiA+ID4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA4LTE0IDE2
OjM5OjA4KQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICB9IHdoaWxlIChyY3VfYWNjZXNzX3BvaW50
ZXIob2JqLT5mZW5jZV9leGNsKSAhPSAqZXhjbCk7Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdoYXQg
aWYgc29tZW9uZSBpcyByZWFsIGZhc3QgKGxpa2UgcmVhbGx5IHJlYWwgZmFzdCkgYW5kIHJlY3lj
bGVzIHRoZQo+ID4gPiA+ID4gZXhjbHVzaXZlIGZlbmNlIHNvIHlvdSByZWFkIHRoZSBzYW1lIHBv
aW50ZXIgdHdpY2UsIGJ1dCBldmVyeXRoaW5nIGVsc2UKPiA+ID4gPiA+IGNoYW5nZWQ/IHJldXNl
ZCBmZW5jZSBwb2ludGVyIGlzIGEgbG90IG1vcmUgbGlrZWx5IHRoYW4gc2VxbG9jayB3cmFwcGlu
Zwo+ID4gPiA+ID4gYXJvdW5kLgo+ID4gPiA+IAo+ID4gPiA+IEl0J3MgYW4gZXhjbHVzaXZlIGZl
bmNlLiBJZiBpdCBpcyByZXBsYWNlZCwgaXQgbXVzdCBiZSBsYXRlciB0aGFuIGFsbAo+ID4gPiA+
IHRoZSBzaGFyZWQgZmVuY2VzIChhbmQgZGVwZW5kZW50IG9uIHRoZW0gZGlyZWN0bHkgb3IgaW5k
aXJlY3RseSksIGFuZAo+ID4gPiA+IHNvIHN0aWxsIGEgY29uc2lzdGVudCBzbmFwc2hvdC4KPiA+
ID4gCj4gPiA+IEFuIGV4dGVuc2lvbiBvZiB0aGF0IGFyZ3VtZW50IHNheXMgd2UgZG9uJ3QgZXZl
biBuZWVkIHRvIGxvb3AsCj4gPiA+IAo+ID4gPiAqbGlzdCA9IHJjdV9kZXJlZmVyZW5jZShvYmot
PmZlbmNlKTsKPiA+ID4gKnNoYXJlZF9jb3VudCA9ICpsaXN0ID8gKCpsaXN0KS0+c2hhcmVkX2Nv
dW50IDogMDsKPiA+ID4gc21wX3JtYigpOwo+ID4gPiAqZXhjbCA9IHJjdV9kZXJlZmVyZW5jZShv
YmotPmZlbmNlX2V4Y2wpOwo+ID4gPiAKPiA+ID4gR2l2ZXMgYSBjb25zaXN0ZW50IHNuYXBzaG90
LiBJdCBkb2Vzbid0IG1hdHRlciBpZiB0aGUgZmVuY2VfZXhjbCBpcwo+ID4gPiBiZWZvcmUgb3Ig
YWZ0ZXIgdGhlIHNoYXJlZF9saXN0IC0tIGlmIGl0J3MgYWZ0ZXIsIGl0J3MgYSBzdXBlcnNldCBv
ZiBhbGwKPiA+ID4gZmVuY2VzLCBpZiBpdCdzIGJlZm9yZSwgd2UgaGF2ZSBhIGNvcnJlY3QgbGlz
dCBvZiBzaGFyZWQgZmVuY2VzIHRoZQo+ID4gPiBlYXJsaWVyIGZlbmNlX2V4Y2wuCj4gPiAKPiA+
IFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIHBvaW50IG9mIHRoZSBsb29wIGlzIHRoYXQgd2UgZG8g
bmVlZCBhIGNoZWNrIG9uCj4gPiB0aGUgZmVuY2VzIGFmdGVyIHRoZSBmdWxsIG1lbW9yeSBiYXJy
aWVyLgo+ID4gCj4gPiBUaGlua2luZyBvZiB0aGUgcmF0aW9uYWxlIGJlYXRlbiBvdXQgZm9yIGRt
YV9mZW5jZV9nZXRfZXhjbF9yY3Vfc2FmZSgpCj4gPiAKPiA+IFdlIGRvbid0IGhhdmUgYSBmdWxs
IG1lbW9yeSBiYXJyaWVyIGhlcmUsIHNvIHRoaXMgY2Fubm90IGJlIHVzZWQgc2FmZWx5Cj4gPiBp
biBsaWdodCBvZiBmZW5jZSByZWFsbG9jYXRpb24uCj4gCj4gaS5lLiB3ZSBuZWVkIHRvIHJlc3Rv
cmUgdGhlIGxvb3BzIGluIHRoZSBjYWxsZXJzLAo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fYnVzeS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX2J1c3kuYwo+IGluZGV4IGEyYWZmMWQ4MjkwZS4uZjAxOTA2MmM4Y2Q3IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9idXN5LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fYnVzeS5jCj4gQEAgLTExMCw2ICsx
MTAsNyBAQCBpOTE1X2dlbV9idXN5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCj4gICAgICAgICAgKiB0byByZXBvcnQgdGhlIG92ZXJhbGwgYnVzeW5lc3MuIFRoaXMg
aXMgd2hhdCB0aGUgd2FpdC1pb2N0bCBkb2VzLgo+ICAgICAgICAgICoKPiAgICAgICAgICAqLwo+
ICtyZXRyeToKPiAgICAgICAgIGRtYV9yZXN2X2ZlbmNlcyhvYmotPmJhc2UucmVzdiwgJmV4Y2ws
ICZsaXN0LCAmc2hhcmVkX2NvdW50KTsKPiAKPiAgICAgICAgIC8qIFRyYW5zbGF0ZSB0aGUgZXhj
bHVzaXZlIGZlbmNlIHRvIHRoZSBSRUFEICphbmQqIFdSSVRFIGVuZ2luZSAqLwo+IEBAIC0xMjIs
NiArMTIzLDEwIEBAIGk5MTVfZ2VtX2J1c3lfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKPiAgICAgICAgICAgICAgICAgYXJncy0+YnVzeSB8PSBidXN5X2NoZWNrX3Jl
YWRlcihmZW5jZSk7Cj4gICAgICAgICB9Cj4gCj4gKyAgICAgICBzbXBfcm1iKCk7Cj4gKyAgICAg
ICBpZiAoZXhjbCAhPSByY3VfYWNjZXNzX3BvaW50ZXIob2JqLT5iYXNlLnJlc3YtPmZlbmNlX2V4
Y2wpKQo+ICsgICAgICAgICAgICAgICBnb3RvIHJldHJ5Owo+ICsKPiAKPiB3cmFwIHRoYXQgdXAg
YXMKPiAKPiBzdGF0aWMgaW5saW5lIGJvb2wKPiBkbWFfcmVzdl9mZW5jZXNfcmV0cnkoc3RydWN0
IGRtYV9yZXN2ICpyZXN2LCBzdHJ1Y3QgZG1hX2ZlbmNlICpleGNsKQo+IHsKPiAgICAgICAgIHNt
cF9ybWIoKTsKPiAgICAgICAgIHJldHVybiBleGNsICE9IHJjdV9hY2Nlc3NfcG9pbnRlcihyZXN2
LT5mZW5jZV9leGNsKTsKPiB9CgpJIGdpdmUgdXAuIEl0J3Mgbm90IGp1c3QgdGhlIGZlbmNlX2V4
Y2wgdGhhdCdzIGFuIGlzc3VlIGhlcmUuCgpBbnkgb2YgdGhlIHNoYXJlZCBmZW5jZXMgbWF5IGJl
IHJlcGxhY2VkIGFmdGVyIGRtYV9yZXN2X2ZlbmNlcygpCmFuZCBzbyB0aGUgb3JpZ2luYWwgc2hh
cmVkIGZlbmNlIHBvaW50ZXIgbWF5IGJlIHJlYXNzaWduZWQgKGV2ZW4gdW5kZXIKUkNVKS4gVGhl
IG9ubHkgZGVmZW5zZSBhZ2FpbnN0IHRoYXQgaXMgdGhlIHNlcWNvdW50LgoKSSB0b3RhbGx5IHNj
cmV3ZWQgdGhhdCB1cC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
