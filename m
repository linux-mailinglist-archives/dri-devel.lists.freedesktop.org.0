Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31740AC6439
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 10:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F6E10E58D;
	Wed, 28 May 2025 08:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ePYLafR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C1C10E07E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 03:51:40 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-604f26055c6so838808a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748404299; x=1749009099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BNY8EHIAgdEdqNCyFRTQBefz1csNl/tg9s+58aiNPQc=;
 b=ePYLafR1HeD/Of5uW70P2p4O0LO86doBsSJHdEDinPMiWIO21/aP6Uk/fYdxsK5OXL
 5d8uL05DSv2HCCXUYKsHJZI5nVQQSJU1EGiqSQ2JjLWiQ1GiyEqrCaaHU+VCaagTX1uo
 bDALBrbZd4YPzAUSPNJ0Q49bpkh8i5ZBdq0cgCaWEehUPPTZQQPPeq4xlFSyGznPer3M
 0Ww8z8rED3YzLVZ8c3d5+pydPxz0t7uJ1KbulrtNqopkQjfjYGki3FMi/vbMtXGE/Wq0
 UcxE0AtQpuyx/QEiYc7fMtnHgd2XXjIvQ73kYEhLcnxhEnc/kcU6uSil+QJlF4uNaUWC
 BV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748404299; x=1749009099;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BNY8EHIAgdEdqNCyFRTQBefz1csNl/tg9s+58aiNPQc=;
 b=YTj2gKpONKD+AYrMF52etOszvQz+jI3SWUeCnymMy784Cq3vRBD2TyYNNUR/2ysKTN
 A8i7t19Cz+LH6ekVGIhHPAaKc9DF1ColawCBBnI7fvZZDNC+vBDqS+YPlivP31Ae6Mvh
 DeMMy5zYgwE/rvaHDGqfe+bScwnxeEfvqfrt/3bKv6tA4MSriKpdIKtFH+FfGQDY6RJ2
 HnO7wyFudxHt6H62YEIsqLF3x3V5EIftNvBlKcEb4XsJWwY2oe6JTGGz10Wwr1sJlT7Q
 VOxpdszX0PnrXCsb4lbh1lExrJI1ua0uet2Kp0Pcr+D8I1U2CRBXqBdjErPHI6qpAGrt
 SCHQ==
X-Gm-Message-State: AOJu0Yys2xuNJCwxa7hOEf+Stwd6DO/0+pac9xhuos1VRQoX+E9ObfEB
 Xb8ZZHAfrqBk+7SDuNgBR0e6iimwcPGHVJnCHMP2v6elDypRCYZN3YI3RAfVJSqdE1Kl/U2Qwme
 BAtohJRW8elUykH0Ak8WwHe4ocsK1cag=
X-Gm-Gg: ASbGncvgSwZ0Spss0L3YxSMcLE875pr8zDOZ5gId+TzQFCRKBwI8OIqHUNjryoNI+By
 SQCn00ybdA0XLMXTIis+rL39rY5W/Wp6GlY+2eFGC6WxN+WlAL3do0YChFH8NuidxSMNFH0ZKt/
 3EJ4qdFl2IdYjfGXihM2zz12sjR7H0O3k=
X-Google-Smtp-Source: AGHT+IHVgTLw1YBc02YZE1gaw1p/+JmF6UQmlVDLdOnC/r/zAmt1TCj9ZbchBQiD3pvG7ONI4hIZDWTYBPISUKqvF2k=
X-Received: by 2002:a17:907:3d88:b0:ad8:5850:7332 with SMTP id
 a640c23a62f3a-ad89888d66bmr272759366b.9.1748404298531; Tue, 27 May 2025
 20:51:38 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 28 May 2025 13:51:25 +1000
X-Gm-Features: AX0GCFsgXEzAf4y4ZW4Wnd6RLbz_Rj3iU6etByGIs0ra0Yhcqh6LsriQriD0jwg
Message-ID: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
Subject: [git pull] drm for 6.16-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 28 May 2025 08:22:32 +0000
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

This is the main drm pull request for 6.16.

There will be conflicts, summary below.

As part of building up nova-core/nova-drm pieces we've brought in some
rust abstractions through this tree, aux bus being the main one, with
devres changes also in the driver-core tree. Along with the drm core
abstractions and enough nova-core/nova-drm to use them. This is still
all stub work under construction, to build the nova driver upstream.

The other big NVIDIA related one is nouveau adds support for
Hopper/Blackwell GPUs, this required a new GSP firmware update to
570.144, and a bunch of rework in order to support multiple fw
interfaces.

There is also the introduction of an asahi uapi header file as a
precursor to getting the real driver in later, but to unblock
userspace mesa packages while the driver is trapped behind rust
enablement.

The disgusting turds removal patchset is also in here.

Otherwise it's the usual mixture of stuff all over, amdgpu, i915/xe,
and msm being the main ones, and some changes to vsprintf.

Conflicts I know about:
rust tree conflict:
https://lore.kernel.org/dri-devel/20250523161352.20f0589a@canb.auug.org.au/
configfs tree:
https://lore.kernel.org/dri-devel/20250521143225.7ec5064b@canb.auug.org.au/
with your tree xe:
https://lore.kernel.org/dri-devel/20250521141318.59a76e45@canb.auug.org.au/
https://lore.kernel.org/dri-devel/20250521141036.4eeb38a6@canb.auug.org.au/

I've put a trial merge result at
https://github.com/airlied/linux/tree/drm-next-6.16-rc1-merged

but since you haven't merged a few things, it probably won't show them all.

Let me know if there any issues,

Regards,
Dave.

drm-next-2025-05-28:
drm for 6.16-rc1

new drivers:
- bring in the asahi uapi header standalone
- nova-drm: stub driver

rust dependencies (for nova-core):
- auxiliary
  - bus abstractions
  - driver registration
  - sample driver
- devres changes from driver-core
- revocable changes

core:
- add Apple fourcc modifiers
- add virtio capset definitions
- extend EXPORT_SYNC_FILE for timeline syncobjs
- convert to devm_platform_ioremap_resource
- refactor shmem helper page pinning
- DP powerup/down link helpers
- remove disgusting turds
- extended %p4cc in vsprintf.c to support fourcc prints
- change vsprintf %p4cn to %p4chR, remove %p4cn
- Add drm_file_err function
- IN_FORMATS_ASYNC property
- move sitronix from tiny to their own subdir

rust:
- add drm core infrastructure rust abstractions
  (device/driver, ioctl, file, gem)

dma-buf:
- adjust sg handling to not cache map on attach
- allow setting dma-device for import
- Add a helper to sort and deduplicate dma_fence arrays

docs:
- updated drm scheduler docs
- fbdev todo update
- fb rendering
- actual brightness

ttm:
- fix delayed destroy resv object

bridge:
- add kunit tests
- convert tc358775 to atomic
- convert drivers to devm_drm_bridge_alloc
- convert rk3066_hdmi to bridge driver

scheduler:
- add kunit tests

panel:
- refcount panels to improve lifetime handling
- Powertip PH128800T004-ZZA01
- NLT NL13676BC25-03F, Tianma TM070JDHG34-00
- Himax HX8279/HX8279-D DDIC
- Visionox G2647FB105
- Sitronix ST7571
- ZOTAC rotation quirk

vkms:
- allow attaching more displays

i915:
- xe3lpd display updates
- vrr refactor
- intel_display struct conversions
- xe2hpd memory type identification
- add link rate/count to i915_display_info
- cleanup VGA plane handling
- refactor HDCP GSC
- fix SLPC wait boosting reference counting
- add 20ms delay to engine reset
- fix fence release on early probe errors

xe:
- SRIOV updates
- BMG PCI ID update
- support separate firmware for each GT
- SVM fix, prelim SVM multi-device work
- export fan speed
- temp disable d3cold on BMG
- backup VRAM in PM notifier instead of suspend/freeze
- update xe_ttm_access_memory to use GPU for non-visible access
- fix guc_info debugfs for VFs
- use copy_from_user instead of __copy_from_user
- append PCIe gen5 limitations to xe_firmware document

amdgpu:
- DSC cleanup
- DC Scaling updates
- Fused I2C-over-AUX updates
- DMUB updates
- Use drm_file_err in amdgpu
- Enforce isolation updates
- Use new dma_fence helpers
- USERQ fixes
- Documentation updates
- SR-IOV updates
- RAS updates
- PSP 12 cleanups
- GC 9.5 updates
- SMU 13.x updates
- VCN / JPEG SR-IOV updates

amdkfd:
- Update error messages for SDMA
- Userptr updates
- XNACK fixes

radeon:
- CIK doorbell cleanup

nouveau:
- add support for NVIDIA r570 GSP firmware
- enable Hopper/Blackwell support

nova-core:
- fix task list
- register definition infrastructure
- move firmware into own rust module
- register auxiliary device for nova-drm

nova-drm:
- initial driver skeleton

msm:
- GPU:
  - ACD (adaptive clock distribution) for X1-85
  - drop fictional address_space_size
  - improve GMU HFI response time out robustness
  - fix crash when throttling during boot
- DPU:
  - use single CTL path for flushing on DPU 5.x+
  - improve SSPP allocation code for better sharing
  - Enabled SmartDMA on SM8150, SC8180X, SC8280XP, SM8550
  - Added SAR2130P support
  - Disabled DSC support on MSM8937, MSM8917, MSM8953, SDM660
- DP:
  - switch to new audio helpers
  - better LTTPR handling
- DSI:
  - Added support for SA8775P
  - Added SAR2130P support
- HDMI:
  - Switched to use new helpers for ACR data
  - Fixed old standing issue of HPD not working in some cases

amdxdna:
- add dma-buf support
- allow empty command submits

renesas:
- add dma-buf support
- add zpos, alpha, blend support

panthor:
- fail properly for NO_MMAP bos
- add SET_LABEL ioctl
- debugfs BO dumping support

imagination:
- update DT bindings
- support TI AM68 GPU

hibmc:
- improve interrupt handling and HPD support

virtio:
- add panic handler support

rockchip:
- add RK3588 support
- add DP AUX bus panel support

ivpu:
- add heartbeat based hangcheck

mediatek:
- prepares support for MT8195/99 HDMIv2/DDCv2

anx7625:
- improve HPD

tegra:
- speed up firmware loading
The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb=
:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-05-28

for you to fetch changes up to f8bb3ed3197966fb60bedcbdc126d2bd5bc0a77f:

  drm/nouveau/tegra: Fix error pointer vs NULL return in
nvkm_device_tegra_resource_addr() (2025-05-24 14:36:07 +1000)

----------------------------------------------------------------
drm for 6.16-rc1

new drivers:
- bring in the asahi uapi header standalone
- nova-drm: stub driver

rust dependencies (for nova-core):
- auxiliary
  - bus abstractions
  - driver registration
  - sample driver
- devres changes from driver-core
- revocable changes

core:
- add Apple fourcc modifiers
- add virtio capset definitions
- extend EXPORT_SYNC_FILE for timeline syncobjs
- convert to devm_platform_ioremap_resource
- refactor shmem helper page pinning
- DP powerup/down link helpers
- remove disgusting turds
- extended %p4cc in vsprintf.c to support fourcc prints
- change vsprintf %p4cn to %p4chR, remove %p4cn
- Add drm_file_err function
- IN_FORMATS_ASYNC property
- move sitronix from tiny to their own subdir

rust:
- add drm core infrastructure rust abstractions
  (device/driver, ioctl, file, gem)

dma-buf:
- adjust sg handling to not cache map on attach
- allow setting dma-device for import
- Add a helper to sort and deduplicate dma_fence arrays

docs:
- updated drm scheduler docs
- fbdev todo update
- fb rendering
- actual brightness

ttm:
- fix delayed destroy resv object

bridge:
- add kunit tests
- convert tc358775 to atomic
- convert drivers to devm_drm_bridge_alloc
- convert rk3066_hdmi to bridge driver

scheduler:
- add kunit tests

panel:
- refcount panels to improve lifetime handling
- Powertip PH128800T004-ZZA01
- NLT NL13676BC25-03F, Tianma TM070JDHG34-00
- Himax HX8279/HX8279-D DDIC
- Visionox G2647FB105
- Sitronix ST7571
- ZOTAC rotation quirk

vkms:
- allow attaching more displays

i915:
- xe3lpd display updates
- vrr refactor
- intel_display struct conversions
- xe2hpd memory type identification
- add link rate/count to i915_display_info
- cleanup VGA plane handling
- refactor HDCP GSC
- fix SLPC wait boosting reference counting
- add 20ms delay to engine reset
- fix fence release on early probe errors

xe:
- SRIOV updates
- BMG PCI ID update
- support separate firmware for each GT
- SVM fix, prelim SVM multi-device work
- export fan speed
- temp disable d3cold on BMG
- backup VRAM in PM notifier instead of suspend/freeze
- update xe_ttm_access_memory to use GPU for non-visible access
- fix guc_info debugfs for VFs
- use copy_from_user instead of __copy_from_user
- append PCIe gen5 limitations to xe_firmware document

amdgpu:
- DSC cleanup
- DC Scaling updates
- Fused I2C-over-AUX updates
- DMUB updates
- Use drm_file_err in amdgpu
- Enforce isolation updates
- Use new dma_fence helpers
- USERQ fixes
- Documentation updates
- SR-IOV updates
- RAS updates
- PSP 12 cleanups
- GC 9.5 updates
- SMU 13.x updates
- VCN / JPEG SR-IOV updates

amdkfd:
- Update error messages for SDMA
- Userptr updates
- XNACK fixes

radeon:
- CIK doorbell cleanup

nouveau:
- add support for NVIDIA r570 GSP firmware
- enable Hopper/Blackwell support

nova-core:
- fix task list
- register definition infrastructure
- move firmware into own rust module
- register auxiliary device for nova-drm

nova-drm:
- initial driver skeleton

msm:
- GPU:
  - ACD (adaptive clock distribution) for X1-85
  - drop fictional address_space_size
  - improve GMU HFI response time out robustness
  - fix crash when throttling during boot
- DPU:
  - use single CTL path for flushing on DPU 5.x+
  - improve SSPP allocation code for better sharing
  - Enabled SmartDMA on SM8150, SC8180X, SC8280XP, SM8550
  - Added SAR2130P support
  - Disabled DSC support on MSM8937, MSM8917, MSM8953, SDM660
- DP:
  - switch to new audio helpers
  - better LTTPR handling
- DSI:
  - Added support for SA8775P
  - Added SAR2130P support
- HDMI:
  - Switched to use new helpers for ACR data
  - Fixed old standing issue of HPD not working in some cases

amdxdna:
- add dma-buf support
- allow empty command submits

renesas:
- add dma-buf support
- add zpos, alpha, blend support

panthor:
- fail properly for NO_MMAP bos
- add SET_LABEL ioctl
- debugfs BO dumping support

imagination:
- update DT bindings
- support TI AM68 GPU

hibmc:
- improve interrupt handling and HPD support

virtio:
- add panic handler support

rockchip:
- add RK3588 support
- add DP AUX bus panel support

ivpu:
- add heartbeat based hangcheck

mediatek:
- prepares support for MT8195/99 HDMIv2/DDCv2

anx7625:
- improve HPD

tegra:
- speed up firmware loading

----------------------------------------------------------------
Aaron Ruby (1):
      drm/virtio: Add capset definitions to UAPI

Aditya Garg (4):
      printf: add tests for generic FourCCs
      drm/appletbdrm: use %p4cl instead of %p4cc
      drm/appletbdrm: Make appletbdrm depend on X86
      checkpatch: remove %p4cn

Adri=C3=A1n Larumbe (5):
      drm/panthor: Introduce BO labeling
      drm/panthor: Add driver IOCTL for setting BO labels
      drm/panthor: Label all kernel BO's
      drm/panthor: show device-wide list of DRM GEM objects over DebugFS
      drm/panthor: Fix build warning when DEBUG_FS is disabled

Akhil P Oommen (7):
      drm/msm/adreno: Add support for ACD
      drm/msm/a6xx: Increase HFI response timeout
      drm/msm: a6x: Rework qmp_get() error handling
      drm/msm/adreno: Add module param to disable ACD
      dt-bindings: opp: Add v2-qcom-adreno vendor bindings
      arm64: dts: qcom: x1e80100: Add ACD levels for GPU
      arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3 for GPU

Aleksandrs Vinarskis (4):
      drm/msm/dp: Fix support of LTTPR initialization
      drm/msm/dp: Account for LTTPRs capabilities
      drm/msm/dp: Prepare for link training per-segment for LTTPRs
      drm/msm/dp: Introduce link training per-segment for LTTPRs

Alessio Belle (3):
      drm/imagination: Update register defs for newer GPUs
      drm/imagination: Mask GPU IRQs in threaded handler
      drm/imagination: Handle Rogue safety event IRQs

Alex Deucher (118):
      drm/amdgpu: add rebar parameter
      drm/amdgpu: add initial documentation for debugfs files
      drm/amdgpu: drop some dead code
      drm/amdgpu/gfx: make amdgpu_gfx_me_queue_to_bit() static
      drm/amdgpu/gfx: decouple the number of kgqs from the hw
      drm/amdgpu/gfx: assign the actual me0 queues per pipe
      drm/amdgpu/gfx6: fix CSIB handling
      drm/amdgpu/gfx7: fix CSIB handling
      drm/amdgpu/gfx8: fix CSIB handling
      drm/amdgpu/gfx9: fix CSIB handling
      drm/amdgpu/gfx10: fix CSIB handling
      drm/amdgpu/gfx11: fix CSIB handling
      drm/amdgpu/gfx9: dump full CP packet header FIFOs
      drm/amdgpu/gfx9.4.3: dump full CP packet header FIFOs
      drm/amdgpu/gfx10: dump full CP packet header FIFOs
      drm/amdgpu/gfx11: dump full CP packet header FIFOs
      drm/amdgpu/gfx12: dump full CP packet header FIFOs
      drm/amdgpu/pm: add workload profile pause helper
      drm/amdgpu/pm/swsmu: implement pause workload profile
      drm/amdgpu: cancel gfx idle work in device suspend for s0ix
      drm/amdgpu/mes12: optimize MES pipe FW version fetching
      Documentation: update KIQ documentation
      Documenation: fix typo in debugfs.rst
      drm/amdgpu: UAPI for user queue management
      drm/amdgpu: add some additional members to amdgpu_mqd_prop
      drm/amdgpu/gfx11: update mqd init for UQ
      drm/amdgpu/gfx12: update mqd init for UQ
      drm/amdgpu/sdma6: update mqd init for UQ
      drm/amdgpu/sdma7: update mqd init for UQ
      drm/amdgpu/uq: remove gfx11 specifics from UQ setup
      drm/amdgpu/uq: make MES UQ setup generic
      drm/amdgpu/userq: fix hardcoded uq functions
      drm/amdgpu/userq: handle runtime pm
      drm/amdgpu: return an error in the userq IOCTL when
DRM_AMDGPU_NAVI3X_USERQ=3Dn
      drm/amdgpu/Kconfig: fix wording of DRM_AMDGPU_NAVI3X_USERQ
      drm/amdgpu/gfx11: fix config guard
      drm/amdgpu: add userq firmware version checks
      drm/amdgpu/userq: remove BROKEN from config
      drm/amdgpu/userq: move the header to amdgpu directory
      drm/amdgpu: validate user queue parameters
      drm/amdgpu/mes: remove unused functions
      drm/amdgpu: remove is_mes_queue flag
      drm/amdgpu/mes: centralize gfx_hqd mask management
      drm/amdgpu/mes: warn on unexpected pipe numbers
      drm/amdgpu/gfx11: clean up and consolidate sw_init
      drm/amdgpu/gfx12: split userq setup to a separate switch
      drm/amdgpu: add UAPI to query if user queues are supported
      drm/amdgpu: bump version for user queue IP support query
      drm/amdgpu: store userq_managers in a list in adev
      drm/amdgpu/userq: prevent runtime pm when userqs are active
      drm/amdgpu: add parameter to disable kernel queues
      drm/amdgpu: add ring flag for no user submissions
      drm/amdgpu/gfx: add generic handling for disable_kq
      drm/amdgpu/mes: update hqd masks when disable_kq is set
      drm/amdgpu/mes: make more vmids available when disable_kq=3D1
      drm/amdgpu/gfx11: add support for disable_kq
      drm/amdgpu/gfx12: add support for disable_kq
      drm/amdgpu/sdma: add flag for tracking disable_kq
      drm/amdgpu/sdma6: add support for disable_kq
      drm/amdgpu/sdma7: add support for disable_kq
      drm/amdgpu/mes11: use the device value for enforce isolation
      drm/amdgpu/mes12: use the device value for enforce isolation
      drm/amdgpu: adjust enforce_isolation handling
      drm/amd/display/dml2: use vzalloc rather than kzalloc
      drm/amdgpu/userq/mes: remove unused header
      drm/amdgpu/userq: rename suspend/resume callbacks
      drm/amdgpu/userq: rework front end call sequence
      drm/amdgpu/userq: move some code around
      drm/amdgpu/userq: properly clean up userq fence driver on failure
      drm/amdgpu/userq: add suspend and resume helpers
      drm/amdgpu/userq: handle system suspend and resume
      drm/amdgpu: don't swallow errors in amdgpu_userqueue_resume_all()
      drm/amdgpu/userq: move runpm handling into core userq code
      drm/amdgpu/gfx11: properly reference EOP interrupts for userqs
      drm/amdgpu/gfx12: properly reference EOP interrupts for userqs
      drm/amdgpu/sdma6: properly reference trap interrupts for userqs
      drm/amdgpu/sdma7: properly reference trap interrupts for userqs
      drm/amdgpu/userq: rework driver parameter
      drm/amdgpu/userq: track the xcp_id associated with the queue
      drm/amdgpu/userq: add helpers to start/stop scheduling
      drm/amdgpu: rename enforce isolation variables
      drm/amdgpu/userq: integrate with enforce isolation
      drm/amdgpu: convert userq UAPI _pad to flags
      drm/amdgpu/userq: add UAPI for setting queue priority
      drm/amdgpu/mes11: add conversion for priority levels
      drm/amdgpu/mes12: add conversion for priority levels
      drm/amdgpu/userq: add priorty to user queue structure
      drm/amdgpu/userq/mes: handle user queue priority
      drm/amdgpu/userq: enable support for queue priorities
      drm/amdgpu/userq: add UAPI for setting up secure queues
      drm/amdgpu: add tmz queue parameter to mqd props
      drm/amdgpu/gfx11: add support for TMZ queues to mqd_init
      drm/amdgpu/gfx12: add support for TMZ queues to mqd_init
      drm/amdgpu/userq/mes: pass the secure flag to mqd init
      drm/amdgpu/userq: enable support for secure queues
      drm/amdgpu/userq: add a helper to check which IPs are enabled
      drm/amdgpu/userq: optimize enforce isolation and s/r
      drm/amdgpu: switch from queue_active to queue state
      drm/amdgpu/userq: unmap queues amdgpu_userq_mgr_fini()
      drm/amdgpu/userq: move waiting for last fence before umap
      drm/amdgpu/userq: rename eviction helpers
      drm/amdgpu/userq: use consistent function naming
      drm/amdgpu/userq: take the userq_mgr lock in suspend/resume
      drm/amdgpu/userq: take the userq_mgr lock in enforce isolation
      drm/amdgpu/mes: remove more unused functions
      drm/amdgpu/mes: consolidate on a single mes reset callback
      drm/amdgpu/mes: use correct MES pipe for resets
      drm/amdgpu: properly handle GC vs MM in amdgpu_vmid_mgr_init()
      Revert "drm/amd: Stop evicting resources on APUs in suspend"
      drm/amdgpu: fix pm notifier handling
      drm/amdgpu/psp: mark securedisplay TA as optional
      Revert "drm/amdgpu: Use generic hdp flush function"
      drm/amdgpu/hdp4: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5.2: use memcfg register to post the write for HDP flus=
h
      drm/amdgpu/hdp6: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp7: use memcfg register to post the write for HDP flush
      drm/amdkfd: drop warning in event_interrupt_isr_v1*()

Alex Hung (2):
      drm/amd/display: Remove redundant null check
      drm/amd/display: Remove unnecessary DC_FP_START/DC_FP_END

Alexander Baransky (2):
      dt-bindings: display: panel: Add Visionox G2647FB105
      drm/panel: Add Visionox G2647FB105 panel driver

Alexander Stein (1):
      drm/bridge: sii902x: Set bridge type

Alexandre Courbot (11):
      rust/revocable: add try_access_with() convenience method
      samples: rust: convert PCI rust sample driver to use try_access_with(=
)
      gpu: nova-core: derive useful traits for Chipset
      gpu: nova-core: add missing GA100 definition
      gpu: nova-core: take bound device in Gpu::new
      gpu: nova-core: define registers layout using helper macro
      gpu: nova-core: fix layout of NV_PMC_BOOT_0
      gpu: nova-core: move Firmware to firmware module
      samples: rust: select AUXILIARY_BUS instead of depending on it
      gpu: nova-core: select AUXILIARY_BUS instead of depending on it
      gpu: drm: nova: select AUXILIARY_BUS instead of depending on it

Alexandre Demers (35):
      drm/amdgpu: use gmc_v7_0_is_idle() since it is available under GMC7
      drm/amdgpu: use cik_sdma_is_idle() in CIK SDMA
      drm/amdgpu: small cleanup to CIK SDMA
      drm/amdgpu: move X_GB_ADDR_CONFIG_GOLDEN in GFX7
      drm/radeon: fix MAX_POWER_SHIFT value
      drm/amdgpu: move GFX6 defines into gfx_v6_0.c
      drm/amdgpu: wire up defines, shifts and masks through SI code
      drm/amdgpu: use proper defines, shifts and masks in DCE6 code
      drm/amdgpu: remove PACKET3 duplicated defines from si_enums.h
      drm/amdgpu: move si_ih.c away from sid.h defines
      drm/amdgpu: use GRPH_SECONDARY_SURFACE_ADDRESS_MASK with
GRPH_SECONDARY_SURFACE_ADDRESS in DCE6
      drm/amdgpu: move DCE6 away from sid.h and si_enums.h defines
      drm/amdgpu: add missing DMA defines, shifts and masks
      drm/amdgpu: add missing GFX6 defines
      drm/amdgpu: make GFX6 easier to read
      drm/amdgpu: move si_dma.c away from sid.h and si_enums.h
      drm/amdgpu: keep removing sid.h dependency from si_dma.c
      drm/amdgpu: cleanup DCE6 a bit more
      drm/amdgpu: continue cleaning up sid.h and si_enums.h
      drm/amdgpu: add missing SMU6 defines, shifts and masks
      drm/pm/legacy-dpm: move SI away from sid.h and si_enums.h
      drm/amdgpu: move si.c away from sid.h
      drm/amdgpu: huge sid.h cleanup, drop substituted defines.
      drm/amdgpu: fix typos in DCEs
      drm/amdgpu: use "irq" in place of "interrupt" in DCE6/8 as in DCE10/1=
1
      drm/amd/display/dc: reclassify DCE6 resources and hw sequencer
      drm/amdgpu: fill in gmc_v6_0_set_clockgating_state()
      drm/amdgpu: still cleanup sid.h
      drm/amdgpu: rename function to follow naming convention in dce110
      drm/amdgpu: add missing parameter name in
dce110_clk_src_construct() declaration
      drm/amdgpu: fix typo in atombios.h
      drm/radeon: fix typo in atombios.h
      drm/amdgpu: fix duplicated value setting in dce100_resource_construct=
()
      drm/amdgpu: fix typo in bios_parser.c
      drm/amdgpu: add missing DCE6 to dce_version_to_string()

Alexandru Dadu (1):
      drm/imagination: loop counters moved to loop scope

Alyssa Rosenzweig (2):
      drm: add modifiers for Apple GPU layouts
      drm: Add UAPI for the Asahi driver

Amaranath Somalapuram (1):
      drm/amdgpu: fix IGT CI regression with eviction fence

Amber Lin (2):
      drm/amdkfd: Set SDMA_RLCx_IB_CNTL/SWITCH_INSIDE_IB
      drm/amdkfd: Support chain runlists of XNACK+/XNACK-

Ananta Srikar (1):
      drm/amd/amdgpu: Fix typo

Andi Shyti (4):
      drm/i915/gt: Fix SPDX license format
      drm/i915/gt: Remove trailing blank lines
      drm/i915/gt: Use proper sleeping functions for timeouts shorter than =
20ms
      drm/i915/gem: Convert SPDX headers to single-line format

Andres Urian Florez (1):
      drm/amdgpu: Replace deprecated function strcpy() with strscpy()

Andrew Ballance (1):
      gpu: nova-core: remove completed Vec extentions from task list

Andrey Vatoropin (1):
      drm/amd/display: Remove the redundant NULL check

Andy Yan (12):
      drm/dp: Pull drm_dp_link_power_up/down from Tegra to common drm_dp_he=
lper
      drm/bridge: cdns-mhdp8546: Switch to common helpers to power
up/down dp link
      drm/bridge: anx6345: Switch to common helpers to power up/down dp lin=
k
      drm/bridge: anx78xx: Switch to common helpers to power up/down dp lin=
k
      drm/bridge: it6505: Switch to common helpers to power up/down dp link
      drm/rockchip: vop2: Make overlay layer select register
configuration take effect by vsync
      drm/bridge: dw-hdmi: Avoid including uapi headers
      drm/rockchip: rk3066_hdmi: switch to drm bridge
      dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036
compatible
      dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDM=
I
      drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
      drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity
setting for rk3036

AngeloGioacchino Del Regno (23):
      dt-bindings: display: mediatek: Add binding for HDMIv2 DDC
      dt-bindings: display: mediatek: Add binding for MT8195 HDMI-TX v2
      dt-bindings: vendor-prefixes: Add Shenzhen Aoly Technology Co., Ltd.
      dt-bindings: display: panel: Add Himax HX8279/HX8279-D DDIC panels
      drm: panel: Add driver for Himax HX8279 DDIC panels
      drm/mediatek: mtk_cec: Switch to register as module_platform_driver
      drm/mediatek: mtk_hdmi_ddc: Switch to register as module_platform_dri=
ver
      drm/mediatek: mtk_hdmi: Convert to module_platform_driver macro
      drm/mediatek: mtk_hdmi: Disgregate function mtk_hdmi_audio_set_param(=
)
      drm/mediatek: mtk_hdmi: Move audio params selection to new function
      drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new func=
tion
      drm/mediatek: mtk_hdmi: Move N/CTS setting to new function
      drm/mediatek: mtk_hdmi: Use dev_err_probe() in mtk_hdmi_dt_parse_pdat=
a()
      drm/mediatek: mtk_hdmi: Move CEC device parsing in new function
      drm/mediatek: mtk_hdmi: Move output init to
mtk_hdmi_register_audio_driver()
      drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
      drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
      drm/mediatek: mtk_dpi: Add support for additional output formats
      drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
      drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF
      drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
      drm/mediatek: Fix kobject put for component sub-drivers
      drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err

Animesh Manna (12):
      drm/i915/display: Read panel replay source status through PSR2
status register
      drm/i915/lobf: Add lobf enablement in post plane update
      drm/i915/lobf: Add debug print for LOBF
      drm/i915/lobf: Disintegrate alpm_disable from psr_disable
      drm/i915/lobf: Add fixed refresh rate check in compute_config()
      drm/i915/lobf: Update lobf if any change in dependent parameters
      drm/i915/lobf: Add debug interface for lobf
      drm/i915/lobf: Add mutex for alpm update
      drm/i915/lobf: Check for sink error and disable LOBF
      drm/i915/alpm: Add intel_psr_need_alpm() to simplify alpm check
      drm/i915/display: Disintegrate sink alpm enable from psr with lobf
      drm/i915/alpm: Check for alpm support before accessing alpm register

Ankit Nautiyal (31):
      drm/i915/watermark: Check bounds for scaler_users for dsc prefill lat=
ency
      drm/i915/vrr: Remove unwanted comment
      drm/i915:vrr: Separate out functions to compute vmin and vmax
      drm/i915/vrr: Make helpers for cmrr and vrr timings
      drm/i915/vrr: Disable CMRR
      drm/i915/vrr: Track vrr.enable only for variable timing
      drm/i915/vrr: Use crtc_vtotal for vmin
      drm/i915/vrr: Prepare for fixed refresh rate timings
      drm/i915/display: Enable MSA Ignore Timing PAR only when in not
fixed_rr mode
      drm/i915/display: Maintain asciibetical order for HAS_* macros
      drm/i915/display: Add fixed_rr to crtc_state dump
      drm/i915/vrr: Avoid reading vrr.enable based on fixed_rr check
      drm/i915/hdmi: Use VRR Timing generator for HDMI for fixed_rr
      drm/i915/dp_mst: Use VRR Timing generator for DP MST for fixed_rr
      drm/i915/display: Disable PSR before disabling VRR
      drm/i915/display: Move intel_psr_post_plane_update() at the later
      drm/i915/vrr: Refactor condition for computing vmax and LRR
      drm/i915/vrr: Always set vrr vmax/vmin/flipline in vrr_{enable/disabl=
e}
      drm/i915/vrr: Set vrr.enable for VRR TG with fixed_rr
      drm/i915/display: Use fixed_rr timings in modeset sequence
      drm/i915/vrr: Use fixed timings for platforms that support VRR
      drm/i915/display: Use fixed rr timings in
intel_set_transcoder_timings_lrr()
      drm/i915/display: Move vrr.guardband/pipeline_full out of !fastset bl=
ock
      drm/i915/vrr: Allow fixed_rr with pipe joiner
      drm/i915/vrr: Always use VRR timing generator for PTL+
      drm/i915/vrr: Set trans_vrr_ctl in intel_vrr_set_transcoder_timings()
      drm/i915/display: Introduce transcoder_has_vrr() helper
      drm/i915/display: Avoid use of VTOTAL.Vtotal bits
      drm/i915/vrr: Add vrr.vsync_{start, end} in vrr_params_changed
      drm/i915/display: Add macro for checking 3 DSC engines
      drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices

Antonin Godard (4):
      dt-bindings: display: simple: Add POWERTIP PH128800T004-ZZA01 panel
      drm/panel: simple: Add POWERTIP PH128800T004-ZZA01 panel entry
      dt-bindings: display: simple: Add NLT NL13676BC25-03F panel
      drm/panel: simple: Add NLT NL13676BC25-03F panel entry

Antonio Fernando Silva e Cruz Filho (1):
      drm/amd/display: Rename program_timing function for better debugging

Anusha Srivatsa (23):
      drm/fsl-dcu: move to devm_platform_ioremap_resource() usage
      drm/hisilicon: move to devm_platform_ioremap_resource() usage
      drm/mxsfb: move to devm_platform_ioremap_resource() usage
      drm/tegra: move to devm_platform_ioremap_resource() usage
      drm/sprd: move to devm_platform_ioremap_resource() usage
      drm/sti: move to devm_platform_ioremap_resource() usage
      Documentation: Update the todo
      drm/panel/synaptics-r63353: Use _multi variants
      drm/panel/sharp-ls043t1le01: Use _multi variants
      drm/panel: Add new helpers for refcounted panel allocatons
      drm/panel: Add refcount support
      drm/panel: deprecate old-style panel allocation
      drm/panel/panel-simple: Use the new allocation in place of devm_kzall=
oc()
      panel/abt-y030xx067a: Use the refcounted allocation in place of
devm_kzalloc()
      panel/arm-versatile: Use the refcounted allocation in place of
devm_kzalloc()
      panel/z00t-tm5p5-n35596: Use refcounted allocation in place of
devm_kzalloc()
      panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzall=
oc()
      panel/bf060y8m-aj0: Use refcounted allocation in place of devm_kzallo=
c()
      panel/th101mb31ig002-28a: Use refcounted allocation in place of
devm_kzalloc()
      panel/boe-tv101wum-ll2: Use refcounted allocation in place of
devm_kzalloc()
      panel/dsi-cm: Use refcounted allocation in place of devm_kzalloc()
      panel/ebbg-ft8719: Use refcounted allocation in place of devm_kzalloc=
()
      panel/panel-edp: Use refcounted allocation in place of devm_kzalloc()

Apurv Mishra (1):
      drm/amdkfd: Drop workaround for GC v9.4.3 revID 0

Aradhya Bhatia (13):
      drm/xe/migrate: Switch from drm to dev managed actions
      drm/bridge: cdns-dsi: Fix connecting to next bridge
      drm/bridge: cdns-dsi: Fix phy de-init and flag it so
      drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
      drm/bridge: cdns-dsi: Check return value when getting default PHY con=
fig
      drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
      drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()
      drm/mipi-dsi: Add helper to find input format
      drm/bridge: cdns-dsi: Add input format negotiation
      drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()
      drm/xe/xe2hpg: Add Wa_16025250150
      drm/xe/guc: Make creation of SLPC debugfs files conditional
      drm/xe: Default auto_link_downgrade status to false

Aric Cyr (3):
      drm/amd/display: Create a temporary scratch dc_link
      drm/amd/display: DC v3.2.326
      drm/amd/display: Promote DAL to 3.2.327

Ariel D'Alessandro (6):
      drm/panfrost: Set IOMMU_CACHE flag
      drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
      drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost mode=
ls
      drm/panfrost: Add support for AARCH64_4K page table format
      drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8188
      drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192

Arnd Bergmann (6):
      drm: xlnx: zynqmp_dpsub: fix Kconfig dependencies for ASoC
      drm/xe: avoid plain 64-bit division
      drm/imagination: avoid unused-const-variable warning
      drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION
      drm/rockchip: add CONFIG_OF dependency
      drm/xe: fix devcoredump chunk alignmnent calculation

Arun R Murthy (7):
      drm/display/dp: Export fn to calculate link symbol cycles
      drm/i915/display: move min_hblank from dp_mst.c to dp.c
      drm/plane: Add new plane property IN_FORMATS_ASYNC
      drm/plane: modify create_in_formats to acommodate async
      drm/i915/display: Acomodate format check in intel_plane_can_async_fli=
p()
      drm/i915/display: Add i915 hook for format_mod_supported_async
      drm/i915/display: Indexed 8bit format does not support async flip

Arunpravin Paneer Selvam (26):
      drm/amdgpu: Implement a new userqueue fence driver
      drm/amdgpu: Add mqd support for the fence address
      drm/amdgpu: screen freeze and userq driver crash
      drm/amdgpu: UAPI headers for userqueue Secure semaphore
      drm/amdgpu: Implement userqueue signal/wait IOCTL
      drm/amdgpu: Add wait IOCTL timeline syncobj support
      drm/amdgpu: Enable userq fence interrupt support
      drm/amdgpu: Remove the MES self test
      drm/amdgpu: Few optimization and fixes for userq fence driver
      drm/amdgpu: Add the missing error handling for xa_store() call
      drm/amdgpu: add vm root BO lock before accessing the vm
      drm/amdgpu: Add separate array of read and write for BO handles
      drm/amdgpu: Add gpu_addr support to seq64 allocation
      drm/amdgpu: add userq specific kernel config for fence ioctls
      drm/amdgpu: Modify userq signal/wait struct field names
      drm/amdgpu: enable userqueue secure sem for GFX 12
      drm/amdgpu: Add mqd for userq compute queue
      drm/amdgpu: Fix NULL ptr dereference issue for non userq fences
      drm/amdgpu: Fix the use-after-free issue in wait IOCTL
      drm/amdgpu: Apply sign extension to seq64
      drm/amdgpu: Fix out-of-bounds issue in user fence
      drm/amdgpu: Modify the seq64 VM cache policy
      drm/amdgpu: Add queue id support to the user queue wait IOCTL
      drm/amdgpu/userq: Fix lock contention in userq fence
      drm/amdgpu: Fix userq ttm_bo_pin and ttm_bo_unpin lockdep warnings
      drm/amdgpu/userq: Fix DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)

Arvind Yadav (16):
      drm/amdgpu: enable SDMA usermode queues
      drm/amdgpu: fix MES GFX mask
      drm/amdgpu: update userqueue BOs and PDs
      drm/amdgpu: Add input fence to sync bo map/unmap
      drm/amdgpu: Fix Illegal opcode in command stream Error
      drm/amdgpu: Fix display freeze lockup error
      drm/amdgpu: fix the memleak caused by fence not released
      drm/amdgpu: Fix display freezing issue when resizing apps
      drm/amdgpu/gfx11: Add fw minimum version check for usermode queue
      drm/amdgpu/gfx12: Add fw minimum version check for usermode queue
      drm/amdgpu: remove DRM_AMDGPU_NAVI3X_USERQ config for UQ
      dma-fence: Add helper to sort and deduplicate dma_fence arrays
      drm/amdgpu: only keep most recent fence for each context
      drm/amdgpu: Fix NULL dereference in amdgpu_userq_restore_worker
      drm/amdgpu: Fix amdgpu_userq_wait_ioctl() warn missing error code 'r'
      drm/amdgpu: fix use-after-unlock in eviction fence destroy

Asad Kamal (13):
      drm/amd/pm: Expose smu_v13_0_6 caps
      drm/amd/pm: Use gpu_metrics_v1_8 for smu_v13_0_6
      drm/amd/pm: Use gpu_metrics_v1_8 for smu_v13_0_12
      drm/amd/pm: Enable host limit metrics support
      drm/amd/pm: Enable host limit metrics support
      drm/amd/pm: Add ip version check for smu_v13_0_12 functions
      drm/amd/pm: Update pmfw headers for smu_v_13_0_6
      drm/amd/pn: Fetch static metrics table
      drm/amd/pm: Use common function to fetch static metrics table
      drm/amd/pm: Fill static metrics data
      drm/amd/pm: Add voltage caps for smu_v13_0_6
      drm/amd/pm: Add board voltage node to hwmon
      drm/amdgpu: Add pldm version reporting

Asahi Lina (6):
      rust: drm: ioctl: Add DRM ioctl abstraction
      rust: drm: add driver abstractions
      rust: drm: add device abstraction
      rust: drm: add DRM driver registration
      rust: drm: file: Add File abstraction
      rust: drm: gem: Add GEM object abstraction

Aurabindo Pillai (10):
      drm/amd/display: convert DRM_ERROR to drm_err in
hpd_rx_irq_create_workqueue()
      drm/amd/display: use drm_err in hpd rx offload
      drm/amd/display: use drm_err in create_validate_stream_for_sink()
      drm/amd/display: convert more DRM_ERROR to drm_err
      drm/amd/display: use drm_info instead of DRM_INFO
      drm/amd/display: use drm_warn instead of DRM_WARN
      drm/amd/display: downgrade HDMI infoframe error to one time warning
      drm/amd/display: more liberal vmin/vmax update for freesync
      drm/amd/display: use drm_dbg_driver() in amdgpu_dm.c
      drm/amd/display: check stream id dml21 wrapper to get plane_id

Ausef Yousof (2):
      drm/amd/display: wait for updates to latch before locking
      drm/amd/display: dont disable dtb as dto src during dpms off

Austin Zheng (4):
      drm/amd/display: DML21 Reintegration
      drm/amd/display: Set ODM Factor Based On DML Architecture
      drm/amd/display: Move Mode Support Prefetch Checks To Its Own Functio=
n
      drm/amd/display: Call FP Protect Before Mode Programming/Mode Support

Ayushi Makhija (9):
      dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
      dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
      dt-bindings: display: msm: document DSI controller and phy on SA8775P
      drm/msm/dsi: add DSI PHY configuration on SA8775P
      drm/msm/dsi: add DSI support for SA8775P
      drm/bridge: anx7625: enable HPD interrupts
      drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
      drm/bridge: anx7625: fix anx7625_sink_detect() to return correct
hpd status
      drm/bridge: anx7625: change the gpiod_set_value API

Badal Nilawar (2):
      drm/i915: Disable RPG during live selftest
      drm/xe/d3cold: Set power state to D3Cold during s2idle/s3

Bagas Sanjaya (2):
      drm/amdgpu/userq: fix user_queue parameters list
      Documentation/gpu: Disambiguate SPI term

Baihan Li (9):
      drm/hisilicon/hibmc: Restructuring the header dp_reg.h
      drm/hisilicon/hibmc: Add dp serdes cfg to adjust serdes rate,
voltage and pre-emphasis
      drm/hisilicon/hibmc: Add dp serdes cfg in dp process
      drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_d=
p
      drm/hisilicon/hibmc: Getting connector info and EDID by using AUX cha=
nnel
      drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
      drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
      drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
      drm/hisilicon/hibmc: Add vga connector detect functions

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (2):
      dt-bindings: display: panel: Add BOE TD4320
      drivers: gpu: drm: panel: Add BOE TD4320

Ben Skeggs (61):
      drm/nouveau/gsp: fix rm shutdown wait condition
      drm/nouveau/gsp: remove gsp-specific chid allocation path
      drm/nouveau/ce: bump max instances to 20
      drm/nouveau/nvenc: bump max instances to 4
      drm/nouveau/ofa: bump max instances to 2
      drm/nouveau/gsp: split rpc handling out on its own
      drm/nouveau/gsp: split rm ctrl handling out on its own
      drm/nouveau/gsp: split rm alloc handling out on its own
      drm/nouveau/gsp: split client handling out on its own
      drm/nouveau/gsp: split device handling out on its own
      drm/nouveau/gsp: move firmware loading to GPU-specific code
      drm/nouveau/gsp: move booter handling to GPU-specific code
      drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
      drm/nouveau/gsp: switch to a simpler GSP-RM header layout
      drm/nouveau/gsp: add gpu hal stubs
      drm/nouveau/gsp: add display class ids to gpu hal
      drm/nouveau/gsp: add usermode class id to gpu hal
      drm/nouveau/gsp: add channel class id to gpu hal
      drm/nouveau/gsp: add common code for engines/engine objects
      drm/nouveau/gsp: add defines for rmapi object handles
      drm/nouveau/gsp: add hal for wpr config info + meta init
      drm/nouveau/gsp: add hal for gsp.set_system_info()
      drm/nouveau/gsp: add hal for gsp.get_static_info()
      drm/nouveau/gsp: add hal for gsp.xlat_mc_engine_idx()
      drm/nouveau/gsp: add hal for gsp.drop_send_user_shared_data()
      drm/nouveau/gsp: add hal for disp.bl_ctrl()
      drm/nouveau/gsp: add hal for disp.dp.set_indexed_link_rates()
      drm/nouveau/gsp: add hal for disp.get_static_info()
      drm/nouveau/gsp: add hal for disp.chan.set_pushbuf()
      drm/nouveau/gsp: add hal for fifo.xlat_rm_engine_type()
      drm/nouveau/gsp: add hal for fifo.ectx_size()
      drm/nouveau/gsp: add hal for gr.get_ctxbufs_info()
      drm/nouveau/gsp: add hal for gsp.set_rmargs()
      drm/nouveau/gsp: add hals for fbsr.suspend/resume()
      drm/nouveau/gsp: add hal for disp.get_supported()
      drm/nouveau/gsp: add hal for disp.get_connect_state()
      drm/nouveau/gsp: add hal for disp.get_active()
      drm/nouveau/gsp: add hal for disp.dp.get_caps()
      drm/nouveau/gsp: add hal for fifo.chan.alloc
      drm/nouveau/gsp: add hal for fifo.rsvd_chids
      drm/nouveau/gsp: add hal for fifo.rc_triggered()
      drm/nouveau/gsp: add hal for disp.chan.dmac_alloc()
      drm/nouveau/gsp: add hal for gsp.sr_data_size()
      drm/nouveau/gsp: add common client alloc code
      drm/nouveau/gsp: add support for 570.144
      drm/nouveau/pci: add PRI address of config space mirror to nvkm_pci_f=
unc
      drm/nouveau/instmem: add hal for set_bar0_window_addr()
      drm/nouveau/mmu: bump up the maximum page table depth
      drm/nouveau/gsp: fetch level shift and PDE from BAR2 VMM
      drm/nouveau/gsp: init client VMMs with NV0080_CTRL_DMA_SET_PAGE_DIREC=
TORY
      drm/nouveau/gsp: support deeper page tables in COPY_SERVER_RESERVED_P=
DES
      drm/nouveau/gv100-: switch to volta semaphore methods
      drm/nouveau: improve handling of 64-bit BARs
      drm/nouveau: add support for GH100
      drm/nouveau: add helper functions for allocating pinned/cpu-mapped bo=
s
      drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling out from CHANNEL_=
DMA
      drm/nouveau/gf100-: track chan progress with non-WFI semaphore releas=
e
      drm/nouveau: add support for GB10x
      drm/nouveau/gsp: add hal for fifo.chan.doorbell_handle
      drm/nouveau: add support for GB20x
      drm/nouveau/kms: add support for GB20x

Bhuvanachandra Pinninti (1):
      drm/amd/display: Refactoring DSC enum dsc_bits_per_comp.

Biju Das (6):
      drm: renesas: rz-du: Add Kconfig dependency between RZG2L_DU and
RZG2L_MIPI_DSI
      drm: renesas: rz-du: Drop bpp variable from struct rzg2l_du_format_in=
fo
      drm: renesas: Add zpos, alpha and blend properties to RZ/G2L DU
      drm: renesas: rz-du: rzg2l_mipi_dsi: Update the comment in
rzg2l_mipi_dsi_start_video()
      drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
      drm/tegra: rgb: Fix the unbound reference count

Boris Brezillon (10):
      accel/ivpu: pages_use_count is now a refcount_t
      accel/ivpu: s/drm_gem_shmem_v[un]map/drm_gem_shmem_v[un]map_locked/
      accel/amdxdna: s/drm_gem_v[un]map_unlocked/drm_gem_v[un]map/
      drm/panthor: Fix GPU_COHERENCY_ACE[_LITE] definitions
      drm/panthor: Call panthor_gpu_coherency_init() after PM resume()
      drm/panthor: Update panthor_mmu::irq::mask when needed
      drm/panthor: Let IRQ handlers clear the interrupts themselves
      drm/panthor: Don't update MMU_INT_MASK in panthor_mmu_irq_handler()
      drm/panthor: Fix the panthor_gpu_coherency_init() error path
      drm/panthor: Don't create a file offset for NO_MMAP BOs

Boyuan Zhang (1):
      drm/amdgpu: enable FW workaround for VCN 4_0_5

Candice Li (1):
      drm/amdgpu: Set RAS EEPROM table version to v3 for umc v12_5

Casey Connolly (1):
      drm/panel: samsung-sofef00: Drop s6e3fc2x01 support

Ce Sun (7):
      drm/amd/pm: Add link reset for SMU 13.0.6
      drm/amdgpu: refactor amdgpu_device_gpu_recover
      drm/amdgpu: Multi-GPU DPC recovery support
      drm/amdgpu/vcn: during dpc recovery will corrupt VCPU buffer
      drm/amdgpu: Replace tmp_adev with hive in amdgpu_pci_slot_reset
      drm/amdgpu: Fix the kernel panic caused by RAS records exceed thresho=
ld
      drm/amdgpu: Modify the count method of defer error

Charlene Liu (5):
      drm/amd/display: fix zero value for APU watermark_c
      drm/amd/display: turn off eDP lcdvdd and backlight if not required
      drm/amd/display: Revert "not disable dtb as dto src at dpms off"
      drm/amd/display: allow dscclk disable
      drm/amd/display: disable DPP RCG before DPP CLK enable

Charles Han (6):
      drm/imx: legacy-bridge: fix inconsistent indenting warning
      drm: pl111: fix inconsistent indenting warning
      drm/vc4: plane: fix inconsistent indenting warning
      drm/sti: fix inconsistent indenting warning
      Documentation: Remove repeated word in docs
      drm/amd/pp: Fix potential NULL pointer dereference in
atomctrl_initialize_mc_reg_table

Chen Linxuan (1):
      drm/i915/pxp: fix undefined reference to
`intel_pxp_gsccs_is_ready_for_sessions'

Chen Ni (3):
      accel/qaic: Remove redundant 'flush_workqueue()' calls
      drm/bridge: anx7625: Remove redundant 'flush_workqueue()' calls
      drm/msm: Convert comma to semicolon

Chen-Yu Tsai (1):
      drm/bridge: anx7625: Use devm_pm_runtime_enable()

Chiawen Huang (1):
      drm/amd/display: Skip backend validation for virtual monitors

Chris Bainbridge (1):
      drm/amd/display: Fix slab-use-after-free in hdcp

Chris Park (1):
      drm/amd/display: Implement HDMI Read Request

Christian K=C3=B6nig (9):
      dma-buf: fix incorrect dma-fence documentation v2
      dma-buf/dma-fence: remove unnecessary callbacks
      dma-buf: dma-buf: stop mapping sg_tables on attach v2
      dma-buf: drop caching of sg_tables
      drm/ttm: test private resv obj on release/destroy
      drm/sched: revert "drm_sched_job_cleanup(): correct false doc"
      drm/amdgpu: Modify the MES process va end limit
      drm/amdgpu: fix call to amdgpu_eviction_fence_detach
      drm/amdgpu: use a dummy owner for sysfs triggered cleaner shaders v4

Christoph Rudorff (1):
      drm/nouveau: fix hibernate on disabled GPU

Christophe JAILLET (1):
      drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe(=
)

Christopher Obbard (1):
      dt-bindings: display: panel: samsung,atna40yk20: document ATNA40YK20

Chun-Liang Chang (1):
      drm/amd/display: Add Read Histogram command header

ChunTao Tso (1):
      drm/amd/display: Add a Panel Replay config option

Colin Ian King (1):
      drm/amdgpu: Fix spelling mistake "rounter" -> "router"

Connor Abbott (1):
      drm/msm: Be more robust when HFI response times out

Cruise (1):
      drm/amd/display: Remove BW Allocation from DPIA notification

Cruise Hung (1):
      drm/amd/display: Support external tunneling feature

Dafna Hirschfeld (2):
      drm/gpusvm: set has_dma_mapping inside mapping loop
      drm/gpusvm: remove unused pages pointer

Damon Ding (11):
      drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of
calling disable_irq()
      drm/bridge: analogix_dp: Remove CONFIG_PM related check in
analogix_dp_bind()/analogix_dp_unbind()
      drm/bridge: analogix_dp: Add support for phy configuration.
      dt-bindings: display: rockchip: analogix-dp: Add support to get
panel from the DP AUX bus
      drm/bridge: analogix_dp: Support to get
&analogix_dp_device.plat_data and &analogix_dp_device.aux
      drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
      drm/bridge: analogix_dp: Add support for &drm_dp_aux.wait_hpd_asserte=
d()
      drm/rockchip: analogix_dp: Add support to get panel from the DP AUX b=
us
      dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
      drm/bridge: analogix_dp: Add support for RK3588
      drm/rockchip: analogix_dp: Add support for RK3588

Dan Carpenter (8):
      drm/i915/gsc: delete a stray tab in intel_gsc_fw_get_binary_info()
      drm/udl: Set error code in udl_init()
      drm/amdgpu: Fix double free in amdgpu_userq_fence_driver_alloc()
      drm/amdgpu: Clean up error handling in amdgpu_userq_fence_driver_allo=
c()
      drm/st7571-i2c: Fix IS_ERR() vs NULL checks in probe()
      drm/amdgpu/userq: Call unreserve on error in
amdgpu_userq_fence_read_wptr()
      drm/amdgpu/userq: remove unnecessary NULL check
      drm/nouveau/tegra: Fix error pointer vs NULL return in
nvkm_device_tegra_resource_addr()

Daniele Ceraolo Spurio (3):
      drm/xe/pxp: do not queue unneeded terminations from debugfs
      drm/xe/vf: Fix guc_info debugfs for VFs
      drm/xe/gsc: do not flush the GSC worker from the reset path

Danilo Krummrich (24):
      rust: device: implement impl_device_context_deref!
      rust: device: implement impl_device_context_into_aref!
      rust: device: implement device context for Device
      rust: platform: preserve device context in AsRef
      rust: pci: preserve device context in AsRef
      rust: device: implement Bound device context
      rust: pci: move iomap_region() to impl Device<Bound>
      rust: devres: require a bound device
      rust: dma: require a bound device
      Merge tag 'topic/device-context-2025-04-17' into nova-next
      rust: pci: impl TryFrom<&Device> for &pci::Device
      rust: platform: impl TryFrom<&Device> for &platform::Device
      rust: types: add `Opaque::zeroed`
      rust: device: implement Device::parent()
      rust: auxiliary: add auxiliary device / driver abstractions
      rust: auxiliary: add auxiliary registration
      samples: rust: add Rust auxiliary driver sample
      drm: drv: implement __drm_dev_alloc()
      MAINTAINERS: add DRM Rust source files to DRM DRIVERS
      rust: revocable: implement Revocable::access()
      rust: devres: implement Devres::access()
      samples: rust: pci: take advantage of Devres::access()
      gpu: nova-core: register auxiliary device for nova-drm
      drm: nova-drm: add initial driver skeleton

Dario Binacchi (1):
      drm/mxsfb: Remove generic DRM drivers in probe function

Dave Airlie (22):
      Merge tag 'drm-misc-next-2025-04-09' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-intel-next-2025-04-11' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      drm/ttm/xe: drop unused force_alloc flag
      Merge tag 'drm-xe-next-2025-04-17' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-xe-next-2025-04-28-1' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-misc-next-2025-04-29' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      BackMerge tag 'v6.15-rc5' into drm-next
      Merge tag 'drm-intel-gt-next-2025-05-08-1' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-2025-05-08' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-intel-next-2025-05-08' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-misc-next-2025-05-08' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.16-2025-05-09' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-2025-05-12' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'mediatek-drm-next-20250515' of
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux
into drm-next
      Merge tag 'drm-intel-next-fixes-2025-05-15' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      drm/dp: add option to disable zero sized address only transactions.
      Merge tag 'topic/drm-next-nouveau-r570-2025-05-19-1' of
https://gitlab.freedesktop.org/drm/kernel into drm-next
      Merge tag 'amd-drm-next-6.16-2025-05-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-msm-next-2025-05-16' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'nova-next-v6.16-2025-05-20' of
https://gitlab.freedesktop.org/drm/nova into drm-next
      Merge tag 'drm-intel-next-fixes-2025-05-22' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2025-05-23' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next

David (Ming Qiang) Wu (1):
      drm/amdgpu: read back register after written for VCN v4.0.5

David Rosca (1):
      drm/amdgpu: Add back JPEG to video caps for carrizo and newer

David Turner (2):
      drm/display: Update comment on hdmi hotplug helper
      drm/vc4: hdmi: Add jack detection to HDMI audio driver

Denis Arefev (1):
      drm/amd/pm/smu11: Prevent division by zero

Dillon Varone (11):
      drm/amd/display: Consider downspread against max clocks in DML2.1
      drm/amd/display: Add Support for reg inbox0 for host->DMUB CMDs
      drm/amd/display: Fix VUpdate offset calculations for dcn401
      Revert "drm/amd/display: Fix VUpdate offset calculations for dcn401"
      drm/amd/display: Fix Vertical Interrupt definitions for dcn32, dcn401
      drm/amd/display: Refactor SubVP cursor limiting logic
      drm/amd/display: Refactor SubVP cursor limiting logic
      drm/amd/display: Only wait for required free space in DMUB mailbox
      drm/amd/display: Backup and restore plane configuration only on updat=
e
      drm/amd/display: Fix race in dmub_srv_wait_for_pending
      drm/amd/display: Modify DCN401 DMUB reset & halt sequence

Dmitry Baryshkov (69):
      drm/display: dp: implement new access helpers
      drm/display: dp: change drm_dp_dpcd_read_link_status() return value
      drm/display: dp: use new DCPD access helpers
      drm/display: dp-cec: use new DCPD access helpers
      drm/display: dp-mst-topology: use new DCPD access helpers
      drm/display: dp-tunnel: use new DCPD access helpers
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/bridge: add function interface for DisplayPort audio implementati=
on
      drm/bridge-connector: hook DisplayPort audio support
      drm/display: hdmi: provide central data authority for ACR params
      drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
      drm/bridge: analogix_dp: drop extra calls to analogix_dp_prepare_pane=
l()
      drm/bridge: analogix_dp: drop unused argument to
analogix_dp_prepare_panel()
      drm/bridge: analogic_dp: drop panel_is_modeset
      drm/bridge: analogic_dp: drop panel_lock
      drm/bridge: analogix_dp: inline analogix_dp_prepare_panel()
      drm/bridge: analogix_dp: ignore return values of drm_panel_* calls
      drm/panel: make prepare/enable and disable/unprepare calls return voi=
d
      drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      drm/msm/dpu: program master INTF value
      drm/msm/dpu: pass master interface to CTL configuration
      drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      drm/msm/dpu: don't select single flush for active CTL blocks
      drm/msm/dpu: allocate single CTL for DPU >=3D 5.0
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >=3D=
 5.0
      drm/msm/dpu: drop now-unused condition for has_legacy_ctls
      dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      drm/msm/mdp4: register the LVDS PLL as a clock provider
      drm/msm/mdp4: use parent_data for LVDS PLL
      drm/msm/mdp4: move move_valid callback to lcdc_encoder
      drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      drm/msm/dpu: allow sharing SSPP between planes
      drm/msm/dpu: enable SmartDMA on SM8150
      drm/msm/dpu: enable SmartDMA on SC8180X
      drm/msm/dpu: enable SmartDMA on SC8280XP
      drm/msm/dpu: enable SmartDMA on SM8550
      drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      dt-bindings: display/msm: dp-controller: describe SAR2130P
      dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
      dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
      dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
      dt-bindings: display/msm: Add Qualcomm SAR2130P
      drm/msm/mdss: add SAR2130P device configuration
      drm/msm/dsi/phy: add configuration for SAR2130P
      drm/msm/dpu: add catalog entry for SAR2130P
      drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timing=
s()
      drm/msm/hdmi: use new helper for ACR tables
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      drm/msm/dpu: drop TE2 definitions
      drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      drm/msm/dp: reuse generic HDMI codec implementation
      dt-bindings: display/msm/hdmi: drop obsolete GPIOs from schema
      drm/msm/hdmi: convert clock and regulator arrays to const arrays
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: ensure that HDMI is up if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P CTL blocks
      dt-bindings: display: msm: correct example in SM8350 MDSS schema

Dmitry Osipenko (12):
      drm/gem: Change locked/unlocked postfix of drm_gem_v/unmap()
function names
      drm/gem: Add _locked postfix to functions that have unlocked counterp=
art
      drm/gem: Document locking rule of vmap and evict callbacks
      drm/shmem-helper: Make all exported symbols GPL
      drm/shmem-helper: Refactor locked/unlocked functions
      drm/shmem-helper: Remove obsoleted is_iomem test
      drm/shmem-helper: Add and use pages_pin_count
      drm/shmem-helper: Use refcount_t for pages_use_count
      drm/shmem-helper: Switch drm_gem_shmem_vmap/vunmap to use pin/unpin
      drm/shmem-helper: Use refcount_t for vmap_use_count
      MAINTAINERS: Add Dmitry Osipenko as drm/virtio co-maintainer
      drm/shmem-helper: Fix unsetting shmem vaddr while vmap refcount > 0

Dominik Kaszewski (3):
      drm/amdgpu: Fix typo in DC_DEBUG_MASK kernel-doc
      drm/amd/display: HDCP Locality check using DMUB Fused IO
      drm/amd/display: Prepare for Fused I2C-over-AUX

Dr. David Alan Gilbert (14):
      drm/gma500: Remove unused mrst_clock_funcs
      drm/gma500/psb_intel_modes: Remove unused psb_intel_ddc_probe
      drm/gma500: Remove unused psb_mmu_virtual_to_pfn
      drm/radeon/radeon_audio: Remove unused r600_hdmi_audio_workaround
      drm/radeon: Remove unused radeon_fence_wait_any
      drm/amd/display: Remove unused *vbios_smu_set_dprefclk
      drm/amd/pm/smu7: Remove unused smu7_copy_bytes_from_smc
      drm/amd/pm/smu11: Remove unused smu_v11_0_get_dpm_level_range
      drm/amd/pm/smu13: Remove unused smu_v3 functions
      dma-buf/sw-sync: Remove unused debug code
      drm/amd/pm/smu13: Remove unused smu_v13_0_init_display_count
      drm/amd/pm: Remove unused smu_mode2_reset_is_support
      drm/amd/pm: Remove remainder of mode2_reset_is_support
      drm/radeon/cik: Clean up doorbells

Egor Vorontsov (2):
      drm/edid: Implement DisplayID Type IX & X timing blocks parsing
      drm/edid: Refactor DisplayID timing block structs

Ellen Pan (5):
      drm/amdgpu: Direct ret in ras_reset_err_cnt on VF
      drm/amdgpu: Add Runtime Bad Page message definitions for VFs
      drm/amdgpu: Implement Runtime Bad Page query for VFs
      drm/amdgpu: Add unrecoverable error message definitions for VFs
      drm/amdgpu: Implement unrecoverable error message handling for VFs

Emily Deng (1):
      drm/amdgpu: Clear overflow for SRIOV

Eric Huang (5):
      drm/amdkfd: add smi events for process start and end
      drm/amdkfd: fix NULL check mistake for process smi event
      drm/amdkfd: fix a bug of smi event for superuser
      drm/amdkfd: add pasid debugfs entries
      drm/amdkfd: change error to warning message for SDMA queues creation

Fangzhi Zuo (1):
      drm/amd/display: Do Not Consider DSC if Valid Config Not Found

Felix Kuehling (4):
      drm/amdgpu: Use allowed_domains for pinning dmabufs
      drm/amdgpu: Don't pin VRAM without DMABUF_MOVE_NOTIFY
      drm/amdgpu: Allow P2P access through XGMI
      drm/amdgpu: Fail DMABUF map of XGMI-accessible memory

Francois Dugast (2):
      drm/xe/svm: Add stats for SVM page faults
      drm/xe/hw_engine_class_sysfs: Allow to inject error during probe

Gabe Teeger (1):
      Revert: "drm/amd/display: Enable urgent latency adjustment on DCN35"

George Shen (2):
      drm/amd/display: Use 16ms AUX read interval for LTTPR with old sinks
      drm/amd/display: fix link_set_dpms_off multi-display MST corner case

Gergo Koteles (1):
      drm/amd/display: do not copy invalid CRTC timing info

Guillaume Ranquet (1):
      drm/mediatek: hdmi: Use regmap instead of iomem for main registers

Gustavo A. R. Silva (8):
      drm/nouveau/conn: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau/outp: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau: fence: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau: svm: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau: disp: Avoid -Wflex-array-member-not-at-end warning
      drm/nouveau: disp: Use __member_size() helper
      drm/nouveau: outp: Use __member_size() helper
      drm/nouveau: chan: Avoid -Wflex-array-member-not-at-end warnings

Gustavo Sousa (5):
      drm/i915/xe3lpd: Map POWER_DOMAIN_AUDIO_PLAYBACK to DC_off
      drm/i915/display: Convert intel_bw.c internally to intel_display
      drm/i915/display: Convert intel_bw.c externally to intel_display
      drm/i915/xe3lpd: Update bandwidth parameters
      drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()

Haoxiang Li (1):
      drm/i915/display: Add check for alloc_ordered_workqueue() and
alloc_workqueue()

Harish Chegondi (4):
      drm/xe/eustall: Fix a possible pointer dereference after free
      drm/xe/eustall: Resolve a possible circular locking dependency
      drm/xe/eustall: Do not support EU stall on SRIOV VF
      drm/xe: Use copy_from_user() instead of __copy_from_user()

Harry Wentland (1):
      drm/amd/display: Don't check for NULL divisor in fixpt code

Harshit Mogalapalli (1):
      drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc=
()

Hector Martin (1):
      lib/vsprintf: Add support for generic FourCCs by extending %p4cc

Heiko Stuebner (2):
      dt-bindings: display: ltk050h3146w: add port property
      dt-bindings: display: ltk500hd1829: add port property

Huacai Chen (1):
      drm: Remove redundant statement in drm_crtc_helper_set_mode()

Huang Rui (3):
      drm/amdgpu: remove mdelay in psp v12
      drm/amdgpu: remove re-route ih in psp v12
      drm/amdgpu: cleanup sriov function for psp v12

Ian Forbes (3):
      drm/vmwgfx: Add seqno waiter for sync_files
      drm/vmwgfx: Fix dumb buffer leak
      drm/vmwgfx: Switch to exclusively using GEM references

Imre Deak (21):
      drm/i915/hpd: Track HPD pins instead of ports for HPD pulse events
      drm/i915/hpd: Let an HPD pin be in the disabled state when
handling missed IRQs
      drm/i915/hpd: Add support for blocking the IRQ handling on an HPD pin
      drm/i915/dp: Fix link training interrupted by a short HPD pulse
      drm/i915/dp: Queue a link check after link training is complete
      drm/i915/crt: Use intel_hpd_block/unblock() instead of
intel_hpd_disable/enable()
      drm/i915/pps: Let calling intel_pps_vdd_{on, off}_unlocked() w/o
PPS lock held
      drm/i915/dp_mst: Fix side-band message timeouts due to long PPS delay=
s
      drm/dp_mst: Fix GUID DPCD write to non-root MST branch devices
      drm/dp_mst: Use drm_dp_dpcd_write_data() to write GUID for
non-root MST branch devices
      drm/i915/dp: Rename intel_dp::link_trained to link.active
      drm/i915/dp_mst: Add intel_dp_mst_{inc, dec}_active_streams()
      drm/i915/dp_mst: Remove stream count assert from
intel_dp_check_mst_status()
      drm/i915/dp_mst: Rename intel_dp_mst_encoder_active_links() to
intel_dp_mst_active_streams()
      drm/i915/dp_mst: Use intel_dp_mst_active_streams() instead of
open-coding it
      drm/i915/dp_mst: Rename intel_dp::mst.active_links to mst.active_stre=
ams
      drm/i915/dp: Use an intel_connector pointer everywhere
      drm/i915/hdmi: Use an intel_connector pointer everywhere
      drm/i915/dp_mst: Use the correct connector while computing the
link BPP limit on MST
      drm/i915/ptl: Use everywhere the correct DDI port clock select mask
      drm/i915/dp_mst: Work around Thunderbolt sink disconnect after
SINK_COUNT_ESI read

Ivan Shamliev (1):
      drm/amd/display: Use true/false for boolean variables in DML2 core fi=
les

Jack Chang (1):
      drm/amd/display: Move desync error counter operation up.

James Flowers (2):
      drm/amd/display: removed unused function
      drm/amd/display: adds kernel-doc comment for dc_stream_remove_writeba=
ck()

Jani Nikula (105):
      drm/i915/color: prefer display->platform.<platform> checks
      drm/i915/connector: convert intel_connector.c to struct intel_display
      drm/i915/hotplug: convert intel_hotplug.[ch] to struct intel_display
      drm/i915/hotplug: convert hotplug debugfs to struct intel_display
      drm/i915/hotplug: convert hotplug irq handling to intel_de_*()
      drm/i915/hotplug: convert intel_hotplug_irq.[ch] to struct intel_disp=
lay
      drm/i915/irq: convert intel_display_irq.[ch] interfaces to
struct intel_display
      drm/i915/irq: convert rest of intel_display_irq.[ch] to struct
intel_display
      drm/i915/display: rename I915_HAS_HOTPLUG() to HAS_HOTPLUG
      drm/i915/display: add display specific runtime PM wrappers
      drm/i915/display: conversions to with_intel_display_rpm()
      drm/i915/display: use display runtime PM interfaces for for atomic st=
ate
      drm/i915/display: convert to display runtime PM interfaces
      drm/i915/power: convert to display runtime PM interfaces
      drm/xe/compat: remove intel_runtime_pm.h
      drm/i915/dsi: convert vlv_dsi.[ch] to struct intel_display
      drm/i915/dsi: convert vlv_dsi_pll.[ch] to struct intel_display
      drm/i915/dsi: convert parameter printing to drm_printer
      drm/i915/dsi: convert intel_dsi_vbt.[ch] to struct intel_display
      drm/i915/dsi: convert intel_dsi_dcs_backlight.c to struct intel_displ=
ay
      drm/i915/dvo: convert intel_dvo.[ch] to struct intel_display
      drm/i915/lvds: convert intel_lvds.[ch] to struct intel_display
      drm/i915/tc: convert intel_tc.c to struct intel_display
      drm/i915/atomic: convert intel_atomic.c to struct intel_display
      drm/i915/display: convert intel_crtc_state_dump.c to struct intel_dis=
play
      drm/i915/pch: convert intel_pch_display.[ch] to struct intel_display
      drm/i915/pch: convert intel_pch_refclk.c to struct intel_display
      drm/i915/dpll: convert intel_dpll.[ch] to struct intel_display
      drm/i915/ddi: convert intel_ddi.c to struct intel_display
      drm/i915/crc: convert intel_pipe_crc.c to struct intel_display
      drm/i915/psr: further conversions to struct intel_display
      drm/i915/wa: convert intel_display_wa.[ch] to struct intel_display
      drm/i915/display: drop some unnecessary intel_de_* compatibility wrap=
pers
      drm/i915/gvt: fix unterminated-string-initialization warning
      drm/i915/gvt: update MAINTAINERS
      drm/i915: reduce intel_wakeref.h dependencies
      drm/i915/gvt: use hardcoded reference clocks
      drm/i915/dsi: separate clock and data lane prepare timing
      drm/i915/dsi: unify naming and simplify checks for dphy params
      drm/i915/wm: convert intel_wm.h external interfaces to struct
intel_display
      drm/i915/wm: convert intel_wm.c internally to struct intel_display
      drm/i915/wm: convert skl_watermark.h external interfaces to
struct intel_display
      drm/i915/wm: convert skl_watermarks.c internally to struct intel_disp=
lay
      drm/i915/wm: convert i9xx_wm.h external interfaces to struct intel_di=
splay
      drm/i915/wm: convert i9xx_wm.c to intel_de_*() register interface
      drm/i915/wm: convert i9xx_wm.c internally to struct intel_display
      drm/i915/debugfs: remove i915_display_capabilities
      drm/i915/debugfs: move PCH type to display caps
      drm/i915/pch: move PCH detection to intel_display_driver_early_probe(=
)
      drm/i915/pch: clean up includes
      drm/i915/dpio: have chv_data_lane_soft_reset() get/put dpio internall=
y
      drm/i915: use 32-bit access for gen2 irq registers
      drm/i915: record GEN2_IER in gtier[0] for pre-ilk error capture
      drm/i915: stop recording IER in error capture
      drm/i915: use display snapshot mechanism for display irq regs
      drm/i915: don't capture DERRMR for VLV/CHV
      drm/i915: use graphics version instead of PCH split in error capture
      drm/i915/irq: convert ibx_irq_reset() into ibx_display_irq_reset()
      drm/i915/fb: convert intel_fbdev.[ch] and intel_fbdev_fb.[ch] to
struct intel_display
      drm/i915/display: convert intel_modeset_setup.[ch] to struct intel_di=
splay
      drm/i915/display: convert intel_modeset_verify.c to struct intel_disp=
lay
      drm/i915/sprite: convert intel_sprite_uapi.c to struct intel_display
      drm/i915/frontbuffer: convert intel_frontbuffer.[ch] to struct
intel_display
      drm/i915/crt: switch to display->platform based platform detection
      drm/i915/dmc: switch to display->platform based platform detection
      drm/i915/dp-aux: switch to display->platform based platform detection
      drm/i915/dpio: switch to display->platform based platform detection
      drm/i915/gmbus: switch to display->platform based platform detection
      drm/i915/hdmi: switch to display->platform based platform detection
      drm/i915/display: switch to display->platform.dgfx from IS_DGFX()
      drm/i915/audio: don't set LPE audio irq chip data, it's unused
      drm/xe/compat: clean up unused platform check macros
      drm/i915/display: pass struct intel_display to PCH macros
      drm/i915/display: drop lots of unnecessary #include i915_drv.h
      drm/i915/pch: abstract fake PCH detection better
      drm/i915/reg: use REG_BIT and friends to define DP registers
      drm/i915/reg: Add/remove some extra blank lines
      drm/i915/backlight: drop dmesg suggestion to file bugs
      drm/i915/error: drop dmesg suggestion to file bugs on GPU hangs
      drm/i915/hdcp: remove duplicate declarations
      drm/i915/hdcp: deduplicate and refactor HDCP GSC ops initialization
      drm/i915/hdcp: split HDCP GSC message alloc/save responsibilities
      drm/i915/hdcp: rename struct intel_hdcp_gsc_message to
intel_hdcp_gsc_context
      drm/i915/hdcp: rename HDCP GSC context alloc/free functions
      drm/i915/hdcp: pass the context to the HDCP GSC message interface
      drm/i915/hdcp: switch the HDCP GSC message interface from u8* to void=
*
      drm/i915/hdcp: simplify HDCP GSC firmware usage selection
      drm/i915/hdcp: pass struct drm_device to driver specific HDCP GSC cod=
e
      drm/i915/hdcp: drop unnecessary include from intel_hdcp_gsc.h
      drm/i915/dpt: convert intel_dpt_common.c to struct intel_display
      drm/i915/hdmi: convert rest of intel_hdmi.c to struct intel_display
      drm/i915/de: drop drm_i915_private compat wrappers from intel_de_*()
      drm/i915/dsi: remove dependency on i915_drv.h
      drm/i915/display: remove struct drm_i915_private forward declaration
      drm/i915/bios: fix a comment referencing struct drm_i915_private
      drm/i915/crtc: pass struct intel_display to DISPLAY_VER()
      drm/i915/irq: move locking inside vlv_display_irq_reset()
      drm/i915/irq: move locking inside valleyview_{enable,
disable}_display_irqs()
      drm/i915/irq: move locking inside vlv_display_irq_postinstall()
      drm/i915/irq: split out i915_display_irq_postinstall()
      drm/i915/irq: split out i965_display_irq_postinstall()
      drm/i915/irq: make i915_enable_asle_pipestat() static
      drm/i915/rps: refactor display rps support
      drm/i915/irq: move i915->irq_lock to display->irq.lock
      drm/i915/rps: fix stale reference to i915->irq_lock

Janusz Krzysztofik (4):
      drm/i915: Downgrade device register error if injected
      drm/i915: Fix PXP cleanup missing from probe error rewind
      drm/i915: Fix harmful driver register/unregister asymmetry
      drm/i915/huc: Fix fence not released on early probe errors

Jeevaka Prabu Badrappan (1):
      drm/xe: Fix CFI violation when accessing sysfs files

Jesse Agate (1):
      drm/amd/display: Always Scale Flag

Jesse Zhang (1):
      drm/amd/amdgpu: Fix out of bounds warning in amdgpu_hw_ip_info

Jesse.Zhang (4):
      drm/amdgpu: Fix API status offset for MES queue reset
      drm/amdgpu: Fix user queue deadlock by reordering mutex locking
      drm/amdgpu: Add GFX 9.5.0 support for per-queue/pipe reset
      drm/amdgpu: Fix circular locking in userq creation

Jesse.zhang@amd.com (10):
      drm/amdgpu: Enable per-queue reset for SDMA v4.4.2 on IP v9.5.0
      drm/amdgpu: Add the new sdma function pointers for amdgpu_sdma.h
      drm/amdgpu/sdma_v4: Register the new sdma function pointers
      drm/amdgpu: switch amdgpu_sdma_reset_engine to use the new sdma
function pointers
      drm/amdgpu: Implement SDMA soft reset directly for v5.x
      drm/amdgpu/: drm/amdgpu: Register the new sdma function pointers
for sdma_v5_0
      drm/amdgpu: Register the new sdma function pointers for sdma_v5_2
      drm/amdgpu: optimize queue reset and stop logic for sdma_v5_0
      drm/amdgpu: optimize queue reset and stop logic for sdma_v5_2
      drm/amdgpu:remove old sdma reset callback mechanism

Jiajia Liu (1):
      drm/i915/pch: fix warning for coffeelake on SunrisePoint PCH

Jiapeng Chong (1):
      drm: Remove unused function rcar_cmm_write

JinZe Xu (1):
      drm/amd/display: Send IPSExit unconditionally.

JinZe.Xu (1):
      drm/amd/display: Use sync version of indirect register access.

Jinjie Ruan (1):
      gpu: host1x: Use for_each_available_child_of_node_scoped()

Jocelyn Falempe (3):
      mm/kmap: Add kmap_local_page_try_from_panic()
      drm/panic: Add support to scanout buffer as array of pages
      drm/panic: Use a decimal fifo to avoid u64 by u64 divide

John Harrison (7):
      drm/xe/guc: Reformat dead CT reason string to be devcoredump compatib=
le
      drm/xe/guc: Re-word message about ADS size changes
      drm/xe/guc: Enable w/a 16026508708
      drm/xe/guc: Bump the recommended GuC version to 70.44.1
      drm/xe/guc: Fix capture of steering registers
      drm/xe/guc: Use the steering flag when printing registers
      drm/xe/guc: Cache DSS info when creating capture register list

John Olender (1):
      drm/amd/display: Defer BW-optimization-blocked DRR adjustments

Jon Hunter (1):
      drm/tegra: Remove unneeded include

Jose Maria Casanova Crespo (2):
      drm/v3d: fix client obtained from axi_ids on V3D 4.1
      drm/v3d: client ranges from axi_ids are different with V3D 7.1

Joshua Aberback (1):
      drm/amd/display: Use meaningful size for block_sequence array

Jos=C3=A9 Exp=C3=B3sito (13):
      drm/vkms: Extract vkms_connector header
      drm/vkms: Create vkms_connector struct
      drm/vkms: Add KUnit test scaffolding
      drm/vkms: Extract vkms_config header
      drm/vkms: Move default_config creation to its own function
      drm/vkms: Set device name from vkms_config
      drm/vkms: Allow to configure multiple planes
      drm/vkms: Allow to configure multiple CRTCs
      drm/vkms: Allow to attach planes and CRTCs
      drm/vkms: Allow to configure multiple encoders
      drm/vkms: Allow to attach encoders and CRTCs
      drm/vkms: Allow to configure multiple connectors
      drm/vkms: Allow to attach connectors and encoders

Jouni H=C3=B6gander (21):
      drm/i915/psr: Add PSR pause/resume reference count
      drm/i915/psr: Prevent DP Panel Replay as well when CRC is enable
      drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for MTL onwards
      drm/i915/display: Add new interface for getting dc_state
      drm/i915/psr: Store enabled non-psr pipes into intel_crtc_state
      drm/i915/dmc: Add PIPEDMC_EVT_CTL register definition
      drm/i915/dmc: Add PIPEDMC_BLOCK_PKGC_SW definitions
      drm/i915/dmc: Add interface to block PKG C-state
      drm/i915/psr: Block PKG C-State when enabling PSR
      drm/i915/psr: Add mechanism to notify PSR of pipe enable/disable
      drm/i915/psr: Add mechanism to notify PSR of DC5/6 enable disable
      drm/i915/psr: Add interface to notify PSR of vblank enable/disable
      drm/i915/dmc: Add interface to control start of PKG C-state exit
      drm/i915/psr: Apply underrun on PSR idle workaround
      drm/i915/display: Rename intel_psr_needs_block_dc_vblank
      drm/i915/display: Rename vblank DC workaround functions and variables
      drm/i915/alpm: use variable from intel_crtc_state instead of intel_ps=
r
      drm/i915/display: Ensure enough lines between delayed VBlank and VBla=
nk
      drm/i915/psr: Move PSR workaround to intel_psr.c
      drm/i915/alpm: Make intel_alpm_enable_sink available for PSR
      drm/i915/alpm: Stop writing ALPM registers when PSR is enabled

Julia Filipchuk (1):
      drm/xe/xe3lpg: Apply Wa_14022293748, Wa_22019794406

Karol Wachowski (1):
      accel/ivpu: Implement heartbeat-based TDR mechanism

Karthi Kandasamy (1):
      drm/amd/display: Move mcache allocation programming from DML to resou=
rce

Kees Cook (3):
      drm/amdgpu/atom: Work around vbios NULL offset false positive
      drm/vkms: Adjust vkms_state->active_planes allocation type
      drm/i915/gt: Remove const from struct i915_wa list allocation

Keisuke Nishimura (1):
      drm/vmwgfx: Add error path for xa_store in vmw_bo_add_detached_resour=
ce

Kenneth Feng (3):
      drm/amd/display: pause the workload setting in dm
      drm/amd/amdgpu: decouple ASPM with pcie dpm
      drm/amd/amdgpu: disable ASPM in some situations

Kenneth Graunke (1):
      drm/xe: Invalidate L3 read-only cachelines for geometry streams too

Kevin Baker (1):
      drm/panel: simple: Update timings for AUO G101EVN010

Kevin Gao (2):
      drm/amd/display: Correct SSC enable detection for DCN351
      drm/amd/display: Add skip rIOMMU dc config option

Khaled Almahallawy (1):
      drm/i915/display: Add link rate and lane count to i915_display_info

Kieran Bingham (1):
      drm: renesas: Extend RZ/G2L supported KMS formats

Konrad Dybcio (2):
      dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
      drm/msm/a6xx: Disable rgb565_predicator on Adreno 7c3

Konstantin Shabanov (1):
      drm/rockchip: vop: Consistently use rk3399 registers consts

Krzysztof Kozlowski (10):
      drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args
      dt-bindings: display: panel: Add Novatek NT37801
      drm/panel: Add Novatek NT37801 panel driver
      drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer reset
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on ctl_path reset
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before blend setup
      drm/msm/dpu: Drop useless comments
      drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
      drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask

Kuninori Morimoto (1):
      drm: xlnx: zynqmp_dpsub: use snd_soc_dummy_dlc

Laurent Pinchart (1):
      drm: renesas: rz-du: Support dmabuf import

Leo Li (1):
      drm/amd/display: Default IPS to RCG_IN_ACTIVE_IPS2_IN_OFF

Leo Zeng (2):
      drm/amd/display: Add override for visual confirm
      drm/amd/display: Get visual confirm color for stream

Lijo Lazar (18):
      drm/amdkfd: Use dev_* instead of pr_* for messages
      drm/amdgpu: Add basic validation for RAS header
      drm/amdgpu: Fix xgmi v6.4.1 link status reporting
      drm/amdgpu: Reset RAS table if header is invalid
      drm/amdgpu: Use generic hdp flush function
      drm/amdgpu: Use the right function for hdp flush
      drm/amdgpu: Disallow partition query during reset
      drm/amd/pm: Reset SMU v13.0.x custom settings
      drm/amdgpu: Fix offset for HDP remap in nbio v7.11
      drm/amdgpu: Fix query order of XGMI v6.4.1 status
      drm/amdgpu: Print bootloader status for long waits
      drm/amd/pm: Fix comment style
      drm/amdgpu: Fix comment style
      Reapply: drm/amdgpu: Use generic hdp flush function
      drm/amdgpu: Log RAS errors during load
      drm/amd/pm: Move SMUv13.0.12 function declarations
      drm/amdgpu: Use compatible NPS mode info
      drm/amdgpu: Allow NPS2-CPX combination for VFs

Lizhi Hou (3):
      accel/amdxdna: Add BO import and export
      accel/amdxdna: Fix incorrect size of ERT_START_NPU commands
      accel/amdxdna: Support submit commands without arguments

Louis Chauvet (1):
      drm/vkms: Add a validation function for VKMS configuration

Luca Ceresoli (26):
      drm/bridge: move bridges_show logic from drm_debugfs.c
      drm/debugfs: add top-level 'bridges' file showing all added bridges
      drm/bridge: imx8qxp-ldb: cleanup return value
      drm/bridge: fsl-ldb: make warning message more informative
      drm/bridge: add devm_drm_bridge_alloc()
      drm/bridge: add support for refcounting
      drm/bridge: make devm_drm_bridge_alloc() mandatory for bridge allocat=
ion
      drm/bridge: ti-sn65dsi83: use dynamic lifetime management
      drm/bridge: samsung-dsim: use dynamic lifetime management
      dt-bindings: display: simple: Add Tianma P0700WXF1MBAA panel
      drm/panel: simple: Tianma TM070JDHG34-00: add delays
      drm/panel: simple: add Tianma P0700WXF1MBAA panel
      platform: arm64: acer-aspire1-ec: convert to devm_drm_bridge_alloc() =
API
      drm/bridge: analogix-anx6345: convert to devm_drm_bridge_alloc() API
      drm/bridge: display-connector: convert to devm_drm_bridge_alloc() API
      drm/bridge: lt9611uxc: convert to devm_drm_bridge_alloc() API
      drm/bridge: dw-hdmi: convert to devm_drm_bridge_alloc() API
      drm/bridge: tda998x: convert to devm_drm_bridge_alloc() API
      drm/bridge: ti-sn65dsi86: convert to devm_drm_bridge_alloc() API
      drm/exynos: mic: convert to devm_drm_bridge_alloc() API
      drm/mcde: convert to devm_drm_bridge_alloc() API
      drm/msm/dp: convert to devm_drm_bridge_alloc() API
      drm/msm/dsi: convert to devm_drm_bridge_alloc() API
      drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
      drm/vc4: convert to devm_drm_bridge_alloc() API
      drm/bridge: imx8*-ldb: convert to devm_drm_bridge_alloc() API

Luca Weiss (1):
      dt-bindings: msm: qcom,mdss: Document interconnect paths

Lucas De Marchi (17):
      drm/gpusvm: Fix kernel-doc
      drm/xe: Remove pointless gen11 assertions
      drm/xe: Remove GEN11 prefixes from documentation
      drm/xe/rtp: Drop sentinels from arg to xe_rtp_process_to_sr()
      drm/xe/uc: Remove static from loop variable
      drm/xe/uc: Add support for different firmware files on each GT
      drm/xe: Move survivability back to xe
      drm/xe: Set survivability mode before heci init
      drm/xe: Allow to inject error in early probe
      drm/i915/dram: Add missing INTEL_DRAM str conversions
      drm/i915/dram: Consolidate logging of DRAM type
      drm/xe: Fix taking invalid lock on wedge
      drm/panel: Fix build error on !CONFIG_OF
      drm/xe: Allow to drop vram resizing
      drm/xe: Set LRC addresses before guc load
      drm/xe/hwmon: Fix kernel version documentation for temperature
      drm/xe/hwmon: Fix kernel version documentation for fan speed

Lucas Stach (1):
      drm/rockchip: vop: remove redundant condition check

Lyude Paul (6):
      drm/edid: Use unsigned int in drm_add_modes_noedid()
      drm/mode_config: Make drm_mode_config.(max|min)_(width|height) unsign=
ed
      rust: drm: gem: Use NonNull for Object::dev
      rust: drm: gem: Refactor IntoGEMObject::from_gem_obj() to as_ref()
      rust: drm: gem: s/into_gem_obj()/as_raw()/
      rust: drm: gem: Implement AlwaysRefCounted for all gem objects
automatically

Maarten Lankhorst (1):
      drm/xe: Remove extra spaces in xe_vm.c

Manikandan Muralidharan (1):
      MAINTAINERS: update Microchip's Atmel-HLCDC driver maintainers

Marcus Folkesson (4):
      dt-bindings: display: Add Sitronix ST7571 LCD Controller
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add entry for Sitronix ST7571 LCD Controller
      drm/sitronix: move tiny Sitronix drivers to their own subdir

Mario Limonciello (14):
      drm/amd/display: Optimize custom brightness curve
      drm/amd/display: Adjust all dev_*() messages to drm_*()
      drm/amd/display: Move PSR support message into amdgpu_dm
      drm/amd/display: Remove double checks for
`debug.enable_mem_low_power.bits.cm`
      drm/amd: Forbid suspending into non-default suspend states
      Documentation/amdgpu: Add Ryzen AI 350 series processors
      drm/amd/display: Avoid divide by zero by initializing dummy pitch to =
1
      drm/amd/display: Fix ACPI edid parsing on some Lenovo systems
      Documentation/amdgpu: Add Ryzen AI Max 300 series processor
      docs: backlight: Clarify `actual_brightness`
      drm/amd: Add per-ring reset for vcn v4.0.5 use
      drm/amd: Add per-ring reset for vcn v4.0.0 use
      drm/amd: Add per-ring reset for vcn v5.0.0 use
      drm/amd/display: Restructure DMI quirks

Masha Grinman (1):
      drm/amdgpu: Move read of snoop register from guest to host

Matt Coster (12):
      dt-bindings: gpu: img: Future-proofing enhancements
      dt-bindings: gpu: img: Add BXS-4-64 devicetree bindings
      drm/imagination: Use new generic compatible string
      drm/imagination: Add power domain control
      drm/imagination: Remove firmware enable_reg
      drm/imagination: Rename event_mask -> status_mask
      drm/imagination: Make has_fixed_data_addr a value
      drm/imagination: Use a lookup table for fw defs
      drm/imagination: Use callbacks for fw irq handling
      drm/imagination: Move ELF fw utils to common file
      drm/imagination: Use cached memory with dma_coherent
      drm/imagination: Add support for TI AM68 GPU

Matt Roper (3):
      drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL in LRC dumps
      drm/xe/bmg: Add one additional PCI ID
      drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique value

Matthew Auld (12):
      drm/xe: use backup object for pinned save/restore
      drm/xe/migrate: ignore CCS for kernel objects
      drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
      drm/xe: unconditionally apply PINNED for pin_map()
      drm/xe: allow non-contig VRAM kernel BO
      drm/xe/sriov: support non-contig VRAM provisioning
      drm/format-helper: fix build
      drm/xe/userptr: fix notifier vs folio deadlock
      drm/xe/dma_buf: stop relying on placement in unmap
      drm/xe: evict user memory in PM notifier
      drm/xe: share bo dma-resv with backup object
      drm/xe: handle pinned memory in PM notifier

Matthew Brost (9):
      drm/xe: Use local fence in error path of xe_migrate_clear
      drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
      drm/xe: Add page queue multiplier
      drm/xe: Add devcoredump chunking
      drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
      drm/print: Add drm_coredump_printer_is_full
      drm/xe: Abort printing coredump in VM printer output if full
      drm/xe: Drop force_alloc from xe_bo_evict in selftests
      drm/xe: Do not print timedout job message on killed exec queues

Maxime Ripard (26):
      drm/display: hdmi: Create documentation section
      drm/display: hdmi: Mention Infoframes testing with edid-decode
      drm/bridge: Add encoder parameter to drm_bridge_funcs.attach
      drm/bridge: Provide a helper to retrieve current bridge state
      drm/tests: Add kunit tests for bridges
      drm/atomic: Introduce helper to lookup connector by encoder
      drm/tests: helpers: Create new helper to enable output
      drm/tests: hdmi_state_helpers: Switch to new helper
      drm/tests: Create tests for drm_atomic
      drm/bridge: Add helper to reset bridge pipeline
      drm/tests: bridge: Provide tests for drm_bridge_helper_reset_crtc
      drm/bridge: ti-sn65dsi83: Switch to drm_bridge_helper_reset_crtc
      drm/bridge: Introduce drm_bridge_is_atomic() helper
      drm/bridge: cdns-csi: Switch to atomic helpers
      drm/bridge: tc358775: Switch to atomic commit
      drm/bridge: tc358768: Stop disabling when failing to enable
      drm/bridge: tc358768: Convert to atomic helpers
      drm/bridge: ti-sn65dsi86: Remove drm_encoder->crtc use
      drm/vc4: tests: Use return instead of assert
      drm/vc4: tests: Document output handling functions
      drm/vc4: tests: Stop allocating the state in test init
      drm/vc4: tests: Retry pv-muxing tests when EDEADLK
      dma-buf: heaps: system: Remove global variable
      drm/panel: auo-a030jtn01: Fix compilation build
      drm/panel: boe-th101mb31ig002-28a: Fix compilation build
      drm/panel: boe-tv101wum-ll2: Fix compilation build

Ma=C3=ADra Canal (5):
      drm/v3d: Associate a V3D tech revision to all supported devices
      dt-bindings: gpu: v3d: Add per-compatible register restrictions
      dt-bindings: gpu: v3d: Add SMS register to BCM2712 compatible
      dt-bindings: gpu: v3d: Add V3D driver maintainer as DT maintainer
      drm/v3d: Use V3D_SMS registers for power on/off and reset on V3D 7.x

Meenakshikumar Somasundaram (2):
      drm/amd/display: Fix pixel rate divider policy for 1 pixel per
cycle config
      drm/amd/display: Assign preferred stream encoder instance to dpia

Melissa Wen (2):
      drm/amd/display: Fix null check of pipe_ctx->plane_state for
update_dchubp_dpp
      Revert "drm/amd/display: Hardware cursor changes color when
switched to software cursor"

Michael Strauss (1):
      drm/amd/display: Add early 8b/10b channel equalization test
pattern sequence

Michal Wajdeczko (16):
      drm/xe: Add MI_LOAD_REGISTER_REG command definition
      drm/xe: Add MI_MATH and ALU instruction definitions
      drm/xe: Avoid reading RMW registers in emit_wa_job
      drm/xe/vf: Stop applying save-restore MMIOs if VF
      drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs
      drm/xe: Prefer USEC_PER_SEC over MICRO
      drm/xe/vf: Don't try Driver-FLR if VF
      drm/xe/vf: Catch all unexpected register reads
      drm/xe/vf: Don't check CTC_MODE[0] if VF
      drm/xe/pf: Drop CTC_MODE from VF runtime register list
      drm/xe/guc: Refactor GuC debugfs initialization
      drm/xe/guc: Don't expose GuC privileged debugfs files if VF
      drm/xe/vf: Don't expose privileged GT debugfs files if VF
      drm/xe/pf: Don't show GGTT/LMEM debugfs files under media GT
      drm/xe/guc: Fix out-of-bound while enabling engine activity stats
      drm/xe: Use GT oriented message to report engine activity error

Michal Wilczynski (2):
      dt-bindings: gpu: Add 'resets' property for GPU initialization
      drm/imagination: Add reset controller support for GPU initialization

Miguel Ojeda (6):
      drm/panic: clean Clippy warning
      drm/panic: add missing space
      drm/panic: add missing Markdown code span
      drm/panic: use `///` for private items too
      rust: device: conditionally expect `dead_code` for `parent()`
      rust: devres: fix doctest build under `!CONFIG_PCI`

Mikko Perttunen (2):
      drm/tegra: falcon: Pipeline firmware copy
      gpu: host1x: Remove mid-job CDMA flushes

Mikolaj Wasiak (2):
      i915/selftest/igt_mmap: let mmap tests run in kthread
      i915/gt/selftests: Disable lrc_timestamp test

Mohammed Thasleem (1):
      drm/i915/dmc: Create debugfs entry for dc6 counter

Nakshtra Goyal (1):
      drm/xe: Add fault injection for xe_oa_alloc_regs

Nathan Chancellor (2):
      drm/sysfb: efidrm: Avoid clang -Wsometimes-uninitialized in
efidrm_device_create()
      drm/panel: himax-hx8279: Always initialize goa_{even,odd}_valid
in hx8279_check_goa_config()

Neil Armstrong (1):
      dt-bindings: display: panel: convert truly,nt35597.txt to dt-schema

Nemesa Garg (1):
      drm/i915/display: Implement wa_14024400148

Nevenko Stupar (1):
      drm/amd/display: Fix the typo in dcn401 Hubp block

Nicholas Kazlauskas (1):
      Revert "drm/amd/display: turn off eDP lcdvdd and backlight if
not required"

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustment on DCN35

Niranjana Vishwanathapura (1):
      drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change

Nitin Gote (1):
      drm/i915/gt: Add delay to let engine resumes properly

Oak Zeng (3):
      drm/xe: Introduced needs_scratch bit in device descriptor
      drm/xe: Clear scratch page on vm_bind
      drm/xe: Allow scratch page under fault mode for certain platform

Ovidiu Bunea (2):
      drm/amd/display: Update IPS sequential_ono requirement checks
      drm/amd/display: Add GPINT retries to ips_query_residency_info

Paul Hsieh (1):
      drm/amd/display: Skip to enable dsc if it has been off

Pekka Paalanen (1):
      drm/doc: document front-buffer rendering

Petr Mladek (1):
      vsprintf: Use %p4chR instead of %p4cn for reading data in
reversed host ordering

Philip Yang (1):
      drm/amdgpu: csa unmap use uninterruptible lock

Philipp Stanner (5):
      drm/sched: Adjust outdated docu for run_job()
      drm/sched: Document run_job() refcount hazard
      drm/sched: Update timedout_job()'s documentation
      drm/sched: Clarify docu concerning drm_sched_job_arm()
      drm/cirrus: Use non-hybrid PCI devres API

Philippe Simons (3):
      drm/panfrost: Add PM runtime flag
      drm/panfrost: add h616 compatible string
      drm/panfrost: reorder pd/clk/rst sequence

Pranav Tyagi (1):
      Documentation: vgaarbiter: Fix grammar

Prike Liang (11):
      drm/amdgpu/gfx11: Implement the GFX11 KGQ pipe reset
      drm/amdgpu/gfx11: Implement the GFX11 KCQ pipe reset
      drm/amdgpu/gfx12: Implement the gfx12 kgq pipe reset
      drm/amdgpu: remove the duplicated mes queue active state setting
      drm/amdgpu/gfx12: Implement the GFX12 KCQ pipe reset
      drm/amdgpu: add the evf attached gem obj resv dump
      drm/amdgpu: set the evf name to identify the userq case
      drm/amdgpu: fix the eviction fence dereference
      drm/amdgpu: promote the implicit sync to the dependent read fences
      drm/amdgpu: unreserve the gem BO before returning from attach error
      drm/amdgpu: fix userq resource double freed

Qasim Ijaz (1):
      drm/ttm/tests: fix incorrect assert in ttm_bo_unreserve_bulk()

Qiu-ji Chen (1):
      drm/tegra: Fix a possible null pointer dereference

Raag Jadav (4):
      drm/xe/hwmon: expose fan speed
      drm/xe: Move xe_device_sysfs_init() to xe_device_probe()
      drm/xe: Expose PCIe link downgrade attributes
      drm/xe/doc: Wire up PCIe Gen5 limitations

Riana Tauro (6):
      drm/xe: Add support for per-function engine activity
      drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
      drm/xe/pf: Enable per-function engine activity stats
      drm/xe: Add configfs to enable survivability mode
      drm/xe: Add documentation for survivability mode
      drm/xe: Enable configfs support for survivability mode

Rob Clark (4):
      drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
      Merge remote-tracking branch 'drm-misc/drm-misc-next' into msm-next
      drm/msm/adreno: Drop fictional address_space_size
      drm/msm/adreno: Remove MODULE_FIRMWARE()'s

Rob Herring (Arm) (2):
      dt-bindings: display: rockchip,vop: Drop assigned-clocks
      dt-bindings: display/msm: hdmi: Fix constraints on additional
'port' properties

Robin Chen (1):
      drm/amd/display: Enable Replay Low Hz feature flag

Rodrigo Siqueira (17):
      Documentation/gpu: Add new acronyms
      Documentation/gpu: Change index order to show driver core first
      Documentation/gpu: Create a documentation entry just for hardware inf=
o
      Documentation/gpu: Add explanation about AMD Pipes and Queues
      Documentation/gpu: Create a GC entry in the amdgpu documentation
      Documentation/gpu: Add an intro about MES
      drm/amdgpu/gfx: Introduce helpers handling CSB manipulation
      drm/amdgpu/gfx: Use CSB helpers in gfx_v11_0_get_csb_buffer
      drm/amdgpu/gfx: Use CSB helpers in gfx_v10_0_get_csb_buffer
      drm/amdgpu/gfx: Use CSB helpers in gfx_v9_0_get_csb_buffer
      drm/amdgpu/gfx: Use CSB helpers in gfx_v8_0_get_csb_buffer
      drm/amdgpu/gfx: Use CSB helpers in gfx_v7_0_get_csb_buffer
      drm/amdgpu/gfx: Fix gfx_v7_0_get_csb_buffer to use rb_config
      drm/amdgpu/gfx: Use CSB helpers in gfx_v6_0_get_csb_buffer
      drm/amdgpu: Add documentation associated with CSB
      drm/amdgpu: Add documentation to some parts of the AMDGPU ring and wb
      Documentation/gpu: Add new entries to amdgpu glossary

Rodrigo Vivi (7):
      drm/xe/guc_pc: Remove duplicated pc_start call
      drm/xe/pm: Temporarily disable D3Cold on BMG
      drm/xe/guc_pc: Retry and wait longer for GuC PC start
      drm/i915/display: Fix htmldocs build
      drm/xe: Restore EIO errno return when GuC PC start fails
      drm/{i915,xe}: Move intel_pch under display
      drm/i915/display: Convert intel_pch towards intel_display

Roman Li (5):
      drm/amd/display: Add htmldocs description for fused_io interface
      drm/amd/display: Fix gpu reset in multidisplay config
      drm/amd/display: Force full update in gpu reset
      drm/amd/display: enable phy-ssc reduction by default
      drm/amd/display: Fix invalid context error in dml helper

Ruijing Dong (1):
      drm/amdgpu/vcn: using separate VCN1_AON_SOC offset

Ruili Ji (3):
      drm/amd/pm: implement dpm vcn reset function
      amd/amdgpu: Init vcn hardware per instance for vcn 4.0.3
      amd/amdgpu: Implement VCN queue reset for vcn 4.0.3

Ryan Seto (1):
      Revert "drm/amd/display: Refactor SubVP cursor limiting logic"

Ryosuke Yasuoka (1):
      drm/virtio: Support drm_panic with non-vmapped shmem BO

Saleemkhan Jamadar (4):
      drm/amd/display: add proper error message for vblank init
      drm/amd/display: add proper error message for vblank init
      drm/amdgpu: map doorbell for the requested userq
      drm/amdgpu: add db size and offset range for VCN and VPE

Samson Tam (2):
      drm/amd/display: disable EASF narrow filter sharpening
      drm/amd/display: add support for 2nd sharpening range

Sarah Walker (1):
      drm/imagination: Add RISC-V firmware processor support

Sathishkumar S (1):
      drm/amdgpu: Enable doorbell for JPEG5_0_1

Satyanarayana K V P (2):
      drm/xe: Introduce fault injection for guc mmio send/recv.
      drm/xe: Introduce fault injection for guc CTB send/recv

Sebastian Aguilera Novoa (1):
      drm/amd/display/dc/irq: Remove duplications of hpd_ack function from =
IRQ

Shane Xiao (3):
      drm/amdkfd: Add rec SDMA engines support with limited XGMI
      drm/amdgpu: Add debug bit for userptr usage
      amd/amdkfd: Trigger segfault for early userptr unmmapping

Shashank Sharma (24):
      drm/amdgpu: add usermode queue base code
      drm/amdgpu: add new IOCTL for usermode queue
      drm/amdgpu: add helpers to create userqueue object
      drm/amdgpu: create MES-V11 usermode queue for GFX
      drm/amdgpu: create context space for usermode queue
      drm/amdgpu: map usermode queue into MES
      drm/amdgpu: map wptr BO into GART
      drm/amdgpu: generate doorbell index for userqueue
      drm/amdgpu: cleanup leftover queues
      drm/amdgpu: enable GFX-V11 userqueue support
      drm/amdgpu: enable compute/gfx usermode queue
      drm/amdgpu: add kernel config for gfx-userqueue
      Revert "drm/amdgpu: don't allow userspace to create a doorbell BO"
      drm/amdgpu: fix userqueue UAPI comments
      drm/amdgpu: bypass SRIOV check for shadow size info
      drm/amdgpu: add get_gfx_shadow_info callback for gfx12
      drm/amdgpu: add new AMDGPU_INFO subquery for userq objects
      drm/amdgpu: add gfx eviction fence helpers
      drm/amdgpu: add userqueue suspend/resume functions
      drm/amdgpu: suspend gfx userqueues
      drm/amdgpu: resume gfx userqueues
      drm/amdgpu: handle eviction fence race
      drm/amdgpu: simplify eviction fence suspend/resume
      drm/amdgpu: enable eviction fence

Sherry Wang (1):
      drm/amd/display: rename IPS2 entry/exit message

Shiwu Zhang (2):
      drm/amdgpu: Update vcn doorbell range in NBIO 7.9
      drm/amdgpu: add debugfs for spirom IFWI dump

Shuicheng Lin (3):
      drm/xe: remove unused LE_COS
      drm/xe: Add config control for svm flush work
      drm/xe: Release force wake first then runtime power

Sk Anirban (1):
      drm/i915/selftests: Refactor RC6 power measurement and error handling

Somalapuram Amaranath (1):
      drm/amdgpu: enable userqueue support for GFX12

Sonny Jiang (1):
      drm/amdgpu: Add DPG pause for VCN v5.0.1

Srinivasan Shanmugam (9):
      drm/amdgpu/gfx10: Add Cleaner Shader Support for GFX10.3.x GPUs
      drm/amdgpu/gfx11: Add Cleaner Shader Support for GFX11.5.2/11.5.3 GPU=
s
      drm/amdgpu: Add PACKET3_RUN_CLEANER_SHADER_9_0 for Cleaner
Shader execution
      drm/amdgpu: Enhance Cleaner Shader Handling in GFX v9.0 Architecture =
v2
      drm/amdgpu: Refine Cleaner Shader MEC firmware version for GFX10.1.x =
GPUs
      drm/amd/display: Add NULL pointer checks in dm_force_atomic_commit()
      drm/amd/display: Fix NULL pointer dereferences in
dm_update_crtc_state() v2
      drm/amd/display: Fix NULL pointer dereference for
program_lut_mode in dcn401_populate_mcm_luts
      drm/amdgpu: Add Support for enforcing isolation without Cleaner Shade=
r

Stefan Wahren (1):
      drm/vc4: hdmi: Call HDMI hotplug helper on disconnect

Stephan Gerhold (1):
      drm/msm/gpu: Fix crash when throttling GPU immediately during boot

Stuart Summers (1):
      drm/xe: Don't print error about hwconfig when using execlists

Sung Lee (1):
      drm/amd/display: Program triplebuffer on all pipes

Sunil Khatri (11):
      drm/amdgpu: Fix the comment to avoid warning
      drm/amdgpu: add the argument description for gpu_addr
      drm/amdgpu/userq: add context and seqno of the fence
      drm/radeon: fix the warning for radeon_cs_parser_fini
      drm/amdgpu: update fence ptr with context:seqno
      drm: add drm_file_err function to add process info
      drm/amdgpu: add drm_file reference in userq_mgr
      drm/amdgpu: use drm_file_err in fence timeouts
      drm/amdgpu: change DRM_ERROR to drm_file_err in amdgpu_userq.c
      drm/amdgpu: change DRM_DBG_DRIVER to drm_dbg_driver
      drm/amdgpu: fix the indentation

Suraj Kandpal (3):
      drm/i915/vdsc: Use the DSC config tables for DSI panels
      drm/dp: Add smooth brightness register bit definition
      drm/i915/backlight: Modify condition to use panel luminance

Taimur Hassan (10):
      drm/amd/display: [FW Promotion] Release 0.1.5.0
      drm/amd/display: Promote DC to 3.2.328
      drm/amd/display: Promote DC to 3.2.329
      drm/amd/display: Promote DC to 3.2.330
      drm/amd/display: [FW Promotion] Release 0.1.8.0
      drm/amd/display: Promote DC to 3.2.331
      drm/amd/display: [FW Promotion] Release 0.1.10.0
      drm/amd/display: Promote DC to 3.2.333
      drm/amd/display: [FW Promotion] Release 0.1.11.0
      drm/amd/display: Promote DAL to 3.2.334

Tang Dongxing (1):
      drm/mediatek: Replace custom compare_dev with component_compare_of

Tao Zhou (8):
      drm/amdgpu: add loop bits for NPS2 page retirement
      drm/amd: add definition for new memory type
      drm/amdgpu: adjust high bits for RAS retired page
      drm/amdgpu: add get_retire_flip_bits for UMC
      drm/amdgpu: implement get_retire_flip_bits for UMC v12
      drm/amdgu: get RAS retire flip bits for new type of HBM
      drm/amdgpu: set flip bits for RAS bad pages
      drm/amdgpu: set vram type for GC 9.5.0

Tejas Upadhyay (3):
      drm/xe: Release guc ids before cancelling work
      drm/xe/hw_engine: define sysfs_ops on all directories
      drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs

Tejas Vipin (6):
      drm/panel: samsung-s6d7aa0: transition to mipi_dsi wrapped functions
      drm/panel: novatek-nt36523: transition to mipi_dsi wrapped functions
      drm/panel: himax-hx8394: transition to mipi_dsi wrapped functions
      drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi wrapped functions
      drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped func=
tions
      drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq

Thierry Reding (1):
      drm/tegra: Assign plane type before registration

Thomas Hellstr=C3=B6m (12):
      drm/xe/userptr: Fix an incorrect assert
      Merge drm/drm-next into drm-xe-next
      drm/xe: Simplify pinned bo iteration
      drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
      drm/xe/svm: Fix a potential bo UAF
      drm/xe/bo: Add a bo remove callback
      drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault
capable devices
      drm/xe: Make the PT code handle placement per PTE rather than
per vma / range
      drm/xe: Fix an out-of-bounds shift when invalidating TLB
      drm/xe: Fix xe_pt_stage_bind_walk kerneldoc
      Merge drm/drm-next into drm-xe-next
      Merge drm/drm-next into drm-xe-next

Thomas Zimmermann (79):
      drm/ast: Replace AST_VIDMEM_SIZE_ with Linux SZ_ constants
      drm/ast: Add VGACRAA register constants
      drm/ast: Add VGACR99 register constants
      drm/ast: cursor: Add helpers for computing location in video memory
      drm/ast: Add helper for computing framebuffer location in video memor=
y
      drm/ast: Remove vram_fb_available from struct ast_device
      drm/ast: cursor: Drop page alignment
      drm/prime: Support dedicated DMA device for dma-buf imports
      drm/appletbdrm: Set struct drm_device.dma_dev
      drm/gm12u320: Set struct drm_device.dma_dev
      drm/gud: Set struct drm_device.dma_dev
      drm/udl: Set struct drm_device.dma_dev
      drm/udl: Unregister device before cleaning up on disconnect
      drm/udl: Switch poll helpers to managed cleanup
      drm/probe-helper: Do not fail from drmm_kms_helper_poll_init()
      drm/cirrus-qemu: Fix pitch programming
      drm/cirrus-qemu: Stricter mode validation
      drm/cirrus-qemu: Use framebuffer format as-is, drop adjustments
      drm/cirrus-qemu: Remove custom plane state
      drm/format-helper: Move helpers for pixel conversion to header file
      drm/format-helper: Add generic conversion to 32-bit formats
      drm/format-helper: Add generic conversion to 24-bit formats
      drm/format-helper: Add generic conversion to 16-bit formats
      drm/format-helper: Add generic conversion to 8-bit formats
      drm/format-helper: Optimize 32-to-24-bpp conversion
      drm/format-helper: Optimize 32-to-16-bpp conversion
      drm/format-helper: Optimize 32-to-8-bpp conversion
      drm/ofdrm: Remove struct ofdrm_device.pdev
      drm/ofdrm: Open-code drm_simple_encoder_init()
      drm/simpledrm: Remove struct simpledrm_device.nformats
      drm: Move sysfb drivers into separate subdirectory
      drm/sysfb: Add struct drm_sysfb_device
      drm/sysfb: Provide single mode-init helper
      drm/sysfb: Merge mode-config functions
      drm/sysfb: Merge connector functions
      drm/sysfb: Maintain CRTC state in struct drm_sysfb_crtc_state
      drm/sysfb: Merge CRTC functions
      drm/sysfb: Merge primary-plane functions
      drm/sysfb: ofdrm: Add EDID support
      firmware: sysfb: Move bpp-depth calculation into screen_info helper
      drm/sysfb: Add efidrm for EFI displays
      drm/sysfb: efidrm: Add EDID support
      drm/sysfb: Add vesadrm for VESA displays
      drm/sysfb: vesadrm: Add EDID support
      drm/sysfb: vesadrm: Add gamma correction
      Merge drm/drm-next into drm-misc-next
      drm/ast: Fix comment on modeset lock
      drm/ast: Remove vaddr field from struct ast_plane
      drm/ast: Validate display modes against framebuffer and format limits
      drm/simpledrm: Do not upcast in release helpers
      drm/sysfb: simpledrm: Remove unused helper simpledrm_device_of_dev()
      efi: Export symbol efi_mem_desc_lookup
      drm/sysfb: efidrm: Support module builds
      drm: Mark CONFIG_DRM_HEADER_TEST as BROKEN
      accel/ivpu: Test for imported buffers with drm_gem_is_imported()
      accel/qaic: Test for imported buffers with drm_gem_is_imported()
      drm/sysfb: Split source file
      drm/sysfb: Share helpers for integer validation
      drm/sysfb: Share helpers for screen_info validation
      drm/udl: Remove unused field dev from struct udl_device
      drm/udl: Remove unused field gem_lock from struct udl_device
      drm/udl: Improve type safety when using struct udl_device
      drm/udl: The number of pixels is always positive
      drm/udl: Handle errors from usb_get_descriptor()
      drm/udl: Return error if vendor descriptor is too short
      drm/udl: Treat vendor descriptor as u8
      drm/udl: Validate length in vendor-descriptor parser
      drm/udl: Support adapters without firmware descriptor
      drm/etnaviv: Test for imported buffers with drm_gem_is_imported()
      drm/etnaviv: Use dma_buf from GEM object instance
      drm/msm: Test for imported buffers with drm_gem_is_imported()
      drm/panfrost: Test for imported buffers with drm_gem_is_imported()
      drm/panthor: Test for imported buffers with drm_gem_is_imported()
      drm/vmwgfx: Test for imported buffers with drm_gem_is_imported()
      drm/vmwgfx: Use dma_buf from GEM object instance
      Merge drm/drm-next into drm-misc-next
      drm/virtio: Test for imported buffers with drm_gem_is_imported()
      drm/virtio: Use dma_buf from GEM object instance
      Merge drm/drm-next into drm-misc-next

Tim Huang (1):
      drm/amdgpu: fix incorrect MALL size for GFX1151

Tomasz Rusinowicz (1):
      drm/xe: Fix exporting xe buffers multiple times

Tomasz Siemek (1):
      drm/amd/display: Extend dc_plane_get_status with flags

TungYu Lu (1):
      drm/amd/display: Correct prefetch calculation

Tvrtko Ursulin (11):
      drm/xe: Fix MOCS debugfs LNCF readout
      drm/xe: Fix ring flush invalidation
      drm/xe: Pass flags directly to emit_flush_imm_ggtt
      drm/xe: Use correct type width for alignment in fb pinning code
      drm: Move some options to separate new Kconfig
      drm/sched: Add scheduler unit testing infrastructure and some basic t=
ests
      drm/sched: Add a simple timeout test
      drm/sched: Add basic priority tests
      drm/sched: Add a basic test for modifying entities scheduler list
      drm/sched: Add a basic test for checking credit limit
      drm/xe: Adjust ringbuf emission for maximum possible size

Vicki Pfau (1):
      drm: panel-orientation-quirks: Add ZOTAC Gaming Zone

Victor Skvortsov (3):
      drm/amdgpu: Add indirect L1_TLB_CNTL reg programming for VFs
      drm/amdgpu: Fix CPER error handling on VFs
      drm/amdgpu: Disable ACA on VFs

Vignesh Raman (9):
      MAINTAINERS: Update drm/ci maintainers
      drm/ci: refactor software-driver stage jobs
      drm/ci: enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH
      drm/ci: enable lockdep detection
      drm/ci: fix merge request rules
      drm/ci: uprev mesa
      drm/ci: uprev IGT
      drm/ci: arm64.config: mediatek: enable PHY drivers
      drm/ci: uprev mesa

Ville Syrj=C3=A4l=C3=A4 (47):
      drm/client: Constify modes
      drm/client: Use array notation for function arguments
      drm/client: Streamline mode selection debugs
      drm/client: Make copies of modes
      drm/client: Stop using the legacy crtc->mode
      drm/client: s/new_crtc/crtc/
      drm/client: Move variables to tighter scope
      drm/client: s/unsigned int i/int i/
      drm/i915: Fix scanline_offset for LNL+ and BMG+
      drm/i915: Reverse the scanline_offset if ladder
      drm/i915: Replace the HAS_DDI() in intel_crtc_scanline_offset()
with specific platform checks
      drm/i915/gvt: Stop using intel_runtime_pm_put_unchecked()
      drm/i915: Enable/disable shared dplls just the once for joined pipes
      drm/i915: Move intel_disable_shared_dpll() into ilk_pch_post_disable(=
)
      drm/i915: Extract intel_memory_type_is_local()
      drm/i915: Expose intel_memory_type_str()
      agp/intel-gtt: Add intel_gmch_gtt_read_entry()
      drm/i915/ggtt: Add intel_ggtt_read_entry()
      drm/i915: Use intel_ggtt_read_entry() in the BIOS FB takeover
      drm/i915: Verify the BIOS FB first PTE on non-LMEMBAR systems
      drm/i915: Use a nicer way to lookup the memory region in BIOS FB take=
over
      drm/i915: Lookup the memory region first in the BIOS FB takeover
      drm/i915: Use intel_memory_region_type_is_local() in the BIOS FB take=
over
      drm/i915: Eliminate the initial_plane_phys_{smem,lmem}() duplication
      drm/i915/dp: Reject HBR3 when sink doesn't support TPS4
      drm/i915: Drop the cached per-pipe min_cdclk[] from bw state
      drm/i915: s/intel_crtc_bw/intel_dbuf_bw/
      drm/i915: Extract intel_dbuf_bw_changed()
      drm/i915: Pass intel_dbuf_bw to skl_*_calc_dbuf_bw() explicitly
      drm/i915: Avoid triggering unwanted cdclk changes due to dbuf
bandwidth changes
      drm/i915: Do more bw readout
      drm/i915: Flag even inactive crtcs as "inherited"
      drm/i915: Drop force_check_qgv
      drm/i915: Extract intel_bw_modeset_checks()
      drm/i915: Extract intel_bw_check_sagv_mask()
      drm/i915: Make intel_bw_check_sagv_mask() internal to intel_bw.c
      drm/i915: Make intel_bw_modeset_checks() internal to
intel_bw_atomic_check()
      drm/i915: Skip bw stuff if per-crtc sagv state doesn't change
      drm/i915: Eliminate intel_compute_sagv_mask()
      drm/i915: Apply the combo PLL frac w/a on DG1
      drm/i915: Simplify combo PLL frac w/a
      drm/i915/vga: Clean up VGACNTRL bits
      drm/i915/vga: Add more VGACNTRL bits
      drm/i915/vga: Extract intel_vga_regs.h
      drm/i915/vga: Include the current pipe in the VGA disable debug messa=
ge
      drm/i915/vga: Nuke vga_redisable_power_on()
      drm/i915/vga: Consolidate intel_vga_disable() calls

Vinay Belgaumkar (3):
      drm/xe: Apply Wa_16023105232
      drm/xe/pmu: Add GT frequency events
      drm/i915/slpc: Balance the inc/dec for num_waiters

Vinod Govindapillai (4):
      drm/i915/fbc: keep FBC disabled if selective update is on in xe2lpd
      drm/i915/fbc: update the panel_replay dependency in fbc wa's
      drm/i915/display: implement wa_18038517565
      drm/i915/display: implement wa_14022269668

Vivek Kasireddy (1):
      drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC

Wayne Lin (8):
      drm/amd/display: Shift DMUB AUX reply command if necessary
      drm/amd/display: Fix the checking condition in dmub aux handling
      drm/amd/display: Remove incorrect checking in dmub aux handler
      drm/amd/display: Copy AUX read reply data whenever length > 0
      drm/amd/display: Fix wrong handling for AUX_DEFER case
      drm/amd/display: Correct the reply value when AUX write incomplete
      drm/amd/display: Return the exact value for debugging
      drm/amd/display: Avoid flooding unnecessary info messages

Wentao Liang (1):
      drm/amd/display: Add error check for avi and vendor infoframe
setup function

William Tseng (1):
      drm/i915/dsi: let HW maintain the HS-TRAIL timing

Wolfram Sang (2):
      drm/bridge: ti-sn65dsi86: make use of debugfs_init callback
      drm/bridge: ti-sn65dsi86: Check bridge connection failure

Xiang Liu (1):
      drm/amdgpu: Print kernel message when error logged by scrub

Xin Wang (1):
      drm/xe: remove redundant check in xe_vm_create_ioctl()

Yifan Zha (1):
      drm/amdgpu: refine MES register print for devices of hive

Yihan Zhu (3):
      drm/amd/display: DCN32 null data check
      drm/amd/display: DCN42 RMCM and MCM 3DLUT support
      drm/amd/display: init local variable to fix format errors

Yiling Chen (1):
      drm/amd/display: To apply the adjusted DP ref clock for DP devices

Yue Haibing (2):
      drm/i915/display: Fix build error without DRM_FBDEV_EMULATION
      drm/xe: Fix unmet direct dependencies warning

Zack Rusin (2):
      drm/vmwgfx: Refactor cursor handling
      drm/vmwgfx: Bump the minor version

Zhang Enpei (2):
      gpu: drm: xlnx: zynqmp_dp: Use dev_err_probe()
      drm/tegra: dpaux: Use dev_err_probe()

ZhenGuo Yin (1):
      drm/amdgpu: fix warning of drm_mm_clean

Zhengqiao Xia (3):
      drm/panel-edp: Add support for AUO B140QAN08.H panel
      drm/panel-edp: Add support for BOE NE140WUM-N6S panel
      drm/panel-edp: Add support for CSW MNE007QS3-8 panel

Zhi Wang (2):
      drm/nouveau/nvkm: factor out current GSP RPC command policies
      drm/nouveau/nvkm: introduce new GSP reply policy NVKM_GSP_RPC_REPLY_P=
OLL

fanhuang (4):
      drm/amdgpu: add vcn v5_0_0 ip headers
      drm/amdgpu/mmsch: Add MMSCH v5_0 support for sriov
      drm/amdgpu/vcn: sriov support for vcn_v5_0_1
      drm/amdgpu/jpeg: sriov support for jpeg_v5_0_1

ganglxie (1):
      Refine RAS bad page records counting and parsing in eeprom V3

 .clang-format                                      |    7 +
 Documentation/ABI/stable/sysfs-class-backlight     |    7 +-
 .../ABI/testing/sysfs-driver-intel-xe-hwmon        |   24 +
 Documentation/core-api/printk-formats.rst          |   32 +
 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml |   41 +
 .../display/mediatek/mediatek,mt8195-hdmi.yaml     |  151 +
 .../bindings/display/msm/dp-controller.yaml        |    1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |    4 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |    2 +
 .../devicetree/bindings/display/msm/hdmi.yaml      |   19 +-
 .../devicetree/bindings/display/msm/mdp4.yaml      |    9 +-
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |   12 +
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  181 +-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  439 ++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |    1 +
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |   13 +-
 .../bindings/display/panel/boe,td4320.yaml         |   65 +
 .../bindings/display/panel/himax,hx8279.yaml       |   75 +
 .../display/panel/leadtek,ltk050h3146w.yaml        |    1 +
 .../display/panel/leadtek,ltk500hd1829.yaml        |    1 +
 .../bindings/display/panel/novatek,nt37801.yaml    |   69 +
 .../bindings/display/panel/panel-simple.yaml       |    6 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    2 +
 .../display/panel/truly,nt35597-2K-display.yaml    |   97 +
 .../display/panel/visionox,g2647fb105.yaml         |   79 +
 .../display/rockchip/rockchip,analogix-dp.yaml     |   25 +-
 .../display/rockchip/rockchip,inno-hdmi.yaml       |   20 +-
 .../bindings/display/rockchip/rockchip-vop.yaml    |    6 -
 .../bindings/display/sitronix,st7571.yaml          |   73 +
 .../devicetree/bindings/display/truly,nt35597.txt  |   59 -
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |   90 +-
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   82 +-
 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   96 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 .../gpu/amdgpu/amd-hardware-list-info.rst          |   23 +
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |   75 +
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |    2 +
 Documentation/gpu/amdgpu/debugfs.rst               |  210 +
 Documentation/gpu/amdgpu/debugging.rst             |    7 +
 Documentation/gpu/amdgpu/display/dc-debug.rst      |    2 +-
 Documentation/gpu/amdgpu/driver-core.rst           |   73 +-
 Documentation/gpu/amdgpu/driver-misc.rst           |   17 -
 Documentation/gpu/amdgpu/gc/index.rst              |   52 +
 Documentation/gpu/amdgpu/gc/mes.rst                |   38 +
 Documentation/gpu/amdgpu/index.rst                 |    5 +-
 .../gpu/amdgpu/pipe_and_queue_abstraction.svg      | 1279 ++++++
 Documentation/gpu/automated_testing.rst            |    4 +
 Documentation/gpu/driver-uapi.rst                  |    5 +
 Documentation/gpu/drm-kms-helpers.rst              |   15 +
 Documentation/gpu/nouveau.rst                      |    3 +
 Documentation/gpu/nova/core/todo.rst               |   16 +-
 Documentation/gpu/todo.rst                         |   13 +-
 Documentation/gpu/vgaarbiter.rst                   |    6 +-
 Documentation/gpu/xe/index.rst                     |    1 +
 Documentation/gpu/xe/xe_configfs.rst               |   10 +
 Documentation/gpu/xe/xe_firmware.rst               |    6 +
 Documentation/gpu/xe/xe_pcode.rst                  |    7 +
 MAINTAINERS                                        |   55 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   27 +-
 drivers/accel/amdxdna/TODO                         |    1 -
 drivers/accel/amdxdna/aie2_ctx.c                   |   67 +-
 drivers/accel/amdxdna/aie2_message.c               |    6 +-
 drivers/accel/amdxdna/aie2_msg_priv.h              |   10 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |   22 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |  499 ++-
 drivers/accel/amdxdna/amdxdna_gem.h                |   24 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   11 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h            |    2 +
 drivers/accel/ivpu/ivpu_drv.c                      |    4 +
 drivers/accel/ivpu/ivpu_drv.h                      |    1 +
 drivers/accel/ivpu/ivpu_fw.h                       |    1 +
 drivers/accel/ivpu/ivpu_gem.c                      |   12 +-
 drivers/accel/ivpu/ivpu_pm.c                       |   20 +
 drivers/accel/qaic/qaic_data.c                     |    8 +-
 drivers/accel/qaic/qaic_debugfs.c                  |    2 -
 drivers/char/agp/intel-gtt.c                       |   55 +
 drivers/dma-buf/dma-buf.c                          |  167 +-
 drivers/dma-buf/dma-fence-unwrap.c                 |   51 +-
 drivers/dma-buf/heaps/system_heap.c                |    3 +-
 drivers/dma-buf/sw_sync.c                          |   16 -
 drivers/dma-buf/sync_debug.c                       |   70 +-
 drivers/dma-buf/sync_debug.h                       |    2 -
 drivers/dma-buf/udmabuf.c                          |    1 -
 drivers/firmware/efi/efi.c                         |    1 +
 drivers/firmware/sysfb_simplefb.c                  |   31 +-
 drivers/gpu/drm/Kconfig                            |  115 +-
 drivers/gpu/drm/Kconfig.debug                      |  116 +
 drivers/gpu/drm/Makefile                           |    4 +
 drivers/gpu/drm/adp/adp-mipi.c                     |    3 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  104 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   18 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |  109 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  525 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  110 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |  233 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h |   69 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  179 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  186 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   20 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   82 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            | 1108 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  107 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   39 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   86 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  112 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   90 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  106 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.h          |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   17 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  924 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |  135 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  968 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h    |   76 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   13 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |  107 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    1 +
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |    8 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   18 +-
 drivers/gpu/drm/amd/amdgpu/cikd.h                  |    3 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    7 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  206 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  139 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  730 +++-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  614 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   46 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   60 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   36 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  171 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   93 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    4 -
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   18 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   46 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   18 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |  146 +-
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |  355 ++
 .../ofa/ad102.c =3D> amd/amdgpu/mes_userqueue.h}     |   30 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   74 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   71 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   66 +-
 drivers/gpu/drm/amd/amdgpu/mmsch_v5_0.h            |  144 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   63 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |    4 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   62 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |    4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c             |  100 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   95 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   36 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  281 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  220 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  140 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  221 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |  413 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |  116 +-
 drivers/gpu/drm/amd/amdgpu/si_enums.h              |  234 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   17 +-
 drivers/gpu/drm/amd/amdgpu/sid.h                   | 1529 +------
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    5 +
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |    5 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  126 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |    5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   21 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   84 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   35 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   20 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  265 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |   76 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    5 -
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   19 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |  145 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |   95 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  142 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |   56 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h    |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    7 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    7 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   24 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   41 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/Makefile     |    1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  781 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   34 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   56 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   13 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   49 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    8 -
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   |  178 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |   39 +-
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |    5 -
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |    4 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |   14 -
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h       |    1 -
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |   14 -
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h        |    1 -
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |   29 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn351_clk_mgr.c  |    1 +
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |    8 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  195 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |    2 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   61 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  111 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   78 +-
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |   22 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  347 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  219 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   21 +
 drivers/gpu/drm/amd/display/dc/dc_fused_io.c       |  148 +
 drivers/gpu/drm/amd/display/dc/dc_fused_io.h       |   31 +
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |    8 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h          |   13 +-
 drivers/gpu/drm/amd/display/dc/dc_state_priv.h     |   20 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   11 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   17 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   62 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    9 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |    2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   19 +-
 drivers/gpu/drm/amd/display/dc/dce60/Makefile      |    3 +-
 .../amd/display/dc/dce80/dce80_timing_generator.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    8 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    1 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    1 +
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    1 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    1 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    3 -
 .../dc/dml2/dml21/dml21_translation_helper.c       |   32 +-
 .../dc/dml2/dml21/dml21_translation_helper.h       |    2 +
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |   48 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.h  |   64 +
 .../drm/amd/display/dc/dml2/dml21/inc/dml_top.h    |    1 +
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    2 +
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |    3 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |   10 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     | 4336 ++++++++++------=
----
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |    2 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |  142 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |    4 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c     |    4 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |    8 +-
 .../dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c    |    2 +-
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |   31 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |   77 +-
 .../dml21/src/inc/dml2_internal_shared_types.h     |    6 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |   24 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   16 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |    5 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |    2 +
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |    9 +-
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |    2 +-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |    5 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |    7 -
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |    6 +
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |    6 -
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |   14 +
 .../drm/amd/display/dc/hubbub/dcn21/dcn21_hubbub.c |    6 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |   26 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    8 +-
 .../dce60/dce60_hwseq.c}                           |    2 +-
 .../dce60/dce60_hwseq.h}                           |    0
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  123 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h    |    7 +
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    4 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   14 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    4 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   23 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    2 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    4 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  368 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |    8 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    8 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |    2 +
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |    3 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   19 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   46 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |    3 +
 drivers/gpu/drm/amd/display/dc/inc/reg_helper.h    |    4 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   10 +-
 .../amd/display/dc/irq/dce120/irq_service_dce120.c |   29 +-
 .../amd/display/dc/irq/dce60/irq_service_dce60.c   |   31 +-
 .../amd/display/dc/irq/dce80/irq_service_dce80.c   |   31 +-
 .../amd/display/dc/irq/dcn10/irq_service_dcn10.c   |   29 +-
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |   29 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |   29 +-
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |   29 +-
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |   30 +-
 .../amd/display/dc/irq/dcn302/irq_service_dcn302.c |   19 +-
 .../amd/display/dc/irq/dcn303/irq_service_dcn303.c |   19 +-
 .../amd/display/dc/irq/dcn31/irq_service_dcn31.c   |   29 +-
 .../amd/display/dc/irq/dcn314/irq_service_dcn314.c |   29 +-
 .../amd/display/dc/irq/dcn315/irq_service_dcn315.c |   29 +-
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.c   |   90 +-
 .../amd/display/dc/irq/dcn35/irq_service_dcn35.c   |   29 +-
 .../amd/display/dc/irq/dcn351/irq_service_dcn351.c |   29 +-
 .../amd/display/dc/irq/dcn36/irq_service_dcn36.c   |   29 +-
 .../amd/display/dc/irq/dcn401/irq_service_dcn401.c |   89 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |   64 +
 drivers/gpu/drm/amd/display/dc/irq/irq_service.h   |    8 +
 drivers/gpu/drm/amd/display/dc/irq_types.h         |   16 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   21 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   19 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    7 +-
 .../display/dc/link/protocols/link_dp_capability.c |   16 +-
 .../display/dc/link/protocols/link_dp_capability.h |    3 +
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |   55 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.h   |    6 +
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |   66 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |    4 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |   11 +-
 .../display/dc/link/protocols/link_dp_training.c   |    1 -
 .../dc/link/protocols/link_dp_training_8b_10b.c    |   52 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   11 +-
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |  418 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |   11 -
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |   14 -
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |    1 +
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |   26 +-
 .../display/dc/resource/dce100/dce100_resource.c   |    6 +-
 .../display/dc/resource/dce110/dce110_resource.c   |    4 +-
 .../display/dc/resource/dce112/dce112_resource.c   |    4 +-
 .../display/dc/resource/dce112/dce112_resource.h   |    2 +-
 .../dc/{ =3D> resource}/dce60/dce60_resource.c       |    6 +-
 .../dc/{ =3D> resource}/dce60/dce60_resource.h       |    0
 .../amd/display/dc/resource/dce80/dce80_resource.c |    4 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |    9 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    6 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.h |    2 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    6 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    6 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.h |    2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    4 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.h |    2 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |    4 +-
 .../display/dc/resource/dcn314/dcn314_resource.h   |    2 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   72 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    6 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    4 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    8 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |    6 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |    8 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   52 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c       |   35 +-
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_types.h |    4 +
 .../gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c   |    4 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  171 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  159 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |  137 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h |    4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  369 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |   21 +-
 .../amd/display/include/gpio_service_interface.h   |    3 +
 .../drm/amd/display/include/link_service_types.h   |    2 +
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |    1 +
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   53 +-
 .../amd/display/modules/hdcp/hdcp2_transition.c    |   48 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |   73 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   38 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    2 +-
 .../drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h |    2 +
 .../gpu/drm/amd/include/asic_reg/gca/gfx_6_0_d.h   |    2 +
 .../gpu/drm/amd/include/asic_reg/oss/oss_1_0_d.h   |   23 +-
 .../drm/amd/include/asic_reg/oss/oss_1_0_sh_mask.h |   41 +
 .../gpu/drm/amd/include/asic_reg/smu/smu_6_0_d.h   |   44 +
 .../drm/amd/include/asic_reg/smu/smu_6_0_sh_mask.h |  188 +-
 .../amd/include/asic_reg/vcn/vcn_5_0_0_offset.h    |   16 +
 .../amd/include/asic_reg/vcn/vcn_5_0_0_sh_mask.h   |   23 +
 drivers/gpu/drm/amd/include/atombios.h             |    2 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |    1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    1 +
 drivers/gpu/drm/amd/include/v11_structs.h          |    8 +-
 drivers/gpu/drm/amd/include/v12_structs.h          |    8 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   43 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   34 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    3 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  360 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c         |   42 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |    8 +
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c  |   36 -
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.h  |    2 -
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   27 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   29 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |    7 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h       |    5 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   25 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    6 -
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   39 -
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   19 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  123 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   38 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  155 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   31 +-
 drivers/gpu/drm/ast/ast_cursor.c                   |   45 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   17 +-
 drivers/gpu/drm/ast/ast_mm.c                       |   26 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   73 +-
 drivers/gpu/drm/ast/ast_post.c                     |   24 +-
 drivers/gpu/drm/ast/ast_reg.h                      |    2 +
 drivers/gpu/drm/bridge/Kconfig                     |    1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    3 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   41 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   33 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  194 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |    3 -
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |   52 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   47 +-
 drivers/gpu/drm/bridge/aux-bridge.c                |    3 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |    1 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  207 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h     |    2 -
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   77 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |    6 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |    5 +-
 drivers/gpu/drm/bridge/display-connector.c         |    9 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |    9 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |   11 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |    5 +-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |    9 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |    3 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |   32 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |   22 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |    3 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |    3 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |    3 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |    7 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   47 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |    3 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |    3 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |    3 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    5 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   16 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |    3 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    1 +
 drivers/gpu/drm/bridge/microchip-lvds.c            |    3 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |    3 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    5 +-
 drivers/gpu/drm/bridge/panel.c                     |    3 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |    1 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |    3 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   10 +-
 drivers/gpu/drm/bridge/sii902x.c                   |    6 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |    1 +
 drivers/gpu/drm/bridge/simple-bridge.c             |    5 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |    1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   14 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    5 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |    5 +-
 drivers/gpu/drm/bridge/tc358762.c                  |    3 +-
 drivers/gpu/drm/bridge/tc358764.c                  |    3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |    2 +
 drivers/gpu/drm/bridge/tc358768.c                  |   41 +-
 drivers/gpu/drm/bridge/tc358775.c                  |   45 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |    8 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |    3 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |    4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   38 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  115 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |    6 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    5 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |    3 +-
 drivers/gpu/drm/ci/arm64.config                    |    2 +
 drivers/gpu/drm/ci/build-igt.sh                    |    2 +-
 drivers/gpu/drm/ci/build.sh                        |   20 +-
 drivers/gpu/drm/ci/build.yml                       |   14 +-
 drivers/gpu/drm/ci/container.yml                   |   24 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   57 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |   11 +
 drivers/gpu/drm/ci/image-tags.yml                  |    4 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |    5 +-
 drivers/gpu/drm/ci/test.yml                        |   76 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |    8 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |    1 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   23 +-
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |    1 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |    8 +-
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   20 +-
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |    2 +-
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   32 +-
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt       |   13 +-
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |    5 -
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |    9 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |    1 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   22 +-
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |    1 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   20 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |    7 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   28 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt   |   21 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |    1 +
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt     |    1 +
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |    4 -
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt    |    1 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |    1 +
 .../msm-sc7180-trogdor-kingoftown-flakes.txt       |    7 +
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |    4 +
 .../msm-sc7180-trogdor-lazor-limozeen-flakes.txt   |    7 +
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |    1 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |    7 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |  313 ++
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt |    1 +
 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt  |    1 +
 .../gpu/drm/ci/xfails/panfrost-mt8183-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-rk3288-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/panfrost-rk3399-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |    1 -
 .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |    2 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   30 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |    1 +
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |    1 +
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |    1 +
 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt     |   28 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |    2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |  160 +-
 drivers/gpu/drm/display/drm_dp_cec.c               |   37 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |  467 ++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  116 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c            |   20 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  168 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  294 +-
 drivers/gpu/drm/drm_atomic.c                       |   59 +
 drivers/gpu/drm/drm_atomic_helper.c                |    3 +
 drivers/gpu/drm/drm_blend.c                        |    6 +
 drivers/gpu/drm/drm_bridge.c                       |  167 +-
 drivers/gpu/drm/drm_bridge_helper.c                |   58 +
 drivers/gpu/drm/drm_client.c                       |   10 +-
 drivers/gpu/drm/drm_client_modeset.c               |  261 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |    1 -
 drivers/gpu/drm/drm_debugfs.c                      |   38 +-
 drivers/gpu/drm/drm_displayid_internal.h           |   31 +-
 drivers/gpu/drm/drm_draw.c                         |  100 +-
 drivers/gpu/drm/drm_drv.c                          |   81 +-
 drivers/gpu/drm/drm_edid.c                         |  101 +-
 drivers/gpu/drm/drm_file.c                         |   34 +
 drivers/gpu/drm/drm_format_helper.c                |  376 +-
 drivers/gpu/drm/drm_format_internal.h              |  160 +
 drivers/gpu/drm/drm_gem.c                          |   26 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |    6 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  147 +-
 drivers/gpu/drm/drm_gpusvm.c                       |    4 -
 drivers/gpu/drm/drm_internal.h                     |    4 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |   37 +
 drivers/gpu/drm/drm_mode_config.c                  |    7 +
 drivers/gpu/drm/drm_panel.c                        |  146 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    6 +
 drivers/gpu/drm/drm_panic.c                        |  144 +-
 drivers/gpu/drm/drm_panic_qr.rs                    |  104 +-
 drivers/gpu/drm/drm_plane.c                        |   52 +-
 drivers/gpu/drm/drm_prime.c                        |    7 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   11 +-
 drivers/gpu/drm/drm_syncobj.c                      |   47 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |    8 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |    7 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |    4 +-
 drivers/gpu/drm/gma500/mmu.c                       |   41 -
 drivers/gpu/drm/gma500/mmu.h                       |    2 -
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |    7 -
 drivers/gpu/drm/gma500/psb_intel_drv.h             |    1 -
 drivers/gpu/drm/gma500/psb_intel_modes.c           |   31 -
 drivers/gpu/drm/gud/gud_drv.c                      |   33 +-
 drivers/gpu/drm/gud/gud_internal.h                 |    1 -
 drivers/gpu/drm/hisilicon/hibmc/Makefile           |    3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c        |   16 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h       |   10 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h     |    2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c         |   91 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h         |   36 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |   94 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h        |  150 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c     |   71 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c    |  104 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c     |   74 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   85 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   12 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |    3 +
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |    4 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |    4 +-
 drivers/gpu/drm/i915/Makefile                      |    3 +-
 drivers/gpu/drm/i915/display/dvo_ch7017.c          |    2 +
 drivers/gpu/drm/i915/display/dvo_ch7xxx.c          |    2 +
 drivers/gpu/drm/i915/display/dvo_ivch.c            |    2 +
 drivers/gpu/drm/i915/display/dvo_ns2501.c          |    2 +
 drivers/gpu/drm/i915/display/dvo_sil164.c          |    2 +
 drivers/gpu/drm/i915/display/dvo_tfp410.c          |    2 +
 drivers/gpu/drm/i915/display/g4x_dp.c              |   62 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   32 +-
 drivers/gpu/drm/i915/display/hsw_ips.c             |    8 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |   73 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             | 1216 +++---
 drivers/gpu/drm/i915/display/i9xx_wm.h             |   18 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  102 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |  191 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |   12 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |   23 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |   18 +-
 drivers/gpu/drm/i915/display/intel_atomic_plane.h  |    6 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   12 +-
 drivers/gpu/drm/i915/display/intel_backlight.c     |   47 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   25 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  643 +--
 drivers/gpu/drm/i915/display/intel_bw.h            |   18 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   23 +-
 drivers/gpu/drm/i915/display/intel_cmtg.c          |    1 -
 drivers/gpu/drm/i915/display/intel_color.c         |   18 +-
 drivers/gpu/drm/i915/display/intel_combo_phy.c     |    2 +
 drivers/gpu/drm/i915/display/intel_connector.c     |   45 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   63 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |    9 +-
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   47 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    3 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   31 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   15 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  924 ++---
 drivers/gpu/drm/i915/display/intel_de.h            |   30 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  211 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   34 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |   44 +-
 .../gpu/drm/i915/display/intel_display_device.c    |   13 +-
 .../gpu/drm/i915/display/intel_display_device.h    |   10 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   83 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  969 ++---
 drivers/gpu/drm/i915/display/intel_display_irq.h   |   82 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  129 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |    1 +
 .../gpu/drm/i915/display/intel_display_power_map.c |    1 +
 .../drm/i915/display/intel_display_power_well.c    |   44 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    4 +-
 drivers/gpu/drm/i915/display/intel_display_rpm.c   |   68 +
 drivers/gpu/drm/i915/display/intel_display_rpm.h   |   37 +
 drivers/gpu/drm/i915/display/intel_display_rps.c   |   23 +
 drivers/gpu/drm/i915/display/intel_display_rps.h   |   24 +
 .../gpu/drm/i915/display/intel_display_snapshot.c  |    5 +
 drivers/gpu/drm/i915/display/intel_display_types.h |   19 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |   30 +-
 drivers/gpu/drm/i915/display/intel_display_wa.h    |   11 +-
 drivers/gpu/drm/i915/display/intel_dkl_phy.c       |    1 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |  152 +-
 drivers/gpu/drm/i915/display/intel_dmc.h           |    5 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |   14 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  240 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |    3 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   42 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |    6 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   48 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  138 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |    2 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c      |   25 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |  328 +-
 drivers/gpu/drm/i915/display/intel_dpll.h          |   13 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   27 +-
 drivers/gpu/drm/i915/display/intel_dpt.c           |    7 +-
 drivers/gpu/drm/i915/display/intel_dpt_common.c    |   15 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   24 +-
 drivers/gpu/drm/i915/display/intel_dsi.c           |    7 +-
 .../gpu/drm/i915/display/intel_dsi_dcs_backlight.c |    7 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  216 +-
 drivers/gpu/drm/i915/display/intel_dvo.c           |   64 +-
 drivers/gpu/drm/i915/display/intel_dvo.h           |    6 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |    4 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c        |    7 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |   52 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         |   83 +-
 drivers/gpu/drm/i915/display/intel_fbdev.h         |    6 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |   13 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |    4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   18 +-
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |   79 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.c   |   60 +-
 drivers/gpu/drm/i915/display/intel_frontbuffer.h   |    8 +-
 drivers/gpu/drm/i915/display/intel_global_state.c  |    5 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   38 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   21 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c      |  124 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |   20 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |  181 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.h  |   63 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  276 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |  678 +--
 drivers/gpu/drm/i915/display/intel_hotplug.h       |   31 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |  672 ++-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.h   |   28 +-
 drivers/gpu/drm/i915/display/intel_hti.c           |    1 +
 drivers/gpu/drm/i915/display/intel_load_detect.c   |    1 +
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |    2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c        |    1 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |  161 +-
 drivers/gpu/drm/i915/display/intel_lvds.h          |   18 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |  230 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.h |    4 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |   17 +-
 drivers/gpu/drm/i915/display/intel_overlay.c       |    6 +-
 drivers/gpu/drm/i915/display/intel_pch.c           |  340 ++
 drivers/gpu/drm/i915/display/intel_pch.h           |   58 +
 drivers/gpu/drm/i915/display/intel_pch_display.c   |  202 +-
 drivers/gpu/drm/i915/display/intel_pch_display.h   |   10 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.c    |  133 +-
 drivers/gpu/drm/i915/display/intel_pch_refclk.h    |   18 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |  140 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   93 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c      |   33 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   43 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  524 ++-
 drivers/gpu/drm/i915/display/intel_psr.h           |   10 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   28 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |    2 +
 drivers/gpu/drm/i915/display/intel_sprite.c        |    3 +-
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |   17 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |  288 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   18 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |   11 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   23 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |   68 +-
 drivers/gpu/drm/i915/display/intel_vga.h           |    2 -
 drivers/gpu/drm/i915/display/intel_vga_regs.h      |   36 +
 drivers/gpu/drm/i915/display/intel_vrr.c           |  325 +-
 drivers/gpu/drm/i915/display/intel_vrr.h           |    6 +
 drivers/gpu/drm/i915/display/intel_wm.c            |  171 +-
 drivers/gpu/drm/i915/display/intel_wm.h            |   14 +-
 drivers/gpu/drm/i915/display/skl_scaler.c          |    4 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   21 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |  741 ++--
 drivers/gpu/drm/i915/display/skl_watermark.h       |   24 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  160 +-
 drivers/gpu/drm/i915/display/vlv_dsi.h             |    6 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |  118 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h         |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.h        |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h        |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h  |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c         |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_internal.c       |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_ioctls.h         |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c           |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.h           |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c           |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.h             |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c       |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_throttle.c       |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c         |    3 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |    5 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |    3 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.c              |    3 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.h              |    3 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |   14 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c               |   56 +
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c          |    8 +
 drivers/gpu/drm/i915/gt/intel_gtt.c                |    1 -
 drivers/gpu/drm/i915/gt/intel_gtt.h                |    6 +
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    1 -
 drivers/gpu/drm/i915/gt/intel_mocs.c               |    1 -
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |    8 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   26 +-
 drivers/gpu/drm/i915/gt/intel_rps_types.h          |    2 +-
 drivers/gpu/drm/i915/gt/intel_wopcm.h              |    3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |    2 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c             |    9 +
 drivers/gpu/drm/i915/gt/selftest_rc6.c             |   54 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c             |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c          |    2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |    7 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 |    5 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |    6 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |    9 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |   28 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c            |    5 +-
 drivers/gpu/drm/i915/i915_debugfs.c                |    2 -
 drivers/gpu/drm/i915/i915_driver.c                 |   49 +-
 drivers/gpu/drm/i915/i915_driver.h                 |    1 -
 drivers/gpu/drm/i915/i915_drv.h                    |    8 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   48 +-
 drivers/gpu/drm/i915/i915_gpu_error.h              |    3 -
 drivers/gpu/drm/i915/i915_irq.c                    |  158 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  150 +-
 drivers/gpu/drm/i915/i915_utils.h                  |    2 -
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    1 +
 drivers/gpu/drm/i915/intel_memory_region.c         |   15 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |    3 +
 drivers/gpu/drm/i915/intel_wakeref.h               |   11 +-
 drivers/gpu/drm/i915/soc/intel_dram.c              |   17 +-
 drivers/gpu/drm/i915/soc/intel_pch.c               |  316 --
 drivers/gpu/drm/i915/soc/intel_pch.h               |   56 -
 drivers/gpu/drm/imagination/Makefile               |    2 +
 drivers/gpu/drm/imagination/pvr_debugfs.c          |    3 +-
 drivers/gpu/drm/imagination/pvr_device.c           |  147 +-
 drivers/gpu/drm/imagination/pvr_device.h           |   40 +-
 drivers/gpu/drm/imagination/pvr_drv.c              |   16 +
 drivers/gpu/drm/imagination/pvr_free_list.c        |    3 +-
 drivers/gpu/drm/imagination/pvr_fw.c               |   40 +-
 drivers/gpu/drm/imagination/pvr_fw.h               |   85 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c          |   26 +-
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |   85 +-
 drivers/gpu/drm/imagination/pvr_fw_riscv.c         |  165 +
 drivers/gpu/drm/imagination/pvr_fw_startstop.c     |   17 +
 drivers/gpu/drm/imagination/pvr_fw_trace.c         |   31 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.h         |    2 -
 drivers/gpu/drm/imagination/pvr_fw_util.c          |   66 +
 drivers/gpu/drm/imagination/pvr_gem.c              |   18 +-
 drivers/gpu/drm/imagination/pvr_gem.h              |    6 +-
 drivers/gpu/drm/imagination/pvr_hwrt.c             |   12 +-
 drivers/gpu/drm/imagination/pvr_mmu.c              |    8 +-
 drivers/gpu/drm/imagination/pvr_power.c            |  136 +-
 drivers/gpu/drm/imagination/pvr_power.h            |    3 +
 drivers/gpu/drm/imagination/pvr_rogue_cr_defs.h    |  153 +-
 drivers/gpu/drm/imagination/pvr_rogue_riscv.h      |   41 +
 drivers/gpu/drm/imagination/pvr_stream.c           |   12 +-
 drivers/gpu/drm/imagination/pvr_vm_mips.c          |    3 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |    3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    5 +-
 drivers/gpu/drm/lima/lima_gem.c                    |    4 +-
 drivers/gpu/drm/lima/lima_sched.c                  |    4 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   10 +-
 drivers/gpu/drm/mediatek/Makefile                  |    8 +-
 drivers/gpu/drm/mediatek/mtk_cec.c                 |    7 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |    7 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |    3 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  120 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   31 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |    3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  415 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.h                |   14 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |    2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |    3 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |    3 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |    3 +-
 drivers/gpu/drm/msm/Kconfig                        |    1 +
 drivers/gpu/drm/msm/Makefile                       |    1 -
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    5 -
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |    5 -
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    3 -
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |    9 -
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   44 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   96 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |    3 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   73 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   21 +
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   19 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |    5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |    2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |    1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |    2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |    8 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |    8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |    8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |    6 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |    8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   21 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   20 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |   14 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |    6 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |    5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |    8 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |    4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |    8 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |    2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |    4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |    5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   21 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |    5 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |    5 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   25 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  433 ++
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |    9 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  156 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   25 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |    2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   34 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   16 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |   50 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |  121 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c      |   51 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  131 +-
 drivers/gpu/drm/msm/dp/dp_audio.h                  |   27 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  146 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   55 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |    6 -
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   17 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |   18 +-
 drivers/gpu/drm/msm/dp/dp_link.h                   |    4 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   18 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   12 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   50 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  133 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   26 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c              |  107 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   73 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |   89 +-
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |   14 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |    6 +-
 drivers/gpu/drm/msm/msm_drv.c                      |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                      |    4 +-
 drivers/gpu/drm/msm/msm_gem.h                      |    2 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |    4 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |    1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   11 +
 drivers/gpu/drm/msm/msm_ringbuffer.c               |    2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |    4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   14 +-
 drivers/gpu/drm/nouveau/Kbuild                     |    2 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c            |   22 +-
 drivers/gpu/drm/nouveau/dispnv50/Kbuild            |    4 +
 drivers/gpu/drm/nouveau/dispnv50/core.c            |    1 +
 drivers/gpu/drm/nouveau/dispnv50/core.h            |    6 +
 drivers/gpu/drm/nouveau/dispnv50/core507d.c        |    1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c        |    3 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c        |    2 +
 drivers/gpu/drm/nouveau/dispnv50/coreca7d.c        |  122 +
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |    4 +
 drivers/gpu/drm/nouveau/dispnv50/crc.h             |    1 +
 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c         |   98 +
 drivers/gpu/drm/nouveau/dispnv50/curs.c            |    1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   50 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c            |    1 +
 drivers/gpu/drm/nouveau/dispnv50/head.h            |    5 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c        |    2 +-
 drivers/gpu/drm/nouveau/dispnv50/headca7d.c        |  297 ++
 drivers/gpu/drm/nouveau/dispnv50/wimm.c            |    1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   25 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |    3 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |    1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c        |  209 +
 drivers/gpu/drm/nouveau/gv100_fence.c              |   93 +
 .../gpu/drm/nouveau/include/nvhw/class/clc36f.h    |   52 +
 .../gpu/drm/nouveau/include/nvhw/class/clc97b.h    |   22 +
 .../gpu/drm/nouveau/include/nvhw/class/clca7d.h    |  868 ++++
 .../gpu/drm/nouveau/include/nvhw/class/clca7e.h    |  137 +
 .../include/nvhw/ref/gb100/dev_hshub_base.h        |   28 +
 .../drm/nouveau/include/nvhw/ref/gb10b/dev_fbhub.h |   18 +
 .../drm/nouveau/include/nvhw/ref/gb202/dev_ce.h    |   12 +
 .../drm/nouveau/include/nvhw/ref/gb202/dev_therm.h |   17 +
 .../nouveau/include/nvhw/ref/gh100/dev_falcon_v4.h |   20 +
 .../drm/nouveau/include/nvhw/ref/gh100/dev_fb.h    |   15 +
 .../nouveau/include/nvhw/ref/gh100/dev_fsp_pri.h   |   28 +
 .../drm/nouveau/include/nvhw/ref/gh100/dev_mmu.h   |  173 +
 .../nouveau/include/nvhw/ref/gh100/dev_riscv_pri.h |   14 +
 .../drm/nouveau/include/nvhw/ref/gh100/dev_therm.h |   17 +
 .../include/nvhw/ref/gh100/dev_xtl_ep_pri.h        |   10 +
 .../nouveau/include/nvhw/ref/gh100/pri_nv_xal_ep.h |   13 +
 drivers/gpu/drm/nouveau/include/nvif/chan.h        |   76 +
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h      |    2 +
 drivers/gpu/drm/nouveau/include/nvif/class.h       |   35 +
 drivers/gpu/drm/nouveau/include/nvif/object.h      |    2 +-
 drivers/gpu/drm/nouveau/include/nvif/push.h        |   14 +-
 drivers/gpu/drm/nouveau/include/nvif/push906f.h    |    1 +
 drivers/gpu/drm/nouveau/include/nvif/pushc97b.h    |   18 +
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |   17 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h |    7 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h |    1 -
 drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h |    3 -
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   |    1 -
 .../gpu/drm/nouveau/include/nvkm/engine/nvdec.h    |    2 -
 .../gpu/drm/nouveau/include/nvkm/engine/nvenc.h    |    2 -
 .../gpu/drm/nouveau/include/nvkm/engine/nvjpg.h    |    8 -
 drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h  |    9 -
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h   |    3 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h  |   24 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  132 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/instmem.h  |    6 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h  |    4 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/pci.h  |    1 +
 .../common/sdk/nvidia/inc/class/cl0000.h           |   38 -
 .../common/sdk/nvidia/inc/class/cl0005.h           |   38 -
 .../common/sdk/nvidia/inc/class/cl0080.h           |   43 -
 .../common/sdk/nvidia/inc/class/cl2080.h           |   35 -
 .../sdk/nvidia/inc/class/cl2080_notification.h     |   62 -
 .../common/sdk/nvidia/inc/class/cl84a0.h           |   33 -
 .../common/sdk/nvidia/inc/class/cl90f1.h           |   31 -
 .../common/sdk/nvidia/inc/class/clc0b5sw.h         |   34 -
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h  |   39 -
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h     |  166 -
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h      |  335 --
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h    |  216 -
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h  |   65 -
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h     |   48 -
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h      |   31 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h    |   40 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h      |   35 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h   |   41 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h      |   51 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h    |   52 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h     |  100 -
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h      |   41 -
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h    |  162 -
 .../common/sdk/nvidia/inc/ctrl/ctrl90f1.h          |   95 -
 .../sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h  |   42 -
 .../535.113.01/common/sdk/nvidia/inc/nvlimits.h    |   33 -
 .../nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h   |  148 -
 .../common/shared/msgq/inc/msgq/msgq_priv.h        |   97 -
 .../uproc/os/common/include/libos_init_args.h      |   52 -
 .../arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h   |   79 -
 .../arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h  |  170 -
 .../nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h  |   82 -
 .../nvidia/arch/nvalloc/common/inc/rmgspseq.h      |  100 -
 .../535.113.01/nvidia/generated/g_allclasses.h     |   33 -
 .../535.113.01/nvidia/generated/g_chipset_nvoc.h   |   38 -
 .../nvrm/535.113.01/nvidia/generated/g_fbsr_nvoc.h |   31 -
 .../nvrm/535.113.01/nvidia/generated/g_gpu_nvoc.h  |   35 -
 .../nvidia/generated/g_kernel_channel_nvoc.h       |   62 -
 .../nvidia/generated/g_kernel_fifo_nvoc.h          |  119 -
 .../535.113.01/nvidia/generated/g_mem_desc_nvoc.h  |   32 -
 .../nvrm/535.113.01/nvidia/generated/g_os_nvoc.h   |   44 -
 .../535.113.01/nvidia/generated/g_rpc-structures.h |  124 -
 .../535.113.01/nvidia/generated/g_sdk-structures.h |   45 -
 .../nvidia/inc/kernel/gpu/gpu_acpi_data.h          |   74 -
 .../nvidia/inc/kernel/gpu/gpu_engine_type.h        |   86 -
 .../nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h        |   33 -
 .../nvidia/inc/kernel/gpu/gsp/gsp_init_args.h      |   57 -
 .../nvidia/inc/kernel/gpu/gsp/gsp_static_config.h  |  174 -
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h        |   57 -
 .../535.113.01/nvidia/inc/kernel/gpu/nvbitmask.h   |   33 -
 .../nvidia/inc/kernel/os/nv_memory_type.h          |   31 -
 .../nvidia/kernel/inc/vgpu/rpc_headers.h           |   51 -
 .../nvidia/kernel/inc/vgpu/sdk-structures.h        |   40 -
 drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h     |    2 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   84 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h               |    7 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |  213 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h             |   16 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    2 +
 drivers/gpu/drm/nouveau/nouveau_dma.c              |  103 +-
 drivers/gpu/drm/nouveau/nouveau_dma.h              |   13 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |   18 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   15 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |   12 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   14 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |    1 +
 drivers/gpu/drm/nouveau/nouveau_gem.c              |   10 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |   39 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |   12 +-
 drivers/gpu/drm/nouveau/nv10_fence.c               |    6 +-
 drivers/gpu/drm/nouveau/nv17_fence.c               |   15 +-
 drivers/gpu/drm/nouveau/nv50_fence.c               |   15 +-
 drivers/gpu/drm/nouveau/nv84_fence.c               |   19 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild                |    6 +
 drivers/gpu/drm/nouveau/nvif/chan.c                |  156 +
 drivers/gpu/drm/nouveau/nvif/chan506f.c            |   72 +
 drivers/gpu/drm/nouveau/nvif/chan906f.c            |   93 +
 drivers/gpu/drm/nouveau/nvif/chanc36f.c            |   77 +
 drivers/gpu/drm/nouveau/nvif/conn.c                |   14 +-
 drivers/gpu/drm/nouveau/nvif/disp.c                |    1 +
 drivers/gpu/drm/nouveau/nvif/outp.c                |   15 +-
 drivers/gpu/drm/nouveau/nvif/user.c                |    8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild         |    2 -
 drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild      |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/gb202.c     |   16 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c      |  108 -
 drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  189 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c   |   36 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   18 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |    7 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |    3 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c   |   52 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild    |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |    7 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |   50 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h    |    5 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gb202.c   |   14 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c   |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gv100.c   |    1 -
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv40.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv50.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h    |    4 +
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild      |    3 -
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h     |    2 -
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c      |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c      |  508 ---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild   |    4 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c  |   12 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h   |    3 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c   |  110 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c  |   12 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild   |    4 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c  |   44 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h   |    3 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c   |  110 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c  |   12 +-
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild   |    5 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c  |   44 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c  |   44 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h   |    8 -
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c   |  107 -
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild     |    6 -
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c    |   44 -
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c    |   44 -
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h     |    8 -
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c     |  107 -
 drivers/gpu/drm/nouveau/nvkm/subdev/Kbuild         |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild     |    2 -
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c    |   14 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/nv50.c     |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c   |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild      |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c     |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c     |   34 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c     |   30 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c     |   30 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h      |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild     |    8 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/base.c     |   66 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c    |   24 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c    |   45 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c    |  275 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h     |   29 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild     |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c    |   27 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |   42 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c    |   17 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c    |   27 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c    |   35 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c    |   38 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c    |  358 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |   41 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild  |   19 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c |   39 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/client.c    |   49 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c    |  189 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.h    |   20 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c |   28 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c |   39 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c |   30 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c |   44 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c |   30 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h   |   70 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c    |   87 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h    |   55 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h   |   18 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c |   33 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c |   33 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild |   25 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c    |  112 +
 .../nvkm/subdev/{bar/r535.c =3D> gsp/rm/r535/bar.c}  |   41 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c   |   46 +
 .../nvenc/ad102.c =3D> subdev/gsp/rm/r535/client.c}  |   37 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c |   93 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c   |  148 +
 .../disp/r535.c =3D> subdev/gsp/rm/r535/disp.c}      |  396 +-
 .../subdev/{instmem/r535.c =3D> gsp/rm/r535/fbsr.c}  |   60 +-
 .../fifo/r535.c =3D> subdev/gsp/rm/r535/fifo.c}      |  471 +--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |  356 ++
 .../nvkm/subdev/gsp/{r535.c =3D> rm/r535/gsp.c}      | 1559 +------
 .../nvdec/ga100.c =3D> subdev/gsp/rm/r535/nvdec.c}   |   37 +-
 .../gr/ad102.c =3D> subdev/gsp/rm/r535/nvenc.c}      |   39 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c    |   45 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/alloc.h   |   36 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/bar.h |   29 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ce.h  |   15 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/client.h  |   20 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ctrl.h    |   21 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/device.h  |   30 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/disp.h    |  741 ++++
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/engine.h  |  260 ++
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/event.h   |   47 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fbsr.h    |  106 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fifo.h    |  350 ++
 .../subdev/gsp/rm/r535/nvrm/gr.h}                  |   64 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h |  825 ++++
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/msgfn.h   |   53 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvdec.h   |   17 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvenc.h   |   17 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nvjpg.h   |   17 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ofa.h |   16 +
 .../subdev/gsp/rm/r535/nvrm/rpcfn.h}               |   55 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h |  132 +
 .../nvdec/ad102.c =3D> subdev/gsp/rm/r535/ofa.c}     |   36 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c   |   52 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  |  691 ++++
 .../nvkm/subdev/{mmu/r535.c =3D> gsp/rm/r535/vmm.c}  |  118 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/Kbuild |    9 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/client.c   |   28 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c |  263 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c |  149 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fifo.c |  217 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   |  191 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  |  216 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/client.h  |   21 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h    |  355 ++
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/engine.h  |  318 ++
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h    |   19 +
 .../subdev/gsp/rm/r570/nvrm/fifo.h}                |  259 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  |   79 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h |  634 +++
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/msgfn.h   |   57 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/ofa.h |   17 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rpcfn.h   |  249 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c  |   28 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c   |   99 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  191 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h   |   18 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c |   38 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |  271 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c    |   20 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild |    3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c |    8 +-
 .../gpu/drm/nouveau/nvkm/subdev/instmem/gh100.c    |   28 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv40.c |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |   17 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h |    6 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c    |   25 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memgf100.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv04.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/memnv50.c  |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h     |    2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c      |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      |    7 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgh100.c |  306 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/Kbuild     |    1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c     |   10 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c      |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c      |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c      |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.c    |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.c    |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gh100.c    |   30 +
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c    |    5 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.c     |   25 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c     |   25 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.c     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c     |    4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/priv.h     |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c     |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/uvfn.c     |    2 +-
 drivers/gpu/drm/nova/Kconfig                       |   14 +
 drivers/gpu/drm/nova/Makefile                      |    3 +
 drivers/gpu/drm/nova/driver.rs                     |   69 +
 drivers/gpu/drm/nova/file.rs                       |   74 +
 drivers/gpu/drm/nova/gem.rs                        |   49 +
 drivers/gpu/drm/nova/nova.rs                       |   18 +
 drivers/gpu/drm/nova/uapi.rs                       |   61 +
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |    3 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |    3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |    3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |    3 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  |    3 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |    3 +-
 drivers/gpu/drm/panel/Kconfig                      |   39 +
 drivers/gpu/drm/panel/Makefile                     |    4 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |   10 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c        |   11 +-
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |   11 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |   10 +-
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |  113 +-
 drivers/gpu/drm/panel/panel-boe-td4320.c           |  247 ++
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   |   11 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c     |   10 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c               |   10 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |   11 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   19 +-
 drivers/gpu/drm/panel/panel-himax-hx8279.c         | 1296 ++++++
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  441 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |    9 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      | 1639 ++++----
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      |  340 ++
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |  238 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  104 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |   41 +-
 drivers/gpu/drm/panel/panel-simple.c               |  129 +-
 drivers/gpu/drm/panel/panel-synaptics-r63353.c     |   68 +-
 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c  |  280 ++
 drivers/gpu/drm/panfrost/panfrost_device.c         |   71 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   19 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   12 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c           |    4 +-
 drivers/gpu/drm/panfrost/panfrost_features.h       |    3 +
 drivers/gpu/drm/panfrost/panfrost_gem.c            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |    2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  152 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |    6 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |   36 +
 drivers/gpu/drm/panthor/panthor_device.c           |   13 +-
 drivers/gpu/drm/panthor/panthor_device.h           |   13 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |   76 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |   10 +-
 drivers/gpu/drm/panthor/panthor_gem.c              |  227 +-
 drivers/gpu/drm/panthor/panthor_gem.h              |   82 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |    2 +
 drivers/gpu/drm/panthor/panthor_heap.c             |    6 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |   19 +-
 drivers/gpu/drm/panthor/panthor_regs.h             |    4 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |   13 +-
 drivers/gpu/drm/pl111/pl111_versatile.c            |    2 +-
 drivers/gpu/drm/radeon/atombios.h                  |    3 +-
 drivers/gpu/drm/radeon/atombios_dp.c               |    8 +-
 drivers/gpu/drm/radeon/cik.c                       |   42 +-
 drivers/gpu/drm/radeon/r600_hdmi.c                 |   22 -
 drivers/gpu/drm/radeon/radeon.h                    |    3 -
 drivers/gpu/drm/radeon/radeon_asic.h               |    1 -
 drivers/gpu/drm/radeon/radeon_cs.c                 |    1 -
 drivers/gpu/drm/radeon/radeon_fence.c              |   42 -
 drivers/gpu/drm/radeon/sid.h                       |    2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c         |    5 -
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |   10 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |    3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |    3 +-
 drivers/gpu/drm/renesas/rz-du/Kconfig              |   15 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |    2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |  120 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h       |    1 -
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |    9 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |    5 +-
 drivers/gpu/drm/rockchip/Kconfig                   |    2 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  103 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   55 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  315 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    5 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |    1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    5 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   94 +-
 drivers/gpu/drm/scheduler/.kunitconfig             |   12 +
 drivers/gpu/drm/scheduler/Makefile                 |    2 +
 drivers/gpu/drm/scheduler/sched_main.c             |   35 +-
 drivers/gpu/drm/scheduler/tests/Makefile           |    7 +
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   |  359 ++
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |  226 +
 drivers/gpu/drm/scheduler/tests/tests_basic.c      |  476 +++
 drivers/gpu/drm/sitronix/Kconfig                   |   51 +
 drivers/gpu/drm/sitronix/Makefile                  |    3 +
 drivers/gpu/drm/sitronix/st7571-i2c.c              | 1000 +++++
 drivers/gpu/drm/{tiny =3D> sitronix}/st7586.c        |    0
 drivers/gpu/drm/{tiny =3D> sitronix}/st7735r.c       |    0
 drivers/gpu/drm/sprd/sprd_dpu.c                    |   13 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                    |   13 +-
 drivers/gpu/drm/sti/sti_compositor.c               |   14 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |   14 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   15 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   15 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   14 +-
 drivers/gpu/drm/sti/sti_tvout.c                    |   14 +-
 drivers/gpu/drm/sti/sti_vtg.c                      |   14 +-
 drivers/gpu/drm/stm/lvds.c                         |   11 +-
 drivers/gpu/drm/sysfb/Kconfig                      |   76 +
 drivers/gpu/drm/sysfb/Makefile                     |   12 +
 drivers/gpu/drm/sysfb/drm_sysfb.c                  |   35 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |  184 +
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |  320 ++
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c      |  107 +
 drivers/gpu/drm/sysfb/efidrm.c                     |  389 ++
 drivers/gpu/drm/{tiny =3D> sysfb}/ofdrm.c            |  376 +-
 drivers/gpu/drm/{tiny =3D> sysfb}/simpledrm.c        |  258 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |  554 +++
 drivers/gpu/drm/tegra/dc.c                         |   17 +-
 drivers/gpu/drm/tegra/dp.c                         |   67 -
 drivers/gpu/drm/tegra/dp.h                         |    2 -
 drivers/gpu/drm/tegra/dpaux.c                      |   11 +-
 drivers/gpu/drm/tegra/dsi.c                        |    4 +-
 drivers/gpu/drm/tegra/falcon.c                     |   20 +-
 drivers/gpu/drm/tegra/falcon.h                     |    1 +
 drivers/gpu/drm/tegra/gem.c                        |    1 -
 drivers/gpu/drm/tegra/hub.c                        |    4 +-
 drivers/gpu/drm/tegra/hub.h                        |    3 +-
 drivers/gpu/drm/tegra/rgb.c                        |   14 +-
 drivers/gpu/drm/tegra/sor.c                        |    4 +-
 drivers/gpu/drm/tests/Makefile                     |    2 +
 drivers/gpu/drm/tests/drm_atomic_test.c            |  153 +
 drivers/gpu/drm/tests/drm_bridge_test.c            |  417 ++
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |    3 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |   28 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  158 +-
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |   61 +
 drivers/gpu/drm/tidss/tidss_encoder.c              |    3 +-
 drivers/gpu/drm/tiny/Kconfig                       |   62 +-
 drivers/gpu/drm/tiny/Makefile                      |    4 -
 drivers/gpu/drm/tiny/appletbdrm.c                  |   30 +-
 drivers/gpu/drm/tiny/cirrus-qemu.c                 |  145 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   46 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |    4 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    1 -
 drivers/gpu/drm/ttm/ttm_resource.c                 |    1 -
 drivers/gpu/drm/udl/udl_drv.c                      |   24 +-
 drivers/gpu/drm/udl/udl_drv.h                      |   20 +-
 drivers/gpu/drm/udl/udl_main.c                     |  195 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   22 +-
 drivers/gpu/drm/udl/udl_transfer.c                 |    6 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |  116 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   62 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   22 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |   27 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |   64 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |    4 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |   26 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |    6 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c        |   62 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     |  154 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   37 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   22 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |    7 +
 drivers/gpu/drm/vc4/vc4_plane.c                    |    2 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |   15 -
 drivers/gpu/drm/virtio/virtgpu_fence.c             |   16 -
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   20 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |    8 +-
 drivers/gpu/drm/vkms/Kconfig                       |   15 +
 drivers/gpu/drm/vkms/Makefile                      |    5 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig            |    4 +
 drivers/gpu/drm/vkms/tests/Makefile                |    3 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c      |  951 +++++
 drivers/gpu/drm/vkms/vkms_config.c                 |  640 +++
 drivers/gpu/drm/vkms/vkms_config.h                 |  437 ++
 drivers/gpu/drm/vkms/vkms_connector.c              |   61 +
 drivers/gpu/drm/vkms/vkms_connector.h              |   26 +
 drivers/gpu/drm/vkms/vkms_crtc.c                   |    2 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   45 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   17 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |  172 +-
 drivers/gpu/drm/vmwgfx/Makefile                    |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |   20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h                 |    8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c       |  844 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h       |   81 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   38 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |   52 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   30 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  874 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   71 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |    3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |   63 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   85 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c         |    7 +-
 drivers/gpu/drm/xe/Kconfig                         |   16 +-
 drivers/gpu/drm/xe/Makefile                        |    7 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h           |    1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h              |    1 +
 .../gpu/drm/xe/compat-i915-headers/gt/intel_rps.h  |   11 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |   48 +-
 .../drm/xe/compat-i915-headers/intel_runtime_pm.h  |   76 -
 .../gpu/drm/xe/compat-i915-headers/soc/intel_pch.h |    6 -
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   10 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   45 +-
 drivers/gpu/drm/xe/display/xe_display_rpm.c        |   71 +
 drivers/gpu/drm/xe/display/xe_display_rps.c        |   17 -
 drivers/gpu/drm/xe/display/xe_display_wa.c         |    6 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |  133 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    2 +-
 drivers/gpu/drm/xe/instructions/xe_alu_commands.h  |   79 +
 .../gpu/drm/xe/instructions/xe_gfxpipe_commands.h  |    1 +
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h   |    5 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h           |    4 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |   13 +-
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h            |    3 +
 drivers/gpu/drm/xe/tests/xe_bo.c                   |    6 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |    2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   11 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c                 |    7 +-
 drivers/gpu/drm/xe/xe_bo.c                         |  537 ++-
 drivers/gpu/drm/xe/xe_bo.h                         |   27 +-
 drivers/gpu/drm/xe/xe_bo_evict.c                   |  399 +-
 drivers/gpu/drm/xe/xe_bo_evict.h                   |   10 +-
 drivers/gpu/drm/xe/xe_bo_types.h                   |    4 +
 drivers/gpu/drm/xe/xe_configfs.c                   |  250 ++
 drivers/gpu/drm/xe/xe_configfs.h                   |   24 +
 drivers/gpu/drm/xe/xe_devcoredump.c                |   62 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h          |    2 +
 drivers/gpu/drm/xe/xe_device.c                     |   34 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c               |  105 +-
 drivers/gpu/drm/xe/xe_device_types.h               |   38 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |    2 +-
 drivers/gpu/drm/xe/xe_eu_stall.c                   |    4 +-
 drivers/gpu/drm/xe/xe_exec.c                       |    4 +-
 drivers/gpu/drm/xe/xe_exec_queue.c                 |    9 +-
 drivers/gpu/drm/xe/xe_force_wake.c                 |    6 -
 drivers/gpu/drm/xe/xe_ggtt.c                       |    2 +-
 drivers/gpu/drm/xe/xe_gsc.c                        |   22 +
 drivers/gpu/drm/xe/xe_gsc.h                        |    1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c                  |   11 +
 drivers/gpu/drm/xe/xe_gsc_proxy.h                  |    1 +
 drivers/gpu/drm/xe/xe_gt.c                         |   86 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c                 |   39 +-
 drivers/gpu/drm/xe/xe_gt_freq.c                    |   82 +-
 drivers/gpu/drm/xe/xe_gt_idle.c                    |   28 +-
 drivers/gpu/drm/xe/xe_gt_mcr.c                     |    3 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |   13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c         |   20 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c        |   66 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c        |    6 -
 drivers/gpu/drm/xe/xe_gt_stats.c                   |    1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h             |    1 +
 drivers/gpu/drm/xe/xe_gt_throttle.c                |   90 +-
 drivers/gpu/drm/xe/xe_guc.c                        |   44 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |   12 +-
 drivers/gpu/drm/xe/xe_guc_capture.c                |  100 +-
 drivers/gpu/drm/xe/xe_guc_capture_types.h          |    2 +
 drivers/gpu/drm/xe/xe_guc_ct.c                     |    6 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c                |  167 +-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c        |  203 +-
 drivers/gpu/drm/xe/xe_guc_engine_activity.h        |    7 +-
 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h  |   12 +-
 drivers/gpu/drm/xe/xe_guc_log.c                    |    3 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                     |   18 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                     |    1 +
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   18 +-
 drivers/gpu/drm/xe/xe_guc_types.h                  |    5 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c      |    1 +
 drivers/gpu/drm/xe/xe_hwmon.c                      |  125 +-
 drivers/gpu/drm/xe/xe_lmtt.c                       |    2 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |   28 +-
 drivers/gpu/drm/xe/xe_memirq.c                     |    2 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |  238 +-
 drivers/gpu/drm/xe/xe_migrate.h                    |    4 +
 drivers/gpu/drm/xe/xe_mmio.c                       |   11 +-
 drivers/gpu/drm/xe/xe_module.c                     |    9 +-
 drivers/gpu/drm/xe/xe_oa.c                         |    7 +-
 drivers/gpu/drm/xe/xe_pci.c                        |   31 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c                  |   21 +
 drivers/gpu/drm/xe/xe_pcode.c                      |    2 +
 drivers/gpu/drm/xe/xe_pcode_api.h                  |    8 +
 drivers/gpu/drm/xe/xe_pm.c                         |   82 +-
 drivers/gpu/drm/xe/xe_pm.h                         |    2 +-
 drivers/gpu/drm/xe/xe_pmu.c                        |   77 +-
 drivers/gpu/drm/xe/xe_pt.c                         |  238 +-
 drivers/gpu/drm/xe/xe_query.c                      |    2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                     |    3 +
 drivers/gpu/drm/xe/xe_ring_ops_types.h             |    2 +-
 drivers/gpu/drm/xe/xe_rtp.c                        |    3 -
 drivers/gpu/drm/xe/xe_sa.c                         |    3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c         |   69 +-
 drivers/gpu/drm/xe/xe_survivability_mode.h         |    1 +
 drivers/gpu/drm/xe/xe_svm.c                        |   34 +-
 drivers/gpu/drm/xe/xe_svm.h                        |   84 +-
 drivers/gpu/drm/xe/xe_uc.c                         |    8 +-
 drivers/gpu/drm/xe/xe_uc.h                         |    1 +
 drivers/gpu/drm/xe/xe_uc_fw.c                      |   90 +-
 drivers/gpu/drm/xe/xe_vm.c                         |   51 +-
 drivers/gpu/drm/xe/xe_vm_types.h                   |    2 +
 drivers/gpu/drm/xe/xe_vram.c                       |    5 +-
 drivers/gpu/drm/xe/xe_wa.c                         |   12 +
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |    2 +
 drivers/gpu/drm/xlnx/Kconfig                       |    1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |    9 +-
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c             |    5 +-
 drivers/gpu/host1x/bus.c                           |   11 +-
 drivers/gpu/host1x/cdma.c                          |    7 +-
 drivers/gpu/nova-core/Kconfig                      |    1 +
 drivers/gpu/nova-core/driver.rs                    |    9 +-
 drivers/gpu/nova-core/firmware.rs                  |   44 +-
 drivers/gpu/nova-core/gpu.rs                       |   86 +-
 drivers/gpu/nova-core/nova_core.rs                 |    2 +
 drivers/gpu/nova-core/regs.rs                      |   72 +-
 drivers/gpu/nova-core/regs/macros.rs               |  380 ++
 drivers/platform/arm64/acer-aspire1-ec.c           |   10 +-
 drivers/video/screen_info_generic.c                |   36 +
 include/drm/bridge/analogix_dp.h                   |    7 +-
 include/drm/display/drm_dp.h                       |    1 +
 include/drm/display/drm_dp_helper.h                |  101 +-
 include/drm/display/drm_hdmi_helper.h              |    6 +
 include/drm/drm_atomic.h                           |    3 +
 include/drm/drm_bridge.h                           |  195 +-
 include/drm/drm_bridge_helper.h                    |   12 +
 include/drm/drm_device.h                           |   41 +
 include/drm/drm_drv.h                              |    5 +
 include/drm/drm_edid.h                             |    2 +-
 include/drm/drm_file.h                             |    3 +
 include/drm/drm_gem.h                              |   15 +-
 include/drm/drm_gem_shmem_helper.h                 |   45 +-
 include/drm/drm_kunit_helpers.h                    |    8 +
 include/drm/drm_mipi_dsi.h                         |   23 +-
 include/drm/drm_mode_config.h                      |   10 +-
 include/drm/drm_panel.h                            |   49 +-
 include/drm/drm_panic.h                            |   12 +-
 include/drm/drm_plane.h                            |   17 +
 include/drm/drm_print.h                            |   20 +
 include/drm/drm_probe_helper.h                     |    2 +-
 include/drm/gpu_scheduler.h                        |  112 +-
 include/drm/intel/intel-gtt.h                      |    2 +
 include/drm/ttm/ttm_bo.h                           |    2 -
 include/linux/dma-buf.h                            |   27 -
 include/linux/dma-fence-unwrap.h                   |    2 +
 include/linux/dma-fence.h                          |   25 +-
 include/linux/highmem-internal.h                   |   13 +
 include/linux/screen_info.h                        |    9 +
 include/uapi/drm/amdgpu_drm.h                      |  317 ++
 include/uapi/drm/asahi_drm.h                       | 1194 ++++++
 include/uapi/drm/drm.h                             |    4 +
 include/uapi/drm/drm_fourcc.h                      |   45 +
 include/uapi/drm/nova_drm.h                        |  101 +
 include/uapi/drm/panthor_drm.h                     |   23 +
 include/uapi/drm/virtgpu_drm.h                     |    6 +
 include/uapi/drm/xe_drm.h                          |    6 +-
 include/uapi/linux/kfd_ioctl.h                     |    5 +
 include/uapi/linux/virtio_gpu.h                    |    3 +-
 include/video/pixel_format.h                       |   41 +
 lib/tests/printf_kunit.c                           |   39 +-
 lib/vsprintf.c                                     |   40 +-
 rust/bindings/bindings_helper.h                    |    7 +
 rust/helpers/auxiliary.c                           |   23 +
 rust/helpers/drm.c                                 |   23 +
 rust/helpers/helpers.c                             |    2 +
 rust/helpers/pci.c                                 |    5 +
 rust/helpers/platform.c                            |    5 +
 rust/kernel/auxiliary.rs                           |  360 ++
 rust/kernel/device.rs                              |  109 +-
 rust/kernel/devres.rs                              |   56 +-
 rust/kernel/dma.rs                                 |   14 +-
 rust/kernel/drm/device.rs                          |  200 +
 rust/kernel/drm/driver.rs                          |  166 +
 rust/kernel/drm/file.rs                            |   99 +
 rust/kernel/drm/gem/mod.rs                         |  328 ++
 rust/kernel/drm/ioctl.rs                           |  162 +
 rust/kernel/drm/mod.rs                             |   19 +
 rust/kernel/lib.rs                                 |    4 +
 rust/kernel/pci.rs                                 |   55 +-
 rust/kernel/platform.rs                            |   54 +-
 rust/kernel/revocable.rs                           |   28 +
 rust/kernel/types.rs                               |    8 +
 rust/uapi/uapi_helper.h                            |    2 +
 samples/rust/Kconfig                               |   12 +
 samples/rust/Makefile                              |    1 +
 samples/rust/rust_driver_auxiliary.rs              |  120 +
 samples/rust/rust_driver_pci.rs                    |    5 +-
 scripts/checkpatch.pl                              |    2 +-
 1742 files changed, 71770 insertions(+), 36430 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc=
.yaml
 create mode 100644
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yam=
l
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
 create mode 100644
Documentation/devicetree/bindings/display/panel/truly,nt35597-2K-display.ya=
ml
 create mode 100644
Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
 create mode 100644
Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/truly,nt35597=
.txt
 create mode 100644
Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
 create mode 100644 Documentation/gpu/amdgpu/amd-hardware-list-info.rst
 create mode 100644 Documentation/gpu/amdgpu/debugfs.rst
 create mode 100644 Documentation/gpu/amdgpu/gc/index.rst
 create mode 100644 Documentation/gpu/amdgpu/gc/mes.rst
 create mode 100644 Documentation/gpu/amdgpu/pipe_and_queue_abstraction.svg
 create mode 100644 Documentation/gpu/xe/xe_configfs.rst
 create mode 100644 drivers/gpu/drm/Kconfig.debug
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
 rename drivers/gpu/drm/{nouveau/nvkm/engine/ofa/ad102.c =3D>
amd/amdgpu/mes_userqueue.h} (71%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v5_0.h
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.=
c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_fused_io.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_fused_io.h
 delete mode 100644
drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
 rename drivers/gpu/drm/amd/display/dc/{dce60/dce60_hw_sequencer.c =3D>
hwss/dce60/dce60_hwseq.c} (99%)
 rename drivers/gpu/drm/amd/display/dc/{dce60/dce60_hw_sequencer.h =3D>
hwss/dce60/dce60_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce60/dce60_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ =3D>
resource}/dce60/dce60_resource.h (100%)
 create mode 100644 drivers/gpu/drm/drm_bridge_helper.c
 create mode 100644 drivers/gpu/drm/drm_format_internal.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_rpm.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_rpm.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_pch.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_vga_regs.h
 delete mode 100644 drivers/gpu/drm/i915/soc/intel_pch.c
 delete mode 100644 drivers/gpu/drm/i915/soc/intel_pch.h
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_riscv.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_fw_util.c
 create mode 100644 drivers/gpu/drm/imagination/pvr_rogue_riscv.h
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.=
h
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/coreca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/headca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
 create mode 100644 drivers/gpu/drm/nouveau/gv100_fence.c
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc97b.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clca7e.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvhw/ref/gb100/dev_hshub_base.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb10b/dev_fbhu=
b.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_ce.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_ther=
m.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_falcon_v4.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fb.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_fsp_=
pri.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_mmu.=
h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_riscv_pri.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_ther=
m.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/dev_xtl_ep_pri.h
 create mode 100644
drivers/gpu/drm/nouveau/include/nvhw/ref/gh100/pri_nv_xal_ep.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/chan.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/pushc97b.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class=
/cl0000.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class=
/cl0005.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class=
/cl0080.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class=
/cl2080.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class=
/cl2080_notification.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class=
/cl84a0.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class=
/cl90f1.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/class=
/clc0b5sw.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl0073/ctrl0073common.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl0073/ctrl0073dfp.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl0073/ctrl0073dp.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl0073/ctrl0073specific.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl0073/ctrl0073system.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl0080/ctrl0080gpu.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl0080/ctrl0080gr.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl2080/ctrl2080bios.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl2080/ctrl2080ce.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl2080/ctrl2080event.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl2080/ctrl2080fb.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl2080/ctrl2080fifo.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl2080/ctrl2080gpu.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl2080/ctrl2080gr.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl2080/ctrl2080internal.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrl90f1.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/=
ctrla06f/ctrla06fgpfifo.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvlim=
its.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/nvos.=
h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq=
/msgq_priv.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/uproc/os/common/incl=
ude/libos_init_args.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/=
inc/gsp/gsp_fw_sr_meta.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/=
inc/gsp/gsp_fw_wpr_meta.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/=
inc/rmRiscvUcode.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/arch/nvalloc/common/=
inc/rmgspseq.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_allclass=
es.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_chipset_=
nvoc.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_fbsr_nvo=
c.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_gpu_nvoc=
.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_c=
hannel_nvoc.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_kernel_f=
ifo_nvoc.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_mem_desc=
_nvoc.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_os_nvoc.=
h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_rpc-stru=
ctures.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/generated/g_sdk-stru=
ctures.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_a=
cpi_data.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gpu_e=
ngine_type.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/g=
sp_fw_heap.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/g=
sp_init_args.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/g=
sp_static_config.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/intr/=
engine_idx.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/gpu/nvbit=
mask.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/inc/kernel/os/nv_mem=
ory_type.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_=
headers.h
 delete mode 100644
drivers/gpu/drm/nouveau/include/nvrm/535.113.01/nvidia/kernel/inc/vgpu/sdk-=
structures.h
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan506f.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan906f.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chanc36f.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/gb202.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gb202.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/base.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/client.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvdec.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/nvenc.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{bar/r535.c =3D>
gsp/rm/r535/bar.c} (81%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvenc/ad102.c =3D>
subdev/gsp/rm/r535/client.c} (69%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.=
c
 rename drivers/gpu/drm/nouveau/nvkm/{engine/disp/r535.c =3D>
subdev/gsp/rm/r535/disp.c} (86%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{instmem/r535.c =3D>
gsp/rm/r535/fbsr.c} (83%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/fifo/r535.c =3D>
subdev/gsp/rm/r535/fifo.c} (65%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
 rename drivers/gpu/drm/nouveau/nvkm/subdev/gsp/{r535.c =3D> rm/r535/gsp.c}=
 (61%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvdec/ga100.c =3D>
subdev/gsp/rm/r535/nvdec.c} (68%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/gr/ad102.c =3D>
subdev/gsp/rm/r535/nvenc.c} (68%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/al=
loc.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ba=
r.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ce=
.h
 create mode 100644
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/client.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ct=
rl.h
 create mode 100644
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/device.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/di=
sp.h
 create mode 100644
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/engine.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ev=
ent.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fb=
sr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/fi=
fo.h
 rename drivers/gpu/drm/nouveau/{include/nvrm/535.113.01/common/sdk/nvidia/=
inc/ctrl/ctrl0080/ctrl0080fifo.h
=3D> nvkm/subdev/gsp/rm/r535/nvrm/gr.h} (56%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gs=
p.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/ms=
gfn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nv=
dec.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nv=
enc.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/nv=
jpg.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/of=
a.h
 rename drivers/gpu/drm/nouveau/{include/nvrm/535.113.01/nvidia/kernel/inc/=
vgpu/rpc_global_enums.h
=3D> nvkm/subdev/gsp/rm/r535/nvrm/rpcfn.h} (83%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vm=
m.h
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvdec/ad102.c =3D>
subdev/gsp/rm/r535/ofa.c} (70%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{mmu/r535.c =3D>
gsp/rm/r535/vmm.c} (50%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/client.=
c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fifo.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
 create mode 100644
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/client.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/di=
sp.h
 create mode 100644
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/engine.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fb=
sr.h
 rename drivers/gpu/drm/nouveau/{include/nvrm/535.113.01/common/sdk/nvidia/=
inc/alloc/alloc_channel.h
=3D> nvkm/subdev/gsp/rm/r570/nvrm/fifo.h} (62%)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr=
.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gs=
p.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/ms=
gfn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/of=
a.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rp=
cfn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rpc.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgh100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/pci/gh100.c
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 drivers/gpu/drm/nova/uapi.rs
 create mode 100644 drivers/gpu/drm/panel/panel-boe-td4320.c
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8279.c
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37801.c
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
 create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
 create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
 create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c
 create mode 100644 drivers/gpu/drm/sitronix/Kconfig
 create mode 100644 drivers/gpu/drm/sitronix/Makefile
 create mode 100644 drivers/gpu/drm/sitronix/st7571-i2c.c
 rename drivers/gpu/drm/{tiny =3D> sitronix}/st7586.c (100%)
 rename drivers/gpu/drm/{tiny =3D> sitronix}/st7735r.c (100%)
 create mode 100644 drivers/gpu/drm/sysfb/Kconfig
 create mode 100644 drivers/gpu/drm/sysfb/Makefile
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb.c
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.h
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
 create mode 100644 drivers/gpu/drm/sysfb/efidrm.c
 rename drivers/gpu/drm/{tiny =3D> sysfb}/ofdrm.c (74%)
 rename drivers/gpu/drm/{tiny =3D> sysfb}/simpledrm.c (75%)
 create mode 100644 drivers/gpu/drm/sysfb/vesadrm.c
 create mode 100644 drivers/gpu/drm/tests/drm_atomic_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_bridge_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm=
.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_display_rpm.c
 delete mode 100644 drivers/gpu/drm/xe/display/xe_display_rps.c
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_alu_commands.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
 create mode 100644 drivers/gpu/nova-core/regs/macros.rs
 create mode 100644 include/drm/drm_bridge_helper.h
 create mode 100644 include/uapi/drm/asahi_drm.h
 create mode 100644 include/uapi/drm/nova_drm.h
 create mode 100644 include/video/pixel_format.h
 create mode 100644 rust/helpers/auxiliary.c
 create mode 100644 rust/helpers/drm.c
 create mode 100644 rust/kernel/auxiliary.rs
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/driver.rs
 create mode 100644 rust/kernel/drm/file.rs
 create mode 100644 rust/kernel/drm/gem/mod.rs
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs
 create mode 100644 samples/rust/rust_driver_auxiliary.rs
