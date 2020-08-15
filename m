Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D02451D7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 23:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2B56E0C4;
	Sat, 15 Aug 2020 21:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B61E6E0C4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 1F9E9FB09;
 Sat, 15 Aug 2020 23:16:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8q8YHSa3Wsh; Sat, 15 Aug 2020 23:16:23 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A05FD4576F; Sat, 15 Aug 2020 23:16:22 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 allen <allen.chen@ite.com.tw>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Date: Sat, 15 Aug 2020 23:16:19 +0200
Message-Id: <cover.1597526107.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoZSBwYW5lbCB1c2VzIGEgRm9jYWx0ZWNoIEZUODAwNnAsIHRoZSB0b3VjaCBwYXJ0IGlzIGhh
bmRsZWQgYnkgdGhlIGFscmVhZHkKZXhpc3RpbmcgZWR0LWZ0NXgwNi4gSXQgY2FuIGJlIGZvdW5k
IGluIGUuZy4gdGhlIExpYnJlbSA1LgoKQ2hhbmdlcyBmcm9tIHYxOgotIER1ZSB0byByZXZpZXcg
Y29tbWVudHMgYnkgU2FtIFJhdm5ib3JnLCB0aGFua3MhCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvZHJpLWRldmVsLzIwMjAwODE1MDgzOTE3LkdBOTkzMTEzQHJhdm5ib3JnLm9yZy8KICAtIERv
bid0IHByZXNlcnZlIG5ld2xpbmVzIHdpdGggJ3wnIGluIGRlc2NyaXB0aW9uCiAgLSBVc2UgcmVz
ZXQtZ3Bpb3MgYW5kIGJhY2tsaWdodCBmcm9tIHBhbmVsLWNvbW1vbi55YW1sCiAgLSBSZWluZGVu
dCBleGFtcGxlCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjAwODE1MDkz
MjI2LkdCOTkzMTEzQHJhdm5ib3JnLm9yZy8KICAtIERyb3AgdW51c2VkIGluY2x1ZGVzCiAgLSBV
c2UgZGV2XyogaW5zdGVhZCBvZiBEUk1fKiBmb3IgcHJpbnRpbmcKICAtIFR1cm4gb2ZmIHJlZ3Vs
YXRvcnMgaW4gcmV2ZXJzZSBvcmRlciBmcm9tIGVuYWJsZQogIC0gU2lsZW5jZSBlcnJvcnMgaW4g
bWFudGl4X3tzaHV0ZG93bixyZW1vdmV9CiAgLSBEcm9wIGR1cGxpY2F0ZSBtaXBpX2RzaV9kY3Nf
ZW50ZXJfc2xlZXBfbW9kZSgpCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIw
MjAwODE1MTAwMjMwLkdBMTAwMjM3NEByYXZuYm9yZy5vcmcvCiAgLSBVc2UgZGV2X2Vycl9wcm9i
ZSgpCi0gQWRkIGRlbGF5cyB3aGVuIHR1cm5pbmcgb2ZmIHBhbmVsIGFzIHN1Z2dlc3RlZCBieSB0
aGUgZGF0YSBzaGVldAoKVGhpcyBzZXJpZXMgaXMgYWdhaW5zdCBuZXh0LTIwMjAwODE0LgoKR3Vp
ZG8gR8O8bnRoZXIgKDMpOgogIGR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IEFkZCBtYW50
aXggdmVuZG9yIHByZWZpeAogIGR0LWJpbmRpbmdzOiBBZGQgTWFudGl4IE1MQUYwNTdXRTUxLVgg
cGFuZWwgYmluZGluZ3MKICBkcm0vcGFuZWw6IEFkZCBwYW5lbCBkcml2ZXIgZm9yIHRoZSBNYW50
aXggTUxBRjA1N1dFNTEtWCBEU0kgcGFuZWwKCiAuLi4vZGlzcGxheS9wYW5lbC9tYW50aXgsbWxh
ZjA1N3dlNTEteC55YW1sICAgfCAgNzAgKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwgIHwgICAyICsKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNyArCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgfCAgMTEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAg
ICAgICAgICAgICAgIHwgICAxICsKIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFm
MDU3d2U1MS5jICB8IDMyOCArKysrKysrKysrKysrKysrKysKIDYgZmlsZXMgY2hhbmdlZCwgNDE5
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3
d2U1MS5jCgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
