Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D886768AE
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E2A10E408;
	Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A528D10E3CB
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E34860B20;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74FE7C433D2;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=y892H2Hrp8XO2BHUI0onH2eTXpkhvjetmh4EwiM69t8=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=qBkhYHhvQUDRtLnmHIRnMMvfY7cl0cZcuQ+N8pM3h4Agjjuj5DdSWWmwnUWMSr+uC
 3DErgOmEETGXbG4adekQH5u5mjK45eJYQaSTlZz5lMUhnfI2DuuOcB1+a946x9O6qM
 7n0+stuvK75j3/sBGL0up+DivyeqYtf4PpNTvgVEkFZSLUZLxL+eW9NSpy00HDJosW
 +lK9dFHecGQ9Wh2J4UhYMEAGGSBHxaXkXhbfTIxSEdzmctRJeLo/mFQSQN4HJqKfDp
 Y9LakMN3v/rkf61zcRMFaqdXM9GWrFwvZJ0Og4Awl4ziCnEJHgwsud7P41W5W+OYm4
 uUZLSVTcedNtw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4E06BC38142;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Subject: [PATCH 00/86] drm: Header file maintenance
Date: Sat, 21 Jan 2023 21:07:38 +0100
Message-Id: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtGzGMC/x2NQQrCQAxFr1KyNtBpEcWriIuZJNqAjZJoKZTe3
 RmXj/cff4MQVwm4dBu4LBr6sgrp0AFN2R6CypVh6IexT2lE9hnV6PllwSVhOjGdC/Mxc4YalRy
 CxbPR1LK2njUITdZP82+Xu67/w+tt339qzCJqgAAAAA==
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=26076;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=y892H2Hrp8XO2BHUI0onH2eTXpkhvjetmh4EwiM69t8=; =?utf-8?q?b=3Dir8+tJq3mG65?=
 =?utf-8?q?Z5Hhtk8HZM/GvcZc7YQJ+YV510s1PNJWWQGxbpjgeOvua7i+EIsh08L6OxlvMUL3?=
 4a/5Uoa8DdEJauxBumO92GAMeYHGhgS67nTm4VlgXHWzAnR4lO54
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset reduces the headers pulled in by other headers a little.
The end result is more specific dependencies and slightly faster build
times.
This ended up as a lot of patches - which makes it easier to do review
and handle future conflicts.

drm_print
- drm_print.h included a number of files that are not required by the
  header file. Push the nesessary includes to their users and clean up
  drm_print.h to the minimal set of include files.

drm_atomic_helper
- drm_atomic_helper.h included a number of files that are not required by the
  header file. Push the nesessary includes to their users and clean up
  drm_atomic_helper.h to the minimal set of include files.

For both the above changes this was a manual process involving bulding
and adding missing includes.
I have carefully maintained the sorting of the include files (but may
have failed in a few places).
I did not find any way to automate the process, so it was a tad boring.

No attempt was done to find redundant includes - I hope we can find some
tooling to help us one day.

On top of the above drm_utils was removed in a small series of two
patches. One function was moved to drm_util (as per suggestion from
Daniel in an old mail). Another prototype was moved to a more
appropriate place.

The diffstat add more lines than we delete, but the positive thing here
is that the individual files now pull in less files when building.

Sam

---
Sam Ravnborg (86):
      drm/komeda: Direct include headers from drm_print
      drm/bridge: ite-it6505: Direct include headers from drm_print
      drm/bridge: panel: Direct include headers from drm_print
      drm/msm: Direct include headers from drm_print
      drm/nouveau: Direct include headers from drm_print
      drm/omapdrm: Direct include headers from drm_print
      drm/radeon: Direct include headers from drm_print
      drm/ttm: Direct include headers from drm_print
      drm/scheduler: Direct include headers from drm_print
      drm/armada: Direct include headers from drm_print
      drm/sti: Direct include headers from drm_print
      drm/vc4: Direct include headers from drm_print
      drm/drm_print: Direct include headers from drm_print
      drm/vmwgfx: Direct include headers from drm_print
      drm/i915: Direct include headers from drm_print
      drm/drm_print: Minimize include footprint
      drm/xlnx: Direct include headers from drm_atomic_helper
      drm/amd: Direct include headers from drm_atomic_helper
      drm/komeda: Direct include headers from drm_atomic_helper
      drm/arm/hdlcd: Direct include headers from drm_atomic_helper
      drm/arm/malidp: Direct include headers from drm_atomic_helper
      drm/armada: Direct include headers from drm_atomic_helper
      drm/aspeed: Direct include headers from drm_atomic_helper
      drm/ast: Direct include headers from drm_atomic_helper
      drm/atmel-hlcdc: Direct include headers from drm_atomic_helper
      drm/bridge: adv7511: Direct include headers from drm_atomic_helper
      drm/bridge: analogix: Direct include headers from drm_atomic_helper
      drm/bridge: chipone: Direct include headers from drm_atomic_helper
      drm/bridge: chrontel: Direct include headers from drm_atomic_helper
      drm/bridge: display-connector: Direct include headers from drm_atomic_helper
      drm/bridge: fsl-ldb: Direct include headers from drm_atomic_helper
      drm/bridge: ite: Direct include headers from drm_atomic_helper
      drm/bridge: lontium: Direct include headers from drm_atomic_helper
      drm/bridge: lvds-codec: Direct include headers from drm_atomic_helper
      drm/bridge: megachips: Direct include headers from drm_atomic_helper
      drm/bridge: nxp: Direct include headers from drm_atomic_helper
      drm/bridge: panel: Direct include headers from drm_atomic_helper
      drm/bridge: sii902x: Direct include headers from drm_atomic_helper
      drm/bridge: simple-bridge: Direct include headers from drm_atomic_helper
      drm/bridge: synopsys: Direct include headers from drm_atomic_helper
      drm/bridge: tc358767: Direct include headers from drm_atomic_helper
      drm/bridge: ti: Direct include headers from drm_atomic_helper
      drm/display: Direct include headers from drm_atomic_helper
      drm: Direct include headers from drm_atomic_helper
      drm/exynos: Direct include headers from drm_atomic_helper
      drm/fsl-dcu: Direct include headers from drm_atomic_helper
      drm/gud: Direct include headers from drm_atomic_helper
      drm/hisilicon: Direct include headers from drm_atomic_helper
      drm/hyperv: Direct include headers from drm_atomic_helper
      drm/i2c: Direct include headers from drm_atomic_helper
      drm/i915: Direct include headers from drm_atomic_helper
      drm/imx: Direct include headers from drm_atomic_helper
      drm/ingenic: Direct include headers from drm_atomic_helper
      drm/kmb: Direct include headers from drm_atomic_helper
      drm/logicvc: Direct include headers from drm_atomic_helper
      drm/mcde: Direct include headers from drm_atomic_helper
      drm/mediatek: Direct include headers from drm_atomic_helper
      drm/meson: Direct include headers from drm_atomic_helper
      drm/mgag200: Direct include headers from drm_atomic_helper
      drm/msm: Direct include headers from drm_atomic_helper
      drm/mxsfb: Direct include headers from drm_atomic_helper
      drm/nouveau: Direct include headers from drm_atomic_helper
      drm/omapdrm: Direct include headers from drm_atomic_helper
      drm/qxl: Direct include headers from drm_atomic_helper
      drm/rcar-du: Direct include headers from drm_atomic_helper
      drm/rockchip: Direct include headers from drm_atomic_helper
      drm/solomon: Direct include headers from drm_atomic_helper
      drm/sprd: Direct include headers from drm_atomic_helper
      drm/sti: Direct include headers from drm_atomic_helper
      drm/stm: Direct include headers from drm_atomic_helper
      drm/sun4i: Direct include headers from drm_atomic_helper
      drm/tegra: Direct include headers from drm_atomic_helper
      drm/tests: Direct include headers from drm_atomic_helper
      drm/tidss: Direct include headers from drm_atomic_helper
      drm/tilcdc: Direct include headers from drm_atomic_helper
      drm/tiny: Direct include headers from drm_atomic_helper
      drm/udl: Direct include headers from drm_atomic_helper
      drm/vboxvideo: Direct include headers from drm_atomic_helper
      drm/vc4: Direct include headers from drm_atomic_helper
      drm/virtio: Direct include headers from drm_atomic_helper
      drm/vkms: Direct include headers from drm_atomic_helper
      drm/vmwgfx: Direct include headers from drm_atomic_helper
      drm/xen: Direct include headers from drm_atomic_helper
      drm/drm_atomic_helper: Minimize include footprint
      drm: move drm_timeout_abs_to_jiffies to drm_util
      drm: Move drm_get_panel_orientation_quirk prototype to drm_panel

 drivers/accel/ivpu/ivpu_gem.c                      |  2 +-
 drivers/gpu/drm/Makefile                           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  3 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  2 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  2 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  2 ++
 .../gpu/drm/arm/display/komeda/d71/d71_component.c |  2 ++
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |  2 ++
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |  1 +
 .../drm/arm/display/komeda/komeda_framebuffer.c    |  1 +
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |  1 +
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c   |  1 +
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |  2 ++
 .../drm/arm/display/komeda/komeda_private_obj.c    |  3 ++
 .../drm/arm/display/komeda/komeda_wb_connector.c   |  2 ++
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |  2 ++
 drivers/gpu/drm/arm/malidp_crtc.c                  |  2 ++
 drivers/gpu/drm/arm/malidp_drv.c                   |  1 +
 drivers/gpu/drm/arm/malidp_mw.c                    |  2 ++
 drivers/gpu/drm/arm/malidp_planes.c                |  2 ++
 drivers/gpu/drm/armada/armada_crtc.c               |  2 ++
 drivers/gpu/drm/armada/armada_debugfs.c            |  1 +
 drivers/gpu/drm/armada/armada_overlay.c            |  2 ++
 drivers/gpu/drm/armada/armada_plane.c              |  2 ++
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c            |  2 ++
 drivers/gpu/drm/ast/ast_drv.c                      |  1 +
 drivers/gpu/drm/ast/ast_mode.c                     |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |  2 ++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  2 ++
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  2 ++
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  2 ++
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  2 ++
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  1 +
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |  2 ++
 drivers/gpu/drm/bridge/display-connector.c         |  1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  1 +
 drivers/gpu/drm/bridge/ite-it6505.c                |  3 ++
 drivers/gpu/drm/bridge/ite-it66121.c               |  1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  2 ++
 drivers/gpu/drm/bridge/lontium-lt9211.c            |  1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  2 ++
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |  2 ++
 drivers/gpu/drm/bridge/lvds-codec.c                |  1 +
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  2 ++
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |  2 ++
 drivers/gpu/drm/bridge/panel.c                     |  3 ++
 drivers/gpu/drm/bridge/sii902x.c                   |  2 ++
 drivers/gpu/drm/bridge/simple-bridge.c             |  2 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  2 ++
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  1 +
 drivers/gpu/drm/bridge/tc358767.c                  |  2 ++
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  1 +
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  2 ++
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  1 +
 drivers/gpu/drm/drm_atomic_helper.c                |  1 +
 drivers/gpu/drm/drm_connector.c                    |  1 -
 drivers/gpu/drm/drm_crtc_helper.c                  |  1 +
 drivers/gpu/drm/drm_fb_dma_helper.c                |  1 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  1 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |  2 ++
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |  2 +-
 drivers/gpu/drm/drm_print.c                        |  1 +
 drivers/gpu/drm/drm_simple_kms_helper.c            |  2 ++
 drivers/gpu/drm/drm_syncobj.c                      | 34 ------------------
 drivers/gpu/drm/drm_util.c                         | 40 ++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_dp.c                 |  1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |  4 +++
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  2 ++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  2 ++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         |  2 ++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |  2 ++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  2 ++
 drivers/gpu/drm/gud/gud_drv.c                      |  1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |  2 ++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |  3 ++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |  2 ++
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |  2 ++
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  1 +
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |  1 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |  2 ++
 drivers/gpu/drm/i2c/tda998x_drv.c                  |  2 ++
 drivers/gpu/drm/i915/display/icl_dsi.c             |  2 ++
 drivers/gpu/drm/i915/display/intel_atomic.c        |  1 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_connector.c     |  1 +
 drivers/gpu/drm/i915/display/intel_crt.c           |  2 ++
 drivers/gpu/drm/i915/display/intel_crtc.c          |  1 +
 drivers/gpu/drm/i915/display/intel_display.c       |  3 ++
 drivers/gpu/drm/i915/display/intel_dmc.c           |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  2 ++
 drivers/gpu/drm/i915/display/intel_dvo.c           |  2 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  2 ++
 drivers/gpu/drm/i915/display/intel_lvds.c          |  2 ++
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  2 ++
 drivers/gpu/drm/i915/display/intel_tv.c            |  2 ++
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  2 ++
 drivers/gpu/drm/i915/i915_debugfs.c                |  1 +
 drivers/gpu/drm/i915/i915_debugfs_params.c         |  1 +
 drivers/gpu/drm/i915/i915_params.c                 |  1 +
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               |  2 ++
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |  1 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |  2 ++
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |  1 +
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |  2 ++
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |  2 ++
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |  2 ++
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c             |  3 ++
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |  2 ++
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |  2 ++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  3 ++
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  2 ++
 drivers/gpu/drm/kmb/kmb_crtc.c                     |  1 +
 drivers/gpu/drm/kmb/kmb_drv.h                      |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c                    |  2 ++
 drivers/gpu/drm/lima/lima_gem.c                    |  2 +-
 drivers/gpu/drm/logicvc/logicvc_crtc.c             |  2 ++
 drivers/gpu/drm/logicvc/logicvc_crtc.h             |  2 ++
 drivers/gpu/drm/logicvc/logicvc_interface.c        |  1 +
 drivers/gpu/drm/logicvc/logicvc_layer.c            |  2 ++
 drivers/gpu/drm/mcde/mcde_drv.c                    |  1 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  3 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  1 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  1 +
 drivers/gpu/drm/meson/meson_crtc.c                 |  3 ++
 drivers/gpu/drm/meson/meson_drv.c                  |  1 +
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  1 +
 drivers/gpu/drm/meson/meson_overlay.c              |  2 ++
 drivers/gpu/drm/meson/meson_plane.c                |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200.c             |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |  2 ++
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |  2 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  2 ++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |  2 ++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |  1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c   |  2 ++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  2 ++
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |  3 ++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |  2 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |  2 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |  2 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  2 ++
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  1 +
 drivers/gpu/drm/msm/msm_drv.c                      |  2 ++
 drivers/gpu/drm/msm/msm_fb.c                       |  1 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |  2 ++
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  2 ++
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  2 ++
 drivers/gpu/drm/nouveau/nouveau_display.c          |  1 +
 drivers/gpu/drm/omapdrm/omap_crtc.c                |  2 ++
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  3 ++
 drivers/gpu/drm/omapdrm/omap_fb.c                  |  1 +
 drivers/gpu/drm/omapdrm/omap_plane.c               |  2 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |  2 ++
 drivers/gpu/drm/radeon/r100.c                      |  1 +
 drivers/gpu/drm/radeon/r300.c                      |  1 +
 drivers/gpu/drm/radeon/r420.c                      |  1 +
 drivers/gpu/drm/radeon/r600.c                      |  1 +
 drivers/gpu/drm/radeon/radeon_fence.c              |  1 +
 drivers/gpu/drm/radeon/radeon_gem.c                |  1 +
 drivers/gpu/drm/radeon/radeon_ib.c                 |  2 ++
 drivers/gpu/drm/radeon/radeon_pm.c                 |  1 +
 drivers/gpu/drm/radeon/radeon_ring.c               |  2 ++
 drivers/gpu/drm/radeon/radeon_ttm.c                |  1 +
 drivers/gpu/drm/radeon/rs400.c                     |  1 +
 drivers/gpu/drm/radeon/rv515.c                     |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |  2 ++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  1 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            |  1 +
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c           |  1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  2 ++
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  2 ++
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  1 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  2 ++
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  2 ++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |  1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  2 ++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  2 ++
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |  2 ++
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |  1 +
 drivers/gpu/drm/scheduler/sched_main.c             |  1 +
 drivers/gpu/drm/solomon/ssd130x.c                  |  2 ++
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  2 ++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  1 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    |  1 +
 drivers/gpu/drm/sti/sti_crtc.c                     |  2 ++
 drivers/gpu/drm/sti/sti_cursor.c                   |  2 ++
 drivers/gpu/drm/sti/sti_drv.c                      |  1 +
 drivers/gpu/drm/sti/sti_dvo.c                      |  2 ++
 drivers/gpu/drm/sti/sti_gdp.c                      |  2 ++
 drivers/gpu/drm/sti/sti_hda.c                      |  2 ++
 drivers/gpu/drm/sti/sti_hdmi.c                     |  2 ++
 drivers/gpu/drm/sti/sti_hqvdp.c                    |  2 ++
 drivers/gpu/drm/sti/sti_tvout.c                    |  1 +
 drivers/gpu/drm/sti/sti_vid.c                      |  1 +
 drivers/gpu/drm/stm/ltdc.c                         |  2 ++
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |  2 ++
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |  1 +
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c          |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  2 ++
 drivers/gpu/drm/sun4i/sun4i_layer.c                |  2 ++
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |  2 ++
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |  2 ++
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |  2 ++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |  2 ++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |  2 ++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |  2 ++
 drivers/gpu/drm/tegra/dc.c                         |  2 ++
 drivers/gpu/drm/tegra/drm.c                        |  2 ++
 drivers/gpu/drm/tegra/dsi.c                        |  2 ++
 drivers/gpu/drm/tegra/hdmi.c                       |  2 ++
 drivers/gpu/drm/tegra/hub.c                        |  2 ++
 drivers/gpu/drm/tegra/plane.c                      |  1 +
 drivers/gpu/drm/tegra/rgb.c                        |  1 +
 drivers/gpu/drm/tegra/sor.c                        |  2 ++
 drivers/gpu/drm/tegra/uapi.c                       |  2 +-
 drivers/gpu/drm/tests/drm_plane_helper_test.c      |  1 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  2 ++
 drivers/gpu/drm/tidss/tidss_drv.c                  |  1 +
 drivers/gpu/drm/tidss/tidss_kms.c                  |  1 +
 drivers/gpu/drm/tidss/tidss_plane.c                |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |  1 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  1 +
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |  2 ++
 drivers/gpu/drm/tiny/arcpgu.c                      |  2 ++
 drivers/gpu/drm/tiny/bochs.c                       |  3 ++
 drivers/gpu/drm/tiny/gm12u320.c                    |  1 +
 drivers/gpu/drm/tiny/repaper.c                     |  2 ++
 drivers/gpu/drm/ttm/ttm_device.c                   |  1 +
 drivers/gpu/drm/ttm/ttm_resource.c                 |  1 +
 drivers/gpu/drm/ttm/ttm_tt.c                       |  1 +
 drivers/gpu/drm/udl/udl_drv.c                      |  1 +
 drivers/gpu/drm/udl/udl_modeset.c                  |  1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |  2 ++
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  2 ++
 drivers/gpu/drm/vc4/vc4_dpi.c                      |  1 +
 drivers/gpu/drm/vc4/vc4_drv.h                      |  1 +
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 ++
 drivers/gpu/drm/vc4/vc4_kms.c                      |  2 ++
 drivers/gpu/drm/vc4/vc4_plane.c                    |  2 ++
 drivers/gpu/drm/vc4/vc4_txp.c                      |  2 ++
 drivers/gpu/drm/vc4/vc4_vec.c                      |  2 ++
 drivers/gpu/drm/virtio/virtgpu_display.c           |  3 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c             |  2 ++
 drivers/gpu/drm/vkms/vkms_crtc.c                   |  2 ++
 drivers/gpu/drm/vkms/vkms_drv.c                    |  1 +
 drivers/gpu/drm/vkms/vkms_output.c                 |  2 ++
 drivers/gpu/drm/vkms/vkms_plane.c                  |  1 +
 drivers/gpu/drm/vkms/vkms_writeback.c              |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  1 +
 drivers/gpu/drm/xen/xen_drm_front_conn.c           |  2 ++
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |  2 ++
 drivers/video/fbdev/efifb.c                        |  2 +-
 include/drm/drm_atomic_helper.h                    | 21 ++++++++----
 include/drm/drm_panel.h                            |  1 +
 include/drm/drm_print.h                            | 11 +++---
 include/drm/drm_util.h                             |  1 +
 include/drm/drm_utils.h                            | 19 ----------
 309 files changed, 558 insertions(+), 73 deletions(-)
---
base-commit: 2e337a8d14bd4b04913d52ccf076be29d846acd7
change-id: 20230113-drm-include-v1-17dc8bdd5ada

Best regards,
-- 
Sam Ravnborg <sam@ravnborg.org>

