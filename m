Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7940EC97
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090836E939;
	Thu, 16 Sep 2021 21:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED346E918;
 Thu, 16 Sep 2021 21:25:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 3088C2B011E0;
 Thu, 16 Sep 2021 17:16:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 17:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=CIKjuTKOpJ1U/
 Mz/BBs71FfE4j37xXew7mAsA56YGIs=; b=GoKsCVZEfXTgwWaN0Z853jj5tmDG2
 5AUHfdS5eVc/KPsZki5k0/25qPcIotvWZ42mz0KujlKelUCOYIdtn8LxfUKEOIHc
 /tp5VwvCgh+curVCjvEojhdDmGMhRxjWVOtOAAN3LD6RamYKnfQ3tlqFATh3ih+B
 HDXGDA+S5M+LQujwiUi55mv93J7w+Ez4of6dCV6gustsQH29ZjyfZLBQPvoUsaX/
 iYuCUUizzZ71yLgfCCnoPcADGrUtZXYDRmzQzNopzyG962ubir33p4ET708+XAzP
 SmcLptY5LpAqKU1BP38pjmjIz9ZJeX9fJwNUu8EHjEbly+hStBuHs1UuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=CIKjuTKOpJ1U/Mz/BBs71FfE4j37xXew7mAsA56YGIs=; b=WOLLmO3K
 910qr9JBQ7Hfe/6mPA2zY+V64TA4AZvNlSTuueSWuObexAagzqgBgOqG0REcEf3n
 NJi++KE2OovaolCCPF52xX8d/g5VI/orQgAHWkm7A5+ygOK29Jfp6Bnj8z8rZ+oA
 28PYHi3xSkeWePLX/1iwTFIxTdFXl1/sC8X9ObjAoAhQNLqrfGg53Nuo0LV7HlZq
 joRW+pbyvM+56GI+BhuD7yVRyfWKeQ55jPbzJPHpj9OrK8BosyKxEd52X1JMvFup
 9/krUlPLXR/EMF/o5c587ox+obpP4Cwenegrl8VL3qJOVQaGblp40P52GIHSL+7h
 Wg+jM8YlOUgwrw==
X-ME-Sender: <xms:JLRDYSwu79nCAv3V185BiijRA1SODMAI32BxfHRiBW8t7K48KUTg1g>
 <xme:JLRDYeRM2K5DWpbbulfle86vJV10oIKHhhd5eNGvNDkVvvC3zLPW550ppNNJvkr1Y
 2oDTUy93wntFL5C-Q>
X-ME-Received: <xmr:JLRDYUXtvVhvK7FYgIRicsj0i4tJgt3VDU0Ahgxs35srr6axTEU1Bz3sG-_w4x8UrDUd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:JLRDYYhwiUIsL9do37659i3Ntdl2Wdt1v8Yz6b4aZn-Su6ri7wMxqQ>
 <xmx:JLRDYUDeQrm4p9PslOIokjpLHoMkSJ6ld81C9bbfCJ9SQlY2VcZviw>
 <xmx:JLRDYZK9DNkXRtKuZw8T7mvH_DEwtB_LCaRPfS3XUpRAE1Fu_qNF_g>
 <xmx:JLRDYUvDexJKOaHOpJozkEhA2Eo4SuVrhz_4U1fKsox6ss0-AVH1ZlsbKGE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:17 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 05/15] drm/vmwgfx: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:42 +0200
Message-Id: <20210916211552.33490-6-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c | 11 +++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c   | 12 ++++++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 28af34ab6ed6..7df35c6f1458 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -28,6 +28,7 @@
 #include "vmwgfx_drv.h"
 #include "vmwgfx_devcaps.h"
 #include <drm/vmwgfx_drm.h>
+#include <drm/drm_drv.h>
 #include "vmwgfx_kms.h"
 
 int vmw_getparam_ioctl(struct drm_device *dev, void *data,
@@ -172,6 +173,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 	struct drm_vmw_rect __user *clips_ptr;
 	struct drm_vmw_rect *clips = NULL;
 	struct drm_framebuffer *fb;
+	struct drm_modeset_acquire_ctx ctx;
 	struct vmw_framebuffer *vfb;
 	struct vmw_resource *res;
 	uint32_t num_clips;
@@ -203,7 +205,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 		goto out_no_copy;
 	}
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	fb = drm_framebuffer_lookup(dev, file_priv, arg->fb_id);
 	if (!fb) {
@@ -231,7 +233,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 out_no_surface:
 	drm_framebuffer_put(fb);
 out_no_fb:
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 out_no_copy:
 	kfree(clips);
 out_clips:
@@ -250,6 +252,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 	struct drm_vmw_rect __user *clips_ptr;
 	struct drm_vmw_rect *clips = NULL;
 	struct drm_framebuffer *fb;
+	struct drm_modeset_acquire_ctx ctx;
 	struct vmw_framebuffer *vfb;
 	uint32_t num_clips;
 	int ret;
@@ -280,7 +283,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 		goto out_no_copy;
 	}
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	fb = drm_framebuffer_lookup(dev, file_priv, arg->fb_id);
 	if (!fb) {
@@ -303,7 +306,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 out_no_ttm_lock:
 	drm_framebuffer_put(fb);
 out_no_fb:
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 out_no_copy:
 	kfree(clips);
 out_clips:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 74fa41909213..268095cb8c84 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -33,6 +33,7 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 #include "vmwgfx_kms.h"
 
@@ -243,15 +244,17 @@ void vmw_kms_legacy_hotspot_clear(struct vmw_private *dev_priv)
 	struct drm_device *dev = &dev_priv->drm;
 	struct vmw_display_unit *du;
 	struct drm_crtc *crtc;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	drm_for_each_crtc(crtc, dev) {
 		du = vmw_crtc_to_du(crtc);
 
 		du->hotspot_x = 0;
 		du->hotspot_y = 0;
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
 void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv)
@@ -1012,9 +1015,10 @@ static int vmw_framebuffer_bo_dirty(struct drm_framebuffer *framebuffer,
 	struct vmw_framebuffer_bo *vfbd =
 		vmw_framebuffer_to_vfbd(framebuffer);
 	struct drm_clip_rect norect;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret, increment = 1;
 
-	drm_modeset_lock_all(&dev_priv->drm);
+	DRM_MODESET_LOCK_ALL_BEGIN((&dev_priv->drm), ctx, 0, ret);
 
 	if (!num_clips) {
 		num_clips = 1;
@@ -1040,7 +1044,7 @@ static int vmw_framebuffer_bo_dirty(struct drm_framebuffer *framebuffer,
 
 	vmw_cmd_flush(dev_priv, false);
 
-	drm_modeset_unlock_all(&dev_priv->drm);
+	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
 
 	return ret;
 }
-- 
2.33.0

