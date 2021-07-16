Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E909C3CB12B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 05:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2F16E8E9;
	Fri, 16 Jul 2021 03:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F836E8E9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 03:41:31 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gb6so12972317ejc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 20:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=/um/AlCUBmByR0rvZO/k9T0+BbJn7ibDjUpgDUtFG/Y=;
 b=WT95uDjSHd66/2F/vQbncNPUhmp7RAk4w7Pg7JWIQi9LcUhUMDxFaQATX1YFlom0FR
 NX6WznzC2e/1J3puN8Id2OGSz4kHY/KcQ73VQSXluWGd5jBeEooc4RMrVbGm6S89prLx
 CPhB3IiM5+zMO5mpHgHiDlJ4XXPTpDnu5LbwiNqFE/wjTXvMaH6lewLJ3UFr0/NKiqFT
 OHkYlZcBaO1NDidHv4gSDQ30FLSZQLiBi5hYV4/3yI8De783IfRoZGFQDdJVxPJsQhkS
 uUOt9s66HI+5d5NdZyBxn/mbkxqy1UvugOjL4y+6E8DHtPJ+Tqjk5ml1aqvtjkY1P/DP
 k1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=/um/AlCUBmByR0rvZO/k9T0+BbJn7ibDjUpgDUtFG/Y=;
 b=twPrnRSkNVz/sE3IdmGaaATVS7Xbz2v86ZgMUyiIYPjGw0yms+yaEXkK4HwFWjV90J
 DgQIukuEgiQxfIXSCObxcZ6Fg4lilsplUHjD3+AxDaFCX63d5Wzup1ZnwhnhdGFqD1E9
 i5dnwxX1QluhbjE62rGqYmV7pm4J31C6mi4K7ckP+mLjw0PE0+kQjdiU2DEy9kCRZmug
 YdECSSMxS7xio+6hyEMfqI3Q/44rAJ1TnT/Vw0YXl/JOe+/idO3gYawonMKWRSeZd7/3
 KyzZSqJ/zLXRCswn5HD8Xu0rs4SD37f76EwiITVCIci7HJVYBjfAz2190nqOvusLikqc
 rCpw==
X-Gm-Message-State: AOAM530DWJlLETlImRbPf5OmDV4DSFLt7BU9Nf57oCzjbIDTOFT+TZ7k
 XUKS3e8wTSz/+Y3OwaGV1P75N6yt4Lsq4uhlViU=
X-Google-Smtp-Source: ABdhPJwk5tuPqvbQahNAOKuKuhwRUfUMnOomg0K2jyRPSqlfMPVIceOB1/9qz5PqFtf1rX9JZvhc8NK06/LHP74fTEA=
X-Received: by 2002:a17:906:1487:: with SMTP id
 x7mr9255767ejc.456.1626406889804; 
 Thu, 15 Jul 2021 20:41:29 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Jul 2021 13:41:18 +1000
Message-ID: <CAPM=9tzb9KSspAtVkSH3pYN97hQ815MoOBTSiuHzUJnnb2fhRA@mail.gmail.com>
Subject: [git pull] drm fixes for 5.14-rc2
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

Regular rc2 fixes though a bit more than usual at rc2 stage, people
must have been testing early or else some fixes from last week got a
bit laggy. There is one larger change in the amd fixes to amalgamate
some power management code on the newer chips with the code from the
older chips, it should only affects chips where support was introduced
in rc1 and it should make future fixes easier to maintain probably a
good idea to merge it now. Otherwise it's mostly fixes across the
board.

Dave.

drm-fixes-2021-07-16:
drm fixes for 5.14-rc2

dma-buf:
- Fix fence leak in sync_file_merge() error code

drm/panel:
- nt35510: Don't fail on DSI reads

fbdev:
- Avoid use-after-free by not deleting current video mode

ttm:
- Avoid NULL-ptr deref in ttm_range_man_fini()

vmwgfx:
- Fix a merge commit

qxl:
- fix a TTM regression

amdgpu:
- SR-IOV fixes
- RAS fixes
- eDP fixes
- SMU13 code unification to facilitate fixes in the future
- Add new renoir DID
- Yellow Carp fixes
- Beige Goby fixes
- Revert a bunch of TLB fixes that caused regressions
- Revert an LTTPR display regression

amdkfd
- Fix VRAM access regression
- SVM fixes

i915:
- Fix -EDEADLK handling regression
- Drop the page table optimisation
The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3=
:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-07-16

for you to fetch changes up to 876d98e5511d8cfd12fc617a6717e7a8ea07be17:

  Merge tag 'drm-intel-fixes-2021-07-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2021-07-16
10:53:02 +1000)

----------------------------------------------------------------
drm fixes for 5.14-rc2

dma-buf:
- Fix fence leak in sync_file_merge() error code

drm/panel:
- nt35510: Don't fail on DSI reads

fbdev:
- Avoid use-after-free by not deleting current video mode

ttm:
- Avoid NULL-ptr deref in ttm_range_man_fini()

vmwgfx:
- Fix a merge commit

qxl:
- fix a TTM regression

amdgpu:
- SR-IOV fixes
- RAS fixes
- eDP fixes
- SMU13 code unification to facilitate fixes in the future
- Add new renoir DID
- Yellow Carp fixes
- Beige Goby fixes
- Revert a bunch of TLB fixes that caused regressions
- Revert an LTTPR display regression

amdkfd
- Fix VRAM access regression
- SVM fixes

i915:
- Fix -EDEADLK handling regression
- Drop the page table optimisation

----------------------------------------------------------------
Aaron Liu (1):
      drm/amd/pm: Add waiting for response of mode-reset message for yellow=
 carp

Chengming Gui (1):
      drm/amd/pm: Fix BACO state setting for Beige_Goby

Christian K=C3=B6nig (1):
      drm/qxl: add NULL check for bo->resource

Daniel Vetter (1):
      Merge tag 'drm-misc-fixes-2021-07-13' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-5.14-2021-07-14' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2021-07-15' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2021-07-15' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Dmytro Laktyushkin (1):
      drm/amd/display: remove faulty assert

Emily Deng (1):
      drm/amdgpu: Correct the irq numbers for virtual crtc

Emily.Deng (1):
      drm/amdgpu: Restore msix after FLR

Eric Huang (5):
      Revert "drm/amdkfd: Add memory sync before TLB flush on unmap"
      Revert "drm/amdgpu: Fix warning of Function parameter or member
not described"
      Revert "drm/amdkfd: Make TLB flush conditional on mapping"
      Revert "drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update"
      Revert "drm/amdkfd: Add heavy-weight TLB flush after unmapping"

Felix Kuehling (1):
      drm/amdkfd: Allow CPU access for all VRAM BOs

Jason Ekstrand (1):
      dma-buf/sync_file: Don't leak fences on merge failure

Jingwen Chen (1):
      drm/amdgpu: SRIOV flr_work should take write_lock

Jinzhou Su (1):
      drm/amdgpu: add another Renoir DID

Linus Walleij (1):
      drm/panel: nt35510: Do not fail if DSI read fails

Luben Tuikov (1):
      drm/amdgpu: Return error if no RAS

Matthew Auld (1):
      drm/i915/gtt: drop the page table optimisation

Nicholas Kazlauskas (1):
      drm/amd/display: Fix updating infoframe for DCN3.1 eDP

Philip Yang (1):
      drm/amdkfd: handle fault counters on invalid address

Thomas Zimmermann (1):
      Merge remote-tracking branch 'drm-misc/drm-misc-next-fixes' into
drm-misc-fixes

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/gt: Fix -EDEADLK handling regression

Wesley Chalmers (1):
      Revert "drm/amd/display: Always write repeater mode regardless of LTT=
PR"

Xiaomeng Hou (2):
      drm/amd/pm: drop smu_v13_0_1.c|h files for yellow carp
      drm/amd/display: update header file name

Zack Rusin (2):
      drm/vmwgfx: Fix implicit declaration error
      drm/vmwgfx: Fix a bad merge in otable batch takedown

Zhan Liu (1):
      drm/amdgpu/display - only update eDP's backlight level when necessary

Zhen Lei (1):
      fbmem: Do not delete the mode that is still in use

Zheyu Ma (1):
      drm/ttm: add a check against null pointer dereference

 drivers/dma-buf/sync_file.c                        |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  18 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  30 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   8 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   2 +-
 .../drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h | 355 --------------
 .../amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h    | 531 -----------------=
----
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |   1 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h           |  57 ---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  24 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c   | 311 ------------
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  49 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c               |   5 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   2 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |   1 -
 drivers/video/fbdev/core/fbmem.c                   |  12 +-
 38 files changed, 202 insertions(+), 1395 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offse=
t.h
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_ma=
sk.h
 delete mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h
 delete mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c
