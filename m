Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171593B8DF2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 08:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561C36E9C4;
	Thu,  1 Jul 2021 06:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E1B6E9BF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 04:34:31 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w13so6462033edc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 21:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=rEFT3fRQsBOk0ksbEOm3FZb2WavJd1lRLRjeSltTsfQ=;
 b=aa0x8fBeiMqLeGK+Q4QjwEAnNIblI2KXrLwgkZ5pHMjkeimzWjF3Gbyv0sFLgZZbiS
 +zCylB9yb4tJ9LMxV/Xpu4LStgDBavDnm2nlQjQrAeDpOOGuOLifuA7q/XzCVrU0XvWE
 2FGWlazgetHf0MCIzoHKecyk6L7lnAD+yVZqXHiI/jvqSK0KExcON18PeR++OjHU8GHC
 1GDTVoCrhq1dXteN+eyLTjpfPEwwJqEVAcWB7QjutprwapX9N66X92HCFmqmSdQG+TCy
 jBW6TdPwqJPdNKKbagkxcdx0ZQdHTbb7hdWsUv+Wx0vN4UHUrMApkwNU8nyvO2vYbJ7V
 QrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=rEFT3fRQsBOk0ksbEOm3FZb2WavJd1lRLRjeSltTsfQ=;
 b=P+L3UedWiqQtMJLkKw0lY6+2vTO6HPqwAKhOxb1EU+e3kvrDncujxdQ7eEZwn++2nY
 Dlasus7Tt9Yoc6cJkBQYhii8YdmkDG8OGCM81Dm6H1j69ee+vWS8pLyJ87Tn5/0I99CS
 hAtYP60hKuJVisvrkc2uZoQX6QheQTnQ6lGKLfi8NOU4cIoiptFDBfJOIZc5odba3mzs
 +wbRqEgpfFUhgwl9jtlUxZTWkyL10cJum268PWJxG2UzLo5conAWinaIOW7Kh66XBhQ2
 2l/MD8DBtMqP5VcVogOZSgsvKdu4z7am0ReF8kQXpcBi5Ie9NHPfxilWvryqCEQijCcs
 9v2g==
X-Gm-Message-State: AOAM5316+cB+orMgJ0wZSl+6oFSeONozoklpleP/7zCevnJFLDiWBK0m
 +4F3K0zsTCDQ3gPFxuC1UtIJEyffNQqOPA7nbt0=
X-Google-Smtp-Source: ABdhPJz9oVd95vnwnXruY+K6wiR+6sLO7UevSmjS4+px2+Rp7NNQe9Bzmi8NfBHD/RQRZRiv2h91LZ40HNVEV5wfznk=
X-Received: by 2002:aa7:dc58:: with SMTP id g24mr1037189edu.127.1625114069900; 
 Wed, 30 Jun 2021 21:34:29 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 1 Jul 2021 14:34:15 +1000
Message-ID: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
Subject: [git pull] drm for 5.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Jul 2021 06:57:24 +0000
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

This is the main drm pull request for 5.14-rc1.

I've done a test pull into your current tree, and hit two conflicts
(one in vc4, one in amdgpu), both seem pretty trivial, the amdgpu one
is recent and sfr sent out a resolution for it today.

Not much outside the tree, one x86 early quirk patch, and dma_resv
renamed some APIs that had changes in other drivers.

Highlights:
- AMD enables two more GPUs, with resulting header files
- i915 has started to move to TTM for discrete GPU and enable DG1
discrete GPU support (not by default yet)
- new HyperV drm driver
- vmwgfx adds arm64 support
- TTM refactoring ongoing
- 16bpc display support for AMD hw

Otherwise it's just the usual insane amounts of work all over the
place in lots of drivers and the core, as mostly summarised below.

Regards,
Dave.

drm-next-2021-07-01:
drm pull for 5.14-rc1

core:
- mark AGP ioctls as legacy
- disable force probing for non-master clients
- HDR metadata property helpers
- HDMI infoframe signal colorimetry support
- remove drm_device.pdev pointer
- remove DRM_KMS_FB_HELPER config option
- remove drm_pci_alloc/free
- drm_err_*/drm_dbg_* helpers
- use drm driver names for fbdev
- leaked DMA handle fix
- 16bpc fixed point format fourcc
- add prefetching memcpy for WC
- Documentation fixes

aperture:
- add aperture ownership helpers

dp:
- aux fixes
- downstream 0 port handling
- use extended base receiver capability DPCD
- Rename DP_PSR_SELECTIVE_UPDATE to better mach eDP spec
- mst: use khz as link rate during init
- VCPI fixes for StarTech hub

ttm:
- provide tt_shrink file via debugfs
- warn about freeing pinned BOs
- fix swapping error handling
- move page alignment into BO
- cleanup ttm_agp_backend
- add ttm_sys_manager
- don't override vm_ops
- ttm_bo_mmap removed
- make ttm_resource base of all managers
- remove VM_MIXEDMAP usage

panel:
- sysfs_emit support
- simple: runtime PM support
- simple: power up panel when reading EDID + caching

bridge:
- MHDP8546: HDCP support + DT bindings
- MHDP8546: Register DP AUX channel with userspace
- TI SN65DSI83 + SN65DSI84: add driver
- Sil8620: Fix module dependencies
- dw-hdmi: make CEC driver loading optional
- Ti-sn65dsi86: refclk fixes, subdrivers, runtime pm
- It66121: Add driver + DT bindings
- Adv7511: Support I2S IEC958 encoding
- Anx7625: fix power-on delay
- Nwi-dsi: Modesetting fixes; Cleanups
- lt6911: add missing MODULE_DEVICE_TABLE
- cdns: fix PM reference leak

hyperv:
- add new DRM driver for HyperV graphics

efifb:
- non-PCI device handling fixes

i915:
- refactor IP/device versioning
- XeLPD Display IP preperation work
- ADL-P enablement patches
- DG1 uAPI behind BROKEN
- disable mmap ioctl for discerte GPUs
- start enabling HuC loading for Gen12+
- major GuC backend rework for new platforms
- initial TTM support for Discrete GPUs
- locking rework for TTM prep
- use correct max source link rate for eDP
- %p4cc format printing
- GLK display fixes
- VLV DSI panel power fixes
- PSR2 disabled for RKL and ADL-S
- ACPI _DSM invalid access fixed
- DMC FW path abstraction
- ADL-S PCI ID update
- uAPI headers converted to kerneldoc
- initial LMEM support for DG1
- x86/gpu: add Jasperlake to gen11 early quirks

amdgpu:
- Aldebaran updates + initial SR-IOV
- new GPU: Beige Goby and Yellow Carp support
- more LTTPR display work
- Vangogh updates
- SDMA 5.x GCR fixes
- PCIe ASPM support
- Renoir TMZ enablement
- initial multiple eDP panel support
- use fdinfo to track devices/process info
- pin/unpin TTM fixes
- free resource on fence usage query
- fix fence calculation
- fix hotunplug/suspend issues
- GC/MM register access macro cleanup for SR-IOV
- W=3D1 fixes
- ACPI ATCS/ATIF handling rework
- 16bpc fixed point format support
- Initial smartshift support
- RV/PCO power tuning fixes
- new INFO query for additional vbios info

amdkfd:
- SR-IOV aldebaran support
- HMM SVM support

radeon:
- SMU regression fixes
- Oland flickering fix

vmwgfx:
- enable console with fbdev emulation
- fix cpu updates of coherent multisample surfaces
- remove reservation semaphore
- add initial SVGA3 support
- support arm64

msm:
- devcoredump support for display errors
- dpu/dsi: yaml bindings conversion
- mdp5: alpha/blend_mode/zpos support
- a6xx: cached coherent buffer support
- gpu iova fault improvement
- a660 support

rockchip:
- RK3036 win1 scaling support
- RK3066/3188 missing register support
- RK3036/3066/3126/3188 alpha support

mediatek:
- MT8167 HDMI support
- MT8183 DPI dual edge support

tegra:
- fixed YUV support/scaling on Tegra186+

ast:
- use pcim_iomap
- fix DP501 EDID

bochs:
- screen blanking support

etnaviv:
- export more GPU ID values to userspace
- add HWDB entry for GPU on i.MX8MP
- rework linear window calcs

exynos:
- pm runtime changes

imx:
- Annotate dma_fence critical section
- fix PRG modifiers after drmm conversion
- Add 8 pixel alignment fix for 1366x768
- fix YUV advertising
- add color properties

ingenic:
- IPU planes fix

panfrost:
- Mediatek MT8183 support + DT bindings
- export AFBC_FEATURES register to userspace

simpledrm:
- %pr for printing resources

nouveau:
- pin/unpin TTM fixes

qxl:
- unpin shadow BO

virtio:
- create dumb BOs as guest blob

vkms:
- drmm_universal_plane_alloc
- add XRGB plane composition
- overlay support
The following changes since commit 13311e74253fe64329390df80bed3f07314ddd61=
:

  Linux 5.13-rc7 (2021-06-20 15:03:15 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-07-01

for you to fetch changes up to 8a02ea42bc1d4c448caf1bab0e05899dad503f74:

  Merge tag 'drm-intel-next-fixes-2021-06-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-06-30
15:42:05 +1000)

----------------------------------------------------------------
drm pull for 5.14-rc1

core:
- mark AGP ioctls as legacy
- disable force probing for non-master clients
- HDR metadata property helpers
- HDMI infoframe signal colorimetry support
- remove drm_device.pdev pointer
- remove DRM_KMS_FB_HELPER config option
- remove drm_pci_alloc/free
- drm_err_*/drm_dbg_* helpers
- use drm driver names for fbdev
- leaked DMA handle fix
- 16bpc fixed point format fourcc
- add prefetching memcpy for WC
- Documentation fixes

aperture:
- add aperture ownership helpers

dp:
- aux fixes
- downstream 0 port handling
- use extended base receiver capability DPCD
- Rename DP_PSR_SELECTIVE_UPDATE to better mach eDP spec
- mst: use khz as link rate during init
- VCPI fixes for StarTech hub

ttm:
- provide tt_shrink file via debugfs
- warn about freeing pinned BOs
- fix swapping error handling
- move page alignment into BO
- cleanup ttm_agp_backend
- add ttm_sys_manager
- don't override vm_ops
- ttm_bo_mmap removed
- make ttm_resource base of all managers
- remove VM_MIXEDMAP usage

panel:
- sysfs_emit support
- simple: runtime PM support
- simple: power up panel when reading EDID + caching

bridge:
- MHDP8546: HDCP support + DT bindings
- MHDP8546: Register DP AUX channel with userspace
- TI SN65DSI83 + SN65DSI84: add driver
- Sil8620: Fix module dependencies
- dw-hdmi: make CEC driver loading optional
- Ti-sn65dsi86: refclk fixes, subdrivers, runtime pm
- It66121: Add driver + DT bindings
- Adv7511: Support I2S IEC958 encoding
- Anx7625: fix power-on delay
- Nwi-dsi: Modesetting fixes; Cleanups
- lt6911: add missing MODULE_DEVICE_TABLE
- cdns: fix PM reference leak

hyperv:
- add new DRM driver for HyperV graphics

efifb:
- non-PCI device handling fixes

i915:
- refactor IP/device versioning
- XeLPD Display IP preperation work
- ADL-P enablement patches
- DG1 uAPI behind BROKEN
- disable mmap ioctl for discerte GPUs
- start enabling HuC loading for Gen12+
- major GuC backend rework for new platforms
- initial TTM support for Discrete GPUs
- locking rework for TTM prep
- use correct max source link rate for eDP
- %p4cc format printing
- GLK display fixes
- VLV DSI panel power fixes
- PSR2 disabled for RKL and ADL-S
- ACPI _DSM invalid access fixed
- DMC FW path abstraction
- ADL-S PCI ID update
- uAPI headers converted to kerneldoc
- initial LMEM support for DG1
- x86/gpu: add Jasperlake to gen11 early quirks

amdgpu:
- Aldebaran updates + initial SR-IOV
- new GPU: Beige Goby and Yellow Carp support
- more LTTPR display work
- Vangogh updates
- SDMA 5.x GCR fixes
- PCIe ASPM support
- Renoir TMZ enablement
- initial multiple eDP panel support
- use fdinfo to track devices/process info
- pin/unpin TTM fixes
- free resource on fence usage query
- fix fence calculation
- fix hotunplug/suspend issues
- GC/MM register access macro cleanup for SR-IOV
- W=3D1 fixes
- ACPI ATCS/ATIF handling rework
- 16bpc fixed point format support
- Initial smartshift support
- RV/PCO power tuning fixes
- new INFO query for additional vbios info

amdkfd:
- SR-IOV aldebaran support
- HMM SVM support

radeon:
- SMU regression fixes
- Oland flickering fix

vmwgfx:
- enable console with fbdev emulation
- fix cpu updates of coherent multisample surfaces
- remove reservation semaphore
- add initial SVGA3 support
- support arm64

msm:
- devcoredump support for display errors
- dpu/dsi: yaml bindings conversion
- mdp5: alpha/blend_mode/zpos support
- a6xx: cached coherent buffer support
- gpu iova fault improvement
- a660 support

rockchip:
- RK3036 win1 scaling support
- RK3066/3188 missing register support
- RK3036/3066/3126/3188 alpha support

mediatek:
- MT8167 HDMI support
- MT8183 DPI dual edge support

tegra:
- fixed YUV support/scaling on Tegra186+

ast:
- use pcim_iomap
- fix DP501 EDID

bochs:
- screen blanking support

etnaviv:
- export more GPU ID values to userspace
- add HWDB entry for GPU on i.MX8MP
- rework linear window calcs

exynos:
- pm runtime changes

imx:
- Annotate dma_fence critical section
- fix PRG modifiers after drmm conversion
- Add 8 pixel alignment fix for 1366x768
- fix YUV advertising
- add color properties

ingenic:
- IPU planes fix

panfrost:
- Mediatek MT8183 support + DT bindings
- export AFBC_FEATURES register to userspace

simpledrm:
- %pr for printing resources

nouveau:
- pin/unpin TTM fixes

qxl:
- unpin shadow BO

virtio:
- create dumb BOs as guest blob

vkms:
- drmm_universal_plane_alloc
- add XRGB plane composition
- overlay support

----------------------------------------------------------------
Aaron Liu (43):
      drm/amdgpu: modify system reference clock source for navi+ (V2)
      drm/amdgpu: add yellow carp asic header files (v3)
      drm/amdgpu: add yellow carp asic_type enum
      drm/amdgpu: add uapi to define yellow carp series
      drm/amdgpu: add yellow carp support for gpu_info and ip block setting
      drm/amdgpu: add nv common ip block support for yellow carp
      drm/amdgpu: add yellow carp support for ih block
      drm/amdgpu: add gmc v10 supports for yellow carp
      drm/amdgpu: support fw load type for yellow carp
      drm/amdgpu: add gfx support for yellow carp
      drm/amdgpu: add sdma support for yellow carp
      drm/amdgpu: set ip blocks for yellow carp
      drm/amdkfd: add yellow carp KFD support
      drm/amdgpu: support nbio_7_2_1 for yellow carp
      drm/admgpu/pm: add smu v13 driver interface header for yellow carp (v=
3)
      drm/amdgpu/pm: add smu v13.0.1 firmware header for yellow carp (V4)
      drm/amdgpu/pm: add smu v13.0.1 smc header for yellow carp (v2)
      drm/amd/pm: add smu13 ip support for moment(V3)
      drm/amd/pm: add yellow_carp_ppt implementation(V3)
      drm/amd/pm: partially enable swsmu for yellow carp(V2)
      drm/amdgpu: add smu ip block for yellow carp(V3)
      drm/amdgpu: add gfx golden settings for yellow carp (v3)
      drm/amdgpu: reserved buffer is not needed with ip discovery enabled
      drm/amdgpu: add psp_v13 support for yellow carp
      drm/amdgpu: enable psp_v13 for yellow carp
      drm/amdgpu/pm: set_pp_feature is unsupport for yellow carp
      drm/amdgpu/pm: add set_driver_table_location implementation for
yellow carp
      drm/amdgpu: add GFX Clock Gating support for yellow carp
      drm/amdgpu: add MMHUB Clock Gating support for yellow carp
      drm/amdgpu: add GFX Power Gating support for yellow carp
      drm/amdgpu/pm: enable smu_hw_init for yellow carp
      drm/amdgpu/pm: add gfx_off_control for yellow carp
      drm/amdgpu/pm: enable gfx_off in yellow carp smu post init
      drm/amdgpu: add SDMA Clock Gating support for yellow carp
      drm/amdgpu: add HDP Clock Gating support for yellow carp
      drm/amdgpu: add ATHUB Clock Gating support for yellow carp
      drm/amdgpu: add IH Clock Gating support for yellow carp
      drm/amdgpu: enable VCN PG and CG for yellow carp
      drm/amdgpu/pm: support smu_post_init for yellow carp
      drm/amdgpu: add RLC_PG_DELAY_3 for yellow carp
      drm/amdgpu: add timestamp counter query support for yellow carp
      drm/amd/pm: add PrepareMp1ForUnload support for yellow carp
      drm/amdgpu: add mode2 reset support for yellow carp

Abdiel Janulgue (1):
      drm/i915/query: Expose memory regions through the query uAPI

Abhinav Kumar (7):
      drm: allow drm_atomic_print_state() to accept any drm_printer
      drm/msm: add support to take dpu snapshot
      drm/msm/dsi: add API to take DSI register snapshot
      drm/msm/dp: add API to take DP register snapshot
      drm/msm/disp/dpu1: add API to take DPU register snapshot
      drm/msm: add support to take dsi, dp and dpu snapshot
      drm/msm: add disp snapshot points across dpu driver

Aditya Swarup (1):
      drm/i915: Add Wa_14010733141

Adrien Grassein (1):
      drm/bridge: fix LONTIUM_LT8912B dependencies

Alex Bee (5):
      drm: rockchip: add scaling for RK3036 win1
      drm: rockchip: add missing registers for RK3188
      drm: rockchip: add missing registers for RK3066
      drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK318=
8
      drm: rockchip: set alpha_en to 0 if it is not used

Alex Deucher (29):
      MAINTAINERS: Fix TTM tree
      drm/amdgpu/display: add documentation for dmcub_trace_event_en
      MAINTAINERS: fix a few more amdgpu tree links
      drm/amdgpu: Add graphics cache rinse packet for sdma 5.0
      drm/amdgpu: drop the GCR packet from the emit_ib frame for sdma5.0
      drm/amdgpu: change the default timeout for kernel compute queues
      drm/amdgpu/pm: add documentation for pp_od_clock_voltage for APUs
      drm/amdgpu/pm: add documentation for pp_od_clock_voltage for vangogh
      drm/amdgpu/display: remove an old DCN3 guard
      drm/amdgpu/display: fix warning when CONFIG_DRM_AMD_DC_DCN is not def=
ined
      drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not defin=
ed
      drm/amdgpu/display: fix dal_allocation documentation
      drm/amdgpu: add mmhub client support for beige goby
      drm/amdgpu/display: add helper functions to get/set backlight (v2)
      drm/amdgpu/display: restore the backlight on modeset (v2)
      drm/amdgpu/display: make backlight setting failure messages debug
      drm/amdgpu/acpi: unify ATCS handling (v3)
      drm/amdgpu/apci: switch ATIF/ATCS probe order
      drm/amdgpu/acpi: fix typo in ATCS handling
      drm/amdgpu/swsmu/aldebaran: fix check in is_dpm_running
      drm/amdgpu/acpi: make ATPX/ATCS structures global (v2)
      drm/amdgpu: bump driver version
      drm/amdgpu: add yellow_carp_reg_base_init function for yellow carp (v=
2)
      drm/amdgpu: add mmhub client support for yellow carp
      drm/amdgpu/dc: fix DCN3.1 Makefile for PPC64
      drm/amdgpu/dc: fix DCN3.1 FP handling
      drm/amdgpu/vcn: drop gfxoff control for VCN2+
      drm/amdgpu/vcn3: drop extraneous Beige Goby hunk
      drm/amdgpu/display: fold DRM_AMD_DC_DCN3_1 into DRM_AMD_DC_DCN

Alex Sierra (13):
      drm/amdkfd: helper to convert gpu id and idx
      drm/amdkfd: add xnack enabled flag to kfd_process
      drm/amdkfd: add ioctl to configure and query xnack retries
      drm/amdgpu: enable 48-bit IH timestamp counter
      drm/amdkfd: SVM API call to restore page tables
      drm/amdkfd: add svm_bo reference for eviction fence
      drm/amdgpu: add param bit flag to create SVM BOs
      drm/amdgpu: svm bo enable_signal call condition
      drm/amdgpu: add svm_bo eviction to enable_signal cb
      drm/amdgpu: extend xnack limit page fault timeout
      drm/amdkfd: svm ranges creation for unregistered memory
      drm/amdkfd: set attribute access for default ranges
      drm/amdkfd: move CoherentHostAccess prop to HSA_CAPABILITY

Alvin Lee (1):
      drm/amd/display: Implement INBOX0 usage in driver

Alyssa Rosenzweig (2):
      drm/sched: Fix inverted comment for hang_limit
      drm/panfrost: Add AFBC_FEATURES parameter

Amber Lin (1):
      drm/amdkfd: Fix circular lock in nocpsch path

Anand Moon (1):
      drm/i915/adl_s: ADL-S platform Update PCI ids for Mobile BGA

Andrey Grodzovsky (19):
      drm/ttm: Remap all page faults to per process dummy page.
      drm/amdgpu: Split amdgpu_device_fini into early and late
      drm/amdgpu: Add early fini callback
      drm/amdgpu: Handle IOMMU enabled case.
      drm/amdgpu: Remap all page faults to per process dummy page.
      PCI: Add support for dev_groups to struct pci_driver
      drm/amdgpu: Convert driver sysfs attributes to static attributes
      drm/amdgpu: Guard against write accesses after device removal
      drm/sched: Make timeout timer rearm conditional.
      drm/amdgpu: Prevent any job recoveries after device is unplugged.
      drm/amdgpu: Fix hang on device removal.
      drm/scheduler: Fix hang when sched_entity released
      drm/sched: Avoid data corruptions
      drm/amd/display: Remove superfluous drm_mode_config_cleanup
      drm/amdgpu: Verify DMA opearations from device are done
      drm/amdgpu: Unmap all MMIO mappings
      drm/amdgpu: Rename flag which prevents HW access
      drm/amdgpu: Fix crash when hot unplug in BACO
      drm/amdgpu: Fix clang warning: unused label 'exit'

Andy Shevchenko (7):
      drm/st7735r: Avoid spamming logs if probe is deferred
      drm/st7586: Avoid spamming logs if probe is deferred
      drm/mi0283qt: Avoid spamming logs if probe is deferred
      drm/ili9486: Avoid spamming logs if probe is deferred
      drm/ili9341: Avoid spamming logs if probe is deferred
      drm/ili9225: Avoid spamming logs if probe is deferred
      drm/hx8357d: Avoid spamming logs if probe is deferred

Animesh Manna (3):
      drm/i915/bigjoiner: Mode validation with uncompressed pipe joiner
      drm/i915/bigjoiner: Avoid dsc_compute_config for uncompressed bigjoin=
er
      drm/i915/bigjoiner: atomic commit changes for uncompressed joiner

Ankit Nautiyal (1):
      drm/i915: Use correct downstream caps for check Src-Ctl mode for PCON

Anshuman Gupta (1):
      drm/i915/hdcp: Fix uninitialized symbol 'msg_end'

Anthony Koo (7):
      drm/amd/display: [FW Promotion] Release 0.0.63
      drm/amd/display: [FW Promotion] Release 0.0.64
      drm/amd/display: [FW Promotion] Release 0.0.65
      drm/amd/display: [FW Promotion] Release 0.0.66
      drm/amd/display: [FW Promotion] Release 0.0.68
      drm/amd/display: [FW Promotion] Release 0.0.70
      drm/amd/display: [FW Promotion] Release 0.0.71

Anthony Wang (1):
      drm/amd/display: Handle potential dpp_inst mismatch with pipe_idx

Anusha Srivatsa (15):
      drm/i915/lmem: Bypass aperture when lmem is available
      drm/i915/adl_p: Add cdclk support for ADL-P
      drm/i915/dmc: s/intel_csr/intel_dmc
      drm/i915/dmc: s/HAS_CSR/HAS_DMC
      drm/i915/dmc: Rename macro names containing csr
      drm/i915/dmc: Rename functions names having "csr"
      drm/i915/dmc: s/intel_csr.c/intel_dmc.c and s/intel_csr.h/intel_dmc.h
      drm/i915/adl_p: Setup ports/phys
      drm/i915/adl_p: Add PLL Support
      drm/i915/adlp: Add PIPE_MISC2 programming
      drm/i915/adl_p: Update memory bandwidth parameters
      drm/i915/gvt: Add missing macro name changes
      drm/i915/dmc: s/DRM_ERROR/drm_err
      drm/i915/dmc: Add intel_dmc_has_payload() helper
      drm/i915/dmc: Move struct intel_dmc to intel_dmc.h

Aric Cyr (14):
      drm/amd/display: 3.2.133
      drm/amdgpu/dc: Revert commit "treat memory as a single-channel"
      drm/amd/display: 3.2.134
      drm/amd/display: 3.2.135
      drm/amd/display: 3.2.135.1
      drm/amd/display: 3.2.136
      drm/amd/display: 3.2.137
      drm/amd/display: Change default policy for MPO with multidisplay
      drm/amd/display: 3.2.138
      drm/amd/display: Fix crash during MPO + ODM combine mode recalculatio=
n
      drm/amd/display: 3.2.139
      drm/amd/display: 3.2.140
      drm/amd/display: Multiplane cursor position incorrect when plane rota=
ted
      drm/amd/display: 3.2.141

Arnd Bergmann (3):
      fbdev: matrox: use modern module_init()
      drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
      drm/msm/dsi: fix 32-bit clang warning

Asher Song (1):
      drm/amdgpu: add judgement for dc support

Ashish Pawar (1):
      drm/amdgpu: PWRBRK sequence changes for Aldebaran

Ashley Thomas (1):
      drm/amd/display: add DMUB registers to crash dump diagnostic data.

Aurabindo Pillai (12):
      drm/amd/display: Add register definitions for Beige Goby
      drm/amd/display: Initial DC support for Beige Goby
      drm/amd/display: Edit license info for beige goby DC files
      drm/amd/display: Add DM support for Beige Goby
      drm/amd/amdgpu: Enable DCN IP init for Beige Goby
      drm/amd/display: Add callback for update_soc_for_wm_a for dcn303
      drm/amd/display: Enable HDCP for Beige Goby
      drm/amd/display: enable idle optimizations for beige goby
      drm/amd/display: take dc_lock in short pulse handler only
      drm/amd/display: add dummy PG callback for beige goby
      drm/amd/display: Increase stutter watermark for dcn302 and dcn303
      drm/amd/display: get socBB from VBIOS for dcn302 and dcn303

Baokun Li (1):
      drm/amd/display: fix warning: =E2=80=98update_dsc_caps=E2=80=99 and
=E2=80=98apply_dsc_policy_for_stream=E2=80=99 defined but not used

Bas Nieuwenhuizen (2):
      drm/amdgpu: Init GFX10_ADDR_CONFIG for VCN v3 in DPG mode.
      drm/amdgpu: Use device specific BO size & stride check.

Beatriz Martins de Carvalho (8):
      drm: drm_atomic.c: Adjust end of block comment
      drm: drm_auth.c: Adjust end of block comment
      drm: drm_bufs.c: Adjust end of block comment
      drm: drm_connector.c: Adjust end of block comment
      drm: drm_context.c: Adjust end of block comment
      drm: drm_atomic_uapi.c: Use tabs for code indents
      drm: drm_blend.c: Use tabs for code indents
      drm: drm_connector.c: Use tabs for code indents

Bernard Zhao (6):
      drm/gud: cleanup coding style a bit
      drm/vmwgfx: use min_t to replace min
      drm/i915: Use might_alloc()
      drm/amd/display: remove no need variable
      drm/radeon: delete useless function return values & remove
meaningless if(r) check code
      drm/msm: remove unneeded variable ret

Bhaskar Chowdhury (4):
      drm/vmwgfx: Fix a typo
      drm/msm/dpu: Fix a typo
      drm/msm/dpu: Fix a typo
      drm/msm/dp: Fixed couple of typos

Bhawanpreet Lakha (1):
      drm/amd/display: Add Overflow check to skip MALL

Bindu Ramamurthy (1):
      drm/amd/display: Allow bandwidth validation for 0 streams.

Bjorn Andersson (1):
      drm/msm/dpu: Avoid ABBA deadlock between IRQ modules

Bokun Zhang (2):
      drm/amdgpu: Complete multimedia bandwidth interface
      drm/amd/amdgpu: Use IP discovery data to determine VCN
enablement instead of MMSCH

Brandon Syu (1):
      drm/amd/display: fix HDCP reset sequence on reinitialize

CQ Tang (2):
      drm/i915: Create stolen memory region from local memory
      drm/i915/stolen: enforce the min_page_size contract

Calvin Hou (1):
      drm/amd/display: remove checking sink in is_timing_changed

Caz Yokoyama (2):
      drm/i915/gen12: Add recommended hardware tuning value
      drm/i915/icl: add Wa_22010271021 for all gen11

Chaitanya Dhere (1):
      drm/amd/display: DETBufferSizeInKbyte variable type modifications

Changfeng (2):
      drm/amdgpu: disable 3DCGCG on picasso/raven1 to avoid compute hang
      drm/amdgpu: switch kzalloc to kvzalloc in amdgpu_bo_create

Charlene Liu (1):
      drm/amd/display: get refclk from MICROSECOND_TIME_BASE_DIV HW registe=
r

Chen Li (2):
      radeon: fix coding issues reported from sparse
      radeon: use memcpy_to/fromio for UVD fw upload

Chengming Gui (29):
      drm/amd/amdgpu: add beige_goby asic type
      drm/amd/amdgpu: set fw load type for beige_goby
      drm/amd/amdgpu: set asic family and ip blocks for beige_goby
      drm/amd/amdgpu: add support for beige_goby firmware
      drm/amd/amdgpu: add gmc support for beige_goby
      drm/amd/amdgpu: add common support for beige_goby
      drm/amd/amdgpu: initialize IP offset for beige_goby
      drm/amd/amdgpu: add mmhub support for beige_goby
      drm/amd/amdgpu: add common ip block for beige_goby
      drm/amd/amdgpu: add gmc ip block for beige_goby
      drm/amd/amdgpu: add ih ip block for beige_goby
      drm/amd/amdgpu: add gfx ip block for beige_goby
      drm/amd/amdgpu: add sdma ip block for beige_goby
      drm/amd/amdgpu: configure beige_goby gfx according to gfx 10.3's
definition
      drm/amd/amdgpu: add virtual display support for beige_goby
      drm/amd/amdgpu: support cp_fw_write_wait for beige_goby
      drm/amd/amdgpu: Use IP discovery table for beige goby
      drm/amdkfd: support beige_goby KFD
      drm/amdkfd: add kfd2kgd funcs for beige_goby kfd support
      drm/amd/amdgpu: add smu support for beige_goby
      drm/amd/amdgpu: add psp support for beige_goby
      drm/amd/amdgpu: update golden_setting_10_3_5 for beige_goby
      drm/amd/pm: add mode1 support for beige_goby
      drm/amd/pm: update smu11 driver interface header for beige_goby
      drm/amd/pm: use macro to get pptable members
      drm/amd/pm: Use the PPTable from VBIOS for beige_goby
      drm/amd/amdgpu: Enable gfxoff for beige_goby
      drm/amd/pm: Update PPTable struct for beige_goby
      drm/amd/pm: Correct reserved uint32_t number in beige_goby_PPTable

Chris Morgan (1):
      drm/panel: add rotation support for Elida KD35T133 panels

Chris Park (2):
      drm/amd/display: Fix BSOD with NULL check
      drm/amd/display: Disconnect non-DP with no EDID

Chris Wilson (8):
      drm/i915/selftests: Skip aperture remapping selftest where there
is no aperture
      drm/i915/selftests: Only query RAPL for integrated power measurements
      drm/i915/gem: Pin the L-shape quirked object as unshrinkable
      drm/i915/gt: Move engine setup out of set_default_submission
      drm/i915/gt: Move submission_method into intel_gt
      drm/i915/gt: Move CS interrupt handler to the backend
      drm/i915/display: relax 2big checking around initial fb
      drm/i915/selftests: Reorder tasklet_disable vs local_bh_disable

Christian Gmeiner (1):
      drm/etnaviv: provide more ID values via GET_PARAM ioctl.

Christian K=C3=B6nig (54):
      drm/ttm: make global mutex and use count static
      drm/ttm: fix return value check
      drm/ttm: re-add debugfs tt_shrink file
      drm/amdgpu: make sure we unpin the UVD BO
      drm/amdgpu: freeing pinned objects is illegal now
      drm/ttm: warn stricter about freeing pinned BOs
      drm/nouveau: use bo->base.size instead of mem->num_pages
      drm/amdgpu: check base size instead of mem.num_pages
      drm/ttm: remove special handling for non GEM drivers
      drm/ttm: minor range manager coding style clean ups
      drm/ttm: move the page_alignment into the BO v2
      drm/amdgpu: fix coding style and documentation in amdgpu_gtt_mgr.c
      drm/amdgpu: fix coding style and documentation in amdgpu_vram_mgr.c
      drm/amdgpu: fix concurrent VM flushes on Vega/Navi v2
      drm/amdgpu: restructure amdgpu_vram_mgr_new
      drm/ttm: cleanup ttm_agp_backend
      drm/ttm: add ttm_sys_manager v3
      drm/ttm: always initialize the full ttm_resource v2
      drm/ttm: properly allocate sys resource during swapout
      drm/ttm: fix warning in new sys man
      MAINTAINERS: Add Xinhui Pan as another AMDGPU contact
      drm/amdgpu: re-apply "use the new cursor in the VM code" v2
      drm/amdgpu: use cursor functions in amdgpu_bo_in_cpu_visible_vram
      drm/amdgpu: set the contiguous flag if possible
      drm/amdgpu: check contiguous flags instead of mm_node
      drm/amdgpu: move struct amdgpu_vram_reservation into vram mgr
      drm/radeon: use the dummy page for GART if needed
      drm/amdgpu: stop touching sched.ready in the backend
      drm/ttm: rename bo->mem and make it a pointer
      dma-buf: fix inconsistent debug print v2
      dma-buf: add SPDX header and fix style in dma-resv.c
      dma-buf: cleanup dma-resv shared fence debugging a bit v2
      drm/ttm: allocate resource object instead of embedding it v2
      drm/ttm: flip over the range manager to self allocated nodes
      drm/ttm: flip over the sys manager to self allocated nodes
      drm/amdgpu: revert "drm/amdgpu: stop allocating dummy GTT nodes"
      drm/amdkfd: use resource cursor in svm_migrate_copy_to_vram v2
      drm/amdgpu: switch the GTT backend to self alloc
      drm/amdgpu: switch the VRAM backend to self alloc
      drm/nouveau: switch the TTM backends to self alloc
      drm/vmwgfx: switch the TTM backends to self alloc
      drm/ttm: flip the switch for driver allocated resources v2
      dma-buf: add missing EXPORT_SYMBOL
      dma-buf: rename and cleanup dma_resv_get_excl v3
      dma-buf: rename and cleanup dma_resv_get_list v2
      dma-buf: rename dma_resv_get_excl_rcu to _unlocked
      dma-buf: drop the _rcu postfix on function names v3
      drm/ttm: fix missing res assignment in ttm_range_man_alloc
      RDMA/umem: fix missing automated rename
      drm/ttm: fix access to uninitialized variable.
      drm/ttm: fix warning after moving resource to ghost obj
      drm/amdgpu: fix VM handling for GART allocations
      drm/ttm: fix pipelined gutting v2
      drm/ttm: nuke VM_MIXEDMAP on BO mappings v3

Christophe JAILLET (3):
      video: fbdev: imxfb: Fix an error message
      drm/rockchip: lvds: Fix an error handling path
      drm/amdgpu: Fix a a typo in a comment

Clinton Taylor (3):
      drm/i915/adl_p: Add PCI Devices IDs
      drm/i915/adl_p: ADL_P device info enabling
      drm/i915/adl_p: Add PCH support

Colin Ian King (10):
      drm/amdkfd: fix uint32 variable compared to less than zero
      drm/amdkfd: remove redundant initialization to variable r
      drm/amdkfd: Fix spelling mistake "unregisterd" -> "unregistered"
      drm: simpledrm: Fix use after free issues
      drm/vmwgfx: Fix memory allocation check and a leak of object fifo
      drm/rockchip: cdn-dp: fix sign extension on an int multiply for
a u64 result
      drm/amdgpu: remove redundant assignment of variable k
      drm/amd/display: remove variable active_disp
      drm/amd/display: Fix two spelling mistakes, clean wide lines
      drm: qxl: ensure surf.data is ininitialized

Corentin Labbe (1):
      dt-bindings: display: convert faraday,tve200

Dafna Hirschfeld (1):
      dt-bindings: display: add google, cros-ec-anx7688.yaml

Dale Zhao (1):
      drm/amd/display: Add audio support for DFP type of active branch
is DP case

Dan Carpenter (9):
      drm/i915: fix an error code in intel_overlay_do_put_image()
      drm/vc4: fix argument ordering in vc4_crtc_get_margins()
      drm: simpledrm: fix a potential NULL dereference
      drm: bridge: it66121: fix an error code in it66121_probe()
      drm: bridge: it66121: fix a resource leak in probe
      drm/bridge: ti-sn65dsi86: fix a ternary type promotion bug
      drm/amdgpu: add missing unreserve on error
      drm/amdgpu: Fix an error code in kfd_mem_attach_dmabuf()
      drm/amdgpu: fix amdgpu_preempt_mgr_new()

Daniel Vetter (17):
      drm/tegra: Don't set allow_fb_modifiers explicitly
      drm/vc4: Don't set allow_fb_modifiers explicitly
      drm/imx: Don't set allow_fb_modifiers explicitly
      drm/exynos: Don't set allow_fb_modifiers explicitly
      drm/todo: Add link to old debugfs RFC
      drm/arm: Don't set allow_fb_modifiers explicitly
      drm/arm/malidp: Always list modifiers
      drm/stm: Don't set allow_fb_modifiers explicitly
      drm/i915: Don't set allow_fb_modifiers explicitly
      drm/msm/dpu1: Don't set allow_fb_modifiers explicitly
      drm/msm/mdp4: Fix modifier support enabling
      drm/nouveau: Don't set allow_fb_modifiers explicitly
      drm/imx: Annotate dma-fence critical section in commit path
      drm/modifiers: Enforce consistency between the cap an IN_FORMATS
      drm/ttm: Explain why ttm_bo_add_move_fence uses a shared slot
      Merge v5.13-rc3 into drm-next
      drm/doc: Include fence chain api

Daniele Ceraolo Spurio (4):
      drm/i915/guc: skip disabling CTBs before sanitizing the GuC
      drm/i915/guc: use probe_error log for CT enablement failure
      drm/i915/guc: enable only the user interrupt when using GuC submissio=
n
      drm/i915/guc: Use guc_class instead of engine_class in fw interface

Darren Powell (10):
      amdgpu/pm: add extra info to SMU msg pre-check failed message
      amdgpu/pm: Prevent force of DCEFCLK on NAVI10 and SIENNA_CICHLID
      amdgpu/pm: set pp_dpm_dcefclk to readonly on NAVI10 and newer gpus
      amdgpu/pm: reorder definition of swsmu_pm_funcs for readability
      amdgpu/pm: clean up smu_get_power_limit function signature
      amdgpu/pm: modify Powerplay API get_power_limit to use new pp_power e=
nums
      amdgpu/pm: modify and add smu_get_power_limit to Powerplay API
      amdgpu/pm: handle return value for get_power_limit
      amdgpu/pm: add kernel documentation for smu_get_power_limit
      amdgpu/pm: replaced snprintf usage in amdgpu_pm.c with sysfs_emit

Dave Airlie (25):
      Merge tag 'drm-misc-next-2021-05-12' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'imx-drm-next-2021-05-12' of
git://git.pengutronix.de/git/pza/linux into drm-next
      Merge tag 'drm-misc-next-2021-05-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2021-05-19-1' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.14-2021-05-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'amd-drm-next-5.14-2021-05-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2021-06-01' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-gt-next-2021-05-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.14-2021-06-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2021-06-09' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      drm/amdgpu: use correct rounding macro for 64-bit
      Merge tag 'drm-intel-next-2021-06-09' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.14-2021-06-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge branch 'etnaviv/next' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'drm-intel-gt-next-2021-06-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'exynos-drm-next-for-v5.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'mediatek-drm-next-5.14' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'amd-drm-next-5.14-2021-06-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Backmerge tag 'v5.13-rc7' into drm-next
      Merge tag 'drm/tegra/for-5.14-rc1' of
ssh://git.freedesktop.org/git/tegra/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2021-06-18' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-msm-next-2021-06-23b' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'amd-drm-next-5.14-2021-06-22-1' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2021-06-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-fixes-2021-06-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next

Dave Stevenson (1):
      drm/vc4: Add HDR metadata property to the VC5 HDMI connectors

David Galiffi (1):
      drm/amd/display: Updated variable name.

David M Nieto (5):
      drm/amdgpu: free resources on fence usage query
      drm/amdgpu: fix fence calculation (v2)
      drm/amdgpu/pm: Update metrics table (v2)
      drm/amdgpu/pm: add new fields for Navi1x (v3)
      drm/amdgpu/pm: display vcn pp dpm (v4)

David Ward (1):
      drm/amd/display: Initialize attribute for hdcp_srm sysfs file

Deepak R Varma (1):
      drm/vmwgfx: replace idr_init() by idr_init_base()

Deepak Rawat (3):
      drm/hyperv: Add DRM driver for hyperv synthetic video device
      drm/hyperv: Handle feature change message from device
      MAINTAINERS: Add maintainer for hyperv video device

Dennis Li (9):
      drm/amdgpu: refine gprs init shaders to check coverage
      drm/amdgpu: fix no full coverage issue for gprs initialization
      drm/amdgpu: update the shader to clear specific SGPRs
      drm/amdgpu: covert ras status to kernel errno
      drm/amdgpu: correct the funtion to clear GCEA error status
      drm/amdgpu: add function to clear MMEA error status for aldebaran
      drm/amdgpu: add synchronization among waves in the same threadgroup
      drm/amdkfd: refine the poison data consumption handling
      drm/amdkfd: fix a resource leakage issue

Dingchen (David) Zhang (1):
      drm/amd/display: force CP to DESIRED when removing display

Dmitry Baryshkov (23):
      drm/msm: pass dump state as a function argument
      drm/msm: make msm_disp_state transient data struct
      drm/msm: get rid of msm_iomap_size
      drm/msm/dsi: add DSI PHY registers to snapshot data
      drm/msm: fix display snapshotting if DP or DSI is disabled
      drm/msm/dpu: merge dpu_hw_intr_get_interrupt_statuses into
dpu_hw_intr_dispatch_irqs
      drm/msm/dpu: hw_intr: always call dpu_hw_intr_clear_intr_status_noloc=
k
      drm/msm/dpu: define interrupt register names
      drm/msm/dpu: replace IRQ lookup with the data in hw catalog
      drm/msm/dpu: drop remains of old irq lookup subsystem
      drm/msm/dpu: simplify IRQ enabling/disabling
      drm/msm/dsi: print error code when MIPI DSI host registration fails
      drm/msm/dpu: remove unused dpu_hw_blk features
      drm/msm/dpu: drop dpu_hw_blk_destroy function
      drm/msm/dpu: use struct dpu_hw_merge_3d in dpu_hw_pingpong
      drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque structure
      drm/msm/dsi: do not enable PHYs when called for the slave DSI interfa=
ce
      drm/msm/mdp5: use drm atomic helpers to handle base drm plane state
      drm/msm/mdp5: use drm_plane_state for storing alpha value
      drm/msm/mdp5: use drm_plane_state for pixel blend mode
      drm/msm/mdp5: add support for alpha/blend_mode properties
      drm/msm/mdp5: switch to standard zpos property
      drm/msm/mdp5: provide dynamic bandwidth management

Dmytro Laktyushkin (3):
      drm/amd/display: fix use_max_lb flag for 420 pixel formats
      drm/amd/display: fix odm scaling
      drm/amd/display: Remove unnecessary blank lines

Douglas Anderson (25):
      drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
      drm/bridge: ti-sn65dsi86: Simplify refclk handling
      drm/bridge: ti-sn65dsi86: Remove incorrectly tagged kerneldoc comment
      drm/bridge: ti-sn65dsi86: Reorder remove()
      drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare() to post_disable(=
)
      drm/bridge: ti-sn65dsi86: Get rid of the useless detect() function
      drm/panel: panel-simple: Use runtime pm to avoid excessive
unprepare / prepare
      drm/panel: panel-simple: Add missing pm_runtime_disable() calls
      drm/bridge: ti-sn65dsi86: Rename the main driver data structure
      drm/bridge: ti-sn65dsi86: More renames in prep for sub-devices
      drm/bridge: ti-sn65dsi86: Use devm to do our runtime_disable
      drm/bridge: ti-sn65dsi86: Clean debugfs code
      drm/bridge: ti-sn65dsi86: Add local var for "dev" to simplify probe
      drm/bridge: ti-sn65dsi86: Cleanup managing of drvdata
      drm/bridge: ti-sn65dsi86: Move all the chip-related init to the start
      drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into
sub-drivers
      drm/panel: panel-simple: Get rid of hacky HPD chicken-and-egg code
      drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend
      drm/bridge: ti-sn65dsi86: Code motion of refclk management functions
      drm/bridge: ti-sn65dsi86: If refclk, DP AUX can happen w/out pre-enab=
le
      drm/panel: panel-simple: Remove extra call:
drm_connector_update_edid_property()
      drm/panel: panel-simple: Power the panel when reading the EDID
      drm/panel: panel-simple: Cache the EDID as long as we retain power
      drm/bridge: ti-sn65dsi86: Remove __exit from GPIO sub-driver remove h=
elper
      drm/panel: panel-simple: Add missing
pm_runtime_dont_use_autosuspend() calls

Dwaipayan Ray (1):
      drm/amd/amdgpu: Fix errors in function documentation

Enric Balletbo i Serra (1):
      drm/bridge: Add ChromeOS EC ANX7688 bridge driver support

Eric Bernstein (1):
      drm/amd/display: Updates for ODM Transition Test

Eric Huang (10):
      drm/amdkfd: add ACPI SRAT parsing for topology
      drm/amdgpu: Fix a bug on flag table_freed
      drm/amdkfd: Add flush-type parameter to kfd_flush_tlb
      drm/amdkfd: Add heavy-weight TLB flush after unmapping
      drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update
      drm/amdkfd: Make TLB flush conditional on mapping
      drm/amdgpu: Don't flush/invalidate HDP for APUs and A+A
      drm/amdgpu: Fix warning of Function parameter or member not described
      drm/amdkfd: Add memory sync before TLB flush on unmap
      drm/amdkfd: Set iolink non-coherent in topology

Eric Yang (1):
      drm/amd/display: Extend DMUB HW params to allow DM to specify boot op=
tions

Evan Quan (10):
      drm/amdgpu: add new MC firmware for Polaris12 32bit ASIC
      drm/amd/pm: new gpu_metrics structure for pmfw attached timestamp
      drm/amd/pm: expose pmfw attached timestamp on Aldebaran
      drm/amd/pm: correct MGpuFanBoost setting
      drm/amd/pm: drop the incomplete fix for Navi14 runpm issue
      drm/amd/pm: correct the runpm handling for BACO supported ASIC
      drm/amdgpu: make audio dev's D-state transition PMFW-aware
      drm/amd/pm: update the cached dpm feature status
      drm/amd/pm: correct the dpm features disablement for Navi1x
      drm/amd/pm: correct the power limits reporting on OOB supported

Evgenii Krasnikov (1):
      drm/amd/display: add visual confirm colors to differentiate
layer_index > 0

Fabio M. De Francesco (9):
      gpu: drm: Replace bare "unsigned" with "unsigned int"
      drm: drm_atomic_helper.c: Replace "unsigned" with "unsigned int"
      drm: drm_atomic_helper.c: Correct comments format
      drm/drm_bufs.c: In switch, add break in default case
      drm/drm_file.c: Define drm_send_event_helper() as 'static'
      drm/amdkfd: Fix kernel-doc syntax error
      drm/amd/pm/powerplay/hwmgr: Fix kernel-doc syntax in documentation
      drm/amd/amdgpu: Fix errors in documentation of function parameters
      drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_lock_all with
drm_modeset_lock

Fangzhi Zuo (5):
      drm/amd/display: Add dc log for DP SST DSC enable/disable
      drm/amd/display: Retrieve DSC Branch Decoder Caps
      drm/amd/display: Add Log for SST DSC Determination Policy
      drm/amd/display: Refactor SST DSC Determination Policy
      drm/amd/display: Add debugfs entry for dsc passthrough

Feifei Xu (3):
      drm/amdgpu: Change the sdma interrupt print level
      drm/amdgpu: Correct and simplify sdma 4.x irq.num_types
      drm/amd/pm: fix return value in aldebaran_set_mp1_state()

Felix Kuehling (32):
      drm/ttm: Don't count pages in SG BOs against pages_limit
      drm/amdkfd: Use drm_priv to pass VM from KFD to amdgpu
      drm/amdkfd: Allow access for mmapping KFD BOs
      drm/amdgpu: Remove verify_access shortcut for KFD BOs
      drm/amdkfd: map svm range to GPUs
      drm/amdkfd: svm range eviction and restore
      drm/amdgpu: Enable retry faults unconditionally on Aldebaran
      drm/amdkfd: validate vram svm range from TTM
      drm/amdkfd: HMM migrate ram to vram
      drm/amdkfd: HMM migrate vram to ram
      drm/amdkfd: invalidate tables on page retry fault
      drm/amdkfd: page table restore through svm API
      drm/amdkfd: add svm_bo eviction mechanism support
      drm/amdkfd: refine migration policy with xnack on
      drm/amdkfd: add svm range validate timestamp
      drm/amdkfd: multiple gpu migrate vram to vram
      drm/amdkfd: Add CONFIG_HSA_AMD_SVM
      drm/amdkfd: Make svm_migrate_put_sys_page static
      drm/amdgpu: Arcturus: MTYPE_NC for coarse-grain remote memory
      drm/amdgpu: Albebaran: MTYPE_NC for coarse-grain remote memory
      drm/amdgpu: Rename kfd_bo_va_list to kfd_mem_attachment
      drm/amdgpu: Keep a bo-reference per-attachment
      drm/amdgpu: Simplify AQL queue mapping
      drm/amdgpu: Add multi-GPU DMA mapping helpers
      drm/amdgpu: DMA map/unmap when updating GPU mappings
      drm/amdgpu: Move kfd_mem_attach outside reservation
      drm/amdgpu: Add DMA mapping of GTT BOs
      drm/amdgpu: Move dmabuf attach/detach to backend_(un)bind
      drm/amdgpu: Add new placement for preemptible SG BOs
      drm/amdgpu: Use preemptible placement for KFD
      drm/amdkfd: Disable SVM per GPU, not per process
      drm/amdgpu: Use spinlock_irqsave for pasid_lock

Geert Uytterhoeven (1):
      drm/bridge: DRM_CROS_EC_ANX7688 should depend on I2C_CROS_EC_TUNNEL

George Shen (2):
      drm/amd/display: Filter out YCbCr420 timing if VSC SDP not supported
      drm/amd/display: Minor refactor of DP PHY test automation

Gerd Hoffmann (2):
      drm/qxl: drop redundant code
      drm/qxl: balance dumb_shadow_bo pin

Graham Sider (9):
      drm/amd/pm: Add u64 throttler status field to gpu_metrics
      drm/amd/pm: Add ASIC independent throttle bits
      drm/amd/pm: Add common throttler translation func
      drm/amd/pm: Add arcturus throttler translation
      drm/amd/pm: Add navi1x throttler translation
      drm/amd/pm: Add sienna cichlid throttler translation
      drm/amd/pm: Add vangogh throttler translation
      drm/amd/pm: Add renoir throttler translation
      drm/amd/pm: Add aldebaran throttler translation

Guchun Chen (3):
      drm/amdgpu: update gc golden setting for Navi12
      drm/amdgpu: update sdma golden setting for Navi12
      drm/amdgpu: use adev_to_drm macro for consistency (v2)

Guenter Roeck (4):
      drm/amd/display: Fix build warnings
      drm/amd/amdkfd: Drop unnecessary NULL check after container_of
      drm/msm/dp: Drop unnecessary NULL checks after container_of
      drm/msm/dpu: Drop unnecessary NULL checks after container_of in
dpu_encoder

Gustavo A. R. Silva (5):
      drm/radeon/ni_dpm: Fix booting bug
      drm/radeon/si_dpm: Fix SMU power state load
      drm/amd/pm: Fix out-of-bounds bug
      drm/amd/pm: Fix fall-through warning for Clang
      drm/amd/display: Fix fall-through warning for Clang

Gwan-gyeong Mun (6):
      drm/i915/display/psr: Disable DC3CO when the PSR2 is used
      drm/i915/display: Disable PSR2 if TGL Display stepping is B1 from A0
      drm/i915/display: Replace dc3co_enabled with dc3co_exitline on
intel_psr struct
      drm/i915/display: Add PSR interrupt error check function
      drm/i915/display: Remove a redundant function argument from
intel_psr_enable_source()
      drm/i915/display: Introduce new intel_psr_pause/resume function

Hans de Goede (2):
      drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when
disabling the panel
      drm/i915/display/vlv_dsi: Move panel_pwr_cycle_delay to next panel-on

Hao Fang (1):
      drm/hisilicon/kirin: Use the correct HiSilicon copyright

Harish Kasiviswanathan (2):
      drm/amd/pm: Update energy_accumulator in gpu metrics
      drm/amdkfd: Add Aldebaran gws support

Harry Wentland (1):
      drm/amd/display: Reject non-zero src_y and src_x for video planes

Hawking Zhang (30):
      drm/amdgpu: disable gfx ras by default in aldebaran
      drm/amdgpu: implement smuio callback to query socket id
      drm/amdgpu: provide socket/die id info in RAS message
      drm/amdgpu: remove unnecessary header include
      drm/amdgpu: add hdp ras structures
      drm/amdgpu: add helpers for hdp ras init/fini
      drm/amdgpu: implement hdp v4_0 ras functions
      drm/amdgpu: initialize hdp v4_0 ras functions
      drm/amdgpu: init/fini hdp v4_0 ras
      drm/amdgpu: enable ras error count query and reset for HDP
      drm/amdgpu: retired reset_ras_error_count from hdp callbacks
      drm/amdgpu: switch to mmhub ras callback for ras fini
      drm/amdgpu: enable gfx ras in aldebran by default
      drm/amdgpu: add atomfirmware helper function to query fw cap
      drm/amdgpu: switch to cached fw flags for gpu virt cap
      drm/amdgpu: switch to cached fw flags for sram ecc cap
      drm/amdgpu: switch to cached fw flags for mem training cap
      drm/amdgpu: add helper function to query dynamic boot config cap
      drm/amdgpu: query boot config cap before issue psp cmd
      drm/amdgpu: add gc_10_3_5 golden setting for beige_goby
      drm/amdkfd: add sdma poison consumption handling
      drm/amdgpu: update psp gfx i/f to support dynamic GECC
      drm/amdgpu: allow different boot configs
      drm/amdgpu: add helper function to query gecc status in boot config
      drm/amdgpu: enable dynamic GECC support (v2)
      drm/amdgpu: add psp runtime db structures
      drm/amdgpu: add helper function to query psp runtime db entry (v2)
      drm/amdgpu: cache psp runtime boot_cfg_bitmask in sw_int
      drm/amdgpu: disable DRAM memory training when GECC is enabled
      drm/amdgpu: correct psp ucode arrary start address

Hsin-Yi Wang (2):
      drm/i915/selftests: Rename pm_ prefixed functions names
      drm/bridge: anx7625: Fix power on delay

Huang Rui (2):
      drm/amdgpu: introduce a stolen reserved buffer to protect
specific buffer region (v2)
      drm/amd/pm: add vcn/jepg enable functions for yellow carp

Hugo Hu (1):
      drm/amd/display: treat memory as a single-channel for asymmetric memo=
ry V3

Ilya Bakoulin (3):
      drm/amd/display: Fix clock table filling logic
      drm/amd/display: Handle pixel format test request
      drm/amd/display: Revert "Fix clock table filling logic"

Imre Deak (18):
      drm/i915: Uninit the DMC FW loader state during shutdown
      drm/i915: Fix modesetting in case of unexpected AUX timeouts
      drm/i915: Drop redundant address-of op before lttpr_common_caps array
      drm/i915: Simplify CCS and UV plane alignment handling
      drm/i915: Pass intel_framebuffer instad of drm_framebuffer to
intel_fill_fb_info()
      drm/i915/tgl+: Add the missing MC CCS/XYUV8888 format support
      drm/i915/adl_p: Disable support for 90/270 FB rotation
      drm/i915/adl_p: Require a minimum of 8 tiles stride for DPT FBs
      drm/i915/adl_p: Enable remapping to pad DPT FB strides to POT
      drm/i915/adl_p: Program DP/HDMI link rate to DDI_BUF_CTL
      drm/i915: Reenable LTTPR non-transparent LT mode for DPCD_REV<1.4
      drm/i915/adlp: Require DPT FB CCS color planes to be 2MB aligned
      drm/i915/adlp: Fix GEM VM asserts for DPT VMs
      drm/i915/debugfs: Print remap info for DPT VMAs as well
      drm/i915/adlp: Add missing TBT AUX -> PW#2 power domain dependencies
      drm/i915/ddi: Flush encoder power domain ref puts during driver unloa=
d
      drm/i915: Fix incorrect assert about pending power domain async-put w=
ork
      drm/i915/adlp: Fix AUX power well -> PHY mapping

Inki Dae (1):
      drm/exynos: use pm_runtime_resume_and_get()

Jack Zhang (1):
      drm/amd/amdgpu/sriov disable all ip hw status by default

Jake Wang (3):
      drm/amd/display: Added multi instance support for ABM
      drm/amd/display: Added support for individual control for
multiple back-light instances.
      drm/amd/display: Trigger full update after DCC on/off

James Willcox (1):
      drm/msm/mdp5: add perf blocks for holding fudge factors

James Zhu (13):
      drm/amdgpu: add video_codecs query support for aldebaran
      drm/amdgpu/vcn1: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn2.0: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn2.5: add cancel_delayed_work_sync before power gate
      drm/amdgpu/vcn3: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg2.0: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg2.5: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg3: add cancel_delayed_work_sync before power gate
      drm/amdgpu/jpeg: Remove harvest checking on CHIP_YELLOW_CARP
      drm/amdgpu/vcn: add vcn support for yellow carp
      drm/amdgpu: enable vcn/jpeg on yellow carp
      drm/amdgpu: enable vcn dpg mode on yellow carp
      drm/amdgpu: add video_codecs query support for yellow carp

Jani Nikula (9):
      Merge drm/drm-next into drm-intel-next
      drm/i915/hdcp: add intel_dp_hdcp.h and rename init accordingly
      drm/i915/display: move crtc and dpll declarations where they belong
      drm/i915/backlight: clean up backlight device register
      drm/i915/backlight: use unique backlight device names
      drm/i915/audio: simplify, don't mask out in all branches
      drm/i915/audio: fix indentation, remove extra braces
      drm/i915/adl_p: enable MSO on pipe B
      drm/i915/dsc: abstract helpers to get bigjoiner primary/secondary crt=
c

Janusz Krzysztofik (1):
      drm/i915/gt: Do release kernel context if breadcrumb measure fails

Jason Ekstrand (1):
      drm/i915/pm: Make the wm parameter of print_wm_latency a pointer

Javier Martinez Canillas (2):
      drm/fb-helper: improve DRM fbdev emulation device names
      drm/rockchip: remove existing generic drivers to take over the device

Jayendran Ramani (1):
      drm/amd/display: Return last used DRR VTOTAL from DC

Jernej Skrabec (1):
      drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC d=
river

Jiansong Chen (3):
      drm/amdgpu: fix GCR_GENERAL_CNTL offset for beige_goby
      drm/amdgpu: refine amdgpu_fru_get_product_info
      drm/amdgpu: remove unsafe optimization to drop preamble ib

Jiapeng Chong (8):
      drm/etnaviv: Remove redundant NULL check
      drm/amdgpu: Fix inconsistent indenting
      drm: bridge: cdns-mhdp8546: Fix inconsistent indenting
      drm/rockchip: remove unused function
      amdgpu: remove unreachable code
      drm/amd/display: Fix duplicate included dce110_hw_sequencer.h
      drm/amd/display: Fix duplicate included clk_mgr.h
      drm/amd/display: use ARRAY_SIZE for base60_refresh_rates

Jiawei Gu (2):
      drm/amdgpu: Fill adev->unique_id with data from PF2VF msg
      drm/amdgpu: Add vbios info ioctl interface

Jimmy Kizito (8):
      drm/amd/display: Update DPRX detection.
      drm/amd/display: Update setting of DP training parameters.
      drm/amd/display: Add fallback and abort paths for DP link training.
      drm/amd/display: Expand DP module training API.
      drm/amd/display: Update DP link configuration.
      drm/amd/display: Expand DP module clock recovery API.
      drm/amd/display: Expand DP module equalization API.
      drm/amd/display: Support mappable encoders when transmitting
training patterns.

JinZe.Xu (1):
      drm/amd/display: Control power gating by driver.

Jingwen Chen (1):
      drm/amd/amdgpu: fix refcount leak

Jinzhou Su (3):
      drm/amdgpu: Enable SDMA MGCG for Vangogh
      drm/amdgpu: Enable SDMA LS for Vangogh
      drm/amdgpu: Add compile flag for securedisplay

Joe Perches (1):
      drm/amd/display: Fix typo of format termination newline

Johan Jonker (1):
      drm/rockchip: vop: add PX30 version info

John Clements (5):
      drm/amdgpu: add support for ras init flags
      drm/amdgpu: Conditionally reset RAS counters on boot
      drm/amdgpu: Update psp fw attestation support list
      drm/amdgpu: Updated fw header structure source
      drm/amdgpu: Added support for loading auxiliary PSP FW

John Harrison (1):
      drm/i915/uc: Use platform specific defaults for GuC/HuC enabling

Jonathan Kim (6):
      drm/amdkfd: add per-vmid-debug map_process_support
      drm/amdkfd: fix spelling mistake in packet manager
      drm/amdkfd: report atomics support in io_links over xgmi
      drm/amdkfd: report the numa weight between host and device over xgmi
      drm/amdkfd: fix no atomics settings in the kfd topology
      drm/amdkfd: fix circular locking on get_wave_state

Jonathan Marek (10):
      drm/msm: remove unnecessary mmap logic for cached BOs
      drm/msm: replace MSM_BO_UNCACHED with MSM_BO_WC for internal objects
      drm/msm: use the right pgprot when mapping BOs in the kernel
      drm/msm: add MSM_BO_CACHED_COHERENT
      drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)
      drm/msm: remove unused icc_path/ocmem_icc_path
      drm/msm/a6xx: use AOP-initialized PDC for a650
      drm/msm/a6xx: add GMU_CX_GMU_CX_FALNEXT_INTF write for a650
      drm/msm/a6xx: add missing PC_DBG_ECO_CNTL bit for a640/a650
      drm/msm/a6xx: add support for Adreno 660 GPU

Joonas Lahtinen (2):
      Merge tag 'topic/intel-gen-to-ver-2021-04-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-intel-gt-next
      Merge drm/drm-next into drm-intel-gt-next

Jordan Crouse (3):
      iommu/arm-smmu: Add support for driver IOMMU fault handlers
      iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get
pagefault info
      drm/msm: Improve the a6xx page fault handler

Joseph Kogut (3):
      drm: remove usage of drm_pci_alloc/free
      drm: remove legacy drm_pci_alloc/free abstraction
      drm: fix leaked dma handles after removing drm_pci_free

Joshua Aberback (1):
      drm/amd/display: Update DCN303 SR Exit Latency

Josip Pavic (2):
      drm/amd/display: tune backlight ramping profiles
      drm/amd/display: do not compare integers of different widths

Jos=C3=A9 Roberto de Souza (37):
      drm/i915: Move Wa_16011163337 to gen12_ctx_workarounds_init()
      drm/i915: Skip display interruption setup when display is not availab=
le
      drm/i915: Do not set any power wells when there is no display
      drm/i915: skip display initialization when there is no display
      drm/i915/display: Defeature PSR2 for RKL and ADL-S
      drm/i915/display: Implement Wa_14013723622
      Revert "drm/i915/tgl/psr: Fix glitches when doing frontbuffer
modifications"
      drm/i915/display/psr: Fix cppcheck warnings
      drm/i915/display/xelpd: Do not program EDP_Y_COORDINATE_ENABLE
      drm: Rename DP_PSR_SELECTIVE_UPDATE to better mach eDP spec
      drm/i915/display: Disable PSR2 sel fetch in TGL pre-production
      drm/i915/xelpd: Fallback to plane stride limitations when using DPT
      drm/i915/adl_p: Add stride restriction when using DPT
      drm/i915/display: Fill PSR state during hardware configuration read o=
ut
      drm/i915/display: Replace intel_psr_enabled() calls by
intel_crtc_state check
      drm/i915/display: Drop duplicated code in intel_dp_set_infoframes()
      drm/i915/display: Drop dead code from hsw_read_infoframe()
      drm/i915/display/xelpd: Implement Wa_14013475917
      drm/i915/xelpd: Provide port/phy mapping for vbt
      drm/i915/display/tc: Rename safe_mode functions ownership
      drm/i915/adl_p: Enable modular fia
      drm/i915/adl_p: Add IPs stepping mapping
      drm/i915/adl_p: Implement Wa_22011091694
      drm/i915/display/adl_p: Implement Wa_22011320316
      drm/i915/adl_p: Disable CCS on a-step (Wa_22011186057)
      drm/i915: Initialize err in remap_io_sg()
      drm/i915/adl_p: Implement TC sequences
      drm/i915/adl_p: Don't config MBUS and DBUF during display initializat=
ion
      drm/i915/display/adl_p: Drop earlier return in tc_has_modular_fia()
      drm/i915/adl_p: Handle TC cold
      drm/i915: WA for zero memory channel
      drm/i915/display/adl_p: Allow DC3CO in pipe and port B
      drm/i915/display/adl_p: Disable PSR2
      drm/i915/display: Fix fastsets involving PSR
      drm/i915/display: Allow fastsets when DP_SDP_VSC infoframe do
not match with PSR enabled
      drm/i915/display: Drop FIXME about turn off infoframes
      drm/dp_mst: Add missing drm parameters to recently added call to
drm_dbg_kms()

Jude Shih (1):
      drm/amd/display: Support for DMUB AUX

Juha-Pekka Heikkil=C3=A4 (1):
      drm/i915/xelpd: Support 128k plane stride

Kai-Heng Feng (5):
      efifb: Check efifb_pci_dev before using it
      drm/i915/dp: Use slow and wide link training for everything
      drm/amdgpu: Register VGA clients after init can no longer fail
      drm/radeon/dpm: Disable sclk switching on Oland when two 4K 60Hz
monitors are connected
      vgaarb: Use ACPI HID name to find integrated GPU

Kees Cook (6):
      drm/radeon: Fix off-by-one power_state index heap overwrite
      drm/radeon: Avoid power table parsing memory leaks
      drm/amd/display: Avoid HDCP over-read and corruption
      drm: Avoid circular dependencies for CONFIG_FB
      drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
      drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends

Kenneth Feng (2):
      drm/amd/amdgpu: add cgls
      drm/amd/pm: enable ASPM by default

Kevin Wang (3):
      drm/amdkfd: correct sienna_cichlid SDMA RLC register offset error
      drm/amdgpu: fix sdma firmware version error in sriov
      drm/amdgpu: optimize code about format string in
gfx_v10_0_init_microcode()

Krishna Manikandan (5):
      dt-bindings: msm: disp: add yaml schemas for DPU bindings
      dt-bindings: msm: dsi: add yaml schemas for DSI bindings
      dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
      dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
      drm/msm/disp/dpu1: avoid perf update in frame done event

Krzysztof Kozlowski (2):
      drm/gma500: correct kerneldoc
      drm/gma500: remove trailing whitespaces

KuoHsiang Chou (1):
      drm/ast: Fixed CVE for DP501

Kuogee Hsieh (2):
      drm/msm/dp: handle irq_hpd with sink_count =3D 0 correctly
      drm/msm/dp: power off DP phy at suspend

Lang Yu (1):
      drm/amd/amdgpu: fix a potential deadlock in gpu reset

Lee Jones (77):
      drm/amd/amdgpu/amdgpu_device: Remove unused variable 'r'
      drm/radeon/radeon_device: Provide function name in kernel-doc header
      drm/amd/amdgpu/amdgpu_fence: Provide description for 'sched_score'
      drm/amd/amdgpu/amdgpu_gart: Correct a couple of function names in the=
 docs
      drm/amd/amdgpu/amdgpu_ttm: Fix incorrectly documented function
'amdgpu_ttm_copy_mem_to_mem()'
      drm/amd/amdgpu/amdgpu_ring: Provide description for 'sched_score'
      drm/amd/amdgpu/amdgpu_cs: Repair some function naming disparity
      drm/ttm/ttm_bo: Fix incorrectly documented function 'ttm_bo_cleanup_r=
efs'
      drm/scheduler/sched_entity: Fix some function name disparity
      drm/ttm/ttm_device: Demote kernel-doc abuses
      drm/radeon/radeon_cs: Fix incorrectly documented function
'radeon_cs_parser_fini'
      drm/amd/amdgpu/amdgpu_ids: Correct some function name disparity
      drm/amd/amdgpu/amdgpu_debugfs: Fix a couple of misnamed functions
      drm/amd/amdgpu/amdgpu_gmc: Fix a little naming related doc-rot
      drm/amd/amdgpu/cik_sdma: Fix a few incorrectly named functions
      drm/amd/amdgpu/gfx_v7_0: Repair function names in the documentation
      drm/amd/amdgpu/si_dma: Fix some function name disparity
      drm/amd/amdgpu/dce_v6_0: Repair function name of
'si_get_number_of_dram_channels()'
      drm/radeon/cik: Fix incorrectly named function 'cik_irq_suspend()'
      drm/radeon/radeon_vm: Fix function naming disparities
      drm/amd/include/aldebaran_ip_offset: Mark top-level IP_BASE as
__maybe_unused
      drm/amd/amdgpu/gmc_v7_0: Fix potential copy/paste issue
      drm/amd/amdgpu/mmhub_v9_4: Fix naming disparity with
'mmhub_v9_4_set_fault_enable_default()'
      drm/amd/amdgpu/gmc_v10_0: Fix potential copy/paste issue
      drm/radeon/r100: Realign doc header with function
'r100_cs_packet_parse_vline()'
      drm/amd/amdgpu/gfx_v9_4_2: Mark functions called by reference as stat=
ic
      drm/amd/amdgpu/sdma_v2_4: Correct misnamed function
'sdma_v2_4_ring_emit_hdp_flush()'
      drm/amd/amdgpu/sdma_v4_0: Realign functions with their headers
      drm/amd/amdgpu/sdma_v5_0: Fix typo in function name
      drm/amd/amdgpu/amdgpu_vce: Fix a few incorrectly named functions
      drm/amd/amdgpu/sdma_v5_2: Repair typo in function name
      drm/amd/amdgpu/vcn_v1_0: Fix some function naming disparity
      drm/amd/amdgpu/gfx_v10_0: Demote kernel-doc abuse
      drm/amd/amdgpu/smuio_v13_0: Realign
'smuio_v13_0_is_host_gpu_xgmi_supported()' header
      drm/amd/pm/inc/smu_v13_0: Move table into the only source file
that uses it
      drm/amd/pm/powerplay/hwmgr/smu7_thermal: Provide function name
for 'smu7_fan_ctrl_set_default_mode()'
      drm/amd/pm/powerplay/hwmgr/vega12_thermal: Provide function name
      drm/amd/pm/powerplay/hwmgr/vega12_hwmgr: Provide
'vega12_init_smc_table()' function name
      drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Kernel-doc headers must
contain function names
      drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Provide function name
'vega20_init_smc_table()'
      drm/amd/display/dc/bios/command_table_helper: Fix function name
for 'dal_cmd_table_helper_transmitter_bp_to_atom()'
      drm/amd/display/dc/bios/command_table_helper2: Fix function name
'dal_cmd_table_helper_transmitter_bp_to_atom2()'
      drm/amd/display/dc/bios/bios_parser: Fix formatting and misnaming iss=
ues
      drm/amd/display/amdgpu_dm/amdgpu_dm: Functions must directly
follow their headers
      drm/amd/display/dc/dce/dmub_outbox: Convert over to kernel-doc
      drm/amd/display/dc/gpio/gpio_service: Pass around correct
dce_{version, environment} types
      drm/amd/display/dc/dce110/dce110_hw_sequencer: Include our own header
      drm/amd/display/dc/dce/dce_mem_input: Remove duplicate
initialisation of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT, MASK}
      drm/amd/display/dc/dce/dce_mem_input: Remove duplicate
initialisation of GRPH_CONTROL__GRPH_NUM_BANKS_{SHIFT, MASK
      drm/amd/amdgpu/amdgpu_device: Make local function static
      drm/amd/display/amdgpu_dm/amdgpu_dm: Fix kernel-doc formatting issue
      drm/amd/display/dc/dce110/dce110_hw_sequencer: Include header
containing our prototypes
      drm/amd/display/dc/core/dc: Convert function headers to kernel-doc
      drm/amd/display/dmub/src/dmub_srv_stat: Convert function header
to kernel-doc
      drm/amd/display/modules/hdcp/hdcp_psp: Remove unused function
'mod_hdcp_hdcp1_get_link_encryption_status()'
      drm/vgem/vgem_drv: Standard comment blocks should not use
kernel-doc format
      drm/mediatek/mtk_disp_color: Strip incorrect doc and demote header
      drm/mediatek/mtk_disp_gamma: Strip and demote non-conformant
kernel-doc header
      drm/mediatek/mtk_disp_ovl: Strip and demote non-conformant header
      drm/mediatek/mtk_disp_rdma: Strip and demote non-conformant
kernel-doc header
      drm/sti/sti_hdmi_tx3g4c28phy: Provide function names for
kernel-doc headers
      drm/sti/sti_hda: Provide missing function names
      drm/sti/sti_tvout: Provide a bunch of missing function names
      drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()=
'
      drm/nouveau/nvkm/subdev/mc/tu102: Make functions called by
reference static
      drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
      drm/panel/panel-raspberrypi-touchscreen: Demote kernel-doc abuse
      drm/panel/panel-sitronix-st7701: Demote kernel-doc abuse
      drm/exynos/exynos7_drm_decon: Fix incorrect naming of
'decon_shadow_protect_win()'
      drm/exynos/exynos_drm_ipp: Fix documentation for
'exynos_drm_ipp_get_{caps,res}_ioctl()'
      drm/vboxvideo/hgsmi_base: Place function names into headers
      drm/vboxvideo/modesetting: Provide function names for prototype heade=
rs
      drm/msm/dp/dp_display: Remove unused variable 'hpd'
      drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
      drm/msm/msm_gem: Demote kernel-doc abuses
      drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
      drm/msm/dp/dp_link: Fix some potential doc-rot

Leslie Shi (1):
      drm/amd/display: Fix uninitialized field when expanding macro
MI_DCE12_MASK_SH_LIST

Lewis Huang (2):
      drm/amd/display: Revert wait vblank on update dpp clock
      drm/amd/display: skip program clock when allow seamless boot

Lijo Lazar (11):
      drm/amd/pm: Add interface to get FW private buffer
      drm/amd/pm: Add debugfs node to read private buffer
      drm/amd/pm: Update aldebaran pmfw interface
      drm/amd/pm: Add custom/current freq to pstates
      drm/amd/pm: Fix showing incorrect frequencies on aldebaran
      drm/amd/pm: Reset max GFX clock after disabling determinism
      drm/amd/pm: Remove BACO check for aldebaran
      drm/amd/pm: Read BIF STRAP also for BACO check
      drm/amd/pm: Add VF check to BACO support check
      drm/amd/pm: Use generic BACO function for smu11 ASICs
      drm/amd/pm: Only primary die supports power data

Likun GAO (1):
      drm/amdgpu: add judgement when add ip blocks (v2)

Likun Gao (1):
      drm/amdgpu: update the method for harvest IP for specific SKU

Linus Walleij (3):
      drm/panel: Add DT bindings for Samsung LMS397KF04
      drm/panel: s6e63m0: Depromote debug prints
      drm/bridge: lt8912b: Drop unused includes

Liu Ying (4):
      drm/bridge: nwl-dsi: Force a full modeset when
crtc_state->active is changed to be true
      drm/bridge: nwl-dsi: Remove a check on unchanged HS clock rate
from ->mode_set()
      drm/bridge: nwl-dsi: Get MIPI DSI controller and PHY ready in ->mode_=
set()
      drm/imx: ipuv3-plane: Remove two unnecessary export symbols

Logush Oliver (1):
      drm/amd/display: Fix edp_bootup_bl_level initialization issue

Luben Tuikov (7):
      drm/amdgpu: Remove redundant ras->supported
      drm/amdgpu: Move up ras_hw_supported
      drm/amdgpu: Rename to ras_*_enabled
      drm/amdgpu: Export ras_*_enabled to debugfs
      drm/amdgpu: Don't query CE and UE errors
      drm/amdgpu: Fix RAS function interface
      drm/amdgpu: Use delayed work to collect RAS error counters

Lucas De Marchi (24):
      drm/i915/display: use DISPLAY_VER() on remaining users
      drm/i915: rename display.version to display.ver
      drm/i915/display: rename display version macros
      drm/i915: add macros for graphics and media versions
      drm/i915/gt: replace gen use in intel_engine_cs
      drm/i915/selftests: replace unused mask with simple version
      drm/i915/selftests: eliminate use of gen_mask
      drm/i915: finish removal of gen_mask
      drm/i915: eliminate remaining uses of intel_device_info->gen
      drm/i915: finish removal of gen from intel_device_info
      drm/i915: add media and display versions to device_info print
      drm/i915: split dgfx features from gen 12
      drm/i915/display: move vbt check to intel_ddi_init()
      drm/i915/display: remove FIXME comment for intended feature
      drm/i915/display: remove strap checks from gen 9
      drm/i915/display: hide workaround for broken vbt in intel_bios.c
      drm/i915/display: fix typo when returning table
      drm/i915/gvt: replace IS_GEN and friends with GRAPHICS_VER
      drm/i915/display: replace IS_GEN() in commented code
      drm/i915/gt: replace IS_GEN and friends with GRAPHICS_VER
      drm/i915/gt: Add remaining conversions to GRAPHICS_VER
      drm/i915/gem: replace IS_GEN and friends with GRAPHICS_VER
      drm/i915: replace IS_GEN and friends with GRAPHICS_VER
      drm/i915: Add remaining conversions to GRAPHICS_VER

Lucas Stach (2):
      drm/etnaviv: rework linear window offset calculation
      drm/imx: ipuv3-plane: fix PRG modifiers after drm managed
resource conversion

Lukas Bulwahn (1):
      MAINTAINERS: repair reference in DRM DRIVER FOR SIMPLE FRAMEBUFFERS

Lv Yunlong (1):
      drm/i915/gt: Fix a double free in gen8_preallocate_top_level_pdp

Lyude Paul (21):
      drm/i915/dpcd_bl: Don't try vesa interface unless specified by VBT
      drm/bridge/cdns-mhdp8546: Register DP aux channel with userspace
      drm/nouveau/kms/nv50-: Move AUX adapter reg to connector late
register/early unregister
      drm/dp: Add backpointer to drm_device in drm_dp_aux
      drm/dp: Clarify DP AUX registration time
      drm/dp: Pass drm_dp_aux to drm_dp_link_train_clock_recovery_delay()
      drm/dp: Pass drm_dp_aux to drm_dp*_link_train_channel_eq_delay()
      drm/dp: Always print aux channel name in logs
      drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_detect()
      drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_set_tmds_output=
()
      drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_max_tmds_clock(=
)
      drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_get_tmds_output=
()
      drm/dp_dual_mode: Pass drm_device to drm_lspcon_(get|set)_mode()
      drm/dp_mst: Pass drm_dp_mst_topology_mgr to drm_dp_get_vc_payload_bw(=
)
      drm/print: Handle potentially NULL drm_devices in drm_dbg_*
      drm/dp: Convert drm_dp_helper.c to using drm_err/drm_dbg_*()
      drm/dp_dual_mode: Convert drm_dp_dual_mode_helper.c to using
drm_err/drm_dbg_kms()
      drm/dp_mst: Convert drm_dp_mst_topology.c to drm_err()/drm_dbg*()
      drm/dp: Handle zeroed port counts in drm_dp_read_downstream_info()
      drm/dp: Drop open-coded drm_dp_is_branch() in
drm_dp_read_downstream_info()
      drm/dp: Fix bogus DPCD version check in drm_dp_read_downstream_info()

Maarten Lankhorst (5):
      drm/i915: Fix docbook descriptions for i915_gem_shrinker
      drm/i915: Fix docbook descriptions for i915_cmd_parser
      drm/i915: Use trylock in shrinker for ggtt on bsw vt-d and bxt, v2.
      drm/i915: Remove erroneous i915_is_ggtt check for
I915_GEM_OBJECT_UNBIND_VM_TRYLOCK
      drm/i915: Disable mmap ioctl for gen12+

Manasi Navare (2):
      drm/i915/xelpd: Add VRR guardband for VRR CTL
      drm/i915: Initialize the mbus_offset to fix Klockwork issue

Marc Kleine-Budde (1):
      drm/etnaviv: dump: fix sparse warnings

Marek Vasut (4):
      dt-bindings: drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
SN65DSI84 bindings
      drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver
      drm/bridge: ti-sn65dsi83: Fix syntax formatting issues
      drm/stm: Remove usage of drm_display_mode_to_videomode()

Mario Kleiner (6):
      drm/fourcc: Add 16 bpc fixed point framebuffer formats.
      drm/amd/display: Add support for SURFACE_PIXEL_FORMAT_GRPH_ABGR161616=
16.
      drm/amd/display: Increase linebuffer pixel depth to 36bpp.
      drm/amd/display: Make assert in DCE's
program_bit_depth_reduction more lenient.
      drm/amd/display: Enable support for 16 bpc fixed-point framebuffers.
      drm/amd/display: Keep linebuffer pixel depth at 30bpp for DCE-11.0.

Mark Yacoub (1):
      drm/amd/display: Verify Gamma & Degamma LUT sizes in
amdgpu_dm_atomic_check

Martin Tsai (1):
      drm/amd/display: Clear lane settings after LTTPRs have been trained

Mateusz Kwiatkowski (3):
      drm/vc4: Fix clock source for VEC PixelValve on BCM2711
      dt-bindings: display: bcm2835-vec: Add BCM2711 compatible
      drm/vc4: Separate VEC compatible variants

Matt Roper (14):
      drm/i915/display: Eliminate IS_GEN9_{BC,LP}
      drm/i915/display: Eliminate IS_GEN9_{BC,LP}
      drm/i915/lmem: Fail driver init if LMEM training failed
      drm/i915/xelpd: add XE_LPD display characteristics
      drm/i915/xelpd: Handle proper AUX interrupt bits
      drm/i915/xelpd: Define plane capabilities
      drm/i915/xelpd: Add XE_LPD power wells
      drm/i915/xelpd: Required bandwidth increases when VT-d is active
      drm/i915/xelpd: Add Wa_14011503030
      drm/i915/xelpd: Handle new location of outputs D and E
      drm/i915/xelpd: Increase maximum watermark lines to 255
      drm/i915/adl_p: Extend PLANE_WM bits for blocks & lines
      drm/i915/adl_p: Add dedicated SAGV watermarks
      drm/i915/xelpd: Enhanced pipe underrun reporting

Matthew Auld (20):
      drm/i915/uapi: fix kernel doc warnings
      drm/i915/uapi: convert i915_user_extension to kernel doc
      drm/i915/uapi: convert i915_query and friend to kernel doc
      drm/doc: add section for driver uAPI
      drm/i915/stolen: treat stolen local as normal local memory
      drm/i915/stolen: actually mark as contiguous
      drm/i915/gtt: map the PD up front
      drm/i915/gtt/dgfx: place the PD in LMEM
      drm/doc/rfc: i915 DG1 uAPI
      drm/i915: mark stolen as private
      drm/i915: rework gem_create flow for upcoming extensions
      drm/i915/uapi: introduce drm_i915_gem_create_ext
      drm/i915/uapi: implement object placement extension
      drm/i915/lmem: support optional CPU clearing for special internal use
      drm/i915/gem: clear userspace buffers for LMEM
      drm/i915/gem: hide new uAPI behind CONFIG_BROKEN
      drm/i915: drop the __i915_active_call pointer packing
      drm/i915/stolen: shuffle around init_memory_region
      drm/doc/rfc: drop the i915_gem_lmem.h header
      Revert "i915: use io_mapping_map_user"

Matthew Brost (2):
      drm/i915/guc: Drop guc->interrupts.enabled
      drm/i915/guc: Ensure H2G buffer updates visible before tail update

Mauro Carvalho Chehab (1):
      gpu: drm: replace occurrences of invalid character

Max.Tseng (2):
      drm/amd/display: Add new DP_SEC registers for programming SDP Line nu=
mber
      drm/amd/display: Add SE_DCN3_REG_LIST for control SDP num

Maxime Ripard (19):
      Merge drm/drm-next into drm-misc-next
      drm/connector: Create a helper to attach the hdr_output_metadata prop=
erty
      drm/connector: Add helper to compare HDR metadata
      drm/connector: Add a helper to attach the colorspace property
      drm/vc4: hdmi: Signal the proper colorimetry info in the infoframe
      drm/vc4: txp: Properly set the possible_crtcs mask
      drm/vc4: crtc: Skip the TXP
      drm/vc4: crtc: Pass the drm_atomic_state to config_pv
      drm/vc4: crtc: Fix vc4_get_crtc_encoder logic
      drm/vc4: crtc: Lookup the encoder from the register at boot
      drm/vc4: hdmi: Prevent clock unbalance
      drm/vc4: hvs: Make the HVS bind first
      drm/vc4: hdmi: Properly compute the BVB clock rate
      drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies
      drm/vc4: hdmi: Enable the scrambler
      drm/vc4: hdmi: Add a workqueue to set scrambling
      Merge drm/drm-next into drm-misc-next
      drm/vc4: hdmi: Fix error path of hpd-gpios
      drm/vc4: hdmi: Convert to gpiod

Meenakshikumar Somasundaram (1):
      drm/amd/display: Remove unused definition of DMUB SET_CONFIG

Melissa Wen (4):
      drm/vkms: init plane using drmm_universal_plane_alloc
      drm/vkms: rename cursor to plane on ops of planes composition
      drm/vkms: add XRGB planes composition
      drm/vkms: add overlay support

Michael Strauss (1):
      drm/amd/display: Add new case to get spread spectrum info

Michal Wajdeczko (12):
      drm/i915/guc: Keep strict GuC ABI definitions
      drm/i915/guc: Stop using fence/status from CTB descriptor
      drm/i915: Promote ptrdiff() to i915_utils.h
      drm/i915/guc: Only rely on own CTB size
      drm/i915/guc: Don't repeat CTB layout calculations
      drm/i915/guc: Replace CTB array with explicit members
      drm/i915/guc: Update sizes of CTB buffers
      drm/i915/guc: Start protecting access to CTB descriptors
      drm/i915/guc: Stop using mutex while sending CTB messages
      drm/i915/guc: Don't receive all G2H messages in irq handler
      drm/i915/guc: Always copy CT message to new allocation
      drm/i915/guc: Early initialization of GuC send registers

Michel D=C3=A4nzer (2):
      drm/amdgpu: Use drm_dbg_kms for reporting failure to get a GEM FB
      drm/amdgpu: Call drm_framebuffer_init last for framebuffer init

Mika Kahola (3):
      drm/i915/adl_p: Enable/disable loadgen sharing
      drm/i915/adl_p: Tx escape clock with DSI
      drm/i915/adl_p: Define and use ADL-P specific DP translation tables

Mike Li (1):
      drm/amdkfd: Update L1 and add L2/3 cache information

Mikita Lipski (4):
      drm/amd/display: fix wrong statement in mst hpd debugfs
      drm/amd/display: multi-eDP backlight support
      drm/amd/display: Enabling PSR support for multiple panels
      drm/amd/display: Enable PSR Residency for multiple panels

Mikko Perttunen (1):
      drm/tegra: Don't call SET_APPLICATION_ID in VIC boot

Mohammed Khajapasha (2):
      drm/i915/fbdev: Use lmem physical addresses for fb_mmap() on discrete
      drm/i915: Return error value when bo not in LMEM for discrete

Mukul Joshi (3):
      drm/amdgpu: Enable TCP channel hashing for Aldebaran
      drm/amdgpu: Query correct register for DF hashing on Aldebaran
      drm/amdgpu: Correctly clear GCEA error status

Neil Armstrong (6):
      drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
      dt-bindings: display: mediatek, hdmi: Convert to use graph schema
      dt-bindings: mediatek: add mt8167 to hdmi, hdmi-ddc and cec bindings
      drm/mediatek: hdmi: Add check for CEA modes only
      drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock
      drm/mediatek: hdmi: Add MT8167 configuration

Nicholas Kazlauskas (23):
      drm/amd/display: Fix GPU scaling regression by FS video support
      drm/amdgpu: Load TA firmware for yellow carp
      drm/amdgpu: Update atomfirmware for DCN3.1 phy tuning and eDP caps
      drm/amd/display: Add DCN3.1 yellow carp asic family IDs
      drm/amd/display: Add DCN3.1 clock manager support
      drm/amd/display: Add DCN3.1 DCCG
      drm/amd/display: Add DCN3.1 DIO
      drm/amd/display: Add DCN3.1 OPTC
      drm/amd/display: Add DCN3.1 DCHHUB
      drm/amd/display: Add DCN3.1 DML calculation support
      drm/amd/display: Add DCN3.1 IRQ manager
      drm/amd/display: Add DCN3.1 GPIO support
      drm/amd/display: Add DCN3.1 DMCUB
      drm/amd/display: Add DCN3.1 PANEL
      drm/amd/display: Add DCN3.1 HDCP support
      drm/amd/display: Add DCN3.1 BIOS parser support
      drm/amd/display: Add DCN3.1 HWSEQ
      drm/amd/display: Add z10 restore checks for DC interfaces
      drm/amd/display: Add DCN3.1 Resource
      drm/amd/display: Add DCN3.1 blocks to the DC Makefile
      drm/amd/display: Add DCN3.1 Yellow Carp support to DM
      drm/amd/display: Add DC DCN3.1 support to Kconfig
      drm/amdgpu: Add DC support and display block for Yellow Carp

Nicolas Boichat (3):
      dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
      drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
      drm/panfrost: Add mt8183-mali compatible string

Nikola Cornij (7):
      drm/dp_mst: Use Extended Base Receiver Capability DPCD space
      drm/i915: Use the correct max source link rate for MST
      drm/amd/display: Avoid gpio conflict on MST branch
      drm/amd/display: Use the correct max downscaling value for DCN3.x fam=
ily
      drm/dp_mst: Use kHz as link rate units when settig source max
link caps at init
      drm/amd/display: Fix DCN 3.01 DSCCLK validation
      drm/amd/display: Clamp VStartup value at DML calculations time

Nirmoy Das (23):
      drm/amdgpu: expose amdgpu_bo_create_shadow()
      drm/amdgpu: cleanup amdgpu_vm_init()
      drm/amdgpu: remove unused vm context flags
      drm/amdgpu: create shadow bo using amdgpu_bo_create_shadow()
      drm/amdgpu: cleanup amdgpu_bo_create()
      drm/amdgpu: remove AMDGPU_GEM_CREATE_SHADOW flag
      drm/amdgpu: remove excess function parameter
      drm/amd/display: do not dereference on NULL
      drm/amd/display: WARN_ON cleanups
      drm/amdgpu: make sure we unpin the UVD BO
      drm/amdgpu: add amdgpu_bo_vm bo type
      drm/amdgpu: move shadow bo validation to VM code
      drm/admgpu: add two shadow BO helper functions
      drm/amdgpu: switch to amdgpu_bo_vm for vm code
      drm/amdgpu: remove unused code
      drm/amdgpu: do not allocate entries separately
      drm/amdgpu: flush gart changes after all BO recovery
      drm/amdgpu: fix shadow bo skip condition
      drm/vmwgfx: use ttm_bo_move_null() when there is nothing to move
      drm/amdkfd: use allowed domain for vmbo validation
      drm/amdgpu: remove amdgpu_vm_pt
      drm/amdgpu: parameterize ttm BO destroy callback
      drm/amdgpu: move shadow_list to amdgpu_bo_vm

Oak Zeng (1):
      drm/amdgpu: Quit RAS initialization earlier if RAS is disabled

Parshuram Thombare (2):
      dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP
      drm: bridge: cdns-mhdp8546: Enable HDCP

Paul Cercueil (7):
      drm/ingenic: Switch IPU plane to type OVERLAY
      drm/ingenic: Fix pixclock rate for 24-bit serial panels
      drm: Add support for GEM buffers backed by non-coherent memory
      drm: Add and export function drm_fb_cma_sync_non_coherent
      drm/ingenic: Add option to alloc cached GEM buffers
      drm: Fix for GEM buffers with write-combine memory
      drm: Fix misleading documentation of drm_gem_cma_create()

Paul Hsieh (1):
      drm/amd/display: update DCN to use new surface programming

Paul Wu (1):
      drm/amd/display: Set stream_count to 0 when dc_resource_state_destruc=
t.

Pavan Kumar Ramayanam (1):
      drm/amdgpu: Handling of amdgpu_device_resume return value for
graceful teardown

Peng Ju Zhou (14):
      drm/amdgpu: Rename the flags to eliminate ambiguity v2
      drm/amdgpu: Skip the program of GRBM_CAM* in SRIOV
      drm/amdgpu: Refine the error report when flush tlb.
      drm/amdgpu: Indirect register access for Navi12 sriov
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file gfx_v=
10*
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file kfd_v=
10*
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file soc15=
.c
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file sdma_=
v5*
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file nv.c
      drm/amdgpu: Modify GC register access from MMIO to RLCG in file
amdgpu_gmc.c
      drm/amdgpu: Skip the program of MMMC_VM_AGP_* in SRIOV
      drm/amdgpu: Change IP init sequence to support PSP program
IH_RB_CNTL on NV12 SRIOV
      drm/amdgpu: Fixing "Indirect register access for Navi12 sriov" for ve=
ga10
      drm/amd/amdgpu: add instance_number check in
amdgpu_discovery_get_ip_version

Peter Robinson (1):
      drm/rockchip: cdn-dp-core: add MODULE_FIRMWARE macro

Philip Yang (26):
      drm/amdkfd: add svm ioctl API
      drm/amdkfd: register svm range
      drm/amdkfd: add svm ioctl GET_ATTR op
      drm/amdgpu: add common HMM get pages function
      drm/amdkfd: support larger svm range allocation
      drm/amdkfd: validate svm range system memory
      drm/amdkfd: deregister svm range
      drm/amdgpu: export vm update mapping interface
      drm/amdkfd: register HMM device private zone
      drm/amdkfd: set memory limit to avoid OOM with HMM enabled
      drm/amdkfd: support xgmi same hive mapping
      drm/amdkfd: copy memory through gart table
      drm/amdkfd: Add SVM API support capability bits
      drm/amdkfd: fix double free device pgmap resource
      drm/amdkfd: retry validation to recover range
      drm/amdgpu: return IH ring drain finished if ring is empty
      drm/amdkfd: handle stale retry fault
      drm/amdgpu: address remove from fault filter
      drm/amdkfd: enable subsequent retry fault
      drm/amdkfd: flush TLB after updating GPU page table
      drm/amdkfd: handle errors returned by svm_migrate_copy_to_vram/ram
      drm/amdkfd: new range accessible by all GPUs
      drm/amdgpu: flush TLB if valid PDE turns into PTE
      Revert "drm/amdkfd: flush TLB after updating GPU page table"
      drm/amdkfd: heavy-weight flush TLB after unmap
      drm/amdkfd: pages_addr offset must be 0 for system range

Philipp Zabel (3):
      drm/imx: ipuv3-plane: do not advertise YUV formats on planes without =
CSC
      gpu: ipu-v3: Add Rec.709 limited range support to DP
      drm/imx: ipuv3-plane: add color encoding and range properties

Phong LE (3):
      dt-bindings: display: bridge: add it66121 bindings
      drm: bridge: add it66121 driver
      MAINTAINERS: add it66121 HDMI bridge driver entry

Pi-Hsun Shih (3):
      drm/bridge: anx7625: refactor power control to use runtime PM framewo=
rk
      drm/bridge: anx7625: add suspend / resume hooks
      drm/bridge: anx7625: Synchronously run runtime suspend.

Piotr Oniszczuk (1):
      drm/sun4i: de3: Be explicit about supported modifiers

Po-Ting Chen (2):
      drm/amd/display: Add swizzle visual confirm mode
      drm/amd/display: Change swizzle visual confirm reference pipe

Pu Lehui (3):
      drm/hyperv: Fix unused const variable 'hyperv_modifiers'
      drm/amd/display: Fix gcc unused variable warning
      drm/amd/display: remove unused variable 'dc'

Qiheng Lin (1):
      drm/vmwgfx: Fix return value check in vmw_setup_pci_resources()

Qingqing Zhuo (1):
      Revert "drm/amd/display: Refactor and add visual confirm for HW
Flip Queue"

Randy Dunlap (2):
      drm: bridge: add missing word in Analogix help text
      drm: simpledrm: print resource info using '%pr'

Rex-BC Chen (3):
      drm/mediatek: dpi: Add dual edge sample mode support
      drm/mediatek: dpi: Add output bus formats to driver data
      drm/mediatek: dpi: Add bus format negotiation

Rob Clark (6):
      Merge branch 'msm-fixes-v5.13-rc6' into msm-next-redo
      drm/msm: Generated register update
      iommu/arm-smmu-qcom: Add stall support
      drm/msm: devcoredump iommu fault support
      drm/msm: Add debugfs to trigger shrinker
      Revert "drm/msm/mdp5: provide dynamic bandwidth management"

Robert Foss (1):
      drm/bridge/sii8620: fix dependency on extcon

Robin Chen (1):
      drm/amd/display: Clear MASTER_UPDATE_LOCK_DB_EN when disable
doublebuffer lock

Rodrigo Siqueira (7):
      drm/amd/display: Fix two cursor duplication when using overlay
      drm/amd/display: Add documentation for power gate plane
      drm/amd/display: Remove legacy comments
      drm/amd/display: Add kernel-doc to some hubp functions
      drm/amd/display: Document set RECOUT operation
      drm/amd/display: Fix overlay validation by considering cursors
      drm/amd/display: Add Freesync video documentation

Rodrigo Vivi (5):
      Merge tag 'topic/intel-gen-to-ver-2021-04-19' of
git://anongit.freedesktop.org/drm/drm-intel into drm-intel-next
      drm/i915/dmc: Let's abstract the dmc path.
      Merge drm/drm-next into drm-intel-next
      Merge drm/drm-next into drm-intel-next
      drm/i915/guc: Remove sample_forcewake h2g action

Rohit Khaire (5):
      drm/amdgpu: Fix incorrect register offsets for Sienna Cichlid
      drm/amdgpu: Enable RLCG read/write interface for Sienna Cichlid
      drm/amdgpu: Modify GC register access to use _SOC15 macros
      drm/amdgpu: Modify register access in sdma_v5_2 to use _SOC15 macros
      drm/amdgpu: Use PSP to program IH_RB_CNTL_RING1/2 on SRIOV

Roman Li (6):
      drm/amd/display: fix potential gpu reset deadlock
      drm/amd/display: Remove redundant safeguards for dmub-srv destroy()
      drm/amd/display: Fix potential memory leak in DMUB hw_init
      drm/amd/display: Update scaling settings on modeset
      drm/amd/display: move psr dm interface to separate files
      drm/amd/display: Delay PSR entry

Rouven Czerwinski (1):
      drm/amd/display: remove unused function dc_link_perform_link_training

Roy Chan (1):
      drm/amd/display: Revert "Disconnect non-DP with no EDID"

Roy Sun (3):
      drm/scheduler: Change scheduled fence track v2
      drm/amdgpu: Add show_fdinfo() interface
      drm/amd/amdgpu: Cancel the hrtimer in sw_fini

Sakari Ailus (1):
      drm: Remove drm_get_format_name()

Samuel Iglesias Gonsalvez (1):
      drm/msm: export hangcheck_period in debugfs

Sascha Hauer (1):
      drm/etnaviv: add HWDB entry for GC7000 rev 6204

Sathishkumar S (9):
      drm/amdgpu: set vcn mgcg flag for picasso
      drm/amdgpu: update vcn1.0 Non-DPG suspend sequence
      drm/amd/pm: use attr_update if the attr has it
      drm/amdgpu: support atcs method powershift (v4)
      drm/amdgpu: enable smart shift on dGPU (v5)
      drm/amd/pm: sysfs attrs to read ss powershare (v6)
      drm/amdgpu: attr to control SS2.0 bias level (v2)
      drm/amd/pm: support ss metrics read on renoir
      drm/amd/pm: support ss metrics read on yellow_carp

Sebastian Reichel (1):
      drm/imx: Add 8 pixel alignment fix

Shaokun Zhang (7):
      drm/amd/display: Remove the repeated declaration
      drm/radeon/evergreen: Remove the repeated declaration
      drm/radeon: remove the repeated declaration
      drm/i915: Remove the repeated declaration
      drm/amd/display: Remove the redundant initialization of local variabl=
e
      drm/amd/display: Remove the repeated dpp1_full_bypass declaration
      drm/msm/dp: remove the repeated declaration

Shiwu Zhang (3):
      drm/ttm: fix error handling if no BO can be swapped out v4
      drm/amdgpu: fix metadata_size for ubo ioctl queries
      drm/amdgpu: free the metadata buffer for sg type BOs as well

Sia Jee Heng (1):
      drm: bridge: adv7511: Support I2S IEC958 encoded PCM format

Simon Rettberg (1):
      drm/i915/gt: Disable HiZ Raw Stall Optimization on broken gen7

Simon Ser (7):
      drm/connector: demote connector force-probes for non-master clients
      amdgpu: fix GEM obj leak in amdgpu_display_user_framebuffer_create
      drm: log errors in drm_gem_fb_init_with_funcs
      drm: reference mode flags in DRM_CLIENT_CAP_* docs
      drm: clarify and linkify DRM_CLIENT_CAP_WRITEBACK_CONNECTORS docs
      drm: document minimum kernel version for DRM_CLIENT_CAP_*
      amd/display: convert DRM_DEBUG_ATOMIC to drm_dbg_atomic

Souptick Joarder (1):
      drm/amdgpu: Added missing prototype

Stanislav Lisovskiy (2):
      drm/i915/adl_p: CDCLK crawl support for ADL
      drm/i915/adl_p: Same slices mask is not same Dbuf state

Stanley.Yang (5):
      drm/amdgpu: optimize gfx ras features flag clean
      drm/amdgpu: force enable gfx ras for vega20 ws
      drm/amdgpu: add vega20 to ras quirk list
      drm/amdgpu: fix bad address translation for sienna_cichlid
      drm/amdgpu: message smu to update hbm bad page number

Stephen Boyd (9):
      drm/msm/dp: Simplify aux irq handling code
      drm/msm/dp: Shrink locking area of dp_aux_transfer()
      drm/msm/dp: Handle aux timeouts, nacks, defers
      drm/msm: Move vblank debug prints to drm_dbg_vbl()
      drm/msm/dp: Drop malformed debug print
      drm/msm: Move FB debug prints to drm_dbg_state()
      drm/msm/disp: Use plane debug print helper
      drm/msm/disp: Move various debug logs to atomic bucket
      drm/msm: Use VERB() for extra verbose logging

Stephen Rothwell (1):
      drm/i915: Merge fix for "drm: Switch to %p4cc format modifier"

Stylon Wang (2):
      drm/amd/display: Expose internal display flag via debugfs
      drm/amd/display: Revert "Guard ASSR with internal display flag"

St=C3=A9phane Marchesin (1):
      drm/i915: Fix crash in auto_retire

Swathi Dhanavanthri (1):
      drm/i915: Add Wa_14011060649

Takashi Iwai (3):
      drm/i915: Fix invalid access to ACPI _DSM objects
      drm/ast: Fix missing conversions to managed API
      drm/bochs: Add screen blanking support

Tan Zhongjun (1):
      drm/tegra: Remove superfluous error messages around platform_get_irq(=
)

Tao Zhou (7):
      drm/amdgpu: enable GFX clock gating for beige_goby
      drm/amdgpu: support athub cg setting for beige_goby
      drm/amdgpu: enable athub/mmhub PG for beige_goby
      drm/amdgpu: enable mc CG and LS for beige_goby
      drm/amdgpu: enable hdp CG and LS for beige_goby
      drm/amdgpu: enable ih CG for beige_goby
      drm/amdgpu: add cgls for beige_goby

Tejas Upadhyay (1):
      x86/gpu: add JasperLake to gen11 early quirks

Thierry Reding (2):
      drm/tegra: hub: Fix YUV support
      drm/tegra: hub: Implement basic scaling support

Thomas Hebb (2):
      drm/rockchip: dsi: move all lane config except LCDC mux to bind()
      drm/rockchip: dsi: remove extra component_del() call

Thomas Hellstrom (2):
      drm/vmwgfx: Mark a surface gpu-dirty after the SVGA3dCmdDXGenMips com=
mand
      drm/vmwgfx: Fix cpu updates of coherent multisample surfaces

Thomas Hellstr=C3=B6m (11):
      drm/i915: Untangle the vma pages_mutex
      drm/i915: Don't free shared locks while shared
      drm/i915: Fix i915_sg_page_sizes to record dma segments rather
than physical pages
      drm/i915/ttm Initialize the ttm device and memory managers
      drm/i915/ttm: Embed a ttm buffer object in the i915 gem object
      drm/ttm: Add a generic TTM memcpy move for page-based iomem
      drm: Add a prefetching memcpy_from_wc
      drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
      drm/ttm: Document and optimize ttm_bo_pipeline_gutting()
      drm/ttm, drm/amdgpu: Allow the driver some control over swapping
      drm/i915: Reinstate the mmap ioctl for some platforms

Thomas Zimmermann (53):
      drm/gem-ttm-helper: Provide helper for struct drm_driver.dumb_map_off=
set
      drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
      drm/nouveau: Use drm_gem_ttm_dumb_map_offset()
      drm/qxl: Use drm_gem_ttm_dumb_map_offset()
      drm/aperture: Add infrastructure for aperture ownership
      drm/aperture: Convert drivers to aperture interfaces
      drm/aperture: Inline fbdev conflict helpers into aperture helpers
      drm/vmwgfx: Make console emulation depend on DRM_FBDEV_EMULATION
      drm/mxsfb: Don't select DRM_KMS_FB_HELPER
      drm/zte: Don't select DRM_KMS_FB_HELPER
      drm: Remove DRM_KMS_FB_HELPER Kconfig option
      drm/i915/gem: Remove reference to struct drm_device.pdev
      drm/ast: Remove reference to struct drm_device.pdev
      drm/i915/gt: Remove reference to struct drm_device.pdev
      drm/i915: Remove reference to struct drm_device.pdev
      drm/i915: Don't assign to struct drm_device.pdev
      drm: Move struct drm_device.pdev to legacy section
      drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
      drm/format-helper: Add blitter functions
      drm/aperture: Add infrastructure for aperture ownership
      drm: Add simpledrm driver
      drm/simpledrm: Acquire memory aperture for framebuffer
      drm/i810: Remove references to struct drm_device.pdev
      drm/mga: Remove references to struct drm_device.pdev
      drm/r128: Remove references to struct drm_device.pdev
      drm/savage: Remove references to struct drm_device.pdev
      drm/sis: Remove references to struct drm_device.pdev
      drm/via: Remove references to drm_device.pdev
      drm: Remove pdev field from struct drm_device
      drm/radeon: Move AGP helpers into radeon driver
      drm/radeon: Move AGP data structures into radeon
      drm: Mark PCI AGP helpers as legacy
      drm: Mark AGP implementation and ioctls as legacy
      drm: Include <asm/agp.h> iff CONFIG_AGP is set
      Merge drm/drm-next into drm-misc-next
      drm/nouveau: Remove invalid reference to struct drm_device.pdev
      drm/i915: Don't include drm_legacy.h
      drm/nouveau: Don't include drm_legacy.h
      drm: Don't include drm_legacy.h in drm_lease.c
      drm: Remove unused branch in legacy PCI initialization
      drm: Mark IRQ_BUSID ioctl as legacy
      Merge drm/drm-next into drm-misc-next
      drm/ttm: Don't override vm_ops callbacks, if set
      drm/amdgpu: Implement mmap as GEM object function
      drm/radeon: Implement mmap as GEM object function
      drm/nouveau: Implement mmap as GEM object function
      drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
      drm/vmwgfx: Inline vmw_verify_access()
      drm/ttm: Remove ttm_bo_mmap() and friends
      drm/kconfig: Remove unused select of DRM_KMS_FB_HELPER
      drm/amdgpu: Use %p4cc to print 4CC format
      drm/simpledrm: Use %p4cc to print 4CC format
      drm/fourcc: Remove struct drm_format_buf_name

Tian Tao (3):
      drm/etnaviv: fix NULL check before some freeing functions is not need=
ed
      drm/etnaviv: Remove useless error message
      drm/exynos: Use pm_runtime_resume_and_get() to replace open coding

Tom Rix (1):
      drm/amd/pm: initialize variable

Tvrtko Ursulin (6):
      drm/i915: Take request reference before arming the watchdog timer
      drm/i915/pmu: Check actual RC6 status
      drm/i915/overlay: Fix active retire callback alignment
      drm/i915/selftests: Fix active retire callback alignment
      drm/i915: Drop duplicate WaDisable4x2SubspanOptimization:hsw
      drm/i915/params: Align visibility of device level and global modparam=
s

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Enable OA formats for ADL_P

Vandita Kulkarni (8):
      drm/i915/display/dsc: Refactor intel_dp_dsc_compute_bpp
      drm/i915/xelpd: Support DP1.4 compression BPPs
      drm/i915: Get slice height before computing rc params
      drm/i915/xelpd: Calculate VDSC RC parameters
      drm/i915/xelpd: Add rc_qp_table for rcparams calculation
      drm/i915/adl_p: Add ddb allocation support
      drm/i915/adl_p: MBUS programming
      drm/i915/dsc: Fix bigjoiner check in dsc_disable

Veerabadhran Gopalakrishnan (2):
      drm/amdgpu: Enable VCN for Beige Goby
      drm/amdgpu: enabled VCN3.0 CG for BEIGE GOBY

Venkata Ramana Nayana (1):
      drm/i915/dg1: Fix mapping type for default state object

Venkata Sandeep Dhanalakota (1):
      drm/i915: Update the helper to set correct mapping

Victor Zhao (3):
      drm/amdgpu/sriov: Remove clear vf fw support
      drm/amdgpu: fix r initial values
      drm/amd/amdgpu:save psp ring wptr to avoid attack

Ville Syrj=C3=A4l=C3=A4 (47):
      drm/i915: Split out glk_plane_min_cdclk()
      drm/i915: Update plane ratio for icl+
      drm/i915: Don't zero out the Y plane's watermarks
      drm/i915: Restore lost glk FBC 16bpp w/a
      drm/i915: Restore lost glk ccs w/a
      drm/i915: Disable LTTPR detection on GLK once again
      drm/i915: Don't use {skl, cnl}_hpd_pin() for bxt/glk
      drm/i915: Remove a few redundant glk checks
      drm/i915: Extract intel_adjusted_rate()
      drm/i915: Reuse intel_adjusted_rate() for pfit pixel rate adjustment
      drm/i915: Collect dbuf device info into a sub-struct
      drm/i915: Handle dbuf bypass path allocation earlier
      drm/i915: Store dbuf slice mask in device info
      drm/i915: Use intel_dbuf_slice_size()
      drm/i915: Use intel_de_rmw() for DBUF_POWER_REQUEST
      drm/i915: Polish for_each_dbuf_slice()
      drm/i915: Add enabledisable()
      drm/i915: Say "enable foo" instead of "set foo to enabled"
      drm/i915: Avoid div-by-zero on gen2
      drm/i915: Read C0DRB3/C1DRB3 as 16 bits again
      drm/i915: Give C0DRB3/C1DRB3 a _BW suffix
      drm/i915: Fix pre-skl DP AUX precharge length
      drm/i915: Remove stray newlines
      drm/i915: Stop using crtc->index as the pipe
      drm/i915: Add frontbuffer tracking tracepoints
      drm/i915: Don't include intel_de.h from intel_display_types.h
      drm/i915: Include intel_de_{read,write}_fw() in i915_reg_rw traces
      drm/i915: Extract some helpers to compute cdclk register values
      drm/i915: Use intel_de_rmw() in bdw cdclk programming
      drm/i915: Use intel_de_rmw() in skl cdclk programming
      drm/i915: Use intel_de_rmw() in bxt/glk/cnl+ cdclk programming
      drm/i915: Use intel_de_wait_for_*() in cnl+ cdclk programming
      drm: Use drm_mode_is_420_only() instead of open coding it
      drm/i915: Nuke display error state
      drm/i915: Reorder skl+ scaler vs. plane updates
      drm/i915/xelpd: First stab at DPT support
      drm/i915: Move intel_modeset_all_pipes()
      drm/i915: Introduce MBUS relative dbuf offsets
      drm/i915: Extract intel_hdmi_bpc_possible()
      drm/i915: Move has_hdmi_sink check into intel_hdmi_bpc_possible()
      drm/i915: Move platform checks into intel_hdmi_bpc_possible()
      drm/i915: Check sink deep color capabilitis during HDMI .mode_valid()
      drm/i915: Move the TMDS clock division into intel_hdmi_mode_clock_val=
id()
      drm/i915: Drop redundant has_hdmi_sink check
      drm/i915/adl_p: Disable FIFO underrun recovery
      drm/i915/adl_p: Implement Wa_22012358565
      drm/i915: Disable PSR around cdclk changes

Vivek Kasireddy (1):
      drm/virtio: Create Dumb BOs as guest Blobs (v3)

Vladimir Stempen (1):
      drm/amd/display: Release MST resources on switch from MST to SST

Wan Jiabing (10):
      drm/gma500: update comment of psb_spank()
      drm/amd/display: Remove duplicate include of hubp.h
      drm/amd/display: Remove duplicate declaration of dc_state
      drm: amdgpu: Remove unneeded semicolon in amdgpu_vm.c
      drm/i915/display: remove duplicated argument
      drm/amdkfd: remove duplicate include of kfd_svm.h
      drm: display: Remove duplicate include in dce110
      drm: display: Remove duplicated argument in dcn31
      drm: display: Fix duplicate field initialization in dcn31
      drm/display: Fix duplicated argument

Wang Li (1):
      drm/mediatek: Fix PM reference leak in mtk_crtc_ddp_hw_init()

Wayne Lin (4):
      drm/amd/display: Refactor suspend/resume of Secure display
      drm/amd/display: Avoid get/put vblank when stream disabled
      drm/dp_mst: Do not set proposed vcpi directly
      drm/dp_mst: Avoid to mess up payload table by ports in stale topology

Wenjing Liu (11):
      drm/amd/display: take max dsc stream bandwidth overhead into account
      drm/amd/display: add dsc stream overhead for dp only
      drm/amd/display: minor dp link training refactor
      drm/amd/display: determine dp link encoding format from link settings
      drm/amd/display: decide link training settings based on channel codin=
g
      drm/amd/display: rename perform_link_training_int function
      drm/amd/display: consider channel coding in configure lttpr mode
      drm/amd/display: add exit training mode and update channel coding in =
LT
      drm/amd/display: isolate 8b 10b link training sequence into its
own function
      drm/amd/display: delay 100ms before restart after failing to read CP_=
IRQ
      drm/amd/display: dp mst detection code refactor

Werner Sembach (3):
      drm/i915/display: New function to avoid duplicate code in
upcomming commits
      drm/i915/display: Restructure output format computation for
better expandability
      drm/i915/display: Use YCbCr420 as fallback when RGB fails

Wesley Chalmers (19):
      drm/amd/display: Add Interface to set FIFO ERRDET SW Override
      drm/amd/display: Add interface for ADD & DROP PIXEL Registers
      drm/amd/display: Set DISPCLK_MAX_ERRDET_CYCLES to 7
      drm/amd/display: Fix off-by-one error in DML
      drm/amd/display: Read LTTPR caps first on hotplug
      drm/amd/display: Move LTTPR cap read into its own function
      drm/amd/display: Read LTTPR caps first on bootup
      drm/amd/display: Set LTTPR Transparent Mode after read link cap
      drm/amd/display: Always write repeater mode regardless of LTTPR
      drm/amd/display: Improve logic for is_lttpr_present
      drm/amd/display: Enforce DPCD Address ranges
      drm/amd/display: Rename constant
      drm/amd/display: 7 retries + 50 ms timeout on AUX DEFER
      drm/amd/display: Do not count I2C DEFERs with AUX DEFERs
      drm/amd/display: Partition DPCD address space and break up transactio=
ns
      drm/amd/display: Add interface to get Calibrated Avg Level from FIFO
      drm/amd/display: Cover edge-case when changing DISPCLK WDIVIDER
      drm/amd/display: Extend AUX timeout for DP initial reads
      drm/amd/display: Fix incorrect variable name

Wyatt Wood (4):
      drm/amd/display: Add get_current_time interface to dmub_srv
      drm/amd/display: Refactor and add visual confirm for HW Flip Queue
      drm/amd/display: Refactor visual confirm
      drm/amd/display: [FW Promotion] Release 0.0.69

Xiaojian Du (1):
      drm/amd/pm: retain the fine grain tuning parameters after resume

Xiaomeng Hou (17):
      drm/amd/pm: add read_sensor function for yellow carp
      drm/amd/pm: add set_watermarks_table function for yellow carp
      drm/amd/pm: add the fine grain tuning function for yellow carp
      drm/amd/pm: add support to get dpm clock value for yellow carp
      drm/amd/pm: add feature map for yellow carp
      drm/amd/pm: implement is_dpm_running() callback for yellow carp
      drm/amd/pm: initialize feature_enabled/feature_support bitmap
for yellow carp
      drm/amd/pm: add callback force_clk_levels for yellow carp
      drm/amd/pm: add callback to get bootup values for yellow carp
      drm/amd/pm: add callback get_dpm_ultimate_freq for yellow carp
      drm/amd/pm: add callbacks to read/write sysfs file pp_power_profile_m=
ode
      drm/amd/pm: add the interface to dump smu metrics table for yellow ca=
rp
      drm/amdgpu: add gpu harvest support for yellow carp (v2)
      drm/amdgpu: correct the cu and rb info for yellow carp
      drm/amd/pm: add set_performance_level function for yellow carp
      drm/amd/pm: disable manually setting MCLK power level on yellow carp
      drm/amd/pm: fix warning reported by kernel test robot

Xie Yongji (3):
      drm/virtio: Fixes a potential NULL pointer dereference on probe failu=
re
      drm/virtio: Fix double free on probe failure
      drm/virtio: free virtqueues on probe failure

Xuezhi Zhang (1):
      drm/i915/sysfs: convert snprintf to sysfs_emit

Yang Yingliang (2):
      drm: correct function name drm_legacy_ctxbitmap_flush()
      drm/rockchip: cdn-dp-core: add missing clk_disable_unprepare()
on error in cdn_dp_grf_write()

Yangtao Li (1):
      drm/msm: Convert to use resource-managed OPP API

Yi Li (1):
      drm/amdgpu: Fix GPU TLB update error when PAGE_SIZE > AMDGPU_PAGE_SIZ=
E

Yi-Ling Chen (1):
      drm/amd/display: add config option for eDP hotplug detection

Yifan Zha (1):
      drm/amd/pm: Disable SMU messages in navi10 sriov

Yifan Zhang (5):
      drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue.
      drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover
full doorbell.
      drm/amdgpu: remove unused parameter in amdgpu_gart_bind
      Revert "drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to
cover full doorbell."
      Revert "drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue.=
"

Yingjie Wang (1):
      drm/amd/dc: Fix a missing check bug in dm_dp_mst_detect()

Yu Kuai (3):
      drm: bridge: cdns-mhdp8546: Fix PM reference leak in
      drm/amd/display: fix gcc set but not used warning of variable
'old_plane_state'
      drm: fix doc warnings in drm_atomic.h

Yu-ting Shen (2):
      drm/amd/display: ddc resource data need to be initialized
      drm/amd/display: avoid to authentication when DEVICE_COUNT=3D0

YuBiao Wang (2):
      drm/amd/amdgpu: psp program IH_RB_CTRL on sienna_cichlid
      drm/amdgpu: reset psp ring wptr during ring_create

YueHaibing (1):
      drm/i915: use DEVICE_ATTR_RO macro

Zack Rusin (4):
      drm/vmwgfx: Fix incorrect enum usage
      drm/vmwgfx: Remove the reservation semaphore
      drm/vmwgfx: Add basic support for SVGA3
      drm/vmwgfx: Port vmwgfx to arm64

Zhan Liu (2):
      drm/amd/display: Avoid HPD IRQ in GPU reset state
      drm/amd/display: Correct DPCD revision for eDP v1.4

Zhen Lei (9):
      drm/amd/display: Delete several unneeded bool conversions
      drm/amdgpu: Delete two unneeded bool conversions
      drm/vc4: Remove redundant error printing in vc4_ioremap_regs()
      drm/panfrost: Remove redundant error printing in panfrost_device_init=
()
      drm/mcde: Remove redundant error printing in mcde_dsi_probe()
      video: fbdev: mb862xx: use DEVICE_ATTR_RO macro
      drm/msm: Fix error return code in msm_drm_init()
      drm/msm/dpu: Fix error return code in dpu_mdss_init()
      drm/msm/dpu: remove unused local variable 'cmd_enc'

Zheng Yongjun (2):
      gpu: drm: vmwgfx: convert comma to semicolon
      drm/amdgpu: Remove unneeded semicolon

Zhigang Luo (8):
      drm/amdgpu: Add a new device ID for Aldebaran
      drm/amdkfd: Add Aldebaran virtualization support
      drm/amdgpu: Add Aldebaran virtualization support
      drm/amdgpu: remove sriov vf checking from getting fb location
      drm/amdgpu: remove sriov vf gfxhub fb location programming
      drm/amdgpu: remove sriov vf mmhub system aperture and fb
location programming
      drm/amdgpu: add psp ta microcode init for aldebaran sriov vf
      drm/amdgpu: allocate psp fw private buffer from VRAM for sriov vf

Zhihao Cheng (1):
      drm/i915/selftests: Fix return value check in live_breadcrumbs_smoket=
est()

Zou Wei (7):
      drm/vmwgfx/vmwgfx_validation: Use flexible-array member instead
of zero-length array
      drm/aperture: Fix missing unlock on error in devm_aperture_acquire()
      drm/bridge: lt9611: Add missing MODULE_DEVICE_TABLE
      drm: Fix missing unlock and free on error in drm_legacy_addbufs_pci()
      drm/vc4: hdmi: Fix PM reference leak in vc4_hdmi_encoder_pre_crtc_co(=
)
      drm/bridge: cdns: Fix PM reference leak in cdns_dsi_transfer()
      drm/bridge: lt8912b: fix platform_no_drv_owner.cocci warnings

hvanzyll (1):
      drm/amd/display: disable desktop VRR when using older flip model

kernel test robot (1):
      drm: fix semicolon.cocci warnings

lijian (1):
      video: fbdev: atyfb: mach64_cursor.c: deleted the repeated word

pengzhou (1):
      drm/amdgpu: Modify MMHUB register access from MMIO to RLCG in
file mmhub_v2*

shaoyunl (1):
      drm/amdgpu: soc15 register access through RLC should only apply
to sriov runtime

tony.huang_cp (1):
      drm/amdgpu: fix typo

wengjianfeng (1):
      drm/i915/gt: fix typo issue

xinhui pan (3):
      drm/amdgpu: Fix a use-after-free
      drm/amdgpu: Set TTM_PAGE_FLAG_SG earlier for userprt BOs
      drm/amdkfd: Walk through list with dqm lock hold

zuoqilin (2):
      drm/i915/dsi: Fix comment typo
      drm/msm: Remove unneeded variable: "rc"

 .../bindings/display/brcm,bcm2835-vec.yaml         |      4 +-
 .../bindings/display/bridge/cdns,mhdp8546.yaml     |     15 +-
 .../display/bridge/google,cros-ec-anx7688.yaml     |     82 +
 .../bindings/display/bridge/ite,it66121.yaml       |    124 +
 .../bindings/display/bridge/ti,sn65dsi83.yaml      |    159 +
 .../devicetree/bindings/display/faraday,tve200.txt |     54 -
 .../bindings/display/faraday,tve200.yaml           |     68 +
 .../bindings/display/mediatek/mediatek,cec.yaml    |     52 +
 .../display/mediatek/mediatek,hdmi-ddc.yaml        |     58 +
 .../bindings/display/mediatek/mediatek,hdmi.txt    |    136 -
 .../bindings/display/mediatek/mediatek,hdmi.yaml   |    133 +
 .../bindings/display/msm/dp-controller.yaml        |    146 +
 .../bindings/display/msm/dpu-sc7180.yaml           |    228 +
 .../bindings/display/msm/dpu-sdm845.yaml           |    212 +
 .../devicetree/bindings/display/msm/dpu.txt        |    141 -
 .../bindings/display/msm/dsi-controller-main.yaml  |    185 +
 .../bindings/display/msm/dsi-phy-10nm.yaml         |     68 +
 .../bindings/display/msm/dsi-phy-14nm.yaml         |     66 +
 .../bindings/display/msm/dsi-phy-20nm.yaml         |     71 +
 .../bindings/display/msm/dsi-phy-28nm.yaml         |     68 +
 .../bindings/display/msm/dsi-phy-common.yaml       |     40 +
 .../devicetree/bindings/display/msm/dsi.txt        |    249 -
 .../bindings/display/panel/samsung,lms397kf04.yaml |     74 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |     30 +-
 Documentation/driver-api/dma-buf.rst               |      9 +
 Documentation/gpu/amdgpu-dc.rst                    |      6 +
 Documentation/gpu/amdgpu.rst                       |     21 +
 Documentation/gpu/driver-uapi.rst                  |      8 +
 Documentation/gpu/drm-internals.rst                |     12 +
 Documentation/gpu/drm-mm.rst                       |      4 +-
 Documentation/gpu/i915.rst                         |     12 +-
 Documentation/gpu/index.rst                        |      1 +
 Documentation/gpu/rfc/i915_gem_lmem.rst            |    131 +
 Documentation/gpu/rfc/index.rst                    |      4 +
 Documentation/gpu/todo.rst                         |      2 +
 MAINTAINERS                                        |     30 +-
 arch/x86/kernel/early-quirks.c                     |      2 +
 drivers/dma-buf/dma-buf.c                          |     31 +-
 drivers/dma-buf/dma-resv.c                         |    211 +-
 drivers/gpu/drm/Kconfig                            |     42 +-
 drivers/gpu/drm/Makefile                           |      9 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |     14 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     69 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    398 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     55 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |     20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |     42 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |     42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    697 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |     20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    196 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h   |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    109 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    237 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |     63 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h        |      2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     84 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |    104 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h         |     43 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fw_attestation.c |      3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |     47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |      7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |     76 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |      7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    106 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |      7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    256 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |     69 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |     28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |     10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |     31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |     82 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |     90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h             |      7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    292 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |     62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |    195 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    491 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     59 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    270 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    393 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |      5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |     39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     63 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    545 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |     16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    328 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     52 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |      1 +
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    172 +
 drivers/gpu/drm/amd/amdgpu/atom.h                  |     10 +
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |      6 +-
 drivers/gpu/drm/amd/amdgpu/beige_goby_reg_init.c   |     54 +
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |      3 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |      8 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |      3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |     12 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |     20 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    279 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |      6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |     30 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |    669 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.h            |      1 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |     20 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |     40 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     51 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |      1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |      3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |      1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |     27 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |     31 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.h              |      1 +
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |      3 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |      9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |     42 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |     74 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |      5 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |      2 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |     42 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |    142 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    234 +-
 drivers/gpu/drm/amd/amdgpu/nv.h                    |      3 +
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     14 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |     58 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |      8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     37 +-
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |      9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     39 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    119 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    100 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |      6 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |      3 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c           |     20 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     19 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |     87 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |      7 +
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |      3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c              |      2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |      4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |      1 +
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |     26 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |      4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    171 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |      7 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |      6 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |      2 +-
 drivers/gpu/drm/amd/amdgpu/yellow_carp_reg_init.c  |     51 +
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |     13 +
 drivers/gpu/drm/amd/amdkfd/Makefile                |      5 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    120 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    994 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     59 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     82 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |     13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |     41 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |      2 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    889 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |     65 +
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |     14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |     58 +-
 .../gpu/drm/amd/amdkfd/kfd_pm4_headers_aldebaran.h |     93 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     43 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    129 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   3102 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    213 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    105 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |     11 +-
 drivers/gpu/drm/amd/amdkfd/soc15_int.h             |      1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |      2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    786 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     33 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |     41 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |     63 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |      4 -
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    156 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     24 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     25 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |     27 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h  |      1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |     19 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    164 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |     40 +
 drivers/gpu/drm/amd/display/dc/Makefile            |      6 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |      6 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    112 +-
 .../drm/amd/display/dc/bios/bios_parser_helper.c   |      5 +-
 .../drm/amd/display/dc/bios/command_table_helper.c |      2 +-
 .../amd/display/dc/bios/command_table_helper2.c    |      4 +-
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c   |      2 +
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |      2 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |      9 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     52 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |     70 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.h   |      3 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     18 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |      4 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    673 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |    103 +
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |    333 +
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h   |    271 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    157 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    133 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    324 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |      9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    862 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c |    218 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |     22 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |     45 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    624 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |      2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |     34 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    133 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |      8 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |      6 +
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |      5 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |      3 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |     31 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |      7 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |      8 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |     42 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.h       |      3 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |      9 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |     58 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |     13 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.h    |      3 +
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |      2 +
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h |      3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |     10 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |     28 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |      8 +
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.h  |      3 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c   |     17 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     41 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |     17 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |     62 +-
 .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |      1 +
 .../display/dc/dce110/dce110_timing_generator.c    |      1 +
 .../drm/amd/display/dc/dce110/dce110_transform_v.c |      3 +-
 .../display/dc/dce120/dce120_timing_generator.c    |      1 +
 .../amd/display/dc/dce80/dce80_timing_generator.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |      9 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.h   |      2 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |     70 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |      1 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |     41 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |     17 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    485 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |     17 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |      7 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |     13 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |     12 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |      6 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |      4 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |     24 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.c  |     36 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |    121 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |      6 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |      4 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |      1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h    |      7 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |     10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |     79 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |      5 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |     10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.h  |      9 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |     51 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |     12 +
 .../amd/display/dc/dcn20/dcn20_stream_encoder.h    |      3 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.c  |      3 +
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |      3 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.c  |      3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.h  |     17 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |      2 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |     16 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |      6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |     16 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |    175 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |      6 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |      6 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_dccg.c    |      3 +
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |      3 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |      2 +-
 .../gpu/drm/amd/display/dc/dcn302/dcn302_hwseq.c   |     34 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |     28 +-
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |     39 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h    |     30 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c   |     45 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h   |     18 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.c    |     20 +
 .../gpu/drm/amd/display/dc/dcn303/dcn303_init.h    |     15 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   1695 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.h    |     17 +
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |     42 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |    279 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |    147 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    406 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |    246 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |    956 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h    |    122 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |    103 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h  |    246 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    596 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |     56 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    150 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.h  |     33 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |    287 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |    259 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |    157 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.h    |     40 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2195 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |     42 +
 drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |      3 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |     15 +-
 drivers/gpu/drm/amd/display/dc/dm_pp_smu.h         |      4 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |      5 +
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |     26 +-
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |     26 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |     58 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    126 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   7510 ++
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.h |     43 +
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |   1724 +
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.h  |     69 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |     13 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |      2 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |     10 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |     47 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |     60 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    128 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |     43 -
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h       |      2 -
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |     12 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      2 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      2 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |      1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |      4 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |    100 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |      3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |      1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |     56 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |      3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |      6 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |      1 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |     10 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |      2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |      3 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |      3 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |      3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |      4 -
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |     20 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |      5 -
 drivers/gpu/drm/amd/display/dc/inc/link_dpcd.h     |     18 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |      7 +-
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |     14 -
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     17 +
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |     18 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |    262 +
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.h |     15 +
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.c   |    432 +
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.h   |     34 +
 drivers/gpu/drm/amd/display/dc/irq_types.h         |      2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     73 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    485 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |     72 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |     19 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.c  |      5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn30.c  |      5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn301.c |      5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn302.c |      5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c |     40 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h |     19 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    354 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |    230 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     56 +
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |     19 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     15 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |      2 +
 .../amd/display/include/gpio_service_interface.h   |      4 +-
 .../drm/amd/display/include/link_service_types.h   |     10 +
 .../drm/amd/display/modules/freesync/freesync.c    |     29 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |      1 -
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |      9 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |      5 +
 .../amd/display/modules/hdcp/hdcp2_transition.c    |      2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    |      2 +
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |    144 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.h    |     33 +-
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |     13 +-
 .../drm/amd/display/modules/power/power_helpers.c  |     35 +-
 .../drm/amd/display/modules/power/power_helpers.h  |      3 +-
 drivers/gpu/drm/amd/include/aldebaran_ip_offset.h  |      2 +-
 drivers/gpu/drm/amd/include/amd_acpi.h             |     18 +
 drivers/gpu/drm/amd/include/amd_shared.h           |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_1_sh_mask.h   |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_offset.h    |   8427 ++
 .../amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h   |  35330 ++++++
 .../amd/include/asic_reg/dcn/dcn_3_1_2_offset.h    |  15083 +++
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |  60749 ++++++++++
 .../amd/include/asic_reg/dcn/dpcs_3_0_3_offset.h   |    204 +
 .../amd/include/asic_reg/dcn/dpcs_3_0_3_sh_mask.h  |   1192 +
 .../drm/amd/include/asic_reg/df/df_3_6_offset.h    |      3 +
 .../drm/amd/include/asic_reg/df/df_3_6_sh_mask.h   |      1 +
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h  |  11936 ++
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_sh_mask.h | 103385 ++++++++++++++=
++++
 .../drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h |    355 +
 .../amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h    |    531 +
 drivers/gpu/drm/amd/include/atombios.h             |     10 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |     74 +-
 drivers/gpu/drm/amd/include/beige_goby_ip_offset.h |   1274 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    237 +-
 drivers/gpu/drm/amd/include/yellow_carp_offset.h   |   1366 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    349 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |     72 +-
 .../amd/pm/inc/smu11_driver_if_sienna_cichlid.h    |    366 +-
 .../gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h |      7 +-
 .../drm/amd/pm/inc/smu13_driver_if_yellow_carp.h   |    222 +
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |      4 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |      8 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h           |     57 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_pmfw.h      |    139 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_ppsmc.h     |     97 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |     54 +-
 .../drm/amd/pm/powerplay/hwmgr/hardwaremanager.c   |      3 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |      8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |     21 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_thermal.c  |      8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |     26 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |      2 +-
 .../drm/amd/pm/powerplay/hwmgr/vega12_thermal.c    |      3 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |      2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |      2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    154 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    140 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    224 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    916 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |     26 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     51 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     96 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |      2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |    267 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |      9 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c   |    311 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   1244 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h   |     28 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     75 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |      5 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |      4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |      1 -
 drivers/gpu/drm/arm/malidp_drv.c                   |      1 -
 drivers/gpu/drm/arm/malidp_planes.c                |      9 +-
 drivers/gpu/drm/armada/armada_drv.c                |      5 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |    139 +-
 drivers/gpu/drm/ast/ast_drv.c                      |     23 +-
 drivers/gpu/drm/ast/ast_drv.h                      |     12 +
 drivers/gpu/drm/ast/ast_main.c                     |     14 +-
 drivers/gpu/drm/bochs/bochs.h                      |      1 +
 drivers/gpu/drm/bochs/bochs_drv.c                  |      3 +-
 drivers/gpu/drm/bochs/bochs_hw.c                   |     25 +-
 drivers/gpu/drm/bochs/bochs_kms.c                  |      8 +
 drivers/gpu/drm/bridge/Kconfig                     |     35 +-
 drivers/gpu/drm/bridge/Makefile                    |      3 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |      1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |      6 +
 drivers/gpu/drm/bridge/analogix/Kconfig            |      2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |      1 +
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |      1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |      1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    183 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |      1 -
 drivers/gpu/drm/bridge/cadence/Makefile            |      2 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    146 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |     22 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |    570 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h    |     92 +
 drivers/gpu/drm/bridge/cdns-dsi.c                  |      2 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |    191 +
 drivers/gpu/drm/bridge/ite-it66121.c               |   1021 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |      3 -
 drivers/gpu/drm/bridge/lontium-lt9611.c            |      1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                   |     86 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |     22 +-
 drivers/gpu/drm/bridge/tc358767.c                  |      1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    709 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    717 +-
 drivers/gpu/drm/drm_agpsupport.c                   |    101 +-
 drivers/gpu/drm/drm_aperture.c                     |    348 +
 drivers/gpu/drm/drm_atomic.c                       |     35 +-
 drivers/gpu/drm/drm_atomic_helper.c                |     40 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |     10 +-
 drivers/gpu/drm/drm_auth.c                         |      3 +-
 drivers/gpu/drm/drm_blend.c                        |      4 +-
 drivers/gpu/drm/drm_bridge.c                       |      3 +
 drivers/gpu/drm/drm_bufs.c                         |     34 +-
 drivers/gpu/drm/drm_cache.c                        |    148 +
 drivers/gpu/drm/drm_connector.c                    |    127 +-
 drivers/gpu/drm/drm_context.c                      |      5 +-
 drivers/gpu/drm/drm_crtc_internal.h                |      4 +-
 drivers/gpu/drm/drm_dma.c                          |      8 +-
 drivers/gpu/drm/drm_dp_aux_dev.c                   |      6 +
 drivers/gpu/drm/drm_dp_dual_mode_helper.c          |     68 +-
 drivers/gpu/drm/drm_dp_helper.c                    |    195 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |    473 +-
 drivers/gpu/drm/drm_drv.c                          |      6 +-
 drivers/gpu/drm/drm_fb_cma_helper.c                |     46 +
 drivers/gpu/drm/drm_fb_helper.c                    |      2 +-
 drivers/gpu/drm/drm_file.c                         |     14 +-
 drivers/gpu/drm/drm_format_helper.c                |     96 +-
 drivers/gpu/drm/drm_fourcc.c                       |     29 +-
 drivers/gpu/drm/drm_gem.c                          |      7 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |      2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |     44 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |      7 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |     39 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |     55 +-
 drivers/gpu/drm/drm_internal.h                     |     13 -
 drivers/gpu/drm/drm_ioc32.c                        |     19 +-
 drivers/gpu/drm/drm_ioctl.c                        |     27 +-
 drivers/gpu/drm/drm_lease.c                        |      1 -
 drivers/gpu/drm/drm_legacy.h                       |     38 +
 drivers/gpu/drm/drm_legacy_misc.c                  |      1 -
 drivers/gpu/drm/drm_memory.c                       |      1 -
 drivers/gpu/drm/drm_modes.c                        |     13 +-
 drivers/gpu/drm/drm_pci.c                          |     89 +-
 drivers/gpu/drm/drm_plane.c                        |     18 +-
 drivers/gpu/drm/drm_vm.c                           |      2 -
 drivers/gpu/drm/etnaviv/etnaviv_dump.c             |      8 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |     10 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |      3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |     20 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |     68 +-
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c             |     31 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |      7 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |      9 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |      7 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |      2 -
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |      8 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |     25 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |      9 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |      7 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            |      4 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |      6 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |      7 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |     10 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |      8 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |      7 +-
 drivers/gpu/drm/gma500/backlight.c                 |      4 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |     50 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |      2 +-
 drivers/gpu/drm/gma500/intel_gmbus.c               |      2 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |      2 +-
 drivers/gpu/drm/gud/gud_internal.h                 |      4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |      6 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |      2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h       |      2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h    |      2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |      2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |      2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h    |      2 +-
 drivers/gpu/drm/hyperv/Makefile                    |      8 +
 drivers/gpu/drm/hyperv/hyperv_drm.h                |     52 +
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    311 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |    231 +
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c          |    485 +
 drivers/gpu/drm/i810/i810_dma.c                    |     11 +-
 drivers/gpu/drm/i915/Kconfig                       |      1 +
 drivers/gpu/drm/i915/Makefile                      |      5 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |      1 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |      1 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |      4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |     27 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |     35 +-
 drivers/gpu/drm/i915/display/intel_atomic.h        |      1 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |     43 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |      4 +
 drivers/gpu/drm/i915/display/intel_audio.c         |     32 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |     77 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |     26 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |    452 +-
 drivers/gpu/drm/i915/display/intel_color.c         |      7 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |      1 +
 drivers/gpu/drm/i915/display/intel_connector.c     |      6 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |      8 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |      4 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |      3 +
 drivers/gpu/drm/i915/display/intel_csr.h           |     21 -
 drivers/gpu/drm/i915/display/intel_cursor.c        |      5 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |    162 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |     64 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |      4 +
 drivers/gpu/drm/i915/display/intel_de.h            |     41 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   1038 +-
 drivers/gpu/drm/i915/display/intel_display.h       |     31 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |     39 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |    686 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |     11 +
 drivers/gpu/drm/i915/display/intel_display_types.h |     39 +-
 .../drm/i915/display/{intel_csr.c =3D> intel_dmc.c}  |    418 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |     43 +
 drivers/gpu/drm/i915/display/intel_dp.c            |    133 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |      3 -
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |     24 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |      2 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |      8 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.h       |     15 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  |      8 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |     19 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |      1 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |      9 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |      5 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |     77 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |      1 +
 drivers/gpu/drm/i915/display/intel_dsi.h           |      1 +
 drivers/gpu/drm/i915/display/intel_dvo.c           |      1 +
 drivers/gpu/drm/i915/display/intel_fb.c            |    115 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |      6 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |     28 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |     51 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |      1 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |     62 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |      9 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |     16 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |     10 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    230 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |     12 +
 drivers/gpu/drm/i915/display/intel_lspcon.c        |     18 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |      3 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |     16 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |     67 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |     56 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |     20 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |    282 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |      5 +
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |    309 +
 drivers/gpu/drm/i915/display/intel_qp_tables.h     |     14 +
 drivers/gpu/drm/i915/display/intel_sdvo.c          |      2 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |      1 +
 drivers/gpu/drm/i915/display/intel_tc.c            |    175 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |      2 +
 drivers/gpu/drm/i915/display/intel_tv.c            |      9 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    184 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |      3 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |     59 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |      1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    217 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |     79 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |      1 +
 drivers/gpu/drm/i915/dma_resv_utils.c              |      2 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |      7 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |      9 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    345 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |      2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |     34 +-
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h         |      2 +
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |     79 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h           |      5 +
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |      8 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |     13 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |      2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c     |      8 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |     36 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |      3 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |      3 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |     98 -
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |      4 -
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |      4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |     13 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    177 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |      8 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |     12 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |      6 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |     10 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |     10 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |      4 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |     27 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |     40 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |     10 +-
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c            |     40 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |      2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |     13 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |      2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |     33 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h               |      7 +
 drivers/gpu/drm/i915/gt/intel_context.c            |      3 +-
 drivers/gpu/drm/i915/gt/intel_context_sseu.c       |      2 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |      8 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    121 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |      2 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |     18 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    113 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.h   |      3 -
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |     54 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |     40 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |      2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |     29 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |      3 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |     12 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    106 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.h             |     23 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c          |     10 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |      7 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |    146 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |     48 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                |      6 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |     50 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |      8 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |     15 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |     16 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |     29 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |      2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    213 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |     11 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |     76 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |     62 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |     14 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |      6 +-
 drivers/gpu/drm/i915/gt/intel_timeline.c           |      4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    166 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |      2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |      3 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |     24 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |      2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |      2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |     61 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |      8 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |     12 +-
 drivers/gpu/drm/i915/gt/selftest_llc.c             |      4 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |     12 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |      2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |     36 +-
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c |      8 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |     22 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |      6 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |     18 +-
 drivers/gpu/drm/i915/gt/shmem_utils.c              |      4 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |     51 +
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |    106 +
 .../i915/gt/uc/abi/guc_communication_mmio_abi.h    |     52 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |     14 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |     21 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |     67 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |      2 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |     22 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |    532 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |     14 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |      2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |    233 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log_debugfs.c |      1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    101 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h  |      1 -
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |      6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     14 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |      8 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |      2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |     10 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |      4 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |     14 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |      2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |     10 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |      4 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |      4 +-
 drivers/gpu/drm/i915/i915_active.c                 |     14 +-
 drivers/gpu/drm/i915/i915_active.h                 |     11 +-
 drivers/gpu/drm/i915/i915_active_types.h           |      5 -
 drivers/gpu/drm/i915/i915_buddy.c                  |    435 -
 drivers/gpu/drm/i915/i915_buddy.h                  |    131 -
 drivers/gpu/drm/i915/i915_cmd_parser.c             |     28 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |     51 +-
 drivers/gpu/drm/i915/i915_drv.c                    |     86 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    153 +-
 drivers/gpu/drm/i915/i915_gem.c                    |     19 +-
 drivers/gpu/drm/i915/i915_globals.c                |      1 -
 drivers/gpu/drm/i915/i915_globals.h                |      1 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |     98 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |      4 +-
 drivers/gpu/drm/i915/i915_irq.c                    |    140 +-
 drivers/gpu/drm/i915/i915_irq.h                    |      1 +
 drivers/gpu/drm/i915/i915_params.c                 |      2 +-
 drivers/gpu/drm/i915/i915_params.h                 |     11 +-
 drivers/gpu/drm/i915/i915_pci.c                    |     59 +-
 drivers/gpu/drm/i915/i915_perf.c                   |     55 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |     20 +-
 drivers/gpu/drm/i915/i915_query.c                  |     62 +
 drivers/gpu/drm/i915/i915_reg.h                    |    268 +-
 drivers/gpu/drm/i915/i915_request.c                |     12 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |     70 +
 drivers/gpu/drm/i915/i915_scatterlist.h            |     20 +-
 drivers/gpu/drm/i915/i915_suspend.c                |     22 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |      4 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |     62 +-
 drivers/gpu/drm/i915/i915_trace.h                  |     39 +
 drivers/gpu/drm/i915/i915_utils.h                  |     10 +
 drivers/gpu/drm/i915/i915_vgpu.c                   |      2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |     62 +-
 drivers/gpu/drm/i915/i915_vma.h                    |     12 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |      1 -
 drivers/gpu/drm/i915/intel_device_info.c           |     31 +-
 drivers/gpu/drm/i915/intel_device_info.h           |     17 +-
 drivers/gpu/drm/i915/intel_dram.c                  |     14 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |    205 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |     61 +-
 drivers/gpu/drm/i915/intel_pch.c                   |     16 +-
 drivers/gpu/drm/i915/intel_pch.h                   |      1 +
 drivers/gpu/drm/i915/intel_pm.c                    |    445 +-
 drivers/gpu/drm/i915/intel_pm.h                    |      4 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |    226 +
 drivers/gpu/drm/i915/intel_region_ttm.h            |     34 +
 drivers/gpu/drm/i915/intel_runtime_pm.h            |      2 +-
 drivers/gpu/drm/i915/intel_sideband.c              |      2 +-
 drivers/gpu/drm/i915/intel_step.c                  |     12 +-
 drivers/gpu/drm/i915/intel_uncore.c                |     44 +-
 drivers/gpu/drm/i915/intel_wopcm.c                 |     10 +-
 drivers/gpu/drm/i915/selftests/i915_active.c       |      2 +-
 drivers/gpu/drm/i915/selftests/i915_buddy.c        |    789 -
 drivers/gpu/drm/i915/selftests/i915_gem.c          |     20 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |     14 +-
 .../gpu/drm/i915/selftests/i915_mock_selftests.h   |      1 -
 drivers/gpu/drm/i915/selftests/i915_perf.c         |      9 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |      8 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c          |      3 +
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |     16 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |    220 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |     10 +-
 drivers/gpu/drm/i915/selftests/librapl.c           |     10 +
 drivers/gpu/drm/i915/selftests/librapl.h           |      4 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |     13 +-
 drivers/gpu/drm/i915/selftests/mock_region.c       |     70 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |      1 -
 drivers/gpu/drm/imx/imx-drm-core.c                 |     22 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |      5 +
 drivers/gpu/drm/imx/ipuv3-crtc.c                   |     11 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |    115 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |     72 +-
 drivers/gpu/drm/ingenic/ingenic-drm.h              |      1 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |     23 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                      |     10 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |      4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |      3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |      4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |      3 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |      4 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |    129 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |      2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |     17 +
 drivers/gpu/drm/meson/meson_drv.c                  |     27 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |      1 +
 drivers/gpu/drm/mga/mga_dma.c                      |     29 +-
 drivers/gpu/drm/mga/mga_drv.h                      |      1 -
 drivers/gpu/drm/mga/mga_state.c                    |      3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |      5 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |      2 +-
 drivers/gpu/drm/msm/Kconfig                        |      3 +-
 drivers/gpu/drm/msm/Makefile                       |      3 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |     60 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |     40 +-
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |     38 +-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |     95 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |     29 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |      2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |      4 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   2201 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |     55 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |     34 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |    305 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |      2 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |     44 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |     33 +
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |     30 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |     14 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |     26 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |     13 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |    119 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |    230 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |     43 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |     22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |     43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    110 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |      4 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     58 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |     54 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |      6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c         |    139 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h         |     22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    202 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |     16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |      6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |      7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   1508 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |    132 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |      6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |      6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |      6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |      6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |      4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |      6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |      6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |     75 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |      8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |      8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |     23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |      4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |     63 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |     14 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |     34 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |      2 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |      8 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |     38 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |     35 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |      7 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |     12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |      5 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |    135 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |     34 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       |    125 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       |    136 +
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |    187 +
 drivers/gpu/drm/msm/dp/dp_aux.c                    |    181 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |      8 -
 drivers/gpu/drm/msm/dp/dp_catalog.c                |     18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |      7 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |     93 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |      3 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    121 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |      1 +
 drivers/gpu/drm/msm/dp/dp_link.c                   |     21 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |      4 +-
 drivers/gpu/drm/msm/dp/dp_power.h                  |      4 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |      6 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |      4 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   1722 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |     30 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |     12 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |    228 +
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |    310 +
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |    238 +
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |    385 +
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |    287 +
 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h          |    480 +
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |    482 +
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |     34 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |     31 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |      4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c         |      1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |      1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c         |      1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |      1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    |      1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |      7 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |     34 +-
 drivers/gpu/drm/msm/edp/edp.h                      |      3 +-
 drivers/gpu/drm/msm/edp/edp.xml.h                  |     34 +-
 drivers/gpu/drm/msm/edp/edp_aux.c                  |      5 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 |      8 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |     34 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |     34 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |     31 +
 drivers/gpu/drm/msm/msm_drv.c                      |     33 +-
 drivers/gpu/drm/msm/msm_drv.h                      |     24 +-
 drivers/gpu/drm/msm/msm_fb.c                       |      8 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |      5 +-
 drivers/gpu/drm/msm/msm_gem.c                      |     49 +-
 drivers/gpu/drm/msm/msm_gem.h                      |      1 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |     18 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |      1 +
 drivers/gpu/drm/msm/msm_gpu.c                      |     51 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |     29 +-
 drivers/gpu/drm/msm/msm_gpummu.c                   |      5 +
 drivers/gpu/drm/msm/msm_iommu.c                    |     22 +-
 drivers/gpu/drm/msm/msm_kms.h                      |      9 +
 drivers/gpu/drm/msm/msm_mmu.h                      |      5 +-
 drivers/gpu/drm/mxsfb/Kconfig                      |      1 -
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |      4 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |      2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |      2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |     59 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |      2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |     29 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |     19 -
 drivers/gpu/drm/nouveau/nouveau_display.h          |      2 -
 drivers/gpu/drm/nouveau/nouveau_drm.c              |      9 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |      6 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |      4 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |     60 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |     11 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |     15 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |     83 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.h              |      1 -
 drivers/gpu/drm/nouveau/nouveau_vmm.c              |      4 +-
 drivers/gpu/drm/nouveau/nv17_fence.c               |      2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c               |      2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c     |      6 +-
 drivers/gpu/drm/panel/Kconfig                      |      1 +
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |      8 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |      2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |      6 +-
 drivers/gpu/drm/panel/panel-simple.c               |    142 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |      2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |      9 +
 drivers/gpu/drm/panfrost/panfrost_device.c         |      1 -
 drivers/gpu/drm/panfrost/panfrost_device.h         |      1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |     17 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |      1 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |      2 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |      1 +
 drivers/gpu/drm/pl111/Kconfig                      |      1 +
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |      2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |      5 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |      8 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |      9 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                     |     19 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |      4 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |     10 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |      5 -
 drivers/gpu/drm/qxl/qxl_ttm.c                      |      5 +-
 drivers/gpu/drm/r128/ati_pcigart.c                 |     35 +-
 drivers/gpu/drm/r128/r128_cce.c                    |      2 +-
 drivers/gpu/drm/r128/r128_drv.c                    |      4 +-
 drivers/gpu/drm/r128/r128_drv.h                    |      2 +-
 drivers/gpu/drm/r128/r128_state.c                  |      3 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |      5 +-
 drivers/gpu/drm/radeon/cik.c                       |      6 +-
 drivers/gpu/drm/radeon/evergreen.c                 |      4 +-
 drivers/gpu/drm/radeon/evergreen.h                 |      1 -
 drivers/gpu/drm/radeon/ni.c                        |      4 +-
 drivers/gpu/drm/radeon/r100.c                      |      6 +-
 drivers/gpu/drm/radeon/r300.c                      |      4 +-
 drivers/gpu/drm/radeon/r420.c                      |      5 +-
 drivers/gpu/drm/radeon/r520.c                      |      4 +-
 drivers/gpu/drm/radeon/r600.c                      |      4 +-
 drivers/gpu/drm/radeon/radeon.h                    |     44 +-
 drivers/gpu/drm/radeon/radeon_agp.c                |    118 +-
 drivers/gpu/drm/radeon/radeon_asic.h               |      2 -
 drivers/gpu/drm/radeon/radeon_cs.c                 |     10 +-
 drivers/gpu/drm/radeon/radeon_device.c             |      3 +-
 drivers/gpu/drm/radeon/radeon_display.c            |      2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |      7 +
 drivers/gpu/drm/radeon/radeon_drv.c                |     19 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |      5 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |     65 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |     18 +-
 drivers/gpu/drm/radeon/radeon_mn.c                 |      4 +-
 drivers/gpu/drm/radeon/radeon_object.c             |     22 +-
 drivers/gpu/drm/radeon/radeon_object.h             |      6 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |      2 +-
 drivers/gpu/drm/radeon/radeon_sync.c               |      4 +-
 drivers/gpu/drm/radeon/radeon_trace.h              |      2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |     80 +-
 drivers/gpu/drm/radeon/radeon_ttm.h                |      1 -
 drivers/gpu/drm/radeon/radeon_uvd.c                |     26 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |      4 +-
 drivers/gpu/drm/radeon/rs400.c                     |      4 +-
 drivers/gpu/drm/radeon/rs600.c                     |      4 +-
 drivers/gpu/drm/radeon/rs690.c                     |      4 +-
 drivers/gpu/drm/radeon/rv515.c                     |      4 +-
 drivers/gpu/drm/radeon/rv770.c                     |      4 +-
 drivers/gpu/drm/radeon/si.c                        |      4 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |      2 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.c              |      2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |     45 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |     10 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |      1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |      4 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |     54 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |      1 +
 drivers/gpu/drm/savage/savage_bci.c                |     26 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |     14 +-
 drivers/gpu/drm/scheduler/sched_main.c             |     44 +-
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |      1 +
 drivers/gpu/drm/sis/sis_drv.c                      |      3 +-
 drivers/gpu/drm/sti/sti_hda.c                      |      6 +-
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c         |      4 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |      2 +-
 drivers/gpu/drm/sti/sti_tvout.c                    |     18 +-
 drivers/gpu/drm/stm/ltdc.c                         |     35 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |      5 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |      7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |      8 +-
 drivers/gpu/drm/tegra/dc.c                         |     12 +-
 drivers/gpu/drm/tegra/dc.h                         |     26 +
 drivers/gpu/drm/tegra/dpaux.c                      |      5 +-
 drivers/gpu/drm/tegra/drm.c                        |      6 +-
 drivers/gpu/drm/tegra/hub.c                        |    182 +-
 drivers/gpu/drm/tegra/plane.c                      |     23 +-
 drivers/gpu/drm/tegra/plane.h                      |      3 +-
 drivers/gpu/drm/tegra/vic.c                        |      2 -
 drivers/gpu/drm/tegra/vic.h                        |      1 -
 drivers/gpu/drm/tiny/Kconfig                       |     16 +
 drivers/gpu/drm/tiny/Makefile                      |      1 +
 drivers/gpu/drm/tiny/cirrus.c                      |      5 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |      6 +-
 drivers/gpu/drm/tiny/ili9225.c                     |     12 +-
 drivers/gpu/drm/tiny/ili9341.c                     |     12 +-
 drivers/gpu/drm/tiny/ili9486.c                     |     12 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |     12 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    901 +
 drivers/gpu/drm/tiny/st7586.c                      |     12 +-
 drivers/gpu/drm/tiny/st7735r.c                     |     12 +-
 drivers/gpu/drm/ttm/Makefile                       |      2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |      8 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    250 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    379 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    156 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |     25 +-
 drivers/gpu/drm/ttm/ttm_module.c                   |     35 +
 drivers/gpu/drm/ttm/ttm_module.h                   |      3 +
 drivers/gpu/drm/ttm/ttm_range_manager.c            |     95 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |    236 +-
 drivers/gpu/drm/ttm/ttm_sys_manager.c              |     48 +
 drivers/gpu/drm/ttm/ttm_tt.c                       |     67 +-
 drivers/gpu/drm/vboxvideo/hgsmi_base.c             |     19 +-
 drivers/gpu/drm/vboxvideo/modesetting.c            |     20 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |      3 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |     68 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |     20 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |      2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    234 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |     16 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |      3 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |      1 -
 drivers/gpu/drm/vc4/vc4_txp.c                      |      2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |     27 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |      2 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |      3 +-
 drivers/gpu/drm/via/via_dma.c                      |      1 -
 drivers/gpu/drm/via/via_dmablit.c                  |     15 +-
 drivers/gpu/drm/via/via_map.c                      |      3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |     14 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |      8 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |      5 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |      4 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |      3 +
 drivers/gpu/drm/vkms/vkms_composer.c               |    104 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |      5 +
 drivers/gpu/drm/vkms/vkms_drv.h                    |      9 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |     28 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |     51 +-
 drivers/gpu/drm/vmwgfx/Kconfig                     |     10 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |      6 +-
 .../drm/vmwgfx/device_include/svga3d_surfacedefs.h |      8 +-
 drivers/gpu/drm/vmwgfx/device_include/svga_reg.h   |     55 +-
 drivers/gpu/drm/vmwgfx/ttm_lock.c                  |    194 -
 drivers/gpu/drm/vmwgfx/ttm_lock.h                  |    218 -
 drivers/gpu/drm/vmwgfx/ttm_object.c                |      2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c            |      8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |     10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |     85 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |    134 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |      6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |     25 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |     12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    169 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    147 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |     53 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |      8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |     18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h              |      2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c                |      2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |     30 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |     60 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |     77 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |     36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |     36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |     31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.h                |    214 -
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h          |    130 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h            |    219 +
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c            |      2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |      8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_reg.h                |      4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |     10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |      2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |     18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_simple_resource.c    |      5 -
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c                 |      4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |      6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c       |      6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |     46 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |     53 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |     30 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |     53 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |      4 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |      5 +-
 drivers/gpu/drm/zte/Kconfig                        |      1 -
 drivers/gpu/ipu-v3/ipu-dc.c                        |      5 +
 drivers/gpu/ipu-v3/ipu-di.c                        |      7 +
 drivers/gpu/ipu-v3/ipu-dp.c                        |     25 +-
 drivers/gpu/vga/vgaarb.c                           |     31 +-
 drivers/infiniband/core/umem_dmabuf.c              |      2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |     50 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c              |      9 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |      2 +
 drivers/pci/pci-driver.c                           |      1 +
 drivers/video/fbdev/Kconfig                        |      2 +-
 drivers/video/fbdev/aty/mach64_cursor.c            |      2 +-
 drivers/video/fbdev/imxfb.c                        |      2 +-
 drivers/video/fbdev/matrox/matroxfb_base.c         |      5 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |      6 +-
 include/drm/amd_asic_type.h                        |      2 +
 include/drm/bridge/dw_hdmi.h                       |      2 +
 include/drm/drm_agpsupport.h                       |    117 -
 include/drm/drm_aperture.h                         |     35 +
 include/drm/drm_atomic.h                           |     16 +
 include/drm/drm_cache.h                            |      7 +
 include/drm/drm_connector.h                        |      4 +
 include/drm/drm_device.h                           |      9 +-
 include/drm/drm_dp_dual_mode_helper.h              |     14 +-
 include/drm/drm_dp_helper.h                        |     52 +-
 include/drm/drm_dp_mst_helper.h                    |     15 +-
 include/drm/drm_fb_cma_helper.h                    |      5 +
 include/drm/drm_fb_helper.h                        |     51 -
 include/drm/drm_format_helper.h                    |     10 +-
 include/drm/drm_fourcc.h                           |      9 -
 include/drm/drm_gem_cma_helper.h                   |      3 +
 include/drm/drm_gem_ttm_helper.h                   |      5 +-
 include/drm/drm_gem_vram_helper.h                  |      7 +-
 include/drm/drm_legacy.h                           |     86 +-
 include/drm/drm_mode_config.h                      |      2 +
 include/drm/drm_print.h                            |     20 +-
 include/drm/gpu_scheduler.h                        |      2 +-
 include/drm/i915_pciids.h                          |     23 +
 include/drm/ttm/ttm_bo_api.h                       |     38 +-
 include/drm/ttm/ttm_bo_driver.h                    |     64 +-
 include/drm/ttm/ttm_caching.h                      |      2 +
 include/drm/ttm/ttm_device.h                       |     15 -
 include/drm/ttm/ttm_kmap_iter.h                    |     61 +
 include/drm/ttm/ttm_range_manager.h                |     42 +
 include/drm/ttm/ttm_resource.h                     |    113 +-
 include/drm/ttm/ttm_tt.h                           |     29 +
 include/linux/adreno-smmu-priv.h                   |     38 +-
 include/linux/dma-resv.h                           |     75 +-
 include/linux/pci.h                                |      3 +
 include/uapi/drm/amdgpu_drm.h                      |     18 +-
 include/uapi/drm/drm.h                             |     28 +-
 include/uapi/drm/drm_fourcc.h                      |      7 +
 include/uapi/drm/drm_mode.h                        |      7 +-
 include/uapi/drm/etnaviv_drm.h                     |      3 +
 include/uapi/drm/i915_drm.h                        |    393 +-
 include/uapi/drm/msm_drm.h                         |      7 +-
 include/uapi/drm/panfrost_drm.h                    |      1 +
 include/uapi/linux/kfd_ioctl.h                     |    171 +-
 include/video/imx-ipu-v3.h                         |      2 +
 1291 files changed, 312187 insertions(+), 22367 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 create mode 100644
Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/faraday,tve20=
0.txt
 create mode 100644
Documentation/devicetree/bindings/display/faraday,tve200.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dp-controller.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
 create mode 100644 Documentation/gpu/driver-uapi.rst
 create mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/beige_goby_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/yellow_carp_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_aldebaran.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_svm.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_=
mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_=
mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.=
h
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_dpcd.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/link_dpcd.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dc=
n31.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dc=
n31.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_3_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_0_3_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_2_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_2_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_3_off=
set.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dcn/dpcs_3_0_3_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_2_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_ma=
sk.h
 create mode 100644 drivers/gpu/drm/amd/include/beige_goby_ip_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/yellow_carp_offset.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu13_driver_if_yellow_carp.=
h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_pmfw.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
 create mode 100644 drivers/gpu/drm/bridge/cros-ec-anx7688.c
 create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c
 create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
 create mode 100644 drivers/gpu/drm/drm_aperture.c
 create mode 100644 drivers/gpu/drm/hyperv/Makefile
 create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm.h
 create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_drv.c
 create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
 create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_proto.c
 delete mode 100644 drivers/gpu/drm/i915/display/intel_csr.h
 rename drivers/gpu/drm/i915/display/{intel_csr.c =3D> intel_dmc.c} (60%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_qp_tables.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_qp_tables.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_ab=
i.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_a=
bi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
 create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.c
 create mode 100644 drivers/gpu/drm/i915/intel_region_ttm.h
 delete mode 100644 drivers/gpu/drm/i915/selftests/i915_buddy.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h
 create mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h
 create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
 create mode 100644 drivers/gpu/drm/ttm/ttm_sys_manager.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/ttm_lock.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_msg.h
 create mode 100755 drivers/gpu/drm/vmwgfx/vmwgfx_msg_arm64.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_msg_x86.h
 delete mode 100644 include/drm/drm_agpsupport.h
 create mode 100644 include/drm/drm_aperture.h
 create mode 100644 include/drm/ttm/ttm_kmap_iter.h
 create mode 100644 include/drm/ttm/ttm_range_manager.h
