Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020216E9F02
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3864C10ED1D;
	Thu, 20 Apr 2023 22:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CE010ED2B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:45 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ec81773d50so950816e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029903; x=1684621903;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J8QyMbXoOHe4maJ/141Gl2opRXdF3vmPM4GP90Suqw8=;
 b=I0RuJim/ZifvTMm7CVHkzXSjJOF2vA532KiwtNLFVTQXWBbhF+e+ARmTjaDBf18orf
 qiKADkH5X0erT010RrJfLz4JiZfUTBQc7LnyAcaj+kXCPtP8M26HKUaUBYcmqV3JSio1
 S0JmaO1Ubte8l9JRUmFkjhmj+gL5Fn27RRXMiCrkZacFiX+oNJ02ZpYQOPXkrT3fXswV
 upgGN5hgqC37TjWrUtT2TsWS1Di/+9IZzoWAl+LZj3XIq+61sTWVq8yl+sNFV5pUb4uM
 o7ddN/EfAW+F3mxpGcj2YWLcuCrMLKrcdKbyxgLN8tur0LLLWV/O9et6c8Hbry4HJtC3
 v9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029903; x=1684621903;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8QyMbXoOHe4maJ/141Gl2opRXdF3vmPM4GP90Suqw8=;
 b=ZAnPd/cGrfB/cYyPqxbM3ytsJp1fR/IXqXoWHEeFwe6h0qGyIWfF1CG01jNL7Si2/o
 7JoT4H5ICZ+kGl5mdWWWjBsU8f0sSF70UaNiCBaaoK0/qqFw/E/a4gOeBE65YPn+sz5i
 ymkBzvLKYGW3kb6FI2JQ9q/5mVuwLj2A79pexdX+oi0/AAVlCrqogd9rxiL2khjz//fI
 3mMckjGQ2B8MOTN9DUfvxRrMIc67Ce85QDuLdCBus2wcZB8KdoDUaJ/Mo//4yUEIoWzA
 b7RIglYoPwzlJAhc9LUqb9lacmTu456YWlwu58+yZ5d5K9aeJWNV+JZUD37NT7+4MLcP
 hDnA==
X-Gm-Message-State: AAQBX9dHYzdD6RFt5MNWx7NRwdc8oTtRz4wDWYW+2KvXr7zg/4hG56Mv
 GmKjhr84UH1veBMfzrHhKSUkMQ==
X-Google-Smtp-Source: AKy350a1EqNhSqyvroEQFXEC3oNWZWKJ59j7Y7boNYcM6me6/l6zelpIdJE5bpeODyX5Mgx2NKVt3A==
X-Received: by 2002:a05:6512:388e:b0:4eb:104b:bf61 with SMTP id
 n14-20020a056512388e00b004eb104bbf61mr801740lft.58.1682029903471; 
 Thu, 20 Apr 2023 15:31:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:22 +0200
Subject: [PATCH v2 13/13] iommu/arm-smmu-qcom: Sort the compatible list
 alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-13-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1047;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4qlkXIpajO/screcnHozmWYEhsqRxqVWMGV9cb8adn0=;
 b=ku9MGWJ3g/n4SA+sMB5iIoSn/fJTWnS8wuxtVJXhCx8ML1znDgY0ILA0SMGsj+MXNuuj71iXZ8bD
 ZTVT1H7eBDFOQ12L6qLMqL1bRuGLZ14HOqrXVKTsCzbIlw32UOfb
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It got broken at some point, fix it up.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 2daaa600ac75..e64c737724c4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -251,12 +251,12 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280-mss-pil" },
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sc8280xp-mdss" },
-	{ .compatible = "qcom,sm8150-mdss" },
-	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
+	{ .compatible = "qcom,sm8150-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
 	{ }
 };
 

-- 
2.40.0

