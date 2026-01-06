Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF0CF6E03
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 07:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9068610E48F;
	Tue,  6 Jan 2026 06:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="off82Ed6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AFD10E48F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 06:19:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 155D560146;
 Tue,  6 Jan 2026 06:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AC2C19421;
 Tue,  6 Jan 2026 06:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767680381;
 bh=Lb9y6QjIHVxs19PYkMuZkTsM4jjtnJJgID8rCPwwfqE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=off82Ed6psfiILeSEaDWaxGtFe2Lga/9ajHRiJ8oLsPOEaIF7dfz8sFvcvVz/UpGb
 9j3l1OTQjS8JXlZTQk+WSkehvuSOoufm7Vsab/4L4YFuE6QHN6/xiEN1AwA2+Ku31i
 VDXsnCMOH8eMjCQKlayXngefSSQKE3pvbfLLt1jspYJqTbTWGGe+geFF30u8X21pDw
 BAFd6xEukjtSSorq5cfOJc5NXXZo/GQx0XhFsfoWKszOipJBX66TVj0997GbmvHAIp
 JzjFfGz4nh8FqAoVvFKP1YnsmRuCoVWawaYQC14zdUTT8WT2hJ14e1e2+b+Uq2yOwg
 I0W2z119EPpCA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 05 Jan 2026 23:19:27 -0700
Subject: [PATCH 2/2] drm/panic: Fix expected string for QR_CODE in
 drm_panic_type_map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-2-55228bd4b0f8@kernel.org>
References: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
In-Reply-To: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Lb9y6QjIHVxs19PYkMuZkTsM4jjtnJJgID8rCPwwfqE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkxK8t/fP90JeUB/7yzAtc77LgU3i3v1OnJvV95/jmnf
 +uJtdWiHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAit1sZGWanSKxkmP9CxODa
 BnfFki3ZPsapv748/+9k90HH1Sld/RXD/zq7Xinvm5Gz1ZZqqcq9sTPVXnDxfOBLXpPVlxgYswO
 /cgAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The help text of CONFIG_DRM_PANIC_SCREEN_QR_CODE documents the expected
value to CONFIG_DRM_PANIC_SCREEN as "qr_code" but drm_panic_type_map
checks for "qr". Adjust drm_panic_type_map and the module description to
match so that existing configurations do not stop working.

Fixes: e85e9ccf3f84 ("drm/panic: Report invalid or unsupported panic modes")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/drm_panic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 0cd574dd9d88..d6d3b8d85dea 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -823,7 +823,7 @@ static const char *drm_panic_type_map[] = {
 	[DRM_PANIC_TYPE_KMSG] = "kmsg",
 	[DRM_PANIC_TYPE_USER] = "user",
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
-	[DRM_PANIC_TYPE_QR] = "qr",
+	[DRM_PANIC_TYPE_QR] = "qr_code",
 #endif
 };
 
@@ -855,7 +855,7 @@ static const struct kernel_param_ops drm_panic_ops = {
 module_param_cb(panic_screen, &drm_panic_ops, NULL, 0644);
 MODULE_PARM_DESC(panic_screen,
 #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
-		 "Choose what will be displayed by drm_panic, 'user', 'kmsg' or 'qr' [default="
+		 "Choose what will be displayed by drm_panic, 'user', 'kmsg' or 'qr_code' [default="
 #else
 		 "Choose what will be displayed by drm_panic, 'user' or 'kmsg' [default="
 #endif

-- 
2.52.0

