Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5A85FD32
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFA110E99F;
	Thu, 22 Feb 2024 15:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GpeNSGV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E1710E99F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:55:26 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso9061382a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708617324; x=1709222124; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nFX079yF3c+/HXrlMKNqGcWR46bajyGBbF6fcN4VZDk=;
 b=GpeNSGV57DwUr9XVs6Klguk7eO7gDfJjFlQe3EBzP4Vvfjx6EXfTTLAxbtdodzef0r
 SibQ/x0DaBoDmPDHUD/iO9vBDpBakU563o+YBFtaS2QJHtkn1eR/DEhgd71Jo1rtePR/
 etNF1OLLT0BP7JmKohYPzJ1aEPMJTsupinqu9iGF8pm+f+4eONt+E/h0I8sIRmQs8O7t
 PsjcEsjT/VBpmvprPIIU729gbfMN2X+nQHSf3OsBVcsq6XylsMkep0Z9oxr7xsRtQ4zs
 tkQ8oLFSxKRII8yySmJZ28NE8RzWG/okAH7PRkbVwwZdAPvCPjJTYS2peAWPDKgUA9D4
 X3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708617324; x=1709222124;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFX079yF3c+/HXrlMKNqGcWR46bajyGBbF6fcN4VZDk=;
 b=OCFAlhjpc7Qggew+Dq0iyLnnxpi4veRLlCS0DNUHeBEvMYL86xahdzC849wPOQKAWm
 eFUIhOnchatGCIQBxutJa6rs1wf97bgZ97+o3XQr3hDW0W2/rR3ntgbnbB/t35mYvRxU
 MNtRHoPz5J1qCOhCjzyZ0rDFRKCJkxlJbzD4uxx7fYv4XFADmea2ETOYmg4ukLUlCpeN
 u6FfED8O4/Jsg07188sT2mxKg95jcqKDHGQ1O0p4PzIY3vA9n38BvZd+Wb31AWe9lIIG
 F3Vb/mnETXd9U4dFhgEqbqeve7uc6eOOqBQm6R3fQ/FpEy3lIw84uP0tfxLkKXTTHfOh
 PjLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSKSx2iWNIs7ed017ctA/ahN/Hxg7s/16KRUw8QSqYjZS3dV0E7CydfuKrJF15w/YoS5I7vxO0Eyk13bU6wiBuFX2++YRMP7MPkTEutZ1g
X-Gm-Message-State: AOJu0Yz48/XN8GoeFhOlmPbmNuX6xmnKKhJid/irrD0Aavgb8q/52RZY
 hgJHJgnGCrMxpEOIc/dP4eJfD/Tlu0mQrm7ITNfSvGQZ8mTxXL7BwlLZlvXeQ3o=
X-Google-Smtp-Source: AGHT+IFpGNh6zq1lLSoBE5N/ejAxjG1/XkYZMx3Zmhjnzdt7yMjL718LXZpcG82z+uN7+glWDmVDJw==
X-Received: by 2002:a05:6402:214a:b0:563:bd95:4e8b with SMTP id
 bq10-20020a056402214a00b00563bd954e8bmr11582201edb.11.1708617324203; 
 Thu, 22 Feb 2024 07:55:24 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 v7-20020aa7dbc7000000b00564e489ce9asm1924247edt.12.2024.02.22.07.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 07:55:23 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 17:55:07 +0200
Subject: [PATCH v2 2/3] drm/msm/dp: Add support for setting the eDP mode
 from devicetree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-x1e80100-display-refactor-connector-v2-2-bd4197dfceab@linaro.org>
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
In-Reply-To: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=UBQowZOtoIlmpAQUKT2yKb1EZAisbZQw+a7N5Tk7DL4=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl125kDIga6LgKuVlvBAhJKhR/bqzkA4C7j1dj4
 o+8TFq5zH6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdduZAAKCRAbX0TJAJUV
 VjFmD/0S2j+eq/rgvUGx98nW2KSv+7jUIOpbdGokBAj/5B3LlEASwGyRnzW5rS4PMK0HDROFuNz
 Ijt0hn4kPeCLLcjl41UZBmFmIKn8m3+/lj2l1U8A+dYI75x1Mk5mhuuE8BF6zYfIxLEDF8eR09b
 hheJJvcmamKbMpvOu/0LVpe+PFaHdkRcxX30aEsmwMcfWI7MQwRrUAp3Q02RdGv8+oi09HJGg1/
 27328sgTy7Cq+Mf4NLMtIAusJMLobdbAibSVNtRRLDUcTNywpkcIzYp9c/gm7B8el9/Nts7iQOV
 4coOiozAcbNP5Z139pNFJtNLUTpxduzWLjTXIvq5vJRe8ZXB+jjTdZevorgfwHVX50ghy16Rh2Z
 gtGftQyGDnuFKEviPj/hs0FZD5DbyHqe9BTQW9GQcZ9okDjrOVWeuiJh8PKXWkT56oNURI0uS73
 IM2dMewWtM7UKjYE7dMMvrkPETD3aB+1TFPNRmaCyY/a9X001s6MhdeUXmay6QJXuT9NQLnT6iN
 Km6S9q9eTCTYD4+i6hvrHVjo5m45vOPcwHqwKMUvv2y++ZDGuYZSTYWZLxftGUbtdkuPnw4OgzZ
 AvbHiXqCaGGDcPUtDz73IM9H0F/CW1JI1Wux7OUC6Dzh4gKxaquETfEYgl3QOjd9evR4OJIqEnx
 ftzXSHXB3BphXLA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Instead of relying on different compatibles for eDP and DP, use
the is-edp property from DT to figure out the connector type and
then pass on that information to the PHY.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 11 +++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 17 ++++++++++++++---
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 320f17fce9a6..bd81cc6bd5e3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1533,6 +1533,17 @@ void dp_ctrl_set_psr(struct dp_ctrl *dp_ctrl, bool enter)
 	}
 }
 
+int dp_ctrl_phy_set_mode(struct dp_ctrl *dp_ctrl, int submode)
+{
+	struct dp_ctrl_private *ctrl;
+	struct phy *phy;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	phy = ctrl->phy;
+
+	return phy_set_mode_ext(phy, PHY_MODE_DP, submode);
+}
+
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index fa014cee7e21..a10d1b19d172 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -32,6 +32,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct phy *phy);
 
 void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
+int dp_ctrl_phy_set_mode(struct dp_ctrl *dp_ctrl, int mode);
 void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e4433891becb..e01b41ad2e2a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1229,6 +1229,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	int rc = 0;
 	struct dp_display_private *dp;
 	const struct msm_dp_desc *desc;
+	bool is_edp;
 
 	if (!pdev || !pdev->dev.of_node) {
 		DRM_ERROR("pdev not found\n");
@@ -1243,13 +1244,17 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
+	is_edp = (desc->connector_type == DRM_MODE_CONNECTOR_eDP) ||
+		 of_property_read_bool(pdev->dev.of_node, "is-edp");
+
 	dp->dp_display.pdev = pdev;
 	dp->name = "drm_dp";
 	dp->id = desc->id;
-	dp->dp_display.connector_type = desc->connector_type;
+	dp->dp_display.connector_type = is_edp ?
+					DRM_MODE_CONNECTOR_eDP :
+					DRM_MODE_CONNECTOR_DisplayPort;
 	dp->wide_bus_en = desc->wide_bus_en;
-	dp->dp_display.is_edp =
-		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
+	dp->dp_display.is_edp = is_edp;
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
@@ -1257,6 +1262,12 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
+	rc = dp_ctrl_phy_set_mode(dp->ctrl, is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
+	if (rc) {
+		DRM_ERROR("setting PHY submode failed\n");
+		goto err;
+	}
+
 	/* setup event q */
 	mutex_init(&dp->event_mutex);
 	init_waitqueue_head(&dp->event_q);

-- 
2.34.1

