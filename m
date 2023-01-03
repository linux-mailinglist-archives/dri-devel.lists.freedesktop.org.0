Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F0265BE6B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 11:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACE889444;
	Tue,  3 Jan 2023 10:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 95816 seconds by postgrey-1.36 at gabe;
 Tue, 03 Jan 2023 10:51:50 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D79E89070;
 Tue,  3 Jan 2023 10:51:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A48B385AC;
 Tue,  3 Jan 2023 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672743108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J3UcIIxBhr+6pMb4QCPN39ytw+EZQ/hj5bau3xtKw4I=;
 b=fIpQOuU/a4rwM9M7q73p5h5Lx/Rxxnkl6+E83XpdlkXgRAc29mOnE1w0DeMNf7pMZ8Jbwi
 nTD186FrUDqY3nkpkSsibEJh/2RMWWEk0O7D/KbRfU/EO5kKrr+WlLRhisC4ZZtw6C02Re
 KbYentyKb3MKONsvB2Bvy6JEbeiJ3XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672743108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J3UcIIxBhr+6pMb4QCPN39ytw+EZQ/hj5bau3xtKw4I=;
 b=4Vkk2jLMJFnCyRJ4aUJqr3lD2DTmdbfaigXe8OxJ6djnfof8fgVeuJH7ZikWn21d0SaIr5
 +QBeVdOnZw0abFBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 237E51390C;
 Tue,  3 Jan 2023 10:51:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pQy8B8QItGP5TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Jan 2023 10:51:48 +0000
Date: Tue, 3 Jan 2023 11:51:46 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <Y7QIwlfElAYWxRcR@linux-uq9g>
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

here's the first PR for drm-misc-next for the upcomming version v6.3
of the Linux kernel. Overall, it's fairly small; due to holidays, I
guess. Noteworthy changes are in connector TV-mode handling, KUnit tests
and MIPI helpers.

Best regards
Thomas

drm-misc-next-2023-01-03:
drm-misc-next for v6.3:

UAPI Changes:

 * connector: Support analog-TV mode property

 * media: Add MEDIA_BUS_FMT_RGB565_1X24_CPADHI,
   MEDIA_BUS_FMT_RGB666_1X18 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI

Cross-subsystem Changes:

 * dma-buf: Documentation fixes

 * i2c: Introduce i2c_client_get_device_id() helper

Core Changes:

 * Improve support for analog TV output

 * bridge: Remove unused drm_bridge_chain functions

 * debugfs: Add per-device helpers and convert various DRM drivers

 * dp-mst: Various fixes

 * fbdev emulation: Always pick 32 bpp as default

 * KUnit: Add tests for managed helpers; Various cleanups

 * panel-orientation: Add quirks for Lenovo Yoga Tab 3 X90F and DynaBook K50

 * TTM: Open-code ttm_bo_wait() and remove the helper

Driver Changes:

 * Fix preferred depth and bpp values throughout DRM drivers

 * Remove #CONFIG_PM guards throughout DRM drivers

 * ast: Various fixes

 * bridge: Implement i2c's probe_new in various drivers; Fixes; ite-it6505:
   Locking fixes, Cache EDID data; ite-it66121: Support IT6610 chip,
   Cleanups; lontium-tl9611: Fix HDMI on DragonBoard 845c; parade-ps8640:
   Use atomic bridge functions

 * gud: Convert to DRM shadow-plane helpers; Perform flushing synchronously
   during atomic update

 * ili9486: Support 16-bit pixel data

 * imx: Split off IPUv3 driver; Various fixes

 * mipi-dbi: Convert to DRM shadow-plane helpers plus rsp driver changes;
   Support separate I/O-voltage supply

 * mxsfb: Depend on ARCH_MXS or ARCH_MXC

 * omapdrm: Various fixes

 * panel: Use ktime_get_boottime() to measure power-down delay in various
   drivers; Fix auto-suspend delay in various drivers; orisetech-ota5601a:
   Add support

 * sprd: Cleanups

 * sun4i: Convert to new TV-mode property

 * tidss: Various fixes

 * v3d: Various fixes

 * vc4: Convert to new TV-mode property; Support Kunit tests; Cleanups;
   dpi: Support RGB565 and RGB666 formats; dsi: Convert DSI driver to
   bridge

 * virtio: Improve tracing

 * vkms: Support small cursors in IGT tests; Various fixes
The following changes since commit d47f9580839eb6fe568e38b2084d94887fbf5ce0:

  Backmerge tag 'v6.1-rc6' into drm-next (2022-11-24 11:05:43 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-01-03

for you to fetch changes up to 2591939e881cf728b6ac45971eeec2f58051c101:

  drm/virtio: Spiff out cmd queue/response traces (2023-01-02 17:51:27 +0300)

----------------------------------------------------------------
drm-misc-next for v6.3:

UAPI Changes:

 * connector: Support analog-TV mode property

 * media: Add MEDIA_BUS_FMT_RGB565_1X24_CPADHI,
   MEDIA_BUS_FMT_RGB666_1X18 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI

Cross-subsystem Changes:

 * dma-buf: Documentation fixes

 * i2c: Introduce i2c_client_get_device_id() helper

Core Changes:

 * Improve support for analog TV output

 * bridge: Remove unused drm_bridge_chain functions

 * debugfs: Add per-device helpers and convert various DRM drivers

 * dp-mst: Various fixes

 * fbdev emulation: Always pick 32 bpp as default

 * KUnit: Add tests for managed helpers; Various cleanups

 * panel-orientation: Add quirks for Lenovo Yoga Tab 3 X90F and DynaBook K50

 * TTM: Open-code ttm_bo_wait() and remove the helper

Driver Changes:

 * Fix preferred depth and bpp values throughout DRM drivers

 * Remove #CONFIG_PM guards throughout DRM drivers

 * ast: Various fixes

 * bridge: Implement i2c's probe_new in various drivers; Fixes; ite-it6505:
   Locking fixes, Cache EDID data; ite-it66121: Support IT6610 chip,
   Cleanups; lontium-tl9611: Fix HDMI on DragonBoard 845c; parade-ps8640:
   Use atomic bridge functions

 * gud: Convert to DRM shadow-plane helpers; Perform flushing synchronously
   during atomic update

 * ili9486: Support 16-bit pixel data

 * imx: Split off IPUv3 driver; Various fixes

 * mipi-dbi: Convert to DRM shadow-plane helpers plus rsp driver changes;i
   Support separate I/O-voltage supply

 * mxsfb: Depend on ARCH_MXS or ARCH_MXC

 * omapdrm: Various fixes

 * panel: Use ktime_get_boottime() to measure power-down delay in various
   drivers; Fix auto-suspend delay in various drivers; orisetech-ota5601a:
   Add support

 * sprd: Cleanups

 * sun4i: Convert to new TV-mode property

 * tidss: Various fixes

 * v3d: Various fixes

 * vc4: Convert to new TV-mode property; Support Kunit tests; Cleanups;
   dpi: Support RGB565 and RGB666 formats; dsi: Convert DSI driver to
   bridge

 * virtio: Improve tracing

 * vkms: Support small cursors in IGT tests; Various fixes

----------------------------------------------------------------
Alaa Emad (1):
      drm/vkms: change min cursor size to accept smaller values

Allen Ballway (1):
      drm: panel-orientation-quirks: Add quirk for DynaBook K50

Andrew Davis (1):
      drm/tidss: Set max DMA segment size

Carlo Caione (2):
      drm/tiny: ili9486: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers

Chris Morgan (2):
      media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
      drm/vc4: dpi: Support RGB565 format

Christian König (6):
      drm/ttm: remove ttm_bo_(un)lock_delayed_workqueue
      drm/ttm: use per BO cleanup workers
      drm/ttm: merge ttm_bo_api.h and ttm_bo_driver.h v2
      drm/ttm: use ttm_bo_wait_ctx instead of ttm_bo_wait
      drm/i915: stop using ttm_bo_wait
      drm/qxl: stop using ttm_bo_wait

Christophe Branchereau (2):
      drm/panel: add the orisetech ota5601a
      dt-bindings: display/panel: Add the Focaltech gpt3

Dave Stevenson (13):
      drm/vc4: dpi: Change the default DPI format to being 18bpp, not 24.
      drm/vc4: dpi: Fix format mapping for RGB565
      drm/mediatek: dp: Replace usage of drm_bridge_chain_ functions
      drm/bridge: Introduce pre_enable_prev_first to alter bridge init order
      drm/panel: Add prepare_prev_first flag to drm_panel
      drm/bridge: Document the expected behaviour of DSI host controllers
      drm/vc4: dsi: Rename bridge to out_bridge
      drm/vc4: dsi: Move initialisation to encoder_mode_set
      drm/vc4: dsi: Remove splitting the bridge chain from the driver
      drm/vc4: dsi: Convert to use atomic operations
      drm/vc4: dsi: Convert to using a bridge instead of encoder
      drm/vc4: dsi: Remove entry to ULPS from vc4_dsi post_disable
      drm/bridge: panel: Set pre_enable_prev_first from drmm_panel_bridge_add

Deepak R Varma (1):
      drm/sprd: remove redundant error logging

Drew Davenport (5):
      drm/panel-edp: Use ktime_get_boottime for delays
      drm/panel-samsung-atna33xc20: Use ktime_get_boottime for delays
      drm/panel-simple: Use ktime_get_boottime for delays
      drm/bridge/parade-ps8640: Extend autosuspend
      drm/panel-samsung-atna33xc20: Extend autosuspend delay

Frieder Schrempf (1):
      drm/bridge: ti-sn65dsi83: Fix delay after reset deassert to match spec

Geert Uytterhoeven (2):
      drm: mxsfb: DRM_IMX_LCDIF should depend on ARCH_MXC
      drm: mxsfb: DRM_MXSFB should depend on ARCH_MXS || ARCH_MXC

Hans de Goede (1):
      drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Tab 3 X90F

Imre Deak (3):
      drm/display/dp_mst: Fix down/up message handling after sink disconnect
      drm/display/dp_mst: Fix down message handling after a packet reception error
      drm/display/dp_mst: Fix payload addition on a disconnected sink

Jani Nikula (1):
      drm/audio: make drm_audio_component.h self-contained

Joerg Quinten (3):
      media: uapi: add MEDIA_BUS_FMT_BGR666_1X18
      media: uapi: add MEDIA_BUS_FMT_BGR666_1X24_CPADHI
      drm/vc4: dpi: Support BGR666 formats

Liang He (1):
      gpu: ipu-v3: common: Add of_node_put() for reference returned by of_graph_get_port_by_id()

Lucas Stach (1):
      drm/imx: move IPUv3 driver into separate subdirectory

Mateusz Kwiatkowski (2):
      drm/vc4: vec: Check for VEC output constraints
      drm/vc4: vec: Add support for more analog TV standards

Matti Vaittinen (2):
      drm/bridge: sii902x: Use devm_regulator_bulk_get_enable()
      drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()

Maxime Ripard (50):
      drm/tests: client: Mention that we can't use MODULE_ macros
      drm/connector: Rename legacy TV property
      drm/connector: Only register TV mode property if present
      drm/connector: Rename drm_mode_create_tv_properties
      drm/connector: Add TV standard property
      drm/modes: Add a function to generate analog display modes
      drm/connector: Add a function to lookup a TV mode by its name
      drm/modes: Introduce the tv_mode property as a command-line option
      drm/modes: Properly generate a drm_display_mode from a named mode
      drm/client: Remove match on mode name
      drm/modes: Introduce more named modes
      drm/atomic-helper: Add a TV properties reset helper
      drm/atomic-helper: Add an analog TV atomic_check implementation
      drm/vc4: vec: Use TV Reset implementation
      drm/vc4: vec: Convert to the new TV mode property
      drm/sun4i: tv: Convert to the new TV mode property
      drm/atomic: Constify the old/new state accessors
      drm/vc4: Constify container_of wrappers
      drm/vc4: kms: Constify the HVS old/new state helpers
      drm/vc4: kms: Sort the CRTCs by output before assigning them
      drm/vc4: txp: Reorder the variable assignments
      drm/vc4: Add TXP encoder type
      drm/vc4: txp: Initialise the CRTC before the encoder and connector
      drm/vc4: crtc: Pass the device and data in vc4_crtc_init
      drm/vc4: crtc: Provide a CRTC name
      drm/tests: helpers: Add missing export
      drm/doc: Fix title underline length
      drm/modes: Use strscpy() to copy command-line mode name
      drm/tests: probe_helper: Fix uninitialized variable
      drm/tests: helpers: Move the helper header to include/drm
      drm/tests: Introduce a config option for the KUnit helpers
      drm/tests: helpers: Document drm_kunit_device_init()
      drm/tests: helpers: Switch to EXPORT_SYMBOL_GPL
      drm/tests: helpers: Rename the device init helper
      drm/tests: helpers: Remove the name parameter
      drm/tests: helpers: Create the device in another function
      drm/tests: helpers: Switch to a platform_device
      drm/tests: helpers: Make sure the device is bound
      drm/tests: helpers: Allow for a custom device struct to be allocated
      drm/tests: helpers: Allow to pass a custom drm_driver
      drm/tests: Add a test for DRM managed actions
      drm/vc4: Move HVS state to main header
      drm/vc4: crtc: Introduce a lower-level crtc init helper
      drm/vc4: crtc: Make encoder lookup helper public
      drm/vc4: hvs: Provide a function to initialize the HVS structure
      drm/vc4: tests: Introduce a mocking infrastructure
      drm/vc4: tests: Fail the current test if we access a register
      drm/vc4: tests: Add unit test suite for the PV muxing
      Documentation: gpu: vc4: Add KUnit Tests Section
      drm/vc4: Improve the KUnit documentation

Maíra Canal (8):
      drm/debugfs: create device-centered debugfs functions
      drm: use new debugfs device-centered functions on DRM core files
      drm/debugfs: create debugfs late register functions
      drm/vc4: use new debugfs device-centered functions
      drm/v3d: use new debugfs device-centered functions
      drm/vkms: use new debugfs device-centered functions
      drm/todo: update the debugfs clean up task
      drm/vc4: drop all currently held locks if deadlock happens

Melissa Wen (2):
      drm/v3d: cleanup BOs properly when lookup_bos fails
      drm/v3d: replace obj lookup steps with drm_gem_objects_lookup

Noralf Trønnes (8):
      drm/probe-helper: Provide a TV get_modes helper
      drm/gud: Fix UBSAN warning
      drm/gud: Don't retry a failed framebuffer flush
      drm/gud: Split up gud_flush_work()
      drm/gud: Prepare buffer for CPU access in gud_flush_work()
      drm/gud: Use the shadow plane helper
      drm/gud: Enable synchronous flushing by default
      drm/gud: Fix missing include

Otto Pflüger (3):
      drm/mipi-dbi: Support separate I/O regulator
      drm/tiny: panel-mipi-dbi: Read I/O supply from DT
      dt-bindings: display: panel: mipi-dbi-spi: Add io-supply

Paul Cercueil (20):
      drm: atmel-hlcdc: Remove #ifdef guards for PM related functions
      drm: imx/dcss: Remove #ifdef guards for PM related functions
      drm: panfrost: Remove #ifdef guards for PM related functions
      drm: rcar-du: Remove #ifdef guards for PM related functions
      drm: shmobile: Remove #ifdef guards for PM related functions
      drm: tilcdc: Remove #ifdef guards for PM related functions
      drm: vboxvideo: Remove #ifdef guards for PM related functions
      drm: gm12u320: Remove #ifdef guards for PM related functions
      drm/i915/gt: Remove #ifdef guards for PM related functions
      drm: exynos: Remove #ifdef guards for PM related functions
      dt-bindings: display: bridge: it66121: Add compatible string for IT6610
      drm: bridge: it66121: Use devm_regulator_bulk_get_enable()
      drm: bridge: it66121: Use regmap_noinc_read()
      drm: bridge: it66121: Write AVI infoframe with regmap_bulk_write()
      drm: bridge: it66121: Fix wait for DDC ready
      drm: bridge: it66121: Don't use DDC error IRQs
      drm: bridge: it66121: Don't clear DDC FIFO twice
      drm: bridge: it66121: Set DDC preamble only once before reading EDID
      drm: bridge: it66121: Move VID/PID to new it66121_chip_info structure
      drm: bridge: it66121: Add support for the IT6610

Philipp Zabel (1):
      drm/imx: ipuv3-plane: Fix overlay plane width

Pin-yen Lin (2):
      drm/bridge: it6505: Guard bridge power in IRQ handler
      drm/bridge: it6505: Add caching for EDID

Randolph Sapp (1):
      drm: tidss: Fix pixel format definition

Rob Clark (1):
      drm/virtio: Spiff out cmd queue/response traces

Robert Foss (2):
      Merge branch 'i2c/client_device_id_helper-immutable' of https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux into drm-misc-next
      drm/bridge: lt9611: Fix PLL being unable to lock

Sam Ravnborg (2):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions

Shang XiaoJing (1):
      drm/vc4: vec: Use pm_runtime_resume_and_get() in vc4_vec_encoder_enable()

Stefan Eichenberger (1):
      drm/bridge: lt8912b: Add hot plug detection

T.J. Mercier (1):
      dma-buf: A collection of typo and documentation fixes

Thomas Zimmermann (17):
      Merge drm/drm-next into drm-misc-next
      drm/hisilicon/hibmc: Fix preferred depth and bpp
      drm/logicvc: Fix preferred fbdev cpp
      drm/cirrus: Decouple fbdev bpp value from color depth
      drm/ofdrm: Set preferred depth from format of scanout buffer
      drm/simpledrm: Set preferred depth from format of scanout buffer
      drm/solomon: Set preferred color depth and bpp to the correct values
      drm/fb-helper: Don't use the preferred depth for the BPP default
      drm/simple-kms: Remove drm_gem_simple_display_pipe_prepare_fb()
      drm/ili9225: Call MIPI DBI mode_valid helper
      drm/st7586: Call MIPI DBI mode_valid helper
      drm/mipi-dbi: Initialize default driver functions with macro
      drm/mipi-dbi: Prepare framebuffer copy operation in pipe-update helpers
      drm/mipi-dbi: Support shadow-plane state
      drm/mipi-dbi: Use shadow-plane mappings
      drm/mipi-dbi: Move drm_dev_{enter, exit}() out from fb_dirty functions
      drm/ast: Init iosys_map pointer as I/O memory for damage handling

Tomi Valkeinen (1):
      drm/omap: dsi: Fix excessive stack usage

Uwe Kleine-König (25):
      drm/bridge: ti-sn65dsi86: Convert to i2c's .probe_new()
      drm/bridge: chrontel-ch7033: Convert to i2c's .probe_new()
      drm/bridge/analogix/anx6345: Convert to i2c's .probe_new()
      drm/bridge/analogix/anx78xx: Convert to i2c's .probe_new()
      drm/bridge: anx7625: Convert to i2c's .probe_new()
      drm/bridge: icn6211: Convert to i2c's .probe_new()
      drm/bridge: it6505: Convert to i2c's .probe_new()
      drm/bridge: it66121: Convert to i2c's .probe_new()
      drm/bridge: lt8912b: Convert to i2c's .probe_new()
      drm/bridge: lt9211: Convert to i2c's .probe_new()
      drm/bridge: lt9611: Convert to i2c's .probe_new()
      drm/bridge: lt9611uxc: Convert to i2c's .probe_new()
      drm/bridge: megachips: Convert to i2c's .probe_new()
      drm/bridge: nxp-ptn3460: Convert to i2c's .probe_new()
      drm/bridge: sii902x: Convert to i2c's .probe_new()
      drm/bridge: sii9234: Convert to i2c's .probe_new()
      drm/bridge: sii8620: Convert to i2c's .probe_new()
      drm/bridge: tc358767: Convert to i2c's .probe_new()
      drm/bridge: tc358768: Convert to i2c's .probe_new()
      drm/bridge/tc358775: Convert to i2c's .probe_new()
      drm/bridge: tfp410: Convert to i2c's .probe_new()
      drm/bridge: adv7511: Convert to i2c's .probe_new()
      drm/bridge: parade-ps8622: Convert to i2c's .probe_new()
      drm/bridge: ti-sn65dsi83: Convert to i2c's .probe_new()
      drm/drv: Make use of local variable driver in drm_dev_register()

Xin Ji (1):
      drm/bridge: anx7625: keep last configure timing

Yuan Can (4):
      drm/bridge: megachips: Fix error handling in i2c_register_driver()
      drm/vkms: Fix memory leak in vkms_init()
      drm/vkms: Fix null-ptr-deref in vkms_release()
      drm/omapdrm: Remove unused struct csc_coef_rgb2yuv

allen chen (2):
      dt-bindings: it6505: add properties to restrict output bandwidth
      drm/bridge: add it6505 driver to read data-lanes and link-frequencies from dt

 .../bindings/display/bridge/ite,it6505.yaml        |   68 +-
 .../bindings/display/bridge/ite,it66121.yaml       |    4 +-
 .../bindings/display/panel/focaltech,gpt3.yaml     |   56 ++
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |    8 +-
 Documentation/fb/modedb.rst                        |    5 +
 Documentation/gpu/drm-kms-helpers.rst              |    7 +
 Documentation/gpu/drm-kms.rst                      |    6 +
 Documentation/gpu/drm-uapi.rst                     |   12 +-
 Documentation/gpu/todo.rst                         |   13 +-
 Documentation/gpu/vc4.rst                          |   19 +
 .../userspace-api/media/v4l/subdev-formats.rst     |  111 +++
 MAINTAINERS                                        |    2 +-
 drivers/dma-buf/dma-buf.c                          |   14 +-
 drivers/dma-buf/udmabuf.c                          |   28 +
 drivers/gpu/drm/Kconfig                            |    7 +
 drivers/gpu/drm/Makefile                           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h         |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    1 +
 drivers/gpu/drm/ast/ast_mode.c                     |    2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    9 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    5 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    5 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |    5 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    6 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    5 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |    5 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  132 ++-
 drivers/gpu/drm/bridge/ite-it66121.c               |  320 +++---
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   26 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    5 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    6 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    5 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   16 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    5 +-
 drivers/gpu/drm/bridge/panel.c                     |    4 +
 drivers/gpu/drm/bridge/parade-ps8622.c             |    6 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   22 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   31 +-
 drivers/gpu/drm/bridge/sii9234.c                   |    5 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    5 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    4 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    5 +-
 drivers/gpu/drm/bridge/tc358775.c                  |    4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    8 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    5 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    5 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   12 +-
 drivers/gpu/drm/drm_atomic.c                       |   23 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  124 +++
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_bridge.c                       |  294 +++---
 drivers/gpu/drm/drm_client.c                       |   11 +-
 drivers/gpu/drm/drm_client_modeset.c               |    4 -
 drivers/gpu/drm/drm_connector.c                    |  173 +++-
 drivers/gpu/drm/drm_debugfs.c                      |  102 +-
 drivers/gpu/drm/drm_drv.c                          |    7 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   30 +-
 drivers/gpu/drm/drm_fbdev_generic.c                |   15 +-
 drivers/gpu/drm/drm_fourcc.c                       |    4 +
 drivers/gpu/drm/drm_framebuffer.c                  |   11 +-
 drivers/gpu/drm/drm_gem.c                          |   19 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   31 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    4 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    2 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   12 +-
 drivers/gpu/drm/drm_internal.h                     |    5 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |  158 ++-
 drivers/gpu/drm/drm_mode_config.c                  |   10 +-
 drivers/gpu/drm/drm_modes.c                        |  546 +++++++++-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   33 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   82 ++
 drivers/gpu/drm/drm_simple_kms_helper.c            |    2 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |   13 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   12 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |   10 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |   11 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |   12 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |   12 +-
 drivers/gpu/drm/gud/gud_connector.c                |   10 +-
 drivers/gpu/drm/gud/gud_drv.c                      |    1 +
 drivers/gpu/drm/gud/gud_internal.h                 |    1 +
 drivers/gpu/drm/gud/gud_pipe.c                     |  223 +++--
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    4 +-
 drivers/gpu/drm/i2c/ch7006_drv.c                   |    8 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   11 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |    8 +-
 drivers/gpu/drm/i915/i915_deps.c                   |    2 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    2 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |    3 +-
 drivers/gpu/drm/imx/Kconfig                        |   41 +-
 drivers/gpu/drm/imx/Makefile                       |   10 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.c                |   17 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.h                |    7 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |    8 +-
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |   41 +
 drivers/gpu/drm/imx/ipuv3/Makefile                 |   11 +
 drivers/gpu/drm/imx/{ => ipuv3}/dw_hdmi-imx.c      |    0
 drivers/gpu/drm/imx/{ => ipuv3}/imx-drm-core.c     |    0
 drivers/gpu/drm/imx/{ => ipuv3}/imx-drm.h          |    0
 drivers/gpu/drm/imx/{ => ipuv3}/imx-ldb.c          |    0
 drivers/gpu/drm/imx/{ => ipuv3}/imx-tve.c          |    0
 drivers/gpu/drm/imx/{ => ipuv3}/ipuv3-crtc.c       |    0
 drivers/gpu/drm/imx/{ => ipuv3}/ipuv3-plane.c      |   14 +-
 drivers/gpu/drm/imx/{ => ipuv3}/ipuv3-plane.h      |    0
 drivers/gpu/drm/imx/{ => ipuv3}/parallel-display.c |    0
 drivers/gpu/drm/logicvc/logicvc_drm.c              |   13 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    4 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   23 +-
 drivers/gpu/drm/mxsfb/Kconfig                      |    2 +
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |    6 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    3 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |    1 +
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |    1 +
 drivers/gpu/drm/omapdrm/dss/dispc.c                |    5 -
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   26 +-
 drivers/gpu/drm/panel/Kconfig                      |    9 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-edp.c                  |    8 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    6 +-
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |  364 +++++++
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   10 +-
 drivers/gpu/drm/panel/panel-simple.c               |    6 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   10 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |    4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    7 +-
 drivers/gpu/drm/qxl/qxl_cmd.c                      |   16 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    3 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |    4 +-
 drivers/gpu/drm/radeon/radeon.h                    |    3 +-
 drivers/gpu/drm/radeon/radeon_device.c             |    5 -
 drivers/gpu/drm/radeon/radeon_pm.c                 |    4 +-
 drivers/gpu/drm/radeon/radeon_prime.c              |    2 +
 drivers/gpu/drm/radeon/radeon_ttm.c                |    4 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    9 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |    2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |    4 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |    9 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |    4 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    4 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |  141 +--
 drivers/gpu/drm/tests/Makefile                     |    8 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |  110 ++-
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |   68 ++
 drivers/gpu/drm/tests/drm_connector_test.c         |   76 ++
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  105 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.h          |   11 -
 drivers/gpu/drm/tests/drm_managed_test.c           |   71 ++
 drivers/gpu/drm/tests/drm_modes_test.c             |  158 +++
 drivers/gpu/drm/tests/drm_probe_helper_test.c      |  218 ++++
 drivers/gpu/drm/tidss/tidss_dispc.c                |    6 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    9 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    2 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   15 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    6 +-
 drivers/gpu/drm/tiny/ili9225.c                     |   36 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9486.c                     |   20 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    5 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |   13 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   10 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    4 +-
 drivers/gpu/drm/tiny/st7586.c                      |   39 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  211 ++--
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  111 ++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |   19 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |   26 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |    6 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |    3 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    2 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    3 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |    3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |   22 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   55 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    6 +-
 drivers/gpu/drm/vc4/Kconfig                        |   16 +
 drivers/gpu/drm/vc4/Makefile                       |    7 +
 drivers/gpu/drm/vc4/tests/.kunitconfig             |   13 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |  200 ++++
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |   63 ++
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c          |   41 +
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c        |  138 +++
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |   47 +
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 1039 ++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_bo.c                       |   10 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  144 ++-
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   36 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |   34 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |    5 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  148 ++-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  186 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   23 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |    4 +
 drivers/gpu/drm/vc4/vc4_hvs.c                      |   97 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  138 +--
 drivers/gpu/drm/vc4/vc4_txp.c                      |   62 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   14 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |  361 +++++--
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    3 +
 drivers/gpu/drm/virtio/virtgpu_trace.h             |   26 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   13 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   27 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c                |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c     |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    1 -
 drivers/gpu/ipu-v3/ipu-common.c                    |    1 +
 drivers/i2c/i2c-core-base.c                        |   14 +
 drivers/video/fbdev/core/fb_defio.c                |   16 -
 include/drm/drm_atomic.h                           |   32 +-
 include/drm/drm_atomic_state_helper.h              |    4 +
 include/drm/drm_audio_component.h                  |    3 +
 include/drm/drm_bridge.h                           |   36 +-
 include/drm/drm_connector.h                        |   82 +-
 include/drm/drm_debugfs.h                          |   41 +
 include/drm/drm_device.h                           |   15 +
 include/drm/drm_fb_helper.h                        |    2 +
 include/drm/drm_gem.h                              |    1 +
 include/drm/drm_gem_atomic_helper.h                |    2 -
 include/drm/drm_gem_ttm_helper.h                   |    3 +-
 include/drm/drm_gem_vram_helper.h                  |    4 +-
 include/drm/drm_kunit_helpers.h                    |   91 ++
 include/drm/drm_mipi_dbi.h                         |   43 +-
 include/drm/drm_mode_config.h                      |   12 +-
 include/drm/drm_modes.h                            |   17 +
 include/drm/drm_panel.h                            |   10 +
 include/drm/drm_plane.h                            |    4 +-
 include/drm/drm_probe_helper.h                     |    1 +
 include/drm/drm_simple_kms_helper.h                |    4 +-
 include/drm/ttm/{ttm_bo_api.h => ttm_bo.h}         |  371 ++++---
 include/drm/ttm/ttm_bo_driver.h                    |  303 ------
 include/drm/ttm/ttm_device.h                       |    7 +-
 include/drm/ttm/ttm_execbuf_util.h                 |    4 +-
 include/linux/dma-buf.h                            |    4 +-
 include/linux/fb.h                                 |    3 +-
 include/linux/i2c.h                                |    1 +
 include/uapi/linux/media-bus-format.h              |    5 +-
 267 files changed, 7001 insertions(+), 2561 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
 create mode 100644 drivers/gpu/drm/imx/ipuv3/Kconfig
 create mode 100644 drivers/gpu/drm/imx/ipuv3/Makefile
 rename drivers/gpu/drm/imx/{ => ipuv3}/dw_hdmi-imx.c (100%)
 rename drivers/gpu/drm/imx/{ => ipuv3}/imx-drm-core.c (100%)
 rename drivers/gpu/drm/imx/{ => ipuv3}/imx-drm.h (100%)
 rename drivers/gpu/drm/imx/{ => ipuv3}/imx-ldb.c (100%)
 rename drivers/gpu/drm/imx/{ => ipuv3}/imx-tve.c (100%)
 rename drivers/gpu/drm/imx/{ => ipuv3}/ipuv3-crtc.c (100%)
 rename drivers/gpu/drm/imx/{ => ipuv3}/ipuv3-plane.c (98%)
 rename drivers/gpu/drm/imx/{ => ipuv3}/ipuv3-plane.h (100%)
 rename drivers/gpu/drm/imx/{ => ipuv3}/parallel-display.c (100%)
 create mode 100644 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
 create mode 100644 drivers/gpu/drm/tests/drm_connector_test.c
 delete mode 100644 drivers/gpu/drm/tests/drm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/tests/drm_managed_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_modes_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_probe_helper_test.c
 create mode 100644 drivers/gpu/drm/vc4/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock.c
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock.h
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock_output.c
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c
 create mode 100644 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
 create mode 100644 include/drm/drm_kunit_helpers.h
 rename include/drm/ttm/{ttm_bo_api.h => ttm_bo.h} (66%)
 delete mode 100644 include/drm/ttm/ttm_bo_driver.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
