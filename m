Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D6561325
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 09:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBE311219A;
	Thu, 30 Jun 2022 07:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33574112184;
 Thu, 30 Jun 2022 07:20:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D5BE121C34;
 Thu, 30 Jun 2022 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656573600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4eMp8hUdAb76tKhRqtL8MV/4D15zatFvTlc2D52sWv0=;
 b=mfo7meEATOmg4oOhMOoqt60qiibHArAIrmBiaieUewAJMpqfCBdf91e6fOiVdgPfIkArbp
 2E0Fb5fPw9lQQW9uv3PfLZSnDWcHbBAm0nrc/IQjxWgoO76N6nF6JLjjBQ4M+mrcYXk8sV
 EsTEOTA8P1jgHxlvWAVa8uEpXkg0KNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656573600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4eMp8hUdAb76tKhRqtL8MV/4D15zatFvTlc2D52sWv0=;
 b=uZnq3JjaKe8Y3P9UkRCTTP9MgezBL+0OnjgoaHWvqsg7hDUqxPHSakOc+k5sr2GUvmHQUw
 MKwTNuqbf8W0WdBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 983C513A5C;
 Thu, 30 Jun 2022 07:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xIe+I6BOvWIPLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Jun 2022 07:20:00 +0000
Date: Thu, 30 Jun 2022 09:19:59 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <Yr1On+eT1mCvIMzW@linux-uq9g>
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

this is the drm-misc-next PR for this week.

Best regards
Thomas

drm-misc-next-2022-06-30:
drm-misc-next for v5.20:

UAPI Changes:

 * fourcc: Update documentation

Cross-subsystem Changes:

 * iosys-map: Rework iosys_map_{rd,wr} for improved performance

 * vfio: Use aperture helpers

Core Changes:

 * aperture: Export for use with other subsystems

 * connector: Remove deprecated ida_simple_get()

 * crtc: Add helper with general state checks, convert drivers

 * format-helper: Add Kunit tests for RGB32 to RGB8

Driver Changes:

 * ast: Fix black screen on resume

 * bridge: tc358767: Simplify DSI lane handling

 * mcde: Fix ref-count leak

 * mxsfb/lcdif: Support i.MX8MP LCD controller

 * stm/ltdc: Support dynamic Z order; Support mirroring; Fixes and cleanups

 * vc4: Many small fixes throughout the driver
The following changes since commit 009a3a52791f31c57d755a73f6bc66fbdd8bd76c:

  drm/hyperv-drm: Include framebuffer and EDID headers (2022-06-22 16:07:38 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-06-30

for you to fetch changes up to 6fb5ee7cec06266a29f25ecc01a23b9d107f64e1:

  iosys-map: Add per-word write (2022-06-29 17:42:28 -0700)

----------------------------------------------------------------
drm-misc-next for v5.20:

UAPI Changes:

 * fourcc: Update documentation

Cross-subsystem Changes:

 * iosys-map: Rework iosys_map_{rd,wr} for improved performance

 * vfio: Use aperture helpers

Core Changes:

 * aperture: Export for use with other subsystems

 * connector: Remove deprecated ida_simple_get()

 * crtc: Add helper with general state checks, convert drivers

 * format-helper: Add Kunit tests for RGB32 to RGB8

Driver Changes:

 * ast: Fix black screen on resume

 * bridge: tc358767: Simplify DSI lane handling

 * mcde: Fix ref-count leak

 * mxsfb/lcdif: Support i.MX8MP LCD controller

 * stm/ltdc: Support dynamic Z order; Support mirroring; Fixes and cleanups

 * vc4: Many small fixes throughout the driver

----------------------------------------------------------------
Alex Williamson (1):
      vfio/pci: Remove console drivers

Alexander Stein (1):
      drm/panel: panel-simple: Add dev_err_probe if backlight could not be found

Bastian Krause (2):
      dt-bindings: display: simple: add Ampire AM-800600P5TMQW-TB8H panel
      drm/panel: simple: add AM-800600P5TMQW-TB8H

Bjorn Andersson (1):
      drm/panel-edp: Add LQ140M1JW48 edp panel entry

Bo Liu (1):
      drm/connector: Remove usage of the deprecated ida_simple_xxx API

Christian König (1):
      dma-buf: deprecate DMABUF_SYSFS_STATS

Dan Carpenter (2):
      drm: logicvc: Fix uninitialized variable in probe
      drm: logicvc: fix error code in logicvc_layer_init()

Dave Stevenson (21):
      drm/vc4: drv: Adopt the dma configuration from the HVS or V3D component
      drm/vc4: plane: Fix margin calculations for the right/bottom edges
      drm/vc4: plane: Add alpha_blend_mode property to each plane.
      drm/vc4: hvs: Add debugfs node that dumps the current display lists
      drm/vc4: dpi: Add support for composite syncs to vc4_dpi
      drm/vc4: dpi: Add option for inverting pixel clock and output enable
      drm/vc4: dpi: Ensure a default format is selected
      drm/vc4: dsi: Release workaround buffer and DMA
      drm/vc4: dsi: Correct DSI divider calculations
      drm/vc4: dsi: Correct pixel order for DSI0
      drm/vc4: dsi: Register dsi0 as the correct vc4 encoder type
      drm/vc4: dsi: Fix dsi0 interrupt support
      drm/vc4: dsi: Add correct stop condition to vc4_dsi_encoder_disable iteration
      drm/vc4: hdmi: Add all the vc5 HDMI registers into the debugfs dumps
      drm/vc4: hdmi: Reset HDMI MISC_CONTROL register
      drm/vc4: hdmi: Switch to pm_runtime_status_suspended
      drm/vc4: hdmi: Move HDMI reset to pm_resume
      drm/vc4: hdmi: Add HDMI format detection registers to register list
      drm/vc4: hdmi: Add MISC_CONTROL register for vc4
      drm/vc4: hdmi: Correct HDMI timing registers for interlaced modes
      drm/vc4: hdmi: Move pixel doubling from Pixelvalve to HDMI block

Dom Cobley (8):
      drm/vc4: plane: Remove subpixel positioning check
      drm/vc4: hdmi: Clear unused infoframe packet RAM registers
      drm/vc4: hdmi: Avoid full hdmi audio fifo writes
      drm/vc4: hdmi: Stop checking for enabled output in audio
      drm/vc4: hdmi: Skip writes to disabled packet RAM
      drm/vc4: hdmi: Remove VC4_HDMI_SCHEDULER_CONTROL_VERT_ALWAYS_KEEPOUT
      drm/vc4: hdmi: Report that 3d/stereo is allowed
      drm/vc4: hdmi: Force modeset when bpc or format changes

Hans de Goede (1):
      drm/nouveau/Kconfig: Drop duplicate "select ACPI_VIDEO"

Imre Deak (1):
      drm/fourcc: Document the Intel CCS modifiers' CC plane expected pitch

Jiang Jian (3):
      drm/panel: nt35510: Remove duplicate 'the' in two places.
      drm/pl111: drop unexpected word "the" in the comments
      drm/display/selftests: drop extra word 'for' in comments for MST selftests

Jiasheng Jiang (1):
      drm: bridge: adv7511: Add check for mipi_dsi_driver_register

Jocelyn Falempe (1):
      drm/ast: Fix black screen when getting out of suspend

Joel Selvaraj (4):
      dt-bindings: vendor-prefixes: Add prefix for EBBG
      dt-bindings: display: Add bindings for EBBG FT8719
      drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro
      drm/panel: introduce ebbg,ft8719 panel

José Expósito (3):
      drm/rect: Add DRM_RECT_INIT() macro
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb332()
      drm/doc: Add KUnit documentation

Julia Lawall (1):
      drm: fix device_node_continue.cocci warnings

KuoHsiang Chou (1):
      drm/ast: Fixed the casting issue reported by sparse

Lucas De Marchi (2):
      iosys-map: Add per-word read
      iosys-map: Add per-word write

Marek Vasut (4):
      drm/doc: Fix comment typo
      drm/bridge: tc358767: Do not cache dsi_lanes twice
      dt-bindings: lcdif: Add compatible for i.MX8MP
      drm: lcdif: Add support for i.MX8MP LCDIF variant

Mateusz Kwiatkowski (1):
      drm/vc4: hdmi: Fix timings for interlaced modes

Maxime Ripard (2):
      drm/vc4: kms: Warn if clk_set_min_rate fails
      drm/vc4: kms: Use maximum FIFO load for the HVS clock rate

Miaoqian Lin (1):
      drm/mcde: Fix refcount leak in mcde_dsi_bind

Phil Elwell (1):
      drm/vc4: hdmi: Disable audio if dmas property is present but empty

Philip Oberfichtner (2):
      dt-bindings: display: simple: Add DataImage FG1001L0DSSWMG01 compatible string
      drm/panel: simple: Add DataImage FG1001L0DSSWMG01 panel support

Stephen Kitt (5):
      drm/panel: sony-acx565akm: Use backlight helpers
      drm/panel: panel-dsi-cm: Use backlight helpers
      drm/panel: panel-asus-z00t-tm5p5-n35596: Use backlight helper
      drm: shmobile: Use backlight helper
      drm/bridge: parade-ps8622: Use backlight helper

Thomas Zimmermann (6):
      MAINTAINERS: Broaden scope of simpledrm entry
      drm: Implement DRM aperture helpers under video/
      drm/fb-helper: Fix out-of-bounds access
      drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()
      drm/simple-kms: Use drm_atomic_helper_check_crtc_state()
      drm/ast: Enable primary plane with CRTC

Yang Li (1):
      drm: Remove unnecessary print function dev_err()

Yang Yingliang (1):
      drm/logicvc: add missing of_node_put() in logicvc_layers_init()

Yannick Fertre (6):
      drm/stm: ltdc: disable all layers before crtc shutdown
      drm/stm: ltdc: remove error message about scaling
      drm/stm: ltdc: fix various coding-style warnings
      drm/stm: ltdc: add support of the dynamic z-order
      drm/stm: ltdc: add support of horizontal & vertical mirroring
      drm/stm: ltdc: update hardware error management

YueHaibing (1):
      drm/display: Fix build error without CONFIG_OF

 .../devicetree/bindings/display/fsl,lcdif.yaml     |   1 +
 .../bindings/display/panel/ebbg,ft8719.yaml        |  74 ++++
 .../bindings/display/panel/panel-simple.yaml       |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/driver-api/aperture.rst              |  13 +
 Documentation/driver-api/index.rst                 |   1 +
 Documentation/gpu/drm-internals.rst                |  32 ++
 MAINTAINERS                                        |  13 +-
 drivers/dma-buf/Kconfig                            |   6 +-
 drivers/gpu/drm/Kconfig                            |  16 +
 drivers/gpu/drm/Makefile                           |   3 +-
 drivers/gpu/drm/ast/ast_dp.c                       |  10 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  26 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  17 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |   6 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   6 +-
 drivers/gpu/drm/display/Kconfig                    |   2 +-
 drivers/gpu/drm/drm_aperture.c                     | 178 +-------
 drivers/gpu/drm/drm_atomic_helper.c                |  55 +++
 drivers/gpu/drm/drm_blend.c                        |   2 +-
 drivers/gpu/drm/drm_connector.c                    |  13 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  27 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |  14 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |   3 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c            |   7 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   1 +
 drivers/gpu/drm/mxsfb/Kconfig                      |  16 +
 drivers/gpu/drm/mxsfb/Makefile                     |   2 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  | 340 +++++++++++++++
 drivers/gpu/drm/mxsfb/lcdif_drv.h                  |  44 ++
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  | 484 +++++++++++++++++++++
 drivers/gpu/drm/mxsfb/lcdif_regs.h                 | 257 +++++++++++
 drivers/gpu/drm/nouveau/Kconfig                    |   1 -
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |   7 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c               |  29 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          | 285 ++++++++++++
 drivers/gpu/drm/panel/panel-edp.c                  |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   6 +-
 drivers/gpu/drm/panel/panel-simple.c               |  64 ++-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |  12 +-
 drivers/gpu/drm/pl111/pl111_display.c              |   2 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |   2 +-
 drivers/gpu/drm/shmobile/shmob_drm_backlight.c     |   6 +-
 drivers/gpu/drm/stm/drv.c                          |   1 +
 drivers/gpu/drm/stm/ltdc.c                         | 290 ++++++++----
 drivers/gpu/drm/stm/ltdc.h                         |   8 +-
 drivers/gpu/drm/tests/.kunitconfig                 |   3 +
 drivers/gpu/drm/tests/Makefile                     |   3 +
 drivers/gpu/drm/tests/drm_format_helper_test.c     | 161 +++++++
 drivers/gpu/drm/tiny/Kconfig                       |   1 +
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  14 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |  99 +++--
 drivers/gpu/drm/vc4/vc4_drv.c                      |  19 +
 drivers/gpu/drm/vc4/vc4_dsi.c                      | 152 +++++--
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 210 ++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  14 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |  38 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  42 ++
 drivers/gpu/drm/vc4/vc4_kms.c                      |   8 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  92 ++--
 drivers/vfio/pci/vfio_pci_core.c                   |   5 +
 drivers/video/Kconfig                              |   6 +
 drivers/video/Makefile                             |   2 +
 drivers/video/aperture.c                           | 351 +++++++++++++++
 drivers/video/console/Kconfig                      |   1 +
 drivers/video/fbdev/Kconfig                        |   7 +-
 include/drm/drm_atomic_helper.h                    |   2 +
 include/drm/drm_mipi_dsi.h                         |  17 +
 include/drm/drm_rect.h                             |  16 +
 include/linux/aperture.h                           |  56 +++
 include/linux/iosys-map.h                          |  80 +++-
 include/uapi/drm/drm_fourcc.h                      |   8 +-
 75 files changed, 3245 insertions(+), 565 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 create mode 100644 Documentation/driver-api/aperture.rst
 create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
 create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
 create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
 create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
 create mode 100644 drivers/gpu/drm/panel/panel-ebbg-ft8719.c
 create mode 100644 drivers/gpu/drm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/tests/Makefile
 create mode 100644 drivers/gpu/drm/tests/drm_format_helper_test.c
 create mode 100644 drivers/video/aperture.c
 create mode 100644 include/linux/aperture.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
