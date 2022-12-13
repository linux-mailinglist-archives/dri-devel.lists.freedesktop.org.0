Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E798F64B1F7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 10:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462F810E2EB;
	Tue, 13 Dec 2022 09:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D4A10E2C7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 02:56:39 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id h8so5981462qkk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 18:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qKv9I1lUAlZ1gxyANFJV5hHNZdJNV9Cr+HkJ5W/10pA=;
 b=EH+aFeiOpbhiJATNcNY9k4qc9PtVnLj3X2KObiqcO1alPe1naKNfgdAWcka1Ute4mQ
 M3mEIUmwGh/UNbXUY0RbDRJhFNF0iht9s8DHL705WIDwuAyazC28hcC9ymfBjcVrQrvj
 g47zgl4Fmm96Jf9tgAU3xVznYXOgV0p3unSkrcRKZg+u8FXC3lC6at4wxIlEQJVpnmf5
 wXHa707iPoyh9bkq1YFq9Ey5q8HvuUOHAI3cC4aoLHL/xAc6olWD1oM/qY6wSQaTluFN
 rLXGrqVDXjtC4vMaPC69JsE90yBwrTH07+dk+3OfN2YZZDjCrBm2YGRXKd5ZzrytZ4V9
 3b7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qKv9I1lUAlZ1gxyANFJV5hHNZdJNV9Cr+HkJ5W/10pA=;
 b=I7RJ+5PTk/YVs+g8yPZf/mYjNVBetR34ip27DyZvu9IUavuTEjdX7I9fvrmw4t3V+h
 nK6ROSLMPOnafjnX8tgcQ0opj3okmLHEN4l5JQo0LcbRS41eNU33LG5RmjwmzRWselhl
 9wulruXOU5oeRPMKoJY4LNB9KmT+QN5qV5YuLJY6ShglaRIhbMgrs4+7e3nxJU1DNm1A
 zS8SXoCwHSYnspfbcTRwzn3zXEhJ2YhLDl9oUI+HBDxvz/zyYNg55KigpgBLrNvWgCTT
 gfB/cdL4nxyiES/JciXk+WkA767QfRf2a/VKPbVA2/XCydogW4rEURClu8dHSeIxBSgV
 51Sg==
X-Gm-Message-State: ANoB5pnu9KeV1ksxC+n/56JR4SxhYX16qH0CaQ2/ix2W8maPsW5k9Tqz
 uohcQadnsR7Xm5u3HofDEg8NsLWngdf6R7mzhuU=
X-Google-Smtp-Source: AA0mqf6N9z0DhOqJAgtEK2IG6MoiXyVYAZHgtIoIct/ztvz9uSsdr6cmLoG8eXAochEDNMAFcuoyrqfI6Wk7F155gZU=
X-Received: by 2002:a37:8a41:0:b0:6ee:bbea:1ebb with SMTP id
 m62-20020a378a41000000b006eebbea1ebbmr67770976qkd.638.1670900197870; Mon, 12
 Dec 2022 18:56:37 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 13 Dec 2022 12:56:25 +1000
Message-ID: <CAPM=9txGCMqyriq_xiwgFCUBa-PpHvSuRQuptAHusHcjpH+zqA@mail.gmail.com>
Subject: [git pull] drm for 6.2-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Alex Deucher <alexdeucher@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 13 Dec 2022 09:12:39 +0000
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

This is the main drm pull for 6.2-rc1. Trying to get it out little bit
earlier than usual.

The biggest highlight is that the accel subsystem framework is merged.
Hopefully for 6.3 we will be able to line up a driver to use it.

In drivers land, i915 enables DG2 support by default now, and nouveau
has a big stability refactoring and initial ampere support, AMD
includes new hw IP support and should build on ARM again. There is
also an ofdrm driver to take over offb on platforms it's used.

Stuff outside my tree, the dma-buf patches hit a few places, the vc4
firmware changes also do, and i915 has some interactions with MEI for
discrete GPUs. I think all of those should have been acked/reviewed by
relevant parties.

There are a bunch of conflicts, one in amdgpu is a bit nasty, I've
cc'ed Christian/Alex to make sure they know to check whatever
resolution you find. The one I have is what we have in drm-tip tree.
I've put a merge against 6.1 below.
https://cgit.freedesktop.org/~airlied/linux/log/?h=3Ddrm-next-6.2-merged

There are also some reported conflicts against other trees from
Stephen, but none looked too serious.

Dave.

drm-next-2022-12-13:
drm for 6.2:

Initial accel subsystem support. There are no drivers yet, just the framewo=
rk.

New driver:
- ofdrm - replacement for offb

fbdev:
- add support for nomodeset

fourcc:
- add Vivante tiled modifier

core:
- atomic-helpers: CRTC primary plane test fixes, fb access hooks
- connector: TV API consistency, cmdline parser improvements
- send connector hotplug on cleanup
- sort makefile objects

tests:
- sort kunit tests
- improve DP-MST tests
- add kunit helpers to create a device

sched:
- module param for scheduling policy
- refcounting fix

buddy:
- add back random seed log

ttm:
- convert ttm_resource to size_t
- optimize pool allocations

edid:
- HFVSDB parsing support fixes
- logging/debug improvements
- DSC quirks

dma-buf:
- Add unlocked vmap and attachment mapping
- move drivers to common locking convention
- locking improvements

firmware:
- new API for rPI firmware and vc4

xilinx:
- zynqmp: displayport bridge support
- dpsub fix

bridge:
- adv7533: Remove dynamic lane switching
- it6505: Runtime PM support, sync improvements
- ps8640: Handle AUX defer messages
- tc358775: Drop soft-reset over I2C

panel:
- panel-edp: Add INX N116BGE-EA2 C2 and C4 support.
- Jadard JD9365DA-H3
- NewVision NV3051D

amdgpu:
- DCN support on ARM
- DCN 2.1 secure display
- Sienna Cichlid mode2 reset fixes
- new GC 11.x firmware versions
- drop AMD specific DSC workarounds in favour of drm code
- clang warning fixes
- scheduler rework
- SR-IOV fixes
- GPUVM locking fixes
- fix memory leak in CS IOCTL error path
- flexible array updates
- enable new GC/PSP/SMU/NBIO IP
- GFX preemption support for gfx9

amdkfd:
- cache size fixes
- userptr fixes
- enable cooperative launch on gfx 10.3
- enable GC 11.0.4 KFD support

radeon:
- replace kmap with kmap_local_page
- ACPI ref count fix
- HDA audio notifier support

i915:
- DG2 enabled by default
- MTL enablement work
- hotplug refactoring
- VBT improvements
- Display and watermark refactoring
- ADL-P workaround
- temp disable runtime_pm for discrete-
- fix for A380 as a secondary GPU
- Wa_18017747507 for DG2
- CS timestamp support fixes for gen5 and earlier
- never purge busy TTM objects
- use i915_sg_dma_sizes for all backends
- demote GuC kernel contexts to normal priority
- gvt: refactor for new MDEV interface
- enable DC power states on eDP ports
- fix gen 2/3 workarounds

nouveau:
- fix page fault handling
- Ampere acceleration support
- driver stability improvements
- nva3 backlight support

msm:
- MSM_INFO_GET_FLAGS support
- DPU: XR30 and P010 image formats
- Qualcomm SM6115 support
- DSI PHY support for QCM2290
- HDMI: refactored dev init path
- remove exclusive-fence hack
- fix speed-bin detection
- enable clamp to idle on 7c3
- improved hangcheck detection

vmwgfx:
- fb and cursor refactoring
- convert to generic hashtable
- cursor improvements

etnaviv:
- hw workarounds
- softpin MMU fixes

ast:
- atomic gamma LUT support
- convert to SHMEM

lcdif:
- support YUV planes
- Increase DMA burst size
- FIFO threshold tuning

meson:
- fix return type of cvbs mode_valid

mgag200:
- fix PLL setup on some revisions

sun4i:
- A100 and D1 support

udl:
- modesetting improvements
- hot unplug support

vc4:
- support PAL-M
- fix regression preventing 4K @ 60Hz
- fix NULL ptr deref

v3d:
- switch to drm managed resources

renesas:
- RZ/G2L DSI support
- DU Kconfig cleanup

mediatek:
- fixup dpi and hdmi
- MT8188 dpi support
- MT8195 AFBC support

tegra:
- NVDEC hardware on Tegra234 SoC

hdlcd:
- switch to drm managed resources

ingenic:
- fix registration error path

hisilicon:
- convert to drm_mode_init

maildp:
- use managed resources

mtk:
- use drm_mode_init

rockchip:
- use drm_mode_copy
The following changes since commit eb7081409f94a9a8608593d0fb63a1aa3d6f95d8=
:

  Linux 6.1-rc6 (2022-11-20 16:02:16 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-12-13

for you to fetch changes up to 66efff515a6500d4b4976fbab3bee8b92a1137fb:

  Merge tag 'amd-drm-next-6.2-2022-12-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-12-09
12:08:33 +1000)

----------------------------------------------------------------
drm for 6.2:

Initial accel subsystem support. There are no drivers yet, just the framewo=
rk.

New driver:
- ofdrm - replacement for offb

fbdev:
- add support for nomodeset

fourcc:
- add Vivante tiled modifier

core:
- atomic-helpers: CRTC primary plane test fixes, fb access hooks
- connector: TV API consistency, cmdline parser improvements
- send connector hotplug on cleanup
- sort makefile objects

tests:
- sort kunit tests
- improve DP-MST tests
- add kunit helpers to create a device

sched:
- module param for scheduling policy
- refcounting fix

buddy:
- add back random seed log

ttm:
- convert ttm_resource to size_t
- optimize pool allocations

edid:
- HFVSDB parsing support fixes
- logging/debug improvements
- DSC quirks

dma-buf:
- Add unlocked vmap and attachment mapping
- move drivers to common locking convention
- locking improvements

firmware:
- new API for rPI firmware and vc4

xilinx:
- zynqmp: displayport bridge support
- dpsub fix

bridge:
- adv7533: Remove dynamic lane switching
- it6505: Runtime PM support, sync improvements
- ps8640: Handle AUX defer messages
- tc358775: Drop soft-reset over I2C

panel:
- panel-edp: Add INX N116BGE-EA2 C2 and C4 support.
- Jadard JD9365DA-H3
- NewVision NV3051D

amdgpu:
- DCN support on ARM
- DCN 2.1 secure display
- Sienna Cichlid mode2 reset fixes
- new GC 11.x firmware versions
- drop AMD specific DSC workarounds in favour of drm code
- clang warning fixes
- scheduler rework
- SR-IOV fixes
- GPUVM locking fixes
- fix memory leak in CS IOCTL error path
- flexible array updates
- enable new GC/PSP/SMU/NBIO IP
- GFX preemption support for gfx9

amdkfd:
- cache size fixes
- userptr fixes
- enable cooperative launch on gfx 10.3
- enable GC 11.0.4 KFD support

radeon:
- replace kmap with kmap_local_page
- ACPI ref count fix
- HDA audio notifier support

i915:
- DG2 enabled by default
- MTL enablement work
- hotplug refactoring
- VBT improvements
- Display and watermark refactoring
- ADL-P workaround
- temp disable runtime_pm for discrete-
- fix for A380 as a secondary GPU
- Wa_18017747507 for DG2
- CS timestamp support fixes for gen5 and earlier
- never purge busy TTM objects
- use i915_sg_dma_sizes for all backends
- demote GuC kernel contexts to normal priority
- gvt: refactor for new MDEV interface
- enable DC power states on eDP ports
- fix gen 2/3 workarounds

nouveau:
- fix page fault handling
- Ampere acceleration support
- driver stability improvements
- nva3 backlight support

msm:
- MSM_INFO_GET_FLAGS support
- DPU: XR30 and P010 image formats
- Qualcomm SM6115 support
- DSI PHY support for QCM2290
- HDMI: refactored dev init path
- remove exclusive-fence hack
- fix speed-bin detection
- enable clamp to idle on 7c3
- improved hangcheck detection

vmwgfx:
- fb and cursor refactoring
- convert to generic hashtable
- cursor improvements

etnaviv:
- hw workarounds
- softpin MMU fixes

ast:
- atomic gamma LUT support
- convert to SHMEM

lcdif:
- support YUV planes
- Increase DMA burst size
- FIFO threshold tuning

meson:
- fix return type of cvbs mode_valid

mgag200:
- fix PLL setup on some revisions

sun4i:
- A100 and D1 support

udl:
- modesetting improvements
- hot unplug support

vc4:
- support PAL-M
- fix regression preventing 4K @ 60Hz
- fix NULL ptr deref

v3d:
- switch to drm managed resources

renesas:
- RZ/G2L DSI support
- DU Kconfig cleanup

mediatek:
- fixup dpi and hdmi
- MT8188 dpi support
- MT8195 AFBC support

tegra:
- NVDEC hardware on Tegra234 SoC

hdlcd:
- switch to drm managed resources

ingenic:
- fix registration error path

hisilicon:
- convert to drm_mode_init

maildp:
- use managed resources

mtk:
- use drm_mode_init

rockchip:
- use drm_mode_copy

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/bridge: adv7533: remove dynamic lane switching from adv7533 bridg=
e

Adam Skladowski (2):
      dt-bindings: display/msm: add support for SM6115
      drm/msm/disp/dpu1: add support for display on SM6115

Ahmad Fatoum (1):
      drm: bridge: adv7511: use dev_err_probe in probe function

Alan Liu (3):
      drm/amd/display: Implement secure display on DCN21
      drm/amd/display: Drop struct crc_region and reuse struct rect
      drm/amdgpu: Move the mutex_lock to protect the return status of
securedisplay command buffer

Alan Previn (6):
      drm/i915/pxp: Add firmware status when ARB session fails
      drm/i915/guc: Add error-capture init warnings when needed
      drm/i915/guc: Add compute reglist for guc err capture
      drm/i915/guc: Fix GuC error capture sizing estimation and reporting
      drm/i915/guc: Remove intel_context:number_committed_requests counter
      drm/i915/pxp: Separate PXP FW interface structures for both v42 and 4=
3

Alex Deucher (21):
      drm/amdgpu: convert vega20_ih.c to IP version checks
      drm/amdgpu: convert amdgpu_amdkfd_gpuvm.c to IP version checks
      drm/amdgpu: fix sdma doorbell init ordering on APUs
      drm/amdgpu/gfx9: set gfx.funcs in early init
      drm/amdgpu/gfx10: set gfx.funcs in early init
      drm/amdgpu/gfx11: set gfx.funcs in early init
      drm/amdgpu: use proper DC check in amdgpu_display_supported_domains()
      drm/amdgpu: rework SR-IOV virtual display handling
      drm/amdgpu: move non-DC vblank handling out of irq code
      drm/amdgpu: clarify DC checks
      drm/amdgpu: there is no vbios fb on devices with no display hw (v2)
      drm/amd/display: fix the build when DRM_AMD_DC_DCN is not set
      drm/amdgpu/psp12: move ih_reroute into ring_create
      drm/amdgpu: make psp_ring_init common
      drm/amdgpu/psp: don't free PSP buffers on suspend
      Revert "drm/amd/display: fix dpms_off issue when disabling bios mode"
      drm/amdgpu: add missing license to some files
      drm/amdgpu: Partially revert "drm/amdgpu: update
drm_display_info correctly when the edid is read"
      drm/amd/display: use the proper fb offset for DM
      drm/amdgpu: add GART, GPUVM, and GTT to glossary
      drm/amdgpu: expand on GPUVM documentation

Alistair Popple (1):
      nouveau: Fix migrate_to_ram() for faulting page

Alvin Lee (21):
      drm/amd/display: Don't return false if no stream
      drm/amd/display: Remove optimization for VRR updates
      drm/amd/display: Enable timing sync on DCN32
      drm/amd/display: Don't enable ODM + MPO
      drm/amd/display: Wait for VBLANK during pipe programming
      drm/amd/display: Use min transition for SubVP into MPO
      drm/amd/display: Disable phantom OTG after enable for plane disable
      drm/amd/display: Add margin for max vblank time for SubVP + DRR
      drm/amd/display: Use min transition for all SubVP plane add/remove
      drm/amd/display: Don't check output BPP for phantom
      drm/amd/display: Fix Subvp phantom pipe transition
      drm/amd/display: Add margin on DRR vblank start for subvp
      drm/amd/display: Limit HW cursor size of >=3D 4k
      drm/amd/display: Check if PSR enabled when entering MALL
      drm/amd/display: Add debug options for increasing phantom lines
      drm/amd/display: Retain phantom plane/stream if validation fails
      drm/amd/display: Revert check for phantom BPP
      drm/amd/display: Don't overwrite subvp pipe info in fast updates
      drm/amd/display: Retain phantom pipes when min transition into
subvp (#7358)
      drm/amd/display: Fix DTBCLK disable requests and SRC_SEL programming
      drm/amd/display: Ensure commit_streams returns the DC return code

Andi Shyti (1):
      drm/i915/trace: Remove unused frequency trace

Andrew Davis (1):
      drm: Move radeon and amdgpu Kconfig options into their directories

Andrey Grodzovsky (1):
      drm/sched: Add FIFO sched policy to run queue

Andrzej Hajda (9):
      drm/i915/display: remove drm_device aliases
      drm/i915/display: Use intel_uncore alias if defined
      drm/i915: make intel_uncore_rmw() write unconditionally
      drm/i915: use proper helper for register updates
      drm/i915: fix clear mask in GEN7_MISCCPCTL update
      drm/i915: use intel_uncore_rmw when appropriate
      drm/i915/gt: use intel_uncore_rmw when appropriate
      drm/i915: call i915_request_await_object from _i915_vma_move_to_activ=
e
      drm/i915/selftests: add igt_vma_move_to_active_unlocked

Ankit Nautiyal (6):
      drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI sink
      drm/edid: Split DSC parsing into separate function
      drm/edid: Refactor HFVSDB parsing for DSC1.2
      drm/edid: Avoid multiple log lines for HFVSDB parsing
      drm/i915/dp: Reset frl trained flag before restarting FRL training
      drm/i915/dp: Remove whitespace at the end of function.

Anshuman Gupta (3):
      drm/i915/dgfx: Keep PCI autosuspend control 'on' by default on all dG=
PU
      drm/i915: Encapsulate lmem rpm stuff in intel_runtime_pm
      drm/i915/dgfx: Grab wakeref at i915_ttm_unmap_virtual

Anthony Koo (3):
      drm/amd/display: Document part of the DMUB cmd
      drm/amd/display: [FW Promotion] Release 0.0.141.0
      drm/amd/display: [FW Promotion] Release 0.0.143.0

Antonio Gomes (1):
      drm/nouveau: Add support to control backlight using bl_power for nva3=
.

Anusha Srivatsa (5):
      drm/i915/display: Add DC5 counter and DMC debugfs entries for MTL
      drm/i915/display: Change terminology for cdclk actions
      drm/i915/display: Introduce HAS_CDCLK_SQUASH macro
      drm/i915/display: Move chunks of code out of bxt_set_cdclk()
      drm/i915/display: Move squash_ctl register programming to its own fun=
ction

Ao Zhong (3):
      drm/amd/display: move remaining FPU code to dml folder
      drm/amd/display: move remaining FPU code to dml folder
      drm/amd/display: add DCN support for ARM64

Aravind Iddamsetty (2):
      drm/i915/mtl: enable local stolen memory
      drm/i915/mtl: Handle wopcm per-GT and limit calculations.

Aric Cyr (9):
      drm/amd/display: 3.2.208
      drm/amd/display: Fix SDR visual confirm
      drm/amd/display: 3.2.209
      drm/amd/display: 3.2.210
      drm/amd/display: 3.2.211
      drm/amd/display: 3.2.212
      drm/amd/display: 3.2.213
      drm/amd/display: 3.2.214
      drm/amd/display: 3.2.215

Arthur Grillo (1):
      drm/tests: Add back seed value information

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix for BO move issue

Asher Song (2):
      drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 prop=
erly"
      Revert "drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm
for vega10 properly""

Ashutosh Dixit (7):
      drm/i915/mtl: PERF_LIMIT_REASONS changes for MTL
      drm/i915/rps: Freq caps for MTL
      drm/i915: Perf_limit_reasons are only available for Gen11+
      drm/i915/hwmon: Expose card reactive critical power
      drm/i915/hwmon: Expose power1_max_interval
      drm/i915/rps: Prefer REG_FIELD_GET in intel_rps_get_cagf
      drm/i915/gt: Use RC6 residency types as arguments to residency functi=
ons

Aurabindo Pillai (6):
      drm/amd/display: Zeromem mypipe heap struct before using it
      drm/amd/display: fix array index out of bound error in bios parser
      drm/amd/display: rework macros for DWB register access
      drm/amd/display: trigger timing sync only if TG is running
      drm/amd/display: trigger timing sync only if TG is running
      drm/amd/display: fix array index out of bound error in DCN32 DML

Badal Nilawar (3):
      drm/i915/mtl: Add Wa_14017073508 for SAMedia
      drm/i915/mtl: Modify CAGF functions for MTL
      drm/i915/mtl: C6 residency and C state type for MTL SAMedia

Ben Skeggs (125):
      drm/nouveau/disp: move and extend the role of outp acquire/release me=
thods
      drm/nouveau/disp: move LVDS protocol information into acquire
      drm/nouveau/disp: move HDMI config into acquire + infoframe methods
      drm/nouveau/disp: move HDA ELD method
      drm/nouveau/disp: move DP link config into acquire
      drm/nouveau/disp: add method to control DPAUX pad power
      drm/nouveau/kms: switch hpd_lock from mutex to spinlock
      drm/nouveau/kms: pass event mask to hpd handler
      drm/nouveau/disp: add method to trigger DP link retrain
      drm/nouveau/disp: move DP MST payload config method
      drm/nouveau/disp: add head class
      drm/nouveau/disp: move head scanoutpos method
      drm/nouveau/nvkm: add a replacement for nvkm_notify
      drm/nouveau/fault: switch non-replayable faults to nvkm_event_ntfy
      drm/nouveau/fault: expose replayable fault buffer event class
      drm/nouveau/disp: switch vblank semaphore release to nvkm_event_ntfy
      drm/nouveau/disp: expose head event class
      drm/nouveau/disp: expose conn event class
      drm/nouveau/disp: expose page flip event class
      drm/nouveau/fifo: expose non-stall intr in host channel event class
      drm/nouveau/fifo: expose channel killed in host channel event class
      drm/nouveau/nvkm: rip out old notify
      drm/nouveau/kms: switch to drm fbdev helpers
      drm/nouveau/nvkm: give each nvkm_event its own lockdep class
      drm/nouveau/top: parse device topology right after devinit
      drm/nouveau/intr: add shared interrupt plumbing between pci/tegra
      drm/nouveau/intr: support multiple trees, and explicit interfaces
      drm/nouveau/intr: add nvkm_subdev_intr() compatibility
      drm/nouveau/vfn: add stub subdev for dev_func
      drm/nouveau/vfn: move NV_USERMODE class from host
      drm/nouveau/vfn/tu102-: support new-style interrupt tree
      drm/nouveau/fault/tu102: switch to explicit intr handlers
      drm/nouveau/fault/ga100: initial support
      drm/nouveau/mc: implement intr handling on top of nvkm_intr
      drm/nouveau/mc: move NV_PMC_ENABLE bashing to chipset-specific code
      drm/nouveau/mc/ga100: switch to using NV_PMC_DEVICE_ENABLE
      drm/nouveau/nvkm: add locking to subdev/engine init paths
      drm/nouveau/flcn: show falcon user in debug output
      drm/nouveau/imem: allow bar2 mapping of user allocations
      drm/nouveau/fifo: add chid_nr()
      drm/nouveau/fifo: unify handling of channel classes
      drm/nouveau/fifo: pre-move some blocks of code around
      drm/nouveau/fifo: merge gk104_fifo_func into nvkm_host_func
      drm/nouveau/fifo: add chid allocator
      drm/nouveau/fifo: add runq
      drm/nouveau/fifo: add common runlist/engine topology
      drm/nouveau/fifo: expose runlist topology info on all chipsets
      drm/nouveau/fifo: expose per-runlist CHID information
      drm/nouveau/fifo: add cgrp, have all channels be part of one
      drm/nouveau/fifo: use runlist engine info to lookup engine classes
      drm/nouveau/fifo: use explicit intr interfaces
      drm/nouveau/fifo: tidy up non-stall intr handling
      drm/nouveau/fifo: tidy global PBDMA init
      drm/nouveau/fifo: program NV_PFIFO_FB_TIMEOUT on init
      drm/nouveau/fifo: move PBDMA init to runq
      drm/nouveau/fifo: move PBDMA intr to runq
      drm/nouveau/fifo: merge mmu fault handlers together
      drm/nouveau/fifo: add new channel lookup interfaces
      drm/nouveau/fifo: add new engine context tracking
      drm/nouveau/fifo: add runlist wait()
      drm/nouveau/fifo: add runlist block()/allow()
      drm/nouveau/fifo: add chan bind()/unbind()
      drm/nouveau/fifo: add chan start()/stop()
      drm/nouveau/fifo: add chan/cgrp preempt()
      drm/nouveau/fifo: kill channel on a selection of PBDMA errors
      drm/nouveau/fifo: kill channel on NV_PPBDMA_INTR_1_CTXNOTVALID
      drm/nouveau/fifo: add common channel recovery
      drm/nouveau/fifo: add common runlist control
      drm/nouveau/fifo: add RAMIN info to nvkm_chan_func
      drm/nouveau/fifo: add USERD info to nvkm_chan_func
      drm/nouveau/fifo: add RAMFC info to nvkm_chan_func
      drm/nouveau/fifo: add new engine context handling
      drm/nouveau/fifo: add new engine object handling
      drm/nouveau/fifo: add new channel classes
      drm/nouveau/ce/ga100-: initial support
      drm/nouveau/fifo/ga100-: initial support
      drm/nouveau/gsp: add funcs
      drm/nouveau/pmu: move preinit() falcon reset to devinit
      drm/nouveau/pmu: move init() falcon reset to non-nvfw code
      drm/nouveau/pmu/gm20b,gp10b: boot RTOS from PMU init
      drm/nouveau/sec2: unload RTOS before tearing down WPR
      drm/nouveau/sec2: switch to newer style interrupt handler
      drm/nouveau/flcn: rework falcon reset
      drm/nouveau/flcn: new code to load+boot simple HS FWs (VPR scrubber)
      drm/nouveau/fb: handle sysmem flush page from common code
      drm/nouveau/fb/gp102-: unlock VPR right after devinit
      drm/nouveau/acr: use common falcon HS FW code for ACR FWs
      drm/nouveau/sec2: dump tracepc info on halt
      drm/nouveau/engine: add HAL for engine-specific rc reset procedure
      drm/nouveau/ltc: split color vs depth/stencil zbc counts
      drm/nouveau/fifo: expose function to read engine ctxsw status
      drm/nouveau/gr/gf100-: move some code around to make next commits nic=
er
      drm/nouveau/gr/gf100-: generate golden context during first object al=
loc
      drm/nouveau/gr/gf100-: make global pagepool actually global
      drm/nouveau/gr/gf100-: make global bundle_cb actually global
      drm/nouveau/gr/gf100-: move misc context patching out of attrib_cb fu=
ncs
      drm/nouveau/gr/gf100-: make global attrib_cb actually global
      drm/nouveau/gr/gf100-: stop using NV_PGRAPH_FECS_CTXSW_MAILBOX_CLEAR
      drm/nouveau/gr/gf100-: call FECS WFI_GOLDEN_SAVE method
      drm/nouveau/gr/gf100-: call FECS HALT_PIPE method before RC reset
      drm/nouveau/gr/gf100-: wait for FE_PWR_MODE_AUTO
      drm/nouveau/gr/gf100-: gpfifo_ctl zero before init
      drm/nouveau/gr/gf100-: wfi after register-bashing golden init
      drm/nouveau/gr/gf100-: move reset during golden ctx init to fecs_rese=
t()
      drm/nouveau/gr/gf100-: move some init to init_rop_exceptions()
      drm/nouveau/gr/gf100-: move some init to init_exception2()
      drm/nouveau/gr/gf100-: switch to newer style interrupt handler
      drm/nouveau/gr/gf117-: make ppc_nr[gpc] accurate
      drm/nouveau/gr/gp100-: fix number of zcull tile regs
      drm/nouveau/gr/gk20a,gm20b,gp10b: split out netlist parsing from
fw loading
      drm/nouveau/gr/gp100-: modify init_fecs_exceptions
      drm/nouveau/gr/gv100-: port smid mapping code from nvgpu
      drm/nouveau/gr/gv100-: fix number of tile map registers
      drm/nouveau/gr/gv100-: add NV_PGRAPH_PRI_PD_AB_DIST_CONFIG_1 to patch=
 list
      drm/nouveau/gr/gv100-: move init_419bd8() after sw_ctx load
      drm/nouveau/gr/gv100-: drop a write from init_shader_exceptions()
      drm/nouveau/gr/tu102-: use sw_veid_bundle_init from firmware
      drm/nouveau/gr/tu102-: fix support for sw_bundle64_init
      drm/nouveau/gr/tu102: add gv100_gr_init_4188a4
      drm/nouveau/gr/tu102: remove gv100_grctx_unkn88c
      drm/nouveau/fb/ga102: load and boot VPR scrubber FW
      drm/nouveau/acr/ga102: initial support
      drm/nouveau/ltc/ga102: initial support
      drm/nouveau/gr/ga102: initial support
      drm/nouveau/disp: fix incorrect/broken hdmi methods

Bhawanpreet Lakha (1):
      drm/amd/display: Fix HDCP 1.X 1A-04 failing

Biju Das (4):
      dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
      drm: rcar-du: Add RZ/G2L DSI driver
      drm: rcar-du: rzg2l_mipi_dsi: Enhance device lanes check
      drm: rcar-du: Fix Kconfig dependency between DRM and RZG2L_MIPI_DSI

Bob zhou (1):
      drm/amd/display: fix compilation issue with legacy gcc

Brian Starkey (1):
      drm/fourcc: Fix vsub/hsub for Q410 and Q401

Bryan O'Donoghue (1):
      dt-bindings: msm: dsi-controller-main: Drop redundant phy-names

Camille Cho (1):
      drm/amd/display: new ABM config 2

Candice Li (7):
      drm/amdgpu: Optimize RAS TA initialization and TA unload funcs
      drm/amdgpu: Optimize TA load/unload/invoke debugfs interfaces
      drm/amdgpu: Update ras eeprom support for smu v13_0_0 and v13_0_10
      drm/amdgpu: Add EEPROM I2C address support for ip discovery
      drm/amdgpu: Enable GFX RAS feature for gfx v11_0_3
      drm/amdgpu: Add psp_13_0_10_ta firmware to modinfo
      drm/amd/pm: Enable bad memory page/channel recording support for
smu v13_0_0

Chaitanya Dhere (1):
      drm/amd/display: Fix FCLK deviation and tool compile issues

Charlene Liu (4):
      drm/amd/display: Update DML formula
      drm/amd/display: Fix null pointer issues found in emulation
      drm/amd/display: fix dcn3.1x mode validation on high bandwidth config
      drm/amd/display: correct static_screen_event_mask

Chengming Gui (1):
      drm/amdgpu: fix pstate setting issue

Chris Morgan (3):
      dt-bindings: vendor-prefixes: add NewVision vendor prefix
      dt-bindings: display: panel: Add NewVision NV3051D bindings
      drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel

Chris Park (1):
      drm/amd/display: Remove DTB DTO on CLK update

Chris Wilson (7):
      drm/i915/gt: Cleanup partial engine discovery failures
      drm/i915/gem: Really move i915_gem_context.link under ref protection
      drm/i915/gt: Restrict forced preemption to the active context
      drm/i915/gt: Use i915_vm_put on ppgtt_create error paths
      drm/i915/gt: Move scratch page into system memory on all platforms
      drm/i915/gt: Bump the reset-failure timeout to 60s
      drm/i915/selftests: Reduce oversaturation of request smoketesting

Christian Gmeiner (1):
      drm/etnaviv: print offender task information on hangcheck recovery

Christian K=C3=B6nig (24):
      drm/scheduler: fix fence ref counting
      drm/sched: add missing NULL check in drm_sched_get_cleanup_job v2
      drm/scheduler: add drm_sched_job_add_resv_dependencies
      drm/amdgpu: use drm_sched_job_add_resv_dependencies for moves
      drm/amdgpu: drop the fence argument from amdgpu_vmid_grab
      drm/amdgpu: drop amdgpu_sync from amdgpu_vmid_grab v2
      drm/amdgpu: cleanup scheduler job initialization v2
      drm/amdgpu: move explicit sync check into the CS
      drm/amdgpu: use scheduler dependencies for VM updates
      drm/amdgpu: use scheduler dependencies for UVD msgs
      drm/amdgpu: use scheduler dependencies for CS
      drm/scheduler: remove drm_sched_dependency_optimized
      drm/scheduler: rework entity flush, kill and fini
      drm/scheduler: rename dependency callback into prepare_job
      drm/ttm: optimize pool allocations a bit v2
      drm/amdgpu: workaround for TLB seq race
      drm/amdgpu: revert "implement tdr advanced mode"
      drm/amdgpu: stop resubmitting jobs for GPU reset v2
      drm/amdgpu: stop resubmittting jobs in amdgpu_pci_resume
      drm/amdgpu: always register an MMU notifier for userptr
      drm/amdgpu: fix userptr HMM range handling v2
      drm/amdgpu: rename the files for HMM handling
      drm/amdgpu: cleanup amdgpu_hmm_range_get_pages
      drm/amdgpu: generally allow over-commit during BO allocation

Colin Ian King (4):
      drm/i915/gem: remove redundant assignments to variable ret
      drm/i915/perf: remove redundant variable 'taken'
      drm/vc4: Fix spelling mistake "mmaping" -> "mmapping"
      drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

Dale B Stimson (4):
      drm/i915/hwmon: Add HWMON infrastructure
      drm/i915/hwmon: Power PL1 limit and TDP setting
      drm/i915/hwmon: Show device level energy usage
      drm/i915/hwmon: Extend power/energy for XEHPSDV

Dan Carpenter (3):
      amdgpu/pm: prevent array underflow in vega20_odn_edit_dpm_table()
      drm/msm/hdmi: remove unnecessary NULL check
      drm/amdkfd: Remove unnecessary condition in kfd_topology_add_device()

Daniel Vetter (1):
      drm/fb-helper: Fix missing kerneldoc include

Daniele Ceraolo Spurio (21):
      drm/i915/pxp: load the pxp module when we have a gsc-loaded huc
      drm/i915/dg2: setup HuC loading via GSC
      drm/i915/huc: track delayed HuC load with a fence
      drm/i915/huc: stall media submission until HuC is loaded
      drm/i915/huc: better define HuC status getparam possible return value=
s.
      drm/i915/huc: define gsc-compatible HuC fw for DG2
      drm/i915/huc: bump timeout for delayed load and reduce print verbosit=
y
      drm/i915/mtl: add initial definitions for GSC CS
      drm/i915/mtl: pass the GSC CS info to the GuC
      drm/i915/mtl: add GSC CS interrupt support
      drm/i915/mtl: add GSC CS reset support
      drm/i915/mtl: don't expose GSC command streamer to the user
      drm/i915/guc: don't hardcode BCS0 in guc_hang selftest
      drm/i915/huc: only load HuC on GTs that have VCS engines
      drm/i915/uc: fetch uc firmwares for each GT
      drm/i915/uc: use different ggtt pin offsets for uc loads
      drm/i915/guc: define media GT GuC send regs
      drm/i915/guc: handle interrupts from media GuC
      drm/i915/guc: add the GSC CS to the GuC capture list
      drm/i915/huc: fix leak of debug object in huc load fence on driver un=
load
      drm/i915/huc: always init the delayed load fence

Danijel Slivka (1):
      drm/amdgpu: set vm_update_mode=3D0 as default for Sienna Cichlid
in SRIOV case

Danilo Krummrich (9):
      drm/arm/hdlcd: use drmm_* to allocate driver structures
      drm/arm/hdlcd: replace drm->dev_private with drm_to_hdlcd_priv()
      drm/arm/hdlcd: plane: use drm managed resources
      drm/arm/hdlcd: remove calls to drm_mode_config_cleanup()
      drm/arm/malidp: use drmm_* to allocate driver structures
      drm/arm/malidp: replace drm->dev_private with drm_to_malidp()
      drm/arm/malidp: crtc: use drmm_crtc_init_with_planes()
      drm/arm/malidp: plane: use drm managed resources
      drm/arm/malidp: remove calls to drm_mode_config_cleanup()

Dave Airlie (27):
      Merge tag 'drm-misc-next-2022-10-20' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-next-20221025' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'drm-misc-next-2022-10-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2022-10-28' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-11-03' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-gt-next-2022-11-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-6.2-2022-11-04' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge branch '00.06-gr-ampere' of
https://gitlab.freedesktop.org/skeggsb/nouveau into drm-next
      Merge tag 'drm-next-20221109' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'drm-misc-next-2022-11-10-1' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2022-11-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge branch 'etnaviv/next' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'amd-drm-next-6.2-2022-11-18' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2022-11-18' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-intel-next-2022-11-18' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Backmerge tag 'v6.1-rc6' into drm-next
      Merge tag 'drm-next-20221122' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'mediatek-drm-next-6.2' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-accel-2022-11-22' of
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel into
drm-next
      Merge tag 'drm/tegra/for-6.2-rc1' of
https://gitlab.freedesktop.org/drm/tegra into drm-next
      Merge tag 'amd-drm-next-6.2-2022-11-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-msm-display-for-6.2' of
https://gitlab.freedesktop.org/lumag/msm into drm-next
      Merge tag 'drm-msm-next-2022-11-28' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-intel-next-fixes-2022-12-01' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2022-12-08' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.2-2022-12-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'amd-drm-next-6.2-2022-12-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David Francis (1):
      drm/amd: Add IMU fw version to fw version queries

David Galiffi (3):
      drm/amd/display: Update SubVP Visual Confirm
      drm/amd/display: Fix rotated cursor offset calculation
      drm/amd/display: Enable dp_hdmi21_pcon support

Deming Wang (1):
      drm/amdkfd: use vma_lookup() instead of find_vma()

Dillon Varone (23):
      drm/amd/display: Update latencies on DCN321
      drm/amd/display: Set memclk levels to be at least 1 for dcn32
      drm/amd/display: Reinit DPG when exiting dynamic ODM
      drm/amd/display: Check validation passed after applying pipe split ch=
anges
      drm/amd/display: Enforce minimum prefetch time for low memclk on DCN3=
2
      drm/amd/display: Program pipes for ODM when removing planes
      drm/amd/display: Check context constructed for pipe split flags
is still valid
      drm/amd/display: Align phantom pipe dst/src scaling with main for sub=
vp
      drm/amd/display: Fix prefetch calculations for dcn32
      drm/amd/display: use uclk pstate latency for fw assisted mclk
validation dcn32
      drm/amd/display: Set max for prefetch lines on dcn32
      drm/amd/display: Update soc bounding box for dcn32/dcn321
      drm/amd/display: Use dummy pstate latency for subvp when needed on dc=
n32
      drm/amd/display: Add check for DET fetch latency hiding for dcn32
      drm/amd/display: Use viewport height for subvp mall allocation size
      drm/amd/display: Use new num clk levels struct for max mclk index
      drm/amd/display: MALL SS calculations should iterate over all
pipes for cursor
      drm/amd/display: Fix arithmetic error in MALL size calculations for s=
ubvp
      drm/amd/display: Use DCC meta pitch for MALL allocation requirements
      drm/amd/display: program output tf when required
      drm/amd/display: Disable uclk pstate for subvp pipes
      drm/amd/display: Bypass DET swath fill check for max clocks
      drm/amd/display: set optimized required for comp buf changes

Dmitry Baryshkov (25):
      Merge remote-tracking branch 'msm/msm-fixes' into HEAD
      drm/msm: less magic numbers in msm_mdss_enable
      drm/msm/mdp5: stop overriding drvdata
      dt-bindings: display/msm: split qcom, mdss bindings
      dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
      dt-bindings: display/msm: add interconnects property to qcom, mdss-sm=
d845
      dt-bindings: display/msm: move common DPU properties to dpu-common.ya=
ml
      dt-bindings: display/msm: move common MDSS properties to mdss-common.=
yaml
      dt-bindings: display/msm: split dpu-sc7180 into DPU and MDSS parts
      dt-bindings: display/msm: split dpu-sc7280 into DPU and MDSS parts
      dt-bindings: display/msm: split dpu-sdm845 into DPU and MDSS parts
      dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
      dt-bindings: display/msm: split dpu-qcm2290 into DPU and MDSS parts
      dt-bindings: display/msm: add missing device nodes to mdss-* schemas
      dt-bindings: display/msm: add support for the display on SM8250
      drm/msm/hdmi: use devres helper for runtime PM management
      drm/msm/hdmi: drop constant resource names from platform config
      drm/msm: move domain allocation into msm_iommu_new()
      drm/msm: remove duplicated code from a6xx_create_address_space
      drm/msm/hdmi: move resource allocation to probe function
      drm/msm/hdmi: don't take extra reference on PHY device
      drm/msm/hdmi: move msm_hdmi_get_phy() to msm_hdmi_dev_probe()
      dt-bindings: display/msm/dsi-controller-main: allow defining opp-tabl=
e
      drm/msm/mdp5: fix reading hw revision on db410c platform
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and
'msm-next-lumag-mdp5' into msm-next-lumag

Dmitry Osipenko (31):
      dma-buf: Add unlocked variant of vmapping functions
      dma-buf: Add unlocked variant of attachment-mapping functions
      drm/gem: Take reservation lock for vmap/vunmap operations
      drm/prime: Prepare to dynamic dma-buf locking specification
      drm/armada: Prepare to dynamic dma-buf locking specification
      drm/i915: Prepare to dynamic dma-buf locking specification
      drm/omapdrm: Prepare to dynamic dma-buf locking specification
      drm/tegra: Prepare to dynamic dma-buf locking specification
      drm/etnaviv: Prepare to dynamic dma-buf locking specification
      RDMA/umem: Prepare to dynamic dma-buf locking specification
      misc: fastrpc: Prepare to dynamic dma-buf locking specification
      xen/gntdev: Prepare to dynamic dma-buf locking specification
      media: videobuf2: Prepare to dynamic dma-buf locking specification
      media: tegra-vde: Prepare to dynamic dma-buf locking specification
      dma-buf: Move dma_buf_vmap() to dynamic locking specification
      dma-buf: Move dma_buf_attach() to dynamic locking specification
      dma-buf: Move dma_buf_map_attachment() to dynamic locking specificati=
on
      dma-buf: Move dma_buf_mmap() to dynamic locking specification
      dma-buf: Document dynamic locking convention
      media: videobuf2: Stop using internal dma-buf lock
      dma-buf: Remove obsoleted internal lock
      drm/client: Switch drm_client_buffer_delete() to unlocked drm_gem_vun=
map
      dma-buf: Make locking consistent in dma_buf_detach()
      drm/client: Prevent NULL dereference in drm_client_buffer_delete()
      dma-buf: Move dma_buf_mmap_internal() to dynamic locking specificatio=
n
      drm: Assert held reservation lock for dma-buf mmapping
      udmabuf: Assert held reservation lock for dma-buf mmapping
      dma-buf/heaps: Assert held reservation lock for dma-buf mmapping
      media: videobuf2: Assert held reservation lock for dma-buf mmapping
      fastrpc: Assert held reservation lock for dma-buf mmapping
      drm/gem-vram: Fix deadlock in drm_gem_vram_vmap()

Dmitry Torokhov (1):
      drm/tegra: Switch to using devm_fwnode_gpiod_get()

Dmytro Laktyushkin (5):
      drm/amd/display: correctly populate dcn315 clock table
      drm/amd/display: use low clocks for no plane configs
      drm/amd/display: fix unbounded requesting for high pixel rate
modes on dcn315
      drm/amd/display: set per pipe dppclk to 0 when dpp is off
      drm/amd/display: prevent seamless boot on displays that don't
have the preferred dig

Dom Cobley (1):
      drm/vc4: hdmi: Add more checks for 4k resolutions

Don Hiatt (1):
      drm/i915: Use GEN12_RPSTAT register for GT freq

Dong Chenchen (1):
      drm/amdgpu: Fix memory leak in amdgpu_cs_pass1

Doug Brown (2):
      drm/etnaviv: add missing quirks for GC300
      drm/etnaviv: fix power register offset on GC300

Douglas Anderson (1):
      drm/edid: Dump the EDID when drm_edid_get_panel_id() has an error

Eric Bernstein (1):
      drm/amd/display: Include virtual signal to set k1 and k2 values

Eric Huang (1):
      drm/amdkfd: Fix a memory limit issue

Evan Quan (6):
      drm/amd/pm: fulfill SMU13.0.0 cstate control interface
      drm/amd/pm: fulfill SMU13.0.7 cstate control interface
      drm/amd/pm: disable cstate feature for gpu reset scenario
      drm/amd/pm: enable runpm support over BACO for SMU13.0.0
      drm/amd/pm: enable runpm support over BACO for SMU13.0.7
      drm/amd/pm: fix SMU13 runpm hang due to unintentional workaround

Fabio M. De Francesco (2):
      drm/radeon: Replace kmap() with kmap_local_page()
      drm/amd/amdgpu: Replace kmap() with kmap_local_page()

Fangzhi Zuo (3):
      drm/amd/display: Add UHBR135 and UHBR20 into debugfs
      drm/amd/display: Ignore Cable ID Feature
      drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS

Felix Kuehling (4):
      drm/amdkfd: Fix error handling in kfd_criu_restore_events
      drm/amdkfd: Fix error handling in criu_checkpoint
      drm/amdgpu: Set MTYPE in PTE based on BO flags
      drm/amdkfd: Release the topology_lock in error case

Gaosheng Cui (1):
      drm/ttm: fix undefined behavior in bit shift for
TTM_TT_FLAG_PRIV_POPULATED

Gavin Wan (2):
      drm/amdgpu: Disable GPU reset on SRIOV before remove pci.
      drm/amdgpu: Ignore stop rlc on SRIOV environment.

Geert Uytterhoeven (1):
      drm/modes: parse_cmdline: Add support for named modes containing dash=
es

George Shen (8):
      drm/amd/display: Fix DCN32 DSC delay calculation
      drm/amd/display: Use forced DSC bpp in DML
      drm/amd/display: Round up DST_after_scaler to nearest int
      drm/amd/display: Add DSC delay factor workaround
      drm/amd/display: Populate DP2.0 output type for DML pipe
      drm/amd/display: Support parsing VRAM info v3.0 from VBIOS
      drm/amd/display: Workaround to increase phantom pipe vactive in pipes=
plit
      drm/amd/display: Fix calculation for cursor CAB allocation

Gil Dekel (1):
      drm/mediatek: Make eDP panel as the first connected connector

Graham Sider (4):
      drm/amdgpu: correct MES debugfs versions
      drm/amdgpu: remove deprecated MES version vars
      drm/amdgpu: disable GFXOFF during compute for GFX11
      drm/amdgpu: extend halt_if_hws_hang to MES

Guchun Chen (6):
      drm/amdgpu: disable BACO on special BEIGE_GOBY card
      drm/amdgpu: disable BACO support on more cards
      drm/amd/pm/smu11: BACO is supported when it's in BACO state
      drm/amd/pm/smu11: poll BACO status after RPM BACO exits
      drm/amdgpu: add printing to indicate rpm completeness
      drm/amdgpu: use dev_dbg to print messages in runtime cycle

Guenter Roeck (1):
      drm/amd/display: Increase frame size limit for display_mode_vba_util_=
32.o

Gustavo Sousa (3):
      drm/i915: Move hotplug inversion logic into separate helper
      drm/i915/xelp: Add Wa_1806527549
      drm/i915/dmc: Update DG2 DMC version to v2.08

Gwan-gyeong Mun (2):
      drm/i915/gt: Remove unused function prototype
      drm/i915/hwmon: Fix a build error used with clang compiler

Haiyi Zhou (1):
      drm/amd/display: wait for vblank during pipe programming

Hamza Mahfooz (7):
      drm/amd/display: add an ASSERT() to irq service functions
      drm/edid: add a quirk for two LG monitors to get them to work on 10bp=
c
      drm/amd/display: use max_dsc_bpp in amdgpu_dm
      Revert "drm/amd/display: Limit max DSC target bpp for specific monito=
rs"
      drm/amd/display: drop vblank_lock from struct amdgpu_display_manager
      drm/amd/display: only fill dirty rectangles when PSR is enabled
      drm/amd/display: add FB_DAMAGE_CLIPS support

Hanjun Guo (1):
      drm/radeon: Add the missed acpi_put_table() to fix memory leak

Harsh Jain (1):
      drm/amdgpu: complete gfxoff allow signal during suspend without delay

Hawking Zhang (4):
      drm/amdgpu: extend HWIP_MAX_INSTANCE to 28
      drm/amdgpu: update psp_fw_type enum in amdgpu_ucode header
      drm/amdgpu: move convert_error_address out of umc_ras
      drm/amdgpu: switch to select_se_sh wrapper for gfx v9_0

Ian Chen (1):
      drm/amd/display: Refactor eDP PSR codes

Ilya Bakoulin (2):
      drm/amd/display: Adjust DP 8b10b LT exit behavior
      drm/amd/display: Fix display corruption w/ VSR enable

Imre Deak (15):
      drm/i915: Fix TypeC mode initialization during system resume
      drm/i915: Fix simulated GPU reset wrt. encoder HW readout
      drm/i915/tgl+: Add locking around DKL PHY register accesses
      drm/i915: Rename intel_tc_phy_regs.h to intel_mg_phy_regs.h
      drm/i915/tgl+: Move DKL PHY register definitions to intel_dkl_phy_reg=
s.h
      drm/i915/tgl+: Sanitize DKL PHY register definitions
      drm/i915: Fix warn in intel_display_power_*_domain() functions
      drm/i915: Preallocate the debug power domain wakerefs array
      drm/i915: Move the POWER_DOMAIN_AUX_IO_A definition to its logical pl=
ace
      drm/i915: Use the AUX_IO power domain only for eDP/PSR port
      drm/i915/tgl+: Enable display DC power states on all eDP ports
      drm/i915: Add missing AUX_IO_A power domain->well mappings
      drm/i915: Add missing DC_OFF power domain->well mappings
      drm/i915: Factor out function to get/put AUX_IO power for main link
      drm/i915/mtl+: Don't enable the AUX_IO power for non-eDP port main li=
nks

Iswara Nagulendran (1):
      drm/amd/display: Modify checks to enable TPS3 pattern when required

Jack Xiao (3):
      drm/amd/amdgpu: reserve vm invalidation engine for firmware
      drm/amd/amdgpu: update mes11 api def
      drm/amdgpu/mes11: enable reg active poll

Jagan Teki (4):
      dt-bindings: vendor-prefixes: Document Chongzhou
      dt-bindings: vendor-prefixes: Document Jadard
      dt-bindings: display: Document Jadard JD9365DA-H3 DSI panel
      drm: panel: Add Jadard JD9365DA-H3 DSI panel

James Zhu (1):
      drm/amdgpu: fix stall on CPU when allocate large system memory

Jane Jian (1):
      drm/amdgpu/vcn: re-use original vcn0 doorbell value

Jani Nikula (47):
      drm/i915/hotplug: move hotplug storm debugfs to intel_hotplug.c
      drm/i915/hotplug: refactor hotplug init slightly
      drm/i915/display: remove ipc_enabled from struct drm_i915_private
      drm/i915: move i915_coherent_map_type() to i915_gem_pages.c and un-in=
line
      drm/i915: fix device info for devices without display
      drm: split build lists one per line and sort
      drm/i915/hdmi: do dual mode detect only if connected
      drm/i915/hdmi: stop using connector->override_edid
      drm/amd/display: stop using connector->override_edid
      drm/edid: debug log EDID override set/reset
      drm/edid: abstract debugfs override EDID show better
      drm/edid: rename drm_add_override_edid_modes() to
drm_edid_override_connector_update()
      drm/edid: split drm_edid block count helper
      drm/edid: add function for checking drm_edid validity
      drm/edid: detach debugfs EDID override from EDID property update
      drm/edid/firmware: drop redundant connector_name variable/parameter
      drm/edid/firmware: rename drm_load_edid_firmware() to
drm_edid_load_firmware()
      drm/edid: use struct drm_edid for override/firmware EDID
      drm/edid: move edid load declarations to internal header
      drm/edid/firmware: convert to drm device specific logging
      drm/edid: add [CONNECTOR:%d:%s] to debug logging
      drm/edid: convert to device specific logging
      drm/i915/gmbus: move GPIO enum to gmbus
      drm/i915: reduce includes in intel_connector.h
      drm/i915: reduce includes in intel_fifo_underrun.h
      drm/i915: un-inline icl_hdr_plane_mask() to simplify includes
      drm/i915/dpio: un-inline the vlv phy/channel mapping functions
      drm/i915/dpio: move dpio_channel and dpio_phy enums to intel_dpio_phy=
.h
      drm/i915: reduce includes in intel_display_power.h
      drm/i915/display: reduce the includes in intel_dvo_dev.h
      drm/i915/display: reduce includes in intel_hdmi.h
      drm/i915/display: reduce includes in g4x_dp.h includes
      drm/i915/irq: make gen2_irq_init()/gen2_irq_reset() static
      drm/i915/pxp: use <> instead of "" for headers in include/
      drm/i915/display: move struct intel_link_m_n to intel_display_types.h
      drm/i915/reg: move masked field helpers to i915_reg_defs.h
      drm/i915/reg: move pick even and pick to reg defs
      drm/i915: split out intel_display_reg_defs.h
      drm/i915: stop including i915_irq.h from i915_trace.h
      drm/edid/firmware: stop using a throwaway platform device
      drm/i915/edp: wait power off delay at driver remove to optimize probe
      drm/i915/hti: abstract hti handling
      drm/i915/display: move hti under display sub-struct
      drm/i915/display: move global_obj_list under display sub-struct
      drm/i915/display: move restore state and ctx under display sub-struct
      drm/i915/guc: make default_lists const data
      drm/tegra: Convert to using is_hdmi from display info

Janusz Krzysztofik (3):
      drm/i915/gem: Flush contexts on driver release
      drm/i915: Fix negative value passed as remaining time
      drm/i915: Never return 0 if not all requests retired

Jason Yen (1):
      drm/bridge: ps8640: Add software to support aux defer

Javier Martinez Canillas (5):
      drm/ssd130x: Iterate over damage clips instead of using a merged rect
      drm/mgag200: Do not call drm_atomic_add_affected_planes()
      drm/simpledrm: Do not call drm_atomic_add_affected_planes()
      drm/ssd130x: Do not call drm_atomic_add_affected_planes()
      drm/crtc-helper: Add a drm_crtc_helper_atomic_check() helper

Jay Cornwall (1):
      drm/amdkfd: update GFX11 CWSR trap handler

Jesse Zhang (1):
      drm/amdkfd: correct the cache info for gfx1036

Jessica Zhang (2):
      drm/msm/dpu: Add support for XR30 format
      drm/msm/dpu: Add support for P010 format

Jiadong Zhu (1):
      drm/amdgpu: Make amdgpu_ring_mux functions as static

Jiadong.Zhu (4):
      drm/amdgpu: Introduce gfx software ring (v9)
      drm/amdgpu: Add software ring callbacks for gfx9 (v8)
      drm/amdgpu: Modify unmap_queue format for gfx9 (v6)
      drm/amdgpu: MCBP based on DRM scheduler (v9)

Jiapeng Chong (7):
      drm/amd/display: make wake_up_aux_channel static
      drm/amd/display: Modify mismatched function name
      drm/rockchip: dsi: Remove the unused function dsi_update_bits()
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Remove the unused function get_pt_type()

Jilin Yuan (1):
      drm/edid: fix repeated words in comments

Jiri Slaby (SUSE) (2):
      drm/amd/display (gcc13): fix enum mismatch
      drm/i915: remove circ_buf.h includes

Joaqu=C3=ADn Ignacio Aramend=C3=ADa (1):
      drm/amd/display: Revert logic for plane modifiers

Jocelyn Falempe (2):
      drm/ast: Add Atomic gamma lut support for aspeed
      drm/mgag200: Fix PLL setup for G200_SE_A rev >=3D4

Johan Hovold (2):
      drm/msm/dp: drop modeset sanity checks
      drm/msm/dsi: drop modeset sanity checks

Johan Jonker (1):
      drm: rockchip: remove rockchip_drm_framebuffer_init() function

John Harrison (9):
      drm/i915/guc: Fix release build bug in 'remove log size module parame=
ters'
      drm/i915/guc: Enable compute scheduling on DG2
      drm/i915/guc: Limit scheduling properties to avoid overflow
      drm/i915: Fix compute pre-emption w/a to apply to compute engines
      drm/i915: Make the heartbeat play nice with long pre-emption timeouts
      drm/i915: Improve long running compute w/a for GuC submission
      drm/i915/guc: Remove excessive line feeds in state dumps
      drm/i915/guc: Properly initialise kernel contexts
      drm/i915/guc: Don't deadlock busyness stats vs reset

Jonathan Kim (1):
      drm/amdkfd: enable cooperative launch for gfx10.3

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Jos=C3=A9 Exp=C3=B3sito (2):
      drm/vc4: hdmi: Pass vc4_hdmi to vc4_hdmi_supports_scrambling()
      drm/vc4: hdmi: Fix pointer dereference before check

Jos=C3=A9 Roberto de Souza (3):
      drm/i915: Parse and set stepping for platforms with GMD
      drm/i915/mtl: Extend PSR support
      drm/i915: Extend Wa_1607297627 to Alderlake-P

Jouni H=C3=B6gander (5):
      drm/i915/psr: Fix PSR_IMR/IIR field handling
      drm/i915/psr: Send update also on invalidate
      drm/i915/mtl: Fix PSR2_MAN_TRK_CTL bit getter functions for MTL
      drm/i915/psr: Ensure panel granularity aligns with DSC slice height
      drm/i915/psr: Remove inappropriate DSC slice alignment warning

Julia Lawall (1):
      drm/i915/gvt: fix typo in comment

Jun Lei (2):
      drm/amd/display: Limit dcn32 to 1950Mhz display clock
      drm/amd/display: enable dchub request limit for DCN 3.2.x

Justin Green (2):
      drm/mediatek: Add AFBC support to Mediatek DRM driver
      drm/mediatek: Add MT8195 ovl driver support

Karolina Drobnik (1):
      i915/i915_gem_context: Remove debug message in
i915_gem_context_create_ioctl

Kenneth Feng (10):
      drm/amd/pm: temporarily disable thermal alert on smu_v13_0_10
      drm/amd/pm: remove the pptable id override on smu_v13_0_10
      drm/amd/amdgpu: enable gfx clock gating features on smu_v13_0_10
      drm/amd/pm: skip loading pptable from driver on secure board for
smu_v13_0_10
      drm/amd/pm: enable thermal alert on smu_v13_0_10
      drm/amd/pm: update driver-if header for smu_v13_0_10
      drm/amd/pm: allow gfxoff on gc_11_0_3
      drm/amd/amdgpu: temporary workaround to skip ras error for gc_v11_0_3
      drm/amd/pm: enable mode1 reset on smu_v13_0_10
      drm/amd/pm: skip disabling all smu features on smu_v13_0_10 in suspen=
d

Kieran Bingham (1):
      drm: lcdif: Add support for YUV planes

Konstantin Meskhidze (2):
      drm/amdkfd: Fix memory leakage
      drm/amdgpu: Fix logic error

Kuogee Hsieh (2):
      drm/msm/dp: replace variable err with len at dp_aux_link_power_up()
      drm/msm/dp: retry 3 times if set sink to D0 poweer state failed

Laurent Pinchart (41):
      drm: lcdif: Fix indentation in lcdif_regs.h
      drm: lcdif: Don't use BIT() for multi-bit register fields
      drm: lcdif: Switch to limited range for RGB to YUV conversion
      dt-bindings: display: xlnx: zynqmp-dpsub: Add OF graph ports
      drm: xlnx: zynqmp_dpsub: Switch to atomic encoder enable/disable
      drm: xlnx: zynqmp_dpsub: Constify mode argument to function
      drm: xlnx: zynqmp_dpsub: Create DRM bridge to model DP encoder
      drm: xlnx: zynqmp_dpsub: Don't access connector in zynqmp_dp_set_form=
at()
      drm: xlnx: zynqmp_dpsub: Move connector registration to bridge attach
      drm: xlnx: zynqmp_dpsub: Move encoder to DPSUB core
      drm: xlnx: zynqmp_dpsub: Attach to the next bridge
      drm: xlnx: zynqmp_dpsub: Use DRM connector bridge helper
      drm: xlnx: zynqmp_dpsub: Report HPD through the bridge
      drm: xlnx: zynqmp_dpsub: Drop unused zynqmp_disp.event field
      drm: xlnx: zynqmp_dpsub: Drop unused zynqmp_disp_format.bus_fmt field
      drm: xlnx: zynqmp_dpsub: Don't pass CRTC to zynqmp_disp_setup_clock()
      drm: xlnx: zynqmp_dpsub: Configure blender in zynqmp_disp_enable()
      drm: xlnx: zynqmp_dpsub: Use local variable in zynqmp_disp_layer_upda=
te()
      drm: xlnx: zynqmp_dpsub: Pass format info to
zynqmp_disp_layer_set_format()
      drm: xlnx: zynqmp_dpsub: Remplace hardcoded values with ARRAY_SIZE()
      drm: xlnx: zynqmp_dpsub: Don't use drmm_kcalloc() for temporary data
      drm: xlnx: zynqmp_dpsub: Move pclk from zynqmp_disp to zynqmp_dpsub
      drm: xlnx: zynqmp_dpsub: Move audio clk from zynqmp_disp to zynqmp_dp=
sub
      drm: xlnx: zynqmp_dpsub: Move CRTC to zynqmp_dpsub structure
      drm: xlnx: zynqmp_dpsub: Move planes to zynqmp_dpsub structure
      drm: xlnx: zynqmp_dpsub: Move DRM/KMS initialization to separate file
      drm: xlnx: zynqmp_dpsub: Move CRTC handling to zynqmp_kms.c
      drm: xlnx: zynqmp_dpsub: Move planes handling to zynqmp_kms.c
      drm: xlnx: zynqmp_dpsub: Register AUX bus at bridge attach time
      drm: xlnx: zynqmp_dpsub: Move DP bridge init to zynqmp_dp_probe()
      drm: xlnx: zynqmp_dpsub: Manage DP and DISP allocations manually
      drm: xlnx: zynqmp_dpsub: Move all DRM init and cleanup to zynqmp_kms.=
c
      drm: xlnx: zynqmp_dpsub: Decouple DRM device from zynqmp_dpsub
      drm: xlnx: zynqmp_dpsub: Rename zynqmp_dpsub_handle_vblank with DRM p=
refix
      drm: xlnx: zynqmp_dpsub: Parse DT to find connected ports
      drm: xlnx: zynqmp_dpsub: Allow configuration of layer mode
      drm: xlnx: zynqmp_dpsub: Support operation without DMA engine
      drm: xlnx: zynqmp_dpsub: Add support for live video input
      arm64: dts: zynqmp: Add ports for the DisplayPort subsystem
      arm64: dts: zynqmp: zcu106a: Describe DisplayPort connector
      drm: rcar-du: Drop leftovers dependencies from Kconfig

Leo Chen (2):
      drm/amd/display: Update DSC capabilitie for DCN314
      drm/amd/display: Add a debug option HBR2CP2520 over TPS4

Leo Liu (1):
      drm/amdgpu: enable Vangogh VCN indirect sram mode

Leo Ma (1):
      drm/amd/display: Adding HDMI SCDC DEVICE_ID define

Lewis Huang (1):
      drm/amd/display: refine wake up aux in retrieve link caps

Liang He (1):
      drm/amdgpu: Fix potential double free and null pointer dereference

Lijo Lazar (1):
      drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x

Likun Gao (2):
      drm/amdgpu: skip mes self test for gc 11.0.3
      drm/amdgpu: skip vram reserve on firmware_v2_2 for bare-metal

Lionel Landwerlin (1):
      drm/i915/perf: complete programming whitelisting for XEHPSDV

Liu Jian (1):
      drm/amd/display: delete the duplicate .set_odm_bypass
initialization in dcn314_tg_funcs

Liu Shixin (2):
      drm/msm/dpu: use DEFINE_SHOW_ATTRIBUTE to simplify dpu_regset32
      gpu: host1x: Use DEFINE_SHOW_ATTRIBUTE to simplify debugfs code

Liu Xi (1):
      drm/amd/display: clean up some irq service code for dcn201

Loic Poulain (2):
      dt-bindings: display/msm: Add QCM2290 DSI phy
      drm/msm/dsi: Add phy configuration for QCM2290

LongJun Tang (1):
      drm/amd/display: Have risk for memory exhaustion

Luben Tuikov (9):
      drm/scheduler: Set the FIFO scheduling policy as the default
      MAINTAINERS: Update GPU Scheduler email
      drm/amdgpu: Remove redundant I2C EEPROM address
      drm/amdgpu: Decouple RAS EEPROM addresses from chips
      drm/amdgpu: Allow non-standard EEPROM I2C address
      drm/amdgpu: Bug-fix: Reading I2C FRU data on newer ASICs
      drm/amdgpu: Interpret IPMI data for product information (v2)
      drm/amdgpu: Add support for RAS table at 0x40000
      drm/amdgpu: Fix minmax warning

Lucas De Marchi (9):
      drm/i915: Add missing mask when reading GEN12_DSMBASE
      drm/i915: Split i915_gem_init_stolen()
      drm/i915/dgfx: Make failure to setup stolen non-fatal
      drm/i915: Noop lrc_init_wa_ctx() on recent/future platforms
      drm/i915: Fix __gen125_emit_bb_start() without WA
      drm/i915/gt: Document function to decode register state context
      drm/i915/gt: Fix platform prefix
      Documentation/gpu: Fix section in the wrong scope
      drm/i915: Update workaround documentation

Lucas Stach (5):
      drm/etnaviv: move idle mapping reaping into separate function
      drm/etnaviv: reap idle mapping if it doesn't match the softpin addres=
s
      drm/etnaviv: don't truncate physical page address
      drm/fourcc: add Vivante tile status modifiers
      drm/etnaviv: switch to PFN mappings

Lyude Paul (6):
      drm/amdgpu/mst: Stop ignoring error codes and deadlocking
      drm/display/dp_mst: Fix drm_dp_mst_add_affected_dsc_crtcs() return co=
de
      drm/amdgpu/dm/mst: Use the correct topology mgr pointer in
amdgpu_dm_connector
      drm/amdgpu/dm/dp_mst: Don't grab mst_mgr->lock when computing DSC sta=
te
      drm/amdgpu/dm/mst: Fix uninitialized var in
pre_compute_mst_dsc_configs_for_state()
      drm/amd/dc/dce120: Fix audio register mapping, stop triggering KASAN

Ma Hanghong (1):
      drm/amd/display: Wrong colorimetry workaround

Ma Jun (4):
      drm/amdkfd: Remove unused variable
      drm/amdkfd: Fix the warning of array-index-out-of-bounds
      drm/amdkfd: Fix the memory overrun
      drm/amdkfd: Make kfd_fill_cache_non_crat_info() as static

Maaz Mombasawala (5):
      drm/vmwgfx: Refactor resource manager's hashtable to use
linux/hashtable implementation.
      drm/vmwgfx: Remove ttm object hashtable
      drm/vmwgfx: Refactor resource validation hashtable to use
linux/hashtable implementation.
      drm/vmwgfx: Refactor ttm reference object hashtable to use
linux/hashtable.
      drm/vmwgfx: Remove vmwgfx_hashtab

Marco Felsch (3):
      drm/etnaviv: disable tx clock gating for GC7000 rev6203
      drm: lcdif: change burst size to 256B
      drm/etnaviv: add HWDB entry for GC7000 r6203

Marek Vasut (4):
      drm/panel/panel-sitronix-st7701: Fix RTNI calculation
      drm/panel/panel-sitronix-st7701: Clean up CMDnBKx selection
      drm/panel/panel-sitronix-st7701: Remove panel on DSI attach failure
      drm: lcdif: Set and enable FIFO Panic threshold

Marijn Suijten (11):
      drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional bi=
ts
      drm/msm/dsi: Remove useless math in DSC calculations
      drm/msm/dsi: Remove repeated calculation of slice_per_intf
      drm/msm/dsi: Use DIV_ROUND_UP instead of conditional increment on mod=
ulo
      drm/msm/dsi: Reuse earlier computed dsc->slice_chunk_size
      drm/msm/dsi: Appropriately set dsc->mux_word_size based on bpc
      drm/msm/dsi: Migrate to drm_dsc_compute_rc_parameters()
      drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bit=
s
      drm/msm/dsi: Disallow 8 BPC DSC configuration for alternative BPC val=
ues
      drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional bi=
ts
      drm/msm/dsi: Prevent signed BPG offsets from bleeding into adjacent b=
its

Mario Limonciello (1):
      drm/amd: Fail the suspend if resources can't be evicted

Martin Krastev (1):
      drm/vmwgfx: Fix frame-size warning in vmw_mksstat_add_ioctl

Martin Leung (2):
      drm/amd/display: Stop waiting for vblank during pipe programming
      drm/amd/display: revert Disable DRR actions during state commit

Mateusz Kwiatkowski (1):
      drm/vc4: vec: Fix definition of PAL-M mode

Matt Atwood (2):
      drm/i915/dg2: introduce Wa_22015475538
      drm/i915/rpl-p: Add stepping info

Matt Roper (24):
      drm/i915/mtl: Add MTL forcewake support
      drm/i915: Split GAM and MSLICE steering
      drm/i915: Read graphics/media/display arch version from hw
      drm/i915/mtl: Define engine context layouts
      drm/i915: Document and future-proof preemption control policy
      drm/i915/gen8: Create separate reg definitions for new MCR registers
      drm/i915/xehp: Create separate reg definitions for new MCR registers
      drm/i915/gt: Drop a few unused register definitions
      drm/i915/gt: Correct prefix on a few registers
      drm/i915/gt: Add intel_gt_mcr_multicast_rmw() operation
      drm/i915/xehp: Check for faults on primary GAM
      drm/i915/gt: Add intel_gt_mcr_wait_for_reg_fw()
      drm/i915: Define MCR registers explicitly
      drm/i915/gt: Always use MCR functions on multicast registers
      drm/i915/guc: Handle save/restore of MCR registers explicitly
      drm/i915/gt: Add MCR-specific workaround initializers
      drm/i915: Define multicast registers as a new type
      drm/i915/xelpg: Add multicast steering
      drm/i915/xelpmp: Add multicast steering for media GT
      drm/i915/pvc: Update forcewake domain for CCS register ranges
      drm/i915/xelpg: Fix write to MTL_MCR_SELECTOR
      drm/i915/mtl: Add missing steering table terminators
      drm/i915/dg2: Drop force_probe requirement
      drm/i915/gt: Manage uncore->lock while waiting on MCR register

Matthew Auld (18):
      drm/i915/ttm: implement access_memory
      drm/i915: remove the TODO in pin_and_fence_fb_obj
      drm/i915/display: handle migration for dpt
      drm/i915: allow control over the flags when migrating
      drm/i915/display: consider DG2_RC_CCS_CC when migrating buffers
      drm/i915: check memory is mappable in read_from_page
      drm/i915: add back GEN12_BDSM_MASK
      drm/i915: restore stolen memory behaviour for DG2
      drm/i915: enable PS64 support for DG2
      drm/i915/uapi: expose GTT alignment
      Revert "drm/i915/uapi: expose GTT alignment"
      drm/i915/dmabuf: fix sg_table handling in map_dma_buf
      drm/i915/selftests: exercise GPU access from the importer
      drm/i915/userptr: restore probe_range behaviour
      drm/i915/ttm: fix uaf with lmem_userfault_list handling
      drm/i915/ttm: add some sanity checks for lmem_userfault_list
      drm/i915: use i915_sg_dma_sizes() for all backends
      drm/i915/ttm: never purge busy objects

Matthew Brost (1):
      drm/i915/guc: Delay disabling guc_id scheduling for better hysteresis

Mauro Carvalho Chehab (1):
      drm/i915: gvt: fix kernel-doc trivial warnings

Max Tseng (2):
      drm/amd/display: cursor update command incomplete
      drm/amd/display: Cursor update refactor: PSR-SU support condition

Maxime Ripard (23):
      drm/tests: Order Kunit tests in Makefile
      drm/atomic-helper: Rename drm_atomic_helper_connector_tv_reset
to avoid ambiguity
      drm/connector: Rename subconnector state variable
      drm/atomic: Add TV subconnector property to get/set_property
      drm/modes: Only consider bpp and refresh before options
      Merge drm/drm-next into drm-misc-next
      firmware: raspberrypi: Introduce rpi_firmware_find_node()
      firmware: raspberrypi: Move the clock IDs to the firmware header
      firmware: raspberrypi: Provide a helper to query a clock max rate
      drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
      drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
      drm/vc4: Make sure we don't end up with a core clock too high
      docs/fb: Document current named modes
      drm/tests: Add Kunit Helpers
      drm/client: Add some tests for drm_connector_pick_cmdline_mode()
      drm/modes: Move named modes parsing to a separate function
      drm/modes: Switch to named mode descriptors
      drm/modes: Fill drm_cmdline mode from named modes
      drm/connector: Add pixel clock to cmdline mode
      drm/tests: Include helpers header
      drm/tests: helpers: Add module infos
      drm/tests: client: Remove extra blank lines
      drm/tests: helpers: Add SPDX header

Ma=C3=ADra Canal (4):
      drm/tests: Split drm_test_dp_mst_calc_pbn_mode into parameterized tes=
ts
      drm/tests: Split drm_test_dp_mst_sideband_msg_req_decode into
parameterized tests
      drm/v3d: switch to drmm_mutex_init
      drm/v3d: add missing mutex_destroy

Melissa Wen (1):
      drm/amd/display: don't enable DRM CRTC degamma property for DCE

Michael Banack (4):
      drm/vmwgfx: Clean up cursor mobs
      drm/vmwgfx: Start diffing new mob cursors against old ones
      drm/vmwgfx: Support cursor surfaces with mob cursor
      drm/vmwgfx: Diff cursors when using cmds

Michael J. Ruhl (2):
      drm/i915/dmabuf: dmabuf cleanup
      drm/i915/dmabuf: Use scatterlist for_each_sg API

Michael Strauss (2):
      drm/amd/display: Only update link settings after successful MST link =
train
      drm/amd/display: Fix DCN2.1 default DSC clocks

Micha=C5=82 Winiarski (2):
      drm/plane_helper: Print actual/expected values on failure
      drm/plane_helper: Split into parameterized test cases

Mike Hsieh (1):
      drm/amd/display: Set correct EOTF and Gamut flag in VRR info

Mikko Kovanen (1):
      drm/i915/dsi: fix VBT send packet port selection for dual link DSI

Mikko Perttunen (6):
      gpu: host1x: Select context device based on attached IOMMU
      memory: tegra: Add API for retrieving carveout bounds
      gpu: host1x: Add stream ID register data for NVDEC on Tegra234
      drm/tegra: nvdec: Support multiple clocks
      drm/tegra: Add code for booting RISC-V based engines
      drm/tegra: Add Tegra234 support to NVDEC driver

Mukul Joshi (1):
      drm/amdkfd: Cleanup kfd_dev struct

Mustapha Ghaddar (2):
      drm/amd/display: Fix fallback issues for DP LL 1.4a tests
      drm/amd/display: Phase 1 Add Bw Allocation source and header files

Nathan Chancellor (6):
      drm/amdkfd: Fix type of reset_type parameter in hqd_destroy() callbac=
k
      drm/i915: Fix CFI violations in gt_sysfs
      drm/meson: Fix return type of meson_encoder_cvbs_mode_valid()
      drm/amdgpu: Fix type of second parameter in trans_msg() callback
      drm/amdgpu: Fix type of second parameter in odn_edit_dpm_table() call=
back
      drm/mediatek: Fix return type of mtk_hdmi_bridge_mode_valid()

Nathan Huckleberry (1):
      drm: xlnx: Fix return type of zynqmp_dp_bridge_mode_valid

Nawwar Ali (1):
      drm/amd/display: Update 709 gamma to 2.222 as stated in the standerd

Nevenko Stupar (1):
      drm/amd/display: Investigate tool reported FCLK P-state deviations

Nicholas Kazlauskas (6):
      drm/amd/display: Update SR watermarks for DCN314
      drm/amd/display: Allow tuning DCN314 bounding box
      drm/amd/display: Fix reg timeout in enc314_enable_fifo
      drm/amd/display: Update Z8 watermarks for DCN314
      drm/amd/display: Add Z8 allow states to z-state support list
      drm/amd/display: Add debug option to skip PSR CRTC disable

Niranjana Vishwanathapura (3):
      drm/i915: Remove unused function parameter
      drm/i915: Remove unwanted pointer unpacking
      drm/i915: Do not set cache_dirty for DGFX

Nirmoy Das (7):
      drm/i915: Do not cleanup obj with NULL bo->resource
      drm/i915: Improve debug print in vm_fault_ttm
      drm/i915: Fix a potential UAF at device unload
      drm/i915: remove excessive i915_gem_drain_freed_objects
      drm/i915: Refactor ttm ghost obj detection
      drm/i915: Print return value on error
      drm/i915: Remove unwanted ghost obj check

Oded Gabbay (4):
      drivers/accel: define kconfig and register a new major
      accel: add dedicated minor for accelerator devices
      drm: initialize accel framework
      doc: add documentation for accel subsystem

Paul Hsieh (1):
      drm/amd/display: read invalid ddc pin status cause engine busy

Paulo Miguel Almeida (9):
      drm/amdkfd: remove unused kfd_pm4_headers_diq header file
      drm/amdkfd: remove unused struct cdit_header
      drm/radeon: Replace one-element array with flexible-array member
      drm/amdgpu: Replace one-element array with flexible-array member
      drm/amdgpu: Replace 1-element array with flexible-array member
      drm/amdgpu: Replace one-element array with flex-array member
      drm/amdgpu: Replace one-elements array with flex-array members
      i915/gvt: remove hardcoded value on crc32_start calculation
      drm/amdgpu: Replace remaining 1-element array with flex-array

Peng Ju Zhou (1):
      drm/amdgpu: Remove unnecessary register program in SRIOV

Perry Yuan (3):
      drm/amdgpu: add Vangogh APU flag to IP discovery path
      drm/amd/display: change GPU match with IP version for Vangogh
      drm/amdgpu: remove the DID of Vangogh from pciidlist

Peter Maucher (2):
      drm/amdgpu: improve GART and GTT documentation
      drm/amdgpu: mention RDNA support in docu

Philip Yang (2):
      drm/amdgpu: Unlock bo_list_mutex after error handling
      drm/amdgpu: Drop eviction lock when allocating PT BO

Pin-yen Lin (6):
      drm/bridge: it6505: Adapt runtime power management framework
      drm/bridge: it6505: Add pre_enable/post_disable callback
      drm/bridge: it6505: Initialize AUX channel in it6505_i2c_probe
      drm/bridge: it6505: Setup links in it6505_irq_hpd
      drm/bridge: it6505: Improve synchronization between extcon subsystem
      drm/bridge: it6505: Fix return value check for pm_runtime_get_sync

Prathap Kumar Valsan (1):
      drm/i915/gt: Flush to global observation point before breadcrumb writ=
e

Prike Liang (4):
      drm/amdkfd: update gfx1037 Lx cache setting
      drm/amdkfd: introduce dummy cache info for property asic
      drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume
      drm/amdgpu/sdma_v4_0: turn off SDMA ring buffer in the s2idle suspend

Qing Wang (1):
      drm/tegra: Switch over to vmemdup_user()

Radhakrishna Sripada (5):
      drm/i915/mtl: Add MTP ddc pin configuration
      drm/i915: Add intel_ prefix to struct ip_version
      drm/i915: Use graphics ver, rel info for media on old platforms
      drm/i915/mtl: Fix dram info readout
      drm/i915/mtl: Skip doubling channel numbers for LPDDR4/LPDDDR5

Rafael Mendonca (2):
      drm/amdgpu/powerplay/psm: Fix memory leak in power state init
      drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()

Rajneesh Bhardwaj (1):
      drm/amdgpu: Fix the kerneldoc description

Ramesh Errabolu (1):
      drm/amdgpu: Enable Aldebaran devices to report CU Occupancy

Randy Dunlap (2):
      drm/amd/display: fix kernel-doc issues in dc.h
      drm/amdgpu: update docum. filename following rename

Ren Zhijie (1):
      drm/amdgpu: fix unused-function error

Riana Tauro (5):
      drm/i915/guc/slpc: Run SLPC selftests on all tiles
      drm/i915/selftests: Add helper function measure_power
      drm/i915/guc/slpc: Add SLPC selftest live_slpc_power
      drm/i915/hwmon: Add HWMON current voltage support
      drm/i915/guc/slpc: Add selftest for slpc tile-tile interaction

Rob Clark (7):
      drm/msm: Add MSM_INFO_GET_FLAGS
      drm/msm: Remove exclusive-fence hack
      drm/msm/a6xx: Fix speed-bin detection vs probe-defer
      drm/msm: Enable clamp_to_idle for 7c3
      drm/msm: Enable unpin/eviction by default
      drm/msm/adreno: Simplify read64/write64 helpers
      drm/msm: Hangcheck progress detection

Robert Beckett (1):
      drm/i915: stop abusing swiotlb_max_segment

Robert Foss (1):
      drm/msm/dpu: Refactor sc7280_pp location

Rodrigo Siqueira (23):
      drm/amd/display: Check if link state is valid
      drm/amd/display: Rework context change check
      drm/amd/display: Enable new commit sequence only for DCN32x
      drm/amd/display: Copy DC context in the commit streams
      drm/amd/display: Include surface of unaffected streams
      drm/amd/display: Handle virtual hardware detect
      drm/amd/display: Add function for validate and update new stream
      drm/amd/display: Handle seamless boot stream
      drm/amd/display: Update OTG instance in the commit stream
      drm/amd/display: Avoid ABM when ODM combine is enabled for eDP
      drm/amd/display: Use update plane and stream routine for DCN32x
      drm/amd/display: Remove wrong pipe control lock
      drm/amd/display: Remove FPU guards from the DML folder
      drm/amd/display: Convert documentation to a kernel-doc
      drm/amd/display: Add events log to trace OPTC lock and unlock
      drm/amd/display: Expand kernel doc for DC
      drm/amd/display: Add DEC/CRB basic doc
      drm/amd/display: Add basic ODM description
      drm/amd/display: Add kernel doc to some of the dc fields
      drm/amd/display: Add kernel doc for commit sequence
      drm/amd/display: Rework comments on dc file
      drm/amd/display: Add HUBP surface flip interrupt handler
      drm/amd/display: Add YCBCR2020 coefficients to CSC matrix

Rodrigo Vivi (2):
      Merge drm/drm-next into drm-intel-next
      Merge tag 'gvt-next-2022-11-17' of
https://github.com/intel/gvt-linux into drm-intel-next

Roman Li (2):
      drm/amd/display: Fix optc2_configure warning on dcn314
      drm/amd/display: Align dcn314_smu logging with other DCNs

Ryan Lin (1):
      drm/amd/display: Waiting for 1 frame to fix the flash issue on PSR1

Saleemkhan Jamadar (1):
      drm/amdgpu: Enable pg/cg flags on GC11_0_4 for VCN

Samuel Holland (4):
      dt-bindings: display: sun6i-dsi: Fix clock conditional
      dt-bindings: display: sun6i-dsi: Add the A100 variant
      drm/sun4i: dsi: Add a variant structure
      drm/sun4i: dsi: Add the A100 variant

Sascha Hauer (1):
      drm/rockchip: vop2: Register Esmart0-win0 as primary plane

Sean Hong (2):
      drm/panel-edp: Add INX N116BGE-EA2 (HW: C2)
      drm/panel-edp: Add INX N116BGE-EA2 (HW: C4)

Shikang Fan (1):
      drm/amdgpu: fix for suspend/resume kiq fence fallback under sriov

Simon Ser (3):
      drm: document uAPI page-flip flags
      Revert "drm: hide unregistered connectors from GETCONNECTOR IOCTL"
      drm/connector: send hotplug uevent on connector cleanup

Somalapuram Amaranath (1):
      drm/ttm: rework on ttm_resource to use size_t type

Stanley.Yang (1):
      drm/amdgpu: fix use-after-free during gpu recovery

Steve Su (1):
      drm/amd/display: Fix gpio port mapping issue

Stuart Summers (1):
      drm/i915/guc: Add GuC deprivilege feature to MTL

Stylon Wang (4):
      drm/amd/display: Fix access timeout to DPIA AUX at boot time
      drm/amd/display: Fix invalid DPIA AUX reply causing system hang
      drm/amd/display: Fix race condition in DPIA AUX transfer
      drm/amd/display: Create debugfs to tell if connector is DPIA link

Suraj Kandpal (1):
      drm/i915: Remove one use macro

T.J. Mercier (1):
      drm/etnaviv: Remove duplicate call to drm_gem_free_mmap_offset

Taimur Hassan (2):
      drm/amd/display: Remove rate check from pixel rate divider update
      drm/amd/display: Avoid setting pixel rate divider to N/A

Takashi Iwai (1):
      drm/radeon: Add HD-audio component notifier support (v6)

Tao Zhou (16):
      drm/amdgpu: add RAS page retirement functions for MCA
      drm/amdgpu: use page retirement API in MCA notifier
      drm/amdgpu: add RAS poison handling for MCA
      drm/amdgpu: remove ras_error_status parameter for UMC poison handler
      drm/amdgpu: remove the check of init status in psp_ras_initialize
      drm/amdgpu: enable RAS for VCN/JPEG v4.0
      drm/amdgpu: define common vcn_set_ras_funcs
      drm/amdgpu: define common jpeg_set_ras_funcs
      drm/amdgpu: add RAS query support for VCN 4.0
      drm/amdgpu: add RAS error query for JPEG 4.0
      drm/amdgpu: add irq source id definition for VCN/JPEG 4.0
      drm/amdgpu: add VCN 4.0 RAS poison consumption handling
      drm/amdgpu: add JPEG 4.0 RAS poison consumption handling
      drm/amdgpu: add register definition for VCN RAS initialization
      drm/amdgpu: enable RAS poison for VCN 2.6
      drm/amdgpu: enable VCN RAS poison for VCN v4.0

Tejas Upadhyay (1):
      drm/i915/ehl: Update MOCS table for EHL

Teresa Remmet (1):
      drm/bridge: tc358775: Do not soft reset i2c-slave controller

Thierry Reding (1):
      gpu: host1x: Staticize host1x_syncpt_fence_ops

Thomas Hellstr=C3=B6m (1):
      drm/i915: Fix display problems after resume

Thomas Zimmermann (77):
      drm/udl: Rename struct udl_drm_connector to struct udl_connector
      drm/udl: Test pixel limit in mode-config's mode-valid function
      drm/udl: Use USB timeout constant when reading EDID
      drm/udl: Various improvements to the connector
      drm/udl: Move connector to modesetting code
      drm/udl: Remove udl_simple_display_pipe_mode_valid()
      drm/udl: Convert to atomic-modesetting helpers
      drm/udl: Simplify modesetting in CRTC's enable function
      drm/udl: Support DRM hot-unplugging
      drm/udl: Use damage iterator
      drm/udl: Move register constants to udl_proto.h
      drm/udl: Add constants for display-mode registers
      drm/udl: Add register constants for color depth
      drm/udl: Add register constants for video locks
      drm/udl: Add register constants for framebuffer scanout addresses
      drm/udl: Add constants for commands
      drm/atomic-helper: Don't allocate new plane state in CRTC check
      drm/atomic-helper: Replace drm_atomic_helper_check_crtc_state()
      drm/ofdrm: Add ofdrm for Open Firmware framebuffers
      drm/ofdrm: Add CRTC state
      drm/ofdrm: Add per-model device function
      drm/ofdrm: Support color management
      drm/ofdrm: Support big-endian scanout buffers
      drm/ast: Acquire I/O-register lock in atomic_commit_tail function
      drm/ast: Call drm_atomic_helper_check_plane_state() unconditionally
      drm/ast: Do not call drm_atomic_add_affected_planes()
      drm/ast: Remove cursor double buffering
      drm/ast: Rename struct ast_cursor_plane to struct ast_plane
      drm/ast: Style cleanups in plane code
      drm/ast: Convert ast to SHMEM
      drm/ast: Avoid reprogramming primary-plane scanout address
      drm/ofdrm: Depend on CONFIG_MMU
      drm/ofdrm: Convert PCI IDs to CPU endianness for comparing
      drm/ofdrm: Cast error pointers to void __iomem *
      Merge drm/drm-next into drm-misc-next
      drm/komeda: Don't set struct drm_driver.lastclose
      drm/mcde: Don't set struct drm_driver.lastclose
      drm/vboxvideo: Don't set struct drm_driver.lastclose
      drm/amdgpu: Don't set struct drm_driver.output_poll_changed
      drm/imx/dcss: Don't set struct drm_driver.output_poll_changed
      drm/ingenic: Don't set struct drm_driver.output_poll_changed
      drm/logicvc: Don't set struct drm_driver.output_poll_changed
      drm/rockchip: Don't set struct drm_driver.output_poll_changed
      drm/panel-ili9341: Include <linux/backlight.h>
      drm/tve200: Include <linux/of.h>
      drm/fb-helper: Cleanup include statements in header file
      drm/fb_helper: Rename field fbdev to info in struct drm_fb_helper
      drm/fb-helper: Rename drm_fb_helper_alloc_fbi() to use _info postfix
      drm/fb-helper: Rename drm_fb_helper_unregister_fbi() to use _info pos=
tfix
      drm/fb-helper: Disconnect damage worker from update logic
      drm/fb-helper: Call fb_sync in I/O functions
      drm/fb-helper: Perform all fbdev I/O with the same implementation
      drm/fb_helper: Minimize damage-helper overhead
      drm/fb-helper: Always initialize generic fbdev emulation
      drm/fb-helper: Set flag in struct drm_fb_helper for leaking
physical addresses
      drm/fb-helper: Move generic fbdev emulation into separate source file
      drm/fb-helper: Remove unnecessary include statements
      drm/fb-helper: Clarify use of last_close and output_poll_changed
      drm/fbdev: Include <linux/vmalloc.h>
      drm/hisilicon/hibmc: Include <linux/io.h> for readl() and writel()
      drm/fb-helper: Document struct drm_fb_helper.hint_leak_smem_start
      drm/atomic-helper: Add {begin,end}_fb_access to plane helpers
      drm/gem: Implement shadow-plane {begin, end}_fb_access with vmap
      drm/fb-helper: Set damage-clip area in helper
      drm/fb-helper: Move dirty-fb update into helper function
      drm/fb-helper: Remove test for fb_dirty callback from deferred-I/O he=
lper
      drm/fb-helper: Perform damage handling in deferred-I/O helper
      drm/fb-helper: Schedule deferred-I/O worker after writing to framebuf=
fer
      drm/fb-helper: Remove damage worker
      drm: Move nomodeset kernel parameter to drivers/video
      fbdev: Add support for the nomodeset kernel parameter
      Merge drm/drm-next into drm-misc-next-fixes
      Merge drm/drm-next into drm-misc-next-fixes
      fbdev: Make fb_modesetting_disabled() static inline
      Revert "drm/fb-helper: Remove damage worker"
      Revert "drm/fb-helper: Schedule deferred-I/O worker after
writing to framebuffer"
      Revert "drm/fb-helper: Perform damage handling in deferred-I/O helper=
"

Tilak Tangudu (1):
      drm/i915/debugfs: Add perf_limit_reasons in debugfs

Tim Huang (11):
      drm/amd/pm: update SMU IP v13.0.4 driver interface version
      drm/amd/pm: add SMU IP v13.0.4 IF version define to V7
      drm/amd/pm: update SMU IP v13.0.4 msg interface header
      drm/amdgpu/discovery: add PSP IP v13.0.11 support
      drm/amdgpu/soc21: add mode2 asic reset for SMU IP v13.0.11
      drm/amdgpu/pm: use the specific mailbox registers only for SMU IP v13=
.0.4
      drm/amdgpu: enable PSP IP v13.0.11 support
      drm/amdgpu: enable GFX IP v11.0.4 CG support
      drm/amdgpu: enable GFX Power Gating for GC IP v11.0.4
      drm/amdgpu: enable GFX Clock Gating control for GC IP v11.0.4
      drm/amdgpu: add tmz support for GC IP v11.0.4

Tomas Winkler (5):
      mei: add support to GSC extended header
      mei: bus: enable sending gsc commands
      mei: adjust extended header kdocs
      mei: pxp: support matching with a gfx discrete card
      drm/i915/pxp: add huc authentication and loading command

Tong Liu01 (2):
      drm/amdgpu: add vram reservation based on vram_usagebyfirmware_v2_2
      drm/amdgpu: add drv_vram_usage_va for virt data exchange

Tsung-hua Lin (1):
      drm/amd/display: No display after resume from WB/CB

Tvrtko Ursulin (11):
      drm/i915: Make GEM resume all engines
      drm/i915: Make GEM suspend all GTs
      drm/i915: Handle all GTs on driver (un)load paths
      drm/i915/selftests: Remove flush_scheduled_work() from live_execlists
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915/guc: Fix revocation of non-persistent contexts
      drm/i915/selftests: Stop using kthread_stop()
      drm/i915: Partial abandonment of legacy DRM logging macros
      drm/i915: Simplify internal helper function signature
      drm/i915: Fix vma allocator debug
      drm/i915: Fix workarounds on Gen2-3

Umesh Nerlige Ramappa (17):
      drm/i915/perf: Fix OA filtering logic for GuC mode
      drm/i915/perf: Add 32-bit OAG and OAR formats for DG2
      drm/i915/perf: Fix noa wait predication for DG2
      drm/i915/perf: Determine gen12 oa ctx offset at runtime
      drm/i915/perf: Enable bytes per clock reporting in OA
      drm/i915/perf: Simply use stream->ctx
      drm/i915/perf: Move gt-specific data from i915->perf to gt->perf
      drm/i915/perf: Replace gt->perf.lock with stream->lock for file ops
      drm/i915/perf: Use gt-specific ggtt for OA and noa-wait buffers
      drm/i915/perf: Store a pointer to oa_format in oa_buffer
      drm/i915/perf: Add Wa_1508761755:dg2
      drm/i915/perf: Apply Wa_18013179988
      drm/i915/perf: Save/restore EU flex counters across reset
      drm/i915/perf: Enable OA for DG2
      drm/i915/perf: Fix kernel-doc warning
      i915/uncore: Acquire fw before loop in intel_uncore_read64_2x32
      drm/i915/selftest: Bump up sample period for busy stats selftest

Veerabadhran Gopalakrishnan (1):
      amdgpu/nv.c: Corrected typo in the video capabilities resolution

Victor Zhao (4):
      Revert "drm/amdgpu: add debugfs amdgpu_reset_level"
      Revert "drm/amdgpu: let mode2 reset fallback to default when failure"
      drm/amdgpu: Refactor mode2 reset logic for v11.0.7
      drm/amdgpu: fix for suspend/resume sequence under sriov

Ville Syrj=C3=A4l=C3=A4 (143):
      drm/i915: WARN if a port should use VBT provided vswing tables
      drm/i915/fbc: Move flip_pending assignmnt
      drm/i915/fbc: Use lockdep_assert_held()
      drm/i915: Nuke stale plane cdclk ratio FIXMEs
      drm/i915/fbc: Remove stale FIXME
      drm/i915: Drop pointless middle man variable
      drm/i915: Clean up transcoder_to_stream_enc_status()
      drm/i915: Drop pointless 'budget' variable
      drm/i915: Use BIT() when dealing with output types
      drm/i915: Pass intel_encoder to to_lvds_encoder()
      drm/i915: Extract intel_edp_backlight_setup()
      drm/i915: Extract intel_tv_add_properties()
      drm/i915: Extract intel_dp_mst_add_properties()
      drm/i915: Extract intel_lvds_add_properties()
      drm/i915: Move eDP scaling_mode prop setup to the proper place
      drm/i915: Extract intel_attach_scaling_mode_property()
      drm/i915: Clean up connector->*_allowed setup
      drm/i915: Don't init eDP if we can't find a fixed mode
      drm/i915: Split g4x_compute_pipe_wm() into two
      drm/i915: Split vlv_compute_pipe_wm() into two
      drm/i915: Simplify up g4x watermark sanitation
      drm/i915: Simplify up vlv watermark sanitation
      drm/i915: Add missing invalidate to g4x wm readout
      drm/i915: Force DPLL calculation for TC ports after readout
      drm/i915: Don't bail early from intel_dp_initial_fastset_check()
      drm/i915: Pimp DPLL ref/unref debugs
      drm/i915: WARN if PLL ref/unref got messed up
      drm/i915: Always initialize dpll.lock
      drm/i915: Nuke intel_get_shared_dpll_id()
      drm/i915: Round to closest in g4x+ HDMI clock readout
      drm/i915: Simplify intel_panel_add_edid_alt_fixed_modes()
      drm/i915: Allow alternate fixed modes always for eDP
      drm/i915: Allow alternate fixed modes always for LVDS
      drm/i915: Remove PLL asserts from .load_luts()
      drm/i915: Split up intel_color_init()
      drm/i915: Simplify the intel_color_init_hooks() if ladder
      drm/i915: Clean up intel_color_init_hooks()
      drm/i915: Change glk_load_degamma_lut() calling convention
      drm/i915: Add some debug prints for intel_modeset_all_pipes()
      drm/i915: Fix watermark calculations for gen12+ RC CCS modifier
      drm/i915: Fix watermark calculations for gen12+ MC CCS modifier
      drm/i915: Fix watermark calculations for gen12+ CCS+CC modifier
      drm/i915: Fix watermark calculations for DG2 CCS modifiers
      drm/i915: Fix watermark calculations for DG2 CCS+CC modifier
      drm/i915: Simplify modifier lookup in watermark code
      drm/i915: Reject excessive dotclocks early
      drm/i915: Move DRRS debugfs next to the implementation
      drm/i915: Make the DRRS debugfs contents more consistent
      drm/i915: Make DRRS debugfs per-crtc/connector
      drm/i915: Fix locking in DRRS debugfs
      drm/i915: Tighten DRRS capability reporting
      drm/i915: Setup final panel drrs_type already during init
      drm/edid: Clarify why we only accept the "range limits only" descript=
or
      drm/edid: Define more flags
      drm/edid: Only parse VRR range for continuous frequency displays
      drm/edid: Extract drm_gtf2_mode()
      drm/edid: Use GTF2 for inferred modes
      drm/edid: Use the correct formula for standard timings
      drm/edid: Unconfuse preferred timing stuff a bit
      drm/edid: Make version checks less convoluted
      drm/i915: Clean up some namespacing
      drm/i915: Fix g4x/vlv/chv CxSR vs. format/tiling/rotation changes
      drm/i915: Fix pipe gamma enable/disable vs. CxSR on gmch platforms
      drm/i915: Write watermarks for disabled pipes on gmch platforms
      drm/i915: Do the DRIVER_ATOMIC feature disable later
      drm/i915: Enable atomic by default on ctg/elk
      drm/i915: Extract intel_mmio_bar()
      drm/i915: Name our BARs based on the spec
      drm/i915: s/HAS_BAR2_SMEM_STOLEN/HAS_LMEMBAR_SMEM_STOLEN/
      drm/i915: Allow panel fixed modes to have differing sync polarities
      drm/i915: Activate DRRS after state readout
      drm/i915: Introduce intel_crtc_needs_fastset()
      drm/i915: Remove some local 'mode_changed' bools
      drm/i915: Don't flag both full modeset and fastset at the same time
      drm/i915: Introduce intel_crtc_needs_color_update()
      drm/i915: Make ilk_load_luts() deal with degamma
      drm/i915: Introduce crtc_state->{pre,post}_csc_lut
      drm/i915: Assert {pre,post}_csc_lut were assigned sensibly
      drm/i915: Get rid of glk_load_degamma_lut_linear()
      drm/i915: Stop loading linear degamma LUT on glk needlessly
      drm/i915/audio: s/dev_priv/i915/
      drm/i915/audio: Nuke leftover ROUNDING_FACTOR
      drm/i915/audio: Remove CL/BLC audio stuff
      drm/i915/audio: Extract struct ilk_audio_regs
      drm/i915/audio: Use REG_BIT() & co.
      drm/i915/audio: Unify register bit naming
      drm/i915/audio: Protect singleton register with a lock
      drm/i915/audio: Nuke intel_eld_uptodate()
      drm/i915/audio: Read ELD buffer size from hardware
      drm/i915/audio: Make sure we write the whole ELD buffer
      drm/i915/audio: Use u32* for ELD
      drm/i915/audio: Use intel_de_rmw() for most audio registers
      drm/i915/audio: Split "ELD valid" vs. audio PD on hsw+
      drm/i915/audio: Do the vblank waits
      drm/i915/sdvo: Extract intel_sdvo_has_audio()
      drm/i915/sdvo: Filter out invalid outputs more sensibly
      drm/i915/sdvo: Setup DDC fully before output init
      drm/i915/sdvo: Grab mode_config.mutex during LVDS init to avoid WARNs
      drm/i915/sdvo: Simplify output setup debugs
      drm/i915/sdvo: Don't add DDC modes for LVDS
      drm/i915/sdvo: Get rid of the output type<->device index stuff
      drm/i915/sdvo: Reduce copy-pasta in output setup
      drm/i915/sdvo: Fix debug print
      drm/i915: Fix cs timestamp frequency for ctg/elk/ilk
      drm/i915: Stop claiming cs timestamp frquency on gen2/3
      drm/i915: Fix cs timestamp frequency for cl/bw
      drm/i915/selftests: Run MI_BB perf selftests on SNB
      drm/i915/selftests: Test RING_TIMESTAMP on gen4/5
      drm/i915/selftests: Run the perf MI_BB tests on gen4/5
      drm/i915: Use sizeof(variable) instead sizeof(type)
      drm/i915: Use _MMIO_PIPE() for SKL_BOTTOM_COLOR
      drm/i915: s/dev_priv/i915/ in intel_color.c
      drm/i915: s/icl_load_gcmax/ivb_load_lut_max/
      drm/i915: Split ivb_load_lut_ext_max() into two parts
      drm/i915: Deconfuse the ilk+ 12.4 LUT entry functions
      drm/i915: Pass limited_range explicitly to ilk_csc_convert_ctm()
      drm/i915: Reuse ilk_gamma_mode() on ivb+
      drm/i915: Reject YCbCr output with degamma+gamma on pre-icl
      drm/i915: Share {csc,gamma}_enable calculation for ilk/snb vs. ivb+
      drm/i915: Use intel_crtc_needs_modeset() more
      drm/i915: Create resized LUTs for ivb+ split gamma mode
      drm/amdgpu: Use drm_mode_init() for on-stack modes
      drm/hisilicon: Use drm_mode_init() for on-stack modes
      drm/msm: Use drm_mode_init() for on-stack modes
      drm/msm: Use drm_mode_copy()
      drm/mtk: Use drm_mode_init() for on-stack modes
      drm/rockchip: Use drm_mode_copy()
      drm/sti: Use drm_mode_copy()
      drm/i915: Pass intel_plane to plane tracepoints
      drm/i915: Print plane name in fbc tracepoints
      drm/i915: Pass i915 to frontbuffer tracepoints
      drm/i915: Add device name to display tracepoints
      drm/i915: Clean up legacy palette defines
      drm/i915: Clean up 10bit precision palette defines
      drm/i915: Clean up 12.4bit precision palette defines
      drm/i915: Clean up chv CGM (de)gamma defines
      drm/i915: Reorder 12.4 lut udw vs. ldw functions
      drm/i915: Introduce g4x_hdmi_compute_config()
      drm/i915: Force RGB output for DVI sink
      drm/i915: Treat HDMI as DVI when cloning
      drm/i915/audio: Unify get_saved_enc()
      drm/i915/audio: Realign some function arguments
      drm/i915: Remove non-existent pipes from bigjoiner pipe mask

Vinay Belgaumkar (5):
      drm/i915: Add a wrapper for frequency debugfs
      drm/i915/slpc: Update the frequency debugfs
      drm/i915/slpc: Optmize waitboost for SLPC
      drm/i915/slpc: Use platform limits for min/max frequency
      drm/i915/guc: Support OA when Wa_16011777198 is enabled

Vinod Govindapillai (1):
      drm/i915: update DSC feature flag handling during device init

Vitaly Lubart (3):
      mei: bus: extend bus API to support command streamer API
      mei: pxp: add command streamer API to the PXP driver
      drm/i915/pxp: implement function for sending tee stream command

Wayne Boyer (1):
      drm/i915/dg2: Introduce Wa_18017747507

Wei Yongjun (3):
      drm/panel: db7430: Silent no spi_device_id warning
      drm/panel: tpg110: Silent no spi_device_id warning
      drm/panel: ws2401: Silent no spi_device_id warning

Wenjing Liu (4):
      drm/amd/display: refactor enable/disable audio stream hw sequence
      drm/amd/display: move stream encoder audio setup to link_hwss
      drm/amd/display: remove audio mute control in hpo dp
      drm/amd/display: Consider dp cable id only when data is non zero

Wesley Chalmers (2):
      drm/amd/display: Disable DRR actions during state commit
      drm/amd/display: Use the largest vready_offset in pipe group

Xia Fukun (1):
      drm/i915/bios: fix a memory leak in generate_lfp_data_ptrs

Xiaogang Chen (1):
      drm/amdkfd: Remove skiping userptr buffer mapping when mmu
notifier marks it as invalid

Xinlei Lee (1):
      drm/mediatek: Modify dpi power on/off sequence.

Xiongfeng Wang (2):
      drm/radeon: Fix PCI device refcount leak in radeon_atrm_get_bios()
      drm/amdgpu: Fix PCI device refcount leak in amdgpu_atrm_get_bios()

Yang Li (2):
      nouveau/dmem: Remove duplicated include in nouveau_dmem.c
      drm/amdkfd: Fix NULL pointer dereference in svm_migrate_to_ram()

Yang Wang (1):
      drm/amdgpu: fix mmhub register base coding error

Yang Yingliang (2):
      drm/amdgpu/si_dma: remove unused variable in si_dma_stop()
      drm/amdgpu: fix pci device refcount leak

YiPeng Chai (6):
      drm/amdgpu: Enable gmc soft reset on gmc_v11_0_3
      drm/amdgpu: Enable ras support for mp0 v13_0_0 and v13_0_10
      drm/amdgpu: Add sriov vf ras support in amdgpu_ras_asic_supported
      drm/amdgpu: Add umc channel index mapping table for umc_v8_10
      drm/amdgpu: Fixed the problem that ras error can't be queried
after gpu recovery is completed
      drm/amdgpu: Enable mode-1 reset for RAS recovery in fatal error mode

Yifan Zha (5):
      drm/amdgpu: Program GC registers through RLCG interface in gfx_v11/gm=
c_v11
      drm/amdgpu: Skip access GRBM_CNTL under SRIOV on gfx_v11
      drm/amdgpu: Skip access SDMA0_F32_CNTL in sdma_v6_0_enable under SRIO=
V
      drm/amdgpu: Skip program gfxhub_v3_0_3 system aperture registers
under SRIOV
      drm/amdgpu: Remove programming GCMC_VM_FB_LOCATION* on gfxhub_v3_0_3 =
in VF

Yifan Zhang (18):
      drm/amdgpu: add tmz support for GC 11.0.1
      drm/amdgpu: allow secure submission on gfx11 and sdma6
      drm/amdgpu: set fb_modifiers_not_supported in vkms
      drm/amdgpu: force read discovery file if set discovery=3D2
      drm/amdgpu/discovery: enable soc21 common for GC 11.0.4
      drm/amdgpu/discovery: enable gmc v11 for GC 11.0.4
      drm/amdgpu/discovery: enable gfx v11 for GC 11.0.4
      drm/amdgpu/discovery: enable mes support for GC v11.0.4
      drm/amdgpu: set GC 11.0.4 family
      drm/amdgpu/discovery: set the APU flag for GC 11.0.4
      drm/amdgpu: add gfx support for GC 11.0.4
      drm/amdgpu: add soc21 common ip block support for GC 11.0.4
      drm/amdgpu: add gmc v11 support for GC 11.0.4
      drm/amdkfd: add GC 11.0.4 KFD support
      drm/amdgpu/pm: enable swsmu for SMU IP v13.0.11
      drm/amdgpu: add smu 13 support for smu 13.0.11
      drm/amdgpu/pm: add GFXOFF control IP version check for SMU IP v13.0.1=
1
      drm/amdgpu/discovery: enable nbio support for NBIO v7.7.1

Yiqing Yao (3):
      drm/amdgpu: Adjust MES polling timeout for sriov
      drm/amdgpu: Clean up soc21 early init for SRIOV
      drm/amdgpu: Disable MCBP from soc21 for SRIOV

Yu Songping (1):
      swsmu/amdgpu_smu: Fix the wrong if-condition

YuBiao Wang (4):
      drm/amdgpu: dequeue mes scheduler during fini
      drm/amdgpu: skip mes self test for gc 11.0.3 in recover
      drm/amdgpu: Stop clearing kiq position during unload
      drm/amdgpu: Add nv mailbox irq in soc21

Yuan Can (2):
      drm/rockchip: use pm_runtime_resume_and_get() instead of
pm_runtime_get_sync()
      drm/ingenic: Fix missing platform_driver_unregister() call in
ingenic_drm_init()

Yushan Zhou (1):
      drm/amdgpu: remove redundant NULL check

Zack Rusin (12):
      drm: Remove drm_mode_config::fb_base
      drm/nouveau: Remove unused variable
      drm/vmwgfx: Write the driver id registers
      drm/vmwgfx: Do not allow invalid bpp's for dumb buffers
      drm/vmwgfx: Port the framebuffer code to drm fb helpers
      drm/vmwgfx: Remove explicit and broken vblank handling
      drm/vmwgfx: Add a mksstat counter for cotable resizes
      drm/vmwgfx: Optimize initial sizes of cotables
      drm/vmwgfx: Fix a sparse warning in kernel docs
      drm/nouveau: Remove unused variable
      drm/vmwgfx: Validate the box size for the snooped cursor
      drm/vmwgfx: Cleanup the cursor snooping code

Zeng Heng (1):
      drm/ttm: Remove unnecessary drm_mm_clean

Zhang Qilong (1):
      drm/rockchip: lvds: fix PM usage counter unbalance in poweron

Zhang Zekun (1):
      drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()

ZhenGuo Yin (2):
      drm/amd/pm: Init pm_attr_list when dpm is disabled
      drm/amdgpu: update documentation of parameter amdgpu_gtt_size

Zhi Wang (1):
      drm/i915/gvt: remove the vgpu->released and its sanity check

Zhongwei (1):
      drm/amd/display: correct DML calc error of UrgentLatency

Zhongwei Zhang (1):
      drm/amd/display: fix dpms_off issue when disabling bios mode

gehao (1):
      drm/amd/display: prevent memory leak

lyndonli (2):
      drm/amd/pm: update driver if header for smu_13_0_7
      drm/amdgpu: add the fan abnormal detection feature

ruanjinjie (5):
      drm/nouveau/disp: fix cast removes address space of expression warnin=
gs
      drm/amd/display: Make some symbols static
      drm/amd/display: make dcn32_mmhubbub_funcs static
      drm/amd/display: make dcn32_mpc_funcs static
      drm/tegra: Make gather_bo_ops static

wangjianli (5):
      gpu/drm: fix repeated words in comments
      gpu/drm: fix repeated words in comments
      amd/amdgpu: fix repeated words in comments
      drm/radeon: fix repeated words in comments
      drm/i915: fix repeated words in comments

xinlei lee (2):
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT81=
88
      drm/mediatek: Add mt8188 dpi compatibles and platform data

ye xingchen (1):
      drm/amdgpu: use sysfs_emit() to instead of scnprintf()

zhikzhai (1):
      drm/amd/display: skip commit minimal transition state

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |   75 +
 Documentation/accel/index.rst                      |   17 +
 Documentation/accel/introduction.rst               |  110 ++
 Documentation/admin-guide/devices.txt              |    5 +
 Documentation/admin-guide/kernel-parameters.txt    |   15 +-
 .../display/allwinner,sun6i-a31-mipi-dsi.yaml      |   30 +-
 .../bindings/display/bridge/renesas,dsi.yaml       |  182 +++
 .../bindings/display/mediatek/mediatek,dpi.yaml    |    1 +
 .../bindings/display/msm/dpu-common.yaml           |   52 +
 .../bindings/display/msm/dpu-msm8998.yaml          |  223 ---
 .../bindings/display/msm/dpu-qcm2290.yaml          |  222 ---
 .../bindings/display/msm/dpu-sc7180.yaml           |  235 ---
 .../bindings/display/msm/dpu-sc7280.yaml           |  239 ---
 .../bindings/display/msm/dpu-sdm845.yaml           |  217 ---
 .../bindings/display/msm/dsi-controller-main.yaml  |    5 +-
 .../bindings/display/msm/dsi-phy-14nm.yaml         |    1 +
 .../devicetree/bindings/display/msm/mdp5.txt       |   30 +-
 .../bindings/display/msm/mdss-common.yaml          |   83 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |  196 +++
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |   95 ++
 .../bindings/display/msm/qcom,msm8998-mdss.yaml    |  268 ++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |   84 ++
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |  198 +++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |   95 ++
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  304 ++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   98 ++
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  422 ++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |   90 ++
 .../bindings/display/msm/qcom,sdm845-mdss.yaml     |  270 ++++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |   94 ++
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |  182 +++
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |   92 ++
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |  330 ++++
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |   70 +
 .../bindings/display/panel/newvision,nv3051d.yaml  |   63 +
 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml   |   67 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 Documentation/driver-api/dma-buf.rst               |    6 +
 Documentation/fb/modedb.rst                        |    5 +
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |   23 +
 Documentation/gpu/amdgpu/driver-core.rst           |    4 +-
 Documentation/gpu/amdgpu/index.rst                 |    2 +-
 Documentation/gpu/drm-kms-helpers.rst              |    3 +
 Documentation/gpu/drm-usage-stats.rst              |    1 -
 Documentation/gpu/i915.rst                         |    2 +-
 Documentation/gpu/todo.rst                         |   11 -
 Documentation/subsystem-apis.rst                   |    1 +
 MAINTAINERS                                        |   21 +-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |   20 +
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   24 +
 drivers/Kconfig                                    |    2 +
 drivers/accel/Kconfig                              |   24 +
 drivers/accel/drm_accel.c                          |  323 ++++
 drivers/clk/bcm/clk-raspberrypi.c                  |   19 -
 drivers/dma-buf/dma-buf.c                          |  225 ++-
 drivers/dma-buf/heaps/cma_heap.c                   |    3 +
 drivers/dma-buf/heaps/system_heap.c                |    3 +
 drivers/dma-buf/udmabuf.c                          |    3 +
 drivers/firmware/raspberrypi.c                     |   38 +-
 drivers/gpu/drm/Kconfig                            |   63 +-
 drivers/gpu/drm/Makefile                           |  113 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   29 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    3 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |  110 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  197 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   39 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   54 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |  215 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    2 +-
 .../drm/amd/amdgpu/{amdgpu_mn.c =3D> amdgpu_hmm.c}   |  101 +-
 .../drm/amd/amdgpu/{amdgpu_mn.h =3D> amdgpu_hmm.h}   |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   56 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   86 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  136 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |  217 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.h         |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  514 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h       |  103 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   56 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  200 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   87 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   43 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   71 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    2 -
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |    7 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   16 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   16 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   17 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  330 +++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |    3 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c         |   15 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   19 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   13 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   79 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   13 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   81 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h             |    7 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   13 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |    2 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v4_0.h            |    1 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   28 +-
 drivers/gpu/drm/amd/amdgpu/psp_v10_0.c             |   27 -
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |   27 -
 drivers/gpu/drm/amd/amdgpu/psp_v11_0_8.c           |   27 -
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |   31 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   30 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |   27 -
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c              |   27 -
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   24 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |    2 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   24 +-
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |    2 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   57 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.h              |    4 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |   10 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |    4 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |    8 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   42 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  103 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h              |    6 +
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  377 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |   36 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c             |   29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   26 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h   |  291 ----
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   27 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  371 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    6 +-
 drivers/gpu/drm/amd/display/Kconfig                |    3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  437 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   24 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  157 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   12 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   80 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   53 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |    2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  265 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   12 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    4 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |   64 +
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |    6 +
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   50 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   16 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h        |    4 +-
 .../dc/clk_mgr/dcn30/dcn30_smu11_driver_if.h       |    1 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    4 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |    4 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |   23 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   71 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    1 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   39 +-
 .../dc/clk_mgr/dcn32/dcn32_smu13_driver_if.h       |    1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  688 ++++++---
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   12 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    1 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  233 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |   15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  256 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   16 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  106 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  185 ++-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   37 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   36 +-
 drivers/gpu/drm/amd/display/dc/dc_trace.h          |    2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    7 +
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |   14 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   11 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   81 +-
 .../drm/amd/display/dc/dce120/dce120_resource.c    |    3 +-
 .../gpu/drm/amd/display/dc/dce60/dce60_resource.c  |    3 +
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |    2 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |   34 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |   28 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   46 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |    5 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   44 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.h   |  363 +++--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   32 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  127 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.h  |    7 -
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   27 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.h  |    6 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |    7 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |   15 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.h  |    7 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    9 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   21 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    8 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   21 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   20 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c   |   13 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h   |    4 -
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |    9 -
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   46 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |    4 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |   29 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |    5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   45 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    9 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    6 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |    4 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |    3 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   10 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   19 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |   14 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |   10 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   22 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   65 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |    2 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |    8 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  112 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   17 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   17 +-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   15 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    5 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   20 +-
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |    7 +
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c   |   36 +
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h   |    2 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   22 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    2 -
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |   26 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |    5 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   59 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   16 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    7 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  165 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |    3 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   40 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   69 +
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   18 +
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    8 +-
 .../drm/amd/display/dc/dml/display_mode_enums.h    |   25 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |   13 +-
 drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h |   36 +-
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   66 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   16 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h       |   16 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    9 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    7 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    6 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    6 +
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |    5 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |   17 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.h |    2 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |   17 +-
 .../gpu/drm/amd/display/dc/link/link_dp_dpia_bw.c  |   28 +
 .../gpu/drm/amd/display/dc/link/link_dp_dpia_bw.h  |   69 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |   52 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.h    |    4 +
 .../gpu/drm/amd/display/dc/link/link_hwss_dpia.c   |    3 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |   25 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   55 +-
 .../drm/amd/display/modules/color/color_gamma.c    |    2 +-
 .../drm/amd/display/modules/freesync/freesync.c    |    8 +-
 .../drm/amd/display/modules/inc/mod_info_packet.h  |    3 +-
 .../amd/display/modules/info_packet/info_packet.c  |    6 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    9 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |    1 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |    1 +
 .../drm/amd/include/asic_reg/vcn/vcn_2_5_offset.h  |    3 +-
 .../drm/amd/include/asic_reg/vcn/vcn_2_5_sh_mask.h |   27 +
 drivers/gpu/drm/amd/include/atombios.h             |   34 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |   63 +-
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_4_0.h  |    3 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    3 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    6 +-
 drivers/gpu/drm/amd/include/yellow_carp_offset.h   |    1 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    5 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c    |    2 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    6 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    5 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |  117 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   28 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   34 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   92 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   17 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   18 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    3 +
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    2 -
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |   25 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   43 +-
 drivers/gpu/drm/arm/hdlcd_drv.h                    |    2 +
 drivers/gpu/drm/arm/malidp_crtc.c                  |    7 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   71 +-
 drivers/gpu/drm/arm/malidp_drv.h                   |    2 +
 drivers/gpu/drm/arm/malidp_hw.c                    |   10 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |    6 +-
 drivers/gpu/drm/arm/malidp_planes.c                |   32 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |    6 +-
 drivers/gpu/drm/armada/armada_gem.c                |    8 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    2 +-
 drivers/gpu/drm/ast/Kconfig                        |    4 +-
 drivers/gpu/drm/ast/ast_drv.c                      |    5 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   35 +-
 drivers/gpu/drm/ast/ast_main.c                     |    5 +-
 drivers/gpu/drm/ast/ast_mm.c                       |   14 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  499 +++---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |    3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   24 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   45 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  164 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |    9 +-
 drivers/gpu/drm/bridge/tc358762.c                  |    2 +-
 drivers/gpu/drm/bridge/tc358775.c                  |    2 +-
 drivers/gpu/drm/display/Makefile                   |   14 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |    2 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   94 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |    6 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_client.c                       |   10 +-
 drivers/gpu/drm/drm_client_modeset.c               |    4 +
 drivers/gpu/drm/drm_connector.c                    |    4 +
 drivers/gpu/drm/drm_crtc_helper.c                  |   27 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   15 +-
 drivers/gpu/drm/drm_debugfs.c                      |    8 +-
 drivers/gpu/drm/drm_drv.c                          |  101 +-
 drivers/gpu/drm/drm_edid.c                         |  704 +++++----
 drivers/gpu/drm/drm_edid_load.c                    |  112 +-
 drivers/gpu/drm/drm_fb_helper.c                    | 1076 +++++--------
 drivers/gpu/drm/drm_fbdev_generic.c                |  494 ++++++
 drivers/gpu/drm/drm_file.c                         |    2 +-
 drivers/gpu/drm/drm_format_helper.c                |   10 +
 drivers/gpu/drm/drm_fourcc.c                       |    8 +-
 drivers/gpu/drm/drm_gem.c                          |   24 +
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   66 +-
 drivers/gpu/drm/drm_gem_dma_helper.c               |    6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    7 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    9 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   18 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |    2 +-
 drivers/gpu/drm/drm_modes.c                        |  116 +-
 drivers/gpu/drm/drm_plane_helper.c                 |    4 +-
 drivers/gpu/drm/drm_prime.c                        |    8 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    3 +-
 drivers/gpu/drm/drm_rect.c                         |    2 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |   32 +-
 drivers/gpu/drm/drm_sysfs.c                        |   24 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h              |    3 +-
 drivers/gpu/drm/etnaviv/etnaviv_dump.c             |    7 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   19 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h              |    1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    6 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |   58 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |   23 +-
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c             |   31 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |   27 +-
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h              |    1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |    6 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    2 +-
 drivers/gpu/drm/gma500/framebuffer.c               |   12 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |    1 +
 drivers/gpu/drm/gud/gud_connector.c                |    2 +-
 drivers/gpu/drm/gud/gud_drv.c                      |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   17 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |    4 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |    2 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |    1 -
 drivers/gpu/drm/i915/Kconfig.profile               |   26 +-
 drivers/gpu/drm/i915/Makefile                      |   20 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    1 +
 drivers/gpu/drm/i915/display/g4x_dp.h              |    2 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   19 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    8 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   22 +-
 drivers/gpu/drm/i915/display/icl_dsi_regs.h        |    2 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    8 +
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   64 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |  682 +++++----
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |   89 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    1 +
 .../gpu/drm/i915/display/intel_backlight_regs.h    |    2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   12 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |    3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   92 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  946 +++++++-----
 drivers/gpu/drm/i915/display/intel_color.h         |    6 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |   19 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |   18 +
 drivers/gpu/drm/i915/display/intel_connector.h     |    3 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   11 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    8 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   12 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    9 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  137 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  197 ++-
 drivers/gpu/drm/i915/display/intel_display.h       |   46 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   26 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  311 +---
 drivers/gpu/drm/i915/display/intel_display_power.c |   45 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |   15 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   69 +-
 .../drm/i915/display/intel_display_power_well.c    |    3 +-
 .../drm/i915/display/intel_display_power_well.h    |    2 +-
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |   53 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |  206 ++-
 drivers/gpu/drm/i915/display/intel_display_types.h |   82 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |   33 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.h       |   10 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h  |  204 +++
 drivers/gpu/drm/i915/display/intel_dmc.c           |   26 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  111 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    1 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   21 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   47 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   43 +
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |   19 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |    2 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  126 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    3 -
 drivers/gpu/drm/i915/display/intel_dpt.c           |    1 +
 drivers/gpu/drm/i915/display/intel_drrs.c          |  113 +-
 drivers/gpu/drm/i915/display/intel_drrs.h          |    4 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |    1 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    4 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    7 +-
 drivers/gpu/drm/i915/display/intel_dvo_dev.h       |    8 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   13 +
 drivers/gpu/drm/i915/display/intel_fb.h            |    1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    1 -
 drivers/gpu/drm/i915/display/intel_fbc.c           |   35 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   14 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    1 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.h |    3 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    4 +-
 drivers/gpu/drm/i915/display/intel_global_state.c  |    4 +-
 drivers/gpu/drm/i915/display/intel_global_state.h  |    2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   22 +-
 drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |    2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   58 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    8 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  216 ++-
 drivers/gpu/drm/i915/display/intel_hotplug.h       |    3 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |   38 +
 drivers/gpu/drm/i915/display/intel_hti.h           |   18 +
 drivers/gpu/drm/i915/display/intel_hti_regs.h      |   16 +
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |   11 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |   48 +-
 .../{intel_tc_phy_regs.h =3D> intel_mg_phy_regs.h}   |    8 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   23 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    3 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    7 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |   31 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    1 +
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    1 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |   12 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   10 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   52 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  173 ++-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    1 +
 drivers/gpu/drm/i915/display/intel_snps_phy_regs.h |    2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |    1 +
 drivers/gpu/drm/i915/display/intel_sprite.h        |    9 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   78 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |    3 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   89 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    1 +
 drivers/gpu/drm/i915/display/intel_vga.c           |    1 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |    1 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |    2 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |    7 +
 drivers/gpu/drm/i915/display/skl_universal_plane.h |    1 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   26 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   23 +-
 drivers/gpu/drm/i915/display/vlv_dsi_regs.h        |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |   55 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   49 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   23 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   26 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   19 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    9 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |   35 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  263 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  125 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |   18 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    7 +-
 .../gpu/drm/i915/gem/selftests/huge_gem_object.c   |    2 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |  167 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |   22 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |    4 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |  134 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   95 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   12 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c |    8 +-
 drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.h |   14 +
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |   55 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h           |   12 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   92 +-
 drivers/gpu/drm/i915/gt/intel_context.h            |    8 +
 drivers/gpu/drm/i915/gt/intel_context_types.h      |    9 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |    6 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  124 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |   39 +
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |   28 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   18 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   20 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    4 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |    4 +
 drivers/gpu/drm/i915/gt/intel_gsc.c                |   23 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |  156 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |    1 +
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |   38 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |  104 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |  307 +++-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |   24 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   28 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |  284 ++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |  210 ++-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c           |   15 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h           |    7 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |  477 +++---
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   25 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   44 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    3 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  143 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |    2 +
 drivers/gpu/drm/i915/gt/intel_migrate.c            |    1 +
 drivers/gpu/drm/i915/gt/intel_mocs.c               |   12 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |   64 +-
 drivers/gpu/drm/i915/gt/intel_rc6.h                |   11 +-
 drivers/gpu/drm/i915/gt/intel_rc6_types.h          |   15 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |    4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |   20 +-
 drivers/gpu/drm/i915/gt/intel_reset.h              |    1 +
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    2 +
 drivers/gpu/drm/i915/gt/intel_rps.c                |  318 +++-
 drivers/gpu/drm/i915/gt/intel_rps.h                |    5 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    4 +-
 drivers/gpu/drm/i915/{ =3D> gt}/intel_wopcm.c        |   43 +-
 drivers/gpu/drm/i915/{ =3D> gt}/intel_wopcm.h        |    0
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  713 ++++++---
 drivers/gpu/drm/i915/gt/intel_workarounds_types.h  |   12 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |   22 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c       |    2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |   64 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   36 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |   86 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   33 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |    1 +
 drivers/gpu/drm/i915/gt/selftest_mocs.c            |    5 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |    6 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   20 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |  260 +++-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   28 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c            |   25 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h   |    1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |    9 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |    9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |   48 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   21 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |   82 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |  132 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c     |   61 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |   12 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |   50 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |  103 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |    3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  348 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |  316 +++-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |   31 +
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |   34 +
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h          |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   70 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |   14 +
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |    8 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |    6 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    1 +
 drivers/gpu/drm/i915/gvt/display.c                 |    2 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |    2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h                  |    2 +-
 drivers/gpu/drm/i915/gvt/firmware.c                |    2 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |    7 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |    2 -
 drivers/gpu/drm/i915/gvt/handlers.c                |    5 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |    4 -
 drivers/gpu/drm/i915/gvt/mmio.c                    |    1 +
 drivers/gpu/drm/i915/gvt/mmio_context.c            |   15 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |    2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    5 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                    |    6 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   34 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   67 +-
 drivers/gpu/drm/i915/i915_gem.c                    |   57 +-
 drivers/gpu/drm/i915/i915_getparam.c               |    5 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   13 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |  732 +++++++++
 drivers/gpu/drm/i915/i915_hwmon.h                  |   20 +
 drivers/gpu/drm/i915/i915_irq.c                    |  293 ++--
 drivers/gpu/drm/i915/i915_irq.h                    |    9 -
 drivers/gpu/drm/i915/i915_pci.c                    |   13 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  601 ++++++--
 drivers/gpu/drm/i915/i915_perf.h                   |    2 +
 drivers/gpu/drm/i915/i915_perf_oa_regs.h           |    6 +-
 drivers/gpu/drm/i915/i915_perf_types.h             |   47 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |    9 +-
 drivers/gpu/drm/i915/i915_query.c                  |   12 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  354 +----
 drivers/gpu/drm/i915/i915_reg_defs.h               |   57 +-
 drivers/gpu/drm/i915/i915_request.c                |   24 +
 drivers/gpu/drm/i915/i915_request.h                |    5 +
 drivers/gpu/drm/i915/i915_scatterlist.c            |    4 +-
 drivers/gpu/drm/i915/i915_selftest.h               |    2 +
 drivers/gpu/drm/i915/i915_sw_fence.c               |    1 -
 drivers/gpu/drm/i915/i915_sw_fence.h               |    1 -
 drivers/gpu/drm/i915/i915_sysfs.c                  |    3 +-
 drivers/gpu/drm/i915/i915_trace.h                  |   16 -
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |   12 +-
 drivers/gpu/drm/i915/i915_vma.c                    |   30 +-
 drivers/gpu/drm/i915/i915_vma.h                    |    1 +
 drivers/gpu/drm/i915/intel_device_info.c           |   85 +-
 drivers/gpu/drm/i915/intel_device_info.h           |   20 +-
 drivers/gpu/drm/i915/intel_dram.c                  |    3 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    3 +-
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |   21 +
 drivers/gpu/drm/i915/intel_pci_config.h            |   28 +-
 drivers/gpu/drm/i915/intel_pm.c                    |  472 +++---
 drivers/gpu/drm/i915/intel_region_ttm.c            |    2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    5 +
 drivers/gpu/drm/i915/intel_runtime_pm.h            |   22 +
 drivers/gpu/drm/i915/intel_step.c                  |   32 +
 drivers/gpu/drm/i915/intel_step.h                  |   28 +-
 drivers/gpu/drm/i915/intel_uncore.c                |  302 +++-
 drivers/gpu/drm/i915/intel_uncore.h                |   54 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |   32 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |   32 -
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h  |   28 +
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h  |   26 +
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h |   35 +
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |   70 +
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h           |   13 +
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h           |    8 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    9 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h       |   11 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |  154 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h           |    5 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h |   36 -
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    6 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |   15 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c         |   16 +-
 drivers/gpu/drm/i915/selftests/i915_request.c      |  266 ++--
 drivers/gpu/drm/i915/selftests/igt_spinner.c       |   20 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    4 +
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    1 -
 drivers/gpu/drm/i915/selftests/mock_region.c       |    2 +-
 drivers/gpu/drm/i915/vlv_sideband.c                |    2 +
 drivers/gpu/drm/i915/vlv_suspend.c                 |   28 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    3 +-
 drivers/gpu/drm/imx/imx-drm-core.c                 |    2 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |    2 +-
 drivers/gpu/drm/imx/imx-tve.c                      |    1 -
 drivers/gpu/drm/imx/parallel-display.c             |    2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    9 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    2 +-
 drivers/gpu/drm/kmb/kmb_plane.c                    |    1 -
 drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c              |    2 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c             |    2 -
 drivers/gpu/drm/mcde/mcde_drv.c                    |    3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   57 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   29 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   10 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |   74 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h           |    8 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |    9 +-
 drivers/gpu/drm/meson/meson_drv.c                  |    2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |    7 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    1 +
 drivers/gpu/drm/mgag200/mgag200_drv.h              |    1 -
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |    3 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   11 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |    2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |    5 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   29 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  117 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   29 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    9 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  104 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   27 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   14 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |   21 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    7 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  121 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   17 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  352 ++---
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |    3 -
 drivers/gpu/drm/msm/msm_drv.c                      |   29 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    8 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |    6 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |    2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |    3 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   31 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   22 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |   20 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   85 +-
 drivers/gpu/drm/msm/msm_mmu.h                      |    3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   28 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    2 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |  269 +++-
 drivers/gpu/drm/mxsfb/lcdif_regs.h                 |   42 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    2 +-
 drivers/gpu/drm/nouveau/Kbuild                     |    4 -
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |   43 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c            |   15 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h            |    7 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  406 ++---
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   25 +-
 drivers/gpu/drm/nouveau/include/nvfw/acr.h         |   85 ++
 drivers/gpu/drm/nouveau/include/nvfw/hs.h          |   28 +
 drivers/gpu/drm/nouveau/include/nvfw/ls.h          |   51 +
 drivers/gpu/drm/nouveau/include/nvfw/sec2.h        |   45 +
 drivers/gpu/drm/nouveau/include/nvif/cl0046.h      |   23 -
 drivers/gpu/drm/nouveau/include/nvif/cl006b.h      |   12 -
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h      |    4 +-
 drivers/gpu/drm/nouveau/include/nvif/cl506e.h      |   13 -
 drivers/gpu/drm/nouveau/include/nvif/cl506f.h      |   14 -
 drivers/gpu/drm/nouveau/include/nvif/cl5070.h      |   92 --
 drivers/gpu/drm/nouveau/include/nvif/cl826e.h      |   15 -
 drivers/gpu/drm/nouveau/include/nvif/cl826f.h      |   16 -
 drivers/gpu/drm/nouveau/include/nvif/cl906f.h      |   16 -
 drivers/gpu/drm/nouveau/include/nvif/cla06f.h      |   18 -
 drivers/gpu/drm/nouveau/include/nvif/class.h       |   45 +-
 drivers/gpu/drm/nouveau/include/nvif/clb069.h      |    5 +-
 drivers/gpu/drm/nouveau/include/nvif/clc36f.h      |   19 -
 drivers/gpu/drm/nouveau/include/nvif/conn.h        |   10 +
 drivers/gpu/drm/nouveau/include/nvif/disp.h        |    1 +
 drivers/gpu/drm/nouveau/include/nvif/event.h       |   91 +-
 drivers/gpu/drm/nouveau/include/nvif/head.h        |   23 +
 drivers/gpu/drm/nouveau/include/nvif/if0004.h      |    5 +-
 drivers/gpu/drm/nouveau/include/nvif/if000e.h      |   26 +
 drivers/gpu/drm/nouveau/include/nvif/if0010.h      |    1 +
 drivers/gpu/drm/nouveau/include/nvif/if0011.h      |   11 +
 drivers/gpu/drm/nouveau/include/nvif/if0012.h      |   98 ++
 drivers/gpu/drm/nouveau/include/nvif/if0013.h      |   35 +
 drivers/gpu/drm/nouveau/include/nvif/if0020.h      |   45 +
 drivers/gpu/drm/nouveau/include/nvif/if0021.h      |   16 +
 drivers/gpu/drm/nouveau/include/nvif/ioctl.h       |   51 +-
 drivers/gpu/drm/nouveau/include/nvif/notify.h      |   35 -
 drivers/gpu/drm/nouveau/include/nvif/outp.h        |   19 +
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h |   15 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |   12 +
 drivers/gpu/drm/nouveau/include/nvkm/core/engine.h |    8 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/event.h  |   64 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h |  167 +-
 .../gpu/drm/nouveau/include/nvkm/core/firmware.h   |   25 +
 drivers/gpu/drm/nouveau/include/nvkm/core/intr.h   |   73 +
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h |    5 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/memory.h |    2 +
 drivers/gpu/drm/nouveau/include/nvkm/core/notify.h |   39 -
 drivers/gpu/drm/nouveau/include/nvkm/core/object.h |    2 +
 drivers/gpu/drm/nouveau/include/nvkm/core/os.h     |   20 +
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |   42 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |    1 -
 drivers/gpu/drm/nouveau/include/nvkm/engine/ce.h   |    2 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h |    9 +-
 .../gpu/drm/nouveau/include/nvkm/engine/falcon.h   |   66 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |   86 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   |    1 +
 .../gpu/drm/nouveau/include/nvkm/engine/nvdec.h    |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/sec2.h |    5 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/acr.h  |   29 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/fault.h    |    7 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |    7 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gpio.h |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |    3 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h  |   19 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/instmem.h  |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h  |   16 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mc.h   |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h  |    2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/top.h  |    1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/vfn.h  |   23 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   27 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |    6 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    7 +-
 drivers/gpu/drm/nouveau/nouveau_bo0039.c           |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c           |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c           |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c           |    4 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |  306 ++--
 drivers/gpu/drm/nouveau/nouveau_chan.h             |   14 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   81 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |    9 +-
 drivers/gpu/drm/nouveau/nouveau_crtc.h             |    7 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |   86 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c              |    8 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    1 -
 drivers/gpu/drm/nouveau/nouveau_dp.c               |   40 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   57 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   18 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |    5 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |   27 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.h            |   82 -
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   53 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |    4 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |    5 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |    4 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c             |   17 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |   50 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_usif.c             |    6 -
 drivers/gpu/drm/nouveau/nouveau_vga.c              |    1 -
 drivers/gpu/drm/nouveau/nv04_fbcon.c               |  257 ----
 drivers/gpu/drm/nouveau/nv50_fbcon.c               |  299 ----
 drivers/gpu/drm/nouveau/nv84_fence.c               |   24 +-
 drivers/gpu/drm/nouveau/nvc0_fbcon.c               |  297 ----
 drivers/gpu/drm/nouveau/nvif/Kbuild                |    3 +-
 drivers/gpu/drm/nouveau/nvif/conn.c                |   19 +
 drivers/gpu/drm/nouveau/nvif/disp.c                |    5 +-
 drivers/gpu/drm/nouveau/nvif/event.c               |   81 +
 drivers/gpu/drm/nouveau/nvif/head.c                |   58 +
 drivers/gpu/drm/nouveau/nvif/notify.c              |  210 ---
 drivers/gpu/drm/nouveau/nvif/outp.c                |  178 ++-
 drivers/gpu/drm/nouveau/nvif/user.c                |    4 +-
 drivers/gpu/drm/nouveau/nvkm/core/Kbuild           |    3 +-
 drivers/gpu/drm/nouveau/nvkm/core/client.c         |  130 +-
 drivers/gpu/drm/nouveau/nvkm/core/engine.c         |   85 +-
 drivers/gpu/drm/nouveau/nvkm/core/event.c          |  158 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c       |  127 ++
 drivers/gpu/drm/nouveau/nvkm/core/intr.c           |  442 ++++++
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |  115 +-
 drivers/gpu/drm/nouveau/nvkm/core/notify.c         |  163 --
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c         |   20 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c         |  117 +-
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c         |  157 ++
 drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild      |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c     |   82 +
 .../nvkm/engine/{fifo/usertu102.c =3D> ce/ga102.c}   |   35 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c     |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/cipher/g84.c   |   11 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  104 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c   |    7 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   40 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |   93 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c    |   39 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h    |    3 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |  283 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h      |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c     |   91 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c   |   93 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c   |   85 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c   |   13 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c   |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c   |   89 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |   95 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.c    |   38 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h    |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |   23 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c    |   12 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h    |   16 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h    |    5 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c    |  250 ---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   |   75 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c   |   25 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c   |  127 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   |  250 +++
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c       |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |   30 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |  448 +++---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c    |  252 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.h    |   76 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |  633 ++++----
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h    |   99 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c |  263 ----
 .../gpu/drm/nouveau/nvkm/engine/fifo/changf100.h   |   29 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/changk104.h   |   52 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/channv04.h    |   29 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/channv50.c    |  276 ----
 .../gpu/drm/nouveau/nvkm/engine/fifo/channv50.h    |   53 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.c    |  111 ++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.h    |   25 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv04.c |  226 ---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv10.c |   97 --
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv17.c |   98 --
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c |  254 ----
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/g84.c     |  253 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/g98.c     |   70 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c   |  550 +++++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c   |  292 +---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c   |  942 +++++++-----
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.h   |   38 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c   | 1592 ++++++++--------=
----
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h   |  168 ---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk110.c   |  105 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk208.c   |   59 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk20a.c   |   33 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm107.c   |  109 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm200.c   |   49 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm20b.c   |   45 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp100.c   |   99 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp10b.c   |   46 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifog84.c   |   95 --
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c |  308 ----
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogk104.c |  361 -----
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogv100.c |  241 ---
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifonv50.c  |   93 --
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifotu102.c |   81 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c   |  252 +++-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c    |  344 +++--
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.h    |   23 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv10.c    |   94 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv17.c    |  103 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c    |  198 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c    |  381 ++++-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.h    |   20 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h    |  223 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c    |  430 ++++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h    |  125 ++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runq.c    |   45 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runq.h    |   31 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c   |  471 ++----
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c   |  125 ++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |  409 +++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/user.h    |    8 -
 drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild      |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c      |   12 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxga102.c  |   77 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.c  |  224 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf100.h  |   77 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf104.c  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf108.c  |   21 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf110.c  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c  |   24 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf119.c  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk104.c  |   40 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110.c  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk110b.c |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk208.c  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgk20a.c  |   12 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c  |   71 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm200.c  |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm20b.c  |   12 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp100.c  |   80 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp102.c  |   60 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp104.c  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgp107.c  |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgv100.c  |   62 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxtu102.c  |   35 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c     |  347 +++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |  488 ++++--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h     |   80 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf104.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf110.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf117.c     |    7 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf119.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk104.c     |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk110b.c    |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk208.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c     |  119 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.c     |    7 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm20b.c     |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c     |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp102.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp104.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp107.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp108.c     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c     |  203 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c      |   10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c      |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c      |   10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h      |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c     |   47 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild   |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c  |   61 +
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c  |   19 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c  |   11 -
 drivers/gpu/drm/nouveau/nvkm/engine/sec/g98.c      |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/Kbuild    |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c    |   98 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.c   |  197 +++
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/gp102.c   |  116 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h    |    9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c   |   26 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c      |   24 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h      |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c     |   20 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c      |   24 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.h      |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nvsw.c      |   35 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild         |    6 +
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c         |  245 ++-
 drivers/gpu/drm/nouveau/nvkm/falcon/cmdq.c         |    2 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c           |  354 +++++
 drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c        |   62 +
 drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c        |  148 ++
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c        |  345 +++++
 drivers/gpu/drm/nouveau/nvkm/falcon/gp102.c        |   82 +
 drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c         |   10 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/priv.h         |    8 +
 drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.h         |    9 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/v1.c           |  210 ---
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c            |   41 +
 drivers/gpu/drm/nouveau/nvkm/nvfw/hs.c             |   39 +
 drivers/gpu/drm/nouveau/nvkm/nvfw/ls.c             |   72 +
 drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild         |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/Kbuild     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c     |  152 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga100.c    |   49 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c    |  326 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c    |  199 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm20b.c    |   44 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c    |   31 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp108.c    |   55 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp10b.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gv100.c    |   67 +
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c     |  177 ---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c     |  145 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/priv.h     |  104 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c    |   38 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gm200.c    |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c   |   21 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp100.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c  |   41 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/priv.h   |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c  |  120 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c   |   30 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c      |   61 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c     |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c     |   35 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c     |   25 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.h     |    4 -
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm200.c     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm20b.c     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp100.c     |   18 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c     |   66 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp10b.c     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c     |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c      |   49 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.h      |    2 -
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c       |    8 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c    |   27 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c    |   59 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c    |   31 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |    6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c     |   27 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c |   12 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |   27 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/base.c     |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c    |   57 +
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gf100.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gk104.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm107.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gm200.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp100.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/priv.h     |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/Kbuild      |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c      |  130 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/g84.c       |   35 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/g98.c       |   35 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c     |   50 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gf100.c     |   82 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk104.c     |   38 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gk20a.c     |    9 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp100.c     |  126 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gp10b.c     |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/gt215.c     |   63 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv04.c      |   93 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv11.c      |   21 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv17.c      |   23 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv44.c      |    7 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/nv50.c      |   29 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h      |   50 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c     |  136 --
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c     |   44 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c     |   50 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c    |    1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm200.c    |   40 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c    |   56 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c    |   32 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c    |   15 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c    |   33 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/priv.h     |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/base.c     |   13 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/priv.h     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild     |    6 +
 .../{engine/disp/rootnv04.c =3D> subdev/vfn/base.c}  |   58 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c    |   47 +
 .../fifo/usergv100.c =3D> subdev/vfn/gv100.c}        |   27 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h     |   25 +
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c    |  108 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c     |   67 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |    8 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |    6 +-
 drivers/gpu/drm/panel/Kconfig                      |   19 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-edp.c                  |    2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    3 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |  473 ++++++
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |  504 +++++++
 drivers/gpu/drm/panel/panel-samsung-db7430.c       |    7 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |   70 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |    7 +
 drivers/gpu/drm/panel/panel-widechips-ws2401.c     |    7 +
 drivers/gpu/drm/panfrost/panfrost_dump.c           |    4 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |    6 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |    2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |    2 -
 drivers/gpu/drm/qxl/qxl_drv.c                      |    1 +
 drivers/gpu/drm/qxl/qxl_drv.h                      |    1 -
 drivers/gpu/drm/qxl/qxl_object.c                   |   17 +-
 drivers/gpu/drm/qxl/qxl_prime.c                    |    4 +-
 drivers/gpu/drm/radeon/Kconfig                     |   30 +
 drivers/gpu/drm/radeon/atombios.h                  |    2 +-
 drivers/gpu/drm/radeon/radeon.h                    |    8 +
 drivers/gpu/drm/radeon/radeon_atombios.c           |    7 +-
 drivers/gpu/drm/radeon/radeon_audio.c              |  117 ++
 drivers/gpu/drm/radeon/radeon_bios.c               |   19 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |    7 +-
 drivers/gpu/drm/radeon/radeon_device.c             |    6 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    2 -
 drivers/gpu/drm/radeon/radeon_fb.c                 |    8 +-
 drivers/gpu/drm/radeon/radeon_object.c             |    4 +-
 drivers/gpu/drm/radeon/radeon_trace.h              |    2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |    8 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |   10 +-
 drivers/gpu/drm/rcar-du/Makefile                   |    2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |    2 +-
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c           |  816 ++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h      |  151 ++
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    8 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |   45 -
 drivers/gpu/drm/rockchip/rockchip_drm_fb.h         |    6 -
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   10 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |  216 +--
 drivers/gpu/drm/scheduler/sched_main.c             |  229 +--
 drivers/gpu/drm/solomon/ssd130x.c                  |   37 +-
 drivers/gpu/drm/sti/sti_drv.c                      |    2 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |    2 +-
 drivers/gpu/drm/sti/sti_hda.c                      |    2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |    2 +-
 drivers/gpu/drm/stm/drv.c                          |    2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    2 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   61 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h             |    7 +
 drivers/gpu/drm/tegra/Makefile                     |    3 +-
 drivers/gpu/drm/tegra/dc.c                         |    4 +-
 drivers/gpu/drm/tegra/drm.c                        |    1 +
 drivers/gpu/drm/tegra/fb.c                         |    9 +-
 drivers/gpu/drm/tegra/gem.c                        |   19 +-
 drivers/gpu/drm/tegra/hdmi.c                       |    9 +-
 drivers/gpu/drm/tegra/nvdec.c                      |  171 ++-
 drivers/gpu/drm/tegra/output.c                     |   10 +-
 drivers/gpu/drm/tegra/riscv.c                      |  106 ++
 drivers/gpu/drm/tegra/riscv.h                      |   30 +
 drivers/gpu/drm/tegra/submit.c                     |   13 +-
 drivers/gpu/drm/tegra/uapi.c                       |    2 +-
 drivers/gpu/drm/tests/Makefile                     |   15 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |    6 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   98 ++
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |  445 ++++--
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |   71 +
 drivers/gpu/drm/tests/drm_kunit_helpers.h          |   11 +
 drivers/gpu/drm/tests/drm_mm_test.c                |    8 +-
 drivers/gpu/drm/tests/drm_plane_helper_test.c      |  467 +++---
 drivers/gpu/drm/tidss/tidss_drv.c                  |    2 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    2 +-
 drivers/gpu/drm/tiny/Kconfig                       |   13 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/arcpgu.c                      |    2 +-
 drivers/gpu/drm/tiny/bochs.c                       |    3 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    2 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |    2 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    2 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    2 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    2 +-
 drivers/gpu/drm/tiny/ofdrm.c                       | 1429 ++++++++++++++++=
++
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    2 +-
 drivers/gpu/drm/tiny/repaper.c                     |    2 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   18 +-
 drivers/gpu/drm/tiny/st7586.c                      |    2 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    3 -
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    6 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    4 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |   82 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |    3 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   14 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |    3 +-
 drivers/gpu/drm/udl/Makefile                       |    2 +-
 drivers/gpu/drm/udl/udl_connector.c                |  139 --
 drivers/gpu/drm/udl/udl_connector.h                |   15 -
 drivers/gpu/drm/udl/udl_drv.c                      |    2 +-
 drivers/gpu/drm/udl/udl_drv.h                      |   42 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |  566 ++++---
 drivers/gpu/drm/udl/udl_proto.h                    |   68 +
 drivers/gpu/drm/udl/udl_transfer.c                 |    7 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |    1 -
 drivers/gpu/drm/v3d/v3d_gem.c                      |   17 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |    6 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    4 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c              |    1 -
 drivers/gpu/drm/vc4/vc4_bo.c                       |    4 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |    2 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   16 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   41 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    8 -
 drivers/gpu/drm/vc4/vc4_hvs.c                      |   26 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |   13 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |    8 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    1 -
 drivers/gpu/drm/vkms/vkms_drv.c                    |    2 +-
 drivers/gpu/drm/vmwgfx/Kconfig                     |    7 -
 drivers/gpu/drm/vmwgfx/Makefile                    |    4 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c                |  123 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h                |   20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   22 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c         |   62 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |   31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  129 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   53 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |  831 ----------
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c            |  199 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h            |   83 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  669 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |    8 -
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h            |    2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |   59 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |    6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   31 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   26 -
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   14 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |   55 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h         |   26 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |    1 -
 drivers/gpu/drm/xlnx/Makefile                      |    2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |  646 ++------
 drivers/gpu/drm/xlnx/zynqmp_disp.h                 |   48 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  477 +++---
 drivers/gpu/drm/xlnx/zynqmp_dp.h                   |    4 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |  300 ++--
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |   46 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |  534 +++++++
 drivers/gpu/drm/xlnx/zynqmp_kms.h                  |   46 +
 drivers/gpu/host1x/context.c                       |    4 +
 drivers/gpu/host1x/debug.c                         |   28 +-
 drivers/gpu/host1x/dev.c                           |   12 +
 drivers/gpu/host1x/fence.c                         |    2 +-
 drivers/infiniband/core/umem_dmabuf.c              |    7 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   25 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |   22 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   20 +-
 .../media/platform/nvidia/tegra-vde/dmabuf-cache.c |    6 +-
 drivers/memory/tegra/mc.c                          |   25 +
 drivers/memory/tegra/tegra234.c                    |    5 +
 drivers/misc/fastrpc.c                             |    9 +-
 drivers/misc/mei/bus.c                             |  146 +-
 drivers/misc/mei/client.c                          |   55 +-
 drivers/misc/mei/hbm.c                             |   13 +
 drivers/misc/mei/hw-me.c                           |    7 +-
 drivers/misc/mei/hw.h                              |   89 +-
 drivers/misc/mei/interrupt.c                       |   47 +-
 drivers/misc/mei/mei_dev.h                         |    8 +
 drivers/misc/mei/pxp/mei_pxp.c                     |   38 +-
 drivers/staging/sm750fb/Kconfig                    |    1 +
 drivers/staging/sm750fb/sm750.c                    |    3 +
 drivers/video/Kconfig                              |    4 +
 drivers/video/Makefile                             |    1 +
 drivers/video/fbdev/Kconfig                        |   38 +
 drivers/video/fbdev/arkfb.c                        |    5 +
 drivers/video/fbdev/asiliantfb.c                   |    3 +
 drivers/video/fbdev/aty/aty128fb.c                 |    5 +
 drivers/video/fbdev/aty/atyfb_base.c               |    5 +
 drivers/video/fbdev/aty/radeon_base.c              |    5 +
 drivers/video/fbdev/carminefb.c                    |    3 +
 drivers/video/fbdev/chipsfb.c                      |    3 +
 drivers/video/fbdev/cirrusfb.c                     |    5 +
 drivers/video/fbdev/core/fbmem.c                   |   15 +
 drivers/video/fbdev/cyber2000fb.c                  |    6 +-
 drivers/video/fbdev/geode/Kconfig                  |    3 +
 drivers/video/fbdev/geode/gx1fb_core.c             |    5 +
 drivers/video/fbdev/geode/gxfb_core.c              |    5 +
 drivers/video/fbdev/geode/lxfb_core.c              |    5 +
 drivers/video/fbdev/gxt4500.c                      |    3 +
 drivers/video/fbdev/hyperv_fb.c                    |    4 +-
 drivers/video/fbdev/i740fb.c                       |    5 +
 drivers/video/fbdev/i810/i810_main.c               |    6 +
 drivers/video/fbdev/imsttfb.c                      |    5 +
 drivers/video/fbdev/intelfb/intelfbdrv.c           |    3 +
 drivers/video/fbdev/kyro/fbdev.c                   |    5 +
 drivers/video/fbdev/matrox/matroxfb_base.c         |    3 +
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |    3 +
 drivers/video/fbdev/neofb.c                        |    5 +
 drivers/video/fbdev/nvidia/nvidia.c                |    5 +
 drivers/video/fbdev/pm2fb.c                        |    5 +
 drivers/video/fbdev/pm3fb.c                        |    5 +
 drivers/video/fbdev/pvr2fb.c                       |    5 +
 drivers/video/fbdev/riva/fbdev.c                   |    5 +
 drivers/video/fbdev/s3fb.c                         |    5 +
 drivers/video/fbdev/savage/savagefb_driver.c       |    3 +
 drivers/video/fbdev/sis/sis_main.c                 |    5 +
 drivers/video/fbdev/skeletonfb.c                   |    5 +
 drivers/video/fbdev/sm712fb.c                      |    3 +
 drivers/video/fbdev/sstfb.c                        |    3 +
 drivers/video/fbdev/sunxvr2500.c                   |    3 +
 drivers/video/fbdev/sunxvr500.c                    |    3 +
 drivers/video/fbdev/tdfxfb.c                       |    5 +
 drivers/video/fbdev/tgafb.c                        |    5 +
 drivers/video/fbdev/tridentfb.c                    |    5 +
 drivers/video/fbdev/vermilion/vermilion.c          |    5 +
 drivers/video/fbdev/via/via-core.c                 |    3 +
 drivers/video/fbdev/vt8623fb.c                     |    5 +
 .../{gpu/drm/drm_nomodeset.c =3D> video/nomodeset.c} |   12 +-
 drivers/xen/gntdev-dmabuf.c                        |    8 +-
 include/drm/drm_accel.h                            |   97 ++
 include/drm/drm_atomic_helper.h                    |    3 +-
 include/drm/drm_atomic_state_helper.h              |    2 +-
 include/drm/drm_connector.h                        |   33 +-
 include/drm/drm_crtc_helper.h                      |    2 +
 include/drm/drm_device.h                           |    3 +
 include/drm/drm_drv.h                              |   16 +-
 include/drm/drm_edid.h                             |   24 +-
 include/drm/drm_fb_helper.h                        |   68 +-
 include/drm/drm_fbdev_generic.h                    |   15 +
 include/drm/drm_file.h                             |   21 +-
 include/drm/drm_gem.h                              |    3 +
 include/drm/drm_gem_atomic_helper.h                |   20 +-
 include/drm/drm_mode_config.h                      |    2 -
 include/drm/drm_modeset_helper_vtables.h           |   41 +-
 include/drm/drm_simple_kms_helper.h                |   20 +
 include/drm/gpu_scheduler.h                        |   51 +-
 include/drm/i915_pxp_tee_interface.h               |    5 +
 include/drm/ttm/ttm_resource.h                     |    4 +-
 include/drm/ttm/ttm_tt.h                           |    2 +-
 include/linux/dma-buf.h                            |   17 +-
 include/linux/fb.h                                 |    9 +
 include/linux/host1x.h                             |    2 +
 include/linux/mei_cl_bus.h                         |    6 +
 include/soc/bcm2835/raspberrypi-firmware.h         |   52 +
 include/soc/tegra/mc.h                             |   11 +
 include/uapi/drm/amdgpu_drm.h                      |   14 +
 include/uapi/drm/drm_fourcc.h                      |   29 +
 include/uapi/drm/drm_mode.h                        |   63 +-
 include/uapi/drm/i915_drm.h                        |   62 +-
 include/uapi/drm/msm_drm.h                         |    1 +
 include/video/nomodeset.h                          |    8 +
 1515 files changed, 50945 insertions(+), 30183 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 Documentation/accel/index.rst
 create mode 100644 Documentation/accel/introduction.rst
 create mode 100644
Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/mdss-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss=
.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
 create mode 100644 drivers/accel/Kconfig
 create mode 100644 drivers/accel/drm_accel.c
 rename drivers/gpu/drm/amd/amdgpu/{amdgpu_mn.c =3D> amdgpu_hmm.c} (71%)
 rename drivers/gpu/drm/amd/amdgpu/{amdgpu_mn.h =3D> amdgpu_hmm.h} (78%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h
 delete mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_diq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_dpia_bw.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_dpia_bw.h
 create mode 100644 drivers/gpu/drm/drm_fbdev_generic.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_reg_defs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hti.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hti.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hti_regs.h
 rename drivers/gpu/drm/i915/display/{intel_tc_phy_regs.h =3D>
intel_mg_phy_regs.h} (98%)
 rename drivers/gpu/drm/i915/{ =3D> gt}/intel_wopcm.c (87%)
 rename drivers/gpu/drm/i915/{ =3D> gt}/intel_wopcm.h (100%)
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
 delete mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl006b.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl506e.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl506f.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl5070.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl826e.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl826f.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl906f.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cla06f.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/clc36f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/head.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if000e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0013.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0020.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0021.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/notify.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/intr.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/notify.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/vfn.h
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_fbcon.h
 delete mode 100644 drivers/gpu/drm/nouveau/nv04_fbcon.c
 delete mode 100644 drivers/gpu/drm/nouveau/nv50_fbcon.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvc0_fbcon.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/event.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/head.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvif/notify.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/core/intr.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/core/notify.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/core/uevent.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
 rename drivers/gpu/drm/nouveau/nvkm/engine/{fifo/usertu102.c =3D>
ce/ga102.c} (63%)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/changf100.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/changk104.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv04.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv50.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv04.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv10.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv17.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/g98.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gm20b.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gp10b.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifog84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifonv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifotu102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runq.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runq.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/user.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/gp102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/gv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild
 rename drivers/gpu/drm/nouveau/nvkm/{engine/disp/rootnv04.c =3D>
subdev/vfn/base.c} (55%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c
 rename drivers/gpu/drm/nouveau/nvkm/{engine/fifo/usergv100.c =3D>
subdev/vfn/gv100.c} (63%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c
 create mode 100644 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
 create mode 100644 drivers/gpu/drm/tegra/riscv.c
 create mode 100644 drivers/gpu/drm/tegra/riscv.h
 create mode 100644 drivers/gpu/drm/tests/drm_client_modeset_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/tests/drm_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/tiny/ofdrm.c
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.c
 delete mode 100644 drivers/gpu/drm/udl/udl_connector.h
 create mode 100644 drivers/gpu/drm/udl/udl_proto.h
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.c
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_hashtab.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.h
 rename drivers/{gpu/drm/drm_nomodeset.c =3D> video/nomodeset.c} (63%)
 create mode 100644 include/drm/drm_accel.h
 create mode 100644 include/drm/drm_fbdev_generic.h
 create mode 100644 include/video/nomodeset.h
