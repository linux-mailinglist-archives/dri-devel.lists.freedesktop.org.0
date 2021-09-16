Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFFD40EB7E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 22:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BCD6E82A;
	Thu, 16 Sep 2021 20:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133856E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:15:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id q3so21310970edt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=6AWUDPsWwtrqPx9907EkcEI/G/RnCXM0GxmUPoB46Lg=;
 b=Gn+AVCdJalYkHFqAtLhvtm2/Kdq8CYY9J6scElVKCWtYJrStog34taNEUtxI4KAnxb
 t8OdluDIwe2fJlXrLbOvcMWm7qIEOgKrWCx8ht6+Vku34Jabfu677gYC2K0mbcmz1XoR
 r2PDOZJSangszGu4uaSWLhWHY4ddRYYc+PBp8ZrW8NNoQMWd/SoZ7fcyuhjOamr6rOFL
 eZIYWoFx7ljzqr0y0+imIiwDjU9UY6WrWegNI+0HzT0avLJEz9T7Bufmqxsi3vZrPJ4u
 PzTC4nSeBTBB7HZnzx1PCJf+ws+mZr560V3wFTkuR45nOf3GL3ONevrg8R6kRbjJYTZ6
 X2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=6AWUDPsWwtrqPx9907EkcEI/G/RnCXM0GxmUPoB46Lg=;
 b=sKWdrMPmOo/phOyNkKQT/6M1uC67F/Ck/TMd4BGomN80FSP+cY16o0nv3H6foRN1Ru
 aeJvonl3ELngPpVHcqUqy4GEBLspGH+8wRoOwll93vCz8gE/O5eeThfEXGukWpoi/MpJ
 9VRNnzs50STAhX4oMMr9vJ7uEqByDOrn/ZwCOdOjFq3Xu+O+t4qJgKQmfy7UbM5pbYKg
 mEuVB1cWbHLaOiYYtn7tDgY8ctrKdJX6NI/dJu3gBHIHWcQloaRmaVHTKVyci9FYGo+w
 kRABsSraqezvbIV6YJehWU0K32mf88+V3RgbsJv8skMEYjYaRvR2oPzVXI5vTEj8XCYC
 3Zwg==
X-Gm-Message-State: AOAM532qgSeW9uCvzUDP7H6rvBxRlfraXr0Sr64OaMqgl6b0Z3ET+dmE
 w2KZci5iXCc51tNElA6cKqvf9sGK0eOj1lIYmxg=
X-Google-Smtp-Source: ABdhPJx8abzzjv+Z2jF4KSdHidfC3idcealLXNUC+JPAsHwy7fJU7GoAYf6T3CLj5OVa1h86r92Ko2rT+aCP7UngHNM=
X-Received: by 2002:a17:906:31d7:: with SMTP id
 f23mr7901661ejf.190.1631823353421; 
 Thu, 16 Sep 2021 13:15:53 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 Sep 2021 06:15:42 +1000
Message-ID: <CAPM=9tyrmDa4qCvu0pf0JHU1DmDnq5H=1uE1JaGjLs6E6dPZNQ@mail.gmail.com>
Subject: [git pull] drm fixes for 5.15-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Slightly busier than usual rc2, but mostly scattered amdgpu fixes,
some i915 and etnaviv resolves an MMU/runtime PM blowup, otherwise I'm
offline for next few days, but back early next week.

drm-fixes-2021-09-17:
drm fixes for 5.15-rc2

amdgpu:
- UBSAN fix
- Powerplay table update fix
- Fix use after free in BO moves
- Debugfs init fixes
- vblank workqueue fixes for headless devices
- FPU fixes
- sysfs_emit fixes
- SMU updates for cyan skillfish
- Backlight fixes when DMCU is not initialized
- DP MST fixes
- HDCP compliance fix
- Link training fix
- Runtime pm fix
- Panel orientation fixes
- Display GPUVM fix for yellow carp
- Add missing license

amdkfd:
- Drop PCI atomics requirement if proper firmware is available
- Suspend/resume fixes for IOMMUv2 cases

radeon:
- AGP fix

i915:
- Propagate DP link training error returns
- Use max link params for eDP 1.3 and earlier
- Build warning fixes
- Gem selftest fixes
- Ensure wakeref is held before hardware access

etnaviv:
- MMU context vs runtime PM fix
The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f=
:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-09-17

for you to fetch changes up to 109f7ea9aedce437b4b7737ab60bfea65d9dbdd3:

  Merge tag 'amd-drm-fixes-5.15-2021-09-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-09-17
05:58:55 +1000)

----------------------------------------------------------------
drm fixes for 5.15-rc2

amdgpu:
- UBSAN fix
- Powerplay table update fix
- Fix use after free in BO moves
- Debugfs init fixes
- vblank workqueue fixes for headless devices
- FPU fixes
- sysfs_emit fixes
- SMU updates for cyan skillfish
- Backlight fixes when DMCU is not initialized
- DP MST fixes
- HDCP compliance fix
- Link training fix
- Runtime pm fix
- Panel orientation fixes
- Display GPUVM fix for yellow carp
- Add missing license

amdkfd:
- Drop PCI atomics requirement if proper firmware is available
- Suspend/resume fixes for IOMMUv2 cases

radeon:
- AGP fix

i915:
- Propagate DP link training error returns
- Use max link params for eDP 1.3 and earlier
- Build warning fixes
- Gem selftest fixes
- Ensure wakeref is held before hardware access

etnaviv:
- MMU context vs runtime PM fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/display: add a proper license to dc_link_dp.c

Anson Jacob (1):
      drm/amd/display: dc_assert_fp_enabled assert only if FPU is not enabl=
ed

Christian K=C3=B6nig (1):
      drm/amdgpu: fix use after free during BO move

Daniel Vetter (1):
      drm/i915: Release ctx->syncobj on final put, not on ctx close

Daniele Ceraolo Spurio (1):
      drm/i915/guc: drop guc_communication_enabled

Dave Airlie (3):
      Merge branch 'etnaviv/fixes' of
https://git.pengutronix.de/git/lst/linux into drm-fixes
      Merge tag 'drm-intel-fixes-2021-09-16' of
ssh://git.freedesktop.org/git/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-5.15-2021-09-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Ernst Sj=C3=B6strand (1):
      drm/amd/amdgpu: Increase HWIP_MAX_INSTANCE to 10

Evan Quan (1):
      drm/amd/pm: fix runpm hang when amdgpu loaded prior to sound driver

Felix Kuehling (1):
      drm/amdkfd: make needs_pcie_atomics FW-version dependent

Harry Wentland (1):
      drm/amd/display: Get backlight from PWM if DMCU is not initialized

Hersen Wu (1):
      drm/amd/display: dsc mst 2 4K displays go dark with 2 lane HBR3

James Zhu (3):
      drm/amdkfd: separate kfd_iommu_resume from kfd_resume
      drm/amdgpu: add amdgpu_amdkfd_resume_iommu
      drm/amdgpu: move iommu_resume before ip init/resume

Kai-Heng Feng (1):
      drm/i915/dp: Use max params for panels < eDP 1.4

Kenneth Feng (1):
      drm/amd/pm: fix the issue of uploading powerplay table

Lang Yu (5):
      drm/amdgpu: fix sysfs_emit/sysfs_emit_at warnings(v2)
      drm/amdgpu: update SMU PPSMC for cyan skilfish
      drm/amdgpu: update SMU driver interface for cyan skilfish(v3)
      drm/amdgpu: add some pptable funcs for cyan skilfish(v3)
      drm/amdgpu: add manual sclk/vddc setting support for cyan skilfish(v3=
)

Lee Shawn C (1):
      drm/i915/dp: return proper DPRX link training result

Lucas Stach (8):
      drm/etnaviv: return context from etnaviv_iommu_context_get
      drm/etnaviv: put submit prev MMU context when it exists
      drm/etnaviv: stop abusing mmu_context as FE running marker
      drm/etnaviv: keep MMU context across runtime suspend/resume
      drm/etnaviv: exec and MMU state is lost when resetting the GPU
      drm/etnaviv: fix MMU context leak on GPU reset
      drm/etnaviv: reference MMU context when setting up hardware state
      drm/etnaviv: add missing MMU context put when reaping MMU mapping

Meenakshikumar Somasundaram (1):
      drm/amd/display: Link training retry fix for abort case

Michel D=C3=A4nzer (1):
      drm/amdgpu: Drop inline from amdgpu_ras_eeprom_max_record_count

Nathan Chancellor (3):
      drm/i915/selftests: Do not use import_obj uninitialized
      drm/i915/selftests: Always initialize err in
igt_dmabuf_import_same_driver_lmem()
      drm/i915: Enable -Wsometimes-uninitialized

Nicholas Kazlauskas (2):
      drm/amd/display: Add NULL checks for vblank workqueue
      drm/amd/display: Fix white screen page fault for gpuvm

Nirmoy Das (2):
      drm/amdgpu: use IS_ERR for debugfs APIs
      drm/radeon: pass drm dev radeon_agp_head_init directly

Paul Menzel (1):
      drm/amdgpu: Demote TMZ unsupported log message from warning to info

Qingqing Zhuo (1):
      drm/amd/display: Fix unstable HPCP compliance on Chrome Barcelo

Simon Ser (2):
      amd/display: downgrade validation failure log level
      amd/display: enable panel orientation quirks

Thomas Hellstr=C3=B6m (1):
      drm/i915/gem: Fix the mman selftest

Vinay Belgaumkar (1):
      drm/i915: Get PM ref before accessing HW register

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  56 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 109 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  18 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  34 +-
 .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |  10 -
 .../amd/pm/inc/smu11_driver_if_cyan_skillfish.h    |  86 ++--
 drivers/gpu/drm/amd/pm/inc/smu_types.h             |   5 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_8_ppsmc.h       |   9 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   8 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    | 481 +++++++++++++++++=
++++
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  28 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  16 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  12 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  21 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  15 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c           |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |  43 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h              |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c            |   4 +
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c         |   8 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c              |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h              |   4 +-
 drivers/gpu/drm/i915/Makefile                      |   1 -
 drivers/gpu/drm/i915/display/intel_dp.c            |   5 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   6 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c   |   7 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  26 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |  11 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |   2 +-
 51 files changed, 945 insertions(+), 218 deletions(-)
