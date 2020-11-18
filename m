Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3902B78AF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936826E3D2;
	Wed, 18 Nov 2020 08:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9002F89FCE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 82547FB06;
 Wed, 18 Nov 2020 09:30:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgZV2SVzBAk1; Wed, 18 Nov 2020 09:29:57 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A295943F71; Wed, 18 Nov 2020 09:29:53 +0100 (CET)
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
Subject: [PATCH v2 2/6] drm/panel: mantix: Tweak init sequence
Date: Wed, 18 Nov 2020 09:29:49 +0100
Message-Id: <8451831b60d5ecb73a156613d98218a31bd55680.1605688147.git.agx@sigxcpu.org>
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

V2UndmUgc2VlbiBzb21lIChub24gcGVybWFuZW50KSBidXJuIGluIGFuZCBiYWQgd2hpdGUgYmFs
YW5jZQpvbiBzb21lIG9mIHRoZSBwYW5lbHMuIEFkZGluZyB0aGlzIGJpdCBmcm9tIGEgdmVuZG9y
IHN1cHBsaWVkCnNlcXVlbmNlIGZpeGVzIGl0LgoKRml4ZXM6IDcyOTY3ZDU2MTZkMyAoImRybS9w
YW5lbDogQWRkIHBhbmVsIGRyaXZlciBmb3IgdGhlIE1hbnRpeCBNTEFGMDU3V0U1MS1YIERTSSBw
YW5lbCIpClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+ClJl
dmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRpeC1tbGFmMDU3d2U1MS5jIHwgNSArKysr
KwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1tYW50aXgtbWxhZjA1N3dlNTEuYwppbmRleCAwYzVmMjJlOTVjMmQuLjYy
NGQxN2I5NmE2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW1hbnRp
eC1tbGFmMDU3d2U1MS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1tYW50aXgt
bWxhZjA1N3dlNTEuYwpAQCAtMjIsNiArMjIsNyBAQAogLyogTWFudWZhY3R1cmVyIHNwZWNpZmlj
IENvbW1hbmRzIHNlbmQgdmlhIERTSSAqLwogI2RlZmluZSBNQU5USVhfQ01EX09UUF9TVE9QX1JF
TE9BRF9NSVBJIDB4NDEKICNkZWZpbmUgTUFOVElYX0NNRF9JTlRfQ0FOQ0VMICAgICAgICAgICAw
eDRDCisjZGVmaW5lIE1BTlRJWF9DTURfU1BJX0ZJTklTSCAgICAgICAgICAgMHg5MAogCiBzdHJ1
Y3QgbWFudGl4IHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CkBAIC02Niw2ICs2NywxMCBAQCBzdGF0
aWMgaW50IG1hbnRpeF9pbml0X3NlcXVlbmNlKHN0cnVjdCBtYW50aXggKmN0eCkKIAlkc2lfZ2Vu
ZXJpY193cml0ZV9zZXEoZHNpLCAweDgwLCAweDY0LCAweDAwLCAweDY0LCAweDAwLCAweDAwKTsK
IAltc2xlZXAoMjApOwogCisJZHNpX2dlbmVyaWNfd3JpdGVfc2VxKGRzaSwgTUFOVElYX0NNRF9T
UElfRklOSVNILCAweEE1KTsKKwlkc2lfZ2VuZXJpY193cml0ZV9zZXEoZHNpLCBNQU5USVhfQ01E
X09UUF9TVE9QX1JFTE9BRF9NSVBJLCAweDAwLCAweDJGKTsKKwltc2xlZXAoMjApOworCiAJZGV2
X2RiZyhkZXYsICJQYW5lbCBpbml0IHNlcXVlbmNlIGRvbmVcbiIpOwogCXJldHVybiAwOwogfQot
LSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
