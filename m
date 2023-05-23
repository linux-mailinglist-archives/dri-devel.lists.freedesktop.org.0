Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5152370D5E2
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F2210E3F9;
	Tue, 23 May 2023 07:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1674C10E3EF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:47:04 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f3b9755961so3073393e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684828023; x=1687420023;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mfoMnvnUW9JxHFNrsE+j3PaFEyoaLfNhlabOCKS4wNc=;
 b=oiXMqvz4tlkgl7WCYmeHCUOXABJyn4rczzgyNxIeNDQWawiDhlD42soCU3JzgI6t64
 eGsSN8nuqnay0HDQV6QJXr1JiWwUMCBT0ia4ak/jO3+psA/JLRcjsUy1U1BhGHMFhCmd
 7sa4k5LMTGBLkhIf1Js1aZow8JbI/84gWD5mlxu3XnK5WXothsmOH0fr11itkhQkAmLq
 nLrnedXbeU2ySwu/XAeKPqG2fGo6rVlTIRk9uJR45tyFsejPhStMsol/Mch/+cAoBByQ
 ZHsExKjW/Brn8JamgY1S4cjncz6tx4a/a65X60qHHM/kWW3YL017mmt+S3EizFECxfS5
 VoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828023; x=1687420023;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mfoMnvnUW9JxHFNrsE+j3PaFEyoaLfNhlabOCKS4wNc=;
 b=GvyfQskFkJfKd9UVOtBfV1+V58CMTxpJ65qgphNrpxpDdlABiXq4B0nu17iEyNINDU
 a1mMdd07kwOiIBDWiyYLCIm/up8OamB+S8OdEH5oMUAeHSaoGRx+FKg65f6tcEpYQzJR
 IxzR8PTpaN9jowaWt0xnRwtfN+/kKvAayrw05PysXHz1w38gYxJ9bDmuAljYN75kFg8L
 5ngjkW1ALujTR8MxInT8DqpjMREybZRwLSn19lajOymfqnzk4oNmim+n0fMZQulrlyRk
 9ZPOPMKE2pcoqmfPe/CRUbavtirLDZhyHzfOHT7u7lQFiE9e8h7fVfNzqIfYnwyJSa3+
 hFDA==
X-Gm-Message-State: AC+VfDwZkFGGF7nAzRR4tMH6uh7WEbqBU6G6w6FGAZbstpAJDSug5wh/
 riBHrOzWZPugFAfr+Vtpvs3mgg==
X-Google-Smtp-Source: ACHHUZ7vQpCMD8z+tXopWFPnkqXpWLOyK1g9oM8UkYcSzlJeaWh7JT+2ofWynI9x1gg11eZm6ERCiw==
X-Received: by 2002:ac2:4e4c:0:b0:4f3:aa29:b663 with SMTP id
 f12-20020ac24e4c000000b004f3aa29b663mr4324951lfr.35.1684828023618; 
 Tue, 23 May 2023 00:47:03 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:47:03 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 May 2023 09:46:22 +0200
Subject: [PATCH v5 11/12] iommu/arm-smmu-qcom: Add SM6375 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-11-998b4d2f7dd1@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=U7GrazUMOESVisMUp1R2X/i2E38+ra43yVyDZTsdMko=;
 b=694+VJyXCZBUKckTCLQ5CsRJG+wJkbWuXCzZ6sGhBmhOWdEFH75k2SBgXqgbcBhvOwywQuLyK
 PilQQ3EaWw+A7wV3sA9YtDy/qbCmXblyVWuNqJmC+1aZwMqKT08ZrDA
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
index 3800ab478216..cc574928c707 100644
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

