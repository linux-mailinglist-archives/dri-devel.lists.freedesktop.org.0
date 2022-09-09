Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE5D5B3C7B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 17:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430A310E02C;
	Fri,  9 Sep 2022 15:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AA810E02C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 15:58:08 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1280590722dso5043673fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date;
 bh=LforsK3uQj1bEdjt7oBoGTnSPQgzrR6nljtmC4TEjmQ=;
 b=UKwY3RMPigziYGOBVflT8cBm5XddnOAoNWLBbanvuNo7dQgQpQE6riib/ihg7jxeY2
 u53csEYP9faFhLQRix3BqsQcVYpxxzozTwOfLfq5Y/760GhDS+OehchyFlyFGSb5aeQy
 zP+W1GT75OfNUsEqXt6f/cGTDsf+z9gBr2bW7Ib/bS/bCjU9GsTuOeEdPvDrNxpVgjSF
 VH8SLCvPy4oilmiNmVLuRGHorimtSu7LK39lNqcJo7DtigIElPvDFiYJqMYT1SLyqV2L
 IGV9aFDLnQFzQs0NgosgBNTQuMDO6H95oknp/Kc0VMGIZv6qe6nUvY75FQqvMAnrZwF1
 4GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LforsK3uQj1bEdjt7oBoGTnSPQgzrR6nljtmC4TEjmQ=;
 b=SicftmOw0DhsNeX/hkxgLF6O3TyUUQj6VjcBiHJr7cDuzkFTehUTh35v1aDh8qQUhR
 c2AY2vyli5QZwv9FyoGV+vP2CzapHq9T4yNyJ4c6UKAhYGSacH80Fv0pb/8rSrnHvAwT
 WDsND0sliu9PmADuz0P3d0/CjiKNqQmVBvl26qnxy4dLARtcja9/qU6HTFedBFpfAfRA
 2bBmiVdSHVzY6GijzjQwxDeJHIl/Ayq537uPRLc2mGZXl2B2ZXJ4sosKS/pQHL52Xi9W
 +GqYHMr9WX4JoVtek2+z9AsxVUcJb3ZmFspLP4w6UHq6niWdylOgd3G+9fbjgZxL08AF
 JxZQ==
X-Gm-Message-State: ACgBeo0AL2mLvl2dDj5tZ0xgu09GcG8vUWSuzF3CrQ9Z6jnaTR8Dr7y8
 Fp6MXVtTLy5jtNfvPia/UkRsIxt5Aw6v8jWg1/M=
X-Google-Smtp-Source: AA6agR4qKH2lH2UfOozkO6mL3JZqYlPDOABlyN195mlfTkEyptW7D3JBJU0RKC962fy4lLFASnCFiTT6WNPGxkBVFFk=
X-Received: by 2002:a05:6870:2044:b0:116:d25d:a6d7 with SMTP id
 l4-20020a056870204400b00116d25da6d7mr5445469oad.132.1662739087393; Fri, 09
 Sep 2022 08:58:07 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 10 Sep 2022 01:57:22 +1000
Message-ID: <CAPM=9tydpsi2=fujRgT4B2CcOgY1EQ7WmVUNtcZ+1jUjoDbK9Q@mail.gmail.com>
Subject: [git pull] drm fixes for 6.0-rc5
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

From a train in the Irish countryside, regular drm fixes for 6.0-rc5.
This is mostly amdgpu/amdkfd and i915 fixes, then one panfrost, one
ttm and one edid fix. Nothing too major going on. Hopefully a quiet
week next week for LPC.

Dave.

drm-fixes-2022-09-10:
drm fixes for 6.0-rc5

edid:
- Fix EDID 1.4 range-descriptor parsing

ttm:
- Fix ghost-object bulk moves

i915:
- Fix MIPI sequence block copy from BIOS' table
- Fix PCODE min freq setup when GuC's SLPC is in use
- Implement Workaround for eDP
- Fix has_flat_ccs selection for DG1

amdgpu:
- Firmware header fix
- SMU 13.x fix
- Debugfs memory leak fix
- NBIO 7.7 fix
- Firmware memory leak fix

amdkfd:
- Debug output fix

panfrost:
- Fix devfreq OPP
The following changes since commit 7e18e42e4b280c85b76967a9106a13ca61c16179=
:

  Linux 6.0-rc4 (2022-09-04 13:10:01 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-10

for you to fetch changes up to 2edb79a5fb303dff577d6a0c7d571c3bab1d1455:

  Merge tag 'drm-intel-fixes-2022-09-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2022-09-10
01:42:47 +1000)

----------------------------------------------------------------
drm fixes for 6.0-rc5

edid:
- Fix EDID 1.4 range-descriptor parsing

ttm:
- Fix ghost-object bulk moves

i915:
- Fix MIPI sequence block copy from BIOS' table
- Fix PCODE min freq setup when GuC's SLPC is in use
- Implement Workaround for eDP
- Fix has_flat_ccs selection for DG1

amdgpu:
- Firmware header fix
- SMU 13.x fix
- Debugfs memory leak fix
- NBIO 7.7 fix
- Firmware memory leak fix

amdkfd:
- Debug output fix

panfrost:
- Fix devfreq OPP

----------------------------------------------------------------
Chengming Gui (1):
      drm/amd/amdgpu: add rlc_firmware_header_v2_4 to amdgpu_firmware_heade=
r

Christian K=C3=B6nig (1):
      drm/ttm: cleanup the resource of ghost objects after locking them

Cl=C3=A9ment P=C3=A9ron (1):
      drm/panfrost: devfreq: set opp to the recommended one to
configure regulator

Dave Airlie (3):
      Merge tag 'amd-drm-fixes-6.0-2022-09-07' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-misc-fixes-2022-09-08' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2022-09-08' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes

Evan Quan (1):
      drm/amd/pm: add missing SetMGpuFanBoostLimitRpm mapping for SMU 13.0.=
7

Greg Kroah-Hartman (1):
      drm/amd/display: fix memory leak when using debugfs_lookup()

Guchun Chen (1):
      drm/amdgpu: prevent toc firmware memory leak

Matthew Auld (1):
      drm/i915: consider HAS_FLAT_CCS() in needs_ccs_pages

Rodrigo Vivi (1):
      drm/i915/slpc: Let's fix the PCODE min freq table setup for SLPC

Ville Syrj=C3=A4l=C3=A4 (3):
      drm/edid: Handle EDID 1.4 range descriptor h/vfreq offsets
      drm/i915/bios: Copy the whole MIPI sequence block
      drm/i915: Implement WaEdpLinkRateDataReload

Yifan Zhang (2):
      drm/amdkfd: print address in hex format rather than decimal
      drm/amdgpu: correct doorbell range/size value for CSDMA_DOORBELL_RANG=
E

ZhenGuo Yin (1):
      drm/ttm: update bulk move object of ghost BO

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |  1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |  6 ---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  1 +
 drivers/gpu/drm/drm_debugfs.c                      |  4 +-
 drivers/gpu/drm/drm_edid.c                         | 24 ++++++++---
 drivers/gpu/drm/i915/display/intel_bios.c          |  7 +++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 22 ++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |  2 +-
 drivers/gpu/drm/i915/gt/intel_llc.c                | 19 ++++----
 drivers/gpu/drm/i915/gt/intel_rps.c                | 50 ++++++++++++++++++=
++++
 drivers/gpu/drm/i915/gt/intel_rps.h                |  2 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        | 11 +++++
 drivers/gpu/drm/ttm/ttm_bo_util.c                  | 13 +++---
 include/drm/drm_connector.h                        |  4 +-
 include/drm/drm_edid.h                             |  5 +++
 19 files changed, 149 insertions(+), 35 deletions(-)
