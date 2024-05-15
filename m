Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3CD8C60C1
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 08:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FD810E094;
	Wed, 15 May 2024 06:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VfoK1Msb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A0710E238
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 06:21:12 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-574d1a1c36aso1201803a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715754071; x=1716358871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cuvIls99d62BZkMz/67FnalWqEQalX6SJknJemymH8o=;
 b=VfoK1MsbhM8IYXk2TJMX6XsOtMti2vyL2JpoIc6fTUz8o0Z7+CBcEd0OiddL3ehvIJ
 CHdb0CQ+jMdC80TGMA+7XJk9q7NnL4pjoE7QJSNrPs4If65fMj8YSxssMKl2zs7+rOWd
 qq5wHUWTZ85dziGUjUHIu3YSUX2d8LSP8xgjTVBfCDLd/yslmkPQTbuHl1HvZ67uydSg
 Lpw/IFrR3eTX6Vt623G0MTYkpTOUsTLNvvan+ggf/q2Rh1i3ufNgAI8H+gD2a1CpEJsy
 JT7eh7zMCFaKKB82m+EXRTK637wZ7myQIMvXkGMLK4i4kl3dagZkamB5Gn3sOXVUthu1
 xRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715754071; x=1716358871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cuvIls99d62BZkMz/67FnalWqEQalX6SJknJemymH8o=;
 b=wdT87+Zo3yEb4JXKtM72wx2+Ue4Xj5PBzIygPHP8LNzw4qGn2nQWHEHKiZCeCd9028
 zGl6XlHt+p5db6Qk4Egq4/W9AT/ONain+p7yx3M+LbgN30fSY6OskiwnaCAPGTj1GvgO
 jYD5BD8zD7SuhfL8INrsoItkeygYEuq8sY8c7lMObsoKk89Nb0lP3GzjSsipZxhJ9s1Z
 yGk/KqdDAMRbIr8PGyMDWHxW8Fwtyttdg2044QS5s9YrSyAAMsRqHvNuOuiee49NluYF
 Ndq+OkS5cyocsAQTGCUIVjOA/CgIxpFVqVd0AshLY7qs6F8DFUAvM3LwadBEpd0EGEz0
 /okg==
X-Gm-Message-State: AOJu0Yzfc84UCqlAjLmb/MEOZnwpc3+NXTIfFUgWF5LMB3AY4vECTo0M
 k2DZBMD7riBxqyD2lK9d222qrMVBZsChc5zER/xasVh55/4Sya7sEGfWpco0mP69q9Cq3qef8LL
 bBsa/4FI3PLty72/nsheXYRigW3yaIQ==
X-Google-Smtp-Source: AGHT+IHiUvY4QDo/GglhUmmUblpxGQV+bWexK3obFKcIvVjpd5UMB3O7TalzK6ldyIT5amuWP2qVy+a2fCJpC50HiiY=
X-Received: by 2002:a17:906:1dd7:b0:a59:a431:f951 with SMTP id
 a640c23a62f3a-a5a2d665e13mr956105366b.48.1715754070072; Tue, 14 May 2024
 23:21:10 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 15 May 2024 16:20:56 +1000
Message-ID: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
Subject: [git pull] drm for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 15 May 2024 06:25:14 +0000
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

Hi Linus,

This is the main pull request for the drm subsystems for 6.10.

In drivers the main thing is a new driver for ARM Mali firmware based
GPUs, otherwise there are a lot of changes to amdgpu/xe/i915/msm and
scattered changes to everything else.

In the core a bunch of headers and Kconfig was refactored, along with
the addition of a new panic handler which is meant to provide a user
friendly message when a panic happens and graphical display is
enabled.

I did a trial merge and there were only two minor conflicts that I
think should be fine for you to handle. I know there are some
conflicts on the list from sfr with the devicetree and kbuild trees at
least,

Regards,
Dave.

drm-next-2024-05-15:
drm for 6.10-rc1

new drivers:
- panthor: ARM Mali/Immortalis CSF-based GPU driver

core:
- new drm panic handler
- add a CONFIG_DRM_WERROR option
- make more headers self-contained
- grab resv lock in pin/unpin
- fix vmap resv locking
- EDID/eDP panel matching
- Kconfig cleanups
- DT sound bindings
- Add SIZE_HINTS property for cursor planes
- Add struct drm_edid_product_id and helpers.
- Use drm device based logging in more drm functions.
- drop seq_file.h from a bunch of places
- use drm_edid driver conversions

dp:
- DP Tunnel documentation
- MST read sideband cap
- Adaptive sync SDP prep work

ttm:
- improve placement for TTM BOs in idle/busy handling

panic:
- Fixes for drm-panic, and option to test it.
- Add drm panic to simpledrm, mgag200, imx, ast

bridge:
- improve init ordering
- adv7511: allow GPIO pin sharing
- tc358775: add tc358675 support

panel:
- AUO B120XAN01.0
- Samsung s6e3fa7
- BOE NT116WHM-N44
- CMN N116BCA-EA1,
- CrystalClear CMT430B19N00
- Startek KD050HDFIA020-C020A
- powertip PH128800T006-ZHC01
- Innolux G121X1-L03
- LG sw43408
- Khadas TS050 V2
- EDO RM69380 OLED
- CSOT MNB601LS1-1

amdgpu:
- HDCP/ODM/RAS fixes
- Devcoredump improvements
- Expose VCN activity via sysfs
- SMY 13.0.x updates
- Enable fast updates on DCN 3.1.4
- Add dclk and vclk reporting on additional devices
- Add ACA RAS infrastructure
- Implement TLB flush fence
- EEPROM handling fixes
- SMUIO 14.0.2 support
- SMU 14.0.1 Updates
- SMU 14.0.2 support
- Sync page table freeing with TLB flushes
- DML2 refactor
- DC debug improvements
- DCN 3.5.x Updates
- GPU reset fixes
- HDP fix for second GFX pipe on GC 10.x
- Enable secondary GFX pipe on GC 10.3
- Refactor and clean up BACO/BOCO/BAMACO handling
- Remove invalid TTM resource start check
- UAF fix in VA IOCTL
- GPUVM page fault redirection to secondary IH rings for IH 6.x
- Initial support for mapping kernel queues via MES
- Fix VRAM memory accounting

amdkfd:
- MQD handling cleanup
- Preemption handling fixes for XCDs
- TLB flush fix for GC 9.4.2
- Properly clean up workqueue during module unload
- Fix memory leak process create failure
- Range check CP bad op exception targets to avoid reporting invalid
exceptions to userspace
- Fix eviction fence handling
- Fix leak in GPU memory allocation failure case
- DMABuf import handling fix
- Enable SQ watchpoint for gfx10

i915:
- Adding new DG2 PCI ID
- add context hints for GT frequency
- enable only one CCS for compute workloads
- new workarounds
- Fix UAF on destroy against retire race and remove two earlier partial fix=
es
- Limit the reserved VM space to only the platforms that need it
- Fix gt reset with GuC submission is disable
- Add and use gt_to_guc() wrapper

i915/xe display:
- Lunar Lake display enabling, including cdclk and other refactors
- BIOS/VBT/opregion related refactor
- Digital port related refactor/clean-up
- Fix 2s boot time regression on DP panel replay init
- Remove duplication on audio enable/disable on SDVO and g4x+ DP
- Disable AuxCCS framebuffers if built for Xe
- Make crtc disable more atomic
- Increase DP idle pattern wait timeout to 2ms
- Start using container_of_const() for some extra const safety
- Fix Jasper Lake boot freeze
- Enable MST mode for 128b/132b single-stream sideband
- Enable Adaptive Sync SDP Support for DP
- Fix MTL supported DP rates - removal of UHBR13.5
- PLL refactoring
- Limit eDP MSO pipe only for display version 20
- More display refactor towards independence from i915 dev_priv
- Convert i915/xe fbdev to DRM client
- More initial work to make display code more independent from i915

xe:
- improved error capture
- clean up some uAPI leftovers
- devcoredump update
- Add BMG mocs table
- Handle GSCCS ER interrupt
- Implement xe2- and GuC workarounds
- struct xe_device cleanup
- Hwmon updates
- Add LRC parsing for more GPU instruction
- Increase VM_BIND number of per-ioctl Ops
- drm/xe: Add XE_BO_GGTT_INVALIDATE flag
- Initial development for SR-IOV support
- Add new PCI IDs to DG2 platform
- Move userptr over to start using hmm_range_fault

msm:
- Switched to generating register header files during build process
  instead of shipping pre-generated headers
- Merged DPU and MDP4 format databases.
- DP:
- Stop using compat string to distinguish DP and eDP cases
- Added support for X Elite platform (X1E80100)
- Reworked DP aux/audio support
- Added SM6350 DP to the bindings
- GPU:
- a7xx perfcntr reg fixes
- MAINTAINERS updates
- a750 devcoredump support

radeon:
- Silence UBSAN warnings related to flexible arrays

nouveau:
- move some uAPI objects to uapi headers

omapdrm:
- console fix

ast:
- add i2c polling

qaic:
- add debugfs entries

exynos:
- fix platform_driver .owner
- drop cleanup code

mediatek:
- Use devm_platform_get_and_ioremap_resource() in mtk_hdmi_ddc_probe()
- Add GAMMA 12-bit LUT support for MT8188
- Rename mtk_drm_* to mtk_*
- Drop driver owner initialization
- Correct calculation formula of PHY Timing
The following changes since commit e67572cd2204894179d89bd7b984072f19313b03=
:

  Linux 6.9-rc6 (2024-04-28 13:47:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-05-15

for you to fetch changes up to 275654c02f0ba09d409c36d71dc238e470741e30:

  Merge tag 'drm-xe-next-fixes-2024-05-09-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-05-10
12:41:34 +1000)

----------------------------------------------------------------
drm for 6.10-rc1

new drivers:
- panthor: ARM Mali/Immortalis CSF-based GPU driver

core:
- add a CONFIG_DRM_WERROR option
- make more headers self-contained
- grab resv lock in pin/unpin
- fix vmap resv locking
- EDID/eDP panel matching
- Kconfig cleanups
- DT sound bindings
- Add SIZE_HINTS property for cursor planes
- Add struct drm_edid_product_id and helpers.
- Use drm device based logging in more drm functions.
- drop seq_file.h from a bunch of places
- use drm_edid driver conversions

dp:
- DP Tunnel documentation
- MST read sideband cap
- Adaptive sync SDP prep work

ttm:
- improve placement for TTM BOs in idle/busy handling

panic:
- Fixes for drm-panic, and option to test it.
- Add drm panic to simpledrm, mgag200, imx, ast

bridge:
- improve init ordering
- adv7511: allow GPIO pin sharing
- tc358775: add tc358675 support

panel:
- AUO B120XAN01.0
- Samsung s6e3fa7
- BOE NT116WHM-N44
- CMN N116BCA-EA1,
- CrystalClear CMT430B19N00
- Startek KD050HDFIA020-C020A
- powertip PH128800T006-ZHC01
- Innolux G121X1-L03
- LG sw43408
- Khadas TS050 V2
- EDO RM69380 OLED
- CSOT MNB601LS1-1

amdgpu:
- HDCP/ODM/RAS fixes
- Devcoredump improvements
- Expose VCN activity via sysfs
- SMY 13.0.x updates
- Enable fast updates on DCN 3.1.4
- Add dclk and vclk reporting on additional devices
- Add ACA RAS infrastructure
- Implement TLB flush fence
- EEPROM handling fixes
- SMUIO 14.0.2 support
- SMU 14.0.1 Updates
- SMU 14.0.2 support
- Sync page table freeing with TLB flushes
- DML2 refactor
- DC debug improvements
- DCN 3.5.x Updates
- GPU reset fixes
- HDP fix for second GFX pipe on GC 10.x
- Enable secondary GFX pipe on GC 10.3
- Refactor and clean up BACO/BOCO/BAMACO handling
- Remove invalid TTM resource start check
- UAF fix in VA IOCTL
- GPUVM page fault redirection to secondary IH rings for IH 6.x
- Initial support for mapping kernel queues via MES
- Fix VRAM memory accounting

amdkfd:
- MQD handling cleanup
- Preemption handling fixes for XCDs
- TLB flush fix for GC 9.4.2
- Properly clean up workqueue during module unload
- Fix memory leak process create failure
- Range check CP bad op exception targets to avoid reporting invalid
exceptions to userspace
- Fix eviction fence handling
- Fix leak in GPU memory allocation failure case
- DMABuf import handling fix
- Enable SQ watchpoint for gfx10

i915:
- Adding new DG2 PCI ID
- add context hints for GT frequency
- enable only one CCS for compute workloads
- new workarounds
- Fix UAF on destroy against retire race and remove two earlier partial fix=
es
- Limit the reserved VM space to only the platforms that need it
- Fix gt reset with GuC submission is disable
- Add and use gt_to_guc() wrapper

i915/xe display:
- Lunar Lake display enabling, including cdclk and other refactors
- BIOS/VBT/opregion related refactor
- Digital port related refactor/clean-up
- Fix 2s boot time regression on DP panel replay init
- Remove duplication on audio enable/disable on SDVO and g4x+ DP
- Disable AuxCCS framebuffers if built for Xe
- Make crtc disable more atomic
- Increase DP idle pattern wait timeout to 2ms
- Start using container_of_const() for some extra const safety
- Fix Jasper Lake boot freeze
- Enable MST mode for 128b/132b single-stream sideband
- Enable Adaptive Sync SDP Support for DP
- Fix MTL supported DP rates - removal of UHBR13.5
- PLL refactoring
- Limit eDP MSO pipe only for display version 20
- More display refactor towards independence from i915 dev_priv
- Convert i915/xe fbdev to DRM client
- More initial work to make display code more independent from i915

xe:
- improved error capture
- clean up some uAPI leftovers
- devcoredump update
- Add BMG mocs table
- Handle GSCCS ER interrupt
- Implement xe2- and GuC workarounds
- struct xe_device cleanup
- Hwmon updates
- Add LRC parsing for more GPU instruction
- Increase VM_BIND number of per-ioctl Ops
- drm/xe: Add XE_BO_GGTT_INVALIDATE flag
- Initial development for SR-IOV support
- Add new PCI IDs to DG2 platform
- Move userptr over to start using hmm_range_fault

msm:
- Switched to generating register header files during build process
  instead of shipping pre-generated headers
- Merged DPU and MDP4 format databases.
- DP:
- Stop using compat string to distinguish DP and eDP cases
- Added support for X Elite platform (X1E80100)
- Reworked DP aux/audio support
- Added SM6350 DP to the bindings
- GPU:
- a7xx perfcntr reg fixes
- MAINTAINERS updates
- a750 devcoredump support

radeon:
- Silence UBSAN warnings related to flexible arrays

nouveau:
- move some uAPI objects to uapi headers

omapdrm:
- console fix

ast:
- add i2c polling

qaic:
- add debugfs entries

exynos:
- fix platform_driver .owner
- drop cleanup code

mediatek:
- Use devm_platform_get_and_ioremap_resource() in mtk_hdmi_ddc_probe()
- Add GAMMA 12-bit LUT support for MT8188
- Rename mtk_drm_* to mtk_*
- Drop driver owner initialization
- Correct calculation formula of PHY Timing

----------------------------------------------------------------
Abel Vesa (4):
      phy: Add Embedded DisplayPort and DisplayPort submodes
      phy: qcom: edp: Add set_mode op for configuring eDP/DP submode
      drm/msm/dp: Add support for determining the eDP/DP mode from DT
      drm/msm/dp: Add support for the X1E80100

Adam Ford (2):
      drm/bridge: adv7511: Allow IRQ to share GPIO pins
      drm/bridge: imx: Fix unmet depenency for PHY_FSL_SAMSUNG_HDMI_PHY

Adri=C3=A1n Larumbe (3):
      drm/panfrost: Replace fdinfo's profiling debugfs knob with sysfs
      drm/panfrost: Only display fdinfo's engine and cycle tags when
profiling is on
      ABI: sysfs-driver-panfrost-profiling: fix indentation problem

Ahmad Rehman (1):
      drm/amdgpu: Skip the coredump collection on reset during driver reloa=
d

Akshata Jahagirdar (1):
      drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx

Aleksandr Mishin (3):
      drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference
      drm: vc4: Fix possible null pointer dereference
      drm/msm/dpu: Add callback function pointer check before its call

Alex Deucher (11):
      drm/amdgpu: always force full reset for SOC21
      Documentation: add a page on amdgpu debugging
      drm/amdgpu/gfx11: properly handle regGRBM_GFX_CNTL in soft reset
      Revert "drm/amd/display: fix USB-C flag update after enc10 feature in=
it"
      drm/radeon: make -fstrict-flex-arrays=3D3 happy
      drm/radeon: silence UBSAN warning (v3)
      drm/amdkfd: demote unsupported device messages to dev_info
      drm/amdgpu/mes11: print MES opcodes rather than numbers
      drm/amdgpu/sdma5.2: use legacy HDP flush for SDMA2/3
      drm/amdgpu: add a spinlock to wb allocation
      drm/amdgpu/mes11: Use a separate fence per transaction

Alex Hung (13):
      drm/amd/display: Delete duplicated function prototypes
      drm/amd/display: Correct indentations and spaces
      drm/amd/display: Skip on writeback when it's not applicable
      drm/amd/display: Return max resolution supported by DWB
      drm/amd/display: Check index msg_id before read or write
      drm/amd/display: Check pipe offset before setting vblank
      drm/amd/display: Skip finding free audio for unknown engine_id
      drm/amd/display: Do not return negative stream id for array
      drm/amd/display: ASSERT when failing to find index by plane/stream id
      drm/amd/display: Remove redundant include file
      drm/amd/display: Fix uninitialized variables in DM
      drm/amd/display: Fix uninitialized variables in DC
      drm/amd/display: Fix uninitialized variables in DC

Allen Pan (1):
      drm/amd/display: expand the non standard link rate for testing

Alvin Lee (5):
      drm/amd/display: Backup and restore only on full updates
      drm/amd/display: Allow idle opts for no flip case on PSR panel
      drm/amd/display: Remove plane and stream pointers from dc scratch
      drm/amd/display: Add extra logging for HUBP and OTG
      drm/amd/display: Add extra DMUB logging to track message timeout

Anatoliy Klymenko (6):
      drm: xlnx: zynqmp_dpsub: Set layer mode during creation
      drm: xlnx: zynqmp_dpsub: Update live format defines
      drm: xlnx: zynqmp_dpsub: Add connected live layer helper
      drm: xlnx: zynqmp_dpsub: Anounce supported input formats
      drm: xlnx: zynqmp_dpsub: Minimize usage of global flag
      drm: xlnx: zynqmp_dpsub: Set input live format

Andi Shyti (7):
      drm/i915/gt: Create the gt_to_guc() wrapper
      drm/i915/guc: Use the new gt_to_guc() wrapper
      drm/i915/gt: Limit the reserved VM space to only the platforms
that need it
      drm/i915/gem: Replace dev_priv with i915
      drm/i915/gt: Disable HW load balancing for CCS
      drm/i915/gt: Do not generate the command streamer for all the CCS
      drm/i915/gt: Enable only one CCS for compute workload

Andrew Halaney (1):
      drm/tidss: Use dev_err_probe() over dev_dbg() when failing to
probe the port

Andrzej Hajda (1):
      drm/xe: fix multicast support for Xe_LP platforms

Andy Shevchenko (2):
      drm/gma500: Remove unused intel-mid.h
      drm/msm/hdmi: Replace of_gpio.h by proper one

Andy Yan (1):
      drm/rockchip: lvds: Remove include of drm_dp_helper.h

Animesh Manna (1):
      drm/i915/panelreplay: Move out psr_init_dpcd() from init_connector()

Ankit Nautiyal (2):
      drm/i915/scaler: Update Pipe src size check in skl_update_scaler
      drm/i915/dp: Fix the computation for compressed_bpp for DISPLAY < 13

Anthony Koo (6):
      drm/amd/display: Add entry and exit counters
      drm/amd/display: Update DMUB flags and definitions
      drm/amd/display: [FW Promotion] Release 0.0.208.0
      drm/amd/display: [FW Promotion] Release 0.0.210.0
      drm/amd/display: [FW Promotion] Release 0.0.212.0
      drm/amd/display: Expand dmub_cmd operations

Aric Cyr (9):
      drm/amd/display: 3.2.274
      drm/amd/display: 3.2.275
      drm/amd/display: 3.2.276
      drm/amd/display: 3.2.277
      drm/amd/display: 3.2.278
      drm/amd/display: Fix compiler warnings on high compiler warning level=
s
      drm/amd/display: 3.2.279
      drm/amd/display: 3.2.280
      drm/amd/display: 3.2.281

Arnd Bergmann (7):
      drm/xe/kunit: fix link failure with built-in xe
      drm/xe/mmio: fix build warning for BAR resize on 32-bit
      drm/xe/xe2: fix 64-bit division in pte_update_size
      drm/imagination: avoid -Woverflow warning
      drm: fix DRM_DISPLAY_DP_HELPER dependencies
      accel/qaic: mark debugfs stub functions as static inline
      drm: fix DRM_DISPLAY_DP_HELPER dependencies, part 2

Arthur Grillo (1):
      drm/i915/overlay: Remove redundant drm_rect_visible() use

Arun R Murthy (1):
      drm/i915/dp: Remove support for UHBR13.5

Arunpravin Paneer Selvam (5):
      drm/amd/amdgpu: add pipe1 hardware support
      drm/buddy: Implement tracking clear page feature
      drm/amdgpu: Enable clear page functionality
      drm/tests: Add a test case for drm buddy clear allocation
      drm/amdgpu: Modify the contiguous flags behaviour

Asad Kamal (4):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Use metric table for pcie speed/width
      drm/amd/pm: Report uclk/sclk current limits
      drm/amd/pm: Update uclk/sclk limit report format

Ashutosh Dixit (2):
      drm/xe: Label RING_CONTEXT_CONTROL as masked
      drm/i915/hwmon: Get rid of devm

Aurabindo Pillai (2):
      drm/amd/display: Add some forward declarations
      drm/amd/display: Add DML2 folder to include path

Badal Nilawar (2):
      drm/xe/guc: Add support for workaround KLVs
      drm/xe/lnl: Enable GuC Wa_14019882105

Balasubramani Vivekanandan (3):
      drm/i915/xe2lpd: Load DMC
      drm/xe/lnl: Enable display support
      drm/xe/bmg: Add BMG mocs table

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (1):
      drm/panel: jdi-fhd-r63452: make use of prepare_prev_first

Baruch Siach (1):
      doc: dma-buf: fix grammar typo

Bhanuprakash Modem (2):
      drm/i915/drrs: Refactor CPU transcoder DRRS check
      drm/i915/display/debugfs: Fix duplicate checks in i915_drrs_status

Bhawanpreet Lakha (2):
      drm/amd/display: Allow Z8 when stutter threshold is not met
      drm/amd/display: Allow Z8 when stutter threshold is not met for dcn35

Bjorn Andersson (7):
      drm/msm/dp: Remove now unused connector_type from desc
      drm/msm/dp: Drop unused dp_debug struct
      drm/msm/dp: Removed fixed nvid "support"
      drm/msm/dp: Remove unused defines and members
      drm/msm/dp: Use function arguments for aux writes
      drm/msm/dp: Use function arguments for timing configuration
      drm/msm/dp: Use function arguments for audio operations

Bob Zhou (3):
      drm/amdgpu: add error handle to avoid out-of-bounds
      drm/amdgpu: add return result for amdgpu_i2c_{get/put}_byte
      drm/amdgpu: fix double free err_addr pointer warnings

Bommu Krishnaiah (3):
      drm/xe: prefer snprintf over sprintf
      drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit() for attr's _show()
      drm/xe/xe2: Add workaround 18034896535

Boris Brezillon (24):
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
      drm/panthor: Explicitly include mm.h for the {virt, __phys)_to_pfn() =
defs
      drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue
      drm/panthor: Fix the CONFIG_PM=3Dn case
      drm/panthor: Fix wrong kernel-doc format in the uAPI header
      drm/panthor: Fix IO-page mmap() for 32-bit userspace on 64-bit kernel
      drm/panthor: Fix ordering in _irq_suspend()
      drm/panthor: Drop the dev_enter/exit() sections in _irq_suspend/resum=
e()
      drm/panthor: Kill the faulty_slots variable in panthor_sched_suspend(=
)
      drm/panthor: Make sure we handle 'unknown group state' case properly
      drm/panthor: Fix the FW reset logic

Candice Li (1):
      drm/amdgpu: Update setting EEPROM table version

Chaitanya Dhere (2):
      drm/amd/display: Add TB_BORROWED_MAX definition
      drm/amd/display: Fix incorrect pointer assignment

Charlene Liu (4):
      drm/amd/display: fix debug key not working on dml2
      drm/amd/display: change aux_init to apu version
      drm/amd/display: add dwb support to dml2
      drm/amd/display: limit the code change to ips enabled asic

Chen-Yu Tsai (1):
      dt-bindings: display: bridge: it6505: Add #sound-dai-cells

Chris Morgan (3):
      dt-bindings: vendor-prefix: Add prefix for GameForce
      dt-bindings: display: Add GameForce Chi Panel
      drm/panel: st7703: Add GameForce Chi Panel Support

Chris Park (2):
      drm/amd/display: Prevent crash when disable stream
      drm/amd/display: Add a function for checking tmds mode

Chris Wilson (1):
      drm/i915/gt: Reset queue_priority_hint on parking

Christian Hewitt (1):
      drm/meson: vclk: fix calculation of 59.94 fractional rates

Christian Koenig (1):
      drm/amdgpu: implement TLB flush fence

Christian K=C3=B6nig (5):
      drm/ttm: improve idle/busy handling v5
      drm/amdgpu: use GTT only as fallback for VRAM|GTT
      drm/ttm: warn when resv objs are mixed in a bulk_move
      drm/amdgpu: remove invalid resource->start check v2
      drm/amdgpu: fix visible VRAM handling during faults

Christophe JAILLET (2):
      drm/i915/display: Save a few bytes of memory in
intel_backlight_device_register()
      drm/i915/guc: Remove usage of the deprecated ida_simple_xx() API

Colin Ian King (2):
      drm/i915/dp: Fix spelling mistake "redect" -> "reject"
      drm/panthor: Fix spelling mistake "readyness" -> "readiness"

Connor Abbott (5):
      drm/msm: Import a750 snapshot registers from kgsl
      drm/msm: Fix imported a750 snapshot header for upstream
      drm/msm: Update a6xx registers XML
      drm/msm: Adjust a7xx GBIF debugbus dumping
      drm/msm: Add devcoredump support for a750

Dafna Hirschfeld (1):
      drm/xe: Replace 'grouped target' in Makefile with pattern rule

Dan Carpenter (5):
      drm/panthor: Fix a couple -ENOMEM error codes
      drm/panthor: Fix error code in panthor_gpu_init()
      drm/panthor: Fix off by one in panthor_fw_get_cs_iface()
      drm: xlnx: db: fix a memory leak in probe
      drm/panthor: clean up some types in panthor_sched_suspend()

Daniel Miess (2):
      drm/amd/display: Toggle additional RCO options in DCN35
      drm/amd/display: Enable RCO for HDMISTREAMCLK in DCN35

Daniel Vetter (2):
      drm/panic: Add drm panic locking
      Merge v6.9-rc6 into drm-next

Daniele Ceraolo Spurio (7):
      drm/xe/gsc: Handle GSCCS ER interrupt
      drm/xe/guc: Don't support older GuC 70.x releases
      drm/xe: Always check force_wake_get return code
      drm/xe/uc: Use u64 for offsets for which we use upper_32_bits()
      drm/xe/guc: Check error code when initializing the CT mutex
      drm/xe/gsc: Implement WA 14018094691
      drm/i915/dg2: wait for HuC load completion before running selftests

Danijel Slivka (1):
      drm/amdgpu: use vm_update_mode=3D0 as default in sriov for gfx10.3 on=
wards

Dave Airlie (24):
      Merge tag 'drm-misc-next-2024-03-28' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-04-05' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-04-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.10-2024-04-13' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-2024-04-17-1' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-6.10-2024-04-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2024-04-19' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Backmerge tag 'v6.9-rc5' into drm-next
      Merge tag 'drm-xe-next-2024-04-23' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2024-04-24' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-next
      Merge tag 'exynos-drm-next-for-6.10' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'drm-misc-next-2024-04-25' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      drm/i915: fix build with missing debugfs includes
      drm/komeda: fix missing seq_file includes
      drm/omap: add missing seq_file include
      drm/loongson: fix build after debugfs include change
      Merge tag 'mediatek-drm-next-6.10' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-intel-gt-next-2024-04-26' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-6.10-2024-04-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-2024-04-30' of
https://anongit.freedesktop.org/git/drm/drm-intel into drm-next
      Merge tag 'drm-xe-next-fixes-2024-05-02' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-msm-next-2024-05-07' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-misc-next-fixes-2024-05-08' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2024-05-09-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

David Tadokoro (1):
      drm/amd/display: Remove duplicated function signature from dcn3.01 DC=
CG

David Wronek (2):
      dt-bindings: display: panel: Add Raydium RM69380
      drm/panel: Add driver for EDO RM69380 OLED panel

Dawei Li (1):
      drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused

Detlev Casanova (1):
      drm/rockchip: vop2: Do not divide height twice for YUV

Dharma Balasubiramani (3):
      dt-bindings: display: bridge: add sam9x75-lvds binding
      drm/bridge: add lvds controller support for sam9x7
      MAINTAINERS: add SAM9X7 SoC's LVDS controller

Dillon Varone (9):
      drm/amd/display: add stream clock source to DP DTO params
      drm/amd/display: Program pixclk according to dcn revision
      drm/amd/display: Power on VPG memory unconditionally if off
      drm/amd/display: Expand DML2 callbacks
      drm/amd/display: Refactor DML2 interfaces
      drm/amd/display: Modify DHCUB waterwark structures and functions
      drm/amd/display: Add dmub additional interface support for FAMS
      drm/amd/display: Add driver support for future FAMS versions
      drm/amd/display: Do not recursively call manual trigger programming

Dmitry Baryshkov (44):
      dt-bindings: display/lvds-codec: add ti,sn65lvds94
      Merge tag 'phy_dp_modes_6.10' into msm-next-lumag
      drm/msm/dp: allow voltage swing / pre emphasis of 3
      drm/msm/dpu: add current resource allocation to dumped state
      drm/mipi-dsi: use correct return type for the DSC functions
      drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
      drm/msm/mdp5: add writeback block bases
      drm/msm/hdmi: drop qfprom.xml.h
      drm/msm/dsi: drop mmss_cc.xml.h
      drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
      drm/msm: remove dependencies from core onto adreno headers
      drm/msm: import XML display registers database
      drm/msm: import A2xx-A4xx XML display registers database
      drm/msm: import A5xx XML display registers database
      drm/msm: import A6xx XML display registers database
      drm/msm: import gen_header.py script from Mesa
      drm/msm: generate headers on the fly
      drm/msm: drop display-related headers
      drm/msm: drop A2xx and common headers
      drm/msm: drop A3xx and A4xx headers
      drm/msm: drop A5xx header
      drm/msm: drop A6xx GMU header
      drm/msm: drop C++ parts of a6xx.xml.h
      drm/msm: drop A6xx header
      drm/msm/dsi: remove the drm_bridge_attach fallback
      drm/msm/dsi: move next bridge acquisition to dsi_bind
      drm/msm/dsi: simplify connector creation
      drm/msm/dpu: use format-related definitions from mdp_common.xml.h
      drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
      drm/msm/dpu: in dpu_format replace bitmap with unsigned long field
      drm/msm/dpu: pull format flag definitions to mdp_format.h
      drm/msm: merge dpu_format and mdp_format in struct msm_format
      drm/msm: convert msm_format::unpack_tight to the flag
      drm/msm: convert msm_format::unpack_align_msb to the flag
      drm/msm: merge dpu format database to MDP formats
      drm/msm: drop msm_kms_funcs::get_format() callback
      drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
      drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
      drm/panel: novatek-nt36672e: stop setting register load before disabl=
e
      drm/panel: novatek-nt36672e: stop calling regulator_set_load manually
      drm/panel: novatek-nt36672a: stop calling regulator_set_load manually
      drm/panel: visionox-rm69299: stop calling regulator_set_load manually
      drm/bridge: adv7511: make it honour next bridge in DT
      drm/msm/gen_header: allow skipping the validation

Dmytro Laktyushkin (1):
      drm/amd/display: Increase SAT_UPDATE_PENDING timeout

Douglas Anderson (9):
      drm/panel: atna33xc20: Fix unbalanced regulator in the case HPD
doesn't assert
      drm/dp: Clarify that wait_hpd_asserted() is not optional for panels
      drm/mediatek: Init `ddp_comp` with devm_kcalloc()
      drm/panel-edp: Abstract out function to set conservative timings
      drm/panel-edp: If we fail to powerup/get EDID, use conservative timin=
gs
      drm-panel: If drm_panel_dp_aux_backlight() fails, don't fail panel pr=
obe
      drm/msm/dp: Avoid a long timeout for AUX transfer if nothing connecte=
d
      drm/msm/dp: Account for the timeout in wait_hpd_asserted() callback
      drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux transfer

Duncan Ma (1):
      drm/amd/display: Allow HPO PG for DCN35

Eric Bernstein (2):
      drm/amd/display: Fix MPCC DTN logging
      drm/amd/display: Update FMT settings for 4:2:0

Eric Huang (1):
      drm/amdkfd: fix TLB flush after unmap for GFX9.4.2

Erick Archer (1):
      drm/radeon/radeon_display: Decrease the size of allocated memory

Erico Nunes (5):
      drm/lima: add mask irq callback to gp and pp
      drm/lima: include pp bcast irq in timeout handler check
      drm/lima: mask irqs in timeout path before hard reset
      drm/lima: fix shared irq handling on driver remove
      drm/lima: fix void pointer to enum lima_gpu_id cast warning

Ethan Bitnun (1):
      drm/amd/display: Improve the log precision

Felix Kuehling (4):
      drm/amdkfd: Fix memory leak in create_process failure
      drm/amdkfd: Fix eviction fence handling
      drm/amdgpu: Update BO eviction priorities
      drm/amdkfd: Fix rescheduling of restore worker

Francois Dugast (5):
      drm/xe/uapi: Remove unused flags
      drm/xe: Extend uAPI to query HuC micro-controler firmware version
      drm/xe/uapi: Define topology types as indexes rather than masks
      drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and
VM_BIND_FLAG_IMMEDIATE
      drm/xe/gt: Add L3 bank mask to GT topology

Frank Min (1):
      drm/amdgpu: replace tmz flag into buffer flag

Fudongwang (1):
      drm/amd/display: fix disable otg wa logic in DCN316

Gabe Teeger (1):
      drm/amd/display: Revert Add left edge pixel + ODM pipe split

Gareth Yu (1):
      drm/i915/backlight: Do not bump min brightness to max on enable

Geert Uytterhoeven (13):
      m68k: pgtable: Add missing #include <asm/page.h>
      drm: DRM_WERROR should depend on DRM
      Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies, part 2"
      Revert "drm/display: Select DRM_KMS_HELPER for DP helpers"
      Revert "drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable"
      Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies"
      Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"
      Revert "drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on"
      Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
      Revert "drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on"
      Revert "drm: Switch DRM_DISPLAY_HELPER to depends on"
      Revert "drm: Make drivers depends on DRM_DW_HDMI"
      Revert "drm/display: Make all helpers visible and switch to depends o=
n"

George Shen (5):
      drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe spli=
t
      drm/amd/display: Remove MPC rate control logic from DCN30 and above
      drm/amd/display: Add dummy interface for tracing DCN32 SMU messages
      drm/amd/display: Rebuild test pattern params for
DP_TEST_PATTERN_VIDEO_MODE
      drm/amd/display: Handle Y carry-over in VCP X.Y calculation

Gustavo Sousa (10):
      drm/i915/cdclk: Rename intel_cdclk_needs_modeset to
intel_cdclk_clock_changed
      drm/i915/cdclk: Document CDCLK components
      drm/i915/cdclk: Rename lnl_cdclk_table to xe2lpd_cdclk_table
      drm/i915/cdclk: Add and use mdclk_source_is_cdclk_pll()
      drm/i915/cdclk: Only compute squash waveform when necessary
      drm/i915: Extract intel_dbuf_mdclk_cdclk_ratio_update()
      drm/i915: Add mdclk_cdclk_ratio to intel_dbuf_state
      drm/i915/xe2lpd: Support MDCLK:CDCLK ratio changes
      drm/xe/xe2hpm: Add initial set of workarounds
      drm/xe/xe2lpg: Extend Wa_14020338487

Hamza Mahfooz (1):
      drm/amd/display: fix IPX enablement

Haridhar Kalvala (1):
      drm/xe/xe2hpg: Add initial GT workarounds

Harish Kasiviswanathan (2):
      drm/amdkfd: Reset GPU on queue preemption failure
      drm/amdkfd: Enforce queue BO's adev

Harry Wentland (3):
      Revert "drm/amd/display: Fix sending VSC (+ colorimetry) packets
for DP/eDP displays without PSR"
      drm/amd/display: Program VSC SDP colorimetry for all DP sinks >=3D 1.=
4
      drm/amd/display: Set VSC SDP Colorimetry same way for MST and SST

Harshit Mogalapalli (2):
      drm/panthor: Fix NULL vs IS_ERR() bug in panthor_probe()
      drm/panthor: Don't return NULL from panthor_vm_get_heap_pool()

Hawking Zhang (9):
      drm/amdgpu: Apply retry to IP discovery v2 and v4
      drm/amdgpu: Add smuio v14_0_2 ip headers (v4)
      drm/amdgpu: Add smuio v14_0_2 ip block support
      drm/amdgpu: Add smuio callback to get gpu clk counter
      drm/amdgpu: Enable smuio v14_0_2 callbacks
      drm/amdgpu: Bypass asd if display hw is not available
      drm/amdgpu: Load ipkeymgr drv for psp v14
      drm/amdgpu: rename DBG_DRV to HAD_DRV for psp v14
      drm/amdgpu: Use driver mode reset for data poison

Heiko Stuebner (2):
      drm/panel: ltk050h3146w: add MIPI_DSI_MODE_VIDEO to LTK050H3148W flag=
s
      drm/panel: ltk050h3146w: drop duplicate commands from LTK050H3148W in=
it

Hersen Wu (4):
      drm/amd/display: Add timing pixel encoding for mst mode validation
      drm/amd/display: FEC overhead should be checked once for mst slot num=
s
      drm/amd/display: Add NULL pointer check for kzalloc
      drm/amd/display: Fix overlapping copy within dml_core_mode_programmin=
g

Himal Prasad Ghimiray (15):
      drm/xe: Return if kobj creation is failed
      drm/xe/xe_exec : In xe_exec_ioctl remove deadcode
      drm/xe/vm : Remove duplicate assignment of XE_VM_FLAG_LR_MODE flag.
      drm/xe: Use USEC_PER_MSEC rather than the hard coding
      drm/xe/xe_devcoredump: Check NULL before assignments
      drm/xe/xe2: Add workaround 18033852989
      drm/xe/xe_migrate: Cast to output precision before multiplying operan=
ds
      drm/xe/xe2hpg: Determine flat ccs offset for vram
      drm/xe: Simplify function return using drmm_add_action_or_reset()
      drm/xe: Remove sysfs only once on action add failure
      drm/xe: call free_gsc_pkt only once on action add failure
      drm/xe: Return NULL in case of drmm_add_action_or_reset failure
      drm/xe/gt: Abort driver load for sysfs creation failure
      drm/xe/tile: Abort driver load for sysfs creation failure
      drm/xe/pm: Capture errors and handle them

Hsiao Chien Sung (14):
      drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"
      drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
      drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
      drm/mediatek: Rename "mtk_drm_gem" to "mtk_gem"
      drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
      drm/mediatek: Rename files "mtk_drm_crtc.h" to "mtk_crtc.h"
      drm/mediatek: Rename files "mtk_drm_crtc.c" to "mtk_crtc.c"
      drm/mediatek: Rename files "mtk_drm_ddp_comp.h" to "mtk_ddp_comp.h"
      drm/mediatek: Rename files "mtk_drm_ddp_comp.c" to "mtk_ddp_comp.c"
      drm/mediatek: Rename files "mtk_drm_plane.h" to "mtk_plane.h"
      drm/mediatek: Rename files "mtk_drm_plane.c" to "mtk_plane.c"
      drm/mediatek: Rename files "mtk_drm_gem.h" to "mtk_gem.h"
      drm/mediatek: Rename files "mtk_drm_gem.c" to "mtk_gem.c"
      drm/mediatek: Rename mtk_ddp_comp functions

Hsin-Te Yuan (1):
      drm/bridge: anx7625: Update audio status while detecting

Hsin-Yi Wang (5):
      drm_edid: Add a function to get EDID base block
      drm/edid: Add a function to match EDID with identity
      drm/edid: Match edid quirks with identity
      drm/panel-edp: Match edp_panels with panel identity
      drm/panel-edp: Fix AUO 0x405c panel naming and add a variant

Huai-Yuan Liu (1):
      drm/arm/malidp: fix a possible null pointer dereference

Ian Forbes (1):
      drm/vmwgfx: Remove unused code

Imre Deak (20):
      drm/dp: Fix documentation of DP tunnel functions
      drm/i915/dp: Fix connector DSC HW state readout
      drm/i915/dp: Fix DSC state HW readout for SST connectors
      drm/i915/adlp: Add MST FEC BS jitter WA (Wa_14013163432)
      drm/i915/adlp: Add MST short HBlank WA (Wa_14014143976)
      drm/i915/adlp: Add DP MST DPT/DPTP alignment WA (Wa_14014143976)
      drm/i915/adlp+: Add DSC early pixel count scaling WA (Wa_1409098942)
      drm/i915/mtl+: Disable DP/DSC SF insertion at EOL WA
      drm/i915/mtl: Add DP FEC BS jitter WA
      drm/i915/dp: Fix DSC line buffer depth programming
      drm/i915/dp_mst: Fix symbol clock when calculating the DSC DPT bpp li=
mit
      drm/i915/dp_mst: Fix BW limit check when calculating DSC DPT bpp
      drm/i915/dp_mst: Account for channel coding efficiency in the
DSC DPT bpp limit
      drm/i915/dp_mst: Account with the DSC DPT bpp limit on MTL
      drm/i915/dp_mst: Sanitize calculating the DSC DPT bpp limit
      drm/dp: Add drm_dp_128b132b_supported()
      drm/dp_mst: Factor out drm_dp_mst_port_is_logical()
      drm/dp_mst: Add drm_dp_mst_aux_for_parent()
      drm/i915/dp_mst: Make HBLANK expansion quirk work for logical ports
      drm/i915/dp_mst: Enable HBLANK expansion quirk for UHBR rates

Jack Xiao (4):
      drm/amdgpu/sdma6: set sdma hang watchdog
      drm/amdgpu/mes: fix use-after-free issue
      drm/amdgpu/mes: add mes mapping legacy queue support
      drm/amdgpu/mes11: update ADD_QUEUE interface

Jacobe Zang (2):
      dt-bindings: panel-simple-dsi: add Khadas TS050 V2 panel
      drm/panel: add Khadas TS050 V2 panel support

Jagan Teki (2):
      drm/bridge: Fix improper bridge init order with pre_enable_prev_first
      drm/bridge: Document bridge init order with pre_enable_prev_first

Jani Nikula (131):
      Merge drm/drm-next into drm-intel-next
      drm/i915/bios: bump expected child device size
      drm/i915/bios: abstract child device size check
      drm/i915/bios: abstract child device expected size
      drm: enable (most) W=3D1 warnings by default across the subsystem
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
      drm/i915/opregion: add intel_opregion_vbt_present() stub for ACPI=3Dn
      drm/mst: read sideband messaging cap
      drm/i915/mst: improve debug logging of DP MST mode detect
      drm/i915/mst: abstract choosing the MST mode to use
      drm/i915/mst: use the MST mode detected previously
      drm/i915/mst: add intel_dp_mst_disconnect()
      drm/i915/mst: enable MST mode for 128b/132b single-stream sideband
      drm/i915/hdmi: convert *_port_to_ddc_pin() to *_encoder_to_ddc_pin()
      drm/i915/ddi: pass encoder to intel_wait_ddi_buf_active()
      drm/i915/snps: pass encoder to intel_snps_phy_update_psr_power_state(=
)
      drm/i915/display: add intel_encoder_is_*() and _to_*() functions
      drm/i915/display: use intel_encoder_is/to_* functions
      drm/i915/cx0: remove the unused intel_is_c10phy()
      drm/i915/cx0: pass encoder instead of i915 and port around
      drm/xe: remove unused struct xe_device members
      drm/i915/de: register wait function renames
      drm/i915/display: prefer intel_de_wait*() functions over uncore ones
      drm/i915: use fine grained -Woverride-init disable
      drm/i915/display: move dmc_firmware_path to display params
      Revert "drm/i915/display: move dmc_firmware_path to display params"
      drm/i915: use IS_JASPERLAKE()/IS_ELKHARTLAKE() instead of IS_PLATFORM=
()
      drm/i915/dmc: define firmware URL locally
      drm/i915: move i915_fixed.h to display/intel_fixed.h
      drm/xe/display: clean up a lot of cruft from compat i915_drv.h
      drm/xe/display: remove compat i915_gem.h
      drm/xe/display: clean up compat i915_vgpu.h
      drm/i915/gt: drop display clock info from gt debugfs
      drm/i915: move skl_preferred_vco_freq to display substruct
      drm/i915: move max_dotclk_freq to display substruct
      drm/i915: move vblank_enabled to display substruct
      drm/i915: move display_irqs_enabled to display substruct
      drm/i915: move de_irq_mask to display substruct
      drm/i915: move pipestat_irq_mask to display substruct
      drm/i915: use check_add_overflow() and drop local variants
      drm: remove unused header gma_drm.h
      drm/i915/pps: move pps debugfs file to intel_pps.c
      drm/edid: add drm_edid_get_product_id()
      drm/edid: add drm_edid_print_product_id()
      drm/i915/bios: switch to struct drm_edid and struct drm_edid_product_=
id
      drm/i915/bios: return drm_edid_product_id from get_lvds_pnp_id()
      drm/probe-helper: switch to drm device based logging
      drm/modes: switch to drm device based error logging
      drm/sysfs: switch to drm device based logging
      drm/client: switch to drm device based logging, and more
      drm/crtc: switch to drm device based logging
      drm/crtc-helper: switch to drm device based logging and warns
      drm: prefer DRM_MODE_FMT/ARG over drm_mode_debug_printmodeline()
      drm/displayid: move drm_displayid.h to drm_displayd_internal.h
      drm/edid: move all internal declarations to drm_crtc_internal.h
      drm/edid: group struct drm_edid based declarations together
      drm/edid: rename drm_find_edid_extension() to drm_edid_find_extension=
()
      drm/edid: avoid drm_edid_find_extension() internally
      drm/edid: make drm_edid_are_equal() static
      drm/edid: make drm_edid_are_equal() more convenient for its single us=
er
      drm/i915: use system include for drm headers
      drm/i915/display: add intel_display -> drm_device backpointer
      drm/i915/display: add generic to_intel_display() macro
      drm/i915: add generic __to_intel_display()
      drm/i915/display: accept either i915 or display for feature tests
      drm/i915/quirks: convert struct drm_i915_private to struct intel_disp=
lay
      drm/i915/display: rename __intel_wait_for_register_nowl() to
indicate intel_de_
      drm/i915/dmc: convert dmc wakelock interface to struct intel_display
      drm/i915/de: allow intel_display and drm_i915_private for de function=
s
      drm/i915/dmc: use struct intel_display more
      drm/msm: convert all pixel format logging to use %p4cc
      drm/i915/dmc: handle request_firmware() errors separately
      drm/i915/dmc: improve firmware parse failure propagation
      drm/i915/dmc: split out per-platform firmware path selection
      drm/i915/dmc: change how to disable DMC firmware using module param
      drm/i915/display: move dmc_firmware_path to display params
      drm/panel: simple: switch to struct drm_edid
      drm/panel-samsung-atna33xc20: switch to struct drm_edid
      drm/panel-edp: switch to struct drm_edid
      drm/sun4i: hdmi: switch to struct drm_edid
      drm/vc4: hdmi: switch to struct drm_edid
      drm/gud: switch to struct drm_edid
      drm/rockchip: cdn-dp: switch to struct drm_edid
      drm/rockchip: inno_hdmi: switch to struct drm_edid
      drm/rockchip: rk3066_hdmi: switch to struct drm_edid
      drm/i915/dsi: remove unused _MIPIA_AUTOPWG register definition
      drm/i915/dsi: add VLV_ prefix to VLV only register macros
      drm/i915/dsi: unify connector/encoder type and name usage
      drm/i915/dsi: pass display to register macros instead of implicit var=
iable
      drm/i915: convert _MMIO_PIPE3()/_MMIO_PORT3() to accept base
      drm/i915: pass dev_priv to _MMIO_PIPE2, _MMIO_TRANS2, _MMIO_CURSOR2
      drm/print: drop include debugfs.h and include where needed
      drm/print: drop include seq_file.h
      drm/i915/audio: move LPE audio regs to intel_audio_regs.h
      drm/i915/color: move palette registers to intel_color_regs.h
      drm/i915/display: split out intel_fbc_regs.h from i915_reg.h
      drm/i915/display: split out intel_sprite_regs.h from i915_reg.h
      drm/i915: pass dev_priv explicitly to PALETTE
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C01_C00
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C02
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C11_C10
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C12
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C21_C20
      drm/i915: pass dev_priv explicitly to PIPE_WGC_C22

Janusz Krzysztofik (6):
      drm/i915/selftest_hangcheck: Check sanity with more patience
      drm/i915/selftests: Fix dependency of some timeouts on HZ
      drm/i915/hwmon: Fix locking inversion in sysfs getter
      drm/i915/vma: Fix UAF on destroy against retire race
      drm/i915: Remove extra multi-gt pm-references
      Revert "drm/i915: Wait for active retire before i915_active_fini()"

Jason-JH.Lin (3):
      dt-bindings: display: mediatek: gamma: Change MT8195 to single enum g=
roup
      dt-bindings: display: mediatek: gamma: Add support for MT8188
      drm/mediatek: Add gamma support for MT8195

Jeffrey Hugo (4):
      accel/qaic: Add bootlog debugfs
      accel/qaic: Add fifo size debugfs
      accel/qaic: Add fifo queued debugfs
      accel/qaic: Add Sahara implementation for firmware loading

Jesse Zhang (5):
      drm/ttm: remove unused paramter
      drm/amdgpu: Using uninitialized value *size when calling
amdgpu_vce_cs_reloc
      drm/amdgpu: add check before free wb entry
      drm/amdgpu: initialize the last_jump_jiffies in atom_exec_context
      drm/amdgpu: fix the warning about the expression (int)size - len

Jiapeng Chong (2):
      drm/shmem-helper: Remove duplicate include
      drm/amd/display: Remove duplicate dcn32/dcn32_clk_mgr.h header

Jocelyn Falempe (10):
      drm/panic: Add a drm panic handler
      drm/panic: Add support for color format conversion
      drm/panic: Add debugfs entry to test without triggering panic.
      drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
      drm/simpledrm: Add drm_panic support
      drm/mgag200: Add drm_panic support
      drm/imx: Add drm_panic support
      drm/ast: Add drm_panic support
      drm/fb_dma: Fix parameter name in htmldocs
      drm/fb_dma: Add checks in drm_fb_dma_get_scanout_buffer()

Johan Jonker (3):
      dt-bindings: display: add #sound-dai-cells property to rockchip dw hd=
mi
      dt-bindings: display: add #sound-dai-cells property to rockchip
rk3066 hdmi
      dt-bindings: display: add #sound-dai-cells property to rockchip inno =
hdmi

Johannes Weiner (1):
      drm/amdgpu: fix deadlock while reading mqd from debugfs

John Harrison (8):
      drm/i915/guc: Correct capture of EIR register on hang
      drm/i915/guc: Simplify/extend platform check for Wa_14018913170
      drm/i915: Enable Wa_16019325821
      drm/i915/guc: Add support for w/a KLVs
      drm/i915/guc: Enable Wa_14019159160
      drm/i915/guc: Fix the fix for reset lock confusion
      drm/xe/lnl: Enable more GuC based workarounds
      drm/xe/bmg: Some LNL workarounds also apply to BMG

Jon Hunter (1):
      drm/msm: Fix gen_header.py for older python3 versions

Jonathan Kim (2):
      drm/amdkfd: range check cp bad op exception interrupts
      drm/amdgpu: increase mes submission timeout

Jonathon Hall (1):
      drm/i915: Do not match JSL in ehl_combo_pll_div_frac_wa_needed()

Joonas Lahtinen (1):
      drm/i915: Add includes for BUG_ON/BUILD_BUG_ON in i915_memcpy.c

Jose Fernandez (1):
      drm/amd/display: Fix division by zero in setup_dsc_config

Joshua Aberback (3):
      drm/amd/display: handle invalid connector indices
      drm/amd/display: remove context->dml2 dependency from DML21 wrapper
      drm/amd/display: Add handling for DC power mode

Joshua Ashton (1):
      drm/amd/display: Set color_mgmt_changed to true on unsuspend

Jos=C3=A9 Roberto de Souza (8):
      drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC
      drm/i915: Do not print 'pxp init failed with 0' when it succeed
      drm/xe: Make devcoredump VM error state print consistent
      drm/xe/devcoredump: Print errno if VM snapshot was not captured
      drm/xe: Nuke EXEC_QUEUE_FLAG_PERSISTENT
      drm/xe: Remove debug message from migrate_clear()
      devcoredump: Add dev_coredump_put()
      drm/xe: Remove devcoredump during driver release

Jouni H=C3=B6gander (23):
      drm/i915/display: Make intel_dp_aux_fw_sync_len available for PSR cod=
e
      drm/i915/psr: Improve fast and IO wake lines calculation
      drm/i915/psr: Calculate IO wake and fast wake lines for DISPLAY_VER <=
 12
      drm/i915/display: Increase number of fast wake precharge pulses
      drm/i915/psr: Calculate PIPE_SRCSZ_ERLY_TPT value
      drm/i915/psr: Move writing early transport pipe src
      drm/i915/psr: Fix intel_psr2_sel_fetch_et_alignment usage
      drm/i915/display: Add definition for MCURSOR_MODE_64_2B
      drm/i915/display: Implement Wa_16021440873
      drm/i915/psr: Add missing ALPM AUX-Less register definitions
      drm/i915/psr: Calculate aux less wake time
      drm/i915/psr: Silence period and lfps half cycle
      drm/i915/psr: Enable ALPM on source side for eDP Panel replay
      drm/i915/psr: Do not write ALPM configuration for PSR1 or DP2.0
Panel Replay
      drm/i915/psr: Add some documentation of variables used in psr code
      drm/i915/psr: Set intel_crtc_state->has_psr on panel replay as well
      drm/i915/psr: Intel_psr_pause/resume needs to support panel replay
      drm/i915/psr: Do not update phy power state in case of non-eDP
panel replay
      drm/i915/psr: Check possible errors for panel replay as well
      drm/i915/psr: Do not write registers/bits not applicable for panel re=
play
      drm/i915/psr: Unify panel replay enable/disable sink
      drm/i915/psr: Panel replay has to be enabled before link training
      drm/i915/psr: Use crtc_state->port_clock instead of intel_dp->link_ra=
te

Juha-Pekka Heikkila (2):
      drm/i915/display: Disable AuxCCS framebuffers if built for Xe
      drm/xe/display: Mark dpt and related vma as uncached

Justin Green (1):
      drm/mediatek: Add 0 size check to mtk_drm_gem_obj

J=C3=A9r=C3=A9mie Dautheribes (3):
      dt-bindings: Add Crystal Clear Technology vendor prefix
      dt-bindings: display: simple: add support for Crystal Clear CMT430B19=
N00
      drm/panel: simple: add CMT430B19N00 LCD panel support

Karol Herbst (1):
      drm/nouveau: move more missing UAPI bits

Karthik Poosa (4):
      drm/xe/hwmon: Add infra to support card power and energy attributes
      drm/xe: Define xe_reg_is_valid
      drm/xe/hwmon: Update xe_hwmon_get_reg to return struct xe_reg
      drm/xe/hwmon: Cast result to output precision on left shift of operan=
d

Kenneth Feng (5):
      drm/amd/pm: fix the high voltage issue after unload
      drm/amd/swsmu: add smu14 ip support
      drm/amd/swsmu: add smu14 driver if file
      drm/amd/swsmu: add smu v14_0_2 ppsmc file
      drm/amd/swsmu: support smu block discovery for smu v14

Konrad Dybcio (4):
      drm/msm: Drop msm_read/writel
      drm/msm/a6xx: Avoid a nullptr dereference when speedbin setting fails
      MAINTAINERS: Add a separate entry for Qualcomm Adreno GPU drivers
      MAINTAINERS: Add Konrad Dybcio as a reviewer for the Adreno driver

Krzysztof Kozlowski (30):
      dt-bindings: display: panel: add common dual-link schema
      dt-bindings: display: novatek, nt35950: define ports
      dt-bindings: display: novatek, nt36523: define ports
      dt-bindings: display: sony, td4353-jdi: allow width-mm and height-mm
      drm/mediatek: aal: drop driver owner initialization
      drm/mediatek: ccorr: drop driver owner initialization
      drm/mediatek: color: drop driver owner initialization
      drm/mediatek: gamma: drop driver owner initialization
      drm/mediatek: merge: drop driver owner initialization
      drm/mediatek: ovl: drop driver owner initialization
      drm/mediatek: ovl_adaptor: drop driver owner initialization
      drm/mediatek: rdma: drop driver owner initialization
      drm/mediatek: ethdr: drop driver owner initialization
      drm/mediatek: mdp_rdma: drop driver owner initialization
      drm/mediatek: padding: drop driver owner initialization
      drm/omap: dmm_tiler: drop driver owner assignment
      drm/rockchip: cdn-dp: drop driver owner assignment
      drm/bridge: chipone-icn6211: drop driver owner assignment
      drm/bridge: tc358764: drop driver owner assignment
      drm/exynos: fimc: drop driver owner initialization
      drm/exynos: fimd: drop driver owner initialization
      drm/exynos: dsi: drop driver owner initialization
      drm/exynos: g2d: drop driver owner initialization
      drm/exynos: gsc: drop driver owner initialization
      drm/exynos: mic: drop driver owner initialization
      drm/exynos: rotator: drop driver owner initialization
      drm/exynos: scaler: drop driver owner initialization
      drm/exynos: vidi: drop driver owner initialization
      drm/exynos: hdmi: drop driver owner initialization
      drm/exynos: mixer: drop driver owner initialization

Lancelot SIX (1):
      drm/amdkfd: Enable SQ watchpoint for gfx10

Lang Yu (5):
      drm/amdgpu/umsch: update UMSCH 4.0 FW interface
      drm/amdgpu: enable UMSCH 4.0.6
      drm/amdgpu/umsch: reinitialize write pointer in hw init
      drm/amdkfd: make sure VM is ready for updating operations
      drm/amdgpu/umsch: don't execute umsch test when GPU is in reset/suspe=
nd

Laurent Pinchart (4):
      dt-bindings: ili9881c: Add Startek KD050HDFIA020-C020A support
      drm/panel: ilitek-ili9881c: Add Startek KD050HDFIA020-C020A support
      drm/panel: ilitek-ili9881c: Fix warning with GPIO controllers that sl=
eep
      drm: bridge: thc63lvd1024: Print error message when DT parsing fails

Le Ma (1):
      drm/amdgpu: init microcode chip name from ip versions

Leo (Hanghong) Ma (1):
      drm/amd/display: Add OTG check for set AV mute

Leon Huang (1):
      drm/amd/display: Expand supported Replay residency mode

Lewis Huang (1):
      drm/amd/display: Add option to configure mapping policy for edp0 on d=
p1

Li Ma (2):
      drm/amd/display: add DCN 351 version for microcode load
      drm/amd/swsmu: add if condition for smu v14.0.1

Lijo Lazar (12):
      drm/amdgpu: Do a basic health check before reset
      drm/amdgpu: Refine IB schedule error logging
      drm/amdgpu: Reset dGPU if suspend got aborted
      drm/amdgpu: Fix VCN allocation in CPX partition
      drm/amdgpu: Set fatal errror detected flag earlier
      drm/amd/pm: Add PMFW message and capability flags
      drm/amd/pm: Add special handling for RAS messages
      drm/amd/pm: Categorize RAS messages on SMUv13.0.6
      drm/amd/pm: Allow setting soft max frequency in VF
      drm/amdgpu: Change AID detection logic
      drm/amdgpu: Assign correct bits for SDMA HDP flush
      drm/amd/pm: Restore config space after reset

Likun Gao (4):
      drm/amdgpu: add support for atom fw version v3_5
      drm/amd/swsmu: add pptable header for smu v14_0_2
      drm/amd/swsmu: add smu v14_0_2 support
      drm/amd/swsmu: support SMU_14_0_2 ppt_funcs

Lin.Cao (1):
      drm/amd/pm set pp_dpm_*clk as read only for SRIOV one VF mode

Liviu Dudau (3):
      dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs
      drm/panthor: Cleanup unused variable 'cookie'
      drm/panthor: Fix some kerneldoc warnings

Lu Yao (1):
      drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is selected

Luca Ceresoli (1):
      Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"

Luca Coelho (6):
      drm/xe/display: fix type of intel_uncore_read*() functions
      drm/i915/display: add support for DMC wakelocks
      drm/i915/display: don't allow DMC wakelock on older hardware
      drm/i915/display: add module parameter to enable DMC wakelock
      drm/i915/display: tie DMC wakelock to DC5/6 state transitions
      drm/i915: limit eDP MSO pipe only for display version 20 and below

Luca Weiss (2):
      dt-bindings: display: msm: dp-controller: document SM6350 compatible
      dt-bindings: display: msm: sm6350-mdss: document DP controller subnod=
e

Lucas De Marchi (25):
      drm/xe/mocs: Refactor mocs/l3cc loop
      drm/xe/mocs: Be explicit when logging number of entries
      drm/xe/mocs: Move warn/assertion up
      drm/xe/mocs: Allow odd number of entries on test
      drm/xe/mocs: Fix DG2 kunit
      drm/xe: Drop WA 16015675438
      drm/xe: Remove unused FF_SLICE_CS_CHICKEN2
      drm/xe/pvc: Fix WA 18020744125
      drm/i915: Drop WA 16015675438
      drm/xe: Group live kunit tests
      drm/xe: Fix END redefinition
      drm/i915: Drop dead code for xehpsdv
      drm/i915: Remove XEHP_FWRANGES()
      drm/i915: Stop inheriting IP_VER(12, 50)
      drm/i915: Update IP_VER(12, 50)
      drm/i915: Drop dead code for pvc
      drm/i915: Remove special handling for !RCS_MASK()
      drm/xe: Remove redundant functions to get xe
      drm/i915: Delete stray .rej file
      drm/xe: Stop passing user flag to xe_bo_create_user()
      drm/xe: Normalize bo flags macros
      drm/xe/display: Fix double mutex initialization
      drm/xe: Remove dead clock code
      drm/xe: Merge 16021540221 and 18034896535 WAs
      drm/xe/ads: Use flexible-array

Luqmaan Irshad (1):
      drm/amd/amdgpu: Update PF2VF Header

Lyude Paul (3):
      drm/nouveau/dp: Fix incorrect return code in r535_dp_aux_xfer()
      drm/nouveau/kms/nv50-: Disable AUX bus for disconnected DP ports
      drm/nouveau/dp: Don't probe eDP ports twice harder

Ma Jun (11):
      drm/amdgpu: Add a new runtime mode definition
      drm/amdgpu/pm: Change the member function name in pp_hwmgr_func
and pptable_funcs
      drm/amdgpu/pm: Add support for MACO flag checking
      drm/amdgpu: Add support for BAMACO mode checking
      drm/amdgpu/pm: Check AMDGPU_RUNPM_BAMACO when setting baco state
      drm/amdgpu: Fix discovery initialization failure during pci rescan
      drm/amdgpu: refactoring the runtime pm mode detection code
      drm/amdgpu/pm: Remove gpu_od if it's an empty directory
      drm/amdgpu/pm: Print od status info
      drm/amdgpu: Fix uninitialized variable warnings
      drm/amdgpu: Initialize timestamp for some legacy SOCs

Maarten Lankhorst (6):
      drm/xe: Move lrc snapshot capturing to xe_lrc.c
      drm/xe: Add infrastructure for delayed LRC capture
      drm/xe: Implement capture of HWSP and HWCTX
      drm/xe: Fix NULL check in xe_ggtt_init()
      drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
      drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init

Marek Vasut (5):
      drm/lcdif: Do not disable clocks on already suspended hardware
      dt-bindings: display: simple: Document support for Innolux G121XCE-L0=
1
      drm/panel: simple: Add missing Innolux G121X1-L03 format, flags, conn=
ector
      drm/panel: simple: Convert Innolux G121X1-L03 to display_timing
      drm/panel: simple: Add Innolux G121XCE-L01 LVDS display support

Marijn Suijten (4):
      drm/msm/dsi: Print dual-DSI-adjusted pclk instead of original mode pc=
lk
      drm/msm/dpu: Always flush the slave INTF on the CTL
      drm/msm/dpu: Allow configuring multiple active DSC blocks
      drm/msm/dpu: Rename `ctx` parameter to `intf` to match other function=
s

Mario Limonciello (1):
      drm/amd: Flush GFXOFF requests in prepare stage

Markus Elfring (1):
      drm/mediatek: Use devm_platform_get_and_ioremap_resource() in
mtk_hdmi_ddc_probe()

Martin Leung (1):
      drm/amd/display: revert Exit idle optimizations before HDCP execution

Masahiro Yamada (1):
      drm: move DRM-related CONFIG options into DRM submenu

Matt Roper (12):
      drm/xe: Add LRC parsing for more GPU instructions
      drm/xe/xelpg: Recognize graphics version 12.74 as Xe_LPG
      drm/xe/xelpg: Extend some workarounds to graphics version 12.74
      drm/xe/arl: Add Arrow Lake H support
      drm/xe/uapi: Add IP version and stepping to GT list query
      drm/xe/mocs: Determine MCR separately for primary/media GT in kunit t=
est
      drm/xe/mocs: Clarify which GT is being operated on
      drm/xe/xe2: Recognize Xe2_HPG IP
      drm/xe/xe2: Recognize Xe2_HPM IP
      drm/xe/bmg: Add BMG platform definition
      drm/xe/bmg: Program an additional discrete-specific PAT setting
      drm/xe: Define all possible engines in media IP descriptors

Matthew Auld (17):
      drm/xe/guc_submit: use jiffies for job timeout
      drm/xe/client: remove bogus rcu list usage
      drm/xe/client: drop bogus bo NULL check
      drm/xe/vm: fix xe_assert()
      drm/xe/queue: fix engine_class bounds check
      drm/xe/device: fix XE_MAX_GT_PER_TILE check
      drm/xe/device: fix XE_MAX_TILES_PER_DEVICE check
      drm/xe/display: mark DPT with XE_BO_PAGETABLE
      drm/xe/bb: assert width in xe_bb_create_job()
      drm/xe/bb: assert width in xe_bb_create_migration_job()
      drm/xe/query: fix gt_id bounds check
      drm/xe/stolen: lower the default alignment
      drm/xe/stolen: ignore first page for FBC
      drm/xe/vm: prevent UAF with asid based lookup
      drm/xe/vm: drop vm->destroy_work
      drm/xe/vm: don't include xe_gt.h
      drm/xe/vm: prevent UAF in rebind_work_func()

Matthew Brost (18):
      drm/xe: Fix execlist splat
      drm/xe: Cleanup some layering in GGTT
      drm/xe: Don't support execlists in xe_gt_tlb_invalidation layer
      drm/xe: Use vmalloc for array of bind allocation in bind IOCTL
      drm/xe/guc: Handle timing out of signaled jobs gracefully
      drm/xe: Fix build error in xe_ggtt.c
      drm/xe: Fix ref counting leak on page fault
      drm/xe: Pipeline evict / restore of pinned BOs during suspend / resum=
e
      drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via=
 GuC
      drm/xe: Invalidate userptr VMA on page pin fault
      drm/xe: Use xe_assert in xe_device_assert_mem_access
      drm/xe: Drop ggtt invalidate from display code
      drm/xe: Add XE_BO_GGTT_INVALIDATE flag
      drm/xe: Add debug messages for MMU notifier and VMA invalidate
      drm/xe: Use ordered wq for preempt fence waiting
      drm/xe: Always capture exec queues on snapshot
      drm/xe: Capture GuC CT snapshot when stopped
      drm/xe: Use ordered WQ for G2H handler

Maxime Ripard (18):
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
      drm/display: Select DRM_KMS_HELPER for DP helpers
      drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable
      Merge drm/drm-next into drm-misc-next

Ma=C3=ADra Canal (6):
      drm/fb_dma:
s/drm_panic_gem_get_scanout_buffer/drm_fb_dma_get_scanout_buffer
      drm/v3d: Create two functions to update all GPU stats variables
      drm/v3d: Create a struct to store the GPU stats
      drm/v3d: Create function to update a set of GPU stats
      drm/v3d: Decouple stats calculation from printing
      drm/v3d: Fix race-condition between sysfs/fdinfo and interrupt handle=
r

Melissa Wen (1):
      drm/amd/display: use mpcc_count to log MPC state

Michael Walle (3):
      dt-bindings: display: bridge: tc358775: make stby gpio optional
      drm/bridge: tc358775: fix support for jeida-18 and jeida-24
      drm/bridge: tc358775: make standby GPIO optional

Michal Wajdeczko (53):
      drm/xe: Assert size of the struct xe_reg
      drm/xe: Define XE_REG_OPTION_VF
      drm/xe: Mark VF accessible GuC registers
      drm/xe: Mark VF accessible global registers
      drm/xe: Mark VF accessible interrupt registers
      drm/xe: Make xe_mmio_read|write() functions non-inline
      drm/xe: Allow VRAM BO allocations aligned to 64K
      drm/xe/pf: Request 64K aligned allocations for LMTT PD
      drm/xe/pf: Always select Multi-Level LMTT for platforms 12.60+
      drm/xe: Move HW GGTT definitions to dedicated file
      drm/xe/guc: Fix include guard for SR-IOV ABI
      drm/xe/guc: Move GUC_ID_MAX definition to GuC ABI header
      drm/xe/guc: Introduce GuC context ID Manager
      drm/xe/kunit: Add basic tests for GuC context ID Manager
      drm/xe/guc: Use GuC ID Manager in submission code
      drm/xe: Separate pure MMIO init from VRAM checkout
      drm/xe: Move SR-IOV probe to xe_device_probe_early()
      drm/xe/vf: Add proper detection of the SR-IOV VF mode
      drm/xe/guc: Add VF_STATE_NOTIFY and VF_CONTROL to ABI
      drm/xe/pf: Add minimal support for VF_STATE_NOTIFY events
      drm/xe: Store pointer to struct xe_gt in gt/ debugfs directory
      drm/xe: Define helper for GT specific debugfs files
      drm/xe: Refactor GT debugfs
      drm/xe/guc: Prefer GT oriented logs for GuC messages
      drm/xe/guc: Reuse code while debugging GuC params
      drm/xe: Move PTE/PDE bit definitions to proper header
      drm/xe: Drop xe_vm_assert_held() macro definition from xe_bo.h
      drm/xe/guc: Use drm_device-managed version of mutex_init()
      drm/xe/guc: Initialize GuC ID manager sooner
      drm/xe/vf: Don't emit access to Global HWSP if VF
      drm/xe/vf: Don't try to program MOCS if VF
      drm/xe/vf: Don't try to read legacy GuC MMIO notification if VF
      drm/xe/vf: Mark supported firmwares as preloaded
      drm/xe: Assert pat.ops function pointers
      drm/xe: Check pat.ops before dumping PAT settings
      drm/xe: Add max_vfs module parameter
      drm/xe: Add proper detection of the SR-IOV PF mode
      drm/xe: Add SR-IOV info attribute to debugfs
      drm/xe/guc: Prefer GT oriented logs in GuC CTB code
      drm/xe/guc: Prefer GT oriented asserts in CTB code
      drm/xe/pf: Introduce mutex to protect VFs configurations
      drm/xe/pf: Introduce helper functions for use by PF
      drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
      drm/xe/guc: Add helpers for GuC KLVs
      drm/xe/pf: Add support to configure GuC SR-IOV policies
      drm/xe: Add helper to format SR-IOV function name
      drm/xe: Allow to assign GGTT region to the VF
      drm/xe: Add xe_ttm_vram_get_avail
      drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
      drm/xe/pf: Add SR-IOV PF specific early GT initialization
      drm/xe/pf: Add support to configure SR-IOV VFs
      drm/xe/pf: Fix xe_gt_sriov_pf_config_print_available_ggtt()
      drm/xe/guc: Fix arguments passed to relay G2H handlers

Mika Kuoppala (3):
      drm/xe: Expose user fence from xe_sync_entry
      drm/xe: Deny unbinds if uapi ufence pending
      drm/xe: Remove obsolete async_ops from struct xe_vm

Mikita Lipski (1):
      drm/amd/display: Fix PSR command version passed

Mitul Golani (9):
      drm/dp: Add support to indicate if sink supports AS SDP
      drm/dp: Add Adaptive Sync SDP logging
      drm/i915/display: Add crtc state dump for Adaptive Sync SDP
      drm/i915/dp: Add Read/Write support for Adaptive Sync SDP
      drm/i915/dp: Add wrapper function to check AS SDP
      drm/i915/display: Compute AS SDP parameters
      drm/i915/display: Add state checker for Adaptive Sync SDP
      drm/i915/display: Compute vrr_vsync params
      drm/i915/display: Read/Write Adaptive Sync SDP

Mounika Adhuri (1):
      drm/amd/display: Fix compiler redefinition warnings for certain confi=
gs

Muhammad Ahmed (3):
      drm/amd/display: Add debug key to allow disabling dtbclk
      drm/amd/display: Set the power_down_on_boot function pointer to null
      drm/amd/display: Skip pipe if the pipe idx not set properly

Mukul Joshi (7):
      drm/amdkfd: Rename read_doorbell_id in MQD functions
      drm/amdkfd: Check preemption status on all XCDs
      drm/amdkfd: Check cgroup when returning DMABuf info
      drm/amdkfd: Cleanup workqueue during module unload
      drm/amdgpu: Fix leak when GPU memory allocation fails
      drm/amdkfd: Add VRAM accounting for SVM migration
      drm/amdgpu: Fix VRAM memory accounting

Natanel Roizenman (3):
      drm/amd/display: Added debug prints for zstate_support and StutterPer=
iod
      drm/amd/display: Increase Z8 watermark times.
      drm/amd/display: Consolidate HPO enable/disable and restrict
only to state transitions.

Nathan Chancellor (2):
      drm/panthor: Fix clang -Wunused-but-set-variable in tick_ctx_apply()
      drm/xe: Add xe_guc_ads.c to uses_generated_oob

Nathan Morrisson (2):
      dt-bindings: display: simple: Add POWERTIP PH128800T-006-ZHC01 panel
      drm/panel: simple: Add POWERTIP PH128800T006-ZHC01 panel entry

Neil Armstrong (1):
      drm/meson: gate px_clk when setting rate

Nicholas Kazlauskas (13):
      drm/amd/display: Exit idle optimizations before HDCP execution
      drm/amd/display: Add debug prints for IPS testing
      drm/amd/display: Add guards for idle on reg read/write
      drm/amd/display: Guard cursor idle reallow by DC debug option
      drm/amd/display: Add debug counters to IPS exit prints
      drm/amd/display: Add debug option for idle reg checks
      drm/amd/display: Workaround register access in idle race with cursor
      drm/amd/display: Detect and disallow idle reallow during reentrancy
      drm/amd/display: Add optional optimization for IPS handshake
      drm/amd/display: Enable reallow for idle on DCN35
      drm/amd/display: Add new IPS config mode
      drm/amd/display: Disable Z8 minimum stutter period check for DCN35
      drm/amd/display: Pass sequential ONO bit to DMCUB boot options

Nicholas Susanto (1):
      drm/amd/display: Enabling urgent latency adjustment for DCN35

Niranjana Vishwanathapura (4):
      drm/xe: Separate out sched/deregister_done handling
      drm/xe: Streamline exec queue freeing path
      drm/xe: Use correct function pointer type
      drm/xe: Use FIELD_PREP for lrc descriptor

Nirmoy Das (11):
      drm/i915: Add missing doc for drm_i915_reset_stats
      drm/xe: Remove unused 'create' parameter from queue property logic
      drm/i915/selftests: Pick correct caching mode.
      drm/xe: Remove unused xe_bo->props struct
      drm/xe: Fix potential integer overflow in page size calculation
      drm/xe: Drop bogus vma NULL check
      drm/xe: Remove usage of unsafe strcpy
      drm/xe: Add a NULL check in xe_ttm_stolen_mgr_init
      drm/xe: Create a helper function to init job's user fence
      drm/i915: Refactor confusing __intel_gt_reset()
      drm/i915: Fix gt reset with GuC submission is disabled

N=C3=ADcolas F. R. A. Prado (9):
      drm/bridge: anx7625: Don't log an error when DSI host can't be found
      drm/bridge: icn6211: Don't log an error when DSI host can't be found
      drm/bridge: lt8912b: Don't log an error when DSI host can't be found
      drm/bridge: lt9611: Don't log an error when DSI host can't be found
      drm/bridge: lt9611uxc: Don't log an error when DSI host can't be foun=
d
      drm/bridge: tc358775: Don't log an error when DSI host can't be found
      drm/bridge: dpc3433: Don't log an error when DSI host can't be found
      drm/panel: novatek-nt35950: Don't log an error when DSI host
can't be found
      drm/panel: truly-nt35597: Don't log an error when DSI host can't be f=
ound

Oak Zeng (2):
      drm/xe: Introduce helper to populate userptr
      drm/xe: Use hmm_range_fault to populate user pages

Ovidiu Bunea (1):
      drm/amd/display: Revert "Set the power_down_on_boot function
pointer to null"

Parandhaman K (1):
      drm/amd/display: refactor vpg.h

Paulo Zanoni (1):
      drm/xe: get rid of MAX_BINDS

Peyton Lee (2):
      drm/amdgpu/vpe: power on vpe when hw_init
      drm/amdgpu/vpe: fix vpe dpm setup failed

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu/vcn: fix unitialized variable warnings

Pin-yen Lin (1):
      drm/panel-edp: Add AUO B120XAN01.0

Prike Liang (1):
      drm/amdgpu: Fix the ring buffer size for queue VM flush

Priyanka Dandamudi (1):
      drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move trace

Qili Lu (1):
      Revert "drm/amd/display: Enabling urgent latency adjustment for DCN35=
"

Radhakrishna Sripada (9):
      drm/i915: Pass size to oprom_get_vbt
      drm/i915: Pass size to spi_oprom_get_vbt
      drm/i915: Move vbt read from firmware to intel_bios.c
      drm/i915: Extract opregion vbt presence check
      drm/i915: Duplicate opregion vbt memory
      drm/i915: Show bios vbt when read from firmware/spi/oprom
      drm/i915: Reuse RPLU cdclk fns for MTL+
      drm/i915/xelpg: Add Wa_14020495402
      drm/xe/xelpg: Add Wa_14020495402

Rajneesh Bhardwaj (1):
      drm/amdgpu: Update CGCG settings for GFXIP 9.4.3

Ravi Kumar Vodapalli (2):
      drm/xe: Add new PCI IDs to DG2 platform
      drm/i915: Add new PCI IDs to DG2 platform in driver

Revalla Hari Krishna (1):
      drm/amd/display: Refactor DPP into a component directory

Riana Tauro (2):
      drm/xe: check pcode init status only on root gt of root tile
      drm/xe: re-order lmem init check and wait for initialization to compl=
ete

Richard Acayan (2):
      dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
      drm/panel: add samsung s6e3fa7 panel driver

Rob Clark (1):
      drm/msm/a6xx: Cleanup indexed regs const'ness

Robin Chen (1):
      drm/amd/display: Support long vblank feature

Rodrigo Siqueira (57):
      drm/amd/display: Add comments to v_total calculation and drop legacy =
TODO
      drm/amd/display: Remove code duplication
      drm/amd/display: Remove wrong signal from vrr calculation
      drm/amd/display: Enable 2to1 ODM policy for DCN35
      drm/amd/display: Add the MALL size in the fallback function
      drm/amd/display: Move define to the proper header
      drm/amd/display: Enable fast update for DCN314
      drm/amd/display: Remove legacy code
      drm/amd/display: Comments adjustments
      drm/amd/display: Add missing registers and offset
      drm/amd/display: Initialize DP ref clk with the correct clock
      drm/amd/display: Set alpha enable to 0 for some specific formats
      drm/amd/display: Enable cur_rom_en even if cursor degamma is not enab=
led
      drm/amd/display: Add some missing debug registers
      drm/amd/display: Update DSC compute parameter calculation
      drm/amd/display: Drop legacy code
      drm/amd/display: Add missing registers
      drm/amd/display: Remove redundant RESERVE0 and RESERVE1
      drm/amd/display: Add missing SFB and OPP_SF
      drm/amd/display: Initialize debug variable data
      drm/amd/display: Add WBSCL ram coefficient for writeback
      drm/amd/display: Add code comments clock and encode code
      drm/amd/display: Includes adjustments
      drm/amd/display: Add color logs for dcn20
      drm/amd/display: Enable FGCG for DCN351
      drm/amd/display: Add V_TOTAL_REGS to dcn10
      drm/amd/display: Add comments to improve the code readability
      drm/amd/display: Adjust some includes used by display
      drm/amd/display: Drop legacy code
      drm/amd/display: Update resource capabilities and debug struct for DC=
N201
      drm/amd/display: Disable P010 Support of DCN 1.0
      drm/amd/display: Update DCN10 resource
      drm/amd/display: Add fallback configuration when set DRR
      drm/amd/display: Add fallback configuration for set DRR in DCN10
      drm/amd/display: Change DPCD address range
      drm/amd/display: Reorganize dwb header
      drm/amd/display: Use dce_version instead of chip_id
      drm/amd/display: Adjust headers
      drm/amd/display: Group scl_data together in resource_build_scaling_pa=
rams
      drm/amd/display: Replace int with unsigned int
      drm/amd/display: Update some comments to improve the code readability
      drm/amd/display: Remove unnecessary code
      drm/amd/display: Rework dcn10_stream_encoder header
      drm/amd/display: Move REG sequence from program ogam to idle
before connect
      drm/amd/display: Update DCN201 link encoder registers
      drm/amd/display: Add missing callback for init_watermarks in DCN 301
      drm/amd/display: Add missing replay field
      Revert "drm/amd/display: Enable cur_rom_en even if cursor
degamma is not enabled"
      Revert "drm/amd/display: Add fallback configuration when set DRR"
      drm/amd/display: Add missing debug registers for DCN2/3/3.1
      drm/amd/display: Add missing dwb registers
      drm/amd/display: Add TMDS DC balancer control
      drm/amd/display: Add some missing HDMI registers for DCN3x
      drm/amd/display: Clean up code in DC
      drm/amd/display: Adjust registers sequence in the DIO list
      drm/amd/display: Code style adjustments
      drm/amd/display: Add some HDCP registers DCN35 list

Rodrigo Vivi (35):
      drm/xe: Document Xe PM component
      drm/xe: Convert mem_access assertion towards the runtime_pm state
      drm/xe: Runtime PM wake on every IOCTL
      drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
      drm/xe: Runtime PM wake on every sysfs call
      drm/xe: Remove mem_access from guc_pc calls
      drm/xe: Runtime PM wake on every debugfs call
      drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
      drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
      drm/xe: Remove useless mem_access protection for query ioctls
      drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
      drm/xe: Remove mem_access from suspend and resume functions
      drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
      drm/xe: Remove useless mem_access on PAT dumps
      drm/xe: Fix display runtime_pm handling
      drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
      drm/xe: Convert xe_pm_runtime_{get, put} to void and protect
from recursion
      drm/xe: Return immediately on tile_init failure
      drm/xe: Convert gt suspend/resume messages to debug
      drm/xe: Add dbg messages on the suspend resume functions.
      Merge drm/drm-next into drm-intel-next
      drm/i915/guc: Remove bogus null check
      drm/xe: Protect devcoredump access after unbind
      drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
      drm/xe: Introduce intel_runtime_pm_get_noresume at
compat-i915-headers for display
      drm/i915/display: convert inner wakeref get towards get_if_in_use
      drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
      drm/xe: Remove useless mem_access during probe
      drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
      drm/xe: Removing extra mem_access protection from runtime pm
      drm/xe: Convert mem_access_if_ongoing to direct
xe_pm_runtime_get_if_active
      drm/xe: Ensure all the inner access are using the _noresume variant
      drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf
      drm/i915: Convert intel_runtime_pm_get_noresume towards raw wakeref
      drm/xe: Kill xe_device_mem_access_{get*,put}

Rohit Visavalia (1):
      drm: xlnx: dp: Reset DisplayPort IP

Roman Li (3):
      drm/amd/display: Fix function banner for amdgpu_dm_psr_disable_all()
      drm/amd/display: Fix bounds check for dcn35 DcfClocks
      drm/amd/display: Allow RCG for Static Screen + LVP for DCN35

Samson Tam (3):
      drm/amd/display: clear mpc_tree in init_pipes
      drm/amd/display: fix underflow in some two display subvp/non-subvp co=
nfigs
      drm/amd/display: add support for chroma offset

Sathishkumar S (1):
      drm/amdgpu: update jpeg max decode resolution

Sean Anderson (1):
      drm: zynqmp_dpsub: Always register bridge

Sebastian Wick (1):
      drm: Document requirements for driver-specific KMS props in new drive=
rs

Shashank Sharma (3):
      drm/amdgpu: cleanup unused variable
      drm/amdgpu: sync page table freeing with tlb flush
      drm/amdgpu: Add a NULL check for freeing root PT

Shekhar Chauhan (2):
      drm/i915/dp: Increase idle pattern wait timeout to 2ms
      drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG.

Sherry Wang (1):
      drm/amd/display: correct hostvm flag

Shivani Gupta (1):
      gpu: drm: exynos: hdmi: eliminate uses of of_node_put()

Shuicheng Lin (1):
      drm/xe/xe_tracer: Align fence output format in ftrace log

Shuijing Li (1):
      drm/mediatek: dsi: Correct calculation formula of PHY Timing

Simon Horman (1):
      Documentation/gpu: correct path of reference

Sohaib Nadeem (1):
      drm/amd/display: Added missing null checks

Sonny Jiang (1):
      drm/amdgpu: update fw_share for VCN5

Sridevi Arvindekar (1):
      drm/amd/display: Increase number of hpo dp link encoders

Srinivasan Shanmugam (14):
      drm/amd/display: Fix potential index out of bounds in color
transformation function
      drm/amdgpu: Fix truncation issues in smu_v13_0_init_microcode
      drm/amd/display: Address kdoc for
commit_minimal_transition_state_in_dc_update()
      drm/amd/display: Remove redundant condition in dcn35_calc_blocks_to_g=
ate()
      drm/amdgpu: Fix format character cut-off issues in amdgpu_vcn_early_i=
nit()
      drm/amdgpu: Fix 'fw_name' buffer size to prevent truncations in
amdgpu_mes_init_microcode
      drm/amdgpu: Fix truncation in gfx_v10_0_init_microcode
      drm/amdgpu: Fix truncation issues in gfx_v9_0.c
      drm/amdgpu: Fix truncation in smu_v11_0_init_microcode
      drm/amdgpu: Fix truncations in gfx_v11_0_init_microcode()
      drm/amd/display: Add missing parameter desc in dc_commit_streams
      drm/amdgpu: Fix snprintf buffer size in smu_v14_0_init_microcode
      drm/amd/display: Remove unnecessary NULL check in
dcn20_set_input_transfer_func
      drm/amdgpu: Fix buffer size in gfx_v9_4_3_init_
cp_compute_microcode() and rlc_microcode()

Stanislav Lisovskiy (8):
      drm/i915: Loop over all active pipes in intel_mbus_dbox_update
      drm/i915: Use old mbus_join value when increasing CDCLK
      drm/i915: Implement vblank synchronized MBUS join changes
      drm/i915: Handle joined pipes inside hsw_crtc_enable()
      drm/i915/display: Add meaningful traces for QGV point info error hand=
ling
      drm/i915/display: Extract code required to calculate max qgv/psf gv p=
oint
      drm/i915/display: Disable SAGV on bw init, to force QGV point
recalculation
      drm/i915/display: handle systems with duplicate psf gv points

Stanley.Yang (1):
      drm/amdgpu: Support setting reset_method at runtime

Steven Price (1):
      drm/panthor: Don't use virt_to_pfn()

Sui Jingfeng (4):
      drm/bridge: ite66121: Register HPD interrupt handler only when
'client->irq > 0'
      drm: bridge: dw_hdmi: Switch to of_graph_get_remote_node()
      drm/bridge: it66121: Remove a duplicated invoke of
of_device_is_available()
      drm: bridge: thc63lvd1024: Switch to use of_graph_get_remote_node()

Sumit Semwal (2):
      dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
      drm: panel: Add LG sw43408 panel driver

Sung Joon Kim (9):
      drm/amd/display: Enable new interface design for alternate scrambling
      drm/amd/display: Update dcn351 to latest dcn35 config
      drm/amd/display: Remove read/write to external register
      drm/amd/display: Increase clock table size
      drm/amd/display: Enable DTBCLK DTO earlier in the sequence
      drm/amd/display: Modify power sequence
      drm/amd/display: Modify resource allocation logic
      drm/amd/display: Enable Z10 flag for IPS FSM
      drm/amd/display: Rework power sequence and resource allocation logic

Sunil Khatri (20):
      drm/amdgpu: add recent pagefault info in vm_manager
      drm/amdgpu: add vm fault information to devcoredump
      drm/amdgpu: add ring buffer information in devcoredump
      drm/amdgpu: add the hw_ip version of all IP's
      drm/amdgpu: remove the adev check for NULL
      drm/amdgpu: refactor code to split devcoredump code
      drm/amdgpu: add IP's FW information to devcoredump
      drm/amdgpu: add missing vbios version from devcoredump
      drm:amdgpu: enable IH RB ring1 for IH v6.0
      drm:amdgpu: enable IH ring1 for IH v6.1
      drm/amdgpu: add IH_RING1_CFG headers for IH v6.0
      drm/amdgpu: enable redirection of irq's for IH V6.0
      drm/amdgpu: enable redirection of irq's for IH V6.1
      drm/amdgpu: add prototype for ip dump
      drm/amdgpu: add support of gfx10 register dump
      drm/amdgpu: add protype for print ip state
      drm/amdgpu: add support for gfx v10 print
      drm/amdgpu: dump ip state before reset for each ip
      drm/amdgpu: add ip dump for each ip in devcoredump
      drm/amdgpu: skip ip dump if devcoredump flag is set

Suraj Kandpal (8):
      drm/i915/hdcp: Move intel_hdcp_gsc_message def away from header file
      drm/xe/hdcp: Use xe_device struct
      drm/xe: Use gsc_proxy_init_done to check proxy status
      drm/xe/hdcp: Enable HDCP for XE
      drm/xe/gsc: Fix kernel doc for xe_gsc_create_host_session_id
      drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
      drm/i915/display: Initialize capability variables
      drm/i915/hdcp: Fix get remote hdcp capability function

Taimur Hassan (1):
      drm/amd/display: Send DTBCLK disable message on first commit

Tao Zhou (13):
      drm/amdgpu: add new bit definitions for GC 9.0 PROTECTION_FAULT_STATU=
S
      drm/amdgpu: add utcl2 poison query for gfxhub
      drm/amdgpu: retire gfx ras query_utcl2_poison_status
      drm/amdgpu: skip GFX FED error in page fault handling
      drm/amdgpu: add utcl2 RAS poison query for mmhub
      drm/amdgpu: support utcl2 RAS poison query for mmhub
      drm/amdgpu: make reset method configurable for RAS poison
      drm/amdgpu: add socket id parameter for psp query address cmd
      drm/amdgpu: simplify convert_error_address interface for UMC v12
      drm/amdgpu: implement IRQ_STATE_ENABLE for SDMA v4.4.2
      drm/amd/pm: update XGMI RAS UE criteria for sum v13.0.6
      drm/amdgpu: update check condition for XGMI ACA UE
      drm/amdgpu: retire UMC v12 mca_addr_to_pa

Tejas Upadhyay (2):
      drm/i915/mtl: Update workaround 14018575942
      drm/xe/gt: Remove continue statement which has no effect

Thomas Hellstr=C3=B6m (6):
      drm/xe: Use ring ops TLB invalidation for rebinds
      drm/xe: Rework rebinding
      drm/xe: Make TLB invalidation fences unordered
      drm/xe: Move vma rebinding to the drm_exec locking loop
      Merge drm/drm-next into drm-xe-next
      drm/xe: Fix unexpected backmerge results

Thomas Zimmermann (38):
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
      Merge drm/drm-next into drm-misc-next
      drm/ast: Include <linux/of.h> where necessary
      drm/ast: Fail probing if DDC channel could not be initialized
      drm/ast: Remove struct ast_{vga,sil165}_connector
      drm/ast: Allocate instance of struct ast_i2c_chan with managed helper=
s
      drm/ast: Move DDC code to ast_ddc.{c,h}
      drm/ast: Rename struct ast_i2c_chan to struct ast_ddc
      drm/ast: Pass AST device to ast_ddc_create()
      drm/ast: Store AST device in struct ast_ddc
      drm/ast: Rename struct i2c_algo_bit_data callbacks and their paramete=
rs
      drm/ast: Acquire I/O-register lock in DDC code
      drm/ast: Use drm_connector_helper_get_modes()
      drm/ast: Implement polling for VGA and SIL164 connectors
      drm/ast: Automatically clean up poll helper
      drm/ast: Set DDC timeout in milliseconds
      drm/ast: Group DDC init code by data structure
      drm/ast: Define struct ast_ddc in ast_ddc.c
      drm/client: Export drm_client_dev_unregister()
      drm/i915: Move fbdev functions
      drm/i915: Initialize fbdev DRM client with callback functions
      drm/{i915,xe}: Unregister in-kernel clients
      drm/{i915,xe}: Implement fbdev client callbacks
      drm/{i915, xe}: Implement fbdev emulation as in-kernel client
      drm/fbdev-generic: Do not set physical framebuffer address

Thorsten Blum (1):
      drm/amdgpu: Add missing space to DRM_WARN() message

Tim Huang (3):
      drm/amd/pm: fixes a random hang in S4 for SMU v13.0.4/11
      drm/amdgpu: fix incorrect number of active RBs for gfx11
      drm/amdgpu: fix uninitialized scalar variable warning

Tomi Valkeinen (1):
      MAINTAINERS: Add myself as maintainer for Xilinx DRM drivers

Tony Lindgren (9):
      drm/omapdrm: Fix console by implementing fb_dirty
      drm/omapdrm: Fix console with deferred ops
      dt-bindings: display: bridge: tc358775: Add data-lanes
      dt-bindings: display: bridge: tc358775: Add support for tc358765
      drm/bridge: tc358775: Get bridge data lanes instead of the DSI host l=
anes
      drm/bridge: tc358775: Add burst and low-power modes
      drm/bridge: tc358775: Enable pre_enable_prev_first flag
      drm/bridge: tc358775: Add support for tc358765
      drm/bridge: tc358775: Configure hs_rate and lp_rate

Tvrtko Ursulin (1):
      dma-buf: Do not build debugfs related code when !CONFIG_DEBUG_FS

Uwe Kleine-K=C3=B6nig (2):
      drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove callback
returning void
      drm/bridge: imx8mp-hdmi-tx: Convert to platform remove callback
returning void

Victor Skvortsov (1):
      drm/amdgpu: Skip virt_exchange_init on SDMA poison consumption

Vidya Srinivas (1):
      drm/i915: Allow bigjoiner for MST

Vignesh Raman (1):
      drm/ci: update device type for volteer devices

Ville Syrj=C3=A4l=C3=A4 (122):
      drm/i915: Don't explode when the dig port we don't have an AUX CH
      drm/i915: Simplify aux_ch_to_digital_port()
      drm/i915: Stop doing double audio enable/disable on SDVO and g4x+ DP
      drm/i915/dsi: Go back to the previous INIT_OTP/DISPLAY_ON order, most=
ly
      drm/i915/vrr: Generate VRR "safe window" for DSB
      drm/i915/dsb: Fix DSB vblank waits when using VRR
      drm/i915/dsb: Always set DSB_SKIP_WAITS_EN
      drm/i915: Rename ICL_AUX_ANAOVRD1 to ICL_PORT_TX_DW6_AUX
      drm/i915: Use REG_BIT() & co. in intel_combo_phy_regs.h
      drm/i915: Use pw_idx to derive PHY for ICL_LANE_ENABLE_AUX override
      drm/i915: Streamline eDP handling in icl_combo_phy_aux_power_well_ena=
ble()
      drm/i915/fbc: Don't use a fence for a plane if FBC is not possible
      drm/i915/fbc: Move DPFC_CHICKEN programming into
intel_fbc_program_workarounds()
      drm/i915: Precompute disable_pipes bitmask in
intel_commit_modeset_disables()
      drm/i915: Disable planes more atomically during modesets
      drm/i915: Simplify intel_old_crtc_state_disables() calling convention
      drm/i915/dsi: Use enc_to_intel_dsi()
      drm/i915: Don't cast away const
      drm/i915: Use container_of_const() for states
      drm/i915: Drop pointless (void*) cast
      drm/i915: Indicate which pipe failed the fastset check overall
      drm/i915: Include CRTC info in infoframe mismatch prints
      drm/i915: Include CRTC info in VSC SDP mismatch prints
      drm/i915: Convert pipe_config_infoframe_mismatch() to drm_printer
      drm/i915: Convert pipe_config_buffer_mismatch() to drm_printer
      drm/i915: Convert intel_dpll_dump_hw_state() to drm_printer
      drm/i915: Use drm_printer more extensively in intel_crtc_state_dump()
      drm/i915: Convert the remaining state dump to drm_printer
      drm/i915: Skip intel_crtc_state_dump() if debugs aren't enabled
      drm/i915: Relocate pipe_config_mismatch()
      drm/i915: Reuse pipe_config_mismatch() more
      drm/i915: Create the printer only once in intel_pipe_config_compare()
      drm/i915: Rename ICL_PORT_TX_DW6 bits
      drm/i915/bios: s/dpfs/dfps/
      drm/i915/bios: Update VBT driver feature block version numbers
      drm/i915/bios: Add the old DPST field into VBT LFP power block
      drm/i915/bios: Define the (obsolete) backlight i2c VBT stuff
      drm/i915/bios: Pimp the VBT backlight data BDB version comments
      drm/i915: Pre-populate the cursor physical dma address
      drm/i915/bios: Tolerate devdata=3D=3DNULL in
intel_bios_encoder_supports_dp_dual_mode()
      drm/i915/bios: Use the platform's port_mask when there is no VBT
      drm/i915: Remove DRM_MODE_FLAG_DBLSCAN checks from .mode_valid() hook=
s
      drm/i915: Shuffle DP .mode_valid() checks
      drm/i915: Clean up glk_pipe_scaler_clock_gating_wa()
      drm/i915: Extract glk_need_scaler_clock_gating_wa()
      drm/i915/mst: Limit MST+DSC to TGL+
      drm/i915/mst: Reject FEC+MST on ICL
      drm/i915: Use debugfs_create_bool() for "i915_bigjoiner_force_enable"
      drm/i915/cdclk: Fix CDCLK programming order when pipes are active
      drm/i915/cdclk: Fix voltage_level programming edge case
      drm/i915/cdclk: Drop tgl/dg2 cdclk bump hacks
      drm/i915/cdclk: Indicate whether CDCLK change happens during pre
or post plane update
      drm/i915: Relocate intel_mbus_dbox_update()
      drm/i915: Extract intel_dbuf_mbus_join_update()
      drm/i915: Extract intel_dbuf_mdclk_min_tracker_update()
      drm/i915: Add debugs for mbus joining and dbuf ratio programming
      drm/i915: Use the correct mdclk/cdclk ratio in MBUS updates
      drm/i915: Use a plain old int for the cdclk/mdclk ratio
      drm/i915: Optimize out redundant dbuf slice updates
      drm/i915: Fix i915_display_info output when connectors are not active
      drm/i915/psr: Disable PSR when bigjoiner is used
      drm/i915: Disable port sync when bigjoiner is used
      drm/i915: Disable live M/N updates when using bigjoiner
      drm/i915/vrr: Disable VRR when using bigjoiner
      drm/i915: Fix intel_modeset_pipe_config_late() for bigjoiner
      drm/i915: Update pipes in reverse order for bigjoiner
      drm/i915: s/intel_dp_can_bigjoiner()/intel_dp_has_bigjoiner()/
      drm/i915: Extract intel_dp_joiner_needs_dsc()
      drm/i915/mst: Check intel_dp_joiner_needs_dsc()
      drm/i915: Pass connector to intel_dp_need_bigjoiner()
      drm/i915: Introduce intel_crtc_joined_pipe_mask()
      drm: Introduce plane SIZE_HINTS property
      drm/i915: Add SIZE_HINTS property for cursors
      drm/i915: Extract intel_ddi_post_disable_hdmi_or_sst()
      drm/i915: Utilize intel_crtc_joined_pipe_mask() more
      drm/i915: Handle joined pipes inside hsw_crtc_disable()
      drm/i915/mst: Add bigjoiner handling to MST modeset sequence
      drm/i915: Replace hand rolled PLL state dump with
intel_dpll_dump_hw_state()
      drm/i915: Use printer for the rest of PLL debugfs dump
      drm/i915: Rename PLL hw_state variables/arguments
      drm/i915: Introduce some local PLL state variables
      drm/i915: Extract ilk_fb_cb_factor()
      drm/i915: Extract ilk_dpll_compute_fp()
      drm/i915: Extract i9xx_dpll_get_hw_state()
      drm/i915: Pass the PLL hw_state to pll->enable()
      drm/i915: Extract i965_dpll_md()
      drm/i915: Extract {i9xx,i8xx,ilk,vlv,chv}_dpll()
      drm/i915: Inline {i9xx,ilk}_update_pll_dividers()
      drm/i915: Modernize i9xx_pll_refclk()
      drm/i915: Drop pointless 'crtc' argument from *_crtc_clock_get()
      drm/i915: s/pipe_config/crtc_state/ in legacy PLL code
      drm/i915: Add local DPLL 'hw_state' variables
      drm/i915: Carve up struct intel_dpll_hw_state
      drm/i915: Unionize dpll_hw_state
      drm/i915: Suck snps/cx0 PLL states into dpll_hw_state
      drm/vblank: Introduce drm_crtc_vblank_crtc()
      drm/nouveau: Use drm_crtc_vblank_crtc()
      drm/vkms: Use drm_crtc_vblank_crtc()
      drm/i915/dpio: Clean up bxt/glk PHY registers
      drm/i915/dpio: Add per-lane PHY TX register definitons for bxt/glk
      drm/i915/dpio: Extract bxt_dpio_phy_regs.h
      drm/i915/dpio: Introdude bxt_ddi_phy_rmw_grp()
      drm/i915/dpio: Use intel_de_rmw() for BXT DPIO latency optim setup
      drm/i915/dpio: s/ddi/dpio/ for bxt/glk PHY stuff
      drm/i915/dpio: Program bxt/glk PHY TX registers per-lane
      drm/i915: Enable per-lane DP drive settings for bxt/glk
      drm/edid: Parse topology block for all DispID structure v1.x
      drm: Fix plane SIZE_HINTS property docs
      drm/i915/dpio: Remove pointless VLV_PCS01_DW8 read
      drm/i915/dpio: s/VLV_REF_DW13/VLV_REF_DW11/
      drm/i915/dpio: s/VLV_PLL_DW9_BCAST/VLV_PCS_DW17_BCAST/
      drm/i915/dpio: Fix VLV DPIO PLL register dword numbering
      drm/i915/dpio: Remove pointless variables from vlv/chv DPLL code
      drm/i915/dpio: Rename some variables
      drm/i915/dpio: s/port/ch/
      drm/i915/dpio: s/pipe/ch/
      drm/i915/dpio: Derive the phy from the port rather than pipe in
encoder hooks
      drm/i915/dpio: Give VLV DPIO group register a clearer name
      drm/i915/dpio: Rename a few CHV DPIO PHY registers
      drm/i915/dpio: Clean up VLV/CHV DPIO PHY register defines
      drm/i915/dpio: Clean up the vlv/chv PHY register bits
      drm/i915/dpio: Extract vlv_dpio_phy_regs.h

Vinay Belgaumkar (4):
      drm/i915/guc: Use context hints for GT frequency
      drm/xe/guc: Add some failure checks
      drm/xe/guc: Remove explicit shutdown of SLPC
      drm/xe/lnl: Apply GuC Wa_13011645652

Vinod Govindapillai (2):
      drm/i915/display: extract code to prepare qgv points mask
      drm/i915/display: force qgv check after the hw state readout

Wenjing Liu (11):
      drm/amd/display: Implement update_planes_and_stream_v3 sequence
      drm/amd/display: skip forcing odm in minimal transition
      drm/amd/display: fix a bug to dereference already freed old
current state memory
      drm/amd/display: fix a dereference of a NULL pointer
      drm/amd/display: fix nonseamless transition from ODM + MPO to ODM + s=
ubvp
      drm/amd/display: build scaling params when a new plane is appended
      drm/amd/display: optimize dml2 pipe resource allocation order
      drm/amd/display: update pipe topology log to support subvp
      drm/amd/display: move build test pattern params as part of pipe
resource update for odm
      drm/amd/display: always reset ODM mode in context when adding first p=
lane
      drm/amd/display: fix an incorrect ODM policy assigned for subvp

Wojciech Macek (1):
      drm/mediatek: dp: Fix mtk_dp_aux_transfer return value

Wolfram Sang (1):
      drm: tilcdc: don't use devm_pinctrl_get_select_default() in probe

Xi (Alex) Liu (1):
      drm/amd/display: add root clock control function pointer to fix
display corruption

Xi Liu (3):
      drm/amd/display: increase bb clock for DCN351
      drm/amd/display: Remove unnecessary hard coded DPM states
      drm/amd/display: Set DCN351 BB and IP the same as DCN35

Xiang Yang (1):
      drm/amd/display: delete the redundant initialization in dcn3_51_soc

Xiaojian Du (7):
      drm/amdgpu: add the sensor value of VCN activity
      drm/amdgpu: add VCN sensor value for SMU 13.0.4
      drm/admgpu: add vclk and dclk sysfs node for some ASICs
      drm/amdgpu: add VCN sensor value for Vangogh
      drm/amdgpu: add VCN sensor value for yellow carp
      drm/amdgpu: add VCN sensor value for SMU 13.0.5
      drm/amdgpu: add VCN sensor value for SMU 14.0.0

Xuxin Xiong (2):
      drm/panel-edp: Add BOE NT116WHM-N44 and CMN N116BCA-EA1
      drm/panel-edp: Add panel CSOT MNB601LS1-1

Yang Wang (18):
      drm/amdgpu: add ras event id support
      drm/amdgpu: add new aca_smu_type support
      drm/amdgpu: add new api to save error count into aca cache
      drm/amdgpu: refine aca error cache for gfx v9.4.3
      drm/amdgpu: refine aca error cache for mmhub v1.8
      drm/amdgpu: refine aca error cache for xgmi v6.4.0
      drm/amdgpu: refine aca error cache for sdma v4.4.2
      drm/amdgpu: refine aca error cache for umc v12.0
      drm/amdgpu: retire unused aca_bank_report data structure
      drm/amdgpu: add aca deferred error type support
      drm/amdgpu: add umc v12.0.0 deferred error support
      drm/amdgpu: retrieve umc odecc error count for aca umc v12.0
      drm/amdgpu: avoid update aca bank multi times during ras isr
      drm/amdgpu: add ras event id support for ACA
      drm/amdgpu: make amdgpu device attr_update() function more efficient
      drm/amdgpu: refine function signature of amdgpu_aca_get_error_data()
      drm/amd/pm: centralize all pp_dpm_xxx attribute nodes update cb
      drm/amdgpu: add new aca smu callback func parse_error_code()

YiPeng Chai (16):
      drm/amdgpu: Add interface to reserve bad page
      drm/amdgpu: add message fifo to handle RAS poison events
      drm/amdgpu: prepare for logging ecc errors
      drm/amdgpu: add poison creation handler
      drm/amdgpu: add interface to update umc v12_0 ecc status
      drm/amdgpu: umc v12_0 converts error address
      drm/amdgpu: umc v12_0 logs ecc errors
      drm/amdgpu: Add delay work to retire bad pages
      drm/amdgpu: add condition check for amdgpu_umc_fill_error_record
      drm/amdgpu: retire bad pages for umc v12_0
      drm/amdgpu: prepare to handle pasid poison consumption
      drm/amdgpu: add poison consumption handler
      drm/amdgpu: support ACA logging ecc errors
      drm/amdgpu: Fix address translation defect
      drm/amdgpu: Use new interface to reserve bad page
      drm/amdgpu: Fix ras mode2 reset failure in ras aca mode

Yifan Zhang (2):
      drm/amdgpu: add smu 14.0.1 discovery support
      drm/amdgpu: differentiate external rev id for gfx 11.5.0

Zack Rusin (2):
      drm/vmwgfx: Implement virtual kms
      drm/vmwgfx: Implement virtual crc generation

Zan Dobersek (2):
      drm/msm/a7xx: allow writing to CP_BV counter selection registers
      drm/msm/adreno: fix CP cycles stat retrieval on a7xx

Zhanjun Dong (2):
      drm/xe/guc: Fix missing topology init
      drm/xe: Add helper macro to loop each DSS

ZhenGuo Yin (2):
      drm/amdgpu: select HDP ref/mask according to gfx ring pipe
      drm/amdgpu: clear set_q_mode_offs when VM changed

Zhengqiao Xia (1):
      drm/panel-edp: Add prepare_to_enable to 200ms for MNC207QS1-1

Zhigang Luo (4):
      drm/amdgpu: trigger flr_work if reading pf2vf data failed
      amd/amdkfd: sync all devices to wait all processes being evicted
      amd/amdgpu: improve VF recover time
      drm/amdgpu: remove virt_init_data_exchange from poison consumption ha=
ndler

Zhongwei (1):
      drm/amd/display: Adjust dprefclk by down spread percentage.

chongli2 (1):
      drm/amd/amdgpu: support MES command SET_HW_RESOURCE1 in sriov

lima1002 (2):
      drm/amd/swsmu: add smu 14.0.1 vcn and jpeg msg
      drm/amd/swsmu: Update smu v14.0.0 headers to be 14.0.1 compatible

shaoyunl (2):
      drm/amdgpu : Add mes_log_enable to control mes log feature
      drm/amdgpu : Increase the mes log buffer size as per new MES FW versi=
on

xinhui pan (1):
      drm/amdgpu: validate the parameters of bo mapping operations more cle=
arly

 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |    94 +-
 .../ABI/testing/sysfs-driver-panfrost-profiling    |    10 +
 .../bindings/display/bridge/ite,it6505.yaml        |     8 +-
 .../bindings/display/bridge/lvds-codec.yaml        |     1 +
 .../display/bridge/microchip,sam9x75-lvds.yaml     |    55 +
 .../bindings/display/bridge/toshiba,tc358775.yaml  |    39 +-
 .../bindings/display/mediatek/mediatek,gamma.yaml  |     5 +
 .../bindings/display/msm/dp-controller.yaml        |     1 +
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |     9 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |     1 +
 .../bindings/display/panel/lg,sw43408.yaml         |    62 +
 .../bindings/display/panel/novatek,nt35950.yaml    |     3 +-
 .../bindings/display/panel/novatek,nt36523.yaml    |    25 +-
 .../bindings/display/panel/panel-common-dual.yaml  |    47 +
 .../bindings/display/panel/panel-simple-dsi.yaml   |     4 +
 .../bindings/display/panel/panel-simple.yaml       |     6 +
 .../bindings/display/panel/raydium,rm69380.yaml    |    89 +
 .../display/panel/rocktech,jh057n00900.yaml        |     2 +
 .../bindings/display/panel/sony,td4353-jdi.yaml    |     2 +
 .../display/rockchip/rockchip,dw-hdmi.yaml         |     5 +
 .../display/rockchip/rockchip,inno-hdmi.yaml       |     5 +
 .../display/rockchip/rockchip,rk3066-hdmi.yaml     |     7 +
 .../bindings/gpu/arm,mali-valhall-csf.yaml         |   147 +
 .../devicetree/bindings/vendor-prefixes.yaml       |     4 +
 Documentation/driver-api/dma-buf.rst               |     2 +-
 Documentation/gpu/amdgpu/debugging.rst             |    80 +
 .../gpu/amdgpu/display/display-contributing.rst    |     2 +-
 Documentation/gpu/amdgpu/index.rst                 |     1 +
 Documentation/gpu/driver-uapi.rst                  |     5 +
 Documentation/gpu/drm-kms.rst                      |    22 +
 Documentation/gpu/i915.rst                         |     9 +
 Documentation/gpu/panfrost.rst                     |     9 +
 Documentation/gpu/rfc/i915_vm_bind.h               |    11 +-
 MAINTAINERS                                        |   220 +-
 arch/m68k/include/asm/pgtable.h                    |     2 +
 arch/parisc/configs/generic-32bit_defconfig        |     2 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |     2 +
 drivers/accel/qaic/Makefile                        |     5 +-
 drivers/accel/qaic/qaic.h                          |     9 +
 drivers/accel/qaic/qaic_data.c                     |     9 +
 drivers/accel/qaic/qaic_debugfs.c                  |   338 +
 drivers/accel/qaic/qaic_debugfs.h                  |    20 +
 drivers/accel/qaic/qaic_drv.c                      |    26 +-
 drivers/accel/qaic/sahara.c                        |   449 +
 drivers/accel/qaic/sahara.h                        |    10 +
 drivers/base/devcoredump.c                         |    23 +
 drivers/dma-buf/dma-buf.c                          |    56 +-
 drivers/gpu/drm/Kconfig                            |    59 +-
 drivers/gpu/drm/Makefile                           |    30 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |     8 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   169 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |    33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |    71 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |     5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c      |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   360 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h   |    47 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   159 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |    47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |     8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    24 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   506 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    77 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |    25 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   105 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_smuio.h          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    88 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   133 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |     7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    73 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c         |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |     4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c   |   112 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |    10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    13 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |     6 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |     1 +
 drivers/gpu/drm/amd/amdgpu/cik.c                   |     6 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |     2 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |     6 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |     2 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   151 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    19 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |    12 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |    66 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    17 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    15 +
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    10 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |     2 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    28 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |    28 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |     2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |     4 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |     2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |     2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |     2 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   146 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |    57 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     3 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |     2 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |     8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    46 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |     9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    16 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |     6 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |     6 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |     2 +
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |     2 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.c         |    62 +
 drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.h         |    30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    16 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |     2 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |     6 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   416 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |    77 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |     6 -
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     4 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     3 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |     3 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |     2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |     3 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |    17 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     5 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     4 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |    32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |     9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    53 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |     2 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    18 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |     4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |     6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    25 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |     6 +-
 drivers/gpu/drm/amd/display/Makefile               |     1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    58 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |    42 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    66 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |     3 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |     8 +
 drivers/gpu/drm/amd/display/dc/Makefile            |     2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |     3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |     2 -
 .../gpu/drm/amd/display/dc/bios/command_table.c    |     2 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    17 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |     4 +-
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |     1 -
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |     1 -
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |     2 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |    11 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     5 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |    10 +-
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |     6 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |     3 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |     3 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |     1 -
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.h |    42 +-
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |     2 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |     3 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    12 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |     9 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h       |     3 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |    41 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |    21 -
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.h   |     2 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  1028 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   214 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |     2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |    62 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    22 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |    65 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   225 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   179 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     3 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    18 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     8 +
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |     2 +-
 drivers/gpu/drm/amd/display/dc/dc_plane_priv.h     |     1 +
 drivers/gpu/drm/amd/display/dc/dc_state.h          |     8 +-
 drivers/gpu/drm/amd/display/dc/dc_state_priv.h     |    12 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    10 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    20 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |     6 -
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.h |     1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_opp.h       |     1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c |     2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |     4 -
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |     4 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |     7 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |    10 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |    10 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |     1 +
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |     2 +-
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |     1 -
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |     6 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |     9 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.h   |     2 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c   |    11 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |     2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h    |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |     6 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |     2 +-
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.h  |     5 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |    10 +-
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |     2 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.c  |     4 +-
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c    |     5 +
 .../amd/display/dc/dcn201/dcn201_link_encoder.h    |    14 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |     8 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.h    |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |     2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dccg.h  |    21 +-
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.c  |     2 -
 .../amd/display/dc/dcn30/dcn30_dio_link_encoder.h  |     3 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |     3 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c   |     2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |    14 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c    |     2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.h    |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |     3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.h   |    23 +-
 .../gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h    |     6 -
 .../gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c  |     1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |     6 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |     2 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |     4 +
 .../display/dc/dcn31/dcn31_hpo_dp_link_encoder.c   |     8 +-
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |     4 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |     8 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |     9 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.c   |     7 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_vpg.h   |     1 +
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |     2 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |     6 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.h  |    10 +-
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |     5 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |    10 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |     8 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |    25 +-
 .../display/dc/dcn321/dcn321_dio_link_encoder.c    |     8 +-
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |     2 +-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |   207 +-
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |     3 +-
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.h  |    12 +-
 .../display/dc/dcn35/dcn35_dio_stream_encoder.h    |     1 -
 .../gpu/drm/amd/display/dc/dcn35/dcn35_hubbub.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |     3 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h       |    10 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    11 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |     2 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |     1 -
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |    10 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |     1 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |     1 -
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |     2 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |     1 -
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   269 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    18 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |     8 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |     3 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |     1 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |    19 +-
 .../drm/amd/display/dc/dml2/display_mode_core.h    |     1 +
 .../amd/display/dc/dml2/display_mode_lib_defines.h |     2 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |   161 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.h    |     2 +
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |    11 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |    64 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |    78 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.h   |     5 +
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |    16 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |    34 +-
 drivers/gpu/drm/amd/display/dc/dpp/Makefile        |    77 +
 .../drm/amd/display/dc/dpp/dcn10/CMakeLists.txt    |     6 +
 .../drm/amd/display/dc/{ =3D> dpp}/dcn10/dcn10_dpp.c |     2 +-
 .../drm/amd/display/dc/{ =3D> dpp}/dcn10/dcn10_dpp.h |     3 +-
 .../amd/display/dc/{ =3D> dpp}/dcn10/dcn10_dpp_cm.c  |     6 +-
 .../display/dc/{ =3D> dpp}/dcn10/dcn10_dpp_dscl.c    |     2 +-
 .../drm/amd/display/dc/dpp/dcn20/CMakeLists.txt    |     5 +
 .../drm/amd/display/dc/{ =3D> dpp}/dcn20/dcn20_dpp.c |     2 +-
 .../drm/amd/display/dc/{ =3D> dpp}/dcn20/dcn20_dpp.h |     2 +-
 .../amd/display/dc/{ =3D> dpp}/dcn20/dcn20_dpp_cm.c  |    14 +-
 .../drm/amd/display/dc/dpp/dcn201/CMakeLists.txt   |     4 +
 .../amd/display/dc/{ =3D> dpp}/dcn201/dcn201_dpp.c   |     2 +-
 .../amd/display/dc/{ =3D> dpp}/dcn201/dcn201_dpp.h   |     0
 .../drm/amd/display/dc/dpp/dcn30/CMakeLists.txt    |     5 +
 .../drm/amd/display/dc/{ =3D> dpp}/dcn30/dcn30_dpp.c |    18 +-
 .../drm/amd/display/dc/{ =3D> dpp}/dcn30/dcn30_dpp.h |     4 +
 .../amd/display/dc/{ =3D> dpp}/dcn30/dcn30_dpp_cm.c  |     6 +-
 .../drm/amd/display/dc/dpp/dcn32/CMakeLists.txt    |     4 +
 .../drm/amd/display/dc/{ =3D> dpp}/dcn32/dcn32_dpp.c |     2 +-
 .../drm/amd/display/dc/{ =3D> dpp}/dcn32/dcn32_dpp.h |     0
 .../drm/amd/display/dc/dpp/dcn35/CMakeLists.txt    |     4 +
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |   112 +
 .../drm/amd/display/dc/{ =3D> dpp}/dcn35/dcn35_dpp.h |     9 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    15 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |     7 +-
 .../amd/display/dc/gpio/dcn21/hw_translate_dcn21.c |    13 -
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |     6 +-
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |     2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    54 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    48 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   126 +-
 .../gpu/drm/amd/display/dc/hwss/dcn20/dcn20_init.c |     1 +
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |     2 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |     2 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |    74 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |     5 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |     4 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |     2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    89 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   109 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |     8 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |     4 +-
 .../gpu/drm/amd/display/dc/hwss/dcn351/Makefile    |    25 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_hwseq.c  |   182 +
 .../dcn35_dpp.c =3D> hwss/dcn351/dcn351_hwseq.h}     |    38 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |     4 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    13 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |     4 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    30 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |     2 -
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |     5 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |    30 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |     3 +-
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |     3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |    12 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |     2 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |     4 -
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |     7 +
 drivers/gpu/drm/amd/display/dc/inc/hw/vpg.h        |    53 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |     2 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    24 +-
 .../amd/display/dc/irq/dce110/irq_service_dce110.c |     8 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  |     2 +-
 .../display/dc/link/accessories/link_dp_trace.c    |     1 -
 .../gpu/drm/amd/display/dc/link/link_detection.c   |     4 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    16 +-
 .../display/dc/link/protocols/link_dp_capability.c |    16 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |     4 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |    10 +-
 .../display/dc/link/protocols/link_dp_training.c   |    18 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |     4 +-
 .../drm/amd/display/dc/link/protocols/link_dpcd.c  |     2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |    75 +-
 .../dc/link/protocols/link_edp_panel_control.h     |     4 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |     2 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |    18 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |     9 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |    10 -
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |   165 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h |     6 +-
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |     6 -
 .../display/dc/resource/dce112/dce112_resource.c   |     2 -
 .../display/dc/resource/dce120/dce120_resource.c   |     2 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |     1 -
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |     4 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    18 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |     6 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    33 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |     5 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |     2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    12 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |    26 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |     2 +
 .../display/dc/resource/dcn316/dcn316_resource.c   |     5 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   125 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    12 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    43 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    24 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.h |     2 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |    26 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    18 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   221 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c  |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |     2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |     2 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 -
 .../gpu/drm/amd/display/include/grph_object_id.h   |     4 +-
 .../drm/amd/display/include/link_service_types.h   |     1 -
 drivers/gpu/drm/amd/display/include/logger_types.h |     1 +
 drivers/gpu/drm/amd/display/include/signal_types.h |    13 +
 .../drm/amd/display/modules/color/color_gamma.c    |     2 +-
 .../drm/amd/display/modules/freesync/freesync.c    |     8 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |     2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |     8 +
 .../amd/display/modules/info_packet/info_packet.c  |     2 -
 drivers/gpu/drm/amd/include/amd_shared.h           |     3 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |    28 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |    14 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_offset.h    |    20 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   |     8 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_offset.h    |    28 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h   |    18 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_offset.h    |     4 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |    19 +
 .../amd/include/asic_reg/dcn/dcn_3_1_5_offset.h    |     4 +
 .../amd/include/asic_reg/dcn/dcn_3_1_5_sh_mask.h   |    10 +
 .../amd/include/asic_reg/dcn/dcn_3_2_0_offset.h    |    60 +
 .../amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h   |    27 +
 .../amd/include/asic_reg/dcn/dcn_3_2_1_offset.h    |    37 +-
 .../amd/include/asic_reg/dcn/dcn_3_2_1_sh_mask.h   |    16 +
 .../amd/include/asic_reg/dpcs/dpcs_3_0_0_offset.h  |    24 +
 .../amd/include/asic_reg/dpcs/dpcs_3_0_0_sh_mask.h |     4 +-
 .../amd/include/asic_reg/dpcs/dpcs_3_0_3_sh_mask.h |     4 +-
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h  |    10 +
 .../drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h |    12 +
 .../drm/amd/include/asic_reg/gc/gc_9_0_sh_mask.h   |     4 +
 .../amd/include/asic_reg/oss/osssys_6_0_0_offset.h |     4 +
 .../include/asic_reg/oss/osssys_6_0_0_sh_mask.h    |    10 +
 .../include/asic_reg/smuio/smuio_14_0_2_offset.h   |   511 +
 .../include/asic_reg/smuio/smuio_14_0_2_sh_mask.h  |  1106 ++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     3 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    38 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |     8 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   226 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     6 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |    41 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |     2 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |     2 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |     8 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c |     6 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h |     2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |     2 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c |     8 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h |     2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |     2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |     2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |     8 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h   |     2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |     2 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    12 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    13 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h   |  1836 +++
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |     6 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_2_ppsmc.h   |   140 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |     7 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |     7 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v14_0_2_pptable.h |   164 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |    22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    21 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |     2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |     8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |     8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |    96 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |     2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |     8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/Makefile        |     2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   135 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |     6 +
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  1796 +++
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.h   |    28 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    67 +-
 .../gpu/drm/arm/display/komeda/d71/d71_component.c |     2 +
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c   |     1 +
 drivers/gpu/drm/arm/malidp_mw.c                    |     5 +-
 drivers/gpu/drm/armada/armada_debugfs.c            |     1 +
 drivers/gpu/drm/ast/Makefile                       |    10 +-
 drivers/gpu/drm/ast/{ast_i2c.c =3D> ast_ddc.c}       |   130 +-
 drivers/gpu/drm/ast/ast_ddc.h                      |    11 +
 drivers/gpu/drm/ast/ast_drv.c                      |     1 +
 drivers/gpu/drm/ast/ast_drv.h                      |    39 +-
 drivers/gpu/drm/ast/ast_main.c                     |     1 +
 drivers/gpu/drm/ast/ast_mode.c                     |   165 +-
 drivers/gpu/drm/bridge/Kconfig                     |    14 +-
 drivers/gpu/drm/bridge/Makefile                    |     1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |     1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    20 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |     2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    15 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |     3 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |     7 +-
 drivers/gpu/drm/bridge/imx/Kconfig                 |     4 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |     6 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |     6 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |     1 +
 drivers/gpu/drm/bridge/ite-it66121.c               |    25 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |     6 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |     6 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |     6 +-
 drivers/gpu/drm/bridge/microchip-lvds.c            |   229 +
 drivers/gpu/drm/bridge/panel.c                     |     2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    31 +-
 drivers/gpu/drm/bridge/tc358764.c                  |     1 -
 drivers/gpu/drm/bridge/tc358775.c                  |   104 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |    21 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    17 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |     1 -
 drivers/gpu/drm/ci/test.yml                        |     6 +-
 drivers/gpu/drm/display/Kconfig                    |    52 +-
 drivers/gpu/drm/display/Makefile                   |     6 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |    41 +-
 drivers/gpu/drm/display/drm_dp_helper_internal.h   |     2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |    42 +-
 .../gpu/drm/display/drm_dp_mst_topology_internal.h |     4 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c            |    17 +-
 drivers/gpu/drm/drm_atomic_helper.c                |     4 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |     6 +-
 drivers/gpu/drm/drm_bridge.c                       |    24 +-
 drivers/gpu/drm/drm_buddy.c                        |   427 +-
 drivers/gpu/drm/drm_client.c                       |   105 +-
 drivers/gpu/drm/drm_client_modeset.c               |   129 +-
 drivers/gpu/drm/drm_crtc.c                         |    38 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |   100 +-
 drivers/gpu/drm/drm_crtc_helper_internal.h         |    15 +-
 drivers/gpu/drm/drm_crtc_internal.h                |    13 +
 drivers/gpu/drm/drm_displayid.c                    |     7 +-
 .../gpu/drm/drm_displayid_internal.h               |     6 +-
 drivers/gpu/drm/drm_drv.c                          |     5 +
 drivers/gpu/drm/drm_edid.c                         |   268 +-
 drivers/gpu/drm/drm_eld.c                          |     4 +-
 drivers/gpu/drm/drm_fb_dma_helper.c                |    45 +
 drivers/gpu/drm/drm_fbdev_generic.c                |     5 +-
 drivers/gpu/drm/drm_gem.c                          |    34 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |     7 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   101 +-
 drivers/gpu/drm/drm_internal.h                     |    10 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    45 +-
 drivers/gpu/drm/drm_mode_config.c                  |     7 +
 drivers/gpu/drm/drm_modes.c                        |    40 +-
 drivers/gpu/drm/drm_panic.c                        |   585 +
 drivers/gpu/drm/drm_plane.c                        |    56 +
 drivers/gpu/drm/drm_print.c                        |     6 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    95 +-
 drivers/gpu/drm/drm_sysfs.c                        |    20 +-
 drivers/gpu/drm/drm_vblank.c                       |    58 +-
 drivers/gpu/drm/drm_vblank_work.c                  |     2 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |     1 -
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |     1 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |     1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |     1 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |     1 -
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |     1 -
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |     1 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |     1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |     1 -
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    16 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |     1 -
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |     2 -
 drivers/gpu/drm/gud/gud_connector.c                |    12 +-
 drivers/gpu/drm/i915/Kconfig.debug                 |     4 +-
 drivers/gpu/drm/i915/Makefile                      |     6 +-
 drivers/gpu/drm/i915/display/bxt_dpio_phy_regs.h   |   273 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |     3 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |     2 +-
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |    16 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |    50 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   247 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   160 +-
 drivers/gpu/drm/i915/display/intel_bw.h            |     9 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   204 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |    12 +-
 drivers/gpu/drm/i915/display/intel_color.c         |    53 +-
 drivers/gpu/drm/i915/display/intel_color_regs.h    |    42 +-
 .../gpu/drm/i915/display/intel_combo_phy_regs.h    |   117 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |     5 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   353 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    48 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   389 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |     3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |   252 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |    18 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   186 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   704 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    22 +
 .../drm/i915/display/intel_display_conversion.h    |    22 +
 drivers/gpu/drm/i915/display/intel_display_core.h  |    17 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   126 +-
 .../gpu/drm/i915/display/intel_display_device.c    |     8 +
 .../gpu/drm/i915/display/intel_display_device.h    |     6 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |    28 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |    57 +-
 .../gpu/drm/i915/display/intel_display_params.c    |     9 +
 .../gpu/drm/i915/display/intel_display_params.h    |     2 +
 drivers/gpu/drm/i915/display/intel_display_power.c |     8 +-
 .../drm/i915/display/intel_display_power_well.c    |   107 +-
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |    22 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |    99 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |     8 -
 drivers/gpu/drm/i915/display/intel_dmc.c           |   185 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |     6 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |   264 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.h        |    31 +
 drivers/gpu/drm/i915/display/intel_dp.c            |   311 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |     5 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    15 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h        |     1 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |    17 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |     2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   246 +-
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |     2 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   368 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |    48 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   596 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |    12 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   611 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    82 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |     5 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |     5 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |     5 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |     6 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    33 +-
 drivers/gpu/drm/i915/display/intel_fbc_regs.h      |   120 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   270 +-
 drivers/gpu/drm/i915/display/intel_fbdev.h         |    29 +-
 .../i915/{i915_fixed.h =3D> display/intel_fixed.h}   |     0
 drivers/gpu/drm/i915/display/intel_gmbus.c         |     2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |     6 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |     6 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |     7 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    96 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |     2 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |     2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |     5 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    58 +-
 drivers/gpu/drm/i915/display/intel_opregion.h      |     6 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |     7 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |    10 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |     4 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |    14 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.h      |     5 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    40 +-
 drivers/gpu/drm/i915/display/intel_pps.h           |     2 +
 drivers/gpu/drm/i915/display/intel_psr.c           |   454 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |     5 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |    50 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    56 +-
 drivers/gpu/drm/i915/display/intel_quirks.h        |     6 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |     9 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    22 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |     4 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |     1 +
 drivers/gpu/drm/i915/display/intel_sprite_regs.h   |   348 +
 drivers/gpu/drm/i915/display/intel_tc.c            |    33 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |     8 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    36 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |    33 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |     7 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |   322 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |    14 +-
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |    18 +-
 drivers/gpu/drm/i915/display/vlv_dpio_phy_regs.h   |   309 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   470 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    22 +-
 drivers/gpu/drm/i915/display/vlv_dsi_regs.h        |   327 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    16 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |     1 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    22 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |     2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |     6 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |     8 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    18 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |     6 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    18 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |     8 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |     5 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |    27 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |    40 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |     1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    49 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |     8 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    12 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |     9 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c                |    15 -
 drivers/gpu/drm/i915/gt/intel_gt.c                 |     6 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |     5 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |     6 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |    52 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |     2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |     2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |     6 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    60 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |    27 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |     2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    51 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |    22 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    52 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |     4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    51 +-
 drivers/gpu/drm/i915/gt/intel_reset.h              |     3 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |    12 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    13 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c                |     2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   194 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |     2 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |     2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |     6 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |    21 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |     1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |     7 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |     4 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |     3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    22 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |     2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |    95 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |    12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |     8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |     8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |     2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |    17 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |     1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    57 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |     4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     4 -
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |     4 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |     2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |     1 +
 drivers/gpu/drm/i915/gvt/display.c                 |     2 +
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |     5 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |     8 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |     1 +
 drivers/gpu/drm/i915/i915_debugfs.c                |    13 +-
 drivers/gpu/drm/i915/i915_debugfs_params.c         |     1 +
 drivers/gpu/drm/i915/i915_driver.c                 |    24 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    26 +-
 drivers/gpu/drm/i915/i915_getparam.c               |    10 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |     6 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |    52 +-
 drivers/gpu/drm/i915/i915_irq.c                    |     8 +-
 drivers/gpu/drm/i915/i915_params.c                 |     3 -
 drivers/gpu/drm/i915/i915_params.h                 |     1 -
 drivers/gpu/drm/i915/i915_pci.c                    |    66 +-
 drivers/gpu/drm/i915/i915_perf.c                   |    19 +-
 drivers/gpu/drm/i915/i915_query.c                  |     2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  1405 +--
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |     6 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    14 -
 drivers/gpu/drm/i915/i915_vma.c                    |     2 -
 drivers/gpu/drm/i915/intel_clock_gating.c          |    60 +-
 drivers/gpu/drm/i915/intel_device_info.c           |     2 -
 drivers/gpu/drm/i915/intel_device_info.h           |     2 -
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    21 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    14 +-
 drivers/gpu/drm/i915/intel_step.c                  |    80 +-
 drivers/gpu/drm/i915/intel_uncore.c                |   380 +-
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |    36 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |     3 -
 drivers/gpu/drm/i915/soc/intel_dram.c              |     2 +
 drivers/gpu/drm/i915/vlv_sideband.c                |     1 -
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |     1 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c          |     4 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |    12 +-
 drivers/gpu/drm/lima/lima_bcast.c                  |    12 +
 drivers/gpu/drm/lima/lima_bcast.h                  |     3 +
 drivers/gpu/drm/lima/lima_drv.c                    |    21 +-
 drivers/gpu/drm/lima/lima_drv.h                    |     5 +
 drivers/gpu/drm/lima/lima_gp.c                     |    10 +
 drivers/gpu/drm/lima/lima_mmu.c                    |     5 +
 drivers/gpu/drm/lima/lima_pp.c                     |    22 +
 drivers/gpu/drm/lima/lima_sched.c                  |     9 +
 drivers/gpu/drm/lima/lima_sched.h                  |     1 +
 drivers/gpu/drm/loongson/lsdc_crtc.c               |     1 +
 drivers/gpu/drm/loongson/lsdc_gem.c                |    13 +-
 drivers/gpu/drm/mediatek/Kconfig                   |     2 +-
 drivers/gpu/drm/mediatek/Makefile                  |    12 +-
 .../drm/mediatek/{mtk_drm_crtc.c =3D> mtk_crtc.c}    |   218 +-
 drivers/gpu/drm/mediatek/mtk_crtc.h                |    28 +
 .../{mtk_drm_ddp_comp.c =3D> mtk_ddp_comp.c}         |    51 +-
 .../{mtk_drm_ddp_comp.h =3D> mtk_ddp_comp.h}         |     9 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |     5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |     5 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |     5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |     2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |     5 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |     3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |     5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |     5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |     5 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |     2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |     4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |    30 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    34 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |     4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    33 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |     5 +-
 .../gpu/drm/mediatek/{mtk_drm_gem.c =3D> mtk_gem.c}  |    68 +-
 .../gpu/drm/mediatek/{mtk_drm_gem.h =3D> mtk_gem.h}  |    23 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |    14 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |     3 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |     1 -
 drivers/gpu/drm/mediatek/mtk_padding.c             |     5 +-
 .../drm/mediatek/{mtk_drm_plane.c =3D> mtk_plane.c}  |    26 +-
 .../drm/mediatek/{mtk_drm_plane.h =3D> mtk_plane.h}  |     4 +-
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |     7 +
 drivers/gpu/drm/meson/meson_vclk.c                 |     6 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |     7 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |    18 +
 drivers/gpu/drm/msm/.gitignore                     |     1 +
 drivers/gpu/drm/msm/Kconfig                        |    10 +-
 drivers/gpu/drm/msm/Makefile                       |   106 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
 .../drm/msm/{msm_gpummu.c =3D> adreno/a2xx_gpummu.c} |    45 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 ---------------=
----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |     2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |    15 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |     4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    83 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |    14 +-
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  1446 +++
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |     2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |     3 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |     8 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |    12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   660 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |    25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |     6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |     4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |     9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |     4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |    30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |     2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   124 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |     6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |    14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |     4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |    22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |     2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |     2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    91 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    56 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |     8 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |     4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |     1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |     4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   129 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |     7 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |     1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |     4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   125 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |     4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |     2 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
 drivers/gpu/drm/msm/disp/mdp_format.c              |   630 +-
 drivers/gpu/drm/msm/disp/mdp_format.h              |    77 +
 drivers/gpu/drm/msm/disp/mdp_kms.h                 |    18 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |    25 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |    39 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |     1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c                |    71 +-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |    52 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |    23 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |     1 -
 drivers/gpu/drm/msm/dp/dp_debug.c                  |    59 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |    38 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   101 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |     3 -
 drivers/gpu/drm/msm/dp/dp_drm.c                    |     2 -
 drivers/gpu/drm/msm/dp/dp_link.c                   |    26 +-
 drivers/gpu/drm/msm/dp/dp_link.h                   |    15 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |    14 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |     3 -
 drivers/gpu/drm/msm/dsi/dsi.c                      |    26 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |     7 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    20 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    79 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |     8 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |     2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |    10 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c           |     6 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c           |     4 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
 drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    11 +-
 drivers/gpu/drm/msm/msm_fb.c                       |    12 +-
 drivers/gpu/drm/msm/msm_gem.c                      |    20 +-
 drivers/gpu/drm/msm/msm_gem.h                      |     4 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |    20 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    12 +-
 drivers/gpu/drm/msm/msm_kms.h                      |     4 -
 drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
 drivers/gpu/drm/msm/registers/.gitignore           |     4 +
 drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
 drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  5011 ++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   400 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2268 ++++
 drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
 .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
 .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
 .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
 .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
 .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
 drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
 drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
 .../gpu/drm/msm/registers/display/mdp_common.xml   |    90 +
 drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
 drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
 .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
 drivers/gpu/drm/msm/registers/gen_header.py        |   970 ++
 drivers/gpu/drm/msm/registers/rules-fd.xsd         |   404 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |     6 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |     2 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |    20 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |    12 -
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    43 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |     2 +
 drivers/gpu/drm/nouveau/nouveau_display.c          |     2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |     2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c            |     8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c    |     2 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |     2 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |     1 -
 drivers/gpu/drm/omapdrm/omap_fb.c                  |     1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    40 +-
 drivers/gpu/drm/panel/Kconfig                      |    36 +-
 drivers/gpu/drm/panel/Makefile                     |     3 +
 drivers/gpu/drm/panel/panel-edp.c                  |   164 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |   228 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |     1 +
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |  1112 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |     5 +-
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |   320 +
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |     6 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |    11 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |    33 +-
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      |   344 +
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |    44 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |   285 +
 drivers/gpu/drm/panel/panel-simple.c               |   123 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |    87 +
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |     6 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |    16 +-
 drivers/gpu/drm/panfrost/Makefile                  |     2 -
 drivers/gpu/drm/panfrost/panfrost_debugfs.c        |    21 -
 drivers/gpu/drm/panfrost/panfrost_debugfs.h        |    14 -
 drivers/gpu/drm/panfrost/panfrost_device.h         |     2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    50 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |     2 +-
 drivers/gpu/drm/panthor/Kconfig                    |    23 +
 drivers/gpu/drm/panthor/Makefile                   |    14 +
 drivers/gpu/drm/panthor/panthor_devfreq.c          |   283 +
 drivers/gpu/drm/panthor/panthor_devfreq.h          |    21 +
 drivers/gpu/drm/panthor/panthor_device.c           |   561 +
 drivers/gpu/drm/panthor/panthor_device.h           |   357 +
 drivers/gpu/drm/panthor/panthor_drv.c              |  1488 +++
 drivers/gpu/drm/panthor/panthor_fw.c               |  1363 +++
 drivers/gpu/drm/panthor/panthor_fw.h               |   503 +
 drivers/gpu/drm/panthor/panthor_gem.c              |   230 +
 drivers/gpu/drm/panthor/panthor_gem.h              |   142 +
 drivers/gpu/drm/panthor/panthor_gpu.c              |   482 +
 drivers/gpu/drm/panthor/panthor_gpu.h              |    52 +
 drivers/gpu/drm/panthor/panthor_heap.c             |   597 +
 drivers/gpu/drm/panthor/panthor_heap.h             |    39 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |  2774 +++++
 drivers/gpu/drm/panthor/panthor_mmu.h              |   102 +
 drivers/gpu/drm/panthor/panthor_regs.h             |   239 +
 drivers/gpu/drm/panthor/panthor_sched.c            |  3528 ++++++
 drivers/gpu/drm/panthor/panthor_sched.h            |    50 +
 drivers/gpu/drm/qxl/qxl_object.c                   |    26 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |     2 +
 drivers/gpu/drm/qxl/qxl_prime.c                    |     4 +-
 drivers/gpu/drm/radeon/r100.c                      |     1 +
 drivers/gpu/drm/radeon/r300.c                      |     1 +
 drivers/gpu/drm/radeon/r420.c                      |     1 +
 drivers/gpu/drm/radeon/r600.c                      |     3 +-
 drivers/gpu/drm/radeon/radeon.h                    |     1 -
 drivers/gpu/drm/radeon/radeon_display.c            |     8 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |     1 +
 drivers/gpu/drm/radeon/radeon_gem.c                |     1 +
 drivers/gpu/drm/radeon/radeon_ib.c                 |     2 +
 drivers/gpu/drm/radeon/radeon_pm.c                 |     1 +
 drivers/gpu/drm/radeon/radeon_prime.c              |    11 -
 drivers/gpu/drm/radeon/radeon_ring.c               |     2 +
 drivers/gpu/drm/radeon/radeon_ttm.c                |     1 +
 drivers/gpu/drm/radeon/rs400.c                     |     1 +
 drivers/gpu/drm/radeon/rv515.c                     |     1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |     3 -
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    34 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h             |     2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    12 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    12 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    22 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |     1 -
 drivers/gpu/drm/sti/sti_drv.c                      |     1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |    18 +-
 drivers/gpu/drm/tegra/Kconfig                      |     2 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |   171 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |     3 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |     6 -
 drivers/gpu/drm/tiny/simpledrm.c                   |    16 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |   235 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |     1 +
 drivers/gpu/drm/ttm/ttm_resource.c                 |    20 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |     5 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    33 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |    30 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |     9 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |    48 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |    94 +-
 drivers/gpu/drm/v3d/v3d_sysfs.c                    |    13 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |     1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    48 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |     7 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |     2 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c                |     4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |     4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |    27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    52 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |    36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    39 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    32 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |    31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |    42 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c           |   110 -
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    19 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |     7 -
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |   632 +
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h               |    75 +
 drivers/gpu/drm/xe/Kconfig                         |     2 +
 drivers/gpu/drm/xe/Makefile                        |    17 +-
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |   200 +-
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |    10 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    57 +-
 .../gpu/drm/xe/compat-i915-headers/i915_fixed.h    |     6 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h  |     9 -
 .../drm/xe/compat-i915-headers/i915_gem_stolen.h   |     9 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h |    26 -
 .../gpu/drm/xe/compat-i915-headers/intel_uc_fw.h   |    11 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |     6 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |     8 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |    16 +-
 drivers/gpu/drm/xe/display/xe_display.c            |    19 +-
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |     4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |    39 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   240 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |     7 +-
 .../drm/xe/instructions/xe_gfx_state_commands.h    |    18 +
 .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h  |     3 +
 drivers/gpu/drm/xe/instructions/xe_instr_defs.h    |     1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |     3 -
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h              |     7 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |    65 +-
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h              |    37 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |    15 +-
 drivers/gpu/drm/xe/regs/xe_reg_defs.h              |    19 +
 drivers/gpu/drm/xe/regs/xe_regs.h                  |     2 +-
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h            |     3 +
 drivers/gpu/drm/xe/tests/Makefile                  |     3 +-
 drivers/gpu/drm/xe/tests/xe_bo.c                   |    12 +-
 drivers/gpu/drm/xe/tests/xe_bo_test.c              |     5 -
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |    57 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c         |     5 -
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c      |   136 +
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c        |    10 +
 drivers/gpu/drm/xe/tests/xe_migrate.c              |    27 +-
 drivers/gpu/drm/xe/tests/xe_migrate_test.c         |     5 -
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |    96 +-
 drivers/gpu/drm/xe/tests/xe_mocs_test.c            |     5 -
 drivers/gpu/drm/xe/tests/xe_wa_test.c              |     1 +
 drivers/gpu/drm/xe/xe_bb.c                         |     6 +-
 drivers/gpu/drm/xe/xe_bo.c                         |   137 +-
 drivers/gpu/drm/xe/xe_bo.h                         |    74 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                   |     4 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |    24 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |    47 +-
 drivers/gpu/drm/xe/xe_devcoredump.h                |     6 +
 drivers/gpu/drm/xe/xe_device.c                     |   226 +-
 drivers/gpu/drm/xe/xe_device.h                     |     9 -
 drivers/gpu/drm/xe/xe_device_sysfs.c               |    16 +-
 drivers/gpu/drm/xe/xe_device_sysfs.h               |     2 +-
 drivers/gpu/drm/xe/xe_device_types.h               |    26 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |     7 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |     8 +-
 drivers/gpu/drm/xe/xe_exec.c                       |    14 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |    74 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |     8 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |   136 +-
 drivers/gpu/drm/xe/xe_ggtt.h                       |     8 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |   100 +-
 drivers/gpu/drm/xe/xe_gsc.h                        |     2 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |    15 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.h                  |     1 +
 drivers/gpu/drm/xe/xe_gsc_submit.c                 |    15 +
 drivers/gpu/drm/xe/xe_gsc_submit.h                 |     1 +
 drivers/gpu/drm/xe/xe_gsc_types.h                  |     1 +
 drivers/gpu/drm/xe/xe_gt.c                         |    59 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |     5 -
 drivers/gpu/drm/xe/xe_gt_clock.h                   |     2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |   242 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.h                 |     2 +
 drivers/gpu/drm/xe/xe_gt_freq.c                    |    63 +-
 drivers/gpu/drm/xe/xe_gt_freq.h                    |     2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |    43 +-
 drivers/gpu/drm/xe/xe_gt_idle.h                    |     2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |    39 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |    14 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |    52 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |    20 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  1977 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |    56 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h   |    54 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |   257 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h        |    27 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h        |    35 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c         |   418 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h         |    25 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h   |    31 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |    34 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |    14 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.h                   |     2 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c          |    16 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h          |     2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |    43 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |     2 +-
 drivers/gpu/drm/xe/xe_gt_topology.c                |   115 +-
 drivers/gpu/drm/xe/xe_gt_topology.h                |    11 +
 drivers/gpu/drm/xe/xe_gt_types.h                   |    22 +-
 drivers/gpu/drm/xe/xe_guc.c                        |   122 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |   139 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h              |     2 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     |   136 +-
 drivers/gpu/drm/xe/xe_guc_ct.h                     |     2 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |     2 +
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |     9 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |     7 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c               |     7 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c                 |   279 +
 drivers/gpu/drm/xe/xe_guc_id_mgr.h                 |    22 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c            |   134 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h            |    51 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |     5 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   116 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   230 +-
 drivers/gpu/drm/xe/xe_guc_submit.h                 |     6 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h           |    13 +-
 drivers/gpu/drm/xe/xe_guc_types.h                  |    21 +-
 drivers/gpu/drm/xe/xe_hmm.c                        |   253 +
 drivers/gpu/drm/xe/xe_hmm.h                        |    11 +
 drivers/gpu/drm/xe/xe_huc.c                        |     4 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c                |     5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |    46 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |   155 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h      |     7 +
 drivers/gpu/drm/xe/xe_hw_fence.c                   |     2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   266 +-
 drivers/gpu/drm/xe/xe_irq.c                        |     3 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |     6 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   169 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |     5 +
 drivers/gpu/drm/xe/xe_lrc_types.h                  |     2 +
 drivers/gpu/drm/xe/xe_memirq.c                     |     9 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |     8 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |   144 +-
 drivers/gpu/drm/xe/xe_mmio.h                       |    82 +-
 drivers/gpu/drm/xe/xe_mocs.c                       |    66 +-
 drivers/gpu/drm/xe/xe_module.c                     |     7 +
 drivers/gpu/drm/xe/xe_module.h                     |     3 +
 drivers/gpu/drm/xe/xe_pat.c                        |    23 +-
 drivers/gpu/drm/xe/xe_pci.c                        |    44 +-
 drivers/gpu/drm/xe/xe_pcode.c                      |   117 +-
 drivers/gpu/drm/xe/xe_pcode.h                      |     6 +-
 drivers/gpu/drm/xe/xe_platform_types.h             |     1 +
 drivers/gpu/drm/xe/xe_pm.c                         |   327 +-
 drivers/gpu/drm/xe/xe_pm.h                         |    13 +-
 drivers/gpu/drm/xe/xe_pt.c                         |    13 +-
 drivers/gpu/drm/xe/xe_query.c                      |    53 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |    11 +-
 drivers/gpu/drm/xe/xe_sa.c                         |     5 +-
 drivers/gpu/drm/xe/xe_sched_job.c                  |    23 +-
 drivers/gpu/drm/xe/xe_sched_job.h                  |     3 +
 drivers/gpu/drm/xe/xe_sriov.c                      |    62 +-
 drivers/gpu/drm/xe/xe_sriov.h                      |     6 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |   104 +
 drivers/gpu/drm/xe/xe_sriov_pf.h                   |    30 +
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h           |    46 +
 drivers/gpu/drm/xe/xe_sriov_types.h                |    19 +
 drivers/gpu/drm/xe/xe_sync.c                       |     7 +-
 drivers/gpu/drm/xe/xe_sync.h                       |     1 -
 drivers/gpu/drm/xe/xe_tile.c                       |    17 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c                 |    17 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.h                 |     2 +-
 drivers/gpu/drm/xe/xe_trace.h                      |     6 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |    15 +-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |     5 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |    18 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h               |     1 +
 drivers/gpu/drm/xe/xe_tuning.c                     |    10 +-
 drivers/gpu/drm/xe/xe_uc.c                         |    11 -
 drivers/gpu/drm/xe/xe_uc_debugfs.c                 |     2 +
 drivers/gpu/drm/xe/xe_uc_fw.c                      |    53 +-
 drivers/gpu/drm/xe/xe_uc_fw.h                      |     8 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h                |     3 +-
 drivers/gpu/drm/xe/xe_vm.c                         |   216 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |    11 +-
 drivers/gpu/drm/xe/xe_vram_freq.c                  |    20 +-
 drivers/gpu/drm/xe/xe_vram_freq.h                  |     2 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   134 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |    11 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   231 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.h                 |    17 +-
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h            |     8 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    85 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |     7 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |     2 +-
 drivers/phy/qualcomm/phy-qcom-edp.c                |    76 +-
 drivers/video/fbdev/core/Kconfig                   |     6 +
 include/drm/amd_asic_type.h                        |     3 +
 include/drm/bridge/samsung-dsim.h                  |     4 +-
 include/drm/display/drm_dp.h                       |    11 +
 include/drm/display/drm_dp_helper.h                |    51 +-
 include/drm/display/drm_dp_mst_helper.h            |    31 +-
 include/drm/display/drm_dsc.h                      |     3 -
 include/drm/drm_buddy.h                            |    16 +-
 include/drm/drm_client.h                           |    10 +
 include/drm/drm_debugfs_crc.h                      |     8 +-
 include/drm/drm_edid.h                             |    45 +-
 include/drm/drm_encoder_slave.h                    |    91 +-
 include/drm/drm_fb_dma_helper.h                    |     5 +
 include/drm/drm_format_helper.h                    |     1 +
 include/drm/drm_gem.h                              |     3 +
 include/drm/drm_gem_shmem_helper.h                 |     7 +-
 include/drm/drm_gem_vram_helper.h                  |     1 -
 include/drm/drm_kunit_helpers.h                    |     2 +-
 include/drm/drm_lease.h                            |     2 +
 include/drm/drm_mipi_dsi.h                         |    15 +-
 include/drm/drm_mode_config.h                      |    15 +
 include/drm/drm_modeset_helper_vtables.h           |    39 +
 include/drm/drm_of.h                               |     1 +
 include/drm/drm_panic.h                            |   152 +
 include/drm/drm_plane.h                            |    10 +
 include/drm/drm_print.h                            |     4 +-
 include/drm/drm_probe_helper.h                     |     6 +
 include/drm/drm_suballoc.h                         |     2 +-
 include/drm/drm_vblank.h                           |     1 +
 include/drm/gma_drm.h                              |    13 -
 include/drm/i2c/ch7006.h                           |     1 +
 include/drm/i2c/sil164.h                           |     1 +
 include/drm/i915_component.h                       |     2 +-
 include/drm/i915_gsc_proxy_mei_interface.h         |     4 +-
 include/drm/i915_hdcp_interface.h                  |    18 +-
 include/drm/i915_pciids.h                          |     4 +-
 include/drm/i915_pxp_tee_interface.h               |    27 +-
 include/drm/ttm/ttm_bo.h                           |    17 +-
 include/drm/ttm/ttm_caching.h                      |     2 +
 include/drm/ttm/ttm_execbuf_util.h                 |     7 +-
 include/drm/ttm/ttm_kmap_iter.h                    |     4 +-
 include/drm/ttm/ttm_pool.h                         |     5 +-
 include/drm/ttm/ttm_resource.h                     |     6 +-
 include/drm/xe_pciids.h                            |     7 +-
 include/linux/devcoredump.h                        |     5 +
 include/linux/dma-buf.h                            |     2 +
 include/linux/fb.h                                 |     4 +
 include/linux/phy/phy-dp.h                         |     3 +
 include/uapi/drm/drm_mode.h                        |    11 +
 include/uapi/drm/i915_drm.h                        |    31 +-
 include/uapi/drm/nouveau_drm.h                     |    22 +
 include/uapi/drm/panthor_drm.h                     |   945 ++
 include/uapi/drm/xe_drm.h                          |    25 +-
 1376 files changed, 77529 insertions(+), 55648 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profili=
ng
 create mode 100644
Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
 create mode 100644
Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
 create mode 100644 Documentation/gpu/amdgpu/debugging.rst
 create mode 100644 drivers/accel/qaic/qaic_debugfs.c
 create mode 100644 drivers/accel/qaic/qaic_debugfs.h
 create mode 100644 drivers/accel/qaic/sahara.c
 create mode 100644 drivers/accel/qaic/sahara.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v14_0_2.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn10/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn10/dcn10_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn10/dcn10_dpp.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn10/dcn10_dpp_cm.c (99=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn10/dcn10_dpp_dscl.c (=
99%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn20/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn20/dcn20_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn20/dcn20_dpp.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn20/dcn20_dpp_cm.c (99=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn201/CMakeLists.tx=
t
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn201/dcn201_dpp.c (99%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn201/dcn201_dpp.h (100=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn30/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn30/dcn30_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn30/dcn30_dpp.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn30/dcn30_dpp_cm.c (99=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn32/CMakeLists.txt
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn32/dcn32_dpp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn32/dcn32_dpp.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn35/CMakeLists.txt
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dpp}/dcn35/dcn35_dpp.h (87%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_hwseq=
.c
 rename drivers/gpu/drm/amd/display/dc/{dcn35/dcn35_dpp.c =3D>
hwss/dcn351/dcn351_hwseq.h} (56%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/vpg.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_14_0_2_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_14_0_2_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v14_0_2_pp=
smc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0_2_pptable.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.h
 rename drivers/gpu/drm/ast/{ast_i2c.c =3D> ast_ddc.c} (52%)
 create mode 100644 drivers/gpu/drm/ast/ast_ddc.h
 create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c
 rename include/drm/drm_displayid.h =3D>
drivers/gpu/drm/drm_displayid_internal.h (98%)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 drivers/gpu/drm/i915/display/bxt_dpio_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_conversion.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbc_regs.h
 rename drivers/gpu/drm/i915/{i915_fixed.h =3D> display/intel_fixed.h} (100=
%)
 create mode 100644 drivers/gpu/drm/i915/display/intel_sprite_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_dpio_phy_regs.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.c =3D> mtk_crtc.c} (82%)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.c =3D> mtk_ddp_comp.c} (=
94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h =3D> mtk_ddp_comp.h} (=
98%)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.c =3D> mtk_gem.c} (76%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.h =3D> mtk_gem.h} (62%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.c =3D> mtk_plane.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.h =3D> mtk_plane.h} (95%)
 create mode 100644 drivers/gpu/drm/msm/.gitignore
 delete mode 100644 drivers/gpu/drm/msm/adreno/a2xx.xml.h
 rename drivers/gpu/drm/msm/{msm_gpummu.c =3D> adreno/a2xx_gpummu.c} (67%)
 delete mode 100644 drivers/gpu/drm/msm/adreno/a3xx.xml.h
 delete mode 100644 drivers/gpu/drm/msm/adreno/a4xx.xml.h
 delete mode 100644 drivers/gpu/drm/msm/adreno/a5xx.xml.h
 delete mode 100644 drivers/gpu/drm/msm/adreno/a6xx.xml.h
 delete mode 100644 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
 delete mode 100644 drivers/gpu/drm/msm/adreno/adreno_common.xml.h
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
 delete mode 100644 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp_common.xml.h
 create mode 100644 drivers/gpu/drm/msm/disp/mdp_format.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi.xml.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/sfpb.xml.h
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi.xml.h
 delete mode 100644 drivers/gpu/drm/msm/hdmi/qfprom.xml.h
 create mode 100644 drivers/gpu/drm/msm/registers/.gitignore
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a3xx.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a4xx.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/dsi.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_10nm.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_14nm.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_20nm.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_28nm.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_28nm_8960=
.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/edp.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/hdmi.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/mdp4.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/mdp5.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/mdp_common.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/msm.xml
 create mode 100644 drivers/gpu/drm/msm/registers/display/sfpb.xml
 create mode 100644 drivers/gpu/drm/msm/registers/freedreno_copyright.xml
 create mode 100644 drivers/gpu/drm/msm/registers/gen_header.py
 create mode 100644 drivers/gpu/drm/msm/registers/rules-fd.xsd
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43408.c
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm69380.c
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
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfx_state_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gtt_defs.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_live_test_mod.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_id_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
 create mode 100644 include/drm/drm_panic.h
 delete mode 100644 include/drm/gma_drm.h
 create mode 100644 include/uapi/drm/panthor_drm.h
