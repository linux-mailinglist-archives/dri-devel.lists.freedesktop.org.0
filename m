Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A27FD9E1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 15:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFED10E1F6;
	Wed, 29 Nov 2023 14:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3296A10E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a013d22effcso920782766b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 06:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701269046; x=1701873846; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ylEU11Sj8y9lW/5egLuUmSM5125mWJnuLEGjsRPUTJo=;
 b=F2sJs/OUcolGlS8a8cDKFAKbrhX8qTy90PGGsPGkdRRLaRc0RMCcvCP/J8omaTluPk
 B/AyNmMcqcZK5N++ZQge5zZny+oOM4FCjU44PQmidefBXDusrloc3CeBK1anTbNiQGPx
 7W1Oez/b3mNe3gFODZfdtMgpCnhLYtQ50WOPywpo6e/n08GyeRoEvsIPXh+Io6H9bK+v
 qt/QcPS7oIp1noEMywE4oUtyHgGGTGul/hlUEqr3TTl2SaQ9XhzITPZkcEaJcu0gDP7u
 CJmtmM1zjpoH/zPNIO8jGvP4qTY3Pp+waV6eByK+OtiH2BedOSMqTXZ3KBSCqcXeOK3f
 nqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701269046; x=1701873846;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ylEU11Sj8y9lW/5egLuUmSM5125mWJnuLEGjsRPUTJo=;
 b=eBkzPW4LRIm996MXnQ976tEZfSH7FsB25acWKoskhoqNl3/4ZKHEaGnlWpl/d+l13x
 26ykAcwf+xZWt4Og0oqssL7vYu50CFan73hglL0b0n54ZvfP7uwTt91PlOscDHzIsJtr
 pMTCl8/fbrmeY5EkjcHMqe4Hplpp+UN7kar4IEAGLOaEYSGlP5HVa9cEYSYji9a7phVY
 mvxOOmTqy2DXo43kOhXrpWdW0OZPAs1if3YYaAaFbjQkIGSUi4H81/LN0AaLniWjORyS
 acbKPdH7WktqV5TbN78KOEbj9weePwcDGFVtd206Z0tyHwBgMx4kzfCr898Z5z67NLro
 zh0A==
X-Gm-Message-State: AOJu0YxTBr2bu0O6sRle6LrsAD9v6WQDr0/ZE1Ev0ukQi3zu0T5c5fEc
 WMDM214/YEumhkj7YA9+9C/sZg==
X-Google-Smtp-Source: AGHT+IFEXQX5eb9doRuoINpQIG+Qas2v9OWjMo2x6sJj2S1M6xOCHUkKC0SwNpJFe6cwgq0kONdNQQ==
X-Received: by 2002:a17:907:7289:b0:a04:bcc4:b8d8 with SMTP id
 dt9-20020a170907728900b00a04bcc4b8d8mr13575442ejc.43.1701269046550; 
 Wed, 29 Nov 2023 06:44:06 -0800 (PST)
Received: from [10.167.154.1]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm7913738ejh.79.2023.11.29.06.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:44:06 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 00/12] RB1/QCM2290 features
Date: Wed, 29 Nov 2023 15:43:57 +0100
Message-Id: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1OZ2UC/32NwQ6CMBAFf4X0bA27tQKe/A9jTEsXaEJa0mKjI
 fy7hZsHPc5LZt7CIgVLkV2KhQVKNlrvMohDwdpBuZ64NZkZligAUPLZT7blQcOjIzVzYySUUuA
 ZQbMsaRWJ66BcO2TNPccxj1Ogzr72l9s982Dj7MN7P02wrT/7CXjJAUwFGlCXsr6O1qngjz70b
 Gsl/O9j9puq0Vh3QtJJffnrun4AEq4XRAIBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701269042; l=3004;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eV260drlUhaV86AtMNOLW5CfSC+ugoXrL0AzM2FTKtc=;
 b=i1CbpYQhpDTPJ5XiYrBQ5xsHRCDu6vxMZQ/OHzcmfaEiDhHV4Sw10Tu/GPRgYbTNufhADMuHR
 PHRNnPX728XB+61s6hLdjib0rJBmAEAX/m1WIwS4EIuhYsxDLg/kDMm
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
Changes in v3:
- Pick up tags
- Fix commit msg of "iommu/arm-smmu-qcom: Add QCM2290.."
- Add missing sob ("qrb2210-rb1: add wifi variant property")
- Link to v2: https://lore.kernel.org/r/20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org

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
      iommu/arm-smmu-qcom: Add QCM2290 MDSS compatible
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
base-commit: 1f5c003694fab4b1ba6cbdcc417488b975c088d0
change-id: 20231125-topic-rb1_feat-dd510532621b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

