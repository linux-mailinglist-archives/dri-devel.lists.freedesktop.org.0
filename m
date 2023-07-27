Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C2765661
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEFB10E59E;
	Thu, 27 Jul 2023 14:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1988210E59E;
 Thu, 27 Jul 2023 14:49:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe1a35a135so1033570e87.1; 
 Thu, 27 Jul 2023 07:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690469347; x=1691074147;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xHyCXN5dCS9uiL6OSLtxb2pFZ7IiVBAlq0dF7GmTCCs=;
 b=T3VEn+O2ac1TK9dZd9ZNMqbc1ksQ8rw48j7ldx7XcwXEDYDVCVXV0UYoZK7xJCpC2I
 GDeEE16YvFq+l+wA4N5PhdjvnVgTQ+T3f71BYJi2e6jBcfOCyTNSyDsXp7Irap2owfvn
 +LYBURrX2eOEO9ZDVFWtpnTLKtWU9OgSu5/h1Dw333vw3zaasIz56gbhL+hMDlztcM/p
 NOr7rIEEQZoVmrkE/646nGs3CvZ17tiy2a8TOLHJug35TvFZT32jqMPW9f1nFJtkwoVq
 +YZ3C9aS+qlh3ICWYbQCf7SZjVYgrs/o0zgBIU1KwPTwgTVx0E0e64y5avOcduvHb3OS
 xp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469347; x=1691074147;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xHyCXN5dCS9uiL6OSLtxb2pFZ7IiVBAlq0dF7GmTCCs=;
 b=WWkBhJwOM+qb3DlgYLSuuPjHvuy3H0sCEsOk4Bbut0nqkhXAHVyzG5YYYM6v3LHk7H
 nN9qWYN7/CH3kW/cRuvdKs6bD11x0CqyTzGnkBmbhrJ5xYeZKeOUykYu5CvRbS2MdBxJ
 jX4xIcwBwyegvhs6iIjP5Dkyd35wraJlCRMdAWk/szUnN1Feb62ALH4WfzoRTEMNGmwq
 qacI8WajRRHcyNwnkf471pZjkTbRFpuPevNH6tolpfH/ZRpNeouOCAWSEoE1zPwFHgdw
 17BJZ0irMQ/Hn+THr85IzL6yP876kYGRxJE23MsrVc1rP7TM869F/oGJC8mUirdE2oyI
 jWpA==
X-Gm-Message-State: ABy/qLbGKYZy2gIVji6NnDGMAJ1G7iNuwJTXksJOATyCMKjTUIZsGvrY
 7SCV/oxg4Xwmd6K8n9abxF7xS0UppsGfEnJ4kXk=
X-Google-Smtp-Source: APBJJlGNZUApsSG28hLuM3AnA2b2od7aR+h8M12NVIfGICgoYNvzQK1uAAOo/8W3U59nkz2g9vWX5hm6aTftVAZpZ7w=
X-Received: by 2002:a05:6512:108a:b0:4fe:819:b0ed with SMTP id
 j10-20020a056512108a00b004fe0819b0edmr2131701lfg.46.1690469346942; Thu, 27
 Jul 2023 07:49:06 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Jul 2023 07:48:54 -0700
Message-ID: <CAF6AEGs9MwCSfiyv8i7yWAsJKYEzCDyzaTx=ujX80Y23rZd9RA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-07-27 for v6.5-rc4
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following changes since commit cd036d542afb82adfbbd43c5dbeb7010e8e91ee7:

  drm/msm/a6xx: Add A610 speedbin support (2023-06-18 11:35:27 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-07-27

for you to fetch changes up to 1b5d0ddcb34a605835051ae2950d5cfed0373dd8:

  drm/msm: Disallow submit with fence id 0 (2023-07-26 10:50:04 -0700)

----------------------------------------------------------------
Fixes for v6.5-rc4

Display:
+ Fix to correct the UBWC programming for decoder version 4.3 seen
  on SM8550
+ Add the missing flush and fetch bits for DMA4 and DMA5 SSPPs.
+ Fix to drop the unused dpu_core_perf_data_bus_id enum from the code
+ Drop the unused dsi_phy_14nm_17mA_regulators from QCM 2290 DSI cfg.

GPU:
+ Fix warn splat for newer devices without revn
+ Remove name/revn for a690.. we shouldn't be populating these for
  newer devices, for consistency, but it slipped through review
+ Fix a6xx gpu snapshot BINDLESS_DATA size (was listed in bytes
  instead of dwords, causing AHB faults on a6xx gen4/a660-family)
+ Disallow submit with fence id 0

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/mdss: correct UBWC programming for SM8550
      drm/msm/dpu: drop enum dpu_core_perf_data_bus_id

Gaosheng Cui (1):
      drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()

Jonathan Marek (1):
      drm/msm/dpu: add missing flush and fetch bits for DMA4/DMA5 planes

Marijn Suijten (1):
      drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config

Rob Clark (5):
      drm/msm/adreno: Fix warn splat for devices without revn
      drm/msm/a690: Remove revn and name
      drm/msm/adreno: Fix snapshot BINDLESS_DATA size
      drm/msm: Fix hw_fence error path cleanup
      drm/msm: Disallow submit with fence id 0

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 12 ++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 13 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  8 +++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  2 --
 drivers/gpu/drm/msm/msm_fence.c               |  6 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c          | 16 ++++++++++++++--
 drivers/gpu/drm/msm/msm_mdss.c                | 19 +++++++++++++++++--
 10 files changed, 54 insertions(+), 28 deletions(-)
