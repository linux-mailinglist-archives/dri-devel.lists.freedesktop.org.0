Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72B397D3FF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 12:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ED610E7FD;
	Fri, 20 Sep 2024 10:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoUAD/MT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D3910E0BB;
 Fri, 20 Sep 2024 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726826863; x=1758362863;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=a/GhloYEALPRDkcu3EqoS6jgoiprwztckTrjPmmx4+k=;
 b=HoUAD/MTD88d8esyP6Z/u1MOmkO66b12XycT7aDHF5UBX4NB/JdEQskI
 askBh+ewH5V40HblvHQ/13tClWJLDyfRk6cHWBHnwwdJQd9bM22BX9DvV
 BOQcnIcQR8GwC9wOwkT6MYBHiZ/27yiVhxpaREFTZAfRb7T+ktnoJenOY
 Hogt1NHuwsQD6/Wzv6kGNpdkHQSUi69KAvT49PwqdrMA/tTTfUiTDY2s9
 iNDXCUiy2ih2w7+MOGJlve5Q3Qn2OagT0Tv2oorq6gSri3v3m1C93M9a0
 qemP2stg0SDBMZark1IdkwcLroscSbuMx3BIZHbwZ+5tpLrX7Q7zEwnB0 g==;
X-CSE-ConnectionGUID: /Qek722nQqGZ/8Y6oeKcxA==
X-CSE-MsgGUID: 79L3uFX0RAaxNSMMOfs+JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25976317"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="25976317"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 03:07:43 -0700
X-CSE-ConnectionGUID: 3i/TlKB2QTiqVvBA/4a1iA==
X-CSE-MsgGUID: 4h9q4ZmIS/C2ILcBcXiwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="69850972"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.43])
 ([10.245.245.43])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 03:07:38 -0700
Message-ID: <445713a6-2427-4c53-8ec2-3a894ec62405@linux.intel.com>
Date: Fri, 20 Sep 2024 12:07:44 +0200
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

First pull request for v6.12!

Enjoy!

Cheers,
~Maarten

drm-misc-next-2024-09-20:
drm-misc-next for v6.12:

UAPI Changes:
- Add panthor/DEV_QUERY_TIMESTAMP_INFO query.

Cross-subsystem Changes:
- Updated dt bindings.
- Add documentation explaining default errnos for fences.
- Mark dma-buf heaps creation functions as __init.

Core Changes:
- Split DSC helpers from DP helpers.
- Clang build fixes for drm/mm test.
- Remove simple pipeline support for gem-vram,
  no longer any users left after converting bochs.
- Add erno to drm_sched_start to distinguish between GPU and queue
  reset.
- Add drm_framebuffer testcases.
- Fix uninitialized spinlock acquisition with CONFIG_DRM_PANIC=n.
- Use read_trylock instead of read_lock in dma_fence_begin_signalling to
  quiesce lockdep.

Driver Changes:
- Assorted small fixes and updates for tegra, host1x, imagination,
  nouveau, panfrost, panthor, panel/ili9341, mali, exynos,
  panel/samsung-s6e3fa7, ast, bridge/ti-sn65dsi86, panel/himax-hx83112a,
  bridge/tc358767, bridge/imx8mp-hdmi-tx, panel/khadas-ts050,
  panel/nt36523, panel/sony-acx565akm, kmb, accel/qaic, omap, v3d.
- Add bridge/TI TDP158.
- Assorted documentation updates.
- Convert bochs from simple drm to gem shmem, and check modes
  against available memory.
- Many VC4 fixes, most related to scaling and YUV support.
- Convert some drivers to use SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS.
- Rockchip 4k@60 support.
The following changes since commit b615b9c36cae0468491547206406a909a9a37f26:

  Merge v6.11-rc7 into drm-next (2024-09-11 09:18:15 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-09-20

for you to fetch changes up to 2facdd6002ad67357dd7f77a388ae602bc910ace:

  dma-buf/dma-fence: Use a successful read_trylock() annotation for dma_fence_begin_signalling() (2024-09-20 09:27:00 +0200)

----------------------------------------------------------------
drm-misc-next for v6.12:

UAPI Changes:
- Add panthor/DEV_QUERY_TIMESTAMP_INFO query.

Cross-subsystem Changes:
- Updated dt bindings.
- Add documentation explaining default errnos for fences.
- Mark dma-buf heaps creation functions as __init.

Core Changes:
- Split DSC helpers from DP helpers.
- Clang build fixes for drm/mm test.
- Remove simple pipeline support for gem-vram,
  no longer any users left after converting bochs.
- Add erno to drm_sched_start to distinguish between GPU and queue
  reset.
- Add drm_framebuffer testcases.
- Fix uninitialized spinlock acquisition with CONFIG_DRM_PANIC=n.
- Use read_trylock instead of read_lock in dma_fence_begin_signalling to
  quiesce lockdep.

Driver Changes:
- Assorted small fixes and updates for tegra, host1x, imagination,
  nouveau, panfrost, panthor, panel/ili9341, mali, exynos,
  panel/samsung-s6e3fa7, ast, bridge/ti-sn65dsi86, panel/himax-hx83112a,
  bridge/tc358767, bridge/imx8mp-hdmi-tx, panel/khadas-ts050,
  panel/nt36523, panel/sony-acx565akm, kmb, accel/qaic, omap, v3d.
- Add bridge/TI TDP158.
- Assorted documentation updates.
- Convert bochs from simple drm to gem shmem, and check modes
  against available memory.
- Many VC4 fixes, most related to scaling and YUV support.
- Convert some drivers to use SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS.
- Rockchip 4k@60 support.

----------------------------------------------------------------
Alexander Stein (3):
      drm/bridge: tc358767: Use dev_err_probe
      drm/bridge: tc358767: Only print GPIO debug output if they actually occur
      drm/bridge: tc358767: Support write-only registers

Andrew Kreimer (1):
      drm/rockchip: Fix a typo

Andy Shevchenko (3):
      drm/panel: ili9341: Remove duplicate code
      drm/mm: Mark drm_mm_interval_tree*() functions with __maybe_unused
      drm/panel: sony-acx565akm: Use %*ph to print small buffer

Aryabhatta Dey (1):
      Documentation/gpu: Fix typo in Documentation/gpu/komeda-kms.rst

Carlos Eduardo Gallo Filho (9):
      drm/tests: Stop using deprecated dev_private member on drm_framebuffer tests
      drm/tests: Add parameters to the drm_test_framebuffer_create test
      drm/tests: Replace strcpy to strscpy on drm_test_framebuffer_create test
      drm/tests: Add test case for drm_internal_framebuffer_create()
      drm/tests: Add test for drm_framebuffer_check_src_coords()
      drm/tests: Add test for drm_framebuffer_cleanup()
      drm/tests: Add test for drm_framebuffer_lookup()
      drm/tests: Add test for drm_framebuffer_init()
      drm/tests: Add test for drm_framebuffer_free()

Chen Yufan (1):
      drm/imagination: Convert to use time_before macro

Christian König (4):
      drm/sched: add optional errno to drm_sched_start()
      dma-buf: give examples of error codes to use
      drm/doc: Document submission error signaling
      drm/todos: add entry for drm_syncobj error handling

Colin Ian King (1):
      drm/tegra: hdmi: Make read-only const array freqs static

Dave Stevenson (8):
      drm/vc4: crtc: Force trigger of dlist update on margins change
      drm/vc4: hvs: Set AXI panic modes for the HVS
      drm/vc4: hvs: Don't write gamma luts on 2711
      drm/vc4: plane: YUV planes require vertical scaling to always be enabled
      drm/vc4: hvs: Fix dlist debug not resetting the next entry pointer
      drm/vc4: hvs: Remove incorrect limit from hvs_dlist debugfs function
      drm/vc4: plane: Move the buffer offset out of the vc4_plane_state
      drm/vc4: hvs: Correct logic on stopping an HVS channel

Detlev Casanova (1):
      dt-bindings: gpu: Add rockchip,rk3576-mali compatible

Dmitry Baryshkov (15):
      drm/display: split DSC helpers from DP helpers
      dt-bindings: display: fsl-imx-drm: drop edid property support
      dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
      drm/imx: cleanup the imx-drm header
      drm/imx: parallel-display: drop edid override support
      drm/imx: ldb: drop custom EDID support
      drm/imx: ldb: drop custom DDC bus support
      drm/imx: ldb: switch to drm_panel_bridge
      drm/imx: parallel-display: switch to drm_panel_bridge
      drm/imx: add internal bridge handling display-timings DT node
      drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connector
      drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector
      drm/imx: move imx_drm_connector_destroy to imx-tve
      drm/xe: select DRM_DISPLAY_DSC_HELPER
      drm/msm: add another DRM_DISPLAY_DSC_HELPER selection

Dom Cobley (7):
      drm/vc4: plane: Keep fractional source coords inside state
      drm/vc4: plane: Handle fractional coordinates using the phase field
      drm/vc4: hdmi: Avoid log spam for audio start failure
      drm/vc4: plane: Add support for YUV444 formats
      drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
      drm/vc4: hdmi: Avoid hang with debug registers when suspended
      drm/vc4: hvs: Remove ABORT_ON_EMPTY flag

Dominique Martinet (1):
      drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with selected clock

Douglas Anderson (2):
      drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
      drm/rockchip: dw_hdmi: Use auto-generated tables

Fabio Estevam (6):
      drm/bridge: imx8mp-hdmi-tx: Switch to SYSTEM_SLEEP_PM_OPS()
      drm/bridge: imx8qm-ldb: Switch to RUNTIME_PM_OPS()
      drm/bridge: imx8qxp-pixel-combiner: Switch to RUNTIME_PM_OPS()
      drm/bridge: samsung-dsim: Switch to RUNTIME_PM_OPS()
      drm/bridge: dw-hdmi-cec: Switch to SYSTEM_SLEEP_PM_OPS()
      drm/bridge: imx8qxp-ldb: Switch to RUNTIME_PM_OPS()

Jani Nikula (8):
      drm/tegra: fix potential uninitialized variable use
      drm/exynos: hdmi: use display_info for printing display dimensions
      drm/exynos: hdmi: convert to struct drm_edid
      drm/mm: annotate drm_mm_node_scanned_block() with __maybe_unused
      drm/bridge/tdp158: fix build failure
      drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request, release} with __maybe_unused
      drm/kmb: annotate set_test_mode_src_osc_freq_target_{low, hi}_bits() with __maybe_unused
      drm/imagination: annotate pvr_fw_version_packed() with __maybe_unused

Jianhua Lu (1):
      drm: panel: nt36523: use devm_mipi_dsi_* function to register and attach dsi

Jinjie Ruan (4):
      drm/nouveau: Use for_each_child_of_node_scoped()
      drm/imagination: Use memdup_user() helper to simplify code
      drm/imagination: Use memdup_user() helper
      drm/panthor: Use the BITS_PER_LONG macro

Jonas Karlman (3):
      drm/rockchip: dw_hdmi: Filter modes based on hdmiphy_clk
      drm/rockchip: dw_hdmi: Enable 4K@60Hz mode on RK3399 and RK356x
      drm/rockchip: Load crtc devices in preferred order

Kunwu Chan (1):
      gpu: host1x: Make host1x_context_device_bus_type constant

Li Zetao (1):
      drm/nouveau/volt: use clamp() in nvkm_volt_map()

Longlong Xia (1):
      accel/qaic: Change to use DEFINE_SHOW_ATTRIBUTE macro

Lu Baolu (1):
      drm/nouveau/tegra: Use iommu_paging_domain_alloc()

Lyude Paul (1):
      drm/panic: Fix uninitialized spinlock acquisition with CONFIG_DRM_PANIC=n

Marc Gonzalez (2):
      dt-bindings: display: bridge: add TI TDP158
      drm/bridge: add support for TI TDP158

Mary Guillemard (3):
      drm/panfrost: Add SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY parameters
      drm/panfrost: Add cycle counter job requirement
      drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query

Matt Coster (1):
      drm/imagination: Use pvr_vm_context_get()

Maxime Ripard (15):
      drm/vc4: hdmi: Warn if writing to an unknown HDMI register
      drm/vc4: hvs: More logging for dlist generation
      drm/vc4: hvs: Print error if we fail an allocation
      drm/vc4: plane: Add more debugging for LBM allocation
      drm/vc4: plane: Use return variable in atomic_check
      drm/vc4: crtc: Move assigned_channel to a variable
      drm/vc4: Introduce generation number enum
      drm/vc4: Make v3d paths unavailable on any generation newer than vc4
      drm/vc4: hvs: Use switch statement to simplify vc4_hvs_get_fifo_from_output
      drm/vc4: hvs: Create hw_init function
      drm/vc4: hvs: Create cob_init function
      drm/vc4: hvs: Rename hvs_regs list
      drm/vc4: plane: Change ptr0_offset to an array
      drm/vc4: hvs: Rework LBM alignment
      drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to pass registers

Mikko Perttunen (6):
      drm/tegra: gem: Open code drm_prime_gem_destroy
      drm/tegra: gem: Don't attach dma-bufs when not needed
      gpu: host1x: Fix _writel function declarations
      gpu: host1x: Handle CDMA wraparound when debug printing
      gpu: host1x: Complete stream ID entry tables
      gpu: host1x: Add MLOCK recovery for rest of engines

Min-Hua Chen (1):
      drm/panel: khadas-ts050: make ts050[v2]_panel_data static

Nickey Yang (1):
      drm/rockchip: dw_hdmi: Add phy_config for 594Mhz pixel clock

Steven Price (1):
      drm/panthor: Display FW version information

T.J. Mercier (1):
      dma-buf: heaps: Add __init to CMA and system heap module_init functions

Tejas Vipin (3):
      drm/panel: samsung-s6e3fa7: transition to mipi_dsi wrapped functions
      drm/panel: himax-hx83112a: transition to mipi_dsi wrapped functions
      drm/panel: raydium-rm69380: transition to mipi_dsi wrapped functions

Thierry Reding (1):
      Revert "drm/tegra: gr3d: Convert into dev_pm_domain_attach|detach_list()"

Thomas Hellström (1):
      dma-buf/dma-fence: Use a successful read_trylock() annotation for dma_fence_begin_signalling()

Thomas Zimmermann (26):
      Merge drm/drm-next into drm-misc-next
      drm/bochs: Remove manual format test from fb_create
      drm/bochs: Use helpers for struct drm_edid
      drm/bochs: Do managed resource cleanup
      drm/bochs: Pass bochs device to various functions
      drm/bochs: Upcast with to_bochs_device()
      drm/bochs: Allocate DRM device in struct bochs_device
      drm/bochs: Use regular atomic helpers
      drm/bochs: Use GEM SHMEM helpers for memory management
      drm/bochs: Validate display modes against available video memory
      drm/gem-vram: Remove support for simple display pipelines
      Merge drm/drm-next into drm-misc-next
      drm/ast: Remove TX-chip bitmask
      drm/ast: astdp: Inline ast_astdp_connector_init()
      drm/ast: astdp: Avoid upcasting to struct ast_device
      drm/ast: astdp: Replace power_on helpers
      drm/ast: astdp: Replace ast_dp_set_on_off()
      drm/ast: dp501: Inline ast_dp501_connector_init()
      drm/ast: dp501: Avoid upcasting to struct ast_device
      drm/ast: sil164: Inline ast_sil164_connector_init()
      drm/ast: vga: Inline ast_vga_connector_init()
      drm/ast: Respect return value from CRTC init
      drm/ast: Avoid upcasting to struct ast_device
      drm/ast: Rename register constants for TX-chip types
      drm/ast: Use TX-chip register constants
      drm/ast: Warn about unsupported TX chips

Tim Gover (1):
      drm/vc4: hvs: Enable SCALER_CONTROL early in HVS init

Tomi Valkeinen (3):
      drm/omap: Fix possible NULL dereference
      drm/omap: Hide sparse warnings
      drm/omap: Fix locking in omap_gem_new_dmabuf()

Tvrtko Ursulin (1):
      drm/v3d: Appease lockdep while updating GPU stats

Yakir Yang (1):
      drm/rockchip: dw_hdmi: Adjust cklvl & txlvl for RF/EMI

Yan Zhao (1):
      drm/bochs: use devm_ioremap_wc() to map framebuffer

 .../bindings/display/bridge/ti,tdp158.yaml         |  57 +++
 .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
 .../devicetree/bindings/display/imx/ldb.txt        |   1 -
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |   1 +
 Documentation/gpu/drm-uapi.rst                     |  27 +-
 Documentation/gpu/komeda-kms.rst                   |   2 +-
 Documentation/gpu/todo.rst                         |  16 +
 drivers/accel/qaic/qaic_debugfs.c                  |  43 +--
 drivers/dma-buf/dma-fence.c                        |   6 +-
 drivers/dma-buf/heaps/cma_heap.c                   |   4 +-
 drivers/dma-buf/heaps/system_heap.c                |   2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   2 +-
 drivers/gpu/drm/ast/ast_dp.c                       | 137 ++++----
 drivers/gpu/drm/ast/ast_dp501.c                    | 111 +++---
 drivers/gpu/drm/ast/ast_drv.c                      |   2 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  19 +-
 drivers/gpu/drm/ast/ast_main.c                     |  67 ++--
 drivers/gpu/drm/ast/ast_mode.c                     |  34 +-
 drivers/gpu/drm/ast/ast_post.c                     |  36 +-
 drivers/gpu/drm/ast/ast_reg.h                      |  41 +--
 drivers/gpu/drm/ast/ast_sil164.c                   |  59 ++--
 drivers/gpu/drm/ast/ast_vga.c                      |  59 ++--
 drivers/gpu/drm/bridge/Kconfig                     |   7 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
 drivers/gpu/drm/bridge/imx/Makefile                |   1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  87 +++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |  20 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |   9 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |   9 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   9 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   8 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |   8 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  56 +--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   4 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 | 111 ++++++
 drivers/gpu/drm/display/Kconfig                    |   6 +
 drivers/gpu/drm/display/Makefile                   |   5 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   2 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   2 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |  45 ---
 drivers/gpu/drm/drm_mm.c                           |   4 +-
 drivers/gpu/drm/drm_mode_object.c                  |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  25 +-
 drivers/gpu/drm/i915/Kconfig                       |   1 +
 drivers/gpu/drm/imagination/pvr_ccb.c              |   2 +-
 drivers/gpu/drm/imagination/pvr_context.c          |  18 +-
 drivers/gpu/drm/imagination/pvr_drv.c              |   2 +-
 drivers/gpu/drm/imagination/pvr_job.c              |  13 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |   4 +-
 drivers/gpu/drm/imagination/pvr_vm.c               |   4 +-
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |  10 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   7 -
 drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  14 -
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 203 +++--------
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 139 ++------
 drivers/gpu/drm/kmb/kmb_dsi.c                      |   4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |   2 +-
 drivers/gpu/drm/msm/Kconfig                        |   2 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c    |   2 +-
 drivers/gpu/drm/omapdrm/dss/base.c                 |  25 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h              |   3 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   6 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   4 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |  10 +-
 drivers/gpu/drm/panel/Kconfig                      |   6 +-
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 291 +++++++--------
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 210 +----------
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |   4 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |  16 +-
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      |  87 ++---
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |  71 ++--
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   3 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  45 ++-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |  12 +
 drivers/gpu/drm/panfrost/panfrost_gpu.h            |   1 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |  30 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |   2 +
 drivers/gpu/drm/panthor/panthor_drv.c              |  43 ++-
 drivers/gpu/drm/panthor/panthor_fw.c               |  57 ++-
 drivers/gpu/drm/panthor/panthor_gpu.c              |  47 +++
 drivers/gpu/drm/panthor/panthor_gpu.h              |   4 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |   6 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-reg.h              |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 162 ++++-----
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |  23 ++
 drivers/gpu/drm/scheduler/sched_main.c             |   7 +-
 drivers/gpu/drm/tegra/gem.c                        |  65 ++--
 drivers/gpu/drm/tegra/gem.h                        |  21 ++
 drivers/gpu/drm/tegra/gr3d.c                       |  46 ++-
 drivers/gpu/drm/tegra/hdmi.c                       |   2 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c       | 375 +++++++++++++++++++-
 drivers/gpu/drm/tiny/Kconfig                       |   4 +-
 drivers/gpu/drm/tiny/bochs.c                       | 390 ++++++++++++---------
 drivers/gpu/drm/v3d/v3d_sched.c                    |  46 ++-
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |  14 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |  28 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  35 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |  22 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  29 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |  24 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  25 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   5 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      | 359 +++++++++++--------
 drivers/gpu/drm/vc4/vc4_irq.c                      |  10 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  14 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |  20 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    | 281 ++++++++++-----
 drivers/gpu/drm/vc4/vc4_regs.h                     |   1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |  10 +-
 drivers/gpu/drm/vc4/vc4_validate.c                 |   8 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c         |   2 +-
 drivers/gpu/drm/xe/Kconfig                         |   1 +
 drivers/gpu/host1x/context_bus.c                   |   2 +-
 drivers/gpu/host1x/dev.c                           | 150 ++++----
 drivers/gpu/host1x/dev.h                           |   6 +-
 drivers/gpu/host1x/hw/cdma_hw.c                    |  12 +
 drivers/gpu/host1x/hw/debug_hw.c                   |  15 +-
 include/drm/bridge/imx.h                           |  13 +
 include/drm/drm_gem_vram_helper.h                  |  13 -
 include/drm/drm_panic.h                            |  14 +
 include/drm/gpu_scheduler.h                        |   2 +-
 include/linux/dma-fence.h                          |   6 +
 include/linux/host1x.h                             |   5 +
 include/linux/host1x_context_bus.h                 |   2 +-
 include/uapi/drm/panfrost_drm.h                    |   3 +
 include/uapi/drm/panthor_drm.h                     |  22 ++
 137 files changed, 2765 insertions(+), 2131 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/ti-tdp158.c
 create mode 100644 include/drm/bridge/imx.h
