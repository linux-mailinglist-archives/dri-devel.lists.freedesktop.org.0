Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D2917033
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 20:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66C10E189;
	Tue, 25 Jun 2024 18:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RgRLN5iX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ABE10E712
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 18:28:20 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-57d06101d76so6415241a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 11:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340098; x=1719944898; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PcWoGGIEC7a8K4XEAMfnShumcqiU+VC3T2hAJ7CQxuk=;
 b=RgRLN5iX9LCaWun5mIDkn5GWBSuSlIZ55OHs7kZfqY3ZOIEzdsk2lMQCuCUsYVUW0k
 Ymkb5UfQoNP/Jk0zA6Rq8xP1kLrqDc725CsREWWXhjTOyP5f4MtZiIBfUk7uVFWWxyLC
 YPYWRModhHFjEeyN9zzCkIsZWgT5LHogPykBulq799QpLtFovhCVe7STpOLtnYB4jM+V
 pyartPgJFNnrj8zVgMHf+bkkm8kgCf/30kJdC636s8fGvW6Mn7BHvScLiu/vLOT3gdyS
 9CasbXOlGoccQwHaKh02i/aY0xmOQm2U5OXsSWDgul0c+mn9eFPdZd498jQepqngTYFY
 WvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340098; x=1719944898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PcWoGGIEC7a8K4XEAMfnShumcqiU+VC3T2hAJ7CQxuk=;
 b=pGDE7a/MLK8yvNetAi3aZgNdqxl+Q3ri03oajxEXWqKt0dyCeSoIOi4PxpEQ4Ewl0T
 SvdL8w3YgBvFOmuA8/60abXqZcj0QMjPRskGvFQgkOeA1nGjf93gyHPylDLmQhfCj9aV
 VAj4GLiSoTEQ9RfI4OKjg1LC0lfWBKlFkya95b9Ixt/P33l3P4LKUJREfu2YspjPK4CX
 R+9YCvIyb4yg10mXec9O0OFWnw7FjD9VQe+6BlS/ceUxk3BgilBnc28s6tEkoNNYtpw4
 zs1DvQBvTyBTzN6CfqDBzm5sjG8sJ3SFjKQkiAZlzwrOgCEfT7fqY0LQ64CzclraF6bh
 7/ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsdEpMP5ipv0twgzczV6oFTVPhgVApm9Z2WNSg/DLnmvQ/bJqQiKdsmPkU+oeIHLKGo3XLvhqi9yvPQkZl0MQ5jONvdXNSB+JUjvY/zcHf
X-Gm-Message-State: AOJu0YwZIf82LBAFjTQPdsd3phBNjUe3/ziocXb9N2ISo5zEB1dbP4Fr
 BSxAIwOuWbjRIkrRW5uO5b88d/ja5EKhervY6Zg0jKpVgE/o6MTDvUzqGwi+N04yIuonU/OeD8Y
 byiI=
X-Google-Smtp-Source: AGHT+IHH9Hnr7bNyOy7pplC6xVh0aDu4XjTvNl6ry3li+pWizfJqcj812ToaosLCAUB1mnaROqNCTw==
X-Received: by 2002:a50:cccf:0:b0:57d:3be:5ec2 with SMTP id
 4fb4d7f45d1cf-57d4a01f21dmr6022510a12.30.1719340098207; 
 Tue, 25 Jun 2024 11:28:18 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042fd72sm6323136a12.48.2024.06.25.11.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:28:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 25 Jun 2024 20:28:07 +0200
Subject: [PATCH v4 2/5] drm/msm/adreno: Add speedbin data for SM8550 / A740
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-topic-smem_speedbin-v4-2-f6f8493ab814@linaro.org>
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
In-Reply-To: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719340091; l=1481;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=pgXB3ku76GP+Ynds4TGlmCZD8EhfvV2JMzgzNC6TMuc=;
 b=4pAQCD48WMIG4yPsA0ws8Nht+e2p4Y2ez7R8+XZVKTh1CmihZSf2KTi89K6tp6SMOv2htCcc3
 eDOPlXUrflcDo3HEbFZc5BtkIKqfE7vvJ9frwICe6+2ScwBiA3Jwcrx
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add speebin data for A740, as found on SM8550 and derivative SoCs.

For non-development SoCs it seems that "everything except FC_AC, FC_AF
should be speedbin 1", but what the values are for said "everything" are
not known, so that's an exercise left to the user..

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 53e33ff78411..8f280d69ba71 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -11,6 +11,9 @@
 #include "a6xx.xml.h"
 #include "a6xx_gmu.xml.h"
 
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+
 static const struct adreno_reglist a612_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
@@ -1208,6 +1211,11 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
+			/* Other feature codes (on prod SoCs) should match to speedbin 1 */
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.45.2

