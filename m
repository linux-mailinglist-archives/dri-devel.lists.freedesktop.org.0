Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FEA9F26B1
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BA589D30;
	Sun, 15 Dec 2024 22:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oAbzapCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7367810E4F9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:24 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3004028c714so35896571fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302663; x=1734907463; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XWnfiMNCi4KOmkp+j4DHxRsO+TL+A0SocC5CU/IrvPE=;
 b=oAbzapCNAXeqkiHigdQL2cwGFhBgxERZxP/umN/RRP/n3w1DDoE3TglpN8DhdTBQg7
 81WM19upsZRiG9Trh10B4Eqv9KRweR9MJMwRUVb8oYI3Dh7GY+PL2rm1pYAKkc9hitER
 wZBEEMMZ8SMBNGR404TEWvToE8ik1/nFaawEy6ZfVWHEav+pSrJxD6uVe9tktGnZggpK
 MUmd9hzWoSZMABqnnY0Wam/IMsH3P+Ms6aIuD6TokZveidqraxqAPNI5bwsTvNJky30j
 cehm0m0iYcQ0wnUoVL95Jskezeg9yCDufFupJJPJ9hpzgFlrpL/DyrQzEgOmXGJTMJgW
 fNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302663; x=1734907463;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWnfiMNCi4KOmkp+j4DHxRsO+TL+A0SocC5CU/IrvPE=;
 b=oE3y1AiB2x/mZfWfHlR1DkqP5iJFuhoCKI1f0tZMfrw4p0FeqpOjycNeDtKgzYzecE
 dQfnnDcqfMNyFdo4t2FX8ahyhHcju+2/Y77hRa6d36PgO140iy4kloDk8e94utbTVzdO
 tGIBGz7wXOebfBUMPTuKEuNQpmh8o02PBw64RMpMjlyMdzIM8LDAjWzJxhquvsz9S6vf
 XNyjEbpqNJEfUeXXgqk//YJHdiZTAWjphurIAtoabxi+e4BVX6+w8ylR+Q53OlTjdeDj
 Z3t6lEdkGFcLwKYD3yC+02tucKZmpME6HzR/zIwnl/v0Gm+NLHXnBdOcr2t6KS0LpjkM
 ta2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMTgXF00I+HZHFC7uXxIwjVY4w4FPxvlxcQGYujYwoLRJ/tXRFQiRXOGH9HgqltMekFddyG/I0Rrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt+VGv2lJYWp+cSoSEUJTYrWxGGnNTSY3dETWdq16I9oxzi8H2
 vstPLFLM9YlSbis0c9mLWv8I2ctfs49kQRlJNv3ZD1mhmRsGtEe0i2oKPrRmxaY=
X-Gm-Gg: ASbGncsoy2jqXM2KpCy5NnbSumVw0dpDZnPKBIFHptGISPNX0njeiL32bnfaytHHiW7
 TxhjmoaBIYsIovCsvkAVEoJ7N5mFKyrZVR4W+tI+jdlQbJuL7NxFsI/C7qhYTip+LR3gMVUQfxv
 C4UE1cHt+5J9B/imlBIDa7bPWzC7i1Q3Z619kJ2X60F/RWuEn2pwWSwhWHKjgpB1x1jqV3/ET5H
 k5q0l7brBe44FiKopiNKeqOBpe0wvMe2vWP/xfXcjo7pPBn69l1J6L5c6JZ1yzo
X-Google-Smtp-Source: AGHT+IHLBFoByH+x3/+UFbGTSbk4/0Y+TqebI1uovZeS9UilX2qFVz7bVp+R474fEQmn407fUfgEjg==
X-Received: by 2002:a2e:a583:0:b0:2ff:a7c1:8c55 with SMTP id
 38308e7fff4ca-302544ab007mr40923311fa.28.1734302662760; 
 Sun, 15 Dec 2024 14:44:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:09 +0200
Subject: [PATCH v4 04/16] drm/msm/dp: drop struct msm_dp_panel_in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-4-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3950;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3MyLXDCoSNMrI8TDXI5uVPWdVRPsKv8qwhJVKH5nFNw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3p89M6Ju2veFlZ/qIvxPMR2hbNqtXHs3ikz/x1i9Fa0e
 q6SsWdxJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8qmTg2G5KktT4K9NZ6/f
 ez+tc0vT17pXKtLmhsY8d3jfn9FXEmvhbpR+/EjmywTRb/nLjN/8EIp6r2mt4Lxxg4so18/uKcW
 Xsm7eW9poKCzYcvgwo8nH+dpaOa8K5QR03I/URydns0VqOfJb+ff0LDjfZ+Hy9W954rv9GTl/05
 m33zLd/CNi5YZHG7ZFM1UJTzv+WHOxkm3+LSX5MMl9399XOtWkKPPMds2aaya8uX1rusp+B0+Z7
 i1VXPKeXAtEE36m6t/3PKSQV+uZo3T1ZGPirGXL/e8mGr7OXq5xNEouRKr+8y6XQ2pyGm39vPk2
 GcscN7G39zLsWnhKb6ngNLeJsbIMs28//sLSJ2/HyZUMAA==
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

All other submodules pass arguments directly. Drop struct
msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
all data to msm_dp_panel_get() directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973ebe0835c96420d16547ebae0c6c0f2..8d428bc633a9f2165651194797b027dbe8655e06 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -722,9 +722,6 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct device *dev = &dp->msm_dp_display.pdev->dev;
-	struct msm_dp_panel_in panel_in = {
-		.dev = dev,
-	};
 	struct phy *phy;
 
 	phy = devm_phy_get(dev, "dp");
@@ -765,11 +762,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	panel_in.aux = dp->aux;
-	panel_in.catalog = dp->catalog;
-	panel_in.link = dp->link;
-
-	dp->panel = msm_dp_panel_get(&panel_in);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7d122496723a32fd591d094269397a9fdd51fe44..92415bf8aa16655a6cf4f7d6f8a5896275edf001 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -475,25 +475,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog)
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
 	int ret;
 
-	if (!in->dev || !in->catalog || !in->aux || !in->link) {
+	if (!dev || !catalog || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	panel = devm_kzalloc(in->dev, sizeof(*panel), GFP_KERNEL);
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
 	if (!panel)
 		return ERR_PTR(-ENOMEM);
 
-	panel->dev = in->dev;
-	panel->aux = in->aux;
-	panel->catalog = in->catalog;
-	panel->link = in->link;
+	panel->dev = dev;
+	panel->aux = aux;
+	panel->catalog = catalog;
+	panel->link = link;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 47c1d349be470b60596b64a7bc8c7c39d2e8fdd1..4906f4f09f2451cfed3c1007f38b4db7dfdb1d90 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -21,13 +21,6 @@ struct msm_dp_display_mode {
 	bool out_fmt_is_yuv_420;
 };
 
-struct msm_dp_panel_in {
-	struct device *dev;
-	struct drm_dp_aux *aux;
-	struct msm_dp_link *link;
-	struct msm_dp_catalog *catalog;
-};
-
 struct msm_dp_panel_psr {
 	u8 version;
 	u8 capabilities;
@@ -91,6 +84,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in);
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
 void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.39.5

