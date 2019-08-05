Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76481797
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF756E3EB;
	Mon,  5 Aug 2019 10:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EC16E3EB;
 Mon,  5 Aug 2019 10:54:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 448B2C057F20;
 Mon,  5 Aug 2019 10:54:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
 [10.36.116.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 497CE5C1D6;
 Mon,  5 Aug 2019 10:54:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 75E6916E08; Mon,  5 Aug 2019 12:54:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/qxl: get vga ioports
Date: Mon,  5 Aug 2019 12:54:01 +0200
Message-Id: <20190805105401.29874-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 05 Aug 2019 10:54:21 +0000 (UTC)
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
 Dave Airlie <airlied@redhat.com>, Frediano Ziglio <fziglio@redhat.com>
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
dGhhdC4KClJlcHJvZHVjZXI6IEJvb3Qga3ZtIGd1ZXN0IHdpdGggYm90aCBxeGwgYW5kIGk5MTUg
dmdwdSwgd2l0aCBxeGwgYmVpbmcKZmlyc3QgaW4gcGNpIHNjYW4gb3JkZXIuCgp2MjogU2tpcCB0
aGlzIGZvciBzZWNvbmRhcnkgcXhsIGNhcmRzIHdoaWNoIGRvbid0IGhhdmUgdmdhIG1vZGUgaW4g
dGhlCiAgICBmaXJzdCBwbGFjZSAoRnJlZGlhbm8pLgoKQ2M6IEZyZWRpYW5vIFppZ2xpbyA8Znpp
Z2xpb0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyB8IDIwICsrKysrKysr
KysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKaW5kZXggYjU3YTM3NTQzNjEzLi5mY2I0OGFjNjA1OTgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9xeGwvcXhsX2Rydi5jCkBAIC02Myw2ICs2MywxMSBAQCBtb2R1bGVfcGFyYW1fbmFt
ZWQobnVtX2hlYWRzLCBxeGxfbnVtX2NydGMsIGludCwgMDQwMCk7CiBzdGF0aWMgc3RydWN0IGRy
bV9kcml2ZXIgcXhsX2RyaXZlcjsKIHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciBxeGxfcGNpX2Ry
aXZlcjsKIAorc3RhdGljIGJvb2wgaXNfdmdhKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQoreworCXJl
dHVybiBwZGV2LT5jbGFzcyA9PSBQQ0lfQ0xBU1NfRElTUExBWV9WR0EgPDwgODsKK30KKwogc3Rh
dGljIGludAogcXhsX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0
IHBjaV9kZXZpY2VfaWQgKmVudCkKIHsKQEAgLTg3LDkgKzkyLDE3IEBAIHF4bF9wY2lfcHJvYmUo
c3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiAJ
aWYgKHJldCkKIAkJZ290byBkaXNhYmxlX3BjaTsKIAorCWlmIChpc192Z2EocGRldikpIHsKKwkJ
cmV0ID0gdmdhX2dldF9pbnRlcnJ1cHRpYmxlKHBkZXYsIFZHQV9SU1JDX0xFR0FDWV9JTyk7CisJ
CWlmIChyZXQpIHsKKwkJCURSTV9FUlJPUigiY2FuJ3QgZ2V0IGxlZ2FjeSB2Z2EgaW9wb3J0c1xu
Iik7CisJCQlnb3RvIGRpc2FibGVfcGNpOworCQl9CisJfQorCiAJcmV0ID0gcXhsX2RldmljZV9p
bml0KHFkZXYsICZxeGxfZHJpdmVyLCBwZGV2KTsKIAlpZiAocmV0KQotCQlnb3RvIGRpc2FibGVf
cGNpOworCQlnb3RvIHB1dF92Z2E7CiAKIAlyZXQgPSBxeGxfbW9kZXNldF9pbml0KHFkZXYpOwog
CWlmIChyZXQpCkBAIC0xMDksNiArMTIyLDkgQEAgcXhsX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIAlxeGxfbW9kZXNldF9m
aW5pKHFkZXYpOwogdW5sb2FkOgogCXF4bF9kZXZpY2VfZmluaShxZGV2KTsKK3B1dF92Z2E6CisJ
aWYgKGlzX3ZnYShwZGV2KSkKKwkJdmdhX3B1dChwZGV2LCBWR0FfUlNSQ19MRUdBQ1lfSU8pOwog
ZGlzYWJsZV9wY2k6CiAJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwogZnJlZV9kZXY6CkBAIC0x
MjYsNiArMTQyLDggQEAgcXhsX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAKIAlx
eGxfbW9kZXNldF9maW5pKHFkZXYpOwogCXF4bF9kZXZpY2VfZmluaShxZGV2KTsKKwlpZiAoaXNf
dmdhKHBkZXYpKQorCQl2Z2FfcHV0KHBkZXYsIFZHQV9SU1JDX0xFR0FDWV9JTyk7CiAKIAlkZXYt
PmRldl9wcml2YXRlID0gTlVMTDsKIAlrZnJlZShxZGV2KTsKLS0gCjIuMTguMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
