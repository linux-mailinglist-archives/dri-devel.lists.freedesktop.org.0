Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2447521F2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 14:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A6910E69C;
	Thu, 13 Jul 2023 12:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610F010E625
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:26:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-0005qO-Un; Thu, 13 Jul 2023 10:24:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-00E4jG-7Y; Thu, 13 Jul 2023 10:24:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrca-004Vgw-Tu; Thu, 13 Jul 2023 10:24:21 +0200
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
Subject: [PATCH 04/17] drm/connector: Rename struct drm_connector::dev to drm
Date: Thu, 13 Jul 2023 10:23:55 +0200
Message-Id: <20230713082408.2266984-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=351283;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=6n0d9tZjqcSRx+5Op+FUpdpxnLGSEGLNkU8pL1BWW6o=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7SHPiz19OpUeKkACOTXrlxixzpeb0e1UUbch
 cPxXj5SxtOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0hwAKCRCPgPtYfRL+
 TuvxB/9R70AJvhvU9PGRD6uzeiqwsH/fUV8cCVs5mf67xyT5rQc6Bu2D2ByisAgrby1dV1d3R1C
 G33RdhYkCBlvg0K08hd/BSV4eU9Uf6a9ASBklKMXas4n3/6pBNWVdY23H8ciP1Zl77wtDd4wK5g
 sbtQteeEvqubOrDWpv/ROGA65RhcaSnzOSn8ZOlQUpyOf1Yb9EnoImIT3B0IvP/R7Dy4lW7onls
 HyOyd1aqGpcnirYlwrgfj9NTMaOABtx6mzzMG7La1ainy6quAaqPyze0zgZNqiIax31ankSh57u
 GPhG3SwEWNu6vY4d9Dz2fsAvFRXAS4sDSx2o8h7R9+8bEZ7L
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
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  52 +++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |   4 +-
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |   4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  42 +++---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  26 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    |   2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   6 +-
 .../arm/display/komeda/komeda_wb_connector.c  |   2 +-
 drivers/gpu/drm/arm/malidp_mw.c               |   4 +-
 drivers/gpu/drm/ast/ast_mode.c                |  10 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |   4 +-
 .../drm/bridge/analogix/analogix-anx78xx.c    |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |   8 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c      |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c    |   6 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |   2 +-
 drivers/gpu/drm/bridge/panel.c                |   2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |   2 +-
 drivers/gpu/drm/display/drm_dp_cec.c          |   2 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |   2 +-
 drivers/gpu/drm/display/drm_hdcp_helper.c     |   4 +-
 drivers/gpu/drm/display/drm_scdc_helper.c     |  10 +-
 drivers/gpu/drm/drm_atomic.c                  |  11 +-
 drivers/gpu/drm/drm_atomic_helper.c           |  26 ++--
 drivers/gpu/drm/drm_atomic_state_helper.c     |   2 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  14 +-
 drivers/gpu/drm/drm_bridge_connector.c        |   2 +-
 drivers/gpu/drm/drm_connector.c               |  75 +++++-----
 drivers/gpu/drm/drm_crtc_helper.c             |   2 +-
 drivers/gpu/drm/drm_debugfs.c                 |   2 +-
 drivers/gpu/drm/drm_edid.c                    | 134 ++++++++++--------
 drivers/gpu/drm/drm_edid_load.c               |  10 +-
 drivers/gpu/drm/drm_mipi_dbi.c                |   2 +-
 drivers/gpu/drm/drm_modes.c                   |   6 +-
 drivers/gpu/drm/drm_probe_helper.c            |  23 +--
 drivers/gpu/drm/drm_sysfs.c                   |  20 +--
 drivers/gpu/drm/drm_writeback.c               |   2 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |   2 +-
 drivers/gpu/drm/gma500/cdv_device.c           |   4 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c        |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |   6 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |   4 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |   4 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c        |   2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |   8 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  16 +--
 drivers/gpu/drm/gud/gud_connector.c           |  22 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |   4 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   6 +-
 drivers/gpu/drm/i2c/tda998x_drv.c             |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   4 +-
 .../gpu/drm/i915/display/intel_backlight.c    | 112 +++++++--------
 .../gpu/drm/i915/display/intel_connector.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   2 +-
 .../drm/i915/display/intel_display_debugfs.c  |  12 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  30 ++--
 .../drm/i915/display/intel_dp_aux_backlight.c |  12 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |   8 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  16 +--
 drivers/gpu/drm/i915/display/intel_dsi.c      |   6 +-
 .../i915/display/intel_dsi_dcs_backlight.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   8 +-
 drivers/gpu/drm/i915/display/intel_dvo.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  84 +++++------
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  24 ++--
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |   2 +-
 .../drm/i915/display/intel_modeset_verify.c   |   5 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  22 +--
 drivers/gpu/drm/i915/display/intel_pps.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  12 +-
 drivers/gpu/drm/i915/display/intel_tv.c       |  12 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      |   2 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   2 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   4 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |   8 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c               |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c        |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  26 ++--
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |   6 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  44 +++---
 drivers/gpu/drm/omapdrm/dss/venc.c            |   2 +-
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  |   2 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c   |   2 +-
 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  |   2 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c   |   2 +-
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    |   2 +-
 drivers/gpu/drm/panel/panel-boe-himax8279d.c  |   2 +-
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |   2 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c          |   2 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c     |   2 +-
 drivers/gpu/drm/panel/panel-edp.c             |   6 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  |   2 +-
 .../gpu/drm/panel/panel-feixin-k101-im2ba02.c |   2 +-
 .../drm/panel/panel-feiyang-fy07024di26a30d.c |   2 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c    |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c  |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c |   2 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c |   2 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c |   2 +-
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  |   2 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c  |   2 +-
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    |   2 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c    |   2 +-
 .../drm/panel/panel-kingdisplay-kd097d04.c    |   2 +-
 .../drm/panel/panel-leadtek-ltk050h3146w.c    |   2 +-
 .../drm/panel/panel-leadtek-ltk500hd1829.c    |   2 +-
 drivers/gpu/drm/panel/panel-lg-lb035q02.c     |   2 +-
 drivers/gpu/drm/panel/panel-lg-lg4573.c       |   2 +-
 drivers/gpu/drm/panel/panel-lvds.c            |   2 +-
 .../drm/panel/panel-magnachip-d53e6ea8966.c   |   2 +-
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  |   2 +-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c  |   2 +-
 .../gpu/drm/panel/panel-newvision-nv3051d.c   |   2 +-
 .../gpu/drm/panel/panel-newvision-nv3052c.c   |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c |   2 +-
 .../gpu/drm/panel/panel-novatek-nt36672a.c    |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c |   2 +-
 .../drm/panel/panel-olimex-lcd-olinuxino.c    |   2 +-
 .../gpu/drm/panel/panel-orisetech-ota5601a.c  |   2 +-
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  |   2 +-
 .../drm/panel/panel-osd-osd101t2587-53ts.c    |   2 +-
 .../drm/panel/panel-panasonic-vvx10f034n00.c  |   2 +-
 .../drm/panel/panel-raspberrypi-touchscreen.c |   2 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c |   2 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c |   2 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c  |   2 +-
 drivers/gpu/drm/panel/panel-samsung-db7430.c  |   2 +-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c  |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c |   2 +-
 .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c |   2 +-
 .../panel/panel-samsung-s6e88a0-ams452ef01.c  |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c |   2 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |   2 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |   4 +-
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   |   2 +-
 .../gpu/drm/panel/panel-sharp-ls037v7dw01.c   |   2 +-
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   |   2 +-
 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   |   2 +-
 drivers/gpu/drm/panel/panel-simple.c          |   6 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c |   2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c |   2 +-
 .../gpu/drm/panel/panel-sitronix-st7789v.c    |   2 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c  |   2 +-
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c |   3 +-
 .../panel/panel-sony-tulip-truly-nt35521.c    |   2 +-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  |   2 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c  |   2 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c  |   2 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c      |   2 +-
 drivers/gpu/drm/panel/panel-truly-nt35597.c   |   2 +-
 .../gpu/drm/panel/panel-visionox-rm69299.c    |   2 +-
 .../gpu/drm/panel/panel-visionox-vtdr6130.c   |   2 +-
 .../gpu/drm/panel/panel-widechips-ws2401.c    |   2 +-
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  |   2 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  10 +-
 drivers/gpu/drm/radeon/atombios_dp.c          |   6 +-
 drivers/gpu/drm/radeon/atombios_encoders.c    |   2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c      |   2 +-
 drivers/gpu/drm/radeon/radeon_audio.c         |   2 +-
 drivers/gpu/drm/radeon/radeon_combios.c       |   2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |  74 +++++-----
 .../drm/renesas/rcar-du/rcar_du_writeback.c   |   2 +-
 .../renesas/shmobile/shmob_drm_backlight.c    |   8 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |   4 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          |   2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   2 +-
 drivers/gpu/drm/solomon/ssd130x.c             |   4 +-
 drivers/gpu/drm/tegra/dpaux.c                 |   4 +-
 drivers/gpu/drm/tegra/dsi.c                   |  12 +-
 drivers/gpu/drm/tegra/hdmi.c                  |   4 +-
 drivers/gpu/drm/tegra/output.c                |   4 +-
 drivers/gpu/drm/tegra/sor.c                   |   4 +-
 .../gpu/drm/tests/drm_client_modeset_test.c   |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c         |   2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   4 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   2 +-
 drivers/gpu/drm/tiny/repaper.c                |   2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   2 +-
 drivers/gpu/drm/udl/udl_modeset.c             |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |   6 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  76 +++++-----
 drivers/gpu/drm/vc4/vc4_txp.c                 |   6 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |   2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |   4 +-
 drivers/gpu/drm/xen/xen_drm_front_conn.c      |   4 +-
 drivers/media/cec/core/cec-adap.c             |   2 +-
 include/drm/drm_connector.h                   |   6 +-
 211 files changed, 815 insertions(+), 788 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index d34037b85cf8..d8b446a64b5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -42,7 +42,7 @@
 
 void amdgpu_connector_hotplug(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
@@ -280,7 +280,7 @@ amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
 
 static void amdgpu_connector_get_edid(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
@@ -472,7 +472,7 @@ static int amdgpu_connector_set_property(struct drm_connector *connector,
 					  struct drm_property *property,
 					  uint64_t val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_encoder *encoder;
 	struct amdgpu_encoder *amdgpu_encoder;
@@ -734,9 +734,9 @@ amdgpu_connector_lvds_detect(struct drm_connector *connector, bool force)
 	int r;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -760,8 +760,8 @@ amdgpu_connector_lvds_detect(struct drm_connector *connector, bool force)
 	amdgpu_connector_update_scratch_regs(connector, ret);
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	return ret;
@@ -792,7 +792,7 @@ static int amdgpu_connector_set_lcd_property(struct drm_connector *connector,
 					      struct drm_property *property,
 					      uint64_t value)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_encoder *amdgpu_encoder;
 	enum amdgpu_rmx_type rmx_type;
 
@@ -862,7 +862,7 @@ static int amdgpu_connector_vga_get_modes(struct drm_connector *connector)
 static enum drm_mode_status amdgpu_connector_vga_mode_valid(struct drm_connector *connector,
 					    struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	/* XXX check mode bandwidth */
@@ -884,9 +884,9 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 	int r;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -944,8 +944,8 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	return ret;
@@ -969,7 +969,7 @@ static const struct drm_connector_funcs amdgpu_connector_vga_funcs = {
 static bool
 amdgpu_connector_check_hpd_status_unchanged(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	enum drm_connector_status status;
@@ -1000,7 +1000,7 @@ amdgpu_connector_check_hpd_status_unchanged(struct drm_connector *connector)
 static enum drm_connector_status
 amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	const struct drm_encoder_helper_funcs *encoder_funcs;
@@ -1009,9 +1009,9 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 	bool dret = false, broken_edid = false;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1161,8 +1161,8 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 
 exit:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	return ret;
@@ -1208,7 +1208,7 @@ static void amdgpu_connector_dvi_force(struct drm_connector *connector)
 static enum drm_mode_status amdgpu_connector_dvi_mode_valid(struct drm_connector *connector,
 					    struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
@@ -1360,7 +1360,7 @@ static bool amdgpu_connector_encoder_is_hbr2(struct drm_connector *connector)
 
 bool amdgpu_connector_is_dp12_capable(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if ((adev->clock.default_dispclk >= 53900) &&
@@ -1374,7 +1374,7 @@ bool amdgpu_connector_is_dp12_capable(struct drm_connector *connector)
 static enum drm_connector_status
 amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	enum drm_connector_status ret = connector_status_disconnected;
@@ -1383,9 +1383,9 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 	int r;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1459,8 +1459,8 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 	amdgpu_connector_update_scratch_regs(connector, ret);
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 53ff91fc6cf6..5ba42af8202a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -205,7 +205,7 @@ static const struct drm_connector_funcs amdgpu_vkms_connector_funcs = {
 
 static int amdgpu_vkms_conn_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *mode = NULL;
 	unsigned i;
 	static const struct mode_size {
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index 87c41e0e9b7c..968888ba326e 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -189,7 +189,7 @@ void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
 {
 	amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
 	amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
-	amdgpu_connector->ddc_bus->aux.drm_dev = amdgpu_connector->base.dev;
+	amdgpu_connector->ddc_bus->aux.drm_dev = amdgpu_connector->base.drm;
 
 	drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
 	amdgpu_connector->ddc_bus->has_aux = true;
@@ -307,7 +307,7 @@ static u8 amdgpu_atombios_dp_encoder_service(struct amdgpu_device *adev,
 
 u8 amdgpu_atombios_dp_get_sinktype(struct amdgpu_connector *amdgpu_connector)
 {
-	struct drm_device *dev = amdgpu_connector->base.dev;
+	struct drm_device *dev = amdgpu_connector->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	return amdgpu_atombios_dp_encoder_service(adev, ATOM_DP_ACTION_GET_SINK_TYPE, 0,
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index d95b2dc78063..ac55c615dad0 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -1144,7 +1144,7 @@ amdgpu_atombios_encoder_set_edp_panel_power(struct drm_connector *connector,
 				     int action)
 {
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
-	struct drm_device *dev = amdgpu_connector->base.dev;
+	struct drm_device *dev = amdgpu_connector->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	union dig_transmitter_control args;
 	int index = GetIndexIntoMasterTable(COMMAND, UNIPHYTransmitterControl);
@@ -1814,7 +1814,7 @@ amdgpu_atombios_encoder_set_bios_scratch_regs(struct drm_connector *connector,
 				       struct drm_encoder *encoder,
 				       bool connected)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector =
 	    to_amdgpu_connector(connector);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 83ec2bb5c3b1..7d48fcddb6da 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -194,7 +194,7 @@ static void update_subconnector_property(struct amdgpu_dm_connector *aconnector)
 		subconnector = get_subconnector_type(link);
 
 	drm_object_property_set_value(&connector->base,
-			connector->dev->mode_config.dp_subconnector_property,
+			connector->drm->mode_config.dp_subconnector_property,
 			subconnector);
 }
 
@@ -888,7 +888,7 @@ static int dm_early_init(void* handle);
 /* Allocate memory for FBC compressed data  */
 static void amdgpu_dm_fbc_init(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_compressor_info *compressor = &adev->dm.compressor;
 	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(connector);
@@ -1304,9 +1304,9 @@ static void force_connector_state(
 {
 	struct drm_connector *connector = &aconnector->base;
 
-	mutex_lock(&connector->dev->mode_config.mutex);
+	mutex_lock(&connector->drm->mode_config.mutex);
 	aconnector->base.force = force_state;
-	mutex_unlock(&connector->dev->mode_config.mutex);
+	mutex_unlock(&connector->drm->mode_config.mutex);
 
 	mutex_lock(&aconnector->hpd_lock);
 	drm_kms_helper_connector_hotplug_event(connector);
@@ -1333,7 +1333,7 @@ static void dm_handle_hpd_rx_offload_work(struct work_struct *work)
 		goto skip;
 	}
 
-	adev = drm_to_adev(aconnector->base.dev);
+	adev = drm_to_adev(aconnector->base.drm);
 	dc_link = aconnector->dc_link;
 
 	mutex_lock(&aconnector->hpd_lock);
@@ -2994,7 +2994,7 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		return;
 
 	conn_base = &aconnector->base;
-	adev = drm_to_adev(conn_base->dev);
+	adev = drm_to_adev(conn_base->drm);
 
 	caps = &adev->dm.backlight_caps[aconnector->bl_idx];
 	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
@@ -3025,7 +3025,7 @@ void amdgpu_dm_update_connector_after_detect(
 		struct amdgpu_dm_connector *aconnector)
 {
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct dc_sink *sink;
 
 	/* MST handled by drm_mst framework */
@@ -3173,7 +3173,7 @@ void amdgpu_dm_update_connector_after_detect(
 static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 {
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_connector_state *dm_con_state = to_dm_connector_state(connector->state);
@@ -3339,7 +3339,7 @@ static void handle_hpd_rx_irq(void *param)
 {
 	struct amdgpu_dm_connector *aconnector = (struct amdgpu_dm_connector *)param;
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct dc_link *dc_link = aconnector->dc_link;
 	bool is_mst_root_connector = aconnector->mst_mgr.mst_state;
 	bool result = false;
@@ -4194,7 +4194,7 @@ static const struct backlight_ops amdgpu_dm_backlight_ops = {
 static void
 amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 {
-	struct drm_device *drm = aconnector->base.dev;
+	struct drm_device *drm = aconnector->base.drm;
 	struct amdgpu_display_manager *dm = &drm_to_adev(drm)->dm;
 	struct backlight_properties props = { 0 };
 	char bl_name[16];
@@ -6149,7 +6149,7 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 					    struct drm_property *property,
 					    uint64_t val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_connector_state *dm_old_state =
 		to_dm_connector_state(connector->state);
@@ -6204,7 +6204,7 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 					    struct drm_property *property,
 					    uint64_t *val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_connector_state *dm_state =
 		to_dm_connector_state(state);
@@ -6254,7 +6254,7 @@ static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
 static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-	struct amdgpu_device *adev = drm_to_adev(connector->dev);
+	struct amdgpu_device *adev = drm_to_adev(connector->drm);
 	struct amdgpu_display_manager *dm = &adev->dm;
 
 	/*
@@ -6537,7 +6537,7 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 				const struct dc_stream_state *old_stream)
 {
 	struct drm_connector *connector = &aconnector->base;
-	struct amdgpu_device *adev = drm_to_adev(connector->dev);
+	struct amdgpu_device *adev = drm_to_adev(connector->drm);
 	struct dc_stream_state *stream;
 	const struct drm_connector_state *drm_state = dm_state ? &dm_state->base : NULL;
 	int requested_bpc = drm_state ? drm_state->max_requested_bpc : 8;
@@ -7082,9 +7082,9 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
 	    connector->connector_type != DRM_MODE_CONNECTOR_LVDS)
 		return;
 
-	mutex_lock(&connector->dev->mode_config.mutex);
+	mutex_lock(&connector->drm->mode_config.mutex);
 	amdgpu_dm_connector_get_modes(connector);
-	mutex_unlock(&connector->dev->mode_config.mutex);
+	mutex_unlock(&connector->drm->mode_config.mutex);
 
 	encoder = amdgpu_dm_connector_to_encoder(connector);
 	if (!encoder)
@@ -7204,7 +7204,7 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
 		    m->vtotal + target_vtotal_diff < m->vsync_end)
 			continue;
 
-		new_mode = drm_mode_duplicate(aconnector->base.dev, m);
+		new_mode = drm_mode_duplicate(aconnector->base.drm, m);
 		if (!new_mode)
 			goto out;
 
@@ -7218,7 +7218,7 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
 			drm_mode_probed_add(&aconnector->base, new_mode);
 			new_modes_count += 1;
 		} else
-			drm_mode_destroy(aconnector->base.dev, new_mode);
+			drm_mode_destroy(aconnector->base.drm, new_mode);
 	}
  out:
 	return new_modes_count;
@@ -8990,7 +8990,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 static int dm_force_atomic_commit(struct drm_connector *connector)
 {
 	int ret = 0;
-	struct drm_device *ddev = connector->dev;
+	struct drm_device *ddev = connector->drm;
 	struct drm_atomic_state *state = drm_atomic_state_alloc(ddev);
 	struct amdgpu_crtc *disconnected_acrtc = to_amdgpu_crtc(connector->encoder->crtc);
 	struct drm_plane *plane = disconnected_acrtc->base.primary;
@@ -10513,7 +10513,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
 		u8 *edid_ext, int len,
 		struct amdgpu_hdmi_vsdb_info *vsdb_info)
 {
-	struct amdgpu_device *adev = drm_to_adev(aconnector->base.dev);
+	struct amdgpu_device *adev = drm_to_adev(aconnector->base.drm);
 	bool ret;
 
 	mutex_lock(&adev->dm.dc_lock);
@@ -10579,7 +10579,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct dm_connector_state *dm_con_state = NULL;
 	struct dc_sink *sink;
 
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
 	bool freesync_capable = false;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 5ea3284b2b77..3b27f3c445a4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -254,7 +254,7 @@ static ssize_t dp_link_settings_write(struct file *f, const char __user *buf,
 {
 	struct amdgpu_dm_connector *connector = file_inode(f)->i_private;
 	struct dc_link *link = connector->dc_link;
-	struct amdgpu_device *adev = drm_to_adev(connector->base.dev);
+	struct amdgpu_device *adev = drm_to_adev(connector->base.drm);
 	struct dc *dc = (struct dc *)link->dc;
 	struct dc_link_settings prefer_link_settings;
 	char *wr_buf = NULL;
@@ -1107,7 +1107,7 @@ static int dp_dsc_fec_support_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
 	struct drm_modeset_acquire_ctx ctx;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	int ret = 0;
 	bool try_again = false;
@@ -1180,7 +1180,7 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
 	struct drm_connector *connector = &aconnector->base;
 	struct dc_link *link = NULL;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	char *wr_buf = NULL;
@@ -1381,7 +1381,7 @@ static ssize_t dp_dsc_clock_en_write(struct file *f, const char __user *buf,
 {
 	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc = NULL;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	struct pipe_ctx *pipe_ctx;
@@ -1566,7 +1566,7 @@ static ssize_t dp_dsc_slice_width_write(struct file *f, const char __user *buf,
 	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
 	struct pipe_ctx *pipe_ctx;
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc = NULL;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	int i;
@@ -1749,7 +1749,7 @@ static ssize_t dp_dsc_slice_height_write(struct file *f, const char __user *buf,
 {
 	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc = NULL;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	struct pipe_ctx *pipe_ctx;
@@ -1926,7 +1926,7 @@ static ssize_t dp_dsc_bits_per_pixel_write(struct file *f, const char __user *bu
 {
 	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc = NULL;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	struct pipe_ctx *pipe_ctx;
@@ -2288,7 +2288,7 @@ static ssize_t dp_max_bpc_read(struct file *f, char __user *buf,
 {
 	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct dm_connector_state *state;
 	ssize_t result = 0;
 	char *rd_buf = NULL;
@@ -2364,7 +2364,7 @@ static ssize_t dp_max_bpc_write(struct file *f, const char __user *buf,
 	struct amdgpu_dm_connector *aconnector = file_inode(f)->i_private;
 	struct drm_connector *connector = &aconnector->base;
 	struct dm_connector_state *state;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	char *wr_buf = NULL;
 	uint32_t wr_buf_size = 42;
 	int max_param_num = 1;
@@ -2520,7 +2520,7 @@ static int dp_mst_progress_status_show(struct seq_file *m, void *unused)
 {
 	struct drm_connector *connector = m->private;
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-	struct amdgpu_device *adev = drm_to_adev(connector->dev);
+	struct amdgpu_device *adev = drm_to_adev(connector->drm);
 	int i;
 
 	mutex_lock(&aconnector->hpd_lock);
@@ -2765,7 +2765,7 @@ static int allow_edp_hotplug_detection_get(void *data, u64 *val)
 {
 	struct amdgpu_dm_connector *aconnector = data;
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	*val = adev->dm.dc->config.allow_edp_hotplug_detection;
@@ -2778,7 +2778,7 @@ static int allow_edp_hotplug_detection_set(void *data, u64 val)
 {
 	struct amdgpu_dm_connector *aconnector = data;
 	struct drm_connector *connector = &aconnector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	adev->dm.dc->config.allow_edp_hotplug_detection = (uint32_t) val;
@@ -2888,7 +2888,7 @@ static ssize_t edp_ilr_write(struct file *f, const char __user *buf,
 {
 	struct amdgpu_dm_connector *connector = file_inode(f)->i_private;
 	struct dc_link *link = connector->dc_link;
-	struct amdgpu_device *adev = drm_to_adev(connector->base.dev);
+	struct amdgpu_device *adev = drm_to_adev(connector->base.drm);
 	struct dc *dc = (struct dc *)link->dc;
 	struct dc_link_settings prefer_link_settings;
 	char *wr_buf = NULL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index 5536d17306d0..c63759332194 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -325,7 +325,7 @@ static void event_property_update(struct work_struct *work)
 		if (!conn_state)
 			continue;
 
-		dev = connector->dev;
+		dev = connector->drm;
 
 		if (!dev)
 			continue;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 46d0a8f57e55..b26520088e90 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -376,7 +376,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		 * will be retrieved from hdcp_work within dm_dp_mst_get_modes
 		 */
 		if (aconnector->dc_sink && connector->state) {
-			struct drm_device *dev = connector->dev;
+			struct drm_device *dev = connector->drm;
 			struct amdgpu_device *adev = drm_to_adev(dev);
 
 			if (adev->dm.hdcp_workqueue) {
@@ -419,7 +419,7 @@ dm_mst_atomic_best_encoder(struct drm_connector *connector,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 connector);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(connector_state->crtc);
 
@@ -551,7 +551,7 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 			const char *pathprop)
 {
 	struct amdgpu_dm_connector *master = container_of(mgr, struct amdgpu_dm_connector, mst_mgr);
-	struct drm_device *dev = master->base.dev;
+	struct drm_device *dev = master->base.drm;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index ebccb74306a7..d0d24ca4a4d4 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -90,7 +90,7 @@ static enum drm_mode_status
 komeda_wb_connector_mode_valid(struct drm_connector *connector,
 			       struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	int w = mode->hdisplay, h = mode->vdisplay;
 
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 626709bec6f5..0dd21bc77dd8 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -35,7 +35,7 @@ struct malidp_mw_connector_state {
 
 static int malidp_mw_connector_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
 				    dev->mode_config.max_height);
@@ -45,7 +45,7 @@ static enum drm_mode_status
 malidp_mw_connector_mode_valid(struct drm_connector *connector,
 			       struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	int w = mode->hdisplay, h = mode->vdisplay;
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index f91ff312edfd..31a3e590395e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1346,7 +1346,7 @@ static int ast_crtc_init(struct drm_device *dev)
 static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ast_vga_connector *ast_vga_connector = to_ast_vga_connector(connector);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct ast_device *ast = to_ast_device(dev);
 	struct edid *edid;
 	int count;
@@ -1452,7 +1452,7 @@ static int ast_vga_output_init(struct ast_device *ast)
 static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ast_sil164_connector *ast_sil164_connector = to_ast_sil164_connector(connector);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct ast_device *ast = to_ast_device(dev);
 	struct edid *edid;
 	int count;
@@ -1565,7 +1565,7 @@ static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto err_drm_connector_update_edid_property;
 
-	succ = ast_dp501_read_edid(connector->dev, edid);
+	succ = ast_dp501_read_edid(connector->drm, edid);
 	if (!succ)
 		goto err_kfree;
 
@@ -1644,7 +1644,7 @@ static int ast_dp501_output_init(struct ast_device *ast)
 static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 {
 	void *edid;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct ast_device *ast = to_ast_device(dev);
 
 	int succ;
@@ -1660,7 +1660,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	 */
 	mutex_lock(&ast->ioregs_lock);
 
-	succ = ast_astdp_read_edid(connector->dev, edid);
+	succ = ast_astdp_read_edid(connector->drm, edid);
 	if (succ < 0)
 		goto err_mutex_unlock;
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 52da4df1cc52..54001d4cf8bd 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -454,10 +454,10 @@ static void adv7511_hpd_work(struct work_struct *work)
 	if (adv7511->connector.status != status) {
 		adv7511->connector.status = status;
 
-		if (adv7511->connector.dev) {
+		if (adv7511->connector.drm) {
 			if (status == connector_status_disconnected)
 				cec_phys_addr_invalidate(adv7511->cec_adap);
-			drm_kms_helper_hotplug_event(adv7511->connector.dev);
+			drm_kms_helper_hotplug_event(adv7511->connector.drm);
 		} else {
 			drm_bridge_hpd_notify(&adv7511->bridge, status);
 		}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 0b66b72a5913..0f39d8807b40 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1189,7 +1189,7 @@ static irqreturn_t anx78xx_intp_threaded_handler(int unused, void *data)
 	mutex_unlock(&anx78xx->lock);
 
 	if (event)
-		drm_helper_hpd_irq_event(anx78xx->connector.dev);
+		drm_helper_hpd_irq_event(anx78xx->connector.drm);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 9156c74a7b3b..ff7ea058ca64 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2109,7 +2109,7 @@ static void hdcp_check_work_func(struct work_struct *work)
 		return;
 	}
 
-	drm_dev = ctx->connector->dev;
+	drm_dev = ctx->connector->drm;
 	drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
 	mutex_lock(&ctx->hdcp_wq_lock);
 
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d102db6d4c65..107dd0928d8e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -811,7 +811,7 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
 	bridge_attached = mhdp->bridge_attached;
 	spin_unlock(&mhdp->start_lock);
 	if (bridge_attached) {
-		if (mhdp->connector.dev)
+		if (mhdp->connector.drm)
 			drm_kms_helper_hotplug_event(mhdp->bridge.drm);
 		else
 			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
@@ -2367,14 +2367,14 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
 	conn = &mhdp->connector;
 
 	/* Grab the locks before changing connector property */
-	mutex_lock(&conn->dev->mode_config.mutex);
+	mutex_lock(&conn->drm->mode_config.mutex);
 
 	/*
 	 * Set connector link status to BAD and send a Uevent to notify
 	 * userspace to do a modeset.
 	 */
 	drm_connector_set_link_status_property(conn, DRM_MODE_LINK_STATUS_BAD);
-	mutex_unlock(&conn->dev->mode_config.mutex);
+	mutex_unlock(&conn->drm->mode_config.mutex);
 
 	/* Send Hotplug uevent so userspace can reprobe */
 	drm_kms_helper_hotplug_event(mhdp->bridge.drm);
@@ -2441,7 +2441,7 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 	int ret;
 
 	ret = cdns_mhdp_update_link_status(mhdp);
-	if (mhdp->connector.dev) {
+	if (mhdp->connector.drm) {
 		if (ret < 0)
 			schedule_work(&mhdp->modeset_retry_work);
 		else
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 946212a95598..f64d4159f6e0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -486,7 +486,7 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 	struct cdns_mhdp_device *mhdp = container_of(hdcp,
 						     struct cdns_mhdp_device,
 						     hdcp);
-	struct drm_device *dev = mhdp->connector.dev;
+	struct drm_device *dev = mhdp->connector.drm;
 	struct drm_connector_state *state;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 9c12e1652e4a..74db1305f7aa 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -264,7 +264,7 @@ static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
 	struct ch7033_priv *priv = arg;
 
 	if (priv->bridge.drm)
-		drm_helper_hpd_irq_event(priv->connector.dev);
+		drm_helper_hpd_irq_event(priv->connector.drm);
 }
 
 static int ch7033_bridge_attach(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 9189d2c3cdc8..84806d58aab0 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -170,9 +170,9 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
 	bool connected;
 
-	if (lt9611uxc->connector.dev) {
-		if (lt9611uxc->connector.dev->mode_config.funcs)
-			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
+	if (lt9611uxc->connector.drm) {
+		if (lt9611uxc->connector.drm->mode_config.funcs)
+			drm_kms_helper_hotplug_event(lt9611uxc->connector.drm);
 	} else {
 
 		mutex_lock(&lt9611uxc->ocm_lock);
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 27b01a2c216e..dae00374f523 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -246,7 +246,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ptn_bridge->connector,
 							bridge->encoder);
 
-	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
+	drm_helper_hpd_irq_event(ptn_bridge->connector.drm);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index d5ce29a74910..c7807543547d 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -107,7 +107,7 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	 * allocated with drmm_kzalloc(). This might be tricky since the
 	 * drm_device pointer can only be retrieved when the bridge is attached.
 	 */
-	if (connector->dev)
+	if (connector->drm)
 		drm_connector_cleanup(connector);
 }
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 3d8ecc6d78ef..64499fa1748a 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -173,7 +173,7 @@ static void tfp410_detach(struct drm_bridge *bridge)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 
-	if (dvi->connector.dev && dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+	if (dvi->connector.drm && dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
 		drm_bridge_hpd_disable(dvi->next_bridge);
 		cancel_delayed_work_sync(&dvi->hpd_work);
 	}
diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index ae39dc794190..fc50faf22908 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -361,7 +361,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 	cec_fill_conn_info_from_drm(&conn_info, connector);
 	cec_s_conn_info(aux->cec.adap, &conn_info);
 
-	if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
+	if (cec_register_adapter(aux->cec.adap, connector->drm->dev)) {
 		cec_delete_adapter(aux->cec.adap);
 		aux->cec.adap = NULL;
 	} else {
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 16565a0a5da6..efee04cf6edd 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1519,7 +1519,7 @@ void drm_dp_set_subconnector_property(struct drm_connector *connector,
 	if (status == connector_status_connected)
 		subconnector = drm_dp_subconnector_type(dpcd, port_cap);
 	drm_object_property_set_value(&connector->base,
-			connector->dev->mode_config.dp_subconnector_property,
+			connector->drm->mode_config.dp_subconnector_property,
 			subconnector);
 }
 EXPORT_SYMBOL(drm_dp_set_subconnector_property);
diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
index a3f0e6d96105..51b3ab5d0136 100644
--- a/drivers/gpu/drm/display/drm_hdcp_helper.c
+++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
@@ -355,7 +355,7 @@ DRM_ENUM_NAME_FN(drm_get_hdcp_content_type_name,
 int drm_connector_attach_content_protection_property(
 		struct drm_connector *connector, bool hdcp_content_type)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_property *prop =
 			dev->mode_config.content_protection_property;
 
@@ -407,7 +407,7 @@ EXPORT_SYMBOL(drm_connector_attach_content_protection_property);
 void drm_hdcp_update_content_protection(struct drm_connector *connector,
 					u64 val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_connector_state *state = connector->state;
 
 	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
index 6d2f244e5830..25df344de565 100644
--- a/drivers/gpu/drm/display/drm_scdc_helper.c
+++ b/drivers/gpu/drm/display/drm_scdc_helper.c
@@ -157,7 +157,7 @@ bool drm_scdc_get_scrambling_status(struct drm_connector *connector)
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_SCRAMBLER_STATUS, &status);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Failed to read scrambling status: %d\n",
 			    connector->base.id, connector->name, ret);
 		return false;
@@ -187,7 +187,7 @@ bool drm_scdc_set_scrambling(struct drm_connector *connector,
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
 			    connector->base.id, connector->name, ret);
 		return false;
@@ -200,7 +200,7 @@ bool drm_scdc_set_scrambling(struct drm_connector *connector,
 
 	ret = drm_scdc_writeb(connector->ddc, SCDC_TMDS_CONFIG, config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Failed to enable scrambling: %d\n",
 			    connector->base.id, connector->name, ret);
 		return false;
@@ -247,7 +247,7 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
 
 	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Failed to read TMDS config: %d\n",
 			    connector->base.id, connector->name, ret);
 		return false;
@@ -260,7 +260,7 @@ bool drm_scdc_set_high_tmds_clock_ratio(struct drm_connector *connector,
 
 	ret = drm_scdc_writeb(connector->ddc, SCDC_TMDS_CONFIG, config);
 	if (ret < 0) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Failed to set TMDS clock ratio: %d\n",
 			    connector->base.id, connector->name, ret);
 		return false;
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 8a07506a20a2..f473848d5ecb 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -466,7 +466,7 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 		return 0;
 
 	if (writeback_job->fb && !state->crtc) {
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "[CONNECTOR:%d:%s] framebuffer without CRTC\n",
 			       connector->base.id, connector->name);
 		return -EINVAL;
@@ -477,7 +477,7 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 								state->crtc);
 
 	if (writeback_job->fb && !crtc_state->active) {
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
 			       connector->base.id, connector->name,
 			       state->crtc->base.id);
@@ -486,7 +486,7 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 
 	if (!writeback_job->fb) {
 		if (writeback_job->out_fence) {
-			drm_dbg_atomic(connector->dev,
+			drm_dbg_atomic(connector->drm,
 				       "[CONNECTOR:%d:%s] requesting out-fence without framebuffer\n",
 				       connector->base.id, connector->name);
 			return -EINVAL;
@@ -1064,7 +1064,7 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			  struct drm_connector *connector)
 {
 	int ret, index;
-	struct drm_mode_config *config = &connector->dev->mode_config;
+	struct drm_mode_config *config = &connector->drm->mode_config;
 	struct drm_connector_state *connector_state;
 
 	WARN_ON(!state->acquire_ctx);
@@ -1105,7 +1105,8 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 	state->connectors[index].ptr = connector;
 	connector_state->state = state;
 
-	drm_dbg_atomic(connector->dev, "Added [CONNECTOR:%d:%s] %p state to %p\n",
+	drm_dbg_atomic(connector->drm,
+			 "Added [CONNECTOR:%d:%s] %p state to %p\n",
 			 connector->base.id, connector->name,
 			 connector_state, state);
 
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 664d0595ea89..98c9377aeef5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -133,7 +133,7 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
 
 		if (new_encoder) {
 			if (encoder_mask & drm_encoder_mask(new_encoder)) {
-				drm_dbg_atomic(connector->dev,
+				drm_dbg_atomic(connector->drm,
 					       "[ENCODER:%d:%s] on [CONNECTOR:%d:%s] already assigned\n",
 					       new_encoder->base.id, new_encoder->name,
 					       connector->base.id, connector->name);
@@ -171,7 +171,7 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
 			continue;
 
 		if (!disable_conflicting_encoders) {
-			drm_dbg_atomic(connector->dev,
+			drm_dbg_atomic(connector->drm,
 				       "[ENCODER:%d:%s] in use on [CRTC:%d:%s] by [CONNECTOR:%d:%s]\n",
 				       encoder->base.id, encoder->name,
 				       connector->state->crtc->base.id,
@@ -187,7 +187,7 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
 			goto out;
 		}
 
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "[ENCODER:%d:%s] in use on [CRTC:%d:%s], disabling [CONNECTOR:%d:%s]\n",
 			       encoder->base.id, encoder->name,
 			       new_conn_state->crtc->base.id, new_conn_state->crtc->name,
@@ -296,7 +296,8 @@ update_connector_routing(struct drm_atomic_state *state,
 	struct drm_encoder *new_encoder;
 	struct drm_crtc_state *crtc_state;
 
-	drm_dbg_atomic(connector->dev, "Updating routing for [CONNECTOR:%d:%s]\n",
+	drm_dbg_atomic(connector->drm,
+		       "Updating routing for [CONNECTOR:%d:%s]\n",
 		       connector->base.id, connector->name);
 
 	if (old_connector_state->crtc != new_connector_state->crtc) {
@@ -312,7 +313,8 @@ update_connector_routing(struct drm_atomic_state *state,
 	}
 
 	if (!new_connector_state->crtc) {
-		drm_dbg_atomic(connector->dev, "Disabling [CONNECTOR:%d:%s]\n",
+		drm_dbg_atomic(connector->drm,
+				"Disabling [CONNECTOR:%d:%s]\n",
 				connector->base.id, connector->name);
 
 		set_best_encoder(state, new_connector_state, NULL);
@@ -342,7 +344,7 @@ update_connector_routing(struct drm_atomic_state *state,
 	 */
 	if (!state->duplicated && drm_connector_is_unregistered(connector) &&
 	    crtc_state->active) {
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "[CONNECTOR:%d:%s] is not registered\n",
 			       connector->base.id, connector->name);
 		return -EINVAL;
@@ -358,14 +360,14 @@ update_connector_routing(struct drm_atomic_state *state,
 		new_encoder = drm_connector_get_single_encoder(connector);
 
 	if (!new_encoder) {
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "No suitable encoder found for [CONNECTOR:%d:%s]\n",
 			       connector->base.id, connector->name);
 		return -EINVAL;
 	}
 
 	if (!drm_encoder_crtc_ok(new_encoder, new_connector_state->crtc)) {
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "[ENCODER:%d:%s] incompatible with [CRTC:%d:%s]\n",
 			       new_encoder->base.id,
 			       new_encoder->name,
@@ -377,7 +379,7 @@ update_connector_routing(struct drm_atomic_state *state,
 	if (new_encoder == new_connector_state->best_encoder) {
 		set_best_encoder(state, new_connector_state, new_encoder);
 
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "[CONNECTOR:%d:%s] keeps [ENCODER:%d:%s], now on [CRTC:%d:%s]\n",
 			       connector->base.id,
 			       connector->name,
@@ -395,7 +397,7 @@ update_connector_routing(struct drm_atomic_state *state,
 
 	crtc_state->connectors_changed = true;
 
-	drm_dbg_atomic(connector->dev,
+	drm_dbg_atomic(connector->drm,
 		       "[CONNECTOR:%d:%s] using [ENCODER:%d:%s] on [CRTC:%d:%s]\n",
 		       connector->base.id,
 		       connector->name,
@@ -2328,7 +2330,7 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 		 */
 		if (nonblock && old_conn_state->commit &&
 		    !try_wait_for_completion(&old_conn_state->commit->flip_done)) {
-			drm_dbg_atomic(conn->dev,
+			drm_dbg_atomic(conn->drm,
 				       "[CONNECTOR:%d:%s] busy with a previous commit\n",
 				       conn->base.id, conn->name);
 
@@ -2406,7 +2408,7 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
 	for_each_old_connector_in_state(old_state, conn, old_conn_state, i) {
 		ret = drm_crtc_commit_wait(old_conn_state->commit);
 		if (ret)
-			drm_err(conn->dev,
+			drm_err(conn->drm,
 				"[CONNECTOR:%d:%s] commit wait timed out\n",
 				conn->base.id, conn->name);
 	}
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..c551dad67694 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -489,7 +489,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_tv_margins_reset);
  */
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
 	struct drm_connector_state *state = connector->state;
 	struct drm_property *prop;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 44f7b5c3b2d1..84133002e46c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -301,12 +301,12 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 		drm_connector_get(conn_state->connector);
 		conn_state->crtc = crtc;
 
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
 			       connector->base.id, connector->name,
 			       conn_state, crtc->base.id, crtc->name);
 	} else {
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
 			       connector->base.id, connector->name,
 			       conn_state);
@@ -676,11 +676,11 @@ static int drm_atomic_set_writeback_fb_for_connector(
 		return ret;
 
 	if (fb)
-		drm_dbg_atomic(conn->dev,
+		drm_dbg_atomic(conn->drm,
 			       "Set [FB:%d] for connector state %p\n",
 			       fb->base.id, conn_state);
 	else
-		drm_dbg_atomic(conn->dev,
+		drm_dbg_atomic(conn->drm,
 			       "Set [NOFB] for connector state %p\n",
 			       conn_state);
 
@@ -691,7 +691,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		struct drm_connector_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 	bool replaced = false;
 	int ret;
@@ -802,7 +802,7 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
 		return connector->funcs->atomic_set_property(connector,
 				state, property, val);
 	} else {
-		drm_dbg_atomic(connector->dev,
+		drm_dbg_atomic(connector->drm,
 			       "[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]\n",
 			       connector->base.id, connector->name,
 			       property->base.id, property->name);
@@ -817,7 +817,7 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		const struct drm_connector_state *state,
 		struct drm_property *property, uint64_t *val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (property == config->prop_crtc_id) {
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index fc6f16e14f36..a09be77daea1 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -112,7 +112,7 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 {
 	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	enum drm_connector_status old_status;
 
 	mutex_lock(&dev->mode_config.mutex);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bf8371dc2a61..c0d3bcf9f643 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -193,7 +193,7 @@ static void drm_connector_free(struct kref *kref)
 {
 	struct drm_connector *connector =
 		container_of(kref, struct drm_connector, base.refcount);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	drm_mode_object_unregister(dev, &connector->base);
 	connector->funcs->destroy(connector);
@@ -240,7 +240,7 @@ static int __drm_connector_init(struct drm_device *dev,
 		return ret;
 
 	connector->base.properties = &connector->properties;
-	connector->dev = dev;
+	connector->drm = dev;
 	connector->funcs = funcs;
 
 	/* connector index is used with 32bit bitmasks */
@@ -462,7 +462,7 @@ EXPORT_SYMBOL(drmm_connector_init);
  */
 void drm_connector_attach_edid_property(struct drm_connector *connector)
 {
-	struct drm_mode_config *config = &connector->dev->mode_config;
+	struct drm_mode_config *config = &connector->drm->mode_config;
 
 	drm_object_attach_property(&connector->base,
 				   config->edid_property,
@@ -525,7 +525,7 @@ static void drm_mode_remove(struct drm_connector *connector,
 			    struct drm_display_mode *mode)
 {
 	list_del(&mode->head);
-	drm_mode_destroy(connector->dev, mode);
+	drm_mode_destroy(connector->drm, mode);
 }
 
 /**
@@ -536,7 +536,7 @@ static void drm_mode_remove(struct drm_connector *connector,
  */
 void drm_connector_cleanup(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *mode, *t;
 
 	/* The connector should have been removed from userspace long before
@@ -612,7 +612,7 @@ int drm_connector_register(struct drm_connector *connector)
 {
 	int ret = 0;
 
-	if (!connector->dev->registered)
+	if (!connector->drm->registered)
 		return 0;
 
 	mutex_lock(&connector->mutex);
@@ -631,7 +631,7 @@ int drm_connector_register(struct drm_connector *connector)
 			goto err_debugfs;
 	}
 
-	drm_mode_object_register(connector->dev, &connector->base);
+	drm_mode_object_register(connector->drm, &connector->base);
 
 	connector->registration_state = DRM_CONNECTOR_REGISTERED;
 
@@ -797,7 +797,7 @@ EXPORT_SYMBOL(drm_connector_list_iter_begin);
 static void
 __drm_connector_put_safe(struct drm_connector *conn)
 {
-	struct drm_mode_config *config = &conn->dev->mode_config;
+	struct drm_mode_config *config = &conn->drm->mode_config;
 
 	lockdep_assert_held(&config->connector_list_lock);
 
@@ -1582,15 +1582,15 @@ EXPORT_SYMBOL(drm_mode_create_dvi_i_properties);
  */
 void drm_connector_attach_dp_subconnector_property(struct drm_connector *connector)
 {
-	struct drm_mode_config *mode_config = &connector->dev->mode_config;
+	struct drm_mode_config *mode_config = &connector->drm->mode_config;
 
 	if (!mode_config->dp_subconnector_property)
 		mode_config->dp_subconnector_property =
-			drm_property_create_enum(connector->dev,
-				DRM_MODE_PROP_IMMUTABLE,
-				"subconnector",
-				drm_dp_subconnector_enum_list,
-				ARRAY_SIZE(drm_dp_subconnector_enum_list));
+			drm_property_create_enum(connector->drm,
+						 DRM_MODE_PROP_IMMUTABLE,
+						 "subconnector",
+						 drm_dp_subconnector_enum_list,
+						 ARRAY_SIZE(drm_dp_subconnector_enum_list));
 
 	drm_object_attach_property(&connector->base,
 				   mode_config->dp_subconnector_property,
@@ -1696,9 +1696,9 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
  */
 int drm_connector_attach_content_type_property(struct drm_connector *connector)
 {
-	if (!drm_mode_create_content_type_property(connector->dev))
+	if (!drm_mode_create_content_type_property(connector->drm))
 		drm_object_attach_property(&connector->base,
-					   connector->dev->mode_config.content_type_property,
+					   connector->drm->mode_config.content_type_property,
 					   DRM_MODE_CONTENT_TYPE_NO_DATA);
 	return 0;
 }
@@ -1714,7 +1714,7 @@ EXPORT_SYMBOL(drm_connector_attach_content_type_property);
  */
 void drm_connector_attach_tv_margin_properties(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.tv_left_margin_property,
@@ -2024,7 +2024,7 @@ EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
 int drm_connector_attach_vrr_capable_property(
 	struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_property *prop;
 
 	if (!connector->vrr_capable_property) {
@@ -2058,7 +2058,7 @@ EXPORT_SYMBOL(drm_connector_attach_vrr_capable_property);
 int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
 					       u32 scaling_mode_mask)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_property *scaling_mode_property;
 	int i;
 	const unsigned valid_scaling_mode_mask =
@@ -2159,7 +2159,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
 static int drm_mode_create_colorspace_property(struct drm_connector *connector,
 					u32 supported_colorspaces)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	u32 colorspaces = supported_colorspaces | BIT(DRM_MODE_COLORIMETRY_DEFAULT);
 	struct drm_prop_enum_list enum_list[DRM_MODE_COLORIMETRY_COUNT];
 	int i, len;
@@ -2318,7 +2318,7 @@ EXPORT_SYMBOL(drm_mode_create_suggested_offset_properties);
 int drm_connector_set_path_property(struct drm_connector *connector,
 				    const char *path)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	int ret;
 
 	ret = drm_property_replace_global_blob(dev,
@@ -2346,7 +2346,7 @@ EXPORT_SYMBOL(drm_connector_set_path_property);
  */
 int drm_connector_set_tile_property(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	char tile[256];
 	int ret;
 
@@ -2398,7 +2398,7 @@ EXPORT_SYMBOL(drm_connector_set_tile_property);
 void drm_connector_set_link_status_property(struct drm_connector *connector,
 					    uint64_t link_status)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	connector->state->link_status = link_status;
@@ -2420,7 +2420,7 @@ EXPORT_SYMBOL(drm_connector_set_link_status_property);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_property *prop;
 
 	prop = connector->max_bpc_property;
@@ -2452,7 +2452,7 @@ EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
  */
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_property *prop = dev->mode_config.hdr_output_metadata_property;
 
 	drm_object_attach_property(&connector->base, prop, 0);
@@ -2555,7 +2555,7 @@ int drm_connector_set_panel_orientation(
 	struct drm_connector *connector,
 	enum drm_panel_orientation panel_orientation)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_info *info = &connector->display_info;
 	struct drm_property *prop;
 
@@ -2667,16 +2667,16 @@ drm_connector_create_privacy_screen_properties(struct drm_connector *connector)
 
 	/* Note sw-state only supports the first 2 values of the enum */
 	connector->privacy_screen_sw_state_property =
-		drm_property_create_enum(connector->dev, DRM_MODE_PROP_ENUM,
-				"privacy-screen sw-state",
-				privacy_screen_enum, 2);
+		drm_property_create_enum(connector->drm, DRM_MODE_PROP_ENUM,
+					 "privacy-screen sw-state",
+					 privacy_screen_enum, 2);
 
 	connector->privacy_screen_hw_state_property =
-		drm_property_create_enum(connector->dev,
-				DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ENUM,
-				"privacy-screen hw-state",
-				privacy_screen_enum,
-				ARRAY_SIZE(privacy_screen_enum));
+		drm_property_create_enum(connector->drm,
+					 DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ENUM,
+					 "privacy-screen hw-state",
+					 privacy_screen_enum,
+					 ARRAY_SIZE(privacy_screen_enum));
 }
 EXPORT_SYMBOL(drm_connector_create_privacy_screen_properties);
 
@@ -2724,7 +2724,7 @@ static int drm_connector_privacy_screen_notifier(
 {
 	struct drm_connector *connector =
 		container_of(nb, struct drm_connector, privacy_screen_notifier);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	drm_connector_update_privacy_screen_properties(connector, true);
@@ -2783,7 +2783,8 @@ void drm_connector_update_privacy_screen(const struct drm_connector_state *conne
 	ret = drm_privacy_screen_set_sw_state(connector->privacy_screen,
 					      connector_state->privacy_screen_sw_state);
 	if (ret) {
-		drm_err(connector->dev, "Error updating privacy-screen sw_state\n");
+		drm_err(connector->drm,
+			"Error updating privacy-screen sw_state\n");
 		return;
 	}
 
@@ -2800,7 +2801,7 @@ int drm_connector_set_obj_prop(struct drm_mode_object *obj,
 	struct drm_connector *connector = obj_to_connector(obj);
 
 	/* Do DPMS ourselves */
-	if (property == connector->dev->mode_config.dpms_property) {
+	if (property == connector->drm->mode_config.dpms_property) {
 		ret = (*connector->funcs->dpms)(connector, (int)value);
 	} else if (connector->funcs->set_property)
 		ret = connector->funcs->set_property(connector, property, value);
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index a209659a996c..320c3f8690cb 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -908,7 +908,7 @@ int drm_helper_connector_dpms(struct drm_connector *connector, int mode)
 	struct drm_crtc *crtc = encoder ? encoder->crtc : NULL;
 	int old_dpms, encoder_dpms = DRM_MODE_DPMS_OFF;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(connector->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(connector->drm));
 
 	if (mode == connector->dpms)
 		return 0;
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4855230ba2c6..f18d2af96db7 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -498,7 +498,7 @@ static const struct file_operations drm_connector_fops = {
 
 void drm_debugfs_connector_add(struct drm_connector *connector)
 {
-	struct drm_minor *minor = connector->dev->primary;
+	struct drm_minor *minor = connector->drm->primary;
 	struct dentry *root;
 
 	if (!minor->debugfs_root)
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f95152fac427..a148e87d8204 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2204,7 +2204,7 @@ static void connector_bad_edid(struct drm_connector *connector,
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
 
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID is invalid:\n",
+	drm_dbg_kms(connector->drm, "[CONNECTOR:%d:%s] EDID is invalid:\n",
 		    connector->base.id, connector->name);
 	for (i = 0; i < num_blocks; i++)
 		edid_block_dump(KERN_DEBUG, edid + i, i);
@@ -2252,13 +2252,14 @@ int drm_edid_override_set(struct drm_connector *connector, const void *edid,
 
 	drm_edid = drm_edid_alloc(edid, size);
 	if (!drm_edid_valid(drm_edid)) {
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override invalid\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] EDID override invalid\n",
 			    connector->base.id, connector->name);
 		drm_edid_free(drm_edid);
 		return -EINVAL;
 	}
 
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override set\n",
+	drm_dbg_kms(connector->drm, "[CONNECTOR:%d:%s] EDID override set\n",
 		    connector->base.id, connector->name);
 
 	mutex_lock(&connector->edid_override_mutex);
@@ -2274,7 +2275,7 @@ int drm_edid_override_set(struct drm_connector *connector, const void *edid,
 /* For debugfs edid_override implementation */
 int drm_edid_override_reset(struct drm_connector *connector)
 {
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override reset\n",
+	drm_dbg_kms(connector->drm, "[CONNECTOR:%d:%s] EDID override reset\n",
 		    connector->base.id, connector->name);
 
 	mutex_lock(&connector->edid_override_mutex);
@@ -2309,7 +2310,7 @@ int drm_edid_override_connector_update(struct drm_connector *connector)
 
 		drm_edid_free(override);
 
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
 			    connector->base.id, connector->name, num_modes);
 	}
@@ -2672,7 +2673,7 @@ const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
 		return NULL;
 
 	/* Sanity check for now */
-	drm_WARN_ON(connector->dev, !size);
+	drm_WARN_ON(connector->drm, !size);
 
 	drm_edid = _drm_edid_alloc(edid, size);
 	if (!drm_edid)
@@ -2735,7 +2736,7 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
  */
 const struct drm_edid *drm_edid_read(struct drm_connector *connector)
 {
-	if (drm_WARN_ON(connector->dev, !connector->ddc))
+	if (drm_WARN_ON(connector->drm, !connector->ddc))
 		return NULL;
 
 	return drm_edid_read_ddc(connector, connector->ddc);
@@ -2830,7 +2831,7 @@ EXPORT_SYMBOL(drm_edid_get_panel_id);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct edid *edid;
 
@@ -2859,7 +2860,7 @@ EXPORT_SYMBOL(drm_get_edid_switcheroo);
 const struct drm_edid *drm_edid_read_switcheroo(struct drm_connector *connector,
 						struct i2c_adapter *adapter)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	const struct drm_edid *drm_edid;
 
@@ -3294,7 +3295,7 @@ static struct drm_display_mode *drm_mode_std(struct drm_connector *connector,
 					     const struct drm_edid *drm_edid,
 					     const struct std_timing *t)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *m, *mode = NULL;
 	int hsize, vsize;
 	int vrefresh_rate;
@@ -3436,7 +3437,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 						  const struct detailed_timing *timing)
 {
 	const struct drm_display_info *info = &connector->display_info;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *mode;
 	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
 	unsigned hactive = (pt->hactive_hblank_hi & 0xf0) << 4 | pt->hactive_lo;
@@ -3648,7 +3649,7 @@ static int drm_dmt_modes_for_range(struct drm_connector *connector,
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	for (i = 0; i < ARRAY_SIZE(drm_dmt_modes); i++) {
 		if (mode_in_range(drm_dmt_modes + i, drm_edid, timing) &&
@@ -3683,7 +3684,7 @@ static int drm_gtf_modes_for_range(struct drm_connector *connector,
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
 		const struct minimode *m = &extra_modes[i];
@@ -3712,7 +3713,7 @@ static int drm_gtf2_modes_for_range(struct drm_connector *connector,
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
 		const struct minimode *m = &extra_modes[i];
@@ -3741,7 +3742,7 @@ static int drm_cvt_modes_for_range(struct drm_connector *connector,
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	bool rb = drm_monitor_supports_rb(drm_edid);
 
 	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
@@ -3834,7 +3835,7 @@ drm_est3_modes(struct drm_connector *connector, const struct detailed_timing *ti
 			if (m >= ARRAY_SIZE(est3_modes))
 				break;
 			if (est[i] & (1 << j)) {
-				mode = drm_mode_find_dmt(connector->dev,
+				mode = drm_mode_find_dmt(connector->drm,
 							 est3_modes[m].w,
 							 est3_modes[m].h,
 							 est3_modes[m].r,
@@ -3869,7 +3870,7 @@ do_established_modes(const struct detailed_timing *timing, void *c)
 static int add_established_modes(struct drm_connector *connector,
 				 const struct drm_edid *drm_edid)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	const struct edid *edid = drm_edid->edid;
 	unsigned long est_bits = edid->established_timings.t1 |
 		(edid->established_timings.t2 << 8) |
@@ -3961,7 +3962,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
 {
 	int i, j, modes = 0;
 	struct drm_display_mode *newmode;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	const struct cvt_timing *cvt;
 	static const int rates[] = { 60, 85, 75, 60, 50 };
 	const u8 empty[3] = { 0, 0, 0 };
@@ -4432,7 +4433,7 @@ static bool drm_valid_hdmi_vic(u8 vic)
 static int add_alternate_cea_modes(struct drm_connector *connector,
 				   const struct drm_edid *drm_edid)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *mode, *tmp;
 	LIST_HEAD(list);
 	int modes = 0;
@@ -4518,7 +4519,7 @@ static struct drm_display_mode *
 drm_display_mode_from_vic_index(struct drm_connector *connector, int vic_index)
 {
 	const struct drm_display_info *info = &connector->display_info;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	if (!info->vics || vic_index >= info->vics_len || !info->vics[vic_index])
 		return NULL;
@@ -4539,7 +4540,7 @@ drm_display_mode_from_vic_index(struct drm_connector *connector, int vic_index)
 static int do_y420vdb_modes(struct drm_connector *connector,
 			    const u8 *svds, u8 svds_len)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	int modes = 0, i;
 
 	for (i = 0; i < svds_len; i++) {
@@ -4641,7 +4642,7 @@ stereo_match_mandatory(const struct drm_display_mode *mode,
 
 static int add_hdmi_mandatory_stereo_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	const struct drm_display_mode *mode;
 	struct list_head stereo_modes;
 	int modes = 0, i;
@@ -4675,11 +4676,12 @@ static int add_hdmi_mandatory_stereo_modes(struct drm_connector *connector)
 
 static int add_hdmi_mode(struct drm_connector *connector, u8 vic)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *newmode;
 
 	if (!drm_valid_hdmi_vic(vic)) {
-		drm_err(connector->dev, "[CONNECTOR:%d:%s] Unknown HDMI VIC: %d\n",
+		drm_err(connector->drm,
+			"[CONNECTOR:%d:%s] Unknown HDMI VIC: %d\n",
 			connector->base.id, connector->name, vic);
 		return 0;
 	}
@@ -5319,7 +5321,7 @@ static void fixup_detailed_cea_mode_clock(struct drm_connector *connector,
 	if (mode->clock == clock)
 		return;
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] detailed mode matches %s VIC %d, adjusting clock %d -> %d\n",
 		    connector->base.id, connector->name,
 		    type, vic, mode->clock, clock);
@@ -5431,7 +5433,7 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 		connector->audio_latency[1] = db[12];
 	}
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] HDMI: latency present %d %d, video latency %d %d, audio latency %d %d\n",
 		    connector->base.id, connector->name,
 		    connector->latency_present[0], connector->latency_present[1],
@@ -5532,7 +5534,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 		return;
 
 	mnl = get_monitor_name(drm_edid, &eld[DRM_ELD_MONITOR_NAME_STRING]);
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD monitor %s\n",
+	drm_dbg_kms(connector->drm, "[CONNECTOR:%d:%s] ELD monitor %s\n",
 		    connector->base.id, connector->name,
 		    &eld[DRM_ELD_MONITOR_NAME_STRING]);
 
@@ -5588,7 +5590,8 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 	eld[DRM_ELD_BASELINE_ELD_LEN] =
 		DIV_ROUND_UP(drm_eld_calc_baseline_block_size(eld), 4);
 
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] ELD size %d, SAD count %d\n",
+	drm_dbg_kms(connector->drm,
+		    "[CONNECTOR:%d:%s] ELD size %d, SAD count %d\n",
 		    connector->base.id, connector->name,
 		    drm_eld_size(eld), total_sad_count);
 }
@@ -5947,7 +5950,7 @@ static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] CEA VCDB 0x%02x\n",
+	drm_dbg_kms(connector->drm, "[CONNECTOR:%d:%s] CEA VCDB 0x%02x\n",
 		    connector->base.id, connector->name, db[2]);
 
 	if (db[2] & EDID_CEA_VCDB_QS)
@@ -6130,7 +6133,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 		dsc_support = true;
 	}
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] HF-VSDB: max TMDS clock: %d KHz, HDMI 2.1 support: %s, DSC 1.2 support: %s\n",
 		    connector->base.id, connector->name,
 		    max_tmds_clock, str_yes_no(max_frl_rate), str_yes_no(dsc_support));
@@ -6151,38 +6154,44 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
 		dc_bpc = 10;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_30;
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 30.\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] HDMI sink does deep color 30.\n",
 			    connector->base.id, connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
 		dc_bpc = 12;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_36;
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 36.\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] HDMI sink does deep color 36.\n",
 			    connector->base.id, connector->name);
 	}
 
 	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
 		dc_bpc = 16;
 		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_48;
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 48.\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] HDMI sink does deep color 48.\n",
 			    connector->base.id, connector->name);
 	}
 
 	if (dc_bpc == 0) {
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] No deep color support on this HDMI sink.\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] No deep color support on this HDMI sink.\n",
 			    connector->base.id, connector->name);
 		return;
 	}
 
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Assigning HDMI sink color depth as %d bpc.\n",
+	drm_dbg_kms(connector->drm,
+		    "[CONNECTOR:%d:%s] Assigning HDMI sink color depth as %d bpc.\n",
 		    connector->base.id, connector->name, dc_bpc);
 	info->bpc = dc_bpc;
 
 	/* YCRCB444 is optional according to spec. */
 	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
 		info->edid_hdmi_ycbcr444_dc_modes = info->edid_hdmi_rgb444_dc_modes;
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does YCRCB444 in deep color.\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] HDMI sink does YCRCB444 in deep color.\n",
 			    connector->base.id, connector->name);
 	}
 
@@ -6191,7 +6200,8 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	 * then deep color 36 bit must be supported.
 	 */
 	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink should do DC_36, but does not!\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] HDMI sink should do DC_36, but does not!\n",
 			    connector->base.id, connector->name);
 	}
 }
@@ -6219,7 +6229,8 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	if (len >= 8 && db[8] & BIT(5))
 		info->has_hdmi_infoframe = true;
 
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
+	drm_dbg_kms(connector->drm,
+		    "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
 		    connector->base.id, connector->name,
 		    info->dvi_dual, info->max_tmds_clock);
 
@@ -6241,7 +6252,7 @@ static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
 	if (version == 1 || version == 2 || (version == 3 && !desktop_usage))
 		info->non_desktop = true;
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] HMD or specialized display VSDB version %u: 0x%02x\n",
 		    connector->base.id, connector->name, version, db[5]);
 }
@@ -6265,7 +6276,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			info->cea_rev = edid_ext[1];
 
 		if (info->cea_rev != edid_ext[1])
-			drm_dbg_kms(connector->dev,
+			drm_dbg_kms(connector->drm,
 				    "[CONNECTOR:%d:%s] CEA extension version mismatch %u != %u\n",
 				    connector->base.id, connector->name,
 				    info->cea_rev, edid_ext[1]);
@@ -6366,7 +6377,7 @@ static void drm_get_monitor_range(struct drm_connector *connector,
 
 	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
 		    connector->base.id, connector->name,
 		    info->monitor_range.min_vfreq, info->monitor_range.max_vfreq);
@@ -6380,7 +6391,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 	struct drm_display_info *info = &connector->display_info;
 
 	if (block->num_bytes < 3) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Unexpected vendor block size %u\n",
 			    connector->base.id, connector->name, block->num_bytes);
 		return;
@@ -6390,7 +6401,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 		return;
 
 	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
 			    connector->base.id, connector->name);
 		return;
@@ -6398,7 +6409,8 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 
 	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
 	default:
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] Reserved MSO mode value\n",
 			    connector->base.id, connector->name);
 		fallthrough;
 	case 0:
@@ -6419,14 +6431,14 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 
 	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
 	if (info->mso_pixel_overlap > 8) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
 			    connector->base.id, connector->name,
 			    info->mso_pixel_overlap);
 		info->mso_pixel_overlap = 8;
 	}
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
 		    connector->base.id, connector->name,
 		    info->mso_stream_count, info->mso_pixel_overlap);
@@ -6550,7 +6562,7 @@ static void update_display_info(struct drm_connector *connector,
 	if (info->bpc == 0 && edid->revision == 3 &&
 	    edid->input & DRM_EDID_DIGITAL_DFP_1_X) {
 		info->bpc = 8;
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "[CONNECTOR:%d:%s] Assigning DFP sink color depth as %d bpc.\n",
 			    connector->base.id, connector->name, info->bpc);
 	}
@@ -6584,7 +6596,7 @@ static void update_display_info(struct drm_connector *connector,
 		break;
 	}
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
 		    connector->base.id, connector->name, info->bpc);
 
@@ -6597,7 +6609,8 @@ static void update_display_info(struct drm_connector *connector,
 
 out:
 	if (info->quirks & EDID_QUIRK_NON_DESKTOP) {
-		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Non-desktop display%s\n",
+		drm_dbg_kms(connector->drm,
+			    "[CONNECTOR:%d:%s] Non-desktop display%s\n",
 			    connector->base.id, connector->name,
 			    info->non_desktop ? " (redundant quirk)" : "");
 		info->non_desktop = true;
@@ -6686,7 +6699,8 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	for (i = 0; i < num_timings; i++) {
 		struct displayid_detailed_timings_1 *timings = &det->timings[i];
 
-		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
+		newmode = drm_mode_displayid_detailed(connector->drm, timings,
+						      type_7);
 		if (!newmode)
 			continue;
 
@@ -6759,7 +6773,7 @@ static void _drm_update_tile_info(struct drm_connector *connector,
 static int _drm_edid_connector_property_update(struct drm_connector *connector,
 					       const struct drm_edid *drm_edid)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	int ret;
 
 	if (connector->edid_blob_ptr) {
@@ -6905,7 +6919,7 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 	const struct drm_edid *drm_edid;
 
 	if (edid && !drm_edid_is_valid(edid)) {
-		drm_warn(connector->dev, "[CONNECTOR:%d:%s] EDID invalid.\n",
+		drm_warn(connector->drm, "[CONNECTOR:%d:%s] EDID invalid.\n",
 			 connector->base.id, connector->name);
 		edid = NULL;
 	}
@@ -6934,7 +6948,7 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 {
 	int i, count, num_modes = 0;
 	struct drm_display_mode *mode;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	count = ARRAY_SIZE(drm_dmt_modes);
 	if (hdisplay < 0)
@@ -7292,7 +7306,7 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
 	connector->tile_h_size = w + 1;
 	connector->tile_v_size = h + 1;
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] tile cap 0x%x, size %dx%d, num tiles %dx%d, location %dx%d, vend %c%c%c",
 		    connector->base.id, connector->name,
 		    tile->tile_cap,
@@ -7301,9 +7315,10 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
 		    connector->tile_h_loc, connector->tile_v_loc,
 		    tile->topology_id[0], tile->topology_id[1], tile->topology_id[2]);
 
-	tg = drm_mode_get_tile_group(connector->dev, tile->topology_id);
+	tg = drm_mode_get_tile_group(connector->drm, tile->topology_id);
 	if (!tg)
-		tg = drm_mode_create_tile_group(connector->dev, tile->topology_id);
+		tg = drm_mode_create_tile_group(connector->drm,
+						tile->topology_id);
 	if (!tg)
 		return;
 
@@ -7311,11 +7326,12 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
 		/* if we haven't got a pointer,
 		   take the reference, drop ref to old tile group */
 		if (connector->tile_group)
-			drm_mode_put_tile_group(connector->dev, connector->tile_group);
+			drm_mode_put_tile_group(connector->drm,
+						connector->tile_group);
 		connector->tile_group = tg;
 	} else {
 		/* if same tile group, then release the ref we just took. */
-		drm_mode_put_tile_group(connector->dev, tg);
+		drm_mode_put_tile_group(connector->drm, tg);
 	}
 }
 
@@ -7344,7 +7360,7 @@ static void _drm_update_tile_info(struct drm_connector *connector,
 	displayid_iter_end(&iter);
 
 	if (!connector->has_tile && connector->tile_group) {
-		drm_mode_put_tile_group(connector->dev, connector->tile_group);
+		drm_mode_put_tile_group(connector->drm, connector->tile_group);
 		connector->tile_group = NULL;
 	}
 }
diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 5d9ef267ebb3..e07fb48d0d8b 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -174,9 +174,9 @@ static const struct drm_edid *edid_load(struct drm_connector *connector, const c
 	} else {
 		int err;
 
-		err = request_firmware(&fw, name, connector->dev->dev);
+		err = request_firmware(&fw, name, connector->drm->dev);
 		if (err) {
-			drm_err(connector->dev,
+			drm_err(connector->drm,
 				"[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed (err=%d)\n",
 				connector->base.id, connector->name,
 				name, err);
@@ -187,13 +187,15 @@ static const struct drm_edid *edid_load(struct drm_connector *connector, const c
 		fwsize = fw->size;
 	}
 
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Loaded %s firmware EDID \"%s\"\n",
+	drm_dbg_kms(connector->drm,
+		    "[CONNECTOR:%d:%s] Loaded %s firmware EDID \"%s\"\n",
 		    connector->base.id, connector->name,
 		    builtin >= 0 ? "built-in" : "external", name);
 
 	drm_edid = drm_edid_alloc(fwdata, fwsize);
 	if (!drm_edid_valid(drm_edid)) {
-		drm_err(connector->dev, "Invalid firmware EDID \"%s\"\n", name);
+		drm_err(connector->drm, "Invalid firmware EDID \"%s\"\n",
+			name);
 		drm_edid_free(drm_edid);
 		drm_edid = ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index c871d9f096b8..e13461bdb562 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -508,7 +508,7 @@ EXPORT_SYMBOL(mipi_dbi_pipe_destroy_plane_state);
 
 static int mipi_dbi_connector_get_modes(struct drm_connector *connector)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->drm);
 
 	return drm_connector_helper_get_modes_fixed(connector, &dbidev->mode);
 }
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..d6f88ad14205 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -111,7 +111,7 @@ EXPORT_SYMBOL(drm_mode_destroy);
 void drm_mode_probed_add(struct drm_connector *connector,
 			 struct drm_display_mode *mode)
 {
-	WARN_ON(!mutex_is_locked(&connector->dev->mode_config.mutex));
+	WARN_ON(!mutex_is_locked(&connector->drm->mode_config.mutex));
 
 	list_add_tail(&mode->head, &connector->probed_modes);
 }
@@ -1886,7 +1886,7 @@ void drm_connector_list_update(struct drm_connector *connector)
 {
 	struct drm_display_mode *pmode, *pt;
 
-	WARN_ON(!mutex_is_locked(&connector->dev->mode_config.mutex));
+	WARN_ON(!mutex_is_locked(&connector->drm->mode_config.mutex));
 
 	list_for_each_entry_safe(pmode, pt, &connector->probed_modes, head) {
 		struct drm_display_mode *mode;
@@ -1922,7 +1922,7 @@ void drm_connector_list_update(struct drm_connector *connector)
 			}
 
 			list_del(&pmode->head);
-			drm_mode_destroy(connector->dev, pmode);
+			drm_mode_destroy(connector->drm, pmode);
 			break;
 		}
 
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 2fb9bf901a2c..9a992f989bc4 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -91,7 +91,7 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
 			   struct drm_modeset_acquire_ctx *ctx,
 			   enum drm_mode_status *status)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_encoder *encoder;
 	int ret;
 
@@ -167,7 +167,7 @@ static int drm_helper_probe_add_cmdline_mode(struct drm_connector *connector)
 		return 0;
 	}
 
-	mode = drm_mode_create_from_cmdline_mode(connector->dev,
+	mode = drm_mode_create_from_cmdline_mode(connector->drm,
 						 cmdline_mode);
 	if (mode == NULL)
 		return 0;
@@ -320,7 +320,8 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 	drm_modeset_acquire_init(&ctx, 0);
 
 retry:
-	ret = drm_modeset_lock(&connector->dev->mode_config.connection_mutex, &ctx);
+	ret = drm_modeset_lock(&connector->drm->mode_config.connection_mutex,
+			       &ctx);
 	if (!ret) {
 		if (funcs->detect_ctx)
 			ret = funcs->detect_ctx(connector, &ctx, force);
@@ -363,7 +364,7 @@ drm_helper_probe_detect(struct drm_connector *connector,
 			bool force)
 {
 	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	int ret;
 
 	if (!ctx)
@@ -409,7 +410,7 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
 					    uint32_t maxX, uint32_t maxY,
 					    struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *mode;
 	int mode_flags = 0;
 	int ret;
@@ -522,7 +523,7 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
 int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 					    uint32_t maxX, uint32_t maxY)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *mode;
 	int count = 0, ret;
 	enum drm_connector_status old_status;
@@ -708,7 +709,7 @@ EXPORT_SYMBOL(drm_kms_helper_hotplug_event);
  */
 void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	/* send a uevent + call fbdev */
 	drm_sysfs_connector_hotplug_event(connector);
@@ -907,7 +908,7 @@ EXPORT_SYMBOL(drm_kms_helper_poll_fini);
 
 static bool check_connector_changed(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	enum drm_connector_status old_status;
 	u64 old_epoch_counter;
 
@@ -967,7 +968,7 @@ static bool check_connector_changed(struct drm_connector *connector)
  */
 bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	bool changed;
 
 	mutex_lock(&dev->mode_config.mutex);
@@ -1127,7 +1128,7 @@ EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
 int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
 					 const struct drm_display_mode *fixed_mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(dev, fixed_mode);
@@ -1203,7 +1204,7 @@ EXPORT_SYMBOL(drm_connector_helper_get_modes);
  */
 int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_property *tv_mode_property =
 		dev->mode_config.tv_mode_property;
 	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index b169b3e44a92..6ad7b54c8f13 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -187,7 +187,7 @@ static ssize_t status_store(struct device *device,
 			   const char *buf, size_t count)
 {
 	struct drm_connector *connector = to_drm_connector(device);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	enum drm_connector_force old_force;
 	int ret;
 
@@ -271,7 +271,7 @@ static ssize_t edid_show(struct file *filp, struct kobject *kobj,
 	size_t size;
 	ssize_t ret = 0;
 
-	mutex_lock(&connector->dev->mode_config.mutex);
+	mutex_lock(&connector->drm->mode_config.mutex);
 	if (!connector->edid_blob_ptr)
 		goto unlock;
 
@@ -289,7 +289,7 @@ static ssize_t edid_show(struct file *filp, struct kobject *kobj,
 
 	ret = count;
 unlock:
-	mutex_unlock(&connector->dev->mode_config.mutex);
+	mutex_unlock(&connector->drm->mode_config.mutex);
 
 	return ret;
 }
@@ -302,12 +302,12 @@ static ssize_t modes_show(struct device *device,
 	struct drm_display_mode *mode;
 	int written = 0;
 
-	mutex_lock(&connector->dev->mode_config.mutex);
+	mutex_lock(&connector->drm->mode_config.mutex);
 	list_for_each_entry(mode, &connector->modes, head) {
 		written += scnprintf(buf + written, PAGE_SIZE - written, "%s\n",
 				    mode->name);
 	}
-	mutex_unlock(&connector->dev->mode_config.mutex);
+	mutex_unlock(&connector->drm->mode_config.mutex);
 
 	return written;
 }
@@ -360,7 +360,7 @@ static const struct attribute_group *connector_dev_groups[] = {
 
 int drm_sysfs_connector_add(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct device *kdev;
 	int r;
 
@@ -471,14 +471,14 @@ EXPORT_SYMBOL(drm_sysfs_hotplug_event);
  */
 void drm_sysfs_connector_hotplug_event(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	char hotplug_str[] = "HOTPLUG=1", conn_id[21];
 	char *envp[] = { hotplug_str, conn_id, NULL };
 
 	snprintf(conn_id, sizeof(conn_id),
 		 "CONNECTOR=%u", connector->base.id);
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] generating connector hotplug event\n",
 		    connector->base.id, connector->name);
 
@@ -499,7 +499,7 @@ EXPORT_SYMBOL(drm_sysfs_connector_hotplug_event);
 void drm_sysfs_connector_property_event(struct drm_connector *connector,
 					struct drm_property *property)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	char hotplug_str[] = "HOTPLUG=1", conn_id[21], prop_id[21];
 	char *envp[4] = { hotplug_str, conn_id, prop_id, NULL };
 
@@ -511,7 +511,7 @@ void drm_sysfs_connector_property_event(struct drm_connector *connector,
 	snprintf(prop_id, ARRAY_SIZE(prop_id),
 		 "PROPERTY=%u", property->base.id);
 
-	drm_dbg_kms(connector->dev,
+	drm_dbg_kms(connector->drm,
 		    "[CONNECTOR:%d:%s] generating connector property event for [PROP:%d:%s]\n",
 		    connector->base.id, connector->name,
 		    property->base.id, property->name);
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index a031c335bdb9..90982706259d 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -88,7 +88,7 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
 	struct drm_writeback_connector *wb_connector =
 		fence_to_wb_connector(fence);
 
-	return wb_connector->base.dev->driver->name;
+	return wb_connector->base.drm->driver->name;
 }
 
 static const char *
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 3404ec1367fb..b4850f4c9b01 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -79,7 +79,7 @@ static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
 	if (dp->plat_data.panel)
 		return num_modes;
 
-	mode = drm_mode_create(connector->dev);
+	mode = drm_mode_create(connector->drm);
 	if (!mode) {
 		DRM_DEV_ERROR(dp->dev,
 			      "failed to create a new display mode.\n");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 378e5381978f..16bef23c6a73 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -69,7 +69,7 @@ static int exynos_dpi_get_modes(struct drm_connector *connector)
 	if (ctx->vm) {
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_create(connector->dev);
+		mode = drm_mode_create(connector->drm);
 		if (!mode) {
 			DRM_DEV_ERROR(ctx->dev,
 				      "failed to create a new display mode\n");
diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 3e83299113e3..9c5b09dbe208 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -441,7 +441,7 @@ static const char *force_audio_names[] = {
 
 void cdv_intel_attach_force_audio_property(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_property *prop;
 	int i;
@@ -470,7 +470,7 @@ static const char *broadcast_rgb_names[] = {
 
 void cdv_intel_attach_broadcast_rgb_property(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_property *prop;
 	int i;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index 5a0acd914f76..2bb9b92aa414 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -138,7 +138,7 @@ static void cdv_intel_crt_mode_set(struct drm_encoder *encoder,
 static bool cdv_intel_crt_detect_hotplug(struct drm_connector *connector,
 								bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	u32 hotplug_en;
 	int i, tries = 0, ret = false;
 	u32 orig;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8992a95076f2..578d179a6017 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -511,7 +511,7 @@ cdv_intel_dp_mode_valid(struct drm_connector *connector,
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
 	int max_link_clock = cdv_intel_dp_link_clock(cdv_intel_dp_max_link_bw(encoder));
 	int max_lanes = cdv_intel_dp_max_lane_count(encoder);
-	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->dev);
+	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->drm);
 
 	if (is_edp(encoder) && intel_dp->panel_fixed_mode) {
 		if (mode->hdisplay > intel_dp->panel_fixed_mode->hdisplay)
@@ -1739,7 +1739,7 @@ static int cdv_intel_dp_get_modes(struct drm_connector *connector)
 	}
 
 	if (is_edp(intel_encoder)) {
-		struct drm_device *dev = connector->dev;
+		struct drm_device *dev = connector->drm;
 		struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 
 		cdv_intel_edp_panel_vdd_off(intel_encoder);
@@ -1805,7 +1805,7 @@ cdv_intel_dp_set_property(struct drm_connector *connector,
 		      struct drm_property *property,
 		      uint64_t val)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->dev);
+	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->drm);
 	struct gma_encoder *encoder = gma_attached_encoder(connector);
 	struct cdv_intel_dp *intel_dp = encoder->dev_priv;
 	int ret;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 2d95e0471291..555c33d51ffe 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -106,7 +106,7 @@ static void cdv_hdmi_dpms(struct drm_encoder *encoder, int mode)
 
 static void cdv_hdmi_save(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct mid_intel_hdmi_priv *hdmi_priv = gma_encoder->dev_priv;
 
@@ -115,7 +115,7 @@ static void cdv_hdmi_save(struct drm_connector *connector)
 
 static void cdv_hdmi_restore(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct mid_intel_hdmi_priv *hdmi_priv = gma_encoder->dev_priv;
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index f08a6803dc18..605cc7031015 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -155,7 +155,7 @@ static void cdv_intel_lvds_restore(struct drm_connector *connector)
 static enum drm_mode_status cdv_intel_lvds_mode_valid(struct drm_connector *connector,
 			      struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct drm_display_mode *fixed_mode =
 					dev_priv->mode_dev.panel_fixed_mode;
@@ -298,7 +298,7 @@ static void cdv_intel_lvds_mode_set(struct drm_encoder *encoder,
  */
 static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 	int ret;
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index ed8626c73541..c9d1ad4c0a27 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -531,7 +531,7 @@ static enum drm_connector_status
 oaktrail_hdmi_detect(struct drm_connector *connector, bool force)
 {
 	enum drm_connector_status status;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct oaktrail_hdmi_dev *hdmi_dev = dev_priv->hdmi_priv;
 	u32 temp;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 8486de230ec9..48e1a8b0d869 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -252,7 +252,7 @@ static void psb_intel_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
 
 static void psb_intel_lvds_save(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct psb_intel_lvds_priv *lvds_priv =
@@ -291,7 +291,7 @@ static void psb_intel_lvds_save(struct drm_connector *connector)
 
 static void psb_intel_lvds_restore(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	u32 pp_status;
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct psb_intel_lvds_priv *lvds_priv =
@@ -333,7 +333,7 @@ static void psb_intel_lvds_restore(struct drm_connector *connector)
 enum drm_mode_status psb_intel_lvds_mode_valid(struct drm_connector *connector,
 				 struct drm_display_mode *mode)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->dev);
+	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->drm);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct drm_display_mode *fixed_mode =
 					dev_priv->mode_dev.panel_fixed_mode;
@@ -490,7 +490,7 @@ static void psb_intel_lvds_mode_set(struct drm_encoder *encoder,
  */
 static int psb_intel_lvds_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 	int ret = 0;
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index d6fd5d726216..91b5aa9d92ed 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -1239,7 +1239,7 @@ psb_intel_sdvo_get_edid(struct drm_connector *connector)
 static struct edid *
 psb_intel_sdvo_get_analog_edid(struct drm_connector *connector)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->dev);
+	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->drm);
 
 	return drm_get_edid(connector,
 			    &dev_priv->gmbus[dev_priv->crt_ddc_pin].adapter);
@@ -1498,7 +1498,7 @@ static void psb_intel_sdvo_get_tv_modes(struct drm_connector *connector)
 	for (i = 0; i < ARRAY_SIZE(sdvo_tv_modes); i++)
 		if (reply & (1 << i)) {
 			struct drm_display_mode *nmode;
-			nmode = drm_mode_duplicate(connector->dev,
+			nmode = drm_mode_duplicate(connector->drm,
 						   &sdvo_tv_modes[i]);
 			if (nmode)
 				drm_mode_probed_add(connector, nmode);
@@ -1508,7 +1508,7 @@ static void psb_intel_sdvo_get_tv_modes(struct drm_connector *connector)
 static void psb_intel_sdvo_get_lvds_modes(struct drm_connector *connector)
 {
 	struct psb_intel_sdvo *psb_intel_sdvo = intel_attached_sdvo(connector);
-	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->dev);
+	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->drm);
 	struct drm_display_mode *newmode;
 
 	/*
@@ -1522,7 +1522,7 @@ static void psb_intel_sdvo_get_lvds_modes(struct drm_connector *connector)
 
 	/* Fetch modes from VBT */
 	if (dev_priv->sdvo_lvds_vbt_mode != NULL) {
-		newmode = drm_mode_duplicate(connector->dev,
+		newmode = drm_mode_duplicate(connector->drm,
 					     dev_priv->sdvo_lvds_vbt_mode);
 		if (newmode != NULL) {
 			/* Guarantee the mode is preferred */
@@ -1536,7 +1536,7 @@ static void psb_intel_sdvo_get_lvds_modes(struct drm_connector *connector)
 	list_for_each_entry(newmode, &connector->probed_modes, head) {
 		if (newmode->type & DRM_MODE_TYPE_PREFERRED) {
 			psb_intel_sdvo->sdvo_lvds_fixed_mode =
-				drm_mode_duplicate(connector->dev, newmode);
+				drm_mode_duplicate(connector->drm, newmode);
 
 			drm_mode_set_crtcinfo(psb_intel_sdvo->sdvo_lvds_fixed_mode,
 					      0);
@@ -1593,7 +1593,7 @@ psb_intel_sdvo_set_property(struct drm_connector *connector,
 {
 	struct psb_intel_sdvo *psb_intel_sdvo = intel_attached_sdvo(connector);
 	struct psb_intel_sdvo_connector *psb_intel_sdvo_connector = to_psb_intel_sdvo_connector(connector);
-	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->dev);
+	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->drm);
 	uint16_t temp_value;
 	uint8_t cmd;
 	int ret;
@@ -1736,7 +1736,7 @@ psb_intel_sdvo_set_property(struct drm_connector *connector,
 
 static void psb_intel_sdvo_save(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct psb_intel_sdvo *sdvo = to_psb_intel_sdvo(&gma_encoder->base);
 
@@ -1745,7 +1745,7 @@ static void psb_intel_sdvo_save(struct drm_connector *connector)
 
 static void psb_intel_sdvo_restore(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_encoder *encoder = &gma_attached_encoder(connector)->base;
 	struct psb_intel_sdvo *sdvo = to_psb_intel_sdvo(encoder);
 	struct drm_crtc *crtc = encoder->crtc;
diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
index 034e78360d4f..4a1880a0e325 100644
--- a/drivers/gpu/drm/gud/gud_connector.c
+++ b/drivers/gpu/drm/gud/gud_connector.c
@@ -48,7 +48,8 @@ static inline struct gud_connector *to_gud_connector(struct drm_connector *conne
 
 static void gud_conn_err(struct drm_connector *connector, const char *msg, int ret)
 {
-	dev_err(connector->dev->dev, "%s: %s (ret=%d)\n", connector->name, msg, ret);
+	dev_err(connector->drm->dev, "%s: %s (ret=%d)\n", connector->name,
+		msg, ret);
 }
 
 /*
@@ -61,7 +62,7 @@ static void gud_connector_backlight_update_status_work(struct work_struct *work)
 	struct gud_connector *gconn = container_of(work, struct gud_connector, backlight_work);
 	struct drm_connector *connector = &gconn->connector;
 	struct drm_connector_state *connector_state;
-	struct drm_device *drm = connector->dev;
+	struct drm_device *drm = connector->drm;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_atomic_state *state;
 	int idx, ret;
@@ -134,7 +135,7 @@ static int gud_connector_backlight_register(struct gud_connector *gconn)
 	};
 
 	name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
-			 connector->dev->primary->index, connector->name);
+			 connector->drm->primary->index, connector->name);
 	if (!name)
 		return -ENOMEM;
 
@@ -152,11 +153,11 @@ static int gud_connector_backlight_register(struct gud_connector *gconn)
 static int gud_connector_detect(struct drm_connector *connector,
 				struct drm_modeset_acquire_ctx *ctx, bool force)
 {
-	struct gud_device *gdrm = to_gud_device(connector->dev);
+	struct gud_device *gdrm = to_gud_device(connector->drm);
 	int idx, ret;
 	u8 status;
 
-	if (!drm_dev_enter(connector->dev, &idx))
+	if (!drm_dev_enter(connector->drm, &idx))
 		return connector_status_disconnected;
 
 	if (force) {
@@ -217,14 +218,14 @@ static int gud_connector_get_edid_block(void *data, u8 *buf, unsigned int block,
 
 static int gud_connector_get_modes(struct drm_connector *connector)
 {
-	struct gud_device *gdrm = to_gud_device(connector->dev);
+	struct gud_device *gdrm = to_gud_device(connector->drm);
 	struct gud_display_mode_req *reqmodes = NULL;
 	struct gud_connector_get_edid_ctx edid_ctx;
 	unsigned int i, num_modes = 0;
 	struct edid *edid = NULL;
 	int idx, ret;
 
-	if (!drm_dev_enter(connector->dev, &idx))
+	if (!drm_dev_enter(connector->drm, &idx))
 		return 0;
 
 	edid_ctx.edid_override = true;
@@ -265,7 +266,7 @@ static int gud_connector_get_modes(struct drm_connector *connector)
 	for (i = 0; i < num_modes; i++) {
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_create(connector->dev);
+		mode = drm_mode_create(connector->drm);
 		if (!mode) {
 			num_modes = i;
 			goto out;
@@ -400,7 +401,8 @@ static int gud_connector_add_tv_mode(struct gud_device *gdrm, struct drm_connect
 	for (i = 0; i < num_modes; i++)
 		modes[i] = &buf[i * GUD_CONNECTOR_TV_MODE_NAME_LEN];
 
-	ret = drm_mode_create_tv_properties_legacy(connector->dev, num_modes, modes);
+	ret = drm_mode_create_tv_properties_legacy(connector->drm, num_modes,
+						   modes);
 free:
 	kfree(buf);
 	if (ret < 0)
@@ -412,7 +414,7 @@ static int gud_connector_add_tv_mode(struct gud_device *gdrm, struct drm_connect
 static struct drm_property *
 gud_connector_property_lookup(struct drm_connector *connector, u16 prop)
 {
-	struct drm_mode_config *config = &connector->dev->mode_config;
+	struct drm_mode_config *config = &connector->drm->mode_config;
 
 	switch (prop) {
 	case GUD_PROPERTY_TV_LEFT_MARGIN:
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
index 410bd019bb35..7f332da1ad32 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -26,7 +26,7 @@
 static void hibmc_set_i2c_signal(void *data, u32 mask, int value)
 {
 	struct hibmc_connector *hibmc_connector = data;
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(hibmc_connector->base.dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(hibmc_connector->base.drm);
 	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
 
 	if (value) {
@@ -46,7 +46,7 @@ static void hibmc_set_i2c_signal(void *data, u32 mask, int value)
 static int hibmc_get_i2c_signal(void *data, u32 mask)
 {
 	struct hibmc_connector *hibmc_connector = data;
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(hibmc_connector->base.dev);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(hibmc_connector->base.drm);
 	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
 
 	if ((tmp_dir & mask) != mask) {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 8c6d2ea2a472..380125fd8bcb 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -36,8 +36,8 @@ static int hibmc_connector_get_modes(struct drm_connector *connector)
 	}
 
 	count = drm_add_modes_noedid(connector,
-				     connector->dev->mode_config.max_width,
-				     connector->dev->mode_config.max_height);
+				     connector->drm->mode_config.max_width,
+				     connector->drm->mode_config.max_height);
 	drm_set_preferred_mode(connector, 1024, 768);
 
 out:
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 6c6b57298797..c61f811b74f5 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -52,12 +52,12 @@ static int hyperv_blit_to_vram_fullscreen(struct drm_framebuffer *fb,
 
 static int hyperv_connector_get_modes(struct drm_connector *connector)
 {
-	struct hyperv_drm_device *hv = to_hv(connector->dev);
+	struct hyperv_drm_device *hv = to_hv(connector->drm);
 	int count;
 
 	count = drm_add_modes_noedid(connector,
-				     connector->dev->mode_config.max_width,
-				     connector->dev->mode_config.max_height);
+				     connector->drm->mode_config.max_width,
+				     connector->drm->mode_config.max_height);
 	drm_set_preferred_mode(connector, hv->preferred_width,
 			       hv->preferred_height);
 
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index f01e28ed5831..53341c03d759 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -777,7 +777,7 @@ static void tda998x_detect_work(struct work_struct *work)
 {
 	struct tda998x_priv *priv =
 		container_of(work, struct tda998x_priv, detect_work);
-	struct drm_device *dev = priv->connector.dev;
+	struct drm_device *dev = priv->connector.drm;
 
 	if (dev)
 		drm_kms_helper_hotplug_event(dev);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 7cf51dd8c056..fe573d1d520c 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -58,7 +58,7 @@ int intel_digital_connector_atomic_get_property(struct drm_connector *connector,
 						struct drm_property *property,
 						u64 *val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_digital_connector_state *intel_conn_state =
 		to_intel_digital_connector_state(state);
@@ -91,7 +91,7 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 						struct drm_property *property,
 						u64 val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_digital_connector_state *intel_conn_state =
 		to_intel_digital_connector_state(state);
diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 2e8f17c04522..19637048faba 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -83,7 +83,7 @@ static u32 scale_hw_to_user(struct intel_connector *connector,
 
 u32 intel_backlight_invert_pwm_level(struct intel_connector *connector, u32 val)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	drm_WARN_ON(&i915->drm, panel->backlight.pwm_level_max == 0);
@@ -102,7 +102,7 @@ u32 intel_backlight_invert_pwm_level(struct intel_connector *connector, u32 val)
 void intel_backlight_set_pwm_level(const struct drm_connector_state *conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s] set backlight PWM = %d\n",
@@ -112,7 +112,7 @@ void intel_backlight_set_pwm_level(const struct drm_connector_state *conn_state,
 
 u32 intel_backlight_level_to_pwm(struct intel_connector *connector, u32 val)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	drm_WARN_ON_ONCE(&i915->drm,
@@ -126,7 +126,7 @@ u32 intel_backlight_level_to_pwm(struct intel_connector *connector, u32 val)
 
 u32 intel_backlight_level_from_pwm(struct intel_connector *connector, u32 val)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	drm_WARN_ON_ONCE(&i915->drm,
@@ -142,21 +142,21 @@ u32 intel_backlight_level_from_pwm(struct intel_connector *connector, u32 val)
 
 static u32 lpt_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	return intel_de_read(i915, BLC_PWM_PCH_CTL2) & BACKLIGHT_DUTY_CYCLE_MASK;
 }
 
 static u32 pch_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	return intel_de_read(i915, BLC_PWM_CPU_CTL) & BACKLIGHT_DUTY_CYCLE_MASK;
 }
 
 static u32 i9xx_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 val;
 
@@ -176,7 +176,7 @@ static u32 i9xx_get_backlight(struct intel_connector *connector, enum pipe unuse
 
 static u32 vlv_get_backlight(struct intel_connector *connector, enum pipe pipe)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	if (drm_WARN_ON(&i915->drm, pipe != PIPE_A && pipe != PIPE_B))
 		return 0;
@@ -186,7 +186,7 @@ static u32 vlv_get_backlight(struct intel_connector *connector, enum pipe pipe)
 
 static u32 bxt_get_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	return intel_de_read(i915, BXT_BLC_PWM_DUTY(panel->backlight.controller));
@@ -204,7 +204,7 @@ static u32 ext_pwm_get_backlight(struct intel_connector *connector, enum pipe un
 static void lpt_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	u32 val;
 
 	val = intel_de_read(i915, BLC_PWM_PCH_CTL2) & ~BACKLIGHT_DUTY_CYCLE_MASK;
@@ -214,7 +214,7 @@ static void lpt_set_backlight(const struct drm_connector_state *conn_state, u32
 static void pch_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	u32 tmp;
 
 	tmp = intel_de_read(i915, BLC_PWM_CPU_CTL) & ~BACKLIGHT_DUTY_CYCLE_MASK;
@@ -224,7 +224,7 @@ static void pch_set_backlight(const struct drm_connector_state *conn_state, u32
 static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 tmp, mask;
 
@@ -252,7 +252,7 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
 static void vlv_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	enum pipe pipe = to_intel_crtc(conn_state->crtc)->pipe;
 	u32 tmp;
 
@@ -263,7 +263,7 @@ static void vlv_set_backlight(const struct drm_connector_state *conn_state, u32
 static void bxt_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	intel_de_write(i915, BXT_BLC_PWM_DUTY(panel->backlight.controller), level);
@@ -281,7 +281,7 @@ static void
 intel_panel_actually_set_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s] set backlight level = %d\n",
@@ -297,7 +297,7 @@ void intel_backlight_set_acpi(const struct drm_connector_state *conn_state,
 			      u32 user_level, u32 user_max)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 hw_level;
 
@@ -332,7 +332,7 @@ void intel_backlight_set_acpi(const struct drm_connector_state *conn_state,
 static void lpt_disable_backlight(const struct drm_connector_state *old_conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	u32 tmp;
 
 	intel_backlight_set_pwm_level(old_conn_state, level);
@@ -358,7 +358,7 @@ static void lpt_disable_backlight(const struct drm_connector_state *old_conn_sta
 static void pch_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	intel_backlight_set_pwm_level(old_conn_state, val);
 
@@ -374,7 +374,7 @@ static void i9xx_disable_backlight(const struct drm_connector_state *old_conn_st
 
 static void i965_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
-	struct drm_i915_private *i915 = to_i915(old_conn_state->connector->dev);
+	struct drm_i915_private *i915 = to_i915(old_conn_state->connector->drm);
 
 	intel_backlight_set_pwm_level(old_conn_state, val);
 
@@ -384,7 +384,7 @@ static void i965_disable_backlight(const struct drm_connector_state *old_conn_st
 static void vlv_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	enum pipe pipe = to_intel_crtc(old_conn_state->crtc)->pipe;
 
 	intel_backlight_set_pwm_level(old_conn_state, val);
@@ -395,7 +395,7 @@ static void vlv_disable_backlight(const struct drm_connector_state *old_conn_sta
 static void bxt_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	intel_backlight_set_pwm_level(old_conn_state, val);
@@ -410,7 +410,7 @@ static void bxt_disable_backlight(const struct drm_connector_state *old_conn_sta
 static void cnp_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	intel_backlight_set_pwm_level(old_conn_state, val);
@@ -433,7 +433,7 @@ static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn
 void intel_backlight_disable(const struct drm_connector_state *old_conn_state)
 {
 	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	if (!panel->backlight.present)
@@ -465,7 +465,7 @@ static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
 				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 pch_ctl1, pch_ctl2;
 
@@ -509,7 +509,7 @@ static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
 				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 cpu_ctl2, pch_ctl1, pch_ctl2;
@@ -557,7 +557,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
 				  const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 ctl, freq;
 
@@ -597,7 +597,7 @@ static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
 				  const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	enum pipe pipe = to_intel_crtc(conn_state->crtc)->pipe;
 	u32 ctl, ctl2, freq;
@@ -633,7 +633,7 @@ static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
 				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	enum pipe pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
 	u32 ctl, ctl2;
@@ -664,7 +664,7 @@ static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
 				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	enum pipe pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
 	u32 pwm_ctl, val;
@@ -714,7 +714,7 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
 				 const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 pwm_ctl;
 
@@ -779,7 +779,7 @@ void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	enum pipe pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
 
@@ -798,7 +798,7 @@ void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
 #if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
 static u32 intel_panel_get_backlight(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 val = 0;
 
@@ -828,7 +828,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
 				      u32 user_level, u32 user_max)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 hw_level;
 
@@ -851,7 +851,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
 static int intel_backlight_device_update_status(struct backlight_device *bd)
 {
 	struct intel_connector *connector = bl_get_data(bd);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	drm_modeset_lock(&i915->drm.mode_config.connection_mutex, NULL);
@@ -885,7 +885,7 @@ static int intel_backlight_device_update_status(struct backlight_device *bd)
 static int intel_backlight_device_get_brightness(struct backlight_device *bd)
 {
 	struct intel_connector *connector = bl_get_data(bd);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
@@ -911,7 +911,7 @@ static const struct backlight_ops intel_backlight_device_ops = {
 
 int intel_backlight_device_register(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	struct backlight_properties props;
 	struct backlight_device *bd;
@@ -1008,7 +1008,7 @@ void intel_backlight_device_unregister(struct intel_connector *connector)
  */
 static u32 cnp_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	return DIV_ROUND_CLOSEST(KHz(RUNTIME_INFO(i915)->rawclk_freq),
 				 pwm_freq_hz);
@@ -1047,7 +1047,7 @@ static u32 spt_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
  */
 static u32 lpt_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 mul, clock;
 
@@ -1070,7 +1070,7 @@ static u32 lpt_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
  */
 static u32 pch_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	return DIV_ROUND_CLOSEST(KHz(RUNTIME_INFO(i915)->rawclk_freq),
 				 pwm_freq_hz * 128);
@@ -1086,7 +1086,7 @@ static u32 pch_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
  */
 static u32 i9xx_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	int clock;
 
 	if (IS_PINEVIEW(i915))
@@ -1104,7 +1104,7 @@ static u32 i9xx_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
  */
 static u32 i965_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	int clock;
 
 	if (IS_G4X(i915))
@@ -1122,7 +1122,7 @@ static u32 i965_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
  */
 static u32 vlv_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	int mul, clock;
 
 	if ((intel_de_read(i915, CBR1_VLV) & CBR_PWM_CLOCK_MUX_SELECT) == 0) {
@@ -1141,7 +1141,7 @@ static u32 vlv_hz_to_pwm(struct intel_connector *connector, u32 pwm_freq_hz)
 
 static u16 get_vbt_pwm_freq(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	u16 pwm_freq_hz = connector->panel.vbt.backlight.pwm_freq_hz;
 
 	if (pwm_freq_hz) {
@@ -1160,7 +1160,7 @@ static u16 get_vbt_pwm_freq(struct intel_connector *connector)
 
 static u32 get_backlight_max_vbt(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u16 pwm_freq_hz = get_vbt_pwm_freq(connector);
 	u32 pwm;
@@ -1186,7 +1186,7 @@ static u32 get_backlight_max_vbt(struct intel_connector *connector)
  */
 static u32 get_backlight_min_vbt(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	int min;
 
@@ -1212,7 +1212,7 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
 
 static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 cpu_ctl2, pch_ctl1, pch_ctl2, val;
 	bool alt, cpu_mode;
@@ -1269,7 +1269,7 @@ static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unus
 
 static int pch_setup_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 cpu_ctl2, pch_ctl1, pch_ctl2;
 
@@ -1300,7 +1300,7 @@ static int pch_setup_backlight(struct intel_connector *connector, enum pipe unus
 
 static int i9xx_setup_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 ctl, val;
 
@@ -1342,7 +1342,7 @@ static int i9xx_setup_backlight(struct intel_connector *connector, enum pipe unu
 
 static int i965_setup_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 ctl, ctl2;
 
@@ -1375,7 +1375,7 @@ static int i965_setup_backlight(struct intel_connector *connector, enum pipe unu
 
 static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 ctl, ctl2;
 
@@ -1408,7 +1408,7 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
 static int
 bxt_setup_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 pwm_ctl, val;
 
@@ -1473,7 +1473,7 @@ static bool cnp_backlight_controller_is_valid(struct drm_i915_private *i915, int
 static int
 cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	u32 pwm_ctl;
 
@@ -1517,7 +1517,7 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
 static int ext_pwm_setup_backlight(struct intel_connector *connector,
 				   enum pipe pipe)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	const char *desc;
 	u32 level;
@@ -1626,7 +1626,7 @@ void intel_backlight_update(struct intel_atomic_state *state,
 			    const struct drm_connector_state *conn_state)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	if (!panel->backlight.present)
@@ -1641,7 +1641,7 @@ void intel_backlight_update(struct intel_atomic_state *state,
 
 int intel_backlight_setup(struct intel_connector *connector, enum pipe pipe)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	int ret;
 
@@ -1787,7 +1787,7 @@ void intel_backlight_init_funcs(struct intel_panel *panel)
 {
 	struct intel_connector *connector =
 		container_of(panel, struct intel_connector, panel);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	if (connector->base.connector_type == DRM_MODE_CONNECTOR_DSI &&
 	    intel_dsi_dcs_init_backlight_funcs(connector) == 0)
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index ff3bcadebe59..53d6591f1308 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -118,7 +118,7 @@ int intel_connector_register(struct drm_connector *connector)
 	if (ret)
 		goto err;
 
-	if (i915_inject_probe_failure(to_i915(connector->dev))) {
+	if (i915_inject_probe_failure(to_i915(connector->drm))) {
 		ret = -EFAULT;
 		goto err_backlight;
 	}
@@ -162,7 +162,7 @@ bool intel_connector_get_hw_state(struct intel_connector *connector)
 
 enum pipe intel_connector_get_pipe(struct intel_connector *connector)
 {
-	struct drm_device *dev = connector->base.dev;
+	struct drm_device *dev = connector->base.drm;
 
 	drm_WARN_ON(dev,
 		    !drm_modeset_is_locked(&dev->mode_config.connection_mutex));
@@ -222,7 +222,7 @@ static const struct drm_prop_enum_list force_audio_names[] = {
 void
 intel_attach_force_audio_property(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_property *prop;
 
@@ -249,7 +249,7 @@ static const struct drm_prop_enum_list broadcast_rgb_names[] = {
 void
 intel_attach_broadcast_rgb_property(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_property *prop;
 
@@ -271,9 +271,9 @@ intel_attach_broadcast_rgb_property(struct drm_connector *connector)
 void
 intel_attach_aspect_ratio_property(struct drm_connector *connector)
 {
-	if (!drm_mode_create_aspect_ratio_property(connector->dev))
+	if (!drm_mode_create_aspect_ratio_property(connector->drm))
 		drm_object_attach_property(&connector->base,
-			connector->dev->mode_config.aspect_ratio_property,
+			connector->drm->mode_config.aspect_ratio_property,
 			DRM_MODE_PICTURE_ASPECT_NONE);
 }
 
@@ -294,7 +294,7 @@ intel_attach_dp_colorspace_property(struct drm_connector *connector)
 void
 intel_attach_scaling_mode_property(struct drm_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	u32 scaling_modes;
 
 	scaling_modes = BIT(DRM_MODE_SCALE_ASPECT) |
diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index ab7cd5e60a0a..608ec14776d5 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -345,7 +345,7 @@ static enum drm_mode_status
 intel_crt_mode_valid(struct drm_connector *connector,
 		     struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	int max_dotclk = dev_priv->max_dotclk_freq;
 	int max_clock;
@@ -458,7 +458,7 @@ static int hsw_crt_compute_config(struct intel_encoder *encoder,
 
 static bool ilk_crt_detect_hotplug(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct intel_crt *crt = intel_attached_crt(to_intel_connector(connector));
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 adpa;
@@ -508,7 +508,7 @@ static bool ilk_crt_detect_hotplug(struct drm_connector *connector)
 
 static bool valleyview_crt_detect_hotplug(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct intel_crt *crt = intel_attached_crt(to_intel_connector(connector));
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	bool reenable_hpd;
@@ -563,7 +563,7 @@ static bool valleyview_crt_detect_hotplug(struct drm_connector *connector)
 
 static bool intel_crt_detect_hotplug(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 stat;
 	bool ret = false;
@@ -617,7 +617,7 @@ static const struct drm_edid *intel_crt_get_edid(struct drm_connector *connector
 	drm_edid = drm_edid_read_ddc(connector, i2c);
 
 	if (!drm_edid && !intel_gmbus_is_forced_bit(i2c)) {
-		drm_dbg_kms(connector->dev,
+		drm_dbg_kms(connector->drm,
 			    "CRT GMBUS EDID read failed, retry using GPIO bit-banging\n");
 		intel_gmbus_force_bit(i2c, true);
 		drm_edid = drm_edid_read_ddc(connector, i2c);
@@ -823,7 +823,7 @@ intel_crt_detect(struct drm_connector *connector,
 		 struct drm_modeset_acquire_ctx *ctx,
 		 bool force)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	struct intel_crt *crt = intel_attached_crt(to_intel_connector(connector));
 	struct intel_encoder *intel_encoder = &crt->base;
 	struct drm_atomic_state *state;
@@ -918,7 +918,7 @@ intel_crt_detect(struct drm_connector *connector,
 
 static int intel_crt_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crt *crt = intel_attached_crt(to_intel_connector(connector));
 	struct intel_encoder *intel_encoder = &crt->base;
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e60baa96a7ae..7ada98354b17 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -688,7 +688,7 @@ int intel_ddi_toggle_hdcp_bits(struct intel_encoder *intel_encoder,
 
 bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
 {
-	struct drm_device *dev = intel_connector->base.dev;
+	struct drm_device *dev = intel_connector->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_encoder *encoder = intel_attached_encoder(intel_connector);
 	int type = intel_connector->base.connector_type;
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 165e2c7e3126..53d577a71c2b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1125,7 +1125,7 @@ DEFINE_SHOW_ATTRIBUTE(i915_panel);
 static int i915_hdcp_sink_capability_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct intel_connector *intel_connector = to_intel_connector(connector);
 	int ret;
 
@@ -1152,7 +1152,7 @@ DEFINE_SHOW_ATTRIBUTE(i915_hdcp_sink_capability);
 static int i915_lpsp_capability_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct intel_encoder *encoder;
 	bool lpsp_capable = false;
 
@@ -1192,7 +1192,7 @@ DEFINE_SHOW_ATTRIBUTE(i915_lpsp_capability);
 static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc;
 	struct intel_dp *intel_dp;
 	struct drm_modeset_acquire_ctx ctx;
@@ -1304,7 +1304,7 @@ static const struct file_operations i915_dsc_fec_support_fops = {
 static int i915_dsc_bpc_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc;
 	struct intel_crtc_state *crtc_state;
 	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
@@ -1370,7 +1370,7 @@ static const struct file_operations i915_dsc_bpc_fops = {
 static int i915_dsc_output_format_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc;
 	struct intel_crtc_state *crtc_state;
 	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
@@ -1479,7 +1479,7 @@ void intel_connector_debugfs_add(struct intel_connector *intel_connector)
 {
 	struct drm_connector *connector = &intel_connector->base;
 	struct dentry *root = connector->debugfs_entry;
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 
 	/* The connector must have been registered beforehands. */
 	if (!root)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8aec1cfd53b8..0cd561603ee1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1108,7 +1108,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	const struct drm_display_mode *fixed_mode;
 	int target_clock = mode->clock;
 	int max_rate, mode_rate, max_lanes, max_link_clock;
@@ -1439,7 +1439,7 @@ intel_dp_adjust_compliance_config(struct intel_dp *intel_dp,
 
 static bool has_seamless_m_n(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	/*
 	 * Seamless M/N reprogramming only implemented
@@ -2099,7 +2099,7 @@ static bool can_enable_drrs(struct intel_connector *connector,
 			    const struct intel_crtc_state *pipe_config,
 			    const struct drm_display_mode *downclock_mode)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	if (pipe_config->vrr.enable)
 		return false;
@@ -2129,7 +2129,7 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 			     struct intel_crtc_state *pipe_config,
 			     int output_bpp)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	const struct drm_display_mode *downclock_mode =
 		intel_panel_downclock_mode(connector, &pipe_config->hw.adjusted_mode);
 	int pixel_clock;
@@ -3011,7 +3011,7 @@ static void intel_edp_mso_mode_fixup(struct intel_connector *connector,
 				     struct drm_display_mode *mode)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	int n = intel_dp->mso_link_count;
 	int overlap = intel_dp->mso_pixel_overlap;
 
@@ -4851,7 +4851,7 @@ intel_dp_detect(struct drm_connector *connector,
 		struct drm_modeset_acquire_ctx *ctx,
 		bool force)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	struct intel_dp *intel_dp = intel_attached_dp(to_intel_connector(connector));
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &dig_port->base;
@@ -5006,7 +5006,7 @@ static int intel_dp_get_modes(struct drm_connector *connector)
 		struct intel_dp *intel_dp = intel_attached_dp(intel_connector);
 		struct drm_display_mode *mode;
 
-		mode = drm_dp_downstream_mode(connector->dev,
+		mode = drm_dp_downstream_mode(connector->drm,
 					      intel_dp->dpcd,
 					      intel_dp->downstream_ports);
 		if (mode) {
@@ -5021,7 +5021,7 @@ static int intel_dp_get_modes(struct drm_connector *connector)
 static int
 intel_dp_connector_register(struct drm_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct intel_dp *intel_dp = intel_attached_dp(to_intel_connector(connector));
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_lspcon *lspcon = &dig_port->lspcon;
@@ -5208,7 +5208,7 @@ static int intel_modeset_synced_crtcs(struct intel_atomic_state *state,
 static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 					   struct drm_atomic_state *_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(conn->dev);
+	struct drm_i915_private *dev_priv = to_i915(conn->drm);
 	struct intel_atomic_state *state = to_intel_atomic_state(_state);
 	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(_state, conn);
 	struct intel_connector *intel_conn = to_intel_connector(conn);
@@ -5247,7 +5247,7 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
 {
 	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 
 	spin_lock_irq(&i915->irq_lock);
 	i915->display.hotplug.event_bits |= BIT(encoder->hpd_pin);
@@ -5367,7 +5367,7 @@ has_gamut_metadata_dip(struct intel_encoder *encoder)
 static void
 intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	enum port port = dp_to_dig_port(intel_dp)->base.port;
 
 	if (!intel_dp_is_edp(intel_dp))
@@ -5401,7 +5401,7 @@ static void
 intel_edp_add_properties(struct intel_dp *intel_dp)
 {
 	struct intel_connector *connector = intel_dp->attached_connector;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	const struct drm_display_mode *fixed_mode =
 		intel_panel_preferred_fixed_mode(connector);
 
@@ -5588,17 +5588,17 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 	intel_connector = container_of(work, typeof(*intel_connector),
 				       modeset_retry_work);
 	connector = &intel_connector->base;
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
+	drm_dbg_kms(connector->drm, "[CONNECTOR:%d:%s]\n", connector->base.id,
 		    connector->name);
 
 	/* Grab the locks before changing connector property*/
-	mutex_lock(&connector->dev->mode_config.mutex);
+	mutex_lock(&connector->drm->mode_config.mutex);
 	/* Set connector link status to BAD and send a Uevent to notify
 	 * userspace to do a modeset.
 	 */
 	drm_connector_set_link_status_property(connector,
 					       DRM_MODE_LINK_STATUS_BAD);
-	mutex_unlock(&connector->dev->mode_config.mutex);
+	mutex_unlock(&connector->drm->mode_config.mutex);
 	/* Send Hotplug uevent so userspace can reprobe */
 	drm_kms_helper_connector_hotplug_event(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 95cc5251843e..64907a3af0cc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -114,7 +114,7 @@ static bool is_intel_tcon_cap(const u8 tcon_cap[4])
 static bool
 intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	struct drm_dp_aux *aux = &intel_dp->aux;
 	struct intel_panel *panel = &connector->panel;
@@ -165,7 +165,7 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
 static u32
 intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	u8 tmp;
@@ -202,7 +202,7 @@ static void
 intel_dp_aux_hdr_set_aux_backlight(const struct drm_connector_state *conn_state, u32 level)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_device *dev = connector->base.dev;
+	struct drm_device *dev = connector->base.drm;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	u8 buf[4] = { 0 };
 
@@ -236,7 +236,7 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct intel_panel *panel = &connector->panel;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	int ret;
 	u8 old_ctrl, ctrl;
@@ -290,7 +290,7 @@ static const char *dpcd_vs_pwm_str(bool aux)
 static int
 intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pipe)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 	struct drm_luminance_range_info *luminance_range =
 		&connector->base.display_info.luminance_range;
@@ -480,7 +480,7 @@ static const struct intel_panel_bl_funcs intel_dp_vesa_bl_funcs = {
 
 int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 {
-	struct drm_device *dev = connector->base.dev;
+	struct drm_device *dev = connector->base.drm;
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index e0c177161407..631d60184b4b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -667,7 +667,7 @@ intel_dp_mst_toggle_hdcp_stream_select(struct intel_connector *connector,
 				       bool enable)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
@@ -685,7 +685,7 @@ intel_dp_mst_hdcp_stream_encryption(struct intel_connector *connector,
 				    bool enable)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder = hdcp->stream_transcoder;
@@ -719,7 +719,7 @@ intel_dp_mst_hdcp2_stream_encryption(struct intel_connector *connector,
 				     bool enable)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum transcoder cpu_transcoder = hdcp->stream_transcoder;
@@ -796,7 +796,7 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
 int intel_dp_hdcp_init(struct intel_digital_port *dig_port,
 		       struct intel_connector *intel_connector)
 {
-	struct drm_device *dev = intel_connector->base.dev;
+	struct drm_device *dev = intel_connector->base.drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_encoder *intel_encoder = &dig_port->base;
 	enum port port = intel_encoder->port;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index e4ef3833c1ed..0f327ce194bd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -81,7 +81,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
 	struct drm_dp_mst_topology_state *mst_state;
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int bpp, slots = -EINVAL;
@@ -183,7 +183,7 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
 	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int slots = -EINVAL;
@@ -565,7 +565,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 		drm_atomic_get_mst_payload_state(old_mst_state, connector->port);
 	struct drm_dp_mst_atomic_payload *new_payload =
 		drm_atomic_get_mst_payload_state(new_mst_state, connector->port);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	drm_dbg_kms(&i915->drm, "active links %d\n",
 		    intel_dp->active_mst_links);
@@ -588,7 +588,7 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	bool last_mst_stream;
 
 	intel_dp->active_mst_links--;
@@ -902,13 +902,13 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
 			    struct drm_modeset_acquire_ctx *ctx,
 			    enum drm_mode_status *status)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	struct intel_connector *intel_connector = to_intel_connector(connector);
 	struct intel_dp *intel_dp = intel_connector->mst_port;
 	struct drm_dp_mst_topology_mgr *mgr = &intel_dp->mst_mgr;
 	struct drm_dp_mst_port *port = intel_connector->port;
 	const int min_bpp = 18;
-	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
+	int max_dotclk = to_i915(connector->drm)->max_dotclk_freq;
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 	int ret;
 	bool dsc = false, bigjoiner = false;
@@ -1014,7 +1014,7 @@ static int
 intel_dp_mst_detect(struct drm_connector *connector,
 		    struct drm_modeset_acquire_ctx *ctx, bool force)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct intel_connector *intel_connector = to_intel_connector(connector);
 	struct intel_dp *intel_dp = intel_connector->mst_port;
 
@@ -1063,7 +1063,7 @@ static int intel_dp_mst_add_properties(struct intel_dp *intel_dp,
 				       struct drm_connector *connector,
 				       const char *pathprop)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 
 	drm_object_attach_property(&connector->base,
 				   i915->drm.mode_config.path_property, 0);
diff --git a/drivers/gpu/drm/i915/display/intel_dsi.c b/drivers/gpu/drm/i915/display/intel_dsi.c
index 5efdd471ac2b..728620531032 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi.c
@@ -40,11 +40,11 @@ int intel_dsi_get_modes(struct drm_connector *connector)
 enum drm_mode_status intel_dsi_mode_valid(struct drm_connector *connector,
 					  struct drm_display_mode *mode)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	struct intel_connector *intel_connector = to_intel_connector(connector);
 	const struct drm_display_mode *fixed_mode =
 		intel_panel_fixed_mode(intel_connector, mode);
-	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
+	int max_dotclk = to_i915(connector->drm)->max_dotclk_freq;
 	enum drm_mode_status status;
 
 	drm_dbg_kms(&dev_priv->drm, "\n");
@@ -99,7 +99,7 @@ struct intel_dsi_host *intel_dsi_host_init(struct intel_dsi *intel_dsi,
 enum drm_panel_orientation
 intel_dsi_get_panel_orientation(struct intel_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	enum drm_panel_orientation orientation;
 
 	orientation = connector->panel.vbt.dsi.orientation;
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index 049443245310..3f2e7ccccef7 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -162,7 +162,7 @@ static void dcs_enable_backlight(const struct intel_crtc_state *crtc_state,
 static int dcs_setup_backlight(struct intel_connector *connector,
 			       enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_panel *panel = &connector->panel;
 
 	if (panel->vbt.backlight.brightness_precision_bits > 8)
@@ -189,7 +189,7 @@ static const struct intel_panel_bl_funcs dcs_bl_funcs = {
 
 int intel_dsi_dcs_init_backlight_funcs(struct intel_connector *intel_connector)
 {
-	struct drm_device *dev = intel_connector->base.dev;
+	struct drm_device *dev = intel_connector->base.drm;
 	struct intel_encoder *encoder = intel_attached_encoder(intel_connector);
 	struct intel_panel *panel = &intel_connector->panel;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index c7935ea498c4..2668362be33a 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -246,7 +246,7 @@ static const u8 *mipi_exec_delay(struct intel_dsi *intel_dsi, const u8 *data)
 static void vlv_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	struct gpio_map *map;
 	u16 pconf0, padval;
 	u32 tmp;
@@ -294,7 +294,7 @@ static void vlv_exec_gpio(struct intel_connector *connector,
 static void chv_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	u16 cfg0, cfg1;
 	u16 family_num;
 	u8 port;
@@ -348,7 +348,7 @@ static void chv_exec_gpio(struct intel_connector *connector,
 static void bxt_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	/* XXX: this table is a quick ugly hack. */
 	static struct gpio_desc *bxt_gpio_table[U8_MAX + 1];
 	struct gpio_desc *gpio_desc = bxt_gpio_table[gpio_index];
@@ -375,7 +375,7 @@ static void bxt_exec_gpio(struct intel_connector *connector,
 static void icl_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 
 	drm_dbg_kms(&dev_priv->drm, "Skipping ICL GPIO element execution\n");
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
index 9884678743b6..d69f288ce644 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.c
+++ b/drivers/gpu/drm/i915/display/intel_dvo.c
@@ -126,7 +126,7 @@ static struct intel_dvo *intel_attached_dvo(struct intel_connector *connector)
 
 static bool intel_dvo_connector_get_hw_state(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_encoder *encoder = intel_attached_encoder(connector);
 	struct intel_dvo *intel_dvo = enc_to_dvo(encoder);
 	enum port port = encoder->port;
@@ -220,7 +220,7 @@ intel_dvo_mode_valid(struct drm_connector *_connector,
 	struct intel_dvo *intel_dvo = intel_attached_dvo(connector);
 	const struct drm_display_mode *fixed_mode =
 		intel_panel_fixed_mode(connector, mode);
-	int max_dotclk = to_i915(connector->base.dev)->max_dotclk_freq;
+	int max_dotclk = to_i915(connector->base.drm)->max_dotclk_freq;
 	int target_clock = mode->clock;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
@@ -313,7 +313,7 @@ static enum drm_connector_status
 intel_dvo_detect(struct drm_connector *_connector, bool force)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_dvo *intel_dvo = intel_attached_dvo(connector);
 
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s]\n",
@@ -328,7 +328,7 @@ intel_dvo_detect(struct drm_connector *_connector, bool force)
 static int intel_dvo_get_modes(struct drm_connector *_connector)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	int num_modes;
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 5ed450111f77..b7cc69e5c2c3 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -164,7 +164,7 @@ bool intel_hdcp_capable(struct intel_connector *connector)
 bool intel_hdcp2_capable(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	bool capable = false;
 
@@ -378,7 +378,7 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
 				u8 *ksv_fifo, u8 num_downstream, u8 *bstatus)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
 	enum port port = dig_port->base.port;
 	u32 vprime, sha_text, sha_leftovers, rep_ctl;
@@ -620,7 +620,7 @@ static
 int intel_hdcp_auth_downstream(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
 	u8 bstatus[2], num_downstream, *ksv_fifo;
 	int ret, i, tries = 3;
@@ -703,7 +703,7 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 static int intel_hdcp_auth(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	const struct intel_hdcp_shim *shim = hdcp->shim;
 	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
@@ -875,7 +875,7 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 static int _intel_hdcp_disable(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
@@ -929,7 +929,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 
 static int _intel_hdcp_enable(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int i, ret, tries = 3;
 
@@ -980,12 +980,12 @@ static struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
 static void intel_hdcp_update_value(struct intel_connector *connector,
 				    u64 value, bool update_property)
 {
-	struct drm_device *dev = connector->base.dev;
+	struct drm_device *dev = connector->base.drm;
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
-	drm_WARN_ON(connector->base.dev, !mutex_is_locked(&hdcp->mutex));
+	drm_WARN_ON(connector->base.drm, !mutex_is_locked(&hdcp->mutex));
 
 	if (hdcp->value == value)
 		return;
@@ -1010,7 +1010,7 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
 static int intel_hdcp_check_link(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder;
@@ -1082,7 +1082,7 @@ static void intel_hdcp_prop_work(struct work_struct *work)
 	struct intel_hdcp *hdcp = container_of(work, struct intel_hdcp,
 					       prop_work);
 	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	drm_modeset_lock(&i915->drm.mode_config.connection_mutex, NULL);
 	mutex_lock(&hdcp->mutex);
@@ -1114,7 +1114,7 @@ hdcp2_prepare_ake_init(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1144,7 +1144,7 @@ hdcp2_verify_rx_cert_prepare_km(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1172,7 +1172,7 @@ static int hdcp2_verify_hprime(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1198,7 +1198,7 @@ hdcp2_store_pairing_info(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1225,7 +1225,7 @@ hdcp2_prepare_lc_init(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1252,7 +1252,7 @@ hdcp2_verify_lprime(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1278,7 +1278,7 @@ static int hdcp2_prepare_skey(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1307,7 +1307,7 @@ hdcp2_verify_rep_topology_prepare_ack(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1337,7 +1337,7 @@ hdcp2_verify_mprime(struct intel_connector *connector,
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1361,7 +1361,7 @@ static int hdcp2_authenticate_port(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1385,7 +1385,7 @@ static int hdcp2_authenticate_port(struct intel_connector *connector)
 static int hdcp2_close_session(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct i915_hdcp_arbiter *arbiter;
 	int ret;
 
@@ -1413,7 +1413,7 @@ static int hdcp2_deauthenticate_port(struct intel_connector *connector)
 static int hdcp2_authentication_key_exchange(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	union {
 		struct hdcp2_ake_init ake_init;
@@ -1608,7 +1608,7 @@ static
 int hdcp2_authenticate_repeater_topology(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	union {
 		struct hdcp2_rep_send_receiverid_list recvid_list;
@@ -1683,7 +1683,7 @@ int hdcp2_authenticate_repeater_topology(struct intel_connector *connector)
 static int hdcp2_authenticate_sink(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	const struct intel_hdcp_shim *shim = hdcp->shim;
 	int ret;
@@ -1730,7 +1730,7 @@ static int hdcp2_authenticate_sink(struct intel_connector *connector)
 static int hdcp2_enable_stream_encryption(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
@@ -1771,7 +1771,7 @@ static int hdcp2_enable_stream_encryption(struct intel_connector *connector)
 static int hdcp2_enable_encryption(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
@@ -1810,7 +1810,7 @@ static int hdcp2_enable_encryption(struct intel_connector *connector)
 static int hdcp2_disable_encryption(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
@@ -1847,7 +1847,7 @@ static int hdcp2_disable_encryption(struct intel_connector *connector)
 static int
 hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	int i, tries = 3, ret;
 
 	if (!connector->hdcp.is_repeater)
@@ -1876,7 +1876,7 @@ hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	int ret = 0, i, tries = 3;
 
 	for (i = 0; i < tries && !dig_port->hdcp_auth_status; i++) {
@@ -1929,7 +1929,7 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 
 static int _intel_hdcp2_enable(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
@@ -1956,7 +1956,7 @@ static int
 _intel_hdcp2_disable(struct intel_connector *connector, bool hdcp2_link_recovery)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
@@ -1994,7 +1994,7 @@ _intel_hdcp2_disable(struct intel_connector *connector, bool hdcp2_link_recovery
 static int intel_hdcp2_check_link(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder;
@@ -2091,7 +2091,7 @@ static void intel_hdcp_check_work(struct work_struct *work)
 					       struct intel_hdcp,
 					       check_work);
 	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	if (drm_connector_is_unregistered(&connector->base))
 		return;
@@ -2160,7 +2160,7 @@ static int initialize_hdcp_port_data(struct intel_connector *connector,
 				     struct intel_digital_port *dig_port,
 				     const struct intel_hdcp_shim *shim)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
 	enum port port = dig_port->base.port;
 
@@ -2241,7 +2241,7 @@ static void intel_hdcp2_init(struct intel_connector *connector,
 			     struct intel_digital_port *dig_port,
 			     const struct intel_hdcp_shim *shim)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
@@ -2258,7 +2258,7 @@ int intel_hdcp_init(struct intel_connector *connector,
 		    struct intel_digital_port *dig_port,
 		    const struct intel_hdcp_shim *shim)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
@@ -2450,7 +2450,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 				to_intel_connector(conn_state->connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	bool content_protection_type_changed, desired_and_not_enabled = false;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	if (!connector->hdcp.shim)
 		return;
@@ -2530,8 +2530,8 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
 	 * If the connector is registered, it's possible userspace could kick
 	 * off another HDCP enable, which would re-spawn the workers.
 	 */
-	drm_WARN_ON(connector->base.dev,
-		connector->base.registration_state == DRM_CONNECTOR_REGISTERED);
+	drm_WARN_ON(connector->base.drm,
+		    connector->base.registration_state == DRM_CONNECTOR_REGISTERED);
 
 	/*
 	 * Now that the connector is not registered, check_work won't be run,
@@ -2548,7 +2548,7 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
 	 * function should be called), we're "guaranteed" that prop_work is not
 	 * active (tl;dr This Should Never Happen).
 	 */
-	drm_WARN_ON(connector->base.dev, work_pending(&hdcp->prop_work));
+	drm_WARN_ON(connector->base.drm, work_pending(&hdcp->prop_work));
 
 	mutex_lock(&hdcp->mutex);
 	hdcp->shim = NULL;
@@ -2606,7 +2606,7 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
 void intel_hdcp_handle_cp_irq(struct intel_connector *connector)
 {
 	struct intel_hdcp *hdcp = &connector->hdcp;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	if (!hdcp->shim)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 4b41a58fcb03..f2d0f223ffc3 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1458,7 +1458,7 @@ int intel_hdmi_hdcp_read_v_prime_part(struct intel_digital_port *dig_port,
 static int kbl_repositioning_enc_en_signal(struct intel_connector *connector,
 					   enum transcoder cpu_transcoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct intel_crtc *crtc = to_intel_crtc(connector->base.state->crtc);
 	u32 scanline;
@@ -1497,7 +1497,7 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 {
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
 	struct intel_connector *connector = hdmi->attached_connector;
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	int ret;
 
 	if (!enable)
@@ -1943,7 +1943,7 @@ intel_hdmi_mode_clock_valid(struct drm_connector *connector, int clock,
 			    bool has_hdmi_sink,
 			    enum intel_output_format sink_format)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
 	enum drm_mode_status status = MODE_OK;
 	int bpc;
@@ -1981,7 +1981,7 @@ intel_hdmi_mode_valid(struct drm_connector *connector,
 	struct drm_i915_private *dev_priv = intel_hdmi_to_i915(hdmi);
 	enum drm_mode_status status;
 	int clock = mode->clock;
-	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
+	int max_dotclk = to_i915(connector->drm)->max_dotclk_freq;
 	bool has_hdmi_sink = intel_has_hdmi_sink(hdmi, connector->state);
 	bool ycbcr_420_only;
 	enum intel_output_format sink_format;
@@ -2212,7 +2212,7 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	const struct drm_display_info *info = &connector->base.display_info;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	bool ycbcr_420_only = drm_mode_is_420_only(info, adjusted_mode);
 	int ret;
 
@@ -2397,7 +2397,7 @@ intel_hdmi_unset_edid(struct drm_connector *connector)
 static void
 intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
 	struct intel_encoder *encoder = &hdmi_to_dig_port(hdmi)->base;
 	struct i2c_adapter *adapter =
@@ -2448,7 +2448,7 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
 static bool
 intel_hdmi_set_edid(struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
 	intel_wakeref_t wakeref;
 	const struct drm_edid *drm_edid;
@@ -2494,7 +2494,7 @@ static enum drm_connector_status
 intel_hdmi_detect(struct drm_connector *connector, bool force)
 {
 	enum drm_connector_status status = connector_status_disconnected;
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
 	struct intel_encoder *encoder = &hdmi_to_dig_port(intel_hdmi)->base;
 	intel_wakeref_t wakeref;
@@ -2534,7 +2534,7 @@ intel_hdmi_detect(struct drm_connector *connector, bool force)
 static void
 intel_hdmi_force(struct drm_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s]\n",
 		    connector->base.id, connector->name);
@@ -2556,7 +2556,7 @@ static int intel_hdmi_get_modes(struct drm_connector *connector)
 static struct i2c_adapter *
 intel_hdmi_get_i2c_adapter(struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
 
 	return intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
@@ -2564,7 +2564,7 @@ intel_hdmi_get_i2c_adapter(struct drm_connector *connector)
 
 static void intel_hdmi_create_i2c_symlink(struct drm_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct i2c_adapter *adapter = intel_hdmi_get_i2c_adapter(connector);
 	struct kobject *i2c_kobj = &adapter->dev.kobj;
 	struct kobject *connector_kobj = &connector->kdev->kobj;
@@ -2641,7 +2641,7 @@ static const struct drm_connector_helper_funcs intel_hdmi_connector_helper_funcs
 static void
 intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 
 	intel_attach_force_audio_property(connector);
 	intel_attach_broadcast_rgb_property(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 1160fa20433b..bec50f2d6650 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -263,7 +263,7 @@ enum intel_hotplug_state
 intel_encoder_hotplug(struct intel_encoder *encoder,
 		      struct intel_connector *connector)
 {
-	struct drm_device *dev = connector->base.dev;
+	struct drm_device *dev = connector->base.drm;
 	enum drm_connector_status old_status;
 	u64 old_epoch_counter;
 	bool ret = false;
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 3ace56979b70..c7b96ea7666c 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -391,7 +391,7 @@ intel_lvds_mode_valid(struct drm_connector *_connector,
 	struct intel_connector *connector = to_intel_connector(_connector);
 	const struct drm_display_mode *fixed_mode =
 		intel_panel_fixed_mode(connector, mode);
-	int max_pixclk = to_i915(connector->base.dev)->max_dotclk_freq;
+	int max_pixclk = to_i915(connector->base.drm)->max_dotclk_freq;
 	enum drm_mode_status status;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index 138144a65a45..418b8526a081 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -27,7 +27,7 @@ static void intel_connector_verify_state(struct intel_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 
 	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s]\n",
 		    connector->base.base.id, connector->base.name);
@@ -81,7 +81,8 @@ verify_connector_state(struct intel_atomic_state *state,
 
 		intel_connector_verify_state(crtc_state, new_conn_state);
 
-		I915_STATE_WARN(to_i915(connector->dev), new_conn_state->best_encoder != encoder,
+		I915_STATE_WARN(to_i915(connector->drm),
+				new_conn_state->best_encoder != encoder,
 				"connector's atomic encoder doesn't match legacy encoder\n");
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 84078fb82b2f..246002019175 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -1105,7 +1105,7 @@ intel_opregion_get_panel_type(struct drm_i915_private *dev_priv)
 const struct drm_edid *intel_opregion_get_edid(struct intel_connector *intel_connector)
 {
 	struct drm_connector *connector = &intel_connector->base;
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct intel_opregion *opregion = &i915->display.opregion;
 	const struct drm_edid *drm_edid;
 	const void *edid;
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 9232a305b1e6..172c78777130 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -175,7 +175,7 @@ int intel_panel_get_modes(struct intel_connector *connector)
 	list_for_each_entry(fixed_mode, &connector->panel.fixed_modes, head) {
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_duplicate(connector->base.dev, fixed_mode);
+		mode = drm_mode_duplicate(connector->base.drm, fixed_mode);
 		if (mode) {
 			drm_mode_probed_add(&connector->base, mode);
 			num_modes++;
@@ -235,7 +235,7 @@ int intel_panel_compute_config(struct intel_connector *connector,
 		 * off refresh rates.
 		 */
 		if (abs(vrefresh - fixed_mode_vrefresh) > 1) {
-			drm_dbg_kms(connector->base.dev,
+			drm_dbg_kms(connector->base.drm,
 				    "[CONNECTOR:%d:%s] Requested mode vrefresh (%d Hz) does not match fixed mode vrefresh (%d Hz)\n",
 				    connector->base.base.id, connector->base.name,
 				    vrefresh, fixed_mode_vrefresh);
@@ -258,7 +258,7 @@ int intel_panel_compute_config(struct intel_connector *connector,
 
 static void intel_panel_add_edid_alt_fixed_modes(struct intel_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	const struct drm_display_mode *preferred_mode =
 		intel_panel_preferred_fixed_mode(connector);
 	struct drm_display_mode *mode, *next;
@@ -278,7 +278,7 @@ static void intel_panel_add_edid_alt_fixed_modes(struct intel_connector *connect
 
 static void intel_panel_add_edid_preferred_mode(struct intel_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.drm);
 	struct drm_display_mode *scan, *fixed_mode = NULL;
 
 	if (list_empty(&connector->base.probed_modes))
@@ -309,7 +309,7 @@ static void intel_panel_add_edid_preferred_mode(struct intel_connector *connecto
 
 static void intel_panel_destroy_probed_modes(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct drm_display_mode *mode, *next;
 
 	list_for_each_entry_safe(mode, next, &connector->base.probed_modes, head) {
@@ -335,7 +335,7 @@ static void intel_panel_add_fixed_mode(struct intel_connector *connector,
 				       struct drm_display_mode *fixed_mode,
 				       const char *type)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct drm_display_info *info = &connector->base.display_info;
 
 	if (!fixed_mode)
@@ -355,7 +355,7 @@ static void intel_panel_add_fixed_mode(struct intel_connector *connector,
 
 void intel_panel_add_vbt_lfp_fixed_mode(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	const struct drm_display_mode *mode;
 
 	mode = connector->panel.vbt.lfp_lvds_vbt_mode;
@@ -369,7 +369,7 @@ void intel_panel_add_vbt_lfp_fixed_mode(struct intel_connector *connector)
 
 void intel_panel_add_vbt_sdvo_fixed_mode(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	const struct drm_display_mode *mode;
 
 	mode = connector->panel.vbt.sdvo_lvds_vbt_mode;
@@ -687,7 +687,7 @@ int intel_panel_fitting(struct intel_crtc_state *crtc_state,
 enum drm_connector_status
 intel_panel_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 
 	if (!INTEL_DISPLAY_ENABLED(i915))
 		return connector_status_disconnected;
@@ -738,7 +738,7 @@ int intel_panel_init(struct intel_connector *connector,
 	if (!has_drrs_modes(connector))
 		connector->panel.vbt.drrs_type = DRRS_TYPE_NONE;
 
-	drm_dbg_kms(connector->base.dev,
+	drm_dbg_kms(connector->base.drm,
 		    "[CONNECTOR:%d:%s] DRRS type: %s\n",
 		    connector->base.base.id, connector->base.name,
 		    intel_drrs_type_str(intel_panel_drrs_type(connector)));
@@ -760,6 +760,6 @@ void intel_panel_fini(struct intel_connector *connector)
 
 	list_for_each_entry_safe(fixed_mode, next, &panel->fixed_modes, head) {
 		list_del(&fixed_mode->head);
-		drm_mode_destroy(connector->base.dev, fixed_mode);
+		drm_mode_destroy(connector->base.drm, fixed_mode);
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 73f0f1714b37..efe52b20dea0 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -1087,7 +1087,7 @@ void intel_pps_backlight_off(struct intel_dp *intel_dp)
  */
 void intel_pps_backlight_power(struct intel_connector *connector, bool enable)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	intel_wakeref_t wakeref;
 	bool is_enabled;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 27bb8914a7ad..00b4d87e4d81 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3066,7 +3066,7 @@ DEFINE_SHOW_ATTRIBUTE(i915_psr_status);
 
 void intel_psr_connector_debugfs_add(struct intel_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct dentry *root = connector->base.debugfs_entry;
 
 	if (connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 21f92123c844..92376afc503b 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1909,7 +1909,7 @@ intel_sdvo_mode_valid(struct drm_connector *connector,
 	struct intel_sdvo *intel_sdvo = intel_attached_sdvo(to_intel_connector(connector));
 	struct intel_sdvo_connector *intel_sdvo_connector =
 		to_intel_sdvo_connector(connector);
-	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
+	int max_dotclk = to_i915(connector->drm)->max_dotclk_freq;
 	bool has_hdmi_sink = intel_has_hdmi_sink(intel_sdvo_connector, connector->state);
 	int clock = mode->clock;
 
@@ -2047,7 +2047,7 @@ intel_sdvo_get_edid(struct drm_connector *connector)
 static const struct drm_edid *
 intel_sdvo_get_analog_edid(struct drm_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct i2c_adapter *i2c;
 
 	i2c = intel_gmbus_get_adapter(i915, i915->display.vbt.crt_ddc_pin);
@@ -2123,7 +2123,7 @@ intel_sdvo_connector_matches_edid(struct intel_sdvo_connector *sdvo,
 static enum drm_connector_status
 intel_sdvo_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct intel_sdvo *intel_sdvo = intel_attached_sdvo(to_intel_connector(connector));
 	struct intel_sdvo_connector *intel_sdvo_connector = to_intel_sdvo_connector(connector);
 	enum drm_connector_status ret;
@@ -2307,7 +2307,7 @@ static int intel_sdvo_get_tv_modes(struct drm_connector *connector)
 	for (i = 0; i < ARRAY_SIZE(sdvo_tv_modes); i++) {
 		if (reply & (1 << i)) {
 			struct drm_display_mode *nmode;
-			nmode = drm_mode_duplicate(connector->dev,
+			nmode = drm_mode_duplicate(connector->drm,
 						   &sdvo_tv_modes[i]);
 			if (nmode) {
 				drm_mode_probed_add(connector, nmode);
@@ -2321,7 +2321,7 @@ static int intel_sdvo_get_tv_modes(struct drm_connector *connector)
 
 static int intel_sdvo_get_lvds_modes(struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 
 	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
 		    connector->base.id, connector->name);
@@ -2360,7 +2360,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
 				return 0;
 			}
 
-		drm_WARN_ON(connector->dev, 1);
+		drm_WARN_ON(connector->drm, 1);
 		*val = 0;
 	} else if (property == intel_sdvo_connector->top ||
 		   property == intel_sdvo_connector->bottom)
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 36b479b46b60..5f2c9ba488d9 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -959,7 +959,7 @@ intel_tv_mode_valid(struct drm_connector *connector,
 		    struct drm_display_mode *mode)
 {
 	const struct tv_mode *tv_mode = intel_tv_mode_find(connector->state);
-	int max_dotclk = to_i915(connector->dev)->max_dotclk_freq;
+	int max_dotclk = to_i915(connector->drm)->max_dotclk_freq;
 
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
 		return MODE_NO_DBLESCAN;
@@ -1586,7 +1586,7 @@ intel_tv_detect_type(struct intel_tv *intel_tv,
 		      struct drm_connector *connector)
 {
 	struct intel_crtc *crtc = to_intel_crtc(connector->state->crtc);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 tv_ctl, save_tv_ctl;
 	u32 tv_dac, save_tv_dac;
@@ -1712,7 +1712,7 @@ intel_tv_detect(struct drm_connector *connector,
 		struct drm_modeset_acquire_ctx *ctx,
 		bool force)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct intel_tv *intel_tv = intel_attached_tv(to_intel_connector(connector));
 	enum drm_connector_status status;
 	int type;
@@ -1789,7 +1789,7 @@ intel_tv_set_mode_type(struct drm_display_mode *mode,
 static int
 intel_tv_get_modes(struct drm_connector *connector)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->drm);
 	const struct tv_mode *tv_mode = intel_tv_mode_find(connector->state);
 	int i, count = 0;
 
@@ -1807,7 +1807,7 @@ intel_tv_get_modes(struct drm_connector *connector)
 		    input->h > intel_tv_mode_vdisplay(tv_mode))
 			continue;
 
-		mode = drm_mode_create(connector->dev);
+		mode = drm_mode_create(connector->drm);
 		if (!mode)
 			continue;
 
@@ -1885,7 +1885,7 @@ static const struct drm_encoder_funcs intel_tv_enc_funcs = {
 
 static void intel_tv_add_properties(struct drm_connector *connector)
 {
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct drm_i915_private *i915 = to_i915(connector->drm);
 	struct drm_connector_state *conn_state = connector->state;
 	const char *tv_format_names[ARRAY_SIZE(tv_modes)];
 	int i;
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 88e4759b538b..6361667d0eb1 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -13,7 +13,7 @@
 bool intel_vrr_is_capable(struct intel_connector *connector)
 {
 	const struct drm_display_info *info = &connector->base.display_info;
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.drm);
 	struct intel_dp *intel_dp;
 
 	/*
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index c45fc8f4744d..78bf347837f8 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -152,7 +152,7 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_duplicate(connector->dev, &imx_ldb_ch->mode);
+		mode = drm_mode_duplicate(connector->drm, &imx_ldb_ch->mode);
 		if (!mode)
 			return -EINVAL;
 		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 0fa0b590830b..c5602b8debcf 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -68,7 +68,7 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	}
 
 	if (np) {
-		struct drm_display_mode *mode = drm_mode_create(connector->dev);
+		struct drm_display_mode *mode = drm_mode_create(connector->drm);
 		int ret;
 
 		if (!mode)
@@ -78,7 +78,7 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 					      &imxpd->bus_flags,
 					      OF_USE_NATIVE_MODE);
 		if (ret) {
-			drm_mode_destroy(connector->dev, mode);
+			drm_mode_destroy(connector->drm, mode);
 			return ret;
 		}
 
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index ce3dabec887e..5ef9fe52bffc 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -141,7 +141,7 @@ static const struct drm_info_list ls7a2000_hdmi1_debugfs_files[] = {
 static void ls7a2000_hdmi0_late_register(struct drm_connector *connector,
 					 struct dentry *root)
 {
-	struct drm_device *ddev = connector->dev;
+	struct drm_device *ddev = connector->drm;
 	struct drm_minor *minor = ddev->primary;
 
 	drm_debugfs_create_files(ls7a2000_hdmi0_debugfs_files,
@@ -152,7 +152,7 @@ static void ls7a2000_hdmi0_late_register(struct drm_connector *connector,
 static void ls7a2000_hdmi1_late_register(struct drm_connector *connector,
 					 struct dentry *root)
 {
-	struct drm_device *ddev = connector->dev;
+	struct drm_device *ddev = connector->drm;
 	struct drm_minor *minor = ddev->primary;
 
 	drm_debugfs_create_files(ls7a2000_hdmi1_debugfs_files,
@@ -165,7 +165,7 @@ static void ls7a2000_hdmi1_late_register(struct drm_connector *connector,
 static enum drm_connector_status
 ls7a2000_hdmi0_vga_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *ddev = connector->dev;
+	struct drm_device *ddev = connector->drm;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	u32 val;
 
@@ -187,7 +187,7 @@ ls7a2000_hdmi0_vga_connector_detect(struct drm_connector *connector, bool force)
 static enum drm_connector_status
 ls7a2000_hdmi1_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct lsdc_device *ldev = to_lsdc(connector->dev);
+	struct lsdc_device *ldev = to_lsdc(connector->drm);
 	u32 val;
 
 	val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 26301ccca2ff..b166e6fc1399 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -716,7 +716,7 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 
 int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct mga_device *mdev = to_mga_device(connector->dev);
+	struct mga_device *mdev = to_mga_device(connector->drm);
 	int ret;
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 2a5a68366582..ddbc11d83027 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -9,7 +9,7 @@
 
 static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 76f13954015b..84ab75196162 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -364,7 +364,7 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
 	connector = dp->dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
+	drm_helper_hpd_irq_event(connector->drm);
 }
 
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 785d76639497..c24e3c45ef17 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -85,7 +85,7 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 			return rc;
 		}
 	} else {
-		drm_dbg_dp(connector->dev, "No sink connected\n");
+		drm_dbg_dp(connector->drm, "No sink connected\n");
 	}
 	return rc;
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
index d6b8e0cce2ac..417de5d0b540 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
@@ -529,7 +529,7 @@ nv04_dac_create(struct drm_connector *connector, struct dcb_output *entry)
 {
 	const struct drm_encoder_helper_funcs *helper;
 	struct nouveau_encoder *nv_encoder = NULL;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_encoder *encoder;
 
 	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index d5b129dc623b..4469e00f43ad 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -708,7 +708,7 @@ nv04_dfp_create(struct drm_connector *connector, struct dcb_output *entry)
 	nv_encoder->dcb = entry;
 	nv_encoder->or = ffs(entry->or) - 1;
 
-	drm_encoder_init(connector->dev, encoder, &nv04_dfp_funcs, type, NULL);
+	drm_encoder_init(connector->drm, encoder, &nv04_dfp_funcs, type, NULL);
 	drm_encoder_helper_add(encoder, helper);
 
 	encoder->possible_crtcs = entry->heads;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
index de3ea731d6e6..ed989f19aba6 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
@@ -203,7 +203,7 @@ nv04_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 {
 	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
 	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, entry->i2c_index);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 670c9739e5e1..315b30a3befc 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -787,7 +787,7 @@ static const struct drm_encoder_funcs nv17_tv_funcs = {
 int
 nv17_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_encoder *encoder;
 	struct nv17_tv_encoder *tv_enc = NULL;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 02f51144d228..521bf7eeb558 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -555,8 +555,8 @@ nv50_dac_func = {
 static int
 nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
 {
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nv50_disp *disp = nv50_disp(connector->dev);
+	struct nouveau_drm *drm = nouveau_drm(connector->drm);
+	struct nv50_disp *disp = nv50_disp(connector->drm);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
 	struct nvkm_i2c_bus *bus;
 	struct nouveau_encoder *nv_encoder;
@@ -575,7 +575,7 @@ nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	encoder = to_drm_encoder(nv_encoder);
 	encoder->possible_crtcs = dcbe->heads;
 	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_dac_func, type,
+	drm_encoder_init(connector->drm, encoder, &nv50_dac_func, type,
 			 "dac-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_dac_help);
 
@@ -1151,7 +1151,7 @@ nv50_mstc_get_modes(struct drm_connector *connector)
 		connector->display_info.bpc = 8;
 
 	if (mstc->native)
-		drm_mode_destroy(mstc->connector.dev, mstc->native);
+		drm_mode_destroy(mstc->connector.drm, mstc->native);
 	mstc->native = nouveau_conn_native_mode(&mstc->connector);
 	return ret;
 }
@@ -1176,9 +1176,9 @@ nv50_mstc_detect(struct drm_connector *connector,
 	if (drm_connector_is_unregistered(connector))
 		return connector_status_disconnected;
 
-	ret = pm_runtime_get_sync(connector->dev->dev);
+	ret = pm_runtime_get_sync(connector->drm->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 		return connector_status_disconnected;
 	}
 
@@ -1188,8 +1188,8 @@ nv50_mstc_detect(struct drm_connector *connector,
 		goto out;
 
 out:
-	pm_runtime_mark_last_busy(connector->dev->dev);
-	pm_runtime_put_autosuspend(connector->dev->dev);
+	pm_runtime_mark_last_busy(connector->drm->dev);
+	pm_runtime_put_autosuspend(connector->drm->dev);
 	return ret;
 }
 
@@ -1717,11 +1717,11 @@ static int
 nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 {
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct nouveau_drm *drm = nouveau_drm(connector->drm);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
 	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
-	struct nv50_disp *disp = nv50_disp(connector->dev);
+	struct nv50_disp *disp = nv50_disp(connector->drm);
 	int type, ret;
 
 	switch (dcbe->type) {
@@ -1742,7 +1742,7 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	encoder = to_drm_encoder(nv_encoder);
 	encoder->possible_crtcs = dcbe->heads;
 	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_sor_func, type,
+	drm_encoder_init(connector->drm, encoder, &nv50_sor_func, type,
 			 "sor-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_sor_help);
 
@@ -1884,7 +1884,7 @@ nv50_pior_func = {
 static int
 nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv50_disp *disp = nv50_disp(dev);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
@@ -1920,7 +1920,7 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	encoder = to_drm_encoder(nv_encoder);
 	encoder->possible_crtcs = dcbe->heads;
 	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_pior_func, type,
+	drm_encoder_init(connector->drm, encoder, &nv50_pior_func, type,
 			 "pior-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_pior_help);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 91b5ecc57538..13b40f0383f0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -153,7 +153,7 @@ static int
 nv50_edp_get_brightness(struct backlight_device *bd)
 {
 	struct drm_connector *connector = dev_get_drvdata(bd->dev.parent);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc;
 	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
@@ -195,7 +195,7 @@ nv50_edp_set_brightness(struct backlight_device *bd)
 {
 	struct drm_connector *connector = dev_get_drvdata(bd->dev.parent);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_crtc *crtc;
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	struct nouveau_backlight *nv_bl = nv_connector->backlight;
@@ -361,7 +361,7 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 int
 nouveau_backlight_init(struct drm_connector *connector)
 {
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct nouveau_drm *drm = nouveau_drm(connector->drm);
 	struct nouveau_backlight *bl;
 	struct nouveau_encoder *nv_encoder = NULL;
 	struct nvif_device *device = &drm->client.device;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 68b4fb4bec63..d4070be752f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -53,8 +53,8 @@ struct drm_display_mode *
 nouveau_conn_native_mode(struct drm_connector *connector)
 {
 	const struct drm_connector_helper_funcs *helper = connector->helper_private;
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct drm_device *dev = connector->dev;
+	struct nouveau_drm *drm = nouveau_drm(connector->drm);
+	struct drm_device *dev = connector->drm;
 	struct drm_display_mode *mode, *largest = NULL;
 	int high_w = 0, high_h = 0, high_v = 0;
 
@@ -99,8 +99,8 @@ nouveau_conn_atomic_get_property(struct drm_connector *connector,
 				 struct drm_property *property, u64 *val)
 {
 	struct nouveau_conn_atom *asyc = nouveau_conn_atom(state);
-	struct nouveau_display *disp = nouveau_display(connector->dev);
-	struct drm_device *dev = connector->dev;
+	struct nouveau_display *disp = nouveau_display(connector->drm);
+	struct drm_device *dev = connector->drm;
 
 	if (property == dev->mode_config.scaling_mode_property)
 		*val = asyc->scaler.mode;
@@ -129,7 +129,7 @@ nouveau_conn_atomic_set_property(struct drm_connector *connector,
 				 struct drm_connector_state *state,
 				 struct drm_property *property, u64 val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct nouveau_conn_atom *asyc = nouveau_conn_atom(state);
 	struct nouveau_display *disp = nouveau_display(dev);
 
@@ -248,7 +248,7 @@ nouveau_conn_reset(struct drm_connector *connector)
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_conn_atom *asyc;
 
-	if (drm_drv_uses_atomic_modeset(connector->dev)) {
+	if (drm_drv_uses_atomic_modeset(connector->drm)) {
 		if (WARN_ON(!(asyc = kzalloc(sizeof(*asyc), GFP_KERNEL))))
 			return;
 
@@ -268,7 +268,7 @@ nouveau_conn_reset(struct drm_connector *connector)
 	asyc->procamp.color_vibrance = 150;
 	asyc->procamp.vibrant_hue = 90;
 
-	if (nouveau_display(connector->dev)->disp.object.oclass < NV50_DISP) {
+	if (nouveau_display(connector->drm)->disp.object.oclass < NV50_DISP) {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_LVDS:
 			/* See note in nouveau_conn_atomic_set_property(). */
@@ -283,12 +283,12 @@ nouveau_conn_reset(struct drm_connector *connector)
 void
 nouveau_conn_attach_properties(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_conn_atom *armc;
 
-	if (drm_drv_uses_atomic_modeset(connector->dev))
+	if (drm_drv_uses_atomic_modeset(connector->drm))
 		armc = nouveau_conn_atom(connector->state);
 	else
 		armc = &nv_connector->properties_state;
@@ -411,7 +411,7 @@ nouveau_connector_destroy(struct drm_connector *connector)
 static struct nouveau_encoder *
 nouveau_connector_ddc_detect(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct nouveau_encoder *nv_encoder = NULL, *found = NULL;
 	struct drm_encoder *encoder;
@@ -459,7 +459,7 @@ static struct nouveau_encoder *
 nouveau_connector_of_detect(struct drm_connector *connector)
 {
 #ifdef __powerpc__
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
@@ -491,8 +491,8 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 			      struct nouveau_encoder *nv_encoder)
 {
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct drm_device *dev = connector->dev;
+	struct nouveau_drm *drm = nouveau_drm(connector->drm);
+	struct drm_device *dev = connector->drm;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	if (nv_connector->detected_encoder == nv_encoder)
@@ -549,7 +549,7 @@ nouveau_connector_set_edid(struct nouveau_connector *nv_connector,
 static enum drm_connector_status
 nouveau_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
@@ -665,7 +665,7 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 static enum drm_connector_status
 nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
@@ -741,7 +741,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 static void
 nouveau_connector_force(struct drm_connector *connector)
 {
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct nouveau_drm *drm = nouveau_drm(connector->drm);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder;
 	int type;
@@ -829,7 +829,7 @@ nouveau_connector_scaler_modes_add(struct drm_connector *connector)
 {
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct drm_display_mode *native = nv_connector->native_mode, *m;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct moderec *mode = &scaler_modes[0];
 	int modes = 0;
 
@@ -860,7 +860,7 @@ nouveau_connector_scaler_modes_add(struct drm_connector *connector)
 static void
 nouveau_connector_detect_depth(struct drm_connector *connector)
 {
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct nouveau_drm *drm = nouveau_drm(connector->drm);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
 	struct nvbios *bios = &drm->vbios;
@@ -941,7 +941,7 @@ nouveau_connector_early_unregister(struct drm_connector *connector)
 static int
 nouveau_connector_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
@@ -1010,7 +1010,7 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
 {
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct nouveau_drm *drm = nouveau_drm(connector->drm);
 	struct dcb_output *dcb = nv_connector->detected_encoder->dcb;
 	struct drm_display_info *info = NULL;
 	unsigned duallink_scale =
@@ -1117,7 +1117,7 @@ nouveau_connector_atomic_check(struct drm_connector *connector, struct drm_atomi
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
-	if (!nv_conn->dp_encoder || !nv50_has_mst(nouveau_drm(connector->dev)))
+	if (!nv_conn->dp_encoder || !nv50_has_mst(nouveau_drm(connector->drm)))
 		return 0;
 
 	return drm_dp_mst_root_conn_atomic_check(conn_state, &nv_conn->dp_encoder->dp.mstm->mgr);
@@ -1168,7 +1168,7 @@ nouveau_connector_funcs_lvds = {
 void
 nouveau_connector_hpd(struct nouveau_connector *nv_connector, u64 bits)
 {
-	struct nouveau_drm *drm = nouveau_drm(nv_connector->base.dev);
+	struct nouveau_drm *drm = nouveau_drm(nv_connector->base.drm);
 	u32 mask = drm_connector_mask(&nv_connector->base);
 	unsigned long flags;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index f163d52a7c7d..7c93684b1124 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -639,7 +639,7 @@ static int venc_bridge_get_modes(struct drm_bridge *bridge,
 	for (i = 0; i < ARRAY_SIZE(modes); ++i) {
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_duplicate(connector->dev, modes[i]);
+		mode = drm_mode_duplicate(connector->drm, modes[i]);
 		if (!mode)
 			return i;
 
diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
index 1cc0f1d09684..b1451cad648b 100644
--- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
+++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
@@ -232,7 +232,7 @@ static int y030xx067a_get_modes(struct drm_panel *panel,
 	unsigned int i;
 
 	for (i = 0; i < panel_info->num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel_info->display_modes[i]);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
index abb0788843c6..5bad5f77356f 100644
--- a/drivers/gpu/drm/panel/panel-arm-versatile.c
+++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
@@ -266,7 +266,7 @@ static int versatile_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.height_mm = vpanel->panel_type->height_mm;
 	connector->display_info.bus_flags = vpanel->panel_type->bus_flags;
 
-	mode = drm_mode_duplicate(connector->dev, &vpanel->panel_type->mode);
+	mode = drm_mode_duplicate(connector->drm, &vpanel->panel_type->mode);
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index 075a7af81eff..bbe3be54250f 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -176,7 +176,7 @@ static int tm5p5_nt35596_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &tm5p5_nt35596_mode);
+	mode = drm_mode_duplicate(connector->drm, &tm5p5_nt35596_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
index 3c976a98de6a..ba269dd26381 100644
--- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
+++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
@@ -143,7 +143,7 @@ static int a030jtn01_get_modes(struct drm_panel *panel,
 	unsigned int i;
 
 	for (i = 0; i < panel_info->num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel_info->display_modes[i]);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 90098b753e3b..0093c6a0f955 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -219,7 +219,7 @@ static int boe_bf060y8m_aj0_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &boe_bf060y8m_aj0_mode);
+	mode = drm_mode_duplicate(connector->drm, &boe_bf060y8m_aj0_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index d879b3b14c48..f087f398dba4 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -218,7 +218,7 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *m = pinfo->desc->display_mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, m);
+	mode = drm_mode_duplicate(connector->drm, m);
 	if (!mode) {
 		dev_err(pinfo->base.dev, "failed to add mode %ux%u@%u\n",
 			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 3cc9fb0d4f5d..642b7e62c0bb 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -2171,7 +2171,7 @@ static int boe_panel_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *m = boe->desc->modes;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, m);
+	mode = drm_mode_duplicate(connector->drm, m);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index ba17bcc4461c..fc349928ffa0 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -433,7 +433,7 @@ static int dsicm_get_modes(struct drm_panel *panel,
 	struct panel_drv_data *ddata = panel_to_ddata(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &ddata->mode);
+	mode = drm_mode_duplicate(connector->drm, &ddata->mode);
 	if (!mode) {
 		dev_err(&ddata->dsi->dev, "failed to add mode %ux%ux@%u kHz\n",
 			ddata->mode.hdisplay, ddata->mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
index e85d63a176d0..52a248c0907f 100644
--- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -172,7 +172,7 @@ static int ebbg_ft8719_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &ebbg_ft8719_mode);
+	mode = drm_mode_duplicate(connector->drm, &ebbg_ft8719_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index df7e3cff004c..3546c30cde9e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -249,7 +249,7 @@ static unsigned int panel_edp_get_timings_modes(struct panel_edp *panel,
 		struct videomode vm;
 
 		videomode_from_timing(dt, &vm);
-		mode = drm_mode_create(connector->dev);
+		mode = drm_mode_create(connector->drm);
 		if (!mode) {
 			dev_err(panel->base.dev, "failed to add mode %ux%u\n",
 				dt->hactive.typ, dt->vactive.typ);
@@ -279,7 +279,7 @@ static unsigned int panel_edp_get_display_modes(struct panel_edp *panel,
 	for (i = 0; i < panel->desc->num_modes; i++) {
 		const struct drm_display_mode *m = &panel->desc->modes[i];
 
-		mode = drm_mode_duplicate(connector->dev, m);
+		mode = drm_mode_duplicate(connector->drm, m);
 		if (!mode) {
 			dev_err(panel->base.dev, "failed to add mode %ux%u@%u\n",
 				m->hdisplay, m->vdisplay,
@@ -312,7 +312,7 @@ static int panel_edp_get_non_edid_modes(struct panel_edp *panel,
 		return 0;
 
 	if (has_override) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel->override_mode);
 		if (mode) {
 			drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index e7be15b68102..02cba816edae 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -195,7 +195,7 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	struct kd35t133 *ctx = panel_to_kd35t133(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
index 76572c922983..8042dd29536a 100644
--- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
+++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
@@ -411,7 +411,7 @@ static int k101_im2ba02_get_modes(struct drm_panel *panel,
 	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &k101_im2ba02_default_mode);
+	mode = drm_mode_duplicate(connector->drm, &k101_im2ba02_default_mode);
 	if (!mode) {
 		dev_err(&ctx->dsi->dev, "failed to add mode %ux%u@%u\n",
 			k101_im2ba02_default_mode.hdisplay,
diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index df493da50afe..d6cb463f08b0 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -160,7 +160,7 @@ static int feiyang_get_modes(struct drm_panel *panel,
 	struct feiyang *ctx = panel_to_feiyang(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &feiyang_default_mode);
+	mode = drm_mode_duplicate(connector->drm, &feiyang_default_mode);
 	if (!mode) {
 		dev_err(&ctx->dsi->dev, "failed to add mode %ux%u@%u\n",
 			feiyang_default_mode.hdisplay,
diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index d4fb5d1b295b..46b40baa9851 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -317,7 +317,7 @@ static int hx8394_get_modes(struct drm_panel *panel,
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
+	mode = drm_mode_duplicate(connector->drm, ctx->desc->mode);
 	if (!mode) {
 		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
 			ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 3dfafa585127..825f4cae23ae 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -637,7 +637,7 @@ static int ili9322_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
 	struct ili9322 *ili = panel_to_ili9322(panel);
-	struct drm_device *drm = connector->dev;
+	struct drm_device *drm = connector->drm;
 	struct drm_display_mode *mode;
 	struct drm_display_info *info;
 
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 3fdf884b3257..9156a98a7218 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -436,7 +436,7 @@ static int ili9341_dpi_get_modes(struct drm_panel *panel,
 				 struct drm_connector *connector)
 {
 	struct ili9341 *ili = panel_to_ili9341(panel);
-	struct drm_device *drm = connector->dev;
+	struct drm_device *drm = connector->drm;
 	struct drm_display_mode *mode;
 	struct drm_display_info *info;
 
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 1ec696adf9de..f14cdbab1a39 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -835,7 +835,7 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
+	mode = drm_mode_duplicate(connector->drm, ctx->desc->mode);
 	if (!mode) {
 		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
 			ctx->desc->mode->hdisplay,
diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
index b2b0ebc9e943..958fe6c7b2d4 100644
--- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
+++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
@@ -158,7 +158,7 @@ static int ej030na_get_modes(struct drm_panel *panel,
 	unsigned int i;
 
 	for (i = 0; i < panel_info->num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel_info->display_modes[i]);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 9992d0d4c0e5..99120a6b6a29 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -389,7 +389,7 @@ static int innolux_panel_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *m = innolux->desc->mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, m);
+	mode = drm_mode_duplicate(connector->drm, m);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 323c33c9c37a..c4717512f229 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -142,7 +142,7 @@ static int jadard_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *desc_mode = &jadard->desc->mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, desc_mode);
+	mode = drm_mode_duplicate(connector->drm, desc_mode);
 	if (!mode) {
 		DRM_DEV_ERROR(&jadard->dsi->dev, "failed to add mode %ux%ux@%u\n",
 			      desc_mode->hdisplay, desc_mode->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index 8912757a6f42..37aeaae785a0 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -211,7 +211,7 @@ static int jdi_fhd_r63452_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &jdi_fhd_r63452_mode);
+	mode = drm_mode_duplicate(connector->drm, &jdi_fhd_r63452_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 8f4f137a2af6..44a05119fcc5 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -306,7 +306,7 @@ static int jdi_panel_get_modes(struct drm_panel *panel,
 	struct jdi_panel *jdi = to_jdi_panel(panel);
 	struct device *dev = &jdi->dsi->dev;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(dev, "failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index b942a0162274..05974d3da8bd 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -734,7 +734,7 @@ static int khadas_ts050_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 17f8d80cf2b3..cdcbd143955d 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -318,7 +318,7 @@ static int kingdisplay_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index d2efd887484b..d2f6390bd286 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -522,7 +522,7 @@ static int ltk050h3146w_get_modes(struct drm_panel *panel,
 	struct ltk050h3146w *ctx = panel_to_ltk050h3146w(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, ctx->panel_desc->mode);
+	mode = drm_mode_duplicate(connector->drm, ctx->panel_desc->mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index 39e408c9f762..ef24435f990c 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -379,7 +379,7 @@ static int ltk500hd1829_get_modes(struct drm_panel *panel,
 	struct ltk500hd1829 *ctx = panel_to_ltk500hd1829(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(ctx->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-lg-lb035q02.c b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
index 9d0d4faa3f58..1393ec128d82 100644
--- a/drivers/gpu/drm/panel/panel-lg-lb035q02.c
+++ b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
@@ -145,7 +145,7 @@ static int lb035q02_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &lb035q02_mode);
+	mode = drm_mode_duplicate(connector->drm, &lb035q02_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
index cf246d15b7b6..263211f6c70e 100644
--- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
+++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
@@ -213,7 +213,7 @@ static int lg4573_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index b47c3a679be0..680b913a897d 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -87,7 +87,7 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	struct panel_lvds *lvds = to_panel_lvds(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &lvds->dmode);
+	mode = drm_mode_duplicate(connector->drm, &lvds->dmode);
 	if (!mode)
 		return 0;
 
diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
index 26d358b9b85a..8d50687f5a80 100644
--- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
+++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
@@ -295,7 +295,7 @@ static int d53e6ea8966_get_modes(struct drm_panel *panel,
 	unsigned int i;
 
 	for (i = 0; i < panel_info->num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel_info->display_modes[i]);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 9243b2ad828d..1d40ae7020fe 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -223,7 +223,7 @@ static int mantix_get_modes(struct drm_panel *panel,
 	struct mantix *ctx = panel_to_mantix(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, ctx->default_mode);
+	mode = drm_mode_duplicate(connector->drm, ctx->default_mode);
 	if (!mode) {
 		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
 			ctx->default_mode->hdisplay, ctx->default_mode->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
index 81c5c541a351..1b5ba997331b 100644
--- a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
+++ b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
@@ -127,7 +127,7 @@ static int nl8048_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &nl8048_mode);
+	mode = drm_mode_duplicate(connector->drm, &nl8048_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index a07958038ffd..200b1a96540b 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -323,7 +323,7 @@ static int panel_nv3051d_get_modes(struct drm_panel *panel,
 	unsigned int i;
 
 	for (i = 0; i < panel_info->num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel_info->display_modes[i]);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index cf078f0d3cd3..b37358c7210e 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -339,7 +339,7 @@ static int nv3052c_get_modes(struct drm_panel *panel,
 	unsigned int i;
 
 	for (i = 0; i < panel_info->num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel_info->display_modes[i]);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 493c3c23f0d6..ee043fdbd316 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -848,7 +848,7 @@ static int nt35510_get_modes(struct drm_panel *panel,
 	info = &connector->display_info;
 	info->width_mm = nt->conf->width_mm;
 	info->height_mm = nt->conf->height_mm;
-	mode = drm_mode_duplicate(connector->dev, &nt->conf->mode);
+	mode = drm_mode_duplicate(connector->drm, &nt->conf->mode);
 	if (!mode) {
 		dev_err(panel->dev, "bad mode or failed to add mode\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index cc7f96d70826..304fd6495adf 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -425,10 +425,10 @@ static int nt35560_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode;
 
 	if (nt->video_mode)
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  conf->vid_mode);
 	else
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  conf->cmd_mode);
 	if (!mode) {
 		dev_err(panel->dev, "bad mode or failed to add mode\n");
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 8b108ac80b55..331dcaf9d805 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -500,7 +500,7 @@ static int nt35950_get_modes(struct drm_panel *panel,
 	for (i = 0; i < nt->desc->num_modes; i++) {
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &nt->desc->mode_data[i].mode);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index c3befa7f253d..682490580bda 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -1135,7 +1135,7 @@ static int nt36523_get_modes(struct drm_panel *panel,
 		const struct drm_display_mode *m = &pinfo->desc->modes[i];
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_duplicate(connector->dev, m);
+		mode = drm_mode_duplicate(connector->drm, m);
 		if (!mode) {
 			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 73bcffa1e0c1..b36fb62dd6bb 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -238,7 +238,7 @@ static int nt36672a_panel_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *m = pinfo->desc->display_mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, m);
+	mode = drm_mode_duplicate(connector->drm, m);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n", m->hdisplay,
 			m->vdisplay, drm_mode_vrefresh(m));
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index f58cfb10b58a..ef6f1deda453 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -208,7 +208,7 @@ static int nt39016_get_modes(struct drm_panel *drm_panel,
 	unsigned int i;
 
 	for (i = 0; i < panel_info->num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel_info->display_modes[i]);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 4819ada69482..9a048dbcca22 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -148,7 +148,7 @@ static int lcd_olinuxino_get_modes(struct drm_panel *panel,
 		lcd_mode = (struct lcd_olinuxino_mode *)
 			   &lcd->eeprom.reserved[i * sizeof(*lcd_mode)];
 
-		mode = drm_mode_create(connector->dev);
+		mode = drm_mode_create(connector->drm);
 		if (!mode) {
 			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 				lcd_mode->hactive,
diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
index e46be5014d42..b9d171e78be7 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
@@ -198,7 +198,7 @@ static int ota5601a_get_modes(struct drm_panel *drm_panel,
 	unsigned int i;
 
 	for (i = 0; i < panel_info->num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel_info->display_modes[i]);
 		if (!mode)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 898b892f1143..c7d35ad531ed 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -359,7 +359,7 @@ static int otm8009a_get_modes(struct drm_panel *panel,
 	unsigned int i;
 
 	for (i = 0; i < num_modes; i++) {
-		mode = drm_mode_duplicate(connector->dev, &modes[i]);
+		mode = drm_mode_duplicate(connector->drm, &modes[i]);
 		if (!mode) {
 			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 				modes[i].hdisplay,
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 493e0504f6f7..ea05b4998c3d 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -111,7 +111,7 @@ static int osd101t2587_panel_get_modes(struct drm_panel *panel,
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, osd101t2587->default_mode);
+	mode = drm_mode_duplicate(connector->drm, osd101t2587->default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 			osd101t2587->default_mode->hdisplay,
diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 8ba6d8287938..e5985954bd49 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -156,7 +156,7 @@ static int wuxga_nt_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 90ea91e4311d..009e99620eb5 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -325,7 +325,7 @@ static int rpi_touchscreen_get_modes(struct drm_panel *panel,
 		const struct drm_display_mode *m = &rpi_touchscreen_modes[i];
 		struct drm_display_mode *mode;
 
-		mode = drm_mode_duplicate(connector->dev, m);
+		mode = drm_mode_duplicate(connector->drm, m);
 		if (!mode) {
 			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 				m->hdisplay, m->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index dbb1ed4efbed..2005162167be 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -439,7 +439,7 @@ static int rad_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index 5f9b340588fb..9550034a2a47 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -332,7 +332,7 @@ static int rm68200_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index 2ef5ea5eaeeb..4a082d5f54f1 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -109,7 +109,7 @@ static int rb070d30_panel_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(&ctx->dsi->dev, "Failed to add mode " DRM_MODE_FMT "\n",
 			DRM_MODE_ARG(&default_mode));
diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
index 117b26845083..a8f36f175fe4 100644
--- a/drivers/gpu/drm/panel/panel-samsung-db7430.c
+++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
@@ -235,7 +235,7 @@ static int db7430_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	mode = drm_mode_duplicate(connector->dev, &db7430_480_800_mode);
+	mode = drm_mode_duplicate(connector->drm, &db7430_480_800_mode);
 	if (!mode) {
 		dev_err(db->dev, "failed to add mode\n");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index 01eb211f32f7..c1eec8fc5be8 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -266,7 +266,7 @@ static int ld9040_get_modes(struct drm_panel *panel,
 	struct ld9040 *ctx = panel_to_ld9040(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_create(connector->dev);
+	mode = drm_mode_create(connector->drm);
 	if (!mode) {
 		dev_err(panel->dev, "failed to create a new display mode\n");
 		return 0;
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index 008e2b0d6652..3ef5eda5231e 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -136,7 +136,7 @@ static int s6d16d0_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &samsung_s6d16d0_mode);
+	mode = drm_mode_duplicate(connector->drm, &samsung_s6d16d0_mode);
 	if (!mode) {
 		dev_err(panel->dev, "bad mode or failed to add mode\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c b/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
index 2adb223a895c..a8cf94595c7a 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
@@ -211,7 +211,7 @@ static int s6d27a1_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	mode = drm_mode_duplicate(connector->dev, &s6d27a1_480_800_mode);
+	mode = drm_mode_duplicate(connector->drm, &s6d27a1_480_800_mode);
 	if (!mode) {
 		dev_err(ctx->dev, "failed to add mode\n");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index fec0d014fd0e..70ec46d6e2c1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -457,7 +457,7 @@ static int s6d7aa0_get_modes(struct drm_panel *panel,
 	if (!ctx)
 		return -EINVAL;
 
-	mode = drm_mode_duplicate(connector->dev, ctx->desc->drm_mode);
+	mode = drm_mode_duplicate(connector->drm, ctx->desc->drm_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 39eef3dce7c9..c3485190723d 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -648,7 +648,7 @@ static int s6e3ha2_get_modes(struct drm_panel *panel,
 	struct s6e3ha2 *ctx = container_of(panel, struct s6e3ha2, panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
+	mode = drm_mode_duplicate(connector->drm, ctx->desc->mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index 46d6f4a87bf7..49c6baf9d795 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -403,7 +403,7 @@ static int s6e63j0x03_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index b34fa4d5de07..76ab8364f61b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -599,7 +599,7 @@ static int s6e63m0_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode;
 	static const u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index 7431cae7427e..3272a9c48501 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
@@ -178,7 +178,7 @@ static int s6e88a0_ams452ef01_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &s6e88a0_ams452ef01_mode);
+	mode = drm_mode_duplicate(connector->drm, &s6e88a0_ams452ef01_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index c51d07ec1529..63e4dfc8a337 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -925,7 +925,7 @@ static int s6e8aa0_get_modes(struct drm_panel *panel,
 	struct s6e8aa0 *ctx = panel_to_s6e8aa0(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_create(connector->dev);
+	mode = drm_mode_create(connector->drm);
 	if (!mode) {
 		dev_err(panel->dev, "failed to create a new display mode\n");
 		return 0;
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 1ebb79e3103c..df6c7ae45ae1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -188,7 +188,7 @@ static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector
 	struct drm_display_mode *mode;
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
 
-	mode = drm_mode_duplicate(connector->dev, ctx->mode);
+	mode = drm_mode_duplicate(connector->drm, ctx->mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 658c7c040570..d66e482e3604 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -71,7 +71,7 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 		struct videomode vm;
 
 		videomode_from_timing(dt, &vm);
-		mode = drm_mode_create(connector->dev);
+		mode = drm_mode_create(connector->drm);
 		if (!mode) {
 			dev_err(panel->base.dev, "failed to add mode %ux%u\n",
 				dt->hactive.typ, dt->vactive.typ);
@@ -92,7 +92,7 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 	for (i = 0; i < panel->desc->num_modes; i++) {
 		const struct drm_display_mode *m = &panel->desc->modes[i];
 
-		mode = drm_mode_duplicate(connector->dev, m);
+		mode = drm_mode_duplicate(connector->drm, m);
 		if (!mode) {
 			dev_err(panel->base.dev, "failed to add mode %ux%u@%u\n",
 				m->hdisplay, m->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index 14851408a5e1..f047fe41c0c8 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -276,7 +276,7 @@ static int sharp_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
index 76bd9e810827..30d229b05b10 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
@@ -104,7 +104,7 @@ static int ls037v7dw01_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &ls037v7dw01_mode);
+	mode = drm_mode_duplicate(connector->drm, &ls037v7dw01_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 855e64444daa..47dccc8b2fad 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -180,7 +180,7 @@ static int sharp_nt_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
index 68f52eaaf4fa..3a533415654a 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
@@ -204,7 +204,7 @@ static int sharp_ls060_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &sharp_ls060_mode);
+	mode = drm_mode_duplicate(connector->drm, &sharp_ls060_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 241243447b3e..5ebeab192c7f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -174,7 +174,7 @@ static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel,
 		struct videomode vm;
 
 		videomode_from_timing(dt, &vm);
-		mode = drm_mode_create(connector->dev);
+		mode = drm_mode_create(connector->drm);
 		if (!mode) {
 			dev_err(panel->base.dev, "failed to add mode %ux%u\n",
 				dt->hactive.typ, dt->vactive.typ);
@@ -204,7 +204,7 @@ static unsigned int panel_simple_get_display_modes(struct panel_simple *panel,
 	for (i = 0; i < panel->desc->num_modes; i++) {
 		const struct drm_display_mode *m = &panel->desc->modes[i];
 
-		mode = drm_mode_duplicate(connector->dev, m);
+		mode = drm_mode_duplicate(connector->drm, m);
 		if (!mode) {
 			dev_err(panel->base.dev, "failed to add mode %ux%u@%u\n",
 				m->hdisplay, m->vdisplay,
@@ -237,7 +237,7 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 		return 0;
 
 	if (has_override) {
-		mode = drm_mode_duplicate(connector->dev,
+		mode = drm_mode_duplicate(connector->drm,
 					  &panel->override_mode);
 		if (mode) {
 			drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 7eae83aa0ea1..5edad4a0fef5 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -501,7 +501,7 @@ static int st7701_get_modes(struct drm_panel *panel,
 	const struct drm_display_mode *desc_mode = st7701->desc->mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, desc_mode);
+	mode = drm_mode_duplicate(connector->drm, desc_mode);
 	if (!mode) {
 		dev_err(&st7701->dsi->dev, "failed to add mode %ux%u@%u\n",
 			desc_mode->hdisplay, desc_mode->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 3aa31f3d6157..0f72bd0908fe 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -541,7 +541,7 @@ static int st7703_get_modes(struct drm_panel *panel,
 	struct st7703 *ctx = panel_to_st7703(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
+	mode = drm_mode_duplicate(connector->drm, ctx->desc->mode);
 	if (!mode) {
 		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
 			ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index bbc4569cbcdc..d1866abfe511 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -172,7 +172,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 3d6a286056a0..1fe64e594811 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -517,7 +517,7 @@ static int acx565akm_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &acx565akm_mode);
+	mode = drm_mode_duplicate(connector->drm, &acx565akm_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
index 8d8813dbaa45..c083e5598337 100644
--- a/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
+++ b/drivers/gpu/drm/panel/panel-sony-td4353-jdi.c
@@ -217,7 +217,8 @@ static int sony_td4353_jdi_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode = NULL;
 
 	if (ctx->type == TYPE_TAMA_60HZ)
-		mode = drm_mode_duplicate(connector->dev, &sony_td4353_jdi_mode_tama_60hz);
+		mode = drm_mode_duplicate(connector->drm,
+					  &sony_td4353_jdi_mode_tama_60hz);
 	else
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
index ee5d20ecc577..190fc7fe7324 100644
--- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
+++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
@@ -384,7 +384,7 @@ static int truly_nt35521_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &truly_nt35521_mode);
+	mode = drm_mode_duplicate(connector->drm, &truly_nt35521_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index d8487bc6d611..5296b51c8756 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -126,7 +126,7 @@ static int tdo_tl070wsh30_panel_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index 4dbf8b88f264..6dc3dd650ba6 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -287,7 +287,7 @@ static int td028ttec1_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &td028ttec1_mode);
+	mode = drm_mode_duplicate(connector->drm, &td028ttec1_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index cf4609bb9b1d..e475de08bd4e 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -350,7 +350,7 @@ static int td043mtea1_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &td043mtea1_mode);
+	mode = drm_mode_duplicate(connector->drm, &td043mtea1_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index 845304435e23..1bbde68b31a6 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -378,7 +378,7 @@ static int tpg110_get_modes(struct drm_panel *panel,
 	connector->display_info.height_mm = tpg->height;
 	connector->display_info.bus_flags = tpg->panel_mode->bus_flags;
 
-	mode = drm_mode_duplicate(connector->dev, &tpg->panel_mode->mode);
+	mode = drm_mode_duplicate(connector->drm, &tpg->panel_mode->mode);
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
index b31cffb660a7..c2aacc58f867 100644
--- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
+++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
@@ -446,7 +446,7 @@ static int truly_nt35597_get_modes(struct drm_panel *panel,
 	const struct nt35597_config *config;
 
 	config = ctx->config;
-	mode = drm_mode_duplicate(connector->dev, config->dm);
+	mode = drm_mode_duplicate(connector->drm, config->dm);
 	if (!mode) {
 		dev_err(ctx->dev, "failed to create a new display mode\n");
 		return 0;
diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index ec228c269146..6d2c5607aa52 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -168,7 +168,7 @@ static int visionox_rm69299_get_modes(struct drm_panel *panel,
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev,
+	mode = drm_mode_duplicate(connector->drm,
 				  &visionox_rm69299_1080x2248_60hz);
 	if (!mode) {
 		dev_err(ctx->panel.dev, "failed to create a new display mode\n");
diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index bb0dfd86ea67..d4ed70c44ddb 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -219,7 +219,7 @@ static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
 {
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &visionox_vtdr6130_mode);
+	mode = drm_mode_duplicate(connector->drm, &visionox_vtdr6130_mode);
 	if (!mode)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
index 2591ff8f0d4e..c01f8ce30361 100644
--- a/drivers/gpu/drm/panel/panel-widechips-ws2401.c
+++ b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
@@ -285,7 +285,7 @@ static int ws2401_get_modes(struct drm_panel *panel,
 	 * probably the custom DCS sequences needs to selected based on what
 	 * the target panel needs.
 	 */
-	mode = drm_mode_duplicate(connector->dev, &lms380kf01_480_800_mode);
+	mode = drm_mode_duplicate(connector->drm, &lms380kf01_480_800_mode);
 	if (!mode) {
 		dev_err(ws->dev, "failed to add mode\n");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 8670386498a4..0f54aca15f28 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -240,7 +240,7 @@ static int xpp055c272_get_modes(struct drm_panel *panel,
 	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	mode = drm_mode_duplicate(connector->drm, &default_mode);
 	if (!mode) {
 		dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
 			default_mode.hdisplay, default_mode.vdisplay,
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 6492a70e3c39..a5e0bbb014ce 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -226,7 +226,7 @@ static int qxl_add_mode(struct drm_connector *connector,
 			unsigned int height,
 			bool preferred)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_display_mode *mode = NULL;
 	int rc;
@@ -247,7 +247,7 @@ static int qxl_add_mode(struct drm_connector *connector,
 
 static int qxl_add_monitors_config_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct qxl_device *qdev = to_qxl(dev);
 	struct qxl_output *output = drm_connector_to_qxl_output(connector);
 	int h = output->index;
@@ -1019,7 +1019,7 @@ static int qdev_crtc_init(struct drm_device *dev, int crtc_id)
 
 static int qxl_conn_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct qxl_device *qdev = to_qxl(dev);
 	struct qxl_output *output = drm_connector_to_qxl_output(connector);
 	unsigned int pwidth = 1024;
@@ -1045,7 +1045,7 @@ static int qxl_conn_get_modes(struct drm_connector *connector)
 static enum drm_mode_status qxl_conn_mode_valid(struct drm_connector *connector,
 			       struct drm_display_mode *mode)
 {
-	struct drm_device *ddev = connector->dev;
+	struct drm_device *ddev = connector->drm;
 	struct qxl_device *qdev = to_qxl(ddev);
 
 	if (qxl_check_mode(qdev, mode->hdisplay, mode->vdisplay) != 0)
@@ -1075,7 +1075,7 @@ static enum drm_connector_status qxl_conn_detect(
 {
 	struct qxl_output *output =
 		drm_connector_to_qxl_output(connector);
-	struct drm_device *ddev = connector->dev;
+	struct drm_device *ddev = connector->drm;
 	struct qxl_device *qdev = to_qxl(ddev);
 	bool connected = false;
 
diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 009333645438..3a3fc5eee5d9 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -226,13 +226,13 @@ radeon_dp_aux_transfer_atom(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 
 void radeon_dp_aux_init(struct radeon_connector *radeon_connector)
 {
-	struct drm_device *dev = radeon_connector->base.dev;
+	struct drm_device *dev = radeon_connector->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	int ret;
 
 	radeon_connector->ddc_bus->rec.hpd = radeon_connector->hpd.hpd;
 	radeon_connector->ddc_bus->aux.dev = radeon_connector->base.kdev;
-	radeon_connector->ddc_bus->aux.drm_dev = radeon_connector->base.dev;
+	radeon_connector->ddc_bus->aux.drm_dev = radeon_connector->base.drm;
 	if (ASIC_IS_DCE5(rdev)) {
 		if (radeon_auxch)
 			radeon_connector->ddc_bus->aux.transfer = radeon_dp_aux_transfer_native;
@@ -360,7 +360,7 @@ static u8 radeon_dp_encoder_service(struct radeon_device *rdev,
 
 u8 radeon_dp_getsinktype(struct radeon_connector *radeon_connector)
 {
-	struct drm_device *dev = radeon_connector->base.dev;
+	struct drm_device *dev = radeon_connector->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	return radeon_dp_encoder_service(rdev, ATOM_DP_ACTION_GET_SINK_TYPE, 0,
diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 4aca09cab4b8..717cd6d71aff 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -1373,7 +1373,7 @@ bool
 atombios_set_edp_panel_power(struct drm_connector *connector, int action)
 {
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-	struct drm_device *dev = radeon_connector->base.dev;
+	struct drm_device *dev = radeon_connector->base.drm;
 	struct radeon_device *rdev = dev->dev_private;
 	union dig_transmitter_control args;
 	int index = GetIndexIntoMasterTable(COMMAND, UNIPHYTransmitterControl);
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 4ad5a328d920..96b5f55c908f 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -4160,7 +4160,7 @@ radeon_atombios_connected_scratch_regs(struct drm_connector *connector,
 				       struct drm_encoder *encoder,
 				       bool connected)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector =
 	    to_radeon_connector(connector);
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index d6ccaf24ee0c..fbc2ea8bcae8 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -382,7 +382,7 @@ void radeon_audio_detect(struct drm_connector *connector,
 			 struct drm_encoder *encoder,
 			 enum drm_connector_status status)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct radeon_encoder_atom_dig *dig;
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 783a6b8802d5..9a0eb4130c3b 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -3458,7 +3458,7 @@ radeon_combios_connected_scratch_regs(struct drm_connector *connector,
 				      struct drm_encoder *encoder,
 				      bool connected)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector =
 	    to_radeon_connector(connector);
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 07193cd0c417..0215f88b3b70 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -39,7 +39,7 @@
 
 void radeon_connector_hotplug(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 
@@ -98,7 +98,7 @@ static void radeon_property_change_mode(struct drm_encoder *encoder)
 
 int radeon_get_monitor_bpc(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct radeon_connector_atom_dig *dig_connector;
@@ -222,7 +222,7 @@ int radeon_get_monitor_bpc(struct drm_connector *connector)
 static void
 radeon_connector_update_scratch_regs(struct drm_connector *connector, enum drm_connector_status status)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_encoder *best_encoder;
 	struct drm_encoder *encoder;
@@ -273,7 +273,7 @@ struct edid *radeon_connector_edid(struct drm_connector *connector)
 
 static void radeon_connector_get_edid(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 
@@ -398,7 +398,7 @@ radeon_connector_analog_encoder_conflict_solve(struct drm_connector *connector,
 					       enum drm_connector_status current_status,
 					       bool priority)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_connector *conflict;
 	struct radeon_connector *radeon_conflict;
 
@@ -530,7 +530,7 @@ static void radeon_add_common_modes(struct drm_encoder *encoder, struct drm_conn
 static int radeon_connector_set_property(struct drm_connector *connector, struct drm_property *property,
 				  uint64_t val)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_encoder *encoder;
 	struct radeon_encoder *radeon_encoder;
@@ -853,7 +853,7 @@ static enum drm_mode_status radeon_lvds_mode_valid(struct drm_connector *connect
 static enum drm_connector_status
 radeon_lvds_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct drm_encoder *encoder = radeon_best_single_encoder(connector);
@@ -861,9 +861,9 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
 	int r;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -891,8 +891,8 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
 	radeon_connector_update_scratch_regs(connector, ret);
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	return ret;
@@ -923,7 +923,7 @@ static int radeon_lvds_set_property(struct drm_connector *connector,
 				    struct drm_property *property,
 				    uint64_t value)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_encoder *radeon_encoder;
 	enum radeon_rmx_type rmx_type;
 
@@ -985,7 +985,7 @@ static int radeon_vga_get_modes(struct drm_connector *connector)
 static enum drm_mode_status radeon_vga_mode_valid(struct drm_connector *connector,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	/* XXX check mode bandwidth */
@@ -999,7 +999,7 @@ static enum drm_mode_status radeon_vga_mode_valid(struct drm_connector *connecto
 static enum drm_connector_status
 radeon_vga_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct drm_encoder *encoder;
@@ -1009,9 +1009,9 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 	int r;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1082,8 +1082,8 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	return ret;
@@ -1106,7 +1106,7 @@ static const struct drm_connector_funcs radeon_vga_connector_funcs = {
 
 static int radeon_tv_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_display_mode *tv_mode;
 	struct drm_encoder *encoder;
@@ -1149,9 +1149,9 @@ radeon_tv_detect(struct drm_connector *connector, bool force)
 		return ret;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1168,8 +1168,8 @@ radeon_tv_detect(struct drm_connector *connector, bool force)
 	radeon_connector_update_scratch_regs(connector, ret);
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	return ret;
@@ -1192,7 +1192,7 @@ static const struct drm_connector_funcs radeon_tv_connector_funcs = {
 
 static bool radeon_check_hpd_status_unchanged(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	enum drm_connector_status status;
@@ -1225,7 +1225,7 @@ static bool radeon_check_hpd_status_unchanged(struct drm_connector *connector)
 static enum drm_connector_status
 radeon_dvi_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct drm_encoder *encoder = NULL;
@@ -1235,9 +1235,9 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 	bool dret = false, broken_edid = false;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1416,8 +1416,8 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 
 exit:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	return ret;
@@ -1462,7 +1462,7 @@ static void radeon_dvi_force(struct drm_connector *connector)
 static enum drm_mode_status radeon_dvi_mode_valid(struct drm_connector *connector,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 
@@ -1620,7 +1620,7 @@ static bool radeon_connector_encoder_is_hbr2(struct drm_connector *connector)
 
 bool radeon_connector_is_dp12_capable(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (ASIC_IS_DCE5(rdev) &&
@@ -1635,7 +1635,7 @@ bool radeon_connector_is_dp12_capable(struct drm_connector *connector)
 static enum drm_connector_status
 radeon_dp_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	enum drm_connector_status ret = connector_status_disconnected;
@@ -1644,9 +1644,9 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 	int r;
 
 	if (!drm_kms_helper_is_poll_worker()) {
-		r = pm_runtime_get_sync(connector->dev->dev);
+		r = pm_runtime_get_sync(connector->drm->dev);
 		if (r < 0) {
-			pm_runtime_put_autosuspend(connector->dev->dev);
+			pm_runtime_put_autosuspend(connector->drm->dev);
 			return connector_status_disconnected;
 		}
 	}
@@ -1728,8 +1728,8 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 
 out:
 	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
+		pm_runtime_mark_last_busy(connector->drm->dev);
+		pm_runtime_put_autosuspend(connector->drm->dev);
 	}
 
 	return ret;
@@ -1738,7 +1738,7 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 static enum drm_mode_status radeon_dp_mode_valid(struct drm_connector *connector,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct radeon_connector_atom_dig *radeon_dig_connector = radeon_connector->con_priv;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae2..3ce190c67055 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -41,7 +41,7 @@ struct rcar_du_wb_job {
 
 static int rcar_du_wb_conn_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
 				    dev->mode_config.max_height);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
index 794573badfe8..4c56524670bd 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
@@ -16,7 +16,7 @@
 static int shmob_drm_backlight_update(struct backlight_device *bdev)
 {
 	struct shmob_drm_connector *scon = bl_get_data(bdev);
-	struct shmob_drm_device *sdev = scon->connector.dev->dev_private;
+	struct shmob_drm_device *sdev = scon->connector.drm->dev_private;
 	const struct shmob_drm_backlight_data *bdata = &sdev->pdata->backlight;
 	int brightness = backlight_get_brightness(bdev);
 
@@ -26,7 +26,7 @@ static int shmob_drm_backlight_update(struct backlight_device *bdev)
 static int shmob_drm_backlight_get_brightness(struct backlight_device *bdev)
 {
 	struct shmob_drm_connector *scon = bl_get_data(bdev);
-	struct shmob_drm_device *sdev = scon->connector.dev->dev_private;
+	struct shmob_drm_device *sdev = scon->connector.drm->dev_private;
 	const struct shmob_drm_backlight_data *bdata = &sdev->pdata->backlight;
 
 	return bdata->get_brightness();
@@ -50,10 +50,10 @@ void shmob_drm_backlight_dpms(struct shmob_drm_connector *scon, int mode)
 
 int shmob_drm_backlight_init(struct shmob_drm_connector *scon)
 {
-	struct shmob_drm_device *sdev = scon->connector.dev->dev_private;
+	struct shmob_drm_device *sdev = scon->connector.drm->dev_private;
 	const struct shmob_drm_backlight_data *bdata = &sdev->pdata->backlight;
 	struct drm_connector *connector = &scon->connector;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct backlight_device *backlight;
 
 	if (!bdata->max_brightness)
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 11dd2bc803e7..ff1bdb1a3e54 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -616,10 +616,10 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 static int shmob_drm_connector_get_modes(struct drm_connector *connector)
 {
-	struct shmob_drm_device *sdev = connector->dev->dev_private;
+	struct shmob_drm_device *sdev = connector->drm->dev_private;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_create(connector->dev);
+	mode = drm_mode_create(connector->drm);
 	if (mode == NULL)
 		return 0;
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6a63952a6c84..1f38a4fffa3c 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -679,7 +679,7 @@ static irqreturn_t inno_hdmi_irq(int irq, void *dev_id)
 {
 	struct inno_hdmi *hdmi = dev_id;
 
-	drm_helper_hpd_irq_event(hdmi->connector.dev);
+	drm_helper_hpd_irq_event(hdmi->connector.drm);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 5e6ac27ea155..810f170d8ba9 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -609,7 +609,7 @@ static irqreturn_t rk3066_hdmi_irq(int irq, void *dev_id)
 {
 	struct rk3066_hdmi *hdmi = dev_id;
 
-	drm_helper_hpd_irq_event(hdmi->connector.dev);
+	drm_helper_hpd_irq_event(hdmi->connector.drm);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index b3dc1ca9dc10..e34750187b58 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -760,11 +760,11 @@ static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
 
 static int ssd130x_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->drm);
 	struct drm_display_mode *mode;
 	struct device *dev = ssd130x->dev;
 
-	mode = drm_mode_duplicate(connector->dev, &ssd130x->mode);
+	mode = drm_mode_duplicate(connector->drm, &ssd130x->mode);
 	if (!mode) {
 		dev_err(dev, "Failed to duplicated mode\n");
 		return 0;
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 4d2677dcd831..1818d4856f87 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -274,7 +274,7 @@ static void tegra_dpaux_hotplug(struct work_struct *work)
 	struct tegra_dpaux *dpaux = work_to_dpaux(work);
 
 	if (dpaux->output)
-		drm_helper_hpd_irq_event(dpaux->output->connector.dev);
+		drm_helper_hpd_irq_event(dpaux->output->connector.drm);
 }
 
 static irqreturn_t tegra_dpaux_irq(int irq, void *data)
@@ -719,7 +719,7 @@ int drm_dp_aux_attach(struct drm_dp_aux *aux, struct tegra_output *output)
 	unsigned long timeout;
 	int err;
 
-	aux->drm_dev = output->connector.dev;
+	aux->drm_dev = output->connector.drm;
 	err = drm_dp_aux_register(aux);
 	if (err < 0)
 		return err;
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index a9870c828374..467f797fa65a 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -232,7 +232,7 @@ static int tegra_dsi_late_register(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
 	unsigned int i, count = ARRAY_SIZE(debugfs_files);
-	struct drm_minor *minor = connector->dev->primary;
+	struct drm_minor *minor = connector->drm->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_dsi *dsi = to_dsi(output);
 
@@ -256,7 +256,7 @@ static void tegra_dsi_early_unregister(struct drm_connector *connector)
 	struct tegra_dsi *dsi = to_dsi(output);
 
 	drm_debugfs_remove_files(dsi->debugfs_files, count,
-				 connector->dev->primary);
+				 connector->drm->primary);
 	kfree(dsi->debugfs_files);
 	dsi->debugfs_files = NULL;
 }
@@ -1507,8 +1507,8 @@ static int tegra_dsi_host_attach(struct mipi_dsi_host *host,
 		if (IS_ERR(output->panel))
 			output->panel = NULL;
 
-		if (output->panel && output->connector.dev)
-			drm_helper_hpd_irq_event(output->connector.dev);
+		if (output->panel && output->connector.drm)
+			drm_helper_hpd_irq_event(output->connector.drm);
 	}
 
 	return 0;
@@ -1523,8 +1523,8 @@ static int tegra_dsi_host_detach(struct mipi_dsi_host *host,
 	if (output->panel && &device->dev == output->panel->dev) {
 		output->panel = NULL;
 
-		if (output->connector.dev)
-			drm_helper_hpd_irq_event(output->connector.dev);
+		if (output->connector.drm)
+			drm_helper_hpd_irq_event(output->connector.drm);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6eac54ae1205..7f994d79fd72 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1090,7 +1090,7 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
 	unsigned int i, count = ARRAY_SIZE(debugfs_files);
-	struct drm_minor *minor = connector->dev->primary;
+	struct drm_minor *minor = connector->drm->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_hdmi *hdmi = to_hdmi(output);
 
@@ -1110,7 +1110,7 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 static void tegra_hdmi_early_unregister(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
-	struct drm_minor *minor = connector->dev->primary;
+	struct drm_minor *minor = connector->drm->primary;
 	unsigned int count = ARRAY_SIZE(debugfs_files);
 	struct tegra_hdmi *hdmi = to_hdmi(output);
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index dc2dcb5ca1c8..9ebb6a551331 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -88,8 +88,8 @@ static irqreturn_t hpd_irq(int irq, void *data)
 {
 	struct tegra_output *output = data;
 
-	if (output->connector.dev)
-		drm_helper_hpd_irq_event(output->connector.dev);
+	if (output->connector.drm)
+		drm_helper_hpd_irq_event(output->connector.drm);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index fbb63d755496..2bc0f6668b30 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1683,7 +1683,7 @@ static int tegra_sor_late_register(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
 	unsigned int i, count = ARRAY_SIZE(debugfs_files);
-	struct drm_minor *minor = connector->dev->primary;
+	struct drm_minor *minor = connector->drm->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_sor *sor = to_sor(output);
 
@@ -1707,7 +1707,7 @@ static void tegra_sor_early_unregister(struct drm_connector *connector)
 	struct tegra_sor *sor = to_sor(output);
 
 	drm_debugfs_remove_files(sor->debugfs_files, count,
-				 connector->dev->primary);
+				 connector->drm->primary);
 	kfree(sor->debugfs_files);
 	sor->debugfs_files = NULL;
 }
diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 416a279b6dae..0d0ecd2a58eb 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -26,14 +26,14 @@ static int drm_client_modeset_connector_get_modes(struct drm_connector *connecto
 
 	count = drm_add_modes_noedid(connector, 1920, 1200);
 
-	mode = drm_mode_analog_ntsc_480i(connector->dev);
+	mode = drm_mode_analog_ntsc_480i(connector->drm);
 	if (!mode)
 		return count;
 
 	drm_mode_probed_add(connector, mode);
 	count += 1;
 
-	mode = drm_mode_analog_pal_576i(connector->dev);
+	mode = drm_mode_analog_pal_576i(connector->drm);
 	if (!mode)
 		return count;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 9aefd010acde..a46bfc968c74 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -134,7 +134,7 @@ static void panel_connector_destroy(struct drm_connector *connector)
 
 static int panel_connector_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct panel_connector *panel_connector = to_panel_connector(connector);
 	struct display_timings *timings = panel_connector->mod->timings;
 	int i;
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 594bc472862f..3d3d6c8fd92e 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -537,8 +537,8 @@ static int cirrus_connector_helper_get_modes(struct drm_connector *connector)
 	int count;
 
 	count = drm_add_modes_noedid(connector,
-				     connector->dev->mode_config.max_width,
-				     connector->dev->mode_config.max_height);
+				     connector->drm->mode_config.max_width,
+				     connector->drm->mode_config.max_height);
 	drm_set_preferred_mode(connector, 1024, 768);
 	return count;
 }
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 2d999a0facde..dbf053d603af 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -989,7 +989,7 @@ static const struct drm_crtc_funcs ofdrm_crtc_funcs = {
 
 static int ofdrm_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ofdrm_device *odev = ofdrm_device_of_dev(connector->dev);
+	struct ofdrm_device *odev = ofdrm_device_of_dev(connector->drm);
 
 	return drm_connector_helper_get_modes_fixed(connector, &odev->mode);
 }
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c2677d081a7b..f884b2712bde 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -848,7 +848,7 @@ static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
 {
-	struct repaper_epd *epd = drm_to_epd(connector->dev);
+	struct repaper_epd *epd = drm_to_epd(connector->drm);
 
 	return drm_connector_helper_get_modes_fixed(connector, epd->mode);
 }
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ff86ba1ae1b8..fa511aff2545 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -578,7 +578,7 @@ static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
 
 static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->dev);
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->drm);
 
 	return drm_connector_helper_get_modes_fixed(connector, &sdev->mode);
 }
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index aa02fd2789c3..1c85223b4bdc 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -464,7 +464,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t le
 
 static enum drm_connector_status udl_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct udl_device *udl = to_udl(dev);
 	struct udl_connector *udl_connector = to_udl_connector(connector);
 	enum drm_connector_status status = connector_status_disconnected;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 341edd982cb3..d7326d6b9062 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -712,7 +712,7 @@ static int vbox_get_modes(struct drm_connector *connector)
 	int preferred_width, preferred_height;
 
 	vbox_connector = to_vbox_connector(connector);
-	vbox = to_vbox_dev(connector->dev);
+	vbox = to_vbox_dev(connector->drm);
 
 	hgsmi_report_flags_location(vbox->guest_pool, GUEST_HEAP_OFFSET(vbox) +
 				    HOST_FLAGS_OFFSET);
@@ -724,7 +724,7 @@ static int vbox_get_modes(struct drm_connector *connector)
 			  vbox_connector->mode_hint.width : 1024;
 	preferred_height = vbox_connector->mode_hint.height ?
 			   vbox_connector->mode_hint.height : 768;
-	mode = drm_cvt_mode(connector->dev, preferred_width, preferred_height,
+	mode = drm_cvt_mode(connector->drm, preferred_width, preferred_height,
 			    60, false, false, false);
 	if (mode) {
 		mode->type |= DRM_MODE_TYPE_PREFERRED;
@@ -778,7 +778,7 @@ static int vbox_fill_modes(struct drm_connector *connector, u32 max_x,
 	struct drm_display_mode *mode, *iterator;
 
 	vbox_connector = to_vbox_connector(connector);
-	dev = vbox_connector->base.dev;
+	dev = vbox_connector->base.drm;
 	list_for_each_entry_safe(mode, iterator, &connector->modes, head) {
 		list_del(&mode->head);
 		drm_mode_destroy(dev, mode);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 56a950e6d777..5e53d4f8232d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -172,7 +172,7 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_entry *entry = m->private;
 	struct vc4_hdmi *vc4_hdmi = entry->file.data;
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	struct drm_printer p = drm_seq_file_printer(m);
 	int idx;
 
@@ -195,7 +195,7 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 
 static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	int idx;
 
@@ -228,7 +228,7 @@ static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 
 static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	int idx;
 
@@ -257,7 +257,7 @@ static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long cec_rate;
 	unsigned long flags;
 	u16 clk_cnt;
@@ -340,7 +340,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	if (!connector)
 		return 0;
 
-	drm = connector->dev;
+	drm = connector->drm;
 	ret = drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);
 	if (ret)
 		return ret;
@@ -490,7 +490,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(connector->drm);
 	int ret = 0;
 	struct edid *edid;
 
@@ -515,7 +515,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	kfree(edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
-		struct drm_device *drm = connector->dev;
+		struct drm_device *drm = connector->drm;
 		const struct drm_display_mode *mode;
 
 		list_for_each_entry(mode, &connector->probed_modes, head) {
@@ -591,7 +591,7 @@ static int vc4_hdmi_connector_get_property(struct drm_connector *connector,
 					   struct drm_property *property,
 					   uint64_t *val)
 {
-	struct drm_device *drm = connector->dev;
+	struct drm_device *drm = connector->drm;
 	struct vc4_hdmi *vc4_hdmi =
 		connector_to_vc4_hdmi(connector);
 	const struct vc4_hdmi_connector_state *vc4_conn_state =
@@ -613,7 +613,7 @@ static int vc4_hdmi_connector_set_property(struct drm_connector *connector,
 					   struct drm_property *property,
 					   uint64_t val)
 {
-	struct drm_device *drm = connector->dev;
+	struct drm_device *drm = connector->drm;
 	struct vc4_hdmi *vc4_hdmi =
 		connector_to_vc4_hdmi(connector);
 	struct vc4_hdmi_connector_state *vc4_conn_state =
@@ -772,7 +772,7 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 				bool poll)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	u32 packet_id = type - 0x80;
 	unsigned long flags;
 	int ret = 0;
@@ -799,7 +799,7 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 				     union hdmi_infoframe *frame)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	u32 packet_id = frame->any.type - 0x80;
 	const struct vc4_hdmi_register *ram_packet_start =
 		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
@@ -999,7 +999,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_device *drm = connector->dev;
+	struct drm_device *drm = connector->drm;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	unsigned long flags;
 	int idx;
@@ -1037,7 +1037,7 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_device *drm = connector->dev;
+	struct drm_device *drm = connector->drm;
 	unsigned long flags;
 	int idx;
 
@@ -1086,7 +1086,7 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 					       struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	int idx;
 
@@ -1124,7 +1124,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 						 struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	int ret;
 	int idx;
@@ -1161,7 +1161,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 {
 	struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	u32 csc_ctl;
 	int idx;
@@ -1396,7 +1396,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
 			       struct drm_connector_state *state,
 			       const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
 	unsigned int lim_range = vc4_hdmi_is_full_range(vc4_hdmi, vc4_state) ? 0 : 1;
@@ -1462,7 +1462,7 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -1526,7 +1526,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 				 struct drm_connector_state *state,
 				 const struct drm_display_mode *mode)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	const struct vc4_hdmi_connector_state *vc4_state =
 		conn_state_to_vc4_hdmi_conn_state(state);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -1633,7 +1633,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	u32 drift;
 	int ret;
@@ -1677,7 +1677,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 						struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
@@ -1796,7 +1796,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_connector_state *conn_state =
@@ -1826,7 +1826,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 					      struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
@@ -1926,7 +1926,7 @@ vc4_hdmi_sink_supports_format_bpc(const struct vc4_hdmi *vc4_hdmi,
 				  const struct drm_display_mode *mode,
 				  unsigned int format, unsigned int bpc)
 {
-	struct drm_device *dev = vc4_hdmi->connector.dev;
+	struct drm_device *dev = vc4_hdmi->connector.drm;
 	u8 vic = drm_match_cea_mode(mode);
 
 	if (vic == 1 && bpc != 8) {
@@ -2011,7 +2011,7 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 {
 	const struct drm_connector *connector = &vc4_hdmi->connector;
 	const struct drm_display_info *info = &connector->display_info;
-	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
+	struct vc4_dev *vc4 = to_vc4_dev(connector->drm);
 
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
@@ -2073,7 +2073,7 @@ vc4_hdmi_encoder_compute_format(const struct vc4_hdmi *vc4_hdmi,
 				const struct drm_display_mode *mode,
 				unsigned int bpc)
 {
-	struct drm_device *dev = vc4_hdmi->connector.dev;
+	struct drm_device *dev = vc4_hdmi->connector.drm;
 	const struct drm_connector *connector = &vc4_hdmi->connector;
 	const struct drm_display_info *info = &connector->display_info;
 	unsigned int format;
@@ -2116,7 +2116,7 @@ vc4_hdmi_encoder_compute_config(const struct vc4_hdmi *vc4_hdmi,
 				struct vc4_hdmi_connector_state *vc4_state,
 				const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = vc4_hdmi->connector.dev;
+	struct drm_device *dev = vc4_hdmi->connector.drm;
 	struct drm_connector_state *conn_state = &vc4_state->base;
 	unsigned int max_bpc = clamp_t(unsigned int, conn_state->max_bpc, 8, 12);
 	unsigned int bpc;
@@ -2273,7 +2273,7 @@ static u32 vc5_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channel_mask)
 
 static bool vc5_hdmi_hp_detect(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	u32 hotplug;
 	int idx;
@@ -2294,7 +2294,7 @@ static bool vc5_hdmi_hp_detect(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 					 unsigned int samplerate)
 {
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	u32 hsm_clock;
 	unsigned long flags;
 	unsigned long n, m;
@@ -2373,7 +2373,7 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	int ret = 0;
 	int idx;
@@ -2438,7 +2438,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	int idx;
 
@@ -2512,7 +2512,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 				  struct hdmi_codec_params *params)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
@@ -2823,7 +2823,7 @@ static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	if (dev && dev->registered)
 		drm_connector_helper_hpd_irq_event(connector);
@@ -2906,7 +2906,7 @@ static irqreturn_t vc4_cec_irq_handler_thread(int irq, void *priv)
 
 static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 {
-	struct drm_device *dev = vc4_hdmi->connector.dev;
+	struct drm_device *dev = vc4_hdmi->connector.drm;
 	struct cec_msg *msg = &vc4_hdmi->cec_rx_msg;
 	unsigned int i;
 
@@ -3046,7 +3046,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
 	unsigned long flags;
@@ -3113,7 +3113,7 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	int idx;
 
@@ -3157,7 +3157,7 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-	struct drm_device *drm = vc4_hdmi->connector.dev;
+	struct drm_device *drm = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	int idx;
 
@@ -3186,7 +3186,7 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-	struct drm_device *dev = vc4_hdmi->connector.dev;
+	struct drm_device *dev = vc4_hdmi->connector.drm;
 	unsigned long flags;
 	u32 val;
 	unsigned int i;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 6cdd97f364a8..4091fd872d65 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -184,7 +184,7 @@ static const struct debugfs_reg32 txp_regs[] = {
 
 static int vc4_txp_connector_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
 				    dev->mode_config.max_height);
@@ -194,7 +194,7 @@ static enum drm_mode_status
 vc4_txp_connector_mode_valid(struct drm_connector *connector,
 			     struct drm_display_mode *mode)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	int w = mode->hdisplay, h = mode->vdisplay;
 
@@ -282,7 +282,7 @@ static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
 static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 					struct drm_atomic_state *state)
 {
-	struct drm_device *drm = conn->dev;
+	struct drm_device *drm = conn->drm;
 	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
 										    conn);
 	struct vc4_txp *txp = connector_to_vc4_txp(conn);
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ad924a8502e9..6f9cc844412b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -178,7 +178,7 @@ static int virtio_gpu_conn_get_modes(struct drm_connector *connector)
 		drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
 	} else {
 		DRM_DEBUG("add mode: %dx%d\n", width, height);
-		mode = drm_cvt_mode(connector->dev, width, height, 60,
+		mode = drm_cvt_mode(connector->drm, width, height, 60,
 				    false, false, false);
 		if (!mode)
 			return count;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..9850ed02ac76 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -61,7 +61,7 @@ static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_funcs = {
 
 static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 
 	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
 				    dev->mode_config.max_height);
@@ -121,7 +121,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->drm);
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_writeback_connector *wb_conn = &output->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index b62207be3363..e7cad0200f9b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2263,7 +2263,7 @@ enum drm_connector_status
 vmw_du_connector_detect(struct drm_connector *connector, bool force)
 {
 	uint32_t num_displays;
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct vmw_display_unit *du = vmw_connector_to_du(connector);
 
@@ -2400,7 +2400,7 @@ int vmw_du_connector_fill_modes(struct drm_connector *connector,
 				uint32_t max_width, uint32_t max_height)
 {
 	struct vmw_display_unit *du = vmw_connector_to_du(connector);
-	struct drm_device *dev = connector->dev;
+	struct drm_device *dev = connector->drm;
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct drm_display_mode *mode = NULL;
 	struct drm_display_mode *bmode;
diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.c b/drivers/gpu/drm/xen/xen_drm_front_conn.c
index a1ba6d3d0568..e167d4496f9c 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_conn.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_conn.c
@@ -50,7 +50,7 @@ static int connector_detect(struct drm_connector *connector,
 	struct xen_drm_front_drm_pipeline *pipeline =
 			to_xen_drm_pipeline(connector);
 
-	if (drm_dev_is_unplugged(connector->dev))
+	if (drm_dev_is_unplugged(connector->drm))
 		pipeline->conn_connected = false;
 
 	return pipeline->conn_connected ? connector_status_connected :
@@ -67,7 +67,7 @@ static int connector_get_modes(struct drm_connector *connector)
 	struct videomode videomode;
 	int width, height;
 
-	mode = drm_mode_create(connector->dev);
+	mode = drm_mode_create(connector->drm);
 	if (!mode)
 		return 0;
 
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 241b1621b197..31806ccc154a 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -62,7 +62,7 @@ void cec_fill_conn_info_from_drm(struct cec_connector_info *conn_info,
 {
 	memset(conn_info, 0, sizeof(*conn_info));
 	conn_info->type = CEC_CONNECTOR_TYPE_DRM;
-	conn_info->drm.card_no = connector->dev->primary->index;
+	conn_info->drm.card_no = connector->drm->primary->index;
 	conn_info->drm.connector_id = connector->base.id;
 }
 EXPORT_SYMBOL_GPL(cec_fill_conn_info_from_drm);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d300fde6c1a4..e622de54461a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1492,8 +1492,8 @@ struct drm_cmdline_mode {
  * span multiple monitors).
  */
 struct drm_connector {
-	/** @dev: parent DRM device */
-	struct drm_device *dev;
+	/** @drm: parent DRM device */
+	struct drm_device *drm;
 	/** @kdev: kernel device for sysfs attributes */
 	struct device *kdev;
 	/** @attr: sysfs attributes */
@@ -2114,7 +2114,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
  * @encoder: &struct drm_encoder pointer used as cursor
  */
 #define drm_connector_for_each_possible_encoder(connector, encoder) \
-	drm_for_each_encoder_mask(encoder, (connector)->dev, \
+	drm_for_each_encoder_mask(encoder, (connector)->drm, \
 				  (connector)->possible_encoders)
 
 #endif
-- 
2.39.2

