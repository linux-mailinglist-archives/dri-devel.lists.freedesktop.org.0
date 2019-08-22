Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED82990AF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 12:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38506E35D;
	Thu, 22 Aug 2019 10:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B39F6E35D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 10:26:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B9607F75C;
 Thu, 22 Aug 2019 10:26:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A15426012C;
 Thu, 22 Aug 2019 10:26:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C817516E32; Thu, 22 Aug 2019 12:26:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/virtio: make resource id workaround runtime switchable.
Date: Thu, 22 Aug 2019 12:26:14 +0200
Message-Id: <20190822102614.18164-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 22 Aug 2019 10:26:18 +0000 (UTC)
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

QWxzbyB1cGRhdGUgdGhlIGNvbW1lbnQgd2l0aCBhIHJlZmVyZW5jZSB0byB0aGUgdmlyZ2xyZW5k
ZXJlciBmaXguCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCA0NCArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwg
MjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCmlu
ZGV4IGIyZGEzMTMxMGQyNC4uZTk4YWFhMDA1NzhkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X29iamVjdC5jCkBAIC0yNywzNCArMjcsMzggQEAKIAogI2luY2x1ZGUgInZpcnRncHVf
ZHJ2LmgiCiAKK3N0YXRpYyBpbnQgdmlydGlvX2dwdV92aXJnbHJlbmRlcmVyX3dvcmthcm91bmQg
PSAxOworbW9kdWxlX3BhcmFtX25hbWVkKHZpcmdsaGFjaywgdmlydGlvX2dwdV92aXJnbHJlbmRl
cmVyX3dvcmthcm91bmQsIGludCwgMDQwMCk7CisKIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9yZXNv
dXJjZV9pZF9nZXQoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAkJCQkgICAgICAg
dWludDMyX3QgKnJlc2lkKQogewotI2lmIDAKLQlpbnQgaGFuZGxlID0gaWRhX2FsbG9jKCZ2Z2Rl
di0+cmVzb3VyY2VfaWRhLCBHRlBfS0VSTkVMKTsKLQotCWlmIChoYW5kbGUgPCAwKQotCQlyZXR1
cm4gaGFuZGxlOwotI2Vsc2UKLQlzdGF0aWMgaW50IGhhbmRsZTsKLQotCS8qCi0JICogRklYTUU6
IGRpcnR5IGhhY2sgdG8gYXZvaWQgcmUtdXNpbmcgSURzLCB2aXJnbHJlbmRlcmVyCi0JICogY2Fu
J3QgZGVhbCB3aXRoIHRoYXQuICBOZWVkcyBmaXhpbmcgaW4gdmlyZ2xyZW5kZXJlciwgYWxzbwot
CSAqIHNob3VsZCBmaWd1cmUgYSBiZXR0ZXIgd2F5IHRvIGhhbmRsZSB0aGF0IGluIHRoZSBndWVz
dC4KLQkgKi8KLQloYW5kbGUrKzsKLSNlbmRpZgotCi0JKnJlc2lkID0gaGFuZGxlICsgMTsKKwlp
ZiAodmlydGlvX2dwdV92aXJnbHJlbmRlcmVyX3dvcmthcm91bmQpIHsKKwkJLyoKKwkJICogSGFj
ayB0byBhdm9pZCByZS11c2luZyByZXNvdXJjZSBJRHMuCisJCSAqCisJCSAqIHZpcmdscmVuZGVy
ZXIgdmVyc2lvbnMgdXAgdG8gKGFuZCBpbmNsdWRpbmcpIDAuNy4wCisJCSAqIGNhbid0IGRlYWwg
d2l0aCB0aGF0LiAgdmlyZ2xyZW5kZXJlciBjb21taXQKKwkJICogImY5MWE5ZGQzNTcxNSBGaXgg
dW5saW5raW5nIHJlc291cmNlcyBmcm9tIGhhc2gKKwkJICogdGFibGUuIiAoRmViIDIwMTkpIGZp
eGVzIHRoZSBidWcuCisJCSAqLworCQlzdGF0aWMgaW50IGhhbmRsZTsKKwkJaGFuZGxlKys7CisJ
CSpyZXNpZCA9IGhhbmRsZSArIDE7CisJfSBlbHNlIHsKKwkJaW50IGhhbmRsZSA9IGlkYV9hbGxv
YygmdmdkZXYtPnJlc291cmNlX2lkYSwgR0ZQX0tFUk5FTCk7CisJCWlmIChoYW5kbGUgPCAwKQor
CQkJcmV0dXJuIGhhbmRsZTsKKwkJKnJlc2lkID0gaGFuZGxlICsgMTsKKwl9CiAJcmV0dXJuIDA7
CiB9CiAKIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfcmVzb3VyY2VfaWRfcHV0KHN0cnVjdCB2aXJ0
aW9fZ3B1X2RldmljZSAqdmdkZXYsIHVpbnQzMl90IGlkKQogewotI2lmIDAKLQlpZGFfZnJlZSgm
dmdkZXYtPnJlc291cmNlX2lkYSwgaWQgLSAxKTsKLSNlbmRpZgorCWlmICghdmlydGlvX2dwdV92
aXJnbHJlbmRlcmVyX3dvcmthcm91bmQpIHsKKwkJaWRhX2ZyZWUoJnZnZGV2LT5yZXNvdXJjZV9p
ZGEsIGlkIC0gMSk7CisJfQogfQogCiBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X3R0bV9ib19kZXN0
cm95KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdGJvKQotLSAKMi4xOC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
