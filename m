Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3832B6C47
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA8C89C53;
	Tue, 17 Nov 2020 17:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDCF89C18
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 307E3FB06;
 Tue, 17 Nov 2020 18:49:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkV4DqBNRPAi; Tue, 17 Nov 2020 18:49:43 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 215EF43F71; Tue, 17 Nov 2020 18:49:38 +0100 (CET)
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
Subject: [PATCH v1 3/6] drm/panel: mantix: Allow to specify default mode for
 different panels
Date: Tue, 17 Nov 2020 18:49:34 +0100
Message-Id: <567ba3729289c2cf907bda2578e97752e20e143b.1605635248.git.agx@sigxcpu.org>
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

VGhpcyBjYW4gYmUgdXNlZCB0byB1c2UgZGlmZmVyZW50IG1vZGVzIGZvciBkaWZmZXJudCBwYW5l
bHMgdmlhIE9GCmRldmljZSBtYXRjaC4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxh
Z3hAc2lneGNwdS5vcmc+Ci0tLQogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4LW1sYWYw
NTd3ZTUxLmMgICB8IDE4ICsrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jCmluZGV4IDYyNGQxN2I5NmE2OS4uYjA1Nzg1NzE2
NWIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbWFudGl4LW1sYWYw
NTd3ZTUxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3
d2U1MS5jCkBAIC05LDYgKzksNyBAQAogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVk
ZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2lu
Y2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25z
dW1lci5oPgogCiAjaW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+CkBAIC0zNCw2ICszNSw4
IEBAIHN0cnVjdCBtYW50aXggewogCXN0cnVjdCByZWd1bGF0b3IgKmF2ZGQ7CiAJc3RydWN0IHJl
Z3VsYXRvciAqYXZlZTsKIAlzdHJ1Y3QgcmVndWxhdG9yICp2ZGRpOworCisJY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKmRlZmF1bHRfbW9kZTsKIH07CiAKIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IG1hbnRpeCAqcGFuZWxfdG9fbWFudGl4KHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQpAQCAt
MTg3LDcgKzE5MCw3IEBAIHN0YXRpYyBpbnQgbWFudGl4X3ByZXBhcmUoc3RydWN0IGRybV9wYW5l
bCAqcGFuZWwpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSBkZWZhdWx0X21vZGUgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgZGVmYXVsdF9tb2RlX21hbnRpeCA9IHsKIAkuaGRpc3BsYXkgICAgPSA3MjAsCiAJLmhz
eW5jX3N0YXJ0ID0gNzIwICsgNDUsCiAJLmhzeW5jX2VuZCAgID0gNzIwICsgNDUgKyAxNCwKQEAg
LTIwOCwxMSArMjExLDExIEBAIHN0YXRpYyBpbnQgbWFudGl4X2dldF9tb2RlcyhzdHJ1Y3QgZHJt
X3BhbmVsICpwYW5lbCwKIAlzdHJ1Y3QgbWFudGl4ICpjdHggPSBwYW5lbF90b19tYW50aXgocGFu
ZWwpOwogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwogCi0JbW9kZSA9IGRybV9tb2Rl
X2R1cGxpY2F0ZShjb25uZWN0b3ItPmRldiwgJmRlZmF1bHRfbW9kZSk7CisJbW9kZSA9IGRybV9t
b2RlX2R1cGxpY2F0ZShjb25uZWN0b3ItPmRldiwgY3R4LT5kZWZhdWx0X21vZGUpOwogCWlmICgh
bW9kZSkgewogCQlkZXZfZXJyKGN0eC0+ZGV2LCAiRmFpbGVkIHRvIGFkZCBtb2RlICV1eCV1QCV1
XG4iLAotCQkJZGVmYXVsdF9tb2RlLmhkaXNwbGF5LCBkZWZhdWx0X21vZGUudmRpc3BsYXksCi0J
CQlkcm1fbW9kZV92cmVmcmVzaCgmZGVmYXVsdF9tb2RlKSk7CisJCQljdHgtPmRlZmF1bHRfbW9k
ZS0+aGRpc3BsYXksIGN0eC0+ZGVmYXVsdF9tb2RlLT52ZGlzcGxheSwKKwkJCWRybV9tb2RlX3Zy
ZWZyZXNoKGN0eC0+ZGVmYXVsdF9tb2RlKSk7CiAJCXJldHVybiAtRU5PTUVNOwogCX0KIApAQCAt
MjQzLDYgKzI0Niw3IEBAIHN0YXRpYyBpbnQgbWFudGl4X3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9k
ZXZpY2UgKmRzaSkKIAljdHggPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmN0eCksIEdGUF9L
RVJORUwpOwogCWlmICghY3R4KQogCQlyZXR1cm4gLUVOT01FTTsKKwljdHgtPmRlZmF1bHRfbW9k
ZSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwogCiAJY3R4LT5yZXNldF9ncGlvID0g
ZGV2bV9ncGlvZF9nZXQoZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfSElHSCk7CiAJaWYgKElTX0VS
UihjdHgtPnJlc2V0X2dwaW8pKSB7CkBAIC0yOTMsOCArMjk3LDggQEAgc3RhdGljIGludCBtYW50
aXhfcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCX0KIAogCWRldl9pbmZvKGRl
diwgIiV1eCV1QCV1ICV1YnBwIGRzaSAldWRsIC0gcmVhZHlcbiIsCi0JCSBkZWZhdWx0X21vZGUu
aGRpc3BsYXksIGRlZmF1bHRfbW9kZS52ZGlzcGxheSwKLQkJIGRybV9tb2RlX3ZyZWZyZXNoKCZk
ZWZhdWx0X21vZGUpLAorCQkgY3R4LT5kZWZhdWx0X21vZGUtPmhkaXNwbGF5LCBjdHgtPmRlZmF1
bHRfbW9kZS0+dmRpc3BsYXksCisJCSBkcm1fbW9kZV92cmVmcmVzaChjdHgtPmRlZmF1bHRfbW9k
ZSksCiAJCSBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKGRzaS0+Zm9ybWF0KSwgZHNpLT5s
YW5lcyk7CiAKIAlyZXR1cm4gMDsKQEAgLTMyMSw3ICszMjUsNyBAQCBzdGF0aWMgaW50IG1hbnRp
eF9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogfQogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBtYW50aXhfb2ZfbWF0Y2hbXSA9IHsKLQl7IC5jb21wYXRpYmxl
ID0gIm1hbnRpeCxtbGFmMDU3d2U1MS14IiB9LAorCXsgLmNvbXBhdGlibGUgPSAibWFudGl4LG1s
YWYwNTd3ZTUxLXgiLCAuZGF0YSA9ICZkZWZhdWx0X21vZGVfbWFudGl4IH0sCiAJeyAvKiBzZW50
aW5lbCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWFudGl4X29mX21hdGNoKTsK
LS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
