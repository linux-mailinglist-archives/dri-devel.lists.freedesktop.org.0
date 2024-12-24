Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7389FB935
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 05:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6361110E288;
	Tue, 24 Dec 2024 04:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O0cizP0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD0610E278
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 04:25:26 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30229d5b1caso52094091fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 20:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735014325; x=1735619125; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=857EsT01ECbPhK+ioiRWQ8g1TSEtk3nEPihtdgryD7Y=;
 b=O0cizP0pO9f9njyDPif8eZlwLbgZNlwlDGXf1FniJA1wxeNHLgwIRQ+Ng8NlmZwcwy
 Bj3gjdRdeS7g/STeuJQp6sog80MS2C8TZFa4Fm8tJyjCin15VwAT5FwiVunbeJKjB8X8
 iOiq47y1WmUIYiwVqUCx2cDc8WulmUVTpKMdhnRmoyD1KNCBYvoHHoqQbI3s+noIZqrx
 bAGrBMjxl/ftLlUN16Sp7VnftWhlYVbK5oN4jbqvh9w+i3rJB0FGm3zzEzyYk7KijDPS
 SZQwXk411UdStZIFe6m7orxO/kw9PA9caya5mCIJgOkqa7iqkN5xlr6zOM8Usk1ssZlE
 tN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735014325; x=1735619125;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=857EsT01ECbPhK+ioiRWQ8g1TSEtk3nEPihtdgryD7Y=;
 b=pvxuOH3pzKxdEcIqVlVOPzMi60bG161RYuSaS55scejUCEfzSf/UcUiqHpDppgEF63
 0hnMXnw2kTYX7lbwS9wnlcIbmZlm3LEVAhMbhS9/3qQD097oWbu7e2c+PCVAxnO6P0zi
 i6hFJXrBjXbEkElsWYpr0MBpT2rlQRhS8vAHW59W4YaH1som9b34bhEDUOUR0UrcaTQw
 aqanq1FOIKsv45gMRmvK8BVcxF1xTx1IzEsEHrxGJFgn716tB89jxFdb8JsmoGLkw+gS
 EY84P4jLAc6f0zsLZPqy6sVxRUM4XERoSJ5TWHqxGrGalpjdLz+y9f/vJDlnv4rhyt6U
 BoLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV1rbrKiVO5oH0UvH/aFvmFCmcRpfm51AYq/m8CGilbu2stpoTww2F+r8ZqOC+DDKj8uousn20Hx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzJUSgUziYfh30EWzLad9fLvotuczoI+850r9PQR2Q+Khhjuuo
 z83kkvrUNDV/I2HtblZnm5lEOjRj5ByMDuRVCRXkEVBsyxgaeajfNK6UXjyqrTc=
X-Gm-Gg: ASbGncuTzAW6doAJW4P7BmHURI+g2+1qZ5oiHSPvIIY3U0IwheZKfpgHClW83Z3l5/h
 Shc+SjP7LSsE1Vj0Rn/BJdFomfn0CC387YCDC7I0iWGmiGYBCUDVtaNfz2nvemp7kcvYPLXTaL1
 gloXK/QMFecqN7/TR/fO27coAQIsEUSZas1QC9aw7H8R+RdOrHDJpfGMWHA6Zr/HnqKFZjs2S/t
 qAgFTIDb4Y9LT/KjoNQRX5HYhHbznEuLmqE6JKfq71L6hPYqidX8xBluqsuaHML
X-Google-Smtp-Source: AGHT+IF8ma4sG7lSVR9UTofsmyM/1XLKfAoMakvJaJM5YLPkSH3bsTdJo9tiXjCDDCxv9oZ3I1d7jQ==
X-Received: by 2002:a05:6512:39cc:b0:53e:94f9:8c86 with SMTP id
 2adb3069b0e04-5422956026dmr5349411e87.35.1735014324854; 
 Mon, 23 Dec 2024 20:25:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:25:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 06:25:18 +0200
Subject: [PATCH 2/4] drm/msm/dpu: enable CDM_0 for all DPUs which are known
 to have it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-dpu-add-cdm-v1-2-7aabfcb58246@linaro.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14089;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZXxgbzMdqtz5oJuqlyyNFT3oACaXQzTXc450XsuBBWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnajetUD6q25zFFDMXHQDWn9S7ZhGG+L+e2pnHn
 XU/VAgaD3qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2o3rQAKCRCLPIo+Aiko
 1YFZCACqb+Ni3s/N1lHN1rntXb3CldaE8JwoVWq89QNCYS8zzQVWLzhZBAC1SIqExyXrJ1LqmTs
 22+F8lbaipT76nYzgcmzSBZbjjkbwA8WNvzGy0qlFPzzOCj5B17U6Y9CkRXBF6P5MrEUqkW/GBc
 seJNpDIbUlyhFO+Svb8WPS9ZQ27y4d/NuXBx168PURiuRfj/m3+cyw7WAkdY/6k+hO4EDBxwNEP
 EDJ5zrhrCdDhs/L8n3bXkrNha5VZYGeFAzl+AVbcZ3gUOebcQG6yAWcDU69YaNCSdeG3UCb7uOk
 RTB6vziIY1J57xUKidFsCJABkfte5hzDSK13gYdZ7VrLCidf
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

Enable the CDM_0 block on all DPU generations which have the CDM block
documented in the vendor dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
 20 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f48d793f9d83aafed592d0947f04b..581c9bb4b193280fd6b7c8cc4e3ef8b2e9e95dfb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -431,6 +431,7 @@ const struct dpu_mdss_cfg dpu_sm8650_cfg = {
 	.mdss_ver = &sm8650_mdss_ver,
 	.caps = &sm8650_dpu_caps,
 	.mdp = &sm8650_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8650_ctl),
 	.ctl = sm8650_ctl,
 	.sspp_count = ARRAY_SIZE(sm8650_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index ab3dfb0b374ead36c7f07b0a77c703fb2c09ff8a..f6ee09a148c214bce7bae2c7df868d95c4cf9833 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -190,6 +190,7 @@ const struct dpu_mdss_cfg dpu_msm8937_cfg = {
 	.mdss_ver = &msm8937_mdss_ver,
 	.caps = &msm8937_dpu_caps,
 	.mdp = msm8937_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8937_ctl),
 	.ctl = msm8937_ctl,
 	.sspp_count = ARRAY_SIZE(msm8937_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 6bdaecca676144f9162ab1839d99f3e2e3386dc7..06c8e2226276e4e704852ca542272f61775c899e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -167,6 +167,7 @@ const struct dpu_mdss_cfg dpu_msm8917_cfg = {
 	.mdss_ver = &msm8917_mdss_ver,
 	.caps = &msm8917_dpu_caps,
 	.mdp = msm8917_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8917_ctl),
 	.ctl = msm8917_ctl,
 	.sspp_count = ARRAY_SIZE(msm8917_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..6e5290024274446519f4d5ce3558a861781f82d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -198,6 +198,7 @@ const struct dpu_mdss_cfg dpu_msm8953_cfg = {
 	.mdss_ver = &msm8953_mdss_ver,
 	.caps = &msm8953_dpu_caps,
 	.mdp = msm8953_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8953_ctl),
 	.ctl = msm8953_ctl,
 	.sspp_count = ARRAY_SIZE(msm8953_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 491f6f5827d151011dd3f74bef2a4b8bf69591ab..586ab170c375540d95a19d9f8cf424d0735a29c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -316,6 +316,7 @@ const struct dpu_mdss_cfg dpu_msm8996_cfg = {
 	.mdss_ver = &msm8996_mdss_ver,
 	.caps = &msm8996_dpu_caps,
 	.mdp = msm8996_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8996_ctl),
 	.ctl = msm8996_ctl,
 	.sspp_count = ARRAY_SIZE(msm8996_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 64c94e919a69804599916404dff59fa4a6ac6cff..298c6874957fbb4d369a191cc5fbc28f4499dafb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -302,6 +302,7 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.mdss_ver = &msm8998_mdss_ver,
 	.caps = &msm8998_dpu_caps,
 	.mdp = &msm8998_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
 	.ctl = msm8998_ctl,
 	.sspp_count = ARRAY_SIZE(msm8998_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 424815e7fb7dd858448bd41b5368b729373035f8..2074d18c367589a8f54f58368a7f072ff5a213ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -269,6 +269,7 @@ const struct dpu_mdss_cfg dpu_sdm660_cfg = {
 	.mdss_ver = &sdm660_mdss_ver,
 	.caps = &sdm660_dpu_caps,
 	.mdp = &sdm660_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sdm660_ctl),
 	.ctl = sdm660_ctl,
 	.sspp_count = ARRAY_SIZE(sdm660_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index df01227fc36468f4945c03e767e1409ea4fc0896..d5011e1a690389db7f99672b9313b44b07e914b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -205,6 +205,7 @@ const struct dpu_mdss_cfg dpu_sdm630_cfg = {
 	.mdss_ver = &sdm630_mdss_ver,
 	.caps = &sdm630_dpu_caps,
 	.mdp = &sdm630_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sdm630_ctl),
 	.ctl = sdm630_ctl,
 	.sspp_count = ARRAY_SIZE(sdm630_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72bd4f7e9e504c771d999dcf6277fceb169cffca..2f82cd346456d0f2334f1f47a9b2b7e33464eb92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -319,6 +319,7 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.mdss_ver = &sdm845_mdss_ver,
 	.caps = &sdm845_dpu_caps,
 	.mdp = &sdm845_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm845_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index cbbdaebe357ec4a82a3c3d950aa13792a1fb2d6e..ac1fd7608dbe5ef76ecb9b27706bb23cf10773e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -84,6 +84,7 @@ const struct dpu_mdss_cfg dpu_sdm670_cfg = {
 	.mdss_ver = &sdm670_mdss_ver,
 	.caps = &sdm845_dpu_caps,
 	.mdp = &sdm670_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm670_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..9e6846dcf82eb0004b665389ab29cd25103cd482 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -386,6 +386,7 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.mdss_ver = &sm8150_mdss_ver,
 	.caps = &sm8150_dpu_caps,
 	.mdp = &sm8150_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
 	.sspp_count = ARRAY_SIZE(sm8150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index bab19ddd1d4f97805c1bfba8ba6e117ae77c6c2e..084422182e89020dc64f01fd42c66a018cf02771 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -412,6 +412,7 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.mdss_ver = &sc8180x_mdss_ver,
 	.caps = &sc8180x_dpu_caps,
 	.mdp = &sc8180x_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sc8180x_ctl),
 	.ctl = sc8180x_ctl,
 	.sspp_count = ARRAY_SIZE(sc8180x_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 2fe674d1e05988f39f66a01fedee96113437ea65..d5e595800b9a50e414e1b7df301cacd9858510b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -309,6 +309,7 @@ const struct dpu_mdss_cfg dpu_sm7150_cfg = {
 	.mdss_ver = &sm7150_mdss_ver,
 	.caps = &sm7150_dpu_caps,
 	.mdp = &sm7150_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm7150_ctl),
 	.ctl = sm7150_ctl,
 	.sspp_count = ARRAY_SIZE(sm7150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 621a2140f675fa28b3a7fcd8573e59b306cd6832..d9979f2459c3d204a68e9e81cfd842f59db0072f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -234,6 +234,7 @@ const struct dpu_mdss_cfg dpu_sm6150_cfg = {
 	.mdss_ver = &sm6150_mdss_ver,
 	.caps = &sm6150_dpu_caps,
 	.mdp = &sm6150_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm6150_ctl),
 	.ctl = sm6150_ctl,
 	.sspp_count = ARRAY_SIZE(sm6150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d039b96beb97cfeda629ef2546902f7281c53543..72f72b8632aded2a289f56caa10a181911229b36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -216,6 +216,7 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.mdss_ver = &sm6125_mdss_ver,
 	.caps = &sm6125_dpu_caps,
 	.mdp = &sm6125_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm6125_ctl),
 	.ctl = sm6125_ctl,
 	.sspp_count = ARRAY_SIZE(sm6125_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 7382ebb6e5b2a0c1190e914fb593da93879c0d9a..8fd799a4eb4ddd1ade45a8f056faf7aa961148b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -204,6 +204,7 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.mdss_ver = &sc7180_mdss_ver,
 	.caps = &sc7180_dpu_caps,
 	.mdp = &sc7180_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
 	.ctl = sc7180_ctl,
 	.sspp_count = ARRAY_SIZE(sc7180_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 0502cee2f116e8ce24a0daf995f46b1d693aacaa..cdd3c7a9e273a8a10a1647c8757e2d270db6c962 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -222,6 +222,7 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.mdss_ver = &sm6350_mdss_ver,
 	.caps = &sm6350_dpu_caps,
 	.mdp = &sm6350_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm6350_ctl),
 	.ctl = sm6350_ctl,
 	.sspp_count = ARRAY_SIZE(sm6350_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index aced16e350daa1bf5d24078b2468b5095a40ce07..eb29ba58e765e823d252f2178bf4a6ff65bf2da7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -394,6 +394,7 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.mdss_ver = &sm8350_mdss_ver,
 	.caps = &sm8350_dpu_caps,
 	.mdp = &sm8350_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
 	.sspp_count = ARRAY_SIZE(sm8350_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a1779c5597ae701496f21d3a8cb513189424a484..521cb89a7bf975d55374a520eefbac4a403e0f74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -412,6 +412,7 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.mdss_ver = &sm8450_mdss_ver,
 	.caps = &sm8450_dpu_caps,
 	.mdp = &sm8450_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
 	.ctl = sm8450_ctl,
 	.sspp_count = ARRAY_SIZE(sm8450_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f7d808c695860fd91e60bbb08f42a..135fe90aaef88cba21624e1f180e9a0e9adce751 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -405,6 +405,7 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.mdss_ver = &sm8550_mdss_ver,
 	.caps = &sm8550_dpu_caps,
 	.mdp = &sm8550_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
 	.ctl = sm8550_ctl,
 	.sspp_count = ARRAY_SIZE(sm8550_sspp),

-- 
2.39.5

