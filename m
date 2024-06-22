Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF679913683
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C070910EDFF;
	Sat, 22 Jun 2024 22:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ko13c/N5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91C510EDF2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:29 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so32636761fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093748; x=1719698548; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PGHdc8YiA3WTHk5P8vKAyvQjRr5JX9fvWorT4SZVW8k=;
 b=Ko13c/N5AXbhwGb8PDVKBWeIKJP1dD+OtO8X2VtoJu6oZgvHbVu4hMzy6Tb1t5Y62d
 QymzQXLtWhgJTnPoLV0Pm8L+1ZOHRg0+0yrXGhasdB/vX5VmQcR9w8IX1GXWjiSepcPC
 oNk9/vIKicYI+xcvn5WSJtp8LTVseUaAes7f6+1OwWxlqSDvzcm94pirHAm1XP3hI2aZ
 XqURty87Sm8Af2JErO/sB/uwFtBhMgzx4hqcOC7HQw4VDOzlc96Rv0UxTgxyMVWBpBuP
 WRkWoMcN8zzk8lcVQsd3qxU4MWmEd6GkpzJBMj9EBD0XyPMTXVffqs1oBwyLBn1wKbHU
 O/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093748; x=1719698548;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGHdc8YiA3WTHk5P8vKAyvQjRr5JX9fvWorT4SZVW8k=;
 b=W1NCIixA9CvbKrgjid0XL6SobvOCq/64/f+5ZaByIUIIm7YAxwn/WiMB53V2uzvOsF
 Z8cHxrScRj2tsMjwNwSqoHiBUbLniF8/MNy/bg6/zE9xa28Ry1vB7DQUMG8I6Rz0vHUS
 Yvy/S6Wlcv441L3ADSiudXkB045LXROhByhmLZ7jmjk5ssRqa1WEdipBOz+oc/Vm/mb6
 pIFrF1bapmZKQoc2wGP1kU3hYS2xkAHAYKFq9SAI5k9XmyYh6XZVTJc5gD0tziYn4LC0
 z62Ydt9mTmp4AB5BciwRgL348n34RehAX+T9eblFVBKXhT21TKfEkV/GjDkjVC0hKWLa
 dBww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxxcWRDr/4Sjzbq/AxceCs0IG6Eo+sKF1n0kFyZNgk/XBLHog9noo9wT5o/ixDZ2UE4+OmrftyIxgCbp4aVGBRqC+hxRrggMV2+JIkA2MH
X-Gm-Message-State: AOJu0YwuoEIn1aeWk9dOo2gooXGiKx5S4B7pGb5zMBde2BlA4179LTub
 u3Mymyo9U8USVl51zSFLhN5/R8lDHn2EYrUyb74283S90uOPzvj1/687pUcgwSM=
X-Google-Smtp-Source: AGHT+IFdNEvT/KXwtp6byJyVArrLJT0q2zVKjTyW+suLZeO+39QYIbtNWDX5qi9Reqa4HCGgijjkUg==
X-Received: by 2002:a2e:9596:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ec5b3d496emr4164051fa.42.1719093748156; 
 Sat, 22 Jun 2024 15:02:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:26 +0300
Subject: [PATCH v3 13/13] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-13-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4028;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+t2U1RD/wb4G84+CRNoOtMFGJ3kapYkKIPOtVroW3X8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0nquPw6MxmqYJ+vfPQc/Atbn/P9DAqJmmFQt
 Yr+/Lkja2qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6gAKCRCLPIo+Aiko
 1WRqB/0efKfu2G2+t6qny4TOcmCSPhfPu7OOFom+3b421qfQbFXUny/DZ0W1AA8kEu/gH1pBcKb
 /Gws4qXxf9719+rG6htWlLc6pDbh2X5GSLl+Gw2LdNgSGOlsBPgcb+rAULRVP0tinf9SC1kJFsF
 238GTjIRY666bROxfOHEnjuzpRj+zLo9Wfdk48mySvgxvQuN4qBUCwFWTLAQA/a5H3UqbbeyGp6
 04u6qOgMk1JiEGG1tlW8bE9zQ+KEku0p6WGCKqKEnt0ooO3l0WjtDshGualV6i2ay5P0U82l+Jp
 odceYaWBvcqku8OEIZPpnxkiwVAbXMF76xQQMvqutiryQ8Zo
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
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  4 ++++
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------
 4 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9f1de4c9ffdf..7621d17b57b8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -201,12 +201,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
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
@@ -352,9 +346,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		if (priv->hdmi->audio_pdev)
 			platform_device_unregister(priv->hdmi->audio_pdev);
 
-		if (priv->hdmi->bridge)
-			msm_hdmi_hpd_disable(priv->hdmi);
-
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 9961dae9e9b3..96f2a982c766 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -207,8 +207,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
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
index 7bf1c3b379c1..0441d728afc8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -465,6 +465,10 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+
+	.hpd_enable = msm_hdmi_hpd_enable,
+	.hpd_disable = msm_hdmi_hpd_disable,
+
 	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
 	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
 };
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

