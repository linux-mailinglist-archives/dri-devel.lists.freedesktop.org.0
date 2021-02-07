Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8919931268B
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 19:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867626E1F3;
	Sun,  7 Feb 2021 18:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7F86E1F3;
 Sun,  7 Feb 2021 18:06:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m13so14510536wro.12;
 Sun, 07 Feb 2021 10:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=54n6BaQ+bXyUY9n7V2psnQU0SFJKuMhVDij/J+OY0uU=;
 b=kaQSml3XKmw/2KsxMTej5+99BzITwIojbWxDW63n9cglhIPRNjyYs+u8CeOZFDDN5d
 jl0PLCHYf/e9Y+52OaG4vMwnkBO52pUVbG7xBzEreJZ4EKyEMVno+YDLTpJfbt66vbbs
 Q18Jxl93fXXJtF/AGodJSWhzV9FTgNGvg2gveYfk5svrxyVflFTLxh1z8+Pa0jQIxdpC
 EI1oI3co1jBG/Of4FMhCcuXDJ2Vn32xdBVqSixtPf5d5xgwFZL1NWX1KycySKMFH3Yfs
 1JDqhIEshDey3pw0iyLNyyaRV3yZSjlVJxpQA1tr/CW6sACUSQzZYHpOaWVv/j1TBQ8N
 S3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=54n6BaQ+bXyUY9n7V2psnQU0SFJKuMhVDij/J+OY0uU=;
 b=SBTBh46H+5xIk0Lt7V9X6rjHaB/zBfReMMh/sygwIIjLPZekcSO7ooUFgq/HDuzANS
 0UggvzBnS1+Pl6Xw2vCfebyGpASiHQ/xb+UVIQspiIm02CZaO59aMjSTDr49kWL+12Sf
 5grXta/4/YLmSa0KzIYXjsiRdQLsyZwfAETppJFnWbgXDI9w2NysFpXGyfBbib48jWQM
 N54FPFWQQZLUUHcH7mKohd905ahbFrdm2xKSEHIPJDbVhQGq7n3jc1fr6tZliFWjvdAg
 Xa9vvsmxo/TcCSOv+eIiDSk/qFhHKqUgjkFkV858UfIWClmJng5qBWU3aRF/4bIKqEph
 ymdw==
X-Gm-Message-State: AOAM532ceHOBs6AApEpSQvxGe05Q2GduKmf0I6c7LilHMRqNJaXlaQc/
 GR4jUsVy01Kx2ziFpZj5fqHrcTUh/rKzb1D45EU=
X-Google-Smtp-Source: ABdhPJwYnsksXoMsxGMYpPJIE+kCSxQFgn0Tyr7i9QmE43Ij34+M6kWRsfnpkdQmkjVv5bOtwGlQ9HnhSgZlR3qexWI=
X-Received: by 2002:adf:f749:: with SMTP id z9mr15702978wrp.327.1612721161047; 
 Sun, 07 Feb 2021 10:06:01 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 7 Feb 2021 10:08:38 -0800
Message-ID: <CAF6AEGvh3tvLz_xtk=4x9xUfo2h2s4xkniOvC7HyLO2jrXnXkw@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.12
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

This time around:

* a6xx speedbin support
* a508, a509, a512 support
* various a5xx fixes
* various dpu fixes
* qseed3lite support for sm8250
* dsi fix for msm8994
* mdp5 fix for framerate bug with cmd mode panels
* a6xx GMU OOB race fixes that were showing up in CI
* various addition and removal of semicolons
* gem submit fix for legacy userspace relocs path

The following changes since commit 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04:

  Linux 5.11-rc5 (2021-01-24 16:47:14 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2021-02-07

for you to fetch changes up to 182b4a2d251305201b6f9cae29067f7112f05835:

  drm/msm/dp: Add a missing semi-colon (2021-02-07 09:57:04 -0800)

----------------------------------------------------------------
Akhil P Oommen (1):
      drm/msm: Add speed-bin support to a618 gpu

AngeloGioacchino Del Regno (16):
      drm/msm/a5xx: Allow all patchid for A540 chip
      drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
      drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
      drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
      drm/msm/a5xx: Reset VBIF before PC only on A510 and A530
      drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
      drm/msm/dpu: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
      drm/msm/dpu: Add prog_fetch_lines_worst_case to INTF_BLK macro
      drm/msm/dpu: Allow specifying features and sblk in DSPP_BLK macro
      drm/msm/dpu: Disable autorefresh in command mode
      drm/msm/dpu: Correctly configure vsync tearcheck for command mode
      drm/msm/dpu: Remove unused call in wait_for_commit_done
      drm/msm/dsi_pll_10nm: Fix dividing the same numbers twice
      drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits assignment
      drm/msm/dsi_pll_10nm: Fix variable usage for pll_lockdet_rate
      drm/msm/dsi_pll_10nm: Convert pr_err prints to DRM_DEV_ERROR

Bernard Zhao (1):
      drm/msm: remove unneeded variable: "rc"

Dmitry Baryshkov (1):
      drm/msm/dpu1: add support for qseed3lite used on sm8250

Eric Anholt (3):
      drm/msm: Fix race of GPU init vs timestamp power management.
      drm/msm: Fix races managing the OOB state for timestamp vs timestamps.
      drm/msm: Clean up GMU OOB set/clear handling.

Iskren Chernev (2):
      drm/msm: Fix MSM_INFO_GET_IOVA with carveout
      drm/msm/mdp5: Fix wait-for-commit for cmd panels

Jiapeng Zhong (1):
      drm/msm: remove redundant NULL check

Judy Hsiao (1):
      drm/msm/dp: trigger unplug event in msm_dp_display_disable

Konrad Dybcio (5):
      drm/msm/a5xx: Fix VPC protect value in gpu_write()
      drm/msm/a5xx: Disable flat shading optimization
      drm/msm/a5xx: Disable UCHE global filter
      drm/msm/dsi: Correct io_start for MSM8994 (20nm PHY)
      drm/msm/disp/mdp5: mdp5_cfg: Fix msm8974v2 max_clk

Kuogee Hsieh (2):
      drm/msm/dp: unplug interrupt missed after irq_hpd handler
      drm/msm/dp: reset dp controller only at boot up and pm_resume

Rob Clark (1):
      drm/msm: Fix legacy relocs path

Sai Prakash Ranjan (2):
      drm/msm: Add proper checks for GPU LLCC support
      drm/msm/a6xx: Create an A6XX GPU specific address space

Stephen Boyd (2):
      drm/msm/kms: Make a lock_class_key for each crtc mutex
      drm/msm/dp: Add a missing semi-colon

Xu Wang (2):
      drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: Remove unneeded semicolon
      drm/msm/dp/dp_ctrl: Remove unneeded semicolon

 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |   2 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              | 195 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 105 ++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  49 ++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 139 ++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  54 +++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  23 +--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  22 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  90 ++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  87 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  26 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  14 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  73 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   2 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |   7 -
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  24 +++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  15 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  24 ++-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c         |   2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c         |  21 +--
 drivers/gpu/drm/msm/msm_drv.c                      |   3 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   3 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |   2 +
 drivers/gpu/drm/msm/msm_kms.h                      |   8 +-
 36 files changed, 803 insertions(+), 219 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
