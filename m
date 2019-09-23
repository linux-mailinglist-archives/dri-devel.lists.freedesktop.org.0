Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD5BB7FF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 17:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2AE6E94B;
	Mon, 23 Sep 2019 15:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CA16E94B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 15:34:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 45F75283B93
Subject: Re: [PATCH] drm/rockchip: Add AFBC support
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
References: <20190923122014.18229-1-andrzej.p@collabora.com>
 <da7f0c5e-9ca9-020d-5366-2b21a42acdff@baylibre.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <332335a5-dc7f-2cce-601f-f73e9243dee5@collabora.com>
Date: Mon, 23 Sep 2019 17:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <da7f0c5e-9ca9-020d-5366-2b21a42acdff@baylibre.com>
Content-Language: en-US
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBBbGwsCgpBcyBhIHJlc3VsdCBvZiBteSBtaXN0YWtlIEkndmUgc2VudCB0aGlzIHBhdGNo
IHdpdGggYW4gaW5jb3JyZWN0IFNPQiBjaGFpbi4gClBsZWFzZSBraW5kbHkgZGlzcmVnYXJkIHRo
aXMgcGF0Y2guCgpATmVpbDogdGhhbmsgeW91IGZvciB5b3VyIHRpbWUgeW91IHNwZW50IHJldmll
d2luZyBpdCBhbmQgYW5zd2VyaW5nIGFuZCBJJ20gCnNvcnJ5IGl0J3MgdG8gbm8gZWZmZWN0LgpA
RXplcXVpZWwsIEBUb21ldTogSSBhcG9sb2dpemUgdG8geW91LiBNeSBtaXN0YWtlLgoKUmVnYXJk
cywKCkFuZHJ6ZWogUGlldHJhc2lld2ljegoKClcgZG5pdSAyMy4wOS4yMDE5IG/CoDE1OjUzLCBO
ZWlsIEFybXN0cm9uZyBwaXN6ZToKPiBPbiAyMy8wOS8yMDE5IDE0OjIwLCBBbmRyemVqIFBpZXRy
YXNpZXdpY3ogd3JvdGU6Cj4+IEZyb206IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFi
b3JhLmNvbT4KPj4KPj4gQUZCQyBpcyBhIHByb3ByaWV0YXJ5IGxvc3NsZXNzIGltYWdlIGNvbXBy
ZXNzaW9uIHByb3RvY29sIGFuZCBmb3JtYXQuCj4+IEl0IGhlbHBzIHJlZHVjZSBtZW1vcnkgYmFu
ZHdpZHRoIG9mIHRoZSBncmFwaGljcyBwaXBlbGluZSBvcGVyYXRpb25zLgo+PiBUaGlzLCBpbiB0
dXJuLCBpbXByb3ZlcyBwb3dlciBlZmZpY2llbmN5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBFemVx
dWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Cj4+IFtsb2NraW5nIGltcHJvdmVt
ZW50c10KPj4gU2lnbmVkLW9mZi1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFi
b3JhLmNvbT4KPj4gW3NxdWFzaGluZyB0aGUgYWJvdmUsIGNvbW1pdCBtZXNzYWdlIGFuZCBSb2Nr
Y2hpcCBBRkJDIG1vZGlmaWVyXQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdp
Y3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMgIHwgMjcgKysrKysrCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8IDk0ICsrKysrKysrKysrKysrKysrKysr
LQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmggfCAxMiAr
KysKPj4gICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jIHwgMTgg
KysrKwo+PiAgIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oICAgICAgICAgICAgICAgfCAg
MyArCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPj4KPiAKPiBbLi4uXQo+IAo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1f
Zm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+PiBpbmRleCAzZmVlYWEz
Zjk4N2EuLmJhNmNhZjA2YzgyNCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1f
Zm91cmNjLmgKPj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPj4gQEAgLTc0
Miw2ICs3NDIsOSBAQCBleHRlcm4gIkMiIHsKPj4gICAgKi8KPj4gICAjZGVmaW5lIEFGQkNfRk9S
TUFUX01PRF9CQ0ggICAgICgxVUxMIDw8IDExKQo+PiAgIAo+PiArI2RlZmluZSBBRkJDX0ZPUk1B
VF9NT0RfUk9DS0NISVAgXAo+PiArCShBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tfU0laRV8xNngxNiB8
IEFGQkNfRk9STUFUX01PRF9TUEFSU0UpCj4gCj4gVGhpcyBkZWZpbmUgbG9va3MgdXNlbGVzcywg
d2hhdCdzIFJvY2tjaGlwIHNwZWNpZmljIGhlcmUgPwo+IAo+IE5laWwKPiAKPj4gKwo+PiAgIC8q
Cj4+ICAgICogQWxsd2lubmVyIHRpbGVkIG1vZGlmaWVyCj4+ICAgICoKPj4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
