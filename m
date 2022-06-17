Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB754F1C6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B9E11A9BB;
	Fri, 17 Jun 2022 07:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4150211A9BB;
 Fri, 17 Jun 2022 07:21:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42FF21FB54;
 Fri, 17 Jun 2022 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655450506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5VjyZamT3mfgRpvhaob279Y0Knuy8GYUIntNcgnORuU=;
 b=GNwvZMUuvMcdqzworG2bVKJicu8K2/6s6HK1M34iSgG4IaOF0JG6pefhb5mTFJM+nM4Ejo
 eyYgP9/SFkkUNR3fxYpGIZYkERb8JRqesLNb8bwxxpFY6gfTwJ9IcLpmkqqvSgicgOEYZw
 iDHPSdtqCKECJIev5DeZAKorUgJCFsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655450506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5VjyZamT3mfgRpvhaob279Y0Knuy8GYUIntNcgnORuU=;
 b=vYVJJvmaJd13nR40fZd5XqHAa8qxSlbx+GZnIWOXNkaELBXTA/ZxyfiJxqqFVGUcZBO2Ft
 xU+XdAftkNrqQeAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F289613458;
 Fri, 17 Jun 2022 07:21:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n68vOokrrGJTeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jun 2022 07:21:45 +0000
Date: Fri, 17 Jun 2022 09:21:44 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YqwriEhn0l4uO+Gn@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the PR for drm-misc-next. AFAICT it contains mostly fixes and
cleanups. There's is one new driver for the LogiCVC display controller.

Best regards
Thomas

drm-misc-next-2022-06-17:
drm-misc-next for v5.20:

UAPI Changes:

Cross-subsystem Changes:

 * dma-buf: Add sync-file API; Set DMA mask for udmabuf devices

 * fbcon: Cleanups

 * fbdev: Disable firmware-device registration when first native driver loads

 * iosys-map: Documentation fixes

Core Changes:

 * edid: Use struct drm_edid in more places

 * gem-cma-helper: Improve documentation

 * of: Add data-lane helpers and convert drivers

 * syncobj: Fixes

Driver Changes:

 * amdgpu: Build fixes

 * ast: Support multiple outputs

 * bochs: Include <linux/module.h>

 * bridge: adv7511: I2C fixes; anx7625: Fix error handling; lt6505: Kconfig fixes

 * display/dp: Documentation fixes

 * display/dp-mst: Read extended DPCD capabilities during system resume

 * logicvc: Add new driver

 * magag200: Build fixes

 * nouveau: Cleanups

 * panel: Add backlight support; nt36672a: DT backlight support

 * qxl: Cleanups

 * sun4i: HDMI PHY cleanups

 * vc4: Add support for BCM2711

 * virt-gpu: Avoid NULL dereference; Fix error checks; Cleanups

 * vkms: Allocate output buffer with vmalloc(); Fixes
The following changes since commit dfa687bffc8a4a21ed929c7dececf01b8f1f52ee:

  drm/bridge: lt9611uxc: Cancel only driver's work (2022-06-07 14:57:47 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-06-17

for you to fetch changes up to e4a8864f74e9e9e4a7eb93952a4cfa35c165c930:

  iosys-map: Fix typo in documentation (2022-06-16 16:44:34 -0700)

----------------------------------------------------------------
drm-misc-next for v5.20:

UAPI Changes:

Cross-subsystem Changes:

 * dma-buf: Add sync-file API; Set DMA mask for udmabuf devices

 * fbcon: Cleanups

 * fbdev: Disable firmware-device registration when first native driver loads

 * iosys-map: Documentation fixes

Core Changes:

 * edid: Use struct drm_edid in more places

 * gem-cma-helper: Improve documentation

 * of: Add data-lane helpers and convert drivers

 * syncobj: Fixes

Driver Changes:

 * amdgpu: Build fixes

 * ast: Support multiple outputs

 * bochs: Include <linux/module.h>

 * bridge: adv7511: I2C fixes; anx7625: Fix error handling; lt6505: Kconfig fixes

 * display/dp: Documentation fixes

 * display/dp-mst: Read extended DPCD capabilities during system resume

 * logicvc: Add new driver

 * magag200: Build fixes

 * nouveau: Cleanups

 * panel: Add backlight support; nt36672a: DT backlight support

 * qxl: Cleanups

 * sun4i: HDMI PHY cleanups

 * vc4: Add support for BCM2711

 * virt-gpu: Avoid NULL dereference; Fix error checks; Cleanups

 * vkms: Allocate output buffer with vmalloc(); Fixes

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/display: fix build when CONFIG_DEBUG_FS is not set

Antonio Borneo (1):
      drm: adv7511: override i2c address of cec before accessing it

Christophe Leroy (1):
      drm/nouveau/bios: Rename prom_init() and friends functions

Daniel Thompson (1):
      drm/cma-helper: Describe what a "contiguous chunk" actually means

Daniel Vetter (1):
      Revert "fbdev: Prevent probing generic drivers if a FB is already registered"

Douglas Anderson (1):
      drm: Fix htmldocs indentation warning w/ DP AUX power requirements

Geert Uytterhoeven (1):
      fbcon: Remove obsolete reference to initmem_freed

Igor Torrente (1):
      drm: vkms: Alloc the compose frame using vzalloc

Imre Deak (1):
      drm/dp/mst: Read the extended DPCD capabilities during system resume

Jani Nikula (6):
      drm/edid: fix CTA data block collection size for CTA version 3
      drm/edid: abstract cea data block collection size
      drm/edid: add block count and data helper functions for drm_edid
      drm/edid: keep track of alloc size in drm_do_get_edid()
      drm/edid: add new interfaces around struct drm_edid
      drm/probe-helper: abstract .get_modes() connector helper call

Jason Ekstrand (2):
      dma-buf: Add an API for exporting sync files (v14)
      dma-buf: Add an API for importing sync files (v10)

Javier Martinez Canillas (4):
      firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
      firmware: sysfb: Add sysfb_disable() helper function
      fbdev: Disable sysfb device registration when removing conflicting FBs
      Revert "fbdev: vesafb: Allow to be built if COMPILE_TEST is enabled"

Joel Selvaraj (2):
      drm/panel: nt36672a: add backlight support
      dt-bindings: display: novatek, nt36672a: add backlight property

Lucas De Marchi (1):
      iosys-map: Fix typo in documentation

Marek Vasut (16):
      drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep
      drm/bridge: anx7625: Convert to drm_of_get_data_lanes_count
      drm/bridge: icn6211: Convert to drm_of_get_data_lanes_count_ep
      drm/bridge: lt8912: Convert to drm_of_get_data_lanes_count_ep
      drm/bridge: lt9211: Convert to drm_of_get_data_lanes_count
      drm/bridge: tc358767: Convert to drm_of_get_data_lanes_count
      drm/bridge: tc358775: Convert to drm_of_get_data_lanes_count_ep
      drm/bridge: ti-sn65dsi86: Convert to drm_of_get_data_lanes_count
      drm/msm: Convert to drm_of_get_data_lanes_count
      drm/bridge: rcar: Convert to drm_of_get_data_lanes_count_ep
      drm/bridge: ti-sn65dsi83: Do not cache dsi_lanes and host twice
      drm/bridge: ti-sn65dsi83: Convert to drm_of_get_data_lanes_count
      drm: of: Mark empty drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep static
      drm/bridge: tc358775: Fix drm_of_get_data_lanes_count_ep conversion
      drm/bridge: rcar: Drop unused variables due to drm_of_get_data_lanes_count_ep
      drm/msm: Fix convert to drm_of_get_data_lanes_count

Miaoqian Lin (1):
      drm/virtio: Fix NULL vs IS_ERR checking in virtio_gpu_object_shmem_init

Michel Dänzer (1):
      drm/bochs: Explicitly include linux/module.h

Minghao Chi (1):
      drm/virtio: simplify the return expression

Nícolas F. R. A. Prado (1):
      drm/bridge: anx7625: Zero error variable when panel bridge not present

Paul Kocialkowski (1):
      drm: Add support for the LogiCVC display controller

Peter Robinson (3):
      dt-bindings: gpu: v3d: Add BCM2711's compatible
      drm/v3d: Get rid of pm code
      drm/v3d: Add support for bcm2711

Samuel Holland (6):
      drm/sun4i: sun8i-hdmi-phy: Use of_device_get_match_data
      drm/sun4i: sun8i-hdmi-phy: Use devm_platform_ioremap_resource
      drm/sun4i: sun8i-hdmi-phy: Used device-managed clocks/resets
      drm/sun4i: sun8i-hdmi-phy: Support multiple custom PHY ops
      drm/sun4i: sun8i-hdmi-phy: Separate A83T and H3 PHY ops
      drm/sun4i: sun8i-hdmi-phy: Group PHY ops functions by generation

Tales Lelo da Aparecida (1):
      drm/vkms: check plane_composer->map[0] before using it

Thomas Zimmermann (2):
      drm/ast: Support multiple outputs
      drm/mgag200: Include <linux/vmalloc.h> for G200 BIOS code

Tom Rix (1):
      drm/qxl: remove qxl_log_level global

Vivek Kasireddy (1):
      udmabuf: Set the DMA mask for the udmabuf device (v2)

Xiaomeng Tong (1):
      virtio-gpu: fix a missing check to avoid NULL dereference

Yang Yingliang (1):
      drm/syncobj: add missing error return code in drm_syncobj_transfer_to_timeline()

Zheng Bin (1):
      drm/bridge: it6505: Add missing CRYPTO_HASH dependency

pengfuyuan (1):
      drm/nouveau: Fix spelling typo in comments

 .../bindings/display/panel/novatek,nt36672a.yaml   |   2 +
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |   1 +
 .../driver-api/firmware/other_interfaces.rst       |   6 +
 Documentation/gpu/vkms.rst                         |   6 -
 MAINTAINERS                                        |   6 +
 drivers/dma-buf/dma-buf.c                          | 106 ++++
 drivers/dma-buf/udmabuf.c                          |  18 +-
 drivers/firmware/sysfb.c                           |  58 +-
 drivers/firmware/sysfb_simplefb.c                  |  16 +-
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +
 drivers/gpu/drm/ast/ast_dp.c                       |   5 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |   2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   9 +-
 drivers/gpu/drm/ast/ast_main.c                     |  21 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  38 +-
 drivers/gpu/drm/ast/ast_post.c                     |   2 +-
 drivers/gpu/drm/bridge/Kconfig                     |   2 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   7 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  12 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  11 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   9 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   6 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   8 +-
 drivers/gpu/drm/bridge/tc358775.c                  |  21 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  64 +--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   4 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   7 +-
 drivers/gpu/drm/drm_edid.c                         | 340 +++++++++--
 drivers/gpu/drm/drm_gem_cma_helper.c               |  39 +-
 drivers/gpu/drm/drm_of.c                           |  61 ++
 drivers/gpu/drm/drm_probe_helper.c                 |  29 +-
 drivers/gpu/drm/drm_syncobj.c                      |   4 +-
 drivers/gpu/drm/logicvc/Kconfig                    |   9 +
 drivers/gpu/drm/logicvc/Makefile                   |   9 +
 drivers/gpu/drm/logicvc/logicvc_crtc.c             | 280 +++++++++
 drivers/gpu/drm/logicvc/logicvc_crtc.h             |  21 +
 drivers/gpu/drm/logicvc/logicvc_drm.c              | 497 ++++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_drm.h              |  67 +++
 drivers/gpu/drm/logicvc/logicvc_interface.c        | 214 +++++++
 drivers/gpu/drm/logicvc/logicvc_interface.h        |  28 +
 drivers/gpu/drm/logicvc/logicvc_layer.c            | 628 +++++++++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_layer.h            |  64 +++
 drivers/gpu/drm/logicvc/logicvc_mode.c             |  80 +++
 drivers/gpu/drm/logicvc/logicvc_mode.h             |  15 +
 drivers/gpu/drm/logicvc/logicvc_of.c               | 185 ++++++
 drivers/gpu/drm/logicvc/logicvc_of.h               |  46 ++
 drivers/gpu/drm/logicvc/logicvc_regs.h             |  80 +++
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   1 -
 drivers/gpu/drm/mgag200/mgag200_g200.c             |   1 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  10 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   9 +-
 drivers/gpu/drm/nouveau/include/nvhw/drf.h         |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c  |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c   |  14 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |   4 +
 drivers/gpu/drm/qxl/qxl_kms.c                      |   2 -
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            |  15 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |   9 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             | 242 ++++----
 drivers/gpu/drm/tiny/bochs.c                       |   1 +
 drivers/gpu/drm/v3d/Kconfig                        |   5 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |  18 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |  12 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  12 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   6 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   4 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   6 +-
 drivers/gpu/drm/vkms/vkms_composer.c               |   8 +-
 drivers/video/fbdev/Kconfig                        |   2 +-
 drivers/video/fbdev/core/fbcon.c                   |   1 -
 drivers/video/fbdev/core/fbmem.c                   |  12 +
 drivers/video/fbdev/efifb.c                        |  11 -
 drivers/video/fbdev/simplefb.c                     |  11 -
 include/drm/display/drm_dp_helper.h                |   2 +
 include/drm/drm_edid.h                             |   9 +
 include/drm/drm_of.h                               |  22 +
 include/linux/iosys-map.h                          |   2 +-
 include/linux/sysfb.h                              |  22 +-
 include/uapi/linux/dma-buf.h                       |  84 +++
 82 files changed, 3222 insertions(+), 493 deletions(-)
 create mode 100644 drivers/gpu/drm/logicvc/Kconfig
 create mode 100644 drivers/gpu/drm/logicvc/Makefile
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
