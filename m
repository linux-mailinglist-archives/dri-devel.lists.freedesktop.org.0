Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3929D8DD8F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4340E6E7FA;
	Wed, 14 Aug 2019 18:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E8E6E7F5;
 Wed, 14 Aug 2019 18:52:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18114734-1500050 for multiple; Wed, 14 Aug 2019 19:52:22 +0100
MIME-Version: 1.0
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <a15411cd-6ba6-5942-5d96-adb3edad8e0d@amd.com>
References: <20190807135312.1730-1-christian.koenig@amd.com>
 <156518744066.6198.17572013738158664135@skylake-alporthouse-com>
 <ccc20434-0380-c0b8-1ccb-1f7d9ae1a4a5@gmail.com>
 <20190814153908.GI7444@phenom.ffwll.local>
 <156580096818.2714.13643616122908209617@skylake-alporthouse-com>
 <156580237838.2301.9210706924490719639@skylake-alporthouse-com>
 <156580337387.2301.16070325716888990772@skylake-alporthouse-com>
 <156580430044.2301.14073232724312766697@skylake-alporthouse-com>
 <156580490488.2301.13016323606611473445@skylake-alporthouse-com>
 <a15411cd-6ba6-5942-5d96-adb3edad8e0d@amd.com>
Message-ID: <156580874005.2301.1176884022684127140@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 4/4] dma-buf: nuke reservation_object seq number
Date: Wed, 14 Aug 2019 19:52:20 +0100
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBLb2VuaWcsIENocmlzdGlhbiAoMjAxOS0wOC0xNCAxODo1ODozMikKPiBBbSAxNC4w
OC4xOSB1bSAxOTo0OCBzY2hyaWViIENocmlzIFdpbHNvbjoKPiA+IFF1b3RpbmcgQ2hyaXMgV2ls
c29uICgyMDE5LTA4LTE0IDE4OjM4OjIwKQo+ID4+IFF1b3RpbmcgQ2hyaXMgV2lsc29uICgyMDE5
LTA4LTE0IDE4OjIyOjUzKQo+ID4+PiBRdW90aW5nIENocmlzIFdpbHNvbiAoMjAxOS0wOC0xNCAx
ODowNjoxOCkKPiA+Pj4+IFF1b3RpbmcgQ2hyaXMgV2lsc29uICgyMDE5LTA4LTE0IDE3OjQyOjQ4
KQo+ID4+Pj4+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wOC0xNCAxNjozOTowOCkKPiA+
Pj4+Pj4+Pj4gKyAgICAgICB9IHdoaWxlIChyY3VfYWNjZXNzX3BvaW50ZXIob2JqLT5mZW5jZV9l
eGNsKSAhPSAqZXhjbCk7Cj4gPj4+Pj4+IFdoYXQgaWYgc29tZW9uZSBpcyByZWFsIGZhc3QgKGxp
a2UgcmVhbGx5IHJlYWwgZmFzdCkgYW5kIHJlY3ljbGVzIHRoZQo+ID4+Pj4+PiBleGNsdXNpdmUg
ZmVuY2Ugc28geW91IHJlYWQgdGhlIHNhbWUgcG9pbnRlciB0d2ljZSwgYnV0IGV2ZXJ5dGhpbmcg
ZWxzZQo+ID4+Pj4+PiBjaGFuZ2VkPyByZXVzZWQgZmVuY2UgcG9pbnRlciBpcyBhIGxvdCBtb3Jl
IGxpa2VseSB0aGFuIHNlcWxvY2sgd3JhcHBpbmcKPiA+Pj4+Pj4gYXJvdW5kLgo+ID4+Pj4+IEl0
J3MgYW4gZXhjbHVzaXZlIGZlbmNlLiBJZiBpdCBpcyByZXBsYWNlZCwgaXQgbXVzdCBiZSBsYXRl
ciB0aGFuIGFsbAo+ID4+Pj4+IHRoZSBzaGFyZWQgZmVuY2VzIChhbmQgZGVwZW5kZW50IG9uIHRo
ZW0gZGlyZWN0bHkgb3IgaW5kaXJlY3RseSksIGFuZAo+ID4+Pj4+IHNvIHN0aWxsIGEgY29uc2lz
dGVudCBzbmFwc2hvdC4KPiA+Pj4+IEFuIGV4dGVuc2lvbiBvZiB0aGF0IGFyZ3VtZW50IHNheXMg
d2UgZG9uJ3QgZXZlbiBuZWVkIHRvIGxvb3AsCj4gPj4+Pgo+ID4+Pj4gKmxpc3QgPSByY3VfZGVy
ZWZlcmVuY2Uob2JqLT5mZW5jZSk7Cj4gPj4+PiAqc2hhcmVkX2NvdW50ID0gKmxpc3QgPyAoKmxp
c3QpLT5zaGFyZWRfY291bnQgOiAwOwo+ID4+Pj4gc21wX3JtYigpOwo+ID4+Pj4gKmV4Y2wgPSBy
Y3VfZGVyZWZlcmVuY2Uob2JqLT5mZW5jZV9leGNsKTsKPiA+Pj4+Cj4gPj4+PiBHaXZlcyBhIGNv
bnNpc3RlbnQgc25hcHNob3QuIEl0IGRvZXNuJ3QgbWF0dGVyIGlmIHRoZSBmZW5jZV9leGNsIGlz
Cj4gPj4+PiBiZWZvcmUgb3IgYWZ0ZXIgdGhlIHNoYXJlZF9saXN0IC0tIGlmIGl0J3MgYWZ0ZXIs
IGl0J3MgYSBzdXBlcnNldCBvZiBhbGwKPiA+Pj4+IGZlbmNlcywgaWYgaXQncyBiZWZvcmUsIHdl
IGhhdmUgYSBjb3JyZWN0IGxpc3Qgb2Ygc2hhcmVkIGZlbmNlcyB0aGUKPiA+Pj4+IGVhcmxpZXIg
ZmVuY2VfZXhjbC4KPiA+Pj4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgcG9pbnQgb2YgdGhlIGxv
b3AgaXMgdGhhdCB3ZSBkbyBuZWVkIGEgY2hlY2sgb24KPiA+Pj4gdGhlIGZlbmNlcyBhZnRlciB0
aGUgZnVsbCBtZW1vcnkgYmFycmllci4KPiA+Pj4KPiA+Pj4gVGhpbmtpbmcgb2YgdGhlIHJhdGlv
bmFsZSBiZWF0ZW4gb3V0IGZvciBkbWFfZmVuY2VfZ2V0X2V4Y2xfcmN1X3NhZmUoKQo+ID4+Pgo+
ID4+PiBXZSBkb24ndCBoYXZlIGEgZnVsbCBtZW1vcnkgYmFycmllciBoZXJlLCBzbyB0aGlzIGNh
bm5vdCBiZSB1c2VkIHNhZmVseQo+ID4+PiBpbiBsaWdodCBvZiBmZW5jZSByZWFsbG9jYXRpb24u
Cj4gPj4gaS5lLiB3ZSBuZWVkIHRvIHJlc3RvcmUgdGhlIGxvb3BzIGluIHRoZSBjYWxsZXJzLAo+
ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9i
dXN5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fYnVzeS5jCj4gPj4gaW5k
ZXggYTJhZmYxZDgyOTBlLi5mMDE5MDYyYzhjZDcgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2J1c3kuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9idXN5LmMKPiA+PiBAQCAtMTEwLDYgKzExMCw3IEBAIGk5MTVf
Z2VtX2J1c3lfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+PiAg
ICAgICAgICAgKiB0byByZXBvcnQgdGhlIG92ZXJhbGwgYnVzeW5lc3MuIFRoaXMgaXMgd2hhdCB0
aGUgd2FpdC1pb2N0bCBkb2VzLgo+ID4+ICAgICAgICAgICAqCj4gPj4gICAgICAgICAgICovCj4g
Pj4gK3JldHJ5Ogo+ID4+ICAgICAgICAgIGRtYV9yZXN2X2ZlbmNlcyhvYmotPmJhc2UucmVzdiwg
JmV4Y2wsICZsaXN0LCAmc2hhcmVkX2NvdW50KTsKPiA+Pgo+ID4+ICAgICAgICAgIC8qIFRyYW5z
bGF0ZSB0aGUgZXhjbHVzaXZlIGZlbmNlIHRvIHRoZSBSRUFEICphbmQqIFdSSVRFIGVuZ2luZSAq
Lwo+ID4+IEBAIC0xMjIsNiArMTIzLDEwIEBAIGk5MTVfZ2VtX2J1c3lfaW9jdGwoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+PiAgICAgICAgICAgICAgICAgIGFyZ3MtPmJ1
c3kgfD0gYnVzeV9jaGVja19yZWFkZXIoZmVuY2UpOwo+ID4+ICAgICAgICAgIH0KPiA+Pgo+ID4+
ICsgICAgICAgc21wX3JtYigpOwo+ID4+ICsgICAgICAgaWYgKGV4Y2wgIT0gcmN1X2FjY2Vzc19w
b2ludGVyKG9iai0+YmFzZS5yZXN2LT5mZW5jZV9leGNsKSkKPiA+PiArICAgICAgICAgICAgICAg
Z290byByZXRyeTsKPiA+PiArCj4gPj4KPiA+PiB3cmFwIHRoYXQgdXAgYXMKPiA+Pgo+ID4+IHN0
YXRpYyBpbmxpbmUgYm9vbAo+ID4+IGRtYV9yZXN2X2ZlbmNlc19yZXRyeShzdHJ1Y3QgZG1hX3Jl
c3YgKnJlc3YsIHN0cnVjdCBkbWFfZmVuY2UgKmV4Y2wpCj4gPj4gewo+ID4+ICAgICAgICAgIHNt
cF9ybWIoKTsKPiA+PiAgICAgICAgICByZXR1cm4gZXhjbCAhPSByY3VfYWNjZXNzX3BvaW50ZXIo
cmVzdi0+ZmVuY2VfZXhjbCk7Cj4gPj4gfQo+ID4gSSBnaXZlIHVwLiBJdCdzIG5vdCBqdXN0IHRo
ZSBmZW5jZV9leGNsIHRoYXQncyBhbiBpc3N1ZSBoZXJlLgo+ID4KPiA+IEFueSBvZiB0aGUgc2hh
cmVkIGZlbmNlcyBtYXkgYmUgcmVwbGFjZWQgYWZ0ZXIgZG1hX3Jlc3ZfZmVuY2VzKCkKPiA+IGFu
ZCBzbyB0aGUgb3JpZ2luYWwgc2hhcmVkIGZlbmNlIHBvaW50ZXIgbWF5IGJlIHJlYXNzaWduZWQg
KGV2ZW4gdW5kZXIKPiA+IFJDVSkuCj4gCj4gWWVhaCwgYnV0IHRoaXMgc2hvdWxkIGJlIGhhcm1s
ZXNzLiBTZWUgZmVuY2VzIGFyZSBhbHdheXMgcmVwbGFjZWQgZWl0aGVyIAo+IHdoZW4gdGhleSBh
cmUgc2lnbmFsZWQgYW55d2F5IG9yIGJ5IGxhdGVyIGZlbmNlcyBmcm9tIHRoZSBzYW1lIGNvbnRl
eHQuCj4gCj4gQW5kIGV4aXN0aW5nIGZlbmNlcyBzaG91bGRuJ3QgYmUgcmUtdXNlZCB3aGlsZSB1
bmRlciBSQ1UsIG9yIGlzIGFueWJvZHkgCj4gc3RpbGwgdXNpbmcgU0xBQl9UWVBFU0FGRV9CWV9S
Q1U/CgpZZXMuIFdlIGdvIHRocm91Z2ggZW5vdWdoIGZlbmNlcyB0aGF0IHRoZSBmcmVlbGlzdCBp
cyBhIG5vdGljZWFibGUKaW1wcm92ZW1lbnQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
