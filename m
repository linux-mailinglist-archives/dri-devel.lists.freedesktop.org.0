Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6BF2B6C4A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ABA89FA9;
	Tue, 17 Nov 2020 17:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D9989C18
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id CC1FCFB03;
 Tue, 17 Nov 2020 18:49:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_Wl2C1TqWdj; Tue, 17 Nov 2020 18:49:41 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 264BB43F70; Tue, 17 Nov 2020 18:49:38 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megous@megous.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 allen <allen.chen@ite.com.tw>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] drm/panel: mantix: Support panel from Shenzhen Yashi
 Changhua Intelligent Technology Co
Date: Tue, 17 Nov 2020 18:49:35 +0100
Message-Id: <905595a5a25c6b8fb7760877fb93d057e98ce717.1605635248.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605635248.git.agx@sigxcpu.org>
References: <cover.1605635248.git.agx@sigxcpu.org>
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

VGhlIHBhbmVsIHVzZXMgdGhlIHNhbWUgZHJpdmVyIElDIGFuZCBoYXMgdGhlIHNhbWUgcmVzb2x1
dGlvbiBidXQgYQpzbGlnaHRseSBkaWZmZXJlbnQgZGVmYXVsdCBtb2RlLiBJdCBzZWVtcyBpdCBj
YW4gd29yayB3aXRoIHRoZSBzYW1lCmluaXQgc2VxdWVuY2UuCgpTaWduZWQtb2ZmLWJ5OiBHdWlk
byBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1tYW50aXgtbWxhZjA1N3dlNTEuYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jCmluZGV4IGIwNTc4NTcxNjViMC4uMzBmMjhhZDRkZjZi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4LW1sYWYwNTd3
ZTUxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1
MS5jCkBAIC0yMDUsNiArMjA1LDIxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSBkZWZhdWx0X21vZGVfbWFudGl4ID0gewogCS5oZWlnaHRfbW0gICA9IDEzMCwKIH07CiAK
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBkZWZhdWx0X21vZGVfeXMgPSB7
CisJLmhkaXNwbGF5ICAgID0gNzIwLAorCS5oc3luY19zdGFydCA9IDcyMCArIDQ1LAorCS5oc3lu
Y19lbmQgICA9IDcyMCArIDQ1ICsgMTQsCisJLmh0b3RhbAkgICAgID0gNzIwICsgNDUgKyAxNCAr
IDI1LAorCS52ZGlzcGxheSAgICA9IDE0NDAsCisJLnZzeW5jX3N0YXJ0ID0gMTQ0MCArIDE3NSwK
KwkudnN5bmNfZW5kICAgPSAxNDQwICsgMTc1ICsgOCwKKwkudnRvdGFsCSAgICAgPSAxNDQwICsg
MTc1ICsgOCArIDUwLAorCS5jbG9jawkgICAgID0gODUyOTgsCisJLmZsYWdzCSAgICAgPSBEUk1f
TU9ERV9GTEFHX05IU1lOQyB8IERSTV9NT0RFX0ZMQUdfTlZTWU5DLAorCS53aWR0aF9tbSAgICA9
IDY1LAorCS5oZWlnaHRfbW0gICA9IDEzMCwKK307CisKIHN0YXRpYyBpbnQgbWFudGl4X2dldF9t
b2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKIAkJCSAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yKQogewpAQCAtMzI2LDYgKzM0MSw3IEBAIHN0YXRpYyBpbnQgbWFudGl4X3Jl
bW92ZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG1hbnRpeF9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAibWFu
dGl4LG1sYWYwNTd3ZTUxLXgiLCAuZGF0YSA9ICZkZWZhdWx0X21vZGVfbWFudGl4IH0sCisJeyAu
Y29tcGF0aWJsZSA9ICJ5cyx5czU3cHNzMzZiaDVncSIsIC5kYXRhID0gJmRlZmF1bHRfbW9kZV95
cyB9LAogCXsgLyogc2VudGluZWwgKi8gfQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1h
bnRpeF9vZl9tYXRjaCk7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
