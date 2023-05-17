Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3629706DD1
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76C310E465;
	Wed, 17 May 2023 16:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA3B10E450;
 Wed, 17 May 2023 16:16:19 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6ac8ede63ccso739706a34.2; 
 Wed, 17 May 2023 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684340179; x=1686932179;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XZoSas/Przcs6p2bBcZX+px+j9fsVB4dTbNSWQWc0gM=;
 b=CSD9rb3RghhBOnBe50y2BKYHM9K6hfddhHQbYhizS+xMh/5QUbOY66LfK1WwM3sgP4
 LyVf8q++kwhx5cyM850PUjrr6yANT8Sjk1McfCjmCLNcX4WoG83UehGZ2TsC6MIyLjQQ
 /MDZhf4OTbU8kk9yIUeDv1b09bANDAkqtvGi+R3y8jtEjtDkYnlQKYvGYi1y14Es7/G3
 mPri6hqFGHvaxz3GDLYCLAtyQvb8Le2gi1EiY9lFSr2bNT35h0667BkePgXl8dYlY4nd
 xSkA3BvXDqeOmYrujltk/v/SAyUu5A/pHWL9jGMl+RGK/n3i/e8ENYPJgJekey27XTL7
 QKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684340179; x=1686932179;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XZoSas/Przcs6p2bBcZX+px+j9fsVB4dTbNSWQWc0gM=;
 b=M6YARkIAN28b+iWdFlkvTCvHX9VdGCsqagFaK1yVh8SBStzPX/2XzalPwmQZXah/2l
 DCFSX5BZhPOQMGMM+90MYz4NaR5OK6W115sOjz+OXN7ADuIJ46Ww79ZwRY6epg4YfbDz
 m/PtQ51v2DKNCkaXeubbwKE9Fr8vKFrEIraHadEAPC3GggQ+zXeOOUjBbzfPUu6xbKeh
 HcaHCqIeb1Y5bma+Ar+ckVq2iVoH/tRYTrM64itWhbEqwTR+RXYAiOZgM+XfI4n7K4Ds
 7WAo/yY6W1ihndGd+m4+IcaHHJnByGV2DLILgOiHqhrkXuGBJRoC3813hK1yYJpfZjN6
 ZiZA==
X-Gm-Message-State: AC+VfDzmeABSXs/kg35fYBimI/+03FFkJBAAtuYKaQNQEBEMJFscyjHi
 HNTGQ9/MGFb5Mcem5YnYbK7uL3qTB1TAapmraro=
X-Google-Smtp-Source: ACHHUZ6MqyaoeR7pvm4ubf0HguB8gkwiyMGZ6wqyCRvqrdP6G4SyxLoDLD6K+GrgQ0vukkN1qXg9wODFwiPyHSa2SjA=
X-Received: by 2002:aca:190d:0:b0:394:2815:5b37 with SMTP id
 l13-20020aca190d000000b0039428155b37mr12162932oii.30.1684340178871; Wed, 17
 May 2023 09:16:18 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 May 2023 09:16:07 -0700
Message-ID: <CAF6AEGvHEcJfp=k6qatmb_SvAeyvy3CBpaPfwLqtNthuEzA_7w@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-05-17 for v6.4-rc3
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

Hi Dave,

A few fixes for v6.4, summary below.  One arm-smmu-qcom fix to
un-break GPU per-process page-tables which was broken by a small
refactor in arm-smmu-qcom.  (Also added some WARN()s to make this sort
of breakage more obvious in the future.)

The following changes since commit ac7e7c9c65ecfb1fcc99de91cfd6b17a8d4cb9c1:

  drm/msm/dpu: drop unused macros from hw catalog (2023-04-07 03:54:50 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-05-17

for you to fetch changes up to 5c054db54c43a5fcb5cc81012361f5e3fac37637:

  drm/msm: Be more shouty if per-process pgtables aren't working
(2023-05-17 08:53:47 -0700)

----------------------------------------------------------------
msm-fixes for v6.4-rc3

Display Fixes:

+ Catalog fixes:
 - fix the programmable fetch lines and qos settings of msm8998
   to match what is present downstream
 - fix the LM pairs for msm8998 to match what is present downstream.
   The current settings are not right as LMs with incompatible
   connected blocks are paired
 - remove unused INTF0 interrupt mask from SM6115/QCM2290 as there
   is no INTF0 present on those chipsets. There is only one DSI on
   index 1
 - remove TE2 block from relevant chipsets because this is mainly
   used for ping-pong split feature which is not supported upstream
   and also for the chipsets where we are removing them in this
   change, that block is not present as the tear check has been moved
   to the intf block
 - relocate non-MDP_TOP INTF_INTR offsets from dpu_hwio.h to
   dpu_hw_interrupts.c to match where they belong
 - fix the indentation for REV_7xxx interrupt masks
 - fix the offset and version for dither blocks of SM8[34]50/SC8280XP
   chipsets as it was incorrect
 - make the ping-pong blk length 0 for appropriate chipsets as those
   chipsets only have a dither ping-pong dither block but no other
   functionality in the base ping-pong
 - remove some duplicate register defines from INTF
+ Fix the log mask for the writeback block so that it can be enabled
  correctly via debugfs
+ unregister the hdmi codec for dp during unbind otherwise it leaks
  audio codec devices
+ Yaml change to fix warnings related to 'qcom,master-dsi' and
  'qcom,sync-dual-dsi'

GPU Fixes:

+ fix submit error path leak
+ arm-smmu-qcom fix for regression that broke per-process page tables
+ fix no-iommu crash

----------------------------------------------------------------
Arnaud Vrac (2):
      drm/msm/dpu: tweak msm8998 hw catalog values
      drm/msm/dpu: tweak lm pairings in msm8998 hw catalog

Jianhua Lu (1):
      dt-bindings: display/msm: dsi-controller-main: Document qcom,
master-dsi and qcom, sync-dual-dsi

Luca Weiss (1):
      drm/msm/iommu: Fix null pointer dereference in no-IOMMU case

Marijn Suijten (9):
      drm/msm/dpu: Assign missing writeback log_mask
      drm/msm/dpu: Remove unused INTF0 interrupt mask from SM6115/QCM2290
      drm/msm/dpu: Remove TE2 block and feature from DPU >= 5.0.0 hardware
      drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets out of hwio header
      drm/msm/dpu: Reindent REV_7xxx interrupt masks with tabs
      drm/msm/dpu: Fix PP_BLK_DIPHER -> DITHER typo
      drm/msm/dpu: Use V2 DITHER PINGPONG sub-block in SM8[34]50/SC8280XP
      drm/msm/dpu: Set PINGPONG block length to zero for DPU >= 7.0.0
      drm/msm/dpu: Remove duplicate register defines from INTF

Rob Clark (5):
      drm/msm/atomic: Don't try async if crtc not active
      drm/msm: Fix vmap madv warning
      drm/msm: Fix submit error-path leaks
      iommu/arm-smmu-qcom: Fix missing adreno_smmu's
      drm/msm: Be more shouty if per-process pgtables aren't working

Srinivas Kandagatla (1):
      drm/msm/dp: unregister audio driver during unbind

 .../bindings/display/msm/dsi-controller-main.yaml  | 12 +++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 16 +++++++-------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  4 ++--
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 12 +++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  8 +++----
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 24 ++++++++++-----------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 16 +++++++-------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 +++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 17 ++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 23 +++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |  3 ---
 drivers/gpu/drm/msm/dp/dp_audio.c                  | 12 +++++++++++
 drivers/gpu/drm/msm/dp/dp_audio.h                  |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c                |  1 +
 drivers/gpu/drm/msm/msm_atomic.c                   |  2 ++
 drivers/gpu/drm/msm/msm_gem.c                      | 22 +++++++------------
 drivers/gpu/drm/msm/msm_gem_submit.c               | 25 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_iommu.c                    |  9 ++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 10 +++++++++
 26 files changed, 146 insertions(+), 108 deletions(-)
