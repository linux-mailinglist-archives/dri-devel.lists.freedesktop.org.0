Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD06DCDF440
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 05:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4DB10FEBE;
	Sat, 27 Dec 2025 04:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="ov3p6SNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64C4A10FEBE
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 04:31:48 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id D227B21244C0;
 Fri, 26 Dec 2025 20:31:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D227B21244C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1766809906;
 bh=nAryqAjlxZ51ntKq8w3T+63nHBfKHSvkDBHjt9RQKlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ov3p6SNMayn6kmpNQPi3LK9poaEPTXs+Ubu+C4fO9UaLW7JIAZXb1Q5PzDpuBkDLg
 zbw9J3Ft1bw/IWwxbvAy7JJdcFT819sfEcsqn1GcrHG7DODAF3vkiHqAz2AzEh4mBc
 aZNrqnMjtgFCvzEyNA4FdZaq7qURHdJtlaRU8iHQ=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com, linux-hyperv@vger.kernel.org,
 drawat.floss@gmail.com, tzimmermann@suse.de
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/3] drm/hyprev: Remove reference to hyperv_fb driver
Date: Fri, 26 Dec 2025 20:31:46 -0800
Message-Id: <1766809906-26535-1-git-send-email-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
References: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
X-Spam-Status: No, score=-2.0 required=1.7 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
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

Remove hyperv_fb reference as the driver is removed.

Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/gpu/drm/Kconfig                   |  3 +--
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 15 +++++----------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7e6bc0b3a589..01a1438b35a0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -407,8 +407,7 @@ config DRM_HYPERV
 	help
 	 This is a KMS driver for Hyper-V synthetic video device. Choose this
 	 option if you would like to enable drm driver for Hyper-V virtual
-	 machine. Unselect Hyper-V framebuffer driver (CONFIG_FB_HYPERV) so
-	 that DRM driver is used by default.
+	 machine.
 
 	 If M is selected the module will be called hyperv_drm.
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
index 013a7829182d..051ecc526832 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2021 Microsoft
- *
- * Portions of this code is derived from hyperv_fb.c
  */
 
 #include <linux/hyperv.h>
@@ -304,16 +302,13 @@ int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
  * but the Hyper-V host still draws a point as an extra mouse pointer,
  * which is unwanted, especially when Xorg is running.
  *
- * The hyperv_fb driver uses synthvid_send_ptr() to hide the unwanted
- * pointer, by setting msg.ptr_pos.is_visible = 1 and setting the
- * msg.ptr_shape.data. Note: setting msg.ptr_pos.is_visible to 0 doesn't
+ * Hide the unwanted pointer, by setting msg.ptr_pos.is_visible = 1 and setting
+ * the msg.ptr_shape.data. Note: setting msg.ptr_pos.is_visible to 0 doesn't
  * work in tests.
  *
- * Copy synthvid_send_ptr() to hyperv_drm and rename it to
- * hyperv_hide_hw_ptr(). Note: hyperv_hide_hw_ptr() is also called in the
- * handler of the SYNTHVID_FEATURE_CHANGE event, otherwise the host still
- * draws an extra unwanted mouse pointer after the VM Connection window is
- * closed and reopened.
+ * The hyperv_hide_hw_ptr() is also called in the handler of the
+ * SYNTHVID_FEATURE_CHANGE event, otherwise the host still draws an extra
+ * unwanted mouse pointer after the VM Connection window is closed and reopened.
  */
 int hyperv_hide_hw_ptr(struct hv_device *hdev)
 {
-- 
2.49.0

