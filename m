Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19611540EB1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52A10F341;
	Tue,  7 Jun 2022 18:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EA910F047
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:15 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c2so10309056lfk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yBKwPOiE2yNJ0h72czELiOyk+g2uWrk6+KM2TvTz5JU=;
 b=Yks/q3su0YHCpP1GZiev8M6GFNTj/3QTyI/Ndrs53Y55o0csQ1hVU4LwAIIwQ1IUA8
 +c8piT29CypwfC4legDBxZZwLyPxAueBvOI0cTL5z0ciBVniJGYgb5TnNRKbyMGfkFef
 XGmf76jAhEZHLHskC+nHi6zFOlIsr0+cUZ+SpDHRQYp5FIJSJ3wmAjATYAnfnzc9bqDX
 vWgAtgUYsKGJiCZg31C+DxRgkODuIMf5EC3TfuPT0UrLuxdnGO3oPuZb6oReRe0Yaw50
 mvCNAEHspgbqg1KrOwxjqEXNCUI4/HaVIl0z0fPopLAIINbFd/2k15Q0nTo2443jmeyb
 IMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yBKwPOiE2yNJ0h72czELiOyk+g2uWrk6+KM2TvTz5JU=;
 b=J+12C/4K1PNQ0ii1HZNz2i0C/eZl7K/E6fblIFY3d/s0alXS2bR3TuV5kn/qkURnPV
 K7CVVjwNDRF6qZJRjiCeudkDu/qQVAsIRoBHCIz7KC83aJrC6zF29fSUDAWtewQpLmXR
 lT9FRZ1eCci/XfNeXqLUh1qasgRqjDdJUz6YKIFmBrjQlLJ8oKKUdOqo5BeoRKd8q6by
 PdJso2DPUcw+nu9KLxRngnJgBv2cGmL3g6Hwt2pcQqs5Qs3poAAh9jIYA9gxV/FUyYGw
 WGnb14vuMM1X3x8aQtoZa68pRPeeOrAolVw4NHoUfg/2gR3q50w3aQEEQzsUM6qgGt/3
 PQFw==
X-Gm-Message-State: AOAM532GDnPSIr1S3X0hz8qqCQ3t8/Txf+OrdCOoSt5RstJEjwjg9oGv
 QQUq7IfJeVDSrxXhybOBidZ9qA==
X-Google-Smtp-Source: ABdhPJy9e5t8nWUlQ5axbawTm+yy688KCIdLqxL6iY8tn6zylCOr28nbh97saNaGf6LTXBhAevBKLw==
X-Received: by 2002:a19:4918:0:b0:478:7e82:86f1 with SMTP id
 w24-20020a194918000000b004787e8286f1mr54777219lfa.353.1654628295453; 
 Tue, 07 Jun 2022 11:58:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:58:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 7/7] drm/msm/hdmi: merge platform config for
 8974/8084/8994/8996
Date: Tue,  7 Jun 2022 21:58:06 +0300
Message-Id: <20220607185806.2771739-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since there is no more difference between the HDMI platform data
between MSM8974/APQ8084/MSM8994/MSM8996, merge these configs into a
single entry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 03d8f97b0cd8..8ae60e97cc94 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -375,27 +375,6 @@ static struct hdmi_platform_config hdmi_tx_8974_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static struct hdmi_platform_config hdmi_tx_8084_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8994_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
 /*
  * HDMI audio codec callbacks
  */
@@ -577,9 +556,9 @@ static int msm_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
-	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8996_config },
-	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8994_config },
-	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8084_config },
+	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
 	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
-- 
2.35.1

