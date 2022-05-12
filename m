Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BBD525867
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 01:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E0D10ECB6;
	Thu, 12 May 2022 23:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1A710ED07
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 23:36:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bx33so8331936ljb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mqg2HFo22LFUUAaIX3kOrdEQtT9JSav1gOQJOHe+MV4=;
 b=mmR26HUeqn9O1FSlvZQyN8+ORR4vZKDXyrydHFmv787Zc9a1TOfTgqG5GLjXrYHsYA
 /FwsXZG72N4ZPzGi/bx4LpFilKVXHporkkc39B9zx7xzqVw1HT/8CCod3ku7aY31RLCy
 yi8S5F9e8zcNX+kOQ5POJ6PH5pDW3GxLS7vQA5cyAtqv1KDmlj8u5zQvVG1UN9pUqu7O
 jObEyn32ImgdkZdTGsYTDRJqg/DybjdlvEJ8tSzQSfb6RvcqsqgD+6z18IpCBod348u0
 i/cFE6wp7VrPz5qDGvaYkpHm0Bvlk/5UqcckaZyl3TRyx6YkoB7TqCzQG/5QBtsrykdi
 +9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mqg2HFo22LFUUAaIX3kOrdEQtT9JSav1gOQJOHe+MV4=;
 b=cb49oY/VsH4Pz7j3TEzjnb7pkaOgW0//hs/eHrMxRxk/1cIDQ5/HtqQGpB4BjMeV/O
 HbIxGb58A3LPl/SfwYe86bQ3LmRIgxrb7RM5nRnNJbtbZfCHgT8QlMHs+ZaRUzSMCOoC
 r6bBr7CC+0D8IlQm2B9adQeATc6LpjadQxyKOmiSC0PGN82fPZY0s6KcdolQ3mxVGZau
 YtvTddlzq2z7HQL+H/u+XWFzP84XSivneK4297ZsO4KI3zmKppMoVfNHLvcc3IF4/Cyt
 DKnkVPnrqSKPSc4wF8w8UsDuL0FO7rLT9fqriOSEXiGpjM3CIQ3BZ7riCDirs0+p/eje
 7KZg==
X-Gm-Message-State: AOAM530T7AuzEjjMCV5RgfE+RtDX7wMFhleGUvH6JlhfL9Ksu8rlfQmF
 Jo/0tY4oIoDfQ7gUja1v0TZHGQ==
X-Google-Smtp-Source: ABdhPJwBV8uAqbFejjQddQs0SGuoQqzrAx8iRAAigbgyagyUKnQQFbrC4zQOu8lElkRCIsjDcVoTBw==
X-Received: by 2002:a2e:934b:0:b0:24f:cce:5501 with SMTP id
 m11-20020a2e934b000000b0024f0cce5501mr1442767ljh.443.1652398608278; 
 Thu, 12 May 2022 16:36:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:36:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/8] arm64: dts: qcom: initial Inforce IFC6560 board support
Date: Fri, 13 May 2022 02:36:39 +0300
Message-Id: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
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

This work is largely based on the previous work by Bjorn Andersson ([1])

Changes since v1 (mostly based on Kondrad's review):
- Also disabled dsi0/dsi0 phy in sdm630.dtsi
- Removed the clock from BAM DMA devices rather than disabling them
  completely
- Replaced numbers with symbolic names for interconnects in sdm630.dtsi
- Switched to "qcom,sda660" as a fallback compatible string
- Added dt-bindings for the qcom,sda660 compat
- Removed extra nesting level from the adsp firmware path
- Replaced numbers with proper symbolic names in the board file
- Added chassis-type property
- Changed the order of blsp entries in the board file
- Removed spurious newlines
- Changed the order of regulator properties
- Changed the DSI data-lines to list all four lanes. Still use just
  three lanes for the adv bridge (and describe the reason in the
  comment)

Changes since Bjorn's v2:
- Disable dsi1, dsi1 phy, GPU by default in sdm660.dtsi/sdm630.dtsi
- Fix qusb2phy ref clock
- Added USB2 host support to sdm630.dtsi
- Renamed DTS to follow SoC-vendor-board pattern
- Fixed vph_pwr voltage
- Removed extra/unrelated comments
- Added keys, USB2, USB3,
- Added configuration for the attached HDMI bridge
- Enabled MDP, MDSS and DSI0/DSI0 PHY devices
- Removed uart pinctrl and /reserved-mem nodes (present in main dtsi
  file)
- Added card detection for the SDCC2
- Disabled BLSP BAM DMA devices, they make the board reset during boot

[1] https://lore.kernel.org/linux-arm-msm/20210825221110.1498718-1-bjorn.andersson@linaro.org/#t

Dmitry Baryshkov (8):
  arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
  arm64: dts: qcom: sdm630: disable dsi1/dsi1_phy by default
  arm64: dts: qcom: sdm630: disable GPU by default
  arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
  arm64: dts: qcom: sdm630: add second (HS) USB host support
  arm64: dts: qcom: sdm630: use defined symbols for interconnects
  arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support
  dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 459 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  85 +++-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +
 5 files changed, 542 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

-- 
2.35.1

