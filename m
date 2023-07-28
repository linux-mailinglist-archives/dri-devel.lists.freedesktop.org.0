Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50B67661B6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 04:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E473D10E00D;
	Fri, 28 Jul 2023 02:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E730F10E00D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 02:20:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99b78fda9a8so230551666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 19:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690510822; x=1691115622;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=V3ZX1G5+Z7CXFY1StDVJe9nt1PcDpWLc8HkPmuCET2w=;
 b=Y7x2Z6rRVKPOiv1VBNTiiMlax/MxSWAngTJg80U3JHaMzPdoy0oZRJzIBCEkj4iWTc
 BXRE3yLqByGCwFs70eUlJsjWfM2HBWjD7gbaQtKXZhaYrr2Qfb6ze4w3TWJOX5MSGZtl
 BjZ1j9zQUUE2vm2zxJnTXfQFPy/VK6LizJ10+slnm2yb2eR3VF+6+A8PuludYyNLG8h/
 Xqyhj3FXdofOArK9eebSMQ/Klq4jmckA9U4B7sbI7iOYLE5NlbzCMmW8UcH406WEifsi
 7bloXtnFavJzgSmUMeeuG/OdrHhLEDsHzC1Wv7UnmvhBlpjwjxneYSIaGFWKkMZqStvQ
 TEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690510822; x=1691115622;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V3ZX1G5+Z7CXFY1StDVJe9nt1PcDpWLc8HkPmuCET2w=;
 b=PHJLcR+PLEWxf9fJRoHlfNP+JZRq/OL+KZhVmg2hqVTsZ4uQ9pgQhY725pCJFiHM/y
 7BnTSxh3VqAM0O8/yap9o0fV3KGz/TBuzIGC/xUgdGN22tAFBzzMfDgbRzjIMGzCEU9G
 YybstAxfrJBAgBmrzP6w4yDqTZBT1GU/eUHmarcCUlf7vdJ3wMTcEaFmmycGc2Cb5xb8
 XBurWdTVA0KkFYZ16cGpByNrGpz1kO4+tY8bWcKaCaVESPnEyDwIwgmKMlJCy33S746x
 VCtfdzn65it0PgT1wwb/9p88bCMrwtbNDY/aovpWDNh+D1FqVC0ww+00eiSuMc9wGYbD
 6xYA==
X-Gm-Message-State: ABy/qLYc6iK9idTIGleni+NdBtkX0ZT2qPeOkI/1j7mdnDo/szhdgdWZ
 oBLnB06m+vj1MDcm/xYp38f7g5itR989WJlxYHk=
X-Google-Smtp-Source: APBJJlH/8ejfgkLsqH+y3yALiYusBMNm3B4+y8T4pIIqznLo/1+FMeURBWWA7i+Lo7WvhuFINP+0tSe5jVkw3Mu5psw=
X-Received: by 2002:a17:906:1d0:b0:992:4e20:bca4 with SMTP id
 16-20020a17090601d000b009924e20bca4mr786311ejj.42.1690510822077; Thu, 27 Jul
 2023 19:20:22 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Jul 2023 12:20:10 +1000
Message-ID: <CAPM=9twwk0C6kGQXFZdvEhxnLe7DhnwN8doj_yA3a9S3hs7c1w@mail.gmail.com>
Subject: [git pull] drm fixes for 6.5-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Regular scheduled fixes, msm and amdgpu leading the way, with some
i915 and a single misc fbdev, all seems fine.

Dave.

drm-fixes-2023-07-28:
drm fixes for 6.5-rc4

fbdev:
- remove unused function

amdgpu:
- gfxhub partition fix
- Fix error handling in psp_sw_init()
- SMU13 fix
- DCN 3.1 fix
- DCN 3.2 fix
- Fix for display PHY programming sequence
- DP MST error handling fix
- GFX 9.4.3 fix

amdkfd:
- GFX11 trap handling fix

i915:
- Use shmem for dpt objects
- Fix an error handling path in igt_write_huge()

msm:
- display:
- Fix to correct the UBWC programming for decoder version 4.3 seen
  on SM8550
- Add the missing flush and fetch bits for DMA4 and DMA5 SSPPs.
- Fix to drop the unused dpu_core_perf_data_bus_id enum from the code
- Drop the unused dsi_phy_14nm_17mA_regulators from QCM 2290 DSI cfg.
- gpu:
- Fix warn splat for newer devices without revn
- Remove name/revn for a690.. we shouldn't be populating these for
  newer devices, for consistency, but it slipped through review
- Fix a6xx gpu snapshot BINDLESS_DATA size (was listed in bytes
  instead of dwords, causing AHB faults on a6xx gen4/a660-family)
- Disallow submit with fence id 0
The following changes since commit 6eaae198076080886b9e7d57f4ae06fa782f90ef:

  Linux 6.5-rc3 (2023-07-23 15:24:10 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-07-28

for you to fetch changes up to 9a767faa9477ef2a5fee6a0c9d69587b95a885df:

  Merge tag 'drm-msm-fixes-2023-07-27' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes (2023-07-28
11:59:14 +1000)

----------------------------------------------------------------
drm fixes for 6.5-rc4

fbdev:
- remove unused function

amdgpu:
- gfxhub partition fix
- Fix error handling in psp_sw_init()
- SMU13 fix
- DCN 3.1 fix
- DCN 3.2 fix
- Fix for display PHY programming sequence
- DP MST error handling fix
- GFX 9.4.3 fix

amdkfd:
- GFX11 trap handling fix

i915:
- Use shmem for dpt objects
- Fix an error handling path in igt_write_huge()

msm:
- display:
- Fix to correct the UBWC programming for decoder version 4.3 seen
  on SM8550
- Add the missing flush and fetch bits for DMA4 and DMA5 SSPPs.
- Fix to drop the unused dpu_core_perf_data_bus_id enum from the code
- Drop the unused dsi_phy_14nm_17mA_regulators from QCM 2290 DSI cfg.
- gpu:
- Fix warn splat for newer devices without revn
- Remove name/revn for a690.. we shouldn't be populating these for
  newer devices, for consistency, but it slipped through review
- Fix a6xx gpu snapshot BINDLESS_DATA size (was listed in bytes
  instead of dwords, causing AHB faults on a6xx gen4/a660-family)
- Disallow submit with fence id 0

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Don't apply FIFO resync W/A if rdivider = 0

Christophe JAILLET (1):
      drm/i915: Fix an error handling path in igt_write_huge()

Dan Carpenter (1):
      drm/amd/display: Unlock on error path in
dm_handle_mst_sideband_msg_ready_event()

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2023-07-27' of
git://anongit.freedesktop.org/drm/drm-misc into drm-fixes
      Merge tag 'drm-intel-fixes-2023-07-27' of
git://anongit.freedesktop.org/drm/drm-intel into drm-fixes
      Merge tag 'amd-drm-fixes-6.5-2023-07-26' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
      Merge tag 'drm-msm-fixes-2023-07-27' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes

Dmitry Baryshkov (2):
      drm/msm/mdss: correct UBWC programming for SM8550
      drm/msm/dpu: drop enum dpu_core_perf_data_bus_id

Gaosheng Cui (1):
      drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()

George Shen (1):
      drm/amd/display: Guard DCN31 PHYD32CLK logic against chip family

Jane Jian (1):
      drm/amd/smu: use AverageGfxclkFrequency* to replace previous GFX
Curr Clock

Jonathan Kim (1):
      drm/amdkfd: fix trap handling work around for debugging

Jonathan Marek (1):
      drm/msm/dpu: add missing flush and fetch bits for DMA4/DMA5 planes

Leo Chen (1):
      drm/amd/display: Exit idle optimizations before attempt to access PHY

Lijo Lazar (1):
      drm/amdgpu: Restore HQD persistent state register

Marijn Suijten (1):
      drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config

Mario Limonciello (1):
      drm/amd: Fix an error handling mistake in psp_sw_init()

Radhakrishna Sripada (1):
      drm/i915/dpt: Use shmem for dpt objects

Rob Clark (5):
      drm/msm/adreno: Fix warn splat for devices without revn
      drm/msm/a690: Remove revn and name
      drm/msm/adreno: Fix snapshot BINDLESS_DATA size
      drm/msm: Fix hw_fence error path cleanup
      drm/msm: Disallow submit with fence id 0

Victor Lu (1):
      drm/amdgpu: Fix infinite loop in gfxhub_v1_2_xcc_gart_enable (v2)

YueHaibing (1):
      drm/fb-helper: Remove unused inline function drm_fb_helper_defio_init()

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c               |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c               |  3 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c              |  5 +----
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c                |  5 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h                |  6 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c |  6 ++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 .../drm/amd/display/dc/dce110/dce110_hw_sequencer.c   |  3 +++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c     |  3 ++-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c     |  5 ++++-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_dpt.c              |  4 +++-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c       |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c                 |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h           |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c            |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.h               | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h         | 13 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c            |  8 +++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c            |  2 --
 drivers/gpu/drm/msm/msm_fence.c                       |  6 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c                  | 16 ++++++++++++++--
 drivers/gpu/drm/msm/msm_mdss.c                        | 19 +++++++++++++++++--
 include/drm/drm_fb_helper.h                           |  5 -----
 24 files changed, 88 insertions(+), 55 deletions(-)
