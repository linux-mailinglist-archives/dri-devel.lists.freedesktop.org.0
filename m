Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DBC2B78AC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A313D89FD1;
	Wed, 18 Nov 2020 08:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D5A89D1D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5AA5CFB02;
 Wed, 18 Nov 2020 09:29:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWA76rKSOx8C; Wed, 18 Nov 2020 09:29:55 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 9840843F6E; Wed, 18 Nov 2020 09:29:53 +0100 (CET)
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
Subject: [PATCH v2 3/6] drm/panel: mantix: Allow to specify default mode for
 different panels
Date: Wed, 18 Nov 2020 09:29:50 +0100
Message-Id: <2580dba34c95a8159c1bdfd07604fbb8dbd0ad8c.1605688147.git.agx@sigxcpu.org>
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

VGhpcyBjYW4gYmUgdXNlZCB0byB1c2UgZGlmZmVyZW50IG1vZGVzIGZvciBkaWZmZXJudCBwYW5l
bHMgdmlhIE9GCmRldmljZSBtYXRjaC4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxh
Z3hAc2lneGNwdS5vcmc+ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+Ci0tLQogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4LW1sYWYwNTd3
ZTUxLmMgICB8IDE4ICsrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jCmluZGV4IDYyNGQxN2I5NmE2OS4uYjA1Nzg1NzE2NWIw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4LW1sYWYwNTd3
ZTUxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1
MS5jCkBAIC05LDYgKzksNyBAQAogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8
bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1
ZGUgPGxpbnV4L29mX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1l
ci5oPgogCiAjaW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+CkBAIC0zNCw2ICszNSw4IEBA
IHN0cnVjdCBtYW50aXggewogCXN0cnVjdCByZWd1bGF0b3IgKmF2ZGQ7CiAJc3RydWN0IHJlZ3Vs
YXRvciAqYXZlZTsKIAlzdHJ1Y3QgcmVndWxhdG9yICp2ZGRpOworCisJY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKmRlZmF1bHRfbW9kZTsKIH07CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0
IG1hbnRpeCAqcGFuZWxfdG9fbWFudGl4KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQpAQCAtMTg3
LDcgKzE5MCw3IEBAIHN0YXRpYyBpbnQgbWFudGl4X3ByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAq
cGFuZWwpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSBkZWZhdWx0X21vZGUgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgZGVmYXVsdF9tb2RlX21hbnRpeCA9IHsKIAkuaGRpc3BsYXkgICAgPSA3MjAsCiAJLmhzeW5j
X3N0YXJ0ID0gNzIwICsgNDUsCiAJLmhzeW5jX2VuZCAgID0gNzIwICsgNDUgKyAxNCwKQEAgLTIw
OCwxMSArMjExLDExIEBAIHN0YXRpYyBpbnQgbWFudGl4X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3Bh
bmVsICpwYW5lbCwKIAlzdHJ1Y3QgbWFudGl4ICpjdHggPSBwYW5lbF90b19tYW50aXgocGFuZWwp
OwogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwogCi0JbW9kZSA9IGRybV9tb2RlX2R1
cGxpY2F0ZShjb25uZWN0b3ItPmRldiwgJmRlZmF1bHRfbW9kZSk7CisJbW9kZSA9IGRybV9tb2Rl
X2R1cGxpY2F0ZShjb25uZWN0b3ItPmRldiwgY3R4LT5kZWZhdWx0X21vZGUpOwogCWlmICghbW9k
ZSkgewogCQlkZXZfZXJyKGN0eC0+ZGV2LCAiRmFpbGVkIHRvIGFkZCBtb2RlICV1eCV1QCV1XG4i
LAotCQkJZGVmYXVsdF9tb2RlLmhkaXNwbGF5LCBkZWZhdWx0X21vZGUudmRpc3BsYXksCi0JCQlk
cm1fbW9kZV92cmVmcmVzaCgmZGVmYXVsdF9tb2RlKSk7CisJCQljdHgtPmRlZmF1bHRfbW9kZS0+
aGRpc3BsYXksIGN0eC0+ZGVmYXVsdF9tb2RlLT52ZGlzcGxheSwKKwkJCWRybV9tb2RlX3ZyZWZy
ZXNoKGN0eC0+ZGVmYXVsdF9tb2RlKSk7CiAJCXJldHVybiAtRU5PTUVNOwogCX0KIApAQCAtMjQz
LDYgKzI0Niw3IEBAIHN0YXRpYyBpbnQgbWFudGl4X3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZp
Y2UgKmRzaSkKIAljdHggPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmN0eCksIEdGUF9LRVJO
RUwpOwogCWlmICghY3R4KQogCQlyZXR1cm4gLUVOT01FTTsKKwljdHgtPmRlZmF1bHRfbW9kZSA9
IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwogCiAJY3R4LT5yZXNldF9ncGlvID0gZGV2
bV9ncGlvZF9nZXQoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfSElHSCk7CiAJaWYgKElTX0VSUihj
dHgtPnJlc2V0X2dwaW8pKSB7CkBAIC0yOTMsOCArMjk3LDggQEAgc3RhdGljIGludCBtYW50aXhf
cHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCX0KIAogCWRldl9pbmZvKGRldiwg
IiV1eCV1QCV1ICV1YnBwIGRzaSAldWRsIC0gcmVhZHlcbiIsCi0JCSBkZWZhdWx0X21vZGUuaGRp
c3BsYXksIGRlZmF1bHRfbW9kZS52ZGlzcGxheSwKLQkJIGRybV9tb2RlX3ZyZWZyZXNoKCZkZWZh
dWx0X21vZGUpLAorCQkgY3R4LT5kZWZhdWx0X21vZGUtPmhkaXNwbGF5LCBjdHgtPmRlZmF1bHRf
bW9kZS0+dmRpc3BsYXksCisJCSBkcm1fbW9kZV92cmVmcmVzaChjdHgtPmRlZmF1bHRfbW9kZSks
CiAJCSBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKGRzaS0+Zm9ybWF0KSwgZHNpLT5sYW5l
cyk7CiAKIAlyZXR1cm4gMDsKQEAgLTMyMSw3ICszMjUsNyBAQCBzdGF0aWMgaW50IG1hbnRpeF9y
ZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogfQogCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBtYW50aXhfb2ZfbWF0Y2hbXSA9IHsKLQl7IC5jb21wYXRpYmxlID0g
Im1hbnRpeCxtbGFmMDU3d2U1MS14IiB9LAorCXsgLmNvbXBhdGlibGUgPSAibWFudGl4LG1sYWYw
NTd3ZTUxLXgiLCAuZGF0YSA9ICZkZWZhdWx0X21vZGVfbWFudGl4IH0sCiAJeyAvKiBzZW50aW5l
bCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWFudGl4X29mX21hdGNoKTsKLS0g
CjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
