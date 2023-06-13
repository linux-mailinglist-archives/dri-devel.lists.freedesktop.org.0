Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E372D566
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1439010E2E1;
	Tue, 13 Jun 2023 00:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E3610E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f658a17aa4so5034378e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615006; x=1689207006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3U48DhxE6jBvffVdT6/UwCqMtwTlpmQ4IYEd/FwXhNY=;
 b=NWLUY+X0FcB+QizAYU7rBJvAaB2kbU8MKmNmOLWmqCJ32a70gTqJB9qVhTMqENuMTB
 fBWT28m2QasBgtRtp5gF4+cYHdYs5uPvjo81dRTUXrsszkIVViLChwYqIG9I/sJsT0wj
 6KI9pro7F+mATSG+guiQArgaBJaADhGU4+kulvIS+Dc/0VUvkYQpy+OjnCKlAuej64Q0
 I9yL8SK4Qbe9NmdVK2hK7nLzw6YSUVJnHigGUKx4ddbXRa5FRA9R8cq9nknodjNPDBEj
 e9J/p+dZWKOelF7gR0zLvUX5NLqYUUmtYqKvRyhDBp2IpJxd+uXRDD5iDFS/bs20e+HB
 JJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615006; x=1689207006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3U48DhxE6jBvffVdT6/UwCqMtwTlpmQ4IYEd/FwXhNY=;
 b=IG4o+MaXDbcP/GYZc2OVYXdhJSzxtid/0l6Fele4ghYX/z61jZTdBaINA2ZoeGWsYw
 IwAS/Sg2FApxLDyIgi8TeHbypeA3ynEVyOUoGAWT5lbzhWYHf5gJxNa0s4mOUEasIdfo
 n01x7gOQsyqcRgipydVq+NRCmHeiVu4/rqMkTXqSEds0JeKpzkCC6AFyo9rQrfi+CQbV
 cWuSclgPWpoKuMrEdEjzJtbQn7i18RTIKleR//5bz6fp3iLi/Qyld3kI7swj1y03OYSB
 6fPzDnkSZm+GwEdw6D5/YZuVbIQ0RUXGceuV/RDhYadr2uoXqL6a7ZZD1XYTVRuCR3YJ
 h3Zg==
X-Gm-Message-State: AC+VfDwEPZ3Q9JI3QSIavkr4pyVw66JtUbA0SR3nAn+fJw9jCUQz5mDh
 tu0AbYsdXcIL6s7MNuukI4kSSg==
X-Google-Smtp-Source: ACHHUZ5dvyR/4ylEyIG9bPyNHMs5XB37dBz8Ip0UCLQ6VNUJYoNZH8XgS/LaEfOJFvrOXFr8DPJkkQ==
X-Received: by 2002:a19:5f5a:0:b0:4f6:2f97:7f8b with SMTP id
 a26-20020a195f5a000000b004f62f977f8bmr5186243lfj.1.1686615005809; 
 Mon, 12 Jun 2023 17:10:05 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 00/22]drm/msm/dpu: another catalog rework
Date: Tue, 13 Jun 2023 03:09:39 +0300
Message-Id: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
 - Rebased on top of msm-next
 - Dropped dependency on interrupt rework

[1] https://pastebin.ubuntu.com/p/26cdW5VpYB/
[2] https://patchwork.freedesktop.org/patch/542142/?series=119220&rev=1

Dmitry Baryshkov (22):
  drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
  drm/msm/dpu: correct MERGE_3D length
  drm/msm/dpu: remove unused INTF_NONE interfaces
  drm/msm: enumerate DSI interfaces
  drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
  drm/msm/dpu: simplify peer LM handling
  drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
  drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
  drm/msm/dpu: expand .clk_ctrls definitions
  drm/msm/dpu: drop zero features from dpu_mdp_cfg data
  drm/msm/dpu: drop zero features from dpu_ctl_cfg data
  drm/msm/dpu: correct indentation for CTL definitions
  drm/msm/dpu: inline SSPP_BLK macros
  drm/msm/dpu: inline DSPP_BLK macros
  drm/msm/dpu: inline LM_BLK macros
  drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
  drm/msm/dpu: inline MERGE_3D_BLK macros
  drm/msm/dpu: inline various PP_BLK_* macros
  drm/msm/dpu: inline WB_BLK macros
  drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
  drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
  drm/msm/dpu: drop empty features mask INTF_SDM845_MASK

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 329 ++++++++----
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 348 +++++++++----
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 411 ++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 448 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 430 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 180 +++++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  89 +++-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    | 188 ++++---
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  89 +++-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  96 ++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 418 ++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 236 ++++++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 484 +++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 445 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 467 ++++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 130 -----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
 23 files changed, 3320 insertions(+), 1563 deletions(-)

-- 
2.39.2

