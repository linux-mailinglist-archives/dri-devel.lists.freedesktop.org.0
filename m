Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D18BFB374
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14C210E732;
	Wed, 22 Oct 2025 09:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuITId+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E09E10E733;
 Wed, 22 Oct 2025 09:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761126543; x=1792662543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LU9h/yLAP51HMEFTLrO3ldHxxIQWur0wfmENAGmJSSk=;
 b=HuITId+fohGHuvcmJo6HA8pGXMdMyT14bbPGHQtcxgPWsMzgiPslMDsA
 BI3UOs+rmY89WI2CQt4IfF9NoTRz4EpJ8yEPGRoaJTq5pBb2rIMrlNxSb
 r1CSPJ+9r9JB380Q7xyCMW/tg/aDc9zXH1EcMI8mM5dYmh7cOLrDAFe2j
 SE8gQByt5iiTMjQBxFeCAlEZqVW6dQ4z+WWy8cMF2IyaKA8pL56n1Iygb
 S/xa/ryZ3DdESqD4YFKeuBs5sDa+iNSCkiNsOKgKshwPACe4eoOTA8sO4
 T4+F70VBiS4bpE0DpHbjcqK8zMgBW8726XTv/E36iD9fq7MeqooDkWoFn Q==;
X-CSE-ConnectionGUID: 7ggHSTcdQnCtf+ALmzBBIw==
X-CSE-MsgGUID: cd94I7vfRnebzKeGRLjyHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63163984"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63163984"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:49:03 -0700
X-CSE-ConnectionGUID: khxoMlu6RcaowCN+v5xkDw==
X-CSE-MsgGUID: yRQKHXpUS4azlQRcoxF82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183416239"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.104])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:48:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/ttm: replace drm_print.h include with a forward
 declaration
Date: Wed, 22 Oct 2025 12:48:33 +0300
Message-ID: <ceff40759aa88a019e72eb7dd6efdaa3206a984e.1761126446.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761126446.git.jani.nikula@intel.com>
References: <cover.1761126446.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The ttm/ttm_resource.h header does not really need anything from
drm_print.h. A simple forward declaration for struct drm_printer is
sufficient.

Alas, a gazillion files depend on that indirect include, and need the
explicit drm_print.h include. Add them all over the place.

v2: Fix loongson, ttm tests, vboxvideo (kernel test robot, Intel Graphics CI)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_gem_ttm_helper.c                      | 1 +
 drivers/gpu/drm/drm_gem_vram_helper.c                     | 1 +
 drivers/gpu/drm/i915/display/i9xx_wm.c                    | 2 ++
 drivers/gpu/drm/i915/display/intel_bios.c                 | 1 +
 drivers/gpu/drm/i915/display/intel_bw.c                   | 2 ++
 drivers/gpu/drm/i915/display/intel_cdclk.c                | 1 +
 drivers/gpu/drm/i915/display/intel_connector.c            | 1 +
 drivers/gpu/drm/i915/display/intel_crtc.c                 | 1 +
 drivers/gpu/drm/i915/display/intel_display.c              | 1 +
 drivers/gpu/drm/i915/display/intel_display_driver.c       | 1 +
 drivers/gpu/drm/i915/display/intel_display_irq.c          | 1 +
 drivers/gpu/drm/i915/display/intel_display_power.c        | 2 ++
 drivers/gpu/drm/i915/display/intel_display_power_well.c   | 2 ++
 drivers/gpu/drm/i915/display/intel_display_reset.c        | 1 +
 drivers/gpu/drm/i915/display/intel_dpt.c                  | 2 ++
 drivers/gpu/drm/i915/display/intel_fb.c                   | 1 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c                | 1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c               | 2 ++
 drivers/gpu/drm/i915/display/intel_fbc.c                  | 1 +
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c             | 2 ++
 drivers/gpu/drm/i915/display/intel_gmbus.c                | 1 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c             | 1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c              | 1 +
 drivers/gpu/drm/i915/display/intel_overlay.c              | 1 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c             | 2 ++
 drivers/gpu/drm/i915/display/intel_plane_initial.c        | 2 ++
 drivers/gpu/drm/i915/display/intel_vblank.c               | 1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c        | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c               | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c            | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c                 | 4 +++-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c                  | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c              | 2 ++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c                   | 3 ++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c               | 2 ++
 drivers/gpu/drm/i915/gem/i915_gemfs.c                     | 2 ++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c  | 2 ++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c        | 2 ++
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c                  | 2 ++
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c               | 2 ++
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c          | 2 ++
 drivers/gpu/drm/i915/gt/intel_engine_user.c               | 2 ++
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c      | 2 ++
 drivers/gpu/drm/i915/gt/intel_ggtt.c                      | 1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c              | 2 ++
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c                 | 1 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c                | 2 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c             | 2 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c                       | 2 ++
 drivers/gpu/drm/i915/gt/intel_mocs.c                      | 2 ++
 drivers/gpu/drm/i915/gt/intel_rc6.c                       | 2 ++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c               | 2 ++
 drivers/gpu/drm/i915/gt/intel_renderstate.c               | 2 ++
 drivers/gpu/drm/i915/gt/intel_sa_media.c                  | 1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c                      | 2 ++
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c              | 2 ++
 drivers/gpu/drm/i915/gt/intel_timeline.c                  | 1 +
 drivers/gpu/drm/i915/gt/intel_wopcm.c                     | 2 ++
 drivers/gpu/drm/i915/gt/selftest_context.c                | 2 ++
 drivers/gpu/drm/i915/gt/selftest_execlists.c              | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 2 ++
 drivers/gpu/drm/i915/gvt/aperture_gm.c                    | 2 ++
 drivers/gpu/drm/i915/gvt/cfg_space.c                      | 2 ++
 drivers/gpu/drm/i915/gvt/cmd_parser.c                     | 2 ++
 drivers/gpu/drm/i915/gvt/display.c                        | 1 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                         | 1 +
 drivers/gpu/drm/i915/gvt/edid.c                           | 1 +
 drivers/gpu/drm/i915/gvt/gtt.c                            | 2 ++
 drivers/gpu/drm/i915/gvt/handlers.c                       | 1 +
 drivers/gpu/drm/i915/gvt/interrupt.c                      | 2 ++
 drivers/gpu/drm/i915/gvt/kvmgt.c                          | 1 +
 drivers/gpu/drm/i915/gvt/mmio.c                           | 3 +++
 drivers/gpu/drm/i915/gvt/mmio_context.c                   | 2 ++
 drivers/gpu/drm/i915/gvt/scheduler.c                      | 2 ++
 drivers/gpu/drm/i915/gvt/vgpu.c                           | 2 ++
 drivers/gpu/drm/i915/i915_cmd_parser.c                    | 1 +
 drivers/gpu/drm/i915/i915_debugfs.c                       | 1 +
 drivers/gpu/drm/i915/i915_gem.c                           | 1 +
 drivers/gpu/drm/i915/i915_getparam.c                      | 2 ++
 drivers/gpu/drm/i915/i915_irq.c                           | 1 +
 drivers/gpu/drm/i915/i915_module.c                        | 1 +
 drivers/gpu/drm/i915/i915_pmu.c                           | 2 ++
 drivers/gpu/drm/i915/i915_query.c                         | 2 ++
 drivers/gpu/drm/i915/i915_request.c                       | 2 ++
 drivers/gpu/drm/i915/i915_switcheroo.c                    | 2 ++
 drivers/gpu/drm/i915/i915_sysfs.c                         | 2 ++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c             | 4 ++--
 drivers/gpu/drm/i915/i915_utils.c                         | 1 +
 drivers/gpu/drm/i915/i915_vgpu.c                          | 2 ++
 drivers/gpu/drm/i915/i915_vma.c                           | 2 ++
 drivers/gpu/drm/i915/intel_clock_gating.c                 | 2 ++
 drivers/gpu/drm/i915/intel_gvt.c                          | 2 ++
 drivers/gpu/drm/i915/intel_memory_region.c                | 1 +
 drivers/gpu/drm/i915/intel_pcode.c                        | 2 ++
 drivers/gpu/drm/i915/intel_step.c                         | 2 ++
 drivers/gpu/drm/i915/intel_uncore.c                       | 1 +
 drivers/gpu/drm/i915/intel_wakeref.c                      | 2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c                      | 2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c                | 2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c                  | 2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c              | 2 ++
 drivers/gpu/drm/i915/selftests/i915_active.c              | 2 ++
 drivers/gpu/drm/i915/selftests/i915_request.c             | 2 ++
 drivers/gpu/drm/i915/soc/intel_dram.c                     | 1 +
 drivers/gpu/drm/i915/soc/intel_gmch.c                     | 1 +
 drivers/gpu/drm/i915/vlv_iosf_sb.c                        | 2 ++
 drivers/gpu/drm/loongson/lsdc_benchmark.c                 | 1 +
 drivers/gpu/drm/loongson/lsdc_crtc.c                      | 1 +
 drivers/gpu/drm/loongson/lsdc_debugfs.c                   | 1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                       | 1 +
 drivers/gpu/drm/loongson/lsdc_gem.c                       | 1 +
 drivers/gpu/drm/loongson/lsdc_i2c.c                       | 1 +
 drivers/gpu/drm/loongson/lsdc_irq.c                       | 1 +
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c             | 1 +
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c             | 1 +
 drivers/gpu/drm/loongson/lsdc_pixpll.c                    | 1 +
 drivers/gpu/drm/loongson/lsdc_plane.c                     | 1 +
 drivers/gpu/drm/loongson/lsdc_ttm.c                       | 1 +
 drivers/gpu/drm/nouveau/nouveau_drv.h                     | 1 +
 drivers/gpu/drm/qxl/qxl_cmd.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_debugfs.c                         | 1 +
 drivers/gpu/drm/qxl/qxl_display.c                         | 1 +
 drivers/gpu/drm/qxl/qxl_drv.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_gem.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_image.c                           | 2 ++
 drivers/gpu/drm/qxl/qxl_ioctl.c                           | 2 ++
 drivers/gpu/drm/qxl/qxl_irq.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_kms.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_release.c                         | 2 ++
 drivers/gpu/drm/qxl/qxl_ttm.c                             | 1 +
 drivers/gpu/drm/radeon/radeon.h                           | 1 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c              | 1 +
 drivers/gpu/drm/ttm/ttm_bo.c                              | 1 +
 drivers/gpu/drm/ttm/ttm_resource.c                        | 1 +
 drivers/gpu/drm/ttm/ttm_tt.c                              | 1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c                      | 1 +
 drivers/gpu/drm/vboxvideo/vbox_main.c                     | 1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c                     | 1 +
 drivers/gpu/drm/vboxvideo/vbox_ttm.c                      | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                       | 1 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                          | 2 ++
 drivers/gpu/drm/xe/xe_tuning.c                            | 1 +
 include/drm/ttm/ttm_resource.h                            | 3 ++-
 147 files changed, 219 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index 257cca4cb97a..08ff0fadd0b2 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 0bec6f66682b..9996d42ddc97 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -17,6 +17,7 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_tt.h>
diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index b262319bc83d..01f3803fa09f 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -5,6 +5,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_print.h>
+
 #include "soc/intel_dram.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 3596dce84c28..9e0647327710 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -32,6 +32,7 @@
 #include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
+#include <drm/drm_print.h>
 
 #include "soc/intel_rom.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 92a060e02cf3..8d40041c921b 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "soc/intel_dram.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index e92e7fd9fd13..e1d981cc5684 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -26,6 +26,7 @@
 #include <linux/time.h>
 
 #include <drm/drm_fixed.h>
+#include <drm/drm_print.h>
 
 #include "soc/intel_dram.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 6a55854db5b6..79bda1c6ca26 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -28,6 +28,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index d300ba1dcd2c..235fcb3086cc 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_work.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a8b4619de347..94ec36bba348 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -41,6 +41,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 38672d2896e3..46efca7e547c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -14,6 +14,7 @@
 #include <drm/drm_client_event.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_privacy_screen_consumer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index e1a812f6159b..43b27deb4a26 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index da4babfd6bcb..c4b919f44556 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -6,6 +6,8 @@
 #include <linux/iopoll.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "soc/intel_dram.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 5e88b930f5aa..d1b70a117d73 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -5,6 +5,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index f5f38dca14d7..03e8c68d2913 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "intel_clock_gating.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index c0a817018d08..58d953472218 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -3,6 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 3958628c73e9..a1645209e421 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -9,6 +9,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "i915_utils.h"
diff --git a/drivers/gpu/drm/i915/display/intel_fb_bo.c b/drivers/gpu/drm/i915/display/intel_fb_bo.c
index 7336d7294a7b..bfecd73d5fa0 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_bo.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_object.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 45af04cb0fb2..7249b784fbba 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -7,6 +7,8 @@
  * DOC: display pinning helpers
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_object.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 10ef3136dadc..ef71befbe2a9 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -43,6 +43,7 @@
 
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_stolen.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
index 56b145841473..039a48cc28aa 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -5,6 +5,8 @@
 
 #include <linux/fb.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_lmem.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 358210adb8f8..82f3a40ecac7 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -32,6 +32,7 @@
 #include <linux/i2c.h>
 #include <linux/iopoll.h>
 
+#include <drm/drm_print.h>
 #include <drm/display/drm_hdcp_helper.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
index 6a22862d6be1..c3907aeb0a78 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -3,6 +3,7 @@
  * Copyright 2023, Intel Corporation.
  */
 
+#include <drm/drm_print.h>
 #include <drm/intel/i915_hdcp_interface.h>
 
 #include "gem/i915_gem_region.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 4451a792600a..b2a1df41c12c 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -24,6 +24,7 @@
 #include <linux/debugfs.h>
 #include <linux/kernel.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 272f9e7af4d4..231b1632d64a 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -27,6 +27,7 @@
  */
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_object_frontbuffer.h"
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index c2b4b2254190..1f27643412f1 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -28,6 +28,8 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "intel_atomic.h"
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index a9f36b1b50c1..81444e0b3c41 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -3,6 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 2fc0c1c0bb87..817c7c272d4f 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -5,6 +5,7 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 0319174adf95..51f5232636f1 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -7,6 +7,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "pxp/intel_pxp.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ed6599694835..3215ef49c975 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -68,6 +68,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "gt/gen6_ppgtt.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index c3e6a325872d..cd9686a7ded2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_display.h"
 #include "gem/i915_gem_ioctls.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 7a0dee4111cb..b057c2fa03a4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -9,6 +9,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_auth.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "gem/i915_gem_ioctls.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 478011e5ecb3..e1348a0043db 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -27,6 +27,7 @@
 #include <linux/sched/mm.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_frontbuffer.h"
 #include "pxp/intel_pxp.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 3f09cbce05bb..c2f8e5f95696 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -3,9 +3,11 @@
  * Copyright © 2014-2016 Intel Corporation
  */
 
+#include <linux/vmalloc.h>
+
 #include <drm/drm_cache.h>
 #include <drm/drm_panic.h>
-#include <linux/vmalloc.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_fb.h"
 #include "display/intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index f9e7cab140f8..bc799f182850 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -8,6 +8,7 @@
 #include <linux/swap.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 7a3e74a6676e..e0d1f369a163 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -12,6 +12,8 @@
 #include <linux/dma-buf.h>
 #include <linux/vmalloc.h>
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_gt_requests.h"
 #include "gt/intel_gt.h"
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index e73b369c3347..f859c99f969b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -7,6 +7,7 @@
 #include <linux/mutex.h>
 
 #include <drm/drm_mm.h>
+#include <drm/drm_print.h>
 #include <drm/intel/i915_drm.h>
 
 #include "gem/i915_gem_lmem.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 57bb111d65da..f7455c9c34d8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -5,9 +5,10 @@
 
 #include <linux/shmem_fs.h>
 
+#include <drm/drm_buddy.h>
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
-#include <drm/drm_buddy.h>
 
 #include "i915_drv.h"
 #include "i915_ttm_buddy_manager.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 61596cecce4d..4824f948daed 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -3,6 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 307a18eede72..77cc3af3d518 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -38,6 +38,8 @@
 #include <linux/swap.h>
 #include <linux/sched/mm.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_gem_ioctls.h"
 #include "i915_gem_object.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index 8f13ec4ff0d0..1f1290214031 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -7,6 +7,8 @@
 #include <linux/mount.h>
 #include <linux/fs_context.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_gemfs.h"
 #include "i915_utils.h"
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index 539c620364e3..3557e9e6f422 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_selftest.h"
 
 #include "display/intel_display_device.h"
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 78734c404a6d..0d250d57496a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -7,6 +7,8 @@
 #include <linux/highmem.h>
 #include <linux/prime_numbers.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index e9f65f27b53f..071c1cc45257 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -3,6 +3,8 @@
  * Copyright © 2014 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gen8_engine_cs.h"
 #include "intel_engine_regs.h"
 #include "intel_gpu_commands.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index cc866773ba6f..bf6117d5fc57 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -8,6 +8,8 @@
 #include <trace/events/dma_fence.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_trace.h"
 #include "intel_breadcrumbs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 8d4bb95f8424..c042b2031577 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_request.h"
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 833987015b8b..be4bbff1a57c 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -7,6 +7,8 @@
 #include <linux/list_sort.h>
 #include <linux/llist.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "intel_engine.h"
 #include "intel_engine_user.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 7f389cb0bde4..3df683b0402a 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -110,6 +110,8 @@
 #include <linux/interrupt.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "gen8_engine_cs.h"
 #include "i915_drv.h"
 #include "i915_list_util.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 46a5aa4ab9c8..08c4e735481b 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -9,6 +9,7 @@
 #include <linux/stop_machine.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/intel/i915_drm.h>
 #include <drm/intel/intel-gtt.h>
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 889e61843ff3..5eda98ebc1ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -5,6 +5,8 @@
 
 #include <linux/highmem.h>
 
+#include <drm/drm_print.h>
+
 #include "display/intel_display.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
index c5f5f0bdfb2c..cc5d345c5e29 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
@@ -5,6 +5,7 @@
 
 #include "intel_ggtt_gmch.h"
 
+#include <drm/drm_print.h>
 #include <drm/intel/intel-gtt.h>
 
 #include <linux/agp_backend.h>
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index dcd40b30a96b..bd9abbd6d3d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -5,6 +5,8 @@
 
 #include <linux/debugfs.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "intel_gt.h"
 #include "intel_gt_debugfs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 87ef85483bae..96411f357f5d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -7,6 +7,8 @@
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_gt.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index c481b56fa67d..e8927ad49142 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -3,6 +3,8 @@
  * Copyright © 2014 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_lmem.h"
 
 #include "gen8_engine_cs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 5dd8121f4b15..e8d93a657ef6 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -3,6 +3,8 @@
  * Copyright © 2015 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 
 #include "intel_engine.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 932f9f1b06b2..286d49ecc449 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -6,6 +6,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "display/vlv_clock.h"
 #include "gem/i915_gem_region.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 51bb27e10a4f..890183de2277 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_pci.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c b/drivers/gpu/drm/i915/gt/intel_renderstate.c
index 4b56ec3743cf..d53766c288f7 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
@@ -3,6 +3,8 @@
  * Copyright © 2014 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
index 2945526d52d1..fb260d1ec360 100644
--- a/drivers/gpu/drm/i915/gt/intel_sa_media.c
+++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 9501d323d0d3..656a499b2706 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -5,6 +5,8 @@
 
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_perf_types.h"
 #include "intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index c2ee5e1826b5..1dc8205bc64d 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -7,6 +7,8 @@
 #include <linux/bitmap.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_regs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b9640212d659..843f72829a24 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_internal.h"
 
diff --git a/drivers/gpu/drm/i915/gt/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
index 7ebbcc191c2d..1b26ff6488b3 100644
--- a/drivers/gpu/drm/i915/gt/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
@@ -3,6 +3,8 @@
  * Copyright © 2017-2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "intel_wopcm.h"
 #include "i915_drv.h"
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 5eb46700dc4e..ab76703f6e8b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_selftest.h"
 #include "intel_engine_heartbeat.h"
 #include "intel_engine_pm.h"
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 0454eb1814bb..0855140c2892 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -5,6 +5,8 @@
 
 #include <linux/prime_numbers.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_engine_heartbeat.h"
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
index 9bd29be7656f..dabb870dcdb1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_context.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_gpu_commands.h"
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 62d14f82256f..8cc6e712b0f7 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -34,6 +34,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "gt/intel_ggtt_fencing.h"
diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index 9bafac1eaf48..295a7b5e1d7c 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -31,6 +31,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "gvt.h"
 #include "intel_pci_config.h"
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index d432fdd69833..df04e4ead8ea 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -36,6 +36,8 @@
 
 #include <linux/slab.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "display/intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 74197e337585..06517d1f07a2 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -33,6 +33,7 @@
  */
 
 #include <drm/display/drm_dp.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 4f599af766b0..92506c80322d 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -33,6 +33,7 @@
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_dmabuf.h"
 
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index 2031b97de2b7..30e414381af3 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -33,6 +33,7 @@
  */
 
 #include <drm/display/drm_dp.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_dp_aux_regs.h"
 #include "display/intel_gmbus.h"
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ae9b0ded3651..076d9139edc6 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -33,6 +33,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "gvt.h"
 #include "i915_pvinfo.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index f446f73f0fe2..36ea12ade849 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -37,6 +37,7 @@
  */
 
 #include <drm/display/drm_dp.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index a956da68e6bd..3e66269bc4ee 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -31,6 +31,8 @@
 
 #include <linux/eventfd.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "display/intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index c43b47687838..bbeba0d3fca8 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -48,6 +48,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "intel_gvt.h"
diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
index db5cd65100fe..214eb7effa31 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.c
+++ b/drivers/gpu/drm/i915/gvt/mmio.c
@@ -34,6 +34,9 @@
  */
 
 #include <linux/vmalloc.h>
+
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "display/intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 0b810baad20a..d4e9d485d382 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -33,6 +33,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_context.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gpu_commands.h"
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 6e87c10bc454..63ad1fed525a 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -35,6 +35,8 @@
 
 #include <linux/kthread.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_context.h"
 #include "gt/intel_execlists_submission.h"
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 11260392234a..c49e4bf95a30 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -31,6 +31,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "gvt.h"
 #include "i915_pvinfo.h"
diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 2905df83e180..7654f1be8d3b 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -28,6 +28,7 @@
 #include <linux/highmem.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 
 #include "gt/intel_engine.h"
 #include "gt/intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index c2e38d4bcd01..42f6b44f0027 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -32,6 +32,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_context.h"
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index e14a0c3db999..638fe20dfe54 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -37,6 +37,7 @@
 #include <linux/mman.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 #include "gem/i915_gem_clflush.h"
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 6fcda6d7b5b7..cf47c2491a0a 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -2,6 +2,8 @@
  * SPDX-License-Identifier: MIT
  */
 
+#include <drm/drm_print.h>
+
 #include "display/intel_overlay.h"
 #include "gem/i915_gem_mman.h"
 #include "gt/intel_engine_user.h"
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index e0a0bd687f1b..1898be4ddc8b 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -32,6 +32,7 @@
 #include <linux/sysrq.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_display_irq.h"
 #include "display/intel_hotplug.h"
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index 5862754c662c..5d9c35b5a182 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index d8f69bba79a9..a6697db21c72 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -6,6 +6,8 @@
 
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_engine.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 14d9ec0ed777..0c55fb6e9727 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -6,6 +6,8 @@
 
 #include <linux/nospec.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_perf.h"
 #include "i915_query.h"
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index b9a2b2194c8f..4399941236cb 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -31,6 +31,8 @@
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_context.h"
 #include "gt/intel_breadcrumbs.h"
 #include "gt/intel_context.h"
diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/i915/i915_switcheroo.c
index d5b6d8ab31a2..7e0791024282 100644
--- a/drivers/gpu/drm/i915/i915_switcheroo.c
+++ b/drivers/gpu/drm/i915/i915_switcheroo.c
@@ -5,6 +5,8 @@
 
 #include <linux/vga_switcheroo.h>
 
+#include <drm/drm_print.h>
+
 #include "display/intel_display_device.h"
 
 #include "i915_driver.h"
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 622c66666935..70e0d8615160 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -30,6 +30,8 @@
 #include <linux/stat.h>
 #include <linux/sysfs.h>
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_rc6.h"
 #include "gt/intel_rps.h"
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 942345548bc3..d5c6e6605086 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -5,11 +5,11 @@
 
 #include <linux/slab.h>
 
+#include <drm/drm_buddy.h>
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_bo.h>
 
-#include <drm/drm_buddy.h>
-
 #include "i915_ttm_buddy_manager.h"
 
 #include "i915_gem.h"
diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index 49f7ed413132..89b920ccbccb 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index c97323973f9b..d29a06ea51a5 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -21,6 +21,8 @@
  * SOFTWARE.
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_pvinfo.h"
 #include "i915_vgpu.h"
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 25e97031d76e..ef9c272e60e5 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -24,7 +24,9 @@
 
 #include <linux/sched/mm.h>
 #include <linux/dma-fence-array.h>
+
 #include <drm/drm_gem.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_fb.h"
 #include "display/intel_frontbuffer.h"
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 467740969431..175a240ac848 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -25,6 +25,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "display/i9xx_plane_regs.h"
 #include "display/intel_display.h"
 #include "display/intel_display_core.h"
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index dae9dce7d1b3..c3efc3454ec2 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -21,6 +21,8 @@
  * SOFTWARE.
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_vgpu.h"
 #include "intel_gvt.h"
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 59bd603e6deb..ce722f20cab1 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -5,6 +5,7 @@
 
 #include <linux/prandom.h>
 
+#include <drm/drm_print.h>
 #include <uapi/drm/i915_drm.h>
 
 #include "intel_memory_region.h"
diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
index 55ffedad2490..756652b8ec97 100644
--- a/drivers/gpu/drm/i915/intel_pcode.c
+++ b/drivers/gpu/drm/i915/intel_pcode.c
@@ -3,6 +3,8 @@
  * Copyright © 2013-2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "i915_wait_util.h"
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 285b96fadfd5..60a2af5307fc 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -3,6 +3,8 @@
  * Copyright © 2020,2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "intel_step.h"
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index aba90b80854f..4adeb271fcbf 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -24,6 +24,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_display_core.h"
 #include "gt/intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 7fa194de5d35..b1883dccc22a 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -6,6 +6,8 @@
 
 #include <linux/wait_bit.h>
 
+#include <drm/drm_print.h>
+
 #include "intel_runtime_pm.h"
 #include "intel_wakeref.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 27d545c4e6a5..d4b0c76f335b 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -5,6 +5,8 @@
 
 #include <linux/workqueue.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_context.h"
 #include "gt/intel_context.h"
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index 75df959b0aa0..2763773e627d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2023 Intel Corporation.
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 
 #include "gt/intel_context.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
index 0e609547bef8..9fc575a3d0d5 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2021-2022, Intel Corporation. All rights reserved.
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 
 #include "gem/i915_gem_region.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 091c86e03d1a..1e63261b620f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2020, Intel Corporation. All rights reserved.
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 
 #include "intel_pxp.h"
diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 0d89d70b9c36..36c3a5460221 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -7,6 +7,8 @@
 #include <linux/kref.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_gt.h"
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 48cd617247d1..1260601bda1f 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -26,6 +26,8 @@
 #include <linux/prime_numbers.h>
 #include <linux/sort.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_pm.h"
 #include "gem/selftests/mock_context.h"
diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
index 8841cfe1cac8..2e16346a6cc0 100644
--- a/drivers/gpu/drm/i915/soc/intel_dram.c
+++ b/drivers/gpu/drm/i915/soc/intel_dram.c
@@ -6,6 +6,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "../display/intel_display_core.h" /* FIXME */
 
diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
index f210c9655b53..271da30c8290 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.c
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
@@ -8,6 +8,7 @@
 #include <linux/vgaarb.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/intel/i915_drm.h>
 
 #include "../display/intel_display_core.h" /* FIXME */
diff --git a/drivers/gpu/drm/i915/vlv_iosf_sb.c b/drivers/gpu/drm/i915/vlv_iosf_sb.c
index f4b386933141..38a75651b0dc 100644
--- a/drivers/gpu/drm/i915/vlv_iosf_sb.c
+++ b/drivers/gpu/drm/i915/vlv_iosf_sb.c
@@ -3,6 +3,8 @@
  * Copyright © 2013-2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_iosf_mbi.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.c b/drivers/gpu/drm/loongson/lsdc_benchmark.c
index b088646a2ff9..659173381814 100644
--- a/drivers/gpu/drm/loongson/lsdc_benchmark.c
+++ b/drivers/gpu/drm/loongson/lsdc_benchmark.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_benchmark.h"
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_crtc.c b/drivers/gpu/drm/loongson/lsdc_crtc.c
index 03958b79f251..a5b7d5c5fd20 100644
--- a/drivers/gpu/drm/loongson/lsdc_crtc.c
+++ b/drivers/gpu/drm/loongson/lsdc_crtc.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_debugfs.c b/drivers/gpu/drm/loongson/lsdc_debugfs.c
index b9c2e6b1701f..19aa7ef577de 100644
--- a/drivers/gpu/drm/loongson/lsdc_debugfs.c
+++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_benchmark.h"
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index 12193d2a301a..abf5bf68eec2 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -15,6 +15,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index c29dd730a894..6372db2d3093 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -10,6 +10,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 #include "lsdc_gem.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
index ce90c25536d2..012b4761c538 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.c
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 #include "lsdc_output.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_irq.c b/drivers/gpu/drm/loongson/lsdc_irq.c
index efdc4d10792d..e8b7cc327f04 100644
--- a/drivers/gpu/drm/loongson/lsdc_irq.c
+++ b/drivers/gpu/drm/loongson/lsdc_irq.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023 Loongson Technology Corporation Limited
  */
 
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "lsdc_irq.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
index 600ed4fb0884..ccca67e01fd9 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index 2bd797a9b9ff..aa7daee4c065 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_pixpll.c b/drivers/gpu/drm/loongson/lsdc_pixpll.c
index 2609a2256da4..51b9a032cf43 100644
--- a/drivers/gpu/drm/loongson/lsdc_pixpll.c
+++ b/drivers/gpu/drm/loongson/lsdc_pixpll.c
@@ -6,6 +6,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 
diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index 2967a5cca069..9675344128d0 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 #include "lsdc_regs.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 2e42c6970c9f..383a758bbd7e 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -8,6 +8,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 #include "lsdc_ttm.h"
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..84a275b06295 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -49,6 +49,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index d6ea01f3797b..2e3200db2f39 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -27,6 +27,7 @@
 
 #include <linux/delay.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_util.h>
 
 #include "qxl_drv.h"
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 2d9ed3b94574..b66b14b08b61 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -30,6 +30,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index b7d0e60c0de2..a134820aac58 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -34,6 +34,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 417061ae59eb..2bbb1168a3ff 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -44,6 +44,7 @@
 #include <drm/drm_module.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "qxl_object.h"
diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
index d26043424e95..4939b57a2a48 100644
--- a/drivers/gpu/drm/qxl/qxl_gem.c
+++ b/drivers/gpu/drm/qxl/qxl_gem.c
@@ -24,6 +24,7 @@
  */
 
 #include <drm/drm.h>
+#include <drm/drm_print.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
diff --git a/drivers/gpu/drm/qxl/qxl_image.c b/drivers/gpu/drm/qxl/qxl_image.c
index ffff54e5fb31..3cc45997533d 100644
--- a/drivers/gpu/drm/qxl/qxl_image.c
+++ b/drivers/gpu/drm/qxl/qxl_image.c
@@ -26,6 +26,8 @@
 #include <linux/gfp.h>
 #include <linux/slab.h>
 
+#include <drm/drm_print.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 506ae1f5e099..336cbff26089 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -26,6 +26,8 @@
 #include <linux/pci.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_print.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
diff --git a/drivers/gpu/drm/qxl/qxl_irq.c b/drivers/gpu/drm/qxl/qxl_irq.c
index 665278ee3b6d..4018bcf808e5 100644
--- a/drivers/gpu/drm/qxl/qxl_irq.c
+++ b/drivers/gpu/drm/qxl/qxl_irq.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "qxl_drv.h"
 
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index dc3828db1991..461b7ab9ad5c 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -28,6 +28,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "qxl_drv.h"
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 05204a6a3fa8..7b3c9a6016db 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -22,6 +22,8 @@
 
 #include <linux/delay.h>
 
+#include <drm/drm_print.h>
+
 #include <trace/events/dma_fence.h>
 
 #include "qxl_drv.h"
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 765a144cea14..a6dd2d1f1004 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -28,6 +28,7 @@
 #include <drm/drm.h>
 #include <drm/drm_file.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 #include <drm/qxl_drm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 63c47585afbc..527b9d19d730 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -80,6 +80,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_audio_component.h>
 #include <drm/drm_suballoc.h>
+#include <drm/drm_print.h>
 
 #include "radeon_family.h"
 #include "radeon_mode.h"
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
index d7eb6471f2ed..dd395229e388 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/module.h>
 
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_device.h>
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index fba2a68a556e..44559dbf62f9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,7 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index d93d1bef6768..1a39c30f22fb 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -34,6 +34,7 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_util.h>
 
 /* Detach the cursor from the bulk move list*/
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 506e257dfba8..705c7d2f5798 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -40,6 +40,7 @@
 #include <linux/shmem_fs.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/drm_util.h>
 #include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_bo.h>
diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vboxvideo/vbox_irq.c
index 903a6c48ee8b..37c66668df57 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
@@ -12,6 +12,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "vbox_drv.h"
diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index 7f686a0190e6..aa6664542b20 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -12,6 +12,7 @@
 #include <linux/vbox_err.h>
 
 #include <drm/drm_damage_helper.h>
+#include <drm/drm_print.h>
 
 #include "vbox_drv.h"
 #include "vboxvideo_guest.h"
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index aa0dded595b6..d363c3f0afdf 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "hgsmi_channels.h"
diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index dc24c2172fd4..19bf8d023dc8 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -8,6 +8,7 @@
  */
 #include <linux/pci.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include "vbox_drv.h"
 
 int vbox_mm_init(struct vbox_private *vbox)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index eda5b6f8f4c4..f2abaf1bda6a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -16,6 +16,7 @@
 #include <drm/drm_auth.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
 #include <drm/ttm/ttm_execbuf_util.h>
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index a415ca488791..2b3d49dd394c 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -8,6 +8,8 @@
 #include <linux/pci.h>
 #include <linux/sizes.h>
 
+#include <drm/drm_print.h>
+
 #include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_heci_gsc.h"
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 7c140d8cb1e0..5766fa7742d3 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -8,6 +8,7 @@
 #include <kunit/visibility.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "regs/xe_gt_regs.h"
 #include "xe_gt_types.h"
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index f49daa504c36..68bf010d8b40 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -31,14 +31,15 @@
 #include <linux/iosys-map.h>
 #include <linux/dma-fence.h>
 
-#include <drm/drm_print.h>
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
 
 #define TTM_MAX_BO_PRIORITY	4U
 #define TTM_NUM_MEM_TYPES 9
 
+struct dentry;
 struct dmem_cgroup_device;
+struct drm_printer;
 struct ttm_device;
 struct ttm_resource_manager;
 struct ttm_resource;
-- 
2.47.3

