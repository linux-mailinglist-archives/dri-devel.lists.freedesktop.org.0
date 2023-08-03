Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18976ED6E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B836E10E610;
	Thu,  3 Aug 2023 15:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1EB10E610;
 Thu,  3 Aug 2023 15:01:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 577211F45A;
 Thu,  3 Aug 2023 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691074911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DP5EA9gEACt3qscyBI+vlE+f8c89cAvwY/BkUu+I+8M=;
 b=fxJWNUKNZS8NvnN717ujm9sOt+VOI4nIUDKXJ9+Vo8HTF1zW+OmOZQmXzlTz+ucQSVpnOQ
 IUKa3unJlotnZEcrSfB6ZvBtqTeVLCErNUPPhqfT/lP12Pudp2MU1rhRF9cAX/aMYdJ3dt
 ySn6+r+SjSrbOXhUGCF5PchuWe+nA+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691074911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DP5EA9gEACt3qscyBI+vlE+f8c89cAvwY/BkUu+I+8M=;
 b=84TPK8PdyR+nWxlN4dC5MOcIcdORIJjRTuhUrLE7tFAkr5DwYA0JinyXosgdOlmRqtpofs
 GaRVk/zi+ggPo3AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C0ED134B0;
 Thu,  3 Aug 2023 15:01:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UoMMBl/By2TRIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Aug 2023 15:01:51 +0000
Date: Thu, 3 Aug 2023 17:01:49 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20230803150149.GA16884@linux-uq9g>
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
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

this is the pull request for drm-misc-next for this week. There are
plenty of small fixes and cleanups, but nothing stands out.

Best regards
Thomas

drm-misc-next-2023-08-03:
drm-misc-next for v6.6:

UAPI Changes:

 * virtio:
   * Support sync objects

Cross-subsystem Changes:

 * dt-bindings:
   * Move several panel bindings to the correct files

 * fbcon:
   * Cleanups

 * fbdev:
   * Use _IOMEM_, _SYSMEM_, _DMAMEM_ infixes for initializer macros
     and Kconfig tokens, update drivers accordingly
   * ps3fb: Build fix

 * hid/i2c:
   * Allow panels and touchscreens to power sequence together

 * host1x:
   * Fixes

 * video:
   * Fix Kconfig dependencies for boot-up logo

Core Changes:

 * Documentation updates and fixes

 * Fixes

 * MIPI-DBI:
   * Allow using same the D/C GPIO for multiple displays plus
     driver updates

 * Tests:
   * Convert to kunit actions
   * Fix NULL-deref in drm_exec tests

Driver Changes:

 * armada:
   * Fixes

 * ast:
   * Represent BMV as virtual connector
   * Report DP connection status

 * bridge:
   * dw-hdmi: Support CEC suspend/resume
   * Support debugfs for chains
   * Fixes

 * i915:
   * Fixes

 * imx:
   * Convert to dev_error_probe()
   * Cleanups

 * ipu-v3:
   * Convert to devm_platform_ioremap_resource() in several places

 * nouveau:
   * Workaround DPCD issues

 * panel:
   * Convert to of_device_get_match_data()
   * Fix Kconfig dependencies
   * simple: Set bpc value to fix warning; Set connector type for AUO T215HVN01;
     Support Innolux G156HCE-L01 plus DT bindings
   * ili9881: Support TDO TL050HDV35 LCD panel plus DT bindings
   * startek: Support KD070FHFID015 MIPI-DSI panel plus DT bindings
   * sitronix-st7789v: Support Inanbo T28CP45TN89 plus DT bindings;
     Support EDT ET028013DMA plus DT bindings; Various cleanups
   * edp: Add timings for N140HCA-EAC
   * Allow panels and touchscreens to power sequence together
   * Documentation fixes

 * qaic:
   * Cleanups

 * repaper:
   * Fixes

 * ssd130x
   * Fix shadow-plane allocation
   * Cleanups

 * tegra:
   * Convert to devm_platform_ioremap_resource() in several places
   * Support bridge/connector
   * Enable PM
   * Fixes

 * udl:
   * Cleanups

 * v3d:
   * Fixes

 * vc4:
   * Convert tests to kunit actions

 * virtio:
   * Support sync objects

 * vkms:
   * Support gamma LUT
   * Fixes
The following changes since commit 7c5aa9485871f61d19ad2cecbf4904ea05a39ec4:

  dma-buf: Fix the typo in DMA-BUF statistics doc (2023-07-27 09:43:33 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-08-03

for you to fetch changes up to a0769f25a3a621e8bbfb5e2a26e8ae462c761e33:

  HID: i2c-hid: add more DRM dependencies (2023-08-03 07:36:41 -0700)

----------------------------------------------------------------
drm-misc-next for v6.6:

UAPI Changes:

 * virtio:
   * Support sync objects

Cross-subsystem Changes:

 * dt-bindings:
   * Move several panel bindings to the correct files

 * fbcon:
   * Cleanups

 * fbdev:
   * Use _IOMEM_, _SYSMEM_, _DMAMEM_ infixes for initializer macros
     and Kconfig tokens, update drivers accordingly
   * ps3fb: Build fix

 * hid/i2c:
   * Allow panels and touchscreens to power sequence together

 * host1x:
   * Fixes

 * video:
   * Fix Kconfig dependencies for boot-up logo

Core Changes:

 * Documentation updates and fixes

 * Fixes

 * MIPI-DBI:
   * Allow using same the D/C GPIO for multiple displays plus
     driver updates

 * Tests:
   * Convert to kunit actions
   * Fix NULL-deref in drm_exec tests

Driver Changes:

 * armada:
   * Fixes

 * ast:
   * Represent BMV as virtual connector
   * Report DP connection status

 * bridge:
   * dw-hdmi: Support CEC suspend/resume
   * Support debugfs for chains
   * Fixes

 * i915:
   * Fixes

 * imx:
   * Convert to dev_error_probe()
   * Cleanups

 * ipu-v3:
   * Convert to devm_platform_ioremap_resource() in several places

 * nouveau:
   * Workaround DPCD issues

 * panel:
   * Convert to of_device_get_match_data()
   * Fix Kconfig dependencies
   * simple: Set bpc value to fix warning; Set connector type for AUO T215HVN01;
     Support Innolux G156HCE-L01 plus DT bindings
   * ili9881: Support TDO TL050HDV35 LCD panel plus DT bindings
   * startek: Support KD070FHFID015 MIPI-DSI panel plus DT bindings
   * sitronix-st7789v: Support Inanbo T28CP45TN89 plus DT bindings;
     Support EDT ET028013DMA plus DT bindings; Various cleanups
   * edp: Add timings for N140HCA-EAC
   * Allow panels and touchscreens to power sequence together
   * Documentation fixes

 * qaic:
   * Cleanups

 * repaper:
   * Fixes

 * ssd130x
   * Fix shadow-plane allocation
   * Cleanups

 * tegra:
   * Convert to devm_platform_ioremap_resource() in several places
   * Support bridge/connector
   * Enable PM
   * Fixes

 * udl:
   * Cleanups

 * v3d:
   * Fixes

 * vc4:
   * Convert tests to kunit actions

 * virtio:
   * Support sync objects

 * vkms:
   * Support gamma LUT
   * Fixes

----------------------------------------------------------------
Alexander Stein (2):
      drm/imx/dcss: Use dev_err_probe
      dt-bindings: display: bridge: tc358867: Add interrupt property

Alexandre Mergnat (1):
      dt-bindings: display: panel: add startek kd070fhfid015 support

Arnd Bergmann (2):
      drm/panel: r66451: select CONFIG_DRM_DISPLAY_DP_HELPER
      HID: i2c-hid: add more DRM dependencies

Arthur Grillo (2):
      drm/vkms: Add support to 1D gamma LUT
      drm/tests: Alloc drm_device on drm_exec tests

Colin Ian King (1):
      accel/qaic: remove redundant pointer pexec

Dmitry Baryshkov (1):
      drm: panel: simple: specify bpc for powertip_ph800480t013_idf02

Dmitry Osipenko (1):
      drm/virtio: Support sync objects

Douglas Anderson (12):
      dt-bindings: HID: i2c-hid: Add "panel" property to i2c-hid backed touchscreens
      drm/panel: Check for already prepared/enabled in drm_panel
      drm/panel: Add a way for other devices to follow panel state
      of: property: fw_devlink: Add a devlink for panel followers
      HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
      HID: i2c-hid: Rearrange probe() to power things up later
      HID: i2c-hid: Make suspend and resume into helper functions
      HID: i2c-hid: Suspend i2c-hid devices in remove
      HID: i2c-hid: Support being a panel follower
      HID: i2c-hid: Do panel follower work on the system_wq
      drm/panel: Fix kernel-doc typo for `follower_lock`
      drm/panel: Fix todo indentation for panel prepared/enabled cleanup

GUO Zihua (1):
      fbcon: Make fbcon_registered_fb and fbcon_num_registered_fb static

Geert Uytterhoeven (15):
      drm/atomic-helper: Update reference to drm_crtc_force_disable_all()
      drm/gem-fb-helper: Consistenly use drm_dbg_kms()
      Revert "fbcon: Use kzalloc() in fbcon_prepare_logo()"
      video: logo: LOGO should depend on FB_CORE i.s.o. FB
      drm/panel: simple: Simplify matching using of_device_get_match_data()
      drm/bridge_connector: Handle drm_connector_init_with_ddc() failures
      drm/udl: Convert to drm_crtc_helper_atomic_check()
      drm: Spelling s/sempahore/semaphore/
      drm: Spelling s/randevouz/rendez-vous/
      drm/armada: Fix off-by-one error in armada_overlay_get_property()
      drm/repaper: Reduce temporary buffer size in repaper_fb_dirty()
      drm/todo: Add atomic modesetting references
      drm/todo: Convert list of fbconv links to footnotes
      drm: Remove references to removed transitional helpers
      drm: Fix references to drm_plane_helper_check_state()

Guillaume La Roque (1):
      drm/panel: Support for startek-kd070fhfid015 MIPI-DSI panel

Javier Martinez Canillas (1):
      drm/ssd130x: Use shadow-buffer helpers when managing plane's state

Jiapeng Chong (1):
      drm/ssd130x: clean up some inconsistent indenting

Jocelyn Falempe (2):
      drm/ast: Add BMC virtual connector
      drm/ast: report connection status on Display Port.

Lyude Paul (1):
      drm/nouveau/nvkm/dp: Add workaround to fix DP 1.3+ DPCD issues

Marek Vasut (3):
      drm/panel: simple: Add missing connector type and pixel format for AUO T215HVN01
      dt-bindings: display: simple: Add Innolux G156HCE-L01 panel
      drm/panel-simple: Add Innolux G156HCE-L01 panel entry

Matus Gajdos (2):
      dt-bindings: ili9881c: Add TDO TL050HDV35 LCD panel
      drm/panel: ilitek-ili9881c: Add TDO TL050HDV35 LCD panel

Maxim Schwalm (1):
      drm/tegra: output: hdmi: Support bridge/connector

Maxime Ripard (11):
      drm/tests: helpers: Switch to kunit actions
      drm/tests: client-modeset: Remove call to drm_kunit_helper_free_device()
      drm/tests: modes: Remove call to drm_kunit_helper_free_device()
      drm/tests: probe-helper: Remove call to drm_kunit_helper_free_device()
      drm/tests: helpers: Create a helper to allocate a locking ctx
      drm/tests: helpers: Create a helper to allocate an atomic state
      drm/vc4: tests: pv-muxing: Remove call to drm_kunit_helper_free_device()
      drm/vc4: tests: mock: Use a kunit action to unregister DRM device
      drm/vc4: tests: pv-muxing: Switch to managed locking init
      drm/vc4: tests: Switch to atomic state allocation helper
      drm/vc4: tests: pv-muxing: Document test scenario

Maíra Canal (1):
      drm/vkms: Fix race-condition between the hrtimer and the atomic commit

Mikko Perttunen (3):
      drm/tegra: Add error check for NVDEC firmware memory allocation
      gpu: host1x: Return error when context device not attached to IOMMU
      drm/tegra: Enable runtime PM during probe

Miquel Raynal (6):
      dt-bindings: display: st7789v: Add the edt,et028013dma panel compatible
      dt-bindings: display: st7789v: bound the number of Rx data lines
      drm/panel: sitronix-st7789v: Use 9 bits per spi word by default
      drm/panel: sitronix-st7789v: Clarify a definition
      drm/panel: sitronix-st7789v: Add EDT ET028013DMA panel support
      drm/panel: sitronix-st7789v: Check display ID

Nathan Chancellor (2):
      drm/v3d: Avoid -Wconstant-logical-operand in nsecs_to_jiffies_timeout()
      drm/i915: Avoid -Wconstant-logical-operand in nsecs_to_jiffies_timeout()

Nikita Travkin (1):
      drm/panel-edp: Add enable timings for N140HCA-EAC panel

Otto Pflüger (2):
      drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
      drm/tiny: panel-mipi-dbi: Allow sharing the D/C GPIO

Philipp Zabel (1):
      drm/imx/ipuv3: ipuv3-plane: reuse local variable height in atomic_update

Sandor Yu (1):
      drm: bridge: dw_hdmi: Add cec suspend/resume functions

Sebastian Reichel (13):
      dt-bindings: vendor-prefixes: add Inanbo
      dt-bindings: display: st7789v: add Inanbo T28CP45TN89
      drm/panel: sitronix-st7789v: add SPI ID table
      drm/panel: sitronix-st7789v: remove unused constants
      drm/panel: sitronix-st7789v: make reset GPIO optional
      drm/panel: sitronix-st7789v: simplify st7789v_spi_write
      drm/panel: sitronix-st7789v: improve error handling
      drm/panel: sitronix-st7789v: avoid hardcoding mode info
      drm/panel: sitronix-st7789v: avoid hardcoding panel size
      drm/panel: sitronix-st7789v: add media bus format
      drm/panel: sitronix-st7789v: avoid hardcoding invert mode
      drm/panel: sitronix-st7789v: avoid hardcoding polarity info
      drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89 support

Simon Ser (4):
      drm/doc: use proper cross-references for sections
      drm/doc: add warning about connector_type_id stability
      drm/doc: document drm_event and its types
      drm/doc: document that PRIME import/export is always supported

Sui Jingfeng (1):
      drm/drm_plane.h: fix grammar of the comment

Thierry Reding (3):
      dt-bindings: display: panel: Move HannStar HSD101PWW2 to LVDS
      dt-bindings: display: panel: Move Chunghwa CLAA070WP03XG to LVDS
      dt-bindings: display: panel: Document Hydis HV070WX2-1E0

Thomas Zimmermann (5):
      fbdev: Use _IOMEM_ infix for I/O-memory helpers
      fbdev: Use _SYSMEM_ infix for system-memory helpers
      fbdev: Use _DMAMEM_ infix for DMA-memory helpers
      fbdev: Align deferred I/O with naming of helpers
      fbdev/ps3fb: Build without kernel device

Tomi Valkeinen (1):
      drm/bridge: Add debugfs print for bridge chains

Yang Li (1):
      drm/tegra: dpaux: Use devm_platform_ioremap_resource()

Yangtao Li (5):
      drm/tegra: dpaux: Fix incorrect return value of platform_get_irq
      drm/tegra: hdmi: Convert to devm_platform_ioremap_resource()
      drm/tegra: sor: Convert to devm_platform_ioremap_resource()
      gpu: ipu-v3: pre: Convert to devm_platform_ioremap_resource()
      gpu: ipu-v3: prg: Convert to devm_platform_ioremap_resource()

Zhu Wang (1):
      drm/bridge: fix -Wunused-const-variable= warning

 .../bindings/display/bridge/toshiba,tc358767.yaml  |   3 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |   1 +
 .../bindings/display/panel/panel-lvds.yaml         |   6 +
 .../bindings/display/panel/panel-simple.yaml       |   6 +-
 .../bindings/display/panel/sitronix,st7789v.yaml   |  10 +-
 .../display/panel/startek,kd070fhfid015.yaml       |  69 ++++
 .../devicetree/bindings/input/elan,ekth6915.yaml   |   5 +
 .../devicetree/bindings/input/goodix,gt7375p.yaml  |   5 +
 .../devicetree/bindings/input/hid-over-i2c.yaml    |   2 +
 .../bindings/input/touchscreen/touchscreen.yaml    |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/drm-mm.rst                       |   2 +
 Documentation/gpu/todo.rst                         |  47 ++-
 drivers/accel/qaic/qaic_data.c                     |   4 +-
 drivers/gpu/drm/Kconfig                            |   4 +-
 drivers/gpu/drm/armada/Kconfig                     |   2 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |   2 +-
 drivers/gpu/drm/armada/armada_overlay.c            |   6 +-
 drivers/gpu/drm/ast/ast_dp.c                       |  11 +
 drivers/gpu/drm/ast/ast_dp501.c                    |  37 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   6 +
 drivers/gpu/drm/ast/ast_mode.c                     |  87 ++++-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   4 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |  37 ++
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   2 +-
 drivers/gpu/drm/drm_bridge.c                       |  46 +++
 drivers/gpu/drm/drm_bridge_connector.c             |  11 +-
 drivers/gpu/drm/drm_debugfs.c                      |   2 +
 drivers/gpu/drm/drm_fbdev_dma.c                    |   4 +-
 drivers/gpu/drm/drm_fbdev_generic.c                |   6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   4 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |  17 +-
 drivers/gpu/drm/drm_panel.c                        | 218 ++++++++++-
 drivers/gpu/drm/drm_plane_helper.c                 |  12 +-
 drivers/gpu/drm/exynos/Kconfig                     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   4 +-
 drivers/gpu/drm/gma500/Kconfig                     |   2 +-
 drivers/gpu/drm/gma500/fbdev.c                     |   4 +-
 drivers/gpu/drm/i915/Kconfig                       |   2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |   2 +-
 drivers/gpu/drm/i915/i915_request.c                |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |   1 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |  11 +-
 drivers/gpu/drm/msm/Kconfig                        |   2 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |   6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |  48 ++-
 drivers/gpu/drm/omapdrm/Kconfig                    |   2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   4 +-
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-edp.c                  |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 194 ++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  54 ++-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     | 262 +++++++++++--
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 406 +++++++++++++++++++++
 drivers/gpu/drm/radeon/Kconfig                     |   2 +-
 drivers/gpu/drm/radeon/cik.c                       |   2 +-
 drivers/gpu/drm/radeon/r600.c                      |   2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c    |   3 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  16 +-
 drivers/gpu/drm/tegra/Kconfig                      |   2 +-
 drivers/gpu/drm/tegra/dpaux.c                      |   6 +-
 drivers/gpu/drm/tegra/fbdev.c                      |   4 +-
 drivers/gpu/drm/tegra/gr2d.c                       |  16 +-
 drivers/gpu/drm/tegra/gr3d.c                       |  16 +-
 drivers/gpu/drm/tegra/hdmi.c                       |  48 ++-
 drivers/gpu/drm/tegra/nvdec.c                      |  19 +-
 drivers/gpu/drm/tegra/sor.c                        |   4 +-
 drivers/gpu/drm/tegra/vic.c                        |  17 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   8 -
 drivers/gpu/drm/tests/drm_exec_test.c              |  44 ++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          | 141 ++++++-
 drivers/gpu/drm/tests/drm_modes_test.c             |   8 -
 drivers/gpu/drm/tests/drm_probe_helper_test.c      |   8 -
 drivers/gpu/drm/tidss/tidss_plane.c                |   3 +-
 drivers/gpu/drm/tiny/ili9225.c                     |   7 +-
 drivers/gpu/drm/tiny/ili9486.c                     |   4 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   3 +-
 drivers/gpu/drm/tiny/repaper.c                     |   2 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |  13 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   2 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |  12 +
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 115 +++---
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   3 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c            | 224 ++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c               |  95 ++++-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |  12 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |  20 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |  13 +-
 drivers/gpu/host1x/context.c                       |   8 +
 drivers/gpu/ipu-v3/ipu-pre.c                       |   4 +-
 drivers/gpu/ipu-v3/ipu-prg.c                       |   5 +-
 drivers/hid/i2c-hid/Kconfig                        |   6 +
 drivers/hid/i2c-hid/i2c-hid-core.c                 | 349 +++++++++++++-----
 drivers/of/property.c                              |   2 +
 drivers/video/Kconfig                              |   2 +-
 drivers/video/fbdev/Kconfig                        |  10 +-
 drivers/video/fbdev/broadsheetfb.c                 |   6 +-
 drivers/video/fbdev/core/Kconfig                   |  10 +-
 drivers/video/fbdev/core/fbcon.c                   |   6 +-
 drivers/video/fbdev/hecubafb.c                     |   6 +-
 drivers/video/fbdev/metronomefb.c                  |   6 +-
 drivers/video/fbdev/ps3fb.c                        |   4 +-
 drivers/video/fbdev/ssd1307fb.c                    |   6 +-
 drivers/video/fbdev/xen-fbfront.c                  |   6 +-
 drivers/video/logo/Kconfig                         |   2 +-
 include/drm/drm_bridge.h                           |   3 +
 include/drm/drm_crtc.h                             |   5 -
 include/drm/drm_kunit_helpers.h                    |   7 +
 include/drm/drm_modeset_helper_vtables.h           |  48 ++-
 include/drm/drm_panel.h                            |  96 +++++
 include/drm/drm_plane.h                            |   2 +-
 include/drm/task_barrier.h                         |   4 +-
 include/linux/fb.h                                 |  26 +-
 include/uapi/drm/drm.h                             |  61 +++-
 include/uapi/drm/drm_mode.h                        |   3 +
 include/uapi/drm/virtgpu_drm.h                     |  16 +-
 124 files changed, 2782 insertions(+), 549 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
