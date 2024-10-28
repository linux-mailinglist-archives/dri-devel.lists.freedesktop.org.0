Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886A9B2F30
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425A510E486;
	Mon, 28 Oct 2024 11:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O+bnyjz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318B10E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:49:25 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539ebb5a20aso4181337e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730116163; x=1730720963; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VqmvUC9mUBY81VNYk4RmO3UDZ88zAWNWEvKa6xvfBdA=;
 b=O+bnyjz7tKUZY+uMKfe/TJIK7Drm6u7k7Iwl+znp9zBZ5gFpawko6TqOmUnf3eG/JJ
 nXif887YQRV0EMNt839qxSYwdg1J534bnKGNZzxxFyEEHQJ0igH4uriUvLLGJ1bs1Nto
 VAZglS29NIpx+MM9o7bPaEVm/Fdm/P6S9QUDztMKba9VeMfR8o7tFE3DIPl6oWFz4sQ9
 GUk/q5MzpX2nDG13hUuwg7p9jv5KwWY1ifveX4VFlLgxACd7pZcv9DeSbCNcrqHb42s6
 SB+u8C4qpv3Iaiv1U1Ldf/BzSaTh6EtLN/I2EzFDxOIytlmdo1LTbGip38gkwBiCig6B
 n9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730116163; x=1730720963;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqmvUC9mUBY81VNYk4RmO3UDZ88zAWNWEvKa6xvfBdA=;
 b=Uh856rbLCaZaabukCvz1mQnoZH7CsfP4dYq0TcYH4QqR6+zQgJeL8KnTNxMJDSO0zf
 ePFebo7R3JPbEiB3G+2HRh1orbY5eHdVFrM4AaLYuVv+rpx/FLBEXN27YSgrhTtq9ykq
 ak1xLKCboMBJNm1oSAE3VYkTWb1HNqNCPDqdB8pAW/jm+0R6ABDNAcg6bdkp8kaJbOED
 Vmv2wguRBhOVx/R+2smBOBJTAlledAXbv+c3ZXmork9BjGFcmIIcqPmPR/zLnK7gOPVv
 DXgiyztAkcCoCsOuvYDkIVoK5NwWj+XQDYrQnmsSJGVzdbluFwrPhkW7eZ58Qe8eP4cE
 ZZxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSFabSQ3kkjFzQT3+HDruMdv4Y8BqaRII9rlGKpQWHdHdaQXzP5+UgimbdYh815BPOOwtssoKj1fI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkV8pS0lC+mrPp6wQNGyFQ0LiKmccakl4MhiZZsWhYuvvTPWV6
 1kaWIPpo6ARMK3xqfy5ScK8j/BsmUcz8a3IUp4bQhjE1CeOzEAlC6dSaswaIpxE=
X-Google-Smtp-Source: AGHT+IFCBFQVwMmMDF/1rXBfglFe8gtvZb2+qpDl4CdOJk48ndJWKJGzOzxpV5lLnpQrnF8u7NjzQg==
X-Received: by 2002:a05:6512:33cf:b0:52c:df6f:a66 with SMTP id
 2adb3069b0e04-53b34b39628mr2359421e87.58.1730116163397; 
 Mon, 28 Oct 2024 04:49:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10a5c6sm1042385e87.19.2024.10.28.04.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 04:49:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 13:49:16 +0200
Subject: [PATCH 3/3] drm/msm/dp: tidy up platform data names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-msm-dp-rename-v1-3-a2564e9457b0@linaro.org>
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
In-Reply-To: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4825;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dFghqADYMbSL+guev7kK1X/DtcuvYC+qJqgVPidJ+3I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnH3o9hSNwX8nlxeM1HjSFvP+l6UmtoczeT12jJ
 6FQLwOy2U+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZx96PQAKCRCLPIo+Aiko
 1QM4B/sFhh+X0mTw7UUzLwrmpaCbAKOovwQlT2iXbBC25RFr2J2HdUS4qFB5bH3dlirFzXetMdl
 Q/Ax97WUoS8BnwAxlsnPIOZOHMyg3bHs8xRSSKwDt+Cha9xBTXaal6s1xUKGEbvtP28UVF9ybp/
 XAbgxBLtE45NUK0ZEqD5zdbcrsiKWt7i0FVpZwuBalqp5MXmd/2qkWwFxrDcOIctz4LFQTZ6Bhj
 esWjhy/xLLYxzuFk9YY7VoYfFlpf3EYs97SCB6xe+JkQMNw40ZQcQ4rwIqm/qStRiBDuOERjz2u
 7CffZgeS2ZYMq0a0EAm7RhmJdNkpr8CNMliNlWZ/juJkJKc7
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

Follow the established symbol name pattern and rename platform data
structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5cc349f672c0..aba925aab7ad 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -118,7 +118,7 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
-static const struct msm_dp_desc sa8775p_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -126,25 +126,25 @@ static const struct msm_dp_desc sa8775p_dp_descs[] = {
 	{}
 };
 
-static const struct msm_dp_desc sc7180_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc7280_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc7280[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc8180x_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc8180x[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc sc8280xp_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sc8280xp[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -156,12 +156,12 @@ static const struct msm_dp_desc sc8280xp_dp_descs[] = {
 	{}
 };
 
-static const struct msm_dp_desc sm8650_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
 };
 
-static const struct msm_dp_desc x1e80100_dp_descs[] = {
+static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
 	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
@@ -170,18 +170,18 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
-	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
-	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
-	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
-	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
-	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
-	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
-	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_dp_descs },
-	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sm8350-dp", .data = &sc7180_dp_descs },
-	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
-	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
+	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
+	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
+	{ .compatible = "qcom,sc7280-edp", .data = &msm_dp_desc_sc7280 },
+	{ .compatible = "qcom,sc8180x-dp", .data = &msm_dp_desc_sc8180x },
+	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
+	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
+	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
+	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
+	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
+	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
 	{}
 };
 

-- 
2.39.5

