Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A6A1D6E3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 14:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE6E10E3BF;
	Mon, 27 Jan 2025 13:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Nx86Wv2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2FD10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:34:18 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso46063705e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737984857; x=1738589657; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8GLV2aKEAguNvO0mM56Rs5yVBlJf0qmDijOYims8LAs=;
 b=Nx86Wv2dwU6Obs0GLvxDHKHXB2cfvEZQegjx8Kd28HSzxZ2FSj1EuAz0TjHXUGSEBP
 DV93X47IQLr4ZJgboF6vu6J7KBpzIVs4gTOmIQ5lMf7rJWPoJkBnSBRdstS3nGDez0ek
 b9clT61WVWJKQlzk3YiPEGVyFr02lgdsKLhhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737984857; x=1738589657;
 h=content-transfer-encoding:content-disposition:mime-version
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8GLV2aKEAguNvO0mM56Rs5yVBlJf0qmDijOYims8LAs=;
 b=c4F9C0LFGG6CjuTShEfHcDA1FTjBk02E/1Ji7YyvhpYGztFn20JSGmOpWdWqyvx7jt
 uiw6v7fLRwwcDYr0UqphBc2HRUwes12kF+kbXTjbEKKHReJPrMc+Xi6PH4Boj/Z+90G6
 buqkAauUhHssJeu11BiGfkcNY+4eVj7c0TYJO4CYvAvnbM0UFFjlyGvo0Qc5tKerht5m
 0dRqeAbQz4g8nFM9JGB03o1zl/d4Ps4ilJc9yC2CncCUSRCfS5MoTBVmwQZnjdzOGvco
 cZV32ZC+zikqvHnktZs/dbB3z58d3b6OxFqeA2RXqX0U0L4vryvwmVuBku5tUTUSiIn3
 M42w==
X-Gm-Message-State: AOJu0YwxTyn3x9XNEj1mgMVDuGIkDhvcxb8tx05vj9sQu16lF9eol8tV
 FsJHRXQBPvBoX8Lwcn3yF2L3f7kVbODXpTUVpFsRCpfn+ULKLpgASr/A0ERPAyE=
X-Gm-Gg: ASbGncvASr4w/wvciD3iHWCP11y8dE2J1eWwaarBrc7Rw+4oLS+w1LBegFDfB9+r/BT
 h3KnqAvdWZtMVw3hRI3SsoapBck9ErBpz+eG3H/x47fgh6l/YpK7698qwKjKFvYdswBnFiZPWVx
 5Yh9XaTffrvb8r3ffVEQZMsqJLIi4qZqffU/0XV5Rcku6gme/uYY4YLb1dGYKYFglvyLPiYs60L
 HYqsjCH9cugCApwhfVgaYNjSMEsNofa5h0L4HvcdlUiAabAXbKpm3HhV9p1HdAzWG00+At2yOJD
 OPoandGTXFa5qBKd
X-Google-Smtp-Source: AGHT+IG2m2aS+oVJBZ23+b3l9D2H7VP7r4OwItXtD4WNyyXecIaAeLEkrlZC1/Vry62w9uzo9+c2cQ==
X-Received: by 2002:a05:600c:6a83:b0:436:713b:cb31 with SMTP id
 5b1f17b1804b1-4389daa4ac0mr359580535e9.3.1737984856745; 
 Mon, 27 Jan 2025 05:34:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1764c8sm10922777f8f.3.2025.01.27.05.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:34:16 -0800 (PST)
Date: Mon, 27 Jan 2025 14:34:14 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-next 6.14 merge window fixes part 1
Message-ID: <Z5eLVhmes6xfA3zu@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Operating-System: Linux phenom 6.12.11-amd64 
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

The cgroups fix is acked by Tejun. This also includes a recreated version
of your drm-next merge commit because we needed v6.13 for a regression fix, and I
didn't want to pull in a random point from the merge window. I checked to
make sure it matches exactly what you've done. Otherwise nothing special,
just the usual pile of fixes.

Also somehow the diffstat that git request-pull generates looks really
wrong, and I couldn't figure out why. Maybe because of the backmerge, but
usually that all works. I created a test merge in your tree and the
diffstat of that merge commit looks fine, so that's what I attached below.
Just a heads-up, in case there's something funny going on at your end too.

Dave should be back end of this week for the 2nd batch of merge window
fixes.

Cheers, Sima

drm-next-2025-01-27:
drm merge window fixes part 1

cgroup:
- fix Koncfig fallout from new dmem controller

Driver Changes:
- v3d NULL pointer regression fix in fence signalling race
- virtio: uaf in dma_buf free path
- xlnx: fix kerneldoc
- bochs: fix double-free on driver removal
- zynqmp: add missing locking to DP bridge driver

- amdgpu fixes all over: documentation, display, sriov, various hw block
  drivers
- amdgpu: use drm/sched helper
- amdgpu: mark some debug module options as unsafe
- amdkfd: mark some debug module options as unsafe, trap handler
  updates, fix partial migration handling

DRM core:
- client: fix fbdev Kconfig select rules, improve tiled-based display
  support

Cheers, Sima

The following changes since commit ffd294d346d185b70e28b1a28abe367bbfe53c04:

  Linux 6.13 (2025-01-19 15:51:45 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-01-27

for you to fetch changes up to 64179a1416e1420a34226ab3beb5f84710953d16:

  Merge tag 'drm-misc-next-fixes-2025-01-24' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2025-01-24 17:06:06 +0100)

----------------------------------------------------------------
drm merge window fixes part 1

cgroup:
- fix Koncfig fallout from new dmem controller

Driver Changes:
- v3d NULL pointer regression fix in fence signalling race
- virtio: uaf in dma_buf free path
- xlnx: fix kerneldoc
- bochs: fix double-free on driver removal
- zynqmp: add missing locking to DP bridge driver

- amdgpu fixes all over: documentation, display, sriov, various hw block
  drivers
- amdgpu: use drm/sched helper
- amdgpu: mark some debug module options as unsafe
- amdkfd: mark some debug module options as unsafe, trap handler
  updates, fix partial migration handling

DRM core:
- client: fix fbdev Kconfig select rules, improve tiled-based display
  support

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: cache gpu pcie link width
      drm/amdgpu: fix the PCIe lanes reporting in the INFO IOCTL
      drm/amd/display: fix CEC DC_DEBUG_MASK documentation
      drm/amd/display: fix SUBVP DC_DEBUG_MASK documentation

Aric Cyr (2):
      drm/amd/display: Add hubp cache reset when powergating
      drm/amd/display: Optimize cursor position updates

Arnd Bergmann (1):
      drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER

Aurabindo Pillai (1):
      drm/amd: Add debug option to disable subvp

Christian König (2):
      drm/amdgpu: mark a bunch of module parameters unsafe
      drm/amdgpu: always sync the GFX pipe on ctx switch

Dan Carpenter (1):
      drm: zynqmp_dp: Unlock on error in zynqmp_dp_bridge_atomic_enable()

Emily Deng (1):
      drm/amdkfd: Fix partial migrate issue

Geert Uytterhoeven (1):
      cgroup/rdma: Drop bogus PAGE_COUNTER select

Gui Chengming (1):
      drm/amdgpu: fix fw attestation for MP0_14_0_{2/3}

Jay Cornwall (2):
      drm/amdkfd: Sync trap handler binary with source
      drm/amdkfd: Clear MODE.VSKIP in gfx9 trap handler

Jesse.zhang@amd.com (3):
      revert "drm/amdgpu/pm: Implement SDMA queue reset for different asic"
      revert "drm/amdgpu/pm: add definition PPSMC_MSG_ResetSDMA2"
      drm/amd/pm: Refactor SMU 13.0.6 SDMA reset firmware version checks

Kenneth Feng (1):
      drm/amdgpu: disable gfxoff with the compute workload on gfx12

Kent Russell (1):
      drm/amdgpu: Mark debug KFD module params as unsafe

Lijo Lazar (4):
      drm/amdgpu: Add handler for SDMA context empty
      drm/amdgpu: Refine ip detection log message
      drm/amd/pm: Add capability flags for SMU v13.0.6
      drm/amd/pm: Fix smu v13.0.6 caps initialization

Lin.Cao (1):
      drm/amdgpu: fix ring timeout issue in gfx10 sr-iov environment

Maarten Lankhorst (3):
      drm/modeset: Handle tiled displays in pan_display_atomic.
      drm/client: Handle tiled displays better
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next-fixes

Mario Limonciello (1):
      drm/amd: Clarify kdoc for amdgpu.gttsize

Maíra Canal (1):
      drm/v3d: Assign job pointer to NULL before signaling the fence

Shaoyun Liu (1):
      drm/amd/amdgpu: Enable scratch data dump for mes 12

Simona Vetter (4):
      Merge v6.13 into drm-next
      Merge tag 'drm-misc-fixes-2025-01-24' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-6.14-2025-01-24' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2025-01-24' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next

Srinivasan Shanmugam (4):
      drm/amdgpu: Fix Circular Locking Dependency in AMDGPU GFX Isolation
      drm/amdgpu/gfx12: Add Cleaner Shader Support for GFX12.0 GPUs
      drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed
      drm/amd/amdgpu: Prevent null pointer dereference in GPU bandwidth calculation

Thomas Zimmermann (1):
      drm/bochs: Do not put DRM device in PCI remove callback

Tomi Valkeinen (1):
      drm: xlnx: zynqmp_dpsub: Fix kernel doc

Tvrtko Ursulin (1):
      drm/amdgpu: Use DRM scheduler API in amdgpu_xcp_release_sched

Tzung-Bi Shih (1):
      drm/amd/display: mark static functions noinline_for_stack

Vivek Kasireddy (1):
      drm/virtio: Fix UAF in virtgpu_dma_buf_free_obj()


 Documentation/gpu/zynqmp.rst                                                   |    2 -
 drivers/gpu/drm/Kconfig                                                        |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c                                     |  156 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                                        |   26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c                                         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c                                        |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h                                        |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h                                       |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c                                        |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c                                         |    8 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c                                         |   49 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c                                       |   22 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h                                 | 2391 +++++++++++++++++++++++------------------------
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm                          |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c                                       |   22 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c                              |    8 +
 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c                        |   12 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c |   12 +-
 drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c                           |   10 +-
 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c                      |    6 +-
 drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c                         |   10 +-
 drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h                         |    2 +
 drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c                         |    9 +-
 drivers/gpu/drm/amd/display/dc/hubp/dcn201/dcn201_hubp.c                       |    1 +
 drivers/gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c                         |    3 +
 drivers/gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c                         |    3 +
 drivers/gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c                         |    1 +
 drivers/gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c                         |    1 +
 drivers/gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c                         |    1 +
 drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c                       |   13 +-
 drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c                        |    2 +
 drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c                        |    2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h                                   |    2 +
 drivers/gpu/drm/amd/include/amd_pcie.h                                         |   18 +
 drivers/gpu/drm/amd/include/amd_shared.h                                       |    7 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h                   |    1 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h                                   |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h                                   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c                           |  286 ++++--
 drivers/gpu/drm/drm_client_modeset.c                                           |    9 +
 drivers/gpu/drm/drm_fb_helper.c                                                |   14 +-
 drivers/gpu/drm/tiny/bochs.c                                                   |    1 -
 drivers/gpu/drm/v3d/v3d_irq.c                                                  |   16 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c                                         |   11 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                                               |    3 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                                            |    1 +
 init/Kconfig                                                                   |    1 -
 47 files changed, 1764 insertions(+), 1415 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
