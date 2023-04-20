Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184836E9F01
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92B010ED33;
	Thu, 20 Apr 2023 22:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9935A10ED2A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:43 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4edc63c82d1so958998e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029902; x=1684621902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UpOebqvOPbIqBzmR7NG/8rdRhqAcRj4FETPLZVvYR+0=;
 b=V0h1ZJjp6OhY4YDWAT7BDJ5ttf7U6iPjAi9Rcptq5HYQkQvwRLcYlr9TSkPIl+3ixf
 chauhhFx1ZN8Dfx0Xoq+3rCgOozjOiJ5wN+gqH/jJGiEYilnTuF87qQjPnr45ExRdyaT
 MbuNpZ3Or0OgZqfkZdOMgiGnx3OGnrLUVx8RI+O20k5lrzZ9pqeCd0sYU7wGItp31rO5
 UM17D2dm3AmUkxEe6xbXTxQufjSkOI7oNM7mdQtuwOnTWrPhwSEr3MxOskjLi1qhvWVK
 gyL7IK1KLNdkklcmVQsrymJiAE9BCiwyr08xJ8xhRwjQHGbTY68hcw1AJN/Quol7kj2O
 WXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029902; x=1684621902;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UpOebqvOPbIqBzmR7NG/8rdRhqAcRj4FETPLZVvYR+0=;
 b=Mf0A0KvRpJ6k4DE5UL6Jif8jLlS+Ygo3IN8owJKTJTiCz+Jobg6h6bsMAWL8IvyLQg
 +8rD7VB25cmOdo+l9WuMu/sUcE5KUqqNaVrXUdZC7Uui3KLfq0F+iDhuUPgE2mvCnRdg
 jXFn+OIZNm5sSEBNoNsaRCK3D+3cTyElibuzP9KhGOUOo+Qpw991plgTP2nIU9FxHiJj
 t0HkqVekb71FLL/maabTswGMDPYn4uzM4Bvv/2G5fZypUim7A5T5IXkpNrnb7hwnFxfa
 eYbzEOxZU34Y3/AHczv0oWfaWYj1w8cl6fVyod8FNG9WPVvdmZ/3T/7TNMynPTSt00yZ
 RPjQ==
X-Gm-Message-State: AAQBX9cZLOP8aBbPqGugNHplTowYxYMh3y1M36ZZgTUvbFj+iUAxSeGf
 bYTrZH9s7Wrm3dHtwK94k7bQVw==
X-Google-Smtp-Source: AKy350ax7WiiZ7sdUoOrCa6zqvzc4la3MYIVSoMYrIr6DOVfjS5Y91sf5cpvtfvB3sHU712yldza8Q==
X-Received: by 2002:ac2:5204:0:b0:4dc:807a:d144 with SMTP id
 a4-20020ac25204000000b004dc807ad144mr905144lfl.39.1682029901820; 
 Thu, 20 Apr 2023 15:31:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:21 +0200
Subject: [PATCH v2 12/13] iommu/arm-smmu-qcom: Add SM6350 DPU compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-12-5def73f50980@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=884;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=evqQGLlTFOqHDOuiOF22m7xaO9yZbbtIXtz5YEiBVu0=;
 b=fwJivKHapHtCQymUF6p9dE6yEgcAcMF20Cmrb7Mbb0/7cBIbuYECeiyai+qF+fsnSn/sBz3WaMRJ
 hzP05E9EDpr2STBp7wbUGqCGO5QmuBw56ySUAbFzHTnr6Xh3ffb8
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

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add the SM6350 DPU compatible to clients compatible list, as it also
needs the workarounds.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 995ab5172883..2daaa600ac75 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -255,6 +255,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
 	{ }
 };

-- 
2.40.0

