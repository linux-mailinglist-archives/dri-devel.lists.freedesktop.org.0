Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AABDAA063F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C3E89D42;
	Wed, 28 Aug 2019 15:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C1189D42
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 15:25:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DD28628D10B;
 Wed, 28 Aug 2019 16:25:36 +0100 (BST)
Date: Wed, 28 Aug 2019 17:25:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 08/21] drm/msm: Use drm_attach_bridge() to attach a
 bridge to an encoder
Message-ID: <20190828172533.4f24a37d@collabora.com>
In-Reply-To: <20190828152257.GB218215@art_vandelay>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-9-boris.brezillon@collabora.com>
 <20190828152257.GB218215@art_vandelay>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <Chris.Healy@zii.aero>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyOCBBdWcgMjAxOSAxMToyMjo1NyAtMDQwMApTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4gd3JvdGU6Cgo+IE9uIE1vbiwgQXVnIDI2LCAyMDE5IGF0IDA1OjI2OjM2UE0gKzAyMDAs
IEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IFRoaXMgaXMgcGFydCBvZiBvdXIgYXR0ZW1wdCB0
byBtYWtlIHRoZSBicmlkZ2UgY2hhaW4gYSBkb3VibGUtbGlua2VkCj4gPiBsaXN0IGJhc2VkIG9u
IHRoZSBnZW5lcmljIGxpc3QgaGVscGVycy4gSW4gb3JkZXIgdG8gZG8gdGhhdCwgd2UgbXVzdAo+
ID4gcGF0Y2ggYWxsIGRyaXZlcnMgbWFuaXB1bGF0aW5nIHRoZSBlbmNvZGVyLT5icmlkZ2UgZmll
bGQgZGlyZWN0bHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9y
aXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gIAo+IAo+IERvIHlvdSB3YW50IHRvIHRh
a2UgdGhpcyB0aHJvdWdoIC1taXNjPwo+IAo+IFJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5A
cG9vcmx5LnJ1bj4KClllcywgdGhhdCB3YXMgdGhlIHBsYW4sIHVubGVzcyB5b3Ugd2FudCB0byBh
cHBseSBpdCB0byB0aGUgbXNtIHRyZWUKKG5vdCBzdXJlIGlmIHRoZXJlJ3Mgc3VjaCBhIHRyZWUp
LgoKPiAKPiAKPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ICogQWRkIExhdXJlbnQgYW5k
IFNhbSBSLWIgKHdhaXRpbmcgZm9yIGEgUi1iIGZyb20gYSBkcm0vbXNtIG1haW50YWluZXIKPiA+
ICAgbm93KQo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9lZHAvZWRwLmMgICB8IDQg
KysrLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMgfCA0ICsrKy0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcC5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9lZHAvZWRwLmMKPiA+IGluZGV4IGI1NDU1OWE3OWQzNi4uYWQ0ZTk2M2NjZDliIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9lZHAvZWRwLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcC5jCj4gPiBAQCAtMTc4LDcgKzE3OCw5IEBAIGludCBt
c21fZWRwX21vZGVzZXRfaW5pdChzdHJ1Y3QgbXNtX2VkcCAqZWRwLCBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAo+ID4gIAkJZ290byBmYWlsOwo+ID4gIAl9Cj4gPiAgCj4gPiAtCWVuY29kZXItPmJy
aWRnZS5uZXh0ID0gZWRwLT5icmlkZ2U7Cj4gPiArCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVu
Y29kZXIsIGVkcC0+YnJpZGdlLCBOVUxMKTsKPiA+ICsJaWYgKHJldCkKPiA+ICsJCWdvdG8gZmFp
bDsKPiA+ICAKPiA+ICAJcHJpdi0+YnJpZGdlc1twcml2LT5udW1fYnJpZGdlcysrXSAgICAgICA9
IGVkcC0+YnJpZGdlOwo+ID4gIAlwcml2LT5jb25uZWN0b3JzW3ByaXYtPm51bV9jb25uZWN0b3Jz
KytdID0gZWRwLT5jb25uZWN0b3I7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9oZG1pL2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMKPiA+IGluZGV4
IDlkOTRhODhkZDhkNi4uNTViOWE4YzgzMTJiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9oZG1pL2hkbWkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hk
bWkuYwo+ID4gQEAgLTMyNyw3ICszMjcsOSBAQCBpbnQgbXNtX2hkbWlfbW9kZXNldF9pbml0KHN0
cnVjdCBoZG1pICpoZG1pLAo+ID4gIAkJZ290byBmYWlsOwo+ID4gIAl9Cj4gPiAgCj4gPiAtCWVu
Y29kZXItPmJyaWRnZS5uZXh0ID0gaGRtaS0+YnJpZGdlOwo+ID4gKwlyZXQgPSBkcm1fYnJpZGdl
X2F0dGFjaChlbmNvZGVyLCBoZG1pLT5icmlkZ2UsIE5VTEwpOwo+ID4gKwlpZiAocmV0KQo+ID4g
KwkJZ290byBmYWlsOwo+ID4gIAo+ID4gIAlwcml2LT5icmlkZ2VzW3ByaXYtPm51bV9icmlkZ2Vz
KytdICAgICAgID0gaGRtaS0+YnJpZGdlOwo+ID4gIAlwcml2LT5jb25uZWN0b3JzW3ByaXYtPm51
bV9jb25uZWN0b3JzKytdID0gaGRtaS0+Y29ubmVjdG9yOwo+ID4gLS0gCj4gPiAyLjIxLjAKPiA+
IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
