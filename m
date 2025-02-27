Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7809EA47279
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7416510EA1F;
	Thu, 27 Feb 2025 02:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a9sBrF5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C3310EA16
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:28 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5461cb12e39so392156e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623126; x=1741227926; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E18tpw+zq+SBOUnMq7VeJ2wmflhlIp1Qicz+wQlS2Sw=;
 b=a9sBrF5twxv3GitSFZcvqW4Ewi2Pw7nsExfqG8VtQdTpEW49omq/nKVW6gfMyNc6IH
 7hr9Sz0yLnmAVx73WqfRxMswQj5P6f/L9VxQvH4oXSohtWs5yeK56pN7yDKm4nwywI8D
 m5FpbumT8bfbCmCo/OIt4wSCJW3GQWOMBkAMji4jx7y+zujOkq+dcIxTTE/6zghijxPZ
 bPPROYtVx3sx/7VuJjNE0OmSuf97evkCHMFVOTnBXMQvzjQVg2N8RH0zCGEhdHhfkpoR
 xjbSe3kFuk4tQhpp9V+XyY2NzdBAP0oI/SYX11NtWa5Z27y0l4JQvmxNPnSRIOkkPRCN
 QcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623126; x=1741227926;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E18tpw+zq+SBOUnMq7VeJ2wmflhlIp1Qicz+wQlS2Sw=;
 b=XojFdGB8n4AzWBbPFOmWXD1ljF4p07Y+93TKSMVmrJf8sOyUp8ecWwHYM1V/NvJaUi
 XXEy+sB6KG7IZhT0SA8+27yqZzini6ZcITLDdeM8uD8v+ptGNzn6pMxWeRCo3CpxX9M2
 XOtgKN0FY+3FSkSOPBMlWwveTiJi1eMsS2nOsH1m86OV+Z0xjLW3q0vXL49K4+acAoit
 FVmuXAGdTVO6ZkoSBEUwLfpcYy4xfSjNVnDo9KTueT3GBjzrJtSzGGgCEH4oBRTh2JWp
 TVJnH5J2urjgULBF+iY04hA+CSfxxDkdAvzevsX+FyEVKgxLXN3MW/6OV/1/3j0d7nDS
 wZJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbzo2tqLKVFXnJqlH8hSrIxjqtcwbktC3H5zl9rulUT5srn6avijDQ3XbKAdw4NmmIHQOL+kPS+jA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1QMGFyYRkRWFYf49aSv2MeAZybWpS3BjAu//rMQIW+wKBEsyw
 urOLRxqjNNv3pTwtBK0IAbGvhKdmgn2dTvwlaEwRu3tQn9s2qs4EyjC+ucobG4g=
X-Gm-Gg: ASbGnctvsy87aBUM63IvIBA37T6Tc3QXwjgqg1AmtRFqsyoD9uCcY1gPwXdu47PQJrM
 f8bppV/TPzANLiibdsgnz1HWWd9ObXVIayjeX4H/820beBnALbs3iShl13absD+gRO76dH8gs+C
 RG4R6LwAKXQ4xa+VQIMcTxjZaV6ypEa+ooU69FTXbLqx5w9coD0AN/PUdiX6i1VhWKc7Mrbb75B
 IbLFf5vcTBbB4TnrNiW+h8yYH7VNFG9639dsXpj3eGMeYYvkJEnCpxn1CJel996Sm51tnKHHXsf
 n28zosseUGs2vLaeNf+aMZKjbYYNYre/MA==
X-Google-Smtp-Source: AGHT+IH6JvW63owJyZ1PeivaBeeBGjJMDrOP0137MVcsa3BSvMkJ++/F3s9OT2J6ygpsST5S+eTgWg==
X-Received: by 2002:a05:6512:3b22:b0:545:60b:f38b with SMTP id
 2adb3069b0e04-54838edd919mr10462109e87.8.1740623126477; 
 Wed, 26 Feb 2025 18:25:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:13 +0200
Subject: [PATCH v3 5/7] drm/msm/mdp4: move move_valid callback to lcdc_encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-5-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4330;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9z1p16IGdhhxiTm15wIHhYzKoRC0TrBbMnzmOx4bB8I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80H9mWNP5xm0U518aEA7MFJlLbfnScNOLNek
 6ngfP55A2CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBwAKCRCLPIo+Aiko
 1TS4B/4jhTAUlM4rgtB8XhTYa1IaFlN4nD5YNisfDQe3RWIPeYXqasBrLgy3wsErfrpwSgbwk9Z
 dqw1eQFoMXtsQY5rCvEBgyDOyUwen61/QK9vPLoCKjkWlZi/9v5zHT3YMX7V2UaqjZb29UTSuNN
 9KdTVUxqtgOYBzGLe7W3IMI5YtBGFuVe+21N2/q3WZ1ddbaFYbYuSCMcbym4iC42bZctMjHTmm7
 wxgXY/Ny8i5fCoeiew39A6P4vYGvzigO2bJDaPFEAFI4yfVw8lpC25+5w1Yi03d2WZv/mmnJMeO
 9y53Z/5Yh/8tu/PRj6tzTwc+b9VtXnp11bYtMffN9wgXQ4eD
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

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index b8bdc3712c73b14f3547dce3439a895e3d10f193..e0380d3b7e0cee99c4c376bf6369887106f44ede 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,7 +191,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index db93795916cdaa87ac8e61d3b44c2dadac10fd9e..cfcedd8a635cf0297365e845ef415a8f0d553183 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -348,19 +348,32 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static enum drm_mode_status
+mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
+		const struct drm_display_mode *mode)
+{
+	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
+			to_mdp4_lcdc_encoder(encoder);
+	long actual, requested;
+
+	requested = 1000 * mode->clock;
+	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
+
+	DBG("requested=%ld, actual=%ld", requested, actual);
+
+	if (actual != requested)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 	.mode_set = mdp4_lcdc_encoder_mode_set,
 	.disable = mdp4_lcdc_encoder_disable,
 	.enable = mdp4_lcdc_encoder_enable,
+	.mode_valid = mdp4_lcdc_encoder_mode_valid,
 };
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	return clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, rate);
-}
-
 /* initialize encoder */
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 52e728181b523cc3380d7718b5956e7e2dbd4cad..4755eb13ef79f313d2be088145c8cd2e615226fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,26 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static enum drm_mode_status
-mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-			       const struct drm_display_mode *mode)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = mdp4_lcdc_round_pixclk(encoder, requested);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -87,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */

-- 
2.39.5

