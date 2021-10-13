Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFA142CBD4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2436EB41;
	Wed, 13 Oct 2021 20:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859D06EB42;
 Wed, 13 Oct 2021 20:49:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id F13DA581178;
 Wed, 13 Oct 2021 16:49:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 13 Oct 2021 16:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=mEAXDzFynFf5/
 x4AAlaGL8xc699bjevsRkZNVcEo/1A=; b=uiOCf9ha6kI9dJ0z8690Tpm4hxLWP
 186WZVcsIKXa39/Jh3kFiACRcbGyCw0SMJGj3paUUNR6/MUaFXgHHmTvMhesVbmX
 JcgVweBbFTskKgesrXeOs9C90+JOYWRsAEr+h/xMAOMASjurAF6C9aS45V7Pd4gk
 BAF8I4AHvVTqsFh2ThqjyzscoWtlxgsPBXlU38kurKYloqZaeM+35Oxux+oLqya6
 2ociG9l3v+jqoE+7YPmSgzlh7eVX57up33z7pjtKLOnZSQbBO3yEYE1GK4vhNL0p
 ktI+TQ1d1HK/e9X0YG94yORRvT8lpNEA6vQSKOgvkzJz0sn4uRziZ7l5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=mEAXDzFynFf5/x4AAlaGL8xc699bjevsRkZNVcEo/1A=; b=MO9NJHWn
 /dqfrYXCo9sfnLE+drAHy6RTkVC8lH+im1QnvL0I6qry+ijcoUTcUDF8lSv32qCc
 OHTf2K5pJ1zIoyZjqLHUB+yOesmXGl3/QX7RKlwy6WnD+WdkLElf0w3j4ps6amuO
 N/if6jsz8PEORX/LDiRjzAJut6Cg63dCg4BNoTG4aQV33Tyj0R1+z38F9GCKPAdT
 xTr0CM/CQ4aYClre8OGT7vnfuV/A8EmBBCLci3tuW9r0yoRYNw1MoJX15YFtHw24
 zILSeG2VRpGE3xhjVMk1PT2Wwg/eX2wETIApLd3P7dgct70XTblHt2qoUNeNL1nT
 VzZL43wXhGDdSw==
X-ME-Sender: <xms:V0ZnYZJmO_WvqbJemTcqqTMrbhfK0teraaUx5hs1Bms4ocGR8OT6kA>
 <xme:V0ZnYVL0_zqw4nsdnpoV-ZqtvdkJWbR9qipq-bKuW0ZXNDTgOhnb27J4kaNWxKlCe
 tFsMMUv2YSeT0WncQ>
X-ME-Received: <xmr:V0ZnYRsLdWOPg2BLG3x1_6PFaucX9UzzF9z2PURM6CA_YS-Fj1EiiOS4bJqzhSi7hHxc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:V0ZnYaZol2wKwsxDO5sk2Avv8Ub1rJkyaEuLFx6hAarw9WtAXLaQxA>
 <xmx:V0ZnYQZ3yO3sJUZvRwiTjS-E1p_8nX56p_Aa7MVzjEy9aaxo9hKMWw>
 <xmx:V0ZnYeCtuMdj9DrgxnLvOjhXK5LL6SO4xBLXlIp3oVmK5WUkIl0UUw>
 <xmx:V0ZnYen-j4kGNDcAB--NhP2eQFMf-umRu6iGKZ0WkYsE8qMBnXhrWw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:25 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 12/20] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:38 +0200
Message-Id: <20211013204846.90026-13-greenfoo@u92.eu>
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
index bc5113589f0a..3205ceb0ab70 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_drv.h>
 
 #include "i915_debugfs.h"
 #include "intel_de.h"
@@ -1059,11 +1060,13 @@ static int i915_display_info(struct seq_file *m, void *unused)
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
@@ -1078,20 +1081,21 @@ static int i915_display_info(struct seq_file *m, void *unused)
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
@@ -1134,9 +1138,9 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 		seq_printf(m, " mg_pll_tdc_coldst_bias: 0x%08x\n",
 			   pll->state.hw_state.mg_pll_tdc_coldst_bias);
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static int i915_ipc_status_show(struct seq_file *m, void *data)
@@ -1195,13 +1199,15 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
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
 
@@ -1225,9 +1231,9 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
 			   entry->end, skl_ddb_entry_size(entry));
 	}
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 static void drrs_status_per_crtc(struct seq_file *m,
@@ -1305,10 +1311,12 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
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
@@ -1317,7 +1325,7 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
 			drrs_status_per_crtc(m, dev, crtc);
 		}
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (!active_crtc_cnt)
 		seq_puts(m, "No active crtc found\n");
@@ -1594,8 +1602,10 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 {
 	struct drm_i915_private *dev_priv = m->private;
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	int level;
 	int num_levels;
+	int ret;
 
 	if (IS_CHERRYVIEW(dev_priv))
 		num_levels = 3;
@@ -1606,7 +1616,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 	else
 		num_levels = ilk_wm_max_level(dev_priv) + 1;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	for (level = 0; level < num_levels; level++) {
 		unsigned int latency = wm[level];
@@ -1627,7 +1637,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 			   level, wm[level], latency / 10, latency % 10);
 	}
 
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
 static int pri_wm_latency_show(struct seq_file *m, void *data)
@@ -1711,6 +1721,7 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
 	struct seq_file *m = file->private_data;
 	struct drm_i915_private *dev_priv = m->private;
 	struct drm_device *dev = &dev_priv->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	u16 new[8] = { 0 };
 	int num_levels;
 	int level;
@@ -1740,12 +1751,15 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
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

