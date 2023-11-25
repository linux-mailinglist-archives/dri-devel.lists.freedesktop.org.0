Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409497F8B4A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 15:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203E910E00C;
	Sat, 25 Nov 2023 14:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68A510E070
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 14:17:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a00cbb83c80so395520566b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 06:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921861; x=1701526661; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OPB29h8XgdVf8/Mj7J0oGuHQzVyt4cdj+mVXkBfm3j0=;
 b=VS+g3x8t651CuG8IgvieWi0gDidLA/w/8GRqMD3NHfw5Uuk51l5k2teJTgYQuNwp1Z
 PVAinIfdulp35LmhzoZUxV6b3iypFfjHYBbXHPQrtJy1OGUQ/p72MNUhrfQS8Wc8Xa7O
 idJxryhgvLtwQgxFjnvtmkT9QeA30IzgBNeb1TB8E1Tdd2CAwRpR3CmgCazgOBM2lQeG
 YbdyuT0YBpZvjnzbNQ7mYA4VN8p/Xy428/ReE8YYvGs2xeX2uWLKcZyOJR8yXTGM5dwP
 /a8KeaQ8xvLBlAn4oTciZJkGfZLYu5WOa+TscZ277dgAoesWRCnfPdRiOUAcEoB/Js5W
 uiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921861; x=1701526661;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OPB29h8XgdVf8/Mj7J0oGuHQzVyt4cdj+mVXkBfm3j0=;
 b=qtAUdGfvBCHqtHuGgJ+gLvBXttQLlfjXf0wAzch+XhtRKufCuT+3TsYWm+aDtz9rkt
 pAs2uizZwL6yf0PDaLeb1q40XB+8L38rph8FG7jgIWwqmVDccdRHchkaofBG7xZTxufa
 sQsv5YziD2otUYZ6QB/u/out7lRCvt0QErIw/iqVUGc+GVb+8dpSuBHIpYhYv0DPo+fw
 7kM/UgJ/f3Jl2aHEZs2HVvqlqjpsgp10V5OpY9krIMs/+QfQjmbNdpbqXQqHPiOa2JWa
 rw1f7sixXLpNzB1nM5kBdCtqvRSGF03IVOF8WDPokm3SNWLORgkt8IfgXrHQy9bOe53k
 Z8uQ==
X-Gm-Message-State: AOJu0YykJt5Uak82WNMnFzvwvVNznC/jdLtgGb38aTkHUNzSvFihKHY3
 RgdQ7BmbnvTrdD/l2YgW7q+I8A==
X-Google-Smtp-Source: AGHT+IFshDaGZpoZ0UPNN73yo2NyaQpJ6p9P/hDNUi+51RGYJObtCtzb4JKAHb0PVhKI46jF5+kwvQ==
X-Received: by 2002:a17:907:2da9:b0:9fe:38b7:4278 with SMTP id
 gt41-20020a1709072da900b009fe38b74278mr5932250ejc.16.1700921861162; 
 Sat, 25 Nov 2023 06:17:41 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:17:40 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/12] RB1/QCM2290 features
Date: Sat, 25 Nov 2023 15:17:28 +0100
Message-Id: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgBYmUC/x2NywqDQAwAf0VybsBEtof+SillH7EGZJWsLQXx3
 w0eZ2CYHZqYSoNHt4PJT5su1YFuHeQp1o+gFmfgngciDrgtq2a0RO9R4oalBOrDwHemBB6l2AS
 TxZonz+p3nl2uJqP+r8vzdRwnnFqtGnUAAAA=
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
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1962;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qqo1HkU087mhGcmOMVz6Ckg9V4Z4NTeii2LcjxJBNPM=;
 b=o1M6AdcRS2Gq88RD4ObPcOl1SXOsPSOZLeS6wO63F2KLCgkoaV13h/mDN9e0icg6ZaSnsLQtx
 31OcGhoRmcSBrN5eyR4Y9Mh5bTUkFIRHMYG7GFIXZPhZa5DwwDHyDfD
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

Patch 1-4 is for Dmitry/freedreno
Patch 5 for Georgi/icc
Patch 7 for Will/iommu
the rest are for Bjorn/qcom

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Dmitry Baryshkov (1):
      arm64: dts: qcom: qrb2210-rb1: add wifi variant property

Konrad Dybcio (11):
      dt-bindings: display: msm: qcm2290-mdss: Use the non-deprecated DSI compat
      dt-bindings: display: msm: Add reg bus and rotator interconnects
      dt-bindings: display: msm: qcm2290-mdss: Allow 2 interconnects
      dt-bindings: display: msm: sm8450-mdss: Allow 3 interconnects
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add QCM2290 bwmon instance
      dt-bindings: firmware: qcom,scm: Allow interconnect for everyone
      iommu/arm-smmu-qcom: Add QCM2290 DPU compatible
      arm64: dts: qcom: qcm2290: Add display nodes
      arm64: dts: qcom: qcm2290: Hook up interconnects
      arm64: dts: qcom: qrb2210-rb1: Set up HDMI
      arm64: dts: qcom: qrb2210-rb1: Enable CAN bus controller

 .../bindings/display/msm/mdss-common.yaml          |  18 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |   8 +-
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |   4 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |  15 -
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   1 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 462 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 109 +++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 8 files changed, 594 insertions(+), 24 deletions(-)
---
base-commit: 8c9660f6515396aba78d1168d2e17951d653ebf2
change-id: 20231125-topic-rb1_feat-dd510532621b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

