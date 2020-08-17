Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93B245EFF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 10:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26EB6E505;
	Mon, 17 Aug 2020 08:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685016E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 08:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 92151FB02;
 Mon, 17 Aug 2020 10:14:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbB1GIar5kar; Mon, 17 Aug 2020 10:14:39 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 47AAF457CC; Mon, 17 Aug 2020 10:14:36 +0200 (CEST)
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
Subject: [PATCH v3 2/3] dt-bindings: Add Mantix MLAF057WE51-X panel bindings
Date: Mon, 17 Aug 2020 10:14:35 +0200
Message-Id: <b84c8c00ee1dcf545903a475872e1ae62b5f43ea.1597652012.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597652012.git.agx@sigxcpu.org>
References: <cover.1597652012.git.agx@sigxcpu.org>
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
R3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1
N3dlNTEteC55YW1sICAgfCA3MCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NzAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1MS14LnlhbWwKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwLi45MzczMjNjYzlhYWFjCi0tLSAvZGV2L251
bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
bWFudGl4LG1sYWYwNTd3ZTUxLXgueWFtbApAQCAtMCwwICsxLDcwIEBACisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IG9yIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgor
LS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvbWFu
dGl4LG1sYWYwNTd3ZTUxLXgueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogTWFudGl4IE1MQUYwNTdXRTUxLVggNS43
IiA3MjB4MTQ0MCBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIEd1aWRvIEfDvG50
aGVyIDxhZ3hAc2lneGNwdS5vcmc+CisKK2Rlc2NyaXB0aW9uOgorICBNYW50aXggTUxBRjA1N1dF
NTEgWCBpcyBhIDcyMHgxNDQwIFRGVCBMQ0QgcGFuZWwgY29ubmVjdGVkIHVzaW5nCisgIGEgTUlQ
SS1EU0kgdmlkZW8gaW50ZXJmYWNlLgorCithbGxPZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24u
eWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVtOgorICAgICAgLSBt
YW50aXgsbWxhZjA1N3dlNTEteAorCisgIHBvcnQ6IHRydWUKKyAgcmVnOgorICAgIG1heEl0ZW1z
OiAxCisgICAgZGVzY3JpcHRpb246IERTSSB2aXJ0dWFsIGNoYW5uZWwKKworICBhdmRkLXN1cHBs
eToKKyAgICBkZXNjcmlwdGlvbjogUG9zaXRpdmUgYW5hbG9nIHBvd2VyIHN1cHBseQorCisgIGF2
ZWUtc3VwcGx5OgorICAgIGRlc2NyaXB0aW9uOiBOZWdhdGl2ZSBhbmFsb2cgcG93ZXIgc3VwcGx5
CisKKyAgdmRkaS1zdXBwbHk6CisgICAgZGVzY3JpcHRpb246IDEuOFYgSS9PIHZvbHRhZ2Ugc3Vw
cGx5CisKKyAgcmVzZXQtZ3Bpb3M6IHRydWUKKworICBiYWNrbGlnaHQ6IHRydWUKKworcmVxdWly
ZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGF2ZGQtc3VwcGx5CisgIC0gYXZlZS1z
dXBwbHkKKyAgLSB2ZGRpLXN1cHBseQorICAtIHJlc2V0LWdwaW9zCisKK2FkZGl0aW9uYWxQcm9w
ZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2dwaW8vZ3Bpby5oPgorCisgICAgZHNpIHsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICBwYW5lbEAwIHsKKyAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAibWFudGl4LG1sYWYwNTd3ZTUxLXgiOworICAgICAgICAgICAg
cmVnID0gPDA+OworICAgICAgICAgICAgYXZkZC1zdXBwbHkgPSA8JnJlZ19hdmRkPjsKKyAgICAg
ICAgICAgIGF2ZWUtc3VwcGx5ID0gPCZyZWdfYXZlZT47CisgICAgICAgICAgICB2ZGRpLXN1cHBs
eSA9IDwmcmVnXzF2OF9wPjsKKyAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZncGlvMSAyOSBH
UElPX0FDVElWRV9MT1c+OworICAgICAgICAgICAgYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+Owor
ICAgICAgICB9OworICAgIH07CisKKy4uLgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
