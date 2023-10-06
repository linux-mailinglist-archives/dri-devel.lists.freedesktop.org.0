Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1467C7BB965
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7CA10E4F0;
	Fri,  6 Oct 2023 13:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CE010E4ED
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:43:46 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50325ce89e9so2814171e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696599824; x=1697204624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQRUnrmlv22K+qm/l/EDKbK/vVJjVanCFgGw0OwEYes=;
 b=QzxIrP88u+miaWHhOPkut5GEhNEZ2dAQoYqZoB72ntfASZqgk8qr3tTOLAvnGSLEwL
 dmn5O1ISghp3wcWIV5gsIIrZF9eWAF9wZgmqsp8sNBqfcD/+xJh5YNxUh0OI1Ery/5DP
 6qovCcNA4v7cRBSdNx6Ap1EZdl0epHhDcMlufem8u+1AsX+xMu3u1ZRT2Dlzl5Lyh0Jt
 TOqZ78bej5UHftMELQf0Us8MbqbUktIgl8xptKsZ4ljtspeD0QL6997Uh3FxfAbZNaZV
 m8IDLSLvjSVV09d1A5r2n5XX/djxf6JhBiXj75EXv9W1FGH9IRmPYKmlJdRfTtRd2eCi
 +2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599824; x=1697204624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQRUnrmlv22K+qm/l/EDKbK/vVJjVanCFgGw0OwEYes=;
 b=NyN7KMV1EyOro6H2E2JQJBKk1uVIhnkE8JRCAfvakII+6qwpTIgDhnV7RAOxwFvFQx
 exV3cuOP5VTMpT28cvmmdw+DhTkYMAX2d0rxv8WSwt0MCdXONUgTN0WmTywjTwB1r+rw
 STeomMU2f1DiL4OyXnvql4Y+EnO3ZtVa8xnzvoORl/bZQUB3SP9LecOEu+IC+kNmfjt9
 qblS0P2Dz5kJxnxsQY7M4vpdaJaRH2jhDwn9BZ3YAlhs1VwZQ4rdpGBP/WSmXJdXtgLG
 LY2MKGpjdwN7+eX0OKrdHSSzLhfdubscVc8+Wn89z4ZU6lTIMRTenWhrY9kQxUiLnhNl
 NvjQ==
X-Gm-Message-State: AOJu0YyZcEp3K9uKzHKZck9EwSwsf0eL6i69Bw+4Ab+Nu/sktf72jOTL
 K9C1vS9xa9UC63fdWlCoV9mMAw==
X-Google-Smtp-Source: AGHT+IF/lAWyz3eLooDpOU321TJhhgi8Rexg+Pi2O38pQsad1e7E9h2Zy8QQK/DG1zUpmAapNhi8NA==
X-Received: by 2002:ac2:52b1:0:b0:503:3587:fd15 with SMTP id
 r17-20020ac252b1000000b005033587fd15mr6103240lfm.61.1696599824201; 
 Fri, 06 Oct 2023 06:43:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac2562f000000b005009d4a5e6fsm315505lff.22.2023.10.06.06.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:43:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [RFC PATCH v2 0/3] drm/msm/dpu: convert even more MDP5 platforms
Date: Fri,  6 Oct 2023 16:43:40 +0300
Message-Id: <20231006134343.2472493-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Luca Weiss <luca@z3ntu.xyz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend DPU driver with experimental support for even more MDP5
platforms: MSM8937, MSM8917, MSM8953.

As with other MDP5 devices, one has to pass `msm.prefer_mdp5=false`
kernel param to test DPU driver insead of using MDP5.

Note, Luca Weiss has reported timeout issues with CMD panels. This is
not yet resolved.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/123294/

Changes since v1:
- Added these platforms to dpu_dt_match to facilitate switching them
  between MDP5 and DPU drivers (Luca).

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
 drivers/gpu/drm/msm/msm_drv.c                 |   3 +
 7 files changed, 647 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h

-- 
2.39.2

