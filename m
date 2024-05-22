Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B378CBFA6
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D2F10F4C8;
	Wed, 22 May 2024 10:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Oran/5jq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55E910F4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:10 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52192578b95so7498021e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375069; x=1716979869; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j/4fTIJgTEUbDdUM7ulateH0ttYK2JMK4XIQQRpRwck=;
 b=Oran/5jq6AUXgK2OahPDsez6kitq+IxBN0M9KZCqx3+uSpa2XBC2VEtwUT6BXfkSGA
 Y4sycxq1zEQzVKNhe5DAqvCnfYcGotLxhpq0nlHwE7t6sJf9eMDi+60ZrFlIc54dvFNW
 2AkYhk30pvvdKJXmgFXxOVV00e6rlFP7hr/L+dTlktKyjPbpKRM44W10KjgR06a9tc4t
 JIVhhgHeek2ntga+U4/2Izm8ZKSEcVYnMUHxRvBgNdoSHM+720VbBH40vsgq33BKGyBB
 tN8sFCbhtGxMJ1GerzGV63uqdY/vzaWBf8tyDyOdFTFNz97eNmHVnbt4zr1nbtpBS6rH
 wfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375069; x=1716979869;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/4fTIJgTEUbDdUM7ulateH0ttYK2JMK4XIQQRpRwck=;
 b=BdfwJ6/OzUUcvIE1O4LxQMmApadARtpz1SWXc2KjMRYdH7541/MhDHjP936zg0w6Gj
 a+z7Chuswpr0BBGkNSSVbeD5FAgNYRycc2DZAxaowFcbsmFLF24kmNoy2XL4gCYhvkgH
 lBlUd9REHvvnb144NM1P5eia4bba8eFavVF3dVW84W0Xs3IJ8wtZlVaGvJVUErm5XcN0
 +V+mpAigWicfwK+8uzEBfHJyYJp3Vjf9++sUCKJWEDt5wi77gIyBSUmz6W6Nh/fAAzOn
 FbdhQfdZaotkxz2opdCkplZS/HfBMdxBSH7wGsdNpmSwqNEEPGaUIaIkwLUWLXJQnrM9
 llPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Kv/dmcJosM7whLUUoveShboTqLiru4mQ+4H/zqvfkfj+iDRBGdM4I6nABkudXsQsNTBC7LdROpsv0trMbJO0b4cRmTsTfyZr2e3IFjPC
X-Gm-Message-State: AOJu0YyTiuvB8me2xlSog0ttxPSFBnlMTepa/lkkoV6bGRflr1TLqUdJ
 XuSQFZsVagaMR+f/eJfGLPmkhMZbS/6+TXktc42YB3dhiQYDPEGHnKFoE/f47mQ=
X-Google-Smtp-Source: AGHT+IELruHphQs1lHT+YJc17lZvFaGsZaIttRkKgj/276EsYqWN2Z5w0oVEWecTGdEVYJODT/Hf7Q==
X-Received: by 2002:ac2:4c10:0:b0:518:95b6:176f with SMTP id
 2adb3069b0e04-526c068ea7cmr892773e87.50.1716375069078; 
 Wed, 22 May 2024 03:51:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:06 +0300
Subject: [PATCH v2 14/14] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-14-c30bdb7c5c7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3864;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/wrNOYlvXzRdTeplf6TZbVC8so7rhZlXjnI2QI/al7o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4RYwSU6lOZZB3KG7aLp6Cx2FiLEgfA/chDB
 bge3K0A5YmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEQAKCRCLPIo+Aiko
 1Rb7CACP2WFe3WKMzifDnF7L4BKpX8QNHIRZOX8BsKiod/n3IIa0usUDK3kAMOi40/U6TyKOcF6
 gqRv0D03gJMhCARcSsXKbPIjk9mKtLJlLumJGkKiVPY0MQm9hcxsx3atkHilZU1+XycaOMjW+dL
 YiHeo+COVv47oNf0ETJY25YIWK6DjkFxuYeG7F2zeK1ahF5QrIl64FxN3M73Coj/yQjKdjJUM4t
 AP4boZhBwBi02kTxoxEr2BrrrJDYNMPuS79LPR07pI5yHvcALXo3VUzqIZLAa75+VXuG8xZ3dsQ
 Z3hQXnUujcst+Q52pd4hGrHQe+Qhhli6fsO0wgDUt4l1owTm
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  9 ---------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  3 +++
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------
 4 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 2890196857f8..06adcf4a6544 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -202,12 +202,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
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
@@ -377,9 +371,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		if (priv->hdmi->audio_pdev)
 			platform_device_unregister(priv->hdmi->audio_pdev);
 
-		if (priv->hdmi->bridge)
-			msm_hdmi_hpd_disable(priv->hdmi);
-
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 7f0ca5252018..c6519e6f7f2c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -219,8 +219,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
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
index 104107ed47d0..41722b2e6b44 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -300,6 +300,9 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+
+	.hpd_enable = msm_hdmi_hpd_enable,
+	.hpd_disable = msm_hdmi_hpd_disable,
 };
 
 static void
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index cb89e9e2c6ea..04d00b6f36fd 100644
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
2.39.2

