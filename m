Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444066E8753
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 03:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81EA010EA20;
	Thu, 20 Apr 2023 01:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D1610E7E8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 01:14:59 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a10so1034925ljr.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 18:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953298; x=1684545298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3YAPLxEQHRkQtBPUWYsNYhJFpEVLFDywj/VUg1ddWyo=;
 b=UQsX0S6zrCg0bjka1ONQctLRZ4D8xxZav7b5lB137sSxCBmvsLC4347g0VTNeAipY/
 kt3eYv3W3ziLtPXUgQCnRnIYnZvHGDzoPdJzeGNdqSocgE0SPNuR2YnCirCRO0gobidl
 HI62bd07kuLAb5BUNnz/4IZ1gVB1z2fmlCBmUsxmbQpRbNs1qcb1v2VeJdctfXpT1NMB
 I2lKbiFQmL1QC7/KxFq793KaUCnD7W70aGySPxDMBFEMMjN3wbJGar/GWOjfqwpZ5+N2
 N/AGHt2R1c5iWXNoSBySJmDklbpAXCbuojeaiacaDWkDOnZn4GLXG2YuxYOpfBHVFJ4J
 E7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953298; x=1684545298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YAPLxEQHRkQtBPUWYsNYhJFpEVLFDywj/VUg1ddWyo=;
 b=RBaPTFfG54xoJbppAfs9+bY0Ep48j7wlRUQ1kWFP/wynY4U+HTZEIX7FlwDGOhw6vQ
 2Sqkrhg6i9M5EGVIAopJ97/ShCie5FBJejysqAW9QQ2blW/lPcDy6aMyHQLoSThQr7M3
 aeccdLxp1m1yPlfKDY5Rw0roxX9waidla6s+OpOK1JMhcfxtTOSyVl1o9ntrMy6l/4MZ
 f8/umyWymzjGxoVa0Bm6QPUtmiseDZAR3rKoV8aBXXNFtvDF2FpCZeICC7u3z9ddMC51
 0lC+MdVWM76fCi91nrqmz/LFUCoc8sS14K+AV7yMZwH9wTKVhMYgU3XsE8Z3iVKkXeLV
 j2HQ==
X-Gm-Message-State: AAQBX9eLgpWTx6KtTuc33W2NYAD7reBj1KNVYLkUrYTrfZGb7X9X9BUw
 TnCcZo3J3J7ZnmnOfbKgI/90wA==
X-Google-Smtp-Source: AKy350Y/tkNGSH9BHgOL6svxTMyN0azMc9APjE8LKh0JBxi5ocA3CHn/stNeNLStSUyux7sGsC0ljA==
X-Received: by 2002:a2e:9595:0:b0:2a9:b6fe:18c2 with SMTP id
 w21-20020a2e9595000000b002a9b6fe18c2mr1168848ljh.29.1681953297695; 
 Wed, 19 Apr 2023 18:14:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a2e2419000000b002a8dce82cf6sm28853ljk.32.2023.04.19.18.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 18:14:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 20 Apr 2023 03:14:54 +0200
Subject: [PATCH 1/2] drm/msm/dpu1: Rename sm8150_dspp_blk to
 sdm845_dspp_blk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681953295; l=8333;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Hv4Y+/OyENonA4D9WD0Atvk2X0RWlZqmSfSPeIcfQbA=;
 b=T14hv8IeHuKO46xglmGsqcs8p+2X5l5YCGnQE8/gsMEYDBDiRoCgy+ALP29JpTGlB/9vGa2HQeoF
 3jaHxr3hDzJPUU2EPJNZ6FnzxLHsa2/GxxPZKjqsqtBqVHhF2czU
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SDM845 was the first SoC to include both PCC v4 and GC v1.8.
We don't currently support any other blocks but the common config
for these two can be reused for a large amount of SoCs.

Rename it to indicate the origin of that combo.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
 9 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 282d410269ff..c555d43ef0e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -118,13 +118,13 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 
 static const struct dpu_dspp_cfg sm8150_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 };
 
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 2c40229ea515..c8a174352ede 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -119,13 +119,13 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 
 static const struct dpu_dspp_cfg sm8250_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 };
 
 static const struct dpu_pingpong_cfg sm8250_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 6f04d8f85c92..00f82b2c18ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -56,7 +56,7 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 
 static const struct dpu_dspp_cfg sm6115_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 };
 
 static const struct dpu_pingpong_cfg sm6115_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 303492d62a5c..5f103140abc7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -53,7 +53,7 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 
 static const struct dpu_dspp_cfg qcm2290_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 };
 
 static const struct dpu_pingpong_cfg qcm2290_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index ca107ca8de46..257e898fea18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -117,13 +117,13 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 
 static const struct dpu_dspp_cfg sm8350_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 };
 
 static const struct dpu_pingpong_cfg sm8350_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9aab110b8c44..e4d4e47418fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -111,13 +111,13 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 
 static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 };
 
 static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 02a259b6b426..88ad81e03622 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -118,13 +118,13 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 
 static const struct dpu_dspp_cfg sm8450_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 };
 /* FIXME: interrupts */
 static const struct dpu_pingpong_cfg sm8450_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 9e403034093f..ecc034f76441 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -123,13 +123,13 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 
 static const struct dpu_dspp_cfg sm8550_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
-		 &sm8150_dspp_sblk),
+		 &sdm845_dspp_sblk),
 };
 static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 03f162af1a50..69af786b66a0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -458,7 +458,7 @@ static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
 		.len = 0x90, .version = 0x10000},
 };
 
-static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
+static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
 		.len = 0x90, .version = 0x40000},
 };

-- 
2.40.0

