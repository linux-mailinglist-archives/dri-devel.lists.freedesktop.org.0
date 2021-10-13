Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C601A42CB96
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54E46EB1C;
	Wed, 13 Oct 2021 20:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721EE6EB1F;
 Wed, 13 Oct 2021 20:49:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id CB875581176;
 Wed, 13 Oct 2021 16:49:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 13 Oct 2021 16:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=LhomnjUlqNsoF
 aXjW53m6Qq/8PoE2SUei4fpnPBAfNQ=; b=iKG4y+A2JqVVm8l28icjhk+M5e4hq
 LJQggHCk+5NORH5OjIjccbN1vx5rv8MsqOzL+PB7NKpttadlv5XeTS8cqH52C0Bg
 H9jp1j/hxvvUzWd3Tt8tYb4B89ykM/a1lIwrtrjtsF7E3cxMmOOoJHM9iTjYJ8kN
 GbnpbFDO72G9j8uU8FSf1ocOBagaQJw8gkNBey6Lpem9j9MbLeNtUlWz/l77gC6F
 q0354BhzR6/SOCeH3jUY/SSL5tVhBi9ETH+j1MOojhLza7c0HIIWJoa6w0xciioK
 inQNzqqaTVghoQtJ963logLvtk6dhmV+o7zIwRanoK3mELhwGXlG3GLsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LhomnjUlqNsoFaXjW53m6Qq/8PoE2SUei4fpnPBAfNQ=; b=IxYvdkPL
 SWFoZepDfvqBA3c/3x8UkOogDOaKWjj1MxqM9m7WN6cqsXqyNemMCMelM79zBe3U
 X2QE4ZUkEVdr9RMUKxyrRGiZF1m2l9ZxueAyyHVDOudNaNxc/tT02AlE98Z2k3xK
 qrbP5jUhm2yg4DHMJb4X04svrL5OAuluvfwmOsGTxv5elU6TT8lSY4ofEbT4OUFm
 JfPyA9EO1k291HVETcYzowhRc8Qt1fdz8EC/aFIbMcmUTsU3oOItf7gtLVx+u4dk
 E9NNT2gjrzFg56tdPW4pVuBHrq/eQ1BTp39AaSQIAOHlT+OnSHtN3+8CHH51UMjL
 ZHyJPzqweKa3Nw==
X-ME-Sender: <xms:Q0ZnYT-39_C__Sx_jPUL5qkfY3T4JTrxvBoh7FKAutn-RqbxFmJDTQ>
 <xme:Q0ZnYfu7JQAo2jNfz5kdJdvc36XxmwTKPQF_PtleEWA7_uMwyHFzE9pe3CakSLX5c
 H3YnB9uFEywjePR3g>
X-ME-Received: <xmr:Q0ZnYRDkuON6OqZf6cp8kTqEHP0t4o0jWno3e3aoBvNwWD-ksIOeBto1FRPwFlR5a-BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:Q0ZnYffmQnZVn1JvuEPmGUydNjkVHSVJesUescsEej-0ArySfaKprg>
 <xmx:Q0ZnYYMF9s_cft9AyxBGn5iYijjWuJAVB1SDGiN6Kfu5z4jfdkpWyw>
 <xmx:Q0ZnYRmnXsS1Ya9XFnQdTa0ogt1cFJ7suvEimJZeXxjzE2HHWysV7A>
 <xmx:Q0ZnYXqzy_GM6XKmByBcj9UnJVyl8tLz9joqCT4-er2unQuqAwTODA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:05 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 05/20] drm/vmwgfx: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:31 +0200
Message-Id: <20211013204846.90026-6-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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

