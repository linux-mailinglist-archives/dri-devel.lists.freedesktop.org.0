Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBB96F2AAE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F94B10E0A7;
	Sun, 30 Apr 2023 20:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664110E083
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:36:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso2331725e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682886958; x=1685478958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wHm4YQoUofQiTjhT70T+V8A+AOnK8cLSZsYSqcgfAFc=;
 b=b13gGh/IdYRhF8N0/ngxwbhkC/rkyBSdidkZm133Ux2/SKVL/0CmOtyQ0k4lgv6EBn
 xSUllTTqFzapOOxUATHCEmHqyz0wbi88nLAxrIgTzirfOUdOcH3tcq5tl1wV8bEouc8A
 ytKcSslF2v6C41R3GpLlyWnahUK5MvqzYx6ozGzpYnTi1485Fd10Ans9dNApdTrPyf9G
 dapx9LCaqwOnEvbVk4Y4V9AjaDbIZE3HWJx0EHPFr62g1YiB6+XxISQKKh9RL2Qsk0lZ
 n3098JkuBJFlRWR3gxIQvx5IyYhGnQsyKmYwuwqxDAxANRBJgKdQ6jKWFgl6WCk46SYK
 BVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682886958; x=1685478958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHm4YQoUofQiTjhT70T+V8A+AOnK8cLSZsYSqcgfAFc=;
 b=ljFmycSCA0F1VPFuB1yICQYilEHV+2jGgNJKzVZ7tE0lhZTruZFzjvkhu9mtal5UtK
 ncB3K5NhLjodWz1Tub4ODded7KFQbTLhqrNjBfXnw4E6Y491X0zl1spdU8tHnKIndUvD
 GjQcNTOoPbVJ4XE6VX70Fo27aKHAoZTGfqJM82+L064x8XStkDidn/nDYWUXrw0kAGMA
 lBHOrwueY1Ne2FpQrgaT7Cpfk/ZKvmVR65JDBCVsH5dPCP4A/FE7wNfzoOrDSjR5/ZqH
 R76I4ACgejIYMiglVPMUs4dofaB1KwY/9QEU1XXfJi2Cr3Bh5a0yMo2iTKpq/J2a3aDf
 plzA==
X-Gm-Message-State: AC+VfDyNuiYUUVsfOoxTWwdmuQDP1ZKAmW9/EMDfmGIAOj8cbQO5kYbI
 nl1ojCmOIo8TvqiiJbjcq6TPhA==
X-Google-Smtp-Source: ACHHUZ7ajIaCaDx8E/n0HBrHerHj1ZEqCZlCY4XmdMIYYb0aCufR12WEAo03BgpZAvJCXKZBF3aveA==
X-Received: by 2002:ac2:41cb:0:b0:4ec:4c2f:1c85 with SMTP id
 d11-20020ac241cb000000b004ec4c2f1c85mr3142739lfi.31.1682886958156; 
 Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:35:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/4] drm/msm/dpu: simplity RM code
Date: Sun, 30 Apr 2023 23:35:52 +0300
Message-Id: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
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

Implement several small simplifications for the DPU resource manager.
First two patches were suggested by Marijn.

Dmitry Baryshkov (4):
  drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
  drm/msm/dpu: remove futile checks from dpu_rm_init()
  drm/msm/dpu: use PINGPONG_NONE for LMs with no PP attached
  drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  5 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 41 +------------------
 5 files changed, 12 insertions(+), 45 deletions(-)

-- 
2.39.2

