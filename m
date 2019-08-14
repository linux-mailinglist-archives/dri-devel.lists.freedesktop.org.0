Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025948DAC1
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F906E78C;
	Wed, 14 Aug 2019 17:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453366E78C;
 Wed, 14 Aug 2019 17:20:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18107812-1500050 for multiple; Wed, 14 Aug 2019 18:20:29 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190814170625.GK7444@phenom.ffwll.local>
References: <20190807135312.1730-1-christian.koenig@amd.com>
 <20190807135312.1730-4-christian.koenig@amd.com>
 <156518744066.6198.17572013738158664135@skylake-alporthouse-com>
 <ccc20434-0380-c0b8-1ccb-1f7d9ae1a4a5@gmail.com>
 <20190814153908.GI7444@phenom.ffwll.local>
 <156580096818.2714.13643616122908209617@skylake-alporthouse-com>
 <20190814170625.GK7444@phenom.ffwll.local>
Message-ID: <156580322834.2301.14370001730544642496@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 4/4] dma-buf: nuke reservation_object seq number
Date: Wed, 14 Aug 2019 18:20:28 +0100
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA4LTE0IDE4OjA2OjI2KQo+IE9uIFdlZCwgQXVn
IDE0LCAyMDE5IGF0IDA1OjQyOjQ4UE0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1
b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wOC0xNCAxNjozOTowOCkKW3NuaXBdCj4gPiA+ID4g
PiA+ICAgICAgICAgIGlmIChvbGQpCj4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBvbGQtPnNo
YXJlZF9jb3VudCA9IDA7Cj4gPiA+ID4gPiA+IC0gICAgICAgd3JpdGVfc2VxY291bnRfZW5kKCZv
YmotPnNlcSk7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBzbXBfc3RvcmVfbWIob2xkLT5z
aGFyZWRfY291bnQsIDApOwo+ID4gPiAKPiA+ID4gU28geW91ciBjb21tZW50IGFuZCB0aGUga2Vy
bmVsZG9jIGRvbid0IG1hdGNoIHVwLiBRdW90aW5nCj4gPiA+IERvY3VtZW50YXRpb24vbWVtb3J5
LWJhcnJpZXJzLnR4dDoKPiA+ID4gCj4gPiA+ICAgICAgVGhpcyBhc3NpZ25zIHRoZSB2YWx1ZSB0
byB0aGUgdmFyaWFibGUgYW5kIHRoZW4gaW5zZXJ0cyBhIGZ1bGwgbWVtb3J5Cj4gPiA+ICAgICAg
YmFycmllciBhZnRlciBpdC4gIEl0IGlzbid0IGd1YXJhbnRlZWQgdG8gaW5zZXJ0IGFueXRoaW5n
IG1vcmUgdGhhbiBhCj4gPiA+ICAgICAgY29tcGlsZXIgYmFycmllciBpbiBhIFVQIGNvbXBpbGF0
aW9uLgo+ID4gPiAKPiA+ID4gU28gb3JkZXIgaXMgMS4gc3RvcmUgMi4gZmVuY2UsIGJ1dCB5b3Vy
IGNvbW1lbnQgc3VnZ2VzdHMgeW91IHdhbnQgaXQgdGhlCj4gPiA+IG90aGVyIHdheSByb3VuZC4K
PiA+IAo+ID4gV2hhdCdzIG1vcmUgd2VpcmQgaXMgdGhhdCBpdCBpcyBhIGZ1bGx5IHNlcmlhbGlz
aW5nIGluc3RydWN0aW9uIHRoYXQgaXMKPiA+IHVzZWQgdG8gZmVuY2UgZmlyc3QgYXMgcGFydCBv
ZiB0aGUgdXBkYXRlLiBJZiB0aGF0J3Mgd2F5IFBldGVyWiB1c2VzCj4gPiBpdC4uLgo+IAo+IEkg
aGF2ZW4ndCBsb29rZWQgYXQgdGhlIGltcGxlbWVudGF0aW9ucyB0YmgsIGp1c3QgZ29pbmcgd2l0
aCB0aGUgdGV4dC4gT3IKPiBkbyB5b3UgbWVhbiBpbiB0aGUgd3JpdGVfc2VxbG9jayB0aGF0IHdl
J3JlIHJlcGxhY2luZz8KCk5haCwgSSBtaXNyZW1lbWJlcmVkIHNldF9jdXJyZW50X3N0YXRlKCks
IGFsbCB0aGF0IGltcGxpZXMgaXMgdGhlIGZlbmNlCmlzIGJlZm9yZSB0aGUgZm9sbG93aW5nIGlu
c3RydWN0aW9ucy4gSSBoYXZlIHNvbWUgcmVjb2xsZWN0aW9uIHRoYXQgaXQKY2FuIGJlIHVzZWQg
YXMgYSBSRUxFQVNFIG9wZXJhdGlvbiAoaWYgb25seSBiZWNhdXNlIGl0IGlzIGEgbG9ja2VkIHhj
aGcpLgpJZiBhbGwgZWxzZSBmYWlscywgbWFrZSBpdCBhbiB4Y2hnX3JlbGVhc2UoKS4gT3Igbm9y
bWFsIGFzc2lnbm1lbnQgKwpzbXBfd21iKCkuCgo+ID4gSXQncyBhbiBleGNsdXNpdmUgZmVuY2Uu
IElmIGl0IGlzIHJlcGxhY2VkLCBpdCBtdXN0IGJlIGxhdGVyIHRoYW4gYWxsCj4gPiB0aGUgc2hh
cmVkIGZlbmNlcyAoYW5kIGRlcGVuZGVudCBvbiB0aGVtIGRpcmVjdGx5IG9yIGluZGlyZWN0bHkp
LCBhbmQKPiA+IHNvIHN0aWxsIGEgY29uc2lzdGVudCBzbmFwc2hvdC4KPiAKPiBJJ20gbm90IHdv
cnJpZWQgYWJvdXQgdGhlIGZlbmNlLCB0aGF0IHBhcnQgaXMgZmluZS4gQnV0IHdlJ3JlIGRlZmFj
dG8KPiB1c2luZyB0aGUgZmVuY2UgYXMgYSBmYW5jeSBzZXFsb2NrLW9mLXNvcnRzLiBBbmQgaWYg
dGhlIGZlbmNlIGdldHMgcmV1c2VkCj4gYW5kIHRoZSBwb2ludGVycyBtYXRjaCwgdGhlbiBvdXIg
c2VxbG9jay1vZi1zb3J0cyBicmVha3MuIEJ1dCBJIGhhdmVuJ3QKPiBsb29rZWQgYXJvdW5kIHdo
ZXRoZXIgdGhlcmUncyBtb3JlIGluIHRoZSBjb2RlIHRoYXQgbWFrZXMgdGhpcyBhbgo+IGlycmVs
ZXZhbnQgaXNzdWUuCgpObywgaXQgc2hvdWxkIG5vdCBicmVhayBpZiB3ZSByZXBsYWNlIHRoZSBm
ZW5jZSB3aXRoIHRoZSBzYW1lIHBvaW50ZXIuCklmIHRoZSBmZW5jZSBwb2ludGVyIGV4cGlyZXMs
IHJldXNlZCBhbmQgYXNzaWduZWQgYmFjayBhcyB0aGUgZXhjbF9mZW5jZQotLSBpdCBpcyBzdGls
bCB0aGUgZXhjbF9mZW5jZSBhbmQgYnkgdGhlIHByb3BlcnRpZXMgb2YgdGhhdApleGNsX2ZlbmNl
IGNvbnN0cnVjdGlvbiwgaXQgaXMgbGF0ZXIgdGhhbiB0aGUgc2hhcmVkX2ZlbmNlcy4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
