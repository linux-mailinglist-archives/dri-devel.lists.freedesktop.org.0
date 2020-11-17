Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3126C2B6C45
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 18:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E8789C2C;
	Tue, 17 Nov 2020 17:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C3389C25
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 4613EFB02;
 Tue, 17 Nov 2020 18:49:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bi4BgJjUfn_G; Tue, 17 Nov 2020 18:49:40 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0FE9143F6D; Tue, 17 Nov 2020 18:49:38 +0100 (CET)
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
Subject: [PATCH v1 1/6] drm/panel: st7703: Use dev_err_probe
Date: Tue, 17 Nov 2020 18:49:32 +0100
Message-Id: <85b58da3eb68b81c1bdf7fc2f4a38b1f9ad8c90a.1605635248.git.agx@sigxcpu.org>
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

TGVzcyBjb2RlIGFuZCBlYXNpZXIgcHJvYmUgZGVmZXJyYWwgZGVidWdnaW5nLgoKU2lnbmVkLW9m
Zi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAzLmMgfCAyNCArKysrKysrLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAzLmMKaW5kZXggYjMwNTEw
YjE2OTZhLi5hMmMzMDNlNTczMmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaXRyb25peC1zdDc3MDMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2l0cm9uaXgtc3Q3NzAzLmMKQEAgLTUzMCwxMCArNTMwLDggQEAgc3RhdGljIGludCBzdDc3MDNf
cHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCQlyZXR1cm4gLUVOT01FTTsKIAog
CWN0eC0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgInJlc2V0IiwgR1BJT0RfT1VU
X0xPVyk7Ci0JaWYgKElTX0VSUihjdHgtPnJlc2V0X2dwaW8pKSB7Ci0JCWRldl9lcnIoZGV2LCAi
Y2Fubm90IGdldCByZXNldCBncGlvXG4iKTsKLQkJcmV0dXJuIFBUUl9FUlIoY3R4LT5yZXNldF9n
cGlvKTsKLQl9CisJaWYgKElTX0VSUihjdHgtPnJlc2V0X2dwaW8pKQorCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIFBUUl9FUlIoY3R4LT5yZXNldF9ncGlvKSwgIkZhaWxlZCB0byBnZXQgcmVz
ZXQgZ3Bpb1xuIik7CiAKIAltaXBpX2RzaV9zZXRfZHJ2ZGF0YShkc2ksIGN0eCk7CiAKQEAgLTU0
NSwxOSArNTQzLDEzIEBAIHN0YXRpYyBpbnQgc3Q3NzAzX3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9k
ZXZpY2UgKmRzaSkKIAlkc2ktPmxhbmVzID0gY3R4LT5kZXNjLT5sYW5lczsKIAogCWN0eC0+dmNj
ID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInZjYyIpOwotCWlmIChJU19FUlIoY3R4LT52Y2Mp
KSB7Ci0JCXJldCA9IFBUUl9FUlIoY3R4LT52Y2MpOwotCQlpZiAocmV0ICE9IC1FUFJPQkVfREVG
RVIpCi0JCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZXF1ZXN0IHZjYyByZWd1bGF0b3I6ICVk
XG4iLCByZXQpOwotCQlyZXR1cm4gcmV0OwotCX0KKwlpZiAoSVNfRVJSKGN0eC0+dmNjKSkKKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGN0eC0+dmNjKSwgIkZhaWxlZCB0byBy
ZXF1ZXN0IHZjYyByZWd1bGF0b3JcbiIpOworCiAJY3R4LT5pb3ZjYyA9IGRldm1fcmVndWxhdG9y
X2dldChkZXYsICJpb3ZjYyIpOwotCWlmIChJU19FUlIoY3R4LT5pb3ZjYykpIHsKLQkJcmV0ID0g
UFRSX0VSUihjdHgtPmlvdmNjKTsKLQkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQotCQkJZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBpb3ZjYyByZWd1bGF0b3I6ICVkXG4iLCByZXQp
OwotCQlyZXR1cm4gcmV0OwotCX0KKwlpZiAoSVNfRVJSKGN0eC0+aW92Y2MpKQorCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoY3R4LT5pb3ZjYyksCisJCQkJICAgICAiRmFpbGVk
IHRvIHJlcXVlc3QgaW92Y2MgcmVndWxhdG9yXG4iKTsKIAogCWRybV9wYW5lbF9pbml0KCZjdHgt
PnBhbmVsLCBkZXYsICZzdDc3MDNfZHJtX2Z1bmNzLAogCQkgICAgICAgRFJNX01PREVfQ09OTkVD
VE9SX0RTSSk7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
