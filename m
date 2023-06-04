Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C157219C3
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3DC10E0CC;
	Sun,  4 Jun 2023 20:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462D710E0CD
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f5021faa16so5075085e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910934; x=1688502934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ypl4i2KG/p31Wh9Yo8dE/0AhcoBByLO3ViH5R2zIzI=;
 b=Ic/W8zvMs9v9kCqyHDDrchWJKIh3KkAF/5BX4fLAO2BjRrZ1C9CxqkHja1Mh9EsZKB
 ClxFkJFYAyrifTpJg7UZ7XY+S7SEZpo0VlXEu4FvrZYOldh98iReEwg2UwB7xtRGl/5f
 9iADtN5tPAu1vwvj1B5QzIdnnEYE662YKRR76iEh2bgMQTI1BD/AINoci59+zs31L+D3
 5M/g6MYvBO2PZCxJTph3EV7sWrO+icu223DQBMOF2I39fJa6JzGpm9NppjPFU80EfnkE
 bdlP8/vdckN/dNSqx4DVt4aoLUIzBXoTsmlqbtOn6PlwDjT3r3IRhfmaIrV8kdfYgYkz
 15Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910934; x=1688502934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ypl4i2KG/p31Wh9Yo8dE/0AhcoBByLO3ViH5R2zIzI=;
 b=W+G3h+0VU0IRh7GrC9PTHUpcWh1XkEjpf8ejnkgSwB+IbdfGuQ2hStUNeMWmqHfV7g
 fq3uvoMZSA0djHb4NoXcwHpR5ckW37wsWuYEi1re/q9AdKfbNEszds8dtb8TdK45i+s+
 NQCcIBewQTPrAkx4XLwPgc1afJKoqu5UlA8aFDZeCCq9LrPoK8G8rmcGKaNHNTeLtf0Y
 baanPkbujyUnk8F8gZQmZyhuwB2XtJY7bHRDOx8ZWvxS5AgZGOsA+ysnr1OD8mp16aFh
 pjVvGMNtevbs6dk8gAd8bit6ZDv90XwZAQBb9n1cN3h1Sc4x5rxOBXhCdOyFYLID+NX/
 PAvg==
X-Gm-Message-State: AC+VfDyzb4xmIkA6pf8+IskqbzXNnRettk+gefLUeczhYDhresMyeKVK
 q0rzd8Qcdn8av0S6zvRUKzWWww==
X-Google-Smtp-Source: ACHHUZ4rES9qkxHO0G/LplW9cAUf8KhUTYlN5iFkSWMA0tlMO4SMEmXFknvBcIJufCSDHKkjQbnL7Q==
X-Received: by 2002:ac2:4d1b:0:b0:4f5:1ac9:ab1b with SMTP id
 r27-20020ac24d1b000000b004f51ac9ab1bmr3822484lfi.23.1685910934443; 
 Sun, 04 Jun 2023 13:35:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 00/22] drm/msm/dpu: another catalog rework
Date: Sun,  4 Jun 2023 23:35:10 +0300
Message-Id: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having a macro with 10 arguments doesn't seem like a good idea. It makes
it inherently harder to compare the actual structure values. Also this
leads to adding macros covering varieties of the block.

As it was previously discussed, inline all foo_BLK macros in order to
ease performing changes to the catalog data.

Major part of the conversion was performed using vim script found at
[1]. Then some manual cleanups were applied, like dropping fields set to
0.

Dependencies: [2].

[1] https://pastebin.ubuntu.com/p/mQRhBRXTJs/
[2] https://patchwork.freedesktop.org/series/118836/

Dmitry Baryshkov (22):
  drm/msm/dpu: correct MERGE_3D length
  drm/msm/dpu: remove unused INTF_NONE interfaces
  drm/msm: enumerate DSI interfaces
  drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
  drm/msm/dpu: simplify peer LM handling
  drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
  drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
  drm/msm/dpu: expand .clk_ctrls definitions
  drm/msm/dpu: drop zero features from dpu_ctl_cfg data
  drm/msm/dpu: correct indentation for CTL definitions
  drm/msm/dpu: drop zero features from dpu_mdp_cfg data
  drm/msm/dpu: inline SSPP_BLK macros
  drm/msm/dpu: inline DSPP_BLK macros
  drm/msm/dpu: inline LM_BLK macros
  drm/msm/dpu: inline DSC_BLK macros
  drm/msm/dpu: inline MERGE_3D_BLK macros
  drm/msm/dpu: inline various PP_BLK_* macros
  drm/msm/dpu: inline WB_BLK macros
  drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
  drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
  drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
  drm/msm/dpu: move DPU_PINGPONG_DSC to PINGPONG_SDM845_MASK

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 321 +++++++++----
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 320 +++++++++----
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 410 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 448 ++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 429 ++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 177 +++++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  87 ++--
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  87 ++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 389 +++++++++++----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 224 ++++++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 449 +++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 415 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 439 ++++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 134 +-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
 21 files changed, 3109 insertions(+), 1315 deletions(-)

-- 
2.39.2

