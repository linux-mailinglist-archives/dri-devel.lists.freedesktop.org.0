Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04610DC40E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 13:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC6F6EB1F;
	Fri, 18 Oct 2019 11:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130626EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:38:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7899F11A2F;
 Fri, 18 Oct 2019 11:38:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D25C5D9D5;
 Fri, 18 Oct 2019 11:38:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2E9C99DB6; Fri, 18 Oct 2019 13:38:32 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: print a single line with device features
Date: Fri, 18 Oct 2019 13:38:32 +0200
Message-Id: <20191018113832.5460-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 18 Oct 2019 11:38:36 +0000 (UTC)
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

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2ttcy5jCmluZGV4IDBiM2NkYjBkODNiMC4uMmY1NzczZTQzNTU3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jCkBAIC0xNTUsMTYgKzE1NSwxNSBAQCBpbnQgdmly
dGlvX2dwdV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAjaWZkZWYgX19MSVRUTEVfRU5E
SUFOCiAJaWYgKHZpcnRpb19oYXNfZmVhdHVyZSh2Z2Rldi0+dmRldiwgVklSVElPX0dQVV9GX1ZJ
UkdMKSkKIAkJdmdkZXYtPmhhc192aXJnbF8zZCA9IHRydWU7Ci0JRFJNX0lORk8oInZpcmdsIDNk
IGFjY2VsZXJhdGlvbiAlc1xuIiwKLQkJIHZnZGV2LT5oYXNfdmlyZ2xfM2QgPyAiZW5hYmxlZCIg
OiAibm90IHN1cHBvcnRlZCBieSBob3N0Iik7Ci0jZWxzZQotCURSTV9JTkZPKCJ2aXJnbCAzZCBh
Y2NlbGVyYXRpb24gbm90IHN1cHBvcnRlZCBieSBndWVzdFxuIik7CiAjZW5kaWYKIAlpZiAodmly
dGlvX2hhc19mZWF0dXJlKHZnZGV2LT52ZGV2LCBWSVJUSU9fR1BVX0ZfRURJRCkpIHsKIAkJdmdk
ZXYtPmhhc19lZGlkID0gdHJ1ZTsKLQkJRFJNX0lORk8oIkVESUQgc3VwcG9ydCBhdmFpbGFibGUu
XG4iKTsKIAl9CiAKKwlEUk1fSU5GTygiZmVhdHVyZXM6ICVjdmlyZ2wgJWNlZGlkXG4iLAorCQkg
dmdkZXYtPmhhc192aXJnbF8zZCA/ICcrJyA6ICctJywKKwkJIHZnZGV2LT5oYXNfZWRpZCAgICAg
PyAnKycgOiAnLScpOworCiAJcmV0ID0gdmlydGlvX2ZpbmRfdnFzKHZnZGV2LT52ZGV2LCAyLCB2
cXMsIGNhbGxiYWNrcywgbmFtZXMsIE5VTEwpOwogCWlmIChyZXQpIHsKIAkJRFJNX0VSUk9SKCJm
YWlsZWQgdG8gZmluZCB2aXJ0IHF1ZXVlc1xuIik7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
