Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A681ACE809
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 17:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC26B89F69;
	Mon,  7 Oct 2019 15:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531D989F2D;
 Mon,  7 Oct 2019 15:42:01 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iHV8x-0000bB-Pu; Mon, 07 Oct 2019 15:41:51 +0000
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: make array hw_engine_mask static,
 makes object smaller
Date: Mon,  7 Oct 2019 16:41:51 +0100
Message-Id: <20191007154151.23245-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkRvbid0IHBv
cHVsYXRlIHRoZSBhcnJheSBod19lbmdpbmVfbWFzayBvbiB0aGUgc3RhY2sgYnV0IGluc3RlYWQg
bWFrZSBpdApzdGF0aWMuIE1ha2VzIHRoZSBvYmplY3QgY29kZSBzbWFsbGVyIGJ5IDMxNiBieXRl
cy4KCkJlZm9yZToKICAgdGV4dAkgICBkYXRhCSAgICBic3MJICAgIGRlYwkgICAgaGV4CWZpbGVu
YW1lCiAgMzQwMDQJICAgNDM4OAkgICAgMzIwCSAgMzg3MTIJICAgOTczOAlncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfcmVzZXQubwoKQWZ0ZXI6CiAgIHRleHQJICAgZGF0YQkgICAgYnNzCSAgICBkZWMJ
ICAgIGhleAlmaWxlbmFtZQogIDMzNTI4CSAgIDQ1NDgJICAgIDMyMAkgIDM4Mzk2CSAgIDk1ZmMJ
Z3B1L2RybS9pOTE1L2d0L2ludGVsX3Jlc2V0Lm8KCihnY2MgdmVyc2lvbiA5LjIuMSwgYW1kNjQp
CgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3Jlc2V0LmMgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmVzZXQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX3Jlc2V0LmMKaW5kZXggZWViM2JkMGM0ZDY5Li5kYjU4Y2E5YmVlM2Eg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3Jlc2V0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmVzZXQuYwpAQCAtMjg1LDcgKzI4NSw3IEBA
IHN0YXRpYyBpbnQgZ2VuNl9yZXNldF9lbmdpbmVzKHN0cnVjdCBpbnRlbF9ndCAqZ3QsCiAJCQkg
ICAgICB1bnNpZ25lZCBpbnQgcmV0cnkpCiB7CiAJc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5n
aW5lOwotCWNvbnN0IHUzMiBod19lbmdpbmVfbWFza1tdID0geworCXN0YXRpYyBjb25zdCB1MzIg
aHdfZW5naW5lX21hc2tbXSA9IHsKIAkJW1JDUzBdICA9IEdFTjZfR1JET01fUkVOREVSLAogCQlb
QkNTMF0gID0gR0VONl9HUkRPTV9CTFQsCiAJCVtWQ1MwXSAgPSBHRU42X0dSRE9NX01FRElBLApA
QCAtNDA4LDcgKzQwOCw3IEBAIHN0YXRpYyBpbnQgZ2VuMTFfcmVzZXRfZW5naW5lcyhzdHJ1Y3Qg
aW50ZWxfZ3QgKmd0LAogCQkJICAgICAgIGludGVsX2VuZ2luZV9tYXNrX3QgZW5naW5lX21hc2ss
CiAJCQkgICAgICAgdW5zaWduZWQgaW50IHJldHJ5KQogewotCWNvbnN0IHUzMiBod19lbmdpbmVf
bWFza1tdID0geworCXN0YXRpYyBjb25zdCB1MzIgaHdfZW5naW5lX21hc2tbXSA9IHsKIAkJW1JD
UzBdICA9IEdFTjExX0dSRE9NX1JFTkRFUiwKIAkJW0JDUzBdICA9IEdFTjExX0dSRE9NX0JMVCwK
IAkJW1ZDUzBdICA9IEdFTjExX0dSRE9NX01FRElBLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
