Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C10425C19
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7106F40D;
	Thu,  7 Oct 2021 19:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756756F4D8;
 Thu,  7 Oct 2021 19:38:54 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 777C02B00A30;
 Thu,  7 Oct 2021 15:38:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Oct 2021 15:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=0vXLAERJOT6eV
 0x2T3ACRSK5sfS0df+vTX7/S7lYM4s=; b=HEu90+ciHY+hrpSv8QYI3ImDu+21u
 hZbeXEFJv8xZ0fN1SqNsncxvZ2Fs3mWoxfJVW8d0oH91gxWY5gLpzSB9tt+orWBj
 aMWJt4321HM86k4dOBUv1ISvtdyVvW8jwqqnuKtSg5qLLqPlAAl0dSCF4ak9w1K0
 JiA8q2K7Lt+HIVUB1GNM1cAsr6Nk7tJ/73Y4R+ik6UMvETkMv838dzJfzbgreFm6
 qABZNl3fBzLzOtrS5V1sJd2XzxlQ/2jRQY8b7VN4dDO3GdgCf8PzEZ8HAXqie14K
 fJkbodQQyGTYjjaoz2rivssmuDIA2zrR0fNYFdcc2XA9w9Zx042f/vlxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0vXLAERJOT6eV0x2T3ACRSK5sfS0df+vTX7/S7lYM4s=; b=OMQc+zt8
 rZWT2116908DwRKBzB4/uK3hX3oqKp1Yrhm/RehMgz7hin3fSVMaoGP8DW/JSdWf
 3tPmOWPottPq5AuvgDBFbwjcqk2TOqm7TRs/0TCDxPXb/76CyNUfIGM8MN6DzTUC
 FCutS3e2JWYpGkmg7LYoL/90u23mv6QSzM8dQWorKtC8D3UNAsS/wduNKHfR/Alh
 1ZWeZyibAubd80tc6C5CXU2ibQS8SlANe7XapUtBkJGJgsus/KH7rXb8dAmOpv52
 A79dJOTiKOrv4ANF3RPBRGbJyFYsiz5sxnThCdeaUhYNjiflo2xteibdJsV/JF+N
 XBhkQR9CFTzc3Q==
X-ME-Sender: <xms:zUxfYYNpCILZZ0o81l3xrMJLKIAGlpfuEhQlFUXZV_IHgyCTbNoIaQ>
 <xme:zUxfYe-6GhNOZwH_FhlY4HWCTRKDObM9R-FttwkUQq-I233EAnUZPgJLi6C4swS_Z
 esWkftAv7cG2WRaVQ>
X-ME-Received: <xmr:zUxfYfSpCLRXn-0zEM-_tJjthnNJgq-i7l3k_MVCKqD3ZmY3_9vAfGbeANma-DDUEHBH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:zUxfYQsBNfpkZUy9LVab9yVLKXIioL8_sfm3S2ehxPT-AB5SDeDO5Q>
 <xmx:zUxfYQcY6eMrsR0lGM1cQ61V49fQE9RROrdQnQwclhVnFGetlgHfLw>
 <xmx:zUxfYU0hMC_yUhEH-tkAGNW3Cm7F0xn_QJ1AahuojTEz656BT8SZQA>
 <xmx:zUxfYY56iKcdp27hWDqTtPKs7dyVJayljzbfOC5QhL7HdBrXyXrThHa6yz4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:50 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 12/20] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:47 +0200
Message-Id: <20211007193755.29579-13-greenfoo@u92.eu>
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
---
 drivers/gpu/drm/i915/display/intel_audio.c    | 16 ++++---
 .../drm/i915/display/intel_display_debugfs.c  | 46 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_overlay.c  |  6 ++-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  7 ++-
 drivers/gpu/drm/i915/i915_drv.c               | 13 ++++--
 5 files changed, 58 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 03e8c05a74f6..37699f13b21f 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -26,6 +26,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/i915_component.h>
+#include <drm/drm_drv.h>
 
 #include "i915_drv.h"
 #include "intel_atomic.h"
@@ -1225,7 +1226,8 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 {
 	struct i915_audio_component *acomp = data;
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
-	int i;
+	struct drm_modeset_acquire_ctx ctx;
+	int i, ret;
 
 	if (drm_WARN_ON(&dev_priv->drm, acomp->base.ops || acomp->base.dev))
 		return -EEXIST;
@@ -1235,16 +1237,16 @@ static int i915_audio_component_bind(struct device *i915_kdev,
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
@@ -1252,12 +1254,14 @@ static void i915_audio_component_unbind(struct device *i915_kdev,
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
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 309d74fd86ce..8a4cc82f9f23 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_drv.h>
 
 #include "i915_debugfs.h"
 #include "intel_display_debugfs.h"
@@ -1058,11 +1059,13 @@ static int i915_display_info(struct seq_file *m, void *unused)
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
@@ -1077,20 +1080,21 @@ static int i915_display_info(struct seq_file *m, void *unused)
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
@@ -1133,9 +1137,9 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 		seq_printf(m, " mg_pll_tdc_coldst_bias: 0x%08x\n",
 			   pll->state.hw_state.mg_pll_tdc_coldst_bias);
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static int i915_ipc_status_show(struct seq_file *m, void *data)
@@ -1194,13 +1198,15 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
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
 
@@ -1224,9 +1230,9 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
 			   entry->end, skl_ddb_entry_size(entry));
 	}
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static void drrs_status_per_crtc(struct seq_file *m,
@@ -1304,10 +1310,12 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
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
@@ -1316,7 +1324,7 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
 			drrs_status_per_crtc(m, dev, crtc);
 		}
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (!active_crtc_cnt)
 		seq_puts(m, "No active crtc found\n");
@@ -1593,8 +1601,10 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 {
 	struct drm_i915_private *dev_priv = m->private;
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	int level;
 	int num_levels;
+	int ret;
 
 	if (IS_CHERRYVIEW(dev_priv))
 		num_levels = 3;
@@ -1605,7 +1615,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 	else
 		num_levels = ilk_wm_max_level(dev_priv) + 1;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	for (level = 0; level < num_levels; level++) {
 		unsigned int latency = wm[level];
@@ -1626,7 +1636,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 			   level, wm[level], latency / 10, latency % 10);
 	}
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
 static int pri_wm_latency_show(struct seq_file *m, void *data)
@@ -1710,6 +1720,7 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
 	struct seq_file *m = file->private_data;
 	struct drm_i915_private *dev_priv = m->private;
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	u16 new[8] = { 0 };
 	int num_levels;
 	int level;
@@ -1739,12 +1750,15 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
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
index c65c3742887a..298a5b12e882 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -44,6 +44,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_drv.h>
 
 #include "display/intel_acpi.h"
 #include "display/intel_bw.h"
@@ -1010,31 +1011,35 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
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

