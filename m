Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7143751C04C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6482110FDDC;
	Thu,  5 May 2022 13:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D70C10FDDC;
 Thu,  5 May 2022 13:11:34 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F2E05C005D;
 Thu,  5 May 2022 09:11:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 05 May 2022 09:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1651756291; x=1651842691; bh=llaYhTGM3DCdcm0lOppuNn3yZpJ1tYRnKr1
 knoZwHcE=; b=uVUor0CH5oNzabOz+p8W4BfYHKYPB6EDnuokU+5AbmZAuPlT4a8
 9VqXHkf9WKBzIDzMcfNEdzOZIhb5+/NMC/m24uLQIV5daWHVQIuqX2EULOmWY9CW
 akaDtvjAWnpWeRBufEKiWxW50o0ITXqNQFum3rw05RDA96vrxlTtxVZFyd9KHoBx
 6vis76zCmWcIKFd5S6/Yitqe1EaMmRUnz56pbGdP+pJ3laFI0+/7+Z6MiEujaJnf
 b12iFNxp73OiaynvxE/ygUOCtFy0uwmMZbX+2FyIkdbeb2dQ7C9ztCXskjmCr7hw
 zdp7XPn5oxtoF6r5u9h7M4e8pHHkVf3Wsjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651756291; x=1651842691; bh=llaYhTGM3DCdc
 m0lOppuNn3yZpJ1tYRnKr1knoZwHcE=; b=G6UkhVukL5wNty0XwZlF/uSnO2m/s
 ZX6DKYkDazoSar9EbgzJxfq9ajeBcq/9k9+R2/y2eusrtFsUNzUzFV3MolV0PwyA
 Evl2UPVv8roxsuHlek0WjEZiNo2YBN2uJJEamY4MSQ8McNyN6tHAbE5R9FJsS2Q1
 7Yz/9c/Kye0r76Xo0xaV5cXzO+1J6cnxXDZJdEMwzUFWT3WEscsf6MV7IEXf5DHo
 +17CTDaz4I4t8avg9h3kh6dieIwjgBZJXq7AKp5LECFHMreXDyqixKvZF6ahKDSf
 w2RVza8E3Btmbgkw+CHxe24O2YKmATL+XJAxsWrbsbTzopuASXTfcaW7A==
X-ME-Sender: <xms:As1zYuTgzz6Jx0A0AKjrGeha4no-DaSe8XVV9icV9kzJ5ViivbtwRA>
 <xme:As1zYjy1tdRveMf7KOsq3H-N2M6bhqxJcTHlXQG-k5Jo6HMEqTQhhzCNW_8rSt1J4
 z_d6lrE8BIPLzLqYgI>
X-ME-Received: <xmr:As1zYr1q4uRfrxqO1TAD8zTV9n46vUl3NBWuyqWKD4d4SHYOLwTRikRkkpHbILYzA4WRn0nsQj2e2IiAJGbzMIWJBP9F0R_qaoRZNKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteelteeghefhudefkefffedugfdtheektdefgffhffefleekieffhfefhfeghfej
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:As1zYqCsbHFgtkUu8HGpeqo87rx076MW6jnoITzbdzHvSHnvqDFSlQ>
 <xmx:As1zYngEIQ61T5aHD82XvcLTIhaU9A_rf047jChE7IkNAgvCGHlwDw>
 <xmx:As1zYmpTmV2EsvN1Cioyafb0AlRjkDtbspzDVTFv8vZKk-90hPDl3Q>
 <xmx:A81zYsakMW_K-1MFrT0Y5HSSfACahg4LSufMVVxvlTLZSxRda_Za0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 May 2022 09:11:30 -0400 (EDT)
Date: Thu, 5 May 2022 15:11:27 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20220505131127.lcqvsywo7qt3eywk@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tsbvthtu7zel5imm"
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tsbvthtu7zel5imm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2022-05-05:
drm-misc-next for 5.19:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - Add DRM-managed mutex initialisation
  - edid: Doc improvements
  - fbdev: deferred io improvements
  - format-helper: consolidate format conversion helpers
  - gem: Rework fence handling in drm_gem_plane_helper_prepare_fb

Driver Changes:
  - ast: DisplayPort support, locking improvements
  - exynos: Revert conversion to devm_drm_of_get_bridge for DSI
  - mgag200: locking improvements
  - mxsfb: LCDIF CRC support
  - nouveau: switch to drm_gem_plane_helper_prepare_fb
  - rockchip: Refactor IOMMU initialisation, make some structures
              static, replace drm_detect_hdmi_monitor with
              drm_display_info.is_hdmi, support swapped YUV formats,
              clock improvements, rk3568 support, VOP2 support
  - bridge:
    - adv7511: Enable CEC for ADV7535
    - it6505: Send DPCD SET_POWER to monitor at disable
    - mcde_dsi: Revert conversion to devm_drm_of_get_bridge
    - tc358767: Fix for eDP and DP DT endpoint parsing
    - new bridge: i.MX8MP LDB
  - panel:
    - new panel: Startek KD070WVFPA043-C069A
The following changes since commit e954d2c94d007afe487044ecfa48f2518643df0e:

  Backmerge tag 'v5.18-rc5' of git://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux into drm-next (2022-05-03 16:08:48 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-05-05

for you to fetch changes up to 6071c4c2a319da360b0bf2bc397d4fefad10b2c8:

  drm/qxl: add drm_gem_plane_helper_prepare_fb (2022-05-05 12:30:10 +0200)

----------------------------------------------------------------
drm-misc-next for 5.19:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - Add DRM-managed mutex initialisation
  - edid: Doc improvements
  - fbdev: deferred io improvements
  - format-helper: consolidate format conversion helpers
  - gem: Rework fence handling in drm_gem_plane_helper_prepare_fb

Driver Changes:
  - ast: DisplayPort support, locking improvements
  - exynos: Revert conversion to devm_drm_of_get_bridge for DSI
  - mgag200: locking improvements
  - mxsfb: LCDIF CRC support
  - nouveau: switch to drm_gem_plane_helper_prepare_fb
  - rockchip: Refactor IOMMU initialisation, make some structures
              static, replace drm_detect_hdmi_monitor with
              drm_display_info.is_hdmi, support swapped YUV formats,
              clock improvements, rk3568 support, VOP2 support
  - bridge:
    - adv7511: Enable CEC for ADV7535
    - it6505: Send DPCD SET_POWER to monitor at disable
    - mcde_dsi: Revert conversion to devm_drm_of_get_bridge
    - tc358767: Fix for eDP and DP DT endpoint parsing
    - new bridge: i.MX8MP LDB
  - panel:
    - new panel: Startek KD070WVFPA043-C069A

----------------------------------------------------------------
Alvin =C5=A0ipraga (2):
      drm: bridge: adv7511: enable CEC support for ADV7535
      drm: bridge: adv7511: use non-legacy mode for CEC RX

Andy Yan (1):
      drm/rockchip: Add VOP2 driver

Benjamin Gaignard (1):
      dt-bindings: display: rockchip: dw-hdmi: Add compatible for rk3568 HD=
MI

Chen-Yu Tsai (1):
      drm/rockchip: Support YUV formats with U/V swapped

Christian K=C3=B6nig (5):
      drm: handle kernel fences in drm_gem_plane_helper_prepare_fb v2
      drm/nouveau: use drm_gem_plane_helper_prepare_fb
      dma-buf/sync_file: cleanup fence merging a bit
      drm/nouveau: remove trace_dma_fence_emit
      drm/qxl: add drm_gem_plane_helper_prepare_fb

Dan Carpenter (1):
      drm/sun4i: dsi: delete unnecessary IS_ERR() checks

Fabio Estevam (1):
      dt-bindings: display: simple: Add Startek KD070WVFPA043-C069A panel

Guo Zhengkui (1):
      drm/nouveau/devinit: fix returnvar.cocci warnings

Heiko Schocher (1):
      drm/panel: simple: Add Startek KD070WVFPA043-C069A panel support

Jagan Teki (4):
      drm/panel: panel-simple: Fix proper bpc for AM-1280800N3TZQW-T00H
      Revert "drm: bridge: mcde_dsi: Drop explicit bridge remove"
      Revert "drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge"
      drm: exynos: dsi: Use child panel or bridge find helpers

Jani Nikula (2):
      drm/edid: fix kernel-doc parameter name mismatches
      drm/edid: drop kernel-doc for static functions

Javier Martinez Canillas (2):
      drm/display: Select DP helper for DRM_DP_AUX_CHARDEV and DRM_DP_CEC
      drm/todo: Add entry for using kunit in the subsystem

Jos=C3=A9 Exp=C3=B3sito (2):
      drm/rockchip: inno_hdmi: Replace drm_detect_hdmi_monitor() with is_hd=
mi
      drm/rockchip: rk3066_hdmi: Replace drm_detect_hdmi_monitor() with is_=
hdmi

KuoHsiang Chou (1):
      drm/ast: Create the driver for ASPEED proprietory Display-Port

Lucas Stach (1):
      drm/etnaviv: avoid cleaning up sched_job when submit succeeded

Lyude Paul (1):
      drm/nouveau/subdev/bus: Ratelimit logging for fault errors

Marek Vasut (5):
      drm/bridge: tc358767: Fix (e)DP bridge endpoint parsing in dedicated =
function
      dt-bindings: display: bridge: ldb: Implement simple Freescale i.MX8MP=
 LDB bridge
      drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge
      drm: mxsfb: Implement LCDIF scanout CRC32 support
      drm/bridge: tc358767: Fix DP bridge mode detection from DT endpoints

Maxime Ripard (1):
      Merge drm/drm-next into drm-misc-next

Miaoqian Lin (1):
      malidp: Fix NULL vs IS_ERR() checking

Minghao Chi (4):
      drm/vc4: simplify the return expression of vc4_prepare_fb()
      drm/vc4: simplify the return expression of vc4_grab_bin_bo()
      drm/nouveau: simplify the return expression of nouveau_debugfs_init()
      drm: simplify the return expression of ast_drm_resume()

Pin-Yen Lin (1):
      drm/bridge: it6505: Send DPCD SET_POWER to downstream

Raphael Gallais-Pou (1):
      drm: fix typo in comment

Robin Murphy (1):
      drm/rockchip: Refactor IOMMU initialisation

Sascha Hauer (11):
      drm/rockchip: Embed drm_encoder into rockchip_decoder
      drm/rockchip: Add crtc_endpoint_id to rockchip_encoder
      drm/rockchip: dw_hdmi: rename vpll clock to reference clock
      dt-bindings: display: rockchip: dw-hdmi: use "ref" as clock name
      drm/rockchip: dw_hdmi: add rk3568 support
      dt-bindings: display: rockchip: dw-hdmi: Add regulator support
      drm/rockchip: dw_hdmi: add regulator support
      dt-bindings: display: rockchip: dw-hdmi: Make unwedge pinctrl optional
      dt-bindings: display: rockchip: Add binding for VOP2
      dt-bindings: display: rockchip: dw-hdmi: fix ports description
      drm/rockchip: Make VOP driver optional

Steven Price (1):
      drm/plane: Move range check for format_count earlier

Thomas Zimmermann (13):
      fbdev: Put mmap for deferred I/O into drivers
      fbdev: Track deferred-I/O pages in pageref struct
      fbdev: Refactor implementation of page_mkwrite
      fbdev: Rename pagelist to pagereflist for deferred I/O
      fbdev: Use pageref offset for deferred-I/O writeback
      drm/simpledrm: Use fbdev defaults for shadow buffering
      drm/format-helper: Implement drm_fb_swab() with per-line helpers
      drm/format-helper: Remove optional byte-swap from line convertion
      drm/format-helper: Unify the parameters of all per-line conversion he=
lpers
      drm/format-helper: Share implementation among conversion helpers
      drm: Add DRM-managed mutex_init()
      drm/ast: Protect concurrent access to I/O registers with lock
      drm/mgag200: Protect concurrent access to I/O registers with lock

Tom Rix (1):
      drm/rockchip: cdn-dp: change rk3399_cdn_dp from global to static

Uwe Kleine-K=C3=B6nig (1):
      drm/bridge: tfp410: Make tfp410_fini() return void

Wayne Lin (1):
      drm/dp_mst: Lower down debug info level when receive NAK

Yang Yingliang (1):
      drm/rockchip: vop: fix possible null-ptr-deref in vop_bind()

 .../bindings/display/bridge/fsl,ldb.yaml           |   92 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../display/rockchip/rockchip,dw-hdmi.yaml         |   46 +-
 .../bindings/display/rockchip/rockchip-vop2.yaml   |  140 +
 Documentation/gpu/todo.rst                         |   14 +
 drivers/dma-buf/sync_file.c                        |   21 +-
 drivers/gpu/drm/arm/malidp_planes.c                |    2 +-
 drivers/gpu/drm/ast/Makefile                       |    2 +-
 drivers/gpu/drm/ast/ast_dp.c                       |  282 ++
 drivers/gpu/drm/ast/ast_drv.c                      |    7 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  116 +
 drivers/gpu/drm/ast/ast_main.c                     |    9 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  174 +-
 drivers/gpu/drm/ast/ast_post.c                     |    4 +-
 drivers/gpu/drm/bridge/Kconfig                     |    8 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |   27 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |  116 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   19 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  342 +++
 drivers/gpu/drm/bridge/ite-it6505.c                |   29 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    8 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   12 +-
 drivers/gpu/drm/display/Kconfig                    |    6 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |    5 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   47 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |    2 +-
 drivers/gpu/drm/drm_edid.c                         |   65 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   15 +-
 drivers/gpu/drm/drm_format_helper.c                |  482 ++--
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   73 +-
 drivers/gpu/drm/drm_managed.c                      |   27 +
 drivers/gpu/drm/drm_plane.c                        |   14 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   10 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   12 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   43 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    6 +
 drivers/gpu/drm/mgag200/mgag200_drv.h              |    1 +
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   14 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   14 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                  |    3 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |   61 +-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h                 |    1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |    5 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |    2 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   12 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    |   14 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c  |    3 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c    |    3 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c    |    3 +-
 drivers/gpu/drm/panel/panel-simple.c               |   40 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |    8 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   14 +
 drivers/gpu/drm/rockchip/Makefile                  |    4 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   32 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   20 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |    2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   17 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  108 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   40 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   40 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   96 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   23 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |    2 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   24 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   15 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 2706 ++++++++++++++++=
++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |  477 ++++
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   26 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  281 ++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   11 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |    7 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    1 -
 drivers/gpu/drm/vc4/vc4_bo.c                       |    8 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |    7 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |   10 +-
 drivers/hid/hid-picolcd_fb.c                       |    3 +-
 drivers/staging/fbtft/fbtft-core.c                 |   21 +-
 drivers/video/fbdev/broadsheetfb.c                 |   27 +-
 drivers/video/fbdev/core/fb_defio.c                |  212 +-
 drivers/video/fbdev/core/fbmem.c                   |   22 +-
 drivers/video/fbdev/hecubafb.c                     |    4 +-
 drivers/video/fbdev/hyperv_fb.c                    |   10 +-
 drivers/video/fbdev/metronomefb.c                  |   23 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |   27 +-
 drivers/video/fbdev/smscufx.c                      |   13 +-
 drivers/video/fbdev/ssd1307fb.c                    |    4 +-
 drivers/video/fbdev/udlfb.c                        |   18 +-
 drivers/video/fbdev/xen-fbfront.c                  |   10 +-
 include/drm/drm_atomic_uapi.h                      |    2 -
 include/drm/drm_fb_helper.h                        |    3 +-
 include/drm/drm_managed.h                          |    3 +
 include/drm/drm_plane.h                            |    4 +-
 include/dt-bindings/soc/rockchip,vop2.h            |   14 +
 include/linux/fb.h                                 |   17 +-
 98 files changed, 6004 insertions(+), 881 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,ld=
b.yaml
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rock=
chip-vop2.yaml
 create mode 100644 drivers/gpu/drm/ast/ast_dp.c
 create mode 100644 drivers/gpu/drm/bridge/fsl-ldb.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
 create mode 100644 include/dt-bindings/soc/rockchip,vop2.h

--tsbvthtu7zel5imm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnPM/wAKCRDj7w1vZxhR
xavyAQDJwlS7NgA7UdNFrYTLn+8882Vrswp+PvG6ZPU9xdS1ugEA/Fi9XsYCZagN
ZVq591+j96p7SH28tvEcKlNUKd51Jg4=
=2jy1
-----END PGP SIGNATURE-----

--tsbvthtu7zel5imm--
