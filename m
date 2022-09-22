Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A405E611A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCF910EAD6;
	Thu, 22 Sep 2022 11:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CC410EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:30:27 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f9so14156564lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 04:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=LkD3jQHv+BqRf+/+wzrmLIW7XBT4WmGJ2Xf+6E77lbU=;
 b=EmtmBvgk03neDgJ3f0flqzedS12sROzDs2hrEQcsMUfzzTzJpsPSysdCvsqAToun04
 nmpeO7tHEXZ8mjegUQUYcGnvhNFXsMIxGGz8GwpTOOtpPhZf+AY/8xnBksAnXc3D4tya
 QN3ErhT9ooWRb7jDXBETIlpF5qYURJ8P517kXZ+3Wr36kLAJMMmuOjotIt6TBaZWIoQ1
 pEcAjNGvygroxJL6Vx5gbG82nYZNzh2MIxdOZ/vCwnAmegjfx8NXQmLxe1AXK5dd1zDS
 Mq507ehG+YD9PqiBjcnH6UdrOYkn2jU43/aGdnAcGykWx3+Rm0fUMih8giZK+bDL+11D
 s33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=LkD3jQHv+BqRf+/+wzrmLIW7XBT4WmGJ2Xf+6E77lbU=;
 b=sy+7QIT/3QjkBz6FBEDvuTAX5wmu9G5neWsOwQoSXa8J1TZChyMstK44iPAGs3ZS+M
 jH3p+d03sRqY76hKGbmFKWDbgbNAlLw06zlc+5efR//CFK2e4uL8RKfH60EzbXukpK4t
 uCA0HmHs3FH9vLCcq4uNOAFp9AU45YKK2she44U3g4+QRNTVNtjz7qabGbL16cCQo/wV
 iK39i6VT8aNKzFzWZAMjwRBEjr7x3jlX+Nbmo5BV4Ncc6CPuEJ+u65pHb/hwJCNy9IQO
 kebUUGq6jYof3Pr3n8C79b0Ulk3E+dqcs1b0sK4YTXUGRB83kTjxHP+n+sM0vpeoLz09
 LNSQ==
X-Gm-Message-State: ACrzQf0uZX4GV9bEHjsQoqPtFK4nINiW0ZYUCi/3HRsa16OeqiwLNbPL
 lw81ZtW4VlleSibQRCMljSb5XQ==
X-Google-Smtp-Source: AMsMyM5jLmRmuevxV1Zx6hXKJA7EoRFNvQ6KFDnrrY5fz9Q6cTAco/grcQKWL13VONg0Qb8Md9dvWQ==
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id
 g11-20020a056512118b00b00492e3c4a164mr1125188lfr.598.1663846218309; 
 Thu, 22 Sep 2022 04:30:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:30:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/5] drm/msm: add support for SM8450
Date: Thu, 22 Sep 2022 14:30:11 +0300
Message-Id: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.

Dmitry Baryshkov (5):
  drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
  drm/msm/dsi: add support for DSI 2.6.0
  drm/msm/dpu: add support for MDP_TOP blackhole
  drm/msm/dpu: add support for SM8450
  drm/msm: mdss add support for SM8450

 drivers/gpu/drm/msm/Kconfig                   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 132 ++++++++++-
 drivers/gpu/drm/msm/msm_mdss.c                |   8 +
 11 files changed, 381 insertions(+), 15 deletions(-)

-- 
2.35.1

