Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E1C4832
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84F56E8B3;
	Wed,  2 Oct 2019 07:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4586E544
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 08:04:01 +0000 (UTC)
Received: from [199.195.250.187] (port=57053 helo=hermes.aosc.io)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iFD8X-0004I2-JQ; Tue, 01 Oct 2019 09:03:57 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id B47AA82889;
 Tue,  1 Oct 2019 08:03:52 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] Revert "drm/sun4i: dsi: Change the start delay
 calculation"
Date: Tue,  1 Oct 2019 16:02:51 +0800
Message-Id: <20191001080253.6135-2-icenowy@aosc.io>
In-Reply-To: <20191001080253.6135-1-icenowy@aosc.io>
References: <20191001080253.6135-1-icenowy@aosc.io>
MIME-Version: 1.0
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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
Cc: linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBkYTY3NmM2YWE2NDEzZDU5YWIwYTgwYzk3YmJjMjczMDI1ZTY0
MGIyLgoKVGhlIG9yaWdpbmFsIGNvbW1pdCBhZGRzIGEgc3RhcnQgcGFyYW1ldGVyIHRvIHRoZSBj
YWxjdWxhdGlvbiBvZiB0aGUKc3RhcnQgZGVsYXkgYWNjb3JkaW5nIHRvIHNvbWUgb2xkIEJTUCB2
ZXJzaW9ucyBmcm9tIEFsbHdpbm5lci4gSG93ZXZlciwKdGhlcmUncmUgdHdvIHdheXMgdG8gYWRk
IHRoaXMgZGVsYXkgLS0gYWRkIGl0IGluIERTSSBjb250cm9sbGVyIG9yIGFkZAppdCBpbiB0aGUg
VENPTi4gQWRkIGl0IGluIGJvdGggY29udHJvbGxlcnMgd29uJ3Qgd29yay4KClRoZSBjb2RlIGJl
Zm9yZSB0aGlzIGNvbW1pdCBpcyBwaWNrZWQgZnJvbSBuZXcgdmVyc2lvbnMgb2YgQlNQIGtlcm5l
bCwKd2hpY2ggaGFzIGEgY29tbWVudCBmb3IgdGhlIDEgdGhhdCBzYXlzICJwdXQgc3RhcnRfZGVs
YXkgdG8gdGNvbiIuIEJ5CmNoZWNraW5nIHRoZSBzdW40aV90Y29uMF9tb2RlX3NldF9jcHUoKSBp
biBzdW40aV90Y29uIGRyaXZlciwgaXQgaGFzCmFscmVhZHkgYWRkZWQgdGhpcyBkZWxheSwgc28g
d2Ugc2hvdWxkbid0IHJlcGVhdCB0byBhZGQgdGhlIGRlbGF5IGluIERTSQpjb250cm9sbGVyLCBv
dGhlcndpc2UgdGhlIHRpbWluZyB3b24ndCBtYXRjaC4KClNpZ25lZC1vZmYtYnk6IEljZW5vd3kg
WmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlf
bWlwaV9kc2kuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlf
ZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwppbmRleCAxNjM2
MzQ0YmE5ZWMuLmM4NmUxMTYzMWViYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlf
ZHNpLmMKQEAgLTM2NSw4ICszNjUsNyBAQCBzdGF0aWMgdm9pZCBzdW42aV9kc2lfaW5zdF9pbml0
KHN0cnVjdCBzdW42aV9kc2kgKmRzaSwKIHN0YXRpYyB1MTYgc3VuNmlfZHNpX2dldF92aWRlb19z
dGFydF9kZWxheShzdHJ1Y3Qgc3VuNmlfZHNpICpkc2ksCiAJCQkJCSAgIHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICptb2RlKQogewotCXUxNiBzdGFydCA9IGNsYW1wKG1vZGUtPnZ0b3RhbCAtIG1v
ZGUtPnZkaXNwbGF5IC0gMTAsIDgsIDEwMCk7Ci0JdTE2IGRlbGF5ID0gbW9kZS0+dnRvdGFsIC0g
KG1vZGUtPnZzeW5jX2VuZCAtIG1vZGUtPnZkaXNwbGF5KSArIHN0YXJ0OworCXUxNiBkZWxheSA9
IG1vZGUtPnZ0b3RhbCAtIChtb2RlLT52c3luY19lbmQgLSBtb2RlLT52ZGlzcGxheSkgKyAxOwog
CiAJaWYgKGRlbGF5ID4gbW9kZS0+dnRvdGFsKQogCQlkZWxheSA9IGRlbGF5ICUgbW9kZS0+dnRv
dGFsOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
