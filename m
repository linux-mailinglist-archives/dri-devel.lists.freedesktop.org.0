Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91022A2DB03
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 06:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FA010E46D;
	Sun,  9 Feb 2025 05:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e54f/pRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2DF10E479
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:23 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-545075ff6d5so596167e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077641; x=1739682441; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1xZToT8Ipw+PUjO7BMQGdecD6LauDPp0cZ9YFUj8vWA=;
 b=e54f/pRl9k1ed6/KVc14BCRSEU4u0ATsKRXe+nBPALzBc9lcIOcNRuCYKKOKjEwGbt
 rBLZG/PssGRR21L5lLkSoVGeN+LzlUmHZpQUT5Wr9enDH7irug1WMiqkF38SNWhKC3sN
 myB3ogzbfqTUoiRm9CvqsCBE8StOWzZkCLQckOoDov9qlJNE+qlWer8Ip+JYbRa49SeB
 GT3R/27FZiF26M6i8kGRD8kUHHPX8vhtIKYt1uHF0aqjTVha1Hca2GWP1HnFVwD7WXJK
 s7YLmnMcP8UbNVkR92H5qDqy4AJtod5m2jW4cvh5MwraKCxJJfjCJCXhwBgsUA6wErbD
 k5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077641; x=1739682441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xZToT8Ipw+PUjO7BMQGdecD6LauDPp0cZ9YFUj8vWA=;
 b=kgYaCihDrXJFVP6oOgT4MsMsjwFtV8WJpOPI/s4+gZ5McEX22x7juUeAE5glmiEpAg
 BMRIfxmu9lA8c+aeo5Qbz4o8tn9YFzTl8nNIuCFPSWZVi6p7lyVMtA2e2ziyL5bo+EkX
 mjk7ejaorUA0tg9ieWlYe+UGpPTm1Y4fw+RTJpa6DtwdpVzZQoJ9wZxr/FxpZXrbzil1
 PoHJ53ehO26IBVe0Gjmld8AP9vVNDTylPfPQYuYuNaWUw1CAclH9ggXmHKJ11tl9iZLY
 /qS38VtuE5cfhEecRWgIJDD6Pa0//YQWt+PB48Iyp8T+cj3Skzyvhg8rqhmiwumapZs2
 ezEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2yP7+fDMqyOFBiozRjUcrGPIpYDKltIc4DU/7KHHv10o1j93PwGFkPX/Tg6wLRI1IS+o2csXFs10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxog6IQqm2ATLJ5rlVlXwJeyu3IAQsZFC7sx8f9U5tnxeraIdou
 tqPH1ZEEXFboFqu1ZnzxxEGdTl3/Clp4gij6VeZaWUYCZiagwFS8KNiLLpJ7B8s=
X-Gm-Gg: ASbGncsJVv8tHiZPcxg4mpBoc+4BZkCglhzuzRLnDtGqqNPdWE+bcR3a4KJqDH7EHML
 PT3f7z6/203vjgUi469eC1CEoAYT18kttJWC9xFnA7ik5Dl5dULRXB9LhK0uHMhE8PltVsdgqiI
 B45k2C4/mofL52RaNXvzJuk8M/LfB77Fwto8FY03TRgrL3l8757Sux5PsGDMUm77yreWadtF9DB
 my0Ta+KjoBCJKRntTIT7myUb8dzrFCLWjXmcEochdDOU9oTmcNn1mZq3+h4UumVoNHK+EvD4JmN
 +I/pZ0PnGpjwWhRv+WDgwp8=
X-Google-Smtp-Source: AGHT+IGUIoNub6sm47xBPrwhQD2mG90ISalcUTKePpFjzxx94Lo1dp3HQT4XawwCjUCjbA6kpfg6Qg==
X-Received: by 2002:a05:6512:ba1:b0:53e:df2b:df25 with SMTP id
 2adb3069b0e04-54414ab6943mr3253079e87.16.1739077641516; 
 Sat, 08 Feb 2025 21:07:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:59 +0200
Subject: [PATCH v4 15/16] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-15-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vYpQX4Can/9pA++xmzUVsvBmfqVytun4ULSAJD2bgJ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfktyJ/HyMNRFnPtswfbXaSvIUEhqYROBJ0T
 mK3ItZNpo6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g35AAKCRCLPIo+Aiko
 1Wo4B/9wEko2KqapmTdzdtrGI05PnVyOMHtGr6U0m5DtWqAvsXy8q8aLx+EPLrXuh4d6/X6pN9w
 BKvU+doQVrevh7GR54HOPGdIdY6o6aThjw6JItlIZOzHnZcfcLtiCrbvACurjF6ttN8ZcdISSbc
 PLsmnqzXx72u2bvsrnW2pUDgummi4+lKGGICyAM6i9gCJ9ru1ZTxBaxlhpwULRe9YMX+IK3Kj0c
 Ctb4StyJljvtFV0bij01C6835twtirGRYCnhvwKfLVz05XHsUB9hTizzRFTWKi9IOzwlZABi5bS
 IDep805qclyL8OJE8++hZ5W0HyuOUtMlAX37Sya3F2PLjEB9
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

The HDMI driver already has msm_hdmi_hpd_enable() and
msm_hdmi_hpd_disable() functions. Wire them into the
msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled
dynamically rather than always having HPD events generation enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  9 ---------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b0292750265082c47093ed5cf50bbcba9e67c955..f1898d8eed6fa46c47c9b632a90daeabe74f4359 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -200,12 +200,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = msm_hdmi_hpd_enable(hdmi->bridge);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-		goto fail;
-	}
-
 	return 0;
 
 fail:
@@ -261,9 +255,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	if (priv->hdmi) {
-		if (priv->hdmi->bridge)
-			msm_hdmi_hpd_disable(priv->hdmi);
-
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 39adc8929bd601d4846f75b35c087de93c3df6be..679a2dab762c1333153c97709c99db8cc5a76d1a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -214,8 +214,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi *hdmi);
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge);
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f97f8b104f93bcca20e5f81f928d9b23c14fbe28..4de0f9b870a426bca825469195b1e3fac7729445 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -462,6 +462,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+	.hpd_enable = msm_hdmi_hpd_enable,
+	.hpd_disable = msm_hdmi_hpd_disable,
 	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
 	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7726de95be4891e4a821ec4e056482263f23ac05..bd17f63546dd2e3d3484aa9d46bae87274001a82 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -70,8 +70,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	unsigned long flags;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+	if (WARN_ON(ret))
+		return;
 
 	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
@@ -99,12 +99,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,
 			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
-
-	return 0;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi *hdmi)
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct device *dev = &hdmi->pdev->dev;
 
 	/* Disable HPD interrupt */

-- 
2.39.5

