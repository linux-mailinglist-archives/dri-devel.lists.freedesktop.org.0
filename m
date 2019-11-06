Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C27AF16D6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 14:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E5A89C1A;
	Wed,  6 Nov 2019 13:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0863B89568;
 Wed,  6 Nov 2019 13:17:13 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19102181-1500050 for multiple; Wed, 06 Nov 2019 13:17:11 +0000
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAKMK7uEy_HdxksnqXbUqsmCvXZ-BcXv=DqFv8wZ6Y4NE0q4dSw@mail.gmail.com>
References: <20191106100716.18181-1-chris@chris-wilson.co.uk>
 <20191106100716.18181-3-chris@chris-wilson.co.uk>
 <20191106102157.GF23790@phenom.ffwll.local>
 <157303711710.24928.18026997375656120508@skylake-alporthouse-com>
 <CAKMK7uEy_HdxksnqXbUqsmCvXZ-BcXv=DqFv8wZ6Y4NE0q4dSw@mail.gmail.com>
Message-ID: <157304622913.24928.5087456756756492767@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 3/3] drm/prime: Use anon_drm_getfile() for an internal drm
 struct file
Date: Wed, 06 Nov 2019 13:17:09 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTExLTA2IDEzOjA2OjI2KQo+IE9uIFdlZCwgTm92
IDYsIDIwMTkgYXQgMTE6NDUgQU0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+IHdyb3RlOgo+ID4KPiA+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0xMS0wNiAxMDoy
MTo1NykKPiA+ID4gT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTA6MDc6MTZBTSArMDAwMCwgQ2hy
aXMgV2lsc29uIHdyb3RlOgo+ID4gPiA+IEN1cnJlbnRseSB0aGUgZHJtX3ByaW1lIG1tYXAgZmFs
bGJhY2sgdXNlcyBhIG1vY2sgc3RydWN0IGZpbGUgdG8gcHJvdmlkZQo+ID4gPiA+IHRoZSBmaWxl
IHBvaW50ZXIgaW50byB0aGUgYmFja2VuZCBtbWFwIHJvdXRpbmUuIE5vdyB0aGF0IHdlIGNhbiBj
cmVhdGUKPiA+ID4gPiBmdWxseSBmbGVkZ2VkIGFub255bW91cyBzdHJ1Y3QgZmlsZSBhcm91bmQg
dGhlIGRybSBkZXZpY2UsIHB1dCBpdCB0bwo+ID4gPiA+IHVzZS4KPiA+ID4gPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4g
PiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgfCAyNiArKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiA+ID4g
PiBpbmRleCAwODE0MjExYjBmM2YuLjVmYWE2MzcxM2VjOCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3ByaW1lLmMKPiA+ID4gPiBAQCAtNzA5LDggKzcwOSw3IEBAIEVYUE9SVF9TWU1CT0woZHJt
X2dlbV9kbWFidWZfdnVubWFwKTsKPiA+ID4gPiAgICovCj4gPiA+ID4gIGludCBkcm1fZ2VtX3By
aW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKQo+ID4gPiA+ICB7Cj4gPiA+ID4gLSAgICAgc3RydWN0IGRybV9maWxlICpwcml2Owo+
ID4gPiA+IC0gICAgIHN0cnVjdCBmaWxlICpmaWw7Cj4gPiA+ID4gKyAgICAgc3RydWN0IGZpbGUg
KmZpbGU7Cj4gPiA+ID4gICAgICAgaW50IHJldDsKPiA+ID4gPgo+ID4gPiA+ICAgICAgIGlmIChv
YmotPmZ1bmNzICYmIG9iai0+ZnVuY3MtPm1tYXApIHsKPiA+ID4KPiA+ID4gb2JqLT5mdW5jcy0+
bW1hcCBpcyB0aGUgbmV3IHdheSBvZiBkb2luZyB0aGlzIChhbmQgaG9wZWZ1bGx5IGZpbmFsbHkK
PiA+ID4gc29tZXRoaW5nIGNsZWFuKSwgSSdkIHJlYWxseSBsaWtlIHRvIHJldGlyZSB0aGUgYmVs
b3cgaGFjayBvdXRyaWdodC4KPiA+ID4KPiA+ID4gUGx1cyBJJ20gbm90IHN1cmUgd2h5IHlvdSBu
ZWVkIGFuIGFub24gaW5vZGUgaGVyZT8gSWYgYSBkcml2ZXIgbmVlZHMgdGhpcwo+ID4gPiBmb3Ig
dW5tYXBfbWFwcGluZ19yYW5nZSBvciBzaW1pbGFyIEkgdGhpbmsgaXQnZCBiZSBiZXR0ZXIgdG8g
dHJ5IGFuZCBtYWtlCj4gPiA+IHNvbWV0aGluZyB3b3JrIGNsZWFubHkgZm9yIG9iai0+ZnVuY3Mt
Pm1tYXAuCj4gPgo+ID4gSXQncyBmYWtpbmcgb25lIGN1cnJlbnRseS4gSWYgdGhlIGZha2UgaXMg
bm90IGdvb2QgZW5vdWdoLCB5b3UgYXJlCj4gPiBwbGF5aW5nIHdoYWNrLWEtbW9sZSB1bnRpbCB5
b3UgZmluYWxseSBkbyBjcmVhdGUgYSBmdWxseSBmbGVkZ2VkIGZpbGUuCj4gPgo+ID4gSWYgeW91
IGFyZSBnb2luZyB0byB0aGUgdHJvdWJsZSBvZiBoYXZpbmcgdG8gY3JlYXRlIGEgc3RydWN0IGZp
bGUgdG8KPiA+IHByb3ZpZGUgdG8gdGhlIGZhbGxiYWNrIHJvdXRpbmVzLCBtaWdodCBhcyB3ZWxs
IGF2b2lkIHN0aW5reSBjb2RlIDopCj4gCj4gV2UncmUgY3VycmVudGx5IG5vdCBmYWtpbmcgdGhl
IGlub2RlIGF0IGFsbCwgd2UncmUganVzdCB1c2luZyB0aGUgb25lCj4gdGhhdCBjb21lcyB3aXRo
IHRoZSBkbWEtYnVmLiBTbyBkaXN0aW5jdCBmcm9tIHRoZSBkcm1fZGV2aWNlIGZpbGUsIGFuZAo+
IGhlbmNlIHVubWFwX21hcHBpbmdfcmFuZ2Ugd29uJ3Qgd29yayAob3IgYXQgbGVhc3QgZG9pbmcg
dGhhdCBvbiB0aGUKPiBkcm1fZGV2aWNlIGlub2RlIHdvbnQgc2hvb3QgZG93biB0aGUgcHRlcyBm
b3IgcmVkaXJlY3RlZCBkbWEtYnVmCj4gbW1hcHMpLiBvYmotPmZ1bmNzLT5tbWFwIGhhcyB0aGUg
c2FtZSBpc3N1ZS4KPiAKPiBCdXQgc2luY2UgYWxsIGN1cnJlbnQgdXNlcnMgb2YgdGhpcyBkb24n
dCBleHBlY3QgdW5tYXBfbWFwcGluZ19yYW5nZQo+IHRvIHdvcmsgY29ycmVjdGx5LCBpdCdzIG5v
dCBhbiByZWFsIGlzc3VlLiBJZiB0aGF0IGNoYW5nZXMgdGhlbiBpbW8gd2UKPiBzaG91bGQgZml4
IHVwIHRoZSBvYmotPmZ1bmNzLT5tbWFwIHBhdGggdG8gaGF2ZSB0aGUgY29ycmVjdCBpbm9kZSwg
bm90Cj4gdGhlIGRlcHJlY2F0ZWQgcGF0aCB5b3UncmUgdXBkYXRpbmcgaGVyZS4gQnV0IHNpbmNl
IHRoZXJlJ3Mgbm8gcGF0Y2ggNAo+IGluIHRoaXMgc2VyaWVzIHRvIHN0YXJ0IHVzaW5nIHRoaXMg
Zm9yIGk5MTUgb3Igc29tZW9uZSBlbHNlLCBJJ20gbm90Cj4gc2VlaW5nIHRoZSBwb2ludC4KClRo
ZXJlJ3MgYSBidWcgaW4gYW5vbl9kcm1faW5vZGUoKSBpbiB0aGF0IGl0IHJlcXVpcmVzIGFuIGV4
dHJhOgoKKyAgICAgICAvKiBFdmVyeW9uZSBzaGFyZXMgYSBzaW5nbGUgZ2xvYmFsIGFkZHJlc3Mg
c3BhY2UgKi8KKyAgICAgICBmaWxlLT5mX21hcHBpbmcgPSBkZXYtPmFub25faW5vZGUtPmlfbWFw
cGluZzsKCkknbSB1cCB0byA1IHBhdGNoZXMgbm93LCBidXQgb25seSBpOTE1L3NlbGZ0ZXN0cyAm
IHRoaXMgaGVyZSBmYWxsYmFjayBhcwpkaXJlY3QgdXNlcnMuCi1DaHJpcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
