Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C004607ED
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 18:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521726E0B6;
	Sun, 28 Nov 2021 17:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A866E0B6;
 Sun, 28 Nov 2021 17:14:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso14927703wmr.4; 
 Sun, 28 Nov 2021 09:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SDo6kRceja4bdqr/aJr2wU4CsUC6M9nZSYXWVouzbwE=;
 b=F/NmXpX3uv7MWq9O5UxSiaH/JBFcZLGL4OH6YgnkfbhUp4SipPdMcYmZRzDlCdminC
 xlSF6DiMKMdG63+cL6np+Oth1It/B2z8Ofqb5Fp3QNUcgxHNZ+oh0LUHVpkkAZeDgS0w
 HttH36osJfgL30ItwP1IhCah+OUHLPraKakntibxJ5Vv0EPpWr/pPCIr+E7tttOfjcAT
 Nyp/iXqTJRJzELYfmWZUEi0+rLrpxUut8xdh6hD09Pi8IhMgXie/Sv4ut3s8IEVnaAH2
 LU7YGpe9Ax4oc69ywd97K1UeKOVYO/gX/DTDIF4vvhXV9ciPnj1ocS2lyybLeTqnBYZz
 +xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SDo6kRceja4bdqr/aJr2wU4CsUC6M9nZSYXWVouzbwE=;
 b=hkM7ALtc0BDh6FMDm9CEU2ygHgK0dJf01twS1aXg4DtEoDa0CX/e5uleBbZwsGFxV9
 0zriV9agfATmnHOS3dPJGe4792bWJ8V7HM7EQUPSTpZB1XaPaVTdNzS5IBdgrCjZQT3b
 ECQyP/NX7CvNf4K/tCRuTdkFRgoG+wk0xwzDy2UQsdhh/279j4fgNjhWgtqDjS1vgEQp
 OAMkw+vtqn8h/tPmRhZXlmpsNq1KbguFhTiaKpT0uBZyPoiHr6ZQMfvv/lLB+x1UepiT
 5B6+vkjz63nOfn2orILXnRqgvWhwMqP6L6ALQH1ZY5ucIcVzJ7lfYXOTUSBw8HMzTN5Z
 CBoQ==
X-Gm-Message-State: AOAM530wFcTWN9geP6itqBJXTynJBELAGNKXt/01suaaBTrbpOWmMIax
 Qw/7VcxzgzE+joL1Hs7dLwsqD1MuI4STbdrYU5Y=
X-Google-Smtp-Source: ABdhPJxaaZtHilcyBMs1TRuEdRW9798Kp2P7IZq1VCjZ9JEIdYP52GYC8OD+scy4zDM9DZxJd0GASFByQbXg6ciEzcU=
X-Received: by 2002:a1c:790d:: with SMTP id l13mr31744121wme.101.1638119662245; 
 Sun, 28 Nov 2021 09:14:22 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 28 Nov 2021 09:19:34 -0800
Message-ID: <CAF6AEGsV-ntO_u323XMKuD6bgbgvXporwi1sbyXwNDAuA52Afw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-11-28 for v5.16
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

A few fixes for v5.16.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-11-28

for you to fetch changes up to afece15a68dc83b438cc4c3a64634e48a5735573:

  drm: msm: fix building without CONFIG_COMMON_CLK (2021-11-26 08:58:57 -0800)

----------------------------------------------------------------
Akhil P Oommen (2):
      drm/msm: Fix null ptr access msm_ioctl_gem_submit()
      drm/msm/a6xx: Fix uinitialized use of gpu_scid

Arnd Bergmann (1):
      drm: msm: fix building without CONFIG_COMMON_CLK

Douglas Anderson (3):
      drm/msm/a6xx: Allocate enough space for GMU registers
      drm/msm: Fix mmap to include VM_IO and VM_DONTDUMP
      drm/msm/dp: Avoid unpowered AUX xfers that caused crashes

Philip Chen (1):
      drm/msm/dsi: set default num_data_lanes

Rob Clark (8):
      drm/msm/devfreq: Fix OPP refcnt leak
      drm/msm: Fix wait_fence submitqueue leak
      drm/msm: Restore error return on invalid fence
      drm/msm: Make a6xx_gpu_set_freq() static
      drm/msm: Demote debug message
      drm/msm/gpu: Fix idle_work time
      drm/msm/gpu: Fix check for devices without devfreq
      drm/msm: Do hw_init() before capturing GPU state

 drivers/gpu/drm/msm/Kconfig                 |  2 +-
 drivers/gpu/drm/msm/Makefile                |  6 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 20 ++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  4 +--
 drivers/gpu/drm/msm/dp/dp_aux.c             | 17 ++++++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c          |  2 ++
 drivers/gpu/drm/msm/msm_debugfs.c           |  1 +
 drivers/gpu/drm/msm/msm_drv.c               | 49 +++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.c               |  5 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c        |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h               |  3 ++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 13 +++++---
 12 files changed, 84 insertions(+), 40 deletions(-)
