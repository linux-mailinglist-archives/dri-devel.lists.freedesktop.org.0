Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812E4A301
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745C06E1B1;
	Tue, 18 Jun 2019 13:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7028E6E1AA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:58:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D1C0E6147C;
 Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83F641001DDC;
 Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF5DC9D89; Tue, 18 Jun 2019 15:58:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/12] drm/virtio: remove virtio_gpu_alloc_object
Date: Tue, 18 Jun 2019 15:58:20 +0200
Message-Id: <20190618135821.8644-13-kraxel@redhat.com>
In-Reply-To: <20190618135821.8644-1-kraxel@redhat.com>
References: <20190618135821.8644-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 18 Jun 2019 13:58:26 +0000 (UTC)
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

VGhpbiB3cmFwcGVyIGFyb3VuZCB2aXJ0aW9fZ3B1X29iamVjdF9jcmVhdGUoKSwKYnV0IGNhbGxp
bmcgdGhhdCBkaXJlY3RseSB3b3JrcyBlcXVhbGx5IHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfZHJ2LmggICB8ICA0IC0tLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9nZW0uYyAgIHwgMjMgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9pb2N0bC5jIHwgIDYgKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Ry
di5oCmluZGV4IGNjZjZlODQ0ZjAzZi4uNjRhNzMxODgxNWUwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2Rydi5oCkBAIC0yMjMsMTAgKzIyMyw2IEBAIGludCB2aXJ0aW9fZ3B1X2dlbV9v
YmplY3Rfb3BlbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKIAkJCSAgICAgICBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUpOwogdm9pZCB2aXJ0aW9fZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJCQkJIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSk7Ci1zdHJ1
Y3QgdmlydGlvX2dwdV9vYmplY3QqCi12aXJ0aW9fZ3B1X2FsbG9jX29iamVjdChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAotCQkJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X3BhcmFtcyAqcGFyYW1z
LAotCQkJc3RydWN0IHZpcnRpb19ncHVfZmVuY2UgKmZlbmNlKTsKIGludCB2aXJ0aW9fZ3B1X21v
ZGVfZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsCiAJCQkJc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKIAkJCQlzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1bWIgKmFyZ3MpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbS5jCmluZGV4IDc2MmQ5ODU4N2QzYS4uY2ViYzJl
MTBiMjg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbS5jCkBAIC0yNiwzNSArMjYs
MjAgQEAKICNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgInZpcnRncHVfZHJ2LmgiCiAK
LXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCoKLXZpcnRpb19ncHVfYWxsb2Nfb2JqZWN0KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCi0JCQlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfcGFyYW1zICpw
YXJhbXMsCi0JCQlzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZSAqZmVuY2UpCi17Ci0Jc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlICp2Z2RldiA9IGRldi0+ZGV2X3ByaXZhdGU7Ci0Jc3RydWN0IHZpcnRp
b19ncHVfb2JqZWN0ICpvYmo7Ci0JaW50IHJldDsKLQotCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0
X2NyZWF0ZSh2Z2RldiwgcGFyYW1zLCAmb2JqLCBmZW5jZSk7Ci0JaWYgKHJldCkKLQkJcmV0dXJu
IEVSUl9QVFIocmV0KTsKLQotCXJldHVybiBvYmo7Ci19Ci0KIGludCB2aXJ0aW9fZ3B1X2dlbV9j
cmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlLAogCQkJICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAogCQkJICBzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfcGFyYW1zICpwYXJhbXMsCiAJCQkgIHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqKm9ial9wLAogCQkJICB1aW50MzJfdCAqaGFuZGxlX3ApCiB7
CisJc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJ
c3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpvYmo7CiAJaW50IHJldDsKIAl1MzIgaGFuZGxlOwog
Ci0Jb2JqID0gdmlydGlvX2dwdV9hbGxvY19vYmplY3QoZGV2LCBwYXJhbXMsIE5VTEwpOwotCWlm
IChJU19FUlIob2JqKSkKLQkJcmV0dXJuIFBUUl9FUlIob2JqKTsKKwlyZXQgPSB2aXJ0aW9fZ3B1
X29iamVjdF9jcmVhdGUodmdkZXYsIHBhcmFtcywgJm9iaiwgTlVMTCk7CisJaWYgKHJldCA8IDAp
CisJCXJldHVybiByZXQ7CiAKIAlyZXQgPSBkcm1fZ2VtX2hhbmRsZV9jcmVhdGUoZmlsZSwgJm9i
ai0+YmFzZS5iYXNlLCAmaGFuZGxlKTsKIAlpZiAocmV0KSB7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9pb2N0bC5jCmluZGV4IGM2N2NmMmVmM2UxYy4uYTJkYTM1NDBiNmVlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwpAQCAtMjcyLDEwICsyNzIsMTAgQEAgc3Rh
dGljIGludCB2aXJ0aW9fZ3B1X3Jlc291cmNlX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLAogCWZlbmNlID0gdmlydGlvX2dwdV9mZW5jZV9hbGxvYyh2Z2Rl
dik7CiAJaWYgKCFmZW5jZSkKIAkJcmV0dXJuIC1FTk9NRU07Ci0JcW9iaiA9IHZpcnRpb19ncHVf
YWxsb2Nfb2JqZWN0KGRldiwgJnBhcmFtcywgZmVuY2UpOworCXJldCA9IHZpcnRpb19ncHVfb2Jq
ZWN0X2NyZWF0ZSh2Z2RldiwgJnBhcmFtcywgJnFvYmosIGZlbmNlKTsKIAlkbWFfZmVuY2VfcHV0
KCZmZW5jZS0+Zik7Ci0JaWYgKElTX0VSUihxb2JqKSkKLQkJcmV0dXJuIFBUUl9FUlIocW9iaik7
CisJaWYgKHJldCA8IDApCisJCXJldHVybiByZXQ7CiAJb2JqID0gJnFvYmotPmJhc2UuYmFzZTsK
IAogCXJldCA9IGRybV9nZW1faGFuZGxlX2NyZWF0ZShmaWxlX3ByaXYsIG9iaiwgJmhhbmRsZSk7
Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
