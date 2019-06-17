Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272ED48051
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 13:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60CF891AC;
	Mon, 17 Jun 2019 11:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D9F891AA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 11:14:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9C5B730BB546;
 Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BC8E59454;
 Mon, 17 Jun 2019 11:14:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4DCFE16E36; Mon, 17 Jun 2019 13:14:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/virtio: remove virtio_gpu_object_wait
Date: Mon, 17 Jun 2019 13:14:06 +0200
Message-Id: <20190617111406.14765-5-kraxel@redhat.com>
In-Reply-To: <20190617111406.14765-1-kraxel@redhat.com>
References: <20190617111406.14765-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 17 Jun 2019 11:14:10 +0000 (UTC)
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
YXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCAgICB8ICAx
IC0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8IDEzIC0tLS0tLS0t
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2Rydi5oCmluZGV4IDllMmQzMDYyYjAxZC4uMmNkOTYyNTZiYTM3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCkBAIC0zNjQsNyArMzY0LDYgQEAgaW50IHZpcnRp
b19ncHVfb2JqZWN0X2ttYXAoc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyk7CiBpbnQgdmly
dGlvX2dwdV9vYmplY3RfZ2V0X3NnX3RhYmxlKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqcWRl
diwKIAkJCQkgICBzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKTsKIHZvaWQgdmlydGlvX2dw
dV9vYmplY3RfZnJlZV9zZ190YWJsZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKTsKLWlu
dCB2aXJ0aW9fZ3B1X29iamVjdF93YWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8sIGJv
b2wgbm9fd2FpdCk7CiAKIC8qIHZpcnRncHVfcHJpbWUuYyAqLwogc3RydWN0IHNnX3RhYmxlICp2
aXJ0Z3B1X2dlbV9wcmltZV9nZXRfc2dfdGFibGUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmop
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCmluZGV4IDI0Mjc2NmQ2NDRh
Ny4uODJiZmJmOTgzZmQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5j
CkBAIC0yMzMsMTYgKzIzMywzIEBAIHZvaWQgdmlydGlvX2dwdV9vYmplY3RfZnJlZV9zZ190YWJs
ZShzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvKQogCWtmcmVlKGJvLT5wYWdlcyk7CiAJYm8t
PnBhZ2VzID0gTlVMTDsKIH0KLQotaW50IHZpcnRpb19ncHVfb2JqZWN0X3dhaXQoc3RydWN0IHZp
cnRpb19ncHVfb2JqZWN0ICpibywgYm9vbCBub193YWl0KQotewotCWludCByOwotCi0JciA9IHR0
bV9ib19yZXNlcnZlKCZiby0+dGJvLCB0cnVlLCBub193YWl0LCBOVUxMKTsKLQlpZiAodW5saWtl
bHkociAhPSAwKSkKLQkJcmV0dXJuIHI7Ci0JciA9IHR0bV9ib193YWl0KCZiby0+dGJvLCB0cnVl
LCBub193YWl0KTsKLQl0dG1fYm9fdW5yZXNlcnZlKCZiby0+dGJvKTsKLQlyZXR1cm4gcjsKLX0K
LQotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
