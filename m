Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B679D4900
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D303E10E89B;
	Thu, 21 Nov 2024 08:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VQGkfu2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E1C10E0F9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 00:26:01 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso59670766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 16:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732148759; x=1732753559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1Vf8fKkzucXQxbNDlDYsAr7oiuU+JnYp8p/A4Prr4vQ=;
 b=VQGkfu2GzHRFP/iNvVkTJkapQ3ElGI08xmbtFRO4dDd+qc28VK2TSOSZKyziraeEhT
 1euvZJ8pZbR9maENFgYqmIrivNrxKCr/JqCthdnnzlWHusPXqqlKmRydHi69m+8cbnU7
 gAFBOmGzZzTRi6esvc0vxwP8UlMCnLW73mxHjScqyLkRK+xENjbsd3pje2LWzoiSu+Lk
 WofSIrcVn0GSO9eUUfWz0i1UG58H4RBt9PTFEuUWwgjEWexEZlj/xKoGsS3GbWKon2ti
 bEFO4eMgjne36/HyfJPGicCIo5HloudxG7RVAQ9TeT9LOILusvixKsD+gfnKg0nqzHXC
 uDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732148759; x=1732753559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Vf8fKkzucXQxbNDlDYsAr7oiuU+JnYp8p/A4Prr4vQ=;
 b=So60Aep53T4ZoUIWqfniCCSIquHKPNcH6No/yufbaG6D7AzIJjGofMue6A1C23C8vQ
 07A65AmhLuVtEvVZhb/bJ+Mc1VW4zmDuH6miJvqxR+uEoqQJgscEM5O9+jl9F0Cg/kOm
 yXeik1vpTc5NoZf0zfEUT6JIri0Z+ZvH2kJ6Kb48rdVqZJvC7QgYsfPsk11QqaDlqJch
 42T5dyP/A0I2696Oz0DMUuKzIDMlWXPxb9aS6/Vh3Pr4Is/wlWoTKIGgTdYs4ZuCXJcp
 rG6IFGLAJS3J8KmVl9KCCBPlrwmnlrBgcdfFJNMcd+bn4AcT0YjoL8FoHmTgfW6YxedY
 hmIw==
X-Gm-Message-State: AOJu0Yyv3ENm+uXZPWTJqbmnYViwrMfvqSiRMlQF3lAD2Y9VBH2hAApQ
 /kxqFmHxnChHYZJOitW/C6NMOazWQ5snw4inwe0O0wekGaNChgyIhPW9dHJmE/cigusP71LnVjx
 8wOA60S2/T3+Nz3ZM5RUb5FqzaAE=
X-Gm-Gg: ASbGncsMnlOidGW96rURkxENSL00HX8xdBXF7/M5crpR5fdObqSXa3zECMqnsoQmPoF
 kBYox0zXeGFcM6UtWmCy8d1gH+NgIqw==
X-Google-Smtp-Source: AGHT+IEgkdzgA94/sTf9/2TQotZvRfg6P5+bWcgHBvMyKu3pXNcHdd4zM900udoglljl3sy+RTREeeLnLYE2lTSdgig=
X-Received: by 2002:a17:907:3d9e:b0:aa4:a814:3f75 with SMTP id
 a640c23a62f3a-aa4dd748c45mr466055266b.52.1732148758073; Wed, 20 Nov 2024
 16:25:58 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 21 Nov 2024 10:25:45 +1000
Message-ID: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
Subject: [git pull] drm for 6.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 21 Nov 2024 08:40:20 +0000
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

This is the main drm pull request for 6.13.

I've done a test merge into your tree, there were two conflicts both
of which seem easy enough to resolve for you.

There's a lot of rework, the panic helper support is being added to
more drivers, v3d gets support for HW superpages, scheduler
documentation, drm client and video aperture reworks, some new
MAINTAINERS added, amdgpu has the usual lots of IP refactors, Intel
has some Pantherlake enablement and xe is getting some SRIOV bits, but
just lots of stuff everywhere.

Let me know if there are any issues,
Thanks,
Dave.

drm-next-2024-11-21:
drm for 6.13-rc1

core:
- split DSC helpers from DP helpers
- clang build fixes for drm/mm test
- drop simple pipeline support for gem vram
- document submission error signaling
- move drm_rect to drm core module from kms helper
- add default client setup to most drivers
- move to video aperture helpers instead of drm ones

tests:
- new framebuffer tests

ttm:
- remove swapped and pinned BOs from TTM lru

panic:
- fix uninit spinlock
- add ABGR2101010 support

bridge:
- add TI TDP158 support
- use standard PM OPS

dma-fence:
- use read_trylock instead of read_lock to help lockdep

scheduler:
- add errno to sched start to report different errors
- add locking to drm_sched_entity_modify_sched
- improve documentation

xe:
- add drm_line_printer
- lots of refactoring
- Enable Xe2 + PES disaggregation
- add new ARL PCI ID
- SRIOV development work
- fix exec unnecessary implicit fence
- define and parse OA sync props
- forcewake refactoring

i915:
- Enable BMG/LNL ultra joiner
- Enable 10bpx + CCS scanout on ICL+, fp16/CCS on TGL+
- use DSB for plane/color mgmt
- Arrow lake PCI IDs
- lots of i915/xe display refactoring
- enable PXP GuC autoteardown
- Pantherlake (PTL) Xe3 LPD display enablement
- Allow fastset HDR infoframe changes
- write DP source OUI for non-eDP sinks
- share PCI IDs between i915 and xe

amdgpu:
- SDMA queue reset support
- SMU 13.0.6, JPEG 4.0.3 updates
- Initial runtime repartitioning support
- rework IP structs for multiple IP instances
- Fetch EDID from _DDC if available
- SMU13 zero rpm user control
- lots of fixes/cleanups

amdkfd:
- Increase event FIFO size
- add topology cap flag for per queue reset

msm:
- DPU:
- SA8775P support
- (disabled by default) MSM8917, MSM8937, MSM8953 and MSM8996 support
- Enable large framebuffer support
- Drop MSM8998 and SDM845
- DP:
- SA8775P support
- GPU:
- a7xx preemption support
- Adreno A663 support

ast:
- warn about unsupported TX chips

ivpu:
- add coredump
- add pantherlake support

rockchip:
- 4K@60Hz display enablement
- generate pll programming tables

panthor:
- add timestamp query API
- add realtime group priority
- add fdinfo support

etnaviv:
- improve handling of DMA address limits
- improve GPU hangcheck

exynos:
- Decon Exynos7870 support

mediatek:
- add OF graph support

omap:
- locking fixes

bochs:
- convert to gem/shmem from simpledrm

v3d:
- support big/super pages
- add gemfs

vc4:
- BCM2712 support refactoring
- add YUV444 format support

udmabuf:
- folio related fixes

nouveau:
- add panic support on nv50+
The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230=
:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-11-21

for you to fetch changes up to a163b895077861598be48c1cf7f4a88413c28b22:

  Merge tag 'drm-xe-next-fixes-2024-11-15' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-11-18
13:38:46 +1000)

----------------------------------------------------------------
drm for 6.13-rc1

core:
- split DSC helpers from DP helpers
- clang build fixes for drm/mm test
- drop simple pipeline support for gem vram
- document submission error signaling
- move drm_rect to drm core module from kms helper
- add default client setup to most drivers
- move to video aperture helpers instead of drm ones

tests:
- new framebuffer tests

ttm:
- remove swapped and pinned BOs from TTM lru

panic:
- fix uninit spinlock
- add ABGR2101010 support

bridge:
- add TI TDP158 support
- use standard PM OPS

dma-fence:
- use read_trylock instead of read_lock to help lockdep

scheduler:
- add errno to sched start to report different errors
- add locking to drm_sched_entity_modify_sched
- improve documentation

xe:
- add drm_line_printer
- lots of refactoring
- Enable Xe2 + PES disaggregation
- add new ARL PCI ID
- SRIOV development work
- fix exec unnecessary implicit fence
- define and parse OA sync props
- forcewake refactoring

i915:
- Enable BMG/LNL ultra joiner
- Enable 10bpx + CCS scanout on ICL+, fp16/CCS on TGL+
- use DSB for plane/color mgmt
- Arrow lake PCI IDs
- lots of i915/xe display refactoring
- enable PXP GuC autoteardown
- Pantherlake (PTL) Xe3 LPD display enablement
- Allow fastset HDR infoframe changes
- write DP source OUI for non-eDP sinks
- share PCI IDs between i915 and xe

amdgpu:
- SDMA queue reset support
- SMU 13.0.6, JPEG 4.0.3 updates
- Initial runtime repartitioning support
- rework IP structs for multiple IP instances
- Fetch EDID from _DDC if available
- SMU13 zero rpm user control
- lots of fixes/cleanups

amdkfd:
- Increase event FIFO size
- add topology cap flag for per queue reset

msm:
- DPU:
- SA8775P support
- (disabled by default) MSM8917, MSM8937, MSM8953 and MSM8996 support
- Enable large framebuffer support
- Drop MSM8998 and SDM845
- DP:
- SA8775P support
- GPU:
- a7xx preemption support
- Adreno A663 support

ast:
- warn about unsupported TX chips

ivpu:
- add coredump
- add pantherlake support

rockchip:
- 4K@60Hz display enablement
- generate pll programming tables

panthor:
- add timestamp query API
- add realtime group priority
- add fdinfo support

etnaviv:
- improve handling of DMA address limits
- improve GPU hangcheck

exynos:
- Decon Exynos7870 support

mediatek:
- add OF graph support

omap:
- locking fixes

bochs:
- convert to gem/shmem from simpledrm

v3d:
- support big/super pages
- add gemfs

vc4:
- BCM2712 support refactoring
- add YUV444 format support

udmabuf:
- folio related fixes

nouveau:
- add panic support on nv50+

----------------------------------------------------------------
Adri=C3=A1n Larumbe (8):
      drm/panthor: introduce job cycle and timestamp accounting
      drm/panthor: record current and maximum device clock frequencies
      drm/panthor: add DRM fdinfo support
      drm/panthor: enable fdinfo for memory stats
      drm/panthor: add sysfs knob for enabling job profiling
      Documentation/gpu: Fix Panthor documentation build warnings
      drm/panfrost: Add missing OPP table refcnt decremental
      drm/panthor: Fix OPP refcnt leaks in devfreq initialisation

Advait Dhamorikar (1):
      drm/amdgpu: Cleanup shift coding style

Akhil P Oommen (1):
      drm/msm/a6xx: Fix excessive stack usage

Alan Previn (1):
      drm/i915/pxp: Add missing tag for Wa_14019159160

Aleksandrs Vinarskis (1):
      drm/edp-panel: Add panels used by Dell XPS 13 9345

Alex Deucher (22):
      drm/amdgpu/gfx9: set additional bits on CP halt
      drm/amdgpu/gfx9: Explicitly halt CP before init
      drm/amdgpu: partially revert powerplay `__counted_by` changes
      drm/amd/display: disable SG displays on cyan skillfish
      drm/amdgpu: enable enforce_isolation sysfs node on VFs
      drm/amdgpu/smu13: always apply the powersave optimization
      drm/amdgpu/swsmu: Only force workload setup on init
      drm/amdgpu/swsmu: default to fullscreen 3D profile for dGPUs
      drm/amdgpu/swsmu: add automatic parameter to set_soft_freq_range
      drm/amdgpu/discovery: add ISP discovery entries for old APUs
      Revert "drm/amdgpu/gfx9: put queue resets behind a debug option"
      Revert "drm/amdkfd: SMI report dropped event count"
      drm/amdgpu: handle default profile on on devices without fullscreen 3=
D
      drm/amdgpu/smu13: fix profile reporting
      drm/amdkfd: add an interface to query whether is KFD is active
      drm/amdgpu: fix fairness in enforce isolation handling
      drm/amdgpu: add ring reset messages
      drm/amdgpu/mes: fetch fw version from firmware header
      drm/amdgpu: Adjust debugfs register access permissions
      drm/amdgpu: Adjust debugfs eviction and IB access permissions
      drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()
      Revert "drm/amd/display: parse umc_info or vram_info based on ASIC"

Alex Hung (13):
      drm/amd/display: Add HDR workaround for specific eDP
      drm/amd/display: Remove always-false branches
      drm/amd/display: Eliminate recursive header inclusion
      drm/amd/display: Removed unused assignments and variables
      drm/amd/display: Remove unnecessary assignments
      drm/amd/display: Remove redundant assignments
      drm/amd/display: Check returns from drm_dp_dpcd_write
      drm/amd/display: Check status from dpcd_get_tunneling_device_data
      drm/amd/display: Remove useless assignments
      drm/amd/display: print messages when programming shaper/3dlut fails
      drm/amd/display: Check returned status from core_link_read_dpcd
      drm/amd/display: Remove useless assignments and variables
      drm/amd/display: Simplify dcn35_is_ips_supported()

Alex Lanzano (2):
      dt-bindings: display: Add Sharp Memory LCD bindings
      drm/tiny: Add driver for Sharp Memory LCD

Alexander Stein (5):
      drm/bridge: tc358767: Use dev_err_probe
      drm/bridge: tc358767: Only print GPIO debug output if they actually o=
ccur
      drm/bridge: tc358767: Support write-only registers
      drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
      drm: fsl-dcu: Use dev_err_probe

Alvin Lee (1):
      drm/amd/display: Wait for all pending cleared before full update

Andrew Kreimer (3):
      drm/rockchip: Fix a typo
      accel/ivpu: Fix a typo
      drm/amdgpu: fix typos

Andrzej Kacprowski (5):
      accel/ivpu: Update VPU FW API headers
      accel/ivpu: Allow reading dvfs_mode debugfs file
      accel/ivpu: Add test_mode bit to force turbo
      accel/ivpu: Fix reset_engine debugfs file logic
      accel/ivpu: Remove copy engine support

Andy Shevchenko (3):
      drm/panel: ili9341: Remove duplicate code
      drm/mm: Mark drm_mm_interval_tree*() functions with __maybe_unused
      drm/panel: sony-acx565akm: Use %*ph to print small buffer

AngeloGioacchino Del Regno (2):
      dt-bindings: display: mediatek: Add OF graph support for board path
      drm/mediatek: Implement OF graphs support for display paths

Animesh Manna (3):
      drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
      drm/i915/vrr: Split vrr-compute-config in two phases
      drm/i915/panelreplay: Panel replay workaround with VRR

Ankit Nautiyal (18):
      drm/i915/display: Check whether platform supports joiner
      drm/i915/display: Simplify intel_joiner_num_pipes and its usage
      drm/i915/display: Use joined pipes in intel_dp_joiner_needs_dsc
      drm/i915/display: Use joined pipes in intel_mode_valid_max_plane_size
      drm/i915/display: Use joined pipes in dsc helpers for slices, bpp
      drm/i915/display: Enhance iterators for modeset en/disable
      drm/i915/display_device: Add Check HAS_DSC for bigjoiner
      drm/i915/display_debugfs: Allow force joiner only if supported
      drm/i915/display: Modify debugfs for joiner to force n pipes
      drm/i915/dp: Add helper to compute num pipes required
      drm/i915: Split current joiner hw state readout
      drm/i915/display: Add macro HAS_ULTRAJOINER()
      drm/i915/display: Refactor enable_joiner_pipes
      drm/i915/dp: Refactor joiner max_bpp calculations into separate funct=
ions
      drm/i915/dp: Use num_joined_pipes in bigjoiner_bw_max_bpp
      drm/i915/dp: Modify compressed bpp limitations for ultrajoiner
      drm/i915/display: Consider ultrajoiner for computing maxdotclock
      drm/i915/intel_dp: Add support for forcing ultrajoiner

Antonino Maniscalco (12):
      drm/msm: Fix bv_fence being used as bv_rptr
      drm/msm/a6xx: Track current_ctx_seqno per ring
      drm/msm: Add a `preempt_record_size` field
      drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
      drm/msm/a6xx: Add a pwrup_list field to a6xx_info
      drm/msm/a6xx: Implement preemption for a7xx targets
      drm/msm/a6xx: Sync relevant adreno_pm4.xml changes
      drm/msm/a6xx: Use posamble to reset counters on preemption
      drm/msm/a6xx: Add traces for preemption
      drm/msm/a6xx: Add a flag to allow preemption to submitqueue_create
      drm/msm/a6xx: Enable preemption for tested a7xx targets
      Documentation: document adreno preemption

Antonio Quartulli (1):
      drm/amdgpu: prevent NULL pointer dereference if ATIF is not supported

Aradhya Bhatia (1):
      drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg

Aric Cyr (8):
      drm/amd/display: 3.2.302
      drm/amd/display: 3.2.303
      drm/amd/display: 3.2.304
      drm/amd/display: 3.2.305
      drm/amd/display: 3.2.306
      drm/amd/display: 3.2.307
      drm/amd/display: 3.2.308
      drm/amd/display: 3.2.309

Arnd Bergmann (7):
      drm/xe: fix build warning with CONFIG_PM=3Dn
      drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
      i915: fix DRM_I915_GVT_KVMGT dependencies
      drm/imx: parallel-display: add legacy bridge Kconfig dependency
      drm/imx: legacy-bridge: add MODULE_DESCRIPTION
      drm/imx/dcss: include drm/drm_bridge.h header
      drm/imx/dcss: include drm/drm_bridge.h header

Arun R Murthy (1):
      drm/i915/display: BMG supports UHBR13.5

Aryabhatta Dey (1):
      Documentation/gpu: Fix typo in Documentation/gpu/komeda-kms.rst

Asad Kamal (8):
      drm/amd/amdgpu: Add helper to get ip block valid
      drm/amd/pm: Use same metric table for APU
      drm/amd/pm: Add gpu_metrics_v1_6
      drm/amd/pm: Use metrics 1_6
      drm/amdgpu: Add supported partition mode node
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Fill pcie recov cntr to metrics 1.6
      drm/amdgpu: Add supported NPS modes node

Ashutosh Dixit (9):
      drm/xe/oa: Enable Xe2+ PES disaggregation
      drm/xe/oa: Separate batch submission from waiting for completion
      drm/xe/oa/uapi: Define and parse OA sync properties
      drm/xe/oa: Add input fence dependencies
      drm/xe/oa: Signal output fences
      drm/xe/oa: Move functions up so they can be reused for config ioctl
      drm/xe/oa: Add syncs support to OA config ioctl
      drm/xe/oa: Allow only certain property changes from config
      Revert "drm/xe/xe_guc_ads: save/restore OA registers and allowlist re=
gs"

Aurabindo Pillai (8):
      drm/amd/display: fix a memleak issue when driver is removed
      drm/amd/display: temp w/a for dGPU to enter idle optimizations
      drm/amd/display: Reuse subvp enable check for DCN401
      drm/amd/display: temp w/a for DP Link Layer compliance
      drm/amd/display: Fix idle optimizations entry log
      drm/amd/display: parse umc_info or vram_info based on ASIC
      drm/amd/display: Add a missing DCN401 reg definition
      drm/amd/display: Read DP tunneling support only for DPIA endpoints

Ausef Yousof (3):
      Revert "drm/amd/display: Block UHBR Based On USB-C PD Cable ID"
      drm/amd/display: Remove hw w/a toggle if on DP2/HPO
      drm/amd/display: Remove otg w/a toggling on HPO interfaces

Austin Zheng (11):
      drm/amd/display: Set Pipe Unlock Order Outside of HWSEQ
      drm/amd/display: Update Interface to Check UCLK DPM
      drm/amd/display: Wait For DET Update Should Use Current State
      drm/amd/display: Unify blank_phantom and blank_pixel_data
      drm/amd/display: Flip All Planes Under OTG Master When Flip Immediate
      drm/amd/display: Revert commit Update Interface to Check UCLK DPM
      drm/amd/display: Allow Latency Increase For Last Strategy
      drm/amd/display: Move Link Encoder Assignment Out Of dc_global_valida=
te
      drm/amd/display: Update Interface to Check UCLK DPM
      drm/amd/display: Do Not Fallback To SW Cursor If HW Cursor Required
      drm/amd/display: Update SPL Taps Required For Integer Scaling

Badal Nilawar (1):
      drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout

Benjamin Sz=C5=91ke (1):
      drm/nouveau/i2c: rename aux.c and aux.h to auxch.c and auxch.h

Bhuvanachandra Pinninti (1):
      drm/amd/display: To change dcn301_init.h guard.

Boyuan Zhang (1):
      drm/amd/pm: add inst to dpm_set_vcn_enable

Brahmajit Das (1):
      drm/display: Fix building with GCC 15

Candice Li (1):
      drm/amdgpu: Add nps_mode in RAS init_flag

Carlos Eduardo Gallo Filho (9):
      drm/tests: Stop using deprecated dev_private member on
drm_framebuffer tests
      drm/tests: Add parameters to the drm_test_framebuffer_create test
      drm/tests: Replace strcpy to strscpy on drm_test_framebuffer_create t=
est
      drm/tests: Add test case for drm_internal_framebuffer_create()
      drm/tests: Add test for drm_framebuffer_check_src_coords()
      drm/tests: Add test for drm_framebuffer_cleanup()
      drm/tests: Add test for drm_framebuffer_lookup()
      drm/tests: Add test for drm_framebuffer_init()
      drm/tests: Add test for drm_framebuffer_free()

Chaitanya Kumar Borah (3):
      drm/i915: Do not explicilty enable FEC in DP_TP_CTL for UHBR rates
      drm/i915/dp: Add FEC Enable Retry mechanism
      drm/i915/display: Allow fastset for change in HDR infoframe

Charlene Liu (4):
      drm/amd/display: avoid set dispclk to 0
      drm/amd/display: correct register Clock Gater incorrectly disabled
      drm/amd/display: update sr_exit latency for z8
      drm/amd/display: avoid divided by zero

Chen Ni (2):
      drm/i915/hdmi: convert comma to semicolon
      drm/fsl-dcu: Remove redundant dev_err()

Chen Yufan (1):
      drm/imagination: Convert to use time_before macro

Chen-Yu Tsai (2):
      drm/mediatek: Drop dependency on ARM
      drm/bridge: it6505: Fix inverted reset polarity

Christian Gmeiner (1):
      drm/v3d: Use v3d_perfmon_find()

Christian K=C3=B6nig (12):
      drm/sched: add optional errno to drm_sched_start()
      dma-buf: give examples of error codes to use
      drm/doc: Document submission error signaling
      drm/todos: add entry for drm_syncobj error handling
      drm/radeon: always set GEM function pointer
      dma-buf: add WARN_ON() illegal dma-fence signaling
      dma-buf/sw_sync: remove pointless enable_signaling implementation
      drm/writeback: remove pointless enable_signaling implementation
      drm/amdgpu: drop volatile from ring buffer
      drm/amdgpu: stop syncing PRT map operations
      drm/amdgpu: fix check in gmc_v9_0_get_vm_pte()
      drm/amdgpu: enable GTT fallback handling for dGPUs only

Christophe JAILLET (1):
      drm/i915/display: Remove kstrdup_const() and kfree_const() usage

Clint Taylor (4):
      drm/i915/xe3lpd: reuse xe2lpd definition
      drm/i915/cx0: Remove bus reset after every c10 transaction
      drm/i915/display/dp: Reduce log level for SOURCE OUI write failures
      drm/i915/display: Fuse bit for power management disable removed

Colin Ian King (6):
      drm/tegra: hdmi: Make read-only const array freqs static
      drm/amdgpu: Fix spelling mistake "initializtion" -> "initialization"
      drm/i915/display: Fix spelling mistake "Uncomressed" -> "Uncompressed=
"
      drm/xe/guc: Fix inverted logic on snapshot->copy check
      drm/msm8998: make const arrays ratio_list and band_list static
      drm/amd/display: Fix spelling mistake "tunndeling" -> "tunneling"

Cristian Ciocaltea (3):
      drm/bridge: synopsys: Add DW HDMI QP TX Controller support library
      dt-bindings: display: rockchip: Add schema for RK3588 HDMI TX Control=
ler
      drm/rockchip: Add basic RK3588 HDMI output support

Dafna Hirschfeld (1):
      drm/xe: fix missing 'xe_vm_put'

Dan Carpenter (2):
      drm/amdgpu: Fix off by one in current_memory_partition_show()
      drm/amdgpu: Fix amdgpu_ip_block_hw_fini()

Danila Tikhonov (4):
      dt-bindings: display: panel: Add Samsung AMS639RQ08
      drm/panel: Add Samsung AMS639RQ08 panel driver
      dt-bindings: display: panel: Add Samsung AMS581VF01
      drm/panel: Add Samsung AMS581VF01 panel driver

Dave Airlie (23):
      Merge tag 'drm-misc-next-2024-09-20' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-09-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2024-10-09' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-2024-10-10' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2024-10-11' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2024-10-17' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-xe-next-2024-10-17' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-gt-next-2024-10-23' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-next-6.13-2024-10-25' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2024-10-31' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Backmerge v6.12-rc6 of
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into
drm-next
      Merge tag 'drm-msm-next-2024-10-28' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-xe-next-2024-10-31' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'exynos-drm-next-for-v6.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'mediatek-drm-next-6.13' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-intel-next-2024-11-04' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-msm-next-2024-11-04' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'exynos-drm-next-for-v6.13-v2' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'amd-drm-next-6.13-2024-11-06' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-etnaviv-next-2024-11-07' of
https://git.pengutronix.de/git/lst/linux into drm-next
      Merge tag 'drm-misc-next-2024-11-08' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.13-2024-11-15' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-xe-next-fixes-2024-11-15' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

Dave Stevenson (12):
      drm/vc4: crtc: Force trigger of dlist update on margins change
      drm/vc4: hvs: Set AXI panic modes for the HVS
      drm/vc4: hvs: Don't write gamma luts on 2711
      drm/vc4: plane: YUV planes require vertical scaling to always be enab=
led
      drm/vc4: hvs: Fix dlist debug not resetting the next entry pointer
      drm/vc4: hvs: Remove incorrect limit from hvs_dlist debugfs function
      drm/vc4: plane: Move the buffer offset out of the vc4_plane_state
      drm/vc4: hvs: Correct logic on stopping an HVS channel
      drm/vc4: Run default client setup for all variants.
      drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_lut_load
      drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_atomic_flush
      drm/vc4: Correct generation check in vc4_hvs_lut_load

David Rosca (1):
      drm/amdgpu: Fix video caps for H264 and HEVC encode maximum size

Detlev Casanova (1):
      dt-bindings: gpu: Add rockchip,rk3576-mali compatible

Dillon Varone (6):
      drm/amd/display: Configure DTBCLK_P with OPTC only for dcn401
      drm/amd/display: Remove programming outstanding updates for dcn35
      drm/amd/display: resolve correct MALL size for dcn401
      drm/amd/display: Recalculate SubVP Phantom VBlank End in dml21
      drm/amd/display: Add P-State Stall Timeout Recovery Support for dcn40=
1
      drm/amd/display: Require minimum VBlank size for stutter optimization

Dmitry Baryshkov (56):
      drm/display: split DSC helpers from DP helpers
      dt-bindings: display: fsl-imx-drm: drop edid property support
      dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
      drm/imx: cleanup the imx-drm header
      drm/imx: parallel-display: drop edid override support
      drm/imx: ldb: drop custom EDID support
      drm/imx: ldb: drop custom DDC bus support
      drm/imx: ldb: switch to drm_panel_bridge
      drm/imx: parallel-display: switch to drm_panel_bridge
      drm/imx: add internal bridge handling display-timings DT node
      drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connector
      drm/imx: parallel-display: switch to imx_legacy_bridge /
drm_bridge_connector
      drm/imx: move imx_drm_connector_destroy to imx-tve
      drm/xe: select DRM_DISPLAY_DSC_HELPER
      drm/msm: add another DRM_DISPLAY_DSC_HELPER selection
      drm/bridge: lt9611: use HDMI Connector helper to set InfoFrames
      drm/msm/dpu: Add support for MSM8953
      drm/msm/dpu: Add support for MSM8937
      drm/msm/dpu: Add support for MSM8917
      drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
      drm/msm/dpu: drop LM_3 / LM_4 on SDM845
      drm/msm/dpu: drop LM_3 / LM_4 on MSM8998
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from
dpu_plane_sspp_atomic_update
      drm/msm/dpu: drop extra aspace checks in dpu_formats
      drm/msm/dpu: drop msm_format from struct dpu_hw_fmt_layout
      drm/msm/dpu: pass drm_framebuffer to _dpu_format_get_plane_sizes()
      drm/msm/dpu: move pitch check to _dpu_format_get_plane_sizes_linear()
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: make dpu_format_populate_addrs return void
      drm/msm/dpu: move layout setup population out of dpu_plane_prepare_fb=
()
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c
      drm/fbdev: fix drm_fb_helper_deferred_io() build failure
      drm/display: bridge_connector: handle ycbcr_420_allowed
      drm/atomic: add interlaced and ycbcr_420 flags to connector's state d=
ump
      drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
      drm/bridge: aux: allow interlaced and YCbCr 420 output
      drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
      drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag
      drm/msm/dp: prefix all symbols with msm_dp_
      drm/msm/dp: rename edp_ bridge functions and struct
      drm/msm/dp: tidy up platform data names
      drm/msm: move msm_display_topology to the DPU driver
      drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU driver
      drm/msm: drop MAX_BRIDGES define
      drm/msm/dpu: use drm_rect_fp_to_int()
      drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_che=
ck
      drm/msm/dpu: drop virt_formats from SSPP subblock configuration
      drm/msm/dpu: move scaling limitations out of the hw_catalog
      drm/msm/dpu: split dpu_plane_atomic_check()
      drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_sspp()
      drm/msm: move MDSS registers to separate header file
      drm/msm/mdss: use register definitions instead of hand-coding them
      drm/msm/dpu: rework documentation comments

Dnyaneshwar Bhadane (6):
      drm/i915/pciid: Add new PCI id for ARL
      drm/xe/pciid: Add new PCI id for ARL
      drm/i915/mtl: Update PLL c20 phy value for DP uhbr20
      drm/i915/ptl: Define IS_PANTHERLAKE macro
      drm/i915/cx0: Extend C10 check to PTL
      drm/i915/xe3lpd: Move async flip bit to PLANE_SURF register

Dom Cobley (7):
      drm/vc4: plane: Keep fractional source coords inside state
      drm/vc4: plane: Handle fractional coordinates using the phase field
      drm/vc4: hdmi: Avoid log spam for audio start failure
      drm/vc4: plane: Add support for YUV444 formats
      drm/vc4: hdmi: Increase audio MAI fifo dreq threshold
      drm/vc4: hdmi: Avoid hang with debug registers when suspended
      drm/vc4: hvs: Remove ABORT_ON_EMPTY flag

Dominik Kaszewski (1):
      drm/amd/display: fix rxstatus_msg_sz type narrowing

Dominique Martinet (1):
      drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with selected clock

Douglas Anderson (3):
      drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
      drm/rockchip: dw_hdmi: Use auto-generated tables
      drm/msm: Simplify NULL checking in msm_disp_state_dump_regs()

Dr. David Alan Gilbert (11):
      drm/amd/display: Remove unused function bios_get_vga_enabled_displays
      drm/amdgpu: Remove unused amdgpu_device_ip_is_idle
      drm/amdgpu: Remove unused amdgpu_atpx functions
      drm/amdgpu: Remove unused amdgpu_gmc_vram_cpu_pa
      drm/amdgpu: Remove unused amdgpu_gfx_bit_to_me_queue
      drm/amdgpu: Remove unused amdgpu_i2c functions
      drm/amd/powerplay: Delete unused function and maths library
      drm/omap: Clean up deadcode functions
      drm/amd/display: Remove unused regamma functions
      drm/amd/display: Remove unused
cm3_helper_translate_curve_to_degamma_hw_format
      drm/amd/display: Remove last parts of timing_trace

Dzmitry Sankouski (5):
      drm/mipi-dsi: add mipi_dsi_compression_mode_multi
      dt-bindings: panel: add Samsung s6e3ha8
      drm/panel: Add support for S6E3HA8 panel driver
      drm/mipi-dsi: fix kernel doc on mipi_dsi_compression_mode_multi
      drm/panel: s6e3ha8: add static modifier to supply list

Emily Nie (1):
      drm/amd/display: disabling p-state checks for DCN31 and DCN314

Everest K.C. (2):
      drm/msm/a6xx: Remove logically deadcode in a6xx_preempt.c
      drm/xe/guc: Fix dereference before NULL check

Fabio Estevam (7):
      drm/bridge: imx8mp-hdmi-tx: Switch to SYSTEM_SLEEP_PM_OPS()
      drm/bridge: imx8qm-ldb: Switch to RUNTIME_PM_OPS()
      drm/bridge: imx8qxp-pixel-combiner: Switch to RUNTIME_PM_OPS()
      drm/bridge: samsung-dsim: Switch to RUNTIME_PM_OPS()
      drm/bridge: dw-hdmi-cec: Switch to SYSTEM_SLEEP_PM_OPS()
      drm/bridge: imx8qxp-ldb: Switch to RUNTIME_PM_OPS()
      dt-bindings: lcdif: Document the dmas/dma-names properties

Fangzhi Zuo (6):
      drm/amd/display: Restore Optimized pbn Value if Failed to Disable DSC
      drm/amd/display: Fix incorrect DSC recompute trigger
      drm/amd/display: Skip Invalid Streams from DSC Policy
      drm/amd/display: Add a Precise Delay Routine
      drm/amd/display: Reduce HPD Detection Interval for IPS
      drm/amd/display: Prune Invalid Modes For HDMI Output

Fei Yang (1):
      drm/xe: enable lite restore

Feifei Xu (2):
      drm/amdgpu: Add psp command CONFIG_SQ_PERFMON
      drm/amdkfd:Add kfd function to config sq perfmon

Francois Dugast (1):
      drm/xe: Use fault injection infrastructure to find issues at probe ti=
me

Frank Min (2):
      drm/amdgpu: fix random data corruption for sdma 7
      drm/amdgpu: fix typo for sdma6 constant fill packet

Frieder Schrempf (2):
      dt-bindings: vendor-prefixes: Add Jenson Display
      dt-bindings: display: panel-lvds: Add compatible for Jenson BL-JT6005=
0-01A

Fudongwang (3):
      drm/amd/display: skip disable CRTC in seemless bootup case
      drm/amd/display: force TBT4 dock dsc on
      drm/amd/display: always blank stream before disable crtc

Geert Uytterhoeven (2):
      drm: renesas: shmobile: Add drm_panic support
      drm: renesas: rcar-du: Add drm_panic support for non-vsp

Gustavo Sousa (13):
      drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
      drm/xe/xe2: Extend performance tuning to media GT
      drm/xe/xe2: Assume tuning settings also apply for future media GT
      drm/xe/xe2: Add performance tuning for L3 cache flushing
      drm/xe/xe3: Add initial set of workarounds
      drm/i915/display: Fix out-of-bounds access in pipe-related tracepoint=
s
      drm/i915/display: Zero-initialize frame/scanline counts in tracepoint=
s
      drm/i915/display: Store pipe name in trace events
      drm/i915/display: Do not use ids from enum pipe in TP_printk()
      drm/i915/display: Cover all possible pipes in TP_printk()
      drm/i915/xe3lpd: Load DMC
      drm/i915/cx0: Pass crtc_state to intel_c20_compute_hdmi_tmds_pll()
      drm/i915/xe2lpd: Update C20 algorithm to include tx_misc

Hamish Claxton (1):
      drm/amd/display: Fix failure to read vram info due to static BP_RESUL=
T

Hamza Mahfooz (2):
      drm/amd/display: change the panel power savings level without a modes=
et
      drm/amd/display: fix hibernate entry for DCN35+

Hansen Dsouza (1):
      drm/amd/display: Add a boot option to reduce phy ssc for HBR3

Haridhar Kalvala (4):
      drm/xe/xe3: Define Xe3 feature flags
      drm/xe/ptl: PTL re-uses Xe2 MOCS table
      drm/xe/ptl: Add PTL platform definition
      drm/xe/ptl: Enable PTL display

Hawking Zhang (1):
      drm/amd/pm: Do not support swSMU if SMU IP is disabled

He Lugang (2):
      drm/xe: use devm_add_action_or_reset() helper
      drm/i915:Remove unused parameter in marco

Heikkila, Juha-pekka (1):
      drm/i915/display/xe3: disable x-tiled framebuffers

Himal Prasad Ghimiray (26):
      drm/xe: Add member initialized_domains to xe_force_wake()
      drm/xe/forcewake: Change awake_domain datatype
      drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
      drm/xe: Error handling in xe_force_wake_get()
      drm/xe: Modify xe_force_wake_put to handle _get returned mask
      drm/xe/device: Update handling of xe_force_wake_get return
      drm/xe/hdcp: Update handling of xe_force_wake_get return
      drm/xe/gsc: Update handling of xe_force_wake_get return
      drm/xe/gt: Update handling of xe_force_wake_get return
      drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
      drm/xe/devcoredump: Update handling of xe_force_wake_get return
      drm/xe/tests/mocs: Update xe_force_wake_get() return handling
      drm/xe/mocs: Update handling of xe_force_wake_get return
      drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
      drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
      drm/xe/guc: Update handling of xe_force_wake_get return
      drm/xe/huc: Update handling of xe_force_wake_get return
      drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
      drm/xe/pat: Update handling of xe_force_wake_get return
      drm/xe/gt_tlb_invalidation_ggtt: Update handling of
xe_force_wake_get return
      drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
      drm/xe/query: Update handling of xe_force_wake_get return
      drm/xe/vram: Update handling of xe_force_wake_get return
      drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
      drm/xe: Ensure __must_check for xe_force_wake_get() return
      drm/xe: Change return type to void for xe_force_wake_put

Huan Yang (7):
      udmabuf: pre-fault when first page fault
      udmabuf: change folios array from kmalloc to kvmalloc
      udmabuf: fix vmap_udmabuf error page set
      udmabuf: udmabuf_create pin folio codestyle cleanup
      udmabuf: introduce udmabuf init and deinit helper
      udmabuf: remove udmabuf_folio
      udmabuf: reuse folio array when pin folios

Hugo Villeneuve (1):
      drm: panel: jd9365da-h3: Remove unused num_init_cmds structure member

Igor Artemiev (1):
      drm/radeon/r600_cs: Fix possible int overflow in r600_packet3_check()

Ilia Levi (5):
      drm/xe: Introduce dedicated config for memirq debug
      drm/xe: Introduce xe_device_uses_memirq()
      drm/xe: move memirq out of VF
      drm/xe: memirq infra changes for MSI-X
      drm/xe: memirq handler changes

Ilya Bakoulin (3):
      drm/amd/display: Fix cursor visual confirm update
      drm/amd/display: Add 3DLUT FL HW bug workaround
      drm/amd/display: Minimize wait for pending updates

Imre Deak (16):
      drm/i915/dp: Dump the LTTPR PHY descriptors
      drm/i915/dp: Fix AUX IO power enabling for eDP PSR
      drm/i915/dp: Assume panel power is off if runtime suspended
      drm/i915/dp: Disable unnecessary HPD polling for eDP
      drm/xe/display: Separate the d3cold and non-d3cold runtime PM handlin=
g
      drm/xe/display: Add missing HPD interrupt enabling during
non-d3cold RPM resume
      drm/i915/dp_mst: Handle error during DSC BW overhead/slice calculatio=
n
      drm/i915/dp_mst: Don't require DSC hblank quirk for a non-DSC
compatible mode
      drm/i915/dp: Flush modeset commits during connector detection
      drm/i915/dp: Ensure panel power remains enabled during connector dete=
ction
      drm/i915/dp: Initialize the source OUI write timestamp always
      drm/i915/dp: Track source OUI validity explicitly
      drm/i915/dp: Reuse intel_dp_detect_dsc_caps() for eDP
      drm/i915/dp: Write the source OUI for eDP before detecting sink
capabilities
      drm/i915/dp: Write the source OUI during connector detection
      drm/i915/dp: Write the source OUI for non-eDP sinks as well

Jacek Lawrynowicz (11):
      accel/ivpu: Rename ivpu_log_level to fw_log_level
      accel/ivpu: Refactor functions in ivpu_fw_log.c
      accel/ivpu: Fix fw log printing
      accel/ivpu: Limit FW version string length
      accel/ivpu: Stop using hardcoded DRIVER_DATE
      accel/ivpu: Add auto selection logic for job scheduler
      accel/ivpu: Remove invalid warnings
      accel/ivpu: Increase MS info buffer size
      accel/ivpu: Fix ivpu_jsm_dyndbg_control()
      accel/ivpu: Remove HWS_EXTRA_EVENTS from test modes
      accel/ivpu: Fix typos in ivpu_pm.c

Jack Xiao (1):
      drm/amdgpu/mes12: correct kiq unmap latency

Jakob Hauser (5):
      dt-bindings: display: panel: Move flip properties to panel-common
      dt-bindings: display: panel: Add Samsung S6E88A0-AMS427AP24
      drm/panel: samsung-s6e88a0-ams427ap24: Add initial driver
      drm/panel: samsung-s6e88a0-ams427ap24: Add brightness control
      drm/panel: samsung-s6e88a0-ams427ap24: Add flip option

Jakub Pawlak (1):
      accel/ivpu: Add tracing for IPC/PM/JOB

Jane Jian (1):
      drm/amdgpu: Remove unneeded write in JPEG v4.0.3

Jani Nikula (144):
      drm/tegra: fix potential uninitialized variable use
      drm/exynos: hdmi: use display_info for printing display dimensions
      drm/exynos: hdmi: convert to struct drm_edid
      drm/mm: annotate drm_mm_node_scanned_block() with __maybe_unused
      drm/bridge/tdp158: fix build failure
      drm/i915/wm: move struct intel_watermark_params to i9xx_wm.c
      drm/i915/hdcp: split out intel_hdcp_shim.h for struct intel_hdcp_shim
      drm/i915/display: include drm/drm_probe_helper.h where needed
      drm/i915/display: include drm/drm_vblank.h where needed
      drm/i915/display: include media/cec-notifier.h and
linux/debugfs.h where needed
      drm/i915/fb: hide the guts of intel_fb_obj()
      drm/i915/display: drop extra includes from intel_display_types.h
      drm/i915/pciids: use designated initializers in INTEL_VGA_DEVICE()
      drm/i915/pciids: separate ARL and MTL PCI IDs
      drm/i915/display: pass display to intel_crtc_for_pipe()
      drm/i915/display: convert intel_display_trace.h to struct intel_displ=
ay
      drm/i915: use IS_ENABLED() instead of defined() on config options
      drm/i915/display: use to_intel_display() global state macros
      drm/xe/pciids: add some missing ADL-N PCI IDs
      drm/xe/pciids: separate RPL-U and RPL-P PCI IDs
      drm/xe/pciids: separate ARL and MTL PCI IDs
      drm/xe: use IS_ENABLED() instead of defined() on config options
      drm/i915/bios: fix printk format width
      Merge drm/drm-next into drm-intel-next
      drm/i915/reg: fix transcoder timing register style
      drm/i915/reg: fix g4x pipe data/link m/n register style
      drm/i915/reg: fix pipe conf, stat etc. register style
      drm/i915/reg: fix pipe data/link m/n register style
      drm/i915/reg: fix SKL scaler register style
      drm/i915/reg: fix PCH transcoder timing indentation
      drm/i915/reg: fix PCH transcoder timing and data/link m/n style
      drm/i915/reg: fix DIP CTL register style
      drm/i915/reg: fix small register style issues here and there
      drm/i915/reg: remove unused DSI register macros
      drm/i915/reg: remove superfluous whitespace
      drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request,
release} with __maybe_unused
      drm/i915: dump display parameters captured in error state, not curren=
t
      drm/i915/display: add intel_display_snapshot abstraction
      drm/i915/display: move device info and params handling to snapshot
      drm/i915/display: move dmc snapshotting to new display snapshot
      drm/kmb: annotate set_test_mode_src_osc_freq_target_{low,
hi}_bits() with __maybe_unused
      drm/imagination: annotate pvr_fw_version_packed() with __maybe_unused
      drm/i915: move intel_get_pipe_from_crtc_id_ioctl to intel_crtc.c
      drm/i915/display: move enum i9xx_plane_id to intel_display_limits.h
      drm/i915: add i9xx_display_irq_reset()
      drm/i915/pps: add vlv_ prefix to pps_pipe and active_pipe members
      drm/i915/pps: add bxt_ prefix to pps_reset
      drm/i915/pps: only touch the vlv_ members on VLV/CHV
      drm/i915/pps: add vlv_pps_pipe_init()
      drm/i915/pps: add vlv_pps_pipe_reset()
      drm/i915/pps: add vlv_pps_port_disable()
      drm/i915/pps: rename vlv_pps_init() to vlv_pps_port_enable_unlocked()
      drm/i915/pps: add vlv_pps_backlight_initial_pipe()
      drm/i915/pps: move vlv_active_pipe() to intel_pps.c
      drm/i915/debugfs: remove superfluous kernel_param_lock/unlock
      drm/i915/debugfs: add dedicated intel_display_caps debugfs for displa=
y
      drm/i915/display: remove small micro-optimizations in irq handling
      drm/xe/display: remove compat raw reg read/write support
      drm/i915/display: start a buffer object abstraction layer
      drm/i915/display: convert intel_atomic_plane.c to struct drm_gem_obje=
ct
      drm/i915/fb: convert parts of intel_fb.c to struct drm_gem_object
      drm/i915/fbdev: convert intel_fbdev.c to struct drm_gem_object
      drm/i915/display: convert skl_universal_plane.c to struct drm_gem_obj=
ect
      drm/i915/fb: convert intel_framebuffer_init() to struct drm_gem_objec=
t
      drm/i915/fb: convert intel_fb_bo_lookup_valid_bo() to struct
drm_gem_object
      drm/i915/fb: convert intel_fb_bo_framebuffer_init() to struct
drm_i915_gem_object
      drm/i915/fb: convert intel_fb_bo_framebuffer_fini() to struct
drm_i915_gem_object
      drm/xe/display: use correct bo type in intel_fbdev_fb_alloc()
      drm/i915/fb: convert intel_framebuffer_create() to struct drm_gem_obj=
ect
      drm/xe/display: stop using intel_fb_obj() in xe_fb_pin.c
      drm/i915/display: add intel_bo_read_from_page() and use it
      drm/i915/display: add intel_bo_get/set_frontbuffer() and use them
      drm/i915/frontbuffer: convert intel_frontbuffer_get() to struct
drm_gem_object
      drm/i915/frontbuffer: convert frontbuffer->obj to struct drm_gem_obje=
ct
      drm/i915/display: add intel_bo_describe() and use it
      drm/i915/fb: remove intel_fb_obj()
      drm/i915/display: clean up some gem/ includes
      drm/xe/compat: remove a bunch of compat gem headers
      drm/xe: remove a number of superfluous compat macros
      drm/xe: eradicate -Ddrm_i915_gem_object=3Dxe_bo
      drm/i915/dp: split out intel_dp_test.[ch] to a dedicated file
      drm/i915/dp: fix style issues in intel_dp_test.c
      drm/i915/dp: convert intel_dp_test.c struct intel_display
      drm/i915/dp: clean up intel_dp_test.[ch] interface
      drm/i915/dp: move DP test debugfs files next to the functionality
      drm/i915/dp: fix style issues in DP test debugfs
      drm/i915/display: remove the loop in fifo underrun debugfs file creat=
ion
      drm/i915/dp: convert DP test debugfs to struct intel_display
      drm/i915/dp: add intel_dp_test_reset() and intel_dp_test_short_pulse(=
)
      drm/i915/quirks: make intel_dpcd_quirks const
      drm/i915/pps: split intel_pps_reset_all() to vlv and bxt variants
      Merge drm/drm-next into drm-intel-next
      drm/i915/gem: fix bitwise and logical AND mixup
      drm/i915: use INTEL_WAKEREF_DEF instead of magic -1 for intel_wakeref=
_t
      drm/i915/display: return 0 instead of false for disabled power wakere=
f
      drm/i915/gt: add a macro for mock gt wakeref special value and use it
      drm/i915/audio: be explicit about intel_wakeref_t conversions
      drm/i915: switch intel_wakeref_t underlying type to struct ref_tracke=
r *
      drm/xe/compat: remove unused i915_gpu_error.h
      drm/i915: remove IS_LP()
      drm/i915/soc: stop using IS_GEN9_LP() and IS_GEN9_BC()
      drm/i915/hdcp: fix connector refcounting
      drm/i915/irq: add struct i915_irq_regs triplet
      drm/i915/irq: remove GEN3_IRQ_RESET() and GEN3_IRQ_INIT() macros
      drm/i915/irq: remove GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX() mac=
ros
      drm/i915: use NULL for zero wakeref_t instead of plain integer 0
      drm/file: fix client_name_lock kernel-doc warning
      drm/imx: add forward declarations for types
      drm/xe: fix build failure originating from backmerge
      drm/i915/gvt: use macros from drm_dp.h instead of duplication
      drm/i915: remove all IS_<PLATFORM>_GT<N>() macros
      drm/i915/display: convert I915_STATE_WARN() to struct intel_display
      drm/i915/pciids: add PVC PCI ID macros
      drm/intel/pciids: rename i915_pciids.h to just pciids.h
      drm/xe: switch to common PCI ID macros
      drm/i915/display: reindent subplatform initialization
      drm/i915/display: use a macro to initialize subplatforms
      drm/i915/display: use a macro to define platform enumerations
      drm/i915/display: join the platform and subplatform enums
      drm/i915/display: convert display platforms to lower case
      drm/i915/display: add display platforms structure with platform membe=
rs
      drm/i915/display: add platform member to struct intel_display
      drm/i915/display: remove the display platform enum as unnecessary
      drm/i915/display: add platform group for g4x
      drm/i915/display: add subplatform group for HSW/BDW ULT
      drm/i915/bios: use display->platform.<platform> instead of IS_<PLATFO=
RM>()
      drm/i915/pps: use display->platform.<platform> instead of IS_<PLATFOR=
M>()
      drm/i915/tv: use display->platform.<platform> instead of IS_<PLATFORM=
>()
      drm/i915/vga: use display->platform.<platform> instead of IS_<PLATFOR=
M>()
      drm/i915/vblank: drop unnecessary i915 local variable
      drm/i915/vblank: use display->platform.<platform> instead of
IS_<PLATFORM>()
      drm/i915/gmbus: convert to struct intel_display
      drm/i915/cx0: remove unnecessary includes
      drm/i915/cx0: convert to struct intel_display
      drm/i915/dpio: convert to struct intel_display
      drm/i915/hdcp: further conversion to struct intel_display
      drm/i915/dp/hdcp: convert to struct intel_display
      drm/i915/crt: convert to struct intel_display
      drm/i915/display: convert vlv_wait_port_ready() to struct intel_displ=
ay
      drm/i915/power: convert assert_chv_phy_status() to struct intel_displ=
ay
      drm/i915/ips: convert to struct intel_display
      drm/i915/dsi: convert to struct intel_display
      drm/i915/de: remove unnecessary generic wrappers
      drm/i915/display: use x100 version for full version and release

Javier Carrasco (8):
      drm/bridge: dpc3433: Constify struct regmap_config
      drm/fsl-dcu: Constify struct regmap_config
      drm/mediatek: dp: Constify struct regmap_config
      drm/meson: Constify struct regmap_config
      drm/panel: ili9322: Constify struct regmap_bus
      drm/sprd: Constify struct regmap_bus
      drm/mediatek: Fix child node refcount handling in early exit
      drm/mediatek: Switch to for_each_child_of_node_scoped()

Jean Delvare (1):
      drm/display: Drop obsolete dependency on COMPILE_TEST

Jeffrey Hugo (3):
      accel/qaic: Add ipc_router channel
      accel/qaic: Add AIC080 support
      accel/qaic: Add crashdump to Sahara

Jesse Zhang (2):
      drm/amdgpu: add amdgpu_gfx_sched_mask and
amdgpu_compute_sched_mask debugfs
      drm/amdgpu: add amdgpu_sdma_sched_mask debugfs

Jesse.zhang@amd.com (4):
      drm/amdgpu: Add sysfs interface for gc reset mask
      drm/amdgpu: Add sysfs interface for sdma reset mask
      drm/amdgpu: Add sysfs interface for vpe reset mask
      drm/amdgpu: Add sysfs interface for jpeg reset mask

Jiadong Zhu (7):
      drm/amdgpu/mes11: update mes_reset_queue function to support sdma que=
ue
      drm/amdgpu/sdma6: split out per instance resume function
      drm/amdgpu/sdma6: implement ring reset callback for sdma6
      drm/amdgpu/sdma5: split out per instance resume function
      drm/amdgpu/sdma5: implement ring reset callback for sdma5
      drm/amdgpu/sdma5.2: split out per instance resume function
      drm/amdgpu/sdma5.2: implement ring reset callback for sdma5.2

Jianhua Lu (1):
      drm: panel: nt36523: use devm_mipi_dsi_* function to register
and attach dsi

Jiapeng Chong (1):
      drm/xe/irq: Remove unneeded semicolon

JinZe Xu (1):
      drm/amd/display: Use region6 size in fw_meta_info

JinZe.Xu (1):
      drm/amd/display: Noitfy DMCUB of D0/D3 state in hardware init

Jinjie Ruan (8):
      drm/nouveau: Use for_each_child_of_node_scoped()
      drm/imagination: Use memdup_user() helper to simplify code
      drm/imagination: Use memdup_user() helper
      drm/panthor: Use the BITS_PER_LONG macro
      drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
      drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
      drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
      drm/msm/adreno: Use IRQF_NO_AUTOEN flag in request_irq()

Joaqu=C3=ADn Ignacio Aramend=C3=ADa (3):
      drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
      drm: panel-orientation-quirks: Add quirk for AYA NEO Founder edition
      drm: panel-orientation-quirks: Add quirk for AYA NEO GEEK

Jocelyn Falempe (3):
      drm/panic: Add ABGR2101010 support
      drm/nouveau/disp: Move tiling functions to dispnv50/tile.h
      drm/nouveau: Add drm_panic support for nv50+

John Harrison (12):
      drm/xe/guc: Remove spurious line feed in debug print
      drm/xe/devcoredump: Use drm_puts and already cached local variables
      drm/xe/devcoredump: Improve section headings and add tile info
      drm/xe/devcoredump: Add ASCII85 dump helper function
      drm/xe/guc: Copy GuC log prior to dumping
      drm/xe/guc: Use a two stage dump for GuC logs and add more info
      drm/xe/guc: Dead CT helper
      drm/xe/guc: Dump entire CTB on errors
      drm/xe/guc: Add GuC log to devcoredump captures
      drm/xe/guc: Add a helper function for dumping GuC log to dmesg
      drm/xe/guc: Capture all available bits of GuC timestamp
      drm/xe/guc: Separate full CTB content from guc_info debugfs

Jon Hunter (1):
      gpu: host1x: Fix boot regression for Tegra

Jonas Karlman (3):
      drm/rockchip: dw_hdmi: Filter modes based on hdmiphy_clk
      drm/rockchip: dw_hdmi: Enable 4K@60Hz mode on RK3399 and RK356x
      drm/rockchip: Load crtc devices in preferred order

Jonathan Cavitt (1):
      drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs

Jonathan Gray (1):
      drm: use ATOMIC64_INIT() for atomic64_t

Jonathan Kim (3):
      drm/amdkfd: sever xgmi io link if host driver has disable sharing
      drm/amdkfd: flag per-queue reset support for gfx9
      drm/amdkfd: remove gfx 12 trap handler page size cap

Joshua Aberback (3):
      drm/amd/display: Clip rect size changes should be full updates
      drm/amd/display: Clear pipe pointers on pipe reset
      drm/amd/display: Change MPC Tree visual confirm colours

Josip Pavic (1):
      drm/amd/display: Clear update flags after update has been applied

Jos=C3=A9 Exp=C3=B3sito (1):
      drm/vkms: Drop unnecessary call to drm_crtc_cleanup()

Jos=C3=A9 Roberto de Souza (2):
      drm/xe/oa: Fix overflow in oa batch buffer
      drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close

Jouni H=C3=B6gander (14):
      drm/i915/display: Handle MST connector in intel_attached_dp
      drm/i915/display: Use intel_attached_dp instead of local implementati=
on
      drm/i915/psr: Add connector debugfs files for MST connector as well
      drm/i915/psr: Do not wait for PSR being idle on on Panel Replay
      drm/i915/psr: eDP Panel Replay is not supported on pipes other
than A and B
      drm/i915/psr: Add intel_psr_needs_block_dc_vblank for blocking dc ent=
ry
      drm/i915/display: Prevent DC6 while vblank is enabled for Panel Repla=
y
      Revert "drm/i915/psr: Implement WA to help reach PC10"
      drm/i915/psr: Add new SU area calculation helper to apply workarounds
      drm/i915/psr: Implement Wa 14019834836
      drm/i915/display: Add own counter for Panel Replay vblank workaround
      drm/i915/display: Fix Panel Replay vblank enable workaround
      drm/i915/psr: vbt.psr.enable is only for eDP panels
      drm/i915/psr: WA for panels stating bad link status after PSR is enab=
led

Juha-Pekka Heikkila (4):
      drm/i915/display: Fix BMG CCS modifiers
      drm/xe: add interface to request physical alignment for buffer object=
s
      drm/xe/display: align framebuffers according to hw requirements
      drm/i915/display: Don't allow tile4 framebuffer to do hflip on
display20 or greater

Julia Lawall (1):
      drm/amd/display: Reorganize kerneldoc parameter names

Juston Li (1):
      drm/i915/guc: Enable PXP GuC autoteardown flow

Kaitlyn Tse (3):
      drm/amd/display: Initialize replay_config var
      drm/amd/display: Initialize new backlight_level_params structure
      drm/amd/display: Implement new backlight_level_params structure

Karol Wachowski (22):
      accel/ivpu: Add coredump support
      accel/ivpu: Set 500 ns delay between power island TRICKLE and ENABLE
      accel/ivpu: Turn on autosuspend on Simics
      accel/ivpu: Add FW version debugfs entry
      accel/ivpu: Remove 1-tile power up Simics workaround
      accel/ivpu: Add one jiffy to bo_wait_ioctl timeout value
      accel/ivpu: Print JSM message result in case of error
      accel/ivpu: Remove skip of clock own resource ack on Simics
      accel/ivpu: Prevent recovery invocation during probe and resume
      accel/ivpu: Refactor failure diagnostics during boot
      accel/ivpu: Do not fail on cmdq if failed to allocate preemption buff=
ers
      accel/ivpu: Use whole user and shave ranges for preemption buffers
      accel/ivpu: Update power island delays
      accel/ivpu: Do not fail when more than 1 tile is fused
      accel/ivpu: Defer MMU root page table allocation
      accel/ivpu: Clear CDTAB entry in case of failure
      accel/ivpu: Unmap partially mapped BOs in case of errors
      accel/ivpu: Use xa_alloc_cyclic() instead of custom function
      accel/ivpu: Make command queue ID allocated on XArray
      accel/ivpu: Don't allocate preemption buffers when MIP is disabled
      accel/ivpu: Increase DMA address range
      accel/ivpu: Move secondary preemption buffer allocation to DMA range

Kaustabh Chakraborty (5):
      drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference
in functions
      drm/exynos: exynos7_drm_decon: fix ideal_clk by converting it to Hz
      drm/exynos: exynos7_drm_decon: properly clear channels during bind
      drm/exynos: exynos7_drm_decon: add driver data and support for Exynos=
7870
      dt-bindings: display: samsung,exynos7-decon: add exynos7870 compatibl=
e

Kenneth Feng (5):
      drm/amd/pm: update the driver-fw interface file for smu v14.0.2/3
      drm/amd/pm: update overdrive function on smu v14.0.2/3
      drm/amd/pm: update deep sleep status on smu v14.0.2/3
      drm/amd/pm: always pick the pptable from IFWI
      drm/amd/pm: correct the workload setting

Kent Russell (1):
      amdgpu: Don't print L2 status if there's nothing to print

Konrad Dybcio (1):
      drm/msm/dpu: Add support for MSM8996

Krzysztof Kozlowski (8):
      dt-bindings: display/msm: merge SC8280XP DPU into SC7280
      dt-bindings: display/msm: merge SM8250 DPU into SM8150
      dt-bindings: display/msm: merge SM8350 DPU into SC7280
      dt-bindings: display/msm: merge SM8450 DPU into SC7280
      dt-bindings: display/msm: merge SM8550 DPU into SC7280
      drm/meson: drop unused static dw_hdmi_dwc_write_bits
      dt-bindings: display: bridge: tc358768: switch to bus-width
      drm/bridge: tc358768: switch to bus-width

Kunwu Chan (1):
      gpu: host1x: Make host1x_context_device_bus_type constant

Kwanghoon Son (1):
      drm/exynos: remove unused prototype for crtc

Lang Yu (3):
      drm/amdkfd: Remove an unused parameter in queue creation
      drm/amdkfd: Fix an eviction fence leak
      drm/amdgpu: refine error handling in amdgpu_ttm_tt_pin_userptr

Le Ma (1):
      drm/amdgpu: add generic func to check if ta fw is applicable

Leo (Hanghong) Ma (1):
      drm/amd/display: Fix Coverity change for visual confirm

Leo Chen (2):
      drm/amd/display: Full exit out of IPS2 when all allow signals
have been cleared
      drm/amd/display: Adding array index check to prevent memory corruptio=
n

Leo Li (2):
      Revert "drm/amd/display: change the panel power savings level
without a modeset"
      drm/amd/display: Enable idle workqueue for more IPS modes

Leo Ma (1):
      drm/amd/display: Fix underflow when playing 8K video in full screen m=
ode

Leon Huang (1):
      drm/amd/display: Refactor HPD IRQ error checking flow

Li Huafei (2):
      drm/nouveau/gr/gf100: Fix missing unlock in gf100_gr_chan_new()
      drm/amdgpu: Fix the memory allocation issue in
amdgpu_discovery_get_nps_info()

Li Zetao (1):
      drm/nouveau/volt: use clamp() in nvkm_volt_map()

Liao Chen (2):
      drm/bridge: it6505: Enable module autoloading
      drm/mcde: Enable module autoloading

Lijo Lazar (34):
      drm/amdgpu: Fix JPEG v4.0.3 register write
      drm/amdgpu: Add init levels
      drm/amdgpu: Use init level for pending_reset flag
      drm/amdgpu: Separate reinitialization after reset
      drm/amd: Add helper to get partition config modes
      drm/amdgpu: Add callback get xcp resource info
      drm/amdgpu: Add reset on init handler for XGMI
      drm/amdgpu: Add helper to initialize badpage info
      drm/amdgpu: Refactor XGMI reset on init handling
      drm/amdgpu: Drop delayed reset work handler
      drm/amdgpu: Support reset-on-init on select SOCs
      drm/amdgpu: Add interface for TOS reload cases
      drm/amdgpu: Add PSP reload case to reset-on-init
      drm/amdgpu: Add sysfs nodes to get xcp details
      drm/amdgpu: Add option to refresh NPS data
      drm/amdgpu: Fix logic to determine TOS reload
      drm/amdgpu: Add gmc interface to request NPS mode
      drm/amdgpu: Add sysfs interfaces for NPS mode
      drm/amdgpu: Place NPS mode request on unload
      drm/amdgpu: Check gmc requirement for reset on init
      drm/amdgpu: Add NPS switch support for GC 9.4.3
      drm/amdgpu: Fetch NPS mode for GCv9.4.3 VFs
      drm/amdgpu: Show current compute partition on VF
      drm/amdgpu: Wait for reset on init completion
      drm/amdgpu: Zero-initialize mqd backup memory
      drm/amdgpu: Use SPX as default in partition config
      drm/amdgpu: Save VCN shared memory with init reset
      drm/amdgpu: Fix the logic for NPS request failure
      drm/amdgpu: Group gfx sysfs functions
      drm/amdgpu: Skip IP coredump for RAS errors
      drm/amdgpu: Add compatible NPS mode info
      drm/amdgpu: Fix DPX valid mode check on GC 9.4.3
      drm/amdgpu: Fix map/unmap queue logic
      drm/amdgpu: Avoid kcq disable during reset

Linus Walleij (1):
      drm/panel: nt35510: Make new commands optional

Liu Xi (Alex) (1):
      drm/amd/display: add more support for UHBR10 eDP

Liu Ying (9):
      drm/bridge: ite-it66121: Drop hdmi_avi_infoframe_init() function call
      media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
      drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA, SPWG} LVDS
data mappings
      drm: of: Add drm_of_lvds_get_dual_link_pixel_order_sink()
      dt-bindings: display: lvds-data-mapping: Add 30-bit RGB pixel
data mappings
      dt-bindings: display: Document dual-link LVDS display common properti=
es
      dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
      drm/bridge: Add ITE IT6263 LVDS to HDMI converter
      MAINTAINERS: Add maintainer for ITE IT6263 driver

Lohita Mudimela (1):
      drm/amd/display: Refactoring if and endif statements to enable DC_LOG=
GER

Longlong Xia (1):
      accel/qaic: Change to use DEFINE_SHOW_ATTRIBUTE macro

Louis Chauvet (5):
      MAINTAINERS: Add myself as VKMS Maintainer
      drm/vkms: Add documentation
      drm/vkms: Suppress context imbalance detected by sparse warning
      drm/vkms: Add missing check for CRTC initialization
      drm/vkms: Remove usage of legacy drm_crtc members

Lu Baolu (1):
      drm/nouveau/tegra: Use iommu_paging_domain_alloc()

Lucas De Marchi (11):
      drm/xe: Cleanup has_flat_ccs handling
      drm/xe: Update runtime detection of has_flat_ccs
      drm/xe: Fix arg to pci_iomap()
      drm/xe: Mark reserved engines in snapshot
      drm/i915/pmu: Drop is_igp()
      drm/i915/pmu: Use event_to_pmu()
      Merge drm/drm-next into drm-xe-next
      drm/xe/rtp: Remove unneeded semicolon
      drm/xe/query: Increase timestamp width
      drm/xe/query: Move timestamp reg to hwe_read_timestamp()
      drm/xe/query: Tidy up error EFAULT returns

Lucas Stach (7):
      drm/etnaviv: hold GPU lock across perfmon sampling
      drm/etnaviv: assert GPU lock held in perfmon pipe_*_read functions
      drm/etnaviv: unconditionally enable debug registers
      drm/etnaviv: update hardware headers from rnndb
      drm/etnaviv: take current primitive into account when checking
for hung GPU
      drm/etnaviv: always allocate 4K for kernel ringbuffers
      drm/etnaviv: flush shader L1 cache after user commandstream

Lukasz Luba (1):
      drm/msm/gpu: Check the status of registration to PM QoS

Lyude Paul (1):
      drm/panic: Fix uninitialized spinlock acquisition with CONFIG_DRM_PAN=
IC=3Dn

Ma Ke (3):
      drm/sti: avoid potential dereference of error pointers in
sti_hqvdp_atomic_check
      drm/sti: avoid potential dereference of error pointers in
sti_gdp_atomic_check
      drm/sti: avoid potential dereference of error pointers

Maarten Lankhorst (5):
      drm/xe: Fix missing conversion to xe_display_pm_runtime_resume
      drm/xe: Remove runtime argument from display s/r functions
      drm/xe: Wire up device shutdown handler
      drm/xe: Fix DSB buffer coherency
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Maaz Mombasawala (1):
      drm/vmwgfx: Stop using dev_private to store driver data.

Maciej Falkowski (2):
      accel/ivpu: Add initial Panther Lake support
      accel/ivpu: Add debug Kconfig option

Mahadevan (4):
      dt-bindings: display/msm: Document MDSS on SA8775P
      dt-bindings: display/msm: Document the DPU for SA8775P
      drm/msm: mdss: Add SA8775P support
      drm/msm/dpu: Add SA8775P support

Manikandan Muralidharan (2):
      dt-bindings: display: panel-simple: Document support for
Microchip AC69T88A
      drm/panel: simple: Add Microchip AC69T88A LVDS Display panel

Marc Gonzalez (2):
      dt-bindings: display: bridge: add TI TDP158
      drm/bridge: add support for TI TDP158

Marek Vasut (1):
      drm/bridge: tc358767: Fix use of unadjusted mode in the driver

Mario Limonciello (4):
      drm/amd: Taint the kernel when enabling overdrive
      drm/amd/display: Fetch the EDID from _DDC if available for eDP
      drm/amd: Guard against bad data for ATIF ACPI method
      drm/amd/display: Disable PSR-SU on Parade 08-01 TCON too

Mary Guillemard (5):
      drm/panfrost: Add SYSTEM_TIMESTAMP and
SYSTEM_TIMESTAMP_FREQUENCY parameters
      drm/panfrost: Add cycle counter job requirement
      drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
      drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME group priority
      drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query

Matt Coster (1):
      drm/imagination: Use pvr_vm_context_get()

Matt Roper (51):
      drm/xe: Move forcewake to 'gt.pm' substructure
      drm/xe: Create dedicated xe_mmio structure
      drm/xe: Clarify size of MMIO region
      drm/xe: Move GSI offset adjustment fields into 'struct xe_mmio'
      drm/xe: Populate GT's mmio iomap from tile during init
      drm/xe: Switch mmio_ext to use 'struct xe_mmio'
      drm/xe: Add xe_tile backpointer to xe_mmio
      drm/xe: Adjust mmio code to pass VF substructure to SRIOV code
      drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
      drm/xe/irq: Convert register access to use xe_mmio
      drm/xe/pcode: Convert register access to use xe_mmio
      drm/xe/hwmon: Convert register access to use xe_mmio
      drm/xe/vram: Convert register access to use xe_mmio
      drm/xe/compat-i915: Convert register access to use xe_mmio
      drm/xe/lmtt: Convert register access to use xe_mmio
      drm/xe/stolen: Convert register access to use xe_mmio
      drm/xe/device: Convert register access to use xe_mmio
      drm/xe/pci: Convert register access to use xe_mmio
      drm/xe/wa: Convert register access to use xe_mmio
      drm/xe/uc: Convert register access to use xe_mmio
      drm/xe/guc: Convert register access to use xe_mmio
      drm/xe/huc: Convert register access to use xe_mmio
      drm/xe/gsc: Convert register access to use xe_mmio
      drm/xe/query: Convert register access to use xe_mmio
      drm/xe/mcr: Convert register access to use xe_mmio
      drm/xe/mocs: Convert register access to use xe_mmio
      drm/xe/hw_engine: Convert register access to use xe_mmio
      drm/xe/gt_throttle: Convert register access to use xe_mmio
      drm/xe/pat: Convert register access to use xe_mmio
      drm/xe/wopcm: Convert register access to use xe_mmio
      drm/xe/oa: Convert register access to use xe_mmio
      drm/xe/topology: Convert register access to use xe_mmio
      drm/xe/execlist: Convert register access to use xe_mmio
      drm/xe/gt_clock: Convert register access to use xe_mmio
      drm/xe/reg_sr: Convert register access to use xe_mmio
      drm/xe/gt: Convert register access to use xe_mmio
      drm/xe/sriov: Convert register access to use xe_mmio
      drm/xe/tlb: Convert register access to use xe_mmio
      drm/xe/gt_idle: Convert register access to use xe_mmio
      drm/xe/forcewake: Convert register access to use xe_mmio
      drm/xe/ggtt: Convert register access to use xe_mmio
      drm/xe/ccs_mode: Convert register access to use xe_mmio
      drm/xe/mmio: Drop compatibility macros
      drm/xe: Defer gt->mmio initialization until after multi-tile setup
      drm/xe: Move IRQ-related registers to dedicated header
      drm/xe: Make wedged_mode debugfs writable
      drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
      drm/xe/xe3lpm: Add new "instance0" steering table
      drm/i915/xe3lpd: Adjust watermark calculations
      drm/i915/xe3lpd: Add new display power wells
      drm/i915/xe3lpd: Update pmdemand programming

Matthew Auld (19):
      drm/xe: prevent potential UAF in pf_provision_vf_ggtt()
      drm/xe/pat: sanity check compression and coh_mode
      drm/xe/client: fix deadlock in show_meminfo()
      drm/xe/client: add missing bo locking in show_meminfo()
      drm/xe/client: use mem_type from the current resource
      drm/xe/bo: add some annotations in bo_put()
      drm/xe/vram: fix ccs offset calculation
      drm/xe/guc_submit: add missing locking in wedged_fini
      drm/xe: fix UAF around queue destruction
      drm/xe/vm: move xa_alloc to prevent UAF
      drm/xe/queue: move xa_alloc to prevent UAF
      drm/xe/ct: prevent UAF in send_recv()
      drm/xe/ct: fix xa_store() error checking
      drm/xe/guc_submit: fix xa_store() error checking
      drm/xe/ct: drop irq usage of xa_erase()
      drm/xe/bmg: improve cache flushing behaviour
      drm/xe: fix unbalanced rpm put() with fence_fini()
      drm/xe: fix unbalanced rpm put() with declare_wedged()
      drm/xe/xe_sync: initialise ufence.signalled

Matthew Brost (16):
      drm/xe: Do not run GPU page fault handler on a closed VM
      drm/xe: Convert to USM lock to rwsem
      drm/xe: Use helper for ASID -> VM in GPU faults and access counters
      drm/xe: Clean up VM / exec queue file lock usage.
      drm/xe: Resume TDR after GT reset
      drm/xe: Fix memory leak when aborting binds
      drm/xe: Take job list lock in xe_sched_add_pending_job
      drm/xe: Don't free job in TDR
      drm/xe: Use bookkeep slots for external BO's in exec IOCTL
      drm/xe: Use __counted_by for flexible arrays
      drm/xe: Take ref to job's fence in arm
      drm/xe: Mark GGTT work queue with WQ_MEM_RECLAIM
      drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
      drm/xe: Mark GT work queue with WQ_MEM_RECLAIM
      drm/xe: Add mmio read before GGTT invalidate
      drm/xe: Don't short circuit TDR on jobs not started

Matthias Brugger (1):
      drm/v3d: Drop allocation of object without mountpoint

Matthias Schiffer (1):
      drm: fsl-dcu: enable PIXCLK on LS1021A

Maxime Ripard (15):
      drm/vc4: hdmi: Warn if writing to an unknown HDMI register
      drm/vc4: hvs: More logging for dlist generation
      drm/vc4: hvs: Print error if we fail an allocation
      drm/vc4: plane: Add more debugging for LBM allocation
      drm/vc4: plane: Use return variable in atomic_check
      drm/vc4: crtc: Move assigned_channel to a variable
      drm/vc4: Introduce generation number enum
      drm/vc4: Make v3d paths unavailable on any generation newer than vc4
      drm/vc4: hvs: Use switch statement to simplify
vc4_hvs_get_fifo_from_output
      drm/vc4: hvs: Create hw_init function
      drm/vc4: hvs: Create cob_init function
      drm/vc4: hvs: Rename hvs_regs list
      drm/vc4: plane: Change ptr0_offset to an array
      drm/vc4: hvs: Rework LBM alignment
      drm/vc4: hvs: Change prototype of __vc4_hvs_alloc to pass registers

Ma=C3=ADra Canal (14):
      drm/v3d: Address race-condition in MMU flush
      drm/v3d: Flush the MMU before we supply more memory to the binner
      drm/v3d: Fix return if scheduler initialization fails
      drm/gem: Create a drm_gem_object_init_with_mnt() function
      drm/v3d: Introduce gemfs
      drm/gem: Create shmem GEM object in a given mountpoint
      drm/v3d: Reduce the alignment of the node allocation
      drm/v3d: Support Big/Super Pages when writing out PTEs
      drm/v3d: Use gemfs/THP in BO creation if available
      drm/v3d: Add modparam for turning off Big/Super Pages
      drm/v3d: Expose Super Pages capability
      drm/vc4: Use `vc4_perfmon_find()`
      MAINTAINERS: Add Ma=C3=ADra to VC4 reviewers
      MAINTAINERS: Remove myself as a VKMS maintainer

Meenakshikumar Somasundaram (1):
      drm/amd/display: Adding flag for forced MST blocked discovery

Melissa Wen (5):
      drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
      drm/amd/display: switch to setting physical address directly
      drm/amd/display: always call connector_update when parsing freesync_c=
aps
      drm/amd/display: remove redundant freesync parser for DP
      drm/amd/display: add missing tracepoint event in DM atomic_commit_tai=
l

Michael Chen (1):
      drm/amdgpu/mes: fix issue of writing to the same log buffer from
2 MES pipes

Michael Strauss (1):
      drm/amd/display: Block UHBR Based On USB-C PD Cable ID

Michal Wajdeczko (16):
      drm/xe/pf: Sanitize VF scratch registers on FLR
      drm/xe: Don't keep stale pointer to bo->ggtt_node
      drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros
      drm/xe/guc: Add PF2GUC_SAVE_RESTORE_VF to ABI
      drm/xe/pf: Add functions to save and restore VF GuC state
      drm/xe/pf: Save VF GuC state when pausing VF
      drm/xe/pf: Allow to view and replace VF GuC state over debugfs
      drm/xe/pf: Allow to trigger VF GuC state restore from debugfs
      drm/xe: Add memirq report page address helpers
      drm/xe/guc: Add yet another helper macro for threshold
      drm/xe/pf: Update success code of pf_validate_vf_config()
      drm/xe/pf: Allow to encode subset of VF configuration KLVs
      drm/xe/pf: Add functions to save and restore VF configuration blob
      drm/xe/pf: Allow to save and restore VF config blob from debugfs
      drm/print: Introduce drm_line_printer
      drm/xe/pf: Show VFs LMEM provisioning summary over debugfs

Miguel Ojeda (1):
      drm/panic: Select ZLIB_DEFLATE for DRM_PANIC_SCREEN_QR_CODE

Mikko Perttunen (6):
      drm/tegra: gem: Open code drm_prime_gem_destroy
      drm/tegra: gem: Don't attach dma-bufs when not needed
      gpu: host1x: Fix _writel function declarations
      gpu: host1x: Handle CDMA wraparound when debug printing
      gpu: host1x: Complete stream ID entry tables
      gpu: host1x: Add MLOCK recovery for rest of engines

Min-Hua Chen (1):
      drm/panel: khadas-ts050: make ts050[v2]_panel_data static

Mitul Golani (1):
      drm/i915/vrr: Add helper to check if vrr possible

Mohammed Anees (1):
      drm/amdgpu: prevent BO_HANDLES error from being overwritten

Muyuan Yang (2):
      drm/amd/display: Change Brightness Control Priority
      drm/amd/display: Introduce New ABC Framework for Brightness Control

Nemesa Garg (1):
      drm/i915/display: Add Wa_16023981245

Nicholas Kazlauskas (1):
      drm/amd/display: Remove inaccessible registers from DMU diagnostics

Nickey Yang (1):
      drm/rockchip: dw_hdmi: Add phy_config for 594Mhz pixel clock

Nikita Zhandarovich (1):
      drm/i915/guc: prevent a possible int overflow in wq offsets

Nirmoy Das (5):
      drm/xe/ufence: ufence can be signaled right after wait_woken
      drm/xe: Add caller info to xe_gt_reset_async
      drm/xe/ufence: Prefetch ufence addr to catch bogus address
      drm/xe/ufence: Warn if mmget_not_zero() fails
      drm/xe: Don't restart parallel queues multiple times on GT reset

Nitin Gote (2):
      drm/xe: Replace double space with single space after comma
      drm/i915/gt: Retry RING_HEAD reset until it get sticks

Ovidiu Bunea (4):
      drm/amd/display: Add IPS residency capture helpers to dc_dmub_srv
      drm/amd/display: Optimize power up sequence for specific OLED
      Revert "drm/amd/display: update DML2 policy
EnhancedPrefetchScheduleAccelerationFinal DCN35"
      drm/amd/display: Do not read DSC state if not in use

Paul Hsieh (1):
      drm/amd/display: Add logs to record register read/write

Peterson (1):
      drm/amd/display: Fix low black values by increasing error

Philip Yang (5):
      drm/amdkfd: Output migrate end event if migrate failed
      drm/amdkfd: Increase SMI event fifo size
      drm/amdkfd: Copy wave state only for compute queue
      drm/amdkfd: SMI report dropped event count
      drm/amdkfd: Accounting pdd vram_usage for svm

Philipp Stanner (4):
      drm/sched: memset() 'job' in drm_sched_job_init()
      drm/sched: warn about drm_sched_job_init()'s partial init
      drm/sched: Document purpose of drm_sched_{start,stop}
      drm/sched: Improve teardown documentation

Philipp Zabel (2):
      drm/panel: ilitek-ili9881c: Explicitly set address mode, allow
180=C2=B0 rotation
      drm/panel: ilitek-ili9881c: Report subpixel order according to rotati=
on

Pierre-Eric Pelloux-Prayer (7):
      drm/amd/pm: remove dump_pptable functions
      drm/amd/pm: fix rpm refcount handling on error
      drm/amd/pm: use pm_runtime_resume_and_get
      drm/amd/pm: don't update runpm last_usage on debugfs getter
      drm/amd/pm: use pm_runtime_get_if_active for debugfs getters
      drm: add DRM_SET_CLIENT_NAME ioctl
      drm: use drm_file client_name in fdinfo

Pin-yen Lin (2):
      drm/bridge: anx7625: Drop EDID cache on bridge power off
      drm/bridge: it6505: Drop EDID cache on bridge power off

Pintu Kumar (2):
      dma-buf: fix S_IRUGO to 0444, block comments, func declaration
      dma-buf/heaps: replace kmap_atomic with kmap_local_page

Prike Liang (6):
      drm/amdgpu: update suspend status for aborting from deeper suspend
      drm/amdgpu: Dereference the ATCS ACPI buffer
      drm/amdgpu: correct the S3 abort check condition
      drm/amdgpu: clean up the suspend_complete
      drm/amdgpu: Fix dummy_read_page overlapping mappings
      drm/amdgpu: set the right AMDGPU sg segment limitation

Puranam V G Tejaswi (2):
      drm/msm/a6xx: Add support for A663
      dt-bindings: display/msm/gmu: Add Adreno 663 GMU

Qiang Yu (1):
      drm/fourcc: add AMD_FMT_MOD_TILE_GFX9_4K_D_X

R Sundar (4):
      drm: Fix for kernel doc warning
      drm/i915/dp: use string choice helpers
      drm/i915/ddi: use string choice helpers
      drm/amdgpu: use string choice helpers

Raag Jadav (1):
      drm/i915/hwmon: expose package temperature

Radhakrishna Sripada (1):
      drm/i915/xe3lpd: Add cdclk changes

Rajneesh Bhardwaj (1):
      drm/amdgpu: Add PSP interface for NPS switch

Ramesh Errabolu (1):
      drm/amdgpu: Inform if PCIe based P2P links are not available

Randy Dunlap (1):
      drm/fbdev-dma: remove obsolete kernel-doc references

Ravi Kumar Vodapalli (1):
      drm/i915/xe3: Underrun recovery does not exist post Xe2

Revalla Hari Krishna (1):
      drm/amd/display: Change parameters to fix certain compiler errors

Riana Tauro (2):
      drm/xe/xe_gt_idle: modify powergate enable condition
      drm/xe/xe_gt_idle: add debugfs entry for powergating info

Rob Clark (2):
      Merge branch 'msm-fixes' into msm-next
      Merge remote-tracking branch 'drm-misc/drm-misc-next' into msm-next

Robin Chen (1):
      drm/amd/display: Read Sink emission rate capability

Rodrigo Siqueira (5):
      MAINTAINERS: remove myself as a VKMS maintainer
      Documentation/gpu: Document how to narrow down display issues
      Documentation/gpu/amdgpu: Add programming model for DCN
      drm/amd/display: Remove unused code
      drm/amd/display: Adjust VSDB parser for replay feature

Rodrigo Vivi (10):
      drm/xe: Suppress missing outer rpm protection warning
      drm/i915/irq: Remove duplicated irq_enabled variable
      drm/i915/irq: Move irqs_enabled out of runtime_pm
      drm/i915/irq: Rename suspend/resume functions
      drm/i915/irq: Uninstall should be called just once
      drm/xe/display: Remove i915_drv.h include
      drm/xe: Restore pci state upon resume
      drm/xe/pciids: Add PVC's PCI device ID macros
      Merge drm/drm-next into drm-intel-next
      drm/i915: Fix irq related documentation

Rohit Chavan (1):
      drm/amd/display: Fix unnecessary cast warnings from checkpatch

Roman Li (3):
      drm/amd/display: Align static screen idle worker with IPX mode
      drm/amd/display: Increase idle worker HPD detection time
      drm/amd/display: Add check for headless for idle optimization

Ryan Seto (2):
      drm/amd/display: Adjust PHY FSM transition to TX_EN-to-PLL_ON for TMD=
S
      drm/amd/display: Handle dml allocation failure to avoid crash

Ryan Walklin (1):
      drm: panel: nv3052c: correct spi_device_id for RG35XX panel

Sai Teja Pottumuttu (2):
      drm/i915: Remove unused underrun irq/reporting bits
      drm/i915: Use string enable/disable choice helpers

Samson Tam (9):
      drm/amd/display: disable adaptive scaler and sharpener when
integer scaling is enabled
      drm/amd/display: fix static analysis warnings
      drm/amd/display: add sharpening policy to plane state
      drm/amd/display: disable dynamic ODM when sharpness is enabled
      drm/amd/display: update fullscreen status to SPL
      drm/amd/display: fix handling of max_downscale_src_width fail check i=
n SPL
      drm/amd/display: store sharpness 1dlut table in dscl_prog_data
      drm/amd/display: fix asserts in SPL during bootup
      drm/amd/display: SPL cleanup

Sathishkumar S (2):
      drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs
      drm/amdgpu: Normalize reg offsets on VCN v4.0.3

Sean Anderson (8):
      drm: zynqmp_kms: Unplug DRM device before removal
      drm: zynqmp_dp: Add locking
      drm: zynqmp_dp: Don't retrain the link in our IRQ
      drm: zynqmp_dp: Convert to a hard IRQ
      drm: zynqmp_dp: Use AUX IRQs instead of polling
      drm: zynqmp_dp: Split off several helper functions
      drm: zynqmp_dp: Take dp->lock in zynqmp_dp_hpd_work_func
      drm: zynqmp_dp: Add debugfs interface for compliance testing

Shaoyun Liu (3):
      drm/amd/amdkfd: add/remove kfd queues on start/stop KFD scheduling
      drm/amd : Update MES API header file for v11 & v12
      drm/amd/amdgpu: limit single process inside MES

Shekhar Chauhan (2):
      drm/xe/ptl: L3bank mask is not available on the media GT
      drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.

Shen Lichuan (3):
      drm/i915/gvt: Correct multiple typos in comments
      drm/msm: Fix some typos in comment
      drm/exynos: gsc: Fix typo in comment

Shuicheng Lin (4):
      drm/scheduler: Improve documentation
      drm/xe: Enlarge the invalidation timeout from 150 to 500
      drm/i915/dp: Fix memory leak in parse_lfp_panel_dtd()
      drm/xe: Handle unreliable MMIO reads during forcewake

Shunlu Zhang (1):
      drm/amd/display: Change dc_surface_update cm2_params to const

Simon Horman (1):
      accel/qaic: Pass string literal as format argument of alloc_workqueue=
()

Soutrik Mukhopadhyay (2):
      dt-bindings: display: msm: dp-controller: document SA8775P compatible
      drm/msm/dp: Add DisplayPort controller for SA8775P

Sridevi Arvindekar (1):
      drm/amd/display: Assign socclk in dml

Srinivasan Shanmugam (20):
      drm/amd/display: Fix out-of-bounds access in 'dcn21_link_encoder_crea=
te'
      drm/amdkfd: Fix kdoc entry for 'get_wave_count()' function parameters
      drm/amdgpu/gfx9: Add Cleaner Shader Deinitialization in gfx_v9_0 Modu=
le
      drm/amdgpu/gfx10: Implement cleaner shader support for GFX10 hardware
      drm/amdgpu/gfx11: Implement cleaner shader support for GFX11 hardware
      drm/amdgpu/gfx12: Implement cleaner shader support for GFX12 hardware
      drm/amdgpu/gfx11: Apply Isolation Enforcement to GFX & Compute rings
      drm/amdgpu/gfx10: Apply Isolation Enforcement to GFX & Compute rings
      drm/amdgpu/gfx12: Apply Isolation Enforcement to GFX & Compute rings
      drm/amd/display: Add hpd_source index out-of-bounds check for
dcn3x link encoder creation
      drm/amd/amdgpu: Fix double unlock in amdgpu_mes_add_ring
      drm/amd/display: Ensure HPD source index is valid for
dcn20/dcn201 link encoders
      drm/amd/display: Add hpd_source index check for
DCE60/80/100/110/112/120 link encoders
      drm/amd/display: Add hpd_source index check for dcn10 link encoder se=
tup
      drm/amd/display: Add hpd_source index check for dcn401 link encoder s=
etup
      drm/amdgpu/gfx9: Add cleaner shader for GFX9.4.2
      drm/amdkfd: Use dynamic allocation for CU occupancy array in
'kfd_get_cu_occupancy()'
      drm/amdgpu/gfx11: Add cleaner shader for GFX11.0.3
      drm/amdgpu: Add documentation for enforce isolation feature
      drm/amdgpu/gfx11: Enable cleaner shader for GFX11.0.0/11.0.2 GPUs

Stanislav Lisovskiy (7):
      drm/i915: Add some essential functionality for joiners
      drm/i915: Add bigjoiner and uncompressed joiner hw readout sanity che=
cks
      drm/i915: Implement hw state readout and checks for ultrajoiner
      drm/i915/display/vdsc: Add ultrajoiner support with DSC
      drm/i915/dp: Simplify helper to get slice count with joiner
      drm/i915: Compute config and mode valid changes for ultrajoiner
      drm/i915: Implement Dbuf overlap detection feature starting from LNL

Stanley.Yang (1):
      drm/amdgpu: Support vcn and jpeg error info parsing

Steffen Dirkwinkel (2):
      drm: xlnx: zynqmp_disp: layer may be null while releasing
      drm: xlnx: zynqmp_dpsub: fix hotplug detection

Steven Price (2):
      drm/panthor: Display FW version information
      drm/panfrost: Remove unused id_mask from struct panfrost_model

Sui Jingfeng (9):
      drm/etnaviv: Use unsigned type to count the number of pages
      drm/etnaviv: Use 'unsigned' type to count the number of pages
      drm/etnaviv: Drop the <linux/pm_runtime.h> header
      drm/etnaviv: Fix missing mutex_destroy()
      drm/etnaviv: Replace the '&pdev->dev' with 'dev'
      drm/etnaviv: Record GPU visible size of GEM BO separately
      drm/etnaviv: Map and unmap GPUVA range with respect to the GPUVA size
      drm/etnaviv: Drop the 'struct etnaviv_iommu_global::pta_lock' data me=
mber
      drm/etnaviv: etnaviv_cmdbuf.c: Drop the unneeded include of drm_mm.h

Sung Lee (1):
      drm/amd/display: Clean up triple buffer enablement code

Sunil Khatri (45):
      drm/amdgpu: add amdgpu_device reference in ip block
      drm/amdgpu: update the handle ptr in dump_ip_state
      drm/amdgpu: update the handle ptr in print_ip_state
      drm/amdgpu: update the handle ptr in early_init
      drm/amdgpu: update the handle ptr in late_init
      drm/amdgpu: update the handle ptr in sw_init
      drm/amdgpu: update the handle ptr in sw_fini
      drm/amdgpu: update the handle ptr in early_fini
      drm/amdgpu: remove the dummy fn acp_early_init
      drm/amdgpu: update the handle ptr in late_fini
      drm/amdgpu: update the handle ptr in prepare_suspend
      drm/amdgpu: update the handle ptr in check_soft_reset
      drm/amdgpu: update the handle ptr in pre_soft_reset
      drm/amdgpu: update the handle ptr in soft_reset
      drm/amdgpu: update the handle ptr in post_soft_reset
      drm/amdgpu: update the handle ptr in wait_for_idle
      drm/amdgpu: update the handle ptr in suspend
      drm/amdgpu: update the handle ptr in resume
      drm/amdgpu: update the handle ptr in hw_init
      drm/amdgpu: update the handle ptr in hw_fini
      drm/amdgpu: fix html doc generation warning
      drm/amdgpu: change the comment from handle to ip_block
      drm/amdgpu: move error log from ring write to commit
      drm/amdgpu: no need to log error in multi ring write
      drm/amdgpu: fix dm_suspend/resume arguments to ip_block
      drm/amdgpu: optimize insert_nop using multi dwords
      drm/amdgpu: optimize fn gfx_v9_4_3_ring_insert_nop
      drm/amdgpu: optimize fn gfx_v9_ring_insert_nop
      drm/amdgpu: optimize fn gfx_v10_ring_insert_nop
      drm/amdgpu: optimize fn gfx_v11_ring_insert_nop
      drm/amdgpu: optimize fn gfx_v12_ring_insert_nop
      drm/amdgpu: validate sw_init before function call
      drm/amdgpu: clean the dummy sw_init functions
      drm/amdgpu: validate sw_fini before function call
      drm/amdgpu: clean the dummy sw_fini functions
      drm/amdgpu: validate hw_fini before function call
      drm/amdgpu: validate suspend before function call
      drm/amdgpu: validate resume before function call
      drm/amdgpu: validate wait_for_idle before function call
      drm/amdgpu: clean the dummy resume functions
      drm/amdgpu: clean the dummy suspend functions
      drm/amdgpu: clean the dummy wait_for_idle functions
      drm/amdgpu: clean the dummy soft_reset functions
      drm/amdgpu: Clean the functions pointer set as NULL
      drm/amdgpu: clean unused functions of uvd/vcn/vce

Suraj Kandpal (17):
      drm/i915/hdcp: Move to using intel_display in intel_hdcp
      drm/i915/hdcp: Use intel_display in hdcp_gsc
      drm/xe/display: Do not suspend resume dp mst during runtime
      drm/xe/display: Do not do intel_fbdev_set_suspend during runtime
      drm/i915/psr: Implement WA to help reach PC10
      drm/i915/hotplug: Reduce SHPD_FLITER_CNT for ICL and above
      drm/i915/hotplug: Add comment for XE_LPD+ SHPD_FILTER_CNT value
      drm/i915/vdsc: Add bpc check in intel_dsc_compute_params
      drm/i915/hdcp: Retry first read and writes to downstream
      drm/i915/xe3lpd: Add C20 Phy consolidated programming table
      drm/i915/xe3lpd: Add new bit range of MAX swing setup
      drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG
      drm/xe/hdcp: Fix gsc structure check in fw check status
      drm/i915/xe3lpd: Increase resolution for plane to support 6k
      drm/i915/psr: Change psr size limits check
      drm/i914/xe3lpd: Increase bigjoiner limitations
      drm/i915/xe3lpd: Add check to see if edp over type c is allowed

T.J. Mercier (1):
      dma-buf: heaps: Add __init to CMA and system heap module_init functio=
ns

Taimur Hassan (4):
      drm/amd/display: [FW Promotion] Release 0.0.236.0
      drm/amd/display: Add DMUB debug offset
      drm/amd/display: [FW Promotion] Release 0.0.240.0
      drm/amd/display: [FW Promotion] Release 0.0.241.0

Tejas Upadhyay (1):
      drm/xe/xe2hpg: Add Wa_15016589081

Tejas Vipin (5):
      drm/panel: samsung-s6e3fa7: transition to mipi_dsi wrapped functions
      drm/panel: himax-hx83112a: transition to mipi_dsi wrapped functions
      drm/panel: raydium-rm69380: transition to mipi_dsi wrapped functions
      drm/panel: elida-kd35t133: transition to mipi_dsi wrapped functions
      drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi wrapped funct=
ions

Thierry Reding (2):
      Revert "drm/tegra: gr3d: Convert into dev_pm_domain_attach|detach_lis=
t()"
      gpu: host1x: Set up device DMA parameters

Thomas Hellstr=C3=B6m (7):
      drm/xe: Add a xe_bo subtest for shrinking / swapping
      dma-buf/dma-fence: Use a successful read_trylock() annotation
for dma_fence_begin_signalling()
      Merge drm/drm-next into drm-xe-next
      drm/xe/tests: Fix the shrinker test compiler warnings.
      drm/ttm: Move swapped objects off the manager's LRU list
      drm/ttm: Move pinned objects off LRU lists when pinning
      drm/ttm: Fix incorrect use of kernel-doc format

Thomas Zimmermann (159):
      Merge drm/drm-next into drm-misc-next
      drm/bochs: Remove manual format test from fb_create
      drm/bochs: Use helpers for struct drm_edid
      drm/bochs: Do managed resource cleanup
      drm/bochs: Pass bochs device to various functions
      drm/bochs: Upcast with to_bochs_device()
      drm/bochs: Allocate DRM device in struct bochs_device
      drm/bochs: Use regular atomic helpers
      drm/bochs: Use GEM SHMEM helpers for memory management
      drm/bochs: Validate display modes against available video memory
      drm/gem-vram: Remove support for simple display pipelines
      Merge drm/drm-next into drm-misc-next
      drm/ast: Remove TX-chip bitmask
      drm/ast: astdp: Inline ast_astdp_connector_init()
      drm/ast: astdp: Avoid upcasting to struct ast_device
      drm/ast: astdp: Replace power_on helpers
      drm/ast: astdp: Replace ast_dp_set_on_off()
      drm/ast: dp501: Inline ast_dp501_connector_init()
      drm/ast: dp501: Avoid upcasting to struct ast_device
      drm/ast: sil164: Inline ast_sil164_connector_init()
      drm/ast: vga: Inline ast_vga_connector_init()
      drm/ast: Respect return value from CRTC init
      drm/ast: Avoid upcasting to struct ast_device
      drm/ast: Rename register constants for TX-chip types
      drm/ast: Use TX-chip register constants
      drm/ast: Warn about unsupported TX chips
      drm: Link drm_rect.o into DRM core module
      drm/fbdev-helper: Move color-mode lookup into 4CC format helper
      drm/fbdev-helper: Set and clear VGA switcheroo client from fb_info
      drm/fbdev: Add memory-agnostic fbdev client
      drm: Add client-agnostic setup helper
      drm/fbdev-dma: Support struct drm_driver.fbdev_probe
      drm/arcgpu: Run DRM default client setup
      drm/arm/komeda: Run DRM default client setup
      drm/arm/hdlcd: Run DRM default client setup
      drm/arm/malidp: Run DRM default client setup
      drm/aspeed: Run DRM default client setup
      drm/atmel-hdlcd: Run DRM default client setup
      drm/fsl-dcu: Run DRM default client setup
      drm/hisilicon/kirin: Run DRM default client setup
      drm/hx8357d: Run DRM default client setup
      drm/ili9163: Run DRM default client setup
      drm/ili9225: Run DRM default client setup
      drm/ili9341: Run DRM default client setup
      drm/ili9486: Run DRM default client setup
      drm/imx/dcss: Run DRM default client setup
      drm/imx/ipuv3: Run DRM default client setup
      drm/imx/lcdc: Run DRM default client setup
      drm/ingenic: Run DRM default client setup
      drm/kmb: Run DRM default client setup
      drm/logicvc: Run DRM default client setup
      drm/mcde: Run DRM default client setup
      drm/mediatek: Run DRM default client setup
      drm/meson: Run DRM default client setup
      drm/mi0283qt: Run DRM default client setup
      drm/mxsfb/lcdif: Run DRM default client setup
      drm/mxsfb: Run DRM default client setup
      drm/panel-mipi-dbi: Run DRM default client setup
      drm/pl111: Run DRM default client setup
      drm/renesas/rcar-du: Run DRM default client setup
      drm/renesas/rz-du: Run DRM default client setup
      drm/renesas/shmobile: Run DRM default client setup
      drm/repaper: Run DRM default client setup
      drm/rockchip: Run DRM default client setup
      drm/sti: Run DRM default client setup
      drm/stm: Run DRM default client setup
      drm/sun4i: Run DRM default client setup
      drm/tidss: Run DRM default client setup
      drm/tilcdc: Run DRM default client setup
      drm/st7586: Run DRM default client setup
      drm/st7735r: Run DRM default client setup
      drm/tve200: Run DRM default client setup
      drm/vc4: Run DRM default client setup
      drm/xlnx: Run DRM default client setup
      drm/fbdev-dma: Remove obsolete setup function
      drm/fbdev-shmem: Support struct drm_driver.fbdev_probe
      drm/ast: Run DRM default client setup
      drm/bochs: Run DRM default client setup
      drm/cirrus: Run DRM default client setup
      drm/gm12u320: Run DRM default client setup
      drm/gud: Run DRM default client setup
      drm/hyperv_drm: Run DRM default client setup
      drm/mgag200: Run DRM default client setup
      drm/ofdrm: Use DRM default client setup
      drm/simpledrm: Run DRM default client setup
      drm/solomon: Run DRM default client setup
      drm/udl: Run DRM default client setup
      drm/virtgpu: Run DRM default client setup
      drm/vkms: Run DRM default client setup
      drm/fbdev-shmem: Remove obsolete setup function
      drm/fbdev-ttm: Support struct drm_driver.fbdev_probe
      drm/amdgpu: Run DRM default client setup
      drm/hisilicon/hibmc: Run DRM default client setup
      drm/loongson: Run DRM default client setup
      drm/nouveau: Run DRM default client setup
      drm/qxl: Run DRM default client setup
      drm/vboxvideo: Run DRM default client setup
      drm/vmwgfx: Run DRM default client setup
      drm/fbdev-ttm: Remove obsolete setup function
      drm/armada: Run DRM default client setup
      drm/exynos-drm: Run DRM default client setup
      drm/gma500: Run DRM default client setup
      drm/msm: Run DRM default client setup
      drm/radeon: Run DRM default client setup
      drm/tegra: Run DRM default client setup
      drm/omapdrm: Remove struct drm_fb_helper from struct omap_fbdev.
      drm/omapdrm: Run DRM default client setup
      Merge drm/drm-next into drm-misc-next
      fbdev: atmel_lcdfb: Use backlight power constants
      fbdev: aty128fb: Use backlight power constants
      fbdev: atyfb: Use backlight power constants
      fbdev: chipsfb: Use backlight power constants
      fbdev: nvidiafb: Use backlight power constants
      fbdev: omapfb: Use backlight power constants
      fbdev: radeonfb: Use backlight power constants
      fbdev: rivafb: Use backlight power constants
      fbdev: sh_mobile_lcdc_fb: Use backlight power constants
      drm/bochs: Return error from correct pointer
      Merge drm/drm-next into drm-misc-next
      drm/amdgpu: Use video aperture helpers
      drm/arm/hdlcd: Use video aperture helpers
      drm/armada: Use video aperture helpers
      drm/ast: Use video aperture helpers
      drm/hisilicon/hibmc: Use video aperture helpers
      drm/hyperv-drm: Use video aperture helpers
      drm/i915: Use video aperture helpers
      drm/loongson: Use video aperture helpers
      drm/meson: Use video aperture helpers
      drm/mgag200: Use video aperture helpers
      drm/msm: Use video aperture helpers
      drm/nouveau: Use video aperture helpers
      drm/ofdrm: Use video aperture helpers
      drm/qxl: Use video aperture helpers
      drm/radeon: Use video aperture helpers
      drm/rockchip: Use video aperture helpers
      drm/simpledrm: Use video aperture helpers
      drm/stm: Use video aperture helpers
      drm/sun4i: Use video aperture helpers
      drm/tegra: Use video aperture helpers
      drm/bochs: Use video aperture helpers
      drm/cirrus: Use video aperture helpers
      drm/vboxvideo: Use video aperture helpers
      drm/vc4: Use video aperture helpers
      drm/virtgpu: Use video aperture helpers
      drm/vmwgfx: Use video aperture helpers
      drm/xe: Use video aperture helpers
      drm: Remove DRM aperture helpers
      drm/i915: Select DRM_CLIENT_SELECTION
      drm/xe: Select DRM_CLIENT_SELECTION
      drm/fbdev-dma: Select FB_DEFERRED_IO
      drm/fbdev: Select fbdev I/O helpers from modules that require them
      drm/client: Move client event handlers to drm_client_event.c
      drm/client: Move suspend/resume into DRM client callbacks
      drm/amdgpu: Suspend and resume internal clients with client helpers
      drm/nouveau: Suspend and resume clients with client helpers
      drm/radeon: Suspend and resume clients with client helpers
      drm/client: Make client support optional
      drm/client: Add client-lib module
      drm/msm: Use video aperture helpers

Tim Gover (1):
      drm/vc4: hvs: Enable SCALER_CONTROL early in HVS init

Tim Huang (2):
      drm/amdgpu: check return for setting engine dram timings
      drm/amd/pm: print pp_dpm_mclk in ascending order on SMU v14.0.0

Tom Chung (4):
      drm/amd/display: Fix system hang while resume with TBT monitor
      drm/amd/display: Fix brightness level not retained over reboot
      drm/amd/display: Change some variable name of psr
      drm/amd/display: Fix Panel Replay not update screen correctly

Tomasz Rusinowicz (3):
      accel/ivpu: Reset fw log on cold boot
      accel/ivpu: Add FW state dump on TDR
      accel/ivpu: Make DB_ID and JOB_ID allocations incremental

Tomi Valkeinen (4):
      drm/omap: Fix possible NULL dereference
      drm/omap: Hide sparse warnings
      drm/omap: Fix locking in omap_gem_new_dmabuf()
      drm/bridge: tc358767: Fix link properties discovery

Tommy Chiang (1):
      dma-buf: Add syntax highlighting to code listings in the document

Tvrtko Ursulin (15):
      drm/v3d: Appease lockdep while updating GPU stats
      drm/sched: Add locking to drm_sched_entity_modify_sched
      Documentation/gpu: Document the situation with unqualified drm-memory=
-
      drm/amdgpu: Drop unused fence argument from amdgpu_vmid_grab_used
      drm/amdgpu: Use drm_print_memory_stats helper from fdinfo
      drm/amdgpu: Drop impossible condition from amdgpu_job_prepare_job
      drm/amdgpu: Remove the while loop from amdgpu_job_prepare_job
      drm/sched: Optimise drm_sched_entity_push_job
      drm/sched: Stop setting current entity in FIFO mode
      drm/sched: Re-order struct drm_sched_rq members for clarity
      drm/sched: Re-group and rename the entity run-queue lock
      drm/sched: Further optimise drm_sched_entity_push_job
      drm/amd/pm: Vangogh: Fix kernel memory out of bounds write
      drm/amdgpu: Stop reporting special chip memory pools as CPU
memory in fdinfo
      drm/amdgpu: Expose special on chip memory pools in fdinfo

Uros Bizjak (2):
      dma-buf: Use atomic64_inc_return() in dma_buf_getfile()
      drm/i915/active: Use try_cmpxchg() in active_fence_cb()

Victor Lu (1):
      drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts for vega20=
_ih

Victor Skvortsov (4):
      drm/amdgpu: Update SRIOV Exchange Headers for RAS Telemetry Support
      drm/amdgpu: Add msg handlers for SRIOV RAS Telemetry
      drm/amdgpu: VF Query RAS Caps from Host if supported
      drm/amdgpu: Implement virt req_ras_err_count

Victor Zhao (3):
      drm/amdkfd: fix the hang caused by the write reorder to fence_addr
      drm/amdkfd: remove extra use of volatile
      drm/amdgpu: skip amdgpu_device_cache_pci_state under sriov

Vignesh Raman (5):
      drm/ci: uprev mesa, IGT and deqp-runner
      docs/gpu: ci: update flake tests requirements
      drm/ci: add dedede
      drm/ci: add sm8350-hdk
      drm/ci: remove update-xfails.py

Vijendar Mukunda (1):
      drm/amd: Fix initialization mistake for NBIO 7.7.0

Ville Syrj=C3=A4l=C3=A4 (78):
      drm/i915/cdclk: Add missing braces
      drm/i915/cdclk: Convert CDCLK code to intel_display
      drm/i915/power: Convert low level DC state code to intel_display
      drm/i915/vga: Convert VGA code to intel_display
      drm/i915/power: Convert "i830 power well" code to intel_display
      drm/i915/dmc: Convert DMC code to intel_display
      drm/i915/psr: Fix PSR sink enable sequence
      drm/i915/color: Extract intel_color_modeset()
      drm/i915: Extract intel_post_plane_update_after_readout()
      drm/i915/dp: Fix colorimetry detection
      drm/i915: Remove leftover intel_sprite_set_colorkey_ioctl() prototype
      drm/i915: Combine .compute_{pipe,intermediate}_wm() into one
      drm/i915: Extract ilk_must_disable_lp_wm()
      drm/i915: Clean up intel_wm_need_update()
      drm/i915: Move the dodgy pre-g4x wm stuff into i9xx_wm
      drm/i915: s/disable_lp_wm/disable_cxsr/
      drm/i915: Rename variables in ilk_intermedidate_wm()
      drm/i915: Set clear color block size to 0x0
      drm/i915/bios: Use drm_dbg_kms() consistently
      drm/i915/bios: Add some size checks to SPI VBT read
      drm/i915/bios: Round PCI ROM VBT allocation to multiple of 4
      drm/i915/bios: Extract intel_spi_read16()
      drm/i915/bios: Extract vbt_signature[]
      drm/i915/bios: Extract soc/intel_rom.c
      drm/i915: Introduce i915_has_legacy_blc_interrupt()
      drm/i915: Clean up gen3 hotplug irq setup
      drm/i915: Clean up some comments in gmch irq code
      drm/i915: Switch over to gen3 irq code on gen2
      drm/client:
s/drm_connector_has_preferred_mode/drm_connector_preferred_mode/
      drm/client: Use drm_mode_destroy()
      drm/client: Extract drm_connector_first_mode()
      drm/i915/irq: Nuke stale comments
      drm/i915/irq: Pair up the vblank enable/disable functions
      drm/i915: Extract i915gm_irq_cstate_wa_{disable,enable}()
      drm/i915: Apply the i915gm/i945gm irq C-state w/a to CRC interrupts
      drm/i915/dp: Make intel_dp_get_colorimetry_status() static
      drm/i915/dp: Extract intel_edp_set_sink_rates()
      drm/i915/dsb: Avoid reads of the DSB buffer for indexed register writ=
es
      drm/i915: Prepare clear color before wait_for_dependencies()
      drm/i915/dsb: Generate the DSB buffer in commit_tail()
      drm/i915/dsb: Enable programmable DSB interrupt
      drm/i915/dsb: Introduce intel_dsb_vblank_evade()
      drm/i915/dsb: Introduce intel_dsb_wait_usec()
      drm/i915/dsb: Introduce intel_dsb_wait_vblanks()
      drm/i915: Introduce intel_scanlines_to_usecs()
      drm/i915/dsb: Introduce intel_dsb_wait_vblank_delay()
      drm/i915: Extract intel_crtc_prepare_vblank_event()
      drm/i915: Plumb 'dsb' all way to the plane hooks
      drm/i915: Plumb 'dsb' all way to the color commit hooks
      drm/i915/dsb: Use DSB for plane/color management updates
      drm/i915: Disable compression tricks on JSL
      drm/i915: Enable 10bpc + CCS on TGL+
      drm/i915: Enable 10bpc + CCS on ICL
      drm/i915: Enable fp16 + CCS on TGL+
      drm/i915: Drop GEN12_MC_CCS check from skl_plane_max_width()
      drm/i915: s/gen12/tgl/ in the universal plane code
      drm/i915/irq: s/gen3/gen2/
      drm/i915/gt: Nuke gen2_irq_{enable,disable}()
      drm/i915/gt: s/gen3/gen2/
      drm/i915/pmu: Add support for gen2
      drm/radeon: Fix encoder->possible_clones
      drm/i915/pfit: Check pipe source size against pfit limits on ILK-BDW
      drm/i915/pfit: Check pfit scaling factors on ILK-BDW
      drm/i915/pfit: Reject pfit downscaling for GMCH platforms
      drm/i915/pfit: Check pfit minimum timings in pre-SKL
      drm/i915/pfit: Reject cloning when using pfit on ILK-BDW
      drm/i915/pfit: Check pfit destination window on ILK-BDW
      drm/i915/panel: Convert panel code to intel_display
      drm/i915/pfit: Extract intel_pfit.c
      drm/i915: Remove ckey/format checks from skl_update_scaler_plane()
      drm/imx/dcss: Fix 64bit divisions
      drm/imx/dcss: Allow build with COMPILE_TEST=3Dy
      drm/mediatek: Allow build with COMPILE_TEST=3Dy
      drm/meson: Allow build with COMPILE_TEST=3Dy
      drm/i915/color: Pimp debugs
      drm/i915: Handle intel_plane and intel_plane_state in to_intel_displa=
y()
      drm/i915/color: Convert color management code to intel_display
      drm/i915/color: Make color .get_config() mandatory

Vinay Belgaumkar (2):
      drm/xe: Restore GT freq on GSC load error
      drm/xe/ptl: Apply Wa_14022866841

Vitaliy Shevtsov (1):
      drm/amd/display: fix typos in several function pointer checks

Vivek Kasireddy (1):
      MAINTAINERS: udmabuf: Add myself as co-maintainer for udmabuf driver

Wadim Egorov (2):
      dt-bindings: display: bridge: sil,sii9022: Add bus-width
      drm/bridge: sii902x: Set input bus format based on bus-width

WangYuli (1):
      drm/amdgpu: Fix typo "acccess" and improve the comment style here

Wayne Lin (1):
      drm/amd/display: Don't write DP_MSTM_CTRL after LT

Wolfgang M=C3=BCller (2):
      drm/amd/pm: add zero RPM OD setting support for SMU13
      drm/amd/pm: add zero RPM stop temperature OD setting support for SMU1=
3

Wu Hoi Pok (1):
      drm/radeon: add late_register for connector

Xiaogang Chen (2):
      drm/amdkfd: Not restore userptr buffer if kfd process has been remove=
d
      drm/amdkfd: change kfd process kref count at creation

Xiaolei Wang (1):
      drm/etnaviv: Request pages from DMA32 zone on addressing_limited

Yakir Yang (1):
      drm/rockchip: dw_hdmi: Adjust cklvl & txlvl for RF/EMI

Yan Zhao (1):
      drm/bochs: use devm_ioremap_wc() to map framebuffer

Yan Zhen (1):
      drm/i915/display: fix typo in the comment

Yang Li (1):
      drm/msm: Remove unneeded semicolon

Yang Wang (2):
      drm/amdgpu: optimize ACA log print
      drm/amdgpu: fix ACA bank count boundary check error

YiPeng Chai (2):
      amd/amdgpu: Reduce unnecessary repetitive GPU resets
      drm/amdgpu: Reduce redundant gpu resets on nbio v7.4

Yihan Zhu (3):
      drm/amd/display: update DML2 policy
EnhancedPrefetchScheduleAccelerationFinal DCN35
      drm/amd/display: calculate final viewport before TAP optimization
      drm/amd/display: w/a to program DISPCLK_R_GATE_DISABLE DCN35

Yu Jiaoliang (1):
      drm/xe: Use ERR_CAST to return an error-valued pointer

Yuan Can (1):
      drm/amdkfd: Fix wrong usage of INIT_WORK()

YuanShang (1):
      drm/amdgpu: Flush tlb by VM_INVALIDATION packet in sdma_v5_2

Yuesong Li (1):
      drm/i915/dp: Remove double assignment in intel_dp_compute_as_sdp()

Yunxiang Li (2):
      drm/amdgpu: make drm-memory-* report resident memory
      drm/amdgpu: stop tracking visible memory stats

Zhang He (1):
      drm/i915/gt: Fixed "CPU" -> "GPU" typo

Zhanjun Dong (8):
      drm/xe: Prevent null pointer access in xe_migrate_copy
      drm/xe/guc: Prepare GuC register list and update ADS size for
error capture
      drm/xe/guc: Add XE_LP steered register lists
      drm/xe/guc: Add capture size check in GuC log buffer
      drm/xe/guc: Extract GuC error capture lists
      drm/xe/guc: Plumb GuC-capture into dev coredump
      drm/xe/guc: Save manual engine capture into capture list
      drm/xe/guc: Prevent GuC register capture running on VF

Zhongwei (2):
      drm/amd/display: Monitor patch to call blank_stream() before otg off
      drm/amd/display: Fix garbage or black screen when resetting otg

Zhu Lingshan (1):
      drm/amdgpu: init saw registers for mmhub v1.0

Zichen Xie (1):
      drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_=
clk()

chongli2 (1):
      drm/amdgpu: fix return random value when multiple threads read
registers via mes.

jeffbai@aosc.io (1):
      drm/amdgpu: fix comment about amdgpu.abmlevel defaults

po-tchen (1):
      drm/amd/display: Display lost signal on playing video

shaoyunl (1):
      drm/amd/amdgpu: Increase MES log buffer to dump mes scratch data

 .../ABI/testing/sysfs-driver-intel-i915-hwmon      |    8 +
 .../ABI/testing/sysfs-driver-panthor-profiling     |   10 +
 Documentation/accel/qaic/aic080.rst                |   14 +
 Documentation/accel/qaic/aic100.rst                |    2 +
 Documentation/accel/qaic/index.rst                 |    1 +
 .../bindings/display/bridge/ite,it6263.yaml        |  250 +++
 .../bindings/display/bridge/sil,sii9022.yaml       |   15 +-
 .../bindings/display/bridge/ti,tdp158.yaml         |   57 +
 .../bindings/display/bridge/toshiba,tc358768.yaml  |    4 +
 .../bindings/display/imx/fsl-imx-drm.txt           |    2 -
 .../devicetree/bindings/display/imx/ldb.txt        |    1 -
 .../bindings/display/lvds-data-mapping.yaml        |   31 +
 .../bindings/display/lvds-dual-ports.yaml          |   63 +
 .../bindings/display/mediatek/mediatek,aal.yaml    |   40 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   21 +
 .../bindings/display/mediatek/mediatek,color.yaml  |   22 +
 .../bindings/display/mediatek/mediatek,dither.yaml |   22 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |   25 +-
 .../bindings/display/mediatek/mediatek,dsc.yaml    |   24 +
 .../bindings/display/mediatek/mediatek,dsi.yaml    |   27 +-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  |   22 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |   19 +
 .../bindings/display/mediatek/mediatek,merge.yaml  |   23 +
 .../bindings/display/mediatek/mediatek,od.yaml     |   22 +
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml |   22 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   22 +
 .../display/mediatek/mediatek,postmask.yaml        |   21 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |   22 +
 .../bindings/display/mediatek/mediatek,ufoe.yaml   |   21 +
 .../bindings/display/msm/dp-controller.yaml        |    1 +
 .../devicetree/bindings/display/msm/gmu.yaml       |    1 +
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  241 +++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   10 +-
 .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    |  122 --
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |    4 +-
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |   99 -
 .../bindings/display/msm/qcom,sm8350-dpu.yaml      |  120 --
 .../bindings/display/msm/qcom,sm8450-dpu.yaml      |  139 --
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      |  133 --
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |    1 +
 .../display/panel/advantech,idk-2121wr.yaml        |   14 +-
 .../bindings/display/panel/panel-common.yaml       |    8 +
 .../bindings/display/panel/panel-lvds.yaml         |    2 +
 .../panel/panel-simple-lvds-dual-ports.yaml        |   20 +-
 .../bindings/display/panel/panel-simple.yaml       |    2 +
 .../bindings/display/panel/samsung,ams581vf01.yaml |   79 +
 .../bindings/display/panel/samsung,ams639rq08.yaml |   80 +
 .../bindings/display/panel/samsung,s6e3ha8.yaml    |   75 +
 .../display/panel/samsung,s6e88a0-ams427ap24.yaml  |   65 +
 .../bindings/display/panel/samsung,s6e8aa0.yaml    |   10 +-
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       |  188 ++
 .../display/samsung/samsung,exynos7-decon.yaml     |    4 +-
 .../bindings/display/sharp,ls010b7dh04.yaml        |   92 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 .../gpu/amdgpu/display/dc-arch-overview.svg        |  731 ++++++++
 Documentation/gpu/amdgpu/display/dc-components.svg |  732 ++++++++
 Documentation/gpu/amdgpu/display/dc-debug.rst      |  187 ++
 Documentation/gpu/amdgpu/display/dcn-blocks.rst    |    2 +
 Documentation/gpu/amdgpu/display/dcn-overview.rst  |    2 +
 Documentation/gpu/amdgpu/display/index.rst         |    1 +
 .../gpu/amdgpu/display/programming-model-dcn.rst   |  162 ++
 Documentation/gpu/amdgpu/index.rst                 |    1 +
 Documentation/gpu/amdgpu/process-isolation.rst     |   59 +
 Documentation/gpu/amdgpu/thermal.rst               |   12 +
 Documentation/gpu/automated_testing.rst            |   14 +-
 Documentation/gpu/drivers.rst                      |    2 +
 Documentation/gpu/drm-client.rst                   |    3 +
 Documentation/gpu/drm-internals.rst                |   12 -
 Documentation/gpu/drm-kms-helpers.rst              |    9 -
 Documentation/gpu/drm-uapi.rst                     |   27 +-
 Documentation/gpu/drm-usage-stats.rst              |   31 +-
 Documentation/gpu/i915.rst                         |    4 +-
 Documentation/gpu/msm-preemption.rst               |   99 +
 Documentation/gpu/panthor.rst                      |   46 +
 Documentation/gpu/todo.rst                         |   16 +
 Documentation/gpu/zynqmp.rst                       |  149 ++
 .../userspace-api/media/v4l/subdev-formats.rst     |  156 +-
 MAINTAINERS                                        |   28 +-
 arch/x86/kernel/early-quirks.c                     |    2 +-
 drivers/accel/ivpu/Kconfig                         |   10 +
 drivers/accel/ivpu/Makefile                        |    8 +-
 drivers/accel/ivpu/ivpu_coredump.c                 |   39 +
 drivers/accel/ivpu/ivpu_coredump.h                 |   25 +
 drivers/accel/ivpu/ivpu_debugfs.c                  |   90 +-
 drivers/accel/ivpu/ivpu_drv.c                      |   70 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   37 +-
 drivers/accel/ivpu/ivpu_fw.c                       |   37 +-
 drivers/accel/ivpu/ivpu_fw.h                       |    9 +-
 drivers/accel/ivpu/ivpu_fw_log.c                   |  119 +-
 drivers/accel/ivpu/ivpu_fw_log.h                   |   17 +-
 drivers/accel/ivpu/ivpu_gem.c                      |    3 +
 drivers/accel/ivpu/ivpu_hw.c                       |   15 +-
 drivers/accel/ivpu/ivpu_hw.h                       |    1 -
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |    2 +
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |   21 +-
 drivers/accel/ivpu/ivpu_hw_ip.c                    |   57 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |   45 +-
 drivers/accel/ivpu/ivpu_ipc.h                      |    9 +-
 drivers/accel/ivpu/ivpu_job.c                      |  190 +-
 drivers/accel/ivpu/ivpu_job.h                      |    2 +
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |   42 +-
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |    2 +
 drivers/accel/ivpu/ivpu_mmu.c                      |   97 +-
 drivers/accel/ivpu/ivpu_mmu.h                      |    4 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |  158 +-
 drivers/accel/ivpu/ivpu_mmu_context.h              |    9 +-
 drivers/accel/ivpu/ivpu_ms.c                       |    2 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   26 +-
 drivers/accel/ivpu/ivpu_sysfs.c                    |   24 +
 drivers/accel/ivpu/ivpu_trace.h                    |   73 +
 drivers/accel/ivpu/ivpu_trace_points.c             |    9 +
 drivers/accel/ivpu/vpu_boot_api.h                  |   45 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |  303 ++-
 drivers/accel/qaic/mhi_controller.c                |   32 +
 drivers/accel/qaic/qaic_debugfs.c                  |   43 +-
 drivers/accel/qaic/qaic_drv.c                      |    8 +-
 drivers/accel/qaic/sahara.c                        |  388 +++-
 drivers/dma-buf/Kconfig                            |    1 +
 drivers/dma-buf/dma-buf.c                          |   29 +-
 drivers/dma-buf/dma-fence.c                        |   10 +-
 drivers/dma-buf/heaps/cma_heap.c                   |   10 +-
 drivers/dma-buf/heaps/system_heap.c                |    2 +-
 drivers/dma-buf/sw_sync.c                          |    6 -
 drivers/dma-buf/udmabuf.c                          |  283 +--
 drivers/gpu/drm/Kconfig                            |   51 +-
 drivers/gpu/drm/Makefile                           |   17 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |    3 +
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   55 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   10 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |   12 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  594 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   84 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  103 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |   57 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  451 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  214 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   25 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h            |    4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            |   61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |  114 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   99 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  148 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  161 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |  150 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  111 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  189 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   23 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   77 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  289 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  140 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    9 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |  131 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  126 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |   47 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |   45 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   47 +-
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |   45 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |   49 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |   45 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |   43 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   45 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  108 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  154 +-
 .../drm/amd/amdgpu/gfx_v11_0_3_cleaner_shader.asm  |  118 ++
 .../gpu/drm/amd/amdgpu/gfx_v11_0_cleaner_shader.h  |   56 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   88 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   47 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   50 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   68 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  118 +-
 .../gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h   |   44 +-
 .../drm/amd/amdgpu/gfx_v9_4_2_cleaner_shader.asm   |  153 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   97 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   72 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   49 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   79 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  149 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |   45 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |   41 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   41 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c               |   41 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   18 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h             |    6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   59 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   59 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   95 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   67 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   66 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  111 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |   49 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |    3 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   41 +-
 drivers/gpu/drm/amd/amdgpu/navi10_sdma_pkt_open.h  |   64 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    6 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   12 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   64 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   20 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   25 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   45 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   55 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   50 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   59 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  390 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  422 +++--
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  381 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   52 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |   52 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   46 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   47 +-
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   32 +-
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |   22 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   91 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   69 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |   52 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |    9 +
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |   73 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |   52 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |   52 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |   59 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |   73 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  311 +--
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |   56 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   66 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |  308 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   70 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   65 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   70 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   65 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   67 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   82 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   67 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   67 +-
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |   41 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |   66 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |   60 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |    3 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   28 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   48 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   28 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  492 ++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    9 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   18 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   48 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  104 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |    2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   49 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    2 +-
 .../drm/amd/display/dc/bios/bios_parser_helper.c   |    7 -
 .../drm/amd/display/dc/bios/bios_parser_helper.h   |    1 -
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    5 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    6 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   31 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  225 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |   82 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   30 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    5 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   57 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |    3 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   21 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   21 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   88 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   39 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    7 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |    1 -
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |   19 +-
 drivers/gpu/drm/amd/display/dc/dc_state.h          |    1 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   36 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   84 -
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |    2 -
 .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |    2 -
 .../gpu/drm/amd/display/dc/dce60/dce60_resource.c  |    2 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |   23 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |    2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |  174 +-
 .../display/dc/dio/dcn10/dcn10_stream_encoder.c    |    2 -
 .../dc/dio/dcn314/dcn314_dio_stream_encoder.c      |   10 +
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c      |    2 -
 drivers/gpu/drm/amd/display/dc/dm_services.h       |    2 +-
 .../amd/display/dc/dml/dcn20/display_mode_vba_20.c |    3 -
 .../display/dc/dml/dcn20/display_mode_vba_20v2.c   |    3 -
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |    4 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |    4 -
 .../amd/display/dc/dml/dcn21/display_mode_vba_21.c |    3 -
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    4 -
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   12 -
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |    4 -
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    3 -
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |    4 -
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    3 -
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |    4 -
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    3 -
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |    4 +-
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |    3 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |    3 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    6 +-
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    1 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |    1 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |    3 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |    1 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   12 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |    2 -
 .../gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.h   |    1 +
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |    1 +
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |   16 +-
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |    3 +-
 .../drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h |    4 -
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |    1 -
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |    9 +-
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |   12 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |    8 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   10 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |    3 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    1 -
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   41 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   15 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.h    |    5 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   35 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |    2 +
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |    3 +-
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |    1 +
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.h   |    4 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   59 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.h    |    3 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |    2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   22 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |    2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   63 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |    5 -
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |    4 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   16 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    3 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    3 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  290 ++-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   15 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   11 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    8 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |    1 +
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |    2 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    1 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |    3 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   12 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   15 +-
 .../display/dc/link/protocols/link_dp_capability.c |   30 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |    7 +
 .../dc/link/protocols/link_dp_irq_handler.c        |   16 +-
 .../display/dc/link/protocols/link_dp_training.c   |   13 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |    1 -
 .../dc/link/protocols/link_edp_panel_control.c     |   59 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    3 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |    9 +
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.h |    7 +-
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c |   45 +
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.h |   13 +-
 .../drm/amd/display/dc/optc/dcn301/dcn301_optc.c   |    3 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.h |    9 +-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.h   |    9 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   16 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |    7 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h |    6 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   35 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |    6 +-
 .../display/dc/resource/dce100/dce100_resource.c   |    2 +-
 .../display/dc/resource/dce110/dce110_resource.c   |    2 +-
 .../display/dc/resource/dce112/dce112_resource.c   |    2 +-
 .../display/dc/resource/dce120/dce120_resource.c   |    2 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |    2 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |   17 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    3 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |    3 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    3 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    3 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |    3 +-
 .../display/dc/resource/dcn302/dcn302_resource.c   |    3 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |    3 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    5 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |    5 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |    9 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |    3 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |    7 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    3 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    3 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    3 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |    3 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   52 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |    9 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  127 +-
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.h |    1 -
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |   13 +-
 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h     |   33 +-
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c    |   66 +-
 .../gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h    |   17 +-
 drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h  |    3 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    9 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  245 ++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    6 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    4 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   19 +-
 .../gpu/drm/amd/display/include/logger_interface.h |    4 -
 drivers/gpu/drm/amd/display/include/logger_types.h |    4 +-
 .../drm/amd/display/modules/color/color_gamma.c    |  307 ---
 .../drm/amd/display/modules/color/color_gamma.h    |   11 -
 .../drm/amd/display/modules/freesync/freesync.c    |   20 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   31 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   43 +-
 .../amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h   |    2 +
 .../amd/include/asic_reg/mmhub/mmhub_1_0_offset.h  |   23 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  107 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |   43 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |   31 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  462 ++---
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    4 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   48 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   50 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   53 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |  428 -----
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h    |    2 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h |  561 ------
 .../pm/powerplay/hwmgr/vega20_processpptables.c    |  574 ------
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  108 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   14 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    2 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v12_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  442 +----
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   11 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 1280 +------------
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   28 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   27 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   15 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   37 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  145 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |   26 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  233 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  130 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   40 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   36 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   91 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   11 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |    2 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    1 -
 drivers/gpu/drm/arm/Kconfig                        |    2 +
 drivers/gpu/drm/arm/display/Kconfig                |    1 +
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |    2 +
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    8 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |    4 +-
 drivers/gpu/drm/armada/Kconfig                     |    1 +
 drivers/gpu/drm/armada/armada_drm.h                |   11 +-
 drivers/gpu/drm/armada/armada_drv.c                |    8 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |  113 +-
 drivers/gpu/drm/aspeed/Kconfig                     |    1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |    4 +-
 drivers/gpu/drm/ast/Kconfig                        |    1 +
 drivers/gpu/drm/ast/ast_dp.c                       |  137 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |  111 +-
 drivers/gpu/drm/ast/ast_drv.c                      |   12 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   19 +-
 drivers/gpu/drm/ast/ast_main.c                     |   67 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   34 +-
 drivers/gpu/drm/ast/ast_post.c                     |   36 +-
 drivers/gpu/drm/ast/ast_reg.h                      |   41 +-
 drivers/gpu/drm/ast/ast_sil164.c                   |   59 +-
 drivers/gpu/drm/ast/ast_vga.c                      |   59 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig                |    1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |    5 +-
 drivers/gpu/drm/bridge/Kconfig                     |   20 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |    2 +
 drivers/gpu/drm/bridge/aux-bridge.c                |    4 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |    4 +
 drivers/gpu/drm/bridge/display-connector.c         |    4 +
 drivers/gpu/drm/bridge/imx/Kconfig                 |   10 +
 drivers/gpu/drm/bridge/imx/Makefile                |    1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   88 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |   20 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |    9 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    9 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |    9 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  898 +++++++++
 drivers/gpu/drm/bridge/ite-it6505.c                |   11 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |    2 -
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  173 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |    8 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   24 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |    8 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |    2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c      |    8 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  647 +++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       |  834 +++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |    3 +
 drivers/gpu/drm/bridge/tc358767.c                  |   65 +-
 drivers/gpu/drm/bridge/tc358768.c                  |    4 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    4 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |  111 ++
 drivers/gpu/drm/ci/arm64.config                    |    7 +-
 drivers/gpu/drm/ci/build.sh                        |    1 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   14 +-
 drivers/gpu/drm/ci/image-tags.yml                  |    2 +-
 drivers/gpu/drm/ci/test.yml                        |   25 +
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |    2 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |    7 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |    2 +-
 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |    7 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |    1 -
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |    7 +
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   10 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |   14 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt       |   51 +
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt      |   13 +
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt       |   20 +
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |    2 -
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   34 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |    9 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   11 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |    6 -
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |    1 -
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |    5 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    5 -
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   27 -
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   27 -
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |    6 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |   14 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |    5 +
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt |   15 +
 .../gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt    |    6 +
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt |  211 +++
 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt  |    1 +
 .../gpu/drm/ci/xfails/panfrost-mt8183-fails.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-fails.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-fails.txt    |    1 +
 drivers/gpu/drm/ci/xfails/requirements.txt         |   17 -
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   22 +-
 .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt   |   28 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |    7 -
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   28 +
 drivers/gpu/drm/ci/xfails/update-xfails.py         |  204 --
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |   21 -
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |   53 +
 drivers/gpu/drm/display/Kconfig                    |    8 +-
 drivers/gpu/drm/display/Makefile                   |    5 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |    6 +-
 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c  |    4 +-
 drivers/gpu/drm/drm_aperture.c                     |  192 --
 drivers/gpu/drm/drm_atomic.c                       |    2 +
 drivers/gpu/drm/drm_atomic_helper.c                |    2 +-
 drivers/gpu/drm/drm_client.c                       |  121 --
 drivers/gpu/drm/drm_client_event.c                 |  197 ++
 drivers/gpu/drm/drm_client_modeset.c               |   28 +-
 drivers/gpu/drm/drm_client_setup.c                 |   69 +
 drivers/gpu/drm/drm_debugfs.c                      |   15 +-
 drivers/gpu/drm/drm_drv.c                          |    2 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  104 +-
 drivers/gpu/drm/drm_fbdev_client.c                 |  167 ++
 drivers/gpu/drm/drm_fbdev_dma.c                    |  170 +-
 drivers/gpu/drm/drm_fbdev_shmem.c                  |  170 +-
 drivers/gpu/drm/drm_fbdev_ttm.c                    |  237 +--
 drivers/gpu/drm/drm_file.c                         |   14 +-
 drivers/gpu/drm/drm_fourcc.c                       |   30 +-
 drivers/gpu/drm/drm_framebuffer.c                  |    2 +
 drivers/gpu/drm/drm_gem.c                          |   52 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |   30 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   45 -
 drivers/gpu/drm/drm_internal.h                     |    8 +
 drivers/gpu/drm/drm_ioctl.c                        |   51 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |   16 +
 drivers/gpu/drm/drm_mm.c                           |    4 +-
 drivers/gpu/drm/drm_mode_object.c                  |    1 +
 drivers/gpu/drm/drm_modeset_helper.c               |   14 +-
 drivers/gpu/drm/drm_of.c                           |   84 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |   18 +
 drivers/gpu/drm/drm_panic.c                        |   10 +
 drivers/gpu/drm/drm_print.c                        |   14 +
 drivers/gpu/drm/drm_probe_helper.c                 |    2 +-
 drivers/gpu/drm/drm_writeback.c                    |    6 -
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |    3 +-
 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c           |    4 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   21 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   14 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h              |    5 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |   64 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |    1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |   40 +-
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h              |    1 -
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c          |    4 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   19 +-
 drivers/gpu/drm/etnaviv/state_hi.xml.h             |   21 +-
 drivers/gpu/drm/exynos/Kconfig                     |    1 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |  122 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    3 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   99 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h          |   15 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   25 +-
 drivers/gpu/drm/exynos/regs-decon7.h               |   15 +-
 drivers/gpu/drm/fsl-dcu/Kconfig                    |    2 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |   27 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h          |    3 +
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c                 |    2 +-
 drivers/gpu/drm/gma500/Kconfig                     |    1 +
 drivers/gpu/drm/gma500/fbdev.c                     |  100 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |    4 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |   12 +-
 drivers/gpu/drm/gud/Kconfig                        |    1 +
 drivers/gpu/drm/gud/gud_drv.c                      |    4 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |    1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    8 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |    1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    2 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    8 +-
 drivers/gpu/drm/i915/Kconfig                       |    2 +
 drivers/gpu/drm/i915/Makefile                      |    7 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   58 +-
 drivers/gpu/drm/i915/display/g4x_dp.h              |    5 -
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    9 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   49 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   22 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |  202 +-
 drivers/gpu/drm/i915/display/i9xx_wm.h             |    4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  446 ++---
 drivers/gpu/drm/i915/display/icl_dsi.h             |    4 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    6 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  203 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   19 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    9 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    6 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |  204 +-
 drivers/gpu/drm/i915/display/intel_bo.c            |   59 +
 drivers/gpu/drm/i915/display/intel_bo.h            |   27 +
 drivers/gpu/drm/i915/display/intel_bw.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 1236 ++++++------
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   28 +-
 drivers/gpu/drm/i915/display/intel_color.c         |  883 ++++-----
 drivers/gpu/drm/i915/display/intel_color.h         |   14 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |  216 ++-
 drivers/gpu/drm/i915/display/intel_crt.h           |   10 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   77 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   12 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  104 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  474 +++--
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |    8 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |    7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  118 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    6 +-
 drivers/gpu/drm/i915/display/intel_de.h            |   57 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  893 ++++++---
 drivers/gpu/drm/i915/display/intel_display.h       |   75 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   13 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  320 +---
 .../gpu/drm/i915/display/intel_display_device.c    |  295 ++-
 .../gpu/drm/i915/display/intel_display_device.h    |  213 ++-
 .../gpu/drm/i915/display/intel_display_driver.c    |   54 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  345 ++--
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    6 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |   10 +
 .../gpu/drm/i915/display/intel_display_params.c    |    8 +-
 .../gpu/drm/i915/display/intel_display_params.h    |    5 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  176 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    8 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |  134 +-
 .../drm/i915/display/intel_display_power_well.c    |  363 ++--
 .../drm/i915/display/intel_display_power_well.h    |   15 +-
 .../gpu/drm/i915/display/intel_display_snapshot.c  |   72 +
 .../gpu/drm/i915/display/intel_display_snapshot.h  |   16 +
 drivers/gpu/drm/i915/display/intel_display_trace.h |  261 +--
 drivers/gpu/drm/i915/display/intel_display_types.h |  195 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  433 +++--
 drivers/gpu/drm/i915/display/intel_dmc.h           |   30 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  958 +++-------
 drivers/gpu/drm/i915/display/intel_dp.h            |   25 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   98 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   36 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   56 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c       |  765 ++++++++
 drivers/gpu/drm/i915/display/intel_dp_test.h       |   23 +
 drivers/gpu/drm/i915/display/intel_dp_tunnel.h     |    2 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  158 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |   22 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   48 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   96 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c          |    2 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |  143 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    7 +
 drivers/gpu/drm/i915/display/intel_dsi.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    5 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    9 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |  154 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |    8 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |    9 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |   10 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |   14 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |    6 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   27 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |    6 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   52 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   88 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   66 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |    5 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |  290 +--
 drivers/gpu/drm/i915/display/intel_gmbus.h         |   15 +-
 drivers/gpu/drm/i915/display/intel_gmbus_regs.h    |   16 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |  749 ++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h          |   10 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |   40 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |    9 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |   44 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.h  |    3 +-
 drivers/gpu/drm/i915/display/intel_hdcp_shim.h     |  137 ++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   46 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    3 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    3 +
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   19 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |    3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   20 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |   89 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    1 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |   18 +-
 drivers/gpu/drm/i915/display/intel_overlay.h       |   25 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |  330 +---
 drivers/gpu/drm/i915/display/intel_panel.h         |    6 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   56 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |    9 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |  554 ++++++
 drivers/gpu/drm/i915/display/intel_pfit.h          |   15 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    4 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    2 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   71 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |  283 ++-
 drivers/gpu/drm/i915/display/intel_pps.h           |   13 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  165 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |    2 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |    7 +-
 drivers/gpu/drm/i915/display/intel_quirks.c        |    4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   10 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   11 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   27 +-
 drivers/gpu/drm/i915/display/intel_sprite.h        |    5 -
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |    3 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |    2 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   11 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   13 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   21 +-
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |    2 +
 drivers/gpu/drm/i915/display/intel_vga.c           |   45 +-
 drivers/gpu/drm/i915/display/intel_vga.h           |   14 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           |   20 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    2 +
 drivers/gpu/drm/i915/display/intel_wm.c            |   26 +-
 drivers/gpu/drm/i915/display/intel_wm.h            |    6 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |   77 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  435 +++--
 .../drm/i915/display/skl_universal_plane_regs.h    |    1 +
 drivers/gpu/drm/i915/display/skl_watermark.c       |   32 +-
 drivers/gpu/drm/i915/display/skl_watermark.h       |    4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    4 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    7 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |    4 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |   23 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.h           |    6 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c         |    3 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |    2 +-
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c             |   24 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |   12 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    5 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    7 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    4 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   38 +-
 drivers/gpu/drm/i915/gt/intel_tlb.c                |    2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   13 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    8 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c          |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h        |    1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    1 -
 drivers/gpu/drm/i915/gvt/display.c                 |    4 +-
 drivers/gpu/drm/i915/gvt/display.h                 |   42 -
 drivers/gpu/drm/i915/gvt/edid.c                    |   12 +-
 drivers/gpu/drm/i915/gvt/edid.h                    |    8 -
 drivers/gpu/drm/i915/gvt/gtt.c                     |    2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   43 +-
 drivers/gpu/drm/i915/gvt/opregion.c                |    2 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |    2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |    2 +-
 drivers/gpu/drm/i915/i915_active.c                 |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    6 -
 drivers/gpu/drm/i915/i915_driver.c                 |   28 +-
 drivers/gpu/drm/i915/i915_drv.h                    |   41 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   25 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |   11 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |   40 +
 drivers/gpu/drm/i915/i915_irq.c                    |  330 +---
 drivers/gpu/drm/i915/i915_irq.h                    |   40 +-
 drivers/gpu/drm/i915/i915_pci.c                    |    6 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |   54 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  468 ++---
 drivers/gpu/drm/i915/i915_reg_defs.h               |   10 +
 drivers/gpu/drm/i915/i915_suspend.c                |    5 +-
 drivers/gpu/drm/i915/i915_trace.h                  |    2 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    2 +-
 drivers/gpu/drm/i915/i915_vma.c                    |    4 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |    2 +-
 drivers/gpu/drm/i915/intel_device_info.c           |    2 +-
 drivers/gpu/drm/i915/intel_device_info.h           |    1 -
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |    4 +
 drivers/gpu/drm/i915/intel_runtime_pm.c            |    8 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |   15 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |   14 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |   18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.h               |    4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    6 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |    4 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |    5 +-
 drivers/gpu/drm/i915/soc/intel_rom.c               |  160 ++
 drivers/gpu/drm/i915/soc/intel_rom.h               |   25 +
 drivers/gpu/drm/imagination/pvr_ccb.c              |    2 +-
 drivers/gpu/drm/imagination/pvr_context.c          |   18 +-
 drivers/gpu/drm/imagination/pvr_drv.c              |    2 +-
 drivers/gpu/drm/imagination/pvr_job.c              |   13 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |    4 +-
 drivers/gpu/drm/imagination/pvr_vm.c               |    4 +-
 drivers/gpu/drm/imx/dcss/Kconfig                   |    3 +-
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               |    6 +-
 drivers/gpu/drm/imx/dcss/dcss-dtg.c                |    4 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |    5 +-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c             |    4 +-
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |   14 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   11 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm.h                |   14 -
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |  203 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |    8 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c             |    6 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |  139 +-
 drivers/gpu/drm/imx/lcdc/Kconfig                   |    1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    4 +-
 drivers/gpu/drm/ingenic/Kconfig                    |    1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    4 +-
 drivers/gpu/drm/kmb/Kconfig                        |    1 +
 drivers/gpu/drm/kmb/kmb_drv.c                      |    4 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                      |    4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    2 +-
 drivers/gpu/drm/logicvc/Kconfig                    |    1 +
 drivers/gpu/drm/logicvc/logicvc_drm.c              |   16 +-
 drivers/gpu/drm/loongson/Kconfig                   |    1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                |   12 +-
 drivers/gpu/drm/mcde/Kconfig                       |    1 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |    5 +-
 drivers/gpu/drm/mediatek/Kconfig                   |    5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |    1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   43 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   21 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  260 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |    2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   14 +-
 drivers/gpu/drm/meson/Kconfig                      |    3 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   10 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   14 -
 drivers/gpu/drm/mgag200/Kconfig                    |    3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    9 +-
 drivers/gpu/drm/msm/Kconfig                        |    4 +
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |    2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |    2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |    6 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   61 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  246 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  170 ++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   87 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |  456 +++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   27 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  210 +++
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  187 ++
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  218 +++
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  338 ++++
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   12 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   14 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  485 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   46 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |   25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |   27 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   45 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   38 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  179 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  107 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   90 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    6 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    6 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  252 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |   33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  121 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |    8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   14 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |    8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   52 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |    8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |    7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |    8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |    9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |    9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |    9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |    9 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |    7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   34 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  301 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   31 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   46 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   50 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |   18 -
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |   19 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  294 +--
 drivers/gpu/drm/msm/dp/dp_audio.h                  |   38 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  148 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   18 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  732 ++++----
 drivers/gpu/drm/msm/dp/dp_catalog.h                |  118 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  482 ++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   40 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |   68 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   10 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  909 ++++-----
 drivers/gpu/drm/msm/dp/dp_display.h                |   18 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  150 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   27 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  432 ++---
 drivers/gpu/drm/msm/dp/dp_link.h                   |   44 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  254 +--
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   42 +-
 drivers/gpu/drm/msm/dp/dp_utils.c                  |   20 +-
 drivers/gpu/drm/msm/dp/dp_utils.h                  |    8 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |    7 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    8 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   31 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |  144 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |    2 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   11 -
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |    9 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h                |   28 +
 drivers/gpu/drm/msm/msm_kms.c                      |    4 +-
 drivers/gpu/drm/msm/msm_kms.h                      |    6 -
 drivers/gpu/drm/msm/msm_mdss.c                     |   46 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |    2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   18 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |    7 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |    7 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |   39 +-
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |   16 -
 drivers/gpu/drm/msm/registers/display/mdss.xml     |   29 +
 drivers/gpu/drm/mxsfb/Kconfig                      |    2 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |    4 +-
 drivers/gpu/drm/nouveau/Kconfig                    |    1 +
 drivers/gpu/drm/nouveau/dispnv50/tile.h            |   63 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  129 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    5 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |   67 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   14 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c              |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c  |    2 +-
 .../drm/nouveau/nvkm/subdev/i2c/{aux.c =3D> auxch.c} |    2 +-
 .../drm/nouveau/nvkm/subdev/i2c/{aux.h =3D> auxch.h} |    0
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c    |    2 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |    1 +
 drivers/gpu/drm/omapdrm/dss/base.c                 |   25 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |  146 --
 drivers/gpu/drm/omapdrm/dss/dss.h                  |   13 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h              |    3 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |    6 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    5 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |    3 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |  161 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.h               |    8 +
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   10 +-
 drivers/gpu/drm/panel/Kconfig                      |   42 +-
 drivers/gpu/drm/panel/Makefile                     |    4 +
 drivers/gpu/drm/panel/panel-edp.c                  |    2 +
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |  114 +-
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       |  291 ++-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |    2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |  210 +--
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |   23 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |    1 -
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |    4 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |  339 ++--
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |    2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   15 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |   16 +-
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      |   87 +-
 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c   |  283 +++
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c   |  329 ++++
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |   71 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      |  342 ++++
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   |  766 ++++++++
 drivers/gpu/drm/panel/panel-simple.c               |   28 +
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |    3 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    3 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   45 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   13 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   30 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |    2 +
 drivers/gpu/drm/panthor/panthor_devfreq.c          |   29 +-
 drivers/gpu/drm/panthor/panthor_device.h           |   36 +
 drivers/gpu/drm/panthor/panthor_drv.c              |  175 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |   57 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   12 +
 drivers/gpu/drm/panthor/panthor_gpu.c              |   47 +
 drivers/gpu/drm/panthor/panthor_gpu.h              |    4 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |    6 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |  408 +++-
 drivers/gpu/drm/panthor/panthor_sched.h            |    2 +
 drivers/gpu/drm/pl111/Kconfig                      |    1 +
 drivers/gpu/drm/pl111/pl111_drv.c                  |    4 +-
 drivers/gpu/drm/qxl/Kconfig                        |    1 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |    8 +-
 drivers/gpu/drm/radeon/Kconfig                     |    1 +
 drivers/gpu/drm/radeon/r600_cs.c                   |    2 +-
 drivers/gpu/drm/radeon/radeon_device.c             |   19 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   19 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |  120 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |   15 +-
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |    1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |    4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c    |   14 +-
 drivers/gpu/drm/renesas/rz-du/Kconfig              |    1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |    4 +-
 drivers/gpu/drm/renesas/shmobile/Kconfig           |    1 +
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |    5 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |   14 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   10 +
 drivers/gpu/drm/rockchip/Makefile                  |    1 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.h              |    2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  162 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  424 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   33 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |    1 +
 drivers/gpu/drm/scheduler/sched_entity.c           |   52 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   86 +-
 drivers/gpu/drm/solomon/Kconfig                    |    1 +
 drivers/gpu/drm/solomon/ssd130x.c                  |    4 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |    2 +-
 drivers/gpu/drm/sti/Kconfig                        |    1 +
 drivers/gpu/drm/sti/sti_cursor.c                   |    3 +
 drivers/gpu/drm/sti/sti_drv.c                      |    4 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |    3 +
 drivers/gpu/drm/sti/sti_hqvdp.c                    |    3 +
 drivers/gpu/drm/stm/Kconfig                        |    1 +
 drivers/gpu/drm/stm/drv.c                          |    9 +-
 drivers/gpu/drm/sun4i/Kconfig                      |    1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    8 +-
 drivers/gpu/drm/tegra/Kconfig                      |    1 +
 drivers/gpu/drm/tegra/drm.c                        |    9 +-
 drivers/gpu/drm/tegra/drm.h                        |   12 +-
 drivers/gpu/drm/tegra/fbdev.c                      |   98 +-
 drivers/gpu/drm/tegra/gem.c                        |   65 +-
 drivers/gpu/drm/tegra/gem.h                        |   21 +
 drivers/gpu/drm/tegra/hdmi.c                       |    2 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c       |  375 +++-
 drivers/gpu/drm/tidss/Kconfig                      |    1 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |    4 +-
 drivers/gpu/drm/tilcdc/Kconfig                     |    1 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |    5 +-
 drivers/gpu/drm/tiny/Kconfig                       |   41 +-
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/arcpgu.c                      |    4 +-
 drivers/gpu/drm/tiny/bochs.c                       |  399 ++--
 drivers/gpu/drm/tiny/cirrus.c                      |    8 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |    4 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    4 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    4 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |   13 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    4 +-
 drivers/gpu/drm/tiny/repaper.c                     |    4 +-
 drivers/gpu/drm/tiny/sharp-memory.c                |  671 +++++++
 drivers/gpu/drm/tiny/simpledrm.c                   |   17 +-
 drivers/gpu/drm/tiny/st7586.c                      |    4 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    4 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |    4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |    6 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   67 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |    6 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    2 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |    4 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   28 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |    3 +
 drivers/gpu/drm/tve200/Kconfig                     |    1 +
 drivers/gpu/drm/tve200/tve200_drv.c                |    9 +-
 drivers/gpu/drm/udl/Kconfig                        |    1 +
 drivers/gpu/drm/udl/udl_drv.c                      |    4 +-
 drivers/gpu/drm/v3d/Makefile                       |    3 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |   16 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   10 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |   14 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |    6 +-
 drivers/gpu/drm/v3d/v3d_gemfs.c                    |   50 +
 drivers/gpu/drm/v3d/v3d_irq.c                      |    2 +
 drivers/gpu/drm/v3d/v3d_mmu.c                      |   81 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |    6 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |   46 +-
 drivers/gpu/drm/vboxvideo/Kconfig                  |    1 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    9 +-
 drivers/gpu/drm/vc4/Kconfig                        |    1 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |   14 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   28 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |   35 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   32 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   29 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   24 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   25 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |    5 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  363 ++--
 drivers/gpu/drm/vc4/vc4_irq.c                      |   10 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |   14 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |   26 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |  281 ++-
 drivers/gpu/drm/vc4/vc4_regs.h                     |    1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c                |    2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   10 +-
 drivers/gpu/drm/vc4/vc4_validate.c                 |    8 +-
 drivers/gpu/drm/vc4/vc4_validate_shaders.c         |    2 +-
 drivers/gpu/drm/virtio/Kconfig                     |    1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   10 +-
 drivers/gpu/drm/vkms/Kconfig                       |    1 +
 drivers/gpu/drm/vkms/vkms_composer.c               |   11 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   11 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    4 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |  101 +-
 drivers/gpu/drm/vkms/vkms_formats.c                |   62 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |   19 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    4 +-
 drivers/gpu/drm/vmwgfx/Kconfig                     |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    4 +-
 drivers/gpu/drm/xe/Kconfig                         |    2 +
 drivers/gpu/drm/xe/Kconfig.debug                   |   12 +
 drivers/gpu/drm/xe/Makefile                        |    9 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |    8 +
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h     |   61 +
 drivers/gpu/drm/xe/abi/guc_capture_abi.h           |  186 ++
 drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h |    1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |    1 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h               |   75 +
 .../drm/xe/compat-i915-headers/gem/i915_gem_lmem.h |    1 -
 .../drm/xe/compat-i915-headers/gem/i915_gem_mman.h |   17 -
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |   64 -
 .../gem/i915_gem_object_frontbuffer.h              |   12 -
 .../gem/i915_gem_object_types.h                    |   11 -
 .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |    2 +-
 .../gpu/drm/xe/compat-i915-headers/i915_debugfs.h  |   14 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    8 +-
 .../drm/xe/compat-i915-headers/i915_gpu_error.h    |   17 -
 .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |   17 +-
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   60 +-
 .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |    4 +-
 .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |   10 +-
 .../gpu/drm/xe/compat-i915-headers/soc/intel_rom.h |    6 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |   33 +-
 drivers/gpu/drm/xe/display/intel_bo.c              |   84 +
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |   19 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.h           |   24 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   12 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   71 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    4 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |    9 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   69 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   52 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    4 +-
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |    1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   69 +-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |    2 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h              |   82 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h              |    2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h                  |   14 -
 drivers/gpu/drm/xe/tests/xe_bo.c                   |  240 +++
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |   22 +-
 drivers/gpu/drm/xe/xe_assert.h                     |    2 +-
 drivers/gpu/drm/xe/xe_bo.c                         |   67 +-
 drivers/gpu/drm/xe/xe_bo.h                         |   10 +-
 drivers/gpu/drm/xe/xe_bo_types.h                   |    8 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |   27 +-
 drivers/gpu/drm/xe/xe_devcoredump.c                |  171 +-
 drivers/gpu/drm/xe/xe_devcoredump.h                |    6 +
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |   21 +-
 drivers/gpu/drm/xe/xe_device.c                     |  131 +-
 drivers/gpu/drm/xe/xe_device.h                     |   15 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   62 +-
 drivers/gpu/drm/xe/xe_drm_client.c                 |    8 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |    2 +-
 drivers/gpu/drm/xe/xe_execlist.c                   |   21 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |  126 +-
 drivers/gpu/drm/xe/xe_force_wake.h                 |   23 +-
 drivers/gpu/drm/xe/xe_force_wake_types.h           |    6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |   16 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |   47 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   13 +-
 drivers/gpu/drm/xe/xe_gt.c                         |  145 +-
 drivers/gpu/drm/xe/xe_gt.h                         |    2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |    2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c                   |    6 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |   26 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |    2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  137 +-
 drivers/gpu/drm/xe/xe_gt_idle.h                    |    2 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h              |    2 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   68 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |    1 +
 drivers/gpu/drm/xe/xe_gt_printk.h                  |    2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |   56 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h                |    1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  239 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |    5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |   44 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h  |    2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |  132 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      |  419 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h      |   24 +
 .../gpu/drm/xe/xe_gt_sriov_pf_migration_types.h    |   40 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |    6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |    6 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |    4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c        |    2 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c                |    4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |   13 +-
 drivers/gpu/drm/xe/xe_gt_topology.c                |   22 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |   22 +-
 drivers/gpu/drm/xe/xe_guc.c                        |   88 +-
 drivers/gpu/drm/xe/xe_guc.h                        |    5 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  169 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h              |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c                | 1975 ++++++++++++++++=
++++
 drivers/gpu/drm/xe/xe_guc_capture.h                |   61 +
 drivers/gpu/drm/xe/xe_guc_capture_types.h          |   68 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  476 +++--
 drivers/gpu/drm/xe/xe_guc_ct.h                     |    9 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |   29 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |   14 +
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |   27 +-
 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h     |    7 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |  321 +++-
 drivers/gpu/drm/xe/xe_guc_log.h                    |   15 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h              |   34 +
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   84 +-
 drivers/gpu/drm/xe/xe_guc_relay.c                  |    2 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   96 +-
 drivers/gpu/drm/xe/xe_guc_submit.h                 |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h                  |    2 +
 drivers/gpu/drm/xe/xe_huc.c                        |   14 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  305 +--
 drivers/gpu/drm/xe/xe_hw_engine.h                  |    6 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h            |   68 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   16 +-
 drivers/gpu/drm/xe/xe_irq.c                        |   78 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |    2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   26 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |   19 +-
 drivers/gpu/drm/xe/xe_memirq.c                     |  203 +-
 drivers/gpu/drm/xe/xe_memirq.h                     |    6 +-
 drivers/gpu/drm/xe/xe_memirq_types.h               |    4 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |  139 +-
 drivers/gpu/drm/xe/xe_mmio.h                       |   35 +-
 drivers/gpu/drm/xe/xe_mocs.c                       |   31 +-
 drivers/gpu/drm/xe/xe_oa.c                         |  726 ++++---
 drivers/gpu/drm/xe/xe_oa_types.h                   |   12 +
 drivers/gpu/drm/xe/xe_pat.c                        |   88 +-
 drivers/gpu/drm/xe/xe_pci.c                        |  104 +-
 drivers/gpu/drm/xe/xe_pcode.c                      |    4 +-
 drivers/gpu/drm/xe/xe_platform_types.h             |    1 +
 drivers/gpu/drm/xe/xe_pm.c                         |    2 +
 drivers/gpu/drm/xe/xe_query.c                      |   93 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |   33 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |    2 +-
 drivers/gpu/drm/xe/xe_sa.c                         |    2 +-
 drivers/gpu/drm/xe/xe_sched_job.c                  |    2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h            |    3 +-
 drivers/gpu/drm/xe/xe_sriov.c                      |    5 +-
 drivers/gpu/drm/xe/xe_sync.c                       |    2 +
 drivers/gpu/drm/xe/xe_tile.c                       |    3 +
 drivers/gpu/drm/xe/xe_trace.h                      |    7 +-
 drivers/gpu/drm/xe/xe_trace_bo.h                   |    2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |    8 +-
 drivers/gpu/drm/xe/xe_tuning.c                     |   10 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                      |   19 +-
 drivers/gpu/drm/xe/xe_vram.c                       |   19 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   58 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |    4 +
 drivers/gpu/drm/xe/xe_wopcm.c                      |   15 +-
 drivers/gpu/drm/xlnx/Kconfig                       |    1 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |    3 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  843 ++++++++-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   10 +-
 drivers/gpu/host1x/context_bus.c                   |    2 +-
 drivers/gpu/host1x/dev.c                           |  150 +-
 drivers/gpu/host1x/dev.h                           |    6 +-
 drivers/gpu/host1x/hw/cdma_hw.c                    |   12 +
 drivers/gpu/host1x/hw/debug_hw.c                   |   15 +-
 drivers/video/fbdev/atmel_lcdfb.c                  |    4 +-
 drivers/video/fbdev/aty/aty128fb.c                 |    6 +-
 drivers/video/fbdev/aty/atyfb_base.c               |    2 +-
 drivers/video/fbdev/aty/radeon_backlight.c         |    2 +-
 drivers/video/fbdev/chipsfb.c                      |    2 +-
 drivers/video/fbdev/nvidia/nv_backlight.c          |    2 +-
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |    4 +-
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   |    2 +-
 drivers/video/fbdev/riva/fbdev.c                   |    2 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |    6 +-
 include/drm/bridge/dw_hdmi_qp.h                    |   32 +
 include/drm/bridge/imx.h                           |   17 +
 include/drm/drm_aperture.h                         |   38 -
 include/drm/drm_bridge.h                           |    5 +
 include/drm/drm_client.h                           |   41 +-
 include/drm/drm_client_event.h                     |   27 +
 include/drm/drm_client_setup.h                     |   26 +
 include/drm/drm_drv.h                              |   18 +
 include/drm/drm_fb_helper.h                        |    4 +
 include/drm/drm_fbdev_client.h                     |   19 +
 include/drm/drm_fbdev_dma.h                        |   13 +-
 include/drm/drm_fbdev_shmem.h                      |   13 +-
 include/drm/drm_fbdev_ttm.h                        |   15 +-
 include/drm/drm_file.h                             |   12 +
 include/drm/drm_fourcc.h                           |    1 +
 include/drm/drm_gem.h                              |    3 +
 include/drm/drm_gem_shmem_helper.h                 |    3 +
 include/drm/drm_gem_vram_helper.h                  |   13 -
 include/drm/drm_mipi_dsi.h                         |    2 +
 include/drm/drm_of.h                               |    9 +
 include/drm/drm_panic.h                            |   14 +
 include/drm/drm_print.h                            |   64 +
 include/drm/gpu_scheduler.h                        |   56 +-
 include/drm/intel/{i915_pciids.h =3D> pciids.h}      |   74 +-
 include/drm/intel/xe_pciids.h                      |  202 --
 include/drm/ttm/ttm_bo.h                           |    2 +
 include/drm/ttm/ttm_device.h                       |    5 +-
 include/drm/ttm/ttm_tt.h                           |    5 +
 include/linux/dma-fence.h                          |    6 +
 include/linux/dma-resv.h                           |    6 +-
 include/linux/host1x.h                             |    5 +
 include/linux/host1x_context_bus.h                 |    2 +-
 include/uapi/drm/drm.h                             |   17 +
 include/uapi/drm/drm_fourcc.h                      |    1 +
 include/uapi/drm/ivpu_accel.h                      |    9 +-
 include/uapi/drm/msm_drm.h                         |    5 +-
 include/uapi/drm/panfrost_drm.h                    |    3 +
 include/uapi/drm/panthor_drm.h                     |   51 +
 include/uapi/drm/v3d_drm.h                         |    1 +
 include/uapi/drm/xe_drm.h                          |   21 +-
 include/uapi/linux/kfd_ioctl.h                     |    7 +-
 include/uapi/linux/kfd_sysfs.h                     |    3 +-
 include/uapi/linux/media-bus-format.h              |    4 +-
 1481 files changed, 52111 insertions(+), 29173 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panthor-profilin=
g
 create mode 100644 Documentation/accel/qaic/aic080.rst
 create mode 100644
Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
 create mode 100644
Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
 create mode 100644
Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 delete mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,ams639rq08.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.=
yaml
 create mode 100644
Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-=
qp.yaml
 create mode 100644
Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 Documentation/gpu/amdgpu/display/dc-arch-overview.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dc-components.svg
 create mode 100644 Documentation/gpu/amdgpu/display/programming-model-dcn.=
rst
 create mode 100644 Documentation/gpu/amdgpu/process-isolation.rst
 create mode 100644 Documentation/gpu/msm-preemption.rst
 create mode 100644 Documentation/gpu/panthor.rst
 create mode 100644 Documentation/gpu/zynqmp.rst
 create mode 100644 drivers/accel/ivpu/ivpu_coredump.c
 create mode 100644 drivers/accel/ivpu/ivpu_coredump.h
 create mode 100644 drivers/accel/ivpu/ivpu_trace.h
 create mode 100644 drivers/accel/ivpu/ivpu_trace_points.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3_cleaner_shader.a=
sm
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_cleaner_shader.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2_cleaner_shader.as=
m
 delete mode 100644 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
 create mode 100644 drivers/gpu/drm/bridge/ti-tdp158.c
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
 delete mode 100644 drivers/gpu/drm/ci/xfails/requirements.txt
 delete mode 100755 drivers/gpu/drm/ci/xfails/update-xfails.py
 delete mode 100644 drivers/gpu/drm/drm_aperture.c
 create mode 100644 drivers/gpu/drm/drm_client_event.c
 create mode 100644 drivers/gpu/drm/drm_client_setup.c
 create mode 100644 drivers/gpu/drm/drm_fbdev_client.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_bo.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_snapshot.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_snapshot.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_test.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_test.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_shim.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pfit.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pfit.h
 create mode 100644 drivers/gpu/drm/i915/soc/intel_rom.c
 create mode 100644 drivers/gpu/drm/i915/soc/intel_rom.h
 create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_preempt.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.=
h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.=
h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.=
h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
 create mode 100644 drivers/gpu/drm/msm/registers/display/mdss.xml
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/tile.h
 rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c =3D> auxch.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h =3D> auxch.h} (100%)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.=
c
 create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
 create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lme=
m.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mma=
n.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect.h
 delete mode 100644
drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
 delete mode 100644
drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_types.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_rom.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_bo.c
 delete mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_irq_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h
 create mode 100644 include/drm/bridge/dw_hdmi_qp.h
 create mode 100644 include/drm/bridge/imx.h
 delete mode 100644 include/drm/drm_aperture.h
 create mode 100644 include/drm/drm_client_event.h
 create mode 100644 include/drm/drm_client_setup.h
 create mode 100644 include/drm/drm_fbdev_client.h
 rename include/drm/intel/{i915_pciids.h =3D> pciids.h} (94%)
 delete mode 100644 include/drm/intel/xe_pciids.h
