Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4062451DA
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 23:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E03B6E128;
	Sat, 15 Aug 2020 21:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEAD6E122
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D7615FB07;
 Sat, 15 Aug 2020 23:16:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mz3qJxvJKjuI; Sat, 15 Aug 2020 23:16:28 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id AC104457CD; Sat, 15 Aug 2020 23:16:22 +0200 (CEST)
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
Subject: [PATCH v2 2/3] dt-bindings: Add Mantix MLAF057WE51-X panel bindings
Date: Sat, 15 Aug 2020 23:16:21 +0200
Message-Id: <c171b488e883e26eaef7906c007a5cabcbf9e33d.1597526107.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597526107.git.agx@sigxcpu.org>
References: <cover.1597526107.git.agx@sigxcpu.org>
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

VGhlIHBhbmVsIHVzZXMgYSBGb2NhbHRlY2ggRlQ4MDA2cCwgdGhlIHRvdWNoIHBhcnQgaXMgaGFu
ZGxlZCBieSB0aGUKYWxyZWFkeSBleGlzdGluZyBlZHQtZnQ1eDA2LgoKU2lnbmVkLW9mZi1ieTog
R3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9t
YW50aXgsbWxhZjA1N3dlNTEteC55YW1sICAgfCA3MCArKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1
MS14LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFt
bApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwLi45MzczMjNjYzlhYWFj
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbApAQCAtMCwwICsxLDcwIEBACisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IG9yIEJTRC0yLUNsYXVzZSkK
KyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3Bs
YXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogTWFudGl4IE1MQUYw
NTdXRTUxLVggNS43IiA3MjB4MTQ0MCBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJzOgorICAt
IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CisKK2Rlc2NyaXB0aW9uOgorICBNYW50
aXggTUxBRjA1N1dFNTEgWCBpcyBhIDcyMHgxNDQwIFRGVCBMQ0QgcGFuZWwgY29ubmVjdGVkIHVz
aW5nCisgIGEgTUlQSS1EU0kgdmlkZW8gaW50ZXJmYWNlLgorCithbGxPZjoKKyAgLSAkcmVmOiBw
YW5lbC1jb21tb24ueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVt
OgorICAgICAgLSBtYW50aXgsbWxhZjA1N3dlNTEteAorCisgIHBvcnQ6IHRydWUKKyAgcmVnOgor
ICAgIG1heEl0ZW1zOiAxCisgICAgZGVzY3JpcHRpb246IERTSSB2aXJ0dWFsIGNoYW5uZWwKKwor
ICBhdmRkLXN1cHBseToKKyAgICBkZXNjcmlwdGlvbjogUG9zaXRpdmUgYW5hbG9nIHBvd2VyIHN1
cHBseQorCisgIGF2ZWUtc3VwcGx5OgorICAgIGRlc2NyaXB0aW9uOiBOZWdhdGl2ZSBhbmFsb2cg
cG93ZXIgc3VwcGx5CisKKyAgdmRkaS1zdXBwbHk6CisgICAgZGVzY3JpcHRpb246IDEuOFYgSS9P
IHZvbHRhZ2Ugc3VwcGx5CisKKyAgcmVzZXQtZ3Bpb3M6IHRydWUKKworICBiYWNrbGlnaHQ6IHRy
dWUKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGF2ZGQtc3VwcGx5
CisgIC0gYXZlZS1zdXBwbHkKKyAgLSB2ZGRpLXN1cHBseQorICAtIHJlc2V0LWdwaW9zCisKK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgorCisgICAgZHNpIHsKKyAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICBwYW5l
bEAwIHsKKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWFudGl4LG1sYWYwNTd3ZTUxLXgiOwor
ICAgICAgICAgICAgcmVnID0gPDA+OworICAgICAgICAgICAgYXZkZC1zdXBwbHkgPSA8JnJlZ19h
dmRkPjsKKyAgICAgICAgICAgIGF2ZWUtc3VwcGx5ID0gPCZyZWdfYXZlZT47CisgICAgICAgICAg
ICB2ZGRpLXN1cHBseSA9IDwmcmVnXzF2OF9wPjsKKyAgICAgICAgICAgIHJlc2V0LWdwaW9zID0g
PCZncGlvMSAyOSBHUElPX0FDVElWRV9MT1c+OworICAgICAgICAgICAgYmFja2xpZ2h0ID0gPCZi
YWNrbGlnaHQ+OworICAgICAgICB9OworICAgIH07CisKKy4uLgotLSAKMi4yNi4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
