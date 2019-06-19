Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B33B4B48A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA6B6E334;
	Wed, 19 Jun 2019 09:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350BB6E323
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:04:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 72EBFC18B2E1;
 Wed, 19 Jun 2019 09:04:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-86.ams2.redhat.com
 [10.36.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 297DD16909;
 Wed, 19 Jun 2019 09:04:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 39DBB17538; Wed, 19 Jun 2019 11:04:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/12] drm/virtio: drop
 virtio_gpu_object_list_validate/virtio_gpu_unref_list
Date: Wed, 19 Jun 2019 11:04:18 +0200
Message-Id: <20190619090420.6667-11-kraxel@redhat.com>
In-Reply-To: <20190619090420.6667-1-kraxel@redhat.com>
References: <20190619090420.6667-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 19 Jun 2019 09:04:26 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gdXNlcnMgbGVmdC4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCAgIHwgIDMg
LS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIHwgMzkgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCmluZGV4IDgzNGNmNzEzNmM3OC4uNmEzYjBmZWU3
MjI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCkBAIC0yMTgsOSArMjE4LDYg
QEAgc3RydWN0IHZpcnRpb19ncHVfZnByaXYgewogLyogdmlydGlvX2lvY3RsLmMgKi8KICNkZWZp
bmUgRFJNX1ZJUlRJT19OVU1fSU9DVExTIDEwCiBleHRlcm4gc3RydWN0IGRybV9pb2N0bF9kZXNj
IHZpcnRpb19ncHVfaW9jdGxzW0RSTV9WSVJUSU9fTlVNX0lPQ1RMU107Ci1pbnQgdmlydGlvX2dw
dV9vYmplY3RfbGlzdF92YWxpZGF0ZShzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKnRpY2tldCwKLQkJ
CQkgICAgc3RydWN0IGxpc3RfaGVhZCAqaGVhZCk7Ci12b2lkIHZpcnRpb19ncHVfdW5yZWZfbGlz
dChzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKTsKIAogLyogdmlydGlvX2ttcy5jICovCiBpbnQgdmly
dGlvX2dwdV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfaW9jdGwuYwppbmRleCAyMWViZjVjZGI4YmMuLmZmNTZmMmE5ZWU2MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKQEAgLTU0LDQ1ICs1NCw2IEBAIHN0YXRp
YyBpbnQgdmlydGlvX2dwdV9tYXBfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKIAkJCQkJICZ2aXJ0aW9fZ3B1X21hcC0+b2Zmc2V0KTsKIH0KIAotaW50IHZpcnRpb19n
cHVfb2JqZWN0X2xpc3RfdmFsaWRhdGUoc3RydWN0IHd3X2FjcXVpcmVfY3R4ICp0aWNrZXQsCi0J
CQkJICAgIHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpCi17Ci0Jc3RydWN0IHR0bV9vcGVyYXRpb25f
Y3R4IGN0eCA9IHsgZmFsc2UsIGZhbHNlIH07Ci0Jc3RydWN0IHR0bV92YWxpZGF0ZV9idWZmZXIg
KmJ1ZjsKLQlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvOwotCXN0cnVjdCB2aXJ0aW9fZ3B1
X29iamVjdCAqcW9iajsKLQlpbnQgcmV0OwotCi0JcmV0ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVy
cyh0aWNrZXQsIGhlYWQsIHRydWUsIE5VTEwsIHRydWUpOwotCWlmIChyZXQgIT0gMCkKLQkJcmV0
dXJuIHJldDsKLQotCWxpc3RfZm9yX2VhY2hfZW50cnkoYnVmLCBoZWFkLCBoZWFkKSB7Ci0JCWJv
ID0gYnVmLT5ibzsKLQkJcW9iaiA9IGNvbnRhaW5lcl9vZihibywgc3RydWN0IHZpcnRpb19ncHVf
b2JqZWN0LCB0Ym8pOwotCQlyZXQgPSB0dG1fYm9fdmFsaWRhdGUoYm8sICZxb2JqLT5wbGFjZW1l
bnQsICZjdHgpOwotCQlpZiAocmV0KSB7Ci0JCQl0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbih0
aWNrZXQsIGhlYWQpOwotCQkJcmV0dXJuIHJldDsKLQkJfQotCX0KLQlyZXR1cm4gMDsKLX0KLQot
dm9pZCB2aXJ0aW9fZ3B1X3VucmVmX2xpc3Qoc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkKLXsKLQlz
dHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciAqYnVmOwotCXN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm87Ci0Jc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpxb2JqOwotCi0JbGlzdF9mb3JfZWFj
aF9lbnRyeShidWYsIGhlYWQsIGhlYWQpIHsKLQkJYm8gPSBidWYtPmJvOwotCQlxb2JqID0gY29u
dGFpbmVyX29mKGJvLCBzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QsIHRibyk7Ci0KLQkJZHJtX2dl
bV9vYmplY3RfcHV0X3VubG9ja2VkKCZxb2JqLT5nZW1fYmFzZSk7Ci0JfQotfQotCiAvKgogICog
VXNhZ2Ugb2YgZXhlY2J1ZmZlcjoKICAqIFJlbG9jYXRpb25zIG5lZWQgdG8gdGFrZSBpbnRvIGFj
Y291bnQgdGhlIGZ1bGwgVklSVElPX0dQVURyYXdhYmxlIHNpemUuCi0tIAoyLjE4LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
