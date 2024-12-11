Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1F9EDBFE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCF610EC87;
	Wed, 11 Dec 2024 23:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wfk34iWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A241810EC88
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 23:42:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5401c52000dso3851e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 15:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960540; x=1734565340; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qE7GDtRTStTKn7zTKbCKRrNoh4JnzGeSHWe+F3Oy/c4=;
 b=Wfk34iWYQnKMKs1IYNzIP6imQqfUtGTPK1A2CN0hxY7WxPbC9XQdc6XG0C0lzFPj0X
 MkQYczNWNql8lRxfdROp/iL7E4BkNaePidiAt6mQ0qKErQmyGeCNDm4eA9yfQFvqsoV6
 smkBkd4a7u2EmXRAMNQMWx1ANedj7PLRYCGgrvJanP9iz5N32XLUaBLFT+Yk7UBw+OLw
 UQ6BxYtPskEWxfvcS+qpZIdnDUy/tHT6Eruq9b6GEysoA6+9dozcKYYKoSH7gX8LA194
 KwjbvSSGs0gXS1i2UcIXOJ4gpv5dQ2sn03d8hOik9PDvMZ7qrf4RwfTDqKwVX0+ANteA
 B7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960540; x=1734565340;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qE7GDtRTStTKn7zTKbCKRrNoh4JnzGeSHWe+F3Oy/c4=;
 b=lWNzhQU7/j2hWOyap4qpD/pRtVUQKyoi+F3yG5Og3AZnTBOkZ5++uFJ0G5B4tbAwvn
 c28zKy2rpqgAtujy04ezf/0bL3rNwUqVUU5+EWtwiScHWp2XKY9Meqhf/M2xpplMn8oQ
 QhxQ8l0SYl5GN/8KXuvkYnfTTDC0ht2l6+5E4scG8BFr9sMHWO86KFhqItZ4w1KchRLx
 gmK0P35fiknoeiVoM7Qn4aMZHFuOxseov3cuwD7UmmzXIdI+Yl8yTZdcwjoP+DOFWpU/
 eWD+0onQx0mti5m5rTs74xnH/CaQW6dSAy8KDIApguH3Dt0i28Vrj/vV0s+1Ap1N6UJF
 Etug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN+R7MFG1TI+AFgt4wW3Trj6x5VHyRzYbTWlZwHmaMQwlvV7oN1zLosNzx3Q8ol6Balo8HmdcJ55c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2bEAH8n4vE5LvIKDcqKWi+r0sobcLkseai/3um5jmGCsvbFn/
 A48nk0l+QvVu8T3CM9XJ1sQkHZIvEuuPqhNgnPGLvGBgTP+h3EuLjDYfYJNHe2w=
X-Gm-Gg: ASbGncvnU1V+GXUc5ymVk7HhrAiKTzGDqSbE88yoA6yLbN+5IpRc5d0sfyE0/iJuvZe
 JGNvwyWWuF1ClVSpteR9rYOKKtTxSQlU/KxLorV/vwC4PbErsNqwDtgmhKPBSlpd0TvxvSbuBj6
 6X4TmWvADVr5wzB+GDkYQhI2TvPSq0FEFikQBP/1htE5jAON8xYuBVBQWf8bfYoSBkJ2V6phbun
 vrtenrqMipr1NYejuilzfKzviEOpIa3eYIIcpGz0M/bY8OtawqNaVXE/zXulg==
X-Google-Smtp-Source: AGHT+IHV/gS244rNWMbZoF7ZJs+GMe2+NwsjTqUbRwLIukPaiz09y59qS8DRvo52E+Lvw8sNNYtzgw==
X-Received: by 2002:a05:6512:b23:b0:540:1d0a:57f5 with SMTP id
 2adb3069b0e04-5402f00b8dfmr475551e87.22.1733960539965; 
 Wed, 11 Dec 2024 15:42:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:42:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:48 +0200
Subject: [PATCH v3 13/14] drm/msm/dp: drop struct msm_dp_panel_in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-13-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3830;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MMvFCqfALU6wJGnue5h/pJv8DRZdW1yevlezkUKG1JM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM5JfTAka5yOe8WD4DIrb4G1HNDkAAKSav7k
 WeZp3UjeNaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojOQAKCRCLPIo+Aiko
 1YRMCACWvpBhLFtz3kgiXuXfdW5Vh8vyZyOPtkS+ev+stKCA26jNaowHDR7ccgmYyhCsV5k36Nh
 W5KSKNDGUa06xBZkdMoUuUi96CHTTJSgZC++C3O85o5TxznHG1E7ynlDkn5sPXan5I9JxOnwLcD
 KibsKIQz70ufHCaBFA80+OEZPrS1Sbs+j+N0LLVSPGOnibc1K+U3QOqS5YvytUwUmg0saa2zvlL
 USzFu3om+M5Vi9HLlj92q8RkKH4V9CEU+2yWSAYNa/SFgruzOkmFvx89uquBF/yslrl0C11Qvij
 VroT01XOwxDNY/xU4MUo31anFZFGe+PX1Auw4uJq4BmAq5Tf
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cb02d5d5b404925707c737ed75e9e83fbec34f83..a2cdcdac042d63a59ff71aefcecb7f8b22f01167 100644
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

