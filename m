Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB1751B78
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C0010E635;
	Thu, 13 Jul 2023 08:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48E010E629
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:25:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcc-0005qJ-R2; Thu, 13 Jul 2023 10:24:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrca-00E4j1-8E; Thu, 13 Jul 2023 10:24:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJrcZ-004Vgi-Eg; Thu, 13 Jul 2023 10:24:19 +0200
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
Subject: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Date: Thu, 13 Jul 2023 10:23:51 +0200
Message-Id: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=41873;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=4Tg+YUl5+vkc1ICmOYZcaaPqw0uIphcJepXq6zW6Uk0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkr7R/fFYs2UoSFZdh15Qzl2AZV4pneFuo+jZBg
 46lEZkO1lyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK+0fwAKCRCPgPtYfRL+
 Ts6ICACdB6nKPgSwEODX8XZgdm484hWmimTkmQUB2hEXejo67GpVgSs05X41l2NoLhLd8rcOvy7
 mUSZvZuXHqIcTMdFbrMA75znsKe1OIYmGPs0+ftbzLUQvu8MmDrvUrmUwn5LTELqS3q5xbVqXo/
 1GKymmVeCwVOB6AjCZQK4VufRExwd2s7MDxhO2oXUkBY3Bt3guGs0RdIp/tro6us1rk5L94K0TR
 tRIhsMZA90IDosdanRBzWoctfwLW2GI+AB0ILQtWLRJpr4j1P17y0tm0r5Cpayj9ubjsZq/v1O1
 oZlLhkeGW1vKjscNx8fkuL17cHFzSdLdK6qSBvt8UXwtTSm4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hello,

after most feedback for my series "drm/crtc: Rename struct drm_crtc::dev
to drm_dev"[1] was positive in principle, here comes a new series. I
didn't call it v2 as it is different enough to stand on its own.

The motivation is that "dev" (at least in my bubble) usually is a struct
device *, and it's irritating to see things like drm->dev->dev where drm
is a struct nouveau_drm *, drm->dev is a a struct drm_device * and
drm->dev->dev is a struct device *. (Obviously this series doesn't fix
this particular instance, but this is the intrusive part affecting
several drivers, the remainder is driver specific.)

After I completed the series I noticed some more feedback, Thomas suggested to
just rename struct drm_device::dev to "parent" with the reasoning that
"Everyone in DRM-land knows that 'dev' is the DRM device." In my book this
isn't a good enough justification. I might be biased because I don't consider
me to be "in DRM-land". IMHO it's still very beneficial to lower the bar for
"outsiders" to understand the code. Also I believe that's is much easier to get
negative feedback, so if you'd oppose a renaming in the opposite direction
(i.e. from "drm" to "dev") feel free to signal that.

Changes compared to above mentioned series:

 - Rebased to drm-misc-next of yesterday[2]
 - Use one patch per member rename on popular request I'm curious if the
   problems I see with that will matter. (Hint: You can cheat here a bit and
   fast-track this series into drm-misc-next :-)
 - Also rename the dev member of drm_atomic_state, drm_bridge,
   drm_client_dev, drm_connector, drm_debugfs_entry,
   drm_dp_mst_topology_mgr, drm_encoder, drm_fb_helper, drm_framebuffer,
   drm_gem_object, drm_master, drm_minor, drm_plane, drm_property_blob,
   drm_property and drm_vblank_crtc in the same way as drm_crtc's.
 - Use "drm" as member name. This is not all reviewers' favourite, but
   the one with a majority. I hope there are not that many people who
   strongly but silently preferred the initial choice "drm_dev".
 - Stripped down the recipients to the people replying on the first series and
   the dri list.

The original series got a Reviewed-by: Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> for patch #4, I didn't apply it here.

The series is build tested (on each intermediate state) using
allmodconfig on arm64, m68k, powerpc, riscv, s390, sparc64 and x86_64.
(I had to cherry-pick an unrelated fix for sparc64 to succeed[3].)

The initial changes were done using coccinelle, but it missed quite a
few changes. For example it missed to adapt parameters of macro calls
which were only found using extensive build testing. It also failed for
example to adapt

        if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev)
	                                                          ^^^

in drivers/gpu/drm/mediatek/mtk_hdmi.c, it's unclear to me why.

All in all there are no semantic changes, this series just renames
things to (hopefully) be easier to understand for humans and so
shouldn't have a relevant impact on the build results.

Best regards
Uwe

[1] https://lore.kernel.org/dri-devel/20230712094702.1770121-1-u.kleine-koenig@pengutronix.de
[2] ca6c1e210aa7 ("drm/amdgpu: use the new drm_exec object for CS v3")
[3] 861c249cd782 ("arch/sparc: Add module license and description for fbdev helpers")

Uwe Kleine-König (17):
  drm/atomic_state: Rename struct drm_atomic_state::dev to drm
  drm/bridge: Rename struct drm_bridge::dev to drm
  drm/client_dev: Rename struct drm_client_dev::dev to drm
  drm/connector: Rename struct drm_connector::dev to drm
  drm/crtc: Rename struct drm_crtc::dev to drm
  drm/debugfs_entry: Rename struct drm_debugfs_entry::dev to drm
  drm/dp_mst_topology_mgr: Rename struct drm_dp_mst_topology_mgr::dev to
    drm
  drm/encoder: Rename struct drm_encoder::dev to drm
  drm/fb_helper: Rename struct drm_fb_helper::dev to drm
  drm/framebuffer: Rename struct drm_framebuffer::dev to drm
  drm/gem_object: Rename struct drm_gem_object::dev to drm
  drm/master: Rename struct drm_master::dev to drm
  drm/minor: Rename struct drm_minor::dev to drm
  drm/plane: Rename struct drm_plane::dev to drm
  drm/property_blob: Rename struct drm_property_blob::dev to drm
  drm/property: Rename struct drm_property::dev to drm
  drm/vblank_crtc: Rename struct drm_vblank_crtc::dev to drm

 drivers/accel/drm_accel.c                     |  16 +-
 drivers/accel/ivpu/ivpu_debugfs.c             |  16 +-
 drivers/accel/ivpu/ivpu_gem.c                 |   2 +-
 drivers/accel/ivpu/ivpu_gem.h                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   4 +-
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  56 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  34 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |  12 +-
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c    |  22 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |   6 +-
 .../gpu/drm/amd/amdgpu/atombios_encoders.c    |  34 +--
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  50 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  52 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  60 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  50 ++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 136 ++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  20 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  10 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  48 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    |   2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  12 +-
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  24 +-
 .../arm/display/komeda/komeda_framebuffer.c   |   2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |   6 +-
 .../gpu/drm/arm/display/komeda/komeda_plane.c |   2 +-
 .../arm/display/komeda/komeda_wb_connector.c  |   2 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c              |   8 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |   4 +-
 drivers/gpu/drm/arm/malidp_crtc.c             |   6 +-
 drivers/gpu/drm/arm/malidp_drv.c              |   8 +-
 drivers/gpu/drm/arm/malidp_mw.c               |   6 +-
 drivers/gpu/drm/arm/malidp_planes.c           |   4 +-
 drivers/gpu/drm/armada/armada_crtc.c          |  10 +-
 drivers/gpu/drm/armada/armada_debugfs.c       |   2 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |   6 +-
 drivers/gpu/drm/armada/armada_gem.c           |   6 +-
 drivers/gpu/drm/armada/armada_overlay.c       |   6 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |   6 +-
 drivers/gpu/drm/ast/ast_dp.c                  |   2 +-
 drivers/gpu/drm/ast/ast_mode.c                |  50 ++--
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  10 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |   8 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |   6 +-
 .../drm/bridge/analogix/analogix-anx6345.c    |   4 +-
 .../drm/bridge/analogix/analogix-anx78xx.c    |   6 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |   8 +-
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  22 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c      |   6 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |   8 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c      |   6 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c       |   4 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c    |   8 +-
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |   6 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |   7 +-
 drivers/gpu/drm/bridge/panel.c                |   6 +-
 drivers/gpu/drm/bridge/parade-ps8640.c        |   5 +-
 drivers/gpu/drm/bridge/sii902x.c              |   6 +-
 drivers/gpu/drm/bridge/simple-bridge.c        |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |   6 +-
 drivers/gpu/drm/bridge/tc358767.c             |   6 +-
 drivers/gpu/drm/bridge/tc358768.c             |   2 +-
 drivers/gpu/drm/bridge/tc358775.c             |   2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   7 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |   8 +-
 drivers/gpu/drm/display/drm_dp_cec.c          |   2 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |   2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 261 +++++++++++-------
 drivers/gpu/drm/display/drm_hdcp_helper.c     |   4 +-
 drivers/gpu/drm/display/drm_scdc_helper.c     |  10 +-
 drivers/gpu/drm/drm_agpsupport.c              |   2 +-
 drivers/gpu/drm/drm_atomic.c                  | 101 +++----
 drivers/gpu/drm/drm_atomic_helper.c           |  98 ++++---
 drivers/gpu/drm/drm_atomic_state_helper.c     |   4 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  59 ++--
 drivers/gpu/drm/drm_auth.c                    |  12 +-
 drivers/gpu/drm/drm_blend.c                   |  12 +-
 drivers/gpu/drm/drm_bridge.c                  |  14 +-
 drivers/gpu/drm/drm_bridge_connector.c        |   2 +-
 drivers/gpu/drm/drm_client.c                  |  28 +-
 drivers/gpu/drm/drm_client_modeset.c          |  24 +-
 drivers/gpu/drm/drm_color_mgmt.c              |  12 +-
 drivers/gpu/drm/drm_connector.c               |  75 ++---
 drivers/gpu/drm/drm_crtc.c                    |  18 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  16 +-
 drivers/gpu/drm/drm_damage_helper.c           |   6 +-
 drivers/gpu/drm/drm_debugfs.c                 |  19 +-
 drivers/gpu/drm/drm_debugfs_crc.c             |   2 +-
 drivers/gpu/drm/drm_drv.c                     |  14 +-
 drivers/gpu/drm/drm_edid.c                    | 134 +++++----
 drivers/gpu/drm/drm_edid_load.c               |  10 +-
 drivers/gpu/drm/drm_encoder.c                 |   8 +-
 drivers/gpu/drm/drm_fb_helper.c               |  62 ++---
 drivers/gpu/drm/drm_fbdev_dma.c               |  12 +-
 drivers/gpu/drm/drm_fbdev_generic.c           |  14 +-
 drivers/gpu/drm/drm_file.c                    |  22 +-
 drivers/gpu/drm/drm_format_helper.c           |   8 +-
 drivers/gpu/drm/drm_framebuffer.c             |  22 +-
 drivers/gpu/drm/drm_gem.c                     |  16 +-
 drivers/gpu/drm/drm_gem_dma_helper.c          |  11 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   5 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  39 +--
 drivers/gpu/drm/drm_gem_vram_helper.c         |   8 +-
 drivers/gpu/drm/drm_ioc32.c                   |   2 +-
 drivers/gpu/drm/drm_ioctl.c                   |   4 +-
 drivers/gpu/drm/drm_lease.c                   |  32 +--
 drivers/gpu/drm/drm_mipi_dbi.c                |  16 +-
 drivers/gpu/drm/drm_mode_config.c             |   4 +-
 drivers/gpu/drm/drm_mode_object.c             |  18 +-
 drivers/gpu/drm/drm_modes.c                   |   6 +-
 drivers/gpu/drm/drm_modeset_helper.c          |   2 +-
 drivers/gpu/drm/drm_plane.c                   |  26 +-
 drivers/gpu/drm/drm_plane_helper.c            |   6 +-
 drivers/gpu/drm/drm_prime.c                   |  12 +-
 drivers/gpu/drm/drm_probe_helper.c            |  23 +-
 drivers/gpu/drm/drm_property.c                |  14 +-
 drivers/gpu/drm/drm_self_refresh_helper.c     |   2 +-
 drivers/gpu/drm/drm_simple_kms_helper.c       |   2 +-
 drivers/gpu/drm/drm_sysfs.c                   |  22 +-
 drivers/gpu/drm/drm_vblank.c                  |  44 +--
 drivers/gpu/drm/drm_vblank_work.c             |  20 +-
 drivers/gpu/drm/drm_vm.c                      |  18 +-
 drivers/gpu/drm/drm_writeback.c               |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  18 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   2 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  12 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  15 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |   6 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |  16 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |   6 +-
 drivers/gpu/drm/gma500/cdv_device.c           |   4 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c        |   6 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c    |   2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |  38 +--
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |   8 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  16 +-
 drivers/gpu/drm/gma500/fbdev.c                |   6 +-
 drivers/gpu/drm/gma500/gem.c                  |   6 +-
 drivers/gpu/drm/gma500/gma_display.c          |  20 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c        |   8 +-
 drivers/gpu/drm/gma500/oaktrail_hdmi.c        |  10 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c        |   8 +-
 drivers/gpu/drm/gma500/psb_intel_display.c    |   2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  20 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  36 +--
 drivers/gpu/drm/gma500/psb_irq.c              |   6 +-
 drivers/gpu/drm/gud/gud_connector.c           |  22 +-
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  10 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  33 ++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |   4 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |   6 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |   2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |  14 +-
 drivers/gpu/drm/i2c/ch7006_drv.c              |  12 +-
 drivers/gpu/drm/i2c/tda998x_drv.c             |   4 +-
 drivers/gpu/drm/i915/display/g4x_dp.c         |  36 +--
 drivers/gpu/drm/i915/display/g4x_hdmi.c       |  28 +-
 drivers/gpu/drm/i915/display/hsw_ips.c        |  22 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  42 +--
 drivers/gpu/drm/i915/display/i9xx_wm.c        |  50 ++--
 drivers/gpu/drm/i915/display/icl_dsi.c        |  77 +++---
 drivers/gpu/drm/i915/display/intel_atomic.c   |   6 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |  28 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  36 +--
 .../gpu/drm/i915/display/intel_backlight.c    | 112 ++++----
 drivers/gpu/drm/i915/display/intel_bios.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  22 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  28 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_color.c    | 126 ++++-----
 .../gpu/drm/i915/display/intel_connector.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  38 +--
 drivers/gpu/drm/i915/display/intel_crtc.c     |  20 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |   6 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |  28 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  30 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 240 ++++++++--------
 .../drm/i915/display/intel_ddi_buf_trans.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 226 +++++++--------
 drivers/gpu/drm/i915/display/intel_display.h  |  16 +-
 .../drm/i915/display/intel_display_debugfs.c  |  18 +-
 .../gpu/drm/i915/display/intel_display_irq.c  |  22 +-
 .../i915/display/intel_display_power_well.c   |   2 +-
 .../gpu/drm/i915/display/intel_display_rps.c  |   2 +-
 .../drm/i915/display/intel_display_trace.h    |  12 +-
 .../drm/i915/display/intel_display_types.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  98 +++----
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |  10 +-
 .../drm/i915/display/intel_dp_aux_backlight.c |  12 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  32 +--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  40 +--
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |  26 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     |  58 ++--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  69 ++---
 drivers/gpu/drm/i915/display/intel_dpt.c      |   4 +-
 drivers/gpu/drm/i915/display/intel_drrs.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_dsb.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_dsi.c      |   6 +-
 .../i915/display/intel_dsi_dcs_backlight.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  32 +--
 drivers/gpu/drm/i915/display/intel_dvo.c      |  18 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  54 ++--
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  30 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |  24 +-
 .../drm/i915/display/intel_fifo_underrun.c    |   6 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  |  18 +-
 .../gpu/drm/i915/display/intel_global_state.c |  12 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  94 +++----
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 146 +++++-----
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   4 +-
 .../gpu/drm/i915/display/intel_hotplug_irq.c  |  34 +--
 .../gpu/drm/i915/display/intel_load_detect.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |  18 +-
 .../drm/i915/display/intel_modeset_setup.c    |  28 +-
 .../drm/i915/display/intel_modeset_verify.c   |   7 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   4 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  26 +-
 .../gpu/drm/i915/display/intel_pch_display.c  |  32 +--
 .../gpu/drm/i915/display/intel_pch_refclk.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  10 +-
 .../drm/i915/display/intel_plane_initial.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |  14 +-
 drivers/gpu/drm/i915/display/intel_pps.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  38 +--
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  60 ++--
 drivers/gpu/drm/i915/display/intel_snps_phy.c |  12 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  48 ++--
 .../gpu/drm/i915/display/intel_sprite_uapi.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |  30 +-
 drivers/gpu/drm/i915/display/intel_tv.c       |  24 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   |  24 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  18 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      |  20 +-
 drivers/gpu/drm/i915/display/intel_wm.c       |  12 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |  14 +-
 .../drm/i915/display/skl_universal_plane.c    |  60 ++--
 drivers/gpu/drm/i915/display/skl_watermark.c  |  84 +++---
 drivers/gpu/drm/i915/display/skl_watermark.h  |   4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  52 ++--
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c    |  26 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  26 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  12 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |   8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  24 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  10 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   4 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |   2 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |   4 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   4 +-
 .../drm/i915/gem/selftests/i915_gem_migrate.c |   2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   8 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |   2 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c         |   2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   6 +-
 drivers/gpu/drm/i915/i915_gem.c               |  12 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   6 +-
 drivers/gpu/drm/i915/i915_sysfs.c             |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |  10 +-
 drivers/gpu/drm/imx/dcss/dcss-crtc.c          |  20 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |   8 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |   2 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   2 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c        |  14 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c       |  12 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   4 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  19 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  16 +-
 drivers/gpu/drm/kmb/kmb_crtc.c                |  16 +-
 drivers/gpu/drm/kmb/kmb_plane.c               |   8 +-
 drivers/gpu/drm/lima/lima_gem.c               |   4 +-
 drivers/gpu/drm/logicvc/logicvc_crtc.c        |  14 +-
 drivers/gpu/drm/logicvc/logicvc_interface.c   |   2 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c       |   6 +-
 drivers/gpu/drm/loongson/lsdc_crtc.c          |  12 +-
 drivers/gpu/drm/loongson/lsdc_debugfs.c       |   4 +-
 drivers/gpu/drm/loongson/lsdc_gem.c           |  14 +-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |   4 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  22 +-
 drivers/gpu/drm/loongson/lsdc_plane.c         |  32 +--
 drivers/gpu/drm/loongson/lsdc_ttm.c           |   6 +-
 drivers/gpu/drm/mcde/mcde_display.c           |  18 +-
 drivers/gpu/drm/mcde/mcde_dsi.c               |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c             |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  22 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   6 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   4 +-
 drivers/gpu/drm/meson/meson_crtc.c            |  12 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c         |   2 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c        |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c      |   2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c      |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c      |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c      |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c      |   2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |  20 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  68 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  28 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  12 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |   2 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  |   4 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  10 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   6 +-
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |  13 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  20 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c    |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c     |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   4 +-
 drivers/gpu/drm/msm/dp/dp_debug.c             |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c               |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |   6 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   2 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |  14 +-
 drivers/gpu/drm/msm/msm_drv.c                 |   6 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   2 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |   8 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  42 +--
 drivers/gpu/drm/msm/msm_gem_prime.c           |   2 +-
 drivers/gpu/drm/msm/msm_perf.c                |   4 +-
 drivers/gpu/drm/msm/msm_rd.c                  |   4 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             |  22 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  24 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  57 ++--
 drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  10 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c        |  26 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  24 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  10 +-
 .../gpu/drm/nouveau/dispnv04/tvmodesnv17.c    |   6 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |  10 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  28 +-
 drivers/gpu/drm/nouveau/dispnv50/atom.h       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |  32 +--
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  84 +++---
 drivers/gpu/drm/nouveau/dispnv50/head.c       |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  26 +-
 drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +-
 drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  10 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  18 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  22 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  44 +--
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   8 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   4 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c          |   4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c       |   2 +-
 drivers/gpu/drm/omapdrm/dss/venc.c            |   2 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c           |  56 ++--
 drivers/gpu/drm/omapdrm/omap_debugfs.c        |   6 +-
 drivers/gpu/drm/omapdrm/omap_drv.c            |   4 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c        |   2 +-
 drivers/gpu/drm/omapdrm/omap_fb.c             |  12 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |   8 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  43 +--
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   4 +-
 drivers/gpu/drm/omapdrm/omap_irq.c            |   6 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c        |   4 +-
 drivers/gpu/drm/omapdrm/omap_plane.c          |  19 +-
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
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   6 +-
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
 drivers/gpu/drm/panfrost/panfrost_gem.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |   4 +-
 drivers/gpu/drm/pl111/pl111_debugfs.c         |   2 +-
 drivers/gpu/drm/pl111/pl111_display.c         |  16 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             |   6 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  31 ++-
 drivers/gpu/drm/qxl/qxl_gem.c                 |   2 +-
 drivers/gpu/drm/qxl/qxl_object.c              |   4 +-
 drivers/gpu/drm/qxl/qxl_object.h              |   2 +-
 drivers/gpu/drm/qxl/qxl_release.c             |   2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 |   2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        |  54 ++--
 drivers/gpu/drm/radeon/atombios_dp.c          |  10 +-
 drivers/gpu/drm/radeon/atombios_encoders.c    |  58 ++--
 drivers/gpu/drm/radeon/cik.c                  |   2 +-
 drivers/gpu/drm/radeon/dce3_1_afmt.c          |  12 +-
 drivers/gpu/drm/radeon/dce6_afmt.c            |  10 +-
 drivers/gpu/drm/radeon/evergreen.c            |   2 +-
 drivers/gpu/drm/radeon/evergreen_hdmi.c       |  22 +-
 drivers/gpu/drm/radeon/r600.c                 |   2 +-
 drivers/gpu/drm/radeon/r600_hdmi.c            |  18 +-
 drivers/gpu/drm/radeon/radeon_atombios.c      |  16 +-
 drivers/gpu/drm/radeon/radeon_audio.c         |  10 +-
 drivers/gpu/drm/radeon/radeon_combios.c       |  24 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |  78 +++---
 drivers/gpu/drm/radeon/radeon_cursor.c        |  13 +-
 drivers/gpu/drm/radeon/radeon_display.c       |  28 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c      |  16 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |  14 +-
 drivers/gpu/drm/radeon/radeon_kms.c           |   6 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  16 +-
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |  66 ++---
 drivers/gpu/drm/radeon/radeon_legacy_tv.c     |  12 +-
 drivers/gpu/drm/radeon/radeon_prime.c         |   2 +-
 drivers/gpu/drm/radeon/rs600.c                |   2 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.c    |  14 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |   2 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_plane.c   |   2 +-
 .../drm/renesas/rcar-du/rcar_du_writeback.c   |   4 +-
 .../renesas/shmobile/shmob_drm_backlight.c    |   8 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  28 +-
 .../drm/renesas/shmobile/shmob_drm_plane.c    |   6 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          |   2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  23 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  |  15 +-
 drivers/gpu/drm/solomon/ssd130x.c             |  16 +-
 drivers/gpu/drm/sprd/sprd_dpu.c               |   6 +-
 drivers/gpu/drm/sti/sti_crtc.c                |  14 +-
 drivers/gpu/drm/sti/sti_cursor.c              |   2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |   4 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |   2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c               |   2 +-
 drivers/gpu/drm/sti/sti_tvout.c               |   2 +-
 drivers/gpu/drm/stm/ltdc.c                    |  22 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c         |   2 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c            |  12 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   6 +-
 drivers/gpu/drm/tegra/dc.c                    |  14 +-
 drivers/gpu/drm/tegra/dpaux.c                 |   4 +-
 drivers/gpu/drm/tegra/drm.c                   |   6 +-
 drivers/gpu/drm/tegra/dsi.c                   |  14 +-
 drivers/gpu/drm/tegra/fbdev.c                 |   8 +-
 drivers/gpu/drm/tegra/gem.c                   |  21 +-
 drivers/gpu/drm/tegra/hdmi.c                  |   6 +-
 drivers/gpu/drm/tegra/output.c                |   4 +-
 drivers/gpu/drm/tegra/plane.c                 |   6 +-
 drivers/gpu/drm/tegra/sor.c                   |   8 +-
 .../gpu/drm/tests/drm_client_modeset_test.c   |   4 +-
 .../gpu/drm/tests/drm_damage_helper_test.c    |   4 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |  18 +-
 drivers/gpu/drm/tidss/tidss_irq.c             |   4 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |   8 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  42 +--
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c         |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c         |   8 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |   2 +-
 drivers/gpu/drm/tiny/bochs.c                  |   6 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
 drivers/gpu/drm/tiny/gm12u320.c               |   6 +-
 drivers/gpu/drm/tiny/hx8357d.c                |   4 +-
 drivers/gpu/drm/tiny/ili9163.c                |   4 +-
 drivers/gpu/drm/tiny/ili9225.c                |  15 +-
 drivers/gpu/drm/tiny/ili9341.c                |   4 +-
 drivers/gpu/drm/tiny/ili9486.c                |   4 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   4 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |  14 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   6 +-
 drivers/gpu/drm/tiny/repaper.c                |  14 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   8 +-
 drivers/gpu/drm/tiny/st7586.c                 |  13 +-
 drivers/gpu/drm/tiny/st7735r.c                |   4 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |   2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |   4 +-
 drivers/gpu/drm/tve200/tve200_display.c       |  14 +-
 drivers/gpu/drm/udl/udl_modeset.c             |  10 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |   4 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c             |  11 +-
 drivers/gpu/drm/v3d/v3d_mmu.c                 |   4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  18 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c   |   4 +-
 .../gpu/drm/vc4/tests/vc4_test_pv_muxing.c    |   2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                  |  24 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                |  38 +--
 drivers/gpu/drm/vc4/vc4_debugfs.c             |   4 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                 |   8 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  80 +++---
 drivers/gpu/drm/vc4/vc4_hvs.c                 |  18 +-
 drivers/gpu/drm/vc4/vc4_kms.c                 |  14 +-
 drivers/gpu/drm/vc4/vc4_plane.c               |  14 +-
 drivers/gpu/drm/vc4/vc4_txp.c                 |  10 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |   4 +-
 drivers/gpu/drm/vc4/vc4_validate.c            |   2 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c    |   2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                 |   6 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c      |   6 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |   6 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |   6 +-
 drivers/gpu/drm/virtio/virtgpu_object.c       |   4 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  10 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c        |   6 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c         |   8 +-
 drivers/gpu/drm/vkms/vkms_crtc.c              |  12 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |   4 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  10 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |   4 +-
 drivers/gpu/drm/xen/xen_drm_front_conn.c      |   4 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c       |  14 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  12 +-
 drivers/media/cec/core/cec-adap.c             |   2 +-
 include/drm/display/drm_dp_mst_helper.h       |   4 +-
 include/drm/drm_atomic.h                      |  20 +-
 include/drm/drm_atomic_helper.h               |   6 +-
 include/drm/drm_auth.h                        |   4 +-
 include/drm/drm_bridge.h                      |   4 +-
 include/drm/drm_client.h                      |   4 +-
 include/drm/drm_connector.h                   |   6 +-
 include/drm/drm_crtc.h                        |   4 +-
 include/drm/drm_debugfs.h                     |   4 +-
 include/drm/drm_encoder.h                     |   4 +-
 include/drm/drm_fb_helper.h                   |  10 +-
 include/drm/drm_file.h                        |   2 +-
 include/drm/drm_framebuffer.h                 |   4 +-
 include/drm/drm_gem.h                         |   4 +-
 include/drm/drm_plane.h                       |   4 +-
 include/drm/drm_property.h                    |   8 +-
 include/drm/drm_vblank.h                      |   4 +-
 651 files changed, 4642 insertions(+), 4493 deletions(-)

base-commit: ca6c1e210aa7d7629900a62f28b5090724054854
-- 
2.39.2

