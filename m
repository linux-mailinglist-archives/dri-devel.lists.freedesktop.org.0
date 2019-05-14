Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4DD1E8EA
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D3189622;
	Wed, 15 May 2019 07:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3A8892BE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:11:17 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id AB0D368B20; Tue, 14 May 2019 18:02:25 +0200 (CEST)
From: Torsten Duwe <duwe@lst.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Archit Taneja <architt@codeaurora.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>
Subject: [PATCH 1/4] arm64: DTS: allwinner: a64: Add pinmux for RGB666 LCD
References: <20190514155911.6C0AC68B05@newverein.lst.de>
Message-Id: <20190514160225.AB0D368B20@newverein.lst.de>
Date: Tue, 14 May 2019 18:02:25 +0200 (CEST)
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgoKQWxsd2lubmVyIEE2NCdzIFRD
T04wIGNhbiBvdXRwdXQgUkdCNjY2IExDRCBzaWduYWwuCgpBZGQgaXRzIHBpbm11eC4KClNpZ25l
ZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KU2lnbmVkLW9mZi1ieTog
VmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogVG9y
c3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+Ci0tLQoKb3JpZ2luYWxseTogcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcGF0Y2gvMTA4MTQxNzkKCkFsbW9zdCB0cml2aWFsLCBhbmQgb2J2aW91c2x5IGNvcnJl
Y3QuCkkgYWRkZWQgdGhlIC9vbWl0LWlmLW5vLXJlZi8uCgotLS0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaSB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3
aW5uZXIvc3VuNTBpLWE2NC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
NTBpLWE2NC5kdHNpCmluZGV4IDJhYmIzMzUxNDVhNi4uYThiYmVlODRlN2RhIDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpCkBAIC01NTksNiArNTU5
LDE2IEBACiAJCQkJZnVuY3Rpb24gPSAiaTJjMSI7CiAJCQl9OwoKKwkJCS9vbWl0LWlmLW5vLXJl
Zi8KKwkJCWxjZF9yZ2I2NjZfcGluczogbGNkLXJnYjY2NiB7CisJCQkJcGlucyA9ICJQRDAiLCAi
UEQxIiwgIlBEMiIsICJQRDMiLCAiUEQ0IiwKKwkJCQkgICAgICAgIlBENSIsICJQRDYiLCAiUEQ3
IiwgIlBEOCIsICJQRDkiLAorCQkJCSAgICAgICAiUEQxMCIsICJQRDExIiwgIlBEMTIiLCAiUEQx
MyIsCisJCQkJICAgICAgICJQRDE0IiwgIlBEMTUiLCAiUEQxNiIsICJQRDE3IiwKKwkJCQkgICAg
ICAgIlBEMTgiLCAiUEQxOSIsICJQRDIwIiwgIlBEMjEiOworCQkJCWZ1bmN0aW9uID0gImxjZDAi
OworCQkJfTsKKwogCQkJbW1jMF9waW5zOiBtbWMwLXBpbnMgewogCQkJCXBpbnMgPSAiUEYwIiwg
IlBGMSIsICJQRjIiLCAiUEYzIiwKIAkJCQkgICAgICAgIlBGNCIsICJQRjUiOwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
