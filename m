Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6CD654BD7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 05:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763E610E1A0;
	Fri, 23 Dec 2022 04:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE4010E1A0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:02:45 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id a16so2928103qtw.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 20:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XpeUQ3GMg5Z9qzKyNeM71zZjjCllhMtjspejkV0vGj8=;
 b=XhNoxq5uKjUAoFUQWD5KrvwDpvuTjdGyTtv+h2JN/pSDtUkQM02P+n9zMBVz0TEFFY
 u5NzUGhQOFTf4K7ruz5JE7PZAqUNsLpHd9xJJ+4Mx2PUCBxk8ecQizWetK6nCu623If0
 QfCFunh1+8LabwFrXWINgWo5OW4b0TQBtn76bXHG5wMxM3RhtPBZ4ZPXmUL0GrTlpT2A
 pF5CPXeZOFx64cHI7doBgUIGLR47R7igCaNb3esk6F3ebmGJPKd8cb86Q5lAVQYoaPpv
 2bNU1yPfFx+YZSfTaFP0WRb9PgLaNBIX+PFaUoEqjUPjfx9QyzA4ylHRkT3rtwYqYaoi
 dy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XpeUQ3GMg5Z9qzKyNeM71zZjjCllhMtjspejkV0vGj8=;
 b=faf/gDBUpKgnCPgpxxlEsR2EGIW+OJbU5uBqfuT6HLD7jczJLxcH8AeIJ1mDKqFYjY
 M6C7Vc1PfWgLbOSaL6emKacbZdr5apeRXahFb6lnw76QpnaMKFb4UjCz0qVzy4NTha/j
 y58d1NCSpZi350l8kyenfSbE3e3fffUO6UVdqmJTFdGQGbPjkCDIMEplhYvZnbt4TbSZ
 tJ7T8GmlDaauxrZibq2ZF668Hy9bfECT30Ae3wG8NorAQNAiF3em0yV9GQnSZoyoY6CH
 EyM0hFqXgGyjXgqbgq0F0cpekmQyaiHAnautCURL9Bza09Sst+IlzTpXoQikck3CLk5U
 xm4Q==
X-Gm-Message-State: AFqh2kq2l86r3CALJPCwIbVlFbX8+Fk05RtorAERqhLzJ5slp/4bx4XT
 iUW7ETBjl6fxkyzkVx2zqOIq+wutFSl7ZzrLDsk=
X-Google-Smtp-Source: AMrXdXuLFM1GJLWBMe7nCwd4pvj+mBe7KOLuaEp1nZDb/uE5x7WbrmBlGYRppdFBfLATtQ+f/5EkjgnBkTD8jaylnhQ=
X-Received: by 2002:ac8:6e8f:0:b0:3a7:f669:4597 with SMTP id
 c15-20020ac86e8f000000b003a7f6694597mr304504qtv.329.1671768164825; Thu, 22
 Dec 2022 20:02:44 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 Dec 2022 14:02:33 +1000
Message-ID: <CAPM=9tye2Py9FXHP5qcNnb2BEa0yWNe4KDdfh5Vxpr2YMDwDeA@mail.gmail.com>
Subject: [git pull] drm fixes for 6.2-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Holiday fixes!. Two batches from amd, and one group of i915 changes. I
don't think there should be anything new, and it should all be fixes.

Dave.

drm-next-2022-12-23:
drm fixes for 6.2-rc1

amdgpu:
- Spelling fix
- BO pin fix
- Properly handle polaris 10/11 overlap asics
- GMC9 fix
- SR-IOV suspend fix
- DCN 3.1.4 fix
- KFD userptr locking fix
- SMU13.x fixes
- GDS/GWS/OA handling fix
- Reserved VMID handling fixes
- FRU EEPROM fix
- BO validation fixes
- Avoid large variable on the stack
- S0ix fixes
- SMU 13.x fixes
- VCN fix
- Add missing fence reference

amdkfd:
- Fix init vm error handling
- Fix double release of compute pasid

i915
- Documentation fixes
- OA-perf related fix
- VLV/CHV HDMI/DP audio fix
- Display DDI/Transcoder fix
- Migrate fixes
The following changes since commit 66efff515a6500d4b4976fbab3bee8b92a1137fb=
:

  Merge tag 'amd-drm-next-6.2-2022-12-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-12-09
12:08:33 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-12-23

for you to fetch changes up to fe8f5b2f7bec504021b395d24f7efca415d21e2b:

  Merge tag 'amd-drm-fixes-6.2-2022-12-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-12-22
11:02:56 +1000)

----------------------------------------------------------------
drm fixes for 6.2-rc1

amdgpu:
- Spelling fix
- BO pin fix
- Properly handle polaris 10/11 overlap asics
- GMC9 fix
- SR-IOV suspend fix
- DCN 3.1.4 fix
- KFD userptr locking fix
- SMU13.x fixes
- GDS/GWS/OA handling fix
- Reserved VMID handling fixes
- FRU EEPROM fix
- BO validation fixes
- Avoid large variable on the stack
- S0ix fixes
- SMU 13.x fixes
- VCN fix
- Add missing fence reference

amdkfd:
- Fix init vm error handling
- Fix double release of compute pasid

i915
- Documentation fixes
- OA-perf related fix
- VLV/CHV HDMI/DP audio fix
- Display DDI/Transcoder fix
- Migrate fixes

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: make display pinning more flexible (v2)
      drm/amdgpu: handle polaris10/11 overlap asics (v2)
      drm/amdgpu: skip MES for S0ix as well since it's part of GFX

Arnd Bergmann (1):
      drm/amd/pm: avoid large variable on kernel stack

Chris Wilson (1):
      drm/i915/migrate: Account for the reserved_space

Christian K=C3=B6nig (8):
      drm/amdgpu: fixx NULL pointer deref in gmc_v9_0_get_vm_pte
      drm/amdgpu: WARN when freeing kernel memory during suspend
      drm/amdgpu: fix GDS/GWS/OA switch handling
      drm/amdgpu: cleanup SPM support a bit
      drm/amdgpu: stop waiting for the VM during unreserve
      drm/amdgpu: rework reserved VMID handling
      drm/amdgpu: revert "generally allow over-commit during BO allocation"
      drm/amdgpu: grab extra fence reference for drm_sched_job_add_dependen=
cy

Colin Ian King (1):
      drm/amd/display: Fix spelling mistake: "dram_clk_chanage" ->
"dram_clk_change"

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.2-2022-12-15' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2022-12-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'amd-drm-fixes-6.2-2022-12-21' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Evan Quan (8):
      drm/amd/pm: add missing SMU13.0.0 mm_dpm feature mapping
      drm/amd/pm: add missing SMU13.0.7 mm_dpm feature mapping
      drm/amd/pm: enable GPO dynamic control support for SMU13.0.0
      drm/amd/pm: enable GPO dynamic control support for SMU13.0.7
      drm/amd/pm: correct SMU13.0.0 pstate profiling clock settings
      drm/amd/pm: update SMU13.0.0 reported maximum shader clock
      drm/amd/pm: bump SMU13.0.0 driver_if header to version 0x34
      drm/amd/pm: correct the fan speed retrieving in PWM for some SMU13 as=
ics

Felix Kuehling (1):
      drm/amdgpu: Add notifier lock for KFD userptrs

Khaled Almahallawy (1):
      drm/i915/display: Don't disable DDI/Transcoder when setting phy
test pattern

Luben Tuikov (3):
      drm/amdgpu: Check if fru_addr is not NULL (v2)
      drm/amdgpu: Fix size validation for non-exclusive domains (v4)
      drm/amdgpu: Remove unnecessary domain argument

Matt Roper (1):
      drm/i915/gt: Correct kerneldoc for intel_gt_mcr_wait_for_reg()

Matthew Auld (2):
      drm/i915/migrate: fix corner case in CCS aux copying
      drm/i915/ttm: consider CCS for backup objects

Miaoqian Lin (1):
      drm/i915: Fix documentation for intel_uncore_forcewake_put__locked

Philip Yang (2):
      drm/amdkfd: Fix kfd_process_device_init_vm error handling
      drm/amdkfd: Fix double release compute pasid

Saleemkhan Jamadar (1):
      drm/amdgpu: enable VCN DPG for GC IP v11.0.4

Shikang Fan (1):
      drm/amdgpu: Add an extra evict_resource call during device_suspend.

Tim Huang (1):
      drm/amdgpu: skip mes self test after s0i3 resume for MES IP v11.0

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Do not parse context image for HSW

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Fix VLV/CHV HDMI/DP audio enable

Yifan Zhang (1):
      drm/amd/display: Add DCN314 display SG Support

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 251 ++++++++++++++---=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  88 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  40 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  79 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  24 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |   8 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |   4 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   2 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   4 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  17 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 113 +++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  42 +++-
 drivers/gpu/drm/i915/display/g4x_dp.c              |   4 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |  25 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  59 -----
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c         |  18 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c             |   2 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c            |  53 ++++-
 drivers/gpu/drm/i915/i915_perf.c                   |   6 +-
 drivers/gpu/drm/i915/intel_uncore.c                |   4 +-
 47 files changed, 647 insertions(+), 372 deletions(-)
