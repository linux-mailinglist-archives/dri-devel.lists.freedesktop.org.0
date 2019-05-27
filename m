Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779202B582
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EFB89ECD;
	Mon, 27 May 2019 12:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5782C89ECD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 12:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 838B53FA8B;
 Mon, 27 May 2019 14:39:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNadhVo84MDi; Mon, 27 May 2019 14:39:19 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id F264C40275;
 Mon, 27 May 2019 14:39:18 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 93E183602FD;
 Mon, 27 May 2019 14:39:18 +0200 (CEST)
Subject: Re: [PATCH 13/13] drm: allow render capable master with DRM_AUTH
 ioctls
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-13-emil.l.velikov@gmail.com>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <dae696f5-aedb-7cf2-4827-da5a1a04f4f8@shipmail.org>
Date: Mon, 27 May 2019 14:39:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527081741.14235-13-emil.l.velikov@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1558960758; bh=+RkbP7QjDS9fKRkgapRBHm+KhGzUtU9LySgyKfJ+Ffg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QFLJbGoKytYjnWTGzJlAvUxk7M4NeCimMUPlJxxmJjMSnLjd8OTHovR294nmPcCS2
 IFnEehBVylOVBkIa3y6x9mtqqbYazI8Ly+tWHx4D2QFC/heEtr6DcE0q23pEQxPnkv
 sBOdQWnH2gF6MMdyDpZ66HryP07L5tJFTfCxyF8M=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=QFLJbGoK; 
 dkim-atps=neutral
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
Cc: intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yNy8xOSAxMDoxNyBBTSwgRW1pbCBWZWxpa292IHdyb3RlOgo+IEZyb206IEVtaWwgVmVs
aWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4KPiBUaGVyZSBhcmUgY2FzZXMgKGlu
IG1lc2EgYW5kIGFwcGxpY2F0aW9ucykgd2hlcmUgb25lIHdvdWxkIG9wZW4gdGhlCj4gcHJpbWFy
eSBub2RlIHdpdGhvdXQgcHJvcGVybHkgYXV0aGVudGljYXRpbmcgdGhlIGNsaWVudC4KPgo+IFNv
bWV0aW1lcyB3ZSBkb24ndCBjaGVjayBpZiB0aGUgYXV0aGVudGljYXRpb24gc3VjY2VlZHMsIGJ1
dCB0aGVyZSdzCj4gYWxzbyBjYXNlcyB3ZSBzaW1wbHkgZm9yZ2V0IHRvIGRvIGl0Lgo+Cj4gVGhl
IGZvcm1lciB3YXMgYSBjYXNlIGZvciBNZXNhIHdoZXJlIGl0IGRpZCBub3Qgbm90IGNoZWNrIHRo
ZSByZXR1cm4KPiB2YWx1ZSBvZiBkcm1HZXRNYWdpYygpIFsxXS4gVGhhdCB3YXMgZml4ZWQgcmVj
ZW50bHkgYWx0aG91Z2gsIHRoZXJlJ3MKPiB0aGUgcXVlc3Rpb24gb2Ygb2xkZXIgZHJpdmVycyBv
ciBvdGhlciBhcHBzIHRoYXQgZXhiaWJpdCB0aGlzIGJlaGF2aW91ci4KPgo+IFdoaWxlIG9taXR0
aW5nIHRoZSBjYWxsIHJlc3VsdHMgaW4gaXNzdWVzIGFzIHNlZW4gaW4gWzJdIGFuZCBbM10uCj4K
PiBJbiB0aGUgbGlidmEgY2FzZSwgbGlidmEgaXRzZWxmIGRvZXNuJ3QgYXV0aGVudGljYXRlIHRo
ZSBEUk0gY2xpZW50IGFuZAo+IHRoZSB2YUdldERpc3BsYXlEUk0gZG9jdW1lbnRhdGlvbiBkb2Vz
bid0IG1lbnRpb24gaWYgdGhlIGFwcCBzaG91bGQKPiBlaXRoZXIuCj4KPiBBcyBvZiB0b2RheSwg
dGhlIG9mZmljaWFsIHZhaW5mbyB1dGlsaXR5IGRvZXNuJ3QgYXV0aGVudGljYXRlLgo+Cj4gVG8g
d29ya2Fyb3VuZCBpc3N1ZXMgbGlrZSB0aGVzZSwgc29tZSB1c2VycyByZXNvcnQgdG8gcnVubmlu
ZyB0aGVpciBhcHBzCj4gdW5kZXIgc3Vkby4gV2hpY2ggYWRtaXR0ZWRseSBpc24ndCBhbHdheXMg
YSBnb29kIGlkZWEuCj4KPiBTaW5jZSBhbnkgRFJJVkVSX1JFTkRFUiBkcml2ZXIgaGFzIHN1ZmZp
Y2llbnQgaXNvbGF0aW9uIGJldHdlZW4gY2xpZW50cywKPiB3ZSBjYW4gdXNlIHRoYXQsIGZvciB1
bmF1dGhlbnRpY2F0ZWQgW3ByaW1hcnkgbm9kZV0gaW9jdGxzIHRoYXQgcmVxdWlyZQo+IERSTV9B
VVRILiBCdXQgb25seSBpZiB0aGUgcmVzcGVjdGl2ZSBpb2N0bCBpcyB0YWdnZWQgYXMgRFJNX1JF
TkRFUl9BTExPVy4KPgo+IHYyOgo+IC0gUmV3b3JrL3NpbXBsaWZ5IGlmIGNoZWNrIChEYW5pZWwg
VikKPiAtIEFkZCBleGFtcGxlcyB0byBjb21taXQgbWVzc2FnZXMsIGVsYWJvcmF0ZS4gKERhbmll
bCBWKQo+Cj4gdjM6Cj4gLSBVc2Ugc2luZ2xlIHVubGlrZWx5IChEYW5pZWwgVikKPgo+IHY0Ogo+
IC0gUGF0Y2ggd2FzIHJldmVydGVkIGJlY2F1c2UgaXQgYnJva2UgQU1ER1BVLCBhcHBseSBhZ2Fp
bi4gVGhlIEFNREdQVQo+IGlzc3VlIGlzIGZpeGVkIHdpdGggZWFybGllciBwYXRjaC4KPgo+IFsx
XSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL2Jsb2IvMmJjMWY1YzJl
NzBmZTNiNGQ0MWYwNjBhZjk4NTliYzJhOTRjNWI2Mi9zcmMvZWdsL2RyaXZlcnMvZHJpMi9wbGF0
Zm9ybV93YXlsYW5kLmMjTDExMzYKPiBbMl0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
YXJjaGl2ZXMvbGlidmEvMjAxNi1KdWx5LzAwNDE4NS5odG1sCj4gWzNdIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1YmUvaXNzdWVzLzEKPiBUZXN0Y2FzZTogaWd0L2Nv
cmVfdW5hdXRoX3ZzX3JlbmRlcgo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
PiBMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAx
OTAxMTQwODU0MDguMTU5MzMtMi1lbWlsLmwudmVsaWtvdkBnbWFpbC5jb20KPiAtLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYyB8IDIwICsrKysrKysrKysrKysrKystLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2lvY3RsLmMKPiBpbmRleCA5ODQxYzAwNzZmMDIuLmI2NGIwMjJhMmIyOSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2lvY3RsLmMKPiBAQCAtNTExLDYgKzUxMSwxMyBAQCBpbnQgZHJtX3ZlcnNpb24oc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgIAlyZXR1cm4gZXJyOwo+ICAgfQo+ICAgCj4g
K3N0YXRpYyBpbmxpbmUgYm9vbAo+ICtkcm1fcmVuZGVyX2RyaXZlcl9hbmRfaW9jdGwoY29uc3Qg
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdTMyIGZsYWdzKQo+ICt7Cj4gKwlyZXR1cm4gZHJtX2Nv
cmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9SRU5ERVIpICYmCj4gKwkJKGZsYWdzICYgRFJN
X1JFTkRFUl9BTExPVyk7Cj4gK30KPiArCj4gICAvKioKPiAgICAqIGRybV9pb2N0bF9wZXJtaXQg
LSBDaGVjayBpb2N0bCBwZXJtaXNzaW9ucyBhZ2FpbnN0IGNhbGxlcgo+ICAgICoKPiBAQCAtNTI1
LDE0ICs1MzIsMTkgQEAgaW50IGRybV92ZXJzaW9uKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgKmRhdGEsCj4gICAgKi8KPiAgIGludCBkcm1faW9jdGxfcGVybWl0KHUzMiBmbGFncywgc3Ry
dWN0IGRybV9maWxlICpmaWxlX3ByaXYpCj4gICB7Cj4gKwljb25zdCBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2ID0gZmlsZV9wcml2LT5taW5vci0+ZGV2Owo+ICsKPiAgIAkvKiBST09UX09OTFkgaXMg
b25seSBmb3IgQ0FQX1NZU19BRE1JTiAqLwo+ICAgCWlmICh1bmxpa2VseSgoZmxhZ3MgJiBEUk1f
Uk9PVF9PTkxZKSAmJiAhY2FwYWJsZShDQVBfU1lTX0FETUlOKSkpCj4gICAJCXJldHVybiAtRUFD
Q0VTOwo+ICAgCj4gLQkvKiBBVVRIIGlzIG9ubHkgZm9yIGF1dGhlbnRpY2F0ZWQgb3IgcmVuZGVy
IGNsaWVudCAqLwo+IC0JaWYgKHVubGlrZWx5KChmbGFncyAmIERSTV9BVVRIKSAmJiAhZHJtX2lz
X3JlbmRlcl9jbGllbnQoZmlsZV9wcml2KSAmJgo+IC0JCSAgICAgIWZpbGVfcHJpdi0+YXV0aGVu
dGljYXRlZCkpCj4gLQkJcmV0dXJuIC1FQUNDRVM7Cj4gKwkvKiBBVVRIIGlzIG9ubHkgZm9yIG1h
c3RlciAuLi4gKi8KPiArCWlmICh1bmxpa2VseSgoZmxhZ3MgJiBEUk1fQVVUSCkgJiYgZHJtX2lz
X3ByaW1hcnlfY2xpZW50KGZpbGVfcHJpdikpKSB7Cj4gKwkJLyogYXV0aGVudGljYXRlZCBvbmVz
LCBvciByZW5kZXIgY2FwYWJsZSBvbiBEUk1fUkVOREVSX0FMTE9XLiAqLwo+ICsJCWlmICghZmls
ZV9wcml2LT5hdXRoZW50aWNhdGVkICYmCj4gKwkJICAgICFkcm1fcmVuZGVyX2RyaXZlcl9hbmRf
aW9jdGwoZGV2LCBmbGFncykpCj4gKwkJCXJldHVybiAtRUFDQ0VTOwo+ICsJfQoKVGhpcyBicmVh
a3Mgdm13Z2Z4IHByaW1hcnkgY2xpZW50IGF1dGhlbnRpY2F0aW9uIGluIHRoZSAKc3VyZmFjZV9y
ZWZlcmVuY2UgaW9jdGwsIHdoaWNoIHRha2VzIGRpZmZlcmVudCBwYXRocyBpbiBjYXNlIG9mIHJl
bmRlciAKY2xpZW50cyBhbmQgcHJpbWFyeSBjbGllbnRzLCBidXQgYWRkaW5nIGFuIGF1dGggY2hl
Y2sgaW4gdGhlIHByaW1hcnkgCnBhdGggaW4gdGhlIHZtd2dmeCBjb2RlIHNob3VsZCBmaXggdGhp
cy4KCi9UaG9tYXMKCgo+ICAgCj4gICAJLyogTUFTVEVSIGlzIG9ubHkgZm9yIG1hc3RlciBvciBj
b250cm9sIGNsaWVudHMgKi8KPiAgIAlpZiAodW5saWtlbHkoKGZsYWdzICYgRFJNX01BU1RFUikg
JiYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
