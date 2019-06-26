Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC232562C3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 08:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B116E29E;
	Wed, 26 Jun 2019 06:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AE56E29C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:55:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ACABF307D861;
 Wed, 26 Jun 2019 06:55:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7900608C1;
 Wed, 26 Jun 2019 06:55:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C27E016E1A; Wed, 26 Jun 2019 08:55:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bochs: fix framebuffer setup.
Date: Wed, 26 Jun 2019 08:55:51 +0200
Message-Id: <20190626065551.12956-3-kraxel@redhat.com>
In-Reply-To: <20190626065551.12956-1-kraxel@redhat.com>
References: <20190626065551.12956-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 26 Jun 2019 06:55:57 +0000 (UTC)
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYm8tPndpZHRoIGRvZXNuJ3QgbWF0Y2ggZmItPndpZHRoIHRoZSBkcml2ZXIgZmFpbHMgdG8g
Y29uZmlndXJlCnRoZSBkaXNwbGF5IGNvcnJlY3RseSwgcmVzdWx0aW5nIGluIGEgc2NyYW1ibGVk
IGRpc3BsYXkuICBGaXggaXQuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCAgICAgfCAgMiAr
LQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMgIHwgMTMgKysrKysrKysrLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ib2Nocy9ib2Nocy5oIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmgKaW5k
ZXggY2MzNWQ0OTIxNDJjLi43OGMwMjgzNDk2Y2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ib2Nocy9ib2Nocy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCkBAIC04
Niw3ICs4Niw3IEBAIHZvaWQgYm9jaHNfaHdfc2V0bW9kZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpi
b2NocywKIHZvaWQgYm9jaHNfaHdfc2V0Zm9ybWF0KHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hz
LAogCQkJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0KTsKIHZvaWQgYm9jaHNf
aHdfc2V0YmFzZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKLQkJICAgICAgaW50IHgsIGlu
dCB5LCB1NjQgYWRkcik7CisJCSAgICAgIGludCB4LCBpbnQgeSwgaW50IGZid2lkdGgsIHU2NCBh
ZGRyKTsKIGludCBib2Noc19od19sb2FkX2VkaWQoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMp
OwogCiAvKiBib2Noc19tbS5jICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHNfaHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCmluZGV4IDc5MWFi
MmY3OTk0Ny4uMTQxYWEwMjk2MmQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAtMjU1
LDE2ICsyNTUsMjEgQEAgdm9pZCBib2Noc19od19zZXRmb3JtYXQoc3RydWN0IGJvY2hzX2Rldmlj
ZSAqYm9jaHMsCiB9CiAKIHZvaWQgYm9jaHNfaHdfc2V0YmFzZShzdHJ1Y3QgYm9jaHNfZGV2aWNl
ICpib2NocywKLQkJICAgICAgaW50IHgsIGludCB5LCB1NjQgYWRkcikKKwkJICAgICAgaW50IHgs
IGludCB5LCBpbnQgZmJ3aWR0aCwgdTY0IGFkZHIpCiB7Ci0JdW5zaWduZWQgbG9uZyBvZmZzZXQg
PSAodW5zaWduZWQgbG9uZylhZGRyICsKKwl1bnNpZ25lZCBsb25nIG9mZnNldDsKKwl1bnNpZ25l
ZCBpbnQgdngsIHZ5OworCisJYm9jaHMtPnN0cmlkZSA9IGZid2lkdGggKiAoYm9jaHMtPmJwcCAv
IDgpOworCW9mZnNldCA9ICh1bnNpZ25lZCBsb25nKWFkZHIgKwogCQl5ICogYm9jaHMtPnN0cmlk
ZSArCiAJCXggKiAoYm9jaHMtPmJwcCAvIDgpOwotCWludCB2eSA9IG9mZnNldCAvIGJvY2hzLT5z
dHJpZGU7Ci0JaW50IHZ4ID0gKG9mZnNldCAlIGJvY2hzLT5zdHJpZGUpICogOCAvIGJvY2hzLT5i
cHA7CisJdnkgPSBvZmZzZXQgLyBib2Nocy0+c3RyaWRlOworCXZ4ID0gKG9mZnNldCAlIGJvY2hz
LT5zdHJpZGUpICogOCAvIGJvY2hzLT5icHA7CiAKIAlEUk1fREVCVUdfRFJJVkVSKCJ4ICVkLCB5
ICVkLCBhZGRyICVsbHggLT4gb2Zmc2V0ICVseCwgdnggJWQsIHZ5ICVkXG4iLAogCQkJIHgsIHks
IGFkZHIsIG9mZnNldCwgdngsIHZ5KTsKKwlib2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJ
U1BJX0lOREVYX1ZJUlRfV0lEVEgsIGZid2lkdGgpOwogCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hz
LCBWQkVfRElTUElfSU5ERVhfWF9PRkZTRVQsIHZ4KTsKIAlib2Noc19kaXNwaV93cml0ZShib2No
cywgVkJFX0RJU1BJX0lOREVYX1lfT0ZGU0VULCB2eSk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNf
a21zLmMKaW5kZXggNTkwNGVkZGM4M2E1Li4xZjZhYTExYTFkYzkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHNfa21zLmMKQEAgLTM2LDYgKzM2LDcgQEAgc3RhdGljIHZvaWQgYm9jaHNfcGxhbmVfdXBk
YXRlKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAogCWJvY2hzX2h3X3NldGJhc2UoYm9jaHMs
CiAJCQkgc3RhdGUtPmNydGNfeCwKIAkJCSBzdGF0ZS0+Y3J0Y195LAorCQkJIGdiby0+d2lkdGgs
CiAJCQkgZ2JvLT5iby5vZmZzZXQpOwogCWJvY2hzX2h3X3NldGZvcm1hdChib2Nocywgc3RhdGUt
PmZiLT5mb3JtYXQpOwogfQotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
