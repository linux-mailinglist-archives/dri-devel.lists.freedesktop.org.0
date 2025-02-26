Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B722A45935
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A92210E387;
	Wed, 26 Feb 2025 08:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XQ+2NuyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A3810E2D9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:59:41 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30a317e4c27so57551311fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740560380; x=1741165180; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
 b=XQ+2NuySD6xtDmiN4I2JMrlmGiskaeu2qR5CzIRcI4TPdPi7alJ1ilzJ2wwRbq/aAd
 v6hoh0mcv1oF9loggdgx4zsZ9WIcok0/3T/5p6LGwc+x9ItfUFoGS/crzHzgFt82/1yl
 wp9krhr9HofMAQ1h8jZxt/6cjAigiy1RV/IEH4VkB+kOGbJ6aORB/7jmR/FXAKLnnRZU
 +1y+tJO83tVdubLwPPHd1ivXioqJFyFfG/bBa1DZXfN4hUZFP7yIkvnnaBuxRrb5f+vy
 e/7Wvayaq+fhTcfevhn6DFnoqyMCiqswnrszLYY7bAfyytDwEsijRs1IM3MQoni0A0XM
 dBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560380; x=1741165180;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
 b=nykHARiQwiOMVszJwm1Pmive+Vl/PYSfCTxTKybFnioQC+6Cn57zf71qrmHSqW1mUg
 A9u5vE2uhsoTAc4Z7ShZvLHKpFbLepdFRUQkBw751CnkQpSRoSGFShJC3h+y4sk5up3h
 5NYws+8fcf6Ls+6WoZv7K5jcwUx4lKOjkA0onyjT7TiYC3oFaM7nYc7Ei43vi3P7Mg+n
 x0YfPVpQojtPhJI8yd1L5jmtDig5viRu9xZg2utsW7ip2ycXpfWizh4AzH/unJMqCNQC
 XDoEN7mk49cM3VSvpgcbIkA8wLNpVcBi4R8Qeq25TZV2dAgDHRFh71LWAIqAZ3t2kYH6
 yONg==
X-Gm-Message-State: AOJu0Yz/4S8vCxFT2YgzC5EDhtcMP+ME7NE9JRYbr5XPVhTfyHk4ZpvG
 Gnq1gL6h5wUM9dnQ9he932+bH9VaGFemWG/Zd7KdV2Ktz4pJ4KvP06XP/tJf4HQ=
X-Gm-Gg: ASbGncuIB1e/GaRUND2Wv7Nau72tkGQPBoSdM3Srl78VS9aweQ9k59iWbofAtEYqJIn
 /lgApJGIq7w3eflIhN1XRpK0zoAGloqDSWKAs0Zc9MkgsURpkl5Z6LslfKfcOe9jEX9SBv2jjZ7
 mSPpMNP4HPFTkAx9qSXN0kpfL3mlcvKXt1WJAgcGuqwW5awzGway6rKgsLw6WQWFgKEzLDXSrMu
 QlPfwcDgU9k7JxBJYQa5zV3o7ntqsqnjiw1+62Htu6pswah8fTkS3AmFt6SaQjUQSnSz5i0Eg7J
 8E61tAnXZy8uIlyF09+Jo2aYlNm8Gigy/w==
X-Google-Smtp-Source: AGHT+IF1clTdEycrBFNuFTiPE56nj/Flz5qWSUV9kEcLMdvGdwFejTQjfioG3m2nixQNVEMX5BHNDQ==
X-Received: by 2002:a05:6512:3c91:b0:545:c89:2bb4 with SMTP id
 2adb3069b0e04-548510d80afmr4432612e87.23.1740560378375; 
 Wed, 26 Feb 2025 00:59:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:59:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:27 +0200
Subject: [PATCH v8 4/7] drm/msm/hdmi: get rid of hdmi_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-4-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kwW90yaGXjA8kr6gl2QdxUU01rGJmaVy/t2QVZCPXNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtftQ4pILGje/9Xkj/n1/36y5GpKicMEHfYGN
 m5T58jStRmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7QAKCRCLPIo+Aiko
 1Q/9B/4hmyjCKkhj91Fq7PAf6m4xde2HWvAaKLVL1QPupeGrEJlCgwudGfde1fyN0yMWcInl4nx
 QCGccsZGNhICjlioHG/U0aRsXgGL+bXQ1zS/Lcm7YNc6+s5j4VB6iS8dYBvhBY4E44TfoH/dZuF
 oBgI9M2FQEeWB3I20IclPg1Iuf/cSD+aJbsT8VUGCn/NLyKz0T/8LABxNiHrZM6Zh0V2aIvuvoK
 wF1oIrmq9g/j7dnX7QEmQy74om5sivcS6RmSw69+llJIu0jUl3zzQnUXGLywVzZ0SSJhJTS7Ih6
 tfQbLwwBkVEMfkXLa1kXHm1z8mXnyzV5DgbdpFjyX5g9Fl+U
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

Use connector->display_info.is_hdmi instead of manually using
drm_detect_hdmi_monitor().

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 17 +++--------------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b14205cb9e977edd0d849e0eafe9b69c0da594bd..6b77e0fb8d5ec218dfbf58215e2e12ad1dfb1b85 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -25,7 +25,7 @@ void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	if (power_on) {
 		ctrl |= HDMI_CTRL_ENABLE;
-		if (!hdmi->hdmi_mode) {
+		if (!hdmi->connector->display_info.is_hdmi) {
 			ctrl |= HDMI_CTRL_HDMI;
 			hdmi_write(hdmi, REG_HDMI_CTRL, ctrl);
 			ctrl &= ~HDMI_CTRL_HDMI;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 8faad8440cf70f792da353978b990861b0677ed8..cdd3bd4f37831f9a606a4c3627a48364f5d4025f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -67,8 +67,6 @@ struct hdmi {
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-	bool hdmi_mode;               /* are we in hdmi mode? */
-
 	int irq;
 	struct workqueue_struct *workq;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4f8e4ffdb2e058ecf243bb319c12c444cb2e5200..15ab0858105328c2f774ec1f79423614bbbaeb41 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -232,7 +232,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode)
+		if (connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 	}
 
@@ -264,7 +264,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	if (hdmi->power_on) {
 		power_off(bridge);
 		hdmi->power_on = false;
-		if (hdmi->hdmi_mode)
+		if (hdmi->connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
@@ -320,7 +320,7 @@ static void msm_hdmi_set_timings(struct hdmi *hdmi,
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
 
-	if (hdmi->hdmi_mode)
+	if (hdmi->connector->display_info.is_hdmi)
 		msm_hdmi_audio_update(hdmi);
 }
 
@@ -339,17 +339,6 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: This should use connector->display_info.is_hdmi from a
-		 * path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
-	}
-
 	return drm_edid;
 }
 

-- 
2.39.5

