Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8AE41FCCD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BBB6E84F;
	Sat,  2 Oct 2021 15:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E856E831
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:51 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 138so12178530qko.10
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Im77FkEBdvBs+lJqn2GDs31kJz+82SvHV8rNdwgMtt8=;
 b=VBUCmvF7/pvHHzJrOadItcfHABEFjgilEeGvGyokroouh9AAuLpgTH0BSfMF373sTC
 Wu2fZ3+vEwANsoJjnhBbkxuURWhivPkrA4/dk1XBV1A624pYSbLSph3Eb7t7nQCu0Jme
 mqiJBliQDoQ6kCoU+pzdqkABbukUVdOyKPqnoE+woaAcFsvn2OrrNj+NKyWXb8S4BGTQ
 46jYomUmjHzDO3PSoGJJhiw8FrJ3vMdXizhBFDaLkW/TEHPJL12QBjcNmga+4oFDFa9h
 IrR8ApERJm3bdAh97Jw4Wxr/CHTf7zFIQ9S8+uR2VlwVMNs3nvthggMM+4aDu8QIinGL
 xFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Im77FkEBdvBs+lJqn2GDs31kJz+82SvHV8rNdwgMtt8=;
 b=o2ap9XiNkfuX7fL7hvc+RlBJd1yXBaN3e35vym5OYFlBcY+ly+BYyC64kHaVQgygF7
 Y2oXECSY9y463cIpZTXO8cizFCRTqFnM26XxMxVY1IfE19JXLv9m4+sQYAratm+c8o/b
 QxH7DjgW1XMz4r3WeEarx6Y8wC4vrKRaiqVvNT/2S+QtLtSZYG1MM/r10RFUoqK0wIO3
 zBtrzPSlMWqmDLb56PtxlXzZqS7FWdseVOZLnH+URyUoGZkGSp0h3B+pCTNKShgGZpOP
 CK6pKOTTqPDL0642dQBjGKmJ0Q+7o7fq3o5W2E37qt8UgUEvRzjAZlTFIOWExI2Q16+J
 KRBg==
X-Gm-Message-State: AOAM532yIXLp9IP+6JYa4DY1cT1oUMDxtbsTK1GJPXPlbgk/FwLAQYBb
 X5ffzVyeY1Dz80R1irn8FnEBllvW1WXkBg==
X-Google-Smtp-Source: ABdhPJwOHEssmb/d29BxZY/0a8Fquf/K4TLnpsvKrNSgdAZJiFjNUXog4xKBkM9chLUo8WjH3RPG9g==
X-Received: by 2002:ae9:e811:: with SMTP id a17mr3070180qkg.172.1633189549925; 
 Sat, 02 Oct 2021 08:45:49 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id b17sm5284989qte.97.2021.10.02.08.45.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:49 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 05/16] Revert "drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:31 -0400
Message-Id: <20211002154542.15800-5-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211002154542.15800-1-sean@poorly.run>
References: <20211002154542.15800-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 746826bcf8fdf682668ff1c415d6b91dbf5858be.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_audio.c    | 16 +++----
 drivers/gpu/drm/i915/display/intel_display.c  |  5 +-
 .../drm/i915/display/intel_display_debugfs.c  | 46 +++++++------------
 drivers/gpu/drm/i915/display/intel_overlay.c  |  6 +--
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  7 +--
 drivers/gpu/drm/i915/i915_drv.c               | 13 ++----
 6 files changed, 32 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index c64f738cc062..532237588511 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -26,7 +26,6 @@
 
 #include <drm/drm_edid.h>
 #include <drm/i915_component.h>
-#include <drm/drm_drv.h>
 
 #include "i915_drv.h"
 #include "intel_atomic.h"
@@ -1215,8 +1214,7 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 {
 	struct i915_audio_component *acomp = data;
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
-	struct drm_modeset_acquire_ctx ctx;
-	int i, ret;
+	int i;
 
 	if (drm_WARN_ON(&dev_priv->drm, acomp->base.ops || acomp->base.dev))
 		return -EEXIST;
@@ -1226,16 +1224,16 @@ static int i915_audio_component_bind(struct device *i915_kdev,
 					 DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
-	DRM_MODESET_LOCK_ALL_BEGIN((&dev_priv->drm), ctx, 0, ret);
+	drm_modeset_lock_all(&dev_priv->drm);
 	acomp->base.ops = &i915_audio_component_ops;
 	acomp->base.dev = i915_kdev;
 	BUILD_BUG_ON(MAX_PORTS != I915_MAX_PORTS);
 	for (i = 0; i < ARRAY_SIZE(acomp->aud_sample_rate); i++)
 		acomp->aud_sample_rate[i] = 0;
 	dev_priv->audio_component = acomp;
-	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
+	drm_modeset_unlock_all(&dev_priv->drm);
 
-	return ret;
+	return 0;
 }
 
 static void i915_audio_component_unbind(struct device *i915_kdev,
@@ -1243,14 +1241,12 @@ static void i915_audio_component_unbind(struct device *i915_kdev,
 {
 	struct i915_audio_component *acomp = data;
 	struct drm_i915_private *dev_priv = kdev_to_i915(i915_kdev);
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN((&dev_priv->drm), ctx, 0, ret);
+	drm_modeset_lock_all(&dev_priv->drm);
 	acomp->base.ops = NULL;
 	acomp->base.dev = NULL;
 	dev_priv->audio_component = NULL;
-	DRM_MODESET_LOCK_ALL_END((&dev_priv->drm), ctx, ret);
+	drm_modeset_unlock_all(&dev_priv->drm);
 
 	device_link_remove(hda_kdev, i915_kdev);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 297359411c5f..2bf01416d656 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12512,7 +12512,6 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 int intel_modeset_init_nogem(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
-	struct drm_modeset_acquire_ctx ctx;
 	enum pipe pipe;
 	struct intel_crtc *crtc;
 	int ret;
@@ -12564,9 +12563,9 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 	intel_vga_disable(i915);
 	intel_setup_outputs(i915);
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
 	for_each_intel_crtc(dev, crtc) {
 		struct intel_initial_plane_config plane_config = {};
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index e0a6837996e7..8fdacb252bb1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -5,7 +5,6 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_drv.h>
 
 #include "i915_debugfs.h"
 #include "intel_display_debugfs.h"
@@ -1058,13 +1057,11 @@ static int i915_display_info(struct seq_file *m, void *unused)
 	struct intel_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	struct drm_modeset_acquire_ctx ctx;
 	intel_wakeref_t wakeref;
-	int ret;
 
 	wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	seq_printf(m, "CRTC info\n");
 	seq_printf(m, "---------\n");
@@ -1079,21 +1076,20 @@ static int i915_display_info(struct seq_file *m, void *unused)
 		intel_connector_info(m, connector);
 	drm_connector_list_iter_end(&conn_iter);
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
 	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
 
-	return ret;
+	return 0;
 }
 
 static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
 	struct drm_device *dev = &dev_priv->drm;
-	struct drm_modeset_acquire_ctx ctx;
-	int i, ret;
+	int i;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	seq_printf(m, "PLL refclks: non-SSC: %d kHz, SSC: %d kHz\n",
 		   dev_priv->dpll.ref_clks.nssc,
@@ -1136,9 +1132,9 @@ static int i915_shared_dplls_info(struct seq_file *m, void *unused)
 		seq_printf(m, " mg_pll_tdc_coldst_bias: 0x%08x\n",
 			   pll->state.hw_state.mg_pll_tdc_coldst_bias);
 	}
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
-	return ret;
+	return 0;
 }
 
 static int i915_ipc_status_show(struct seq_file *m, void *data)
@@ -1197,15 +1193,13 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
 	struct drm_device *dev = &dev_priv->drm;
-	struct drm_modeset_acquire_ctx ctx;
 	struct skl_ddb_entry *entry;
 	struct intel_crtc *crtc;
-	int ret;
 
 	if (DISPLAY_VER(dev_priv) < 9)
 		return -ENODEV;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	seq_printf(m, "%-15s%8s%8s%8s\n", "", "Start", "End", "Size");
 
@@ -1229,9 +1223,9 @@ static int i915_ddb_info(struct seq_file *m, void *unused)
 			   entry->end, skl_ddb_entry_size(entry));
 	}
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
-	return ret;
+	return 0;
 }
 
 static void drrs_status_per_crtc(struct seq_file *m,
@@ -1309,12 +1303,10 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
 {
 	struct drm_i915_private *dev_priv = node_to_i915(m->private);
 	struct drm_device *dev = &dev_priv->drm;
-	struct drm_modeset_acquire_ctx ctx;
 	struct intel_crtc *crtc;
 	int active_crtc_cnt = 0;
-	int ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	for_each_intel_crtc(dev, crtc) {
 		if (crtc->base.state->active) {
 			active_crtc_cnt++;
@@ -1323,7 +1315,7 @@ static int i915_drrs_status(struct seq_file *m, void *unused)
 			drrs_status_per_crtc(m, dev, crtc);
 		}
 	}
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
 	if (!active_crtc_cnt)
 		seq_puts(m, "No active crtc found\n");
@@ -1615,10 +1607,8 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 {
 	struct drm_i915_private *dev_priv = m->private;
 	struct drm_device *dev = &dev_priv->drm;
-	struct drm_modeset_acquire_ctx ctx;
 	int level;
 	int num_levels;
-	int ret;
 
 	if (IS_CHERRYVIEW(dev_priv))
 		num_levels = 3;
@@ -1629,7 +1619,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 	else
 		num_levels = ilk_wm_max_level(dev_priv) + 1;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	for (level = 0; level < num_levels; level++) {
 		unsigned int latency = wm[level];
@@ -1650,7 +1640,7 @@ static void wm_latency_show(struct seq_file *m, const u16 wm[8])
 			   level, wm[level], latency / 10, latency % 10);
 	}
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 }
 
 static int pri_wm_latency_show(struct seq_file *m, void *data)
@@ -1734,7 +1724,6 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
 	struct seq_file *m = file->private_data;
 	struct drm_i915_private *dev_priv = m->private;
 	struct drm_device *dev = &dev_priv->drm;
-	struct drm_modeset_acquire_ctx ctx;
 	u16 new[8] = { 0 };
 	int num_levels;
 	int level;
@@ -1764,15 +1753,12 @@ static ssize_t wm_latency_write(struct file *file, const char __user *ubuf,
 	if (ret != num_levels)
 		return -EINVAL;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	for (level = 0; level < num_levels; level++)
 		wm[level] = new[level];
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
-
-	if (ret)
-		return ret;
+	drm_modeset_unlock_all(dev);
 
 	return len;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index c0ee135e5499..7e3f5c6ca484 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -27,7 +27,6 @@
  */
 
 #include <drm/drm_fourcc.h>
-#include <drm/drm_drv.h>
 
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_gpu_commands.h"
@@ -1264,7 +1263,6 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_intel_overlay_attrs *attrs = data;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct drm_modeset_acquire_ctx ctx;
 	struct intel_overlay *overlay;
 	int ret;
 
@@ -1274,7 +1272,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 
 	ret = -EINVAL;
 	if (!(attrs->flags & I915_OVERLAY_UPDATE_ATTRS)) {
@@ -1331,7 +1329,7 @@ int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
 
 	ret = 0;
 out_unlock:
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index d0bc74904b93..8ac263f471be 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -29,8 +29,6 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 
-#include <drm/drm_drv.h>
-
 #include "intel_atomic.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
@@ -78,7 +76,6 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 				     enum intel_pipe_crc_source *source)
 {
 	struct drm_device *dev = &dev_priv->drm;
-	struct drm_modeset_acquire_ctx ctx;
 	struct intel_encoder *encoder;
 	struct intel_crtc *crtc;
 	struct intel_digital_port *dig_port;
@@ -86,7 +83,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 
 	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	for_each_intel_encoder(dev, encoder) {
 		if (!encoder->base.crtc)
 			continue;
@@ -123,7 +120,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 			break;
 		}
 	}
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index e7b763ca6d10..59fb4c710c8c 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -44,7 +44,6 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_drv.h>
 
 #include "display/intel_acpi.h"
 #include "display/intel_bw.h"
@@ -1010,35 +1009,31 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
 static void intel_suspend_encoders(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
-	struct drm_modeset_acquire_ctx ctx;
 	struct intel_encoder *encoder;
-	int ret;
 
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	for_each_intel_encoder(dev, encoder)
 		if (encoder->suspend)
 			encoder->suspend(encoder);
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 }
 
 static void intel_shutdown_encoders(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
-	struct drm_modeset_acquire_ctx ctx;
 	struct intel_encoder *encoder;
-	int ret;
 
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_lock_all(dev);
 	for_each_intel_encoder(dev, encoder)
 		if (encoder->shutdown)
 			encoder->shutdown(encoder);
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	drm_modeset_unlock_all(dev);
 }
 
 void i915_driver_shutdown(struct drm_i915_private *i915)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

