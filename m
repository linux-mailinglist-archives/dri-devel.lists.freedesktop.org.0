Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB66672A8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 13:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCDD10E2E8;
	Thu, 12 Jan 2023 12:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D31910E2E8;
 Thu, 12 Jan 2023 12:56:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 312B63F39E;
 Thu, 12 Jan 2023 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673528187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xJ3YKy9Mlmh9EFBuctWdWt367RFY/d+HPtgAdoYJC5g=;
 b=D9LPuXci+YXdWJ1lbkyLv0w1wgs1R4l7oAdNzMmSQrOhKhi2/2pw0CGPRz/FcTM5Qhxeov
 XRP3BJx0pY7j7r5T6oJi/wwO/YBjON4GRXwidTTH14Os+NpGoSWKWHLbjCZXP/XtcP67O2
 k2hSU0W9FjHil71qbkkKINUaAaVFI7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673528187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xJ3YKy9Mlmh9EFBuctWdWt367RFY/d+HPtgAdoYJC5g=;
 b=WfkGBg5JYiFbYZxZjlutDgQKGAqLGni+GXL1EuLHrktum3G8GyYbqWyxv8FnFoJSUBURKk
 Q8xeWoCLPD3lVgBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EECBC13776;
 Thu, 12 Jan 2023 12:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0ppVOXoDwGOnVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jan 2023 12:56:26 +0000
Date: Thu, 12 Jan 2023 13:56:25 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <Y8ADeSzZDj+tpibF@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

here's the drm-misc-next PR for this week.

Best regards
Thomas

drm-misc-next-2023-01-12:
drm-misc-next for v6.3:

UAPI Changes:

 * fourcc: Document Open Source user waiver

Cross-subsystem Changes:

 * firmware: fix color-format selection for system framebuffers

Core Changes:

 * format-helper: Add conversion from XRGB8888 to various sysfb formats;
   Make XRGB8888 the only driver-emulated legacy format

 * fb-helper: Avoid blank consoles from selecting an incorrect color format

 * probe-helper: Enable/disable HPD on connectors plus driver updates

 * Use drm_dbg_ helpers in several places

 * docs: Document defaults for CRTC backgrounds; Document use of drm_minor

Driver Changes:

 * arm/hdlcd: Use new debugfs helpers

 * gud: Use new debugfs helpers

 * panel: Support Visionox VTDR6130 AMOLED DSI; Support Himax HX8394; Convert
   many drivers to common generic DSI write-sequence helper

 * v3d: Do not opencode drm_gem_object_lookup()

 * vc4: Various HVS an CRTC fixes

 * vkms: Fix SEGFAULT from incorrect GEM-buffer mapping

 * Convert various drivers to i2c probe_new()
The following changes since commit 2591939e881cf728b6ac45971eeec2f58051c101:

  drm/virtio: Spiff out cmd queue/response traces (2023-01-02 17:51:27 +0300)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-01-12

for you to fetch changes up to 6e41acd2e5353c5362e0d5c2f5ba495c54ff555e:

  drm/vkms: reintroduce prepare_fb and cleanup_fb functions (2023-01-12 09:46:19 -0100)

----------------------------------------------------------------
drm-misc-next for v6.3:

UAPI Changes:

 * fourcc: Document Open Source user waiver

Cross-subsystem Changes:

 * firmware: fix color-format selection for system framebuffers

Core Changes:

 * format-helper: Add conversion from XRGB8888 to various sysfb formats;
   Make XRGB8888 the only driver-emulated legacy format

 * fb-helper: Avoid blank consoles from selecting an incorrect color format

 * probe-helper: Enable/disable HPD on connectors plus driver updates

 * Use drm_dbg_ helpers in several places

 * docs: Document defaults for CRTC backgrounds; Document use of drm_minor

Driver Changes:

 * arm/hdlcd: Use new debugfs helpers

 * gud: Use new debugfs helpers

 * panel: Support Visionox VTDR6130 AMOLED DSI; Support Himax HX8394; Convert
   many drivers to common generic DSI write-sequence helper

 * v3d: Do not opencode drm_gem_object_lookup()

 * vc4: Various HVS an CRTC fixes

 * vkms: Fix SEGFAULT from incorrect GEM-buffer mapping

 * Convert various drivers to i2c probe_new()

----------------------------------------------------------------
Abel Vesa (2):
      drm/panel-edp: fix name for IVO product id 854b
      drm/panel-edp: add IVO M133NW4J panel entry

Daniel Vetter (2):
      drm/fourcc: Document open source user waiver
      drm: document better that drivers shouldn't use drm_minor directly

Dave Stevenson (12):
      drm/vc4: hvs: Configure the HVS COB allocations
      drm/vc4: hvs: Set AXI panic modes
      drm/vc4: hvs: SCALER_DISPBKGND_AUTOHS is only valid on HVS4
      drm/vc4: hvs: Correct interrupt masking bit assignment for HVS5
      drm/vc4: hvs: Support zpos on all planes
      drm/vc4: hvs: Fix colour order for xRGB1555 on HVS5
      drm/vc4: hvs: Add DRM 210101010 RGB formats
      drm/vc4: plane: Allow using 0 as a pixel order value
      drm/vc4: plane: Omit pixel_order from the hvs_format for hvs5 only formats
      drm/vc4: plane: Add 3:3:2 and 4:4:4:4 RGB/RGBX/RGBA formats
      drm/vc4: Add comments for which HVS_PIXEL_ORDER_xxx defines apply
      drm/vc4: hdmi: Correct interlaced timings again

Dmitry Baryshkov (7):
      drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
      drm/probe-helper: enable and disable HPD on connectors
      drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
      drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
      drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
      drm/omap: stop using drm_bridge_connector_en/disable_hpd()
      drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()

Javier Martinez Canillas (17):
      drm/mipi-dsi: Fix mipi_dsi_dcs_write_seq() macro definition format
      drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
      dt-bindings: display: Add Himax HX8394 panel controller
      MAINTAINERS: Add entry for Himax HX8394 panel controller driver
      drm/panel-asus-z00t-tm5p5-n35596: Drop custom DSI write macros
      drm/panel-sitronix-st7703: Drop custom DSI write macros
      drm/panel-leadtek-ltk050h3146w: Drop custom DSI write macro
      drm/panel-elida-kd35t133: Drop custom DSI write macro
      drm/panel-boe-bf060y8m-aj0: Drop custom DSI write macro
      drm/panel-novatek-nt35950: Drop custom DSI write macro
      drm/panel-jdi-fhd-r63452: Drop custom DSI write macros
      drm/panel-samsung-s6e88a0-ams452ef01: Drop custom DSI write macro
      drm/panel-samsung-sofef00: Drop custom DSI write macro
      drm/panel-sharp-ls060t1sx01: Drop custom DSI write macro
      drm/panel-mantix-mlaf057we51: Drop custom DSI write macro
      drm/panel-sony-tulip-truly-nt35521: Drop custom DSI write macro
      drm/panel-xinpeng-xpp055c272: Drop custom DSI write macro

Kamil Trzciński (1):
      drm: panel: Add Himax HX8394 panel controller driver

Marek Szyprowski (1):
      drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion

Mateusz Kwiatkowski (2):
      drm/vc4: crtc: Fix timings for VEC modes
      drm/vc4: vec: Support progressive modes

Maxime Ripard (2):
      drm/bridge: panel: Prevent ERR_PTR Dereference
      drm/vc4: hvs: Ignore atomic_flush if we're disabled

Maíra Canal (6):
      drm/v3d: replace open-coded implementation of drm_gem_object_lookup
      drm/gud: use new debugfs device-centered functions
      drm/arm/hdlcd: use new debugfs device-centered functions
      drm/debugfs: use octal permissions instead of symbolic permissions
      drm/debugfs: add descriptions to struct parameters
      drm/vkms: reintroduce prepare_fb and cleanup_fb functions

Neil Armstrong (2):
      dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel
      drm/panel: add visionox vtdr6130 DSI panel driver

Sean Paul (1):
      drm/docs: Explicitly document default CRTC background behavior

Siddh Raman Pant (3):
      drm: Remove usage of deprecated DRM_DEBUG_PRIME
      drm/drm_blend: Remove usage of deprecated DRM_DEBUG_ATOMIC
      drm/drm_lease: Remove usage of deprecated DRM_DEBUG_LEASE

Simon Ser (1):
      doc: add dma-buf IOCTL code to table

Thomas Zimmermann (14):
      firmware/sysfb: Fix EFI/VESA format selection
      drm/format-helper: Comment on RGB888 byte order
      drm/format-helper: Fix test-input format conversion
      drm/format-helper: Store RGB565 in little-endian order
      drm/format-helper: Type fixes in format-helper tests
      drm/format-helper: Flip src/dst-format branches in blit helper
      drm/format-helper: Add conversion from XRGB8888 to ARGB8888
      drm/format-helper: Add conversion from XRGB8888 to ARGB2101010
      drm/format-helper: Add conversion from XRGB8888 to 15-bit RGB555 formats
      drm/fh-helper: Split fbdev single-probe helper
      drm/fb-helper: Fix single-probe color-format selection
      drm/format-helper: Simplify drm_fb_build_fourcc_list()
      drm/format-helper: Remove unnecessary conversion helpers
      drm/fb-helper: Replace bpp/depth parameter by color mode

Tvrtko Ursulin (1):
      drm: Replace DRM_DEBUG with drm_dbg_core in file and ioctl handling

Uwe Kleine-König (12):
      drm/mxsfb: improve clk handling for axi clk
      drm/i2c/ch7006: Convert to i2c's .probe_new()
      drm/i2c/sil164: Convert to i2c's .probe_new()
      drm/i2c/tda9950: Convert to i2c's .probe_new()
      drm/i2c/tda998x: Convert to i2c's .probe_new()
      drm/panel: olimex-lcd-olinuxino: Convert to i2c's .probe_new()
      drm/panel: raspberrypi-touchscreen: Convert to i2c's .probe_new()
      drm: Only select I2C_ALGOBIT for drivers that actually need it
      MAINTAINERS: drm/hisilicon: Drop Chen Feng
      drm/vc4: dsi: Drop unused i2c include
      drm/imx/dcss: Drop if blocks with always false condition
      drm/imx/dcss: Don't call dev_set_drvdata(..., NULL);

 .../bindings/display/panel/himax,hx8394.yaml       |  76 ++++
 .../bindings/display/panel/visionox,vtdr6130.yaml  |  53 +++
 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 MAINTAINERS                                        |   9 +-
 drivers/firmware/sysfb_simplefb.c                  |  43 +-
 drivers/gpu/drm/Kconfig                            |   1 -
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   2 +
 drivers/gpu/drm/arm/hdlcd_drv.c                    |  24 +-
 drivers/gpu/drm/ast/Kconfig                        |   2 +
 drivers/gpu/drm/bridge/panel.c                     |   9 +-
 drivers/gpu/drm/drm_blend.c                        |  13 +-
 drivers/gpu/drm/drm_bridge_connector.c             |  27 +-
 drivers/gpu/drm/drm_debugfs.c                      |  12 +-
 drivers/gpu/drm/drm_fb_helper.c                    | 256 +++++++-----
 drivers/gpu/drm/drm_file.c                         |  18 +-
 drivers/gpu/drm/drm_format_helper.c                | 462 +++++++++++++++------
 drivers/gpu/drm/drm_gem_dma_helper.c               |   4 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   2 +-
 drivers/gpu/drm/drm_ioc32.c                        |  13 +-
 drivers/gpu/drm/drm_ioctl.c                        |  25 +-
 drivers/gpu/drm/drm_lease.c                        |  64 +--
 drivers/gpu/drm/drm_plane.c                        |   5 +
 drivers/gpu/drm/drm_probe_helper.c                 |  40 +-
 drivers/gpu/drm/gma500/Kconfig                     |   2 +
 drivers/gpu/drm/gud/gud_drv.c                      |  17 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |   2 +
 drivers/gpu/drm/i2c/ch7006_drv.c                   |   4 +-
 drivers/gpu/drm/i2c/sil164_drv.c                   |   4 +-
 drivers/gpu/drm/i2c/tda9950.c                      |   5 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   4 +-
 drivers/gpu/drm/i915/Kconfig                       |   2 +
 drivers/gpu/drm/imx/dcss/dcss-dev.c                |   6 -
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |   7 -
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |   2 -
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   2 +-
 drivers/gpu/drm/mgag200/Kconfig                    |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   2 -
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  10 +-
 drivers/gpu/drm/nouveau/Kconfig                    |   2 +
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  41 --
 drivers/gpu/drm/panel/Kconfig                      |  20 +
 drivers/gpu/drm/panel/Makefile                     |   2 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |  96 ++---
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |  42 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   3 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |  46 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         | 451 ++++++++++++++++++++
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |  58 +--
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 106 +++--
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |  24 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |  14 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |   5 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   5 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |  44 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  24 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |  19 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      | 341 ++++++++-------
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c | 398 +++++++++---------
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    | 358 ++++++++++++++++
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 112 +++--
 drivers/gpu/drm/radeon/Kconfig                     |   2 +
 drivers/gpu/drm/tests/drm_format_helper_test.c     | 386 ++++++++++++++++-
 drivers/gpu/drm/tiny/ofdrm.c                       |  27 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |  28 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   7 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  71 ++--
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   1 -
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   5 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      | 175 ++++++--
 drivers/gpu/drm/vc4/vc4_kms.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_plane.c                    | 139 ++++++-
 drivers/gpu/drm/vc4/vc4_regs.h                     |  20 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |   4 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |  36 +-
 include/drm/drm_bridge_connector.h                 |   2 -
 include/drm/drm_debugfs.h                          |  18 +
 include/drm/drm_device.h                           |  17 +-
 include/drm/drm_format_helper.h                    |  16 +-
 include/drm/drm_mipi_dsi.h                         |  39 +-
 include/drm/drm_modeset_helper_vtables.h           |  22 +
 include/uapi/drm/drm_fourcc.h                      |  12 +
 81 files changed, 3120 insertions(+), 1351 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8394.c
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
