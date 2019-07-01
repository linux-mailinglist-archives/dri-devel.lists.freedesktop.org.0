Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB694C72C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 08:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200046E4CF;
	Thu, 20 Jun 2019 06:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F278C6E4CA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:07:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2C8C481127;
 Thu, 20 Jun 2019 06:07:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C218B601A5;
 Thu, 20 Jun 2019 06:07:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7A5691753D; Thu, 20 Jun 2019 08:07:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/12] drm/virtio: drop
 virtio_gpu_object_list_validate/virtio_gpu_unref_list
Date: Thu, 20 Jun 2019 08:07:24 +0200
Message-Id: <20190620060726.926-11-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-1-kraxel@redhat.com>
References: <20190620060726.926-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 20 Jun 2019 06:07:37 +0000 (UTC)
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
YXQuY29tPgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICB8ICAzIC0tCiBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyB8IDM5IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9kcnYuaAppbmRleCA1MjEzZDdmNDk5ZWIuLmMyM2Y0MDE2ZGYzOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaApAQCAtMjIyLDkgKzIyMiw2IEBAIHN0cnVj
dCB2aXJ0aW9fZ3B1X2Zwcml2IHsKIC8qIHZpcnRpb19pb2N0bC5jICovCiAjZGVmaW5lIERSTV9W
SVJUSU9fTlVNX0lPQ1RMUyAxMAogZXh0ZXJuIHN0cnVjdCBkcm1faW9jdGxfZGVzYyB2aXJ0aW9f
Z3B1X2lvY3Rsc1tEUk1fVklSVElPX05VTV9JT0NUTFNdOwotaW50IHZpcnRpb19ncHVfb2JqZWN0
X2xpc3RfdmFsaWRhdGUoc3RydWN0IHd3X2FjcXVpcmVfY3R4ICp0aWNrZXQsCi0JCQkJICAgIHN0
cnVjdCBsaXN0X2hlYWQgKmhlYWQpOwotdm9pZCB2aXJ0aW9fZ3B1X3VucmVmX2xpc3Qoc3RydWN0
IGxpc3RfaGVhZCAqaGVhZCk7CiAKIC8qIHZpcnRpb19rbXMuYyAqLwogaW50IHZpcnRpb19ncHVf
aW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2lvY3RsLmMKaW5kZXggYzM5MDFjMzk3YjhhLi41NGUxY2Y4NDA5N2EgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCkBAIC01NCw0NSArNTQsNiBAQCBzdGF0aWMgaW50IHZp
cnRpb19ncHVfbWFwX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJ
CQkJCSAmdmlydGlvX2dwdV9tYXAtPm9mZnNldCk7CiB9CiAKLWludCB2aXJ0aW9fZ3B1X29iamVj
dF9saXN0X3ZhbGlkYXRlKHN0cnVjdCB3d19hY3F1aXJlX2N0eCAqdGlja2V0LAotCQkJCSAgICBz
dHJ1Y3QgbGlzdF9oZWFkICpoZWFkKQotewotCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHgg
PSB7IGZhbHNlLCBmYWxzZSB9OwotCXN0cnVjdCB0dG1fdmFsaWRhdGVfYnVmZmVyICpidWY7Ci0J
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibzsKLQlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3Qg
KnFvYmo7Ci0JaW50IHJldDsKLQotCXJldCA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnModGlja2V0
LCBoZWFkLCB0cnVlLCBOVUxMLCB0cnVlKTsKLQlpZiAocmV0ICE9IDApCi0JCXJldHVybiByZXQ7
Ci0KLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJ1ZiwgaGVhZCwgaGVhZCkgewotCQlibyA9IGJ1Zi0+
Ym87Ci0JCXFvYmogPSBjb250YWluZXJfb2YoYm8sIHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCwg
dGJvKTsKLQkJcmV0ID0gdHRtX2JvX3ZhbGlkYXRlKGJvLCAmcW9iai0+cGxhY2VtZW50LCAmY3R4
KTsKLQkJaWYgKHJldCkgewotCQkJdHRtX2V1X2JhY2tvZmZfcmVzZXJ2YXRpb24odGlja2V0LCBo
ZWFkKTsKLQkJCXJldHVybiByZXQ7Ci0JCX0KLQl9Ci0JcmV0dXJuIDA7Ci19Ci0KLXZvaWQgdmly
dGlvX2dwdV91bnJlZl9saXN0KHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpCi17Ci0Jc3RydWN0IHR0
bV92YWxpZGF0ZV9idWZmZXIgKmJ1ZjsKLQlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvOwot
CXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqcW9iajsKLQotCWxpc3RfZm9yX2VhY2hfZW50cnko
YnVmLCBoZWFkLCBoZWFkKSB7Ci0JCWJvID0gYnVmLT5ibzsKLQkJcW9iaiA9IGNvbnRhaW5lcl9v
Zihibywgc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0LCB0Ym8pOwotCi0JCWRybV9nZW1fb2JqZWN0
X3B1dF91bmxvY2tlZCgmcW9iai0+Z2VtX2Jhc2UpOwotCX0KLX0KLQogLyoKICAqIFVzYWdlIG9m
IGV4ZWNidWZmZXI6CiAgKiBSZWxvY2F0aW9ucyBuZWVkIHRvIHRha2UgaW50byBhY2NvdW50IHRo
ZSBmdWxsIFZJUlRJT19HUFVEcmF3YWJsZSBzaXplLgotLSAKMi4xOC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
