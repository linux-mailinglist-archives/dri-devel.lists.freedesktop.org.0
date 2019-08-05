Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6973381481
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932B789D46;
	Mon,  5 Aug 2019 08:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AFC89F35;
 Mon,  5 Aug 2019 08:54:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EABAB30833C1;
 Mon,  5 Aug 2019 08:54:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9456A1000321;
 Mon,  5 Aug 2019 08:54:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3B87511AAA; Mon,  5 Aug 2019 10:54:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: get vga ioports
Date: Mon,  5 Aug 2019 10:53:55 +0200
Message-Id: <20190805085355.12527-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 05 Aug 2019 08:54:41 +0000 (UTC)
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
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cXhsIGhhcyB0d28gbW9kZXM6ICJuYXRpdmUiICh1c2VkIGJ5IHRoZSBkcm0gZHJpdmVyKSBhbmQg
InZnYSIgKHZnYQpjb21wYXRpYmlsaXR5IG1vZGUsIHR5cGljYWxseSB1c2VkIGZvciBib290IGRp
c3BsYXkgYW5kIGZpcm13YXJlCmZyYW1lYnVmZmVycykuCgpBY2Nlc3NpbmcgYW55IHZnYSBpb3Bv
cnQgd2lsbCBzd2l0Y2ggdGhlIHF4bCBkZXZpY2UgaW50byB2Z2EgbW9kZS4KVGhlIHF4bCBkcml2
ZXIgbmV2ZXIgZG9lcyB0aGF0LCBidXQgb3RoZXIgZHJpdmVycyBhY2Nlc3NpbmcgdmdhIHBvcnRz
CmNhbiB0cmlnZ2VyIHRoYXQgdG9vIGFuZCB0aGVyZWZvcmUgZGlzdHVyYiBxeGwgb3BlcmF0aW9u
LiAgU28gYXF1aXJlCnRoZSBsZWdhY3kgdmdhIGlvcG9ydHMgZnJvbSB2Z2FhcmIgdG8gYXZvaWQg
dGhhdC4KClJlcG9yZHVjZXI6IEJvb3Qga3ZtIGd1ZXN0IHdpdGggYm90aCBxeGwgYW5kIGk5MTUg
dmdwdSwgd2l0aCBxeGwgYmVpbmcKZmlyc3QgaW4gcGNpIHNjYW4gb3JkZXIuCgpTaWduZWQtb2Zm
LWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF9kcnYuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKaW5kZXggYjU3YTM3
NTQzNjEzLi44YTJlODZhZGM0MjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCkBAIC04Nyw5ICs4Nywx
NSBAQCBxeGxfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqZW50KQogCWlmIChyZXQpCiAJCWdvdG8gZGlzYWJsZV9wY2k7CiAKKwlyZXQg
PSB2Z2FfZ2V0X2ludGVycnVwdGlibGUocGRldiwgVkdBX1JTUkNfTEVHQUNZX0lPKTsKKwlpZiAo
cmV0KSB7CisJCURSTV9FUlJPUigiY2FuJ3QgZ2V0IGxlZ2FjeSB2Z2EgcG9ydHNcbiIpOworCQln
b3RvIHB1dF92Z2E7CisJfQorCiAJcmV0ID0gcXhsX2RldmljZV9pbml0KHFkZXYsICZxeGxfZHJp
dmVyLCBwZGV2KTsKIAlpZiAocmV0KQotCQlnb3RvIGRpc2FibGVfcGNpOworCQlnb3RvIHB1dF92
Z2E7CiAKIAlyZXQgPSBxeGxfbW9kZXNldF9pbml0KHFkZXYpOwogCWlmIChyZXQpCkBAIC0xMDks
NiArMTE1LDggQEAgcXhsX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3Ry
dWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIAlxeGxfbW9kZXNldF9maW5pKHFkZXYpOwogdW5sb2Fk
OgogCXF4bF9kZXZpY2VfZmluaShxZGV2KTsKK3B1dF92Z2E6CisJdmdhX3B1dChwZGV2LCBWR0Ff
UlNSQ19MRUdBQ1lfSU8pOwogZGlzYWJsZV9wY2k6CiAJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYp
OwogZnJlZV9kZXY6CkBAIC0xMjYsNiArMTM0LDcgQEAgcXhsX3BjaV9yZW1vdmUoc3RydWN0IHBj
aV9kZXYgKnBkZXYpCiAKIAlxeGxfbW9kZXNldF9maW5pKHFkZXYpOwogCXF4bF9kZXZpY2VfZmlu
aShxZGV2KTsKKwl2Z2FfcHV0KHBkZXYsIFZHQV9SU1JDX0xFR0FDWV9JTyk7CiAKIAlkZXYtPmRl
dl9wcml2YXRlID0gTlVMTDsKIAlrZnJlZShxZGV2KTsKLS0gCjIuMTguMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
