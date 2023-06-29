Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEAE742282
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 10:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09DD10E0D1;
	Thu, 29 Jun 2023 08:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942E710E087
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 01:28:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98df3dea907so17474266b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 18:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688002097; x=1690594097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tgRkJIYollnO6j4b/wQ5qgLc4D00lbBQpUoCsZG/gr8=;
 b=Q4DB+xMnAbdORUbZ3M8gQkLo+jIX1Ddkk2hLWZGc0cPFPVxRUnmEG+lwbSCBSg3YBy
 BJU+Csr0mhKu9LRWqLwyqrojx3BXSWZCBqsStiir4QjB30I/BWmMp8qIZ+IBZe7tjSl0
 gro4QND8B+BMgDC5xzOzmeOKHpNq51T0bOI5o0xOiGf9sKkv8l8OKPAKM/5ReJdlBkEK
 lZk7JBYpTuNG8pYCpc3rV2V2Jfm4Qy8N1O5vT9hS/+d+6gxBGPpwTxYaoum2RXjG7d4l
 Td2JnqVbwU+zdMSq1WDM5rDkI+vO8z4j1YmBpCzviZK7I9k3V6VqWxsvddfva6LQfoil
 4DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688002097; x=1690594097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tgRkJIYollnO6j4b/wQ5qgLc4D00lbBQpUoCsZG/gr8=;
 b=POWB/acSXwb4dqDbCZ1fOm1oYmRQAkKTiTpUjn0Acs1YXOOrqRYBwKLT5Wu1STspv8
 D3q91R3lu3gakX9mJmtRVNGn836KfSqNjf4iiYezq3qAZjIzRHS9WF5cadDUFXOOagkX
 /riPXJ4X9qDgnZhV1Suu5+v4OTXbn5DoydCoLNPtHAc6t2BYNZifvKQOMLG07LgF1RtR
 A5ZvgmDq7gZUO2GlI6PuW7h4ZlzzBcqCRfGEnuqa/0pP4Q/wKmCh7Scd4+zJxeWM3Y9F
 6sIDGuwzpqMDmztgxoR839wstV8DeKMOFeC3OtGH6dGYrMtdkeU4dD0oYpcdoJs0ATBX
 uc/g==
X-Gm-Message-State: AC+VfDwAooIvNaAvQkhOOspmj5n9K7BDjSi5uJjWl+YzOkWRqtU5Cf6O
 JvP6H9tES9abH2VDze9v29eGDcvfxpRq5sA9rkU=
X-Google-Smtp-Source: ACHHUZ6D48YfilpmBvxDrjLb+2gAh9z/QmC5WOvWSMQjSvHkX1Y6U2e0eaSogRlfJbJE14RkGUaJgeNZV6iBYTBL1RI=
X-Received: by 2002:a17:906:edb2:b0:992:2c5a:808e with SMTP id
 sa18-20020a170906edb200b009922c5a808emr4162726ejb.7.1688002095903; Wed, 28
 Jun 2023 18:28:15 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 29 Jun 2023 11:28:02 +1000
Message-ID: <CAPM=9twGy8jVci0iPwdFUpePVPf6bxmyGbTT8HxwKqdsqFCjQA@mail.gmail.com>
Subject: [git pull] drm for 6.5-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 29 Jun 2023 08:44:36 +0000
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

This is the main drm pull request for 6.5-rc1.

I did a test merge this morning and nothing seemed to be needed.

There is one set of patches to misc for a i915 gsc/mei proxy driver.

Otherwise it's mostly amdgpu/i915/msm, lots of hw enablement and lots
of refactoring.

Regards,
Dave.

drm-next-2023-06-29:
drm changes for 6.5-rc1:

core:
- replace strlcpy with strscpy
- EDID changes to support further conversion to struct drm_edid
- Move i915 DSC parameter code to common DRM helpers
- Add Colorspace functionality

aperture:
- ignore framebuffers with non-primary devices

fbdev:
- use fbdev i/o helpers
- add Kconfig options for fb_ops helpers
- use new fb io helpers directly in drivers

sysfs:
- export DRM connector ID

scheduler:
- Avoid an infinite loop

ttm:
- store function table in .rodata
- Add query for TTM mem limit
- Add NUMA awareness to pools
- Export ttm_pool_fini()

bridge:
- fsl-ldb: support i.MX6SX
- lt9211, lt9611: remove blanking packets
- tc358768: implement input bus formats, devm cleanups
- ti-snd65dsi86: implement wait_hpd_asserted
- analogix: fix endless probe loop
- samsung-dsim: support swapped clock, fix enabling, support var clock
- display-connector: Add support for external power supply
- imx: Fix module linking
- tc358762: Support reset GPIO

panel:
- nt36523: Support Lenovo J606F
- st7703: Support Anbernic RG353V-V2
- InnoLux G070ACE-L01 support
- boe-tv101wum-nl6: Improve initialization
- sharp-ls043t1le001: Mode fixes
- simple: BOE EV121WXM-N10-1850, S6D7AA0
- Ampire AM-800480L1TMQW-T00H
- Rocktech RK043FN48H
- Starry himax83102-j02
- Starry ili9882t

amdgpu:
- add new ctx query flag to handle reset better
- add new query/set shadow buffer for rdna3
- DCN 3.2/3.1.x/3.0.x updates
- Enable DC_FP on loongarch
- PCIe fix for RDNA2
- improve DC FAMS/SubVP support for better power management
- partition support for lots of engines
- Take NUMA into account when allocating memory
- Add new DRM_AMDGPU_WERROR config parameter to help with CI
- Initial SMU13 overdrive support
- Add support for new colorspace KMS API
- W=3D1 fixes

amdkfd:
- Query TTM mem limit rather than hardcoding it
- GC 9.4.3 partition support
- Handle NUMA for partitions
- Add debugger interface for enabling gdb
- Add KFD event age tracking

radeon:
- Fix possible UAF

i915:
- new getparam for PXP support
- GSC/MEI proxy driver
- Meteorlake display enablement
- avoid clearing preallocated framebuffers with TTM
- implement framebuffer mmap support
- Disable sampler indirect state in bindless heap
- Enable fdinfo for GuC backends
- GuC loading and firmware table handling fixes
- Various refactors for multi-tile enablement
- Define MOCS and PAT tables for MTL
- GSC/MEI support for Meteorlake
- PMU multi-tile support
- Large driver kernel doc cleanup
- Allow VRR toggling and arbitrary refresh rates
- Support async flips on linear buffers on display ver 12+
- Expose CRTC CTM property on ILK/SNB/VLV
- New debugfs for display clock frequencies
- Hotplug refactoring
- Display refactoring
- I915_GEM_CREATE_EXT_SET_PAT for Mesa on Meteorlake
- Use large rings for compute contexts
- HuC loading for MTL
- Allow user to set cache at BO creation
- MTL powermanagement enhancements
- Switch to dedicated workqueues to stop using flush_scheduled_work()
- Move display runtime init under display/
- Remove 10bit gamma on desktop gen3 parts, they don't support it

habanalabs:
- uapi: return 0 for user queries if there was a h/w or f/w error
- Add pci health check when we lose connection with the firmware. This
can be used to
  distinguish between pci link down and firmware getting stuck.
- Add more info to the error print when TPC interrupt occur.
- Firmware fixes

msm:
- Adreno A660 bindings
- SM8350 MDSS bindings fix
- Added support for DPU on sm6350 and sm6375 platforms
- Implemented tearcheck support to support vsync on SM150 and newer platfor=
ms
- Enabled missing features (DSPP, DSC, split display) on sc8180x,
sc8280xp, sm8450
- Added support for DSI and 28nm DSI PHY on MSM8226 platform
- Added support for DSI on sm6350 and sm6375 platforms
- Added support for display controller on MSM8226 platform
- A690 GPU support
- Move cmdstream dumping out of fence signaling path
- a610 support
- Support for a6xx devices without GMU

nouveau:
- NULL ptr before deref fixes

armada:
- implement fbdev emulation as client

sun4i:
- fix mipi-dsi dotclock
- release clocks

vc4:
- rgb range toggle property
- BT601 / BT2020 HDMI support

vkms:
- convert to drmm helpers
- add reflection and rotation support
- fix rgb565 conversion

gma500:
- fix iomem access

shmobile:
- support renesas soc platform
- enable fbdev

mxsfb:
- Add support for i.MX93 LCDIF

stm:
- dsi: Use devm_ helper
- ltdc: Fix potential invalid pointer deref

renesas:
- Group drivers in renesas subdirectory to prepare for new platform
- Drop deprecated R-Car H3 ES1.x support

meson:
- Add support for MIPI DSI displays

virtio:
- add sync object support

mediatek:
- Add display binding document for MT6795
The following changes since commit 45a3e24f65e90a047bef86f927ebdc4c710edaa1=
:

  Linux 6.4-rc7 (2023-06-18 14:06:27 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-06-29

for you to fetch changes up to 5ff2977b19769fd24b0cfbe7cbe4d5114b6106af:

  Merge tag 'drm-intel-next-fixes-2023-06-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-06-29
06:25:26 +1000)

----------------------------------------------------------------
drm changes for 6.5-rc1:

core:
- replace strlcpy with strscpy
- EDID changes to support further conversion to struct drm_edid
- Move i915 DSC parameter code to common DRM helpers
- Add Colorspace functionality

aperture:
- ignore framebuffers with non-primary devices

fbdev:
- use fbdev i/o helpers
- add Kconfig options for fb_ops helpers
- use new fb io helpers directly in drivers

sysfs:
- export DRM connector ID

scheduler:
- Avoid an infinite loop

ttm:
- store function table in .rodata
- Add query for TTM mem limit
- Add NUMA awareness to pools
- Export ttm_pool_fini()

bridge:
- fsl-ldb: support i.MX6SX
- lt9211, lt9611: remove blanking packets
- tc358768: implement input bus formats, devm cleanups
- ti-snd65dsi86: implement wait_hpd_asserted
- analogix: fix endless probe loop
- samsung-dsim: support swapped clock, fix enabling, support var clock
- display-connector: Add support for external power supply
- imx: Fix module linking
- tc358762: Support reset GPIO

panel:
- nt36523: Support Lenovo J606F
- st7703: Support Anbernic RG353V-V2
- InnoLux G070ACE-L01 support
- boe-tv101wum-nl6: Improve initialization
- sharp-ls043t1le001: Mode fixes
- simple: BOE EV121WXM-N10-1850, S6D7AA0
- Ampire AM-800480L1TMQW-T00H
- Rocktech RK043FN48H
- Starry himax83102-j02
- Starry ili9882t

amdgpu:
- add new ctx query flag to handle reset better
- add new query/set shadow buffer for rdna3
- DCN 3.2/3.1.x/3.0.x updates
- Enable DC_FP on loongarch
- PCIe fix for RDNA2
- improve DC FAMS/SubVP support for better power management
- partition support for lots of engines
- Take NUMA into account when allocating memory
- Add new DRM_AMDGPU_WERROR config parameter to help with CI
- Initial SMU13 overdrive support
- Add support for new colorspace KMS API
- W=3D1 fixes

amdkfd:
- Query TTM mem limit rather than hardcoding it
- GC 9.4.3 partition support
- Handle NUMA for partitions
- Add debugger interface for enabling gdb
- Add KFD event age tracking

radeon:
- Fix possible UAF

i915:
- new getparam for PXP support
- GSC/MEI proxy driver
- Meteorlake display enablement
- avoid clearing preallocated framebuffers with TTM
- implement framebuffer mmap support
- Disable sampler indirect state in bindless heap
- Enable fdinfo for GuC backends
- GuC loading and firmware table handling fixes
- Various refactors for multi-tile enablement
- Define MOCS and PAT tables for MTL
- GSC/MEI support for Meteorlake
- PMU multi-tile support
- Large driver kernel doc cleanup
- Allow VRR toggling and arbitrary refresh rates
- Support async flips on linear buffers on display ver 12+
- Expose CRTC CTM property on ILK/SNB/VLV
- New debugfs for display clock frequencies
- Hotplug refactoring
- Display refactoring
- I915_GEM_CREATE_EXT_SET_PAT for Mesa on Meteorlake
- Use large rings for compute contexts
- HuC loading for MTL
- Allow user to set cache at BO creation
- MTL powermanagement enhancements
- Switch to dedicated workqueues to stop using flush_scheduled_work()
- Move display runtime init under display/
- Remove 10bit gamma on desktop gen3 parts, they don't support it

habanalabs:
- uapi: return 0 for user queries if there was a h/w or f/w error
- Add pci health check when we lose connection with the firmware. This
can be used to
  distinguish between pci link down and firmware getting stuck.
- Add more info to the error print when TPC interrupt occur.
- Firmware fixes

msm:
- Adreno A660 bindings
- SM8350 MDSS bindings fix
- Added support for DPU on sm6350 and sm6375 platforms
- Implemented tearcheck support to support vsync on SM150 and newer platfor=
ms
- Enabled missing features (DSPP, DSC, split display) on sc8180x,
sc8280xp, sm8450
- Added support for DSI and 28nm DSI PHY on MSM8226 platform
- Added support for DSI on sm6350 and sm6375 platforms
- Added support for display controller on MSM8226 platform
- A690 GPU support
- Move cmdstream dumping out of fence signaling path
- a610 support
- Support for a6xx devices without GMU

nouveau:
- NULL ptr before deref fixes

armada:
- implement fbdev emulation as client

sun4i:
- fix mipi-dsi dotclock
- release clocks

vc4:
- rgb range toggle property
- BT601 / BT2020 HDMI support

vkms:
- convert to drmm helpers
- add reflection and rotation support
- fix rgb565 conversion

gma500:
- fix iomem access

shmobile:
- support renesas soc platform
- enable fbdev

mxsfb:
- Add support for i.MX93 LCDIF

stm:
- dsi: Use devm_ helper
- ltdc: Fix potential invalid pointer deref

renesas:
- Group drivers in renesas subdirectory to prepare for new platform
- Drop deprecated R-Car H3 ES1.x support

meson:
- Add support for MIPI DSI displays

virtio:
- add sync object support

mediatek:
- Add display binding document for MT6795

----------------------------------------------------------------
Abhinav Kumar (7):
      drm/msm/dpu: remove DPU_DSPP_GC handling in dspp flush
      drm/msm/dpu: remove DPU_DSPP_IGC handling in dspp flush
      drm/msm/dpu: remove GC and IGC related code from dpu catalog
      drm/msm/dpu: drop DSPP_MSM8998_MASK from hw catalog
      drm/msm/dpu: add writeback support for sc7280
      drm/msm/dpu: add DSC blocks to the catalog of MSM8998
      drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets

Adam Ford (7):
      drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
      drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
      drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
      drm: bridge: samsung-dsim: Dynamically configure DPHY timing
      drm: bridge: samsung-dsim: Support non-burst mode
      dt-bindings: bridge: samsung-dsim: Make some flags optional
      dt-bindings: bridge: samsung-dsim: Make some flags optional

Alan Liu (4):
      drm/amd/display: Fix in disabling secure display
      drm/amdgpu: Fix desktop freezed after gpu-reset
      drm/amd/display: Fix in secure display context creation
      drm/amd/display: Fix warning in disabling vblank irq

Alan Previn (9):
      drm/i915/pxp: Add GSC-CS back-end resource init and cleanup
      drm/i915/pxp: Add MTL hw-plumbing enabling for KCR operation
      drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC
      drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
      drm/i915/pxp: Add ARB session creation and cleanup
      drm/i915/uapi/pxp: Add a GET_PARAM for PXP
      drm/i915/pxp: On MTL, KCR enabling doesn't wait on tee component
      drm/i915/pxp: Enable PXP with MTL-GSC-CS
      drm/i915/gsc: take a wakeref for the proxy-init-completion check

Alex Deucher (41):
      drm/amdgpu/gfx11: add FW version check for new CP GFX shadow feature
      drm/amdgpu/gfx11: check the CP FW version CP GFX shadow support
      drm/amdgpu/UAPI: add new CS chunk for GFX shadow buffers
      drm/amdgpu: don't require a job for cond_exec and shadow
      drm/amdgpu: add UAPI to query GFX shadow sizes
      drm/amdgpu: add gfx shadow callback
      drm/amdgpu: add get_gfx_shadow_info callback for gfx11
      drm/amdgpu: add support for new GFX shadow size query
      drm/amdgpu: bump driver version number for CP GFX shadow
      drm/amdgpu: track MQD size for gfx and compute
      drm/amdgpu: add debugfs interface for reading MQDs
      drm/amdgpu/gfx11: update gpu_clock_counter logic
      drm/amdgpu/gfx11: drop old bring up code
      drm/amdgpu/gfx10: drop old bring up code
      drm/amdgpu: add [en/dis]able_kgq() functions
      drm/amdgpu/gfx10: use generic [en/dis]able_kgq() helpers
      drm/amdgpu/gfx11: use generic [en/dis]able_kgq() helpers
      drm/amdgpu/gfx10: drop unused variable
      drm/amdgpu/gfx11: drop unused variable
      drm/amdgpu/gfx8: always restore kcq MQDs
      drm/amdgpu/gfx9: always restore kcq MQDs
      drm/amdgpu/gfx10: always restore kcq/kgq MQDs
      drm/amdgpu/gfx11: always restore kcq/kgq MQDs
      drm/amdgpu: put MQDs in VRAM
      drm/amdgpu: drop invalid IP revision
      drm/amdgpu: drop unused function
      drm/amdgpu/gmc11: implement get_vbios_fb_size()
      drm/amdgpu/gmc9: fix 64 bit division in partition code
      drm/amdgpu/vcn4: fix endian conversion
      drm/amdkfd: fix stack size in svm_range_validate_and_map
      drm/radeon: reintroduce radeon_dp_work_func content
      drm/amdkfd: fix gfx_target_version for certain 11.0.3 devices
      amd/amdkfd: drop unused KFD_IOCTL_SVM_FLAG_UNCACHED flag
      Revert "drm/amdgpu: change the reference clock for raven/raven2"
      Revert "drm/amdgpu: Differentiate between Raven2 and
Raven/Picasso according to revision id"
      Revert "drm/amdgpu: switch to golden tsc registers for raven/raven2"
      drm/amdgpu: add missing radeon secondary PCI ID
      Revert "drm/amd/display: fix dpms_off issue when disabling bios mode"
      drm/amd/display: don't free stolen console memory during suspend
      drm/amdgpu/sdma4: set align mask to 255
      drm/amdgpu: mark GC 9.4.3 experimental for now

Alex Hung (3):
      drm/amd/display: allow edp updates for virtual signal
      drm/amd/display: fix a divided-by-zero error
      drm/amd/display: implement force function in amdgpu_dm_connector_func=
s

Alex Sierra (3):
      drm/amdgpu: improve wait logic at fence polling
      drm/amdkfd: pass kfd_node ref to svm migration api
      drm/amdkfd: flag added to handle errors from svm validate and map

Alexander Stein (3):
      drm/bridge: ti-sn65dsi83: Fix enable error path
      drm/bridge: tc358767: Switch to devm MIPI-DSI helpers
      drm/bridge: tc358767: explicitly set readable registers

Alexander Usyskin (2):
      drm/i915/mtl: Define GSC Proxy component interface
      mei: gsc_proxy: add gsc proxy driver

Alvin Lee (25):
      drm/amd/display: Only consider DISPCLK when using optimized boot path
      drm/amd/display: Reduce SubVP + DRR stretch margin
      drm/amd/display: Set watermarks set D equal to A
      drm/amd/display: Enable FPO + Vactive
      drm/amd/display: Update DTBCLK for DCN32
      drm/amd/display: Update FW feature caps struct
      drm/amd/display: Limit DCN32 8 channel or less parts to DPM1 for FPO
      drm/amd/display: Enable SubVP on PSR panels if single stream
      drm/amd/display: For no plane case set pstate support in validation
      drm/amd/display: Enable SubVP for high refresh rate displays
      drm/amd/display: Query GECC enable for SubVP disable
      drm/amd/display: Check Vactive for VRR active for FPO + Vactive
      drm/amd/display: Enforce 60us prefetch for 200Mhz DCFCLK modes
      drm/amd/display: Block SubVP high refresh when VRR active fixed
      drm/amd/display: Block SubVP on displays that have pixclk > 1800Mhz
      drm/amd/display: Only skip update for DCFCLK, UCLK, FCLK on overclock
      drm/amd/display: Update vactive margin and max vblank for fpo + vacti=
ve
      drm/amd/display: Make unbounded req update separate from dlg/ttu
      drm/amd/display: Apply 60us prefetch for DCFCLK <=3D 300Mhz
      drm/amd/display: Refactor fast update to use new HWSS build sequence
      drm/amd/display: Reduce sdp bw after urgent to 90%
      drm/amd/display: SubVP high refresh only if all displays >=3D 120hz
      drm/amd/display: Re-enable SubVP high refresh
      drm/amd/display: Block SubVP + DRR if the DRR is PSR capable
      drm/amd/display: Include CSC updates in new fast update path

Amber Lin (5):
      drm/amdgpu: Add kgd2kfd for GC 9.4.3
      drm/amdkfd: Set F8_MODE for gc_v9_4_3
      drm/amdgpu: Set XNACK per process on GC 9.4.3
      drm/amdgpu: Fix SWS on multi-XCD GPU
      amd/amdgpu: Set MTYPE_UC for access over PCIe

Andi Shyti (4):
      drm/i915: Make IRQ reset and postinstall multi-gt aware
      drm/i915/i915_drv: Use proper parameter naming in for_each_engine()
      drm/i915/i915_drv: Use i915 instead of dev_priv insied the
file_priv structure
      drm/i915/gt: Use the correct error value when kernel_context() fails

Andrzej Hajda (2):
      drm/i915/mtl: do not enable render power-gating on MTL
      drm/i915/gt: limit lmem allocation size to succeed on SmallBars

AngeloGioacchino Del Regno (12):
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT67=
95
      dt-bindings: display: mediatek: aal: Add compatible for MediaTek MT67=
95
      dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT67=
95
      dt-bindings: display: mediatek: ovl: Add compatible for MediaTek MT67=
95
      dt-bindings: display: mediatek: rdma: Add compatible for MediaTek MT6=
795
      dt-bindings: display: mediatek: wdma: Add compatible for MediaTek MT6=
795
      dt-bindings: display: mediatek: color: Add compatible for MediaTek MT=
6795
      dt-bindings: display: mediatek: gamma: Add compatible for MediaTek MT=
6795
      dt-bindings: display: mediatek: merge: Add compatible for MediaTek MT=
6795
      dt-bindings: display: mediatek: split: Add compatible for MediaTek MT=
6795
      dt-bindings: display: mediatek: ufoe: Add compatible for MediaTek MT6=
795
      dt-bindings: display: mediatek: od: Add compatible for MediaTek MT679=
5

Ankit Nautiyal (7):
      drm/i915/display/mtl: Fill port width in
DDI_BUF_/TRANS_DDI_FUNC_/PORT_BUF_CTL for HDMI
      drm/i915/display: Add new member to configure PCON color conversion
      drm/i915/dp: Replace intel_dp.dfp members with the new
crtc_state sink_format
      drm/i915/dp: Configure PCON for conversion of output_format to YCbCr4=
44
      drm/i915/display: Use sink_format instead of ycbcr420_output flag
      drm/i915/dp: Add helper to get sink_format
      drm/i915/dp: Rearrange check for illegal mode and comments in mode_va=
lid

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.162.0
      drm/amd/display: [FW Promotion] Release 0.0.163.0
      drm/amd/display: [FW Promotion] Release 0.0.165.0

Anup Sharma (1):
      gpu: drm: bridge: No need to set device_driver owner

Anusha Srivatsa (1):
      drm/i915/mtl: Pin assignment for TypeC

Aric Cyr (9):
      drm/amd/display: 3.2.231
      drm/amd/display: 3.2.232
      drm/amd/display: 3.2.233
      drm/amd/display: 3.2.234
      drm/amd/display: Promote DAL to 3.2.235
      drm/amd/display: 3.2.236
      drm/amd/display: 3.2.237
      drm/amd/display: Promote DAL to 3.2.238
      drm/amd/display: 3.2.239

Arnaud Vrac (3):
      drm/msm/dpu: use hsync/vsync polarity set by the encoder
      drm/msm/dpu: fix cursor block register bit offset in msm8998 hw catal=
og
      drm/msm/dpu: set max cursor width to 512x512

Arnd Bergmann (12):
      drm/amd/display: fix is_timing_changed() prototype
      drm/amd/display: dumb_abm_lcd: avoid missing-prototype warnings
      drm/nouveau: dispnv50: fix missing-prototypes warning
      drm/meson: venc: include linux/bitfield.h
      drm/amd/display: mark amdgpu_dm_connector_funcs_force static
      drm/amd/pm: mark irq functions as 'static'
      drm/amdkfd: mark local functions as static
      drm/amdgpu:mark aqua_vanjaram_reg_init.c function as static
      drm/amdgpu: use %pad format string for dma_addr_t
      drm/amdgpu: fix acpi build warnings
      drm/amd/display: avoid calling missing .resync_fifo_dccg_dio()
      drm/i915: make i915_drm_client_fdinfo() reference conditional again

Artem Grishin (1):
      drm/amd/display: Bug fix in dcn315_populate_dml_pipes_from_context

Arthur Grillo (5):
      drm/tests: Add test cases for drm_rect_intersect()
      drm/tests: Add test cases for drm_rect_calc_hscale()
      drm/tests: Add test cases for drm_rect_calc_vscale()
      drm/tests: Add test cases for drm_rect_rotate()
      drm/test: Add test cases for drm_rect_rotate_inv()

Artur Weber (4):
      dt-bindings: display: panel: Add Samsung S6D7AA0 LCD panel controller
      drm/panel: Add Samsung S6D7AA0 panel controller driver
      MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel controller drive=
r
      drm/panel: samsung-s6d7aa0: use pointer for drm_mode in panel desc st=
ruct

Arun R Murthy (3):
      drm/i915/display/dp: 128/132b LT requirement
      drm/i915: Support Async Flip on Linear buffers
      drm/i915/display: Print useful information on error

Arunpravin Paneer Selvam (1):
      Revert "drm/amdgpu: remove TOPDOWN flags when allocating VRAM in
large bar system"

Asad Kamal (2):
      drm/amd/pm: Update hw mon attributes for GC version 9.4.3
      drm/amd/pm: Expose mem temperature for GC version 9.4.3

Asad kamal (6):
      drm/amdgpu: Remove SMU powergate message call for SDMA
      drm/amdgpu: Enable CG for IH v4.4.2
      drm/amd/pm: Update pmfw header files for SMU v13.0.6
      drm/amd/pm: Update gfx clock frequency for SMU v13.0.6
      drm/amd/pm: Update pmfw header files for SMU v13.0.6
      drm/amd/pm: Add ih for SMU v13.0.6 thermal throttling

Ashutosh Dixit (7):
      drm/i915/hwmon: Get mutex and rpm ref just once in hwm_power_max_writ=
e
      drm/i915/guc: Disable PL1 power limit when loading GuC firmware
      drm/i915/hwmon: Block waiting for GuC reset to complete
      drm/i915/hwmon: Silence UBSAN uninitialized bool variable warning
      drm/i915/perf: Clear out entire reports after reading if not
power of 2 size
      drm/i915/pmu: Turn off the timer to sample frequencies when GT is par=
ked
      drm/i915/pmu: Make PMU sample array two-dimensional

Aurabindo Pillai (18):
      drm/amd/display: Fix hang when skipping modeset
      drm/amd/display: remove incorrect early return
      drm/amd/display: Fixes for dcn32_clk_mgr implementation
      drm/amd/display: Do not clear GPINT register when releasing DMUB
from reset
      drm/amd/display: Update bounding box values for DCN321
      drm/amd/display: Set DRAM clock if retraining is required
      drm/amd/display: Add check for PState change in DCN32
      drm/amd/display: Add extra check for 444 16 format
      drm/amd/display: Add FAMS capability to DCN31
      drm/amd/display: Add FAMS related definitions and documenation
for enum fields
      drm/amd/display: Program OTG vtotal min/max selectors unconditionally
      Revert "drm/amd/display: disable SubVP + DRR to prevent underflow"
      drm/amd/display: Fix artifacting on eDP panels when engaging
freesync video mode
      drm/amd/display: improve the message printed when loading DC
      Revert "drm/amd/display: Only use ODM2:1 policy for high pixel
rate displays"
      drm/amd/display: Program OTG vtotal min/max selectors
unconditionally for DCN1+
      drm/amd/display: Only use ODM2:1 policy for high pixel rate displays
      Revert "Revert drm/amd/display: Enable Freesync Video Mode by default=
"

Austin Zheng (3):
      drm/amd/display: Filter out AC mode frequencies on DC mode systems
      drm/amd/display: Add DP2 Metrics
      drm/amd/display: Limit Minimum FreeSync Refresh Rate

Azeem Shaikh (3):
      drm/bridge: dw-hdmi: Replace all non-returning strlcpy with strscpy
      dma-buf/sw_sync: Replace all non-returning strlcpy with strscpy
      drm/i915: Replace all non-returning strlcpy with strscpy

Bas Nieuwenhuizen (5):
      drm/amdgpu: Increase GFX6 graphics ring size.
      drm/amdgpu: Add a max ibs per submission limit.
      drm/amdgpu: Add support for querying the max ibs in a submission. (v3=
)
      drm/amdgpu/gfx10: Disable gfxoff before disabling powergating.
      drm/amdgpu: Validate VM ioctl flags.

Bhanuprakash Modem (1):
      drm/i915/debugfs: New debugfs for display clock frequencies

Biju Das (1):
      drm: Place Renesas drivers in a separate dir

Bjorn Andersson (5):
      drm/msm/dp: Clean up logs dp_power module
      drm/msm/dp: Clean up pdev/dev duplication in dp_power
      drm/msm/adreno: Add Adreno A690 support
      drm/msm/dp: Drop aux devices together with DP controller
      drm/msm/dp: Free resources after unregistering them

Bob Zhou (1):
      drm/amdxcp: fix Makefile to build amdxcp module

Brandon Pollack (1):
      Documentation: vkms: clarify devres managed reference cleanup

Brian Norris (2):
      drm/atomic: Allow vblank-enabled + self-refresh "disable"
      drm/rockchip: vop: Leave vblank enabled in self-refresh

Candice Li (4):
      drm/amdgpu: Drop pcie_bif ras check from fatal error handler
      drm/amd/pm: Align eccinfo table structure with smu v13_0_0 interface
      drm/amdgpu: Update total channel number for umc v8_10
      drm/amdgpu: Add channel_dis_num to ras init flags

Chaitanya Kumar Borah (2):
      drm/i915/color: Fix typo for Plane CSC indexes
      drm/i915/display: Set correct voltage level for 480MHz CDCLK

Charlene Liu (1):
      drm/amd/display: add NULL pointer check

Chia-I Wu (3):
      drm/amdgpu: add a missing lock for AMDGPU_SCHED
      amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
      drm/amdgpu: fix xclk freq on CHIP_STONEY

Chong Li (1):
      drm/amdgpu: add option params to enforce process isolation
between graphics and compute

Chris Morgan (3):
      dt-bindings: panel: Add Anbernic RG353V-V2 panel compatible
      drm/panel: st7703: Rename CMD_UNKNOWN_C6 to CMD_SETECO
      drm/panel: st7703: Add Anbernic RG353V-V2 Panel Support

Chris Wilson (1):
      drm/i915/gem: Use large rings for compute contexts

Christian K=C3=B6nig (13):
      drm/scheduler: properly forward fence errors
      drm/scheduler: add drm_sched_entity_error and use rcu for last_schedu=
led
      drm/amdgpu: add gfx shadow CS IOCTL support
      drm/amdgpu: add gfx11 emit shadow callback
      drm/scheduler: mark jobs without fence as canceled
      drm/amdgpu: make sure BOs are locked in amdgpu_vm_get_memory
      drm/amdgpu: make sure that BOs have a backing store
      drm/amdgpu: add amdgpu_error_* debugfs file
      drm/amdgpu: mark force completed fences with -ECANCELED
      drm/amdgpu: mark soft recovered fences with -ENODATA
      drm/amdgpu: abort submissions during prepare on error
      drm/amdgpu: reset VM when an error is detected
      drm/amdgpu: add VM generation token

Christoph Hellwig (2):
      drm/amdgpu: stop including swiotlb.h
      drm/radeon: stop including swiotlb.h

Christophe JAILLET (2):
      drm/amd/display: Fix a test CalculatePrefetchSchedule()
      drm/amd/display: Fix a test dml32_rq_dlg_get_rq_reg()

Clint Taylor (4):
      drm/i915/mtl: Initial DDI port setup
      drm/i915/mtl: Add MTL for remapping CCS FBs
      drm/i915: Add 16bit register/mask operators
      drm/i915/hdmi: C20 computed PLL frequencies

Colin Ian King (2):
      drm/amd/pm: Fix spelling mistake "aquire" -> "acquire"
      drm/amdgpu: Fix a couple of spelling mistakes in info and debug messa=
ges

Cong Liu (2):
      drm/i915: Fix memory leaks in i915 selftests
      drm/i915: Fix memory leaks in function live_nop_switch

Cong Yang (5):
      drm/panel: Modify innolux hj110iz panel initial code
      dt-bindings: display: panel: Add compatible for Starry himax83102-j02
      drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel
      dt-bindings: display: panel: Add compatible for Starry ili9882t
      drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel

Cruise Hung (3):
      drm/amd/display: Reset OUTBOX0 r/w pointer on DMUB reset
      drm/amd/display: Fix DMUB debugging print issue
      drm/amd/display: Update correct DCN314 register header

Dafna Hirschfeld (6):
      accel/habanalabs: add helper to extract the FW major/minor
      accel/habanalabs: rename fw_{major/minor}_version to
fw_inner_{major/minor}_ver
      accel/habanalabs: extract and save the FW's SW major/minor/sub-minor
      accel/habanalabs: check fw version using sw version
      accel/habanalabs: do soft-reset using cpucp packet
      accel/habanalabs: add missing tpc interrupt info

Dan Carpenter (13):
      drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
      drm/udl: delete dead code
      drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
      drm/msm/dpu: tidy up some error checking
      drm/i915/gsc: Fix error code in intel_gsc_uc_heci_cmd_submit_nonpriv(=
)
      accel/habanalabs: fix gaudi2_get_tpc_idle_status() return
      drm/amdgpu: unlock the correct lock in amdgpu_gfx_enable_kcq()
      drm/amdgpu: unlock on error in gfx_v9_4_3_kiq_resume()
      drm/amdgpu: release correct lock in amdgpu_gfx_enable_kgq()
      drm/amd/amdgpu: Fix up locking etc in amdgpu_debugfs_gprwave_ioctl()
      drm/amd/pm: Fix memory some memory corruption
      drm/amdkfd: potential error pointer dereference in ioctl
      drm/i915: Fix a NULL vs IS_ERR() bug

Dani Liberman (4):
      accel/habanalabs: use binning info when handling razwi
      accel/habanalabs: mask part of hmmu page fault captured address
      accel/habanalabs: add description to several info ioctls
      accel/habanalabs: refactor error info reset

Daniel Miess (7):
      drm/amd/display: limit timing for single dimm memory
      drm/amd/display: Fix possible underflow for displays with large vblan=
k
      drm/amd/display: Remove v_startup workaround for dcn3+
      drm/amd/display: Revert vblank change that causes null pointer crash
      drm/amd/display: Fix possible underflow for displays with large vblan=
k
      drm/amd/display: Enable dcn314 DPP RCO
      drm/amd/display: Re-enable DPP/HUBP Power Gating

Daniel Vetter (9):
      MAINTAINERS: add drm_bridge for drm bridge maintainers
      drm/gma500: Use drm_aperture_remove_conflicting_pci_framebuffers
      video/aperture: use generic code to figure out the vga default device
      drm/aperture: Remove primary argument
      video/aperture: Only kick vgacon when the pdev is decoding vga
      video/aperture: Move vga handling to pci function
      video/aperture: Drop primary argument
      video/aperture: Only remove sysfb on the default vga pci device
      fbdev: Simplify fb_is_primary_device for x86

Daniele Ceraolo Spurio (9):
      drm/i915/gsc: add initial support for GSC proxy
      drm/i915/gsc: add support for GSC proxy interrupt
      drm/i915/uc: perma-pin firmwares
      drm/i915/huc: Parse the GSC-enabled HuC binary
      drm/i915/huc: Load GSC-enabled HuC via DMA xfer if the fuse says so
      drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
      drm/i915/mtl/huc: auth HuC via GSC
      drm/i915/mtl/huc: Use the media gt for the HuC getparam
      drm/i915/huc: define HuC FW version for MTL

Daniil Dulov (1):
      drm/amdkfd: Fix potential deallocation of previously deallocated memo=
ry.

Danilo Krummrich (1):
      drm/scheduler: set entity to NULL in drm_sched_entity_pop_job()

Dario Binacchi (3):
      drm/panel: simple: fix active size for Ampire AM-480272H3TMQW-T01H
      dt-bindings: display: simple: add Rocktech RK043FN48H
      drm/panel: simple: add support for Rocktech RK043FN48H panel

Dave Airlie (17):
      Merge tag 'drm-misc-next-2023-05-11' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2023-05-24' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-gt-next-2023-05-24' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2023-06-01' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-next-20230529' of
git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into
drm-next
      Merge tag 'drm-habanalabs-next-2023-06-08' of
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into
drm-next
      Merge tag 'drm-misc-next-2023-06-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-06-05' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-gt-next-2023-06-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-6.5-2023-06-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-2023-06-10' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'mediatek-drm-next-6.5' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-misc-next-fixes-2023-06-15' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.5-2023-06-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Backmerge tag 'v6.4-rc7' of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into
drm-next
      Merge tag 'drm-msm-next-2023-06-18' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-intel-next-fixes-2023-06-21' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next

Dave Stevenson (7):
      drm/vc4: hdmi: Add Broadcast RGB property to allow override of RGB ra=
nge
      drm/vc4: hdmi: Rename full range helper
      drm/vc4: hdmi: Swap CSC matrix channels for YUV444
      drm/vc4: hdmi: Rework the CSC matrices organization
      drm/vc4: hdmi: Add a function to retrieve the CSC matrix
      drm/vc4: hdmi: Add BT.601 Support
      drm/vc4: hdmi: Add BT.2020 Support

David Belanger (1):
      drm/amdkfd: EOP Removal - Handle size 0 correctly

David Francis (1):
      drm/amdgpu/bu: add mtype_local as a module parameter

Dillon Varone (1):
      drm/amd/display: add support for low bpc

Dmitry Baryshkov (73):
      drm/panel: sharp-ls043t1le01: adjust mode settings
      drm/panel: sharp-ls043t1le01: drop dummy functions and data fields
      dt-bindings: display/msm/gmu: add Adreno 660 support
      drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
      drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
      drm/msm/dpu: enable DSPP and DSC on sc8180x
      drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0
      drm/msm/dpu: simplify intf allocation code
      drm/i915/dsc: change DSC param tables to follow the DSC model
      drm/i915/dsc: move rc_buf_thresh values to common helper
      drm/i915/dsc: move DSC tables to DRM DSC helper
      drm/i915/dsc: stop using interim structure for calculated params
      drm/display/dsc: use flat array for rc_parameters lookup
      drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
      drm/display/dsc: include the rest of pre-SCR parameters
      drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters
      drm/msm/dsi: don't allow enabling 14nm VCO with unprogrammed rate
      drm/msm/dpu: add HDMI output support
      drm/msm/dpu: drop the regdma configuration
      drm/msm/dpu: stop mapping the regdma region
      drm/msm/dpu: drop unused SSPP sub-block information
      drm/msm/dpu: drop SSPP's SRC subblock
      drm/msm/dpu: access QSEED registers directly
      drm/msm/dpu: access CSC/CSC10 registers directly
      drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
      drm/msm/dpu: remove futile checks from dpu_rm_init()
      drm/msm/dpu: use PINGPONG_NONE for LMs with no PP attached
      drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()
      dt-bindings: display: hdmi-connector: add hdmi-pwr supply
      drm/bridge: display-connector: rename dp_pwr to connector_pwr
      drm/bridge: display-connector: handle hdmi-pwr supply
      drm/msm/dpu: fix SSPP register definitions
      drm/msm/dpu: simplify CDP programming
      drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
      drm/msm/dpu: rearrange QoS setting code
      drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
      drm/msm/dpu: simplify qos_ctrl handling
      drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
      drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
      drm/msm/dpu: use common helper for WB and SSPP QoS setup
      drm/msm/dsi: remove extra call to dsi_get_pclk_rate()
      drm/msm/dsi: use mult_frac for pclk_bpp calculation
      drm/msm/dpu: drop dpu_encoder_phys_ops::late_register()
      drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
      drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
      drm/msm/dpu: separate common function to init physical encoder
      drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
      drm/msm/dpu: inline dpu_encoder_get_wb()
      drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
      drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
      drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
      drm/msm/dp: remove most of usbpd-related remains
      drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
      drm/msm/dpu: use PINGPONG_NONE to unbind WB from PP
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi' and 'msm-next-lumag-mdp5'
into msm-next-lumag
      drm/msm/adreno: fix sparse warnings in a6xx code
      drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
      drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA with coherent=
 SMMU
      drm/msm/a5xx: really check for A510 in a5xx_gpu_init
      drm/msm/adreno: warn if chip revn is verified before being set
      drm/msm/adreno: change adreno_is_* functions to accept const argument
      Merge branch 'drm-next' of git://anongit.freedesktop.org/drm/drm
into msm-next-lumag-base
      drm/msm/adreno: make adreno_is_a690()'s argument const
      drm/msm/dpu: do not enable color-management if DSPPs are not availabl=
e
      drm/msm/dpu/catalog: define DSPP blocks found on sdm845
      drm/display/dsc: add helper to set semi-const parameters
      drm/msm/dsi: use DRM DSC helpers for DSC setup
      drm/msm: provide fb_dirty implemenation
      drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
      drm/msm/dpu: correct MERGE_3D length
      drm/msm/dpu: remove unused INTF_NONE interfaces
      drm/msm/dsi: dsi_host: drop unused clocks
      drm/msm/dsi: split dsi_ctrl_config() function

Dmitry Osipenko (2):
      drm/virtio: Refactor and optimize job submission code path
      drm/virtio: Wait for each dma-fence of in-fence array individually

Dmytro Laktyushkin (10):
      drm/amd/display: update max streams per surface
      drm/amd/display: add extra dc odm debug options
      drm/amd/display: set dcn315 lb bpp to 48
      drm/amd/display: Limit nv21 dst_y
      drm/amd/display: add pixel rate based CRB allocation support
      drm/amd/display: disable dcn315 pixel rate crb when scaling
      drm/amd/display: fix dcn315 pixel rate crb scaling check
      drm/amd/display: fix seamless odm transitions
      drm/amd/display: fix dcn315 single stream crb allocation
      drm/amd/display: fix pixel rate update sequence

Douglas Anderson (2):
      drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset
      drm/msm/dsi: More properly handle errors in regards to
dsi_mgr_bridge_power_on()

Emily Deng (1):
      drm/amdgpu/mmsch: Correct the definition for mmsch init header

Eric Yang (1):
      drm/amd/display: add mechanism to skip DCN init

Evan Quan (7):
      drm/amd/pm: fix possible power mode mismatch between driver and PMFW
      drm/amd/pm: add missing NotifyPowerSource message mapping for SMU13.0=
.7
      drm/amd/pm: conditionally disable pcie lane switching for some
sienna_cichlid SKUs
      drm/amd/pm: update SMU13 header files for coming OD support
      drm/amd/pm: fulfill SMU13 OD settings init and restore
      drm/amd/pm: fulfill the OD support for SMU13.0.0
      drm/amd/pm: fulfill the OD support for SMU13.0.7

Fabio Estevam (4):
      dt-bindings: display: bridge: ldb: Add an i.MX6SX entry
      drm/bridge: fsl-ldb: Add i.MX6SX support
      dt-bindings: samsung,mipi-dsim: Add 'lane-polarities'
      dt-bindings: samsung,mipi-dsim: Use port-base reference

Fangzhi Zuo (2):
      drm/amd/display: Have Payload Properly Created After Resume
      drm/amd/display: Add Error Code for Dml Validation Failure

Fei Yang (9):
      drm/i915/mtl: Set has_llc=3D0
      drm/i915/mtl: Set has_llc=3D0
      drm/i915/mtl: fix mocs selftest
      drm/i915/mtl: Add PTE encode function
      drm/i915/mtl: workaround coherency issue for Media
      drm/i915: preparation for using PAT index
      drm/i915: use pat_index instead of cache_level
      drm/i915/mtl: end support for set caching ioctl
      drm/i915: Allow user to set cache at BO creation

Felix Kuehling (4):
      drm/amdkfd: Don't trigger evictions unmapping dmabuf attachments
      drm/amdgpu: Allocate GART table in RAM for AMD APU
      drm/amdgpu: Fix per-BO MTYPE selection for GFXv9.4.3
      drm/amdgpu: Override MTYPE per page on GFXv9.4.3 APUs

Francesco Dolcini (11):
      drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation
      drm/bridge: tc358768: always enable HS video mode
      drm/bridge: tc358768: fix PLL parameters computation
      drm/bridge: tc358768: fix PLL target frequency
      drm/bridge: tc358768: fix TCLK_ZEROCNT computation
      drm/bridge: tc358768: fix TCLK_TRAILCNT computation
      drm/bridge: tc358768: fix THS_ZEROCNT computation
      drm/bridge: tc358768: fix TXTAGOCNT computation
      drm/bridge: tc358768: fix THS_TRAILCNT computation
      drm/bridge: tc358768: remove unused variable
      drm/bridge: tc358768: remove unneeded semicolon

Frieder Schrempf (2):
      drm: bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec
      drm/bridge: ti-sn65dsi83: Fix enable/disable flow to meet spec

GONG, Ruiqi (1):
      drm/amd/display: fix compilation error due to shifting negative value

Gabe Teeger (1):
      drm/amd/display: update extended blank for dcn314 onwards

Gavin Wan (4):
      drm/amdgpu: Add PSP supporting PSP 13.0.6 SRIOV ucode init.
      drm/amdgpu: Skip using MC FB Offset when APU flag is set for SRIOV.
      drm/amdgpu: Set memory partitions to 1 for SRIOV.
      drm/amdgpu: Checked if the pointer NULL before use it.

Geert Uytterhoeven (7):
      drm: shmobile: Use %p4cc to print fourcc codes
      drm: shmobile: Add support for DRM_FORMAT_XRGB8888
      drm: shmobile: Switch to drm_crtc_init_with_planes()
      drm: shmobile: Add missing call to drm_fbdev_generic_setup()
      drm: shmobile: Make DRM_SHMOBILE visible on Renesas SoC platforms
      dt-bindings: display: panel-simple: Add Ampire AM-800480L1TMQW-T00H
      drm/panel: simple: Add Ampire AM-800480L1TMQW-T00H

George Shen (1):
      drm/amd/display: Add w/a to disable DP dual mode on certain ports

Graham Sider (5):
      drm/amdgpu: Correct dGPU MTYPE settings for gfx943
      drm/amdgpu: Use legacy TLB flush for gfx943
      drm/amdgpu/bu: Add use_mtype_cc_wa module param
      drm/amdgpu/bu: update mtype_local parameter settings
      drm/amdkfd: Add new gfx_target_versions for GC 9.4.3

Guchun Chen (14):
      drm/amdgpu: fix a build warning by a typo in amdgpu_gfx.c
      drm/amdgpu: check correct allocated mqd_backup object after alloc
      drm/amdgpu: mark gfx_v9_4_3_disable_gpa_mode() static
      drm/amdgpu: drop redundant sched job cleanup when cs is aborted
      drm/amd/pm: parse pp_handle under appropriate conditions
      drm/amdgpu: disable sdma ecc irq only when sdma RAS is enabled in sus=
pend
      drm/amd/pm: avoid potential UBSAN issue on legacy asics
      drm/amdgpu/gfx: disable gfx9 cp_ecc_error_irq only when enabling
legacy gfx ras
      drm/amdgpu: skip disabling fence driver src_irqs when device is unplu=
gged
      drm/amd/pm: resolve reboot exception for si oland
      drm/amdgpu/sdma: set sched.ready status after ring/IB test in sdma
      drm/amdgpu/gfx: set sched.ready status after ring/IB test in gfx
      drm/amdgpu: switch to unified amdgpu_ring_test_helper
      drm/amdgpu: keep irq count in amdgpu_irq_disable_all

Guilherme G. Piccoli (1):
      drm/amdgpu/gfx11: Adjust gfxoff before powergating on gfx11 as well

Gustavo A. R. Silva (1):
      drm/amdgpu/discovery: Replace fake flex-arrays with flexible-array me=
mbers

Gustavo Sousa (1):
      drm/i915/mtl: Define mask for DDI AUX interrupts

Hamza Mahfooz (9):
      drm/amd/display: fix flickering caused by S/G mode
      drm/amdgpu: fix an amdgpu_irq_put() issue in gmc_v9_0_hw_fini()
      drm/amd/display: drop redundant memset() in get_available_dsc_slices(=
)
      drm/amd/display: drop unused function set_abm_event()
      drm/amd/display: drop unused count variable in create_eml_sink()
      drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR
      drm/amd/display: mark dml31's UseMinimumDCFCLK() as noinline_for_stac=
k
      drm/amd/display: mark dml314's UseMinimumDCFCLK() as noinline_for_sta=
ck
      drm/amd/amdgpu: enable W=3D1 for amdgpu

Hans de Goede (1):
      drm/i915/dsi: Use unconditional msleep() instead of intel_dsi_msleep(=
)

Haridhar Kalvala (1):
      drm/i915/mtl: WA to clear RDOP clock gating

Harish Kasiviswanathan (2):
      drm/amd: fix compiler error to support older compilers
      drm/amdgpu: For GFX 9.4.3 APU fix vram_usage value

Harry Wentland (10):
      drm/connector: Convert DRM_MODE_COLORIMETRY to enum
      drm/connector: Pull out common create_colorspace_property code
      drm/connector: Use common colorspace_names array
      drm/connector: Print connector colorspace in state debugfs
      drm/connector: Allow drivers to pass list of supported colorspaces
      drm/amd/display: Always pass connector_state to stream validation
      drm/amd/display: Register Colorspace property for DP and HDMI
      drm/amd/display: Signal mode_changed if colorspace changed
      drm/amd/display: Send correct DP colorspace infopacket
      drm/amd/display: Add debugfs for testing output colorspace

Harshit Mogalapalli (3):
      drm/amd/display: Fix possible NULL dereference in
dc_dmub_srv_cmd_run_list()
      drm/amdgpu: Fix unsigned comparison with zero in
gmc_v9_0_process_interrupt()
      drm/i915/huc: Fix missing error code in intel_huc_init()

Hawking Zhang (33):
      drm/amdgpu: introduce vmhub definition for multi-partition cases (v3)
      drm/amdgpu: add vcn v4_0_3 ip headers
      drm/amdgpu: support gc v9_4_3 ring_test running on all xcc
      drm/amdgpu: add new vram type for dgpu
      drm/amdgpu: init gfx_v9_4_3 external_rev_id
      drm/amdgpu: retire render backend setup from gfx_v9_4_3
      drm/amdgpu: add smuio v13_0_3 ip headers
      drm/amdgpu: init smuio funcs for smuio v13_0_3
      drm/amdgpu: Add common helper to query ras error (v2)
      drm/amdgpu: Add common helper to reset ras error
      drm/amdgpu: Add sdma v4_4_2 ras registers
      drm/amdgpu: Add query_ras_error_count for sdma v4_4_2
      drm/amdgpu: Add reset_ras_error_count for sdma v4_4_2
      drm/amdgpu: Initialize sdma v4_4_2 ras function
      drm/amdgpu: Add mmhub v1_8_0 ras err status registers
      drm/amdgpu: Add query_ras_error_count for mmhub v1_8
      drm/amdgpu: Add reset_ras_error_count for mmhub v1_8
      drm/amdgpu: Add query_ras_error_status for mmhub v1_8
      drm/amdgpu: Add reset_ras_error_status for mmhub v1_8
      drm/amdgpu: Initialize mmhub v1_8 ras function
      drm/amdgpu: Enable persistent edc harvesting in APP APU
      drm/amdgpu: Add vcn/jpeg ras err status registers
      drm/amdgpu: Add query_ras_error_count for vcn v4_0_3
      drm/amdgpu: Add reset_ras_error_count for vcn v4_0_3
      drm/amdgpu: Initialize vcn v4_0_3 ras function
      drm/amdgpu: Re-enable VCN RAS if DPG is enabled
      drm/amdgpu: Add query_ras_error_count for jpeg v4_0_3
      drm/amdgpu: Add reset_ras_error_count for jpeg v4_0_3
      drm/amdgpu: Initialize jpeg v4_0_3 ras function
      drm/amdgpu: Adjust the sequence to query ras error info
      drm/amdkfd: Fix null ptr access
      drm/amdgpu: Do not access members of xcp w/o check (v2)
      drm/amdgpu: Add gc v9_4_3 ras error status registers

Hersen Wu (7):
      drm/amd/display: fix memleak in aconnector->timing_requested
      drm/amd/display: fix access hdcp_workqueue assert
      drm/amd/display: Return error code on DSC atomic check failure
      drm/amd/display: assign edid_blob_ptr with edid from debugfs
      drm/amd/display: lower dp link training message level
      drm/amd/display: edp do not add non-edid timings
      drm/amd/display: add debugfs for allow_edp_hotplug_detection

Horace Chen (1):
      drm/amdgpu: disable SDMA WPTR_POLL_ENABLE for SR-IOV

Horatio Zhang (10):
      drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v11_0_hw_fini
      drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v10_0_hw_fini
      drm/amdgpu: drop gfx_v11_0_cp_ecc_error_irq_funcs
      drm/amdgpu: separate ras irq from vcn instance irq for UVD_POISON
      drm/amdgpu: add RAS POISON interrupt funcs for vcn_v2_6
      drm/amdgpu: add RAS POISON interrupt funcs for vcn_v4_0
      drm/amdgpu: separate ras irq from jpeg instance irq for UVD_POISON
      drm/amdgpu: add RAS POISON interrupt funcs for jpeg_v2_6
      drm/amdgpu: add RAS POISON interrupt funcs for jpeg_v4_0
      drm/amdgpu: fix Null pointer dereference error in
amdgpu_device_recover_vram

Huacai Chen (2):
      drivers/firmware: Move sysfb_init() from device_initcall to
subsys_initcall_sync
      drm/amdgpu/display: Enable DC_FP for LoongArch

Igor Kravchenko (1):
      drm/amd/display: Set min_width and min_height capability for DCN30

Ikshwaku Chauhan (1):
      drm/amdgpu: enable tmz by default for GC 11.0.1

Ilya Bakoulin (1):
      drm/amd/display: Workaround wrong HDR colorimetry with some receivers

Imre Deak (17):
      drm/i915/dp_mst: Fix active port PLL selection for secondary MST stre=
ams
      drm/i915/adlp+: Disable DC5/6 states for TC port DDI/AUX and for
combo port AUX
      drm/i915/mtl: TypeC HPD live status query
      drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration
      drm/i915: Add helpers to reference/unreference a DPLL for a CRTC
      drm/i915: Make the CRTC state consistent during sanitize-disabling
      drm/i915: Update connector atomic state before crtc sanitize-disablin=
g
      drm/i915: Separate intel_crtc_disable_noatomic_begin/complete()
      drm/i915: Factor out set_encoder_for_connector()
      drm/i915: Add support for disabling any CRTCs during HW
readout/sanitization
      drm/i915/dp: Add link training debug and error printing helpers
      drm/i915/dp: Convert link training error to debug message on
disconnected sink
      drm/i915/dp: Prevent link training fallback on disconnected port
      drm/i915/dp: Factor out intel_dp_get_active_pipes()
      drm/i915: Factor out a helper for handling atomic modeset locks/state
      drm/i915/tc: Call TypeC port flush_work/cleanup without modeset locks=
 held
      drm/i915/tc: Reset TypeC PHYs left enabled in DP-alt mode after
the sink disconnects

Iswara Nagulendran (1):
      drm/amd/display: Adding support for VESA SCR

Jack Xiao (2):
      drm/amdgpu: fix memory leak in mes self test
      drm/amdgpu: fix S3 issue if MQD in VRAM

James Zhu (55):
      drm/amdgpu/: add more macro to support offset variant
      drm/amdgpu: add VCN4_0_3 firmware
      drm/amdgpu/jpeg: add jpeg support for VCN4_0_3
      drm/amdgpu/vcn: add vcn support for VCN4_0_3
      drm/amdgpu/jpeg: enable jpeg cg for VCN4_0_3
      drm/amdgpu/jpeg: enable jpeg pg for VCN4_0_3
      drm/amdgpu/vcn: enable vcn cg for VCN4_0_3
      drm/amdgpu/vcn: enable vcn pg for VCN4_0_3
      drm/amdgpu/vcn: enable vcn DPG mode for VCN4_0_3
      drm/amdgpu/jpeg: add multiple jpeg rings support
      drm/amdgpu/jpeg: add multiple jpeg rings support for vcn4_0_3
      drm/amdgpu/nbio: update vcn doorbell range
      drm/amdgpu/vcn: enable vcn doorbell for vcn4.0.3
      drm/amdgpu/jpeg: enable jpeg doorbell for jpeg4.0.3
      drm/amdgpu: fix vcn doorbell range setting
      drm/amdgpu/vcn: use vcn4 irqsrc header for VCN 4.0.3
      drm/amdgpu/vcn: update vcn header to support multiple AIDs
      drm/amdgpu/jpeg: update jpeg header to support multiple AIDs
      drm/amdgpu/vcn: update new doorbell map
      drm/amdgpu/vcn: update ucode setup
      drm/amdgpu/vcn: remove unused code
      drm/amdgpu/vcn: update amdgpu_fw_shared to amdgpu_vcn4_fw_shared
      drm/amdgpu/nbio: add vcn doorbell multiple AIDs support
      drm/amdgpu/jpeg: add JPEG multiple AIDs support
      drm/amdgpu/vcn: update clock gate setting for VCN 4.0.3
      drm/amdgpu/vcn: add vcn multiple AIDs support
      drm/amdgpu: increase MAX setting to hold more jpeg instances
      drm/amdgpu: add fwlog support on vcn_v4_0_3
      drm/amdgpu: add unified queue support on vcn_v4_0_3
      drm/amdgpu: enable indirect_sram mode on vcn_v4_0_3
      drm/amdgpu: enable vcn/jpeg on vcn_v4_0_3
      drm/amdgpu: vcn_v4_0_3 load vcn fw once for all AIDs
      drm/amdgpu: increase AMDGPU_MAX_HWIP_RINGS
      drm/amdgpu: add num_xcps return
      drm/amdgpu/vcn: use dummy register selects AID for VCN_RAM ucode
      drm/amdgpu: use physical AID index for ring name
      drm/amdgpu: support partition drm devices
      drm/amdgpu: find partition ID when open device
      drm/amdgpu: add partition ID track in ring
      drm/amdgpu: update header to support partition scheduling
      drm/amdgpu: add partition scheduler list update
      drm/amdgpu: keep amdgpu_ctx_mgr in ctx structure
      drm/amdgpu: add partition schedule for GC(9, 4, 3)
      drm/amdgpu: run partition schedule if it is supported
      drm/amdgpu: update ref_cnt before ctx free
      drm/amdgpu: use xcp partition ID for amdgpu_gem
      drm/jpeg: add init value for num_jpeg_rings
      drm/amdgpu: save/restore part of xcp drm_device fields
      drm/amdxcp: add platform device driver for amdxcp
      drm/amdgpu: use amdxcp platform device as spatial partition
      drm/amdkfd: add event age tracking
      drm/amdkfd: add event_age tracking when receiving interrupt
      drm/amdkfd: set activated flag true when event age unmatchs
      drm/amdkfd: update user space last_event_age
      drm/amdkfd: bump kfd ioctl minor version for event age availability

Jani Nikula (92):
      drm/i915/display: remove unnecessary i915_debugfs.h includes
      drm/i915: hide mkwrite_device_info() better
      drm/i915/display: remove intel_display_commit_duplicated_state()
      drm/i915/display: start high level display driver file
      drm/i915/display: move intel_modeset_probe_defer() to
intel_display_driver.[ch]
      drm/i915/display: rename intel_modeset_probe_defer() ->
intel_display_driver_probe_defer()
      drm/i915/display: move modeset probe/remove functions to
intel_display_driver.c
      drm/i915/display: rename intel_display_driver_* functions
      drm/i915/display: add intel_display_reset.[ch]
      drm/i915/display: move display suspend/resume to intel_display_driver=
.[ch]
      drm/i915/display: rename intel_display_driver_suspend/resume function=
s
      drm/i915/display: add intel_display_driver_early_probe()
      drm/i915/pps: use intel_de_rmw() for panel unlock
      drm/i915: use explicit includes for i915_reg.h and i915_irq.h
      drm/i915/wm: remove stale and unused ilk_wm_max_level() declaration
      drm/i915/display: split out load detect to a separate file
      drm/i915/display: throw out struct intel_load_detect_pipe
      drm/i915/rc6: throw out set() wrapper
      drm/sti/sti_hdmi: convert to using is_hdmi from display info
      drm/rockchip: cdn-dp: call drm_connector_update_edid_property()
unconditionally
      drm/i915/gvt: fix intel_vgpu_alloc_resource() kernel-doc parameter
      drm/i915/vma: fix kernel-doc function name for i915_vma_size()
      drm/i915/utils: drop kernel-doc from __wait_for()
      drm/i915/vma: document struct i915_vma_resource wakeref member
      drm/i915/perf: fix i915_perf_ioctl_version() kernel-doc
      drm/i915/error: fix i915_capture_error_state() kernel-doc
      drm/i915/request: drop kernel-doc
      drm/i915/gem: fix i915_gem_object_lookup_rcu() kernel-doc parameter n=
ame
      drm/i915/engine: fix kernel-doc function name for
intel_engine_cleanup_common()
      drm/i915/context: fix kernel-doc parameter descriptions
      drm/i915/gtt: fix i915_vm_resv_put() kernel-doc parameter name
      drm/i915/engine: hide preempt_hang selftest member from kernel-doc
      drm/i915/guc: add dbgfs_node member kernel-doc
      drm/i915/guc: drop lots of kernel-doc markers
      drm/i915/guc: add intel_guc_state_capture member docs for
ads_null_cache and max_mmio_per_node
      drm/i915/active: fix kernel-doc for function parameters
      drm/i915/pmu: drop kernel-doc
      drm/i915/pxp: fix kernel-doc for member dev_link
      drm/i915/scatterlist: fix kernel-doc parameter documentation
      drm/i915/vma: fix struct i915_vma_bindinfo kernel-doc
      drm/i915/gem: fix function pointer member kernel-doc
      drm/i915/scatterlist: fix kernel-doc
      drm/i915/ttm: fix i915_ttm_to_gem() kernel-doc
      drm/i915: use kernel-doc -Werror when CONFIG_DRM_I915_WERROR=3Dy
      drm/connector: document enum drm_connector_tv_mode DRM_MODE_TV_MODE_M=
AX
      drm/i915: taint kernel when force probing unsupported devices
      drm/i915/hdcp: drop display/ prefix from include
      drm/i915/irq: relocate gmbus and dp aux irq handlers
      drm/i915/gt: drop dependency on VLV_DISPLAY_BASE
      drm/i915/bios: add helper for reading SPI
      drm/i915/dpll: drop a useless I915_STATE_WARN_ON()
      drm/i915/crtc: replace I915_STATE_WARN_ON() with I915_STATE_WARN()
      drm/i915/display: remove I915_STATE_WARN_ON()
      drm/i915/display: add i915 parameter to I915_STATE_WARN()
      drm/i915/irq: convert gen8_de_irq_handler() to void
      drm/i915/irq: split out hotplug irq handling
      drm/i915/irq: split out display irq handling
      drm/i915: fix intel_display_irq.c include order
      drm/ttm: let struct ttm_device_funcs be placed in rodata
      drm/i915: tweak language in fastset pipe config compare logging
      drm/i915/gsc: use system include style for drm headers
      Merge drm/drm-next into drm-intel-next
      drm/i915: use localized __diag_ignore_all() instead of per file
      drm/edid: parse display info has_audio similar to is_hdmi
      drm/display/dp_mst: drop has_audio from struct drm_dp_mst_port
      drm/i915/dp: stop caching has_audio in struct intel_dp
      drm/i915/dp: stop caching has_hdmi_sink in struct intel_dp
      drm/i915/hdmi: stop caching has_audio in struct intel_hdmi
      drm/i915/hdmi: stop caching has_hdmi_sink in struct intel_hdmi
      drm/i915/sdvo: stop caching has_hdmi_monitor in struct intel_sdvo
      drm/i915/sdvo: stop caching has_hdmi_audio in struct intel_sdvo
      drm/edid: add drm_edid_read_switcheroo()
      drm/i915/lvds: switch to drm_edid_read_switcheroo()
      drm/edid: make drm_edid_duplicate() safe to call with NULL parameter
      drm/display/dp_mst: convert to struct drm_edid
      drm/i915/display: switch the rest of the connectors to struct drm_edi=
d
      drm/i915/debugfs: stop using edid_blob_ptr
      drm/i915/plane: warn on non-zero plane offset
      drm/i915/ddi: drop unused but set variable intel_dp
      drm/i915/dsi: drop unused but set variable data
      drm/i915/dsi: drop unused but set variable vbp
      drm/i915/dpll: drop unused but set variables bestn and bestm1
      drm/i915/fb: drop unused but set variable cpp
      drm/i915/irq: drop unused but set variable tmp
      drm/i915/gt/uc: drop unused but set variable sseu
      drm/i915/gem: drop unused but set variable unpinned
      drm/i915/gem: annotate maybe unused but set variable c
      drm/i915/selftest: annotate maybe unused but set variable unused
      drm/i915: annotate maybe unused but set intel_plane_state variables
      drm/i915: annotate maybe unused but set intel_crtc_state variables
      drm/i915: re-enable -Wunused-but-set-variable
      Merge drm/drm-next into drm-intel-next

Jasdeep Dhillon (1):
      drm/amd/display: Isolate remaining FPU code in DCN32

Javier Martinez Canillas (1):
      drm/ssd130x: Fix include guard name

Jay Cornwall (1):
      drm/amdkfd: add debug trap enabled flag to tma

Jeffrey Hugo (1):
      MAINTAINERS: Add Carl/Pranjal as QAIC reviewers

Jesse Zhang (2):
      drm/amdgpu: Differentiate between Raven2 and Raven/Picasso
according to revision id
      drm/amdgpu: don't enable secure display on incompatible platforms

Jessica Zhang (12):
      drm/display/dsc: Add flatness and initial scale value calculations
      drm/display/dsc: Add drm_dsc_get_bpp_int helper
      drm/msm: Add MSM-specific DSC helper methods
      drm/msm/dpu: Use fixed DRM DSC helper for det_thresh_flatness
      drm/msm/dpu: Fix slice_last_group_size calculation
      drm/msm/dsi: Use MSM and DRM DSC helper methods
      drm/msm/dsi: update hdisplay calculation for dsi_timing_setup
      msm/drm/dsi: Round up DSC hdisplay calculation
      drm/msm/dsi: Reduce pclk rate for compression
      drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag for DPU >=3D 7.0
      drm/msm/dpu: Set DATA_COMPRESS on command mode for DCE/DSC 1.2
      drm/msm/dsi: Remove incorrect references to slice_count

Jiadong Zhu (4):
      drm/amdgpu: Reset CP_VMID_PREEMPT after trailing fence signaled
      drm/amdgpu: Program gds backup address as zero if no gds allocated
      drm/amdgpu: Modify indirect buffer packages for resubmission
      drm/amdgpu: Implement gfx9 patch functions for resubmission

Jiapeng Chong (9):
      drm/amdgpu: remove unneeded semicolon
      drm/amdgpu: Remove the unused variable golden_settings_gc_9_4_3
      drm/amd/display: Simplify the calculation of variables
      drm/amdgpu: Remove duplicate include
      drm/amdgpu: Modify mismatched function name
      drm/amdgpu/vcn: Modify mismatched function name
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting

JinZe.Xu (1):
      drm/amd/display: Restore rptr/wptr for DMCUB as workaround

Jingwen Zhu (1):
      drm/amd/display: Improvement for handling edp link training fails

John Harrison (17):
      drm/i915/guc: Actually return an error if GuC version range check fai=
ls
      drm/i915/guc: Don't capture Gen8 regs on Xe devices
      drm/i915/guc: Consolidate duplicated capture list code
      drm/i915/guc: Capture list naming clean up
      drm/i915/guc: Fix error capture for virtual engines
      drm/i915/uc: Track patch level versions on reduced version firmware f=
iles
      drm/i915/mtl: Define GuC firmware version for MTL
      drm/i915/guc: Decode another GuC load failure case
      drm/i915/guc: Print status register when waiting for GuC to load
      drm/i915/uc: Enhancements to firmware table validation
      drm/i915/uc: Reject duplicate entries in firmware table
      drm/i915/uc: Make unexpected firmware versions an error in debug buil=
ds
      drm/i1915/guc: Fix probe injection CI failures after recent change
      drm/i915/guc: Fix confused register capture list creation
      drm/i915: Dump error capture to kernel log
      drm/i915/guc: Dump error capture to dmesg on CTB error
      drm/i915/guc: Remove some obsolete definitions

Jonatas Esteves (1):
      drm/amd/pm: Fix output of pp_od_clk_voltage

Jonathan Cavitt (2):
      drm/i915: Migrate platform-dependent mock hugepage selftests to live
      drm/i915: Use correct huge page manager for MTL

Jonathan Kim (40):
      drm/amdkfd: add gpu compute cores io links for gfx9.4.3
      drm/amdgpu: reflect psp xgmi topology info for gfx9.4.3
      drm/amdkfd: bind cpu and hiveless gpu to a hive if xgmi connected
      drm/amdkfd: add debug and runtime enable interface
      drm/amdkfd: display debug capabilities
      drm/amdkfd: prepare per-process debug enable and disable
      drm/amdgpu: add kgd hw debug mode setting interface
      drm/amdgpu: setup hw debug registers on driver initialization
      drm/amdgpu: add gfx9 hw debug mode enable and disable calls
      drm/amdgpu: add gfx9.4.1 hw debug mode enable and disable calls
      drm/amdkfd: fix kfd_suspend_all_processes
      drm/amdgpu: add gfx10 hw debug mode enable and disable calls
      drm/amdgpu: add gfx9.4.2 hw debug mode enable and disable calls
      drm/amdgpu: add gfx11 hw debug mode enable and disable calls
      drm/amdgpu: add configurable grace period for unmap queues
      drm/amdkfd: prepare map process for single process debug devices
      drm/amdgpu: prepare map process for multi-process debug devices
      drm/amdgpu: expose debug api for mes
      drm/amdkfd: add per process hw trap enable and disable functions
      drm/amdkfd: apply trap workaround for gfx11
      drm/amdkfd: add raise exception event function
      drm/amdkfd: add send exception operation
      drm/amdkfd: add runtime enable operation
      drm/amdkfd: update process interrupt handling for debug events
      drm/amdkfd: add debug set exceptions enabled operation
      drm/amdkfd: add debug wave launch override operation
      drm/amdkfd: add debug wave launch mode operation
      drm/amdkfd: add debug suspend and resume process queues operation
      drm/amdkfd: add debug set and clear address watch points operation
      drm/amdkfd: add debug set flags operation
      drm/amdkfd: add debug query event operation
      drm/amdkfd: add debug query exception info operation
      drm/amdkfd: add debug queue snapshot operation
      drm/amdkfd: add debug device snapshot operation
      drm/amdkfd: bump kfd ioctl  minor version for debug api availability
      drm/amdgpu: fix debug wait on idle for gfx9.4.1
      drm/amdkfd: fix vmfault signalling with additional data.
      drm/amdkfd: fix and enable debugging for gfx11
      drm/amdkfd: fix null queue check on debug setting exceptions
      drm/amdkfd: decrement queue count on mes queue destroy

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Joshua Ashton (3):
      drm/connector: Add enum documentation to drm_colorspace
      drm/amd/display: Always set crtcinfo from create_stream_for_sink
      drm/amd/display: Refactor avi_info_frame colorimetry determination

Josip Pavic (5):
      drm/amd/display: copy dmub caps to dc on dcn31
      drm/amd/display: refactor dmub commands into single function
      drm/amd/display: drain dmub inbox if queue is full
      drm/amd/display: add option to use custom backlight caps
      drm/amd/display: cache trace buffer size

Jos=C3=A9 Roberto de Souza (2):
      drm/i915/mtl/display: Implement DisplayPort sequences
      drm/i915: Initialize dkl_phy spin lock from display code path

Jouni H=C3=B6gander (1):
      drm/i915: Use 18 fast wake AUX sync len

Juha-Pekka Heikkila (2):
      drm/fourcc: define Intel Meteorlake related ccs modifiers
      drm/i915/mtl: Add handling for MTL ccs modifiers

Kenneth Feng (2):
      drm/amd/pm: update smu-driver if header for smu 13.0.0 and smu 13.0.1=
0
      drm/amd/pm: workaround for compute workload type on some skus

Khaled Almahallawy (1):
      drm/i915/dp: Fix log level for "CDS interlane align done"

Koby Elbaz (8):
      accel/habanalabs: remove commented code that won't be used
      accel/habanalabs: minimize encapsulation signal mutex lock time
      accel/habanalabs: refactor abort of completions and waits
      accel/habanalabs: poll for device status update following WFE cmd
      accel/habanalabs: fix a static warning - 'dubious: x & !y'
      accel/habanalabs: rename security functions related arguments
      accel/habanalabs: upon DMA errors, use FW-extracted error cause
      accel/habanalabs: update state when loading boot fit

Konrad Dybcio (36):
      dt-bindings: display: panel: nt36523: Add Lenovo J606F panel
      drm/panel: nt36523: Add DCS backlight support
      drm/panel: nt36523: Get orientation from OF
      drm/panel: nt36523: Add Lenovo J606F panel
      dt-bindings: display: msm: sm8350-mdss: Fix DSI compatible
      drm/msm/dpu: Move dpu_hw_{tear_check, pp_vsync_info} to dpu_hw_mdss.h
      drm/msm/dpu: Set DPU_DATA_HCTL_EN for in INTF_SC7180_MASK
      dt-bindings: display/msm: dsi-controller-main: Add SM6350
      dt-bindings: display/msm: dsi-controller-main: Add SM6375
      dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
      dt-bindings: display/msm: Add SM6350 MDSS
      dt-bindings: display/msm: Add SM6375 MDSS
      drm/msm/dpu: Add SM6350 support
      drm/msm/dpu: Add SM6375 support
      drm/msm: mdss: Add SM6350 support
      drm/msm: mdss: Add SM6375 support
      dt-bindings: display/msm: gpu: Document GMU wrapper-equipped A6xx
      dt-bindings: display/msm/gmu: Add GMU wrapper
      drm/msm/adreno: Use adreno_is_revn for A690
      drm/msm/a6xx: Remove static keyword from sptprac en/disable functions
      drm/msm/a6xx: Move force keepalive vote removal to a6xx_gmu_force_off=
()
      drm/msm/a6xx: Move a6xx_bus_clear_pending_transactions to a6xx_gpu
      drm/msm/a6xx: Improve a6xx_bus_clear_pending_transactions()
      drm/msm/a6xx: Add a helper for software-resetting the GPU
      drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
      drm/msm/a6xx: Extend and explain UBWC config
      drm/msm/a6xx: Move CX GMU power counter enablement to hw_init
      drm/msm/a6xx: Introduce GMU wrapper support
      drm/msm/adreno: Disable has_cached_coherent in GMU wrapper configurat=
ions
      drm/msm/a6xx: Add support for A619_holi
      drm/msm/a6xx: Add A610 support
      drm/msm/a6xx: Fix some A619 tunables
      drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
      drm/msm/a6xx: Use adreno_is_aXYZ macros in speedbin matching
      drm/msm/a6xx: Add A619_holi speedbin support
      drm/msm/a6xx: Add A610 speedbin support

Krunoslav Kovac (1):
      drm/amd/display: 3-plane MPO enablement for DCN321

Krzysztof Kozlowski (2):
      drm/i915: constify pointers to hwmon_channel_info
      drm/nouveau: constify pointers to hwmon_channel_info

Kuogee Hsieh (8):
      drm/msm/dpu: set DSC flush bit correctly at MDP CTL flush register
      drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for DPU < 7.0.0
      drm/msm/dpu: Guard PINGPONG DSC ops behind DPU_PINGPONG_DSC bit
      drm/msm/dpu: Introduce PINGPONG_NONE to disconnect DSC from PINGPONG
      drm/msm/dpu: always clear every individual pending flush mask
      drm/msm/dpu: separate DSC flush update out of interface
      drm/msm/dpu: Tear down DSC datapath on encoder cleanup
      drm/msm/dpu: add support for DSC encoder v1.2 engine

Lang Yu (2):
      drm/amdgpu: install stub fence into potential unused fence pointers
      drm/amdgpu: unmap and remove csa_va properly

Le Ma (51):
      drm/amdgpu: convert gfx.kiq to array type (v3)
      drm/amdgpu: move queue_bitmap to an independent structure (v3)
      drm/amdgpu: separate the mqd_backup for kiq from kcq
      drm/amdgpu: add multi-xcc support to amdgpu_gfx interfaces (v4)
      drm/amdgpu: split gc v9_4_3 functionality from gc v9_0
      drm/amdgpu: add xcc index argument to soc15_grbm_select
      drm/amdgpu: add multi-XCC initial support in gfx_v9_4_3.c
      drm/amdgpu: add xcc index argument to gfx v9_4_3 functions
      drm/amdgpu: add xcc index argument to select_sh_se function v2
      drm/amdgpu: add xcc index argument to rlc safe_mode func (v4)
      drm/amdgpu: add master/slave check in init phase
      drm/amdgpu: initialize num_xcd to 1 for gfx v9_0
      drm/amdgpu: allocate doorbell index for multi-die case
      drm/amdgpu: do gfxhub init for all XCDs
      drm/amdgpu: assign register address for vmhub object on each XCD
      drm/amdgpu: add bitmask to iterate vmhubs
      drm/amdgpu: init vmhubs bitmask for GC 9.4.3
      drm/amdgpu: assign different AMDGPU_GFXHUB for rings on each xcc
      drm/amdgpu: add sysfs node for compute partition mode
      drm/amdgpu: add node_id to physical id conversion in EOP handler
      drm/amdgpu: assign the doorbell index in 1st page to sdma page queue
      drm/amdgpu: adjust some basic elements for multiple AID case
      drm/amdgpu: add support for SDMA on multiple AIDs
      drm/amdgpu: assign the doorbell index for sdma on non-AID0
      drm/amdgpu: do mmhub init for multiple AIDs
      drm/amdgpu: correct the vmhub reference for each XCD in gfxhub init
      drm/amdgpu: complement the IH node_id table for multiple AIDs
      drm/amdgpu: set mmhub bitmask for multiple AIDs
      drm/amdgpu: convert the doorbell_index to 2 dwords offset for kiq
      drm/amdgpu: program GRBM_MCM_ADDR for non-AID0 GRBM
      drm/amdgpu: introduce new doorbell assignment table for GC 9.4.3
      drm/amdgpu: add indirect r/w interface for smn address greater than 3=
2bits
      drm/amdgpu: configure the doorbell settings for sdma on non-AID0
      drm/amdgpu: adjust s2a entry register for sdma doorbell trans decodin=
g
      drm/amdgpu: drop redundant csb init for gfx943
      drm/amdgpu: add new doorbell assignment table for aqua_vanjaram
      drm/amdgpu: switch to aqua_vanjaram_doorbell_index_init
      drm/amdgpu: update ip discovery header to v4
      drm/amdgpu: increase DISCOVERY_TMR_SIZE
      drm/amdgpu: extend max instances
      drm/amdgpu: do some register access cleanup in nbio v7_9
      drm/amdgpu: upgrade amdgpu_discovery struct ip to ip_v4
      drm/amdgpu: parse base address from new ip discovery with 64bit
ip base address
      drm/amdgpu: add helpers to access registers on different AIDs
      drm/amdgpu: consolidate the access helpers in nbio v7_9
      drm/amdgpu: fix vm context register assignment in mmhub v1.8
      drm/amdgpu: correct the vmhub index when page fault occurs
      drm/amdgpu: enable context empty interrupt on sdma v4.4.2
      drm/amdgpu: increase AMDGPU_MAX_RINGS
      drm/amdgpu: change the print level to warn for ip block disabled
      drm/amdgpu/pm: notify driver unloading to PMFW for SMU v13.0.6 dGPU

Lee Jones (1):
      drm/amd/display/amdgpu_dm/amdgpu_dm_helpers: Move
SYNAPTICS_DEVICE_ID into CONFIG_DRM_AMD_DC_DCN ifdef

Leo (Hanghong) Ma (2):
      drm/amd/display: Update scaler recout data for visual confirm
      drm/amd/display: Add visual confirm color support for MCLK switch

Leo Chen (4):
      drm/amd/display: Lowering min Z8 residency time
      drm/amd/display: Change default Z8 watermark values
      drm/amd/display: Adding debug option to override Z8 watermark values
      drm/amd/display: Add symclk workaround during disable link output

Leo Ma (2):
      drm/amd/display: revert "Update scaler recout data for visual confirm=
"
      Revert "drm/amd/display: cache trace buffer size"

Leon Huang (2):
      drm/amd/display: Refactor ABM feature
      drm/amd/display: Fix ABM pipe/backlight issues when change backlight

Lijo Lazar (104):
      drm/amdgpu: Use the correct API to read register
      drm/amdgpu: Add some XCC programming
      drm/amdgpu: Add mode2 reset logic for v13.0.6
      drm/amdgpu: Use new atomfirmware init for GC 9.4.3
      drm/amdgpu: Change num_xcd to xcc_mask
      drm/amdgpu: Add map of logical to physical inst
      drm/amdgpu: Use instance lookup table for GC 9.4.3
      drm/amdgpu: Add mask for SDMA instances
      drm/amdgpu: Use instance table for sdma 4.4.2
      drm/amdgpu: Fix GRBM programming sequence
      drm/amdgpu: Conform to SET_UCONFIG_REG spec
      drm/amdgpu: Use status register for partition mode
      drm/amdgpu: Fix programming of initial XCP mode
      drm/amdgpu: Fix register access on GC v9.4.3
      drm/amdgpu: Add IP instance map for aqua vanjaram
      drm/amdgpu: Add mask for SDMA instances
      drm/amdgpu: Use SDMA instance table for aqua vanjaram
      drm/amdgpu: Fix interrupt handling in GFX v9.4.3
      drm/amdgpu: Add SDMA v4.4.2 golden settings
      drm/amdgpu: Revert programming of CP_PSP_XCP_CTL
      drm/amdgpu: Skip runtime db read for PSP 13.0.6
      drm/amdgpu: Rename xcc specific functions
      drm/amdgpu: Add xcc specific functions
      drm/amdgpu: Add xcc specific functions for gfxhub
      drm/amdgpu: Add sdma instance specific functions
      drm/amdgpu: Add initial version of XCP routines
      drm/amdgpu: Add SOC partition funcs for GC v9.4.3
      drm/amdgpu: Add soc config init for GC9.4.3 ASICs
      drm/amdgpu: Switch to SOC partition funcs
      drm/amdgpu: Add GFXHUB v1.2 XCP funcs
      drm/amdgpu: Add SDMA v4.4.2 XCP funcs
      drm/amdgpu: Add XCP functions for GFX v9.4.3
      drm/amdgpu: Add XCP IP callback funcs for each IP
      drm/amdgpu: Skip TMR allocation if not required
      drm/amdgpu: Move generic logic to soc config
      drm/amdgpu: Derive active clusters from SDMA
      drm/amdgpu: Use mask for active clusters
      drm/amdgpu: Remove unnecessary return value check
      drm/amdgpu: Fix semaphore release
      drm/amdgpu: Fix GFX 9.4.3 dma address capability
      drm/amdgpu: Fix GFX v9.4.3 EOP buffer allocation
      drm/amdgpu: Add FGCG logic for GFX v9.4.3
      drm/amdgpu: Make VRAM discovery read optional
      drm/amdgpu: Use discovery to get XCC/SDMA mask
      drm/amdgpu: Populate VCN/JPEG harvest information
      drm/amdgpu: Keep SDMAv4.4.2 active during reset
      drm/amdgpu: Use unique doorbell range per xcc
      drm/amdgpu: Enable CGCG/LS for GC 9.4.3
      drm/amdgpu: Fix mqd init on GFX v9.4.3
      drm/amdgpu: Enable MGCG on SDMAv4.4.2
      drm/amd/pm: Keep interface version in PMFW header
      drm/amd/pm: Initialize power limit for SMU v13.0.6
      drm/amd/pm: Update PMFW headers for version 85.54
      drm/amd/pm: Notify PMFW about driver unload cases
      drm/amdgpu: Add mode-2 reset in SMU v13.0.6
      drm/amdgpu: Add flags for partition mode query
      drm/amdgpu: Use transient mode during xcp switch
      drm/amdgpu: Add FGCG for GFX v9.4.3
      drm/amdgpu: Add parsing of acpi xcc objects
      drm/amdgpu: Add API to get tmr info from acpi
      drm/amdgpu: Read discovery info from system memory
      drm/amdgpu: Add fallback path for discovery info
      drm/amdgpu: Fix discovery sys node harvest info
      drm/amdgpu: Add instance mask for VCN and JPEG
      drm/amdgpu: Add VCN logical to physical id mapping
      drm/amdgpu: Use logical ids for VCN/JPEG v4.0.3
      drm/amdgpu: Fix harvest reporting of VCN
      drm/amdgpu/vcn: Use buffer object's deletion logic
      drm/amdgpu: Simplify aquavanjram instance mapping
      drm/amdgpu: Use GPU VA space for IH v4.4.2 in APU
      drm/amdgpu: Use apt name for FW reserved region
      drm/amdgpu: Add utility functions for xcp
      drm/amdgpu: Move memory partition query to gmc
      drm/amdgpu: Get supported memory partition modes
      drm/amdgpu: Store additional numa node information
      drm/amdgpu: Add API to get numa information of XCC
      drm/amdgpu: Add memory partitions to gmc
      drm/amdgpu: Initialize memory ranges for GC 9.4.3
      drm/amdgpu: Add callback to fill xcp memory id
      drm/amdgpu: Fill xcp mem node in aquavanjaram
      drm/amdgpu: Move initialization of xcp before kfd
      drm/amdkfd: Add xcp reference to kfd node
      drm/amdkfd: Use xcc mask for identifying xcc
      drm/amdgpu: Check memory ranges for valid xcp mode
      drm/amdgpu: Add auto mode for compute partition
      drm/amdgpu: Fix unmapping of aperture
      drm/amdgpu: Add compute mode descriptor function
      drm/amdgpu: Return error on invalid compute mode
      drm/amdgpu: Add PSP spatial parition interface
      drm/amdgpu: Fix register accesses in GFX v9.4.3
      drm/amdgpu: Skip halting RLC on GFX v9.4.3
      drm/amdgpu: Disable interrupt tracker on NBIOv7.9
      drm/amdgpu: Fix warnings
      drm/amdgpu: Use single copy per SDMA instance type (v2)
      drm/amdkfd: Fix MEC pipe interrupt enablement
      drm/amdgpu: Initialize xcc mask
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Fix SMUv13.0.6 throttle status report
      drm/amd/pm: Fix power context allocation in SMU13
      drm/amd/pm: Fill metrics data for SMUv13.0.6
      drm/amdgpu: Release SDMAv4.4.2 ecc irq properly
      drm/amdgpu: Change nbio v7.9 xcp status definition
      drm/amdgpu: Use PSP FW API for partition switch
      drm/amdgpu: Remove unused NBIO interface

Likun Gao (4):
      drm/amdgpu: support psp vbflash sysfs for MP0 13_0_10
      drm/amdgpu: fix vga_set_state NULL pointer issue
      drm/amdgpu: retire set_vga_state for some ASIC
      drm/amdgpu: add wait_for helper for spirom update

Lin.Cao (1):
      drm/amdgpu: Fix vram recover doesn't work after whole GPU reset (v2)

Lionel Landwerlin (1):
      drm/i915: disable sampler indirect state in bindless heap

Liu Ying (8):
      dt-bindings: display: simple: Add BOE EV121WXM-N10-1850 panel
      drm/panel: panel-simple: Add BOE EV121WXM-N10-1850 panel support
      dt-bindings: lcdif: Add i.MX93 LCDIF support
      drm: lcdif: Drop unnecessary NULL pointer check on lcdif->bridge
      drm: lcdif: Determine bus format and flags in ->atomic_check()
      drm: lcdif: Check consistent bus format and flags across first bridge=
s
      drm: lcdif: Add multiple encoders and first bridges support
      drm: lcdif: Add i.MX93 LCDIF compatible string

Longlong Yao (1):
      drm/amdgpu: fix calltrace warning in amddrm_buddy_fini

Luben Tuikov (4):
      drm/sched: Rename to drm_sched_can_queue()
      drm/sched: Rename to drm_sched_wakeup_if_can_queue()
      drm/amdgpu: Report ras_num_recs in debugfs
      drm/amdgpu: Fix usage of UMC fill record in RAS

Luc Ma (1):
      drm/vram-helper: fix function names in vram helper doc

Luca Coelho (3):
      drm/i915: use pointer to i915 instead of rpm in wakeref
      drm/i915: add a dedicated workqueue inside drm_i915_private
      drm/i915/selftests: add local workqueue for SW fence selftest

Luca Weiss (6):
      dt-bindings: msm: dsi-phy-28nm: Document msm8226 compatible
      dt-bindings: display/msm: dsi-controller-main: Add msm8226 compatible
      drm/msm/dsi: Add configuration for MSM8226
      drm/msm/dsi: Add phy configuration for MSM8226
      dt-bindings: display/msm: qcom, mdp5: Add msm8226 compatible
      drm/msm/mdp5: Add MDP5 configuration for MSM8226

Lucas De Marchi (1):
      drm/i915/gt: Avoid out-of-bounds access when loading HuC

Lucas Stach (1):
      drm: bridge: samsung-dsim: fix blanking packet size calculation

Ma Jun (2):
      drm/ttm: Remove redundant code in ttm_tt_init_fields
      drm/amdgpu: Print client id for the unregistered interrupt resource

Maarten Lankhorst (2):
      drm/i915: Remove i915_drm_suspend_mode
      drm/i915: Flush power delayed put when connector init failed

Madhumitha Tolakanahalli Pradeep (2):
      drm/i915/mtl: Extend Wa_22011802037 to MTL A-step
      drm/i915/mtl: Define MOCS and PAT tables for MTL

Marek Vasut (6):
      drm/bridge: lt9211: Do not generate HFP/HBP/HSA and EOT packet
      drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet
      dt-bindings: display: bridge: tc358867: Document TC358867/TC9595
compatible
      drm: bridge: samsung-dsim: Implement support for clock/data polarity =
swap
      dt-bindings: display: bridge: tc358762: Document reset-gpios
      drm/bridge: tc358762: Add reset GPIO support

Marijn Suijten (17):
      MAINTAINERS: Add Marijn Suijten as drm/msm reviewer
      drm/msm/dpu: Drop unused members from HW structs
      drm/msm/dpu: Pass catalog pointers in RM to replace for-loop ID looku=
ps
      drm/msm/dpu: Use V4.0 PCC DSPP sub-block in SC7[12]80
      drm/msm/dpu: Remove extraneous register define indentation
      drm/msm/dpu: Sort INTF registers numerically
      drm/msm/dpu: Take INTF index as parameter in interrupt register defin=
es
      drm/msm/dpu: Drop unused poll_timeout_wr_ptr PINGPONG callback
      drm/msm/dpu: Move autorefresh disable from CMD encoder to pingpong
      drm/msm/dpu: Disable pingpong TE on DPU 5.0.0 and above
      drm/msm/dpu: Disable MDP vsync source selection on DPU 5.0.0 and abov=
e
      drm/msm/dpu: Factor out shared interrupt register in INTF_BLK macro
      drm/msm/dpu: Describe TEAR interrupt registers for DSI interfaces
      drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block
      drm/msm/dpu: Merge setup_- and enable_tearcheck pingpong callbacks
      drm/msm/dpu: Implement tearcheck support on INTF block
      drm/msm/dpu: Remove intr_rdptr from DPU >=3D 5.0.0 pingpong config

Mario Limonciello (10):
      drm/amd: Downgrade message about watermarks table after s0i3 to debug
      drm/amd: Update driver-misc.html for Phoenix
      drm/amd: Update driver-misc.html for Dragon Range
      drm/amd: Update driver-misc.html for Rembrandt-R
      drm/amd: Drop debugfs access to the DPCD
      drm/amd: Disallow s0ix without BIOS support again
      drm/amd: Make lack of `ACPI_FADT_LOW_POWER_S0` or
`CONFIG_AMD_PMC` louder during suspend path
      drm/amd: Check that a system is a NUMA system before looking for SRAT
      drm/amd: Make sure image is written to trigger VBIOS image update flo=
w
      drm/amd: Tighten permissions on VBIOS flashing attributes

Markus Elfring (10):
      drm/nouveau/debugfs: Move an expression into a function call
parameter in nouveau_debugfs_pstate_set()
      drm/nouveau/debugfs: Move a variable assignment behind a null
pointer check in nouveau_debugfs_pstate_get()
      drm/nouveau/debugfs: Use seq_putc() in nouveau_debugfs_pstate_get()
      drm/nouveau/debugfs: Replace five seq_printf() calls by
seq_puts() in nouveau_debugfs_pstate_get()
      drm/nouveau/bios/power_budget: Move an expression into a macro
call parameter in nvbios_power_budget_header()
      drm/nouveau/clk: Move a variable assignment behind a null
pointer check in nvkm_pstate_new()
      drm/nouveau/pci: Move a variable assignment behind condition
checks in nvkm_pcie_set_link()
      drm/nouveau/pci: Move an expression into a function call
parameter in nvkm_pcie_set_link()
      drm/nouveau/therm: Move an assignment statement behind a null
pointer check in two functions
      drm/bridge: it6505: Move a variable assignment behind a null
pointer check in receive_timing_debugfs_show()

Masahiro Yamada (2):
      drm/bridge: imx: fix mixed module-builtin object
      drm/bridge: imx: turn imx8{qm,qxp}-ldb into single-object modules

Matt Atwood (2):
      drm/i915: Reduce I915_MAX_GT to 2
      drm/i915: rename I915_PMU_MAX_GTS to I915_PMU_MAX_GT

Matt Roper (11):
      drm/i915: Use separate "DC off" power well for ADL-P and DG2
      drm/i915/mtl: Re-use ADL-P's "DC off" power well
      drm/i915/display: Move display device info to header under display/
      drm/i915: Convert INTEL_INFO()->display to a pointer
      drm/i915/display: Move display runtime info to display structure
      drm/i915/display: Make display responsible for probing its own IP
      drm/i915/display: Handle GMD_ID identification in display code
      drm/i915/display: Move feature test macros to intel_display_device.h
      drm/i915/display: Extract display init from intel_device_info_runtime=
_init
      drm/i915: Fix error handling if driver creation fails during probe
      drm/i915/display: Include of display limits doesn't need 'display/'

Max Tseng (1):
      drm/amd/display: Add control flag to dc_stream_state to skip eDP
BL off/link off

Maxime Ripard (4):
      drm/vc4: Switch to container_of_const
      drm/vc4: hdmi: Update all the planes if the TV margins are changed
      Merge drm/drm-next into drm-misc-next
      mailmap: Add missing email address

Ma=C3=ADra Canal (16):
      drm/vkms: Use drmm_crtc_init_with_planes()
      drm/vkms: Use drmm_mode_config_init()
      drm/gem: Check for valid formats
      drm/bridge: anx7625: Drop of_gpio header
      drm/sti: Drop of_gpio header
      drm/vkms: isolate pixel conversion functionality
      drm/vkms: allow full alpha blending on all planes
      drm/vkms: drop full alpha blending TODO
      drm/vkms: add rotate-0 and reflect-x property
      drm/vkms: add reflect-y and rotate-180 property
      drm/vkms: add rotate-90 property
      drm/vkms: add rotate-270 property
      drm/vkms: drop "Rotation" TODO
      MAINTAINERS: Add Maira to VKMS maintainers
      drm: Add fixed-point helper to get rounded integer values
      drm/vkms: Fix RGB565 pixel conversion

Meenakshikumar Somasundaram (1):
      drm/amd/display: Adjust dmub outbox notification enable

Michael Mityushkin (2):
      drm/amd/display: Correct output color space during HW reinitialize
      drm/amd/display: Apply correct panel mode when reinitializing hardwar=
e

Michael Strauss (2):
      drm/amd/display: Convert Delaying Aux-I Disable To Monitor Patch
      drm/amd/display: Keep disable aux-i delay as 0

Michal Wajdeczko (4):
      drm/i915/guc: Use FAST_REQUEST for non-blocking H2G calls
      drm/i915/guc: Update log for unsolicited CTB response
      drm/i915/guc: Track all sent actions to GuC
      drm/i915/guc: Drop legacy CTB definitions

Michel D=C3=A4nzer (2):
      Revert "drm/amd/display: Block optimize on consecutive FAMS enables"
      Revert "drm/amd/display: Do not set drr on pipe commit"

Mika Kahola (17):
      drm/i915/mtl: Add DP rates
      drm/i915/mtl: Create separate reg file for PICA registers
      drm/i915/mtl: Add vswing programming for C10 phys
      drm/i915/mtl: MTL PICA hotplug detection
      drm/i915/mtl: C20 PLL programming
      drm/i915/mtl: C20 HW readout
      drm/i915/mtl: Dump C20 pll hw state
      drm/i915/mtl: C20 port clock calculation
      drm/i915/mtl: Add voltage swing sequence for C20
      drm/i915/mtl: For DP2.0 10G and 20G rates use MPLLA
      drm/i915/mtl: Enabling/disabling sequence Thunderbolt pll
      drm/i915/mtl: Readout Thunderbolt HW state
      drm/i915/mtl: Power up TCSS
      drm/i915/mtl: Enable TC ports
      drm/i915/mtl: Fix expected reg value for Thunderbolt PLL disabling
      drm/i915/mtl: Reset only one lane in case of MFD
      drm/i915/mtl: Add support for PM DEMAND

Mikita Lipski (1):
      drm/amd/display: Write TEST_EDID_CHECKSUM_WRITE for EDID tests

Min Li (1):
      drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl

Moti Haimovski (3):
      accel/habanalabs: fix bug in free scratchpad memory
      accel/habanalabs: call to HW/FW err returns 0 when no events exist
      accel/habanalabs: fix mem leak in capture user mappings

Mukul Joshi (37):
      drm/ttm: Helper function to get TTM mem limit
      drm/amdgpu: Set GTT size equal to TTM mem limit
      drm/amdkfd: Update KFD TTM mem limit
      drm/amdkfd: Introduce kfd_node struct (v5)
      drm/amdkfd: Add spatial partitioning support in KFD
      drm/amdkfd: Update MQD management on multi XCC setup
      drm/amdkfd: Add PM4 target XCC
      drm/amdkfd: Add XCC instance to kgd2kfd interface (v3)
      drm/amdgpu: Add XCC inst to PASID TLB flushing
      drm/amdkfd: Update context save handling for multi XCC setup (v2)
      drm/amdgpu: Fix VM fault reporting on XCC1
      drm/amdkfd: Call DQM stop during DQM uninitialize
      drm/amdkfd: Update sysfs node properties for multi XCC
      drm/amdkfd: Update SDMA queue management for GFX9.4.3
      drm/amdgpu: Fix CP_HYP_XCP_CTL register programming in CPX mode
      drm/amdkfd: Fix SDMA in CPX mode
      drm/amdkfd: Add SDMA info for SDMA 4.4.2
      drm/amdkfd: Populate memory info before adding GPU node to topology
      drm/amdkfd: Rework kfd_locked handling
      drm/amdkfd: Add device repartition support
      drm/amdkfd: Update SMI events for GFX9.4.3
      drm/amdkfd: Use instance table for GFX 9.4.3
      drm/amdgpu: Fix failure when switching to DPX mode
      drm/amdkfd: Update interrupt handling for GFX9.4.3
      drm/amdkfd: Update packet manager for GFX9.4.3
      drm/amdkfd: Setup current_logical_xcc_id in MQD
      drm/amdgpu: Increase Max GPU instance to 64
      drm/amdkfd: Enable SVM on Native mode
      drm/amdkfd: Increase queue number per process to 255 on GFX9.4.3
      drm/amdkfd: Move local_mem_info to kfd_node
      drm/amdkfd: Fix memory reporting on GFX 9.4.3
      drm/amdgpu: Enable IH CAM on GFX9.4.3
      drm/amdgpu: Add a low priority scheduler for VRAM clearing
      drm/amdkfd: Set event interrupt class for GFX 9.4.3
      drm/amdkfd: Fix reserved SDMA queues handling
      drm/amdgpu: Rename DRM schedulers in amdgpu TTM
      drm/amdkfd: Remove DUMMY_VRAM_SIZE

Mustapha Ghaddar (1):
      drm/amd/display: enable dpia validate

Nasir Osman (1):
      drm/amd/display: DSC policy override when ODM combine is forced

Nathan Chancellor (6):
      drm/i915: Fix clang -Wimplicit-fallthrough in intel_async_flip_check_=
hw()
      drm/i915/gt: Fix second parameter type of pre-gen8 pte_encode callbac=
ks
      drm/i915/gt: Fix parameter in gmch_ggtt_insert_{entries, page}()
      drm/i915/pxp: Fix size_t format specifier in gsccs_send_message()
      drm/amdgpu: Fix return types of certain NBIOv7.9 callbacks
      drm/amdgpu: Wrap -Wunused-but-set-variable in cc-option

Neil Armstrong (10):
      Revert "dt-bindings: bridge: samsung-dsim: Make some flags optional"
      dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
      dt-bindings: display: meson-vpu: add third DPI output port
      drm/meson: fix unbind path if HDMI fails to bind
      drm/meson: only use components with dw-hdmi
      drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
      drm/meson: add DSI encoder
      drm/meson: add support for MIPI-DSI transceiver
      drm/panel: khadas-ts050: update timings to achieve 60Hz refresh rate
      dt-bindings: display: msm: dp-controller: document SM8550 compatible

Nicholas Kazlauskas (3):
      drm/amd/display: Explicitly specify update type per plane info change
      drm/amd/display: Update SR watermarks for DCN314
      drm/amd/display: Skip DPP DTO update if root clock is gated

Nikita Travkin (1):
      drm/bridge: ti-sn65dsi86: Implement wait_hpd_asserted

Nikita Zhandarovich (3):
      radeon: avoid double free in ci_dpm_init()
      drm/i915/dp: prevent potential div-by-zero
      drm/radeon: fix possible division-by-zero errors

Nirmoy Das (7):
      drm/i915/ttm: Add I915_BO_PREALLOC
      drm/i915/display: Set I915_BO_ALLOC_USER for fb
      drm/i915: Add a function to mmap framebuffer obj
      drm/i915/display: Add helper func to get intel_fbdev from drm_fb_help=
er
      drm/i915/display: Implement fb_mmap callback function
      drm/i915/mtl: Disable stolen memory backed FB for A0
      drm/i915: Wait for active retire before i915_active_fini()

N=C3=ADcolas F. R. A. Prado (1):
      drm/bridge: anx7625: Prevent endless probe loop

Oded Gabbay (5):
      accel/habanalabs: set unused bit as reserved
      accel/habanalabs: align to latest firmware specs
      accel/habanalabs: print max timeout value on CS stuck
      accel/habanalabs: remove sim code
      accel/habanalabs: move ioctl error print to debug level

Ofir Bitton (7):
      accel/habanalabs: unsecure TPC bias registers
      accel/habanalabs: add pci health check during heartbeat
      accel/habanalabs: always fetch pci addr_dec error info
      accel/habanalabs: remove support for mmu disable
      accel/habanalabs: fix bug of not fetching addr_dec info
      accel/habanalabs: unsecure TSB_CFG_MTRR regs
      accel/habanalabs: add event queue extra validation

Pallavi Mishra (1):
      drm/i915/mtl: Drop FLAT CCS check

Peichen Huang (1):
      drm/amd/display: limit DPIA link rate to HBR3

Philip Yang (26):
      drm/amdkfd: Optimize svm range map to GPU with XNACK on
      drm/amdgpu: more GPU page fault info for GC v9.4.3
      drm/amdkfd: Cleanup KFD nodes creation
      drm/amdkfd: Flush TLB after unmapping for GFX v9.4.3
      drm/amdgpu: Set TTM pools for memory partitions
      drm/amdkfd: Move pgmap to amdgpu_kfd_dev structure
      drm/amdgpu: Enable NPS4 CPX mode
      drm/amdgpu: Add xcp manager num_xcp_per_mem_partition
      drm/amdkfd: Store drm node minor number for kfd nodes
      drm/amdgpu: Add memory partition id to amdgpu_vm
      drm/amdkfd: Show KFD node memory partition info
      drm/amdgpu: Add memory partition mem_id to amdgpu_bo
      drm/amdkfd: Alloc memory of GPU support memory partition
      drm/amdkfd: SVM range allocation support memory partition
      drm/amdgpu: dGPU mode placement support memory partition
      drm/amdkfd: Update MTYPE for far memory partition
      drm/amdgpu: Alloc page table on correct memory partition
      drm/amdgpu: dGPU mode set VRAM range lpfn as exclusive
      drm/amdkfd: Store xcp partition id to amdgpu bo
      drm/amdgpu: KFD graphics interop support compute partition
      drm/amdkfd: APU mode set max svm range pages
      drm/amdkfd: Refactor migrate init to support partition switch
      drm/amdgpu: Correct get_xcp_mem_id calculation
      drm/amdkfd: Align partition memory size to page size
      drm/amdgpu: Enable translate further for GC v9.4.3
      drm/amdgpu: Increase hmm range get pages timeout

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: add new flag to AMDGPU_CTX_QUERY2

Po-Ting Chen (1):
      drm/amd/display: update GSP1 generic info packet for PSRSU

Qingqing Zhuo (1):
      drm/amd/display: Clean FPGA code in dc

Radhakrishna Sripada (8):
      drm/i915/mtl: Add Support for C10 PHY message bus and pll programming
      drm/i915/mtl: Add C10 phy programming for HDMI
      drm/i915/mtl: Skip pcode qgv restrictions for MTL
      drm/i915/mtl: Add the missing CPU transcoder mask in intel_device_inf=
o
      drm/i915/mtl: Implement Wa_14019141245
      drm/i915/mtl: Fix the wa number for Wa_22016670082
      drm/i915/mtl: Add MTL performance tuning changes
      drm/i915/mtl: Extend Wa_16014892111 to MTL A-step

Rajneesh Bhardwaj (14):
      drm/amdkfd: Update coherence settings for svm ranges
      drm/amdgpu: implement smuio v13_0_3 callbacks
      drm/amdgpu: detect current GPU memory partition mode
      drm/amdgpu: Check APU supports true APP mode
      drm/amdgpu: set MTYPE in PTE for GFXIP 9.4.3
      drm/amdgpu: Make UTCL2 snoop CPU caches
      drm/amdkfd: Report XGMI IOLINKs for GFXIP9.4.3
      drm/ttm: add NUMA node id to the pool
      drm/amdgpu: Handle VRAM dependencies on GFXIP9.4.3
      drm/amdgpu: Implement new dummy vram manager
      drm/amdgpu: Create VRAM BOs on GTT for GFXIP9.4.3
      drm/ttm: export ttm_pool_fini for cleanup
      drm/amdkfd: Native mode memory partition support
      drm/amdgpu: Fix xGMI access P2P mapping failure on GFXIP 9.4.3

Rakesh Ughreja (1):
      accel/habanalabs: allow user to modify EDMA RL register

Raphael Gallais-Pou (1):
      drm/stm: ltdc: fix late dereference check

Richard Leitner (2):
      dt-bindings: display: simple: add support for InnoLux G070ACE-L01
      drm/panel: simple: Add InnoLux G070ACE-L01

Rob Clark (10):
      drm/docs: Fix usage stats typos
      drm: Add common fdinfo helper
      drm/msm: Switch to fdinfo helper
      drm/amdgpu: Switch to fdinfo helper
      drm: Add fdinfo memory stats
      drm/msm: Add memory stats to fdinfo
      drm/doc: Relax fdinfo string constraints
      drm/amdgpu: Fix no-procfs build
      drm/msm: Move cmdstream dumping out of sched kthread
      drm/msm/a6xx: Fix a690 CP_PROTECT settings

Rodrigo Siqueira (7):
      drm/amd/display: Add missing WA and MCLK validation
      drm/amd/display: Add FAMS validation before trying to use it
      drm/display: Add missing OLED Vesa brightnesses definitions
      drm/amd/display: Show the DCN/DCE version in the log
      drm/amd/display: Convert connector signal id to string
      drm/amd/display: Remove unnecessary variable
      drm/amd/display: Reorganize DCN30 Makefile

Rodrigo Vivi (2):
      drm/doc/rfc: Introduce the merge plan for the Xe driver.
      Merge drm/drm-next into drm-intel-next

Roman Beranek (2):
      drm: sun4i: rename sun4i_dotclock to sun4i_tcon_dclk
      drm: sun4i: calculate proper DCLK rate for DSI

Ruili Ji (1):
      drm/amdkfd: To enable traps for GC_11_0_4 and up

Saaem Rizvi (4):
      drm/amd/display: Trigger DIO FIFO resync on commit streams
      drm/amd/display: Trigger DIO FIFO resync on commit streams for DCN32
      drm/amd/display: Wrong index type for pipe iterator
      drm/amd/display: Do not disable phantom pipes in driver

Saleemkhan Jamadar (1):
      drm/amdgpu/jpeg: Remove harvest checking for JPEG3

Samson Tam (4):
      drm/amd/display: Clear GPINT1 before taking DMCUB out of reset
      drm/amd/display: filter out invalid bits in pipe_fuses
      drm/amd/display: add ODM case when looking for first split pipe
      Revert "drm/amd/display: reallocate DET for dual displays with
high pixel rate ratio"

Shane Xiao (1):
      drm/amdgpu: Enable doorbell selfring after resize FB BAR

Sherry Wang (1):
      drm/amd/display: correct DML calc error

Shiwu Zhang (20):
      drm/amdgpu: make the WREG32_SOC15_xx macro to support multi GC
      drm/amdgpu: override partition mode through module parameter
      drm/amdgpu: alloc vm inv engines for every vmhub
      drm/amdgpu: enable the ring and IB test for slave kcq
      drm/amdgpu: add the support of XGMI link for GC 9.4.3
      drm/amdgpu: fix kcq mqd_backup buffer double free for multi-XCD
      drm/amdgpu: remove partition attributes sys file for gfx_v9_4_3
      drm/amdgpu: Fix the KCQ hang when binding back
      drm/amdgpu: preserve the num_links in case of reflection
      drm/amdgpu: route ioctls on primary node of XCPs to primary device
      drm/amdgpu: add the smu_v13_0_6 and gfx_v9_4_3 ip block
      drm/amdgpu: fix the memory override in kiq ring struct
      drm/amdgpu: init the XCC_DOORBELL_FENCE regs
      drm/amdgpu: bypass bios dependent operations
      drm/amdgpu: golden settings for ASIC rev_id 0
      drm/amdgpu: complement the 4, 6 and 8 XCC cases
      drm/amdgpu: set the APU flag based on package type
      drm/amdgpu: add the accelerator pcie class
      drm/amdgpu: add the accelerator PCIe class
      drm/amdgpu: expose num_hops and num_links xgmi info through dev attr

Shuijing Li (2):
      drm/panel: boe-tv101wum-nl6: Remove extra delay
      drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence

Sonny Jiang (7):
      drm/amdgpu: add vcn_4_0_3 codec query
      drm/amdgpu: Load vcn_v4_0_3 ucode during early_init
      drm/amdgpu: A workaround for JPEG_v4_0_3 ring test fail
      drm/amdgpu: fixes a JPEG get write/read pointer bug
      drm/amdgpu: Add a read after write DB_CTRL for vcn_v4_0_3
      drm/amdgpu: Use a different value than 0xDEADBEEF for jpeg ring test
      drm/amdgpu: vcn_4_0 set instance 0 init sched score to 1

Sridevi (1):
      drm/amd/display: DSC Programming Deltas

Srinivasan Shanmugam (64):
      drm/amd/display: Unconditionally print when DP sink power state fails
      drm/amd/display: Check & log if receiver supports MST, DSC & FEC.
      drm/amd/amdgpu: Fix spaces in array indexing and indentations in
amdgpu_kms.c
      drm/amd/amdgpu: Fix style errors in amdgpu_drv.c & amdgpu_device.c
      drm/amd/display: Remove unused variables in dcn21_hwseq.c
      drm/amd/amdgpu: Fix style issues in amdgpu_discovery.c
      drm/amd/display: DSC passthrough is for DP-HDMI pcon (SST pcon)
      drm/amd/amdgpu: Fix style errors in amdgpu_display.c
      drm/amd/amdgpu: Simplify switch case statements in amdgpu_connectors.=
c
      drm/amd/amdgpu: Fix style problems in amdgpu_debugfs.c
      drm/amd/display: Add logging for eDP v1.4 supported sink rates
      drm/amd/amdgpu: Fix style problems in amdgpu_psp.c
      drm/amd/display: Add logging when DP link training Channel EQ is
Successful
      drm/amd/amdgpu: Fix errors & warnings in amdgpu _bios, _cs,
_dma_buf, _fence.c
      drm/amd/amdgpu: Fix warnings in amdgpu _object, _ring.c
      drm/amd/amdgpu: Fix errors & warnings in amdgpu_ttm.c
      drm/amd/amdgpu: Fix warnings in amdgpu_encoders.c
      drm/amd/amdgpu: Fix errors & warnings in amdgpu_vcn.c
      drm/amd/amdgpu: Fix errors & warnings in amdgpu _uvd, _vce.c
      drm/amdgpu: Fix warnings in amdgpu _sdma, _ucode.c
      drm/amdgpu: Fix uninitialized variable in gfx_v9_4_3_cp_resume
      drm/amd/amdgpu: Fix errors & warnings in mmhub_v1_8.c
      drm/amdgpu: Fix uninitalized variable in jpeg_v4_0_3_is_idle &
jpeg_v4_0_3_wait_for_idle
      drm/amdgpu: Fix uninitalized variable in kgd2kfd_device_init
      drm/amdgpu: Fix unused amdgpu_acpi_get_numa_info function in
amdgpu_acpi_get_node_id()
      drm/amdgpu: Fix uninitialized variable in gfxhub_v1_2_xcp_resume
      drm/amd/amdgpu: Fix warnings in amdgpu_irq.c
      drm/amdgpu: Fix defined but not used gfx9_cs_data in gfx_v9_4_3.c
      drm/amdgpu: Fix unused variable in amdgpu_gfx.c
      drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as __maybe_unused
      drm/amdgpu: Fix up kdoc in sdma_v4_4_2.c
      drm/amdgpu: Fix up kdoc in amdgpu_acpi.c
      drm/amdgpu: Fix up missing kdoc in sdma_v6_0.c
      drm/amdgpu: Fix create_dmamap_sg_bo kdoc warnings
      drm/amd/display: Add missing kdoc entries in
update_planes_and_stream_adapter
      drm/amd/display: Fix up kdoc formats in dcn32_fpu.c
      drm/amdgpu: Fix missing parameter desc for 'xcc_id' in
gfx_v7_0.c & amdgpu_rlc.c
      drm/amdgpu: Fix up missing kdoc parameter 'inst' in
get_wave_count() & kgd_gfx_v9_get_cu_occupancy()
      drm/amdgpu: Fix up missing parameter in kdoc for 'inst' in gmc_
v7, v8, v9, v10, v11.c
      drm/amdgpu: Fix missing parameter desc for 'xcp_id' in
amdgpu_amdkfd_reserve_mem_limit
      drm/amdgpu: Fix up missing parameters kdoc in svm_migrate_vma_to_ram
      drm/amd/display: Fix up kdoc formatting in dcn32_resource_helpers.c
      drm/amd/display: Fix up missing 'dc' & 'pipe_ctx' kdoc
parameters in delay_cursor_until_vupdate()
      drm/amd/display: Correct kdoc formatting for
DCN32_CRB_SEGMENT_SIZE_KB in dcn32_hubbub.c
      drm/amd/display: Fix up kdoc formatting in display_mode_vba.c
      drm/amdgpu: Fix up kdoc 'ring' parameter in sdma_v6_0_ring_pad_ib
      drm/amdgpu: Fix up kdoc in amdgpu_device.c
      drm/amdgpu: Add function parameter 'event' to kdoc in svm_range_evict=
()
      drm/amd/display: Drop unused DCN_BASE variable in dcn314_resource.c
      drm/amd/display: Fix dc/dcn20/dcn20_optc.c kdoc
      drm/amd/display: Address kdoc warnings in dcn30_fpu.c
      drm/amd/display: Add gnu_printf format attribute for snprintf_count()
      drm/amdgpu: Mark 'kgd_gfx_aldebaran_clear_address_watch' &
'kgd_gfx_v11_clear_address_watch' functions as static
      drm/amd/display: Fix unused variable =E2=80=98should_lock_all_pipes=
=E2=80=99
      drm/amdgpu: Fix kdoc warning
      drm/amdgpu: Fix memcpy() in
sienna_cichlid_append_powerplay_table function.
      drm/amdgpu: Add missing function parameter 'optc' & 'enable' to
kdoc in optc3_set_timing_double_buffer()
      drm/amd/display: Correct kdoc formats in dcn10_opp.c
      drm/amd/display: Correct and remove excess function parameter
names in kdoc
      drm/amd/display: Provide function name for 'optc32_enable_crtc()'
      drm/amd/display: Correct kdoc formats in dcn32_resource_helpers.c
      drm/amd/display: Clean up dcn10_optc.c kdoc
      drm/radeon: Fix missing prototypes in radeon_atpx_handler.c
      drm/amd/display: Convert to kdoc formats in dc/core/dc.c

Stanislav Lisovskiy (3):
      drm/i915: Communicate display power demands to pcode
      drm/i915: Fix NULL ptr deref by checking new_crtc_state
      drm/i915: Fix wrong condition in bxt_set_cdclk for DG2

Stanley.Yang (13):
      drm/amdgpu: Add SDMA_UTCL1_WR_FIFO_SED field for sdma_v4_4_ras_field
      drm/amdgpu: fix sdma instance
      drm/amdgpu: pass xcc mask to ras ta
      drm/amdgpu: support check vcn jpeg block mask
      drm/amdgpu: convert vcn/jpeg logical mask to physical mask
      drm/amdgpu: Rename ras table version
      drm/amdgpu: Add RAS table v2.1 macro definition
      drm/amdgpu: Support setting EEPROM table version
      drm/amdgpu: Add support EEPROM table v2.1
      drm/amdgpu: Calculate EEPROM table ras info bytes sum
      drm/amdgpu: Set EEPROM ras info
      drm/amdgpu: Optimize checking ras supported
      drm/amdgpu: Add checking mc_vram_size

Su Hui (3):
      drm/msm: Remove unnecessary (void*) conversions
      drm/amdgpu: remove unnecessary (void*) conversions
      drm/radeon: Remove unnecessary (void*) conversions

Sui Jingfeng (4):
      dma-buf/dma-resv.c: fix a typo
      drm/drm_atomic_helper.c: fix a typo
      drm/i915_drm.h: fix a typo
      drm/amdgpu: display/Kconfig: replace leading spaces with tab

Sukrut Bellary (2):
      drm:amd:amdgpu: Fix missing bo unlock in failure path
      drm:amd:amdgpu: Fix missing buffer object unlock in failure path

Sung Lee (2):
      drm/amd/display: Add p-state debugging
      drm/amd/display: Add additional pstate registers to HW state query

Suraj Kandpal (9):
      drm/i915/display: Increase AUX timeout for Type-C
      drm/i915/hdcp: Check if media_gt exists
      drm/i915/hdcp: add intel_atomic_state argument to hdcp_enable functio=
n
      drm/i915/hdcp: Remove enforce_type0 check outside loop
      drm/i915/hdcp: Fix modeset locking issue in hdcp mst
      drm/i915/hdcp: Fill hdcp2_streamid_type and k in appropriate places
      drm/i915/hdcp: Rename dev_priv to i915
      drm/i915/hdcp: Move away from master naming to arbiter
      drm/i915/hdcp: Rename comp_mutex to hdcp_mutex

Tal Cohen (1):
      accel/habanalabs: ignore false positive razwi

Tao Zhou (15):
      drm/amdgpu: convert logical instance mask to physical one
      drm/amdgpu: add instance mask for RAS inject
      drm/amdgpu: reorganize RAS injection flow
      drm/amdgpu: remove RAS GFX injection for gfx_v9_4/gfx_v9_4_2
      drm/amdgpu: add check for RAS instance mask
      drm/amdgpu: add GFX RAS common function
      drm/amdgpu: add RAS status query for gfx_v9_4_3
      drm/amdgpu: add RAS status reset for gfx_v9_4_3
      drm/amdgpu: add RAS definitions for GFX
      drm/amdgpu: add RAS error count definitions for gfx_v9_4_3
      drm/amdgpu: add RAS error count query for gfx_v9_4_3
      drm/amdgpu: add RAS error count reset for gfx_v9_4_3
      drm/amdgpu: add sq timeout status functions for gfx_v9_4_3
      drm/amdgpu: initialize RAS for gfx_v9_4_3
      drm/amdgpu: remove unused definition

Tejas Upadhyay (8):
      drm/i915/gt: Consider multi-gt instead of to_gt()
      drm/i915/gem: Consider multi-gt instead of to_gt()
      drm/i915/selftests: Consider multi-gt instead of to_gt()
      drm/i915/selftest: Record GT error for gt failure
      drm/i915/mtl: Add workaround 14018778641
      drm/i915/gt: Use gt_err for GT info
      drm/i915/selftests: Use gt_err for GT info
      drm/i915/gt: Add workaround 14016712196

Thomas Zimmermann (73):
      video/aperture: Provide a VGA helper for gma500 and internal use
      Merge drm/drm-next into drm-misc-next
      fbdev: Prepare generic architecture helpers
      arch/arc: Implement <asm/fb.h> with generic helpers
      arch/arm: Implement <asm/fb.h> with generic helpers
      arch/arm64: Implement <asm/fb.h> with generic helpers
      arch/ia64: Implement <asm/fb.h> with generic helpers
      arch/loongarch: Implement <asm/fb.h> with generic helpers
      arch/m68k: Merge variants of fb_pgprotect() into single function
      arch/m68k: Implement <asm/fb.h> with generic helpers
      arch/mips: Implement <asm/fb.h> with generic helpers
      video: Remove trailing whitespaces
      video: Move HP PARISC STI core code to shared location
      arch/parisc: Remove trailing whitespaces
      arch/parisc: Implement fb_is_primary_device() under arch/parisc
      arch/parisc: Implement <asm/fb.h> with generic helpers
      arch/powerpc: Implement <asm/fb.h> with generic helpers
      arch/sh: Implement <asm/fb.h> with generic helpers
      arch/sparc: Implement fb_is_primary_device() in source file
      arch/sparc: Implement <asm/fb.h> with generic helpers
      arch/x86: Implement <asm/fb.h> with generic helpers
      drm/armada: Include <linux/of.h>
      drm/armada: Hide fbdev support behind config option
      drm/armada: Initialize fbdev DRM client
      drm/armada: Implement fbdev emulation as in-kernel client
      Merge drm/drm-next into drm-misc-next
      arch/x86: Include <asm/fb.h> in fbdev source file
      auxdisplay/cfag12864bfb: Use struct fb_info.screen_buffer
      auxdisplay/ht16k33: Use struct fb_info.screen_buffer
      hid/hid-picolcd_fb: Use struct fb_info.screen_buffer
      fbdev/arcfb: Use struct fb_info.screen_buffer
      fbdev/au1200fb: Use struct fb_info.screen_buffer
      fbdev/broadsheetfb: Use struct fb_info.screen_buffer
      fbdev/hecubafb: Use struct fb_info.screen_buffer
      fbdev/metronomefb: Use struct fb_info.screen_buffer
      fbdev/ps3fb: Use struct fb_info.screen_buffer
      fbdev/smscufx: Use struct fb_info.screen_buffer
      fbdev/udlfb: Use struct fb_info.screen_buffer
      fbdev/vfb: Use struct fb_info.screen_buffer
      fbdev/xen-fbfront: Use struct fb_info.screen_buffer
      fbdev: Return number of bytes read or written
      fbdev: Use screen_buffer in fb_sys_{read,write}()
      fbdev: Don't re-validate info->state in fb_ops implementations
      fbdev: Validate info->screen_{base, buffer} in fb_ops implementations
      fbdev: Move I/O read and write code into helper functions
      drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
      fbdev/hitfb: Cast I/O offset to address
      fbdev/matrox: Remove trailing whitespaces
      ipu-v3: Include <linux/io.h>
      fbdev: Include <linux/io.h> in various drivers
      fbdev: Include <linux/fb.h> instead of <asm/fb.h>
      fbdev: Move framebuffer I/O helpers into <asm/fb.h>
      fbdev: Rename fb_mem*() helpers
      drm/gma500: Clear fbdev framebuffer with fb_memset_io()
      drm/msm: Use struct fb_info.screen_buffer
      Merge drm/drm-next into drm-misc-next
      fbdev: Add Kconfig options to select different fb_ops helpers
      fbdev: Add initializer macros for struct fb_ops
      drm/armada: Use regular fbdev I/O helpers
      drm/exynos: Use regular fbdev I/O helpers
      drm/gma500: Use regular fbdev I/O helpers
      drm/radeon: Use regular fbdev I/O helpers
      drm/fbdev-dma: Use regular fbdev I/O helpers
      drm/omapdrm: Use regular fbdev I/O helpers
      drm/tegra: Use regular fbdev I/O helpers
      drm/fb-helper: Export helpers for marking damage areas
      drm/msm: Use regular fbdev I/O helpers
      drm/fbdev-generic: Implement dedicated fbdev I/O helpers
      drm/i915: Implement dedicated fbdev I/O helpers
      drm/msm: Use struct fb_info.screen_buffer
      Merge drm/drm-next into drm-misc-next-fixes
      fbdev: Use /* */ comment in initializer macro
      drm/radeon: Disable outputs when releasing fbdev client

Thong Thai (1):
      drm/amdgpu/nv: update VCN 3 max HEVC encoding resolution

Tianci Yin (1):
      drm/amd/display: Disable migration to ensure consistency of
per-CPU variable

Tim Huang (11):
      drm/amd/pm: reverse mclk and fclk clocks levels for SMU v13.0.4
      drm/amd/pm: reverse mclk clocks levels for SMU v13.0.5
      drm/amd/pm: reverse mclk and fclk clocks levels for yellow carp
      drm/amd/pm: reverse mclk and fclk clocks levels for vangogh
      drm/amd/pm: reverse mclk and fclk clocks levels for renoir
      drm/amd/pm: fix vclk setting failed for SMU v13.0.4
      drm/amd/pm: enable vclk and dclk Pstates for SMU v13.0.4
      drm/amd/pm: enable more Pstates profile levels for SMU v13.0.4
      drm/amd/pm: fix vclk setting failed for SMU v13.0.5
      drm/amd/pm: enable vclk and dclk Pstates for SMU v13.0.5
      drm/amd/pm: enable more Pstates profile levels for SMU v13.0.5

Tom Chung (2):
      drm/amd/display: fix the system hang while disable PSR
      drm/amd/display: Fix disbling PSR slow response issue

Tom Rix (10):
      drm/amd/display: remove unused variable oldest_index
      drm/meson: set variables meson_hdmi_* storage-class-specifier to stat=
ic
      drm/nouveau/acr/ga102: set variable ga102_gsps
storage-class-specifier to static
      accel/habanalabs: remove variable gaudi_irq_name
      drm/amd/display: remove unused variables dispclk_delay_subtotal and d=
out
      drm/amd/display: set variable custom_backlight_curve0
storage-class-specifier to static
      drm/amd/display: return status of dmub_srv_get_fw_boot_status
      drm/amdgpu: remove unused variable num_xcc
      drm/amd/display: remove unused variables
res_create_maximus_funcs and debug_defaults_diags
      drm/amdkfd: remove unused sq_int_priv variable

Tom St Denis (1):
      drm/amd/amdgpu: Update debugfs for XCC support (v3)

Tomer Tayar (3):
      accel/habanalabs: expose debugfs files later
      accel/habanalabs: use lower QM in QM errors handling
      accel/habanalabs: print qman data on error only for lower qman

Tong Liu01 (1):
      drm/amdgpu: fix incorrect pcie_gen_mask in passthrough case

Tvrtko Ursulin (10):
      drm/i915/pmu: Change bitmask of enabled events to u32
      drm/i915/pmu: Support PMU for all engines
      drm/i915/pmu: Skip sampling engines with no enabled counters
      drm/i915/pmu: Transform PMU parking code to be GT based
      drm/i915/pmu: Add reference counting to the sampling timer
      drm/i915/pmu: Prepare for multi-tile non-engine counters
      drm/i915/pmu: Export counters from all tiles
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915: Use the fdinfo helper
      drm/i915/selftests: Add some missing error propagation

Umesh Nerlige Ramappa (4):
      i915/pmu: Add support for total context runtime for GuC back-end
      drm/i915/fdinfo: Enable fdinfo for GuC backends
      i915/perf: Drop the aging_tail logic in perf OA
      i915/perf: Do not add ggtt offset to hw_tail

Uwe Kleine-K=C3=B6nig (2):
      drm: Switch i2c drivers back to use .probe()
      drm/panel-edp: Convert to platform remove callback returning void

Ville Syrj=C3=A4l=C3=A4 (62):
      drm/i915: Fix limited range csc matrix
      drm/i915: Introduce intel_csc_matrix struct
      drm/i915: Split chv_load_cgm_csc() into pieces
      drm/i915: Start using struct intel_csc_matrix for chv cgm csc
      drm/i915: Store ilk+ csc matrices in the crtc state
      drm/i915: Utilize crtc_state->csc on chv
      drm/i915: Sprinke a few sanity check WARNS during csc assignment
      drm/i915: Add hardware csc readout for ilk+
      drm/i915: Implement chv cgm csc readout
      drm/i915: Include the csc matrices in the crtc state dump
      drm/i915: Hook up csc into state checker
      drm/i915: Generalize planes_{enabling,disabling}()
      drm/i915/vrr: Eliminate redundant function arguments
      drm/i915/vrr: Make delayed vblank operational in VRR mode on adl/dg2
      drm/i915/vrr: Tell intel_crtc_update_active_timings() about VRR expli=
citly
      drm/i915/vrr: Relocate VRR enable/disable
      drm/i915/vrr: Allow VRR to be toggled during fastsets
      drm/i915: Flag purely internal commits to not clear crtc_state->inher=
ited
      drm/i915: Allow arbitrary refresh rates with VRR eDP panels
      drm/i915: Evade transcoder's vblank when doing seamless M/N changes
      drm/i915: Use min() instead of hand rolling it
      drm/i915: Make intel_get_crtc_new_encoder() less oopsy
      drm/i915: Make intel_{mpllb,c10pll}_state_verify() safer
      drm/i915: Introduce <platform>_hotplug_mask()
      drm/i915: Introduce intel_hpd_enable_detection()
      drm/i915: Check HPD live state during eDP probe
      drm/i915: Reuse <platform>_hotplug_mask() in .hpd_detection_setup()
      drm/i915: Check pipe source size when using skl+ scalers
      drm/i915: Relocate VBLANK_EVASION_TIME_US
      drm/i915: Relocate intel_atomic_setup_scalers()
      drm/i915: Relocate skl_get_pfit_config()
      drm/i915: Use REG_BIT() & co for the pre-ilk pfit registers
      drm/i915: Namespace pfit registers properly
      drm/i915: Use REG_BIT() & co. for ilk+ pfit registers
      drm/i915: Drop a useless forward declararion
      drm/i915: Fix up whitespace in some display chicken registers
      drm/i915: Clean up various display chicken registers
      drm/i915/psr: Clean up PSR register defininitions
      drm/i915/psr: Use intel_de_rmw()
      drm/i915/psr: Define more PSR mask bits
      drm/i915/psr: Add a FIXME for the PSR vs. AUX usage conflict
      drm/i915/psr: Include PSR_PERF_CNT in debugfs output on all platforms
      drm/i915/psr: Sprinkle cpu_transcoder variables around
      drm/uapi: Document CTM matrix better
      drm/i915: Define bitmasks for ilk pfit window pos/size
      drm/i915: Remove dead scaler register defines
      drm/i915: Rename skl+ scaler binding bits
      drm/i915: s/PS_COEE_INDEX_AUTO_INC/PS_COEF_INDEX_AUTO_INC/
      drm/i915: Define bitmasks for skl+ scaler window pos/size
      drm/i915: Use REG_BIT() & co. for pipe scaler registers
      drm/i915: Move has_hdmi_sink out from intel_hdmi_compute_config()
      drm/i915: Pick one HDMI port for infoframe/audio transmission on g4x
      drm/i915: Define more PS_CTRL bits
      drm/i915: Use REG_BIT() & co. for AUX CH registers
      drm/i915: Split map_aux_ch() into per-platform arrays
      drm/i915: Flip VBT DDC pin maps around
      drm/i915: Nuke intel_bios_is_port_dp_dual_mode()
      drm/i915: Expose crtc CTM property on ilk/snb
      drm/i915: Fix CHV CGM CSC coefficient sign handling
      drm/i915: Always enable CGM CSC on CHV
      drm/i915: Implement CTM property support for VLV
      drm/i915: No 10bit gamma on desktop gen3 parts

Vinay Belgaumkar (3):
      drm/i915/guc/slpc: Provide sysfs for efficient freq
      drm/i915/selftest: Update the SLPC selftest
      drm/i915/guc/slpc: Disable rps_boost debugfs

Vinod Govindapillai (6):
      drm/i915: fix the derating percentage for MTL
      drm/i915: update the QGV point frequency calculations
      drm/i915: store the peak bw per QGV point
      drm/i915: extract intel_bw_check_qgv_points()
      drm/i915: modify max_bw to return index to intel_bw_info
      drm/i915/mtl: find the best QGV point for the SAGV configuration

Wayne Lin (1):
      drm/dp_mst: Clear MSG_RDY flag before sending new message

Wesley Chalmers (3):
      drm/amd/display: Do not set drr on pipe commit
      drm/amd/display: Block optimize on consecutive FAMS enables
      drm/amd/display: Add logging for display MALL refresh setting

Wolfram Sang (1):
      drm: rcar-du: remove R-Car H3 ES1.* workarounds

Won Chung (2):
      drm/sysfs: Expose DRM connector id in each connector sysfs
      drm/sysfs: Link DRM connectors to corresponding Type-C connectors

Xiaogang Chen (1):
      drm/amdkfd: Fix an issue at userptr buffer validation process.

Xiaomeng Hou (1):
      drm/amdgpu: remove pasid_src field from IV entry

XuDong Liu (1):
      drm: sun4i_tcon: use devm_clk_get_enabled in `sun4i_tcon_init_clocks`

Yang Li (18):
      drm/tve200: Use devm_platform_ioremap_resource()
      drm/stm: dsi: Use devm_platform_ioremap_resource()
      drm/meson: Remove unneeded semicolon
      accel/habanalabs: Fix some kernel-doc comments
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amd/display: remove unused definition
      drm/amdkfd: clean up one inconsistent indenting

Yang Wang (4):
      drm/amd/pm: fix wrong smu socclk value
      drm/amd/pm: add unique serial number support for smu_v13_0_6
      drm/amdgpu: disable virtual display support on APP device
      drm/amdgpu: skip to resume rlcg for gc 9.4.3 in vf side

YiPeng Chai (2):
      drm/amdgpu: perform mode2 reset for sdma fed error on gfx v11_0_3
      drm/amdgpu: change reserved vram info print

Yifan Zhang (2):
      drm/amdgpu: set gfx9 onwards APU atomics support to be true
      drm/amdgpu: change gfx 11.0.4 external_id range

YuBiao Wang (2):
      drm/amdgpu: Enable mcbp under sriov by default
      drm/amdgpu: set default num_kcq to 2 under sriov

YuanShang (1):
      drm/amdgpu: Remove IMU ucode in vf2pf

ZhenGuo Yin (3):
      drm/amdgpu: set finished fence error if job timedout
      drm/amdgpu: add entity error check in amdgpu_ctx_get_entity
      drm/scheduler: avoid infinite loop if entity's dependency is a
scheduled error fence

Zhi Wang (1):
      drm/i915/gvt: remove unused variable gma_bottom in command parser

Zhongwei (1):
      drm/amd/display: fix dpms_off issue when disabling bios mode

hackyzh002 (2):
      drm/radeon: Fix integer overflow in radeon_cs_parser_init
      drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1

lyndonli (2):
      drm/amdgpu: Fix mode2 reset for sienna cichlid
      drm/amdgpu: Use the default reset when loading or reloading the drive=
r

shikaguo (1):
      drm/amd/pm: enable more Pstates profile levels for yellow_carp

 .mailmap                                           |     1 +
 .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    |   118 +
 .../bindings/display/amlogic,meson-vpu.yaml        |     5 +
 .../bindings/display/bridge/fsl,ldb.yaml           |     5 +-
 .../bindings/display/bridge/samsung,mipi-dsim.yaml |    35 +-
 .../bindings/display/bridge/toshiba,tc358762.yaml  |     3 +
 .../bindings/display/bridge/toshiba,tc358767.yaml  |    14 +-
 .../bindings/display/connector/hdmi-connector.yaml |     3 +
 .../devicetree/bindings/display/fsl,lcdif.yaml     |     7 +-
 .../bindings/display/mediatek/mediatek,aal.yaml    |     1 +
 .../bindings/display/mediatek/mediatek,color.yaml  |     1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |    23 +-
 .../bindings/display/mediatek/mediatek,dsi.yaml    |    19 +-
 .../bindings/display/mediatek/mediatek,gamma.yaml  |     4 +
 .../bindings/display/mediatek/mediatek,merge.yaml  |     3 +
 .../bindings/display/mediatek/mediatek,od.yaml     |     3 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |     4 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |     4 +
 .../bindings/display/mediatek/mediatek,split.yaml  |     3 +
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |     3 +
 .../bindings/display/mediatek/mediatek,wdma.yaml   |     3 +
 .../bindings/display/msm/dp-controller.yaml        |     1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |     6 +
 .../bindings/display/msm/dsi-phy-28nm.yaml         |     3 +-
 .../devicetree/bindings/display/msm/gmu.yaml       |    51 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |    61 +-
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |     1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |     1 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |    23 +-
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |   213 +
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |   215 +
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |     2 +-
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |     4 +
 .../bindings/display/panel/novatek,nt36523.yaml    |    16 +-
 .../bindings/display/panel/panel-simple.yaml       |     8 +
 .../display/panel/rocktech,jh057n00900.yaml        |     2 +
 .../bindings/display/panel/samsung,s6d7aa0.yaml    |    70 +
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |     4 +-
 Documentation/gpu/drm-usage-stats.rst              |    91 +-
 Documentation/gpu/rfc/index.rst                    |     4 +
 Documentation/gpu/rfc/xe.rst                       |   235 +
 Documentation/gpu/todo.rst                         |     7 +-
 Documentation/gpu/vkms.rst                         |     7 +-
 MAINTAINERS                                        |    14 +-
 arch/arc/include/asm/fb.h                          |    16 +-
 arch/arm/include/asm/fb.h                          |    15 +-
 arch/arm64/include/asm/fb.h                        |    15 +-
 arch/ia64/include/asm/fb.h                         |    27 +-
 arch/loongarch/include/asm/fb.h                    |    24 +-
 arch/m68k/include/asm/fb.h                         |    22 +-
 arch/mips/include/asm/fb.h                         |    28 +-
 arch/parisc/Makefile                               |     4 +-
 arch/parisc/include/asm/fb.h                       |    20 +-
 arch/parisc/video/Makefile                         |     3 +
 arch/parisc/video/fbdev.c                          |    26 +
 arch/powerpc/include/asm/fb.h                      |     8 +-
 arch/sh/include/asm/fb.h                           |    15 +-
 arch/sparc/Makefile                                |     1 +
 arch/sparc/include/asm/fb.h                        |    47 +-
 arch/sparc/video/Makefile                          |     3 +
 arch/sparc/video/fbdev.c                           |    23 +
 arch/x86/include/asm/fb.h                          |    21 +-
 arch/x86/video/fbdev.c                             |    28 +-
 drivers/accel/habanalabs/common/command_buffer.c   |     6 -
 .../accel/habanalabs/common/command_submission.c   |    61 +-
 drivers/accel/habanalabs/common/debugfs.c          |    60 +-
 drivers/accel/habanalabs/common/device.c           |   112 +-
 drivers/accel/habanalabs/common/firmware_if.c      |   212 +-
 drivers/accel/habanalabs/common/habanalabs.h       |    77 +-
 drivers/accel/habanalabs/common/habanalabs_drv.c   |     9 +-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |    35 +-
 drivers/accel/habanalabs/common/irq.c              |     2 +-
 drivers/accel/habanalabs/common/memory.c           |   104 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          |    56 +-
 drivers/accel/habanalabs/common/security.c         |    57 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |    13 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |   334 +-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |     2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c  |    15 +-
 drivers/accel/habanalabs/goya/goya.c               |     3 -
 drivers/accel/habanalabs/goya/goya_coresight.c     |     9 +-
 drivers/accel/habanalabs/include/common/cpucp_if.h |    22 +-
 .../accel/habanalabs/include/common/hl_boot_if.h   |    41 +-
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |    11 +
 .../accel/habanalabs/include/gaudi2/gaudi2_fw_if.h |     2 +-
 drivers/auxdisplay/cfag12864bfb.c                  |     2 +-
 drivers/auxdisplay/ht16k33.c                       |     2 +-
 drivers/dma-buf/dma-resv.c                         |     2 +-
 drivers/dma-buf/sw_sync.c                          |     2 +-
 drivers/firmware/sysfb.c                           |     2 +-
 drivers/gpu/drm/Kconfig                            |    14 +-
 drivers/gpu/drm/Makefile                           |     4 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    10 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   407 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    82 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    60 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   154 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   123 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |   384 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   325 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |    55 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |   182 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |   210 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   470 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |    68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   171 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    38 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.h            |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   243 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   305 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   350 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |    44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c       |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h         |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    52 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   141 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   372 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   142 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    63 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |    28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    24 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |    23 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |     9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   187 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   246 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   261 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |    20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   116 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |    18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   330 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umr.h            |    36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    83 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    59 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   237 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    67 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |   399 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   182 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    51 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |     1 -
 .../gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c    |   658 ++
 drivers/gpu/drm/amd/amdgpu/cik.c                   |     4 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |     2 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   278 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   312 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |    14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |    33 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |    51 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   114 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   194 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.h              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |    24 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |    34 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  4313 +++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h            |     5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   850 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    12 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |    10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |    10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    57 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    46 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |     5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |     5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   616 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |    15 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    17 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    23 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    17 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    19 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  1074 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |    51 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    36 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    59 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   915 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |    10 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |    12 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v3_0.h            |     4 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |     4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   118 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    14 +-
 drivers/gpu/drm/amd/amdgpu/nvd.h                   |     5 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     9 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.h             |     2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |     2 -
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     2 -
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    32 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4.c             |     4 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   491 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.h           |     2 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |     4 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |     2 -
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.c         |   103 +
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    87 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |     6 +-
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |    69 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    14 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |     2 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |     6 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |     3 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |     2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    16 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  1541 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.h            |    29 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    10 +-
 drivers/gpu/drm/amd/amdkfd/Makefile                |     4 +-
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   460 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    83 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |     8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |  1118 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |   123 +
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   481 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  1031 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |    35 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |    14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    93 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.h            |     1 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   405 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |    29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   108 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |    64 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |    31 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |    18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h      |     2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    85 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |     9 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    40 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |    17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |    14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |    32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    83 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   423 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |    19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |    34 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |    86 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c |     4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h    |    73 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   320 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   283 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    98 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    54 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |    22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   303 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   213 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    14 +-
 drivers/gpu/drm/amd/amdxcp/Makefile                |    25 +
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |   110 +
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.h        |    29 +
 drivers/gpu/drm/amd/display/Kconfig                |    19 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   231 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     4 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    31 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |     2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   196 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    36 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |     5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |     6 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |    25 +-
 .../amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c |    20 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |    10 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |    58 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |    22 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    73 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |    17 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |    36 +-
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |     3 +
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |    50 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    42 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |     2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    58 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |     2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    42 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    53 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    71 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   436 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   375 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    35 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    38 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    40 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   310 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    15 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |     9 +-
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |     1 +
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |    90 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     9 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    11 +-
 drivers/gpu/drm/amd/display/dc/dce/Makefile        |     2 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    38 -
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |     8 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   258 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |   252 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |    46 +
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |     4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c   |     4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    30 +-
 .../drm/amd/display/dc/dce100/dce100_resource.c    |     5 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    11 +-
 .../drm/amd/display/dc/dce110/dce110_resource.c    |     5 +
 .../amd/display/dc/dce112/dce112_hw_sequencer.c    |     3 -
 .../drm/amd/display/dc/dce112/dce112_resource.c    |     5 +
 .../amd/display/dc/dce120/dce120_hw_sequencer.c    |     3 -
 .../drm/amd/display/dc/dce120/dce120_resource.c    |     1 +
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |     2 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   157 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.h  |     1 -
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |     9 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |    20 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    80 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |    29 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |    28 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |    11 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    96 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.h |     5 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |    34 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |    39 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |    83 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |     2 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_optc.c    |     7 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |    13 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |     7 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |    68 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c  |     6 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    34 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |    38 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |    15 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    70 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    17 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    34 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |     2 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    34 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    31 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    30 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |     8 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     8 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |     1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   121 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |     7 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |     4 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    45 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    16 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |     5 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    42 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |     4 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |     8 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |    63 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   165 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |    45 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    21 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h  |     5 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |    88 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |    20 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h  |     1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |    51 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    22 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   221 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |    55 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h       |     9 +
 drivers/gpu/drm/amd/display/dc/dm_services_types.h |     6 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     5 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    66 +-
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |     2 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    15 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |     6 +-
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |     4 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |    70 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   244 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |     3 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    45 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    11 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |    22 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    65 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    34 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   555 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |     2 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    16 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |     2 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    20 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |     2 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   504 +-
 .../drm/amd/display/dc/dml/display_mode_enums.h    |     8 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |     1 -
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |     1 -
 .../drm/amd/display/dc/dml/display_mode_structs.h  |     3 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    12 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    12 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    14 +
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |     4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |     1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |     4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     3 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |   167 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     4 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |    83 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |     4 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   225 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |     6 +-
 .../display/dc/link/protocols/link_dp_capability.c |    36 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |     2 +-
 .../display/dc/link/protocols/link_dp_training.c   |    17 +-
 .../dc/link/protocols/link_dp_training_128b_132b.c |    10 +-
 .../dc/link/protocols/link_dp_training_8b_10b.c    |     4 +
 .../link_dp_training_fixed_vs_pe_retimer.c         |    23 +-
 .../dc/link/protocols/link_edp_panel_control.c     |    29 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    18 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    40 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |     5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h  |     2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.c  |     6 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn21.h  |     4 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     5 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |     2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.c |    62 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.h |    33 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    16 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |     3 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    47 +-
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |     2 +-
 drivers/gpu/drm/amd/display/include/signal_types.h |    28 +
 .../drm/amd/display/modules/freesync/freesync.c    |    15 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    43 +
 .../drm/amd/display/modules/power/power_helpers.h  |     3 +
 drivers/gpu/drm/amd/include/amd_shared.h           |     1 -
 .../drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h |    14 +
 .../amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h    |    69 +
 .../drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h |    10 +
 .../amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h    |     4 +
 .../amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h    |     4 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_offset.h  |   192 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_3_sh_mask.h |  1112 ++
 .../include/asic_reg/mmhub/mmhub_1_8_0_offset.h    |    56 +-
 .../include/asic_reg/mmhub/mmhub_1_8_0_sh_mask.h   |   325 +-
 .../amd/include/asic_reg/nbio/nbio_7_9_0_offset.h  |     2 +
 .../amd/include/asic_reg/sdma/sdma_4_4_2_offset.h  |     4 +
 .../amd/include/asic_reg/sdma/sdma_4_4_2_sh_mask.h |    24 +
 .../include/asic_reg/smuio/smuio_13_0_3_offset.h   |   177 +
 .../include/asic_reg/smuio/smuio_13_0_3_sh_mask.h  |   428 +
 .../amd/include/asic_reg/vcn/vcn_4_0_3_offset.h    |  2332 ++++
 .../amd/include/asic_reg/vcn/vcn_4_0_3_sh_mask.h   | 10919 +++++++++++++++=
++++
 drivers/gpu/drm/amd/include/atomfirmware.h         |     1 +
 drivers/gpu/drm/amd/include/discovery.h            |    32 +-
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    59 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    22 +-
 drivers/gpu/drm/amd/include/v9_structs.h           |    30 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    68 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h   |    16 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |     6 +-
 .../drm/amd/pm/powerplay/hwmgr/smu7_powertune.c    |    12 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_powertune.c  |    36 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    10 +-
 .../swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h  |     2 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    51 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_4.h |     2 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_5.h |     2 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_6.h |    15 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |    31 +-
 .../inc/pmfw_if/smu13_driver_if_yellow_carp.h      |     2 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |    17 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |     3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    14 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |    16 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    52 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   492 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |    95 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    81 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.h   |     2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   396 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   488 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   142 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h   |     1 -
 drivers/gpu/drm/arm/hdlcd_drv.c                    |     2 +-
 drivers/gpu/drm/armada/Kconfig                     |     1 +
 drivers/gpu/drm/armada/Makefile                    |     3 +-
 drivers/gpu/drm/armada/armada_drm.h                |    10 +-
 drivers/gpu/drm/armada/armada_drv.c                |    14 +-
 drivers/gpu/drm/armada/armada_fb.c                 |     1 -
 drivers/gpu/drm/armada/armada_fbdev.c              |   126 +-
 drivers/gpu/drm/bridge/Kconfig                     |     1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |     2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |     2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |     2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   131 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |     2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |     2 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |     2 +-
 drivers/gpu/drm/bridge/display-connector.c         |    61 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |    14 +-
 drivers/gpu/drm/bridge/imx/Kconfig                 |     5 +
 drivers/gpu/drm/bridge/imx/Makefile                |     5 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |    17 +
 .../bridge/imx/{imx8qm-ldb-drv.c =3D> imx8qm-ldb.c}  |     0
 .../imx/{imx8qxp-ldb-drv.c =3D> imx8qxp-ldb.c}       |     0
 drivers/gpu/drm/bridge/ite-it6505.c                |     5 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |     2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |     2 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |     6 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |     6 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |     2 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |     4 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |     2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |     2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |     2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   194 +-
 drivers/gpu/drm/bridge/sii902x.c                   |     2 +-
 drivers/gpu/drm/bridge/sii9234.c                   |     2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |     2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |     2 +-
 drivers/gpu/drm/bridge/tc358762.c                  |    15 +
 drivers/gpu/drm/bridge/tc358767.c                  |   201 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    99 +-
 drivers/gpu/drm/bridge/tc358775.c                  |     2 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |     2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |    22 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    21 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |     2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   109 +-
 drivers/gpu/drm/display/drm_dsc_helper.c           |  1065 ++
 drivers/gpu/drm/drm_aperture.c                     |    11 +-
 drivers/gpu/drm/drm_atomic.c                       |     1 +
 drivers/gpu/drm/drm_atomic_helper.c                |    13 +-
 drivers/gpu/drm/drm_connector.c                    |   189 +-
 drivers/gpu/drm/drm_drv.c                          |     4 +-
 drivers/gpu/drm/drm_edid.c                         |    38 +
 drivers/gpu/drm/drm_fb_helper.c                    |   402 +-
 drivers/gpu/drm/drm_fbdev_dma.c                    |    11 +-
 drivers/gpu/drm/drm_fbdev_generic.c                |    11 +-
 drivers/gpu/drm/drm_file.c                         |   132 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |     9 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |     6 +-
 drivers/gpu/drm/drm_sysfs.c                        |    51 +
 drivers/gpu/drm/exynos/Kconfig                     |     1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |     9 +-
 drivers/gpu/drm/gma500/Kconfig                     |     1 +
 drivers/gpu/drm/gma500/fbdev.c                     |    10 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |    43 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |     1 -
 drivers/gpu/drm/i2c/tda9950.c                      |     2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |     2 +-
 drivers/gpu/drm/i915/Kconfig                       |     1 +
 drivers/gpu/drm/i915/Kconfig.debug                 |     1 +
 drivers/gpu/drm/i915/Makefile                      |    21 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |     4 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   113 +
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |     4 +
 drivers/gpu/drm/i915/display/i9xx_plane.c          |     5 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |     4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.h             |     1 -
 drivers/gpu/drm/i915/display/icl_dsi.c             |     1 +
 drivers/gpu/drm/i915/display/intel_atomic.c        |   259 +-
 drivers/gpu/drm/i915/display/intel_atomic.h        |     4 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |     3 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |     1 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   251 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |     2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   348 +-
 drivers/gpu/drm/i915/display/intel_bw.h            |     6 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   181 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |     1 +
 drivers/gpu/drm/i915/display/intel_color.c         |   725 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    22 +-
 drivers/gpu/drm/i915/display/intel_connector.h     |     4 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    55 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    20 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |    10 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    54 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |     4 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  3046 ++++++
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    50 +
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   274 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   502 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |    80 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  1308 +--
 drivers/gpu/drm/i915/display/intel_display.h       |    69 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |    19 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    27 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   917 ++
 .../gpu/drm/i915/display/intel_display_device.h    |   129 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   590 +
 .../gpu/drm/i915/display/intel_display_driver.h    |    36 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  1687 +++
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    81 +
 drivers/gpu/drm/i915/display/intel_display_power.c |    66 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |     3 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |    92 +-
 .../drm/i915/display/intel_display_power_well.c    |     5 +-
 .../drm/i915/display/intel_display_power_well.h    |     2 +
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |    14 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |   135 +
 drivers/gpu/drm/i915/display/intel_display_reset.h |    14 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |     1 -
 drivers/gpu/drm/i915/display/intel_display_types.h |    73 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |     9 +
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |     1 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |     2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   370 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |     4 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    45 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |     3 +
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |    62 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   436 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |    17 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |    41 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    92 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |     3 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |    14 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |     4 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |     1 +
 drivers/gpu/drm/i915/display/intel_fb.c            |    54 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |     2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    15 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |    60 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |     9 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |     2 +
 drivers/gpu/drm/i915/display/intel_global_state.c  |    12 +
 drivers/gpu/drm/i915/display/intel_global_state.h  |     2 +
 drivers/gpu/drm/i915/display/intel_gmbus.c         |     5 +
 drivers/gpu/drm/i915/display/intel_gmbus.h         |     2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   815 +-
 drivers/gpu/drm/i915/display/intel_hdcp.h          |    12 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |    18 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   127 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |     9 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    19 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |  1442 +++
 drivers/gpu/drm/i915/display/intel_hotplug_irq.h   |    35 +
 drivers/gpu/drm/i915/display/intel_hti.c           |     2 +-
 drivers/gpu/drm/i915/display/intel_load_detect.c   |   225 +
 drivers/gpu/drm/i915/display/intel_load_detect.h   |    20 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |    16 +-
 drivers/gpu/drm/i915/display/intel_modeset_lock.c  |    50 +
 drivers/gpu/drm/i915/display/intel_modeset_lock.h  |    33 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   356 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    36 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |     3 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    16 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   113 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    20 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |     1 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |     4 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   620 ++
 drivers/gpu/drm/i915/display/intel_pmdemand.h      |    67 +
 drivers/gpu/drm/i915/display/intel_pps.c           |    20 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   269 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |   207 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   108 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |     7 +-
 drivers/gpu/drm/i915/display/intel_sprite.h        |    10 -
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |     1 +
 drivers/gpu/drm/i915/display/intel_tc.c            |   414 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |     5 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |    20 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |    15 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |     3 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   443 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |    64 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    10 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   314 +-
 drivers/gpu/drm/i915/display/skl_scaler.h          |    12 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    27 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |    10 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |     7 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |     6 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    40 +
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |    61 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    18 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   148 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.h           |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    66 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    10 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    68 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |     5 +-
 drivers/gpu/drm/i915/gem/i915_gem_region.h         |     4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |    11 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |     2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    12 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |     3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |    13 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |   108 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |    18 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |     2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |     2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c               |    10 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |    38 +
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |    84 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h               |     3 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |     5 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |     8 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |     2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |     2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |     4 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |     1 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |     2 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |     5 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   111 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |     8 +-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c     |    10 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |    28 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |     6 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |     5 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    19 +-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |    10 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |    35 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |    47 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    36 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |     4 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |    51 +-
 drivers/gpu/drm/i915/gt/intel_migrate.h            |    13 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    70 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c              |     4 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   167 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |     9 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    22 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    56 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |     2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |     3 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |    47 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |     3 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |     8 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |     1 +
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |    42 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c        |     2 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |    15 +-
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |    21 -
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |     1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h  |    30 +
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h      |    20 +-
 .../gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h  |    74 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |    37 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h          |     1 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |   424 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h       |    18 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c          |   102 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h          |    17 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |   104 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h  |    27 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |     1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    36 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |   268 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h     |     3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   140 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |    17 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |    44 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |    40 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |     1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |     1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    75 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |   225 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |    26 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |   235 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h          |     6 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h       |    21 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    26 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h              |     3 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   367 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |    26 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |     6 -
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |     2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |     6 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |    10 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |     2 +-
 drivers/gpu/drm/i915/i915_active.h                 |    14 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    52 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   115 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |    71 +-
 drivers/gpu/drm/i915/i915_drm_client.h             |    24 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   477 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    33 +-
 drivers/gpu/drm/i915/i915_getparam.c               |    13 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   153 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |    10 +
 drivers/gpu/drm/i915/i915_hwmon.c                  |    91 +-
 drivers/gpu/drm/i915/i915_hwmon.h                  |     7 +
 drivers/gpu/drm/i915/i915_irq.c                    |  3111 +-----
 drivers/gpu/drm/i915/i915_irq.h                    |    48 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   455 +-
 drivers/gpu/drm/i915/i915_perf.c                   |    93 +-
 drivers/gpu/drm/i915/i915_perf_oa_regs.h           |     4 -
 drivers/gpu/drm/i915/i915_perf_types.h             |    12 -
 drivers/gpu/drm/i915/i915_pmu.c                    |   294 +-
 drivers/gpu/drm/i915/i915_pmu.h                    |    28 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   539 +-
 drivers/gpu/drm/i915/i915_reg_defs.h               |   105 +
 drivers/gpu/drm/i915/i915_request.c                |     2 +-
 drivers/gpu/drm/i915/i915_request.h                |    52 +-
 drivers/gpu/drm/i915/i915_scatterlist.h            |     9 +-
 drivers/gpu/drm/i915/i915_utils.h                  |     2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |    18 +-
 drivers/gpu/drm/i915/i915_vma.h                    |     4 +-
 drivers/gpu/drm/i915/i915_vma_resource.h           |    46 +-
 drivers/gpu/drm/i915/i915_vma_types.h              |     2 -
 drivers/gpu/drm/i915/intel_clock_gating.c          |     5 +-
 drivers/gpu/drm/i915/intel_device_info.c           |   209 +-
 drivers/gpu/drm/i915/intel_device_info.h           |    74 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |     2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |     6 -
 drivers/gpu/drm/i915/intel_step.c                  |     8 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |    22 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |    12 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |   102 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |     2 +
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |    41 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |     6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |   444 +
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h         |    43 +
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |     2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c            |     3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h          |    27 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    25 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |     2 -
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    24 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c          |     5 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c    |     8 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |    17 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |     2 +-
 drivers/gpu/drm/i915/selftests/i915_sw_fence.c     |    16 +-
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |    47 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |     4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    16 +
 drivers/gpu/drm/i915/selftests/mock_gtt.c          |     8 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |     4 +-
 drivers/gpu/drm/meson/Kconfig                      |     7 +
 drivers/gpu/drm/meson/Makefile                     |     3 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    64 +-
 drivers/gpu/drm/meson/meson_drv.h                  |     1 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   352 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h          |   160 +
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |   174 +
 drivers/gpu/drm/meson/meson_encoder_dsi.h          |    13 +
 drivers/gpu/drm/meson/meson_registers.h            |    25 +
 drivers/gpu/drm/meson/meson_venc.c                 |   244 +-
 drivers/gpu/drm/meson/meson_venc.h                 |     6 +
 drivers/gpu/drm/meson/meson_vpp.h                  |     2 +
 drivers/gpu/drm/msm/Kconfig                        |     1 +
 drivers/gpu/drm/msm/Makefile                       |     2 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c          |     2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |     3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   128 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |     6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   622 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |     4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    14 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |    33 +
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    31 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |     8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   154 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |    46 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |    51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |    42 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |    78 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |    42 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |    24 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |    13 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   173 +
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |    13 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   138 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |    44 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |    47 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |    63 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |    52 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |    37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |     7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   287 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    28 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   259 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    20 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    58 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   141 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    98 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    76 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |    55 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |    24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   387 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |    38 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |    12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   184 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |     6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   335 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |    10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    51 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |    33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |    14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   125 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |    78 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   362 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |    66 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |    50 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |    52 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |    32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |    33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |    11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    86 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |    45 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   139 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   167 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    68 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |    14 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |    82 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |     2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |     1 -
 drivers/gpu/drm/msm/dp/dp_debug.c                  |     6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |     5 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    50 +-
 drivers/gpu/drm/msm/dp/dp_hpd.c                    |    67 -
 drivers/gpu/drm/msm/dp/dp_hpd.h                    |    78 -
 drivers/gpu/drm/msm/dp/dp_panel.h                  |     1 -
 drivers/gpu/drm/msm/dp/dp_power.c                  |    78 +-
 drivers/gpu/drm/msm/dp/dp_power.h                  |     3 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |     2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |     1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   177 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    68 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |     2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |     3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |     3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |    97 +
 drivers/gpu/drm/msm/msm_debugfs.c                  |     6 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    15 +-
 drivers/gpu/drm/msm/msm_dsc_helper.h               |    38 +
 drivers/gpu/drm/msm/msm_fbdev.c                    |    43 +-
 drivers/gpu/drm/msm/msm_gem.c                      |    15 +
 drivers/gpu/drm/msm/msm_gem_submit.c               |     7 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     6 -
 drivers/gpu/drm/msm/msm_mdss.c                     |    10 +
 drivers/gpu/drm/msm/msm_rd.c                       |    24 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    73 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.h                  |     3 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   201 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    13 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |    19 +-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c            |     2 +-
 drivers/gpu/drm/nouveau/nv50_display.h             |     4 +-
 .../drm/nouveau/nvkm/subdev/bios/power_budget.c    |     3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |     2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c    |     2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c     |     7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c |     2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c |     2 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |     1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    11 +-
 drivers/gpu/drm/panel/Kconfig                      |     7 +
 drivers/gpu/drm/panel/Makefile                     |     1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   876 +-
 drivers/gpu/drm/panel/panel-edp.c                  |    10 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |    16 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |   569 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |     2 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |     2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |   585 +
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |    43 +-
 drivers/gpu/drm/panel/panel-simple.c               |   135 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   102 +-
 drivers/gpu/drm/radeon/Kconfig                     |     1 +
 drivers/gpu/drm/radeon/ci_dpm.c                    |    28 +-
 drivers/gpu/drm/radeon/cypress_dpm.c               |     8 +-
 drivers/gpu/drm/radeon/ni_dpm.c                    |     8 +-
 drivers/gpu/drm/radeon/r100.c                      |     8 +-
 drivers/gpu/drm/radeon/r300.c                      |     2 +-
 drivers/gpu/drm/radeon/r420.c                      |     2 +-
 drivers/gpu/drm/radeon/r600.c                      |     2 +-
 drivers/gpu/drm/radeon/radeon_acpi.h               |     9 +
 drivers/gpu/drm/radeon/radeon_atpx_handler.c       |     2 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |     3 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |     9 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |     2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |     2 +-
 drivers/gpu/drm/radeon/radeon_ib.c                 |     2 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |     2 +-
 drivers/gpu/drm/radeon/radeon_ring.c               |     2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |     3 +-
 drivers/gpu/drm/radeon/rs400.c                     |     2 +-
 drivers/gpu/drm/radeon/rv515.c                     |     4 +-
 drivers/gpu/drm/radeon/rv740_dpm.c                 |     8 +-
 drivers/gpu/drm/renesas/Kconfig                    |     4 +
 drivers/gpu/drm/renesas/Makefile                   |     4 +
 drivers/gpu/drm/{ =3D> renesas}/rcar-du/Kconfig      |     0
 drivers/gpu/drm/{ =3D> renesas}/rcar-du/Makefile     |     0
 drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_cmm.c   |     0
 drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_cmm.h   |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_crtc.c   |    37 +-
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_crtc.h   |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_drv.c    |    48 -
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_drv.h    |     2 -
 .../drm/{ =3D> renesas}/rcar-du/rcar_du_encoder.c    |     0
 .../drm/{ =3D> renesas}/rcar-du/rcar_du_encoder.h    |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_group.c  |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_group.h  |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_kms.c    |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_kms.h    |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_plane.c  |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_plane.h  |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_regs.h   |     3 +-
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_vsp.c    |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_vsp.h    |     0
 .../drm/{ =3D> renesas}/rcar-du/rcar_du_writeback.c  |     0
 .../drm/{ =3D> renesas}/rcar-du/rcar_du_writeback.h  |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_dw_hdmi.c   |     0
 drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.c  |     0
 drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.h  |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds_regs.h |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.c  |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.h  |     0
 .../drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi_regs.h |     0
 .../gpu/drm/{ =3D> renesas}/rcar-du/rzg2l_mipi_dsi.c |     0
 .../{ =3D> renesas}/rcar-du/rzg2l_mipi_dsi_regs.h    |     0
 drivers/gpu/drm/{ =3D> renesas}/shmobile/Kconfig     |     4 +-
 drivers/gpu/drm/{ =3D> renesas}/shmobile/Makefile    |     0
 .../{ =3D> renesas}/shmobile/shmob_drm_backlight.c   |     0
 .../{ =3D> renesas}/shmobile/shmob_drm_backlight.h   |     0
 .../drm/{ =3D> renesas}/shmobile/shmob_drm_crtc.c    |    35 +-
 .../drm/{ =3D> renesas}/shmobile/shmob_drm_crtc.h    |     0
 .../gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_drv.c |     3 +
 .../gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_drv.h |     0
 .../gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_kms.c |     9 +-
 .../gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_kms.h |     0
 .../drm/{ =3D> renesas}/shmobile/shmob_drm_plane.c   |     5 +
 .../drm/{ =3D> renesas}/shmobile/shmob_drm_plane.h   |     0
 .../drm/{ =3D> renesas}/shmobile/shmob_drm_regs.h    |     0
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |     5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |     2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |     8 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |    55 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |     4 +-
 drivers/gpu/drm/scheduler/sched_main.c             |    37 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |     2 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |     6 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |     2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |    11 +-
 drivers/gpu/drm/sti/sti_hdmi.h                     |     2 -
 drivers/gpu/drm/stm/drv.c                          |     2 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |     4 +-
 drivers/gpu/drm/stm/ltdc.c                         |     4 +-
 drivers/gpu/drm/sun4i/Makefile                     |     2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |     2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |    65 +-
 .../sun4i/{sun4i_dotclock.c =3D> sun4i_tcon_dclk.c}  |     2 +-
 .../sun4i/{sun4i_dotclock.h =3D> sun4i_tcon_dclk.h}  |     0
 drivers/gpu/drm/tegra/Kconfig                      |     1 +
 drivers/gpu/drm/tegra/drm.c                        |     2 +-
 drivers/gpu/drm/tegra/fbdev.c                      |     8 +-
 drivers/gpu/drm/tests/drm_rect_test.c              |   315 +
 drivers/gpu/drm/ttm/ttm_device.c                   |     4 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |    14 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |     7 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |     4 +-
 drivers/gpu/drm/udl/udl_main.c                     |     2 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |     3 +
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c        |     4 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |     7 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |     2 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |    65 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |    17 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   338 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    25 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |    16 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |     3 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |    12 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |    14 +-
 drivers/gpu/drm/virtio/Makefile                    |     2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |     4 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   182 -
 drivers/gpu/drm/virtio/virtgpu_submit.c            |   311 +
 drivers/gpu/drm/vkms/vkms_composer.c               |    38 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |     5 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |     6 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |     6 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |   145 +-
 drivers/gpu/drm/vkms/vkms_formats.h                |     2 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |    50 +-
 drivers/gpu/ipu-v3/ipu-prv.h                       |     1 +
 drivers/hid/hid-picolcd_fb.c                       |     4 +-
 drivers/media/pci/ivtv/ivtvfb.c                    |     4 +-
 drivers/misc/mei/Kconfig                           |     2 +-
 drivers/misc/mei/Makefile                          |     1 +
 drivers/misc/mei/gsc_proxy/Kconfig                 |    14 +
 drivers/misc/mei/gsc_proxy/Makefile                |     7 +
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c         |   208 +
 drivers/misc/mei/hdcp/mei_hdcp.c                   |    26 +-
 drivers/staging/sm750fb/sm750.c                    |     2 +-
 drivers/video/Kconfig                              |     7 +
 drivers/video/Makefile                             |     1 +
 drivers/video/aperture.c                           |    70 +-
 drivers/video/console/Kconfig                      |     1 +
 drivers/video/console/Makefile                     |     4 +-
 drivers/video/console/sticon.c                     |     6 +-
 drivers/video/fbdev/Kconfig                        |    24 +-
 drivers/video/fbdev/arcfb.c                        |    12 +-
 drivers/video/fbdev/aty/atyfb.h                    |     2 +
 drivers/video/fbdev/aty/mach64_cursor.c            |     2 +-
 drivers/video/fbdev/au1200fb.c                     |     2 +-
 drivers/video/fbdev/broadsheetfb.c                 |    16 +-
 drivers/video/fbdev/chipsfb.c                      |     2 +-
 drivers/video/fbdev/cobalt_lcdfb.c                 |     6 +
 drivers/video/fbdev/core/Makefile                  |     2 +-
 drivers/video/fbdev/core/fb_io_fops.c              |   133 +
 drivers/video/fbdev/core/fb_sys_fops.c             |    36 +-
 drivers/video/fbdev/core/fbcon.c                   |     1 -
 drivers/video/fbdev/core/fbmem.c                   |   113 +-
 drivers/video/fbdev/hecubafb.c                     |    12 +-
 drivers/video/fbdev/hitfb.c                        |   122 +-
 drivers/video/fbdev/hyperv_fb.c                    |     2 +-
 drivers/video/fbdev/kyro/fbdev.c                   |     2 +-
 drivers/video/fbdev/matrox/matroxfb_accel.c        |     6 +-
 drivers/video/fbdev/matrox/matroxfb_base.h         |     4 +-
 drivers/video/fbdev/metronomefb.c                  |    16 +-
 drivers/video/fbdev/ps3fb.c                        |     4 +-
 drivers/video/fbdev/pvr2fb.c                       |     5 +-
 drivers/video/fbdev/sm712fb.c                      |    10 +-
 drivers/video/fbdev/smscufx.c                      |    14 +-
 drivers/video/fbdev/ssd1307fb.c                    |     3 +
 drivers/video/fbdev/sstfb.c                        |     2 +-
 drivers/video/fbdev/stifb.c                        |     6 +-
 drivers/video/fbdev/tdfxfb.c                       |     2 +-
 drivers/video/fbdev/udlfb.c                        |    12 +-
 drivers/video/fbdev/vfb.c                          |     2 +-
 drivers/video/fbdev/wmt_ge_rops.c                  |     2 +
 drivers/video/fbdev/xen-fbfront.c                  |     2 +-
 drivers/video/{console =3D> }/sticore.c              |   123 +-
 include/asm-generic/fb.h                           |   126 +-
 include/drm/bridge/samsung-dsim.h                  |     6 +
 include/drm/display/drm_dp.h                       |     5 +-
 include/drm/display/drm_dp_mst_helper.h            |    21 +-
 include/drm/display/drm_dsc_helper.h               |    13 +
 include/drm/drm_aperture.h                         |     7 +-
 include/drm/drm_connector.h                        |   142 +-
 include/drm/drm_drv.h                              |     7 +
 include/drm/drm_edid.h                             |     2 +
 include/drm/drm_fb_helper.h                        |    83 +-
 include/drm/drm_file.h                             |    32 +
 include/drm/drm_fixed.h                            |     6 +
 include/drm/drm_gem.h                              |    32 +
 include/drm/gpu_scheduler.h                        |     7 +-
 include/drm/i915_component.h                       |     3 +-
 include/drm/i915_drm.h                             |     2 +-
 include/drm/i915_gsc_proxy_mei_interface.h         |    53 +
 include/drm/i915_hdcp_interface.h                  |     4 +-
 include/drm/ttm/ttm_device.h                       |     4 +-
 include/drm/ttm/ttm_pool.h                         |     4 +-
 include/drm/ttm/ttm_tt.h                           |     2 +-
 include/linux/aperture.h                           |    16 +-
 include/linux/fb.h                                 |   177 +-
 include/linux/pci_ids.h                            |     3 +
 include/uapi/drm/amdgpu_drm.h                      |    22 +
 include/uapi/drm/drm_fourcc.h                      |    43 +
 include/uapi/drm/drm_mode.h                        |     5 +
 include/uapi/drm/habanalabs_accel.h                |    10 +
 include/uapi/drm/i915_drm.h                        |    95 +-
 include/uapi/linux/kfd_ioctl.h                     |   682 +-
 include/uapi/linux/kfd_sysfs.h                     |    15 +
 {drivers/video/fbdev =3D> include/video}/sticore.h   |    16 +-
 1245 files changed, 80695 insertions(+), 23104 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/amlogic,meson-g12a-dw-mipi-dsi.ya=
ml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 create mode 100644 Documentation/gpu/rfc/xe.rst
 create mode 100644 arch/parisc/video/Makefile
 create mode 100644 arch/parisc/video/fbdev.c
 create mode 100644 arch/sparc/video/Makefile
 create mode 100644 arch/sparc/video/fbdev.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_debug.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_debug.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
 create mode 100644 drivers/gpu/drm/amd/amdxcp/Makefile
 create mode 100644 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c
 create mode 100644 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn314.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_13_0_3_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_13_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_3_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_3_sh_m=
ask.h
 rename drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c =3D> imx8qm-ldb.c} (10=
0%)
 rename drivers/gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c =3D> imx8qxp-ldb.c} (=
100%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_phy.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_device.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_device.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_irq.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_irq.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_reset.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_reset.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hotplug_irq.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hotplug_irq.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_load_detect.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_load_detect.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_lock.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_lock.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pmdemand.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pmdemand.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
 create mode 100644 drivers/gpu/drm/msm/msm_dsc_helper.h
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
 create mode 100644 drivers/gpu/drm/renesas/Kconfig
 create mode 100644 drivers/gpu/drm/renesas/Makefile
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/Kconfig (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/Makefile (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_cmm.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_cmm.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_crtc.c (96%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_crtc.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_drv.c (93%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_drv.h (96%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_encoder.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_encoder.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_group.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_group.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_kms.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_kms.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_plane.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_plane.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_regs.h (99%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_vsp.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_vsp.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_writeback.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_du_writeback.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_dw_hdmi.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds_regs.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi_regs.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rzg2l_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/rcar-du/rzg2l_mipi_dsi_regs.h (100%=
)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/Kconfig (79%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/Makefile (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_backlight.c (100=
%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_backlight.h (100=
%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_crtc.c (95%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_crtc.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_drv.c (99%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_drv.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_kms.c (94%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_kms.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_plane.c (98%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_plane.h (100%)
 rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_regs.h (100%)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.c =3D> sun4i_tcon_dclk.c} (99=
%)
 rename drivers/gpu/drm/sun4i/{sun4i_dotclock.h =3D> sun4i_tcon_dclk.h} (10=
0%)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_submit.c
 create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
 create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
 create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
 create mode 100644 drivers/video/fbdev/core/fb_io_fops.c
 rename drivers/video/{console =3D> }/sticore.c (95%)
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h
 rename {drivers/video/fbdev =3D> include/video}/sticore.h (99%)
