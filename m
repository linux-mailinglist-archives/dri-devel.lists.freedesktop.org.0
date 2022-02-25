Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6C34C5236
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 00:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430C310E21F;
	Fri, 25 Feb 2022 23:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9317F10E21F;
 Fri, 25 Feb 2022 23:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645832733; x=1677368733;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RkRaaOehFdNq6rkmKg2rJ7qF+0bSMm7iLfcWIiS/AT0=;
 b=argpC3QwkgRIxadKPVm5odFLOduMrxFd32EKSCLLP3swd2B6261PoSbp
 P9BpCD2j17I+iceBlZhQonSMzQ6+k/6DND1qz5BUEUDlNzcGugqwzW936
 xwuMoPcjPlzvWw5dnZK0vw94eE9fkRXs03ESUjNUj+bcilTLXGrE3qFre
 5qFooKblZbEl52lbTGZ3TRPXdvavftMclOhZnijlhJ0Jm+2IAQytNIfJy
 KZjr86tLwIc/y94kh1pe8gWF/uHqLNBl34VLRsuV5iCf73Wye+bH1ltLR
 ytp1Md7qhdEIy6jkWqxntdIviyB1Ib79rldw/eU8nRIzzjZGtmpDogCXT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313322602"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313322602"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 15:45:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="544202768"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 15:45:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 3/4] drm/i915: Use str_enabled_disabled()
Date: Fri, 25 Feb 2022 15:46:30 -0800
Message-Id: <20220225234631.3725943-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225234631.3725943-1-lucas.demarchi@intel.com>
References: <20220225234631.3725943-1-lucas.demarchi@intel.com>
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

Remove the local enableddisabled() implementation and adopt the
str_enabled_disabled() from linux/string_helpers.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_backlight.c   |  3 ++-
 drivers/gpu/drm/i915/display/intel_display.c     | 16 ++++++++--------
 .../gpu/drm/i915/display/intel_display_debugfs.c |  8 ++++----
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c     |  7 ++++---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c      |  3 ++-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c        |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c        |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c       |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c        |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c            |  4 ++--
 drivers/gpu/drm/i915/i915_debugfs.c              |  2 +-
 drivers/gpu/drm/i915/i915_driver.c               |  4 +++-
 drivers/gpu/drm/i915/i915_utils.h                |  6 +-----
 drivers/gpu/drm/i915/intel_pm.c                  |  4 ++--
 14 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 98f7ea44042f..c8e1fc53a881 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pwm.h>
+#include <linux/string_helpers.h>
 
 #include "intel_backlight.h"
 #include "intel_connector.h"
@@ -1633,7 +1634,7 @@ int intel_backlight_setup(struct intel_connector *connector, enum pipe pipe)
 	drm_dbg_kms(&dev_priv->drm,
 		    "Connector %s backlight initialized, %s, brightness %u/%u\n",
 		    connector->base.name,
-		    enableddisabled(panel->backlight.enabled),
+		    str_enabled_disabled(panel->backlight.enabled),
 		    panel->backlight.level, panel->backlight.max);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 938354dc6f16..2283c7bad2cd 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2981,8 +2981,8 @@ static void intel_panel_sanitize_ssc(struct drm_i915_private *dev_priv)
 		if (dev_priv->vbt.lvds_use_ssc != bios_lvds_use_ssc) {
 			drm_dbg_kms(&dev_priv->drm,
 				    "SSC %s by BIOS, overriding VBT which says %s\n",
-				    enableddisabled(bios_lvds_use_ssc),
-				    enableddisabled(dev_priv->vbt.lvds_use_ssc));
+				    str_enabled_disabled(bios_lvds_use_ssc),
+				    str_enabled_disabled(dev_priv->vbt.lvds_use_ssc));
 			dev_priv->vbt.lvds_use_ssc = bios_lvds_use_ssc;
 		}
 	}
@@ -5324,7 +5324,7 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 		    pipe_config->bigjoiner_pipes);
 
 	drm_dbg_kms(&dev_priv->drm, "splitter: %s, link count %d, overlap %d\n",
-		    enableddisabled(pipe_config->splitter.enable),
+		    str_enabled_disabled(pipe_config->splitter.enable),
 		    pipe_config->splitter.link_count,
 		    pipe_config->splitter.pixel_overlap);
 
@@ -5412,7 +5412,7 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 		drm_dbg_kms(&dev_priv->drm,
 			    "pch pfit: " DRM_RECT_FMT ", %s, force thru: %s\n",
 			    DRM_RECT_ARG(&pipe_config->pch_pfit.dst),
-			    enableddisabled(pipe_config->pch_pfit.enabled),
+			    str_enabled_disabled(pipe_config->pch_pfit.enabled),
 			    str_yes_no(pipe_config->pch_pfit.force_thru));
 
 	drm_dbg_kms(&dev_priv->drm, "ips: %i, double wide: %i\n",
@@ -10068,7 +10068,7 @@ static void readout_plane_state(struct drm_i915_private *dev_priv)
 		drm_dbg_kms(&dev_priv->drm,
 			    "[PLANE:%d:%s] hw state readout: %s, pipe %c\n",
 			    plane->base.base.id, plane->base.name,
-			    enableddisabled(visible), pipe_name(pipe));
+			    str_enabled_disabled(visible), pipe_name(pipe));
 	}
 
 	for_each_intel_crtc(&dev_priv->drm, crtc) {
@@ -10114,7 +10114,7 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 		drm_dbg_kms(&dev_priv->drm,
 			    "[CRTC:%d:%s] hw state readout: %s\n",
 			    crtc->base.base.id, crtc->base.name,
-			    enableddisabled(crtc_state->hw.active));
+			    str_enabled_disabled(crtc_state->hw.active));
 	}
 
 	cdclk_state->active_pipes = dbuf_state->active_pipes = active_pipes;
@@ -10158,7 +10158,7 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 		drm_dbg_kms(&dev_priv->drm,
 			    "[ENCODER:%d:%s] hw state readout: %s, pipe %c\n",
 			    encoder->base.base.id, encoder->base.name,
-			    enableddisabled(encoder->base.crtc),
+			    str_enabled_disabled(encoder->base.crtc),
 			    pipe_name(pipe));
 	}
 
@@ -10196,7 +10196,7 @@ static void intel_modeset_readout_hw_state(struct drm_device *dev)
 		drm_dbg_kms(&dev_priv->drm,
 			    "[CONNECTOR:%d:%s] hw state readout: %s\n",
 			    connector->base.base.id, connector->base.name,
-			    enableddisabled(connector->base.encoder));
+			    str_enabled_disabled(connector->base.encoder));
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index c4dd39ff60bc..c3194d18ae29 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -94,7 +94,7 @@ static int i915_sr_status(struct seq_file *m, void *unused)
 
 	intel_display_power_put(dev_priv, POWER_DOMAIN_INIT, wakeref);
 
-	seq_printf(m, "self-refresh: %s\n", enableddisabled(sr_enabled));
+	seq_printf(m, "self-refresh: %s\n", str_enabled_disabled(sr_enabled));
 
 	return 0;
 }
@@ -296,7 +296,7 @@ static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
 		enabled = val & EDP_PSR_ENABLE;
 	}
 	seq_printf(m, "Source PSR ctl: %s [0x%08x]\n",
-		   enableddisabled(enabled), val);
+		   str_enabled_disabled(enabled), val);
 	psr_source_status(intel_dp, m);
 	seq_printf(m, "Busy frontbuffer bits: 0x%08x\n",
 		   psr->busy_frontbuffer_bits);
@@ -343,7 +343,7 @@ static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
 		}
 
 		seq_printf(m, "PSR2 selective fetch: %s\n",
-			   enableddisabled(psr->psr2_sel_fetch_enabled));
+			   str_enabled_disabled(psr->psr2_sel_fetch_enabled));
 	}
 
 unlock:
@@ -1268,7 +1268,7 @@ static int i915_lpsp_status(struct seq_file *m, void *unused)
 		return 0;
 	}
 
-	seq_printf(m, "LPSP: %s\n", enableddisabled(lpsp_enabled));
+	seq_printf(m, "LPSP: %s\n", str_enabled_disabled(lpsp_enabled));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 6b4a27372c82..f370e9c4350d 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 
 #include <asm/unaligned.h>
 
@@ -686,9 +687,9 @@ void intel_dsi_log_params(struct intel_dsi *intel_dsi)
 		    intel_dsi->burst_mode_ratio);
 	drm_dbg_kms(&i915->drm, "Reset timer %d\n", intel_dsi->rst_timer_val);
 	drm_dbg_kms(&i915->drm, "Eot %s\n",
-		    enableddisabled(intel_dsi->eotp_pkt));
+		    str_enabled_disabled(intel_dsi->eotp_pkt));
 	drm_dbg_kms(&i915->drm, "Clockstop %s\n",
-		    enableddisabled(!intel_dsi->clock_stop));
+		    str_enabled_disabled(!intel_dsi->clock_stop));
 	drm_dbg_kms(&i915->drm, "Mode %s\n",
 		    intel_dsi->operation_mode ? "command" : "video");
 	if (intel_dsi->dual_link == DSI_DUAL_LINK_FRONT_BACK)
@@ -715,7 +716,7 @@ void intel_dsi_log_params(struct intel_dsi *intel_dsi)
 	drm_dbg_kms(&i915->drm, "HS to LP Clock Count 0x%x\n",
 		    intel_dsi->clk_hs_to_lp_count);
 	drm_dbg_kms(&i915->drm, "BTA %s\n",
-		    enableddisabled(!(intel_dsi->video_frmt_cfg_bits & DISABLE_VIDEO_BTA)));
+		    str_enabled_disabled(!(intel_dsi->video_frmt_cfg_bits & DISABLE_VIDEO_BTA)));
 }
 
 bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index 209cf265bf74..9dc9dccf7b09 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kthread.h>
+#include <linux/string_helpers.h>
 #include <trace/events/dma_fence.h>
 #include <uapi/linux/sched/types.h>
 
@@ -512,7 +513,7 @@ void intel_engine_print_breadcrumbs(struct intel_engine_cs *engine,
 	if (!b)
 		return;
 
-	drm_printf(p, "IRQ: %s\n", enableddisabled(b->irq_armed));
+	drm_printf(p, "IRQ: %s\n", str_enabled_disabled(b->irq_armed));
 	if (!list_empty(&b->signalers))
 		print_signals(b, p);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 13ff3a13d161..d08fd0659aef 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1643,7 +1643,7 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
 
 		drm_printf(m, "\tExeclist tasklet queued? %s (%s), preempt? %s, timeslice? %s\n",
 			   str_yes_no(test_bit(TASKLET_STATE_SCHED, &engine->sched_engine->tasklet.state)),
-			   enableddisabled(!atomic_read(&engine->sched_engine->tasklet.count)),
+			   str_enabled_disabled(!atomic_read(&engine->sched_engine->tasklet.count)),
 			   repr_timer(&engine->execlists.preempt),
 			   repr_timer(&engine->execlists.timer));
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index ba5c46f61d14..f01325cd1b62 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1203,7 +1203,7 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
 void intel_guc_ct_print_info(struct intel_guc_ct *ct,
 			     struct drm_printer *p)
 {
-	drm_printf(p, "CT %s\n", enableddisabled(ct->enabled));
+	drm_printf(p, "CT %s\n", str_enabled_disabled(ct->enabled));
 
 	if (!ct->enabled)
 		return;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 8a99c2e624c2..a24dc6441872 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -477,7 +477,7 @@ int intel_guc_log_create(struct intel_guc_log *log)
 
 	log->level = __get_default_log_level(log);
 	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
-			 log->level, enableddisabled(log->level),
+			 log->level, str_enabled_disabled(log->level),
 			 str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
 			 GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index f8fc90ea71e7..e00661fb0853 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -66,7 +66,7 @@ static int __guc_rc_control(struct intel_guc *guc, bool enable)
 	}
 
 	drm_info(&gt->i915->drm, "GuC RC: %s\n",
-		 enableddisabled(enable));
+		 str_enabled_disabled(enable));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 8e756d4c2c16..8c9ef690ac9d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -524,9 +524,9 @@ static int __uc_init_hw(struct intel_uc *uc)
 	}
 
 	drm_info(&i915->drm, "GuC submission %s\n",
-		 enableddisabled(intel_uc_uses_guc_submission(uc)));
+		 str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
 	drm_info(&i915->drm, "GuC SLPC %s\n",
-		 enableddisabled(intel_uc_uses_guc_slpc(uc)));
+		 str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 2323f489150f..747fe9f41e1f 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -491,7 +491,7 @@ static int i915_runtime_pm_status(struct seq_file *m, void *unused)
 		seq_puts(m, "Runtime power management not supported\n");
 
 	seq_printf(m, "Runtime power status: %s\n",
-		   enableddisabled(!dev_priv->power_domains.init_wakeref));
+		   str_enabled_disabled(!dev_priv->power_domains.init_wakeref));
 
 	seq_printf(m, "GPU idle: %s\n", str_yes_no(!to_gt(dev_priv)->awake));
 	seq_printf(m, "IRQs disabled: %s\n",
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 62b3f332bbf5..92a625a174e2 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -36,6 +36,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/pnp.h>
 #include <linux/slab.h>
+#include <linux/string_helpers.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/vt.h>
 
@@ -752,7 +753,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 void
 i915_print_iommu_status(struct drm_i915_private *i915, struct drm_printer *p)
 {
-	drm_printf(p, "iommu: %s\n", enableddisabled(intel_vtd_active(i915)));
+	drm_printf(p, "iommu: %s\n",
+		   str_enabled_disabled(intel_vtd_active(i915)));
 }
 
 static void i915_welcome_messages(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 06aac2be49ee..6d26920d0632 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -28,6 +28,7 @@
 #include <linux/list.h>
 #include <linux/overflow.h>
 #include <linux/sched.h>
+#include <linux/string_helpers.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include <linux/sched/clock.h>
@@ -404,11 +405,6 @@ static inline const char *onoff(bool v)
 	return v ? "on" : "off";
 }
 
-static inline const char *enableddisabled(bool v)
-{
-	return v ? "enabled" : "disabled";
-}
-
 void add_taint_for_CI(struct drm_i915_private *i915, unsigned int taint);
 static inline void __add_taint_for_CI(unsigned int taint)
 {
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 5299f8b6b986..742009589a24 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -419,8 +419,8 @@ static bool _intel_set_memory_cxsr(struct drm_i915_private *dev_priv, bool enabl
 	trace_intel_memory_cxsr(dev_priv, was_enabled, enable);
 
 	drm_dbg_kms(&dev_priv->drm, "memory self-refresh is %s (was %s)\n",
-		    enableddisabled(enable),
-		    enableddisabled(was_enabled));
+		    str_enabled_disabled(enable),
+		    str_enabled_disabled(was_enabled));
 
 	return was_enabled;
 }
-- 
2.35.1

