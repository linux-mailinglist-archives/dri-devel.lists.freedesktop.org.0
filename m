Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F58082A242
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F6410E681;
	Wed, 10 Jan 2024 20:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5BB10E648
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 19:49:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55753dc5cf0so5420935a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704916176; x=1705520976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M4/vmM0qu06JPx1mc5WtPWrQg+Reyl9eTPPoQKPwwGM=;
 b=FI7z8rxLTDcRu46Mgs0cw+ehU7xPpGKQ3ybqX2CBrVN5EG4MZv+xs8gAbKvuU5h9R/
 eb5OfR1X/TcgK+0plTgyi7wWKqBxqmM0x3tHiQNaaAAzUIOBkvEfw5rJtTgfZKh5o7Ot
 Nps3TQ1sO/DVbJ08UXc/1VLi/UtXQLpJubBzW/OqSjVCZuBoloy16ev/pbLhluRBm0Gq
 zF5cggk3gX1lpk6DKZzELtHCSFtCFIh4SIWSE0lWp22/kclroZVcdMpIRxZvugk2JzKm
 GWcHzO5N0LXHwwb88yhFBSpxInJUMoT4WGLXh7FXWn/B/dB7NRBeh/65xMh9+81c8Qig
 mW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704916176; x=1705520976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4/vmM0qu06JPx1mc5WtPWrQg+Reyl9eTPPoQKPwwGM=;
 b=QMvNSC5R+lsza+i27PMvh1reE1CAjb1xcdjhanMLc8Gs8rOsPZ05gAabGaRxsPLcFb
 wftjEthjkg9E6pslcqd6Sh8o549tXYAPPI6gTe/oWdhJ+iMpb5IMChrjYM30BhXAyEjv
 iv3xZRGyoSjV4BUnisJC1UGF28CQskhNUtSOfu8j1S844RZNndPk1kCOlf/R7ofqW5KG
 11VzuA80jcTTrqFSTdMlIGfpj6kQ8b88zOKDaf3pILKtHyZeMpmFa6R+VCkZyRiry6/U
 9TXSEmumt5Ufi4Q1qJAYpD5UWrnwgCcHpKbaAwWXGQL2Btytrl4fO4gCtbu/LeuTW2Hi
 gFMA==
X-Gm-Message-State: AOJu0YypApoYFz6ufPBYYw5tWMQkY2tYMTRBR16uZhY1KyUMICeISEca
 TcFWfjwT09OieqH5yC+u9Cc5q9Mm7biQPQxP0fTnU+sZCCY=
X-Google-Smtp-Source: AGHT+IETkQ8aqTHhlq7eXKsc+dKp5dNjwnwXYozyqyL2paVRTybyrw/Z5cj4ifd+v/+M3W/XaTuK8OrkpIdNnFOAfkc=
X-Received: by 2002:a17:906:c056:b0:a27:65bf:7448 with SMTP id
 bm22-20020a170906c05600b00a2765bf7448mr24188ejb.2.1704916175263; Wed, 10 Jan
 2024 11:49:35 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 11 Jan 2024 05:49:21 +1000
Message-ID: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
Subject: [git pull] drm for 6.8
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 10 Jan 2024 20:29:58 +0000
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

This is the main drm pull request for 6.8.

I've done a conflict test against your current tree, and there are 3,
two quite small ones and one i915 which is a bit larger but it mostly
just accepting the incoming code.

There is one shared tree in here for some wireless interactions with
amdgpu over radio interference. The diffstat also seems a bit out
there for some reason, when I merge and do a git diff --stat it all
looks a lot more normal.

Highlights:
This contains two major new drivers, imagination is a first driver for
Imagination Technologies devices, it only covers very specific
devices, but there is hope to grow it, and xe is a reboot of the i915
GPU (shares display) side using a more upstream focused development
model, and trying to maximise code sharing. It's not enabled for any
hw by default, and will hopefully get switched on for Intel's
Lunarlake.
Dropping UMS ioctls. This also drops a bunch of the old UMS ioctls.
It's been dead long enough.
amdgpu has a bunch of new color management code that is being used in
the Steam Deck.
amdgpu has a new ACPI WBRF interaction to help avoid radio interference.

Otherwise it's the usual lots of changes in lots of places.

Let me know if there are any issues,

Regards,
Dave.

drm-next-2024-01-10:
drm-next for 6.8:

new drivers:
- imagination - new driver for Imagination Technologies GPU
- xe - new driver for Intel GPUs using core drm concepts

core:
- add CLOSE_FB ioctl
- remove old UMS ioctls
- increase max objects to accommodate AMD color mgmt

encoder:
- create per-encoder debugfs directory

edid:
- split out drm_eld
- SAD helpers
- drop edid_firmware module parameter

format-helper:
- cache format conversion buffers

sched:
- move from kthread to workqueue
- rename some internals
- implement dynamic job-flow control

gpuvm:
- provide more features to handle GEM objects

client:
- don't acquire module reference

displayport:
- add mst path property documentation

fdinfo:
- alignment fix

dma-buf:
- add fence timestamp helper
- add fence deadline support

bridge:
- transparent aux-bridge for DP/USB-C
- lt8912b: add suspend/resume support and power regulator support

panel:
- edp: AUO B116XTN02, BOE NT116WHM-N21,836X2, NV116WHM-N49
- chromebook panel support
- elida-kd35t133: rework pm
- powkiddy RK2023 panel
- himax-hx8394: drop prepare/unprepare and shutdown logic
- BOE BP101WX1-100, Powkiddy X55, Ampire AM8001280G
- Evervision VGG644804, SDC ATNA45AF01
- nv3052c: register docs, init sequence fixes, fascontek FS035VG158
- st7701: Anbernic RG-ARC support
- r63353 panel controller
- Ilitek ILI9805 panel controller
- AUO G156HAN04.0

simplefb:
- support memory regions
- support power domains

amdgpu:
- add new 64-bit sequence number infrastructure
- add AMD specific color management
- ACPI WBRF support for RF interference handling
- GPUVM updates
- RAS updates
- DCN 3.5 updates
- Rework PCIe link speed handling
- Document GPU reset types
- DMUB fixes
- eDP fixes
- NBIO 7.9/7.11 updates
- SubVP updates
- XGMI PCIe state dumping for aqua vanjaram
- GFX11 golden register updates
- enable tunnelling on high pri compute

amdkfd:
- Migrate TLB flushing logic to amdgpu
- Trap handler fixes
- Fix restore workers handling on suspend/resume
- Fix possible memory leak in pqm_uninit()
- support import/export of dma-bufs using GEM handles

radeon:
- fix possible overflows in command buffer checking
- check for errors in ring_lock

i915:
- reorg display code for reuse in xe driver
- fdinfo memory stats printing
- DP MST bandwidth mgmt improvements
- DP panel replay enabling
- MTL C20 phy state verification
- MTL DP DSC fractional bpp support
- Audio fastset support
- use dma_fence interfaces instead of i915_sw_fence
- Separate gem and display code
- AUX register macro refactoring
- Separate display module/device parameters
- Move display capabilities debugfs under display
- Makefile cleanups
- Register cleanups
- Move display lock inits under display/
- VLV/CHV DPIO PHY register and interface refactoring
- DSI VBT sequence refactoring
- C10/C20 PHY PLL hardware readout
- DPLL code cleanups
- Cleanup PXP plane protection checks
- Improve display debug msgs
- PSR selective fetch fixes/improvements
- DP MST fixes
- Xe2LPD FBC restrictions removed
- DGFX uses direct VBT pin mapping
- more MTL WAs
- fix MTL eDP bug
- eliminate use of kmap_atomic

habanalabs:
- sysfs entry to identify a device minor id with debugfs path
- sysfs entry to expose device module id
- add signed device info retrieval through INFO ioctl
- add Gaudi2C device support
- pcie reset prepare/done hooks

msm:
- Add support for SDM670, SM8650
- Handle the CFG interconnect to fix the obscure hangs / timeouts
- Kconfig fix for QMP dependency
- use managed allocators
- DPU: SDM670, SM8650 support
- DPU: Enable SmartDMA on SM8350 and SM8450
- DP: enable runtime PM support
- GPU: add metadata UAPI
- GPU: move devcoredumps to GPU device
- GPU: convert to drm_exec

ivpu:
- update FW API
- new debugfs file
- a new NOP job submission test mode
- improve suspend/resume
- PM improvements
- MMU PT optimizations
- firmware profile frequency support
- support for uncached buffers
- switch to gem shmem helpers
- replace kthread with threaded irqs

rockchip:
- rk3066_hdmi: convert to atomic
- vop2: support nv20 and nv30
- rk3588 support

mediatek:
- use devm_platform_ioremap_resource
- stop using iommu_present
- MT8188 VDOSYS1 display support

panfrost:
- PM improvements
- improve interrupt handling as poweroff

qaic:
- allow to run with single MSI
- support host/device time sync
- switch to persistent DRM devices

exynos:
- fix potential error pointer dereference
- fix wrong error checking
- add missing call to drm_atomic_helper_shutdown

omapdrm:
- dma-fence lockdep annotation fix

tidss:
- dma-fence lockdep annotation fix
- support for AM62A7

v3d:
- BCM2712 - rpi5 support
- fdinfo + gputop support
- uapi for CPU job handling

virtio-gpu:
- add context debug name
The following changes since commit 58e82a62669da52e688f4a8b89922c1839bf1001=
:

  platform/x86/amd: Add support for AMD ACPI based Wifi band RFI
mitigation feature (2023-12-11 11:33:44 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2024-01-10

for you to fetch changes up to b76c01f1d950425924ee1c1377760de3c024ef78:

  Merge tag 'drm-intel-gt-next-2023-12-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2024-01-10
11:36:47 +1000)

----------------------------------------------------------------
drm-next for 6.8:

new drivers:
- imagination - new driver for Imagination Technologies GPU
- xe - new driver for Intel GPUs using core drm concepts

core:
- add CLOSE_FB ioctl
- remove old UMS ioctls
- increase max objects to accomodate AMD color mgmt

encoder:
- create per-encoder debugfs directory

edid:
- split out drm_eld
- SAD helpers
- drop edid_firmware module parameter

format-helper:
- cache format conversion buffers

sched:
- move from kthread to workqueue
- rename some internals
- implement dynamic job-flow control

gpuvm:
- provide more features to handle GEM objects

client:
- don't acquire module reference

displayport:
- add mst path property documentation

fdinfo:
- alignment fix

dma-buf:
- add fence timestamp helper
- add fence deadline support

bridge:
- transparent aux-bridge for DP/USB-C
- lt8912b: add suspend/resume support and power regulator support

panel:
- edp: AUO B116XTN02, BOE NT116WHM-N21,836X2, NV116WHM-N49
- chromebook panel support
- elida-kd35t133: rework pm
- powkiddy RK2023 panel
- himax-hx8394: drop prepare/unprepare and shutdown logic
- BOE BP101WX1-100, Powkiddy X55, Ampire AM8001280G
- Evervision VGG644804, SDC ATNA45AF01
- nv3052c: register docs, init sequence fixes, fascontek FS035VG158
- st7701: Anbernic RG-ARC support
- r63353 panel controller
- Ilitek ILI9805 panel controller
- AUO G156HAN04.0

simplefb:
- support memory regions
- support power domains

amdgpu:
- add new 64-bit sequence number infrastructure
- add AMD specific color management
- ACPI WBRF support for RF interference handling
- GPUVM updates
- RAS updates
- DCN 3.5 updates
- Rework PCIe link speed handling
- Document GPU reset types
- DMUB fixes
- eDP fixes
- NBIO 7.9/7.11 updates
- SubVP updates
- XGMI PCIe state dumping for aqua vanjaram
- GFX11 golden register updates
- enable tunnelling on high pri compute

amdkfd:
- Migrate TLB flushing logic to amdgpu
- Trap handler fixes
- Fix restore workers handling on suspend/resume
- Fix possible memory leak in pqm_uninit()
- support import/export of dma-bufs using GEM handles

radeon:
- fix possible overflows in command buffer checking
- check for errors in ring_lock

i915:
- reorg display code for reuse in xe driver
- fdinfo memory stats printing
- DP MST bandwidth mgmt improvements
- DP panel replay enabling
- MTL C20 phy state verification
- MTL DP DSC fractional bpp support
- Audio fastset support
- use dma_fence interfaces instead of i915_sw_fence
- Separate gem and display code
- AUX register macro refactoring
- Separate display module/device parameters
- Move display capabilities debugfs under display
- Makefile cleanups
- Register cleanups
- Move display lock inits under display/
- VLV/CHV DPIO PHY register and interface refactoring
- DSI VBT sequence refactoring
- C10/C20 PHY PLL hardware readout
- DPLL code cleanups
- Cleanup PXP plane protection checks
- Improve display debug msgs
- PSR selective fetch fixes/improvements
- DP MST fixes
- Xe2LPD FBC restrictions removed
- DGFX uses direct VBT pin mapping
- more MTL WAs
- fix MTL eDP bug
- eliminate use of kmap_atomic

habanalabs:
- sysfs entry to identify a device minor id with debugfs path
- sysfs entry to expose device module id
- add signed device info retrieval through INFO ioctl
- add Gaudi2C device support
- pcie reset prepare/done hooks

msm:
- Add support for SDM670, SM8650
- Handle the CFG interconnect to fix the obscure hangs / timeouts
- Kconfig fix for QMP dependency
- use managed allocators
- DPU: SDM670, SM8650 support
- DPU: Enable SmartDMA on SM8350 and SM8450
- DP: enable runtime PM support
- GPU: add metadata UAPI
- GPU: move devcoredumps to GPU device
- GPU: convert to drm_exec

ivpu:
- update FW API
- new debugfs file
- a new NOP job submission test mode
- improve suspend/resume
- PM improvements
- MMU PT optimizations
- firmware profile frequency support
- support for uncached buffers
- switch to gem shmem helpers
- replace kthread with threaded irqs

rockchip:
- rk3066_hdmi: convert to atomic
- vop2: support nv20 and nv30
- rk3588 support

mediatek:
- use devm_platform_ioremap_resource
- stop using iommu_present
- MT8188 VDOSYS1 display support

panfrost:
- PM improvements
- improve interrupt handling as poweroff

qaic:
- allow to run with single MSI
- support host/device time sync
- switch to persistent DRM devices

exynos:
- fix potential error pointer dereference
- fix wrong error checking
- add missing call to drm_atomic_helper_shutdown

omapdrm:
- dma-fence lockdep annotation fix

tidss:
- dma-fence lockdep annotation fix
- support for AM62A7

v3d:
- BCM2712 - rpi5 support
- fdinfo + gputop support
- uapi for CPU job handling

virtio-gpu:
- add context debug name

----------------------------------------------------------------
Abel Vesa (1):
      drm/panel-edp: Add SDC ATNA45AF01

Abhinav Kumar (19):
      drm/msm/dpu: try multirect based on mdp clock limits
      drm/msm/dpu: enable smartdma on sm8350
      drm: improve the documentation of connector hpd ops
      drm: remove drm_bridge_hpd_disable() from drm_bridge_connector_destro=
y()
      drm/msm/dpu: add formats check for writeback encoder
      drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its
functionality
      drm/msm/dpu: fix writeback programming for YUV cases
      drm/msm/dpu: move csc matrices to dpu_hw_util
      drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
      drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
      drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
      drm/msm/dpu: add cdm blocks to RM
      drm/msm/dpu: add support to allocate CDM from RM
      drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
      drm/msm/dpu: add an API to setup the CDM block for writeback
      drm/msm/dpu: plug-in the cdm related bits to writeback setup
      drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
      drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
      drm/msm/dpu: add cdm blocks to dpu snapshot

Abhinav Singh (2):
      drm/radeon: Fix warning using plain integer as NULL
      drm/nouveau/fence:: fix warning directly dereferencing a rcu pointer

Ajit Pal Singh (1):
      accel/qaic: Add support for periodic timesync

Alan Previn (2):
      drm/i915/pxp: Add drm_dbgs for critical PXP events.
      drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN

Alex Bee (2):
      dt-bindings: gpu: mali-utgard: Add Rockchip RK3128 compatible
      drm/imagination: vm: Fix heap lookup condition

Alex Deucher (13):
      drm/amdgpu: add pm metrics structure definition
      drm/amdgpu: fix AGP addressing when GART is not at 0
      drm/amdgpu: add amdgpu_reg_state.h
      drm/amd/display: Increase frame warning limit with KASAN or KCSAN in =
dml
      drm/amdgpu: fix buffer funcs setting order on suspend
      drm/amdgpu: fix buffer funcs setting order on suspend harder
      Merge tag 'platform-drivers-x86-amd-wbrf-v6.8-1' into amd-drm-next
      drm/amdgpu/sdma5.2: add begin/end_use ring callbacks
      drm/amdgpu/debugfs: fix error code when smc register accessors are NU=
LL
      drm/amd/display: fix documentation for amdgpu_dm_verify_lut3d_size()
      drm/amd/display: add nv12 bounding box
      drm/amdgpu: skip gpu_info fw loading on navi12
      drm/amdgpu: apply the RV2 system aperture fix to RN/CZN as well

Alex Hung (12):
      drm/amd/display: Avoid virtual stream encoder if not explicitly reque=
sted
      drm/amd/display: Initialize writeback connector
      drm/amd/display: Check writeback connectors in
create_validate_stream_for_sink
      drm/amd/display: Hande writeback request from userspace
      drm/amd/display: Add writeback enable/disable in dc
      drm/amd/display: Fix writeback_info never got updated
      drm/amd/display: Validate hw_points_num before using it
      drm/amd/display: Fix writeback_info is not removed
      drm/amd/display: Add writeback enable field (wb_enabled)
      drm/amd/display: Setup for mmhubbub3_warmup_mcif with big buffer
      drm/amd/display: Add new set_fc_enable to struct dwbc_funcs
      drm/amd/display: Disable DWB frame capture to emulate oneshot

Alex Sierra (1):
      drm/amdgpu: Force order between a read and write to the same address

Alexander Usyskin (1):
      drm/xe/gsc: enable pvc support

Allen (1):
      drm/amd/display: Disable OPTC pg to match DC Hubp/dpp pg

Allen Pan (2):
      drm/amd/display: fix usb-c connector_type
      drm/amd/display: change static screen wait frame_count for ips

Alvin Lee (15):
      drm/amd/display: Include udelay when waiting for INBOX0 ACK
      drm/amd/display: Use DRAM speed from validation for dummy p-state
      drm/amd/display: Increase num voltage states to 40
      drm/amd/display: Enable SubVP on 1080p60 displays
      drm/amd/display: If P-State is supported try SubVP for smaller vlevel
      drm/amd/display: Optimize fast validation cases
      drm/amd/display: Use channel_width =3D 2 for vram table 3.0
      drm/amd/display: For prefetch mode > 0, extend prefetch if possible
      drm/amd/display: Force p-state disallow if leaving no plane config
      drm/amd/display: Revert " drm/amd/display: Use channel_width =3D 2
for vram table 3.0"
      drm/amd/display: Only clear symclk otg flag for HDMI
      drm/amd/display: Fix subvp+drr logic errors
      drm/amd/display: Don't allow FPO if no planes
      drm/amd/display: Assign stream status for FPO + Vactive cases
      drm/amd/display: For FPO and SubVP/DRR configs program vmin/max sel

Andi Shyti (1):
      drm/i915/guc: Create the guc_to_i915() wrapper

Andrew Davis (1):
      drm/omapdrm: Improve check for contiguous buffers

Andrzej Hajda (10):
      drm/i915: Reserve some kernel space per vm
      drm/i915: Add WABB blit for Wa_16018031267 / Wa_16018063123
      drm/i915/gt: add selftest to exercise WABB
      drm/i915/gt: add missing new-line to GT_TRACE
      drm/i915: do not clean GT table on error path
      drm/i915: Replace custom intel runtime_pm tracker with ref_tracker li=
brary
      drm/i915: Track gt pm wakerefs
      drm/i915/selftests: wait for active idle event in i915_active_unlock_=
wait
      drm/i915/display: do not use cursor size reduction on MTL
      drm/xe: implement driver initiated function-reset

Andrzej Kacprowski (4):
      accel/ivpu: Add support for VPU_JOB_FLAGS_NULL_SUBMISSION_MASK
      accel/ivpu/40xx: Capture D0i3 entry host and device timestamps
      accel/ivpu: Pass D0i3 residency time to the VPU firmware
      accel/ivpu: Add support for delayed D0i3 entry message

Andr=C3=A9 Almeida (2):
      drm: Refuse to async flip with atomic prop changes
      drm/amd: Document device reset methods

Andy Shevchenko (10):
      drm/i915/dsi: Replace while(1) with one with clear exit condition
      drm/i915/dsi: Get rid of redundant 'else'
      drm/i915/dsi: Replace check with a (missing) MIPI sequence name
      drm/i915/dsi: Extract common soc_gpio_set_value() helper
      drm/i915/dsi: Replace poking of VLV GPIOs behind the driver's back
      drm/i915/dsi: Prepare soc_gpio_set_value() to distinguish GPIO commun=
ities
      drm/i915/dsi: Replace poking of CHV GPIOs behind the driver's back
      drm/i915/dsi: Combine checks in mipi_exec_gpio()
      drm/i915/iosf: Drop unused APIs
      drm/i915/display: Don't use "proxy" headers

Andy Yan (14):
      drm/rockchip: move output interface related definition to
rockchip_drm_drv.h
      Revert "drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume=
"
      drm/rockchip: vop2: set half_block_en bit in all mode
      drm/rockchip: vop2: clear afbc en and transform bit for cluster
window at linear mode
      drm/rockchip: vop2: Add write mask for VP config done
      drm/rockchip: vop2: Set YUV/RGB overlay mode
      drm/rockchip: vop2: set bg dly and prescan dly at vop2_post_config
      drm/rockchip: vop2: rename grf to sys_grf
      dt-bindings: display: vop2: Add rk3588 support
      dt-bindings: rockchip,vop2: Add more endpoint definition
      drm/rockchip: vop2: Add support for rk3588
      drm/rockchip: vop2: rename VOP_FEATURE_OUTPUT_10BIT to
VOP2_VP_FEATURE_OUTPUT_10BIT
      MAINTAINERS: Add myself as a reviewer for rockchip drm
      drm/rockchip: vop2: Avoid use regmap_reinit_cache at runtime

AngeloGioacchino Del Regno (10):
      drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()
      drm/panfrost: Perform hard reset to recover GPU if soft reset fails
      drm/panfrost: Tighten polling for soft reset and power on
      drm/panfrost: Implement ability to turn on/off GPU clocks in suspend
      drm/panfrost: Set clocks on/off during system sleep on MediaTek SoCs
      drm/panfrost: Implement ability to turn on/off regulators in suspend
      drm/panfrost: Set regulators on/off during system sleep on MediaTek S=
oCs
      drm/panfrost: Ignore core_mask for poweroff and disable PWRTRANS irq
      drm/panfrost: Add gpu_irq, mmu_irq to struct panfrost_device
      drm/panfrost: Synchronize and disable interrupts before powering off

Animesh Manna (7):
      drm/panelreplay: dpcd register definition for panelreplay
      drm/i915/panelreplay: Initializaton and compute config for panel repl=
ay
      drm/i915/panelreplay: Enable panel replay dpcd initialization for DP
      drm/i915/panelreplay: enable/disable panel replay
      drm/i915/panelreplay: Debugfs support for panel replay
      drm/i915/dsb: DSB code refactoring
      drm/xe/dsb: DSB implementation for xe

Ankit Nautiyal (6):
      drm/display/dp: Add helper function to get DSC bpp precision
      drm/i915/display: Store compressed bpp in U6.4 format
      drm/i915/display: Consider fractional vdsc bpp while computing m_n va=
lues
      drm/i915/audio: Consider fractional vdsc bpp while computing tu_data
      drm/i915/dp: Iterate over output bpp with fractional step size
      drm/i915/display: Get bigjoiner config before dsc config during reado=
ut

Anshuman Gupta (7):
      drm/xe/pm: Disable PM on unbounded pcie parent bridge
      drm/xe/pm: Add pci d3cold_capable support
      drm/xe/pm: Refactor xe_pm_runtime_init
      drm/xe/pm: Add vram_d3cold_threshold Sysfs
      drm/xe/pm: Toggle d3cold_allowed using vram_usages
      drm/xe/pm: Init pcode and restore vram on power lost
      drm/xe/pm: Add vram_d3cold_threshold for d3cold capable device

Anthony Koo (4):
      drm/amd/display: Add new command to disable replay timing resync
      drm/amd/display: [FW Promotion] Release 0.0.193.0
      drm/amd/display: [FW Promotion] Release 0.0.194.0
      drm/amd/display: [FW Promotion] Release 0.0.197.0

Anusha Srivatsa (10):
      drm/xe/huc: Support for loading unversiond HuC
      drm/xe: Load HuC on Alderlake S
      drm/xe: GuC and HuC loading support for RKL
      drm/xe: Add Rocketlake device info
      drm/xe/kunit: Handle fake device creation for all
platform/subplatform cases
      drm/xe: Add missing ADL entries to xe_test_wa
      drm/xe/rplu: s/ADLP/ALDERLAKE_P
      drm/xe/rpls: Add RPLS Support
      drm/xe/rpls: Add Stepping info for RPLS
      drm/xe: Add missing ADL entries to xe_test_wa

Aradhya Bhatia (2):
      dt-bindings: display: ti: Add support for am62a7 dss
      drm/tidss: Add support for AM62A7 DSS

Aravind Iddamsetty (5):
      drm/xe: Get GT clock to nanosecs
      drm/xe: Use spinlock in forcewake instead of mutex
      drm/xe/pmu: Enable PMU interface
      drm/xe/pmu: Drop interrupt pmu event
      drm/xe: Fix lockdep warning in xe_force_wake calls

Aric Cyr (7):
      drm/amd/display: Promote DC to 3.2.260
      drm/amd/display: 3.2.261
      drm/amd/display: Promote DAL to 3.2.262
      drm/amd/display: 3.2.263
      drm/amd/display: 3.2.264
      drm/amd/display: Unify optimize_required flags and VRR adjustments
      drm/amd/display: 3.2.265

Ariel Suller (1):
      accel/habanalabs: report 3 instances of Infineon second stage

Arnd Bergmann (6):
      drm/i915/mtl: avoid stringop-overflow warning
      accel/ivpu: avoid build failure with CONFIG_PM=3Dn
      drm/rockchip: rk3066_hdmi: include drm/drm_atomic.h
      drm/msm/a6xx: add QMP dependency
      drm/imagination: move update_logtype() into ifdef section
      drm/amd/display: avoid stringop-overflow warnings for
dp_decide_lane_settings()

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Implement a new 64bit sequence memory driver

Asad Kamal (5):
      drm/amd/pm: Use separate metric table for APU
      drm/amd/pm: Update metric table for jpeg/vcn data
      drm/amd/pm: Add gpu_metrics_v1_5
      drm/amd/pm: Use gpu_metrics_v1_5 for SMUv13.0.6
      drm/amd/pm: Add mem_busy_percent for GCv9.4.3 apu

Ashutosh Dixit (2):
      drm/xe/uapi: Use common drm_xe_ext_set_property extension
      drm/xe/pmu: Remove PMU from Xe till uapi is finalized

Aurabindo Pillai (4):
      drm/amd/display: Fix a debugfs null pointer error
      drm/amd: Add a DC debug mask for DML2
      drm/amd/display: Use explicit size for types in DCCG's struct
dp_dto_params
      drm/amd/display: trivial comment change

Badal Nilawar (11):
      drm/xe: Donot apply forcewake while reading actual frequency
      drm/xe/mtl: Add support to get C6 residency/status of MTL
      drm/xe/hwmon: Expose power attributes
      drm/xe/hwmon: Expose card reactive critical power
      drm/xe/hwmon: Expose input voltage attribute
      drm/xe/hwmon: Expose hwmon energy attribute
      drm/xe: Extend rpX values extraction for future platforms
      drm/xe/hwmon: Add kernel doc and refactor xe hwmon
      drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock
      drm/xe/hwmon: Expose power1_max_interval
      drm/xe/mtl: Use 16.67 Mhz freq scale factor to get rpX

Balasubramani Vivekanandan (10):
      drm/i915/display: Fix IP version of the WAs
      drm/xe/gt: Enable interrupt while initializing root gt
      drm/xe: Use max wopcm size when validating the preset GuC wopcm size
      drm/xe: Stop accepting value in xe_migrate_clear
      drm/xe: Keep all resize bar related prints inside xe_resize_vram_bar
      drm/xe/xe2: Add MOCS table
      drm/xe/lnl: Hook up MOCS table
      drm/xe: Leverage ComputeCS read L3 caching
      drm/xe: Add event tracing for CTB
      drm/xe/trace: Optimize trace definition

Bert Karwatzki (1):
      drm/sched: Partial revert of "Qualify drm_sched_wakeup() by
drm_sched_entity_is_ready()"

Bhuvana Chandra Pinninti (1):
      drm/amd/display: Refactor DSC into component folder

Bjorn Andersson (2):
      drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
      drm/msm/adreno: Fix A680 chip id

Bokun Zhang (2):
      drm/amd/amdgpu: Move vcn4 fw_shared init to a single function
      drm/amd/amdgpu: SRIOV full reset issue with VCN

Bommithi Sakeena (3):
      drm/xe: Ensure mutex are destroyed
      drm/xe: Add a missing mutex_destroy to xe_ttm_vram_mgr
      drm/xe: Encapsulate all the module parameters

Bommu Krishnaiah (2):
      drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence struc=
ture
      drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl

Boris Brezillon (1):
      drm/gpuvm: Let drm_gpuvm_bo_put() report when the vm_bo object
is destroyed

Brian Welty (12):
      drm/xe: Fix BUG_ON during bind with prefetch
      drm/xe: Fix lockdep warning from xe_vm_madvise
      drm/xe: Simplify xe_res_get_buddy()
      drm/xe: Replace xe_ttm_vram_mgr.tile with xe_mem_region
      drm/xe: Remove unused xe_bo_to_tile
      drm/xe: Replace usage of mem_type_to_tile
      drm/xe: Fix dequeue of access counter work item
      drm/xe: Fix pagefault and access counter worker functions
      drm/xe: Fix unbind of unaccessed VMA (fault mode)
      drm/xe: Make xe_mmio_tile_vram_size() static
      drm/xe: Support device page faults on integrated platforms
      drm/xe/xe2: Respond to TRTT faults as unsuccessful page fault

Camille Cho (2):
      drm/amd/display: Simplify brightness initialization
      drm/amd/display: Correctly restore user_level

Candice Li (1):
      drm/amdgpu: Update EEPROM I2C address for smu v13_0_0

Carl Vanderlip (4):
      accel/qaic: Enable 1 MSI fallback mode
      accel/qaic: Quiet array bounds check on DMA abort message
      accel/qaic: Increase number of in_reset states
      accel/qaic: Expand DRM device lifecycle

Carlos Santa (2):
      drm/xe: Update the list of devices to add even more TGL devices
      drm/xe: stringify the argument to avoid potential vulnerability

Chaitanya Kumar Borah (1):
      drm/i915/mtl: Support HBR3 rate with C10 phy and eDP in MTL

Chang, Bruce (2):
      drm/xe: don't auto fall back to execlist mode if guc failed to init
      drm/xe: fix pvc unload issue

Charlene Liu (7):
      drm/amd/display: initialize all the dpm level's stutter latency
      drm/amd/display: insert drv-pmfw log + rollback to new context
      drm/amd/display: revert removing otg toggle w/a back when no
active display
      drm/amd/display: keep domain24 power on if eDP not exist
      drm/amd/display: fix HW block PG sequence
      drm/amd/display: get dprefclk ss info from integration info table
      drm/amd/display: Allow z8/z10 from driver

Chris Morgan (17):
      dt-bindings: display: nv3051d: Update NewVision NV3051D compatibles
      drm/panel: nv3051d: Hold panel in reset for unprepare
      drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
      drm/panel-elida-kd35t133: trival: update panel size from 5.5 to 3.5
      drm/panel-elida-kd35t133: hold panel in reset for unprepare
      drm/panel-elida-kd35t133: drop drm_connector_set_orientation_from_pan=
el
      drm/panel-elida-kd35t133: Drop shutdown logic
      drm/panel-elida-kd35t133: Drop prepare/unprepare logic
      drm/panel: himax-hx8394: Drop prepare/unprepare tracking
      drm/panel: himax-hx8394: Drop shutdown logic
      dt-bindings: display: Document Himax HX8394 panel rotation
      drm/panel: himax-hx8394: Add Panel Rotation Support
      dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
      drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
      drm/panel: st7701: Fix AVCL calculation
      dt-bindings: display: st7701: Add Anbernic RG-ARC panel
      drm/panel: st7701: Add Anbernic RG-ARC Panel Support

Chris Park (1):
      drm/amd/display: Update BIOS FW info table revision

Christian K=C3=B6nig (3):
      dma-buf: add dma_fence_timestamp helper
      drm/amdgpu: fix tear down order in amdgpu_vm_pt_free
      drm/amdgpu: warn when there are still mappings when a BO is destroyed=
 v2

Christopher Snowhill (3):
      drm/xe: Enable the compat ioctl functionality
      drm/xe: Add explicit padding to uAPI definition
      drm/xe: Validate uAPI padding and reserved fields

Clint Taylor (1):
      drm/i915/dgfx: DGFX uses direct VBT pin mapping

Colin Ian King (4):
      drm/imagination: Fix a couple of spelling mistakes in literal strings
      drm/i915/selftests: Fix spelling mistake "initialiased" -> "initialis=
ed"
      drm/amd/display: Fix spelling mistake "SMC_MSG_AllowZstatesEntr"
-> "SMC_MSG_AllowZstatesEntry"
      drm/amd/display: remove redundant initialization of variable remainde=
r

Connor Abbott (2):
      drm/msm: Refactor UBWC config setting
      drm/msm: Add param for the highest bank bit

Dafna Hirschfeld (1):
      accel/habanalabs/gaudi2: fix undef opcode reporting

Dan Carpenter (7):
      drm/imagination: Fix error codes in pvr_device_clk_init()
      drm/imagination: Fix IS_ERR() vs NULL bug in pvr_request_firmware()
      drm/imagination: fix off by one in pvr_vm_mips_init() error handling
      drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
      drm/bridge: nxp-ptn3460: simplify some error checking
      drm/msm/dp: Fix platform_get_irq() check
      drm/imagination: Move dereference after NULL check in
pvr_mmu_backing_page_init()

Dani Liberman (5):
      accel/habanalabs: print error code when mapping fails
      accel/habanalabs: expose module id through sysfs
      drm/xe: proper setting of irq enabled flag
      drm/xe: change old msi irq api to a new one
      drm/xe: add msix support

Daniel Miess (2):
      drm/amd/display: Enable DCN clock gating for DCN35
      drm/amd/display: Add missing dcn35 RCO registers

Daniel Vetter (4):
      Merge tag 'drm-misc-next-2023-11-17' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-misc-next-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-intel-next-2023-11-23' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge v6.7-rc3 into drm-next

Daniele Ceraolo Spurio (38):
      drm/i915/huc: Stop printing about unsupported HuC on MTL
      drm/xe: limit GGTT size to GUC_GGTT_TOP
      drm/xe: fix HuC FW ordering for DG1
      drm/xe/slpc: Start SLPC before GuC submission on reset
      drm/xe: fix mcr semaphore locking for MTL
      drm/xe: common function to assign queue name
      drm/xe: base definitions for the GSCCS
      drm/xe: add GSCCS irq support
      drm/xe: add GSCCS ring ops
      drm/xe: GSC forcewake support
      drm/xe: don't expose the GSCCS to users
      drm/xe: enable idle msg and set hysteresis for GSCCS
      drm/xe: fix submissions without vm
      drm/xe: split kernel vs permanent engine flags
      drm/xe: standardize vm-less kernel submissions
      drm/xe/guc: Switch to major-only GuC FW tracking for MTL
      drm/xe/uc: Rename guc_submission_enabled() to uc_enabled()
      drm/xe/uc: Fix uC status tracking
      drm/xe/uc: Add GuC/HuC firmware path overrides
      drm/xe: Add child contexts to the GuC context lookup
      drm/xe/guc: Bump PVC GuC version to 70.9.1
      drm/xe/uc: Prepare for parsing of different header types
      drm/xe/huc: Extract version and binary offset from new HuC headers
      drm/xe/huc: HuC is not supported on GTs that don't have video engines
      drm/xe/huc: Don't re-auth HuC if it's already authenticated
      drm/xe/huc: Define HuC for MTL
      drm/xe/uc: Rework uC version tracking
      drm/xe/gsc: Introduce GSC FW
      drm/xe/gsc: Parse GSC FW header
      drm/xe/gsc: GSC FW load
      drm/xe/gsc: Implement WA 14015076503
      drm/xe/gsc: Trigger a driver flr to cleanup the GSC on unload
      drm/xe/gsc: Query GSC compatibility version
      drm/xe/gsc: Define GSCCS for MTL
      drm/xe/gsc: Define GSC FW for MTL
      drm/xe/huc: Prepare for 2-step HuC authentication
      drm/xe/huc: HuC authentication via GSC
      drm/xe: Remove ci-only GuC FW definitions

Danilo Krummrich (20):
      drm/sched: implement dynamic job-flow control
      drm/gpuvm: convert WARN() to drm_WARN() variants
      drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
      drm/gpuvm: export drm_gpuvm_range_valid()
      drm/nouveau: make use of drm_gpuvm_range_valid()
      drm/gpuvm: add common dma-resv per struct drm_gpuvm
      drm/nouveau: make use of the GPUVM's shared dma-resv
      drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
      drm/nouveau: separately allocate struct nouveau_uvmm
      drm/gpuvm: reference count drm_gpuvm structures
      drm/gpuvm: add an abstraction for a VM / BO combination
      drm/gpuvm: track/lock/validate external/evicted objects
      drm/nouveau: use GPUVM common infrastructure
      drm/nouveau: implement 1:1 scheduler - entity relationship
      drm/nouveau: enable dynamic job-flow control
      drm/imagination: vm: prevent duplicate drm_gpuvm_bo instances
      drm/imagination: vm: check for drm_gpuvm_range_valid()
      drm/imagination: vm: fix drm_gpuvm reference count
      drm/gpuvm: fall back to drm_exec_lock_obj()
      drm/imagination: vm: make use of GPUVM's drm_exec helper

Danylo Piliaiev (2):
      drm/msm/a6xx: Add missing BIT(7) to REG_A6XX_UCHE_CLIENT_PF
      drm/msm/a690: Fix reg values for a690

Dario Binacchi (4):
      drm/panel: nt35510: fix typo
      drm/bridge: Fix typo in post_disable() description
      drm/panel: synaptics-r63353: adjust the includes
      drm/panel: ilitek-ili9805: adjust the includes

Dave Airlie (19):
      Merge tag 'amd-drm-next-6.8-2023-12-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-2023-12-07' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-2023-12-07' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Backmerge tag 'v6.7-rc5' into drm-next
      Merge tag 'exynos-drm-next-for-v6.8' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
drm-next
      Merge tag 'drm-intel-gt-next-2023-12-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-next-6.8-2023-12-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2023-12-14' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.8-2023-12-15' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-msm-next-2023-12-15' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'mediatek-drm-next-6.8' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-intel-next-2023-12-18' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-xe-next-2023-12-21-pr1-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2023-12-21' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'drm-habanalabs-next-2023-12-19' of
https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux into
drm-next
      Merge tag 'drm-xe-next-fixes-2023-12-26' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2024-01-04' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
      Merge tag 'amd-drm-next-6.8-2024-01-05' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-gt-next-2023-12-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next

David Kershner (2):
      drm/xe/xe_migrate.c: Use DPA offset for page table entries.
      drm/xe/tests/xe_migrate.c: Add vram to vram KUNIT test

David Yat Sin (1):
      drm/amdkfd: Copy HW exception data to user event

Dennis Chan (3):
      drm/amd/display: Add new Replay command and Disabled Replay Timing Re=
sync
      drm/amd/display: Disable Timing sync check in Full-Screen Video Case
      drm/amd/display: Fix Replay Desync Error IRQ handler

Dillon Varone (6):
      drm/amd/display: Add dml2 copy functions
      drm/amd/display: Refactor dc_state interface
      drm/amd/display: Refactor phantom resource allocation
      drm/amd/display: Fix null reference to state when getting subvp type
      drm/amd/display: Create dc_state after resource initialization
      drm/amd/display: Deep copy dml2_context when copying dc_state

Dinghao Liu (1):
      drm/amd/pm: fix a memleak in aldebaran_tables_init

Dmitrii Galantsev (1):
      drm/amd/pm: fix pp_*clk_od typo

Dmitry Baryshkov (71):
      drm/msm: don't create GPU-related debugfs files with no GPU present
      drm/msm/dpu: enable SmartDMA on SM8450
      drm/msm/dp: cleanup debugfs handling
      drm/msm/mdp5: use devres-managed allocation for configuration data
      drm/msm/mdp5: use devres-managed allocation for CTL manager data
      drm/msm/mdp5: use devres-managed allocation for mixer data
      drm/msm/mdp5: use devres-managed allocation for pipe data
      drm/msm/mdp5: use devres-managed allocation for SMP data
      drm/msm/mdp5: use devres-managed allocation for INTF data
      drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
      drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
      drm/msm/mdp4: use bulk regulators API for LCDC encoder
      drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
      drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
      drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
      drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
      drm/msm/mdp4: flush vblank event on disable
      drm/drv: propagate errors from drm_modeset_register_all()
      drm/bridge: add transparent bridge helper
      phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
      usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
      drm/bridge: implement generic DP HPD bridge
      soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
      usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
      drm/encoder: register per-encoder debugfs dir
      drm/bridge: migrate bridge_chains to per-encoder file
      Revert "drm/atomic: Loosen FB atomic checks"
      Revert "drm/atomic: Move framebuffer checks to helper"
      Revert "drm/atomic: Add solid fill data to plane state dump"
      Revert "drm/atomic: Add pixel source to plane state dump"
      Revert "drm: Add solid fill pixel source"
      Revert "drm: Introduce solid fill DRM plane property"
      Revert "drm: Introduce pixel_source DRM plane property"
      drm/msm/dpu: populate SSPP scaler block version
      drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
      drm/msm/dpu: drop the `smart_dma_priority' field from struct
dpu_sspp_sub_blks
      drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
      drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
      drm/msm/dpu: rewrite scaler and CSC presense checks
      drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
      drm/msm/gpu: drop duplicating VIG feature masks
      drm/msm/mdss: switch mdss to use devm_of_icc_get()
      drm/msm/mdss: inline msm_mdss_icc_request_bw()
      drm/msm/mdss: Handle the reg bus ICC path
      drm/atomic: add private obj state to state dump
      drm/msm/dpu: cleanup dpu_kms_hw_init error path
      drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error handl=
ing
      drm/msm/dpu: use devres-managed allocation for interrupts data
      drm/msm/dpu: use devres-managed allocation for VBIF data
      drm/msm/dpu: use devres-managed allocation for MDP TOP
      drm/msm/dpu: use devres-managed allocation for HW blocks
      drm/msm/dpu: drop unused dpu_plane::lock
      drm/msm/dpu: remove QoS teardown on plane destruction
      drm/msm/dpu: use drmm-managed allocation for dpu_plane
      drm/msm/dpu: use drmm-managed allocation for dpu_crtc
      drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
      drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
      drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt
      drm/msm/dpu: correct clk bit for WB2 block
      drm/msm/dpu: drop MSM_ENC_VBLANK support
      drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
      drm/vkms: move wb's atomic_check from encoder to connector
      drm/ci: remove rebase-merge directory
      drm/msm/dpu: move encoder status to standard encoder debugfs dir
      drm/msm/dpu: enable writeback on SM8350
      drm/msm/dpu: enable writeback on SM8450
      dt-bindings: display: msm: dp: declare compatible string for sm8150
      drm/msm/dpu: remove extra drm_encoder_cleanup from the error path
      drm/msm/dpu: move CSC tables to dpu_hw_util.c
      drm/msm/dp: call dp_display_get_next_bridge() during probe
      drm/bridge: properly refcount DT nodes in aux bridge drivers

Dmitry Osipenko (1):
      drm/virtio: Fix return value for VIRTGPU_CONTEXT_PARAM_DEBUG_NAME

Dmytro Laktyushkin (2):
      drm/amd/display: update dcn315 lpddr pstate latency
      drm/amd/display: block dcn315 dynamic crb allocation when unintended

Dnyaneshwar Bhadane (3):
      drm/i915/mtl: Add Wa_22016670082
      drm/i915/mtl: Add Wa_14019821291
      drm/xe/xe2: Add initial workarounds

Donald Robson (13):
      drm/gpuvm: Helper to get range of unmap from a remap op.
      drm/imagination: Add GEM and VM related code
      drm/imagination: Numerous documentation fixes.
      drm/imagination: Fixed warning due to implicit cast to bool
      drm/imagination: Fixed missing header in pvr_fw_meta
      drm/imagination: pvr_device_process_active_queues now static
      drm/imagination: pvr_gpuvm_free() now static
      drm/imagination: Removed unused function to_pvr_vm_gpuva()
      drm/imagination: Removed unused functions in pvr_fw_trace
      drm/imagination: Fixed infinite loop in pvr_vm_mips_map()
      drm/imagination: Fixed oops when misusing ioctl CREATE_HWRT_DATASET
      drm/imagination: Fix ERR_PTR test on pointer to pointer.
      drm/imagination: Fix error path in pvr_vm_create_context

Dorcas AnonoLitunya (1):
      drm/i915/gt: Remove prohibited space after opening parenthesis

Douglas Anderson (1):
      drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time

Duncan Ma (1):
      drm/amd/display: Add disable timeout option

Elmar Albert (2):
      dt-bindings: display: simple: Add AUO G156HAN04.0 LVDS display
      drm/panel: simple: Add AUO G156HAN04.0 LVDS display support

Emma Anholt (1):
      MAINTAINERS: Drop Emma Anholt from all M lines.

Evan Quan (4):
      drm/amd/pm: update driver_if and ppsmc headers for coming wbrf featur=
e
      drm/amd/pm: setup the framework to support Wifi RFI mitigation featur=
e
      drm/amd/pm: add flood detection for wbrf events
      drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7

Fangzhi Zuo (2):
      drm/amd/display: Enable DSC Flag in MST Mode Validation
      drm/amd/display: Populate dtbclk from bounding box

Farah Kassabri (3):
      accel/habanalabs: update device boot error check
      accel/habanalabs: add log when eq event is not received
      accel/habanalabs: fix EQ heartbeat mechanism

Fei Yang (3):
      drm/xe: set PTE_AE for all platforms supporting it
      drm/xe: timeout needs to be a signed value
      drm/xe: explicitly set GGTT access for GuC DMA

Felix Kuehling (6):
      drm/amdgpu: update mappings not managed by KFD
      drm/amdkfd: Move TLB flushing logic into amdgpu
      drm/amdkfd: Run restore_workers on freezable WQs
      drm/amdkfd: Export DMABufs from KFD using GEM handles
      drm/amdkfd: Import DMABufs for interop through DRM
      drm/amdgpu: Let KFD sync with VM fences

Francois Dugast (57):
      drm/xe: Use global macros to set PM functions
      drm/xe: Fix build without CONFIG_PM_SLEEP
      drm/xe: Fix splat during error dump
      drm/xe: Remove unused define
      drm/xe: Use SPDX-License-Identifier instead of license text
      drm/xe: Group engine related structs
      drm/xe: Fix some formatting issues in uAPI
      drm/xe: Document structures for device query
      drm/xe: Move defines before relevant fields
      drm/xe: Document topology mask query
      drm/xe: Cleanup SPACING style issues
      drm/xe: Cleanup OPEN_BRACE style issues
      drm/xe: Cleanup POINTER_LOCATION style issues
      drm/xe: Cleanup CODE_INDENT style issues
      drm/xe: Cleanup TRAILING_WHITESPACE style issues
      drm/xe: Cleanup COMPLEX_MACRO style issues
      drm/xe: Fix typos
      drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR
      drm/xe: Cleanup style warnings
      drm/xe: Rely on kmalloc/kzalloc log message
      drm/xe/execlist: Remove leftover printk messages
      drm/xe: Cleanup style warnings and errors
      drm/xe/execlist: Log when using execlist submission
      drm/xe/macro: Remove unused constant
      drm/xe: Prefer WARN() over BUG() to avoid crashing the kernel
      drm/xe: Rename xe_engine.[ch] to xe_exec_queue.[ch]
      drm/xe: Rename engine to exec_queue
      drm/xe/pm: Use PM functions only if CONFIG_PM_SLEEP is enabled
      drm/xe: Replace XE_WARN_ON with drm_warn when just printing a string
      drm/xe: Use Xe assert macros instead of XE_WARN_ON macro
      drm/xe/uapi: Separate VM_BIND's operation and flag
      drm/xe/vm: Remove VM_BIND_OP macro
      drm/xe/uapi: Remove MMIO ioctl
      drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
      drm/xe/display: Use acpi_target_system_state only if ACPI_SLEEP is en=
abled
      drm/xe/uapi: Remove useless XE_QUERY_CONFIG_NUM_PARAM
      drm/xe/uapi: Remove unused inaccessible memory region
      drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
      drm/xe/uapi: Remove unused QUERY_CONFIG_GT_COUNT
      drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
      drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
      drm/xe/uapi: Change rsvd to pad in struct drm_xe_class_instance
      drm/xe/uapi: Align on a common way to return arrays (memory regions)
      drm/xe/uapi: Align on a common way to return arrays (gt)
      drm/xe/uapi: Align on a common way to return arrays (engines)
      drm/xe/uapi: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
      drm/xe/uapi: Remove DRM_XE_UFENCE_WAIT_MASK_*
      drm/xe/uapi: Add a comment to each struct
      drm/xe/uapi: Add missing documentation for struct members
      drm/xe/uapi: Document use of size in drm_xe_device_query
      drm/xe/uapi: Document drm_xe_query_config keys
      drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
      drm/xe/uapi: Make constant comments visible in kernel doc
      drm/xe/uapi: Add block diagram of a device
      drm/xe/uapi: Add examples of user space code
      drm/xe/uapi: Move CPU_CACHING defines before doc
      drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where they are used

Frank Binns (1):
      MAINTAINERS: Document Imagination PowerVR driver patches go via drm-m=
isc

Friedrich Vock (1):
      drm/amdgpu: Enable tunneling on high-priority compute queues

Gabe Teeger (2):
      Revert "drm/amd/display: Enable CM low mem power optimization"
      drm/amd/display: Fix Mismatch between pipe and stream

George Shen (2):
      drm/amd/display: Skip DPIA-specific DP LL automation flag for
non-DPIA links
      drm/amd/display: Set test_pattern_changed update flag on pipe enable

Gilbert Adikankwu (1):
      drm/i915/gt: Remove unncessary {} from if-else

Gurchetan Singh (2):
      drm/virtio: use uint64_t more in virtio_gpu_context_init_ioctl
      drm/uapi: add explicit virtgpu context debug name

Gustavo Sousa (16):
      drm/i915/xelpmp: Add Wa_16021867713
      drm/xe: Include only relevant header in xe_module.h
      drm/xe: Get rid of MAKE_INIT_EXIT_FUNCS
      drm/xe: Call exit functions when xe_register_pci_driver() fails
      drm/xe: Do not forget to drm_dev_put() in xe_pci_probe()
      drm/xe: Call drmm_add_action_or_reset() early in xe_device_create()
      drm/xe: Fail xe_device_create() if wq allocation fails
      drm/xe: Replace deprecated DRM_ERROR()
      drm/xe/reg_sr: Use a single parameter for xe_reg_sr_apply_whitelist()
      drm/xe/reg_sr: Apply limit to register whitelisting
      drm/xe: Simplify final return from xe_irq_install()
      drm/xe/irq: Clear GFX_MSTR_IRQ as part of IRQ reset
      drm/xe/rtp: Fix doc for XE_RTP_ACTIONS
      drm/xe/xelpmp: Add Wa_16021867713
      drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c
      drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts

Hamza Mahfooz (4):
      drm/amd/display: add a debugfs interface for the DMUB trace mask
      drm/amd/display: fix ABM disablement
      drm/amd/display: fix hw rotated modes when PSR-SU is enabled
      drm/amd/display: disable FPO and SubVP for older DMUB versions on DCN=
32x

Hans de Goede (3):
      drm/i915/dsi: Remove GPIO lookup table at the end of
intel_dsi_vbt_gpio_init()
      drm/i915/dsi: Fix wrong initial value for GPIOs in bxt_gpio_set_value=
()
      drm/i915/dsi: Use devm_gpiod_get() for all GPIOs

Haridhar Kalvala (8):
      drm/i915: ATS-M device ID update
      drm/i915: Add Wa_14019877138
      drm/xe: Adjust mocs field mask definitions
      drm/xe: Rename MEM_SET instruction
      drm/xe/xe2: Set tile y type in XY_FAST_COPY_BLT to Tile4
      drm/xe/xe2: Update MOCS fields in blitter instructions
      drm/xe: Add Wa_14019877138
      drm/xe: ATS-M device ID update

Harry Wentland (9):
      drm/amd/display: Skip entire amdgpu_dm build if !CONFIG_DRM_AMD_DC
      drm/amd/display: Create one virtual connector in DC
      drm/amd/display: Skip writeback connector when we get amdgpu_dm_conne=
ctor
      drm/amd/display: Return drm_connector from
find_first_crtc_matching_connector
      drm/amd/display: Use drm_connector in create_stream_for_sink
      drm/amd/display: Create amdgpu_dm_wb_connector
      drm/amd/display: Create fake sink and stream for writeback connector
      drm/amd/display: Fix recent checkpatch errors in amdgpu_dm
      drm/amd/display: Move fixpt_from_s3132 to amdgpu_dm

Harshit Mogalapalli (4):
      i915/perf: Fix NULL deref bugs with drm_dbg() calls
      drm/msm/dp: add a missing unlock in dp_hpd_plug_handle()
      drm/v3d: Fix missing error code in v3d_submit_cpu_ioctl()
      drm/amd/display: Fix memory leak in dm_set_writeback()

Hawking Zhang (5):
      drm/amdgpu: Retire query/reset_ras_err_status from gfx_v9_4_3
      drm/amdgpu: Do not issue gpu reset from nbio v7_9 bif interrupt
      drm/amdgpu: Update fw version for boot time error query
      drm/amdgpu: Switch to aca bank for xgmi pcs err cnt
      Revert "drm/amdgpu: enable mca debug mode on APU by default"

Himal Prasad Ghimiray (12):
      drm/xe: Notify Userspace when gt reset fails
      drm/xe: Introduce fault injection for gt reset
      drm/xe/xe2: Determine bios enablement for flat ccs on igfx
      drm/xe/xe2: Modify main memory to ccs memory ratio.
      drm/xe/xe2: Allocate extra pages for ccs during bo create
      drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
      drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
      drm/xe/xe2: Update chunk size for each iteration of ccs copy
      drm/xe/xe2: Update emit_pte to use compression enabled PAT index
      drm/xe/xe2: Handle flat ccs move for igfx.
      drm/xe/xe2: Modify xe_bo_test for system memory
      drm/xe/xe2: Support flat ccs

Hsiao Chien Sung (15):
      dt-bindings: display: mediatek: ethdr: Add compatible for MT8188
      dt-bindings: display: mediatek: mdp-rdma: Add compatible for MT8188
      dt-bindings: display: mediatek: merge: Add compatible for MT8188
      dt-bindings: display: mediatek: padding: Add MT8188
      drm/mediatek: Rename OVL_ADAPTOR_TYPE_RDMA
      drm/mediatek: Add component ID to component match structure
      drm/mediatek: Manage component's clock with function pointers
      drm/mediatek: Power on/off devices with function pointers
      drm/mediatek: Start/Stop components with function pointers
      drm/mediatek: Sort OVL adaptor components
      drm/mediatek: Refine device table of OVL adaptor
      drm/mediatek: Support MT8188 Padding in display driver
      drm/mediatek: Return error if MDP RDMA failed to enable the clock
      drm/mediatek: Remove the redundant driver data for DPI
      drm/mediatek: Fix underrun in VDO1 when switches off the layer

Hsin-Yi Wang (6):
      drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01 name and timing
      drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02 name
      drm/panel-edp: drm/panel-edp: Add several generic edp panels
      drm/panel-edp: Add override_edid_mode quirk for generic edp
      drm/panel-edp: Add auo_b116xa3_mode
      drm/panel-edp: Avoid adding multiple preferred modes

Iago Toral Quiroga (4):
      drm/v3d: update UAPI to match user-space for V3D 7.x
      drm/v3d: fix up register addresses for V3D 7.x
      dt-bindings: gpu: v3d: Add BCM2712's compatible
      drm/v3d: add brcm,2712-v3d as a compatible V3D device

Ian Chen (1):
      drm/amd/display: add skip_implict_edp_power_control flag for dce110

Ilya Bakoulin (4):
      drm/amd/display: Fix MPCC 1DLUT programming
      drm/amd/display: Add DSC granular throughput adjustment
      drm/amd/display: Fix MST PBN/X.Y value calculations
      drm/amd/display: Fix hang/underflow when transitioning to ODM4:1

Imre Deak (43):
      drm/i915/dp_mst: Disable DSC on ICL MST outputs
      drm/i915/dp_mst: Fix race between connector registration and setup
      drm/dp_mst: Add helper to determine if an MST port is downstream
of another port
      drm/dp_mst: Factor out a helper to check the atomic state of a
topology manager
      drm/dp_mst: Swap the order of checking root vs. non-root port BW
limitations
      drm/dp_mst: Allow DSC in any Synaptics last branch device
      drm/dp: Add DP_HBLANK_EXPANSION_CAPABLE and DSC_PASSTHROUGH_EN DPCD f=
lags
      drm/dp_mst: Add HBLANK expansion quirk for Synaptics MST hubs
      drm/dp: Add helpers to calculate the link BW overhead
      drm/i915/dp_mst: Enable FEC early once it's known DSC is needed
      drm/i915/dp: Specify the FEC overhead as an increment vs. a remainder
      drm/i915/dp: Pass actual BW overhead to m_n calculation
      drm/i915/dp_mst: Account for FEC and DSC overhead during BW allocatio=
n
      drm/i915/dp_mst: Add atomic state for all streams on pre-tgl platform=
s
      drm/i915/dp_mst: Program the DSC PPS SDP for each stream
      drm/i915/dp: Make sure the DSC PPS SDP is disabled whenever DSC
is disabled
      drm/i915/dp_mst: Add missing DSC compression disabling
      drm/i915/dp: Rename intel_ddi_disable_fec_state() to
intel_ddi_disable_fec()
      drm/i915/dp: Wait for FEC detected status in the sink
      drm/i915/dp: Disable FEC ready flag in the sink
      drm/i915/dp_mst: Handle the Synaptics HBlank expansion quirk
      drm/i915/dp_mst: Enable decompression in the sink from the MST
encoder hooks
      drm/i915/dp: Enable DSC via the connector decompression AUX
      drm/i915/dp_mst: Enable DSC passthrough
      drm/i915/dp_mst: Enable MST DSC decompression for all streams
      drm/i915: Factor out function to clear pipe update flags
      drm/i915/dp_mst: Force modeset CRTC if DSC toggling requires it
      drm/i915/dp_mst: Improve BW sharing between MST streams
      drm/i915/dp_mst: Check BW limitations only after all streams are comp=
uted
      drm/i915/dp: Tune down FEC detection timeout error message
      drm/i915: Fix fractional bpp handling in intel_link_bw_reduce_bpp()
      drm/dp_mst: Store the MST PBN divider value in fixed point format
      drm/dp_mst: Fix PBN divider calculation for UHBR rates
      drm/dp_mst: Add kunit tests for drm_dp_get_vc_payload_bw()
      drm/i915/dp: Replace intel_dp_is_uhbr_rate() with drm_dp_is_uhbr_rate=
()
      drm/i915/dp: Account for channel coding efficiency on UHBR links
      drm/i915/dp: Fix UHBR link M/N values
      drm/i915/dp_mst: Calculate the BW overhead in
intel_dp_mst_find_vcpi_slots_for_bpp()
      drm/i915/dp_mst: Fix PBN / MTP_TU size calculation for UHBR rates
      drm/i915/dp: Report a rounded-down value as the maximum data rate
      drm/i915/dp: Simplify intel_dp_max_data_rate()
      drm/i915/dp: Reuse intel_dp_{max,effective}_data_rate in
intel_link_compute_m_n()
      drm/i915/mtl: Fix HDMI/DP PLL clock selection

Inki Dae (1):
      Merge tag 'exynos-drm-next-for-v6.7-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into
exynos-drm-next

Ivan Lipski (2):
      drm/amd/display: Add monitor patch for specific eDP
      Re-revert "drm/amd/display: Enable Replay for static screen use cases=
"

Jacek Lawrynowicz (8):
      accel/ivpu: Simplify MMU SYNC command
      accel/ivpu: Rename VPU to NPU in product strings
      accel/ivpu: Fix compilation with CONFIG_PM=3Dn
      accel/ivpu: Allocate vpu_addr in gem->open() callback
      accel/ivpu: Fix locking in ivpu_bo_remove_all_bos_from_context()
      accel/ivpu: Remove support for uncached buffers
      accel/ivpu: Use GEM shmem helper for all buffers
      accel/ivpu: Use threaded IRQ to handle JOB done messages

Jack Xiao (1):
      drm/amdgpu/gfx11: need acquire mutex before access CP_VMID_RESET v2

James Zhu (2):
      drm/amdgpu: increase hmm range get pages timeout
      drm/amdgpu: make an improvement on amdgpu_hmm_range_get_pages

Janga Rahul Kumar (1):
      drm/Xe: Use EOPNOTSUPP instead of ENOTSUPP

Jani Nikula (48):
      drm/i915: drop gt/intel_gt.h include from skl_universal_plane.c
      drm/i915/aux: add separate register macros and functions for VLV/CHV
      drm/i915/aux: rename dev_priv to i915
      drm/i915: stop including i915_utils.h from intel_runtime_pm.h
      drm/i915/sprite: move sprite_name() to intel_sprite.c
      drm/i915: fix Makefile sort and indent
      drm/i915: move Makefile display debugfs files next to display
      drm/i915/pmu: add pmu_to_i915() helper
      drm/i915/pmu: add event_to_pmu() helper
      drm/i915/pmu: rearrange hrtimer pointer chasing
      drm/i915: make some error capture functions static
      drm/i915: move gpu error debugfs to i915_gpu_error.c
      drm/i915: move gpu error sysfs to i915_gpu_error.c
      drm/i915: move display mutex inits to display code
      drm/i915: move display spinlock init to display code
      drm/edid: split out drm_eld.h from drm_edid.h
      drm/eld: replace uint8_t with u8
      drm/edid: include drm_eld.h only where required
      drm/edid: use a temp variable for sads to drop one level of dereferen=
ces
      drm/edid: add helpers to get/set struct cea_sad from/to 3-byte sad
      drm/eld: add helpers to modify the SADs of an ELD
      drm/i915: abstract plane protection check
      drm/i915: remove excess functions from plane protection check
      MAINTAINERS: update drm/i915 W: and B: entries
      drm/i915: update in-source bug filing URLs
      drm/i915/display: keep struct intel_display members sorted
      drm/i915: move *_crtc_clock_get() to intel_dpll.c
      drm/i915: add vlv_pipe_to_phy() helper to replace DPIO_PHY()
      drm/i915: convert vlv_dpio_read()/write() from pipe to phy
      drm/edid/firmware: drop drm_kms_helper.edid_firmware backward compat
      drm/i915/dsi: assume BXT gpio works for non-native GPIO
      drm/i915/dsi: switch mipi_exec_gpio() from dev_priv to i915
      drm/i915/dsi: clarify GPIO exec sequence
      drm/i915/dsi: rename platform specific *_exec_gpio() to *_gpio_set_va=
lue()
      drm/i915/dsi: bxt/icl GPIO set value do not need gpio source
      drm/i915: use PIPE_CONF_CHECK_BOOL() for bool members
      drm/i915: add bool type checks in PIPE_CONF_CHECK_*
      drm/i915/syncmap: squelch a sparse warning
      drm/i915/rpm: add rpm_to_i915() helper around container_of()
      drm/i915: use intel_connector in intel_connector_debugfs_add()
      drm/i915: pass struct intel_connector to connector debugfs fops
      drm/i915: use octal permissions in display debugfs
      drm/i915/edp: don't write to DP_LINK_BW_SET when using rate select
      drm/radeon: include drm/drm_edid.h only where needed
      drm/amd: include drm/drm_edid.h only where needed
      drm/xe: make compound literal initialization const
      drm/xe/irq: the irq handler local variable need not be static
      drm/xe/mmio: add xe_mmio_read16()

Javier Martinez Canillas (7):
      dt-bindings: display: ssd132x: Remove '-' before compatible enum
      drm/ssd130x: Fix possible uninitialized usage of crtc_state variable
      drm: Allow drivers to indicate the damage helpers to ignore damage cl=
ips
      drm/virtio: Disable damage clipping if FB changed since last page-fli=
p
      drm/vmwgfx: Disable damage clipping if FB changed since last page-fli=
p
      drm/plane: Extend damage tracking kernel-doc
      drm/todo: Add entry about implementing buffer age for damage tracking

Jean Delvare (1):
      drm/loongson: Add platform dependency

Jeffrey Hugo (1):
      accel/qaic: Update MAX_ORDER use to be inclusive

Jessica Zhang (9):
      drm: Introduce pixel_source DRM plane property
      drm: Introduce solid fill DRM plane property
      drm: Add solid fill pixel source
      drm/atomic: Add pixel source to plane state dump
      drm/atomic: Add solid fill data to plane state dump
      drm/atomic: Move framebuffer checks to helper
      drm/atomic: Loosen FB atomic checks
      drm/msm/dpu: Set input_sel bit for INTF
      drm/msm/dpu: Drop enable and frame_count parameters from
dpu_hw_setup_misr()

Jiadong Zhu (1):
      drm/amdgpu: disable MCBP by default

Jiapeng Chong (1):
      drm/rockchip: vop2: clean up some inconsistent indenting

Johan Jonker (2):
      drm/rockchip: rk3066_hdmi: Remove useless mode_fixup
      drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic

John Harrison (2):
      drm/i915/guc: Fix for potential false positives in GuC hang selftest
      drm/i915/guc: Add a selftest for FAST_REQUEST errors

John Watts (7):
      drm/panel: nv3052c: Document known register names
      drm/panel: nv3052c: Add SPI device IDs
      drm/panel: nv3052c: Allow specifying registers per panel
      drm/panel: nv3052c: Add Fascontek FS035VG158 LCD display
      dt-bindings: display: panel: Clean up leadtek,ltk035c5444t properties
      dt-bindings: vendor-prefixes: Add fascontek
      dt-bindings: display: panel: add Fascontek FS035VG158 panel

Johnson Chen (2):
      drm/amd/display: Fix null pointer
      drm/amd/display: Add function for dumping clk registers

Jonas Karlman (1):
      drm/rockchip: vop2: Add NV20 and NV30 support

Jonathan Cavitt (3):
      drm/i915: Set copy engine arbitration for Wa_16018031267 / Wa_1601806=
3123
      drm/i915/gt: Temporarily disable CPU caching into DMA for MTL
      drm/xe: clear the serviced bits on INTR_IDENTITY_REG

Jonathan Kim (3):
      drm/amdgpu: update xgmi num links info post gc9.4.2
      drm/amdkfd: fix mes set shader debugger process management
      drm/amdkfd: only flush mes process context if mes support is there

Joshua Aberback (1):
      drm/amd/display: Remove minor revision 5 until proper parser is ready

Joshua Ashton (15):
      drm/amd/display: add plane degamma TF driver-specific property
      drm/amd/display: add plane HDR multiplier driver-specific property
      drm/amd/display: add plane blend LUT and TF driver-specific propertie=
s
      drm/amd/display: add CRTC gamma TF support
      drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
      drm/amd/display: mark plane as needing reset if color props change
      drm/amd/display: add plane degamma TF and LUT support
      drm/amd/display: add dc_fixpt_from_s3132 helper
      drm/amd/display: add HDR multiplier support
      drm/amd/display: handle empty LUTs in __set_input_tf
      drm/amd/display: add plane blend LUT and TF support
      drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HL=
G
      drm/amd/display: copy 3D LUT settings from crtc state to stream_updat=
e
      drm/amd/display: Add 3x4 CTM support for plane CTM
      drm/amd/display: Fix sending VSC (+ colorimetry) packets for
DP/eDP displays without PSR

Josip Pavic (4):
      drm/amd/display: Increase scratch buffer size
      drm/amd/display: make flip_timestamp_in_us a 64-bit variable
      drm/amd/display: dereference variable before checking for zero
      drm/amd/display: Add null pointer guards where needed

Jos=C3=A9 Roberto de Souza (17):
      drm/xe/uapi: Rename XE_ENGINE_PROPERTY_X to XE_ENGINE_SET_PROPERTY_X
      drm/xe/uapi: Add XE_ENGINE_GET_PROPERTY uAPI
      drm/xe: Initialize ret in mcr_lock()
      drm/xe: Fix size of xe_eu_mask_t
      drm/xe: Add max engine priority to xe query
      drm/xe: Limit the system memory size to half of the system memory
      drm/xe: Enable Raptorlake-P
      drm/xe: Set default MOCS value for cs instructions
      drm/xe: Set default MOCS value for copy cs instructions
      drm/xe: Replace PVC check by engine type check
      drm/xe: Fix RING_MI_MODE label in devcoredump
      drm/xe: Fix devcoredump readout of IPEHR
      drm/xe: Remove devcoredump readout of IPEIR
      drm/xe: Set PTE_AE for smem allocations in integrated devices
      drm/xe: Include RPL-U to pciidlist
      drm/xe: Add missing RPL and ADL
      drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof

Jouni H=C3=B6gander (48):
      drm/i915/display: Move releasing gem object away from fb tracking
      drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
      drm/i915/display: Add framework to add parameters specific to display
      drm/i915/display: Dump also display parameters
      drm/i915/display: Move enable_fbc module parameter under display
      drm/i915/display: Move psr related module parameters under display
      drm/i915/display: Move vbt_firmware module parameter under display
      drm/i915/display: Move lvds_channel_mode module parameter under displ=
ay
      drm/i915/display: Move panel_use_ssc module parameter under display
      drm/i915/display: Move vbt_sdvo_panel_type module parameter under dis=
play
      drm/i915/display: Move enable_dc module parameter under display
      drm/i915/display: Move enable_dpt module parameter under display
      drm/i915/display: Move enable_sagv module parameter under display
      drm/i915/display: Move disable_power_well module parameter under disp=
lay
      drm/i915/display: Move enable_ips module parameter under display
      drm/i915/display: Move invert_brightness module parameter under displ=
ay
      drm/i915/display: Move edp_vswing module parameter under display
      drm/i915/display: Move enable_dpcd_backlight module parameter
under display
      drm/i915/display: Move load_detect_test parameter under display
      drm/i915/display: Move force_reset_modeset_test parameter under displ=
ay
      drm/i915/display: Move disable_display parameter under display
      drm/i915/display: Use device parameters instead of module in
I915_STATE_WARN
      drm/i915/display: Move verbose_state_checks under display
      drm/i915/display: Move nuclear_pageflip under display
      drm/i915/display: Move enable_dp_mst under display
      drm/i915/display: Use dma_fence interfaces instead of i915_sw_fence
      drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
      drm/i915/psr: Move psr specific dpcd init into own function
      drm/i915/display: Do not check psr2 if psr/panel replay is not suppor=
ted
      drm/i915/psr: Move plane sel fetch configuration into plane source fi=
les
      drm/i915/psr: Add proper handling for disabling sel fetch for planes
      drm/i915/display: split i915 specific code from intel_fbdev
      drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev
      drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
      drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
      drm/i915/display: Handle invalid fb_modifier in
intel_fb_modifier_to_tiling
      drm/i915/display: Split i915 specific code away from intel_fb.c
      drm/i915/display: Add intel_fb_bo_framebuffer_fini
      drm/i915/display: Remove dead code around intel_atomic_helper->free_l=
ist
      drm/xe/display: Add struct i915_active for Xe
      drm/xe/display: Add macro to get i915 device from xe_bo
      drm/xe/display: Add frontbuffer setter/getter for xe_bo
      drm/xe/display: Add i915_active.h compatibility header
      drm/xe/display: Add empty def for i915_gem_object_flush_if_display
      drm/xe/display: Add empty define for i915_ggtt_clear_scanout
      drm/xe/display: Xe stolen memory handling for fbc support
      drm/xe/display: Add i915_gem.h compatibility header
      drm/xe/display: Add Xe implementation for fence checks used by fbc co=
de

Juha-Pekka Heikkila (5):
      drm/i915/display: Separate xe and i915 common dpt code into own file
      drm/i915/display: in skl_surf_address check for dpt-vma
      drm/i915/display: In intel_framebuffer_init switch to use
intel_bo_to_drm_bo
      drm/xe/display: Don't try to use vram if not available
      drm/xe/display: Add writing of remapped dpt

Kaibo Ma (1):
      Revert "drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole"

Karol Wachowski (5):
      accel/ivpu: Remove reset from power up sequence
      accel/ivpu: Change test_mode module param to bitmask
      accel/ivpu: Introduce ivpu_ipc_send_receive_active()
      accel/ivpu: Print CMDQ errors after consumer timeout
      accel/ivpu: Make DMA allocations for MMU600 write combined

Karthik Poosa (1):
      drm/i915/hwmon: Fix static analysis tool reported issues

Kees Cook (1):
      dma-buf: Replace strlcpy() with strscpy()

Kenneth Feng (1):
      drm/amd/pm: add power save mode workload for smu 13.0.10

Khaled Almahallawy (1):
      drm/display/dp: Add the remaining Square PHY patterns DPCD
register definitions

Koby Elbaz (10):
      drm/xe: add 28-bit address support in struct xe_reg
      drm/xe: add read/write support for MMIO extension space
      drm/xe: add a flag to bypass multi-tile config from MTCFG reg
      drm/xe: add MMIO extension support flags
      drm/xe: map MMIO BAR according to the num of tiles in device desc
      drm/xe: refactor xe_mmio_probe_tiles to support MMIO extension
      drm/xe: move the lmem verification code into a separate function
      drm/xe/display: fix error handling flow when device probing fails
      drm/xe: add skip_pcode flag
      drm/xe: rename bypass_mtcfg to skip_mtcfg

Konrad Dybcio (5):
      dt-bindings: display: msm: qcm2290-mdss: Use the non-deprecated DSI c=
ompat
      dt-bindings: display: msm: Add reg bus and rotator interconnects
      drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      drm/msm/dsi: Enable runtime PM
      drm/msm/mdss: Rename path references to mdp_path

Krunoslav Kovac (2):
      drm/amd/display: Send PQ bit in AMD VSIF
      drm/amd/display: Change dither policy for 10bpc to round

Krystian Pradzynski (2):
      accel/ivpu: Update FW API
      accel/ivpu/40xx: Allow to change profiling frequency

Krzysztof Kozlowski (2):
      dt-bindings: display/msm: qcom, sm8250-mdss: add DisplayPort
controller node
      dt-bindings: display/msm: qcom, sm8150-mdss: correct DSI PHY compatib=
le

Kunwu Chan (2):
      drm/atomic-helper: Fix spelling mistake "preceeding" -> "preceding"
      drm/i915: Fix potential spectre vulnerability

Kuogee Hsieh (7):
      drm/msm/dp: tie dp_display_irq_handler() with dp driver
      drm/msm/dp: rename is_connected with link_ready
      drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
      drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
      drm/msm/dp: incorporate pm_runtime framework into DP driver
      drm/msm/dp: delete EV_HPD_INIT_SETUP
      drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()

Laurent Morichetti (1):
      drm/amdkfd: Clear the VALU exception state in the trap handler

Le Ma (1):
      drm/amdgpu: add param to specify fw bo location for front-door loadin=
g

Leo (Hanghong) Ma (1):
      drm/amd/display: Add HDMI capacity computations using fixed31_32

Lewis Huang (1):
      drm/amd/display: Pass pwrseq inst for backlight and ABM

Li Ma (3):
      drm/amdgpu: add init_registers for nbio v7.11
      drm/amd/swsmu: update smu v14_0_0 driver if version and metrics table
      drm/amd/swsmu: remove duplicate definition of smu v14_0_0 driver
if version

Lijo Lazar (15):
      drm/amd/pm: Add support to fetch pm metrics sample
      drm/amd/pm: Add pm metrics support to SMU v13.0.6
      drm/amd/pm: Add sysfs attribute to get pm metrics
      drm/amdgpu: Move mca debug mode decision to ras
      drm/amdgpu: Add reg_state sysfs attribute
      drm/amdgpu: Read aquavanjaram PCIE register state
      drm/amdgpu: Read aquavanjaram XGMI register state
      drm/amdgpu: Use another offset for GC 9.4.3 remap
      drm/amdgpu: Read aquavanjaram WAFL register state
      drm/amdgpu: Read aquavanjaram USR register state
      drm/amdgpu: Restrict extended wait to PSP v13.0.6
      drm/amdgpu: Add NULL checks for function pointers
      drm/amdgpu: Update HDP 4.4.2 clock gating flags
      drm/amdgpu: Avoid querying DRM MGCG status
      drm/amdgpu: Use the right method to get IP version

Likun Gao (1):
      drm/amdgpu: distinguish rlc fw for different SKU

Liu Ying (1):
      drm/bridge: imx93-mipi-dsi: Fix a couple of building warnings

Lu Yao (1):
      drm/amdgpu: Fix cat debugfs amdgpu_regs_didt causes kernel null point=
er

Luben Tuikov (9):
      drm/sched: Don't disturb the entity when in RR-mode scheduling
      drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()
      drm/sched: Define pr_fmt() for DRM using pr_*()
      Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
      drm/print: Handle NULL drm device in __drm_printk()
      drm/sched: Fix bounds limiting when given a malformed entity
      drm/sched: Rename priority MIN to LOW
      drm/sched: Reverse run-queue priority enumeration
      drm/sched: Fix compilation issues with DRM priority rename

Luca Coelho (1):
      drm/i915: handle uncore spinlock when not available

Lucas De Marchi (183):
      drm/i915/lnl: Extend C10/C20 phy
      drm/i915/lnl: Fix check for TC phy
      drm/i915/display: Abstract C10/C20 pll hw readout
      drm/i915/display: Abstract C10/C20 pll calculation
      drm/xe/ggtt: Use BIT_ULL() for 64bit
      drm/xe: Fix some log messages on 32b
      drm/xe/mmio: Use non-atomic writeq/readq variant for 32b
      drm/xe: Fix tracepoints on 32b
      drm/xe/gt: Fix min() with u32 and u64
      drm/xe: Add documentation for mem_type
      drm/xe: Add min config for kunit integration ARCH=3Dum
      drm/xe: Fix typo in MCR documentation
      drm/xe: Fix xe_tuning include
      drm/xe: Remove TODO from rtp infra
      drm/xe: Remove TODO from workaround documentation
      drm/xe/mcr: Use designated init for xe_steering_types
      drm/xe/mcr: Add SQIDI steering for DG2
      drm/xe: Rename xe_rtp_regval to xe_rtp_action
      drm/xe/rtp: Split action and entry flags
      drm/xe/rtp: Support multiple actions per entry
      drm/xe: Make local functions static
      drm/xe: Fix application of LRC tunings
      drm/xe: Remove unused functions
      drm/xe: Add missing doc for xe parameter
      drm/xe: Add missing include xe_wait_user_fence.h
      drm/xe: Remove duplicate media_ver
      drm/xe: Remove outdated build workaround
      drm/xe/guc: Remove i915_regs.h include
      drm/xe: Fix kunit integration due to missing prototypes
      drm/xe: Sort includes
      drm/xe: Remove dependency on intel_engine_regs.h
      drm/xe: Remove dependency on intel_gt_regs.h
      drm/xe: Remove dependency on intel_lrc_reg.h
      drm/xe: Remove dependency on intel_gpu_commands.h
      drm/xe: Remove dependency on i915_reg.h
      drm/xe/guc_pc: Move gt register to the proper place
      drm/xe: Remove dependency on intel_mchbar_regs.h
      drm/xe: Prefer single underscore for header guards
      drm/xe: Do not spread i915_reg_defs.h include
      drm/xe/device: Prefer the drm-managed mutex_init
      drm/xe: Fix typo persitent->persistent
      drm/xe: Fix duplicated setting for register 0x6604
      drm/xe: Fix ROW_CHICKEN2 define
      drm/xe/mcr: Add L3BANK steering for DG2
      drm/xe/mcr: Document how to initialize group/instance
      drm/xe: Allow const propagation in gt_to_xe()
      drm/xe: Constify xe_dss_mask_group_ffs()
      drm/xe/rtp: Move match function from wa to rtp
      drm/xe/rtp: Add match for render reset domain
      drm/xe: Remove dump function from reg_sr
      drm/xe: Name LRC wa after the engine it belongs
      drm/xe/pvc: Remove A* steppings
      drm/xe/rtp: Add match helper for gslice fused off
      drm/xe/reg_sr: Tweak verbosity for register printing
      drm/xe: Print whitelist while applying
      drm/xe/debugfs: Dump register save-restore tables
      drm/xe: Reorder WAs to consider the platform
      drm/xe: Add PVC gt workarounds
      drm/xe: Add PVC engine workarounds
      drm/xe: Add missing DG2 gt workarounds and tunings
      drm/xe: Add missing DG2 engine workarounds
      drm/xe: Add missing DG2 lrc tunings
      drm/xe: Add missing DG2 lrc workarounds
      drm/xe: Add missing ADL-P engine workaround
      drm/xe: Add missing LRC workarounds for graphics 1200
      drm/xe: Replace i915 with xe in uapi
      drm/xe/mcr: Separate version from engine type selection
      drm/xe: Remove unused revid from firmware name
      drm/xe: Fix platform order
      drm/xe: Extract function to initialize xe->info
      drm/xe: Move test infra out of xe_pci.[ch]
      drm/xe: Use symbol namespace for kunit tests
      drm/xe: Generalize fake device creation
      drm/xe/reg_sr: Save errors for kunit integration
      drm/xe: Add basic unit tests for rtp
      drm/xe: Add test for GT workarounds and tunings
      drm/xe: Update GuC/HuC firmware autoselect logic
      drm/xe: Always log GuC/HuC firmware versions
      drm/xe: Cleanup page-related defines
      drm/xe: Rename RC0/RC6 macros
      drm/xe: Rename instruction field to avoid confusion
      drm/xe/guc: Rename GEN11_SOFT_SCRATCH for clarity
      drm/xe/guc: Move GuC registers to regs/
      drm/xe/guc: Convert GuC registers to REG_FIELD/REG_BIT
      drm/xe: Drop gen afixes from registers
      drm/xe: Use REG_FIELD/REG_BIT for all regs/*.h
      drm/xe: Clarify register types on PAT programming
      drm/xe: Introduce xe_reg/xe_reg_mcr
      drm/xe: Use XE_REG/XE_REG_MCR
      drm/xe: Annotate masked registers used by RTP
      drm/xe: Plumb xe_reg into WAs, rtp, etc
      drm/xe: Move helper macros to separate header
      drm/xe: Fix media detection for pre-GMD_ID platforms
      drm/xe: Do not mark 1809175790 as a WA
      drm/xe: Fix comment on Wa_22013088509
      drm/xe/guc: Remove special handling for PVC A*
      drm/xe/guc: Handle RCU_MODE as masked from definition
      drm/xe/mmio: Use struct xe_reg
      drm/xe: Rename reg field to addr
      drm/xe: Fix indent in xe_hw_engine_print_state()
      drm/xe: Load HuC on Alderlake P
      drm/xe: Fix Wa_22011802037 annotation
      drm/xe/rtp: Split rtp process initialization
      drm/xe/rtp: Replace XE_WARN_ON
      drm/xe/rtp: Add "_sr" to entry/function names
      drm/xe/rtp: Allow to track active workarounds
      drm/xe/wa: Track gt/engine/lrc active workarounds
      drm/xe/debugfs: Dump active workarounds
      drm/xe/rtp: Rename STEP to GRAPHICS_STEP
      drm/xe/rtp: Add check for media stepping
      drm/xe/rtp: Add support for entries with no action
      drm/xe: Include build directory
      drm/xe: Add support for OOB workarounds
      drm/xe/guc: Port Wa_22012773006 to xe_wa
      drm/xe/guc: Port Wa_16011759253 to xe_wa
      drm/xe/guc: Port Wa_14012197797/Wa_22011391025 to xe_wa
      drm/xe/guc: Port Wa_16011777198 to xe_wa
      drm/xe/guc: Port Wa_22012727170/Wa_22012727685 to xe_wa
      drm/xe/guc: Port Wa_16015675438/Wa_18020744125 to xe_wa
      drm/xe/guc: Port Wa_1509372804 to xe_wa
      drm/xe/rtp: Also check gt type
      drm/xe/guc: Port Wa_14014475959 to xe_wa and fix it
      drm/xe: Rename pte/pde encoding functions
      drm/xe/guc: Fix typo s/enabled/enable/
      drm/xe/guc: Normalize error messages with %#x
      drm/xe: Skip applying copy engine fuses
      drm/xe: Normalize XE_VM_FLAG* names
      drm/xe: Use FIELD_PREP/FIELD_GET for tile id encoding
      drm/xe: Fix checking for unset value
      drm/xe: Remove vma arg from xe_pte_encode()
      drm/xe: Decouple vram check from xe_bo_addr()
      drm/xe: Set PTE_DM bit for stolen on MTL
      drm/xe: Fix MTL+ stolen memory mapping
      drm/xe: Carve out top of DSM as reserved
      drm/xe: Sort xe_regs.h
      drm/xe: Fix error path in xe_guc_pc_gucrc_disable()
      drm/xe: Fix error path in xe_guc_pc_start()
      drm/xe: Update ARL-S DevIDs to the latest BSpec
      drm/xe/pat: Use 0 instead of space on error
      drm/xe/reg_sr: Simplify check for masked registers
      drm/xe/reg_sr: Use xe_gt_dbg
      drm/xe: Add dbg messages for LRC WAs
      drm/xe: Fix LRC workarounds
      drm/xe/mmio: Account for GSI offset when checking ranges
      drm/xe: Accept a const xe device
      drm/xe: Normalize pte/pde encoding
      drm/xe: Remove check for vma =3D=3D NULL
      drm/xe: Use vfunc for pte/pde ppgtt encoding
      drm/xe/migrate: Do not hand-encode pte
      drm/xe: Use vfunc to initialize PAT
      drm/xe/dg2: Fix using wrong PAT table
      drm/xe/pat: Prefer the arch/IP names
      drm/xe/pat: Keep track of relevant indexes
      drm/xe: Use pat_index to encode pde/pte
      drm/xe: Use vfunc for ggtt pte encoding
      drm/xe/xe2: Extend reserved stolen sizes
      drm/xe/xe2: Add missing mocs entry
      drm/xe/vm: Prefer xe_assert() over XE_WARN_ON()
      drm/xe/xe2: Follow XeHPC for TLB invalidation
      drm/xe/xe2: Add one more bit to encode PAT to ppgtt entries
      drm/xe/pat: Add debugfs node to dump PAT
      drm/xe/gt: Dump PAT table when failing to initialize
      drm/xe: Fix WA 14010918519 write to wrong register
      drm/xe: Fix build with KUNIT=3Dm
      drm/xe/display: Silence kernel-doc warnings related to display
      drm/xe: Fold GEN11_MOCS_ENTRIES into gen12_mocs_desc
      drm/xe/mocs: Bring comment about mocs back to reality
      drm/xe: Remove GEN[0-9]*_ prefixes
      drm/xe: Fix modpost warning on kunit modules
      drm/xe: Sync MTL PCI IDs with i915
      drm/xe: Expand XE_REG_OPTION_MASKED documentation
      drm/xe/kunit: Remove handling of XE_TEST_SUBPLATFORM_ANY
      drm/xe/kunit: Move fake pci data to test-priv
      drm/xe/kunit: Add stub to read_gmdid
      drm/xe/kunit: Test WAs for MTL and LNL
      drm/xe: Rename info.supports_* to info.has_*
      drm/xe: Return error if drm_buddy_init() fails
      drm/xe/bo: Remove unusued variable
      drm/xe/display: Fix dummy __i915_inject_probe_error()
      drm/xe: Enable W=3D1 warnings by default
      drm/xe: Remove uninitialized variable from warning
      drm/xe: Disable 32bits build
      drm/xe: Fix warning on impossible condition

Ma Jun (5):
      drm/amd/pm: Fix return value and drop redundant param
      drm/amd/pm: Move some functions to smu_v13_0.c as generic code
      drm/amd/pm: Make smu_v13_0_baco_set_armd3_sequence() static
      drm/amd/pm: Remove redundant function members of pptable_funcs
      drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0

Maarten Lankhorst (12):
      drm/i915/display: Use i915_gem_object_get_dma_address to get dma addr=
ess
      drm/xe: Implement stolen memory.
      drm/xe: Fix hidden gotcha regression with bo create
      drm/xe: Convert memory device refcount to s32
      drm/xe: Map initial FB at the same place in GGTT too
      drm/xe: Add debugfs for dumping GGTT mappings
      drm/xe: Use atomic instead of mutex for xe_device_mem_access_ongoing
      drm/xe: Remove extra xe_mmio_read32 from xe_mmio_wait32
      drm/xe: Prevent evicting for page tables
      drm/xe: Fix error paths of __xe_bo_create_locked
      drm/xe/display: Implement display support
      drm/xe/display: Improve s2idle handling.

Mangesh Gadre (1):
      drm/amdgpu: Add register read/write debugfs support for AID's

Marcelo Mendes Spessoto Junior (8):
      drm/amd/display: Removing duplicate copyright text
      drm/amd/display: Fix hdcp1_execution.c codestyle
      drm/amd/display: Fix hdcp_psp.c codestyle
      drm/amd/display: Fix freesync.c codestyle
      drm/amd/display: Fix hdcp_psp.h codestyle
      drm/amd/display: Fix hdcp2_execution.c codestyle
      drm/amd/display: Fix hdcp_log.h codestyle
      drm/amd/display: Fix power_helpers.c codestyle

Marco Felsch (1):
      drm/panel: ilitek-ili9881c: make use of prepare_prev_first

Marco Pagani (2):
      drm/test: rearrange test entries in Kconfig and Makefile
      drm/test: add a test suite for GEM objects backed by shmem

Marek Szyprowski (1):
      drm/debugfs: fix potential NULL pointer dereference

Marijn Suijten (2):
      drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
      drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps

Mario Limonciello (11):
      drm/amd: Use the first non-dGPU PCI device for BW limits
      drm/amd: Exclude dGPUs in eGPU enclosures from DPM quirks
      drm/amd: Enable PCIe PME from D3
      drm/amd/display: Fix NULL pointer dereference at hibernate
      drm/amd/display: Restore guard against default backlight value < 1 ni=
t
      drm/amd/display: Disable PSR-SU on Parade 0803 TCON again
      drm/amd: Fix a probing order problem on SDMA 2.4
      drm/amd/display: Add a new DC debug mask for PSR-SU
      Documentation/amdgpu: Add Hawk Point processors
      Documentation/amdgpu: Remove a spurious character
      drm/amd: Add missing definitions for `SMU_MAX_LEVELS_VDDGFX`

Matt Atwood (2):
      drm/xe: Add infrastructure for per engine tuning
      drm/xe: add gt tuning for indirect state

Matt Coster (1):
      sizes.h: Add entries between SZ_32G and SZ_64T

Matt Roper (134):
      drm/i915/mcr: Hold GT forcewake during steering operations
      drm/i915/dg2: Wa_18028616096 now applies to all DG2
      drm/i915/dg2: Drop Wa_22014600077
      drm/xe: Remove gen-based mmio offsets from hw engine init
      drm/xe: Assume MTL's forcewake register continues to future platforms
      drm/xe/mocs: Drop unwanted TGL table
      drm/xe/mocs: Add missing RKL handling
      drm/xe/mocs: Drop xe_mocs_info_index
      drm/xe/mocs: Drop duplicate assignment of uc_index
      drm/xe/mocs: LNCF MOCS settings only need to be restored on pre-Xe_HP
      drm/xe/mocs: Drop HAS_RENDER_L3CC flag
      drm/xe/guc: Handle regset overflow check for entire GT
      drm/xe: Separate engine fuse handling into dedicated functions
      drm/xe: Add support for CCS engine fusing
      drm/xe/pat: Move PAT setup to a dedicated file
      drm/xe/pat: Use table-based programming of PAT settings
      drm/xe/pat: Handle unicast vs MCR PAT registers
      drm/xe/pat: Clean up PAT register definitions
      drm/xe/mtl: Fix PAT table coherency settings
      drm/xe/mtl: Handle PAT_INDEX offset jump
      drm/xe/pat: Define PAT tables as static
      drm/xe: Include hardware prefetch buffer in batchbuffer allocations
      drm/xe: Adjust batchbuffer space warning when creating a job
      drm/xe: Don't emit extra MI_BATCH_BUFFER_END in WA batchbuffer
      drm/xe/irq: Drop gen3_ prefixes
      drm/xe/irq: Add helpers to find ISR/IIR/IMR/IER registers
      drm/xe/irq: Drop IRQ_INIT and IRQ_RESET macros
      drm/xe/irq: Drop unnecessary GEN11_ and GEN12_ register prefixes
      drm/xe/irq: Rename and clarify top-level interrupt handling routines
      drm/xe/irq: Drop remaining "gen11_" prefix from IRQ functions
      drm/xe/irq: Drop commented-out code for non-existent media engines
      drm/xe/irq: Don't clobber display interrupts on multi-tile platforms
      drm/xe: Start splitting xe_device_desc into graphics/media structures
      drm/xe: Set require_force_probe in each platform's description
      drm/xe: Move most platform traits to graphics IP
      drm/xe: Move engine masks into IP descriptor structures
      drm/xe: Clarify GT counting logic
      drm/xe: Add printable name to IP descriptors
      drm/xe: Select graphics/media descriptors from GMD_ID
      drm/xe: Add KUnit test for xe_pci.c IP engine lists
      drm/xe: Clean up xe_device_desc
      drm/xe: Let primary and media GT share a kernel_bb_pool
      drm/xe: Use packed bitfields for xe->info feature flags
      drm/xe: Track whether platform has LLC
      drm/xe: Only request PCODE_WRITE_MIN_FREQ_TABLE on LLC platforms
      drm/xe/sr: Apply masked registers properly
      drm/xe: Fix xe_mmio_rmw32 operation
      drm/xe: Drop GFX_FLSH_CNTL_GEN6 write during GGTT invalidation
      drm/xe/adlp: Add revid =3D> step mapping
      drm/xe/adln: Enable ADL-N
      drm/xe: Add stepping support for GMD_ID platforms
      drm/xe/pvc: Don't try to invalidate AuxCCS TLB
      drm/xe/mtl: Disable media GT
      drm/xe: Introduce xe_tile
      drm/xe: Add backpointer from gt to tile
      drm/xe: Add for_each_tile iterator
      drm/xe: Move register MMIO into xe_tile
      drm/xe: Move GGTT from GT to tile
      drm/xe: Move VRAM from GT to tile
      drm/xe: Memory allocations are tile-based, not GT-based
      drm/xe: Move migration from GT to tile
      drm/xe: Clarify 'gt' retrieval for primary tile
      drm/xe: Drop vram_id
      drm/xe: Drop extra_gts[] declarations and XE_GT_TYPE_REMOTE
      drm/xe: Allocate GT dynamically
      drm/xe: Add media GT to tile
      drm/xe: Interrupts are delivered per-tile, not per-GT
      drm/xe/irq: Move ASLE backlight interrupt logic
      drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt ma=
sk
      drm/xe/irq: Untangle postinstall functions
      drm/xe: Replace xe_gt_irq_postinstall with xe_irq_enable_hwe
      drm/xe: Invalidate TLB on all affected GTs during GGTT updates
      drm/xe/tlb: Obtain forcewake when doing GGTT TLB invalidations
      drm/xe: Allow GT looping and lookup on standalone media
      drm/xe: Update query uapi to support standalone media
      drm/xe: Reinstate media GT support
      drm/xe: Add kerneldoc description of multi-tile devices
      drm/xe: Reformat xe_guc_regs.h
      drm/xe: Initialize MOCS earlier
      drm/xe: Don't hardcode GuC's MOCS index in register header
      drm/xe/wa: Extend scope of Wa_14015795083
      drm/xe/mtl: Add some initial MTL workarounds
      drm/xe: Return GMD_ID revid properly
      drm/xe: Don't raise error on fused-off media
      drm/xe: Print proper revid value for unknown media revision
      drm/xe: Enable PCI device earlier
      drm/xe/mtl: Map PPGTT as CPU:WC
      drm/xe: xe_engine_create_ioctl should check gt_count, not tile_count
      drm/xe/mtl: Reduce Wa_14018575942 scope to the CCS engine
      drm/xe: Add Wa_14015150844 for DG2 and Xe_LPG
      drm/xe: Stop tracking 4-tile support
      drm/xe/xe2: Update render/compute context image sizes
      drm/xe/xe2: Add GT topology readout
      drm/xe/xe2: Add MCR register steering for primary GT
      drm/xe/xe2: Add MCR register steering for media GT
      drm/xe/xe2: Update context image layouts
      drm/xe/xe2: Handle fused-off CCS engines
      drm/xe/xe2: AuxCCS is no longer used
      drm/xe/xe2: Define Xe2_LPG IP features
      drm/xe/xe2: Define Xe2_LPM IP features
      drm/xe/xe2: Track VA bits independently of max page table level
      drm/xe/xe2: Program GuC's MOCS on Xe2 and beyond
      drm/xe/lnl: Add LNL platform definition
      drm/xe/lnl: Add GuC firmware definition
      drm/xe: Avoid 64-bit register reads
      drm/xe: Drop xe_mmio_write64()
      drm/xe/wa: Apply tile workarounds at probe/resume
      drm/xe: Infer service copy functionality from engine list
      drm/xe/tuning: Add missing engine class rules for LRC tuning
      drm/xe/xe2: Program PAT tables
      drm/xe: Make MI_FLUSH_DW immediate size more explicit
      drm/xe: Separate number of registers from MI_LRI opcode
      drm/xe: Clarify number of dwords/qwords stored by MI_STORE_DATA_IMM
      drm/xe: Extract MI_* instructions to their own header
      drm/xe/debugfs: Add dump of default LRCs' MI instructions
      drm/xe/debugfs: Include GFXPIPE commands in LRC dump
      drm/xe: Prepare to emit non-register state while recording default LR=
C
      drm/xe: Emit SVG state on RCS during driver load on DG2 and MTL
      drm/xe/xe2: Update SVG state handling
      drm/xe/mocs: MOCS registers are multicast on Xe_HP and beyond
      drm/xe/xe2: Program correct MOCS registers
      drm/xe: Add Wa_14019821291
      drm/xe: Drop EXECLIST_CONTROL from error state dump
      drm/xe/dg2: Wa_18028616096 now applies to all DG2
      drm/xe/dg2: Drop Wa_22014600077
      drm/xe: Remove duplicate RING_MAX_NONPRIV_SLOTS definition
      drm/xe: Drop "_REG" suffix from CSFE_CHICKEN1
      drm/xe: Move some per-engine register definitions to the engine heade=
r
      drm/xe: Fix whitespace in register definitions
      drm/xe: Move engine base offsets to engine register header
      drm/xe: Move GSC HECI base offsets out of register header
      drm/xe: Define interrupt vector bits with the interrupt registers
      drm/xe: Re-sort GT register header
      drm/xe: Drop some unnecessary header includes

Matthew Auld (94):
      drm/xe/pcode: fix pcode error check
      drm/xe/bo: reduce xe_bo_create_pin_map() restrictions
      drm/xe/ppgtt: clear the scratch page
      drm/xe/ppgtt: fix scratch page usage on DG2
      drm/xe/ggtt: fix alignment usage for DG2
      drm/xe/ggtt: fix GGTT scratch usage for DG2
      drm/xe/mmio: fix forcewake ref leak in xe_mmio_ioctl
      drm/xe/stolen: don't map stolen on small-bar
      drm/xe/query: zero the region info
      drm/xe/pm: fix unbalanced ref handling
      drm/xe: prefer xe_bo_create_pin_map()
      drm/xe/bo: explicitly reject zero sized BO
      drm/xe: s/lmem/vram/
      drm/xe: one more s/lmem/vram/
      drm/xe: add xe_ttm_stolen_cpu_access_needs_ggtt()
      drm/xe/vram: start tracking the io_size
      drm/xe/buddy: remove the virtualized start
      drm/xe/buddy: add visible tracking
      drm/xe/buddy: add compatible and intersects hooks
      drm/xe/gt: some error handling fixes
      drm/xe: add XE_BO_CREATE_VRAM_MASK
      drm/xe/bo: refactor try_add_vram
      drm/xe: fix suspend-resume for dgfx
      drm/xe/mmio: stop incorrectly triggering drm_warn
      drm/xe/tlb: fix expected_seqno calculation
      drm/xe/sched_job: prefer dma_fence_is_later
      drm/xe/lrc: give start_seqno a better default
      drm/xe: fix tlb_invalidation_seqno_past()
      drm/xe: fix kernel-doc issues
      drm/xe/bo: further limit where CCS pages are needed
      drm/xe/migrate: retain CCS aux state for vram -> vram
      drm/xe: don't allocate under ct->lock
      drm/xe: keep pulling mem_access_get further back
      drm/xe/vm: fix double list add
      drm/xe/bo: handle PL_TT -> PL_TT
      drm/xe/uapi: restrict system wide accounting
      drm/xe/uapi: add some kernel-doc for region query
      drm/xe/uapi: silence kernel-doc errors
      drm/doc: include xe_drm.h
      drm/xe/bo: consider bo->flags in xe_bo_migrate()
      drm/xe/tlb: drop unnecessary smp_wmb()
      drm/xe/tlb: ensure we access seqno_recv once
      drm/xe: hold mem_access.ref for CT fast-path
      drm/xe/ct: hold fast_lock when reserving space for g2h
      drm/xe/tlb: increment next seqno after successful CT send
      drm/xe/ct: serialise fast_lock during CT disable
      drm/xe/gt: tweak placement for signalling TLB fences after GT reset
      drm/xe/tlb: also update seqno_recv during reset
      drm/xe/tlb: print seqno_recv on fence TLB timeout
      drm/xe/ct: update g2h outstanding for CTB capture
      drm/xe: handle TLB invalidations from CT fast-path
      drm/xe/mmio: update gt_count when probing multi-tile
      drm/xe: fix xe_device_mem_access_get() races
      drm/xe/vm: tidy up xe_runtime_pm usage
      drm/xe/debugfs: grab mem_access around forcewake
      drm/xe/guc_pc: add missing mem_access for freq_rpe_show
      drm/xe/mmio: grab mem_access in xe_mmio_ioctl
      drm/xe: ensure correct access_put ordering
      drm/xe: drop xe_device_mem_access_get() from guc_ct_send
      drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
      drm/xe: drop xe_device_mem_access_get() from invalidation_vma
      drm/xe: add lockdep annotation for xe_device_mem_access_get()
      drm/xe/selftests: hold rpm for evict_test_run_device()
      drm/xe/selftests: hold rpm for ccs_test_migrate()
      drm/xe/selftests: restart GT after xe_bo_restore_kernel()
      drm/xe: add missing bulk_move reset
      drm/xe: add lockdep annotation for xe_device_mem_access_put()
      drm/xe/bo: support tiered vram allocation for small-bar
      drm/xe/uapi: add the userspace bits for small-bar
      drm/xe: fully turn on small-bar support
      drm/xe/engine: add missing rpm for bind engines
      drm/xe/guc_submit: prevent repeated unregister
      drm/xe: don't warn for bogus pagefaults
      drm/xe/guc_submit: fixup deregister in job timeout
      drm/xe: skip rebind_list if vma destroyed
      drm/xe/ct: fix resv_space print
      drm/xe: nuke GuC on unload
      drm/xe: fix has_llc on rkl
      drm/xe/selftests: consider multi-GT for eviction test
      drm/xe/selftests: make eviction test tile centric
      drm/xe/hwmon: fix uaf on unload
      drm/xe/pat: trim the xelp PAT table
      drm/xe: directly use pat_index for pte_encode
      drm/xe: fix pat[2] programming with 2M/1G pages
      drm/xe/migrate: fix MI_ARB_ON_OFF usage
      drm/xe/bo: consider dma-resv fences for clear job
      drm/xe/bo: sync kernel fences for KMD buffers
      drm/xe/display: ensure clear-color surfaces are cpu mappable
      drm/xe/bo: don't hold dma-resv lock over drm_gem_handle_create
      drm/xe: fix mem_access for early lrc generation
      drm/xe/pat: annotate pat_index with coherency mode
      drm/xe/uapi: support pat_index selection with vm_bind
      drm/xe/mocs: update MOCS table for xe2
      drm/xe: add some debug info for d3cold

Matthew Brost (97):
      drm/sched: Add drm_sched_wqueue_* helpers
      drm/sched: Convert drm scheduler to use a work queue rather than kthr=
ead
      drm/sched: Split free_job into own work item
      drm/sched: Add drm_sched_start_timeout_unlocked helper
      drm/sched: Add a helper to queue TDR immediately
      drm/doc/rfc: Mark long running workload as complete.
      drm/xe: Introduce a new DRM driver for Intel GPUs
      drm/xe: Take memory ref on kernel job creation
      drm/xe: Ensure VMA not userptr before calling xe_bo_is_stolen
      drm/xe: Fake pulling gt->info.engine_mask from hwconfig blob
      drm/xe/guc: Report submission version of GuC firmware
      drm/xe/guc: s/xe_guc_send_mmio/xe_guc_mmio_send
      drm/xe/guc: Add support GuC MMIO send / recv
      drm/xe/migrate: Update emit_pte to cope with a size level than 4k
      drm/xe: Don't process TLB invalidation done in CT fast-path
      drm/xe: Break of TLB invalidation into its own file
      drm/xe: Move TLB invalidation variable to own sub-structure in GT
      drm/xe: Add TLB invalidation fence
      drm/xe: Invalidate TLB after unbind is complete
      drm/xe: Kernel doc GT TLB invalidations
      drm/xe: Add TLB invalidation fence ftrace
      drm/xe: Add TDR for invalidation fence timeout cleanup
      drm/xe: Only set VM->asid for platforms that support a ASID
      drm/xe: Delete debugfs entry to issue TLB invalidation
      drm/xe: Add has_range_tlb_invalidation device attribute
      drm/xe: Add range based TLB invalidations
      drm/xe: Propagate error from bind operations to async fence
      drm/xe: Use GuC to do GGTT invalidations for the GuC firmware
      drm/xe: Lock GGTT on when restoring kernel BOs
      drm/xe: Propagate VM unbind error to invalidation fence
      drm/xe: Signal invalidation fence immediately if CT send fails
      drm/xe: Add has_asid to device info
      drm/xe: Add TLB invalidation fence after rebinds issued from execs
      drm/xe: Drop TLB invalidation from ring operations
      drm/xe: Drop zero length arrays
      drm/xe: Reinstate render / compute cache invalidation in ring ops
      drm/xe: Use BO's GT to determine dma_offset when programming PTEs
      drm/xe: Fix potential deadlock handling page faults
      drm/xe: Decrement fault mode counts in xe_vm_close_and_put
      drm/xe: Better error messages for xe_gt_record_default_lrcs
      drm/xe: Always write GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE
for CCS engines
      drm/xe: Don't grab runtime PM ref in engine create IOCTL
      drm/xe: Allow compute VMs to output dma-fences on binds
      drm/xe: Allow dma-fences as in-syncs for compute / faulting VM
      drm/xe/guc: Read HXG fields from DW1 of G2H response
      drm/xe: Handle unmapped userptr in analyze VM
      drm/xe: Use Xe ordered workqueue for rebind worker
      drm/xe: s/XE_PTE_READ_ONLY/XE_PTE_FLAG_READ_ONLY
      drm/xe: Move XE_PTE_FLAG_READ_ONLY to xe_vm_types.h
      drm/xe: NULL binding implementation
      drm/xe: Long running job update
      drm/xe: Ensure LR engines are not persistent
      drm/xe: Only try to lock external BOs in VM bind
      drm/xe: VM LRU bulk move
      drm/xe: Use internal VM flags in xe_vm_create
      drm/xe: Ban a VM if rebind worker hits an error
      drm/xe: Add helpers to hide struct xe_vma internals
      drm/xe: Remove __xe_vm_bind forward declaration
      drm/xe: Port Xe to GPUVA
      drm/xe: Make bind engines safe
      drm/xe: Remove xe_vma_op_unmap
      drm/xe: Avoid doing rebinds
      drm/xe: Reduce the number list links in xe_vma
      drm/xe: Replace list_del_init with list_del for
userptr.invalidate_link cleanup
      drm/xe: Change tile masks from u64 to u8
      drm/xe: Combine destroy_cb and destroy_work in xe_vma into union
      drm/xe: Only alloc userptr part of xe_vma for userptrs
      drm/xe: Use migrate engine for page fault binds
      drm/xe: Always use xe_vm_queue_rebind_worker helper
      drm/xe: Signal out-syncs on VM binds if no operations
      drm/xe: Remove XE_GUC_CT_SELFTEST
      drm/xe: Remove ct->fence_context
      drm/xe: Add define WQ_HEADER_SIZE
      drm/xe: remove header variable from parse_g2h_msg
      drm/xe: Set max pte size when skipping rebinds
      drm/xe: Call __guc_exec_queue_fini_async direct for KERNEL exec_queue=
s
      drm/xe: Convert xe_vma_op_flags to BIT macros
      drm/xe: Fixup unwind on VM ops errors
      drm/gpuva: Add drm_gpuva_for_each_op_reverse
      drm/xe: Fix array of binds
      drm/xe: Fix fence reservation accouting
      drm/xe: Fix exec queue usage for unbinds
      drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
      drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementat=
ion
      drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_q=
ueue
      drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
      drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
      drm/xe: Remove async worker and rework sync binds
      drm/xe: Fix VM bind out-sync signaling ordering
      drm/xe: Adjust tile_present mask when skipping rebinds
      drm/xe: Use pool of ordered wq for GuC submission
      drm/xe: Only set xe_vma_op.map fields for GPUVA map operations
      drm/xe: Use a flags field instead of bools for VMA create
      drm/xe: Use a flags field instead of bools for sync parse
      drm/xe: Allow num_batch_buffer / num_binds =3D=3D 0 in IOCTLs
      drm/xe/uapi: Remove sync binds
      drm/xe: Fix UBSAN splat in add_preempt_fences()

Mauro Carvalho Chehab (5):
      drm/xe/Kconfig.debug: select DEBUG_FS for KUnit runs
      drm/xe: KUnit tests depend on CONFIG_DRM_FBDEV_EMULATION
      drm/xe: skip Kunit tests requiring real hardware when running on UML
      drm/xe/xe_uc_fw: Use firmware files from standard locations
      drm/xe/uapi: Reject bo creation of unaligned size

Max Tseng (2):
      drm/amd/display: replay: generalize the send command function usage
      drm/amd/display: replay: Augment Frameupdate Command

Maxime Ripard (4):
      drm/tests: Remove slow tests
      drm/todo: Add entry to clean up former seltests suites
      Merge drm/drm-next into drm-misc-next
      drm/vc4: hdmi: Create destroy state implementation

Ma=C3=ADra Canal (15):
      drm/v3d: wait for all jobs to finish before unregistering
      drm/v3d: Implement show_fdinfo() callback for GPU usage stats
      drm/v3d: Expose the total GPU usage stats on sysfs
      MAINTAINERS: Add Maira to V3D maintainers
      drm/v3d: Don't allow two multisync extensions in the same job
      drm/v3d: Decouple job allocation from job initiation
      drm/v3d: Use v3d_get_extensions() to parse CPU job data
      drm/v3d: Create tracepoints to track the CPU job
      drm/v3d: Enable BO mapping
      drm/v3d: Create a CPU job extension for a indirect CSD job
      drm/v3d: Create a CPU job extension for the timestamp query job
      drm/v3d: Create a CPU job extension for the reset timestamp job
      drm/v3d: Create a CPU job extension to copy timestamp query to a buff=
er
      drm/v3d: Create a CPU job extension for the reset performance query j=
ob
      drm/v3d: Create a CPU job extension for the copy performance query jo=
b

Meenakshikumar Somasundaram (3):
      drm/amd/display: Fix tiled display misalignment
      drm/amd/display: Fix minor issues in BW Allocation Phase2
      drm/amd/display: Add dpia display mode validation logic

Melissa Wen (26):
      drm/v3d: Remove unused function header
      drm/v3d: Move wait BO ioctl to the v3d_bo file
      drm/v3d: Detach job submissions IOCTLs to a new specific file
      drm/v3d: Simplify job refcount handling
      drm/v3d: Add a CPU job submission
      drm/v3d: Detach the CSD job BO setup
      drm/drm_mode_object: increase max objects to accommodate new color pr=
ops
      drm/drm_property: make replace_property_blob_from_id a DRM helper
      drm/drm_plane: track color mgmt changes per plane
      drm/amd/display: add driver-specific property for plane degamma LUT
      drm/amd/display: explicitly define EOTF and inverse EOTF
      drm/amd/display: document AMDGPU pre-defined transfer functions
      drm/amd/display: add plane 3D LUT driver-specific properties
      drm/amd/display: add plane shaper LUT and TF driver-specific properti=
es
      drm/amd/display: add CRTC gamma TF driver-specific property
      drm/amd/display: add comments to describe DM crtc color mgmt behavior
      drm/amd/display: encapsulate atomic regamma operation
      drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
      drm/amd/display: reject atomic commit if setting both plane and
CRTC degamma
      drm/amd/display: add plane shaper LUT support
      drm/amd/display: add plane shaper TF support
      drm/amd/display: add plane 3D LUT support
      drm/amd/display: add plane CTM driver-specific property
      drm/amd/display: add plane CTM support
      drm/amd/display: fix documentation for dm_crtc_additional_color_mgmt(=
)
      drm/amd/display: fix bandwidth validation failure on DCN 2.1

Michael Banack (1):
      drm: Introduce documentation for hotspot properties

Michael J. Ruhl (5):
      drm/xe: Rework size helper to be a little more correct
      drm/xe: Simplify rebar sizing
      drm/xe: Size GT device memory correctly
      drm/xe: Rename GPU offset helper to reflect true usage
      drm/xe: REBAR resize should be best effort

Michael Strauss (5):
      drm/amd/display: Do not read DPREFCLK spread info from LUT on DCN35
      drm/amd/display: Update Fixed VS/PE Retimer Sequence
      drm/amd/display: Only enumerate top local sink as DP2 output
      drm/amd/display: Revert DP2 MST hub triple display fix
      drm/amd/display: Fix lightup regression with DP2 single display confi=
gs

Michael Trimarchi (4):
      drm/panel: Add Synaptics R63353 panel driver
      dt-bindings: display: panel: Add Ilitek ili9805 panel controller
      drm/panel: Add Ilitek ILI9805 panel driver
      drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 panel

Michael Walle (2):
      dt-bindings: display: simple: add Evervision VGG644804 panel
      drm/panel-simple: add Evervision VGG644804 panel entry

Michal Wajdeczko (23):
      drm/xe: Introduce GT oriented log messages
      drm/xe: Use GT oriented log messages in xe_gt.c
      drm/xe: Move Media GuC register definition to regs/
      drm/xe: Change GuC interrupt data
      drm/xe: Introduce Xe assert macros
      drm/xe/guc: Promote guc_to_gt/xe helpers to .h
      drm/xe/guc: Fix wrong assert about full_len
      drm/xe/guc: Copy response data from proper registers
      drm/xe/guc: Fix handling of GUC_HXG_TYPE_NO_RESPONSE_BUSY
      drm/xe/guc: Use valid scratch register for posting read
      drm/xe: Add device flag to indicate SR-IOV support
      drm/xe: Prepare for running in different SR-IOV modes
      drm/xe: Print virtualization mode during probe
      drm/xe/kunit: Return number of iterated devices
      drm/xe/guc: Drop ancient GuC CTB definitions
      drm/xe/guc: Remove obsolete GuC CTB documentation
      drm/xe/guc: Include only required GuC ABI headers
      drm/xe/doc: Include documentation about xe_assert()
      drm/xe: Define DRM_XE_DEBUG_SRIOV config
      drm/xe: Introduce SR-IOV logging macros
      drm/xe/pf: Introduce Local Memory Translation Table
      drm/xe/kunit: Enable CONFIG_PCI_IOV in .kunitconfig
      drm/xe/kunit: Add test for LMTT operations

Micha=C5=82 Winiarski (22):
      iosys-map: Rename locals used inside macros
      drm/xe: Fix uninitialized variables
      drm/xe: Fix check for platform without geometry pipeline
      drm/xe: Fix header guard warning
      drm/xe: Skip calling drm_dev_put on probe error
      drm/xe: Use managed pci_enable_device
      drm/xe/irq: Don't call pci_free_irq_vectors
      drm/xe: Move xe_set_dma_info outside of MMIO setup
      drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
      drm/xe: Split xe_info_init
      drm/xe: Introduce xe_tile_init_early and use at earlier point in prob=
e
      drm/xe: Map the entire BAR0 and hold onto the initial mapping
      drm/xe/device: Introduce xe_device_probe_early
      drm/xe: Don't "peek" into GMD_ID
      drm/xe: Move system memory management init to earlier point in probe
      drm/xe: Move force_wake init to earlier point in probe
      drm/xe: Reorder GGTT init to earlier point in probe
      drm/xe: Add a helper for DRM device-lifetime BO create
      drm/xe/uc: Split xe_uc_fw_init
      drm/xe/uc: Store firmware binary in system-memory backed BO
      drm/xe/uc: Extract xe_uc_sanitize_reset
      drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"

Mika Kahola (7):
      drm/i915/display: Reset message bus after each read/write operation
      drm/i915/display: Support PSR entry VSC packet to be transmitted
one frame earlier
      drm/i915/mtl: C20 state verification
      drm/i915/display: Use int for entry setup frames
      drm/i915/display: Use int type for entry_setup_frames
      drm/i915/display: Skip state verification with TBT-ALT mode
      drm/i915/display: Wait for PHY readiness not needed for disabling seq=
uence

Mika Kuoppala (4):
      drm/xe: destroy clients engine and vm xarrays on close
      drm/xe: Fix unreffed ptr leak on engine lookup
      drm/xe: Extend drm_xe_vm_bind_op
      drm/xe/vm: Avoid asid lookup if none allocated

Moti Haimovski (1):
      accel/habanalabs/gaudi2: add signed dev info uAPI

Mounika Adhuri (1):
      drm/amd/display: Refactor resource into component directory

Muhammad Ahmed (2):
      drm/amd/display: remove HPO PG in driver side
      drm/amd/display: add debug option for ExtendedVBlank DLG adjust

Mukul Joshi (1):
      drm/amdkfd: Use common function for IP version check

Nathan Chancellor (3):
      usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE with OF
      usb: typec: qcom-pmic-typec: Only select DRM_AUX_HPD_BRIDGE with OF
      drm/bridge: Return NULL instead of plain 0 in
drm_dp_hpd_bridge_register() stub

Neil Armstrong (10):
      dt-bindings: display: msm-dsi-phy-7nm: document the SM8650 DSI PHY
      dt-bindings: display: msm-dsi-controller-main: document the
SM8650 DSI Controller
      dt-bindings: display: msm: document the SM8650 DPU
      dt-bindings: display: msm: document the SM8650 Mobile Display Subsyst=
em
      drm/msm/dpu: add support for SM8650 DPU
      drm/msm: mdss: add support for SM8650
      drm/msm: dsi: add support for DSI-PHY on SM8650
      drm/msm: dsi: add support for DSI 2.8.0
      dt-bindings: display: msm: dp-controller: document SM8650 compatible
      drm/msm/dp: Add DisplayPort controller for SM8650

Nicholas Kazlauskas (16):
      drm/amd/display: Add z-state support policy for dcn35
      drm/amd/display: Update DCN35 watermarks
      drm/amd/display: Add Z8 watermarks for DML2 bbox overrides
      drm/amd/display: Feed SR and Z8 watermarks into DML2 for DCN35
      drm/amd/display: Remove min_dst_y_next_start check for Z8
      drm/amd/display: Update min Z8 residency time to 2100 for DCN314
      drm/amd/display: Update DCN35 clock table policy
      drm/amd/display: Allow DTBCLK disable for DCN35
      drm/amd/display: Pass debug watermarks through to DCN35 DML2
      drm/amd/display: Refactor DMCUB enter/exit idle interface
      drm/amd/display: Wake DMCUB before sending a command
      drm/amd/display: Wake DMCUB before executing GPINT commands
      drm/amd/display: Always exit DMCUB idle when called
      drm/amd/display: Wait forever for DMCUB to wake up
      drm/amd/display: Switch DMCUB notify idle command to NO_WAIT
      drm/amd/display: Verify disallow bits were cleared for idle

Nicholas Susanto (1):
      drm/amd/display: Fix disable_otg_wa logic

Nikita Zhandarovich (3):
      drm/radeon/r600_cs: Fix possible int overflows in r600_cs_check_reg()
      drm/radeon/r100: Fix integer overflow issues in r100_cs_track_check()
      drm/radeon: check return value of radeon_ring_lock()

Niranjana Vishwanathapura (16):
      drm/xe/migrate: Fix number of PT structs in docbook
      drm/xe/tests: Use proper batch base address
      drm/xe/tests: Set correct expectation
      drm/xe: Use proper vram offset
      drm/xe: Fix memory use after free
      drm/xe: Handle -EDEADLK case in preempt worker
      drm/xe: Handle -EDEADLK case in exec ioctl
      drm/xe: Apply upper limit to sg element size
      drm/xe: Simplify engine class sched_props setting
      drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
      drm/xe/pvc: Blacklist BCS_SWCTRL register
      drm/xe/pvc: Force even num engines to use 64B
      drm/xe/pvc: Use fast copy engines as migrate engine on PVC
      drm/xe: Enable Fixed CCS mode setting
      drm/xe: Allow userspace to configure CCS mode
      drm/xe: Avoid any races around ccs_mode update

Nirmoy Das (7):
      drm/i915/gt: Use proper priority enum instead of 0
      drm/i915: Flush WC GGTT only on required platforms
      drm/i915/mtl: Apply notify_guc to all GTs
      drm/i915/tc: Fix -Wformat-truncation in intel_tc_port_init
      drm/xe/stolen: Exclude reserved lmem portion
      drm/xe: Do not sleep in atomic
      drm/xe: Print GT info on TLB inv failure

N=C3=ADcolas F. R. A. Prado (1):
      drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency

Oak Zeng (3):
      drm/xe: Implement HW workaround 14016763929
      drm/xe: Make xe_mem_region struct
      drm/xe: Improve vram info debug printing

Oded Gabbay (1):
      accel/habanalabs: add support for Gaudi2C device

Ofir Bitton (1):
      accel/habanalabs: remove 'get temperature' debug print

Ohad Sharabi (1):
      drm/xe: do not register to PM if GuC is disabled

Pallavi Mishra (5):
      drm/xe: Prevent return with locked vm
      drm/xe: Align size to PAGE_SIZE
      drm/xe: Dump CTB during TLB timeout
      drm/xe/tests: Fix migrate test
      drm/xe/uapi: Add support for CPU caching mode

Paloma Arellano (2):
      drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
      drm/msm/dpu: Add mutex lock in control vblank irq

Parandhaman K (1):
      drm/amd/display: Refactor OPTC into component folder

Paul Cercueil (1):
      drm/exynos: dpi: Change connector type to DPI

Paulo Zanoni (5):
      drm/xe: fix bounds checking for 'len' in xe_engine_create_ioctl
      drm/xe: properly check bounds for xe_wait_user_fence_ioctl()
      drm/xe/vm: print the correct 'keep' when printing gpuva ops
      drm/xe/vm: use list_last_entry() to fetch last_op
      drm/xe: fix range printing for debug messages

Perry Yuan (1):
      drm/amdgpu: optimize RLC powerdown notification on Vangogh

Peyton Lee (2):
      drm/amd/pm: support return vpe clock table
      drm/amdgpu/vpe: enable vpe dpm

Philip Yang (1):
      drm/amdkfd: svm range always mapped flag not working on APU

Philipp Zabel (2):
      dt-bindings: ili9881c: Add Ampire AM8001280G LCD panel
      drm/panel: ilitek-ili9881c: Add Ampire AM8001280G LCD panel

Philippe Lecluse (4):
      drm/xe: enforce GSMBASE for DG1 instead of BAR2
      drm/xe: fix xe_mmio_total_vram_size
      drm/xe: Fix Meteor Lake rsa issue on guc loading
      drm/xe/mocs: add MTL mocs

Pin-yen Lin (2):
      drm/edp-panel: Sort the panel entries
      drm/edp-panel: Move the KDC panel to a separate group

Pranjal Ramajor Asha Kanojiya (2):
      accel/qaic: Support MHI QAIC_TIMESYNC channel
      accel/qaic: Support for 0 resize slice execution in BO

Prike Liang (2):
      drm/amdgpu: add amdgpu runpm usage trace for separate funcs
      drm/amdgpu: correct the amdgpu runtime dereference usage count

Priyanka Dandamudi (1):
      drm/xe/xe_exec_queue: Add check for access counter granularity

Radhakrishna Sripada (4):
      drm/i915/mtl: Update Wa_22018931422
      drm/i915/mtl: Use port clock compatible numbers for C20 phy
      drm/i915/mtl: Remove misleading "clock" field from C20 pll_state
      drm/i915/mtl: Rename the link_bit_rate to clock in C20 pll_state

Rahul Rameshbabu (1):
      drm/i915/irq: Improve error logging for unexpected DE Misc interrupts

Rajneesh Bhardwaj (1):
      drm/ttm: Schedule delayed_delete worker closer

Ramesh Errabolu (1):
      dma-buf: Correct the documentation of name and exp_name symbols

Ran Shi (1):
      drm/amd/display: allow DP40 cables to do UHBR13.5

Randy Dunlap (6):
      drm/fourcc: fix spelling/typos
      drm/drm_modeset_helper_vtables.h: fix typos/spellos
      drm/uapi: drm_mode.h: fix spellos and grammar
      drm/i915/uapi: fix typos/spellos and punctuation
      drm/gpuvm: fix all kernel-doc warnings in include/drm/drm_gpuvm.h
      drm/imagination: pvr_device.h: fix all kernel-doc warnings

Relja Vojvodic (5):
      drm/amd/display: Add ODM check during pipe split/merge validation
      drm/amd/display: Added delay to DPM log
      drm/amd/display: Add more mechanisms for tests
      drm/amd/display: Add log end specifier
      drm/amd/display: Fixing stream allocation regression

Revalla (1):
      drm/amd/display: Refactor INIT into component folder

Riana Tauro (5):
      drm/xe: Fix overflow in vram manager
      drm/xe/guc_pc: Reorder forcewake and xe_pm_runtime calls
      drm/xe: Fix GT looping for standalone media
      drm/xe: add a new sysfs directory for gtidle properties
      drm/xe: remove gucrc disable from suspend path

Richard Acayan (6):
      fbdev/simplefb: Suppress error on missing power domains
      dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
      dt-bindings: display/msm: sdm845-dpu: Describe SDM670
      dt-bindings: display: msm: Add SDM670 MDSS
      drm/msm: mdss: add support for SDM670
      drm/msm/dpu: Add hw revision 4.1 (SDM670)

Rob Clark (20):
      drm/msm/gpu: Move gpu devcore's to gpu device
      drm/msm: Reduce fallout of fence signaling vs reclaim hangs
      drm/msm/gpu: Skip retired submits in recover worker
      drm/msm: Small uabi fixes
      drm/msm/gem: Add metadata
      drm/msm/gem: Demote userspace errors to DRM_UT_DRIVER
      drm/msm/gem: Demote allocations to __GFP_NOWARN
      drm/syncobj: Add deadline support for syncobj waits
      dma-buf/sync_file: Add SET_DEADLINE ioctl
      dma-buf/sw_sync: Add fence deadline support
      drm/msm/dpu: Correct UBWC settings for sc8280xp
      Merge remote-tracking branch 'drm-misc/drm-misc-next' into msm-next
      drm/msm/gem: Remove "valid" tracking
      drm/msm/gem: Remove submit_unlock_unpin_bo()
      drm/msm/gem: Don't queue job to sched in error cases
      drm/msm/gem: Split out submit_unpin_objects() helper
      drm/msm/gem: Cleanup submit_cleanup_bo()
      drm/exec: Pass in initial # of objects
      drm/msm/gem: Convert to drm_exec
      drm/msm/dpu: Ratelimit framedone timeout msgs

Rob Herring (2):
      drm: Use device_get_match_data()
      drm/bridge: aux-hpd: Replace of_device.h with explicit include

Robin Murphy (1):
      drm/mediatek: Stop using iommu_present()

Rodrigo Siqueira (3):
      drm/amd/display: Add missing chips for HDCP
      drm/amd/display: Adjust code style
      drm/amd/display: Update code comment to be more accurate

Rodrigo Vivi (70):
      drm/doc/rfc: Mark drm_scheduler as completed
      drm/doc/rfc: Move Xe 'ASYNC VM_BIND' to the 'completed' section
      drm/doc/rfc: Move userptr integration and vm_bind to the
'completed' section
      drm/doc/rfc: Xe is using drm_exec, so mark as completed
      drm/xe: Implement a local xe_mmio_wait32
      drm/xe: Stop using i915's range_overflows_t macro.
      drm/xe: Let's return last value read on xe_mmio_wait32.
      drm/xe: Convert guc_ready to regular xe_mmio_wait32
      drm/xe: Wait for success on guc done.
      drm/xe: Remove i915_utils dependency from xe_guc_pc.
      drm/xe: Stop using i915_utils in xe_wopcm.
      drm/xe: Let's avoid i915_utils in the xe_force_wake.
      drm/xe: Convert xe_mmio_wait32 to us so we can stop using wait_for_us=
.
      drm/xe: Remove i915_utils dependency from xe_pcode.
      drm/xe/guc_pc: Fix Meteor Lake registers.
      drm/xe: Remove unseless xe_force_wake_prune.
      drm/xe: Update comment on why d3cold is still blocked.
      drm/xe: Fix print of RING_EXECLIST_SQ_CONTENTS_HI
      drm/xe: Introduce the dev_coredump infrastructure.
      drm/xe: Do not take any action if our device was removed.
      drm/xe: Extract non mapped regions out of GuC CTB into its own struct=
.
      drm/xe: Convert GuC CT print to snapshot capture and print.
      drm/xe: Add GuC CT snapshot to xe_devcoredump.
      drm/xe: Introduce guc_submit_types.h with relevant structs.
      drm/xe: Convert GuC Engine print to snapshot capture and print.
      drm/xe: Add GuC Submit Engine snapshot to xe_devcoredump.
      drm/xe: Convert Xe HW Engine print to snapshot capture and print.
      drm/xe: Add HW Engine snapshot to xe_devcoredump.
      drm/xe: Limit CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.
      drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC
      drm/xe: Invert guc vs execlists parameters and info.
      drm/xe: Fix an invalid locking wait context bug
      drm/xe: Invert mask and val in xe_mmio_wait32.
      drm/xe: Only set PCI d3cold_allowed when we are really allowing.
      drm/xe: Move d3cold_allowed decision all together.
      drm/xe: Fix the runtime_idle call and d3cold.allowed decision.
      drm/xe: Only init runtime PM after all d3cold config is in place.
      drm/xe: Ensure memory eviction on s2idle.
      drm/xe/uapi: Typo lingo and other small backwards compatible fixes
      drm/xe/uapi: Remove useless max_page_size
      drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
      drm/xe/uapi: Document drm_xe_query_gt
      drm/xe/uapi: Replace useless 'instance' per unique gt_id
      drm/xe/uapi: Remove unused field of drm_xe_query_gt
      drm/xe/uapi: Rename gts to gt_list
      drm/xe/uapi: Remove GT_TYPE_REMOTE
      drm/xe/uapi: Kill VM_MADVISE IOCTL
      drm/xe/uapi: Rename *_mem_regions masks
      drm/xe/uapi: Rename query's mem_usage to mem_regions
      drm/xe/uapi: Standardize the FLAG naming and assignment
      drm/xe/uapi: Differentiate WAIT_OP from WAIT_MASK
      drm/xe/uapi: Be more specific about the vm_bind prefetch region
      drm/xe/uapi: Separate bo_create placement from flags
      drm/xe/uapi: Split xe_sync types from flags
      drm/xe/uapi: Kill tile_mask
      drm/xe/uapi: Crystal Reference Clock updates
      drm/xe/uapi: Add Tile ID information to the GT info query
      drm/xe/uapi: Fix various struct padding for 64b alignment
      drm/xe/uapi: Move xe_exec after xe_exec_queue
      drm/xe: Remove unused extension definition
      drm/xe/uapi: Kill exec_queue_set_property
      drm/xe: Create a xe_gt_freq component for raw management and sysfs
      drm/xe: Remove vram size info from sysfs
      drm/xe/uapi: Ensure every uapi struct has drm_xe prefix
      drm/xe/uapi: Order sections
      drm/xe/uapi: More uAPI documentation additions and cosmetic updates
      drm/xe/uapi: Document the memory_region bitmask
      drm/xe/uapi: Remove reset uevent for now
      MAINTAINERS: Updates to Intel DRM
      drm/xe: Fix build without CONFIG_FAULT_INJECTION

Roman Li (3):
      drm/amd/display: Fix array-index-out-of-bounds in dml2
      drm/amd/display: Disable IPS by default
      drm/amd/display: enable dcn35 idle power optimization

Ruthuvikas Ravikumar (1):
      drm/xe: Add mocs kunit

RutingZhang (1):
      drm/amd/display: remove unnecessary braces to fix coding style

Saleemkhan Jamadar (1):
      drm/amdgpu/jpeg: configure doorbell for each playback

Sam James (2):
      drm: i915: Adapt to -Walloc-size
      amdgpu: Adjust kmalloc_array calls for new -Walloc-size

Samson Tam (2):
      drm/amd/display: do not send commands to DMUB if DMUB is inactive fro=
m S3
      drm/amd/display: skip error logging when DMUB is inactive from S3

Sarah Walker (17):
      dt-bindings: gpu: Add Imagination Technologies PowerVR/IMG GPU
      drm/imagination/uapi: Add PowerVR driver UAPI
      drm/imagination: Add skeleton PowerVR driver
      drm/imagination: Get GPU resources
      drm/imagination: Add GPU register headers
      drm/imagination: Add firmware and MMU related headers
      drm/imagination: Add FWIF headers
      drm/imagination: Add GPU ID parsing and firmware loading
      drm/imagination: Implement power management
      drm/imagination: Implement firmware infrastructure and META FW suppor=
t
      drm/imagination: Implement MIPS firmware processor and MMU support
      drm/imagination: Implement free list and HWRT create and destroy ioct=
ls
      drm/imagination: Implement context creation/destruction ioctls
      drm/imagination: Implement job submission and scheduling
      drm/imagination: Add firmware trace header
      drm/imagination: Add firmware trace to debugfs
      drm/imagination: Add driver documentation

Shekhar Chauhan (6):
      drm/xe/dg2: Remove Wa_15010599737
      drm/xe: Add Wa_18028616096
      drm/xe: Add new DG2 PCI IDs
      drm/xe/dg2: Remove one PCI ID
      drm/xe: Add performance tuning settings for MTL and Xe2
      drm/xe/xelpmp: Extend Wa_22016670082 to Xe_LPM+

Sheng-Liang Pan (1):
      drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,836X2,
NV116WHM-N49 V8.0

Shiwu Zhang (1):
      drm/amdgpu: expose the connected port num info through sysfs

Simon Ser (5):
      drm: extract closefb logic in separate function
      drm: introduce CLOSEFB IOCTL
      drm/doc: describe PATH format for DP MST
      drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
      drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP

Soumya Negi (1):
      drm/i915/gt: Remove {} from if-else

Srinivasan Shanmugam (17):
      drm/amdgpu: Refactor 'amdgpu_connector_dvi_detect' in amdgpu_connecto=
rs.c
      drm/amdgpu: Add function parameter 'xcc_mask' not described in
'amdgpu_vm_flush_compute_tlb'
      drm/amd/display: Remove redundant DRM device struct in
amdgpu_dm_, mst_types.c
      drm/amdgpu: Cleanup indenting in amdgpu_connector_dvi_detect()
      drm/amdgpu: Use kzalloc instead of kmalloc+__GFP_ZERO in amdgpu_ras.c
      drm/amdgpu: Use kvcalloc instead of kvmalloc_array in
amdgpu_cs_parser_bos()
      drm/amd/display: Address function parameter 'context' not
described in 'dc_state_rem_all_planes_for_stream' &
'populate_subvp_cmd_drr_info'
      drm/amd/display: Adjust kdoc for 'dcn35_hw_block_power_down' &
'dcn35_hw_block_power_up'
      drm/amdgpu: Drop redundant unsigned >=3D0 comparision
'amdgpu_gfx_rlc_init_microcode()'
      drm/amdgpu: Fix possible NULL dereference in
amdgpu_ras_query_error_status_helper()
      drm/amdkfd: Fix type of 'dbg_flags' in 'struct kfd_process'
      drm/amdgpu: Remove unreachable code in 'atom_skip_src_int()'
      drm/amdgpu: Fix variable 'mca_funcs' dereferenced before NULL
check in 'amdgpu_mca_smu_get_mca_entry()'
      drm/amdgpu: Fix '*fw' from request_firmware() not released in
'amdgpu_ucode_request()'
      drm/amdkfd: Confirm list is non-empty before utilizing
list_first_entry in kfd_topology.c
      drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'
      drm/amdkfd: Fix iterator used outside loop in 'kfd_add_peer_prop()'

Stanislav Lisovskiy (1):
      drm/i915: Query compressed bpp properly using correct DPCD and
DP Spec info

Stanislaw Gruszka (9):
      accel/ivpu: Remove unneeded drm_driver declaration
      accel/ivpu/37xx: Print warning when VPUIP is not idle during power do=
wn
      accel/ivpu: Assure device is off if power up sequence fail
      accel/ivpu: Stop job_done_thread on suspend
      accel/ivpu: Abort pending rx ipc on reset
      accel/ivpu: Rename cons->rx_msg_lock
      accel/ivpu: Do not use irqsave in ivpu_ipc_dispatch
      accel/ivpu: Do not use cons->aborted for job_done_thread
      accel/ivpu: Use dedicated work for job timeout detection

Stanley.Yang (1):
      drm/amdgpu: Fix ecc irq enable/disable unpaired

Stefan Eichenberger (3):
      drm/bridge: lt8912b: Add suspend/resume support
      dt-bindings: display: bridge: lt8912b: Add power supplies
      drm/bridge: lt8912b: Add power supplies

Stephen Rothwell (1):
      drm: using mul_u32_u32() requires linux/math64.h

Steven Price (1):
      drm/panfrost: Remove incorrect IS_ERR() check

Sujaritha Sundaresan (2):
      drm/xe: Change the name of frequency sysfs attributes
      drm/xe: Add frequency throttle reasons sysfs attributes

Sung Joon Kim (2):
      drm/amd/display: Fix black screen on video playback with embedded pan=
el
      drm/amd/display: Exit from idle state before accessing HW data

Suraj Kandpal (4):
      drm/i915/hdcp: Rename HCDP 1.4 enablement function
      drm/i915/hdcp: Convert intel_hdcp_enable to a blanket function
      drm/i915/hdcp: Add more conditions to enable hdcp
      drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe

Swati Sharma (2):
      drm/i915/dsc: Add debugfs entry to validate DSC fractional bpp
      drm/i915/dsc: Allow DSC only with fractional bpp when forced from deb=
ugfs

Taimur Hassan (4):
      drm/amd/display: Remove config update
      drm/amd/display: Fix conversions between bytes and KB
      drm/amd/display: Fix some HostVM parameters in DML
      drm/amd/display: Revert "Fix conversions between bytes and KB"

Tejas Upadhyay (26):
      drm/xe: Add sysfs entry for tile
      drm/xe: Add GTs under respective tile sysfs
      drm/xe: Add sysfs entry to report per tile memory size
      drm/xe: Make usable size of VRAM readable
      drm/xe: make GT sysfs init return void
      drm/xe: make kobject type struct as constant
      drm/xe: Add sysfs entries for engines under its GT
      drm/xe: Add sysfs for default engine scheduler properties
      drm/xe: Add job timeout engine property to sysfs
      drm/xe: Add timeslice duration engine property to sysfs
      drm/xe: Add sysfs for preempt reset timeout
      drm/xe: Add min/max cap for engine scheduler properties
      drm/xe: Add drm-client infrastructure
      drm/xe: Interface xe drm client with fdinfo interface
      drm/xe: Add tracking support for bos per client
      drm/xe: Record each drm client with its VM
      drm/xe: Track page table memory usage for client
      drm/xe: Account ring buffer and context state storage
      drm/xe: Implement fdinfo memory stats printing
      drm/xe/xe2: Add workaround 14017421178
      drm/xe/xe2: Add workaround 16021867713
      drm/xe/xe2: Add workaround 14019449301
      drm/xe/xe2: Add workaround 14020013138
      drm/xe/xe2: Add workaround 16020292621
      drm/xe/xe2: Add workaround 14019988906
      drm/xe/xe2: Add workaround 18032095049 and 16021639441

Thierry Reding (2):
      fbdev/simplefb: Support memory-region property
      fbdev/simplefb: Add support for generic power-domains

Thomas Hellstr=C3=B6m (42):
      Documentation/gpu: VM_BIND locking document
      drm/xe/migrate: Add kerneldoc for the migrate subsystem
      drm/xe/tests: Remove CONFIG_FB dependency
      drm/xe/tests: Grab a memory access reference around the migrate
sanity test
      drm/xe/vm: Use the correct vma destroy sequence on userptr failure
      drm/xe: Use a define to set initial seqno for fences
      drm/xe/migrate: Update cpu page-table updates
      drm/xe/tests: Support CPU page-table updates in the migrate test
      drm/xe: Introduce xe_engine_is_idle()
      drm/xe: Use a small negative initial seqno
      drm/xe/tests: Test both CPU- and GPU page-table updates with the
migrate test
      drm/xe/vm: Defer vm rebind until next exec if nothing to execute
      drm/xe: Fix the migrate selftest for integrated GPUs
      drm/xe: Support copying of data between system memory bos
      drm/xe: Invalidate TLB also on bind if in scratch page mode
      drm/xe: Emit a render cache flush after each rcs/ccs batch
      drm/xe/bo: Fix swapin when moving to VRAM
      drm/xe/bo: Avoid creating a system resource when allocating a
fresh VRAM bo
      drm/xe/bo: Gracefully handle errors from ttm_bo_move_accel_cleanup().
      drm/xe/bo: Evict VRAM to TT rather than to system
      drm/xe: Fix vm refcount races
      drm/xe: Make page-table updates using the default engine happen in or=
der
      drm/xe: Introduce a range-fence utility
      drm/xe/bo: Simplify xe_bo_lock()
      drm/xe/vm: Simplify and document xe_vm_lock()
      drm/xe/bo: Remove the lock_no_vm()/unlock_no_vm() interface
      drm/xe: Rework xe_exec and the VM rebind worker to use the drm_exec h=
elper
      drm/xe: Convert pagefaulting code to use drm_exec
      drm/xe: Convert remaining instances of ttm_eu_reserve_buffers to drm_=
exec
      drm/xe: Reinstate pipelined fence enable_signaling
      drm/xe: Disallow pinning dma-bufs in VRAM
      drm/xe: Update SPDX deprecated license identifier
      drm/xe: Ensure that we don't access the placements array out-of-bound=
s
      drm/xe/bo: Rename xe_bo_get_sg() to xe_bo_sg()
      drm/xe/bo: Remove leftover trace_printk()
      drm/xe/vm: Fix ASID XA usage
      drm/xe: Internally change the compute_mode and no_dma_fence mode nami=
ng
      drm/xe/uapi: Use LR abbrev for long-running vms
      drm/xe: Restrict huge PTEs to 1GiB
      drm/xe: Use NULL PTEs as scratch PTEs
      drm/xe: Use DRM GPUVM helpers for external- and evicted objects
      drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm

Thomas Zimmermann (73):
      drm/format-helper: Cache buffers with struct drm_format_conv_state
      drm/atomic-helper: Add format-conversion state to shadow-plane state
      drm/format-helper: Pass format-conversion state to helpers
      drm/ofdrm: Preallocate format-conversion buffer in atomic_check
      drm/simpledrm: Preallocate format-conversion buffer in atomic_check
      drm/ssd130x: Preallocate format-conversion buffer in atomic_check
      drm: Remove struct drm_flip_task from DRM interfaces
      drm: Fix flip-task docs
      drm/client: Do not acquire module reference
      Merge drm/drm-next into drm-misc-next
      drm/ast: Turn ioregs_lock to modeset_lock
      drm/ast: Rework I/O register setup
      drm/ast: Retrieve I/O-memory ranges without ast device
      drm/ast: Add I/O helpers without ast device
      drm/ast: Enable VGA without ast device instance
      drm/ast: Enable MMIO without ast device instance
      drm/ast: Partially implement POST without ast device instance
      drm/ast: Add enum ast_config_mode
      drm/ast: Detect ast device type and config mode without ast device
      drm/ast: Move detection code into PCI probe helper
      fbdev/acornfb: Fix name of fb_ops initializer macro
      fbdev/sm712fb: Use correct initializer macros for struct fb_ops
      fbdev/vfb: Set FBINFO_VIRTFB flag
      fbdev/vfb: Initialize fb_ops with fbdev macros
      fbdev/arcfb: Set FBINFO_VIRTFB flag
      fbdev/arcfb: Use generator macros for deferred I/O
      auxdisplay/cfag12864bfb: Set FBINFO_VIRTFB flag
      auxdisplay/cfag12864bfb: Initialize fb_ops with fbdev macros
      auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
      auxdisplay/ht16k33: Initialize fb_ops with fbdev macros
      hid/picolcd_fb: Set FBINFO_VIRTFB flag
      fbdev/sh_mobile_lcdcfb: Set FBINFO_VIRTFB flag
      fbdev/sh_mobile_lcdcfb: Initialize fb_ops with fbdev macros
      fbdev/smscufx: Select correct helpers
      fbdev/udlfb: Select correct helpers
      fbdev/au1200fb: Set FBINFO_VIRTFB flag
      fbdev/au1200fb: Initialize fb_ops with fbdev macros
      fbdev/ps3fb: Set FBINFO_VIRTFB flag
      fbdev/ps3fb: Initialize fb_ops with fbdev macros
      media/ivtvfb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/clps711x-fb: Initialize fb_ops with fbdev macros
      fbdev/vt8500lcdfb: Initialize fb_ops with fbdev macros
      fbdev/wm8505fb: Initialize fb_ops to fbdev I/O-memory helpers
      fbdev/cyber2000fb: Initialize fb_ops with fbdev macros
      staging/sm750fb: Declare fb_ops as constant
      staging/sm750fb: Initialize fb_ops with fbdev macros
      fbdev: Rename FB_SYS_FOPS token to FB_SYSMEM_FOPS
      fbdev: Remove trailing whitespaces
      fbdev: Push pgprot_decrypted() into mmap implementations
      fbdev: Move default fb_mmap code into helper function
      fbdev: Warn on incorrect framebuffer access
      fbdev: Remove default file-I/O implementations
      drm: Fix TODO list mentioning non-KMS drivers
      drm: Include <drm/drm_auth.h>
      drm/i915: Include <drm/drm_auth.h>
      accel: Include <drm/drm_auth.h>
      drm: Include <drm/drm_device.h>
      drm/radeon: Do not include <drm/drm_legacy.h>
      drm: Remove entry points for legacy ioctls
      drm: Remove the legacy DRM_IOCTL_MODESET_CTL ioctl
      drm: Remove support for legacy drivers
      drm: Remove locking for legacy ioctls and DRM_UNLOCKED
      drm: Remove source code for non-KMS drivers
      char/agp: Remove frontend code
      drm: Remove Kconfig option for legacy support (CONFIG_DRM_LEGACY)
      drm/plane-helper: Move drm_plane_helper_atomic_check() into udl
      drm/amdgpu: Do not include <drm/drm_plane_helper.h>
      drm/loongson: Do not include <drm/drm_plane_helper.h>
      drm/shmobile: Do not include <drm/drm_plane_helper.h>
      drm/solomon: Do not include <drm/drm_plane_helper.h>
      drm/ofdrm: Do not include <drm/drm_plane_helper.h>
      drm/simpledrm: Do not include <drm/drm_plane_helper.h>
      drm/xlnx: Do not include <drm/drm_plane_helper.h>

Tim Huang (1):
      drm/amdgpu: fix memory overflow in the IB test

Tom Chung (1):
      drm/amd/display: Add some functions for Panel Replay

Tom St Denis (1):
      drm/amd/amdgpu: Add SMUIO headers for 10.0.2

Tomasz Rusinowicz (1):
      accel/ivpu: Add dvfs_mode file to debugfs

Tomer Tayar (8):
      accel/habanalabs/gaudi2: assume hard-reset by FW upon PCIe AXI drain
      accel/habanalabs: set hard reset flag if graceful reset is skipped
      accel/habanalabs/gaudi2: get the correct QM CQ info upon an error
      accel/habanalabs/gaudi2: use correct registers to dump QM CQ info
      accel/habanalabs/gaudi2: add zero padding when printing QM CP instruc=
tion
      accel/habanalabs: update debugfs-driver-habanalabs with the
device-name directory
      accel/habanalabs: add parent_device sysfs attribute
      accel/habanalabs/gaudi2: avoid overriding existing undefined opcode d=
ata

Tomi Valkeinen (19):
      Revert "drm/tidss: Annotate dma-fence critical section in commit path=
"
      Revert "drm/omapdrm: Annotate dma-fence critical section in commit pa=
th"
      drm/tilcdc: Fix irq free on unload
      drm/tidss: Use pm_runtime_resume_and_get()
      drm/tidss: Use PM autosuspend
      drm/tidss: Drop useless variable init
      drm/tidss: Move reset to the end of dispc_init()
      drm/tidss: Return error value from from softreset
      drm/tidss: Check for K2G in in dispc_softreset()
      drm/tidss: Add simple K2G manual reset
      drm/tidss: Fix dss reset
      drm/tidss: IRQ code cleanup
      drm/tidss: Fix atomic_flush check
      drm/tidss: Use DRM_PLANE_COMMIT_ACTIVE_ONLY
      drm/drm_file: fix use of uninitialized variable
      drm/framebuffer: Fix use of uninitialized variable
      drm/bridge: cdns-mhdp8546: Fix use of uninitialized variable
      drm/bridge: tc358767: Fix return value on error case
      drm/mipi-dsi: Fix detach call without attach

Tony Lindgren (2):
      dt-bindings: display: simple: Add boe,bp101wx1-100 panel
      drm/panel: simple: Add BOE BP101WX1-100 panel

Tvrtko Ursulin (20):
      Merge drm/drm-next into drm-intel-gt-next
      drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
      drm/sched: Move free worker re-queuing out of the if block
      drm/sched: Rename drm_sched_free_job_queue to be more descriptive
      drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify kernel=
doc
      drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
      drm/i915: Remove unused for_each_uabi_class_engine
      drm/i915: Move for_each_engine* out of i915_drv.h
      drm: Do not round to megabytes for greater than 1MiB sizes in fdinfo =
stats
      drm/i915: Add ability for tracking buffer objects per client
      drm/i915: Record which client owns a VM
      drm/i915: Track page table backing store usage
      drm/i915: Account ring buffer and context state storage
      drm/i915: Add stable memory region names
      drm/i915: Implement fdinfo memory stats printing
      drm/i915: Remove return type from i915_drm_client_remove_object
      drm/i915: Add __rcu annotation to cursor when iterating client object=
s
      drm/i915/gsc: Mark internal GSC engine with reserved uabi class
      drm/i915/selftests: Fix engine reset count storage for multi-tile
      drm/i915: Use internal class when counting engine resets

Uma Shankar (1):
      drm/xe/display: Create a dummy version for vga decode

Umesh Nerlige Ramappa (4):
      drm/i915/pmu: Check if pmu is closed before stopping event
      drm/xe: Fix array bounds check for queries
      drm/xe: Set the correct type for xe_to_user_engine_class
      drm/xe: Correlate engine and cpu timestamps with better accuracy

Uwe Kleine-K=C3=B6nig (19):
      drm/bridge: tpd12s015: Drop buggy __exit annotation for remove functi=
on
      drm/arcpgu: Convert to platform remove callback returning void
      drm/armada: Convert to platform remove callback returning void
      drm/bridge: cdns-mhdp8546: Improve error reporting in remove callback
      drm/bridge: cdns-mhdp8546: Convert to platform remove callback
returning void
      drm/bridge: tpd12s015: Convert to platform remove callback returning =
void
      drm/etnaviv: Convert to platform remove callback returning void
      drm/imx/dcss: Convert to platform remove callback returning void
      drm/imx: lcdc: Convert to platform remove callback returning void
      drm/kmb: Convert to platform remove callback returning void
      drm/mediatek: Convert to platform remove callback returning void
      drm/meson: Convert to platform remove callback returning void
      drm/nouveau: Convert to platform remove callback returning void
      drm/sprd: Convert to platform remove callback returning void
      drm/tilcdc: Convert to platform remove callback returning void
      drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()
      drm/imx/lcdc: Fix double-free of driver data
      drm/bridge: ti-sn65dsi86: Associate PWM device to auxiliary device
      drm/exynos: Convert to platform remove callback returning void

Vandita Kulkarni (1):
      drm/i915/dsc/mtl: Add support for fractional bpp

Vignesh Chander (1):
      drm/amdgpu: xgmi_fill_topology_info

Vignesh Raman (10):
      drm: ci: igt_runner: Remove todo
      drm: ci: Force db410c to host mode
      drm: ci: arm64.config: Enable DA9211 regulator
      drm: ci: Enable new jobs
      drm: ci: Use scripts/config to enable/disable configs
      drm: ci: mt8173: Do not set IGT_FORCE_DRIVER to panfrost
      drm: ci: virtio: Make artifacts available
      drm: ci: uprev IGT
      drm/doc: ci: Add IGT version details for flaky tests
      drm: ci: Update xfails

Ville Syrj=C3=A4l=C3=A4 (74):
      drm/i915/bios: Clamp VBT HDMI level shift on BDW
      drm/i915: Use named initializers for DPLL info
      drm/i915: Abstract the extra JSL/EHL DPLL4 power domain better
      drm/i915: Move the DPLL extra power domain handling up one level
      drm/i915: Extract _intel_{enable,disable}_shared_dpll()
      drm/i915: Move the g45 PEG band gap HPD workaround to the HPD code
      drm/i915/mst: Swap TRANSCONF vs. FECSTALL_DIS_DPTSTREAM_DPTTG disable
      drm/i915/mst: Disable transcoder before deleting the payload
      drm/i915/mst: Clear ACT just before triggering payload allocation
      drm/i915/mst: Always write CHICKEN_TRANS
      drm/i915: Bump GLK CDCLK frequency when driving multiple pipes
      drm/i915: Extract hsw_chicken_trans_reg()
      drm/i915: Stop using a 'reg' variable
      drm/i915: Extract mchbar_reg()
      drm/i915/dsi: Remove dead GLK checks
      drm/i915/dsi: Extract port_ctrl_reg()
      drm/dp_mst: Fix fractional DSC bpp handling
      drm/i915: Drop redundant !modeset check
      drm/i915: Split intel_update_crtc() into two parts
      drm/i915: Do plane/etc. updates more atomically across pipes
      drm/i915/gvt: Clean up zero initializers
      drm/i915: Also check for VGA converter in eDP probe
      drm/i915/fbc: Split plane size vs. surface size checks apart
      drm/i915/fbc: Bump max surface size to 8kx4k on icl+
      drm/i915/fbc: Bump ivb FBC max surface size to 4kx4k
      drm/i915: Check pipe active state in {planes,vrr}_{enabling,disabling=
}()
      drm/i915: Call intel_pre_plane_updates() also for pipes getting enabl=
ed
      drm/i915: Polish some RMWs
      drm/i915: Push audio enable/disable further out
      drm/i915: Wrap g4x+ DP/HDMI audio enable/disable
      drm/i915: Split g4x+ DP audio presence detect from port enable
      drm/i915: Split g4x+ HDMI audio presence detect from port enable
      drm/i915: Convert audio enable/disable into encoder vfuncs
      drm/i915: Hoist the encoder->audio_{enable,disable}() calls higher up
      drm/i915: Push audio_{enable,disable}() to the pre/post pane update s=
tage
      drm/i915: Implement audio fastset
      drm: Fix color LUT rounding
      drm/i915: Adjust LUT rounding rules
      drm/i915: s/clamp()/min()/ in i965_lut_11p6_max_pack()
      drm/i915: Fix glk+ degamma LUT conversions
      drm/i915: Stop printing pipe name as hex
      drm/i915: Move the SDP split debug spew to the correct place
      drm/i915/psr: Include some basic PSR information in the state dump
      drm/i915: Skip some timing checks on BXT/GLK DSI transcoders
      drm/i915/mst: Fix .mode_valid_ctx() return values
      drm/i915/mst: Reject modes that require the bigjoiner
      drm/i915: Clean up some DISPLAY_VER checks
      drm/i915: Fix ADL+ tiled plane stride when the POT stride is
smaller than the original
      drm/i915: Fix remapped stride with CCS on ADL+
      drm/i915: Fix intel_atomic_setup_scalers() plane_state handling
      drm/i915: Streamline intel_dsc_pps_read()
      drm/i915: Drop redundant NULL check
      drm/i915: Drop crtc NULL check from intel_crtc_active()
      drm/i915: Drop NULL fb check from intel_fb_uses_dpt()
      drm/i915: Drop redunant null check from intel_get_frame_time_us()
      drm/i915: s/cstate/crtc_state/ in intel_get_frame_time_us()
      drm/i915/tv: Drop redundant null checks
      drm/i915: Stop accessing crtc->state from the flip done irq
      drm/i915: Drop irqsave/restore for flip_done_handler()
      drm/i915: Reject async flips with bigjoiner
      drm/i915/cdclk: s/-1/~0/ when dealing with unsigned values
      drm/i915/cdclk: Give the squash waveform length a name
      drm/i915/cdclk: Remove the assumption that cdclk divider=3D=3D2 when
using squashing
      drm/i915/cdclk: Rewrite cdclk->voltage_level selection to use tables
      drm/i915/mtl: Fix voltage_level for cdclk=3D=3D480MHz
      drm/i915: Split intel_ddi_compute_min_voltage_level() into
platform variants
      drm/i915/mtl: Calculate the correct voltage level from port_clock
      drm/i915: Simplify intel_ddi_compute_min_voltage_level()
      drm/i915/dmc: Don't enable any pipe DMC events
      drm/i915/dmc: Also disable the flip queue event on TGL main DMC
      drm/i915/dmc: Also disable HRR event on TGL/ADLS main DMC
      drm/i915/dmc: Print out the DMC mmio register list at fw load time
      drm: Don't unref the same fb many times by mistake due to
deadlock handling
      drm: Warn when freeing a framebuffer that's still on a list

Vinay Belgaumkar (6):
      drm/i915: Read a shadowed mmio register for ggtt flush
      drm/xe: Raise GT frequency before GuC/HuC load
      drm/xe: Rename xe_gt_idle_sysfs to xe_gt_idle
      drm/xe: Add skip_guc_pc flag
      drm/xe: Manually setup C6 when skip_guc_pc is set
      drm/xe: Check skip_guc_pc before disabling gucrc

Vinod Govindapillai (4):
      drm/i915/display: debugfs entry to list display capabilities
      drm/i915: remove display device info from i915 capabilities
      drm/i915/xe2lpd: implement WA for underruns while enabling FBC
      drm/i915/xe2lpd: remove the FBC restriction if PSR2 is enabled

Vitaly Lubart (3):
      drm/xe/gsc: add HECI2 register offsets
      drm/xe/gsc: add has_heci_gscfi indication to device
      drm/xe/gsc: add gsc device support

Wang, Beyond (1):
      drm/amdgpu: fix ftrace event amdgpu_bo_move always move on same heap

Wayne Lin (3):
      drm/amd/display: adjust flow for deallocation mst payload
      drm/amd/display: Add case for dcn35 to support usb4 dmub hpd event
      drm/amd/display: pbn_div need be updated for hotplug event

Wenjing Liu (6):
      drm/amd/display: Try to acquire a free OTG master not used in
cur ctx first
      drm/amd/display: Prefer currently used OTG master when acquiring free=
 pipe
      drm/amd/display: fix a pipe mapping error in dcn32_fpu
      drm/amd/display: update pixel clock params after stream slice
count change in context
      drm/amd/display: always use mpc factor of 2 for stereo timings
      drm/amd/display: add support for DTO genarated dscclk

Woody Suwalski (1):
      drm/radeon: Prevent multiple debug error lines on suspend

Xiaogang Chen (2):
      drm/amdkfd: Use partial migrations/mapping for GPU/CPU page faults in=
 SVM
      drm/amdkfd: Use partial hmm page walk during buffer validation in SVM

Xin Ji (2):
      Revert "drm/bridge: Add 200ms delay to wait FW HPD status stable"
      drm/bridge: anx7625: Fix Set HPD irq detect window to 2ms

Xingyuan Mo (1):
      accel/habanalabs: fix information leak in sec_attest_info()

Yang Li (5):
      drm/nouveau/fifo: Remove duplicated include in chan.c
      drm/imagination: Remove unneeded semicolon
      drm/mediatek: Use devm_platform_ioremap_resource()
      drm/imagination: Remove unneeded semicolon
      drm/amd/pm: Remove unneeded semicolon

Yang Wang (5):
      drm/amdgpu: correct mca ipid die/socket/addr decode
      drm/amdgpu: Fix missing mca debugfs node
      drm/amdgpu: enable mca debug mode on APU by default
      drm/amd/pm: support new mca smu error code decoding
      drm/amdgpu: optimize the printing order of error data

Yang Yingliang (1):
      drm/radeon: check the alloc_workqueue return value in radeon_crtc_ini=
t()

YiPeng Chai (4):
      drm/amdgpu: MCA supports recording umc address information
      drm/amdgpu: Add poison mode check error condition for umc v12_0
      drm/amd/pm: smu v13_0_6 supports ecc info by default
      drm/amdgpu: Add umc page retirement for umc v12_0

Yihan Zhu (2):
      drm/amd/display: Enable CM low mem power optimization
      drm/amd/display: add MPC MCM 1D LUT clock gating programming

Yuran Pereira (1):
      drm/nouveau: Removes unnecessary args check in nouveau_uvmm_sm_prepar=
e

Zack Rusin (8):
      drm: Disable the cursor plane on atomic contexts with virtualized dri=
vers
      drm/atomic: Add support for mouse hotspots
      drm/vmwgfx: Use the hotspot properties from cursor planes
      drm/qxl: Use the hotspot properties from cursor planes
      drm/vboxvideo: Use the hotspot properties from cursor planes
      drm/virtio: Use the hotspot properties from cursor planes
      drm: Remove legacy cursor hotspot code
      drm: Introduce DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT

Zbigniew Kempczy=C5=84ski (1):
      drm/xe: Use nanoseconds instead of jiffies in uapi for user fence

Zhanjun Dong (2):
      drm/i915: Skip pxp init if gt is wedged
      drm/xe: Add patch version on guc firmware init

Zhao Liu (9):
      drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
      drm/i915: Use memcpy_[from/to]_page() in gem/i915_gem_pyhs.c
      drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
      drm/i915: Use kmap_local_page() in gem/selftests/huge_pages.c
      drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_coherency.c
      drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_context.c
      drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
      drm/i915: Use kmap_local_page() in i915_cmd_parser.c
      drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c

ZhenGuo Yin (3):
      drm/amdkfd: Free gang_ctx_bo and wptr_bo in pqm_uninit
      drm/amdgpu: Skip access gfx11 golden registers under SRIOV
      drm/amdgpu: re-create idle bo's PTE during VM state machine reset

Zhipeng Lu (7):
      drm/radeon/dpm: fix a memleak in sumo_parse_power_table
      drm/radeon/trinity_dpm: fix a memleak in trinity_parse_power_table
      drm/amd/pm: fix a double-free in si_dpm_init
      drivers/amd/pm: fix a use-after-free in kv_parse_power_table
      gpu/drm/radeon: fix two memleaks in radeon_vm_init
      drm/amd/pm: fix a double-free in amdgpu_parse_extended_power_table
      drm/amd/pm/smu7: fix a memleak in smu7_hwmgr_backend_init

Zhongwei (1):
      drm/amd/display: force toggle rate wa for first link training
for a retimer

farah kassabri (1):
      accel/habanalabs: add pcie reset prepare/done hooks

heminhong (2):
      drm/i915: correct the input parameter on _intel_dsb_commit()
      drm/qxl: remove unused declaration

shaoyunl (2):
      drm/amdgpu: SW part of MES event log enablement
      drm/amdgpu: Enable event log on MES 11

 .mailmap                                           |    1 +
 CREDITS                                            |    8 +
 .../ABI/testing/debugfs-driver-habanalabs          |   72 +-
 Documentation/ABI/testing/sysfs-bus-optee-devices  |    9 +
 Documentation/ABI/testing/sysfs-class-led          |    9 -
 Documentation/ABI/testing/sysfs-driver-habanalabs  |   12 +
 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |   70 +
 Documentation/accel/qaic/aic100.rst                |   11 +-
 Documentation/accel/qaic/qaic.rst                  |   37 +-
 Documentation/arch/loongarch/introduction.rst      |    4 +-
 Documentation/arch/x86/boot.rst                    |    2 +-
 Documentation/core-api/pin_user_pages.rst          |    2 +
 .../bindings/display/bridge/adi,adv7533.yaml       |    6 +
 .../bindings/display/bridge/lontium,lt8912b.yaml   |   21 +
 .../devicetree/bindings/display/fsl,lcdif.yaml     |   20 +-
 .../bindings/display/mediatek/mediatek,dsi.yaml    |    1 -
 .../bindings/display/mediatek/mediatek,ethdr.yaml  |    6 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml        |    6 +-
 .../bindings/display/mediatek/mediatek,merge.yaml  |    3 +
 .../display/mediatek/mediatek,padding.yaml         |   81 +
 .../bindings/display/msm/dp-controller.yaml        |    2 +
 .../bindings/display/msm/dsi-controller-main.yaml  |    3 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |    1 +
 .../bindings/display/msm/mdss-common.yaml          |   18 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |   21 +-
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |   14 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   14 +-
 .../bindings/display/msm/qcom,sdm670-mdss.yaml     |  292 +
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |    4 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   10 +
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     |    8 +-
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |    8 +-
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |    8 +-
 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |    6 +-
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |   10 +
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |   13 +-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  127 +
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |  328 ++
 .../display/panel/fascontek,fs035vg158.yaml        |   56 +
 .../bindings/display/panel/himax,hx8394.yaml       |    3 +
 .../bindings/display/panel/ilitek,ili9805.yaml     |   62 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    1 +
 .../display/panel/leadtek,ltk035c5444t.yaml        |    8 +-
 .../bindings/display/panel/newvision,nv3051d.yaml  |    2 +-
 .../panel/panel-simple-lvds-dual-ports.yaml        |    2 +
 .../bindings/display/panel/panel-simple.yaml       |    4 +
 .../bindings/display/panel/sitronix,st7701.yaml    |    1 +
 .../bindings/display/rockchip/rockchip-vop2.yaml   |  100 +-
 .../bindings/display/ti/ti,am65x-dss.yaml          |   14 +
 .../devicetree/bindings/gpu/arm,mali-utgard.yaml   |    1 +
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |    1 +
 .../devicetree/bindings/gpu/img,powervr.yaml       |   73 +
 .../bindings/interrupt-controller/qcom,mpm.yaml    |    4 +
 .../bindings/net/ethernet-controller.yaml          |    4 +-
 .../devicetree/bindings/perf/riscv,pmu.yaml        |    2 +-
 .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml  |    2 +-
 Documentation/devicetree/bindings/pwm/imx-pwm.yaml |   10 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    1 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml          |    2 +
 .../devicetree/bindings/usb/microchip,usb5744.yaml |    7 +-
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |    4 +-
 Documentation/devicetree/bindings/usb/usb-hcd.yaml |    2 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/filesystems/erofs.rst                |    4 +
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |    5 +-
 Documentation/gpu/amdgpu/display/dc-debug.rst      |   41 +
 .../gpu/amdgpu/display/trace-groups-table.csv      |   29 +
 Documentation/gpu/automated_testing.rst            |    7 +-
 Documentation/gpu/driver-uapi.rst                  |    5 +
 Documentation/gpu/drivers.rst                      |    3 +
 Documentation/gpu/drm-kms-helpers.rst              |    6 +
 Documentation/gpu/drm-kms.rst                      |    8 +
 Documentation/gpu/drm-mm.rst                       |   10 +
 Documentation/gpu/drm-vm-bind-locking.rst          |  582 ++
 Documentation/gpu/imagination/index.rst            |   13 +
 Documentation/gpu/imagination/uapi.rst             |  171 +
 Documentation/gpu/implementation_guidelines.rst    |    1 +
 Documentation/gpu/rfc/xe.rst                       |  132 +-
 Documentation/gpu/todo.rst                         |   47 +-
 Documentation/gpu/xe/index.rst                     |   25 +
 Documentation/gpu/xe/xe_cs.rst                     |    8 +
 Documentation/gpu/xe/xe_debugging.rst              |    7 +
 Documentation/gpu/xe/xe_firmware.rst               |   37 +
 Documentation/gpu/xe/xe_gt_mcr.rst                 |   13 +
 Documentation/gpu/xe/xe_map.rst                    |    8 +
 Documentation/gpu/xe/xe_migrate.rst                |    8 +
 Documentation/gpu/xe/xe_mm.rst                     |   14 +
 Documentation/gpu/xe/xe_pcode.rst                  |   14 +
 Documentation/gpu/xe/xe_pm.rst                     |   14 +
 Documentation/gpu/xe/xe_rtp.rst                    |   20 +
 Documentation/gpu/xe/xe_tile.rst                   |   14 +
 Documentation/gpu/xe/xe_wa.rst                     |   14 +
 Documentation/networking/tcp_ao.rst                |    2 +-
 Documentation/process/maintainer-netdev.rst        |   20 +-
 Documentation/trace/coresight/coresight.rst        |    2 +-
 .../zh_CN/arch/loongarch/introduction.rst          |    4 +-
 MAINTAINERS                                        |  307 +-
 Makefile                                           |    2 +-
 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dts     |    4 +-
 .../dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dts |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi         |    2 +
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |    8 +-
 arch/arm/boot/dts/nxp/mxs/imx28-xea.dts            |    1 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi             |    2 +-
 arch/arm/boot/dts/rockchip/rk322x.dtsi             |    6 +-
 arch/arm/include/asm/kexec.h                       |    4 -
 arch/arm/kernel/Makefile                           |    2 +-
 arch/arm/mach-imx/mmdc.c                           |    7 +-
 arch/arm/xen/enlighten.c                           |    3 +-
 arch/arm64/Makefile                                |    2 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |    5 +-
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi    |    8 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    2 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |    2 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |   11 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |    6 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    2 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   10 +-
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |    2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |    2 +-
 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  |   12 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |   24 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |    4 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |    4 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |    8 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   96 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  242 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi           |   44 +-
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |    2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |    6 +-
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |    2 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |    3 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts  |    4 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |    1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |    6 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |    2 +-
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |    4 +-
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |    1 -
 arch/arm64/include/asm/setup.h                     |   17 +-
 arch/arm64/kernel/cpufeature.c                     |    4 +
 arch/arm64/kvm/vgic/vgic-v4.c                      |    4 +
 arch/arm64/mm/pageattr.c                           |    7 +-
 arch/loongarch/Makefile                            |    5 +-
 arch/loongarch/include/asm/asmmacro.h              |    3 +-
 arch/loongarch/include/asm/elf.h                   |    2 +-
 arch/loongarch/include/asm/loongarch.h             |    5 +-
 arch/loongarch/include/asm/percpu.h                |   11 +-
 arch/loongarch/include/asm/setup.h                 |    2 +-
 arch/loongarch/kernel/relocate.c                   |   10 +-
 arch/loongarch/kernel/stacktrace.c                 |    2 +-
 arch/loongarch/kernel/time.c                       |   23 +-
 arch/loongarch/kernel/unwind.c                     |    1 -
 arch/loongarch/kernel/unwind_prologue.c            |    2 +-
 arch/loongarch/mm/pgtable.c                        |    4 +-
 arch/loongarch/net/bpf_jit.c                       |   18 +-
 arch/mips/Kconfig                                  |    2 +
 arch/mips/include/asm/mach-loongson64/boot_param.h |    9 +-
 arch/mips/kernel/process.c                         |   25 +-
 arch/mips/kernel/smp.c                             |    4 +-
 arch/mips/loongson64/env.c                         |   10 +-
 arch/mips/loongson64/init.c                        |   47 +-
 arch/parisc/Kconfig                                |   13 +-
 arch/parisc/include/asm/alternative.h              |    9 +-
 arch/parisc/include/asm/assembly.h                 |    1 +
 arch/parisc/include/asm/bug.h                      |   38 +-
 arch/parisc/include/asm/elf.h                      |   10 +-
 arch/parisc/include/asm/jump_label.h               |    8 +-
 arch/parisc/include/asm/ldcw.h                     |    2 +-
 arch/parisc/include/asm/processor.h                |    2 +
 arch/parisc/include/asm/uaccess.h                  |    1 +
 arch/parisc/include/uapi/asm/errno.h               |    2 -
 arch/parisc/kernel/processor.c                     |    2 +-
 arch/parisc/kernel/sys_parisc.c                    |    2 +-
 arch/parisc/kernel/vmlinux.lds.S                   |    1 +
 arch/powerpc/kernel/fpu.S                          |   13 +
 arch/powerpc/kernel/process.c                      |    6 +-
 arch/powerpc/kernel/trace/ftrace_entry.S           |    4 +-
 arch/powerpc/kernel/vector.S                       |    2 +
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  |    7 -
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts  |    7 -
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts  |    7 -
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts     |    7 -
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts     |    7 -
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |    1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi            |    1 -
 arch/riscv/errata/andes/errata.c                   |   20 +-
 arch/riscv/kernel/head.S                           |    2 +-
 arch/riscv/kernel/module.c                         |  114 +-
 arch/riscv/kernel/sys_riscv.c                      |    2 +-
 arch/riscv/kernel/tests/module_test/test_uleb128.S |    8 +-
 arch/riscv/kernel/traps_misaligned.c               |    6 +-
 arch/s390/include/asm/processor.h                  |    1 -
 arch/s390/kernel/ipl.c                             |    1 +
 arch/s390/kernel/perf_pai_crypto.c                 |   11 +-
 arch/s390/kernel/perf_pai_ext.c                    |    1 -
 arch/s390/kvm/vsie.c                               |    4 -
 arch/s390/mm/pgtable.c                             |    2 +-
 arch/x86/coco/tdx/tdx.c                            |    1 +
 arch/x86/entry/common.c                            |   93 +-
 arch/x86/entry/entry_64_compat.S                   |   77 -
 arch/x86/events/intel/core.c                       |    2 +-
 arch/x86/hyperv/hv_init.c                          |   25 +-
 arch/x86/include/asm/acpi.h                        |   14 +
 arch/x86/include/asm/ia32.h                        |    7 +
 arch/x86/include/asm/idtentry.h                    |    4 +
 arch/x86/include/asm/proto.h                       |    4 -
 arch/x86/include/asm/xen/hypervisor.h              |    9 +
 arch/x86/kernel/acpi/boot.c                        |   34 +-
 arch/x86/kernel/cpu/amd.c                          |    3 +
 arch/x86/kernel/cpu/microcode/amd.c                |   39 +-
 arch/x86/kernel/cpu/microcode/core.c               |   15 +-
 arch/x86/kernel/cpu/microcode/intel.c              |   17 +-
 arch/x86/kernel/cpu/microcode/internal.h           |   14 +-
 arch/x86/kernel/cpu/mshyperv.c                     |    5 +-
 arch/x86/kernel/idt.c                              |    2 +-
 arch/x86/kernel/sev.c                              |   11 +-
 arch/x86/kernel/signal_64.c                        |    6 +-
 arch/x86/kvm/debugfs.c                             |    1 +
 arch/x86/kvm/svm/svm.c                             |    8 +-
 arch/x86/kvm/x86.c                                 |    9 +-
 arch/x86/mm/mem_encrypt_amd.c                      |   11 +
 arch/x86/net/bpf_jit_comp.c                        |   46 +
 arch/x86/xen/enlighten.c                           |    6 +-
 arch/x86/xen/enlighten_pv.c                        |    2 +-
 arch/x86/xen/xen-asm.S                             |    2 +-
 arch/x86/xen/xen-ops.h                             |    2 +-
 block/bdev.c                                       |    2 +
 block/blk-cgroup.c                                 |   13 +
 block/blk-cgroup.h                                 |    2 -
 block/blk-core.c                                   |   14 +-
 block/blk-mq.c                                     |   89 +-
 block/blk-pm.c                                     |   33 +-
 block/blk-sysfs.c                                  |    2 +
 block/blk-throttle.c                               |    2 +
 drivers/accel/drm_accel.c                          |    1 +
 drivers/accel/habanalabs/common/device.c           |   25 +-
 drivers/accel/habanalabs/common/firmware_if.c      |  123 +-
 drivers/accel/habanalabs/common/habanalabs.h       |   15 +
 drivers/accel/habanalabs/common/habanalabs_drv.c   |   37 +
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |   55 +-
 drivers/accel/habanalabs/common/hwmon.c            |    4 -
 drivers/accel/habanalabs/common/memory.c           |    7 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          |    1 +
 drivers/accel/habanalabs/common/sysfs.c            |   42 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           |   74 +-
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |   13 +-
 .../habanalabs/include/hw_ip/pci/pci_general.h     |    1 +
 drivers/accel/ivpu/Kconfig                         |   11 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |   57 +
 drivers/accel/ivpu/ivpu_drv.c                      |   49 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   18 +-
 drivers/accel/ivpu/ivpu_fw.c                       |   79 +-
 drivers/accel/ivpu/ivpu_fw.h                       |    1 +
 drivers/accel/ivpu/ivpu_gem.c                      |  678 +--
 drivers/accel/ivpu/ivpu_gem.h                      |   75 +-
 drivers/accel/ivpu/ivpu_hw.h                       |   20 +
 drivers/accel/ivpu/ivpu_hw_37xx.c                  |  105 +-
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |    2 +
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |   69 +-
 drivers/accel/ivpu/ivpu_ipc.c                      |  251 +-
 drivers/accel/ivpu/ivpu_ipc.h                      |   33 +-
 drivers/accel/ivpu/ivpu_job.c                      |   99 +-
 drivers/accel/ivpu/ivpu_job.h                      |    4 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |   38 +
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |    1 +
 drivers/accel/ivpu/ivpu_mmu.c                      |   44 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |  153 +-
 drivers/accel/ivpu/ivpu_mmu_context.h              |   11 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   75 +-
 drivers/accel/ivpu/ivpu_pm.h                       |    3 +
 drivers/accel/ivpu/vpu_boot_api.h                  |   90 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |  309 +-
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/mhi_controller.c                |   44 +-
 drivers/accel/qaic/mhi_controller.h                |    2 +-
 drivers/accel/qaic/qaic.h                          |   21 +-
 drivers/accel/qaic/qaic_control.c                  |    7 +-
 drivers/accel/qaic/qaic_data.c                     |  147 +-
 drivers/accel/qaic/qaic_drv.c                      |   98 +-
 drivers/accel/qaic/qaic_timesync.c                 |  395 ++
 drivers/accel/qaic/qaic_timesync.h                 |   11 +
 drivers/acpi/acpi_video.c                          |   16 +-
 drivers/acpi/device_pm.c                           |   13 +
 drivers/acpi/processor_idle.c                      |    2 +-
 drivers/acpi/resource.c                            |    7 +
 drivers/acpi/scan.c                                |    7 +-
 drivers/acpi/utils.c                               |    2 +-
 drivers/ata/libata-scsi.c                          |    9 +-
 drivers/ata/pata_isapnp.c                          |    3 +
 drivers/auxdisplay/Kconfig                         |   10 +-
 drivers/auxdisplay/cfag12864bfb.c                  |   10 +-
 drivers/auxdisplay/ht16k33.c                       |   10 +-
 drivers/base/cpu.c                                 |    6 +-
 drivers/base/devcoredump.c                         |    3 +
 drivers/base/memory.c                              |   18 +-
 drivers/base/regmap/regcache.c                     |    3 +-
 drivers/block/nbd.c                                |  117 +-
 drivers/block/null_blk/main.c                      |   25 +-
 drivers/char/agp/Makefile                          |    6 -
 drivers/char/agp/agp.h                             |    9 -
 drivers/char/agp/backend.c                         |   11 -
 drivers/char/agp/compat_ioctl.c                    |  291 -
 drivers/char/agp/compat_ioctl.h                    |  106 -
 drivers/char/agp/frontend.c                        | 1068 ----
 drivers/cpufreq/amd-pstate.c                       |   71 +-
 drivers/cpufreq/imx6q-cpufreq.c                    |    2 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c               |   73 +-
 drivers/dma-buf/dma-buf.c                          |    4 +-
 drivers/dma-buf/dma-fence.c                        |    3 +-
 drivers/dma-buf/dma-resv.c                         |    2 +-
 drivers/dma-buf/sw_sync.c                          |   82 +
 drivers/dma-buf/sync_debug.h                       |    2 +
 drivers/dma-buf/sync_file.c                        |   19 +
 drivers/dpll/dpll_netlink.c                        |   17 +-
 drivers/firewire/core-device.c                     |   11 +-
 drivers/firewire/sbp2.c                            |    6 +-
 drivers/firmware/Kconfig                           |    2 +-
 drivers/firmware/arm_ffa/driver.c                  |   70 +-
 drivers/firmware/arm_scmi/perf.c                   |   18 +-
 drivers/firmware/efi/unaccepted_memory.c           |    2 +-
 drivers/firmware/qemu_fw_cfg.c                     |    2 +-
 drivers/gpio/gpiolib-sysfs.c                       |   15 +-
 drivers/gpu/drm/Kconfig                            |   38 +-
 drivers/gpu/drm/Makefile                           |   15 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    2 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   41 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   19 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |    2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  197 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   69 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h        |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  153 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   96 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   97 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   64 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |  247 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.h          |   49 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |   15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   46 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |  249 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.h            |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  106 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  414 ++
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    1 -
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   71 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  164 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    5 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   15 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    2 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |   18 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |    5 -
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   12 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   28 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   21 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |    4 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   80 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |    8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   48 +-
 drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |   15 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  664 +--
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |    6 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   26 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  179 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  118 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   56 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  209 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   45 +-
 drivers/gpu/drm/amd/display/Makefile               |    3 +
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |   14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  563 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  118 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  829 ++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   81 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   88 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   67 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   22 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   78 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  232 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  216 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h   |   36 +
 drivers/gpu/drm/amd/display/dc/Makefile            |    9 +-
 drivers/gpu/drm/amd/display/dc/basics/conversion.c |    3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   87 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |   24 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    5 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   10 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  108 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  209 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |   46 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  414 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  187 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  500 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  865 +++
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  129 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   74 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  300 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   59 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    6 +
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |    6 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    3 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |   38 +
 drivers/gpu/drm/amd/display/dc/dc_plane_priv.h     |   34 +
 drivers/gpu/drm/amd/display/dc/dc_state.h          |   78 +
 drivers/gpu/drm/amd/display/dc/dc_state_priv.h     |  102 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   80 +-
 drivers/gpu/drm/amd/display/dc/dc_stream_priv.h    |   37 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   90 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.c       |    4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |   16 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |   25 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |    4 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   33 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   96 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |    4 +
 drivers/gpu/drm/amd/display/dc/dce100/Makefile     |   46 -
 drivers/gpu/drm/amd/display/dc/dce110/Makefile     |    4 +-
 drivers/gpu/drm/amd/display/dc/dce112/Makefile     |    3 +-
 drivers/gpu/drm/amd/display/dc/dce120/Makefile     |    2 +-
 drivers/gpu/drm/amd/display/dc/dce80/Makefile      |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |    4 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |   38 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |   12 +-
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |    5 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.c   |   23 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dwb.h   |    2 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dwb_cm.c    |    3 +
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |    5 +-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |   12 -
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |    4 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |    4 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |    9 +-
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |    3 +-
 drivers/gpu/drm/amd/display/dc/dcn315/Makefile     |   30 -
 drivers/gpu/drm/amd/display/dc/dcn316/Makefile     |   30 -
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |    8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |    3 +-
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  186 +-
 drivers/gpu/drm/amd/display/dc/dcn321/Makefile     |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |    6 +-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.c  |   92 +-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_dccg.h  |   58 +-
 .../amd/display/dc/dcn35/dcn35_dio_link_encoder.c  |    5 +
 .../display/dc/dcn35/dcn35_dio_stream_encoder.c    |   10 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.c   |   20 +-
 .../gpu/drm/amd/display/dc/dcn35/dcn35_pg_cntl.h   |    1 -
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   12 +-
 drivers/gpu/drm/amd/display/dc/dm_pp_smu.h         |    2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    4 +
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/dml/dc_features.h   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  130 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   29 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  199 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |    3 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   33 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |    1 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  117 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.h   |    2 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |    8 +-
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |   26 +-
 .../gpu/drm/amd/display/dc/dml2/dml2_dc_types.h    |    1 +
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |   89 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   95 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |   20 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   33 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   41 +-
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |   26 +
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   10 +-
 .../drm/amd/display/dc/{ =3D> dsc}/dcn20/dcn20_dsc.c |    0
 .../drm/amd/display/dc/{ =3D> dsc}/dcn20/dcn20_dsc.h |    0
 .../drm/amd/display/dc/{ =3D> dsc}/dcn35/dcn35_dsc.c |    0
 .../drm/amd/display/dc/{ =3D> dsc}/dcn35/dcn35_dsc.h |    0
 .../gpu/drm/amd/display/dc/{inc/hw =3D> dsc}/dsc.h   |    0
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |   28 +-
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |   15 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   39 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   45 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h    |    7 +-
 .../amd/display/dc/{ =3D> hwss}/dcn10/dcn10_init.c   |    0
 .../amd/display/dc/{ =3D> hwss}/dcn10/dcn10_init.h   |    0
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  136 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h    |    2 +-
 .../amd/display/dc/{ =3D> hwss}/dcn20/dcn20_init.c   |    0
 .../amd/display/dc/{ =3D> hwss}/dcn20/dcn20_init.h   |    0
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |    8 +-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.h  |    2 +-
 .../amd/display/dc/{ =3D> hwss}/dcn201/dcn201_init.c |    0
 .../amd/display/dc/{ =3D> hwss}/dcn201/dcn201_init.h |    0
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   40 +-
 .../amd/display/dc/{ =3D> hwss}/dcn21/dcn21_init.c   |    0
 .../amd/display/dc/{ =3D> hwss}/dcn21/dcn21_init.h   |    0
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   23 +-
 .../amd/display/dc/{ =3D> hwss}/dcn30/dcn30_init.c   |    0
 .../amd/display/dc/{ =3D> hwss}/dcn30/dcn30_init.h   |    0
 .../amd/display/dc/{ =3D> hwss}/dcn301/dcn301_init.c |    0
 .../amd/display/dc/{ =3D> hwss}/dcn301/dcn301_init.h |    0
 .../amd/display/dc/{ =3D> hwss}/dcn302/dcn302_init.c |    0
 .../amd/display/dc/{ =3D> hwss}/dcn302/dcn302_init.h |    0
 .../amd/display/dc/{ =3D> hwss}/dcn303/dcn303_init.c |    0
 .../amd/display/dc/{ =3D> hwss}/dcn303/dcn303_init.h |    0
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   17 +-
 .../amd/display/dc/{ =3D> hwss}/dcn31/dcn31_init.c   |    0
 .../amd/display/dc/{ =3D> hwss}/dcn31/dcn31_init.h   |    0
 .../amd/display/dc/{ =3D> hwss}/dcn314/dcn314_init.c |    0
 .../amd/display/dc/{ =3D> hwss}/dcn314/dcn314_init.h |    0
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  122 +-
 .../amd/display/dc/{ =3D> hwss}/dcn32/dcn32_init.c   |    0
 .../amd/display/dc/{ =3D> hwss}/dcn32/dcn32_init.h   |    0
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  271 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |   12 +-
 .../amd/display/dc/{ =3D> hwss}/dcn35/dcn35_init.c   |    5 +-
 .../amd/display/dc/{ =3D> hwss}/dcn35/dcn35_init.h   |    0
 .../drm/amd/display/dc/hwss/dcn351/CMakeLists.txt  |    4 +
 .../gpu/drm/amd/display/dc/hwss/dcn351/Makefile    |   17 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |  171 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.h   |   33 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   23 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |    1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   32 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |    5 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   19 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |    4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h |    3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |    2 -
 drivers/gpu/drm/amd/display/dc/inc/link.h          |    5 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   19 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    5 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  148 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   61 +-
 .../gpu/drm/amd/display/dc/link/link_validation.h  |    1 +
 .../display/dc/link/protocols/link_dp_capability.c |   16 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |    3 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |  337 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |    4 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |   18 +-
 .../display/dc/link/protocols/link_dp_training.c   |    2 +-
 .../display/dc/link/protocols/link_dp_training.h   |    2 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |    4 +-
 .../link_dp_training_fixed_vs_pe_retimer.c         |   16 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   72 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    6 +-
 drivers/gpu/drm/amd/display/dc/optc/Makefile       |  108 +
 .../amd/display/dc/{ =3D> optc}/dcn10/dcn10_optc.c   |    0
 .../amd/display/dc/{ =3D> optc}/dcn10/dcn10_optc.h   |    0
 .../amd/display/dc/{ =3D> optc}/dcn20/dcn20_optc.c   |    0
 .../amd/display/dc/{ =3D> optc}/dcn20/dcn20_optc.h   |    2 +-
 .../amd/display/dc/{ =3D> optc}/dcn201/dcn201_optc.c |    0
 .../amd/display/dc/{ =3D> optc}/dcn201/dcn201_optc.h |    0
 .../amd/display/dc/{ =3D> optc}/dcn30/dcn30_optc.c   |    0
 .../amd/display/dc/{ =3D> optc}/dcn30/dcn30_optc.h   |    0
 .../amd/display/dc/{ =3D> optc}/dcn301/dcn301_optc.c |    0
 .../amd/display/dc/{ =3D> optc}/dcn301/dcn301_optc.h |    0
 .../amd/display/dc/{ =3D> optc}/dcn31/dcn31_optc.c   |    0
 .../amd/display/dc/{ =3D> optc}/dcn31/dcn31_optc.h   |    0
 .../amd/display/dc/{ =3D> optc}/dcn314/dcn314_optc.c |    0
 .../amd/display/dc/{ =3D> optc}/dcn314/dcn314_optc.h |    0
 .../amd/display/dc/{ =3D> optc}/dcn32/dcn32_optc.c   |    7 +
 .../amd/display/dc/{ =3D> optc}/dcn32/dcn32_optc.h   |    0
 .../amd/display/dc/{ =3D> optc}/dcn35/dcn35_optc.c   |    7 +
 .../amd/display/dc/{ =3D> optc}/dcn35/dcn35_optc.h   |    0
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |  199 +
 .../dc/{ =3D> resource}/dce100/dce100_resource.c     |    0
 .../dc/{ =3D> resource}/dce100/dce100_resource.h     |    0
 .../dc/{ =3D> resource}/dce110/dce110_resource.c     |    0
 .../dc/{ =3D> resource}/dce110/dce110_resource.h     |    0
 .../dc/{ =3D> resource}/dce112/dce112_resource.c     |    0
 .../dc/{ =3D> resource}/dce112/dce112_resource.h     |    0
 .../dc/{ =3D> resource}/dce120/dce120_resource.c     |    2 +-
 .../dc/{ =3D> resource}/dce120/dce120_resource.h     |    0
 .../amd/display/dc/resource/dce80/CMakeLists.txt   |    4 +
 .../dc/{ =3D> resource}/dce80/dce80_resource.c       |    0
 .../dc/{ =3D> resource}/dce80/dce80_resource.h       |    0
 .../dc/{ =3D> resource}/dcn10/dcn10_resource.c       |   30 +-
 .../dc/{ =3D> resource}/dcn10/dcn10_resource.h       |    0
 .../dc/{ =3D> resource}/dcn20/dcn20_resource.c       |   40 +-
 .../dc/{ =3D> resource}/dcn20/dcn20_resource.h       |    1 +
 .../dc/{ =3D> resource}/dcn201/dcn201_resource.c     |   14 +-
 .../dc/{ =3D> resource}/dcn201/dcn201_resource.h     |    0
 .../dc/{ =3D> resource}/dcn21/dcn21_resource.c       |    9 +-
 .../dc/{ =3D> resource}/dcn21/dcn21_resource.h       |    0
 .../dc/{ =3D> resource}/dcn30/dcn30_resource.c       |    4 +-
 .../dc/{ =3D> resource}/dcn30/dcn30_resource.h       |    0
 .../dc/{ =3D> resource}/dcn301/dcn301_resource.c     |    4 +-
 .../dc/{ =3D> resource}/dcn301/dcn301_resource.h     |    0
 .../dc/{ =3D> resource}/dcn302/dcn302_resource.c     |    4 +-
 .../dc/{ =3D> resource}/dcn302/dcn302_resource.h     |    0
 .../dc/{ =3D> resource}/dcn303/dcn303_resource.c     |    4 +-
 .../dc/{ =3D> resource}/dcn303/dcn303_resource.h     |    0
 .../dc/{ =3D> resource}/dcn31/dcn31_resource.c       |    2 +-
 .../dc/{ =3D> resource}/dcn31/dcn31_resource.h       |    0
 .../dc/{ =3D> resource}/dcn314/dcn314_resource.c     |    2 +-
 .../dc/{ =3D> resource}/dcn314/dcn314_resource.h     |    0
 .../dc/{ =3D> resource}/dcn315/dcn315_resource.c     |    6 +-
 .../dc/{ =3D> resource}/dcn315/dcn315_resource.h     |    0
 .../dc/{ =3D> resource}/dcn316/dcn316_resource.c     |    0
 .../dc/{ =3D> resource}/dcn316/dcn316_resource.h     |    0
 .../dc/{ =3D> resource}/dcn32/dcn32_resource.c       |  141 +-
 .../dc/{ =3D> resource}/dcn32/dcn32_resource.h       |   31 +-
 .../dc/{ =3D> resource}/dcn321/dcn321_resource.c     |   30 +-
 .../dc/{ =3D> resource}/dcn321/dcn321_resource.h     |    0
 .../dc/{ =3D> resource}/dcn35/dcn35_resource.c       |   51 +-
 .../dc/{ =3D> resource}/dcn35/dcn35_resource.h       |    1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   44 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  171 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   68 +-
 .../amd/display/include/grph_object_ctrl_defs.h    |    2 +
 .../gpu/drm/amd/display/include/hdcp_msg_types.h   |    5 +
 .../drm/amd/display/modules/freesync/freesync.c    |   10 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |    4 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |    6 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |   10 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |    4 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.h    |   10 +-
 .../gpu/drm/amd/display/modules/inc/mod_freesync.h |   28 -
 .../amd/display/modules/info_packet/info_packet.c  |   13 +-
 .../drm/amd/display/modules/power/power_helpers.c  |   32 +-
 .../drm/amd/display/modules/power/power_helpers.h  |    5 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    5 +-
 drivers/gpu/drm/amd/include/amdgpu_reg_state.h     |  153 +
 .../amd/include/asic_reg/dcn/dcn_3_5_0_sh_mask.h   |    8 +
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |    2 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |    2 +
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    |   29 +
 .../include/asic_reg/smuio/smuio_10_0_2_offset.h   |  102 +
 .../include/asic_reg/smuio/smuio_10_0_2_sh_mask.h  |  184 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  116 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    4 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   53 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   48 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   15 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |    4 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |   52 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |    5 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   11 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.c |    7 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_baco.h |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |    6 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.c |    9 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu9_baco.h |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c   |    9 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.h   |    2 +-
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h       |    2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c    |    1 +
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  245 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   67 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |    3 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |    3 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |   80 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |    5 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |  108 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h   |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   11 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    2 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    2 -
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    2 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  129 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   83 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  259 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   51 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |    6 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |   66 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |    3 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    4 +
 drivers/gpu/drm/arm/malidp_crtc.c                  |    2 +-
 drivers/gpu/drm/armada/armada_crtc.c               |   29 +-
 drivers/gpu/drm/armada/armada_drv.c                |    5 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   10 +-
 drivers/gpu/drm/ast/ast_drv.c                      |  263 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  114 +-
 drivers/gpu/drm/ast/ast_main.c                     |  244 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   88 +-
 drivers/gpu/drm/ast/ast_post.c                     |   73 +-
 drivers/gpu/drm/ast/ast_reg.h                      |   12 +-
 drivers/gpu/drm/bridge/Kconfig                     |   18 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   54 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |    4 +
 drivers/gpu/drm/bridge/aux-bridge.c                |  141 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |  163 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   22 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |    3 +-
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c        |    4 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   58 +
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    6 +-
 drivers/gpu/drm/bridge/panel.c                     |   17 -
 drivers/gpu/drm/bridge/tc358767.c                  |    2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   20 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |    6 +-
 drivers/gpu/drm/ci/arm64.config                    |    1 +
 drivers/gpu/drm/ci/build.sh                        |   19 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   |    2 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |   10 +-
 drivers/gpu/drm/ci/test.yml                        |   13 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   13 +-
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |    5 +
 drivers/gpu/drm/ci/xfails/requirements.txt         |    6 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |   46 +
 drivers/gpu/drm/display/drm_dp_helper.c            |  161 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  234 +-
 drivers/gpu/drm/drm_agpsupport.c                   |  451 --
 drivers/gpu/drm/drm_atomic.c                       |   10 +
 drivers/gpu/drm/drm_atomic_helper.c                |   98 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |   15 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |  149 +-
 drivers/gpu/drm/drm_auth.c                         |    8 +-
 drivers/gpu/drm/drm_bridge.c                       |   44 -
 drivers/gpu/drm/drm_bridge_connector.c             |    6 -
 drivers/gpu/drm/drm_bufs.c                         | 1627 -----
 drivers/gpu/drm/drm_client.c                       |   12 +-
 drivers/gpu/drm/drm_connector.c                    |    6 +
 drivers/gpu/drm/drm_context.c                      |  513 --
 drivers/gpu/drm/drm_crtc_helper.c                  |    7 +-
 drivers/gpu/drm/drm_crtc_internal.h                |    4 +-
 drivers/gpu/drm/drm_damage_helper.c                |    3 +-
 drivers/gpu/drm/drm_debugfs.c                      |   65 +-
 drivers/gpu/drm/drm_dma.c                          |  178 -
 drivers/gpu/drm/drm_drv.c                          |   27 +-
 drivers/gpu/drm/drm_edid.c                         |   43 +-
 drivers/gpu/drm/drm_edid_load.c                    |   16 -
 drivers/gpu/drm/drm_eld.c                          |   55 +
 drivers/gpu/drm/drm_encoder.c                      |    4 +
 drivers/gpu/drm/drm_exec.c                         |   13 +-
 drivers/gpu/drm/drm_file.c                         |   68 +-
 drivers/gpu/drm/drm_flip_work.c                    |   27 +-
 drivers/gpu/drm/drm_format_helper.c                |  215 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   82 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |    9 +
 drivers/gpu/drm/drm_gpuvm.c                        | 1170 +++-
 drivers/gpu/drm/drm_hashtab.c                      |  203 -
 drivers/gpu/drm/drm_internal.h                     |   23 +-
 drivers/gpu/drm/drm_ioc32.c                        |  613 +-
 drivers/gpu/drm/drm_ioctl.c                        |   96 +-
 drivers/gpu/drm/drm_irq.c                          |  204 -
 drivers/gpu/drm/drm_kms_helper_common.c            |   32 -
 drivers/gpu/drm/drm_legacy.h                       |  290 -
 drivers/gpu/drm/drm_legacy_misc.c                  |  105 -
 drivers/gpu/drm/drm_lock.c                         |  373 --
 drivers/gpu/drm/drm_memory.c                       |  138 -
 drivers/gpu/drm/drm_mipi_dbi.c                     |   19 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |   17 +-
 drivers/gpu/drm/drm_mode_object.c                  |    2 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    6 +
 drivers/gpu/drm/drm_pci.c                          |  204 +-
 drivers/gpu/drm/drm_plane.c                        |  151 +-
 drivers/gpu/drm/drm_plane_helper.c                 |   32 -
 drivers/gpu/drm/drm_prime.c                        |   33 +-
 drivers/gpu/drm/drm_property.c                     |   59 +
 drivers/gpu/drm/drm_scatter.c                      |  220 -
 drivers/gpu/drm/drm_syncobj.c                      |   64 +-
 drivers/gpu/drm/drm_vblank.c                       |  101 -
 drivers/gpu/drm/drm_vm.c                           |  665 ---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    7 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |    2 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |    6 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |    6 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_dma.c            |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   16 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |   15 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |    6 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |    6 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    8 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |    6 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   30 +-
 drivers/gpu/drm/i915/Kconfig                       |    2 +-
 drivers/gpu/drm/i915/Kconfig.debug                 |   18 +
 drivers/gpu/drm/i915/Makefile                      |  184 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   46 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   66 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   12 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   17 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |    3 -
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   83 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   17 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    9 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   40 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |    7 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  118 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   70 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    9 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    9 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   10 +
 drivers/gpu/drm/i915/display/intel_cursor.c        |   42 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  249 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   16 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  225 +-
 drivers/gpu/drm/i915/display/intel_ddi.h           |    8 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  629 +-
 drivers/gpu/drm/i915/display/intel_display.h       |   12 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   26 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  237 +-
 .../i915/display/intel_display_debugfs_params.c    |  176 +
 .../i915/display/intel_display_debugfs_params.h    |   13 +
 .../gpu/drm/i915/display/intel_display_device.c    |   13 +-
 .../gpu/drm/i915/display/intel_display_device.h    |    5 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   14 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   19 +-
 .../gpu/drm/i915/display/intel_display_params.c    |  217 +
 .../gpu/drm/i915/display/intel_display_params.h    |   61 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   22 +-
 .../drm/i915/display/intel_display_power_well.c    |   23 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    2 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   37 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  147 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |    1 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  515 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |   26 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   99 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    4 +-
 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |   14 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   31 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  686 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    5 +
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |  171 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h      |    5 +
 drivers/gpu/drm/i915/display/intel_dpll.c          |  270 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |    9 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  189 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |    6 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |   24 -
 drivers/gpu/drm/i915/display/intel_dpt.h           |    2 -
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |   34 +
 drivers/gpu/drm/i915/display/intel_dpt_common.h    |   13 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |  100 +-
 drivers/gpu/drm/i915/display/intel_dsb_buffer.c    |   82 +
 drivers/gpu/drm/i915/display/intel_dsb_buffer.h    |   29 +
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  368 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.h       |    1 -
 drivers/gpu/drm/i915/display/intel_dvo.c           |    6 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  187 +-
 drivers/gpu/drm/i915/display/intel_fb.h            |    2 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |   97 +
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |   26 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |   59 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |  112 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |  115 +
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |   21 +
 drivers/gpu/drm/i915/display/intel_fdi.c           |    8 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |    2 -
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   37 +-
 drivers/gpu/drm/i915/display/intel_hdcp.h          |    8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   14 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |   16 +
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   30 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |   11 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    6 +
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_panel.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |    1 +
 drivers/gpu/drm/i915/display/intel_pps.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  471 +-
 drivers/gpu/drm/i915/display/intel_psr.h           |   17 +-
 drivers/gpu/drm/i915/display/intel_psr_regs.h      |    2 +
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |    3 -
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   32 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |    7 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   25 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   14 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   51 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   50 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |    2 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  106 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |    5 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   47 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   11 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |    3 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   27 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   21 +-
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |   12 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |   10 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |    6 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   21 +
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c    |    6 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |   22 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |    8 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |    2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   14 +-
 drivers/gpu/drm/i915/gem/selftests/mock_context.c  |    4 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   43 +
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |   13 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |    3 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |   14 +
 drivers/gpu/drm/i915/gt/intel_context.h            |    4 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h      |    2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    2 +-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |    2 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |    7 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.h          |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_regs.h        |    8 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |    2 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |   39 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   23 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |   13 +-
 drivers/gpu/drm/i915/gt/intel_gt.h                 |   23 +
 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c |    2 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |    3 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |   14 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |   38 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h            |    6 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |   26 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    5 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  100 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    7 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |   41 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |   20 +-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    |    2 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |    5 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |   65 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |   10 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |   17 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |    5 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c       |    2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |    4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c     |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |   11 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c         |   10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c          |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c        |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   23 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |    5 -
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |    5 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c          |  115 +
 .../gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c    |    2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |    6 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |    3 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c             |    4 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |  112 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   18 +-
 drivers/gpu/drm/i915/i915_drm_client.c             |  108 +
 drivers/gpu/drm/i915/i915_drm_client.h             |   42 +
 drivers/gpu/drm/i915/i915_drv.h                    |   20 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    2 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |  199 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |   46 +-
 drivers/gpu/drm/i915/i915_hwmon.c                  |    4 +-
 drivers/gpu/drm/i915/i915_params.c                 |   89 -
 drivers/gpu/drm/i915/i915_params.h                 |   22 -
 drivers/gpu/drm/i915/i915_pmu.c                    |   77 +-
 drivers/gpu/drm/i915/i915_reg.h                    |    2 -
 drivers/gpu/drm/i915/i915_sysfs.c                  |   79 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    2 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |   19 +
 drivers/gpu/drm/i915/intel_memory_region.h         |    1 +
 drivers/gpu/drm/i915/intel_runtime_pm.c            |  243 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h            |   13 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |   35 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |   73 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |   18 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c           |    5 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h         |    1 +
 drivers/gpu/drm/i915/selftests/i915_syncmap.c      |    2 +-
 drivers/gpu/drm/i915/selftests/igt_live_test.c     |    9 +-
 drivers/gpu/drm/i915/selftests/igt_live_test.h     |    3 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    2 +
 drivers/gpu/drm/i915/soc/intel_gmch.c              |   27 +-
 drivers/gpu/drm/i915/vlv_sideband.c                |   29 +-
 drivers/gpu/drm/i915/vlv_sideband.h                |    9 +-
 drivers/gpu/drm/imagination/Kconfig                |   18 +
 drivers/gpu/drm/imagination/Makefile               |   35 +
 drivers/gpu/drm/imagination/pvr_ccb.c              |  645 ++
 drivers/gpu/drm/imagination/pvr_ccb.h              |   71 +
 drivers/gpu/drm/imagination/pvr_cccb.c             |  267 +
 drivers/gpu/drm/imagination/pvr_cccb.h             |  110 +
 drivers/gpu/drm/imagination/pvr_context.c          |  464 ++
 drivers/gpu/drm/imagination/pvr_context.h          |  205 +
 drivers/gpu/drm/imagination/pvr_debugfs.c          |   53 +
 drivers/gpu/drm/imagination/pvr_debugfs.h          |   29 +
 drivers/gpu/drm/imagination/pvr_device.c           |  658 +++
 drivers/gpu/drm/imagination/pvr_device.h           |  725 +++
 drivers/gpu/drm/imagination/pvr_device_info.c      |  255 +
 drivers/gpu/drm/imagination/pvr_device_info.h      |  186 +
 drivers/gpu/drm/imagination/pvr_drv.c              | 1501 +++++
 drivers/gpu/drm/imagination/pvr_drv.h              |  129 +
 drivers/gpu/drm/imagination/pvr_free_list.c        |  625 ++
 drivers/gpu/drm/imagination/pvr_free_list.h        |  195 +
 drivers/gpu/drm/imagination/pvr_fw.c               | 1489 +++++
 drivers/gpu/drm/imagination/pvr_fw.h               |  509 ++
 drivers/gpu/drm/imagination/pvr_fw_info.h          |  135 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |  555 ++
 drivers/gpu/drm/imagination/pvr_fw_meta.h          |   14 +
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |  252 +
 drivers/gpu/drm/imagination/pvr_fw_mips.h          |   48 +
 drivers/gpu/drm/imagination/pvr_fw_startstop.c     |  306 +
 drivers/gpu/drm/imagination/pvr_fw_startstop.h     |   13 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |  471 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.h         |   78 +
 drivers/gpu/drm/imagination/pvr_gem.c              |  414 ++
 drivers/gpu/drm/imagination/pvr_gem.h              |  170 +
 drivers/gpu/drm/imagination/pvr_hwrt.c             |  550 ++
 drivers/gpu/drm/imagination/pvr_hwrt.h             |  166 +
 drivers/gpu/drm/imagination/pvr_job.c              |  786 +++
 drivers/gpu/drm/imagination/pvr_job.h              |  161 +
 drivers/gpu/drm/imagination/pvr_mmu.c              | 2640 +++++++++
 drivers/gpu/drm/imagination/pvr_mmu.h              |  108 +
 drivers/gpu/drm/imagination/pvr_params.c           |  147 +
 drivers/gpu/drm/imagination/pvr_params.h           |   72 +
 drivers/gpu/drm/imagination/pvr_power.c            |  433 ++
 drivers/gpu/drm/imagination/pvr_power.h            |   41 +
 drivers/gpu/drm/imagination/pvr_queue.c            | 1432 +++++
 drivers/gpu/drm/imagination/pvr_queue.h            |  169 +
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    | 6193 ++++++++++++++++=
++++
 .../gpu/drm/imagination/pvr_rogue_cr_defs_client.h |  159 +
 drivers/gpu/drm/imagination/pvr_rogue_defs.h       |  179 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h       | 2188 +++++++
 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h |  493 ++
 .../gpu/drm/imagination/pvr_rogue_fwif_client.h    |  373 ++
 .../drm/imagination/pvr_rogue_fwif_client_check.h  |  133 +
 .../gpu/drm/imagination/pvr_rogue_fwif_common.h    |   60 +
 .../gpu/drm/imagination/pvr_rogue_fwif_dev_info.h  |  113 +
 .../imagination/pvr_rogue_fwif_resetframework.h    |   28 +
 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h    | 1648 ++++++
 .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    |  258 +
 .../drm/imagination/pvr_rogue_fwif_shared_check.h  |  108 +
 .../gpu/drm/imagination/pvr_rogue_fwif_stream.h    |   78 +
 .../gpu/drm/imagination/pvr_rogue_heap_config.h    |  113 +
 drivers/gpu/drm/imagination/pvr_rogue_meta.h       |  356 ++
 drivers/gpu/drm/imagination/pvr_rogue_mips.h       |  335 ++
 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h |   58 +
 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h   |  136 +
 drivers/gpu/drm/imagination/pvr_stream.c           |  285 +
 drivers/gpu/drm/imagination/pvr_stream.h           |   75 +
 drivers/gpu/drm/imagination/pvr_stream_defs.c      |  351 ++
 drivers/gpu/drm/imagination/pvr_stream_defs.h      |   16 +
 drivers/gpu/drm/imagination/pvr_sync.c             |  289 +
 drivers/gpu/drm/imagination/pvr_sync.h             |   84 +
 drivers/gpu/drm/imagination/pvr_vm.c               | 1090 ++++
 drivers/gpu/drm/imagination/pvr_vm.h               |   66 +
 drivers/gpu/drm/imagination/pvr_vm_mips.c          |  237 +
 drivers/gpu/drm/imagination/pvr_vm_mips.h          |   22 +
 drivers/gpu/drm/imx/dcss/dcss-drv.c                |    6 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |    9 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |   15 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    5 +-
 drivers/gpu/drm/lima/lima_device.c                 |    2 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
 drivers/gpu/drm/loongson/Kconfig                   |    1 +
 drivers/gpu/drm/loongson/lsdc_plane.c              |    1 -
 drivers/gpu/drm/mediatek/Makefile                  |    3 +-
 drivers/gpu/drm/mediatek/mtk_cec.c                 |    4 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |    4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |    4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |    8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |    2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |  253 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   16 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   10 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |    2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   20 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |    2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |    5 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   19 +-
 drivers/gpu/drm/mediatek/mtk_padding.c             |  160 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |    6 +-
 drivers/gpu/drm/msm/Kconfig                        |    2 +
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   21 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  122 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    9 +
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  457 ++
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  104 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   17 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   18 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |    8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   32 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   17 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |    7 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   11 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |    4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |    7 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   16 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   26 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  186 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   21 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   75 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   55 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  130 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  223 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   72 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |  247 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |  142 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   52 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   28 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |    7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |   70 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   79 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  105 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  141 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   13 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   42 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |   32 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c   |   37 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |   87 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   24 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   30 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c           |   21 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h           |    1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |   29 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   28 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c         |   10 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h         |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c          |   10 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h          |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h           |    1 -
 drivers/gpu/drm/msm/dp/dp_aux.c                    |   39 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |   69 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |   23 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  384 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |    4 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   33 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |   32 +-
 drivers/gpu/drm/msm/dp/dp_power.h                  |   11 -
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   17 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   10 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   29 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |   41 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   96 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   15 +-
 drivers/gpu/drm/msm/msm_gem.c                      |    7 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   17 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |    2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  235 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   44 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    2 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  106 +-
 drivers/gpu/drm/msm/msm_mdss.h                     |    1 +
 drivers/gpu/drm/msm/msm_rd.c                       |    3 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |    5 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   10 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   12 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/event.h  |    4 +-
 .../common/shared/msgq/inc/msgq/msgq_priv.h        |   51 +
 .../nvrm/535.113.01/nvidia/generated/g_os_nvoc.h   |    2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   19 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   20 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    5 +
 drivers/gpu/drm/nouveau/nouveau_display.c          |    5 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   36 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   19 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |   68 +-
 drivers/gpu/drm/nouveau/nouveau_exec.h             |    6 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   10 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c         |    5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  207 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h            |   43 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |  380 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |   12 +-
 drivers/gpu/drm/nouveau/nv04_fence.c               |    2 +-
 drivers/gpu/drm/nouveau/nvkm/core/event.c          |   12 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |    1 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |   94 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c |    2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |    4 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                  |    5 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    9 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   14 +-
 drivers/gpu/drm/panel/Kconfig                      |   18 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   10 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  138 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   37 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  180 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c       |  405 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  225 +
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   57 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |  515 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |    2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |    4 +-
 drivers/gpu/drm/panel/panel-simple.c               |  109 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |  138 +-
 drivers/gpu/drm/panel/panel-synaptics-r63353.c     |  362 ++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   17 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   81 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   23 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |    5 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c           |   12 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |  119 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   30 +-
 drivers/gpu/drm/panfrost/panfrost_job.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |   32 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.h            |    1 +
 drivers/gpu/drm/panfrost/panfrost_regs.h           |    1 +
 drivers/gpu/drm/qxl/qxl_display.c                  |   14 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |    2 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    7 -
 drivers/gpu/drm/radeon/atombios_encoders.c         |    1 +
 drivers/gpu/drm/radeon/clearstate_evergreen.h      |    8 +-
 drivers/gpu/drm/radeon/dce3_1_afmt.c               |    1 +
 drivers/gpu/drm/radeon/dce6_afmt.c                 |    1 +
 drivers/gpu/drm/radeon/evergreen.c                 |    1 +
 drivers/gpu/drm/radeon/evergreen_hdmi.c            |    1 +
 drivers/gpu/drm/radeon/r100.c                      |    4 +-
 drivers/gpu/drm/radeon/r600_cs.c                   |    4 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |    1 +
 drivers/gpu/drm/radeon/radeon_audio.c              |    2 +
 drivers/gpu/drm/radeon/radeon_audio.h              |    4 +-
 drivers/gpu/drm/radeon/radeon_combios.c            |    1 +
 drivers/gpu/drm/radeon/radeon_display.c            |    7 +-
 drivers/gpu/drm/radeon/radeon_drv.h                |    1 -
 drivers/gpu/drm/radeon/radeon_encoders.c           |    1 +
 drivers/gpu/drm/radeon/radeon_mode.h               |    2 +-
 drivers/gpu/drm/radeon/radeon_ring.c               |    2 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |    8 +-
 drivers/gpu/drm/radeon/si.c                        |    4 +
 drivers/gpu/drm/radeon/sumo_dpm.c                  |    4 +-
 drivers/gpu/drm/radeon/trinity_dpm.c               |    4 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |    1 -
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |    1 -
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    1 -
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |    1 -
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |    1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   46 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   18 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   14 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   12 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  503 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |  100 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    1 -
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |    1 -
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  225 +-
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    |    2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   18 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  492 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |   38 +-
 drivers/gpu/drm/solomon/ssd130x.h                  |    1 -
 drivers/gpu/drm/sprd/sprd_dpu.c                    |    6 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |    5 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |    6 +-
 drivers/gpu/drm/tegra/hdmi.c                       |    1 +
 drivers/gpu/drm/tegra/sor.c                        |    1 +
 drivers/gpu/drm/tests/Makefile                     |    5 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |  465 --
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |  166 +-
 drivers/gpu/drm/tests/drm_exec_test.c              |   16 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |   72 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |  383 ++
 drivers/gpu/drm/tests/drm_mm_test.c                | 2016 +------
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   12 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  138 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    3 +
 drivers/gpu/drm/tidss/tidss_drv.c                  |   16 +-
 drivers/gpu/drm/tidss/tidss_irq.c                  |   54 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |    6 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   11 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |    6 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    3 +-
 drivers/gpu/drm/tiny/ili9225.c                     |   10 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |   17 +-
 drivers/gpu/drm/tiny/repaper.c                     |   10 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   44 +-
 drivers/gpu/drm/tiny/st7586.c                      |   19 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    8 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |    6 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   19 +-
 drivers/gpu/drm/v3d/Makefile                       |    4 +-
 drivers/gpu/drm/v3d/v3d_bo.c                       |   51 +
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |  178 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   50 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |  165 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  779 +--
 drivers/gpu/drm/v3d/v3d_irq.c                      |   93 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |   94 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  397 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   | 1320 +++++
 drivers/gpu/drm/v3d/v3d_sysfs.c                    |   69 +
 drivers/gpu/drm/v3d/v3d_trace.h                    |   57 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   12 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    5 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   41 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   18 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   25 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   20 +-
 drivers/gpu/drm/xe/.gitignore                      |    4 +
 drivers/gpu/drm/xe/.kunitconfig                    |   13 +
 drivers/gpu/drm/xe/Kconfig                         |   96 +
 drivers/gpu/drm/xe/Kconfig.debug                   |  107 +
 drivers/gpu/drm/xe/Kconfig.profile                 |   54 +
 drivers/gpu/drm/xe/Makefile                        |  305 +
 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h    |   46 +
 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h     |   39 +
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h      |   59 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |  219 +
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h      |  249 +
 drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h |  127 +
 .../gpu/drm/xe/abi/guc_communication_mmio_abi.h    |   49 +
 drivers/gpu/drm/xe/abi/guc_errors_abi.h            |   37 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |  322 +
 drivers/gpu/drm/xe/abi/guc_messages_abi.h          |  234 +
 .../drm/xe/compat-i915-headers/gem/i915_gem_lmem.h |    1 +
 .../drm/xe/compat-i915-headers/gem/i915_gem_mman.h |   17 +
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |   65 +
 .../gem/i915_gem_object_frontbuffer.h              |   12 +
 .../gpu/drm/xe/compat-i915-headers/gt/intel_rps.h  |   11 +
 .../gpu/drm/xe/compat-i915-headers/i915_active.h   |   22 +
 .../drm/xe/compat-i915-headers/i915_active_types.h |   13 +
 .../gpu/drm/xe/compat-i915-headers/i915_config.h   |   19 +
 .../gpu/drm/xe/compat-i915-headers/i915_debugfs.h  |   14 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  233 +
 .../gpu/drm/xe/compat-i915-headers/i915_fixed.h    |    6 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h  |    9 +
 .../drm/xe/compat-i915-headers/i915_gem_stolen.h   |   79 +
 .../drm/xe/compat-i915-headers/i915_gpu_error.h    |   17 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h  |    6 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h  |    6 +
 .../gpu/drm/xe/compat-i915-headers/i915_reg_defs.h |    6 +
 .../gpu/drm/xe/compat-i915-headers/i915_trace.h    |    6 +
 .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |    6 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h |   44 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |   34 +
 .../drm/xe/compat-i915-headers/i915_vma_types.h    |   74 +
 .../xe/compat-i915-headers/intel_clock_gating.h    |    6 +
 .../drm/xe/compat-i915-headers/intel_gt_types.h    |   11 +
 .../drm/xe/compat-i915-headers/intel_mchbar_regs.h |    6 +
 .../drm/xe/compat-i915-headers/intel_pci_config.h  |    6 +
 .../gpu/drm/xe/compat-i915-headers/intel_pcode.h   |   42 +
 .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |   16 +
 .../gpu/drm/xe/compat-i915-headers/intel_step.h    |   20 +
 .../gpu/drm/xe/compat-i915-headers/intel_uc_fw.h   |   11 +
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |  175 +
 .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |    8 +
 .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |   28 +
 .../drm/xe/compat-i915-headers/soc/intel_dram.h    |    6 +
 .../drm/xe/compat-i915-headers/soc/intel_gmch.h    |    6 +
 .../gpu/drm/xe/compat-i915-headers/soc/intel_pch.h |    6 +
 .../gpu/drm/xe/compat-i915-headers/vlv_sideband.h  |  132 +
 .../drm/xe/compat-i915-headers/vlv_sideband_reg.h  |    6 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |   77 +
 drivers/gpu/drm/xe/display/ext/i915_utils.c        |   26 +
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |   74 +
 drivers/gpu/drm/xe/display/intel_fb_bo.h           |   24 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |  104 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.h        |   21 +
 drivers/gpu/drm/xe/display/xe_display_misc.c       |   16 +
 drivers/gpu/drm/xe/display/xe_display_rps.c        |   17 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |   71 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |  384 ++
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   34 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |  291 +
 .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h  |  160 +
 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h  |   36 +
 drivers/gpu/drm/xe/instructions/xe_instr_defs.h    |   33 +
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |   61 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |  184 +
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h          |   70 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h              |   41 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  478 ++
 drivers/gpu/drm/xe/regs/xe_guc_regs.h              |  143 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h            |   17 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h           |   44 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h              |  120 +
 drivers/gpu/drm/xe/regs/xe_regs.h                  |   68 +
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h            |   17 +
 drivers/gpu/drm/xe/tests/Makefile                  |   10 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |  353 ++
 drivers/gpu/drm/xe/tests/xe_bo_test.c              |   26 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h              |   14 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |  278 +
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c         |   25 +
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h         |   13 +
 drivers/gpu/drm/xe/tests/xe_lmtt_test.c            |   73 +
 drivers/gpu/drm/xe/tests/xe_migrate.c              |  444 ++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c         |   25 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h         |   13 +
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |  130 +
 drivers/gpu/drm/xe/tests/xe_mocs_test.c            |   24 +
 drivers/gpu/drm/xe/tests/xe_mocs_test.h            |   13 +
 drivers/gpu/drm/xe/tests/xe_pci.c                  |  166 +
 drivers/gpu/drm/xe/tests/xe_pci_test.c             |   71 +
 drivers/gpu/drm/xe/tests/xe_pci_test.h             |   36 +
 drivers/gpu/drm/xe/tests/xe_rtp_test.c             |  319 +
 drivers/gpu/drm/xe/tests/xe_test.h                 |   67 +
 drivers/gpu/drm/xe/tests/xe_wa_test.c              |  170 +
 drivers/gpu/drm/xe/xe_assert.h                     |  174 +
 drivers/gpu/drm/xe/xe_bb.c                         |  110 +
 drivers/gpu/drm/xe/xe_bb.h                         |   25 +
 drivers/gpu/drm/xe/xe_bb_types.h                   |   20 +
 drivers/gpu/drm/xe/xe_bo.c                         | 2269 +++++++
 drivers/gpu/drm/xe/xe_bo.h                         |  355 ++
 drivers/gpu/drm/xe/xe_bo_doc.h                     |  179 +
 drivers/gpu/drm/xe/xe_bo_evict.c                   |  228 +
 drivers/gpu/drm/xe/xe_bo_evict.h                   |   15 +
 drivers/gpu/drm/xe/xe_bo_types.h                   |   96 +
 drivers/gpu/drm/xe/xe_debugfs.c                    |  148 +
 drivers/gpu/drm/xe/xe_debugfs.h                    |   13 +
 drivers/gpu/drm/xe/xe_devcoredump.c                |  196 +
 drivers/gpu/drm/xe/xe_devcoredump.h                |   20 +
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |   55 +
 drivers/gpu/drm/xe/xe_device.c                     |  700 +++
 drivers/gpu/drm/xe/xe_device.h                     |  173 +
 drivers/gpu/drm/xe/xe_device_sysfs.c               |   89 +
 drivers/gpu/drm/xe/xe_device_sysfs.h               |   13 +
 drivers/gpu/drm/xe/xe_device_types.h               |  545 ++
 drivers/gpu/drm/xe/xe_display.c                    |  422 ++
 drivers/gpu/drm/xe/xe_display.h                    |   72 +
 drivers/gpu/drm/xe/xe_dma_buf.c                    |  322 +
 drivers/gpu/drm/xe/xe_dma_buf.h                    |   15 +
 drivers/gpu/drm/xe/xe_drm_client.c                 |  204 +
 drivers/gpu/drm/xe/xe_drm_client.h                 |   70 +
 drivers/gpu/drm/xe/xe_drv.h                        |   23 +
 drivers/gpu/drm/xe/xe_exec.c                       |  350 ++
 drivers/gpu/drm/xe/xe_exec.h                       |   14 +
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  956 +++
 drivers/gpu/drm/xe/xe_exec_queue.h                 |   69 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |  222 +
 drivers/gpu/drm/xe/xe_execlist.c                   |  474 ++
 drivers/gpu/drm/xe/xe_execlist.h                   |   21 +
 drivers/gpu/drm/xe/xe_execlist_types.h             |   49 +
 drivers/gpu/drm/xe/xe_force_wake.c                 |  199 +
 drivers/gpu/drm/xe/xe_force_wake.h                 |   38 +
 drivers/gpu/drm/xe/xe_force_wake_types.h           |   86 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c                 |  165 +
 drivers/gpu/drm/xe/xe_ggtt.c                       |  428 ++
 drivers/gpu/drm/xe/xe_ggtt.h                       |   33 +
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |   39 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |  101 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |   73 +
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h        |   57 +
 drivers/gpu/drm/xe/xe_gsc.c                        |  438 ++
 drivers/gpu/drm/xe/xe_gsc.h                        |   20 +
 drivers/gpu/drm/xe/xe_gsc_submit.c                 |  184 +
 drivers/gpu/drm/xe/xe_gsc_submit.h                 |   30 +
 drivers/gpu/drm/xe/xe_gsc_types.h                  |   39 +
 drivers/gpu/drm/xe/xe_gt.c                         |  778 +++
 drivers/gpu/drm/xe/xe_gt.h                         |   72 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c                |  191 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h                |   24 +
 drivers/gpu/drm/xe/xe_gt_clock.c                   |   85 +
 drivers/gpu/drm/xe/xe_gt_clock.h                   |   15 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  249 +
 drivers/gpu/drm/xe/xe_gt_debugfs.h                 |   13 +
 drivers/gpu/drm/xe/xe_gt_freq.c                    |  219 +
 drivers/gpu/drm/xe/xe_gt_freq.h                    |   13 +
 drivers/gpu/drm/xe/xe_gt_idle.c                    |  192 +
 drivers/gpu/drm/xe/xe_gt_idle.h                    |   17 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h              |   38 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |  685 +++
 drivers/gpu/drm/xe/xe_gt_mcr.h                     |   29 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |  646 ++
 drivers/gpu/drm/xe/xe_gt_pagefault.h               |   19 +
 drivers/gpu/drm/xe/xe_gt_printk.h                  |   46 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c                   |   61 +
 drivers/gpu/drm/xe/xe_gt_sysfs.h                   |   19 +
 drivers/gpu/drm/xe/xe_gt_sysfs_types.h             |   26 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c          |  251 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h          |   16 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c        |  406 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h        |   26 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h  |   28 +
 drivers/gpu/drm/xe/xe_gt_topology.c                |  169 +
 drivers/gpu/drm/xe/xe_gt_topology.h                |   25 +
 drivers/gpu/drm/xe/xe_gt_types.h                   |  363 ++
 drivers/gpu/drm/xe/xe_guc.c                        |  911 +++
 drivers/gpu/drm/xe/xe_guc.h                        |   72 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  672 +++
 drivers/gpu/drm/xe/xe_guc_ads.h                    |   17 +
 drivers/gpu/drm/xe/xe_guc_ads_types.h              |   25 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     | 1320 +++++
 drivers/gpu/drm/xe/xe_guc_ct.h                     |   59 +
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |  115 +
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |   74 +
 drivers/gpu/drm/xe/xe_guc_debugfs.h                |   14 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |   54 +
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |  361 ++
 drivers/gpu/drm/xe/xe_guc_hwconfig.c               |  104 +
 drivers/gpu/drm/xe/xe_guc_hwconfig.h               |   17 +
 drivers/gpu/drm/xe/xe_guc_log.c                    |   97 +
 drivers/gpu/drm/xe/xe_guc_log.h                    |   48 +
 drivers/gpu/drm/xe/xe_guc_log_types.h              |   23 +
 drivers/gpu/drm/xe/xe_guc_pc.c                     | 1000 ++++
 drivers/gpu/drm/xe/xe_guc_pc.h                     |   31 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h               |   34 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 | 1990 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.h                 |   38 +
 drivers/gpu/drm/xe/xe_guc_submit_types.h           |  155 +
 drivers/gpu/drm/xe/xe_guc_types.h                  |   81 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |  234 +
 drivers/gpu/drm/xe/xe_heci_gsc.h                   |   35 +
 drivers/gpu/drm/xe/xe_huc.c                        |  307 +
 drivers/gpu/drm/xe/xe_huc.h                        |   26 +
 drivers/gpu/drm/xe/xe_huc_debugfs.c                |   70 +
 drivers/gpu/drm/xe/xe_huc_debugfs.h                |   14 +
 drivers/gpu/drm/xe/xe_huc_types.h                  |   24 +
 drivers/gpu/drm/xe/xe_hw_engine.c                  |  883 +++
 drivers/gpu/drm/xe/xe_hw_engine.h                  |   70 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |  675 +++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h      |   36 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h            |  225 +
 drivers/gpu/drm/xe/xe_hw_fence.c                   |  230 +
 drivers/gpu/drm/xe/xe_hw_fence.h                   |   30 +
 drivers/gpu/drm/xe/xe_hw_fence_types.h             |   72 +
 drivers/gpu/drm/xe/xe_hwmon.c                      |  776 +++
 drivers/gpu/drm/xe/xe_hwmon.h                      |   19 +
 drivers/gpu/drm/xe/xe_irq.c                        |  666 +++
 drivers/gpu/drm/xe/xe_irq.h                        |   19 +
 drivers/gpu/drm/xe/xe_lmtt.c                       |  506 ++
 drivers/gpu/drm/xe/xe_lmtt.h                       |   27 +
 drivers/gpu/drm/xe/xe_lmtt_2l.c                    |  150 +
 drivers/gpu/drm/xe/xe_lmtt_ml.c                    |  161 +
 drivers/gpu/drm/xe/xe_lmtt_types.h                 |   63 +
 drivers/gpu/drm/xe/xe_lrc.c                        | 1272 ++++
 drivers/gpu/drm/xe/xe_lrc.h                        |   58 +
 drivers/gpu/drm/xe/xe_lrc_types.h                  |   46 +
 drivers/gpu/drm/xe/xe_macros.h                     |   18 +
 drivers/gpu/drm/xe/xe_map.h                        |   93 +
 drivers/gpu/drm/xe/xe_migrate.c                    | 1410 +++++
 drivers/gpu/drm/xe/xe_migrate.h                    |  110 +
 drivers/gpu/drm/xe/xe_migrate_doc.h                |   88 +
 drivers/gpu/drm/xe/xe_mmio.c                       |  524 ++
 drivers/gpu/drm/xe/xe_mmio.h                       |  107 +
 drivers/gpu/drm/xe/xe_mocs.c                       |  580 ++
 drivers/gpu/drm/xe/xe_mocs.h                       |   17 +
 drivers/gpu/drm/xe/xe_module.c                     |  101 +
 drivers/gpu/drm/xe/xe_module.h                     |   26 +
 drivers/gpu/drm/xe/xe_pat.c                        |  459 ++
 drivers/gpu/drm/xe/xe_pat.h                        |   61 +
 drivers/gpu/drm/xe/xe_pci.c                        |  951 +++
 drivers/gpu/drm/xe/xe_pci.h                        |   12 +
 drivers/gpu/drm/xe/xe_pci_types.h                  |   46 +
 drivers/gpu/drm/xe/xe_pcode.c                      |  296 +
 drivers/gpu/drm/xe/xe_pcode.h                      |   30 +
 drivers/gpu/drm/xe/xe_pcode_api.h                  |   49 +
 drivers/gpu/drm/xe/xe_platform_types.h             |   37 +
 drivers/gpu/drm/xe/xe_pm.c                         |  405 ++
 drivers/gpu/drm/xe/xe_pm.h                         |   35 +
 drivers/gpu/drm/xe/xe_preempt_fence.c              |  158 +
 drivers/gpu/drm/xe/xe_preempt_fence.h              |   61 +
 drivers/gpu/drm/xe/xe_preempt_fence_types.h        |   32 +
 drivers/gpu/drm/xe/xe_pt.c                         | 1653 ++++++
 drivers/gpu/drm/xe/xe_pt.h                         |   48 +
 drivers/gpu/drm/xe/xe_pt_types.h                   |   77 +
 drivers/gpu/drm/xe/xe_pt_walk.c                    |  160 +
 drivers/gpu/drm/xe/xe_pt_walk.h                    |  161 +
 drivers/gpu/drm/xe/xe_query.c                      |  552 ++
 drivers/gpu/drm/xe/xe_query.h                      |   14 +
 drivers/gpu/drm/xe/xe_range_fence.c                |  156 +
 drivers/gpu/drm/xe/xe_range_fence.h                |   75 +
 drivers/gpu/drm/xe/xe_reg_sr.c                     |  284 +
 drivers/gpu/drm/xe/xe_reg_sr.h                     |   28 +
 drivers/gpu/drm/xe/xe_reg_sr_types.h               |   37 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |  146 +
 drivers/gpu/drm/xe/xe_reg_whitelist.h              |   23 +
 drivers/gpu/drm/xe/xe_res_cursor.h                 |  240 +
 drivers/gpu/drm/xe/xe_ring_ops.c                   |  482 ++
 drivers/gpu/drm/xe/xe_ring_ops.h                   |   17 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h             |   22 +
 drivers/gpu/drm/xe/xe_rtp.c                        |  325 +
 drivers/gpu/drm/xe/xe_rtp.h                        |  430 ++
 drivers/gpu/drm/xe/xe_rtp_helpers.h                |   81 +
 drivers/gpu/drm/xe/xe_rtp_types.h                  |  124 +
 drivers/gpu/drm/xe/xe_sa.c                         |  106 +
 drivers/gpu/drm/xe/xe_sa.h                         |   40 +
 drivers/gpu/drm/xe/xe_sa_types.h                   |   19 +
 drivers/gpu/drm/xe/xe_sched_job.c                  |  280 +
 drivers/gpu/drm/xe/xe_sched_job.h                  |   80 +
 drivers/gpu/drm/xe/xe_sched_job_types.h            |   46 +
 drivers/gpu/drm/xe/xe_sriov.c                      |   55 +
 drivers/gpu/drm/xe/xe_sriov.h                      |   42 +
 drivers/gpu/drm/xe/xe_sriov_printk.h               |   46 +
 drivers/gpu/drm/xe/xe_sriov_types.h                |   28 +
 drivers/gpu/drm/xe/xe_step.c                       |  264 +
 drivers/gpu/drm/xe/xe_step.h                       |   23 +
 drivers/gpu/drm/xe/xe_step_types.h                 |   50 +
 drivers/gpu/drm/xe/xe_sync.c                       |  344 ++
 drivers/gpu/drm/xe/xe_sync.h                       |   36 +
 drivers/gpu/drm/xe/xe_sync_types.h                 |   28 +
 drivers/gpu/drm/xe/xe_tile.c                       |  185 +
 drivers/gpu/drm/xe/xe_tile.h                       |   18 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c                 |   57 +
 drivers/gpu/drm/xe/xe_tile_sysfs.h                 |   19 +
 drivers/gpu/drm/xe/xe_tile_sysfs_types.h           |   27 +
 drivers/gpu/drm/xe/xe_trace.c                      |    9 +
 drivers/gpu/drm/xe/xe_trace.h                      |  608 ++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |  334 ++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h             |   21 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |  118 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h                |   13 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |  480 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h               |   44 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h         |   52 +
 drivers/gpu/drm/xe/xe_tuning.c                     |  121 +
 drivers/gpu/drm/xe/xe_tuning.h                     |   16 +
 drivers/gpu/drm/xe/xe_uc.c                         |  258 +
 drivers/gpu/drm/xe/xe_uc.h                         |   24 +
 drivers/gpu/drm/xe/xe_uc_debugfs.c                 |   26 +
 drivers/gpu/drm/xe/xe_uc_debugfs.h                 |   14 +
 drivers/gpu/drm/xe/xe_uc_fw.c                      |  882 +++
 drivers/gpu/drm/xe/xe_uc_fw.h                      |  184 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h                  |  321 +
 drivers/gpu/drm/xe/xe_uc_fw_types.h                |  146 +
 drivers/gpu/drm/xe/xe_uc_types.h                   |   28 +
 drivers/gpu/drm/xe/xe_vm.c                         | 3209 ++++++++++
 drivers/gpu/drm/xe/xe_vm.h                         |  263 +
 drivers/gpu/drm/xe/xe_vm_doc.h                     |  555 ++
 drivers/gpu/drm/xe/xe_vm_types.h                   |  373 ++
 drivers/gpu/drm/xe/xe_wa.c                         |  895 +++
 drivers/gpu/drm/xe/xe_wa.h                         |   32 +
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   24 +
 drivers/gpu/drm/xe/xe_wait_user_fence.c            |  179 +
 drivers/gpu/drm/xe/xe_wait_user_fence.h            |   15 +
 drivers/gpu/drm/xe/xe_wopcm.c                      |  270 +
 drivers/gpu/drm/xe/xe_wopcm.h                      |   16 +
 drivers/gpu/drm/xe/xe_wopcm_types.h                |   26 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    1 -
 drivers/greybus/Kconfig                            |    1 +
 drivers/hid/hid-apple.c                            |    2 +
 drivers/hid/hid-asus.c                             |   27 +-
 drivers/hid/hid-core.c                             |   12 +-
 drivers/hid/hid-debug.c                            |    3 +
 drivers/hid/hid-glorious.c                         |   16 +-
 drivers/hid/hid-ids.h                              |   12 +-
 drivers/hid/hid-logitech-dj.c                      |   11 +-
 drivers/hid/hid-mcp2221.c                          |    4 +-
 drivers/hid/hid-multitouch.c                       |    5 +
 drivers/hid/hid-picolcd_fb.c                       |    1 +
 drivers/hid/hid-quirks.c                           |    1 +
 drivers/hwmon/acpi_power_meter.c                   |    4 +
 drivers/hwmon/corsair-psu.c                        |   18 +-
 drivers/hwmon/ltc2991.c                            |    2 +-
 drivers/hwmon/max31827.c                           |    1 +
 drivers/hwmon/nzxt-kraken2.c                       |    4 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |    4 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |    6 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   58 +-
 drivers/hwtracing/coresight/ultrasoc-smb.h         |    6 +-
 drivers/hwtracing/ptt/hisi_ptt.c                   |   14 +-
 drivers/i2c/busses/i2c-designware-common.c         |   16 +-
 drivers/i2c/busses/i2c-ocores.c                    |    4 +-
 drivers/i2c/busses/i2c-pxa.c                       |   76 +-
 drivers/infiniband/core/umem.c                     |    6 -
 drivers/infiniband/core/verbs.c                    |    2 +-
 drivers/infiniband/hw/bnxt_re/main.c               |    2 +-
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c         |   13 +-
 drivers/infiniband/hw/irdma/hw.c                   |   16 +-
 drivers/infiniband/hw/irdma/main.c                 |    2 +-
 drivers/infiniband/hw/irdma/main.h                 |    2 +-
 drivers/infiniband/hw/irdma/verbs.c                |   35 +-
 drivers/infiniband/hw/irdma/verbs.h                |    1 +
 drivers/infiniband/ulp/rtrs/rtrs-clt.c             |    7 +-
 drivers/infiniband/ulp/rtrs/rtrs-srv.c             |   37 +-
 drivers/iommu/intel/dmar.c                         |   18 +
 drivers/iommu/intel/iommu.c                        |   18 +-
 drivers/iommu/intel/iommu.h                        |    3 +
 drivers/iommu/intel/svm.c                          |   26 +
 drivers/iommu/iommu.c                              |   79 +-
 drivers/iommu/iommufd/device.c                     |   14 +-
 drivers/iommu/iommufd/hw_pagetable.c               |    8 +-
 drivers/iommu/iommufd/ioas.c                       |   14 +-
 drivers/iommu/iommufd/iommufd_private.h            |   70 +-
 drivers/iommu/iommufd/main.c                       |  146 +-
 drivers/iommu/iommufd/selftest.c                   |   14 +-
 drivers/iommu/iommufd/vfio_compat.c                |   18 +-
 drivers/iommu/of_iommu.c                           |   14 +-
 drivers/irqchip/irq-gic-v3-its.c                   |   16 +-
 drivers/leds/led-class.c                           |   14 -
 drivers/leds/trigger/ledtrig-netdev.c              |   11 +-
 drivers/md/bcache/bcache.h                         |    1 +
 drivers/md/bcache/btree.c                          |   27 +-
 drivers/md/bcache/journal.c                        |   20 +-
 drivers/md/bcache/movinggc.c                       |   16 +-
 drivers/md/bcache/request.c                        |   74 +-
 drivers/md/bcache/request.h                        |    2 +-
 drivers/md/bcache/super.c                          |   44 +-
 drivers/md/bcache/sysfs.c                          |    2 +-
 drivers/md/bcache/writeback.c                      |   40 +-
 drivers/md/dm-bufio.c                              |   87 +-
 drivers/md/dm-crypt.c                              |    2 +-
 drivers/md/dm-delay.c                              |  112 +-
 drivers/md/dm-flakey.c                             |    2 +-
 drivers/md/dm-verity-fec.c                         |    7 +-
 drivers/md/dm-verity-target.c                      |   30 +-
 drivers/md/dm-verity.h                             |    8 +-
 drivers/md/md.c                                    |  147 +-
 drivers/md/raid5.c                                 |    4 +-
 drivers/media/pci/ivtv/Kconfig                     |    4 +-
 drivers/media/pci/ivtv/ivtvfb.c                    |    6 +-
 drivers/media/pci/mgb4/Kconfig                     |    1 +
 drivers/media/pci/mgb4/mgb4_core.c                 |   20 +-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |    2 +-
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |   10 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |    8 +-
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h    |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |   29 +-
 drivers/misc/mei/client.c                          |    4 +-
 drivers/misc/mei/pxp/mei_pxp.c                     |    3 +-
 drivers/mmc/core/block.c                           |    2 +
 drivers/mmc/core/core.c                            |    9 +-
 drivers/mmc/host/cqhci-core.c                      |   44 +-
 drivers/mmc/host/sdhci-pci-gli.c                   |   54 +-
 drivers/mmc/host/sdhci-sprd.c                      |   25 +
 drivers/net/arcnet/arcdevice.h                     |    2 +
 drivers/net/arcnet/com20020-pci.c                  |   89 +-
 drivers/net/bonding/bond_main.c                    |    6 +
 drivers/net/dsa/microchip/ksz_common.c             |   16 +-
 drivers/net/dsa/mv88e6xxx/chip.c                   |   26 +-
 drivers/net/dsa/mv88e6xxx/pcs-639x.c               |   31 +-
 drivers/net/ethernet/amd/pds_core/adminq.c         |    2 +-
 drivers/net/ethernet/amd/pds_core/core.h           |    2 +-
 drivers/net/ethernet/amd/pds_core/dev.c            |    8 +-
 drivers/net/ethernet/amd/pds_core/devlink.c        |    2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c           |   14 +
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c       |   11 +-
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c          |   14 +-
 drivers/net/ethernet/aquantia/atlantic/aq_ptp.c    |   10 +-
 drivers/net/ethernet/aquantia/atlantic/aq_ptp.h    |    4 +-
 drivers/net/ethernet/aquantia/atlantic/aq_ring.c   |   18 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c       |    1 +
 drivers/net/ethernet/broadcom/tg3.c                |   53 +-
 drivers/net/ethernet/broadcom/tg3.h                |    4 +-
 drivers/net/ethernet/cortina/gemini.c              |   45 +-
 drivers/net/ethernet/cortina/gemini.h              |    4 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c   |   16 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.h   |    2 +-
 drivers/net/ethernet/google/gve/gve_main.c         |    8 +-
 drivers/net/ethernet/google/gve/gve_rx.c           |    4 -
 drivers/net/ethernet/google/gve/gve_tx.c           |    4 -
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_mac.c  |   29 +
 drivers/net/ethernet/hisilicon/hns/hns_enet.c      |   53 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.h      |    3 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c |    9 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c    |    2 +-
 .../ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |   33 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |   25 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h  |    1 +
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c   |    7 +
 drivers/net/ethernet/intel/i40e/i40e_main.c        |    2 +-
 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c |   16 +-
 drivers/net/ethernet/intel/iavf/iavf_ethtool.c     |   12 +-
 drivers/net/ethernet/intel/iavf/iavf_txrx.h        |    1 -
 drivers/net/ethernet/intel/ice/ice_ddp.c           |  103 +-
 drivers/net/ethernet/intel/ice/ice_dpll.c          |   21 +-
 drivers/net/ethernet/intel/ice/ice_dpll.h          |    1 -
 drivers/net/ethernet/intel/ice/ice_lag.c           |  122 +-
 drivers/net/ethernet/intel/ice/ice_lag.h           |    1 +
 drivers/net/ethernet/intel/ice/ice_main.c          |   12 +-
 drivers/net/ethernet/intel/ice/ice_ptp.c           |  144 +-
 drivers/net/ethernet/intel/ice/ice_ptp.h           |    5 +-
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c        |   54 +
 drivers/net/ethernet/intel/ice/ice_ptp_hw.h        |    2 +
 drivers/net/ethernet/intel/ice/ice_sriov.c         |    7 +-
 drivers/net/ethernet/intel/ice/ice_txrx.c          |    3 -
 drivers/net/ethernet/intel/ice/ice_txrx.h          |    1 -
 drivers/net/ethernet/intel/ice/ice_vf_lib.c        |   20 +
 .../net/ethernet/intel/ice/ice_vf_vsi_vlan_ops.c   |   11 +-
 drivers/net/ethernet/intel/ice/ice_virtchnl.c      |   30 +-
 drivers/net/ethernet/marvell/mvneta.c              |   28 +-
 drivers/net/ethernet/marvell/octeontx2/af/mbox.h   |    2 +-
 drivers/net/ethernet/marvell/octeontx2/af/mcs.c    |   18 +-
 drivers/net/ethernet/marvell/octeontx2/af/mcs.h    |    2 +
 .../net/ethernet/marvell/octeontx2/af/mcs_reg.h    |   31 +-
 drivers/net/ethernet/marvell/octeontx2/af/rvu.c    |    3 +
 drivers/net/ethernet/marvell/octeontx2/af/rvu.h    |    1 +
 .../ethernet/marvell/octeontx2/af/rvu_devlink.c    |    5 +-
 .../net/ethernet/marvell/octeontx2/af/rvu_nix.c    |   12 +-
 .../net/ethernet/marvell/octeontx2/af/rvu_npc.c    |    8 +-
 .../net/ethernet/marvell/octeontx2/af/rvu_reg.c    |    4 +-
 .../net/ethernet/marvell/octeontx2/af/rvu_reg.h    |    1 +
 drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c |    3 +
 .../ethernet/marvell/octeontx2/nic/otx2_common.h   |    2 +
 .../ethernet/marvell/octeontx2/nic/otx2_ethtool.c  |    6 +-
 .../ethernet/marvell/octeontx2/nic/otx2_flows.c    |   20 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |   20 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_tc.c   |  120 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_txrx.c |   20 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c   |   20 +-
 .../ethernet/mellanox/mlx5/core/en/reporter_rx.c   |    4 +-
 .../net/ethernet/mellanox/mlx5/core/en/tc_tun.c    |   30 +-
 .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   |   13 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c   |   12 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |   60 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tx.c    |    4 +-
 drivers/net/ethernet/mellanox/mlx5/core/eq.c       |   25 +-
 .../ethernet/mellanox/mlx5/core/eswitch_offloads.c |    3 +-
 .../net/ethernet/mellanox/mlx5/core/irq_affinity.c |   42 -
 .../net/ethernet/mellanox/mlx5/core/lib/clock.c    |    7 +-
 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c  |    6 +-
 drivers/net/ethernet/mellanox/mlx5/core/pci_irq.h  |    3 +
 .../mellanox/mlx5/core/steering/dr_action.c        |    3 +-
 .../ethernet/mellanox/mlx5/core/steering/dr_send.c |  115 +-
 .../ethernet/netronome/nfp/flower/tunnel_conf.c    |  127 +-
 drivers/net/ethernet/pensando/ionic/ionic_dev.h    |    2 +-
 drivers/net/ethernet/pensando/ionic/ionic_lif.c    |   16 +-
 drivers/net/ethernet/realtek/r8169_main.c          |   62 +-
 drivers/net/ethernet/renesas/ravb_main.c           |   69 +-
 drivers/net/ethernet/renesas/rswitch.c             |   22 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |    2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c       |   45 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h       |    4 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |    3 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |    4 +-
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c     |    4 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   11 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |    1 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.c       |   15 +-
 drivers/net/ethernet/wangxun/libwx/wx_hw.c         |    8 +-
 drivers/net/ethernet/wangxun/libwx/wx_lib.c        |    2 +-
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c      |    4 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c    |    4 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c  |    2 +-
 drivers/net/hyperv/Kconfig                         |    1 +
 drivers/net/hyperv/netvsc_drv.c                    |   66 +-
 drivers/net/ipa/reg/gsi_reg-v5.0.c                 |    2 +-
 drivers/net/ipvlan/ipvlan_core.c                   |   41 +-
 drivers/net/macvlan.c                              |    2 +-
 drivers/net/netdevsim/bpf.c                        |    4 +-
 drivers/net/netkit.c                               |   28 +-
 drivers/net/ppp/ppp_synctty.c                      |    6 +-
 drivers/net/usb/aqc111.c                           |    8 +-
 drivers/net/usb/ax88179_178a.c                     |    4 +-
 drivers/net/usb/qmi_wwan.c                         |    1 +
 drivers/net/usb/r8152.c                            |   28 +-
 drivers/net/veth.c                                 |   49 +-
 drivers/net/vrf.c                                  |   38 +-
 drivers/net/wireguard/device.c                     |    4 +-
 drivers/net/wireguard/receive.c                    |   12 +-
 drivers/net/wireguard/send.c                       |    3 +-
 drivers/net/wireless/ath/ath9k/Kconfig             |    4 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c   |    4 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    |    1 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c   |    4 +-
 drivers/nfc/virtual_ncidev.c                       |    7 +-
 drivers/nvme/host/Kconfig                          |    5 +-
 drivers/nvme/host/auth.c                           |    5 +-
 drivers/nvme/host/core.c                           |  107 +-
 drivers/nvme/host/fabrics.c                        |    2 +
 drivers/nvme/host/fc.c                             |   25 +-
 drivers/nvme/host/ioctl.c                          |   21 +-
 drivers/nvme/host/nvme.h                           |   11 +
 drivers/nvme/host/pci.c                            |   30 +-
 drivers/nvme/host/rdma.c                           |   24 +-
 drivers/nvme/host/tcp.c                            |   59 +-
 drivers/nvme/target/Kconfig                        |    9 +-
 drivers/nvme/target/configfs.c                     |    5 +-
 drivers/nvme/target/fabrics-cmd.c                  |    4 +
 drivers/nvme/target/tcp.c                          |    4 +-
 drivers/nvmem/core.c                               |    6 +
 drivers/of/dynamic.c                               |    5 +-
 drivers/parisc/power.c                             |    2 +-
 drivers/parport/parport_pc.c                       |   21 +
 drivers/phy/Kconfig                                |    1 -
 drivers/phy/Makefile                               |    1 -
 drivers/phy/qualcomm/Kconfig                       |    2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |   44 +-
 drivers/phy/realtek/Kconfig                        |   32 -
 drivers/phy/realtek/Makefile                       |    3 -
 drivers/phy/realtek/phy-rtk-usb2.c                 | 1325 -----
 drivers/phy/realtek/phy-rtk-usb3.c                 |  761 ---
 drivers/pinctrl/cirrus/Kconfig                     |    3 +-
 drivers/pinctrl/core.c                             |    6 +-
 drivers/pinctrl/nxp/pinctrl-s32cc.c                |    4 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |    1 +
 drivers/pinctrl/realtek/pinctrl-rtd.c              |    4 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c              |   13 +-
 drivers/platform/mellanox/mlxbf-bootctl.c          |   39 +-
 drivers/platform/mellanox/mlxbf-pmc.c              |   14 +
 drivers/platform/surface/aggregator/core.c         |    5 +-
 drivers/platform/x86/Kconfig                       |    2 +-
 drivers/platform/x86/amd/pmc/pmc.c                 |   31 +-
 drivers/platform/x86/asus-nb-wmi.c                 |   61 +-
 drivers/platform/x86/asus-wmi.c                    |   58 +
 drivers/platform/x86/asus-wmi.h                    |    7 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |   26 +-
 drivers/platform/x86/ideapad-laptop.c              |   11 +-
 drivers/platform/x86/intel/telemetry/core.c        |    4 +-
 drivers/platform/x86/wmi.c                         |    5 +
 drivers/pmdomain/arm/scmi_perf_domain.c            |    2 +-
 drivers/pmdomain/qcom/rpmpd.c                      |    1 +
 drivers/powercap/dtpm_cpu.c                        |   23 +-
 drivers/powercap/dtpm_devfreq.c                    |   11 +-
 drivers/ptp/ptp_chardev.c                          |    3 +-
 drivers/ptp/ptp_clock.c                            |    5 +-
 drivers/ptp/ptp_private.h                          |    8 +-
 drivers/ptp/ptp_sysfs.c                            |    3 +-
 drivers/pwm/pwm-bcm2835.c                          |    2 +
 drivers/s390/block/dasd.c                          |   24 +-
 drivers/s390/block/dasd_int.h                      |    2 +-
 drivers/s390/net/Kconfig                           |    3 +-
 drivers/s390/net/ism_drv.c                         |   93 +-
 drivers/scsi/be2iscsi/be_main.c                    |    1 +
 drivers/scsi/qla2xxx/qla_os.c                      |   12 +-
 drivers/scsi/scsi_debug.c                          |    9 +-
 drivers/scsi/sd.c                                  |   62 +-
 drivers/soc/qcom/Kconfig                           |    1 +
 drivers/soc/qcom/pmic_glink_altmode.c              |   33 +-
 drivers/staging/sm750fb/sm750.c                    |   65 +-
 drivers/tee/optee/device.c                         |   17 +-
 drivers/thunderbolt/switch.c                       |    6 +-
 drivers/thunderbolt/tb.c                           |   12 +-
 drivers/tty/serial/8250/8250_dw.c                  |    1 +
 drivers/tty/serial/8250/8250_early.c               |    1 +
 drivers/tty/serial/8250/8250_omap.c                |   14 +-
 drivers/tty/serial/amba-pl011.c                    |  112 +-
 drivers/tty/serial/ma35d1_serial.c                 |   10 +-
 drivers/tty/serial/sc16is7xx.c                     |   12 +
 drivers/ufs/core/ufs-mcq.c                         |    5 +-
 drivers/ufs/core/ufshcd.c                          |   13 +
 drivers/usb/cdns3/cdnsp-ring.c                     |    3 +
 drivers/usb/core/config.c                          |    3 +-
 drivers/usb/core/hub.c                             |   23 -
 drivers/usb/dwc2/hcd_intr.c                        |   15 +-
 drivers/usb/dwc3/core.c                            |    2 +
 drivers/usb/dwc3/drd.c                             |    2 +-
 drivers/usb/dwc3/dwc3-qcom.c                       |   69 +-
 drivers/usb/dwc3/dwc3-rtk.c                        |    8 +-
 drivers/usb/gadget/function/f_hid.c                |    7 +-
 drivers/usb/gadget/udc/core.c                      |    4 +-
 drivers/usb/host/xhci-mtk-sch.c                    |   13 +-
 drivers/usb/host/xhci-mtk.h                        |    2 +
 drivers/usb/host/xhci-pci.c                        |    2 -
 drivers/usb/host/xhci-plat.c                       |   50 +-
 drivers/usb/misc/onboard_usb_hub.c                 |    2 +
 drivers/usb/misc/onboard_usb_hub.h                 |    7 +
 drivers/usb/misc/usb-ljca.c                        |   17 +-
 drivers/usb/serial/option.c                        |   11 +-
 drivers/usb/typec/class.c                          |    5 +-
 drivers/usb/typec/mux/Kconfig                      |    2 +-
 drivers/usb/typec/mux/nb7vpq904m.c                 |   44 +-
 drivers/usb/typec/tcpm/Kconfig                     |    1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |   41 +-
 drivers/usb/typec/tcpm/tcpm.c                      |   12 +-
 drivers/usb/typec/tipd/core.c                      |   14 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c                  |    7 +-
 drivers/vdpa/pds/debugfs.c                         |    2 +-
 drivers/vdpa/pds/vdpa_dev.c                        |    7 +-
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c               |    4 +-
 drivers/vfio/pci/pds/pci_drv.c                     |    4 +-
 drivers/vfio/pci/pds/vfio_dev.c                    |   30 +-
 drivers/vfio/pci/pds/vfio_dev.h                    |    2 +-
 drivers/vhost/vdpa.c                               |    1 -
 drivers/video/fbdev/Kconfig                        |   50 +-
 drivers/video/fbdev/acornfb.c                      |    2 +-
 drivers/video/fbdev/amba-clcd.c                    |    2 +
 drivers/video/fbdev/arcfb.c                        |  114 +-
 drivers/video/fbdev/au1100fb.c                     |    2 +
 drivers/video/fbdev/au1200fb.c                     |   11 +-
 drivers/video/fbdev/clps711x-fb.c                  |    4 +-
 drivers/video/fbdev/core/Kconfig                   |    7 +-
 drivers/video/fbdev/core/Makefile                  |    2 +-
 drivers/video/fbdev/core/cfbcopyarea.c             |    3 +
 drivers/video/fbdev/core/cfbfillrect.c             |    3 +
 drivers/video/fbdev/core/cfbimgblt.c               |    3 +
 drivers/video/fbdev/core/fb_chrdev.c               |   68 +-
 drivers/video/fbdev/core/fb_defio.c                |    2 +
 drivers/video/fbdev/core/fb_io_fops.c              |   36 +
 drivers/video/fbdev/core/fb_sys_fops.c             |    6 +
 drivers/video/fbdev/core/syscopyarea.c             |    3 +
 drivers/video/fbdev/core/sysfillrect.c             |    3 +
 drivers/video/fbdev/core/sysimgblt.c               |    3 +
 drivers/video/fbdev/cyber2000fb.c                  |    9 +-
 drivers/video/fbdev/ep93xx-fb.c                    |    2 +
 drivers/video/fbdev/gbefb.c                        |    2 +
 drivers/video/fbdev/omap/omapfb_main.c             |    2 +
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |    2 +
 drivers/video/fbdev/ps3fb.c                        |   11 +-
 drivers/video/fbdev/sa1100fb.c                     |    2 +
 drivers/video/fbdev/sbuslib.c                      |    5 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |   16 +-
 drivers/video/fbdev/simplefb.c                     |  132 +-
 drivers/video/fbdev/sm712fb.c                      |    6 +-
 drivers/video/fbdev/smscufx.c                      |    2 +
 drivers/video/fbdev/udlfb.c                        |    2 +
 drivers/video/fbdev/vermilion/vermilion.c          |    2 +
 drivers/video/fbdev/vfb.c                          |   10 +-
 drivers/video/fbdev/vt8500lcdfb.c                  |    4 +-
 drivers/video/fbdev/wm8505fb.c                     |    2 +
 drivers/virtio/virtio_pci_common.c                 |    6 +-
 drivers/virtio/virtio_pci_modern_dev.c             |    7 +-
 drivers/xen/events/events_2l.c                     |    8 +-
 drivers/xen/events/events_base.c                   |  578 +-
 drivers/xen/events/events_internal.h               |    1 -
 drivers/xen/pcpu.c                                 |   22 +
 drivers/xen/privcmd.c                              |    2 +-
 drivers/xen/swiotlb-xen.c                          |    1 +
 drivers/xen/xen-front-pgdir-shbuf.c                |   34 +-
 fs/Kconfig                                         |    1 +
 fs/afs/dynroot.c                                   |    4 +-
 fs/afs/internal.h                                  |    1 +
 fs/afs/server_list.c                               |    2 +-
 fs/afs/super.c                                     |    4 +
 fs/afs/vl_rotate.c                                 |   10 +
 fs/autofs/inode.c                                  |   56 +-
 fs/bcachefs/Kconfig                                |   12 +
 fs/bcachefs/alloc_foreground.c                     |   30 +
 fs/bcachefs/backpointers.c                         |   10 +-
 fs/bcachefs/bcachefs.h                             |    6 +-
 fs/bcachefs/bcachefs_format.h                      |    8 +-
 fs/bcachefs/btree_gc.c                             |    9 +-
 fs/bcachefs/btree_io.c                             |    7 +-
 fs/bcachefs/btree_iter.c                           |    8 +-
 fs/bcachefs/btree_journal_iter.c                   |   18 +-
 fs/bcachefs/btree_journal_iter.h                   |   10 +-
 fs/bcachefs/btree_key_cache.c                      |   37 +-
 fs/bcachefs/btree_key_cache_types.h                |   34 +
 fs/bcachefs/btree_trans_commit.c                   |  169 +-
 fs/bcachefs/btree_types.h                          |   35 +-
 fs/bcachefs/btree_update_interior.c                |   44 +-
 fs/bcachefs/btree_update_interior.h                |    1 -
 fs/bcachefs/buckets.c                              |   10 +-
 fs/bcachefs/compress.c                             |   16 +-
 fs/bcachefs/data_update.c                          |  120 +-
 fs/bcachefs/data_update.h                          |    9 +-
 fs/bcachefs/disk_groups.c                          |    4 +-
 fs/bcachefs/ec.c                                   |   16 +-
 fs/bcachefs/errcode.h                              |    3 +-
 fs/bcachefs/extents.c                              |   30 +-
 fs/bcachefs/fs-io-direct.c                         |    8 +-
 fs/bcachefs/fs-io-pagecache.c                      |    2 +-
 fs/bcachefs/fs-io-pagecache.h                      |    2 +-
 fs/bcachefs/fs.c                                   |   11 +-
 fs/bcachefs/fsck.c                                 |    2 +-
 fs/bcachefs/inode.c                                |    8 +-
 fs/bcachefs/io_read.c                              |    2 +-
 fs/bcachefs/io_write.c                             |   16 +-
 fs/bcachefs/io_write.h                             |    3 +-
 fs/bcachefs/journal.c                              |   33 +-
 fs/bcachefs/journal.h                              |  102 +-
 fs/bcachefs/journal_io.c                           |   36 +-
 fs/bcachefs/journal_io.h                           |    2 +-
 fs/bcachefs/journal_reclaim.c                      |   42 +-
 fs/bcachefs/journal_types.h                        |   26 -
 fs/bcachefs/move.c                                 |  126 +-
 fs/bcachefs/move.h                                 |   19 +
 fs/bcachefs/movinggc.c                             |    2 +-
 fs/bcachefs/recovery.c                             |   11 +-
 fs/bcachefs/replicas.c                             |   69 +-
 fs/bcachefs/replicas.h                             |    2 +
 fs/bcachefs/six.c                                  |    7 +-
 fs/bcachefs/snapshot.c                             |    2 +-
 fs/bcachefs/subvolume_types.h                      |    2 +-
 fs/bcachefs/super-io.c                             |    5 +
 fs/bcachefs/super.c                                |   34 +-
 fs/bcachefs/super_types.h                          |    1 +
 fs/bcachefs/trace.h                                |   17 +-
 fs/bcachefs/xattr.c                                |    9 +
 fs/btrfs/ctree.c                                   |    2 +-
 fs/btrfs/delayed-ref.c                             |    4 +-
 fs/btrfs/disk-io.c                                 |    1 +
 fs/btrfs/extent-tree.c                             |   25 +-
 fs/btrfs/extent-tree.h                             |    3 +-
 fs/btrfs/extent_io.c                               |   11 +-
 fs/btrfs/inode.c                                   |    7 +
 fs/btrfs/ioctl.c                                   |   11 +-
 fs/btrfs/qgroup.c                                  |   10 +-
 fs/btrfs/raid-stripe-tree.c                        |    2 +-
 fs/btrfs/ref-verify.c                              |    2 +
 fs/btrfs/scrub.c                                   |   10 +-
 fs/btrfs/send.c                                    |    2 +-
 fs/btrfs/super.c                                   |    5 +-
 fs/btrfs/transaction.c                             |    2 +-
 fs/btrfs/tree-checker.c                            |   39 +
 fs/btrfs/volumes.c                                 |   15 +-
 fs/btrfs/zoned.c                                   |    7 -
 fs/debugfs/file.c                                  |   90 +
 fs/debugfs/inode.c                                 |   64 +-
 fs/debugfs/internal.h                              |   15 +-
 fs/ecryptfs/inode.c                                |   12 +-
 fs/erofs/Kconfig                                   |    2 +-
 fs/erofs/data.c                                    |    5 +-
 fs/erofs/inode.c                                   |   98 +-
 fs/ext2/file.c                                     |    1 -
 fs/inode.c                                         |    2 +
 fs/libfs.c                                         |   14 +-
 fs/nfsd/cache.h                                    |    4 +-
 fs/nfsd/nfs4state.c                                |    2 +-
 fs/nfsd/nfscache.c                                 |   87 +-
 fs/nfsd/nfssvc.c                                   |   14 +-
 fs/nilfs2/sufile.c                                 |   42 +-
 fs/nilfs2/the_nilfs.c                              |    6 +-
 fs/overlayfs/inode.c                               |   10 +-
 fs/overlayfs/overlayfs.h                           |    8 +
 fs/overlayfs/params.c                              |   11 +-
 fs/overlayfs/util.c                                |    2 +-
 fs/proc/task_mmu.c                                 |   26 +-
 fs/smb/client/cifs_spnego.c                        |    4 +-
 fs/smb/client/cifsfs.c                             |  174 +-
 fs/smb/client/cifsglob.h                           |   14 +-
 fs/smb/client/cifspdu.h                            |   28 +-
 fs/smb/client/cifsproto.h                          |   14 +-
 fs/smb/client/cifssmb.c                            |  199 +-
 fs/smb/client/connect.c                            |   41 +-
 fs/smb/client/inode.c                              |   78 +-
 fs/smb/client/readdir.c                            |    6 +-
 fs/smb/client/sess.c                               |   24 +-
 fs/smb/client/smb1ops.c                            |  153 +-
 fs/smb/client/smb2inode.c                          |    2 +-
 fs/smb/client/smb2ops.c                            |  242 +-
 fs/smb/client/smb2pdu.c                            |   42 +-
 fs/smb/client/smb2pdu.h                            |   16 +-
 fs/smb/client/smb2transport.c                      |    5 +-
 fs/smb/common/smb2pdu.h                            |   17 +-
 fs/smb/server/ksmbd_work.c                         |   10 +-
 fs/smb/server/oplock.c                             |    3 +-
 fs/smb/server/smb2pdu.c                            |  162 +-
 fs/smb/server/smbacl.c                             |    7 +-
 fs/smb/server/smbacl.h                             |    2 +-
 fs/smb/server/vfs.c                                |   70 +-
 fs/smb/server/vfs.h                                |   10 +-
 fs/smb/server/vfs_cache.c                          |   33 +-
 fs/smb/server/vfs_cache.h                          |    6 +-
 fs/squashfs/block.c                                |    2 +-
 fs/stat.c                                          |    6 +-
 fs/tracefs/event_inode.c                           |   65 +-
 fs/tracefs/inode.c                                 |   13 +-
 fs/xfs/Kconfig                                     |    2 +-
 fs/xfs/libxfs/xfs_alloc.c                          |   27 +-
 fs/xfs/libxfs/xfs_defer.c                          |   28 +-
 fs/xfs/libxfs/xfs_defer.h                          |    2 +-
 fs/xfs/libxfs/xfs_inode_buf.c                      |    3 +
 fs/xfs/xfs_dquot.c                                 |    5 +-
 fs/xfs/xfs_dquot_item_recover.c                    |   21 +-
 fs/xfs/xfs_inode.h                                 |    8 +
 fs/xfs/xfs_inode_item_recover.c                    |   46 +-
 fs/xfs/xfs_ioctl.c                                 |   30 +-
 fs/xfs/xfs_iops.c                                  |    7 +
 fs/xfs/xfs_log.c                                   |   23 +-
 fs/xfs/xfs_log_recover.c                           |    2 +-
 fs/xfs/xfs_reflink.c                               |    1 +
 include/acpi/acpi_bus.h                            |    1 +
 include/asm-generic/qspinlock.h                    |    2 +-
 include/drm/bridge/aux-bridge.h                    |   37 +
 include/drm/display/drm_dp.h                       |   28 +
 include/drm/display/drm_dp_helper.h                |   32 +
 include/drm/display/drm_dp_mst_helper.h            |   16 +-
 include/drm/drm_atomic_helper.h                    |    7 +-
 include/drm/drm_auth.h                             |   22 -
 include/drm/drm_bridge.h                           |    4 +-
 include/drm/drm_color_mgmt.h                       |   20 +-
 include/drm/drm_device.h                           |   71 +-
 include/drm/drm_drv.h                              |   28 +-
 include/drm/drm_edid.h                             |  153 -
 include/drm/drm_eld.h                              |  164 +
 include/drm/drm_encoder.h                          |   16 +-
 include/drm/drm_exec.h                             |    2 +-
 include/drm/drm_file.h                             |   17 +-
 include/drm/drm_flip_work.h                        |   20 +-
 include/drm/drm_format_helper.h                    |   81 +-
 include/drm/drm_framebuffer.h                      |   12 -
 include/drm/drm_gem.h                              |   32 +-
 include/drm/drm_gem_atomic_helper.h                |   10 +
 include/drm/drm_gpuvm.h                            |  578 +-
 include/drm/drm_ioctl.h                            |   11 -
 include/drm/drm_legacy.h                           |  331 --
 include/drm/drm_mipi_dbi.h                         |    4 +-
 include/drm/drm_mipi_dsi.h                         |    2 +
 include/drm/drm_mode_object.h                      |    2 +-
 include/drm/drm_modeset_helper_vtables.h           |   16 +-
 include/drm/drm_plane.h                            |   31 +
 include/drm/drm_plane_helper.h                     |    2 -
 include/drm/drm_prime.h                            |    7 +
 include/drm/drm_print.h                            |    2 +-
 include/drm/drm_property.h                         |    6 +
 include/drm/gpu_scheduler.h                        |   56 +-
 include/drm/i915_pciids.h                          |    3 +-
 include/drm/xe_pciids.h                            |  190 +
 include/dt-bindings/soc/rockchip,vop2.h            |    4 +
 include/linux/acpi.h                               |   22 +-
 include/linux/amd-pstate.h                         |    4 +
 include/linux/arm_ffa.h                            |    2 +
 include/linux/blk-pm.h                             |    1 -
 include/linux/blk_types.h                          |    4 +-
 include/linux/bpf.h                                |   13 +-
 include/linux/bpf_verifier.h                       |   16 +
 include/linux/closure.h                            |    9 +-
 include/linux/cpuhotplug.h                         |    1 +
 include/linux/debugfs.h                            |   19 +
 include/linux/dma-buf.h                            |   11 +-
 include/linux/dma-fence.h                          |   15 +
 include/linux/export-internal.h                    |    4 +-
 include/linux/fb.h                                 |   16 +-
 include/linux/fw_table.h                           |    3 -
 include/linux/habanalabs/cpucp_if.h                |    8 +-
 include/linux/hid.h                                |    3 +
 include/linux/highmem.h                            |    2 +-
 include/linux/hrtimer.h                            |    4 +-
 include/linux/hugetlb.h                            |    5 +-
 include/linux/ieee80211.h                          |    4 +-
 include/linux/io_uring_types.h                     |    3 +
 include/linux/iommu.h                              |    1 +
 include/linux/iosys-map.h                          |   44 +-
 include/linux/kprobes.h                            |   13 +-
 include/linux/mdio.h                               |    2 +-
 include/linux/netdevice.h                          |   30 +-
 include/linux/pagemap.h                            |   17 +
 include/linux/perf_event.h                         |   13 +-
 include/linux/platform_data/x86/asus-wmi.h         |    3 +
 include/linux/rethook.h                            |    7 +-
 include/linux/sizes.h                              |    9 +
 include/linux/skmsg.h                              |    1 +
 include/linux/stackleak.h                          |    6 +
 include/linux/stmmac.h                             |    1 +
 include/linux/tcp.h                                |    8 +-
 include/linux/units.h                              |    1 +
 include/linux/usb/phy.h                            |   13 -
 include/linux/usb/r8152.h                          |    1 +
 include/linux/vfio.h                               |    8 +-
 include/linux/virtio_pci_modern.h                  |    7 -
 include/net/af_unix.h                              |    1 +
 include/net/cfg80211.h                             |   46 +
 include/net/genetlink.h                            |    2 +
 include/net/neighbour.h                            |    2 +-
 include/net/netfilter/nf_tables.h                  |    4 +-
 include/net/netkit.h                               |    6 +
 include/net/tc_act/tc_ct.h                         |    9 +
 include/net/tcp.h                                  |    9 +-
 include/net/tcp_ao.h                               |    6 +
 include/rdma/ib_umem.h                             |    9 +-
 include/rdma/ib_verbs.h                            |    1 +
 include/scsi/scsi_device.h                         |   12 +-
 include/sound/cs35l41.h                            |    2 +-
 include/trace/events/rxrpc.h                       |    2 +-
 include/uapi/drm/drm.h                             |   72 +-
 include/uapi/drm/drm_fourcc.h                      |   10 +-
 include/uapi/drm/drm_mode.h                        |   45 +-
 include/uapi/drm/habanalabs_accel.h                |   28 +
 include/uapi/drm/i915_drm.h                        |   12 +-
 include/uapi/drm/ivpu_accel.h                      |    2 +-
 include/uapi/drm/msm_drm.h                         |    3 +
 include/uapi/drm/pvr_drm.h                         | 1295 ++++
 include/uapi/drm/qaic_accel.h                      |    5 +-
 include/uapi/drm/v3d_drm.h                         |  245 +-
 include/uapi/drm/virtgpu_drm.h                     |    2 +
 include/uapi/drm/xe_drm.h                          | 1347 +++++
 include/uapi/linux/btrfs_tree.h                    |   24 +-
 include/uapi/linux/fcntl.h                         |    3 +
 include/uapi/linux/stddef.h                        |    2 +-
 include/uapi/linux/sync_file.h                     |   22 +
 include/uapi/linux/v4l2-subdev.h                   |    2 +-
 include/uapi/linux/virtio_pci.h                    |   11 +
 include/xen/events.h                               |    8 +-
 io_uring/cancel.c                                  |   11 +-
 io_uring/fdinfo.c                                  |    9 +-
 io_uring/fs.c                                      |    2 +-
 io_uring/io_uring.c                                |  104 +-
 io_uring/io_uring.h                                |    3 +
 io_uring/kbuf.c                                    |  177 +-
 io_uring/kbuf.h                                    |    5 +
 io_uring/rsrc.c                                    |    2 +-
 io_uring/rsrc.h                                    |    7 -
 io_uring/sqpoll.c                                  |   12 +-
 kernel/Kconfig.kexec                               |    1 -
 kernel/audit_watch.c                               |    2 +-
 kernel/bpf/arraymap.c                              |   58 +-
 kernel/bpf/core.c                                  |   20 +-
 kernel/bpf/memalloc.c                              |    2 +
 kernel/bpf/verifier.c                              |  489 +-
 kernel/cgroup/cgroup.c                             |   12 -
 kernel/cgroup/legacy_freezer.c                     |    8 +-
 kernel/cpu.c                                       |    8 +-
 kernel/events/core.c                               |   78 +-
 kernel/freezer.c                                   |    2 +-
 kernel/futex/core.c                                |    9 +-
 kernel/kprobes.c                                   |    4 +-
 kernel/locking/lockdep.c                           |    3 +-
 kernel/sched/fair.c                                |  161 +-
 kernel/sys.c                                       |    4 +
 kernel/time/hrtimer.c                              |   33 +-
 kernel/trace/rethook.c                             |   23 +-
 kernel/trace/ring_buffer.c                         |   23 +-
 kernel/trace/trace.c                               |  158 +-
 kernel/workqueue.c                                 |   22 +-
 lib/closure.c                                      |    5 +-
 lib/errname.c                                      |    6 -
 lib/fw_table.c                                     |    2 +-
 lib/group_cpus.c                                   |   22 +-
 lib/iov_iter.c                                     |    2 +-
 lib/kunit/kunit-test.c                             |    2 +-
 lib/kunit/test.c                                   |   42 +-
 lib/objpool.c                                      |   17 +
 lib/zstd/common/fse_decompress.c                   |    2 +-
 mm/Kconfig                                         |   16 +-
 mm/damon/core.c                                    |    3 +-
 mm/damon/sysfs-schemes.c                           |   54 +-
 mm/damon/sysfs.c                                   |    6 +-
 mm/filemap.c                                       |    4 +-
 mm/huge_memory.c                                   |   16 +-
 mm/hugetlb.c                                       |    7 +
 mm/kmemleak.c                                      |   40 +-
 mm/ksm.c                                           |    2 +-
 mm/madvise.c                                       |   11 +
 mm/memcontrol.c                                    |    5 +-
 mm/memory.c                                        |    1 +
 mm/memory_hotplug.c                                |   15 +-
 mm/page-writeback.c                                |    2 +-
 mm/userfaultfd.c                                   |    2 +-
 mm/util.c                                          |   10 +
 net/bridge/netfilter/nf_conntrack_bridge.c         |    2 +-
 net/core/dev.c                                     |   61 +-
 net/core/drop_monitor.c                            |    4 +-
 net/core/filter.c                                  |   38 +-
 net/core/gso_test.c                                |   14 +-
 net/core/scm.c                                     |    6 +
 net/core/skmsg.c                                   |    2 +
 net/ethtool/netlink.c                              |    1 +
 net/ipv4/igmp.c                                    |    6 +-
 net/ipv4/inet_diag.c                               |    1 +
 net/ipv4/inet_hashtables.c                         |    2 +-
 net/ipv4/ip_gre.c                                  |   11 +-
 net/ipv4/raw_diag.c                                |    1 +
 net/ipv4/route.c                                   |    2 +-
 net/ipv4/tcp.c                                     |   28 +-
 net/ipv4/tcp_ao.c                                  |   17 +-
 net/ipv4/tcp_diag.c                                |    1 +
 net/ipv4/tcp_input.c                               |   11 +-
 net/ipv4/tcp_ipv4.c                                |    4 +-
 net/ipv4/tcp_minisocks.c                           |    2 +-
 net/ipv4/tcp_output.c                              |   15 +-
 net/ipv4/udp_diag.c                                |    1 +
 net/ipv6/ip6_fib.c                                 |    6 +-
 net/ipv6/tcp_ipv6.c                                |    2 +-
 net/mac80211/Kconfig                               |    2 +-
 net/mac80211/debugfs_netdev.c                      |  150 +-
 net/mac80211/debugfs_sta.c                         |   74 +-
 net/mac80211/driver-ops.h                          |    9 +-
 net/mac80211/ht.c                                  |    1 +
 net/mptcp/mptcp_diag.c                             |    1 +
 net/mptcp/options.c                                |    1 +
 net/mptcp/pm_netlink.c                             |    5 +-
 net/mptcp/protocol.c                               |   11 +-
 net/mptcp/sockopt.c                                |    3 +
 net/ncsi/ncsi-aen.c                                |    5 -
 net/netfilter/ipset/ip_set_core.c                  |   14 +-
 net/netfilter/nf_bpf_link.c                        |   10 +-
 net/netfilter/nf_tables_api.c                      |   65 +-
 net/netfilter/nft_byteorder.c                      |    5 +-
 net/netfilter/nft_dynset.c                         |   13 +-
 net/netfilter/nft_exthdr.c                         |    4 +-
 net/netfilter/nft_fib.c                            |    8 +-
 net/netfilter/nft_meta.c                           |    2 +-
 net/netfilter/nft_set_pipapo.c                     |    3 +
 net/netfilter/nft_set_rbtree.c                     |    2 -
 net/netfilter/xt_owner.c                           |   16 +-
 net/netlink/genetlink.c                            |    3 +
 net/packet/af_packet.c                             |   16 +-
 net/packet/diag.c                                  |    1 +
 net/packet/internal.h                              |    2 +-
 net/psample/psample.c                              |    3 +-
 net/rxrpc/conn_client.c                            |    7 +-
 net/rxrpc/input.c                                  |   61 +-
 net/sched/act_ct.c                                 |    3 +
 net/sctp/diag.c                                    |    1 +
 net/smc/af_smc.c                                   |   12 +-
 net/smc/smc_clc.c                                  |    9 +-
 net/smc/smc_clc.h                                  |    4 +-
 net/smc/smc_diag.c                                 |    1 +
 net/tipc/diag.c                                    |    1 +
 net/tipc/netlink_compat.c                          |    1 +
 net/tls/tls_sw.c                                   |    5 +
 net/unix/af_unix.c                                 |   11 +-
 net/unix/diag.c                                    |    1 +
 net/unix/unix_bpf.c                                |    5 +
 net/vmw_vsock/diag.c                               |    1 +
 net/vmw_vsock/virtio_transport_common.c            |    3 +-
 net/wireless/core.c                                |    6 +-
 net/wireless/core.h                                |    1 +
 net/wireless/debugfs.c                             |  160 +
 net/wireless/nl80211.c                             |   55 +-
 net/xdp/xsk.c                                      |    5 +-
 net/xdp/xsk_diag.c                                 |    1 +
 scripts/Makefile.lib                               |    4 +-
 scripts/checkstack.pl                              |   11 +-
 scripts/dtc/dt-extract-compatibles                 |   14 +-
 scripts/gcc-plugins/latent_entropy_plugin.c        |    4 +-
 scripts/gcc-plugins/randomize_layout_plugin.c      |   13 +-
 scripts/gdb/linux/device.py                        |   16 +-
 scripts/gdb/linux/tasks.py                         |   18 +-
 scripts/kconfig/symbol.c                           |   14 +-
 scripts/mod/modpost.c                              |    6 +-
 sound/core/pcm.c                                   |    1 +
 sound/core/pcm_drm_eld.c                           |    1 +
 sound/drivers/pcmtest.c                            |   13 +-
 sound/hda/intel-nhlt.c                             |   33 +-
 sound/pci/hda/cs35l41_hda.c                        |   28 +-
 sound/pci/hda/cs35l56_hda_i2c.c                    |    4 +
 sound/pci/hda/cs35l56_hda_spi.c                    |    4 +
 sound/pci/hda/hda_intel.c                          |    5 +
 sound/pci/hda/patch_realtek.c                      |   57 +-
 sound/soc/amd/acp-config.c                         |   14 +
 sound/soc/amd/yc/acp6x-mach.c                      |   21 +
 sound/soc/codecs/cs35l41-lib.c                     |    6 +-
 sound/soc/codecs/cs35l41.c                         |    4 +-
 sound/soc/codecs/cs43130.c                         |    6 +-
 sound/soc/codecs/da7219-aad.c                      |    2 +-
 sound/soc/codecs/hdac_hda.c                        |   23 +-
 sound/soc/codecs/hdac_hdmi.c                       |    1 +
 sound/soc/codecs/hdmi-codec.c                      |    1 +
 sound/soc/codecs/lpass-tx-macro.c                  |    5 +
 sound/soc/codecs/nau8822.c                         |    9 +-
 sound/soc/codecs/rt5645.c                          |   10 +-
 sound/soc/codecs/wm8974.c                          |    6 +-
 sound/soc/codecs/wm_adsp.c                         |    8 +-
 sound/soc/fsl/Kconfig                              |    1 +
 sound/soc/fsl/fsl_sai.c                            |   21 +
 sound/soc/fsl/fsl_xcvr.c                           |   14 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    2 +
 sound/soc/intel/boards/sof_sdw.c                   |   17 +-
 sound/soc/intel/skylake/skl-pcm.c                  |    9 +-
 sound/soc/intel/skylake/skl-sst-ipc.c              |    4 +-
 sound/soc/qcom/sc8280xp.c                          |   17 +
 sound/soc/soc-ops.c                                |    2 +-
 sound/soc/soc-pcm.c                                |   11 +-
 sound/soc/sof/ipc3-topology.c                      |    2 +
 sound/soc/sof/ipc4-control.c                       |   20 +-
 sound/soc/sof/ipc4-topology.c                      |   61 +-
 sound/soc/sof/ipc4-topology.h                      |   34 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |    3 +
 sound/soc/sof/sof-audio.c                          |   65 +-
 sound/soc/sof/sof-audio.h                          |    2 +
 sound/soc/sof/topology.c                           |    4 +-
 sound/usb/mixer_quirks.c                           |   30 +
 sound/x86/intel_hdmi_audio.c                       |    1 +
 tools/arch/arm64/include/asm/cputype.h             |    5 +-
 tools/arch/arm64/include/uapi/asm/kvm.h            |   32 +
 tools/arch/arm64/include/uapi/asm/perf_regs.h      |   10 +-
 tools/arch/arm64/tools/Makefile                    |    2 +-
 tools/arch/parisc/include/uapi/asm/errno.h         |    2 -
 tools/arch/s390/include/uapi/asm/kvm.h             |   16 +
 tools/arch/x86/include/asm/cpufeatures.h           |   16 +-
 tools/arch/x86/include/asm/disabled-features.h     |   16 +-
 tools/arch/x86/include/asm/msr-index.h             |   23 +-
 tools/arch/x86/include/uapi/asm/prctl.h            |   12 +
 tools/hv/hv_kvp_daemon.c                           |   20 +-
 tools/hv/hv_set_ifconfig.sh                        |    4 +-
 tools/include/asm-generic/unaligned.h              |    1 +
 tools/include/uapi/asm-generic/unistd.h            |   12 +-
 tools/include/uapi/drm/drm.h                       |   20 +
 tools/include/uapi/drm/i915_drm.h                  |    8 +-
 tools/include/uapi/linux/fscrypt.h                 |    3 +-
 tools/include/uapi/linux/kvm.h                     |   24 +-
 tools/include/uapi/linux/mount.h                   |    3 +-
 tools/include/uapi/linux/vhost.h                   |    8 +
 tools/net/ynl/Makefile.deps                        |    2 +-
 tools/net/ynl/generated/devlink-user.c             |   89 +-
 tools/net/ynl/generated/ethtool-user.c             |   51 +-
 tools/net/ynl/generated/fou-user.c                 |    6 +-
 tools/net/ynl/generated/handshake-user.c           |    3 +-
 tools/net/ynl/ynl-gen-c.py                         |   16 +-
 tools/perf/MANIFEST                                |    2 +
 tools/perf/Makefile.perf                           |   24 +-
 .../perf/arch/mips/entry/syscalls/syscall_n64.tbl  |    4 +
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl |    4 +
 tools/perf/arch/s390/entry/syscalls/syscall.tbl    |    4 +
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl  |    3 +
 tools/perf/builtin-kwork.c                         |    2 +-
 tools/perf/builtin-list.c                          |    6 +
 .../arch/arm64/ampere/ampereone/metrics.json       |    2 +
 tools/perf/trace/beauty/include/linux/socket.h     |    1 +
 tools/perf/util/Build                              |    2 +-
 tools/perf/util/bpf_lock_contention.c              |    3 +-
 tools/perf/util/metricgroup.c                      |    2 +-
 tools/power/pm-graph/sleepgraph.py                 |    2 +-
 tools/power/x86/turbostat/turbostat.c              | 3074 +++++-----
 tools/testing/nvdimm/test/ndtest.c                 |    2 +-
 tools/testing/selftests/arm64/fp/za-fork.c         |    2 +-
 .../selftests/bpf/prog_tests/sockmap_listen.c      |   51 +-
 tools/testing/selftests/bpf/prog_tests/tailcalls.c |   84 +
 .../testing/selftests/bpf/prog_tests/tc_redirect.c |  317 +-
 tools/testing/selftests/bpf/prog_tests/verifier.c  |    2 +
 tools/testing/selftests/bpf/progs/bpf_loop_bench.c |   13 +-
 tools/testing/selftests/bpf/progs/cb_refs.c        |    1 +
 .../testing/selftests/bpf/progs/exceptions_fail.c  |    2 +
 tools/testing/selftests/bpf/progs/strobemeta.h     |   78 +-
 tools/testing/selftests/bpf/progs/tailcall_poke.c  |   32 +
 .../selftests/bpf/progs/test_sockmap_listen.c      |    7 +
 tools/testing/selftests/bpf/progs/verifier_cfg.c   |   62 +
 .../bpf/progs/verifier_iterating_callbacks.c       |  242 +
 .../testing/selftests/bpf/progs/verifier_loops1.c  |    9 +-
 .../selftests/bpf/progs/verifier_precision.c       |   40 +
 .../bpf/progs/verifier_subprog_precision.c         |   86 +-
 .../selftests/bpf/progs/xdp_synproxy_kern.c        |   84 +-
 tools/testing/selftests/bpf/verifier/calls.c       |    6 +-
 tools/testing/selftests/bpf/verifier/ld_imm64.c    |    8 +-
 tools/testing/selftests/bpf/xskxceiver.c           |   19 +-
 tools/testing/selftests/iommu/iommufd_utils.h      |   13 +-
 tools/testing/selftests/kvm/Makefile               |    7 +-
 .../selftests/kvm/x86_64/nx_huge_pages_test.c      |    2 +-
 tools/testing/selftests/mm/.gitignore              |    1 +
 tools/testing/selftests/mm/Makefile                |    4 +-
 tools/testing/selftests/mm/pagemap_ioctl.c         |   32 +-
 tools/testing/selftests/mm/run_vmtests.sh          |    3 +
 tools/testing/selftests/net/af_unix/diag_uid.c     |    1 -
 tools/testing/selftests/net/cmsg_sender.c          |    2 +-
 tools/testing/selftests/net/ipsec.c                |    4 +-
 tools/testing/selftests/net/mptcp/mptcp_connect.c  |   11 +-
 tools/testing/selftests/net/mptcp/mptcp_inq.c      |   11 +-
 tools/testing/selftests/net/mptcp/mptcp_join.sh    |    2 +-
 tools/testing/selftests/net/rtnetlink.sh           |    2 +-
 tools/testing/vsock/vsock_test.c                   |   19 +-
 virt/kvm/kvm_main.c                                |   18 +-
 2645 files changed, 147844 insertions(+), 36084 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
 create mode 100644 Documentation/gpu/amdgpu/display/trace-groups-table.csv
 create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
 create mode 100644 Documentation/gpu/imagination/index.rst
 create mode 100644 Documentation/gpu/imagination/uapi.rst
 create mode 100644 Documentation/gpu/xe/index.rst
 create mode 100644 Documentation/gpu/xe/xe_cs.rst
 create mode 100644 Documentation/gpu/xe/xe_debugging.rst
 create mode 100644 Documentation/gpu/xe/xe_firmware.rst
 create mode 100644 Documentation/gpu/xe/xe_gt_mcr.rst
 create mode 100644 Documentation/gpu/xe/xe_map.rst
 create mode 100644 Documentation/gpu/xe/xe_migrate.rst
 create mode 100644 Documentation/gpu/xe/xe_mm.rst
 create mode 100644 Documentation/gpu/xe/xe_pcode.rst
 create mode 100644 Documentation/gpu/xe/xe_pm.rst
 create mode 100644 Documentation/gpu/xe/xe_rtp.rst
 create mode 100644 Documentation/gpu/xe/xe_tile.rst
 create mode 100644 Documentation/gpu/xe/xe_wa.rst
 create mode 100644 drivers/accel/qaic/qaic_timesync.c
 create mode 100644 drivers/accel/qaic/qaic_timesync.h
 delete mode 100644 drivers/char/agp/compat_ioctl.c
 delete mode 100644 drivers/char/agp/compat_ioctl.h
 delete mode 100644 drivers/char/agp/frontend.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_state.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_plane.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_plane_priv.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_state.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_state_priv.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_stream_priv.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dce100/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn302/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn315/Makefile
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dsc}/dcn20/dcn20_dsc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dsc}/dcn20/dcn20_dsc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dsc}/dcn35/dcn35_dsc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> dsc}/dcn35/dcn35_dsc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{inc/hw =3D> dsc}/dsc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn10/dcn10_init.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn10/dcn10_init.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn20/dcn20_init.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn20/dcn20_init.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn201/dcn201_init.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn201/dcn201_init.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn21/dcn21_init.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn21/dcn21_init.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn30/dcn30_init.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn30/dcn30_init.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn301/dcn301_init.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn301/dcn301_init.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn302/dcn302_init.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn302/dcn302_init.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn303/dcn303_init.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn303/dcn303_init.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn31/dcn31_init.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn31/dcn31_init.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn314/dcn314_init.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn314/dcn314_init.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn32/dcn32_init.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn32/dcn32_init.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn35/dcn35_init.c (98%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> hwss}/dcn35/dcn35_init.h (100=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/CMakeLists.t=
xt
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn351/dcn351_init.=
h
 create mode 100644 drivers/gpu/drm/amd/display/dc/optc/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn10/dcn10_optc.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn10/dcn10_optc.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn20/dcn20_optc.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn20/dcn20_optc.h (99%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn201/dcn201_optc.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn201/dcn201_optc.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn30/dcn30_optc.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn30/dcn30_optc.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn301/dcn301_optc.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn301/dcn301_optc.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn31/dcn31_optc.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn31/dcn31_optc.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn314/dcn314_optc.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn314/dcn314_optc.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn32/dcn32_optc.c (98%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn32/dcn32_optc.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn35/dcn35_optc.c (98%=
)
 rename drivers/gpu/drm/amd/display/dc/{ =3D> optc}/dcn35/dcn35_optc.h (100=
%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce100/dce100_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce100/dce100_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce110/dce110_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce110/dce110_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce112/dce112_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce112/dce112_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce120/dce120_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce120/dce120_resource.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dce80/CMakeList=
s.txt
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce80/dce80_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce80/dce80_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn10/dcn10_resource.c (98%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn10/dcn10_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn20/dcn20_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn20/dcn20_resource.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn201/dcn201_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn201/dcn201_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn21/dcn21_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn21/dcn21_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn30/dcn30_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn30/dcn30_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn301/dcn301_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn301/dcn301_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn302/dcn302_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn302/dcn302_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn303/dcn303_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn303/dcn303_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn31/dcn31_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn31/dcn31_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn314/dcn314_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn314/dcn314_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn315/dcn315_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn315/dcn315_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn316/dcn316_resource.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn316/dcn316_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn32/dcn32_resource.c (94%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn32/dcn32_resource.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn321/dcn321_resource.c (97%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn321/dcn321_resource.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn35/dcn35_resource.c (97%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dcn35/dcn35_resource.h (99%)
 create mode 100644 drivers/gpu/drm/amd/include/amdgpu_reg_state.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_10_0_2_offset.h
 create mode 100644
drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_10_0_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
 delete mode 100644 drivers/gpu/drm/drm_agpsupport.c
 delete mode 100644 drivers/gpu/drm/drm_bufs.c
 delete mode 100644 drivers/gpu/drm/drm_context.c
 delete mode 100644 drivers/gpu/drm/drm_dma.c
 create mode 100644 drivers/gpu/drm/drm_eld.c
 delete mode 100644 drivers/gpu/drm/drm_hashtab.c
 delete mode 100644 drivers/gpu/drm/drm_irq.c
 delete mode 100644 drivers/gpu/drm/drm_legacy.h
 delete mode 100644 drivers/gpu/drm/drm_legacy_misc.c
 delete mode 100644 drivers/gpu/drm/drm_lock.c
 delete mode 100644 drivers/gpu/drm/drm_memory.c
 delete mode 100644 drivers/gpu/drm/drm_scatter.c
 delete mode 100644 drivers/gpu/drm/drm_vm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_debugfs_para=
ms.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_debugfs_para=
ms.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_params.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_params.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_buffer.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h
 create mode 100644 drivers/gpu/drm/imagination/Kconfig
 create mode 100644 drivers/gpu/drm/imagination/Makefile
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_ccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_cccb.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_context.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_debugfs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_device_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_drv.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_free_list.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_startstop.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_trace.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_gem.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_hwrt.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_job.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_mmu.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_params.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_power.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_queue.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_cr_defs_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check=
.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_common.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_dev_info.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_resetframewo=
rk.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_shared_check=
.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_fwif_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_heap_config.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_meta.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_mmu_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_stream_defs.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_sync.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_vm_mips.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_padding.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 create mode 100644 drivers/gpu/drm/panel/panel-synaptics-r63353.c
 create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_submit.c
 create mode 100644 drivers/gpu/drm/v3d/v3d_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/.gitignore
 create mode 100644 drivers/gpu/drm/xe/.kunitconfig
 create mode 100644 drivers/gpu/drm/xe/Kconfig
 create mode 100644 drivers/gpu/drm/xe/Kconfig.debug
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
 create mode 100644 drivers/gpu/drm/xe/Makefile
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_mkhi_commands_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_actions_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_errors_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_klvs_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_messages_abi.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lme=
m.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mma=
n.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_obj=
ect.h
 create mode 100644
drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active_type=
s.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.=
h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gati=
ng.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_reg=
s.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config=
.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm=
.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg=
.h
 create mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.c
 create mode 100644 drivers/gpu/drm/xe/display/ext/i915_utils.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_misc.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_rps.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_dsb_buffer.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_fb_pin.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_plane_initial.c
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_instr_defs.h
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_mi_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_engine_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gpu_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_guc_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_lrc_layout.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_reg_defs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
 create mode 100644 drivers/gpu/drm/xe/tests/Makefile
 create mode 100644 drivers/gpu/drm/xe/tests/xe_bo.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_bo_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_lmtt_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_migrate.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_migrate_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_wa_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_assert.h
 create mode 100644 drivers/gpu/drm/xe/xe_bb.c
 create mode 100644 drivers/gpu/drm/xe/xe_bb.h
 create mode 100644 drivers/gpu/drm/xe/xe_bb_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_bo.c
 create mode 100644 drivers/gpu/drm/xe/xe_bo.h
 create mode 100644 drivers/gpu/drm/xe/xe_bo_doc.h
 create mode 100644 drivers/gpu/drm/xe/xe_bo_evict.c
 create mode 100644 drivers/gpu/drm/xe/xe_bo_evict.h
 create mode 100644 drivers/gpu/drm/xe/xe_bo_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_device.c
 create mode 100644 drivers/gpu/drm/xe/xe_device.h
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_device_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_display.c
 create mode 100644 drivers/gpu/drm/xe/xe_display.h
 create mode 100644 drivers/gpu/drm/xe/xe_dma_buf.c
 create mode 100644 drivers/gpu/drm/xe/xe_dma_buf.h
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h
 create mode 100644 drivers/gpu/drm/xe/xe_drv.h
 create mode 100644 drivers/gpu/drm/xe/xe_exec.c
 create mode 100644 drivers/gpu/drm/xe/xe_exec.h
 create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.h
 create mode 100644 drivers/gpu/drm/xe/xe_exec_queue_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_execlist.c
 create mode 100644 drivers/gpu/drm/xe/xe_execlist.h
 create mode 100644 drivers/gpu/drm/xe/xe_execlist_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_force_wake.c
 create mode 100644 drivers/gpu/drm/xe/xe_force_wake.h
 create mode 100644 drivers/gpu/drm/xe/xe_force_wake_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
 create mode 100644 drivers/gpu/drm/xe/xe_ggtt.c
 create mode 100644 drivers/gpu/drm/xe/xe_ggtt.h
 create mode 100644 drivers/gpu/drm/xe/xe_ggtt_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_clock.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_clock.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_mcr.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_mcr.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sysfs_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_topology.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_topology.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_ads.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_ads.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_ads_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_ct.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_ct.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_ct_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_fwif.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_hwconfig.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_log.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_log_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pc.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pc_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_heci_gsc.c
 create mode 100644 drivers/gpu/drm/xe/xe_heci_gsc.h
 create mode 100644 drivers/gpu/drm/xe/xe_huc.c
 create mode 100644 drivers/gpu/drm/xe/xe_huc.h
 create mode 100644 drivers/gpu/drm/xe/xe_huc_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_huc_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_huc_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_fence.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_fence.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_fence_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
 create mode 100644 drivers/gpu/drm/xe/xe_irq.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq.h
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt.c
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt.h
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt_2l.c
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt_ml.c
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_lrc.c
 create mode 100644 drivers/gpu/drm/xe/xe_lrc.h
 create mode 100644 drivers/gpu/drm/xe/xe_lrc_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_macros.h
 create mode 100644 drivers/gpu/drm/xe/xe_map.h
 create mode 100644 drivers/gpu/drm/xe/xe_migrate.c
 create mode 100644 drivers/gpu/drm/xe/xe_migrate.h
 create mode 100644 drivers/gpu/drm/xe/xe_migrate_doc.h
 create mode 100644 drivers/gpu/drm/xe/xe_mmio.c
 create mode 100644 drivers/gpu/drm/xe/xe_mmio.h
 create mode 100644 drivers/gpu/drm/xe/xe_mocs.c
 create mode 100644 drivers/gpu/drm/xe/xe_mocs.h
 create mode 100644 drivers/gpu/drm/xe/xe_module.c
 create mode 100644 drivers/gpu/drm/xe/xe_module.h
 create mode 100644 drivers/gpu/drm/xe/xe_pat.c
 create mode 100644 drivers/gpu/drm/xe/xe_pat.h
 create mode 100644 drivers/gpu/drm/xe/xe_pci.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci.h
 create mode 100644 drivers/gpu/drm/xe/xe_pci_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pcode.c
 create mode 100644 drivers/gpu/drm/xe/xe_pcode.h
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_api.h
 create mode 100644 drivers/gpu/drm/xe/xe_platform_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pm.c
 create mode 100644 drivers/gpu/drm/xe/xe_pm.h
 create mode 100644 drivers/gpu/drm/xe/xe_preempt_fence.c
 create mode 100644 drivers/gpu/drm/xe/xe_preempt_fence.h
 create mode 100644 drivers/gpu/drm/xe/xe_preempt_fence_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pt.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt.h
 create mode 100644 drivers/gpu/drm/xe/xe_pt_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pt_walk.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt_walk.h
 create mode 100644 drivers/gpu/drm/xe/xe_query.c
 create mode 100644 drivers/gpu/drm/xe/xe_query.h
 create mode 100644 drivers/gpu/drm/xe/xe_range_fence.c
 create mode 100644 drivers/gpu/drm/xe/xe_range_fence.h
 create mode 100644 drivers/gpu/drm/xe/xe_reg_sr.c
 create mode 100644 drivers/gpu/drm/xe/xe_reg_sr.h
 create mode 100644 drivers/gpu/drm/xe/xe_reg_sr_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_reg_whitelist.c
 create mode 100644 drivers/gpu/drm/xe/xe_reg_whitelist.h
 create mode 100644 drivers/gpu/drm/xe/xe_res_cursor.h
 create mode 100644 drivers/gpu/drm/xe/xe_ring_ops.c
 create mode 100644 drivers/gpu/drm/xe/xe_ring_ops.h
 create mode 100644 drivers/gpu/drm/xe/xe_ring_ops_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_rtp.c
 create mode 100644 drivers/gpu/drm/xe/xe_rtp.h
 create mode 100644 drivers/gpu/drm/xe/xe_rtp_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_rtp_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sa.c
 create mode 100644 drivers/gpu/drm/xe/xe_sa.h
 create mode 100644 drivers/gpu/drm/xe/xe_sa_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sched_job.c
 create mode 100644 drivers/gpu/drm/xe/xe_sched_job.h
 create mode 100644 drivers/gpu/drm/xe/xe_sched_job_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_step.c
 create mode 100644 drivers/gpu/drm/xe/xe_step.h
 create mode 100644 drivers/gpu/drm/xe/xe_step_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sync.c
 create mode 100644 drivers/gpu/drm/xe/xe_sync.h
 create mode 100644 drivers/gpu/drm/xe/xe_sync_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_tuning.c
 create mode 100644 drivers/gpu/drm/xe/xe_tuning.h
 create mode 100644 drivers/gpu/drm/xe/xe_uc.c
 create mode 100644 drivers/gpu/drm/xe/xe_uc.h
 create mode 100644 drivers/gpu/drm/xe/xe_uc_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_uc_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_uc_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_uc_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_uc_fw_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_uc_fw_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_uc_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_vm.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm.h
 create mode 100644 drivers/gpu/drm/xe/xe_vm_doc.h
 create mode 100644 drivers/gpu/drm/xe/xe_vm_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_wa.c
 create mode 100644 drivers/gpu/drm/xe/xe_wa.h
 create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules
 create mode 100644 drivers/gpu/drm/xe/xe_wait_user_fence.c
 create mode 100644 drivers/gpu/drm/xe/xe_wait_user_fence.h
 create mode 100644 drivers/gpu/drm/xe/xe_wopcm.c
 create mode 100644 drivers/gpu/drm/xe/xe_wopcm.h
 create mode 100644 drivers/gpu/drm/xe/xe_wopcm_types.h
 delete mode 100644 drivers/phy/realtek/Kconfig
 delete mode 100644 drivers/phy/realtek/Makefile
 delete mode 100644 drivers/phy/realtek/phy-rtk-usb2.c
 delete mode 100644 drivers/phy/realtek/phy-rtk-usb3.c
 create mode 100644 fs/bcachefs/btree_key_cache_types.h
 create mode 100644 include/drm/bridge/aux-bridge.h
 create mode 100644 include/drm/drm_eld.h
 delete mode 100644 include/drm/drm_legacy.h
 create mode 100644 include/drm/xe_pciids.h
 create mode 100644 include/uapi/drm/pvr_drm.h
 create mode 100644 include/uapi/drm/xe_drm.h
 create mode 100644 tools/testing/selftests/bpf/progs/tailcall_poke.c
 create mode 100644
tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
