Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E097F815
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EF06EE1A;
	Fri,  2 Aug 2019 13:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5DB6EE0F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:12:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3EE9030917AF;
 Fri,  2 Aug 2019 13:12:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C712A60C47;
 Fri,  2 Aug 2019 13:12:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A2879D7C; Fri,  2 Aug 2019 15:12:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 05/18] drm/virtio: drop no_wait argument from
 virtio_gpu_object_reserve
Date: Fri,  2 Aug 2019 15:12:12 +0200
Message-Id: <20190802131225.17760-6-kraxel@redhat.com>
In-Reply-To: <20190802131225.17760-1-kraxel@redhat.com>
References: <20190802131225.17760-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 02 Aug 2019 13:12:36 +0000 (UTC)
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsIGNhbGxlcnMgcGFzcyBub193YWl0ID0gZmFsc2UuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rydi5oICAgfCA1ICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMg
ICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCA0ICsr
LS0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRleCAxNDk2ZTNmYzFjNDcuLmNmNmJlMmNm
YjgxMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtMzk4LDEyICszOTgs
MTEgQEAgc3RhdGljIGlubGluZSB1NjQgdmlydGlvX2dwdV9vYmplY3RfbW1hcF9vZmZzZXQoc3Ry
dWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibykKIAlyZXR1cm4gZHJtX3ZtYV9ub2RlX29mZnNldF9h
ZGRyKCZiby0+dGJvLnZtYV9ub2RlKTsKIH0KIAotc3RhdGljIGlubGluZSBpbnQgdmlydGlvX2dw
dV9vYmplY3RfcmVzZXJ2ZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvLAotCQkJCQkgYm9v
bCBub193YWl0KQorc3RhdGljIGlubGluZSBpbnQgdmlydGlvX2dwdV9vYmplY3RfcmVzZXJ2ZShz
dHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKQogewogCWludCByOwogCi0JciA9IHR0bV9ib19y
ZXNlcnZlKCZiby0+dGJvLCB0cnVlLCBub193YWl0LCBOVUxMKTsKKwlyID0gdHRtX2JvX3Jlc2Vy
dmUoJmJvLT50Ym8sIHRydWUsIGZhbHNlLCBOVUxMKTsKIAlpZiAodW5saWtlbHkociAhPSAwKSkg
ewogCQlpZiAociAhPSAtRVJFU1RBUlRTWVMpIHsKIAkJCXN0cnVjdCB2aXJ0aW9fZ3B1X2Rldmlj
ZSAqcWRldiA9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2Vt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMKaW5kZXggMjkyNTY2MTQ2
ODE0Li42ZmU2ZjcyZjY0ZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMKQEAg
LTE0Miw3ICsxNDIsNyBAQCBpbnQgdmlydGlvX2dwdV9nZW1fb2JqZWN0X29wZW4oc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmosCiAJaWYgKCF2Z2Rldi0+aGFzX3ZpcmdsXzNkKQogCQlyZXR1cm4g
MDsKIAotCXIgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmosIGZhbHNlKTsKKwlyID0g
dmlydGlvX2dwdV9vYmplY3RfcmVzZXJ2ZShxb2JqKTsKIAlpZiAocikKIAkJcmV0dXJuIHI7CiAK
QEAgLTE2Myw3ICsxNjMsNyBAQCB2b2lkIHZpcnRpb19ncHVfZ2VtX29iamVjdF9jbG9zZShzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKIAlpZiAoIXZnZGV2LT5oYXNfdmlyZ2xfM2QpCiAJCXJl
dHVybjsKIAotCXIgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmosIGZhbHNlKTsKKwly
ID0gdmlydGlvX2dwdV9vYmplY3RfcmVzZXJ2ZShxb2JqKTsKIAlpZiAocikKIAkJcmV0dXJuOwog
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCmluZGV4IDA5MDI0YjE4ZDQwNy4u
ZjFiNjQ2ZmE0MjM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
aW9jdGwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwpAQCAt
Mzc3LDcgKzM3Nyw3IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV90cmFuc2Zlcl9mcm9tX2hvc3Rf
aW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAogCXFvYmogPSBnZW1fdG9fdmlydGlvX2dw
dV9vYmooZ29iaik7CiAKLQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmosIGZh
bHNlKTsKKwlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmopOwogCWlmIChyZXQp
CiAJCWdvdG8gb3V0OwogCkBAIC00MjcsNyArNDI3LDcgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1
X3RyYW5zZmVyX3RvX2hvc3RfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwKIAogCXFvYmogPSBnZW1fdG9fdmlydGlvX2dwdV9vYmooZ29iaik7CiAKLQlyZXQgPSB2aXJ0
aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmosIGZhbHNlKTsKKwlyZXQgPSB2aXJ0aW9fZ3B1X29i
amVjdF9yZXNlcnZlKHFvYmopOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwogCi0tIAoyLjE4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
