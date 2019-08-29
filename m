Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF372A1622
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 12:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286AA6E0B8;
	Thu, 29 Aug 2019 10:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110BC6E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 10:33:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9ADB1875221;
 Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9753A60872;
 Thu, 29 Aug 2019 10:33:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8EF5131E8F; Thu, 29 Aug 2019 12:33:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 05/18] drm/virtio: drop no_wait argument from
 virtio_gpu_object_reserve
Date: Thu, 29 Aug 2019 12:32:48 +0200
Message-Id: <20190829103301.3539-6-kraxel@redhat.com>
In-Reply-To: <20190829103301.3539-1-kraxel@redhat.com>
References: <20190829103301.3539-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 29 Aug 2019 10:33:09 +0000 (UTC)
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
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRleCAzZTBhNTMzMDljNWIuLmQ4ODZjMGUz
NTAyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtMzk4LDEyICszOTgs
MTEgQEAgc3RhdGljIGlubGluZSB1NjQgdmlydGlvX2dwdV9vYmplY3RfbW1hcF9vZmZzZXQoc3Ry
dWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibykKIAlyZXR1cm4gZHJtX3ZtYV9ub2RlX29mZnNldF9h
ZGRyKCZiby0+dGJvLmJhc2Uudm1hX25vZGUpOwogfQogCi1zdGF0aWMgaW5saW5lIGludCB2aXJ0
aW9fZ3B1X29iamVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8sCi0JCQkJ
CSBib29sIG5vX3dhaXQpCitzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1X29iamVjdF9yZXNl
cnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCiB7CiAJaW50IHI7CiAKLQlyID0gdHRt
X2JvX3Jlc2VydmUoJmJvLT50Ym8sIHRydWUsIG5vX3dhaXQsIE5VTEwpOworCXIgPSB0dG1fYm9f
cmVzZXJ2ZSgmYm8tPnRibywgdHJ1ZSwgZmFsc2UsIE5VTEwpOwogCWlmICh1bmxpa2VseShyICE9
IDApKSB7CiAJCWlmIChyICE9IC1FUkVTVEFSVFNZUykgewogCQkJc3RydWN0IHZpcnRpb19ncHVf
ZGV2aWNlICpxZGV2ID0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0uYwppbmRleCAyOTI1
NjYxNDY4MTQuLjZmZTZmNzJmNjRkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0u
YwpAQCAtMTQyLDcgKzE0Miw3IEBAIGludCB2aXJ0aW9fZ3B1X2dlbV9vYmplY3Rfb3BlbihzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKIAlpZiAoIXZnZGV2LT5oYXNfdmlyZ2xfM2QpCiAJCXJl
dHVybiAwOwogCi0JciA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaiwgZmFsc2UpOwor
CXIgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmopOwogCWlmIChyKQogCQlyZXR1cm4g
cjsKIApAQCAtMTYzLDcgKzE2Myw3IEBAIHZvaWQgdmlydGlvX2dwdV9nZW1fb2JqZWN0X2Nsb3Nl
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAogCWlmICghdmdkZXYtPmhhc192aXJnbF8zZCkK
IAkJcmV0dXJuOwogCi0JciA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaiwgZmFsc2Up
OworCXIgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmopOwogCWlmIChyKQogCQlyZXR1
cm47CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5j
IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKaW5kZXggYTY2MjM5NGY2
ODkyLi43ZjE3NzViOTQ0OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5j
CkBAIC0zNzcsNyArMzc3LDcgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3RyYW5zZmVyX2Zyb21f
aG9zdF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJcW9iaiA9IGdlbV90b192aXJ0
aW9fZ3B1X29iaihnb2JqKTsKIAotCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9i
aiwgZmFsc2UpOworCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaik7CiAJaWYg
KHJldCkKIAkJZ290byBvdXQ7CiAKQEAgLTQyNyw3ICs0MjcsNyBAQCBzdGF0aWMgaW50IHZpcnRp
b19ncHVfdHJhbnNmZXJfdG9faG9zdF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpkYXRhLAogCiAJcW9iaiA9IGdlbV90b192aXJ0aW9fZ3B1X29iaihnb2JqKTsKIAotCXJldCA9
IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaiwgZmFsc2UpOworCXJldCA9IHZpcnRpb19n
cHVfb2JqZWN0X3Jlc2VydmUocW9iaik7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAKLS0gCjIu
MTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
