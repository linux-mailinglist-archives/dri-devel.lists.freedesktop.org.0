Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286667A9D7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023DE6E517;
	Tue, 30 Jul 2019 13:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D25B6E517
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:39:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8E4A1308A9E0;
 Tue, 30 Jul 2019 13:39:01 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C67C5C21A;
 Tue, 30 Jul 2019 13:38:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 1/2] drm: gm12u320: Some minor cleanups
Date: Tue, 30 Jul 2019 15:38:56 +0200
Message-Id: <20190730133857.30778-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 30 Jul 2019 13:39:01 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MyBzbWFsbCBjbGVhbnVwczoKCjEpIERyb3AgdW51c2VkIERSSVZFUl9QQVRDSExFVkVMCjIpIFdl
IGRvIG5vdCBzZXQgbW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoLCBzbyBpbnN0ZWFkIG9mIHBh
c3NpbmcgdGhlCiAgIHVuc2V0IG1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCB0byBkcm1fZmJk
ZXZfZ2VuZXJpY19zZXR1cAogICBzaW1wbHkgcGFzcyAwCjMpIFVzZSBfX21heWJlX3VudXNlZCBp
bnN0ZWFkIG9mICNpZmRlZiBDT05GSUdfUE0gYXJvdW5kIHRoZSBzdXNwZW5kIC8KICAgcmVzdW1l
IGZ1bmN0aW9ucwoKQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU3VnZ2VzdGVk
LWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2dtMTJ1
MzIwL2dtMTJ1MzIwLmMgfCAxMSArKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ20x
MnUzMjAvZ20xMnUzMjAuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbTEydTMyMC9nbTEydTMyMC5jCmlu
ZGV4IDNkZmU4NmRlZmVmYy4uYTYwODU0ZDdjMTRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZ20xMnUzMjAvZ20xMnUzMjAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ20xMnUzMjAvZ20x
MnUzMjAuYwpAQCAtMzMsNyArMzMsNiBAQCBNT0RVTEVfUEFSTV9ERVNDKGVjb19tb2RlLCAiVHVy
biBvbiBFY28gbW9kZSAobGVzcyBicmlnaHQsIG1vcmUgc2lsZW50KSIpOwogI2RlZmluZSBEUklW
RVJfREFURQkJIjIwMTkiCiAjZGVmaW5lIERSSVZFUl9NQUpPUgkJMQogI2RlZmluZSBEUklWRVJf
TUlOT1IJCTAKLSNkZWZpbmUgRFJJVkVSX1BBVENITEVWRUwJMQogCiAvKgogICogVGhlIERMUCBo
YXMgYW4gYWN0dWFsIHdpZHRoIG9mIDg1NCBwaXhlbHMsIGJ1dCB0aGF0IGlzIG5vdCBhIG11bHRp
cGxlCkBAIC03NDcsNyArNzQ2LDcgQEAgc3RhdGljIGludCBnbTEydTMyMF91c2JfcHJvYmUoc3Ry
dWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSwKIAlpZiAocmV0KQogCQlnb3RvIGVycl9wdXQ7
CiAKLQlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChkZXYsIGRldi0+bW9kZV9jb25maWcucHJlZmVy
cmVkX2RlcHRoKTsKKwlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChkZXYsIDApOwogCiAJcmV0dXJu
IDA7CiAKQEAgLTc2Niw5ICs3NjUsOCBAQCBzdGF0aWMgdm9pZCBnbTEydTMyMF91c2JfZGlzY29u
bmVjdChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlKQogCWRybV9kZXZfcHV0KGRldik7
CiB9CiAKLSNpZmRlZiBDT05GSUdfUE0KLXN0YXRpYyBpbnQgZ20xMnUzMjBfc3VzcGVuZChzdHJ1
Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlLAotCQkJICAgIHBtX21lc3NhZ2VfdCBtZXNzYWdl
KQorc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBnbTEydTMyMF9zdXNwZW5kKHN0cnVjdCB1c2Jf
aW50ZXJmYWNlICppbnRlcmZhY2UsCisJCQkJCSAgIHBtX21lc3NhZ2VfdCBtZXNzYWdlKQogewog
CXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSB1c2JfZ2V0X2ludGZkYXRhKGludGVyZmFjZSk7CiAJ
c3RydWN0IGdtMTJ1MzIwX2RldmljZSAqZ20xMnUzMjAgPSBkZXYtPmRldl9wcml2YXRlOwpAQCAt
Nzc5LDcgKzc3Nyw3IEBAIHN0YXRpYyBpbnQgZ20xMnUzMjBfc3VzcGVuZChzdHJ1Y3QgdXNiX2lu
dGVyZmFjZSAqaW50ZXJmYWNlLAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IGdtMTJ1MzIw
X3Jlc3VtZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlKQorc3RhdGljIF9fbWF5YmVf
dW51c2VkIGludCBnbTEydTMyMF9yZXN1bWUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFj
ZSkKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gdXNiX2dldF9pbnRmZGF0YShpbnRlcmZh
Y2UpOwogCXN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwID0gZGV2LT5kZXZfcHJpdmF0
ZTsKQEAgLTc5MCw3ICs3ODgsNiBAQCBzdGF0aWMgaW50IGdtMTJ1MzIwX3Jlc3VtZShzdHJ1Y3Qg
dXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlKQogCiAJcmV0dXJuIDA7CiB9Ci0jZW5kaWYKIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkIGlkX3RhYmxlW10gPSB7CiAJeyBVU0JfREVW
SUNFKDB4MWRlMSwgMHhjMTAyKSB9LAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
