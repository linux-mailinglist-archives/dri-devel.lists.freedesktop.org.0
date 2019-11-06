Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAD2F1439
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1D46ECC2;
	Wed,  6 Nov 2019 10:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83766ECC1;
 Wed,  6 Nov 2019 10:45:21 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19099898-1500050 for multiple; Wed, 06 Nov 2019 10:45:19 +0000
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191106102157.GF23790@phenom.ffwll.local>
References: <20191106100716.18181-1-chris@chris-wilson.co.uk>
 <20191106100716.18181-3-chris@chris-wilson.co.uk>
 <20191106102157.GF23790@phenom.ffwll.local>
Message-ID: <157303711710.24928.18026997375656120508@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 3/3] drm/prime: Use anon_drm_getfile() for an internal drm
 struct file
Date: Wed, 06 Nov 2019 10:45:17 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTExLTA2IDEwOjIxOjU3KQo+IE9uIFdlZCwgTm92
IDA2LCAyMDE5IGF0IDEwOjA3OjE2QU0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IEN1
cnJlbnRseSB0aGUgZHJtX3ByaW1lIG1tYXAgZmFsbGJhY2sgdXNlcyBhIG1vY2sgc3RydWN0IGZp
bGUgdG8gcHJvdmlkZQo+ID4gdGhlIGZpbGUgcG9pbnRlciBpbnRvIHRoZSBiYWNrZW5kIG1tYXAg
cm91dGluZS4gTm93IHRoYXQgd2UgY2FuIGNyZWF0ZQo+ID4gZnVsbHkgZmxlZGdlZCBhbm9ueW1v
dXMgc3RydWN0IGZpbGUgYXJvdW5kIHRoZSBkcm0gZGV2aWNlLCBwdXQgaXQgdG8KPiA+IHVzZS4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgfCAyNiArKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPiBpbmRleCAwODE0
MjExYjBmM2YuLjVmYWE2MzcxM2VjOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJpbWUuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPiBAQCAt
NzA5LDggKzcwOSw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX2dlbV9kbWFidWZfdnVubWFwKTsKPiA+
ICAgKi8KPiA+ICBpbnQgZHJtX2dlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+ICB7Cj4gPiAtICAgICBzdHJ1Y3Qg
ZHJtX2ZpbGUgKnByaXY7Cj4gPiAtICAgICBzdHJ1Y3QgZmlsZSAqZmlsOwo+ID4gKyAgICAgc3Ry
dWN0IGZpbGUgKmZpbGU7Cj4gPiAgICAgICBpbnQgcmV0Owo+ID4gIAo+ID4gICAgICAgaWYgKG9i
ai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+bW1hcCkgewo+IAo+IG9iai0+ZnVuY3MtPm1tYXAgaXMg
dGhlIG5ldyB3YXkgb2YgZG9pbmcgdGhpcyAoYW5kIGhvcGVmdWxseSBmaW5hbGx5Cj4gc29tZXRo
aW5nIGNsZWFuKSwgSSdkIHJlYWxseSBsaWtlIHRvIHJldGlyZSB0aGUgYmVsb3cgaGFjayBvdXRy
aWdodC4KPiAKPiBQbHVzIEknbSBub3Qgc3VyZSB3aHkgeW91IG5lZWQgYW4gYW5vbiBpbm9kZSBo
ZXJlPyBJZiBhIGRyaXZlciBuZWVkcyB0aGlzCj4gZm9yIHVubWFwX21hcHBpbmdfcmFuZ2Ugb3Ig
c2ltaWxhciBJIHRoaW5rIGl0J2QgYmUgYmV0dGVyIHRvIHRyeSBhbmQgbWFrZQo+IHNvbWV0aGlu
ZyB3b3JrIGNsZWFubHkgZm9yIG9iai0+ZnVuY3MtPm1tYXAuCgpJdCdzIGZha2luZyBvbmUgY3Vy
cmVudGx5LiBJZiB0aGUgZmFrZSBpcyBub3QgZ29vZCBlbm91Z2gsIHlvdSBhcmUKcGxheWluZyB3
aGFjay1hLW1vbGUgdW50aWwgeW91IGZpbmFsbHkgZG8gY3JlYXRlIGEgZnVsbHkgZmxlZGdlZCBm
aWxlLgoKSWYgeW91IGFyZSBnb2luZyB0byB0aGUgdHJvdWJsZSBvZiBoYXZpbmcgdG8gY3JlYXRl
IGEgc3RydWN0IGZpbGUgdG8KcHJvdmlkZSB0byB0aGUgZmFsbGJhY2sgcm91dGluZXMsIG1pZ2h0
IGFzIHdlbGwgYXZvaWQgc3Rpbmt5IGNvZGUgOikKLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
