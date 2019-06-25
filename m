Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB455574
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 19:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3890E6E1BA;
	Tue, 25 Jun 2019 17:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD966E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 4E704FB05;
 Tue, 25 Jun 2019 19:05:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3d_FJEAHz_q; Tue, 25 Jun 2019 19:05:24 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 6C67448E38; Tue, 25 Jun 2019 19:05:19 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH 4/4] drm/panel: jh057n0090: Add regulator support
Date: Tue, 25 Jun 2019 19:05:19 +0200
Message-Id: <b239f1db7a1f67988a9bd1ed62f6a1cf1dce944c.1561482165.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561482165.git.agx@sigxcpu.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

QWxsb3cgdG8gc3BlY2lmeSByZWd1bGF0b3JzIGZvciB2Y2MgYW5kIGlvdmNjLiBBY2NvcmRpbmcg
dG8gdGhlIGRhdGEKc2hlZXQgdGhlIHBhbmVsIHdhbnRzIHZjYyAoMi44VikgYW5kIGlvdmNjICgx
LjhWKSBhbmQgdGhlcmUncyBubyBzdGFydHVwCmRlcGVuZGVuY3kgYmV0d2VlbiB0aGUgdHdvLgoK
U2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiAuLi4v
ZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgICAgfCAxOSArKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKaW5kZXggYjhh
MDY5MDU1ZmJjLi5mOGY2ZjA4N2I5YmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVk
ZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L21lZGlhLWJ1cy1mb3Jt
YXQuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0
b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDx2aWRlby9kaXNwbGF5X3RpbWluZy5oPgogI2luY2x1
ZGUgPHZpZGVvL21pcGlfZGlzcGxheS5oPgogCkBAIC00Nyw2ICs0OCw4IEBAIHN0cnVjdCBqaDA1
N24gewogCXN0cnVjdCBkcm1fcGFuZWwgcGFuZWw7CiAJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRf
Z3BpbzsKIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFja2xpZ2h0OworCXN0cnVjdCByZWd1
bGF0b3IgKnZjYzsKKwlzdHJ1Y3QgcmVndWxhdG9yICppb3ZjYzsKIAlib29sIHByZXBhcmVkOwog
CiAJc3RydWN0IGRlbnRyeSAqZGVidWdmczsKQEAgLTE2MCw2ICsxNjMsOCBAQCBzdGF0aWMgaW50
IGpoMDU3bl91bnByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJCXJldHVybiAwOwog
CiAJbWlwaV9kc2lfZGNzX3NldF9kaXNwbGF5X29mZihkc2kpOworCXJlZ3VsYXRvcl9kaXNhYmxl
KGN0eC0+aW92Y2MpOworCXJlZ3VsYXRvcl9kaXNhYmxlKGN0eC0+dmNjKTsKIAljdHgtPnByZXBh
cmVkID0gZmFsc2U7CiAKIAlyZXR1cm4gMDsKQEAgLTE3NCw2ICsxNzksMTMgQEAgc3RhdGljIGlu
dCBqaDA1N25fcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAkJcmV0dXJuIDA7CiAK
IAlEUk1fREVWX0RFQlVHX0RSSVZFUihjdHgtPmRldiwgIlJlc2V0dGluZyB0aGUgcGFuZWxcbiIp
OworCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoY3R4LT52Y2MpOworCWlmIChyZXQgPCAwKQorCQly
ZXR1cm4gcmV0OworCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoY3R4LT5pb3ZjYyk7CisJaWYgKHJl
dCA8IDApCisJCXJldHVybiByZXQ7CisKIAlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoY3R4LT5y
ZXNldF9ncGlvLCAxKTsKIAl1c2xlZXBfcmFuZ2UoMjAsIDQwKTsKIAlncGlvZF9zZXRfdmFsdWVf
Y2Fuc2xlZXAoY3R4LT5yZXNldF9ncGlvLCAwKTsKQEAgLTMwMSw2ICszMTMsMTMgQEAgc3RhdGlj
IGludCBqaDA1N25fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpKQogCWlmIChJU19F
UlIoY3R4LT5iYWNrbGlnaHQpKQogCQlyZXR1cm4gUFRSX0VSUihjdHgtPmJhY2tsaWdodCk7CiAK
KwljdHgtPnZjYyA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJ2Y2MiKTsKKwlpZiAoSVNfRVJS
KGN0eC0+dmNjKSkKKwkJcmV0dXJuIFBUUl9FUlIoY3R4LT52Y2MpOworCWN0eC0+aW92Y2MgPSBk
ZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAiaW92Y2MiKTsKKwlpZiAoSVNfRVJSKGN0eC0+aW92Y2Mp
KQorCQlyZXR1cm4gUFRSX0VSUihjdHgtPmlvdmNjKTsKKwogCWRybV9wYW5lbF9pbml0KCZjdHgt
PnBhbmVsKTsKIAljdHgtPnBhbmVsLmRldiA9IGRldjsKIAljdHgtPnBhbmVsLmZ1bmNzID0gJmpo
MDU3bl9kcm1fZnVuY3M7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
