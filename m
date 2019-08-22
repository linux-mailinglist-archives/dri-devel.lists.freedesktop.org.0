Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC36E98BA0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 08:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9364E6E9D8;
	Thu, 22 Aug 2019 06:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4B36E471
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:50:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 681C73082E57;
 Thu, 22 Aug 2019 06:50:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06203610C6;
 Thu, 22 Aug 2019 06:50:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 42AF197A1; Thu, 22 Aug 2019 08:50:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm/bochs: move bochs_hw_setformat() call
Date: Thu, 22 Aug 2019 08:50:41 +0200
Message-Id: <20190822065041.11941-5-kraxel@redhat.com>
In-Reply-To: <20190822065041.11941-1-kraxel@redhat.com>
References: <20190822065041.11941-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 22 Aug 2019 06:50:48 +0000 (UTC)
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
cm0vYm9jaHMvYm9jaHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCmluZGV4IGZh
MzZhMzU4YTVkYy4uNTBmZGE5NjQ0NGUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9j
aHMvYm9jaHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaApAQCAtNzgsOCAr
NzgsNiBAQCB2b2lkIGJvY2hzX2h3X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRldik7CiAKIHZv
aWQgYm9jaHNfaHdfc2V0bW9kZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKIAkJICAgICAg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwotdm9pZCBib2Noc19od19zZXRmb3JtYXQo
c3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCi0JCQljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9p
bmZvICpmb3JtYXQpOwogdm9pZCBib2Noc19od19zZXRmYihzdHJ1Y3QgYm9jaHNfZGV2aWNlICpi
b2NocywKIAkJICAgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAogCQkgICAgaW50IHgsIGlu
dCB5KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jIGIvZHJp
dmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKaW5kZXggMDc0OWU5ZGUxYTRkLi5kYTY4MDcy
YmU2YWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCkBAIC0yMjgsOCArMjI4LDggQEAgdm9p
ZCBib2Noc19od19zZXRtb2RlKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAogCQkJICBWQkVf
RElTUElfRU5BQkxFRCB8IFZCRV9ESVNQSV9MRkJfRU5BQkxFRCk7CiB9CiAKLXZvaWQgYm9jaHNf
aHdfc2V0Zm9ybWF0KHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAotCQkJY29uc3Qgc3RydWN0
IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0KQorc3RhdGljIHZvaWQgYm9jaHNfaHdfc2V0Zm9ybWF0
KHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAorCQkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1f
Zm9ybWF0X2luZm8gKmZvcm1hdCkKIHsKIAlEUk1fREVCVUdfRFJJVkVSKCJmb3JtYXQgJWMlYyVj
JWNcbiIsCiAJCQkgKGZvcm1hdC0+Zm9ybWF0ID4+ICAwKSAmIDB4ZmYsCkBAIC0yNjksNCArMjY5
LDUgQEAgdm9pZCBib2Noc19od19zZXRmYihzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKIAli
b2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1ZJUlRfV0lEVEgsIHZ3aWR0
aCk7CiAJYm9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9YX09GRlNFVCwg
dngpOwogCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5ERVhfWV9PRkZTRVQs
IHZ5KTsKKwlib2Noc19od19zZXRmb3JtYXQoYm9jaHMsIGZiLT5mb3JtYXQpOwogfQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2JvY2hzL2JvY2hzX2ttcy5jCmluZGV4IDMzNGU0NThjYmMzMS4uZDAyMTA0ZmRkZjgyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCkBAIC0zNSw3ICszNSw2IEBAIHN0YXRpYyB2b2lkIGJv
Y2hzX3BsYW5lX3VwZGF0ZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKIAlib2Noc19od19z
ZXRmYihib2Nocywgc3RhdGUtPmZiLAogCQkgICAgICAgc3RhdGUtPmNydGNfeCwKIAkJICAgICAg
IHN0YXRlLT5jcnRjX3kpOwotCWJvY2hzX2h3X3NldGZvcm1hdChib2Nocywgc3RhdGUtPmZiLT5m
b3JtYXQpOwogfQogCiBzdGF0aWMgdm9pZCBib2Noc19waXBlX2VuYWJsZShzdHJ1Y3QgZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
