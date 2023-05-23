Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884D70D5DF
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1E110E3F7;
	Tue, 23 May 2023 07:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E0210E3F0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:47:03 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f4b256a0c9so1961925e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684828022; x=1687420022;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Uw6zfBHO0opEqODFwIHcb35ENxPJxB7I1/UM0FjZOR4=;
 b=OWDSqxuYCuGGbBJF7j1WnDQYv4UGGmvpjbUlnwPNKXO+hHo88e1/j7D6eHJYzEZjPy
 ZEEmDL+pUDU2NZa2ac0QbemtzYTqkwS/l72KwZk8DEpB/7XFPNBGPb5F6zPdQ9EWn4Q5
 sK4+EwEBMAEENiV6aN4n8cC5F6nf/yzqC3aNxacgoUt3BtJlhUDlYOsn52jyD2qxpANF
 aG/CuCu5EVXRtilFa7ONBNr7+oZ4GOunIwgcnkBzN8HdVzFvVRIUng4Ih3UrE8IpgIuP
 nr5zD1m7vY8tkT55Xe3uwAaM4MZyiP+wJJpyVsUDAvDvS+h+FWO8kF//9hEkv50D1eop
 +Maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828022; x=1687420022;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uw6zfBHO0opEqODFwIHcb35ENxPJxB7I1/UM0FjZOR4=;
 b=D2/OomiI6pU7RfMXlmgc3ldoRXbvjMTXrWmS9QdX4VJPLvrvLoOUyL75Fye7fr3glP
 1Wj1Rm/CAxylMLCtbB1egQcZs1azhfDIegahHHy02CJW4cBpLPiyREcmnRFwR4shHre+
 6SrK/5tMgjRJrtXKanAEsAYFLTpYIfTDPtVwo1/bWs5ne1EN4AHC2IX1p/W0gjsKLKWg
 VcoxxYw54RhT7iQJ8rqd8CoCht9TNJqhKLTEpiCN/txK7wwTyAPnQ0PdAvoEBQf44XgA
 axcsjhO7W06u9VG/gFK/G8mE6Vuf6xD4P/9Z+Etcu3FkanIey64dmiZun3bvEtYb2WX3
 ZgWQ==
X-Gm-Message-State: AC+VfDwN/+FNfyurudVcKoL1+e/m9vdV3JZbLgp2MaaKUR4qcjnCNIIp
 KcKYdv5YPfGJUxnjNc1sbg+qbQ==
X-Google-Smtp-Source: ACHHUZ5je+tCABEpT59rWVo/4tlBAhiBSx3eWKuptU/vYCax7CwZgnwKQkwyRKrX/EuvKpPExSEdGg==
X-Received: by 2002:ac2:5d72:0:b0:4f3:bbfe:db4e with SMTP id
 h18-20020ac25d72000000b004f3bbfedb4emr2136125lft.56.1684828022062; 
 Tue, 23 May 2023 00:47:02 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:47:01 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 May 2023 09:46:21 +0200
Subject: [PATCH v5 10/12] iommu/arm-smmu-qcom: Sort the compatible list
 alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-10-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=1026;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Rc5Y2oI69X8xvGgWy74AqbUqZBcFJifSW/Zzw/OwQv0=;
 b=AxD88SslQYlSx+jDzVZY7fDCrbjY+DxcqY2OWDXBPIglsPSrTy+5sbTPXxbrAqbDZono0TRFx
 8kqS2MfeoXfAzSUSXNSdhEehNfc1/lMYFLm6PLksmE0XSCcxYw8tQoV
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c71afda79d64..3800ab478216 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -251,10 +251,10 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280-mss-pil" },
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sc8280xp-mdss" },
-	{ .compatible = "qcom,sm8150-mdss" },
-	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm8150-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
 	{ }
 };
 

-- 
2.40.1

