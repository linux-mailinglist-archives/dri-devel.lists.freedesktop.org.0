Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921A7242C1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 14:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C75810E35A;
	Tue,  6 Jun 2023 12:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F8610E352
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 12:44:26 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b1c30a1653so33476351fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 05:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686055465; x=1688647465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mfoMnvnUW9JxHFNrsE+j3PaFEyoaLfNhlabOCKS4wNc=;
 b=V1ReI/T+XetTpZFV6pPbBNshd5IFECMTZE+/Ns0lqS2R+pNJudcsgIMQlDZyyK8ZXu
 mwymOckDZ9+J+c4V3PXyZWiExBZkJQkQz6Sa+M8eqGcjD0ffi7Uo+JJyN3bZ0bEBJ9L0
 fwhuoalot+ziIUjYt0vgKeYjSkCGgJbjnClOH9mqB7keqlTTmb20Aq2633UiOSKnclht
 3u/rFF3iTcVM2P4fAhNUFEHyk7JTbpSujYZtFRdnrXbpY28AijIHHgm5LL7kUXXOuAdr
 6qfvmBh6UjMSYb8YtvqJQbqXf3gS2zrT9YuAmKyI/bbe7fXEyAComsn5M7BBwjFmLry1
 9/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686055465; x=1688647465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mfoMnvnUW9JxHFNrsE+j3PaFEyoaLfNhlabOCKS4wNc=;
 b=dx4h1az7QKRgaWryJS072Ev7puritqfooi2zFi98xydE0xMdprzwoHCqMdUXKecSFU
 v7V+qEnZcsAsoZO0j37vnl9fv15mU3g3UKtb/3V5p/djjg0wgXtxc/WSyY0hqatouhH4
 2SgImttXrX6DuGR6r5tTMMfIV6Fg7WDsXiCT78Z1XWXcqQIkh9IedpU1GooiytO4tfoK
 Anahz1/MmG0sURuwG8471Yd3jE6qgh+3NuWb+O0iRKXGsIAj+357cMR/YX+hB/ZU7gMp
 1NmfXEnQAVlM7FX58hZKq6C9aO48EvUoUI4MF5i8sW5eIu98rKBS7sMWeTUbqllpMGKl
 qWaQ==
X-Gm-Message-State: AC+VfDy26VRiwNpSGsNl1sdFMGpXLNcaHP05Rg/VXlnWgSn7wFBf06SB
 Rm0M/jpjAoVaNjtIaJp2b07+UQ==
X-Google-Smtp-Source: ACHHUZ7ekWTowrPVlra8w+zZoWxewe/oa3lUa6JCxAgmo+hje0H7GiRpgvh8WmtcKUSxXWPZeV25AA==
X-Received: by 2002:a2e:3c02:0:b0:2b1:eb9e:20df with SMTP id
 j2-20020a2e3c02000000b002b1eb9e20dfmr1073937lja.17.1686055465236; 
 Tue, 06 Jun 2023 05:44:25 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a2e9f17000000b002a9ebff8431sm1830823ljk.94.2023.06.06.05.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 05:44:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Jun 2023 14:44:02 +0200
Subject: [PATCH v6 11/12] iommu/arm-smmu-qcom: Add SM6375 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v6-11-dee6a882571b@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686055444; l=919;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=U7GrazUMOESVisMUp1R2X/i2E38+ra43yVyDZTsdMko=;
 b=jxGg9uqgLp6Xj4teEsBXHZg3TUHPabmerE8XQFJme0dKqJNcl1H0zer/Z3ueyg2C8OOTX/lsn
 lsiNsc2XIogAgDJnhIjXPMLCHVQZk9ZXI2zac2qD51AlEO2+Dsa/P9J
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

