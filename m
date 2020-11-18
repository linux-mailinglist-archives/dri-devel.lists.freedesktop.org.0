Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000242B78AD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D910B89FE8;
	Wed, 18 Nov 2020 08:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E7189FCE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 837E1FB03;
 Wed, 18 Nov 2020 09:29:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKdmff-a6BE0; Wed, 18 Nov 2020 09:29:58 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B252E43F70; Wed, 18 Nov 2020 09:29:53 +0100 (CET)
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
Subject: [PATCH v2 4/6] drm/panel: mantix: Support panel from Shenzhen Yashi
 Changhua Intelligent Technology Co
Date: Wed, 18 Nov 2020 09:29:51 +0100
Message-Id: <8855b4fc681c675182ce33e0a6cba46bab2bac43.1605688147.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605688147.git.agx@sigxcpu.org>
References: <cover.1605688147.git.agx@sigxcpu.org>
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
byBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1tYW50aXgtbWxhZjA1N3dlNTEuYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LW1hbnRpeC1tbGFmMDU3d2U1MS5jCmluZGV4IGIwNTc4NTcxNjViMC4uMzBmMjhhZDRkZjZiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4LW1sYWYwNTd3ZTUx
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5j
CkBAIC0yMDUsNiArMjA1LDIxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSBkZWZhdWx0X21vZGVfbWFudGl4ID0gewogCS5oZWlnaHRfbW0gICA9IDEzMCwKIH07CiAKK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBkZWZhdWx0X21vZGVfeXMgPSB7CisJ
LmhkaXNwbGF5ICAgID0gNzIwLAorCS5oc3luY19zdGFydCA9IDcyMCArIDQ1LAorCS5oc3luY19l
bmQgICA9IDcyMCArIDQ1ICsgMTQsCisJLmh0b3RhbAkgICAgID0gNzIwICsgNDUgKyAxNCArIDI1
LAorCS52ZGlzcGxheSAgICA9IDE0NDAsCisJLnZzeW5jX3N0YXJ0ID0gMTQ0MCArIDE3NSwKKwku
dnN5bmNfZW5kICAgPSAxNDQwICsgMTc1ICsgOCwKKwkudnRvdGFsCSAgICAgPSAxNDQwICsgMTc1
ICsgOCArIDUwLAorCS5jbG9jawkgICAgID0gODUyOTgsCisJLmZsYWdzCSAgICAgPSBEUk1fTU9E
RV9GTEFHX05IU1lOQyB8IERSTV9NT0RFX0ZMQUdfTlZTWU5DLAorCS53aWR0aF9tbSAgICA9IDY1
LAorCS5oZWlnaHRfbW0gICA9IDEzMCwKK307CisKIHN0YXRpYyBpbnQgbWFudGl4X2dldF9tb2Rl
cyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwKIAkJCSAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQogewpAQCAtMzI2LDYgKzM0MSw3IEBAIHN0YXRpYyBpbnQgbWFudGl4X3JlbW92
ZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG1hbnRpeF9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAibWFudGl4
LG1sYWYwNTd3ZTUxLXgiLCAuZGF0YSA9ICZkZWZhdWx0X21vZGVfbWFudGl4IH0sCisJeyAuY29t
cGF0aWJsZSA9ICJ5cyx5czU3cHNzMzZiaDVncSIsIC5kYXRhID0gJmRlZmF1bHRfbW9kZV95cyB9
LAogCXsgLyogc2VudGluZWwgKi8gfQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1hbnRp
eF9vZl9tYXRjaCk7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
