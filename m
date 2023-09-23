Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2F7AC543
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 23:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825BB10E066;
	Sat, 23 Sep 2023 21:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E2B10E052
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 21:49:15 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c131ddfc95so56837241fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695505753; x=1696110553; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0mKikz6iQlf/2X/8udeNvqptmCav0BXWVkbR1ppszpA=;
 b=HBoeRZsnjtnC9ixRKA4jXNVh7y+H5GZiCqMSSpMqoNNB4AcqIFsfq879tVhZypQ8Aa
 6AWTdQVWNM5OTyWQtxlDpCuY+SO+9nlXaq4c8/7b+l4d5+uEN+ImKN5HDiC8yjNtDtK6
 SQ1wB/JjlTHrU2h549C42FV2voysr8u5Fd/nLjdLyYp+uMGZn0PRlffQOStUhrZBWt+C
 w93cVnfEK0QjRYYKnMev23uFuOiYnoJMi1RNrhBFW/NqwfVRGHK7T4VGy5NaN8rpTz0L
 N6mV469sxgMS+8/zNQlgoWEUelsttlyED8nU/t6UWZf12iWsNKieCQ6d1uv9DtghVXCj
 DYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695505753; x=1696110553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0mKikz6iQlf/2X/8udeNvqptmCav0BXWVkbR1ppszpA=;
 b=wYVrK3aBZShrurmgvoeTgTJNRNaIGA/kUKqnN9ex2hZGzJzoiCknyap5VrX8Ud9e2F
 ZQKY8rkuNFgmRidoBzrO5St4DNoowPzJazEW7XsdwrJe3EdzkwnjEJhxQvwO2ncNSOxC
 CIjYi0nfq4iXixrp2yZg4gD0S6P/d+yxqw1QwrnF71f6KC1r/YIIfM9cLdAn2iHF1xuY
 v52cc/VmTqaQJRr9ptPaitB6x+3ojzqJPOC4I71CXP4aJfoMEmzhSavs+wyU4aEHoaYI
 3ARlkRGIEEqxfgOQ5kGatFbTIEWJP95qhBLFf5hj7Bj9XoAWYUh8fEhRZRWF2XYL3Du5
 L4wQ==
X-Gm-Message-State: AOJu0Ywkm/LeE17V/cTIdgBdNISsdudIIdrpNG230GgHp8h2d9mm0wp7
 KpuB7URGcwwjT+hcYbHNJUR38w==
X-Google-Smtp-Source: AGHT+IHfMWz0YFTxERDUiIQgVQVWvbsVCtLPEAqGh68CRmNrR2JB/mBEc7E8zYr1iE8TPrS5PMEC9w==
X-Received: by 2002:a19:6905:0:b0:503:26b0:e126 with SMTP id
 e5-20020a196905000000b0050326b0e126mr2010709lfc.59.1695505753532; 
 Sat, 23 Sep 2023 14:49:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a19520c000000b004fe0760354bsm1196590lfb.275.2023.09.23.14.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 14:49:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFC PATCH 0/3] drm/msm/dpu: convert even more MDP5 platforms
Date: Sun, 24 Sep 2023 00:49:09 +0300
Message-Id: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
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

Extend DPU driver with experimental support for even more MDP5
platforms: MSM8937, MSM8917, MSM8953.

As with other MDP5 devices, one has to pass `msm.prefer_mdp5=false`
kernel param to test DPU driver insead of using MDP5.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/123294/

Dmitry Baryshkov (3):
  drm/msm/dpu: add support for MSM8953
  drm/msm/dpu: add support for MSM8937
  drm/msm/dpu: add support for MSM8917

 .../msm/disp/dpu1/catalog/dpu_1_14_msm8937.h  | 213 +++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_1_15_msm8917.h  | 190 +++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_1_16_msm8953.h  | 221 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  14 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +
 6 files changed, 644 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h

-- 
2.39.2

