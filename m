Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D770AF29
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 19:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC9010E1EA;
	Sun, 21 May 2023 17:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E54510E1E2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:10:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f3a166f8e9so3362460e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689031; x=1687281031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZvD39ofO02L6Mafll8o7Cr6RvsnfAzRure5kJuG8gc=;
 b=DgXi+Di617041RttyVDbYxDEjiVAOvDn2IVl7JBf6snFs0igxL2LwsL2PLGBFT6dZ8
 WVqA/5eBQadwZPASTs1SOHOWL6j+tyttILnzUxhVbcsuHMVYtQa7cBXLwt6z/06qJX8+
 w75jzmF94bf9xVF5IZKLjFjdCJXS0t+yWnTqisab5fk2FYFSBsEBpor4OVE/RzOJJDbB
 MfP1NSPajvmO7VUA/a7FHaJZOusFbbPDtnsBPBTXgFQJ3x5NNMvkHP+yeWRGmJ7ujbVi
 Zu/zAIaTSCYpxvBWRoR54J/E7KMLIPTgRqbiYZM873wSVsLtEBReVKfbmKP/Vx6OILQi
 ABuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689031; x=1687281031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZvD39ofO02L6Mafll8o7Cr6RvsnfAzRure5kJuG8gc=;
 b=ajpKYRDgcZT7ixOZ2fbToUX60Y7hWJ1R1hBuTOG0pgITxiK7qkxok0GWg0vh54ivkw
 ecXj8o4A43TOW1HEZYH3Z0HkxhyzyD7q3pHXTYussGEcVaAPV2c7Fk2ieeJ+kc8xVzd2
 BxS/mWngb4Sm14AH5veJ2xzRTYeTzu+RiIPS0nEX/CCN1KlnFPYyTIs5yMlx/r6asRuR
 vKDkJ5vKkxGab3XQQ2cMs6eJ1pxZfpYzVCrLrPavXSTC/EK2T1KpypZhgji4TpEwYZ8C
 wOLysB1a8AzQ9n0ddFe7AkMOCdXdkowPL3bAEgoKRZE/B05WdSEhIUp1Y1JcSDgUeQ8c
 5JMQ==
X-Gm-Message-State: AC+VfDxAHA3+6GDaWNVLcq2jMKFlO6lHxLFVSTa7rhD0h+UDX7Wjr9UA
 9YVVBoOCnAMCNwI9OjC/It+v/A==
X-Google-Smtp-Source: ACHHUZ5GQD33SK2SC1NesPQnRiaM3+LEIvK0slB43sb6fdz7M+lFdoO63gUoLm36yJCrTw7M1x43gg==
X-Received: by 2002:ac2:530c:0:b0:4f3:b18a:6494 with SMTP id
 c12-20020ac2530c000000b004f3b18a6494mr2500887lfh.22.1684689031732; 
 Sun, 21 May 2023 10:10:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:10:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 4/6] drm/msm/mdss: populate missing data
Date: Sun, 21 May 2023 20:10:24 +0300
Message-Id: <20230521171026.4159495-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we are going to use MDSS data for DPU programming, populate missing
MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
programming, so skip them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ed836c659688..9bb7be4b9ebb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -264,6 +264,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	 * UBWC_n and the rest of params comes from hw data.
 	 */
 	switch (msm_mdss->mdss_data->ubwc_dec_version) {
+	case 0: /* no UBWC */
+	case UBWC_1_0:
+		/* do nothing */
+		break;
 	case UBWC_2_0:
 		msm_mdss_setup_ubwc_dec_20(msm_mdss);
 		break;
@@ -502,10 +506,22 @@ static int mdss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msm_mdss_data msm8998_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 1,
+};
+
+static const struct msm_mdss_data qcm2290_data = {
+	/* no UBWC */
+	.highest_bank_bit = 0x2,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
+	.highest_bank_bit = 0x3,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -550,6 +566,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
+	.highest_bank_bit = 0x1,
 };
 
 static const struct msm_mdss_data sm8250_data = {
@@ -574,8 +591,8 @@ static const struct msm_mdss_data sm8550_data = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
-	{ .compatible = "qcom,msm8998-mdss" },
-	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
+	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.39.2

