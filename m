Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EF976563E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EE910E59C;
	Thu, 27 Jul 2023 14:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7229210E5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:45:50 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fcd615d7d6so1816444e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690469148; x=1691073948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jsj9jCig1lCkTzaD1Z9O64owh9Iayw/0M/Ni20elvEw=;
 b=YoyeihLlqQRRyNGgkynto8o7g9FOSGTeavQqeE0cYUjD/LhsSl+Eu8YajYJdODvar1
 m69SU9Jon/03j5+63T+1NG2wtN1ZV13JAdQC0NShPBe4Y1d5TfqRB9tqSyW0BGKzLwcZ
 bT1X5xMn8+Lfm8XKp2xtUHpJX0E0p+FFVpRXCt2bDhZILr+OF86fG2T6SC8hXzphbEOt
 vBKtFOmG3NdkWv+2amm2lGIeRr9ySaOQVzmhdM4O3o+hE77MdkbvnW36Tz+aW9zzHLDF
 mqiQ+cLW0EFOcPjNje6o2ZgtSik8yN5iP4wdcw6fxlVtPWsd6qbGGfQB0s+vdZxpKlCd
 /XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469148; x=1691073948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jsj9jCig1lCkTzaD1Z9O64owh9Iayw/0M/Ni20elvEw=;
 b=C2HNqeepP6KlQnPIS5FSKAY2TTLF1OycPQop2x/QN5VEUAgsChwDd9LkonYAyP2y9i
 2AVT77RhSghd/zjWIUOdacu5mJsHAhSiG4s+uoBeJUYDv3Pv+Np8aE90EbvSX1i4b7Mj
 pesjnMDVRvuclTlB/9a2iaf3sNhcv6zNDp0eIR9F8bopY8m7kUrWvhdrQplALeazJGQO
 Wj7UbELgZ9YjYozCsSOyP74F8S8/a27S8XPEPIzt3h4dGRXMPoKeLm4eDkfa5GV3uID4
 ooGyaMkUgZUquRjVwpEdGtrA9VdJ8zQiwxS3G+mQKvTOR82NIalt3IRbxoUMPdaZ3C8p
 A9DA==
X-Gm-Message-State: ABy/qLY85tj2LybX48NoTzNZP1oRbMoDRGa+GWlhgli53/m76W/Zglv5
 BonMJovKpyhw4DPD/xh4Ab0piw==
X-Google-Smtp-Source: APBJJlG6hDNIkILW14/9O6Ck3YY45g/6SexkgaoG+r9Rhso01Xqw7gEbhr9o1HhSUaya2xMk6g6vOg==
X-Received: by 2002:a05:6512:220d:b0:4fd:d4b4:faba with SMTP id
 h13-20020a056512220d00b004fdd4b4fabamr2653154lfu.51.1690469148632; 
 Thu, 27 Jul 2023 07:45:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:45:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 4/5] drm/msm/dpu: drop now-unused mdss_irqs field from hw
 catalog
Date: Thu, 27 Jul 2023 17:45:42 +0300
Message-Id: <20230727144543.1483630-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now as the list of the interrupts is constructed from the catalog
data, drop the mdss_irqs field from catalog.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 --------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  9 ---------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 11 -----------
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 13 -------------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  6 ------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 10 ----------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  6 ------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  5 -----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  6 ------
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  5 -----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  5 -----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  9 ---------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 -------
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 14 --------------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  9 ---------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  9 ---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  3 ---
 17 files changed, 135 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index b5fbac55f127..92530aec3bdc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -342,14 +342,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.vbif_count = ARRAY_SIZE(msm8998_vbif),
 	.vbif = msm8998_vbif,
 	.perf = &msm8998_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_INTF4_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 8000b870d3a7..3034c1b6ed90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -359,15 +359,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sdm845_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_AD4_0_INTR) | \
-		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 7ce2d69d28f6..3745c150540e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -404,17 +404,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm8150_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF2_TEAR_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_AD4_0_INTR) | \
-		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index cea005382456..6291568bef03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -431,19 +431,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc8180x_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF2_TEAR_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_INTF4_INTR) | \
-		     BIT(MDP_INTF5_INTR) | \
-		     BIT(MDP_AD4_0_INTR) | \
-		     BIT(MDP_AD4_1_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 5fddfcce6288..e922668aea1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -225,12 +225,6 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6125_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 893d1271fb71..9751b39ae371 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -421,16 +421,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.wb_count = ARRAY_SIZE(sm8250_wb),
 	.wb = sm8250_wb,
 	.perf = &sm8250_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR) | \
-		     BIT(MDP_INTF2_INTR) | \
-		     BIT(MDP_INTF2_TEAR_INTR) | \
-		     BIT(MDP_INTF3_INTR) | \
-		     BIT(MDP_INTF4_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 61118f648cbc..a9464b856f42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -231,12 +231,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc7180_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index c0d7bb930e8a..ae7cd965c0b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -161,11 +161,6 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6115_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 11c50aa5034b..a13305cad7cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -234,12 +234,6 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6350_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 2182939bc026..bb297c3ef81a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -151,11 +151,6 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &qcm2290_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index f0c0aa90f82e..014a56e585b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -173,11 +173,6 @@ const struct dpu_mdss_cfg dpu_sm6375_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm6375_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF1_INTR) | \
-		     BIT(MDP_INTF1_TEAR_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 2460ced03610..90efde5e9da5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -412,15 +412,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm8350_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF2_7xxx_INTR) | \
-		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index a8dea8f27c41..0a5dcec343fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -281,13 +281,6 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc7280_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF5_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 397fe01125dd..7b1395f9e710 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -474,20 +474,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sc8280xp_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF2_7xxx_INTR) | \
-		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF3_7xxx_INTR) | \
-		     BIT(MDP_INTF4_7xxx_INTR) | \
-		     BIT(MDP_INTF5_7xxx_INTR) | \
-		     BIT(MDP_INTF6_7xxx_INTR) | \
-		     BIT(MDP_INTF7_7xxx_INTR) | \
-		     BIT(MDP_INTF8_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 90a8461911c8..4999f3d8f2e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -435,15 +435,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm8450_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF2_7xxx_INTR) | \
-		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index c9252528136d..401c6c2da367 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -449,15 +449,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.perf = &sm8550_perf_data,
-	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
-		     BIT(MDP_SSPP_TOP0_INTR2) | \
-		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
-		     BIT(MDP_INTF0_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_INTR) | \
-		     BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF2_7xxx_INTR) | \
-		     BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
-		     BIT(MDP_INTF3_7xxx_INTR),
 };
 
 #endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index acfe43f4918c..c72ed0e35dce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -811,7 +811,6 @@ struct dpu_perf_cfg {
  * @dma_formats        Supported formats for dma pipe
  * @cursor_formats     Supported formats for cursor pipe
  * @vig_formats        Supported formats for vig pipe
- * @mdss_irqs:         Bitmap with the irqs supported by the target
  */
 struct dpu_mdss_cfg {
 	const struct dpu_mdss_version *mdss_ver;
@@ -860,8 +859,6 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *dma_formats;
 	const struct dpu_format_extended *cursor_formats;
 	const struct dpu_format_extended *vig_formats;
-
-	unsigned long mdss_irqs;
 };
 
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
-- 
2.39.2

