Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5385887D8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FBC10F363;
	Wed,  3 Aug 2022 07:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C261113267
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 05:37:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ss3so29443954ejc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 22:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc;
 bh=HgNp0tDTO9DsjIbztSc1X+kWLn2iGTCpTE5GqaFE13c=;
 b=gaR3hLEGFDsDFEVMuix1qHl1Y+CdFUESsGMhNMcJg5Fj9S4EmJrqxj6YWBCs4j/5l1
 s0WKaBfxOQ+ZIZIxs7u6cQZi3VJbGcz+crsfusswkQDJNkcwyUMZDmSlAUtZwCxgE18p
 StCEQ2t78rA7a7s6rD4xRJSmmM1eNLSdNuc/h3RtYddRV2TKZK3xiRuWXG0G/0ck25Vy
 MM6zuQzhG2rtdmtxnQ7QG5/Mvak61fF2Ybsmnn/MgZyWA0pOtqHRA4zYmdHstAYRJ21S
 Y/34tavkXitgu94X0vO3eyc6o8DqPh3dmfuxPdzIObr4RY3VX6854+DOOYxhpzypm/6B
 wKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc;
 bh=HgNp0tDTO9DsjIbztSc1X+kWLn2iGTCpTE5GqaFE13c=;
 b=bDu+Eh7AcE/HsvWlpdFj42CfH4UBGweh/maWDdcEaEBxsbJjLhFZRP7QD3+5ARTLZT
 9XjZTAaAepQ2QgG55s5wZTkweKmia2/v+rpkOxC1TmfggsIDduavXK2GDyUtBFD/cP2b
 a3x6R89TrzxHye/7H02EqwEFFk0OEoCfVw1YatsmGqq4KKpGe1zyR/QNjjO0dB3ajteo
 5qiRgFaHGm/BoiKWvlHbBOaztZ2Nw13vZafWVmPvk42OZ22nuVjcG3RnCVFJmDVuB+7B
 1tHLoCcDTo3ZjtHvKtPAJ6w+Z5qangaex5I8oBWf1Ni+81Z2oIDOOD7+mZcPXyFxNxUw
 PkSA==
X-Gm-Message-State: ACgBeo0QbT8FjrbczbiJj7FIJsgAiXBgc82Y9CaN010YuFGLmk373K5P
 Pxdn0zXB38wjLZUb74vaMiP6GxtpchxkgWz6nj3IAbbShU0=
X-Google-Smtp-Source: AA6agR7g26vth9Ae4U1uTuxrGzTXwpN8MeGHYI7LB4KfQ9HSu3dYRkg9AClKz4tTV5p+b9Jm4qBBn256zIxSXXjGWso=
X-Received: by 2002:a17:907:6eac:b0:730:a07f:38bb with SMTP id
 sh44-20020a1709076eac00b00730a07f38bbmr5247880ejc.750.1659505076361; Tue, 02
 Aug 2022 22:37:56 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 3 Aug 2022 15:37:43 +1000
Message-ID: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
Subject: [git pull] drm for 5.20/6.0
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:28 +0000
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

This is the main drm pull request for 5.20/6.0.

This is a conflicty one. The late revert in 5.19 of the amdgpu buddy
allocator causes major conflict fallout. The buddy allocator code in
this one works, so the resolutions are usually just to take stuff from
this. It might actually be cleaner if you revert
925b6e59138cefa47275c67891c65d48d3266d57 (Revert "drm/amdgpu: add drm
buddy support to amdgpu") first in your tree then merge this.

If you don't decide to take that path I think I've got a fixed up
version that works here:
https://cgit.freedesktop.org/~airlied/linux/log/?h=3Ddrm-5.20-merged
Note however I merged twice so the "interesting" one is
https://cgit.freedesktop.org/~airlied/linux/commit/?h=3Ddrm-5.20-merged&id=
=3D9ccc631a19b89f5a945e0aa113b76f1072a6150e

There are some other conflicts in i915 and amdgpu, but they are more
run of the mill ones, I've got them all in the above anyways.

The aperture conflict code was made useful for others and there is one
vfio patch in here which should be all acked properly to use it.

Highlights:
New driver for logicvc - which is a display IP core.
EDID parser rework to add new extensions
fbcon scrolling improvements
i915 has some more DG2 work but not enabled by default, but should
have enough features for userspace to work now.

Otherwise it's lots of work all over the place.

Let me know if there any problems,
Thanks,
Dave.

drm-next-2022-08-03:
drm for 5.20/6.0

New driver:
- logicvc

vfio:
- use aperture API

core:
- of: Add data-lane helpers and convert drivers
- connector: Remove deprecated ida_simple_get()

media:
- Add various RGB666 and RGB888 format constants

panel:
- Add HannStar HSD101PWW
- Add ETML0700Y5DHA

dma-buf:
- add sync-file API
- set dma mask for udmabuf devices

fbcon:
- Improve scrolling performance
- Sanitize input

fbdev:
- device unregistering fixes
- vesa: Support COMPILE_TEST
- Disable firmware-device registration when first native driver loads

aperture:
- fix segfault during hot-unplug
- export for use with other subsystems

client:
- use driver validated modes

dp:
- aux: make probing more reliable
- mst: Read extended DPCD capabilities during system resume
- Support waiting for HDP signal
- Port-validation fixes

edid:
- CEA data-block iterators
- struct drm_edid introduction
- implement HF-EEODB extension

gem:
- don't use fb format non-existing planes

probe-helper:
- use 640x480 as displayport fallback

scheduler:
- don't kill jobs in interrupt context

bridge:
- Add support for i.MX8qxp and i.MX8qm
- lots of fixes/cleanups
- Add TI-DLPC3433
- fy07024di26a30d: Optional GPIO reset
- ldb: Add reg and reg-name properties to bindings, Kconfig fixes
- lt9611: Fix display sensing;
- tc358767: DSI/DPI refactoring and DSI-to-eDP support, DSI lane handling
- tc358775: Fix clock settings
- ti-sn65dsi83: Allow GPIO to sleep
- adv7511: I2C fixes
- anx7625: Fix error handling; DPI fixes; Implement HDP timeout via callbac=
k
- fsl-ldb: Drop DE flip
- ti-sn65dsi86: Convert to atomic modesetting

amdgpu:
- use atomic fence helpers in DM
- fix VRAM address calculations
- export CRTC bpc via debugfs
- Initial devcoredump support
- Enable high priority gfx queue on asics which support it
- Adjust GART size on newer APUs for S/G display
- Soft reset for GFX 11 / SDMA 6
- Add gfxoff status query for vangogh
- Fix timestamps for cursor only commits
- Adjust GART size on newer APUs for S/G display
- fix buddy memory corruption

amdkfd:
- MMU notifier fixes
- P2P DMA support using dma-buf
- Add available memory IOCTL
- HMM profiler support
- Simplify GPUVM validation
- Unified memory for CWSR save/restore area

i915:
- General driver clean-up
- DG2 enabling (still under force probe)
  - DG2 small BAR memory support
  - HuC loading support
  - DG2 workarounds
  - DG2/ATS-M device IDs added
- Ponte Vecchio prep work and new blitter engines
- add Meteorlake support
- Fix sparse warnings
- DMC MMIO range checks
- Audio related fixes
- Runtime PM fixes
- PSR fixes
- Media freq factor and per-gt enhancements
- DSI fixes for ICL+
- Disable DMC flip queue handlers
- ADL_P voltage swing updates
- Use more the VBT for panel information
- Fix on Type-C ports with TBT mode
- Improve fastset and allow seamless M/N changes
- Accept more fixed modes with VRR/DMRRS panels
- Disable connector polling for a headless SKU
- ADL-S display PLL w/a
- Enable THP on Icelake and beyond
- Fix i915_gem_object_ggtt_pin_ww regression on old platforms
- Expose per tile media freq factor in sysfs
- Fix dma_resv fence handling in multi-batch execbuf
- Improve on suspend / resume time with VT-d enabled
- export CRTC bpc settings via debugfs

msm:
- gpu: a619 support
- gpu: Fix for unclocked GMU register access
- gpu: Devcore dump enhancements
- client utilization via fdinfo support
- fix fence rollover issue
- gem: Lockdep false-positive warning fix
- gem: Switch to pfn mappings
- WB support on sc7180
- dp: dropped custom bulk clock implementation
- fix link retraining on resolution change
- hdmi: dropped obsolete GPIO support

tegra:
- context isolation for host1x engines
- tegra234 soc support

mediatek:
- add vdosys0/1 for mt8195
- add MT8195 dp_intf driver

exynos:
- Fix resume function issue of exynos decon driver by calling
  clk_disable_unprepare() properly if clk_prepare_enable() failed.

nouveau:
- set of misc fixes/cleanups
- display cleanups

gma500:
- Cleanup connector I2C handling

hyperv:
- Unify VRAM allocation of Gen1 and Gen2

meson:
- Support YUV422 output; Refcount fixes

mgag200:
- Support damage clipping
- Support gamma handling
- Protect concurrent HW access
- Fixes to connector
- Store model-specific limits in device-info structure
- fix PCI register init

panfrost:
- Valhall support

r128:
- Fix bit-shift overflow

rockchip:
- Locking fixes in error path

ssd130x:
- Fix built-in linkage

udl:
- Always advertize VGA connector

ast:
- Support multiple outputs
- fix black screen on resume

sun4i:
- HDMI PHY cleanups

vc4:
- Add support for BCM2711

vkms:
- Allocate output buffer with vmalloc()

mcde:
- Fix ref-count leak

mxsfb/lcdif:
- Support i.MX8MP LCD controller

stm/ltdc:
- Support dynamic Z order
- Support mirroring

ingenic:
- Fix display at maximum resolution
The following changes since commit 32346491ddf24599decca06190ebca03ff9de7f8=
:

  Linux 5.19-rc6 (2022-07-10 14:40:51 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-08-03

for you to fetch changes up to 5493ee1919eae4f49d62276cf5986b7f7c7aa8f6:

  Merge tag 'amd-drm-next-5.20-2022-07-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-08-03
14:00:19 +1000)

----------------------------------------------------------------
drm for 5.20/6.0

New driver:
- logicvc

vfio:
- use aperture API

core:
- of: Add data-lane helpers and convert drivers
- connector: Remove deprecated ida_simple_get()

media:
- Add various RGB666 and RGB888 format constants

panel:
- Add HannStar HSD101PWW
- Add ETML0700Y5DHA

dma-buf:
- add sync-file API
- set dma mask for udmabuf devices

fbcon:
- Improve scrolling performance
- Sanitize input

fbdev:
- device unregistering fixes
- vesa: Support COMPILE_TEST
- Disable firmware-device registration when first native driver loads

aperture:
- fix segfault during hot-unplug
- export for use with other subsystems

client:
- use driver validated modes

dp:
- aux: make probing more reliable
- mst: Read extended DPCD capabilities during system resume
- Support waiting for HDP signal
- Port-validation fixes

edid:
- CEA data-block iterators
- struct drm_edid introduction
- implement HF-EEODB extension

gem:
- don't use fb format non-existing planes

probe-helper:
- use 640x480 as displayport fallback

scheduler:
- don't kill jobs in interrupt context

bridge:
- Add support for i.MX8qxp and i.MX8qm
- lots of fixes/cleanups
- Add TI-DLPC3433
- fy07024di26a30d: Optional GPIO reset
- ldb: Add reg and reg-name properties to bindings, Kconfig fixes
- lt9611: Fix display sensing;
- tc358767: DSI/DPI refactoring and DSI-to-eDP support, DSI lane handling
- tc358775: Fix clock settings
- ti-sn65dsi83: Allow GPIO to sleep
- adv7511: I2C fixes
- anx7625: Fix error handling; DPI fixes; Implement HDP timeout via callbac=
k
- fsl-ldb: Drop DE flip
- ti-sn65dsi86: Convert to atomic modesetting

amdgpu:
- use atomic fence helpers in DM
- fix VRAM address calculations
- export CRTC bpc via debugfs
- Initial devcoredump support
- Enable high priority gfx queue on asics which support it
- Adjust GART size on newer APUs for S/G display
- Soft reset for GFX 11 / SDMA 6
- Add gfxoff status query for vangogh
- Fix timestamps for cursor only commits
- Adjust GART size on newer APUs for S/G display
- fix buddy memory corruption

amdkfd:
- MMU notifier fixes
- P2P DMA support using dma-buf
- Add available memory IOCTL
- HMM profiler support
- Simplify GPUVM validation
- Unified memory for CWSR save/restore area

i915:
- General driver clean-up
- DG2 enabling (still under force probe)
  - DG2 small BAR memory support
  - HuC loading support
  - DG2 workarounds
  - DG2/ATS-M device IDs added
- Ponte Vecchio prep work and new blitter engines
- add Meteorlake support
- Fix sparse warnings
- DMC MMIO range checks
- Audio related fixes
- Runtime PM fixes
- PSR fixes
- Media freq factor and per-gt enhancements
- DSI fixes for ICL+
- Disable DMC flip queue handlers
- ADL_P voltage swing updates
- Use more the VBT for panel information
- Fix on Type-C ports with TBT mode
- Improve fastset and allow seamless M/N changes
- Accept more fixed modes with VRR/DMRRS panels
- Disable connector polling for a headless SKU
- ADL-S display PLL w/a
- Enable THP on Icelake and beyond
- Fix i915_gem_object_ggtt_pin_ww regression on old platforms
- Expose per tile media freq factor in sysfs
- Fix dma_resv fence handling in multi-batch execbuf
- Improve on suspend / resume time with VT-d enabled
- export CRTC bpc settings via debugfs

msm:
- gpu: a619 support
- gpu: Fix for unclocked GMU register access
- gpu: Devcore dump enhancements
- client utilization via fdinfo support
- fix fence rollover issue
- gem: Lockdep false-positive warning fix
- gem: Switch to pfn mappings
- WB support on sc7180
- dp: dropped custom bulk clock implementation
- fix link retraining on resolution change
- hdmi: dropped obsolete GPIO support

tegra:
- context isolation for host1x engines
- tegra234 soc support

mediatek:
- add vdosys0/1 for mt8195
- add MT8195 dp_intf driver

exynos:
- Fix resume function issue of exynos decon driver by calling
  clk_disable_unprepare() properly if clk_prepare_enable() failed.

nouveau:
- set of misc fixes/cleanups
- display cleanups

gma500:
- Cleanup connector I2C handling

hyperv:
- Unify VRAM allocation of Gen1 and Gen2

meson:
- Support YUV422 output; Refcount fixes

mgag200:
- Support damage clipping
- Support gamma handling
- Protect concurrent HW access
- Fixes to connector
- Store model-specific limits in device-info structure
- fix PCI register init

panfrost:
- Valhall support

r128:
- Fix bit-shift overflow

rockchip:
- Locking fixes in error path

ssd130x:
- Fix built-in linkage

udl:
- Always advertize VGA connector

ast:
- Support multiple outputs
- fix black screen on resume

sun4i:
- HDMI PHY cleanups

vc4:
- Add support for BCM2711

vkms:
- Allocate output buffer with vmalloc()

mcde:
- Fix ref-count leak

mxsfb/lcdif:
- Support i.MX8MP LCD controller

stm/ltdc:
- Support dynamic Z order
- Support mirroring

ingenic:
- Fix display at maximum resolution

----------------------------------------------------------------
Aaron Liu (2):
      drm/amdgpu: enable swiotlb for gmc 10.0 (V2)
      drm/amdgpu: enable swiotlb for gmc 11.0

Abhinav Kumar (4):
      drm/msm/dpu: add writeback support for sc7180
      drm/msm/dpu: move intf and wb assignment to dpu_encoder_setup_display=
()
      drm/msm/dpu: fix maxlinewidth for writeback block
      drm/msm/dpu: remove hard-coded linewidth limit for writeback

Ahmad Othman (2):
      drm/amd/display: Add support for HF-VSIF
      drm/amd/display: Adding VTEM to dc

Akeem G Abodunrin (2):
      drm/i915/selftests: Increase timeout for live_parallel_switch
      drm/i915: Add support for LMEM PCIe resizable bar

Alan Liu (2):
      drm/amdgpu/display/dc: Add ACP_DATA register
      drm/amd/display: Program ACP related register

Alan Previn (4):
      drm/i915/guc: Remove unnecessary GuC err capture noise
      drm/i915/reset: Fix error_state_read ptr + offset use
      drm/i915/guc: Don't update engine busyness stats too frequently
      drm/i915/guc: Asynchronous flush of GuC log regions

Alex Deucher (49):
      drm/amdgpu: simplify amdgpu_device_asic_has_dc_support()
      drm/amdgpu: convert
sienna_cichlid_get_default_config_table_settings() to IP version
      drm/amdgpu: convert sienna_cichlid_populate_umd_state_clk() to
use IP version
      drm/amdgpu: simplify the logic in amdgpu_device_parse_gpu_info_fw()
      drm/amdgpu: convert nbio_v2_3_clear_doorbell_interrupt() to IP versio=
n
      drm/amdgpu/gmc11: enable AGP aperture
      drm/amdgpu/swsmu: add SMU mailbox registers in SMU context
      drm/amdgpu/swsmu: use new register offsets for smu_cmn.c
      drm/amdgpu: fix up comment in amdgpu_device_asic_has_dc_support()
      drm/amdgpu/display: Protect some functions with CONFIG_DRM_AMD_DC_DCN
      drm/amdgpu/discovery: add comments about VCN instance handling
      drm/amdgpu/display: make some functions static
      drm/amdgpu/display: fix DCN3.2 Makefiles for non-x86
      drm/amdgpu/soc21: add mode2 asic reset for SMU IP v13.0.4
      drm/amdgpu: simplify amdgpu_ucode_get_load_type()
      drm/amdkfd: fix warning when CONFIG_HSA_AMD_P2P is not set
      Revert "drm/amdgpu/display: Protect some functions with
CONFIG_DRM_AMD_DC_DCN"
      drm/amdgpu/display: make FP handling in Makefiles consistent
      drm/amdgpu/display: fix build when CONFIG_DEBUG_FS is not set
      drm/amdgpu/display: drop set but unused variable
      drm/radeon: fix incorrrect SPDX-License-Identifiers
      drm/amdgpu: Adjust logic around GTT size (v3)
      drm/amdgpu: fix adev variable used in amdgpu_device_gpu_recover()
      Revert "drm/amdgpu/display: set vblank_disable_immediate for DC"
      drm/amdgpu/display: reduce stack size in
dml32_ModeSupportAndSystemConfigurationFull()
      drm/amdgpu/display: drop set but unused variable
      drm/amdgpu: fix documentation warning
      drm/amdgpu/display: add missing FP_START/END checks dcn32_clk_mgr.c
      drm/amdgpu: keep fbdev buffers pinned during suspend
      drm/amdgpu/display: disable prefer_shadow for generic fb helpers
      drm/amd/display: remove set but unused variable
      drm/amd/display: make get_refresh_rate() static
      drm/amd/display: fix non-x86/PPC64 compilation
      drm/amd/display: fix 32 bit compilation errors in dc_dmub_srv.c
      drm/amdgpu/gmc10: adjust gart size for parts that support S/G display
      drm/amdgpu: fix file permissions on some files
      drm/amd/display: make some dc_dmub_srv functions static
      drm/amd/display: attempt to fix the logic in commit_planes_for_stream=
()
      drm/amd/display: remove duplicate dcn314 includes
      drm/amdgpu: use the same HDP flush registers for all nbio 7.4.x
      drm/amdgpu: use the same HDP flush registers for all nbio 2.3.x
      drm/amdgpu: restore original stable pstate on ctx fini
      drm/amdgpu: add the IP discovery IP versions for HW INFO data
      drm/amdgpu: bump driver version for IP discovery info in HW INFO
      drm/amd/display: reduce stack size in dcn32 dml (v2)
      drm/amd/display: reduce stack for dml32_CalculateSwathAndDETConfigura=
tion
      drm/amd/display: reduce stack for dml32_CalculateVMRowAndSwath
      drm/amd/display: reduce stack for
dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
      drm/amd/display: reduce stack for dml32_CalculatePrefetchSchedule

Alex Sierra (3):
      drm/amdgpu: remove acc_size from reserve/unreserve mem
      drm/amdkfd: track unified memory reservation with xnack off
      drm/amdgpu: add debugfs for kfd system and ttm mem used

Alex Williamson (1):
      vfio/pci: Remove console drivers

Alexander Stein (3):
      drm/bridge: ti-sn65dsi83: add more dev_err_probe
      drm/bridge: ti-sn65dsi83: Allow GPIO operations to sleep
      drm/panel: panel-simple: Add dev_err_probe if backlight could not be =
found

Alexey Kodanev (1):
      drm/radeon: fix potential buffer overflow in ni_set_mc_special_regist=
ers()

Allen-KH Cheng (1):
      drm/mediatek: Remove mt8192 display rdma compatible

Alvin Lee (21):
      drm/amd/display: Add missing instance for clock source register
      drm/amd/display: Implement WM table transfer for DCN32/DCN321
      drm/amd/display: Remove W/A for ODM memory pins
      drm/amd/display: Implement DTBCLK ref switching on dcn32
      drm/amd/display: Add debug option for exiting idle optimizations
on cursor updates
      drm/amd/display: Update DPPCLK programming sequence
      drm/amd/display: Update SW state correctly for FCLK
      drm/amd/display: Add SubVP required code
      drm/amd/display: Change DET policy for MPO cases
      drm/amd/display: Make OPTC3 function accessible to other DCN
      drm/amd/display: Don't set dram clock change requirement for SubVP
      drm/amd/display: Maintain old audio programming sequence
      drm/amd/display: Exit SubVP if MPO in use
      drm/amd/display: Update in dml
      drm/amd/display: Don't set dram clock change requirement for SubVP
      drm/amd/display: Updates SubVP and SubVP DRR cases
      drm/amd/display: Calculate MALL cache lines based on Mblks required
      drm/amd/display: Fallback to SW cursor if SubVP + cursor too big
      drm/amd/display: Update DCN32 and DCN321 SR latencies
      drm/amd/display: Disable MPC split for DCN32/321
      drm/amd/display: Add debug option for idle optimizations on cursor up=
dates

Alyssa Rosenzweig (9):
      dt-bindings: Add compatible for Mali Valhall (JM)
      drm/panfrost: Handle HW_ISSUE_TTRX_2968_TTRX_3162
      drm/panfrost: Constify argument to has_hw_issue
      drm/panfrost: Handle HW_ISSUE_TTRX_3076
      drm/panfrost: Add HW_ISSUE_TTRX_3485 quirk
      drm/panfrost: Add "clean only safe" feature bit
      drm/panfrost: Don't set L2_MMU_CONFIG quirks
      drm/panfrost: Add Mali-G57 "Natt" support
      drm/panfrost: Add arm,mali-valhall-jm compatible

Andi Shyti (1):
      drm/i915/gt: Fix use of static in macro mismatch

Andrey Grodzovsky (12):
      Revert "workqueue: remove unused cancel_work()"
      drm/amdgpu: Cache result of last reset at reset domain level.
      drm/admgpu: Serialize RAS recovery work directly into reset domain qu=
eue.
      drm/amdgpu: Add work_struct for GPU reset from debugfs
      drm/amdgpu: Add work_struct for GPU reset from kfd.
      drm/amdgpu: Rename amdgpu_device_gpu_recover_imp back to
amdgpu_device_gpu_recover
      drm/amdgpu: Stop any pending reset if another in progress.
      drm/amdgpu: Add put fence in amdgpu_fence_driver_clear_job_fences
      drm/amdgpu: Prevent race between late signaled fences and GPU reset.
      drm/sched: Partial revert of 'drm/sched: Keep s_fence->parent pointer=
'
      drm/amdgpu: Follow up change to previous drm scheduler change.
      drm/amdgpu: Get rid of amdgpu_job->external_hw_fence

Andrzej Hajda (1):
      drm/i915/selftests: fix subtraction overflow bug

Andr=C3=A9 Almeida (6):
      drm/vkms: Update vkms_composer_worker documentation
      drm/amdpgu/debugfs: Simplify some exit paths
      drm/amd/pm: Implement get GFXOFF status for vangogh
      drm/amdgpu: Clarify asics naming in Kconfig options
      drm/amd/debugfs: Expose GFXOFF state to userspace
      Documentation/gpu: Add GFXOFF section

Animesh Manna (1):
      drm/i915/bios: calculate panel type as per child device index in VBT

Anshuman Gupta (3):
      drm/i915: Use drm_dbg for rpm logging
      drm/i915/dg2: Add Wa_14015795083
      drm/i915/dgfx: Disable d3cold at gfx root port

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.119.0
      drm/amd/display: Add support for manual DMUB FAMS trigger
      drm/amd/display: 3.2.196

Anton Bambura (1):
      dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03

Antonio Borneo (1):
      drm: adv7511: override i2c address of cec before accessing it

Anusha Srivatsa (2):
      drm/i915/dmc: Load DMC on DG2
      drm/i915/dmc: Add MMIO range restrictions

Aric Cyr (10):
      drm/amd/display: 3.2.188
      drm/amd/display: 3.2.189
      drm/amd/display: 3.2.190
      drm/amd/display: Change initializer to single brace
      drm/amd/display: 3.2.191
      drm/amd/display: 3.2.192
      drm/amd/display: 3.2.193
      drm/amd/display: 3.2.194
      drm/amd/display: 3.2.195
      drm/amd/display: Avoid MPC infinite loop

Arunpravin Paneer Selvam (4):
      drm/amd/amdgpu: Enable high priority gfx queue
      drm/amd/amdgpu: add pipe1 hardware support
      drm/amd/amdgpu: Fix alignment issue
      drm/amdgpu: Fix for drm buddy memory corruption

Ashutosh Dixit (5):
      drm/i915: Introduce has_media_ratio_mode
      drm/i915/pcode: Extend pcode functions for multiple gt's
      drm/i915/gt: Add media freq factor to per-gt sysfs
      drm/i915/pcode: Init pcode on different gt's
      drm/i915/gt: Fix memory leaks in per-gt sysfs

Aurabindo Pillai (31):
      drm/amd: Add atomfirmware.h definitions needed for DCN32/321
      drm/amd/display: Add DCN32/321 version identifiers
      drm/amd: add register headers for DCN32/321
      drm/amd/display: Add DMCUB source files and changes for DCN32/321
      drm/amd/display: add dcn32 IRQ changes
      drm/amd/display: add GPIO changes for DCN32/321
      drm/amd/display: DML changes for DCN32/321
      drm/amd/display: add CLKMGR changes for DCN32/321
      drm/amd/display: add DCN32/321 specific files for Display Core
      drm/amd/display: Add dependant changes for DCN32/321
      drm/amd/display: Add DM support for DCN32/DCN321
      drm/amd/display: add DCN32 to IP discovery table
      drm/amd: Add GFX11 modifiers support to AMDGPU (v3)
      drm/amd/display: add missing interrupt handlers for DCN32/DCN321
      drm/amd/display: disable idle optimizations
      drm/amd/display: update disp pattern generator routine for DCN30
      drm/amd/display: fix null pointer deref error
      drm/amd/display: ignore modifiers when checking for format support
      drm/amd/display: dml: move some variables to heap
      drm/amd/display: add missing reg defs for DCN3x HUBBUB
      drm/amd/display: fix array index in DML
      drm/amd/display: fix incorrect comparison in DML
      drm/amd: Load TA firmware for DCN321/DCN32
      drm/amd/display: expose additional modifier for DCN32/321
      drm/amd: Add debug mask for subviewport mclk switch
      drm/amd/display: remove stale debug setting
      drm/amd/display: Add callback to set dig mode
      drm/amd/display: Enable ODM combine default policy
      drm/amd/display: Add NBIO reg offsets to DC
      drm/amd/display: Revert "drm/amd/display: disable idle optimizations"
      drm/amd/display: Add dc_ctx to link_enc_create() parameters

Ayaz A Siddiqui (1):
      drm/i915/pvc: Define MOCS table for PVC

Balasubramani Vivekanandan (3):
      drm/i915/hwconfig: Report no hwconfig support on ADL-N
      drm/i915/display/adl_p: Updates to HDMI combo PHY voltage swing table
      drm/i915/display/adlp: More updates to voltage swing table

Bas Nieuwenhuizen (1):
      Revert "drm/amd/display: ignore modifiers when checking for
format support"

Bastian Krause (2):
      dt-bindings: display: simple: add Ampire AM-800600P5TMQW-TB8H panel
      drm/panel: simple: add AM-800600P5TMQW-TB8H

Ben Skeggs (29):
      drm/nouveau/nvif: add wrapper for open-coded nvif_object_constructed(=
)
      drm/nouveau/nvkm: rip out event uapi
      drm/nouveau/nvkm: use list_add_tail() when building object tree
      drm/nouveau/nvkm: zero out engine pointer for subdev-provided classes
      drm/nouveau/nvkm: remove unused header
      drm/nouveau/device: remove pwrsrc notify in favour of a direct call t=
o clk
      drm/nouveau/fifo: rip out cevent, never used
      drm/nouveau/fifo: remove rd32/wr32 accessors from channels
      drm/nouveau/ce/gv100-: move method buffer to ce ctx
      drm/nouveau: remove double WFI when destroying channels
      drm/nouveau/flcn: remove unused functions
      drm/nouveau/kms/nv50-: remove unused functions
      drm/nouveau/disp: collapse nvkm_dp into nvkm_outp
      drm/nouveau/disp: clean up nvkm_outp constructors
      drm/nouveau/disp: collapse nv50_disp_func into nvkm_disp_func
      drm/nouveau/disp: collapse nv50_disp into nvkm_disp
      drm/nouveau/disp: add common class handling between <nv50 and >=3Dnv5=
0
      drm/nouveau/disp: merge head/outp/ior code into chipset files
      drm/nouveau/disp: group supervisor-related struct members
      drm/nouveau/disp: merge nv50_disp_new_() and nvkm_disp_new()
      drm/nouveau/disp: replace hda func pointer check with flag
      drm/nouveau/disp: split sor dp funcs out to their own struct
      drm/nouveau/disp: split sor hda funcs out to their own struct
      drm/nouveau/disp: add common channel class handling
      drm/nouveau/disp: add connector class
      drm/nouveau/disp: add conn method to query HPD pin status
      drm/nouveau/disp: add supervisor mutex
      drm/nouveau/disp: add output class
      drm/nouveau/disp: move DAC load detection method

Bhanuprakash Modem (3):
      drm/debug: Expose connector's max supported bpc via debugfs
      drm/i915/display/debug: Expose crtc current bpc via debugfs
      drm/amd/display: Move connector debugfs to drm

Biju Das (1):
      drm: rcar-du: Add num_rpf to struct rcar_du_device_info

Bjorn Andersson (2):
      drm/bridge: lt9611uxc: Cancel only driver's work
      drm/panel-edp: Add LQ140M1JW48 edp panel entry

Bo Liu (1):
      drm/connector: Remove usage of the deprecated ida_simple_xxx API

Bo-Chen Chen (8):
      dt-bindings: display: mediatek: dpi: Revise mediatek strings to
correct format
      drm/mediatek: dpi: Add kernel document for struct mtk_dpi_conf
      drm/mediatek: dpi: Remove output format of YUV
      drm/mediatek: dpi: Add support for quantization range
      drm/mediatek: dpi: Add YUV422 output support
      drm/mediatek: dpi: Add config to support direct connection to dpi pan=
els
      drm/mediatek: dpi: Add input_2pixel config support
      drm/mediatek: dpi: Add pixels_per_iter config support

Bommu Krishnaiah (1):
      drm/i915: Update tiled blits selftest

Borislav Petkov (2):
      drm/i915/uc: Fix undefined behavior due to shift overflowing the cons=
tant
      drm/r128: Fix undefined behavior due to shift overflowing the constan=
t

Brian Norris (1):
      drm/rockchip: vop: Don't crash for invalid duplicate_state()

CQ Tang (1):
      drm/i915: extend i915_vma_pin_iomap()

Carlos Llamas (1):
      drm/fourcc: fix integer type usage in uapi header

Chaitanya Dhere (2):
      drm/amd/display: FCLK P-state support updates
      drm/amd/display: Implement a pme workaround function

Chandan Vurdigere Nataraj (4):
      drm/amdgpu/display: Remove unnecessary typecasts and fix build issues
      drm/amdgpu/display: Fix compilation issues
      drm/amd/display : Log DP link training failure reason
      drm/amd/display: Re-org and cleanup the redundant code

Charlene Liu (3):
      drm/amd/display: use updated clock source init routine
      drm/amd/display: FVA timing adjustment
      drm/amd/display: add system info table log

Chengming Gui (4):
      Revert "drm/amdgpu/gmc11: enable AGP aperture"
      drm/amd/amdgpu: add TAP_DELAYS upload support for gfx10
      drm/amd/amdgpu: add additional page fault settings for gfx11
      drm/amd/amdgpu: add memory training support for PSP_V13

Chris Park (7):
      drm/amd/display: Add HDMI member to DTO
      drm/amd/display: Switch to correct DTO on HDMI
      drm/amd/display: Indicate stream change on ODM change
      drm/amd/display: OVT Update on InfoFrame and Mode Management
      drm/amd/display: Reduce SCDC Status Flags Definition
      drm/amd/display: Update Cursor Attribute MALL cache
      drm/amd/display: Cache cursor when cursor exceeds 64x64

Chris Wilson (6):
      drm/i915/selftests: Grab the runtime pm in shrink_thp
      drm/i915/gt: Serialize GRDOM access between multiple engine resets
      drm/i915/gt: Serialize TLB invalidates with GT resets
      drm/i915/gem: Look for waitboosting across the whole object
prior to individual waits
      drm/i915: Bump GT idling delay to 2 jiffies
      drm/i915/gt: Only kick the signal worker if there's been an update

Christian K=C3=B6nig (14):
      drm/ttm: move default BO destructor into VMWGFX v2
      drm/amdgpu: switch DM to atomic fence helpers v2
      drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new
      drm/amdgpu: move internal vram_mgr function into the C file
      dma-buf: cleanup dma_fence_chain_walk
      dma-buf: cleanup dma_fence_unwrap selftest v2
      dma-buf: cleanup dma_fence_unwrap implementation
      dma-buf: return only unsignaled fences in dma_fence_unwrap_for_each v=
3
      dma-buf: generalize dma_fence unwrap & merging v3
      drm: use dma_fence_unwrap_merge() in drm_syncobj
      drm/amdgpu: fix limiting AV1 to the first instance on VCN3
      drm/amdgpu: always flush the TLB on gfx8
      dma-buf: deprecate DMABUF_SYSFS_STATS
      dma-buf: revert "return only unsignaled fences in
dma_fence_unwrap_for_each v3"

Christophe JAILLET (2):
      drm/rockchip: Fix an error handling path rockchip_dp_probe()
      gpu: host1x: Use the bitmap API to allocate bitmaps

Christophe Leroy (1):
      drm/nouveau/bios: Rename prom_init() and friends functions

Colin Ian King (4):
      drm/rockchip: Fix spelling mistake "aligened" -> "aligned"
      drm/amdkfd: Fix spelling mistake "mechanim" -> "mechanism"
      drm/amdgpu/display: Fix spelling mistake "supporing" -> "supporting"
      drm/amd/display: Fix spelling mistake "supporing" -> "supporting"

Cruise Hung (1):
      drm/amd/display: Remove compiler warning

Dale B Stimson (2):
      drm/i915/pcode: Add a couple of pcode helpers
      drm/i915/gt: Add media RP0/RPn to per-gt sysfs

Dan Carpenter (8):
      drm/rockchip: vop2: unlock on error path in vop2_crtc_atomic_enable()
      drm/amdgpu: delete duplicate condition in gfx_v11_0_soft_reset()
      drm: logicvc: Fix uninitialized variable in probe
      drm: logicvc: fix error code in logicvc_layer_init()
      drm/i915: Fix error code in icl_compute_combo_phy_dpll()
      drm/i915/selftests: fix a couple IS_ERR() vs NULL tests
      drm/amd/display: Remove unnecessary NULL check in
commit_planes_for_stream()
      drm/amd/display: fix signedness bug in execute_synaptics_rc_command()

Daniel Phillips (1):
      drm/amdkfd: Add available memory ioctl

Daniel Thompson (1):
      drm/cma-helper: Describe what a "contiguous chunk" actually means

Daniel Vetter (2):
      Revert "fbdev: Prevent probing generic drivers if a FB is
already registered"
      Merge tag 'drm-misc-next-2022-06-08' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Daniele Ceraolo Spurio (6):
      drm/i915/huc: drop intel_huc_is_authenticated
      drm/i915/huc: Add fetch support for gsc-loaded HuC binary
      drm/i915/huc: Prepare for GSC-loaded HuC
      drm/i915/huc: Don't fail the probe if HuC init fails
      drm/i915/guc: XEHPSDV and PVC do not use HuC
      drm/i915/guc: ADL-N should use the same GuC FW as ADL-S

Darren Powell (2):
      amdgpu/pm: Fix incorrect variable for size of clocks array
      amdgpu/pm: Fix possible array out-of-bounds if SCLK levels !=3D 2

Dave Airlie (22):
      Merge tag 'drm-misc-next-2022-06-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2022-06-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2022-06-22' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-06-30' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-gt-next-2022-06-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.20-2022-07-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-2022-07-06' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2022-07-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm/tegra/for-5.20-rc1' of
https://gitlab.freedesktop.org/drm/tegra into drm-next
      Merge tag 'mediatek-drm-next-5.20' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Backmerge tag 'v5.19-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into
drm-next
      Merge tag 'drm-msm-next-2022-07-10' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'exynos-drm-next-for-v5.20' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'topic/nouveau-misc-2022-07-13-1' of
git://anongit.freedesktop.org/drm/drm into drm-next
      Merge tag 'amd-drm-next-5.20-2022-07-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2022-07-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'du-next-20220707' of
git://linuxtv.org/pinchartl/media into drm-next
      Merge tag 'drm-misc-next-fixes-2022-07-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-gt-next-2022-07-13' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-5.20-2022-07-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'topic/nouveau-misc-2022-07-27' of
git://anongit.freedesktop.org/drm/drm into drm-next
      Merge tag 'amd-drm-next-5.20-2022-07-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Dave Stevenson (21):
      drm/vc4: drv: Adopt the dma configuration from the HVS or V3D compone=
nt
      drm/vc4: plane: Fix margin calculations for the right/bottom edges
      drm/vc4: plane: Add alpha_blend_mode property to each plane.
      drm/vc4: hvs: Add debugfs node that dumps the current display lists
      drm/vc4: dpi: Add support for composite syncs to vc4_dpi
      drm/vc4: dpi: Add option for inverting pixel clock and output enable
      drm/vc4: dpi: Ensure a default format is selected
      drm/vc4: dsi: Release workaround buffer and DMA
      drm/vc4: dsi: Correct DSI divider calculations
      drm/vc4: dsi: Correct pixel order for DSI0
      drm/vc4: dsi: Register dsi0 as the correct vc4 encoder type
      drm/vc4: dsi: Fix dsi0 interrupt support
      drm/vc4: dsi: Add correct stop condition to
vc4_dsi_encoder_disable iteration
      drm/vc4: hdmi: Add all the vc5 HDMI registers into the debugfs dumps
      drm/vc4: hdmi: Reset HDMI MISC_CONTROL register
      drm/vc4: hdmi: Switch to pm_runtime_status_suspended
      drm/vc4: hdmi: Move HDMI reset to pm_resume
      drm/vc4: hdmi: Add HDMI format detection registers to register list
      drm/vc4: hdmi: Add MISC_CONTROL register for vc4
      drm/vc4: hdmi: Correct HDMI timing registers for interlaced modes
      drm/vc4: hdmi: Move pixel doubling from Pixelvalve to HDMI block

David Zhang (19):
      drm/amd/display: align dmub cmd header to latest dmub FW to support P=
SR-SU
      drm/amd/display: feed PSR-SU as psr version to dmub FW
      drm/amd/display: combine dirty rectangles in DMUB FW
      drm/amd/display: update GSP1 generic info packet for PSRSU
      drm/amd/display: revise Start/End SDP data
      drm/amd/display: program PSR2 DPCD Configuration
      drm/amd/display: Passing Y-granularity to dmub fw
      drm/amd/display: Set default value of line_capture_indication
      drm/amd/display: add vline time in micro sec to PSR context
      drm/amd/display: fix system hang when PSR exits
      drm/amd/display: Set PSR level to enable ALPM by default
      drm/amd/display: use HW lock mgr for PSR-SU
      drm/amd/display: PSRSU+DSC WA for specific TCON
      drm/amd/display: add shared helpers to update psr config fields
to power module
      drm/amd/display: calculate psr config settings in runtime in DM
      drm/amd/display: update cursor position to DMUB FW
      drm/amd/display: expose AMD specific DPCD for PSR-SU-RC support
      drm/amd/display: Add PSR-SU-RC support in DC
      drm/amd/display: pass panel instance in DMUB dirty rect command

Dillon Varone (9):
      drm/amd/display: Fix USBC link creation
      drm/amd/display: Add guard for FCLK pstate message to PMFW for DCN321
      drm/amd/display: Various DML fixes to enable higher timings
      drm/amd/display: Select correct DTO source
      drm/amd/display: Ensure that DMCUB fw in use is loaded by DC and not =
VBIOS
      drm/amd/display: Add additional guard for FCLK pstate message for DCN=
321
      drm/amd/display: set dram speed for all states
      drm/amd/display: Disable DTB Ref Clock Switching in dcn32
      drm/amd/display: change dsc image width cap for dcn32 and dcn321

Dmitry Baryshkov (45):
      drm/msm/dpu: use feature bit for LM combined alpha check
      drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
      drm/msm/dpu: remove hwversion field from data structures
      drm/msm/dpu: change catalog->perf to be a const pointer
      drm/msm/dpu: change catalog->dma_cfg to be a const pointer
      drm/msm/dpu: constify struct dpu_mdss_cfg
      drm/msm/dpu: make dpu hardware catalog static const
      drm/msm/dpu: dont_use IS_ERR_OR_NULL for encoder phys backends
      drm/msm/dpu: drop enum msm_display_caps
      drm/msm/dp: "inline" dp_ctrl_set_clock_rate("ctrl_link")
      drm/msm/dp: set stream_pixel rate directly
      drm/msm/dp: inline dp_power_clk_set_rate()
      drm/msm/dp: rewrite dss_module_power to use bulk clock functions
      drm/msm/dpu: simplify and unify dpu_encoder_get_intf and
dpu_encoder_get_wb
      drm/msm/dp: make dp_bridge_mode_valid() more precise
      drm/msm/hdmi: fill the pwr_regs bulk regulators
      drm/msm/dp: use ARRAY_SIZE for calculating num_descs
      dt-bindings: display/msm: hdmi: split and convert to yaml
      dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecate=
d
      dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
      drm/msm/hdmi: drop the hdmi-mux support
      drm/msm/hdmi: drop unused GPIO support
      drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
      drm/msm/hdmi: drop empty 'none' regulator lists
      drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
      drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
      drm/msm/hdmi: reuse MSM8960's config for MSM8660
      drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements
      drm/msm/hdmi: drop empty bridge callbacks
      drm/msm/hdmi: support attaching the "next" bridge
      drm/msm/mdp4: move iommu_domain_alloc() call close to its usage
      drm/msm/mdp4: get rid of struct mdp4_platform_config
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu',
'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi',
'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag
      drm/msm/dpu: drop xin_id from struct dpu_hw_blk_reg_map
      drm/msm/dpu: drop length from struct dpu_hw_blk_reg_map
      drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map
      drm/msm/dpu: move struct dpu_hw_blk definition to dpu_hw_utils.h
      drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
      drm/msm/mdp5: move iommu_domain_alloc() call close to its usage
      drm/msm: Stop using iommu_present()
      drm/msm: move KMS aspace init to the separate helper
      drm/msm: switch msm_kms_init_aspace() to use device_iommu_mapped()
      drm/msm/dp: remove unused stubs
      drm/msm/dp: rename second dp_display_enable()'s argument
      drm/msm/dp: remove dp_display_en/disable prototypes and data argument

Dmitry Osipenko (2):
      drm/scheduler: Don't kill jobs in interrupt context
      drm/tegra: Fix vmapping of prime buffers

Dmytro Laktyushkin (3):
      drm/amd/display: Fix in dp link-training when updating payload
allocation table
      drm/amd/display: disable timing sync b/w odm halves
      drm/amd/display: disable otg toggle w/a on boot

Dom Cobley (8):
      drm/vc4: plane: Remove subpixel positioning check
      drm/vc4: hdmi: Clear unused infoframe packet RAM registers
      drm/vc4: hdmi: Avoid full hdmi audio fifo writes
      drm/vc4: hdmi: Stop checking for enabled output in audio
      drm/vc4: hdmi: Skip writes to disabled packet RAM
      drm/vc4: hdmi: Remove VC4_HDMI_SCHEDULER_CONTROL_VERT_ALWAYS_KEEPOUT
      drm/vc4: hdmi: Report that 3d/stereo is allowed
      drm/vc4: hdmi: Force modeset when bpc or format changes

Dongjin Kim (1):
      drm/meson: add YUV422 output support

Douglas Anderson (15):
      drm/probe-helper: Add helper for drm_helper_probe_single_connector_mo=
des()
      drm/probe-helper: For DP, add 640x480 if all other modes are bad
      drm: Document the power requirements for DP AUX transfers
      drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
      drm/dp: Add callbacks to make using DP AUX bus properly easier
      drm/bridge: Add devm_drm_bridge_add()
      drm/bridge: parade-ps8640: Handle DP AUX more properly
      drm/probe-helper: Default to 640x480 if no EDID on DP
      drm: Fix htmldocs indentation warning w/ DP AUX power requirements
      drm/dp: Add wait_hpd_asserted() callback to struct drm_dp_aux
      drm/panel-edp: Take advantage of wait_hpd_asserted() in struct drm_dp=
_aux
      drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in
struct drm_dp_aux
      drm/bridge: parade-ps8640: Provide wait_hpd_asserted() in struct
drm_dp_aux
      dt-bindings: msm/dp: List supplies in the bindings
      drm/msm: Avoid unclocked GMU register access in 6xx gpu_busy

Duncan Ma (5):
      drm/amd/display: Add ODM seamless boot support
      drm/amd/display: Blank eDP on enable drv if odm enabled
      drm/amd/display: Correct min comp buffer size
      drm/amd/display: Fix dpp dto for disabled pipes
      drm/amd/display: Add flag to modify MST delay

Eric Bernstein (4):
      drm/amd/display: Use DTBCLK for valid pixel clock
      drm/amd/display: Add function to set pixels per cycle
      drm/amd/display: Update gpuvm_max_page_table_levels IP param
      drm/amd/display: Fix null timing generator resource

Eric Huang (4):
      drm/amdkfd: add new flag for svm
      drm/amdkfd: change svm range evict
      drm/amdkfd: optimize svm range evict
      drm/amdkfd: bump KFD version for unified ctx save/restore memory

Ethan Wellenreiter (1):
      drm/amd/display: Re-implementing ARGB16161616 pixel format as 22

Evan Quan (24):
      drm/amd/pm: correct the way for retrieving current uclk frequency
      drm/amd/pm: update SMU 13.0.0 driver_if header
      drm/amd/pm: enable fclk ds feature for SMU 13.0.0
      drm/amd/pm: enable FW CTF feature for SMU 13.0.0
      drm/amd/pm: drop unneeded thermal_controller_type check
      drm/amd/pm: optimize the interface for dpm feature status query
      drm/amdgpu: enable ASPM support for PCIE 7.4.0/7.6.0
      drm/amdgpu: avoid to perform undesired clockgating operation
      drm/amd/pm: enable mode1 reset support for SMU 13.0.0
      drm/amd/pm: drop redundant declarations
      drm/amd/pm: drop unneeded dpm features disablement for SMU 13.0.0/7
      drm/amd/pm: enable UCLK DS feature for SMU 13.0.0
      drm/amd/pm: enable MACO support for SMU 13.0.0
      drm/amdgpu: update GFX11 cs settings
      drm/amd/pm: enable VR0 HOT support for SMU 13.0.0
      drm/amd/pm: update SMU 13.0.0 driver_if header
      drm/amd/display: correct idle_power_optimizations disablement return =
value
      drm/amd/pm: enable GPO feature support for SMU13.0.0
      drm/amd/pm: update SMU13.0.0 driver_if header
      drm/amd/pm: correct smu 13.0.0/7 mp1 state setup
      drm/amd/pm: revise the driver reloading fix for SMU 13.0.0 and 13.0.7
      drm/amdgpu: drop non-necessary call trace dump
      drm/amd/pm: update driver if header for SMU 13.0.0
      drm/amd/pm: enable GFX ULV feature support for SMU13.0.0

Evgenii Krasnikov (1):
      drm/amd/display: add an option to skip wait for HPD when
powering on eDP panel

Fabio Estevam (1):
      drm: bridge: adv7511: Move CEC definitions to adv7511_cec.c

Fangzhi Zuo (3):
      drm/amd/display: Halve DTB Clock Value for DCN32
      drm/amd/display: Fix dmub soft hang for PSR 1
      drm/amd/display: Ignore First MST Sideband Message Return Error

Felipe Clark (2):
      drm/amd/display: Firmware assisted MCLK switch and FS
      drm/amd/display: Pass vrr mode to dcn

Felix Kuehling (1):
      drm/amdkfd: Document and fix GTT BO kmap API

Gabe Teeger (1):
      drm/amd/display: Update optimized blank calc and programming

Gao Chao (1):
      drm/panel: Fix build error when
CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=3Dy && CONFIG_DRM_DISPLAY_HELPER=3Dm

Gavin Wan (1):
      drm/amdgpu: fix scratch register access method in SRIOV

Geert Uytterhoeven (4):
      drm: bridge: DRM_FSL_LDB should depend on ARCH_MXC
      fbcon: Remove obsolete reference to initmem_freed
      drm/bridge: imx: i.MX8 bridge drivers should depend on ARCH_MXC
      drm/msm/adreno: Do not propagate void return values

George Shen (5):
      drm/amd/display: Fix in overriding DP drive settings
      drm/amd/display: Fix typo in override_lane_settings
      drm/amd/display: Handle downstream LTTPR with fixed VS sequence
      drm/amd/display: Remove unused vendor specific w/a
      drm/amd/display: Fix divide-by-zero in DPPCLK and DISPCLK calculation

Graham Sider (4):
      drm/amdgpu: Remove break for VMID loop TLB flush on MES
      drm/amdgpu: Fetch MES scheduler/KIQ versions
      drm/amdkfd: Enable GFX11 usermode queue oversubscription
      drm/amdgpu: Update mes_v11_api_def.h

Guchun Chen (6):
      Revert "drm/amdgpu: Ensure the DMA engine is deactivated during set u=
ps"
      drm/amdgpu: introduce runtime pm mode
      drm/amdgpu: skip SMU FW reloading in runpm BACO case
      drm/amdgpu: drop runtime pm disablement quirk on several sienna
cichlid cards
      drm/amdgpu: drop runpm from amdgpu_device structure
      drm/amdgpu: use adev_to_drm for consistency

Guenter Roeck (1):
      drm/amd/display: Enable building new display engine with KCOV enabled

Guillaume Ranquet (9):
      drm/mediatek: dpi: Only enable dpi after the bridge is enabled
      drm/mediatek: dpi: Implement a CK/DE pol toggle in SoC config
      drm/mediatek: dpi: Implement a swap_input toggle in SoC config
      drm/mediatek: dpi: Move dimension mask to SoC config
      drm/mediatek: dpi: Move hvsize_mask to SoC config
      drm/mediatek: dpi: Move swap_shift to SoC config
      drm/mediatek: dpi: Move the yuv422_en_bit to SoC config
      drm/mediatek: dpi: Move the csc_enable bit to SoC config
      drm/mediatek: dpi: Add dp_intf support

Guo Zhengkui (2):
      drm/nouveau/tegra: remove needless NULL check
      drm/amd/display: remove repeated includes

Gustavo Sousa (1):
      drm/i915/pvc: Implement w/a 16016694945

Hamza Mahfooz (2):
      drm/amd/display: enable PCON SST support for newer ASICs
      drm/amd/display: rename hdmi_frl_pcon_support

Hangyu Hua (2):
      drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector(=
)
      drm: bridge: sii8620: fix possible off-by-one

Hans de Goede (3):
      drm/amdgpu: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs
      drm/radeon: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs
      drm/nouveau/Kconfig: Drop duplicate "select ACPI_VIDEO"

Hansen Dsouza (1):
      drm/amd/display: Enable 3 plane MPO

Harry VanZyllDeJong (1):
      drm/amd/display: Add vrr_active_variable to dc_stream_update

Harry Wentland (2):
      drm/amd/display: Move all linux includes into OS types
      drm/amd/display: Add DCN reg offsets to DC

Hawking Zhang (1):
      drm/amdgpu: correct the PSP_BL_CMD enum

Helge Deller (2):
      fbcon: Fix accelerated fbdev scrolling while logo is still shown
      fbcon: Fix boundary checks for fbcon=3Dvc:n1-n2 parameters

Hsin-Yi Wang (13):
      drm/panel: Add an API to allow drm to set orientation from panel
      drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
      drm/panel: panel-edp: Implement .get_orientation callback
      drm/panel: lvds: Implement .get_orientation callback
      drm/panel: panel-simple: Implement .get_orientation callback
      drm/panel: ili9881c: Implement .get_orientation callback
      drm/panel: elida-kd35t133: Implement .get_orientation callback
      drm: Config orientation property if panel provides it
      drm/mediatek: Ensure bridge disable happends before suspend
      drm/bridge: anx7625: Convert to devm_i2c_new_dummy_device()
      drm/bridge: anx7625: use pm_runtime_force_suspend(resume)
      drm/bridge: anx7625: Fix NULL pointer crash when using edp-panel
      drm/bridge: anx7625: Add wait_hpd_asserted() callback

Huang Rui (7):
      drm/amdgpu: introduce two work mode for imu
      drm/amdgpu: use the callback function for reset status polling on IMU
      drm/amdgpu: add mmhub v3_0_1 headers
      drm/amdgpu: add mmhub v3_0_1 ip block
      drm/amdgpu/pm: update MP v13_0_4 smu message register marco
      drm/amdgpu/pm: implement the SMU_MSG_EnableGfxImu function
      drm/amdgpu: add apu sequence in the imu v11

Ian Chen (2):
      drm/amd/display: DAL ACR, dc part, fix missing dcn30
      drm/amd/display: Drop unnecessary detect link code

Igor Torrente (1):
      drm: vkms: Alloc the compose frame using vzalloc

Ilya Bakoulin (1):
      drm/amd/display: Fix black screen when disabling Freesync in OSD

Imre Deak (4):
      drm/i915: Fix 'mixing different enum types' warnings in
intel_display_power.c
      drm/i915/d12+: Disable DMC firmware flip queue handlers
      drm/dp/mst: Read the extended DPCD capabilities during system resume
      drm/fourcc: Document the Intel CCS modifiers' CC plane expected pitch

Jack Xiao (17):
      drm/amdgpu/mes11: update mes11 api interface
      drm/amdgpu/gmc11: avoid cpu accessing registers to flush VM
      drm/amdgpu: add mc wptr addr support for mes
      drm/amdgpu/mes11: update mes interface for acessing registers
      drm/amdgpu: add common interface for mes misc op
      drm/amdgpu/mes11: add mes11 misc op
      drm/amdgpu/mes: add mes register access interface
      drm/amdgpu: enable mes to access registers v2
      Revert "drm/amdgpu/gmc11: avoid cpu accessing registers to flush VM"
      drm/amdgpu/mes11: fix to unmap legacy queue
      drm/amdgpu/mes: fix mes submission in atomic context
      drm/amdgpu/mes: fix bo va unmap issue in mes
      drm/amdgpu/mes: set correct mes ring ready flag
      drm/amdgpu/mes11: initialize aggregated doorbell
      drm/amdgpu/sdma6: add aggregated doorbell support
      drm/amdgpu/gfx11: add aggregated doorbell support
      drm/amdgpu: move mes self test after drm sched re-started

Jagan Teki (2):
      dt-bindings: display: bridge: Add TI DLPC3433 DSI to DMD
      drm: bridge: Add TI DLPC3433 DSI to DMD bridge

Jani Nikula (90):
      drm/edid: reset display info in drm_add_edid_modes() for NULL edid
      drm/edid: rename HDMI Forum VSDB to SCDS
      drm/edid: clean up CTA data block tag definitions
      drm/edid: add iterator for EDID base and extension blocks
      drm/edid: add iterator for CTA data blocks
      drm/edid: clean up cea_db_is_*() functions
      drm/edid: convert add_cea_modes() to use cea db iter
      drm/edid: convert drm_edid_to_speaker_allocation() to use cea db iter
      drm/edid: convert drm_edid_to_sad() to use cea db iter
      drm/edid: convert drm_detect_hdmi_monitor() to use cea db iter
      drm/edid: convert drm_detect_monitor_audio() to use cea db iter
      drm/edid: convert drm_parse_cea_ext() to use cea db iter
      drm/edid: convert drm_edid_to_eld() to use cea db iter
      drm/edid: sunset the old unused cea data block iterators
      drm/edid: restore some type safety to cea_db_*() functions
      drm/edid: detect basic audio in all CEA extensions
      drm/edid: detect color formats and CTA revision in all CTA extensions
      drm/edid: skip CTA extension scan in drm_edid_to_eld() just for CTA r=
ev
      drm/edid: sunset drm_find_cea_extension()
      drm/i915: remove unused GEM_DEBUG_DECL() and GEM_DEBUG_BUG_ON()
      drm/i915: remove single-use GEM_DEBUG_EXEC()
      drm/i915/audio: fix audio code enable/disable pipe logging
      drm/edid: use else-if in CTA extension parsing
      drm/edid: convert drm_for_each_detailed_block() to edid iter
      drm/edid: add struct drm_edid container
      drm/edid: start propagating drm_edid to lower levels
      drm/edid: keep propagating drm_edid to display info
      drm/edid: propagate drm_edid to drm_edid_to_eld()
      drm/edid: convert drm_edid_connector_update() to drm_edid fully
      drm/edid: convert struct detailed_mode_closure to drm_edid
      drm/edid: convert drm_mode_detailed() to drm_edid
      drm/edid: convert drm_dmt_modes_for_range() to drm_edid
      drm/edid: convert drm_gtf_modes_for_range() to drm_edid
      drm/edid: convert drm_cvt_modes_for_range() to drm_edid
      drm/edid: convert drm_mode_std() and children to drm_edid
      drm/edid: convert mode_in_range() and drm_monitor_supports_rb()
to drm_edid
      drm/edid: convert get_monitor_name() to drm_edid
      drm/edid: convert drm_for_each_detailed_block() to drm_edid
      drm/edid: add drm_edid helper for drm_edid_to_sad()
      drm/edid: add drm_edid helper for drm_edid_to_speaker_allocation()
      drm/edid: add drm_edid helper for drm_detect_hdmi_monitor()
      drm/edid: add drm_edid helper for drm_detect_monitor_audio()
      drm/edid: convert cea_db_iter_edid_begin() to drm_edid
      drm/edid: convert drm_edid_iter_begin() to drm_edid
      drm/edid: add drm_edid helper for drm_update_tile_info()
      drm/displayid: convert to drm_edid
      drm/edid: convert version_greater() to drm_edid
      drm/i915/reg: fix undefined behavior due to shift overflowing the con=
stant
      drm/i915/dsi: fix VBT send packet port selection for ICL+
      drm/i915/display: stop using BUG()
      drm/i915/regs: split out intel audio register definitions
      drm/i915/client: only include what's needed
      drm/i915/tasklet: separate local hacks around struct tasklet_struct
      drm/i915/drv: drop intel_bios.h include
      drm/i915/utils: throw out unused stuff
      drm/i915/pxp: fix sparse warning for not declared symbol
      drm/i915/overlay: remove redundant GEM_BUG_ON()
      drm/i915/uc: remove accidental static from a local variable
      drm/edid: fix CTA data block collection size for CTA version 3
      drm/edid: abstract cea data block collection size
      drm/edid: add block count and data helper functions for drm_edid
      drm/edid: keep track of alloc size in drm_do_get_edid()
      drm/edid: add new interfaces around struct drm_edid
      drm/probe-helper: abstract .get_modes() connector helper call
      drm/i915/bios: use dvi and hdmi support helpers
      drm/i915/bios: no need to pass i915 to parse_ddi_port()
      drm/i915/bios: split ddi port parsing and debug printing
      drm/i915/wm: move wm state verification to intel_pm.c
      drm/i915/dpll: move shared dpll state verification to intel_dpll_mgr.=
c
      drm/i915/mpllb: use I915_STATE_WARN() for state mismatch warnings
      drm/i915/mpllb: move mpllb state check to intel_snps_phy.c
      drm/i915/display: split out modeset verification code
      drm/i915/display: split out crtc state dump to a separate file
      drm/i915/display: change who adds [] around crtc state dump context s=
tring
      drm/i915/display: rename dev_priv -> i915 in crtc state dump
      drm/i915/display: some struct drm_i915_private *i915 conversions
      drm/i915/display: split out hw state readout and sanitize
      drm/i915/display: convert modeset setup to struct drm_i915_private *i=
915
      drm/edid: move drm_connector_update_edid_property() to drm_edid.c
      drm/edid: convert drm_connector_update_edid_property() to struct drm_=
edid
      drm/edid: clean up connector update error handling and debug logging
      drm/edid: abstract debugfs override EDID set/reset
      drm/edid: add drm_edid_connector_update()
      drm/probe-helper: add drm_connector_helper_get_modes()
      drm/edid: add drm_edid_raw() to access the raw EDID data
      drm/edid: do invalid block filtering in-place
      drm/edid: add HF-EEODB support to EDID read and allocation
      drm/edid: take HF-EEODB extension count into account
      drm/i915/bios: debug log ddi port info after parsing
      drm/i915: use DISPLAY_VER() instead of accessing match_info directly

Jason A. Donenfeld (1):
      drm/i915/display: Re-add check for low voltage sku for max dp source =
rate

Jason Ekstrand (2):
      dma-buf: Add an API for exporting sync files (v14)
      dma-buf: Add an API for importing sync files (v10)

Jason Wang (2):
      drm/radeon: Fix comment typo
      drm/amdgpu: Fix comment typo

Javier Martinez Canillas (10):
      MAINTAINERS: Add simpledrm driver co-maintainer
      drm/todo: Add entry for converting kselftests to kunit
      fbdev: Restart conflicting fb removal loop when unregistering devices
      fbdev: vesafb: Allow to be built if COMPILE_TEST is enabled
      drm/st7735r: Fix module autoloading for Okaya RH128128T
      drm/ssd130x: Only define a SPI device ID table when built as a module
      firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
      firmware: sysfb: Add sysfb_disable() helper function
      fbdev: Disable sysfb device registration when removing conflicting FB=
s
      Revert "fbdev: vesafb: Allow to be built if COMPILE_TEST is enabled"

Jayshri Pawar (1):
      drm/bridge: cdns-dsi: Add support for pre_enable and post_enable
control functions.

Jesse Zhang (1):
      drm/amdkfd:Fix fw version for 10.3.6

Jessica Zhang (4):
      drm/msm/dpu: Move LM CRC code into separate method
      drm/msm/dpu: Move MISR methods to dpu_hw_util
      drm/msm/dpu: Add MISR register support for interface
      drm/msm/dpu: Add interface support for CRC debugfs

Jian Zhang (1):
      drm/exynos/exynos7_drm_decon: free resources when clk_set_parent() fa=
iled.

Jiang Jian (12):
      drm/display: Remove duplicate 'the' in two places.
      drm/nouveau/mmu: drop unexpected word "the" in the comments
      drm/amdgpu: vm - drop unexpected word "the" in the comments
      drm/prime: drop unexpected word "the" in the comments
      drm/vc4: drop unexpected word "the" in the comments
      drm: panel-orientation-quirks: drop unexpected word "the" in the comm=
ents
      GPU: drm: drop unexpected word "the" in the comments
      gpu/drm/radeon: Fix typo in comments
      drm/amdgpu: drop unexpected word 'for' in comments
      drm/panel: nt35510: Remove duplicate 'the' in two places.
      drm/pl111: drop unexpected word "the" in the comments
      drm/display/selftests: drop extra word 'for' in comments for MST self=
tests

Jianglei Nie (1):
      drm/amdgpu/mes: Fix an error handling path in amdgpu_mes_self_test()

Jiapeng Chong (21):
      drm/nouveau/gr/gf100-: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting

Jiasheng Jiang (1):
      drm: bridge: adv7511: Add check for mipi_dsi_driver_register

Jimmy Kizito (5):
      drm/amd/display: Avoid reading LTTPR caps in non-LTTPR mode.
      drm/amd/display: Fix entry into transient encoder assignment mode.
      drm/amd/display: Maintain consistent mode of operation during
encoder assignment
      drm/amd/display: Disable TBT3 DSC work around by default.
      drm/amd/display: Fix uninitialized variable.

JinZe.Xu (1):
      drm/amd/display: Change HDMI judgement condition.

Jingwen Zhu (1):
      drm/amd/display: set link fec status during init for DCN32

Jiri Vanek (2):
      drm/bridge/tc358775: Return before displaying inappropriate error mes=
sage
      drm/bridge/tc358775: Fix DSI clock division for vsync delay calculati=
on

Jitao Shi (2):
      drm/mediatek: Separate poweron/poweroff from enable/disable and
define new funcs
      drm/mediatek: Keep dsi as LP00 before dcs cmds transfer

Jocelyn Falempe (5):
      drm/mgag200: Add FB_DAMAGE_CLIPS support
      drm/mgag200: Optimize damage clips
      drm/mgag200: Warn once if trying to set start address on broken hardw=
are.
      drm/mgag200: Enable atomic gamma lut update
      drm/ast: Fix black screen when getting out of suspend

Joel Selvaraj (6):
      drm/panel: nt36672a: add backlight support
      dt-bindings: display: novatek, nt36672a: add backlight property
      dt-bindings: vendor-prefixes: Add prefix for EBBG
      dt-bindings: display: Add bindings for EBBG FT8719
      drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro
      drm/panel: introduce ebbg,ft8719 panel

John Harrison (1):
      drm/i915/pvc: Reduce stack usage in reset selftest with extra
blitter engine

John Stultz (2):
      drm/bridge: lt9611: Consolidate detection logic
      drm/bridge: lt9611: Use both bits for HDMI sensing

Jonathan Kim (2):
      drm/amdkfd: fix cu mask for asics with wgps
      drm/amdgpu: fix hive reference leak when reflecting psp topology info

Jonathan Liu (1):
      drm: bridge: icn6211: Adjust clock phase using SYS_CTRL_1

Joseph Greathouse (1):
      drm/amdgpu: Add MODE register to wave debug info in gfx11

Joshua Aberback (1):
      drm/amd/display: Blank for uclk OC in dm instead of dc

Joshua Ashton (1):
      amd/display/dc: Fix COLOR_ENCODING and COLOR_RANGE doing nothing
for DCN20+

Jos=C3=A9 Exp=C3=B3sito (3):
      drm/rect: Add DRM_RECT_INIT() macro
      drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb332()
      drm/doc: Add KUnit documentation

Jos=C3=A9 Roberto de Souza (11):
      drm/i915: Drop has_gt_uc from device info
      drm/i915: Drop has_rc6 from device info
      drm/i915: Drop has_reset_engine from device info
      drm/i915: Drop has_logical_ring_elsq from device info
      drm/i915: Drop has_ddi from device info
      drm/i915: Drop has_dp_mst from device info
      drm/i915: Drop has_psr from device info
      drm/i915/display/fbc: Do not apply WA 22014263786 to DG2
      drm/i915/display: Fix handling of enable_psr parameter
      drm/i915: Call i915_gem_suspend() only after display is turned off
      drm/i915: Drain freed object after suspend display

Jouni H=C3=B6gander (5):
      drm/i915/psr: Use full update In case of area calculation fails
      drm/i915: Ensure damage clip area is within pipe area
      drm/i915/opregion: add function to check if headless sku
      drm/i915: Do not start connector polling if display is disabled
      drm/i915: Do not start connector polling on headless sku

Juha-Pekka Heikkila (2):
      drm/i915: don't leak lmem mapping in vma_evict
      drm/i915/display: Add smem fallback allocation for dpt

Julia Lawall (3):
      drm/nouveau/mmu: fix typo in comment
      drm/i915: fix typos in comments
      drm: fix device_node_continue.cocci warnings

Jun Lei (6):
      drm/amd/display: add new pixel rate programming
      drm/amd/display: Introduce new update_clocks logic
      drm/amd/display: Extend soc BB capabilitiy
      drm/amd/display: update DML1 logic for unbounded req handling
      drm/amd/display: Remove unused variable
      drm/amd/display: Update DML logic for unbounded req handling

Kalyan Thota (1):
      drm/msm/disp/dpu1: add dspp support for sc7280

Kenneth Feng (11):
      drm/amd/amdgpu: align the cg and pg settings
      drm/amd/pm: add interface to deallocate power_context for smu_v13_0_7
      drm/amd/pm: enable BACO on smu_v13_0_7
      drm/amd/pm: update the driver if header for smu_v13_0_7
      drm/amd/pm: enable gfxoff on smu_v13_0_7
      drm/amd/pm: support BAMACO reset on smu_v13_0_7
      drm/amd/pm: ac/dc change for smu_v13_0
      drm/amd/pm: drop the thermal_controller_type check
      drm/amd/pm: enable mode1 reset for smu_v13_0_7
      drm/amd/pm: enable gfx ulv and gpo on smu_v13_0_7
      drm/amd/pm: update driver if header for smu_13_0_7

Kent Russell (2):
      drm/amdgpu: Fix typos in amdgpu_stop_pending_resets
      drm/amdgpu: Fix acronym typo in glossary

Kieran Bingham (1):
      drm: rcar-du: Extend CMM HDSE documentation

Konrad Dybcio (4):
      drm/msm/adreno: Remove dead code
      drm/msm/adreno: Add A619 support
      drm/msm/a6xx: Add speedbin support for A619 GPU
      drm/msm/adreno: Fix up formatting

Krzysztof Kozlowski (2):
      drm/exynos: MAINTAINERS: move Joonyoung Shim to credits
      dt-bindings: remove Joonyoung Shim from maintainers

KuoHsiang Chou (1):
      drm/ast: Fixed the casting issue reported by sparse

Kuogee Hsieh (1):
      dt-bindings: msm: update maintainers list with proper id

LUU HOAI (1):
      drm: rcar-du: Fix Alpha blending issue on Gen3

Lang Yu (3):
      drm/amdkfd: simplify vm_validate_pt_pd_bos
      drm/amdkfd: fix kgd_mem memory leak when importing dmabuf
      drm/amdkfd: remove an unnecessary amdgpu_bo_ref

Laurent Pinchart (2):
      drm: rcar-du: Drop file name from comment header blocks
      drm: rcar-du: Lift z-pos restriction on primary plane for Gen3

Le Ma (2):
      drm/amdgpu/mes: init aggregated doorbell
      drm/amdgpu/mes: ring aggregatged doorbell when mes queue is unmapped

Lee Shawn C (1):
      drm/edid: check for HF-SCDB block

Lei, Jun (1):
      drm/amd/display: Extend soc BB capabilitiy

Leo Li (6):
      drm/amd/display: Implement MPO PSR SU
      drm/amd/display: Use pre-allocated temp struct for bounding box updat=
e
      drm/amdgpu: Check BO's requested pinning domains against its
preferred_domains
      drm/amd/display: Add visualconfirm module parameter
      drm/amd/display: Add dcdebugmask option for disabling MPO
      drm/amd/display: Copy crc_skip_count when duplicating CRTC state

Leslie Shi (1):
      drm/amdgpu: Remove useless amdgpu_display_freesync_ioctl() declaratio=
n

Leung, Martin (1):
      drm/amdgpu/display: Prepare for new interfaces

Likun Gao (4):
      drm/amdgpu: support gfx soft reset for gfx v11
      drm/amdgpu: enable soft reset for gfx 11
      drm/amdgpu: support SDMA soft recovery for sdma v6
      drm/amdgpu: support reset flag set for gpu reset

Liu Ying (17):
      drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_mode_set()
      media: uapi: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
      media: docs: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
      dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding
      drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
      dt-bindings: display: bridge: Add i.MX8qm/qxp display pixel link bind=
ing
      drm/bridge: imx: Add i.MX8qm/qxp display pixel link support
      dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
      drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
      drm/bridge: imx: Add LDB driver helper support
      dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge bin=
ding
      drm/bridge: imx: Add LDB support for i.MX8qxp
      drm/bridge: imx: Add LDB support for i.MX8qm
      dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers
module binding
      MAINTAINERS: add maintainer for DRM bridge drivers for i.MX SoCs
      drm/bridge: fsl-ldb: Fix mode clock rate validation
      drm/bridge: fsl-ldb: Enable split mode for LVDS dual link

Luben Tuikov (1):
      drm/amdgpu: Protect the amdgpu_bo_list list with a mutex v2

Luca Coelho (1):
      drm/i915: remove noisy logs in intel_dp_dsc_get_output_bpp()

Lucas De Marchi (8):
      drm/i915/gem: Make drop_pages() return bool
      drm/i915/pvc: skip all copy engines from aux table invalidate
      drm/i915/pvc: read fuses for link copy engines
      iosys-map: Fix typo in documentation
      agp/intel: Rename intel-gtt symbols
      drm/i915/gt: Re-do the intel-gtt split
      iosys-map: Add per-word read
      iosys-map: Add per-word write

Lukas Bulwahn (1):
      MAINTAINERS: Rectify entry for NVIDIA TEGRA DRM and VIDEO DRIVER

Lv Ruyi (1):
      drm/tegra: vic: Use devm_platform_ioremap_resource()

Lyude Paul (5):
      drm/display/dp_mst: Don't validate port refs in
drm_dp_check_and_send_link_address()
      drm/dp_mst: Get rid of old comment in
drm_atomic_get_mst_topology_state docs
      drm/nouveau/kms: Fix failure path for creating DP connectors
      drm/nouveau/acpi: Don't print error when we get -EINPROGRESS
from pm_runtime
      drm/nouveau: Don't pm_runtime_put_sync(), only
pm_runtime_put_autosuspend()

Maarten Lankhorst (1):
      drm/i915: Use i915_gem_object_ggtt_pin_ww for reloc_iomap

Marco Felsch (2):
      dt-bindings: display: simple: add EDT ETML0700Y5DHA panel
      drm/panel: simple: add ETML0700Y5DHA panel

Marek Vasut (30):
      dt-bindings: display: bridge: ldb: Fill in reg property
      drm/bridge: tc358767: Factor out DSI and DPI RX enablement
      drm/bridge: tc358767: Add DSI-to-(e)DP mode support
      drm: bridge: icn6211: Register macro clean up
      drm/bridge: tc358767: Handle dsi_lanes =3D=3D 0 as invalid
      drm/bridge: tc358767: Report DSI-to-(e)DP as supported
      drm/bridge: tc358767: Make sure Refclk clock are enabled
      drm/bridge: ti-sn65dsi83: Handle dsi_lanes =3D=3D 0 as invalid
      drm/bridge: anx7625: Add missing of_node_put for endpoint
      drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep
      drm/bridge: anx7625: Convert to drm_of_get_data_lanes_count
      drm/bridge: icn6211: Convert to drm_of_get_data_lanes_count_ep
      drm/bridge: lt8912: Convert to drm_of_get_data_lanes_count_ep
      drm/bridge: lt9211: Convert to drm_of_get_data_lanes_count
      drm/bridge: tc358767: Convert to drm_of_get_data_lanes_count
      drm/bridge: tc358775: Convert to drm_of_get_data_lanes_count_ep
      drm/bridge: ti-sn65dsi86: Convert to drm_of_get_data_lanes_count
      drm/msm: Convert to drm_of_get_data_lanes_count
      drm/bridge: rcar: Convert to drm_of_get_data_lanes_count_ep
      drm/bridge: ti-sn65dsi83: Do not cache dsi_lanes and host twice
      drm/bridge: ti-sn65dsi83: Convert to drm_of_get_data_lanes_count
      drm: of: Mark empty drm_of_get_data_lanes_count and
drm_of_get_data_lanes_ep static
      drm/bridge: tc358775: Fix drm_of_get_data_lanes_count_ep conversion
      drm/bridge: rcar: Drop unused variables due to
drm_of_get_data_lanes_count_ep
      drm/msm: Fix convert to drm_of_get_data_lanes_count
      drm/doc: Fix comment typo
      drm/bridge: tc358767: Do not cache dsi_lanes twice
      dt-bindings: lcdif: Add compatible for i.MX8MP
      drm: lcdif: Add support for i.MX8MP LCDIF variant
      drm: bridge: ldb: Drop DE flip from Freescale i.MX8MP LDB bridge

Mario Kleiner (1):
      drm/amd/display: Only use depth 36 bpp linebuffers on DCN display eng=
ines.

Mario Limonciello (2):
      drm/amd: Don't show warning on reading vbios values for SMU13 3.1
      drm/amd: Revert "drm/amd/display: keep eDP Vdd on when eDP
stream is already enabled"

Mark Menzynski (1):
      drm/nouveau: clear output poll workers before nouveau_fbcon_destroy()

Markus Schneider-Pargmann (1):
      dt-bindings: display: mediatek: dpi: Add DP_INTF compatible

Martin Leung (4):
      drm/amd/display: cleaning up smu_if to add future flexibility
      drm/amd/display: Add null check to dc_submit_i2c_oem
      drm/amd/display: Prepare for new interfaces
      drm/amd/display: guard for virtual calling destroy_link_encoders

Mateusz Jo=C5=84czyk (1):
      drm/radeon: avoid bogus "vram limit (0) must be a power of 2" warning

Mateusz Kwiatkowski (1):
      drm/vc4: hdmi: Fix timings for interlaced modes

Matt Roper (31):
      drm/i915/pvc: Read correct RP_STATE_CAP register
      drm/i915/gvt: Use intel_engine_mask_t for ring mask
      drm/i915/pvc: Engine definitions for new copy engines
      drm/i915/pvc: Interrupt support for new copy engines
      drm/i915/pvc: Reset support for new copy engines
      drm/i915/uncore: Reorganize and document shadow and forcewake tables
      drm/i915/pvc: Add forcewake support
      drm/i915/pvc: Add new BCS engines to GuC engine list
      drm/i915/hwconfig: Future-proof platform checks
      drm/i915/pvc: Extract stepping information from PCI revid
      drm/i915/xehp: Use separate sseu init function
      drm/i915/xehp: Drop GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK
      drm/i915/sseu: Simplify gen11+ SSEU handling
      drm/i915/sseu: Don't try to store EU mask internally in UAPI format
      drm/i915/sseu: Disassociate internal subslice mask
representation from uapi
      drm/i915/pvc: Add SSEU changes
      drm/i915/pvc: GuC depriv applies to PVC
      drm/i915/dg2: Correct DSS check for Wa_1308578152
      drm/i915: More PVC+DG2 workarounds
      drm/i915/xehp: Correct steering initialization
      drm/i915/pvc: Add register steering
      drm/i915/pvc: Adjust EU per SS according to HAS_ONE_EU_PER_FUSE_BIT()
      drm/i915/pvc: Add recommended MMIO setting
      drm/i915/gt: Move multicast register handling to a dedicated file
      drm/i915/gt: Cleanup interface for MCR operations
      drm/i915: Correct duplicated/misplaced GT register definitions
      drm/i915: Prefer "XEHP_" prefix for registers
      drm/i915: DG2 and ATS-M device ID updates
      drm/i915/gt: Add general DSS steering iterator to intel_gt_mcr
      drm/i915/dg2: Add Wa_15010599737
      drm/i915: Correct ss -> steering calculation for pre-Xe_HP platforms

Matthew Auld (16):
      drm/i915: tweak the ordering in cpu_write_needs_clflush
      drm/doc: add rfc section for small BAR uapi
      drm/i915/uapi: add probed_cpu_visible_size
      drm/i915/uapi: expose the avail tracking
      drm/i915: remove intel_memory_region avail
      drm/i915/uapi: apply ALLOC_GPU_ONLY by default
      drm/i915/uapi: add NEEDS_CPU_ACCESS hint
      drm/i915/error: skip non-mappable pages
      drm/i915/uapi: tweak error capture on recoverable contexts
      drm/i915/selftests: skip the mman tests for stolen
      drm/i915/selftests: ensure we reserve a fence slot
      drm/i915/ttm: handle blitter failure on DG2
      drm/i915/ttm: disallow CPU fallback mode for ccs pages
      drm/i915: turn on small BAR support
      drm/i915/ttm: fix sg_table construction
      drm/i915/ttm: fix 32b build

Matthew Brost (1):
      drm/i915/guc: Support programming the EU priority in the GuC descript=
or

Mauro Carvalho Chehab (2):
      drm/amdgpu/amdgpu_dm: fix kernel-doc markups
      drm/amd/amd_shared.h: Add missing doc for PP_GFX_DCS_MASK

Maxime Ripard (2):
      drm/vc4: kms: Warn if clk_set_min_rate fails
      drm/vc4: kms: Use maximum FIFO load for the HVS clock rate

Ma=C3=ADra Canal (12):
      drm/amd/display: Remove return value of Calculate256BBlockSizes
      drm/amd/display: Remove duplicate code across dcn30 and dcn31
      drm/amd/display: Remove unused variables from vba_vars_st
      drm/amdgpu: Write masked value to control register
      drm/amd/display: Change get_pipe_idx function scope
      drm/amd/display: Remove unused clk_src variable
      drm/amd/display: Remove unused
dml32_CalculatedoublePipeDPPCLKAndSCLThroughput function
      drm/amd/display: Remove unused NumberOfStates variable
      drm/amd/display: Remove unused variables from dml_rq_dlg_get_dlg_para=
ms
      drm/amd/display: Remove unused variables from dcn10_stream_encoder
      drm/amd/display: Remove unused MaxUsedBW variable
      drm/amd/display: Remove unused struct freesync_context

Meenakshikumar Somasundaram (1):
      drm/amd/display: Remove configuration option for dpia hpd delay

Melissa Wen (8):
      MAINTAINERS: add Melissa to V3D maintainers
      drm/amd/display: correct check of coverage blend mode
      drm/amd/display: move dcn31_update_soc_for_wm_a func to dml fpu folde=
r
      drm/amd/display: fix soft-fp vs hard-fp on DCN 3.1 family for powerpc
      drm/amd/display: remove useless FPU protection wrapper from
dcn31_resource file
      drm/amd/display: move FPU code on dcn21 clk_mgr
      drm/amd/display: move FPU code from dcn30 clk mgr to DML folder
      drm/amd/display: move FPU code from dcn301 clk mgr to DML folder

Miaoqian Lin (5):
      drm/meson: Fix refcount leak in meson_encoder_hdmi_init
      drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
      drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
      drm/virtio: Fix NULL vs IS_ERR checking in virtio_gpu_object_shmem_in=
it
      drm/mcde: Fix refcount leak in mcde_dsi_bind

Michael Strauss (7):
      drm/amd/display: Initialize lt_settings on instantiation
      drm/amd/display: Add pixel rate div calcs and programming
      drm/amd/display: Use correct DTO_SRC_SEL for 128b/132b encoding
      drm/amd/display: Use correct clock source constructor for DCN314
      drm/amd/display: Add OTG/ODM functions
      drm/amd/display: Add missing AUDIO_DTO_SEL reg field
      drm/amd/display: Fix dpstreamclk programming

Michel D=C3=A4nzer (3):
      drm/bochs: Explicitly include linux/module.h
      drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl
      drm/amd/display: Ensure valid event timestamp for cursor-only commits

Mikko Perttunen (21):
      dt-bindings: host1x: Add iommu-map property
      dt-bindings: Add bindings for Tegra234 Host1x and VIC
      dt-bindings: host1x: Fix bracketing in example
      gpu: host1x: Add context device management code
      gpu: host1x: Program context stream ID on submission
      drm/tegra: falcon: Set DMACTX field on DMA transactions
      drm/tegra: nvdec: Fix TRANSCFG register offset
      drm/tegra: Support context isolation
      drm/tegra: Implement stream ID related callbacks on engines
      gpu: host1x: Deduplicate hardware headers
      gpu: host1x: Simplify register mapping and add common aperture
      gpu: host1x: Program virtualization tables
      gpu: host1x: Allow reset to be missing
      gpu: host1x: Program interrupt destinations on Tegra234
      gpu: host1x: Tegra234 device data and headers
      gpu: host1x: Rewrite job opcode sequence
      gpu: host1x: Add MLOCK release code on Tegra234
      gpu: host1x: Use RESTART_W to skip timed out jobs on Tegra186+
      drm/tegra: vic: Add Tegra234 support
      gpu: host1x: Initialize syncval in channel_submit()
      gpu: host1x: Generalize host1x_cdma_push_wide()

Minghao Chi (2):
      drm/bridge: simplify the return expression of ps8640_bridge_host_atta=
ch
      drm/virtio: simplify the return expression

Mitchell Augustin (1):
      amdgpu: amdgpu_device.c: Removed trailing whitespace

Mohammad Zafar Ziya (1):
      drm/amdgpu/jpeg2: Add jpeg vmid update under IB submit

Muhammad Ansari (1):
      drm/amd/display: Helper function for ALPM initialization

Nancy.Lin (7):
      dt-bindings: display: mediatek: add vdosys1 RDMA definition for mt819=
5
      drm/mediatek: Add display MDP RDMA support for MT8195
      drm/mediatek: Add display merge advance config API for MT8195
      drm/mediatek: Add display merge start/stop API for cmdq support
      drm/mediatek: Add display merge mute/unmute support for MT8195
      drm/mediatek: Add display merge async reset control
      drm/mediatek: Add mediatek-drm plane color encoding info

Nathan Chancellor (2):
      drm/i915: Fix CFI violation with show_dynamic_id()
      drm/amd/display: Fix indentation in dcn32_get_vco_frequency_from_reg(=
)

Nicholas Kazlauskas (9):
      Revert "drm/amd/display: Pass the new context into disable OTG WA"
      drm/amd/display: Copy hfvsif_infopacket when stream update
      drm/amd/display: Fix stream->link_enc unassigned during stream remova=
l
      drm/amd/display: Guard against ddc_pin being NULL for AUX
      drm/amd/display: Remove incorrect ASSERT check for link_enc
      drm/amd/display: Guard against NULL link encoder in log hw state
      drm/amd/display: Add enable/disable FIFO callbacks to stream setup
      drm/amd/display: Fix OPTC function pointers for DCN314
      drm/amd/display: Guard against zero memory channels

Niels Dossche (1):
      drm: use ENOMEM for drmm_kzalloc allocation failures

Niranjana Vishwanathapura (5):
      drm/i915: Do not access rq->engine without a reference
      Revert "drm/i915: Hold reference to intel_context over life of
i915_request"
      drm/doc/rfc: VM_BIND feature design document
      drm/i915: Update i915 uapi documentation
      drm/doc/rfc: VM_BIND uapi definition

Nirmoy Das (5):
      drm/i915: return -EIO on lmem setup failure
      drm/i915: determine lmem_size properly
      drm/i915: gracefully error out on platform with small-bar
      drm/i915: Individualize fences before adding to dma_resv obj
      drm/i915: Fix a lockdep warning at error capture

N=C3=ADcolas F. R. A. Prado (1):
      drm/bridge: anx7625: Zero error variable when panel bridge not presen=
t

Oliver Logush (1):
      drm/amd/display: Drop unused privacy_mask setters and getters

Patrik Jakobsson (8):
      drm/gma500: Use gma_ prefix for our i2c abstraction
      drm/gma500: Make gma_i2c_chan a subclass of i2c_adapter
      drm/gma500: Make cdv lvds use ddc adapter from drm_connector
      drm/gma500: Make cdv hdmi use ddc adapter from drm_connector
      drm/gma500: Make psb lvds use ddc adapter from drm_connector
      drm/gma500: Make cdv crt use ddc adapter from drm_connector
      drm/gma500: Make oaktrail lvds use ddc adapter from drm_connector
      drm/gma500: Read EDID from the correct i2c adapter

Paul Cercueil (1):
      drm/ingenic: Use the highest possible DMA burst size

Paul Kocialkowski (1):
      drm: Add support for the LogiCVC display controller

Peter Geis (2):
      dt-bindings: display: panel: feiyang, fy07024di26a30d: make
reset gpio optional
      drm/panel: feiyang-fy07024di26a30d: make reset gpio optional

Peter Robinson (3):
      dt-bindings: gpu: v3d: Add BCM2711's compatible
      drm/v3d: Get rid of pm code
      drm/v3d: Add support for bcm2711

Phil Elwell (1):
      drm/vc4: hdmi: Disable audio if dmas property is present but empty

Philip Oberfichtner (2):
      dt-bindings: display: simple: Add DataImage FG1001L0DSSWMG01
compatible string
      drm/panel: simple: Add DataImage FG1001L0DSSWMG01 panel support

Philip Yang (16):
      drm/amdkfd: Add queue to MES if it becomes active
      drm/amdkfd: Free queue after unmap queue success
      Revert "drm/amdkfd: Free queue after unmap queue success"
      drm/amdkfd: Add KFD SMI event IDs and triggers
      drm/amdkfd: Enable per process SMI event
      drm/amdkfd: Add GPU recoverable fault SMI event
      drm/amdkfd: Add migration SMI event
      drm/amdkfd: Add user queue eviction restore SMI event
      drm/amdkfd: Add unmap from GPU SMI event
      drm/amdkfd: Asynchronously free smi_client
      drm/amdkfd: Bump KFD API version for SMI profiling event
      drm/amdkfd: Correct mmu_notifier_get failure handling
      drm/amdkfd: Process notifier release callback don't take mutex
      drm/amdgpu: Allow TTM to evict svm bo from same process
      drm/amdkfd: Set svm range max pages
      drm/amdkfd: Split giant svm range

Prike Liang (1):
      drm/amdkfd: correct the MEC atomic support firmware checking for GC 1=
0.3.7

Priyanka Dandamudi (1):
      drm/i915: Add lmem_bar_size modparam

Qingqing Zhuo (2):
      drm/amd/display: update topology_update_input_v3 struct
      drm/amd/display: Fix DC warning at driver load

Radhakrishna Sripada (2):
      drm/i915/mtl: Add MeteorLake platform info
      drm/i915/mtl: Add MeteorLake PCI IDs

Rahul Kumar (1):
      drm/amdgpu/display/dc: Fix null pointer exception

Rajneesh Bhardwaj (1):
      drm/amdgpu: Refactor code to handle non coherent and uncached

Ramalingam C (1):
      uapi/drm/i915: Document memory residency and Flat-CCS capability of o=
bj

Ramesh Errabolu (4):
      drm/amdkfd: Define config HSA_AMD_P2P to support peer-to-peer
      drm/amdgpu: Add peer-to-peer support among PCIe connected AMD GPUs
      drm/amdkfd: Extend KFD device topology to surface peer-to-peer links
      drm/amdkfd: Remove field io_link_count from struct kfd_topology_devic=
e

Randy Dunlap (1):
      drm: xlnx: add <linux/io.h> for readl/writel

Ren Zhijie (1):
      drm/rockchip: Fix Kconfig dependencies for display-port encoders

Rex-BC Chen (1):
      drm/mediatek: Add MT8186 DSI compatible for mtk_drm_drv.c

Rob Clark (16):
      Merge tag 'drm-msm-fixes-2022-06-28' into msm-next-staging
      drm/msm: Make msm_gem_free_object() static
      drm: Add DRM_GEM_FOPS
      drm/msm: Expose client engine utilization via fdinfo
      drm/msm: Fix fence rollover issue
      drm/msm/adreno: Allow larger address space size
      drm/msm: Fix %d vs %u
      drm/msm/gpu: Capture all BO addr+size in devcore
      drm/msm/gpu: Add GEM debug label to devcore
      drm/msm/gem: Drop obj lock in msm_gem_free_object()
      drm/msm/adreno: Defer enabling runpm until hw_init()
      drm/msm: Deprecate MSM_BO_UNCACHED harder
      drm/msm: Switch to pfn mappings
      drm/msm: Make enable_eviction flag static
      drm/msm/mdp5: Fix global state lock backoff
      drm/msm/dpu: Fix for non-visible planes

Rob Herring (1):
      dt-bindings: display: ingenic,jz4780-hdmi: Drop undocumented 'ddc-i2c=
-bus'

Robert Foss (2):
      Revert "drm/bridge: anx7625: Use DPI bus type"
      Revert "dt-bindings:drm/bridge:anx7625: add port@0 property"

Robin Chen (2):
      drm/amd/display: refactor dirty rect dmub command decision
      drm/amd/display: Disable PSRSU when DSC enabled on the specific sink

Robin Murphy (2):
      gpu: host1x: Register context bus unconditionally
      drm/tegra: Include DMA API header where used

Rodrigo Siqueira (44):
      drm/amd/display: Remove duplicated macro
      drm/amd/display: Reduce frame size in the bouding box for DCN20
      drm/amd/display: Reduce frame size in the bouding box for DCN301
      drm/amd/display: Reduce frame size in the bouding box for DCN31/316
      drm/amd/display: Reduce frame size in the bouding box for DCN21
      drm/amd/display: Drop unnecessary guard from DC resource
      drm/amd/display: Check minimum disp_clk and dpp_clk debug option
      drm/amd/display: Get VCO frequency from registers
      drm/amd/display: Update hook dcn32_funcs
      drm/amd/display: Drop duplicate define
      drm/amd/display: Fix __umoddi3 undefined for 32 bit compilation
      drm/amd/display: Fix __floatunsidf undefined for 32 bit compilation
      drm/amd/display: Fix __muldf3 undefined for 32 bit compilation
      drm/amd/display: Fix __nedf2 undefined for 32 bit compilation
      drm/amd/display: Add missing registers for ACP
      drm/amd/display: Use two pixel per container for k1/k2 div
      drm/amd/display: Add basic infrastructure for enabling FAMS
      drm/amd/display: Add SubVP control lock
      drm/amd/display: Add minimal pipe split transition state
      drm/amd/display: Fix refresh rate issue on Club 3D
      drm/amd/display: Create a file dedicated to planes
      drm/amd/display: Create a file dedicated for CRTC
      drm/amd/display: Fix hard hang if DSC is disabled
      drm/amd/display: Drop FPU flags from dcn32_clk_mgr
      drm/amd/display: Move populate phaton function to dml
      drm/amd/display: Move predict pipe to dml fpu folder
      drm/amd/display: Move insert entry table to the FPU code
      drm/amd/display: Move phanton stream to FPU code
      drm/amd/display: Move SubVP functions to dcn32_fpu
      drm/amd/display: Move wm and dlg calculation to FPU code
      drm/amd/display: Move dlg params calculation
      drm/amd/display: Move ntuple to insert entry
      drm/amd/display: Move bounding box to FPU folder
      drm/amd/display: Drop FPU flags from dcn32 Makefile
      drm/amd/display: Create dcn321_fpu file
      drm/amd/display: Drop FPU code from dcn321 resource
      drm/amd/display: Drop unnecessary FPU flags on dcn302 files
      drm/amd/display: Remove FPU operations from dcn201 resources
      drm/amd/display: Move mclk calculation function to DML
      drm/amd/display: Create patch bounding box function for isolate FPU
      drm/amd/display: Remove FPU flags from DCN30 Makefile
      drm/amd/display: Add reinstate dram in the FPO logic
      drm/amd/display: Reduce stack size in the mode support function
      drm/amd/display: Fix a compilation failure on PowerPC caused by FPU c=
ode

Roman Li (14):
      drm/amd/display: Cap OLED brightness per max frame-average luminance
      drm/amdgpu: Add reg headers for DCN314
      drm/amd/display: Add DCN314 IRQ services
      drm/amd/display: Add DCN314 clock manager
      drm/amd/display: Add DCN314 DC resources
      drm/amd/display: Add DCN314 DML calculation support
      drm/amd/display: Add DCN314 version identifiers
      drm/amd/display: Enable DCN314 in DC
      drm/amd/display: Add DMUB support for DCN314
      drm/amd/display: Enable DCN314 in DM
      drm/amd/display: Disable dmcu fw loading for dcn314
      drm/amdgpu: add dm ip block for dcn 3.1.4
      drm/amd/display: Fix dc_version detect for dcn314
      drm/amd/display: Specify supported modifiers for dcn314

Roy Sun (1):
      drm/amdgpu: Fix the incomplete product number

Ruijing Dong (5):
      drm/amdgpu/vcn: add unified queue ib test
      drm/amdgpu/vcn: support unified queue only in vcn4
      drm/amdgpu/vcn: adjust unified queue code format
      drm/amdgpu/vcn: fix no previous prototype warning
      drm/amdgpu: add comment to HW_IP_VCN_ENC type

Ruili Ji (1):
      drm/amdgpu: To flush tlb for MMHUB of RAVEN series

Saaem Rizvi (2):
      drm/amd/display: Add SMU logging code
      drm/amd/display: Removing assert statements for Linux

Sam Ravnborg (1):
      drm/bridge: ti-sn65dsi86: Use atomic variants of drm_bridge_funcs

Samson Tam (10):
      drm/amd/display: do not override CURSOR_REQ_MODE when SubVP is not en=
abled
      drm/amd/display: Updates for OTG and DCCG clocks
      drm/amd/display: Match dprefclk with clk registers
      drm/amd/display: Fix comments
      drm/amd/display: Apply ODM 2:1 policy for single display configuratio=
n
      drm/amd/display: Fix windowed MPO video with ODM combine for DCN32
      drm/amd/display: fix unnecessary pipe split playing NV12 1080p MPO vi=
deo
      drm/amd/display: Fix lag when moving windowed MPO across display
using ODM 2:1 combine
      drm/amd/display: Fix two MPO videos in single display ODM combine mod=
e
      drm/amd/display: Add missing ODM 2:1 policy logic

Samuel Holland (6):
      drm/sun4i: sun8i-hdmi-phy: Use of_device_get_match_data
      drm/sun4i: sun8i-hdmi-phy: Use devm_platform_ioremap_resource
      drm/sun4i: sun8i-hdmi-phy: Used device-managed clocks/resets
      drm/sun4i: sun8i-hdmi-phy: Support multiple custom PHY ops
      drm/sun4i: sun8i-hdmi-phy: Separate A83T and H3 PHY ops
      drm/sun4i: sun8i-hdmi-phy: Group PHY ops functions by generation

Saurabh Sengar (1):
      drm/hyperv : Removing the restruction of VRAM allocation with PCI bar=
 size

Shah Dharati (1):
      drm/amd/display: Fix monitor flash issue

Shikai Guo (1):
      drm/amd/pm: Add get_gfx_off_status interface for yellow carp

Slark Xiao (1):
      drm/amd: Fix typo 'the the' in comment

Somalapuram Amaranath (2):
      drm/amdgpu: save the reset dump register value for devcoredump
      drm/amdgpu: adding device coredump support

Sonny Jiang (6):
      drm/amdgpu: limiting AV1 to first instance on VCN4 decode
      drm/amdgpu: fix a vcn4 boot poll bug in emulation mode
      drm/amdgpu: add VCN function in NBIO v7.7
      drm/amdgpu: add VCN_4_0_2 firmware support
      drm/amdgpu: vcn_4_0_2 video codec query
      drm/amdgpu: enable VCN cg and JPEG cg/pg

Souptick Joarder (HPE) (1):
      drm/amd/display: Removed unused variable ret

Stanley.Yang (5):
      drm/amdgpu/pm: support mca_ceumc_addr in ecctable
      drm/amdgpu: print umc correctable error address
      drm/amdgpu/pm: adjust EccInfo_t struct
      drm/amdgpu: Only send ras feature for gfx block
      drm/amdgpu: skip whole ras bad page framework on sriov

Stephen Boyd (1):
      drm/msm/dp: Remove encoder pointer from struct msm_dp

Stephen Kitt (5):
      drm/panel: sony-acx565akm: Use backlight helpers
      drm/panel: panel-dsi-cm: Use backlight helpers
      drm/panel: panel-asus-z00t-tm5p5-n35596: Use backlight helper
      drm: shmobile: Use backlight helper
      drm/bridge: parade-ps8622: Use backlight helper

Stuart Summers (3):
      drm/i915/pvc: Remove additional 3D flags from PIPE_CONTROL
      drm/i915/pvc: Add initial PVC workarounds
      drm/i915: Add extra registers to GPU error dump

Stylon Wang (1):
      drm/amd/display: Fix new dmub notification enabling in DM

Sung Joon Kim (2):
      drm/amd/display: Fix eDP not light up on resume
      drm/amd/display: Turn off internal backlight when plugging
external monitor

Svyatoslav Ryhel (2):
      dt-bindings: display: simple: Add HannStar HSD101PWW2
      drm/panel: simple: Add support for HannStar HSD101PWW2 panel

Swathi Dhanavanthri (2):
      drm/i915/dg2: Add workaround 22014600077
      drm/i915/dg2: Extend Wa_22010954014 to DG2-G11 and DG2-G12

Taimur Hassan (3):
      drm/amd/display: Update de-tile override to anticipate pipe splitting
      drm/amd/display: Loop through all pipes for DET allocation
      drm/amd/display: Reset pipe count when iterating for DET override

Tales Lelo da Aparecida (1):
      drm/vkms: check plane_composer->map[0] before using it

Thierry Reding (1):
      dt-bindings: display: tegra: Convert to json-schema

Thomas Hellstr=C3=B6m (2):
      drm/i915: Improve on suspend / resume time with VT-d enabled
      drm/i915: Fix vm use-after-free in vma destruction

Thomas Zimmermann (39):
      drm: Always warn if user-defined modes are not supported
      drm/client: Look for command-line modes first
      drm/client: Don't add new command-line mode
      drm/mgag200: Acquire I/O lock while reading EDID
      drm/mgag200: Fail on I2C initialization errors
      drm/mgag200: Implement connector's get_modes with helper
      drm/mgag200: Switch I2C code to managed cleanup
      drm/mgag200: Remove struct mga_connector
      drm/mgag200: Test memory requirements in drm_mode_config_funcs.mode_v=
alid
      drm/mgag200: Split up connector's mode_valid helper
      drm/udl: Set VGA connector
      drm/gem: Share code between drm_gem_fb_{begin,end}_cpu_access()
      drm/gem: Ignore color planes that are unused by framebuffer format
      drm/gem-vram: Share code between GEM VRAM's _{prepare, cleanup}_fb()
      drm/gem-vram: Ignore planes that are unused by framebuffer format
      drm/gem: Warn on trying to use a non-existing framebuffer plane
      drm/mgag200: Remove special case for G200SE with <2 MiB
      drm/mgag200: Initialize each model in separate function
      drm/mgag200: Move PCI-option setup into model-specific code
      drm/mgag200: Call mgag200_device_probe_vram() from per-model init
      drm/mgag200: Implement new init logic
      drm/mgag200: Add struct mgag200_device_info
      drm/mgag200: Store HW_BUG_NO_STARTADD flag in device info
      drm/mgag200: Store maximum resolution and memory bandwidth in device =
info
      drm/mgag200: Store vidrst flag in device info
      drm/mgag200: Store positions of I2C data and clock bits in device inf=
o
      drm/ast: Support multiple outputs
      drm/mgag200: Include <linux/vmalloc.h> for G200 BIOS code
      Merge drm/drm-next into drm-misc-next
      drm/aperture: Run fbdev removal before internal helpers
      drm/hyperv-drm: Include framebuffer and EDID headers
      MAINTAINERS: Broaden scope of simpledrm entry
      drm: Implement DRM aperture helpers under video/
      drm/fb-helper: Fix out-of-bounds access
      drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()
      drm/simple-kms: Use drm_atomic_helper_check_crtc_state()
      drm/ast: Enable primary plane with CRTC
      Merge drm/drm-next into drm-misc-next-fixes
      drm/mgag200: Don't read-back PCI option register before writing

Tim Huang (2):
      drm/amdgpu/pm: correct the firmware flag address for SMU IP v13.0.4
      drm/amdgpu/pm: remove the repeated EnableGfxImu message sending

Timur Tabi (1):
      drm/nouveau: fix another off-by-one in nvbios_addr

Tom Rix (6):
      drm/nouveau/fifo/gv100-: set gv100_fifo_runlist storage-class to stat=
ic
      drm/qxl: remove qxl_log_level global
      drm/amd/display: Remove unused globals FORCE_RATE and FORCE_LANE_COUN=
T
      drm/amd/display: change to_dal_irq_source_dnc32() storage class
specifier to static
      drm/vc4: change vc4_dma_range_matches from a global to static
      drm/i915/display: clean up comments

Tvrtko Ursulin (14):
      drm/i915: Don't use DRM_DEBUG_WARN_ON for unexpected l3bank/mslice co=
nfig
      drm/i915: Don't use DRM_DEBUG_WARN_ON for ring unexpectedly not idle
      drm/i915: Enable THP on Icelake and beyond
      drm/i915: Only setup private tmpfs mount when needed and fix logging
      Revert "drm/i915: Drop has_psr from device info"
      Revert "drm/i915: Drop has_dp_mst from device info"
      Revert "drm/i915: Drop has_ddi from device info"
      Revert "drm/i915: Drop has_logical_ring_elsq from device info"
      Revert "drm/i915: Drop has_reset_engine from device info"
      Revert "drm/i915: Drop has_rc6 from device info"
      Revert "drm/i915: Drop has_gt_uc from device info"
      Merge tag 'drm-intel-next-2022-05-20' of
git://anongit.freedesktop.org/drm/drm-intel into drm-intel-gt-next
      drm/i915: Improve user experience and driver robustness under
SIGINT or similar
      drm/i915/fdinfo: Don't show engine classes not present

Umesh Nerlige Ramappa (4):
      i915/guc/reset: Make __guc_reset_context aware of guilty engines
      drm/i915/reset: Add additional steps for Wa_22011802037 for
execlist backend
      i915/perf: Replace DRM_DEBUG with driver specific drm_dbg call
      i915/perf: Disable OA sseu config param for gfx12.50+

Vandita Kulkarni (1):
      drm/i915/dg2: Support 4k@30 on HDMI

Vijendar Mukunda (4):
      drm/amdgpu: fix for coding style issues
      drm/amdgpu: add dmi check for jadeite platform
      drm/amdgpu: create I2S platform devices for Jadeite platform
      drm/amdgpu: fix i2s_pdata out of bound array access

Ville Syrj=C3=A4l=C3=A4 (66):
      drm/i915: Rename block_size()/block_offset()
      drm/i915: Pass intel_connector to intel_vrr_is_capable()
      drm/i915: Extract intel_edp_fixup_vbt_bpp()
      drm/i915/pps: Split pps_init_delays() into distinct parts
      drm/i915/pps: Introduce pps_delays_valid()
      drm/i915/pps: Don't apply quirks/etc. to the VBT PPS delays if
they haven't been initialized
      drm/i915/pps: Stash away original BIOS programmed PPS delays
      drm/i915/pps: Split PPS init+sanitize in two
      drm/i915/pps: Reinit PPS delays after VBT has been fully parsed
      drm/i915/pps: Keep VDD enabled during eDP probe
      drm/i915/bios: Split parse_driver_features() into two parts
      drm/i915/bios: Split VBT parsing to global vs. panel specific parts
      drm/i915/bios: Split VBT data into per-panel vs. global parts
      drm/i915/bios: Determine panel type via PNPID match
      drm/edid: Extract drm_edid_decode_mfg_id()
      drm/i915: Split shared dpll .get_dplls() into compute and get phases
      drm/i915: Clean up DPLL related debugs
      drm/i915: Extract PIPE_CONF_CHECK_TIMINGS()
      drm/i915: Extract PIPE_CONF_CHECK_RECT()
      drm/i915: Adjust intel_modeset_pipe_config() & co. calling convention
      drm/i915: s/pipe_config/crtc_state/
      drm/i915: Improve modeset debugs
      drm/i915: Check hw.enable and hw.active in intel_pipe_config_compare(=
)
      drm/i915: Require an exact DP link freq match for the DG2 PLL
      drm/i915: Parse VRR capability from VBT
      drm/i915: Print out rejected fixed modes
      drm/i915: Accept more fixed modes with VRR panels
      drm/i915/bios: Fix aggressiveness typos
      drm/i915/bios: Define more BDB contents
      drm/i915: Treat DMRRS as static DRRS
      drm/i915: Initialize eDP source rates after per-panel VBT parsing
      drm/i915: Update eDP fast link training link rate parsing
      drm/i915: Parse max link rate from the eDP BDB block
      drm/i915: Extract intel_crtc_dotclock()
      drm/i915: Introduce struct iclkip_params
      drm/i915: Skip FDI vs. dotclock sanity check during readout
      drm/i915: Extract intel_sanitize_fifo_underrun_reporting()
      drm/i915: Sanitize underrun reporting before turning off any pipes
      drm/i915: Remove bogus LPT iCLKIP WARN
      drm/i915/bios: Move panel_type stuff out of parse_panel_options()
      drm/i915/bios: Don't parse the DPS panel type when the VBT does
not have it
      drm/i915/bios: Introduce panel_bits() and panel_bool()
      drm/i915: Implement w/a 22010492432 for adl-s
      drm: Drop drm_edid.h from drm_crtc.h
      drm: Drop drm_framebuffer.h from drm_crtc.h
      drm: Drop drm_blend.h from drm_crtc.h
      drm: Drop drm_connector.h from drm_crtc.h
      drm/xlnx: Fix build failure due to missing include
      drm/i915: Eliminate PIPECONF RMWs from .color_commit()
      drm/i915: Move dbuf details to INTEL_INFO->display
      drm/i915: Move pipe_offsets[] & co. to INTEL_INFO->display
      drm/i915: Move display_mmio_offset under INTEL_INFO->display
      drm/i915: Make pipe_offsets[] & co. u32
      drm/i915: s/_CURSOR2/_MMIO_CURSOR2//
      drm/i915: Use _MMIO_TRANS2() where appropriate
      drm/i915: Use _MMIO_PIPE2() where appropriate
      drm/i915: Get rid of XE_LPD_CURSOR_OFFSETS
      drm/i915: Move the color stuff under INTEL_INFO->display
      drm: Remove unnecessary junk from drm_crtc.h
      drm/vmwgfx: Stop using 'TRUE'
      drm: Remove linux/fb.h from drm_crtc.h
      drm: Remove linux/media-bus-format.h from drm_crtc.h
      drm: Remove linux/i2c.h from drm_crtc.h
      drm/i915: Use short PCH names consistently
      drm/i915: Nuke PCH_MCC
      drm/i915: Nuke PCH_JSP

Vinay Belgaumkar (4):
      drm/i915/guc/rc: Use i915_probe_error instead of drm_error
      drm/i915: Add global forcewake request to drpc
      drm/i915/guc/slpc: Use non-blocking H2G for waitboost
      drm/i915/guc/slpc: Add a new SLPC selftest

Vivek Kasireddy (2):
      drm/i915/tc: Don't default disconnected legacy Type-C ports to
TBT mode (v2)
      udmabuf: Set the DMA mask for the udmabuf device (v2)

Vladimir Lypak (2):
      drm/msm/dsi: Use single function for reset
      drm/msm/mdp5: Add perf data for MDP v1.16

Vladimir Stempen (1):
      drm/amd/display: Disable GPUVM in IP resource configuration

Wan Jiabing (1):
      drm/msm: Use div64_ul instead of do_div

Wayne Lin (12):
      drm/amd/display: Detect dpcd_rev when hotplug mst monitor
      drm/amd/display: Revert "drm/amd/display: Add flag to detect
dpms force off during HPD"
      drm/amd/display: Revert "drm/amd/display: turn DPMS off on
connector unplug"
      drm/amd/display: Release remote dc_sink under mst scenario
      drm/amd/display: Take emulated dc_sink into account for HDCP
      drm/amd/display: Clear edid when unplug mst connector
      drm/amd/display: Grab dc_lock before detecting link
      drm/amd/display: Support vertical interrupt 0 for all dcn ASIC
      drm/amd/display: Expose function reset_cur_dp_mst_topology
      drm/amd/display: fix trigger_hotplug to support mst case
      drm/amd/display: Add is_mst_connector debugfs entry
      drm/amd/display: Add tags for indicating mst progress status

Wenjing Liu (7):
      drm/amd/display: add DP sanity checks during enable stream
      drm/amd/display: lower lane count first when CR done partially fails =
in EQ
      drm/amd/display: Enrich the log in MST payload update
      drm/amd/display: rename lane_settings to hw_lane_settings
      drm/amd/display: extract update stream allocation to link_hwss
      drm/amd/display: make enable link independent from verified link caps
      drm/amd/display: remove number of DSC slices override in DML

Wesley Chalmers (1):
      drm/amd/display: Check for DP2.0 when checking ODM combine

Xiaohui Zhang (2):
      drm/radeon: integer overflow in radeon_mode_dumb_create()
      drm/radeon: Initialize fences array entries in radeon_sa_bo_next_hole

Xiaojian Du (6):
      drm/amdgpu: add CSDMA reg offsets for NBIO v7.7.0
      drm/amdgpu: fix sdma doorbell issue on SDMA v6.0 and NBIO v7.7
      drm/amdgpu: send msg to IMU for the front-door loading
      drm/amdgpu: add header files for MP 13.0.4
      drm/amdgpu: add files for PSP 13.0.4
      drm/amdgpu: enable support for psp 13.0.4 block

Xiaomeng Tong (1):
      virtio-gpu: fix a missing check to avoid NULL dereference

Xin Ji (4):
      dt-bindings:drm/bridge:anx7625: add port@0 property
      drm/bridge: anx7625: Use DPI bus type
      dt-bindings:drm/bridge:anx7625: add port@0 property
      drm/bridge: anx7625: Use DPI bus type

Xinlei Lee (5):
      drm/mediatek: Modify dsi funcs to atomic operations
      drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff functi=
on
      dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml
      dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT81=
86
      drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c

Yang Li (5):
      drm/rockchip: remove unneeded semicolon from vop2 driver
      drm: Remove unnecessary print function dev_err()
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: clean up some inconsistent indenting
      drm/amd/display: remove unneeded semicolon

Yang Wang (2):
      drm/amd/pm: fix driver reload SMC firmware fail issue for smu13
      drm/amd/pm: skip to set mp1 unload state in special case

Yang Yingliang (2):
      drm/syncobj: add missing error return code in
drm_syncobj_transfer_to_timeline()
      drm/logicvc: add missing of_node_put() in logicvc_layers_init()

Yannick Fertre (6):
      drm/stm: ltdc: disable all layers before crtc shutdown
      drm/stm: ltdc: remove error message about scaling
      drm/stm: ltdc: fix various coding-style warnings
      drm/stm: ltdc: add support of the dynamic z-order
      drm/stm: ltdc: add support of horizontal & vertical mirroring
      drm/stm: ltdc: update hardware error management

Yefim Barashkin (1):
      drm/amd/pm: Prevent divide by zero

YiPeng Chai (3):
      drm/amdgpu: add umc v8_10_0 ip headers
      drm/amdgpu: add umc ras functions for umc v8_10_0
      drm/pm/swsmu: add ras eeprom i2c function for smu13 v13_0_0

Yifan Zhang (7):
      drm/amdgpu/mes: only invalid/prime icache when finish loading
both pipe MES FWs.
      drm/amdgpu/discovery: enable vcn/jpeg v4_0_2
      drm/amd: disable GPA mode in backdoor load
      drm/amdgpu: remove redundant enable_mes and enable_mes_kiq
      drm/amdgpu: add LSDMA block for LSDMA v6.0.1
      drm/amdkfd: correct sdma queue number of sdma 6.0.1
      drm/amdgpu: correct RLC_RLCS_BOOTLOAD_STATUS offset and index

Yu Zhe (1):
      drm/amdkfd: use time_is_before_jiffies(a + b) to replace "jiffies - a=
 > b"

Yuanzheng Song (1):
      dma-buf: add the name field to the table header

YueHaibing (3):
      drm/i915/gt: Fix build error without CONFIG_PM
      drm/display: Fix build error without CONFIG_OF
      drm/tegra: vic: Fix build warning when CONFIG_PM=3Dn

Yunhao Tian (1):
      drm/mipi-dbi: align max_chunk to 2 in spi_transfer

ZhenGuo Yin (1):
      drm/amdgpu: fix scratch register access method in SRIOV

Zheng Bin (1):
      drm/bridge: it6505: Add missing CRYPTO_HASH dependency

Zhongjun Tan (1):
      drm/amdgpu/display: Remove duplicated argument to ||

hersen wu (3):
      drm/amd/display: dsc validate fail not pass to atomic check
      drm/amd/display: add mst port output bw check
      drm/amd/display: Reboot while unplug hdcp enabled dp from mst hub

jason-jh.lin (4):
      drm/mediatek: Add DSC support for mediatek-drm
      drm/mediatek: Add MERGE support for mediatek-drm
      drm/mediatek: Add mediatek-drm of vdosys0 support for mt8195
      drm/mediatek: Add suffix 0 to DDP_COMPONENT_DITHER for mt8195 vdosys0

katrinzhou (1):
      drm/i915/gem: add missing else

lin cao (1):
      drm/amdgpu: Call trace info was found in dmesg when loading amdgpu

pengfuyuan (3):
      drm/amd: Fix spelling typo in comments
      drm/nouveau: Fix spelling typo in comments
      drm/i915: Fix spelling typo in comment

wangjianli (1):
      drm/amdgpu/dc/dce: fix repeated words in comments

xinhui pan (2):
      drm/amdgpu: Fix one list corruption when create queue fails
      drm/amdgpu: Remove one duplicated ef removal

 CREDITS                                            |      4 +
 .../bindings/display/bridge/analogix,anx7625.yaml  |     19 +-
 .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   |    173 +
 .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml |    144 +
 .../display/bridge/fsl,imx8qxp-pixel-link.yaml     |    144 +
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        |    108 +
 .../bindings/display/bridge/fsl,ldb.yaml           |     16 +-
 .../display/bridge/ingenic,jz4780-hdmi.yaml        |      1 -
 .../bindings/display/bridge/ti,dlpc3433.yaml       |    117 +
 .../devicetree/bindings/display/fsl,lcdif.yaml     |      1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |     11 +-
 .../bindings/display/mediatek/mediatek,dsi.txt     |     62 -
 .../bindings/display/mediatek/mediatek,dsi.yaml    |    116 +
 .../display/mediatek/mediatek,mdp-rdma.yaml        |     88 +
 .../bindings/display/msm/dp-controller.yaml        |      8 +-
 .../devicetree/bindings/display/msm/hdmi.txt       |     99 -
 .../devicetree/bindings/display/msm/hdmi.yaml      |    232 +
 .../bindings/display/panel/ebbg,ft8719.yaml        |     74 +
 .../display/panel/feiyang,fy07024di26a30d.yaml     |      1 -
 .../bindings/display/panel/novatek,nt36672a.yaml   |      2 +
 .../bindings/display/panel/panel-simple.yaml       |      8 +
 .../bindings/display/panel/sharp,lq101r1sx01.yaml  |      7 +-
 .../display/samsung/samsung,exynos-hdmi-ddc.yaml   |      1 -
 .../display/samsung/samsung,exynos-hdmi.yaml       |      1 -
 .../display/samsung/samsung,exynos-mixer.yaml      |      1 -
 .../display/samsung/samsung,exynos5433-decon.yaml  |      1 -
 .../display/samsung/samsung,exynos5433-mic.yaml    |      1 -
 .../display/samsung/samsung,exynos7-decon.yaml     |      1 -
 .../bindings/display/samsung/samsung,fimd.yaml     |      1 -
 .../display/tegra/nvidia,tegra114-mipi.txt         |     41 -
 .../display/tegra/nvidia,tegra114-mipi.yaml        |     74 +
 .../display/tegra/nvidia,tegra124-dpaux.yaml       |    152 +
 .../display/tegra/nvidia,tegra124-sor.yaml         |    197 +
 .../display/tegra/nvidia,tegra124-vic.yaml         |     72 +
 .../bindings/display/tegra/nvidia,tegra186-dc.yaml |     85 +
 .../display/tegra/nvidia,tegra186-display.yaml     |    310 +
 .../display/tegra/nvidia,tegra186-dsi-padctl.yaml  |     45 +
 .../bindings/display/tegra/nvidia,tegra20-dc.yaml  |    183 +
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml |    159 +
 .../bindings/display/tegra/nvidia,tegra20-epp.yaml |     70 +
 .../display/tegra/nvidia,tegra20-gr2d.yaml         |     74 +
 .../display/tegra/nvidia,tegra20-gr3d.yaml         |    215 +
 .../display/tegra/nvidia,tegra20-hdmi.yaml         |    126 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |    675 -
 .../display/tegra/nvidia,tegra20-host1x.yaml       |    431 +
 .../bindings/display/tegra/nvidia,tegra20-isp.yaml |     67 +
 .../bindings/display/tegra/nvidia,tegra20-mpe.yaml |     73 +
 .../bindings/display/tegra/nvidia,tegra20-tvo.yaml |     58 +
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml  |    163 +
 .../display/tegra/nvidia,tegra210-csi.yaml         |     52 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |     25 +-
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |      1 +
 .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   |    192 +
 .../bindings/phy/qcom,hdmi-phy-other.yaml          |    104 +
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |     85 +
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml      |      1 -
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       |     59 -
 .../devicetree/bindings/vendor-prefixes.yaml       |      2 +
 Documentation/driver-api/aperture.rst              |     13 +
 Documentation/driver-api/index.rst                 |      1 +
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |      2 +-
 Documentation/gpu/amdgpu/thermal.rst               |     41 +
 Documentation/gpu/drm-internals.rst                |     32 +
 Documentation/gpu/drm-usage-stats.rst              |     21 +
 Documentation/gpu/i915.rst                         |     12 +
 Documentation/gpu/rfc/i915_small_bar.h             |    189 +
 Documentation/gpu/rfc/i915_small_bar.rst           |     47 +
 Documentation/gpu/rfc/i915_vm_bind.h               |    291 +
 Documentation/gpu/rfc/i915_vm_bind.rst             |    245 +
 Documentation/gpu/rfc/index.rst                    |      8 +
 Documentation/gpu/todo.rst                         |     11 +
 Documentation/gpu/vkms.rst                         |      6 -
 .../userspace-api/media/v4l/subdev-formats.rst     |    156 +
 MAINTAINERS                                        |     42 +-
 drivers/char/agp/intel-gtt.c                       |     58 +-
 drivers/dma-buf/Kconfig                            |      6 +-
 drivers/dma-buf/Makefile                           |      2 +-
 drivers/dma-buf/dma-buf.c                          |    110 +-
 drivers/dma-buf/dma-fence-chain.c                  |      4 +-
 drivers/dma-buf/dma-fence-unwrap.c                 |    163 +
 drivers/dma-buf/st-dma-fence-unwrap.c              |    157 +-
 drivers/dma-buf/sync_file.c                        |    119 +-
 drivers/dma-buf/udmabuf.c                          |     18 +-
 drivers/gpu/drm/Kconfig                            |     18 +
 drivers/gpu/drm/Makefile                           |      4 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |      5 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |    346 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |      6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |      9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    602 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     67 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    163 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    286 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |     28 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     76 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |      2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     57 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     63 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_imu.h            |      7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |      1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |     60 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |    223 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |     67 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes_ctx.h        |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |     37 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |     52 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |      6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |     10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     20 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    110 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |      6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     67 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |     29 +-
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |     14 -
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx11.h      |    307 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |      3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |      3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |      5 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |      5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    176 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    283 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |      8 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |     32 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     25 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |     39 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |     46 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    119 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    198 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |    555 +
 .../disp/hdagv100.c =3D> amd/amdgpu/mmhub_v3_0_1.h}  |     16 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |     12 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |     12 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |     12 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |     23 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.h             |      1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    126 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |     21 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.h             |      1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |     29 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |      2 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    165 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           |    387 +
 .../disp/changv100.c =3D> amd/amdgpu/psp_v13_0_4.h}  |     20 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |     79 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    131 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |     36 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |     50 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |    357 +
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |     70 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |    667 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |     14 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     83 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |      2 -
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |      2 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |      8 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |     23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |      4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     55 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |     12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |      2 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     48 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |     32 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    134 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |     21 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    202 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    323 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |      4 +-
 drivers/gpu/drm/amd/display/Kconfig                |      2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |      8 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2999 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     40 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    464 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |     51 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    243 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h  |      2 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |     38 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     38 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    183 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |      6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   1646 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |     73 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     21 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |      1 +
 drivers/gpu/drm/amd/display/dc/Makefile            |      7 +-
 drivers/gpu/drm/amd/display/dc/basics/vector.c     |      2 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    982 +-
 .../display/dc/bios/bios_parser_types_internal2.h  |      1 +
 .../gpu/drm/amd/display/dc/bios/command_table.c    |      4 +-
 .../amd/display/dc/bios/command_table_helper2.c    |      3 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     36 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     45 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |     23 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |      4 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    234 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h  |      7 +
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |     18 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |     60 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h   |     60 +
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |     11 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c |     17 +
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c |     85 +-
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h |      3 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |      3 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |     14 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    752 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |     57 +
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |    391 +
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.h |     79 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |     10 +-
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |     14 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |      3 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |     14 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h  |     65 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    798 +
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h}      |     27 +-
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c       |    141 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h       |     47 +
 .../dc/clk_mgr/dcn32/dcn32_smu13_driver_if.h       |     63 +
 .../amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h |    108 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    679 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |      4 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |      2 -
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    176 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |      9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    429 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |     96 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |     77 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    348 +-
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |      2 -
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     13 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |      2 -
 drivers/gpu/drm/amd/display/dc/dc.h                |     77 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |      5 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    469 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     10 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |      3 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |     10 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     60 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     31 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |     45 +
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |     15 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |      8 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     45 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     20 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |      3 -
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c    |      2 -
 drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c       |      2 -
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |      3 -
 drivers/gpu/drm/amd/display/dc/dce/dce_opp.c       |      2 -
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |      5 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.h    |     14 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |      2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |     64 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |      2 +
 .../drm/amd/display/dc/dce100/dce100_resource.c    |      3 +-
 .../drm/amd/display/dc/dce110/dce110_compressor.c  |      3 -
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |     22 +-
 .../amd/display/dc/dce110/dce110_opp_regamma_v.c   |      2 -
 .../drm/amd/display/dc/dce110/dce110_resource.c    |      3 +-
 .../drm/amd/display/dc/dce110/dce110_transform_v.c |      2 -
 .../drm/amd/display/dc/dce112/dce112_compressor.c  |      3 -
 .../drm/amd/display/dc/dce112/dce112_resource.c    |      3 +-
 .../drm/amd/display/dc/dce120/dce120_resource.c    |      3 +-
 .../gpu/drm/amd/display/dc/dce60/dce60_resource.c  |      1 +
 .../gpu/drm/amd/display/dc/dce80/dce80_resource.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |      2 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |      2 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h    |     33 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |      5 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    153 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_ipp.c   |      2 -
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |      3 -
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |      6 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c   |      5 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c   |      2 -
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |      5 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |      3 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |     23 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |     26 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |     34 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c   |      2 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |     68 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |     17 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h   |    219 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c   |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |      5 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h  |     25 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    170 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |     36 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |     12 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |      1 +
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |     25 -
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |     11 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |     32 -
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |     36 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |     41 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |     87 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h   |     16 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |     25 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |     81 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h |     11 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c  |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |     84 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |    251 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |     21 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |     12 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    155 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |      3 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |      1 +
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |     19 -
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |      4 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |     50 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |     51 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |      6 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |     28 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |     24 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |      8 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |     28 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |      1 -
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |     43 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |    283 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |    159 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    462 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.h  |    311 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    376 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h   |     42 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |    159 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.h    |     34 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |    274 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.h    |    255 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |   2361 +
 .../drm/amd/display/dc/dcn314/dcn314_resource.h    |     43 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |     13 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |     13 +-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |     20 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c  |    308 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h  |    159 +
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |    294 +
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.h  |     60 +
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    475 +
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |    267 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c   |    164 +
 .../hw_translate_diag.c =3D> dcn32/dcn32_dpp.h}      |     27 +-
 .../display/dc/dcn32/dcn32_hpo_dp_link_encoder.c   |     90 +
 .../display/dc/dcn32/dcn32_hpo_dp_link_encoder.h   |     63 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |    964 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h    |    174 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |    186 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h  |     72 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   1188 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h |     87 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c  |    158 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.h  |     33 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c  |    239 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h  |    225 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   1044 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h   |    322 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |    328 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h  |    254 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   2479 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    112 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |    212 +
 drivers/gpu/drm/amd/display/dc/dcn321/Makefile     |     17 +
 .../display/dc/dcn321/dcn321_dio_link_encoder.c    |    199 +
 .../display/dc/dcn321/dcn321_dio_link_encoder.h    |     42 +
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   1972 +
 .../drm/amd/display/dc/dcn321/dcn321_resource.h    |     45 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     11 +
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |      2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    438 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h   |      6 +
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |    146 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h   |      9 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |     57 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.h |     11 +
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |     93 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |    114 +-
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |     15 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |     93 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |      5 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    109 +-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    126 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |   7420 +
 .../display/dc/dml/dcn314/display_mode_vba_314.h   |     44 +
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |   1733 +
 .../dc/dml/dcn314/display_rq_dlg_calc_314.h        |     70 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   2291 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |     74 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   3778 +
 .../dcn32/display_mode_vba_32.h}                   |     65 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   6175 +
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   1188 +
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |    615 +
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.h  |     70 +
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    684 +
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.h |     38 +
 .../drm/amd/display/dc/dml/display_mode_enums.h    |     88 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |     12 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |     15 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |    142 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |    185 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |    392 +-
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   |     71 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |      4 +-
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |      8 +-
 .../amd/display/dc/gpio/dcn20/hw_translate_dcn20.c |     17 +-
 .../amd/display/dc/gpio/dcn21/hw_translate_dcn21.c |     17 +-
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.c |     19 +-
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |    255 +
 .../hw_factory_diag.h =3D> dcn32/hw_factory_dcn32.h} |     13 +-
 .../amd/display/dc/gpio/dcn32/hw_translate_dcn32.c |    349 +
 .../hw_translate_dcn32.h}                          |     11 +-
 drivers/gpu/drm/amd/display/dc/gpio/gpio_base.c    |      2 -
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |      2 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |      3 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     19 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c       |      2 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     14 +-
 drivers/gpu/drm/amd/display/dc/inc/clock_source.h  |      7 +-
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |      3 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     47 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |      8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |      7 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     45 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |     34 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |      3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |      6 -
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |      8 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |     23 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |      2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |      5 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |     11 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |     10 +-
 drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h  |      9 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     13 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |     12 +
 drivers/gpu/drm/amd/display/dc/inc/link_hwss.h     |      6 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |      7 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     18 +
 .../amd/display/dc/irq/dce110/irq_service_dce110.c |      2 -
 .../amd/display/dc/irq/dce120/irq_service_dce120.c |      2 -
 .../amd/display/dc/irq/dce80/irq_service_dce80.c   |      2 -
 .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |      2 -
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |     14 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |     19 +
 .../amd/display/dc/irq/dcn314/irq_service_dcn314.c |    434 +
 .../display/dc/irq/dcn314/irq_service_dcn314.h}    |     23 +-
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.c   |    432 +
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.h   |     35 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |      2 -
 .../gpu/drm/amd/display/dc/link/link_hwss_dio.c    |      7 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |      4 +-
 drivers/gpu/drm/amd/display/dc/os_types.h          |      3 +-
 .../amd/display/dc/virtual/virtual_link_encoder.c  |      2 -
 .../display/dc/virtual/virtual_stream_encoder.c    |      2 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |      9 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    396 +-
 .../drm/amd/display/dmub/inc/dmub_subvp_state.h    |    183 +
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    493 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |    256 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     52 +-
 .../drm/amd/display/include/bios_parser_types.h    |     11 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     15 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |      3 +
 .../drm/amd/display/include/ddc_service_types.h    |      4 +
 drivers/gpu/drm/amd/display/include/fixed31_32.h   |      2 +-
 .../drm/amd/display/include/link_service_types.h   |      3 +-
 .../gpu/drm/amd/display/include/set_mode_types.h   |      8 +-
 .../drm/amd/display/modules/color/color_gamma.c    |      3 -
 .../drm/amd/display/modules/freesync/freesync.c    |      7 +-
 .../amd/display/modules/hdcp/hdcp2_transition.c    |      2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |      4 +
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.h    |     11 +
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |      3 +
 .../amd/display/modules/info_packet/info_packet.c  |     29 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    117 +-
 .../drm/amd/display/modules/power/power_helpers.h  |      6 +
 drivers/gpu/drm/amd/display/modules/vmid/vmid.c    |      2 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |      3 +
 .../amd/include/asic_reg/clk/clk_11_0_1_offset.h   |      0
 .../amd/include/asic_reg/clk/clk_11_0_1_sh_mask.h  |      0
 .../gpu/drm/amd/include/asic_reg/dce/dce_11_0_d.h  |      1 +
 .../amd/include/asic_reg/dce/dce_11_0_sh_mask.h    |      2 +
 .../drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h |      2 +
 .../amd/include/asic_reg/dcn/dcn_2_0_3_offset.h    |      0
 .../amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h   |      0
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_1_sh_mask.h   |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h   |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_1_4_offset.h    |  15245 ++
 .../amd/include/asic_reg/dcn/dcn_3_1_4_sh_mask.h   |  61832 +++++
 .../amd/include/asic_reg/dcn/dcn_3_2_0_offset.h    |  14677 ++
 .../amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h   | 222893 ++++++++++++++=
++++
 .../amd/include/asic_reg/dcn/dcn_3_2_1_offset.h    |  14561 ++
 .../amd/include/asic_reg/dcn/dcn_3_2_1_sh_mask.h   |  56582 +++++
 .../amd/include/asic_reg/dpcs/dpcs_2_0_3_offset.h  |      0
 .../amd/include/asic_reg/dpcs/dpcs_2_0_3_sh_mask.h |      0
 .../amd/include/asic_reg/dpcs/dpcs_3_1_4_offset.h  |   7215 +
 .../amd/include/asic_reg/dpcs/dpcs_3_1_4_sh_mask.h |  55194 +++++
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |      3 +
 .../amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h    |     25 +
 .../include/asic_reg/mmhub/mmhub_3_0_1_offset.h    |   1769 +
 .../include/asic_reg/mmhub/mmhub_3_0_1_sh_mask.h   |   7483 +
 .../drm/amd/include/asic_reg/mp/mp_13_0_4_offset.h |    402 +
 .../amd/include/asic_reg/mp/mp_13_0_4_sh_mask.h    |    595 +
 .../amd/include/asic_reg/nbio/nbio_4_3_0_offset.h  |      2 +
 .../amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h |      1 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |      4 +
 .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h |     10 +
 .../amd/include/asic_reg/umc/umc_8_10_0_offset.h   |     33 +
 .../amd/include/asic_reg/umc/umc_8_10_0_sh_mask.h  |     94 +
 drivers/gpu/drm/amd/include/atombios.h             |      4 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |    209 +-
 drivers/gpu/drm/amd/include/mes_api_def.h          |      2 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |     49 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |     14 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     11 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |     33 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     12 +
 .../drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h  |      2 +-
 .../swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h  |     17 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |     15 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |     80 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h   |      9 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |      1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |      2 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     23 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |     10 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |      1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |      1 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |     17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |     11 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     39 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     14 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     98 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     83 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    215 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |     28 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |     14 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |     43 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |     32 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     83 +-
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c   |      1 +
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |      1 +
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c   |      2 +
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |      1 +
 .../drm/arm/display/komeda/komeda_wb_connector.c   |      1 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |      1 +
 drivers/gpu/drm/arm/malidp_crtc.c                  |      1 +
 drivers/gpu/drm/arm/malidp_mw.c                    |      2 +
 drivers/gpu/drm/arm/malidp_planes.c                |      2 +
 drivers/gpu/drm/armada/armada_510.c                |      1 +
 drivers/gpu/drm/armada/armada_fb.h                 |      2 +
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |      1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c            |      1 +
 drivers/gpu/drm/ast/ast_dp.c                       |     10 +-
 drivers/gpu/drm/ast/ast_drv.h                      |      2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |     27 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |      1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |      1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |      2 +
 drivers/gpu/drm/bridge/Kconfig                     |     21 +
 drivers/gpu/drm/bridge/Makefile                    |      2 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |     12 -
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |     12 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |     24 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |      1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    200 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |      2 +
 drivers/gpu/drm/bridge/cdns-dsi.c                  |     26 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |     54 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |      1 +
 drivers/gpu/drm/bridge/display-connector.c         |      1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   |     22 +-
 drivers/gpu/drm/bridge/imx/Kconfig                 |     47 +
 drivers/gpu/drm/bridge/imx/Makefile                |      9 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |    221 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |     96 +
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c        |    588 +
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c       |    723 +
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |    450 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |    430 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |    488 +
 drivers/gpu/drm/bridge/ite-it66121.c               |      1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |     11 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |      7 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |     26 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |      3 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |      7 +
 drivers/gpu/drm/bridge/panel.c                     |     34 +
 drivers/gpu/drm/bridge/parade-ps8622.c             |      6 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |    113 +-
 drivers/gpu/drm/bridge/sii902x.c                   |      1 +
 drivers/gpu/drm/bridge/sil-sii8620.c               |      4 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |      1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |      1 +
 drivers/gpu/drm/bridge/tc358764.c                  |      1 +
 drivers/gpu/drm/bridge/tc358767.c                  |    180 +-
 drivers/gpu/drm/bridge/tc358775.c                  |     25 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    418 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |     71 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |     27 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |      2 +
 drivers/gpu/drm/display/Kconfig                    |      2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c           |    211 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |      4 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |     33 +-
 drivers/gpu/drm/drm_aperture.c                     |    178 +-
 drivers/gpu/drm/drm_atomic.c                       |      2 +
 drivers/gpu/drm/drm_atomic_helper.c                |     57 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |      2 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |      1 +
 drivers/gpu/drm/drm_blend.c                        |      2 +-
 drivers/gpu/drm/drm_bridge.c                       |     24 +
 drivers/gpu/drm/drm_bridge_connector.c             |      8 +-
 drivers/gpu/drm/drm_client_modeset.c               |     29 +-
 drivers/gpu/drm/drm_connector.c                    |    119 +-
 drivers/gpu/drm/drm_crtc.c                         |      2 +
 drivers/gpu/drm/drm_crtc_helper.c                  |      1 +
 drivers/gpu/drm/drm_crtc_internal.h                |      5 +-
 drivers/gpu/drm/drm_damage_helper.c                |      1 +
 drivers/gpu/drm/drm_debugfs.c                      |     42 +-
 drivers/gpu/drm/drm_displayid.c                    |     16 +-
 drivers/gpu/drm/drm_edid.c                         |   2010 +-
 drivers/gpu/drm/drm_encoder.c                      |      2 +-
 drivers/gpu/drm/drm_fb_helper.c                    |     28 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |      7 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |     39 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    104 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |     54 +-
 drivers/gpu/drm/drm_ioctl.c                        |      2 +-
 drivers/gpu/drm/drm_kms_helper_common.c            |      1 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |      9 +
 drivers/gpu/drm/drm_mode_config.c                  |      1 +
 drivers/gpu/drm/drm_modes.c                        |      6 +
 drivers/gpu/drm/drm_modeset_helper.c               |      1 +
 drivers/gpu/drm/drm_of.c                           |     63 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |      2 +-
 drivers/gpu/drm/drm_prime.c                        |      2 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    241 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |     14 +-
 drivers/gpu/drm/drm_syncobj.c                      |     59 +-
 drivers/gpu/drm/drm_writeback.c                    |      1 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |      2 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |     18 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |      1 +
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |      1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |      1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |      1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |      2 +
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            |      1 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |      2 +
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |      1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |      1 +
 drivers/gpu/drm/exynos/exynos_mixer.c              |      3 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |      1 +
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |     47 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |      1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |     98 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |     80 +-
 drivers/gpu/drm/gma500/framebuffer.c               |      1 +
 drivers/gpu/drm/gma500/gma_display.c               |      1 +
 drivers/gpu/drm/gma500/intel_i2c.c                 |     36 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |      1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |      1 +
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |     51 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c         |     36 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |      2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |     24 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |     86 +-
 drivers/gpu/drm/gma500/psb_intel_modes.c           |      2 +
 drivers/gpu/drm/gud/gud_connector.c                |      1 +
 drivers/gpu/drm/gud/gud_drv.c                      |      1 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |      1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |      1 +
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |     74 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |      2 +
 drivers/gpu/drm/i2c/tda998x_drv.c                  |      1 +
 drivers/gpu/drm/i915/Makefile                      |      6 +-
 drivers/gpu/drm/i915/TODO.txt                      |      2 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |     22 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |      4 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |      1 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |     11 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |      1 +
 drivers/gpu/drm/i915/display/intel_audio_regs.h    |    160 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |     24 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    657 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |      7 +
 drivers/gpu/drm/i915/display/intel_bw.c            |      6 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |     16 +-
 drivers/gpu/drm/i915/display/intel_color.c         |     51 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    314 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.h   |     16 +
 drivers/gpu/drm/i915/display/intel_cursor.c        |      1 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |     54 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |     37 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   1846 +-
 drivers/gpu/drm/i915/display/intel_display.h       |     23 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |     28 +
 drivers/gpu/drm/i915/display/intel_display_power.c |     10 +-
 .../drm/i915/display/intel_display_power_well.c    |      4 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |     90 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |    103 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |     65 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |     95 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |      2 +
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |      6 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |      1 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |     89 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |    407 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |      8 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |     16 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |      3 -
 drivers/gpu/drm/i915/display/intel_dsi.c           |      2 +-
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |      9 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |     56 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |      1 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |      5 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |      2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |      2 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |      3 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |      1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |      8 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    734 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.h |     15 +
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    246 +
 .../gpu/drm/i915/display/intel_modeset_verify.h    |     21 +
 drivers/gpu/drm/i915/display/intel_opregion.c      |     16 +
 drivers/gpu/drm/i915/display/intel_opregion.h      |      7 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |      2 -
 drivers/gpu/drm/i915/display/intel_panel.c         |     66 +-
 drivers/gpu/drm/i915/display/intel_panel.h         |      3 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |     91 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    129 +-
 drivers/gpu/drm/i915/display/intel_pps.h           |      1 +
 drivers/gpu/drm/i915/display/intel_psr.c           |     80 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |      5 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |     77 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.h      |      5 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |      1 +
 drivers/gpu/drm/i915/display/intel_tc.c            |      3 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |     67 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |     30 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |      4 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |      1 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |     14 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |     28 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |     20 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |     15 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |     47 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |      3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |     18 +
 drivers/gpu/drm/i915/gem/i915_gem_region.c         |      2 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |     11 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |      2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |      6 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |      2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |     55 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h            |      3 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |     99 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h       |      1 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |     34 +
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |     50 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.h              |      3 +-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |      7 +-
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    250 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |      2 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |    141 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |     87 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |     21 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |      3 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |     24 +
 drivers/gpu/drm/i915/gt/intel_context.h            |     25 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |      4 +-
 drivers/gpu/drm/i915/gt/intel_engine.h             |      2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    225 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |     10 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |     34 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |     27 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    627 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |    132 +
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.h          |     27 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h       |     37 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    282 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |     24 -
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |      3 +-
 drivers/gpu/drm/i915/gt/intel_gt_gmch.c            |    654 -
 drivers/gpu/drm/i915/gt/intel_gt_gmch.h            |     46 -
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |     16 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |    522 +
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h             |     58 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |     12 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |     83 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c        |    177 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |      8 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |     45 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                |      3 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h                |     10 -
 drivers/gpu/drm/i915/gt/intel_mocs.c               |     24 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c                |      4 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    118 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |     37 +-
 drivers/gpu/drm/i915/gt/intel_ring.c               |      3 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |     11 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |      9 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    450 +-
 drivers/gpu/drm/i915/gt/intel_sseu.h               |     92 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |     30 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    192 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c       |      9 +-
 drivers/gpu/drm/i915/gt/selftest_llc.c             |      2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |      8 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |      2 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |    323 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h  |      6 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |      8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |      8 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |      5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |     93 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |      1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c    |      4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |      4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |      5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h         |      1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |     62 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h        |      1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h  |      3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    131 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |     97 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.h             |      5 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c          |      5 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |     26 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    113 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h           |      2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h       |      9 +
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |      2 +-
 drivers/gpu/drm/i915/i915_active.c                 |      2 +-
 drivers/gpu/drm/i915/i915_driver.c                 |     54 +-
 drivers/gpu/drm/i915/i915_drm_client.h             |      2 +-
 drivers/gpu/drm/i915/i915_drv.h                    |     99 +-
 drivers/gpu/drm/i915/i915_gem.h                    |     39 -
 drivers/gpu/drm/i915/i915_getparam.c               |     11 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |     69 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |      7 +
 drivers/gpu/drm/i915/i915_params.c                 |      2 +
 drivers/gpu/drm/i915/i915_params.h                 |      1 +
 drivers/gpu/drm/i915/i915_pci.c                    |    160 +-
 drivers/gpu/drm/i915/i915_perf.c                   |    158 +-
 drivers/gpu/drm/i915/i915_query.c                  |     42 +-
 drivers/gpu/drm/i915/i915_reg.h                    |    235 +-
 drivers/gpu/drm/i915/i915_request.c                |     57 +-
 drivers/gpu/drm/i915/i915_request.h                |      2 +
 drivers/gpu/drm/i915/i915_scatterlist.c            |     27 +-
 drivers/gpu/drm/i915/i915_scatterlist.h            |      6 +-
 drivers/gpu/drm/i915/i915_scheduler.h              |      1 +
 drivers/gpu/drm/i915/i915_tasklet.h                |     43 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |     31 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |      3 +
 drivers/gpu/drm/i915/i915_utils.h                  |     40 -
 drivers/gpu/drm/i915/i915_vma.c                    |     76 +-
 drivers/gpu/drm/i915/intel_device_info.c           |     17 +
 drivers/gpu/drm/i915/intel_device_info.h           |     50 +-
 drivers/gpu/drm/i915/intel_dram.c                  |      2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |      2 +
 drivers/gpu/drm/i915/intel_memory_region.c         |     18 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |      4 +-
 drivers/gpu/drm/i915/intel_pch.c                   |     16 +-
 drivers/gpu/drm/i915/intel_pch.h                   |      8 +-
 drivers/gpu/drm/i915/intel_pcode.c                 |     93 +-
 drivers/gpu/drm/i915/intel_pcode.h                 |     20 +-
 drivers/gpu/drm/i915/intel_pm.c                    |    180 +-
 drivers/gpu/drm/i915/intel_pm.h                    |     14 +-
 drivers/gpu/drm/i915/intel_region_ttm.c            |     10 +-
 drivers/gpu/drm/i915/intel_region_ttm.h            |      3 +-
 drivers/gpu/drm/i915/intel_step.c                  |     70 +-
 drivers/gpu/drm/i915/intel_step.h                  |      4 +-
 drivers/gpu/drm/i915/intel_uncore.c                |    378 +-
 drivers/gpu/drm/i915/intel_uncore.h                |      8 -
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c       |      5 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |      2 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |     21 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |      2 +
 drivers/gpu/drm/i915/selftests/mock_region.c       |      3 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |      1 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |      2 +
 drivers/gpu/drm/imx/imx-ldb.c                      |      2 +
 drivers/gpu/drm/imx/imx-tve.c                      |      1 +
 drivers/gpu/drm/imx/ipuv3-plane.c                  |      2 +
 drivers/gpu/drm/imx/parallel-display.c             |      2 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |     12 +-
 drivers/gpu/drm/ingenic/ingenic-drm.h              |      3 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |      1 +
 drivers/gpu/drm/kmb/kmb_dsi.c                      |      1 +
 drivers/gpu/drm/kmb/kmb_plane.c                    |      2 +
 drivers/gpu/drm/logicvc/Kconfig                    |      9 +
 drivers/gpu/drm/logicvc/Makefile                   |      9 +
 drivers/gpu/drm/logicvc/logicvc_crtc.c             |    280 +
 drivers/gpu/drm/logicvc/logicvc_crtc.h             |     21 +
 drivers/gpu/drm/logicvc/logicvc_drm.c              |    496 +
 drivers/gpu/drm/logicvc/logicvc_drm.h              |     67 +
 drivers/gpu/drm/logicvc/logicvc_interface.c        |    214 +
 drivers/gpu/drm/logicvc/logicvc_interface.h        |     28 +
 drivers/gpu/drm/logicvc/logicvc_layer.c            |    631 +
 drivers/gpu/drm/logicvc/logicvc_layer.h            |     64 +
 drivers/gpu/drm/logicvc/logicvc_mode.c             |     80 +
 drivers/gpu/drm/logicvc/logicvc_mode.h             |     15 +
 drivers/gpu/drm/logicvc/logicvc_of.c               |    185 +
 drivers/gpu/drm/logicvc/logicvc_of.h               |     46 +
 drivers/gpu/drm/logicvc/logicvc_regs.h             |     80 +
 drivers/gpu/drm/mcde/mcde_clk_div.c                |      1 +
 drivers/gpu/drm/mcde/mcde_display.c                |      1 +
 drivers/gpu/drm/mcde/mcde_dsi.c                    |      1 +
 drivers/gpu/drm/mediatek/Makefile                  |      4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |     20 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |    320 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |      2 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |     10 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |    261 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |     18 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |     69 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |      3 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    184 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |      8 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |      3 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.h           |      1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    101 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |    315 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h            |     20 +
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |      1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |     27 +-
 drivers/gpu/drm/meson/meson_overlay.c              |      2 +
 drivers/gpu/drm/meson/meson_plane.c                |      2 +
 drivers/gpu/drm/mgag200/Makefile                   |     14 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    381 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |    148 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |    201 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |     50 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |     51 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |     46 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |     50 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |     60 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |    130 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |     50 +
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |     59 +-
 drivers/gpu/drm/mgag200/mgag200_mm.c               |    116 -
 drivers/gpu/drm/mgag200/mgag200_mode.c             |    454 +-
 drivers/gpu/drm/mgag200/mgag200_pll.c              |     12 +-
 drivers/gpu/drm/mgag200/mgag200_reg.h              |      2 +
 drivers/gpu/drm/msm/Makefile                       |      1 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |      8 -
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |     30 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |      4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |    106 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |      3 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |     65 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |     23 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |     29 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |     32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |     24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |      4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    119 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |      6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    163 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |     26 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |     21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |      1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h         |     25 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    514 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |     20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |      1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |      9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |      2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |      8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |     24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |      9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |     53 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |      1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |      1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |      7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |      1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |      9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |      1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |     55 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |     36 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |      9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |      5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |     40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |     22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |      2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |      2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |     29 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |      6 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |      1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |     21 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |      6 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |      1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |     31 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c          |      3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |      2 +
 drivers/gpu/drm/msm/disp/mdp_format.c              |      2 +
 drivers/gpu/drm/msm/dp/dp_clk_util.c               |    120 -
 drivers/gpu/drm/msm/dp/dp_clk_util.h               |     38 -
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |     13 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    100 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |      1 -
 drivers/gpu/drm/msm/dp/dp_drm.c                    |      8 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |      2 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |     53 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |      6 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |    104 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |     57 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    126 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |     15 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |     11 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |     62 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c           |     12 +
 drivers/gpu/drm/msm/msm_debugfs.c                  |      1 +
 drivers/gpu/drm/msm/msm_drv.c                      |     81 +-
 drivers/gpu/drm/msm/msm_drv.h                      |     11 +-
 drivers/gpu/drm/msm/msm_fb.c                       |      1 +
 drivers/gpu/drm/msm/msm_fbdev.c                    |      1 +
 drivers/gpu/drm/msm/msm_fence.c                    |     11 +-
 drivers/gpu/drm/msm/msm_gem.c                      |     22 +-
 drivers/gpu/drm/msm/msm_gem.h                      |     15 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |      2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     63 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |     31 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |     41 +-
 drivers/gpu/drm/mxsfb/Kconfig                      |     16 +
 drivers/gpu/drm/mxsfb/Makefile                     |      2 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    340 +
 drivers/gpu/drm/mxsfb/lcdif_drv.h                  |     44 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |    485 +
 drivers/gpu/drm/mxsfb/lcdif_regs.h                 |    257 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |      2 +
 drivers/gpu/drm/nouveau/Kconfig                    |      1 -
 drivers/gpu/drm/nouveau/dispnv50/base507c.c        |     17 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c        |      4 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |      6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |     59 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c        |      6 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        |     17 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c        |      7 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |     22 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |      5 -
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |      7 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |      1 -
 drivers/gpu/drm/nouveau/include/nvhw/drf.h         |      4 +-
 drivers/gpu/drm/nouveau/include/nvif/cl5070.h      |      8 -
 drivers/gpu/drm/nouveau/include/nvif/cl507a.h      |     12 -
 drivers/gpu/drm/nouveau/include/nvif/cl507b.h      |     12 -
 drivers/gpu/drm/nouveau/include/nvif/cl507c.h      |     13 -
 drivers/gpu/drm/nouveau/include/nvif/cl507d.h      |     12 -
 drivers/gpu/drm/nouveau/include/nvif/cl507e.h      |     13 -
 drivers/gpu/drm/nouveau/include/nvif/class.h       |    141 +-
 drivers/gpu/drm/nouveau/include/nvif/clc37b.h      |     11 -
 drivers/gpu/drm/nouveau/include/nvif/clc37e.h      |     13 -
 drivers/gpu/drm/nouveau/include/nvif/conn.h        |     18 +
 drivers/gpu/drm/nouveau/include/nvif/disp.h        |      2 +
 drivers/gpu/drm/nouveau/include/nvif/if0010.h      |     13 +
 drivers/gpu/drm/nouveau/include/nvif/if0011.h      |     23 +
 drivers/gpu/drm/nouveau/include/nvif/if0012.h      |     23 +
 drivers/gpu/drm/nouveau/include/nvif/if0014.h      |     13 +
 drivers/gpu/drm/nouveau/include/nvif/object.h      |      6 +
 drivers/gpu/drm/nouveau/include/nvif/outp.h        |     14 +
 drivers/gpu/drm/nouveau/include/nvif/printf.h      |      9 +
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |      3 -
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h |     43 +-
 .../gpu/drm/nouveau/include/nvkm/engine/falcon.h   |     10 -
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |      2 -
 .../gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h |      1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h  |      3 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/fault.h    |      1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/secboot.h  |     66 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |     32 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |      1 +
 drivers/gpu/drm/nouveau/nouveau_bios.c             |      2 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |      4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |     18 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h        |      3 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |      4 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |     12 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |      1 -
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |      3 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |      4 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c             |     31 +-
 drivers/gpu/drm/nouveau/nouveau_usif.c             |    231 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild                |      2 +
 .../{nvkm/engine/disp/rootga102.c =3D> nvif/conn.c}  |     60 +-
 drivers/gpu/drm/nouveau/nvif/disp.c                |     61 +-
 drivers/gpu/drm/nouveau/nvif/object.c              |      2 +-
 .../{nvkm/engine/disp/rootg84.c =3D> nvif/outp.c}    |     65 +-
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |      3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gv100.c     |     24 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |      2 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c     |      1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.c  |      6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |     25 -
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |     14 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |      1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |    115 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |    139 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/baseg84.c |     74 -
 .../gpu/drm/nouveau/nvkm/engine/disp/basegf119.c   |    108 -
 .../gpu/drm/nouveau/nvkm/engine/disp/basegp102.c   |     32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/basenv50.c    |    119 -
 .../gpu/drm/nouveau/nvkm/engine/disp/capsgv100.c   |     60 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c    |    275 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h    |    135 +
 .../gpu/drm/nouveau/nvkm/engine/disp/changf119.c   |     62 -
 .../gpu/drm/nouveau/nvkm/engine/disp/channv50.c    |    364 -
 .../gpu/drm/nouveau/nvkm/engine/disp/channv50.h    |    193 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c    |      6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h    |      4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg84.c |    111 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg94.c |     57 -
 .../gpu/drm/nouveau/nvkm/engine/disp/coregf119.c   |    231 -
 .../gpu/drm/nouveau/nvkm/engine/disp/coregk104.c   |    126 -
 .../gpu/drm/nouveau/nvkm/engine/disp/coregp102.c   |     70 -
 .../gpu/drm/nouveau/nvkm/engine/disp/coregv100.c   |    207 -
 .../gpu/drm/nouveau/nvkm/engine/disp/corenv50.c    |    234 -
 .../gpu/drm/nouveau/nvkm/engine/disp/cursgp102.c   |     32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/cursgv100.c   |     81 -
 .../gpu/drm/nouveau/nvkm/engine/disp/cursnv50.c    |     64 -
 .../gpu/drm/nouveau/nvkm/engine/disp/dacgf119.c    |     70 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dacnv50.c |    121 -
 .../gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c   |     96 -
 .../gpu/drm/nouveau/nvkm/engine/disp/dmacgp102.c   |     64 -
 .../gpu/drm/nouveau/nvkm/engine/disp/dmacgv100.c   |     79 -
 .../gpu/drm/nouveau/nvkm/engine/disp/dmacnv50.c    |    137 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |    457 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h      |     33 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c     |    291 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c     |    341 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |    120 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c   |   1041 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c   |    275 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.c   |     23 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c   |     78 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c   |    146 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c   |     52 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c   |    144 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.c   |     73 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c   |    172 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |    883 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/hdagf119.c    |     62 -
 .../gpu/drm/nouveau/nvkm/engine/disp/hdagt215.c    |     51 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmig84.c |     91 -
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigf119.c   |     82 -
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigk104.c   |     82 -
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigt215.c   |     91 -
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c   |     84 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.c    |      4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h    |     19 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/headgf119.c   |    104 -
 .../gpu/drm/nouveau/nvkm/engine/disp/headgv100.c   |    105 -
 .../gpu/drm/nouveau/nvkm/engine/disp/headnv04.c    |     74 -
 .../gpu/drm/nouveau/nvkm/engine/disp/headnv50.c    |     99 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.c     |     10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |     95 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c   |     40 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c   |     54 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.c    |     55 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c    |   1159 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.h    |    102 -
 .../gpu/drm/nouveau/nvkm/engine/disp/oimmgf119.c   |     32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/oimmgp102.c   |     32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/oimmnv50.c    |     64 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c    |     28 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h    |     41 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlyg84.c |     71 -
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlygf119.c   |     95 -
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlygk104.c   |     97 -
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlygp102.c   |     32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlygt200.c   |     74 -
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlynv50.c    |    107 -
 .../gpu/drm/nouveau/nvkm/engine/disp/piocgf119.c   |     78 -
 .../gpu/drm/nouveau/nvkm/engine/disp/piocnv50.c    |     87 -
 .../gpu/drm/nouveau/nvkm/engine/disp/piornv50.c    |    139 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h    |     75 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootg94.c |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgf119.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgk104.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgk110.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgm107.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgm200.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgp100.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgp102.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgt200.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgt215.c   |     55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgv100.c   |     53 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv04.c    |     42 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c    |    140 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv50.h    |     45 -
 .../gpu/drm/nouveau/nvkm/engine/disp/roottu102.c   |     53 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg84.c  |     38 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c  |    302 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorga102.c    |    144 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgf119.c    |    208 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgk104.c    |     54 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgm107.c    |     80 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c    |    160 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgp100.c    |     93 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgt215.c    |     69 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgv100.c    |    155 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sormcp77.c    |     48 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sormcp89.c    |     53 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sornv50.c |    106 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sortu102.c    |    129 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |    108 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   |    117 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c   |    115 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   |    129 +
 .../gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c   |     82 -
 .../gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c   |    184 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |     29 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |     37 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/changk104.h   |      2 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogk104.c |     11 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gpfifogv100.c |     47 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c   |      2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h    |      1 -
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |      4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm200.c     |      1 -
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c         |     10 -
 drivers/gpu/drm/nouveau/nvkm/falcon/v1.c           |     25 -
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c    |      2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h    |      2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c  |      2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c   |     14 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |     20 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |      4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |      1 +
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |      1 +
 drivers/gpu/drm/omapdrm/omap_debugfs.c             |      1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |      1 +
 drivers/gpu/drm/omapdrm/omap_fb.c                  |      2 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |      1 +
 drivers/gpu/drm/omapdrm/omap_plane.c               |      2 +
 drivers/gpu/drm/panel/Kconfig                      |     13 +
 drivers/gpu/drm/panel/Makefile                     |      1 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |      7 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |     12 +
 drivers/gpu/drm/panel/panel-dsi-cm.c               |     29 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |    285 +
 drivers/gpu/drm/panel/panel-edp.c                  |     48 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |     12 +
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |      2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |     12 +
 drivers/gpu/drm/panel/panel-lvds.c                 |     13 +
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |      6 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |      4 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |      1 +
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |      1 +
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |     51 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |      1 +
 drivers/gpu/drm/panel/panel-simple.c               |    137 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |     12 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |      9 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |      1 +
 drivers/gpu/drm/panfrost/panfrost_features.h       |     13 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |     18 +-
 drivers/gpu/drm/panfrost/panfrost_issues.h         |     19 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |      1 +
 drivers/gpu/drm/pl111/pl111_display.c              |      4 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |      1 +
 drivers/gpu/drm/pl111/pl111_versatile.c            |      2 +
 drivers/gpu/drm/qxl/qxl_display.c                  |      2 +
 drivers/gpu/drm/qxl/qxl_draw.c                     |      1 +
 drivers/gpu/drm/qxl/qxl_kms.c                      |      2 -
 drivers/gpu/drm/r128/r128_drv.h                    |      4 +-
 drivers/gpu/drm/radeon/.gitignore                  |      2 +-
 drivers/gpu/drm/radeon/Kconfig                     |      2 +-
 drivers/gpu/drm/radeon/Makefile                    |      2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |      1 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |     14 -
 drivers/gpu/drm/radeon/evergreen.c                 |      1 +
 drivers/gpu/drm/radeon/ni_dpm.c                    |      6 +-
 drivers/gpu/drm/radeon/r100.c                      |      1 +
 drivers/gpu/drm/radeon/r300_reg.h                  |      2 +-
 drivers/gpu/drm/radeon/radeon_acpi.c               |      2 -
 drivers/gpu/drm/radeon/radeon_device.c             |      3 +-
 drivers/gpu/drm/radeon/radeon_display.c            |      1 +
 drivers/gpu/drm/radeon/radeon_fb.c                 |      1 +
 drivers/gpu/drm/radeon/radeon_gem.c                |      4 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c        |      1 +
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |     15 -
 drivers/gpu/drm/radeon/radeon_mode.h               |      4 -
 drivers/gpu/drm/radeon/radeon_sa.c                 |      6 +-
 drivers/gpu/drm/radeon/rs600.c                     |      1 +
 drivers/gpu/drm/radeon/rv770.c                     |      1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c                 |      2 +-
 drivers/gpu/drm/rcar-du/rcar_cmm.h                 |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |      7 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |     19 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |      4 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |      3 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.h            |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |      3 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.h              |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |     16 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h            |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |     21 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h              |      2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |      4 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.h        |      2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |      3 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.h                |      2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h           |      2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            |     17 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h       |      2 +-
 drivers/gpu/drm/rockchip/Kconfig                   |      4 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |     10 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |      1 +
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |      1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |      5 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |      8 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |      1 +
 drivers/gpu/drm/scheduler/sched_entity.c           |      6 +-
 drivers/gpu/drm/scheduler/sched_main.c             |     13 +-
 drivers/gpu/drm/selftests/test-drm_damage_helper.c |      1 +
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |      2 +-
 drivers/gpu/drm/selftests/test-drm_plane_helper.c  |      1 +
 drivers/gpu/drm/shmobile/shmob_drm_backlight.c     |      6 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |      1 +
 drivers/gpu/drm/shmobile/shmob_drm_kms.c           |      1 +
 drivers/gpu/drm/shmobile/shmob_drm_plane.c         |      1 +
 drivers/gpu/drm/solomon/ssd130x-spi.c              |      2 +
 drivers/gpu/drm/solomon/ssd130x.c                  |      2 +
 drivers/gpu/drm/sprd/sprd_dpu.c                    |      2 +
 drivers/gpu/drm/sti/sti_compositor.c               |      1 +
 drivers/gpu/drm/sti/sti_cursor.c                   |      1 +
 drivers/gpu/drm/sti/sti_gdp.c                      |      2 +
 drivers/gpu/drm/sti/sti_hda.c                      |      1 +
 drivers/gpu/drm/sti/sti_hdmi.c                     |      1 +
 drivers/gpu/drm/sti/sti_hqvdp.c                    |      2 +
 drivers/gpu/drm/sti/sti_plane.c                    |      2 +
 drivers/gpu/drm/stm/drv.c                          |      1 +
 drivers/gpu/drm/stm/ltdc.c                         |    294 +-
 drivers/gpu/drm/stm/ltdc.h                         |      8 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |      2 +
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c          |      1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |      1 +
 drivers/gpu/drm/sun4i/sun4i_layer.c                |      1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |      1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.h                 |      1 +
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h              |      9 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |    242 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |      1 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |      2 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |      2 +
 drivers/gpu/drm/tegra/dc.c                         |      3 +
 drivers/gpu/drm/tegra/drm.c                        |      2 +
 drivers/gpu/drm/tegra/drm.h                        |     11 +
 drivers/gpu/drm/tegra/falcon.c                     |      8 +
 drivers/gpu/drm/tegra/falcon.h                     |      1 +
 drivers/gpu/drm/tegra/fb.c                         |      1 +
 drivers/gpu/drm/tegra/gem.c                        |     11 +-
 drivers/gpu/drm/tegra/hub.c                        |      3 +
 drivers/gpu/drm/tegra/nvdec.c                      |     14 +-
 drivers/gpu/drm/tegra/plane.c                      |      2 +
 drivers/gpu/drm/tegra/submit.c                     |     48 +-
 drivers/gpu/drm/tegra/uapi.c                       |     43 +-
 drivers/gpu/drm/tegra/vic.c                        |     92 +-
 drivers/gpu/drm/tests/.kunitconfig                 |      3 +
 drivers/gpu/drm/tests/Makefile                     |      3 +
 drivers/gpu/drm/tests/drm_format_helper_test.c     |    161 +
 drivers/gpu/drm/tidss/tidss_dispc.c                |      3 +
 drivers/gpu/drm/tidss/tidss_plane.c                |      2 +
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |      1 +
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |      1 +
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |      1 +
 drivers/gpu/drm/tiny/Kconfig                       |      1 +
 drivers/gpu/drm/tiny/arcpgu.c                      |      2 +
 drivers/gpu/drm/tiny/bochs.c                       |      3 +
 drivers/gpu/drm/tiny/cirrus.c                      |      2 +
 drivers/gpu/drm/tiny/gm12u320.c                    |      2 +
 drivers/gpu/drm/tiny/ili9225.c                     |      1 +
 drivers/gpu/drm/tiny/repaper.c                     |      1 +
 drivers/gpu/drm/tiny/st7586.c                      |      1 +
 drivers/gpu/drm/tiny/st7735r.c                     |      1 +
 drivers/gpu/drm/ttm/ttm_bo.c                       |      9 +-
 drivers/gpu/drm/tve200/tve200_display.c            |      1 +
 drivers/gpu/drm/udl/udl_connector.c                |      3 +-
 drivers/gpu/drm/v3d/Kconfig                        |      5 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |     18 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |     12 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |     12 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |      2 +
 drivers/gpu/drm/vc4/vc4_bo.c                       |      2 +
 drivers/gpu/drm/vc4/vc4_crtc.c                     |     15 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |    100 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |     19 +
 drivers/gpu/drm/vc4/vc4_drv.h                      |      1 +
 drivers/gpu/drm/vc4/vc4_dsi.c                      |    152 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    210 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |     14 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |     38 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |     42 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |      9 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |     94 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |      2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |      1 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |      1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h               |      1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |      6 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |      4 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |      6 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |      2 +
 drivers/gpu/drm/vkms/vkms_composer.c               |     10 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |      1 +
 drivers/gpu/drm/vkms/vkms_output.c                 |      1 +
 drivers/gpu/drm/vkms/vkms_writeback.c              |      1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |     10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |      1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |      2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |      1 +
 drivers/gpu/drm/xen/xen_drm_front_conn.c           |      1 +
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |      1 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |      1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |      1 +
 drivers/gpu/host1x/Makefile                        |      6 +-
 drivers/gpu/host1x/cdma.c                          |     43 +-
 drivers/gpu/host1x/channel.c                       |      8 +-
 drivers/gpu/host1x/context.c                       |    160 +
 drivers/gpu/host1x/context.h                       |     38 +
 drivers/gpu/host1x/context_bus.c                   |      5 -
 drivers/gpu/host1x/dev.c                           |    124 +-
 drivers/gpu/host1x/dev.h                           |     13 +
 drivers/gpu/host1x/hw/cdma_hw.c                    |     34 +
 drivers/gpu/host1x/hw/channel_hw.c                 |    137 +-
 drivers/gpu/host1x/hw/host1x01_hardware.h          |    114 +-
 drivers/gpu/host1x/hw/host1x02_hardware.h          |    113 +-
 drivers/gpu/host1x/hw/host1x04_hardware.h          |    113 +-
 drivers/gpu/host1x/hw/host1x05_hardware.h          |    113 +-
 drivers/gpu/host1x/hw/host1x06_hardware.h          |    118 +-
 drivers/gpu/host1x/hw/host1x07_hardware.h          |    118 +-
 drivers/gpu/host1x/hw/host1x08.c                   |     33 +
 drivers/gpu/host1x/hw/host1x08.h                   |     15 +
 drivers/gpu/host1x/hw/host1x08_hardware.h          |     21 +
 drivers/gpu/host1x/hw/hw_host1x08_channel.h        |     11 +
 drivers/gpu/host1x/hw/hw_host1x08_common.h         |     11 +
 drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h     |      9 +
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h         |    181 +
 drivers/gpu/host1x/hw/hw_host1x08_vm.h             |     36 +
 drivers/gpu/host1x/hw/intr_hw.c                    |     11 +
 drivers/gpu/host1x/hw/opcodes.h                    |    150 +
 drivers/vfio/pci/vfio_pci_core.c                   |      5 +
 drivers/video/Kconfig                              |      6 +
 drivers/video/Makefile                             |      2 +
 drivers/video/aperture.c                           |    351 +
 drivers/video/console/Kconfig                      |      1 +
 drivers/video/fbdev/Kconfig                        |      7 +-
 drivers/video/fbdev/core/fbcon.c                   |     13 +-
 drivers/video/fbdev/core/fbmem.c                   |     22 +-
 drivers/video/fbdev/efifb.c                        |     11 -
 drivers/video/fbdev/simplefb.c                     |     11 -
 include/drm/display/drm_dp_aux_bus.h               |     34 +-
 include/drm/display/drm_dp_helper.h                |     48 +-
 include/drm/drm_atomic_helper.h                    |      2 +
 include/drm/drm_bridge.h                           |     15 +
 include/drm/drm_connector.h                        |     10 +-
 include/drm/drm_crtc.h                             |     17 +-
 include/drm/drm_displayid.h                        |      6 +-
 include/drm/drm_edid.h                             |     39 +-
 include/drm/drm_encoder_slave.h                    |      2 +
 include/drm/drm_fb_helper.h                        |      1 +
 include/drm/drm_gem.h                              |     26 +-
 include/drm/drm_gem_framebuffer_helper.h           |     10 +-
 include/drm/drm_mipi_dsi.h                         |     17 +
 include/drm/drm_of.h                               |     22 +
 include/drm/drm_panel.h                            |      9 +
 include/drm/drm_probe_helper.h                     |      3 +
 include/drm/drm_rect.h                             |     16 +
 include/drm/gpu_scheduler.h                        |      4 +-
 include/drm/i915_pciids.h                          |     39 +-
 include/drm/intel-gtt.h                            |     24 +-
 include/linux/aperture.h                           |     56 +
 include/linux/dma-fence-unwrap.h                   |     76 +-
 include/linux/fb.h                                 |      1 -
 include/linux/host1x.h                             |     42 +
 include/linux/iosys-map.h                          |     82 +-
 include/linux/workqueue.h                          |      1 +
 include/uapi/drm/amdgpu_drm.h                      |      7 +-
 include/uapi/drm/drm_fourcc.h                      |     10 +-
 include/uapi/drm/i915_drm.h                        |    387 +-
 include/uapi/linux/dma-buf.h                       |     84 +
 include/uapi/linux/kfd_ioctl.h                     |     55 +-
 include/uapi/linux/media-bus-format.h              |      6 +-
 kernel/workqueue.c                                 |      9 +
 1540 files changed, 561528 insertions(+), 28441 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
 create mode 100644
Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner=
.yaml
 create mode 100644
Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.txt
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-dpaux.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-vic.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-display.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.=
yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-isp.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 create mode 100644
Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.y=
aml
 create mode 100644
Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp=
.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
 create mode 100644 Documentation/driver-api/aperture.rst
 create mode 100644 Documentation/gpu/rfc/i915_small_bar.h
 create mode 100644 Documentation/gpu/rfc/i915_small_bar.rst
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
 create mode 100644 drivers/dma-buf/dma-fence-unwrap.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
 rename drivers/gpu/drm/{nouveau/nvkm/engine/disp/hdagv100.c =3D>
amd/amdgpu/mmhub_v3_0_1.h} (80%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
 rename drivers/gpu/drm/{nouveau/nvkm/engine/disp/changv100.c =3D>
amd/amdgpu/psp_v13_0_4.h} (78%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_sm=
u.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_sm=
u.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_=
mgr.c
 rename drivers/gpu/drm/{nouveau/nvkm/engine/disp/hdmigm200.c =3D>
amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h} (72%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_smu13_driver_if.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
 rename drivers/gpu/drm/amd/display/dc/{gpio/diagnostics/hw_translate_diag.=
c
=3D> dcn32/dcn32_dpp.h} (74%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/Makefile
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn321/dcn321_dio_link_encoder.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dcn321/dcn321_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
 rename drivers/gpu/drm/amd/display/dc/{gpio/diagnostics/hw_factory_diag.c
=3D> dml/dcn32/display_mode_vba_32.h} (53%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
 create mode 100644
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dc=
n32.c
 rename drivers/gpu/drm/amd/display/dc/gpio/{diagnostics/hw_factory_diag.h
=3D> dcn32/hw_factory_dcn32.h} (81%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_translate_dcn32.c
 rename drivers/gpu/drm/amd/display/dc/gpio/{diagnostics/hw_translate_diag.=
h
=3D> dcn32/hw_translate_dcn32.h} (82%)
 create mode 100644
drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
 rename drivers/gpu/drm/{nouveau/nvkm/engine/disp/cursgf119.c =3D>
amd/display/dc/irq/dcn314/irq_service_dcn314.h} (76%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dc=
n32.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dc=
n32.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/inc/dmub_subvp_state.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h
 mode change 100755 =3D> 100644
drivers/gpu/drm/amd/include/asic_reg/clk/clk_11_0_1_offset.h
 mode change 100755 =3D> 100644
drivers/gpu/drm/amd/include/asic_reg/clk/clk_11_0_1_sh_mask.h
 mode change 100755 =3D> 100644
drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_3_offset.h
 mode change 100755 =3D> 100644
drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_4_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_1_4_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_0_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_0_sh_m=
ask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_1_offs=
et.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_3_2_1_sh_m=
ask.h
 mode change 100755 =3D> 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_3_offset.h
 mode change 100755 =3D> 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_3_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_3_1_4_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_3_1_4_sh_mask.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_1_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_1_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_4_offse=
t.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_4_sh_ma=
sk.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_10_0_off=
set.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_10_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
 create mode 100644 drivers/gpu/drm/bridge/ti-dlpc3433.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_audio_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_crtc_state_dump.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_setup.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_setup.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_verify.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_modeset_verify.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.h
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_gt_gmch.c
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_gt_gmch.h
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.h
 create mode 100644 drivers/gpu/drm/i915/i915_tasklet.h
 create mode 100644 drivers/gpu/drm/logicvc/Kconfig
 create mode 100644 drivers/gpu/drm/logicvc/Makefile
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
 create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh3.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200er.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200ev.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200ew3.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200se.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200wb.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_mm.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.h
 create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
 create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
 create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
 create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507a.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507b.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507c.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507d.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507e.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/clc37b.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/clc37e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/conn.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0010.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0011.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0012.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0014.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/outp.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/secboot.h
 rename drivers/gpu/drm/nouveau/{nvkm/engine/disp/rootga102.c =3D>
nvif/conn.c} (56%)
 rename drivers/gpu/drm/nouveau/{nvkm/engine/disp/rootg84.c =3D>
nvif/outp.c} (54%)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/baseg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/basegf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/basegp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/basenv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/capsgv100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/changf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg94.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/corenv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/cursgp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/cursgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/cursnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dacgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dacnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmig84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/headgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/headgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/headnv04.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/headnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmgp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlyg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygt200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlynv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/piocgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/piocnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/piornv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootg94.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgk110.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgm107.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgm200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgp100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgt200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/roottu102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm107.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgp100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sormcp77.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sormcp89.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sornv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sortu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
 create mode 100644 drivers/gpu/drm/panel/panel-ebbg-ft8719.c
 create mode 100644 drivers/gpu/drm/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/tests/Makefile
 create mode 100644 drivers/gpu/drm/tests/drm_format_helper_test.c
 create mode 100644 drivers/gpu/host1x/context.c
 create mode 100644 drivers/gpu/host1x/context.h
 create mode 100644 drivers/gpu/host1x/hw/host1x08.c
 create mode 100644 drivers/gpu/host1x/hw/host1x08.h
 create mode 100644 drivers/gpu/host1x/hw/host1x08_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_common.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_uclass.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_vm.h
 create mode 100644 drivers/gpu/host1x/hw/opcodes.h
 create mode 100644 drivers/video/aperture.c
 create mode 100644 include/linux/aperture.h
