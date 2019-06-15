Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E8647268
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 00:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226989214;
	Sat, 15 Jun 2019 22:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A12089214
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 22:36:28 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hcHHa-0003tz-El; Sun, 16 Jun 2019 00:36:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 27/59] drm/rockchip: Drop drm_gem_prime_export/import
Date: Sun, 16 Jun 2019 00:36:21 +0200
Message-ID: <3418626.3hxrPx6y9t@phil>
In-Reply-To: <20190614203615.12639-28-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-28-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgMTQuIEp1bmkgMjAxOSwgMjI6MzU6NDMgQ0VTVCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4gVGhleSdyZSB0aGUgZGVmYXVsdC4KPiAKPiBBc2lkZTogV291bGQgYmUgcmVhbGx5
IG5pY2UgdG8gc3dpdGNoIHRoZSBvdGhlcnMgb3ZlciB0bwo+IGRybV9nZW1fb2JqZWN0X2Z1bmNz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgo+IENjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+IENjOiAiSGVpa28g
U3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCgpP
biByazMzOTkgd2l0aCBwYW5mcm9zdCB2aWEgcHJpbWUKVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5l
ciA8aGVpa29Ac250ZWNoLmRlPgoKYW5kIGl0IG9idmlvdXNseSBsb29rcyBjb3JyZWN0LCBzbwpS
ZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KCgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jIHwgMiAtLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF9kcm1fZHJ2LmMKPiBpbmRleCA1OTA5MWI2MjQxZWMuLjc4Mjk3OWYxYjU1YSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9kcnYuYwo+IEBA
IC0yMTksOCArMjE5LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIHJvY2tjaGlwX2RybV9k
cml2ZXIgPSB7Cj4gIAkuZHVtYl9jcmVhdGUJCT0gcm9ja2NoaXBfZ2VtX2R1bWJfY3JlYXRlLAo+
ICAJLnByaW1lX2hhbmRsZV90b19mZAk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ICAJ
LnByaW1lX2ZkX3RvX2hhbmRsZQk9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+IC0JLmdl
bV9wcmltZV9pbXBvcnQJPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKPiAtCS5nZW1fcHJpbWVfZXhw
b3J0CT0gZHJtX2dlbV9wcmltZV9leHBvcnQsCj4gIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZQk9
IHJvY2tjaGlwX2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCj4gIAkuZ2VtX3ByaW1lX2ltcG9ydF9z
Z190YWJsZQk9IHJvY2tjaGlwX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCj4gIAkuZ2VtX3By
aW1lX3ZtYXAJCT0gcm9ja2NoaXBfZ2VtX3ByaW1lX3ZtYXAsCj4gCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
