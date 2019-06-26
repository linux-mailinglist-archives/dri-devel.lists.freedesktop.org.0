Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14948566E8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD06E377;
	Wed, 26 Jun 2019 10:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4639C6E377
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 94CBBFB02;
 Wed, 26 Jun 2019 12:37:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUAc3Ui--vey; Wed, 26 Jun 2019 12:37:54 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A7A9748EB0; Wed, 26 Jun 2019 12:37:51 +0200 (CEST)
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
Subject: [PATCH v2 4/4] drm/panel: jh057n00900: Add regulator support
Date: Wed, 26 Jun 2019 12:37:51 +0200
Message-Id: <f78611fb26329e50ec1533810fbb76562f2f4e48.1561542477.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561542477.git.agx@sigxcpu.org>
References: <cover.1561542477.git.agx@sigxcpu.org>
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
ZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgICAgfCA0MSArKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKaW5kZXggYjhh
MDY5MDU1ZmJjLi4xMjc0YjU0ZjI2NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
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
cmVkID0gZmFsc2U7CiAKIAlyZXR1cm4gMDsKQEAgLTE3NCw2ICsxNzksMTkgQEAgc3RhdGljIGlu
dCBqaDA1N25fcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAkJcmV0dXJuIDA7CiAK
IAlEUk1fREVWX0RFQlVHX0RSSVZFUihjdHgtPmRldiwgIlJlc2V0dGluZyB0aGUgcGFuZWxcbiIp
OworCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoY3R4LT52Y2MpOworCWlmIChyZXQgPCAwKSB7CisJ
CURSTV9ERVZfRVJST1IoY3R4LT5kZXYsCisJCQkgICAgICAiRmFpbGVkIHRvIGVuYWJsZSB2Y2Mg
c3VwcGx5OiAlZFxuIiwgcmV0KTsKKwkJcmV0dXJuIHJldDsKKwl9CisJcmV0ID0gcmVndWxhdG9y
X2VuYWJsZShjdHgtPmlvdmNjKTsKKwlpZiAocmV0IDwgMCkgeworCQlEUk1fREVWX0VSUk9SKGN0
eC0+ZGV2LAorCQkJICAgICAgIkZhaWxlZCB0byBlbmFibGUgaW92Y2Mgc3VwcGx5OiAlZFxuIiwg
cmV0KTsKKwkJZ290byBkaXNhYmxlX3ZjYzsKKwl9CisKIAlncGlvZF9zZXRfdmFsdWVfY2Fuc2xl
ZXAoY3R4LT5yZXNldF9ncGlvLCAxKTsKIAl1c2xlZXBfcmFuZ2UoMjAsIDQwKTsKIAlncGlvZF9z
ZXRfdmFsdWVfY2Fuc2xlZXAoY3R4LT5yZXNldF9ncGlvLCAwKTsKQEAgLTE4OSw2ICsyMDcsMTAg
QEAgc3RhdGljIGludCBqaDA1N25fcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlj
dHgtPnByZXBhcmVkID0gdHJ1ZTsKIAogCXJldHVybiAwOworCitkaXNhYmxlX3ZjYzoKKwlyZWd1
bGF0b3JfZGlzYWJsZShjdHgtPnZjYyk7CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGRlZmF1bHRfbW9kZSA9IHsKQEAgLTMwMSw2ICszMjMs
MjUgQEAgc3RhdGljIGludCBqaDA1N25fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNp
KQogCWlmIChJU19FUlIoY3R4LT5iYWNrbGlnaHQpKQogCQlyZXR1cm4gUFRSX0VSUihjdHgtPmJh
Y2tsaWdodCk7CiAKKwljdHgtPnZjYyA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJ2Y2MiKTsK
KwlpZiAoSVNfRVJSKGN0eC0+dmNjKSkgeworCQlyZXQgPSBQVFJfRVJSKGN0eC0+dmNjKTsKKwkJ
aWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQorCQkJRFJNX0RFVl9FUlJPUihkZXYsCisJCQkJICAg
ICAgIkZhaWxlZCB0byByZXF1ZXN0IHZjYyByZWd1bGF0b3I6ICVkXG4iLAorCQkJCSAgICAgIHJl
dCk7CisJCXJldHVybiByZXQ7CisJfQorCWN0eC0+aW92Y2MgPSBkZXZtX3JlZ3VsYXRvcl9nZXQo
ZGV2LCAiaW92Y2MiKTsKKwlpZiAoSVNfRVJSKGN0eC0+aW92Y2MpKSB7CisJCXJldCA9IFBUUl9F
UlIoY3R4LT5pb3ZjYyk7CisJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKKwkJCURSTV9ERVZf
RVJST1IoZGV2LAorCQkJCSAgICAgICJGYWlsZWQgdG8gcmVxdWVzdCBpb3ZjYyByZWd1bGF0b3I6
ICVkXG4iLAorCQkJCSAgICAgIHJldCk7CisJCXJldHVybiByZXQ7CisJfQorCiAJZHJtX3BhbmVs
X2luaXQoJmN0eC0+cGFuZWwpOwogCWN0eC0+cGFuZWwuZGV2ID0gZGV2OwogCWN0eC0+cGFuZWwu
ZnVuY3MgPSAmamgwNTduX2RybV9mdW5jczsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
