Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3730A425BD9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D5A6F4CB;
	Thu,  7 Oct 2021 19:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927FF6F4A9;
 Thu,  7 Oct 2021 19:38:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 9D4312B009FD;
 Thu,  7 Oct 2021 15:38:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 07 Oct 2021 15:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=LhomnjUlqNsoF
 aXjW53m6Qq/8PoE2SUei4fpnPBAfNQ=; b=Oa4oKR2nswysrlr5q3GakiSRvOqLq
 GFUEujWKXqvCC2BsPe5w2iWSZi2jbClaB40fp45fZorNKj6gaIwc7prw9OFiF+lt
 ZxomB5hJkE5JWqGuUpxXgvJ5WrHUWq2X7zzHuW+m0O0MK6sKbsLTanV+0C1hGTFW
 mhJ5lz0VwhXXwqMfrfWyiPBfBaOgSJZph21dN9ExpV1zeCdu6yJl9T6ZmUFvJ+vo
 VFR66Ou2xr7i0EqMYHIpsBKOP1VrW67v0lYmhH8VEg+URAn17ZpoHeB8D3vgxpSC
 D4YtHMZMvuTwZOorBoaPvBEFdPrVEk08R89FxSwB2Nna6D+JiBcSFkSbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LhomnjUlqNsoFaXjW53m6Qq/8PoE2SUei4fpnPBAfNQ=; b=YVLR4plR
 1DIGfdmnU8NiHehYeVVw56jFXoXoxzr2jOYYY/0vAtZICgG0wQXs6fx1GCwvgeeP
 O6cD5+zFxgNrJxjHyohMLgz5A5pEsmQ5eLY1ZxWv/2ETlKxUX+6JLdEH3LPjPujv
 Rhdv2b/Pt9qsrVeE5/NXopOv2z/cJVxzQiwOf3Jd9suI+Zq7+Tv0Dtn3d55qNaB4
 mBfXYvWlhCv6AOpwUB7/hgJcaarvwzwE05GA4o6B0M7YoalSvpa9txw1IXCll+9j
 oAHV+xU9WU6r4xqDZUhE7ab4SRtIP4UnBQVgL62w04EPelXPg0oglCwrgM+eqPnW
 pdm+G1zu6A6dZg==
X-ME-Sender: <xms:rkxfYaGfFanj66OenqRcYARU3G5-HOyjmkL9rEZ1J_RTpgxcHXDKIQ>
 <xme:rkxfYbW5AXrNFLD24dORijWS7DHXYWVYkQmc2RPCJEjqLGNwxcjZGLziUvEN71fzK
 BPqIwC3_bWFM7I-Gg>
X-ME-Received: <xmr:rkxfYUII0Z-pKTM-ZG5AtSAJOFaKzjGQ8D61-ISQyU0BHe83t27cATsca_SNKBQeZjrd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:rkxfYUE8J_fqa0NbsbznXkioPBQGwcnKkrhcI3_W7eYPWvAlJ0FG9w>
 <xmx:rkxfYQXSBqIBoy88JcotawVFvYAI7AwxXu68FP2cIXCxd4RDhRtvGg>
 <xmx:rkxfYXOGGpFghsfe974W6ehwViVpD031HS9WZ3KRNBzOereOyZPteg>
 <xmx:rkxfYUTv99kdA3h_fJaxcR2imDX_btXEgbzBksXf0MUwlN0isvLptF9q3Og>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:20 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 05/20] drm/vmwgfx: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:40 +0200
Message-Id: <20211007193755.29579-6-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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
Reviewed-by: Sean Paul <sean@poorly.run>
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

