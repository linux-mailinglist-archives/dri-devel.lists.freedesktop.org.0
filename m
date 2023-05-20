Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249470A7CF
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 14:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC23210E166;
	Sat, 20 May 2023 12:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA6410E16B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 12:19:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f2510b2b98so4638719e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585192; x=1687177192;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zp5vgGCljU9Pzelevk/Q8qB+omVB6SpjUQQoV9nlSfc=;
 b=LmHGqYnABUafNaPABeP2QjeluLRpjhLp4yPSE7jl5S8sQp5kHG+RNCouuMliy6IgHV
 jKY9FSOC13BkIrlFhDok7DGcFz4Hp+y/bl8IDyzSvInUhlvHooEXQjKr4D6p9NZFDYXG
 BbtWbdh3m3YUon7XvSMPZYmK0uxh6fxbeDmo9JQwOokLdn3bX/vmqMmz5TTjdtTa0Fvf
 ZUb7ykgoAm5GCQ0n0nmGpUuxHIoXC1rKkJ6jYTTKMWNvFGYNux40/6UtpRZltXvh/ZzZ
 PiNS1NnWaYuBnj3+OuGsQBRskvYG2+QOkaWCWwq3d8rb4IjDcQA5SJvVtxUWjbvZSCE2
 ujfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585192; x=1687177192;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zp5vgGCljU9Pzelevk/Q8qB+omVB6SpjUQQoV9nlSfc=;
 b=ST38Z/kvyuWrvl5hPt2fBS9miIjcSrUZm9otDEn5rHRh1OAbE56jYdiMXCVDG5Wfqc
 g4McuwSsQRynNOKmw3GwXb8Prwe1WeKgjvaAlSm8A0FwqYNZW/gtAoomawes6UjiNi2L
 20iDhjvCvGsGgSKGEKVyt96XOVsrnZ5DBWKTiZfubWdaXyZxITlYBaBFQ5C2jhq4Hqb9
 Apb/dIWi4EpFKhxo794NgzAxlU2D0uFQ0gESbJYPzTnY0WFJG5qB/jKlcrK8Hcyvgi1B
 6/Gyi7u+Y1t72I0y+Rkej3ddz4jMccEkaZK2YJtXyR56wZLd58DeneZ8QvGATIeJiTxY
 BVOg==
X-Gm-Message-State: AC+VfDzMHP/+Ti0b+seKqLs1MyD5jwi9+rEFx+TODamLDDT+1Pbf6Nqp
 cVshhYRK9XUM37iLD9txvzG32A==
X-Google-Smtp-Source: ACHHUZ6ICfLT5YYcL2/wUfqqlVAi7l6WT/IslOFa4mfbkqkaH6uDqf1vcuXSp1Xl5GRUx8S5baudQw==
X-Received: by 2002:a05:6512:92c:b0:4f1:4fa4:4f56 with SMTP id
 f12-20020a056512092c00b004f14fa44f56mr1400995lft.17.1684585192697; 
 Sat, 20 May 2023 05:19:52 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:19:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:43 +0200
Subject: [PATCH v7 03/18] drm/msm/a6xx: Remove static keyword from sptprac
 en/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-3-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UGqbGuIs6LlGAaix8p6ok6zP4Iy0VYtXRGz1T9C6CU8=;
 b=m8aH8XPh7v5Dj1EndNzZvNNQ6ljpLmn+70wT7ITChRrR4tAj3G2lR/1F9BTKGmJdgK9WdnE+m
 de8u2FyFLxLBlnBWxeGNWgIDt/Xy2w7uBE+EFfMxZislS47gLLwN2T9
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..87babbb2a19f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..7ee5b606bc47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.40.1

