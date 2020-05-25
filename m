Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66B11E152B
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 22:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEF189BF6;
	Mon, 25 May 2020 20:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4CB89BF6;
 Mon, 25 May 2020 20:20:15 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id s21so21626615ejd.2;
 Mon, 25 May 2020 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=PoIaK/pV9OVJlJWu+gk2RvaOMk7FYxWYIk7W+GWUZIc=;
 b=BlG1u/53E0k/cxphrEAEQh0jv/4wUw0rI7aAQNCNBebgaqk3MrjPRWLFP9lwzuti9w
 Y6lDJCz9LgYXAMXh6Ep9cpUsIGOflEQmYJHurd7xrwX7Fj8aiIpWAdsjXcYO5cA0O8i3
 TI/zsA0kdTtFXiLUZLkmLdPuMG/F0zfYwevXcyuF3hmrnLCiRPV/Q8D++vsltvRRjEb6
 AISfw9OPo3BQqf9izNvJo5e9E2hLRPvgNPyGXK7ZPkMeH/QRwHTmMk/PcrOGqZpWS3ig
 I0pQphUtnyIEwduqcTyOKT/MbQwnT9ub65zoIKHy1mmKTb0fJxZ9BK2fcU4LhiGnn1rM
 dCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=PoIaK/pV9OVJlJWu+gk2RvaOMk7FYxWYIk7W+GWUZIc=;
 b=RrLDxCdUUaPIoj0UDLJgOXd57ukBYjKNwb5qROGbTUJmbfrl3Dvr8tkepI/OlI5J6H
 NMjOf5AZg0kIZQAwk3FAvYqsyxPjQCyHdyllbKXD9eE6Aqdl/tFjQ2TuNjIalI6myGoy
 zWj8rQgjxCiixEDfgH+ZGNhLTS8ql/6zaSWVUjPu7FaJ13UXR1JKYbWDEBTI+uua/i+R
 h/GmC6coZT7k+C+vrhbShGPvZQX2A7tjIrbwLOcUD8NqlY6SsoXZBJNzXVYXgxFo969o
 7hdxIWdr4saypC+/qAra6AliIQWTHwqNvXs+e7UAzsuQduoGLB2J5PmtJI1BOWGEOHNR
 rG5w==
X-Gm-Message-State: AOAM531HQEowrdFtAiu8rSABeHEs6clcxdC0BNti9dHIZPN9HsF6HqnU
 8eJwKDEmxo8MTHo0FW4x0y230EjVD6oKRKeIAD0=
X-Google-Smtp-Source: ABdhPJzGBBplhgkLgweqOx2JdMhGzZRkrpe9//0ny+sPB1V0GdFyUBsf7L+dELYRTCsUuX8afEdERCn9Oq85bxMBWk8=
X-Received: by 2002:a17:906:3a11:: with SMTP id
 z17mr20807986eje.460.1590438013845; 
 Mon, 25 May 2020 13:20:13 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 25 May 2020 13:20:36 -0700
Message-ID: <CAF6AEGuBodxXBcEZOU+bSBmxRmVx+JHVkFnt+R8sNn3dGafnpg@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.8
To: Dave Airlie <airlied@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Not too huge this time around, but a bunch of interesting new
stuff:

 * new gpu support: a405, a640, a650
 * dpu: clock and bandwidth scaling
 * dpu: color processing support
 * mdp5: support for msm8x36 (the thing with a405)
 * some prep work for per-context pagetables (ie the part that
   does not depend on in-flight iommu patches)
 * last but not least, UABI update for submit ioctl to support
   syncobj (from Bas)

The UABI change has been on-list and reviewed for a while now.
The only reason I didn't pull it in last cycle was that I ran
out of time to review it myself at the time.  But I'm happy
with it.  The MR for mesa (vulkan/turnip) support is here:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2769


The following changes since commit 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8:

  Linux 5.7-rc5 (2020-05-10 15:16:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2020-05-25

for you to fetch changes up to d9e19d7966a31ae70edfe0cb7cb044e20343a0c9:

  drm/msm/a6xx: skip HFI set freq if GMU is powered down (2020-05-23
13:38:16 -0700)

----------------------------------------------------------------
Bas Nieuwenhuizen (1):
      drm/msm: Add syncobj support.

Bjorn Andersson (1):
      drm/msm: Fix undefined "rd_full" link error

Christophe JAILLET (2):
      drm/msm/a6xx: Fix a typo in an error message
      drm/msm: Fix typo

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  | 125 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  95 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  53 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  43 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |  26 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 129 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 100 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  55 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c       |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  82 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   4 +
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
 50 files changed, 1923 insertions(+), 403 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
