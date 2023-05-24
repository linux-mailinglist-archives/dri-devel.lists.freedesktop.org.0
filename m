Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705770F6BE
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 14:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2724810E67A;
	Wed, 24 May 2023 12:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA57B10E67A;
 Wed, 24 May 2023 12:42:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BDEC321908;
 Wed, 24 May 2023 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684932159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+gw7pgTyOFohuD0Ks7NIo0IXAxUDTF1zu84kJ0UrqPY=;
 b=kEtE4UoCdeyAcn1eXgWULawpskP4nBSYoIiezaVk3GrCHoExSmthuAbQF3GX3T7KfpchQq
 bNr7AgrOn8ZUFw2rZRzsU5clD9TZATHemokhhyD8RFytC0nfhxaotxHviFnfwDhrBO7e7s
 68ds1pRqAsG1Wbu3mmVFgxhN6F80ve8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684932159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+gw7pgTyOFohuD0Ks7NIo0IXAxUDTF1zu84kJ0UrqPY=;
 b=mnS+AohxZBQqvkszfT5oIoK6+TM5uMA/dLp/WYRIHWBADFjkZHUdoLD9eoUTWT/icOUPdq
 apeyrYsXXp5+ulCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 839E413425;
 Wed, 24 May 2023 12:42:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sSZLHz8GbmQebwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 24 May 2023 12:42:39 +0000
Date: Wed, 24 May 2023 14:42:37 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20230524124237.GA25416@linux-uq9g>
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

here is this week's PR for drm-misc-next. I'm taking over while Maxime
is away. There's support for a few more panels and bridges. In fbdev,
I/O helpers are now implemented within the architecture code. DRM's
shmobile driver received some updates.

Best regards
Thomas

drm-misc-next-2023-05-24:
drm-misc-next for v6.5:

UAPI Changes:

Cross-subsystem Changes:

 * fbdev: Move framebuffer I/O helpers to <asm/fb.h>, fix naming

 * firmware: Init sysfb as early as possible

Core Changes:

 * DRM scheduler: Rename interfaces

 * ttm: Store ttm_device_funcs in .rodata

 * Replace strlcpy() with strscpy() in various places

 * Cleanups

Driver Changes:

 * bridge: analogix: Fix endless probe loop; samsung-dsim: Support
   swapping clock/data polarity; tc358767: Use devm_ Cleanups;

 * gma500: Fix I/O-memory access

 * panel: boe-tv101wum-nl6: Improve initialization;  sharp-ls043t1le001:
	  Mode fixes;  simple: Add BOE EV121WXM-N10-1850 plus DT bindings;
	  AddS6D7AA0 plus DT bindings;  Cleanups

 * ssd1307x: Style fixes

 * sun4i: Release clocks

 * msm: Fix I/O-memory access

 * nouveau: Cleanups

 * shmobile: Support Renesas; Enable framebuffer console; Various fixes

 * vkms: Fix RGB565 conversion
The following changes since commit 4795c78768bcbd58d4ffab650674d314dc6dd772:

  drm: sun4i: calculate proper DCLK rate for DSI (2023-05-10 16:03:19 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-05-24

for you to fetch changes up to 4bd65789ba847f39e37e0041c10aad5dff1760b6:

  drm: shmobile: Make DRM_SHMOBILE visible on Renesas SoC platforms (2023-05-24 14:00:49 +0200)

----------------------------------------------------------------
drm-misc-next for v6.5:

UAPI Changes:

Cross-subsystem Changes:

 * fbdev: Move framebuffer I/O helpers to <asm/fb.h>, fix naming

 * firmware: Init sysfb as early as possible

Core Changes:

 * DRM scheduler: Rename interfaces

 * ttm: Store ttm_device_funcs in .rodata

 * Replace strlcpy() with strscpy() in various places

 * Cleanups

Driver Changes:

 * bridge: analogix: Fix endless probe loop; samsung-dsim: Support
   swapping clock/data polarity; tc358767: Use devm_ Cleanups;

 * gma500: Fix I/O-memory access

 * panel: boe-tv101wum-nl6: Improve initialization;  sharp-ls043t1le001:
	  Mode fixes;  simple: Add BOE EV121WXM-N10-1850 plus DT bindings;
	  AddS6D7AA0 plus DT bindings;  Cleanups

 * ssd1307x: Style fixes

 * sun4i: Release clocks

 * msm: Fix I/O-memory access

 * nouveau: Cleanups

 * shmobile: Support Renesas; Enable framebuffer console; Various fixes

 * vkms: Fix RGB565 conversion

----------------------------------------------------------------
Alexander Stein (1):
      drm/bridge: tc358767: Switch to devm MIPI-DSI helpers

Anup Sharma (1):
      gpu: drm: bridge: No need to set device_driver owner

Arnd Bergmann (1):
      drm/nouveau: dispnv50: fix missing-prototypes warning

Artur Weber (4):
      dt-bindings: display: panel: Add Samsung S6D7AA0 LCD panel controller
      drm/panel: Add Samsung S6D7AA0 panel controller driver
      MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel controller driver
      drm/panel: samsung-s6d7aa0: use pointer for drm_mode in panel desc struct

Azeem Shaikh (2):
      drm/bridge: dw-hdmi: Replace all non-returning strlcpy with strscpy
      dma-buf/sw_sync: Replace all non-returning strlcpy with strscpy

Cong Yang (1):
      drm/panel: Modify innolux hj110iz panel initial code

Dmitry Baryshkov (2):
      drm/panel: sharp-ls043t1le01: adjust mode settings
      drm/panel: sharp-ls043t1le01: drop dummy functions and data fields

Fabio Estevam (1):
      dt-bindings: samsung,mipi-dsim: Add 'lane-polarities'

Francesco Dolcini (1):
      drm/bridge: tc358768: remove unneeded semicolon

Geert Uytterhoeven (5):
      drm: shmobile: Use %p4cc to print fourcc codes
      drm: shmobile: Add support for DRM_FORMAT_XRGB8888
      drm: shmobile: Switch to drm_crtc_init_with_planes()
      drm: shmobile: Add missing call to drm_fbdev_generic_setup()
      drm: shmobile: Make DRM_SHMOBILE visible on Renesas SoC platforms

Huacai Chen (1):
      drivers/firmware: Move sysfb_init() from device_initcall to subsys_initcall_sync

Jani Nikula (1):
      drm/ttm: let struct ttm_device_funcs be placed in rodata

Javier Martinez Canillas (1):
      drm/ssd130x: Fix include guard name

Krzysztof Kozlowski (1):
      drm/nouveau: constify pointers to hwmon_channel_info

Liu Ying (2):
      dt-bindings: display: simple: Add BOE EV121WXM-N10-1850 panel
      drm/panel: panel-simple: Add BOE EV121WXM-N10-1850 panel support

Luben Tuikov (2):
      drm/sched: Rename to drm_sched_can_queue()
      drm/sched: Rename to drm_sched_wakeup_if_can_queue()

Marek Vasut (2):
      dt-bindings: display: bridge: tc358867: Document TC358867/TC9595 compatible
      drm: bridge: samsung-dsim: Implement support for clock/data polarity swap

Maíra Canal (2):
      drm: Add fixed-point helper to get rounded integer values
      drm/vkms: Fix RGB565 pixel conversion

Nícolas F. R. A. Prado (1):
      drm/bridge: anx7625: Prevent endless probe loop

Shuijing Li (2):
      drm/panel: boe-tv101wum-nl6: Remove extra delay
      drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence

Sui Jingfeng (1):
      drm/drm_atomic_helper.c: fix a typo

Thomas Zimmermann (9):
      fbdev/hitfb: Cast I/O offset to address
      fbdev/matrox: Remove trailing whitespaces
      ipu-v3: Include <linux/io.h>
      fbdev: Include <linux/io.h> in various drivers
      fbdev: Include <linux/fb.h> instead of <asm/fb.h>
      fbdev: Move framebuffer I/O helpers into <asm/fb.h>
      fbdev: Rename fb_mem*() helpers
      drm/gma500: Clear fbdev framebuffer with fb_memset_io()
      drm/msm: Use struct fb_info.screen_buffer

Tom Rix (1):
      drm/nouveau/acr/ga102: set variable ga102_gsps storage-class-specifier to static

XuDong Liu (1):
      drm: sun4i_tcon: use devm_clk_get_enabled in `sun4i_tcon_init_clocks`

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  23 +
 .../bindings/display/bridge/toshiba,tc358767.yaml  |  14 +-
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../bindings/display/panel/samsung,s6d7aa0.yaml    |  70 +++
 MAINTAINERS                                        |   6 +
 arch/ia64/include/asm/fb.h                         |  20 +
 arch/loongarch/include/asm/fb.h                    |  21 +
 arch/mips/include/asm/fb.h                         |  22 +
 arch/parisc/video/fbdev.c                          |   3 +-
 arch/sparc/include/asm/fb.h                        |  20 +
 arch/sparc/video/fbdev.c                           |   1 -
 arch/x86/video/fbdev.c                             |   2 -
 drivers/dma-buf/sw_sync.c                          |   2 +-
 drivers/firmware/sysfb.c                           |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 128 +++--
 drivers/gpu/drm/bridge/samsung-dsim.c              |  28 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   2 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   4 +-
 drivers/gpu/drm/bridge/tc358768.c                  |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   2 +-
 drivers/gpu/drm/gma500/fbdev.c                     |   2 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   1 +
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |   2 +-
 drivers/gpu/drm/nouveau/nv50_display.h             |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c    |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |   7 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 404 ++++++++------
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      | 585 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |  43 +-
 drivers/gpu/drm/panel/panel-simple.c               |  34 ++
 drivers/gpu/drm/scheduler/sched_entity.c           |   4 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  15 +-
 drivers/gpu/drm/shmobile/Kconfig                   |   4 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |  35 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |   3 +
 drivers/gpu/drm/shmobile/shmob_drm_kms.c           |   9 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |   5 +
 drivers/gpu/drm/solomon/ssd130x.h                  |   6 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  19 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |   2 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  12 +-
 drivers/gpu/ipu-v3/ipu-prv.h                       |   1 +
 drivers/staging/sm750fb/sm750.c                    |   2 +-
 drivers/video/fbdev/arcfb.c                        |   1 +
 drivers/video/fbdev/aty/atyfb.h                    |   2 +
 drivers/video/fbdev/aty/mach64_cursor.c            |   2 +-
 drivers/video/fbdev/chipsfb.c                      |   2 +-
 drivers/video/fbdev/core/fb_io_fops.c              |   4 +-
 drivers/video/fbdev/core/fbcon.c                   |   1 -
 drivers/video/fbdev/core/fbmem.c                   |   2 -
 drivers/video/fbdev/hitfb.c                        | 122 +++--
 drivers/video/fbdev/kyro/fbdev.c                   |   2 +-
 drivers/video/fbdev/matrox/matroxfb_accel.c        |   6 +-
 drivers/video/fbdev/matrox/matroxfb_base.h         |   4 +-
 drivers/video/fbdev/pvr2fb.c                       |   2 +-
 drivers/video/fbdev/sstfb.c                        |   2 +-
 drivers/video/fbdev/stifb.c                        |   4 +-
 drivers/video/fbdev/tdfxfb.c                       |   2 +-
 drivers/video/fbdev/wmt_ge_rops.c                  |   2 +
 include/asm-generic/fb.h                           | 102 ++++
 include/drm/bridge/samsung-dsim.h                  |   2 +
 include/drm/drm_fixed.h                            |   6 +
 include/drm/gpu_scheduler.h                        |   2 +-
 include/drm/ttm/ttm_device.h                       |   4 +-
 include/linux/fb.h                                 |  55 +-
 67 files changed, 1476 insertions(+), 437 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
