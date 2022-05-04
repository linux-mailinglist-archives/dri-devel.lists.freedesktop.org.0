Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80351ADD2
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 21:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8D810ED1F;
	Wed,  4 May 2022 19:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA3F10ED1F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 19:33:17 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y32so4062510lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHYwQFAJmnErQZCKQJLUVtyEs4pscZoMMUhpkcqKYYM=;
 b=ruHB31Y5G/kQ2KevdpivuWXbJaJwj7plgUBubNjE2VewX9g1xk6hQh78xwHb7tlLM8
 j45bYpAaDPoI31/fFnmgQ0zbBL/GfKz61r4L+7mywO3UK/dG/+ZytdMpeJeC3f2UnlPv
 PbYm1ltZWYimGB53KF9AiyIhrjMIsmxu6AcWmHyEj+S226NA1TkcNTA141zdhVMrFFem
 f2GzbnsjDjYKjFQo98qG6qVlIEosWYVvxjdyBoMGtWyM+wei3NxMgIcvmY5fqUqtE91Y
 bBJur4JPuZw/U5Y4z+PtaLZJFdAEiMxrytdm3OJKElgKnwH976dnI5kIksXldvtx+HV1
 1Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHYwQFAJmnErQZCKQJLUVtyEs4pscZoMMUhpkcqKYYM=;
 b=nS7nXL9tN3R7mrXr7hkJ/7x+XlsgBblKaC2rlDjSQtFQD75RfDvLjTs6zyVlS+MNy2
 dKWSX3Jvx7TyyDHqrB30f7VDX9wCPGVM6dF//8LsVaBLoilCoig5CXaNxKTEA+C2Xirm
 ombzWw6ZSwBPFNMhYsUSDj4uSv99b7KLucKUWpSmJRt5A539CmhiW2BtjnArIcVHUtV7
 Q6ghrYAydFk4qJxZXp4Ro78H2Zsvj9saeo4HCC00LbhDl/gLSx8jEGLayqjTEWWwWBVZ
 BQtU1vtClkZe05KL+7EWR/YTYio/VUNBIjcAOtUhzVwZ++LW+hfLFu3avfrH1I4z8GA4
 hqcA==
X-Gm-Message-State: AOAM5301ATL6woAt6bfle2sncLmgrnQVoustOc1130qx6D1WrTtOOmdr
 wGJtefoMtoidq7iUwoi6o8knPg==
X-Google-Smtp-Source: ABdhPJwDQJGAoar+6xZb17zLviI1ctKFIgCOtDGssMUG/VfV7UGq2Htvy4sqs5yKuxLjdJyGWXsi4g==
X-Received: by 2002:a19:a405:0:b0:473:cb3d:6cb0 with SMTP id
 q5-20020a19a405000000b00473cb3d6cb0mr746951lfc.208.1651692795615; 
 Wed, 04 May 2022 12:33:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o8-20020ac24348000000b0047255d2110csm1283388lfl.59.2022.05.04.12.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:33:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PULL] drm/msm: several fixes for 5.19
Date: Wed,  4 May 2022 22:33:14 +0300
Message-Id: <20220504193314.1185639-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This pull request contains few tiny fixes targeting 5.19. The biggest one is
the fix for the dp event thread wait condition.

The following changes since commit 36a1d1bda77e1851bddfa9cf4e8ada94476dbaff:

  drm/msm: Fix null pointer dereferences without iommu (2022-05-02 10:11:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to e402369f0b16d1518a9c7c7ffaaee9a90b2de6a5:

  drm/msm/dp: fix event thread stuck in wait_event after kthread_stop() (2022-05-04 21:46:40 +0300)

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: add missing break statement for update_pending_flush_wb()

Dmitry Baryshkov (2):
      drm/msm/dpu: don't access mode pointer before it is set
      drm/msm/dsi: fix address for second DSI PHY on SDM660

Konrad Dybcio (1):
      drm/msm/disp: dpu1: Properly sort qcm2290_dpu_caps

Kuogee Hsieh (1):
      drm/msm/dp: fix event thread stuck in wait_event after kthread_stop()

Vinod Polimera (1):
      drm/msm/disp/dpu1: avoid clearing hw interrupts if hw_intr is null during drm uninit

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 22 +++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  3 +++
 drivers/gpu/drm/msm/dp/dp_display.c                | 13 +++++++++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  2 +-
 6 files changed, 26 insertions(+), 18 deletions(-)
