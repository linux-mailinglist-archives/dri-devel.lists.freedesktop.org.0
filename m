Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7B8533749
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 09:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354F710FCC7;
	Wed, 25 May 2022 07:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465CB11213C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 06:07:13 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id y13so38798430eje.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 23:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=1apyaT1u8pL+DplKuDLC4wtpL8KNy5WuzbVMd9KxVgc=;
 b=S3OKtw0ryC8aj3Z32zo0SM06pnLxQCzXLm/iragPMG6VcVtpTvMiwdvmLPS2Dpl3VN
 VbfJVLKvTXKQ3PTxD1QcRx1/7zgYB/0rsb7y9WDwoUclOZM5ajC3qwfA8Tgm5yOkEtyB
 cRcV2ZNXQSNVQ+qmut0IR29ldvLylWCTfjodSk4TzLSuMIxYjyMMpH22b/c367yuF2SE
 6Q90KeyilIkcTWULIkJFSUtUpV0qrSc7xazIKVwseYWemgsHKJqe2pA3Qjp9hYXmjkW7
 zhBcBW2CMU6fNNCU8+KqCKwoVolRB40VAJR0WDOT20ievSi4QWLdJWBes0aq1FhQPaDT
 y19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=1apyaT1u8pL+DplKuDLC4wtpL8KNy5WuzbVMd9KxVgc=;
 b=pLItrM7wnuNK30G5u3kLoy3pONpovILn7kHrUHbznAiCs00ELoflXpu0Z8qAwkwNZ6
 EKzrtz2NOHxVNNK80Ih7RHVFcGbGz1t3MF7kR2g5Mqkhs6IkjNDj5bUveqmUHE3lSVJO
 5OSwBtWdBZu5fpYCe9tqFZLu9mnjheQEXI59xTuUy0NDNk5ql78r6Cpsn0Hdj0WEtmbd
 zS8zRSvijx/JDAKefqUDIc3OGC2lzGPuMy4a0kglmdOE52NudAjPsk1ZRP63DUQ5A67H
 AKb4RoE5THwgKQ3NmKb4WMjsjPVQw+SzIG/n1pmKeowy2hCGJ+hKs75JkKvBPObduOW/
 jT2w==
X-Gm-Message-State: AOAM5300U/NTR2C09tmPkrRJ5WkNy5ltX5f0bjeSzKtQbR3Gor02zvgx
 GiESJ56Im4pOpV46vwqnwLf6/nCuWVowclxPLJE=
X-Google-Smtp-Source: ABdhPJzU0Xs7d35DcnIbkgae09rM125NKu1VXzdC5IV7gGBVtVXUN+oMe9RmKa1LBuIx4OGXOKQB+AcSgPeKt08JB9g=
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr26987339ejc.66.1653458830767; Tue, 24
 May 2022 23:07:10 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 25 May 2022 16:06:58 +1000
Message-ID: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
Subject: [git pull] drm for 5.19-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 25 May 2022 07:21:55 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

The is the main drm pull request for 5.19-rc1.

Usual summary below, Intel have enabled DG2 on certain SKUs for laptops,
AMD has started some new GPU support, msm has user allocated VA controls.

Conflicts:
I merged into your tree here a few hours ago, there were two i915 conflicts
but they were fairly easy to solve, so I think you can handle them.

There isn't much stuff outside my realm in here.

As usual, let me know if any problems,

Dave.

drm-next-2022-05-25:
drm for 5.19-rc1

dma-buf:
- add dma_resv_replace_fences
- add dma_resv_get_singleton
- make dma_excl_fence private

core:
- EDID parser refactorings
- switch drivers to drm_mode_copy/duplicate
- DRM managed mutex initialization

display-helper:
- put HDMI, SCDC, HDCP, DSC and DP into new module

gem:
- rework fence handling

ttm:
- rework bulk move handling
- add common debugfs for resource managers
- convert to kvcalloc

format helpers:
- support monochrome formats
- RGB888, RGB565 to XRGB8888 conversions

fbdev:
- cfb/sys_imageblit fixes
- pagelist corruption fix
- create offb platform device
- deferred io improvements

sysfb:
- Kconfig rework
- support for VESA mode selection

bridge:
- conversions to devm_drm_of_get_bridge
- conversions to panel_bridge
- analogix_dp - autosuspend support
- it66121 - audio support
- tc358767 - DSI to DPI support
- icn6211 - PLL/I2C fixes, DT property
- adv7611 - enable DRM_BRIDGE_OP_HPD
- anx7625 - fill ELD if no monitor
- dw_hdmi - add audio support
- lontium LT9211 support, i.MXMP LDB
- it6505: Kconfig fix, DPCD set power fix
- adv7511 - CEC support for ADV7535

panel:
- ltk035c5444t, B133UAN01, NV3052C panel support
- DataImage FG040346DSSWBG04 support
- st7735r - DT bindings fix
- ssd130x - fixes

i915:
- DG2 laptop PCI-IDs ("motherboard down")
- Initial RPL-P PCI IDs
- compute engine ABI
- DG2 Tile4 support
- DG2 CCS clear color compression support
- DG2 render/media compression formats support
- ATS-M platform info
- RPL-S PCI IDs added
- Bump ADL-P DMC version to v2.16
- Support static DRRS
- Support multiple eDP/LVDS native mode refresh rates
- DP HDR support for HSW+
- Lots of display refactoring + fixes
- GuC hwconfig support and query
- sysfs support for multi-tile
- fdinfo per-client gpu utilisation
- add geometry subslices query
- fix prime mmap with LMEM
- fix vm open count and remove vma refcounts
- contiguous allocation fixes
- steered register write support
- small PCI BAR enablement
- GuC error capture support
- sunset igpu legacy mmap support for newer devices
- GuC version 70.1.1 support

amdgpu:
- Initial SoC21 support
- SMU 13.x enablement
- SMU 13.0.4 support
- ttm_eu cleanups
- USB-C, GPUVM updates
- TMZ fixes for RV
- RAS support for VCN
- PM sysfs code cleanup
- DC FP rework
- extend CG/PG flags to 64-bit
- SI dpm lockdep fix
- runtime PM fixes

amdkfd:
- RAS/SVM fixes
- TLB flush fixes
- CRIU GWS support
- ignore bogus MEC signals more efficiently

msm:
- Fourcc modifier for tiled but not compressed layouts
- Support for userspace allocated IOVA (GPU virtual address)
- DPU: DSC (Display Stream Compression) support
- DP: eDP support
- DP: conversion to use drm_bridge and drm_bridge_connector
- Merge DPU1 and MDP5 MDSS driver
- DPU: writeback support

nouveau:
- make some structures static
- make some variables static
- switch to drm_gem_plane_helper_prepare_fb

radeon:
- misc fixes/cleanups

mxsfb:
- rework crtc mode setting
- LCDIF CRC support

etnaviv:
- fencing improvements
- fix address space collisions
- cleanup MMU reference handling

gma500:
- GEM/GTT improvements
- connector handling fixes

komeda:
- switch to plane reset helper

mediatek:
- MIPI DSI improvements

omapdrm:
- GEM improvements

qxl:
- aarch64 support

vc4:
- add a CL submission tracepoint
- HDMI YUV support
- HDMI/clock improvements
- drop is_hdmi caching

virtio:
- remove restriction of non-zero blob types

vmwgfx:
- support for cursormob and cursorbypass 4
- fence improvements

tidss:
- reset DISPC on startup

solomon:
- SPI support
- DT improvements

sun4i:
- allwinner D1 support
- drop is_hdmi caching

imx:
- use swap() instead of open-coding
- use devm_platform_ioremap_resource
- remove redunant initializations

ast:
- Displayport support

rockchip:
- Refactor IOMMU initialisation
- make some structures static
- replace drm_detect_hdmi_monitor with drm_display_info.is_hdmi
- support swapped YUV formats,
- clock improvements
- rk3568 support
- VOP2 support

mediatek:
- MT8186 support

tegra:
- debugabillity improvements
The following changes since commit 672c0c5173427e6b3e2a9bbb7be51ceeec78093a=
:

  Linux 5.18-rc5 (2022-05-01 13:57:58 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-05-25

for you to fetch changes up to c4955d9cd2fc56c43e78c908dad4e2cac7cc9073:

  Merge tag 'drm-intel-next-fixes-2022-05-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-05-25
12:03:41 +1000)

----------------------------------------------------------------
drm for 5.19-rc1

dma-buf:
- add dma_resv_replace_fences
- add dma_resv_get_singleton
- make dma_excl_fence private

core:
- EDID parser refactorings
- switch drivers to drm_mode_copy/duplicate
- DRM managed mutex initialization

display-helper:
- put HDMI, SCDC, HDCP, DSC and DP into new module

gem:
- rework fence handling

ttm:
- rework bulk move handling
- add common debugfs for resource managers
- convert to kvcalloc

format helpers:
- support monochrome formats
- RGB888, RGB565 to XRGB8888 conversions

fbdev:
- cfb/sys_imageblit fixes
- pagelist corruption fix
- create offb platform device
- deferred io improvements

sysfb:
- Kconfig rework
- support for VESA mode selection

bridge:
- conversions to devm_drm_of_get_bridge
- conversions to panel_bridge
- analogix_dp - autosuspend support
- it66121 - audio support
- tc358767 - DSI to DPI support
- icn6211 - PLL/I2C fixes, DT property
- adv7611 - enable DRM_BRIDGE_OP_HPD
- anx7625 - fill ELD if no monitor
- dw_hdmi - add audio support
- lontium LT9211 support, i.MXMP LDB
- it6505: Kconfig fix, DPCD set power fix
- adv7511 - CEC support for ADV7535

panel:
- ltk035c5444t, B133UAN01, NV3052C panel support
- DataImage FG040346DSSWBG04 support
- st7735r - DT bindings fix
- ssd130x - fixes

i915:
- DG2 laptop PCI-IDs ("motherboard down")
- Initial RPL-P PCI IDs
- compute engine ABI
- DG2 Tile4 support
- DG2 CCS clear color compression support
- DG2 render/media compression formats support
- ATS-M platform info
- RPL-S PCI IDs added
- Bump ADL-P DMC version to v2.16
- Support static DRRS
- Support multiple eDP/LVDS native mode refresh rates
- DP HDR support for HSW+
- Lots of display refactoring + fixes
- GuC hwconfig support and query
- sysfs support for multi-tile
- fdinfo per-client gpu utilisation
- add geometry subslices query
- fix prime mmap with LMEM
- fix vm open count and remove vma refcounts
- contiguous allocation fixes
- steered register write support
- small PCI BAR enablement
- GuC error capture support
- sunset igpu legacy mmap support for newer devices
- GuC version 70.1.1 support

amdgpu:
- Initial SoC21 support
- SMU 13.x enablement
- SMU 13.0.4 support
- ttm_eu cleanups
- USB-C, GPUVM updates
- TMZ fixes for RV
- RAS support for VCN
- PM sysfs code cleanup
- DC FP rework
- extend CG/PG flags to 64-bit
- SI dpm lockdep fix
- runtime PM fixes

amdkfd:
- RAS/SVM fixes
- TLB flush fixes
- CRIU GWS support
- ignore bogus MEC signals more efficiently

msm:
- Fourcc modifier for tiled but not compressed layouts
- Support for userspace allocated IOVA (GPU virtual address)
- DPU: DSC (Display Stream Compression) support
- DP: eDP support
- DP: conversion to use drm_bridge and drm_bridge_connector
- Merge DPU1 and MDP5 MDSS driver
- DPU: writeback support

nouveau:
- make some structures static
- make some variables static
- switch to drm_gem_plane_helper_prepare_fb

radeon:
- misc fixes/cleanups

mxsfb:
- rework crtc mode setting
- LCDIF CRC support

etnaviv:
- fencing improvements
- fix address space collisions
- cleanup MMU reference handling

gma500:
- GEM/GTT improvements
- connector handling fixes

komeda:
- switch to plane reset helper

mediatek:
- MIPI DSI improvements

omapdrm:
- GEM improvements

qxl:
- aarch64 support

vc4:
- add a CL submission tracepoint
- HDMI YUV support
- HDMI/clock improvements
- drop is_hdmi caching

virtio:
- remove restriction of non-zero blob types

vmwgfx:
- support for cursormob and cursorbypass 4
- fence improvements

tidss:
- reset DISPC on startup

solomon:
- SPI support
- DT improvements

sun4i:
- allwinner D1 support
- drop is_hdmi caching

imx:
- use swap() instead of open-coding
- use devm_platform_ioremap_resource
- remove redunant initializations

ast:
- Displayport support

rockchip:
- Refactor IOMMU initialisation
- make some structures static
- replace drm_detect_hdmi_monitor with drm_display_info.is_hdmi
- support swapped YUV formats,
- clock improvements
- rk3568 support
- VOP2 support

mediatek:
- MT8186 support

tegra:
- debugabillity improvements

----------------------------------------------------------------
Aashish Sharma (1):
      drm/amd/display: Fix unused-but-set-variable warning

Abhinav Kumar (25):
      drm/msm: remove unused hotplug and edid macros from msm_drv.h
      drm: allow passing possible_crtcs to drm_writeback_connector_init()
      drm: introduce drm_writeback_connector_init_with_encoder() API
      drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog
      drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl
      drm/msm/dpu: rename dpu_hw_pipe_cdp_cfg to dpu_hw_cdp_cfg
      drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks
      drm/msm/dpu: add writeback blocks to DPU RM
      drm/msm/dpu: add changes to support writeback in hw_ctl
      drm/msm/dpu: add an API to reset the encoder related hw blocks
      drm/msm/dpu: make changes to dpu_encoder to support virtual encoder
      drm/msm/dpu: add encoder operations to prepare/cleanup wb job
      drm/msm/dpu: move _dpu_plane_get_qos_lut to dpu_hw_util file
      drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback
      drm/msm/dpu: add the writeback connector layer
      drm/msm/dpu: initialize dpu encoder and connector for writeback
      drm/msm/dpu: gracefully handle null fb commits for writeback
      drm/msm/dpu: add writeback blocks to the display snapshot
      drm/msm/dpu: add wb_idx to existing DRM prints in dpu_encoder
      drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder
      drm/msm/dpu: remove unused refcount for encoder_phys_wb
      drm/msm/dpu: add missing break statement for update_pending_flush_wb(=
)
      drm/msm/dpu: limit writeback modes according to max_linewidth
      drm/msm/dpu: add DRM_MODE_ROTATE_180 back to supported rotations
      drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path

Ahmad Othman (1):
      drm/amd/display: Fix HDCP SEND AKI INIT error

Akeem G Abodunrin (3):
      drm/i915/stolen: don't treat small BAR as an error
      drm/i915/dg2: Add preemption changes for Wa_14015141709
      drm/i915/xehpsdv/dg1/tgl: Fix issue with LRI relative addressing

Alan Liu (1):
      drm/amd/display: do not disable an invalid irq source in hdp finish

Alan Previn (13):
      drm/i915/guc: Update GuC ADS size for error capture lists
      drm/i915/guc: Add XE_LP static registers for GuC error capture.
      drm/i915/guc: Add XE_LP steered register lists support
      drm/i915/guc: Add DG2 registers for GuC error state capture.
      drm/i915/guc: Add Gen9 registers for GuC error state capture.
      drm/i915/guc: Add GuC's error state capture output structures.
      drm/i915/guc: Update GuC-log relay function names
      drm/i915/guc: Add capture region into intel_guc_log
      drm/i915/guc: Check sizing of guc_capture output
      drm/i915/guc: Extract GuC error capture lists on G2H notification.
      drm/i915/guc: Pre-allocate output nodes for extraction
      drm/i915/guc: Plumb GuC-capture into gpu_coredump
      drm/i915/guc: Print the GuC error capture output register list.

Alex Deucher (36):
      drm/amdgpu: make amdgpu_display_framebuffer_init() static
      drm/amdgpu: drop amdgpu_display_gem_fb_init()
      drm/amdgpu: make amdgpu_display_gem_fb_verify_and_init() static
      drm/amdgpu: don't use BACO for reset in S3
      drm/amdgpu/smu10: fix SoC/fclk units in auto mode
      drm/amdgpu: fix VCN 3.1.2 firmware name
      drm/amd/display: fix 64 bit divide in freesync code
      drm/amdgpu: don't runtime suspend if there are displays attached (v3)
      drm/amdgpu/display: make hubp31_program_extended_blank static
      drm/amdgpu/display: Make dcn31_set_low_power_state static
      drm/amdgpu: update latest IP discovery table structures
      drm/amdgpu/discovery: populate additional GC info
      drm/amdgpu/discovery: fix byteswapping in gc info parsing
      drm/amdgpu: store the mall size in the gmc structure
      drm/amdgpu/discovery: store the number of UMC IPs on the asic
      drm/amdgpu/discovery: handle UMC harvesting in IP discovery
      drm/amdgpu/discovery: add a function to get the mall_size
      drm/amdgpu/discovery: add additional validation
      drm/amdgpu/discovery: add a function to parse the vcn info table
      drm/amdgpu/discovery: move all table parsing into amdgpu_discovery.c
      drm/amdgpu/psp: move PSP memory alloc from hw_init to sw_init
      drm/amdgpu/psp: drop load/unload/init_shared_buf wrappers
      drm/amdgpu/psp: fix memory leak in terminate functions
      drm/amdgpu/psp: move shared buffer frees into single function
      drm/amdgpu/discovery: handle AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO in SMU
      drm/amdkfd: add helper to generate cache info from gfx config
      drm/amdgpu/discovery: add MES11 support
      drm/amdgpu/gfx11: remove some register fields that no longer exist
      Revert "drm/amdgpu: disable runpm if we are the primary adapter"
      Revert "fbdev: fbmem: add a helper to determine if an aperture
is used by a fw fb"
      drm/amdgpu/discovery: set flag for GC 11.0.1
      drm/amdgpu: simplify nv and soc21 read_register functions
      drm/amdgpu: make smu_v13_0_7_check_fw_status() static
      drm/amdgpu/mes: fix format specifier for size_t
      Revert "drm/amd/pm: keep the BACO feature enabled for suspend"
      drm/amdgpu/ctx: only reset stable pstate if the user changed it (v2)

Alex Hung (7):
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in dc
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in dce
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in gpio
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in irq
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN for z10
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in amdgpu_dm
      drm/amd/display: remove unnecessary else by CONFIG_DRM_AMD_DC_DCN

Alexander Usyskin (2):
      mei: gsc: setup char driver alive in spite of firmware handshake fail=
ure
      mei: gsc: retrieve the firmware version

Alice Wong (3):
      drm/amdgpu/psp: deallocate memory when psp_load_fw failed
      drm/amdgpu/ucode: Remove firmware load type check in amdgpu_ucode_fre=
e_bo
      drm/amdgpu/psp: Return failure when firmware failed to load in SRIOV

Alvin =C5=A0ipraga (2):
      drm: bridge: adv7511: enable CEC support for ADV7535
      drm: bridge: adv7511: use non-legacy mode for CEC RX

Andi Shyti (7):
      drm/i915: Rename INTEL_REGION_LMEM with INTEL_REGION_LMEM_0
      drm/i915/gt: add gt_is_root() helper
      drm/i915/gt: create per-tile sysfs interface
      drm/i915/gt: Create per-tile RC6 sysfs interface
      drm/i915/gt: Create per-tile RPS sysfs interfaces
      drm/i915/debugfs: Do not return '0' if there is nothing to return
      drm/i915/gt: Fix use of static in macro mismatch

Andrey Grodzovsky (3):
      drm/sched: Fix htmldoc warning.
      drm/amd/psp: Add C2P registers to mp_13_0_2 header
      drm/amdgpu/psp: Add VBIOS flash handler

Andy Yan (1):
      drm/rockchip: Add VOP2 driver

AngeloGioacchino Del Regno (2):
      drm/mediatek: mtk_drm_plane: Use kmalloc in mtk_plane_duplicate_state
      drm/mediatek: mtk_drm_crtc: Use kmalloc in mtk_drm_crtc_duplicate_sta=
te

Angus Wang (4):
      drm/amd/display: Create underflow interrupt IRQ type
      drm/amd/display: Add flip interval workaround
      drm/amd/display: Remove underflow IRQ type
      drm/amd/display: Fix inconsistent timestamp type

Animesh Manna (1):
      drm/i915/dsb: modified to drm_info in dsb_prepare()

Ankit Nautiyal (2):
      drm/i915/display: Remove check for low voltage sku for max dp source =
rate
      drm/i915/intel_combo_phy: Print I/O voltage info

Anthony Koo (4):
      drm/amd/display: [FW Promotion] Release 0.0.109.0
      drm/amd/display: [FW Promotion] Release 0.0.110.0
      drm/amd/display: [FW Promotion] Release 0.0.111.0
      drm/amd/display: [FW Promotion] Release 0.0.115.0

Aric Cyr (9):
      drm/amd/display: 3.2.178
      drm/amd/display: 3.2.179
      drm/amd/display: 3.2.180
      drm/amd/display: 3.2.181
      drm/amd/display: 3.2.182
      drm/amd/display: 3.2.183
      drm/amd/display: Clean up pixel format types
      drm/amd/display: 3.2.184
      drm/amd/display: 3.2.185

Arnd Bergmann (1):
      drm/tegra: vic: Fix unused-function warnings

Arunpravin (1):
      drm/selftests: fix a shift-out-of-bounds bug

Arunpravin Paneer Selvam (2):
      drm/amdgpu: add drm buddy support to amdgpu
      drm: add a check to verify the size alignment

Ashutosh Dixit (3):
      drm/i915/pmu: Drop redundant IS_VALLEYVIEW check in __get_rc6()
      drm/i915/rps: Centralize computation of freq caps
      drm/i915: Don't show engine information in fdinfo with GuC submission

Becle Lee (1):
      drm/amd/display: fix missing-prototypes warning

Benjamin Gaignard (1):
      dt-bindings: display: rockchip: dw-hdmi: Add compatible for rk3568 HD=
MI

Benjamin Marty (1):
      drm/amdgpu/display: change pipe policy for DCN 2.1

Biju Das (1):
      drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on HPD interrupt

Bjorn Andersson (2):
      dt-bindings: display: msm: Add optional resets
      drm/msm/dpu: Issue MDSS reset during initialization

Bokun Zhang (3):
      drm/amd/amdgpu: Update MIT license in SRIOV msg header
      drm/amd/amdgpu: Properly indent PF2VF header
      drm/amd/amdgpu: Update PF2VF header

Borislav Petkov (1):
      drm/i915/uc: Fix undefined behavior due to shift overflowing the cons=
tant

Boyuan Zhang (1):
      drm/amdgpu/vcn3: send smu interface type

Brian Norris (2):
      drm/bridge: analogix_dp: Grab runtime PM reference for DP-AUX
      drm/bridge: analogix_dp: Enable autosuspend

CHANDAN VURDIGERE NATARAJ (1):
      drm/amd/display: Fix by adding FPU protection for
dcn30_internal_validate_bw

CQ Tang (2):
      drm/i915/display: Check mappable aperture when pinning preallocated v=
ma
      drm/i915: add lmem_size modparam

Cai Huoqing (1):
      drm/imx: imx-tve: Make use of the helper function
devm_platform_ioremap_resource()

Candice Li (3):
      drm/amdgpu: Use indirect buffer and save response status for TA
load/invoke
      drm/amdgpu: Add debugfs TA load/unload/invoke support
      drm/amdgpu: Fix build warning for TA debugfs interface

Casey Bowman (3):
      drm/i915: Split i915_run_as_guest into x86 and non-x86
      drm/i915/gt: Split intel-gtt functions by arch
      drm/i915: Require INTEL_GTT to depend on X86

Caz Yokoyama (1):
      drm/i915/display/adlp: Adjust MBUS DBOX BW and B credits

Changcheng Deng (2):
      drm/i915/dsi: use min_t() to make code cleaner
      fbcon: use min() to make code cleaner

Charlene Liu (2):
      drm/amd/display: Clear optc false state when disable otg
      drm/amd/display: remove dtbclk_ss compensation for dcn316

Chen-Yu Tsai (8):
      drm: ssd130x: Fix COM scan direction register mask
      drm: ssd130x: Always apply segment remap setting
      drm/mediatek: Fix DPI component detection for MT8192
      dt-bindings: vendor-prefixes: Add prefix for SINO WEALTH Eletronics L=
td.
      dt-bindings: display: ssd1307fb: Add entry for SINO WEALTH SH1106
      drm/ssd130x: Support page addressing mode
      drm/ssd130x: Add support for SINO WEALTH SH1106
      drm/rockchip: Support YUV formats with U/V swapped

Chengming Gui (8):
      drm/amd/amdgpu: adjust the fw load type list
      drm/amd/amdgpu: add more fw load type to fit new ASICs
      drm/amdgpu/discovery: add SMUIO_13_0_8 func support
      drm/amdgpu/psp13: add support for MP0 13.0.7
      drm/amdgpu/discovery: add psp13 support for PSP 13.0.7
      drm/amd/pm: add SMU_13_0_7 PMFW headers
      drm/amdgpu/swsmu: add smu 13.0.7 firmware
      drm/amd/pm: add SMU_13_0_7 ppt_funcs for SMU_13_0_7

Chia-I Wu (5):
      drm/msm: remove explicit devfreq status reset
      drm/msm: simplify gpu_busy callback
      drm/msm: return the average load over the polling period
      drm/sched: use DECLARE_EVENT_CLASS
      drm/sched: use __string in tracepoints

Chris Park (1):
      drm/amd/display: Correct Slice reset calculation

Chris Wilson (2):
      drm/i915/selftests: Skip poisoning SET_PREDICATE_RESULT on dg2
      drm/i915/gt: Clear SET_PREDICATE_RESULT prior to executing the ring

Christian K=C3=B6nig (56):
      drm/etnaviv: stop using dma_resv_excl_fence v2
      RDMA: use dma_resv_wait() instead of extracting the fence
      dma-buf: add dma_resv_replace_fences v2
      dma-buf: finally make the dma_resv_list private v2
      drm/amdgpu: move VM PDEs to idle after update
      drm/amdgpu: separate VM PT handling into amdgpu_vm_pt.c
      drm/amdgpu: simplify VM update tracking a bit
      drm/amdgpu: rework TLB flushing
      drm/amdkfd: start using tlb_seq from the VM subsystem
      drm/amdkfd: use tlb_seq from the VM subsystem for SVM as well v2
      drm/amdgpu: remove table_freed param from the VM code
      drm/ttm: move the LRU into resource handling v4
      drm/ttm: add resource iterator v4
      drm/ttm: allow bulk moves for all domains
      drm/ttm: de-inline ttm_bo_pin/unpin
      drm/ttm: rework bulk move handling v5
      drm/amdgpu: drop amdgpu_gtt_node
      drm/amdgpu: fix some kerneldoc in the VM code v2
      drm/amdgpu: fix incorrect size printing in error msg
      dma-buf: drop the DAG approach for the dma_resv object v3
      dma-buf: add dma_resv_get_singleton v2
      drm/vmwgfx: stop using dma_resv_excl_fence v2
      drm/radeon: stop using dma_resv_excl_fence
      drm/amdgpu: use dma_resv_for_each_fence for CS workaround v2
      drm/atomic-helper: support more than one write fence in
drm_gem_plane_helper_prepare_fb
      drm/amdgpu: use dma_resv_get_singleton in amdgpu_pasid_free_cb
      drm/nouveau: stop using dma_resv_excl_fence
      dma-buf: finally make dma_resv_excl_fence private v2
      drm/nouveau: support more than one write fence in fenv50_wndw_prepare=
_fb
      drm/amdgpu: fix TLB flushing during eviction
      dma-buf/drivers: make reserving a shared slot mandatory v4
      dma-buf: add enum dma_resv_usage v4
      dma-buf: specify usage while adding fences to dma_resv obj v7
      dma-buf & drm/amdgpu: remove dma_resv workaround
      dma-buf: add DMA_RESV_USAGE_KERNEL v3
      drm/amdgpu: use DMA_RESV_USAGE_KERNEL
      drm/radeon: use DMA_RESV_USAGE_KERNEL
      RDMA: use DMA_RESV_USAGE_KERNEL
      dma-buf: add DMA_RESV_USAGE_BOOKKEEP v3
      dma-buf: wait for map to complete for static attachments
      drm/i915: drop bo->moving dependency
      drm/ttm: remove bo->moving
      dma-buf: drop seq count based update
      seqlock: drop seqcount_ww_mutex_t
      futex: add missing rtmutex.h include
      drm/ttm: fix logic inversion in ttm_eu_reserve_buffers
      drm/ttm: fix kerneldoc for ttm_lru_bulk_move
      drm/amdgpu: remove pointless ttm_eu usage from vkms
      drm/amdgpu: remove pointless ttm_eu usage from DM
      drm: handle kernel fences in drm_gem_plane_helper_prepare_fb v2
      drm/nouveau: use drm_gem_plane_helper_prepare_fb
      drm/amdgpu: fix drm-next merge fallout
      dma-buf/sync_file: cleanup fence merging a bit
      drm/nouveau: remove trace_dma_fence_emit
      drm/qxl: add drm_gem_plane_helper_prepare_fb
      drm/amdgpu: nuke dynamic gfx scratch reg allocation

Christoph Hellwig (27):
      drm/i915/gvt: remove module refcounting in
intel_gvt_{,un}register_hypervisor
      drm/i915/gvt: remove enum hypervisor_type
      drm/i915/gvt: rename intel_vgpu_ops to intel_vgpu_mdev_ops
      drm/i915/gvt: move the gvt code into kvmgt.ko
      drm/i915/gvt: remove intel_gvt_ops
      drm/i915/gvt: remove the map_gfn_to_mfn and set_trap_area ops
      drm/i915/gvt: remove the unused from_virt_to_mfn op
      drm/i915/gvt: merge struct kvmgt_vdev into struct intel_vgpu
      drm/i915/gvt: merge struct kvmgt_guest_info into strut intel_vgpu
      drm/i915/gvt: remove vgpu->handle
      drm/i915/gvt: devirtualize ->{read,write}_gpa
      drm/i915/gvt: devirtualize ->{get,put}_vfio_device
      drm/i915/gvt: devirtualize ->set_edid and ->set_opregion
      drm/i915/gvt: devirtualize ->detach_vgpu
      drm/i915/gvt: devirtualize ->inject_msi
      drm/i915/gvt: devirtualize ->is_valid_gfn
      drm/i915/gvt: devirtualize ->gfn_to_mfn
      drm/i915/gvt: devirtualize ->{enable,disable}_page_track
      drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
      drm/i915/gvt: devirtualize dma_pin_guest_page
      drm/i915/gvt: remove struct intel_gvt_mpt
      drm/i915/gvt: remove the extra vfio_device refcounting for dmabufs
      drm/i915/gvt: streamline intel_vgpu_create
      drm/i915/gvt: pass a struct intel_vgpu to the vfio read/write helpers
      drm/i915/gvt: remove kvmgt_guest_{init,exit}
      drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev
      drm/i915/gvt: merge gvt.c into kvmgvt.c

Christophe Branchereau (4):
      dt-bindings: display/panel: Add Leadtek ltk035c5444t
      drm/ingenic: Add ingenic_drm_bridge_atomic_enable and disable
      drm/panel: Add panel driver for NewVision NV3052C based LCDs
      drm/panel: innolux-ej030na and abt-y030xx067a: add .enable and .disab=
le

Christophe JAILLET (2):
      drm/amdkfd: Use bitmap_zalloc() when applicable
      drm/amdkfd: Use non-atomic bitmap functions when possible

Chuansheng Liu (1):
      fbdev: defio: fix the pagelist corruption

Chunguang Xu (1):
      drm/tilcdc: fix typos in comment

Colin Ian King (6):
      drm/i915: make a handful of read-only arrays static const
      drm/nouveau: Fix spelling mistake "endianess" -> "endianness"
      drm/amdgpu: Fix spelling mistake "regiser" -> "register"
      drm/imx: make static read-only array channel_offsets const
      drm: sti: fix spelling mistake: rejec -> rejection
      drm/v3d: Fix null pointer dereference of pointer perfmon

Cong Liu (1):
      drm/qxl: fix qxl can't use in arm64

Dan Carpenter (7):
      drm/selftests: missing error code in igt_buddy_alloc_smoke()
      drm/amdkfd: potential NULL dereference in kfd_set/reset_event()
      drm/amdgpu: debugfs: fix error codes in write functions
      drm/amdgpu: debugfs: fix NULL dereference in ta_if_invoke_debugfs_wri=
te()
      drm/sun4i: dsi: delete unnecessary IS_ERR() checks
      drm/msm: return an error pointer in msm_gem_prime_get_sg_table()
      drm/amdgpu/gfx11: unlock on error in gfx_v11_0_kiq_resume()

Daniel Vetter (21):
      drm/etnaviv: Use scheduler dependency handling
      drm/gem: Delete gem array fencing helpers
      drm/sched: Check locking in drm_sched_job_add_implicit_dependencies
      fbcon: delete a few unneeded forward decl
      fbcon: Move fbcon_bmove(_rec) functions
      fbcon: Introduce wrapper for console->fb_info lookup
      fbcon: delete delayed loading code
      fbdev/sysfs: Fix locking
      fbcon: Use delayed work for cursor
      fbcon: Replace FBCON_FLAGS_INIT with a boolean
      fb: Delete fb_info->queue
      fbcon: Extract fbcon_open/release helpers
      fbcon: Ditch error handling for con2fb_release_oldinfo
      fbcon: move more common code into fb_open()
      fbcon: use lock_fb_info in fbcon_open/release
      fbcon: Consistently protect deferred_takeover with console_lock()
      fbcon: Move console_lock for register/unlink/unregister
      fbcon: Move more code into fbcon_release
      fbcon: untangle fbcon_exit
      fbcon: Maintain a private array of fb_info
      fbcon: Fix delayed takeover locking

Daniele Ceraolo Spurio (3):
      drm/i915/guc: add steering info to GuC register save/restore list
      drm/i915/guc: Correctly free guc capture struct on error
      drm/i915: Xe_HP SDV and DG2 have up to 4 CCS engines

Danijel Slivka (1):
      amdgpu/pm: Disallow managing power profiles on SRIOV for Sienna Cichl=
id

Darren Powell (3):
      amdgpu/pm: Add new hwmgr API function "emit_clock_levels"
      amdgpu/pm: Implement emit_clk_levels for vega10
      amdgpu/pm: Clarify documentation of error handling in send_smc_mesg

Dave Airlie (21):
      Merge tag 'drm-misc-next-2022-04-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2022-04-13-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-04-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-5.19-2022-04-15' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'amd-drm-next-5.19-2022-04-22' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2022-04-27' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-04-28' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Backmerge tag 'v5.18-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into
drm-next
      Merge tag 'amd-drm-next-5.19-2022-04-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'imx-drm-next-2022-05-04' of
git://git.pengutronix.de/pza/linux into drm-next
      Merge tag 'drm-intel-gt-next-2022-05-05' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-05-05' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'mediatek-drm-next-5.19' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-intel-next-2022-05-06' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-msm-next-2022-05-09' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm/tegra/for-5.19-rc1' of
https://gitlab.freedesktop.org/drm/tegra into drm-next
      Merge branch 'etnaviv/next' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'amd-drm-next-5.19-2022-05-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2022-05-19' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'msm-next-5.19-fixes' of
https://gitlab.freedesktop.org/abhinavk/msm into drm-next
      Merge tag 'drm-intel-next-fixes-2022-05-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next

David Yat Sin (2):
      drm/amdkfd: Fix GWS queue count
      drm/amdkfd: CRIU add support for GWS queues

David Yu (1):
      drm/amdgpu: Ta fw needs to be loaded for SRIOV aldebaran

David Zhang (4):
      drm: add PSR2 support and capability definition as per eDP 1.5
      drm/amd/display: implement shared PSR-SU sink validation helper
      drm/amd/display: read PSR-SU cap DPCD for specific panel
      drm/amd: add dc feature mask flags for PSR allow smu and
multi-display optimizations

Devarsh Thakkar (1):
      drm/tidss: Soft Reset DISPC on startup

Dillon Varone (3):
      drm/amd/display: Add dtb clock to dc_clocks
      drm/amd/display: Select correct DTO source
      drm/amd/display: Remove unused integer

Dmitry Baryshkov (40):
      drm/blend: fix typo in the comment
      drm/msm: unify MDSS drivers
      drm/msm: remove extra indirection for msm_mdss
      drm/msm: split the main platform driver
      drm/msm: stop using device's match data pointer
      drm/msm: allow compile time selection of driver components
      drm/msm: make mdp5/dpu devices master components
      drm/msm: properly add and remove internal bridges
      drm/msm/dpu: remove manual destruction of DRM objects
      drm/msm: loop over encoders using drm_for_each_encoder()
      drm/msm: don't store created planes, connectors and encoders
      drm/msm: remove unused plane_property field from msm_drm_private
      drm/msm/dpu: don't use merge_3d if DSC merge topology is used
      drm/bridge: tc358762: drop connector field
      drm/msm/dpu: remove extra wrappers around dpu_core_irq
      drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
      drm/msm/dpu: allow just single IRQ callback
      drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
      drm/msm/dpu: remove struct dpu_encoder_irq
      drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()
      drm/msm/dpu: document INTF_EDP/INTF_DP difference
      drm/msm/dpu: drop INTF_TYPE_MAX symbol
      drm/msm/dpu: drop obsolete INTF_EDP comment
      drm/msm/dpu: drop INTF_EDP from interface type conditions
      drm/msm/dp: replace dp_connector with drm_bridge_connector
      drm/msm/dp: remove extra wrappers and public functions
      drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
      drm/msm/dp: simplify dp_connector_get_modes()
      drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
      drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
      drm/msm/dsi: fix error checks and return values for DSI xmit function=
s
      drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
      drm/msm: add missing include to msm_drv.c
      drm/msm: drop old eDP block support (again)
      drm/msm/dpu: don't access mode pointer before it is set
      drm/msm/dsi: fix address for second DSI PHY on SDM660
      drm/msm/dsi: pll_7nm: remove unsupported dividers for DSI pixel clock
      drm/msm/dpu: remove NULL-ness check in dpu_hw_intr_destroy
      MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer
      drm/msm: don't free the IRQ if it was not requested

Dmytro Laktyushkin (2):
      drm/amd/display: update dcn315 clock table read
      drm/amd/display: update dcn315 clk table read

Douglas Anderson (5):
      drm/bridge: Add MAINTAINERS entry for DRM drivers for bridge chip bin=
dings
      drm/bridge: Add myself as a reviewer for the TI SN65DSI86 bridge chip
      drm/bridge: Add myself as a reviewer for the Parade PS8640 bridge chi=
p
      drm/msm: Fix shutdown
      drm/msm/dsi: don't powerup at modeset time for parade-ps8640

Duncan Ma (1):
      drm/amd/display: Add odm seamless boot support

Elena Sakhnovitch (2):
      drm/amdgpu: Remove trailing space
      drm/amd/pm: Disable fan control if not supported

Eric Bernstein (2):
      drm/amd/display: remove assert for odm transition case
      drm/amd/display: Add new DSC interface to disconnect from pipe

Eric Huang (2):
      drm/amdkfd: add asic support for SDMA 6.0.2
      drm/amdkfd: add asic support for GC 11.0.2

Eric Yang (1):
      drm/amd/display: undo clearing of z10 related function pointers

Evan Quan (41):
      drm/amdgpu: expand cg_flags from u32 to u64
      drm/amd/pm: fix the deadlock issue observed on SI
      drm/amd/pm: fix the compile warning
      drm/amd/pm: enable pp_dpm_vclk/dclk sysfs interface support for SMU 1=
3.0.0
      drm/amd/pm: move bootup values retrieving to ->sw_init
      drm/amd/pm: correct the way for retrieving bootup clocks
      drm/amd/pm: update the hw initialization sequence around pptable setu=
p
      drm/amdgpu: enable pptable ucode loading
      drm/amd/pm: enable SCPM support for SMU
      drm/amd/pm: correct SMU OverridePcieParameters related settings
      drm/amd/pm: enable the support for retrieving combo pptable
      drm/amd/smu: Update SMU13 support for SMU 13.0.0
      drm/amdgpu/soc21: enable ATHUB and MMHUB PG
      drm/amdgpu: add FGCG support
      drm/amdgpu: enable GFX CGCG/CGLS for GC11.0.0
      drm/amdgpu: enable fgcg for soc21
      drm/amd/pm: enable power limit retrieving and setting for SMU 13.0.0
      drm/amd/pm: enable ac/dc switching for SMU 13.0.0
      drm/amd/pm: enable power profile setting for SMU 13.0.0
      drm/amd/pm: enable RunDcBtc support for SMU 13.0.0
      drm/amd/pm: enable ppfeature mask setting for SMU 13.0.0
      drm/amd/pm: enable PMLOG support for SMU 13.0.0
      drm/amd/pm: enable df cstate feature for SMU 13.0.0
      drm/amdgpu: enable more GFX clockgating features for GC 11.0.0
      drm/amd/pm: support more DPM features for SMU 13.0.0
      drm/amd/pm: enable deep sleep features control for SMU 13.0.0
      drm/amd/pm: enable gfx ulv feature control for SMU 13.0.0
      drm/amd/pm: enable more dpm features to pair with PMFW 78.31.0
      drm/amdgpu: enable MGCG and LS for ATHUB 3.0
      drm/amdgpu: enable MGCG and LS for MMHUB 3.0
      drm/amdgpu: enable clock gating for IH 6.0
      drm/amdgpu: enable clock gating for HDP 6.0
      drm/amd/pm: enable lclk dpm/ds and BACO features for SMU 13.0.0
      drm/amd/pm: enable BACO support for SMU 13.0.0
      drm/amd/pm: enable UCLK DPM for SMU 13.0.0
      drm/amd/pm: correct the check for current link status
      drm/amd/pm: correct the way for retrieving current uclk frequency
      drm/amd/pm: correct the way for retrieving current fclk frequency
      drm/amd/pm: enable FCLK DPM support for SMU 13.0.0
      drm/amd/pm: disable the gfxoff feature temporarily for SMU 13.0.0
      drm/amd/pm: suppress compile warning about possible unaligned accesse=
s

Evgenii Krasnikov (4):
      drm/amd/display: ensure PSR force_static flag can always be set
      drm/amd/display: Reset cached PSR parameters after hibernate
      Revert "drm/amd/display: Reset cached PSR parameters after hibernate"
      drm/amd/display: Reset cached PSR parameters after hibernate

Fabio Estevam (1):
      dt-bindings: display: simple: Add Startek KD070WVFPA043-C069A panel

Fei Yang (1):
      drm/i915: avoid concurrent writes to aux_inv

Felix Kuehling (5):
      drm/amdkfd: Improve concurrency of event handling
      drm/amdkfd: Fix NULL pointer dereference
      drm/amdkfd: Asynchronously free events
      drm/amdkfd: fix race condition in kfd_wait_on_events
      drm/amdkfd: Ignore bogus signals from MEC efficiently

Flora Cui (18):
      drm/amdgpu: add soc21 support for GC 11.0.2
      drm/amdgpu/discovery: add soc21 support for GC 11.0.2
      drm/amdgpu: add support for ATHUB 3.0.2
      drm/amdgpu/discovery: add ih6 support for IH 6.0.2
      drm/amdgpu/discovery: add smu13 support for MP1 13.0.7
      drm/amdgpu/discovery: add nbio 4.3 support for NBIO 4.3.1
      drm/amdgpu/discovery: add hdp6 support for HDP 6.0.1
      drm/amdgpu: add UMC 8.11.0 support
      drm/amdgpu: add GMC11 support for GC 11.0.2
      drm/amdgpu/discovery: add gmc11 support for GC 11.0.2
      drm/amdgpu: add sdma 6.0.2 firware support
      drm/amdgpu/discovery: add sdma6 support for SDMA 6.0.2
      drm/amdgpu: add mes 11 firmware for mes 11.0.2
      drm/amdgpu/discovery: add mes11 support for GC 11.0.2
      drm/amdgpu: add gc v11_0_2 imu firmware
      drm/amdgpu: add initial GC 11.0.2 support
      drm/amdgpu/discovery: add gfx11 support for GC 11.0.2
      drm/amdgpu/discovery: set family for GC 11.0.2

Gary Li (1):
      drm/amd/display: Maintain current link settings in link loss interrup=
t

Gavin Wan (1):
      drm/amd/amdgpu: Remove static from variable in RLCG Reg RW

Geert Uytterhoeven (5):
      drm: Drop commas after SoC match table sentinels
      drm/format-helper: Rename drm_fb_xrgb8888_to_mono_reversed()
      drm/format-helper: Fix XRGB888 to monochrome conversion
      drm/ssd130x: Fix rectangle updates
      drm/ssd130x: Reduce temporary buffer sizes

Graham Sider (4):
      drm/amdgpu: Disable SDMA WPTR_POLL_ENABLE for sdma_v6_0
      drm/amdkfd: Update event_interrupt_isr_v11 return
      drm/amdgpu: Implement get_vmid_pasid_mapping for gfx11
      drm/amdkfd: Fix static checker warning on MES queue type

Grigory Vasilyev (2):
      drm/amdgpu: Remove leftover igp_lane_info
      drm/amdgpu: Fix incorrect enum type

Guchun Chen (2):
      drm/amdgpu: drop redundant check of harvest info
      drm/amdgpu: disable runtime pm on several sienna cichlid cards(v2)

Guo Zhengkui (6):
      drm/nouveau/instmem: fix uninitialized_var.cocci warning
      drm/radeon: simplify if-if to if-else
      drm/amd/display: fix if =3D=3D else warning
      drm/nouveau/devinit/nva3-: fix returnvar.cocci warning
      drm/msm: fix returnvar.cocci warning
      drm/nouveau/devinit: fix returnvar.cocci warnings

Gwan-gyeong Mun (2):
      drm/i915/dmabuf: Update dma_buf_ops.unmap_dma_buf callback to
use drm_gem_unmap_dma_buf()
      drm/i915/dmabuf: Fix prime_mmap to work when using LMEM

H. Nikolaus Schaller (1):
      drm/bridge: display-connector: add ddc-en gpio support

Hangyu Hua (1):
      drm: msm: fix possible memory leak in mdp5_crtc_cursor_set()

Hans de Goede (2):
      drm/i915: Fix DISP_POS_Y and DISP_HEIGHT defines
      drm/amdgpu: Move mutex_init(&smu->message_lock) to smu_early_init()

Haohui Mai (4):
      drm/amdgpu/sdma: Fix incorrect calculations of the wptr of the doorbe=
lls
      drm/amdgpu/sdma: Remove redundant lower_32_bits() calls when
settings SDMA doorbell
      drm/amdgpu: Fix out-of-bound access for gfx_v10_0_ring_test_ib()
      drm/amdgpu: Ensure the DMA engine is deactivated during set ups

Haowen Bai (6):
      drm/amd/display: Fix pointer dereferenced before checking
      drm/amd/display: Fix pointer dereferenced before checking
      drm/amdgpu/vcn: Remove unneeded semicolon
      drm/amd/display: Remove useless code
      drm/amdgpu: Remove useless kfree
      drm/msm/mdp5: Eliminate useless code

Harry VanZyllDeJong (1):
      drm/amd/display: Fix crash on setting VRR with no display connected

Harry Wentland (1):
      drm/amd/display: Avoid reading audio pattern past AUDIO_CHANNELS_COUN=
T

Hawking Zhang (32):
      drm/amdgpu: add helper to execute atomfirmware asic_init
      drm/amdgpu: switch to atomfirmware_asic_init
      drm/amdgpu: add vram_info v3_0 structure
      drm/amdgpu: support query vram_info v3_0
      drm/amdgpu: add atom_gfx_info_v3_0 structure
      drm/amdgpu: update gc info from bios table
      drm/amdgpu: update query ref clk from bios
      drm/amdgpu: add mp v13_0_0 ip headers v7
      drm/amdgpu: add gc v11_0_0 ip headers v11
      drm/amdgpu: add nbio callback to query rom offset
      drm/amdgpu: add nbio v4_3_0 ip headers v6
      drm/amdgpu: add osssys v6_0_0 ip headers v4
      drm/amdgpu: add hdp v6_0_0 ip headers v4
      drm/amdgpu: add smuio v13_0_6 ip headers v4
      drm/amdgpu: add smuio v13_0_6 support
      drm/amdgpu: init smuio v13_0_6 callbacks
      drm/amdgpu: support print psp v2_0 hdr debug information
      drm/amdgpu: add athub v3_0_0 ip headers v6
      drm/amdgpu: add mmhub v3_0_0 ip headers v6
      drm/amdgpu: add updated smu_info structures
      drm/amdgpu: query core refclk from bios for smu v13
      drm/amdgpu: add GC v11_0_0 family id
      drm/amdgpu: add soc21 chip enum header v8
      drm/amdgpu: add gfx11 clearstate header
      drm/amdgpu: add gfx11 mqd structures
      drm/amdgpu: add init support for GFX11 (v2)
      drm/amdgpu: enable GENERIC0_INT for gfx/compute pipes
      drm/amdgpu: add sdma v6_0_0 pkt header v3
      drm/amdgpu: add mmhub v3_0_2 ip headers
      drm/amdgpu: add mmhub v3_0_2 ip callback functions
      drm/amdgpu: split mmhub v3_0_2 callbacks from mmhub v3_0
      drm/amdgpu: add lsdma v6_0_0 ip headers

Heiko Schocher (1):
      drm/panel: simple: Add Startek KD070WVFPA043-C069A panel support

Helge Deller (1):
      Revert "video: fbdev: fbmem: fix pointer reference to null device fie=
ld"

Hsin-Yi Wang (1):
      drm/bridge: anx7625: Fill in empty ELD when no connector

Huang Rui (20):
      drm/amdgpu/pm: fix the null pointer while the smu is disabled
      drm/amdgpu: add nbio v7_7_0 ip headers
      drm/amdgpu: add hdp v5_2_1 ip headers
      drm/amdgpu: add mmhub support for MMHUB 3.0.1
      drm/amdgpu: add soc21 common ip block support for GC 11.0.1
      drm/amdgpu/discovery: enable soc21 common for GC 11.0.1
      drm/amdgpu: add gmc v11 support for GC 11.0.1
      drm/amdgpu/discovery: enable gmc v11 for GC 11.0.1
      drm/amdgpu/discovery: enable ih v6 for OSS 6.0.1
      drm/amdgpu: add sdma support for sdma 6.0.1
      drm/amdgpu/discovery: enable sdma v6 for SDMA 6.0.1
      drm/amdgpu: add GC 11.0.1 family id
      drm/amdgpu: set GC 11.0.1 family
      drm/amdgpu: add gfx support for GC 11.0.1
      drm/amdgpu: add GC v11.0.1 into mes v11
      drm/amdkfd: add GC 11.0.1 KFD support
      drm/amdgpu: enable imu firmware for GC 11.0.1
      drm/amdgpu/discovery: enable gfx v11 for GC 11.0.1
      drm/amdgpu/discovery: enable mes support for GC v11.0.1
      drm/amdgpu/pm: add smu v13.0.4 driver SMU if headers

Ilya Bakoulin (2):
      drm/amd/display: Add Audio readback registers
      drm/amd/display: Keep track of DSC packed PPS

Imre Deak (33):
      drm/i915: Fix the VDSC_PW2 power domain enum value
      drm/i915: Sanitize open-coded power well enable()/disable() calls
      drm/i915: Remove redundant state verification during TypeC AUX
power well disabling
      drm/i915: Move i915_power_well_regs struct into i915_power_well_ops
      drm/i915: Move power well get/put/enable/disable functions to a new f=
ile
      drm/i915: Add function to call a power well's sync_hw() hook
      drm/i915: Add functions to get a power well's
state/name/domains/mask/refcount
      drm/i915: Move intel_display_power_well_is_enabled() to
intel_display_power_well.c
      drm/i915: Add a DP1.2 compatible way to read LTTPR capabilities
      drm/i915/adlp: Fix register corruption after DDI clock enabling
      drm/dp: Factor out a function to probe a DPCD address
      drm/i915: Move per-platform power well hooks to intel_display_power_w=
ell.c
      drm/i915: Unexport the for_each_power_well() macros
      drm/i915: Move the power domain->well mappings to
intel_display_power_map.c
      drm/i915: Move the dg2 fixed_enable_delay power well param to a
common bitfield
      drm/i915: Move the HSW power well flags to a common bitfield
      drm/i915: Rename the power domain names to end with pipes/ports
      drm/i915: Sanitize the power well names
      drm/i915: Convert the power well descriptor domain mask to an
array of domains
      drm/i915: Convert the u64 power well domains mask to a bitmap
      drm/i915: Simplify power well definitions by adding power well instan=
ces
      drm/i915: Allow platforms to share power well descriptors
      drm/i915: Simplify the DG1 power well descriptors
      drm/i915: Sanitize the ADL-S power well definition
      drm/i915: Sanitize the port -> DDI/AUX power domain mapping for
each platform
      drm/i915: Remove the aliasing of power domain enum values
      drm/i915: Remove the ICL specific TBT power domains
      drm/i915: Remove duplicate DDI/AUX power domain mappings
      drm/i915: Remove the XELPD specific AUX and DDI power domains
      drm/i915: Fixup merge of the power well refactor patchset
      drm/i915: Fix SEL_FETCH_PLANE_*(PIPE_B+) register addresses
      drm/i915/dp: Add workaround for spurious AUX timeouts/hotplugs
on LTTPR links
      drm/i915: Fix 'mixing different enum types' warnings in
intel_display_power.c

Iswara Nagulendran (1):
      drm/amd/display: Disable FEC if DSC not supported for EDP

Ivaylo Dimitrov (3):
      drm: omapdrm: simplify omap_gem_pin
      drm: omapdrm: Support exporting of non-contiguous GEM BOs
      drm: omapdrm: Do no allocate non-scanout GEMs through DMM/TILER

Jack Xiao (79):
      drm/amdgpu: save the setting of VM_CONTEXT_CNTL
      drm/amdgpu: define MQD abstract layer for hw ip
      drm/amdgpu: add helper function to initialize mqd from ring v4
      drm/amdgpu: add the per-context meta data v3
      drm/amdgpu: add mes ctx data in amdgpu_ring
      drm/amdgpu: define ring structure to access rptr/wptr/fence
      drm/amdgpu: use ring structure to access rptr/wptr v2
      drm/amdgpu: initialize/finalize the ring for mes queue
      drm/amdgpu: assign the cpu/gpu address of fence from ring
      drm/amdgpu/gfx10: implement mqd functions of gfx/compute eng v2
      drm/amdgpu/gfx10: use per ctx CSA for ce metadata
      drm/amdgpu/gfx10: use per ctx CSA for de metadata
      drm/amdgpu/gfx10: associate mes queue id with fence v2
      drm/amdgpu/gfx10: inherit vmid from mqd
      drm/amdgpu/gfx10: use INVALIDATE_TLBS to invalidate TLBs v2
      drm/amdgpu/gmc10: skip emitting pasid mapping packet
      drm/amdgpu: use the whole doorbell space for mes
      drm/amdgpu: update mes process/gang/queue definitions
      drm/amdgpu: add mes_kiq module parameter v2
      drm/amdgpu: allocate doorbell index for mes kiq
      drm/amdgpu/mes: extend mes framework to support multiple mes pipes
      drm/amdgpu/gfx10: add mes queue fence handling
      drm/amdgpu/gfx10: add mes support for gfx ib test
      drm/amdgpu: don't use kiq to flush gpu tlb if mes enabled
      drm/amdgpu/sdma: use per-ctx sdma csa address for mes sdma queue
      drm/amdgpu/sdma5.2: initialize sdma mqd
      drm/amdgpu/sdma5.2: associate mes queue id with fence
      drm/amdgpu/sdma5.2: add mes queue fence handling
      drm/amdgpu/sdma5.2: add mes support for sdma ring test
      drm/amdgpu/sdma5.2: add mes support for sdma ib test
      drm/amdgpu/sdma5: initialize sdma mqd
      drm/amdgpu/sdma5: associate mes queue id with fence
      drm/amdgpu/sdma5: add mes queue fence handling
      drm/amdgpu/sdma5: add mes support for sdma ring test
      drm/amdgpu/sdma5: add mes support for sdma ib test
      drm/amdgpu/mes: add mes kiq callback
      drm/amdgpu: add mes kiq frontdoor loading support
      drm/amdgpu: enable mes kiq N-1 test on sienna cichlid
      drm/amdgpu/mes: manage mes doorbell allocation
      drm/amdgpu: add mes queue id mask v2
      drm/amdgpu/mes: initialize/finalize common mes structure v2
      drm/amdgpu/mes: relocate status_fence slot allocation
      drm/amdgpu/mes10.1: call general mes initialization
      drm/amdgpu/mes10.1: add delay after mes engine enable
      drm/amdgpu/mes10.1: implement the suspend/resume routine
      drm/amdgpu/mes: implement creating mes process v2
      drm/amdgpu/mes: implement destroying mes process
      drm/amdgpu/mes: implement adding mes gang
      drm/amdgpu/mes: implement removing mes gang
      drm/amdgpu/mes: implement suspending all gangs
      drm/amdgpu/mes: implement resuming all gangs
      drm/amdgpu/mes: initialize mqd from queue properties
      drm/amdgpu/mes: implement adding mes queue
      drm/amdgpu/mes: implement removing mes queue
      drm/amdgpu/mes: add helper function to convert ring to queue property
      drm/amdgpu/mes: add helper function to get the ctx meta data offset
      drm/amdgpu/mes: use ring for kernel queue submission
      drm/amdgpu/mes: implement removing mes ring
      drm/amdgpu/mes: add helper functions to alloc/free ctx metadata
      drm/amdgpu: skip kfd routines when mes enabled
      drm/amdgpu: skip some checking for mes queue ib submission
      drm/amdgpu: skip kiq ib tests if mes enabled
      drm/amdgpu: skip gds switch for mes queue
      drm/amdgpu: kiq takes charge of all queues
      drm/amdgpu/mes: map ctx metadata for mes self test
      drm/amdgpu/mes: create gang and queues for mes self test
      drm/amdgpu/mes: add ring/ib test for mes self test
      drm/amdgpu/mes: implement mes self test
      drm/amdgpu/mes10.1: add mes self test in late init
      drm/amdgpu/mes: fix vm csa update issue
      drm/amdgpu/mes: disable mes sdma queue test
      drm/amdgpu: add new CP_MES ucode ids
      drm/amdgpu: correct cp doorbell range
      drm/amdgpu: add mes unmap legacy queue routine
      drm/amdgpu/mes11: initiate mes v11 support
      drm/amdgpu/gfx10: enable kiq to map mes ring
      drm/amdgpu/gfx11: enable kiq to map mes ring
      drm/amdgpu/gfx11: fix me field handling in map_queue packet
      drm/amdgpu/gfx11: fix mes mqd settings

Jagan Teki (16):
      drm: bridge: tc358764: Use drm panel_bridge API
      drm: bridge: panel: Reset the connector state pointer
      exynos: drm: dsi: Attach in_bridge in MIC driver
      drm: exynos: dsi: Use drm panel_bridge API
      drm: exynos: dsi: Convert to bridge driver
      drm: exynos: dsi: Switch to atomic funcs
      Revert "drm/bridge: dw-mipi-dsi: Find the possible DSI devices"
      drm: bridge: nwl-dsi: Switch to devm_drm_of_get_bridge
      drm: bridge: mtk_dsi: Switch to devm_drm_of_get_bridge
      drm: bridge: dw-mipi-dsi: Switch to devm_drm_of_get_bridge
      drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge
      drm: bridge: mcde_dsi: Drop explicit bridge remove
      drm/panel: panel-simple: Fix proper bpc for AM-1280800N3TZQW-T00H
      Revert "drm: bridge: mcde_dsi: Drop explicit bridge remove"
      Revert "drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge"
      drm: exynos: dsi: Use child panel or bridge find helpers

James Zhu (18):
      drm/amdgpu: move out asic specific definition from common header
      drm/amdgpu: add irq sources for vcn v4_0
      drm/amdgpu/jpeg: add jpeg support for VCN4_0_0
      drm/amdgpu/jpeg: enable JPEG PG and CG for VCN4_0_0
      drm/amdgpu/vcn: enable vcn4 dpg mode
      drm/amdgpu: add vcn_4_0_0 video codec query
      drm/amdgpu/discovery: add VCN 4.0 Support
      drm/amdgpu: add VCN4_0_4 firmware
      drm/amdgpu/jpeg: enable JPEG CG for VCN4_0_4
      drm/amdgpu/jpeg: enable JPEG PG for VCN4_0_4
      drm/amdgpu/vcn: enable VCN CG for VCN4_0_4
      drm/amdgpu/vcn: enable VCN PG for VCN4_0_4
      drm/amdgpu/vcn: enable VCN DPG mode for VCN4_0_4
      drm/amdgpu/discovery: enable vcn/jpeg v4_0_4
      drm/amdgpu/vcn: add common vcn sofware ring decode
      drm/amdgpu/vcn3: replace ip based software ring decode with
common vcn software ring decode
      drm/amdgpu/vcn4: replace ip based software ring decode with
common vcn software ring decode
      drm/amdgpu/vcn: include header for vcn_dec_sw_ring_emit_fence

Jani Nikula (75):
      drm/i915/wm: use REG_FIELD_{PREP,GET} for PLANE_WM_BLOCKS_MASK
      drm/i915/gmbus: combine gmbus pin lookups to one function
      drm/i915/gmbus: reduce gmbus pin lookups in gmbus setup
      drm/i915/gmbus: pass gpio reg to intel_gpio_setup()
      drm/i915/gmbus: alloc intel_gmbus dynamically
      drm/i915: include linux/highmem.h and linux/swap.h where needed
      drm/i915/gmbus: move some local bus variables within loops
      drm/i915/gmbus: use to_intel_gmbus() instead of open coding
      x86/gpu: include drm/i915_pciids.h directly in early quirks
      drm/i915: move i915_gem_object_needs_bit17_swizzle() to
i915_gem_tiling.[ch]
      drm/i915: include uapi/drm/i915_drm.h directly where needed
      drm/i915/sdvo: prefer __packed over __attribute__((packed))
      drm/i915/gt: fix i915_reg_t initialization
      drm/edid: don't modify EDID while parsing
      drm/edid: fix reduced blanking support check
      drm/edid: pass a timing pointer to is_display_descriptor()
      drm/edid: pass a timing pointer to is_detailed_timing_descriptor()
      drm/edid: use struct detailed_timing member access in is_rb()
      drm/edid: use struct detailed_timing member access in gtf2 functions
      drm/edid: constify struct detailed_timing in lower level parsing
      drm/edid: constify struct detailed_timing in parsing callbacks
      drm/edid: constify struct edid passed to detailed blocks
      drm/edid: constify struct edid passed around in callbacks and closure
      drm/edid: add more general struct edid constness in the interfaces
      drm/edid: split drm_add_edid_modes() to two
      drm/i915/dmc: simplify intel_dmc_load_program() conditions
      drm/i915/dmc: move assert_dmc_loaded() to intel_dmc.c
      drm/i915/dmc: move dmc debugfs to intel_dmc.c
      drm/i915/dmc: fix i915_reg_t usage
      drm/i915/audio: unify audio codec enable/disable debug logging
      drm/i915/audio: move has_audio checks to within codec enable/disable
      drm/i915/dp: make DSC usage logging actually useful
      drm/edid: fix invalid EDID extension block filtering
      drm/i915/dmc: abstract GPU error state dump
      drm/i915/dmc: hide DMC version macros
      drm/i915/dmc: split out dmc registers to a separate file
      drm/edid: use struct edid * in drm_do_get_edid()
      drm/edid: clean up EDID block checksum functions
      drm/edid: add edid_block_tag() helper to get the EDID extension tag
      drm/edid: make drm_edid_header_is_valid() accept void pointer
      drm/edid: clean up edid_is_zero()
      drm/edid: split out edid_header_fix()
      drm/edid: split drm_edid_block_valid() to check and act parts
      drm/edid: use a better variable name for EDID block read retries
      drm/edid: simplify block check when filtering invalid blocks
      drm/edid: split out invalid block filtering to a separate function
      drm/edid: track invalid blocks in drm_do_get_edid()
      drm/edid: reduce magic when updating the EDID block checksum
      Merge drm/drm-next into drm-intel-next
      drm/edid: convert edid_is_zero() to edid_block_is_zero() for blocks
      drm/edid: have edid_block_check() detect blocks that are all zero
      drm/edid: refactor EDID block status printing
      drm/edid: add a helper to log dump an EDID block
      drm/edid: pass struct edid to connector_bad_edid()
      drm/edid: add typedef for block read function
      drm/edid: abstract an EDID block read helper
      drm/edid: use EDID block read helper in drm_do_get_edid()
      drm/edid: convert extension block read to EDID block read helper
      drm/edid: drop extra local var
      drm/edid: add single point of return to drm_do_get_edid()
      drm/edid: add EDID block count and size helpers
      drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
      drm/i915/gvt: better align the Makefile with i915 Makefile
      Merge tag 'gvt-next-2022-04-21-for-christoph' of
https://github.com/intel/gvt-linux into drm-intel-next
      Merge tag 'gvt-next-2022-04-26' of
https://github.com/intel/gvt-linux into drm-intel-next
      Merge drm/drm-next into drm-intel-next
      Merge tag 'gvt-next-2022-04-29' of
https://github.com/intel/gvt-linux into drm-intel-next
      drm/edid: fix kernel-doc parameter name mismatches
      drm/edid: drop kernel-doc for static functions
      drm/i915: move tons of power well initializers to rodata
      drm/i915: remove superfluous string helper include
      drm/i915: warn about missing ->get_buf_trans initialization
      drm/i915/audio: fix audio code enable/disable pipe logging
      drm/i915/reg: fix undefined behavior due to shift overflowing the con=
stant
      drm/i915/dsi: fix VBT send packet port selection for ICL+

Jason Gunthorpe (5):
      vfio/mdev: Remove vfio_mdev.c
      vfio/mdev: Remove mdev_parent_ops dev_attr_groups
      vfio/mdev: Remove mdev_parent_ops
      vfio/mdev: Use the driver core to create the 'remove' file
      vfio/mdev: Remove mdev drvdata

Javier Martinez Canillas (9):
      drm/vc4: Use newer fence API properly to fix build errors
      dt-bindings: display: ssd1307fb: Deprecate "-i2c" compatible strings
      dt-bindings: display: ssd1307fb: Extend schema for SPI controllers
      drm/solomon: Add ssd130x new compatible strings and deprecate old one=
s.
      drm/solomon: Move device info from ssd130x-i2c to the core driver
      drm/solomon: Add SSD130x OLED displays SPI support
      drm/doc: Add sections about tiny drivers and external refs to intro p=
age
      drm/display: Select DP helper for DRM_DP_AUX_CHARDEV and DRM_DP_CEC
      drm/todo: Add entry for using kunit in the subsystem

Jeffrey Hugo (1):
      drm/doc: Clarify what ioctls can be used on render nodes

Jernej Skrabec (3):
      sun4i/drm: engine: Add mode_set callback
      sun4i/drm: backend: use mode_set engine callback
      sun4i/drm: sun8i: use mode_set engine callback

Jessica Zhang (3):
      drm/msm/dpu: Clean up CRC debug logs
      drm/msm/mdp5: Return error code in mdp5_pipe_release when
deadlock is detected
      drm/msm/mdp5: Return error code in mdp5_mixer_release when
deadlock is detected

Jiapeng Chong (2):
      drm/amdgpu: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

Jiasheng Jiang (1):
      drm: mali-dp: potential dereference of null pointer

Jimmy Kizito (3):
      drm/amd/display: Add work around for AUX failure on wake.
      drm/amd/display: Add configuration options for AUX wake work around.
      drm/amd/display: Add Connection Manager boot option.

Jingwen Zhu (2):
      drm/amd/display: Set fec register init value
      drm/amd/display: add DCN30 support FEC init

John Harrison (14):
      drm/i915/guc: Do not conflate lrc_desc with GuC id for registration
      drm/i915/guc: Add an explicit 'submission_initialized' flag
      drm/i915/guc: Better name for context id limit
      drm/i915/guc: Split guc_lrc_desc_pin apart
      drm/i915/guc: Move lrc desc setup to where it is needed
      drm/i915/guc: Rename desc_idx to ctx_id
      drm/i915/guc: Drop obsolete H2G definitions
      drm/i915/guc: Fix potential invalid pointer dereferences when
decoding G2Hs
      drm/i915: Reduce stack usage in debugfs due to SSEU
      drm/i915/guc: Add fetch of hwconfig blob
      drm/i915/guc: Update to GuC version 70.1.1
      drm/i915/guc: Enable GuC based workarounds for DG2
      drm/i915/dg2: Enable Wa_22012727170/Wa_22012727685
      drm/i915/dg2: Define GuC firmware version for DG2

Jon Hunter (1):
      gpu: host1x: Show all allocated syncpts via debugfs

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Josip Pavic (3):
      drm/amd/display: do not wait for mpc idle if tg is disabled
      drm/amd/display: move definition of dc_flip_addrs struct
      drm/amd/display: do not wait for vblank during pipe programming

Jos=C3=A9 Exp=C3=B3sito (13):
      drm/bridge: nxp-ptn3460: switch to devm_drm_of_get_bridge
      drm/bridge: parade-ps8622: switch to devm_drm_of_get_bridge
      drm/bridge: parade-ps8640: switch to devm_drm_of_get_bridge
      drm/bridge: tc358762: switch to devm_drm_of_get_bridge
      drm/bridge: tc358775: switch to devm_drm_of_get_bridge
      drm/bridge: ti-sn65dsi83: switch to devm_drm_of_get_bridge
      drm/bridge: ti-sn65dsi86: switch to devm_drm_of_get_bridge
      drm/bridge: anx7625: switch to devm_drm_of_get_bridge
      drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
      drm/vc4: hdmi: Remove vc4_hdmi_encoder
      drm/sun4i: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
      drm/rockchip: inno_hdmi: Replace drm_detect_hdmi_monitor() with is_hd=
mi
      drm/rockchip: rk3066_hdmi: Replace drm_detect_hdmi_monitor() with is_=
hdmi

Jos=C3=A9 Roberto de Souza (18):
      drm/i915/display: Allow users to disable PSR2
      drm/i915/display/adlp: Update eDP voltage swing table
      drm/i915/display: Fix HPD short pulse handling for eDP
      drm/i915/display: Do not re-enable PSR after it was marked as not rel=
iable
      drm/i915/display/adlp: More voltage swing table updates
      docs: gpu: i915.rst: Fix DRRS documentation
      drm/i915/dg2: Add Wa_22014226127
      drm/i915/display/tgl+: Set default values for all registers in
PIPE_MBUS_DBOX_CTL
      drm/i915/display/adlp: Fix programing of PIPE_MBUS_DBOX_CTL
      drm/i915/display: Add HAS_MBUS_JOINING
      drm/i915/display/psr: Set partial frame enable when forcing full
frame fetch
      drm/i915/display/psr: Lock and unlock PSR around pipe updates
      drm/i915/display/psr: Use continuos full frame to handle
frontbuffer invalidations
      drm/i915/display: Fix warnings about PSR lock not held
      drm/i915/display/psr: Unset enable_psr2_sel_fetch if other
checks in intel_psr2_config_valid() fails
      drm/i915/display/psr: Clear more PSR state during disable
      drm/i915/display: Add workaround 22014263786
      drm/i915/dg2: Add workaround 18019627453

Jouni H=C3=B6gander (2):
      drm/i915/psr: Set "SF Partial Frame Enable" also on full update
      drm/i915: Check EDID for HDR static metadata when choosing blc

Juha-Pekka Heikkil=C3=A4 (1):
      drm/i915/dg2: Add support for DG2 clear color compression

Julia Lawall (1):
      drm/sti: fix typos in comments

Kai-Heng Feng (1):
      drm/amdgpu: Ensure HDA function is suspended before ASIC reset

Karol Herbst (1):
      drm/i915: Fix race in __i915_vma_remove_closed

Kefeng Wang (1):
      drm/i915: use IOMEM_ERR_PTR() directly

Keita Suzuki (1):
      drm/amd/pm: fix double free in si_parse_power_table()

Kenneth Feng (23):
      drm/amd/pm: support power on/off vcn/jpeg in smu v13_0_7
      drm/amd/pm: add features to smu_v13_0_7
      drm/amd/pm: add mvdd and vddio scaling in smu_v13_0_7
      drm/amd/pm: enable link dpm and link ds on smu_v13_0_7
      drm/amd/pm: enable mp0,vcn,dcn dpm on smu_v13_0_7
      drm/amd/pm: enable fclk,vcn ds and df cstate for smu_v13_0_7
      drm/amd/pm: enable platform features for smu_v13_0_7
      drm/amd/pm: add SCPM support in smu v13_0_7
      drm/amd/pm: update the features for smu_v13_0_7
      drm/amd/pm: pp_dpm_* interface for smu_v13_0_7
      drm/amd/pm:add UMD Pstate clock settings for smu_v13_0_7
      drm/amd/pm: enable pp_dpm_vclk/dclk interface for smu_v13_0_7
      drm/amd/pm: port the fan interface to smu_v13_0_7
      drm/amd/pm: add the pg_flag for athub and mmhub pg on smu_v13_0_7
      drm/amd/soc21: enable mmhub and athub power gating
      drm/amd/pm: enable gfx ds for smu_v13_0_7
      drm/amd/pm: enable gfx pcc and soc cg on smu_v13_0_7
      drm/amd/pm: pp_dpm_sclk change for smu_v13_0_7
      drm/amd/pm: enable workload type change on smu_v13_0_7
      drm/amd/pm: change the soft pptable id for smu_v13_0_7
      drm/amd/pm: report preDS gfxclk on smu_v13_0_7
      drm/amd/pm: disable ac/dc on smu_v13_0_7
      drm/amd/pm: enable gfxoff control on smu_v13_0_7

Kent Russell (5):
      drm/amdgpu: Use switch case for unique_id
      drm/amdgpu: Add UNIQUE_ID to MetricsMember_t
      drm/amdgpu: Use metrics data function to get unique_id for Aldebaran
      drm/amdgpu: Add unique_id support for sienna cichlid
      drm/amdgpu: Fix unique_id references for Sienna Cichlid

Konrad Dybcio (1):
      drm/msm/disp: dpu1: Properly sort qcm2290_dpu_caps

Krunoslav Kovac (2):
      drm/amd/display: Enable 3-plane MPO for DCN31
      drm/amd/display: Enable 3 plane for DCN 3.0 and 3.02

KuoHsiang Chou (1):
      drm/ast: Create the driver for ASPEED proprietory Display-Port

Kuogee Hsieh (10):
      drm/msm/dpu: adjust display_v_end for eDP and DP
      drm/msm/dpu: replace BIT(x) with correspond marco define string
      drm/msm/dpu: revise timing engine programming to support widebus feat=
ure
      drm/msm/dp: enable widebus feature for display port
      drm/msm/dp: replace DRM_DEBUG_DP marco with drm_dbg_dp
      drm/msm/dp: stop event kernel thread when DP unbind
      drm/msm/dp: tear down main link at unplug handle immediately
      drm/msm/dp: reset DP controller before transmit phy test pattern
      drm/msm/dp: do not stop transmitting phy test pattern during DP
phy compliance test
      drm/msm/dp: fix event thread stuck in wait_event after kthread_stop()

Lang Yu (5):
      drm/amdkfd: shrink bitmap size in struct svm_validate_context
      drm/amdkfd: move kfd_flush_tlb_after_unmap into kfd_priv.h
      drm/amdkfd: only allow heavy-weight TLB flush on some ASICs for SVM t=
oo
      Revert "drm/amdkfd: only allow heavy-weight TLB flush on some
ASICs for SVM too"
      drm/amdkfd: allocate MMIO/DOORBELL BOs with AMDGPU_GEM_CREATE_PREEMPT=
IBLE

Lee Jones (1):
      drm/amdkfd: Create file descriptor after client is added to
smi_clients list

Lee Shawn C (1):
      drm/i915: update new TMDS clock setting defined by VBT

Lee, Alvin (1):
      drm/amd/display: Make OPTC3 function accessible to other DCN

Leo (Hanghong) Ma (1):
      drm/amd/display: Move link_trace for edp to dp_trace

Leo Liu (4):
      drm/amdgpu: add vcn 4_0_0 header files v7
      drm/amdgpu: make software ring functions reuseable for newer VCN
      drm/amdgpu: add VCN4 ip block support
      drm/amdgpu: enable VCN4 PG and CG for VCN4_0_0

Leo Ma (1):
      drm/amd/display: Remove ddc write and read size checking

Lijo Lazar (2):
      drm/amd/pm: Check feature support using IP version
      drm/amdgpu: Use flexible array member

Likun Gao (49):
      drm/amdgpu: increase HWIP MAX INSTANCE
      drm/amdgpu: add function to decode ip version
      drm/amdgpu/discovery: add soc21 common Support
      drm/amdgpu/discovery: add NBIO 4.3 Support
      drm/amd/smu: Increace dpm level count only for smu v13.0.2
      drm/amdgpu/discovery: add IH v6
      drm/amdgpu: add hdp version 6 functions
      drm/amdgpu/discovery: add HDP v6
      drm/amdgpu: extend PSP GFX FW type
      drm/amdgpu: add support for spl fw load on psp v13
      drm/amdgpu: support psp v13_0_0 microcode init
      drm/amdgpu: rework psp firmware name
      drm/amdgpu: add tracking for the enablement of SCPM
      drm/amdgpu/discovery: Enable PSP for PSP 13.0.0
      drm/amdgpu/discovery: add GMC 11.0 Support
      drm/amd/pm: fix NULL pointer issue of amdgpu_smu_stb_debug_fs_init
      drm/amd/smu: add smu v13_0 header files
      drm/amdgpu/discovery: Enable SMU for SMU 13.0.0
      drm/amdgpu/discovery: Set GC family for GC 11.0 IP
      drm/amdgpu: add gfx firmware header v2_0
      drm/amdgpu: support rlc v2_3 ucode struct
      drm/amdgpu: add rlc TOC header file for soc21 (v2)
      drm/amdgpu: add imu fw structure
      drm/amdgpu: add mes kiq PSP GFX FW type
      drm/amdgpu: support RLCP firmware front door load
      drm/amdgpu: support RLCV firmware front door load
      drm/amdgpu: support for new SDMA front door load
      drm/amdgpu: support IMU front door load
      drm/amdgpu: add convert for new gfx type
      drm/amdgpu: init SDMA v6 microcode with PSP load type
      drm/amdgpu: extend the show ucode name function
      drm/amdgpu/gfx: refine fw hdr check fuction
      drm/amdgpu: fix the fw size for sdma
      drm/amdgpu: renovate sdma fw struct
      drm/amdgpu: support RS64 CP fw front door load
      drm/amdgpu: support imu for gfx11
      drm/amdgpu/discovery: add GFX 11.0 Support
      drm/amdgpu: update rlc ram for gc v11_0_2
      drm/amdgpu: enable cgcg and cgls for GC 11_0_2
      drm/amd/pm: add get enable mask function for smu v13_0_7
      drm/amdgpu/psp: Add vbflash sysfs interface support
      drm/amdgpu: add sysfs to shows psp vbflash status
      drm/amdgpu: add lsdma block
      drm/amdgpu: support mem copy for LSDMA
      drm/amdgpu: support fill mem for LSDMA
      drm/amdgpu: add LSDMA block for LSDMA v6.0.0
      drm/amdgpu: add LSDMA block for LSDMA v6.0.2
      drm/amdgpu: support memory power gating for lsdma
      drm/amdgpu: support memory power gating for lsdma 6.0.2

Liu Ying (1):
      drm/bridge: nwl-dsi: Drop the drm_of_panel_bridge_remove() function c=
all

Liu Zixian (1):
      drm/virtio: fix NULL pointer dereference in virtio_gpu_conn_get_modes

Liviu Dudau (1):
      drm/komeda: return early if drm_universal_plane_init() fails.

Luben Tuikov (1):
      drm/amdgpu: Unmap legacy queue when MES is enabled

Luca Weiss (1):
      drm/msm: Fix null pointer dereferences without iommu

Lucas De Marchi (9):
      drm/i915/dmc: Do not try loading wrong DMC version
      drm/i915: Use str_yes_no()
      drm/i915: Use str_enable_disable()
      drm/i915: Use str_enabled_disabled()
      drm/i915: Use str_on_off()
      drm/i915: Fix renamed struct field
      drm/i915/uncore: Warn on previous unclaimed accesses
      drm/i915/uncore: Warn only if unclaimed access remains flagged
      drm/i915/dg2: Do not explode on phy calibration error

Lucas Stach (6):
      drm/bridge: adv7511: clean up CEC adapter when probe fails
      drm/etnaviv: check for reaped mapping in etnaviv_iommu_unmap_gem
      drm/etnaviv: move MMU context ref/unref into map/unmap_gem
      drm/etnaviv: move flush_seq increment into etnaviv_iommu_map/unmap
      drm/etnaviv: reap idle softpin mappings when necessary
      drm/etnaviv: avoid cleaning up sched_job when submit succeeded

Lv Ruyi (5):
      drm/amd/dc: remove duplicate include
      drm/msm/dpu: fix error check return value of irq_of_parse_and_map()
      drm/msm/dp: fix error check return value of irq_of_parse_and_map()
      drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
      drm: msm: fix error check return value of irq_of_parse_and_map()

Lyude Paul (1):
      drm/nouveau/subdev/bus: Ratelimit logging for fault errors

Ma Jun (1):
      drm/amdgpu: Sync up header and implementation to use the same
parameter names

Madhumitha Tolakanahalli Pradeep (1):
      drm/i915/dmc: Update DMC to v2.16 on ADL-P

Manasi Navare (1):
      drm/i915/display/vrr: Reset VRR capable property on a long hpd

Marek Marczykowski-G=C3=B3recki (1):
      drm/amdgpu: do not use passthrough mode in Xen dom0

Marek Szyprowski (1):
      drm: bridge: panel: Register connector if DRM device is already regis=
tered

Marek Vasut (50):
      dt-bindings: display: bridge: tc358867: Document DPI output support
      dt-bindings: display: bridge: tc358867: Document DSI data-lanes prope=
rty
      drm/bridge: tc358767: Change tc_ prefix to tc_edp_ for (e)DP
specific functions
      drm/bridge: tc358767: Convert to atomic ops
      drm/bridge: tc358767: Implement atomic_check callback
      drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into
dedicated function
      drm/bridge: tc358767: Wrap (e)DP aux I2C registration into
tc_aux_link_setup()
      drm/bridge: tc358767: Move bridge ops setup into
tc_probe_edp_bridge_endpoint()
      drm/bridge: tc358767: Detect bridge mode from connected endpoints in =
DT
      drm/bridge: tc358767: Split tc_set_video_mode() into common and (e)DP=
 part
      drm/bridge: tc358767: Add DSI-to-DPI mode support
      drm: bridge: icn6211: Fix register layout
      drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN handling
      drm: bridge: icn6211: Add HS/VS/DE polarity handling
      drm: bridge: icn6211: Add generic DSI-to-DPI PLL configuration
      drm: bridge: icn6211: Use DSI burst mode without EoT and with LP
command mode
      drm: bridge: icn6211: Disable DPI color swap
      drm: bridge: icn6211: Set SYS_CTRL_1 to value used in examples
      drm: bridge: icn6211: Implement atomic_get_input_bus_fmts
      drm: bridge: icn6211: Add I2C configuration support
      drm: bridge: icn6211: Rework ICN6211_DSI to chipone_writeb()
      drm: bridge: icn6211: Read and validate chip IDs before configuration
      drm/bridge: ti-sn65dsi83: Check link status register after
enabling the bridge
      drm/bridge: lt9611: Switch to atomic operations
      drm/bridge: lt9611: Add atomic_get_input_bus_fmts
      drm: bridge: icn6211: Fix DSI-to-DPI PLL configuration
      drm: bridge: icn6211: Mark module exit callback with __exit
      drm: bridge: icn6211: Drop I2C module owner assignment
      drm: bridge: icn6211: Convert to regmap
      drm/panel: lvds: Simplify mode parsing
      drm/panel: lvds: Use bus_flags from DT panel-timing property
      dt-bindings: display: bridge: lt9211: Add Lontium LT9211 bridge drive=
r
      drm/bridge: lt9211: Add Lontium LT9211 bridge driver
      dt-bindings: display: bridge: icn6211: Document DSI data-lanes proper=
ty
      drm: bridge: icn6211: Add DSI lane count DT property parsing
      dt-bindings: display: simple: Add DataImage FG040346DSSWBG04
compatible string
      drm/panel: simple: Add DataImage FG040346DSSWBG04 panel support
      drm/modes: Make width-mm/height-mm check in
of_get_drm_panel_display_mode() mandatory
      drm/panel: lvds: Drop now redundant width-mm and height-mm check
      drm/panel: simple: Add missing bus flags for Innolux G070Y2-L01
      drm: mxsfb: Wrap FIFO reset and comments into mxsfb_reset_block()
      drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr=
()
      drm: mxsfb: Factor out mxsfb_set_mode()
      drm: mxsfb: Reorder mxsfb_crtc_mode_set_nofb()
      drm: mxsfb: Obtain bus flags from bridge state
      drm/bridge: tc358767: Fix (e)DP bridge endpoint parsing in
dedicated function
      dt-bindings: display: bridge: ldb: Implement simple Freescale
i.MX8MP LDB bridge
      drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge
      drm: mxsfb: Implement LCDIF scanout CRC32 support
      drm/bridge: tc358767: Fix DP bridge mode detection from DT endpoints

Marijn Suijten (2):
      drm/msm/dpu: Bind pingpong block to intf on active ctls in cmd encode=
r
      drm/msm/dpu: Use indexed array initializer to prevent mismatches

Mario Limonciello (1):
      drm/amd: Don't reset dGPUs if the system is going to s2idle

Marko Zekovic (1):
      amdgpu/pm: Enable sysfs nodes for vclk and dclk for NAVI12

Martin Krastev (1):
      drm/vmwgfx: Add support for CursorMob and CursorBypass 4

Martin Leung (2):
      drm/amd/display: Revert FEC check in validation
      drm/amd/display: revert Power down hardware if timer not trigger

Mastan Katragadda (1):
      drm/i915/gem: add missing boundary check in vm_access

Matt Atwood (2):
      drm/i915/uapi: Add DRM_I915_QUERY_GEOMETRY_SUBSLICES
      drm/i915/rpl-p: Add PCI IDs

Matt Roper (19):
      drm/i915/dg2: Skip output init on PHY calibration failure
      drm/i915/xehp: Support platforms with CCS engines but no RCS
      drm/i915/xehp: Drop aux table invalidation on FlatCCS platforms
      drm/i915/gt: Remove GEN12_SFC_DONE_MAX from register defs header
      drm/i915/sseu: Don't overallocate subslice storage
      drm/i915/xehp: Update topology dumps for Xe_HP
      drm/i915: Report steering details in debugfs
      drm/i915: Add support for steered register writes
      drm/i915/ats-m: add ATS-M platform info
      drm/i915: Sunset igpu legacy mmap support based on GRAPHICS_VER_FULL
      drm/fourcc: Introduce format modifiers for DG2 render and media
compression
      drm/i915/dg2: Add support for DG2 render and media compression
      drm/i915/doc: Convert drm_i915_query_topology_info comment to kerneld=
oc
      drm/i915/doc: Convert perf UAPI comments to kerneldoc
      drm/i915/doc: Link query items to their uapi structs
      drm/i915: Add first set of DG2 PCI IDs
      drm/i915/uapi: Add kerneldoc for engine class enum
      drm/i915/xehp: Add register for compute engine's MMIO-based TLB
invalidation
      drm/i915/xehp: Add compute engine ABI

Matthew Auld (22):
      drm/i915/fbdev: fixup setting screen_size
      drm/i915: limit the async bind to bind_async_flags
      drm/i915: stop checking for NULL vma->obj
      drm/i915/gtt: reduce overzealous alignment constraints for GGTT
      drm/i915: opportunistically apply ALLOC_CONTIGIOUS
      drm/doc: pull in drm_buddy.c
      drm/i915/lmem: don't treat small BAR as an error
      drm/i915/stolen: consider I915_BO_ALLOC_GPU_ONLY
      drm/i915: add i915_gem_object_create_region_at()
      drm/i915/ttm: wire up the object offset
      drm/i915: fixup the initial fb base on DGFX
      drm/i915/ttm: limit where we apply TTM_PL_FLAG_CONTIGUOUS
      drm/i915/migrate: move the sanity check
      drm/i915/selftests: handle more rounding
      drm/i915: fix broken build
      drm/i915: fix i915_gem_object_wait_moving_fence
      drm/ttm: stop passing NULL fence in ttm_bo_move_sync_cleanup
      drm/ttm: fixup ttm_bo_add_move_fence v2
      drm/i915: consider min_page_size when migrating
      drm/i915/buddy: sanity check the size
      drm/i915/selftests: fixup min_alignment usage
      drm/i915/selftests: tweak the misaligned_case

Matthew Brost (2):
      drm/i915: Add logical mapping for video decode engines
      drm/i915/dg2: Enable Wa_14014475959 - RCS / CCS context exit

Matthias Kaehlcke (2):
      drm/panel-edp: Add AUO B133UAN01
      drm/panel-edp: Fix AUO B133UAN01 panel id

Max Erenberg (1):
      drm/amd/display: Disallow entering PSR when panel is disconnected

Maxime Ripard (33):
      drm/komeda: plane: switch to plane reset helper
      drm/komeda: plane: Remove redundant zpos initialisation
      drm/komeda: plane: Remove redundant color encoding and range
initialisation
      drm/vc4: hdmi: Rename pixel_rate variable
      drm/vc4: hdmi: Move clock validation to its own function
      drm/vc4: hdmi: Move clock calculation into its own function
      drm/vc4: hdmi: Take the sink maximum TMDS clock into account
      drm/vc4: hdmi: Take bpp into account for the scrambler
      drm/vc4: hdmi: Always try to have the highest bpc
      drm/vc4: hdmi: Support HDMI YUV output
      drm/atomic: Print the state every non-blocking commit
      drm/atomic: Add atomic_print_state to private objects
      drm/vc4: Constify private state accessors
      drm/vc4: Implement atomic_print_state for HVS channel state
      drm/imx: ipuv3-plane: Remove redundant zpos initialisation
      drm/imx: ipuv3-plane: Remove redundant color encoding and range
initialisation
      Merge drm/drm-next into drm-misc-next
      drm/vc4: Add logging and comments
      drm/vc4: hdmi: Remove clock rate initialization
      drm/vc4: kms: Take old state core clock rate into account
      drm/vc4: hvs: Fix frame count register readout
      drm/vc4: hvs: Store channel in variable
      drm/vc4: hvs: Remove dlist setup duplication
      drm/vc4: hvs: Move the dlist setup to its own function
      drm/vc4: kms: Ignore atomic_flush if we're disabled
      drm/vc4: hvs: Use pointer to HVS in HVS_READ and HVS_WRITE macros
      drm/vc4: hvs: Reset muxes at probe time
      drm/vc4: txp: Don't set TXP_VSTART_AT_EOF
      drm/vc4: txp: Force alpha to be 0xff if it's disabled
      drm/vc4: kms: Store channel in local variable
      drm/vc4: kms: Warn if we have an incompatible muxing setup
      drm/vc4: kms: Improve logging
      Merge drm/drm-next into drm-misc-next

Melissa Wen (8):
      drm/vc4: add tracepoints for CL submissions
      drm/amd/display: move FPU related code from dcn31 to dml/dcn31 folder
      drm/amd/display: move FPU related code from dcn315 to dml/dcn31 folde=
r
      drm/amd/display: move FPU related code from dcn316 to dml/dcn31 folde=
r
      drm/amd/display: detach fpu operations from
dcn10_validate_bandwidth in calcs
      drm/amd/display: remove DC_FP_* wrapper from dml folder
      drm/amd/display: don't ignore alpha property on pre-multiplied mode
      drm/amd/display: protect remaining FPU-code calls on dcn3.1.x

Miaoqian Lin (4):
      drm/bridge: Fix error handling in analogix_dp_probe
      drm/amd/display: Fix memory leak in dcn21_clock_source_create
      malidp: Fix NULL vs IS_ERR() checking
      drm/msm/a6xx: Fix refcount leak in a6xx_gpu_init

Michael Cheng (5):
      drm/i915/gt: Re-work intel_write_status_page
      drm/i915/gt: Drop invalidate_csb_entries
      drm/i915/gt: Re-work reset_csb
      drm/i915/: Re-work clflush_write32
      drm/i915/gt: replace cache_clflush_range

Michael Strauss (4):
      drm/amd/display: Update LTTPR UHBR link rate support struct
      drm/amd/display: Check for invalid input params when building
scaling params
      drm/amd/display: Don't pass HostVM by default on DCN3.1
      drm/amd/display: Refactor LTTPR cap retrieval

Michal Suchanek (3):
      sysfb: Make config option dependencies explicit
      sysfb: Enable boot time VESA graphic mode selection
      efifb: Remove redundant efifb_setup_from_dmi stub

Mika Kahola (1):
      drm/fourcc: Introduce format modifier for DG2 clear color

Mike Lothian (3):
      drm/amdgpu/gfx11: Add missing break
      drm/amdgpu/gfx10: Avoid uninitialised variable 'index'
      drm/amdgpu/gfx11: Avoid uninitialised variable 'index'

Miles Chen (1):
      drm/mediatek: Fix mtk_cec_mask()

Minghao Chi (8):
      drm/vc4: simplify the return expression of vc4_prepare_fb()
      drm/vc4: simplify the return expression of vc4_grab_bin_bo()
      drm/nouveau: simplify the return expression of nouveau_debugfs_init()
      drm/amdgpu: simplify the return expression of iceland_ih_hw_init
      drm/amdgpu: simplify the return expression of navi10_ih_hw_init()
      drm: simplify the return expression of ast_drm_resume()
      drm/amdgpu: simplify the return expression
      drm/amdgpu: simplify the return expression of vega10_ih_hw_init()

Mohammad Zafar Ziya (8):
      drm/amdgpu: Add vcn and jpeg ras support flag
      drm/amdgpu/vcn: Add vcn ras support
      drm/amdgpu/jpeg: Add jpeg block ras support
      drm/amdgpu/vcn: Add vcn and jpeg ver 2.6 ras register definition
      drm/amdgpu/vcn: Add VCN ras error query support
      drm/amdgpu/jpeg: Add jpeg ras error query support
      drm/amdgpu/jpeg: add jpeg ras poison consumption handling
      drm/amdgpu/vcn: Add vcn ras poison consumption event handling

Mukul Joshi (6):
      drm/amdkfd: Cleanup IO links during KFD device removal
      drm/amdkfd: Fix updating IO links during device removal
      drm/amdkfd: Fix circular lock dependency warning
      drm/amdgpu: Enable KFD with MES enabled
      drm/amdgpu/mes: Update the doorbell function signatures
      drm/amdkfd: Add KFD support for soc21 v3

Mustapha Ghaddar (1):
      drm/amd/display: Fix HDCP QUERY Error for eDP and Tiled

Nathan Chancellor (1):
      drm/i915: Fix CFI violation with show_dynamic_id()

Nicolas Belin (3):
      dt-bindings: display: bridge: it66121: Add audio support
      drm: bridge: it66121: Fix the register page length
      drm: bridge: it66121: Add audio support

Nikita Yushchenko (1):
      drm/bridge_connector: enable HPD by default if supported

Noralf Tr=C3=B8nnes (3):
      dt-bindings: display: sitronix, st7735r: Fix backlight in example
      dt-bindings: display: sitronix, st7735r: Make reset-gpios optional
      dt-bindings: display: sitronix, st7735r: Remove spi-max-frequency lim=
it

N=C3=ADcolas F. R. A. Prado (2):
      drm/bridge: anx7625: Use uint8 for lane-swing arrays
      drm/mediatek: dpi: Use mt8183 output formats for mt8192

Oliver Logush (4):
      drm/amd/display: Remove SW w/a for HDCP 1.4 1A-07 failure based on EC=
O fix
      drm/amd/display: Insert pulling smu busy status before sending
another request
      drm/amd/display: Always update DPPCLK_DTO when clock increase
      drm/amd/display: Insert smu busy status before sending another reques=
t

Patrik Jakobsson (11):
      drm/gma500: Remove unused declarations and other cruft
      drm/gma500: Move gma_intel_crtc_funcs into gma_display.c
      drm/gma500: Don't store crtc_funcs in psb_ops
      drm/gma500: Cosmetic cleanup of irq code
      drm/gma500: Use managed drmm_mode_config_init()
      drm/gma500: Uninstall interrupts on driver removal
      drm/gma500: Make use of the drm connector iterator
      drm/gma500: gma500 don't register non-hotpluggable connectors
      drm/gma500: Free the correct connector allocation
      drm/gma500: Declare a few functions static
      drm/gma500: Add crtc prefix to vblank functions

Paul Boddie (1):
      drm/ingenic: Add dw-hdmi driver specialization for jz4780

Paul Cercueil (2):
      drm/ingenic: Implement proper .atomic_get_input_bus_fmts
      Merge drm/drm-next into drm-misc-next

Paul Hsieh (2):
      drm/amd/display: Power down hardware if timer not trigger
      drm/amd/display: Power down hardware if timer not trigger

Philip Yang (11):
      drm/amdgpu: Correct unlocked update fence handling
      drm/amdgpu: Add tlb_cb for unlocked update
      drm/amdkfd: Use atomic64_t type for pdd->tlb_seq
      drm/amdgpu: Flush TLB after mapping for VG20+XGMI
      drm/amdkfd: Add missing NULL check in svm_range_map_to_gpu
      drm/amdkfd: Handle drain retry fault race with XNACK mode change
      drm/amdkfd: Add SVM range mapped_to_gpu flag
      drm/amdkfd: Update mapping if range attributes changed
      drm/amdgpu: Free user pages if amdgpu_cs_parser_bos failed
      drm/amdgpu: Free user pages if kvmalloc_array fails
      drm/amdgpu: vm flush needed after updating PDEs

Pin-Yen Lin (1):
      drm/bridge: it6505: Send DPCD SET_POWER to downstream

Prike Liang (1):
      drm/amdgpu: keep mmhub clock gating being enabled during s2idle suspe=
nd

Ramalingam C (12):
      drm/ttm: Add a parameter to add extra pages into ttm_tt
      drm/i915/gt: use engine instance directly for offset
      drm/i915/gt: Use XY_FAST_COLOR_BLT to clear obj on graphics ver 12+
      drm/i915/gt: Optimize the migration and clear loop
      drm/i915/gt: Pass the -EINVAL when emit_pte doesn't update any PTE
      drm/i915/gt: Clear compress metadata for Flat-ccs objects
      drm/i915/selftest_migrate: Consider the possible roundup of size
      drm/i915/selftest_migrate: Check CCS meta data clear
      drm/i915/gem: Add extra pages in ttm_tt for ccs data
      drm/i915/migrate: Evict and restore the flatccs capable lmem obj
      drm/i915/gt: optimize the ccs_sz calculation per chunk
      drm/i915/gt: Document the eviction of the Flat-CCS objects

Randy Dunlap (6):
      drm/amd/display: DCN3.1: don't mark as kernel-doc
      drm: fix a kernel-doc typo
      drm/format_helper: fix a kernel-doc typo
      gpu: host1x: Fix a kernel-doc warning
      drm: sti: don't use kernel-doc markers
      drm/amd/display: fix non-kernel-doc comment warnings

Raphael Gallais-Pou (1):
      drm: fix typo in comment

Rex-BC Chen (9):
      drm/dsi: transfer DSI HS packets ending at the same time
      drm/mediatek: implement the DSI HS packets aligned
      drm/bridge: anx7625: config hs packets end aligned to avoid screen sh=
ift
      drm/mediatek: Add vblank register/unregister callback functions
      dt-bindings: display: mediatek: revise enum to const
      dt-bindings: display: mediatek: change to use enum for mutex
      dt-bindings: display: mediatek: add MT8186 SoC binding
      dt-bindings: display: mediatek: Update disp_aal binding for MT8183
      dt-bindings: display: mediatek: Update disp_aal binding for
MT8192 and MT8195

Richard Gong (1):
      drm/amdgpu: vi: disable ASPM on Intel Alder Lake based systems

Rob Clark (18):
      drm/virtio: Remove restriction of non-zero blob_flags
      drm/fourcc: Add QCOM tiled modifiers
      drm/msm: Remove unused field in submit
      drm/msm: Add support for pointer params
      drm/msm: Split out helper to get comm/cmdline
      drm/msm: Add a way to override processes comm/cmdline
      drm/msm/gem: Move prototypes
      drm/msm/gpu: Drop duplicate fence counter
      drm/msm/gem: Convert some missed GEM_WARN_ON()s
      drm/msm/gem: Split out inuse helper
      drm/msm/gem: Drop PAGE_SHIFT for address space mm
      drm/msm: Drop msm_gem_iova()
      drm/msm/gem: Rework vma lookup and pin
      drm/msm/gem: Split vma lookup and pin
      drm/msm/gem: Add fenced vma unpin
      drm/msm: Add a way for userspace to allocate GPU iova
      drm/msm: Limit command submission when no IOMMU
      drm/msm: Fix fb plane offset calculation

Robert Foss (1):
      drm/bridge: Fix it6505 Kconfig DRM_DP_AUX_BUS dependency

Robin Murphy (2):
      drm/arm/malidp: Stop using iommu_present()
      drm/rockchip: Refactor IOMMU initialisation

Rodrigo Siqueira (1):
      Revert "drm/amd/display: Pass HostVM enable flag into DCN3.1 DML"

Rodrigo Vivi (4):
      Merge drm/drm-next into drm-intel-next
      drm/i915/uapi: Add query for hwconfig blob
      drm/i915/hwconfig: Add DG2 support
      Merge drm/drm-next into drm-intel-gt-next

Roman Li (3):
      drm/amd/display: Remove redundant dsc power gating from init_hw
      drm/amd/display: Enable power gating before init_pipes
      drm/amd/display: Fix allocate_mst_payload assert on resume

Rongguang Wei (1):
      drm/amdgpu: fix typo

Ruili Ji (1):
      drm/amdgpu: fix incorrect GCR_GENERAL_CNTL address

Saaem Rizvi (1):
      drm/amd/display: Disabling Z10 on DCN31

Salah Triki (1):
      gpu: ipu-v3: image-convert: use swap()

Samson Tam (1):
      drm/amd/display: Add support for USBC connector

Samuel Holland (10):
      dt-bindings: display: Separate clock item lists by compatible
      dt-bindings: display: Add D1 display engine compatibles
      drm/sun4i: hdmi: Use more portable I/O helpers
      drm/sun4i: Allow building the driver on RISC-V
      drm/sun4i: Allow VI layers to be primary planes
      drm/sun4i: csc: Add support for the new MMIO layout
      drm/sun4i: Add support for D1 mixers
      drm/sun4i: Add support for D1 TCON TOP
      drm/sun4i: Add support for D1 TCONs
      drm/sun4i: Add compatible for D1 display engine

Sandor Yu (4):
      drm: bridge: dw_hdmi: default enable workaround to clear the overflow
      drm: bridge: dw_hdmi: Enable GCP only for Deep Color
      drm: bridge: dw_hdmi: add reset function for PHY GEN1
      drm: bridge: dw_hdmi: Audio: Add General Parallel Audio (GPA) driver

Sankeerth Billakanti (5):
      drm/panel-edp: add LQ140M1JW46 edp panel entry
      drm/msm/dp: Add eDP support via aux_bus
      drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
      drm/msm/dp: wait for hpd high before aux transaction
      drm/msm/dp: Support the eDP modes given by panel

Sascha Hauer (13):
      drm/rockchip: Embed drm_encoder into rockchip_decoder
      drm/rockchip: Add crtc_endpoint_id to rockchip_encoder
      drm/rockchip: dw_hdmi: rename vpll clock to reference clock
      dt-bindings: display: rockchip: dw-hdmi: use "ref" as clock name
      drm/rockchip: dw_hdmi: add rk3568 support
      dt-bindings: display: rockchip: dw-hdmi: Add regulator support
      drm/rockchip: dw_hdmi: add regulator support
      dt-bindings: display: rockchip: dw-hdmi: Make unwedge pinctrl optiona=
l
      dt-bindings: display: rockchip: Add binding for VOP2
      dt-bindings: display: rockchip: dw-hdmi: fix ports description
      drm/rockchip: Make VOP driver optional
      dt-bindings: display: rockchip: make reg-names mandatory for VOP2
      drm/rockchip: Change register space names in vop2

Sathishkumar S (4):
      drm/amd/pm: support ss metrics read for smu11
      drm/amd/pm: update smartshift powerboost calc for smu12
      drm/amd/pm: update smartshift powerboost calc for smu13
      drm/amd/pm: consistent approach for smartshift

Sean Paul (1):
      drm/amdgpu: Re-classify some log messages in commit path

Shirish S (1):
      amd/display: set backlight only if required

Sonny Jiang (1):
      drm/amdgpu: Enable vcn v4_0_4 sram

Stanislav Lisovskiy (5):
      drm/i915: Introduce new Tile 4 format
      drm/i915/dg2: Tile 4 plane format support
      drm/i915/dg2: Use I915_BO_ALLOC_CONTIGUOUS flag for DPT
      drm/i915: Fix skl_pcode_try_request function
      drm/i915: Swap ret and status returned from skl_pcode_request

Stanley Yang (3):
      drm/amdgpu: add soc21 ih clientid definition
      drm/amdgpu: add initial support for sdma v6.0
      drm/amdgpu/discovery: add SDMA v6_0 ip block

Stanley.Yang (5):
      drm/amdgpu: add umc query error status function
      drm/amdgpu: add new write field for soc21
      drm/amdgpu: add soc21 common ip block v2
      drm/amdgpu: add nbio v4_3_0 ip block v2
      drm/amdgpu: add ih v6_0 ip block v2

Steven Price (1):
      drm/plane: Move range check for format_count earlier

Stuart Summers (2):
      drm/i915: Add RCS mask to GuC ADS params
      drm/i915/pvc: add initial Ponte Vecchio definitions

Stylon Wang (1):
      Revert "drm/amd/display: Fix DCN3 B0 DP Alt Mapping"

Sui Jingfeng (2):
      drivers/dma-buf: dma-buf.c: fix a typo
      drm/drm_modeset_helper_vtables.h: fix a typo

Sujaritha Sundaresan (1):
      drm/i915/gt: Add sysfs throttle frequency interfaces

Sung Joon Kim (1):
      drm/amd/display: Fix null pointer exception while load amdgpu

Swathi Dhanavanthri (1):
      drm/i915/display/adlp: Remove code related to underrun recovery

Tales Lelo da Aparecida (3):
      drm/amd/display: make hubp1_wait_pipe_read_start() static
      Documentation/gpu: Add entries to amdgpu glossary
      MAINTAINERS: add docs entry to AMDGPU

Tao Zhou (10):
      drm/amdkfd: refine event_interrupt_poison_consumption
      drm/amdkfd: replace source_id with client_id for RAS poison consumpti=
on
      drm/amdgpu: add UTCL2 RAS poison query for Aldebaran (v2)
      drm/amdkfd: add RAS poison consumption handling for UTCL2 (v2)
      drm/amdkfd: print unmap queue status for RAS poison consumption (v3)
      drm/amdgpu: add RAS poison creation handler (v2)
      drm/amdgpu: add RAS poison consumption handler (v2)
      drm/amdgpu: add RAS fatal error interrupt handler
      drm/amdgpu: enable RAS IH for poison consumption
      drm/amdgpu: refine RAS poison consumption handler

Tejas Upadhyay (3):
      iommu/vt-d: Add RPLS to quirk list to skip TE disabling
      drm/i915/adl-n: Add stepping info
      drm/i915: Add RPL-S PCI IDs

Thierry Reding (2):
      gpu: host1x: Do not use mapping cache for job submissions
      drm/tegra: gem: Do not try to dereference ERR_PTR()

Thomas Hellstr=C3=B6m (3):
      drm/i915: Remove the vm open count
      drm/i915: Remove the vma refcount
      drm/i915/gem: Remove some unnecessary code

Thomas Zimmermann (40):
      drm/gma500: Remove struct psb_gem_object.npage
      drm/gma500: Acquire reservation lock for GEM objects
      drm/gma500: Move GTT locking into GTT helpers
      drm/gma500: Remove struct psb_gtt.sem sempahore
      drm/gma500: Move GTT setup and restoration into helper funtions
      drm/gma500: Move GTT resume logic out of psb_gtt_init()
      drm/gma500: Cleanup GTT uninit and error handling
      drm/gma500: Split GTT init/resume/fini into GTT and GEM functions
      drm/gma500: Inline psb_gtt_restore()
      drm/gma500: Move GEM memory management functions to gem.c
      drm/gma500: Move GTT enable and disable code into helpers
      drm/gma500: Move GTT memory-range setup into helper
      fbdev: Fix sys_imageblit() for arbitrary image widths
      fbdev: Fix cfb_imageblit() for arbitrary image widths
      of: Create platform devices for OF framebuffers
      fbdev: Warn in hot-unplug workaround for framebuffers without device
      drm: Put related statements next to each other in Makefile
      drm: Rename dp/ to display/
      drm/display: Introduce a DRM display-helper module
      drm/display: Split DisplayPort header into core and helper
      drm/display: Move DSC header and helpers into display-helper module
      drm/display: Move HDCP helpers into display-helper module
      drm/display: Move HDMI helpers into display-helper module
      drm/display: Move SCDC helpers into display-helper library
      drm/format-helper: Print warning on missing format conversion
      drm/format-helper: Add RGB888-to-XRGB8888 conversion
      drm/format-helper: Add RGB565-to-XRGB8888 conversion
      fbdev: Put mmap for deferred I/O into drivers
      fbdev: Track deferred-I/O pages in pageref struct
      fbdev: Refactor implementation of page_mkwrite
      fbdev: Rename pagelist to pagereflist for deferred I/O
      fbdev: Use pageref offset for deferred-I/O writeback
      drm/simpledrm: Use fbdev defaults for shadow buffering
      drm/format-helper: Implement drm_fb_swab() with per-line helpers
      drm/format-helper: Remove optional byte-swap from line convertion
      drm/format-helper: Unify the parameters of all per-line conversion he=
lpers
      drm/format-helper: Share implementation among conversion helpers
      drm: Add DRM-managed mutex_init()
      drm/ast: Protect concurrent access to I/O registers with lock
      drm/mgag200: Protect concurrent access to I/O registers with lock

Tianci.Yin (4):
      drm/amdgpu: add athub v3_0 ip block
      drm/amdgpu: add gfxhub v3_0 ip block
      drm/amdgpu: add mmhub v3_0 ip block
      drm/amdgpu: add gmc v11_0 ip block (v3)

Tilak Tangudu (1):
      drm/i915: Add Wa_22011802037 force cs halt

Tim Huang (5):
      drm/amdgpu/pm: add EnableGfxImu message dummy map for SMU IP v13.0.4
      drm/amdgpu/pm: add some common ppt functions for SMU IP v13.0.x
      drm/amdgpu/pm: add swsmu ppt implementation for SMU IP v13.0.4
      drm/amdgpu/pm: enable swsmu for SMU IP v13.0.4
      drm/amdgpu/pm: add GFXOFF control IP version check for SMU IP v13.0.4

Tom Rix (17):
      drm/bridge: anx7625: check the return on anx7625_aux_trans
      drm/radeon: change si_default_state table from global to static
      drm/amd/display: cleanup extern usage in function definition
      drm/radeon: change cayman_default_state table from global to static
      drm/radeon: remove r600_blit_shaders.[c|h]
      drm/nouveau: change base917c_format from global to static
      drm/nouveau/gr/gf100-: change gf108_gr_fwif from global to static
      drm/amd/display: add virtual_setup_stream_attribute decl to header
      drm/radeon/kms: change evergreen_default_state table from global to s=
tatic
      drm/nouveau/gsp: change gv100_gsp from global to static
      drm/radeon: change cik_default_state table from global to static
      drm/radeon: change cac_weights_* to static
      drm/nouveau/kms/gv100: use static for gv100_disp_core_mthd_[base|sor]
      drm/nouveau/disp/gv100: make gv100_disp_wimm static
      drm/nouveau/disp/gv100: make gv100_disp_wndw and
gv100_disp_wndw_mthd static
      drm/msm: change msm_sched_ops from global to static
      drm/rockchip: cdn-dp: change rk3399_cdn_dp from global to static

Tom St Denis (1):
      drm/amd/amdgpu: Update debugfs GCA data

Tomas Winkler (4):
      drm/i915/gsc: add gsc as a mei auxiliary device
      mei: add support for graphics system controller (gsc) devices
      mei: gsc: add runtime pm handlers
      drm/i915/dg2: add gsc with special gsc bar offsets

Tomasz Mo=C5=84 (1):
      drm/amdgpu: Enable gfxoff quirk on MacBook Pro

Tse, Kaitlyn (1):
      drm/amd/display: Remove outdated register for dcn3+

Tvrtko Ursulin (13):
      drm/i915: Prepare for multiple GTs
      drm/i915/uapi: Document DRM_I915_QUERY_HWCONFIG_BLOB
      drm/i915: Move intel_vtd_active and run_as_guest to i915_utils
      drm/i915: Explicitly track DRM clients
      drm/i915: Make GEM contexts track DRM clients
      drm/i915: Track runtime spent in closed and unreachable GEM contexts
      drm/i915: Track all user contexts per client
      drm/i915: Track context current active time
      drm: Document fdinfo format specification
      drm/i915: Count engine instances per uabi class
      drm/i915: Expose client engine utilisation via fdinfo
      drm/i915: Fixup kerneldoc in struct i915_gem_context
      drm/i915: Fix assert in i915_ggtt_pin

Uma Shankar (1):
      drm/i915/display: Extend DP HDR support to hsw+

Umesh Nerlige Ramappa (2):
      drm/i915/guc: Enable Wa_22011802037 for gen12 GuC based platforms
      drm/i915/pmu: Use existing uncore helper to read gpm_timestamp

Uwe Kleine-K=C3=B6nig (2):
      drm/ssd130x: Make ssd130x_remove() return void
      drm/bridge: tfp410: Make tfp410_fini() return void

Ville Syrj=C3=A4l=C3=A4 (174):
      drm/i915: Optimize icl+ universal plane programming
      drm/i915: Make skl+ universal plane registers unlocked
      drm/i915: Make cursor plane registers unlocked
      drm/i915: Make most pre-skl primary plane registers unlocked
      drm/i915: Make pre-skl sprite plane registers unlocked
      drm/i915: s/JSP2/ICP2/ PCH
      drm/i915: Avoid negative shift due to bigjoiner_pipes=3D=3D0
      drm/i915: Fix cursor coordinates on bigjoiner slave
      drm/i915: Remove nop bigjoiner state copy
      drm/i915: Rename variables in intel_crtc_compute_config()
      drm/i915: Extract intel_splitter_adjust_timings()
      drm/i915: Extract intel_bigjoiner_adjust_timings()
      drm/i915: Extract intel_crtc_compute_pipe_src()
      drm/i915: Extract intel_crtc_compute_pipe_mode()
      drm/i915: Fix MSO vs. bigjoiner timings confusion
      drm/i915: Don't skip ddb allocation if data_rate=3D=3D0
      drm/i915: Check async flip capability early on
      drm/i915: Fix the async flip wm0/ddb optimization
      drm/i915: Pimp async flip debugs
      drm/i915: Move framestart_delay to crtc_state
      drm/i915: Remove framestart_delay sanitation
      drm/i915: Relocate ibx pch port sanitation code
      drm/i915: Relocate a few more pch transcoder bits
      drm/i915: Nuke skl_wrpll_context_init()
      drm/i915: Move a bunch of stuff into rodata from the stack
      drm/i915: Clean up some struct/array initializers
      drm/i915: Remove bxt m2_frac_en
      drm/i915: Use designated initializers for bxt_dp_clk_val[]
      drm/i915: Start tracking PIPESRC as a drm_rect
      drm/i915: Eliminate bigjoiner boolean
      drm/i915: Use bigjoiner_pipes more
      drm/i915: Remove leftover cnl SAGV block time
      drm/i915: Make the PIPESRC rect relative to the entire bigjoiner area
      drm/i915: Store the /5 target clock in struct dpll on vlv/chv
      drm/i915: Remove redundant/wrong comments
      drm/i915: Clean up bxt/glk PLL registers
      drm/i915: Store the m2 divider as a whole in bxt_clk_div
      drm/i915: Replace bxt_clk_div with struct dpll
      drm/i915: Replace hand rolled bxt vco calculation with
chv_calc_dpll_params()
      drm/i915: Populate bxt/glk DPLL clock limits a bit more
      drm/i915: Remove struct dp_link_dpll
      drm/i915: Fix up some DRRS type checks
      drm/i915: Constify intel_drrs_init() args
      drm/i915: Pimp DRRS debugs
      drm/i915: Read DRRS MSA timing delay from VBT
      drm/i915: Program MSA timing delay on ilk/snb/ivb
      drm/i915: Polish drrs type enum
      drm/i915: Clean up DRRS refresh rate enum
      drm/i915: Rename PIPECONF refresh select bits
      drm: Add drm_mode_init()
      drm/bridge: Use drm_mode_copy()
      drm/imx: Use drm_mode_duplicate()
      drm/panel: Use drm_mode_duplicate()
      drm/i915/dsi: Pass fixed_mode to *_dsi_add_properties()
      drm/i915/sdvo: Pass the requesed mode to
intel_sdvo_create_preferred_input_timing()
      drm/i915/lvds: Pass fixed_mode to compute_is_dual_link_lvds()
      drm/i915: Simplify intel_panel_info()
      drm/i915: Nuke dev_priv->drrs.type
      drm/i915: Introduce intel_panel_{fixed,downclock}_mode()
      drm/i915: Introduce intel_panel_get_modes()
      drm/i915: Introduce intel_panel_preferred_fixed_mode()
      drm/i915: Introduce intel_panel_drrs_type()
      drm/i915: Introduce intel_drrs_type_str()
      drm/i915: Eliminate the intel_dp dependency from DRRS
      drm/i915: Stash DRRS state under intel_crtc
      drm/i915: Move DRRS enable/disable higher up
      drm/i915: Enable eDP DRRS on ilk/snb port A
      drm/i915: Implement static DRRS
      drm/i915: Convert fixed_mode/downclock_mode into a list
      drm/i915: Use drm_mode_copy()
      drm/i915: Put the downclock_mode check back into can_enable_drrs()
      drm/i915: Add missing tab to DRRS debugfs
      drm/i915: Fix DRRS frontbuffer_bits handling
      drm/i915: Determine DRRS frontbuffer_bits ahead of time
      drm/i915: Don't cancel/schedule drrs work if the pipe wasn't affected
      drm/i915: Schedule DRRS work from intel_drrs_enable()
      drm/i915: Do DRRS disable/enable during pre/post_plane_update()
      drm/i915: Deal with bigjoiner vs. DRRS
      drm/i915: Reject unsupported TMDS rates on ICL+
      drm/i915: Treat SAGV block time 0 as SAGV disabled
      drm/i915: Rework SAGV block time probing
      drm/i915: Probe whether SAGV works on pre-icl
      drm/i915: Reject excessive SAGV block time
      drm/i915: Rename pre-icl SAGV enable/disable functions
      drm/i915: Fix PSF GV point mask when SAGV is not possible
      drm/i915: Unconfuses QGV vs. PSF point masks
      drm/i915: Rename QGV request/response bits
      drm/i915: Tweak plane ddb allocation tracking
      drm/i915: Split plane data_rate into data_rate+data_rate_y
      drm/i915: Pre-calculate plane relative data rate
      drm/i915: Remove total[] and uv_total[] from ddb allocation
      drm/i915: Nuke intel_bw_calc_min_cdclk()
      drm/i915: Round up when calculating display bandwidth requirements
      drm/i915: Properly write lock bw_state when it changes
      drm/i915: Fix DBUF bandwidth vs. cdclk handling
      drm/i915: Add "maximum pipe read bandwidth" checks
      drm/gma500: Use drm_mode_copy()
      drm/tilcdc: Use drm_mode_copy()
      drm/i915: s/enable/active/ for DRRS
      drm/i915: Remove locks around skl+ scaler programming
      drm/i915: Make ilk+ pfit regiser unlocked
      drm/i915: Split color_commit() into noarm+arm pair
      drm/i915: Split pipe+output CSC programming to noarm+arm pair
      drm/i915: Pass intel_connector to intel_panel_{init,fini}()
      drm/i915: Use DRM_MODE_FMT+DRM_MODE_ARG()
      drm/i915: Extract intel_edp_add_properties()
      drm/i915: Use intel_panel_preferred_fixed_mode() more
      drm/i915: Rename intel_panel_vbt_fixed_mode()
      drm/i915: Extract intel_panel_vbt_sdvo_fixed_mode()
      drm/i915: Extract intel_panel_encoder_fixed_mode()
      drm/i915: Use intel_panel_edid_fixed_mode() for sdvo
      drm/i915: Change SDVO fixed mode handling
      drm/i915: Extract intel_edp_has_drrs()
      drm/i915: Put fixed modes directly onto the panel's fixed_modes list
      drm/i915: Refactor non-EDID fixed mode duplication
      drm/i915: Nuke intel_drrs_init()
      drm/i915: Combine the EDID fixed_mode+downclock_mode lookup into one
      drm/i915: Stop duplicating the EDID fixed/downclock modes
      drm/i915: Allow an arbitrary number of downclock modes
      drm/i915: Allow higher refresh rate alternate fixed modes
      drm/i915: Move intel_drrs_compute_config() into intel_dp.c
      drm/i915: Allow static DRRS on all eDP ports
      drm/i915: Allow static DRRS on LVDS
      drm/i915: Use drm_connector_attach_hdr_output_metadata_property()
      drm/i915: Remove dead members from dev_priv
      drm/i915/bios: Extract struct lvds_lfp_data_ptr_table
      drm/i915/dp: Extract intel_dp_tmds_clock_valid()
      drm/i915/dp: Respect the sink's max TMDS clock when dealing with
DP->HDMI DFPs
      drm/i915/dp: Extract intel_dp_has_audio()
      drm/i915/dp: s/intel_dp_hdmi_ycbcr420/intel_dp_is_ycbcr420/
      drm/i915/dp: Reorder intel_dp_compute_config() a bit
      drm/i915/dp: Pass around intel_connector rather than drm_connector
      drm/i915/dp: Make intel_dp_output_format() usable for "4:2:0 also" mo=
des
      drm/i915/dp: Rework HDMI DFP TMDS clock handling
      drm/i915/dp: Add support for "4:2:0 also" modes for DP
      drm/i915/dp: Duplicate native HDMI TMDS clock limit handling for
DP HDMI DFPs
      drm/i915/dp: Fix DFP rgb->ycbcr conversion matrix
      drm/i915/bios: Use the cached BDB version
      drm/i915/bios: Make copies of VBT data blocks
      drm/i915/bios: Use the copy of the LFP data table always
      drm/i915/bios: Validate LFP data table pointers
      drm/i915/bios: Trust the LFP data pointers
      drm/i915/bios: Validate the panel_name table
      drm: Use drm_mode_init() for on-stack modes
      drm: Use drm_mode_copy()
      drm/i915/fbc: Eliminate possible_framebuffer_bits
      drm/i915/fbc: Streamline frontbuffer busy bits handling
      drm/i915/fbc: Skip nuke when flip is pending
      drm/i915: Remove remaining locks from i9xx plane udpates
      drm/i915/fbc: Remove intel_fbc_global_disable()
      drm/i915/fbc: Introduce intel_fbc_sanitize()
      drm/i915/fbc: Call intel_fbc_activate() directly from frontbuffer flu=
sh
      drm/i915: Program i830 DPLL FP register later
      drm/i915/fbc: Consult hw.crtc instead of uapi.crtc
      drm/i915/fbc: s/false/0/
      drm/i915: Make .get_dplls() return int
      drm/i915: Pass dev_priv to intel_shared_dpll_init()
      drm/i915: Remove pointless dpll_funcs checks
      drm/i915: Adjust .crtc_compute_clock() calling convention
      drm/i915: Move stuff into intel_dpll_crtc_compute_clock()
      drm/i915: Move the dpll_hw_state clearing to
intel_dpll_crtc_compute_clock()
      drm/i915: Clear the dpll_hw_state when disabling a pipe
      drm/i915: Split out dg2_crtc_compute_clock()
      drm/i915: Add crtc .crtc_get_shared_dpll()
      drm/i915: Use drm_mode_init() for on-stack modes
      drm/i915/bios: Reorder panel DTD parsing
      drm/i915/bios: Generate LFP data table pointers if the VBT lacks them
      drm/i915/bios: Get access to the tail end of the LFP data block
      drm/i915/bios: Document the mess around the LFP data tables
      drm/i915/bios: Assume panel_type=3D=3D0 if the VBT has bogus data
      drm/i915/bios: Extract get_panel_type()
      drm/i915/bios: Refactor panel_type code
      drm/i915/bios: Parse the seamless DRRS min refresh rate
      drm/i915: Respect VBT seamless DRRS min refresh rate

Vinay Belgaumkar (2):
      drm/i915/guc/slpc: Use i915_probe_error instead of drm_err
      drm/i915/guc: Apply Wa_16011777198

Vinod Govindapillai (2):
      drm/i915: Handle the DG2 max bw properly
      drm/i915: program wm blocks to at least blocks required per line

Vinod Koul (13):
      drm/msm/dsi: add support for dsc data
      drm/msm/dsi: Pass DSC params to drm_panel
      drm/msm/disp/dpu1: Add support for DSC
      drm/msm/disp/dpu1: Add support for DSC in pingpong block
      drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
      drm/msm/disp/dpu1: Add DSC support in hw_ctl
      drm/msm/disp/dpu1: Add support for DSC in encoder
      drm/msm: Add missing num_dspp field documentation
      drm/msm/disp/dpu1: Add support for DSC in topology
      drm/msm/disp/dpu1: Add DSC support in RM
      drm/msm/dsi: add mode valid callback for dsi_mgr
      drm/msm: Update generated headers
      drm/msm/dsi: Add support for DSC configuration

Vinod Polimera (5):
      drm/msm/disp/dpu1: add inline function to validate format support
      drm/msm/disp/dpu1: add inline rotation support for sc7280
      drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use after
memory free during pm runtime resume
      drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp
table during probe
      drm/msm/disp/dpu1: avoid clearing hw interrupts if hw_intr is
null during drm uninit

Vivek Kasireddy (1):
      drm/i915/gem: Don't evict unmappable VMAs when pinning with
PIN_MAPPABLE (v2)

Wan Jiabing (3):
      drm/omap: fix NULL but dereferenced coccicheck error
      i915/gvt: Fix NULL pointer dereference in init_mmio_block_handlers
      drm/amdgpu: Remove duplicated argument in vcn_v4_0

Wayne Lin (1):
      drm/dp_mst: Lower down debug info level when receive NAK

Wenhui Sheng (1):
      drm/amdgpu: add irq src id for GFX11

Wenjing Liu (4):
      drm/amd/display: add support for handling 128b/132b link
training test request
      drm/amd/display: extract set stream attribute to link_hwss
      drm/amd/display: extract update stream allocation to link_hwss
      drm/amd/display: do not calculate DP2.0 SST payload when link is off

Xiaojian Du (9):
      drm/amdgpu: handle asics with 1 SDMA instance
      drm/amdgpu: skip the new gc doorbell function for some asics
      drm/amdgpu: add pcie port function helpers for SOC21
      drm/amdgpu: add the files of NBIO v7.7 block
      drm/admgpu/discovery: add NBIO v7.7 into the IP discovery list
      drm/amdgpu: add the files of HDP v5.2 block
      drm/amdgpu/discovery: add HDP v5.2.1 into the IP discovery list
      drm/amdgpu/discovery: add PSP v13.0.4 into the IP discovery list
      drm/amdgpu/discovery: add SMU v13.0.4 into the IP discovery list

Xiaomeng Tong (7):
      drm/nouveau/kms/nv50-: atom: fix an incorrect NULL check on list iter=
ator
      gma500: fix an incorrect NULL check on list iterator
      tilcdc: tilcdc_external: fix an incorrect NULL check on list iterator
      drm/nouveau/clk: Fix an incorrect NULL check on list iterator
      drm/gma500: fix a missing break in psb_intel_crtc_mode_set
      stm: ltdc: fix two incorrect NULL checks on list iterator
      drm/gma500: fix a potential repeat execution in psb_driver_load

Xin Ji (1):
      drm/bridge: anx7625: Set downstream sink into normal status

Xinlei Lee (1):
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT81=
86

Yang Guang (1):
      fbcon: replace snprintf in show functions with sysfs_emit

Yang Li (3):
      drm/mediatek: mtk_dsi: Remove unnecessary print function dev_err()
      drm/amdgpu/gfx11: remove unneeded semicolon
      drm/amdkfd: Return true/false (not 1/0) from bool functions

Yang Wang (7):
      drm/ttm: use kvcalloc() instead of kvmalloc_array() in ttm_tt v2
      drm/amdkfd: use kvcalloc() instead of kvmalloc() in kfd_migrate
      drm/amd/pm: enable pmlog support for smu_v13_0_7
      drm/amd/pm: add smu pp_feature_mask callback for smu_v13_0_7
      drm/amd/pm: add smu feature map support for smu_v13_0_7
      drm/amd/pm: add smu feature map support for smu_v13_0_0
      drm/amd/pm: add smu power_limit callback for smu_v13_0_7

Yang Yingliang (3):
      drm/bridge: anx7625: add missing destroy_workqueue() in
anx7625_i2c_probe()
      drm/msm/hdmi: check return value after calling
platform_get_resource_byname()
      drm/rockchip: vop: fix possible null-ptr-deref in vop_bind()

Yiqing Yao (1):
      drm/amdgpu: flush delete wq after wait fence

Yongqiang Niu (2):
      drm/mediatek: Add display support for MT8186
      drm/mediatek: Add lut diff flag for new gamma hardware support

Yongqiang Sun (3):
      drm/amd/amdgpu: Only reserve vram for firmware with vega9 MS_HYPERV h=
ost.
      drm/amd/amdgpu: Fix asm/hypervisor.h build error.
      drm/amd/amdgpu: Not request init data for MS_HYPERV with vega10

YueHaibing (3):
      drm/solomon: Make DRM_SSD130X depends on MMU
      drm/bridge: it6505: Fix build error
      drm/i915/gt: Fix build error without CONFIG_PM

Zack Rusin (17):
      drm/vmwgfx: Cleanup multimon initialization code
      drm/vmwgfx: Print capabilities early during the initialization
      drm/vmwgfx: Fix fencing on SVGAv3
      drm/vmwgfx: Allow querying of the SVGA PCI id from the userspace
      drm/vmwgfx: Initialize drm_mode_fb_cmd2
      drm/vmwgfx: Implement MSI/MSI-X support for IRQs
      drm/vmwgfx: Stop using surface dma commands on most configurations
      drm/vmwgfx: Fix an invalid read
      drm/vmwgfx: Fix mob cursor allocation race
      drm/vmwgfx: validate the screen formats
      drm/vmwgfx: Disable command buffers on svga3 without gbobjects
      drm/ttm: Add common debugfs code for resource managers
      drm/vmwgfx: Add debugfs entries for various ttm resource managers
      drm/amdgpu: Use TTM builtin resource manager debugfs code
      drm/qxl: Use TTM builtin resource manager debugfs code
      drm/radeon: Use TTM builtin resource manager debugfs code
      drm/vmwgfx: Reserve fence slots on buffer objects in cotables

Zhenneng Li (1):
      gpu/drm/radeon: Fix typo in comments

Zhi Wang (6):
      i915/gvt: Separate the MMIO tracking table from GVT-g
      i915/gvt: Save the initial HW state snapshot in i915
      i915/gvt: Use the initial HW state snapshot saved in i915
      drm/i915/gvt: Add missing symbol export.
      drm/i915/gvt: Make intel_gvt_match_device() static
      drm/i915/gvt: Fix the compiling error when
CONFIG_DRM_I915_DEBUG_RUNTIME_PM=3Dn

Zhou Qingyang (1):
      drm/komeda: Fix an undefined behavior bug in komeda_plane_add()

Zhouyi Zhou (1):
      video: fbdev: fbmem: fix pointer reference to null device field

hersen wu (1):
      drm/amd/display: expose skip_detection_link_training to debugfs

kernel test robot (1):
      drm: bridge: dw_hdmi: Audio: fix returnvar.cocci warnings

oushixiong (1):
      drm/amd: Fix spelling typo in comment

pengfuyuan (1):
      gpu/drm/radeon: Fix spelling typo in comments

tiancyin (1):
      drm/amd/vcn: fix an error msg on vcn 3.0

xinhui pan (1):
      drm/amdgpu: Fix one use-after-free of VM

 .../allwinner,sun4i-a10-display-engine.yaml        |      1 +
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml |      2 +
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml    |      2 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml      |    133 +-
 .../bindings/display/bridge/chipone,icn6211.yaml   |     18 +-
 .../bindings/display/bridge/fsl,ldb.yaml           |     92 +
 .../bindings/display/bridge/ite,it66121.yaml       |      3 +
 .../bindings/display/bridge/lontium,lt9211.yaml    |    117 +
 .../bindings/display/bridge/toshiba,tc358767.yaml  |     22 +-
 .../bindings/display/mediatek/mediatek,aal.yaml    |     11 +-
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |      5 +-
 .../bindings/display/mediatek/mediatek,color.yaml  |      7 +-
 .../bindings/display/mediatek/mediatek,dither.yaml |      4 +-
 .../bindings/display/mediatek/mediatek,dpi.yaml    |      1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |      4 +-
 .../bindings/display/mediatek/mediatek,mutex.yaml  |     25 +-
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |      4 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |      8 +-
 .../display/mediatek/mediatek,postmask.yaml        |      4 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |      7 +-
 .../bindings/display/msm/dpu-qcm2290.yaml          |      4 +
 .../bindings/display/msm/dpu-sc7180.yaml           |      4 +
 .../bindings/display/msm/dpu-sc7280.yaml           |      4 +
 .../bindings/display/msm/dpu-sdm845.yaml           |      4 +
 .../display/panel/leadtek,ltk035c5444t.yaml        |     59 +
 .../bindings/display/panel/panel-simple.yaml       |      4 +
 .../display/rockchip/rockchip,dw-hdmi.yaml         |     46 +-
 .../bindings/display/rockchip/rockchip-vop2.yaml   |    146 +
 .../bindings/display/sitronix,st7735r.yaml         |      6 +-
 .../bindings/display/solomon,ssd1307fb.yaml        |     95 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |      2 +
 Documentation/driver-api/vfio-mediated-device.rst  |     27 +-
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |     13 +
 Documentation/gpu/drm-kms-helpers.rst              |     43 +-
 Documentation/gpu/drm-mm.rst                       |      9 +
 Documentation/gpu/drm-uapi.rst                     |      4 +-
 Documentation/gpu/drm-usage-stats.rst              |    112 +
 Documentation/gpu/i915.rst                         |     42 +-
 Documentation/gpu/index.rst                        |      1 +
 Documentation/gpu/introduction.rst                 |     60 +
 Documentation/gpu/todo.rst                         |     14 +
 MAINTAINERS                                        |     18 +-
 arch/x86/Kconfig                                   |      6 +
 arch/x86/boot/video-vesa.c                         |      4 +-
 arch/x86/kernel/early-quirks.c                     |      2 +
 drivers/dma-buf/dma-buf.c                          |     26 +-
 drivers/dma-buf/dma-resv.c                         |    459 +-
 drivers/dma-buf/st-dma-resv.c                      |    157 +-
 drivers/dma-buf/sync_file.c                        |     21 +-
 drivers/firmware/Kconfig                           |      6 +-
 drivers/gpu/drm/Kconfig                            |     41 +-
 drivers/gpu/drm/Makefile                           |     29 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |     37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |     14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |    625 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    116 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    377 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |      1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     81 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |      5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |     74 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_df.h             |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    420 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |      4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |     14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |      7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |     49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |     66 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_imu.h            |     51 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |     15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |     18 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |     12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |     20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.c          |     91 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.h          |     46 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   1227 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    252 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes_ctx.h        |    121 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |     17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |     31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    672 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     56 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |    304 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.h         |     29 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    147 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |      5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |     97 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    193 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     22 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |     45 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |     26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |      2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    259 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     74 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   1209 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     52 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |     11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    981 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    359 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |     89 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     99 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.h            |      2 +-
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |     98 +
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.h            |     30 +
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |      3 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |     21 -
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |     12 +-
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx11.h      |    988 +
 drivers/gpu/drm/amd/amdgpu/df_v1_7.c               |      2 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |      2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    453 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   6440 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.h             |     29 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |     62 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     80 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |     48 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |     55 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |     14 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |      2 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |      2 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |    511 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.h           |     29 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     26 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    973 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |     45 +
 .../r600_blit_shaders.h =3D> amd/amdgpu/hdp_v5_2.h}  |     27 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |    142 +
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.h              |     31 +
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |      7 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    745 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.h               |     28 +
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    367 +
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |     94 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.h             |      7 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    609 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h             |     29 +
 drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.c            |    121 +
 drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.h            |     31 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    630 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   1182 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.h             |     29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |      4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |      4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    661 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.h            |     28 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |    571 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.h          |     28 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |      9 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    368 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     32 +
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    240 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.h             |     33 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     15 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     30 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    114 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |     12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     26 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     34 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    179 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    290 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   1689 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h  |   5664 +
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |      9 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c           |      2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0_6.c         |      2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c           |      2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.c         |     41 +
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.h         |     30 +
 drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     15 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |      8 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    721 +
 drivers/gpu/drm/amd/amdgpu/soc21.h                 |     30 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |    106 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |      6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |      6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.c           |     86 +
 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.h           |     44 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     15 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     95 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.h              |      6 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     96 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   1874 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h              |     29 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |      7 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |     19 +-
 drivers/gpu/drm/amd/amdkfd/Makefile                |      3 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     34 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     88 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     68 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    300 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |      5 +
 .../drm/amd/amdkfd/kfd_device_queue_manager_v11.c  |     81 +
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |     56 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    174 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.h            |      3 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |    384 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     84 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |     11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     15 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |     10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    508 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     42 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |     21 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    103 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |      1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |     93 +-
 drivers/gpu/drm/amd/amdkfd/soc15_int.h             |      3 +-
 drivers/gpu/drm/amd/display/Kconfig                |      1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    101 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |      8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     43 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |      2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |      4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |      6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |      6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |      3 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     13 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |      2 -
 .../drm/amd/display/dc/bios/bios_parser_common.c   |      3 +
 .../gpu/drm/amd/display/dc/bios/command_table.c    |      3 +-
 .../amd/display/dc/bios/command_table_helper2.c    |      3 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |      3 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     17 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |      3 +
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |      2 +
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |      3 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |     26 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    114 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |     54 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |      2 -
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    220 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |      6 -
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    222 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |      2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |      2 -
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    114 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     12 -
 drivers/gpu/drm/amd/display/dc/dc.h                |     59 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |     14 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     19 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |     14 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |      3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |      2 -
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     19 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     12 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |     10 -
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |     21 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |      2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |     27 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |      2 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |     56 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |     16 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |      1 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |      8 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |     13 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |      1 -
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |      2 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |      4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |      6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |      5 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |      2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |      6 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |      6 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |     26 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |      6 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |      5 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |     24 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |      2 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    395 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |     13 +-
 drivers/gpu/drm/amd/display/dc/dcn315/Makefile     |     26 -
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |    239 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.h    |      3 +
 drivers/gpu/drm/amd/display/dc/dcn316/Makefile     |     26 -
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    238 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.h    |      3 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |      2 -
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |      2 +
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |     19 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |      2 -
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |    784 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |     44 +
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h   |      2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |      4 +-
 drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h    |      2 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |      3 +-
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   |      2 -
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.h   |      2 -
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.c |      2 -
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.h |      2 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      4 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      4 -
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     17 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |      3 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |      2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |      1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |      1 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |      2 +
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |      9 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |      3 +-
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |      3 -
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.h   |      3 -
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |      5 -
 .../gpu/drm/amd/display/dc/link/link_dp_trace.c    |     20 +
 .../gpu/drm/amd/display/dc/link/link_dp_trace.h    |      5 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |     52 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.h    |      1 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.c   |     28 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |     27 +
 .../drm/amd/display/dc/link/link_hwss_hpo_frl.c    |     19 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |      2 +-
 .../drm/amd/display/dc/virtual/virtual_link_hwss.c |      5 +
 .../drm/amd/display/dc/virtual/virtual_link_hwss.h |      1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |      1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |     84 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |      1 +
 .../drm/amd/display/include/ddc_service_types.h    |      2 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |      2 +-
 .../gpu/drm/amd/display/include/grph_object_id.h   |      1 +
 .../drm/amd/display/include/link_service_types.h   |      6 +
 .../drm/amd/display/modules/freesync/freesync.c    |     76 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |     38 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |     12 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |      6 +-
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |     12 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |      2 +-
 .../drm/amd/display/modules/power/power_helpers.c  |     38 +
 .../drm/amd/display/modules/power/power_helpers.h  |      1 +
 drivers/gpu/drm/amd/include/amd_shared.h           |     71 +-
 .../include/asic_reg/athub/athub_3_0_0_offset.h    |    259 +
 .../include/asic_reg/athub/athub_3_0_0_sh_mask.h   |   1246 +
 .../amd/include/asic_reg/gc/gc_11_0_0_default.h    |   6114 +
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |  11670 ++
 .../amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h    |  41635 +++++
 .../amd/include/asic_reg/hdp/hdp_5_2_1_offset.h    |    217 +
 .../amd/include/asic_reg/hdp/hdp_5_2_1_sh_mask.h   |    684 +
 .../amd/include/asic_reg/hdp/hdp_6_0_0_offset.h    |    209 +
 .../amd/include/asic_reg/hdp/hdp_6_0_0_sh_mask.h   |    646 +
 .../include/asic_reg/lsdma/lsdma_6_0_0_offset.h    |    391 +
 .../include/asic_reg/lsdma/lsdma_6_0_0_sh_mask.h   |   1439 +
 .../include/asic_reg/mmhub/mmhub_3_0_0_offset.h    |   1529 +
 .../include/asic_reg/mmhub/mmhub_3_0_0_sh_mask.h   |   7478 +
 .../include/asic_reg/mmhub/mmhub_3_0_2_offset.h    |   1425 +
 .../include/asic_reg/mmhub/mmhub_3_0_2_sh_mask.h   |   7228 +
 .../drm/amd/include/asic_reg/mp/mp_13_0_0_offset.h |    461 +
 .../amd/include/asic_reg/mp/mp_13_0_0_sh_mask.h    |    682 +
 .../drm/amd/include/asic_reg/mp/mp_13_0_2_offset.h |     48 +
 .../amd/include/asic_reg/mp/mp_13_0_2_sh_mask.h    |     72 +
 .../amd/include/asic_reg/nbio/nbio_4_3_0_offset.h  |  17379 ++
 .../amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h |  82049 ++++++++++
 .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |  29654 ++++
 .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h | 154403 ++++++++++++++=
++++
 .../amd/include/asic_reg/oss/osssys_6_0_0_offset.h |    263 +
 .../include/asic_reg/oss/osssys_6_0_0_sh_mask.h    |    969 +
 .../include/asic_reg/smuio/smuio_13_0_6_offset.h   |    517 +
 .../include/asic_reg/smuio/smuio_13_0_6_sh_mask.h  |   1178 +
 .../drm/amd/include/asic_reg/vcn/vcn_2_5_offset.h  |     13 +
 .../drm/amd/include/asic_reg/vcn/vcn_2_5_sh_mask.h |     24 +
 .../amd/include/asic_reg/vcn/vcn_4_0_0_offset.h    |   1610 +
 .../amd/include/asic_reg/vcn/vcn_4_0_0_sh_mask.h   |   8055 +
 drivers/gpu/drm/amd/include/atombios.h             |      2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |    204 +-
 drivers/gpu/drm/amd/include/discovery.h            |    116 +-
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_11_0_0.h   |     77 +
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_2_0.h  |      4 +
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_4_0.h  |     41 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |      1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |      1 +
 .../gpu/drm/amd/{amdgpu =3D> include}/mes_api_def.h  |    167 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    579 +
 drivers/gpu/drm/amd/include/soc15_hw_ip.h          |      1 +
 drivers/gpu/drm/amd/include/soc15_ih_clientid.h    |     27 +
 drivers/gpu/drm/amd/include/soc21_enum.h           |  22477 +++
 drivers/gpu/drm/amd/include/v11_structs.h          |   1189 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |      2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    237 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |      2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h   |    203 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |     14 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |      8 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |     17 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |    147 +
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |      2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    136 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     20 +-
 .../inc/pmfw_if/smu11_driver_if_sienna_cichlid.h   |     70 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   1544 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |    267 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |   1562 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |    141 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_pmfw.h    |    137 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_ppsmc.h   |    138 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h   |    134 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     28 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     58 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |    200 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    209 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     60 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |      3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     16 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h |      8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    697 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1648 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h   |     28 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   1044 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h   |     28 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   1597 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h   |     28 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |     62 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     32 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |      2 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |      1 +
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |     23 +-
 .../drm/arm/display/komeda/komeda_wb_connector.c   |      4 +-
 drivers/gpu/drm/arm/malidp_crtc.c                  |      5 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |      4 +-
 drivers/gpu/drm/arm/malidp_planes.c                |     16 +-
 drivers/gpu/drm/ast/Makefile                       |      2 +-
 drivers/gpu/drm/ast/ast_dp.c                       |    282 +
 drivers/gpu/drm/ast/ast_drv.c                      |      7 +-
 drivers/gpu/drm/ast/ast_drv.h                      |    116 +
 drivers/gpu/drm/ast/ast_main.c                     |      9 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    172 +-
 drivers/gpu/drm/ast/ast_post.c                     |      4 +-
 drivers/gpu/drm/bridge/Kconfig                     |     39 +-
 drivers/gpu/drm/bridge/Makefile                    |      2 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |     27 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |    116 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |     26 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |     10 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |      2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |      2 +-
 .../gpu/drm/bridge/analogix/analogix-i2c-dptx.c    |      2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |     38 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |      2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |     66 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |      4 +-
 drivers/gpu/drm/bridge/cadence/Kconfig             |      4 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |      4 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |      2 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |      2 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    596 +-
 drivers/gpu/drm/bridge/display-connector.c         |     15 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   |    342 +
 drivers/gpu/drm/bridge/ite-it6505.c                |     33 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |    629 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    802 +
 drivers/gpu/drm/bridge/lontium-lt9611.c            |     49 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |     30 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |      7 +-
 drivers/gpu/drm/bridge/panel.c                     |      6 +
 drivers/gpu/drm/bridge/parade-ps8622.c             |      7 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |     13 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |     12 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |      1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |    197 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    192 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h          |     16 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |     51 +-
 drivers/gpu/drm/bridge/tc358762.c                  |     10 +-
 drivers/gpu/drm/bridge/tc358764.c                  |    104 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    589 +-
 drivers/gpu/drm/bridge/tc358775.c                  |     13 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |     17 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |     12 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |     12 +-
 drivers/gpu/drm/display/Kconfig                    |     51 +
 drivers/gpu/drm/display/Makefile                   |     16 +
 .../drm_display_helper_mod.c}                      |     10 +-
 drivers/gpu/drm/{dp =3D> display}/drm_dp_aux_bus.c   |      4 +-
 drivers/gpu/drm/{dp =3D> display}/drm_dp_aux_dev.c   |      4 +-
 drivers/gpu/drm/{dp =3D> display}/drm_dp_cec.c       |      2 +-
 .../drm/{dp =3D> display}/drm_dp_dual_mode_helper.c  |      2 +-
 .../drm/{dp/drm_dp.c =3D> display/drm_dp_helper.c}   |     95 +-
 .../drm/{dp =3D> display}/drm_dp_helper_internal.h   |      0
 .../gpu/drm/{dp =3D> display}/drm_dp_mst_topology.c  |      7 +-
 .../{dp =3D> display}/drm_dp_mst_topology_internal.h |      2 +-
 .../drm/{drm_dsc.c =3D> display/drm_dsc_helper.c}    |      5 +-
 .../drm/{drm_hdcp.c =3D> display/drm_hdcp_helper.c}  |      4 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |    199 +
 drivers/gpu/drm/{ =3D> display}/drm_scdc_helper.c    |      3 +-
 drivers/gpu/drm/dp/Makefile                        |      9 -
 drivers/gpu/drm/drm_atomic.c                       |     20 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |     51 +-
 drivers/gpu/drm/drm_blend.c                        |      2 +-
 drivers/gpu/drm/drm_bridge_connector.c             |      4 +-
 drivers/gpu/drm/drm_buddy.c                        |      3 +
 drivers/gpu/drm/drm_color_mgmt.c                   |      2 +-
 drivers/gpu/drm/drm_connector.c                    |     34 -
 drivers/gpu/drm/drm_crtc_helper.c                  |     12 +-
 drivers/gpu/drm/drm_edid.c                         |   1101 +-
 drivers/gpu/drm/drm_fb_helper.c                    |     15 +-
 drivers/gpu/drm/drm_format_helper.c                |    551 +-
 drivers/gpu/drm/drm_gem.c                          |     83 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |     77 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |      2 +-
 drivers/gpu/drm/drm_managed.c                      |     27 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |      6 +-
 drivers/gpu/drm/drm_modes.c                        |     29 +-
 drivers/gpu/drm/drm_plane.c                        |     14 +-
 drivers/gpu/drm/drm_vblank.c                       |      2 +-
 drivers/gpu/drm/drm_writeback.c                    |     73 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |     17 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h              |      5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |     83 +-
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |     54 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |     63 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.h            |      3 +-
 drivers/gpu/drm/exynos/Kconfig                     |      3 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    245 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |     22 +
 drivers/gpu/drm/gma500/cdv_device.c                |     11 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |      6 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c         |      9 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |      8 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |      5 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |      5 +-
 drivers/gpu/drm/gma500/framebuffer.c               |     10 +-
 drivers/gpu/drm/gma500/gem.c                       |    161 +-
 drivers/gpu/drm/gma500/gem.h                       |     13 +-
 drivers/gpu/drm/gma500/gma_display.c               |     53 +-
 drivers/gpu/drm/gma500/gma_display.h               |     10 +-
 drivers/gpu/drm/gma500/gtt.c                       |    295 +-
 drivers/gpu/drm/gma500/gtt.h                       |      8 +-
 drivers/gpu/drm/gma500/intel_bios.c                |      3 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |     25 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |      1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |      1 -
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |     16 +-
 drivers/gpu/drm/gma500/opregion.c                  |      5 +-
 drivers/gpu/drm/gma500/power.c                     |     15 +-
 drivers/gpu/drm/gma500/psb_device.c                |     29 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |     34 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |     90 +-
 drivers/gpu/drm/gma500/psb_intel_display.c         |     39 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |      5 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |      6 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |     94 +-
 drivers/gpu/drm/gma500/psb_irq.h                   |     19 +-
 drivers/gpu/drm/i915/Kconfig                       |     44 +-
 drivers/gpu/drm/i915/Makefile                      |     20 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |     76 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |     39 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |     24 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |     25 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    143 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |      3 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |     45 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |      3 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    828 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |    312 +-
 drivers/gpu/drm/i915/display/intel_bw.h            |     12 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |     96 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |      2 +
 drivers/gpu/drm/i915/display/intel_color.c         |     95 +-
 drivers/gpu/drm/i915/display/intel_color.h         |      3 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |     35 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |      4 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |      8 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |     27 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |     40 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |     44 +-
 drivers/gpu/drm/i915/display/intel_display.c       |    962 +-
 drivers/gpu/drm/i915/display/intel_display.h       |      7 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    302 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   5662 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    163 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   1501 +
 .../gpu/drm/i915/display/intel_display_power_map.h |     14 +
 .../drm/i915/display/intel_display_power_well.c    |   1912 +
 .../drm/i915/display/intel_display_power_well.h    |    173 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |      9 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |     49 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |    131 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |     10 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |     30 +
 drivers/gpu/drm/i915/display/intel_dp.c            |    569 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |      6 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |     54 +-
 .../gpu/drm/i915/display/intel_dp_link_training.h  |      2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |      8 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |      1 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |    240 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |      6 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    410 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |      9 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |      4 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    406 +-
 drivers/gpu/drm/i915/display/intel_drrs.h          |     20 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |      7 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |     24 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |     40 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |     49 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |     70 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |      1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |      2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    113 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |      2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |      4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |      8 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    144 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |      3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |      8 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |      4 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |     57 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |     22 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |    363 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |     33 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |     99 +-
 drivers/gpu/drm/i915/display/intel_pch_display.h   |     10 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |     57 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |      1 +
 drivers/gpu/drm/i915/display/intel_psr.c           |    186 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |      5 +-
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |      2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |     89 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |      8 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |     51 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |      5 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |     12 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |     45 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |     26 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |      4 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |     22 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    266 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |     15 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |      8 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |     10 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |      6 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |     71 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |      6 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |      2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |     15 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |     27 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |      8 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |     46 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |      8 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |      2 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |      1 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |     52 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |      7 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |      4 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    147 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |      4 -
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |      8 +
 drivers/gpu/drm/i915/gem/i915_gem_tiling.h         |      2 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |     54 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |      1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |     26 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |      2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |      6 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |      3 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |     10 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |      7 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |      9 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |     18 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |      5 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |      5 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |      2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |    167 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |     11 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |     12 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |      3 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |     29 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |     15 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |     24 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |     13 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |     51 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |      3 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |     13 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |     13 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |     71 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    696 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |      2 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |     31 +
 drivers/gpu/drm/i915/gt/intel_gsc.c                |    224 +
 drivers/gpu/drm/i915/gt/intel_gsc.h                |     37 +
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    224 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |     41 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |      4 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |     20 +-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h         |      2 +-
 drivers/gpu/drm/i915/gt/intel_gt_gmch.c            |    654 +
 drivers/gpu/drm/i915/gt/intel_gt_gmch.h            |     46 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |     13 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |     21 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |     94 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      |      4 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |     23 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |    122 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h           |     34 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |    602 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h        |     15 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |     18 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |     68 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |     67 +-
 drivers/gpu/drm/i915/gt/intel_hwconfig.h           |     21 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    114 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |     32 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |    385 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |      2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |     13 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |     10 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |     10 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |      2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    139 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |      6 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |     15 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |     61 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |     50 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |     40 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |     21 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |     86 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |     63 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |    259 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |      3 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |     16 +-
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |      2 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |      4 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |     15 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |      2 +-
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |    218 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |     48 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |     19 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    185 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |   1657 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h     |     33 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |      5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |     92 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |    164 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    130 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h         |      7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |      6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |      2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |     59 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    664 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     14 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |     20 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |     32 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |      2 +-
 drivers/gpu/drm/i915/gvt/Makefile                  |     30 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |     89 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |      4 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |     36 +-
 drivers/gpu/drm/i915/gvt/execlist.c                |     12 +-
 drivers/gpu/drm/i915/gvt/firmware.c                |     25 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |     55 +-
 drivers/gpu/drm/i915/gvt/gvt.c                     |    340 -
 drivers/gpu/drm/i915/gvt/gvt.h                     |    128 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   1055 +-
 drivers/gpu/drm/i915/gvt/hypercall.h               |     82 -
 drivers/gpu/drm/i915/gvt/interrupt.c               |     40 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   1097 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |      4 +-
 drivers/gpu/drm/i915/gvt/mmio.h                    |      1 -
 drivers/gpu/drm/i915/gvt/mpt.h                     |    400 -
 drivers/gpu/drm/i915/gvt/opregion.c                |    148 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |      8 +-
 drivers/gpu/drm/i915/gvt/reg.h                     |      9 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |     37 +-
 drivers/gpu/drm/i915/gvt/trace.h                   |      2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |     22 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |      2 +
 drivers/gpu/drm/i915/i915_debugfs.c                |     30 +-
 drivers/gpu/drm/i915/i915_deps.c                   |      2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |     49 +-
 drivers/gpu/drm/i915/i915_driver.h                 |      4 +
 drivers/gpu/drm/i915/i915_drm_client.c             |    159 +
 drivers/gpu/drm/i915/i915_drm_client.h             |     68 +
 drivers/gpu/drm/i915/i915_drv.h                    |    155 +-
 drivers/gpu/drm/i915/i915_file_private.h           |      3 +
 drivers/gpu/drm/i915/i915_gem.c                    |     89 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |    316 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |     43 +-
 drivers/gpu/drm/i915/i915_params.c                 |     10 +-
 drivers/gpu/drm/i915/i915_params.h                 |      1 +
 drivers/gpu/drm/i915/i915_pci.c                    |     69 +-
 drivers/gpu/drm/i915/i915_perf.c                   |      4 +-
 drivers/gpu/drm/i915/i915_perf_types.h             |      2 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |      5 +-
 drivers/gpu/drm/i915/i915_query.c                  |     94 +-
 drivers/gpu/drm/i915/i915_reg.h                    |    184 +-
 drivers/gpu/drm/i915/i915_reg_defs.h               |      2 -
 drivers/gpu/drm/i915/i915_request.c                |      3 +-
 drivers/gpu/drm/i915/i915_suspend.c                |      4 -
 drivers/gpu/drm/i915/i915_sw_fence.c               |      2 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |    310 +-
 drivers/gpu/drm/i915/i915_sysfs.h                  |      3 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |      4 +-
 drivers/gpu/drm/i915/i915_utils.c                  |     11 +
 drivers/gpu/drm/i915/i915_utils.h                  |     37 +-
 drivers/gpu/drm/i915/i915_vma.c                    |    138 +-
 drivers/gpu/drm/i915/i915_vma.h                    |     15 -
 drivers/gpu/drm/i915/i915_vma_resource.c           |      2 +-
 drivers/gpu/drm/i915/i915_vma_resource.h           |      6 +
 drivers/gpu/drm/i915/i915_vma_types.h              |      8 +-
 drivers/gpu/drm/i915/intel_device_info.c           |     42 +-
 drivers/gpu/drm/i915/intel_device_info.h           |     15 +-
 drivers/gpu/drm/i915/intel_dram.c                  |     10 +-
 drivers/gpu/drm/i915/intel_gvt.c                   |    252 +-
 drivers/gpu/drm/i915/intel_gvt.h                   |     32 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   1292 +
 drivers/gpu/drm/i915/intel_memory_region.c         |      4 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |     10 +-
 drivers/gpu/drm/i915/intel_pch.c                   |      3 +-
 drivers/gpu/drm/i915/intel_pcode.c                 |      4 +-
 drivers/gpu/drm/i915/intel_pm.c                    |    545 +-
 drivers/gpu/drm/i915/intel_pm.h                    |      1 +
 drivers/gpu/drm/i915/intel_region_ttm.c            |      7 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |      1 +
 drivers/gpu/drm/i915/intel_step.c                  |      7 +
 drivers/gpu/drm/i915/intel_uncore.c                |    113 +-
 drivers/gpu/drm/i915/intel_uncore.h                |      7 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |      4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |      2 -
 drivers/gpu/drm/i915/selftests/i915_active.c       |      3 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |     18 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |     10 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |     13 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |      4 +
 drivers/gpu/drm/i915/vlv_suspend.c                 |      3 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |      3 +-
 drivers/gpu/drm/imx/imx-tve.c                      |      4 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |      8 +-
 drivers/gpu/drm/ingenic/Kconfig                    |      9 +
 drivers/gpu/drm/ingenic/Makefile                   |      1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |     62 +-
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c          |    103 +
 drivers/gpu/drm/lima/lima_gem.c                    |     17 +-
 drivers/gpu/drm/mediatek/mtk_cec.c                 |      2 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |      2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |     18 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |     34 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |     22 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |     20 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |      4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |     17 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |      4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |     29 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |     31 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |      2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |     13 +-
 drivers/gpu/drm/meson/meson_drv.c                  |      2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |      6 +
 drivers/gpu/drm/mgag200/mgag200_drv.h              |      1 +
 drivers/gpu/drm/mgag200/mgag200_mode.c             |     14 +
 drivers/gpu/drm/msm/Kconfig                        |     54 +-
 drivers/gpu/drm/msm/Makefile                       |     29 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |     21 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |      2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |     18 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |     68 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |      4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |     32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |     12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    592 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |     32 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |     97 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    112 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |     79 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    753 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |     22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    157 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |     95 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |     94 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |     23 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |    215 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |     80 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |    161 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |     12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |     62 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |      2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |     22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |     32 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |     14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |     18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |     25 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |     19 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    279 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |    115 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    245 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |     13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |    260 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    170 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |      2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |     78 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |     13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |     93 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |     78 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |     31 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |      3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |     64 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |      3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |     14 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |     81 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          |    252 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c         |     15 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h         |      4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c          |     15 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h          |      2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |     22 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |     52 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |     21 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |      5 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |    100 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |      3 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    169 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |      2 +
 drivers/gpu/drm/msm/dp/dp_debug.c                  |      2 -
 drivers/gpu/drm/msm/dp/dp_display.c                |    438 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |      7 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    215 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |     22 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |    103 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |     49 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |      3 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |     25 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |     14 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |     25 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |      6 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |      3 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |     80 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    300 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |     47 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |      2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |     10 +-
 drivers/gpu/drm/msm/edp/edp.h                      |     77 -
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |   1373 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |     11 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |      3 +
 drivers/gpu/drm/msm/msm_drv.c                      |    301 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    162 +-
 drivers/gpu/drm/msm/msm_fb.c                       |     20 +-
 drivers/gpu/drm/msm/msm_fence.c                    |      6 +-
 drivers/gpu/drm/msm/msm_fence.h                    |      3 +
 drivers/gpu/drm/msm/msm_gem.c                      |    154 +-
 drivers/gpu/drm/msm/msm_gem.h                      |     53 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |      2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |     61 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |     61 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     51 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |     25 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |     97 +-
 drivers/gpu/drm/msm/msm_kms.h                      |     22 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |    415 +
 drivers/gpu/drm/msm/msm_rd.c                       |      5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |     15 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |      1 -
 drivers/gpu/drm/msm/msm_submitqueue.c              |      2 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |     14 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                  |      3 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |    231 +-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h                 |      1 +
 drivers/gpu/drm/nouveau/Kconfig                    |      4 +-
 drivers/gpu/drm/nouveau/dispnv50/atom.h            |      6 +-
 drivers/gpu/drm/nouveau/dispnv50/base917c.c        |      2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |     27 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |      4 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |     14 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |      2 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |     18 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |      2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |     12 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |      2 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |      6 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |     21 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |      3 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |     17 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |      2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/coregv100.c   |      4 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c   |      2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c   |      4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c     |      2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    |     14 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |      6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |      6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |      6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c  |      3 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c    |      3 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c    |      3 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c    |      3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c    |      2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |      2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |    198 +-
 drivers/gpu/drm/omapdrm/omap_gem.h                 |      3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |      5 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c             |      2 +-
 drivers/gpu/drm/panel/Kconfig                      |     12 +-
 drivers/gpu/drm/panel/Makefile                     |      1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |     30 +-
 drivers/gpu/drm/panel/panel-edp.c                  |      6 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |     31 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |     37 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |    482 +
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |      4 +-
 drivers/gpu/drm/panel/panel-simple.c               |     69 +-
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |      3 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |      4 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |      3 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |      6 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |      3 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |      8 +-
 drivers/gpu/drm/qxl/qxl_kms.c                      |      4 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |      5 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |     45 +-
 drivers/gpu/drm/radeon/Makefile                    |      8 +-
 drivers/gpu/drm/radeon/atombios.h                  |     10 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |      2 +-
 drivers/gpu/drm/radeon/cayman_blit_shaders.c       |    320 -
 drivers/gpu/drm/radeon/cayman_blit_shaders.h       |    294 +-
 drivers/gpu/drm/radeon/cik_blit_shaders.c          |    246 -
 drivers/gpu/drm/radeon/cik_blit_shaders.h          |    219 +-
 drivers/gpu/drm/radeon/evergreen_blit_shaders.c    |    303 -
 drivers/gpu/drm/radeon/evergreen_blit_shaders.h    |    278 +-
 drivers/gpu/drm/radeon/r600_blit_shaders.c         |    719 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |      2 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |      4 +
 drivers/gpu/drm/radeon/radeon_display.c            |      8 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |      2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |      9 +-
 drivers/gpu/drm/radeon/radeon_mn.c                 |      4 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |      4 +-
 drivers/gpu/drm/radeon/radeon_object.c             |     21 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |      2 +-
 drivers/gpu/drm/radeon/radeon_prime.c              |     16 +-
 drivers/gpu/drm/radeon/radeon_sync.c               |      2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |     36 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |     12 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |      2 +-
 drivers/gpu/drm/radeon/si_blit_shaders.c           |    253 -
 drivers/gpu/drm/radeon/si_blit_shaders.h           |    223 +-
 drivers/gpu/drm/radeon/si_dpm.c                    |      4 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |      4 +-
 drivers/gpu/drm/rockchip/Kconfig                   |     18 +-
 drivers/gpu/drm/rockchip/Makefile                  |      4 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |     34 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |     22 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |      4 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |     17 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    108 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |     40 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |     40 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |     96 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |     23 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |      2 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |     24 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |     15 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   2706 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |    477 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |     28 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |      2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    281 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |     11 +
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    |     43 +-
 drivers/gpu/drm/scheduler/sched_main.c             |      5 +-
 drivers/gpu/drm/selftests/test-drm_buddy.c         |     10 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |      4 +-
 drivers/gpu/drm/solomon/Kconfig                    |     20 +-
 drivers/gpu/drm/solomon/Makefile                   |      1 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |     60 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |    178 +
 drivers/gpu/drm/solomon/ssd130x.c                  |    154 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |     18 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |      2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |     22 +-
 drivers/gpu/drm/stm/ltdc.c                         |     16 +-
 drivers/gpu/drm/sun4i/Kconfig                      |      2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |     40 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |      1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |      1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi.h                 |      1 -
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |      6 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c             |      4 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |      8 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |      7 +-
 drivers/gpu/drm/sun4i/sun8i_csc.c                  |      7 +-
 drivers/gpu/drm/sun4i/sun8i_csc.h                  |      1 +
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |      2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |     74 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |     14 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |     15 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |     30 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |      6 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h               |     27 +
 drivers/gpu/drm/tegra/Kconfig                      |      4 +-
 drivers/gpu/drm/tegra/dp.c                         |      2 +-
 drivers/gpu/drm/tegra/dpaux.c                      |      4 +-
 drivers/gpu/drm/tegra/gem.c                        |      1 +
 drivers/gpu/drm/tegra/sor.c                        |      4 +-
 drivers/gpu/drm/tegra/vic.c                        |      5 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |     18 +
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |      4 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |      8 +-
 drivers/gpu/drm/tiny/repaper.c                     |      2 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |      1 -
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |      2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    262 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |     40 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |     34 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |     82 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |     21 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    231 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |     28 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |     19 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |      3 +-
 drivers/gpu/drm/vc4/Kconfig                        |      2 +
 drivers/gpu/drm/vc4/vc4_bo.c                       |      8 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |     14 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |     15 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |     15 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    487 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |     40 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |      2 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |      6 +
 drivers/gpu/drm/vc4/vc4_hvs.c                      |    153 +-
 drivers/gpu/drm/vc4/vc4_irq.c                      |      5 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |     87 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |      7 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |     28 +-
 drivers/gpu/drm/vc4/vc4_trace.h                    |     95 +
 drivers/gpu/drm/vc4/vc4_txp.c                      |     11 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |     13 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |      2 +
 drivers/gpu/drm/virtio/virtgpu_gem.c               |     12 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |      8 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |      4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |     23 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |     13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |      4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |     38 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |     23 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |     12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |     28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |     27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |     81 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    445 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |     29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |     36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |     18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |     17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |     27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |      2 +-
 drivers/gpu/drm/xlnx/Kconfig                       |      3 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |      2 +-
 drivers/gpu/host1x/debug.c                         |     11 +-
 drivers/gpu/host1x/job.c                           |      4 +-
 drivers/gpu/ipu-v3/ipu-dc.c                        |      5 +-
 drivers/gpu/ipu-v3/ipu-image-convert.c             |      9 +-
 drivers/hid/hid-picolcd_fb.c                       |      3 +-
 drivers/infiniband/core/umem_dmabuf.c              |      9 +-
 drivers/iommu/intel/iommu.c                        |      2 +-
 drivers/misc/mei/Kconfig                           |     14 +
 drivers/misc/mei/Makefile                          |      3 +
 drivers/misc/mei/bus-fixup.c                       |     25 +
 drivers/misc/mei/gsc-me.c                          |    259 +
 drivers/misc/mei/hdcp/mei_hdcp.h                   |      2 +-
 drivers/misc/mei/hw-me.c                           |     29 +-
 drivers/misc/mei/hw-me.h                           |      2 +
 drivers/of/platform.c                              |     83 +-
 drivers/s390/cio/vfio_ccw_ops.c                    |      7 +-
 drivers/s390/crypto/vfio_ap_ops.c                  |      9 +-
 drivers/staging/fbtft/fbtft-core.c                 |     21 +-
 drivers/vfio/mdev/Makefile                         |      2 +-
 drivers/vfio/mdev/mdev_core.c                      |     52 +-
 drivers/vfio/mdev/mdev_driver.c                    |     10 -
 drivers/vfio/mdev/mdev_private.h                   |      6 +-
 drivers/vfio/mdev/mdev_sysfs.c                     |     37 +-
 drivers/vfio/mdev/vfio_mdev.c                      |    152 -
 drivers/video/fbdev/Kconfig                        |     14 +-
 drivers/video/fbdev/broadsheetfb.c                 |     27 +-
 drivers/video/fbdev/core/fb_defio.c                |    209 +-
 drivers/video/fbdev/core/fbcon.c                   |    708 +-
 drivers/video/fbdev/core/fbcon.h                   |      8 +-
 drivers/video/fbdev/core/fbmem.c                   |    106 +-
 drivers/video/fbdev/core/fbsysfs.c                 |      2 +
 drivers/video/fbdev/hecubafb.c                     |      4 +-
 drivers/video/fbdev/hyperv_fb.c                    |     10 +-
 drivers/video/fbdev/metronomefb.c                  |     23 +-
 drivers/video/fbdev/offb.c                         |     98 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |     27 +-
 drivers/video/fbdev/smscufx.c                      |     13 +-
 drivers/video/fbdev/ssd1307fb.c                    |      4 +-
 drivers/video/fbdev/udlfb.c                        |     18 +-
 drivers/video/fbdev/xen-fbfront.c                  |     10 +-
 include/drm/bridge/dw_hdmi.h                       |     11 +-
 .../drm/{dp/drm_dp_helper.h =3D> display/drm_dp.h}   |    697 +-
 include/drm/{dp =3D> display}/drm_dp_aux_bus.h       |      0
 .../drm/{dp =3D> display}/drm_dp_dual_mode_helper.h  |      0
 include/drm/display/drm_dp_helper.h                |    722 +
 include/drm/{dp =3D> display}/drm_dp_mst_helper.h    |      2 +-
 include/drm/{ =3D> display}/drm_dsc.h                |      8 +-
 include/drm/display/drm_dsc_helper.h               |     20 +
 include/drm/{ =3D> display}/drm_hdcp.h               |     14 +-
 include/drm/display/drm_hdcp_helper.h              |     22 +
 include/drm/display/drm_hdmi_helper.h              |     27 +
 .../drm/{drm_scdc_helper.h =3D> display/drm_scdc.h}  |     52 +-
 include/drm/display/drm_scdc_helper.h              |     79 +
 include/drm/drm_atomic.h                           |     27 +-
 include/drm/drm_atomic_uapi.h                      |      2 -
 include/drm/drm_connector.h                        |      3 -
 include/drm/drm_edid.h                             |     24 +-
 include/drm/drm_fb_helper.h                        |      3 +-
 include/drm/drm_file.h                             |      2 +-
 include/drm/drm_format_helper.h                    |      5 +-
 include/drm/drm_gem.h                              |      5 -
 include/drm/drm_managed.h                          |      3 +
 include/drm/drm_mipi_dsi.h                         |      2 +
 include/drm/drm_modes.h                            |      2 +
 include/drm/drm_modeset_helper_vtables.h           |      2 +-
 include/drm/drm_panel.h                            |      7 +
 include/drm/drm_plane.h                            |      4 +-
 include/drm/drm_writeback.h                        |     11 +-
 include/drm/gpu_scheduler.h                        |      1 +
 include/drm/i915_drm.h                             |      3 +-
 include/drm/i915_mei_hdcp_interface.h              |      2 +-
 include/drm/i915_pciids.h                          |     35 +-
 include/drm/ttm/ttm_bo_api.h                       |     64 +-
 include/drm/ttm/ttm_bo_driver.h                    |     40 +-
 include/drm/ttm/ttm_device.h                       |     11 -
 include/drm/ttm/ttm_resource.h                     |     77 +
 include/drm/ttm/ttm_tt.h                           |      4 +-
 include/dt-bindings/soc/rockchip,vop2.h            |     14 +
 include/linux/dma-buf.h                            |     26 +-
 include/linux/dma-resv.h                           |    233 +-
 include/linux/efi.h                                |      4 -
 include/linux/fb.h                                 |     19 +-
 include/linux/host1x.h                             |      6 +
 include/linux/mdev.h                               |     82 +-
 include/linux/mei_aux.h                            |     19 +
 include/linux/seqlock.h                            |      8 +-
 include/uapi/drm/amdgpu_drm.h                      |      2 +
 include/uapi/drm/drm_fourcc.h                      |     69 +
 include/uapi/drm/i915_drm.h                        |    353 +-
 include/uapi/drm/msm_drm.h                         |      7 +
 include/uapi/drm/vmwgfx_drm.h                      |      9 +-
 kernel/futex/futex.h                               |      1 +
 samples/vfio-mdev/mbochs.c                         |      9 +-
 samples/vfio-mdev/mdpy.c                           |      9 +-
 samples/vfio-mdev/mtty.c                           |     39 +-
 1302 files changed, 495793 insertions(+), 32019 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
 create mode 100644
Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
 create mode 100644
Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
 create mode 100644 Documentation/gpu/drm-usage-stats.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_imu.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mes_ctx.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/clearstate_gfx11.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c
 rename drivers/gpu/drm/{radeon/r600_blit_shaders.h =3D>
amd/amdgpu/hdp_v5_2.h} (56%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v6_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc21.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc21.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11=
.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/athub/athub_3_0_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/athub/athub_3_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_defau=
lt.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_ma=
sk.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_6_0_0_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_6_0_0_sh_m=
ask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/lsdma/lsdma_6_0_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/lsdma/lsdma_6_0_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_2_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_0_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_0_sh_ma=
sk.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_7_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_0_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_0_0_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_13_0_6_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_13_0_6_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_0_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_0_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/gfx/irqsrcs_gfx_11_=
0_0.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_4_0=
.h
 rename drivers/gpu/drm/amd/{amdgpu =3D> include}/mes_api_def.h (68%)
 create mode 100644 drivers/gpu/drm/amd/include/mes_v11_api_def.h
 create mode 100644 drivers/gpu/drm/amd/include/soc21_enum.h
 create mode 100644 drivers/gpu/drm/amd/include/v11_structs.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_pp=
smc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_pm=
fw.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_pp=
smc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_pp=
smc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h
 create mode 100644 drivers/gpu/drm/ast/ast_dp.c
 create mode 100644 drivers/gpu/drm/bridge/fsl-ldb.c
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9211.c
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
 create mode 100644 drivers/gpu/drm/display/Kconfig
 create mode 100644 drivers/gpu/drm/display/Makefile
 rename drivers/gpu/drm/{dp/drm_dp_helper_mod.c =3D>
display/drm_display_helper_mod.c} (51%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_aux_bus.c (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_aux_dev.c (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_cec.c (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_dual_mode_helper.c (99%)
 rename drivers/gpu/drm/{dp/drm_dp.c =3D> display/drm_dp_helper.c} (98%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_helper_internal.h (100%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_mst_topology.c (99%)
 rename drivers/gpu/drm/{dp =3D> display}/drm_dp_mst_topology_internal.h (9=
4%)
 rename drivers/gpu/drm/{drm_dsc.c =3D> display/drm_dsc_helper.c} (99%)
 rename drivers/gpu/drm/{drm_hdcp.c =3D> display/drm_hdcp_helper.c} (99%)
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_helper.c
 rename drivers/gpu/drm/{ =3D> display}/drm_scdc_helper.c (99%)
 delete mode 100644 drivers/gpu/drm/dp/Makefile
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_map.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_map.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_well.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_power_well.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_regs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gsc.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gsc.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_gmch.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_gmch.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_hwconfig.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c
 delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
 delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
 create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c
 delete mode 100644 drivers/gpu/drm/radeon/cayman_blit_shaders.c
 delete mode 100644 drivers/gpu/drm/radeon/cik_blit_shaders.c
 delete mode 100644 drivers/gpu/drm/radeon/evergreen_blit_shaders.c
 delete mode 100644 drivers/gpu/drm/radeon/r600_blit_shaders.c
 delete mode 100644 drivers/gpu/drm/radeon/si_blit_shaders.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c
 create mode 100644 drivers/misc/mei/gsc-me.c
 delete mode 100644 drivers/vfio/mdev/vfio_mdev.c
 rename include/drm/{dp/drm_dp_helper.h =3D> display/drm_dp.h} (74%)
 rename include/drm/{dp =3D> display}/drm_dp_aux_bus.h (100%)
 rename include/drm/{dp =3D> display}/drm_dp_dual_mode_helper.h (100%)
 create mode 100644 include/drm/display/drm_dp_helper.h
 rename include/drm/{dp =3D> display}/drm_dp_mst_helper.h (99%)
 rename include/drm/{ =3D> display}/drm_dsc.h (97%)
 create mode 100644 include/drm/display/drm_dsc_helper.h
 rename include/drm/{ =3D> display}/drm_hdcp.h (95%)
 create mode 100644 include/drm/display/drm_hdcp_helper.h
 create mode 100644 include/drm/display/drm_hdmi_helper.h
 rename include/drm/{drm_scdc_helper.h =3D> display/drm_scdc.h} (65%)
 create mode 100644 include/drm/display/drm_scdc_helper.h
 create mode 100644 include/dt-bindings/soc/rockchip,vop2.h
 create mode 100644 include/linux/mei_aux.h
