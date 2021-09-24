Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEF1416C59
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 08:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EAB6EE77;
	Fri, 24 Sep 2021 06:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E0B6EE06;
 Fri, 24 Sep 2021 06:50:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 71A0C581077;
 Fri, 24 Sep 2021 02:44:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 24 Sep 2021 02:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=LyptZ7D7ZViCI
 icf79djO86912HJzojvXacLkM6UT9I=; b=geNdKT834m6lveeBjTXlLmH/s4vug
 aN7RNlRYCa/0qEWQ4DmVB/y2JM3Io+jBQrjC0Gwb0mQxvVEVi8bFpxAbGe8F/lA7
 0VY8xA79f/47OJ/6UPM2u3awW0AgYVcyg4c2MV2e+R1jgfRmJxrhn/+df96CsJCG
 U2bIEfBfwVL8wkv57dR1Xxjg/PjhOnLSvxHG4Rg2o9s7sfn9pjMz/YZh6IHP+To8
 iNPFXGGMPnbwj3nFIFOr7q5ss27XVGE1dh1EqcE4usVTgd+NA5BZ7WaTbG4HGk/7
 VEJEdWm+3Nfcvcm2ORVLRLv112RzfFnvomhDAbMWjnUAcXQJrsPF2b7Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=LyptZ7D7ZViCIicf79djO86912HJzojvXacLkM6UT9I=; b=ZHqXjkHN
 B3bSNi1jQPrE2o9KN7nuKqv5jhpHxoq49Xwacix4jJQCZ8oGiSv1QvhSK2O5Taj1
 1i0ExZy5WI5Km0xz3KQ2y/l17irKYiTi8o+iVT2brkc/KDYJxzwwjMrQO6KSJDVA
 xpks215z+7LhY3kE2o+BtMFnl0U43/YCoL+cKrP0WD0SyD8B5DY2MfPqwwBuaZxD
 qQN80F19lKDI+VBPvoJYgku57MZUBnUoodjsqrdyUBukDvziLmrLQWEembF45QiV
 qYk6FgmzzEuKinu7Ij0mU4ddAc/FnNecgGio2mPS56s9RIzIY/2oxsWGRf8agKVt
 XAJTH5pS/0G9qw==
X-ME-Sender: <xms:uHNNYVZlPL1spB7flpgvYmDDcPtGxhV81xF7v-Ces5LH9jEdDk0KFw>
 <xme:uHNNYcaFAB1uYv990scFRVzey5aJR4tRMm0_VzXZy5QX0rkHXYwhS4RYTZQvJ0YZo
 oq8eaHwa7pQrPWcUA>
X-ME-Received: <xmr:uHNNYX8xUc-mQkTkoIf7_10XfP3EyGfGfAsrRjmV1h_9NBxb8Q-83zr9fpmI4aEmM-ZS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeefnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:uHNNYTqZAUDyPTpoArCPo5inwD5gxc45kHyF87DQYyChcc9DxEl7fg>
 <xmx:uHNNYQoeFHr-vPVoJWWAjQGZ2NtQq6h8B8doJHvcp6NL33kcroZRcQ>
 <xmx:uHNNYZRirOv5IaZGmAjrJZEaTNfPBKUDWQGkoUuqbzV877Vl9XuGkg>
 <xmx:uHNNYX189459x0dJHxU-4u0NRr0u5PK7bf1R-Fwequy4W3BdyszV0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 02:44:05 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v2 12/17] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Fri, 24 Sep 2021 08:43:19 +0200
Message-Id: <20210924064324.229457-13-greenfoo@u92.eu>
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
---
 drivers/gpu/drm/i915/display/intel_audio.c    | 16 ++++---
 drivers/gpu/drm/i915/display/intel_display.c  |  5 +-
 .../drm/i915/display/intel_display_debugfs.c  | 46 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_overlay.c  |  6 ++-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  7 ++-
 drivers/gpu/drm/i915/i915_drv.c               | 13 ++++--
 6 files changed, 61 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 532237588511..c64f738cc062 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -26,6 +26,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/i915_component.h>
+#include <drm/drm_drv.h>
 
 #include "i915_drv.h"
 #include "intel_atomic.h"
@@ -1214,7 +1215,8 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 {
 	struct i915_audio_component *acomp = data;
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
-	int i;
+	struct drm_modeset_acquire_ctx ctx;
+	int i, ret;
 
 	if (drm_WARN_ON(&dev_priv->drm, acomp->base.ops || acomp->base.dev))
 		return -EEXIST;
@@ -1224,16 +1226,16 @@ static int i915_audio_component_bind(struct device *i915_kdev,
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
 
-	return 0;
+	return ret;
 }
 
 static void i915_audio_component_unbind(struct device *i915_kdev,
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
index 2bf01416d656..297359411c5f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12512,6 +12512,7 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 int intel_modeset_init_nogem(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	enum pipe pipe;
 	struct intel_crtc *crtc;
 	int ret;
@@ -12563,9 +12564,9 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
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
index 8fdacb252bb1..e0a6837996e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_drv.h>
 
 #include "i915_debugfs.h"
 #include "intel_display_debugfs.h"
@@ -1057,11 +1058,13 @@ static int i915_display_info(struct seq_file *m, void *unused)
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
@@ -1076,20 +1079,21 @@ static int i915_display_info(struct seq_file *m, void *unused)
 		intel_connector_info(m, connector);
 	drm_connector_list_iter_end(&conn_iter);
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
 
-	return 0;
+	return ret;
 }
 
 static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
 	struct drm_device *dev = &dev_priv->drm;
-	int i;
+	struct drm_modeset_acquire_ctx ctx;
+	int i, ret;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	seq_printf(m, "PLL refclks: non-SSC: %d kHz, SSC: %d kHz\n",
 		   dev_priv->dpll.ref_clks.nssc,
@@ -1132,9 +1136,9 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 		seq_printf(m, " mg_pll_tdc_coldst_bias: 0x%08x\n",
 			   pll->state.hw_state.mg_pll_tdc_coldst_bias);
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static int i915_ipc_status_show(struct seq_file *m, void *data)
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
 
@@ -1223,9 +1229,9 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
 			   entry->end, skl_ddb_entry_size(entry));
 	}
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static void drrs_status_per_crtc(struct seq_file *m,
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
@@ -1753,12 +1764,15 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
 	if (ret != num_levels)
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	for (level = 0; level < num_levels; level++)
 		wm[level] = new[level];
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+
+	if (ret)
+		return ret;
 
 	return len;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 7e3f5c6ca484..c0ee135e5499 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -27,6 +27,7 @@
  */
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_drv.h>
 
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_gpu_commands.h"
@@ -1263,6 +1264,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_intel_overlay_attrs *attrs = data;
 	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_modeset_acquire_ctx ctx;
 	struct intel_overlay *overlay;
 	int ret;
 
@@ -1272,7 +1274,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	ret = -EINVAL;
 	if (!(attrs->flags & I915_OVERLAY_UPDATE_ATTRS)) {
@@ -1329,7 +1331,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 
 	ret = 0;
 out_unlock:
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 8ac263f471be..d0bc74904b93 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -29,6 +29,8 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 
+#include <drm/drm_drv.h>
+
 #include "intel_atomic.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
@@ -76,6 +78,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 				     enum intel_pipe_crc_source *source)
 {
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	struct intel_encoder *encoder;
 	struct intel_crtc *crtc;
 	struct intel_digital_port *dig_port;
@@ -83,7 +86,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 
 	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	for_each_intel_encoder(dev, encoder) {
 		if (!encoder->base.crtc)
 			continue;
@@ -120,7 +123,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 			break;
 		}
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 59fb4c710c8c..e7b763ca6d10 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -44,6 +44,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_drv.h>
 
 #include "display/intel_acpi.h"
 #include "display/intel_bw.h"
@@ -1009,31 +1010,35 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
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

