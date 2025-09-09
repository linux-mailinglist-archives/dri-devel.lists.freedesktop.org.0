Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184FB50F60
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D6710E871;
	Wed, 10 Sep 2025 07:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="IseFGEPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3BAC10E263
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:58:59 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 364DC211427B;
 Tue,  9 Sep 2025 09:58:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 364DC211427B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1757437139;
 bh=Pv/oU1LXiNBnw2C4KJ3lYYcVnQdW+CH48yjRQgrC+L4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IseFGEPGEssiCZUsSfUqVkDwtO0KMmulp8IPNNysyZ8DCurpGQBRJzhAkkpas8MHA
 lemlmVu6EUk6jMKQj1yxU9fVbi0xJzsMQK5OKJ7e/7r80M6fwQnaMS3jJjETAr3gxu
 8qwnn+/6D2oLsZOkkzYA1HMwhzmbwekVtpjzkTMY=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, drawat.floss@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, ptsm@linux.microsoft.com
Subject: [RFC 2/3] drm/hyperv: Remove reference to hyperv_fb driver
Date: Tue,  9 Sep 2025 09:58:49 -0700
Message-Id: <1757437129-2612-1-git-send-email-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <E2D7F2119CB4>
References: <E2D7F2119CB4>
X-Spam-Status: No, score=-2.0 required=2.1 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Wed, 10 Sep 2025 07:28:23 +0000
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

Remove hyperv_fb references as the driver is removed.

Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/gpu/drm/Kconfig                   |  3 +--
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 15 +++++----------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f7ea8e895c0c..a39e5171f107 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -405,8 +405,7 @@ config DRM_HYPERV
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

