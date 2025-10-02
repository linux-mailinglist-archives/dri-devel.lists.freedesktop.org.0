Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4852CBB436A
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 16:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C63610E1BB;
	Thu,  2 Oct 2025 14:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/Vc9d0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC5B10E1BB;
 Thu,  2 Oct 2025 14:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759416670; x=1790952670;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=T9E/CHOdmanpI2MgQ69QF1ShrXyvkhMvVaFOyvfXfaE=;
 b=a/Vc9d0akGmBYtUrGVvGhqKKenyIQP5wWZmJJ/5ajBXH8FEh1SXKWvo/
 1pVLMhBiIpLb2Ysbl6wKgXTCe5x0SXkv/F2UFzwQvdfkv4P25q/rxwKv7
 2zpNsbEM7KTTIPc3WYBmM/aXrczsm7/sTLPecHIID7zfyYNQJ61YnWSqP
 cpKG07Bm/zdnKUof87+GBY1i6mnywZYYDYJuBMFNIfpgPOdqXrpf5Onfp
 YDrt+2tZNYjx72wB3TzijwmqNYfVt0ohLSjxZIBLG750BDxkiK91xUJnC
 FTLpXxISuXq5EwCNwGwT1zsBLXO35TtZB1VSLNuGP5OLogoD/HtYeN3Lo g==;
X-CSE-ConnectionGUID: p7kDqdzaT9iTKBMQJdVTtQ==
X-CSE-MsgGUID: VsWDqxA/QUC5uClz31XxGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61607530"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61607530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:51:09 -0700
X-CSE-ConnectionGUID: v/QShZ7uRR+rFqaBcv5Krw==
X-CSE-MsgGUID: rE8Q1mIcSOy30oBkWYMrTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="184352374"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.192])
 ([10.245.245.192])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:51:06 -0700
Message-ID: <b412fb91-8545-466a-8102-d89c0f2758a7@linux.intel.com>
Date: Thu, 2 Oct 2025 16:51:03 +0200
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

First pull request for v6.19!

Best regards,
~Maarten


drm-misc-next-2025-10-02:
drm-misc-next for v6.19:

UAPI Changes:

Cross-subsystem Changes:
-  fbcon cleanups.
- Make drivers depend on FB_TILEBLITTING instead of selecting it,
  and hide FB_MODE_HELPERS.

Core Changes:
- More preparations for rust.
- Throttle dirty worker with vblank
- Use drm_for_each_bridge_in_chain_scoped in drm's bridge code and
  assorted fixes.
- Ensure drm_client_modeset tests are enabled in UML.
- Rename ttm_bo_put to ttm_bo_fini, as a further step in removing the
  TTM bo refcount.
- Add POST_LT_ADJ_REQ training sequence.
- Show list of removed but still allocated bridges.
- Add a simulated vblank interrupt for hardware without it,
  and add some helpers to use them in vkms and hypervdrm.

Driver Changes:
- Assorted small fixes, cleanups and updates to host1x, tegra,
  panthor,   amdxdna, gud, vc4, ssd130x, ivpu, panfrost, panthor,
  sysfb, bridge/sn65dsi86, solomon, ast, tidss.
- Convert drivers from using .round_rate() to .determine_rate()
- Add support for KD116N3730A07/A12, chromebook mt8189, JT101TM023,
  LQ079L1SX01, raspberrypi 5" panels.
- Improve reclocking on tegra186+ with nouveau.
- Improve runtime pm in amdxdna.
- Add support for HTX_PAI in imx.
- Use a helper to calculate dumb buffer sizes in most drivers.
The following changes since commit 0d9f0083f7a5a31d91d501467b499bb8c4b25bdf:

  Merge tag 'v6.17-rc6' into drm-next (2025-09-15 17:51:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-10-02

for you to fetch changes up to aa1c2b073ad23847dd2e7bdc7d30009f34ed7f59:

  accel/ivpu: Fix DCT active percent format (2025-10-02 07:44:53 +0200)

----------------------------------------------------------------
drm-misc-next for v6.19:

UAPI Changes:

Cross-subsystem Changes:
-  fbcon cleanups.
- Make drivers depend on FB_TILEBLITTING instead of selecting it,
  and hide FB_MODE_HELPERS.

Core Changes:
- More preparations for rust.
- Throttle dirty worker with vblank
- Use drm_for_each_bridge_in_chain_scoped in drm's bridge code and
  assorted fixes.
- Ensure drm_client_modeset tests are enabled in UML.
- Rename ttm_bo_put to ttm_bo_fini, as a further step in removing the
  TTM bo refcount.
- Add POST_LT_ADJ_REQ training sequence.
- Show list of removed but still allocated bridges.
- Add a simulated vblank interrupt for hardware without it,
  and add some helpers to use them in vkms and hypervdrm.

Driver Changes:
- Assorted small fixes, cleanups and updates to host1x, tegra,
  panthor,   amdxdna, gud, vc4, ssd130x, ivpu, panfrost, panthor,
  sysfb, bridge/sn65dsi86, solomon, ast, tidss.
- Convert drivers from using .round_rate() to .determine_rate()
- Add support for KD116N3730A07/A12, chromebook mt8189, JT101TM023,
  LQ079L1SX01, raspberrypi 5" panels.
- Improve reclocking on tegra186+ with nouveau.
- Improve runtime pm in amdxdna.
- Add support for HTX_PAI in imx.
- Use a helper to calculate dumb buffer sizes in most drivers.

----------------------------------------------------------------
Aaron Kling (2):
      drm/nouveau: Support reclocking on gp10b
      drm/nouveau: Support devfreq for Tegra

Akhilesh Patil (1):
      gpu: host1x: Use dev_err_probe() in probe path

Andrzej Kacprowski (3):
      accel/ivpu: Remove unused firmware boot parameters
      accel/ivpu: Add support for user-managed preemption buffer
      accel/ivpu: Fix doc description of job structure

Athul Raj Kollareth (1):
      drm: Replace the deprecated DRM_* logging macros in gem helper files

Boris Brezillon (4):
      drm/panfrost: Introduce uAPI for JM context creation
      drm/panfrost: Introduce JM contexts for manging job resources
      drm/panfrost: Expose JM context IOCTLs to UM
      drm/panfrost: Display list of device JM contexts over debugfs

Brahmajit Das (1):
      drm/tegra: hdmi: sor: Fix error: variable ‘j’ set but not used

Brian Masney (7):
      drm/imx/ipuv3/imx-tve: convert from round_rate() to determine_rate()
      drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
      drm/pl111: convert from round_rate() to determine_rate()
      drm/stm/dw_mipi_dsi-stm: convert from round_rate() to determine_rate()
      drm/stm/lvds: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_hdmi_ddc_clk: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_tcon_dclk: convert from round_rate() to determine_rate()

Chia-I Wu (2):
      drm/panthor: assign unique names to queues
      drm/panthor: always set fence errors on CS_FAULT

Christian König (1):
      drm/ttm: rename ttm_bo_put to _fini v3

Christopher Obbard (1):
      drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities

Dmitry Baryshkov (2):
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/tests: make sure drm_client_modeset tests are enabled

Geert Uytterhoeven (1):
      drm/bridge: imx8qxp-ldb: Remove dummy Runtime PM callback

Guido Günther (3):
      drm/panel: visionox-rm69299: Fix clock frequency for SHIFT6mq
      drm/panel: visionox-rm69299: Don't clear all mode flags
      drm/panel: visionox-rm69299: Add backlight support

Iker Pedrosa (5):
      drm/solomon: Move calls to drm_gem_fb_end_cpu*()
      drm/solomon: Use drm_WARN_ON_ONCE instead of WARN_ON
      drm/solomon: Simplify mode_valid() using DRM helper
      drm/solomon: Simplify get_modes() using DRM helper
      drm/solomon: Enforce one assignment per line

Jacek Lawrynowicz (4):
      accel/ivpu: Refactor priority_bands_show for readability
      accel/ivpu: Rework bind/unbind of imported buffers
      accel/ivpu: Fix page fault in ivpu_bo_unbind_all_bos_from_context()
      accel/ivpu: Improve BO alloc/free warnings

James Flowers (1):
      drm/ssd130x: Use kmalloc_array() instead of kmalloc()

John Ripple (1):
      drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD

Karol Wachowski (5):
      accel/ivpu: Reset cmdq->db_id on register failure
      accel/ivpu: Ensure rpm_runtime_put in case of engine reset/resume fail
      accel/ivpu: Update JSM firmware API to latest 3.32.5 version
      accel/ivpu: Split FW runtime and global memory buffers
      accel/ivpu: Fix DCT active percent format

Lizhi Hou (3):
      accel/amdxdna: Fix an integer overflow in aie2_query_ctx_status_array()
      accel/amdxdna: Call dma_buf_vmap_unlocked() for imported object
      accel/amdxdna: Enhance runtime power management

Luc Ma (1):
      drm/sched: backend_ops doc fix

Luca Ceresoli (14):
      drm/display: bridge-connector: use scope-specific variable for the bridge pointer
      drm/bridge: add drm_for_each_bridge_in_chain_scoped()
      drm/display: bridge-connector: use drm_for_each_bridge_in_chain_scoped()
      drm/atomic: use drm_for_each_bridge_in_chain_scoped()
      drm/bridge: use drm_for_each_bridge_in_chain_scoped()
      drm/bridge: remove drm_for_each_bridge_in_chain()
      drm/bridge: add drm_for_each_bridge_in_chain_from()
      drm/omap: use drm_for_each_bridge_in_chain_from()
      drm/bridge: get the bridge returned by drm_bridge_get_next_bridge()
      drm/bridge: put the bridge returned by drm_bridge_get_next_bridge()
      drm/imx: parallel-display: put the bridge returned by drm_bridge_get_next_bridge()
      drm/bridge: add list of removed refcounted bridges
      drm/debugfs: show lingering bridges
      drm/bridge: adapt drm_bridge_add/remove() docs, mention the lingering list

Luca Weiss (2):
      drm/sysfb: simpledrm: Sort headers correctly
      fbdev/simplefb: Sort headers correctly

Lyude Paul (2):
      drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem_shmem_create()
      drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_free()

Mainak Sen (1):
      gpu: host1x: Fix race in syncpt alloc/free

Marek Vasut (4):
      drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR() parameters lowercase
      dt-bindings: ili9881c: Document 5" Raspberry Pi 720x1280
      drm/panel: ilitek-ili9881c: Add configuration for 5" Raspberry Pi 720x1280
      dt-bindings: ili9881c: Allow port subnode

Maxime Ripard (6):
      drm/crtc: Drop no_vblank bit field
      drm/tidss: Convert to drm logging
      drm/tidss: Remove ftrace-like logs
      drm/tidss: crtc: Change variable name
      drm/tidss: crtc: Implement destroy_state
      drm/tidss: crtc: Cleanup reset implementation

Mikko Perttunen (1):
      gpu: host1x: Wait prefences outside MLOCK

Philipp Stanner (1):
      drm/sched/tests: Remove relict of done_list

Ruben Wauters (2):
      drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
      drm/gud: fix accidentally deleted IS_ERR() check

Shengjiu Wang (5):
      dt-bindings: display: imx: add HDMI PAI for i.MX8MP
      ALSA: Add definitions for the bits in IEC958 subframe
      drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
      drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958 format
      drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface

Steffen Trumtrar (3):
      dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
      dt-bindings: display: simple: Add JuTouch JT101TM023 panel
      drm/panel: simple: add JuTouch JT101TM023

Steven Price (1):
      drm/panfrost: Bump the minor version number

Svyatoslav Ryhel (2):
      dt-bindings: display: panel: document Sharp LQ079L1SX01 panel
      gpu/drm: panel: Add Sharp LQ079L1SX01 panel support

Thomas Zimmermann (45):
      Merge drm/drm-next into drm-misc-next
      drm/fb-helper: Synchronize dirty worker with vblank
      fbcon: Fix empty lines in fbcon.h
      fbcon: Rename struct fbcon_ops to struct fbcon_par
      fbcon: Set rotate_font callback with related callbacks
      fbcon: Move fbcon callbacks into struct fbcon_bitops
      fbcon: Streamline setting rotated/unrotated bitops
      drm/sysfb: Add custom plane state
      drm/sysfb: Lookup blit function during atomic check
      drm/format-helper: Remove drm_fb_blit()
      fbdev: Make drivers depend on FB_TILEBLITTING
      fbdev: Turn FB_MODE_HELPERS into an internal config option
      drm/ast: Move display-clock tables to per-Gen source files
      drm/ast: Move mode-detection helpers to Gen2 source files
      drm/ast: Split ast_detect_tx_chip() per chip generation
      drm/ast: Prepare per-Gen device initialization
      drm/ast: Move Gen1 device initialization into separate helper
      drm/ast: Move Gen2 device initialization into separate helper
      drm/ast: Move Gen3 device initialization into separate helper
      drm/ast: Move Gen4 device initialization into separate helper
      drm/ast: Move Gen5 device initialization into separate helper
      drm/ast: Move Gen6 device initialization into separate helper
      drm/ast: Move Gen7 device initialization into separate helper
      drm/ast: Remove generic device initialization
      drm/dumb-buffers: Sanitize output on errors
      drm/dumb-buffers: Provide helper to set pitch and size
      drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
      drm/vblank: Add vblank timer
      drm/vblank: Add CRTC helpers for simple use cases
      drm/vkms: Convert to DRM's vblank timer
      drm/hypervdrm: Use vblank timer

Tomasz Rusinowicz (1):
      accel/ivpu: Enable MCA ECC signalling based on MSR

Vamsee Vardhan Thummala (1):
      gpu: host1x: Allow loading tegra-drm without enabled engines

Ville Syrjälä (2):
      drm/dp: Add definitions for POST_LT_ADJ training sequence
      drm/dp: Add POST_LT_ADJ_REQ helpers

Zhijian Yan (2):
      drm/panel: Add support for KD116N3730A07
      drm/panel: Add support for KD116N3730A12

Zhongtian Wu (1):
      drm/panel-edp: Add several panel configurations for mt8189 Chromebook

 .clang-format                                      |    2 +-
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml         |   12 +
 .../bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml  |   69 ++
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    2 +
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/sharp,lq079l1sx01.yaml  |   99 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/gpu/drm-kms-helpers.rst              |   12 +
 Documentation/gpu/todo.rst                         |   37 +
 drivers/accel/amdxdna/Makefile                     |    1 +
 drivers/accel/amdxdna/aie2_ctx.c                   |   42 +-
 drivers/accel/amdxdna/aie2_message.c               |   28 +-
 drivers/accel/amdxdna/aie2_pci.c                   |   85 +-
 drivers/accel/amdxdna/aie2_pci.h                   |    3 +-
 drivers/accel/amdxdna/aie2_smu.c                   |   28 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |   62 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |   47 +-
 drivers/accel/amdxdna/amdxdna_mailbox.c            |   13 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   56 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |    2 +
 drivers/accel/amdxdna/amdxdna_pm.c                 |   94 ++
 drivers/accel/amdxdna/amdxdna_pm.h                 |   18 +
 drivers/accel/ivpu/ivpu_debugfs.c                  |   38 +-
 drivers/accel/ivpu/ivpu_drv.c                      |    6 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  221 ++--
 drivers/accel/ivpu/ivpu_fw.h                       |   14 +-
 drivers/accel/ivpu/ivpu_gem.c                      |  115 +-
 drivers/accel/ivpu/ivpu_gem.h                      |   10 +-
 drivers/accel/ivpu/ivpu_hw.c                       |   59 +-
 drivers/accel/ivpu/ivpu_hw.h                       |   10 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |    2 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |    2 +-
 drivers/accel/ivpu/ivpu_job.c                      |  108 +-
 drivers/accel/ivpu/ivpu_job.h                      |   46 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |    2 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   11 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |  513 +++++----
 drivers/gpu/drm/Makefile                           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    2 +-
 drivers/gpu/drm/ast/Makefile                       |    3 +-
 drivers/gpu/drm/ast/ast_2000.c                     |  101 ++
 drivers/gpu/drm/ast/ast_2100.c                     |   85 ++
 drivers/gpu/drm/ast/ast_2200.c                     |   85 ++
 drivers/gpu/drm/ast/ast_2300.c                     |  128 +++
 drivers/gpu/drm/ast/ast_2400.c                     |   93 ++
 drivers/gpu/drm/ast/ast_2500.c                     |   98 ++
 drivers/gpu/drm/ast/ast_2600.c                     |   63 ++
 drivers/gpu/drm/ast/ast_drv.c                      |   67 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   75 +-
 drivers/gpu/drm/ast/ast_main.c                     |  268 -----
 drivers/gpu/drm/ast/ast_mode.c                     |    4 +-
 drivers/gpu/drm/ast/ast_tables.h                   |   60 --
 drivers/gpu/drm/bridge/imx/Kconfig                 |   11 +
 drivers/gpu/drm/bridge/imx/Makefile                |    1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c       |  158 +++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |   65 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    7 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |    5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   18 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  112 ++
 drivers/gpu/drm/display/drm_bridge_connector.c     |   11 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   76 +-
 drivers/gpu/drm/drm_atomic.c                       |    3 +-
 drivers/gpu/drm/drm_bridge.c                       |   52 +-
 drivers/gpu/drm/drm_client_modeset.c               |   44 +
 drivers/gpu/drm/drm_dumb_buffers.c                 |  170 ++-
 drivers/gpu/drm/drm_fb_helper.c                    |   30 +-
 drivers/gpu/drm/drm_format_helper.c                |   91 --
 drivers/gpu/drm/drm_gem.c                          |   16 +-
 drivers/gpu/drm/drm_gem_dma_helper.c               |    9 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  136 ++-
 drivers/gpu/drm/drm_gem_vram_helper.c              |    6 +-
 drivers/gpu/drm/drm_vblank.c                       |  172 ++-
 drivers/gpu/drm/drm_vblank_helper.c                |  176 ++++
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |    8 +-
 drivers/gpu/drm/gma500/fbdev.c                     |   43 -
 drivers/gpu/drm/gud/gud_connector.c                |    8 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   10 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   11 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    4 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   29 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   17 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |    4 +-
 drivers/gpu/drm/loongson/lsdc_gem.c                |   31 +-
 drivers/gpu/drm/mcde/mcde_clk_div.c                |   13 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   27 +-
 drivers/gpu/drm/nouveau/Kconfig                    |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |    2 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h  |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |    7 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c         |   20 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild     |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h    |    1 +
 .../drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c    |  320 ++++++
 .../drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h    |   24 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c    |  185 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h    |   18 +
 drivers/gpu/drm/omapdrm/omap_encoder.c             |    4 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   15 +-
 drivers/gpu/drm/panel/Kconfig                      |   15 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-edp.c                  |    8 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 1098 ++++++++++++--------
 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c    |  225 ++++
 drivers/gpu/drm/panel/panel-simple.c               |   35 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   71 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   11 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  152 ++-
 drivers/gpu/drm/panfrost/panfrost_job.c            |  201 +++-
 drivers/gpu/drm/panfrost/panfrost_job.h            |   25 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |    2 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |   40 +-
 drivers/gpu/drm/panthor/panthor_sched.h            |    3 +-
 drivers/gpu/drm/pl111/pl111_display.c              |   13 +-
 drivers/gpu/drm/qxl/qxl_gem.c                      |    2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |    7 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   12 +-
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |    3 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   86 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |   14 +-
 drivers/gpu/drm/stm/lvds.c                         |   12 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c         |   12 +-
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c            |   18 +-
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   34 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |  153 ++-
 drivers/gpu/drm/sysfb/simpledrm.c                  |    3 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |    3 +-
 drivers/gpu/drm/tegra/gem.c                        |    8 +-
 drivers/gpu/drm/tegra/hdmi.c                       |    4 +-
 drivers/gpu/drm/tegra/sor.c                        |    4 +-
 drivers/gpu/drm/tests/.kunitconfig                 |    2 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   33 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |   10 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |   16 -
 drivers/gpu/drm/tidss/tidss_kms.c                  |    4 -
 drivers/gpu/drm/tidss/tidss_plane.c                |    8 -
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   12 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |   60 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   15 +-
 drivers/gpu/drm/ttm/ttm_bo_internal.h              |    2 +
 drivers/gpu/drm/vc4/Kconfig                        |    1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  137 +--
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    1 -
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   83 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |    2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   21 +-
 drivers/gpu/drm/xe/xe_bo.c                         |   10 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    7 +-
 drivers/gpu/host1x/bus.c                           |   12 +
 drivers/gpu/host1x/dev.c                           |   11 +-
 drivers/gpu/host1x/hw/channel_hw.c                 |  112 +-
 drivers/gpu/host1x/syncpt.c                        |    4 +-
 drivers/video/fbdev/Kconfig                        |    8 +-
 drivers/video/fbdev/core/Kconfig                   |    2 +-
 drivers/video/fbdev/core/bitblit.c                 |  122 +--
 drivers/video/fbdev/core/fbcon.c                   |  459 ++++----
 drivers/video/fbdev/core/fbcon.h                   |   17 +-
 drivers/video/fbdev/core/fbcon_ccw.c               |  151 +--
 drivers/video/fbdev/core/fbcon_cw.c                |  151 +--
 drivers/video/fbdev/core/fbcon_rotate.c            |   47 +-
 drivers/video/fbdev/core/fbcon_rotate.h            |   18 +-
 drivers/video/fbdev/core/fbcon_ud.c                |  167 +--
 drivers/video/fbdev/core/softcursor.c              |   18 +-
 drivers/video/fbdev/core/tileblit.c                |   32 +-
 drivers/video/fbdev/simplefb.c                     |    6 +-
 include/drm/bridge/dw_hdmi.h                       |   11 +-
 include/drm/display/drm_dp.h                       |    3 +
 include/drm/display/drm_dp_helper.h                |    8 +
 include/drm/drm_bridge.h                           |   61 +-
 include/drm/drm_client.h                           |    1 +
 include/drm/drm_crtc.h                             |    2 +-
 include/drm/drm_dumb_buffers.h                     |   14 +
 include/drm/drm_format_helper.h                    |    4 -
 include/drm/drm_gem_shmem_helper.h                 |    2 +
 include/drm/drm_modeset_helper_vtables.h           |   12 +
 include/drm/drm_vblank.h                           |   32 +
 include/drm/drm_vblank_helper.h                    |   56 +
 include/drm/gpu_scheduler.h                        |    2 +-
 include/drm/ttm/ttm_bo.h                           |    2 +-
 include/sound/asoundef.h                           |    9 +
 include/uapi/drm/drm_mode.h                        |   50 +-
 include/uapi/drm/ivpu_accel.h                      |   11 +
 include/uapi/drm/panfrost_drm.h                    |   50 +
 191 files changed, 6739 insertions(+), 2832 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
 create mode 100644 drivers/accel/amdxdna/amdxdna_pm.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_pm.h
 create mode 100644 drivers/gpu/drm/ast/ast_2200.c
 create mode 100644 drivers/gpu/drm/ast/ast_2400.c
 delete mode 100644 drivers/gpu/drm/ast/ast_main.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
 create mode 100644 drivers/gpu/drm/drm_vblank_helper.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c
 create mode 100644 include/drm/drm_dumb_buffers.h
 create mode 100644 include/drm/drm_vblank_helper.h
