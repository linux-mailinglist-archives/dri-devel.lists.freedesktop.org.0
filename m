Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB557899D21
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C769113BB2;
	Fri,  5 Apr 2024 12:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfpVLEZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98F3113BAE;
 Fri,  5 Apr 2024 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712320582; x=1743856582;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=Wj2ayH1gXwiwnbEewC8gc/flNEJ4suafKnHA5yHB1O0=;
 b=lfpVLEZdJ/weP+EHJXuEPmA2YzQ5DEmNKlzX9E3tM0dhTxBToHAc1E2f
 u2ztUAIshYL11xlK1eT0JlkACt0mA18oINbxGcjnptBOZ3lrwbD9PDSmr
 ouk3/w5TTGP6zvrTnQVXLMCx8YcueeH1dXKkuiUmovluDVinEF2bXPJ8b
 OgtD1bXg5np3joysdIAx4b/TblXtDuAoUyD72DY8yjiPbWxfWrLusjfMn
 VXkD39EmJSU7ObXrLllZPQXiKw4DdgN/mWJpEwUPtDr4ANaP5KDqlMRTc
 2H36SVGvNcbJIWwt0BV7JCNZ+iKaXm3n6xK+CNINAI1DFaV4RM8beNfnB A==;
X-CSE-ConnectionGUID: fmCfjNPaSFu0XYo8v5E0+Q==
X-CSE-MsgGUID: F2iy940jTRq/qYnI+s8J7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11439454"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="11439454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:36:21 -0700
X-CSE-ConnectionGUID: M8v7V3OlQm+hSaL1ZdVMjg==
X-CSE-MsgGUID: jOHhIdRSQcK/CwKSmJDJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19712021"
Received: from vdesserx-mobl1.ger.corp.intel.com (HELO [10.251.214.130])
 ([10.251.214.130])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:36:17 -0700
Message-ID: <2ad89d5a-4096-4cc5-badb-4ad61ff1df7d@linux.intel.com>
Date: Fri, 5 Apr 2024 14:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Dave, Sima,

Everyone seems to be out on vacation, so the pull request is pretty empty.

Cheers,
~Maarten

drm-misc-next-2024-04-05:
drm-misc-next for v6.10:

Core Changes:
- Fix DRM_DISPLAY_DP_HELPER dependencies.

Driver Changes:
- i2c and polling fixes to ast.
- Small fixes to panthor.
- Allow IRQ to share GPIO pins in bridge/adv7511.
The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

   Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-04-05

for you to fetch changes up to d1ef8fc18be6adbbffdee06fbb5b33699e2852be:

   drm: fix DRM_DISPLAY_DP_HELPER dependencies (2024-04-04 16:20:57 +0200)

----------------------------------------------------------------
drm-misc-next for v6.10:

Core Changes:
- Fix DRM_DISPLAY_DP_HELPER dependencies.

Driver Changes:
- i2c and polling fixes to ast.
- Small fixes to panthor.
- Allow IRQ to share GPIO pins in bridge/adv7511.

----------------------------------------------------------------
Adam Ford (1):
       drm/bridge: adv7511: Allow IRQ to share GPIO pins

Adrián Larumbe (1):
       ABI: sysfs-driver-panfrost-profiling: fix indentation problem

Arnd Bergmann (1):
       drm: fix DRM_DISPLAY_DP_HELPER dependencies

Boris Brezillon (3):
       drm/panthor: Fix IO-page mmap() for 32-bit userspace on 64-bit kernel
       drm/panthor: Fix ordering in _irq_suspend()
       drm/panthor: Drop the dev_enter/exit() sections in 
_irq_suspend/resume()

Chris Morgan (3):
       dt-bindings: vendor-prefix: Add prefix for GameForce
       dt-bindings: display: Add GameForce Chi Panel
       drm/panel: st7703: Add GameForce Chi Panel Support

Christian Hewitt (1):
       drm/meson: vclk: fix calculation of 59.94 fractional rates

Dan Carpenter (3):
       drm/panthor: Fix a couple -ENOMEM error codes
       drm/panthor: Fix error code in panthor_gpu_init()
       drm/panthor: Fix off by one in panthor_fw_get_cs_iface()

Harshit Mogalapalli (2):
       drm/panthor: Fix NULL vs IS_ERR() bug in panthor_probe()
       drm/panthor: Don't return NULL from panthor_vm_get_heap_pool()

Ian Forbes (1):
       drm/vmwgfx: Remove unused code

Liviu Dudau (2):
       drm/panthor: Cleanup unused variable 'cookie'
       drm/panthor: Fix some kerneldoc warnings

Nathan Chancellor (1):
       drm/panthor: Fix clang -Wunused-but-set-variable in tick_ctx_apply()

Thomas Zimmermann (14):
       Merge drm/drm-next into drm-misc-next
       drm/ast: Include <linux/of.h> where necessary
       drm/ast: Fail probing if DDC channel could not be initialized
       drm/ast: Remove struct ast_{vga,sil165}_connector
       drm/ast: Allocate instance of struct ast_i2c_chan with managed 
helpers
       drm/ast: Move DDC code to ast_ddc.{c,h}
       drm/ast: Rename struct ast_i2c_chan to struct ast_ddc
       drm/ast: Pass AST device to ast_ddc_create()
       drm/ast: Store AST device in struct ast_ddc
       drm/ast: Rename struct i2c_algo_bit_data callbacks and their 
parameters
       drm/ast: Acquire I/O-register lock in DDC code
       drm/ast: Use drm_connector_helper_get_modes()
       drm/ast: Implement polling for VGA and SIL164 connectors
       drm/ast: Automatically clean up poll helper

  .../ABI/testing/sysfs-driver-panfrost-profiling    |   10 +
  .../bindings/display/bridge/lvds-codec.yaml        |    1 +
  .../bindings/display/panel/ilitek,ili9881c.yaml    |    1 +
  .../bindings/display/panel/novatek,nt35950.yaml    |    3 +-
  .../bindings/display/panel/novatek,nt36523.yaml    |   25 +-
  .../bindings/display/panel/panel-common-dual.yaml  |   47 +
  .../bindings/display/panel/panel-simple-dsi.yaml   |    2 +
  .../bindings/display/panel/panel-simple.yaml       |    4 +
  .../display/panel/rocktech,jh057n00900.yaml        |    2 +
  .../bindings/display/panel/sony,td4353-jdi.yaml    |    2 +
  .../bindings/gpu/arm,mali-valhall-csf.yaml         |  147 +
  .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
  Documentation/gpu/driver-uapi.rst                  |    5 +
  Documentation/gpu/panfrost.rst                     |    9 +
  MAINTAINERS                                        |  183 +-
  arch/m68k/include/asm/pgtable.h                    |    2 +
  arch/parisc/configs/generic-32bit_defconfig        |    2 +-
  drivers/gpu/drm/Kconfig                            |   23 +-
  drivers/gpu/drm/Makefile                           |   29 +
  drivers/gpu/drm/amd/amdgpu/Kconfig                 |   12 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    6 +
  drivers/gpu/drm/ast/Makefile                       |   10 +-
  drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c}       |  120 +-
  drivers/gpu/drm/ast/ast_ddc.h                      |   20 +
  drivers/gpu/drm/ast/ast_drv.c                      |    1 +
  drivers/gpu/drm/ast/ast_drv.h                      |   39 +-
  drivers/gpu/drm/ast/ast_main.c                     |    1 +
  drivers/gpu/drm/ast/ast_mode.c                     |  147 +-
  drivers/gpu/drm/bridge/Kconfig                     |   29 +-
  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    8 +-
  drivers/gpu/drm/bridge/analogix/Kconfig            |   16 +-
  drivers/gpu/drm/bridge/cadence/Kconfig             |    8 +-
  drivers/gpu/drm/bridge/imx/Kconfig                 |    4 +-
  drivers/gpu/drm/bridge/ite-it66121.c               |   25 +-
  drivers/gpu/drm/bridge/synopsys/Kconfig            |    4 +-
  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   31 +-
  drivers/gpu/drm/bridge/thc63lvd1024.c              |   21 +-
  drivers/gpu/drm/ci/test.yml                        |    6 +-
  drivers/gpu/drm/display/Kconfig                    |   71 +-
  drivers/gpu/drm/display/Makefile                   |    6 +-
  drivers/gpu/drm/display/drm_dp_helper.c            |    2 +-
  drivers/gpu/drm/display/drm_dp_helper_internal.h   |    2 +-
  .../gpu/drm/display/drm_dp_mst_topology_internal.h |    4 +-
  drivers/gpu/drm/display/drm_dp_tunnel.c            |   10 +-
  drivers/gpu/drm/drm_bridge.c                       |   24 +-
  drivers/gpu/drm/drm_client.c                       |   92 +-
  drivers/gpu/drm/drm_crtc_helper_internal.h         |   15 +-
  drivers/gpu/drm/drm_crtc_internal.h                |    7 +
  drivers/gpu/drm/drm_edid.c                         |  147 +-
  drivers/gpu/drm/drm_fbdev_generic.c                |    4 +-
  drivers/gpu/drm/drm_gem.c                          |   34 +-
  drivers/gpu/drm/drm_gem_shmem_helper.c             |    7 +-
  drivers/gpu/drm/drm_gem_vram_helper.c              |  101 +-
  drivers/gpu/drm/drm_internal.h                     |    7 +
  drivers/gpu/drm/drm_probe_helper.c                 |   56 +
  drivers/gpu/drm/exynos/Kconfig                     |    4 +-
  drivers/gpu/drm/gma500/oaktrail_lvds.c             |    2 -
  drivers/gpu/drm/i915/Kconfig                       |    8 +-
  drivers/gpu/drm/i915/Kconfig.debug                 |    4 +-
  drivers/gpu/drm/imagination/pvr_vm_mips.c          |    4 +-
  drivers/gpu/drm/imx/ipuv3/Kconfig                  |    5 +-
  drivers/gpu/drm/ingenic/Kconfig                    |    2 +-
  drivers/gpu/drm/loongson/lsdc_gem.c                |   13 +-
  drivers/gpu/drm/mediatek/Kconfig                   |    6 +-
  drivers/gpu/drm/meson/Kconfig                      |    2 +-
  drivers/gpu/drm/meson/meson_vclk.c                 |    6 +-
  drivers/gpu/drm/msm/Kconfig                        |    8 +-
  drivers/gpu/drm/msm/msm_gem.c                      |   20 +-
  drivers/gpu/drm/msm/msm_gem.h                      |    4 +-
  drivers/gpu/drm/msm/msm_gem_prime.c                |   20 +-
  drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    6 +-
  drivers/gpu/drm/nouveau/Kconfig                    |   10 +-
  drivers/gpu/drm/nouveau/nouveau_abi16.c            |   20 +-
  drivers/gpu/drm/nouveau/nouveau_abi16.h            |   12 -
  drivers/gpu/drm/nouveau/nouveau_bo.c               |   43 +-
  drivers/gpu/drm/nouveau/nouveau_bo.h               |    2 +
  drivers/gpu/drm/nouveau/nouveau_prime.c            |    8 +-
  drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c    |    2 +-
  drivers/gpu/drm/omapdrm/Kconfig                    |    2 +-
  drivers/gpu/drm/omapdrm/omap_fbdev.c               |   40 +-
  drivers/gpu/drm/panel/Kconfig                      |   41 +-
  drivers/gpu/drm/panel/Makefile                     |    1 +
  drivers/gpu/drm/panel/panel-edp.c                  |   85 +-
  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  228 +-
  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |    5 +-
  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   22 +-
  drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |  285 ++
  drivers/gpu/drm/panel/panel-simple.c               |   58 +
  drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   87 +
  drivers/gpu/drm/panfrost/Makefile                  |    2 -
  drivers/gpu/drm/panfrost/panfrost_debugfs.c        |   21 -
  drivers/gpu/drm/panfrost/panfrost_debugfs.h        |   14 -
  drivers/gpu/drm/panfrost/panfrost_device.h         |    2 +-
  drivers/gpu/drm/panfrost/panfrost_drv.c            |   50 +-
  drivers/gpu/drm/panfrost/panfrost_job.c            |    2 +-
  drivers/gpu/drm/panthor/Kconfig                    |   23 +
  drivers/gpu/drm/panthor/Makefile                   |   14 +
  drivers/gpu/drm/panthor/panthor_devfreq.c          |  283 ++
  drivers/gpu/drm/panthor/panthor_devfreq.h          |   21 +
  drivers/gpu/drm/panthor/panthor_device.c           |  561 ++++
  drivers/gpu/drm/panthor/panthor_device.h           |  357 ++
  drivers/gpu/drm/panthor/panthor_drv.c              | 1488 +++++++++
  drivers/gpu/drm/panthor/panthor_fw.c               | 1362 ++++++++
  drivers/gpu/drm/panthor/panthor_fw.h               |  503 +++
  drivers/gpu/drm/panthor/panthor_gem.c              |  230 ++
  drivers/gpu/drm/panthor/panthor_gem.h              |  142 +
  drivers/gpu/drm/panthor/panthor_gpu.c              |  482 +++
  drivers/gpu/drm/panthor/panthor_gpu.h              |   52 +
  drivers/gpu/drm/panthor/panthor_heap.c             |  597 ++++
  drivers/gpu/drm/panthor/panthor_heap.h             |   39 +
  drivers/gpu/drm/panthor/panthor_mmu.c              | 2774 ++++++++++++++++
  drivers/gpu/drm/panthor/panthor_mmu.h              |  102 +
  drivers/gpu/drm/panthor/panthor_regs.h             |  239 ++
  drivers/gpu/drm/panthor/panthor_sched.c            | 3499 
++++++++++++++++++++
  drivers/gpu/drm/panthor/panthor_sched.h            |   50 +
  drivers/gpu/drm/qxl/qxl_object.c                   |   26 +-
  drivers/gpu/drm/qxl/qxl_object.h                   |    2 +
  drivers/gpu/drm/qxl/qxl_prime.c                    |    4 +-
  drivers/gpu/drm/radeon/Kconfig                     |    8 +-
  drivers/gpu/drm/radeon/radeon_prime.c              |   11 -
  drivers/gpu/drm/renesas/rcar-du/Kconfig            |    2 +-
  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |    3 -
  drivers/gpu/drm/rockchip/Kconfig                   |   10 +-
  drivers/gpu/drm/sun4i/Kconfig                      |    2 +-
  drivers/gpu/drm/tegra/Kconfig                      |    8 +-
  drivers/gpu/drm/tidss/tidss_kms.c                  |    3 +-
  drivers/gpu/drm/ttm/ttm_bo.c                       |  231 +-
  drivers/gpu/drm/ttm/ttm_resource.c                 |   17 +-
  drivers/gpu/drm/vc4/Kconfig                        |   10 +-
  drivers/gpu/drm/vmwgfx/ttm_object.c                |    4 -
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   27 -
  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   25 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   12 -
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   16 -
  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    3 -
  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |  110 -
  drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |   19 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |    7 -
  drivers/gpu/drm/xe/Kconfig                         |   13 +-
  drivers/gpu/drm/xlnx/Kconfig                       |    8 +-
  drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    4 +
  drivers/video/fbdev/core/Kconfig                   |    6 +
  include/drm/amd_asic_type.h                        |    3 +
  include/drm/bridge/samsung-dsim.h                  |    4 +-
  include/drm/display/drm_dp_helper.h                |   15 +-
  include/drm/display/drm_dp_mst_helper.h            |    1 -
  include/drm/drm_client.h                           |   10 +
  include/drm/drm_debugfs_crc.h                      |    8 +-
  include/drm/drm_edid.h                             |   12 +-
  include/drm/drm_encoder_slave.h                    |   91 +-
  include/drm/drm_format_helper.h                    |    1 +
  include/drm/drm_gem.h                              |    3 +
  include/drm/drm_gem_shmem_helper.h                 |    7 +-
  include/drm/drm_gem_vram_helper.h                  |    1 -
  include/drm/drm_kunit_helpers.h                    |    2 +-
  include/drm/drm_lease.h                            |    2 +
  include/drm/drm_of.h                               |    1 +
  include/drm/drm_probe_helper.h                     |    6 +
  include/drm/drm_suballoc.h                         |    2 +-
  include/drm/i2c/ch7006.h                           |    1 +
  include/drm/i2c/sil164.h                           |    1 +
  include/drm/i915_gsc_proxy_mei_interface.h         |    4 +-
  include/drm/i915_hdcp_interface.h                  |   18 +-
  include/drm/i915_pxp_tee_interface.h               |   27 +-
  include/drm/ttm/ttm_bo.h                           |   17 +-
  include/drm/ttm/ttm_caching.h                      |    2 +
  include/drm/ttm/ttm_execbuf_util.h                 |    7 +-
  include/drm/ttm/ttm_kmap_iter.h                    |    4 +-
  include/drm/ttm/ttm_pool.h                         |    5 +-
  include/drm/ttm/ttm_resource.h                     |    6 +-
  include/linux/fb.h                                 |    4 +
  include/uapi/drm/nouveau_drm.h                     |   22 +
  include/uapi/drm/panthor_drm.h                     |  945 ++++++
  173 files changed, 16184 insertions(+), 1211 deletions(-)
  create mode 100644 
Documentation/ABI/testing/sysfs-driver-panfrost-profiling
  create mode 100644 
Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
  create mode 100644 
Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
  rename drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c} (54%)
  create mode 100644 drivers/gpu/drm/ast/ast_ddc.h
  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
  delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
  create mode 100644 drivers/gpu/drm/panthor/Kconfig
  create mode 100644 drivers/gpu/drm/panthor/Makefile
  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h
  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h
  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
  create mode 100644 drivers/gpu/drm/panthor/panthor_regs.h
  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
  delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
  create mode 100644 include/uapi/drm/panthor_drm.h
