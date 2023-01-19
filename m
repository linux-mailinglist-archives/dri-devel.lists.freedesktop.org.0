Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A76733F9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 09:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E35510E8E2;
	Thu, 19 Jan 2023 08:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87A410E8E2;
 Thu, 19 Jan 2023 08:47:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A9CA380E8;
 Thu, 19 Jan 2023 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674118042; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fYysba7zFuZi24SNgafp2TtAtZlkJQ2IKNIN0rYerNE=;
 b=N7JxRJNtjL7He/JPBqrrC1tSAIc4VGJtXteKIhIrNw+HK+PnK+JAX7dF5XSG9NACTUJKJB
 aBqw9b/g9cg0zxE/87Kjpbn/JymJPd9C2VztcL5Apflo4gbEyfDvgd6MjWgSbt/B5qRUGj
 IwZtNHZSXEIhC61s3PdrlcCwX5ClXWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674118042;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fYysba7zFuZi24SNgafp2TtAtZlkJQ2IKNIN0rYerNE=;
 b=DlDa/LAMphwP6Rbk3hFwYMWq1uC3CAdEep0M5jcbsg2P812VkEO1Wpcs7XPlhRKhIfu4xr
 lyV17BoCyKc2I8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48E8F139ED;
 Thu, 19 Jan 2023 08:47:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RuTaEJoDyWPuYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Jan 2023 08:47:22 +0000
Date: Thu, 19 Jan 2023 09:47:15 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <Y8kDk5YX7Yz3eRhM@linux-uq9g>
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

this is the weekly PR for drm-misc-next. This big change is that the
old drivers for userspace modesetting have been removed. Nouveau has
also lost support for these old ioctls and is therefore now requiring
libdrm 2.4.33.

Best regards
Thomas

drm-misc-next-2023-01-19:
drm-misc-next for v6.3:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

 * Cleanup unneeded include statements wrt <linux/fb.h>, <drm/drm_fb_helper.h>
   and <drm/drm_crtc_helper.h>

 * Remove unused helper DRM_DEBUG_KMS_RATELIMITED()

 * fbdev: Remove obsolete aperture field from struct fb_device, plus
   driver cleanups; Remove unused flag FBINFO_MISC_FIRMWARE

 * MIPI-DSI: Fix brightness, plus rsp. driver updates

 * scheduler: Deprecate drm_sched_resubmit_jobs()

 * ttm: Fix MIPS build; Remove ttm_bo_wait(); Documentation fixes

Driver Changes:

 * Remove obsolete drivers for userspace modesetting i810, mga, r128,
   savage, sis, tdfx, via

 * bridge: Support CDNS DSI J721E, plus DT bindings; lt9611: Various
   fixes and improvements; sil902x: Various fixes; Fixes

 * nouveau: Removed support for legacy ioctls; Replace zero-size array;
   Cleanups

 * panel: Fixes

 * radeon: Use new DRM logging helpers
The following changes since commit 6e41acd2e5353c5362e0d5c2f5ba495c54ff555e:

  drm/vkms: reintroduce prepare_fb and cleanup_fb functions (2023-01-12 09:46:19 -0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-01-19

for you to fetch changes up to bd43a9844bc6f78e00fdc91db47f6969d10c5ac5:

  drm: bridge: ldb: Warn if LDB clock does not match requested link frequency (2023-01-19 08:50:50 +0100)

----------------------------------------------------------------
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

 * Cleanup unneeded include statements wrt <linux/fb.h>, <drm/drm_fb_helper.h>
   and <drm/drm_crtc_helper.h>

 * Remove unused helper DRM_DEBUG_KMS_RATELIMITED()

 * fbdev: Remove obsolete aperture field from struct fb_device, plus
   driver cleanups; Remove unused flag FBINFO_MISC_FIRMWARE

 * MIPI-DSI: Fix brightness, plus rsp. driver updates

 * scheduler: Deprecate drm_sched_resubmit_jobs()

 * ttm: Fix MIPS build; Remove ttm_bo_wait(); Documentation fixes

Driver Changes:

 * Remove obsolete drivers for userspace modesetting i810, mga, r128,
   savage, sis, tdfx, via

 * bridge: Support CDNS DSI J721E, plus DT bindings; lt9611: Various
   fixes and improvements; sil902x: Various fixes; Fixes

 * nouveau: Removed support for legacy ioctls; Replace zero-size array;
   Cleanups

 * panel: Fixes

 * radeon: Use new DRM logging helpers

----------------------------------------------------------------
Alexander Stein (2):
      drm/bridge: sii902x: Use dev_err_probe
      drm: bridge: ldb: Warn if LDB clock does not match requested link frequency

Arnd Bergmann (1):
      drm: panel: visionox: add backlight dependency

Biju Das (1):
      dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi: Document RZ/V2L support

Cai Huoqing (10):
      drm: Remove the obsolete driver-i810
      drm: Remove the obsolete driver-mga
      drm: Remove the obsolete driver-r128
      drm: Remove the obsolete driver-savage
      drm: Remove the obsolete driver-sis
      drm: Remove the obsolete driver-tdfx
      drm: Remove the obsolete driver-via
      drm: Add comments to Kconfig
      drm: Remove some obsolete drm pciids(tdfx, mga, i810, savage, r128, sis, via)
      MAINTAINERS: Remove some obsolete drivers info(tdfx, mga, i810, savage, r128, sis)

Christian König (5):
      drm/ttm: fix some minor kerneldoc issues
      drm/scheduler: cleanup define
      drm/scheduler: deprecate drm_sched_resubmit_jobs
      drm/nouveau: stop using ttm_bo_wait
      drm/ttm/vmwgfx: move ttm_bo_wait into VMWGFX

Daniel Mentz (1):
      drm/mipi-dsi: Fix byte order of 16-bit DCS set/get brightness

Dmitry Baryshkov (13):
      drm/bridge: lt9611: fix sleep mode setup
      drm/bridge: lt9611: fix HPD reenablement
      drm/bridge: lt9611: fix polarity programming
      drm/bridge: lt9611: fix programming of video modes
      drm/bridge: lt9611: fix clock calculation
      drm/bridge: lt9611: pass a pointer to the of node
      drm/bridge: lt9611: rework the mode_set function
      drm/bridge: lt9611: attach to the next bridge
      drm/bridge: lt9611: fix sync polarity for DVI output
      drm/bridge: lt9611: simplify video timings programming
      drm/bridge: lt9611: rework infoframes handling
      drm/bridge: lt9611: stop filtering modes via the table
      drm/bridge: lt9611: properly program the dual host mode

Kees Cook (1):
      drm/nouveau/fb/ga102: Replace zero-length array of trailing structs with flex-array

Marek Vasut (1):
      drm/bridge: tc358767: Set default CLRSIPO count

Nirmoy Das (2):
      drm/radeon: Do not use deprecated drm log API
      drm_print: Remove deprecated DRM_DEBUG_KMS_RATELIMITED()

Rahul T R (5):
      dt-bindings: display: bridge: Convert cdns,dsi.txt to yaml
      dt-bindings: display: bridge: cdns,dsi: Add compatible for dsi on j721e
      drm/bridge: cdns-dsi: Move to drm/bridge/cadence
      drm/bridge: cdns-dsi: Create a header file
      drm/bridge: cdns-dsi: Add support for J721E wrapper

Richard Acayan (2):
      drm/panel: sofef00: Use 16-bit brightness function
      drm/panel: vtdr6130: Use 16-bit brightness function

Thomas Zimmermann (51):
      drm/nouveau: Remove support for legacy contexts/buffers
      fbcon: Remove trailing whitespaces
      Revert "fbcon: don't lose the console font across generic->chip driver switch"
      drm/gma500: Do not set struct fb_info.apertures
      drm/i915: Do not set struct fb_info.apertures
      drm/radeon: Do not set struct fb_info.apertures
      drm/fb-helper: Do not allocate unused apertures structure
      fbdev/clps711x-fb: Do not set struct fb_info.apertures
      fbdev/hyperv-fb: Do not set struct fb_info.apertures
      vfio-mdev/mdpy-fb: Do not set struct fb_info.apertures
      fbdev/efifb: Add struct efifb_par for driver data
      fbdev/efifb: Do not use struct fb_info.apertures
      fbdev/offb: Allocate struct offb_par with framebuffer_alloc()
      fbdev/offb: Do not use struct fb_info.apertures
      fbdev/simplefb: Do not use struct fb_info.apertures
      fbdev/vesafb: Remove trailing whitespaces
      fbdev/vesafb: Do not use struct fb_info.apertures
      fbdev/vga16fb: Do not use struct fb_info.apertures
      drm/fbdev: Remove aperture handling and FBINFO_MISC_FIRMWARE
      drm: Include <linux/backlight.h> where needed
      drm: Include <linux/of.h> where needed
      drm: Don't include <linux/fb.h> in drm_crtc_helper.h
      drm/amdgpu: Do not include <linux/fb.h>
      drm/panel: Do not include <linux/fb.h>
      drm: Define enum mode_set_atomic in drm_modeset_helper_tables.h
      drm/amdgpu: Do not include <drm/drm_fb_helper.h>
      drm/nouveau: Do not include <drm/drm_fb_helper.h>
      drm/radeon: Remove trailing whitespaces
      drm/radeon: Do not include <drm/drm_fb_helper.h>
      drm/ttm: Include <linux/vmalloc.h> to fix MIPS build
      drm: Remove unnecessary include statements for drm_crtc_helper.h
      drm/amdgpu: Remove unnecessary include statements for drm_crtc_helper.h
      drm/arm/komeda: Remove unnecessary include statements for drm_crtc_helper.h
      drm/aspeed: Remove unnecessary include statements for drm_crtc_helper.h
      drm/ast: Remove unnecessary include statements for drm_crtc_helper.h
      drm/bridge: Remove unnecessary include statements for drm_crtc_helper.h
      drm/gma500: Remove unnecessary include statements for drm_crtc_helper.h
      drm/i2c/ch7006: Remove unnecessary include statements for drm_crtc_helper.h
      drm/ingenic: Remove unnecessary include statements for drm_crtc_helper.h
      drm/kmb: Remove unnecessary include statements for drm_crtc_helper.h
      drm/logicvc: Remove unnecessary include statements for drm_crtc_helper.h
      drm/nouveau: Remove unnecessary include statements for drm_crtc_helper.h
      drm/radeon: Remove unnecessary include statements for drm_crtc_helper.h
      drm/rockchip: Remove unnecessary include statements for drm_crtc_helper.h
      drm/shmobile: Remove unnecessary include statements for drm_crtc_helper.h
      drm/sprd: Remove unnecessary include statements for drm_crtc_helper.h
      drm/sun4i: Remove unnecessary include statements for drm_crtc_helper.h
      drm/tidss: Remove unnecessary include statements for drm_crtc_helper.h
      drm/udl: Remove unnecessary include statements for drm_crtc_helper.h
      drm/vboxvideo: Remove unnecessary include statements for drm_crtc_helper.h
      drm/crtc-helper: Remove most include statements from drm_crtc_helper.h

Tomi Valkeinen (1):
      drm/omap: Fix kernel docs

Wadim Egorov (1):
      drm/bridge: sii902x: Allow reset line to be tied to a sleepy GPIO controller

 .../bindings/display/bridge/cdns,dsi.txt           |  112 -
 .../bindings/display/bridge/cdns,dsi.yaml          |  180 +
 .../bindings/display/bridge/renesas,dsi.yaml       |    1 +
 MAINTAINERS                                        |   29 -
 drivers/gpu/drm/Kconfig                            |   59 +-
 drivers/gpu/drm/Makefile                           |    7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c       |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    1 -
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c         |    1 -
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |    1 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    1 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |    1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |    1 -
 .../pm/powerplay/hwmgr/vega10_processpptables.c    |    1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |    1 -
 .../pm/powerplay/hwmgr/vega12_processpptables.c    |    1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |    1 -
 .../pm/powerplay/hwmgr/vega20_processpptables.c    |    1 -
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |    1 -
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |    1 -
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    1 +
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |    1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |    1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c            |    1 -
 drivers/gpu/drm/ast/ast_drv.c                      |    1 -
 drivers/gpu/drm/ast/ast_main.c                     |    1 -
 drivers/gpu/drm/ast/ast_mode.c                     |    1 -
 drivers/gpu/drm/bridge/Kconfig                     |   11 -
 drivers/gpu/drm/bridge/Makefile                    |    1 -
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    1 -
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    1 -
 drivers/gpu/drm/bridge/cadence/Kconfig             |   21 +
 drivers/gpu/drm/bridge/cadence/Makefile            |    3 +
 .../bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c} |   83 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h     |   84 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c    |   51 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h    |   16 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    1 -
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   23 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |    1 -
 drivers/gpu/drm/bridge/ite-it66121.c               |    1 -
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  340 +-
 drivers/gpu/drm/bridge/sii902x.c                   |    7 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    8 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    1 -
 drivers/gpu/drm/bridge/tc358775.c                  |    1 -
 drivers/gpu/drm/drm_bufs.c                         |   12 +-
 drivers/gpu/drm/drm_context.c                      |   36 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   20 +-
 drivers/gpu/drm/drm_lease.c                        |    2 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |   52 +
 drivers/gpu/drm/drm_modes.c                        |    5 +-
 drivers/gpu/drm/drm_plane_helper.c                 |    1 -
 drivers/gpu/drm/gma500/backlight.c                 |    2 +
 drivers/gpu/drm/gma500/cdv_device.c                |    1 +
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |    2 +
 drivers/gpu/drm/gma500/cdv_intel_display.c         |    1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |    2 +
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |    2 +
 drivers/gpu/drm/gma500/framebuffer.c               |    7 +-
 drivers/gpu/drm/gma500/gma_display.c               |    2 +
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |    1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |    2 +
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |    1 +
 drivers/gpu/drm/gma500/psb_device.c                |    1 +
 drivers/gpu/drm/gma500/psb_intel_display.c         |    3 +
 drivers/gpu/drm/gma500/psb_intel_drv.h             |    1 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |    2 +
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |    2 +
 drivers/gpu/drm/i2c/ch7006_drv.c                   |    2 +
 drivers/gpu/drm/i2c/ch7006_priv.h                  |    1 -
 drivers/gpu/drm/i810/Makefile                      |    8 -
 drivers/gpu/drm/i810/i810_dma.c                    | 1266 -------
 drivers/gpu/drm/i810/i810_drv.c                    |  101 -
 drivers/gpu/drm/i810/i810_drv.h                    |  246 --
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    7 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    1 -
 drivers/gpu/drm/kmb/kmb_crtc.c                     |    1 -
 drivers/gpu/drm/kmb/kmb_plane.c                    |    1 -
 drivers/gpu/drm/logicvc/logicvc_interface.c        |    1 -
 drivers/gpu/drm/logicvc/logicvc_mode.c             |    1 -
 drivers/gpu/drm/mga/Makefile                       |   11 -
 drivers/gpu/drm/mga/mga_dma.c                      | 1168 -------
 drivers/gpu/drm/mga/mga_drv.c                      |  104 -
 drivers/gpu/drm/mga/mga_drv.h                      |  685 ----
 drivers/gpu/drm/mga/mga_ioc32.c                    |  197 --
 drivers/gpu/drm/mga/mga_irq.c                      |  169 -
 drivers/gpu/drm/mga/mga_state.c                    | 1099 ------
 drivers/gpu/drm/mga/mga_warp.c                     |  167 -
 drivers/gpu/drm/nouveau/Kconfig                    |   12 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c             |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c     |    1 -
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |    2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |    1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c            |    1 -
 drivers/gpu/drm/nouveau/include/nvfw/hs.h          |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    6 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   12 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   11 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c              |    1 -
 drivers/gpu/drm/omapdrm/omap_gem.c                 |    2 +-
 drivers/gpu/drm/omapdrm/omap_irq.c                 |    4 +-
 drivers/gpu/drm/panel/Kconfig                      |    1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |    1 -
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |    1 -
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |    2 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |    9 +-
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |    5 +-
 drivers/gpu/drm/r128/Makefile                      |   10 -
 drivers/gpu/drm/r128/ati_pcigart.c                 |  228 --
 drivers/gpu/drm/r128/ati_pcigart.h                 |   31 -
 drivers/gpu/drm/r128/r128_cce.c                    |  944 -----
 drivers/gpu/drm/r128/r128_drv.c                    |  116 -
 drivers/gpu/drm/r128/r128_drv.h                    |  544 ---
 drivers/gpu/drm/r128/r128_ioc32.c                  |  199 --
 drivers/gpu/drm/r128/r128_irq.c                    |  118 -
 drivers/gpu/drm/r128/r128_state.c                  | 1641 ---------
 drivers/gpu/drm/radeon/atombios_crtc.c             |    3 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |    1 +
 drivers/gpu/drm/radeon/r300.c                      |    1 -
 drivers/gpu/drm/radeon/radeon_acpi.c               |    2 +-
 drivers/gpu/drm/radeon/radeon_asic.c               |    1 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |    2 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    1 +
 drivers/gpu/drm/radeon/radeon_dp_auxch.c           |    5 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |    2 -
 drivers/gpu/drm/radeon/radeon_encoders.c           |    1 -
 drivers/gpu/drm/radeon/radeon_fb.c                 |    4 -
 drivers/gpu/drm/radeon/radeon_irq_kms.c            |    1 -
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c        |    5 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |    2 +-
 drivers/gpu/drm/radeon/radeon_legacy_tv.c          |    1 -
 drivers/gpu/drm/radeon/radeon_mode.h               |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    1 -
 drivers/gpu/drm/savage/Makefile                    |    9 -
 drivers/gpu/drm/savage/savage_bci.c                | 1082 ------
 drivers/gpu/drm/savage/savage_drv.c                |   91 -
 drivers/gpu/drm/savage/savage_drv.h                |  580 ----
 drivers/gpu/drm/savage/savage_state.c              | 1169 -------
 drivers/gpu/drm/scheduler/sched_main.c             |   13 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |    2 +
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    1 -
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |    1 -
 drivers/gpu/drm/sis/Makefile                       |   10 -
 drivers/gpu/drm/sis/sis_drv.c                      |  143 -
 drivers/gpu/drm/sis/sis_drv.h                      |   80 -
 drivers/gpu/drm/sis/sis_mm.c                       |  363 --
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    1 -
 drivers/gpu/drm/sprd/sprd_drm.c                    |    1 -
 drivers/gpu/drm/sprd/sprd_dsi.c                    |    1 -
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |    2 +-
 drivers/gpu/drm/tdfx/Makefile                      |    8 -
 drivers/gpu/drm/tdfx/tdfx_drv.c                    |   90 -
 drivers/gpu/drm/tdfx/tdfx_drv.h                    |   47 -
 drivers/gpu/drm/tidss/tidss_crtc.c                 |    1 -
 drivers/gpu/drm/tidss/tidss_drv.c                  |    1 -
 drivers/gpu/drm/tidss/tidss_encoder.c              |    2 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    1 -
 drivers/gpu/drm/tidss/tidss_plane.c                |    1 -
 drivers/gpu/drm/ttm/ttm_bo.c                       |   44 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   34 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    2 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |    1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    2 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c              |    1 -
 drivers/gpu/drm/via/Makefile                       |    8 -
 drivers/gpu/drm/via/via_3d_reg.h                   | 1771 ----------
 drivers/gpu/drm/via/via_dri1.c                     | 3630 --------------------
 drivers/gpu/drm/vmwgfx/ttm_object.h                |   11 +
 drivers/video/fbdev/clps711x-fb.c                  |   10 +-
 drivers/video/fbdev/core/fbcon.c                   |   41 +-
 drivers/video/fbdev/core/fbmem.c                   |   33 -
 drivers/video/fbdev/core/fbsysfs.c                 |    1 -
 drivers/video/fbdev/efifb.c                        |   35 +-
 drivers/video/fbdev/hyperv_fb.c                    |   17 +-
 drivers/video/fbdev/offb.c                         |   33 +-
 drivers/video/fbdev/simplefb.c                     |   19 +-
 drivers/video/fbdev/vesafb.c                       |   37 +-
 drivers/video/fbdev/vga16fb.c                      |   15 +-
 include/drm/drm_crtc_helper.h                      |   16 +-
 include/drm/drm_drv.h                              |    7 -
 include/drm/drm_fb_helper.h                        |    5 -
 include/drm/drm_fixed.h                            |    1 +
 include/drm/drm_mipi_dsi.h                         |    4 +
 include/drm/drm_modeset_helper_vtables.h           |    6 +-
 include/drm/drm_pciids.h                           |  112 -
 include/drm/drm_print.h                            |    3 -
 include/drm/gpu_scheduler.h                        |    1 -
 include/drm/ttm/ttm_bo.h                           |    1 -
 include/linux/fb.h                                 |   22 -
 include/uapi/drm/i810_drm.h                        |  292 --
 include/uapi/drm/mga_drm.h                         |  429 ---
 include/uapi/drm/r128_drm.h                        |  336 --
 include/uapi/drm/savage_drm.h                      |  220 --
 include/uapi/drm/sis_drm.h                         |   77 -
 include/uapi/drm/via_drm.h                         |  282 --
 samples/vfio-mdev/mdpy-fb.c                        |    8 -
 211 files changed, 901 insertions(+), 20794 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
 rename drivers/gpu/drm/bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c} (97%)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h
 delete mode 100644 drivers/gpu/drm/i810/Makefile
 delete mode 100644 drivers/gpu/drm/i810/i810_dma.c
 delete mode 100644 drivers/gpu/drm/i810/i810_drv.c
 delete mode 100644 drivers/gpu/drm/i810/i810_drv.h
 delete mode 100644 drivers/gpu/drm/mga/Makefile
 delete mode 100644 drivers/gpu/drm/mga/mga_dma.c
 delete mode 100644 drivers/gpu/drm/mga/mga_drv.c
 delete mode 100644 drivers/gpu/drm/mga/mga_drv.h
 delete mode 100644 drivers/gpu/drm/mga/mga_ioc32.c
 delete mode 100644 drivers/gpu/drm/mga/mga_irq.c
 delete mode 100644 drivers/gpu/drm/mga/mga_state.c
 delete mode 100644 drivers/gpu/drm/mga/mga_warp.c
 delete mode 100644 drivers/gpu/drm/r128/Makefile
 delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.c
 delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.h
 delete mode 100644 drivers/gpu/drm/r128/r128_cce.c
 delete mode 100644 drivers/gpu/drm/r128/r128_drv.c
 delete mode 100644 drivers/gpu/drm/r128/r128_drv.h
 delete mode 100644 drivers/gpu/drm/r128/r128_ioc32.c
 delete mode 100644 drivers/gpu/drm/r128/r128_irq.c
 delete mode 100644 drivers/gpu/drm/r128/r128_state.c
 delete mode 100644 drivers/gpu/drm/savage/Makefile
 delete mode 100644 drivers/gpu/drm/savage/savage_bci.c
 delete mode 100644 drivers/gpu/drm/savage/savage_drv.c
 delete mode 100644 drivers/gpu/drm/savage/savage_drv.h
 delete mode 100644 drivers/gpu/drm/savage/savage_state.c
 delete mode 100644 drivers/gpu/drm/sis/Makefile
 delete mode 100644 drivers/gpu/drm/sis/sis_drv.c
 delete mode 100644 drivers/gpu/drm/sis/sis_drv.h
 delete mode 100644 drivers/gpu/drm/sis/sis_mm.c
 delete mode 100644 drivers/gpu/drm/tdfx/Makefile
 delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.c
 delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.h
 delete mode 100644 drivers/gpu/drm/via/Makefile
 delete mode 100644 drivers/gpu/drm/via/via_3d_reg.h
 delete mode 100644 drivers/gpu/drm/via/via_dri1.c
 delete mode 100644 include/uapi/drm/i810_drm.h
 delete mode 100644 include/uapi/drm/mga_drm.h
 delete mode 100644 include/uapi/drm/r128_drm.h
 delete mode 100644 include/uapi/drm/savage_drm.h
 delete mode 100644 include/uapi/drm/sis_drm.h
 delete mode 100644 include/uapi/drm/via_drm.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
