Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF37A8F99
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 00:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A787B10E554;
	Wed, 20 Sep 2023 22:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1D10E53B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 22:46:11 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9aa2c6f0806so27118466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695249969; x=1695854769; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IdSuAkG4VTCtPFnst9Jv9C/wFXy4KDDgAI8d6hl528I=;
 b=lIr4v5sQlqZL8Xnq2AG/p/tZNbgL0MD13YFhz2AYkSUxu/ihGcFQEKwSukQLbYFUSU
 yR4bXBspSNW1zhBP/BB976pD+6951RzINjvMBvUpEicv3v/l2+bWZNKvdhSvfgUbr5xu
 THuDQJsg5hXjQKfRmaWFB7O3/fTxM08CZzS4z45BbgkmEX/m+ev4nwT75kxuTD12am71
 Zga08z3qm+QE424BJ9AARk7QWGJupDYX7rfWPFr99jLZ0SwZM6C5CzDhpXbRLKHe27rR
 lpZD0w6d55XZDnn77855Ngy3+QTSCtckuZ/UEYVmjqwkcckJDd3TiXmUTdA6sVymdPrr
 Kzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695249969; x=1695854769;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IdSuAkG4VTCtPFnst9Jv9C/wFXy4KDDgAI8d6hl528I=;
 b=ESUCBgv8NSfCCjGbVRzIV5AYe+0eIuqmFicrBctQrzr3HtkdVZb9ktoEjW6bjTeK94
 HG4af82lpHYZ0ncW+WvMUFao6BnGwp/y8cAa/8VaAuChRmYmKV/NksgcKLW5QX7Z46dq
 AR/AVCPMvUEw5H1hbtfIqSgaFYLGubWHOjHO2GPtptv5rWVUO4poT0zn30bPXkd9Yn7f
 vUMVPbFkydKp+YqTBQcsBkH+yvHSAT+wyZqIDvqk39WwSwIUZRCqYpLGGoDWLVysQhK6
 neR/8dOPhPPYShrHoP8NfuA7Iwxl6DXX5V/3xxJ601i0zyBOF9s6dkPwZwwCRlJkG+PA
 Sa1Q==
X-Gm-Message-State: AOJu0Yz9kNWnOsq3Gsxrxvsc85t0T3aWYqoC1p8V027bdHLOGsf03C1w
 +GG/1nfrtUEv4sG7MhKmLaBQmg==
X-Google-Smtp-Source: AGHT+IGmn7SRDvmNps2xltWiAV/8ypq3MJY+6zz/ooTGSLT7+Q/E1kHCXDOP6lmDewqMh5Dw1MUueQ==
X-Received: by 2002:a17:907:b609:b0:9ae:61d:4248 with SMTP id
 vl9-20020a170907b60900b009ae061d4248mr3049732ejc.48.1695249969770; 
 Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
Received: from [127.0.1.1] ([217.67.225.27]) by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b00992f309cfe8sm118285ejm.178.2023.09.20.15.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 21 Sep 2023 00:46:07 +0200
Subject: [PATCH 2/3] drm/msm/dpu: Add missing DPU_DSC_OUTPUT_CTRL to SC7280
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-topic-7280_dpu-v1-2-6912a97183d5@linaro.org>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
In-Reply-To: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
X-Mailer: b4 0.13-dev-0438c
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU_DSC_OUTPUT_CTRL should be enabled for all platforms with a CTL
CFG 1.0.0. SC7280 is one of them. Add it.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index dc3198335164..b6a59d7b94c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -164,7 +164,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN) | BIT(DPU_DSC_OUTPUT_CTRL),
 		.sblk = &dsc_sblk_0,
 	},
 };

-- 
2.39.2

