Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97119DFE38
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526D910E6B7;
	Mon,  2 Dec 2024 10:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yQupNzS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4836210E6B8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:07:10 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53dde5262fdso4464979e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134028; x=1733738828; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fHRYPd5A4NgreKRdZCJAPxaFkFBdQ1h5Bfa5TPxM+bk=;
 b=yQupNzS+aHTqwPTi8OyYphVmJBoxd4LnhRjPoXCP5BvZ+EtKCCF1bcE1FJTqNmtSiZ
 pdJqbXZU2vcjYrkxRSiG2YuLfRQmKs2WtJcZAj3/1FO1UnwKUNLVpzJnC4DpJTXv9ktu
 DxJD8cKWYvM6wbHvCmIWkwkE5kLctREUZMeZUV9iYJdeT4wnBml0KD7brso6sxc6VRjp
 xTHnvEtA5XC7o09t02PKFjpAH6GuAwasqyT59wkdj4Ery0W0LU0XqAs30jsir6JKBDbr
 VV6/0RuSjFfsGF5JAbNSlMOh3H+2PPtQDK7J2h5YvOqFVEN4fQcG0f7guBybDRU6+s3c
 u+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134028; x=1733738828;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fHRYPd5A4NgreKRdZCJAPxaFkFBdQ1h5Bfa5TPxM+bk=;
 b=pl/RVWzyIY6bsPj3kFgXE+wyQG8QAerRx71cIFn7yEAOZHl0YE1F9LMImGH51wBYlj
 4jAnv1jZedABIOBWiWZRZF/XHhQ8Ec0BdWLAnZYMhQlj40j8mKwGfSuSRtUUXWQhNhey
 Q5hGivaZzz47l7OsD6SUB23MQGkQorYx44EfuiWcs6uIZJp1UGOkF3FvHoaiCgdi0rGZ
 mRX7h6usoDqPAQ4QaSiI7wE4jO608kVrAZpOsjXOu7A2kyiF+17sdnd8jL4qZe/6p+e/
 KZUrLII5JmE9VpZqIRZdTWGhFn0T/3NsQVGf7tBgwem6sBz96V9TU1VyMlOTJlxAMNS/
 aFfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYTwKrkmxO/sA7jA4auIw1xuAxvHE1Rkx3Z9eTQMjb72cqgjf1us5gAqVpA8UviZdqKQOs7tAFL10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqPTQlGfgkj/tS6NZXUwXS9nk1ZxMH/OWbSM9k68aGGZ9CeAjz
 oa9pr9x3AbNdDfbtCwtqM41XqcLfaB1KB3Y2GAaPKKFuX0NEi3/14b06mjRg/jJZbuVLK3E+1Hr
 p
X-Gm-Gg: ASbGncuG6aZRP8ZwhUAAV30g0YZapKC+EffXeprR1UfH2/F+qEdRLCsbV95xVi7+6Mm
 1RHEyqk6l8WGx9k5D9WFBpjdTDxDOGD2UqckoT0rGf6gLwg7zg2FwxoTkpPMHEjmvSpxr8vKYB9
 fiYCXL/X+T3TH21uo45t9WrvHUniSZb0WstTcYLUOtGMTGikNS8KnQMKu6vD+iY5cONzgXsqv6b
 sbRXYMMics4h2YQ+8sFbo0dwxSfiX2TSpdHER+Mh75f7OGiFBxg+UgoWg==
X-Google-Smtp-Source: AGHT+IGFQ+tjS81xvDFCKlpDg7emgbUGZasiElTcowgmlaHXlpKkPeHfN+l6U0RcX0Ld8NISce3YVg==
X-Received: by 2002:a05:6512:b97:b0:53d:e8ed:2172 with SMTP id
 2adb3069b0e04-53df00d71cfmr10971553e87.14.1733134028463; 
 Mon, 02 Dec 2024 02:07:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:07:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:43 +0200
Subject: [PATCH v2 13/14] drm/msm/dp: drop struct msm_dp_panel_in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-13-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3781;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hDpj7vY5jvimaiQwwIUKclDnHIm8+qEsXCeipWGCjes=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYauBZKl5PS9wkKoW5I8AIY3aHaHU+G9eAu+W
 LM9zxVyQ4iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrgAKCRCLPIo+Aiko
 1bQAB/4r8Xx7b3LO9yJdmYhEu3ZSMxV4udShpzlyquTlR2vuGRZ5CTPvU+xdQk5ct3kltbDKu/+
 2TmaBmGoqi0VrY25UN2hEmswOtlee1YBEobixLUfiA+64jAW4nd4i+Lje5xb9bYSFKD0Ev14FrM
 xevfNYGI7cfizQJLkXWPS08yBiZVFCwLfmRpBgEGH5r4iFJOBinDOzxO25FPe/a06YirWC8vPWk
 epnRzKXHU667G3MbKzmU/Wpa6es5ggieU4JHv0LHQJI6r8kQRLcHthmF6MnjnWKXMLkxb21OHds
 KauNIYCeU85JsYPuWYaZwiMVy+6TPgpbNgEI8EJ/l5rIt2LI
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 72a46e9e319486bc4ec1f5c842d733bd55ce0a67..8f8fa0cb8af67383ecfce026ee8840f70b82e6da 100644
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
index 25869e2ac93aba0bffeddae9f95917d81870d8cb..49bbcde8cf60ac1b297310a50191135d79b092fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -659,25 +659,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
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
index f305b1151118b53762368905b70d951a366ba1a8..a4719a3bbbddd18304227a006e82a5ce9ad7bbf3 100644
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
@@ -94,6 +87,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in);
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
 void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.39.5

