Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FCC9E275
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C78010E109;
	Wed,  3 Dec 2025 08:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d3ph5xIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1B510E078
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 07:22:57 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8b21fc25ae1so609489085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 23:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764746576; x=1765351376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=coqKGmeG5tzSWBnfuvd1SaFc6kmCLk0d7JPvL0vFm4Y=;
 b=d3ph5xIeCXfpjGI6TSPGMAYw9rk2g/5Ud66XonCbwtYYOzWqDwUUC+Zmi1Vlvel6YY
 4R7bkewrMzJ7CyUkvB7PeUZA99kAUgzkpH8VdWLCg+2llSQl8ZeQLfRhmyQxKEuWvlQ4
 bPs/N//JxSwQgeaokVRLQWeiNtwfVL26Wmjvc4dxOwtxfhW+DgBbmyFqsZWFeZMxuMMD
 EqgLIV8rSWQ7ciSNOTlWr8znqyxqtbmTOlRNzsknQMamAkBPn7Qggk/kvgvZOV4537gf
 4pC5coMT+7e9MatTipk2bITG5mJVnTK958+9n41jd6L3c2A5o+8tim3MICz6vw17VKoc
 FYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764746576; x=1765351376;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=coqKGmeG5tzSWBnfuvd1SaFc6kmCLk0d7JPvL0vFm4Y=;
 b=rCmGCCzHxgxb4eZJYwWogj0RBCItTSGYhpMpyZBW/VykdcKja7Q5xKC+RyHDA7r5rx
 CRLMg4RL47XAIMpXW6875Iro/zRS+1tBaku38xc//pXtpGN2P2WXqITqwbe1FKWvE913
 BuwDbF7UzcCaxRKlns4NTVcvhXjUqN+spy4auyW8UmY7Gog5cusirmvUf550ptW/nm/5
 yTo/lySdYZAK7yfUfS16Pd8E6d3EeMOGZDatPB2ExV09ZyGaAdCch20zCjsVSE+uB0LG
 WaMBBMoGk+0aY6NVfNS7CI4ds58NzVGPX2u6Hb4mTC8HcZkj2hh0CC8zRcG1nGCjreca
 BATw==
X-Gm-Message-State: AOJu0YyjIdFEfMHHaCxZlrYVeICHQuXXnOH+aOh8cF8+kubeBeX3XkB7
 jw9RKJJiMRnglqJ2cKbeP6wime+A0vK24Tuv6dV3Sv7NvLHbp17035tPI9UadY7MeVSWUgg7UiK
 Etkrg/uNjeIJry5J1/mStv/zcSy0RcAE=
X-Gm-Gg: ASbGncs8dDglggf3qfc6x3Y9W3rALV5WaQnj57EPZ/KwN9iMxmNlhQ3tReWbqnWTV+Q
 fJvyZPE3PKg0DehKWObqVhcclXusrN0TS+Q3ZhqekNZThLB5+0F35AvEKcM/IMoE4/U8rlHgbJ1
 W9xYUrM07eFzrOzXRWSLSCbDTFJ+4xQn2uddlGp8vz9rpRH4G9fnwMfGM9Nr7lEDZfgX8jWAnVC
 qFwlU6Z1M1fjiVI5kvNCEijlBZE5l4gqG4CiQ/qVQLqEW3vTjUOBkWjd+wxXFli5RGP1dc3Yjon
 Q2CY
X-Google-Smtp-Source: AGHT+IGlOeDFQlMSvaK86kdhEky4Wf+lrC2ZK6+lLP3Jl3MCt29ixhVWK02haNTYzMQXTJ9Z3wzSzVRJWgBgjvLHf9Y=
X-Received: by 2002:a05:620a:1a81:b0:8b2:f31f:ae28 with SMTP id
 af79cd13be357-8b5e48d4c90mr168081285a.28.1764746575123; Tue, 02 Dec 2025
 23:22:55 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 3 Dec 2025 17:22:42 +1000
X-Gm-Features: AWmQ_bmz-Ki8D_tAlhPMCI7hbcRj099R6qlUOUznZHShEcZ2uIUC3BXj2eSrMow
Message-ID: <CAPM=9tySHmq2KLAvW95MeKcb-37gZBhHTY5hf4dCTgUFLd+RKg@mail.gmail.com>
Subject: [git pull] drm for 6.19-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 03 Dec 2025 08:11:25 +0000
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

This is the main drm pull request for 6.19.

There isn't too much external stuff, mostly some rust related bits.

There are a few conflicts in i915/xe/amdgpu,
https://github.com/airlied/linux/tree/drm-next-6.19-rc1-merged
has one I did.
The amdgpu_dm one is silent but ends up with duplicated code.

There was a rather late merge of a new color pipeline feature, that
some userspace projects are blocked on, and has seen a lot of work in
amdgpu. This should have seen some time in -next. There is additional
support for this for Intel, that if it arrives in the next day or two
I'll pass it on in another pull request and you can decide if you want
to take it.

Highlights:
- Arm Ethos NPU accelerator driver
- new DRM color pipeline support
- amdgpu will now run discrete SI/CIK cards instead of radeon, which
enables vulkan support in userspace.
- msm gets gen8 gpu support
- initial Xe3P support in xe

Let me know if any problems crop up.

Regards,
Dave.

drm-next-2025-12-03:
drm-next for 6.19-rc1:

new driver:
- Arm Ethos-U65/U85 accel driver

core:
- support the drm color pipeline in vkms/amdgfx
- add support for drm colorop pipeline
- add COLOR PIPELINE plane property
- add DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
- throttle dirty worker with vblank
- use drm_for_each_bridge_in_chain_scoped in drm's bridge code
- Ensure drm_client_modeset tests are enabled in UML
- add simulated vblank interrupt - use in drivers
- dumb buffer sizing helper
- move freeing of drm client memory to driver
- crtc sharpness strength property
- stop using system_wq in scheduler/drivers
- support emergency restore in drm-client

rust:
- make slice::as_flattened usable on all supported rustc
- add FromBytes::from_bytes_prefix() method
- remove redundant device ptr from Rust GEM object
- Change how AlwaysRefCounted is implemented for GEM objects

gpuvm:
- Add deferred vm_bo cleanup to GPUVM (for rust)

atomic:
- cleanup and improve state handling interfaces

buddy:
- optimize block management

dma-buf:
- heaps: Create heap per CMA reserved location
- improve userspace documentation

dp:
- add POST_LT_ADJ_REQ training sequence
- DPCD dSC quirk for synaptics panamera devices
- helpers to query branch DSC max throughput

ttm:
- Rename ttm_bo_put to ttm_bo_fini
- allow page protection flags on risc-v
- rework pipelined eviction fence handling

amdgpu:
- enable amdgpu by default for SI/CI dGPUs
- enable DC by default on SI
- refactor CIK/SI enablement
- add ABM KMS property
- Re-enable DM idle optimizations
- DC Analog encoders support
- Powerplay fixes for fiji/iceland
- Enable DC on bonaire by default
- HMM cleanup
- Add new RAS framework
- DML2.1 updates
- YCbCr420 fixes
- DC FP fixes
- DMUB fixes
- LTTPR fixes
- DTBCLK fixes
- DMU cursor offload handling
- Userq validation improvements
- Unify shutdown callback handling
- Suspend improvements
- Power limit code cleanup
- SR-IOV fixes
- AUX backlight fixes
- DCN 3.5 fixes
- HDMI compliance fixes
- DCN 4.0.1 cursor updates
- DCN interrupt fix
- DC KMS full update improvements
- Add additional HDCP traces
- DCN 3.2 fixes
- DP MST fixes
- Add support for new SR-IOV mailbox interface
- UQ reset support
- HDP flush rework
- VCE1 support

amdkfd:
- HMM cleanups
- Relax checks on save area overallocations
- Fix GPU mappings after prefetch

radeon:
- refactor CIK/SI enablement.

xe:
- Initial Xe3P support
- panic support on VRAM for display
- fix stolen size check
- Loosen used tracking restriction
- New SR-IOV debugfs structure and debugfs updates
- Hide the GPU madvise flag behind a VM_BIND flag
- Always expose VRAM provisioning data on discrete GPUs
- Allow VRAM mappings for userptr when used with SVM
- Allow pinning of p2p dma-buf
- Use per-tile debugfs where appropriate
- Add documentation for Execution Queues
- PF improvements
- VF migration recovery redesign work
- User / Kernel VRAM partitioning
- Update Tile-based messages
- Allow configfs to disable specific GT types
- VF provisioning and migration improvements
- use SVM range helpers in PT layer
- Initial CRI support
- access VF registers using dedicated MMIO view
- limit number of jobs per exec queue
- add sriov_admin sysfs tree
- more crescent island specific support
- debugfs residency counter
- SRIOV migration work
- runtime registers for GFX 35

i915:
- add initial Xe3p_LPD display version 35 support
- Enable LNL+ content adaptive sharpness filter
- Use optimized VRR guardband
- Enable Xe3p LT PHY
- enable FBC support for Xe3p_LPD display
- add display 30.02 firmware support
- refactor SKL+ watermark latency setup
- refactor fbdev handling
- call i915/xe runtime PM via function pointers
- refactor i915/xe stolen memory/display interfaces
- use display version instead of gfx version in display code
- extend i915_display_info with Type-C port details
- lots of display cleanups/refactorings
- set O_LARGEFILE in __create_shmem
- skuip guc communication warning on reset
- fix time conversions
- defeature DRRS on LNL+
- refactor intel_frontbuffer split between i915/xe/display
- convert inteL_rom interfaces to struct drm_device
- unify display register polling interfaces
- aovid lock inversion when pinning to GGTT on CHV/BXT+VTD

panel:
- Add KD116N3730A08/A12, chromebook mt8189
- JT101TM023, LQ079L1SX01,
- GLD070WX3-SL01 MIPI DSI
- Samsung LTL106AL0, Samsung LTL106AL01
- Raystar RFF500F-AWH-DNN
- Winstar WF70A8SYJHLNGA,
- Wanchanglong w552946aaa
- Samsung SOFEF00
- Lenovo X13s panel.
- ilitek-ili9881c : add rpi 5" support
- visionx-rm69299 - add backlight support
- edp - support AUI B116XAN02.0

bridge:
- improve ref counting
- ti-sn65dsi86 - add support for DP mode with HPD
- synopsis: support CEC, init timer with correct freq
- ASL CS5263 DP-to-HDMI bridge support

nova-core:
- introduce bitfield! macro
- introduce safe integer converters
- GSP inits to fully booted state on Ampere
- Use more future-proof register for GPU identification

nova-drm:
- select NOVA_CORE
- 64-bit only

nouveau:
- improve reclocking on tegra 186+
- add large page and compression support

msm:
- GPU:
  - Gen8 support: A840 (Kaanapali) and X2-85 (Glymur)
  - A612 support
- MDSS:
  - Added support for Glymur and QCS8300 platforms
- DPU:
  - Enabled Quad-Pipe support, unlocking higher resolutions support
  - Added support for Glymur platform
  - Documented DPU on QCS8300 platform as supported
- DisplayPort:
  - Added support for Glymur platform
  - Added support lame remapping inside DP block
  - Documented DisplayPort controller on QCS8300 and SM6150/QCS615 as
    supported

tegra:
- NVJPG driver

panfrost:
- display JM contexts over debugfs
- export JM contexts to userspace
- improve error and job handling

panthor:
- support custom ASN_HASH for mt8196
- support mali-G1 GPU
- flush shmem write before mapping buffers uncached
- make timeout per-queue instead of per-job

mediatek:
- MT8195/88 HDMIv2/DDCv2 support

rockchip:
- dsi: add support for RK3368

amdxdna:
- enhance runtime PM
- last hardware error reading uapi
- support firmware debug output
- add resource and telemetry data uapi
- preemption support

imx:
- add driver for HDMI TX Parallel audio interface

ivpu:
- add support for user-managed preemption buffer
- add userptr support
- update JSM firware API to 3.33.0
- add better alloc/free warnings
- fix page fault in unbind all bos
- rework bind/unbind of imported buffers
- enable MCA ECC signalling
- split fw runtime and global memory buffers
- add fdinfo memory statistics

tidss:
- convert to drm logging
- logging cleanup

ast:
- refactor generation init paths
- add per chip generation detect_tx_chip
- set quirks for each chip model

atmel-hlcdc:
- set LCDC_ATTRE register in plane disable
- set correct values for plane scaler

solomon:
- use drm helper for get_modes and move_valid

sitronix:
- fix output position when clearing screens

qaic:
- support dma-buf exports
- support new firmware's READ_DATA implementation
- sahara AIC200 image table update
- add sysfs support
- add coredump support
- add uevents support
- PM support

sun4i:
- layer refactors to decouple plane from output
- improve DE33 support

vc4:
- switch to generic CEC helpers

komeda:
- use drm_ logging functions

vkms:
- configfs support for display configuration

vgem:
- fix fence timer deadlock

etnaviv:
- add HWDB entry for GC8000 Nano Ultra VIP r6205
The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c=
:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-12-03

for you to fetch changes up to 0692602defb0c273f80dec9c564ca50726404aca:

  Merge tag 'amd-drm-next-6.19-2025-12-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-12-03
09:43:49 +1000)

----------------------------------------------------------------
drm-next for 6.19-rc1:

new driver:
- Arm Ethos-U65/U85 accel driver

core:
- support the drm color pipeline in vkms/amdgfx
- add support for drm colorop pipeline
- add COLOR PIPELINE plane property
- add DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
- throttle dirty worker with vblank
- use drm_for_each_bridge_in_chain_scoped in drm's bridge code
- Ensure drm_client_modeset tests are enabled in UML
- add simulated vblank interrupt - use in drivers
- dumb buffer sizing helper
- move freeing of drm client memory to driver
- crtc sharpness strength property
- stop using system_wq in scheduler/drivers
- support emergency restore in drm-client

rust:
- make slice::as_flattened usable on all supported rustc
- add FromBytes::from_bytes_prefix() method
- remove redundant device ptr from Rust GEM object
- Change how AlwaysRefCounted is implemented for GEM objects

gpuvm:
- Add deferred vm_bo cleanup to GPUVM (for rust)

atomic:
- cleanup and improve state handling interfaces

buddy:
- optimize block management

dma-buf:
- heaps: Create heap per CMA reserved location
- improve userspace documentation

dp:
- add POST_LT_ADJ_REQ training sequence
- DPCD dSC quirk for synaptics panamera devices
- helpers to query branch DSC max throughput

ttm:
- Rename ttm_bo_put to ttm_bo_fini
- allow page protection flags on risc-v
- rework pipelined eviction fence handling

amdgpu:
- enable amdgpu by default for SI/CI dGPUs
- enable DC by default on SI
- refactor CIK/SI enablement
- add ABM KMS property
- Re-enable DM idle optimizations
- DC Analog encoders support
- Powerplay fixes for fiji/iceland
- Enable DC on bonaire by default
- HMM cleanup
- Add new RAS framework
- DML2.1 updates
- YCbCr420 fixes
- DC FP fixes
- DMUB fixes
- LTTPR fixes
- DTBCLK fixes
- DMU cursor offload handling
- Userq validation improvements
- Unify shutdown callback handling
- Suspend improvements
- Power limit code cleanup
- SR-IOV fixes
- AUX backlight fixes
- DCN 3.5 fixes
- HDMI compliance fixes
- DCN 4.0.1 cursor updates
- DCN interrupt fix
- DC KMS full update improvements
- Add additional HDCP traces
- DCN 3.2 fixes
- DP MST fixes
- Add support for new SR-IOV mailbox interface
- UQ reset support
- HDP flush rework
- VCE1 support

amdkfd:
- HMM cleanups
- Relax checks on save area overallocations
- Fix GPU mappings after prefetch

radeon:
- refactor CIK/SI enablement.

xe:
- Initial Xe3P support
- panic support on VRAM for display
- fix stolen size check
- Loosen used tracking restriction
- New SR-IOV debugfs structure and debugfs updates
- Hide the GPU madvise flag behind a VM_BIND flag
- Always expose VRAM provisioning data on discrete GPUs
- Allow VRAM mappings for userptr when used with SVM
- Allow pinning of p2p dma-buf
- Use per-tile debugfs where appropriate
- Add documentation for Execution Queues
- PF improvements
- VF migration recovery redesign work
- User / Kernel VRAM partitioning
- Update Tile-based messages
- Allow configfs to disable specific GT types
- VF provisioning and migration improvements
- use SVM range helpers in PT layer
- Initial CRI support
- access VF registers using dedicated MMIO view
- limit number of jobs per exec queue
- add sriov_admin sysfs tree
- more crescent island specific support
- debugfs residency counter
- SRIOV migration work
- runtime registers for GFX 35

i915:
- add initial Xe3p_LPD display version 35 support
- Enable LNL+ content adaptive sharpness filter
- Use optimized VRR guardband
- Enable Xe3p LT PHY
- enable FBC support for Xe3p_LPD display
- add display 30.02 firmware support
- refactor SKL+ watermark latency setup
- refactor fbdev handling
- call i915/xe runtime PM via function pointers
- refactor i915/xe stolen memory/display interfaces
- use display version instead of gfx version in display code
- extend i915_display_info with Type-C port details
- lots of display cleanups/refactorings
- set O_LARGEFILE in __create_shmem
- skuip guc communication warning on reset
- fix time conversions
- defeature DRRS on LNL+
- refactor intel_frontbuffer split between i915/xe/display
- convert inteL_rom interfaces to struct drm_device
- unify display register polling interfaces
- aovid lock inversion when pinning to GGTT on CHV/BXT+VTD

panel:
- Add KD116N3730A08/A12, chromebook mt8189
- JT101TM023, LQ079L1SX01,
- GLD070WX3-SL01 MIPI DSI
- Samsung LTL106AL0, Samsung LTL106AL01
- Raystar RFF500F-AWH-DNN
- Winstar WF70A8SYJHLNGA,
- Wanchanglong w552946aaa
- Samsung SOFEF00
- Lenovo X13s panel.
- ilitek-ili9881c : add rpi 5" support
- visionx-rm69299 - add backlight support
- edp - support AUI B116XAN02.0

bridge:
- improve ref counting
- ti-sn65dsi86 - add support for DP mode with HPD
- synopsis: support CEC, init timer with correct freq
- ASL CS5263 DP-to-HDMI bridge support

nova-core:
- introduce bitfield! macro
- introduce safe integer converters
- GSP inits to fully booted state on Ampere
- Use more future-proof register for GPU identification

nova-drm:
- select NOVA_CORE
- 64-bit only

nouveau:
- improve reclocking on tegra 186+
- add large page and compression support

msm:
- GPU:
  - Gen8 support: A840 (Kaanapali) and X2-85 (Glymur)
  - A612 support
- MDSS:
  - Added support for Glymur and QCS8300 platforms
- DPU:
  - Enabled Quad-Pipe support, unlocking higher resolutions support
  - Added support for Glymur platform
  - Documented DPU on QCS8300 platform as supported
- DisplayPort:
  - Added support for Glymur platform
  - Added support lame remapping inside DP block
  - Documented DisplayPort controller on QCS8300 and SM6150/QCS615 as
    supported

tegra:
- NVJPG driver

panfrost:
- display JM contexts over debugfs
- export JM contexts to userspace
- improve error and job handling

panthor:
- support custom ASN_HASH for mt8196
- support mali-G1 GPU
- flush shmem write before mapping buffers uncached
- make timeout per-queue instead of per-job

mediatek:
- MT8195/88 HDMIv2/DDCv2 support

rockchip:
- dsi: add support for RK3368

amdxdna:
- enhance runtime PM
- last hardware error reading uapi
- support firmware debug output
- add resource and telemetry data uapi
- preemption support

imx:
- add driver for HDMI TX Parallel audio interface

ivpu:
- add support for user-managed preemption buffer
- add userptr support
- update JSM firware API to 3.33.0
- add better alloc/free warnings
- fix page fault in unbind all bos
- rework bind/unbind of imported buffers
- enable MCA ECC signalling
- split fw runtime and global memory buffers
- add fdinfo memory statistics

tidss:
- convert to drm logging
- logging cleanup

ast:
- refactor generation init paths
- add per chip generation detect_tx_chip
- set quirks for each chip model

atmel-hlcdc:
- set LCDC_ATTRE register in plane disable
- set correct values for plane scaler

solomon:
- use drm helper for get_modes and move_valid

sitronix:
- fix output position when clearing screens

qaic:
- support dma-buf exports
- support new firmware's READ_DATA implementation
- sahara AIC200 image table update
- add sysfs support
- add coredump support
- add uevents support
- PM support

sun4i:
- layer refactors to decouple plane from output
- improve DE33 support

vc4:
- switch to generic CEC helpers

komeda:
- use drm_ logging functions

vkms:
- configfs support for display configuration

vgem:
- fix fence timer deadlock

etnaviv:
- add HWDB entry for GC8000 Nano Ultra VIP r6205

----------------------------------------------------------------
Aaron Kling (2):
      drm/nouveau: Support reclocking on gp10b
      drm/nouveau: Support devfreq for Tegra

Abel Vesa (7):
      dt-bindings: display: panel: samsung,atna33xc20: Document ATNA60CL08
      dt-bindings: display: msm: Document the Glymur Mobile Display SubSyst=
em
      dt-bindings: display: msm: Document the Glymur Display Processing Uni=
t
      dt-bindings: display: msm: Document the Glymur DiplayPort controller
      drm/msm/mdss: Add Glymur device configuration
      drm/msm/dpu: Add support for Glymur
      drm/msm/dp: Add support for Glymur

Abhishek Rajput (1):
      drm/panel: jadard-jd9365da-h3: Use dev_err_probe() instead of
DRM_DEV_ERROR() during probing

Adi Gollamudi (1):
      drm/amd/display: fix typo in display_mode_core_structs.h

Aditya Gollamudi (1):
      drm/amd/display: fix typo in display_mode_core_structs.h

Adri=C3=A1n Larumbe (13):
      drm/panfrost: Name scheduler queues after their job slots
      drm/panfrost: Replace DRM driver allocation method with newer one
      drm/panfrost: Handle inexistent GPU during probe
      drm/panfrost: Handle job HW submit errors
      drm/panfrost: Handle error when allocating AS number
      drm/panfrost: Check sgt to know whether pages are already mapped
      drm/panfrost: Handle page mapping failure
      drm/panfrost: Don't rework job IRQ enable mask in the enable path
      drm/panfrost: Make re-enabling job interrupts at device reset optiona=
l
      drm/panfrost: Add forward declaration and types header
      drm/panfrost: Remove unused device property
      drm/panfrost: Rename panfrost_job functions to reflect real role
      MAINTAINERS: Panfrost: Add Steven Price and Adrian Larumbe

Ahmad Rehman (2):
      drm/amdkfd: Do not wait for queue op response during reset
      drm/amdkfd: Fixing the clang format

Ajye Huang (1):
      drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10

Akash Goel (2):
      drm/panthor: Fix potential memleak of vma structure
      drm/panthor: Avoid adding of kernel BOs to extobj list

Akhil P Oommen (21):
      drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
      drm/msm/a6xx: Flush LRZ cache before PT switch
      drm/msm/a6xx: Fix the gemnoc workaround
      drm/msm/a6xx: Skip dumping SCRATCH registers
      drm/msm/adreno: Common-ize PIPE definitions
      drm/msm/adreno: Move adreno_gpu_func to catalogue
      drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
      drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
      drm/msm/a6xx: Sync latest register definitions
      drm/msm/a6xx: Rebase GMU register offsets
      drm/msm/a8xx: Add support for A8x GMU
      drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
      drm/msm/a6xx: Share dependency vote table with GMU
      drm/msm/adreno: Introduce A8x GPU Support
      drm/msm/adreno: Support AQE engine
      drm/msm/a8xx: Add support for Adreno 840 GPU
      drm/msm/adreno: Do CX GBIF config before GMU start
      drm/msm/a8xx: Add support for Adreno X2-85 GPU
      dt-bindings: arm-smmu: Add Kaanapali and Glymur GPU SMMU
      dt-bindings: display/msm/gmu: Add Adreno 840 GMU
      dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU

Akhilesh Patil (1):
      gpu: host1x: Use dev_err_probe() in probe path

Alex Deucher (18):
      drm/amdgpu/mes: adjust the VMID masks
      drm/amdgpu/userq: drop VCN and VPE doorbell handling
      drm/amdgpu: clean up and unify hw fence handling
      drm/amdgpu: fix SPDX headers on amdgpu_cper.c/h
      drm/amdgpu: fix SPDX header on amd_cper.h
      drm/amdgpu: fix SPDX header on irqsrcs_vcn_5_0.h
      drm/amdgpu: fix SPDX header on cyan_skillfish_reg_init.c
      drm/amdgpu/userq: fix SDMA and compute validation
      drm/amdgpu: set default gfx reset masks for gfx6-8
      drm/amdgpu: move reset debug disable handling
      drm/amdgpu: Drop PMFW RLC notifier from amdgpu_device_suspend()
      drm/amdgpu/smu: Handle S0ix for vangogh
      drm/amdgpu: fix possible fence leaks from job structure
      Revert "drm/amd/display: Move setup_stream_attribute"
      drm/amdgpu: fix cyan_skillfish2 gpu info fw handling
      drm/amdgpu/gmc11: add amdgpu_vm_handle_fault() handling
      drm/amdgpu/gmc12: add amdgpu_vm_handle_fault() handling
      drm/amdgpu: use common defines for HUB faults

Alex Hung (22):
      drm/amd/display: Remove comparing uint32_t to zero
      drm/amd/display: Add HDR workaround for a specific eDP
      drm/amd/display: Fix black screen with HDMI outputs
      drm/amd/display: Check NULL before accessing
      drm/colorop: Add destroy functions for color pipeline
      drm/colorop: define a new macro for_each_new_colorop_in_state
      drm/amd/display: Skip color pipeline initialization for cursor plane
      drm/amd/display: Add support for sRGB EOTF in DEGAM block
      drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
      drm/amd/display: Add support for sRGB EOTF in BLND block
      drm/colorop: Add 1D Curve Custom LUT type
      drm/amd/display: add shaper and blend colorops for 1D Curve Custom LU=
T
      drm/amd/display: add 3x4 matrix colorop
      drm/colorop: Add multiplier type
      drm/amd/display: add multiplier colorop
      drm/amd/display: Swap matrix and multiplier
      drm/colorop: Add 3D LUT support to color pipeline
      drm/amd/display: add 3D LUT colorop
      drm/amd/display: Ensure 3D LUT for color pipeline
      drm/amd/display: Disable CRTC degamma when color pipeline is enabled
      drm/colorop: Add DRM_COLOROP_1D_CURVE_GAMMA22 to 1D Curve
      drm/amd/display: Enable support for Gamma 2.2

Alexandr Sapozhnikov (1):
      drm/virtio: Handle drm_crtc_init_with_planes() errors

Alexandre Courbot (19):
      gpu: nova-core: register: use field type for Into implementation
      gpu: nova-core: replace wait_on with kernel equivalents
      gpu: nova-core: bitfield: simplify condition
      gpu: nova-core: bitfield: simplify expression
      gpu: nova-core: bitfield: remove BitOr implementation
      gpu: nova-core: replace `as` with `from` conversions where possible
      gpu: nova-core: vbios: do not use `as` when comparing BiosImageType
      gpu: nova-core: use `try_from` instead of `as` for u32 conversions
      rust: transmute: add `from_bytes_prefix` family of methods
      gpu: nova-core: vbios: use FromBytes for PmuLookupTable header
      gpu: nova-core: vbios: use FromBytes for PcirStruct
      gpu: nova-core: vbios: use FromBytes for BitHeader
      gpu: nova-core: vbios: use FromBytes for NpdeStruct
      gpu: nova-core: add functions and traits for lossless integer convers=
ions
      gpu: nova-core: replace use of `as` with functions from `num`
      gpu: nova-core: justify remaining uses of `as`
      gpu: nova-core: compute layout of more framebuffer regions
required for GSP
      gpu: nova-core: num: add functions to safely convert a const
value to a smaller type
      rust: enable slice_flatten feature and provide it through an
extension trait

Alice Ryhl (4):
      drm/gpuvm: add deferred vm_bo cleanup
      panthor: use drm_gpuva_unlink_defer()
      Merge tag 'v6.18-rc2' into 'drm-rust-next'
      gpu: nova-core: make formatting compatible with rust tree

Alistair Popple (11):
      gpu: nova-core: Set correct DMA mask
      gpu: nova-core: Create initial Gsp
      gpu: nova-core: gsp: Create wpr metadata
      gpu: nova-core: Add zeroable trait to bindings
      gpu: nova-core: gsp: Add GSP command queue bindings and handling
      gpu: nova-core: gsp: Create rmargs
      gpu: nova-core: gsp: Add SetSystemInfo command
      gpu: nova-core: gsp: Add SetRegistry command
      gpu: nova-core: gsp: Boot GSP
      gpu: nova-core: gsp: Wait for gsp initialization to complete
      gpu: nova-core: gsp: Retrieve GSP static info to gather GPU informati=
on

Alok Tiwari (2):
      drm: rcar-du: fix incorrect return in rcar_du_crtc_cleanup()
      drm/i915/dmc: Fix extra bracket and wrong variable in PIPEDMC error l=
ogs

Alvin Lee (6):
      drm/amd/display: Remove unused field in DML
      drm/amd/display: Update DCN401 path for cursor offload
      drm/amd/display: Update spacing in struct
      drm/amd/display: Update cursor offload assignments
      drm/amd/display: Increase IB mem size
      drm/amd/display: Only initialize LSDMA if it is supported in DMU

Alysa Liu (1):
      drm/amdgpu: Fix vram_usage underflow

Andi Shyti (2):
      drm/i915/gvt: Propagate vfio_set_irqs_validate_and_prepare() error
      drm/i915/gt: Use standard API for seqcount read in TLB invalidation

Andrew Mazour (1):
      drm/amd/display: Extend inbox0 lock to run Replay/PSR

Andrzej Kacprowski (6):
      accel/ivpu: Remove unused firmware boot parameters
      accel/ivpu: Add support for user-managed preemption buffer
      accel/ivpu: Fix doc description of job structure
      accel/ivpu: Update JSM API header to 3.33.0
      accel/ivpu: Trigger engine reset for additional job status codes
      accel/ivpu: Return correct job error status

Andy Yan (1):
      drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of
use win_mask calculate used layers

AngeloGioacchino Del Regno (9):
      drm/mediatek: mtk_hdmi: Improve mtk_hdmi_get_all_clk() flexibility
      drm/mediatek: mtk_hdmi: Add HDMI IP version configuration to pdata
      drm/mediatek: mtk_hdmi: Split driver and add common probe function
      drm/mediatek: mtk_hdmi_common: Make CEC support optional
      drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
      drm/mediatek: mtk_hdmi_common: Add OP_HDMI if helper funcs assigned
      drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
      drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
      drm/mediatek: mtk_hdmi_v2: Add debugfs ops and implement ABIST

Ankit Nautiyal (27):
      drm/i915/vrr: Refactor VRR live status wait into common helper
      drm/i915/psr:
s/intel_psr_min_vblank_delay/intel_psr_min_set_context_latency
      drm/i915/display: Add set_context_latency to crtc_state
      drm/i915/vrr: Use set_context_latency instead of
intel_vrr_real_vblank_delay()
      drm/i915/vrr: Use SCL for computing guardband
      drm/i915/dsb:
s/intel_dsb_wait_vblank_delay/intel_dsb_wait_for_delayed_vblank
      drm/i915/display: Wait for scl start instead of dsb_wait_vblanks
      drm/i915/reg_defs: Add REG_FIELD_MAX wrapper for FIELD_MAX()
      drm/i915/vrr: Clamp guardband as per hardware and timing constraints
      drm/i915/display: Drop intel_vrr_vblank_delay and use set_context_lat=
ency
      drm/i915/dsb: Inline dsb_vblank_delay() into
intel_dsb_wait_for_delayed_vblank()
      drm/i915/vrr: Use crtc_vsync_start/end for computing vrr.vsync_start/=
end
      drm/i915/display: Move intel_dpll_crtc_compute_clock early
      drm/i915/vrr: s/intel_vrr_compute_config_late/intel_vrr_compute_guard=
band
      drm/i915/vblank: Add helper to get correct vblank length
      drm/i915/psr: Consider SCL lines when validating vblank for wake late=
ncy
      drm/i915/psr: Introduce helper intel_psr_set_non_psr_pipes()
      drm/i915/display: Introduce dp/psr_compute_config_late()
      drm/i915/psr: Check if final vblank is sufficient for PSR features
      drm/i915/display: Add vblank_start adjustment logic for always-on VRR=
 TG
      drm/i915/display: Prepare for vblank_delay for LRR
      drm/i915/psr: Add helper to get min psr guardband
      drm/i915/dp: Add helper to get min sdp guardband
      drm/i915/dp: Check if guardband can accommodate sdp latencies
      drm/i915/vrr: Use the min static optimized guardband
      drm/i915/vrr: Use optimized guardband whenever VRR TG is active
      drm/i915/xe3p_lpd: Drop support for interlace mode

Arun Abhishek Chowhan (1):
      drm/xe: Sort include files alphabetically.

Arunpravin Paneer Selvam (3):
      drm/buddy: Optimize free block management with RB tree
      drm/buddy: Separate clear and dirty free block trees
      drm/buddy: Add KUnit tests for allocator performance under fragmentat=
ion

Asad Kamal (9):
      drm/amdgpu: Update invalidate and flush hdp function
      drm/amdgpu: Remove invalidate and flush hdp macros
      drm/amd/pm: Update default power1_cap
      drm/amd/pm: Add NULL check for power limit
      drm/amd/pm: Update pmfw headers for smu_v13_0_12
      drm/amd/pm: Add ppt1 support for smu_v13_0_12
      drm/amd/pm: Expose ppt1 limit for gc_v9_5_0
      drm/amd/pm: Enable ppt1 caps for smu_v13_0_12
      drm/amd/pm: Remove power2_average node

Ashley Smith (2):
      drm/panthor: Make the timeout per-queue instead of per-job
      drm/panthor: Reset queue slots if termination fails

Aswin Venkatesan (2):
      accel/qaic: Fix incorrect error return path
      accel/qaic: Fix comment

Athul Raj Kollareth (1):
      drm: Replace the deprecated DRM_* logging macros in gem helper files

Aurabindo Pillai (3):
      drm/amd/display: Add sink/link debug logs
      drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler
      drm/amd/display: Fix GFP_ATOMIC abuse

Austin Zheng (7):
      drm/amd/display: DML2.1 Reintegration
      drm/amd/display: Rename dml2 to dml2_0 folder
      drm/amd/display: Add pte_buffer_mode and force_one_row_for_frame
in dchub reg
      drm/amd/display: Remove old PMO options
      drm/amd/display: Update P-state naming for clarity.
      drm/amd/display: Refactor VActive implementation
      drm/amd/display: Add Pstate viewport reduction

Badal Nilawar (1):
      drm/xe: Prevent runtime PM wake while reading rp0 frequency

Bagas Sanjaya (3):
      drm/ttm: Fix @alloc_flags description
      accel/qaic: Separate DBC_STATE_* definition list
      accel/qaic: Format DBC states table in sysfs ABI documentation

Balasubramani Vivekanandan (7):
      drm/xe: Drop CTC_MODE register read
      drm/xe/xe3p_lpm: Skip disabling NOA on unsupported IPs
      drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
      drm/xe/xe3p_lpm: Add special check in Media GT for Main GAMCTRL
      drm/xe/cri: Add CRI platform definition
      drm/xe/gt: Synchronize GT reset with device unbind
      drm/xe/guc: Synchronize Dead CT worker with unbind

Barry Song (1):
      dma-buf: system_heap: use larger contiguous mappings instead of
per-page mmap

Ben Skeggs (2):
      drm/nouveau/mmu/gp100: Remove unused/broken support for compression
      drm/nouveau/mmu/tu102: Add support for compressed kinds

Boris Brezillon (7):
      drm/panfrost: Introduce uAPI for JM context creation
      drm/panfrost: Introduce JM contexts for manging job resources
      drm/panfrost: Expose JM context IOCTLs to UM
      drm/panfrost: Display list of device JM contexts over debugfs
      drm/panthor: Handle errors returned by drm_sched_entity_init()
      drm/panthor: Fix group_free_queue() for partially initialized queues
      drm/panthor: Fix UAF on kernel BO VA nodes

Brady Norander (1):
      drm/amdgpu: use static ids for ACP platform devs

Brahmajit Das (1):
      drm/tegra: hdmi: sor: Fix error: variable =E2=80=98j=E2=80=99 set but=
 not used

Brian Masney (7):
      drm/imx/ipuv3/imx-tve: convert from round_rate() to determine_rate()
      drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
      drm/pl111: convert from round_rate() to determine_rate()
      drm/stm/dw_mipi_dsi-stm: convert from round_rate() to determine_rate(=
)
      drm/stm/lvds: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_hdmi_ddc_clk: convert from round_rate() to
determine_rate()
      drm/sun4i/sun4i_tcon_dclk: convert from round_rate() to determine_rat=
e()

Brian Welty (1):
      drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT

Carl Vanderlip (1):
      accel/qaic: Use overflow check function instead of division

Casey Connolly (2):
      drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
      drm/panel: sofef00: Initialise at 50% brightness

Chaitanya Kumar Borah (1):
      drm: Add helper to extract lut from struct drm_color_lut32

Chaoyi Chen (2):
      dt-bindings: ili9881c: Add compatible string for Wanchanglong w552946=
aaa
      drm/panel: ilitek-ili9881d: Add support for Wanchanglong W552946AAA p=
anel

Charlene Liu (5):
      drm/amd/display: add dispclk ramping to dcn35.
      drm/amd/display: add dccg dfs mask def
      drm/amd/display: increase max link count and fix link->enc NULL
pointer access
      drm/amd/display: Add null pointer check in link_dpms
      drm/amd/display: Check DCCG_AUDIO_DTO2 register mask exist

Chelsy Ratnawat (1):
      accel/qaic: Replace snprintf() with sysfs_emit() in sysfs show functi=
ons

Chen-Yu Tsai (1):
      MAINTAINERS: Update Chen-Yu's email address

Chia-I Wu (4):
      drm/panthor: assign unique names to queues
      drm/panthor: always set fence errors on CS_FAULT
      dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
      drm/panthor: add custom ASN_HASH support for mt8196

Chintan Patel (1):
      drm/vblank: Increase timeout in drm_wait_one_vblank()

Christian K=C3=B6nig (8):
      drm/ttm: rename ttm_bo_put to _fini v3
      drm/amdgpu: reduce queue timeout to 2 seconds v2
      drm/amdgpu: grab a BO reference in vm_lock_done_list.
      dma-buf: rework stub fence initialisation v2
      drm/amdgpu: avoid memory allocation in the critical code path v3
      drm/amdgpu: use GFP_ATOMIC instead of NOWAIT in the critical path
      dma-buf/sw-sync: always taint the kernel when sw-sync is used
      dma-buf: cleanup dma_fence_describe v3

Christophe JAILLET (1):
      drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()

Christopher Obbard (1):
      drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities

Chuntao Tso (1):
      drm/amd/display: To support Replay frame skip mode

Clay King (1):
      drm/amd/display: Remove inaccessible URL

Colin Ian King (1):
      drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset

Connor Abbott (1):
      drm/msm: Wait for MMU devcoredump when waiting for GMU

Cristian Ciocaltea (12):
      drm/bridge: dw-hdmi-qp: Add CEC support
      drm/bridge: dw-hdmi-qp: Fixup timer base setup
      drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
      drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_d=
ata
      dt-bindings: display: rk3588-dw-hdmi-qp: Add frl-enable-gpios propert=
y
      drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main s=
truct
      drm/rockchip: vop2: Check bpc before switching DCLK source
      drm/bridge: dw-hdmi-qp: Handle platform supported formats and color d=
epth
      drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
      drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576 regs
      drm/rockchip: dw_hdmi_qp: Add high color depth support

Cruise Hung (1):
      drm/amd/display: Control BW allocation in FW side

Cyrille Pitchen (1):
      drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()

Damon Ding (2):
      drm/rockchip: analogix_dp: Apply devm_clk_get_optional() for
&rockchip_dp_device.grfclk
      drm/rockchip: analogix_dp: Use dev_err_probe() instead of
DRM_DEV_ERROR() during probing

Dan Carpenter (3):
      drm/amdgpu/userqueue: Fix use after free in
amdgpu_userq_buffer_vas_list_cleanup()
      drm/vkms: Fix use after frees on error paths
      drm/amd/display: Fix logical vs bitwise bug in
get_embedded_panel_info_v2_1()

Daniel Palmer (3):
      drm/radeon: Clean up pdev->dev instances in probe
      drm/radeon: Do not kfree() devres managed rdev
      drm/radeon: Remove calls to drm_put_dev()

Daniel Stone (5):
      drm/rockchip: Demote normal drm_err to debug
      drm/rockchip: Declare framebuffer width/height bounds
      drm/rockchip: Return error code for errors
      drm/rockchip: Rename variables for clarity
      drm/rockchip: Use temporary variables

Daniel Thompson (1):
      drm/edp-panel: Add touchscreen panel used by Lenovo X13s

Daniel del Castillo (4):
      gpu: nova-core: Simplify `transmute` and `transmute_mut` in fwsec.rs
      gpu: nova-core: Fix capitalization of some comments
      gpu: nova-core: Simplify `DmaObject::from_data` in nova-core/dma.rs
      Documentation: nova: Update the todo list

Danilo Krummrich (5):
      gpu: nova-core: gsp: remove useless conversion
      gpu: nova-core: gsp: do not unwrap() SGEntry
      MAINTAINERS: add Tyr to DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
      drm: nova: depend on CONFIG_64BIT
      drm: nova: select NOVA_CORE

Dave Airlie (19):
      Merge tag 'drm-xe-next-2025-10-20' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2025-11-04' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2025-11-05-1' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.19-2025-11-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-xe-next-2025-11-05' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-xe-next-2025-11-14' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-2025-11-14-1' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-2025-11-14' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-intel-gt-next-2025-11-14' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-next-6.19-2025-11-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-rust-next-2025-11-18' of
https://gitlab.freedesktop.org/drm/rust/kernel into drm-next
      Merge tag 'v6.18-rc6' into drm-next
      Merge tag 'drm-msm-next-2025-11-18' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'mediatek-drm-next-20251120' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-xe-next-fixes-2025-11-21' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-rust-next-2025-11-21' of
https://gitlab.freedesktop.org/drm/rust/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2025-11-26' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2025-12-01-1' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.19-2025-12-02' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David (Ming Qiang) Wu (1):
      drm/amdgpu/userq: need to unref bo

David Heidelberg (11):
      dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
      drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel
      dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
      drm/panel: sofef00: Clean up panel description after s6e3fc2x01 remov=
al
      drm/panel: sofef00: Handle all regulators
      drm/panel: sofef00: Split sending commands to the enable/disable func=
tions
      drm/panel: sofef00: Introduce page macro
      drm/panel: sofef00: Introduce compatible which includes the panel nam=
e
      drm/panel: sofef00: Simplify get_modes
      drm/panel: sofef00: Mark the LPM mode always-on
      drm/panel: sofef00: Non-continuous mode and video burst are supported

Dillon Varone (3):
      drm/amd/display: Fix DMUB reset sequence for DCN32
      drm/amd/display: Revert DCN4 max buffered cursor size to 64
      drm/amd/display: Fix index bug for fill latency

Diogo Ivo (1):
      drm/tegra: Add NVJPG driver

Dmitry Baryshkov (5):
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/tests: make sure drm_client_modeset tests are enabled
      drm/msm: fix allocation of dumb buffers for non-RGB formats
      drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
      drm/msm/a2xx: stop over-complaining about the legacy firmware

Dmitry Osipenko (1):
      drm/rockchip: Set VOP for the DRM DMA device

Dmytro Laktyushkin (1):
      drm/amd/display: Add opp count validation to dml2.1

Dnyaneshwar Bhadane (5):
      drm/pcids: Split PTL pciids group to make wcl subplatform
      drm/i915/display: Add definition for wcl as subplatform
      drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A
      drm/xe/nvls: Attach MOCS table for NVL-S
      drm/i915/xe3lpd: Load DMC for Xe3_LPD version 30.02

Dominik Kaszewski (7):
      drm/amd/display: Remove dc state from check_update
      drm/amd/display: Fix performance regression from full updates
      drm/amd/display: Remove dc param from check_update
      drm/amd/display: Add lock descriptor to check_update
      drm/amd/display: Make observers const-correct
      drm/amd/display: Change lock descriptor values
      drm/amd/display: Revert in_transfer_func_change to MED

Ellen Pan (6):
      drm/amdgpu: Updated naming of SRIOV critical region
offsets/sizes with _V1 suffix
      drm/amdgpu: Add SRIOV crit_region_version support
      drm/amdgpu: Introduce SRIOV critical regions v2 during VF init
      drm/amdgpu: Reuse fw_vram_usage_* for dynamic critical region in SRIO=
V
      drm/amdgpu: Add logic for VF ipd and VF bios to init from
dynamic crit_region offsets
      drm/amdgpu: Add logic for VF data exchange region to init from
dynamic crit_region offsets

Eric Huang (1):
      drm/amdkfd: assign AID to uuid in topology for SPX mode

Eslam Khafagy (1):
      drm: atmel-hlcdc: replace dev_* print functions with drm_* variants

Ettore Chimenti (3):
      dt-bindings: vendor-prefixes: Add ASL Xiamen Technology
      dt-bindings: display: bridge: simple: document the ASL CS5263
DP-to-HDMI bridge
      drm/bridge: simple: add ASL CS5263 DP-to-HDMI bridge

Fabio Estevam (3):
      dt-bindings: vendor-prefixes: Add Raystar Optronics, Inc
      dt-bindings: display: simple: Add Raystar RFF500F-AWH-DNN panel
      drm/panel: simple: Add Raystar RFF500F-AWH-DNN panel entry

Fangzhi Zuo (2):
      drm/amd/display: Prevent Gating DTBCLK before It Is Properly Latched
      drm/amd/display: Fix pbn to kbps Conversion

Fei Yang (2):
      drm/xe/xe3p_xpc: Add L3 bank mask
      drm/xe: Use SG_TILE_ADDR_RANGE instead of TILE_ADDR_RANGE

Gangliang Xie (11):
      drm/amd/pm: add new message definitions for pmfw eeprom interface
      drm/amd/pm: implement ras_smu_drv interface for smu v13.0.12
      drm/amd/pm: add smu ras driver framework
      drm/amdgpu: add function to check if pmfw eeprom is supported
      drm/amdgpu: add wrapper functions for pmfw eeprom interface
      drm/amdgpu: adapt reset function for pmfw eeprom
      drm/amdgpu: add initialization function for pmfw eeprom
      drm/amdgpu: add check function for pmfw eeprom
      drm/amd/pm: check pmfw eeprom feature bit
      drm/amdgpu: initialize max record count after table reset
      drm/amd/pm: remove unnecessary prints for smu busy

Geert Uytterhoeven (2):
      drm/bridge: imx8qxp-ldb: Remove dummy Runtime PM callback
      drm/imagination: Fix reference to devm_platform_get_and_ioremap_resou=
rce()

George Shen (2):
      drm/amd/display: Add interface to capture power feature status
for debug logging
      drm/amd/display: Add interface to capture expected HW state from SW s=
tate

Gopi Krishna Menon (1):
      drm/msm: Add NULL check in vm_op_enqueue()

Guido G=C3=BCnther (3):
      drm/panel: visionox-rm69299: Fix clock frequency for SHIFT6mq
      drm/panel: visionox-rm69299: Don't clear all mode flags
      drm/panel: visionox-rm69299: Add backlight support

Gustavo Sousa (11):
      drm/i915/display: Extract separate AUX PW descriptors
      drm/i915/display: Enable PICA power before AUX
      drm/xe/tests/pci: Convert GT count check to general device check
      drm/xe/tests/pci: Check dma_mask_size, va_bits and vm_max_level
      drm/i915/display: Use braces for if-ladder in intel_bw_init_hw()
      drm/i915/xe3p_lpd: Add CDCLK table
      drm/i915/xe3p_lpd: Load DMC firmware
      drm/i915/xe3p_lpd: Extend Wa_16025573575
      drm/i915/xe3p_lpd: Reload DMC MMIO for pipes C and D
      drm/i915/dram: Add field ecc_impacting_de_bw
      drm/i915/xe3p_lpd: Always apply WaWmMemoryReadLatency

Gwan-gyeong Mun (1):
      drm/xe: Remove never used code in xe_vm_create()

Harish Chegondi (1):
      drm/xe/xe3p: Add xe3p EU stall data format

Harish Kasiviswanathan (1):
      drm/amdkfd: Fix GPU mappings for APU after prefetch

Harry VanZyllDeJong (1):
      drm/amd/display: fix duplicate aux command with AMD aux backlight

Harry Wentland (30):
      drm/amd/display: Fix null pointer on analog detection
      drm: Add helper for conversion from signed-magnitude
      drm/vkms: Add kunit tests for VKMS LUT handling
      drm/doc/rfc: Describe why prescriptive color pipeline is needed
      drm/colorop: Introduce new drm_colorop mode object
      drm/colorop: Add TYPE property
      drm/colorop: Add 1D Curve subtype
      drm/colorop: Add BYPASS property
      drm/colorop: Add NEXT property
      drm/colorop: Add atomic state print for drm_colorop
      drm/plane: Add COLOR PIPELINE property
      drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
      Documentation/gpu: document drm_colorop
      drm/vkms: Add enumerated 1D curve colorop
      drm/vkms: Add kunit tests for linear and sRGB LUTs
      drm/colorop: Add 3x4 CTM type
      drm/vkms: Use s32 for internal color pipeline precision
      drm/vkms: add 3x4 matrix in color pipeline
      drm/tests: Add a few tests around drm_fixed.h
      drm/vkms: Add tests for CTM handling
      drm/colorop: pass plane_color_pipeline client cap to atomic check
      drm/amd/display: Ignore deprecated props when plane_color_pipeline se=
t
      drm/amd/display: Add bypass COLOR PIPELINE
      drm/colorop: Add PQ 125 EOTF and its inverse
      drm/amd/display: Enable support for PQ 125 EOTF and Inverse
      drm/colorop: add BT2020/BT709 OETF and Inverse OETF
      drm/amd/display: Add support for BT.709 and BT.2020 TFs
      drm/colorop: Define LUT_1D interpolation
      drm/colorop: allow non-bypass colorops
      drm/amd/display: Add AMD color pipeline doc

Huiwen He (2):
      drm/msm: Fix NULL pointer dereference in crashstate_get_vm_logs()
      drm/msm: fix missing NULL check after kcalloc in crashstate_get_bos()

Ian Chen (2):
      drm/amd/display: Add new SMART POWER OLED interfaces
      drm/amd/display: fix Smart Power OLED not working after S4

Icenowy Zheng (1):
      drm/ttm: add pgprot handling for RISC-V

Iker Pedrosa (5):
      drm/solomon: Move calls to drm_gem_fb_end_cpu*()
      drm/solomon: Use drm_WARN_ON_ONCE instead of WARN_ON
      drm/solomon: Simplify mode_valid() using DRM helper
      drm/solomon: Simplify get_modes() using DRM helper
      drm/solomon: Enforce one assignment per line

Ilya Bakoulin (2):
      drm/amd/display: add new block sequence-building/executing functions
      drm/amd/display: Fix misc. checkpatch issues

Ilya Zlobintsev (1):
      drm/amd/pm: Avoid writing nulls into `pp_od_clk_voltage`

Imre Deak (23):
      drm/dp: Add quirk for Synaptics DSC throughput link-bpp limit
      drm/dp: Add helpers to query the branch DSC max throughput/line-width
      drm/i915/dp: Calculate DSC slice count based on per-slice peak throug=
hput
      drm/i915/dp: Pass DPCD device descriptor to intel_dp_get_dsc_sink_cap=
()
      drm/i915/dp: Verify branch devices' overall pixel throughput/line wid=
th
      drm/i915/dp: Handle Synaptics DSC throughput link-bpp quirk
      drm/i915/display: Sanitize
PHY_C20_VDR_CUSTOM_SERDES_RATE/DP_RATE field macros
      drm/i915/display: Sanitize PHY_C20_VDR_CUSTOM_SERDES_RATE/IS_DP flag =
macro
      drm/i915/display: Sanitize
PHY_C20_VDR_CUSTOM_SERDES_RATE/CONTEXT_TOGGLE flag macro
      drm/i915/display: Sanitize
PHY_C20_VDR_CUSTOM_SERDES_RATE/IS_HDMI_FRL flag macro
      drm/i915/display: Fix PHY_C20_VDR_CUSTOM_SERDES_RATE programming
      drm/i915/display: Fix PHY_C20_VDR_HDMI_RATE programming
      drm/i915/display: Add missing clock to C10 PHY state compute/HW reado=
ut
      drm/i915/dsc: Add helper to enable the DSC configuration for a CRTC
      drm/i915/dp: Ensure the FEC state stays disabled for UHBR links
      drm/i915/dp: Export helper to determine if FEC on non-UHBR links
is required
      drm/i915/dp_mst: Reuse the DP-SST helper function to compute FEC conf=
ig
      drm/i915/dp_mst: Track DSC enabled status on the MST link
      drm/i915/dp_mst: Recompute all MST link CRTCs if DSC gets
enabled on the link
      drm/i915/dp: Fix panel replay when DSC is enabled
      drm/i915/dp: Simplify intel_dp_needs_8b10b_fec()
      drm/i915/dp_mst: Fix check for FEC support for an uncompressed stream
      drm/i915/dp_mst: Disable Panel Replay

Ivan Lipski (7):
      drm/amd/display: Consolidate two DML2 FP guards
      drm/amd/display: Fix incorrect return of vblank enable on
unconfigured crtc
      drm/amd/display: Allow VRR params change if unsynced with the stream
      drm/amd/display: Add an HPD filter for HDMI
      drm/amd/display: Clear the CUR_ENABLE register on DCN20 on DPP5
      drm/amd/display: Check ATOM_DEVICE_CRT2_SUPPORT in dc_load_detection
      drm/amd/display: Move RGB-type check for audio sync to DCE HW sequenc=
e

Jacek Lawrynowicz (5):
      accel/ivpu: Refactor priority_bands_show for readability
      accel/ivpu: Rework bind/unbind of imported buffers
      accel/ivpu: Fix page fault in ivpu_bo_unbind_all_bos_from_context()
      accel/ivpu: Improve BO alloc/free warnings
      accel/ivpu: Add support for userptr buffer objects

Jack Chang (3):
      drm/amd/display: Add panel replay capability detection
      drm/amd/display: Add panel replay enablement option and logic
      drm/amd/display: Get panel replay capability from DPCD

James Flowers (1):
      drm/ssd130x: Use kmalloc_array() instead of kmalloc()

Jani Nikula (90):
      drm/i915: do cck get/put inside vlv_get_hpll_vco()
      drm/i915: do cck get/put inside vlv_get_cck_clock()
      drm/i915: add vlv_clock_get_gpll()
      drm/i915: add vlv_clock_get_czclk()
      drm/i915: add vlv_clock_get_hrawclk()
      drm/i915: make vlv_get_cck_clock_hpll() static
      drm/i915: add vlv_clock_get_cdclk()
      drm/i915: make vlv_get_cck_clock() static
      drm/i915: rename vlv_get_hpll_vco() to vlv_clock_get_hpll_vco()
      drm/i915: cache the results in vlv_clock_get_hpll_vco() and use it mo=
re
      drm/i915: remove vlv_get_cck_clock_hpll()
      drm/i915: remove intel_update_czclk() as unnecessary
      drm/i915: log HPLL frequency similar to CZCLK
      drm/i915: move hpll and czclk caching under display
      drm/i915: split out vlv_clock.[ch]
      drm/i915: add note on VLV/CHV hpll_freq and czclk_freq caching
      drm/xe/fbdev: use the same 64-byte stride alignment as i915
      drm/i915/fbdev: make intel_framebuffer_create() error return
handling explicit
      drm/{i915, xe}/fbdev: pass struct drm_device to intel_fbdev_fb_alloc(=
)
      drm/{i915, xe}/fbdev: deduplicate struct drm_mode_fb_cmd2 init
      drm/i915/fbdev: abstract bo creation
      drm/xe/fbdev: abstract bo creation
      drm/{i915, xe}/fbdev: add intel_fbdev_fb_bo_destroy()
      drm/{i915,xe}/fbdev: deduplicate fbdev creation
      drm/{i915, xe}/fbdev: pass struct drm_device to intel_fbdev_fb_fill_i=
nfo()
      drm/i915/fbdev: drop dependency on display in i915 specific code
      drm/i915/irq: use a dedicated IMR cache for VLV/CHV
      drm/i915/irq: use a dedicated IMR cache for gen 5-7
      drm/i915/irq: rename irq_mask to gen2_imr_mask
      drm/i915/irq: rename de_irq_mask[] to de_pipe_imr_mask[]
      drm/i915/irq: add ilk_display_irq_reset()
      drm/i915/irq: drop intel_psr_regs.h include
      drm/i915/irq: initialize gen2_imr_mask in terms of enable_mask
      drm/i915/irq: abstract i9xx_display_irq_enable_mask()
      drm/i915/irq: move check for HAS_HOTPLUG() inside i9xx_hpd_irq_ack()
      drm/i915/irq: split ILK display irq handling
      drm/i915/gem: add i915_gem_fence_wait_priority_display() helper
      Merge drm/drm-next into drm-intel-next
      drm/{i915, xe}/stolen: rename i915_stolen_fb to intel_stolen_node
      drm/xe/stolen: rename fb to node in stolen compat header
      drm/xe/stolen: convert compat stolen macros to inline functions
      drm/xe/stolen: switch from BUG_ON() to WARN_ON() in compat
      drm/i915/stolen: convert intel_stolen_node into a real struct of its =
own
      drm/xe/stolen: convert compat static inlines to proper functions
      drm/{i915, xe}/stolen: make struct intel_stolen_node opaque
      drm/{i915, xe}/stolen: add device pointer to struct intel_stolen_node
      drm/{i915, xe}/stolen: use the stored i915/xe device pointer
      drm/{i915, xe}/stolen: convert stolen interface to struct drm_device
      drm/xe/stolen: use the same types as i915 interface
      drm/{i915,xe}: driver agnostic drm to display pointer chase
      drm/i915/irq: duplicate HAS_FBC() for irq error mask usage
      Merge drm/drm-next into drm-intel-next
      drm/i915: include gen 2 in HAS_128_BYTE_Y_TILING()
      drm/i915/display: duplicate 128-byte Y-tiling feature check
      drm/i915/display: add HAS_AUX_CCS() feature check
      drm/i915: drop unused non-i915 IS_<PLATFORM> macros
      drm/i915/panic: fix panic structure allocation memory leak
      drm/i915/display: drop a few unnecessary i915_drv.h includes
      drm/xe/compat: drop include xe_device.h from i915_drv.h
      drm/{i915,xe}/fbdev: add intel_fbdev_fb_pitch_align()
      drm: include drm_print.h where needed
      drm/buddy: replace drm_print.h include with a forward declaration
      drm/mm: replace drm_print.h include with a forward declaration
      drm/ttm: replace drm_print.h include with a forward declaration
      drm/i915/dsi: log send packet sequence errors
      drm/i915/dsi: debug log send packet sequence contents
      drm/i915: split out separate files for jiffies timeout and wait helpe=
rs
      drm/i915/display: create intel_display_utils.h
      drm/i915/display: add intel_display_run_as_guest()
      drm/i915/display: add intel_display_vtd_active()
      drm/i915/display: switch to intel_display_utils.h
      drm/xe/compat: reduce i915_utils.[ch]
      drm/{i915, xe}/display: pass parent interface to display probe
      drm/renesas: include drm_print.h where needed
      drm/rockchip: include drm_print.h where needed
      drm/hyperv: include drm_print.h where needed
      drm/displayid: pass iter to drm_find_displayid_extension()
      drm/edid: add DRM_EDID_IDENT_INIT() to initialize struct drm_edid_ide=
nt
      drm/displayid: add quirk to ignore DisplayID checksum errors
      drm/i915/psr: fix pipe to vblank conversion
      drm/vblank: use drm_crtc_vblank_crtc() in workers
      drm/tidss: use drm_crtc_vblank_crtc()
      drm/vmwgfx: use drm_crtc_vblank_crtc()
      drm/gma500: use drm_crtc_vblank_crtc()
      drm/atomic: use drm_crtc_vblank_waitqueue()
      drm/msm: use drm_crtc_vblank_waitqueue()
      Merge drm/drm-next into drm-intel-next
      drm/i915/rom: convert intel_rom interfaces to struct drm_device
      drm/i915/ltphy: include intel_display_utils.h instead of i915_utils.h
      drm/xe: remove stale runtime_pm member

Janusz Krzysztofik (4):
      drm/vgem-fence: Fix potential deadlock on release
      drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
      drm/i915: Wait longer for threads in migrate selftest on CHV/BXT+VTD
      drm/i915: Wait for page_sizes_gtt in gtt selftest on CHV/BXT+VTD

Jay Liu (1):
      drm/mediatek: Fix CCORR mtk_ctm_s31_32_to_s1_n function issue

Jayesh Choudhary (2):
      drm/tidss: Remove max_pclk_khz and min_pclk_khz from tidss
display features
      drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook

Jeff Hugo (2):
      accel/qaic: Support the new READ_DATA implementation
      accel/qaic: Implement basic SSR handling

Jernej Skrabec (30):
      drm/sun4i: mixer: Fix up DE33 channel macros
      drm/sun4i: mixer: Remove ccsc cfg for >=3D DE3
      drm/sun4i: de2: Initialize layer fields earlier
      drm/sun4i: ui_layer: Move check from update to check callback
      drm/sun4i: vi_layer: Move check from update to check callback
      drm/sun4i: layers: Make atomic commit functions void
      drm/sun4i: Move blender config from layers to mixer
      drm/sun4i: ui layer: Write attributes in one go
      drm/sun4i: vi layer: Write attributes in one go
      drm/sun4i: mixer: Move layer enabling to atomic_update
      drm/sun4i: de2/de3: Simplify CSC config interface
      drm/sun4i: csc: Simplify arguments with taking plane state
      drm/sun4i: de2/de3: Move plane type determination to mixer
      drm/sun4i: ui_layer: Change index meaning
      drm/sun4i: layer: move num of planes calc out of layer code
      drm/sun4i: ui_layer: use layer struct instead of multiple args
      drm/sun4i: vi_layer: use layer struct instead of multiple args
      drm/sun4i: ui_scaler: use layer instead of mixer for args
      drm/sun4i: vi_scaler: use layer instead of mixer for args
      drm/sun4i: layers: Make regmap for layers configurable
      drm/sun4i: csc: use layer arg instead of mixer
      drm/sun4i: layers: add physical index arg
      drm/sun4i: vi_scaler: Update DE33 base calculation
      drm/sun4i: mixer: Convert heuristics to quirk
      drm/sun4i: ui_scaler: drop sanity checks
      drm/sun4i: mixer: Add quirk for number of VI scalers
      drm/sun4i: mixer: split out layer config
      drm/sun4i: layer: replace mixer with layer struct
      drm/sun4i: vi_scaler: Find mixer from crtc
      drm/sun4i: Nuke mixer pointer from layer code

Jesse.Zhang (6):
      drm/ttm: Add safety check for NULL man->bdev in ttm_resource_manager_=
usage
      drm/amd/pm: smu13: Enable VCN_RESET for pgm 7 with appropriate
firmware version
      drm/amdgpu: Convert amdgpu userqueue management from IDR to XArray
      drm/amdgpu: Implement user queue reset functionality
      drm/amdgpu: fix lock warning in amdgpu_userq_fence_driver_process
      drm/amdgpu: resume MES scheduling after user queue hang
detection and recovery

Jessica Zhang (1):
      MAINTAINERS: Update Jessica Zhang's email address

Jiapeng Chong (4):
      drm/amd/display: remove unneeded semicolon
      drm/amd/display: remove unneeded semicolon
      drm/amd/display: remove unneeded semicolon
      drm/amdgpu/userqueue: Remove duplicate amdgpu_reset.h header

Jie Zhang (1):
      drm/msm/a6xx: Add support for Adreno 612

Jinzhou Su (2):
      drm/amdgpu: clear bad page info of ras module
      drm/amdgpu: Add uniras version in sysfs

Jocelyn Falempe (1):
      drm/ast: Handle framebuffer from dma-buf

Joel Fernandes (18):
      gpu: nova-core: vbios: Rework BiosImage to be simpler
      gpu: nova-core: bitfield: Move bitfield-specific code from
register! into new macro
      gpu: nova-core: bitfield: Add support for different storage widths
      gpu: nova-core: bitfield: Add support for custom visibility
      gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
      gpu: nova-core: falcon: Add support to check if RISC-V is active
      gpu: nova-core: falcon: Add support to write firmware version
      gpu: nova-core: falcon: Move waiting until halted to a helper
      gpu: nova-core: falcon: Move start functionality into separate helper
      gpu: nova-core: falcon: Move mbox functionalities into helper
      gpu: nova-core: falcon: Move dma_reset functionality into helper
      gpu: nova-core: gsp: Add support for checking if GSP reloaded
      gpu: nova-core: Add bindings required by GSP sequencer
      gpu: nova-core: Implement the GSP sequencer
      gpu: nova-core: sequencer: Add register opcodes
      gpu: nova-core: sequencer: Add delay opcode support
      gpu: nova-core: sequencer: Implement basic core operations
      gpu: nova-core: sequencer: Implement core resume operation

Johan Hovold (9):
      drm/imx/dw-hdmi: drop unused module alias
      drm/imx/ldb: drop unused module alias
      drm/imx/tve: drop unused module alias
      drm/imx/parallel-display: drop unused module alias
      drm/mediatek: mtk_hdmi: Fix probe device leaks
      drm/mediatek: Fix probe resource leaks
      drm/mediatek: Fix probe memory leak
      drm/mediatek: Fix probe device leaks
      drm/mediatek: ovl_adaptor: Fix probe device leaks

John Hubbard (10):
      gpu: nova-core: regs: rename .alter() --> .update()
      gpu: nova-core: Ada: basic GPU identification
      gpu: nova-core: remove an unnecessary register read: HWCFG1
      gpu: nova-core: remove unnecessary need_riscv, bar parameters
      gpu: nova-core: apply the one "use" item per line policy
      gpu: nova-core: implement Display for Spec
      gpu: nova-core: prepare Spec and Revision types for boot0/boot42
      gpu: nova-core: make Architecture behave as a u8 type
      gpu: nova-core: add boot42 support for next-gen GPUs
      gpu: nova-core: provide a clear error report for unsupported GPUs

John Ripple (1):
      drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD

John Smith (2):
      drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Fiji
      drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Iceland

Jonathan Cavitt (6):
      drm/i915/gvt: Remove unnecessary check in reg_is_mmio
      drm/i915/gvt: Fix intel_vgpu_gpa_to_mmio_offset kernel docs
      drm/i915/gvt: Simplify case switch in intel_vgpu_ioctl
      drm/i915/gvt: Improve intel_vgpu_ioctl hdr error handling
      drm: Prevent sign extension on hdisplay and vdisplay
      drm/i915/display: Add default case to mipi_exec_send_packet

Jonathan Kim (2):
      drm/amdgpu: update remove after reset flag for MES remove queue
      drm/amdkfd: relax checks for over allocation of save area

Joonas Lahtinen (1):
      Merge drm/drm-next into drm-intel-gt-next

Joshua Aberback (1):
      drm/amd/display: Persist stream refcount through restore

Josua Mayer (3):
      dt-bindings: display: panel: ronbo,rb070d30: panel-common ref
      dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
      drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sle=
ep

Jos=C3=A9 Exp=C3=B3sito (8):
      drm/vkms: Expose device creation and destruction
      drm/vkms: Allow to configure the default device creation
      drm/vkms: Remove completed task from the TODO list
      drm/vkms: Allow to configure connector status
      drm/vkms: Allow to update the connector status
      drm/vkms: Allow to configure connector status via configfs
      drm/vkms: Fix run-tests.sh script name
      drm/vkms: Update testing with IGT IGT_DEVICE

Jouni H=C3=B6gander (11):
      drm/i915/alpm: Remove error handling from get_lfps_cycle_min_max_time
      drm/i915/psr: Deactivate PSR only on LNL and when selective fetch ena=
bled
      drm/i915/alpm: Compute ALPM parameters into crtc_state->alpm_state
      drm/i915/alpm: Remove parameters suffix from intel_dp->alpm_parameter=
s
      drm/i915/display: Take into account AS SDP in intel_dp_sdp_min_guardb=
and
      drm/{i915, xe}/display: Add display runtime pm parent interface
      drm/i915/display: Runtime pm wrappers for display parent interface
      drm/xe/display: Runtime pm wrappers for display parent interface
      drm/i915/display: Use display parent interface for i915 runtime pm
      drm/xe/display: Use display parent interface for xe runtime pm
      drm/xe: Do clean shutdown also when using flr

Juha-pekka Heikkila (1):
      drm/i915/xe3p_lpd: Don't allow odd ypan or ysize with semiplanar form=
at

Jun Nie (10):
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: Use dedicated WB number definition
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

Karen Chen (1):
      drm/amd/display: Add more DC HW state info to underflow logging

Karol Wachowski (11):
      accel/ivpu: Reset cmdq->db_id on register failure
      accel/ivpu: Ensure rpm_runtime_put in case of engine reset/resume fai=
l
      accel/ivpu: Update JSM firmware API to latest 3.32.5 version
      accel/ivpu: Split FW runtime and global memory buffers
      accel/ivpu: Fix DCT active percent format
      accel/ivpu: Disallow setting sched mode OS starting from NPU6
      accel/ivpu: Wait for CDYN de-assertion during power down sequence
      accel/ivpu: Improve debug and warning messages
      accel/ivpu: Add fdinfo support for memory statistics
      accel/ivpu: Count only resident buffers in memory utilization
      accel/ivpu: Fix warning due to undefined CONFIG_PROC_FS

Karunika Choo (8):
      drm/panthor: Add arch-specific panthor_hw binding
      drm/panthor: Add architecture-specific function operations
      drm/panthor: Introduce panthor_pwr API and power control framework
      drm/panthor: Implement L2 power on/off via PWR_CONTROL
      drm/panthor: Implement soft reset via PWR_CONTROL
      drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
      drm/panthor: Support 64-bit endpoint_req register for Mali-G1
      drm/panthor: Add support for Mali-G1 GPUs

Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Synaptics TDDI panel
      drm: panel: add support for Synaptics TDDI series DSI panels

Kenneth Feng (1):
      drm/amd/display: pause the workload setting in dm

Kenneth Graunke (1):
      drm/xe: Increase global invalidation timeout to 1000us

Ketil Johnsen (3):
      drm/panthor: Fix UAF race between device unplug and FW event processi=
ng
      drm/panthor: disable async work during unplug
      drm/panthor: Fix race with suspend during unplug

Khaled Almahallawy (1):
      drm/i915/display: Extend i915_display_info with Type-C port details

Kriish Sharma (1):
      drm/xe: fix kernel-doc function name mismatch in xe_pm.c

Krzysztof Karas (1):
      drm/i915/gem: Avoid accessing uninitialized context in emit_rpcs_quer=
y()

Krzysztof Kozlowski (1):
      dt-bindings: display/msm: Reference DAI schema for DAI properties

Lad Prabhakar (2):
      drm: renesas: rz-du: Drop ARCH_RZG2L dependency
      dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2N SoC

Langyan Ye (2):
      dt-bindings: display: panel: Add Tianma TL121BVMS07-00 panel
      drm/panel: ilitek-ili9882t: Add support for Ilitek IL79900A-based pan=
els

Leo Chen (1):
      drm/amd/display: dynamically clock gate before and after prefetch

Lewis Huang (1):
      drm/amd/display: Change clean dsc blocks condition in accelerated mod=
e

Lijo Lazar (19):
      drm/amdgpu: Remove redundant return value
      drm/amdgpu: Skip SDMA suspend during mode-2 reset
      drm/amdgpu: Reorganize sysfs ini/fini calls
      drm/amdgpu: Add amdgpu_discovery_info
      drm/amdgpu: Move reset-on-init sequence earlier
      drm/amd/pm: Grant interface access after full init
      drm/amdgpu: Reserve discovery TMR only if needed
      drm/amdgpu: Remove unused members in amdgpu_mman
      drm/amdgpu/pm: Add definition for gpu_metrics v1.9
      drm/amd/pm: Add helper functions for gpu metrics
      drm/amd/pm: Use gpu metrics 1.9 for SMUv13.0.6
      drm/amd/pm: Use gpu metrics 1.9 for SMUv13.0.12
      drm/amd/pm: Add schema v1.1 for parition metrics
      drm/amd/pm: Update SMUv13.0.6 partition metrics
      drm/amd/pm: Update SMUv13.0.12 partition metrics
      drm/amdgpu: Fix wait after reset sequence in S3
      drm/amdgpu: Check if AID is active before access
      drm/amdgpu: Avoid xgmi register access
      drm/amdgpu: Unregister mce notifier

Lizhi Hou (18):
      accel/amdxdna: Fix an integer overflow in aie2_query_ctx_status_array=
()
      accel/amdxdna: Call dma_buf_vmap_unlocked() for imported object
      accel/amdxdna: Enhance runtime power management
      accel/amdxdna: Resume power for creating and destroying hardware cont=
ext
      accel/amdxdna: Support getting last hardware error
      accel/amdxdna: Support firmware debug buffer
      accel/amdxdna: Fix incorrect return value in aie2_hwctx_sync_debug_bo=
()
      accel/amdxdna: Fix uninitialized return value
      accel/amdxdna: Fix incorrect command state for timed out job
      accel/amdxdna: Use MSG_OP_CHAIN_EXEC_NPU when supported
      accel/amdxdna: Add hardware specific attributes
      accel/amdxdna: Add IOCTL parameter for resource data
      accel/amdxdna: Add IOCTL parameter for telemetry data
      accel/amdxdna: Support preemption requests
      accel/amdxdna: Fix dma_fence leak when job is canceled
      accel/amdxdna: Treat power-off failure as unrecoverable error
      accel/amdxdna: Clear mailbox interrupt register during channel creati=
on
      accel/amdxdna: Fix deadlock between context destroy and job timeout

Louis Chauvet (12):
      drm/vkms: Add and remove VKMS instances via configfs
      drm/vkms: Allow to configure multiple planes via configfs
      drm/vkms: Allow to configure the plane type via configfs
      drm/vkms: Allow to configure multiple CRTCs via configfs
      drm/vkms: Allow to configure CRTC writeback support via configfs
      drm/vkms: Allow to attach planes and CRTCs via configfs
      drm/vkms: Allow to configure multiple encoders via configfs
      drm/vkms: Allow to attach encoders and CRTCs via configfs
      drm/vkms: Allow to configure multiple connectors via configfs
      drm/vkms: Allow to attach connectors and encoders via configfs
      drm/vkms: Pass plane_cfg to plane initialization
      drm/vkms: Add config for default plane pipeline

Louis-Alexis Eyraud (1):
      drm/mediatek: mtk_hdmi: Drop redundant clock retrieval in
mtk_hdmi_get_cec_dev

Lo=C3=AFc Molinari (1):
      drm/panthor: Improve IOMMU map/unmap debugging logs

Luc Ma (1):
      drm/sched: backend_ops doc fix

Luca Ceresoli (25):
      drm/display: bridge-connector: use scope-specific variable for
the bridge pointer
      drm/bridge: add drm_for_each_bridge_in_chain_scoped()
      drm/display: bridge-connector: use drm_for_each_bridge_in_chain_scope=
d()
      drm/atomic: use drm_for_each_bridge_in_chain_scoped()
      drm/bridge: use drm_for_each_bridge_in_chain_scoped()
      drm/bridge: remove drm_for_each_bridge_in_chain()
      drm/bridge: add drm_for_each_bridge_in_chain_from()
      drm/omap: use drm_for_each_bridge_in_chain_from()
      drm/bridge: get the bridge returned by drm_bridge_get_next_bridge()
      drm/bridge: put the bridge returned by drm_bridge_get_next_bridge()
      drm/imx: parallel-display: put the bridge returned by
drm_bridge_get_next_bridge()
      drm/bridge: add list of removed refcounted bridges
      drm/debugfs: show lingering bridges
      drm/bridge: adapt drm_bridge_add/remove() docs, mention the lingering=
 list
      drm/display: bridge_connector: get/put the stored bridges
      drm/bridge: refcount last_bridge in
drm_atomic_bridge_chain_select_bus_fmts()
      Revert "drm/display: bridge_connector: get/put the stored bridges"
      drm/display: bridge_connector: get/put the stored bridges
      drm/display: bridge_connector: get/put the panel_bridge
      drm/sti: hda: add bridge before attaching
      drm/sti: hdmi: add bridge before attaching
      drm/bridge: document that adding a bridge is mandatory before attach
      drm/bridge: add warning for bridges attached without being added
      drm/bridge: add warning for bridges using neither
devm_drm_bridge_alloc() nor drm_bridge_add()
      drm/bridge: synopsys: dw-dp: add bridge before attaching

Luca Coelho (2):
      drm/i915/dmc: explicitly sanitize num_entries from package_header
      drm/i915/wm: don't use method1 in Xe3p_LPD onwards

Luca Weiss (2):
      drm/sysfb: simpledrm: Sort headers correctly
      fbdev/simplefb: Sort headers correctly

Lucas De Marchi (25):
      drm/xe/psmi: Do not return NULL
      drm/xe/configfs: Fix engine class parsing
      drm/xe/configfs: Improve doc for ctx_restore* attributes
      drm/xe/device: Use poll_timeout_us() to wait for lmem
      drm/xe/guc_pc: Use poll_timeout_us() for waiting
      drm/xe/guc: Drop helper to read freq
      drm/xe/guc: Extract function to print load error
      drm/xe/guc: Refactor GuC load to use poll_timeout_us()
      drm/xe: Move rebar to be done earlier
      drm/xe: Add GT_VER() to check version specific to gt type
      drm/xe/irq: Rename fuse mask variables
      drm/xe/irq: Split irq mask per engine class
      drm/xe/irq: Rename bits used with all engines
      drm/xe/irq: Check fuse mask for media engines
      drm/xe/xe3p_xpc: Add support for compute walker for non-MSIx
      drm/xe/gt_throttle: Tidy up perf reasons reading
      drm/xe/gt_throttle: Always read and mask
      drm/xe/gt_throttle: Add throttle_to_gt()
      drm/xe/gt_throttle: Tidy up attribute definition
      drm/xe: Improve freq and throttle documentation
      drm/xe/gt_throttle: Drop individual show functions
      drm/xe: Inline gt_reset in the worker
      drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons
      drm/xe/vram: Move forcewake down to get_flat_ccs_offset()
      drm/xe/pcode: Rework error mapping

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in AMD DISPLAY CORE - DML

Lukasz Laguna (3):
      drm/xe/pf: Always expose VRAM provisioning data on discrete GPUs
      drm/xe/pf: Add helper to retrieve VF's LMEM object
      drm/xe/migrate: Add function to copy of VRAM data in chunks

Lyude Paul (5):
      drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem_shmem_create=
()
      drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_fre=
e()
      Partially revert "rust: drm: gem: Implement AlwaysRefCounted for
all gem objects automatically"
      rust: drm/gem: Remove Object.dev
      rust/drm/gem: Fix missing header in `Object` rustdoc

Maarten Lankhorst (5):
      drm/i915: Disable tracepoints for PREEMPT_RT
      drm/i915/display: Make intel_crtc_get_vblank_counter safe on PREEMPT_=
RT
      drm/xe: Extract xe_bo_is_visible_vram
      drm/xe/display: Make panic support work on vram.
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Maciej Falkowski (2):
      accel/ivpu: Add support for Nova Lake's NPU
      accel/ivpu: Remove skip of dma unmap for imported buffers

Madhur Kumar (1):
      drm/i915: i915_pmu: Use sysfs_emit() instead of sprintf()

Mainak Sen (1):
      gpu: host1x: Fix race in syncpt alloc/free

Mallesh Koujalagi (1):
      drm/xe/xe_late_bind_fw: Initialize uval variable in
xe_late_bind_fw_num_fans()

Manikandan Muralidharan (1):
      drm: atmel-hlcdc: update the LCDC_ATTRE register in plane atomic_disa=
ble

Marco Crivellari (3):
      accel/ivpu: replace use of system_unbound_wq with system_dfl_wq
      accel/ivpu: replace use of system_wq with system_percpu_wq
      drm/sched: Replace use of system_wq with system_percpu_wq

Marcus Folkesson (2):
      drm/sitronix/st7571-i2c: reset position before clearing display
      drm/sitronix/st7571-i2c: remove unneeded semicolon

Marek Vasut (27):
      drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR()
parameters lowercase
      dt-bindings: ili9881c: Document 5" Raspberry Pi 720x1280
      drm/panel: ilitek-ili9881c: Add configuration for 5" Raspberry Pi 720=
x1280
      dt-bindings: ili9881c: Allow port subnode
      drm/imx: dc: Sort bits and bitfields in descending order
      dt-bindings: gpu: img,powervr-rogue: Drop useless power domains items
      dt-bindings: gpu: img,powervr-rogue: Rework the allOf section
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subno=
de
      dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in
Renesas R-Car M3-W/M3-W+
      drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
      drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
      drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
      drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
      drm/rcar-du: dsi: Clean up VCLKSET register macros
      drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
      drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
      drm/rcar-du: dsi: Respect DSI mode flags
      drm/rcar-du: dsi: Clean up handling of DRM mode flags
      drm/rcar-du: dsi: Convert register bits to BIT() macro
      drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
      dt-bindings: display: bridge: renesas,dsi-csi2-tx: Align panel
example with ili9881c binding
      dt-bindings: gpu: img,powervr-rogue: Drop duplicate newline
      dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
      arm64: dts: imx95: Describe Mali G310 GPU
      drm/etnaviv: add HWDB entry for GC8000 Nano Ultra VIP r6205
      dt-bindings: gpu: img,powervr-rogue: Keep lists sorted alphabetically
      dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in
Renesas R-Car M3-N

Mario Limonciello (19):
      drm/amd: Adjust whitespace for vangogh_ppt
      drm/amd: Remove some unncessary header includes
      drm/amd: Unify shutdown() callback behavior
      drm/amd: Stop exporting amdgpu_device_ip_suspend() outside amdgpu_dev=
ice
      drm/amd: Remove comment about handling errors in
amdgpu_device_ip_suspend_phase1()
      drm/amd: Don't always set IP block HW status to false
      drm/amd: Pass IP suspend errors up to callers
      drm/amd: Fix error handling with multiple userq IDRs
      drm/amd: Pass userq suspend failures up to caller
      drm/amd: Stop overloading power limit with limit type
      drm/amd: Remove second call to set_power_limit()
      drm/amd: Save and restore all limit types
      drm/amd: Drop calls to restore power limit and clock from smu_resume(=
)
      drm/amd: Add a helper to tell whether an IP block HW is enabled
      drm/amd: Check that VPE has reached DPM0 in idle handler
      drm/amd: Re-introduce property to control adaptive backlight modulati=
on
      drm/amd/display: Bump minimum for frame_warn_limit
      drm/amd: Fix suspend failure with secure display TA
      drm/amd: Skip power ungate during suspend for VPE

Mario Limonciello (AMD) (10):
      drm/amd: Add an unwind for failures in amdgpu_device_ip_suspend_phase=
1()
      drm/amd: Add an unwind for failures in amdgpu_device_ip_suspend_phase=
2()
      drm/amd: Unwind for failed device suspend
      drm/amd/display: Don't stretch non-native images by default in eDP
      drm/amd: Clarify that amdgpu.audio only works for non-DC
      drm/amd/display: Move sleep into each retry for retrieve_link_cap()
      drm/amd/display: Increase DPCD read retries
      drm/amd/display: Don't change brightness for disabled connectors
      drm/amd/display: Increase EDID read retries
      Revert "drm/amd: Skip power ungate during suspend for VPE"

Marlon Henrique Sanches (1):
      drm/i915/gem: fix typo in comment (I915_EXEC_NO_RELOC)

Mary Guillemard (2):
      drm/nouveau/uvmm: Prepare for larger pages
      drm/nouveau/uvmm: Allow larger pages

Matt Atwood (3):
      drm/i915/display: Use DISPLAY_VER over GRAPHICS_VER
      drm/i915: move and rename reg_in_range_table
      drm/i915/xe3p_lpd: Update bandwidth parameters

Matt Roper (39):
      drm/xe/kunit: Fix kerneldoc for parameterized tests
      drm/xe/huc: Adjust HuC check on primary GT
      drm/xe: Drop GT parameter to xe_display_irq_postinstall()
      drm/xe: Move 'va_bits' flag back to platform descriptor
      drm/xe: Move 'vm_max_level' flag back to platform descriptor
      drm/xe: Move 'vram_flags' flag back to platform descriptor
      drm/xe: Move 'has_flatccs' flag back to platform descriptor
      drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT
      drm/xe: Move primary GT allocation from xe_tile_init_early to xe_tile=
_init
      drm/xe: Skip L2 / TDF cache flushes if primary GT is disabled
      drm/xe/query: Report hwconfig size as 0 if primary GT is disabled
      drm/xe/pmu: Initialize PMU event types based on first available GT
      drm/xe: Check for primary GT before looking up Wa_22019338487
      drm/xe: Make display part of Wa_22019338487 a device workaround
      drm/xe/irq: Don't try to lookup engine masks for non-existent primary=
 GT
      drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workaround=
s
      drm/xe/rtp: Pass xe_device parameter to FUNC matches
      drm/xe: Bypass Wa_14018094691 when primary GT is disabled
      drm/xe: Correct lineage for Wa_22014953428 and only check with valid =
GT
      drm/xe: Check that GT is not NULL before testing Wa_16023588340
      drm/xe: Don't check BIOS-disabled FlatCCS if primary GT is disabled
      drm/xe: Break GT setup out of xe_info_init()
      drm/xe/configfs: Add attribute to disable GT types
      drm/xe/sriov: Disable SR-IOV if primary GT is disabled via configfs
      drm/xe/xe3p_lpm: Handle MCR steering
      drm/xe/xe3p: Stop programming RCU_MODE's fixed slice mode setting
      drm/xe/xe3p: Determine service copy availability from fuse
      drm/xe/nvl: Define NVL-S platform
      drm/xe/xe3p_xpc: Add MCR steering
      drm/xe/xe3p_xpc: Skip compression tuning on platforms without flatccs
      drm/xe/xe3p_xpc: Setup PAT table
      drm/xe/cri: Setup MOCS table
      drm/xe/xe3p_xpc: Treat all PSMI MCR ranges as "INSTANCE0"
      drm/xe/xe3p_xpc: Add MCR steering for NODE and L3BANK ranges
      drm/xe/configfs: Drop MAX_GT_TYPE_CHARS constant
      drm/i915/xe3p_lpd: Drop north display reset option programming
      drm/xe/forcewake: Improve kerneldoc
      drm/xe/eustall: Store forcewake reference in stream structure
      drm/xe/oa: Store forcewake reference in stream structure

Matthew Auld (10):
      drm/xe/uapi: loosen used tracking restriction
      drm/xe/migrate: don't misalign current bytes
      drm/xe/evict: drop bogus assert
      drm/xe/migrate: fix offset and len check
      drm/xe/migrate: rework size restrictions for sram pte emit
      drm/xe/migrate: fix chunk handling for 2M page emit
      drm/xe/migrate: fix batch buffer sizing
      drm/xe/migrate: trim batch buffer sizing
      drm/xe/migrate: support MEM_COPY instruction
      drm/xe/migrate: skip bounce buffer path on xe2

Matthew Brost (57):
      Revert "drm/xe/vf: Rebase exec queue parallel commands during
migration recovery"
      Revert "drm/xe/vf: Post migration, repopulate ring area for
pending request"
      Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"
      drm/xe: Add NULL checks to scratch LRC allocation
      drm/xe: Save off position in ring in which a job was programmed
      drm/xe/guc: Track pending-enable source in submission state
      drm/xe: Track LR jobs in DRM scheduler pending list
      drm/xe: Return first unsignaled job first pending job helper
      drm/xe: Don't change LRC ring head on job resubmission
      drm/xe: Make LRC W/A scratch buffer usage consistent
      drm/xe/vf: Add xe_gt_recovery_pending helper
      drm/xe/vf: Make VF recovery run on per-GT worker
      drm/xe/vf: Abort H2G sends during VF post-migration recovery
      drm/xe/vf: Remove memory allocations from VF post migration recovery
      drm/xe: Move GGTT lock init to alloc
      drm/xe/vf: Move LMEM config to tile layer
      drm/xe/vf: Close multi-GT GGTT shift race
      drm/xe/vf: Teardown VF post migration worker on driver unload
      drm/xe/vf: Don't allow GT reset to be queued during VF post
migration recovery
      drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
      drm/xe/vf: Avoid indefinite blocking in preempt rebind worker
for VFs supporting migration
      drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
      drm/xe/vf: Flush and stop CTs in VF post migration recovery
      drm/xe/vf: Reset TLB invalidations during VF post migration recovery
      drm/xe/vf: Kickstart after resfix in VF post migration recovery
      drm/xe: Add CTB_H2G_BUFFER_OFFSET define
      drm/xe/vf: Start CTs before resfix VF post migration recovery
      drm/xe/vf: Abort VF post migration recovery on failure
      drm/xe/vf: Replay GuC submission state on pause / unpause
      drm/xe: Move queue init before LRC creation
      drm/xe/vf: Add debug prints for GuC replaying state during VF recover=
y
      drm/xe/vf: Workaround for race condition in GuC firmware during VF pa=
use
      drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
      drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
      drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
      drm/xe: Don't allow evicting of BOs in same VM in array of VM binds
      drm/xe: Handle mixed mappings and existing VRAM on atomic faults
      drm/xe: Fix build_pt_update_batch_sram for non-4K PAGE_SIZE
      drm/xe: Enable 2M pages in xe_migrate_vram
      drm/gpusvm, drm/xe: Allow mixed mappings for userptr
      drm/xe: Check return value of GGTT workqueue allocation
      drm/xe: Do not wake device during a GT reset
      drm/xe: Avoid PM wake reference during VF migration
      drm/xe: Use SVM range helpers in PT layer
      drm/xe: Enforce correct user fence signaling order using
      drm/xe: Attach last fence to TLB invalidation job queues
      drm/xe: Decouple bind queue last fence from TLB invalidations
      drm/xe: Skip TLB invalidation waits in page fault binds
      drm/xe: Disallow input fences on zero batch execs and zero binds
      drm/xe: Remove last fence dependency check from binds and execs
      drm/xe: Stub out new pagefault layer
      drm/xe: Implement xe_pagefault_init
      drm/xe: Implement xe_pagefault_reset
      drm/xe: Implement xe_pagefault_handler
      drm/xe: Implement xe_pagefault_queue_work
      drm/xe: Add xe_guc_pagefault layer
      drm/xe: Remove unused GT page fault code

Matthew Schwartz (1):
      drm/amd/display: Don't program BLNDGAM_MEM_PWR_FORCE when CM
low-power is disabled on DCN30

Maud Spierings (2):
      dt-bindings: display: bridge: simple: document the Parade
PS185HDM DP-to-HDMI bridge
      drm/bridge: simple: add the Parade PS185HDM DP-to-HDMI bridge

Maxime Ripard (53):
      drm/crtc: Drop no_vblank bit field
      drm/tidss: Convert to drm logging
      drm/tidss: Remove ftrace-like logs
      drm/tidss: crtc: Change variable name
      drm/tidss: crtc: Implement destroy_state
      drm/tidss: crtc: Cleanup reset implementation
      drm/atomic: Convert drm_atomic_get_connector_state() to use new
connector state
      drm/atomic: Remove unused drm_atomic_get_existing_connector_state()
      drm/atomic: Document __drm_connectors_state state pointer
      drm/atomic: Convert __drm_atomic_get_current_plane_state() to
modern accessor
      drm/atomic: Convert drm_atomic_get_plane_state() to use new plane sta=
te
      drm/vkms: Convert vkms_crtc_atomic_check() to use new plane state
      drm/tilcdc: crtc: Use drm_atomic_helper_check_crtc_primary_plane()
      drm/atomic: Remove unused drm_atomic_get_existing_plane_state()
      drm/atomic: Document __drm_planes_state state pointer
      drm/atomic: Convert drm_atomic_get_crtc_state() to use new connector =
state
      drm/ingenic: ipu: Switch to drm_atomic_get_new_crtc_state()
      drm/arm/malidp: Switch to drm_atomic_get_new_crtc_state()
      drm/armada: Drop always true condition in atomic_check
      drm/armada: Switch to drm_atomic_get_new_crtc_state()
      drm/atmel-hlcdc: Switch to drm_atomic_get_new_crtc_state()
      drm/exynos: Switch to drm_atomic_get_new_crtc_state()
      drm/imx-dc: Switch to drm_atomic_get_new_crtc_state()
      drm/imx-dcss: Switch to drm_atomic_get_new_crtc_state()
      drm/imx-ipuv3: Switch to drm_atomic_get_new_crtc_state()
      drm/ingenic: Switch to drm_atomic_get_new_crtc_state()
      drm/kmb: Switch to drm_atomic_get_new_crtc_state()
      drm/logicvc: Switch to drm_atomic_get_new_crtc_state()
      drm/loongson: Switch to drm_atomic_get_new_crtc_state()
      drm/mediatek: Switch to drm_atomic_get_new_crtc_state()
      drm/msm/mdp5: Switch to drm_atomic_get_new_crtc_state()
      drm/omap: Switch to drm_atomic_get_new_crtc_state()
      drm/rockchip: Switch to drm_atomic_get_new_crtc_state()
      drm/sun4i: Switch to drm_atomic_get_new_crtc_state()
      drm/tegra: Switch to drm_atomic_get_new_crtc_state()
      drm/tilcdc: Switch to drm_atomic_get_new_crtc_state()
      drm/vboxvideo: Switch to drm_atomic_get_new_crtc_state()
      drm/vc4: Switch to drm_atomic_get_new_crtc_state()
      drm/atomic: Switch to drm_atomic_get_new_crtc_state()
      drm/framebuffer: Switch to drm_atomic_get_new_crtc_state()
      drm/atomic: Remove unused drm_atomic_get_existing_crtc_state()
      drm/atomic: Document __drm_crtcs_state state pointer
      drm/ingenic: crtc: Switch to ingenic_drm_get_new_priv_state()
      drm/atomic: Convert drm_atomic_get_private_obj_state() to use
new plane state
      drm/atomic: Document __drm_private_objs_state state pointer
      Documentation: dma-buf: heaps: Add naming guidelines
      drm/atomic: Change state pointers to a more meaningful name
      MAINTAINERS: Remove myself for sun4i DRM driver
      doc: dma-buf: List the heaps by name
      dma-buf: heaps: cma: Register list of CMA regions at boot
      dma: contiguous: Register reusable CMA regions at boot
      dma: contiguous: Reserve default CMA heap
      dma-buf: heaps: cma: Create CMA heap for each CMA reserved region

Meenakshikumar Somasundaram (5):
      drm/amd/display: Fix NULL pointer dereference
      drm/amd/display: Check disable_fec flag before enabling fec.
      drm/amd/display: write segment pointer with mot enabled for mst
      drm/amd/display: update link encoder assignment
      drm/amd/display: Add dc interface to log pre os firmware information

Mehdi Ben Hadj Khelifa (1):
      drm/gud: Use kmalloc_array() instead of kmalloc()

Miaoqian Lin (1):
      drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()

Michael Chen (1):
      drm/amd/amdgpu: reserve vm invalidation engine for uni_mes

Michal Wajdeczko (61):
      drm/xe/debugfs: Make ggtt file per-tile
      drm/xe/debugfs: Improve .show() helper for GT-based attributes
      drm/xe/tests: Fix build break on clang 16.0.6
      drm/xe/vf: Rename sriov_update_device_info
      drm/xe/vf: Don't claim support for firmware late-bind if VF
      drm/xe/pf: Promote PF debugfs function to its own file
      drm/xe/pf: Create separate debugfs tree for SR-IOV files
      drm/xe/pf: Populate SR-IOV debugfs tree with tiles
      drm/xe/pf: Move SR-IOV GT debugfs files to new tree
      drm/xe/debugfs: Promote xe_tile_debugfs_simple_show
      drm/xe/pf: Make GGTT/LMEM debugfs files per-tile
      drm/xe/debugfs: Update xe_gt_topology_dump signature
      drm/xe/debugfs: Update xe_wa_dump signature
      drm/xe/debugfs: Update xe_tuning_dump signature
      drm/xe/debugfs: Update xe_mocs_dump signature
      drm/xe/debugfs: Update xe_pat_dump signature
      drm/xe: Detect GT workqueue allocation failure
      drm/xe/pf: Add top level functions to control VFs
      drm/xe/pf: Log only top level VF state changes
      drm/xe/pf: Expose VF control operations over debugfs
      drm/xe/pf: Unify VF state tracking log
      drm/xe/pf: Split VF FLR processing function
      drm/xe/pf: Synchronize VF FLR between all GTs
      drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
      drm/xe/xe_late_bind_fw: Fix and simplify parsing user input
      drm/xe/pf: Make the late-initialization really late
      drm/xe: Update SRIOV printk macros
      drm/xe: Add tile-based SRIOV printk macros
      drm/xe/pf: Update LMTT to use tile-based messages
      drm/xe: Update MEMIRQ to use tile-based printk macros
      drm/xe/guc: Ratelimit diagnostic messages from the relay
      drm/xe/pf: Improve reading VF config blob from debugfs
      drm/xe/pf: Add max_vfs configfs attribute to control PF mode
      drm/xe/pf: Promote VFs provisioning helpers
      drm/xe/pf: Automatically provision VFs only in auto-mode
      drm/xe/pf: Disable auto-provisioning if changed using debugfs
      drm/xe/pf: Allow to restore auto-provisioning mode
      drm/xe/pf: Fix VF FLR synchronization between all GTs
      drm/xe/pf: Access VF's register using dedicated MMIO view
      drm/xe/pf: Prepare sysfs for SR-IOV admin attributes
      drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
      drm/xe/pf: Add _locked variants of the VF EQ config functions
      drm/xe/pf: Add _locked variants of the VF PT config functions
      drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
      drm/xe/pf: Relax report helper to accept PF in bulk configs
      drm/xe/pf: Fix signature of internal config helpers
      drm/xe/pf: Add functions to bulk configure EQ/PT on GT
      drm/xe/pf: Add functions to bulk provision EQ/PT
      drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
      drm/xe/pf: Add functions to provision scheduling priority
      drm/xe/pf: Allow bulk change all VFs priority using sysfs
      drm/xe/pf: Allow change PF scheduling priority using sysfs
      drm/xe/pf: Promote xe_pci_sriov_get_vf_pdev
      drm/xe/pf: Add sysfs device symlinks to enabled VFs
      drm/xe/pf: Allow to stop the VF using sysfs
      drm/xe/pf: Add documentation for sriov_admin attributes
      drm/xe/pf: Use migration-friendly context IDs auto-provisioning
      drm/xe/pf: Use migration-friendly doorbells auto-provisioning
      drm/xe/tests: Add KUnit tests for PF fair provisioning
      drm/xe/pf: Allow to lockdown the PF using custom guard
      drm/xe/pf: Use migration-friendly GGTT auto-provisioning

Micha=C5=82 Grzelak (2):
      drm/i915: rename vlv_get_cck_clock() to vlv_clock_get_cck()
      drm/i915/display: Add no_psr_reason to PSR debugfs

Micha=C5=82 Winiarski (26):
      drm/xe/vf: Enable VF resource fixup unconditionally
      drm/xe/pf: Remove GuC version check for migration support
      drm/xe: Move migration support to device-level struct
      drm/xe/pf: Convert control state to bitmap
      drm/xe/pf: Add save/restore control state stubs and connect to debugf=
s
      drm/xe/pf: Add data structures and handlers for migration rings
      drm/xe/pf: Add helpers for migration data packet allocation / free
      drm/xe/pf: Add support for encap/decap of bitstream to/from packet
      drm/xe/pf: Add minimalistic migration descriptor
      drm/xe/pf: Expose VF migration data size over debugfs
      drm/xe: Add sa/guc_buf_cache sync interface
      drm/xe: Allow the caller to pass guc_buf_cache size
      drm/xe/pf: Increase PF GuC Buffer Cache size and use it for VF migrat=
ion
      drm/xe/pf: Remove GuC migration data save/restore from GT debugfs
      drm/xe/pf: Don't save GuC VF migration data on pause
      drm/xe/pf: Switch VF migration GuC save/restore to struct migration d=
ata
      drm/xe/pf: Handle GuC migration data as part of PF control
      drm/xe/pf: Add helpers for VF GGTT migration data handling
      drm/xe/pf: Handle GGTT migration data as part of PF control
      drm/xe/pf: Handle MMIO migration data as part of PF control
      drm/xe/pf: Handle VRAM migration data as part of PF control
      drm/xe/pf: Add wait helper for VF FLR
      drm/intel/bmg: Allow device ID usage with single-argument macros
      drm/xe/pf: Fix kernel-doc warning in migration_save_consume
      drm/xe/pf: Drop the VF VRAM BO reference on successful restore
      drm/xe/pf: Check for fence error on VRAM save/restore

Miguel Ojeda (1):
      rust: slice: fix broken intra-doc links

Mikko Perttunen (2):
      gpu: host1x: Wait prefences outside MLOCK
      gpu: host1x: Syncpoint interrupt performance optimization

Mohamed Ahmed (1):
      drm/nouveau/drm: Bump the driver version to 1.4.1 to report new featu=
res

Mohammed Thasleem (1):
      drm/xe/xe_debugfs: Expose G7 package state residency counter
through debugfs

Mohit Bawa (1):
      drm/amd/display: refactor DSC cap calculation for dcn35

Naladala Ramanaidu (1):
      drm/i915: Add fallback for CDCLK selection when min_cdclk is too high

Natalie Vock (1):
      drm/amdgpu: Forward VMID reservation errors

Nemesa Garg (11):
      drm/i915: Soft defeature of cursor size reduction
      drm/drm_crtc: Introduce sharpness strength property
      drm/i915/display: Introduce HAS_CASF for sharpness support
      drm/i915/display: Add CASF strength and winsize
      drm/i915/display: Add filter lut values
      drm/i915/display: Compute the scaler coefficients
      drm/i915/display: Add and compute scaler parameter
      drm/i915/display: Configure the second scaler
      drm/i915/display: Set and get the casf config
      drm/i915/display: Enable/disable casf
      drm/i915/display: Expose sharpness strength property

Nicholas Carbones (2):
      drm/amd/display: Set DCN32 to use update planes and stream version 3
      drm/amd/display: Add pipe topology history to dc

Nicholas Kazlauskas (7):
      drm/amd/display: Support possibly NULL link for should_use_dmub_lock
      drm/amd/display: Rename should_use_dmub_lock to reflect inbox1 usage
      drm/amd/display: Rename FAMS2 global control lock to DMUB HW control =
lock
      drm/amd/display: Driver implementation for cursor offloading to DMU
      drm/amd/display: Fix wrong index for DCN401 cursor offload
      drm/amd/display: Fix notification of vtotal to DMU for cursor offload
      drm/amd/display: Add cursor offload abort to the new HWSS path

Nicolas Frattaroli (3):
      dt-bindings: gpu: mali-valhall-csf: add mediatek,mt8196-mali variant
      drm/panthor: call into devfreq for current frequency
      drm/panthor: Use existing OPP table if present

Niranjana Vishwanathapura (1):
      drm/xe/doc: Add documentation for Execution Queues

Nishanth Menon (5):
      dt-bindings: display: bridge: it66121: Add compatible string for IT66=
122
      drm/bridge: it66121: Drop ftrace like dev_dbg() prints
      drm/bridge: it66121: Sort the compatibles
      drm/bridge: it66121: Use vid/pid to detect the type of chip
      drm/bridge: it66121: Add minimal it66122 support

Nitin Gote (2):
      drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
      drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg

Ovidiu Bunea (1):
      drm/amd/display: Move all DCCG RCG into HWSS root_clock_control

Paul Hsieh (1):
      drm/amd/display: Re-check seamless boot can be enabled or not

Peichen Huang (2):
      drm/amd/display: lttpr cap should be nrd cap in bw_alloc mode
      drm/amd/display: not skip hpd irq for bw alloc mode

Perry Yuan (1):
      drm/amdgpu: get rev_id from strap register or IP-discovery table

Philip Yang (3):
      drm/amdkfd: Dequeue user queues when process mm released
      drm/amdkfd: Don't clear PT after process killed
      Revert "drm/amdkfd: Improve signal event slow path"

Philipp Stanner (4):
      drm/sched/tests: Remove relict of done_list
      MAINTAINERS: Maintain spsc_queue through drm_sched
      drm/sched: Fix comment in drm_sched_run_job_work()
      drm/sched: Add warning for removing hack in drm_sched_fini()

Pierre-Eric Pelloux-Prayer (9):
      drm/amdgpu: make non-NULL out fence mandatory
      drm/amdgpu: remove gart_window_lock usage from gmc v12
      drm/amdgpu: lock bo before calling amdgpu_vm_bo_update_shared
      drm/amdgpu: jump to the correct label on failure
      drm/ttm: rework pipelined eviction fence handling
      drm/amdgpu: use ttm_resource_manager_cleanup
      drm/amdgpu: clear job on failure in amdgpu_job_alloc(_with_ib)
      drm/amdgpu: free job fences on failure in amdgpu_job_alloc_with_ib
      drm/amdgpu: add missing lock to amdgpu_ttm_access_memory_sdma

Piotr Pi=C3=B3rkowski (6):
      drm/xe: Add initial support for separate kernel VRAM region on the ti=
le
      drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM
      drm/xe: Force user context allocations in user VRAM
      drm/xe/pf: Force use user VRAM for LMEM provisioning
      drm/xe: Combine userspace context check
      drm/xe/pf: Add runtime registers for GFX ver >=3D 35

Pranjal Ramajor Asha Kanojiya (3):
      accel/qaic: Add support to export dmabuf fd
      accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
      accel/qaic: Collect crashdump from SSR channel

Priit Laes (1):
      drm/panel: nv3052c: Reduce duplication of init sequences

Prike Liang (7):
      drm/amdgpu/userq: extend userq state
      drm/amdgpu: add userq object va track helpers
      drm/amdgpu: track the userq bo va for its obj management
      drm/amdgpu: keeping waiting userq fence infinitely
      drm/amdgpu: validate the queue va for resuming the queue
      drm/amdgpu: validate userq va for GEM unmap
      drm/amdgpu: attach tlb fence to the PTs update

Raag Jadav (5):
      drm/xe/hwmon: Drop redundant runtime PM usage
      drm/xe/sysfs: Drop redundant runtime PM usage
      drm/xe/i2c: Don't rely on d3cold.allowed flag in system PM path
      drm/xe/i2c: Introduce xe_i2c_irq_present()
      drm/xe/i2c: Wire up reset/postinstall for I2C IRQ

Rahul Kumar (1):
      drm/komeda: Convert logging in komeda_crtc.c to drm_* with
drm_device parameter

Rain Yang (3):
      dt-bindings: gpu: mali-valhall: make mali-supply optional
      drm/panthor: skip regulator setup if no such prop
      drm/panthor: attach the driver's multiple power domains

Randy Dunlap (3):
      drm/panfrost: fix UAPI kernel-doc warnings
      drm/msm/disp: fix kernel-doc warnings
      drm/amd/display: dc_hw_sequencer.c: remove kernel-doc comments

Raphael Gallais-Pou (4):
      drm/sti: check dma_set_coherent_mask return value
      drm/sti: make use of drm_of_component_probe
      ARM: dts: sti: extract display subsystem out of soc
      ARM: dts: sti: remove useless cells fields

Ravi Kumar Vodapalli (1):
      drm/i915/xe3p_lpd: Adapt to updates on MBUS_CTL/DBUF_CTL registers

Relja Vojvodic (2):
      drm/amd/display: Correct slice width calculation for YCbCr420
      drm/amd/display: Rework HDMI data channel reads

Rob Clark (3):
      Merge remote-tracking branch 'drm/drm-next' into msm-next-robclark
      MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
      drm/msm/registers: Fix encoding fields in 64b registers

Rob Herring (Arm) (2):
      dt-bindings: npu: Add Arm Ethos-U65/U85
      accel: Add Arm Ethos-U NPU driver

Robert McClinton (1):
      drm/radeon: delete radeon_fence_process in is_signaled, no deadlock

Rodrigo Siqueira (2):
      drm/amdgpu: Fix GFX hang on SteamDeck when amdgpu is reloaded
      Revert "drm/amd: fix gfx hang on renoir in IGT reload test"

Rodrigo Vivi (1):
      drm/xe: Fix MTL vm_max_level

Rong Zhang (1):
      drm/amd/display: Fix NULL deref in debugfs odm_combine_segments

Ruben Wauters (4):
      drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
      drm/gud: fix accidentally deleted IS_ERR() check
      MAINTAINERS: add myself as maintainer for GUD
      drm/gud: rearrange gud_probe() to prepare for function splitting

Sai Teja Pottumuttu (5):
      drm/i915/xe3p_lpd: Extend FBC support to UINT16 formats
      drm/i915/xe3p_lpd: Add Xe3p_LPD display IP features
      drm/i915/xe3p_lpd: Expand bifield masks dbuf blocks fields
      drm/i915/xe3p_lpd: Horizontal flip support for linear surfaces
      drm/i915/xe3p_lpd: Remove gamma,csc bottom color checks

Sakari Ailus (3):
      drm/amd: Remove redundant pm_runtime_mark_last_busy() calls
      drm/radeon: Remove redundant pm_runtime_mark_last_busy() calls
      accel/ivpu: Remove redundant pm_runtime_mark_last_busy() calls

Samson Tam (1):
      drm/amd/display: Add debug option to override EASF scaler taps

Samuel Zhang (1):
      drm/amdgpu: fix gpu page fault after hibernation on PF passthrough

Sanjay Yadav (3):
      drm/xe/uapi: Add documentation for DRM_XE_GEM_CREATE_FLAG_SCANOUT
      drm/xe: Fix spelling and typos across Xe driver files
      drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()

Sathishkumar S (1):
      drm/amdgpu/jpeg: Add parse_cs for JPEG5_0_1

Satyanarayana K V P (2):
      drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
      drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC

Shekhar Chauhan (2):
      drm/xe/xe3: Add support for graphics IP versions 30.04 & 30.05
      drm/xe/xe3p: Add support for media IP versions 35.00 & 35.03

Shengjiu Wang (5):
      dt-bindings: display: imx: add HDMI PAI for i.MX8MP
      ALSA: Add definitions for the bits in IEC958 subframe
      drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
      drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958 f=
ormat
      drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface

Shikang Fan (1):
      drm/amdgpu: Add sriov vf check for VCN per queue reset support.

Shuicheng Lin (9):
      drm/xe/hw_engine_group: Fix double write lock release in error path
      drm/xe: Fix copyright and function naming in xe_ttm_vram_mgr
      drm/xe: Fix copyright and function naming in xe_ttm_sys_mgr
      drm/xe: Fix copyright in xe_ttm_stolen_mgr
      drm/xe: Change return type of detect_bar2_dgfx() from s64 to u64
      drm/xe/guc: Check GuC running state before deregistering exec queue
      drm/xe: Fix comments in xe_gt struct
      drm/xe: Fix stolen size check to allow equal WOPCM size
      drm/xe: Limit number of jobs per exec queue

Simona Vetter (7):
      Merge tag 'drm-misc-next-2025-10-02' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-misc-next-2025-10-21' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.19-2025-10-24' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-xe-next-2025-10-28' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-2025-10-28' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-gt-next-2025-10-29' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'amd-drm-next-6.19-2025-10-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Sjoerd Simons (1):
      drm/mediatek: mtk_hdmi_common: Defer probe when ddc i2c bus
isn't available yet

Sk Anirban (3):
      drm/xe/cri: Add new performance limit reasons bits
      drm/xe/guc: Eliminate RPe caching for SLPC parameter handling
      drm/xe/guc: Eliminate RPa frequency caching

Sourab Bera (1):
      accel/qaic: Fix typos in the documentation for qaic

Srinivasan Shanmugam (9):
      drm/amdgpu: Make SR-IOV critical region checks overflow-safe
      drm/amdgpu: Fix pointer casts when reading dynamic region sizes
      drm/amdkfd: Fix use-after-free of HMM range in
svm_range_validate_and_map()
      drm/amd/display: Fix annotations for connector poll/detect parameters
      drm/amd/display: Add kdoc params/returns in dc/link detection helpers
      drm/amdgpu/ttm: Fix crash when handling MMIO_REMAP in PDE flags
      drm/amd/display: Fix dereference-before-check for dc_link
      drm/amdgpu: Fix CPER ring debugfs read buffer overflow risk
      drm/amdgpu/sdma6: Update SDMA 6.0.3 FW version to include UMQ
protected-fence fix

Steffen Trumtrar (3):
      dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
      dt-bindings: display: simple: Add JuTouch JT101TM023 panel
      drm/panel: simple: add JuTouch JT101TM023

Stephen Rothwell (1):
      drm/panel: synaptics-tddi: fix build error by missing
regulator/consumer.h include

Steven Price (2):
      drm/panfrost: Bump the minor version number
      drm/gem: Correct error condition in drm_gem_objects_lookup

Sultan Alsawaf (1):
      drm/amd/amdgpu: Ensure isp_kernel_buffer_alloc() creates a new BO

Sunday Clement (2):
      drm/amdkfd: Fix Unchecked Return Value
      drm/amdkfd: Fix Unchecked Return Values

Sunil Khatri (11):
      drm/amdgpu: use user provided hmm_range buffer in
amdgpu_ttm_tt_get_user_pages
      drm/amdgpu: clean up amdgpu hmm range functions
      drm/amdgpu: update the functions to use amdgpu version of hmm
      drm/amdgpu/userqueue: validate userptrs for userqueues
      drm/amdgpu: add the kernel docs for alloc/free/valid range
      drm/amdgpu: null check for hmm_pfns ptr before freeing it
      drm/amdkfd: add missing return value check for range
      drm/amdkfd: fix the clean up when amdgpu_hmm_range_alloc fails
      drm/amdkfd: clean up the code to free hmm_range
      drm/amdgpu: caller should make sure not to double free
      drm/amdgpu: validate the bo from done list for NULL

Suraj Kandpal (28):
      drm/i915/ddi: Guard reg_val against a INVALID_TRANSCODER
      drm/i915/ltphy: Add LT Phy related VDR and Pipe Registers
      drm/i915/cx0: Change register bit naming for powerdown values
      drm/i915/ltphy: Phy lane reset for LT Phy
      drm/i915/cx0: Move the HDMI FRL function to intel_hdmi
      drm/i915/ltphy: Program sequence for PORT_CLOCK_CTL for LT Phy
      drm/i915/ltphy: Add a wrapper for LT Phy powerdown change sequence
      drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
      drm/i915/ltphy: Add LT Phy Programming recipe tables
      drm/i915/ltphy: Program the VDR PLL registers for LT PHY
      drm/i915/ltphy: Update the ltpll config table value for eDP
      drm/i915/ltphy: Enable SSC during port clock programming
      drm/i915/ltphy: Add function to calculate LT PHY port clock
      drm/i915/ltphy: Program the P2P Transaction flow for LT Phy
      drm/i915/ltphy: Program the rest of the PORT_CLOCK_CTL steps
      drm/i915/ltphy: Program the rest of the LT Phy Enable sequence
      drm/i915/ltphy: Program LT Phy Non-TBT PLL disable sequence
      drm/i915/ltphy: Hook up LT Phy Enable & Disable sequences
      drm/i915/ddi: Define LT Phy Swing tables
      drm/i915/ltphy: Program LT Phy Voltage Swing
      drm/i915/ltphy: Enable/Disable Tx after Non TBT Enable sequence
      drm/i915/ltphy: Define the LT Phy state compare function
      drm/i915/ltphy: Define function to readout LT Phy PLL state
      drm/i915/ltphy: Define LT PHY PLL state verify function
      drm/i915/display: Aux Enable and Display powerwell timeouts
      drm/i915/ltphy: Modify the step that need to be skipped
      drm/i915/ltphy: Implement HDMI Algo for Pll state
      drm/i915/ltphy: Return lowest portclock for HDMI from reverse algorit=
hm

Svyatoslav Ryhel (9):
      dt-bindings: display: panel: document Sharp LQ079L1SX01 panel
      gpu/drm: panel: Add Sharp LQ079L1SX01 panel support
      gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
      drm/tegra: dsi: Make SOL delay calculation mode independent
      drm/tegra: dsi: Calculate packet parameters for video mode
      dt-bindings: display: panel: properly document LG LD070WX3 panel
      gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
      dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
      gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel suppo=
rt

Taimur Hassan (15):
      drm/amd/display: [FW Promotion] Release 0.1.29.0
      drm/amd/display: Promote DC to 3.2.352
      drm/amd/display: [FW Promotion] Release 0.1.30.0
      drm/amd/display: Promote DC to 3.2.353
      drm/amd/display: [FW Promotion] Release 0.1.31.0
      drm/amd/display: Promote DC to 3.2.354
      drm/amd/display: Promote DC to 3.2.355
      drm/amd/display: [FW Promotion] Release 0.1.33.0
      drm/amd/display: Promote DC to 3.2.356
      drm/amd/display: [FW Promotion] Release 0.1.34.0
      drm/amd/display: Promote DC to 3.2.357
      drm/amd/display: [FW Promotion] Release 0.1.35.0
      drm/amd/display: Promote DC to 3.2.358
      drm/amd/display: Ignore Coverity false positive
      drm/amd/display: Promote DC to 3.2.359

Tangudu Tilak Tirumalesh (1):
      drm/xe/xe3: Extend wa_14023061436

Tao Zhou (10):
      drm/amdgpu: check save count before RAS bad page saving
      drm/amdgpu: make MCA IPID parse global
      drm/amdgpu: add ras_eeprom_read_idx interface
      drm/amdgpu: support to load RAS bad pages from PMFW
      drm/amdgpu: skip writing eeprom when PMFW manages RAS data
      drm/amdgpu: load RAS bad page from PMFW in page retirement
      drm/amdgpu: get RAS bad page address from MCA address
      drm/amdgpu: try for more times if RAS bad page number is not updated
      drm/amdgpu: add RAS bad page threshold handling for PMFW manages eepr=
om
      drm/amdgpu: optimize timeout implemention in ras_eeprom_update_record=
_num

Taotao Chen (2):
      drm/i915: set O_LARGEFILE in __create_shmem()
      drm/i915: Fix incorrect error handling in shmem_pwrite()

Tapani P=C3=A4lli (1):
      drm/xe/xe3: Apply wa_14024997852

Tejas Upadhyay (1):
      drm/xe: Move declarations under conditional branch

Thomas Hellstr=C3=B6m (14):
      Merge drm/drm-next into drm-xe-next
      drm/xe: Don't copy pinned kernel bos twice on suspend
      drm/xe: Pre-allocate system memory for pinned external bos in
the pm notfier
      drm/xe/dma-buf: Allow pinning of p2p dma-buf
      drm/xe/pm: Hold the validation lock around evicting user-space
bos for suspend
      drm/xe/pm: Add lockdep annotation for the pm_block completion
      drm/xe/bo: Fix an idle assertion for local bos
      drm/gpusvm, drm/xe: Fix userptr to not allow device private pages
      drm/xe/migrate: Fix an error path
      Merge drm/drm-next into drm-xe-next
      drm/xe/svm: Ensure data will be migrated to system if indicated
by madvise.
      drm/xe: Retain vma flags when recreating and splitting vmas for madvi=
se
      drm/xe/uapi: Hide the madvise autoreset behind a VM_BIND flag
      drm/xe: Fix uninitialized return value from xe_validation_guard()

Thomas Zimmermann (77):
      Merge drm/drm-next into drm-misc-next
      drm/fb-helper: Synchronize dirty worker with vblank
      fbcon: Fix empty lines in fbcon.h
      fbcon: Rename struct fbcon_ops to struct fbcon_par
      fbcon: Set rotate_font callback with related callbacks
      fbcon: Move fbcon callbacks into struct fbcon_bitops
      fbcon: Streamline setting rotated/unrotated bitops
      drm/sysfb: Add custom plane state
      drm/sysfb: Lookup blit function during atomic check
      drm/format-helper: Remove drm_fb_blit()
      fbdev: Make drivers depend on FB_TILEBLITTING
      fbdev: Turn FB_MODE_HELPERS into an internal config option
      drm/ast: Move display-clock tables to per-Gen source files
      drm/ast: Move mode-detection helpers to Gen2 source files
      drm/ast: Split ast_detect_tx_chip() per chip generation
      drm/ast: Prepare per-Gen device initialization
      drm/ast: Move Gen1 device initialization into separate helper
      drm/ast: Move Gen2 device initialization into separate helper
      drm/ast: Move Gen3 device initialization into separate helper
      drm/ast: Move Gen4 device initialization into separate helper
      drm/ast: Move Gen5 device initialization into separate helper
      drm/ast: Move Gen6 device initialization into separate helper
      drm/ast: Move Gen7 device initialization into separate helper
      drm/ast: Remove generic device initialization
      drm/dumb-buffers: Sanitize output on errors
      drm/dumb-buffers: Provide helper to set pitch and size
      drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dum=
b()
      drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
      drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
      drm/vblank: Add vblank timer
      drm/vblank: Add CRTC helpers for simple use cases
      drm/vkms: Convert to DRM's vblank timer
      drm/hypervdrm: Use vblank timer
      drm/virtgpu: Use vblank timer
      Merge drm/drm-next into drm-misc-next
      drm/ast: Store DRAM clock table in struct ast_device
      drm/ast: Support device quirks
      drm/ast: Store CRTC memory request threshold in device quirks
      drm/ast: Store precatch settings in struct ast_device_quirks
      drm/ast: Store HSync adjustment in device quirks
      drm/bochs: Use vblank timer
      drm/cirrus-qemu: Use vblank timer
      drm/qxl: Use vblank timer
      drm/client: Remove holds_console_lock parameter from suspend/resume
      drm/sysfb: Use new CRTC state in begin_fb_access
      drm/client: Add client free callback to unprepare fb_helper
      drm/log: Do not hold lock across drm_client_release()
      drm/log: Add free callback
      drm/client: Do not free client memory by default
      Merge drm/drm-next into drm-misc-next
      drm/gem-atomic: Reset plane state to NULL if allocation failed
      drm/client: Remove pitch from struct drm_client_buffer
      drm/client: Move dumb-buffer handling to drm_client_framebuffer_creat=
e()
      drm/client: Inline drm_client_buffer_addfb() and _rmfb()
      drm/client: Deprecate struct drm_client_buffer.gem
      drm/client: Remove drm_client_framebuffer_delete()
      drm/client: Create client buffers with drm_client_buffer_create_dumb(=
)
      drm/client: Flush client buffers with drm_client_buffer_sync()
      drm/vblank: Fix kernel docs for vblank timer
      drm/vmwgfx: Set surface-framebuffer GEM objects
      drm/imx/ipuv3: Fix dumb-buffer allocation for non-RGB formats
      drm/client: Pass force parameter to client restore
      drm/client: Support emergency restore via sysrq for all clients
      drm/client: log: Implement struct drm_client_funcs.restore
      drm/fb-helper: Allocate and release fb_info in single place

Thorsten Blum (2):
      accel/qaic: Replace kzalloc + copy_from_user with memdup_user
      accel/qaic: Replace kcalloc + copy_from_user with memdup_array_user

Tiezhu Yang (1):
      drm/amd: Fix set but not used warnings

Timur Krist=C3=B3f (57):
      drm/amd/display: Determine DVI-I connector type (v2)
      drm/amd/display: Add analog bit to edid_caps (v2)
      drm/amd/display: Introduce MAX_LINK_ENCODERS (v2)
      drm/amd/display: Hook up DAC to bios_parser_encoder_control
      drm/amd/display: Add SelectCRTC_Source to BIOS parser
      drm/amd/display: Get maximum pixel clock from VBIOS
      drm/amd/display: Don't use stereo sync and audio on RGB signals (v2)
      drm/amd/display: Don't try to enable/disable HPD when unavailable
      drm/amd/display: Determine early if a link has supported encoders (v2=
)
      drm/amd/display: Add concept of analog encoders (v2)
      drm/amd/display: Implement DCE analog stream encoders
      drm/amd/display: Implement DCE analog link encoders (v2)
      drm/amd/display: Support DAC in dce110_hwseq
      drm/amd/display: Add analog link detection (v2)
      drm/amd/display: Refactor amdgpu_dm_connector_detect (v2)
      drm/amd/display: Poll analog connectors (v3)
      drm/amd/display: Add DCE BIOS_SCRATCH_0 register
      drm/amd/display: Make get_support_mask_for_device_id reusable
      drm/amd/display: Add DAC_LoadDetection to BIOS parser (v2)
      drm/amd/display: Use DAC load detection on analog connectors (v2)
      drm/amd/display: Add common modes to analog displays without EDID
      drm/amd/display: Don't add freesync modes to analog displays (v2)
      drm/amdgpu: Use DC by default for Bonaire
      drm/amd/pm/si: Delete unused structs and fields
      drm/amdgpu/gmc6: Place gart at low address range
      drm/amdgpu/gart: Add helper to bind VRAM pages (v2)
      drm/amdgpu: Use DC by default on SI dGPUs
      drm/amdgpu/ttm: Use GART helper to map VRAM pages (v2)
      drm/amdgpu/vce: Move firmware load to amdgpu_vce_early_init
      drm/amdgpu/vce: Clear VCPU BO, don't unmap/unreserve (v4)
      drm/amdgpu/vce1: Clean up register definitions
      drm/amdgpu/vce1: Load VCE1 firmware
      drm/amdgpu/vce1: Implement VCE1 IP block (v2)
      drm/amdgpu/vce1: Ensure VCPU BO is in lower 32-bit address space (v3)
      drm/amd/pm/si: Hook up VCE1 to SI DPM
      drm/amdgpu/vce1: Enable VCE1 on Tahiti, Pitcairn, Cape Verde GPUs
      drm/amdgpu/vce1: Workaround PLL timeout on FirePro W9000
      drm/radeon: Refactor how SI and CIK support is determined
      drm/amdgpu: Refactor how SI and CIK support is determined
      drm/amdgpu: Use amdgpu by default on CIK dedicated GPUs
      drm/amdgpu: Use amdgpu by default on CIK dedicated GPUs
      drm/amdgpu: Use amdgpu by default on SI dedicated GPUs (v2)
      drm/amd/display: Fix warning for analog stream encoders
      drm/amd/display: Cleanup uses of the analog flag
      drm/amd/display: Cleanup early return in construct_phy
      drm/amd/display: Move analog check to dce110_hwseq
      drm/amdgpu/vm: Check PRT uAPI flag instead of PTE flag
      drm/amdgpu/si_ih: Enable soft IRQ handler ring
      drm/amdgpu/cik_ih: Enable soft IRQ handler ring
      drm/amdgpu/iceland_ih: Enable soft IRQ handler ring
      drm/amdgpu/tonga_ih: Enable soft IRQ handler ring
      drm/amdgpu/cz_ih: Enable soft IRQ handler ring
      drm/amdgpu/gmc6: Don't print MC client as it's unknown
      drm/amdgpu/gmc6: Cache VM fault info
      drm/amdgpu/gmc6: Delegate VM faults to soft IRQ handler ring
      drm/amdgpu/gmc7: Delegate VM faults to soft IRQ handler ring
      drm/amdgpu/gmc8: Delegate VM faults to soft IRQ handler ring

Timur Tabi (3):
      drm/nouveau: fully define nvfw_hs_load_header_v2
      drm/nouveau: restrict the flush page to a 32-bit address
      drm/nouveau: verify that hardware supports the flush page address

Tomasz Lis (5):
      drm/xe/ct: Separate waiting for retry from ct send function
      drm/xe/vf: Revert logic of vf.migration.enabled
      drm/xe/vf: Fix GuC FW check for VF migration support
      drm/xe: Assert that VF will never use fixed placement of BOs
      drm/xe/vf: Do not disable VF migration on ATS-M

Tomasz Rusinowicz (2):
      accel/ivpu: Enable MCA ECC signalling based on MSR
      accel/ivpu: Fix race condition when unbinding BOs

Tomi Valkeinen (2):
      drm/tidss: Restructure dispc_vp_prepare() and dispc_vp_enable()
      drm/tidss: Set vblank (event) time at crtc_atomic_enable

Troy Hanson (1):
      accel/qaic: Rename constant for clarity

Tvrtko Ursulin (8):
      drm/amdgpu: Use memset32 for IB padding
      drm/ttm: Add getter for some pool properties
      drm/ttm: Replace multiple booleans with flags in pool init
      drm/ttm: Replace multiple booleans with flags in device init
      drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
      drm/amdgpu: Configure max beneficial TTM pool allocation order
      drm/ttm: Add an allocation flag to propagate -ENOSPC on OOM
      drm/gem: Use vmemdup_array_user in drm_gem_objects_lookup

Uma Shankar (1):
      drm: Add Enhanced LUT precision structure

Umesh Nerlige Ramappa (1):
      drm/i915: Fix conversion between clock ticks and nanoseconds

Vamsee Vardhan Thummala (1):
      gpu: host1x: Allow loading tegra-drm without enabled engines

Victor Zhao (2):
      drm/amdgpu: Add kiq hdp flush callbacks
      drm/amdgpu: use GPU_HDP_FLUSH for sriov

Ville Syrj=C3=A4l=C3=A4 (152):
      drm/i915: Defeature DRRS on LNL+
      drm/i915/vrr: Extract helpers to convert between guardband and
pipeline_full values
      drm/i915/vrr: Readout framestart_delay earlier
      drm/i915/vrr: Store guardband in crtc state even for icl/tgl
      drm/i915/vrr: Annotate some functions with "hw"
      drm/i915/vrr: Move the TGL SCL mangling of vmin/vmax/flipline deeper
      drm/dp: Add definitions for POST_LT_ADJ training sequence
      drm/dp: Add POST_LT_ADJ_REQ helpers
      drm/i915/vrr: Hide the ICL/TGL intel_vrr_flipline_offset() mangling b=
etter
      drm/i915/vrr: s/intel_vrr_flipline_offset/intel_vrr_vmin_flipline_off=
set/
      drm/i915/pm: Simplify pm hook documentation
      drm/i915/pm: Hoist pci_save_state()+pci_set_power_state() to the
end of pm _late() hook
      drm/i915/pm: Move the hibernate+D3 quirk stuff into noirq() pm hooks
      drm/i915/pm: Do pci_restore_state() in switcheroo resume hook
      drm/i915/pm: Allow drivers/pci to manage our pci state normally
      drm/i915/pm: Drop redundant pci stuff from suspend/resume paths
      drm/i915/dram: Also apply the 16Gb DIMM w/a for larger DRAM chips
      drm/i915: Apply the 16Gb DIMM w/a only for the platforms that need it
      drm/i915: Tweak the read latency fixup code
      drm/i915: Don't pass the latency array to {skl,mtl}_read_wm_latency()
      drm/i915: Move adjust_wm_latency() out from {mtl,skl}_read_wm_latency=
()
      drm/i915: Extract multiply_wm_latency() from skl_read_wm_latency()
      drm/i915: Extract increase_wm_latency()
      drm/i915: Use increase_wm_latency() for the 16Gb DIMM w/a
      drm/i915: Extract sanitize_wm_latency()
      drm/i915: Flatten sanitize_wm_latency() a bit
      drm/i915: Make wm latencies monotonic
      drm/i915: Print both the original and adjusted wm latencies
      drm/i915: Make sure wm block/lines are non-decreasing
      drm/i915: Use the the correct pixel rate to compute wm line time
      drm/i915: Deobfuscate wm linetime calculation
      drm/i915: s/intel_get_linetime_us()/skl_wm_linetime_us()/
      drm/i915/frontbuffer: Move bo refcounting
intel_frontbuffer_{get,release}()
      drm/i915/fb: Fix the set_tiling vs. addfb race, again
      drm/i915/fbdev: Select linear modifier explicitly
      drm/i915/fb: Drop the 'fb' argument from intel_fb_bo_framebuffer_init=
()
      drm/i915/wm: Use fb->modfier to check for tiled vs. untiled
      drm/i915: Introduce intel_crtc_enable_changed() and
intel_any_crtc_enable_changed()
      drm/i915: Introduce intel_crtc_active_changed() and
intel_any_crtc_active_changed()
      drm/i915/bw: Skip the bw_state->active_pipes update if no pipe
is changing its active state
      drm/1915/bw: Drop redundant display version checks
      drm/i915/cdclk: Extract glk_cdclk_audio_wa_needed()
      drm/i915/cdclk: Extract dg2_power_well_count()
      drm/i915/cdclk: Introduce intel_cdclk_modeset_checks()
      drm/i915/cdclk: Handle the force_min_cdclk state locking in
intel_cdclk_atomic_check()
      drm/i915/cdclk: Extract intel_cdclk_update_bw_min_cdclk()
      drm/i915/cdclk: Extract intel_cdclk_update_crtc_min_cdclk()
      drm/i915/cdclk: Rework bw_min_cdclk handling
      drm/i915/cdclk: Do intel_cdclk_update_crtc_min_cdclk() per-pipe
      drm/i915/cdclk: Relocate intel_plane_calc_min_cdclk() calls
      drm/i915/cdclk: Rework crtc min_cdclk handling
      drm/i915/cdclk: Move intel_bw_crtc_min_cdclk() handling into
intel_crtc_compute_min_cdclk()
      drm/i915/cdclk: Decouple cdclk from state->modeset
      drm/i915: Introduce intel_calc_enabled_pipes()
      drm/i915/cdclk: Use enabled_pipes instead of active_pipes for
the glk audio w/a
      drm/i915/cdclk: Hide intel_modeset_calc_cdclk()
      drm/i915/cdclk: Move intel_cdclk_atomic_check()
      drm/i915: Reject modes with linetime > 64 usec
      drm/i915/cdclk: Add prefill helpers for CDCLK
      drm/i915/cdclk: Add intel_cdclk_min_cdclk_for_prefill()
      drm/i915/dsc: Add prefill helper for DSC
      drm/i915/scaler: Add scaler prefill helpers
      drm/i915/wm: Add WM0 prefill helpers
      drm/i915/prefill: Introduce skl_prefill.c
      drm/i915/wm: Use skl_prefill
      drm/i915/bw: Untangle dbuf bw from the sagv/mem bw stuff
      drm/i915: s/"not not"/"not"/
      drm/i915/bw: Relocate intel_bw_crtc_min_cdclk()
      drm/i915/ips: Eliminate the cdclk_state stuff from
hsw_ips_compute_config()
      drm/i915/fbc: Decouple FBC from intel_cdclk_atomic_check()
      drm/i915: s/min_cdck[]/plane_min_cdclk[]/
      drm/i915: Compute per-crtc min_cdclk earlier
      drm/i915: Include the per-crtc minimum cdclk in the crtc state dump
      drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S
      drm/i915/dmc: Fixup TGL/ADL-S HRR event handler type
      drm/i915/dmc: Set DMC_EVT_CTL_ENABLE for disabled event handlers as w=
ell
      drm/i915/vrr: Fix intel_vrr_always_use_vrr_tg()=3D=3Dtrue on TGL
      drm/i915/lrr: Include SCL in lrr_params_changed()
      drm/i915: Remove the "vblank delay" state dump
      drm/i915/vrr: Compute fixed refresh rate timings the same way as
CMRR timings
      drm/i915/vrr: Reorganize intel_vrr_compute_cmrr_timings() a bit
      drm/i195/vrr: Move crtc_state->vrr.{vmin,vmax} update into
intel_vrr_compute_vrr_timings()
      drm/i915/vrr: Move compute_fixed_rr_timings()
      drm/i915/vrr: Extract intel_vrr_set_vrr_timings()
      drm/i915/vrr: Avoid redundant TRANS_PUSH write in intel_vrr_enable()
      drm/i915/vrr: Move EMP_AS_SDP_TL write into
intel_vrr_set_transcoder_timings()
      drm/i915/vrr: Use trans_vrr_ctl() in intel_vrr_transcoder_disable()
      drm/i915/vrr: Extract intel_vrr_tg_disable()
      drm/i915/vrr: Extract intel_vrr_tg_enable()
      drm/i915/vrr: Disable VRR TG in intel_vrr_transcoder_disable()
only on always use_vrr_tg() platforms
      drm/i915/vrr: Always write TRANS_VRR_CTL in
intel_vrr_set_transcoder_timings() on !always_use_vrr_tg()
      drm/i915/vrr: Remove redundant HAS_VRR() checks
      drm/i915/vrr: Move HAS_VRR() check into intel_vrr_set_transcoder_timi=
ngs()
      drm/i915/vrr: s/crtc_state/old_crtc_state/ in
intel_vrr_transcoder_disable()
      drm/i915/vrr: Nuke intel_vrr_vblank_exit_length()
      drm/i915/vrr: Nuke intel_vrr_vmin_flipline()
      drm/i915/vrr: Update the intel_vrr_extra_vblank_delay() comment
      drm/i915/vrr: Check HAS_VRR() first in intel_vrr_is_capable()
      drm/atomic: WARN about missing acquire_ctx in
drm_atomic_get_private_obj_state()
      drm/atomic: WARN about invalid drm_foo_get_state() usage
      drm/i915: Rewrite icl_min_plane_width()
      drm/i915: Drop the min plane width w/a adl+
      drm/i915: Implement .min_plane_width() for PTL+
      drm/i915: Start checking plane min size for the chroma plane
      drm/i915: Introduce intel_plane_min_height()
      drm/i915: Remove pointless crtc hw.enable check
      drm/i915: Extract glk_plane_has_planar()
      drm/i915: Unify the logic in {skl,glk}_plane_has_*()
      drm/i915/overlay: Drop the DIRTYFB flush
      drm/i915/overlay: Switch to intel_frontbuffer_flip()
      drm/i915/frontbuffer: Nuke intel_frontbuffer_flip_{prepare,complete}(=
)
      drm/i915/frontbuffer: Turn intel_bo_flush_if_display() into a
frontbuffer operation
      drm/i915/frontbuffer: Handle the dirtyfb cache flush inside
intel_frontbuffer_flush()
      drm/i915/frontbuffer: Split fb_tracking.lock into two
      drm/i915/frontbuffer: Extract intel_frontbuffer_ref()
      drm/i915/frontbuffer: Add intel_frontbuffer::display
      drm/i915/frontbuffer: Fix intel_frontbuffer lifetime handling
      drm/i915/gem:
s/i915_gem_object_get_frontbuffer/i915_gem_object_frontbuffer_lookup/
      drm/i915/cx0: Nuke extraneous timeout debugs
      drm/i915/ltphy: Nuke extraneous timeout debugs
      drm/i915/cx0: Replace XELPDP_PORT_POWERDOWN_UPDATE_TIMEOUT_US
with XELPDP_PORT_POWERDOWN_UPDATE_TIMEOUT_MS
      drm/i915/cx0: Get rid of XELPDP_MSGBUS_TIMEOUT_FAST_US
      drm/i915/cx0: s/XELPDP_MSGBUS_TIMEOUT_SLOW/XELPDP_MSGBUS_TIMEOUT_MS/
      drm/i915/cx0:
s/XELPDP_PORT_RESET_END_TIMEOUT/XELPDP_PORT_RESET_END_TIMEOUT_MS/
      drm/i915/ltphy: Nuke bogus weird timeouts
      drm/i915/hdcp: Use the default 2 usec fast polling timeout
      drm/i915/pmdemand: Use the default 2 usec fast polling timeout
      drm/i915/de: Implement register waits one way
      drm/i915/de: Have intel_de_wait() hand out the final register value
      drm/i915/de: Include units in intel_de_wait*() function names
      drm/i915/de: Introduce intel_de_wait_us()
      drm/i915/de: Use intel_de_wait_us()
      drm/i915/de: Use intel_de_wait_ms() for the obvious cases
      drm/i915/de: Nuke intel_de_wait_custom()
      drm/i915/de: Introduce intel_de_wait_for_{set,clear}_us()
      drm/i915/de: Use intel_de_wait_for_{set,clear}_us()
      drm/i915/de: Use intel_de_wait_for_{set,clear}_ms()
      drm/1915/dpio: Stop using intel_de_wait_fw_ms()
      drm/i915/de: Replace __intel_de_rmw_nowl() with intel_de_rmw_fw()
      drm/i915/de: Nuke wakelocks from intel_de_wait_fw_ms()
      drm/i915/de: Replace __intel_de_wait_for_register_nowl() with
intel_de_wait_fw_us_atomic()
      drm/i915/power: Use the intel_de_wait_ms() out value
      drm/i915/dpio: Use the intel_de_wait_ms() out value
      drm/i915: Introduce intel_dumb_fb_max_stride()
      drm/i915: Pass drm_format_info into plane->max_stride()
      drm/i915: Populate fb->format accurately in BIOS FB readout
      drm/i915: Nuke intel_plane_config.tiling
      drm/i915/fb: Init 'ret' in each error branch in intel_framebuffer_ini=
t()
      drm/i915/wm: Use drm_get_format_info() in SKL+ cursor DDB allocation
      drm/i915: Use mode_config->cursor_width for cursor DDB allocation
      drm/i915/cursor: Extract intel_cursor_mode_config_init()
      drm/i915/cursor: Initialize 845 vs 865 cursor size separately

Vinay Belgaumkar (1):
      drm/xe: Enable media sampler power gating

Vinod Govindapillai (4):
      drm/i915/fbc: update the impacted platforms in wa_22014263786
      drm/i915/xe3p_lpd: Add FBC support for FP16 formats
      drm/i915/xe3p_lpd: extract pixel format valid routine for FP16 format=
s
      drm/i915/xe3p_lpd: use pixel normalizer for fp16 formats for FBC

Vitaly Prosyak (1):
      drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM sur=
faces

Wang Xin (2):
      drm/xe: Dump CURRENT_LRCA register
      drm/xe/xe3p: Dump CSMQDEBUG register

Wayne Lin (1):
      drm/amd/display: Enable mst when it's detected but yet to be initiali=
zed

WeiHao Li (3):
      dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3368 DSI
      drm/rockchip: dsi: Add support for RK3368
      drm/rockchip: vop: add lut_size for RK3368 vop_data

Wenjing Liu (5):
      drm/amd/display: update perfmon measurement interfaces
      drm/amd/display: add additional hdcp traces
      drm/amd/display: fw locality check refactors
      drm/amd/display: add macros to simplify code
      drm/amd/display: Refactor HDCP Status Log Format

Will Aitken (3):
      drm/amdgpu: Refactor sriov xgmi topology filling to common code
      drm/amdgpu: Update headers for sriov xgmi ext peer link support
feature flag
      drm/amdgpu: Enable xgmi extended peer links for sriov guest

Wludzik, Jozef (1):
      accel/ivpu: Fix race condition when mapping dmabuf

Xiang Liu (5):
      drm/amd/ras: Add CPER ring read for uniras
      drm/amd/ras: Update IPID value for bad page threshold CPER
      drm/amd/ras: Correct info field of bad page threshold exceed CPER
      drm/amd/ras: Use correct severity for BP threshold exceed event
      drm/amd/ras: Fix format truncation

Xiangxu Yin (5):
      drm/msm/dp: move link-specific parsing from dp_panel to dp_link
      drm/msm/dp: Add support for lane mapping configuration
      dt-bindings: display/msm: dp-controller: Add SM6150
      dt-bindings: display: msm: sm6150-mdss: Add DisplayPort controller
      dt-bindings: display: msm: sm6150-mdss: Fix example indentation
and OPP values

Xin Wang (1):
      drm/xe: highlight reserved PAT entries in dump output

Yang Wang (5):
      drm/amd/pm: fix smu table id bound check issue in smu_cmn_update_tabl=
e()
      drm/amd/pm: fix the issue of size calculation error for smu 13.0.6
      drm/amd/pm: fix missing device_attr cleanup in amdgpu_pm_sysfs_init()
      drm/amd/pm: fix amdgpu_irq enabled counter unbalanced on smu v11.0
      drm/amd/pm: adjust the visibility of pp_table sysfs node

YiPeng Chai (56):
      drm/amd/ras: Add ras aca parser v1.0
      drm/amd/ras: Add aca common ras functions
      drm/amd/ras: Add mp1 v13_0 ras functions
      drm/amd/ras: Add mp1 common ras functions
      drm/amd/ras: Add nbio v7_9 ras functions
      drm/amd/ras: Add nbio common ras functions
      drm/amd/ras: Add umc v12_0 ras functions
      drm/amd/ras: Add umc common ras functions
      drm/amd/ras: Add gfx v9_0 ras functions
      drm/amd/ras: Add gfx common ras functions
      drm/amd/ras: Add eeprom ras functions
      drm/amd/ras: Add psp v13_0 ras functions
      drm/amd/ras: Add psp ras common functions
      drm/amd/ras: Add ras ioctl command handler
      drm/amd/ras: Add thread to handle ras events
      drm/amd/ras: Use ring buffer to record ras ecc data
      drm/amd/ras: Add cper conversion function
      drm/amd/ras: Add rascore unified interface function
      drm/amd/ras: Add files to ras core Makefile
      drm/amd/ras: Add amdgpu nbio v7_9 configuration function
      drm/amd/ras: Add amdgpu mp1 v13_0 configuration function
      drm/amd/ras: Add amdgpu eeprom i2c configuration function
      drm/amd/ras: Amdgpu handle ras ioctl command
      drm/amd/ras: Add amdgpu ras system functions
      drm/amd/ras: Amdgpu preprocesses ras interrupts
      drm/amd/ras: Add amdgpu ras management function.
      drm/amd/ras: Add files to amdgpu ras manager makefile
      drm/amd/ras: Add unified ras module top-level makefile
      drm/amd/pm: export a function amdgpu_smu_ras_send_msg to allow
send msg directly
      drm/amdgpu: Add ras module files into amdgpu
      drm/amdgpu: Intercept ras interrupts to ras module
      drm/amdgpu: Improve ras fatal error handling function
      drm/amdgpu: add ras module rma check
      drm/amdgpu: Avoid loading bad pages into legacy ras
      drm/amdgpu: Add poison consumption sequence numbers for gfx and sdma
      drm/amdgpu: Avoid hive seqno increment in legacy ras
      drm/amdgpu: Add ras module eeprom safety watermark check
      drm/amdgpu: Add ras module ip block to amdgpu discovery
      drm/amdgpu: Enable ras module
      drm/amd/ras: Update ras command context structure name
      drm/amd/ras: Update function and remove redundant code
      drm/amdgpu: ras module supports error injection
      drm/amdgpu: query bad page info of ras module
      drm/amdgpu: query block error count of ras module
      drm/amd/ras: Fix the error of undefined reference to `__udivdi3'
      drm/amdgpu: Fix error injection parameter error
      drm/amd/ras: Increase ras switch control range
      drm/amdgpu: Add ras ip block name
      drm/amd/ras: Add ras support for nbio v7_9_1
      drm/amd/ras: Add ras support for umc v12_5_0
      drm/amdgpu: suspend ras module before gpu reset
      drm/amd/ras: ras supports i2c eeprom for mp1 v13_0_12
      drm/amd/ras: Fix the issue of incorrect function call
      drm/amdgpu: Synchronize sriov host to add block_mmsch bit field
      drm/amdgpu: Add lock to serialize sriov command execution
      drm/amdgpu: Fix the issue of missing ras message on sriov host

Yifan Zha (1):
      drm/amdgpu: Skip emit de meta data on gfx11 with rs64 enabled

Yihan Zhu (1):
      drm/amd/display: fix dppclk rcg poweron check

Yongxing Mou (4):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      drm/msm: mdss: Add QCS8300 support

Youssef Samir (5):
      accel/qaic: Use kvcalloc() for slice requests allocation
      accel/qaic: Remove redundant retry_count =3D 0 statement
      accel/qaic: Ensure entry belongs to DBC in qaic_perf_stats_bo_ioctl()
      accel/qaic: Update the sahara image table for AIC200
      accel/qaic: Add support for PM callbacks

Zack McKevitt (4):
      accel/qaic: Include signal.h in qaic_control.c
      accel/qaic: Use check_add_overflow in sahara for 64b types
      accel/qaic: Fix mismatched types in min()
      accel/qaic: Add qaic_ prefix to irq_polling_work

Zhanjun Dong (1):
      drm/i915/guc: Skip communication warning on reset in progress

Zhijian Yan (2):
      drm/panel: Add support for KD116N3730A07
      drm/panel: Add support for KD116N3730A12

Zhongtian Wu (1):
      drm/panel-edp: Add several panel configurations for mt8189 Chromebook

Zhongwei Zhang (1):
      drm/amd/display: init dispclk from bootup clock for DCN315

 .clang-format                                      |    2 +-
 .mailmap                                           |    1 +
 Documentation/ABI/stable/sysfs-driver-qaic         |   19 +
 .../ABI/testing/sysfs-driver-intel-xe-sriov        |  159 ++
 Documentation/accel/qaic/aic100.rst                |   25 +-
 Documentation/accel/qaic/qaic.rst                  |    8 +-
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml         |   12 +
 .../bindings/display/bridge/ite,it66121.yaml       |    1 +
 .../display/bridge/renesas,dsi-csi2-tx.yaml        |   54 +-
 .../bindings/display/bridge/simple-bridge.yaml     |    2 +
 .../bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml  |   69 +
 .../bindings/display/msm/dp-controller.yaml        |   17 +-
 .../devicetree/bindings/display/msm/gmu.yaml       |   60 +-
 .../bindings/display/msm/qcom,glymur-mdss.yaml     |  264 ++
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    |  286 ++
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     |   40 +-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   16 +-
 .../bindings/display/panel/ilitek,il79900a.yaml    |   68 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    3 +
 .../bindings/display/panel/lg,ld070wx3-sl01.yaml   |   60 +
 .../bindings/display/panel/panel-lvds.yaml         |    2 +
 .../bindings/display/panel/panel-simple-dsi.yaml   |   30 +-
 .../bindings/display/panel/panel-simple.yaml       |    6 +
 .../bindings/display/panel/ronbo,rb070d30.yaml     |   14 +-
 .../bindings/display/panel/samsung,atna33xc20.yaml |    2 +
 .../bindings/display/panel/samsung,s6e3fc2x01.yaml |   81 +
 .../bindings/display/panel/samsung,sofef00.yaml    |   79 +
 .../bindings/display/panel/sharp,lq079l1sx01.yaml  |   99 +
 .../display/panel/synaptics,td4300-panel.yaml      |   89 +
 .../bindings/display/renesas,rzg2l-du.yaml         |    3 +
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |    2 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       |   11 +
 .../bindings/gpu/arm,mali-valhall-csf.yaml         |   42 +-
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   91 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
 .../devicetree/bindings/npu/arm,ethos.yaml         |   79 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 Documentation/gpu/drm-kms-helpers.rst              |   12 +
 Documentation/gpu/drm-kms.rst                      |   15 +
 Documentation/gpu/nova/core/todo.rst               |   30 -
 Documentation/gpu/rfc/color_pipeline.rst           |  378 +++
 Documentation/gpu/rfc/index.rst                    |    3 +
 Documentation/gpu/todo.rst                         |   37 +
 Documentation/gpu/vkms.rst                         |  119 +-
 Documentation/gpu/xe/index.rst                     |    1 +
 Documentation/gpu/xe/xe_exec_queue.rst             |   20 +
 Documentation/gpu/xe/xe_gt_freq.rst                |    3 +
 Documentation/userspace-api/dma-buf-heaps.rst      |   59 +-
 MAINTAINERS                                        |   48 +-
 arch/arm/boot/dts/st/stih410.dtsi                  |  316 ++-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   37 +
 drivers/accel/Kconfig                              |    1 +
 drivers/accel/Makefile                             |    1 +
 drivers/accel/amdxdna/Makefile                     |    1 +
 drivers/accel/amdxdna/TODO                         |    1 -
 drivers/accel/amdxdna/aie2_ctx.c                   |  195 +-
 drivers/accel/amdxdna/aie2_error.c                 |   95 +-
 drivers/accel/amdxdna/aie2_message.c               |  731 +++--
 drivers/accel/amdxdna/aie2_msg_priv.h              |   88 +-
 drivers/accel/amdxdna/aie2_pci.c                   |  269 +-
 drivers/accel/amdxdna/aie2_pci.h                   |   54 +-
 drivers/accel/amdxdna/aie2_smu.c                   |   49 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |  108 +-
 drivers/accel/amdxdna/amdxdna_ctx.h                |   45 +-
 drivers/accel/amdxdna/amdxdna_error.h              |   59 +
 drivers/accel/amdxdna/amdxdna_gem.c                |   51 +-
 drivers/accel/amdxdna/amdxdna_gem.h                |    6 +
 drivers/accel/amdxdna/amdxdna_mailbox.c            |   14 +-
 drivers/accel/amdxdna/amdxdna_mailbox_helper.h     |    6 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   63 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |    3 +
 drivers/accel/amdxdna/amdxdna_pm.c                 |   94 +
 drivers/accel/amdxdna/amdxdna_pm.h                 |   18 +
 drivers/accel/amdxdna/npu1_regs.c                  |    8 +
 drivers/accel/amdxdna/npu2_regs.c                  |    2 +
 drivers/accel/amdxdna/npu4_regs.c                  |   12 +
 drivers/accel/amdxdna/npu5_regs.c                  |    2 +
 drivers/accel/amdxdna/npu6_regs.c                  |    2 +
 drivers/accel/ethosu/Kconfig                       |   11 +
 drivers/accel/ethosu/Makefile                      |    4 +
 drivers/accel/ethosu/ethosu_device.h               |  197 ++
 drivers/accel/ethosu/ethosu_drv.c                  |  403 +++
 drivers/accel/ethosu/ethosu_drv.h                  |   15 +
 drivers/accel/ethosu/ethosu_gem.c                  |  704 +++++
 drivers/accel/ethosu/ethosu_gem.h                  |   46 +
 drivers/accel/ethosu/ethosu_job.c                  |  497 ++++
 drivers/accel/ethosu/ethosu_job.h                  |   40 +
 drivers/accel/ivpu/Makefile                        |    1 +
 drivers/accel/ivpu/ivpu_debugfs.c                  |   38 +-
 drivers/accel/ivpu/ivpu_drv.c                      |   18 +-
 drivers/accel/ivpu/ivpu_drv.h                      |    5 +
 drivers/accel/ivpu/ivpu_fw.c                       |  229 +-
 drivers/accel/ivpu/ivpu_fw.h                       |   14 +-
 drivers/accel/ivpu/ivpu_gem.c                      |  161 +-
 drivers/accel/ivpu/ivpu_gem.h                      |   22 +-
 drivers/accel/ivpu/ivpu_gem_userptr.c              |  213 ++
 drivers/accel/ivpu/ivpu_hw.c                       |   59 +-
 drivers/accel/ivpu/ivpu_hw.h                       |   10 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |   20 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |    2 +-
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h          |    3 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |   10 +
 drivers/accel/ivpu/ivpu_ipc.c                      |    2 +-
 drivers/accel/ivpu/ivpu_job.c                      |  269 +-
 drivers/accel/ivpu/ivpu_job.h                      |   49 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |    2 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |    9 +-
 drivers/accel/ivpu/ivpu_mmu_context.h              |    2 +-
 drivers/accel/ivpu/ivpu_ms.c                       |   25 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   18 +-
 drivers/accel/ivpu/ivpu_sysfs.c                    |    3 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |  653 +++--
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    2 +
 drivers/accel/qaic/qaic.h                          |   40 +-
 drivers/accel/qaic/qaic_control.c                  |   25 +-
 drivers/accel/qaic/qaic_data.c                     |  164 +-
 drivers/accel/qaic/qaic_drv.c                      |  116 +-
 drivers/accel/qaic/qaic_ras.c                      |    6 +-
 drivers/accel/qaic/qaic_ssr.c                      |  815 ++++++
 drivers/accel/qaic/qaic_ssr.h                      |   17 +
 drivers/accel/qaic/qaic_sysfs.c                    |  109 +
 drivers/accel/qaic/qaic_timesync.c                 |    9 +
 drivers/accel/qaic/qaic_timesync.h                 |    3 +
 drivers/accel/qaic/sahara.c                        |  170 +-
 drivers/accel/rocket/rocket_gem.c                  |    1 +
 drivers/dma-buf/dma-fence.c                        |   52 +-
 drivers/dma-buf/heaps/Kconfig                      |   10 -
 drivers/dma-buf/heaps/cma_heap.c                   |   47 +-
 drivers/dma-buf/heaps/system_heap.c                |   33 +-
 drivers/dma-buf/sw_sync.c                          |    4 +
 drivers/gpu/drm/Makefile                           |    7 +-
 drivers/gpu/drm/adp/adp_drv.c                      |    1 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   24 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |   10 +-
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  418 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  244 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   19 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  201 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  145 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   81 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.h            |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   69 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  402 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  422 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   30 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  124 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  141 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  640 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |  174 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  343 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   27 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   37 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   92 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c                |   12 +
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                 |   10 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   29 +
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   31 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   22 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |    6 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |    6 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   10 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |   10 +
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |   60 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   40 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   24 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |   22 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   12 +
 drivers/gpu/drm/amd/amdgpu/sid.h                   |   40 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    4 -
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c              |   10 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   14 +
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c              |  839 ++++++
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.h              |   32 +
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |    5 +
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |    5 +
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |    5 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   12 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   11 -
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h           |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    1 -
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |    4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |    3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  480 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    7 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  768 +++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  209 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h  |   36 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   26 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   18 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    9 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   17 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   59 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   39 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |    2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |   95 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    8 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |  286 ++
 .../gpu/drm/amd/display/dc/bios/command_table.h    |    6 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    8 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   87 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h |    1 +
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   42 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 1137 ++++++--
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  | 2853 ++++++++++++++++=
+++-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  129 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   67 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  581 +++-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |    9 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  132 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   43 +
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   36 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    2 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   11 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   24 +-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c |    2 +-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |   64 +-
 .../gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c |  123 +
 .../gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.h |    2 +
 .../drm/amd/display/dc/dccg/dcn314/dcn314_dccg.c   |    3 +-
 .../drm/amd/display/dc/dccg/dcn314/dcn314_dccg.h   |    3 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   26 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h |   13 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |    1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.c       |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |    3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |    6 +-
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |   85 +
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |   16 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |   14 +
 .../drm/amd/display/dc/dce/dce_stream_encoder.h    |    5 +
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |   35 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.h  |   12 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   20 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |    5 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |  141 -
 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile     |  140 +
 .../drm/amd/display/dc/{dml2 =3D> dml2_0}/cmntypes.h |   18 +-
 .../dc/{dml2 =3D> dml2_0}/display_mode_core.c        |    2 +
 .../dc/{dml2 =3D> dml2_0}/display_mode_core.h        |    0
 .../{dml2 =3D> dml2_0}/display_mode_core_structs.h   |    3 +-
 .../dc/{dml2 =3D> dml2_0}/display_mode_lib_defines.h |    2 +-
 .../dc/{dml2 =3D> dml2_0}/display_mode_util.c        |    0
 .../dc/{dml2 =3D> dml2_0}/display_mode_util.h        |    2 -
 .../dml21/dml21_translation_helper.c               |    0
 .../dml21/dml21_translation_helper.h               |    0
 .../dc/{dml2 =3D> dml2_0}/dml21/dml21_utils.c        |    0
 .../dc/{dml2 =3D> dml2_0}/dml21/dml21_utils.h        |    0
 .../dc/{dml2 =3D> dml2_0}/dml21/dml21_wrapper.c      |    4 -
 .../dc/{dml2 =3D> dml2_0}/dml21/dml21_wrapper.h      |    0
 .../dml21/inc/bounding_boxes/dcn4_soc_bb.h         |    1 -
 .../dml21/inc/dml2_external_lib_deps.h             |    0
 .../dc/{dml2 =3D> dml2_0}/dml21/inc/dml_top.h        |    0
 .../dml21/inc/dml_top_dchub_registers.h            |    3 +-
 .../dml21/inc/dml_top_display_cfg_types.h          |   23 +-
 .../dml21/inc/dml_top_policy_types.h               |    0
 .../dml21/inc/dml_top_soc_parameter_types.h        |   11 +-
 .../dc/{dml2 =3D> dml2_0}/dml21/inc/dml_top_types.h  |    7 +
 .../dml21/src/dml2_core/dml2_core_dcn4.c           |    1 +
 .../dml21/src/dml2_core/dml2_core_dcn4.h           |    0
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  123 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |    0
 .../dml21/src/dml2_core/dml2_core_factory.c        |    2 +
 .../dml21/src/dml2_core/dml2_core_factory.h        |    0
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   45 +-
 .../dml21/src/dml2_core/dml2_core_utils.c          |    2 +
 .../dml21/src/dml2_core/dml2_core_utils.h          |    0
 .../dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c           |    0
 .../dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h           |    0
 .../dml21/src/dml2_dpmm/dml2_dpmm_factory.c        |    0
 .../dml21/src/dml2_dpmm/dml2_dpmm_factory.h        |    0
 .../dml21/src/dml2_mcg/dml2_mcg_dcn4.c             |    0
 .../dml21/src/dml2_mcg/dml2_mcg_dcn4.h             |    2 +-
 .../dml21/src/dml2_mcg/dml2_mcg_factory.c          |    0
 .../dml21/src/dml2_mcg/dml2_mcg_factory.h          |    0
 .../dml21/src/dml2_pmo/dml2_pmo_dcn3.c             |    0
 .../dml21/src/dml2_pmo/dml2_pmo_dcn3.h             |    0
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c       |  463 ++--
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h       |    0
 .../dml21/src/dml2_pmo/dml2_pmo_factory.c          |    0
 .../dml21/src/dml2_pmo/dml2_pmo_factory.h          |    2 +-
 .../src/dml2_standalone_libraries/lib_float_math.c |    0
 .../src/dml2_standalone_libraries/lib_float_math.h |    0
 .../dml21/src/dml2_top/dml2_top_interfaces.c       |    0
 .../dml21/src/dml2_top/dml2_top_legacy.c           |    0
 .../dml21/src/dml2_top/dml2_top_legacy.h           |    0
 .../dml21/src/dml2_top/dml2_top_soc15.c            |    0
 .../dml21/src/dml2_top/dml2_top_soc15.h            |    0
 .../dc/{dml2 =3D> dml2_0}/dml21/src/inc/dml2_debug.h |    0
 .../dml21/src/inc/dml2_internal_shared_types.h     |   76 +-
 .../dc/{dml2 =3D> dml2_0}/dml2_dc_resource_mgmt.c    |    0
 .../dc/{dml2 =3D> dml2_0}/dml2_dc_resource_mgmt.h    |    0
 .../display/dc/{dml2 =3D> dml2_0}/dml2_dc_types.h    |    0
 .../dc/{dml2 =3D> dml2_0}/dml2_internal_types.h      |    2 +-
 .../dc/{dml2 =3D> dml2_0}/dml2_mall_phantom.c        |    1 +
 .../dc/{dml2 =3D> dml2_0}/dml2_mall_phantom.h        |    0
 .../amd/display/dc/{dml2 =3D> dml2_0}/dml2_policy.c  |    0
 .../amd/display/dc/{dml2 =3D> dml2_0}/dml2_policy.h  |    0
 .../dc/{dml2 =3D> dml2_0}/dml2_translation_helper.c  |    3 +
 .../dc/{dml2 =3D> dml2_0}/dml2_translation_helper.h  |    0
 .../amd/display/dc/{dml2 =3D> dml2_0}/dml2_utils.c   |    0
 .../amd/display/dc/{dml2 =3D> dml2_0}/dml2_utils.h   |    0
 .../amd/display/dc/{dml2 =3D> dml2_0}/dml2_wrapper.c |    0
 .../amd/display/dc/{dml2 =3D> dml2_0}/dml2_wrapper.h |    0
 .../amd/display/dc/{dml2 =3D> dml2_0}/dml_assert.h   |    0
 .../display/dc/{dml2 =3D> dml2_0}/dml_depedencies.h  |    1 +
 .../dc/{dml2 =3D> dml2_0}/dml_display_rq_dlg_calc.c  |    0
 .../dc/{dml2 =3D> dml2_0}/dml_display_rq_dlg_calc.h  |    0
 .../amd/display/dc/{dml2 =3D> dml2_0}/dml_logging.h  |    1 +
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |   19 +-
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h   |    4 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |   36 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |    2 +
 .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c   |    1 +
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |    1 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |    1 +
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   43 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |   10 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |    1 +
 .../gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c   |   32 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |    1 +
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |    6 +
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |   33 +-
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.h |    6 +-
 .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |    8 +-
 .../drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c |    3 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |   53 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.h |    1 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |    3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |    1 +
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |  136 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |   63 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |    8 +-
 .../gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c |    2 -
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |  147 +-
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h |    2 +
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |    4 +-
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |   74 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |    4 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   28 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |    2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   90 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    5 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   15 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   68 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    3 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |    1 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    1 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  144 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |    8 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    6 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 1409 +++++++++-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |  104 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   28 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h | 1446 +++++++++-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |   36 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   12 +-
 .../drm/amd/display/dc/inc/hw/cursor_reg_cache.h   |   28 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |  121 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   50 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |   17 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    7 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |   49 +
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |    2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   27 +
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |   13 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |  130 +
 drivers/gpu/drm/amd/display/dc/inc/link_service.h  |    4 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    1 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |    4 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |   19 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  172 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   14 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   66 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |    3 +-
 .../display/dc/link/protocols/link_dp_capability.c |   64 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |   24 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |    4 +-
 .../dc/link/protocols/link_edp_panel_control.c     |  143 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    4 +-
 .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c   |   16 +
 .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.h   |    5 +
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |    1 +
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |    1 +
 .../gpu/drm/amd/display/dc/opp/dcn10/dcn10_opp.c   |   14 +-
 .../gpu/drm/amd/display/dc/opp/dcn10/dcn10_opp.h   |    6 +-
 .../gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.c   |   13 +
 .../gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.h   |    6 +-
 .../gpu/drm/amd/display/dc/opp/dcn35/dcn35_opp.c   |   13 +
 .../gpu/drm/amd/display/dc/opp/dcn35/dcn35_opp.h   |    4 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |   38 +-
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |  131 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.h |    2 +
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |    1 +
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |    1 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |    1 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |    1 +
 .../display/dc/resource/dce100/dce100_resource.c   |   38 +-
 .../display/dc/resource/dce110/dce110_resource.c   |    7 +-
 .../display/dc/resource/dce112/dce112_resource.c   |    9 +-
 .../display/dc/resource/dce120/dce120_resource.c   |    9 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |   29 +-
 .../amd/display/dc/resource/dce80/dce80_resource.c |   34 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |    7 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   35 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |   36 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    6 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    6 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |    6 +-
 .../display/dc/resource/dcn302/dcn302_resource.c   |    6 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |    6 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    6 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |    6 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |    7 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |    6 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   13 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    6 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    8 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |    8 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |    8 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   10 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |    3 +-
 .../dcn401/dcn401_soc_and_ip_translator.h          |    2 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |   15 +
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_types.h |    1 +
 .../display/dc/virtual/virtual_stream_encoder.c    |    7 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   32 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  719 ++++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |   50 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   40 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |    2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |   17 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   33 +-
 .../drm/amd/display/include/bios_parser_types.h    |   11 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   16 +
 .../amd/display/include/grph_object_ctrl_defs.h    |    1 +
 .../gpu/drm/amd/display/include/grph_object_id.h   |    7 +
 drivers/gpu/drm/amd/display/include/signal_types.h |   12 +
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.c    |    6 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |    3 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   13 +-
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   87 +-
 .../amd/display/modules/hdcp/hdcp2_transition.c    |   61 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |    2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    |  122 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.h    |    6 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |  148 +-
 .../drm/amd/display/modules/power/power_helpers.c  |   33 +
 .../drm/amd/display/modules/power/power_helpers.h  |    5 +
 drivers/gpu/drm/amd/include/amd_shared.h           |    1 +
 .../gpu/drm/amd/include/asic_reg/vce/vce_1_0_d.h   |    5 +
 .../drm/amd/include/asic_reg/vce/vce_1_0_sh_mask.h |   10 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  125 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    3 +-
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    3 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   22 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   33 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    3 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   28 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h         |  557 ----
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   10 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu10_smumgr.c |    4 +-
 .../drm/amd/pm/powerplay/smumgr/vega10_smumgr.c    |    4 +-
 .../drm/amd/pm/powerplay/smumgr/vega12_smumgr.c    |    4 +-
 .../drm/amd/pm/powerplay/smumgr/vega20_smumgr.c    |    8 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   95 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   21 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |    9 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h  |   20 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   14 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   17 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   23 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |    7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |  247 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  326 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |  165 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |    5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   67 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |    1 +
 drivers/gpu/drm/amd/ras/Makefile                   |   34 +
 drivers/gpu/drm/amd/ras/ras_mgr/Makefile           |   33 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c   |  285 ++
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.h   |   54 +
 .../drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.c    |  182 ++
 .../drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.h    |   27 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c   |  648 +++++
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h   |   83 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c |   94 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.h |   30 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.c |  125 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.h |   30 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c   |  190 ++
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h   |   41 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c   |  279 ++
 drivers/gpu/drm/amd/ras/ras_mgr/ras_sys.h          |  110 +
 drivers/gpu/drm/amd/ras/rascore/Makefile           |   44 +
 drivers/gpu/drm/amd/ras/rascore/ras.h              |  370 +++
 drivers/gpu/drm/amd/ras/rascore/ras_aca.c          |  672 +++++
 drivers/gpu/drm/amd/ras/rascore/ras_aca.h          |  164 ++
 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.c     |  379 +++
 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.h     |   71 +
 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c          |  522 ++++
 drivers/gpu/drm/amd/ras/rascore/ras_cmd.h          |  426 +++
 drivers/gpu/drm/amd/ras/rascore/ras_core.c         |  603 +++++
 drivers/gpu/drm/amd/ras/rascore/ras_cper.c         |  315 +++
 drivers/gpu/drm/amd/ras/rascore/ras_cper.h         |  304 +++
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c       | 1339 +++++++++
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h       |  197 ++
 drivers/gpu/drm/amd/ras/rascore/ras_gfx.c          |   70 +
 drivers/gpu/drm/amd/ras/rascore/ras_gfx.h          |   43 +
 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.c     |  426 +++
 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.h     |  259 ++
 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.c     |  317 +++
 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.h     |   93 +
 drivers/gpu/drm/amd/ras/rascore/ras_mp1.c          |   81 +
 drivers/gpu/drm/amd/ras/rascore/ras_mp1.h          |   50 +
 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.c    |  105 +
 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.h    |   30 +
 drivers/gpu/drm/amd/ras/rascore/ras_nbio.c         |   96 +
 drivers/gpu/drm/amd/ras/rascore/ras_nbio.h         |   46 +
 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.c    |  123 +
 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.h    |   31 +
 drivers/gpu/drm/amd/ras/rascore/ras_process.c      |  322 +++
 drivers/gpu/drm/amd/ras/rascore/ras_process.h      |   53 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp.c          |  750 +++++
 drivers/gpu/drm/amd/ras/rascore/ras_psp.h          |  145 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.c    |   46 +
 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.h    |   31 +
 drivers/gpu/drm/amd/ras/rascore/ras_ta_if.h        |  231 ++
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c          |  707 +++++
 drivers/gpu/drm/amd/ras/rascore/ras_umc.h          |  166 ++
 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.c    |  511 ++++
 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h    |  314 +++
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   31 +-
 .../drm/arm/display/komeda/komeda_framebuffer.c    |    1 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |    1 +
 drivers/gpu/drm/arm/hdlcd_drv.c                    |    1 +
 drivers/gpu/drm/arm/malidp_drv.c                   |    1 +
 drivers/gpu/drm/arm/malidp_mw.c                    |    1 +
 drivers/gpu/drm/arm/malidp_planes.c                |    2 +-
 drivers/gpu/drm/armada/armada_crtc.c               |    1 +
 drivers/gpu/drm/armada/armada_debugfs.c            |    1 +
 drivers/gpu/drm/armada/armada_fb.c                 |    1 +
 drivers/gpu/drm/armada/armada_fbdev.c              |   15 +-
 drivers/gpu/drm/armada/armada_gem.c                |    1 +
 drivers/gpu/drm/armada/armada_overlay.c            |    1 +
 drivers/gpu/drm/armada/armada_plane.c              |    8 +-
 drivers/gpu/drm/ast/Makefile                       |    3 +-
 drivers/gpu/drm/ast/ast_2000.c                     |  108 +
 drivers/gpu/drm/ast/ast_2100.c                     |   92 +
 drivers/gpu/drm/ast/ast_2200.c                     |   92 +
 drivers/gpu/drm/ast/ast_2300.c                     |  135 +
 drivers/gpu/drm/ast/ast_2400.c                     |  100 +
 drivers/gpu/drm/ast/ast_2500.c                     |  106 +
 drivers/gpu/drm/ast/ast_2600.c                     |   72 +
 drivers/gpu/drm/ast/ast_drv.c                      |   69 +-
 drivers/gpu/drm/ast/ast_drv.h                      |  100 +-
 drivers/gpu/drm/ast/ast_main.c                     |  268 --
 drivers/gpu/drm/ast/ast_mode.c                     |   58 +-
 drivers/gpu/drm/ast/ast_tables.h                   |   60 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   21 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   15 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |    3 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |    3 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |   53 +-
 drivers/gpu/drm/bridge/imx/Kconfig                 |   11 +
 drivers/gpu/drm/bridge/imx/Makefile                |    1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c       |  158 ++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |   65 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    7 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   68 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |   10 +
 drivers/gpu/drm/bridge/synopsys/Kconfig            |    8 +
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |    2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |    5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  235 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       |   14 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   18 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  112 +
 drivers/gpu/drm/clients/drm_fbdev_client.c         |   37 +-
 drivers/gpu/drm/clients/drm_log.c                  |   43 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   69 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  232 +-
 drivers/gpu/drm/drm_atomic.c                       |  225 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   24 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |    5 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |  160 ++
 drivers/gpu/drm/drm_bridge.c                       |   67 +-
 drivers/gpu/drm/drm_buddy.c                        |  391 +--
 drivers/gpu/drm/drm_client.c                       |  200 +-
 drivers/gpu/drm/drm_client_event.c                 |   29 +-
 drivers/gpu/drm/drm_client_modeset.c               |   44 +
 drivers/gpu/drm/drm_client_sysrq.c                 |   65 +
 drivers/gpu/drm/drm_color_mgmt.c                   |   43 +
 drivers/gpu/drm/drm_colorop.c                      |  599 ++++
 drivers/gpu/drm/drm_connector.c                    |    1 +
 drivers/gpu/drm/drm_crtc.c                         |   35 +
 drivers/gpu/drm/drm_crtc_internal.h                |    1 +
 drivers/gpu/drm/drm_displayid.c                    |   58 +-
 drivers/gpu/drm/drm_displayid_internal.h           |    2 +
 drivers/gpu/drm/drm_drv.c                          |    3 +
 drivers/gpu/drm/drm_dumb_buffers.c                 |  171 +-
 drivers/gpu/drm/drm_edid.c                         |    3 +
 drivers/gpu/drm/drm_fb_helper.c                    |  138 +-
 drivers/gpu/drm/drm_fbdev_dma.c                    |   25 +-
 drivers/gpu/drm/drm_fbdev_shmem.c                  |   21 +-
 drivers/gpu/drm/drm_fbdev_ttm.c                    |   24 +-
 drivers/gpu/drm/drm_file.c                         |    2 +-
 drivers/gpu/drm/drm_format_helper.c                |   91 -
 drivers/gpu/drm/drm_framebuffer.c                  |    2 +-
 drivers/gpu/drm/drm_gem.c                          |   28 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |    2 -
 drivers/gpu/drm/drm_gem_dma_helper.c               |   10 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  136 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |    1 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   11 +-
 drivers/gpu/drm/drm_gpusvm.c                       |    6 +-
 drivers/gpu/drm/drm_gpuvm.c                        |  191 ++
 drivers/gpu/drm/drm_internal.h                     |   11 +
 drivers/gpu/drm/drm_ioctl.c                        |    7 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |    3 +-
 drivers/gpu/drm/drm_mm.c                           |    1 +
 drivers/gpu/drm/drm_mode_config.c                  |    7 +
 drivers/gpu/drm/drm_mode_object.c                  |   18 +
 drivers/gpu/drm/drm_modeset_helper.c               |    6 +-
 drivers/gpu/drm/drm_plane.c                        |   59 +
 drivers/gpu/drm/drm_prime.c                        |    1 +
 drivers/gpu/drm/drm_vblank.c                       |  174 +-
 drivers/gpu/drm/drm_vblank_helper.c                |  176 ++
 drivers/gpu/drm/drm_vblank_work.c                  |    2 +-
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |    1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |    1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |    1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |    1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |    2 +
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c             |   32 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |    2 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |    1 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |    1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |    1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   12 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |    1 +
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |    1 +
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |    9 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            |    1 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |    3 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |    1 +
 drivers/gpu/drm/exynos/exynos_mixer.c              |    1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |    1 +
 drivers/gpu/drm/gma500/backlight.c                 |    2 +
 drivers/gpu/drm/gma500/cdv_device.c                |    1 +
 drivers/gpu/drm/gma500/cdv_intel_display.c         |    1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |    1 +
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |    1 +
 drivers/gpu/drm/gma500/fbdev.c                     |   58 +-
 drivers/gpu/drm/gma500/gem.c                       |    1 +
 drivers/gpu/drm/gma500/intel_bios.c                |    1 +
 drivers/gpu/drm/gma500/intel_gmbus.c               |    2 +
 drivers/gpu/drm/gma500/mid_bios.c                  |    1 +
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |    1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |    1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c         |    3 +
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |    1 +
 drivers/gpu/drm/gma500/opregion.c                  |    3 +
 drivers/gpu/drm/gma500/psb_drv.c                   |    1 +
 drivers/gpu/drm/gma500/psb_intel_display.c         |    1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |    1 +
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |    1 +
 drivers/gpu/drm/gma500/psb_irq.c                   |   37 +-
 drivers/gpu/drm/gud/gud_connector.c                |    8 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   45 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   12 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    1 +
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    1 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   12 +
 drivers/gpu/drm/i915/Makefile                      |   13 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |    2 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |   65 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   34 +-
 drivers/gpu/drm/i915/display/i9xx_plane.h          |    5 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    9 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   39 +-
 drivers/gpu/drm/i915/display/intel_acpi.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |   91 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |    9 +-
 drivers/gpu/drm/i915/display/intel_bo.c            |   40 +-
 drivers/gpu/drm/i915/display/intel_bo.h            |    8 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  363 +--
 drivers/gpu/drm/i915/display/intel_bw.h            |    6 +-
 drivers/gpu/drm/i915/display/intel_casf.c          |  290 ++
 drivers/gpu/drm/i915/display/intel_casf.h          |   21 +
 drivers/gpu/drm/i915/display/intel_casf_regs.h     |   33 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  524 +++-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |   16 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   17 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |    3 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   16 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   99 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |   11 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   16 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |   32 +-
 drivers/gpu/drm/i915/display/intel_cursor.h        |    2 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  263 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   21 +
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   32 +-
 drivers/gpu/drm/i915/display/intel_dbuf_bw.c       |  295 ++
 drivers/gpu/drm/i915/display/intel_dbuf_bw.h       |   37 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   77 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |   83 +-
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h |    9 +
 drivers/gpu/drm/i915/display/intel_de.h            |  143 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  362 ++-
 drivers/gpu/drm/i915/display/intel_display.h       |   16 +-
 .../drm/i915/display/intel_display_conversion.c    |   20 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   34 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   12 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   19 +-
 .../gpu/drm/i915/display/intel_display_device.h    |   13 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   23 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  129 +-
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    8 +-
 .../gpu/drm/i915/display/intel_display_jiffies.h   |   43 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   21 +-
 .../gpu/drm/i915/display/intel_display_power_map.c |   26 +-
 .../drm/i915/display/intel_display_power_well.c    |   58 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    1 +
 drivers/gpu/drm/i915/display/intel_display_rpm.c   |   33 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   73 +-
 drivers/gpu/drm/i915/display/intel_display_utils.c |   32 +
 drivers/gpu/drm/i915/display/intel_display_utils.h |   31 +
 drivers/gpu/drm/i915/display/intel_display_wa.c    |    5 +-
 drivers/gpu/drm/i915/display/intel_display_wa.h    |    1 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |   68 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c        |   25 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  263 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |   12 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |    8 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |   14 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   49 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   12 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   35 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   29 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   11 +
 drivers/gpu/drm/i915/display/intel_dpt.c           |    2 +
 drivers/gpu/drm/i915/display/intel_dsb.c           |   57 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |    4 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |   37 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |   41 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |    4 +-
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |    3 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    2 +
 drivers/gpu/drm/i915/display/intel_fbc.c           |  203 +-
 drivers/gpu/drm/i915/display/intel_fbc.h           |    3 +
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   72 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |   60 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |   14 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_flipq.c         |   14 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |  156 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |   18 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |    3 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   51 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |    2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   20 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h          |    1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    5 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    5 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c       |   17 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h       |    2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.c        | 2327 ++++++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h        |   47 +
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h   |   90 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   14 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    2 +
 drivers/gpu/drm/i915/display/intel_overlay.c       |    7 +-
 drivers/gpu/drm/i915/display/intel_pch.c           |    4 +-
 drivers/gpu/drm/i915/display/intel_pch_display.c   |   12 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |   12 +-
 drivers/gpu/drm/i915/display/intel_pfit.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    2 +
 drivers/gpu/drm/i915/display/intel_plane.c         |   65 +-
 drivers/gpu/drm/i915/display/intel_plane.h         |    3 -
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   13 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   21 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |    3 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  439 ++-
 drivers/gpu/drm/i915/display/intel_psr.h           |    5 +-
 drivers/gpu/drm/i915/display/intel_qp_tables.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_sbi.c           |    6 +-
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |    2 +
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   10 +-
 drivers/gpu/drm/i915/display/intel_sprite.c        |   12 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   23 +-
 drivers/gpu/drm/i915/display/intel_tc.h            |    3 +
 drivers/gpu/drm/i915/display/intel_vblank.c        |   16 +-
 drivers/gpu/drm/i915/display/intel_vblank.h        |    2 +
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   26 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h          |    3 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |  502 ++--
 drivers/gpu/drm/i915/display/intel_vrr.h           |    5 +-
 drivers/gpu/drm/i915/display/skl_prefill.c         |  157 ++
 drivers/gpu/drm/i915/display/skl_prefill.h         |   46 +
 drivers/gpu/drm/i915/display/skl_scaler.c          |  234 +-
 drivers/gpu/drm/i915/display/skl_scaler.h          |   17 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  193 +-
 .../drm/i915/display/skl_universal_plane_regs.h    |   24 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  383 +--
 drivers/gpu/drm/i915/display/skl_watermark.h       |    3 +
 drivers/gpu/drm/i915/display/skl_watermark_regs.h  |   52 +-
 drivers/gpu/drm/i915/display/vlv_clock.c           |   88 +
 drivers/gpu/drm/i915/display/vlv_clock.h           |   38 +
 drivers/gpu/drm/i915/display/vlv_dsi.c             |   56 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |    8 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c         |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   17 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    1 +
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.c |  103 +
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h |   54 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |    4 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |   15 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |  105 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   34 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    8 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    2 +
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |    7 +
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |    2 +
 .../drm/i915/gem/selftests/i915_gem_client_blt.c   |    2 +
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  |    3 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |    2 +
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c           |    8 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c           |    2 +
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |    2 +
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c   |    3 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c        |    2 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |    2 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |    1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |    2 +
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |    1 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |    2 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |    2 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    2 +
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    2 +
 drivers/gpu/drm/i915/gt/intel_rc6.c                |    5 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c        |    2 +
 drivers/gpu/drm/i915/gt/intel_renderstate.c        |    2 +
 drivers/gpu/drm/i915/gt/intel_rps.c                |   18 +-
 drivers/gpu/drm/i915/gt/intel_sa_media.c           |    1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c               |    2 +
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c       |    2 +
 drivers/gpu/drm/i915/gt/intel_timeline.c           |    1 +
 drivers/gpu/drm/i915/gt/intel_tlb.h                |    2 +-
 drivers/gpu/drm/i915/gt/intel_wopcm.c              |    2 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    9 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |    2 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c       |    3 +
 drivers/gpu/drm/i915/gt/selftest_migrate.c         |    9 +-
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c  |    2 +
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |    2 +
 drivers/gpu/drm/i915/gvt/cfg_space.c               |    2 +
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |    2 +
 drivers/gpu/drm/i915/gvt/display.c                 |    1 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |    1 +
 drivers/gpu/drm/i915/gvt/edid.c                    |    1 +
 drivers/gpu/drm/i915/gvt/gtt.c                     |    2 +
 drivers/gpu/drm/i915/gvt/handlers.c                |    1 +
 drivers/gpu/drm/i915/gvt/interrupt.c               |    2 +
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |   36 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |    7 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c            |    2 +
 drivers/gpu/drm/i915/gvt/scheduler.c               |    2 +
 drivers/gpu/drm/i915/gvt/vgpu.c                    |    2 +
 drivers/gpu/drm/i915/i915_cmd_parser.c             |    1 +
 drivers/gpu/drm/i915/i915_config.c                 |    2 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    1 +
 drivers/gpu/drm/i915/i915_driver.c                 |  155 +-
 drivers/gpu/drm/i915/i915_driver.h                 |    2 +
 drivers/gpu/drm/i915/i915_drv.h                    |   23 +-
 drivers/gpu/drm/i915/i915_gem.c                    |    3 +
 drivers/gpu/drm/i915/i915_getparam.c               |    2 +
 drivers/gpu/drm/i915/i915_irq.c                    |  106 +-
 drivers/gpu/drm/i915/i915_jiffies.h                |   16 +
 drivers/gpu/drm/i915/i915_mmio_range.c             |   18 +
 drivers/gpu/drm/i915/i915_mmio_range.h             |   19 +
 drivers/gpu/drm/i915/i915_module.c                 |    1 +
 drivers/gpu/drm/i915/i915_perf.c                   |   67 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |    6 +-
 drivers/gpu/drm/i915/i915_query.c                  |    2 +
 drivers/gpu/drm/i915/i915_reg.h                    |    1 +
 drivers/gpu/drm/i915/i915_reg_defs.h               |   10 +
 drivers/gpu/drm/i915/i915_request.c                |    2 +
 drivers/gpu/drm/i915/i915_switcheroo.c             |    2 +
 drivers/gpu/drm/i915/i915_sysfs.c                  |    2 +
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |    4 +-
 drivers/gpu/drm/i915/i915_utils.c                  |    1 +
 drivers/gpu/drm/i915/i915_utils.h                  |   41 +-
 drivers/gpu/drm/i915/i915_vgpu.c                   |    2 +
 drivers/gpu/drm/i915/i915_vma.c                    |   10 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |    2 +
 drivers/gpu/drm/i915/intel_gvt.c                   |    2 +
 drivers/gpu/drm/i915/intel_memory_region.c         |    1 +
 drivers/gpu/drm/i915/intel_pcode.c                 |    2 +
 drivers/gpu/drm/i915/intel_region_ttm.c            |    2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |   77 +
 drivers/gpu/drm/i915/intel_runtime_pm.h            |    3 +
 drivers/gpu/drm/i915/intel_step.c                  |    2 +
 drivers/gpu/drm/i915/intel_uncore.c                |   16 +-
 drivers/gpu/drm/i915/intel_uncore.h                |    8 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |    2 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c               |    2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c         |    2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c           |    2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    2 +
 drivers/gpu/drm/i915/selftests/i915_active.c       |    2 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c      |    4 +
 drivers/gpu/drm/i915/selftests/i915_request.c      |    2 +
 drivers/gpu/drm/i915/selftests/i915_selftest.c     |    1 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c      |    4 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |    4 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   15 +-
 drivers/gpu/drm/i915/soc/intel_dram.h              |    1 +
 drivers/gpu/drm/i915/soc/intel_gmch.c              |    1 +
 drivers/gpu/drm/i915/soc/intel_rom.c               |    7 +-
 drivers/gpu/drm/i915/soc/intel_rom.h               |    6 +-
 drivers/gpu/drm/i915/vlv_iosf_sb.c                 |    2 +
 drivers/gpu/drm/imagination/pvr_ccb.c              |    1 +
 drivers/gpu/drm/imagination/pvr_device.c           |    2 +-
 drivers/gpu/drm/imagination/pvr_fw.c               |    1 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |    2 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |    1 +
 drivers/gpu/drm/imagination/pvr_power.c            |    1 +
 drivers/gpu/drm/imagination/pvr_vm.c               |    1 +
 drivers/gpu/drm/imx/dc/dc-ed.c                     |    8 +-
 drivers/gpu/drm/imx/dc/dc-fg.c                     |    4 +-
 drivers/gpu/drm/imx/dc/dc-fu.c                     |   10 +-
 drivers/gpu/drm/imx/dc/dc-fu.h                     |    4 +-
 drivers/gpu/drm/imx/dc/dc-lb.c                     |   28 +-
 drivers/gpu/drm/imx/dc/dc-plane.c                  |    2 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |    5 +-
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |    1 -
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   29 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |    1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   18 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |    4 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |    5 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   13 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |    4 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |    1 +
 drivers/gpu/drm/kmb/kmb_plane.c                    |    4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    2 +
 drivers/gpu/drm/logicvc/logicvc_layer.c            |    4 +-
 drivers/gpu/drm/loongson/lsdc_benchmark.c          |    1 +
 drivers/gpu/drm/loongson/lsdc_crtc.c               |    1 +
 drivers/gpu/drm/loongson/lsdc_debugfs.c            |    1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                |    1 +
 drivers/gpu/drm/loongson/lsdc_gem.c                |   32 +-
 drivers/gpu/drm/loongson/lsdc_i2c.c                |    1 +
 drivers/gpu/drm/loongson/lsdc_irq.c                |    1 +
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c      |    1 +
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c      |    1 +
 drivers/gpu/drm/loongson/lsdc_pixpll.c             |    1 +
 drivers/gpu/drm/loongson/lsdc_plane.c              |    3 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c                |    4 +-
 drivers/gpu/drm/mcde/mcde_clk_div.c                |   13 +-
 drivers/gpu/drm/mcde/mcde_display.c                |    1 +
 drivers/gpu/drm/mediatek/Kconfig                   |   23 +-
 drivers/gpu/drm/mediatek/Makefile                  |    3 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                |    1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            |   33 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h            |    2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |   23 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   12 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    4 +-
 drivers/gpu/drm/mediatek/mtk_gem.c                 |    1 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  539 +---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |  456 ++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |  198 ++
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c         |  396 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h        |  263 ++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 1521 +++++++++++
 drivers/gpu/drm/mediatek/mtk_plane.c               |    4 +-
 drivers/gpu/drm/meson/meson_overlay.c              |    1 +
 drivers/gpu/drm/meson/meson_plane.c                |    1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200.c             |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh5.c          |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |    1 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |    1 +
 drivers/gpu/drm/mgag200/mgag200_vga.c              |    1 +
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c          |    1 +
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   13 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   54 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   61 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  385 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  332 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  438 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   29 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   74 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   74 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1201 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 +--
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 +--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   12 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   56 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  541 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  115 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   47 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  426 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   10 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |    3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |    3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |    7 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       |   13 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    9 +
 drivers/gpu/drm/msm/dp/dp_link.c                   |  117 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/gpu/drm/msm/msm_fbdev.c                    |   11 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   30 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   28 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   21 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |    2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 2181 +++++++++++----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +-
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  121 +
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  299 ++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  351 ++-
 drivers/gpu/drm/msm/registers/gen_header.py        |   19 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |    1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |    1 +
 drivers/gpu/drm/nouveau/Kconfig                    |    1 +
 drivers/gpu/drm/nouveau/include/nvfw/hs.h          |    4 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |    2 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h  |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |   11 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    5 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c         |   20 +
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |    6 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |  102 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |    1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild     |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h    |    1 +
 .../drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c    |  320 +++
 .../drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h    |   24 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c    |  185 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h    |   18 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c     |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c      |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |   67 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c |    4 +-
 drivers/gpu/drm/nova/Kconfig                       |    2 +
 drivers/gpu/drm/omapdrm/omap_crtc.c                |    1 +
 drivers/gpu/drm/omapdrm/omap_debugfs.c             |    1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |    2 +
 drivers/gpu/drm/omapdrm/omap_drv.c                 |    1 +
 drivers/gpu/drm/omapdrm/omap_encoder.c             |    4 +-
 drivers/gpu/drm/omapdrm/omap_fb.c                  |    1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   12 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |   16 +-
 drivers/gpu/drm/omapdrm/omap_irq.c                 |    1 +
 drivers/gpu/drm/omapdrm/omap_overlay.c             |    1 +
 drivers/gpu/drm/omapdrm/omap_plane.c               |    3 +-
 drivers/gpu/drm/panel/Kconfig                      |   59 +-
 drivers/gpu/drm/panel/Makefile                     |    4 +
 drivers/gpu/drm/panel/panel-edp.c                  |   10 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 1323 ++++++---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |   69 +
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |   21 +-
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c          |  184 ++
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |  580 ++--
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |    8 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c   |  385 +++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  105 +-
 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c    |  225 ++
 drivers/gpu/drm/panel/panel-simple.c               |  127 +-
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       |  277 ++
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   71 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    6 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   68 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   24 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  243 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c           |    8 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c            |    9 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |    4 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   68 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |  346 ++-
 drivers/gpu/drm/panfrost/panfrost_job.h            |   38 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  115 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.h            |    3 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   26 +-
 drivers/gpu/drm/panthor/Makefile                   |    1 +
 drivers/gpu/drm/panthor/panthor_devfreq.c          |   62 +-
 drivers/gpu/drm/panthor/panthor_devfreq.h          |    2 +
 drivers/gpu/drm/panthor/panthor_device.c           |   43 +-
 drivers/gpu/drm/panthor/panthor_device.h           |   25 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |   13 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |  134 +-
 drivers/gpu/drm/panthor/panthor_fw.h               |   32 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |   21 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |   38 +-
 drivers/gpu/drm/panthor/panthor_gpu.h              |    1 +
 drivers/gpu/drm/panthor/panthor_heap.c             |    1 +
 drivers/gpu/drm/panthor/panthor_hw.c               |  109 +-
 drivers/gpu/drm/panthor/panthor_hw.h               |   47 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |  146 +-
 drivers/gpu/drm/panthor/panthor_pwr.c              |  549 ++++
 drivers/gpu/drm/panthor/panthor_pwr.h              |   23 +
 drivers/gpu/drm/panthor/panthor_regs.h             |   83 +
 drivers/gpu/drm/panthor/panthor_sched.c            |  368 ++-
 drivers/gpu/drm/panthor/panthor_sched.h            |    3 +-
 drivers/gpu/drm/pl111/pl111_display.c              |   14 +-
 drivers/gpu/drm/qxl/qxl_cmd.c                      |    1 +
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |    1 +
 drivers/gpu/drm/qxl/qxl_display.c                  |   30 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |    1 +
 drivers/gpu/drm/qxl/qxl_gem.c                      |    3 +-
 drivers/gpu/drm/qxl/qxl_image.c                    |    2 +
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |    2 +
 drivers/gpu/drm/qxl/qxl_irq.c                      |    1 +
 drivers/gpu/drm/qxl/qxl_kms.c                      |    1 +
 drivers/gpu/drm/qxl/qxl_release.c                  |    2 +
 drivers/gpu/drm/qxl/qxl_ttm.c                      |    3 +-
 drivers/gpu/drm/radeon/radeon.h                    |    1 +
 drivers/gpu/drm/radeon/radeon_acpi.c               |    1 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |   20 +-
 drivers/gpu/drm/radeon/radeon_device.c             |    4 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    2 -
 drivers/gpu/drm/radeon/radeon_drv.c                |   88 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   17 +-
 drivers/gpu/drm/radeon/radeon_fence.c              |    7 -
 drivers/gpu/drm/radeon/radeon_gem.c                |    2 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |    4 -
 drivers/gpu/drm/radeon/radeon_ttm.c                |    6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c     |    3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |    1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |    7 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   50 +-
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |  387 +--
 drivers/gpu/drm/renesas/rz-du/Kconfig              |    2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |    1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   42 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |    1 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.c              |    2 +
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   21 +
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  191 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |    1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    4 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    7 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  140 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |    1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |   49 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    1 +
 drivers/gpu/drm/scheduler/sched_main.c             |   20 +-
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |    3 +-
 drivers/gpu/drm/sitronix/st7571-i2c.c              |    3 +-
 drivers/gpu/drm/sitronix/st7586.c                  |    1 +
 drivers/gpu/drm/sitronix/st7735r.c                 |    1 +
 drivers/gpu/drm/solomon/ssd130x.c                  |   87 +-
 drivers/gpu/drm/sti/sti_cursor.c                   |    1 +
 drivers/gpu/drm/sti/sti_drv.c                      |   19 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |    1 +
 drivers/gpu/drm/sti/sti_hda.c                      |    5 +
 drivers/gpu/drm/sti/sti_hdmi.c                     |    2 +
 drivers/gpu/drm/sti/sti_hqvdp.c                    |    1 +
 drivers/gpu/drm/sti/sti_plane.c                    |    1 +
 drivers/gpu/drm/stm/drv.c                          |    1 +
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |   14 +-
 drivers/gpu/drm/stm/ltdc.c                         |    1 +
 drivers/gpu/drm/stm/lvds.c                         |   12 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |    1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |    1 +
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |    1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c         |   12 +-
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c            |   18 +-
 drivers/gpu/drm/sun4i/sun8i_csc.c                  |  125 +-
 drivers/gpu/drm/sun4i/sun8i_csc.h                  |   16 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  218 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |   65 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |  199 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h             |    7 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c            |   44 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.h            |    4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |  248 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h             |    7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c            |   51 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h            |    6 +-
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   34 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |  153 +-
 drivers/gpu/drm/sysfb/efidrm.c                     |    1 +
 drivers/gpu/drm/sysfb/ofdrm.c                      |    1 +
 drivers/gpu/drm/sysfb/simpledrm.c                  |    4 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |    4 +-
 drivers/gpu/drm/tegra/Makefile                     |    1 +
 drivers/gpu/drm/tegra/dc.c                         |    3 +-
 drivers/gpu/drm/tegra/drm.c                        |    3 +
 drivers/gpu/drm/tegra/drm.h                        |    1 +
 drivers/gpu/drm/tegra/dsi.c                        |   60 +-
 drivers/gpu/drm/tegra/fb.c                         |    1 +
 drivers/gpu/drm/tegra/fbdev.c                      |   11 +-
 drivers/gpu/drm/tegra/gem.c                        |    8 +-
 drivers/gpu/drm/tegra/hdmi.c                       |    5 +-
 drivers/gpu/drm/tegra/hub.c                        |    1 +
 drivers/gpu/drm/tegra/nvjpg.c                      |  330 +++
 drivers/gpu/drm/tegra/sor.c                        |    5 +-
 drivers/gpu/drm/tests/.kunitconfig                 |    2 +
 drivers/gpu/drm/tests/Makefile                     |    3 +-
 drivers/gpu/drm/tests/drm_buddy_test.c             |  105 +
 drivers/gpu/drm/tests/drm_fixp_test.c              |   71 +
 drivers/gpu/drm/tests/drm_mm_test.c                |    1 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   42 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  126 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    6 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |   16 -
 drivers/gpu/drm/tidss/tidss_drv.h                  |    2 +
 drivers/gpu/drm/tidss/tidss_kms.c                  |    4 -
 drivers/gpu/drm/tidss/tidss_oldi.c                 |   22 +
 drivers/gpu/drm/tidss/tidss_plane.c                |    8 -
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |    9 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |    3 +-
 drivers/gpu/drm/tiny/bochs.c                       |   11 +
 drivers/gpu/drm/tiny/cirrus-qemu.c                 |   12 +
 drivers/gpu/drm/tiny/gm12u320.c                    |    1 +
 drivers/gpu/drm/tiny/hx8357d.c                     |    1 +
 drivers/gpu/drm/tiny/ili9163.c                     |    1 +
 drivers/gpu/drm/tiny/ili9225.c                     |    1 +
 drivers/gpu/drm/tiny/ili9341.c                     |    1 +
 drivers/gpu/drm/tiny/ili9486.c                     |    1 +
 drivers/gpu/drm/tiny/mi0283qt.c                    |    1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    1 +
 drivers/gpu/drm/tiny/pixpaper.c                    |    1 +
 drivers/gpu/drm/tiny/repaper.c                     |    1 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   28 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |   73 +-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c        |   33 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |   22 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h      |    7 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c       |    1 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c          |   24 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |    5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   67 +-
 drivers/gpu/drm/ttm/ttm_bo_internal.h              |    2 +
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   38 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |    9 +-
 drivers/gpu/drm/ttm/ttm_module.c                   |    3 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |   45 +-
 drivers/gpu/drm/ttm/ttm_pool_internal.h            |   25 +
 drivers/gpu/drm/ttm/ttm_resource.c                 |   35 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |   11 +-
 drivers/gpu/drm/tve200/tve200_display.c            |    1 +
 drivers/gpu/drm/udl/udl_edid.c                     |    1 +
 drivers/gpu/drm/v3d/v3d_bo.c                       |    2 +
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |    1 +
 drivers/gpu/drm/v3d/v3d_drv.c                      |    1 +
 drivers/gpu/drm/v3d/v3d_gem.c                      |    1 +
 drivers/gpu/drm/v3d/v3d_gemfs.c                    |    2 +
 drivers/gpu/drm/v3d/v3d_irq.c                      |    2 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |    1 +
 drivers/gpu/drm/v3d/v3d_submit.c                   |    1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c               |    1 +
 drivers/gpu/drm/vboxvideo/vbox_main.c              |    1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |    9 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |    1 +
 drivers/gpu/drm/vc4/Kconfig                        |    1 +
 drivers/gpu/drm/vc4/vc4_bo.c                       |    1 +
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |    1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_dsi.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_gem.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  138 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    1 -
 drivers/gpu/drm/vc4/vc4_hvs.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_irq.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |    2 +
 drivers/gpu/drm/vc4/vc4_plane.c                    |    7 +-
 drivers/gpu/drm/vc4/vc4_render_cl.c                |    2 +
 drivers/gpu/drm/vc4/vc4_txp.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_v3d.c                      |    2 +
 drivers/gpu/drm/vc4/vc4_validate.c                 |    2 +
 drivers/gpu/drm/vc4/vc4_validate_shaders.c         |    2 +
 drivers/gpu/drm/vc4/vc4_vec.c                      |    1 +
 drivers/gpu/drm/vgem/vgem_fence.c                  |    2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |    1 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   37 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c               |    1 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |    2 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             |    1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c                |    1 +
 drivers/gpu/drm/vkms/Kconfig                       |    1 +
 drivers/gpu/drm/vkms/Makefile                      |    5 +-
 drivers/gpu/drm/vkms/tests/Makefile                |    3 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c       |  414 +++
 drivers/gpu/drm/vkms/tests/vkms_config_test.c      |   71 +-
 drivers/gpu/drm/vkms/vkms_colorop.c                |  120 +
 drivers/gpu/drm/vkms/vkms_composer.c               |  136 +-
 drivers/gpu/drm/vkms/vkms_composer.h               |   28 +
 drivers/gpu/drm/vkms/vkms_config.c                 |   15 +-
 drivers/gpu/drm/vkms/vkms_config.h                 |   54 +-
 drivers/gpu/drm/vkms/vkms_configfs.c               |  843 ++++++
 drivers/gpu/drm/vkms/vkms_configfs.h               |    8 +
 drivers/gpu/drm/vkms/vkms_connector.c              |   35 +
 drivers/gpu/drm/vkms/vkms_connector.h              |    9 +
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   88 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   27 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   34 +-
 drivers/gpu/drm/vkms/vkms_luts.c                   |  811 ++++++
 drivers/gpu/drm/vkms/vkms_luts.h                   |   12 +
 drivers/gpu/drm/vkms/vkms_output.c                 |    7 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   10 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |    1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |    3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   21 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |    6 +-
 drivers/gpu/drm/xe/Kconfig.debug                   |   22 +-
 drivers/gpu/drm/xe/Makefile                        |   20 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |    8 -
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |    4 +-
 .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |   79 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |    4 -
 .../xe/compat-i915-headers/i915_scheduler_types.h  |   13 -
 .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |    9 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h  |    2 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   31 +-
 drivers/gpu/drm/xe/display/ext/i915_utils.c        |   27 -
 drivers/gpu/drm/xe/display/intel_bo.c              |   60 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c           |    3 +-
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   72 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   23 +-
 drivers/gpu/drm/xe/display/xe_display.h            |    4 +-
 drivers/gpu/drm/xe/display/xe_display_rpm.c        |   61 +-
 drivers/gpu/drm/xe/display/xe_display_rpm.h        |   11 +
 drivers/gpu/drm/xe/display/xe_display_wa.c         |    3 +-
 drivers/gpu/drm/xe/display/xe_panic.c              |   50 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    4 +-
 drivers/gpu/drm/xe/display/xe_stolen.c             |  123 +
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h  |    6 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |    4 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   30 +-
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h              |    3 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h              |    8 +-
 drivers/gpu/drm/xe/regs/xe_pmt.h                   |    1 +
 drivers/gpu/drm/xe/regs/xe_regs.h                  |    2 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |   17 +-
 .../gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c |  208 ++
 drivers/gpu/drm/xe/tests/xe_pci.c                  |    6 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.c             |   16 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c             |    6 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  117 +-
 drivers/gpu/drm/xe/xe_bo.h                         |    4 +-
 drivers/gpu/drm/xe/xe_bo_doc.h                     |    8 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                   |    9 +
 drivers/gpu/drm/xe/xe_configfs.c                   |  283 +-
 drivers/gpu/drm/xe/xe_configfs.h                   |    8 +
 drivers/gpu/drm/xe/xe_debugfs.c                    |   16 +-
 drivers/gpu/drm/xe/xe_device.c                     |   79 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c               |   10 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   55 +-
 drivers/gpu/drm/xe/xe_device_wa_oob.rules          |    3 +
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   41 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |   36 +-
 drivers/gpu/drm/xe/xe_exec.c                       |   28 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  233 +-
 drivers/gpu/drm/xe/xe_exec_queue.h                 |   28 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h           |   13 +
 drivers/gpu/drm/xe/xe_execlist.c                   |    2 +-
 drivers/gpu/drm/xe/xe_force_wake_types.h           |   26 +-
 drivers/gpu/drm/xe/xe_ggtt.c                       |  174 +-
 drivers/gpu/drm/xe/xe_ggtt.h                       |    3 +
 drivers/gpu/drm/xe/xe_ggtt_types.h                 |    2 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c              |   27 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h              |   29 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |    4 +-
 drivers/gpu/drm/xe/xe_gt.c                         |   96 +-
 drivers/gpu/drm/xe/xe_gt.h                         |   19 +
 drivers/gpu/drm/xe/xe_gt_clock.c                   |   19 -
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  159 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.h                 |    1 +
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   37 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |   80 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |  679 -----
 drivers/gpu/drm/xe/xe_gt_pagefault.h               |   19 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c                |   36 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |  357 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h         |   16 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c        |  750 ++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h        |   12 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h  |   36 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |  475 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h        |    1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c      | 1123 ++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h      |   46 +-
 .../gpu/drm/xe/xe_gt_sriov_pf_migration_types.h    |   34 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |   21 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h          |    5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_printk.h            |    7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c                |  465 +++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h                |   11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h          |   34 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c                |  375 +--
 drivers/gpu/drm/xe/xe_gt_topology.c                |   24 +-
 drivers/gpu/drm/xe/xe_gt_topology.h                |    4 +-
 drivers/gpu/drm/xe/xe_gt_types.h                   |   79 +-
 drivers/gpu/drm/xe/xe_guard.h                      |  119 +
 drivers/gpu/drm/xe/xe_guc.c                        |  332 +--
 drivers/gpu/drm/xe/xe_guc.h                        |    1 +
 drivers/gpu/drm/xe/xe_guc_ads.c                    |    8 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h              |    2 +-
 drivers/gpu/drm/xe/xe_guc_buf.c                    |   57 +-
 drivers/gpu/drm/xe/xe_guc_buf.h                    |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c                |   29 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                     |  377 +--
 drivers/gpu/drm/xe/xe_guc_ct.h                     |   13 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h               |    2 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h       |   15 +
 drivers/gpu/drm/xe/xe_guc_fwif.h                   |    1 +
 drivers/gpu/drm/xe/xe_guc_log_types.h              |    2 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c              |   95 +
 drivers/gpu/drm/xe/xe_guc_pagefault.h              |   15 +
 drivers/gpu/drm/xe/xe_guc_pc.c                     |  147 +-
 drivers/gpu/drm/xe/xe_guc_pc_types.h               |    4 -
 drivers/gpu/drm/xe/xe_guc_relay.c                  |   17 +-
 drivers/gpu/drm/xe/xe_guc_relay_types.h            |    4 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  606 +++--
 drivers/gpu/drm/xe/xe_guc_submit.h                 |    7 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c              |    2 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c                   |    2 +
 drivers/gpu/drm/xe/xe_huc.c                        |   10 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  |   62 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |    8 -
 drivers/gpu/drm/xe/xe_i2c.c                        |   28 +-
 drivers/gpu/drm/xe/xe_i2c.h                        |    4 +
 drivers/gpu/drm/xe/xe_irq.c                        |  136 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |   11 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   20 +-
 drivers/gpu/drm/xe/xe_lrc.h                        |   16 +-
 drivers/gpu/drm/xe/xe_map.h                        |   22 +-
 drivers/gpu/drm/xe/xe_memirq.c                     |   57 +-
 drivers/gpu/drm/xe/xe_memirq.h                     |    2 +
 drivers/gpu/drm/xe/xe_migrate.c                    |  367 ++-
 drivers/gpu/drm/xe/xe_migrate.h                    |   16 +
 drivers/gpu/drm/xe/xe_migrate_doc.h                |    2 +-
 drivers/gpu/drm/xe/xe_mmio.c                       |   29 +
 drivers/gpu/drm/xe/xe_mmio.h                       |    4 +
 drivers/gpu/drm/xe/xe_mocs.c                       |   42 +-
 drivers/gpu/drm/xe/xe_mocs.h                       |    8 +-
 drivers/gpu/drm/xe/xe_oa.c                         |   20 +-
 drivers/gpu/drm/xe/xe_oa_types.h                   |    3 +
 drivers/gpu/drm/xe/xe_pagefault.c                  |  445 +++
 drivers/gpu/drm/xe/xe_pagefault.h                  |   19 +
 drivers/gpu/drm/xe/xe_pagefault_types.h            |  136 +
 drivers/gpu/drm/xe/xe_pat.c                        |  145 +-
 drivers/gpu/drm/xe/xe_pat.h                        |   12 +-
 drivers/gpu/drm/xe/xe_pci.c                        |  285 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |  115 +-
 drivers/gpu/drm/xe/xe_pci_sriov.h                  |    1 +
 drivers/gpu/drm/xe/xe_pci_types.h                  |   11 +-
 drivers/gpu/drm/xe/xe_pcode.c                      |   40 +-
 drivers/gpu/drm/xe/xe_pcode_api.h                  |    6 -
 drivers/gpu/drm/xe/xe_platform_types.h             |    3 +
 drivers/gpu/drm/xe/xe_pm.c                         |   66 +
 drivers/gpu/drm/xe/xe_pm.h                         |    2 +
 drivers/gpu/drm/xe/xe_pmu.c                        |   11 +-
 drivers/gpu/drm/xe/xe_preempt_fence.c              |   11 +
 drivers/gpu/drm/xe/xe_preempt_fence_types.h        |    2 +-
 drivers/gpu/drm/xe/xe_psmi.c                       |    4 +-
 drivers/gpu/drm/xe/xe_pt.c                         |  110 +-
 drivers/gpu/drm/xe/xe_query.c                      |    2 +-
 drivers/gpu/drm/xe/xe_range_fence.h                |    4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c              |   10 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                   |   23 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |   31 +-
 drivers/gpu/drm/xe/xe_rtp.h                        |   30 +-
 drivers/gpu/drm/xe/xe_rtp_types.h                  |    4 +-
 drivers/gpu/drm/xe/xe_sa.c                         |   21 +
 drivers/gpu/drm/xe/xe_sa.h                         |    1 +
 drivers/gpu/drm/xe/xe_sched_job.c                  |   25 +-
 drivers/gpu/drm/xe/xe_sched_job.h                  |   13 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h            |   11 +-
 drivers/gpu/drm/xe/xe_sriov.c                      |    2 +
 drivers/gpu/drm/xe/xe_sriov_packet.c               |  520 ++++
 drivers/gpu/drm/xe/xe_sriov_packet.h               |   30 +
 drivers/gpu/drm/xe/xe_sriov_packet_types.h         |   75 +
 drivers/gpu/drm/xe/xe_sriov_pf.c                   |  177 +-
 drivers/gpu/drm/xe/xe_sriov_pf.h                   |   22 +-
 drivers/gpu/drm/xe/xe_sriov_pf_control.c           |  279 ++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h           |   22 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c           |  395 +++
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h           |   18 +
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h           |   27 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c         |  340 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h         |   29 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h   |   37 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c         |  438 +++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h         |   45 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h   |   36 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c             |  647 +++++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h             |   16 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h             |   25 +
 drivers/gpu/drm/xe/xe_sriov_printk.h               |   12 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c                   |  286 +-
 drivers/gpu/drm/xe/xe_sriov_vf.h                   |    2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c               |   74 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h               |    1 +
 drivers/gpu/drm/xe/xe_sriov_vf_types.h             |   10 +-
 drivers/gpu/drm/xe/xe_svm.c                        |    5 +-
 drivers/gpu/drm/xe/xe_sync.c                       |   78 +-
 drivers/gpu/drm/xe/xe_tile.c                       |   14 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c               |   19 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.h               |    3 +
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c      |  253 ++
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h      |   15 +
 drivers/gpu/drm/xe/xe_tile_sriov_printk.h          |   33 +
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c              |  114 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h              |    9 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h        |   23 +
 drivers/gpu/drm/xe/xe_tlb_inval.h                  |    2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c              |   31 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h              |    5 +-
 drivers/gpu/drm/xe/xe_trace.h                      |   23 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |    8 +-
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c                |    6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |    6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h         |    4 +-
 drivers/gpu/drm/xe/xe_tuning.c                     |   27 +-
 drivers/gpu/drm/xe/xe_tuning.h                     |    2 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h                |    6 +-
 drivers/gpu/drm/xe/xe_uc_types.h                   |    2 +-
 drivers/gpu/drm/xe/xe_userptr.c                    |    4 +-
 drivers/gpu/drm/xe/xe_validation.h                 |    6 +-
 drivers/gpu/drm/xe/xe_vm.c                         |  138 +-
 drivers/gpu/drm/xe/xe_vm_doc.h                     |    8 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |   10 +-
 drivers/gpu/drm/xe/xe_vram.c                       |   38 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   27 +-
 drivers/gpu/drm/xe/xe_wa.h                         |    2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   17 +-
 drivers/gpu/drm/xen/xen_drm_front.c                |    1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c            |    1 +
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |    1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    7 +-
 drivers/gpu/host1x/bus.c                           |   12 +
 drivers/gpu/host1x/dev.c                           |   20 +-
 drivers/gpu/host1x/dev.h                           |    3 +
 drivers/gpu/host1x/hw/channel_hw.c                 |  112 +-
 drivers/gpu/host1x/hw/intr_hw.c                    |   56 +-
 drivers/gpu/host1x/syncpt.c                        |    4 +-
 drivers/gpu/nova-core/bitfield.rs                  |  330 +++
 drivers/gpu/nova-core/dma.rs                       |   34 +-
 drivers/gpu/nova-core/driver.rs                    |   27 +-
 drivers/gpu/nova-core/falcon.rs                    |  287 +-
 drivers/gpu/nova-core/falcon/gsp.rs                |   29 +-
 drivers/gpu/nova-core/falcon/hal.rs                |   14 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |   46 +-
 drivers/gpu/nova-core/falcon/sec2.rs               |   10 +-
 drivers/gpu/nova-core/fb.rs                        |  100 +-
 drivers/gpu/nova-core/fb/hal.rs                    |    6 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs              |   16 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs              |    8 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs              |   25 +-
 drivers/gpu/nova-core/firmware.rs                  |   31 +-
 drivers/gpu/nova-core/firmware/booter.rs           |   78 +-
 drivers/gpu/nova-core/firmware/fwsec.rs            |  184 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |   53 +-
 drivers/gpu/nova-core/firmware/riscv.rs            |   34 +-
 drivers/gpu/nova-core/gfw.rs                       |   48 +-
 drivers/gpu/nova-core/gpu.rs                       |  117 +-
 drivers/gpu/nova-core/gsp.rs                       |  157 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |  153 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |  679 +++++
 drivers/gpu/nova-core/gsp/commands.rs              |  227 ++
 drivers/gpu/nova-core/gsp/fw.rs                    |  923 ++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs           |  128 +
 drivers/gpu/nova-core/gsp/fw/r570_144.rs           |    6 +-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs  |  950 +++++++
 drivers/gpu/nova-core/gsp/sequencer.rs             |  407 +++
 drivers/gpu/nova-core/nova_core.rs                 |    5 +
 drivers/gpu/nova-core/num.rs                       |  217 ++
 drivers/gpu/nova-core/regs.rs                      |   93 +-
 drivers/gpu/nova-core/regs/macros.rs               |  287 +-
 drivers/gpu/nova-core/sbuffer.rs                   |  227 ++
 drivers/gpu/nova-core/util.rs                      |   33 +-
 drivers/gpu/nova-core/vbios.rs                     |  423 ++-
 drivers/video/fbdev/Kconfig                        |    8 +-
 drivers/video/fbdev/core/Kconfig                   |    2 +-
 drivers/video/fbdev/core/bitblit.c                 |  122 +-
 drivers/video/fbdev/core/fbcon.c                   |  459 ++--
 drivers/video/fbdev/core/fbcon.h                   |   17 +-
 drivers/video/fbdev/core/fbcon_ccw.c               |  151 +-
 drivers/video/fbdev/core/fbcon_cw.c                |  151 +-
 drivers/video/fbdev/core/fbcon_rotate.c            |   47 +-
 drivers/video/fbdev/core/fbcon_rotate.h            |   18 +-
 drivers/video/fbdev/core/fbcon_ud.c                |  167 +-
 drivers/video/fbdev/core/softcursor.c              |   18 +-
 drivers/video/fbdev/core/tileblit.c                |   32 +-
 drivers/video/fbdev/simplefb.c                     |    6 +-
 include/drm/bridge/dw_hdmi.h                       |   11 +-
 include/drm/bridge/dw_hdmi_qp.h                    |    6 +
 include/drm/display/drm_dp.h                       |    6 +
 include/drm/display/drm_dp_helper.h                |   22 +
 include/drm/drm_atomic.h                           |  255 +-
 include/drm/drm_atomic_uapi.h                      |    3 +
 include/drm/drm_bridge.h                           |   61 +-
 include/drm/drm_buddy.h                            |   13 +-
 include/drm/drm_client.h                           |   53 +-
 include/drm/drm_client_event.h                     |   12 +-
 include/drm/drm_color_mgmt.h                       |   29 +
 include/drm/drm_colorop.h                          |  464 ++++
 include/drm/drm_crtc.h                             |   20 +-
 include/drm/drm_device.h                           |    8 +
 include/drm/drm_dumb_buffers.h                     |   14 +
 include/drm/drm_edid.h                             |    6 +
 include/drm/drm_fb_helper.h                        |   20 +-
 include/drm/drm_file.h                             |    7 +
 include/drm/drm_fixed.h                            |   17 +
 include/drm/drm_format_helper.h                    |    4 -
 include/drm/drm_gem_shmem_helper.h                 |    2 +
 include/drm/drm_gpusvm.h                           |    4 +
 include/drm/drm_gpuvm.h                            |   16 +
 include/drm/drm_mm.h                               |    2 +-
 include/drm/drm_mode_config.h                      |   18 +
 include/drm/drm_modeset_helper_vtables.h           |   12 +
 include/drm/drm_plane.h                            |   19 +
 include/drm/drm_vblank.h                           |   32 +
 include/drm/drm_vblank_helper.h                    |   56 +
 include/drm/gpu_scheduler.h                        |    2 +-
 include/drm/intel/display_member.h                 |   42 +
 include/drm/intel/display_parent_interface.h       |   45 +
 include/drm/intel/pciids.h                         |   25 +-
 include/drm/ttm/ttm_allocation.h                   |   12 +
 include/drm/ttm/ttm_bo.h                           |    2 +-
 include/drm/ttm/ttm_device.h                       |    8 +-
 include/drm/ttm/ttm_pool.h                         |    8 +-
 include/drm/ttm/ttm_resource.h                     |   32 +-
 include/linux/dma-buf/heaps/cma.h                  |   16 +
 include/sound/asoundef.h                           |    9 +
 include/uapi/drm/amdgpu_drm.h                      |    9 -
 include/uapi/drm/amdxdna_accel.h                   |   61 +
 include/uapi/drm/drm.h                             |   15 +
 include/uapi/drm/drm_mode.h                        |  184 +-
 include/uapi/drm/ethosu_accel.h                    |  261 ++
 include/uapi/drm/ivpu_accel.h                      |   63 +
 include/uapi/drm/panfrost_drm.h                    |  150 +-
 include/uapi/drm/xe_drm.h                          |    6 +-
 init/Kconfig                                       |    3 +
 kernel/dma/contiguous.c                            |   11 +
 rust/kernel/drm/gem/mod.rs                         |   53 +-
 rust/kernel/lib.rs                                 |    4 +
 rust/kernel/prelude.rs                             |    3 +
 rust/kernel/slice.rs                               |   49 +
 rust/kernel/transmute.rs                           |   63 +
 1805 files changed, 94746 insertions(+), 21839 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
 create mode 100644
Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
 create mode 100644 Documentation/devicetree/bindings/npu/arm,ethos.yaml
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 Documentation/gpu/xe/xe_exec_queue.rst
 create mode 100644 drivers/accel/amdxdna/amdxdna_error.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_pm.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_pm.h
 create mode 100644 drivers/accel/ethosu/Kconfig
 create mode 100644 drivers/accel/ethosu/Makefile
 create mode 100644 drivers/accel/ethosu/ethosu_device.h
 create mode 100644 drivers/accel/ethosu/ethosu_drv.c
 create mode 100644 drivers/accel/ethosu/ethosu_drv.h
 create mode 100644 drivers/accel/ethosu/ethosu_gem.c
 create mode 100644 drivers/accel/ethosu/ethosu_gem.h
 create mode 100644 drivers/accel/ethosu/ethosu_job.c
 create mode 100644 drivers/accel/ethosu/ethosu_job.h
 create mode 100644 drivers/accel/ivpu/ivpu_gem_userptr.c
 create mode 100644 drivers/accel/qaic/qaic_ssr.c
 create mode 100644 drivers/accel/qaic/qaic_ssr.h
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vce_v1_0.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop=
.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop=
.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/cmntypes.h (93%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/display_mode_core.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/display_mode_core.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/display_mode_core_structs.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/display_mode_lib_defines.h (95%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/display_mode_util.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/display_mode_util.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/dml21_translation_helper.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/dml21_translation_helper.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/dml21_utils.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/dml21_utils.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/dml21_wrapper.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/dml21_wrapper.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/inc/bounding_boxes/dcn4_soc_bb.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/inc/dml2_external_lib_deps.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/inc/dml_top.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/inc/dml_top_dchub_registers.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/inc/dml_top_display_cfg_types.h (95%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/inc/dml_top_policy_types.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/inc/dml_top_soc_parameter_types.h (94%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/inc/dml_top_types.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_dcn4.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_dcn4.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_dcn4_calcs.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_dcn4_calcs.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_factory.c (96%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_factory.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_shared_types.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_utils.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_core/dml2_core_utils.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_factory.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_factory.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_mcg/dml2_mcg_dcn4.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_mcg/dml2_mcg_dcn4.h (97%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_mcg/dml2_mcg_factory.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_mcg/dml2_mcg_factory.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn3.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn3.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c (82%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_pmo/dml2_pmo_factory.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_pmo/dml2_pmo_factory.h (97%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_standalone_libraries/lib_float_math.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_standalone_libraries/lib_float_math.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_top/dml2_top_interfaces.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_top/dml2_top_legacy.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_top/dml2_top_legacy.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_top/dml2_top_soc15.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/dml2_top/dml2_top_soc15.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/inc/dml2_debug.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml21/src/inc/dml2_internal_shared_types.h (93%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml2_dc_resource_mgmt.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml2_dc_resource_mgmt.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml2_dc_types.h (=
100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml2_internal_types.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml2_mall_phantom.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml2_mall_phantom.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml2_policy.c (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml2_policy.h (10=
0%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml2_translation_helper.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml2_translation_helper.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml2_utils.c (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml2_utils.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml2_wrapper.c (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml2_wrapper.h (1=
00%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml_assert.h (100=
%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml_depedencies.h=
 (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml_display_rq_dlg_calc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D>
dml2_0}/dml_display_rq_dlg_calc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 =3D> dml2_0}/dml_logging.h (99=
%)
 create mode 100644 drivers/gpu/drm/amd/ras/Makefile
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/Makefile
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_cmd.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_nbio_v7_9.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c
 create mode 100644 drivers/gpu/drm/amd/ras/ras_mgr/ras_sys.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cmd.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_core.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cper.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cper.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_gfx_v9_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_mp1_v13_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_nbio_v7_9.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_process.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_process.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_psp_v13_0.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_ta_if.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.h
 create mode 100644 drivers/gpu/drm/ast/ast_2200.c
 create mode 100644 drivers/gpu/drm/ast/ast_2400.c
 delete mode 100644 drivers/gpu/drm/ast/ast_main.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
 create mode 100644 drivers/gpu/drm/drm_client_sysrq.c
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/drm_vblank_helper.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_dbuf_bw.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dbuf_bw.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_jiffies.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_utils.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_utils.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_lt_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_lt_phy.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
 create mode 100644 drivers/gpu/drm/i915/display/skl_prefill.c
 create mode 100644 drivers/gpu/drm/i915/display/skl_prefill.h
 create mode 100644 drivers/gpu/drm/i915/display/vlv_clock.c
 create mode 100644 drivers/gpu/drm/i915/display/vlv_clock.h
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.c
 create mode 100644 drivers/gpu/drm/i915/i915_jiffies.h
 create mode 100644 drivers/gpu/drm/i915/i915_mmio_range.c
 create mode 100644 drivers/gpu/drm/i915/i915_mmio_range.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_gpu.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.x=
ml
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_enums.xml
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c
 create mode 100644 drivers/gpu/drm/panel/panel-synaptics-tddi.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h
 create mode 100644 drivers/gpu/drm/tegra/nvjpg.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 delete mode 100644
drivers/gpu/drm/xe/compat-i915-headers/i915_scheduler_types.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_utils.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_rpm.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_stolen.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_guard.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
 create mode 100644 drivers/gpu/nova-core/bitfield.rs
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs
 create mode 100644 drivers/gpu/nova-core/num.rs
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs
 create mode 100644 include/drm/drm_colorop.h
 create mode 100644 include/drm/drm_dumb_buffers.h
 create mode 100644 include/drm/drm_vblank_helper.h
 create mode 100644 include/drm/intel/display_member.h
 create mode 100644 include/drm/intel/display_parent_interface.h
 create mode 100644 include/drm/ttm/ttm_allocation.h
 create mode 100644 include/linux/dma-buf/heaps/cma.h
 create mode 100644 include/uapi/drm/ethosu_accel.h
 create mode 100644 rust/kernel/slice.rs
