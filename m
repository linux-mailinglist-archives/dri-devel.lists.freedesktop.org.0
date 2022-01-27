Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6338A49E1C1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD9B10E9CD;
	Thu, 27 Jan 2022 11:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AA610E242;
 Thu, 27 Jan 2022 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643284671; x=1674820671;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=HuXgckWHopB+yDmpcaHVvaFogOWQKvLPLTIg3j5fXv0=;
 b=QPt46VUtpJb7YmhuqXGH0c150uF7m7tOVoQZ2ecRY+iqBZFOHpz1QL2S
 O3oHxA9zChba0spVM7r5ENoOdVtJjwETeB69TbdjnCkZKQ4IfxO15DtCX
 uoO36gr1xy93QiXDYc8dN4aPMXvCzSKT+gJZO/qcI841M0e3UFnlwXBuk
 a2CGpxZ3vy8J4gtxwmspdr25iJedviddPUFRsnJ4MMUZN7zgHQT2ya3XP
 MzAMmWTfRsQILg4hJ5MJITTJ4KBHZ6+sdFNflKMHwRKuoygJSI7gEkQdy
 bbVSlwRxIRGcjM54BPZUUqJlz30kBNBzIDwqHInOqJER5vOvCgrh9Cuh1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="247048893"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="247048893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 03:57:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="480262620"
Received: from grossi-mobl.ger.corp.intel.com (HELO [10.252.33.31])
 ([10.252.33.31])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 03:57:46 -0800
Message-ID: <456a23c6-7324-7543-0c45-751f30ef83f7@linux.intel.com>
Date: Thu, 27 Jan 2022 12:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

Hi Dave & Daniel,

First pull for v5.18

drm-misc-next-2022-01-27:
drm-misc-next for v5.18:

UAPI Changes:
- Fix invalid IN_FORMATS blob when plane->format_mod_supported is NULL.

Cross-subsystem Changes:
- Assorted dt bindings updates.
- Fix vga16fb vga checking on x86.
- Fix extra semicolon in rwsem.h's _down_write_nest_lock.
- Assorted small fixes to agp and fbdev drivers.
- Fix oops in creating a udmabuf with 0 pages.
- Hot-unplug firmware fb devices on forced removal
- Reqquest memory region in simplefb and simpledrm, and don't make the ioresource as busy.

Core Changes:
- Mock a drm_plane in drm-plane-helper selftest.
- Assorted bug fixes to device logging, dbi.
- Use DP helper for sink count in mst.
- Assorted documentation fixes.
- Assorted small fixes.
- Move DP headers to drm/dp, and add a drm dp helper module.
- Move the buddy allocator from i915 to common drm.
- Add simple pci and platform module init macros to remove a lot of boilerplate from some drivers.
- Support microsoft extension for HMDs and specialized monitors.
- Improve edid parser's deep color handling.
- Add type 7 timing support to edid parser.
- Add a weak backpointer to the ttm_bo from ttm_resource
- Add 3 eDP panels.

Driver Changes:
- Add support for HDMI and JZ4780 to ingenic.
- Add support for higher DP/eDP bitrates to nouveau.
- Assorted driver fixes to tilcdc, vmwgfx, sn65dsi83, meson, stm, panfrost, v3d, gma500, vc4, virtio, mgag200, ast, radeon, amdgpu, nouveau, various bridge drivers.
- Convert and revert exynos dsi support to bridge driver.
- Add vcc supply regulator support for sn65dsi83.
- More conversion of bridge/chipone-icn6211 to atomic.
- Remove conflicting fb's from stm, and add support for new hw version.
- Add device link in parade-ps8640 to fix suspend/resume.
- Update Boe-tv110c9m init sequence.
- Add wide screen support to AST2600.
- Fix omapdrm implicit dma_buf fencing.
- Add support for multiple overlay planes to vkms.
- Convert bridge/anx7625 to atomic, add HDCP support,
  add eld support for audio, and fix HPD.
- Add driver for ChromeOS privacy screen.
- Handover display from firmware to vc4 more gracefully, and support nomodeset.
- Add flexible and ycbcr pixel formats to stm/ltdc.
- Convert exynos mipi dsi to atomic.
- Add initial dual core group GPUs support to panfrost.
- No longer add exclusive fence in amdgpu as shared fence.
- Add CSC and full range supoprt to vc4.
- Shutdown the display on system shutdown and unbind.
- Add Multi-Inno Technology MI0700S4T-6 simple panel.
The following changes since commit 9758ff2fa240173e9a45613b07774b7a78b7653e:

  Merge drm/drm-next into drm-misc-next (2021-12-16 14:48:27 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-01-27

for you to fetch changes up to a5d092d37eb5d25520d283985082e977bda68eb7:

  drm/panel: simple: add Multi-Inno Technology MI0700S4T-6 (2022-01-27 09:29:16 +0100)

----------------------------------------------------------------
drm-misc-next for v5.18:

UAPI Changes:
- Fix invalid IN_FORMATS blob when plane->format_mod_supported is NULL.

Cross-subsystem Changes:
- Assorted dt bindings updates.
- Fix vga16fb vga checking on x86.
- Fix extra semicolon in rwsem.h's _down_write_nest_lock.
- Assorted small fixes to agp and fbdev drivers.
- Fix oops in creating a udmabuf with 0 pages.
- Hot-unplug firmware fb devices on forced removal
- Reqquest memory region in simplefb and simpledrm, and don't make the ioresource as busy.

Core Changes:
- Mock a drm_plane in drm-plane-helper selftest.
- Assorted bug fixes to device logging, dbi.
- Use DP helper for sink count in mst.
- Assorted documentation fixes.
- Assorted small fixes.
- Move DP headers to drm/dp, and add a drm dp helper module.
- Move the buddy allocator from i915 to common drm.
- Add simple pci and platform module init macros to remove a lot of boilerplate from some drivers.
- Support microsoft extension for HMDs and specialized monitors.
- Improve edid parser's deep color handling.
- Add type 7 timing support to edid parser.
- Add a weak backpointer to the ttm_bo from ttm_resource
- Add 3 eDP panels.

Driver Changes:
- Add support for HDMI and JZ4780 to ingenic.
- Add support for higher DP/eDP bitrates to nouveau.
- Assorted driver fixes to tilcdc, vmwgfx, sn65dsi83, meson, stm, panfrost, v3d, gma500, vc4, virtio, mgag200, ast, radeon, amdgpu, nouveau, various bridge drivers.
- Convert and revert exynos dsi support to bridge driver.
- Add vcc supply regulator support for sn65dsi83.
- More conversion of bridge/chipone-icn6211 to atomic.
- Remove conflicting fb's from stm, and add support for new hw version.
- Add device link in parade-ps8640 to fix suspend/resume.
- Update Boe-tv110c9m init sequence.
- Add wide screen support to AST2600.
- Fix omapdrm implicit dma_buf fencing.
- Add support for multiple overlay planes to vkms.
- Convert bridge/anx7625 to atomic, add HDCP support,
  add eld support for audio, and fix HPD.
- Add driver for ChromeOS privacy screen.
- Handover display from firmware to vc4 more gracefully, and support nomodeset.
- Add flexible and ycbcr pixel formats to stm/ltdc.
- Convert exynos mipi dsi to atomic.
- Add initial dual core group GPUs support to panfrost.
- No longer add exclusive fence in amdgpu as shared fence.
- Add CSC and full range supoprt to vc4.
- Shutdown the display on system shutdown and unbind.
- Add Multi-Inno Technology MI0700S4T-6 simple panel.

----------------------------------------------------------------
Alexander Stein (3):
      drm/bridge: ti-sn65dsi83: Make enable GPIO optional
      dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply bindings
      drm/bridge: ti-sn65dsi83: Add vcc supply regulator support

Alexey Sheplyakov (1):
      drm/panfrost: initial dual core group GPUs support

Alyssa Rosenzweig (3):
      drm/panfrost: Update create_bo flags comment
      drm/panfrost: Remove features meant for userspace
      drm/panfrost: Merge some feature lists

AngeloGioacchino Del Regno (1):
      drm/bridge: parade-ps8640: Link device to ensure suspend/resume order

Antonio Borneo (3):
      drm/stm: dsi: move lane capability detection in probe()
      drm/bridge/synopsys: dsi: extend the prototype of mode_valid()
      drm/stm: dsi: provide the implementation of mode_valid()

Arunpravin (1):
      drm: move the buddy allocator from i915 into common drm

Ben Skeggs (8):
      drm/nouveau/disp: remove some remnant of a rework
      drm/nouveau/disp/dp: explicitly control scrambling when setting pattern
      drm/nouveau/disp/dp: generate supported link rates table at detect time
      drm/nouveau/disp/dp: add support for tps4
      drm/nouveau/disp/dp: fixup cr/eq delays for 1.4
      drm/nouveau/disp/dp: add support for lttprs
      drm/nouveau/disp/dp: add support for hbr3
      drm/nouveau/disp/dp: add support for eDP link rates

Christian König (7):
      drm/amdgpu: remove excl as shared workarounds
      dma-buf: drop excl_fence parameter from dma_resv_get_fences
      drm/radeon: use ttm_resource_manager_debug
      drm/amdgpu: use ttm_resource_manager_debug
      drm/ttm: add ttm_resource_fini v2
      drm/ttm: add back a reference to the bdev to the res manager
      drm/ttm: add a weak BO reference to the resource v3

Christophe JAILLET (1):
      drm/bridge: sn65dsi83: Fix an error handling path in sn65dsi83_probe()

Claudio Suarez (2):
      mock a drm_plane in igt_check_plane_state to make the test more robust
      drm: fix error found in some cases after the patch d1af5cd86997

Colin Ian King (4):
      drm/bridge: adv7533: make array clock_div_by_lanes static const
      drm/vc4: remove redundant assignment of variable size
      video: fbdev: asiliantfb: remove redundant assignment to variable Ftarget
      video: fbdev: s3c-fb: remove redundant initialization of pointer bufs

Daniel Vetter (2):
      drm/doc: overview before functions for drm_writeback.c
      drm/docs: Document where the C8 color lut is stored

Drew Davenport (1):
      drm: bridge: it66121: Remove redundant check

Guchun Chen (1):
      locking/rwsem: drop redundant semicolon of down_write_nest_lock

H. Nikolaus Schaller (1):
      drm/ingenic: prepare ingenic drm for later addition of JZ4780

Ira Weiny (1):
      drm/gma: Remove calls to kmap()

Ivaylo Dimitrov (1):
      drm: omapdrm: Fix implicit dma_buf fencing

Jagan Teki (8):
      drm/bridge: chipone-icn6211: Switch to atomic operations
      drm/bridge: chipone-icn6211: Add mode_set API
      drm: exynos: dsi: Convert to bridge driver
      drm: exynos: dsi: Add mode_set function
      drm: bridge: adv7511: Fix ADV7535 HPD enablement
      Revert "drm: exynos: dsi: Convert to bridge driver"
      drm: bridge: nwl-dsi: Drop panel_bridge from nwl_dsi
      drm/bridge: dw-mipi-dsi: Switch to atomic operations

Jani Nikula (4):
      drm/dp: note that DPCD 0x2002-0x2003 match 0x200-0x201
      drm/mst: use DP_GET_SINK_COUNT() for sink count in ESI
      drm/locking: fix drm_modeset_acquire_ctx kernel-doc
      drm/edid: improve non-desktop quirk logging

Javier Martinez Canillas (7):
      video: vga16fb: Fix logic that checks for the display standard
      drm: Provide platform module-init macro
      drm/imx/dcss: Replace module initialization with DRM helpers
      drm/komeda: Replace module initialization with DRM helpers
      drm/arm/hdlcd: Replace module initialization with DRM helpers
      drm/malidp: Replace module initialization with DRM helpers
      drivers/firmware: Don't mark as busy the simple-framebuffer IO resource

Jiasheng Jiang (2):
      drm/v3d/v3d_drv: Check for error num after setting mask
      drm/panfrost: Check for error num after setting mask

Jiri Vanek (1):
      drm/bridge/tc358775: Fix for dual-link LVDS

Jocelyn Falempe (1):
      mgag200 fix memmapsl configuration in GCTL6 register

José Expósito (8):
      drm/plane: Make format_mod_supported truly optional
      drm/plane: Fix typo in format_mod_supported documentation
      drm/vkms: refactor overlay plane creation
      drm/vkms: add support for multiple overlay planes
      drm/vkms: drop "Multiple overlay planes" TODO
      drm/stm: ltdc: Drop format_mod_supported function
      drm/doc: Fix TTM acronym
      drm/selftests/test-drm_dp_mst_helper: Fix memory leak in sideband_msg_req_encode_decode

Julian Braha (1):
      drm: bridge: fix unmet dependency on DRM_KMS_HELPER for DRM_PANEL_BRIDGE

KuoHsiang Chou (2):
      drm/ast: Enable the supporting of wide screen on AST2600
      drm/ast: Create threshold values for AST2600

Laurent Pinchart (1):
      dt-bindings: display: bridge: sn65dsi83: Make enable GPIO optional

Linus Walleij (1):
      drm/panel: Extend ACX424AKP bindings to ACX424AKM

Lucas De Marchi (1):
      dma-buf-map: Fix dot vs comma in example

Marek Vasut (5):
      dt-bindings: display: bridge: lvds-codec: Document TI DS90CF364A decoder
      drm: mxsfb: Shutdown the display on remove
      drm: mxsfb: Shutdown the display on system shutdown
      dt-bindings: display: simple: Add Multi-Inno Technology MI0700S4T-6 panel
      drm/panel: simple: add Multi-Inno Technology MI0700S4T-6

Martin Blumenstingl (2):
      drm/meson: osd_afbcd: Add an exit callback to struct meson_afbcd_ops
      drm/meson: Fix error handling when afbcd.ops->init fails

Maxime Ripard (14):
      firmware: raspberrypi: Add RPI_FIRMWARE_NOTIFY_DISPLAY_DONE
      drm/vc4: Support nomodeset
      drm/vc4: Remove conflicting framebuffers before callind bind_all
      drm/vc4: Notify the firmware when DRM is in charge
      drm/edid: Rename drm_hdmi_avi_infoframe_colorspace to _colorimetry
      drm/edid: Don't clear formats if using deep color
      drm/edid: Split deep color modes between RGB and YUV444
      drm/connector: Fix typo in output format
      drm/vc4: hdmi: Add full range RGB helper
      drm/vc4: hdmi: Use full range helper in csc functions
      drm/vc4: hdmi: Move XBAR setup to csc_setup
      drm/vc4: hdmi: Replace CSC_CTL hardcoded value by defines
      drm/vc4: hdmi: Define colorspace matrices
      drm/vc4: hdmi: Change CSC callback prototype

Miaoqian Lin (4):
      drm/bridge: Fix free wrong object in sii8620_init_rcp_input_dev
      drm/bridge: anx7625: Fix null vs IS_ERR() checking in anx7625_register_i2c_dummy_clients
      drm/bridge: Add missing pm_runtime_disable() in __dw_mipi_dsi_probe
      drm/bridge: nwl-dsi: Fix PM disable depth imbalance in nwl_dsi_probe

Minghao Chi (1):
      drm/gma500: remove redundant ret variable

Neil Armstrong (1):
      drm/bridge: sii902x: add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR

Paul Boddie (1):
      drm/ingenic: Add support for JZ4780 and HDMI output

Pavel Skripkin (1):
      udmabuf: validate ubuf->pagecount

Philipp Zabel (2):
      drm/edid: support Microsoft extension for HMDs and specialized monitors
      drm/edid: remove non_desktop quirk for HPN-3515 and LEN-B800.

Rajat Jain (3):
      drm/privacy_screen: Add drvdata in drm_privacy_screen
      platform/chrome: Add driver for ChromeOS privacy-screen
      drm/privacy_screen_x86: Add entry for ChromeOS privacy-screen

Roberto Sassu (1):
      drm/virtio: Ensure that objs is not NULL in virtio_gpu_array_put_free()

Thomas Zimmermann (25):
      drm/mipi-dbi: Fix source-buffer address in mipi_dbi_buf_copy
      agp: Remove trailing whitespaces
      agp: Include "compat_ioctl.h" where necessary
      agp: Documentation fixes
      agp/ati: Return error from ati_create_page_map()
      agp/nvidia: Declare value returned by readl() as unused
      agp/sworks: Remove unused variable 'current_size'
      agp/via: Remove unused variable 'current_size'
      drm/dp_mst: Remove trailing whitespace.
      drm/dp: Move DP declarations into separate header file
      drm/dp: Move DisplayPort helpers into separate helper module
      drm/dp: Move public DisplayPort headers into dp/
      drm/dp: Move DisplayPort AUX bus helpers into dp/
      drm/selftests: Select DRM_DP_HELPER
      drm/msm: Fix include statements for DisplayPort
      drm: Provide PCI module-init macros
      drm/ast: Replace module-init boiler-plate code with DRM helpers
      drm/bochs: Replace module-init boiler-plate code with DRM helpers
      drm/cirrus: Replace module-init boiler-plate code with DRM helpers
      drm/hisilicon/hibmc: Replace module initialization with DRM helpers
      drm: Update docs after moving DisplayPort helpers around
      fbdev: Hot-unplug firmware fb devices on forced removal
      drm/simpledrm: Request memory region in driver
      fbdev/simplefb: Request memory region in driver
      drm: Add TODO item for requesting memory regions

Ville Syrjälä (1):
      drm/dbi: Use a static inline stub for mipi_dbi_debugfs_init()

Xiang wangx (1):
      drm/tilcdc: add const to of_device_id

Xin Ji (4):
      drm/bridge: anx7625: Check GPIO description to avoid crash
      drm/bridge: anx7625: Add bridge helper atomic conversion
      drm/bridge: anx7625: add HDCP support
      drm/bridge: anx7625: add audio codec .get_eld support

Yannick Fertre (7):
      drm/stm: remove conflicting framebuffers
      drm/stm: ltdc: support of new hardware version
      drm/stm: ltdc: switch to regmap
      drm/stm: ltdc: add YCbCr 422 output support
      drm/stm: ltdc: add per plane update support
      drm/stm: ltdc: add support of flexible pixel formats
      drm/stm: ltdc: add support of ycbcr pixel formats

Yaroslav Bolyukin (1):
      drm/edid: Support type 7 timings

Yunlong Jia (1):
      gpu: drm: panel-edp: Add panels planned for sc7180-trogdor-pazquel

Zack Rusin (4):
      drm/vmwgfx: Fix a size_t/long int format specifier mismatch
      drm/vmwgfx: Remove explicit transparent hugepages support
      drm/vmwgfx: Remove unused compile options
      drm/vmwgfx: Fix possible usage of an uninitialized variable

Zhiming Liu (1):
      drm/bridge: Remove extra device acquisition method of i2c client in lt9611 driver

Zhou Qingyang (1):
      drm/nouveau/acr: Fix undefined behavior in nvkm_acr_hsfw_load_bl()

owen (1):
      drm/bridge: anx7625: Return -EPROBE_DEFER if the dsi host was not found

yangcong (1):
      drm/panel: Update Boe-tv110c9m initial code

 .../bindings/display/bridge/lvds-codec.yaml        |   1 +
 .../bindings/display/bridge/ti,sn65dsi83.yaml      |   5 +-
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../bindings/display/panel/sony,acx424akp.yaml     |  11 +-
 Documentation/gpu/drm-internals.rst                |   6 +
 Documentation/gpu/drm-kms-helpers.rst              |  26 +-
 Documentation/gpu/drm-kms.rst                      |   6 +-
 Documentation/gpu/drm-mm.rst                       |   2 +-
 Documentation/gpu/todo.rst                         |  15 +
 Documentation/gpu/vkms.rst                         |   2 -
 drivers/char/agp/ati-agp.c                         |   8 +-
 drivers/char/agp/backend.c                         |   2 +
 drivers/char/agp/frontend.c                        |   4 +-
 drivers/char/agp/nvidia-agp.c                      |   3 +-
 drivers/char/agp/sworks-agp.c                      |   5 +-
 drivers/char/agp/via-agp.c                         |   3 -
 drivers/dma-buf/dma-resv.c                         |  46 +-
 drivers/dma-buf/st-dma-resv.c                      |  26 +-
 drivers/dma-buf/udmabuf.c                          |   4 +
 drivers/firmware/sysfb_simplefb.c                  |   2 +-
 drivers/gpu/drm/Kconfig                            |  15 +
 drivers/gpu/drm/Makefile                           |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   5 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h          |   2 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   2 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |   2 +-
 .../gpu/drm/arm/display/komeda/d71/d71_component.c |  12 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |   3 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   3 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                      |  18 +-
 drivers/gpu/drm/ast/ast_main.c                     |   2 +
 drivers/gpu/drm/ast/ast_mode.c                     |   5 +-
 drivers/gpu/drm/bridge/Kconfig                     |   5 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  31 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |   2 +
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   2 +-
 .../gpu/drm/bridge/analogix/analogix-i2c-dptx.c    |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   4 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 440 ++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  80 +-
 drivers/gpu/drm/bridge/cadence/Kconfig             |   1 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  20 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |   2 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  39 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   3 -
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   4 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   4 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   8 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |  33 +-
 drivers/gpu/drm/bridge/sii902x.c                   | 129 +++-
 drivers/gpu/drm/bridge/sil-sii8620.c               |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  16 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  25 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
 drivers/gpu/drm/bridge/tc358775.c                  |   4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  53 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   4 +-
 drivers/gpu/drm/dp/Makefile                        |   9 +
 drivers/gpu/drm/{drm_dp_helper.c => dp/drm_dp.c}   |   6 +-
 drivers/gpu/drm/{ => dp}/drm_dp_aux_bus.c          |   4 +-
 drivers/gpu/drm/{ => dp}/drm_dp_aux_dev.c          |   6 +-
 drivers/gpu/drm/{ => dp}/drm_dp_cec.c              |   2 +-
 drivers/gpu/drm/{ => dp}/drm_dp_dual_mode_helper.c |   2 +-
 drivers/gpu/drm/dp/drm_dp_helper_internal.h        |  33 +
 drivers/gpu/drm/dp/drm_dp_helper_mod.c             |  22 +
 drivers/gpu/drm/{ => dp}/drm_dp_mst_topology.c     |   8 +-
 .../drm/{ => dp}/drm_dp_mst_topology_internal.h    |   2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |  12 +-
 drivers/gpu/drm/drm_buddy.c                        | 535 ++++++++++++++
 drivers/gpu/drm/drm_color_mgmt.c                   |   4 +
 drivers/gpu/drm/drm_crtc_helper_internal.h         |  27 -
 drivers/gpu/drm/drm_dsc.c                          |   2 +-
 drivers/gpu/drm/drm_edid.c                         | 104 ++-
 drivers/gpu/drm/drm_kms_helper_common.c            |  14 -
 drivers/gpu/drm/drm_mipi_dbi.c                     |   2 +-
 drivers/gpu/drm/drm_plane.c                        |   9 +-
 drivers/gpu/drm/drm_privacy_screen.c               |   5 +-
 drivers/gpu/drm/drm_privacy_screen_x86.c           |  17 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  13 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |  14 +-
 drivers/gpu/drm/gma500/gma_display.c               |   6 +-
 drivers/gpu/drm/gma500/intel_bios.c                |   2 +-
 drivers/gpu/drm/gma500/mmu.c                       |   8 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   3 +-
 drivers/gpu/drm/i915/Kconfig                       |   2 +
 drivers/gpu/drm/i915/Makefile                      |   1 -
 drivers/gpu/drm/i915/display/intel_bios.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   4 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   6 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |   4 +-
 drivers/gpu/drm/i915/i915_buddy.c                  | 466 ------------
 drivers/gpu/drm/i915/i915_buddy.h                  | 143 ----
 drivers/gpu/drm/i915/i915_module.c                 |   3 -
 drivers/gpu/drm/i915/i915_scatterlist.c            |  11 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |  37 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |   4 +-
 drivers/gpu/drm/i915/selftests/i915_buddy.c        | 787 --------------------
 .../gpu/drm/i915/selftests/i915_mock_selftests.h   |   1 -
 .../gpu/drm/i915/selftests/intel_memory_region.c   |  13 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  62 +-
 drivers/gpu/drm/ingenic/ingenic-drm.h              |  38 +
 drivers/gpu/drm/meson/meson_drv.c                  |  25 +-
 drivers/gpu/drm/meson/meson_osd_afbcd.c            |  41 +-
 drivers/gpu/drm/meson/meson_osd_afbcd.h            |   1 +
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   5 +-
 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c                  |   2 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |   2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   2 +-
 drivers/gpu/drm/msm/edp/edp.h                      |   2 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   9 +
 drivers/gpu/drm/nouveau/Kconfig                    |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |  17 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |   4 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |   3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |   3 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |  13 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      | 317 +++++---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h      |  35 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c  |  13 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/sorga102.c    |   4 +
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgf119.c    |  14 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgm107.c    |  18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c     |   9 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |   1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   8 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  21 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   4 +-
 drivers/gpu/drm/panel/panel-simple.c               |  33 +
 drivers/gpu/drm/panfrost/panfrost_features.h       | 212 +-----
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |  32 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |   2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |   4 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |   2 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |   4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   4 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   4 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |   2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   2 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |   8 +-
 drivers/gpu/drm/selftests/test-drm_plane_helper.c  |   4 +
 drivers/gpu/drm/stm/drv.c                          |   5 +
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              | 114 ++-
 drivers/gpu/drm/stm/ltdc.c                         | 810 ++++++++++++++++-----
 drivers/gpu/drm/stm/ltdc.h                         |  12 +-
 drivers/gpu/drm/tegra/Kconfig                      |   1 +
 drivers/gpu/drm/tegra/dp.c                         |   2 +-
 drivers/gpu/drm/tegra/dpaux.c                      |   2 +-
 drivers/gpu/drm/tegra/sor.c                        |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   4 +-
 drivers/gpu/drm/tiny/bochs.c                       |  20 +-
 drivers/gpu/drm/tiny/cirrus.c                      |  17 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |  22 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   7 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |   4 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |  35 +
 drivers/gpu/drm/ttm/ttm_sys_manager.c              |   3 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   8 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   2 -
 drivers/gpu/drm/vc4/vc4_drv.c                      |  33 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 132 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   5 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |   3 +
 drivers/gpu/drm/virtio/virtgpu_gem.c               |   3 +
 drivers/gpu/drm/vkms/vkms_drv.h                    |   2 +
 drivers/gpu/drm/vkms/vkms_output.c                 |  29 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c     |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                | 184 -----
 drivers/gpu/drm/xlnx/Kconfig                       |   1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   2 +-
 drivers/platform/chrome/Kconfig                    |  11 +
 drivers/platform/chrome/Makefile                   |   1 +
 drivers/platform/chrome/chromeos_privacy_screen.c  | 153 ++++
 drivers/platform/x86/thinkpad_acpi.c               |   2 +-
 drivers/video/fbdev/asiliantfb.c                   |   2 +-
 drivers/video/fbdev/core/fbmem.c                   |  29 +-
 drivers/video/fbdev/s3c-fb.c                       |   2 +-
 drivers/video/fbdev/simplefb.c                     |  65 +-
 drivers/video/fbdev/vga16fb.c                      |   5 +
 include/drm/bridge/dw_mipi_dsi.h                   |   4 +-
 include/drm/{ => dp}/drm_dp_aux_bus.h              |   0
 include/drm/{ => dp}/drm_dp_dual_mode_helper.h     |   0
 include/drm/{ => dp}/drm_dp_helper.h               |   7 +-
 include/drm/{ => dp}/drm_dp_mst_helper.h           |   2 +-
 include/drm/drm_buddy.h                            | 150 ++++
 include/drm/drm_connector.h                        |  18 +-
 include/drm/drm_crtc.h                             |  10 +
 include/drm/drm_dsc.h                              |   2 +-
 include/drm/drm_edid.h                             |   4 +-
 include/drm/drm_mipi_dbi.h                         |   2 +-
 include/drm/drm_modeset_lock.h                     |   1 +
 include/drm/drm_module.h                           | 125 ++++
 include/drm/drm_plane.h                            |   2 +-
 include/drm/drm_privacy_screen_driver.h            |  13 +-
 include/drm/ttm/ttm_resource.h                     |  23 +-
 include/linux/dma-buf-map.h                        |   4 +-
 include/linux/dma-resv.h                           |   4 +-
 include/linux/fb.h                                 |   1 +
 include/linux/rwsem.h                              |   2 +-
 include/soc/bcm2835/raspberrypi-firmware.h         |   1 +
 include/uapi/drm/panfrost_drm.h                    |   4 +-
 242 files changed, 3945 insertions(+), 2838 deletions(-)
 create mode 100644 drivers/gpu/drm/dp/Makefile
 rename drivers/gpu/drm/{drm_dp_helper.c => dp/drm_dp.c} (99%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_aux_bus.c (99%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_aux_dev.c (98%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_cec.c (99%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_dual_mode_helper.c (99%)
 create mode 100644 drivers/gpu/drm/dp/drm_dp_helper_internal.h
 create mode 100644 drivers/gpu/drm/dp/drm_dp_helper_mod.c
 rename drivers/gpu/drm/{ => dp}/drm_dp_mst_topology.c (99%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_mst_topology_internal.h (94%)
 create mode 100644 drivers/gpu/drm/drm_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 delete mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
 create mode 100644 drivers/platform/chrome/chromeos_privacy_screen.c
 rename include/drm/{ => dp}/drm_dp_aux_bus.h (100%)
 rename include/drm/{ => dp}/drm_dp_dual_mode_helper.h (100%)
 rename include/drm/{ => dp}/drm_dp_helper.h (99%)
 rename include/drm/{ => dp}/drm_dp_mst_helper.h (99%)
 create mode 100644 include/drm/drm_buddy.h
 create mode 100644 include/drm/drm_module.h
