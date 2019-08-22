Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B959C98B9C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 08:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8366E471;
	Thu, 22 Aug 2019 06:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB476E46C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:50:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E2EC10F23E4;
 Thu, 22 Aug 2019 06:50:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 969FD5D9E5;
 Thu, 22 Aug 2019 06:50:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C54E216E32; Thu, 22 Aug 2019 08:50:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/4] drm/bochs: pass framebuffer to bochs_hw_setbase
Date: Thu, 22 Aug 2019 08:50:38 +0200
Message-Id: <20190822065041.11941-2-kraxel@redhat.com>
In-Reply-To: <20190822065041.11941-1-kraxel@redhat.com>
References: <20190822065041.11941-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 22 Aug 2019 06:50:45 +0000 (UTC)
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

QWxzbyByZW5hbWUgYm9jaHNfaHdfc2V0YmFzZSB0byBib2Noc19od19zZXRmYiwKd2UgaGF2ZSB0
byBzZXQgbW9yZSB0aGFuIGp1c3QgdGhlIGJhc2UgYWRkcmVzcy4KClNpZ25lZC1vZmYtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2No
cy9ib2Nocy5oICAgICB8ICA1ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcu
YyAgfCAyNCArKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9i
b2Noc19rbXMuYyB8IDExICsrKy0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ib2No
cy9ib2Nocy5oIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmgKaW5kZXggNjg0ODNhMmZj
MTJjLi5lZDE2ODQwNDExZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2No
cy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCkBAIC04Myw4ICs4Myw5IEBA
IHZvaWQgYm9jaHNfaHdfc2V0bW9kZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKIAkJICAg
ICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwogdm9pZCBib2Noc19od19zZXRmb3Jt
YXQoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCiAJCQljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1h
dF9pbmZvICpmb3JtYXQpOwotdm9pZCBib2Noc19od19zZXRiYXNlKHN0cnVjdCBib2Noc19kZXZp
Y2UgKmJvY2hzLAotCQkgICAgICBpbnQgeCwgaW50IHksIGludCBzdHJpZGUsIHU2NCBhZGRyKTsK
K3ZvaWQgYm9jaHNfaHdfc2V0ZmIoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCisJCSAgICBz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwKKwkJICAgIGludCB4LCBpbnQgeSk7CiBpbnQgYm9j
aHNfaHdfbG9hZF9lZGlkKHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzKTsKIAogLyogYm9jaHNf
bW0uYyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwppbmRleCBlNTY3YmRmYTJhYjguLjk0OTkz
MGQ4YTkyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMKQEAgLTI1OCwyMiArMjU4LDIwIEBA
IHZvaWQgYm9jaHNfaHdfc2V0Zm9ybWF0KHN0cnVjdCBib2Noc19kZXZpY2UgKmJvY2hzLAogCX07
CiB9CiAKLXZvaWQgYm9jaHNfaHdfc2V0YmFzZShzdHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywK
LQkJICAgICAgaW50IHgsIGludCB5LCBpbnQgc3RyaWRlLCB1NjQgYWRkcikKK3ZvaWQgYm9jaHNf
aHdfc2V0ZmIoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCisJCSAgICBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiwKKwkJICAgIGludCB4LCBpbnQgeSkKIHsKLQl1bnNpZ25lZCBsb25nIG9m
ZnNldDsKLQl1bnNpZ25lZCBpbnQgdngsIHZ5LCB2d2lkdGg7Ci0KLQlib2Nocy0+c3RyaWRlID0g
c3RyaWRlOwotCW9mZnNldCA9ICh1bnNpZ25lZCBsb25nKWFkZHIgKwotCQl5ICogYm9jaHMtPnN0
cmlkZSArCi0JCXggKiAoYm9jaHMtPmJwcCAvIDgpOwotCXZ5ID0gb2Zmc2V0IC8gYm9jaHMtPnN0
cmlkZTsKLQl2eCA9IChvZmZzZXQgJSBib2Nocy0+c3RyaWRlKSAqIDggLyBib2Nocy0+YnBwOwot
CXZ3aWR0aCA9IHN0cmlkZSAqIDggLyBib2Nocy0+YnBwOworCXN0cnVjdCBkcm1fZ2VtX3ZyYW1f
b2JqZWN0ICpibyA9IGRybV9nZW1fdnJhbV9vZl9nZW0oZmItPm9ialswXSk7CisJdW5zaWduZWQg
bG9uZyBvZmZzZXQgPSBiby0+Ym8ub2Zmc2V0ICsKKwkJeSAqIGZiLT5waXRjaGVzWzBdICsKKwkJ
eCAqIGZiLT5mb3JtYXQtPmNwcFswXTsKKwlpbnQgdnkgPSBvZmZzZXQgLyBmYi0+cGl0Y2hlc1sw
XTsKKwlpbnQgdnggPSAob2Zmc2V0ICUgZmItPnBpdGNoZXNbMF0pIC8gZmItPmZvcm1hdC0+Y3Bw
WzBdOworCWludCB2d2lkdGggPSBmYi0+cGl0Y2hlc1swXSAvIGZiLT5mb3JtYXQtPmNwcFswXTsK
IAogCURSTV9ERUJVR19EUklWRVIoInggJWQsIHkgJWQsIGFkZHIgJWxseCAtPiBvZmZzZXQgJWx4
LCB2eCAlZCwgdnkgJWRcbiIsCi0JCQkgeCwgeSwgYWRkciwgb2Zmc2V0LCB2eCwgdnkpOworCQkJ
IHgsIHksIGJvLT5iby5vZmZzZXQsIG9mZnNldCwgdngsIHZ5KTsKIAlib2Noc19kaXNwaV93cml0
ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1ZJUlRfV0lEVEgsIHZ3aWR0aCk7CiAJYm9jaHNfZGlz
cGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9YX09GRlNFVCwgdngpOwogCWJvY2hzX2Rp
c3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5ERVhfWV9PRkZTRVQsIHZ5KTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
b2Nocy9ib2Noc19rbXMuYwppbmRleCAwMmE5YzFlZDE2NWIuLmY1ZDY2MzI1OTc1MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ib2Nocy9ib2Noc19rbXMuYwpAQCAtMjksMTcgKzI5LDEyIEBAIHN0YXRpYyBjb25zdCB1
aW50MzJfdCBib2Noc19mb3JtYXRzW10gPSB7CiBzdGF0aWMgdm9pZCBib2Noc19wbGFuZV91cGRh
dGUoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCiAJCQkgICAgICAgc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSAqc3RhdGUpCiB7Ci0Jc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibzsKLQog
CWlmICghc3RhdGUtPmZiIHx8ICFib2Nocy0+c3RyaWRlKQogCQlyZXR1cm47CiAKLQlnYm8gPSBk
cm1fZ2VtX3ZyYW1fb2ZfZ2VtKHN0YXRlLT5mYi0+b2JqWzBdKTsKLQlib2Noc19od19zZXRiYXNl
KGJvY2hzLAotCQkJIHN0YXRlLT5jcnRjX3gsCi0JCQkgc3RhdGUtPmNydGNfeSwKLQkJCSBzdGF0
ZS0+ZmItPnBpdGNoZXNbMF0sCi0JCQkgc3RhdGUtPmZiLT5vZmZzZXRzWzBdICsgZ2JvLT5iby5v
ZmZzZXQpOworCWJvY2hzX2h3X3NldGZiKGJvY2hzLCBzdGF0ZS0+ZmIsCisJCSAgICAgICBzdGF0
ZS0+Y3J0Y194LAorCQkgICAgICAgc3RhdGUtPmNydGNfeSk7CiAJYm9jaHNfaHdfc2V0Zm9ybWF0
KGJvY2hzLCBzdGF0ZS0+ZmItPmZvcm1hdCk7CiB9CiAKLS0gCjIuMTguMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
