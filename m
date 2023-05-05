Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1CE6F8B3C
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47D010E682;
	Fri,  5 May 2023 21:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F2410E67A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 21:40:45 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ac77ddcb3dso26303141fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 14:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322841; x=1685914841;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xgq4BXfKeKLv3cDGmb7IeDG4pt5ybSWl/i2fKHbBPpM=;
 b=Gmv4tN6ScJzsVWwKziGjwl5q9qYoB4WK8WiQYELEQj8rP/IzriK8KD7dYggzLHZp9y
 n/fciDOIF5ph6Y7jMM2TukdMRq0R9e9EpsEz2CSsNkvqNKRgmtsjYZkATS/LGK+uYH+k
 bP3pTJ7puWjDtpjxEVNbv/f1VIFHa+1wkYs9olS4Mksxp3qGZddkKcHmE35kzQD2M9R4
 RMVefC6vmZZZXBFH4/4Ay8eFVzLGV8cBsmNBi6N63bXnEHvdPevcKYD6pxyeUambuhdJ
 TyrbPMPNZf7Yuv6L+R1FKiw9ZCoer9jkjKXSch+NmC5v2CJPuTGeKIxGVQ+M3ak745U9
 IsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322841; x=1685914841;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xgq4BXfKeKLv3cDGmb7IeDG4pt5ybSWl/i2fKHbBPpM=;
 b=RBtfz5Sceix0LfQAdYw1u2gx89lS0AseQO/ux/H0qDsbhv8whheqV2na2VhMJbVpUN
 ft8JkOFouxuBA03p4afxwx7biaYKeTPRmQu4qrA2CHeZaqUAoSv5YT1OAd57jsat0C4s
 2ScYEvkArLyh/rslR7+zX60Afgwa2sYbJU/MD4PdPylQqiBIoE8ZJ6KeKkHxsctOT0e2
 kbjmItyu+1YCEHZdKZIM8xIY/KQ+1eDYuNnI0V//Q3WI9VjLl9SX8NzNpxQEwxpkDqDG
 oPXTWX5H0Srx7Dz+pgriXi0d5Mf5b9/riWC/ve9/dvCLfb27F44pHZp4+G8YW7y4qW3c
 F/2g==
X-Gm-Message-State: AC+VfDzOGo1+sUtfmhtXzycCtmHXK5dQv1YM0c8GsSQcyxdqdIITebPv
 REodHTjnQmDj4xZEsrbN6ZhWkw==
X-Google-Smtp-Source: ACHHUZ5lafVh+OXGg5yoPYS+glhKVF2vEXnm3h0v0h6ZaQX1H2uaNlYRSi/QoqtwrLjB+a0amr6wrg==
X-Received: by 2002:a2e:9610:0:b0:2ac:7f7e:8c76 with SMTP id
 v16-20020a2e9610000000b002ac7f7e8c76mr913093ljh.41.1683322841335; 
 Fri, 05 May 2023 14:40:41 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:40:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 00/12] SM63(50|75) DPU support
Date: Fri, 05 May 2023 23:40:26 +0200
Message-Id: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMp3VWQC/42Nyw6CMBQFf4V0bU1pKaIr/8MQU/qAm2BLbivRE
 P7dwsqdLuckZ2Yh0SLYSC7FQtDOECH4DOJQED0o31sKJjPhjAtWlSVNYQJNY0IFaVR9CP7+MDH
 SxolKK22k5TXJ705FSztUXg/575/jmMcJrYPXnru1mQeIKeB7r898W3+HZk4ZFbXTZc7VnMvrC
 F5hOAbst/B/AmmsOwkn2blh34J2XdcPpFkQYxUBAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=3176;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iP0fGBX0lPBisMmLt9TXs5S6v+yRcMBOFrgMz4fdS3w=;
 b=gzOSQ+etI0dI/TirDAdjlA/piQyw6w9fPUvPI7BGqVq+fIwZ8xT6YTMsKvfI4UsnQPtGu8EpB
 irp9kShpwSlBPKNjYA5Nrp0cGj7+Twb/DPr+xHEHPN4iHYy2CeP27/7
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 -> v3:
- Don't duplicate qcm2290_lm_sblk
- Use DEFAULT_DPU_LINE_WIDTH defines
- Fix up sspp clk assignments for sm6350
- Add 6350-6375-common QoS data straight to the common file
  instead of moving it around after adding it
- Fix up iommu compatible order before adding new entries
- Reuse sm6350 msm_mdss_data for sm6375
- INTF_SC7180_MASK -> INTF_SC7280_MASK (enable HCTL) on 6375
- use double tabs in catalog headers
- remove one unused entry in 6350 dpu_qos_lut_entry
- add missing tear IRQs, drop INTF0 irq on 6375
- don't overduplicate DPU bindings, reuse 7180
- Pick up tags
- Rebase on INTF_TE v4 and next-20230504

Depends on:
- https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org/

v2: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org

v1 -> v2:
- Rebase on the DPU catalog rework and INTF_TE
- Fix QSEED(3L/4) discrepancies
- Fixed DMA/cursor discrepancies for 6350
- No deduplication, that's gonna be handled in catalogrework 2:
  "the return of the catalogrework"
- Split MDSS & DPU binding additions
- Drop "Allow variable SSPP/INTF_BLK size", that got in w/ the rework
- Split MDSS and DPU additions
- Pick up Rob's acks

Depends on (and based on): https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org/T/#t

v1: https://lore.kernel.org/linux-arm-msm/20230211122656.1479141-1-konrad.dybcio@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (12):
      dt-bindings: display/msm: dsi-controller-main: Add SM6350
      dt-bindings: display/msm: dsi-controller-main: Add SM6375
      dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
      dt-bindings: display/msm: Add SM6350 MDSS
      dt-bindings: display/msm: Add SM6375 MDSS
      drm/msm/dpu: Add SM6350 support
      drm/msm: mdss: Add SM6350 support
      drm/msm/dpu: Add SM6375 support
      drm/msm: mdss: Add SM6375 support
      iommu/arm-smmu-qcom: Sort the compatible list alphabetically
      iommu/arm-smmu-qcom: Add SM6375 DPU compatible
      iommu/arm-smmu-qcom: Add SM6350 DPU compatible

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  23 ++-
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 ++++++++++++++++++++
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 187 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 152 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   6 +-
 11 files changed, 821 insertions(+), 3 deletions(-)
---
base-commit: 0d71ecbdb3913e04dcf7f4de0929970cfb4376cb
change-id: 20230411-topic-straitlagoon_mdss-8f34cacd5e26

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

