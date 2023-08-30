Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7578D17F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 03:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8100110E32B;
	Wed, 30 Aug 2023 01:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7410E32B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 01:03:18 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2bccda76fb1so76969891fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 18:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693357396; x=1693962196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KJRT3akcrTlvu7+6TpquYc8Pl3cylY4N2iRtbINuG68=;
 b=GbwP243oqIy9nD1xl/NY+3VxhU49qXZOTKOOccBIIjcJAy1sP9EDrfYGDV+x6esn5s
 NgKrvW4ONwFNmqcDA9NJCMBFCk+qWHEpMnYmDTd1mRKslnfDxHqWFpUHbd2yOkY4U4bW
 2vHkbC5SP2MJAlMQE5fJt5kqxha8jWkOEOdPAUWrUMJxUnX45x0MY4H9B/I74+g1wE9n
 g8FCcLb6NdVy1ZqJsqG4kYywjnl65vOsSegHzqIWVuoIBvwaj7PaO5Ea5poEVxgX7I8H
 cVllvvugHBZ0QsW8aiMfqoyDEXJCs63t5Wj6fzITUN9IAWNxu7TP+c4aJea9dJjDhDye
 sugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693357396; x=1693962196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KJRT3akcrTlvu7+6TpquYc8Pl3cylY4N2iRtbINuG68=;
 b=c1xmXYqISI+2MZIaS6ZemJOzHr9x69CTl3zuLpbHIBGA58ynqC6f6tLXVwZFBOWesC
 xF2jFj1btSzy6EYPPpMbrUL94kcDKdez7XBe8WEcVYjrbAOSd9yvWRxaXgWNFtppfLaD
 U+ZBh9Lo648gpIry0IWF4cMyxpfmClPPLP+2VkKE/L94p9kfjRwaHpwzLkK90jOI8u82
 ATJSUoKBKAYK0gbsTHGads+6/grUR1ltVfLbIdSzyiwuQwzQb2eXQhRhvrU8Pz0l4X/d
 ZNFydFX8enXz7eYNyGTdCq3MnsQgI0Bqh+ETd38RGgQsHGUnlpC5rtEBybInJKpg6Lp1
 BDOw==
X-Gm-Message-State: AOJu0Yzibdr27dtMC/4Uqw39xIwNPKTnS/w9wGnVFme2o2j6iFarmL9Y
 QRz3uIvdQeZhMd4stGgaKNyPkYj0kQaKlzBREZw=
X-Google-Smtp-Source: AGHT+IH5zyh76UczIbTS791t4suwRCzKPc2e2xHaIM0HmD9/Ap2ePNUkCFcppLjxhN7IuRBUFzJDYmIw7mgTTc5u1DI=
X-Received: by 2002:a05:651c:10d4:b0:2bd:1fee:aacb with SMTP id
 l20-20020a05651c10d400b002bd1feeaacbmr607093ljn.14.1693357395670; Tue, 29 Aug
 2023 18:03:15 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Aug 2023 11:03:03 +1000
Message-ID: <CAPM=9tw+0kKGEnCnCTmv8soNA_Kh13DoGs-G-TF7d_kOXWzaGw@mail.gmail.com>
Subject: [git pull] drm for 6.6-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

This is the main drm pull request for 6.6.

I did a test merge against your tree yesterday and I didn't have any
major conflicts, let me know if you have any you need solved, but it
seems pretty clean.

Little bit of i2c and media intersection, but things should all be
acked properly.

Highlights:
The drm core grew a new generic gpu virtual address manager, and new
execution locking helpers.
These are used by nouveau now to provide uAPI support for the
userspace Vulkan driver.
AMD had a bunch of new IP core support, loads of refactoring around
fbdev, but mostly just the
usual amount of stuff across the board.

There will be a second PR for some CI support files that we'd like to
include in the tree, but you might have opinions on that, so I've kept
it out of this PR.

Let me know if there are any problems,

Dave.

drm-next-2023-08-30:
drm for 6.6-rc1

core:
- fix gfp flags in drmm_kmalloc

gpuva:
- add new generic GPU VA manager (for nouveau initially)

syncobj:
- add new DRM_IOCTL_SYNCOBJ_EVENTFD ioctl

dma-buf:
- acquire resv lock for mmap() in exporters
- support dma-buf self import automatically
- docs fixes

backlight:
- fix fbdev interactions

atomic:
- improve logging

prime:
- remove struct gem_prim_mmap plus driver updates

gem:
- drm_exec: add locking over multiple GEM objects
- fix lockdep checking

fbdev:
- make fbdev userspace interfaces optional
- use linux device instead of fbdev device
- use deferred i/o helper macros in various drivers
- Make FB core selectable without drivers
- Remove obsolete flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT
- Add helper macros and Kconfig tokens for DMA-allocated framebuffer

ttm:
- support init_on_free
- swapout fixes

panel:
- panel-edp: Support AUO B116XAB01.4
- Support Visionox R66451 plus DT bindings
- ld9040: Backlight support, magic improved,
          Kconfig fix
- Convert to of_device_get_match_data()
- Fix Kconfig dependencies
- simple: Set bpc value to fix warning; Set connector type for AUO T215HVN0=
1;
  Support Innolux G156HCE-L01 plus DT bindings
- ili9881: Support TDO TL050HDV35 LCD panel plus DT bindings
- startek: Support KD070FHFID015 MIPI-DSI panel plus DT bindings
- sitronix-st7789v: Support Inanbo T28CP45TN89 plus DT bindings;
         Support EDT ET028013DMA plus DT bindings; Various cleanups
- edp: Add timings for N140HCA-EAC
- Allow panels and touchscreens to power sequence together
- Fix Innolux G156HCE-L01 LVDS clock

bridge:
- debugfs for chains support
- dw-hdmi: Improve support for YUV420 bus format
           CEC suspend/resume, update EDID on HDMI detect
- dw-mipi-dsi: Fix enable/disable of DSI controller
- lt9611uxc: Use MODULE_FIRMWARE()
- ps8640: Remove broken EDID code
- samsung-dsim: Fix command transfer
- tc358764: Handle HS/VS polarity; Use BIT() macro; Various cleanups
- adv7511: Fix low refresh rate
- anx7625: Switch to macros instead of hardcoded values
           locking fixes
- tc358767: fix hardware delays
- sitronix-st7789v: Support panel orientation; Support rotation
                    property; Add support for Jasonic
                    JT240MHQS-HWT-EK-E3 plus DT bindings

amdgpu:
- SDMA 6.1.0 support
- HDP 6.1 support
- SMUIO 14.0 support
- PSP 14.0 support
- IH 6.1 support
- Lots of checkpatch cleanups
- GFX 9.4.3 updates
- Add USB PD and IFWI flashing documentation
- GPUVM updates
- RAS fixes
- DRR fixes
- FAMS fixes
- Virtual display fixes
- Soft IH fixes
- SMU13 fixes
- Rework PSP firmware loading for other IPs
- Kernel doc fixes
- DCN 3.0.1 fixes
- LTTPR fixes
- DP MST fixes
- DCN 3.1.6 fixes
- SMU 13.x fixes
- PSP 13.x fixes
- SubVP fixes
- GC 9.4.3 fixes
- Display bandwidth calculation fixes
- VCN4 secure submission fixes
- Allow building DC on RISC-V
- Add visible FB info to bo_print_info
- HBR3 fixes
- GFX9 MCBP fix
- GMC10 vmhub index fix
- GMC11 vmhub index fix
- Create a new doorbell manager
- SR-IOV fixes
- initial freesync panel replay support
- revert zpos properly until igt regression is fixeed
- use TTM to manage doorbell BAR
- Expose both current and average power via hwmon if supported

amdkfd:
- Cleanup CRIU dma-buf handling
- Use KIQ to unmap HIQ
- GFX 9.4.3 debugger updates
- GFX 9.4.2 debugger fixes
- Enable cooperative groups fof gfx11
- SVM fixes
- Convert older APUs to use dGPU path like newer APUs
- Drop IOMMUv2 path as it is no longer used
- TBA fix for aldebaran

i915:
- ICL+ DSI modeset sequence
- HDCP improvements
- MTL display fixes and cleanups
- HSW/BDW PSR1 restored
- Init DDI ports in VBT order
- General display refactors
- Start using plane scale factor for relative data rate
- Use shmem for dpt objects
- Expose RPS thresholds in sysfs
- Apply GuC SLPC min frequency softlimit correctly
- Extend Wa_14015795083 to TGL, RKL, DG1 and ADL
- Fix a VMA UAF for multi-gt platform
- Do not use stolen on MTL due to HW bug
- Check HuC and GuC version compatibility on MTL
- avoid infinite GPU waits due to premature release
  of request memory
- Fixes and updates for GSC memory allocation
- Display SDVO fixes
- Take stolen handling out of FBC code
- Make i915_coherent_map_type GT-centric
- Simplify shmem_create_from_object map_type

msm:
- SM6125 MDSS support
- DPU: SM6125 DPU support
- DSI: runtime PM support, burst mode support
- DSI PHY: SM6125 support in 14nm DSI PHY driver
- GPU: prepare for a7xx
- fix a690 firmware
- disable relocs on a6xx and newer

radeon:
- Lots of checkpatch cleanups

ast:
- improve device-model detection
- Represent BMV as virtual connector
- Report DP connection status

nouveau:
- add new exec/bind interface to support Vulkan
- document some getparam ioctls
- improve VRAM detection
- various fixes/cleanups
- workraound DPCD issues

ivpu:
- MMU updates
- debugfs support
- Support vpu4

virtio:
- add sync object support

atmel-hlcdc:
- Support inverted pixclock polarity

etnaviv:
- runtime PM cleanups
- hang handling fixes

exynos:
- use fbdev DMA helpers
- fix possible NULL ptr dereference

komeda:
- always attach encoder

omapdrm:
- use fbdev DMA helpers
ingenic:
- kconfig regmap fixes

loongson:
- support display controller

mediatek:
- Small mtk-dpi cleanups
- DisplayPort: support eDP and aux-bus
- Fix coverity issues
- Fix potential memory leak if vmap() fail

mgag200:
- minor fixes

mxsfb:
- support disabling overlay planes

panfrost:
- fix sync in IRQ handling

ssd130x:
- Support per-controller default resolution plus DT bindings
- Reduce memory-allocation overhead
- Improve intermediate buffer size computation
- Fix allocation of temporary buffers
- Fix pitch computation
- Fix shadow plane allocation

tegra:
- use fbdev DMA helpers
- Convert to devm_platform_ioremap_resource()
- support bridge/connector
- enable PM

tidss:
- Support TI AM625 plus DT bindings
- Implement new connector model plus driver updates

vkms:
- improve write back support
- docs fixes
- support gamma LUT

zynqmp-dpsub:
- misc fixes
The following changes since commit 706a741595047797872e669b3101429ab8d378ef=
:

  Linux 6.5-rc7 (2023-08-20 15:02:52 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-08-30

for you to fetch changes up to 3698a75f5a98d0a6599e2878ab25d30a82dd836a:

  Merge tag 'drm-intel-next-fixes-2023-08-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-08-25
12:55:55 +1000)

----------------------------------------------------------------
drm for 6.6-rc1

core:
- fix gfp flags in drmm_kmalloc

gpuva:
- add new generic GPU VA manager (for nouveau initially)

syncobj:
- add new DRM_IOCTL_SYNCOBJ_EVENTFD ioctl

dma-buf:
- acquire resv lock for mmap() in exporters
- support dma-buf self import automatically
- docs fixes

backlight:
- fix fbdev interactions

atomic:
- improve logging

prime:
- remove struct gem_prim_mmap plus driver updates

gem:
- drm_exec: add locking over multiple GEM objects
- fix lockdep checking

fbdev:
- make fbdev userspace interfaces optional
- use linux device instead of fbdev device
- use deferred i/o helper macros in various drivers
- Make FB core selectable without drivers
- Remove obsolete flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT
- Add helper macros and Kconfig tokens for DMA-allocated framebuffer

ttm:
- support init_on_free
- swapout fixes

panel:
- panel-edp: Support AUO B116XAB01.4
- Support Visionox R66451 plus DT bindings
- ld9040: Backlight support, magic improved,
          Kconfig fix
- Convert to of_device_get_match_data()
- Fix Kconfig dependencies
- simple: Set bpc value to fix warning; Set connector type for AUO T215HVN0=
1;
  Support Innolux G156HCE-L01 plus DT bindings
- ili9881: Support TDO TL050HDV35 LCD panel plus DT bindings
- startek: Support KD070FHFID015 MIPI-DSI panel plus DT bindings
- sitronix-st7789v: Support Inanbo T28CP45TN89 plus DT bindings;
         Support EDT ET028013DMA plus DT bindings; Various cleanups
- edp: Add timings for N140HCA-EAC
- Allow panels and touchscreens to power sequence together
- Fix Innolux G156HCE-L01 LVDS clock

bridge:
- debugfs for chains support
- dw-hdmi: Improve support for YUV420 bus format
           CEC suspend/resume, update EDID on HDMI detect
- dw-mipi-dsi: Fix enable/disable of DSI controller
- lt9611uxc: Use MODULE_FIRMWARE()
- ps8640: Remove broken EDID code
- samsung-dsim: Fix command transfer
- tc358764: Handle HS/VS polarity; Use BIT() macro; Various cleanups
- adv7511: Fix low refresh rate
- anx7625: Switch to macros instead of hardcoded values
           locking fixes
- tc358767: fix hardware delays
- sitronix-st7789v: Support panel orientation; Support rotation
                    property; Add support for Jasonic
                    JT240MHQS-HWT-EK-E3 plus DT bindings

amdgpu:
- SDMA 6.1.0 support
- HDP 6.1 support
- SMUIO 14.0 support
- PSP 14.0 support
- IH 6.1 support
- Lots of checkpatch cleanups
- GFX 9.4.3 updates
- Add USB PD and IFWI flashing documentation
- GPUVM updates
- RAS fixes
- DRR fixes
- FAMS fixes
- Virtual display fixes
- Soft IH fixes
- SMU13 fixes
- Rework PSP firmware loading for other IPs
- Kernel doc fixes
- DCN 3.0.1 fixes
- LTTPR fixes
- DP MST fixes
- DCN 3.1.6 fixes
- SMU 13.x fixes
- PSP 13.x fixes
- SubVP fixes
- GC 9.4.3 fixes
- Display bandwidth calculation fixes
- VCN4 secure submission fixes
- Allow building DC on RISC-V
- Add visible FB info to bo_print_info
- HBR3 fixes
- GFX9 MCBP fix
- GMC10 vmhub index fix
- GMC11 vmhub index fix
- Create a new doorbell manager
- SR-IOV fixes
- initial freesync panel replay support
- revert zpos properly until igt regression is fixeed
- use TTM to manage doorbell BAR
- Expose both current and average power via hwmon if supported

amdkfd:
- Cleanup CRIU dma-buf handling
- Use KIQ to unmap HIQ
- GFX 9.4.3 debugger updates
- GFX 9.4.2 debugger fixes
- Enable cooperative groups fof gfx11
- SVM fixes
- Convert older APUs to use dGPU path like newer APUs
- Drop IOMMUv2 path as it is no longer used
- TBA fix for aldebaran

i915:
- ICL+ DSI modeset sequence
- HDCP improvements
- MTL display fixes and cleanups
- HSW/BDW PSR1 restored
- Init DDI ports in VBT order
- General display refactors
- Start using plane scale factor for relative data rate
- Use shmem for dpt objects
- Expose RPS thresholds in sysfs
- Apply GuC SLPC min frequency softlimit correctly
- Extend Wa_14015795083 to TGL, RKL, DG1 and ADL
- Fix a VMA UAF for multi-gt platform
- Do not use stolen on MTL due to HW bug
- Check HuC and GuC version compatibility on MTL
- avoid infinite GPU waits due to premature release
  of request memory
- Fixes and updates for GSC memory allocation
- Display SDVO fixes
- Take stolen handling out of FBC code
- Make i915_coherent_map_type GT-centric
- Simplify shmem_create_from_object map_type

msm:
- SM6125 MDSS support
- DPU: SM6125 DPU support
- DSI: runtime PM support, burst mode support
- DSI PHY: SM6125 support in 14nm DSI PHY driver
- GPU: prepare for a7xx
- fix a690 firmware
- disable relocs on a6xx and newer

radeon:
- Lots of checkpatch cleanups

ast:
- improve device-model detection
- Represent BMV as virtual connector
- Report DP connection status

nouveau:
- add new exec/bind interface to support Vulkan
- document some getparam ioctls
- improve VRAM detection
- various fixes/cleanups
- workraound DPCD issues

ivpu:
- MMU updates
- debugfs support
- Support vpu4

virtio:
- add sync object support

atmel-hlcdc:
- Support inverted pixclock polarity

etnaviv:
- runtime PM cleanups
- hang handling fixes

exynos:
- use fbdev DMA helpers
- fix possible NULL ptr dereference

komeda:
- always attach encoder

omapdrm:
- use fbdev DMA helpers
ingenic:
- kconfig regmap fixes

loongson:
- support display controller

mediatek:
- Small mtk-dpi cleanups
- DisplayPort: support eDP and aux-bus
- Fix coverity issues
- Fix potential memory leak if vmap() fail

mgag200:
- minor fixes

mxsfb:
- support disabling overlay planes

panfrost:
- fix sync in IRQ handling

ssd130x:
- Support per-controller default resolution plus DT bindings
- Reduce memory-allocation overhead
- Improve intermediate buffer size computation
- Fix allocation of temporary buffers
- Fix pitch computation
- Fix shadow plane allocation

tegra:
- use fbdev DMA helpers
- Convert to devm_platform_ioremap_resource()
- support bridge/connector
- enable PM

tidss:
- Support TI AM625 plus DT bindings
- Implement new connector model plus driver updates

vkms:
- improve write back support
- docs fixes
- support gamma LUT

zynqmp-dpsub:
- misc fixes

----------------------------------------------------------------
Abhinav Kumar (5):
      drm/msm/dpu: re-introduce dpu core revision to the catalog
      drm/msm/dpu: use dpu core's major version to enable data compress
      drm/msm/dpu: rename all hw_intf structs to have dpu_hw prefix
      drm/msm/dpu: rename enable_compression() to program_intf_cmd_cfg()
      drm/msm/dpu: drop DPU_INTF_DATA_COMPRESS from dpu catalog

Adri=C3=A1n Larumbe (3):
      drm/bridge: dw-hdmi: change YUV420 selection logic at clock setup
      drm/bridge: dw-hdmi: truly enforce 420-only formats when drm
mode demands it
      drm/bridge: dw-hdmi: remove dead code and fix indentation

Alan Liu (2):
      drm/amd/display: Hardcode vco_freq for dcn316
      drm/amd/display: Fix race condition when turning off an output alone

Alan Previn (4):
      drm/i915/gsc: take a wakeref for the proxy-init-completion check
      drm/i915/gsc: Fix intel_gsc_uc_fw_proxy_init_done with directed waker=
efs
      drm/i915/selftest/gsc: Ensure GSC Proxy init completes before selftes=
ts
      drm/i915: Fix TLB-Invalidation seqno store

Alex Deucher (17):
      drm/amdgpu: return an error if query_video_caps is not set
      drm/amdgpu/gfx9: move update_spm_vmid() out of rlc_init()
      drm/amdgpu/gfx10: move update_spm_vmid() out of rlc_init()
      drm/amdgpu/pm: make gfxclock consistent for sienna cichlid
      drm/amdgpu/pm: make mclk consistent for smu 13.0.7
      drm/amdgpu: add UAPI for allocating doorbell memory
      drm/amdgpu: accommodate DOMAIN/PL_DOORBELL
      drm/amdgpu: fix possible UAF in amdgpu_cs_pass1()
      drm/amdgpu/gfx11: only enable CP GFX shadowing on SR-IOV
      drm/amdkfd: ignore crat by default
      drm/amdkfd: disable IOMMUv2 support for KV/CZ
      drm/amdkfd: disable IOMMUv2 support for Raven
      drm/amdkfd: drop IOMMUv2 support
      drm/amdkfd: rename device_queue_manager_init_v10_navi10()
      drm/amdgpu: don't allow userspace to create a doorbell BO
      drm/amdgpu: expand runpm parameter
      Revert "Revert "drm/amdgpu/display: change pipe policy for DCN 2.0""

Alex Sierra (2):
      drm/amdkfd: avoid svm dump when dynamic debug disabled
      drm/amdkfd: avoid unmap dma address when svm_ranges are split

Alexander Stein (2):
      drm/imx/dcss: Use dev_err_probe
      dt-bindings: display: bridge: tc358867: Add interrupt property

Alexandre Mergnat (1):
      dt-bindings: display: panel: add startek kd070fhfid015 support

Alvin Lee (7):
      drm/amd/display: Update SW cursor fallback for subvp high refresh
      drm/amd/display: Add missing triggers for full updates
      drm/amd/display: Don't apply FIFO resync W/A if rdivider =3D 0
      drm/amd/display: Implement interface for notify cursor support change
      drm/amd/display: Use max memclk variable when setting max memclk
      drm/amd/display: Enable subvp high refresh up to 175hz
      drm/amd/display: PMFW to wait for DMCUB ack for FPO cases

Amit Pundir (1):
      dt-bindings: display/msm: mdss-common: add memory-region property

Andi Shyti (8):
      drm/i915: Replace i915->gt0 with to_gt(i915)
      drm/i915/gt: Cleanup aux invalidation registers
      drm/i915: Add the gen12_needs_ccs_aux_inv helper
      drm/i915/gt: Rename flags with bit_group_X according to the datasheet
      drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control and in the =
CS
      drm/i915/gt: Support aux invalidation on all engines
      i915/drm/gt: Move the gt defines in the gt directory
      drm/i915: Remove unnecessary include

Andrzej Hajda (2):
      drm/i915/perf: add sentinel to xehp_oa_b_counters
      drm/i915: use direct alias for i915 in requests

Andrzej Kacprowski (1):
      accel/ivpu: Print firmware name and version

AngeloGioacchino Del Regno (17):
      drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add()
      drm/mediatek: mtk_dpi: Simplify with dev_err_probe()
      drm/mediatek: mtk_dpi: Switch to devm_drm_of_get_bridge()
      drm/mediatek: mtk_dpi: Switch to .remove_new() void callback
      drm/mediatek: mtk_dpi: Use devm_platform_ioremap_resource()
      drm/mediatek: mtk_dpi: Compress struct of_device_id entries
      drm/mediatek: dp: Add missing error checks in mtk_dp_parse_capabiliti=
es
      drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
      drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
      drm/mediatek: dp: Use devm variant of drm_bridge_add()
      drm/mediatek: dp: Move AUX_P0 setting to mtk_dp_initialize_aux_settin=
gs()
      drm/mediatek: dp: Enable event interrupt only when bridge attached
      drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabled
      drm/mediatek: dp: Move PHY registration to new function
      drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
      drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
      drm/mediatek: dp: Don't register HPD interrupt handler for eDP case

Anthony Koo (2):
      drm/amd/display: Rearrange dmub_cmd defs order
      drm/amd/display: [FW Promotion] Release 0.0.179.0

Anusha Srivatsa (1):
      drm/i915/adln: s/ADLP/ALDERLAKE_P in ADLN defines

Aradhya Bhatia (5):
      dt-bindings: display: ti,am65x-dss: Add am625 dss compatible
      drm/tidss: Add support for AM625 DSS
      drm/bridge: sii902x: Support format negotiation hooks
      drm/bridge: sii902x: Set input_bus_flags in atomic_check
      drm/tidss: Update encoder/bridge chain connect model

Aric Cyr (5):
      drm/amd/display: Promote DAL to 3.2.242
      drm/amd/display: Promote DAL to 3.2.243
      drm/amd/display: 3.2.244
      drm/amd/display: Promote DC to 2.3.245
      drm/amd/display: Promote DAL to 3.2.247

Arnd Bergmann (7):
      drm/i915/gmch: avoid unused variable warning
      drm/i915: make i915_drm_client_fdinfo() reference conditional again
      drm/amdgpu: avoid integer overflow warning in
amdgpu_device_resize_fb_bar()
      drm/panel: ld9040: add backlight Kconfig dependency
      drm/panel: r66451: select CONFIG_DRM_DISPLAY_DP_HELPER
      HID: i2c-hid: add more DRM dependencies
      drm/amdkfd: fix build failure without CONFIG_DYNAMIC_DEBUG

Arthur Grillo (2):
      drm/vkms: Add support to 1D gamma LUT
      drm/tests: Alloc drm_device on drm_exec tests

Asad Kamal (5):
      drm/amdgpu: Add pcie usage callback to nbio
      drm/amdgpu: Add pci usage to nbio v7.9
      drm/amd/pm: Add vclk and dclk sysnode for GC 9.4.3
      drm/amd/pm: Update pci link width for smu v13.0.6
      drm/amd/pm: Update pci link speed for smu v13.0.6

Atul Raut (1):
      drm/amdkfd: Use memdup_user() rather than duplicating its implementat=
ion

Aurabindo Pillai (6):
      drm/amd/display: export some optc function for reuse
      drm/amd/display: add DCN301 specific logic for OTG programming
      drm/amd/display: remove an unused file
      drm/amd/display: Add some missing register definitions
      drm/amd: Remove freesync video mode amdgpu parameter
      drm/amd/display: enable low power mode for VGA memory

Austin Zheng (2):
      drm/amd/display: Set Stream Update Flags in commit_state_no_check
      drm/amd/display: Use DTBCLK as refclk instead of DPREFCLK

Ben Li (2):
      drm/amdgpu: add ih 6.1 registers
      drm/amdgpu: add ih 6.1 support

Ben Skeggs (10):
      drm/nouveau/nvkm: fini object children in reverse order
      drm/nouveau/nvkm: punt spurious irq messages to debug level
      drm/nouveau/fb/gp102-ga100: switch to simpler vram size detection met=
hod
      drm/nouveau/fb/ga102-: construct vidmem heap via new gp102 paths
      drm/nouveau/fifo: remove left-over references to nvkm_fifo_chan
      drm/nouveau/fifo: return ERR_PTR from nvkm_runl_new()
      drm/nouveau/fifo/ga100-: remove individual runlists rather than
failing oneinit
      drm/nouveau/fifo/ga100-: add per-runlist nonstall intr handling
      drm/nouveau/nvif: fix potential double-free
      drm/nouveau/kms: don't call drm_dp_cec_set_edid() on TMDS

Bhawanpreet Lakha (10):
      drm/amd/display: Add structs for Freesync Panel Replay
      drm/amd/display: Add Functions to enable Freesync Panel Replay
      drm/amd/display: Add Freesync Panel DM code
      drm/amd/display: Read replay data from sink
      drm/amd/display: Change HDCP update sequence for DM
      drm/amd/display: Get replay info from VSDB
      drm/amd/display: Add Replay supported/enabled checks
      drm/amd/display: Update replay for clk_mgr optimizations
      drm/amd/display: Update adaptive sync infopackets for replay
      drm/amd/display: Handle Replay related hpd irq

Bob Zhou (1):
      drm/amdgpu: remove repeat code for mes_add_queue_pkt

Bogdan Togorean (1):
      drm: adv7511: Fix low refresh rate register for ADV7533/5

Candice Li (3):
      drm/amdgpu: Allow the initramfs generator to include psp_13_0_6_ta
      drm/amdgpu: Extend poison mode check to SDMA/VCN/JPEG
      drm/amdgpu: Add I2C EEPROM support on smu v13_0_6

Carlos Eduardo Gallo Filho (1):
      drm/tests: Fix swapped drm_framebuffer tests parameter names

Chaitanya Kumar Borah (2):
      drm/i915/color: Upscale degamma values for MTL
      drm/i915/color: Downscale degamma lut values read from hardware

Charlene Liu (1):
      drm/amd/display: avoid crash and add z8_marks related in dml

Chen-Yu Tsai (3):
      drm/bridge: anx7625: Use common macros for DP power sequencing comman=
ds
      drm/bridge: anx7625: Use common macros for HDCP capabilities
      drm/bridge: anx7625: Drop device lock before drm_helper_hpd_irq_event=
()

Chris Wilson (2):
      drm/i915/gt: Move TLB invalidation to its own file
      drm/i915: Invalidate the TLBs on each GT

Christian K=C3=B6nig (8):
      drm: execution context for GEM buffers v7
      drm: add drm_exec selftests v4
      drm/amdkfd: switch over to using drm_exec v3
      drm/amdgpu: use drm_exec for GEM and CSA handling v2
      drm/amdgpu: use drm_exec for MES testing
      drm/amdgpu: use the new drm_exec object for CS v3
      drm/exec: use unique instead of local label
      drm/exec: add test case for using a drm_exec multiple times

Christophe JAILLET (3):
      accel/ivpu: Use struct_size()
      drm/bridge: tc358767: Use devm_clk_get_enabled() helper
      drm/i915: Fix an error handling path in igt_write_huge()

Colin Ian King (2):
      drm/edid: make read-only const array static
      accel/qaic: remove redundant pointer pexec

Cruise Hung (1):
      drm/amd/display: Add helpers to get DMUB FW boot options

Damian Hobson-Garcia (2):
      drm: rcar-du: Add more formats to DRM_MODE_BLEND_PIXEL_NONE support
      drm:rcar-du: Enable ABGR and XBGR formats

Dan Carpenter (5):
      drm/i915: Fix a NULL vs IS_ERR() bug
      drm/etnaviv: fix error code in event_alloc()
      drm/managed: Clean up GFP_ flag usage in drmm_kmalloc()
      drm/amd/display: Unlock on error path in
dm_handle_mst_sideband_msg_ready_event()
      drm/loongson: Add a check for lsdc_bo_create() errors

Daniel Miess (3):
      drm/amd/display: Reenable all root clock gating options
      drm/amd/display: Fix DP2 link training failure with RCO
      drm/amd/display: Prevent vtotal from being set to 0

Daniel Vetter (5):
      Merge tag 'drm-misc-next-2023-07-13' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2023-07-21' of
ssh://git.freedesktop.org/git/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2023-07-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.6-2023-07-28' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      drm/msm/mdp5: Don't leak some plane state

Daniele Ceraolo Spurio (5):
      drm/i915/gsc: fixes and updates for GSC memory allocation
      drm/i915/mtl/gsc: extract release and security versions from the
gsc binary
      drm/i915/mtl/gsc: query the GSC FW for its compatibility version
      drm/i915/mtl/gsc: Add a gsc_info debugfs
      drm/i915/huc: check HuC and GuC version compatibility on MTL

Danilo Krummrich (23):
      drm: manager to keep track of GPUs VA mappings
      drm: debugfs: provide infrastructure to dump a DRM GPU VA space
      drm/gem: fix lockdep check for dma-resv lock
      drm/nouveau: new VM_BIND uAPI interfaces
      drm/nouveau: get vmm via nouveau_cli_vmm()
      drm/nouveau: bo: initialize GEM GPU VA interface
      drm/nouveau: move usercopy helpers to nouveau_drv.h
      drm/nouveau: fence: separate fence alloc and emit
      drm/nouveau: fence: fail to emit when fence context is killed
      drm/nouveau: chan: provide nouveau_channel_kill()
      drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
      drm/nouveau: implement new VM_BIND uAPI
      drm/nouveau: debugfs: implement DRM GPU VA debugfs
      nouveau/dmem: fix copy-paste error in nouveau_dmem_migrate_chunk()
      drm/nouveau: nvkm: vmm: silence warning from cast
      drm/nouveau: remove incorrect __user annotations
      drm/nouveau: uvmm: remove incorrect calls to mas_unlock()
      drm/nouveau: uvmm: remove dedicated VM pointer from VMAs
      drm/test: drm_exec: fix memory leak on object prepare
      drm/nouveau: sched: avoid job races between entities
      drm/nouveau: uvmm: fix unset region pointer on remap
      drm/nouveau: uapi: don't pass NO_PREFETCH flag implicitly
      drm/gpuva_mgr: remove unused prev pointer in __drm_gpuva_sm_map()

Dave Airlie (19):
      drm/nouveau: fixup the uapi header file.
      Merge tag 'drm-next-xilinx-20230802' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into
drm-next
      Merge tag 'drm-misc-next-2023-08-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-08-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-gt-next-2023-08-04' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'exynos-drm-next-for-v6.6' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'drm-misc-next-2023-08-10' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-08-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-gt-next-2023-08-11' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'mediatek-drm-next-6.6' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-next-20230814' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into
drm-next
      Merge tag 'amd-drm-next-6.6-2023-08-11' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge branch 'etnaviv/next' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2023-08-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.6-2023-08-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      BackMerge tag 'v6.5-rc7' into drm-next
      Merge tag 'drm-msm-next-2023-08-20' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-misc-next-fixes-2023-08-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-fixes-2023-08-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next

David Jander (2):
      drm/bridge: tc358767: increase PLL lock time delay
      drm/bridge: tc358767: give VSDELAY some positive value

David Reaver (1):
      drm/i915/huc: fix intel_huc.c doc bulleted list format error

Denis Arefev (1):
      drm/amd/display: Return value of function

Dmitry Baryshkov (48):
      drm/msm: stop storing the array of CRTCs in struct msm_drm_private
      drm/msm: enumerate DSI interfaces
      drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
      drm/msm/dpu: simplify peer LM handling
      drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
      drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
      drm/msm/dpu: expand .clk_ctrls definitions
      drm/msm/dpu: drop zero features from dpu_mdp_cfg data
      drm/msm/dpu: drop zero features from dpu_ctl_cfg data
      drm/msm/dpu: correct indentation for CTL definitions
      drm/msm/dpu: inline SSPP_BLK macros
      drm/msm/dpu: inline DSPP_BLK macros
      drm/msm/dpu: inline LM_BLK macros
      drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
      drm/msm/dpu: inline MERGE_3D_BLK macros
      drm/msm/dpu: inline various PP_BLK_* macros
      drm/msm/dpu: inline WB_BLK macros
      drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
      drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
      drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
      dt-bindings: display: msm: dp-controller: document SM8250 compatible
      drm: panel: simple: specify bpc for powertip_ph800480t013_idf02
      drm/msm/dpu: inline __intr_offset
      drm/msm/dpu: split interrupt address arrays
      drm/msm/dpu: autodetect supported interrupts
      drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
      drm/msm/dpu: drop compatibility INTR defines
      drm/msm/mdss: correct UBWC programming for SM8550
      drm/msm/mdss: rename ubwc_version to ubwc_enc_version
      drm/msm/mdss: export UBWC data
      drm/msm/mdss: populate missing data
      drm/msm/dpu: use MDSS data for programming SSPP
      drm/msm/dpu: drop UBWC configuration
      drm/msm/dpu: drop BWC features from DPU_MDP_foo namespace
      drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
      drm/msm/dpu: bail from _dpu_core_perf_crtc_update_bus if there
are no ICC paths
      drm/msm/dpu: drop separate dpu_core_perf_tune overrides
      drm/msm/dpu: rework indentation in dpu_core_perf
      drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
      drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
      drm/msm/dpu: remove unused fields from struct dpu_core_perf
      drm/msm/dpu: remove extra clk_round_rate() call
      drm/msm/dpu: move max clock decision to dpu_kms.
      drm/msm/dpu: drop dpu_core_perf_destroy()
      drm/msm/dpu: fix DSC 1.2 block lengths
      drm/msm/dpu: fix DSC 1.2 enc subblock length
      drm/msm/dpu: initialise clk_rate to 0 in _dpu_core_perf_get_core_clk_=
rate
      drm/msm/dpu: fix the irq index in dpu_encoder_phys_wb_wait_for_commit=
_done

Dmitry Osipenko (8):
      media: videobuf2: Don't assert held reservation lock for dma-buf mmap=
ping
      dma-buf/heaps: Don't assert held reservation lock for dma-buf mmappin=
g
      udmabuf: Don't assert held reservation lock for dma-buf mmapping
      drm: Don't assert held reservation lock for dma-buf mmapping
      dma-buf: Change locking policy for mmap()
      drm/shmem-helper: Switch to reservation lock
      drm/virtio: Support sync objects
      drm/panfrost: Sync IRQ by job's timeout handler

Dnyaneshwar Bhadane (13):
      drm/i915/hsw: s/HSW/HASWELL for platform/subplatform defines
      drm/i915/bdw: s/BDW/BROADWELL for platform/subplatform defines
      drm/i915/skl: s/SKL/SKYLAKE for platform/subplatform defines
      drm/i915/kbl: s/KBL/KABYLAKE for platform/subplatform defines
      drm/i915/cfl: s/CFL/COFFEELAKE for platform/subplatform defines
      drm/i915/cml: s/CML/COMETLAKE for platform/subplatform defines
      drm/i915/rkl: s/RKL/ROCKETLAKE for platform/subplatform defines
      drm/i915/jsl: s/JSL/JASPERLAKE for platform/subplatform defines
      drm/i915/tgl: s/TGL/TIGERLAKE for platform/subplatform defines
      drm/i915/adlp: s/ADLP/ALDERLAKE_P for display and graphics step
      drm/i915/rplp: s/ADLP_RPLP/RAPTORLAKE_P for RPLP defines
      drm/i915/rplu: s/ADLP_RPLU/RAPTORLAKE_U in RPLU defines
      drm/i915/adls: s/ADLS_RPLS/RAPTORLAKE_S in platform and
subplatform defines

Douglas Anderson (13):
      drm/bridge: ps8640: Drop the ability of ps8640 to fetch the EDID
      dt-bindings: HID: i2c-hid: Add "panel" property to i2c-hid
backed touchscreens
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

Emily Deng (1):
      drm/amdgpu/irq: Move irq resume to the beginning

Eric Huang (3):
      drm/amdkfd: add kfd2kgd debugger callbacks for GC v9.4.3
      drm/amdgpu: enable trap of each kfd vmid for gfx v9.4.3
      drm/amdkfd: workaround address watch clearing bug for gfx v9.4.2

Ethan Bitnun (1):
      drm/amd/display: Prevent invalid pipe connections

Evan Quan (4):
      drm/amd/pm: share the code around SMU13 pcie parameters update
      drm/amd/pm: disable the SMU13 OD feature support temporarily
      drm/amd/pm: correct the way for checking custom OD settings
      drm/amd/pm: correct the logics for retreiving SMU13 OD setting limits

Fabio Estevam (1):
      drm/msm/a2xx: Call adreno_gpu_init() earlier

Faith Ekstrand (1):
      drm/nouveau/sched: Don't pass user flags to drm_syncobj_find_fence()

Faiz Abbas (1):
      drm/arm/komeda: Remove component framework and add a simple encoder

Fangzhi Zuo (1):
      drm/amd/display: Temporary Disable MST DP Colorspace Property

GUO Zihua (2):
      fbcon: Make fbcon_registered_fb and fbcon_num_registered_fb static
      drm/amdgpu: Remove duplicated includes

Geert Uytterhoeven (16):
      drm/ssd130x: Fix pitch calculation in ssd130x_fb_blit_rect()
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

George Shen (4):
      drm/amd/display: Update 128b/132b downspread factor to 0.3%
      drm/amd/display: Add stream overhead in BW calculations for 128b/132b
      drm/amd/display: Add link encoding to timing BW calculation parameter=
s
      drm/amd/display: Guard DCN31 PHYD32CLK logic against chip family

Guchun Chen (6):
      drm/amdgpu/vkms: drop redundant set of fb_modifiers_not_supported
      drm/amdgpu/vkms: relax timer deactivation by hrtimer_try_to_cancel
      drm/amdgpu: Allocate root PD on correct partition
      drm/amdgpu: fix slab-out-of-bounds issue in amdgpu_vm_pt_create
      drm/amdgpu/vm: use the same xcp_id from root PD
      drm/amdgpu: use a macro to define no xcp partition case

Guillaume La Roque (1):
      drm/panel: Support for startek-kd070fhfid015 MIPI-DSI panel

Gurchetan Singh (1):
      drm/virtio: Conditionally allocate virtio_gpu_fence

Gustavo Sousa (1):
      drm/i915: Remove prototype for intel_cx0_phy_ddi_vswing_sequence()

Hamza Mahfooz (1):
      drm/amd/display: ensure async flips are only accepted for fast update=
s

Harshit Mogalapalli (1):
      drm/i915/huc: Fix missing error code in intel_huc_init()

Hawking Zhang (5):
      drm/amdgpu: Only create err_count sysfs when hw_op is supported
      drm/amdgpu: Apply poison mode check to GFX IP only
      drm/amdgpu: Remove gfx v11_0_3 ras_late_init call
      drm/amdgpu: Issue ras enable_feature for gfx ip only
      drm/amdgpu: Remove unnecessary ras cap check

Horace Chen (1):
      drm/amdgpu: set sw state to gfxoff after SR-IOV reset

Imre Deak (7):
      drm/i915/adlp+: Allow DC states along with PW2 only for PWB functiona=
lity
      drm/i915: Add missing forward declarations/includes to display
power headers
      drm/i915: Remove redundant forward declarations from display power he=
aders
      drm/i915: Add way to specify the power-off delay of a display power d=
omain
      drm/i915: Prevent needless toggling of DC states during modesets
      drm: Add an HPD poll helper to reschedule the poll work
      drm/i915: Fix HPD polling, reenabling the output poll work as needed

Iswara Nagulendran (1):
      drm/amd/display: Add VESA SCR case for default aux backlight

Jacek Lawrynowicz (3):
      accel/ivpu: Rename sources to use generation based names
      accel/ivpu: Use generation based function and registers names
      accel/ivpu: Switch to generation based FW names

James Zhu (1):
      drm/amdgpu: skip xcp drm device allocation when out of drm resource

Jane Jian (1):
      drm/amd/smu: use AverageGfxclkFrequency* to replace previous GFX
Curr Clock

Jani Nikula (20):
      drm/doc: fix duplicate declaration warning
      drm/i915: fix Sphinx indentation warning
      drm/i915: use mock device info for creating mock device
      drm/i915: move platform_engine_mask and memory_regions to device info
      drm/i915: separate display info printing from the rest
      drm/i915: fix display info usage
      drm/i915: move display device and runtime info to struct intel_displa=
y
      drm/i915: make device info a const pointer to rodata
      drm/i915/uncore: add intel_uncore_regs() helper
      drm/i915/dram: replace __raw_uncore_read32() with intel_uncore_read_f=
w()
      Revert "drm/i915: use localized __diag_ignore_all() instead of per fi=
le"
      drm/i915/uncore: split unclaimed_reg_debug() to header and footer
      drm/i915/uncore: fix race around i915->params.mmio_debug
      drm/i915/sdvo: fix panel_type initialization
      drm/i915: fix display probe for IVB Q and IVB D GT2 server
      drm/i915: debug log when GMD ID indicates there's no display
      drm/i915/irq: add dedicated intel_display_irq_init()
      drm/i915/irq: add dg1_de_irq_postinstall()
      drm/i915/irq: add ilk_de_irq_postinstall()
      drm/i915/irq: move all PCH irq postinstall calls to display code

Janusz Krzysztofik (1):
      drm/i915: Fix premature release of request's reusable memory

Jason-JH.Lin (4):
      drm/mediatek: Remove freeing not dynamic allocated memory
      drm/mediatek: Add cnt checking for coverity issue
      drm/mediatek: Fix dereference before null check
      drm/mediatek: Fix void-pointer-to-enum-cast warning

Javier Martinez Canillas (15):
      drm/ssd130x: Make default width and height to be controller dependent
      dt-bindings: display: ssd1307fb: Remove default width and height valu=
es
      drm/ssd130x: Set the page height value in the device info data
      drm/ssd130x: Don't allocate buffers on each plane update
      drm/ssd130x: Remove hardcoded bits-per-pixel in ssd130x_buf_alloc()
      drm/arm: Make ARM devices menu depend on DRM
      drm/ssd130x: Change pixel format used to compute the buffer size
      video: Add auxiliary display drivers to Graphics support menu
      fbdev: Move core fbdev symbols to a separate Kconfig file
      fbdev: Split frame buffer support in FB and FB_CORE symbols
      drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled
      drm/ssd130x: Inline the ssd130x_buf_{alloc, free}() function helpers
      drm/ssd130x: Allocate buffer in the plane's .atomic_check() callback
      drm/ssd130x: Use shadow-buffer helpers when managing plane's state
      drm: Drop select FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION

Jay Cornwall (4):
      drm/amdkfd: Sync trap handler binaries with source
      drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole
      drm/amdkfd: Sign-extend TMA address in trap handler
      drm/amdkfd: Add missing tba_hi programming on aldebaran

Jeffrey Hugo (1):
      MAINTAINERS: Remove Liam Mark from DMA-BUF HEAPS FRAMEWORK

Jessica Zhang (4):
      dt-bindings: display: panel: Add Visionox R66451 AMOLED DSI panel
      drm/panel: Add driver for Visionox r66451 panel
      drm/msm/dsi: Enable BURST_MODE for command mode for DSI 6G v1.3+
      drm/msm/dpu: Drop encoder vsync_event

Jiadong Zhu (2):
      drm/amdgpu: set completion status as preempted for the resubmission
      drm/amdgpu: disable mcbp if parameter zero is set

Jiapeng Chong (2):
      drm/ssd130x: clean up some inconsistent indenting
      drm/msm/dpu: clean up some inconsistent indenting

Jiasheng Jiang (1):
      drm: xlnx: zynqmp_dpsub: Add missing check for dma_set_mask

JinZe Xu (1):
      drm/amd/display: Setup stream encoder before link enable for TMDS

Jocelyn Falempe (3):
      MAINTAINERS: Add myself as reviewer for mgag200 and ast drivers
      drm/ast: Add BMC virtual connector
      drm/ast: report connection status on Display Port.

John Harrison (1):
      drm/i915/guc: Fix potential null pointer deref in GuC 'steal id' test

John Stultz (2):
      MAINTAINERS: Add T.J. Mercier as reviewer for DMA-BUF HEAPS FRAMEWORK
      MAINTAINERS: Remove Laura Abbott from DMA-BUF HEAPS FRAMEWORK

Jonathan Cavitt (5):
      drm/i915/gt: Ensure memory quiesced before invalidation
      drm/i915/gt: Poll aux invalidation register bit on invalidation
      drm/i915/gt: Simplify shmem_create_from_object map_type selection
      drm/i915: Make i915_coherent_map_type GT-centric
      drm/i915/gt: Apply workaround 22016122933 correctly

Jonathan Kim (8):
      drm/amdkfd: restore debugger additional info for gfx v9_4_3
      drm/amdkfd: enable watch points globally for gfx943
      drm/amdkfd: add multi-process debugging support for GC v9.4.3
      drm/amdkfd: report dispatch id always saved in ttmps after gc9.4.2
      drm/amdkfd: fix trap handling work around for debugging
      drm/amdkfd: enable cooperative groups for gfx11
      drm/amdkfd: fix and enable ttmp setup for gfx11
      drm/amdkfd: fix double assign skip process context clear

Jonathan Marek (1):
      drm/msm/dpu: increase memtype count to 16 for sm8550

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Joshua Aberback (1):
      drm/amd/display: Clean up flip pending timeout handling

Joshua Ashton (3):
      drm/amd/display: Expose more formats for overlay planes on DCN
      drm/amd/display: Enable 3 plane for DCN 3.01
      drm/amd/display: Implement zpos property

Jouni H=C3=B6gander (8):
      drm/i915/psr: Use hw.adjusted mode when calculating io/fast wake time=
s
      drm/i915: Add macros to get i915 device from i915_gem_object
      drm/i915: Add getter/setter for i915_gem_object->frontbuffer
      drm/i915/display: Remove i915_gem_object_types.h from intel_frontbuff=
er.h
      drm/i915: Add function to clear scanout flag for vmas
      drm/i915: Move stolen memory handling into i915_gem_stolen
      drm/i915/fbc: Make FBC check stolen at use time
      drm/i915/fbc: Moved fence related code away from intel_fbc

Juerg Haefliger (2):
      drm/bridge: lt9611uxc: Add MODULE_FIRMWARE macro
      drm/msm/adreno: Add missing MODULE_FIRMWARE macros

Juha-Pekka Heikkila (1):
      drm/i915/sdvo: ignore returned broken edid on intel_sdvo_tmds_sink_de=
tect

Julia Lawall (1):
      drm/gud: use vmalloc_array and vcalloc

Karol Herbst (1):
      drm/nouveau/disp: drop unused argument in nv50_dp_mode_valid

Karol Wachowski (6):
      accel/ivpu: Remove configuration of MMU TBU1 and TBU3
      accel/ivpu: Add MMU support for 4 level page mappings
      accel/ivpu: Make DMA bit mask HW specific
      accel/ivpu: Rename and cleanup MMU600 page tables
      accel/ivpu: Mark 64 kB contiguous areas as contiguous in PTEs
      accel/ivpu: Refactor memory ranges logic

Karolina Stolarek (5):
      drm/ttm: Introduce KUnit test
      drm/ttm/tests: Add tests for ttm_device
      drm/ttm/tests: Add tests for ttm_pool
      drm/ttm/tests: Require MMU when testing
      drm/ttm/tests: Fix type conversion in ttm_pool_test

Kenneth Feng (3):
      drm/amd/pm: correct the pcie width for smu 13.0.0
      drm/amd/pm: disallow the fan setting if there is no fan on smu 13.0.0
      drm/amd/pm: allow the user to force BACO on smu v13.0.0/7

Konrad Dybcio (12):
      drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
      dt-bindings: display/msm: dsi-controller-main: Allow refgen-supply
      drm/msm/dsi: Hook up refgen regulator
      drm/msm/a6xx: Add some missing header definitions
      drm/msm/a6xx: Use descriptive bitfield names for CP_PROTECT_CNTL
      drm/msm/a6xx: Skip empty protection ranges entries
      drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
      drm/msm/a6xx: Improve GMU force shutdown sequence
      drm/msm/a6xx: Fix up GMU region reservations
      drm/msm/a6xx: Introduce a6xx_llc_read
      drm/msm/a6xx: Move LLC accessors to the common header
      drm/msm/a6xx: Bail out early if setting GPU OOB fails

Krunoslav Kovac (1):
      drm/amd/display: Gamut remap only changes missed

Krystian Pradzynski (1):
      accel/ivpu: Add fw_name file to debugfs

Kuogee Hsieh (2):
      drm/msm/dpu: retrieve DSI DSC struct through priv->dsi[0]
      drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_inf=
o

Lang Yu (3):
      drm/amdgpu: rename psp_execute_non_psp_fw_load and make it global
      drm/amdgpu: use psp_execute_load_ip_fw instead
      drm/amdgpu: correct vmhub index in GMC v10/11

Laura Nao (1):
      drm/panel-edp: Add AUO B116XAB01.4 edp panel entry

Laurent Pinchart (2):
      drm: rcar-du: Replace DRM_INFO() with drm_info()
      drm: rcar-du: Use dev_err_probe() to record cause of KMS init errors

Lee Jones (4):
      drm/xlnx/zynqmp_dp: Fix function name zynqmp_dp_link_train() ->
zynqmp_dp_train()
      drm/mediatek/mtk_disp_aal: Remove half completed incorrect struct hea=
der
      drm/mediatek/mtk_disp_ccorr: Remove half completed incorrect struct h=
eader
      drm/tests/drm_kunit_helpers: Place correct function name in the
comment header

Lee Shawn C (2):
      drm/i915/mtl: update DP 2.0 vswing table for C20 phy
      drm/i915/mtl: Add new vswing table for C20 phy to support DP 1.4

Leo Chen (4):
      drm/amd/display: Exit idle optimizations before attempt to access PHY
      drm/amd/display: Revert "drm/amd/display: Read down-spread
percentage from lut to adjust dprefclk."
      drm/amd/display: Blocking invalid 420 modes on HDMI TMDS for DCN31
      drm/amd/display: Blocking invalid 420 modes on HDMI TMDS for DCN314

Leo Ma (2):
      drm/amd/display: Update scaler recout data for visual confirm
      drm/amd/display: Fix underflow issue on 175hz timing

Li Ma (2):
      drm/amdgpu: add PSP 14.0.0 support
      drm/amdgpu/discovery: enable PSP 14.0.0 support

Li Zetao (1):
      drm: xlnx: zynqmp_dpsub: Use devm_platform_ioremap_resource_byname()

Lijo Lazar (16):
      drm/amdgpu: Rename aqua_vanjaram_reg_init.c
      drm/amdgpu: Change golden settings for GFX v9.4.3
      drm/amdgpu: Remove redundant GFX v9.4.3 sequence
      drm/amdgpu: Program xcp_ctl registers as needed
      drm/amdgpu: Update ring scheduler info as needed
      drm/amdgpu: Restore HQD persistent state register
      drm/amdgpu: Match against exact bootloader status
      drm/amdgpu: Add pcie replay count callback to nbio
      drm/amdgpu: Add pci replay count to nbio v7.9
      drm/amdgpu: Use nbio callback for nv and soc21
      drm/amd/pm: Fix SMU v13.0.6 energy reporting
      drm/amdgpu: Report vbios version instead of PN
      drm/amdgpu: Add FRU sysfs nodes only if needed
      drm/amd/pm: Fix temperature unit of SMU v13.0.6
      drm/amdgpu: Remove gfxoff check in GFX v9.4.3
      drm/amdgpu: Add memory vendor information

Liu Ying (1):
      drm/mxsfb: Disable overlay plane in mxsfb_plane_overlay_atomic_disabl=
e()

Luben Tuikov (1):
      drm/amdgpu: Rename to amdgpu_vm_tlb_seq_struct

Luc Ma (1):
      dma-buf: Fix the typo in DMA-BUF statistics doc

Luca Ceresoli (2):
      drm/panel: db7430: remove unused variables
      drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock

Luca Coelho (1):
      drm/i915/display: pre-initialize some values in probe_gmdid_display()

Lucas De Marchi (7):
      drm/i915/gt: Move wal_get_fw_for_rmw()
      drm/i915/gt: Clear all bits from GEN12_FF_MODE2
      drm/i915/gt: Fix context workarounds with non-masked regs
      drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL workaround
      drm/i915/gt: Enable read back on XEHP_FF_MODE2
      drm/i915/gt: Remove bogus comment on IVB_FBC_RT_BASE_UPPER
      drm/i915/gt: Also check set bits in clr_set()

Lucas Stach (12):
      drm/etnaviv: slow down FE idle polling
      drm/etnaviv: fix dumping of active MMU context
      drm/etnaviv: add HWDB entry for VIP8000 Nano r8002
      drm/etnaviv: add HWDB entry for GC520 r5341 c204
      drm/etnaviv: move down etnaviv_gpu_recover_hang() in file
      drm/etnaviv: free events the usual way in recover worker
      drm/etnaviv: move runtime PM handling to events
      drm/etnaviv: make clock handling symetric between runtime resume
and suspend
      drm/etnaviv: avoid runtime PM usage in etnaviv_gpu_bind
      drm/etnaviv: better track GPU state
      drm/etnaviv: drop GPU initialized property
      drm/etnaviv: expedited MMU fault handling

Lyude Paul (1):
      drm/nouveau/nvkm/dp: Add workaround to fix DP 1.3+ DPCD issues

Ma Jun (1):
      drm/buddy: Fix drm buddy info output format

Marek Vasut (12):
      drm/bridge: tc358764: Fix debug print parameter order
      drm/bridge: tc358764: Use BIT() macro for actual bits
      drm/bridge: tc358762: Split register programming from pre-enable to e=
nable
      drm/bridge: tc358762: Switch to atomic ops
      drm/bridge: tc358762: Instruct DSI host to generate HSE packets
      drm/bridge: tc358762: Guess the meaning of LCDCTRL bits
      drm/bridge: tc358762: Handle HS/VS polarity
      drm: bridge: samsung-dsim: Drain command transfer FIFO before transfe=
r
      drm/panel: simple: Drop prepared_time
      drm/panel: simple: Add missing connector type and pixel format
for AUO T215HVN01
      dt-bindings: display: simple: Add Innolux G156HCE-L01 panel
      drm/panel-simple: Add Innolux G156HCE-L01 panel entry

Marijn Suijten (11):
      drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
      dt-bindings: display/msm: Remove DSI1 ports from SM6350/SM6375 exampl=
e
      dt-bindings: clock: qcom, dispcc-sm6125: Require GCC PLL0 DIV clock
      dt-bindings: clock: qcom, dispcc-sm6125: Allow power-domains property
      dt-bindings: display/msm: dsi-controller-main: Document SM6125
      dt-bindings: display/msm: sc7180-dpu: Describe SM6125
      dt-bindings: display/msm: Add SM6125 MDSS
      drm/msm/dpu: Add SM6125 support
      drm/msm/mdss: Add SM6125 support
      dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
      drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125

Mario Limonciello (25):
      drm/amd: Use attribute groups for PSP flashing attributes
      drm/amd: Make flashing messages quieter
      drm/amd: Convert USB-C PD F/W attributes into groups
      drm/amd: Add documentation for how to flash a dGPU
      drm/amd: Detect IFWI or PD upgrade support in psp_early_init()
      drm/amd: adjust whitespace for amdgpu_psp.h
      drm/amd/pm: conditionally disable pcie lane/speed switching for SMU13
      drm/amd: Move helper for dynamic speed switch check out of smu13
      drm/amd: Align SMU11 SMU_MSG_OverridePcieParameters
implementation with SMU13
      drm/amd: Use amdgpu_device_pcie_dynamic_switching_supported() for SMU=
7
      drm/amd: Avoid reading the VBIOS part number twice
      drm/amd: Fix an error handling mistake in psp_sw_init()
      drm/amd: Disable S/G for APUs when 64GB or more host memory
      drm/amd/display: Don't show stack trace for missing eDP
      drm/amd/display: Fix a regression on Polaris cards
      drm/amd: Add amdgpu_hwmon_get_sensor_generic()
      drm/amd: Add a new hwmon attribute for instantaneous power
      drm/amd: Introduce `AMDGPU_PP_SENSOR_GPU_INPUT_POWER`
      drm/amd: Fix SMU 13.0.4/13.0.11 GPU metrics average power
      drm/amd: Drop unnecessary helper for aldebaran
      drm/amd: Fix the return for average power on aldebaran
      drm/amd: Show both power attributes for vega20
      drm/amd: Rename AMDGPU_PP_SENSOR_GPU_POWER
      drm/amd: Hide unsupported power attributes
      drm/amd: flush any delayed gfxoff on suspend entry

Martin Leung (1):
      drm/amd/display: Promote DAL to 3.2.246

Martin Tsai (1):
      drm/amd/display: Read down-spread percentage from lut to adjust dpref=
clk.

Matt Roper (1):
      drm/i915: Extend Wa_14015795083 platforms

Matus Gajdos (2):
      dt-bindings: ili9881c: Add TDO TL050HDV35 LCD panel
      drm/panel: ilitek-ili9881c: Add TDO TL050HDV35 LCD panel

Maxim Schwalm (1):
      drm/tegra: output: hdmi: Support bridge/connector

Maxime Ripard (11):
      drm/tests: helpers: Switch to kunit actions
      drm/tests: client-modeset: Remove call to drm_kunit_helper_free_devic=
e()
      drm/tests: modes: Remove call to drm_kunit_helper_free_device()
      drm/tests: probe-helper: Remove call to drm_kunit_helper_free_device(=
)
      drm/tests: helpers: Create a helper to allocate a locking ctx
      drm/tests: helpers: Create a helper to allocate an atomic state
      drm/vc4: tests: pv-muxing: Remove call to drm_kunit_helper_free_devic=
e()
      drm/vc4: tests: mock: Use a kunit action to unregister DRM device
      drm/vc4: tests: pv-muxing: Switch to managed locking init
      drm/vc4: tests: Switch to atomic state allocation helper
      drm/vc4: tests: pv-muxing: Document test scenario

Ma=C3=ADra Canal (6):
      drm/vkms: Add kernel-doc to the function vkms_compose_row()
      drm/vkms: Fix all kernel-doc warnings of the vkms_composer file
      drm/vkms: Reduce critical section
      drm/vkms: Enable ARGB8888 support for writeback
      drm/vkms: Isolate writeback pixel conversion functions
      drm/vkms: Fix race-condition between the hrtimer and the atomic commi=
t

Meera Patel (1):
      drm/amd/display: Initialize necessary uninitialized variables

Melissa Wen (1):
      drm/amd/display: check attr flag before set cursor degamma on DCN3+

Michael Riesch (7):
      drm/panel: sitronix-st7789v: fix indentation in drm_panel_funcs
      drm/panel: sitronix-st7789v: add panel orientation support
      dt-bindings: display: add rotation property to sitronix,st7789v
      dt-bindings: vendor-prefixes: add jasonic
      dt-bindings: display: st7789v: add jasonic jt240mhqs-hwt-ek-e3 displa=
y
      drm/panel: sitronix-st7789v: add support for partial mode
      drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support

Michael Strauss (2):
      drm/amd/display: Re-add aux intercept disable delay generically
for 2+ LTTPRs
      drm/amd/display: Support Compliance Test Pattern Generation with
DP2 Retimer

Mika Kahola (1):
      drm/i915/mtl: Cleanup usage of phy lane reset

Mike Hsieh (1):
      drm/amd/display: Add vendor Id for reference

Mikko Perttunen (3):
      drm/tegra: Add error check for NVDEC firmware memory allocation
      gpu: host1x: Return error when context device not attached to IOMMU
      drm/tegra: Enable runtime PM during probe

Miquel Raynal (9):
      of: module: Export of_device_uevent()
      gpu: host1x: Stop open-coding of_device_uevent()
      dt-bindings: display: st7789v: Add the edt,et028013dma panel compatib=
le
      dt-bindings: display: st7789v: bound the number of Rx data lines
      drm/panel: sitronix-st7789v: Use 9 bits per spi word by default
      drm/panel: sitronix-st7789v: Clarify a definition
      drm/panel: sitronix-st7789v: Add EDT ET028013DMA panel support
      drm/panel: sitronix-st7789v: Check display ID
      drm: atmel-hlcdc: Support inverting the pixel clock polarity

Muhammad Ahmed (1):
      drm/amd/display: disable clock gating logic reversed bug fix

Mukul Joshi (3):
      drm/amdgpu: Update invalid PTE flag setting
      drm/amdkfd: Use KIQ to unmap HIQ
      drm/amdkfd: Update CWSR grace period for GFX9.4.3

Nancy.Lin (1):
      drm/mediatek: Fix uninitialized symbol

Nathan Chancellor (2):
      drm/v3d: Avoid -Wconstant-logical-operand in nsecs_to_jiffies_timeout=
()
      drm/i915: Avoid -Wconstant-logical-operand in nsecs_to_jiffies_timeou=
t()

Neil Armstrong (3):
      dt-bindings: display: msm: sm8350-mdss: document displayport
controller subnode
      dt-bindings: display: msm: sm8450-mdss: document displayport
controller subnode
      dt-bindings: display: msm: sm8550-mdss: document displayport
controller subnode

Nicholas Choi (1):
      Revert "drm/amd/display: Implement zpos property"

Nicholas Kazlauskas (3):
      drm/amd/display: Use is_dig_enable function instead of dcn10 hardcode
      drm/amd/display: Skip querying caps when DMCUB emulation is in use
      drm/amd/display: Keep PHY active for DP displays on DCN31

Nicholas Susanto (2):
      drm/amd/display: Cache backlight_millinits in link structure and
setting brightness accordingly
      drm/amd/display: Enable 8k60hz mode on single display

Nikhil Devshatwar (5):
      drm/bridge: tfp410: Support format negotiation hooks
      drm/bridge: tfp410: Set input_bus_flags in atomic_check
      drm/bridge: mhdp8546: Add minimal format negotiation
      drm/bridge: mhdp8546: Set input_bus_flags from atomic_check
      drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable

Nikita Travkin (1):
      drm/panel-edp: Add enable timings for N140HCA-EAC panel

Nirmoy Das (3):
      drm/i915: Fix a VMA UAF for multi-gt platform
      drm/i915/gt: Do not use stolen on MTL
      drm/i915/display: Do not use stolen on MTL

Ondrej Jirman (1):
      drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI controller

Ori Messinger (1):
      drm/amdgpu: Report Missing MES Firmware Versions with Sysfs

Otto Pfl=C3=BCger (2):
      drm/mipi-dbi: Lock SPI bus before setting D/C GPIO
      drm/tiny: panel-mipi-dbi: Allow sharing the D/C GPIO

Ovidiu Bunea (1):
      drm/amd/display: Add new sequence for 4-lane HBR3 on vendor
specific retimers

Paul Cercueil (2):
      drm/panel: ld9040: Use better magic values
      drm/panel: ld9040: Register a backlight device

Paul Hsieh (1):
      drm/amd/display: Add interface to modify DMUB panel power options

Philip Yang (2):
      drm/amdkfd: Skip handle mapping SVM range with no GPU access
      drm/amdgpu: Increase soft IH ring size

Philipp Zabel (1):
      drm/imx/ipuv3: ipuv3-plane: reuse local variable height in atomic_upd=
ate

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: add VISIBLE info in amdgpu_bo_print_info

Pin-yen Lin (2):
      drm/bridge: it6505: Fix Kconfig indentation
      drm/bridge: Remove redundant i2c_client in anx7625/it6505

Praful Swarnakar (2):
      drm/amdgpu: Fix style issues in amdgpu_debugfs.c
      drm/amdgpu: Fix style issues in amdgpu_psp.c

Prike Liang (6):
      drm/amdgpu/sdma6: initialize sdma 6.1.0
      drm/amdgpu/discovery: enable sdma6 for SDMA 6.1.0
      drm/amdgpu/discovery: add hdp 6.1.0 support
      drm/amdgpu/discovery: add smuio 14.0.0 support
      drm/amdgpu/discovery: add ih 6.1.0 support
      drm/amdgpu: enable SDMA MGCG for SDMA 5.2.x

Radhakrishna Sripada (3):
      drm/i915/mtl: Fix SSC selection for MPLLA
      drm/i915/mtl: Skip using vbt hdmi_level_shifter selection on MTL
      drm/i915/dpt: Use shmem for dpt objects

Rajneesh Bhardwaj (1):
      drm/ttm: Use init_on_free to delay release TTM BOs

Ralph Campbell (1):
      drm/edid: Add quirk for OSVR HDK 2.0

Ramesh Errabolu (2):
      drm/amdkfd: Access gpuvm_export_dmabuf() API to get Dmabuf
      drm/amdgpu: Checkpoint and Restore VRAM BOs without VA

Ran Sun (114):
      drm/radeon: ERROR: "foo * bar" should be "foo *bar"
      drm/radeon: ERROR: "(foo*)" should be "(foo *)"
      drm/radeon: ERROR: "(foo*)" should be "(foo *)"
      drm/radeon: ERROR: that open brace { should be on the previous line
      drm/radeon: ERROR: "(foo*)" should be "(foo *)"
      drm/amd: open brace '{' following struct go on the same line
      drm/amd/pm: open brace '{' following struct go on the same line
      drm/amdgpu: open brace '{' following struct go on the same line
      drm/radeon: ERROR: "foo * bar" should be "foo *bar"
      drm/radeon/si_dpm: open brace '{' following struct go on the same lin=
e
      drm/radeon: add missing spaces before ';'
      drm/radeon: add missing spaces after ',' and else should follow
close brace '}'
      drm/radeon: that open brace { should be on the previous line
      drm/radeon: that open brace { should be on the previous line
      drm/radeon: Move assignment outside if condition
      drm/amd/pm: add missing spaces before '('
      drm/amd/pm: Clean up errors in navi10_ppt.c
      drm/amd/pm: Clean up errors in arcturus_ppt.c
      drm/amd/pm: Clean up errors in arcturus_ppt.c
      drm/amd/pm: that open brace { should be on the previous line
      drm/amd/pm: open brace '{' following function definitions go on
the next line
      drm/amd/pm: open brace '{' following struct go on the same line
      drm/amd/pm: Clean up errors in smu_v11_0.h
      drm/amd/pm: Clean up errors in smu_v13_0_7_ppt.c
      drm/amd/pm: Clean up errors in smu_v13_0.c
      drm/amd/pm: Clean up errors in aldebaran_ppt.c
      drm/amd/pm: Clean up errors in smu_v13_0_6_ppt.c
      drm/amd/pm: Clean up errors in smu_v13_0_5_ppt.c
      drm/amd: Clean up errors in smu_v13_0_5_ppt.c
      drm/amd/pm: Clean up errors in amdgpu_smu.c
      drm/amd/pm: Clean up errors in amd_powerplay.c
      drm/amd/pm: Clean up errors in vega10_baco.c
      drm/amd/pm: Clean up errors in vega12_hwmgr.c
      drm/amd/pm/powerplay/hwmgr/ppevvmath: Clean up errors in ppevvmath.h
      drm/amd/pm: Clean up errors in smu10_hwmgr.c
      drm/amd/pm: Clean up errors in fiji_baco.c
      drm/amd/pm: Clean up errors in vega10_powertune.c
      drm/amd/pm: Clean up errors in vega12_pptable.h
      drm/amd/pm: Clean up errors in vega12_baco.c
      drm/amdgpu: Clean up errors in smu7_powertune.c
      drm/amdgpu: Clean up errors in common_baco.c
      drm/amdgpu: Clean up errors in smu_helper.c
      drm/amdgpu: Clean up errors in ci_baco.c
      drm/amdgpu: Clean up errors in ppatomctrl.h
      drm/amd/pm: Clean up errors in vega10_pptable.h
      drm/amd: Clean up errors in smu7_hwmgr.c
      drm/amd: Clean up errors in pptable_v1_0.h
      drm/amd: Clean up errors in vega10_processpptables.c
      drm/amdgpu/powerplay: Clean up errors in smu_helper.h
      drm/amd/pm: Clean up errors in vega20_hwmgr.h
      drm/amdgpu: Clean up errors in vega20_baco.c
      drm/amdgpu/powerplay: Clean up errors in vega20_hwmgr.c
      gpu: amd: Clean up errors in ppatomfwctrl.h
      drm/amd/pm: Clean up errors in tonga_baco.c
      drm/amd/pm/powerplay/hwmgr/hwmgr: Clean up errors in hwmgr.c
      drm/amd/pm: Clean up errors in vega12_hwmgr.h
      drm/amd/pm: Clean up errors in vega20_pptable.h
      drm/amd/pm: Clean up errors in polaris_baco.c
      drm/amd/pm: Clean up errors in smu9_driver_if.h
      drm/amd/pm: Clean up errors in smu71.h
      drm/amd/pm: Clean up errors in smu7_fusion.h
      drm/amd/pm: Clean up errors in smu7.h
      drm/amd/pm: Clean up errors in pp_thermal.h
      drm/amd/pm: Clean up errors in hardwaremanager.h
      drm/amd/pm: Clean up errors in hwmgr.h
      drm/amd/pm: Clean up errors in smu73.h
      drm/amd/pm: Clean up errors in smu75.h
      drivers/amd/pm: Clean up errors in smu8_smumgr.h
      drm/amd/pm: Clean up errors in r600_dpm.h
      drm/amd/pm: Clean up errors in sislands_smc.h
      drm/amd/pm: Clean up errors in amdgpu_pm.c
      drm/amd/display: Clean up errors in color_gamma.c
      drm/amd/display: Clean up errors in ddc_regs.h
      drm/amd/dc: Clean up errors in hpd_regs.h
      drm/amd/display: Clean up errors in dce110_timing_generator.c
      drm/amd/display: Clean up errors in dce110_hw_sequencer.c
      drm/amd/display: Clean up errors in dce112_hw_sequencer.c
      drm/amd/display: Clean up errors in dcn315_smu.c
      drm/amd/display: Clean up errors in dcn316_clk_mgr.c
      drm/amd/display: Clean up errors in dcn316_smu.c
      drm/amd/display: Clean up errors in bios_parser2.c
      drm/amd/display: Clean up errors in dc_stream.c
      drm/amd/display: Clean up errors in dcn10_dpp_dscl.c
      drm/amd/display: Clean up errors in display_mode_vba_30.c
      drm/amd/display: Clean up errors in dce_clk_mgr.c
      drm/amdgpu: Clean up errors in cik_ih.c
      drm/amdgpu: Clean up errors in vce_v3_0.c
      drm/amdgpu: Clean up errors in amdgpu_psp.h
      drm/amdgpu: Clean up errors in ih_v6_0.c
      drm/amdgpu: Clean up errors in vega20_ih.c
      drm/amdgpu: Clean up errors in mmhub_v9_4.c
      drm/amdgpu/atomfirmware: Clean up errors in amdgpu_atomfirmware.c
      drm/amdgpu: Clean up errors in uvd_v7_0.c
      drm/jpeg: Clean up errors in jpeg_v2_0.c
      drm/amdgpu: Clean up errors in dce_v10_0.c
      drm/amdgpu: Clean up errors in mxgpu_nv.c
      drm/amdgpu/jpeg: Clean up errors in vcn_v1_0.c
      drm/amdgpu: Clean up errors in dce_v8_0.c
      drm/amdgpu: Clean up errors in soc21.c
      drm/amdgpu: Clean up errors in amdgpu_atombios.h
      drm/amdgpu: Clean up errors in mes_v11_0.c
      drm/amdgpu: Clean up errors in amdgpu_trace.h
      drm/amdgpu: Clean up errors in amdgpu_ring.h
      drm/amdgpu: Clean up errors in amdgpu_virt.c
      drm/amdgpu: Clean up errors in nv.c
      drm/amdgpu: Clean up errors in mxgpu_vi.c
      drm/amdgpu: Clean up errors in uvd_v3_1.c
      drm/amdgpu: Clean up errors in vcn_v4_0.c
      drm/amdgpu: Clean up errors in gfx_v7_0.c
      drm/amdgpu: Clean up errors in tonga_ih.c
      drm/amdgpu: Clean up errors in vcn_v3_0.c
      drm/amd/pm: Clean up errors in smu73_discrete.h
      drm/amd/pm: Clean up errors in smu_v11_0_pptable.h
      drm/amd/pm: Clean up errors in amdgpu_smu.h

Randy Dunlap (2):
      drm/amd/display: dc.h: eliminate kernel-doc warnings
      drm/amd/display: dmub_replay: don't use kernel-doc markers

Reza Amini (3):
      drm/amd/display: ABM pause toggle
      drm/amd/display: Correct grammar mistakes
      drm/amd/display: Correct unit conversion for vstartup

Rob Clark (23):
      Merge branch 'msm-fixes' into msm-next
      drm/msm/adreno: Remove GPU name
      drm/msm/adreno: Remove redundant gmem size param
      drm/msm/adreno: Remove redundant revn param
      drm/msm/adreno: Use quirk identify hw_apriv
      drm/msm/adreno: Use quirk to identify cached-coherent support
      drm/msm/adreno: Allow SoC specific gpu device table entries
      drm/msm/adreno: Move speedbin mapping to device table
      drm/msm/adreno: Bring the a630 family together
      drm/msm/adreno: Add adreno family
      drm/msm/adreno: Add helper for formating chip-id
      drm/msm/adreno: Move adreno info to config
      dt-bindings: drm/msm/gpu: Extend bindings for chip-id
      drm/msm/adreno: Switch to chip-id for identifying GPU
      drm/msm/a6xx: Fix misleading comment
      drm/msm/a6xx: Fix GMU lockdep splat
      drm/msm: Disallow relocs on a6xx+
      drm/msm: Take lru lock once per job_run
      drm/msm: Use drm_gem_object in submit bos table
      drm/msm: Take lru lock once per submit_pin_objects()
      drm/msm: Remove vma use tracking
      drm/msm/a690: Switch to a660_gmu.bin
      drm/msm/gpu: Push gpu lock down past runpm

Rob Herring (3):
      drm: etnaviv: Replace of_platform.h with explicit includes
      gpu/host1x: Explicitly include correct DT includes
      drm: Explicitly include correct DT includes

Rodrigo Siqueira (4):
      drm/amd/display: Improve the include of header file
      drm/amd/display: Remove unused function
      drm/amd/display: Add missing static
      drm/amd/display: Reduce stack size

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Ruan Jinjie (8):
      drm/msm: Remove redundant DRM_DEV_ERROR()
      drm/amdgpu: Remove a lot of unnecessary ternary operators
      drm/amd/pm: Remove many unnecessary NULL values
      drm/msm/adreno: adreno_gpu: Switch to memdup_user_nul() helper
      drm/mediatek: Do not check for 0 return after calling platform_get_ir=
q()
      drm/amdkfd: Remove unnecessary NULL values
      drm/amd/display: Remove unnecessary NULL values
      drm/radeon: Remove unnecessary NULL values

Ryan McCann (6):
      drm/msm: Update dev core dump to not print backwards
      drm/msm/dpu: Drop unused num argument from relevant macros
      drm/msm/dpu: Define names for unnamed sblks
      drm/msm/dpu: Remove redundant prefix/suffix in name of sub-blocks
      drm/msm/dpu: Refactor printing of main blocks in device core dump
      drm/msm/dpu: Update dev core dump to dump registers of sub-blocks

Saleemkhan Jamadar (4):
      drm/amdgpu:update kernel vcn ring test
      drm/amdgpu: update kernel vcn ring test
      Revert "drm/amdgpu: update kernel vcn ring test"
      Revert "drm/amdgpu:update kernel vcn ring test"

Samir Dhume (7):
      drm/amdgpu/vcn: Add MMSCH v4_0_3 support for sriov
      drm/amdgpu/vcn: mmsch_v4_0_3 requires doorbell on 32 byte boundary
      drm/amdgpu/jpeg: mmsch_v4_0_3 requires doorbell on 32 byte boundary
      drm/amdgpu/vcn: change end doorbell index for vcn_v4_0_3
      drm/amdgpu/vcn: sriov support for vcn_v4_0_3
      drm/amdgpu/jpeg: sriov support for jpeg_v4_0_3
      drm/amdgpu/vcn: Skip vcn power-gating change for sriov

Samson Tam (1):
      drm/amd/display: add additional refresh rate conditions for SubVP cas=
es

Samuel Holland (1):
      drm/amd/display: Allow building DC with clang on RISC-V

Sandor Yu (2):
      drm: bridge: dw_hdmi: Add cec suspend/resume functions
      drm: bridge: dw_hdmi: Fix ELD is not updated issue

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

Shashank Sharma (10):
      drm/amdgpu: create a new file for doorbell manager
      drm/amdgpu: don't modify num_doorbells for mes
      drm/amdgpu: initialize ttm for doorbells
      drm/amdgpu: create kernel doorbell pages
      drm/amdgpu: get absolute offset from doorbell index
      drm/amdgpu: use doorbell mgr for kfd kernel doorbells
      drm/amdgpu: use doorbell mgr for kfd process doorbells
      drm/amdgpu: remove unused functions and variables
      drm/amdgpu: use doorbell mgr for MES kernel doorbells
      drm/amdgpu: cleanup MES process level doorbells

Shiwu Zhang (1):
      drm/amdgpu: fix the indexing issue during rlcg access ctrl init

Simon Ser (23):
      drm: fix code style for embedded structs in hdr_metadata_infoframe
      drm/sysfs: rename drm_sysfs_connector_status_event()
      drm/bridge_connector: use drm_kms_helper_connector_hotplug_event()
      drm/atomic: log drm_atomic_replace_property_blob_from_id() errors
      drm/atomic: drop extra bracket from log messages
      drm/atomic: log when getting/setting unknown properties
      drm/atomic: log when CRTC_ID prop value is invalid
      drm/atomic: log on attempt to set legacy DPMS property
      drm/atomic: log when page-flip is requested without CRTCs
      drm/atomic: log errors in drm_mode_atomic_ioctl()
      drm/kms: log when querying an object not included in lease
      nouveau/dispnv50: add cursor pitch check
      drm/nouveau/disp: use drm_kms_helper_connector_hotplug_event()
      i915/display/hotplug: use drm_kms_helper_connector_hotplug_event()
      drm/amd/display: only accept async flips for fast updates
      drm/drv: use enum drm_minor_type when appropriate
      drm/file: use explicit values for enum drm_minor_type
      drm/syncobj: add IOCTL to register an eventfd
      drm/doc: use proper cross-references for sections
      drm/doc: add warning about connector_type_id stability
      drm/doc: document drm_event and its types
      drm/doc: document that PRIME import/export is always supported
      drm/doc: fix underline for section "DRM Sync Objects"

Sreekant Somasekharan (1):
      drm/amd/amdgpu: Add cu_occupancy sysfs file to GFX9.4.3

Srinivasan Shanmugam (66):
      drm/amd/display: Clean up errors & warnings in amdgpu_dm.c
      drm/amd/display: Remove else after return statement in
'dm_update_plane_state'
      drm/amd/display: Remove else after return in 'dm_crtc_get_scanoutpos(=
)'
      drm/amd/display: Clean up style problems in amdgpu_dm_irq.c
      drm/amd/display: Remove redundant braces in
'amdgpu_dm_crtc_notify_ta_to_read()'
      drm/amd/display: Use seq_puts() in
'amdgpu_current_colorspace_show()' & 'edp_ilr_show()'
      drm/amd/display: Clean up warnings in amdgpu_dm_pp_smu.c
      drm/amd/display: Remove unnecessary casts in amdgpu_dm_helpers.c
      drm/amd/display: Clean up warnings in amdgpu_dm _mst_types, _plane, _=
psr.c
      drm/amdgpu: Fix error & warnings in gmc_v9_0.c
      drm/amdgpu: Fix warnings in gfxhub_ v1_0, v1_2.c
      drm/amdgpu: Fix warnings in gfxhub_v2_0.c
      drm/amdgpu: Prefer dev_warn over printk
      drm/amdgpu: Fix warnings in gmc_v10_0.c
      drm/amdgpu: Fix errors & warnings in gmc_ v6_0, v7_0.c
      drm/amdgpu: Fix warnings in gfxhub_v2_1.c
      drm/amdgpu: Remove else after return statement in
'gmc_v8_0_check_soft_reset'
      drm/amdgpu: Fix warnings in gmc_v11_0.c
      drm/amdgpu: Remove else after return statement in
'gfx_v10_0_check_grbm_cam_remapping'
      drm/amdgpu: Fix warnings in gmc_v8_0.c
      drm/amdgpu: Fix warnings in gfxhub_ v3_0, v3_0_3.c
      drm/amdgpu: Fix errors & warnings in gfx_v10_0.c
      drm/amdkfd: Fix stack size in 'amdgpu_amdkfd_unmap_hiq'
      drm/amdgpu: Fix error & warnings in gmc_v8_0.c
      drm/amd/display: Clean up style problems in amdgpu_dm_hdcp.c
      drm/amd/display: Eliminate warnings in amdgpu_dm_helpers.c
      drm/amdgpu: Avoid possiblity of kernel crash in 'gmc_v8_0,
gmc_v7_0_init_microcode()'
      drm/radeon: Prefer pr_err/_info over printk
      drm/amdgpu: Prefer #if IS_ENABLED over #if defined in amdgpu_drv.c
      drm/amdgpu: Fix do not add new typedefs in amdgpu_fw_attestation.c
      drm/amdgpu: Return -ENOMEM when there is no memory in
'amdgpu_gfx_mqd_sw_init'
      drm/radeon: Avoid externs & do not initialize globals to 0 in radeon_=
drv.c
      drm/amd/amdgpu: Fix warnings in amdgpu/amdgpu_display.c
      drm/radeon: Fix style issues in radeon _encoders.c & _gart.c
      drm/radeon: Prefer dev_* variant over printk
      drm/amdgpu: Fix style issues in amdgpu_gem.c
      drm/amdgpu: Add -ENOMEM error handling when there is no memory
      drm/amd/display: Remove else after return in
'dm_vblank_get_counter' & 'amdgpu_dm_backlight_get_level'
      drm/amdgpu: Remove else after return in 'is_fru_eeprom_supported'
      drm/amdgpu: Update min() to min_t() in 'amdgpu_info_ioctl'
      drm/amdgpu: Use seq_puts() instead of seq_printf()
      drm/amdgpu: Fix ENOSYS means 'invalid syscall nr' in amdgpu_device.c
      drm/amdgpu: Fix no new typedefs for enum _AMDGPU_DOORBELL_*
      drm/amdgpu: Prefer dev_* variant over printk in amdgpu_atpx_handler.c
      drm/amdgpu: Move externs to amdgpu.h file from amdgpu_drv.c
      drm/amdgpu: Fix unnecessary else after return in 'amdgpu_eeprom_xfer'
      drm/radeon: Prefer strscpy over strlcpy in
'radeon_combios_get_power_modes'
      drm/amdgpu: Use parentheses for sizeof *numa_info in
'amdgpu_acpi_get_numa_info'
      drm/radeon: Remove unnecessary NULL test before kfree in
'radeon_connector_free_edid'
      drm/radeon: Fix ENOSYS with better fitting error codes in radeon_gem.=
c
      drm/amdgpu: Fix non-standard format specifiers in 'amdgpu_show_fdinfo=
'
      drm/radeon: Prefer strscpy over strlcpy calls in radeon_atombios.c
      drm/amdgpu: Cleanup amdgpu/amdgpu_cgs.c
      drm/amdgpu: Sort the includes in amdgpu/amdgpu_drv.c
      Revert "drm/radeon: Prefer dev_* variant over printk"
      drm/amdgpu: Move vram, gtt & flash defines to amdgpu_ ttm & _psp.h
      drm/amdgpu: Clean up style problems in mmhub_v2_3.c
      Revert "drm/amdgpu: Prefer dev_* variant over printk in
amdgpu_atpx_handler.c"
      drm/amdgpu: Prefer pr_err/_warn/_notice over printk in
amdgpu_atpx_handler.c
      drm/amdgpu: Fix identation issues in
'kgd_gfx_v9_program_trap_handler_settings'
      drm/amdgpu: Fix missing comment for mb() in 'amdgpu_device_aper_acces=
s'
      drm/radeon: Fix multiple line dereference in 'atom_iio_execute'
      drm/amdgpu: Fix identifier names to function definition
arguments in atom.h
      drm/amdgpu: Replace ternary operator with min() in 'amdgpu_iomem_read=
'
      drm/amd/display: Replace ternary operator with min() in
'dm_helpers_parse_edid_caps'
      drm/amdgpu: Replace ternary operator with min() in 'amdgpu_iomem_writ=
e'

Stanislav Lisovskiy (5):
      drm/i915: Don't preserve dpll_hw_state for slave crtc in Bigjoiner
      drm/i915: Fail if DSC compression requirement is less than
platform supports
      drm/i915: Add helper function for getting number of VDSC engines
      drm/i915: Don't rely that 2 VDSC engines are always enough for pixel =
rate
      drm/i915: Start using plane scale factor for relative data rate

Stanislaw Gruszka (5):
      accel/ivpu: Initial debugfs support
      accel/ivpu: Add firmware tracing support
      accel/ivpu: Add debugfs files for testing device reset
      accel/ivpu: Extend get_param ioctl to identify capabilities
      accel/ivpu: Add initial support for VPU 4

Stanley.Yang (3):
      drm/amdgpu: Enable aqua vanjaram RAS
      drm/amdgpu: Disable RAS by default on APU flatform
      drm/amdgpu: Check APU flag to disable RAS

Steven Price (2):
      drm: manager: Fix printk format for size_t
      drm: debugfs: Silence warning from cast

Stylon Wang (3):
      drm/amdgpu: Add dcdebugmask option to enable DPIA trace
      drm/amd/display: Add interface to enable DPIA trace
      drm/amd/display: Enable DPIA trace with DC debug mask

Sui Jingfeng (8):
      drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
      drm/drm_gem.c: Remove surplus else after return
      drm: Add kms driver for loongson display controller
      MAINTAINERS: add maintainers for DRM LOONGSON driver
      drm/hyperv: Fix a compilation issue because of not including screen_i=
nfo.h
      drm/loongson: Remove a useless check in cursor_plane_atomic_async_che=
ck()
      drm/drm_plane.h: fix grammar of the comment
      drm/mediatek: Fix potential memory leak if vmap() fail

Sumitra Sharma (1):
      drm/i915: Replace kmap() with kmap_local_page()

Suraj Kandpal (8):
      drm/i915/hdcp: Modify hdcp_gsc_message msg sending mechanism
      drm/i915/hdcp: Assign correct hdcp content type
      drm/i915/hdcp: Add a debug statement at hdcp2 capability check
      drm/i915/dsc: Move rc param calculation for native_420
      drm/i915/drm: Fix comment for YCbCr20 qp table declaration
      drm/i915/dsc: Add rc_range_parameter calculation for YCbCr420
      drm/i915/vdsc: Remove FIXME in intel_dsc_compute_config
      drm/i915/hotplug: Reduce SHPD_FILTER to 250us

Taimur Hassan (6):
      drm/amd/display: Skip enabling DMCUB when using emulation
      drm/amd/display: check TG is non-null before checking if enabled
      drm/amd/display: Fix ASIC check in aux timeout workaround
      drm/amd/display: Remove check for default eDP panel_mode
      drm/amd/display: Add symclk enable/disable during stream enable/disab=
le
      drm/amd/display: Fix typo in enable and disable symclk_se

Tao Zhou (3):
      drm/amdgpu: skip address adjustment for GFX RAS injection
      drm/amdgpu: add watchdog timer enablement for gfx_v9_4_3
      drm/amdgpu: add RAS fatal error handler for NBIO v7.9

Tejas Upadhyay (1):
      drm/i915/mtl: Update workaround 14018778641

Thierry Reding (3):
      dt-bindings: display: panel: Move HannStar HSD101PWW2 to LVDS
      dt-bindings: display: panel: Move Chunghwa CLAA070WP03XG to LVDS
      dt-bindings: display: panel: Document Hydis HV070WX2-1E0

Thomas Hellstr=C3=B6m (1):
      drm/ttm: Don't shadow the operation context

Thomas Zimmermann (158):
      drm/msm: Initialize mmap offset after constructing the buffer object
      drm: Remove struct drm_driver.gem_prime_mmap
      Merge drm/drm-next into drm-misc-next
      drm/amdgpu: Remove struct drm_driver.gem_prime_mmap
      drm: Enable PRIME import/export for all drivers
      drm: Clear fd/handle callbacks in struct drm_driver
      drm/prime: Unexport helpers for fd/handle conversion
      backlight/bd6107: Compare against struct fb_info.device
      backlight/bd6107: Rename struct bd6107_platform_data.fbdev to 'dev'
      backlight/gpio_backlight: Compare against struct fb_info.device
      backlight/gpio_backlight: Rename field 'fbdev' to 'dev'
      backlight/lv5207lp: Compare against struct fb_info.device
      backlight/lv5207lp: Rename struct lv5207lp_platform_data.fbdev to 'de=
v'
      fbdev/atyfb: Reorder backlight and framebuffer init/cleanup
      fbdev/atyfb: Use hardware device as backlight parent
      fbdev/aty128fb: Reorder backlight and framebuffer init/cleanup
      fbdev/aty128fb: Use hardware device as backlight parent
      fbdev/broadsheetfb: Call device_remove_file() with hardware device
      fbdev/ep93xx-fb: Alloc DMA memory from hardware device
      fbdev/ep93xx-fb: Output messages with fb_info() and fb_err()
      fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
      fbdev/fsl-diu-fb: Output messages with fb_*() helpers
      fbdev/mb862xxfb: Output messages with fb_dbg()
      fbdev/metronomefb: Use hardware device for dev_err()
      fbdev/nvidiafb: Reorder backlight and framebuffer init/cleanup
      fbdev/nvidiafb: Use hardware device as backlight parent
      fbdev/pxa168fb: Do not assign to struct fb_info.dev
      fbdev/radeonfb: Reorder backlight and framebuffer cleanup
      fbdev/radeonfb: Use hardware device as backlight parent
      fbdev/rivafb: Reorder backlight and framebuffer init/cleanup
      fbdev/rivafb: Use hardware device as backlight parent
      fbdev/sh7760fb: Use fb_dbg() in sh7760fb_get_color_info()
      fbdev/sh7760fb: Output messages with fb_dbg()
      fbdev/sh7760fb: Alloc DMA memory from hardware device
      fbdev/sh7760fb: Use hardware device with dev_() output during probe
      fbdev/sm501fb: Output message with fb_err()
      fbdev/smscufx: Detect registered fb_info from refcount
      fbdev/tdfxfb: Set i2c adapter parent to hardware device
      fbdev/core: Pass Linux device to pm_vt_switch_*() functions
      fbdev/core: Move framebuffer and backlight helpers into separate file=
s
      fbdev/core: Add fb_device_{create,destroy}()
      fbdev/core: Move procfs code to separate file
      fbdev/core: Move file-I/O code into separate file
      fbdev/core: Rework fb init code
      fbdev: Make support for userspace interfaces configurable
      drm/ast: Fix DRAM init on AST2200
      drm/ast: Remove vga2_clone field
      drm/ast: Implement register helpers in ast_drv.h
      drm/ast: Remove dead else branch in POST code
      drm/ast: Remove device POSTing and config from chip detection
      drm/ast: Set PCI config before accessing I/O registers
      drm/ast: Enable and unlock device access early during init
      drm/ast: Set up release action right after enabling MMIO
      drm/ast: Distinguish among chip generations
      drm/ast: Detect AST 1300 model
      drm/ast: Detect AST 1400 model
      drm/ast: Detect AST 2510 model
      drm/ast: Move widescreen and tx-chip detection into separate helpers
      drm/ast: Merge config and chip detection
      efi: Do not include <linux/screen_info.h> from EFI header
      fbdev/sm712fb: Do not include <linux/screen_info.h>
      sysfb: Do not include <linux/screen_info.h> from sysfb header
      staging/sm750fb: Do not include <linux/screen_info.h>
      fbdev/broadsheetfb: Select FB_SYS_HELPERS_DEFERRED
      fbdev/broadsheetfb: Generate deferred I/O ops
      fbdev/hecubafb: Select FB_SYS_HELPERS_DEFERRED
      fbdev/hecubafb: Generate deferred I/O ops
      fbdev/metronomefb: Select FB_SYS_HELPERS_DEFERRED
      fbdev/metronomefb: Generate deferred I/O ops
      fbdev/ssd1307fb: Select FB_SYS_HELPERS_DEFERRED
      fbdev/ssd1307fb: Generate deferred I/O ops
      fbdev/xen-fbfront: Select FB_SYS_HELPERS_DEFERRED
      fbdev/xen-fbfront: Generate deferred I/O ops
      fbdev/hyperv_fb: Include <linux/screen_info.h>
      Merge drm/drm-next into drm-misc-next
      drm: Remove flag FBINFO_DEFAULT from fbdev emulation
      fbdev: Remove FBINFO_DEFAULT from static structs
      fbdev: Remove FBINFO_DEFAULT from kzalloc()'ed structs
      fbdev: Remove FBINFO_DEFAULT from devm_kzalloc()'ed structs
      fbdev: Remove FBINFO_DEFAULT from framebuffer_alloc()'ed structs
      fbdev/fsl-diu-fb: Remove flag FBINFO_DEFAULT
      vfio-mdev: Remove flag FBINFO_DEFAULT from fbdev sample driver
      sh: mach-sh7763rdp: Assign FB_MODE_IS_UNKNOWN to struct fb_videomode.=
flag
      auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
      hid/picolcd: Remove flag FBINFO_FLAG_DEFAULT from fbdev driver
      media: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
      staging: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
      fbdev: Remove FBINFO_FLAG_DEFAULT from kzalloc()'ed structs
      fbdev: Remove FBINFO_FLAG_DEFAULT from framebuffer_alloc()'ed structs
      fbdev/atafb: Remove flag FBINFO_FLAG_DEFAULT
      fbdev/pxafb: Remove flag FBINFO_FLAG_DEFAULT
      fbdev: Remove FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT
      fbdev: Document that framebuffer_alloc() returns zero'ed data
      fbdev: Add fb_ops init macros for framebuffers in DMA-able memory
      drm/fbdev-dma: Use fbdev DMA helpers
      drm/tegra: Use fbdev DMA helpers
      drm/tegra: Set fbdev FBINFO_VIRTFB flag
      drm/tegra: Store pointer to vmap'ed framebuffer in screen_buffer
      drm/exynos: Use fbdev DMA helpers
      drm/exynos: Set fbdev FBINFO_VIRTFB flag
      drm/omapdrm: Set VM flags in GEM-object mmap function
      drm/omapdrm: Use GEM mmap for fbdev emulation
      drm/omapdrm: Set fbdev FBINFO_VIRTFB flag
      fbdev: Remove FB_DEFAULT_SYS_OPS
      fbdev: Harmonize some comments in <linux/fb.h>
      drm/ast: Do not enable PCI resources multiple times
      fbdev: Use _IOMEM_ infix for I/O-memory helpers
      fbdev: Use _SYSMEM_ infix for system-memory helpers
      fbdev: Use _DMAMEM_ infix for DMA-memory helpers
      fbdev: Align deferred I/O with naming of helpers
      fbdev/ps3fb: Build without kernel device
      media/vivid: Use fbdev I/O helpers
      fbdev/acornfb: Use fbdev I/O helpers
      fbdev/asiliantfb: Use fbdev I/O helpers
      fbdev/atmel_lcdfb: Use fbdev I/O helpers
      fbdev/aty128fb: Use fbdev I/O helpers
      fbdev/carminefb: Use fbdev I/O helpers
      fbdev/chipsfb: Use fbdev I/O helpers
      fbdev/da8xx-fb: Use fbdev I/O helpers
      fbdev/efifb: Use fbdev I/O helpers
      fbdev/fm2fb: Use fbdev I/O helpers
      fbdev/fsl-diu-fb: Use fbdev I/O helpers
      fbdev/g364fb: Use fbdev I/O helpers
      fbdev/geode/gx1fb: Use fbdev I/O helpers
      fbdev/geode/gxfb: Use fbdev I/O helpers
      fbdev/geode/lxfb: Use fbdev I/O helpers
      fbdev/goldfishfb: Use fbdev I/O helpers
      fbdev/grvga: Use fbdev I/O helpers
      fbdev/gxt4500: Use fbdev I/O helpers
      fbdev/i740fb: Use fbdev I/O helpers
      fbdev/imxfb: Use fbdev I/O helpers
      fbdev/kyro: Use fbdev I/O helpers
      fbdev/macfb: Use fbdev I/O helpers
      fbdev/maxinefb: Use fbdev I/O helpers
      fbdev/mb862xxfb: Use fbdev I/O helpers
      fbdev/mmpfb: Use fbdev I/O helpers
      fbdev/mx3fb: Use fbdev I/O helpers
      fbdev/ocfb: Use fbdev I/O helpers
      fbdev/offb: Use fbdev I/O helpers
      fbdev/omapfb: Use fbdev I/O helpers
      fbdev/platinumfb: Use fbdev I/O helpers
      fbdev/pmag-aa-fb: Use fbdev I/O helpers
      fbdev/pmag-ba-fb: Use fbdev I/O helpers
      fbdev/pmagb-b-fb: Use fbdev I/O helpers
      fbdev/pxa168fb: Use fbdev I/O helpers
      fbdev/pxafb: Use fbdev I/O helpers
      fbdev/q40fb: Use fbdev I/O helpers
      fbdev/s3cfb: Use fbdev I/O helpers
      fbdev/sh7760fb: Use fbdev I/O helpers
      fbdev/simplefb: Use fbdev I/O helpers
      fbdev/sstfb: Use fbdev I/O helpers
      fbdev/sunxvr1000: Use fbdev I/O helpers
      fbdev/sunxvr2500: Use fbdev I/O helpers
      fbdev/uvesafb: Use fbdev I/O helpers
      fbdev/valkyriefb: Use fbdev I/O helpers
      fbdev/vesafb: Use fbdev I/O helpers
      fbdev/xilinxfb: Use fbdev I/O helpers
      vfio-dev/mdpy-fb: Use fbdev I/O helpers

Tim Huang (3):
      drm/amd/pm: skip the RLC stop when S0i3 suspend for SMU v13.0.4/11
      drm/amd/pm: bump SMU v13.0.5 driver_if header version
      drm/amdgpu: skip fence GFX interrupts disable/enable for S0ix

Tom Rix (1):
      drm/mgag200: set variable mgag200_modeset
storage-class-specifier to static

Tomi Valkeinen (2):
      MAINTAINERS: Update info for TI display drivers
      drm/bridge: Add debugfs print for bridge chains

Tuo Li (1):
      drm/exynos: fix a possible null-pointer dereference due to data
race in exynos_drm_crtc_atomic_disable()

Tvrtko Ursulin (8):
      drm/i915: Remove some dead "code"
      drm/i915: Remove dead code from gen8_pte_encode
      drm/i915: Fix one wrong caching mode enum usage
      drm/i915: Move setting of rps thresholds to init
      drm/i915: Record default rps threshold values
      drm/i915: Add helpers for managing rps thresholds
      drm/i915: Expose RPS thresholds in sysfs
      drm/i915: Use the i915_vma_flush_writes helper

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Consider OA buffer boundary when zeroing out reports

Umio Yasuno (1):
      drm/amdgpu/pm: fix throttle_status for other than MP1 11.0.7

Uros Bizjak (1):
      drm/amdgpu: Use local64_try_cmpxchg in amdgpu_perf_read

Uwe Kleine-K=C3=B6nig (30):
      drm/komeda: Convert to platform remove callback returning void
      drm/arm/hdlcd: Convert to platform remove callback returning void
      drm/arm/malidp: Convert to platform remove callback returning void
      drm/aspeed: Convert to platform remove callback returning void
      drm/atmel-hlcdc: Convert to platform remove callback returning void
      drm/fsl-dcu: Convert to platform remove callback returning void
      drm/hisilicon: Convert to platform remove callback returning void
      drm/lima: Convert to platform remove callback returning void
      drm/logicvc: Convert to platform remove callback returning void
      drm/mcde: Convert to platform remove callback returning void
      drm/meson: Convert to platform remove callback returning void
      drm/mxsfb: Convert to platform remove callback returning void
      drm/panel: Convert to platform remove callback returning void
      drm/panfrost: Convert to platform remove callback returning void
      drm/rockchip: Convert to platform remove callback returning void
      drm/sti: Convert to platform remove callback returning void
      drm/stm: Convert to platform remove callback returning void
      drm/sun4i: Convert to platform remove callback returning void
      drm/tidss: Convert to platform remove callback returning void
      drm/tiny: Convert to platform remove callback returning void
      drm/tve200: Convert to platform remove callback returning void
      drm/v3d: Convert to platform remove callback returning void
      drm/vc4: Convert to platform remove callback returning void
      drm/xlnx/zynqmp_dpsub: Convert to platform remove callback returning =
void
      drm/rcar-du: Convert to platform remove callback returning void
      drm/tilcdc: Convert to platform remove callback returning void
      drm/omap: Convert to platform remove callback returning void
      drm/i2c: Switch i2c drivers back to use .probe()
      drm/i915: Simplify expression &to_i915(dev)->drm
      drm/mediatek: Convert to platform remove callback returning void

Victor Lu (2):
      drm/amdgpu: Add RLCG interface driver implementation for gfx v9.4.3 (=
v3)
      drm/amdgpu: Fix infinite loop in gfxhub_v1_2_xcc_gart_enable (v2)

Ville Syrj=C3=A4l=C3=A4 (39):
      drm/i915/dsi: Do panel power on + reset deassert earlier on icl+
      drm/i915/dsi: Do display on sequence later on icl+
      drm/i915/dsi: Print the VBT MIPI sequence delay duration
      drm/i915/dsi: Split icl+ D-PHY vs. DSI timing steps
      drm/i915/dsi: Gate DSI clocks earlier
      drm/i915/dsi: Respect power cycle delay on icl+
      drm/i915/dsi: Implement encoder->shutdown() for icl+
      drm/i915/dsi: Move most things from .disable() into
.post_disable() on icl+
      drm/i915/dsi: Do DSC/scaler disable earlier on icl+
      drm/i915/dsi: Respect power_off_delay on icl+
      drm/i915/dsi: Move panel reset+power off to be the last thing
      drm/i915/dsi: Grab the crtc from the customary place
      drm/i915/dsi: Remove weird has_pch_encoder asserts
      drm/i915: Re-init clock gating on coming out of PC8+
      drm/i915/psr: Fix BDW PSR AUX CH data register offsets
      drm/i915/psr: Wrap PSR1 register with functions
      drm/i915/psr: Reintroduce HSW PSR1 registers
      drm/i915/psr: Bring back HSW/BDW PSR AUX CH registers/setup
      drm/i915/psr: HSW/BDW have no PSR2
      drm/i915/psr: Restore PSR interrupt handler for HSW
      drm/i915/psr: Implement WaPsrDPAMaskVBlankInSRD:hsw
      drm/i915/psr: Implement WaPsrDPRSUnmaskVBlankInSRD:hsw
      drm/i915/psr: Do no mask display register writes on hsw/bdw
      drm/i915/psr: Don't skip both TP1 and TP2/3 on hsw/bdw
      drm/i915/psr: Allow PSR with sprite enabled on hsw/bdw
      drm/i915/psr: Re-enable PSR1 on hsw/bdw
      drm/i915: Remove bogus DDI-F from hsw/bdw output init
      drm/i915: Introduce device info port_mask
      drm/i915: Assert that device info bitmasks have enough bits
      drm/i915: Assert that the port being initialized is valid
      drm/i915: Beef up SDVO/HDMI port checks
      drm/i915: Init DDI outputs based on port_mask on skl+
      drm/i915: Convert HSW/BDW to use port_mask for DDI probe
      drm/i915: Initialize dig_port->aux_ch to NONE to be sure
      drm/i915: Only populate aux_ch if really needed
      drm/i915: Remove DDC pin sanitation
      drm/i915: Remove AUX CH sanitation
      drm/i915/bios: Extract intel_bios_encoder_port()
      drm/i915: Try to initialize DDI/ICL+ DSI ports for every VBT child de=
vice

Vinay Belgaumkar (3):
      drm/i915/guc/slpc: Apply min softlimit correctly
      drm/i915/guc: Dump perf_limit_reasons for debug
      drm/i915/guc/slpc: Restore efficient freq earlier

Wang Jianzheng (1):
      drm/panel: s6d7aa0: remove the unneeded variable in s6d7aa0_lock

Wang Ming (1):
      drm: xlnx: zynqmp_dpsub: Use dev_err_probe instead of dev_err

Wayne Lin (1):
      drm/amd/display: Add polling method to handle MST reply packet

Wenjing Liu (12):
      drm/amd/display: Refactor recout calculation with a more generic form=
ula
      drm/amd/display: Update DPG test pattern programming
      drm/amd/display: fix a regression in blank pixel data caused by
coding mistake
      drm/amd/display: support plane clip with zero recout size
      drm/amd/display: always acquire MPO pipe for every blending tree
      drm/amd/display: update add plane to context logic with a new algorit=
hm
      drm/amd/display: adjust visual confirm dpp height offset to be
1/240 of v addressable
      drm/amd/display: do not treat clip_rect size change as a scaling chan=
ge
      drm/amd/display: move idle pipe allocation logic into dcn specific la=
yer
      drm/amd/display: rename acquire_idle_pipe_for_layer to
acquire_free_pipe_as_sec_dpp_pipe
      drm/amd/display: fix incorrect stream_res allocation for older ASIC
      drm/amd/display: implement pipe type definition and adding accessors

Wenyou Yang (1):
      drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to acquire gpu_metrics

Wesley Chalmers (4):
      drm/amd/display: Do not set drr on pipe commit
      drm/amd/display: Block optimize on consecutive FAMS enables
      drm/amd/display: Fix a bug when searching for insert_above_mpcc
      drm/amd/display: Make mpc32 functions available to future DCNs

Xiaogang Chen (1):
      drm/amdgpu: have bos for PDs/PTS cpu accessible when kfd uses
cpu to update vm

Xiongfeng Wang (1):
      drm/amd: Use pci_dev_id() to simplify the code

Yang Li (2):
      drm/amdgpu: Fix one kernel-doc comment
      drm/tegra: dpaux: Use devm_platform_ioremap_resource()

Yang Wang (6):
      drm/amd/pm: fix smu i2c data read risk
      drm/amd/pm: disbale dcefclk device sysnode on GFX v9.4.3 chip
      drm/amd/pm: fix pp_dpm_sclk node not displaying correctly
      drm/amd/pm: fix variable dereferenced issue in amdgpu_device_attr_cre=
ate()
      drm/amd/pm: update smu_v13_0_6 message vf flag
      drm/amd/pm: avoid driver getting empty metrics table for the first ti=
me

Yangtao Li (6):
      drm/tegra: dpaux: Fix incorrect return value of platform_get_irq
      drm/tegra: hdmi: Convert to devm_platform_ioremap_resource()
      drm/tegra: sor: Convert to devm_platform_ioremap_resource()
      gpu: ipu-v3: pre: Convert to devm_platform_ioremap_resource()
      gpu: ipu-v3: prg: Convert to devm_platform_ioremap_resource()
      drm/renesas: Convert to devm_platform_ioremap_resource()

YiPeng Chai (1):
      drm/amdgpu: mode1 reset needs to recover mp1 for mp0 v13_0_10

Yonggang Wu (1):
      drm/radeon: Fix format error

YuanShang (1):
      drm/amdgpu: load sdma ucode in the guest machine

Yue Haibing (1):
      drm/ttm: Remove two unused function declarations

Yueh-Shun Li (1):
      drm/amd/display: fix comment typo

Zhanjun Dong (1):
      drm/i915/mtl: Update cache coherency setting for context structure

Zheng Zengkai (1):
      drm/radeon: Use pci_dev_id() to simplify the code

Zhigang Luo (2):
      drm/amdgpu: remove SRIOV VF FB location programming
      drm/amdgpu: init TA microcode for SRIOV VF when MP0 IP is 13.0.6

Zhikai Zhai (2):
      drm/amd/display: refine to decide the verified link setting
      drm/amd/display: Disable MPC split by default on special asic

Zhu Wang (4):
      drm/bridge: fix -Wunused-const-variable=3D warning
      drm/tve200: remove redundant of_match_ptr
      drm/mcde: remove redundant of_match_ptr
      drm/exynos: remove redundant of_match_ptr

gaba (1):
      drm/amdgpu: avoid restore process run into dead loop.

sguttula (2):
      drm/amdgpu: allow secure submission on VCN4 ring
      drm/amdgpu: Enabling FW workaround through shared memory for VCN4_0_2

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |   24 +-
 .../bindings/display/bridge/toshiba,tc358767.yaml  |    3 +
 .../bindings/display/msm/dp-controller.yaml        |    1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |    6 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   11 +
 .../devicetree/bindings/display/msm/gpu.yaml       |    6 +
 .../bindings/display/msm/mdss-common.yaml          |    6 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |    5 +-
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     |  213 +++
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |    7 -
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |    7 -
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |    6 +
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |    8 +
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |    8 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    1 +
 .../bindings/display/panel/panel-lvds.yaml         |    6 +
 .../bindings/display/panel/panel-simple.yaml       |    6 +-
 .../bindings/display/panel/sitronix,st7789v.yaml   |   13 +-
 .../display/panel/startek,kd070fhfid015.yaml       |   69 +
 .../bindings/display/panel/visionox,r66451.yaml    |   59 +
 .../bindings/display/solomon,ssd1307fb.yaml        |   28 +-
 .../bindings/display/ti/ti,am65x-dss.yaml          |   18 +-
 .../devicetree/bindings/input/elan,ekth6915.yaml   |    5 +
 .../devicetree/bindings/input/goodix,gt7375p.yaml  |    5 +
 .../devicetree/bindings/input/hid-over-i2c.yaml    |    2 +
 .../bindings/input/touchscreen/touchscreen.yaml    |    7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/gpu/amdgpu/flashing.rst              |   33 +
 Documentation/gpu/amdgpu/index.rst                 |    1 +
 Documentation/gpu/driver-uapi.rst                  |   11 +
 Documentation/gpu/drm-mm.rst                       |   52 +-
 Documentation/gpu/rfc/i915_scheduler.rst           |    4 +
 Documentation/gpu/todo.rst                         |   69 +-
 MAINTAINERS                                        |   20 +-
 arch/arm/kernel/efi.c                              |    2 +
 arch/arm64/kernel/efi.c                            |    1 +
 arch/loongarch/kernel/efi.c                        |    1 +
 arch/sh/boards/mach-ecovec24/setup.c               |    2 +-
 arch/sh/boards/mach-kfr2r09/setup.c                |    2 +-
 arch/sh/boards/mach-sh7763rdp/setup.c              |    2 +-
 arch/x86/Makefile                                  |    2 +-
 arch/x86/video/Makefile                            |    2 +-
 drivers/Kconfig                                    |    2 -
 drivers/accel/ivpu/Makefile                        |    7 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |  294 +++
 drivers/accel/ivpu/ivpu_debugfs.h                  |   13 +
 drivers/accel/ivpu/ivpu_drv.c                      |   49 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   24 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  107 +-
 drivers/accel/ivpu/ivpu_fw.h                       |    4 +
 drivers/accel/ivpu/ivpu_fw_log.c                   |  142 ++
 drivers/accel/ivpu/ivpu_fw_log.h                   |   38 +
 drivers/accel/ivpu/ivpu_gem.c                      |   10 +-
 drivers/accel/ivpu/ivpu_hw.h                       |   13 +-
 .../accel/ivpu/{ivpu_hw_mtl.c =3D> ivpu_hw_37xx.c}   |  496 +++--
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |  281 +++
 drivers/accel/ivpu/ivpu_hw_40xx.c                  | 1178 ++++++++++++
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |  267 +++
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h               |  281 ---
 drivers/accel/ivpu/ivpu_job.c                      |    4 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |   98 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |  302 ++-
 drivers/accel/ivpu/ivpu_mmu_context.h              |    9 +-
 drivers/accel/ivpu/ivpu_pm.c                       |    1 +
 drivers/accel/ivpu/ivpu_pm.h                       |    1 +
 drivers/accel/qaic/qaic_data.c                     |    4 +-
 drivers/accel/qaic/qaic_drv.c                      |    1 -
 drivers/auxdisplay/cfag12864bfb.c                  |    1 -
 drivers/auxdisplay/ht16k33.c                       |    1 -
 drivers/dma-buf/dma-buf-sysfs-stats.c              |    2 +-
 drivers/dma-buf/dma-buf.c                          |   17 +-
 drivers/dma-buf/heaps/cma_heap.c                   |    3 -
 drivers/dma-buf/heaps/system_heap.c                |    3 -
 drivers/dma-buf/udmabuf.c                          |    2 -
 drivers/firmware/efi/libstub/efi-stub-entry.c      |    2 +
 drivers/firmware/efi/libstub/screen_info.c         |    2 +
 drivers/gpu/drm/Kconfig                            |   34 +-
 drivers/gpu/drm/Makefile                           |    4 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   14 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   16 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.h   |   27 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |  167 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  300 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   71 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |   76 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  211 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |   78 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  338 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |   50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c   |  230 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  138 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |   39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  118 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.h     |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  115 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  240 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  184 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  102 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h       |    9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   59 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    1 +
 .../{aqua_vanjaram_reg_init.c =3D> aqua_vanjaram.c}  |    2 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |   14 +-
 drivers/gpu/drm/amd/amdgpu/atom.h                  |   25 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |    3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   30 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   37 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  202 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   28 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   28 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   39 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  126 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    7 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   20 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    9 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   42 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   37 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   52 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   54 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   87 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   66 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   10 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |  769 ++++++++
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.h               |   28 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  190 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   11 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   12 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    4 +-
 .../fb/ramga102.c =3D> amd/amdgpu/mmsch_v4_0_3.h}    |   31 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |    2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  270 +++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.h             |    1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   66 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   27 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   27 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    4 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |   66 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   42 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   17 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   31 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  288 ++-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   10 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |    1 -
 drivers/gpu/drm/amd/amdkfd/Makefile                |    4 -
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  793 ++++----
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |    5 +
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   57 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   73 -
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   31 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |   16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   45 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   57 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    6 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_cik.c  |   81 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v10.c  |    2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_vi.c   |  133 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  233 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   82 -
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   51 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |  356 ----
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.h             |   84 -
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   36 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   56 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   35 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  128 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  132 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    3 +
 drivers/gpu/drm/amd/display/Kconfig                |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  280 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   14 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   14 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  253 ++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   35 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   42 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   15 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   45 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |   11 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |  183 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |   46 +
 drivers/gpu/drm/amd/display/dc/basics/conversion.c |    2 +-
 drivers/gpu/drm/amd/display/dc/basics/vector.c     |   11 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   20 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   56 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    3 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    1 -
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |   26 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   50 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |   18 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    9 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |    7 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h       |    1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  266 ++-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    1 +
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |   23 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 1136 +++++++-----
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   38 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   50 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   57 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    3 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   29 +
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |    2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   56 +-
 drivers/gpu/drm/amd/display/dc/dce/Makefile        |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |    6 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |   69 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |   16 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c    |   16 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |    6 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   28 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |   46 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |    6 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  303 ++++
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |   58 +
 .../drm/amd/display/dc/dce100/dce100_resource.c    |    2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   13 +-
 .../drm/amd/display/dc/dce110/dce110_resource.c    |   14 +-
 .../display/dc/dce110/dce110_timing_generator.c    |    4 +-
 .../amd/display/dc/dce112/dce112_hw_sequencer.c    |    2 +-
 .../drm/amd/display/dc/dce112/dce112_resource.c    |    4 +-
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |    4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |   21 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |    5 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   17 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   76 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   50 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |    7 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   15 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h  |    1 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    7 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   30 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   10 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    8 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    3 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |   49 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |    5 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    2 +-
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |    2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |    4 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   19 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    1 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   42 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |    5 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    3 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   28 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |   61 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  194 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    8 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   36 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |    2 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dce_calcs.c   |    2 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    2 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |    2 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    6 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    6 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   25 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    6 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   38 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    9 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   66 +-
 drivers/gpu/drm/amd/display/dc/gpio/ddc_regs.h     |   40 +-
 drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h     |   10 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   57 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |    6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/aux_engine.h |    2 -
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   15 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    2 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   18 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |  231 ++-
 .../amd/display/dc/irq/dcn314/irq_service_dcn314.c |    7 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile       |    3 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |  111 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    5 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.h   |    3 +
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c  |  200 ++
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h  |   37 +
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |   32 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.h    |   28 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    |  229 +++
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h    |   33 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    3 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   28 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    8 +
 .../gpu/drm/amd/display/dc/link/link_validation.c  |    8 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |   84 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.h   |   14 +
 .../display/dc/link/protocols/link_dp_capability.c |   32 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |   66 +
 .../display/dc/link/protocols/link_dp_training.c   |    9 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |  295 ++-
 .../dc/link/protocols/link_edp_panel_control.c     |  245 ++-
 .../dc/link/protocols/link_edp_panel_control.h     |    9 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    7 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  565 ++++++
 .../drm/amd/display/dmub/inc/dmub_subvp_state.h    |  183 --
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    8 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |    2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   31 +-
 .../drm/amd/display/include/ddc_service_types.h    |    1 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |    5 +-
 .../drm/amd/display/include/link_service_types.h   |    2 +-
 .../drm/amd/display/modules/color/color_gamma.c    |    5 +-
 .../amd/display/modules/info_packet/info_packet.c  |    5 +
 .../drm/amd/display/modules/power/power_helpers.c  |    5 +
 .../drm/amd/display/modules/power/power_helpers.h  |    2 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |    5 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |    5 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_offset.h    |    4 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   |    5 +-
 .../amd/include/asic_reg/nbio/nbio_7_9_0_sh_mask.h |    8 +
 .../amd/include/asic_reg/oss/osssys_6_1_0_offset.h |  279 +++
 .../include/asic_reg/oss/osssys_6_1_0_sh_mask.h    | 1019 +++++++++++
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    9 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   72 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    4 +-
 drivers/gpu/drm/amd/include/yellow_carp_offset.h   |    6 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  373 ++--
 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |    3 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h   |   21 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   48 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h       |    3 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h   |   63 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   16 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ci_baco.c   |   21 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/common_baco.c   |    2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c |   24 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c     |    6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/polaris_baco.c  |   30 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h    |    6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h  |    3 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h |   14 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h  |    3 +-
 .../drm/amd/pm/powerplay/hwmgr/processpptables.c   |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   16 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   32 +-
 .../drm/amd/pm/powerplay/hwmgr/smu7_powertune.c    |   15 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c    |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h    |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/tonga_baco.c    |   30 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_baco.c   |   26 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   11 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_powertune.c  |   89 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_pptable.h    |   18 +-
 .../pm/powerplay/hwmgr/vega10_processpptables.c    |    6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c   |   12 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   12 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.h  |    3 +-
 .../drm/amd/pm/powerplay/hwmgr/vega12_pptable.h    |   11 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |    7 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   32 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h  |    6 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_pptable.h    |   19 +-
 .../gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h |    3 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |    8 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/pp_thermal.h  |    6 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu7.h        |    6 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h       |   22 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h       |   45 +-
 .../gpu/drm/amd/pm/powerplay/inc/smu73_discrete.h  |   73 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu75.h       |   12 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h |   42 +-
 .../gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h  |   20 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c  |    2 +-
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |    2 +-
 .../drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   23 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   37 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_5.h |    3 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h  |    6 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    8 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h   |   15 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |   21 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    7 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |   14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   28 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  121 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   13 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   36 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   10 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   99 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   13 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  134 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  109 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   11 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    8 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    4 +-
 drivers/gpu/drm/arm/Kconfig                        |    1 +
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   22 +-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |   58 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |   11 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |    3 +
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    5 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |    6 +-
 drivers/gpu/drm/armada/Kconfig                     |    2 +-
 drivers/gpu/drm/armada/armada_drv.c                |    2 -
 drivers/gpu/drm/armada/armada_fbdev.c              |    2 +-
 drivers/gpu/drm/armada/armada_overlay.c            |    6 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    6 +-
 drivers/gpu/drm/ast/ast_dp.c                       |   11 +
 drivers/gpu/drm/ast/ast_dp501.c                    |   43 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  100 +-
 drivers/gpu/drm/ast/ast_main.c                     |  298 +--
 drivers/gpu/drm/ast/ast_mm.c                       |    2 -
 drivers/gpu/drm/ast/ast_mode.c                     |  122 +-
 drivers/gpu/drm/ast/ast_post.c                     |   74 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   25 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    6 +-
 drivers/gpu/drm/bridge/Kconfig                     |   20 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |    1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   11 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |    2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |    4 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  122 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |    2 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |    3 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   80 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |    2 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c   |    9 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.h   |    2 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |    2 +-
 drivers/gpu/drm/bridge/display-connector.c         |    1 -
 drivers/gpu/drm/bridge/fsl-ldb.c                   |    1 -
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |    2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    1 +
 drivers/gpu/drm/bridge/ite-it6505.c                |  128 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    1 -
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    6 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |    1 -
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |    1 -
 drivers/gpu/drm/bridge/parade-ps8640.c             |   79 -
 drivers/gpu/drm/bridge/samsung-dsim.c              |    5 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   40 +
 drivers/gpu/drm/bridge/sil-sii8620.c               |    2 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |    3 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |   37 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   49 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   30 +-
 drivers/gpu/drm/bridge/tc358762.c                  |   63 +-
 drivers/gpu/drm/bridge/tc358764.c                  |   14 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   31 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   45 +-
 drivers/gpu/drm/display/drm_hdcp_helper.c          |    4 +-
 drivers/gpu/drm/drm_atomic_helper.c                |    2 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |   58 +-
 drivers/gpu/drm/drm_bridge.c                       |   46 +
 drivers/gpu/drm/drm_bridge_connector.c             |   13 +-
 drivers/gpu/drm/drm_buddy.c                        |    8 +-
 drivers/gpu/drm/drm_connector.c                    |    8 +-
 drivers/gpu/drm/drm_debugfs.c                      |   42 +
 drivers/gpu/drm/drm_drv.c                          |    8 +-
 drivers/gpu/drm/drm_edid.c                         |    3 +-
 drivers/gpu/drm/drm_exec.c                         |  333 ++++
 drivers/gpu/drm/drm_fbdev_dma.c                    |   11 +-
 drivers/gpu/drm/drm_fbdev_generic.c                |    7 +-
 drivers/gpu/drm/drm_gem.c                          |    7 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    4 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  210 +--
 drivers/gpu/drm/drm_gpuva_mgr.c                    | 1723 ++++++++++++++++=
++
 drivers/gpu/drm/drm_internal.h                     |    2 +
 drivers/gpu/drm/drm_ioctl.c                        |    5 +-
 drivers/gpu/drm/drm_managed.c                      |    2 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |   17 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    1 +
 drivers/gpu/drm/drm_mode_object.c                  |    4 +-
 drivers/gpu/drm/drm_panel.c                        |  218 ++-
 drivers/gpu/drm/drm_plane_helper.c                 |   12 +-
 drivers/gpu/drm/drm_prime.c                        |   83 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   68 +-
 drivers/gpu/drm/drm_syncobj.c                      |  148 +-
 drivers/gpu/drm/drm_sysfs.c                        |   23 +-
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |   11 +-
 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c           |    3 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    7 +-
 drivers/gpu/drm/etnaviv/etnaviv_dump.c             |   14 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h              |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    3 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |  190 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |   13 +-
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c             |   63 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |    3 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    5 +-
 drivers/gpu/drm/exynos/Kconfig                     |    2 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |    2 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |    1 -
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |    3 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    3 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |    1 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |    2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |    1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    6 +-
 drivers/gpu/drm/gma500/Kconfig                     |    2 +-
 drivers/gpu/drm/gma500/fbdev.c                     |    6 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    1 -
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    6 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    7 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    1 +
 drivers/gpu/drm/i2c/ch7006_drv.c                   |    2 +-
 drivers/gpu/drm/i2c/sil164_drv.c                   |    2 +-
 drivers/gpu/drm/i915/Kconfig                       |    2 +-
 drivers/gpu/drm/i915/Makefile                      |    4 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    8 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   23 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  139 +-
 drivers/gpu/drm/i915/display/icl_dsi.h             |    4 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |    7 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  188 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    6 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   26 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   27 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    7 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    2 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   13 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    3 -
 drivers/gpu/drm/i915/display/intel_ddi.c           |  113 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    4 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   38 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  113 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    4 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   11 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    6 +-
 .../gpu/drm/i915/display/intel_display_device.c    |  203 ++-
 .../gpu/drm/i915/display/intel_display_device.h    |    8 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |    2 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  102 +-
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    7 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   49 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |   29 +-
 .../drm/i915/display/intel_display_power_well.h    |    1 -
 drivers/gpu/drm/i915/display/intel_dp.c            |   17 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   53 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |    3 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   29 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |   20 +
 drivers/gpu/drm/i915/display/intel_dsi.h           |    2 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    2 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |   64 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   10 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   46 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |   28 -
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    5 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   81 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |    3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   75 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |   18 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    4 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    5 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  206 ++-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   16 +
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |   10 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   22 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  214 ++-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |    1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    6 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   23 -
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |    2 -
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   25 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   71 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   30 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   38 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   13 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |    2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |   12 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |    2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   12 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |    2 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    8 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  154 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   20 +-
 drivers/gpu/drm/i915/gt/intel_gt_defines.h         |   11 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    8 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  108 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |    5 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |    4 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   16 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |   10 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |    4 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    3 -
 drivers/gpu/drm/i915/gt/intel_ring.c               |    3 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   83 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |    4 +
 drivers/gpu/drm/i915/gt/intel_sa_media.c           |    2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    2 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c                |  159 ++
 drivers/gpu/drm/i915/gt/intel_tlb.h                |   29 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  161 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |    5 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |    2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |    4 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |    6 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |    2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |    2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |    4 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |    3 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |    3 +-
 .../gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h  |   75 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |  341 +++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h          |    5 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |  141 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h          |   21 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c  |   39 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h  |   14 +
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h  |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   11 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |    4 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   10 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |   16 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c      |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |  131 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |    4 +
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |    6 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    1 +
 drivers/gpu/drm/i915/i915_driver.c                 |    6 +-
 drivers/gpu/drm/i915/i915_drv.h                    |  106 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   10 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |    3 +
 drivers/gpu/drm/i915/i915_irq.c                    |   94 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   64 +-
 drivers/gpu/drm/i915/i915_perf.c                   |    2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   27 +-
 drivers/gpu/drm/i915/i915_request.c                |    4 +-
 drivers/gpu/drm/i915/i915_trace.h                  |   10 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   43 +-
 drivers/gpu/drm/i915/i915_vma.h                    |    7 +
 drivers/gpu/drm/i915/intel_clock_gating.c          |   15 +-
 drivers/gpu/drm/i915/intel_device_info.c           |   48 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   11 +-
 drivers/gpu/drm/i915/intel_step.c                  |   10 +-
 drivers/gpu/drm/i915/intel_uncore.c                |   44 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    5 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |    5 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |    5 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |    2 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |   31 +
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |   16 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    6 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |    2 +-
 drivers/gpu/drm/i915/soc/intel_gmch.c              |    4 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |   18 +-
 drivers/gpu/drm/imx/dcss/dcss-dev.c                |    5 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |    1 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |   11 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    2 +-
 drivers/gpu/drm/ingenic/Kconfig                    |    2 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |    2 +-
 drivers/gpu/drm/lima/lima_drv.c                    |   11 +-
 drivers/gpu/drm/lima/lima_gem.c                    |    8 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |    8 +-
 drivers/gpu/drm/loongson/Kconfig                   |   17 +
 drivers/gpu/drm/loongson/Makefile                  |   22 +
 drivers/gpu/drm/loongson/loongson_device.c         |  102 ++
 drivers/gpu/drm/loongson/loongson_module.c         |   33 +
 drivers/gpu/drm/loongson/loongson_module.h         |   12 +
 drivers/gpu/drm/loongson/lsdc_benchmark.c          |  133 ++
 drivers/gpu/drm/loongson/lsdc_benchmark.h          |   13 +
 drivers/gpu/drm/loongson/lsdc_crtc.c               | 1024 +++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c            |  110 ++
 drivers/gpu/drm/loongson/lsdc_drv.c                |  456 +++++
 drivers/gpu/drm/loongson/lsdc_drv.h                |  388 ++++
 drivers/gpu/drm/loongson/lsdc_gem.c                |  311 ++++
 drivers/gpu/drm/loongson/lsdc_gem.h                |   37 +
 drivers/gpu/drm/loongson/lsdc_gfxpll.c             |  199 ++
 drivers/gpu/drm/loongson/lsdc_gfxpll.h             |   52 +
 drivers/gpu/drm/loongson/lsdc_i2c.c                |  179 ++
 drivers/gpu/drm/loongson/lsdc_i2c.h                |   29 +
 drivers/gpu/drm/loongson/lsdc_irq.c                |   74 +
 drivers/gpu/drm/loongson/lsdc_irq.h                |   16 +
 drivers/gpu/drm/loongson/lsdc_output.h             |   21 +
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c      |  178 ++
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c      |  552 ++++++
 drivers/gpu/drm/loongson/lsdc_pixpll.c             |  481 +++++
 drivers/gpu/drm/loongson/lsdc_pixpll.h             |   86 +
 drivers/gpu/drm/loongson/lsdc_plane.c              |  793 ++++++++
 drivers/gpu/drm/loongson/lsdc_probe.c              |   56 +
 drivers/gpu/drm/loongson/lsdc_probe.h              |   12 +
 drivers/gpu/drm/loongson/lsdc_regs.h               |  406 +++++
 drivers/gpu/drm/loongson/lsdc_ttm.c                |  593 ++++++
 drivers/gpu/drm/loongson/lsdc_ttm.h                |   99 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |    8 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |    8 +-
 drivers/gpu/drm/mediatek/Kconfig                   |    1 +
 drivers/gpu/drm/mediatek/mtk_cec.c                 |    5 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |   14 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |   14 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |    9 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |    9 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |    9 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |    9 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |    9 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  366 ++--
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  105 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |    8 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |   16 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   19 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |    6 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |    6 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    6 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |    2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |    5 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |    6 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |    8 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    6 +-
 drivers/gpu/drm/meson/meson_drv.h                  |    1 -
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   13 +-
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    3 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |    1 -
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |    4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    2 +-
 drivers/gpu/drm/msm/Kconfig                        |    2 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   10 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   10 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |    3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   50 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  219 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   19 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  308 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   69 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  156 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  347 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  369 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  434 +++--
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  473 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  223 +++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  453 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  202 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  106 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  207 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  104 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  113 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  439 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  264 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  511 ++++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  467 +++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  492 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  161 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |   35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  109 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    2 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   18 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  251 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   60 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  106 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |    7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  112 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   39 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |    2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   23 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |    3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |    2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |    3 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |    2 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |    2 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |    2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    9 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    2 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |    3 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   45 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   11 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |    6 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   65 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   15 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   15 -
 drivers/gpu/drm/msm/msm_gem_submit.c               |   79 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   67 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   32 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   88 +-
 drivers/gpu/drm/msm/msm_mdss.h                     |   27 +
 drivers/gpu/drm/msm/msm_rd.c                       |    8 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   15 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    7 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    6 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |    9 +
 drivers/gpu/drm/nouveau/Kbuild                     |    3 +
 drivers/gpu/drm/nouveau/Kconfig                    |    2 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |    9 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |   25 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    2 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h      |   26 +-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h         |   19 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/engine.h |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/os.h     |    5 -
 .../gpu/drm/nouveau/include/nvkm/engine/falcon.h   |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h  |   20 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   24 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |   42 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  219 ++-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    3 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   22 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h             |    1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    7 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |   39 +
 drivers/gpu/drm/nouveau/nouveau_display.c          |   17 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c              |    7 +-
 drivers/gpu/drm/nouveau/nouveau_dma.h              |    8 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    9 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |    3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   30 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   93 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |    3 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |  424 +++++
 drivers/gpu/drm/nouveau/nouveau_exec.h             |   54 +
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   23 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |    5 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   92 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h              |    3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |    5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c            |   13 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  441 +++++
 drivers/gpu/drm/nouveau/nouveau_sched.h            |  127 ++
 drivers/gpu/drm/nouveau/nouveau_svm.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             | 1917 ++++++++++++++++=
++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |  108 ++
 drivers/gpu/drm/nouveau/nouveau_vmm.c              |    4 +-
 drivers/gpu/drm/nouveau/nvif/mmu.c                 |    3 +
 drivers/gpu/drm/nouveau/nvif/vmm.c                 |  100 +-
 drivers/gpu/drm/nouveau/nvkm/core/intr.c           |    4 +-
 drivers/gpu/drm/nouveau/nvkm/core/object.c         |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c     |   10 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c     |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |   32 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c   |  105 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h    |    6 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c      |   15 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c     |    7 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |   14 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h     |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h      |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h      |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c    |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c      |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h      |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c      |   12 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c     |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c     |   17 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c     |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h       |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c  |   30 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c     |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c     |  214 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |  197 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      |   25 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |   16 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c  |   27 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |    2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |    5 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |    6 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |    6 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |    5 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |    5 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |    5 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |    9 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   20 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   16 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   24 +-
 drivers/gpu/drm/omapdrm/omap_gem.h                 |    3 -
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |    9 +-
 drivers/gpu/drm/panel/Kconfig                      |   23 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |    3 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |    2 +-
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |    1 -
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |    1 -
 drivers/gpu/drm/panel/panel-dsi-cm.c               |    2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    2 +
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |    1 -
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |    2 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |    2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |    3 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  196 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |    3 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |    1 -
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |    2 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |    1 -
 drivers/gpu/drm/panel/panel-lvds.c                 |    8 +-
 .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    |    1 -
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |    2 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |    2 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |    3 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |    2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |    1 -
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |    2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |    2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |    1 -
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |    1 -
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |    1 -
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |    1 -
 drivers/gpu/drm/panel/panel-samsung-db7430.c       |    4 -
 drivers/gpu/drm/panel/panel-samsung-ld9040.c       |   41 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |    2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |    4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |    2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |    2 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |    1 -
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |    6 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |    6 +-
 drivers/gpu/drm/panel/panel-simple.c               |   64 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |    2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |  359 +++-
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |    1 -
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    |  406 +++++
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |    2 +-
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |  390 ++++
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   18 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |    6 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |   16 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   19 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |    3 -
 drivers/gpu/drm/pl111/pl111_versatile.c            |    1 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |    2 -
 drivers/gpu/drm/radeon/Kconfig                     |    2 +-
 drivers/gpu/drm/radeon/atom.c                      |   28 +-
 drivers/gpu/drm/radeon/cik.c                       |    2 +-
 drivers/gpu/drm/radeon/clearstate_si.h             |    3 +-
 drivers/gpu/drm/radeon/r300.c                      |    6 +-
 drivers/gpu/drm/radeon/r600.c                      |    2 +-
 drivers/gpu/drm/radeon/radeon_acpi.c               |    2 +-
 drivers/gpu/drm/radeon/radeon_agp.c                |    2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |    8 +-
 drivers/gpu/drm/radeon/radeon_atpx_handler.c       |   12 +-
 drivers/gpu/drm/radeon/radeon_combios.c            |    6 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |   11 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   54 +-
 drivers/gpu/drm/radeon/radeon_drv.h                |   13 +
 drivers/gpu/drm/radeon/radeon_encoders.c           |   22 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |    4 +-
 drivers/gpu/drm/radeon/radeon_gart.c               |   37 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    4 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |   10 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |    4 +-
 drivers/gpu/drm/radeon/radeon_legacy_tv.c          |    6 +-
 drivers/gpu/drm/radeon/radeon_test.c               |    8 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |    4 +-
 drivers/gpu/drm/radeon/rv770.c                     |   33 +-
 drivers/gpu/drm/radeon/rv770_smc.c                 |   36 +-
 drivers/gpu/drm/radeon/sislands_smc.h              |   51 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c         |    6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |   17 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |    8 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c    |    3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c      |   58 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c     |    6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |    6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   11 +-
 drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c   |    7 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    9 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    6 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    8 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    6 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    9 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   10 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    1 -
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    6 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    6 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    6 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  203 ++-
 drivers/gpu/drm/solomon/ssd130x.h                  |    3 +
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    4 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |    3 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |    6 +-
 drivers/gpu/drm/sti/sti_compositor.c               |    5 +-
 drivers/gpu/drm/sti/sti_drv.c                      |    8 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |    5 +-
 drivers/gpu/drm/sti/sti_hda.c                      |    5 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |    6 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |    5 +-
 drivers/gpu/drm/sti/sti_tvout.c                    |    5 +-
 drivers/gpu/drm/stm/drv.c                          |    9 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |    6 +-
 drivers/gpu/drm/stm/ltdc.c                         |    1 -
 drivers/gpu/drm/sun4i/sun4i_backend.c              |    6 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    6 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |    8 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.h             |    1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |    8 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   12 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |    6 +-
 drivers/gpu/drm/sun4i/sun6i_drc.c                  |    6 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |    6 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |    8 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |    3 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |    8 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |    8 +-
 drivers/gpu/drm/tegra/Kconfig                      |    2 +-
 drivers/gpu/drm/tegra/dc.c                         |    3 +-
 drivers/gpu/drm/tegra/dpaux.c                      |    8 +-
 drivers/gpu/drm/tegra/drm.c                        |    2 -
 drivers/gpu/drm/tegra/fbdev.c                      |    7 +-
 drivers/gpu/drm/tegra/gem.c                        |    2 -
 drivers/gpu/drm/tegra/gr2d.c                       |   19 +-
 drivers/gpu/drm/tegra/gr3d.c                       |   18 +-
 drivers/gpu/drm/tegra/hdmi.c                       |   51 +-
 drivers/gpu/drm/tegra/hub.c                        |    2 +-
 drivers/gpu/drm/tegra/nvdec.c                      |   21 +-
 drivers/gpu/drm/tegra/sor.c                        |    6 +-
 drivers/gpu/drm/tegra/vic.c                        |   19 +-
 drivers/gpu/drm/tests/Makefile                     |    3 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |    8 -
 drivers/gpu/drm/tests/drm_exec_test.c              |  213 +++
 drivers/gpu/drm/tests/drm_framebuffer_test.c       |    4 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  141 +-
 drivers/gpu/drm/tests/drm_modes_test.c             |    8 -
 drivers/gpu/drm/tests/drm_probe_helper_test.c      |    8 -
 drivers/gpu/drm/tidss/tidss_dispc.c                |   59 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    2 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |    9 +-
 drivers/gpu/drm/tidss/tidss_encoder.c              |  140 +-
 drivers/gpu/drm/tidss/tidss_encoder.h              |    5 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |   12 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |    3 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |    6 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    7 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    4 +
 drivers/gpu/drm/tiny/ofdrm.c                       |    6 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    3 +-
 drivers/gpu/drm/tiny/repaper.c                     |    2 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    6 +-
 drivers/gpu/drm/ttm/Makefile                       |    1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig             |    4 +
 drivers/gpu/drm/ttm/tests/Makefile                 |    6 +
 drivers/gpu/drm/ttm/tests/ttm_device_test.c        |  212 +++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |  113 ++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h      |   41 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c          |  437 +++++
 drivers/gpu/drm/ttm/ttm_bo.c                       |    4 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    8 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   13 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    9 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |    2 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |   12 +
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     |  115 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |    8 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |    9 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |    8 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |    9 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    7 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |    5 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |    9 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |    5 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |    9 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    6 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c            |  256 ++-
 drivers/gpu/drm/vkms/vkms_composer.c               |  105 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   12 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   20 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   17 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |  153 +-
 drivers/gpu/drm/vkms/vkms_formats.h                |    2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    9 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |    4 -
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   14 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |   10 +-
 drivers/gpu/host1x/bus.c                           |   29 +-
 drivers/gpu/host1x/context.c                       |   10 +-
 drivers/gpu/host1x/dev.c                           |    3 +-
 drivers/gpu/ipu-v3/ipu-common.c                    |    2 +-
 drivers/gpu/ipu-v3/ipu-pre.c                       |    4 +-
 drivers/gpu/ipu-v3/ipu-prg.c                       |    5 +-
 drivers/hid/hid-picolcd_fb.c                       |    1 -
 drivers/hid/i2c-hid/Kconfig                        |    6 +
 drivers/hid/i2c-hid/i2c-hid-core.c                 |  349 +++-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |    3 -
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |    3 -
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |    3 -
 drivers/media/pci/ivtv/ivtvfb.c                    |    1 -
 drivers/media/test-drivers/vivid/Kconfig           |    4 +-
 drivers/media/test-drivers/vivid/vivid-osd.c       |    5 +-
 drivers/of/device.c                                |    1 +
 drivers/of/property.c                              |    2 +
 drivers/staging/fbtft/Kconfig                      |    1 +
 drivers/staging/fbtft/fbtft-core.c                 |    2 +-
 drivers/staging/sm750fb/sm750.c                    |    2 -
 drivers/staging/sm750fb/sm750_accel.c              |    1 -
 drivers/staging/sm750fb/sm750_cursor.c             |    1 -
 drivers/staging/sm750fb/sm750_hw.c                 |    1 -
 drivers/video/Kconfig                              |    4 +-
 drivers/video/backlight/backlight.c                |    6 +-
 drivers/video/backlight/bd6107.c                   |    2 +-
 drivers/video/backlight/gpio_backlight.c           |    6 +-
 drivers/video/backlight/lv5207lp.c                 |    2 +-
 drivers/video/console/Kconfig                      |    2 +-
 drivers/video/fbdev/68328fb.c                      |    2 +-
 drivers/video/fbdev/Kconfig                        |  381 +---
 drivers/video/fbdev/acornfb.c                      |    6 +-
 drivers/video/fbdev/amba-clcd.c                    |    1 -
 drivers/video/fbdev/amifb.c                        |    5 +-
 drivers/video/fbdev/arcfb.c                        |    1 -
 drivers/video/fbdev/asiliantfb.c                   |    5 +-
 drivers/video/fbdev/atafb.c                        |    1 -
 drivers/video/fbdev/atmel_lcdfb.c                  |    6 +-
 drivers/video/fbdev/aty/aty128fb.c                 |   17 +-
 drivers/video/fbdev/aty/atyfb_base.c               |   21 +-
 drivers/video/fbdev/aty/radeon_backlight.c         |    2 +-
 drivers/video/fbdev/aty/radeon_base.c              |    6 +-
 drivers/video/fbdev/broadsheetfb.c                 |   82 +-
 drivers/video/fbdev/bw2.c                          |    1 -
 drivers/video/fbdev/carminefb.c                    |    6 +-
 drivers/video/fbdev/cg14.c                         |    2 +-
 drivers/video/fbdev/cg3.c                          |    1 -
 drivers/video/fbdev/cg6.c                          |    2 +-
 drivers/video/fbdev/chipsfb.c                      |    5 +-
 drivers/video/fbdev/cirrusfb.c                     |    3 +-
 drivers/video/fbdev/clps711x-fb.c                  |    1 -
 drivers/video/fbdev/cobalt_lcdfb.c                 |    1 -
 drivers/video/fbdev/controlfb.c                    |    2 +-
 drivers/video/fbdev/core/Kconfig                   |  198 ++
 drivers/video/fbdev/core/Makefile                  |   11 +-
 drivers/video/fbdev/core/fb_backlight.c            |   33 +
 drivers/video/fbdev/core/fb_chrdev.c               |  485 +++++
 drivers/video/fbdev/core/fb_info.c                 |   79 +
 drivers/video/fbdev/core/fb_internal.h             |   67 +
 drivers/video/fbdev/core/fb_procfs.c               |   62 +
 drivers/video/fbdev/core/fbcon.c                   |    7 +-
 drivers/video/fbdev/core/fbmem.c                   |  592 +-----
 drivers/video/fbdev/core/fbsysfs.c                 |  134 +-
 drivers/video/fbdev/cyber2000fb.c                  |    2 +-
 drivers/video/fbdev/da8xx-fb.c                     |    5 +-
 drivers/video/fbdev/efifb.c                        |    5 +-
 drivers/video/fbdev/ep93xx-fb.c                    |   22 +-
 drivers/video/fbdev/ffb.c                          |    3 +-
 drivers/video/fbdev/fm2fb.c                        |    5 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |   32 +-
 drivers/video/fbdev/g364fb.c                       |    6 +-
 drivers/video/fbdev/gbefb.c                        |    1 -
 drivers/video/fbdev/geode/Kconfig                  |   12 +-
 drivers/video/fbdev/geode/gx1fb_core.c             |    6 +-
 drivers/video/fbdev/geode/gxfb_core.c              |    6 +-
 drivers/video/fbdev/geode/lxfb_core.c              |    6 +-
 drivers/video/fbdev/goldfishfb.c                   |    5 +-
 drivers/video/fbdev/grvga.c                        |    6 +-
 drivers/video/fbdev/gxt4500.c                      |    7 +-
 drivers/video/fbdev/hecubafb.c                     |   80 +-
 drivers/video/fbdev/hgafb.c                        |    2 +-
 drivers/video/fbdev/hitfb.c                        |    2 +-
 drivers/video/fbdev/hpfb.c                         |    1 -
 drivers/video/fbdev/hyperv_fb.c                    |    3 +-
 drivers/video/fbdev/i740fb.c                       |    6 +-
 drivers/video/fbdev/i810/i810_main.c               |    4 +-
 drivers/video/fbdev/imsttfb.c                      |    3 +-
 drivers/video/fbdev/imxfb.c                        |    7 +-
 drivers/video/fbdev/intelfb/intelfbdrv.c           |    5 +-
 drivers/video/fbdev/kyro/fbdev.c                   |    5 +-
 drivers/video/fbdev/leo.c                          |    1 -
 drivers/video/fbdev/macfb.c                        |    5 +-
 drivers/video/fbdev/matrox/matroxfb_crtc2.c        |    5 +-
 drivers/video/fbdev/maxinefb.c                     |    5 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |   15 +-
 drivers/video/fbdev/metronomefb.c                  |   78 +-
 drivers/video/fbdev/mmp/fb/Kconfig                 |    4 +-
 drivers/video/fbdev/mmp/fb/mmpfb.c                 |    6 +-
 drivers/video/fbdev/mx3fb.c                        |    5 +-
 drivers/video/fbdev/neofb.c                        |    2 +-
 drivers/video/fbdev/nvidia/nv_backlight.c          |    2 +-
 drivers/video/fbdev/nvidia/nvidia.c                |   12 +-
 drivers/video/fbdev/ocfb.c                         |    4 +-
 drivers/video/fbdev/offb.c                         |    6 +-
 drivers/video/fbdev/omap/Kconfig                   |    4 +-
 drivers/video/fbdev/omap/omapfb_main.c             |    5 +-
 drivers/video/fbdev/omap2/omapfb/Kconfig           |    2 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |    1 -
 drivers/video/fbdev/p9100.c                        |    1 -
 drivers/video/fbdev/platinumfb.c                   |    5 +-
 drivers/video/fbdev/pm2fb.c                        |    3 +-
 drivers/video/fbdev/pm3fb.c                        |    3 +-
 drivers/video/fbdev/pmag-aa-fb.c                   |    5 +-
 drivers/video/fbdev/pmag-ba-fb.c                   |    5 +-
 drivers/video/fbdev/pmagb-b-fb.c                   |    5 +-
 drivers/video/fbdev/ps3fb.c                        |    6 +-
 drivers/video/fbdev/pvr2fb.c                       |    2 +-
 drivers/video/fbdev/pxa168fb.c                     |    8 +-
 drivers/video/fbdev/pxafb.c                        |    6 +-
 drivers/video/fbdev/q40fb.c                        |    5 +-
 drivers/video/fbdev/riva/fbdev.c                   |   13 +-
 drivers/video/fbdev/s1d13xxxfb.c                   |    4 +-
 drivers/video/fbdev/s3c-fb.c                       |    5 +-
 drivers/video/fbdev/sa1100fb.c                     |    1 -
 drivers/video/fbdev/savage/savagefb_driver.c       |    3 +-
 drivers/video/fbdev/sh7760fb.c                     |   54 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |    2 -
 drivers/video/fbdev/simplefb.c                     |    5 +-
 drivers/video/fbdev/sis/sis_main.c                 |    5 +-
 drivers/video/fbdev/skeletonfb.c                   |    2 +-
 drivers/video/fbdev/sm501fb.c                      |    4 +-
 drivers/video/fbdev/sm712fb.c                      |   10 +-
 drivers/video/fbdev/smscufx.c                      |    6 +-
 drivers/video/fbdev/ssd1307fb.c                    |   69 +-
 drivers/video/fbdev/sstfb.c                        |    5 +-
 drivers/video/fbdev/sunxvr1000.c                   |    5 +-
 drivers/video/fbdev/sunxvr2500.c                   |    5 +-
 drivers/video/fbdev/sunxvr500.c                    |    1 -
 drivers/video/fbdev/tcx.c                          |    1 -
 drivers/video/fbdev/tdfxfb.c                       |    6 +-
 drivers/video/fbdev/tgafb.c                        |    2 +-
 drivers/video/fbdev/tridentfb.c                    |    2 +-
 drivers/video/fbdev/udlfb.c                        |    2 +-
 drivers/video/fbdev/uvesafb.c                      |    7 +-
 drivers/video/fbdev/valkyriefb.c                   |    5 +-
 drivers/video/fbdev/vermilion/vermilion.c          |    2 +-
 drivers/video/fbdev/vesafb.c                       |    6 +-
 drivers/video/fbdev/vfb.c                          |    1 -
 drivers/video/fbdev/vga16fb.c                      |    2 +-
 drivers/video/fbdev/via/viafbdev.c                 |    2 +-
 drivers/video/fbdev/vt8500lcdfb.c                  |    3 +-
 drivers/video/fbdev/wm8505fb.c                     |    3 +-
 drivers/video/fbdev/xen-fbfront.c                  |   63 +-
 drivers/video/fbdev/xilinxfb.c                     |    5 +-
 drivers/video/logo/Kconfig                         |    2 +-
 include/drm/bridge/dw_hdmi.h                       |    2 +
 include/drm/drm_bridge.h                           |    3 +
 include/drm/drm_crtc.h                             |    5 -
 include/drm/drm_debugfs.h                          |   25 +
 include/drm/drm_drv.h                              |   32 +-
 include/drm/drm_exec.h                             |  123 ++
 include/drm/drm_file.h                             |    8 +-
 include/drm/drm_gem.h                              |   82 +
 include/drm/drm_gem_dma_helper.h                   |   14 +-
 include/drm/drm_gem_shmem_helper.h                 |   19 +-
 include/drm/drm_gem_vram_helper.h                  |    9 +-
 include/drm/drm_gpuva_mgr.h                        |  706 +++++++
 include/drm/drm_kunit_helpers.h                    |    7 +
 include/drm/drm_modeset_helper_vtables.h           |   48 +-
 include/drm/drm_panel.h                            |   96 +
 include/drm/drm_plane.h                            |    2 +-
 include/drm/drm_prime.h                            |    7 -
 include/drm/drm_probe_helper.h                     |    1 +
 include/drm/drm_syncobj.h                          |    6 +-
 include/drm/drm_sysfs.h                            |    4 +-
 include/drm/task_barrier.h                         |    4 +-
 include/drm/ttm/ttm_bo.h                           |    2 -
 include/linux/efi.h                                |    3 +-
 include/linux/fb.h                                 |   58 +-
 include/linux/platform_data/bd6107.h               |    2 +-
 include/linux/platform_data/gpio_backlight.h       |    2 +-
 include/linux/platform_data/lv5207lp.h             |    2 +-
 include/linux/sysfb.h                              |    3 +-
 include/uapi/drm/amdgpu_drm.h                      |    7 +-
 include/uapi/drm/drm.h                             |   84 +-
 include/uapi/drm/drm_mode.h                        |    7 +-
 include/uapi/drm/ivpu_accel.h                      |    9 +-
 include/uapi/drm/nouveau_drm.h                     |  271 ++-
 include/uapi/drm/virtgpu_drm.h                     |   16 +-
 samples/Kconfig                                    |    4 +-
 samples/vfio-mdev/mdpy-fb.c                        |    5 +-
 1424 files changed, 45988 insertions(+), 17437 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
 create mode 100644 Documentation/gpu/amdgpu/flashing.rst
 create mode 100644 drivers/accel/ivpu/ivpu_debugfs.c
 create mode 100644 drivers/accel/ivpu/ivpu_debugfs.h
 create mode 100644 drivers/accel/ivpu/ivpu_fw_log.c
 create mode 100644 drivers/accel/ivpu/ivpu_fw_log.h
 rename drivers/accel/ivpu/{ivpu_hw_mtl.c =3D> ivpu_hw_37xx.c} (52%)
 create mode 100644 drivers/accel/ivpu/ivpu_hw_37xx_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_40xx.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_40xx_reg.h
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_mtl_reg.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
 rename drivers/gpu/drm/amd/amdgpu/{aqua_vanjaram_reg_init.c =3D>
aqua_vanjaram.c} (99%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v6_1.h
 rename drivers/gpu/drm/{nouveau/nvkm/subdev/fb/ramga102.c =3D>
amd/amdgpu/mmsch_v4_0_3.h} (69%)
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_iommu.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.=
c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.=
h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.=
c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio_fixed_vs_pe_retimer.=
h
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_=
dp.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_=
dp.h
 delete mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_subvp_state.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_defines.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/loongson_device.c
 create mode 100644 drivers/gpu/drm/loongson/loongson_module.c
 create mode 100644 drivers/gpu/drm/loongson/loongson_module.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_benchmark.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_benchmark.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gem.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_gfxpll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output_7a1000.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output_7a2000.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pixpll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_probe.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_ttm.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
 create mode 100644 drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-r66451.c
 create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
 create mode 100644 drivers/video/fbdev/core/Kconfig
 create mode 100644 drivers/video/fbdev/core/fb_backlight.c
 create mode 100644 drivers/video/fbdev/core/fb_chrdev.c
 create mode 100644 drivers/video/fbdev/core/fb_info.c
 create mode 100644 drivers/video/fbdev/core/fb_internal.h
 create mode 100644 drivers/video/fbdev/core/fb_procfs.c
 create mode 100644 include/drm/drm_exec.h
 create mode 100644 include/drm/drm_gpuva_mgr.h
