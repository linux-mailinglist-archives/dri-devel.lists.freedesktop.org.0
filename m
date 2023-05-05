Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718D6F8B50
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C9810E68F;
	Fri,  5 May 2023 21:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1AB10E695
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 21:41:03 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac8d9399d5so7756451fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 14:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322862; x=1685914862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6Cgx0VgjSWF36kTiyIdxe2LPUi4kT2lQKkyyJC5x69s=;
 b=Gccfie7GMOugjyiUVru/AmbzWeTgn3lIDnsiRORE1BLhhAhDo2q5OeGjUTPqdrkPBV
 42ByFze8DoBI5q1FCMCT3Iqs+bmFU9i+JGnGLiFcDLLR+U6BR/AlJJoHqfO5asrH7mPH
 tUCk2VtfCESPRGvyE+inqnMfl0UcEkoyWEGYVTdWp4vxAJonCDVB+us6Iw92/tmXMKch
 lHBlg/1zA/bh25rGZ61FMJcGz6CSwAPlGrSppo1mdMsb5EsYAZ3p1Ep7bEJedfnQfzJW
 ihCWZ0yivoUcwJphIuwej6UOCSM9grvNt6HRpYB4LNcg3PISN324cVw3HYfU0OzB2t6h
 AIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322862; x=1685914862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Cgx0VgjSWF36kTiyIdxe2LPUi4kT2lQKkyyJC5x69s=;
 b=dtGNfVUZnZwEZXyLl8IK5PBKCwwh7w/jnbIDRjcOhaiIJm3boTA3fn2dCvuhkggzWj
 ZIPuTPQ6PywBF19/udpD2S6KLLE5SObvUluKecW2rMRifTHlzTgQdDJh40mBPjBhJLSk
 Z+cf/106TPQi3ucU/lHXsauKCFVXzhFmMOQN/yGt0vYt5Ko2HbsGLcreaEGdQxMXXLTh
 0opGsDgCam4MrDkdYbCg/Cl9ETTgG/8SuU+wMvnP03QSmcrJCxLmxYf3w6ulysVF/xI8
 ycRyx6uO6JqCAOYb9phNZzYVFsnm4T61KoVwJuedPIqxMp463ILxkpW0hajEProcE1e4
 l8jg==
X-Gm-Message-State: AC+VfDzT7htqso5yGhTgSfoEz9CM6TuMOdw6Fandsj9cIx15JwtqHKVG
 DJ3CQhx1ZqFN+UXCEMRm4Z/bgw==
X-Google-Smtp-Source: ACHHUZ4+K+GhXhvLSXj3jdIBiVBVY1fOjuTIzZpxArJ+LOicJ5uIxrApQrg8YtPi+bMU1mnhxFICzg==
X-Received: by 2002:a2e:9056:0:b0:2a7:9a7a:f864 with SMTP id
 n22-20020a2e9056000000b002a79a7af864mr953234ljg.5.1683322861925; 
 Fri, 05 May 2023 14:41:01 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:41:01 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 May 2023 23:40:37 +0200
Subject: [PATCH v3 11/12] iommu/arm-smmu-qcom: Add SM6375 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v3-11-9837d6b3516d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hMmDD+SgonZLP46KBM866xQojXqpPqEZ25ow2fxLp/E=;
 b=zckkfPprq0LAaufGJdyd08HwqQ+DvDuj3pjCVufSbw/R95EDd1/WxZUQAiuD3r3x7v5RBq0Ea
 rvoL+U9hlerCFPzxbe1MTtGhJLaUTYkcG44IEB3EaL4dsVNizhDuuO+
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

Add the SM6375 DPU compatible to clients compatible list, as it also
needs the workarounds.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index f945ae3d9d06..d7d5d1dbee17 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -253,6 +253,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sc8280xp-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6375-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ }

-- 
2.40.1

