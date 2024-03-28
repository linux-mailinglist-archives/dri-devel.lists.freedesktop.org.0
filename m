Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE4788FDF9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 12:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FC410F53C;
	Thu, 28 Mar 2024 11:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETJiI3Ba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FE110EF1D;
 Thu, 28 Mar 2024 11:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711624952; x=1743160952;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=2UE8b/KoiOq33sfcw4Y9EPgwtIni2I+IeQaKe9a3kfI=;
 b=ETJiI3BaA49A5rnnu2UAVnnN3EKD34x+6uUCpKS12C3/BAlz51ZoEgl0
 UPzNJ6AAa2Rsj3ADbhpT1Ka9TDzYnBIKpBW6e6AFxADICNpZryUeFxaV5
 yeLJK+g/kKFH8KHyb0+8o/5KKone8ft7rewL4O9dvEWJSBJgsGSSylQ2l
 dF1fJbpz9jx9kKdqsnw6yYIIS79u2T+yOKyVUBQuxPn1VodvQ7uYfXuDn
 ov7Kwj0Hr/h6Zn2CgPdE20nh/4Tz3def7A4KHDic0V82UN6s97DXz4h2C
 7xBn7mTKqW+BWd7/pKh8ot2Z59th/1VtfXhYUvVJPZTbIPNn2DeoHnfte A==;
X-CSE-ConnectionGUID: L555RTb8QfCIBBOvjqSCOw==
X-CSE-MsgGUID: qjapkGm3TqOZUsnqQWeiIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10566172"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="10566172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16638091"
Received: from pbalazs-mobl.ger.corp.intel.com (HELO [10.252.56.89])
 ([10.252.56.89])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 04:22:24 -0700
Message-ID: <bea310a6-6ff6-477e-9363-f9f053cfd12a@linux.intel.com>
Date: Thu, 28 Mar 2024 12:22:33 +0100
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

Happy easter!!

Cheers,
~Maarten

drm-misc-next-2024-03-28:
drm-misc-next for v6.10-rc1:

The deal of a lifetime! You get ALL of the previous
drm-misc-next-2024-03-21-1 tag!!

But WAIT, there's MORE!

Cross-subsystem Changes:
- Assorted DT binding updates.

Core Changes:
- Clarify how optional wait_hpd_asserted is.
- Shuffle Kconfig names around.

Driver Changes:
- Assorted build fixes for panthor, imagination,
- Add AUO B120XAN01.0 panels.
- Assorted small fixes to panthor, panfrost.
The following changes since commit b9511c6d277c31b13d4f3128eba46f4e0733d734:

   Merge tag 'drm-msm-next-2024-03-07' of 
https://gitlab.freedesktop.org/drm/msm into drm-next (2024-03-08 
12:45:21 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-03-28

for you to fetch changes up to 4b2d588d8a7520b414290312c9b40bca48b15e39:

   drm: DRM_WERROR should depend on DRM (2024-03-28 12:36:04 +0200)

----------------------------------------------------------------
drm-misc-next for v6.10-rc1:

The deal of a lifetime! You get ALL of the previous
drm-misc-next-2024-03-21-1 tag!!

But WAIT, there's MORE!

Cross-subsystem Changes:
- Assorted DT binding updates.

Core Changes:
- Clarify how optional wait_hpd_asserted is.
- Shuffle Kconfig names around.

Driver Changes:
- Assorted build fixes for panthor, imagination,
- Add AUO B120XAN01.0 panels.
- Assorted small fixes to panthor, panfrost.

----------------------------------------------------------------
Adrián Larumbe (2):
       drm/panfrost: Replace fdinfo's profiling debugfs knob with sysfs
       drm/panfrost: Only display fdinfo's engine and cycle tags when 
profiling is on

Andrew Halaney (1):
       drm/tidss: Use dev_err_probe() over dev_dbg() when failing to 
probe the port

Andy Shevchenko (1):
       drm/gma500: Remove unused intel-mid.h

Arnd Bergmann (1):
       drm/imagination: avoid -Woverflow warning

Boris Brezillon (18):
       drm/panthor: Add uAPI
       drm/panthor: Add GPU register definitions
       drm/panthor: Add the device logical block
       drm/panthor: Add the GPU logical block
       drm/panthor: Add GEM logical block
       drm/panthor: Add the devfreq logical block
       drm/panthor: Add the MMU/VM logical block
       drm/panthor: Add the FW logical block
       drm/panthor: Add the heap logical block
       drm/panthor: Add the scheduler logical block
       drm/panthor: Add the driver frontend block
       drm/panthor: Allow driver compilation
       drm/panthor: Add an entry to MAINTAINERS
       drm/panthor: Fix panthor_devfreq kerneldoc
       drm/panthor: Explicitly include mm.h for the {virt, 
__phys)_to_pfn() defs
       drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue
       drm/panthor: Fix the CONFIG_PM=n case
       drm/panthor: Fix wrong kernel-doc format in the uAPI header

Christian König (3):
       drm/ttm: improve idle/busy handling v5
       drm/amdgpu: use GTT only as fallback for VRAM|GTT
       drm/ttm: warn when resv objs are mixed in a bulk_move

Colin Ian King (1):
       drm/panthor: Fix spelling mistake "readyness" -> "readiness"

Dmitry Baryshkov (1):
       dt-bindings: display/lvds-codec: add ti,sn65lvds94

Douglas Anderson (2):
       drm/panel: atna33xc20: Fix unbalanced regulator in the case HPD 
doesn't assert
       drm/dp: Clarify that wait_hpd_asserted() is not optional for panels

Geert Uytterhoeven (2):
       m68k: pgtable: Add missing #include <asm/page.h>
       drm: DRM_WERROR should depend on DRM

Heiko Stuebner (2):
       drm/panel: ltk050h3146w: add MIPI_DSI_MODE_VIDEO to LTK050H3148W 
flags
       drm/panel: ltk050h3146w: drop duplicate commands from 
LTK050H3148W init

Hsin-Yi Wang (5):
       drm_edid: Add a function to get EDID base block
       drm/edid: Add a function to match EDID with identity
       drm/edid: Match edid quirks with identity
       drm/panel-edp: Match edp_panels with panel identity
       drm/panel-edp: Fix AUO 0x405c panel naming and add a variant

Jagan Teki (2):
       drm/bridge: Fix improper bridge init order with pre_enable_prev_first
       drm/bridge: Document bridge init order with pre_enable_prev_first

Jani Nikula (29):
       drm: enable (most) W=1 warnings by default across the subsystem
       drm: Add CONFIG_DRM_WERROR
       drm/crtc: make drm_crtc_internal.h self-contained
       drm: add missing header guards to drm_internal.h
       drm/kunit: fix drm_kunit_helpers.h kernel-doc
       drm/amdgpu: make amd_asic_type.h self-contained
       drm: bridge: samsung-dsim: make samsung-dsim.h self-contained
       drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc
       drm/crc: make drm_debugfs_crc.h self-contained and fix kernel-doc
       drm: fix drm_format_helper.h kernel-doc warnings
       drm/lease: make drm_lease.h self-contained
       drm: fix drm_gem_vram_helper.h kernel-doc
       drm/of: make drm_of.h self-contained
       drm/suballoc: fix drm_suballoc.h kernel-doc
       drm: add missing header guards to drm_crtc_internal.h
       drm: add missing header guards to drm_crtc_helper_internal.h
       drm/encoder: improve drm_encoder_slave.h kernel-doc
       drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
       drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
       drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
       drm/ttm: fix ttm_bo.h kernel-doc warnings
       drm/ttm: make ttm_caching.h self-contained
       drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
       drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
       drm/ttm: make ttm_pool.h self-contained
       drm/dp_mst: avoid includes in drm_dp_mst_topology_internal.h
       drm: avoid includes in drm_crtc_helper_internal.h
       Revert "drm/panthor: Fix undefined panthor_device_suspend/resume 
symbol issue"
       drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings

Jiapeng Chong (1):
       drm/shmem-helper: Remove duplicate include

Jérémie Dautheribes (3):
       dt-bindings: Add Crystal Clear Technology vendor prefix
       dt-bindings: display: simple: add support for Crystal Clear 
CMT430B19N00
       drm/panel: simple: add CMT430B19N00 LCD panel support

Karol Herbst (1):
       drm/nouveau: move more missing UAPI bits

Krzysztof Kozlowski (4):
       dt-bindings: display: panel: add common dual-link schema
       dt-bindings: display: novatek, nt35950: define ports
       dt-bindings: display: novatek, nt36523: define ports
       dt-bindings: display: sony, td4353-jdi: allow width-mm and height-mm

Laurent Pinchart (4):
       dt-bindings: ili9881c: Add Startek KD050HDFIA020-C020A support
       drm/panel: ilitek-ili9881c: Add Startek KD050HDFIA020-C020A support
       drm/panel: ilitek-ili9881c: Fix warning with GPIO controllers 
that sleep
       drm: bridge: thc63lvd1024: Print error message when DT parsing fails

Liviu Dudau (1):
       dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs

Lyude Paul (1):
       drm/nouveau/dp: Fix incorrect return code in r535_dp_aux_xfer()

Marek Vasut (1):
       drm/lcdif: Do not disable clocks on already suspended hardware

Maxime Ripard (15):
       MAINTAINERS: Update drm-misc.git URL
       MAINTAINERS: Update drm-misc web page
       drm/display: Make DisplayPort AUX bus Kconfig name consistent
       drm/display: Make DisplayPort tunnel debug Kconfig name consistent
       drm/display: Make DisplayPort AUX Chardev Kconfig name consistent
       drm/display: Make DisplayPort CEC-over-AUX Kconfig name consistent
       drm/display: Reorder Kconfig symbols
       drm/display: Make all helpers visible and switch to depends on
       drm: Make drivers depends on DRM_DW_HDMI
       drm: Switch DRM_DISPLAY_HELPER to depends on
       drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on
       drm: Switch DRM_DISPLAY_DP_HELPER to depends on
       drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on
       drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on
       drm/bridge: it6505: Remove useless select

Nathan Morrisson (2):
       dt-bindings: display: simple: Add POWERTIP PH128800T-006-ZHC01 panel
       drm/panel: simple: Add POWERTIP PH128800T006-ZHC01 panel entry

Pin-yen Lin (1):
       drm/panel-edp: Add AUO B120XAN01.0

Richard Acayan (2):
       dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
       drm/panel: add samsung s6e3fa7 panel driver

Rohit Visavalia (1):
       drm: xlnx: dp: Reset DisplayPort IP

Steven Price (1):
       drm/panthor: Don't use virt_to_pfn()

Sui Jingfeng (4):
       drm/bridge: ite66121: Register HPD interrupt handler only when 
'client->irq > 0'
       drm: bridge: dw_hdmi: Switch to of_graph_get_remote_node()
       drm/bridge: it66121: Remove a duplicated invoke of 
of_device_is_available()
       drm: bridge: thc63lvd1024: Switch to use of_graph_get_remote_node()

Thomas Zimmermann (14):
       Merge drm/drm-next into drm-misc-next
       drm/gem-shmem: Acquire reservation lock in GEM pin/unpin callbacks
       drm/gem-vram: Acquire reservation lock in GEM pin/unpin callbacks
       drm/msm: Provide msm_gem_get_pages_locked()
       drm/msm: Acquire reservation lock in GEM pin/unpin callback
       drm/nouveau: Provide nouveau_bo_{pin,unpin}_locked()
       drm/nouveau: Acquire reservation lock in GEM pin/unpin callbacks
       drm/qxl: Provide qxl_bo_{pin,unpin}_locked()
       drm/qxl: Acquire reservation lock in GEM pin/unpin callbacks
       drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()
       drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()
       drm/client: Pin vmap'ed GEM buffers
       drm/gem-vram: Do not pin buffer objects for vmap
       drm/qxl: Do not pin buffer objects for vmap

Tony Lindgren (2):
       drm/omapdrm: Fix console by implementing fb_dirty
       drm/omapdrm: Fix console with deferred ops

Vignesh Raman (1):
       drm/ci: update device type for volteer devices

Xuxin Xiong (1):
       drm/panel-edp: Add BOE NT116WHM-N44 and CMN N116BCA-EA1

Zhengqiao Xia (1):
       drm/panel-edp: Add prepare_to_enable to 200ms for MNC207QS1-1

  .../ABI/testing/sysfs-driver-panfrost-profiling    |   10 +
  .../bindings/display/bridge/lvds-codec.yaml        |    1 +
  .../bindings/display/panel/ilitek,ili9881c.yaml    |    1 +
  .../bindings/display/panel/novatek,nt35950.yaml    |    3 +-
  .../bindings/display/panel/novatek,nt36523.yaml    |   25 +-
  .../bindings/display/panel/panel-common-dual.yaml  |   47 +
  .../bindings/display/panel/panel-simple-dsi.yaml   |    2 +
  .../bindings/display/panel/panel-simple.yaml       |    4 +
  .../bindings/display/panel/sony,td4353-jdi.yaml    |    2 +
  .../bindings/gpu/arm,mali-valhall-csf.yaml         |  147 +
  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
  Documentation/gpu/driver-uapi.rst                  |    5 +
  Documentation/gpu/panfrost.rst                     |    9 +
  MAINTAINERS                                        |  183 +-
  arch/m68k/include/asm/pgtable.h                    |    2 +
  arch/parisc/configs/generic-32bit_defconfig        |    2 +-
  drivers/gpu/drm/Kconfig                            |   23 +-
  drivers/gpu/drm/Makefile                           |   29 +
  drivers/gpu/drm/amd/amdgpu/Kconfig                 |   12 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    6 +
  drivers/gpu/drm/bridge/Kconfig                     |   29 +-
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
  drivers/gpu/drm/panthor/panthor_device.h           |  394 +++
  drivers/gpu/drm/panthor/panthor_drv.c              | 1473 ++++++++
  drivers/gpu/drm/panthor/panthor_fw.c               | 1362 ++++++++
  drivers/gpu/drm/panthor/panthor_fw.h               |  503 +++
  drivers/gpu/drm/panthor/panthor_gem.c              |  230 ++
  drivers/gpu/drm/panthor/panthor_gem.h              |  142 +
  drivers/gpu/drm/panthor/panthor_gpu.c              |  482 +++
  drivers/gpu/drm/panthor/panthor_gpu.h              |   52 +
  drivers/gpu/drm/panthor/panthor_heap.c             |  597 ++++
  drivers/gpu/drm/panthor/panthor_heap.h             |   39 +
  drivers/gpu/drm/panthor/panthor_mmu.c              | 2768 ++++++++++++++++
  drivers/gpu/drm/panthor/panthor_mmu.h              |  102 +
  drivers/gpu/drm/panthor/panthor_regs.h             |  239 ++
  drivers/gpu/drm/panthor/panthor_sched.c            | 3502 
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
  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   25 +-
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
  152 files changed, 15894 insertions(+), 817 deletions(-)
  create mode 100644 
Documentation/ABI/testing/sysfs-driver-panfrost-profiling
  create mode 100644 
Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
  create mode 100644 
Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
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
  create mode 100644 include/uapi/drm/panthor_drm.h
