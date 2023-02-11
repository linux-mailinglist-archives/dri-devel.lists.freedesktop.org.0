Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE5C69353A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA29A10E425;
	Sat, 11 Feb 2023 23:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452D110E41A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id rp23so23929654ejb.7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reD7ufgydQb/wzAhDBjqiAxsD8DG1zYiLa/nkZWI8iU=;
 b=B6pXzBycJ6mVR0Y1CQgTnH8ldSNaUuya08BQrYNAeh/cUNp30oa1m5hbaFMdeUhKOA
 +fZobx3Jk8hxqLD8t5tL7k1860AIQXmFYs7VwL4SAG/tgQPdq8OqngViYxuNZc7AYv6q
 2z0h7kxsLrM9TU+dWUGklyBsQGsmAF70IDVpJITHwt+eHIZIrhBByWYN56gkTfMTQdsE
 H5Fj+WSag+e2A14ZWfY0dNuueDXeWbqZgdVLQ3gBInIe6fSFI6fh6i/R1jg96QjCt71Z
 mbRq89Z82XD6OxIeFFEJNj/xZgRlqeT9OtXsIEv0M/OxkIRuYQrB3T32ROmaqsalo/7l
 YC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=reD7ufgydQb/wzAhDBjqiAxsD8DG1zYiLa/nkZWI8iU=;
 b=dp6ARVo8UTWaBVI0elQd4J6ZYP1QCeQRh7ac/lmAmkOjBPlWAFao/SJpyXaOY6o/56
 fLdon1a/0kCzwypGnj2gjvNi4S+u5X+Y8c2+VgC6BeTQSdqrPV2fr6azDHRaSIPde2J9
 uiyazTplWte7gywI00zpA35gDuhmOO0JsGa++WZMq2tsfJTq7XVdJ2KrBPeBzWhkJiLI
 IEy3z/NsOOK0eN9BdizF4fgYhR0vJ+pFwWS8SHLcf25NFFynjH+zQGQGjLg8Iqcq/taw
 e7XdvjxzllgGFdjmInBOOyHcwQTnXm8ba8Md4ZS7bIAVYNbQZiWyNUhLWTJchZNtEAeh
 HxYA==
X-Gm-Message-State: AO0yUKVbY1o9qTHcJaQghejCbcg0y6elxQMx32SGBN8T847wEY/j+iJp
 SOKzpdpuErDpBgqWteKyJWl1cTRrbjHZeAcD
X-Google-Smtp-Source: AK7set/AivDQUvauyMJ5G4oz2DxdpiZHD6liy+QrdJ0cj4HPagVoJD8Wm/GA0Ya2ws52LG/jAHNqfA==
X-Received: by 2002:a17:907:7d88:b0:870:d9a:9ebb with SMTP id
 oz8-20020a1709077d8800b008700d9a9ebbmr26011817ejc.38.1676157238828; 
 Sat, 11 Feb 2023 15:13:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 49/50] drm/msm/dpu: rename MIXER_foo_MASK to contain major
 DPU version
Date: Sun, 12 Feb 2023 01:12:58 +0200
Message-Id: <20230211231259.1308718-50-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To ease review and reuse rename MIXER feature masks to contain base DPU
version since which this mask is used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h    | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h    |  3 +++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h    | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       |  9 +++------
 11 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 88b7949f803e..3ec1419dd985 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -98,17 +98,17 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 };
 
 static const struct dpu_lm_cfg msm8998_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_3_MASK,
 		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index c8c57250473a..7d6e5d608c04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -96,17 +96,17 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sdm845_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
-	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x0, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x0, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
index 2f849cbaaa0f..f66a460a3f49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
@@ -97,17 +97,17 @@ static const struct dpu_sspp_cfg dpu_5_lm6_sspp[] = {
 };
 
 static const struct dpu_lm_cfg dpu_5_lm6_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 071814394b52..528d8bb4be52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -103,17 +103,17 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8250_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 4be65088de0e..e34789963936 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -69,9 +69,9 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sc7180_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_1, LM_0, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
index 4f42105d3755..339f774299c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
@@ -7,6 +7,9 @@
 #ifndef _DPU_6_LM1_H
 #define _DPU_6_LM1_H
 
+#define MIXER_QCM2290_MASK \
+	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+
 static const struct dpu_mdp_cfg dpu_6_lm1_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 31c12b0415ad..20339746db79 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -101,17 +101,17 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8350_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index a7040d9d83de..78d7c08f7a05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -74,11 +74,11 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sc7280_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
index fb1fbba12a5b..15652b160b3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
@@ -96,12 +96,12 @@ static const struct dpu_sspp_cfg dpu_8_lm6_sspp[] = {
 };
 
 static const struct dpu_lm_cfg dpu_8_lm6_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
 static const struct dpu_dspp_cfg dpu_8_lm6_dspp[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 1d38d1c3e12a..e28529ef1db7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -107,17 +107,17 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 };
 
 static const struct dpu_lm_cfg sm8550_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_DPU_4_MASK,
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0a86428af393..b8143a3c35b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -49,14 +49,11 @@
 #define DMA_DPU_4_CURSOR_MASK \
 	(DMA_DPU_4_MASK | BIT(DPU_SSPP_CURSOR))
 
-#define MIXER_MSM8998_MASK \
+#define MIXER_DPU_3_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
-#define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
-
-#define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+#define MIXER_DPU_4_MASK \
+	(MIXER_DPU_3_MASK | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
 
-- 
2.39.1

