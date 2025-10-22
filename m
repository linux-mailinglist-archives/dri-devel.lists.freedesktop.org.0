Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43628BFB361
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35E10E027;
	Wed, 22 Oct 2025 09:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaQEoEze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1690F10E027;
 Wed, 22 Oct 2025 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761126522; x=1792662522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lu3ER0RaQE4YMjokoVoKHX2S2rMLsvskJffS/tmz98g=;
 b=BaQEoEzeACXQtv8jxU1OJVhV+jgoYmzy0i0xTPeijGKjmdt+YVz9YYFm
 aNIYEj5VXcWAhGgPtc6qKs5WBciS6RPlVheh01Qn4Xw1jZhZ6R3poaJ72
 sNG+fSU+gCXJJXndqvhhnDeedxErTgrJmTS9UoAvjHxUlcOdt8YmDKUDF
 UJiT/UwuXInTbJu12q7qGvAljibX2VCJqi/vJFTcA1uDIs2CIfidXubLH
 W2Y7Kc3IvkntcIDuAdYeCnN7PTNIy3R6XF7ne9m9i/A0YyXhG3mnxU7wx
 HEdRYtCaEPKVPwN+I8rdZro9VOMAod58Yyv0h4FyimaGHCEErpZ4BqGCD g==;
X-CSE-ConnectionGUID: bvip2NTzRO2LDN3BoAHYJQ==
X-CSE-MsgGUID: jDLNof40T2OaHEoFSznrxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63177136"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63177136"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:48:41 -0700
X-CSE-ConnectionGUID: EP7hrc5PQp+pwHeBJYtVvg==
X-CSE-MsgGUID: gPQG67aPSvSosIpDzFHYXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="207502720"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:48:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm: replace drm_print.h includes from headers with a
 forward declaration
Date: Wed, 22 Oct 2025 12:48:30 +0300
Message-ID: <cover.1761126446.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

v2 of [1] with a bunch of inevitable build errors fixed.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1761063757.git.jani.nikula@intel.com


Jani Nikula (3):
  drm/mm: replace drm_print.h include with a forward declaration
  drm/buddy: replace drm_print.h include with a forward declaration
  drm/ttm: replace drm_print.h include with a forward declaration

 drivers/accel/amdxdna/amdxdna_gem.c                       | 1 +
 drivers/accel/rocket/rocket_gem.c                         | 1 +
 drivers/gpu/drm/adp/adp_drv.c                             | 1 +
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c   | 1 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                          | 1 +
 drivers/gpu/drm/arm/hdlcd_drv.c                           | 1 +
 drivers/gpu/drm/arm/malidp_drv.c                          | 1 +
 drivers/gpu/drm/arm/malidp_mw.c                           | 1 +
 drivers/gpu/drm/armada/armada_crtc.c                      | 1 +
 drivers/gpu/drm/armada/armada_debugfs.c                   | 1 +
 drivers/gpu/drm/armada/armada_fb.c                        | 1 +
 drivers/gpu/drm/armada/armada_fbdev.c                     | 1 +
 drivers/gpu/drm/armada/armada_gem.c                       | 1 +
 drivers/gpu/drm/armada/armada_overlay.c                   | 1 +
 drivers/gpu/drm/armada/armada_plane.c                     | 1 +
 drivers/gpu/drm/ast/ast_mode.c                            | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c              | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c           | 1 +
 drivers/gpu/drm/drm_buddy.c                               | 1 +
 drivers/gpu/drm/drm_dumb_buffers.c                        | 1 +
 drivers/gpu/drm/drm_fbdev_dma.c                           | 1 +
 drivers/gpu/drm/drm_fbdev_shmem.c                         | 1 +
 drivers/gpu/drm/drm_gem_dma_helper.c                      | 1 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c              | 1 +
 drivers/gpu/drm/drm_gem_ttm_helper.c                      | 1 +
 drivers/gpu/drm/drm_gem_vram_helper.c                     | 1 +
 drivers/gpu/drm/drm_gpuvm.c                               | 1 +
 drivers/gpu/drm/drm_mipi_dbi.c                            | 1 +
 drivers/gpu/drm/drm_mm.c                                  | 1 +
 drivers/gpu/drm/drm_prime.c                               | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c                  | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c                     | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c                     | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c              | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c                     | 2 ++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c                     | 2 ++
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c             | 1 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c                | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c                    | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c                 | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c                  | 1 +
 drivers/gpu/drm/exynos/exynos_drm_g2d.c                   | 1 +
 drivers/gpu/drm/exynos/exynos_drm_gem.c                   | 1 +
 drivers/gpu/drm/exynos/exynos_drm_ipp.c                   | 1 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c                 | 1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c                  | 1 +
 drivers/gpu/drm/exynos/exynos_mixer.c                     | 1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c               | 1 +
 drivers/gpu/drm/gma500/backlight.c                        | 2 ++
 drivers/gpu/drm/gma500/cdv_device.c                       | 1 +
 drivers/gpu/drm/gma500/cdv_intel_display.c                | 1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c                     | 1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c                   | 1 +
 drivers/gpu/drm/gma500/cdv_intel_lvds.c                   | 1 +
 drivers/gpu/drm/gma500/gem.c                              | 1 +
 drivers/gpu/drm/gma500/intel_bios.c                       | 1 +
 drivers/gpu/drm/gma500/intel_gmbus.c                      | 2 ++
 drivers/gpu/drm/gma500/mid_bios.c                         | 1 +
 drivers/gpu/drm/gma500/oaktrail_crtc.c                    | 1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c                    | 1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c                | 3 +++
 drivers/gpu/drm/gma500/oaktrail_lvds.c                    | 1 +
 drivers/gpu/drm/gma500/opregion.c                         | 3 +++
 drivers/gpu/drm/gma500/psb_drv.c                          | 1 +
 drivers/gpu/drm/gma500/psb_intel_display.c                | 1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c                   | 1 +
 drivers/gpu/drm/gma500/psb_intel_sdvo.c                   | 1 +
 drivers/gpu/drm/gma500/psb_irq.c                          | 1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c           | 1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c           | 1 +
 drivers/gpu/drm/i915/display/i9xx_wm.c                    | 2 ++
 drivers/gpu/drm/i915/display/intel_bios.c                 | 1 +
 drivers/gpu/drm/i915/display/intel_bw.c                   | 2 ++
 drivers/gpu/drm/i915/display/intel_cdclk.c                | 1 +
 drivers/gpu/drm/i915/display/intel_connector.c            | 1 +
 drivers/gpu/drm/i915/display/intel_crtc.c                 | 1 +
 drivers/gpu/drm/i915/display/intel_display.c              | 1 +
 drivers/gpu/drm/i915/display/intel_display_debugfs.c      | 1 +
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
 drivers/gpu/drm/i915/display/intel_frontbuffer.c          | 1 +
 drivers/gpu/drm/i915/display/intel_gmbus.c                | 1 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c             | 1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c              | 1 +
 drivers/gpu/drm/i915/display/intel_overlay.c              | 1 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c             | 2 ++
 drivers/gpu/drm/i915/display/intel_plane.c                | 1 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c        | 2 ++
 drivers/gpu/drm/i915/display/intel_psr.c                  | 1 +
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
 drivers/gpu/drm/imagination/pvr_ccb.c                     | 1 +
 drivers/gpu/drm/imagination/pvr_fw.c                      | 1 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c                 | 2 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.c                | 1 +
 drivers/gpu/drm/imagination/pvr_power.c                   | 1 +
 drivers/gpu/drm/imagination/pvr_vm.c                      | 1 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c                     | 1 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c                   | 1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                       | 1 +
 drivers/gpu/drm/kmb/kmb_drv.c                             | 1 +
 drivers/gpu/drm/kmb/kmb_plane.c                           | 1 +
 drivers/gpu/drm/lima/lima_sched.c                         | 2 ++
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
 drivers/gpu/drm/mcde/mcde_display.c                       | 1 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                       | 1 +
 drivers/gpu/drm/mediatek/mtk_gem.c                        | 1 +
 drivers/gpu/drm/mediatek/mtk_plane.c                      | 1 +
 drivers/gpu/drm/meson/meson_overlay.c                     | 1 +
 drivers/gpu/drm/meson/meson_plane.c                       | 1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c                     | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200.c                    | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c                 | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh5.c                 | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c                 | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_vga.c                     | 1 +
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c                 | 1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                         | 1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                         | 1 +
 drivers/gpu/drm/nouveau/nouveau_drv.h                     | 1 +
 drivers/gpu/drm/omapdrm/omap_crtc.c                       | 1 +
 drivers/gpu/drm/omapdrm/omap_debugfs.c                    | 1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c                  | 2 ++
 drivers/gpu/drm/omapdrm/omap_drv.c                        | 1 +
 drivers/gpu/drm/omapdrm/omap_fb.c                         | 1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c                      | 1 +
 drivers/gpu/drm/omapdrm/omap_gem.c                        | 1 +
 drivers/gpu/drm/omapdrm/omap_irq.c                        | 1 +
 drivers/gpu/drm/omapdrm/omap_overlay.c                    | 1 +
 drivers/gpu/drm/omapdrm/omap_plane.c                      | 1 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c               | 2 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c                   | 1 +
 drivers/gpu/drm/panfrost/panfrost_gem.c                   | 1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c                   | 2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c                   | 1 +
 drivers/gpu/drm/panthor/panthor_devfreq.c                 | 1 +
 drivers/gpu/drm/panthor/panthor_device.c                  | 1 +
 drivers/gpu/drm/panthor/panthor_drv.c                     | 1 +
 drivers/gpu/drm/panthor/panthor_fw.c                      | 1 +
 drivers/gpu/drm/panthor/panthor_gem.c                     | 1 +
 drivers/gpu/drm/panthor/panthor_gpu.c                     | 1 +
 drivers/gpu/drm/panthor/panthor_heap.c                    | 1 +
 drivers/gpu/drm/panthor/panthor_hw.c                      | 2 ++
 drivers/gpu/drm/panthor/panthor_mmu.c                     | 1 +
 drivers/gpu/drm/panthor/panthor_sched.c                   | 1 +
 drivers/gpu/drm/pl111/pl111_display.c                     | 1 +
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
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c            | 1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c             | 1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c           | 1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c                    | 1 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.c                     | 2 ++
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c           | 1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c                      | 1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c                    | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c               | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c               | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c               | 1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c                  | 1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c                   | 1 +
 drivers/gpu/drm/sitronix/st7586.c                         | 1 +
 drivers/gpu/drm/sitronix/st7735r.c                        | 1 +
 drivers/gpu/drm/solomon/ssd130x.c                         | 1 +
 drivers/gpu/drm/sti/sti_cursor.c                          | 1 +
 drivers/gpu/drm/sti/sti_drv.c                             | 1 +
 drivers/gpu/drm/sti/sti_gdp.c                             | 1 +
 drivers/gpu/drm/sti/sti_hqvdp.c                           | 1 +
 drivers/gpu/drm/sti/sti_plane.c                           | 1 +
 drivers/gpu/drm/stm/drv.c                                 | 1 +
 drivers/gpu/drm/stm/ltdc.c                                | 1 +
 drivers/gpu/drm/sun4i/sun4i_backend.c                     | 1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                         | 1 +
 drivers/gpu/drm/sun4i/sun4i_frontend.c                    | 1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c                       | 1 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c                    | 1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c                    | 1 +
 drivers/gpu/drm/sysfb/efidrm.c                            | 1 +
 drivers/gpu/drm/sysfb/ofdrm.c                             | 1 +
 drivers/gpu/drm/sysfb/simpledrm.c                         | 1 +
 drivers/gpu/drm/sysfb/vesadrm.c                           | 1 +
 drivers/gpu/drm/tegra/dc.c                                | 1 +
 drivers/gpu/drm/tegra/drm.c                               | 1 +
 drivers/gpu/drm/tegra/dsi.c                               | 1 +
 drivers/gpu/drm/tegra/fb.c                                | 1 +
 drivers/gpu/drm/tegra/hdmi.c                              | 1 +
 drivers/gpu/drm/tegra/hub.c                               | 1 +
 drivers/gpu/drm/tegra/sor.c                               | 1 +
 drivers/gpu/drm/tests/drm_mm_test.c                       | 1 +
 drivers/gpu/drm/tidss/tidss_crtc.c                        | 1 +
 drivers/gpu/drm/tidss/tidss_dispc.c                       | 1 +
 drivers/gpu/drm/tiny/bochs.c                              | 1 +
 drivers/gpu/drm/tiny/cirrus-qemu.c                        | 1 +
 drivers/gpu/drm/tiny/gm12u320.c                           | 1 +
 drivers/gpu/drm/tiny/hx8357d.c                            | 1 +
 drivers/gpu/drm/tiny/ili9163.c                            | 1 +
 drivers/gpu/drm/tiny/ili9225.c                            | 1 +
 drivers/gpu/drm/tiny/ili9341.c                            | 1 +
 drivers/gpu/drm/tiny/ili9486.c                            | 1 +
 drivers/gpu/drm/tiny/mi0283qt.c                           | 1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c                     | 1 +
 drivers/gpu/drm/tiny/pixpaper.c                           | 1 +
 drivers/gpu/drm/tiny/repaper.c                            | 1 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c              | 1 +
 drivers/gpu/drm/ttm/ttm_bo.c                              | 1 +
 drivers/gpu/drm/ttm/ttm_resource.c                        | 1 +
 drivers/gpu/drm/ttm/ttm_tt.c                              | 1 +
 drivers/gpu/drm/tve200/tve200_display.c                   | 1 +
 drivers/gpu/drm/udl/udl_edid.c                            | 1 +
 drivers/gpu/drm/v3d/v3d_bo.c                              | 2 ++
 drivers/gpu/drm/v3d/v3d_debugfs.c                         | 1 +
 drivers/gpu/drm/v3d/v3d_drv.c                             | 1 +
 drivers/gpu/drm/v3d/v3d_gem.c                             | 1 +
 drivers/gpu/drm/v3d/v3d_gemfs.c                           | 2 ++
 drivers/gpu/drm/v3d/v3d_irq.c                             | 2 ++
 drivers/gpu/drm/v3d/v3d_sched.c                           | 1 +
 drivers/gpu/drm/v3d/v3d_submit.c                          | 1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c                      | 1 +
 drivers/gpu/drm/vboxvideo/vbox_main.c                     | 1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c                     | 1 +
 drivers/gpu/drm/vboxvideo/vbox_ttm.c                      | 1 +
 drivers/gpu/drm/vc4/vc4_bo.c                              | 1 +
 drivers/gpu/drm/vc4/vc4_debugfs.c                         | 1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_drv.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_dsi.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_gem.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                            | 1 +
 drivers/gpu/drm/vc4/vc4_hvs.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_irq.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_kms.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_perfmon.c                         | 2 ++
 drivers/gpu/drm/vc4/vc4_plane.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c                       | 2 ++
 drivers/gpu/drm/vc4/vc4_txp.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_v3d.c                             | 2 ++
 drivers/gpu/drm/vc4/vc4_validate.c                        | 2 ++
 drivers/gpu/drm/vc4/vc4_validate_shaders.c                | 2 ++
 drivers/gpu/drm/vc4/vc4_vec.c                             | 1 +
 drivers/gpu/drm/virtio/virtgpu_debugfs.c                  | 1 +
 drivers/gpu/drm/virtio/virtgpu_display.c                  | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c                      | 1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c                      | 1 +
 drivers/gpu/drm/virtio/virtgpu_object.c                   | 2 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c                    | 1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c                       | 1 +
 drivers/gpu/drm/vkms/vkms_composer.c                      | 1 +
 drivers/gpu/drm/vkms/vkms_crtc.c                          | 1 +
 drivers/gpu/drm/vkms/vkms_drv.c                           | 1 +
 drivers/gpu/drm/vkms/vkms_output.c                        | 1 +
 drivers/gpu/drm/vkms/vkms_plane.c                         | 1 +
 drivers/gpu/drm/vkms/vkms_writeback.c                     | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                       | 1 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                          | 2 ++
 drivers/gpu/drm/xe/xe_tuning.c                            | 1 +
 drivers/gpu/drm/xen/xen_drm_front.c                       | 1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c                   | 1 +
 drivers/gpu/drm/xen/xen_drm_front_kms.c                   | 1 +
 include/drm/drm_buddy.h                                   | 2 +-
 include/drm/drm_mm.h                                      | 2 +-
 include/drm/ttm/ttm_resource.h                            | 3 ++-
 378 files changed, 474 insertions(+), 7 deletions(-)

-- 
2.47.3

