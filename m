Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919B8CBF95
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071CF10F4CD;
	Wed, 22 May 2024 10:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EqIA1DKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D8A10F4CC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:10 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51f3a49ff7dso8424777e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375068; x=1716979868; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kQt039iK/MLUHKrg6kdB48KBLBfk/G02HtDymVf9/cs=;
 b=EqIA1DKCJr3206SzKA3CJLF4nFTtJaw0O6m2foA6y8jgUBSeGvjnnsjwyVGG+PR8gA
 YzDfUKcArc4VBMqhStZzBfZydNhrk+QIdoPv3zKJ+qi8idbugpQdAFkGdPYD90BPQKtJ
 V9Aa+NDvpOUe/jcCBIGbqPr5ltRPQeIaRvQOX9pEIHvMge1nqRfu3XJ0NZal2vrCjz3q
 5tHY1ZCCRmSzQNlClV8ES5q6iV9pxbHqbH8v3FSYnf8OpEwWs809KHASe9uvoh6UdDCq
 QfE1e7nhT1a6ud6H1wJNsPj1+GyF3lRYRQeSp80y0T583SE9OxpolEFD+lh0l3hd/lvV
 10xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375068; x=1716979868;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kQt039iK/MLUHKrg6kdB48KBLBfk/G02HtDymVf9/cs=;
 b=TVQBFkaeY0tINPHGUhFSxRI6YxNo88z7eZHBYMf/ddlbOdoFFKg11Vr8GdfEmPcVp7
 gfeiwdbFfcv1eqYpOK69U1LTMD7GZG9HCgcI8f7u7IPKE7wOVT76q435BI3dJlpwrEcU
 DqsTgK68V8i/BwsWk9T2sxGw/OpeG95pcPsgMilL8FRqh9vjwGXRPcbeBYT5Hmz5PUl9
 ZBF1nVJcgX8Z5TKKBzyAGMGdZ/KHAJ47xjwkPeNujeUqWAH1nrm0ywGaxIeQNrkdjEAQ
 s6wwg9VteKKeiHOLG3wahrufImszcogW3P/7hBv612TrAhA4HbqGjxfekd8Ah99OYRF0
 pYKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5uEw6pX82oTFzkeHeSxwV9TF6zgkVHhl9pmb7L9l4HyVnmgNwuwb5N/yuQBHm6BP2T9DXH/3icxHaGM3U8LbyohNqqRIEJKYQJGKtwwpW
X-Gm-Message-State: AOJu0YxW+Pt+qU/lex2mqFgcVgnkG8KYauikw+4yOVIwQmIg/u5VyE1V
 UBhUb1egmTzyDMjS6jNqrAsQ266bIMGyZi3tiWVAP7Ps0FrJDVpfa6JHO69ywk/Oj01ITgCBOQP
 6
X-Google-Smtp-Source: AGHT+IE19pPXGyC8uaae6hqcH2EPzGBxyhrTv79BSBeUBvyS8uz/EAWUerDg6ffy+uQkeB6O0oM3xw==
X-Received: by 2002:a05:6512:3707:b0:523:d1ba:6431 with SMTP id
 2adb3069b0e04-526bfcf72d6mr829466e87.66.1716375068296; 
 Wed, 22 May 2024 03:51:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:05 +0300
Subject: [PATCH v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is
 requested
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3672;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fN+A3/6vCyYk379OydAiduI6v5ThmuLGAylNRut8Q0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4RpzFy/RBa6wu+q9FeHDiKrwkox2DFhaeHF
 4v2WsPp4GaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEQAKCRCLPIo+Aiko
 1Vh7B/95PEKsWeIEL8mDIfKMXBJryYqmCBX/RF1wUhr6eSzA/642guxhiuaaYf6UpvEodW9nitX
 B5kvWRDkiDFyZy65fYhKFZ+9HIC8VZdpA6iR4/OHYwrV8FuvaljFy1tvDz9VvpkfCgYxN/HfTvc
 dflfpD25FK19tPRsaer+FbKMFcNqYmLpo6ta5ZrNMw2LPHsPAPfW8JBNOBgzw2USJZ59EOqNAR8
 XeJteZAPLcLS5o0EUrRYn5ob0Z1oCVT8Ksa26Q6HZSKEXedF/V20TD4ByYIkW4CHQHCnM8MJx+G
 hSkEKjEqMj5dmZ+WNiuSzZHnvnwFadD6TI4pJFEh+6T2uBLZ
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

The HDMI block needs to be enabled to properly generate HPD events. Make
sure it is not turned off in the disable paths if HPD delivery is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 9 ++++++++-
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index a9437054c015..2890196857f8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -409,6 +409,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	hdmi->pdev = pdev;
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
+	mutex_init(&hdmi->state_mutex);
 
 	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 268ff8604423..7f0ca5252018 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -42,6 +42,8 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool hpd_enabled;
+	struct mutex state_mutex; /* protects two booleans */
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index cddba640d292..104107ed47d0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -117,11 +117,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	DBG("power up");
 
+	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
+	mutex_unlock(&hdmi->state_mutex);
 
 	if (hdmi->hdmi_mode) {
 		msm_hdmi_config_avi_infoframe(hdmi);
@@ -147,7 +149,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
 
 	DBG("power down");
-	msm_hdmi_set_mode(hdmi, false);
+
+	/* Keep the HDMI enabled if the HPD is enabled */
+	mutex_lock(&hdmi->state_mutex);
+	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
 
@@ -158,6 +163,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 }
 
 static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index d3353c6148ed..cb89e9e2c6ea 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -73,10 +73,14 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
+	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
 	msm_hdmi_set_mode(hdmi, true);
 
+	hdmi->hpd_enabled = true;
+	mutex_unlock(&hdmi->state_mutex);
+
 	hdmi_write(hdmi, REG_HDMI_USEC_REFTIMER, 0x0001001b);
 
 	/* enable HPD events: */
@@ -106,7 +110,10 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
-	msm_hdmi_set_mode(hdmi, false);
+	mutex_lock(&hdmi->state_mutex);
+	hdmi->hpd_enabled = false;
+	msm_hdmi_set_mode(hdmi, hdmi->power_on);
+	mutex_unlock(&hdmi->state_mutex);
 
 	pm_runtime_put(dev);
 }

-- 
2.39.2

