Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 518563DBD6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 22:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283EA89218;
	Tue, 11 Jun 2019 20:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ABE89218
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 20:29:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AE9ED20037;
 Tue, 11 Jun 2019 22:29:54 +0200 (CEST)
Date: Tue, 11 Jun 2019 22:29:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/9] drm/ast: Pin framebuffer BO during dirty update
Message-ID: <20190611202953.GA18315@ravnborg.org>
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611130344.18988-6-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=vfL2Gn8yr9tQAqXjmB0A:9 a=CjuIK1q_8ugA:10
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
Cc: maxime.ripard@bootlin.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDM6MDM6NDBQTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gQW5vdGhlciBleHBsaWNpdCBsb2NrIG9wZXJhdGlvbiBv
ZiBhIEdFTSBWUkFNIEJPIGlzIGxvY2F0ZWQgaW4gQVNUJ3MKPiBmcmFtZWJ1ZmZlciB1cGRhdGUg
Y29kZS4gSW5zdGVhZCBvZiBsb2NraW5nIHRoZSBCTywgd2UgcGluIGl0IHRvIHdoZXJldmVyCj4g
aXQgaXMuCj4gCj4gdjI6Cj4gCSogdXBkYXRlIHdpdGggcGluIGZsYWcgb2YgMAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jIHwgMzMgKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2ZiLmMKPiBpbmRleCAwNWY0NTIyMmI3MDIuLmI0MDRi
NTFjMmM1NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9mYi5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIuYwo+IEBAIC00OCwzMiArNDgsMzEgQEAgc3Rh
dGljIHZvaWQgYXN0X2RpcnR5X3VwZGF0ZShzdHJ1Y3QgYXN0X2ZiZGV2ICphZmJkZXYsCj4gIAkJ
CSAgICAgaW50IHgsIGludCB5LCBpbnQgd2lkdGgsIGludCBoZWlnaHQpCj4gIHsKPiAgCWludCBp
Owo+IC0Jc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7Cj4gIAlzdHJ1Y3QgZHJtX2dlbV92cmFt
X29iamVjdCAqZ2JvOwo+ICAJaW50IHNyY19vZmZzZXQsIGRzdF9vZmZzZXQ7Cj4gIAlpbnQgYnBw
ID0gYWZiZGV2LT5hZmIuYmFzZS5mb3JtYXQtPmNwcFswXTsKPiAtCWludCByZXQgPSAtRUJVU1k7
Cj4gKwlpbnQgcmV0Owo+ICAJdTggKmRzdDsKPiAgCWJvb2wgdW5tYXAgPSBmYWxzZTsKPiAgCWJv
b2wgc3RvcmVfZm9yX2xhdGVyID0gZmFsc2U7Cj4gIAlpbnQgeDIsIHkyOwo+ICAJdW5zaWduZWQg
bG9uZyBmbGFnczsKPiAgCj4gLQlvYmogPSBhZmJkZXYtPmFmYi5vYmo7Cj4gLQlnYm8gPSBkcm1f
Z2VtX3ZyYW1fb2ZfZ2VtKG9iaik7Cj4gLQo+IC0JLyogVHJ5IHRvIGxvY2sgdGhlIEJPLiBJZiB3
ZSBmYWlsIHdpdGggLUVCVVNZIHRoZW4KPiAtCSAqIHRoZSBCTyBpcyBiZWluZyBtb3ZlZCBhbmQg
d2Ugc2hvdWxkIHN0b3JlIHVwIHRoZQo+IC0JICogZGFtYWdlIHVudGlsIGxhdGVyLgo+IC0JICov
Cj4gLQlpZiAoZHJtX2Nhbl9zbGVlcCgpKQo+IC0JCXJldCA9IGRybV9nZW1fdnJhbV9sb2NrKGdi
bywgdHJ1ZSk7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJaWYgKHJldCAhPSAtRUJVU1kpCj4gLQkJCXJl
dHVybjsKPiAtCj4gKwlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGFmYmRldi0+YWZiLm9iaik7
Cj4gKwo+ICsJaWYgKGRybV9jYW5fc2xlZXAoKSkgewoKV2hpbGUgdG91Y2hpbmcgdGhpcyBjb2Rl
LCBhbnl3YXkgd2UgY291bGQgZ2V0IHJpZCBvZiBkcm1fY2FuX3NsZWVwKCk/Ckkgb25seSBhc2sg
YmVjYXVzZSBEYW5pZWwgVi4gc2FpZCB0aGF0IHdlIHNob3VsZCBub3QgdXNlIGl0LgpUaGlzIHdh
cyBzb21lIG1vbnRocyBhZ28gZHVyaW5nIHNvbWUgZWhhZGVyIGZpbGUgY2xlYW4tdXAsIHNvIG5v
dGhpbmcKaW4gcGFydGljdWxhciByZWxhdGVkIHRvIHRoZSBhc3QgZHJpdmVyLgoKCVNhbQoKPiAr
CQkvKiBXZSBwaW4gdGhlIEJPIHNvIGl0IHdvbid0IGJlIG1vdmVkIGR1cmluZyB0aGUKPiArCQkg
KiB1cGRhdGUuIFRoZSBhY3R1YWwgbG9jYXRpb24sIHZpZGVvIFJBTSBvciBzeXN0ZW0KPiArCQkg
KiBtZW1vcnksIGlzIG5vdCBpbXBvcnRhbnQuCj4gKwkJICovCj4gKwkJcmV0ID0gZHJtX2dlbV92
cmFtX3BpbihnYm8sIDApOwo+ICsJCWlmIChyZXQpIHsKPiArCQkJaWYgKHJldCAhPSAtRUJVU1kp
Cj4gKwkJCQlyZXR1cm47Cj4gKwkJCXN0b3JlX2Zvcl9sYXRlciA9IHRydWU7Cj4gKwkJfQo+ICsJ
fSBlbHNlCj4gIAkJc3RvcmVfZm9yX2xhdGVyID0gdHJ1ZTsKPiAtCX0KPiAgCj4gIAl4MiA9IHgg
KyB3aWR0aCAtIDE7Cj4gIAl5MiA9IHkgKyBoZWlnaHQgLSAxOwo+IEBAIC0xMjYsNyArMTI1LDcg
QEAgc3RhdGljIHZvaWQgYXN0X2RpcnR5X3VwZGF0ZShzdHJ1Y3QgYXN0X2ZiZGV2ICphZmJkZXYs
Cj4gIAkJZHJtX2dlbV92cmFtX2t1bm1hcChnYm8pOwo+ICAKPiAgb3V0Ogo+IC0JZHJtX2dlbV92
cmFtX3VubG9jayhnYm8pOwo+ICsJZHJtX2dlbV92cmFtX3VucGluKGdibyk7Cj4gIH0KPiAgCj4g
IHN0YXRpYyB2b2lkIGFzdF9maWxscmVjdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywKPiAtLSAKPiAy
LjIxLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
