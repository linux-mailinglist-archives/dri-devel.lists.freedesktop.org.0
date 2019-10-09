Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5322ED2126
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3806EA9D;
	Thu, 10 Oct 2019 06:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770E36E947
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:38:54 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iI8Qm-00017g-NT; Wed, 09 Oct 2019 10:38:52 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iI8Qm-0002Kb-9t; Wed, 09 Oct 2019 10:38:52 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/fb-helper: include drm_crtc_helper_internal.h for
 drm_fb_helper_modinit
Date: Wed,  9 Oct 2019 10:38:50 +0100
Message-Id: <20191009093850.8911-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009093850.8911-1-ben.dooks@codethink.co.uk>
References: <20191009093850.8911-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:07 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, mripard@kernel.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSBkcm1fY3J0Y19oZWxwZXJfaW50ZXJuYWwuaCBmb3IgZHJtX2ZiX2hlbHBlcl9tb2Rp
bml0CmRlZmluaXRpb24gdG8gZml4IHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMvZ3B1
L2RybS9kcm1fZmJfaGVscGVyLmM6MjQxMDoxMjogd2FybmluZzogc3ltYm9sICdkcm1fZmJfaGVs
cGVyX21vZGluaXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWdu
ZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKaW5kZXggMjNlMTAwNzU2MTlmLi5mMTM1
OWUzZTY3NmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwpAQCAtNDgsNiArNDgsNyBAQAogI2lu
Y2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgogCiAjaW5jbHVkZSAiZHJtX2ludGVybmFs
LmgiCisjaW5jbHVkZSAiZHJtX2NydGNfaGVscGVyX2ludGVybmFsLmgiCiAKIHN0YXRpYyBib29s
IGRybV9mYmRldl9lbXVsYXRpb24gPSB0cnVlOwogbW9kdWxlX3BhcmFtX25hbWVkKGZiZGV2X2Vt
dWxhdGlvbiwgZHJtX2ZiZGV2X2VtdWxhdGlvbiwgYm9vbCwgMDYwMCk7Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
