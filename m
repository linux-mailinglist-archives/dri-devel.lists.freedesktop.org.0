Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1378B84EF9E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 05:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161710F195;
	Fri,  9 Feb 2024 04:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xfz9wej+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71EF10F195
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 04:28:52 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a38a1a9e2c0so60839866b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 20:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707452931; x=1708057731; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bTXBw/uQ/AZU1ICWB/ng0btsHfhbv8yVH9M0U5Q5wDw=;
 b=Xfz9wej+7Zdj6k2AAhpBr2qj240tJgwAzi25u1f4PaJZML/VqUVGHFCWuViuWWfpOJ
 CVY28MsWqYkS0T+HC5/1pn+qKaA5pssWtTdELgL4ICziKBDYZVYzWTTvSHTn0/inxPi+
 2JaWyUH8cXSXee5jqsI/bS9h2/BA7cgnh3GRl+AKz/Gbrbu48J5LGyw/HGCDSVIql4vl
 3rT1Q/QcADtGjovccMSxx7vbDQzFXoxhZ+xOrROTaFHV+sL8mC++SIfawVNTDLRbBkKM
 H3RTI53XSe205+JGVjtsyfUOKepRCAwtsz0uCgj1JfhoElNXKJvri8FxAUW+SBkQH/gA
 /4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707452931; x=1708057731;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bTXBw/uQ/AZU1ICWB/ng0btsHfhbv8yVH9M0U5Q5wDw=;
 b=XDZ83cn7em6t37ZPmGP7CgTVQiyaXNu14atDbc5NOCxPEM6AXh5QYMYuI322WrHuro
 ZT5cPlA0Tc3Tux540EP/l4zCFk1+5qaETy24QEYHXCsbxAG3KBPqo54pvBMobVB9NFcl
 7+1AalTQNq+tNJ2Eez+Mt7asu1i4yu7vkprgp/o7YZ7Q8a3oPEiP7KHYvGhuReQK6ODi
 3ubPqo9zRr6yxj0lwZNK3SjB7qBGUGCRVKqKOTLQ6GgK0vOMUNlY3HudJKbftYYGHP2b
 wHh7YJhYiUnzUox7w6vc4G7ij78Kus2JLAhNG05XpCPAV66FTjZLzjk0pNdXLq4hsSh3
 BTcQ==
X-Gm-Message-State: AOJu0Ywy9o6CtcSdLMz3CGH/GLs14FMw+Mby9jPY0qfOIyVfSoT4/my8
 dPY0FXh859dFnR0cVkyVko5qTsWqZ6Wh6dQCv5Y8EcyswDC9cgyaJpJMJ63byG5bbnczQ/Fk84I
 S7HZi+CBCVwqmigtV8PJTyp4j6v8=
X-Google-Smtp-Source: AGHT+IGQ10oVX/InR0AS7IEriYHTOzBqmi9NrTQGqS29Hpkx0l0v3t3dWg2qkQPimSHL0GHV2wlsPcfu37gMa0bTLFw=
X-Received: by 2002:a17:906:6808:b0:a3b:cb42:80de with SMTP id
 k8-20020a170906680800b00a3bcb4280demr242808ejr.70.1707452930869; Thu, 08 Feb
 2024 20:28:50 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 9 Feb 2024 14:28:39 +1000
Message-ID: <CAPM=9tykW0CySOLSBfxiopj2xSnBi18LtzuFHmabFY3kFhZ6Lw@mail.gmail.com>
Subject: [git pull] drm fixes for 6.8-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Regular weekly fixes, xe, amdgpu and msm are most of them, with some
misc in i915, ivpu and nouveau, scattered but nothing too intense at
this point.

Dave.

drm-fixes-2024-02-09:
drm fixes for 6.8-rc4

i915:
- gvt: docs fix, uninit var, MAINTAINERS

ivpu:
- add aborted job status
- disable d3 hot delay
- mmu fixes

nouveau:
- fix gsp rpc size request
- fix dma buffer leaks
- use common code for gsp mem ctor

xe:
- Fix a loop in an error path
- Fix a missing dma-fence reference
- Fix a retry path on userptr REMAP
- Workaround for a false gcc warning
- Fix missing map of the usm batch buffer
  in the migrate vm.
- Fix a memory leak.
- Fix a bad assumption of used page size
- Fix hitting a BUG() due to zero pages to map.
- Remove some leftover async bind queue relics

amdgpu:
- Misc NULL/bounds check fixes
- ODM pipe policy fix
- Aborted suspend fixes
- JPEG 4.0.5 fix
- DCN 3.5 fixes
- PSP fix
- DP MST fix
- Phantom pipe fix
- VRAM vendor fix
- Clang fix
- SR-IOV fix

msm:
- DPU:
- fix for kernel doc warnings and smatch warnings in dpu_encoder
- fix for smatch warning in dpu_encoder
- fix the bus bandwidth value for SDM670
- DP:
- fixes to handle unknown bpc case correctly for DP
- fix for MISC0 programming
- GPU:
- dmabuf vmap fix
- a610 UBWC corruption fix (incorrect hbb)
- revert a commit that was making GPU recovery unreliable
The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-02-09

for you to fetch changes up to 311520887d7cad2d5494933bd19bf85eb5398ffc:

  Merge tag 'drm-msm-fixes-2024-02-07' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2024-02-09
11:32:38 +1000)

----------------------------------------------------------------
drm fixes for 6.8-rc4

i915:
- gvt: docs fix, uninit var, MAINTAINERS

ivpu:
- add aborted job status
- disable d3 hot delay
- mmu fixes

nouveau:
- fix gsp rpc size request
- fix dma buffer leaks
- use common code for gsp mem ctor

xe:
- Fix a loop in an error path
- Fix a missing dma-fence reference
- Fix a retry path on userptr REMAP
- Workaround for a false gcc warning
- Fix missing map of the usm batch buffer
  in the migrate vm.
- Fix a memory leak.
- Fix a bad assumption of used page size
- Fix hitting a BUG() due to zero pages to map.
- Remove some leftover async bind queue relics

amdgpu:
- Misc NULL/bounds check fixes
- ODM pipe policy fix
- Aborted suspend fixes
- JPEG 4.0.5 fix
- DCN 3.5 fixes
- PSP fix
- DP MST fix
- Phantom pipe fix
- VRAM vendor fix
- Clang fix
- SR-IOV fix

msm:
- DPU:
- fix for kernel doc warnings and smatch warnings in dpu_encoder
- fix for smatch warning in dpu_encoder
- fix the bus bandwidth value for SDM670
- DP:
- fixes to handle unknown bpc case correctly for DP
- fix for MISC0 programming
- GPU:
- dmabuf vmap fix
- a610 UBWC corruption fix (incorrect hbb)
- revert a commit that was making GPU recovery unreliable

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: check for valid hw_pp in dpu_encoder_helper_phys_cleanup

Alvin Lee (1):
      drm/amd/display: Update phantom pipe enable / disable sequence

Arnd Bergmann (1):
      drm/xe: circumvent bogus stringop-overflow warning

Dan Carpenter (1):
      drm/i915/gvt: Fix uninitialized variable in handle_mmio()

Dave Airlie (6):
      nouveau/gsp: use correct size for registry rpc.
      Merge tag 'drm-misc-fixes-2024-02-08' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-xe-fixes-2024-02-08' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2024-02-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.8-2024-02-08' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-msm-fixes-2024-02-07' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

Dmitry Baryshkov (1):
      drm/msm/mdss: specify cfg bandwidth for SDM670

Fangzhi Zuo (1):
      drm/amd/display: Fix MST Null Ptr for RV

Grzegorz Trzebiatowski (1):
      accel/ivpu: Add job status for jobs aborted by the driver

Jacek Lawrynowicz (1):
      accel/ivpu: Disable d3hot_delay on all NPU generations

Joonas Lahtinen (1):
      Merge tag 'gvt-fixes-2024-02-05' of
https://github.com/intel/gvt-linux into drm-intel-fixes

Krystian Pradzynski (2):
      accel/ivpu/40xx: Enable D0i3 message
      accel/ivpu/40xx: Stop passing SKU boot parameters to FW

Kuogee Hsieh (2):
      drm/msms/dp: fixed link clock divider bits be over written in
BPC unknown case
      drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case

Li Ma (1):
      drm/amdgpu: remove asymmetrical irq disabling in jpeg 4.0.5 suspend

Lijo Lazar (2):
      drm/amdgpu: Avoid fetching VRAM vendor info
      drm/amdgpu: Fix HDP flush for VFs on nbio v7.9

Mario Limonciello (1):
      drm/amd/display: Clear phantom stream count and plane count

Matthew Auld (1):
      drm/xe/vm: don't ignore error when in_kthread

Matthew Brost (7):
      drm/sched: Re-queue run job worker when
drm_sched_entity_pop_job() returns NULL
      drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
      drm/xe: Take a reference in xe_exec_queue_last_fence_get()
      drm/xe: Pick correct userptr VMA to repin on REMAP op failure
      drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
      drm/xe: Assume large page size if VMA not yet bound
      drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR

Maxime Ripard (1):
      Merge drm-misc-next-fixes-2024-01-19 into drm-misc-fixes

Nathan Chancellor (1):
      drm/amd/display: Increase frame-larger-than for all display_mode_vba files

Nicholas Kazlauskas (1):
      drm/amd/display: Increase eval/entry delay for DCN35

Prike Liang (2):
      drm/amdgpu: skip to program GFXDEC registers for suspend abort
      drm/amdgpu: reset gpu for s3 suspend abort case

Randy Dunlap (1):
      drm/msm/dpu: fix kernel-doc warnings

Rodrigo Siqueira (1):
      drm/amd/display: Disable ODM by default for DCN35

Srinivasan Shanmugam (3):
      drm/amd/display: Fix 'panel_cntl' could be null in
'dcn21_set_backlight_level()'
      drm/amd/display: Add NULL test for 'timing generator' in
'dcn21_set_pipe()'
      drm/amd/display: Implement bounds check for stream encoder
creation in DCN301

Stanley.Yang (1):
      drm/amdgpu: Fix shared buff copy to user

Timur Tabi (2):
      drm/nouveau: fix several DMA buffer leaks
      drm/nouveau: nvkm_gsp_radix3_sg() should use nvkm_gsp_mem_ctor()

Wachowski, Karol (2):
      accel/ivpu: Force snooping for MMU writes
      accel/ivpu: Correct MMU queue size checking functions

Wenjing Liu (1):
      drm/amd/display: set odm_combine_policy based on context in dcn32 resource

Xiaoming Wang (1):
      drm/xe/display: Fix memleak in display initialization

Zhenyu Wang (1):
      drm/i915: Replace dead 01.org link

Zhi Wang (1):
      MAINTAINERS: Update Zhi Wang's email address

 MAINTAINERS                                        |  4 +-
 drivers/accel/ivpu/ivpu_drv.c                      |  5 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  1 -
 drivers/accel/ivpu/ivpu_hw_37xx.c                  |  2 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |  7 +-
 drivers/accel/ivpu/ivpu_job.c                      |  4 +-
 drivers/accel/ivpu/ivpu_mmu.c                      | 36 ++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  8 +++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  8 ---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |  9 ---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           | 10 ---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  6 ++
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 22 +++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 ++--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  3 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  6 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 15 +++--
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  4 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.h  |  4 ++
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h    |  4 ++
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    | 63 ++++++++++--------
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 76 ++++++++++++++++++---
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |  2 +
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |  3 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |  1 +
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |  7 ++
 drivers/gpu/drm/amd/display/dc/inc/resource.h      | 20 +++---
 .../display/dc/resource/dcn301/dcn301_resource.c   |  2 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c | 16 ++++-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  5 +-
 drivers/gpu/drm/i915/Kconfig                       |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |  3 +-
 drivers/gpu/drm/i915/intel_gvt.c                   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  8 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  3 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  5 --
 drivers/gpu/drm/msm/dp/dp_link.c                   | 22 ++++---
 drivers/gpu/drm/msm/dp/dp_reg.h                    |  3 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     | 77 +++++++++++++---------
 drivers/gpu/drm/scheduler/sched_main.c             | 15 +++--
 drivers/gpu/drm/xe/xe_display.c                    |  6 --
 drivers/gpu/drm/xe/xe_exec_queue.c                 |  8 ++-
 drivers/gpu/drm/xe/xe_gt.c                         |  5 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c                    | 28 ++++++--
 drivers/gpu/drm/xe/xe_sched_job.c                  |  1 -
 drivers/gpu/drm/xe/xe_sync.c                       |  2 -
 drivers/gpu/drm/xe/xe_vm.c                         | 62 +++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h                   |  8 ---
 include/uapi/drm/ivpu_accel.h                      |  1 +
 57 files changed, 390 insertions(+), 253 deletions(-)
