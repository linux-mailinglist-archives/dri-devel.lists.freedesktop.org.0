Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD1F40EC7D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B846E5D2;
	Thu, 16 Sep 2021 21:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Thu, 16 Sep 2021 21:25:55 UTC
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6D06E5B2;
 Thu, 16 Sep 2021 21:25:55 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 98DB12B011F9;
 Thu, 16 Sep 2021 17:16:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 16 Sep 2021 17:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=pIW1yhpY2jJ4E
 yxUk6a/ypbVJODE1udgZ5sxtZ0GTRI=; b=AbZcP37HkQXyuEBwbrDgw/fLN96WO
 sQ2g1ycwvIABnzym8qRrfFgkITuW7GFi458AXCablFunMglNLU61bJ4wdl38x/N6
 pPLz4SN+1ikJRgC53dMljr8yJyEiKg2prn3K/8m/iVshrPROs8LljBXL0L+4OvH0
 Xww4Lz7TMZaeF6AAM+iDy/w7W5P4O8DENH31Z8dJh6zoMO2EyEFbV0Jq6QTwnB8x
 Wd3TcDGh3ooGXoM3zmLdzV8x4BTqwgrfAkdiCqxulX05iMjKLxuitsLtUmKiMiKh
 V+DaU3rLnFoVBDsfQiao4o+WsXIxD6GlhQygTzUgz5wavEkOMC5nnFd8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=pIW1yhpY2jJ4EyxUk6a/ypbVJODE1udgZ5sxtZ0GTRI=; b=wSS2ZQqe
 y+FppsI/3qt7stSAg4zqkuQAoomHm9Ig/YSkyxLx94KK+UwrAISuBT2/uvB6CHXl
 gQEeH6qCrIGd22KjbP6Eou5YyhSC+tvu9PWmynmmDmbj5JYJhcFwu+fyK4MLWJbB
 LR0ixS0UEZZcFZ6y5cDvwy151fxV/naNMjmFMpo6cPnBemsHLriGmFU66UzKG0d8
 W6H7aOEXjfz04Hfz0RdGEc/TLy4WNamJsxxc2UGPxcs9hlVyRulbN5+h6PiWuQ4e
 /q0+7GWJV3HSj8xk92QR71fh/eh8ZDhqL7jRZRQPnkICjf+oYscxCPnk0yf9EyuK
 P5bO4B4YHxhXbg==
X-ME-Sender: <xms:QrRDYQEVNp0tt_QeugCEUVLyP_Q7W8PKAOTmEyNAgiS99lTDGBPfVA>
 <xme:QrRDYZXzxwlwRNHZ5FIoVPwNYKE8MLHyEaiBtIj_eV_TNIsph5853oYs9s8gRWtrd
 C42BNvEAcBO_K8YmA>
X-ME-Received: <xmr:QrRDYaLstome4ubLfVkOm4rpVZA76sbaP8ZtUGJbHFFObko-SAXLpuCeoMIPbsbKiGhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:QrRDYSG5t-G1RPYk5E_b-GwJZxIC0SkOI-Le4QYzgb3N6jV1IiZ2kA>
 <xmx:QrRDYWU9PbDen2N2fgVP3DeVioZdcmM8KS_oOoa9LrX98-uB8qffzA>
 <xmx:QrRDYVN-Pr8ckA8VtwHvF-IbVxcZL6tjVmAENnnME9l1yEbZrLjdKQ>
 <xmx:Q7RDYSRkIR8ksuGK1fnDV8TUckLdvi3MEdhiIaZ5BBIUIjWkdgBeWoIUFpM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:48 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 12/15] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu, 16 Sep 2021 23:15:49 +0200
Message-Id: <20210916211552.33490-13-greenfoo@u92.eu>
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
 drivers/gpu/drm/i915/display/intel_audio.c    | 12 +++--
 drivers/gpu/drm/i915/display/intel_display.c  |  5 ++-
 .../drm/i915/display/intel_display_debugfs.c  | 35 ++++++++++-----
 drivers/gpu/drm/i915/display/intel_overlay.c  | 45 +++++++++----------
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  5 ++-
 drivers/gpu/drm/i915/i915_drv.c               | 12 +++--
 6 files changed, 67 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 532237588511..ab6a5a734b95 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -1214,7 +1214,9 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 {
 	struct i915_audio_component *acomp = data;
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
+	struct drm_modeset_acquire_ctx ctx;
 	int i;
+	int ret;
 
 	if (drm_WARN_ON(&dev_priv->drm, acomp->base.ops || acomp->base.dev))
 		return -EEXIST;
@@ -1224,14 +1226,14 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 					 DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
-	drm_modeset_lock_all(&dev_priv->drm);
+	DRM_MODESET_LOCK_ALL_BEGIN((&dev_priv->drm), ctx, 0, ret);
 	acomp->base.ops = &i915_audio_component_ops;
 	acomp->base.dev = i915_kdev;
 	BUILD_BUG_ON(MAX_PORTS != I915_MAX_PORTS);
 	for (i = 0; i < ARRAY_SIZE(acomp->aud_sample_rate); i++)
 		acomp->aud_sample_rate[i] = 0;
 	dev_priv->audio_component = acomp;
-	drm_modeset_unlock_all(&dev_priv->drm);
+	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
 
 	return 0;
 }
@@ -1241,12 +1243,14 @@ static void i915_audio_component_unbind(struct device *i915_kdev,
 {
 	struct i915_audio_component *acomp = data;
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(&dev_priv->drm);
+	DRM_MODESET_LOCK_ALL_BEGIN((&dev_priv->drm), ctx, 0, ret);
 	acomp->base.ops = NULL;
 	acomp->base.dev = NULL;
 	dev_priv->audio_component = NULL;
-	drm_modeset_unlock_all(&dev_priv->drm);
+	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
 
 	device_link_remove(hda_kdev, i915_kdev);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 997a16e85c85..dc2e4d89e5aa 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12511,6 +12511,7 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 int intel_modeset_init_nogem(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	enum pipe pipe;
 	struct intel_crtc *crtc;
 	int ret;
@@ -12562,9 +12563,9 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 	intel_vga_disable(i915);
 	intel_setup_outputs(i915);
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	for_each_intel_crtc(dev, crtc) {
 		struct intel_initial_plane_config plane_config = {};
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 8fdacb252bb1..d73af228862e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1057,11 +1057,13 @@ static int i915_display_info(struct seq_file *m, void *unused)
 	struct intel_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_modeset_acquire_ctx ctx;
 	intel_wakeref_t wakeref;
+	int ret;
 
 	wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	seq_printf(m, "CRTC info\n");
 	seq_printf(m, "---------\n");
@@ -1076,7 +1078,7 @@ static int i915_display_info(struct seq_file *m, void *unused)
 		intel_connector_info(m, connector);
 	drm_connector_list_iter_end(&conn_iter);
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
 
@@ -1087,9 +1089,11 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	int i;
+	int ret;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	seq_printf(m, "PLL refclks: non-SSC: %d kHz, SSC: %d kHz\n",
 		   dev_priv->dpll.ref_clks.nssc,
@@ -1132,7 +1136,7 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 		seq_printf(m, " mg_pll_tdc_coldst_bias: 0x%08x\n",
 			   pll->state.hw_state.mg_pll_tdc_coldst_bias);
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return 0;
 }
@@ -1193,13 +1197,15 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	struct skl_ddb_entry *entry;
 	struct intel_crtc *crtc;
+	int ret;
 
 	if (DISPLAY_VER(dev_priv) < 9)
 		return -ENODEV;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	seq_printf(m, "%-15s%8s%8s%8s\n", "", "Start", "End", "Size");
 
@@ -1223,7 +1229,7 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
 			   entry->end, skl_ddb_entry_size(entry));
 	}
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return 0;
 }
@@ -1303,10 +1309,12 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	struct intel_crtc *crtc;
 	int active_crtc_cnt = 0;
+	int ret;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	for_each_intel_crtc(dev, crtc) {
 		if (crtc->base.state->active) {
 			active_crtc_cnt++;
@@ -1315,7 +1323,7 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
 			drrs_status_per_crtc(m, dev, crtc);
 		}
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (!active_crtc_cnt)
 		seq_puts(m, "No active crtc found\n");
@@ -1607,8 +1615,10 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 {
 	struct drm_i915_private *dev_priv = m->private;
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	int level;
 	int num_levels;
+	int ret;
 
 	if (IS_CHERRYVIEW(dev_priv))
 		num_levels = 3;
@@ -1619,7 +1629,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 	else
 		num_levels = ilk_wm_max_level(dev_priv) + 1;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	for (level = 0; level < num_levels; level++) {
 		unsigned int latency = wm[level];
@@ -1640,7 +1650,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 			   level, wm[level], latency / 10, latency % 10);
 	}
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
 static int pri_wm_latency_show(struct seq_file *m, void *data)
@@ -1724,6 +1734,7 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
 	struct seq_file *m = file->private_data;
 	struct drm_i915_private *dev_priv = m->private;
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	u16 new[8] = { 0 };
 	int num_levels;
 	int level;
@@ -1753,12 +1764,12 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
 	if (ret != num_levels)
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	for (level = 0; level < num_levels; level++)
 		wm[level] = new[level];
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return len;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 7e3f5c6ca484..79c6940807a7 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1104,6 +1104,7 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 	struct drm_crtc *drmmode_crtc;
 	struct intel_crtc *crtc;
 	struct drm_i915_gem_object *new_bo;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
 	overlay = dev_priv->overlay;
@@ -1112,24 +1113,24 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	if (!(params->flags & I915_OVERLAY_ENABLE)) {
-		drm_modeset_lock_all(dev);
-		ret = intel_overlay_switch_off(overlay);
-		drm_modeset_unlock_all(dev);
+	if (params->flags & I915_OVERLAY_ENABLE) {
 
-		return ret;
-	}
+		drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
+		if (!drmmode_crtc)
+			return -ENOENT;
+		crtc = to_intel_crtc(drmmode_crtc);
 
-	drmmode_crtc = drm_crtc_find(dev, file_priv, params->crtc_id);
-	if (!drmmode_crtc)
-		return -ENOENT;
-	crtc = to_intel_crtc(drmmode_crtc);
+		new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
+		if (!new_bo)
+			return -ENOENT;
+	}
 
-	new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
-	if (!new_bo)
-		return -ENOENT;
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
-	drm_modeset_lock_all(dev);
+	if (!(params->flags & I915_OVERLAY_ENABLE)) {
+		ret = intel_overlay_switch_off(overlay);
+		goto out_unlock;
+	}
 
 	if (i915_gem_object_is_tiled(new_bo)) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -1194,14 +1195,11 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 	if (ret != 0)
 		goto out_unlock;
 
-	drm_modeset_unlock_all(dev);
-	i915_gem_object_put(new_bo);
-
-	return 0;
-
 out_unlock:
-	drm_modeset_unlock_all(dev);
-	i915_gem_object_put(new_bo);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	if (params->flags & I915_OVERLAY_ENABLE)
+		i915_gem_object_put(new_bo);
 
 	return ret;
 }
@@ -1263,6 +1261,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_intel_overlay_attrs *attrs = data;
 	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_modeset_acquire_ctx ctx;
 	struct intel_overlay *overlay;
 	int ret;
 
@@ -1272,7 +1271,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	ret = -EINVAL;
 	if (!(attrs->flags & I915_OVERLAY_UPDATE_ATTRS)) {
@@ -1329,7 +1328,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 
 	ret = 0;
 out_unlock:
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 8ac263f471be..e50e514e4897 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -76,6 +76,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 				     enum intel_pipe_crc_source *source)
 {
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	struct intel_encoder *encoder;
 	struct intel_crtc *crtc;
 	struct intel_digital_port *dig_port;
@@ -83,7 +84,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 
 	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	for_each_intel_encoder(dev, encoder) {
 		if (!encoder->base.crtc)
 			continue;
@@ -120,7 +121,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 			break;
 		}
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 59fb4c710c8c..7a30e2ff2fed 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1009,31 +1009,35 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
 static void intel_suspend_encoders(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	struct intel_encoder *encoder;
+	int ret;
 
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	for_each_intel_encoder(dev, encoder)
 		if (encoder->suspend)
 			encoder->suspend(encoder);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
 static void intel_shutdown_encoders(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	struct intel_encoder *encoder;
+	int ret;
 
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	for_each_intel_encoder(dev, encoder)
 		if (encoder->shutdown)
 			encoder->shutdown(encoder);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
 void i915_driver_shutdown(struct drm_i915_private *i915)
-- 
2.33.0

