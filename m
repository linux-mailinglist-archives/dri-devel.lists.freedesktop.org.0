Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4213BF431
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 05:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014906E20B;
	Thu,  8 Jul 2021 03:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D434C6E209
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 03:07:02 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v1so6316037edt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 20:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ZiuonARrCQCukLkSMESCo/Rbo7DU/jQm+OMfOC/COxM=;
 b=egHoAayTFmxrme9MvsR30sXf7Y7GkgCy5StLlW7ZFeFTbSIDQScSU+RZjT9DgIoowx
 lOskgZlMr3AvPga2DnwXEER2gjQ0solhYHU6EBfJf04Cv2gjOqiMbGvsg7rnHMr6grkP
 0iKju8Z9aOIzvJlS9zV/JE4QuyePYDd4Ksw5t0qHWcac2XsthdfUiz295ME/VsdNuh0g
 jNQRg6Al7ztNBy+J/Ycti4SDoJw4lxb4Q839qrqLj4dOEbdQBbZS96Va3X2xG/C7gRQe
 BO/UQxiQRrRpl3Nc3/t9tKevSGMTtkCaAAWdvDHnGlJmsiApxQRXaxeDjKk4cvk+Tf3T
 /JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=ZiuonARrCQCukLkSMESCo/Rbo7DU/jQm+OMfOC/COxM=;
 b=nBDFuKF5tHcjoQOkB5KyrF1tjgAOq4jRmK5OXe8An5jZ2Rje7nup28/Z1WJ8jKQZiz
 Fe94uGx8v+83PgHsTckxFRt2ZrgjlzshYUw14Qw8ri8Gg8z5E/oFZN55HEcF7QVP/Iq0
 Pe1hdKLcsZLT8Yjxm/e+FY3jUPvwdcmcdaKhR+UhobbL99Qbpc87hC3Ok/2eFuUEoSvk
 sn3j9iklj8HDDRsrL687dkt7gFMrxx6uA/zQn6wEqG5rY0IlFjBpQaxPzT+1gx6KlJ8R
 f+RSXUa+JEvPbyJbjuVZwce7sfkO5xnvNQD/ZCfbU3o3JEdpTYaXnL/xg+vpcPwOyoqP
 cY3w==
X-Gm-Message-State: AOAM531lZRARd7qq7FPAwlLNVsd2jdhsku83JCJYw7ULSXyjPhOvX/gg
 kaomQtqjCce78Q9Kdls1qShotoI+Rq8tsh/oiZQ=
X-Google-Smtp-Source: ABdhPJxPiWzK772tRugCsz+v05N2B2Ignw/EGE7XCeUTrAT8JcQXovWJ4tm/orZEFxIS3sCYKCm3Bh5PLW4d3mr1uJs=
X-Received: by 2002:a05:6402:1d07:: with SMTP id
 dg7mr34778270edb.298.1625713621401; 
 Wed, 07 Jul 2021 20:07:01 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 8 Jul 2021 13:06:50 +1000
Message-ID: <CAPM=9txowZc9-MVfS_uvASJMnE4Okt4B8KHCyk3nC9x=-a+w3w@mail.gmail.com>
Subject: [git pull] drm fixes for 5.14-rc1
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

Some fixes for rc1 that came in the past weeks, mainly a bunch of
amdgpu fixes, some i915 and the rest are misc around the place. I'm
sending this a bit early so some more stuff may show up, but I'll
probably take tomorrow off.

Dave.

drm-next-2021-07-08-1:
drm fixes for 5.14-rc1

dma-buf:
- doc fixes

amdgpu:
- Misc Navi fixes
- Powergating fix
- Yellow Carp updates
- Beige Goby updates
- S0ix fix
- Revert overlay validation fix
- GPU reset fix for DC
- PPC64 fix
- Add new dimgrey cavefish DID
- RAS fix
- TTM fixes

amdkfd:
- SVM fixes

radeon:
- Fix missing drm_gem_object_put in error path
- NULL ptr deref fix

i915:
- display DP VSC fix
- DG1 display fix
- IRQ fixes
- IRQ demidlayering

gma500:
- bo leaks in error paths fixed
The following changes since commit 8a02ea42bc1d4c448caf1bab0e05899dad503f74=
:

  Merge tag 'drm-intel-next-fixes-2021-06-29' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-06-30
15:42:05 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-2021-07-08-1

for you to fetch changes up to 21c355b09711e95f8f0e7c1890b343c6cd350042:

  Merge tag 'drm-misc-next-fixes-2021-07-01' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next (2021-07-08
11:17:32 +1000)

----------------------------------------------------------------
drm fixes for 5.14-rc1

dma-buf:
- doc fixes

amdgpu:
- Misc Navi fixes
- Powergating fix
- Yellow Carp updates
- Beige Goby updates
- S0ix fix
- Revert overlay validation fix
- GPU reset fix for DC
- PPC64 fix
- Add new dimgrey cavefish DID
- RAS fix
- TTM fixes

amdkfd:
- SVM fixes

radeon:
- Fix missing drm_gem_object_put in error path
- NULL ptr deref fix

i915:
- display DP VSC fix
- DG1 display fix
- IRQ fixes
- IRQ demidlayering

gma500:
- bo leaks in error paths fixed

----------------------------------------------------------------
Aaron Liu (2):
      drm/amdgpu: enable tmz on yellow carp
      drm/amdgpu: enable sdma0 tmz for Raven/Renoir(V2)

Alex Deucher (2):
      drm/amdgpu/display: drop unused variable
      drm/amdgpu: add new dimgrey cavefish DID

Alex Sierra (11):
      drm/amdkfd: inc counter on child ranges with xnack off
      drm/amdkfd: device pgmap owner at the svm migrate init
      drm/amdkfd: add owner ref param to get hmm pages
      drm/amdkfd: set owner ref to svm range prefault
      drm/amdgpu: get owner ref in validate and map
      drm/amdkfd: use hmm range fault to get both domain pfns
      drm/amdkfd: classify and map mixed svm range pages in GPU
      drm/amdkfd: skip invalid pages during migrations
      drm/amdkfd: skip migration for pages already in VRAM
      drm/amdkfd: add invalid pages debug at vram migration
      drm/amdkfd: Maintain svm_bo reference in page->zone_device_data

Chengming Gui (1):
      drm/amd/amdgpu: enable gpu recovery for beige_goby

Chengzhe Liu (1):
      drm/amdgpu: Power down VCN and JPEG before disabling SMU features

Darren Powell (1):
      amdgpu/pm: remove code duplication in show_power_cap calls

Dave Airlie (3):
      Merge tag 'amd-drm-next-5.14-2021-07-01' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-intel-next-fixes-2021-07-07' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
      Merge tag 'drm-misc-next-fixes-2021-07-01' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next

Evan Quan (7):
      drm/amdgpu: correct tcp harvest setting
      drm/amdgpu: fix Navi1x tcp power gating hang when issuing
lightweight invalidaiton
      drm/amdgpu: fix NAK-G generation during PCI-e link width switch
      drm/amdgpu: fix the hang caused by PCIe link width switch
      drm/amdgpu: correct clock gating settings on feature unsupported
      drm/amdgpu: update GFX MGCG settings
      drm/amdgpu: update HDP LS settings

Guchun Chen (2):
      drm/amd/display: fix incorrrect valid irq check
      drm/amd/display: fix null pointer access in gpu reset

Huang Rui (1):
      drm/amdgpu: move apu flags initialization to the start of device init

Jing Xiangfeng (2):
      drm/gma500: Add the missed drm_gem_object_put() in
psb_user_framebuffer_create()
      drm/radeon: Add the missed drm_gem_object_put() in
radeon_user_framebuffer_create()

Joseph Greathouse (1):
      drm/amdgpu: Update NV SIMD-per-CU to 2

Jos=C3=A9 Roberto de Souza (1):
      drm/i915/display/dg1: Correctly map DPLLs during state readout

Kees Cook (1):
      drm/i915/display: Do not zero past infoframes.vsc

Michal Suchanek (1):
      drm/amdgpu/dc: Really fix DCN3.1 Makefile for PPC64

Mikel Rychliski (1):
      drm/radeon: Fix NULL dereference when updating memory stats

Mukul Joshi (1):
      drm/amdgpu: Conditionally reset SDMA RAS error counts

Nicholas Kazlauskas (1):
      drm/amd/display: Extend DMUB diagnostic logging to DCN3.1

Nirmoy Das (1):
      drm/amdgpu: return early for non-TTM_PL_TT type BOs

Oak Zeng (1):
      drm/amdgpu: Set ttm caching flags during bo allocation

Philip Yang (4):
      drm/amdkfd: add helper function for kfd sysfs create
      drm/amdkfd: fix sysfs kobj leak
      drm/amdkfd: add sysfs counters for vm fault and migration
      drm/amdkfd: implement counters for vm fault and migration

Randy Dunlap (1):
      <linux/dma-resv.h>: correct a function name in kernel-doc

Reka Norman (1):
      drm/amd/display: Respect CONFIG_FRAME_WARN=3D0 in dml Makefile

Rodrigo Siqueira (1):
      Revert "drm/amd/display: Fix overlay validation by considering cursor=
s"

Shyam Sundar S K (1):
      drm/amd/pm: skip PrepareMp1ForUnload message in s0ix

Thomas Zimmermann (2):
      drm/i915: Use the correct IRQ during resume
      drm/i915: Drop all references to DRM IRQ midlayer

Tiezhu Yang (1):
      drm/radeon: Call radeon_suspend_kms() in radeon_pci_shutdown()
for Loongson64

Veerabadhran Gopalakrishnan (1):
      amdgpu/nv.c - Added codec query for Beige Goby

Zhan Liu (1):
      drm/amd/display: Enabling eDP no power sequencing with DAL feature ma=
sk

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  37 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   5 +
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 266 +++++++++++++++--=
---
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |  85 ++++---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |  51 +++-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  37 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v11_0.c           |   5 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 100 +++++---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   9 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           | 272 ++++++++++++-----=
----
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 236 ++++++++++++-----=
-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |  19 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  31 ++-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |   2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |   8 +-
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |   4 +-
 drivers/gpu/drm/amd/display/dc/irq_types.h         |   2 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |  60 +++++
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.h  |  16 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   5 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |  10 +-
 drivers/gpu/drm/amd/include/navi10_enum.h          |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  95 ++-----
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   3 +-
 drivers/gpu/drm/gma500/framebuffer.c               |   7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  19 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   7 +-
 drivers/gpu/drm/i915/i915_drv.c                    |   1 -
 drivers/gpu/drm/i915/i915_irq.c                    |  10 +-
 drivers/gpu/drm/i915/i915_irq.h                    |   1 +
 drivers/gpu/drm/i915/i915_reg.h                    |   3 -
 drivers/gpu/drm/radeon/radeon_display.c            |   1 +
 drivers/gpu/drm/radeon/radeon_drv.c                |   8 +-
 drivers/gpu/drm/radeon/radeon_object.c             |  29 +--
 drivers/gpu/drm/radeon/radeon_object.h             |   2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |  13 +-
 include/linux/dma-resv.h                           |   2 +-
 53 files changed, 1048 insertions(+), 504 deletions(-)
