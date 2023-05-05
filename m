Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861396F8B4D
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF21110E695;
	Fri,  5 May 2023 21:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A886910E68F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 21:41:01 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac89e6a5a1so12843521fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322860; x=1685914860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ppRfvpEzKntx7DzSp5zW1I4Fc3JFfOMmEmtjxYhv2RE=;
 b=R3nz/yc4RKI+HKc8qf/CgP4sa5/occ8xEvTKS/qhoYNoPxZW7k/tEOgBf9Il8un/yP
 iRxO9fomYjGWCfknkCXi8KznES714HRBdJPqrBElSXfSlCCTrtdrYqPFsE2vKFYoTOJg
 t5DiIqJZgA3nCCL7Biv3PIRZKWmM+EwCx/lAMbZyxw9oS8Yu2MpC79CIHgKx4j+68qGX
 uI96O9JZKvl8uYUOczRzmWy/yBvpBi1s1RAvpBMvypuESFlE5w/AWQVZe4lqgT1i//5V
 3YSJhnPyZGfKrBBfc+0ErO1wkWkCWCDr6i/lEnz4XK5KXRZ7PGZMkNW6SDIivzqPzroq
 o0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322860; x=1685914860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppRfvpEzKntx7DzSp5zW1I4Fc3JFfOMmEmtjxYhv2RE=;
 b=JVIppJWP7r118RbJPOBLtSxeF10RH0SOhZ6hVNTiXviFHQ/tt/9YmDRv7qMxFghx7t
 T0Tt8gWvEv1WFIzF64NW9ZQy78F5LRjZfZjeopRit1/8uaYswAPsr0yfCtUbfRC9j0uB
 AoTsxOrff7SCe46/S4C9Kwg/3yX1DyPEqrTrhg3KY9vfzf7fKydExfDBMSh9raIfip5x
 eS4EYQfO+no5+b94IXKsYWV3Ur2ImxUOIvpHDGkes24ynU/kfBlsQhjCNH5aEI9jxlZl
 vWXmm51KLuGAa3ENvu9zCLuAvUCKkCMIMU8UGW+7rMZOQhRlqoAtj0RoVe5b2+u04pmA
 cLVA==
X-Gm-Message-State: AC+VfDy9ArFCpdMC4SkV1P+sLfqmAKtwYmHQs5HjjeR/Rbp5OaQ1CGHe
 sBcP1jJQ9iDQFwz3mKqCqihIzw==
X-Google-Smtp-Source: ACHHUZ5TWav1X9X/ALxvs/0XM5r7mThgrubkXZrzJkCS8NbL4zVainf3e/1qHa6k3/M1q30PkS1m2A==
X-Received: by 2002:a2e:9211:0:b0:299:bb73:fcd4 with SMTP id
 k17-20020a2e9211000000b00299bb73fcd4mr806540ljg.7.1683322859940; 
 Fri, 05 May 2023 14:40:59 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:40:59 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 May 2023 23:40:36 +0200
Subject: [PATCH v3 10/12] iommu/arm-smmu-qcom: Sort the compatible list
 alphabetically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v3-10-9837d6b3516d@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=965;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9/++xt/utIOxLufVN9PZF2yMVmu78Xo8NRamuKy95SI=;
 b=W4vng8UwOpFtLvkhYgHEBma6qHU974GMhSHhkYHxlHjBzkNdxo9TfDuc1S6Rp7aMdSC9LKIwn
 HplM/nY9V4gDWs9MiUk4EMJk6SU/76Otxvj2rOjLu76AsmwlZtfkUpn
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
index ae09c627bc84..f945ae3d9d06 100644
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

