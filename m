Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5773719AE7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 13:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3AD10E233;
	Thu,  1 Jun 2023 11:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE86A10E232;
 Thu,  1 Jun 2023 11:22:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ABE361F86C;
 Thu,  1 Jun 2023 11:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685618568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GxpJf4RVUDmSzl9xwe/kLw85LA6Da21gt7brLwtIgNI=;
 b=lltMHNKRNS0jEh8bed8VN7oKj+6kXBvjX+gHTLI9KRgEvNL6yQFqeNVm51p/8vjYhaYb0N
 d9KGTz6cctj61/P2P8xKHOoQlCLbVOsQyrxxL167cL4i+wEeQ1uK7AW0O407NX9QSFYH0X
 jcW30Z4H/1U2B+d6TmgUodEldXvAYPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685618568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GxpJf4RVUDmSzl9xwe/kLw85LA6Da21gt7brLwtIgNI=;
 b=3hMdDlSDtBy5Nm/EkQXTXRJp2VVnY08+YSIIu/NTDwTG0ZBU4WImJrh4rXr60K6ytzRsfx
 dF4GrRQrojhDp8Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64A5113441;
 Thu,  1 Jun 2023 11:22:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rdyJFIh/eGQHZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Jun 2023 11:22:48 +0000
Date: Thu, 1 Jun 2023 13:22:46 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20230601112246.GA10882@linux-uq9g>
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

here's the weekly PR for drm-misc-next. There's support for some new
panels; some improvements to bridge drivers. The code around show_fdinfo
can now be shared among DRM drivers. Fbdev emulation got improved file
I/O code. Plus the usual fixes.

Best regards
Thomas

drm-misc-next-2023-06-01:
drm-misc-next for v6.5:

UAPI Changes:

Cross-subsystem Changes:

 * fbdev:
   * Add Kconfig options and initializer macros for file I/O, convert
     DRM fbdev emulation

Core Changes:

 * Unify handling of struct file_operations.show_fdinfo

 * Use .probe in all i2c code (interface cleanup)

 * TTM:
   * Remove unused code

Driver Changes:

 * amdgpu:
   * Use shared show_fdinfo code
   * Fix building without procfs

 * bridge:
   * display-connector: Add support for external power supply
   * samsung-dsim: Fix enabling; Support variable clocking
   * tc358767: Fixes
   * ti-sn65dsi83: Fix enabling

 * msm:
   * Use shared show_fdinfo code

 * msxfb:
   * Add support for i.MX93 LCDIF

 * panel:
   * Add support for Ampire AM-800480L1TMQW-T00H plus DT bindings
   * panel-edp: Convert .remove to return void

 * stm:
   * dsi: Use devm_ helper
   * ltdc: Fix potential invalid pointer deref
The following changes since commit 85d712f033d23bb56a373e29465470c036532d46:

  Merge tag 'drm-intel-gt-next-2023-05-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-05-29 06:21:51 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-06-01

for you to fetch changes up to 43049f17b5262826ef64a19762a096782398ef8f:

  drm/i915: Implement dedicated fbdev I/O helpers (2023-06-01 12:41:40 +0200)

----------------------------------------------------------------
drm-misc-next for v6.5:

UAPI Changes:

Cross-subsystem Changes:

 * fbdev:
   * Add Kconfig options and initializer macros for file I/O, convert
     DRM fbdev emulation

Core Changes:

 * Unify handling of struct file_operations.show_fdinfo

 * Use .probe in all i2c code (interface cleanup)

 * TTM:
   * Remove unused code

Driver Changes:

 * amdgpu:
   * Use shared show_fdinfo code
   * Fix building without procfs

 * bridge:
   * display-conenctor: Add support for external power supply
   * samsung-dsim: Fix enabling; Support variable clocking
   * tc358767: Fixes
   * ti-sn65dsi83: Fix enabling

 * msm:
   * Use shared show_fdinfo code

 * msxfb:
   * Add support for i.MX93 LCDIF

 * panel:
   * Add support for Ampire AM-800480L1TMQW-T00H plus DT bindings
   * panel-edp: Convert .remove to return void

 * stm:
   * dsi: Use devm_ helper
   * ltdc: Fix potential invalid pointer deref

----------------------------------------------------------------
Adam Ford (7):
      drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
      drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
      drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
      drm: bridge: samsung-dsim: Dynamically configure DPHY timing
      drm: bridge: samsung-dsim: Support non-burst mode
      dt-bindings: bridge: samsung-dsim: Make some flags optional
      dt-bindings: bridge: samsung-dsim: Make some flags optional

Alexander Stein (1):
      drm/bridge: tc358767: explicitly set readable registers

Dario Binacchi (1):
      drm/panel: simple: fix active size for Ampire AM-480272H3TMQW-T01H

Dmitry Baryshkov (3):
      dt-bindings: display: hdmi-connector: add hdmi-pwr supply
      drm/bridge: display-connector: rename dp_pwr to connector_pwr
      drm/bridge: display-connector: handle hdmi-pwr supply

Fabio Estevam (1):
      dt-bindings: samsung,mipi-dsim: Use port-base reference

Frieder Schrempf (2):
      drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec
      drm/bridge: ti-sn65dsi83: Fix enable/disable flow to meet spec

Geert Uytterhoeven (2):
      dt-bindings: display: panel-simple: Add Ampire AM-800480L1TMQW-T00H
      drm/panel: simple: Add Ampire AM-800480L1TMQW-T00H

Liu Ying (6):
      dt-bindings: lcdif: Add i.MX93 LCDIF support
      drm: lcdif: Drop unnecessary NULL pointer check on lcdif->bridge
      drm: lcdif: Determine bus format and flags in ->atomic_check()
      drm: lcdif: Check consistent bus format and flags across first bridges
      drm: lcdif: Add multiple encoders and first bridges support
      drm: lcdif: Add i.MX93 LCDIF compatible string

Lucas Stach (1):
      drm: bridge: samsung-dsim: fix blanking packet size calculation

Ma Jun (1):
      drm/ttm: Remove redundant code in ttm_tt_init_fields

Neil Armstrong (1):
      Revert "dt-bindings: bridge: samsung-dsim: Make some flags optional"

Raphael Gallais-Pou (1):
      drm/stm: ltdc: fix late dereference check

Rob Clark (8):
      drm/docs: Fix usage stats typos
      drm: Add common fdinfo helper
      drm/msm: Switch to fdinfo helper
      drm/amdgpu: Switch to fdinfo helper
      drm: Add fdinfo memory stats
      drm/msm: Add memory stats to fdinfo
      drm/doc: Relax fdinfo string constraints
      drm/amdgpu: Fix no-procfs build

Thomas Zimmermann (14):
      Merge drm/drm-next into drm-misc-next
      fbdev: Add Kconfig options to select different fb_ops helpers
      fbdev: Add initializer macros for struct fb_ops
      drm/armada: Use regular fbdev I/O helpers
      drm/exynos: Use regular fbdev I/O helpers
      drm/gma500: Use regular fbdev I/O helpers
      drm/radeon: Use regular fbdev I/O helpers
      drm/fbdev-dma: Use regular fbdev I/O helpers
      drm/omapdrm: Use regular fbdev I/O helpers
      drm/tegra: Use regular fbdev I/O helpers
      drm/fb-helper: Export helpers for marking damage areas
      drm/msm: Use regular fbdev I/O helpers
      drm/fbdev-generic: Implement dedicated fbdev I/O helpers
      drm/i915: Implement dedicated fbdev I/O helpers

Uwe Kleine-König (2):
      drm: Switch i2c drivers back to use .probe()
      drm/panel-edp: Convert to platform remove callback returning void

Yang Li (1):
      drm/stm: dsi: Use devm_platform_ioremap_resource()

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  12 +-
 .../bindings/display/connector/hdmi-connector.yaml |   3 +
 .../devicetree/bindings/display/fsl,lcdif.yaml     |   7 +-
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 Documentation/gpu/drm-usage-stats.rst              |  91 +++++---
 drivers/gpu/drm/Kconfig                            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |  32 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h         |   2 +-
 drivers/gpu/drm/armada/Kconfig                     |   1 +
 drivers/gpu/drm/armada/armada_fbdev.c              |   7 +-
 drivers/gpu/drm/bridge/Kconfig                     |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   2 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   2 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |   2 +-
 drivers/gpu/drm/bridge/display-connector.c         |  61 +++---
 drivers/gpu/drm/bridge/ite-it6505.c                |   2 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   2 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   4 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |   2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              | 166 ++++++++++++---
 drivers/gpu/drm/bridge/sii902x.c                   |   2 +-
 drivers/gpu/drm/bridge/sii9234.c                   |   2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |   2 +-
 drivers/gpu/drm/bridge/tc358767.c                  | 197 ++++++++++++++++-
 drivers/gpu/drm/bridge/tc358768.c                  |   2 +-
 drivers/gpu/drm/bridge/tc358775.c                  |   2 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |   2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  21 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   2 +-
 drivers/gpu/drm/drm_fb_helper.c                    | 236 ++-------------------
 drivers/gpu/drm/drm_fbdev_dma.c                    |  11 +-
 drivers/gpu/drm/drm_fbdev_generic.c                |  11 +-
 drivers/gpu/drm/drm_file.c                         | 132 ++++++++++++
 drivers/gpu/drm/exynos/Kconfig                     |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   9 +-
 drivers/gpu/drm/gma500/Kconfig                     |   1 +
 drivers/gpu/drm/gma500/fbdev.c                     |   8 +-
 drivers/gpu/drm/i2c/tda9950.c                      |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/i915/Kconfig                       |   1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  14 +-
 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/msm_drv.c                      |  13 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |  17 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  15 ++
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 -
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |  73 ++++++-
 drivers/gpu/drm/mxsfb/lcdif_drv.h                  |   3 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  | 201 ++++++++++++------
 drivers/gpu/drm/omapdrm/Kconfig                    |   1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |  11 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  10 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |   2 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   2 +-
 drivers/gpu/drm/panel/panel-simple.c               |  37 +++-
 drivers/gpu/drm/radeon/Kconfig                     |   1 +
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   9 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |   2 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |   4 +-
 drivers/gpu/drm/stm/ltdc.c                         |   4 +-
 drivers/gpu/drm/tegra/Kconfig                      |   1 +
 drivers/gpu/drm/tegra/fbdev.c                      |   8 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |   1 -
 drivers/video/fbdev/Kconfig                        |  21 ++
 include/drm/bridge/samsung-dsim.h                  |   4 +
 include/drm/drm_drv.h                              |   7 +
 include/drm/drm_fb_helper.h                        |  83 +-------
 include/drm/drm_file.h                             |  32 +++
 include/drm/drm_gem.h                              |  32 +++
 include/linux/fb.h                                 | 112 ++++++++++
 82 files changed, 1206 insertions(+), 601 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
