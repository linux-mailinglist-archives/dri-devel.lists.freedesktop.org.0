Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D57E7FA46A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4C210E2DA;
	Mon, 27 Nov 2023 15:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098CF10E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:28:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54b0310f536so5337972a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 07:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701098929; x=1701703729; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xH7djIzH2lWtg+ZnnlMA49TMMB9EdHS+GmuOJoHr84A=;
 b=p6aytW/jQe4M3KBYEaPOz8xS2pxerukj3xI22P9PL7nhpUMPpkVWpjeEvsUzw5YNGa
 oPvqRDheqWirEDf1u/Iq2rCaTuk7EmyZJqmqx/eec4URKcMVck+z9XlgQ7nsU3UnRLUQ
 13sj8HjSINyJOxtMYEo9ZZsh18jvpz8JJE11hPwf/ppOhzXo6ym/VYxS6wzugAjP9XBf
 TSAyBJ3uvhE1vrJyWbtVLHmTJrYpEY9X2nmRIX/lpaQtU9lrZ4eoLZEfTyrk1mIh4VTj
 xH7p0VPUXjW6Mcb4EZ8P7L2OzYkd4sXW0Szsl8gRWUxjtObdSJILRFxK2cpAkRDjRb+c
 xuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098929; x=1701703729;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xH7djIzH2lWtg+ZnnlMA49TMMB9EdHS+GmuOJoHr84A=;
 b=eagNUIrSxLgttQvoGlu4PQuBeYqrJKHkKlMnFaAKNNhRP6scH1k/xJETJPUbNfUJSb
 1uznJ6Nhq8Af97yLLk7f9MuLHLUQZk0xoStrFWRowPadg563nnNp7wUsxl+LSMfpCiCV
 H6dxIIPS+gcLL86YTA/gEFusGNPX6HtVBPWc1B7jFJB2SThI4sifLWh18dBz8wWLK5t0
 biRXNPGclIlgwqwmT11yZJqQWAds28JP6lbdG2EW00pLrGebMdAE43buxw4447b7797P
 D/7zUh0O17l1R2j7NZqqBsBsX768qCms7VwZek7riHCO+uru4b2aFGr5352sf1EiJ1p3
 x73Q==
X-Gm-Message-State: AOJu0YwewxLYXzWHKyJJ70Ncgg/ifV0NOd7AIveJzporDkHHhdRv3Pti
 x8FzDZn+weLpJ81aLtGHsea0pg==
X-Google-Smtp-Source: AGHT+IFVq8VVBBAB+9CYcFJYQtXvol9+Oolg8Bycg8P4iRm8ZI2RLM5GY7iy8CP/g/zrCxgD8BoRag==
X-Received: by 2002:aa7:c401:0:b0:54b:3bba:8372 with SMTP id
 j1-20020aa7c401000000b0054b3bba8372mr5619318edq.5.1701098929327; 
 Mon, 27 Nov 2023 07:28:49 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056402104700b00542db304680sm5321002edu.63.2023.11.27.07.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 07:28:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/12] RB1/QCM2290 features
Date: Mon, 27 Nov 2023 16:28:40 +0100
Message-Id: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKm1ZGUC/3WNQQqDMBBFryJZNyUzkrZ01XuIlMSMOiCJTKy0i
 Hdv6r7L9+D/t6lMwpTVvdqU0MqZUyyAp0p1o4sDaQ6FFRqsAdDqJc3cafHw7MktOgQLxtZ4QfC
 qjLzLpL242I1lFl/TVOQs1PP7qDRt4ZHzkuRzRFf42b//K2ijAcIVPKA39vaYODpJ5ySDavd9/
 wI0+5IFwgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701098925; l=2755;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yZgEzYKRpKaQPQoGOfb7ONUfzFPf2ls77sgBQdDr3ME=;
 b=V5UwjbXyluYT3sCqyhvxMPLK7n4ewU5ni508NwKZPVwcvivC25/OkbkbE+ilYnCDD3fCiiOod
 mruf6Ot8p8aBmYMfhBp209eYwgjnXewqW2wsmN8WL5VleHqw0qEtTZV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series brings:
- interconnect plumbing
- display setup

for QCM2290/QRB2210 and

- CAN bus controller
- HDMI display
- wifi fw variant name

for QTI RB1

and the necessary bindings changes

Patch 1-2 is for Dmitry/freedreno
Patch 3 for Georgi/icc
Patch 5 for Will/iommu
the rest are for Bjorn/qcom

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Fix up the bindings example in "qcm2290-mdss: Use the non-deprecated DSI compat" (krzk)
- Fix up sc7180 & sc7280 DTs as a result of the bindings changes
- Pick up rbs where it makes sense
- Link to v1: https://lore.kernel.org/r/20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org

---
Dmitry Baryshkov (1):
      arm64: dts: qcom: qrb2210-rb1: add wifi variant property

Konrad Dybcio (11):
      dt-bindings: display: msm: qcm2290-mdss: Use the non-deprecated DSI compat
      dt-bindings: display: msm: Add reg bus and rotator interconnects
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add QCM2290 bwmon instance
      dt-bindings: firmware: qcom,scm: Allow interconnect for everyone
      iommu/arm-smmu-qcom: Add QCM2290 DPU compatible
      arm64: dts: qcom: sc7180: Add the missing MDSS icc path
      arm64: dts: qcom: sc7280: Add the missing MDSS icc path
      arm64: dts: qcom: qcm2290: Add display nodes
      arm64: dts: qcom: qcm2290: Hook up interconnects
      arm64: dts: qcom: qrb2210-rb1: Set up HDMI
      arm64: dts: qcom: qrb2210-rb1: Enable CAN bus controller

 .../bindings/display/msm/mdss-common.yaml          |  18 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |  21 +-
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  14 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  14 +-
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |  10 +
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     |   8 +-
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |   8 +-
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |   8 +-
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |  13 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |  15 -
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   1 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 462 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 109 +++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   8 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 16 files changed, 671 insertions(+), 48 deletions(-)
---
base-commit: 48bbaf8b793e0770798519f8ee1ea2908ff0943a
change-id: 20231125-topic-rb1_feat-dd510532621b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

