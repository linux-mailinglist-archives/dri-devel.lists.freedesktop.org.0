Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D3244A7E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 15:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92A26EB48;
	Fri, 14 Aug 2020 13:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFFA6EB48
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id BCE07FB04;
 Fri, 14 Aug 2020 15:36:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zK71oykmh5Vx; Fri, 14 Aug 2020 15:36:28 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 098AA457CD; Fri, 14 Aug 2020 15:36:24 +0200 (CEST)
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
Subject: [PATCH 2/3] dt-bindings: Add Mantix MLAF057WE51-X panel bindings
Date: Fri, 14 Aug 2020 15:36:22 +0200
Message-Id: <9345739df02b8b8630e7dccb61a80a7a7f692526.1597412076.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597412076.git.agx@sigxcpu.org>
References: <cover.1597412076.git.agx@sigxcpu.org>
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
YW50aXgsbWxhZjA1N3dlNTEteC55YW1sICAgfCA3MyArKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1
MS14LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFt
bApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwLi4zNDlmMzM4MGFjOTQw
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbApAQCAtMCwwICsxLDczIEBACisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IG9yIEJTRC0yLUNsYXVzZSkK
KyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3Bs
YXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogTWFudGl4IE1MQUYw
NTdXRTUxLVggNS43IiA3MjB4MTQ0MCBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJzOgorICAt
IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CisKK2Rlc2NyaXB0aW9uOiB8CisgICAg
ICAgICAgICAgTWFudGl4IE1MQUYwNTdXRTUxIFggaXMgYSA3MjB4MTQ0MCBURlQgTENEIHBhbmVs
CisgICAgICAgICAgICAgY29ubmVjdGVkIHVzaW5nIGEgTUlQSS1EU0kgdmlkZW8gaW50ZXJmYWNl
LgorCithbGxPZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKworcHJvcGVydGllczoK
KyAgY29tcGF0aWJsZToKKyAgICBlbnVtOgorICAgICAgLSBtYW50aXgsbWxhZjA1N3dlNTEteAor
CisgIHBvcnQ6IHRydWUKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisgICAgZGVzY3JpcHRpb246
IERTSSB2aXJ0dWFsIGNoYW5uZWwKKworICBhdmRkLXN1cHBseToKKyAgICBkZXNjcmlwdGlvbjog
UG9zaXRpdmUgYW5hbG9nIHBvd2VyIHN1cHBseQorCisgIGF2ZWUtc3VwcGx5OgorICAgIGRlc2Ny
aXB0aW9uOiBOZWdhdGl2ZSBhbmFsb2cgcG93ZXIgc3VwcGx5CisKKyAgdmRkaS1zdXBwbHk6Cisg
ICAgZGVzY3JpcHRpb246IDEuOFYgSS9PIHZvbHRhZ2Ugc3VwcGx5CisKKyAgcmVzZXQtZ3Bpb3M6
CisgICAgZGVzY3JpcHRpb246IEdQSU8gdXNlZCBmb3IgdGhlIHJlc2V0IHBpbgorICAgIG1heEl0
ZW1zOiAxCisKKyAgYmFja2xpZ2h0OgorICAgIGRlc2NyaXB0aW9uOiBCYWNrbGlnaHQgdXNlZCBi
eSB0aGUgcGFuZWwKKyAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
cGhhbmRsZSIKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGF2ZGQt
c3VwcGx5CisgIC0gYXZlZS1zdXBwbHkKKyAgLSB2ZGRpLXN1cHBseQorICAtIHJlc2V0LWdwaW9z
CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgorCisgICAgZHNpIHsKKyAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisgICAgICBwYW5l
bEAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJtYW50aXgsbWxhZjA1N3dlNTEteCI7CisgICAg
ICAgIHJlZyA9IDwwPjsKKyAgICAgICAgYXZkZC1zdXBwbHkgPSA8JnJlZ19hdmRkPjsKKyAgICAg
ICAgYXZlZS1zdXBwbHkgPSA8JnJlZ19hdmVlPjsKKyAgICAgICAgdmRkaS1zdXBwbHkgPSA8JnJl
Z18xdjhfcD47CisgICAgICAgIHJlc2V0LWdwaW9zID0gPCZncGlvMSAyOSBHUElPX0FDVElWRV9M
T1c+OworICAgICAgICBiYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CisgICAgICB9OworICAgIH07
CisuLi4KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
