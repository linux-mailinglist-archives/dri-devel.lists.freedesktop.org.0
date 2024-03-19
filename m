Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA16880765
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 23:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDCB10F50C;
	Tue, 19 Mar 2024 22:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Bs7PSUBU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ECC10F50C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 22:51:40 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710888698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Xw8Fntem9pkDBQcyshBBdVCFOeEC0CMZHCoG76llOU=;
 b=Bs7PSUBUIXrXkjTLE5WLdo6LBfa+uEoI75OrXRWCzQEJzQWGrvLZV/TqLZwFcIM5/3C6Kr
 WhNIc6WRlC3f/Qp7g7mWDP9mHc5QftM0oOYTMGy/oUUp/iJYJaJUddUY2cdab4qgKxytkH
 CjAhzCa1wtms7/Drx2Y5nhVOoV5dGO0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 1/8] drm: xlnx: Fix kerneldoc
Date: Tue, 19 Mar 2024 18:51:14 -0400
Message-Id: <20240319225122.3048400-2-sean.anderson@linux.dev>
In-Reply-To: <20240319225122.3048400-1-sean.anderson@linux.dev>
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Fix a few errors in the kerneldoc. Mostly this addresses missing/renamed
members.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 6 +++---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.h   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 407bc07cec69..f79bf3fb8110 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -128,9 +128,9 @@ struct zynqmp_disp_layer {
  * struct zynqmp_disp - Display controller
  * @dev: Device structure
  * @dpsub: Display subsystem
- * @blend.base: Register I/O base address for the blender
- * @avbuf.base: Register I/O base address for the audio/video buffer manager
- * @audio.base: Registers I/O base address for the audio mixer
+ * @blend: Register I/O base address for the blender
+ * @avbuf: Register I/O base address for the audio/video buffer manager
+ * @audio: Registers I/O base address for the audio mixer
  * @layers: Layers (planes)
  */
 struct zynqmp_disp {
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 09ea01878f2a..b18554467e9c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -53,6 +53,7 @@ enum zynqmp_dpsub_format {
  * @drm: The DRM/KMS device data
  * @bridge: The DP encoder bridge
  * @disp: The display controller
+ * @layers: Video and graphics layers
  * @dp: The DisplayPort controller
  * @dma_align: DMA alignment constraint (must be a power of 2)
  */
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.h b/drivers/gpu/drm/xlnx/zynqmp_kms.h
index 01be96b00e3f..cb13c6b8008e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -22,9 +22,9 @@
 struct zynqmp_dpsub;
 
 /**
- * struct zynqmp_dpsub - ZynqMP DisplayPort Subsystem DRM/KMS data
+ * struct zynqmp_dpsub_drm - ZynqMP DisplayPort Subsystem DRM/KMS data
  * @dpsub: Backpointer to the DisplayPort subsystem
- * @drm: The DRM/KMS device
+ * @dev: The DRM/KMS device
  * @planes: The DRM planes
  * @crtc: The DRM CRTC
  * @encoder: The dummy DRM encoder
-- 
2.35.1.1320.gc452695387.dirty

