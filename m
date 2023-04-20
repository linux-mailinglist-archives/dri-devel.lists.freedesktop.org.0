Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DA96E9ED6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8EA10E194;
	Thu, 20 Apr 2023 22:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6837810E194
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:23 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a7af0cb2e6so9305821fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029881; x=1684621881;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iMnuWFGrM/PJwZOBdpXu7uMemkHRjRrJAO+mKqn+Jmk=;
 b=aQsMXg/NOus9+GeChd10f8ubKVxsiA78PImgqubhQEHY5WoCIbJu4YybU8rMVoSuld
 uy6BpwEjlBXe/EP6hWAOmUFcLsbq5W1icBVy9URUpeXff8kscJrMtnZiKt+Ajf5IdIFJ
 vrRDdKhokID2wOPcpfWBkWd/LRpOW1f/ToPU/5A/isgSkUyUdhl152A2D1aI3KMyv1cj
 DrsjbhjpflFGNoH+DKn1HqtZIgr/Kj7oV68qQA18810aCMr5F5gvXlVUuIrQvIw9NUCT
 Tvglrbhi/EtIJ5qDidlI2tZhQIFozwjBpjB4S/c7FBx3iPRjGbBCVs4WtnHoi44/sKU/
 rtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029881; x=1684621881;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iMnuWFGrM/PJwZOBdpXu7uMemkHRjRrJAO+mKqn+Jmk=;
 b=dUCYKVVM5OQ674GoRoyg5TeqLtmW6ORGvLY3GpNT8Z/UoG3P5E3gNSZxV5wF3U2so8
 y1Pff2faRXl0jnYDil4T2rZWACjP9G/txIhqZFXUEzraso3x/JcsxS3pLk7khwImOPDO
 rSIkipuwslef4bTiTEVTwJQFX76NHsNDhKrBdK1RoAF+GHjcROtV+EJEbLrbDxpgZElU
 ayis+bnXtqqQkMUv/WAYpk+L5dRvjCQ9T7alBoug49j3LJTdWqNnUcBzp8LmRj60F6C0
 dqBQr9rqcx6QR/kEGDaEhWYjy56NieGjqkolVqbYs+ZCh4pj+vKnj1Z1K8DjlXG8tmOk
 snAg==
X-Gm-Message-State: AAQBX9frtjpTSY3vn9fi4rRNPaK9r08P+zpx3XWA1dJmmrdZE1Um1Dv8
 nSPX/5nZLxIz/7yJl5lsrpufFoClQUeSERs/wM8=
X-Google-Smtp-Source: AKy350ZchB20U9dl/pPfuLW+KcxMRjqr9dfU+8ds5x9ciZBLjLgvH9CvctlFQjn361GPRBpjNUyrnw==
X-Received: by 2002:ac2:46f9:0:b0:4eb:40d4:e0d2 with SMTP id
 q25-20020ac246f9000000b004eb40d4e0d2mr917031lfo.38.1682029881593; 
 Thu, 20 Apr 2023 15:31:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/13] SM63(50|75) DPU support
Date: Fri, 21 Apr 2023 00:31:09 +0200
Message-Id: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC69QWQC/4WNWwqDMBAAryL5boquD0q/eo8iJcZVF9JEdtPQI
 t69qRfo5wwMsylBJhR1LTbFmEgo+AxwKpRdjJ9R05hZQQl12VSVjmElqyWyoejMHIJ/PEcRfZn
 qxho7tgidyvVgBPXAxtsl9/7lXJYr40TvY3fvMy8kMfDnuCf42f+jBLrUdTfZKu86gPbmyBsO5
 8Cz6vd9/wKUXfip1AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=2429;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=adALUm2UDCuq+jHiF5r/gGrJmlODjVUWz+k4+ab309g=;
 b=/nzsoNRh05ssUpKUu6os3JNQO8PfbruXwKRIX2V2kNWnyhJDQ0rvJRZ62p8t4kMlbM/yaNOLOWjg
 xCPJJiuWAxaRmTiAW3QO8qBjR0fRzd5jjjsP6RDamuXawInqU///
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
Konrad Dybcio (13):
      dt-bindings: display/msm: dsi-controller-main: Add SM6350
      dt-bindings: display/msm: dsi-controller-main: Add SM6375
      dt-bindings: display/msm: Add SM6350 DPU
      dt-bindings: display/msm: Add SM6350 MDSS
      dt-bindings: display/msm: Add SM6375 DPU
      dt-bindings: display/msm: Add SM6375 MDSS
      drm/msm/dpu: Add SM6350 support
      drm/msm: mdss: Add SM6350 support
      drm/msm/dpu: Add SM6375 support
      drm/msm: mdss: Add SM6375 support
      iommu/arm-smmu-qcom: Add SM6375 DPU compatible
      iommu/arm-smmu-qcom: Add SM6350 DPU compatible
      iommu/arm-smmu-qcom: Sort the compatible list alphabetically

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/qcom,sm6350-dpu.yaml      |  94 +++++++++
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 ++++++++++++++++++++
 .../bindings/display/msm/qcom,sm6375-dpu.yaml      | 106 ++++++++++
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 186 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 152 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  15 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  19 ++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   6 +-
 12 files changed, 1016 insertions(+), 2 deletions(-)
---
base-commit: eaf6956f6dfdbba2c53a668248f8213b9e01bc51
change-id: 20230411-topic-straitlagoon_mdss-8f34cacd5e26

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

