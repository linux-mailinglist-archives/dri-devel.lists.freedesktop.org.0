Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C032A9FC2D5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 00:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7710D10E2BA;
	Tue, 24 Dec 2024 23:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eAyag60E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72D010E2BA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 23:11:35 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso6535716e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 15:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735081834; x=1735686634; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=efhfp+4qW1iSmQeuDMr+e/8ImYQLWTnZeSHC6Pg4yQI=;
 b=eAyag60E5miNdMEpwkHsSu4Ncnu21yE6nph4hpAaYw1LHo5S0YwlfZNNGUxwsabm7c
 t7yf2y4YthuVsk+SMojQMR8SvAwG0yqq8mV0n9NZVP6VyyPpxBBMV1sAnxGvIw42PR12
 iNV74UtEFwbijUR+IQfEci55s3YgFKx59z2WstYLaEKlCNy08SNlYCMNd1diec3awh/R
 RudSajf9JIil4SD+52CLCGf4JR2M3DDlUUMjEHBpH/LefMDwbW+D3btZZiyjQes5LLTM
 ge7lIdMsmP3NXsjQ6S8vsru6aB8zinp5JGNwFjPGHVexkr/it8YYM8yQ7kzTSyXRIrzD
 UssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735081834; x=1735686634;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=efhfp+4qW1iSmQeuDMr+e/8ImYQLWTnZeSHC6Pg4yQI=;
 b=eDnzPG4fwxLPOqU26vEHkUYrwavP8t4CvaR08JKJNa8f+s/0swbQ5R+pCO09e1xDwY
 /yerlFWFBmfg0IazeL6rQzV0TPmgMn/SltK8ZGSmHxc36AvwdcakdZTsiQt2MyX1KZLL
 yiwSDJ9xtKFWR3G8TMVPSTOphhoAsMamff9nysTupTRjXhEi4IpF/BrnsppFVhiv668b
 hW3u5VkZ/gL+7AMS0FX332nZCy/d9P8hK4e8aEql3VjvNvgEZ/0dZqtSsxNlmOhVKgRF
 O37aIypodORV0ll4QEG6VaEr+EFhZzB7QayiQXIrZbvHIFBXCJ6x2Qun93JSk8bvucLA
 fj4w==
X-Gm-Message-State: AOJu0Yxm4JUlMYlaLokhBrOKom1niAz7gowCOFi/NYQFIH5j0g0j2RGm
 /RwjOkMchsKHVKi9mW2gt0xfqkG7aDSgb8fWaW/TcT+FNlDP+rKsJLMv0Lh1og4=
X-Gm-Gg: ASbGncsMw21YqcCUORSOAuCg67Ls/s/uyytLuOBd9GN7YkasTSWIPemJ53OioJN+Xt4
 65aggI5X5gGBT7u+Ubbkkmt3kfeQ6ZOnFcgAcqPq6Mnf/dbfkEmUPlEz1Y/VjuCgPcIJm4lYMKm
 aJEqFMVXqAbbQ7m33FsuprVNSX3fp7sO5nYX9X5Mm90ZJMZ7f2EK3OTdjJa3HmSvpUpmTQJbXqo
 TfUURrCD7bBfFbRszGM05/O4rUsZpJrL0uxB0FRVfyfSzCmuBTl0mGtQ1+ivvyi
X-Google-Smtp-Source: AGHT+IEhaltbYVeYVnWcTZEGij7INLhjOGoVthIuxjQxvZSLrBa/jDt55eu9hG868SnM0PHocdwMyg==
X-Received: by 2002:a05:6512:438b:b0:542:2999:2e43 with SMTP id
 2adb3069b0e04-54229992e47mr6635799e87.24.1735081834230; 
 Tue, 24 Dec 2024 15:10:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm1721283e87.43.2024.12.24.15.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 15:10:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 25 Dec 2024 01:10:15 +0200
Subject: [PATCH RFC/RFT 7/9] drm/bridge: move private data to the end of
 the struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-drm-hdmi-connector-cec-v1-7-b80380c67221@linaro.org>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
In-Reply-To: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Bh587iD2fc71HoCxezk2yuAVtboO7fHMro855SCGYPU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaz9WxA+sQ8KjJROIrN1f0Hf4EKmOFjAonnPpL
 YW1LIJq3eCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2s/VgAKCRCLPIo+Aiko
 1YOtCACyMIuozXLT74TZyjuf318MVOI0LGrevexAAORnXjfKs4jVI5zj0NBxle/Q4OYEKgCL+ia
 3sMwKNg495laf8mJGOrgC2iOJ4gjvwTLxApO2F12iPsOsjHBezwr/pYup2f37ktYIKXflBtnYRD
 K2Bz6u6XGiaVcQR31TH6W2vBjt2g0HRGslOg66IlgR1noYnKJNa16r2kMfAYNUHpDnTv19cZAnB
 2oAyJZrMkcuEUA7YvjUkXm665gFMrRIY66sLOgvVpvcMFM6QxvTjyuhxAQuyGemdbjim3AhlQ+a
 4FxPKxOKY0nfJwfrDz+sDqVs+/SL3UaeL3JVz8yGvinz41vj
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

WHen adding HDMI fields I didn't notice the private: declaration for HPD
fields. Move private fields to the end of the struct drm_bride to have
clear distinction between private and public fields.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_bridge.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1f1670e3c6aac39b8b891b0d5e7e91254eb0d3a1..348778f233b06265a6ae577762c6558e69cdb396 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -872,21 +872,6 @@ struct drm_bridge {
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
 	struct i2c_adapter *ddc;
-	/** private: */
-	/**
-	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
-	 */
-	struct mutex hpd_mutex;
-	/**
-	 * @hpd_cb: Hot plug detection callback, registered with
-	 * drm_bridge_hpd_enable().
-	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
-	/**
-	 * @hpd_data: Private data passed to the Hot plug detection callback
-	 * @hpd_cb.
-	 */
-	void *hpd_data;
 
 	/**
 	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
@@ -938,6 +923,22 @@ struct drm_bridge {
 	 * @hdmi_cec_notifier: use this bridge to register a CEC notifier
 	 */
 	bool hdmi_cec_notifier;
+
+	/** private: */
+	/**
+	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
+	 */
+	struct mutex hpd_mutex;
+	/**
+	 * @hpd_cb: Hot plug detection callback, registered with
+	 * drm_bridge_hpd_enable().
+	 */
+	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	/**
+	 * @hpd_data: Private data passed to the Hot plug detection callback
+	 * @hpd_cb.
+	 */
+	void *hpd_data;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

