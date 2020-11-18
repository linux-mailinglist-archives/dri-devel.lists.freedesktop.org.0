Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1F2B78AE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672716E372;
	Wed, 18 Nov 2020 08:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296AA89FCE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 50FC5FB04;
 Wed, 18 Nov 2020 09:29:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScdGbqCgB9hZ; Wed, 18 Nov 2020 09:29:54 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8A4DD4026C; Wed, 18 Nov 2020 09:29:53 +0100 (CET)
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
Subject: [PATCH v2 1/6] drm/panel: st7703: Use dev_err_probe
Date: Wed, 18 Nov 2020 09:29:48 +0100
Message-Id: <36405038d93eb148f3e8ed8e5ea70de8e87afd78.1605688147.git.agx@sigxcpu.org>
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

TGVzcyBjb2RlIGFuZCBlYXNpZXIgcHJvYmUgZGVmZXJyYWwgZGVidWdnaW5nLgoKU2lnbmVkLW9m
Zi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KUmV2aWV3ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAzLmMgfCAyNCArKysrKysrLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAzLmMKaW5kZXggYjMwNTEwYjE2
OTZhLi5hMmMzMDNlNTczMmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaXRyb25peC1zdDc3MDMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0
cm9uaXgtc3Q3NzAzLmMKQEAgLTUzMCwxMCArNTMwLDggQEAgc3RhdGljIGludCBzdDc3MDNfcHJv
YmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCQlyZXR1cm4gLUVOT01FTTsKIAogCWN0
eC0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0xP
Vyk7Ci0JaWYgKElTX0VSUihjdHgtPnJlc2V0X2dwaW8pKSB7Ci0JCWRldl9lcnIoZGV2LCAiY2Fu
bm90IGdldCByZXNldCBncGlvXG4iKTsKLQkJcmV0dXJuIFBUUl9FUlIoY3R4LT5yZXNldF9ncGlv
KTsKLQl9CisJaWYgKElTX0VSUihjdHgtPnJlc2V0X2dwaW8pKQorCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIFBUUl9FUlIoY3R4LT5yZXNldF9ncGlvKSwgIkZhaWxlZCB0byBnZXQgcmVzZXQg
Z3Bpb1xuIik7CiAKIAltaXBpX2RzaV9zZXRfZHJ2ZGF0YShkc2ksIGN0eCk7CiAKQEAgLTU0NSwx
OSArNTQzLDEzIEBAIHN0YXRpYyBpbnQgc3Q3NzAzX3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZp
Y2UgKmRzaSkKIAlkc2ktPmxhbmVzID0gY3R4LT5kZXNjLT5sYW5lczsKIAogCWN0eC0+dmNjID0g
ZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInZjYyIpOwotCWlmIChJU19FUlIoY3R4LT52Y2MpKSB7
Ci0JCXJldCA9IFBUUl9FUlIoY3R4LT52Y2MpOwotCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIp
Ci0JCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZXF1ZXN0IHZjYyByZWd1bGF0b3I6ICVkXG4i
LCByZXQpOwotCQlyZXR1cm4gcmV0OwotCX0KKwlpZiAoSVNfRVJSKGN0eC0+dmNjKSkKKwkJcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGN0eC0+dmNjKSwgIkZhaWxlZCB0byByZXF1
ZXN0IHZjYyByZWd1bGF0b3JcbiIpOworCiAJY3R4LT5pb3ZjYyA9IGRldm1fcmVndWxhdG9yX2dl
dChkZXYsICJpb3ZjYyIpOwotCWlmIChJU19FUlIoY3R4LT5pb3ZjYykpIHsKLQkJcmV0ID0gUFRS
X0VSUihjdHgtPmlvdmNjKTsKLQkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQotCQkJZGV2X2Vy
cihkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBpb3ZjYyByZWd1bGF0b3I6ICVkXG4iLCByZXQpOwot
CQlyZXR1cm4gcmV0OwotCX0KKwlpZiAoSVNfRVJSKGN0eC0+aW92Y2MpKQorCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoY3R4LT5pb3ZjYyksCisJCQkJICAgICAiRmFpbGVkIHRv
IHJlcXVlc3QgaW92Y2MgcmVndWxhdG9yXG4iKTsKIAogCWRybV9wYW5lbF9pbml0KCZjdHgtPnBh
bmVsLCBkZXYsICZzdDc3MDNfZHJtX2Z1bmNzLAogCQkgICAgICAgRFJNX01PREVfQ09OTkVDVE9S
X0RTSSk7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
