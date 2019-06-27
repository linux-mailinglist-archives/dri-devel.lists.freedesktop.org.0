Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00A58272
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEF56E161;
	Thu, 27 Jun 2019 12:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D3D6E161
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:23:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0B1AD305E23A;
 Thu, 27 Jun 2019 12:23:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6D46600CC;
 Thu, 27 Jun 2019 12:23:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 78CFC9DB6; Thu, 27 Jun 2019 14:23:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/bochs: move bochs_hw_setformat() call
Date: Thu, 27 Jun 2019 14:23:48 +0200
Message-Id: <20190627122348.5833-6-kraxel@redhat.com>
In-Reply-To: <20190627122348.5833-1-kraxel@redhat.com>
References: <20190627122348.5833-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 27 Jun 2019 12:23:59 +0000 (UTC)
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

Q2FsbCBpdCBmcm9tIGJvY2hzX2h3X3NldGZiKCkuClRoaXMgYWxzbyBhbGxvd3MgdG8gbWFrZSBi
b2Noc19od19zZXRmb3JtYXQgc3RhdGljLgoKU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmggICAg
IHwgMiAtLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMgIHwgNSArKystLQogZHJp
dmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jIHwgMSAtCiAzIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCmluZGV4IDQw
ODFiM2FiYTI4ZC4uNTI4YjhlOGRkZTQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9j
aHMvYm9jaHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaApAQCAtODAsOCAr
ODAsNiBAQCB2b2lkIGJvY2hzX2h3X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRldik7CiAKIHZv
aWQgYm9jaHNfaHdfc2V0bW9kZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKIAkJICAgICAg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwotdm9pZCBib2Noc19od19zZXRmb3JtYXQo
c3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCi0JCQljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9p
bmZvICpmb3JtYXQpOwogdm9pZCBib2Noc19od19zZXRmYihzdHJ1Y3QgYm9jaHNfZGV2aWNlICpi
b2NocywKIAkJICAgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAogCQkgICAgaW50IHgsIGlu
dCB5KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jIGIvZHJp
dmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKaW5kZXggMTc4NzE1YzY3NTVkLi5kYWE0ZmRh
M2QzMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCkBAIC0yMjQsOCArMjI0LDggQEAgdm9p
ZCBib2Noc19od19zZXRtb2RlKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAogCQkJICBWQkVf
RElTUElfRU5BQkxFRCB8IFZCRV9ESVNQSV9MRkJfRU5BQkxFRCk7CiB9CiAKLXZvaWQgYm9jaHNf
aHdfc2V0Zm9ybWF0KHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAotCQkJY29uc3Qgc3RydWN0
IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0KQorc3RhdGljIHZvaWQgYm9jaHNfaHdfc2V0Zm9ybWF0
KHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAorCQkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1f
Zm9ybWF0X2luZm8gKmZvcm1hdCkKIHsKIAlEUk1fREVCVUdfRFJJVkVSKCJmb3JtYXQgJWMlYyVj
JWNcbiIsCiAJCQkgKGZvcm1hdC0+Zm9ybWF0ID4+ICAwKSAmIDB4ZmYsCkBAIC0yNjMsNCArMjYz
LDUgQEAgdm9pZCBib2Noc19od19zZXRmYihzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKIAli
b2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1ZJUlRfV0lEVEgsIHZ3KTsK
IAlib2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1hfT0ZGU0VULCB2eCk7
CiAJYm9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9ZX09GRlNFVCwgdnkp
OworCWJvY2hzX2h3X3NldGZvcm1hdChib2NocywgZmItPmZvcm1hdCk7CiB9CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9j
aHMvYm9jaHNfa21zLmMKaW5kZXggMjhlZGZiMjc3MmZmLi4zNjg4MDNiZDEyZTUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHNfa21zLmMKQEAgLTMzLDcgKzMzLDYgQEAgc3RhdGljIHZvaWQgYm9jaHNf
cGxhbmVfdXBkYXRlKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAogCWJvY2hzX2h3X3NldGZi
KGJvY2hzLCBzdGF0ZS0+ZmIsCiAJCSAgICAgICBzdGF0ZS0+Y3J0Y194LAogCQkgICAgICAgc3Rh
dGUtPmNydGNfeSk7Ci0JYm9jaHNfaHdfc2V0Zm9ybWF0KGJvY2hzLCBzdGF0ZS0+ZmItPmZvcm1h
dCk7CiB9CiAKIHN0YXRpYyB2b2lkIGJvY2hzX3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxl
X2Rpc3BsYXlfcGlwZSAqcGlwZSwKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
