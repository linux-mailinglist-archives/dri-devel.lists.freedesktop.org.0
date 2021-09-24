Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387AA416C46
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E026EE2C;
	Fri, 24 Sep 2021 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A018D6EDF8;
 Fri, 24 Sep 2021 06:50:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D46CF581069;
 Fri, 24 Sep 2021 02:43:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 Sep 2021 02:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=LhomnjUlqNsoF
 aXjW53m6Qq/8PoE2SUei4fpnPBAfNQ=; b=K1AfZIIO4IkO7rXo6BeCtISMOezW9
 p0XAZeQ5ROZ5s+Gi24+L/wUZ9oRPNztMp6otQpeKoRuwiJO0XSbHOBOAgTkYsNFB
 1J27MkkTAR5wY13fhVBGcShnt4tUB6Ts8mVvOdSo51d0nYOHn249wC28HzboLtvE
 xQcUmmyf3fMl7I6mn800Kwcn7TrRv1pbNrXP8eBJLR7Ew2pjXB+S9Zl6+mjJiRJi
 w/FsHViFPWy2YIQGd+xOl02nH+ysLYAemLtHwi6J02oFF0ARip0xFc3ElZjtv5Cs
 l5Fl82ID2VLFsQteHqOVz6Gfa6+ntPqcRpiW0imvKaE9v9zk/e+/WJsNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=LhomnjUlqNsoFaXjW53m6Qq/8PoE2SUei4fpnPBAfNQ=; b=Te8bIQe4
 PKlI5NVZrHvSnUmPxNabRd73mq1fB+zQTWrdHppWGBe+yN4HH81pRG6gCJNQfy0Z
 PJKQHXF21JQEhincV8a8EFC1MQN+jQPbMqFYfqgFSRPAwolBVnYo1ypjfwfNraqz
 4yUZQ2Ct9jUaCkZmeIUe2x2kdJSIG23HjTkssgaz1GHIWDWGqzgvY3p7YS4O7LcR
 7TlrJC+bQVjQ2BD9+lUlFTQYqTWFik88P+G6BJne8XHI4RHGDvAWewgHichjP3tC
 Gw+oyLWgYLWvZCJNXy1M0i7XCaxvgwsBLVS1s+ctpYz4tI8mVn6jJHA96Wo1XsYr
 nSAv8gFDD62ogg==
X-ME-Sender: <xms:onNNYTU4NNNvb2mBGckfQruj49CNb2EnzP6xoJqBLrm6dWEnVjX3DA>
 <xme:onNNYbmojeZpMkR2K9G0KfGK01U14L88zlA7uKdrDqwO4_WS-tlqSW0SzISC3kr5j
 qdZcaQOLEgCY2JFCA>
X-ME-Received: <xmr:onNNYfZk018P2xLxbmYJQyq_DVjsyOFBqG-QvzkMaB4jKtr9Z-WHPnVG-DSN9pnkhyUq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:onNNYeVsYmUBDLSJPusZ1as3dU52yWlz7MWzapUPfyjovutvEGCHhg>
 <xmx:onNNYdnfHc4b7uYmqtDDKPuRKo_k2Q2HFVPhCMrmYYbl9Z9b-Mitow>
 <xmx:onNNYbfhx6TPH2i6ZRXGIts_5hMefdqWMJoa4_gnWkam-PROq9hWAg>
 <xmx:onNNYeiQsNcQChkQ5B4sV30YJu69uJU9y1xXgVpXWWZZopAWM1MvUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:43:44 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 05/17] drm/vmwgfx: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:12 +0200
Message-Id: <20210924064324.229457-6-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924064324.229457-1-greenfoo@u92.eu>
References: <20210924064324.229457-1-greenfoo@u92.eu>
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

