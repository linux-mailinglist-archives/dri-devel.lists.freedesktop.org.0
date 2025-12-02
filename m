Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF0C9A76B
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 08:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4290610E566;
	Tue,  2 Dec 2025 07:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OO9m1bfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17A810E55C;
 Tue,  2 Dec 2025 07:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764660973; x=1796196973;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=baMs+qwTMlTP82tUYXqH+qiq6upvNswF93Gp85GMRv4=;
 b=OO9m1bfoX3L39nScTzk0KiftHRYuwuX3TqX2IwkPOR8HuBQCWJO8R8dz
 /lhYsyjLB+IN1px0aEXsqqvZYJsBQp+DUVVC61KFEARVExQEPsZxbhB1d
 Ykr3HG2GoLSd6ostQfHo2mKOMIfDsuJKc45Cum4h/oTJIGdNoDdH3GHKm
 GsRPyRUOkbtcEHrHGf2Zs+PRUS3XjXgAw065Lyw71mnZfi/HGCKB2CS3j
 kb3HF2VNwk+2H60dkW3SqI37BUIIBEYAsNg644ZyQtoXw1EnzsN95TiAm
 hMLySgYyKjiE/OEsowp6UV/sRoXLxim/ldM6BDWCzZUgsdQFFMJ6Gk5B0 Q==;
X-CSE-ConnectionGUID: +14ex74IR2CcYTLmBYD7tA==
X-CSE-MsgGUID: rgKHquUbRRGbzS0oa9ji/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89267730"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="89267730"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:36:13 -0800
X-CSE-ConnectionGUID: Lsg29YX8Rnm/Gw+hnagyVg==
X-CSE-MsgGUID: gPH3HgK+SRSabRjbMSzdVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199246662"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.245.244.103])
 ([10.245.244.103])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:36:09 -0800
Message-ID: <aa5cbd50-7676-4a59-bbed-e8428af86804@linux.intel.com>
Date: Tue, 2 Dec 2025 08:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

To allow weston 15 to finalize, I was asked to send another pull request to pull in the drm colorop support.
So here's another pull request, up to the point where all drm colorop support is added!

Kind regards,
~Maarten Lankhorst

drm-misc-next-2025-12-01-1:
Extra drm-misc-next for v6.19-rc1:

UAPI Changes:
- Add support for drm colorop pipeline.
- Add COLOR PIPELINE plane property.
- Add DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.

Cross-subsystem Changes:
- Attempt to use higher order mappings in system heap allocator.
- Always taint kernel with sw-sync.

Core Changes:
- Small fixes to drm/gem.
- Support emergency restore to drm-client.
- Allocate and release fb_info in single place.
- Rework ttm pipelined eviction fence handling.

Driver Changes:
- Support the drm color pipeline in vkms, amdgfx.
- Add NVJPG driver for tegra.
- Assorted small fixes and updates to rockchip, bridge/dw-hdmi-qp,
  panthor.
- Add ASL CS5263 DP-to-HDMI simple bridge.
- Add and improve support for G LD070WX3-SL01 MIPI DSI, Samsung LTL106AL0,
  Samsung LTL106AL01, Raystar RFF500F-AWH-DNN, Winstar WF70A8SYJHLNGA,
  Wanchanglong w552946aaa, Samsung SOFEF00, Lenovo X13s panel.
- Add support for it66122 to it66121.
- Support mali-G1 gpu in panthor.
The following changes since commit ca2583412306ceda9304a7c4302fd9efbf43e963:

  accel/amdxdna: Fix deadlock between context destroy and job timeout (2025-11-13 09:10:43 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-12-01

for you to fetch changes up to b1ea3babb67dcb8b0881c2ab49dfba88b1445856:

  drm/panel-edp: Add CSW MNE007QB3-1 (2025-12-01 09:47:05 -0800)

----------------------------------------------------------------
Extra drm-misc-next for v6.19-rc1:

UAPI Changes:
- Add support for drm colorop pipeline.
- Add COLOR PIPELINE plane property.
- Add DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.

Cross-subsystem Changes:
- Attempt to use higher order mappings in system heap allocator.
- Always taint kernel with sw-sync.

Core Changes:
- Small fixes to drm/gem.
- Support emergency restore to drm-client.
- Allocate and release fb_info in single place.
- Rework ttm pipelined eviction fence handling.

Driver Changes:
- Support the drm color pipeline in vkms, amdgfx.
- Add NVJPG driver for tegra.
- Assorted small fixes and updates to rockchip, bridge/dw-hdmi-qp,
  panthor.
- Add ASL CS5263 DP-to-HDMI simple bridge.
- Add and improve support for G LD070WX3-SL01 MIPI DSI, Samsung LTL106AL0,
  Samsung LTL106AL01, Raystar RFF500F-AWH-DNN, Winstar WF70A8SYJHLNGA,
  Wanchanglong w552946aaa, Samsung SOFEF00, Lenovo X13s panel.
- Add support for it66122 to it66121.
- Support mali-G1 gpu in panthor.

----------------------------------------------------------------
Abhishek Rajput (1):
      drm/panel: jadard-jd9365da-h3: Use dev_err_probe() instead of DRM_DEV_ERROR() during probing

Akash Goel (1):
      drm/panthor: Avoid adding of kernel BOs to extobj list

Alex Hung (18):
      drm/colorop: Add destroy functions for color pipeline
      drm/colorop: define a new macro for_each_new_colorop_in_state
      drm/amd/display: Skip color pipeline initialization for cursor plane
      drm/amd/display: Add support for sRGB EOTF in DEGAM block
      drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
      drm/amd/display: Add support for sRGB EOTF in BLND block
      drm/colorop: Add 1D Curve Custom LUT type
      drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
      drm/amd/display: add 3x4 matrix colorop
      drm/colorop: Add multiplier type
      drm/amd/display: add multiplier colorop
      drm/amd/display: Swap matrix and multiplier
      drm/colorop: Add 3D LUT support to color pipeline
      drm/amd/display: add 3D LUT colorop
      drm/amd/display: Ensure 3D LUT for color pipeline
      drm/amd/display: Disable CRTC degamma when color pipeline is enabled
      drm/colorop: Add DRM_COLOROP_1D_CURVE_GAMMA22 to 1D Curve
      drm/amd/display: Enable support for Gamma 2.2

Andy Yan (1):
      drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers

Ashley Smith (2):
      drm/panthor: Make the timeout per-queue instead of per-job
      drm/panthor: Reset queue slots if termination fails

Barry Song (1):
      dma-buf: system_heap: use larger contiguous mappings instead of per-page mmap

Boris Brezillon (14):
      drm/panthor: Always wait after sending a command to an AS
      drm/panthor: Kill lock_region()
      drm/panthor: Recover from panthor_gpu_flush_caches() failures
      drm/panthor: Add support for atomic page table updates
      drm/panthor: Make panthor_vm_[un]map_pages() more robust
      drm/panthor: Relax a check in panthor_sched_pre_reset()
      drm/panthor: Simplify group idleness tracking
      drm/panthor: Don't try to enable extract events
      drm/panthor: Fix the full_tick check
      drm/panthor: Fix the group priority rotation logic
      drm/panthor: Fix immediate ticking on a disabled tick
      drm/panthor: Fix the logic that decides when to stop ticking
      drm/panthor: Make sure we resume the tick when new jobs are submitted
      drm/panthor: Kill panthor_sched_immediate_tick()

Casey Connolly (2):
      drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
      drm/panel: sofef00: Initialise at 50% brightness

Chaitanya Kumar Borah (1):
      drm: Add helper to extract lut from struct drm_color_lut32

Chaoyi Chen (2):
      dt-bindings: ili9881c: Add compatible string for Wanchanglong w552946aaa
      drm/panel: ilitek-ili9881d: Add support for Wanchanglong W552946AAA panel

Christian König (2):
      dma-buf/sw-sync: always taint the kernel when sw-sync is used
      dma-buf: cleanup dma_fence_describe v3

Cristian Ciocaltea (7):
      dt-bindings: display: rk3588-dw-hdmi-qp: Add frl-enable-gpios property
      drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main struct
      drm/rockchip: vop2: Check bpc before switching DCLK source
      drm/bridge: dw-hdmi-qp: Handle platform supported formats and color depth
      drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
      drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576 regs
      drm/rockchip: dw_hdmi_qp: Add high color depth support

Damon Ding (1):
      drm/rockchip: analogix_dp: Use dev_err_probe() instead of DRM_DEV_ERROR() during probing

Daniel Thompson (1):
      drm/edp-panel: Add touchscreen panel used by Lenovo X13s

David Heidelberg (9):
      dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
      drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
      drm/panel: sofef00: Handle all regulators
      drm/panel: sofef00: Split sending commands to the enable/disable functions
      drm/panel: sofef00: Introduce page macro
      drm/panel: sofef00: Introduce compatible which includes the panel name
      drm/panel: sofef00: Simplify get_modes
      drm/panel: sofef00: Mark the LPM mode always-on
      drm/panel: sofef00: Non-continuous mode and video burst are supported

Diogo Ivo (1):
      drm/tegra: Add NVJPG driver

Dmitry Osipenko (1):
      drm/rockchip: Set VOP for the DRM DMA device

Ettore Chimenti (3):
      dt-bindings: vendor-prefixes: Add ASL Xiamen Technology
      dt-bindings: display: bridge: simple: document the ASL CS5263 DP-to-HDMI bridge
      drm/bridge: simple: add ASL CS5263 DP-to-HDMI bridge

Fabio Estevam (3):
      dt-bindings: vendor-prefixes: Add Raystar Optronics, Inc
      dt-bindings: display: simple: Add Raystar RFF500F-AWH-DNN panel
      drm/panel: simple: Add Raystar RFF500F-AWH-DNN panel entry

Harry Wentland (29):
      drm: Add helper for conversion from signed-magnitude
      drm/vkms: Add kunit tests for VKMS LUT handling
      drm/doc/rfc: Describe why prescriptive color pipeline is needed
      drm/colorop: Introduce new drm_colorop mode object
      drm/colorop: Add TYPE property
      drm/colorop: Add 1D Curve subtype
      drm/colorop: Add BYPASS property
      drm/colorop: Add NEXT property
      drm/colorop: Add atomic state print for drm_colorop
      drm/plane: Add COLOR PIPELINE property
      drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
      Documentation/gpu: document drm_colorop
      drm/vkms: Add enumerated 1D curve colorop
      drm/vkms: Add kunit tests for linear and sRGB LUTs
      drm/colorop: Add 3x4 CTM type
      drm/vkms: Use s32 for internal color pipeline precision
      drm/vkms: add 3x4 matrix in color pipeline
      drm/tests: Add a few tests around drm_fixed.h
      drm/vkms: Add tests for CTM handling
      drm/colorop: pass plane_color_pipeline client cap to atomic check
      drm/amd/display: Ignore deprecated props when plane_color_pipeline set
      drm/amd/display: Add bypass COLOR PIPELINE
      drm/colorop: Add PQ 125 EOTF and its inverse
      drm/amd/display: Enable support for PQ 125 EOTF and Inverse
      drm/colorop: add BT2020/BT709 OETF and Inverse OETF
      drm/amd/display: Add support for BT.709 and BT.2020 TFs
      drm/colorop: Define LUT_1D interpolation
      drm/colorop: allow non-bypass colorops
      drm/amd/display: Add AMD color pipeline doc

Josua Mayer (3):
      dt-bindings: display: panel: ronbo,rb070d30: panel-common ref
      dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
      drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sleep

Karunika Choo (8):
      drm/panthor: Add arch-specific panthor_hw binding
      drm/panthor: Add architecture-specific function operations
      drm/panthor: Introduce panthor_pwr API and power control framework
      drm/panthor: Implement L2 power on/off via PWR_CONTROL
      drm/panthor: Implement soft reset via PWR_CONTROL
      drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
      drm/panthor: Support 64-bit endpoint_req register for Mali-G1
      drm/panthor: Add support for Mali-G1 GPUs

Langyan Ye (1):
      drm/panel-edp: Add CSW MNE007QB3-1

Louis Chauvet (2):
      drm/vkms: Pass plane_cfg to plane initialization
      drm/vkms: Add config for default plane pipeline

Loïc Molinari (1):
      drm/panthor: Improve IOMMU map/unmap debugging logs

Maud Spierings (2):
      dt-bindings: display: bridge: simple: document the Parade PS185HDM DP-to-HDMI bridge
      drm/bridge: simple: add the Parade PS185HDM DP-to-HDMI bridge

Mikko Perttunen (1):
      gpu: host1x: Syncpoint interrupt performance optimization

Nishanth Menon (5):
      dt-bindings: display: bridge: it66121: Add compatible string for IT66122
      drm/bridge: it66121: Drop ftrace like dev_dbg() prints
      drm/bridge: it66121: Sort the compatibles
      drm/bridge: it66121: Use vid/pid to detect the type of chip
      drm/bridge: it66121: Add minimal it66122 support

Pierre-Eric Pelloux-Prayer (2):
      drm/ttm: rework pipelined eviction fence handling
      drm/amdgpu: use ttm_resource_manager_cleanup

Steven Price (1):
      drm/gem: Correct error condition in drm_gem_objects_lookup

Suraj Kandpal (1):
      drm/display/dp_mst: Add protection against 0 vcpi

Svyatoslav Ryhel (6):
      drm/tegra: dsi: Make SOL delay calculation mode independent
      drm/tegra: dsi: Calculate packet parameters for video mode
      dt-bindings: display: panel: properly document LG LD070WX3 panel
      gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
      dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
      gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel support

Thomas Zimmermann (7):
      drm/client: Pass force parameter to client restore
      drm/client: Support emergency restore via sysrq for all clients
      drm/client: log: Implement struct drm_client_funcs.restore
      drm/fb-helper: Allocate and release fb_info in single place
      drm/ast: Move cursor format conversion into helper function
      drm/ast: Support cursor buffers objects in I/O memory
      drm/ast: Wrap cursor framebuffer access in drm_gem_fb_begin/end_cpu_access()

Tvrtko Ursulin (2):
      drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup
      drm/panic: Report invalid or unsupported panic modes

Uma Shankar (1):
      drm: Add Enhanced LUT precision structure

 .../bindings/display/bridge/ite,it66121.yaml       |   1 +
 .../bindings/display/bridge/simple-bridge.yaml     |   2 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |   1 +
 .../bindings/display/panel/lg,ld070wx3-sl01.yaml   |  60 ++
 .../bindings/display/panel/panel-lvds.yaml         |   2 +
 .../bindings/display/panel/panel-simple-dsi.yaml   |  27 +-
 .../bindings/display/panel/panel-simple.yaml       |   4 +
 .../bindings/display/panel/ronbo,rb070d30.yaml     |  14 +-
 .../bindings/display/panel/samsung,sofef00.yaml    |  79 ++
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       |  11 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 Documentation/gpu/drm-kms.rst                      |  15 +
 Documentation/gpu/rfc/color_pipeline.rst           | 378 ++++++++++
 Documentation/gpu/rfc/index.rst                    |   3 +
 MAINTAINERS                                        |   7 +
 drivers/dma-buf/dma-fence.c                        |  20 +-
 drivers/dma-buf/heaps/system_heap.c                |  33 +-
 drivers/dma-buf/sw_sync.c                          |   4 +
 drivers/gpu/drm/Makefile                           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   6 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 768 ++++++++++++++++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  | 209 ++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h  |  36 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  26 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  39 +
 drivers/gpu/drm/armada/armada_fbdev.c              |  12 +-
 drivers/gpu/drm/ast/ast_cursor.c                   |  83 ++-
 drivers/gpu/drm/bridge/ite-it66121.c               |  68 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |  10 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  11 +-
 drivers/gpu/drm/clients/drm_fbdev_client.c         |   6 +-
 drivers/gpu/drm/clients/drm_log.c                  |  13 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   3 +-
 drivers/gpu/drm/drm_atomic.c                       | 167 ++++-
 drivers/gpu/drm/drm_atomic_helper.c                |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c                  | 156 ++++
 drivers/gpu/drm/drm_client.c                       |   1 +
 drivers/gpu/drm/drm_client_event.c                 |   4 +-
 drivers/gpu/drm/drm_client_sysrq.c                 |  65 ++
 drivers/gpu/drm/drm_color_mgmt.c                   |  43 ++
 drivers/gpu/drm/drm_colorop.c                      | 599 +++++++++++++++
 drivers/gpu/drm/drm_connector.c                    |   1 +
 drivers/gpu/drm/drm_crtc_internal.h                |   1 +
 drivers/gpu/drm/drm_drv.c                          |   3 +
 drivers/gpu/drm/drm_fb_helper.c                    | 108 +--
 drivers/gpu/drm/drm_fbdev_dma.c                    |  12 +-
 drivers/gpu/drm/drm_fbdev_shmem.c                  |  12 +-
 drivers/gpu/drm/drm_fbdev_ttm.c                    |  12 +-
 drivers/gpu/drm/drm_file.c                         |   2 +-
 drivers/gpu/drm/drm_gem.c                          |  16 +-
 drivers/gpu/drm/drm_internal.h                     |  11 +
 drivers/gpu/drm/drm_ioctl.c                        |   7 +
 drivers/gpu/drm/drm_mode_config.c                  |   7 +
 drivers/gpu/drm/drm_mode_object.c                  |  18 +
 drivers/gpu/drm/drm_panic.c                        |  77 +-
 drivers/gpu/drm/drm_plane.c                        |  59 ++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   9 +-
 drivers/gpu/drm/gma500/fbdev.c                     |  12 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   9 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |   9 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   9 +-
 drivers/gpu/drm/panel/Kconfig                      |  20 +-
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-edp.c                  |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 225 ++++++
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |  21 +-
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c          | 184 +++++
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   8 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      | 105 ++-
 drivers/gpu/drm/panel/panel-simple.c               |  92 ++-
 drivers/gpu/drm/panthor/Makefile                   |   1 +
 drivers/gpu/drm/panthor/panthor_device.c           |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h           |   8 +
 drivers/gpu/drm/panthor/panthor_fw.c               | 131 +++-
 drivers/gpu/drm/panthor/panthor_fw.h               |  32 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   6 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |  31 +-
 drivers/gpu/drm/panthor/panthor_gpu.h              |   1 +
 drivers/gpu/drm/panthor/panthor_hw.c               | 107 ++-
 drivers/gpu/drm/panthor/panthor_hw.h               |  47 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              | 297 ++++----
 drivers/gpu/drm/panthor/panthor_pwr.c              | 549 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h              |  23 +
 drivers/gpu/drm/panthor/panthor_regs.h             |  79 ++
 drivers/gpu/drm/panthor/panthor_sched.c            | 509 ++++++++-----
 drivers/gpu/drm/radeon/radeon_fbdev.c              |  13 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  31 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 120 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   3 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  56 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  49 +-
 drivers/gpu/drm/tegra/Makefile                     |   1 +
 drivers/gpu/drm/tegra/drm.c                        |   2 +
 drivers/gpu/drm/tegra/drm.h                        |   1 +
 drivers/gpu/drm/tegra/dsi.c                        |  59 +-
 drivers/gpu/drm/tegra/fbdev.c                      |   9 +-
 drivers/gpu/drm/tegra/nvjpg.c                      | 330 +++++++++
 drivers/gpu/drm/tests/Makefile                     |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c              |  71 ++
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |  11 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |   5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  47 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  38 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |  31 +-
 drivers/gpu/drm/vkms/Makefile                      |   4 +-
 drivers/gpu/drm/vkms/tests/Makefile                |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c       | 414 +++++++++++
 drivers/gpu/drm/vkms/tests/vkms_config_test.c      |  47 +-
 drivers/gpu/drm/vkms/vkms_colorop.c                | 120 +++
 drivers/gpu/drm/vkms/vkms_composer.c               | 135 +++-
 drivers/gpu/drm/vkms/vkms_composer.h               |  28 +
 drivers/gpu/drm/vkms/vkms_config.c                 |   7 +-
 drivers/gpu/drm/vkms/vkms_config.h                 |  28 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   8 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |  12 +-
 drivers/gpu/drm/vkms/vkms_luts.c                   | 811 +++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h                   |  12 +
 drivers/gpu/drm/vkms/vkms_output.c                 |   6 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   9 +-
 drivers/gpu/host1x/dev.c                           |   9 +
 drivers/gpu/host1x/dev.h                           |   3 +
 drivers/gpu/host1x/hw/intr_hw.c                    |  56 +-
 include/drm/bridge/dw_hdmi_qp.h                    |   4 +
 include/drm/drm_atomic.h                           | 111 +++
 include/drm/drm_atomic_uapi.h                      |   3 +
 include/drm/drm_client.h                           |   8 +-
 include/drm/drm_client_event.h                     |   4 +-
 include/drm/drm_color_mgmt.h                       |  29 +
 include/drm/drm_colorop.h                          | 464 ++++++++++++
 include/drm/drm_device.h                           |   8 +
 include/drm/drm_fb_helper.h                        |  20 +-
 include/drm/drm_file.h                             |   7 +
 include/drm/drm_fixed.h                            |  17 +
 include/drm/drm_mode_config.h                      |  18 +
 include/drm/drm_plane.h                            |  19 +
 include/drm/ttm/ttm_resource.h                     |  29 +-
 include/uapi/drm/amdgpu_drm.h                      |   9 -
 include/uapi/drm/drm.h                             |  15 +
 include/uapi/drm/drm_mode.h                        | 134 ++++
 142 files changed, 8315 insertions(+), 1085 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
 create mode 100644 drivers/gpu/drm/drm_client_sysrq.c
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h
 create mode 100644 drivers/gpu/drm/tegra/nvjpg.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h
