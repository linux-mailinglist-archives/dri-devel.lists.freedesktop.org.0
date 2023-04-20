Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140C6E8750
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 03:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FB910EA1D;
	Thu, 20 Apr 2023 01:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94CF10E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 01:15:00 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id h2so952515ljh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 18:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953299; x=1684545299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=epBk3RwMybFn7x+cojKYcg5l0hhz7AzQ1DVSf9AMcPM=;
 b=cS9vI5JIjfj8J5DYtl7wbWoZqTkkyBcfYbcoL2IZy766+qF2N3cm8s+2fwzJadX7jh
 h4ThSfULpRO8hNRz5f9FUs4VPYgK0KPkVtCG1aPp97oiHu8S971v4R7GFD5oYYDR2U8b
 xWxHKtl7slUArOWsQ/lAvSyEQkASgVNx/9Z+CjSLxXXJ1RCLrlZrDdS6CAVLzMw1dDd9
 uG5Tb5AUQsP0HsSspiazkX5vTrhIe/74oislxLAgiWBAb1Q926Oa1krXKoFT0uH9tWnh
 NITl4lAn5Ws7DqeQuhvsg8NIuX8P4F8sdHdxXI0mb3PwKyK8t5ca17e2K8En4rnHaB6m
 fh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953299; x=1684545299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epBk3RwMybFn7x+cojKYcg5l0hhz7AzQ1DVSf9AMcPM=;
 b=MNsgtd2l/TKYCaO5zvFPoatl8TF1dXOs4X8H1bDNdNeMVixkxvy8nL+fpVa6bIrz7z
 OJX6j2dH4kLBpXRqvuoiNWn7TP1QLA+HzIDzX9PyIjIWWRG1a3bWh1DHw0epaDw68x+s
 BM5H0uP9BK1xLOCV6emp87UG/NFFkHyLfKuKvQcJnq3F045Ch5I7SgguUEEue80w1+Xw
 ORj5qbD5wLCI3h8qFAiE9yCd+ZD74L4ZvfFXt0BcglFBR2lh1x13LPQaFmufxN6QoTJM
 eaSjM+W/Jz6I8oWS5F0xZmlh6lTdAGvAb3VTnb8gwdVUhGKpAZF0z81LLPIb+VmN+HY3
 nnzQ==
X-Gm-Message-State: AAQBX9cpp1wUdtwMwa+rt5f7eshOA/Xh5cuA4kuHRYpKXUwuA5+FstL8
 qPhNa7HQfKNywJuFtKgQeDx+Zg==
X-Google-Smtp-Source: AKy350YUWpNDFPEHz1Bt2rp/6DLBMiO2n0njYdAkHWOP1SPtd67PPc37XtdJ8LUX0a45UlRsx+84LQ==
X-Received: by 2002:a2e:870f:0:b0:2a6:3570:72d1 with SMTP id
 m15-20020a2e870f000000b002a6357072d1mr2671823lji.19.1681953298942; 
 Wed, 19 Apr 2023 18:14:58 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a2e2419000000b002a8dce82cf6sm28853ljk.32.2023.04.19.18.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 18:14:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 20 Apr 2023 03:14:55 +0200
Subject: [PATCH 2/2] drm/msm/dpu1: Enable GCv1.8 on many SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230420-topic-dpu_gc-v1-2-d9d1a5e40917@linaro.org>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681953295; l=8668;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QVtQDfqK3It08LFU0wkflkqkKfPf5Fjkojt8olul9zU=;
 b=xOUG96Fng8s7DGGyX1U0c3LFk6G1IUdyzoRkrICsv+NBs8gz7jaefwTfUtt0l+u8UmcMFbyiHZW4
 2qknP6p1Bk8EkbG2nr9397t5boBG8LJt+2uOBuRSbaRhmMx7YGHh
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

There's a plethora of S(D)M-era SoCs that have a GC v1.8 but never
declared, let alone enabled it. Do so!

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 ++
 9 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c555d43ef0e0..a49e4d265b73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -117,13 +117,13 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8150_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index c8a174352ede..80252a96c2fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -118,13 +118,13 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8250_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 00f82b2c18ff..ea89ba1ab0fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -55,7 +55,7 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm6115_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 5f103140abc7..739c1a4f6618 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -52,7 +52,7 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 };
 
 static const struct dpu_dspp_cfg qcm2290_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 257e898fea18..f90eb457ff3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -116,13 +116,13 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8350_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index e4d4e47418fe..27f14a4fa882 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -110,13 +110,13 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 88ad81e03622..0f97b4cc9e25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -117,13 +117,13 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8450_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 /* FIXME: interrupts */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ecc034f76441..2fdf0382cf1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -122,13 +122,13 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 };
 
 static const struct dpu_dspp_cfg sm8550_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
-	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_MSM8998_MASK,
 		 &sdm845_dspp_sblk),
 };
 static const struct dpu_pingpong_cfg sm8550_pp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 69af786b66a0..c4d3aaebb06f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -461,6 +461,8 @@ static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
 static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
 		.len = 0x90, .version = 0x40000},
+	.gc = { .id = DPU_DSPP_GC, .base = 0x17c0,
+		.len = 0x90, .version = 0x10008},
 };
 
 #define DSPP_BLK(_name, _id, _base, _mask, _sblk) \

-- 
2.40.0

