Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68301F11BF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 05:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313F56E452;
	Mon,  8 Jun 2020 03:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864EE6E452
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 03:34:03 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id mb16so16626590ejb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 20:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6XfW1mKwb87eK226dwnXsOAnQgHyjQ9PE5+w0JxGQpA=;
 b=SyfrtGrwB7bcudUCp6NbYRGFd9aZTNDDpreoldBoCMmCMOFMRKUVTodPccBCLiUX1l
 DT6GU/fqWSPQusG8Wz/tpfit1blUICkxFFAcjjX2kAhKEcYsCu23HQaiCUuGjxTOVU1q
 GYMyPDcNW26y/PvznJajjiiQ0vgxjZzrlFdcaNeYqpr0M2obacp5ctVOXi+n/++JicYi
 qw3xd444rfLPf/6EW7cBPUB65f+KJTWPI2BdgjVUEYX3zUvU9+/2I3DtWwgde3YyvdZF
 NGJf4YhdvDgOZo87AUn0dI4RJOWITBWOkqnrLRpZeB9nwFf0HZ8+M0VbvBjhB1P3TyJn
 q0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6XfW1mKwb87eK226dwnXsOAnQgHyjQ9PE5+w0JxGQpA=;
 b=ZvO7Nm3mlIYjldZs5xNG5hXFeskOYLMBdYKEvZZ65S47eHZ0c9sfV08RRZz4As1dlw
 pWA9XDJZTKshxcVAyGvItWWfuwLqTRIwXyVWZtQ5L+ZIcP/nd/zVG8ldVakCe0nE2lTU
 K6liEdwFfN25b+TZgKZOOcigERZUCKbq/0Qeg9Rj++ibs96oKhk80u1BtbaGytae+A8J
 ni4QuyFNpp6J2HsI9jDDryl9jbCLlft5Mm/A0/uiz3j0e77Gu7zyYWjRzImFB6GFnw4R
 3GY/XZRrf3NsCOkCXZGOwN75ejVbs2RSQWL8dKNaid/5bw5gRH0sKTz/vb4dK/oHnAvc
 pByg==
X-Gm-Message-State: AOAM533UVvWq5rxpJIcBwzGiSHQzq4AJaekvXRjht4UxtKe3ROAUhWeq
 dXGyMwyUw2Yas1FndDzVzKcjPS046hjnVRys5Wg=
X-Google-Smtp-Source: ABdhPJwHaUyCkXTiuvSsDZ79w04+Gy5pyHGgzmC5p1mDbrhKXCrP+dqa5JXA0hjHPgANBJE/C1JgmHGwIwlYWohrnK0=
X-Received: by 2002:a17:906:2507:: with SMTP id
 i7mr11425190ejb.419.1591587242023; 
 Sun, 07 Jun 2020 20:34:02 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 8 Jun 2020 13:33:51 +1000
Message-ID: <CAPM=9two=B8nCSP9+9x3oGM9HUm0dDk3aY=ePUuVeh6530v94Q@mail.gmail.com>
Subject: [git pull] drm msm next for 5.8-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

This should be the final feature pull for drm for rc1. This tree has
been in next for a couple of weeks, but Rob missed an arm32 build
issue, so I was awaiting the tree with a patch reverted. The tree was
also based on an 5.7-rc5 tree so I didn't want to futz around with
backmerging just for this, so I'm sending it from a topic branch based
on v5.7.

Dave.

drm-next-msm-5.8-2020-06-08:
drm msm next for 5.8-rc1

* new gpu support: a405, a640, a650
* dpu: color processing support
* mdp5: support for msm8x36 (the thing with a405)
* some prep work for per-context pagetables (ie the part that
  does not depend on in-flight iommu patches)
* last but not least, UABI update for submit ioctl to support
  syncobj (from Bas)
The following changes since commit 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162:

  Linux 5.7 (2020-05-31 16:49:15 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/drm-next-msm-5.8-2020-06-08

for you to fetch changes up to efe792f39ddbc6396b9142afff97855ee357b492:

  Merge https://gitlab.freedesktop.org/drm/msm into drm-next-msm-5.8
(2020-06-08 13:22:57 +1000)

----------------------------------------------------------------
drm msm next for 5.8-rc1

* new gpu support: a405, a640, a650
* dpu: color processing support
* mdp5: support for msm8x36 (the thing with a405)
* some prep work for per-context pagetables (ie the part that
  does not depend on in-flight iommu patches)
* last but not least, UABI update for submit ioctl to support
  syncobj (from Bas)

----------------------------------------------------------------
Bas Nieuwenhuizen (1):
      drm/msm: Add syncobj support.

Bjorn Andersson (1):
      drm/msm: Fix undefined "rd_full" link error

Christophe JAILLET (2):
      drm/msm/a6xx: Fix a typo in an error message
      drm/msm: Fix typo

Dave Airlie (1):
      Merge https://gitlab.freedesktop.org/drm/msm into drm-next-msm-5.8

Hongbo Yao (1):
      drm/msm/dpu: Fix compile warnings

Jonathan Marek (10):
      drm/msm: add msm_gem_get_and_pin_iova_range
      drm/msm: add internal MSM_BO_MAP_PRIV flag
      drm/msm/a6xx: use msm_gem for GMU memory objects
      drm/msm/a6xx: add A640/A650 to gpulist
      drm/msm/a6xx: HFI v2 for A640 and A650
      drm/msm/a6xx: A640/A650 GMU firmware path
      drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650
      drm/msm/a6xx: enable GMU log
      drm/msm/a6xx: update a6xx_hw_init for A640 and A650
      drm/msm/a6xx: skip HFI set freq if GMU is powered down

Jordan Crouse (4):
      drm/msm: Check for powered down HW in the devfreq callbacks
      drm/msm: Attach the IOMMU device during initialization
      drm/msm: Refactor address space initialization
      drm/msm: Update the MMU helper function APIs

Kalyan Thota (3):
      drm/msm/dpu: add support for color processing blocks in dpu driver
      drm/msm/dpu: add support for pcc color block in dpu driver
      drm/msm/dpu: add support for clk and bw scaling for display

Konrad Dybcio (1):
      drm/msm/mdp5: Add MDP5 configuration for MSM8x36.

Krishna Manikandan (1):
      drm/msm/dpu: update bandwidth threshold check

Rob Clark (1):
      Revert "drm/msm/dpu: add support for clk and bw scaling for display"

Roy Spliet (1):
      drm/msm/mdp5: Fix mdp5_init error path for failed mdp5_kms allocation

Shawn Guo (2):
      drm/msm/a4xx: add adreno a405 support
      drm/msm/a4xx: add a405_registers for a405 device

kbuild test robot (2):
      drm/msm/a6xx: a6xx_hfi_send_start() can be static
      drm/msm/dpu: dpu_setup_dspp_pcc() can be static

 drivers/gpu/drm/msm/Makefile                   |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c          |  16 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c          |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c          |  83 ++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c          |   7 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h          |  14 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c          | 418 +++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h          |  37 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h      |  48 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c          |  70 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c          | 123 +++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h          |  50 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c     |  35 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  27 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h        |  23 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  95 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  48 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  39 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |  26 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 129 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 100 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  58 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |   2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c       |  18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c       |  80 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c      |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c       |  21 +-
 drivers/gpu/drm/msm/msm_drv.c                  |   6 +-
 drivers/gpu/drm/msm/msm_drv.h                  |  15 +-
 drivers/gpu/drm/msm/msm_gem.c                  |  31 +-
 drivers/gpu/drm/msm/msm_gem.h                  |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c           | 232 +++++++++++++-
 drivers/gpu/drm/msm/msm_gem_vma.c              |  42 +--
 drivers/gpu/drm/msm/msm_gpu.c                  |  49 +--
 drivers/gpu/drm/msm/msm_gpu.h                  |   4 +-
 drivers/gpu/drm/msm/msm_gpummu.c               |  10 +-
 drivers/gpu/drm/msm/msm_iommu.c                |  22 +-
 drivers/gpu/drm/msm/msm_mmu.h                  |   5 +-
 drivers/gpu/drm/msm/msm_rd.c                   |   4 +-
 include/uapi/drm/msm_drm.h                     |  24 +-
 47 files changed, 1697 insertions(+), 382 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
