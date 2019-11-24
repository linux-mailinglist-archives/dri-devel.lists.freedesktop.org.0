Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3C6108278
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 08:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F786E0F4;
	Sun, 24 Nov 2019 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920176E0F4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 07:48:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 862EB283BB9;
 Sun, 24 Nov 2019 07:48:52 +0000 (GMT)
Date: Sun, 24 Nov 2019 08:48:48 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 07/21] drm/bridge: Make the bridge chain a
 double-linked list
Message-ID: <20191124084848.33a6bf01@collabora.com>
In-Reply-To: <d41c745d-3ddb-db99-8d1b-81a39dbcde3e@baylibre.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-8-boris.brezillon@collabora.com>
 <d0da3b19-62c9-bf1d-8a41-3a6a06b82fb0@baylibre.com>
 <d41c745d-3ddb-db99-8d1b-81a39dbcde3e@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KCk9uIFR1ZSwgNSBOb3YgMjAxOSAx
NzowMjozMCArMDEwMApOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IHdy
b3RlOgoKPiBIaSwKPiAKPiAKPiBPbiAyNS8xMC8yMDE5IDE1OjI5LCBOZWlsIEFybXN0cm9uZyB3
cm90ZToKPiA+IE9uIDIzLzEwLzIwMTkgMTc6NDQsIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+
ID4+IFNvIHRoYXQgZWFjaCBlbGVtZW50IGluIHRoZSBjaGFpbiBjYW4gZWFzaWx5IGFjY2VzcyBp
dHMgcHJlZGVjZXNzb3IuCj4gPj4gVGhpcyB3aWxsIGJlIG5lZWRlZCB0byBzdXBwb3J0IGJ1cyBm
b3JtYXQgbmVnb3RpYXRpb24gYmV0d2VlbiBlbGVtZW50cwo+ID4+IG9mIHRoZSBicmlkZ2UgY2hh
aW4uCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPgo+ID4+IC0tLQo+ID4+IENoYW5nZXMgaW4gdjM6Cj4gPj4gKiBO
b25lCj4gPj4KPiA+PiBDaGFuZ2VzIGluIHYyOgo+ID4+ICogQWRqdXN0IHRoaW5ncyB0byB0aGUg
ImR1bW15IGVuY29kZXIgYnJpZGdlIiBjaGFuZ2UgKHBhdGNoIDIgaW4gdGhpcwo+ID4+ICAgc2Vy
aWVzKQo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jICB8IDE3MSAr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZW5jb2Rlci5jIHwgIDE2ICstLS0KPiA+PiAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAg
ICAgfCAgMTIgKystCj4gPj4gIGluY2x1ZGUvZHJtL2RybV9lbmNvZGVyLmggICAgIHwgICA5ICst
Cj4gPj4gIDQgZmlsZXMgY2hhbmdlZCwgMTM1IGluc2VydGlvbnMoKyksIDczIGRlbGV0aW9ucygt
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gPj4gaW5kZXggNTRjODc0NDkzYzU3Li5jNWNm
OGE5YzQyMzcgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+
ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgIAo+IAo+IFsuLi5dCj4gCj4g
Pj4gIAo+ID4+IEBAIC00MjYsMTUgKzQ3MSwyMyBAQCBFWFBPUlRfU1lNQk9MKGRybV9hdG9taWNf
YnJpZGdlX2NoYWluX3Bvc3RfZGlzYWJsZSk7Cj4gPj4gIHZvaWQgZHJtX2F0b21pY19icmlkZ2Vf
Y2hhaW5fcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ID4+ICAJCQkJCXN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiA+PiAgewo+ID4+ICsJc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyOwo+ID4+ICsJc3RydWN0IGRybV9icmlkZ2UgKml0ZXI7Cj4gPj4gKwo+
ID4+ICAJaWYgKCFicmlkZ2UpCj4gPj4gIAkJcmV0dXJuOwo+ID4+ICAKPiA+PiAtCWRybV9hdG9t
aWNfYnJpZGdlX2NoYWluX3ByZV9lbmFibGUoYnJpZGdlLT5uZXh0LCBzdGF0ZSk7Cj4gPj4gKwll
bmNvZGVyID0gYnJpZGdlLT5lbmNvZGVyOwo+ID4+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeV9yZXZl
cnNlKGl0ZXIsICZicmlkZ2UtPmVuY29kZXItPmJyaWRnZV9jaGFpbiwKPiA+PiArCQkJCSAgICBj
aGFpbl9ub2RlKSB7ICAKPiAKPiBUaGlzIHNob3VsZCB1c2UgdGhlIGVuY29kZXIgbG9jYWwgdmFy
aWFibGUgaW4gbGlzdF9mb3JfZWFjaF9lbnRyeV9yZXZlcnNlKCkKPiAKPiA+PiArCQlpZiAoaXRl
ci0+ZnVuY3MtPmF0b21pY19wcmVfZW5hYmxlKQo+ID4+ICsJCQlpdGVyLT5mdW5jcy0+YXRvbWlj
X3ByZV9lbmFibGUoaXRlciwgc3RhdGUpOwo+ID4+ICsJCWVsc2UgaWYgKGl0ZXItPmZ1bmNzLT5w
cmVfZW5hYmxlKQo+ID4+ICsJCQlpdGVyLT5mdW5jcy0+cHJlX2VuYWJsZShpdGVyKTsKPiA+PiAg
Cj4gPj4gLQlpZiAoYnJpZGdlLT5mdW5jcy0+YXRvbWljX3ByZV9lbmFibGUpCj4gPj4gLQkJYnJp
ZGdlLT5mdW5jcy0+YXRvbWljX3ByZV9lbmFibGUoYnJpZGdlLCBzdGF0ZSk7Cj4gPj4gLQllbHNl
IGlmIChicmlkZ2UtPmZ1bmNzLT5wcmVfZW5hYmxlKQo+ID4+IC0JCWJyaWRnZS0+ZnVuY3MtPnBy
ZV9lbmFibGUoYnJpZGdlKTsKPiA+PiArCQlpZiAoaXRlciA9PSBicmlkZ2UpCj4gPj4gKwkJCWJy
ZWFrOwo+ID4+ICsJfQo+ID4+ICB9Cj4gPj4gIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19icmlk
Z2VfY2hhaW5fcHJlX2VuYWJsZSk7Cj4gPj4gIAo+ID4+IEBAIC00NTMsMTUgKzUwNiwxOSBAQCBF
WFBPUlRfU1lNQk9MKGRybV9hdG9taWNfYnJpZGdlX2NoYWluX3ByZV9lbmFibGUpOwo+ID4+ICB2
b2lkIGRybV9hdG9taWNfYnJpZGdlX2NoYWluX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlLAo+ID4+ICAJCQkJICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiA+PiAg
ewo+ID4+ICsJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwo+ID4+ICsKPiA+PiAgCWlmICgh
YnJpZGdlKQo+ID4+ICAJCXJldHVybjsKPiA+PiAgCj4gPj4gLQlpZiAoYnJpZGdlLT5mdW5jcy0+
YXRvbWljX2VuYWJsZSkKPiA+PiAtCQlicmlkZ2UtPmZ1bmNzLT5hdG9taWNfZW5hYmxlKGJyaWRn
ZSwgc3RhdGUpOwo+ID4+IC0JZWxzZSBpZiAoYnJpZGdlLT5mdW5jcy0+ZW5hYmxlKQo+ID4+IC0J
CWJyaWRnZS0+ZnVuY3MtPmVuYWJsZShicmlkZ2UpOwo+ID4+IC0KPiA+PiAtCWRybV9hdG9taWNf
YnJpZGdlX2NoYWluX2VuYWJsZShicmlkZ2UtPm5leHQsIHN0YXRlKTsKPiA+PiArCWVuY29kZXIg
PSBicmlkZ2UtPmVuY29kZXI7Cj4gPj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X2Zyb20oYnJpZGdl
LCAmYnJpZGdlLT5lbmNvZGVyLT5icmlkZ2VfY2hhaW4sCj4gPj4gKwkJCQkgY2hhaW5fbm9kZSkg
eyAgCj4gCj4gVGhpcyBzaG91bGQgdXNlIGVuY29kZXIgaW5zdGVhZCBvZiBicmlkZ2UtPmVuY29k
ZXIgb3RoZXJ3aXNlIGJyaWRnZSB3aWxsCj4gY2hhbmdlIGFuZCBicmlkZ2UtPmVuY29kZXItPmJy
aWRnZV9jaGFpbiB3b24ndCBiZSB2YWxpZCBkdXJpbmcgdGhlIGZvcl9lYWNoIGFuZAo+IGNhdXNl
IHRoZSBmb2xsb3dpbmcgOgoKT29wcywgaW5kZWVkLiBJIGZpeGVkIHRoZSB2ZXJ5IHNhbWUgcHJv
YmxlbSBpbiBhbm90aGVyIGhlbHBlciBidXQKc29tZWhvdyBtaXNzZWQgdGhvc2UgMi4gVGhhbmtz
IGZvciB0ZXN0aW5nL3JlcG9ydGluZyB0aGUgYnVnLgoKQm9yaXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
