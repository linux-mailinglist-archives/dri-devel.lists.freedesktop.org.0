Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C914C7521F4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D8610E6A3;
	Thu, 13 Jul 2023 12:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBD110E631
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:26:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcd-0005qj-GN; Thu, 13 Jul 2023 10:24:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-00E4jL-Qy; Thu, 13 Jul 2023 10:24:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcb-004Vh1-PK; Thu, 13 Jul 2023 10:24:22 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Luben Tuikov <luben.tuikov@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sean Paul <seanpaul@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 05/17] drm/crtc: Rename struct drm_crtc::dev to drm
Date: Thu, 13 Jul 2023 10:23:56 +0200
Message-Id: <20230713082408.2266984-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=517799;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Upvl9tgr9qvbHcPWL5LKX2nGt5NiwNRJw75bqrqvp0g=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SL9Ge1qnCb2j6ahUkyqJ3FRrP2b4sjst6RN
 V+9JnSo3bOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0iwAKCRCPgPtYfRL+
 TkRkB/sEco3Sf0VIRUYhqYkDh+E6Zp0cwz8RaUq9DYk8uUFkbENGYLj5TkKeR3WnDF49p2WuVbc
 4FCsXM2/+Ju1tYLkv7PJNTVwKhXYxio8UO04O3Ulwf9Hxo17i9Co6TCN1UC6ZX+9vkYu7Un4Rgh
 rpvWjd9vAUrPzS4JkbCWbkbRX3CYy4xSPEuudbe9GlExGf13F0awMWiNDdkxuk+zvkGhUae1Fzm
 oqmvy/wm2sdchlaUMOejDSEBvjN4C1Yxg/L2A25p6aDuxCgdQ8NPwVjbB9l1FKLw5rJxJzSJgKe
 raPLT+Vn6VOCl1cw6eShgTfoswJhNAbOlM7JqHaD6IRe6e2i
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 13 Jul 2023 12:53:45 +0000
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"dev" is usually used for struct device pointers. Using it for struct
drm_device pointers is irritating (for me at least). Replace it
by "drm" and adapt all users.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   8 +-
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c    |  22 +--
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  26 +--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  28 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  26 +--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  26 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  26 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  20 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   8 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  22 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   2 +-
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  24 +--
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |   2 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c              |   4 +-
 drivers/gpu/drm/arm/malidp_crtc.c             |   6 +-
 drivers/gpu/drm/armada/armada_crtc.c          |  10 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |   6 +-
 drivers/gpu/drm/ast/ast_dp.c                  |   2 +-
 drivers/gpu/drm/ast/ast_mode.c                |  26 +--
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  10 +-
 drivers/gpu/drm/drm_atomic.c                  |  22 +--
 drivers/gpu/drm/drm_atomic_helper.c           |  19 ++-
 drivers/gpu/drm/drm_atomic_state_helper.c     |   2 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  22 +--
 drivers/gpu/drm/drm_blend.c                   |   2 +-
 drivers/gpu/drm/drm_color_mgmt.c              |  10 +-
 drivers/gpu/drm/drm_crtc.c                    |  18 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  10 +-
 drivers/gpu/drm/drm_debugfs.c                 |   2 +-
 drivers/gpu/drm/drm_debugfs_crc.c             |   2 +-
 drivers/gpu/drm/drm_fb_helper.c               |   6 +-
 drivers/gpu/drm/drm_mipi_dbi.c                |   4 +-
 drivers/gpu/drm/drm_plane.c                   |   2 +-
 drivers/gpu/drm/drm_plane_helper.c            |   2 +-
 drivers/gpu/drm/drm_self_refresh_helper.c     |   2 +-
 drivers/gpu/drm/drm_vblank.c                  |  40 ++---
 drivers/gpu/drm/drm_vblank_work.c             |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |   4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |  16 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c    |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |   2 +-
 drivers/gpu/drm/gma500/gma_display.c          |  20 +--
 drivers/gpu/drm/gma500/oaktrail_crtc.c        |   8 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c        |   4 +-
 drivers/gpu/drm/gma500/psb_intel_display.c    |   2 +-
 drivers/gpu/drm/gma500/psb_irq.c              |   6 +-
 drivers/gpu/drm/gud/gud_pipe.c                |   6 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  20 +--
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   6 +-
 drivers/gpu/drm/i915/display/g4x_dp.c         |   4 +-
 drivers/gpu/drm/i915/display/hsw_ips.c        |  16 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |   4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c        |  40 ++---
 drivers/gpu/drm/i915/display/icl_dsi.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |   4 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  10 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_color.c    | 124 +++++++-------
 drivers/gpu/drm/i915/display/intel_crtc.c     |  20 +--
 .../drm/i915/display/intel_crtc_state_dump.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  28 ++--
 drivers/gpu/drm/i915/display/intel_display.c  | 154 +++++++++---------
 .../gpu/drm/i915/display/intel_display_irq.c  |  22 +--
 .../gpu/drm/i915/display/intel_display_rps.c  |   2 +-
 .../drm/i915/display/intel_display_trace.h    |  12 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     |  38 ++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  44 ++---
 drivers/gpu/drm/i915/display/intel_dpt.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_dsb.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |  22 +--
 .../drm/i915/display/intel_fifo_underrun.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   2 +-
 .../drm/i915/display/intel_modeset_setup.c    |  22 +--
 .../drm/i915/display/intel_modeset_verify.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |   4 +-
 .../gpu/drm/i915/display/intel_pch_display.c  |  32 ++--
 .../gpu/drm/i915/display/intel_pch_refclk.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  10 +-
 .../drm/i915/display/intel_plane_initial.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   |  24 +--
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  18 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      |  18 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |  10 +-
 .../drm/i915/display/skl_universal_plane.c    |   6 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |  42 ++---
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-crtc.c          |  20 +--
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c        |  14 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  19 ++-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   4 +-
 drivers/gpu/drm/kmb/kmb_crtc.c                |  16 +-
 drivers/gpu/drm/logicvc/logicvc_crtc.c        |  14 +-
 drivers/gpu/drm/loongson/lsdc_crtc.c          |  12 +-
 drivers/gpu/drm/mcde/mcde_display.c           |  18 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  22 +--
 drivers/gpu/drm/meson/meson_crtc.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c        |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c      |   2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c      |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c      |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c      |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c      |   2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  68 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  20 +--
 drivers/gpu/drm/msm/msm_drv.c                 |   4 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             |  18 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  16 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  57 +++----
 drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/atom.h       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |  30 ++--
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c       |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  26 +--
 drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +--
 drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  10 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   2 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c           |  56 +++----
 drivers/gpu/drm/omapdrm/omap_irq.c            |   6 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   4 +-
 drivers/gpu/drm/pl111/pl111_display.c         |  16 +-
 drivers/gpu/drm/qxl/qxl_display.c             |   2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        |  54 +++---
 drivers/gpu/drm/radeon/radeon_cursor.c        |  13 +-
 drivers/gpu/drm/radeon/radeon_display.c       |  28 ++--
 drivers/gpu/drm/radeon/radeon_kms.c           |   6 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  16 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    |  14 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  20 +--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  |  15 +-
 drivers/gpu/drm/solomon/ssd130x.c             |   2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c               |   6 +-
 drivers/gpu/drm/sti/sti_crtc.c                |  14 +-
 drivers/gpu/drm/stm/ltdc.c                    |  12 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c            |  12 +-
 drivers/gpu/drm/tegra/dc.c                    |  12 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |  18 +-
 drivers/gpu/drm/tidss/tidss_irq.c             |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  42 ++---
 drivers/gpu/drm/tiny/bochs.c                  |   6 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   2 +-
 drivers/gpu/drm/tiny/gm12u320.c               |   4 +-
 drivers/gpu/drm/tiny/hx8357d.c                |   4 +-
 drivers/gpu/drm/tiny/ili9163.c                |   4 +-
 drivers/gpu/drm/tiny/ili9225.c                |   8 +-
 drivers/gpu/drm/tiny/ili9341.c                |   4 +-
 drivers/gpu/drm/tiny/ili9486.c                |   4 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   4 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   8 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   6 +-
 drivers/gpu/drm/tiny/repaper.c                |   8 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   2 +-
 drivers/gpu/drm/tiny/st7586.c                 |   6 +-
 drivers/gpu/drm/tiny/st7735r.c                |   4 +-
 drivers/gpu/drm/tve200/tve200_display.c       |  14 +-
 drivers/gpu/drm/udl/udl_modeset.c             |   4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |   6 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                |  38 ++---
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                 |  12 +-
 drivers/gpu/drm/vc4/vc4_txp.c                 |   2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |   4 +-
 drivers/gpu/drm/vkms/vkms_crtc.c              |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |   8 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c       |  10 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |   8 +-
 include/drm/drm_atomic_helper.h               |   2 +-
 include/drm/drm_crtc.h                        |   4 +-
 195 files changed, 1291 insertions(+), 1270 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index b702f499f5fb..f28090ecc603 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -147,14 +147,14 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
 	}
 
 	/* We borrow the event spin lock for protecting flip_status */
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm->event_lock, flags);
 
 	/* Do the flip (mmio) */
 	adev->mode_info.funcs->page_flip(adev, work->crtc_id, work->base, work->async);
 
 	/* Set the flip status */
 	amdgpu_crtc->pflip_status = AMDGPU_FLIP_SUBMITTED;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 
 
 	drm_dbg_vbl(adev_to_drm(adev),
@@ -191,7 +191,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 				uint32_t page_flip_flags, uint32_t target,
 				struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_gem_object *obj;
@@ -262,10 +262,10 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		amdgpu_get_vblank_counter_kms(crtc);
 
 	/* we borrow the event spin lock for protecting flip_wrok */
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm->event_lock, flags);
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_NONE) {
 		DRM_DEBUG_DRIVER("flip queue: crtc already busy\n");
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 		r = -EBUSY;
 		goto pflip_cleanup;
 	}
@@ -278,7 +278,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 					 amdgpu_crtc->crtc_id, amdgpu_crtc, work);
 	/* update crtc fb */
 	crtc->primary->fb = fb;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 	amdgpu_display_flip_work_func(&work->flip_work.work);
 	return 0;
 
@@ -316,7 +316,7 @@ int amdgpu_display_crtc_set_config(struct drm_mode_set *set,
 	if (!set || !set->crtc)
 		return -EINVAL;
 
-	dev = set->crtc->dev;
+	dev = set->crtc->drm;
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0)
@@ -1353,7 +1353,7 @@ bool amdgpu_display_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 					const struct drm_display_mode *mode,
 					struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct amdgpu_encoder *amdgpu_encoder;
@@ -1587,7 +1587,7 @@ bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 			int *hpos, ktime_t *stime, ktime_t *etime,
 			const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 
 	return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index e3531aa3c8bd..26b75d05e703 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1368,7 +1368,7 @@ void amdgpu_driver_release_kms(struct drm_device *dev)
  */
 u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int vpos, hpos, stat;
@@ -1436,7 +1436,7 @@ u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc)
  */
 int amdgpu_enable_vblank_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
@@ -1453,7 +1453,7 @@ int amdgpu_enable_vblank_kms(struct drm_crtc *crtc)
  */
 void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
index 0bb2466d539a..fb340f9a628b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
@@ -268,7 +268,7 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
  */
 u32 amdgpu_pll_get_use_mask(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc *test_crtc;
 	struct amdgpu_crtc *test_amdgpu_crtc;
 	u32 pll_in_use = 0;
@@ -295,7 +295,7 @@ u32 amdgpu_pll_get_use_mask(struct drm_crtc *crtc)
  */
 int amdgpu_pll_get_shared_dp_ppll(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc *test_crtc;
 	struct amdgpu_crtc *test_amdgpu_crtc;
 
@@ -324,7 +324,7 @@ int amdgpu_pll_get_shared_dp_ppll(struct drm_crtc *crtc)
 int amdgpu_pll_get_shared_nondp_ppll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc *test_crtc;
 	struct amdgpu_crtc *test_amdgpu_crtc;
 	u32 adjusted_clock, test_adjusted_clock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 5ba42af8202a..af21096696db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -63,7 +63,7 @@ static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct hrtimer *timer)
 
 static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct amdgpu_vkms_output *out = drm_crtc_to_amdgpu_vkms_output(crtc);
@@ -89,7 +89,7 @@ static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 					     ktime_t *vblank_time,
 					     bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct amdgpu_vkms_output *output = drm_crtc_to_amdgpu_vkms_output(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
@@ -146,14 +146,14 @@ static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	unsigned long flags;
 	if (crtc->state->event) {
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm->event_lock, flags);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		else
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
 
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 
 		crtc->state->event = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c b/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
index 10098fdd33fc..96400e5f1fb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
@@ -39,7 +39,7 @@ void amdgpu_atombios_crtc_overscan_setup(struct drm_crtc *crtc,
 				  struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	SET_CRTC_OVERSCAN_PS_ALLOCATION args;
@@ -82,7 +82,7 @@ void amdgpu_atombios_crtc_overscan_setup(struct drm_crtc *crtc,
 
 void amdgpu_atombios_crtc_scaler_setup(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	ENABLE_SCALER_PS_ALLOCATION args;
@@ -112,7 +112,7 @@ void amdgpu_atombios_crtc_scaler_setup(struct drm_crtc *crtc)
 void amdgpu_atombios_crtc_lock(struct drm_crtc *crtc, int lock)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index =
 	    GetIndexIntoMasterTable(COMMAND, UpdateCRTC_DoubleBufferRegisters);
@@ -129,7 +129,7 @@ void amdgpu_atombios_crtc_lock(struct drm_crtc *crtc, int lock)
 void amdgpu_atombios_crtc_enable(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, EnableCRTC);
 	ENABLE_CRTC_PS_ALLOCATION args;
@@ -145,7 +145,7 @@ void amdgpu_atombios_crtc_enable(struct drm_crtc *crtc, int state)
 void amdgpu_atombios_crtc_blank(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, BlankCRTC);
 	BLANK_CRTC_PS_ALLOCATION args;
@@ -161,7 +161,7 @@ void amdgpu_atombios_crtc_blank(struct drm_crtc *crtc, int state)
 void amdgpu_atombios_crtc_powergate(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, EnableDispPowerGating);
 	ENABLE_DISP_POWER_GATING_PS_ALLOCATION args;
@@ -190,7 +190,7 @@ void amdgpu_atombios_crtc_set_dtd_timing(struct drm_crtc *crtc,
 				  struct drm_display_mode *mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	SET_CRTC_USING_DTD_TIMING_PARAMETERS args;
 	int index = GetIndexIntoMasterTable(COMMAND, SetCRTC_UsingDTDTiming);
@@ -305,7 +305,7 @@ static u32 amdgpu_atombios_crtc_adjust_pll(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_encoder *encoder = amdgpu_crtc->encoder;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
@@ -586,7 +586,7 @@ void amdgpu_atombios_crtc_program_pll(struct drm_crtc *crtc,
 				      bool ss_enabled,
 				      struct amdgpu_atom_ss *ss)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u8 frev, crev;
 	int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
@@ -747,7 +747,7 @@ int amdgpu_atombios_crtc_prepare_pll(struct drm_crtc *crtc,
 			      struct drm_display_mode *mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder =
 		to_amdgpu_encoder(amdgpu_crtc->encoder);
@@ -816,7 +816,7 @@ int amdgpu_atombios_crtc_prepare_pll(struct drm_crtc *crtc,
 void amdgpu_atombios_crtc_set_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder =
 		to_amdgpu_encoder(amdgpu_crtc->encoder);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 9a24ed463abd..1c745d8adb63 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1824,7 +1824,7 @@ static const u32 vga_control_regs[6] =
 static void dce_v10_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
@@ -1838,7 +1838,7 @@ static void dce_v10_0_vga_enable(struct drm_crtc *crtc, bool enable)
 static void dce_v10_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
@@ -1852,7 +1852,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     int x, int y, int atomic)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -2096,7 +2096,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 static void dce_v10_0_set_interleave(struct drm_crtc *crtc,
 				     struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	u32 tmp;
@@ -2112,7 +2112,7 @@ static void dce_v10_0_set_interleave(struct drm_crtc *crtc,
 static void dce_v10_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
@@ -2247,7 +2247,7 @@ static int dce_v10_0_pick_dig_encoder(struct drm_encoder *encoder)
 static u32 dce_v10_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
@@ -2283,7 +2283,7 @@ static u32 dce_v10_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v10_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2298,7 +2298,7 @@ static void dce_v10_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v10_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	u32 tmp;
 
 	tmp = RREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset);
@@ -2309,7 +2309,7 @@ static void dce_v10_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v10_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	u32 tmp;
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
@@ -2327,7 +2327,7 @@ static int dce_v10_0_cursor_move_locked(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2500,7 +2500,7 @@ static const struct drm_crtc_funcs dce_v10_0_crtc_funcs = {
 
 static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
@@ -2554,7 +2554,7 @@ static void dce_v10_0_crtc_commit(struct drm_crtc *crtc)
 static void dce_v10_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
@@ -2635,7 +2635,7 @@ static bool dce_v10_0_crtc_mode_fixup(struct drm_crtc *crtc,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the amdgpu crtc to avoid repeated lookups later */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index c14b70350a51..e9d97d7f3c38 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -1866,7 +1866,7 @@ static const u32 vga_control_regs[6] =
 static void dce_v11_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
@@ -1880,7 +1880,7 @@ static void dce_v11_0_vga_enable(struct drm_crtc *crtc, bool enable)
 static void dce_v11_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
@@ -1894,7 +1894,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     int x, int y, int atomic)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -2138,7 +2138,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
 static void dce_v11_0_set_interleave(struct drm_crtc *crtc,
 				     struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	u32 tmp;
@@ -2154,7 +2154,7 @@ static void dce_v11_0_set_interleave(struct drm_crtc *crtc,
 static void dce_v11_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
@@ -2280,7 +2280,7 @@ static int dce_v11_0_pick_dig_encoder(struct drm_encoder *encoder)
 static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
@@ -2359,7 +2359,7 @@ static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v11_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2374,7 +2374,7 @@ static void dce_v11_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v11_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	u32 tmp;
 
 	tmp = RREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset);
@@ -2385,7 +2385,7 @@ static void dce_v11_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v11_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	u32 tmp;
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
@@ -2403,7 +2403,7 @@ static int dce_v11_0_cursor_move_locked(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2576,7 +2576,7 @@ static const struct drm_crtc_funcs dce_v11_0_crtc_funcs = {
 
 static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
@@ -2630,7 +2630,7 @@ static void dce_v11_0_crtc_commit(struct drm_crtc *crtc)
 static void dce_v11_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
@@ -2700,7 +2700,7 @@ static int dce_v11_0_crtc_mode_set(struct drm_crtc *crtc,
 				  int x, int y, struct drm_framebuffer *old_fb)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (!amdgpu_crtc->adjusted_clock)
@@ -2740,7 +2740,7 @@ static bool dce_v11_0_crtc_mode_fixup(struct drm_crtc *crtc,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the amdgpu crtc to avoid repeated lookups later */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 7f85ba5b726f..e226b57b8ef8 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1789,7 +1789,7 @@ static const u32 vga_control_regs[6] =
 static void dce_v6_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
@@ -1800,7 +1800,7 @@ static void dce_v6_0_vga_enable(struct drm_crtc *crtc, bool enable)
 static void dce_v6_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	WREG32(mmGRPH_ENABLE + amdgpu_crtc->crtc_offset, enable ? 1 : 0);
@@ -1811,7 +1811,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     int x, int y, int atomic)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -2033,7 +2033,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 static void dce_v6_0_set_interleave(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
@@ -2048,7 +2048,7 @@ static void dce_v6_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
@@ -2148,7 +2148,7 @@ static int dce_v6_0_pick_dig_encoder(struct drm_encoder *encoder)
 static u32 dce_v6_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
@@ -2178,7 +2178,7 @@ static u32 dce_v6_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v6_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2193,7 +2193,7 @@ static void dce_v6_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v6_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 
 	WREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset,
 	       (CURSOR_24_8_PRE_MULT << CUR_CONTROL__CURSOR_MODE__SHIFT) |
@@ -2205,7 +2205,7 @@ static void dce_v6_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v6_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
 	       upper_32_bits(amdgpu_crtc->cursor_addr));
@@ -2223,7 +2223,7 @@ static int dce_v6_0_cursor_move_locked(struct drm_crtc *crtc,
 				       int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	int xorigin = 0, yorigin = 0;
 
 	int w = amdgpu_crtc->cursor_width;
@@ -2397,7 +2397,7 @@ static const struct drm_crtc_funcs dce_v6_0_crtc_funcs = {
 
 static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
@@ -2447,7 +2447,7 @@ static void dce_v6_0_crtc_disable(struct drm_crtc *crtc)
 {
 
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
@@ -2528,7 +2528,7 @@ static bool dce_v6_0_crtc_mode_fixup(struct drm_crtc *crtc,
 {
 
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the amdgpu crtc to avoid repeated lookups later */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index d421a268c9ff..e17b9e3a21fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1753,7 +1753,7 @@ static const u32 vga_control_regs[6] =
 static void dce_v8_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
@@ -1767,7 +1767,7 @@ static void dce_v8_0_vga_enable(struct drm_crtc *crtc, bool enable)
 static void dce_v8_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
@@ -1781,7 +1781,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     int x, int y, int atomic)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -2005,7 +2005,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 static void dce_v8_0_set_interleave(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
@@ -2019,7 +2019,7 @@ static void dce_v8_0_set_interleave(struct drm_crtc *crtc,
 static void dce_v8_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
@@ -2137,7 +2137,7 @@ static int dce_v8_0_pick_dig_encoder(struct drm_encoder *encoder)
 static u32 dce_v8_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
@@ -2186,7 +2186,7 @@ static u32 dce_v8_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v8_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2201,7 +2201,7 @@ static void dce_v8_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v8_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 
 	WREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset,
 	       (CURSOR_24_8_PRE_MULT << CUR_CONTROL__CURSOR_MODE__SHIFT) |
@@ -2211,7 +2211,7 @@ static void dce_v8_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v8_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
 	       upper_32_bits(amdgpu_crtc->cursor_addr));
@@ -2228,7 +2228,7 @@ static int dce_v8_0_cursor_move_locked(struct drm_crtc *crtc,
 				       int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2401,7 +2401,7 @@ static const struct drm_crtc_funcs dce_v8_0_crtc_funcs = {
 
 static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
@@ -2455,7 +2455,7 @@ static void dce_v8_0_crtc_commit(struct drm_crtc *crtc)
 static void dce_v8_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
@@ -2543,7 +2543,7 @@ static bool dce_v8_0_crtc_mode_fixup(struct drm_crtc *crtc,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the amdgpu crtc to avoid repeated lookups later */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7d48fcddb6da..485a3991820f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -515,7 +515,7 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 
 	if (acrtc) {
 		vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
-		drm_dev = acrtc->base.dev;
+		drm_dev = acrtc->base.drm;
 		vblank = &drm_dev->vblank[acrtc->base.index];
 		previous_timestamp = atomic64_read(&irq_params->previous_timestamp);
 		frame_duration_ns = vblank->time - previous_timestamp;
@@ -7771,7 +7771,7 @@ static void remove_stream(struct amdgpu_device *adev,
 static void prepare_flip_isr(struct amdgpu_crtc *acrtc)
 {
 
-	assert_spin_locked(&acrtc->base.dev->event_lock);
+	assert_spin_locked(&acrtc->base.drm->event_lock);
 	WARN_ON(acrtc->event);
 
 	acrtc->event = acrtc->base.state->event;
@@ -8190,9 +8190,9 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			 * timing control and more opportunity to avoid stutter
 			 * on late submission of flips.
 			 */
-			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+			spin_lock_irqsave(&pcrtc->drm->event_lock, flags);
 			last_flip_vblank = acrtc_attach->dm_irq_params.last_flip_vblank;
-			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&pcrtc->drm->event_lock, flags);
 		}
 
 		target_vblank = last_flip_vblank + wait_for_vblank;
@@ -8224,12 +8224,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		    acrtc_state->active_planes > 0) {
 			drm_crtc_vblank_get(pcrtc);
 
-			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+			spin_lock_irqsave(&pcrtc->drm->event_lock, flags);
 
 			WARN_ON(acrtc_attach->pflip_status != AMDGPU_FLIP_NONE);
 			prepare_flip_isr(acrtc_attach);
 
-			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&pcrtc->drm->event_lock, flags);
 		}
 
 		if (acrtc_state->stream) {
@@ -8241,12 +8241,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		   acrtc_attach->base.state->event) {
 		drm_crtc_vblank_get(pcrtc);
 
-		spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+		spin_lock_irqsave(&pcrtc->drm->event_lock, flags);
 
 		acrtc_attach->event = acrtc_attach->base.state->event;
 		acrtc_attach->base.state->event = NULL;
 
-		spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&pcrtc->drm->event_lock, flags);
 	}
 
 	/* Update the planes if changed or disable if we don't have any. */
@@ -8294,11 +8294,11 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * as part of commit.
 		 */
 		if (is_dc_timing_adjust_needed(dm_old_crtc_state, acrtc_state)) {
-			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+			spin_lock_irqsave(&pcrtc->drm->event_lock, flags);
 			dc_stream_adjust_vmin_vmax(
 				dm->dc, acrtc_state->stream,
 				&acrtc_attach->dm_irq_params.vrr_params.adjust);
-			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&pcrtc->drm->event_lock, flags);
 		}
 		mutex_lock(&dm->dc_lock);
 		update_planes_and_stream_adapter(dm->dc,
@@ -9597,7 +9597,7 @@ static int dm_check_cursor_fb(struct amdgpu_crtc *new_acrtc,
 			      struct drm_plane_state *new_plane_state,
 			      struct drm_framebuffer *fb)
 {
-	struct amdgpu_device *adev = drm_to_adev(new_acrtc->base.dev);
+	struct amdgpu_device *adev = drm_to_adev(new_acrtc->base.drm);
 	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(fb);
 	unsigned int pitch;
 	bool linear;
@@ -9782,7 +9782,7 @@ static int dm_update_plane_state(struct dc *dc,
 				 plane->base.id, new_plane_crtc->base.id);
 
 		ret = fill_dc_plane_attributes(
-			drm_to_adev(new_plane_crtc->dev),
+			drm_to_adev(new_plane_crtc->drm),
 			dc_new_plane_state,
 			new_plane_state,
 			new_crtc_state);
@@ -9889,7 +9889,7 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 
 		if (cursor_scale_w != underlying_scale_w ||
 		    cursor_scale_h != underlying_scale_h) {
-			drm_dbg_atomic(crtc->dev,
+			drm_dbg_atomic(crtc->drm,
 				       "Cursor [PLANE:%d:%s] scaling doesn't match underlying [PLANE:%d:%s]\n",
 				       cursor->base.id, cursor->name, underlying->base.id, underlying->name);
 			return -EINVAL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 0802f8e8fac5..e073ce7b0a2b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -85,7 +85,7 @@ const char *const *amdgpu_dm_crtc_get_crc_sources(struct drm_crtc *crtc,
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 static void amdgpu_dm_set_crc_window_default(struct drm_crtc *crtc, struct dc_stream_state *stream)
 {
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_display_manager *dm = &drm_to_adev(drm_dev)->dm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 	bool was_activated;
@@ -127,7 +127,7 @@ static void amdgpu_dm_crtc_notify_ta_to_read(struct work_struct *work)
 		return;
 	}
 
-	psp = &drm_to_adev(crtc->dev)->psp;
+	psp = &drm_to_adev(crtc->drm)->psp;
 
 	if (!psp->securedisplay_context.context.initialized) {
 		DRM_DEBUG_DRIVER("Secure Display fails to notify PSP TA\n");
@@ -173,7 +173,7 @@ amdgpu_dm_forward_crc_window(struct work_struct *work)
 	if (!crtc)
 		return;
 
-	dm = &drm_to_adev(crtc->dev)->dm;
+	dm = &drm_to_adev(crtc->drm)->dm;
 	stream = to_amdgpu_crtc(crtc)->dm_irq_params.stream;
 
 	mutex_lock(&dm->dc_lock);
@@ -183,7 +183,7 @@ amdgpu_dm_forward_crc_window(struct work_struct *work)
 
 bool amdgpu_dm_crc_window_is_activated(struct drm_crtc *crtc)
 {
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 	bool ret = false;
 
@@ -215,7 +215,7 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 					struct dm_crtc_state *dm_crtc_state,
 					enum amdgpu_dm_pipe_crc_source source)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	struct dc_stream_state *stream_state = dm_crtc_state->stream;
 	bool enable = amdgpu_dm_is_valid_crc_source(source);
 	int ret = 0;
@@ -259,7 +259,7 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	enum amdgpu_dm_pipe_crc_source cur_crc_src;
 	struct drm_crtc_commit *commit;
 	struct dm_crtc_state *crtc_state;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 	struct drm_dp_aux *aux = NULL;
 	bool enable = false;
@@ -323,7 +323,7 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 		struct drm_connector *connector;
 		struct drm_connector_list_iter conn_iter;
 
-		drm_connector_list_iter_begin(crtc->dev, &conn_iter);
+		drm_connector_list_iter_begin(crtc->drm, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter) {
 			if (!connector->state || connector->state->crtc != crtc)
 				continue;
@@ -433,7 +433,7 @@ void amdgpu_dm_crtc_handle_crc_irq(struct drm_crtc *crtc)
 	crtc_state = to_dm_crtc_state(crtc->state);
 	stream_state = crtc_state->stream;
 	acrtc = to_amdgpu_crtc(crtc);
-	drm_dev = crtc->dev;
+	drm_dev = crtc->drm;
 
 	spin_lock_irqsave(&drm_dev->event_lock, flags);
 	cur_crc_src = acrtc->dm_irq_params.crc_src;
@@ -478,8 +478,8 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 		return;
 
 	acrtc = to_amdgpu_crtc(crtc);
-	adev = drm_to_adev(crtc->dev);
-	drm_dev = crtc->dev;
+	adev = drm_to_adev(crtc->drm);
+	drm_dev = crtc->drm;
 
 	spin_lock_irqsave(&drm_dev->event_lock, flags1);
 	cur_crc_src = acrtc->dm_irq_params.crc_src;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 80684dea114e..8bf3172496c1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -37,7 +37,7 @@
 void amdgpu_dm_crtc_handle_vblank(struct amdgpu_crtc *acrtc)
 {
 	struct drm_crtc *crtc = &acrtc->base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned long flags;
 
 	drm_crtc_handle_vblank(crtc);
@@ -74,7 +74,7 @@ int amdgpu_dm_crtc_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
 	enum dc_irq_source irq_source;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	int rc;
 
 	if (acrtc->otg_inst == -1)
@@ -147,7 +147,7 @@ static void vblank_control_worker(struct work_struct *work)
 static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct vblank_control_work *work;
@@ -372,7 +372,7 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 										crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 	struct dc *dc = adev->dm.dc;
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
 	int ret = -EINVAL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 3b27f3c445a4..8b9b3fff74c7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -861,7 +861,7 @@ static int psr_capability_show(struct seq_file *m, void *data)
 static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
 {
 	struct drm_crtc *crtc = m->private;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	int res = -ENODEV;
 	unsigned int bpc;
@@ -913,7 +913,7 @@ DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
 static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
 {
 	struct drm_crtc *crtc = m->private;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	int res = -ENODEV;
 
@@ -3024,7 +3024,7 @@ void connector_debugfs_init(struct amdgpu_dm_connector *connector)
 static int crc_win_x_start_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3041,7 +3041,7 @@ static int crc_win_x_start_set(void *data, u64 val)
 static int crc_win_x_start_get(void *data, u64 *val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3061,7 +3061,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(crc_win_x_start_fops, crc_win_x_start_get,
 static int crc_win_y_start_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3078,7 +3078,7 @@ static int crc_win_y_start_set(void *data, u64 val)
 static int crc_win_y_start_get(void *data, u64 *val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3097,7 +3097,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(crc_win_y_start_fops, crc_win_y_start_get,
 static int crc_win_x_end_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3114,7 +3114,7 @@ static int crc_win_x_end_set(void *data, u64 val)
 static int crc_win_x_end_get(void *data, u64 *val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3133,7 +3133,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(crc_win_x_end_fops, crc_win_x_end_get,
 static int crc_win_y_end_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3150,7 +3150,7 @@ static int crc_win_y_end_set(void *data, u64 val)
 static int crc_win_y_end_get(void *data, u64 *val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3169,7 +3169,7 @@ static int crc_win_update_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
 	struct amdgpu_crtc *acrtc;
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm);
 
 	if (val) {
 		acrtc = to_amdgpu_crtc(crtc);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 322668973747..7ea95dfde4e3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1020,7 +1020,7 @@ int amdgpu_dm_plane_helper_check_state(struct drm_plane_state *state,
 		}
 
 		/* Get min/max allowed scaling factors from plane caps. */
-		get_min_max_dc_plane_scaling(state->crtc->dev, fb,
+		get_min_max_dc_plane_scaling(state->crtc->drm, fb,
 					     &min_downscale, &max_upscale);
 		/*
 		 * Convert to drm convention: 16.16 fixed point, instead of dc's
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index cea3fd5772b5..a86286035662 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -108,7 +108,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
 static int
 komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 {
-	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
+	struct komeda_dev *mdev = kcrtc->base.drm->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(kcrtc->base.state);
 	struct drm_display_mode *mode = &kcrtc_st->base.adjusted_mode;
@@ -161,7 +161,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
 static int
 komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
 {
-	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
+	struct komeda_dev *mdev = kcrtc->base.drm->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	u32 new_mode;
 	int err;
@@ -220,7 +220,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 		unsigned long flags;
 		struct drm_pending_vblank_event *event;
 
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm->event_lock, flags);
 		if (kcrtc->disable_done) {
 			complete_all(kcrtc->disable_done);
 			kcrtc->disable_done = NULL;
@@ -236,7 +236,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
 			DRM_WARN("CRTC[%d]: FLIP happened but no pending commit.\n",
 				 drm_crtc_index(&kcrtc->base));
 		}
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 	}
 }
 
@@ -246,7 +246,7 @@ komeda_crtc_do_flush(struct drm_crtc *crtc,
 {
 	struct komeda_crtc *kcrtc = to_kcrtc(crtc);
 	struct komeda_crtc_state *kcrtc_st = to_kcrtc_st(crtc->state);
-	struct komeda_dev *mdev = kcrtc->base.dev->dev_private;
+	struct komeda_dev *mdev = kcrtc->base.drm->dev_private;
 	struct komeda_pipeline *master = kcrtc->master;
 	struct komeda_pipeline *slave = kcrtc->slave;
 	struct komeda_wb_connector *wb_conn = kcrtc->wb_conn;
@@ -277,7 +277,7 @@ komeda_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *old = drm_atomic_get_old_crtc_state(state,
 								   crtc);
-	pm_runtime_get_sync(crtc->dev->dev);
+	pm_runtime_get_sync(crtc->drm->dev);
 	komeda_crtc_prepare(to_kcrtc(crtc));
 	drm_crtc_vblank_on(crtc);
 	WARN_ON(drm_crtc_vblank_get(crtc));
@@ -288,7 +288,7 @@ void
 komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 					 struct completion *input_flip_done)
 {
-	struct drm_device *drm = kcrtc->base.dev;
+	struct drm_device *drm = kcrtc->base.drm;
 	struct komeda_dev *mdev = kcrtc->master->mdev;
 	struct completion *flip_done;
 	struct completion temp;
@@ -378,7 +378,7 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_put(crtc);
 	drm_crtc_vblank_off(crtc);
 	komeda_crtc_unprepare(kcrtc);
-	pm_runtime_put(crtc->dev->dev);
+	pm_runtime_put(crtc->drm->dev);
 }
 
 static void
@@ -414,7 +414,7 @@ komeda_calc_min_aclk_rate(struct komeda_crtc *kcrtc,
 unsigned long komeda_crtc_get_aclk(struct komeda_crtc_state *kcrtc_st)
 {
 	struct drm_crtc *crtc = kcrtc_st->base.crtc;
-	struct komeda_dev *mdev = crtc->dev->dev_private;
+	struct komeda_dev *mdev = crtc->drm->dev_private;
 	unsigned long pxlclk = kcrtc_st->base.adjusted_mode.crtc_clock * 1000;
 	unsigned long min_aclk;
 
@@ -426,7 +426,7 @@ unsigned long komeda_crtc_get_aclk(struct komeda_crtc_state *kcrtc_st)
 static enum drm_mode_status
 komeda_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *m)
 {
-	struct komeda_dev *mdev = crtc->dev->dev_private;
+	struct komeda_dev *mdev = crtc->drm->dev_private;
 	struct komeda_crtc *kcrtc = to_kcrtc(crtc);
 	struct komeda_pipeline *master = kcrtc->master;
 	unsigned long min_pxlclk, min_aclk;
@@ -532,7 +532,7 @@ static void komeda_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 
 static int komeda_crtc_vblank_enable(struct drm_crtc *crtc)
 {
-	struct komeda_dev *mdev = crtc->dev->dev_private;
+	struct komeda_dev *mdev = crtc->drm->dev_private;
 	struct komeda_crtc *kcrtc = to_kcrtc(crtc);
 
 	mdev->funcs->on_off_vblank(mdev, kcrtc->master->id, true);
@@ -541,7 +541,7 @@ static int komeda_crtc_vblank_enable(struct drm_crtc *crtc)
 
 static void komeda_crtc_vblank_disable(struct drm_crtc *crtc)
 {
-	struct komeda_dev *mdev = crtc->dev->dev_private;
+	struct komeda_dev *mdev = crtc->drm->dev_private;
 	struct komeda_crtc *kcrtc = to_kcrtc(crtc);
 
 	mdev->funcs->on_off_vblank(mdev, kcrtc->master->id, false);
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index dd3c455bb1bb..669d11ac34f0 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -168,7 +168,7 @@ static int komeda_crtc_normalize_zpos(struct drm_crtc *crtc,
 	INIT_LIST_HEAD(&zorder_list);
 
 	/* This loop also added all effected planes into the new state */
-	drm_for_each_plane_mask(plane, crtc->dev, crtc_st->plane_mask) {
+	drm_for_each_plane_mask(plane, crtc->drm, crtc_st->plane_mask) {
 		plane_st = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_st))
 			return PTR_ERR(plane_st);
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 3cfefadc7c9d..f7f2d101d476 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -211,12 +211,12 @@ static void hdlcd_crtc_atomic_begin(struct drm_crtc *crtc,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index dc01c43f6193..f09de55d8a20 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -52,7 +52,7 @@ static void malidp_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct malidp_drm *malidp = crtc_to_malidp_device(crtc);
 	struct malidp_hw_device *hwdev = malidp->dev;
 	struct videomode vm;
-	int err = pm_runtime_get_sync(crtc->dev->dev);
+	int err = pm_runtime_get_sync(crtc->drm->dev);
 
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to enable runtime power management: %d\n", err);
@@ -87,7 +87,7 @@ static void malidp_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	clk_disable_unprepare(hwdev->pxlclk);
 
-	err = pm_runtime_put(crtc->dev->dev);
+	err = pm_runtime_put(crtc->drm->dev);
 	if (err < 0) {
 		DRM_DEBUG_DRIVER("Failed to disable runtime power management: %d\n", err);
 	}
@@ -186,7 +186,7 @@ static int malidp_crtc_atomic_check_gamma(struct drm_crtc *crtc,
 		 * changing the gamma LUT doesn't depend on any external
 		 * resources, it is safe to call it only once.
 		 */
-		ret = drm_atomic_helper_check_modeset(crtc->dev, state->state);
+		ret = drm_atomic_helper_check_modeset(crtc->drm, state->state);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index 15dd667aa2e7..6ae3e1c2f677 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -293,9 +293,9 @@ static void armada_drm_crtc_irq(struct armada_crtc *dcrtc, u32 stat)
 	if (stat & VSYNC_IRQ && !dcrtc->update_pending) {
 		event = xchg(&dcrtc->event, NULL);
 		if (event) {
-			spin_lock(&dcrtc->crtc.dev->event_lock);
+			spin_lock(&dcrtc->crtc.drm->event_lock);
 			drm_crtc_send_vblank_event(&dcrtc->crtc, event);
-			spin_unlock(&dcrtc->crtc.dev->event_lock);
+			spin_unlock(&dcrtc->crtc.drm->event_lock);
 			drm_crtc_vblank_put(&dcrtc->crtc);
 		}
 	}
@@ -502,9 +502,9 @@ static void armada_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 		event = crtc->state->event;
 		crtc->state->event = NULL;
 		if (event) {
-			spin_lock_irq(&crtc->dev->event_lock);
+			spin_lock_irq(&crtc->drm->event_lock);
 			drm_crtc_send_vblank_event(crtc, event);
-			spin_unlock_irq(&crtc->dev->event_lock);
+			spin_unlock_irq(&crtc->drm->event_lock);
 		}
 	}
 }
@@ -766,7 +766,7 @@ static int armada_drm_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 static void armada_drm_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct armada_crtc *dcrtc = drm_to_armada_crtc(crtc);
-	struct armada_private *priv = drm_to_armada_dev(crtc->dev);
+	struct armada_private *priv = drm_to_armada_dev(crtc->drm);
 
 	if (dcrtc->cursor_obj)
 		drm_gem_object_put(&dcrtc->cursor_obj->obj);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 7877a57b8e26..41f6454d15bf 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -26,7 +26,7 @@ drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
 static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
 {
 	struct drm_crtc *crtc = &priv->pipe.crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	const u32 format = crtc->primary->state->fb->format->format;
 	u32 ctrl1;
 
@@ -169,7 +169,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_pending_vblank_event *event;
 	struct drm_gem_dma_object *gem;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	event = crtc->state->event;
 	if (event) {
 		crtc->state->event = NULL;
@@ -179,7 +179,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 		else
 			drm_crtc_send_vblank_event(crtc, event);
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 
 	if (!fb)
 		return;
diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 6dc1a09504e1..460b560ccb0f 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -187,7 +187,7 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
 
 void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
 {
-	struct ast_device *ast = to_ast_device(crtc->dev);
+	struct ast_device *ast = to_ast_device(crtc->drm);
 
 	u32 ulRefreshRateIndex;
 	u8 ModeIdx;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 31a3e590395e..bfbdc03c1ac9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1003,7 +1003,7 @@ static int ast_cursor_plane_init(struct ast_device *ast)
 
 static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct ast_device *ast = to_ast_device(crtc->dev);
+	struct ast_device *ast = to_ast_device(crtc->drm);
 	u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
@@ -1017,12 +1017,12 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
 		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
 		if (ast->tx_chip_types & AST_TX_DP501_BIT)
-			ast_set_dp501_video_output(crtc->dev, 1);
+			ast_set_dp501_video_output(crtc->drm, 1);
 
 		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
-			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_ON);
+			ast_dp_power_on_off(crtc->drm, AST_DP_POWER_ON);
 			ast_wait_for_vretrace(ast);
-			ast_dp_set_on_off(crtc->dev, 1);
+			ast_dp_set_on_off(crtc->drm, 1);
 		}
 
 		ast_state = to_ast_crtc_state(crtc->state);
@@ -1044,11 +1044,11 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	case DRM_MODE_DPMS_OFF:
 		ch = mode;
 		if (ast->tx_chip_types & AST_TX_DP501_BIT)
-			ast_set_dp501_video_output(crtc->dev, 0);
+			ast_set_dp501_video_output(crtc->drm, 0);
 
 		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
-			ast_dp_set_on_off(crtc->dev, 0);
-			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_OFF);
+			ast_dp_set_on_off(crtc->drm, 0);
+			ast_dp_power_on_off(crtc->drm, AST_DP_POWER_OFF);
 		}
 
 		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0x20);
@@ -1060,7 +1060,7 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 static enum drm_mode_status
 ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
 {
-	struct ast_device *ast = to_ast_device(crtc->dev);
+	struct ast_device *ast = to_ast_device(crtc->drm);
 	enum drm_mode_status status;
 	uint32_t jtemp;
 
@@ -1135,7 +1135,7 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
 	bool succ;
@@ -1185,7 +1185,7 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
@@ -1210,7 +1210,7 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 
 static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct ast_device *ast = to_ast_device(dev);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
@@ -1232,7 +1232,7 @@ static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct ast_device *ast = to_ast_device(dev);
 
 	ast_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
@@ -1282,7 +1282,7 @@ static struct drm_crtc_state *
 ast_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
 	struct ast_crtc_state *new_ast_state, *ast_state;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 
 	if (drm_WARN_ON(dev, !crtc->state))
 		return NULL;
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 58184cd6ab0b..2dbdf16e4b9d 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -168,7 +168,7 @@ atmel_hlcdc_crtc_mode_valid(struct drm_crtc *c,
 static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 					    struct drm_atomic_state *state)
 {
-	struct drm_device *dev = c->dev;
+	struct drm_device *dev = c->drm;
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
 	struct regmap *regmap = crtc->dc->hlcdc->regmap;
 	unsigned int status;
@@ -203,7 +203,7 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 					   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = c->dev;
+	struct drm_device *dev = c->drm;
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
 	struct regmap *regmap = crtc->dc->hlcdc->regmap;
 	unsigned int status;
@@ -353,7 +353,7 @@ static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *c,
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
 	unsigned long flags;
 
-	spin_lock_irqsave(&c->dev->event_lock, flags);
+	spin_lock_irqsave(&c->drm->event_lock, flags);
 
 	if (c->state->event) {
 		c->state->event->pipe = drm_crtc_index(c);
@@ -363,7 +363,7 @@ static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *c,
 		crtc->event = c->state->event;
 		c->state->event = NULL;
 	}
-	spin_unlock_irqrestore(&c->dev->event_lock, flags);
+	spin_unlock_irqrestore(&c->drm->event_lock, flags);
 }
 
 static const struct drm_crtc_helper_funcs lcdc_crtc_helper_funcs = {
@@ -386,7 +386,7 @@ static void atmel_hlcdc_crtc_destroy(struct drm_crtc *c)
 
 static void atmel_hlcdc_crtc_finish_page_flip(struct atmel_hlcdc_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f473848d5ecb..8c2ebb982972 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -76,7 +76,7 @@ int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
 
 	ret = wait_for_completion_timeout(&commit->hw_done, timeout);
 	if (!ret) {
-		drm_err(commit->crtc->dev, "hw_done timed out\n");
+		drm_err(commit->crtc->drm, "hw_done timed out\n");
 		return -ETIMEDOUT;
 	}
 
@@ -86,7 +86,7 @@ int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
 	 */
 	ret = wait_for_completion_timeout(&commit->flip_done, timeout);
 	if (!ret) {
-		drm_err(commit->crtc->dev, "flip_done timed out\n");
+		drm_err(commit->crtc->drm, "flip_done timed out\n");
 		return -ETIMEDOUT;
 	}
 
@@ -381,7 +381,7 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 	 */
 
 	if (new_crtc_state->active && !new_crtc_state->enable) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "[CRTC:%d:%s] active without enabled\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
@@ -391,17 +391,17 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 	 * as this is a kernel-internal detail that userspace should never
 	 * be able to trigger.
 	 */
-	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
+	if (drm_core_check_feature(crtc->drm, DRIVER_ATOMIC) &&
 	    WARN_ON(new_crtc_state->enable && !new_crtc_state->mode_blob)) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "[CRTC:%d:%s] enabled without mode blob\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
 
-	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
+	if (drm_core_check_feature(crtc->drm, DRIVER_ATOMIC) &&
 	    WARN_ON(!new_crtc_state->enable && new_crtc_state->mode_blob)) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "[CRTC:%d:%s] disabled with mode blob\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
@@ -419,7 +419,7 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 	 */
 	if (new_crtc_state->event &&
 	    !new_crtc_state->active && !old_crtc_state->active) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "[CRTC:%d:%s] requesting event but off\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
@@ -1295,7 +1295,7 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 	if (ret)
 		return ret;
 
-	drm_dbg_atomic(crtc->dev,
+	drm_dbg_atomic(crtc->drm,
 		       "Adding all current connectors for [CRTC:%d:%s] to %p\n",
 		       crtc->base.id, crtc->name, state);
 
@@ -1350,7 +1350,7 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 
 	WARN_ON(!drm_atomic_get_new_crtc_state(state, crtc));
 
-	drm_dbg_atomic(crtc->dev,
+	drm_dbg_atomic(crtc->drm,
 		       "Adding all current planes for [CRTC:%d:%s] to %p\n",
 		       crtc->base.id, crtc->name, state);
 
@@ -1562,7 +1562,7 @@ EXPORT_SYMBOL(__drm_atomic_helper_disable_plane);
 static int update_output_state(struct drm_atomic_state *state,
 			       struct drm_mode_set *set)
 {
-	struct drm_device *dev = set->crtc->dev;
+	struct drm_device *dev = set->crtc->drm;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 98c9377aeef5..9828f630fdd2 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -494,7 +494,8 @@ mode_fixup(struct drm_atomic_state *state)
 		ret = funcs->mode_fixup(crtc, &new_crtc_state->mode,
 					&new_crtc_state->adjusted_mode);
 		if (!ret) {
-			drm_dbg_atomic(crtc->dev, "[CRTC:%d:%s] fixup failed\n",
+			drm_dbg_atomic(crtc->drm,
+				       "[CRTC:%d:%s] fixup failed\n",
 				       crtc->base.id, crtc->name);
 			return -EINVAL;
 		}
@@ -941,7 +942,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
 int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state)
 {
 	struct drm_crtc *crtc = crtc_state->crtc;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_plane *plane;
 
 	/* needs at least one primary plane to be enabled */
@@ -1015,7 +1016,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 
 		ret = funcs->atomic_check(crtc, state);
 		if (ret) {
-			drm_dbg_atomic(crtc->dev,
+			drm_dbg_atomic(crtc->drm,
 				       "[CRTC:%d:%s] atomic driver check failed\n",
 				       crtc->base.id, crtc->name);
 			return ret;
@@ -2141,7 +2142,7 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
 			 */
 			if (!completed && nonblock) {
 				spin_unlock(&crtc->commit_lock);
-				drm_dbg_atomic(crtc->dev,
+				drm_dbg_atomic(crtc->drm,
 					       "[CRTC:%d:%s] busy with a previous commit\n",
 					       crtc->base.id, crtc->name);
 
@@ -2165,7 +2166,7 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
 	ret = wait_for_completion_interruptible_timeout(&stall_commit->cleanup_done,
 							10*HZ);
 	if (ret == 0)
-		drm_err(crtc->dev, "[CRTC:%d:%s] cleanup_done timed out\n",
+		drm_err(crtc->drm, "[CRTC:%d:%s] cleanup_done timed out\n",
 			crtc->base.id, crtc->name);
 
 	drm_crtc_commit_put(stall_commit);
@@ -2400,7 +2401,7 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
 	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
 		ret = drm_crtc_commit_wait(old_crtc_state->commit);
 		if (ret)
-			drm_err(crtc->dev,
+			drm_err(crtc->drm,
 				"[CRTC:%d:%s] commit wait timed out\n",
 				crtc->base.id, crtc->name);
 	}
@@ -2815,7 +2816,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
 	if (crtc_funcs && crtc_funcs->atomic_begin)
 		crtc_funcs->atomic_begin(crtc, old_state);
 
-	drm_for_each_plane_mask(plane, crtc->dev, plane_mask) {
+	drm_for_each_plane_mask(plane, crtc->drm, plane_mask) {
 		struct drm_plane_state *old_plane_state =
 			drm_atomic_get_old_plane_state(old_state, plane);
 		struct drm_plane_state *new_plane_state =
@@ -3220,7 +3221,7 @@ int drm_atomic_helper_set_config(struct drm_mode_set *set,
 	struct drm_crtc *crtc = set->crtc;
 	int ret = 0;
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm);
 	if (!state)
 		return -ENOMEM;
 
@@ -3607,7 +3608,7 @@ static int page_flip_common(struct drm_atomic_state *state,
 	/* Make sure we don't accidentally do a full modeset. */
 	state->allow_modeset = false;
 	if (!crtc_state->active) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "[CRTC:%d:%s] disabled, rejecting legacy flip\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index c551dad67694..38ad8c8e6216 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -96,7 +96,7 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 	if (crtc_state)
 		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
 
-	if (drm_dev_has_vblank(crtc->dev))
+	if (drm_dev_has_vblank(crtc->drm))
 		drm_crtc_vblank_reset(crtc);
 
 	crtc->state = crtc_state;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 84133002e46c..38a5f69f0c9c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -80,7 +80,7 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 		struct drm_property_blob *blob;
 
 		drm_mode_convert_to_umode(&umode, mode);
-		blob = drm_property_create_blob(crtc->dev,
+		blob = drm_property_create_blob(crtc->drm,
 						sizeof(umode), &umode);
 		if (IS_ERR(blob))
 			return PTR_ERR(blob);
@@ -89,13 +89,13 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 
 		state->mode_blob = blob;
 		state->enable = true;
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
 			       mode->name, crtc->base.id, crtc->name, state);
 	} else {
 		memset(&state->mode, 0, sizeof(state->mode));
 		state->enable = false;
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
 			       crtc->base.id, crtc->name, state);
 	}
@@ -134,17 +134,17 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
 		int ret;
 
 		if (blob->length != sizeof(struct drm_mode_modeinfo)) {
-			drm_dbg_atomic(crtc->dev,
+			drm_dbg_atomic(crtc->drm,
 				       "[CRTC:%d:%s] bad mode blob length: %zu\n",
 				       crtc->base.id, crtc->name,
 				       blob->length);
 			return -EINVAL;
 		}
 
-		ret = drm_mode_convert_umode(crtc->dev,
+		ret = drm_mode_convert_umode(crtc->drm,
 					     &state->mode, blob->data);
 		if (ret) {
-			drm_dbg_atomic(crtc->dev,
+			drm_dbg_atomic(crtc->drm,
 				       "[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
 				       crtc->base.id, crtc->name,
 				       ret, drm_get_mode_status_name(state->mode.status));
@@ -154,13 +154,13 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
 
 		state->mode_blob = drm_property_blob_get(blob);
 		state->enable = true;
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
 			       state->mode.name, crtc->base.id, crtc->name,
 			       state);
 	} else {
 		state->enable = false;
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
 			       crtc->base.id, crtc->name, state);
 	}
@@ -408,7 +408,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		struct drm_crtc_state *state, struct drm_property *property,
 		uint64_t val)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 	bool replaced = false;
 	int ret;
@@ -462,7 +462,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm,
 			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]\n",
 			       crtc->base.id, crtc->name,
 			       property->base.id, property->name);
@@ -477,7 +477,7 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		const struct drm_crtc_state *state,
 		struct drm_property *property, uint64_t *val)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (property == config->prop_active)
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6e74de833466..c390b8924e95 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -443,7 +443,7 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
 					  struct drm_crtc_state *crtc_state)
 {
 	struct drm_atomic_state *state = crtc_state->state;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	int total_planes = dev->mode_config.num_total_plane;
 	struct drm_plane_state **states;
 	struct drm_plane *plane;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index d021497841b8..2a437d84e531 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -166,7 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				bool has_ctm,
 				uint gamma_lut_size)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (degamma_lut_size) {
@@ -241,8 +241,8 @@ EXPORT_SYMBOL(drm_mode_crtc_set_gamma_size);
  */
 static bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
 {
-	u32 gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
-	u32 degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
+	u32 gamma_id = crtc->drm->mode_config.gamma_lut_property->base.id;
+	u32 degamma_id = crtc->drm->mode_config.degamma_lut_property->base.id;
 
 	if (!crtc->gamma_size)
 		return false;
@@ -277,7 +277,7 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
 				     u32 size,
 				     struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_atomic_state *state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_property_blob *blob;
@@ -298,7 +298,7 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
 	else
 		return -ENODEV;
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm);
 	if (!state)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index df9bf3c9206e..9a590b13a5cc 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -102,7 +102,7 @@ int drm_crtc_force_disable(struct drm_crtc *crtc)
 		.crtc = crtc,
 	};
 
-	WARN_ON(drm_drv_uses_atomic_modeset(crtc->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(crtc->drm));
 
 	return drm_mode_set_config_internal(&set);
 }
@@ -178,7 +178,7 @@ static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fence)
 {
 	struct drm_crtc *crtc = fence_to_crtc(fence);
 
-	return crtc->dev->driver->name;
+	return crtc->drm->driver->name;
 }
 
 static const char *drm_crtc_fence_get_timeline_name(struct dma_fence *fence)
@@ -264,7 +264,7 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
 		(!funcs->atomic_destroy_state ||
 		 !funcs->atomic_duplicate_state));
 
-	crtc->dev = dev;
+	crtc->drm = dev;
 	crtc->funcs = funcs;
 
 	INIT_LIST_HEAD(&crtc->commit_list);
@@ -495,7 +495,7 @@ EXPORT_SYMBOL(__drmm_crtc_alloc_with_planes);
  */
 void drm_crtc_cleanup(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 
 	/* Note that the crtc_list is considered to be static; should we
 	 * remove the drm_crtc at runtime we would have to decrement all
@@ -603,14 +603,14 @@ static int __drm_mode_set_config_internal(struct drm_mode_set *set,
 	struct drm_crtc *tmp;
 	int ret;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(crtc->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(crtc->drm));
 
 	/*
 	 * NOTE: ->set_config can also disable other crtcs (if we steal all
 	 * connectors from it), hence we need to refcount the fbs across all
 	 * crtcs. Atomic modeset will have saner semantics ...
 	 */
-	drm_for_each_crtc(tmp, crtc->dev) {
+	drm_for_each_crtc(tmp, crtc->drm) {
 		struct drm_plane *plane = tmp->primary;
 
 		plane->old_fb = plane->fb;
@@ -626,7 +626,7 @@ static int __drm_mode_set_config_internal(struct drm_mode_set *set,
 		plane->fb = fb;
 	}
 
-	drm_for_each_crtc(tmp, crtc->dev) {
+	drm_for_each_crtc(tmp, crtc->drm) {
 		struct drm_plane *plane = tmp->primary;
 
 		if (plane->fb)
@@ -654,7 +654,7 @@ static int __drm_mode_set_config_internal(struct drm_mode_set *set,
  */
 int drm_mode_set_config_internal(struct drm_mode_set *set)
 {
-	WARN_ON(drm_drv_uses_atomic_modeset(set->crtc->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(set->crtc->drm));
 
 	return __drm_mode_set_config_internal(set, NULL);
 }
@@ -943,7 +943,7 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters)
 {
 	struct drm_property *prop =
-		drm_create_scaling_filter_prop(crtc->dev, supported_filters);
+		drm_create_scaling_filter_prop(crtc->drm, supported_filters);
 
 	if (IS_ERR(prop))
 		return PTR_ERR(prop);
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 320c3f8690cb..d610c9e740d0 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -148,7 +148,7 @@ EXPORT_SYMBOL(drm_helper_encoder_in_use);
 bool drm_helper_crtc_in_use(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
@@ -285,7 +285,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 			      int x, int y,
 			      struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_display_mode *adjusted_mode, saved_mode, saved_hwmode;
 	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
 	const struct drm_encoder_helper_funcs *encoder_funcs;
@@ -462,7 +462,7 @@ EXPORT_SYMBOL(drm_crtc_helper_atomic_check);
 static void
 drm_crtc_helper_disable(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 
@@ -579,7 +579,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 
 	crtc_funcs = set->crtc->helper_private;
 
-	dev = set->crtc->dev;
+	dev = set->crtc->drm;
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
 	if (!set->mode)
@@ -869,7 +869,7 @@ static int drm_helper_choose_crtc_dpms(struct drm_crtc *crtc)
 	int dpms = DRM_MODE_DPMS_OFF;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter)
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index f18d2af96db7..3a70ac678e8f 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -539,7 +539,7 @@ void drm_debugfs_connector_remove(struct drm_connector *connector)
 
 void drm_debugfs_crtc_add(struct drm_crtc *crtc)
 {
-	struct drm_minor *minor = crtc->dev->primary;
+	struct drm_minor *minor = crtc->drm->primary;
 	struct dentry *root;
 	char *name;
 
diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
index bbc3bc4ba844..1a6bb8d6240f 100644
--- a/drivers/gpu/drm/drm_debugfs_crc.c
+++ b/drivers/gpu/drm/drm_debugfs_crc.c
@@ -200,7 +200,7 @@ static int crtc_crc_open(struct inode *inode, struct file *filep)
 	size_t values_cnt;
 	int ret = 0;
 
-	if (drm_drv_uses_atomic_modeset(crtc->dev)) {
+	if (drm_drv_uses_atomic_modeset(crtc->drm)) {
 		ret = drm_modeset_lock_single_interruptible(&crtc->mutex);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 61a5d450cc20..a8a307c1f40d 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -166,7 +166,7 @@ int drm_fb_helper_debug_enter(struct fb_info *info)
 			if (funcs->mode_set_base_atomic == NULL)
 				continue;
 
-			if (drm_drv_uses_atomic_modeset(mode_set->crtc->dev))
+			if (drm_drv_uses_atomic_modeset(mode_set->crtc->drm))
 				continue;
 
 			funcs->mode_set_base_atomic(mode_set->crtc,
@@ -199,7 +199,7 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
 	mutex_lock(&client->modeset_mutex);
 	drm_client_for_each_modeset(mode_set, client) {
 		crtc = mode_set->crtc;
-		if (drm_drv_uses_atomic_modeset(crtc->dev))
+		if (drm_drv_uses_atomic_modeset(crtc->drm))
 			continue;
 
 		funcs = crtc->helper_private;
@@ -873,7 +873,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 static struct drm_property_blob *setcmap_new_gamma_lut(struct drm_crtc *crtc,
 						       struct fb_cmap *cmap)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_property_blob *gamma_lut;
 	struct drm_color_lut *lut;
 	int size = crtc->gamma_size;
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index e13461bdb562..bd8a3802583f 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -299,7 +299,7 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 enum drm_mode_status mipi_dbi_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 					      const struct drm_display_mode *mode)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 
 	return drm_crtc_helper_mode_valid_fixed(&pipe->crtc, mode, &dbidev->mode);
 }
@@ -406,7 +406,7 @@ static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
  */
 void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 
 	DRM_DEBUG_KMS("\n");
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..1cff3c23c2a1 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1021,7 +1021,7 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
 				     struct drm_file *file_priv,
 				     struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_plane *plane = crtc->cursor;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_mode_fb_cmd2 fbreq = {
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index c91e454eba09..d26c99fa7aee 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -73,7 +73,7 @@ static int get_connectors_for_crtc(struct drm_crtc *crtc,
 				   struct drm_connector **connector_list,
 				   int num_connectors)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	int count = 0;
diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index dd33fec5aabd..383488c3a4b7 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -70,7 +70,7 @@ static void drm_self_refresh_helper_entry_work(struct work_struct *work)
 				to_delayed_work(work),
 				struct drm_self_refresh_data, entry_work);
 	struct drm_crtc *crtc = sr_data->crtc;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_atomic_state *state;
 	struct drm_connector *conn;
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 877e2067534f..87e305c8f7f6 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -402,7 +402,7 @@ u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
  */
 u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 	u64 vblank;
 	unsigned long flags;
@@ -589,7 +589,7 @@ EXPORT_SYMBOL(drm_dev_has_vblank);
  */
 wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc)
 {
-	return &crtc->dev->vblank[drm_crtc_index(crtc)].queue;
+	return &crtc->drm->vblank[drm_crtc_index(crtc)].queue;
 }
 EXPORT_SYMBOL(drm_crtc_vblank_waitqueue);
 
@@ -608,7 +608,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_waitqueue);
 void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 				     const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	int linedur_ns = 0, framedur_ns = 0;
@@ -693,7 +693,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	bool in_vblank_irq,
 	drm_vblank_get_scanout_position_func get_scanout_position)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct timespec64 ts_etime, ts_vblank_time;
@@ -919,7 +919,7 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
  */
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc)
 {
-	return drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
+	return drm_vblank_count(crtc->drm, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count);
 
@@ -980,7 +980,7 @@ static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime)
 {
-	return drm_vblank_count_and_time(crtc->dev, drm_crtc_index(crtc),
+	return drm_vblank_count_and_time(crtc->drm, drm_crtc_index(crtc),
 					 vblanktime);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
@@ -1000,10 +1000,10 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
 	struct drm_display_mode *mode;
 	u64 vblank_start;
 
-	if (!drm_dev_has_vblank(crtc->dev))
+	if (!drm_dev_has_vblank(crtc->drm))
 		return -EINVAL;
 
-	vblank = &crtc->dev->vblank[pipe];
+	vblank = &crtc->drm->vblank[pipe];
 	mode = &vblank->hwmode;
 
 	if (!vblank->framedur_ns || !vblank->linedur_ns)
@@ -1098,7 +1098,7 @@ static void send_vblank_event(struct drm_device *dev,
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 
 	assert_spin_locked(&dev->event_lock);
@@ -1123,7 +1123,7 @@ EXPORT_SYMBOL(drm_crtc_arm_vblank_event);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 				struct drm_pending_vblank_event *e)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	u64 seq;
 	unsigned int pipe = drm_crtc_index(crtc);
 	ktime_t now;
@@ -1237,7 +1237,7 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
  */
 int drm_crtc_vblank_get(struct drm_crtc *crtc)
 {
-	return drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
+	return drm_vblank_get(crtc->drm, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_get);
 
@@ -1272,7 +1272,7 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
  */
 void drm_crtc_vblank_put(struct drm_crtc *crtc)
 {
-	drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
+	drm_vblank_put(crtc->drm, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
@@ -1323,7 +1323,7 @@ EXPORT_SYMBOL(drm_wait_one_vblank);
  */
 void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 {
-	drm_wait_one_vblank(crtc->dev, drm_crtc_index(crtc));
+	drm_wait_one_vblank(crtc->drm, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_wait_one_vblank);
 
@@ -1340,7 +1340,7 @@ EXPORT_SYMBOL(drm_crtc_wait_one_vblank);
  */
 void drm_crtc_vblank_off(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct drm_pending_vblank_event *e, *t;
@@ -1419,7 +1419,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_off);
  */
 void drm_crtc_vblank_reset(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
@@ -1459,7 +1459,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_reset);
 void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 				   u32 max_vblank_count)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
@@ -1482,7 +1482,7 @@ EXPORT_SYMBOL(drm_crtc_set_max_vblank_count);
  */
 void drm_crtc_vblank_on(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
@@ -1568,9 +1568,9 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
 void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 {
 	WARN_ON_ONCE(!crtc->funcs->get_vblank_timestamp);
-	WARN_ON_ONCE(!crtc->dev->vblank_disable_immediate);
+	WARN_ON_ONCE(!crtc->drm->vblank_disable_immediate);
 
-	drm_vblank_restore(crtc->dev, drm_crtc_index(crtc));
+	drm_vblank_restore(crtc->drm, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_restore);
 
@@ -2047,7 +2047,7 @@ EXPORT_SYMBOL(drm_handle_vblank);
  */
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc)
 {
-	return drm_handle_vblank(crtc->dev, drm_crtc_index(crtc));
+	return drm_handle_vblank(crtc->drm, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_handle_vblank);
 
diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index bd481fdd6b87..f6e024bed6b5 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -242,7 +242,7 @@ void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc *crtc,
 {
 	kthread_init_work(&work->base, func);
 	INIT_LIST_HEAD(&work->node);
-	work->vblank = &crtc->dev->vblank[drm_crtc_index(crtc)];
+	work->vblank = &crtc->drm->vblank[drm_crtc_index(crtc)];
 }
 EXPORT_SYMBOL(drm_vblank_work_init);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 4153f302de7c..395c79eb438f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -40,9 +40,9 @@ static void exynos_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 		exynos_crtc->ops->atomic_disable(exynos_crtc);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -129,9 +129,9 @@ void exynos_crtc_handle_event(struct exynos_drm_crtc *exynos_crtc)
 
 	WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm->event_lock, flags);
 	drm_crtc_arm_vblank_event(crtc, event);
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 }
 
 static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7c3aa77186d3..31955e948ea2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -115,7 +115,7 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 	exynos_state->crtc.w = actual_w;
 	exynos_state->crtc.h = actual_h;
 
-	DRM_DEV_DEBUG_KMS(crtc->dev->dev,
+	DRM_DEV_DEBUG_KMS(crtc->drm->dev,
 			  "plane : offset_x/y(%d,%d), width/height(%d,%d)",
 			  exynos_state->crtc.x, exynos_state->crtc.y,
 			  exynos_state->crtc.w, exynos_state->crtc.h);
@@ -224,7 +224,7 @@ exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 	if (width_ok && height_ok)
 		return 0;
 
-	DRM_DEV_DEBUG_KMS(crtc->dev->dev, "scaling mode is not supported");
+	DRM_DEV_DEBUG_KMS(crtc->drm->dev, "scaling mode is not supported");
 	return -ENOTSUPP;
 }
 
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index 2af60d98f48f..b765a0cfcded 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -23,7 +23,7 @@
 static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 					  struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 	struct drm_pending_vblank_event *event = crtc->state->event;
 
@@ -33,12 +33,12 @@ static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
@@ -47,7 +47,7 @@ static void fsl_dcu_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
 									      crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 
 	/* always disable planes on the CRTC */
@@ -66,7 +66,7 @@ static void fsl_dcu_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 
 	clk_prepare_enable(fsl_dev->pix_clk);
@@ -81,7 +81,7 @@ static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 	struct drm_connector *con = &fsl_dev->connector.base;
 	struct drm_display_mode *mode = &crtc->state->mode;
@@ -134,7 +134,7 @@ static const struct drm_crtc_helper_funcs fsl_dcu_drm_crtc_helper_funcs = {
 
 static int fsl_dcu_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 	unsigned int value;
 
@@ -147,7 +147,7 @@ static int fsl_dcu_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void fsl_dcu_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
 	unsigned int value;
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index bbd0abdd8382..a2093eeedf2a 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -574,7 +574,7 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 			       int x, int y,
 			       struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 578d179a6017..e525a6782245 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -983,7 +983,7 @@ void
 cdv_intel_dp_set_m_n(struct drm_crtc *crtc, struct drm_display_mode *mode,
 		 struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index f65e90d890f4..f20c6599bf51 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -29,7 +29,7 @@
  */
 bool gma_pipe_has_type(struct drm_crtc *crtc, int type)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 
@@ -58,7 +58,7 @@ void gma_wait_for_vblank(struct drm_device *dev)
 int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
 		      struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct drm_framebuffer *fb = crtc->primary->fb;
@@ -143,7 +143,7 @@ int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
 /* Loads the palette/gamma unit for the CRTC with the prepared values */
 void gma_crtc_load_lut(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	const struct psb_offset *map = &dev_priv->regmap[gma_crtc->pipe];
@@ -196,7 +196,7 @@ static int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green,
  */
 void gma_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
@@ -330,7 +330,7 @@ static int gma_crtc_cursor_set(struct drm_crtc *crtc,
 			       struct drm_file *file_priv, uint32_t handle,
 			       uint32_t width, uint32_t height)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
@@ -443,7 +443,7 @@ static int gma_crtc_cursor_set(struct drm_crtc *crtc,
 
 static int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
 	uint32_t temp = 0;
@@ -518,7 +518,7 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
 	struct drm_framebuffer *current_fb = crtc->primary->fb;
 	struct drm_framebuffer *old_fb = crtc->primary->old_fb;
 	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned long flags;
 	int ret;
 
@@ -574,7 +574,7 @@ const struct drm_crtc_funcs gma_crtc_funcs = {
  */
 void gma_crtc_save(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct psb_intel_crtc_state *crtc_state = gma_crtc->crtc_state;
@@ -617,7 +617,7 @@ void gma_crtc_save(struct drm_crtc *crtc)
  */
 void gma_crtc_restore(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc =  to_gma_crtc(crtc);
 	struct psb_intel_crtc_state *crtc_state = gma_crtc->crtc_state;
@@ -751,7 +751,7 @@ bool gma_find_best_pll(const struct gma_limit_t *limit,
 		       struct drm_crtc *crtc, int target, int refclk,
 		       struct gma_clock_t *best_clock)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	const struct gma_clock_funcs *clock_funcs =
 						to_gma_crtc(crtc)->clock_funcs;
 	struct gma_clock_t clock;
diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index de8ccfe9890f..d0629dc277af 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -84,7 +84,7 @@ static const struct gma_limit_t *mrst_limit(struct drm_crtc *crtc,
 					    int refclk)
 {
 	const struct gma_limit_t *limit = NULL;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 
 	if (gma_pipe_has_type(crtc, INTEL_OUTPUT_LVDS)
@@ -216,7 +216,7 @@ static bool mrst_lvds_find_best_pll(const struct gma_limit_t *limit,
  */
 static void oaktrail_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	int pipe = gma_crtc->pipe;
@@ -362,7 +362,7 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 			      int x, int y,
 			      struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	int pipe = gma_crtc->pipe;
@@ -592,7 +592,7 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 static int oaktrail_pipe_set_base(struct drm_crtc *crtc,
 			    int x, int y, struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	struct drm_framebuffer *fb = crtc->primary->fb;
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index c9d1ad4c0a27..e0ac4c88c762 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -266,7 +266,7 @@ int oaktrail_crtc_hdmi_mode_set(struct drm_crtc *crtc,
 			    int x, int y,
 			    struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct oaktrail_hdmi_dev *hdmi_dev = dev_priv->hdmi_priv;
 	int pipe = 1;
@@ -382,7 +382,7 @@ int oaktrail_crtc_hdmi_mode_set(struct drm_crtc *crtc,
 
 void oaktrail_crtc_hdmi_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	u32 temp;
 
 	DRM_DEBUG_KMS("%s %d\n", __func__, mode);
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index ff46e88c4768..41472e51a16d 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -96,7 +96,7 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
 			       int x, int y,
 			       struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
 	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 343c51250207..23fb075ab487 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -370,7 +370,7 @@ void gma_irq_uninstall(struct drm_device *dev)
 
 int gma_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	unsigned long irqflags;
@@ -403,7 +403,7 @@ int gma_crtc_enable_vblank(struct drm_crtc *crtc)
 
 void gma_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	unsigned long irqflags;
@@ -427,7 +427,7 @@ void gma_crtc_disable_vblank(struct drm_crtc *crtc)
  */
 u32 gma_crtc_get_vblank_counter(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	uint32_t high_frame = PIPEAFRAMEHIGH;
 	uint32_t low_frame = PIPEAFRAMEPIXEL;
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index d2f199ea3c11..a87997c2c043 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -444,7 +444,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 		   struct drm_plane_state *new_plane_state,
 		   struct drm_crtc_state *new_crtc_state)
 {
-	struct gud_device *gdrm = to_gud_device(pipe->crtc.dev);
+	struct gud_device *gdrm = to_gud_device(pipe->crtc.drm);
 	struct drm_plane_state *old_plane_state = pipe->plane.state;
 	const struct drm_display_mode *mode = &new_crtc_state->mode;
 	struct drm_atomic_state *state = new_plane_state->state;
@@ -489,7 +489,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (!connector_state) {
 		struct drm_connector_list_iter conn_iter;
 
-		drm_connector_list_iter_begin(pipe->crtc.dev, &conn_iter);
+		drm_connector_list_iter_begin(pipe->crtc.drm, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter) {
 			if (connector->state->crtc) {
 				connector_state = connector->state;
@@ -559,7 +559,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
 void gud_pipe_update(struct drm_simple_display_pipe *pipe,
 		     struct drm_plane_state *old_state)
 {
-	struct drm_device *drm = pipe->crtc.dev;
+	struct drm_device *drm = pipe->crtc.drm;
 	struct gud_device *gdrm = to_gud_device(drm);
 	struct drm_plane_state *state = pipe->plane.state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 89bed78f1466..42b54119c57b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -159,7 +159,7 @@ static const struct drm_plane_helper_funcs hibmc_plane_helper_funcs = {
 
 static void hibmc_crtc_dpms(struct drm_crtc *crtc, u32 dpms)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm);
 	u32 reg;
 
 	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
@@ -175,7 +175,7 @@ static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	u32 reg;
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm);
 
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
 
@@ -194,7 +194,7 @@ static void hibmc_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
 	u32 reg;
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm);
 
 	hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_OFF);
 	drm_crtc_vblank_off(crtc);
@@ -361,7 +361,7 @@ static void hibmc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	u32 val;
 	struct drm_display_mode *mode = &crtc->state->mode;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 	u32 width = mode->hsync_end - mode->hsync_start;
 	u32 height = mode->vsync_end - mode->vsync_start;
@@ -395,7 +395,7 @@ static void hibmc_crtc_atomic_begin(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
 	u32 reg;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
 
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
@@ -417,16 +417,16 @@ static void hibmc_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm->event_lock, flags);
 	if (crtc->state->event)
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 	crtc->state->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 }
 
 static int hibmc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm);
 
 	writel(HIBMC_RAW_INTERRUPT_EN_VBLANK(1),
 	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
@@ -436,7 +436,7 @@ static int hibmc_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void hibmc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm);
 
 	writel(HIBMC_RAW_INTERRUPT_EN_VBLANK(0),
 	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
@@ -444,7 +444,7 @@ static void hibmc_crtc_disable_vblank(struct drm_crtc *crtc)
 
 static void hibmc_crtc_load_lut(struct drm_crtc *crtc)
 {
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(crtc->drm);
 	void __iomem   *mmio = priv->mmio;
 	u16 *r, *g, *b;
 	u32 reg;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 871f79a6b17e..53f8ab3bc58a 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -516,12 +516,12 @@ static void ade_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index c61f811b74f5..3b614baf835f 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -102,7 +102,7 @@ static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_plane_state *plane_state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
+	struct hyperv_drm_device *hv = to_hv(pipe->crtc.drm);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	hyperv_hide_hw_ptr(hv->hdev);
@@ -117,7 +117,7 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
 			     struct drm_plane_state *plane_state,
 			     struct drm_crtc_state *crtc_state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
+	struct hyperv_drm_device *hv = to_hv(pipe->crtc.drm);
 	struct drm_framebuffer *fb = plane_state->fb;
 
 	if (fb->format->format != DRM_FORMAT_XRGB8888)
@@ -135,7 +135,7 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
 static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_state)
 {
-	struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
+	struct hyperv_drm_device *hv = to_hv(pipe->crtc.drm);
 	struct drm_plane_state *state = pipe->plane.state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index 112d91d81fdc..85ad8466bc81 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -191,7 +191,7 @@ static void ilk_edp_pll_on(struct intel_dp *intel_dp,
 			   const struct intel_crtc_state *pipe_config)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	assert_transcoder_disabled(dev_priv, pipe_config->cpu_transcoder);
 	assert_dp_port_disabled(intel_dp);
@@ -231,7 +231,7 @@ static void ilk_edp_pll_off(struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	assert_transcoder_disabled(dev_priv, old_crtc_state->cpu_transcoder);
 	assert_dp_port_disabled(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
index b052dfa21690..9e8f5e6d5766 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.c
+++ b/drivers/gpu/drm/i915/display/hsw_ips.c
@@ -13,7 +13,7 @@
 static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	u32 val;
 
 	if (!crtc_state->ips_enabled)
@@ -60,7 +60,7 @@ static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 bool hsw_ips_disable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	bool need_vblank_wait = false;
 
 	if (!crtc_state->ips_enabled)
@@ -180,13 +180,13 @@ void hsw_ips_post_update(struct intel_atomic_state *state,
 /* IPS only exists on ULT machines and is tied to pipe A. */
 bool hsw_crtc_supports_ips(struct intel_crtc *crtc)
 {
-	return HAS_IPS(to_i915(crtc->base.dev)) && crtc->pipe == PIPE_A;
+	return HAS_IPS(to_i915(crtc->base.drm)) && crtc->pipe == PIPE_A;
 }
 
 bool hsw_crtc_state_ips_capable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	/* IPS only exists on ULT machines and is tied to pipe A. */
 	if (!hsw_crtc_supports_ips(crtc))
@@ -257,7 +257,7 @@ int hsw_ips_compute_config(struct intel_atomic_state *state,
 void hsw_ips_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (!hsw_crtc_supports_ips(crtc))
 		return;
@@ -277,7 +277,7 @@ void hsw_ips_get_config(struct intel_crtc_state *crtc_state)
 static int hsw_ips_debugfs_false_color_get(void *data, u64 *val)
 {
 	struct intel_crtc *crtc = data;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	*val = i915->display.ips.false_color;
 
@@ -287,7 +287,7 @@ static int hsw_ips_debugfs_false_color_get(void *data, u64 *val)
 static int hsw_ips_debugfs_false_color_set(void *data, u64 val)
 {
 	struct intel_crtc *crtc = data;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state;
 	int ret;
 
@@ -322,7 +322,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(hsw_ips_debugfs_false_color_fops,
 static int hsw_ips_debugfs_status_show(struct seq_file *m, void *unused)
 {
 	struct intel_crtc *crtc = m->private;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	intel_wakeref_t wakeref;
 
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index b10488324457..d43430c4d539 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -352,7 +352,7 @@ i9xx_plane_check(struct intel_crtc_state *crtc_state,
 static u32 i9xx_plane_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 dspcntr = 0;
 
 	if (crtc_state->gamma_enable)
@@ -975,7 +975,7 @@ void
 i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 			      struct intel_initial_plane_config *plane_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 51a896bbebc4..876ce49a3c75 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -262,7 +262,7 @@ static const int pessimal_latency_ns = 5000;
 static void vlv_get_fifo_size(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct vlv_fifo_state *fifo_state = &crtc_state->wm.vlv.fifo_state;
 	enum pipe pipe = crtc->pipe;
 	int sprite0_start, sprite1_start;
@@ -929,7 +929,7 @@ static u16 g4x_compute_wm(const struct intel_crtc_state *crtc_state,
 static bool g4x_raw_plane_wm_set(struct intel_crtc_state *crtc_state,
 				 int level, enum plane_id plane_id, u16 value)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	bool dirty = false;
 
 	for (; level < dev_priv->display.wm.num_levels; level++) {
@@ -945,7 +945,7 @@ static bool g4x_raw_plane_wm_set(struct intel_crtc_state *crtc_state,
 static bool g4x_raw_fbc_wm_set(struct intel_crtc_state *crtc_state,
 			       int level, u16 value)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	bool dirty = false;
 
 	/* NORMAL level doesn't have an FBC watermark */
@@ -969,7 +969,7 @@ static bool g4x_raw_plane_wm_compute(struct intel_crtc_state *crtc_state,
 				     const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	enum plane_id plane_id = plane->id;
 	bool dirty = false;
 	int level;
@@ -1049,7 +1049,7 @@ static bool g4x_raw_plane_wm_is_valid(const struct intel_crtc_state *crtc_state,
 static bool g4x_raw_crtc_wm_is_valid(const struct intel_crtc_state *crtc_state,
 				     int level)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (level >= dev_priv->display.wm.num_levels)
 		return false;
@@ -1193,7 +1193,7 @@ static int g4x_compute_pipe_wm(struct intel_atomic_state *state,
 static int g4x_compute_intermediate_wm(struct intel_atomic_state *state,
 				       struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_crtc_state *old_crtc_state =
@@ -1340,7 +1340,7 @@ static void g4x_program_watermarks(struct drm_i915_private *dev_priv)
 static void g4x_initial_watermarks(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -1353,7 +1353,7 @@ static void g4x_initial_watermarks(struct intel_atomic_state *state,
 static void g4x_optimize_watermarks(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -1443,7 +1443,7 @@ static bool vlv_need_sprite0_fifo_workaround(unsigned int active_planes)
 static int vlv_compute_fifo(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct g4x_pipe_wm *raw =
 		&crtc_state->wm.vlv.raw[VLV_WM_LEVEL_PM2];
 	struct vlv_fifo_state *fifo_state = &crtc_state->wm.vlv.fifo_state;
@@ -1527,7 +1527,7 @@ static int vlv_compute_fifo(struct intel_crtc_state *crtc_state)
 static void vlv_invalidate_wms(struct intel_crtc *crtc,
 			       struct vlv_wm_state *wm_state, int level)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	for (; level < dev_priv->display.wm.num_levels; level++) {
 		enum plane_id plane_id;
@@ -1555,7 +1555,7 @@ static u16 vlv_invert_wm_value(u16 wm, u16 fifo_size)
 static bool vlv_raw_plane_wm_set(struct intel_crtc_state *crtc_state,
 				 int level, enum plane_id plane_id, u16 value)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	bool dirty = false;
 
 	for (; level < dev_priv->display.wm.num_levels; level++) {
@@ -1572,7 +1572,7 @@ static bool vlv_raw_plane_wm_compute(struct intel_crtc_state *crtc_state,
 				     const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	enum plane_id plane_id = plane->id;
 	int level;
 	bool dirty = false;
@@ -1631,7 +1631,7 @@ static bool vlv_raw_crtc_wm_is_valid(const struct intel_crtc_state *crtc_state,
 static int _vlv_compute_pipe_wm(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct vlv_wm_state *wm_state = &crtc_state->wm.vlv.optimal;
 	const struct vlv_fifo_state *fifo_state =
 		&crtc_state->wm.vlv.fifo_state;
@@ -1751,7 +1751,7 @@ static int vlv_compute_pipe_wm(struct intel_atomic_state *state,
 static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_uncore *uncore = &dev_priv->uncore;
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
@@ -1977,7 +1977,7 @@ static void vlv_program_watermarks(struct drm_i915_private *dev_priv)
 static void vlv_initial_watermarks(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -1990,7 +1990,7 @@ static void vlv_initial_watermarks(struct intel_atomic_state *state,
 static void vlv_optimize_watermarks(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -2862,7 +2862,7 @@ static int ilk_compute_pipe_wm(struct intel_atomic_state *state,
 static int ilk_compute_intermediate_wm(struct intel_atomic_state *state,
 				       struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_crtc_state *old_crtc_state =
@@ -3312,7 +3312,7 @@ static void ilk_program_watermarks(struct drm_i915_private *dev_priv)
 static void ilk_initial_watermarks(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -3325,7 +3325,7 @@ static void ilk_initial_watermarks(struct intel_atomic_state *state,
 static void ilk_optimize_watermarks(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -3340,7 +3340,7 @@ static void ilk_optimize_watermarks(struct intel_atomic_state *state,
 
 static void ilk_pipe_wm_get_hw_state(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct ilk_wm_values *hw = &dev_priv->display.wm.hw;
 	struct intel_crtc_state *crtc_state = to_intel_crtc_state(crtc->base.state);
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 74f2e2ed5c19..995ba2ed1e87 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -207,7 +207,7 @@ static int dsi_send_pkt_hdr(struct intel_dsi_host *host,
 void icl_dsi_frame_update(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 mode_flags;
 	enum port port;
 
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index fe573d1d520c..e5cac79cc211 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -303,7 +303,7 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
 {
 	struct intel_crtc_state *crtc_state = to_intel_crtc_state(state);
 
-	drm_WARN_ON(crtc->dev, crtc_state->dsb);
+	drm_WARN_ON(crtc->drm, crtc_state->dsb);
 
 	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
 	intel_crtc_free_hw_state(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 5f4ff7c19452..e66f45e25201 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -475,7 +475,7 @@ static int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_cr
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
 	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	bool mode_changed = intel_crtc_needs_modeset(new_crtc_state);
 	bool was_crtc_enabled = old_crtc_state->hw.active;
 	bool is_crtc_enabled = new_crtc_state->hw.active;
@@ -661,7 +661,7 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
 static struct intel_plane *
 intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_plane *plane;
 
 	for_each_intel_plane_on_crtc(&i915->drm, crtc, plane) {
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 3d9c9b4f27f8..82fb23692c15 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -252,7 +252,7 @@ static const struct hdmi_aud_ncts hdmi_aud_ncts_36bpp[] = {
 /* get AUD_CONFIG_PIXEL_CLOCK_HDMI_* value for mode */
 static u32 audio_config_hdmi_pixel_clock(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int i;
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index aee6d03eb322..7aa23b258e40 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -691,7 +691,7 @@ static unsigned int intel_bw_crtc_num_active_planes(const struct intel_crtc_stat
 static unsigned int intel_bw_crtc_data_rate(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	unsigned int data_rate = 0;
 	enum plane_id plane_id;
 
@@ -716,7 +716,7 @@ static unsigned int intel_bw_crtc_data_rate(const struct intel_crtc_state *crtc_
 static int intel_bw_crtc_min_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (DISPLAY_VER(i915) < 12)
 		return 0;
@@ -728,7 +728,7 @@ void intel_bw_crtc_update(struct intel_bw_state *bw_state,
 			  const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	bw_state->data_rate[crtc->pipe] =
 		intel_bw_crtc_data_rate(crtc_state);
@@ -1039,7 +1039,7 @@ static void skl_plane_calc_dbuf_bw(struct intel_bw_state *bw_state,
 				   const struct skl_ddb_entry *ddb,
 				   unsigned int data_rate)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_dbuf_bw *crtc_bw = &bw_state->dbuf_bw[crtc->pipe];
 	unsigned int dbuf_mask = skl_ddb_dbuf_slice_mask(i915, ddb);
 	enum dbuf_slice slice;
@@ -1058,7 +1058,7 @@ static void skl_crtc_calc_dbuf_bw(struct intel_bw_state *bw_state,
 				  const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_dbuf_bw *crtc_bw = &bw_state->dbuf_bw[crtc->pipe];
 	enum plane_id plane_id;
 
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 92a5cea8fa7f..110b0c0ac66b 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2503,7 +2503,7 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 
 static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	int pixel_rate = crtc_state->pixel_rate;
 
 	if (DISPLAY_VER(dev_priv) >= 10)
@@ -2522,7 +2522,7 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
 static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_plane *plane;
 	int min_cdclk = 0;
 
@@ -2535,7 +2535,7 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
 int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(crtc_state->uapi.crtc->dev);
+		to_i915(crtc_state->uapi.crtc->drm);
 	int min_cdclk;
 
 	if (!crtc_state->hw.enable)
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 8966e6560516..72b840e374e0 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -202,7 +202,7 @@ static u64 *ctm_mult_by_limited(u64 *result, const u64 *input)
 static void ilk_update_pipe_csc(struct intel_crtc *crtc,
 				const struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write_fw(i915, PIPE_CSC_PREOFF_HI(pipe), csc->preoff[0]);
@@ -235,7 +235,7 @@ static void ilk_update_pipe_csc(struct intel_crtc *crtc,
 static void ilk_read_pipe_csc(struct intel_crtc *crtc,
 			      struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -301,7 +301,7 @@ static void skl_read_csc(struct intel_crtc_state *crtc_state)
 static void icl_update_output_csc(struct intel_crtc *crtc,
 				  const struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write_fw(i915, PIPE_CSC_OUTPUT_PREOFF_HI(pipe), csc->preoff[0]);
@@ -331,7 +331,7 @@ static void icl_update_output_csc(struct intel_crtc *crtc,
 static void icl_read_output_csc(struct intel_crtc *crtc,
 				struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -380,7 +380,7 @@ static void icl_read_csc(struct intel_crtc_state *crtc_state)
 
 static bool ilk_limited_range(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	/* icl+ have dedicated output CSC */
 	if (DISPLAY_VER(i915) >= 11)
@@ -395,7 +395,7 @@ static bool ilk_limited_range(const struct intel_crtc_state *crtc_state)
 
 static bool ilk_lut_limited_range(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (!ilk_limited_range(crtc_state))
 		return false;
@@ -432,7 +432,7 @@ static void ilk_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
 				struct intel_csc_matrix *csc,
 				bool limited_color_range)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_color_ctm *ctm = crtc_state->hw.ctm->data;
 	const u64 *input;
 	u64 temp[9];
@@ -490,7 +490,7 @@ static void ilk_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
 
 static void ilk_assign_csc(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	bool limited_color_range = ilk_csc_limited_range(crtc_state);
 
 	if (crtc_state->hw.ctm) {
@@ -530,7 +530,7 @@ static void ilk_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 
 static void icl_assign_csc(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (crtc_state->hw.ctm) {
 		drm_WARN_ON(&i915->drm, (crtc_state->csc_mode & ICL_CSC_ENABLE) == 0);
@@ -608,7 +608,7 @@ static void vlv_wgc_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
 static void vlv_load_wgc_csc(struct intel_crtc *crtc,
 			     const struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write_fw(dev_priv, PIPE_WGC_C01_C00(pipe),
@@ -630,7 +630,7 @@ static void vlv_load_wgc_csc(struct intel_crtc *crtc,
 static void vlv_read_wgc_csc(struct intel_crtc *crtc,
 			     struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -666,7 +666,7 @@ static void vlv_read_csc(struct intel_crtc_state *crtc_state)
 
 static void vlv_assign_csc(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (crtc_state->hw.ctm) {
 		drm_WARN_ON(&i915->drm, !crtc_state->wgc_enable);
@@ -710,7 +710,7 @@ static const struct intel_csc_matrix chv_cgm_csc_matrix_identity = {
 static void chv_load_cgm_csc(struct intel_crtc *crtc,
 			     const struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write_fw(i915, CGM_PIPE_CSC_COEFF01(pipe),
@@ -728,7 +728,7 @@ static void chv_load_cgm_csc(struct intel_crtc *crtc,
 static void chv_read_cgm_csc(struct intel_crtc *crtc,
 			     struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -762,7 +762,7 @@ static void chv_read_csc(struct intel_crtc_state *crtc_state)
 
 static void chv_assign_csc(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	drm_WARN_ON(&i915->drm, crtc_state->wgc_enable);
 
@@ -992,7 +992,7 @@ static void i9xx_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void ilk_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	/* update TRANSCONF GAMMA_MODE */
 	ilk_set_pipeconf(crtc_state);
@@ -1004,7 +1004,7 @@ static void ilk_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void hsw_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	intel_de_write(i915, GAMMA_MODE(crtc->pipe),
 		       crtc_state->gamma_mode);
@@ -1016,7 +1016,7 @@ static void hsw_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void skl_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 val = 0;
 
@@ -1044,7 +1044,7 @@ static void skl_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void icl_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -1063,7 +1063,7 @@ static void icl_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void icl_color_post_update(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	/*
 	 * Despite Wa_1406463849, ICL CSC is no longer disarmed by
@@ -1154,7 +1154,7 @@ create_resized_lut(struct drm_i915_private *i915,
 static void i9xx_load_lut_8(struct intel_crtc *crtc,
 			    const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct drm_color_lut *lut;
 	enum pipe pipe = crtc->pipe;
 	int i;
@@ -1172,7 +1172,7 @@ static void i9xx_load_lut_8(struct intel_crtc *crtc,
 static void i9xx_load_lut_10(struct intel_crtc *crtc,
 			     const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1206,7 +1206,7 @@ static void i9xx_load_luts(const struct intel_crtc_state *crtc_state)
 static void i965_load_lut_10p6(struct intel_crtc *crtc,
 			       const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1244,7 +1244,7 @@ static void i965_load_luts(const struct intel_crtc_state *crtc_state)
 static void ilk_lut_write(const struct intel_crtc_state *crtc_state,
 			  i915_reg_t reg, u32 val)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (crtc_state->dsb)
 		intel_dsb_reg_write(crtc_state->dsb, reg, val);
@@ -1457,7 +1457,7 @@ static void glk_load_degamma_lut(const struct intel_crtc_state *crtc_state,
 				 const struct drm_property_blob *blob)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1699,7 +1699,7 @@ static void chv_cgm_degamma_pack(struct drm_color_lut *entry, u32 ldw, u32 udw)
 static void chv_load_cgm_degamma(struct intel_crtc *crtc,
 				 const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1733,7 +1733,7 @@ static void chv_cgm_gamma_pack(struct drm_color_lut *entry, u32 ldw, u32 udw)
 static void chv_load_cgm_gamma(struct intel_crtc *crtc,
 			       const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1749,7 +1749,7 @@ static void chv_load_cgm_gamma(struct intel_crtc *crtc,
 static void chv_load_luts(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	const struct drm_property_blob *pre_csc_lut = crtc_state->pre_csc_lut;
 	const struct drm_property_blob *post_csc_lut = crtc_state->post_csc_lut;
 
@@ -1770,14 +1770,14 @@ static void chv_load_luts(const struct intel_crtc_state *crtc_state)
 
 void intel_color_load_luts(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	i915->display.funcs.color->load_luts(crtc_state);
 }
 
 void intel_color_commit_noarm(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (i915->display.funcs.color->color_commit_noarm)
 		i915->display.funcs.color->color_commit_noarm(crtc_state);
@@ -1785,14 +1785,14 @@ void intel_color_commit_noarm(const struct intel_crtc_state *crtc_state)
 
 void intel_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	i915->display.funcs.color->color_commit_arm(crtc_state);
 }
 
 void intel_color_post_update(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (i915->display.funcs.color->color_post_update)
 		i915->display.funcs.color->color_post_update(crtc_state);
@@ -1865,14 +1865,14 @@ static bool chv_can_preload_luts(const struct intel_crtc_state *new_crtc_state)
 
 int intel_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	return i915->display.funcs.color->color_check(crtc_state);
 }
 
 void intel_color_get_config(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	i915->display.funcs.color->read_luts(crtc_state);
 
@@ -1885,7 +1885,7 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   const struct drm_property_blob *blob2,
 			   bool is_pre_csc_lut)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	/*
 	 * FIXME c8_planes readout missing thus
@@ -1917,7 +1917,7 @@ static int
 intel_color_add_affected_planes(struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(new_crtc_state->uapi.state);
 	const struct intel_crtc_state *old_crtc_state =
@@ -1956,7 +1956,7 @@ intel_color_add_affected_planes(struct intel_crtc_state *new_crtc_state)
 
 static u32 intel_gamma_lut_tests(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
 
 	if (lut_is_legacy(gamma_lut))
@@ -1967,14 +1967,14 @@ static u32 intel_gamma_lut_tests(const struct intel_crtc_state *crtc_state)
 
 static u32 intel_degamma_lut_tests(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	return DISPLAY_INFO(i915)->color.degamma_lut_tests;
 }
 
 static int intel_gamma_lut_size(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
 
 	if (lut_is_legacy(gamma_lut))
@@ -1985,7 +1985,7 @@ static int intel_gamma_lut_size(const struct intel_crtc_state *crtc_state)
 
 static u32 intel_degamma_lut_size(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	return DISPLAY_INFO(i915)->color.degamma_lut_size;
 }
@@ -2010,7 +2010,7 @@ static int check_lut_size(const struct drm_property_blob *lut, int expected)
 static int _check_luts(const struct intel_crtc_state *crtc_state,
 		       u32 degamma_tests, u32 gamma_tests)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
 	const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
 	int gamma_length, degamma_length;
@@ -2078,7 +2078,7 @@ static int i9xx_check_lut_10(struct drm_i915_private *dev_priv,
 
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	/* make sure {pre,post}_csc_lut were correctly assigned */
 	if (DISPLAY_VER(i915) >= 11 || HAS_GMCH(i915)) {
@@ -2116,7 +2116,7 @@ static void intel_assign_luts(struct intel_crtc_state *crtc_state)
 
 static int i9xx_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	int ret;
 
 	ret = check_luts(crtc_state);
@@ -2292,7 +2292,7 @@ static u32 ilk_csc_mode(const struct intel_crtc_state *crtc_state)
 
 static int ilk_assign_luts(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (ilk_lut_limited_range(crtc_state)) {
 		struct drm_property_blob *gamma_lut;
@@ -2330,7 +2330,7 @@ static int ilk_assign_luts(struct intel_crtc_state *crtc_state)
 
 static int ilk_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	int ret;
 
 	ret = check_luts(crtc_state);
@@ -2399,7 +2399,7 @@ static u32 ivb_csc_mode(const struct intel_crtc_state *crtc_state)
 
 static int ivb_assign_luts(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct drm_property_blob *degamma_lut, *gamma_lut;
 
 	if (crtc_state->gamma_mode != GAMMA_MODE_MODE_SPLIT)
@@ -2431,7 +2431,7 @@ static int ivb_assign_luts(struct intel_crtc_state *crtc_state)
 
 static int ivb_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	int ret;
 
 	ret = check_luts(crtc_state);
@@ -2499,7 +2499,7 @@ static bool glk_use_pre_csc_lut_for_gamma(const struct intel_crtc_state *crtc_st
 
 static int glk_assign_luts(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (glk_use_pre_csc_lut_for_gamma(crtc_state)) {
 		struct drm_property_blob *gamma_lut;
@@ -2562,7 +2562,7 @@ static int glk_check_luts(const struct intel_crtc_state *crtc_state)
 
 static int glk_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	int ret;
 
 	ret = glk_check_luts(crtc_state);
@@ -2617,7 +2617,7 @@ static int glk_color_check(struct intel_crtc_state *crtc_state)
 static u32 icl_gamma_mode(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	u32 gamma_mode = 0;
 
 	if (crtc_state->hw.degamma_lut)
@@ -3013,7 +3013,7 @@ static bool icl_lut_equal(const struct intel_crtc_state *crtc_state,
 
 static struct drm_property_blob *i9xx_read_lut_8(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
 	struct drm_color_lut *lut;
@@ -3038,7 +3038,7 @@ static struct drm_property_blob *i9xx_read_lut_8(struct intel_crtc *crtc)
 
 static struct drm_property_blob *i9xx_read_lut_10(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 lut_size = DISPLAY_INFO(dev_priv)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3087,7 +3087,7 @@ static void i9xx_read_luts(struct intel_crtc_state *crtc_state)
 
 static struct drm_property_blob *i965_read_lut_10p6(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	int i, lut_size = DISPLAY_INFO(dev_priv)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3137,7 +3137,7 @@ static void i965_read_luts(struct intel_crtc_state *crtc_state)
 
 static struct drm_property_blob *chv_read_cgm_degamma(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	int i, lut_size = DISPLAY_INFO(dev_priv)->color.degamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3163,7 +3163,7 @@ static struct drm_property_blob *chv_read_cgm_degamma(struct intel_crtc *crtc)
 
 static struct drm_property_blob *chv_read_cgm_gamma(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	int i, lut_size = DISPLAY_INFO(i915)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3202,7 +3202,7 @@ static void chv_read_luts(struct intel_crtc_state *crtc_state)
 
 static struct drm_property_blob *ilk_read_lut_8(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
 	struct drm_color_lut *lut;
@@ -3227,7 +3227,7 @@ static struct drm_property_blob *ilk_read_lut_8(struct intel_crtc *crtc)
 
 static struct drm_property_blob *ilk_read_lut_10(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	int i, lut_size = DISPLAY_INFO(i915)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3281,7 +3281,7 @@ static void ilk_read_luts(struct intel_crtc_state *crtc_state)
 static struct drm_property_blob *ivb_read_lut_10(struct intel_crtc *crtc,
 						 u32 prec_index)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	int i, lut_size = ivb_lut_10_size(prec_index);
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3346,7 +3346,7 @@ static void ivb_read_luts(struct intel_crtc_state *crtc_state)
 static struct drm_property_blob *bdw_read_lut_10(struct intel_crtc *crtc,
 						 u32 prec_index)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	int i, lut_size = ivb_lut_10_size(prec_index);
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3411,7 +3411,7 @@ static void bdw_read_luts(struct intel_crtc_state *crtc_state)
 
 static struct drm_property_blob *glk_read_degamma_lut(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	int i, lut_size = DISPLAY_INFO(dev_priv)->color.degamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3476,7 +3476,7 @@ static void glk_read_luts(struct intel_crtc_state *crtc_state)
 static struct drm_property_blob *
 icl_read_lut_multi_segment(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	int i, lut_size = DISPLAY_INFO(i915)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3658,7 +3658,7 @@ static const struct intel_color_funcs ilk_color_funcs = {
 
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	int degamma_lut_size, gamma_lut_size;
 	bool has_ctm;
 
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 182c6dd64f47..5540e5d2853a 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -35,7 +35,7 @@
 
 static void assert_vblank_disabled(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc->drm);
 
 	if (I915_STATE_WARN(i915, drm_crtc_vblank_get(crtc) == 0,
 			    "[CRTC:%d:%s] vblank assertion failure (expected off, current on)\n",
@@ -77,7 +77,7 @@ void intel_wait_for_vblank_if_active(struct drm_i915_private *i915,
 
 u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_vblank_crtc *vblank = &dev->vblank[drm_crtc_index(&crtc->base)];
 
 	if (!crtc->active)
@@ -91,7 +91,7 @@ u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc)
 
 u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 
 	/*
 	 * From Gen 11, In case of dsi cmd mode, frame counter wouldnt
@@ -409,10 +409,10 @@ static void intel_crtc_vblank_work(struct kthread_work *base)
 	intel_color_load_luts(crtc_state);
 
 	if (crtc_state->uapi.event) {
-		spin_lock_irq(&crtc->base.dev->event_lock);
+		spin_lock_irq(&crtc->base.drm->event_lock);
 		drm_crtc_send_vblank_event(&crtc->base, crtc_state->uapi.event);
 		crtc_state->uapi.event = NULL;
-		spin_unlock_irq(&crtc->base.dev->event_lock);
+		spin_unlock_irq(&crtc->base.drm->event_lock);
 	}
 
 	trace_intel_crtc_vblank_work_end(crtc);
@@ -483,7 +483,7 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
 void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct drm_display_mode *adjusted_mode = &new_crtc_state->hw.adjusted_mode;
 	long timeout = msecs_to_jiffies_timeout(1);
 	int scanline, min, max, vblank_start;
@@ -617,7 +617,7 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end)
 		crtc->debug.vbl.max = delta;
 
 	if (delta > 1000 * VBLANK_EVASION_TIME_US) {
-		drm_dbg_kms(crtc->base.dev,
+		drm_dbg_kms(crtc->base.drm,
 			    "Atomic update on pipe (%c) took %lld us, max time under evasion is %u us\n",
 			    pipe_name(crtc->pipe),
 			    div_u64(delta, 1000),
@@ -644,7 +644,7 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 	int scanline_end = intel_get_crtc_scanline(crtc);
 	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
 	ktime_t end_vbl_time = ktime_get();
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	intel_psr_unlock(new_crtc_state);
 
@@ -673,10 +673,10 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 		drm_WARN_ON(&dev_priv->drm,
 			    drm_crtc_vblank_get(&crtc->base) != 0);
 
-		spin_lock(&crtc->base.dev->event_lock);
+		spin_lock(&crtc->base.drm->event_lock);
 		drm_crtc_arm_vblank_event(&crtc->base,
 					  new_crtc_state->uapi.event);
-		spin_unlock(&crtc->base.dev->event_lock);
+		spin_unlock(&crtc->base.drm->event_lock);
 
 		new_crtc_state->uapi.event = NULL;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 8d4640d0fd34..b3eb7c38acd9 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -31,7 +31,7 @@ intel_dump_m_n_config(const struct intel_crtc_state *pipe_config,
 		      const char *id, unsigned int lane_count,
 		      const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *i915 = to_i915(pipe_config->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(pipe_config->uapi.crtc->drm);
 
 	drm_dbg_kms(&i915->drm,
 		    "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u, link_n: %u, tu: %u\n",
@@ -202,7 +202,7 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   const char *context)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	const struct intel_plane_state *plane_state;
 	struct intel_plane *plane;
 	char buf[64];
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index b342fad180ca..b095fd85717f 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -333,7 +333,7 @@ i9xx_cursor_max_stride(struct intel_plane *plane,
 static u32 i9xx_cursor_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 cntl = 0;
 
 	if (DISPLAY_VER(dev_priv) >= 11)
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 7ada98354b17..26955a3efb3e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -383,7 +383,7 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 			  const struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 temp;
 
@@ -472,7 +472,7 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 				      const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum port port = encoder->port;
@@ -583,7 +583,7 @@ void intel_ddi_enable_transcoder_func(struct intel_encoder *encoder,
 				      const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (DISPLAY_VER(dev_priv) >= 11) {
@@ -616,7 +616,7 @@ intel_ddi_config_transcoder_func(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 ctl;
 
@@ -628,7 +628,7 @@ intel_ddi_config_transcoder_func(struct intel_encoder *encoder,
 void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 ctl;
 
@@ -638,7 +638,7 @@ void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state
 
 	ctl = intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder));
 
-	drm_WARN_ON(crtc->base.dev, ctl & TRANS_DDI_HDCP_SIGNALLING);
+	drm_WARN_ON(crtc->base.drm, ctl & TRANS_DDI_HDCP_SIGNALLING);
 
 	ctl &= ~TRANS_DDI_FUNC_ENABLE;
 
@@ -977,7 +977,7 @@ void intel_ddi_enable_transcoder_clock(struct intel_encoder *encoder,
 				       const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 	u32 val;
@@ -997,7 +997,7 @@ void intel_ddi_enable_transcoder_clock(struct intel_encoder *encoder,
 
 void intel_ddi_disable_transcoder_clock(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val;
 
@@ -2276,7 +2276,7 @@ static void intel_ddi_mso_get_config(struct intel_encoder *encoder,
 				     struct intel_crtc_state *pipe_config)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 dss1;
 
@@ -2313,7 +2313,7 @@ static void intel_ddi_mso_get_config(struct intel_encoder *encoder,
 static void intel_ddi_mso_configure(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 dss1 = 0;
 
@@ -2766,7 +2766,7 @@ static void intel_ddi_pre_enable(struct intel_atomic_state *state,
 				 const struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -3617,7 +3617,7 @@ static enum transcoder bdw_transcoder_master_readout(struct drm_i915_private *de
 
 static void bdw_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	u32 transcoders = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
 	enum transcoder cpu_transcoder;
@@ -4125,7 +4125,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 {
 	struct drm_connector *connector;
 	const struct drm_connector_state *conn_state;
-	struct drm_i915_private *dev_priv = to_i915(ref_crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(ref_crtc_state->uapi.crtc->drm);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(ref_crtc_state->uapi.state);
 	u8 transcoders = 0;
@@ -4293,7 +4293,7 @@ static int modeset_pipe(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm);
 	if (!state)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0a9774eaf9f1..5d381ca03aa2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -275,7 +275,7 @@ static int intel_bigjoiner_num_pipes(const struct intel_crtc_state *crtc_state)
 
 struct intel_crtc *intel_master_crtc(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (intel_crtc_is_bigjoiner_slave(crtc_state))
 		return intel_crtc_for_pipe(i915, bigjoiner_master_pipe(crtc_state));
@@ -287,7 +287,7 @@ static void
 intel_wait_for_pipe_off(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	if (DISPLAY_VER(dev_priv) >= 4) {
 		enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
@@ -348,7 +348,7 @@ static void assert_plane(struct intel_plane *plane, bool state)
 
 static void assert_planes_disabled(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_plane *plane;
 
 	for_each_intel_plane_on_crtc(&dev_priv->drm, crtc, plane)
@@ -393,7 +393,7 @@ void vlv_wait_port_ready(struct drm_i915_private *dev_priv,
 void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -454,7 +454,7 @@ void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
 void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -613,7 +613,7 @@ void intel_set_plane_visible(struct intel_crtc_state *crtc_state,
 
 void intel_plane_fixup_bitmasks(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	struct drm_plane *plane;
 
 	/*
@@ -634,7 +634,7 @@ void intel_plane_fixup_bitmasks(struct intel_crtc_state *crtc_state)
 void intel_plane_disable_noatomic(struct intel_crtc *crtc,
 				  struct intel_plane *plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_plane_state *plane_state =
@@ -697,7 +697,7 @@ intel_plane_fence_y_offset(const struct intel_plane_state *plane_state)
 static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -793,7 +793,7 @@ intel_get_crtc_new_encoder(const struct intel_atomic_state *state,
 static void ilk_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct drm_rect *dst = &crtc_state->pch_pfit.dst;
 	enum pipe pipe = crtc->pipe;
 	int width = drm_rect_width(dst);
@@ -832,7 +832,7 @@ static void intel_crtc_dpms_overlay_disable(struct intel_crtc *crtc)
 
 static bool needs_nv12_wa(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (!crtc_state->nv12_planes)
 		return false;
@@ -846,7 +846,7 @@ static bool needs_nv12_wa(const struct intel_crtc_state *crtc_state)
 
 static bool needs_scalerclk_wa(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 
 	/* Wa_2006604312:icl,ehl */
 	if (crtc_state->scaler_state.scaler_users > 0 && DISPLAY_VER(dev_priv) == 11)
@@ -857,7 +857,7 @@ static bool needs_scalerclk_wa(const struct intel_crtc_state *crtc_state)
 
 static bool needs_cursorclk_wa(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 
 	/* Wa_1604331009:icl,jsl,ehl */
 	if (is_hdr_mode(crtc_state) &&
@@ -889,7 +889,7 @@ static void intel_async_flip_vtd_wa(struct drm_i915_private *i915,
 
 static bool needs_async_flip_vtd_wa(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	return crtc_state->uapi.async_flip && i915_vtd_active(i915) &&
 		(DISPLAY_VER(i915) == 9 || IS_BROADWELL(i915) || IS_HASWELL(i915));
@@ -1146,7 +1146,7 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 static void intel_crtc_disable_planes(struct intel_atomic_state *state,
 				      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	unsigned int update_mask = new_crtc_state->update_planes;
@@ -1382,7 +1382,7 @@ static void ilk_crtc_enable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
@@ -1472,7 +1472,7 @@ static void glk_pipe_scaler_clock_gating_wa(struct drm_i915_private *dev_priv,
 static void hsw_set_linetime_wm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	intel_de_write(dev_priv, WM_LINETIME(crtc->pipe),
 		       HSW_LINETIME(crtc_state->linetime) |
@@ -1482,7 +1482,7 @@ static void hsw_set_linetime_wm(const struct intel_crtc_state *crtc_state)
 static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder transcoder = crtc_state->cpu_transcoder;
 	i915_reg_t reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(transcoder) :
 			 CHICKEN_TRANS(transcoder);
@@ -1513,7 +1513,7 @@ static void icl_ddi_bigjoiner_pre_enable(struct intel_atomic_state *state,
 static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (crtc_state->has_pch_encoder) {
@@ -1544,7 +1544,7 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe, hsw_workaround_pipe;
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	bool psl_clkgate_wa;
@@ -1635,7 +1635,7 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	/* To avoid upsetting the power well on haswell only disable the pfit if
@@ -1653,7 +1653,7 @@ static void ilk_crtc_disable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -1691,7 +1691,7 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	/*
 	 * FIXME collapse everything to one hook.
@@ -1720,7 +1720,7 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 static void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	if (!crtc_state->gmch_pfit.control)
 		return;
@@ -1834,7 +1834,7 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 				   struct intel_power_domain_mask *mask)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	struct drm_encoder *encoder;
 	enum pipe pipe = crtc->pipe;
@@ -1871,7 +1871,7 @@ void intel_modeset_get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 					  struct intel_power_domain_mask *old_domains)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum intel_display_power_domain domain;
 	struct intel_power_domain_mask domains, new_domains;
 
@@ -1895,7 +1895,7 @@ void intel_modeset_get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 void intel_modeset_put_crtc_power_domains(struct intel_crtc *crtc,
 					  struct intel_power_domain_mask *domains)
 {
-	intel_display_power_put_mask_in_set(to_i915(crtc->base.dev),
+	intel_display_power_put_mask_in_set(to_i915(crtc->base.drm),
 					    &crtc->enabled_power_domains,
 					    domains);
 }
@@ -1922,7 +1922,7 @@ static void valleyview_crtc_enable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
@@ -1973,7 +1973,7 @@ static void i9xx_crtc_enable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
@@ -2016,7 +2016,7 @@ static void i9xx_crtc_enable(struct intel_atomic_state *state,
 static void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	if (!old_crtc_state->gmch_pfit.control)
 		return;
@@ -2033,7 +2033,7 @@ static void i9xx_crtc_disable(struct intel_atomic_state *state,
 {
 	struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -2085,7 +2085,7 @@ void intel_encoder_destroy(struct drm_encoder *encoder)
 
 static bool intel_crtc_supports_double_wide(const struct intel_crtc *crtc)
 {
-	const struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	const struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	/* GDG double wide on either pipe, otherwise pipe A only */
 	return DISPLAY_VER(dev_priv) < 4 &&
@@ -2136,7 +2136,7 @@ static void intel_mode_from_crtc_timings(struct drm_display_mode *mode,
 
 static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (HAS_GMCH(dev_priv))
 		/* FIXME calculate proper pipe pixel rate for GMCH pfit */
@@ -2250,7 +2250,7 @@ static void intel_bigjoiner_compute_pipe_src(struct intel_crtc_state *crtc_state
 static int intel_crtc_compute_pipe_src(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	intel_bigjoiner_compute_pipe_src(crtc_state);
 
@@ -2283,7 +2283,7 @@ static int intel_crtc_compute_pipe_src(struct intel_crtc_state *crtc_state)
 static int intel_crtc_compute_pipe_mode(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	struct drm_display_mode *pipe_mode = &crtc_state->hw.pipe_mode;
 	int clock_limit = i915->max_dotclk_freq;
@@ -2462,7 +2462,7 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	if (DISPLAY_VER(dev_priv) >= 5)
@@ -2479,7 +2479,7 @@ void intel_cpu_transcoder_set_m2_n2(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	if (!intel_cpu_transcoder_has_m2_n2(dev_priv, transcoder))
 		return;
@@ -2492,7 +2492,7 @@ void intel_cpu_transcoder_set_m2_n2(struct intel_crtc *crtc,
 static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
@@ -2573,7 +2573,7 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	int width = drm_rect_width(&crtc_state->pipe_src);
 	int height = drm_rect_height(&crtc_state->pipe_src);
 	enum pipe pipe = crtc->pipe;
@@ -2587,7 +2587,7 @@ static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state)
 
 static bool intel_pipe_is_interlaced(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (DISPLAY_VER(dev_priv) == 2)
@@ -2603,7 +2603,7 @@ static bool intel_pipe_is_interlaced(const struct intel_crtc_state *crtc_state)
 static void intel_get_transcoder_timings(struct intel_crtc *crtc,
 					 struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
@@ -2669,7 +2669,7 @@ static void intel_bigjoiner_adjust_pipe_src(struct intel_crtc_state *crtc_state)
 static void intel_get_pipe_src_size(struct intel_crtc *crtc,
 				    struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 tmp;
 
@@ -2685,7 +2685,7 @@ static void intel_get_pipe_src_size(struct intel_crtc *crtc,
 void i9xx_set_pipeconf(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val = 0;
 
@@ -2762,7 +2762,7 @@ static bool i9xx_has_pfit(struct drm_i915_private *dev_priv)
 static void i9xx_get_pfit_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe;
 	u32 tmp;
 
@@ -2790,7 +2790,7 @@ static void i9xx_get_pfit_config(struct intel_crtc_state *crtc_state)
 static void vlv_crtc_clock_get(struct intel_crtc *crtc,
 			       struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	struct dpll clock;
@@ -2817,7 +2817,7 @@ static void vlv_crtc_clock_get(struct intel_crtc *crtc,
 static void chv_crtc_clock_get(struct intel_crtc *crtc,
 			       struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	enum dpio_channel port = vlv_pipe_to_channel(pipe);
@@ -2851,7 +2851,7 @@ static void chv_crtc_clock_get(struct intel_crtc *crtc,
 static enum intel_output_format
 bdw_get_pipe_misc_output_format(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 tmp;
 
 	tmp = intel_de_read(dev_priv, PIPE_MISC(crtc->pipe));
@@ -2873,7 +2873,7 @@ static void i9xx_get_pipe_color_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 	u32 tmp;
 
@@ -2890,7 +2890,7 @@ static void i9xx_get_pipe_color_config(struct intel_crtc_state *crtc_state)
 static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 				 struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
 	u32 tmp;
@@ -3019,7 +3019,7 @@ static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 void ilk_set_pipeconf(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val = 0;
 
@@ -3083,7 +3083,7 @@ void ilk_set_pipeconf(const struct intel_crtc_state *crtc_state)
 static void hsw_set_transconf(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val = 0;
 
@@ -3113,7 +3113,7 @@ static void hsw_set_transconf(const struct intel_crtc_state *crtc_state)
 static void bdw_set_pipe_misc(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 val = 0;
 
 	switch (crtc_state->pipe_bpp) {
@@ -3158,7 +3158,7 @@ static void bdw_set_pipe_misc(const struct intel_crtc_state *crtc_state)
 
 int bdw_get_pipe_misc_bpp(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 tmp;
 
 	tmp = intel_de_read(dev_priv, PIPE_MISC(crtc->pipe));
@@ -3217,7 +3217,7 @@ void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	if (DISPLAY_VER(dev_priv) >= 5)
@@ -3234,7 +3234,7 @@ void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	if (!intel_cpu_transcoder_has_m2_n2(dev_priv, transcoder))
 		return;
@@ -3247,7 +3247,7 @@ void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc,
 static void ilk_get_pfit_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 ctl, pos, size;
 	enum pipe pipe;
 
@@ -3282,7 +3282,7 @@ static void ilk_get_pfit_config(struct intel_crtc_state *crtc_state)
 static bool ilk_get_pipe_config(struct intel_crtc *crtc,
 				struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
@@ -3482,7 +3482,7 @@ static u8 hsw_panel_transcoders(struct drm_i915_private *i915)
 
 static u8 hsw_enabled_transcoders(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u8 panel_transcoder_mask = hsw_panel_transcoders(dev_priv);
 	enum transcoder cpu_transcoder;
@@ -3586,7 +3586,7 @@ static bool hsw_get_transcoder_state(struct intel_crtc *crtc,
 				     struct intel_crtc_state *pipe_config,
 				     struct intel_display_power_domain_set *power_domain_set)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	unsigned long enabled_transcoders;
 	u32 tmp;
@@ -3624,7 +3624,7 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 					 struct intel_crtc_state *pipe_config,
 					 struct intel_display_power_domain_set *power_domain_set)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum transcoder cpu_transcoder;
 	enum port port;
@@ -3669,7 +3669,7 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 static void intel_bigjoiner_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	u8 master_pipes, slave_pipes;
 	enum pipe pipe = crtc->pipe;
 
@@ -3686,7 +3686,7 @@ static void intel_bigjoiner_get_config(struct intel_crtc_state *crtc_state)
 static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 				struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	bool active;
 	u32 tmp;
 
@@ -3799,7 +3799,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 bool intel_crtc_get_pipe_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (!i915->display.funcs.display->get_pipe_config(crtc, crtc_state))
 		return false;
@@ -3831,7 +3831,7 @@ static int i9xx_pll_refclk(struct drm_device *dev,
 void i9xx_crtc_clock_get(struct intel_crtc *crtc,
 			 struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 dpll = pipe_config->dpll_hw_state.dpll;
 	u32 fp;
@@ -4061,7 +4061,7 @@ static int icl_add_linked_planes(struct intel_atomic_state *state)
 static int icl_check_nv12_planes(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_atomic_state *state = to_intel_atomic_state(crtc_state->uapi.state);
 	struct intel_plane *plane, *linked;
 	struct intel_plane_state *plane_state;
@@ -4208,7 +4208,7 @@ static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
 static u16 skl_linetime_wm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct drm_display_mode *pipe_mode =
 		&crtc_state->hw.pipe_mode;
 	int linetime_wm;
@@ -4230,7 +4230,7 @@ static u16 skl_linetime_wm(const struct intel_crtc_state *crtc_state)
 static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_cdclk_state *cdclk_state;
@@ -4256,7 +4256,7 @@ static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	int ret;
@@ -4343,7 +4343,7 @@ compute_sink_pipe_bpp(const struct drm_connector_state *conn_state,
 		      struct intel_crtc_state *crtc_state)
 {
 	struct drm_connector *connector = conn_state->connector;
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_display_info *info = &connector->display_info;
 	int bpp;
 
@@ -4384,7 +4384,7 @@ static int
 compute_baseline_pipe_bpp(struct intel_atomic_state *state,
 			  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_connector *connector;
@@ -4601,7 +4601,7 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
 {
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *saved_state;
 
 	saved_state = intel_crtc_state_alloc(crtc);
@@ -4640,7 +4640,7 @@ static int
 intel_modeset_pipe_config(struct intel_atomic_state *state,
 			  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_connector *connector;
@@ -4960,7 +4960,7 @@ static void __printf(4, 5)
 pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 		     const char *name, const char *format, ...)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct va_format vaf;
 	va_list args;
 
@@ -5001,7 +5001,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 			  const struct intel_crtc_state *pipe_config,
 			  bool fastset)
 {
-	struct drm_i915_private *dev_priv = to_i915(current_config->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(current_config->uapi.crtc->drm);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	bool ret = true;
 	bool fixup_inherited = fastset &&
@@ -5559,7 +5559,7 @@ static int intel_modeset_checks(struct intel_atomic_state *state)
 static void intel_crtc_check_fastset(const struct intel_crtc_state *old_crtc_state,
 				     struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(old_crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(old_crtc_state->uapi.crtc->drm);
 
 	if (!intel_pipe_config_compare(old_crtc_state, new_crtc_state, true)) {
 		drm_dbg_kms(&i915->drm, "fastset requirement not met, forcing full modeset\n");
@@ -5721,7 +5721,7 @@ static int intel_atomic_check_crtcs(struct intel_atomic_state *state)
 	int i;
 
 	for_each_new_intel_crtc_in_state(state, crtc, crtc_state, i) {
-		struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+		struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 		int ret;
 
 		ret = intel_crtc_atomic_check(state, crtc);
@@ -6427,7 +6427,7 @@ static int intel_atomic_prepare_commit(struct intel_atomic_state *state)
 void intel_crtc_arm_fifo_underrun(struct intel_crtc *crtc,
 				  struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	if (DISPLAY_VER(dev_priv) != 2 || crtc_state->active_planes)
 		intel_set_cpu_fifo_underrun_reporting(dev_priv, crtc->pipe, true);
@@ -6444,7 +6444,7 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 			       const struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	/*
 	 * Update pipe size and adjust fitter if needed: the reason for this is
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index ae2578741dfe..f5b127a58d12 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1177,7 +1177,7 @@ void gen11_display_irq_handler(struct drm_i915_private *i915)
  */
 int i8xx_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 
@@ -1190,7 +1190,7 @@ int i8xx_enable_vblank(struct drm_crtc *crtc)
 
 int i915gm_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 
 	/*
 	 * Vblank interrupts fail to wake the device up from C2+.
@@ -1206,7 +1206,7 @@ int i915gm_enable_vblank(struct drm_crtc *crtc)
 
 int i965_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 
@@ -1220,7 +1220,7 @@ int i965_enable_vblank(struct drm_crtc *crtc)
 
 int ilk_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 	u32 bit = DISPLAY_VER(dev_priv) >= 7 ?
@@ -1242,7 +1242,7 @@ int ilk_enable_vblank(struct drm_crtc *crtc)
 static bool gen11_dsi_configure_te(struct intel_crtc *intel_crtc,
 				   bool enable)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.drm);
 	enum port port;
 
 	if (!(intel_crtc->mode_flags &
@@ -1266,7 +1266,7 @@ static bool gen11_dsi_configure_te(struct intel_crtc *intel_crtc,
 int bdw_enable_vblank(struct drm_crtc *_crtc)
 {
 	struct intel_crtc *crtc = to_intel_crtc(_crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	unsigned long irqflags;
 
@@ -1291,7 +1291,7 @@ int bdw_enable_vblank(struct drm_crtc *_crtc)
  */
 void i8xx_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 
@@ -1302,7 +1302,7 @@ void i8xx_disable_vblank(struct drm_crtc *crtc)
 
 void i915gm_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 
 	i8xx_disable_vblank(crtc);
 
@@ -1312,7 +1312,7 @@ void i915gm_disable_vblank(struct drm_crtc *crtc)
 
 void i965_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 
@@ -1324,7 +1324,7 @@ void i965_disable_vblank(struct drm_crtc *crtc)
 
 void ilk_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 	u32 bit = DISPLAY_VER(dev_priv) >= 7 ?
@@ -1338,7 +1338,7 @@ void ilk_disable_vblank(struct drm_crtc *crtc)
 void bdw_disable_vblank(struct drm_crtc *_crtc)
 {
 	struct intel_crtc *crtc = to_intel_crtc(_crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	unsigned long irqflags;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
index 918d0327169a..9d01d6542e14 100644
--- a/drivers/gpu/drm/i915/display/intel_display_rps.c
+++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
@@ -48,7 +48,7 @@ void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
 	if (!dma_fence_is_i915(fence))
 		return;
 
-	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
+	if (DISPLAY_VER(to_i915(crtc->drm)) < 6)
 		return;
 
 	if (drm_crtc_vblank_get(crtc))
diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 99bdb833591c..dd5008dcf2fb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -19,7 +19,7 @@
 #include "intel_vblank.h"
 
 #define __dev_name_i915(i915) dev_name((i915)->drm.dev)
-#define __dev_name_kms(obj) dev_name((obj)->base.dev->dev)
+#define __dev_name_kms(obj) dev_name((obj)->base.drm->dev)
 
 TRACE_EVENT(intel_pipe_enable,
 	    TP_PROTO(struct intel_crtc *crtc),
@@ -32,7 +32,7 @@ TRACE_EVENT(intel_pipe_enable,
 			     __field(enum pipe, pipe)
 			     ),
 	    TP_fast_assign(
-			   struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+			   struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 			   struct intel_crtc *it__;
 			   __assign_str(dev, __dev_name_kms(crtc));
 			   for_each_intel_crtc(&dev_priv->drm, it__) {
@@ -61,7 +61,7 @@ TRACE_EVENT(intel_pipe_disable,
 			     ),
 
 	    TP_fast_assign(
-			   struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+			   struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 			   struct intel_crtc *it__;
 			   __assign_str(dev, __dev_name_kms(crtc));
 			   for_each_intel_crtc(&dev_priv->drm, it__) {
@@ -308,6 +308,9 @@ TRACE_EVENT(vlv_fifo_size,
 		      __entry->sprite0_start, __entry->sprite1_start, __entry->fifo_size)
 );
 
+#undef __dev_name_kms
+#define __dev_name_kms(obj) dev_name((obj)->base.dev->dev)
+
 TRACE_EVENT(intel_plane_update_noarm,
 	    TP_PROTO(struct intel_plane *plane, struct intel_crtc *crtc),
 	    TP_ARGS(plane, crtc),
@@ -476,6 +479,9 @@ TRACE_EVENT(intel_fbc_nuke,
 		      __entry->frame, __entry->scanline)
 );
 
+#undef __dev_name_kms
+#define __dev_name_kms(obj) dev_name((obj)->base.drm->dev)
+
 TRACE_EVENT(intel_crtc_vblank_work_start,
 	    TP_PROTO(struct intel_crtc *crtc),
 	    TP_ARGS(crtc),
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd561603ee1..79d0e99a9a76 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1935,7 +1935,7 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 					     struct drm_dp_vsc_sdp *vsc)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	/*
 	 * Prepare VSC Header for SU as per DP 1.4 spec, Table 2-118
diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index b0fb96717932..8db5d959cb18 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -408,7 +408,7 @@ i9xx_select_p2_div(const struct intel_limit *limit,
 		   const struct intel_crtc_state *crtc_state,
 		   int target)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS)) {
 		/*
@@ -444,7 +444,7 @@ i9xx_find_best_dpll(const struct intel_limit *limit,
 		    const struct dpll *match_clock,
 		    struct dpll *best_clock)
 {
-	struct drm_device *dev = crtc_state->uapi.crtc->dev;
+	struct drm_device *dev = crtc_state->uapi.crtc->drm;
 	struct dpll clock;
 	int err = target;
 
@@ -502,7 +502,7 @@ pnv_find_best_dpll(const struct intel_limit *limit,
 		   const struct dpll *match_clock,
 		   struct dpll *best_clock)
 {
-	struct drm_device *dev = crtc_state->uapi.crtc->dev;
+	struct drm_device *dev = crtc_state->uapi.crtc->drm;
 	struct dpll clock;
 	int err = target;
 
@@ -558,7 +558,7 @@ g4x_find_best_dpll(const struct intel_limit *limit,
 		   const struct dpll *match_clock,
 		   struct dpll *best_clock)
 {
-	struct drm_device *dev = crtc_state->uapi.crtc->dev;
+	struct drm_device *dev = crtc_state->uapi.crtc->drm;
 	struct dpll clock;
 	int max_n;
 	bool found = false;
@@ -653,7 +653,7 @@ vlv_find_best_dpll(const struct intel_limit *limit,
 		   struct dpll *best_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct dpll clock;
 	unsigned int bestppm = 1000000;
 	/* min update 19.2 MHz */
@@ -711,7 +711,7 @@ chv_find_best_dpll(const struct intel_limit *limit,
 		   struct dpll *best_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	unsigned int best_error_ppm;
 	struct dpll clock;
 	u64 m2;
@@ -788,7 +788,7 @@ static void i9xx_update_pll_dividers(struct intel_crtc_state *crtc_state,
 				     const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 fp, fp2;
 
 	if (IS_PINEVIEW(dev_priv)) {
@@ -808,7 +808,7 @@ static void i9xx_compute_dpll(struct intel_crtc_state *crtc_state,
 			      const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 dpll;
 
 	i9xx_update_pll_dividers(crtc_state, clock, reduced_clock);
@@ -887,7 +887,7 @@ static void i8xx_compute_dpll(struct intel_crtc_state *crtc_state,
 			      const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 dpll;
 
 	i9xx_update_pll_dividers(crtc_state, clock, reduced_clock);
@@ -1032,7 +1032,7 @@ static void ilk_update_pll_dividers(struct intel_crtc_state *crtc_state,
 				    const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 fp, fp2;
 	int factor;
 
@@ -1065,7 +1065,7 @@ static void ilk_compute_dpll(struct intel_crtc_state *crtc_state,
 			     const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 dpll;
 
 	ilk_update_pll_dividers(crtc_state, clock, reduced_clock);
@@ -1581,7 +1581,7 @@ static bool i9xx_has_pps(struct drm_i915_private *dev_priv)
 void i9xx_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 dpll = crtc_state->dpll_hw_state.dpll;
 	enum pipe pipe = crtc->pipe;
 	int i;
@@ -1659,7 +1659,7 @@ static void vlv_pllb_recal_opamp(struct drm_i915_private *dev_priv,
 static void vlv_prepare_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 mdiv;
 	u32 bestn, bestm1, bestm2, bestp1, bestp2;
@@ -1749,7 +1749,7 @@ static void vlv_prepare_pll(const struct intel_crtc_state *crtc_state)
 static void _vlv_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write(dev_priv, DPLL(pipe), crtc_state->dpll_hw_state.dpll);
@@ -1763,7 +1763,7 @@ static void _vlv_enable_pll(const struct intel_crtc_state *crtc_state)
 void vlv_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	assert_transcoder_disabled(dev_priv, crtc_state->cpu_transcoder);
@@ -1789,7 +1789,7 @@ void vlv_enable_pll(const struct intel_crtc_state *crtc_state)
 static void chv_prepare_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	enum dpio_channel port = vlv_pipe_to_channel(pipe);
 	u32 loopfilter, tribuf_calcntr;
@@ -1883,7 +1883,7 @@ static void chv_prepare_pll(const struct intel_crtc_state *crtc_state)
 static void _chv_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	enum dpio_channel port = vlv_pipe_to_channel(pipe);
 	u32 tmp;
@@ -1913,7 +1913,7 @@ static void _chv_enable_pll(const struct intel_crtc_state *crtc_state)
 void chv_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	assert_transcoder_disabled(dev_priv, crtc_state->cpu_transcoder);
@@ -2040,7 +2040,7 @@ void chv_disable_pll(struct drm_i915_private *dev_priv, enum pipe pipe)
 void i9xx_disable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	/* Don't disable pipe or pipe PLLs if needed */
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index ef039b1b34eb..ca96d98ac285 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -220,7 +220,7 @@ intel_tc_pll_enable_reg(struct drm_i915_private *i915,
 void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	unsigned int pipe_mask = BIT(crtc->pipe);
 	unsigned int old_mask;
@@ -266,7 +266,7 @@ void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	unsigned int pipe_mask = BIT(crtc->pipe);
 
@@ -309,7 +309,7 @@ intel_find_shared_dpll(struct intel_atomic_state *state,
 		       const struct intel_dpll_hw_state *pll_state,
 		       unsigned long dpll_mask)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_shared_dpll *pll, *unused_pll = NULL;
 	struct intel_shared_dpll_state *shared_dpll;
 	enum intel_dpll_id i;
@@ -365,7 +365,7 @@ intel_reference_shared_dpll_crtc(const struct intel_crtc *crtc,
 				 const struct intel_shared_dpll *pll,
 				 struct intel_shared_dpll_state *shared_dpll_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	drm_WARN_ON(&i915->drm, (shared_dpll_state->pipe_mask & BIT(crtc->pipe)) != 0);
 
@@ -405,7 +405,7 @@ intel_unreference_shared_dpll_crtc(const struct intel_crtc *crtc,
 				   const struct intel_shared_dpll *pll,
 				   struct intel_shared_dpll_state *shared_dpll_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	drm_WARN_ON(&i915->drm, (shared_dpll_state->pipe_mask & BIT(crtc->pipe)) == 0);
 
@@ -556,7 +556,7 @@ static int ibx_get_dpll(struct intel_atomic_state *state,
 {
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_shared_dpll *pll;
 	enum intel_dpll_id i;
 
@@ -995,7 +995,7 @@ hsw_ddi_wrpll_get_dpll(struct intel_atomic_state *state,
 static int
 hsw_ddi_lcpll_compute_dpll(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	int clock = crtc_state->port_clock;
 
 	switch (clock / 2) {
@@ -1013,7 +1013,7 @@ hsw_ddi_lcpll_compute_dpll(struct intel_crtc_state *crtc_state)
 static struct intel_shared_dpll *
 hsw_ddi_lcpll_get_dpll(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	struct intel_shared_dpll *pll;
 	enum intel_dpll_id pll_id;
 	int clock = crtc_state->port_clock;
@@ -1072,7 +1072,7 @@ hsw_ddi_spll_compute_dpll(struct intel_atomic_state *state,
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
-	if (drm_WARN_ON(crtc->base.dev, crtc_state->port_clock / 2 != 135000))
+	if (drm_WARN_ON(crtc->base.drm, crtc_state->port_clock / 2 != 135000))
 		return -EINVAL;
 
 	crtc_state->dpll_hw_state.spll =
@@ -1699,7 +1699,7 @@ static int skl_ddi_wrpll_get_freq(struct drm_i915_private *i915,
 
 static int skl_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct skl_wrpll_params wrpll_params = {};
 	u32 ctrl1, cfgcr1, cfgcr2;
 	int ret;
@@ -2129,7 +2129,7 @@ static int
 bxt_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state,
 			  struct dpll *clk_div)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	/* Calculate HDMI div */
 	/*
@@ -2147,7 +2147,7 @@ bxt_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state,
 static void bxt_ddi_dp_pll_dividers(struct intel_crtc_state *crtc_state,
 				    struct dpll *clk_div)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	int i;
 
 	*clk_div = bxt_dp_clk_val[0];
@@ -2167,7 +2167,7 @@ static void bxt_ddi_dp_pll_dividers(struct intel_crtc_state *crtc_state,
 static int bxt_ddi_set_dpll_hw_state(struct intel_crtc_state *crtc_state,
 				     const struct dpll *clk_div)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct intel_dpll_hw_state *dpll_hw_state = &crtc_state->dpll_hw_state;
 	int clock = crtc_state->port_clock;
 	int vco = clk_div->vco;
@@ -2262,7 +2262,7 @@ bxt_ddi_dp_set_dpll_hw_state(struct intel_crtc_state *crtc_state)
 static int
 bxt_ddi_hdmi_set_dpll_hw_state(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct dpll clk_div = {};
 	int ret;
 
@@ -2299,7 +2299,7 @@ static int bxt_get_dpll(struct intel_atomic_state *state,
 {
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_shared_dpll *pll;
 	enum intel_dpll_id id;
 
@@ -2556,7 +2556,7 @@ static const struct skl_wrpll_params tgl_tbt_pll_24MHz_values = {
 static int icl_calc_dp_combo_pll(struct intel_crtc_state *crtc_state,
 				 struct skl_wrpll_params *pll_params)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	const struct icl_combo_pll_params *params =
 		dev_priv->display.dpll.ref_clks.nssc == 24000 ?
 		icl_dp_combo_pll_24MHz_values :
@@ -2578,7 +2578,7 @@ static int icl_calc_dp_combo_pll(struct intel_crtc_state *crtc_state,
 static int icl_calc_tbt_pll(struct intel_crtc_state *crtc_state,
 			    struct skl_wrpll_params *pll_params)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (DISPLAY_VER(dev_priv) >= 12) {
 		switch (dev_priv->display.dpll.ref_clks.nssc) {
@@ -2642,7 +2642,7 @@ static int
 icl_calc_wrpll(struct intel_crtc_state *crtc_state,
 	       struct skl_wrpll_params *wrpll_params)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	int ref_clock = icl_wrpll_ref_clock(i915);
 	u32 afe_clock = crtc_state->port_clock * 5;
 	u32 dco_min = 7998000;
@@ -2852,7 +2852,7 @@ static int icl_mg_pll_find_divisors(int clock_khz, bool is_dp, bool use_ssc,
 static int icl_calc_mg_pll_state(struct intel_crtc_state *crtc_state,
 				 struct intel_dpll_hw_state *pll_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	int refclk_khz = dev_priv->display.dpll.ref_clks.nssc;
 	int clock = crtc_state->port_clock;
 	u32 dco_khz, m1div, m2div_int, m2div_rem, m2div_frac;
@@ -3166,7 +3166,7 @@ static void icl_update_active_dpll(struct intel_atomic_state *state,
 static int icl_compute_combo_phy_dpll(struct intel_atomic_state *state,
 				      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct icl_port_dpll *port_dpll =
@@ -3198,7 +3198,7 @@ static int icl_get_combo_phy_dpll(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc,
 				  struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct icl_port_dpll *port_dpll =
@@ -4484,7 +4484,7 @@ void intel_shared_dpll_state_verify(struct intel_crtc *crtc,
 				    struct intel_crtc_state *old_crtc_state,
 				    struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	if (new_crtc_state->shared_dpll)
 		verify_single_dpll_state(dev_priv, new_crtc_state->shared_dpll,
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 7c5fddb203ba..b70dd87ab7fb 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -318,7 +318,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 
 void intel_dpt_configure(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (DISPLAY_VER(i915) == 14) {
 		enum pipe pipe = crtc->pipe;
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 0d35b6be5b6a..c74dd3f95c68 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -66,7 +66,7 @@ static void
 intel_drrs_set_refresh_rate_pipeconf(struct intel_crtc *crtc,
 				     enum drrs_refresh_rate refresh_rate)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc->drrs.cpu_transcoder;
 	u32 bit;
 
@@ -96,7 +96,7 @@ bool intel_drrs_is_active(struct intel_crtc *crtc)
 static void intel_drrs_set_state(struct intel_crtc *crtc,
 				 enum drrs_refresh_rate refresh_rate)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	if (refresh_rate == crtc->drrs.refresh_rate)
 		return;
@@ -111,7 +111,7 @@ static void intel_drrs_set_state(struct intel_crtc *crtc,
 
 static void intel_drrs_schedule_work(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	mod_delayed_work(i915->unordered_wq, &crtc->drrs.work, msecs_to_jiffies(1000));
 }
@@ -119,7 +119,7 @@ static void intel_drrs_schedule_work(struct intel_crtc *crtc)
 static unsigned int intel_drrs_frontbuffer_bits(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	unsigned int frontbuffer_bits;
 
 	frontbuffer_bits = INTEL_FRONTBUFFER_ALL_MASK(crtc->pipe);
@@ -334,7 +334,7 @@ DEFINE_SHOW_ATTRIBUTE(intel_drrs_debugfs_status);
 static int intel_drrs_debugfs_ctl_set(void *data, u64 val)
 {
 	struct intel_crtc *crtc = data;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state;
 	struct drm_crtc_commit *commit;
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index bed058d2c3ac..b99384437ea0 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -85,7 +85,7 @@ struct intel_dsb {
 static bool assert_dsb_has_room(struct intel_dsb *dsb)
 {
 	struct intel_crtc *crtc = dsb->crtc;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	/* each instruction is 2 dwords */
 	return !drm_WARN(&i915->drm, dsb->free_pos > dsb->size - 2,
@@ -229,7 +229,7 @@ void intel_dsb_finish(struct intel_dsb *dsb)
 void intel_dsb_commit(struct intel_dsb *dsb, bool wait_for_vblank)
 {
 	struct intel_crtc *crtc = dsb->crtc;
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 tail;
 
@@ -255,7 +255,7 @@ void intel_dsb_commit(struct intel_dsb *dsb, bool wait_for_vblank)
 void intel_dsb_wait(struct intel_dsb *dsb)
 {
 	struct intel_crtc *crtc = dsb->crtc;
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	if (wait_for(!is_dsb_busy(dev_priv, pipe, dsb->id), 1))
@@ -283,7 +283,7 @@ void intel_dsb_wait(struct intel_dsb *dsb)
 struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc,
 				    unsigned int max_cmds)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct drm_i915_gem_object *obj;
 	intel_wakeref_t wakeref;
 	struct intel_dsb *dsb;
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 3e43e15d50ce..851654891e19 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1486,7 +1486,7 @@ static void __intel_fbc_enable(struct intel_atomic_state *state,
  */
 void intel_fbc_disable(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_plane *plane;
 
 	for_each_intel_plane(&i915->drm, plane) {
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index e12b46a84fa1..1f89020787fc 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -114,7 +114,7 @@ void assert_fdi_rx_pll_disabled(struct drm_i915_private *i915, enum pipe pipe)
 void intel_fdi_link_train(struct intel_crtc *crtc,
 			  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	dev_priv->display.funcs.fdi->fdi_link_train(crtc, crtc_state);
 }
@@ -235,7 +235,7 @@ int intel_fdi_link_freq(struct drm_i915_private *i915,
 int ilk_fdi_compute_config(struct intel_crtc *crtc,
 			   struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *i915 = to_i915(dev);
 	const struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	int lane, link_bw, fdi_dotclock, ret;
@@ -310,7 +310,7 @@ static void cpt_set_fdi_bc_bifurcation(struct drm_i915_private *dev_priv, bool e
 static void ivb_update_fdi_bc_bifurcation(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	switch (crtc->pipe) {
 	case PIPE_A:
@@ -333,7 +333,7 @@ static void ivb_update_fdi_bc_bifurcation(const struct intel_crtc_state *crtc_st
 
 void intel_fdi_normal_train(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -375,7 +375,7 @@ void intel_fdi_normal_train(struct intel_crtc *crtc)
 static void ilk_fdi_link_train(struct intel_crtc *crtc,
 			       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -477,7 +477,7 @@ static const int snb_b_fdi_train_param[] = {
 static void gen6_fdi_link_train(struct intel_crtc *crtc,
 				const struct intel_crtc_state *crtc_state)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -613,7 +613,7 @@ static void gen6_fdi_link_train(struct intel_crtc *crtc,
 static void ivb_manual_fdi_link_train(struct intel_crtc *crtc,
 				      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -750,7 +750,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 			const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 temp, i, rx_ctl_val;
 	int n_entries;
 
@@ -891,7 +891,7 @@ void hsw_fdi_disable(struct intel_encoder *encoder)
 void ilk_fdi_pll_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
 	u32 temp;
@@ -925,7 +925,7 @@ void ilk_fdi_pll_enable(const struct intel_crtc_state *crtc_state)
 
 void ilk_fdi_pll_disable(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 
@@ -945,7 +945,7 @@ void ilk_fdi_pll_disable(struct intel_crtc *crtc)
 
 void ilk_fdi_disable(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
 	u32 temp;
diff --git a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
index 09a7fa6c0c37..c2f451b67f36 100644
--- a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
+++ b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
@@ -93,7 +93,7 @@ static bool cpt_can_enable_serr_int(struct drm_device *dev)
 
 static void i9xx_check_fifo_underruns(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	i915_reg_t reg = PIPESTAT(crtc->pipe);
 	u32 enable_mask;
 
@@ -147,7 +147,7 @@ static void ilk_set_fifo_underrun_reporting(struct drm_device *dev,
 
 static void ivb_check_fifo_underruns(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	u32 err_int = intel_de_read(dev_priv, GEN7_ERR_INT);
 
@@ -234,7 +234,7 @@ static void ibx_set_fifo_underrun_reporting(struct drm_device *dev,
 
 static void cpt_check_pch_fifo_underruns(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pch_transcoder = crtc->pipe;
 	u32 serr_int = intel_de_read(dev_priv, SERR_INT);
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index f2d0f223ffc3..2c819d1b191b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2053,7 +2053,7 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 static bool hdmi_bpc_possible(const struct intel_crtc_state *crtc_state, int bpc)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(crtc_state->uapi.crtc->dev);
+		to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index b8f43efb0ab5..508ca534ab04 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -35,7 +35,7 @@
 static void intel_crtc_disable_noatomic_begin(struct intel_crtc *crtc,
 					      struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_plane *plane;
@@ -140,7 +140,7 @@ static void reset_encoder_connector_state(struct intel_encoder *encoder)
 
 static void reset_crtc_encoder_state(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_encoder *encoder;
 
 	for_each_encoder_on_crtc(&i915->drm, &crtc->base, encoder) {
@@ -151,7 +151,7 @@ static void reset_crtc_encoder_state(struct intel_crtc *crtc)
 
 static void intel_crtc_disable_noatomic_complete(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_bw_state *bw_state =
 		to_intel_bw_state(i915->display.bw.obj.state);
 	struct intel_cdclk_state *cdclk_state =
@@ -221,7 +221,7 @@ static u8 get_transcoder_pipes(struct drm_i915_private *i915,
 static void get_portsync_pipes(struct intel_crtc *crtc,
 			       u8 *master_pipe_mask, u8 *slave_pipes_mask)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_crtc *master_crtc;
@@ -266,7 +266,7 @@ static u8 get_bigjoiner_slave_pipes(struct drm_i915_private *i915, u8 master_pip
 static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 					struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	u8 portsync_master_mask;
 	u8 portsync_slaves_mask;
 	u8 bigjoiner_slaves_mask;
@@ -331,7 +331,7 @@ static void intel_crtc_copy_hw_to_uapi_state(struct intel_crtc_state *crtc_state
 
 	crtc_state->uapi.enable = crtc_state->hw.enable;
 	crtc_state->uapi.active = crtc_state->hw.active;
-	drm_WARN_ON(crtc_state->uapi.crtc->dev,
+	drm_WARN_ON(crtc_state->uapi.crtc->drm,
 		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi, &crtc_state->hw.mode) < 0);
 
 	crtc_state->uapi.adjusted_mode = crtc_state->hw.adjusted_mode;
@@ -382,7 +382,7 @@ intel_sanitize_plane_mapping(struct drm_i915_private *i915)
 
 static bool intel_crtc_has_encoders(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct intel_encoder *encoder;
 
 	for_each_encoder_on_crtc(dev, &crtc->base, encoder)
@@ -393,7 +393,7 @@ static bool intel_crtc_has_encoders(struct intel_crtc *crtc)
 
 static bool intel_crtc_needs_link_reset(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct intel_encoder *encoder;
 
 	for_each_encoder_on_crtc(dev, &crtc->base, encoder) {
@@ -428,7 +428,7 @@ static struct intel_connector *intel_encoder_find_connector(struct intel_encoder
 static void intel_sanitize_fifo_underrun_reporting(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	/*
 	 * We start out with underrun reporting disabled on active
@@ -451,7 +451,7 @@ static void intel_sanitize_fifo_underrun_reporting(const struct intel_crtc_state
 static bool intel_sanitize_crtc(struct intel_crtc *crtc,
 				struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state = to_intel_crtc_state(crtc->base.state);
 	bool needs_link_reset;
 
@@ -538,7 +538,7 @@ static void intel_sanitize_all_crtcs(struct drm_i915_private *i915,
 
 static bool has_bogus_dpll_config(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	/*
 	 * Some SNB BIOSen (eg. ASUS K53SV) are known to misprogram
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index 418b8526a081..e9e87262c872 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -161,7 +161,7 @@ verify_crtc_state(struct intel_crtc *crtc,
 		  struct intel_crtc_state *old_crtc_state,
 		  struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_encoder *encoder;
 	struct intel_crtc_state *pipe_config = old_crtc_state;
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 172c78777130..486f9916e8f4 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -599,7 +599,7 @@ static int gmch_panel_fitting(struct intel_crtc_state *crtc_state,
 			      const struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 pfit_control = 0, pfit_pgm_ratios = 0, border = 0;
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
@@ -676,7 +676,7 @@ int intel_panel_fitting(struct intel_crtc_state *crtc_state,
 			const struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (HAS_GMCH(i915))
 		return gmch_panel_fitting(crtc_state, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_pch_display.c b/drivers/gpu/drm/i915/display/intel_pch_display.c
index 866786e6b32f..79e1183a3908 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_display.c
+++ b/drivers/gpu/drm/i915/display/intel_pch_display.c
@@ -26,7 +26,7 @@ bool intel_has_pch_trancoder(struct drm_i915_private *i915,
 
 enum pipe intel_crtc_pch_transcoder(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (HAS_PCH_LPT(i915))
 		return PIPE_A;
@@ -174,7 +174,7 @@ static void ibx_sanitize_pch_ports(struct drm_i915_private *dev_priv)
 static void intel_pch_transcoder_set_m1_n1(struct intel_crtc *crtc,
 					   const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_set_m_n(dev_priv, m_n,
@@ -185,7 +185,7 @@ static void intel_pch_transcoder_set_m1_n1(struct intel_crtc *crtc,
 static void intel_pch_transcoder_set_m2_n2(struct intel_crtc *crtc,
 					   const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_set_m_n(dev_priv, m_n,
@@ -196,7 +196,7 @@ static void intel_pch_transcoder_set_m2_n2(struct intel_crtc *crtc,
 void intel_pch_transcoder_get_m1_n1(struct intel_crtc *crtc,
 				    struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_get_m_n(dev_priv, m_n,
@@ -207,7 +207,7 @@ void intel_pch_transcoder_get_m1_n1(struct intel_crtc *crtc,
 void intel_pch_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	intel_get_m_n(dev_priv, m_n,
@@ -219,7 +219,7 @@ static void ilk_pch_transcoder_set_timings(const struct intel_crtc_state *crtc_s
 					   enum pipe pch_transcoder)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	intel_de_write(dev_priv, PCH_TRANS_HTOTAL(pch_transcoder),
@@ -242,7 +242,7 @@ static void ilk_pch_transcoder_set_timings(const struct intel_crtc_state *crtc_s
 static void ilk_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
 	u32 val, pipeconf_val;
@@ -308,7 +308,7 @@ static void ilk_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
 
 static void ilk_disable_pch_transcoder(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
 
@@ -357,7 +357,7 @@ void ilk_pch_pre_enable(struct intel_atomic_state *state,
 void ilk_pch_enable(struct intel_atomic_state *state,
 		    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	enum pipe pipe = crtc->pipe;
@@ -448,7 +448,7 @@ void ilk_pch_disable(struct intel_atomic_state *state,
 void ilk_pch_post_disable(struct intel_atomic_state *state,
 			  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	ilk_disable_pch_transcoder(crtc);
@@ -470,7 +470,7 @@ void ilk_pch_post_disable(struct intel_atomic_state *state,
 static void ilk_pch_clock_get(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	/* read out port_clock from the DPLL */
 	i9xx_crtc_clock_get(crtc, crtc_state);
@@ -488,7 +488,7 @@ static void ilk_pch_clock_get(struct intel_crtc_state *crtc_state)
 void ilk_pch_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_shared_dpll *pll;
 	enum pipe pipe = crtc->pipe;
 	enum intel_dpll_id pll_id;
@@ -539,7 +539,7 @@ void ilk_pch_get_config(struct intel_crtc_state *crtc_state)
 static void lpt_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val, pipeconf_val;
 
@@ -584,7 +584,7 @@ static void lpt_disable_pch_transcoder(struct drm_i915_private *dev_priv)
 void lpt_pch_enable(struct intel_atomic_state *state,
 		    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -601,7 +601,7 @@ void lpt_pch_enable(struct intel_atomic_state *state,
 void lpt_pch_disable(struct intel_atomic_state *state,
 		     struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	lpt_disable_pch_transcoder(dev_priv);
 
@@ -611,7 +611,7 @@ void lpt_pch_disable(struct intel_atomic_state *state,
 void lpt_pch_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 tmp;
 
 	if ((intel_de_read(dev_priv, LPT_TRANSCONF) & TRANS_ENABLE) == 0)
diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.c b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
index f4c09cc37a5e..5415241716b8 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_refclk.c
+++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
@@ -175,7 +175,7 @@ int lpt_iclkip(const struct intel_crtc_state *crtc_state)
 void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	int clock = crtc_state->hw.adjusted_mode.crtc_clock;
 	struct iclkip_params p;
 	u32 temp;
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 5a468ed6e26c..24593bfe6d31 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -278,7 +278,7 @@ static int ilk_pipe_crc_ctl_reg(enum intel_pipe_crc_source *source,
 static void
 intel_crtc_crc_setup_workarounds(struct intel_crtc *crtc, bool enable)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_state *pipe_config;
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
@@ -556,7 +556,7 @@ const char *const *intel_crtc_get_crc_sources(struct drm_crtc *crtc,
 int intel_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 				 size_t *values_cnt)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	enum intel_pipe_crc_source source;
 
 	if (display_crc_ctl_parse_source(source_name, &source) < 0) {
@@ -576,7 +576,7 @@ int intel_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 int intel_crtc_set_crc_source(struct drm_crtc *_crtc, const char *source_name)
 {
 	struct intel_crtc *crtc = to_intel_crtc(_crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
 	enum intel_display_power_domain power_domain;
 	enum intel_pipe_crc_source source;
@@ -629,7 +629,7 @@ int intel_crtc_set_crc_source(struct drm_crtc *_crtc, const char *source_name)
 
 void intel_crtc_enable_pipe_crc(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
 	enum pipe pipe = crtc->pipe;
 	u32 val = 0;
@@ -649,7 +649,7 @@ void intel_crtc_enable_pipe_crc(struct intel_crtc *crtc)
 
 void intel_crtc_disable_pipe_crc(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
 	enum pipe pipe = crtc->pipe;
 
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 736072a8b2b0..cc6b1c5e7fa9 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -163,7 +163,7 @@ static bool
 intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 			      struct intel_initial_plane_config *plane_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
 	struct drm_framebuffer *fb = &plane_config->fb->base;
@@ -211,7 +211,7 @@ static void
 intel_find_initial_plane_obj(struct intel_crtc *crtc,
 			     struct intel_initial_plane_config *plane_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_plane *plane =
 		to_intel_plane(crtc->base.primary);
@@ -303,7 +303,7 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 
 void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_initial_plane_config plane_config = {};
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 00b4d87e4d81..f91e4f2f926a 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1731,7 +1731,7 @@ void intel_psr2_program_plane_sel_fetch_noarm(struct intel_plane *plane,
 
 void intel_psr2_program_trans_man_trk_ctl(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	struct intel_encoder *encoder;
 
@@ -1756,7 +1756,7 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 				  struct drm_rect *clip, bool full_update)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 val = man_trk_ctl_enable_bit_get(dev_priv);
 
 	/* SF partial frame enable has to be set even on full update */
@@ -1775,7 +1775,7 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 		val |= ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(clip->y1);
 		val |= ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(clip->y2 - 1);
 	} else {
-		drm_WARN_ON(crtc_state->uapi.crtc->dev, clip->y1 % 4 || clip->y2 % 4);
+		drm_WARN_ON(crtc_state->uapi.crtc->drm, clip->y1 % 4 || clip->y2 % 4);
 
 		val |= PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(clip->y1 / 4 + 1);
 		val |= PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(clip->y2 / 4 + 1);
@@ -1807,7 +1807,7 @@ static void clip_area_update(struct drm_rect *overlap_damage_area,
 static void intel_psr2_sel_fetch_pipe_alignment(const struct intel_crtc_state *crtc_state,
 						struct drm_rect *pipe_clip)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	u16 y_alignment;
 
@@ -2164,7 +2164,7 @@ static int _psr1_ready_for_pipe_update_locked(struct intel_dp *intel_dp)
  */
 void intel_psr_wait_for_idle_locked(const struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(new_crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(new_crtc_state->uapi.crtc->drm);
 	struct intel_encoder *encoder;
 
 	if (!new_crtc_state->has_psr)
@@ -2750,7 +2750,7 @@ bool intel_psr_enabled(struct intel_dp *intel_dp)
  */
 void intel_psr_lock(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct intel_encoder *encoder;
 
 	if (!crtc_state->has_psr)
@@ -2773,7 +2773,7 @@ void intel_psr_lock(const struct intel_crtc_state *crtc_state)
  */
 void intel_psr_unlock(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct intel_encoder *encoder;
 
 	if (!crtc_state->has_psr)
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 92376afc503b..28d9f3654dfb 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1272,7 +1272,7 @@ intel_sdvo_get_preferred_input_mode(struct intel_sdvo *intel_sdvo,
 
 static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(pipe_config->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(pipe_config->uapi.crtc->drm);
 	unsigned dotclock = pipe_config->port_clock;
 	struct dpll *clock = &pipe_config->dpll;
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index f5659ebd08eb..5eed99dae178 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -65,7 +65,7 @@
  */
 u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	struct drm_vblank_crtc *vblank = &dev_priv->drm.vblank[drm_crtc_index(crtc)];
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
@@ -118,7 +118,7 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 
 u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm);
 	struct drm_vblank_crtc *vblank = &dev_priv->drm.vblank[drm_crtc_index(crtc)];
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 
@@ -130,9 +130,9 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
 
 static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct drm_vblank_crtc *vblank =
-		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+		&crtc->base.drm->vblank[drm_crtc_index(&crtc->base)];
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	u32 htotal = mode->crtc_htotal;
 	u32 clock = mode->crtc_clock;
@@ -178,7 +178,7 @@ static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
 static u32 __intel_get_crtc_scanline_from_timestamp(struct intel_crtc *crtc)
 {
 	struct drm_vblank_crtc *vblank =
-		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+		&crtc->base.drm->vblank[drm_crtc_index(&crtc->base)];
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	u32 vblank_start = mode->crtc_vblank_start;
 	u32 vtotal = mode->crtc_vtotal;
@@ -197,7 +197,7 @@ static u32 __intel_get_crtc_scanline_from_timestamp(struct intel_crtc *crtc)
  */
 static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	const struct drm_display_mode *mode;
 	struct drm_vblank_crtc *vblank;
@@ -207,7 +207,7 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 	if (!crtc->active)
 		return 0;
 
-	vblank = &crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+	vblank = &crtc->base.drm->vblank[drm_crtc_index(&crtc->base)];
 	mode = &vblank->hwmode;
 
 	if (crtc->mode_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
@@ -257,7 +257,7 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 				     ktime_t *stime, ktime_t *etime,
 				     const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = _crtc->dev;
+	struct drm_device *dev = _crtc->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc *crtc = to_intel_crtc(_crtc);
 	enum pipe pipe = crtc->pipe;
@@ -394,7 +394,7 @@ bool intel_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_error,
 
 int intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	unsigned long irqflags;
 	int position;
 
@@ -420,7 +420,7 @@ static bool pipe_scanline_is_moving(struct drm_i915_private *dev_priv,
 
 static void wait_for_pipe_scanline_moving(struct intel_crtc *crtc, bool state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	/* Wait for the display line to settle/start moving */
@@ -442,7 +442,7 @@ void intel_wait_for_pipe_scanline_moving(struct intel_crtc *crtc)
 
 static int intel_crtc_scanline_offset(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
 	/*
@@ -491,7 +491,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 				      bool vrr_enable)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	u8 mode_flags = crtc_state->mode_flags;
 	struct drm_display_mode adjusted_mode;
 	int vmax_vblank_start = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index bd9116d2cd76..695ec9fc6cb2 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -22,7 +22,7 @@
 bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 {
 	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!HAS_DSC(i915))
@@ -36,7 +36,7 @@ bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 
 static bool is_pipe_dsc(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (DISPLAY_VER(i915) >= 12)
 		return true;
@@ -153,7 +153,7 @@ static int intel_dsc_slice_dimensions_valid(struct intel_crtc_state *pipe_config
 int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
 	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
 	int err;
@@ -271,7 +271,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 enum intel_display_power_domain
 intel_dsc_power_domain(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -296,7 +296,7 @@ intel_dsc_power_domain(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
@@ -871,7 +871,7 @@ static i915_reg_t dss_ctl2_reg(struct intel_crtc *crtc, enum transcoder cpu_tran
 void intel_uncompressed_joiner_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 dss_ctl1_val = 0;
 
 	if (crtc_state->bigjoiner_pipes && !crtc_state->dsc.compression_enable) {
@@ -887,7 +887,7 @@ void intel_uncompressed_joiner_enable(const struct intel_crtc_state *crtc_state)
 void intel_dsc_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	u32 dss_ctl1_val = 0;
 	u32 dss_ctl2_val = 0;
 
@@ -913,7 +913,7 @@ void intel_dsc_enable(const struct intel_crtc_state *crtc_state)
 void intel_dsc_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 
 	/* Disable only if either of them is enabled */
 	if (old_crtc_state->dsc.compression_enable ||
@@ -926,7 +926,7 @@ void intel_dsc_disable(const struct intel_crtc_state *old_crtc_state)
 void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 6361667d0eb1..60722c452071 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -76,7 +76,7 @@ intel_vrr_check_modeset(struct intel_atomic_state *state)
 static int intel_vrr_vblank_exit_length(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (DISPLAY_VER(i915) >= 13)
 		return crtc_state->vrr.guardband;
@@ -101,7 +101,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 			 struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
@@ -156,7 +156,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 
 static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 
 	if (DISPLAY_VER(i915) >= 13)
 		return VRR_CTL_IGN_MAX_SHIFT | VRR_CTL_FLIP_LINE_EN |
@@ -169,7 +169,7 @@ static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
 
 void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	/*
@@ -194,7 +194,7 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!crtc_state->vrr.enable)
@@ -207,7 +207,7 @@ void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
 bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!crtc_state->vrr.enable)
@@ -218,7 +218,7 @@ bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state)
 
 void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!crtc_state->vrr.enable)
@@ -232,7 +232,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 
 	if (!old_crtc_state->vrr.enable)
@@ -247,7 +247,7 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 
 void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 trans_vrr_ctl;
 
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 1e7c97243fcf..0d6c26d4453d 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -108,7 +108,7 @@ skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 	struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
@@ -354,7 +354,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 				     struct intel_plane_state *plane_state,
 				     int *scaler_id)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.drm);
 	int j;
 	u32 mode;
 
@@ -707,7 +707,7 @@ static void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe
 void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	const struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
 	const struct drm_rect *dst = &crtc_state->pch_pfit.dst;
@@ -823,7 +823,7 @@ skl_program_plane_scaler(struct intel_plane *plane,
 
 static void skl_detach_scaler(struct intel_crtc *crtc, int id)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 
 	intel_de_write_fw(dev_priv, SKL_PS_CTRL(crtc->pipe, id), 0);
@@ -860,7 +860,7 @@ void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state)
 void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
 	int id = -1;
 	int i;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 6b01a0b68b97..f60e17d3e019 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -879,7 +879,7 @@ static u32 adlp_plane_ctl_arb_slots(const struct intel_plane_state *plane_state)
 
 static u32 skl_plane_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	u32 plane_ctl = 0;
 
 	if (DISPLAY_VER(dev_priv) >= 10)
@@ -939,7 +939,7 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 
 static u32 glk_plane_color_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm);
 	u32 plane_color_ctl = 0;
 
 	if (DISPLAY_VER(dev_priv) >= 11)
@@ -2389,7 +2389,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 			     struct intel_initial_plane_config *plane_config)
 {
 	struct intel_crtc_state *crtc_state = to_intel_crtc_state(crtc->base.state);
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
 	enum plane_id plane_id = plane->id;
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 2e56ddd408ea..ecbf118ed0b0 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -338,7 +338,7 @@ void intel_sagv_post_plane_update(struct intel_atomic_state *state)
 static bool skl_crtc_can_enable_sagv(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum plane_id plane_id;
 	int max_level = INT_MAX;
 
@@ -410,7 +410,7 @@ static bool tgl_crtc_can_enable_sagv(const struct intel_crtc_state *crtc_state)
 static bool intel_crtc_can_enable_sagv(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 
 	if (!i915->params.enable_sagv)
 		return false;
@@ -627,7 +627,7 @@ static void intel_crtc_dbuf_weights(const struct intel_dbuf_state *dbuf_state,
 static int
 skl_crtc_allocate_ddb(struct intel_atomic_state *state, struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	unsigned int weight_total, weight_start, weight_end;
 	const struct intel_dbuf_state *old_dbuf_state =
 		intel_atomic_get_old_dbuf_state(state);
@@ -736,7 +736,7 @@ skl_cursor_allocation(const struct intel_crtc_state *crtc_state,
 		      int num_active)
 {
 	struct intel_plane *plane = to_intel_plane(crtc_state->uapi.crtc->cursor);
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct skl_wm_level wm = {};
 	int ret, min_ddb_alloc = 0;
 	struct skl_wm_params wp;
@@ -801,7 +801,7 @@ static void skl_pipe_ddb_get_hw_state(struct intel_crtc *crtc,
 				      struct skl_ddb_entry *ddb,
 				      struct skl_ddb_entry *ddb_y)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum intel_display_power_domain power_domain;
 	enum pipe pipe = crtc->pipe;
 	intel_wakeref_t wakeref;
@@ -1329,7 +1329,7 @@ static u8 dg2_compute_dbuf_slices(enum pipe pipe, u8 active_pipes, bool join_mbu
 
 static u8 skl_compute_dbuf_slices(struct intel_crtc *crtc, u8 active_pipes, bool join_mbus)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 
 	if (IS_DG2(i915))
@@ -1362,7 +1362,7 @@ static u64
 skl_total_relative_data_rate(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum plane_id plane_id;
 	u64 data_rate = 0;
 
@@ -1488,7 +1488,7 @@ static int
 skl_crtc_allocate_plane_ddb(struct intel_atomic_state *state,
 			    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_dbuf_state *dbuf_state =
@@ -1699,7 +1699,7 @@ skl_wm_method2(u32 pixel_rate, u32 pipe_htotal, u32 latency,
 static uint_fixed_16_16_t
 intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	u32 pixel_rate;
 	u32 crtc_htotal;
 	uint_fixed_16_16_t linetime_us;
@@ -1726,7 +1726,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 		      int color_plane)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	u32 interm_pbpl;
 
 	/* only planar format has two planes */
@@ -1854,7 +1854,7 @@ static void skl_compute_plane_wm(const struct intel_crtc_state *crtc_state,
 				 const struct skl_wm_level *result_prev,
 				 struct skl_wm_level *result /* out */)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	uint_fixed_16_16_t method1, method2;
 	uint_fixed_16_16_t selected_result;
 	u32 blocks, lines, min_ddb_alloc = 0;
@@ -1986,7 +1986,7 @@ skl_compute_wm_levels(const struct intel_crtc_state *crtc_state,
 		      const struct skl_wm_params *wm_params,
 		      struct skl_wm_level *levels)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct skl_wm_level *result_prev = &levels[0];
 	int level;
 
@@ -2006,7 +2006,7 @@ static void tgl_compute_sagv_wm(const struct intel_crtc_state *crtc_state,
 				const struct skl_wm_params *wm_params,
 				struct skl_plane_wm *plane_wm)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm);
 	struct skl_wm_level *sagv_wm = &plane_wm->sagv.wm0;
 	struct skl_wm_level *levels = plane_wm->wm;
 	unsigned int latency = 0;
@@ -2088,7 +2088,7 @@ static int skl_build_plane_wm_single(struct intel_crtc_state *crtc_state,
 				     struct intel_plane *plane, int color_plane)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct skl_plane_wm *wm = &crtc_state->wm.skl.raw.planes[plane->id];
 	struct skl_wm_params wm_params;
 	int ret;
@@ -2239,7 +2239,7 @@ static int skl_max_wm_level_for_vblank(struct intel_crtc_state *crtc_state,
 				       int wm0_lines)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	int level;
 
 	for (level = i915->display.wm.num_levels - 1; level >= 0; level--) {
@@ -2264,7 +2264,7 @@ static int skl_max_wm_level_for_vblank(struct intel_crtc_state *crtc_state,
 static int skl_wm_check_vblank(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	int wm0_lines, level;
 
 	if (!crtc_state->hw.active)
@@ -2319,7 +2319,7 @@ static int skl_wm_check_vblank(struct intel_crtc_state *crtc_state)
 static int skl_build_pipe_wm(struct intel_atomic_state *state,
 			     struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *plane_state;
@@ -2512,7 +2512,7 @@ skl_ddb_add_affected_planes(const struct intel_crtc_state *old_crtc_state,
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(new_crtc_state->uapi.state);
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct intel_plane *plane;
 
 	for_each_intel_plane_on_crtc(&i915->drm, crtc, plane) {
@@ -2859,7 +2859,7 @@ static bool skl_plane_selected_wm_equals(struct intel_plane *plane,
 static int skl_wm_add_affected_planes(struct intel_atomic_state *state,
 				      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *new_crtc_state =
@@ -2944,7 +2944,7 @@ static void skl_wm_level_from_reg_val(u32 val, struct skl_wm_level *level)
 static void skl_pipe_wm_get_hw_state(struct intel_crtc *crtc,
 				     struct skl_pipe_wm *out)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	enum plane_id plane_id;
 	int level;
@@ -3135,7 +3135,7 @@ static void skl_wm_get_hw_state_and_sanitize(struct drm_i915_private *i915)
 void intel_wm_state_verify(struct intel_crtc *crtc,
 			   struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm);
 	struct skl_hw_state {
 		struct skl_ddb_entry ddb[I915_MAX_PLANES];
 		struct skl_ddb_entry ddb_y[I915_MAX_PLANES];
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 8067c814aa66..129e00578a28 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -737,7 +737,7 @@ static void intel_dsi_pre_enable(struct intel_atomic_state *state,
 {
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm);
 	enum pipe pipe = crtc->pipe;
 	enum port port;
 	bool glk_cold_boot = false;
diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
index 31267c00782f..5cff376df4ac 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
@@ -16,7 +16,7 @@ static int dcss_enable_vblank(struct drm_crtc *crtc)
 {
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = crtc->dev->dev_private;
+	struct dcss_dev *dcss = crtc->drm->dev_private;
 
 	dcss_dtg_vblank_irq_enable(dcss->dtg, true);
 
@@ -31,7 +31,7 @@ static void dcss_disable_vblank(struct drm_crtc *crtc)
 {
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm->dev_private;
 
 	disable_irq_nosync(dcss_crtc->irq);
 
@@ -63,15 +63,15 @@ static void dcss_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm->dev_private;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc));
 		drm_crtc_arm_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 
 	if (dcss_dtg_is_enabled(dcss->dtg))
 		dcss_ctxld_enable(dcss->ctxld);
@@ -84,7 +84,7 @@ static void dcss_crtc_atomic_enable(struct drm_crtc *crtc,
 									      crtc);
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm->dev_private;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_display_mode *old_mode = &old_crtc_state->adjusted_mode;
 	struct videomode vm;
@@ -120,18 +120,18 @@ static void dcss_crtc_atomic_disable(struct drm_crtc *crtc,
 									      crtc);
 	struct dcss_crtc *dcss_crtc = container_of(crtc, struct dcss_crtc,
 						   base);
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm->dev_private;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_display_mode *old_mode = &old_crtc_state->adjusted_mode;
 
 	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, false);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 
 	dcss_dtg_ctxld_kick_irq_enable(dcss->dtg, true);
 
@@ -168,7 +168,7 @@ static const struct drm_crtc_helper_funcs dcss_helper_funcs = {
 static irqreturn_t dcss_crtc_irq_handler(int irq, void *dev_id)
 {
 	struct dcss_crtc *dcss_crtc = dev_id;
-	struct dcss_dev *dcss = dcss_crtc->base.dev->dev_private;
+	struct dcss_dev *dcss = dcss_crtc->base.drm->dev_private;
 
 	if (!dcss_dtg_vblank_irq_valid(dcss->dtg))
 		return IRQ_NONE;
diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 5f26090b0c98..d196abb42659 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -99,12 +99,12 @@ static void ipu_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event && !crtc->state->active) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static void imx_drm_crtc_reset(struct drm_crtc *crtc)
@@ -192,11 +192,11 @@ static irqreturn_t ipu_irq_handler(int irq, void *dev_id)
 		}
 
 		if (i == ARRAY_SIZE(ipu_crtc->plane)) {
-			spin_lock_irqsave(&crtc->dev->event_lock, flags);
+			spin_lock_irqsave(&crtc->drm->event_lock, flags);
 			drm_crtc_send_vblank_event(crtc, ipu_crtc->event);
 			ipu_crtc->event = NULL;
 			drm_crtc_vblank_put(crtc);
-			spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 		}
 	}
 
@@ -247,7 +247,7 @@ static void ipu_crtc_atomic_begin(struct drm_crtc *crtc,
 static void ipu_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		struct ipu_crtc *ipu_crtc = to_ipu_crtc(crtc);
 
@@ -255,12 +255,12 @@ static void ipu_crtc_atomic_flush(struct drm_crtc *crtc,
 		ipu_crtc->event = crtc->state->event;
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 	struct ipu_crtc *ipu_crtc = to_ipu_crtc(crtc);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 277ead6a459a..2a5d324269af 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -140,7 +140,7 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane_state *new_state = pipe->plane.state;
 	struct drm_framebuffer *fb = new_state->fb;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.drm);
 	u32 lpcr, lvcr, lhcr;
 	u32 framesize;
 	dma_addr_t addr;
@@ -193,7 +193,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 	int ret;
 	int clk_div;
 	int bpp;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.drm);
 	struct drm_display_mode *mode = &pipe->crtc.mode;
 	struct drm_display_info *disp_info = &lcdc->connector->display_info;
 	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
@@ -229,12 +229,14 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_prepare_enable(lcdc->clk_ipg);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
+		dev_err(pipe->crtc.drm->dev, "Cannot enable ipg clock: %pe\n",
+			ERR_PTR(ret));
 		return;
 	}
 	ret = clk_prepare_enable(lcdc->clk_ahb);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
+		dev_err(pipe->crtc.drm->dev, "Cannot enable ahb clock: %pe\n",
+			ERR_PTR(ret));
 
 		clk_disable_unprepare(lcdc->clk_ipg);
 
@@ -249,7 +251,7 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.drm);
 	struct drm_crtc *crtc = &lcdc->pipe.crtc;
 	struct drm_pending_vblank_event *event;
 
@@ -281,7 +283,8 @@ static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
 	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
 	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
 	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
-		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
+		drm_err(pipe->crtc.drm,
+			"unsupported display mode (%u x %u)\n",
 			mode->hdisplay, mode->vdisplay);
 		return -EINVAL;
 	}
@@ -314,14 +317,14 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 
 		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
 
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e74f946c7e4e..868d4979e464 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -442,12 +442,12 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc_state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 647872f65bff..75a41b005f0c 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -28,7 +28,7 @@ struct kmb_crtc_timing {
 
 static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct kmb_drm_private *kmb = to_kmb(dev);
 
 	/* Clear interrupt */
@@ -44,7 +44,7 @@ static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct kmb_drm_private *kmb = to_kmb(dev);
 
 	/* Clear interrupt */
@@ -68,7 +68,7 @@ static const struct drm_crtc_funcs kmb_crtc_funcs = {
 static void kmb_crtc_set_mode(struct drm_crtc *crtc,
 			      struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_display_mode *m = &crtc->state->adjusted_mode;
 	struct kmb_crtc_timing vm;
 	struct kmb_drm_private *kmb = to_kmb(dev);
@@ -158,7 +158,7 @@ static void kmb_crtc_atomic_disable(struct drm_crtc *crtc,
 static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct kmb_drm_private *kmb = to_kmb(dev);
 
 	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
@@ -168,13 +168,13 @@ static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
 static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct kmb_drm_private *kmb = to_kmb(dev);
 
 	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
 			    LCD_INT_VERT_COMP);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
@@ -182,7 +182,7 @@ static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 	}
 	crtc->state->event = NULL;
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static enum drm_mode_status
@@ -190,7 +190,7 @@ static enum drm_mode_status
 				    const struct drm_display_mode *mode)
 {
 	int refresh;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	int vfp = mode->vsync_start - mode->vdisplay;
 
 	if (mode->vdisplay < KMB_CRTC_MAX_HEIGHT) {
diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.c b/drivers/gpu/drm/logicvc/logicvc_crtc.c
index 43a675d03808..1175ff904560 100644
--- a/drivers/gpu/drm/logicvc/logicvc_crtc.c
+++ b/drivers/gpu/drm/logicvc/logicvc_crtc.c
@@ -41,7 +41,7 @@ static void logicvc_crtc_atomic_begin(struct drm_crtc *drm_crtc,
 	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
 	struct drm_crtc_state *old_state =
 		drm_atomic_get_old_crtc_state(state, drm_crtc);
-	struct drm_device *drm_dev = drm_crtc->dev;
+	struct drm_device *drm_dev = drm_crtc->drm;
 	unsigned long flags;
 
 	/*
@@ -63,14 +63,14 @@ static void logicvc_crtc_atomic_enable(struct drm_crtc *drm_crtc,
 				       struct drm_atomic_state *state)
 {
 	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
-	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->drm);
 	struct drm_crtc_state *old_state =
 		drm_atomic_get_old_crtc_state(state, drm_crtc);
 	struct drm_crtc_state *new_state =
 		drm_atomic_get_new_crtc_state(state, drm_crtc);
 	struct drm_display_mode *mode = &new_state->adjusted_mode;
 
-	struct drm_device *drm_dev = drm_crtc->dev;
+	struct drm_device *drm_dev = drm_crtc->drm;
 	unsigned int hact, hfp, hsl, hbp;
 	unsigned int vact, vfp, vsl, vbp;
 	unsigned long flags;
@@ -152,8 +152,8 @@ static void logicvc_crtc_atomic_enable(struct drm_crtc *drm_crtc,
 static void logicvc_crtc_atomic_disable(struct drm_crtc *drm_crtc,
 					struct drm_atomic_state *state)
 {
-	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
-	struct drm_device *drm_dev = drm_crtc->dev;
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->drm);
+	struct drm_device *drm_dev = drm_crtc->drm;
 
 	drm_crtc_vblank_off(drm_crtc);
 
@@ -190,7 +190,7 @@ static const struct drm_crtc_helper_funcs logicvc_crtc_helper_funcs = {
 
 static int logicvc_crtc_enable_vblank(struct drm_crtc *drm_crtc)
 {
-	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->drm);
 
 	/* Clear any pending V_SYNC interrupt. */
 	regmap_write_bits(logicvc->regmap, LOGICVC_INT_STAT_REG,
@@ -205,7 +205,7 @@ static int logicvc_crtc_enable_vblank(struct drm_crtc *drm_crtc)
 
 static void logicvc_crtc_disable_vblank(struct drm_crtc *drm_crtc)
 {
-	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->dev);
+	struct logicvc_drm *logicvc = logicvc_drm(drm_crtc->drm);
 
 	/* Mask V_SYNC interrupt. */
 	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
diff --git a/drivers/gpu/drm/loongson/lsdc_crtc.c b/drivers/gpu/drm/loongson/lsdc_crtc.c
index 827acab580fa..c7c683685c0c 100644
--- a/drivers/gpu/drm/loongson/lsdc_crtc.c
+++ b/drivers/gpu/drm/loongson/lsdc_crtc.c
@@ -673,7 +673,7 @@ static int lsdc_crtc_late_register(struct drm_crtc *crtc)
 {
 	struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
 	struct lsdc_crtc *lcrtc = to_lsdc_crtc(crtc);
-	struct drm_minor *minor = crtc->dev->primary;
+	struct drm_minor *minor = crtc->drm->primary;
 	unsigned int index = dispipe->index;
 	unsigned int i;
 
@@ -741,7 +741,7 @@ static const struct drm_crtc_funcs ls7a2000_crtc_funcs = {
 static enum drm_mode_status
 lsdc_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	const struct lsdc_desc *descp = ldev->descp;
 	unsigned int pitch;
@@ -782,7 +782,7 @@ static int lsdc_pixpll_atomic_check(struct drm_crtc *crtc,
 
 	ret = pfuncs->compute(pixpll, clock, &priv_state->pparms);
 	if (ret) {
-		drm_warn(crtc->dev, "Failed to find PLL params for %ukHz\n",
+		drm_warn(crtc->drm, "Failed to find PLL params for %ukHz\n",
 			 clock);
 		return -EINVAL;
 	}
@@ -838,7 +838,7 @@ static void lsdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 static void lsdc_crtc_send_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	unsigned long flags;
 
 	if (!crtc->state || !crtc->state->event)
@@ -883,7 +883,7 @@ static void lsdc_crtc_atomic_disable(struct drm_crtc *crtc,
 static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
@@ -891,7 +891,7 @@ static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static bool lsdc_crtc_get_scanout_position(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 52043a12a2e8..ec56aeaa65cc 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -1154,7 +1154,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane *plane = &pipe->plane;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct mcde *mcde = to_mcde(drm);
 	const struct drm_display_mode *mode = &cstate->mode;
 	struct drm_framebuffer *fb = plane->state->fb;
@@ -1300,7 +1300,7 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
 	int ret;
@@ -1321,9 +1321,9 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 
 	ret = regulator_disable(mcde->epod);
@@ -1384,7 +1384,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *old_pstate)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event = crtc->state->event;
 	struct drm_plane *plane = &pipe->plane;
@@ -1399,7 +1399,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		/*
 		 * Hardware must be on before we can arm any vblank event,
 		 * this is not a scanout controller where there is always
@@ -1415,7 +1415,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 			drm_crtc_send_vblank_event(crtc, event);
 		}
 
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 
 	/*
@@ -1445,7 +1445,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct mcde *mcde = to_mcde(drm);
 	u32 val;
 
@@ -1464,7 +1464,7 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct mcde *mcde = to_mcde(drm);
 
 	/* Disable all VBLANK IRQs */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..f831e7a0c142 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -92,11 +92,11 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	unsigned long flags;
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm->event_lock, flags);
 	drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
 	drm_crtc_vblank_put(crtc);
 	mtk_crtc->event = NULL;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 }
 
 static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
@@ -345,11 +345,11 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	height = crtc->state->adjusted_mode.vdisplay;
 	vrefresh = drm_mode_vrefresh(&crtc->state->adjusted_mode);
 
-	drm_for_each_encoder(encoder, crtc->dev) {
+	drm_for_each_encoder(encoder, crtc->drm) {
 		if (encoder->crtc != crtc)
 			continue;
 
-		drm_connector_list_iter_begin(crtc->dev, &conn_iter);
+		drm_connector_list_iter_begin(crtc->drm, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter) {
 			if (connector->encoder != encoder)
 				continue;
@@ -360,7 +360,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	ret = pm_runtime_resume_and_get(crtc->dev->dev);
+	ret = pm_runtime_resume_and_get(crtc->drm->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable power domain: %d\n", ret);
 		return ret;
@@ -421,13 +421,13 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 err_mutex_unprepare:
 	mtk_mutex_unprepare(mtk_crtc->mutex);
 err_pm_runtime_put:
-	pm_runtime_put(crtc->dev->dev);
+	pm_runtime_put(crtc->drm->dev);
 	return ret;
 }
 
 static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 {
-	struct drm_device *drm = mtk_crtc->base.dev;
+	struct drm_device *drm = mtk_crtc->base.drm;
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	int i;
 
@@ -460,10 +460,10 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 	pm_runtime_put(drm->dev);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
@@ -549,7 +549,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
 #endif
 	struct drm_crtc *crtc = &mtk_crtc->base;
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	struct mtk_drm_private *priv = crtc->drm->dev_private;
 	unsigned int pending_planes = 0, pending_async_planes = 0;
 	int i;
 
@@ -616,7 +616,7 @@ static void mtk_crtc_ddp_irq(void *data)
 {
 	struct drm_crtc *crtc = data;
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	struct mtk_drm_private *priv = crtc->drm->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index d70616da8ce2..765f47ee4d73 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -162,9 +162,9 @@ static void meson_g12a_crtc_atomic_disable(struct drm_crtc *crtc,
 	priv->viu.vd1_commit = false;
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -192,9 +192,9 @@ static void meson_crtc_atomic_disable(struct drm_crtc *crtc,
 			    priv->io_base + _REG(VPP_MISC));
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -209,9 +209,9 @@ static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm->event_lock, flags);
 		meson_crtc->event = crtc->state->event;
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 		crtc->state->event = NULL;
 	}
 }
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index bf5d7fe525a3..f04f6ff94f04 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -69,7 +69,7 @@ static int mgag200_g200_pixpllc_atomic_check(struct drm_crtc *crtc, struct drm_a
 	static const int feed_div_min = 7;
 	static const int feed_div_max = 127;
 
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mgag200_g200_device *g200 = to_mgag200_g200_device(dev);
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
 	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
@@ -139,7 +139,7 @@ static int mgag200_g200_pixpllc_atomic_check(struct drm_crtc *crtc, struct drm_a
 static void mgag200_g200_pixpllc_atomic_update(struct drm_crtc *crtc,
 					       struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index fad62453a91d..92894defcf60 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -92,7 +92,7 @@ static int mgag200_g200eh_pixpllc_atomic_check(struct drm_crtc *crtc,
 void mgag200_g200eh_pixpllc_atomic_update(struct drm_crtc *crtc,
 					  struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index bce267e0f7de..68437e4c03cc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -120,7 +120,7 @@ static int mgag200_g200er_pixpllc_atomic_check(struct drm_crtc *crtc,
 static void mgag200_g200er_pixpllc_atomic_update(struct drm_crtc *crtc,
 						 struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -183,7 +183,7 @@ static const struct drm_plane_funcs mgag200_g200er_primary_plane_funcs = {
 static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 						     struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index ac957f42abe1..911f2d936d39 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -99,7 +99,7 @@ static int mgag200_g200ev_pixpllc_atomic_check(struct drm_crtc *crtc,
 static void mgag200_g200ev_pixpllc_atomic_update(struct drm_crtc *crtc,
 						 struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -184,7 +184,7 @@ static const struct drm_plane_funcs mgag200_g200ev_primary_plane_funcs = {
 static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 						     struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index bd6e573c9a1a..c465c7f4da29 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -170,7 +170,7 @@ static int mgag200_g200se_00_pixpllc_atomic_check(struct drm_crtc *crtc,
 static void mgag200_g200se_00_pixpllc_atomic_update(struct drm_crtc *crtc,
 						    struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -271,7 +271,7 @@ static int mgag200_g200se_04_pixpllc_atomic_check(struct drm_crtc *crtc,
 static void mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
 						    struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
@@ -315,7 +315,7 @@ static const struct drm_plane_funcs mgag200_g200se_primary_plane_funcs = {
 static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 						     struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 9baa727ac6f9..0fcc88c3f8b9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -91,7 +91,7 @@ static int mgag200_g200wb_pixpllc_atomic_check(struct drm_crtc *crtc,
 void mgag200_g200wb_pixpllc_atomic_update(struct drm_crtc *crtc,
 					  struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index b166e6fc1399..f3c089b183eb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -545,7 +545,7 @@ void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
 						    const struct drm_display_mode *mode)
 {
-	struct mga_device *mdev = to_mga_device(crtc->dev);
+	struct mga_device *mdev = to_mga_device(crtc->drm);
 	const struct mgag200_device_info *info = mdev->info;
 
 	/*
@@ -574,7 +574,7 @@ enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc *crtc,
 
 int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *new_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
@@ -610,7 +610,7 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 {
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
@@ -625,7 +625,7 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
 
 void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *crtc_state = crtc->state;
@@ -655,7 +655,7 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
 
 void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
 {
-	struct mga_device *mdev = to_mga_device(crtc->dev);
+	struct mga_device *mdev = to_mga_device(crtc->drm);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 
 	if (funcs->disable_vidrst)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..3133135f5b3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -102,7 +102,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
 	struct msm_drm_private *priv;
-	priv = crtc->dev->dev_private;
+	priv = crtc->drm->dev_private;
 	return to_dpu_kms(priv->kms);
 }
 
@@ -171,7 +171,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
 	curr_client_type = dpu_crtc_get_client_type(crtc);
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, crtc->drm) {
 		if (tmp_crtc->enabled &&
 		    (dpu_crtc_get_client_type(tmp_crtc) ==
 				curr_client_type) && (tmp_crtc != crtc)) {
@@ -217,7 +217,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, crtc->drm) {
 		if (tmp_crtc->enabled &&
 			curr_client_type ==
 				dpu_crtc_get_client_type(tmp_crtc)) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 1edf2b6b0a26..6bb56b89ff5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -46,7 +46,7 @@
 
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm->dev_private;
 
 	return to_dpu_kms(priv->kms);
 }
@@ -64,7 +64,7 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
 
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 
 	drm_for_each_encoder(encoder, dev)
@@ -106,7 +106,7 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
 
 		*values_cnt = 0;
 
-		drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
+		drm_for_each_encoder_mask(drm_enc, crtc->drm, crtc->state->encoder_mask)
 			*values_cnt += dpu_encoder_get_crc_values_cnt(drm_enc);
 	}
 
@@ -133,7 +133,8 @@ static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
 {
 	struct drm_encoder *drm_enc;
 
-	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(drm_enc, crtc->drm,
+				  crtc->state->encoder_mask)
 		dpu_encoder_setup_misr(drm_enc);
 }
 
@@ -142,7 +143,7 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
 	enum dpu_crtc_crc_source current_source;
 	struct dpu_crtc_state *crtc_state;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 
 	bool was_enabled;
 	bool enable = false;
@@ -244,7 +245,8 @@ static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
 	int rc, pos = 0;
 	u32 crcs[INTF_MAX];
 
-	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask) {
+	drm_for_each_encoder_mask(drm_enc, crtc->drm,
+				  crtc->state->encoder_mask) {
 		rc = dpu_encoder_get_crc(drm_enc, crcs, pos);
 		if (rc < 0) {
 			if (rc != -ENODATA)
@@ -569,7 +571,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -599,7 +601,8 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 	WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
 
 	/* TODO: Returns the first INTF_MODE, could there be multiple values? */
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm,
+				  crtc->state->encoder_mask)
 		return dpu_encoder_get_intf_mode(encoder);
 
 	return INTF_MODE_NONE;
@@ -692,7 +695,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 		return;
 
 	dpu_crtc = to_dpu_crtc(crtc);
-	priv = crtc->dev->dev_private;
+	priv = crtc->drm->dev_private;
 	crtc_id = drm_crtc_index(crtc);
 
 	trace_dpu_crtc_frame_event_cb(DRMID(crtc), event);
@@ -817,7 +820,8 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
 
 	/* encoder will trigger pending mask now */
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm,
+				  crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);
 
 	/*
@@ -861,7 +865,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	dpu_crtc = to_dpu_crtc(crtc);
 	cstate = to_dpu_crtc_state(crtc->state);
-	dev = crtc->dev;
+	dev = crtc->drm;
 	priv = dev->dev_private;
 
 	if (crtc->index >= ARRAY_SIZE(priv->event_thread)) {
@@ -956,8 +960,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	DPU_ATRACE_BEGIN("crtc_commit");
 
-	drm_for_each_encoder_mask(encoder, crtc->dev,
-			crtc->state->encoder_mask) {
+	drm_for_each_encoder_mask(encoder, crtc->drm,
+				  crtc->state->encoder_mask) {
 		if (!dpu_encoder_is_valid_for_commit(encoder)) {
 			DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
 			goto end;
@@ -967,7 +971,7 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 	 * Encoder will flush/start now, unless it has a tx pending. If so, it
 	 * may delay and flush at an irq event (e.g. ppdone)
 	 */
-	drm_for_each_encoder_mask(encoder, crtc->dev,
+	drm_for_each_encoder_mask(encoder, crtc->drm,
 				  crtc->state->encoder_mask)
 		dpu_encoder_prepare_for_kickoff(encoder);
 
@@ -981,7 +985,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	dpu_vbif_clear_errors(dpu_kms);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm,
+				  crtc->state->encoder_mask)
 		dpu_encoder_kickoff(encoder);
 
 	reinit_completion(&dpu_crtc->frame_done_comp);
@@ -1055,8 +1060,8 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	 * it won't trigger a warn while assigning crtc.
 	 */
 	if (old_crtc_state->self_refresh_active) {
-		drm_for_each_encoder_mask(encoder, crtc->dev,
-					old_crtc_state->encoder_mask) {
+		drm_for_each_encoder_mask(encoder, crtc->drm,
+					  old_crtc_state->encoder_mask) {
 			dpu_encoder_assign_crtc(encoder, NULL);
 		}
 		return;
@@ -1065,7 +1070,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	/* Disable/save vblank irq handling */
 	drm_crtc_vblank_off(crtc);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev,
+	drm_for_each_encoder_mask(encoder, crtc->drm,
 				  old_crtc_state->encoder_mask) {
 		/* in video mode, we hold an extra bandwidth reference
 		 * as we cannot drop bandwidth at frame-done if any
@@ -1102,7 +1107,8 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	dpu_core_perf_crtc_update(crtc, 0, true);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm,
+				  crtc->state->encoder_mask)
 		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
 
 	memset(cstate->mixers, 0, sizeof(cstate->mixers));
@@ -1113,13 +1119,13 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	cstate->bw_split_vote = false;
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm->event_lock, flags);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 	}
 
-	pm_runtime_put_sync(crtc->dev->dev);
+	pm_runtime_put_sync(crtc->drm->dev);
 }
 
 static void dpu_crtc_enable(struct drm_crtc *crtc,
@@ -1132,11 +1138,12 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 
-	pm_runtime_get_sync(crtc->dev->dev);
+	pm_runtime_get_sync(crtc->drm->dev);
 
 	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
+	drm_for_each_encoder_mask(encoder, crtc->drm,
+				  crtc->state->encoder_mask) {
 		/* in video mode, we hold an extra bandwidth reference
 		 * as we cannot drop bandwidth at frame-done if any
 		 * crtc is being used in video mode.
@@ -1154,7 +1161,8 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	dpu_crtc->enabled = true;
 
 	if (!old_crtc_state->self_refresh_active) {
-		drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+		drm_for_each_encoder_mask(encoder, crtc->drm,
+					  crtc->state->encoder_mask)
 			dpu_encoder_assign_crtc(encoder, crtc);
 	}
 
@@ -1170,7 +1178,7 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	if (cstate->self_refresh_active)
 		return true;
 
-	drm_for_each_encoder_mask (encoder, crtc->dev, cstate->encoder_mask) {
+	drm_for_each_encoder_mask (encoder, crtc->drm, cstate->encoder_mask) {
 		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
 			return true;
 		}
@@ -1262,7 +1270,7 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	 * about the assigned crtcs being inconsistent with the current state
 	 * (which means no need to worry about modeset locks).
 	 */
-	list_for_each_entry(enc, &crtc->dev->mode_config.encoder_list, head) {
+	list_for_each_entry(enc, &crtc->drm->mode_config.encoder_list, head) {
 		trace_dpu_crtc_vblank_enable(DRMID(crtc), DRMID(enc), en,
 					     dpu_crtc);
 
@@ -1291,7 +1299,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 	dpu_crtc = s->private;
 	crtc = &dpu_crtc->base;
 
-	drm_modeset_lock_all(crtc->dev);
+	drm_modeset_lock_all(crtc->drm);
 	cstate = to_dpu_crtc_state(crtc->state);
 
 	mode = &crtc->state->adjusted_mode;
@@ -1383,7 +1391,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		dpu_crtc->vblank_cb_time = ktime_set(0, 0);
 	}
 
-	drm_modeset_unlock_all(crtc->dev);
+	drm_modeset_unlock_all(crtc->drm);
 
 	return 0;
 }
@@ -1474,7 +1482,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 		return ERR_PTR(-ENOMEM);
 
 	crtc = &dpu_crtc->base;
-	crtc->dev = dev;
+	crtc->drm = dev;
 
 	spin_lock_init(&dpu_crtc->spin_lock);
 	atomic_set(&dpu_crtc->frame_pending, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 6c44e1e65fcc..dd1fb12dabd6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -468,7 +468,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
 		return;
 	}
 
-	dev = crtc->dev;
+	dev = crtc->drm;
 
 	if (!crtc->state->enable) {
 		DPU_DEBUG("[crtc:%d] not enable\n", crtc->base.id);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 169f9de4a12a..4c4fc5b8c5ba 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -61,7 +61,7 @@ struct mdp4_crtc {
 
 static struct mdp4_kms *get_kms(struct drm_crtc *crtc)
 {
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm->dev_private;
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
@@ -98,7 +98,7 @@ static void crtc_flush(struct drm_crtc *crtc)
 static void complete_flip(struct drm_crtc *crtc, struct drm_file *file)
 {
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_pending_vblank_event *event;
 	unsigned long flags;
 
@@ -327,7 +327,7 @@ static void mdp4_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned long flags;
 
 	DBG("%s: event: %p", mdp4_crtc->name, crtc->state->event);
@@ -407,7 +407,7 @@ static int mdp4_crtc_cursor_set(struct drm_crtc *crtc,
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
 	struct mdp4_kms *mdp4_kms = get_kms(crtc);
 	struct msm_kms *kms = &mdp4_kms->base.base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_gem_object *cursor_bo, *old_bo;
 	unsigned long flags;
 	uint64_t iova;
@@ -499,7 +499,7 @@ static void mdp4_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 {
 	struct mdp4_crtc *mdp4_crtc = container_of(irq, struct mdp4_crtc, vblank);
 	struct drm_crtc *crtc = &mdp4_crtc->base;
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm->dev_private;
 	unsigned pending;
 
 	mdp_irq_unregister(&get_kms(crtc)->base, &mdp4_crtc->vblank);
@@ -526,7 +526,7 @@ static void mdp4_crtc_err_irq(struct mdp_irq *irq, uint32_t irqstatus)
 
 static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
 	struct mdp4_kms *mdp4_kms = get_kms(crtc);
 	int ret;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 86036dd4e1e8..0cd5c075423c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -69,7 +69,7 @@ static void mdp5_crtc_restore_cursor(struct drm_crtc *crtc);
 
 static struct mdp5_kms *get_kms(struct drm_crtc *crtc)
 {
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm->dev_private;
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
@@ -140,7 +140,7 @@ static void complete_flip(struct drm_crtc *crtc, struct drm_file *file)
 	struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_ctl *ctl = mdp5_cstate->ctl;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_pending_vblank_event *event;
 	unsigned long flags;
 
@@ -412,7 +412,7 @@ static void mdp5_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 
 	drm_for_each_encoder(encoder, dev)
@@ -701,7 +701,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 	struct mdp5_interface *intf = mdp5_cstate->pipeline.intf;
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct drm_plane *plane;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct plane_state pstates[STAGE_MAX + 1];
 	const struct mdp5_cfg_hw *hw_cfg;
 	const struct drm_plane_state *pstate;
@@ -800,7 +800,7 @@ static void mdp5_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned long flags;
 
 	DBG("%s: event: %p", crtc->name, crtc->state->event);
@@ -954,7 +954,7 @@ static int mdp5_crtc_cursor_set(struct drm_crtc *crtc,
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct platform_device *pdev = mdp5_kms->pdev;
 	struct msm_kms *kms = &mdp5_kms->base.base;
@@ -1042,7 +1042,7 @@ static int mdp5_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	uint32_t flush_mask = mdp_ctl_flush_mask_cursor(0);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	uint32_t roi_w;
 	uint32_t roi_h;
 	unsigned long flags;
@@ -1189,7 +1189,7 @@ static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 {
 	struct mdp5_crtc *mdp5_crtc = container_of(irq, struct mdp5_crtc, vblank);
 	struct drm_crtc *crtc = &mdp5_crtc->base;
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm->dev_private;
 	unsigned pending;
 
 	mdp_irq_unregister(&get_kms(crtc)->base, &mdp5_crtc->vblank);
@@ -1221,7 +1221,7 @@ static void mdp5_crtc_pp_done_irq(struct mdp_irq *irq, uint32_t irqstatus)
 
 static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	int ret;
@@ -1235,7 +1235,7 @@ static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)
 
 static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	struct mdp5_ctl *ctl = mdp5_cstate->ctl;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2a0e3529598b..11ff297db886 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -638,7 +638,7 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 
 int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
@@ -650,7 +650,7 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 
 void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 2541d2de4e45..fb5e211c838f 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -402,7 +402,7 @@ static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
 				     struct drm_plane_state *plane_state)
 {
 	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
-	struct drm_device *drm = crtc_state->crtc->dev;
+	struct drm_device *drm = crtc_state->crtc->drm;
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
 	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 
@@ -424,7 +424,7 @@ static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
 static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
 	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
@@ -505,7 +505,7 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm);
 	struct drm_pending_vblank_event *event;
 	u32 reg;
 
@@ -519,18 +519,18 @@ static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (!event)
 		return;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (drm_crtc_vblank_get(crtc) == 0)
 		drm_crtc_arm_vblank_event(crtc, event);
 	else
 		drm_crtc_send_vblank_event(crtc, event);
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm);
 	struct drm_crtc_state *new_cstate = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    crtc->primary);
@@ -560,7 +560,7 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm);
 	struct drm_device *drm = lcdif->drm;
 	struct drm_pending_vblank_event *event;
 
@@ -623,7 +623,7 @@ lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 
 static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm);
 
 	/* Clear and enable VBLANK IRQ */
 	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + LCDC_V8_INT_STATUS_D0);
@@ -634,7 +634,7 @@ static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void lcdif_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->drm);
 
 	/* Disable and clear VBLANK IRQ */
 	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D0);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7ed2516b6de0..d84e03a0c9eb 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -279,7 +279,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 				     struct drm_bridge_state *bridge_state,
 				     const u32 bus_format)
 {
-	struct drm_device *drm = mxsfb->crtc.dev;
+	struct drm_device *drm = mxsfb->crtc.drm;
 	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
 	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
 	int err;
@@ -335,18 +335,18 @@ static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (!event)
 		return;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (drm_crtc_vblank_get(crtc) == 0)
 		drm_crtc_arm_vblank_event(crtc, event);
 	else
 		drm_crtc_send_vblank_event(crtc, event);
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->drm);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    crtc->primary);
 	struct drm_bridge_state *bridge_state = NULL;
@@ -400,7 +400,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->drm);
 	struct drm_device *drm = mxsfb->drm;
 	struct drm_pending_vblank_event *event;
 
@@ -422,7 +422,7 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 
 static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->drm);
 
 	/* Clear and enable VBLANK IRQ */
 	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
@@ -433,7 +433,7 @@ static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void mxsfb_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->drm);
 
 	/* Disable and clear VBLANK IRQ */
 	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
@@ -447,7 +447,7 @@ static int mxsfb_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
 	if (!crtc)
 		return -ENODEV;
 
-	mxsfb = to_mxsfb_drm_private(crtc->dev);
+	mxsfb = to_mxsfb_drm_private(crtc->drm);
 
 	if (source && strcmp(source, "auto") == 0)
 		mxsfb->crc_active = true;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index a6f2e681bde9..d43234bd31e4 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -56,18 +56,18 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 static void
 crtc_wr_cio_state(struct drm_crtc *crtc, struct nv04_crtc_reg *crtcstate, int index)
 {
-	NVWriteVgaCrtc(crtc->dev, nouveau_crtc(crtc)->index, index,
+	NVWriteVgaCrtc(crtc->drm, nouveau_crtc(crtc)->index, index,
 		       crtcstate->CRTC[index]);
 }
 
 static void nv_crtc_set_digital_vibrance(struct drm_crtc *crtc, int level)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 
 	regp->CRTC[NV_CIO_CRE_CSB] = nv_crtc->saturation = level;
-	if (nv_crtc->saturation && nv_gf4_disp_arch(crtc->dev)) {
+	if (nv_crtc->saturation && nv_gf4_disp_arch(crtc->drm)) {
 		regp->CRTC[NV_CIO_CRE_CSB] = 0x80;
 		regp->CRTC[NV_CIO_CRE_5B] = nv_crtc->saturation << 2;
 		crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_5B);
@@ -78,14 +78,15 @@ static void nv_crtc_set_digital_vibrance(struct drm_crtc *crtc, int level)
 static void nv_crtc_set_image_sharpening(struct drm_crtc *crtc, int level)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 
 	nv_crtc->sharpness = level;
 	if (level < 0)	/* blur is in hw range 0x3f -> 0x20 */
 		level += 0x40;
 	regp->ramdac_634 = level;
-	NVWriteRAMDAC(crtc->dev, nv_crtc->index, NV_PRAMDAC_634, regp->ramdac_634);
+	NVWriteRAMDAC(crtc->drm, nv_crtc->index, NV_PRAMDAC_634,
+		      regp->ramdac_634);
 }
 
 #define PLLSEL_VPLL1_MASK				\
@@ -116,7 +117,7 @@ static void nv_crtc_set_image_sharpening(struct drm_crtc *crtc, int level)
 
 static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mode * mode, int dot_clock)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
 	struct nvkm_clk *clk = nvxx_clk(&drm->client.device);
@@ -175,7 +176,7 @@ static void
 nv_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	unsigned char seq1 = 0, crtc17 = 0;
 	unsigned char crtc1A;
@@ -236,7 +237,7 @@ nv_crtc_dpms(struct drm_crtc *crtc, int mode)
 static void
 nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 	struct drm_framebuffer *fb = crtc->primary->fb;
@@ -460,7 +461,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
 static void
 nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
@@ -609,7 +610,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 static int
 nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
 {
-	struct nv04_display *disp = nv04_display(crtc->dev);
+	struct nv04_display *disp = nv04_display(crtc->drm);
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
@@ -638,7 +639,7 @@ nv_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 		 struct drm_display_mode *adjusted_mode,
 		 int x, int y, struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	int ret;
@@ -665,16 +666,16 @@ nv_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 static void nv_crtc_save(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nv04_mode_state *state = &nv04_display(dev)->mode_reg;
 	struct nv04_crtc_reg *crtc_state = &state->crtc_reg[nv_crtc->index];
 	struct nv04_mode_state *saved = &nv04_display(dev)->saved_reg;
 	struct nv04_crtc_reg *crtc_saved = &saved->crtc_reg[nv_crtc->index];
 
-	if (nv_two_heads(crtc->dev))
-		NVSetOwner(crtc->dev, nv_crtc->index);
+	if (nv_two_heads(crtc->drm))
+		NVSetOwner(crtc->drm, nv_crtc->index);
 
-	nouveau_hw_save_state(crtc->dev, nv_crtc->index, saved);
+	nouveau_hw_save_state(crtc->drm, nv_crtc->index, saved);
 
 	/* init some state to saved value */
 	state->sel_clk = saved->sel_clk & ~(0x5 << 16);
@@ -686,22 +687,22 @@ static void nv_crtc_save(struct drm_crtc *crtc)
 static void nv_crtc_restore(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	int head = nv_crtc->index;
 	uint8_t saved_cr21 = nv04_display(dev)->saved_reg.crtc_reg[head].CRTC[NV_CIO_CRE_21];
 
-	if (nv_two_heads(crtc->dev))
-		NVSetOwner(crtc->dev, head);
+	if (nv_two_heads(crtc->drm))
+		NVSetOwner(crtc->drm, head);
 
-	nouveau_hw_load_state(crtc->dev, head, &nv04_display(dev)->saved_reg);
-	nv_lock_vga_crtc_shadow(crtc->dev, head, saved_cr21);
+	nouveau_hw_load_state(crtc->drm, head, &nv04_display(dev)->saved_reg);
+	nv_lock_vga_crtc_shadow(crtc->drm, head, saved_cr21);
 
 	nv_crtc->last_dpms = NV_DPMS_CLEARED;
 }
 
 static void nv_crtc_prepare(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	const struct drm_crtc_helper_funcs *funcs = crtc->helper_private;
@@ -724,7 +725,7 @@ static void nv_crtc_prepare(struct drm_crtc *crtc)
 
 static void nv_crtc_commit(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	const struct drm_crtc_helper_funcs *funcs = crtc->helper_private;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
@@ -746,7 +747,7 @@ static void nv_crtc_commit(struct drm_crtc *crtc)
 
 static void nv_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct nv04_display *disp = nv04_display(crtc->dev);
+	struct nv04_display *disp = nv04_display(crtc->drm);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
 	if (!nv_crtc)
@@ -770,7 +771,7 @@ static void
 nv_crtc_gamma_load(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = nv_crtc->base.dev;
+	struct drm_device *dev = nv_crtc->base.drm;
 	struct rgb { uint8_t r, g, b; } __attribute__((packed)) *rgbs;
 	u16 *r, *g, *b;
 	int i;
@@ -792,7 +793,7 @@ nv_crtc_gamma_load(struct drm_crtc *crtc)
 static void
 nv_crtc_disable(struct drm_crtc *crtc)
 {
-	struct nv04_display *disp = nv04_display(crtc->dev);
+	struct nv04_display *disp = nv04_display(crtc->drm);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	if (disp->image[nv_crtc->index])
 		nouveau_bo_unpin(disp->image[nv_crtc->index]);
@@ -827,7 +828,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 			   int x, int y, bool atomic)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 	struct nouveau_bo *nvbo;
@@ -982,7 +983,7 @@ static int
 nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		     uint32_t buffer_handle, uint32_t width, uint32_t height)
 {
-	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nouveau_drm *drm = nouveau_drm(crtc->drm);
 	struct drm_device *dev = drm->dev;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_bo *cursor = NULL;
@@ -1140,7 +1141,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		    struct drm_modeset_acquire_ctx *ctx)
 {
 	const int swap_interval = (flags & DRM_MODE_PAGE_FLIP_ASYNC) ? 0 : 1;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct drm_framebuffer *old_fb = crtc->primary->fb;
 	struct nouveau_bo *old_bo = nouveau_gem_object(old_fb->obj[0]);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/cursor.c b/drivers/gpu/drm/nouveau/dispnv04/cursor.c
index 4c6440d29c3f..d8b71731be6d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/cursor.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/cursor.c
@@ -8,20 +8,20 @@
 static void
 nv04_cursor_show(struct nouveau_crtc *nv_crtc, bool update)
 {
-	nv_show_cursor(nv_crtc->base.dev, nv_crtc->index, true);
+	nv_show_cursor(nv_crtc->base.drm, nv_crtc->index, true);
 }
 
 static void
 nv04_cursor_hide(struct nouveau_crtc *nv_crtc, bool update)
 {
-	nv_show_cursor(nv_crtc->base.dev, nv_crtc->index, false);
+	nv_show_cursor(nv_crtc->base.drm, nv_crtc->index, false);
 }
 
 static void
 nv04_cursor_set_pos(struct nouveau_crtc *nv_crtc, int x, int y)
 {
 	nv_crtc->cursor_saved_x = x; nv_crtc->cursor_saved_y = y;
-	NVWriteRAMDAC(nv_crtc->base.dev, nv_crtc->index,
+	NVWriteRAMDAC(nv_crtc->base.drm, nv_crtc->index,
 		      NV_PRAMDAC_CU_START_POS,
 		      XLATE(y, 0, NV_PRAMDAC_CU_START_POS_Y) |
 		      XLATE(x, 0, NV_PRAMDAC_CU_START_POS_X));
@@ -30,14 +30,14 @@ nv04_cursor_set_pos(struct nouveau_crtc *nv_crtc, int x, int y)
 static void
 crtc_wr_cio_state(struct drm_crtc *crtc, struct nv04_crtc_reg *crtcstate, int index)
 {
-	NVWriteVgaCrtc(crtc->dev, nouveau_crtc(crtc)->index, index,
+	NVWriteVgaCrtc(crtc->drm, nouveau_crtc(crtc)->index, index,
 		       crtcstate->CRTC[index]);
 }
 
 static void
 nv04_cursor_set_offset(struct nouveau_crtc *nv_crtc, uint32_t offset)
 {
-	struct drm_device *dev = nv_crtc->base.dev;
+	struct drm_device *dev = nv_crtc->base.drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
 	struct drm_crtc *crtc = &nv_crtc->base;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index 93f8f4f64578..6348fd4437b4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -163,7 +163,7 @@ nv50_head_atom_get_encoder(struct nv50_head_atom *atom)
 	struct drm_encoder *encoder;
 
 	/* We only ever have a single encoder */
-	drm_for_each_encoder_mask(encoder, atom->state.crtc->dev,
+	drm_for_each_encoder_mask(encoder, atom->state.crtc->drm,
 				  atom->state.encoder_mask)
 		return encoder;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index beeb73e033ea..fbfcbe206d8c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -48,7 +48,7 @@ int
 nv50_crc_verify_source(struct drm_crtc *crtc, const char *source_name,
 		       size_t *values_cnt)
 {
-	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nouveau_drm *drm = nouveau_drm(crtc->drm);
 	enum nv50_crc_source source;
 
 	if (nv50_crc_parse_source(source_name, &source) < 0) {
@@ -70,7 +70,7 @@ static void
 nv50_crc_program_ctx(struct nv50_head *head,
 		     struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nv50_disp *disp = nv50_disp(head->base.base.dev);
+	struct nv50_disp *disp = nv50_disp(head->base.base.drm);
 	struct nv50_core *core = disp->core;
 	u32 interlock[NV50_DISP_INTERLOCK__SIZE] = { 0 };
 
@@ -84,7 +84,7 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 	struct nv50_crc *crc = container_of(work, struct nv50_crc, flip_work);
 	struct nv50_head *head = container_of(crc, struct nv50_head, crc);
 	struct drm_crtc *crtc = &head->base.base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nv50_disp *disp = nv50_disp(dev);
 	const uint64_t start_vbl = drm_crtc_vblank_count(crtc);
 	uint64_t end_vbl;
@@ -154,7 +154,7 @@ void nv50_crc_handle_vblank(struct nv50_head *head)
 	struct drm_crtc *crtc = &head->base.base;
 	struct nv50_crc *crc = &head->crc;
 	const struct nv50_crc_func *func =
-		nv50_disp(head->base.base.dev)->core->func->crc;
+		nv50_disp(head->base.base.drm)->core->func->crc;
 	struct nv50_crc_notifier_ctx *ctx;
 	bool need_reschedule = false;
 
@@ -193,7 +193,7 @@ void nv50_crc_handle_vblank(struct nv50_head *head)
 		 * updates back-to-back without waiting, we'll just be
 		 * optimistic and assume we always miss exactly one frame.
 		 */
-		drm_dbg_kms(head->base.base.dev,
+		drm_dbg_kms(head->base.base.drm,
 			    "Notifier ctx flip for head-%d finished, lost CRC for frame %llu\n",
 			    head->base.index, crc->frame);
 		crc->frame++;
@@ -219,7 +219,7 @@ static void nv50_crc_wait_ctx_finished(struct nv50_head *head,
 				       const struct nv50_crc_func *func,
 				       struct nv50_crc_notifier_ctx *ctx)
 {
-	struct drm_device *dev = head->base.base.dev;
+	struct drm_device *dev = head->base.base.drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	s64 ret;
 
@@ -256,7 +256,7 @@ void nv50_crc_atomic_stop_reporting(struct drm_atomic_state *state)
 		drm_crtc_vblank_put(crtc);
 		drm_vblank_work_cancel_sync(&crc->flip_work);
 
-		NV_ATOMIC(nouveau_drm(crtc->dev),
+		NV_ATOMIC(nouveau_drm(crtc->drm),
 			  "CRC reporting on vblank for head-%d disabled\n",
 			  head->base.index);
 
@@ -340,7 +340,7 @@ void nv50_crc_atomic_start_reporting(struct drm_atomic_state *state)
 					 true);
 		spin_unlock_irq(&crc->lock);
 
-		NV_ATOMIC(nouveau_drm(crtc->dev),
+		NV_ATOMIC(nouveau_drm(crtc->drm),
 			  "CRC reporting on vblank for head-%d enabled\n",
 			  head->base.index);
 	}
@@ -449,7 +449,7 @@ void nv50_crc_atomic_set(struct nv50_head *head,
 			 struct nv50_head_atom *asyh)
 {
 	struct drm_crtc *crtc = &head->base.base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct nv50_crc *crc = &head->crc;
 	const struct nv50_crc_func *func = nv50_disp(dev)->core->func->crc;
 	struct nouveau_encoder *outp;
@@ -470,7 +470,7 @@ void nv50_crc_atomic_set(struct nv50_head *head,
 void nv50_crc_atomic_clr(struct nv50_head *head)
 {
 	const struct nv50_crc_func *func =
-		nv50_disp(head->base.base.dev)->core->func->crc;
+		nv50_disp(head->base.base.drm)->core->func->crc;
 
 	func->set_src(head, 0, NV50_CRC_SOURCE_TYPE_NONE, NULL);
 }
@@ -500,7 +500,7 @@ static inline int
 nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 		  struct nv50_crc_notifier_ctx *ctx, size_t len, int idx)
 {
-	struct nv50_core *core = nv50_disp(head->base.base.dev)->core;
+	struct nv50_core *core = nv50_disp(head->base.base.drm)->core;
 	int ret;
 
 	ret = nvif_mem_ctor_map(mmu, "kmsCrcNtfy", NVIF_MEM_VRAM, len, &ctx->mem);
@@ -537,7 +537,7 @@ nv50_crc_ctx_fini(struct nv50_crc_notifier_ctx *ctx)
 
 int nv50_crc_set_source(struct drm_crtc *crtc, const char *source_str)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
 	struct nv50_head *head = nv50_head(crtc);
@@ -656,10 +656,10 @@ nv50_crc_debugfs_flip_threshold_set(struct file *file,
 	struct nv50_head *head = m->private;
 	struct nv50_head_atom *armh;
 	struct drm_crtc *crtc = &head->base.base;
-	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nouveau_drm *drm = nouveau_drm(crtc->drm);
 	struct nv50_crc *crc = &head->crc;
 	const struct nv50_crc_func *func =
-		nv50_disp(crtc->dev)->core->func->crc;
+		nv50_disp(crtc->drm)->core->func->crc;
 	int value, ret;
 
 	ret = kstrtoint_from_user(ubuf, len, 10, &value);
@@ -706,7 +706,7 @@ int nv50_head_crc_late_register(struct nv50_head *head)
 {
 	struct drm_crtc *crtc = &head->base.base;
 	const struct nv50_crc_func *func =
-		nv50_disp(crtc->dev)->core->func->crc;
+		nv50_disp(crtc->drm)->core->func->crc;
 	struct dentry *root;
 
 	if (!func || !crtc->debugfs_entry)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
index f9ad641555b7..89e1f2832368 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
@@ -26,7 +26,7 @@ static int
 crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 		struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVDEF(NV907D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
 		       NVDEF(NV907D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
@@ -74,7 +74,7 @@ crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 static int
 crc907d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -97,7 +97,7 @@ static u32 crc907d_get_entry(struct nv50_head *head,
 static bool crc907d_ctx_finished(struct nv50_head *head,
 				 struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(head->base.base.drm);
 	struct crc907d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
 	const u32 status = ioread32_native(&notifier->status);
 	const u32 overflow = status & 0x0000003e;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index f10f6c484408..0a2a8a91da23 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -15,7 +15,7 @@ static int
 crcc37d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 		struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVVAL(NVC37D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, i * 4) |
 		       NVDEF(NVC37D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
@@ -53,7 +53,7 @@ crcc37d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 
 int crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -81,7 +81,7 @@ u32 crcc37d_get_entry(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx,
 
 bool crcc37d_ctx_finished(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
+	struct nouveau_drm *drm = nouveau_drm(head->base.base.drm);
 	struct crcc37d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
 	const u32 status = ioread32_native(&notifier->status);
 	const u32 overflow = status & 0x0000007e;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
index cc0130e3d496..f0da0840a2da 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
@@ -13,7 +13,7 @@
 static int crcc57d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 			   struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
 		       NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 521bf7eeb558..8c04b5f554ea 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2213,9 +2213,9 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 			/* Get correct count/ts if racing with vblank irq */
 			if (new_crtc_state->active)
 				drm_crtc_accurate_vblank_count(crtc);
-			spin_lock_irqsave(&crtc->dev->event_lock, flags);
+			spin_lock_irqsave(&crtc->drm->event_lock, flags);
 			drm_crtc_send_vblank_event(crtc, new_crtc_state->event);
-			spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 
 			new_crtc_state->event = NULL;
 			if (new_crtc_state->active)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 5f490fbf1877..17a23d0751bd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -225,7 +225,7 @@ static int
 nv50_head_atomic_check_lut(struct nv50_head *head,
 			   struct nv50_head_atom *asyh)
 {
-	struct drm_device *dev = head->base.base.dev;
+	struct drm_device *dev = head->base.base.drm;
 	struct drm_crtc *crtc = &head->base.base;
 	struct nv50_disp *disp = nv50_disp(dev);
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -336,7 +336,7 @@ nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 									      crtc);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct nouveau_drm *drm = nouveau_drm(crtc->dev);
+	struct nouveau_drm *drm = nouveau_drm(crtc->drm);
 	struct nv50_head *head = nv50_head(crtc);
 	struct nv50_head_atom *armh = nv50_head_atom(old_crtc_state);
 	struct nv50_head_atom *asyh = nv50_head_atom(crtc_state);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head507d.c b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
index 0edd4e520c8e..7fecdb0db07a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
@@ -29,7 +29,7 @@
 int
 head507d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head507d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -66,7 +66,7 @@ head507d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -94,7 +94,7 @@ head507d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -122,7 +122,7 @@ head507d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head507d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -139,7 +139,7 @@ head507d_curs_clr(struct nv50_head *head)
 static int
 head507d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -188,7 +188,7 @@ head507d_curs_layout(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 int
 head507d_core_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -202,7 +202,7 @@ head507d_core_clr(struct nv50_head *head)
 static int
 head507d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -246,7 +246,7 @@ head507d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 void
 head507d_core_calc(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nv50_disp *disp = nv50_disp(head->base.base.dev);
+	struct nv50_disp *disp = nv50_disp(head->base.base.drm);
 	if ((asyh->core.visible = (asyh->base.cpp != 0))) {
 		asyh->core.x = asyh->base.x;
 		asyh->core.y = asyh->base.y;
@@ -278,7 +278,7 @@ head507d_core_calc(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head507d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -293,7 +293,7 @@ head507d_olut_clr(struct nv50_head *head)
 static int
 head507d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -345,7 +345,7 @@ head507d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 int
 head507d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -400,7 +400,7 @@ head507d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head827d.c b/drivers/gpu/drm/nouveau/dispnv50/head827d.c
index 194d1771c481..a31ff645c60e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head827d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head827d.c
@@ -29,7 +29,7 @@
 static int
 head827d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head827d_curs_clr(struct nv50_head *head)
 static int
 head827d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -73,7 +73,7 @@ head827d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head827d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -110,7 +110,7 @@ head827d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head827d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -127,7 +127,7 @@ head827d_olut_clr(struct nv50_head *head)
 static int
 head827d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head907d.c b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
index 18fe4c1e2d6a..7fd070d8c8ed 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
@@ -36,7 +36,7 @@
 int
 head907d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -57,7 +57,7 @@ head907d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -77,7 +77,7 @@ head907d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head907d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -95,7 +95,7 @@ head907d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -124,7 +124,7 @@ head907d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head907d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -152,7 +152,7 @@ head907d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -171,7 +171,7 @@ head907d_curs_clr(struct nv50_head *head)
 int
 head907d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -195,7 +195,7 @@ head907d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_core_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -209,7 +209,7 @@ head907d_core_clr(struct nv50_head *head)
 int
 head907d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -246,7 +246,7 @@ head907d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -263,7 +263,7 @@ head907d_olut_clr(struct nv50_head *head)
 int
 head907d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -322,7 +322,7 @@ bool head907d_ilut_check(int size)
 int
 head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -378,7 +378,7 @@ head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head917d.c b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
index 4ce47b55f72c..678b08dc53e3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
@@ -30,7 +30,7 @@
 static int
 head917d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head917d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head917d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -77,7 +77,7 @@ head917d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head917d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index a4a3b78ea42c..20dc6ac6201b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -30,7 +30,7 @@
 static int
 headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u8 depth;
 	int ret;
@@ -64,7 +64,7 @@ headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc37d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -85,7 +85,7 @@ headc37d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -104,7 +104,7 @@ headc37d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -122,7 +122,7 @@ headc37d_curs_clr(struct nv50_head *head)
 int
 headc37d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -161,7 +161,7 @@ headc37d_curs_format(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 static int
 headc37d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -175,7 +175,7 @@ headc37d_olut_clr(struct nv50_head *head)
 static int
 headc37d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -209,7 +209,7 @@ headc37d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 static int
 headc37d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -254,7 +254,7 @@ headc37d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 543f08ceaad6..45b124f3217d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -30,7 +30,7 @@
 static int
 headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	u8 depth;
 	int ret;
@@ -65,7 +65,7 @@ headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc57d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -83,7 +83,7 @@ headc57d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc57d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -97,7 +97,7 @@ headc57d_olut_clr(struct nv50_head *head)
 static int
 headc57d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -188,7 +188,7 @@ headc57d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 static int
 headc57d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = nv50_disp(head->base.base.drm)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 35bcb541722b..f34aeb6b31f8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -181,7 +181,7 @@ nouveau_connector_is_mst(struct drm_connector *connector)
 static inline struct nouveau_connector *
 nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 {
-	struct drm_device *dev = nv_crtc->base.dev;
+	struct drm_device *dev = nv_crtc->base.drm;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	struct nouveau_connector *nv_connector = NULL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 99977e5fe716..1d005473a488 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -83,7 +83,7 @@ static bool
 nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 				ktime_t *stime, ktime_t *etime)
 {
-	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[drm_crtc_index(crtc)];
+	struct drm_vblank_crtc *vblank = &crtc->drm->vblank[drm_crtc_index(crtc)];
 	struct nvif_head *head = &nouveau_crtc(crtc)->head;
 	struct nvif_head_scanoutpos_v0 args;
 	int retry = 20;
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 63ddc5127f7b..125172669e67 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -70,9 +70,9 @@ static bool omap_crtc_is_pending(struct drm_crtc *crtc)
 	unsigned long flags;
 	bool pending;
 
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm->event_lock, flags);
 	pending = omap_crtc->pending;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 
 	return pending;
 }
@@ -109,7 +109,7 @@ void omap_crtc_dss_start_update(struct omap_drm_private *priv,
 void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 {
 	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	enum omap_channel channel = omap_crtc->channel;
@@ -228,7 +228,7 @@ int omap_crtc_dss_register_framedone(
 {
 	struct drm_crtc *crtc = priv->channels[channel]->crtc;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct drm_device *dev = omap_crtc->base.dev;
+	struct drm_device *dev = omap_crtc->base.drm;
 
 	if (omap_crtc->framedone_handler)
 		return -EBUSY;
@@ -247,7 +247,7 @@ void omap_crtc_dss_unregister_framedone(
 {
 	struct drm_crtc *crtc = priv->channels[channel]->crtc;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct drm_device *dev = omap_crtc->base.dev;
+	struct drm_device *dev = omap_crtc->base.drm;
 
 	dev_dbg(dev->dev, "unregister framedone %s", omap_crtc->name);
 
@@ -278,17 +278,17 @@ void omap_crtc_error_irq(struct drm_crtc *crtc, u32 irqstatus)
 void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 {
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct drm_device *dev = omap_crtc->base.dev;
+	struct drm_device *dev = omap_crtc->base.drm;
 	struct omap_drm_private *priv = dev->dev_private;
 	bool pending;
 
-	spin_lock(&crtc->dev->event_lock);
+	spin_lock(&crtc->drm->event_lock);
 	/*
 	 * If the dispc is busy we're racing the flush operation. Try again on
 	 * the next vblank interrupt.
 	 */
 	if (dispc_mgr_go_busy(priv->dispc, omap_crtc->channel)) {
-		spin_unlock(&crtc->dev->event_lock);
+		spin_unlock(&crtc->drm->event_lock);
 		return;
 	}
 
@@ -300,7 +300,7 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 
 	pending = omap_crtc->pending;
 	omap_crtc->pending = false;
-	spin_unlock(&crtc->dev->event_lock);
+	spin_unlock(&crtc->drm->event_lock);
 
 	if (pending)
 		drm_crtc_vblank_put(crtc);
@@ -320,14 +320,14 @@ void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
 
 	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
 
-	spin_lock(&crtc->dev->event_lock);
+	spin_lock(&crtc->drm->event_lock);
 	/* Send the vblank event if one has been requested. */
 	if (omap_crtc->event) {
 		drm_crtc_send_vblank_event(crtc, omap_crtc->event);
 		omap_crtc->event = NULL;
 	}
 	omap_crtc->pending = false;
-	spin_unlock(&crtc->dev->event_lock);
+	spin_unlock(&crtc->drm->event_lock);
 
 	/* Wake up omap_atomic_complete. */
 	wake_up(&omap_crtc->pending_wait);
@@ -350,7 +350,7 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 	struct omap_crtc *omap_crtc =
 			container_of(data, struct omap_crtc, update_work.work);
 	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
-	struct drm_device *dev = omap_crtc->base.dev;
+	struct drm_device *dev = omap_crtc->base.drm;
 	int ret;
 
 	if (!dssdev || !dssdev->dsi_ops || !dssdev->dsi_ops->update)
@@ -394,7 +394,7 @@ static void omap_crtc_cpr_coefs_from_ctm(const struct drm_color_ctm *ctm,
 
 static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_overlay_manager_info info;
 
@@ -447,7 +447,7 @@ static void omap_crtc_arm_event(struct drm_crtc *crtc)
 static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	int ret;
@@ -465,26 +465,26 @@ static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
 	ret = drm_crtc_vblank_get(crtc);
 	WARN_ON(ret != 0);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	omap_crtc_arm_event(crtc);
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static void omap_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 
 	DBG("%s", omap_crtc->name);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 
 	cancel_delayed_work(&omap_crtc->update_work);
 
@@ -499,7 +499,7 @@ static void omap_crtc_atomic_disable(struct drm_crtc *crtc,
 static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
 					const struct drm_display_mode *mode)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct videomode vm = {0};
 	int r;
@@ -615,7 +615,7 @@ static void omap_crtc_atomic_begin(struct drm_crtc *crtc,
 static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_crtc_state *omap_crtc_state = to_omap_crtc_state(crtc->state);
 	int ret;
@@ -644,20 +644,20 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	if (omap_crtc_state->manually_updated) {
 		/* send new image for page flips and modeset changes */
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		omap_crtc_flush(crtc);
 		omap_crtc_arm_event(crtc);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 		return;
 	}
 
 	ret = drm_crtc_vblank_get(crtc);
 	WARN_ON(ret != 0);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	dispc_mgr_go(priv->dispc, omap_crtc->channel);
 	omap_crtc_arm_event(crtc);
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static int omap_crtc_atomic_set_property(struct drm_crtc *crtc,
@@ -665,7 +665,7 @@ static int omap_crtc_atomic_set_property(struct drm_crtc *crtc,
 					 struct drm_property *property,
 					 u64 val)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm->dev_private;
 	struct drm_plane_state *plane_state;
 
 	/*
@@ -693,7 +693,7 @@ static int omap_crtc_atomic_get_property(struct drm_crtc *crtc,
 					 struct drm_property *property,
 					 u64 *val)
 {
-	struct omap_drm_private *priv = crtc->dev->dev_private;
+	struct omap_drm_private *priv = crtc->drm->dev_private;
 	struct omap_crtc_state *omap_state = to_omap_crtc_state(state);
 
 	if (property == crtc->primary->rotation_property)
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index a6f0bbc879d2..6308ca479056 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -78,7 +78,7 @@ int omap_irq_wait(struct drm_device *dev, struct omap_irq_wait *wait,
 
 int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 	enum omap_channel channel = omap_crtc_channel(crtc);
@@ -112,7 +112,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
  */
 int omap_irq_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 	enum omap_channel channel = omap_crtc_channel(crtc);
@@ -138,7 +138,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
  */
 void omap_irq_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct omap_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 	enum omap_channel channel = omap_crtc_channel(crtc);
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 9156a98a7218..72d457ff3575 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -489,12 +489,12 @@ static void ili9341_dbi_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	ret = mipi_dbi_poweron_conditional_reset(dbidev);
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8..7290c9ab81e5 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -51,7 +51,7 @@ static enum drm_mode_status
 pl111_mode_valid(struct drm_simple_display_pipe *pipe,
 		 const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = pipe->crtc.dev;
+	struct drm_device *drm = pipe->crtc.drm;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	u32 cpp = DIV_ROUND_UP(priv->variant->fb_depth, 8);
 	u64 bw;
@@ -122,7 +122,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane *plane = &pipe->plane;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	const struct drm_display_mode *mode = &cstate->mode;
 	struct drm_framebuffer *fb = plane->state->fb;
@@ -357,7 +357,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	u32 cntl;
 
@@ -390,7 +390,7 @@ static void pl111_display_update(struct drm_simple_display_pipe *pipe,
 				 struct drm_plane_state *old_pstate)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 	struct drm_pending_vblank_event *event = crtc->state->event;
 	struct drm_plane *plane = &pipe->plane;
@@ -406,19 +406,19 @@ static void pl111_display_update(struct drm_simple_display_pipe *pipe,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
 static int pl111_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
 	writel(CLCD_IRQ_NEXTBASE_UPDATE, priv->regs + priv->ienb);
@@ -429,7 +429,7 @@ static int pl111_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 static void pl111_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct pl111_drm_dev_private *priv = drm->dev_private;
 
 	writel(0, priv->regs + priv->ienb);
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index a5e0bbb014ce..3f86e1072f6a 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -315,7 +315,7 @@ static void qxl_send_monitors_config(struct qxl_device *qdev)
 static void qxl_crtc_update_monitors_config(struct drm_crtc *crtc,
 					    const char *reason)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct qxl_device *qdev = to_qxl(dev);
 	struct qxl_crtc *qcrtc = to_qxl_crtc(crtc);
 	struct qxl_head head;
diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index ade13173921b..a151cc0499d5 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -39,7 +39,7 @@ static void atombios_overscan_setup(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode,
 				    struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	SET_CRTC_OVERSCAN_PS_ALLOCATION args;
@@ -82,7 +82,7 @@ static void atombios_overscan_setup(struct drm_crtc *crtc,
 
 static void atombios_scaler_setup(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	ENABLE_SCALER_PS_ALLOCATION args;
@@ -167,7 +167,7 @@ static void atombios_scaler_setup(struct drm_crtc *crtc)
 static void atombios_lock_crtc(struct drm_crtc *crtc, int lock)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int index =
 	    GetIndexIntoMasterTable(COMMAND, UpdateCRTC_DoubleBufferRegisters);
@@ -184,7 +184,7 @@ static void atombios_lock_crtc(struct drm_crtc *crtc, int lock)
 static void atombios_enable_crtc(struct drm_crtc *crtc, int state)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int index = GetIndexIntoMasterTable(COMMAND, EnableCRTC);
 	ENABLE_CRTC_PS_ALLOCATION args;
@@ -200,7 +200,7 @@ static void atombios_enable_crtc(struct drm_crtc *crtc, int state)
 static void atombios_enable_crtc_memreq(struct drm_crtc *crtc, int state)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int index = GetIndexIntoMasterTable(COMMAND, EnableCRTCMemReq);
 	ENABLE_CRTC_PS_ALLOCATION args;
@@ -226,7 +226,7 @@ static const u32 vga_control_regs[6] =
 static void atombios_blank_crtc(struct drm_crtc *crtc, int state)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int index = GetIndexIntoMasterTable(COMMAND, BlankCRTC);
 	BLANK_CRTC_PS_ALLOCATION args;
@@ -251,7 +251,7 @@ static void atombios_blank_crtc(struct drm_crtc *crtc, int state)
 static void atombios_powergate_crtc(struct drm_crtc *crtc, int state)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int index = GetIndexIntoMasterTable(COMMAND, EnableDispPowerGating);
 	ENABLE_DISP_POWER_GATING_PARAMETERS_V2_1 args;
@@ -266,7 +266,7 @@ static void atombios_powergate_crtc(struct drm_crtc *crtc, int state)
 
 void atombios_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 
@@ -303,7 +303,7 @@ atombios_set_crtc_dtd_timing(struct drm_crtc *crtc,
 			     struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	SET_CRTC_USING_DTD_TIMING_PARAMETERS args;
 	int index = GetIndexIntoMasterTable(COMMAND, SetCRTC_UsingDTDTiming);
@@ -350,7 +350,7 @@ static void atombios_crtc_set_timing(struct drm_crtc *crtc,
 				     struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	SET_CRTC_TIMING_PARAMETERS_PS_ALLOCATION args;
 	int index = GetIndexIntoMasterTable(COMMAND, SetCRTC_Timing);
@@ -558,7 +558,7 @@ static u32 atombios_adjust_pll(struct drm_crtc *crtc,
 			       struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_encoder *encoder = radeon_crtc->encoder;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -826,7 +826,7 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
 				      bool ss_enabled,
 				      struct radeon_atom_ss *ss)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	u8 frev, crev;
 	int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
@@ -955,7 +955,7 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
 static bool atombios_crtc_prepare_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder =
 		to_radeon_encoder(radeon_crtc->encoder);
@@ -1053,7 +1053,7 @@ static bool atombios_crtc_prepare_pll(struct drm_crtc *crtc, struct drm_display_
 static void atombios_crtc_set_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder =
 		to_radeon_encoder(radeon_crtc->encoder);
@@ -1136,7 +1136,7 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 				 int x, int y, int atomic)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -1457,7 +1457,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 				  int x, int y, int atomic)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_gem_object *obj;
 	struct radeon_bo *rbo;
@@ -1663,7 +1663,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 int atombios_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 			   struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (ASIC_IS_DCE4(rdev))
@@ -1678,7 +1678,7 @@ int atombios_crtc_set_base_atomic(struct drm_crtc *crtc,
 				  struct drm_framebuffer *fb,
 				  int x, int y, enum mode_set_atomic state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (ASIC_IS_DCE4(rdev))
@@ -1692,7 +1692,7 @@ int atombios_crtc_set_base_atomic(struct drm_crtc *crtc,
 /* properly set additional regs when using atombios */
 static void radeon_legacy_atom_fixup(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	u32 disp_merge_cntl;
@@ -1722,7 +1722,7 @@ static void radeon_legacy_atom_fixup(struct drm_crtc *crtc)
  */
 static u32 radeon_get_pll_use_mask(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc *test_crtc;
 	struct radeon_crtc *test_radeon_crtc;
 	u32 pll_in_use = 0;
@@ -1749,7 +1749,7 @@ static u32 radeon_get_pll_use_mask(struct drm_crtc *crtc)
  */
 static int radeon_get_shared_dp_ppll(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_crtc *test_crtc;
 	struct radeon_crtc *test_radeon_crtc;
@@ -1783,7 +1783,7 @@ static int radeon_get_shared_dp_ppll(struct drm_crtc *crtc)
 static int radeon_get_shared_nondp_ppll(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_crtc *test_crtc;
 	struct radeon_crtc *test_radeon_crtc;
@@ -1862,7 +1862,7 @@ static int radeon_get_shared_nondp_ppll(struct drm_crtc *crtc)
 static int radeon_atom_pick_pll(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder =
 		to_radeon_encoder(radeon_crtc->encoder);
@@ -2043,7 +2043,7 @@ int atombios_crtc_mode_set(struct drm_crtc *crtc,
 			   int x, int y, struct drm_framebuffer *old_fb)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder =
 		to_radeon_encoder(radeon_crtc->encoder);
@@ -2086,7 +2086,7 @@ static bool atombios_crtc_mode_fixup(struct drm_crtc *crtc,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the radeon crtc to avoid repeated lookups later */
@@ -2124,7 +2124,7 @@ static bool atombios_crtc_mode_fixup(struct drm_crtc *crtc,
 
 static void atombios_crtc_prepare(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	/* disable crtc pair power gating before programming */
@@ -2144,7 +2144,7 @@ static void atombios_crtc_commit(struct drm_crtc *crtc)
 static void atombios_crtc_disable(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_atom_ss ss;
 	int i;
diff --git a/drivers/gpu/drm/radeon/radeon_cursor.c b/drivers/gpu/drm/radeon/radeon_cursor.c
index 3507805b34bc..aeac0f08ec9f 100644
--- a/drivers/gpu/drm/radeon/radeon_cursor.c
+++ b/drivers/gpu/drm/radeon/radeon_cursor.c
@@ -31,7 +31,7 @@
 
 static void radeon_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -62,7 +62,7 @@ static void radeon_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void radeon_hide_cursor(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm->dev_private;
 
 	if (ASIC_IS_DCE4(rdev)) {
 		WREG32_IDX(EVERGREEN_CUR_CONTROL + radeon_crtc->crtc_offset,
@@ -90,7 +90,7 @@ static void radeon_hide_cursor(struct drm_crtc *crtc)
 static void radeon_show_cursor(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm->dev_private;
 
 	if (radeon_crtc->cursor_out_of_bounds)
 		return;
@@ -144,7 +144,7 @@ static void radeon_show_cursor(struct drm_crtc *crtc)
 static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm->dev_private;
 	int xorigin = 0, yorigin = 0;
 	int w = radeon_crtc->cursor_width;
 
@@ -182,7 +182,8 @@ static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 		 * crtc's lock as long as write access to this flag _always_
 		 * grabs all locks.
 		 */
-		list_for_each_entry(crtc_p, &crtc->dev->mode_config.crtc_list, head) {
+		list_for_each_entry(crtc_p, &crtc->drm->mode_config.crtc_list,
+				    head) {
 			if (crtc_p->enabled)
 				i++;
 		}
@@ -282,7 +283,7 @@ int radeon_crtc_cursor_set2(struct drm_crtc *crtc,
 			    int32_t hot_y)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm->dev_private;
 	struct drm_gem_object *obj;
 	struct radeon_bo *robj;
 	int ret;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 901e75ec70ff..6cf657c803b7 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -49,7 +49,7 @@
 static void avivo_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	u16 *r, *g, *b;
 	int i;
@@ -87,7 +87,7 @@ static void avivo_crtc_load_lut(struct drm_crtc *crtc)
 static void dce4_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	u16 *r, *g, *b;
 	int i;
@@ -121,7 +121,7 @@ static void dce4_crtc_load_lut(struct drm_crtc *crtc)
 static void dce5_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	u16 *r, *g, *b;
 	int i;
@@ -193,7 +193,7 @@ static void dce5_crtc_load_lut(struct drm_crtc *crtc)
 static void legacy_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	u16 *r, *g, *b;
 	int i;
@@ -220,7 +220,7 @@ static void legacy_crtc_load_lut(struct drm_crtc *crtc)
 
 void radeon_crtc_load_lut(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (!crtc->enabled)
@@ -462,7 +462,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
 		usleep_range(1000, 2000);
 
 	/* We borrow the event spin lock for protecting flip_status */
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm->event_lock, flags);
 
 	/* set the proper interrupt */
 	radeon_irq_kms_pflip_irq_get(rdev, radeon_crtc->crtc_id);
@@ -471,7 +471,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
 	radeon_page_flip(rdev, radeon_crtc->crtc_id, work->base, work->async);
 
 	radeon_crtc->flip_status = RADEON_FLIP_SUBMITTED;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 	up_read(&rdev->exclusive_lock);
 }
 
@@ -482,7 +482,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 					uint32_t target,
 					struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct drm_gem_object *obj;
@@ -583,11 +583,11 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 		crtc->funcs->get_vblank_counter(crtc);
 
 	/* We borrow the event spin lock for protecting flip_work */
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm->event_lock, flags);
 
 	if (radeon_crtc->flip_status != RADEON_FLIP_NONE) {
 		DRM_DEBUG_DRIVER("flip queue: crtc already busy\n");
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 		r = -EBUSY;
 		goto pflip_cleanup;
 	}
@@ -597,7 +597,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 	/* update crtc fb */
 	crtc->primary->fb = fb;
 
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 
 	queue_work(radeon_crtc->flip_queue, &work->flip_work);
 	return 0;
@@ -630,7 +630,7 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 	if (!set || !set->crtc)
 		return -EINVAL;
 
-	dev = set->crtc->dev;
+	dev = set->crtc->drm;
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0) {
@@ -1681,7 +1681,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_encoder *encoder;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
@@ -1985,7 +1985,7 @@ radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
 				 ktime_t *stime, ktime_t *etime,
 				 const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 
 	return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index e0214cf1b43b..c7220a6fce2c 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -760,7 +760,7 @@ void radeon_driver_postclose_kms(struct drm_device *dev,
  */
 u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	int vpos, hpos, stat;
 	u32 count;
@@ -830,7 +830,7 @@ u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc)
  */
 int radeon_enable_vblank_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct radeon_device *rdev = dev->dev_private;
 	unsigned long irqflags;
@@ -857,7 +857,7 @@ int radeon_enable_vblank_kms(struct drm_crtc *crtc)
  */
 void radeon_disable_vblank_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct radeon_device *rdev = dev->dev_private;
 	unsigned long irqflags;
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
index 825b351ff53c..bd699ef8156d 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
@@ -37,7 +37,7 @@
 static void radeon_overscan_setup(struct drm_crtc *crtc,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 
@@ -49,7 +49,7 @@ static void radeon_overscan_setup(struct drm_crtc *crtc,
 static void radeon_legacy_rmx_mode_set(struct drm_crtc *crtc,
 				       struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	int xres = mode->hdisplay;
@@ -297,7 +297,7 @@ static uint8_t radeon_compute_pll_gain(uint16_t ref_freq, uint16_t ref_div,
 static void radeon_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t crtc_ext_cntl = 0;
 	uint32_t mask;
@@ -374,7 +374,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 			 struct drm_framebuffer *fb,
 			 int x, int y, int atomic)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct drm_framebuffer *target_fb;
@@ -572,7 +572,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 
 static bool radeon_set_crtc_timing(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	const struct drm_framebuffer *fb = crtc->primary->fb;
@@ -732,7 +732,7 @@ static bool radeon_set_crtc_timing(struct drm_crtc *crtc, struct drm_display_mod
 
 static void radeon_set_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct drm_encoder *encoder;
@@ -1060,7 +1060,7 @@ static int radeon_crtc_mode_set(struct drm_crtc *crtc,
 
 static void radeon_crtc_prepare(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc *crtci;
 
 	/*
@@ -1073,7 +1073,7 @@ static void radeon_crtc_prepare(struct drm_crtc *crtc)
 
 static void radeon_crtc_commit(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc *crtci;
 
 	/*
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7e175dbfd892..99b279446c3c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -436,7 +436,7 @@ static void rcar_du_crtc_update_planes(struct rcar_du_crtc *rcrtc)
 void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc)
 {
 	struct drm_pending_vblank_event *event;
-	struct drm_device *dev = rcrtc->crtc.dev;
+	struct drm_device *dev = rcrtc->crtc.drm;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -457,7 +457,7 @@ void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc)
 
 static bool rcar_du_crtc_page_flip_pending(struct rcar_du_crtc *rcrtc)
 {
-	struct drm_device *dev = rcrtc->crtc.dev;
+	struct drm_device *dev = rcrtc->crtc.drm;
 	unsigned long flags;
 	bool pending;
 
@@ -703,7 +703,7 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 	/* Store the routes from the CRTC output to the DU outputs. */
 	rstate->outputs = 0;
 
-	drm_for_each_encoder_mask(encoder, crtc->dev,
+	drm_for_each_encoder_mask(encoder, crtc->drm,
 				  crtc_state->encoder_mask) {
 		struct rcar_du_encoder *renc;
 
@@ -802,12 +802,12 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 		rcar_mipi_dsi_pclk_disable(bridge);
 	}
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
@@ -843,7 +843,7 @@ static void rcar_du_crtc_atomic_flush(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
-	struct drm_device *dev = rcrtc->crtc.dev;
+	struct drm_device *dev = rcrtc->crtc.drm;
 	unsigned long flags;
 
 	rcar_du_crtc_update_planes(rcrtc);
@@ -1116,7 +1116,7 @@ static int rcar_du_crtc_set_crc_source(struct drm_crtc *crtc,
 	/* Perform an atomic commit to set the CRC source. */
 	drm_modeset_acquire_init(&ctx, 0);
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm);
 	if (!state) {
 		ret = -ENOMEM;
 		goto unlock;
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index ff1bdb1a3e54..c8d8f86cd67c 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -64,7 +64,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
 static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm->dev_private;
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	const struct drm_display_mode *mode = &crtc->mode;
 	u32 value;
@@ -121,7 +121,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 
 static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
 {
-	struct shmob_drm_device *sdev = scrtc->crtc.dev->dev_private;
+	struct shmob_drm_device *sdev = scrtc->crtc.drm->dev_private;
 	u32 value;
 
 	value = lcdc_read(sdev, LDCNT2R);
@@ -155,7 +155,7 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
 static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm->dev_private;
 	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
 	const struct shmob_drm_format_info *format;
 	struct drm_device *dev = sdev->ddev;
@@ -257,7 +257,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm->dev_private;
 
 	if (!scrtc->started)
 		return;
@@ -312,7 +312,7 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_crtc *crtc = &scrtc->crtc;
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm->dev_private;
 
 	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
 
@@ -352,7 +352,7 @@ static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
 				   struct drm_framebuffer *old_fb)
 {
 	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm->dev_private;
 	const struct shmob_drm_format_info *format;
 
 	format = shmob_drm_format_info(crtc->primary->fb->format->format);
@@ -394,7 +394,7 @@ static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
 void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
 {
 	struct drm_pending_vblank_event *event;
-	struct drm_device *dev = scrtc->crtc.dev;
+	struct drm_device *dev = scrtc->crtc.drm;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -414,7 +414,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
 				    struct drm_modeset_acquire_ctx *ctx)
 {
 	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
-	struct drm_device *dev = scrtc->crtc.dev;
+	struct drm_device *dev = scrtc->crtc.drm;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -457,7 +457,7 @@ static void shmob_drm_crtc_enable_vblank(struct shmob_drm_device *sdev,
 
 static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
 {
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm->dev_private;
 
 	shmob_drm_crtc_enable_vblank(sdev, true);
 
@@ -466,7 +466,7 @@ static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
 
 static void shmob_drm_disable_vblank(struct drm_crtc *crtc)
 {
-	struct shmob_drm_device *sdev = crtc->dev->dev_private;
+	struct shmob_drm_device *sdev = crtc->drm->dev_private;
 
 	shmob_drm_crtc_enable_vblank(sdev, false);
 }
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a530ecc4d207..d43418b8ec1d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -758,9 +758,9 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 
 out:
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -1567,7 +1567,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
 	 */
 	vop_wait_for_irq_handler(vop);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 		WARN_ON(vop->event);
@@ -1575,7 +1575,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
 		vop->event = crtc->state->event;
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 
 	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state,
 				       new_plane_state, i) {
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index ca73b8ccc29f..ab9d53cd34b2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -924,9 +924,9 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 	vop2_unlock(vop2);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 
 		crtc->state->event = NULL;
 	}
@@ -1564,7 +1564,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		polflags |= BIT(VSYNC_POSITIVE);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
+	drm_for_each_encoder_mask(encoder, crtc->drm,
+				  crtc_state->encoder_mask) {
 		struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
 
 		rk3568_set_intf_mux(vp, rkencoder->crtc_endpoint_id, polflags);
@@ -2060,7 +2061,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	vop2_cfg_done(vp);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 
 	if (crtc->state->event) {
 		WARN_ON(drm_crtc_vblank_get(crtc));
@@ -2068,7 +2069,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
@@ -2162,7 +2163,7 @@ static irqreturn_t vop2_isr(int irq, void *data)
 
 		if (irqs & VP_INT_FS_FIELD) {
 			drm_crtc_handle_vblank(crtc);
-			spin_lock(&crtc->dev->event_lock);
+			spin_lock(&crtc->drm->event_lock);
 			if (vp->event) {
 				u32 val = vop2_readl(vop2, RK3568_REG_CFG_DONE);
 
@@ -2172,7 +2173,7 @@ static irqreturn_t vop2_isr(int irq, void *data)
 					drm_crtc_vblank_put(crtc);
 				}
 			}
-			spin_unlock(&crtc->dev->event_lock);
+			spin_unlock(&crtc->drm->event_lock);
 
 			ret = IRQ_HANDLED;
 		}
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index e34750187b58..e435d5ef5736 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -672,7 +672,7 @@ static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
 static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc,
 							   const struct drm_display_mode *mode)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->dev);
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->drm);
 
 	if (mode->hdisplay != ssd130x->mode.hdisplay &&
 	    mode->vdisplay != ssd130x->mode.vdisplay)
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index b96fc6837b0d..7610d3b2138d 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -624,7 +624,7 @@ static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 	drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev,
+	drm_for_each_encoder_mask(encoder, crtc->drm,
 				  crtc->state->encoder_mask) {
 		dsi = encoder_to_dsi(encoder);
 
@@ -651,7 +651,7 @@ static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
-	struct drm_device *drm = dpu->base.dev;
+	struct drm_device *drm = dpu->base.drm;
 
 	drm_crtc_vblank_off(&dpu->base);
 
@@ -670,7 +670,7 @@ static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
 
 {
 	struct sprd_dpu *dpu = to_sprd_crtc(crtc);
-	struct drm_device *drm = dpu->base.dev;
+	struct drm_device *drm = dpu->base.drm;
 
 	sprd_dpu_flip(dpu);
 
diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 3c7154f2d5f3..fc26584fe29e 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -134,7 +134,7 @@ sti_crtc_mode_set_nofb(struct drm_crtc *crtc)
 static void sti_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	struct sti_mixer *mixer = to_sti_mixer(crtc);
 	struct sti_compositor *compo = dev_get_drvdata(mixer->dev);
 	struct drm_plane *p;
@@ -209,12 +209,12 @@ static void sti_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm->event_lock, flags);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 	}
 }
 
@@ -264,7 +264,7 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
 
 		/* Disable mixer only if all overlay planes (GDP and VDP)
 		 * are disabled */
-		list_for_each_entry(p, &crtc->dev->mode_config.plane_list,
+		list_for_each_entry(p, &crtc->drm->mode_config.plane_list,
 				    head) {
 			struct sti_plane *plane = to_sti_plane(p);
 
@@ -280,7 +280,7 @@ int sti_crtc_vblank_cb(struct notifier_block *nb,
 
 static int sti_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct sti_private *dev_priv = dev->dev_private;
 	struct sti_compositor *compo = dev_priv->compo;
@@ -299,7 +299,7 @@ static int sti_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void sti_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct sti_private *priv = drm_dev->dev_private;
 	struct sti_compositor *compo = priv->compo;
@@ -318,7 +318,7 @@ static int sti_crtc_late_register(struct drm_crtc *crtc)
 	struct sti_compositor *compo = dev_get_drvdata(mixer->dev);
 
 	if (drm_crtc_index(crtc) == 0)
-		sti_compositor_debugfs_init(compo, crtc->dev->primary);
+		sti_compositor_debugfs_init(compo, crtc->drm->primary);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index b8be4c1db423..b27b73975bc1 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -484,7 +484,7 @@ static const u32 ltdc_ycbcr2rgb_coeffs[DRM_COLOR_ENCODING_MAX][DRM_COLOR_RANGE_M
 
 static inline struct ltdc_device *crtc_to_ltdc(struct drm_crtc *crtc)
 {
-	return (struct ltdc_device *)crtc->dev->dev_private;
+	return (struct ltdc_device *) crtc->drm->dev_private;
 }
 
 static inline struct ltdc_device *plane_to_ltdc(struct drm_plane *plane)
@@ -775,7 +775,7 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 
 	DRM_DEBUG_DRIVER("\n");
 
@@ -798,7 +798,7 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	int layer_index = 0;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -891,7 +891,7 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
 static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct drm_connector_list_iter iter;
 	struct drm_connector *connector = NULL;
 	struct drm_encoder *encoder = NULL, *en_iter;
@@ -1034,7 +1034,7 @@ static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct drm_pending_vblank_event *event = crtc->state->event;
 
 	DRM_DEBUG_ATOMIC("\n");
@@ -1063,7 +1063,7 @@ static bool ltdc_crtc_get_scanout_position(struct drm_crtc *crtc,
 					   ktime_t *stime, ktime_t *etime,
 					   const struct drm_display_mode *mode)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct ltdc_device *ldev = ddev->dev_private;
 	int line, vactive_start, vactive_end, vtotal;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index c06d7cd45388..ec86a3221035 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -38,7 +38,7 @@ static struct drm_encoder *sun4i_crtc_get_encoder(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
 
-	drm_for_each_encoder(encoder, crtc->dev)
+	drm_for_each_encoder(encoder, crtc->drm)
 		if (encoder->crtc == crtc)
 			return encoder;
 
@@ -66,7 +66,7 @@ static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
 	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct sunxi_engine *engine = scrtc->engine;
 	unsigned long flags;
 
@@ -96,12 +96,12 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		if (drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
@@ -118,9 +118,9 @@ static void sun4i_crtc_atomic_disable(struct drm_crtc *crtc,
 	sun4i_tcon_set_status(scrtc->tcon, encoder, false);
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 
 		crtc->state->event = NULL;
 	}
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 6e78416e64b0..133175353fba 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1717,7 +1717,7 @@ static struct drm_info_list debugfs_files[] = {
 static int tegra_dc_late_register(struct drm_crtc *crtc)
 {
 	unsigned int i, count = ARRAY_SIZE(debugfs_files);
-	struct drm_minor *minor = crtc->dev->primary;
+	struct drm_minor *minor = crtc->drm->primary;
 	struct dentry *root;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 
@@ -1743,7 +1743,7 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 static void tegra_dc_early_unregister(struct drm_crtc *crtc)
 {
 	unsigned int count = ARRAY_SIZE(debugfs_files);
-	struct drm_minor *minor = crtc->dev->primary;
+	struct drm_minor *minor = crtc->drm->primary;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
 
 	drm_debugfs_remove_files(dc->debugfs_files, count, minor);
@@ -2119,14 +2119,14 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
 	tegra_dc_stats_reset(&dc->stats);
 	drm_crtc_vblank_off(crtc);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
 
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 
 	err = host1x_client_suspend(&dc->client);
 	if (err < 0)
@@ -2279,14 +2279,14 @@ static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
 	tegra_crtc_update_memory_bandwidth(crtc, state, true);
 
 	if (crtc->state->event) {
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm->event_lock, flags);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		else
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
 
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm->event_lock, flags);
 
 		crtc->state->event = NULL;
 	}
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 5e5e466f35d1..bd44d78783c4 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -20,7 +20,7 @@
 
 static void tidss_crtc_finish_page_flip(struct tidss_crtc *tcrtc)
 {
-	struct drm_device *ddev = tcrtc->crtc.dev;
+	struct drm_device *ddev = tcrtc->crtc.drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct drm_pending_vblank_event *event;
 	unsigned long flags;
@@ -75,7 +75,7 @@ void tidss_crtc_error_irq(struct drm_crtc *crtc, u64 irqstatus)
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 
-	dev_err_ratelimited(crtc->dev->dev, "CRTC%u SYNC LOST: (irq %llx)\n",
+	dev_err_ratelimited(crtc->drm->dev, "CRTC%u SYNC LOST: (irq %llx)\n",
 			    tcrtc->hw_videoport, irqstatus);
 }
 
@@ -86,7 +86,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct dispc_device *dispc = tidss->dispc;
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
@@ -165,7 +165,7 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
 									      crtc);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 
@@ -218,7 +218,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	unsigned long flags;
@@ -261,7 +261,7 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 				      struct drm_atomic_state *state)
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	unsigned long flags;
 
@@ -297,7 +297,7 @@ enum drm_mode_status tidss_crtc_mode_valid(struct drm_crtc *crtc,
 					   const struct drm_display_mode *mode)
 {
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 
 	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
@@ -316,7 +316,7 @@ static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs = {
 
 static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
@@ -330,7 +330,7 @@ static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
 
 static void tidss_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 0c681c7600bc..372f597f2b46 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -25,7 +25,7 @@ static void tidss_irq_update(struct tidss_device *tidss)
 
 void tidss_irq_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
@@ -40,7 +40,7 @@ void tidss_irq_enable_vblank(struct drm_crtc *crtc)
 
 void tidss_irq_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *ddev = crtc->dev;
+	struct drm_device *ddev = crtc->drm;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
 	u32 hw_videoport = tcrtc->hw_videoport;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e..429fb75836b2 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -62,7 +62,7 @@ struct tilcdc_crtc {
 
 static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct drm_gem_dma_object *gem;
 	dma_addr_t start, end;
@@ -97,7 +97,7 @@ static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	int ret;
 
@@ -176,7 +176,7 @@ static void tilcdc_crtc_disable_irqs(struct drm_device *dev)
 
 static void reset(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 
 	if (priv->rev != 2)
@@ -201,7 +201,7 @@ static unsigned int tilcdc_pclk_diff(unsigned long rate,
 
 static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	unsigned long clk_rate, real_pclk_rate, pclk_rate;
@@ -273,7 +273,7 @@ static uint tilcdc_mode_hvtotal(const struct drm_display_mode *mode)
 static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	const struct tilcdc_panel_info *info = tilcdc_crtc->info;
 	uint32_t reg, hbp, hfp, hsw, vbp, vfp, vsw;
@@ -442,7 +442,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 
 static void tilcdc_crtc_enable(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	unsigned long flags;
 
@@ -491,7 +491,7 @@ static void tilcdc_crtc_atomic_enable(struct drm_crtc *crtc,
 static void tilcdc_crtc_off(struct drm_crtc *crtc, bool shutdown)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	int ret;
 
 	mutex_lock(&tilcdc_crtc->enable_lock);
@@ -517,14 +517,14 @@ static void tilcdc_crtc_off(struct drm_crtc *crtc, bool shutdown)
 
 	drm_crtc_vblank_off(crtc);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
 
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 
 	tilcdc_crtc_disable_irqs(dev);
 
@@ -551,10 +551,10 @@ static void tilcdc_crtc_atomic_flush(struct drm_crtc *crtc,
 	if (!crtc->state->event)
 		return;
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	drm_crtc_send_vblank_event(crtc, crtc->state->event);
 	crtc->state->event = NULL;
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 }
 
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc)
@@ -573,7 +573,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 		container_of(work, struct tilcdc_crtc, recover_work);
 	struct drm_crtc *crtc = &tilcdc_crtc->base;
 
-	dev_info(crtc->dev->dev, "%s: Reset CRTC", __func__);
+	dev_info(crtc->drm->dev, "%s: Reset CRTC", __func__);
 
 	drm_modeset_lock(&crtc->mutex, NULL);
 
@@ -588,7 +588,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 
 static void tilcdc_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = crtc->drm->dev_private;
 
 	tilcdc_crtc_shutdown(crtc);
 
@@ -603,7 +603,7 @@ int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
 		struct drm_pending_vblank_event *event)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 
 	if (tilcdc_crtc->event) {
 		dev_err(dev->dev, "already pending page flip!\n");
@@ -679,7 +679,7 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 	if (state->planes[0].ptr != crtc->primary ||
 	    state->planes[0].state == NULL ||
 	    state->planes[0].state->crtc != crtc) {
-		dev_dbg(crtc->dev->dev, "CRTC primary plane must be present");
+		dev_dbg(crtc->drm->dev, "CRTC primary plane must be present");
 		return -EINVAL;
 	}
 
@@ -689,7 +689,7 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 
@@ -712,7 +712,7 @@ static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	unsigned long flags;
 
@@ -731,7 +731,7 @@ static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
 static void tilcdc_crtc_reset(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	int ret;
 
 	drm_atomic_helper_crtc_reset(crtc);
@@ -771,7 +771,7 @@ static enum drm_mode_status
 tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
 		       const struct drm_display_mode *mode)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = crtc->drm->dev_private;
 	unsigned int bandwidth;
 	uint32_t hbp, hfp, hsw, vbp, vfp, vsw;
 
@@ -883,7 +883,7 @@ void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
 
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 
@@ -907,7 +907,7 @@ void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct tilcdc_drm_private *priv = dev->dev_private;
 	uint32_t stat, reg;
 
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index d254679a136e..56bcd307c0c9 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -440,7 +440,7 @@ static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
 			      struct drm_crtc_state *crtc_state,
 			      struct drm_plane_state *plane_state)
 {
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+	struct bochs_device *bochs = pipe->crtc.drm->dev_private;
 
 	bochs_hw_setmode(bochs, &crtc_state->mode);
 	bochs_plane_update(bochs, plane_state);
@@ -448,7 +448,7 @@ static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+	struct bochs_device *bochs = pipe->crtc.drm->dev_private;
 
 	bochs_hw_blank(bochs, true);
 }
@@ -456,7 +456,7 @@ static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
 static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
 			      struct drm_plane_state *old_state)
 {
-	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+	struct bochs_device *bochs = pipe->crtc.drm->dev_private;
 
 	bochs_plane_update(bochs, pipe->plane.state);
 }
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 3d3d6c8fd92e..2f6763999360 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -499,7 +499,7 @@ static int cirrus_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_ato
 static void cirrus_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 					     struct drm_atomic_state *state)
 {
-	struct cirrus_device *cirrus = to_cirrus(crtc->dev);
+	struct cirrus_device *cirrus = to_cirrus(crtc->drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	int idx;
 
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index c5bb683e440c..e6279a9916ef 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -554,7 +554,7 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
 				 struct drm_plane_state *plane_state)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.drm);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
@@ -563,7 +563,7 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
+	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.drm);
 
 	gm12u320_stop_fb_update(gm12u320);
 }
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index cdc4486e059b..0c2875df66c5 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -48,12 +48,12 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 			     struct drm_crtc_state *crtc_state,
 			     struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index bc4384d410fc..e5e4d5f62839 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -37,12 +37,12 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 			     struct drm_crtc_state *crtc_state,
 			     struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 077c6ff5a2e1..ec33dc530a17 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -180,10 +180,10 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
-	struct device *dev = pipe->crtc.dev->dev;
+	struct device *dev = pipe->crtc.drm->dev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	struct drm_rect rect = {
 		.x1 = 0,
@@ -194,7 +194,7 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 	int ret, idx;
 	u8 am_id;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -289,7 +289,7 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void ili9225_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 47b61c3bf145..94092848f554 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -54,12 +54,12 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 			     struct drm_crtc_state *crtc_state,
 			     struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 02265c898816..3a1a7a35a46f 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -92,12 +92,12 @@ static void waveshare_enable(struct drm_simple_display_pipe *pipe,
 			     struct drm_crtc_state *crtc_state,
 			     struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 01ff43c8ac3f..4ccc752290df 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -52,12 +52,12 @@ static void mi0283qt_enable(struct drm_simple_display_pipe *pipe,
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	u8 addr_mode;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index dbf053d603af..ddc0ddb29434 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -876,7 +876,7 @@ static const struct drm_plane_funcs ofdrm_primary_plane_funcs = {
 static enum drm_mode_status ofdrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
 							 const struct drm_display_mode *mode)
 {
-	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
+	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->drm);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &odev->mode);
 }
@@ -886,7 +886,7 @@ static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 {
 	static const size_t gamma_lut_length = OFDRM_GAMMA_LUT_SIZE * sizeof(struct drm_color_lut);
 
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
 	int ret;
 
@@ -911,7 +911,7 @@ static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 
 static void ofdrm_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
+	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct ofdrm_crtc_state *ofdrm_crtc_state = to_ofdrm_crtc_state(crtc_state);
 
@@ -952,7 +952,7 @@ static void ofdrm_crtc_reset(struct drm_crtc *crtc)
 
 static struct drm_crtc_state *ofdrm_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
 	struct ofdrm_crtc_state *ofdrm_crtc_state;
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index eb9f13f18a02..586c54dd579d 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -191,14 +191,14 @@ static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
 				  struct drm_crtc_state *crtc_state,
 				  struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
-	drm_dbg(pipe->crtc.dev, "\n");
+	drm_dbg(pipe->crtc.drm, "\n");
 
 	ret = mipi_dbi_poweron_conditional_reset(dbidev);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index f884b2712bde..2a459960d10c 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -625,7 +625,7 @@ static enum drm_mode_status repaper_pipe_mode_valid(struct drm_simple_display_pi
 						    const struct drm_display_mode *mode)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct repaper_epd *epd = drm_to_epd(crtc->dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->drm);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, epd->mode);
 }
@@ -634,13 +634,13 @@ static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(pipe->crtc.drm);
 	struct spi_device *spi = epd->spi;
 	struct device *dev = &spi->dev;
 	bool dc_ok = false;
 	int i, ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -772,7 +772,7 @@ static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(pipe->crtc.drm);
 	struct spi_device *spi = epd->spi;
 	unsigned int line;
 
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index fa511aff2545..be02d12f80eb 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -548,7 +548,7 @@ static const struct drm_plane_funcs simpledrm_primary_plane_funcs = {
 static enum drm_mode_status simpledrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
 							     const struct drm_display_mode *mode)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(crtc->dev);
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(crtc->drm);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sdev->mode);
 }
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 3cf4eec16a81..493dee2446d8 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -169,7 +169,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct mipi_dbi *dbi = &dbidev->dbi;
@@ -182,7 +182,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 	int idx, ret;
 	u8 addr_mode;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
@@ -247,7 +247,7 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void st7586_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 
 	/*
 	 * This callback is not protected by drm_dev_enter/exit since we want to
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 477eb36fbb70..26eb2b5446de 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -59,14 +59,14 @@ static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm);
 	struct st7735r_priv *priv = container_of(dbidev, struct st7735r_priv,
 						 dbidev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret, idx;
 	u8 addr_mode;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	DRM_DEBUG_KMS("\n");
diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 37bdd976ae59..606462761ee2 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -124,7 +124,7 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 {
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane *plane = &pipe->plane;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 	const struct drm_display_mode *mode = &cstate->mode;
 	struct drm_framebuffer *fb = plane->state->fb;
@@ -242,7 +242,7 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
 static void tve200_display_disable(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
 	drm_crtc_vblank_off(crtc);
@@ -258,7 +258,7 @@ static void tve200_display_update(struct drm_simple_display_pipe *pipe,
 				 struct drm_plane_state *old_pstate)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 	struct drm_pending_vblank_event *event = crtc->state->event;
 	struct drm_plane *plane = &pipe->plane;
@@ -282,19 +282,19 @@ static void tve200_display_update(struct drm_simple_display_pipe *pipe,
 	if (event) {
 		crtc->state->event = NULL;
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		if (crtc->state->active && drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
 static int tve200_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
 	/* Clear any IRQs and enable */
@@ -306,7 +306,7 @@ static int tve200_display_enable_vblank(struct drm_simple_display_pipe *pipe)
 static void tve200_display_disable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct tve200_drm_dev_private *priv = drm->dev_private;
 
 	writel(0, priv->regs + TVE200_INT_EN);
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 1c85223b4bdc..5a36bb90dbd3 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -322,7 +322,7 @@ static int udl_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic
 
 static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_display_mode *mode = &crtc_state->mode;
 	struct urb *urb;
@@ -356,7 +356,7 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 
 static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct urb *urb;
 	char *buf;
 	int idx;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index d7326d6b9062..ea5ceb51bd70 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -41,7 +41,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
 	u16 flags;
 	s32 x_offset, y_offset;
 
-	vbox = to_vbox_dev(crtc->dev);
+	vbox = to_vbox_dev(crtc->drm);
 	width = vbox_crtc->width ? vbox_crtc->width : 640;
 	height = vbox_crtc->height ? vbox_crtc->height : 480;
 	bpp = fb ? fb->format->cpp[0] * 8 : 32;
@@ -82,7 +82,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
 static int vbox_set_view(struct drm_crtc *crtc)
 {
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
-	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
+	struct vbox_private *vbox = to_vbox_dev(crtc->drm);
 	struct vbva_infoview *p;
 
 	/*
@@ -179,7 +179,7 @@ static void vbox_crtc_set_base_and_mode(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
-	struct vbox_private *vbox = to_vbox_dev(crtc->dev);
+	struct vbox_private *vbox = to_vbox_dev(crtc->drm);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(crtc);
 	bool needs_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
 
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 7610e841ef3c..d5dc0d3bdce3 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -99,7 +99,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 					  ktime_t *stime, ktime_t *etime,
 					  const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -220,7 +220,7 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 {
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
-	struct vc4_dev *vc4 = to_vc4_dev(vc4_crtc->base.dev);
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_crtc->base.drm);
 	u32 fifo_len_bytes = pv_data->fifo_depth;
 
 	/*
@@ -296,7 +296,7 @@ struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
 
 	WARN_ON(hweight32(state->encoder_mask) > 1);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm, state->encoder_mask)
 		return encoder;
 
 	return NULL;
@@ -305,7 +305,7 @@ struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
 static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
@@ -321,7 +321,7 @@ static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -468,7 +468,7 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 {
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int idx, ret;
 
@@ -514,7 +514,7 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 
 int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 {
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	enum vc4_encoder_type encoder_type;
@@ -571,7 +571,7 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 
 void vc4_crtc_send_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned long flags;
 
 	if (!crtc->state || !crtc->state->event)
@@ -590,7 +590,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 									 crtc);
 	struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 
 	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
@@ -614,7 +614,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state,
 									 crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, new_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
@@ -747,7 +747,7 @@ int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 static int vc4_enable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
@@ -763,7 +763,7 @@ static int vc4_enable_vblank(struct drm_crtc *crtc)
 static void vc4_disable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	int idx;
 
 	if (!drm_dev_enter(dev, &idx))
@@ -777,7 +777,7 @@ static void vc4_disable_vblank(struct drm_crtc *crtc)
 static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 {
 	struct drm_crtc *crtc = &vc4_crtc->base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	u32 chan = vc4_crtc->current_hvs_channel;
@@ -845,7 +845,7 @@ static void
 vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
 {
 	struct drm_crtc *crtc = flip_state->crtc;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_plane *plane = crtc->primary;
 
 	vc4_plane_async_set_fb(plane, flip_state->fb);
@@ -943,7 +943,7 @@ vc4_async_page_flip_common(struct drm_crtc *crtc,
 			   struct drm_pending_vblank_event *event,
 			   uint32_t flags)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct drm_plane *plane = crtc->primary;
 	struct vc4_async_flip_state *flip_state;
 
@@ -993,7 +993,7 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *event,
 			       uint32_t flags)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_gem_dma_object *dma_bo = drm_fb_dma_get_gem_obj(fb, 0);
 	struct vc4_bo *bo = to_vc4_bo(&dma_bo->base);
@@ -1039,7 +1039,7 @@ int vc4_page_flip(struct drm_crtc *crtc,
 		  struct drm_modeset_acquire_ctx *ctx)
 {
 	if (flags & DRM_MODE_PAGE_FLIP_ASYNC) {
-		struct drm_device *dev = crtc->dev;
+		struct drm_device *dev = crtc->drm;
 		struct vc4_dev *vc4 = to_vc4_dev(dev);
 
 		if (vc4->is_vc5)
@@ -1070,7 +1070,7 @@ struct drm_crtc_state *vc4_crtc_duplicate_state(struct drm_crtc *crtc)
 void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 			    struct drm_crtc_state *state)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(crtc->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(crtc->drm);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
 
 	if (drm_mm_node_allocated(&vc4_state->mm)) {
@@ -1104,7 +1104,7 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
 
 int vc4_crtc_late_register(struct drm_crtc *crtc)
 {
-	struct drm_device *drm = crtc->dev;
+	struct drm_device *drm = crtc->drm;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5e53d4f8232d..58388eb9237f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -304,7 +304,7 @@ static int reset_pipe(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm);
 	if (!state)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 04af672caacb..488a207024c7 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -442,7 +442,7 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane;
 	unsigned long flags;
@@ -473,7 +473,7 @@ int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 
 static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
@@ -490,7 +490,7 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 
 static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	unsigned long flags;
@@ -530,7 +530,7 @@ void vc4_hvs_atomic_begin(struct drm_crtc *crtc,
 void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 			   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -544,7 +544,7 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
 			    struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(old_state);
@@ -558,7 +558,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
 									 crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 4091fd872d65..ec46ea639dd2 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -433,7 +433,7 @@ static void vc4_txp_atomic_enable(struct drm_crtc *crtc,
 static void vc4_txp_atomic_disable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 
 	/* Disable vblank irq handling before crtc is disabled. */
 	drm_crtc_vblank_off(crtc);
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 6f9cc844412b..ad8941a0b6b7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -85,7 +85,7 @@ virtio_gpu_framebuffer_init(struct drm_device *dev,
 
 static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
@@ -103,7 +103,7 @@ static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
 static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
 					   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 515f6772b866..a953f06303fa 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -61,7 +61,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
@@ -87,7 +87,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      int *max_error, ktime_t *vblank_time,
 				      bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned int pipe = crtc->index;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_output *output = &vkmsdev->output;
@@ -190,7 +190,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret < 0)
 		return ret;
 
-	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
+	drm_for_each_plane_mask(plane, crtc->drm, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
 								  plane);
 		WARN_ON(!plane_state);
@@ -207,7 +207,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	vkms_state->num_active_planes = i;
 
 	i = 0;
-	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
+	drm_for_each_plane_mask(plane, crtc->drm, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state,
 								  plane);
 
@@ -250,14 +250,14 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
 
 	if (crtc->state->event) {
-		spin_lock(&crtc->dev->event_lock);
+		spin_lock(&crtc->drm->event_lock);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		else
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
 
-		spin_unlock(&crtc->dev->event_lock);
+		spin_unlock(&crtc->drm->event_lock);
 
 		crtc->state->event = NULL;
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index e7cad0200f9b..c332ad7e4e8f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -762,7 +762,7 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
 	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
-	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+	struct vmw_private *dev_priv = vmw_priv(crtc->drm);
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
 	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
@@ -2240,7 +2240,7 @@ int vmw_du_crtc_gamma_set(struct drm_crtc *crtc,
 			  uint32_t size,
 			  struct drm_modeset_acquire_ctx *ctx)
 {
-	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+	struct vmw_private *dev_priv = vmw_priv(crtc->drm);
 	int i;
 
 	for (i = 0; i < size; i++) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 556a403b7eb5..00416a640d17 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -219,7 +219,7 @@ static void vmw_sou_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	int ret;
 
 	sou = vmw_crtc_to_sou(crtc);
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm);
 	ps = crtc->primary->state;
 	fb = ps->fb;
 	vps = vmw_plane_state_to_vps(ps);
@@ -303,7 +303,7 @@ static void vmw_sou_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 
 	sou = vmw_crtc_to_sou(crtc);
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm);
 
 	if (sou->defined) {
 		ret = vmw_sou_fifo_destroy(dev_priv, sou);
@@ -384,7 +384,7 @@ vmw_sou_primary_plane_cleanup_fb(struct drm_plane *plane,
 		plane->state->crtc : old_state->crtc;
 
 	if (vps->bo)
-		vmw_bo_unpin(vmw_priv(crtc->dev), vps->bo, false);
+		vmw_bo_unpin(vmw_priv(crtc->drm), vps->bo, false);
 	vmw_bo_unreference(&vps->bo);
 	vps->bo_size = 0;
 
@@ -426,7 +426,7 @@ vmw_sou_primary_plane_prepare_fb(struct drm_plane *plane,
 	}
 
 	bo_params.size = new_state->crtc_w * new_state->crtc_h * 4;
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm);
 
 	if (vps->bo) {
 		if (vps->bo_size == bo_params.size) {
@@ -730,7 +730,7 @@ vmw_sou_primary_plane_atomic_update(struct drm_plane *plane,
 
 	/* In case of device error, maintain consistent atomic state */
 	if (crtc && new_state->fb) {
-		struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+		struct vmw_private *dev_priv = vmw_priv(crtc->drm);
 		struct vmw_framebuffer *vfb =
 			vmw_framebuffer_to_vfb(new_state->fb);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index ba0c0e12cfe9..b3c3cdba00a8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -371,7 +371,7 @@ static void vmw_stdu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	int x, y, ret;
 
 	stdu = vmw_crtc_to_stdu(crtc);
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm);
 	conn_state = stdu->base.connector.state;
 	vmw_conn_state = vmw_connector_state_to_vcs(conn_state);
 
@@ -427,7 +427,7 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 
 	stdu     = vmw_crtc_to_stdu(crtc);
-	dev_priv = vmw_priv(crtc->dev);
+	dev_priv = vmw_priv(crtc->drm);
 
 	if (stdu->defined) {
 		ret = vmw_stdu_bind_st(dev_priv, stdu, NULL);
@@ -1363,7 +1363,7 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 		struct vmw_framebuffer *vfb =
 			vmw_framebuffer_to_vfb(new_state->fb);
 		stdu = vmw_crtc_to_stdu(crtc);
-		dev_priv = vmw_priv(crtc->dev);
+		dev_priv = vmw_priv(crtc->drm);
 
 		stdu->display_srf = vps->surf;
 		stdu->content_fb_type = vps->content_fb_type;
@@ -1385,7 +1385,7 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 	} else {
 		crtc = old_state->crtc;
 		stdu = vmw_crtc_to_stdu(crtc);
-		dev_priv = vmw_priv(crtc->dev);
+		dev_priv = vmw_priv(crtc->drm);
 
 		/* Blank STDU when fb and crtc are NULL */
 		if (!stdu->defined)
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index dfa78a49a6d9..da01d713b87f 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -93,7 +93,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 static void send_pending_event(struct xen_drm_front_drm_pipeline *pipeline)
 {
 	struct drm_crtc *crtc = &pipeline->pipe.crtc;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -113,7 +113,7 @@ static void display_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = plane_state->fb;
 	int ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(pipe->crtc.drm, &idx))
 		return;
 
 	ret = xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
@@ -135,7 +135,7 @@ static void display_disable(struct drm_simple_display_pipe *pipe)
 			to_xen_drm_pipeline(pipe);
 	int ret = 0, idx;
 
-	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (drm_dev_enter(pipe->crtc.drm, &idx)) {
 		ret = xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
 					     xen_drm_front_fb_to_cookie(NULL));
 		drm_dev_exit(idx);
@@ -251,7 +251,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 
 	event = crtc->state->event;
 	if (event) {
-		struct drm_device *dev = crtc->dev;
+		struct drm_device *dev = crtc->drm;
 		unsigned long flags;
 
 		WARN_ON(pipeline->pending_event);
@@ -263,7 +263,7 @@ static void display_update(struct drm_simple_display_pipe *pipe,
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx)) {
+	if (!drm_dev_enter(pipe->crtc.drm, &idx)) {
 		send_pending_event(pipeline);
 		return;
 	}
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index a7f8611be6f4..37bbfd838499 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -232,12 +232,12 @@ static void zynqmp_dpsub_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 
-	spin_lock_irq(&crtc->dev->event_lock);
+	spin_lock_irq(&crtc->drm->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
 	}
-	spin_unlock_irq(&crtc->dev->event_lock);
+	spin_unlock_irq(&crtc->drm->event_lock);
 
 	clk_disable_unprepare(dpsub->vid_clk);
 	pm_runtime_put_sync(dpsub->dev);
@@ -269,9 +269,9 @@ static void zynqmp_dpsub_crtc_atomic_flush(struct drm_crtc *crtc,
 
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 
-		spin_lock_irq(&crtc->dev->event_lock);
+		spin_lock_irq(&crtc->drm->event_lock);
 		drm_crtc_arm_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
+		spin_unlock_irq(&crtc->drm->event_lock);
 	}
 }
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index cdddabfc5d57..306badaccd00 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -173,7 +173,7 @@ int drm_atomic_helper_page_flip_target(
  * drm_atomic_crtc_state_for_each_plane().
  */
 #define drm_atomic_crtc_for_each_plane(plane, crtc) \
-	drm_for_each_plane_mask(plane, (crtc)->dev, (crtc)->state->plane_mask)
+	drm_for_each_plane_mask(plane, (crtc)->drm, (crtc)->state->plane_mask)
 
 /**
  * drm_atomic_crtc_state_for_each_plane - iterate over attached planes in new state
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8e1cbc75143e..4762786518d3 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -935,8 +935,8 @@ struct drm_crtc_funcs {
  * allows the CRTC to be controlled.
  */
 struct drm_crtc {
-	/** @dev: parent DRM device */
-	struct drm_device *dev;
+	/** @drm: parent DRM device */
+	struct drm_device *drm;
 	/** @port: OF node used by drm_of_find_possible_crtcs(). */
 	struct device_node *port;
 	/**
-- 
2.39.2

