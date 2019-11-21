Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F63105307
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 14:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D2C6EE86;
	Thu, 21 Nov 2019 13:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B026EE86
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 13:29:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88C822070B;
 Thu, 21 Nov 2019 13:29:21 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: Fix Kconfig indentation
Date: Thu, 21 Nov 2019 21:29:19 +0800
Message-Id: <20191121132919.29430-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574342963;
 bh=dIc++Icth9GruF6aBBYRNcCyQoKImA4/t49XcatR4Ig=;
 h=From:To:Cc:Subject:Date:From;
 b=neYUUfstg+Bc8trip8Y8omRdynVEAse6l+mu4mDVSzhSdq1Gj+GwQcdA/W4BenhJ1
 gKt7iCJho+qJV5ONRq86CDAw4lfrr0PjwmtLSFcFgcBpHFpDOyoiLK7MuduwyZLKRS
 lt0Az+ZzQWwbwDlagCCrfDYM+SXFP9++Wdr0BwQ4=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvS2NvbmZpZyB8
IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC9LY29uZmlnIGIvZHJpdmVycy9n
cHUvZHJtL3ZjNC9LY29uZmlnCmluZGV4IDdjMjMxN2VmZDViNy4uMTE4ZThhNDI2YjFhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZjNC9LY29uZmlnCkBAIC0yMiw5ICsyMiw5IEBAIGNvbmZpZyBEUk1fVkM0CiAJICBvdXIgZGlz
cGxheSBzZXR1cC4KIAogY29uZmlnIERSTV9WQzRfSERNSV9DRUMKLSAgICAgICBib29sICJCcm9h
ZGNvbSBWQzQgSERNSSBDRUMgU3VwcG9ydCIKLSAgICAgICBkZXBlbmRzIG9uIERSTV9WQzQKLSAg
ICAgICBzZWxlY3QgQ0VDX0NPUkUKLSAgICAgICBoZWxwCisJYm9vbCAiQnJvYWRjb20gVkM0IEhE
TUkgQ0VDIFN1cHBvcnQiCisJZGVwZW5kcyBvbiBEUk1fVkM0CisJc2VsZWN0IENFQ19DT1JFCisJ
aGVscAogCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgQnJvYWRjb20gVkM0IEdQ
VQogCSAgYW5kIHdhbnQgdG8gdXNlIENFQy4KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
