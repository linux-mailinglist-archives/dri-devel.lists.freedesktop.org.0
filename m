Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A956A3D031
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 04:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245A10E8BC;
	Thu, 20 Feb 2025 03:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JsB4E7Rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49110E13F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:59:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5462a2b9dedso575643e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 19:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740023975; x=1740628775; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+iQktoZgMXFUuH/VI1uCNDXJ1CPN0nauJB73520LxmY=;
 b=JsB4E7RxWzjk6mQ6PF8zCqefMdjKnNLNPwsirgaBy9a5sdY9Q2Sj+Sk2nuXMuSvViB
 dQxK9bEjUBDdrFCwGtzI6pSinEpkNs0jgc1ukSjncgTQxel8hkJxlcKG4GfhkX/3qv91
 3S/CG+7tXoqUZqosfbSQlJqUa2tdPCu/ScfEsx4mB4NB1Ixwcay9gyTcCyR+ypgSSEDP
 w0e1dFhrkvHVRupT1yyMCD/WpIUmQE8gODLgU1CVtUPp2mf++zHxqxtP0emfebF7E3fj
 YKDfz9NRNCVypYKkj9D+ECuddpmkmNjfrZh7TsOeX/+2TzPwHH57d6Bk8h68EX3f37ki
 OGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740023975; x=1740628775;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+iQktoZgMXFUuH/VI1uCNDXJ1CPN0nauJB73520LxmY=;
 b=ueN7E5iHyIGaNmu2msFj/TocW1Oz8n51n2BeGhF6aF5fdyYsy4tiI3rPP8OLsB3B0D
 c/XPnQ8P4Qv9k2Up+U4vksmxOMh3VuBW2tX14q6vEr9UKhqXxyNGZnst5aHsXpzmqS3q
 JuNUsWyMeWidHatdvMjMpLk12fcZy1BLfO0/cloRqnMtx2267vDwr9bFIAvonLlpqLXh
 51j4fK1kFE+HN/6GRDPcRllpqVkAA6HIponCXM+4UwaX8npoi3zi+AwYAKjmUL4AooEB
 5WY9K+V2ZpcJ9pEP4Vvkd/9SMowX/Qr9PXG0iiF6XPr5bzvG3pNWA3YB9LiuN46BnYSo
 6keg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWu6deYdErW0c3rZVATgQxiQG5/7anQla5oACpI6QRyYyDV0n6BZ3cwspz2eaIMLFsPrL63NOKroQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU9V07BIU/zORP/ZJUHD2nvP3IoopaEM+efGNg/cPmhxo9keCn
 Q4vl1wHQVWNQT39YsRyRjt8UmV4lv9e8L/tKjhvofMuF4793SW1hVBxpiTwX5JEW0FsJC7o8H6L
 F
X-Gm-Gg: ASbGnctgcA2iZA5MhT13KN5WUsue1Lzz8hyeUtKKtJGMFmecMyALmG0+GqkPsKb+ASn
 oN0ulBiqAWHmY5Sux16J00dFqW2chaZjj8kj/pzPIk68t3pBFfb1uKoG4IT76mD2rvQkX4Xl5Cc
 iN1UWGEe/tYfPyz0f1cbfnG4m0VKoYpOIEo+0f7/p09JkWxHBm6tILDOXYFCHGotyseM8xQlqzd
 TqUN5TtcrOdd0jt7eRIhJDiWbcxOSfr/gKfQPBcguhHWggsHH0gc/0kXsfASSidPjyjgGd1ZSId
 bk62qMT8YDglHaO4iH7gnso=
X-Google-Smtp-Source: AGHT+IHw7aa5o4uaJn+nouzG3FdTcLYjCCQsNGddd5XryyAd4X9xtVduXFEX5mFe+RqzhgSoX2paAw==
X-Received: by 2002:a05:6512:238a:b0:545:2300:924d with SMTP id
 2adb3069b0e04-5452fe3f69bmr8165563e87.22.1740023975060; 
 Wed, 19 Feb 2025 19:59:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545225f22ebsm2143909e87.16.2025.02.19.19.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 19:59:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 05:59:24 +0200
Subject: [PATCH v2 3/5] drm/msm/dpu: enable CDM_0 for DPUs 1.x - 4.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-add-cdm-v2-3-77f5f0df3d9a@linaro.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
In-Reply-To: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7366;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=akDkekVVLzHGn2gQgxyT6iyr6q7HQnLI7MIRAAwIajA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntqidHdzz2cllGriTVveL83n6zPQSayzkPKmLT
 Gzym3Re3QiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7aonQAKCRCLPIo+Aiko
 1Zt+CAClEde4yYR1pO+IHb7Op+k5ZVM/BBRba55q7cD5ZwxbefaTOABnp+rGAF1etvxhqaIogmN
 B24Evol5ClsCbzvhG6ixQEVf0QnxrGtsqCSC2ZrPFmjv8590VLiVF1l6SBvsPTInLuWA3GRGg9z
 ohhf/V/jtT1Q6/NpDaLj75PUcIdO7NpSMDio0OctOxK3hydtj16OB1sVIf1RzF3D8tzFuoeK5lJ
 hGdcRmwe7B/Q3tNWDn1ft5axI2i0htG6d2amPNtRXWhRR9E5pcy9GdEw+Fd/1qnrMbatOjrfULp
 6zzaLaIo2U9wMj6nMkHhHbAHKl1JOXtjs5qqGLtGepFzNqRV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Enable the CDM_0 block on DPU versions 1.x - 4.x as
documented in the vendor dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 7 +++++++
 10 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index ab3dfb0b374ead36c7f07b0a77c703fb2c09ff8a..1f32807bb5e5d49b696832c4eab54c05106bfd4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -190,6 +190,7 @@ const struct dpu_mdss_cfg dpu_msm8937_cfg = {
 	.mdss_ver = &msm8937_mdss_ver,
 	.caps = &msm8937_dpu_caps,
 	.mdp = msm8937_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(msm8937_ctl),
 	.ctl = msm8937_ctl,
 	.sspp_count = ARRAY_SIZE(msm8937_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 6bdaecca676144f9162ab1839d99f3e2e3386dc7..42131959ff22020a83c0ea65d79a56fd57c800f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -167,6 +167,7 @@ const struct dpu_mdss_cfg dpu_msm8917_cfg = {
 	.mdss_ver = &msm8917_mdss_ver,
 	.caps = &msm8917_dpu_caps,
 	.mdp = msm8917_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(msm8917_ctl),
 	.ctl = msm8917_ctl,
 	.sspp_count = ARRAY_SIZE(msm8917_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..2b4723a5c67606d68dea905d947cd691bb28eda0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -198,6 +198,7 @@ const struct dpu_mdss_cfg dpu_msm8953_cfg = {
 	.mdss_ver = &msm8953_mdss_ver,
 	.caps = &msm8953_dpu_caps,
 	.mdp = msm8953_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(msm8953_ctl),
 	.ctl = msm8953_ctl,
 	.sspp_count = ARRAY_SIZE(msm8953_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 491f6f5827d151011dd3f74bef2a4b8bf69591ab..5cf19de71f060818d257f95aa781b91ec201d4e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -316,6 +316,7 @@ const struct dpu_mdss_cfg dpu_msm8996_cfg = {
 	.mdss_ver = &msm8996_mdss_ver,
 	.caps = &msm8996_dpu_caps,
 	.mdp = msm8996_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(msm8996_ctl),
 	.ctl = msm8996_ctl,
 	.sspp_count = ARRAY_SIZE(msm8996_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 64c94e919a69804599916404dff59fa4a6ac6cff..746474679ef5b9ce7ef351e2d5434706d6109d33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -302,6 +302,7 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.mdss_ver = &msm8998_mdss_ver,
 	.caps = &msm8998_dpu_caps,
 	.mdp = &msm8998_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
 	.ctl = msm8998_ctl,
 	.sspp_count = ARRAY_SIZE(msm8998_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 424815e7fb7dd858448bd41b5368b729373035f8..4f2f68b07f203a11529f7a680fb87b448305d80a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -269,6 +269,7 @@ const struct dpu_mdss_cfg dpu_sdm660_cfg = {
 	.mdss_ver = &sdm660_mdss_ver,
 	.caps = &sdm660_dpu_caps,
 	.mdp = &sdm660_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(sdm660_ctl),
 	.ctl = sdm660_ctl,
 	.sspp_count = ARRAY_SIZE(sdm660_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index df01227fc36468f4945c03e767e1409ea4fc0896..c70bef025ac4190347f81d75caf4777786fbeaf7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -205,6 +205,7 @@ const struct dpu_mdss_cfg dpu_sdm630_cfg = {
 	.mdss_ver = &sdm630_mdss_ver,
 	.caps = &sdm630_dpu_caps,
 	.mdp = &sdm630_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(sdm630_ctl),
 	.ctl = sdm630_ctl,
 	.sspp_count = ARRAY_SIZE(sdm630_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72bd4f7e9e504c771d999dcf6277fceb169cffca..ab7b4822ca630f8258bc9eb52c0b967e9bc34d18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -319,6 +319,7 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.mdss_ver = &sdm845_mdss_ver,
 	.caps = &sdm845_dpu_caps,
 	.mdp = &sdm845_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm845_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index daef07924886a529ee30349ae80375a324bbc245..c2fde980fb521d9259a9f1e3bf88cc81f46fdfe8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -132,6 +132,7 @@ const struct dpu_mdss_cfg dpu_sdm670_cfg = {
 	.mdss_ver = &sdm670_mdss_ver,
 	.caps = &sdm845_dpu_caps,
 	.mdp = &sdm670_mdp,
+	.cdm = &dpu_cdm_1_x_4_x,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm670_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ec7f42a334fc688bec468df490c81a89dd3d396d..a6bb46b201e907566e88abce945507d1bab51b3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -507,6 +507,13 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
 /*************************************************************
  * CDM block config
  *************************************************************/
+static const struct dpu_cdm_cfg dpu_cdm_1_x_4_x = {
+	.name = "cdm_0",
+	.id = CDM_0,
+	.len = 0x224,
+	.base = 0x79200,
+};
+
 static const struct dpu_cdm_cfg dpu_cdm_5_x = {
 	.name = "cdm_0",
 	.id = CDM_0,

-- 
2.39.5

