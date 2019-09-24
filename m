Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A551DBCD9D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD94E6EA96;
	Tue, 24 Sep 2019 16:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E223E6EA89
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:48:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 101E221906;
 Tue, 24 Sep 2019 16:48:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 68/70] drm: fix module name in edid_firmware log
 message
Date: Tue, 24 Sep 2019 12:45:47 -0400
Message-Id: <20190924164549.27058-68-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343722;
 bh=c/3eVmy+tc8mTD9hs64Cm6vfp43ZcUUAsBwfB3rTaF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PpzDOy5tx3f7YIApEUK747pmKx2pNxshkaLhcPTaQj+K4+nyTbM7wQQkTKo/EGKUb
 F1NKa47HpkBz/7rfip+GFK+CyPKxWmHpJjSVeujUy4yAf/wivVI/ERpxl/lst7gzpM
 DQXKBA74pygeG59mTjIJuO+99MhQ1rMgt6ZQdm+g=
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?G=C3=B6ran=20Uddeborg?= <goeran@uddeborg.se>,
 dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IGFkZTkyNTk5NWIxNzJmMWQ3NDEwZDFjNjY1YjJmNDdjNWU5OWJlZjAgXQoKVGhlIG1vZHVs
ZSBpcyBkcm1fa21zX2hlbHBlciwgbm90IGRybV9rbXNfZmlybXdhcmUuCgpCdWd6aWxsYTogaHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ1NDkKUmVwb3J0ZWQt
Ynk6IEfDtnJhbiBVZGRlYm9yZyA8Z29lcmFuQHVkZGVib3JnLnNlPgpGaXhlczogYWM2YzM1YTRk
OGM3ICgiZHJtOiBhZGQgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgc3VwcG9ydCBmb3IgZHJtX2tt
c19oZWxwZXIuZWRpZF9maXJtd2FyZSIpClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvbXNnaWQvMjAxOTA4MjEwOTQzMTIuNTUxNC0xLWphbmkubmlrdWxhQGludGVsLmNvbQpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2RybV9rbXNfaGVscGVyX2NvbW1vbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9rbXNfaGVscGVyX2NvbW1vbi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9rbXNfaGVscGVy
X2NvbW1vbi5jCmluZGV4IDljNWFlODI1YzUwNzguLjY5OTE3ZWNkNGFmNjcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fa21zX2hlbHBlcl9jb21tb24uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMKQEAgLTM5LDcgKzM5LDcgQEAgTU9EVUxFX0xJ
Q0VOU0UoIkdQTCBhbmQgYWRkaXRpb25hbCByaWdodHMiKTsKIC8qIEJhY2t3YXJkIGNvbXBhdGli
aWxpdHkgZm9yIGRybV9rbXNfaGVscGVyLmVkaWRfZmlybXdhcmUgKi8KIHN0YXRpYyBpbnQgZWRp
ZF9maXJtd2FyZV9zZXQoY29uc3QgY2hhciAqdmFsLCBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFt
ICprcCkKIHsKLQlEUk1fTk9URSgiZHJtX2ttc19maXJtd2FyZS5lZGlkX2Zpcm13YXJlIGlzIGRl
cHJlY2F0ZWQsIHBsZWFzZSB1c2UgZHJtLmVkaWRfZmlybXdhcmUgaW5zdGVhZC5cbiIpOworCURS
TV9OT1RFKCJkcm1fa21zX2hlbHBlci5lZGlkX2Zpcm13YXJlIGlzIGRlcHJlY2F0ZWQsIHBsZWFz
ZSB1c2UgZHJtLmVkaWRfZmlybXdhcmUgaW5zdGVhZC5cbiIpOwogCiAJcmV0dXJuIF9fZHJtX3Nl
dF9lZGlkX2Zpcm13YXJlX3BhdGgodmFsKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
