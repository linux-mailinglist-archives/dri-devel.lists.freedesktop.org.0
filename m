Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB26F9B7C
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3320410E07C;
	Sun,  7 May 2023 20:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861AF10E2E8
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:28:44 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac89e6a5a1so30248181fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 13:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683491323; x=1686083323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LFULAHottHyIiJ/qnKwuTIZZXUlarclQ80PbJxT8P6o=;
 b=I/dtP5NmpVn4Z5lspvVGMjytuzEpdN/5Rb4zQXK89Or4lkX4McpPn7VtRMLwRLsLLA
 rZQGikf62hvxPxpNWi3e/oP8aroAbal7h26OOTq4u48NgfQiMzd1V/cNoszb7qjqINhV
 Er7sZ42DKyE28rv7oO5QmT7SkMlnATvb/Py6zcMTncQ6d/jpqyDRSL+zxbzJieCTlG5N
 LhTVokUrsXKpQkFsCCVWnTXljz6+Xtks+jey4mGKWKyP7zepeX59xH+7QsWPyahTQ6dm
 c1/qSG3AfayxWgaNbvGooY+ZTY5yoOKqL8TzSwgsCYKRRjHWDJFGG0l5He9tVqIc/DBX
 +4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683491323; x=1686083323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFULAHottHyIiJ/qnKwuTIZZXUlarclQ80PbJxT8P6o=;
 b=AxKAO0bZsCYxpqopW0dqzpBpGwlxuSsQWHahRDQCEOeJUrqNyWjVhHGWW/XVlFRHTz
 frRcwKr3969hDZxKbwfzXhMGKtv36KIdANrzvdfRNHPsAXRfn3gmaECg1JZlVC6Q5MkU
 eDdYg078U8Juf/4A0ZBuSrQzL6/jQKnAw1J02YAzxfvF8ChBImxSXm4GNLPrImAQD4sM
 7TGlO8a3oYWmqGXj8NRakoinYceocANSMBlabDcvolVVKRbBYwUXblVCGBtJPRPD1jCf
 +oVRFoqnwv38VlccAEsx7ZbVkXfWmQflWI/Lp+Ky8S5lrkPjY/q0J6fitpPMvbKHpDv/
 AgGw==
X-Gm-Message-State: AC+VfDwfpZRoo6OS84ebrVUukFcdWIxqABrDjusTJ9OyVHxdeFowJ6SM
 orYwfNyiZJUDptS5he70x1qw8Q==
X-Google-Smtp-Source: ACHHUZ4Jv+wTxeXCPJjjYK0WrVRacQaoSLrjJFlnb00KVGhyYWlOa2vtQspehH+mxvxa3opWFN5C3Q==
X-Received: by 2002:a2e:9f4f:0:b0:2ac:767c:ae14 with SMTP id
 v15-20020a2e9f4f000000b002ac767cae14mr2370588ljk.19.1683491322710; 
 Sun, 07 May 2023 13:28:42 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f25-20020a2e9199000000b002a8bb52d994sm928043ljg.25.2023.05.07.13.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:28:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH v1 0/3] drm/msm: add support for HDMI on msm8974
Date: Sun,  7 May 2023 23:28:38 +0300
Message-Id: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for the HDMI output on the msm8974 platform. It
was tested on the apq8074 dragonboard device.

I'm sending this as an RFC for two reasons:
- The series depends on the other patchset ([1]), which got no feedback
  yet.
- I'm looking at refactoring the HDMI PHY support. I tink it makes
  little sense to land the PHY driver when we know that it is going to
  be reworked during the same development cycle.

[1] https://patchwork.freedesktop.org/series/117431/

Brian Masney (1):
  drm/msm/hdmi: add msm8974 PLL support

Dmitry Baryshkov (2):
  ARM: dts: qcom: msm8974: add support for the HDMI output
  ARM: dts: qcom: apq8074-dragonboard: enable HDMI output

 .../arm/boot/dts/qcom-apq8074-dragonboard.dts |  30 +
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  90 ++-
 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h               |   6 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c           |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c      | 689 ++++++++++++++++++
 6 files changed, 818 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_pll_8974.c

-- 
2.39.2

