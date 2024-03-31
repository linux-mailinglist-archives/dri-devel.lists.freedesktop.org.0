Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED0F8935DF
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2D10EA3A;
	Sun, 31 Mar 2024 20:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LVAaNZ5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7124510E9EF
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:10 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516ab4b3251so131901e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916948; x=1712521748; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zef0nzZ2xvfKTTGhbb7RG1PfMMOjv1sjApX9pDJjmRc=;
 b=LVAaNZ5lmhkeckvkESN2AJlf3T9sy2QoQew+yPLRPaPysZ/GW8ITQ7WNQ6Hw8sr/b7
 qMbxO20PshhdDK7zS+BtCDurdZH3TLMvi+u6TU9cOYR3g75ut+it2tRiHL60cP/J9QOk
 5s3gYbXs4yBJuuil6bpPfwrCSEKhhAU5xl3V85sGsClQfuxefwew90vF31ao2O2gVLrh
 UzAKDR1aqbrJHagdnCm2dTUqZcetiVxP6+H9kD6HVvT6kAyUdum+hIvzuXWgpVpX1+Mo
 Sw5i51w4iI3ac+3y8yvoG7NLcnT2wVaJZzvNlo/0lrSnkShgZrLAx8sVo485lsmsayUr
 Bwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916948; x=1712521748;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zef0nzZ2xvfKTTGhbb7RG1PfMMOjv1sjApX9pDJjmRc=;
 b=xOs0vXyasYhqdv64adTwa1qOKcdXHuJUv6d7SkdNdHCHh7d4vWGUb8QfuYDB9BpI8g
 UJxuPEJ4c4W4eggjgMey9cCNE46bgbSKn4ayLqlAAAgJPSCp6aFxBked0r3EtOCm487S
 Yuo0MJDTWqdNpD6qYYeKKIDs1GkRGeJAddKBjMkh8UTfFscnMx/VLKC0EzQSQK+w96c7
 C4Hf1DbGaTKffFlSsMt2WmMUPnYZ9EEUeec7rF5n4YbkCQ5xEdArpJxe/mVFEyPf8f9C
 GBSuqQhGtxKQ/+ebUxL77R7v1/3j4AhDyMg+cpgfHwvuAxP+0I1Imrlk4XYq3REm9lc9
 x3vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkZXukWeOxl+MAsM1MBxqSqmZd/9HHknYXLioZWUoof2q7JohOAPJoPrAM/rwaE1Nvd3gPq7LdJphnJRZJWbiFl4oXzT8+f94EaSFg9xFc
X-Gm-Message-State: AOJu0Yw53ZjirXW4D1ryn19b5zjtDAPeeDHTkHNa3VdM29pAU2/8YCv8
 mRa4qUySWW7DfjEFzSiHqPWcpyyV7sHZZujmL43sDGbIOekL1JDm4HR88B++GqY=
X-Google-Smtp-Source: AGHT+IEeBeqNuZwIfLQbwY0vtR41HMctXhZ/hlhyqOsgFR3m8enJB1rayNnKs0HiihAbaUaz+EUPCQ==
X-Received: by 2002:ac2:55a3:0:b0:515:cd30:cd4 with SMTP id
 y3-20020ac255a3000000b00515cd300cd4mr5778415lfg.43.1711916948521; 
 Sun, 31 Mar 2024 13:29:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:00 +0300
Subject: [PATCH v2 03/12] drm/imx: cleanup the imx-drm header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-3-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ur4bgiHo+4NL+0zs7qW21KEsP+z03vz9MHkP96MxsJA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceOtaRv6AfyisrG+WrNl8dGCI3K0Kw6vglYg
 sqv7jAKSTuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjgAKCRCLPIo+Aiko
 1STjCACN1Fcy46Njl3mD9RbVJ9J8+l5TVGpyE/uU2LNja6WGRJwELYrPl7UrBkzUfEKao7AhQ7w
 wKuB2eJNzk+5bi7T7wT3ICVV3mq39cxEK5weLsTGZTKKb9EDMuZwtI0CS2XIPRAHbQg/fPMRDo4
 IvcpTt6sLExVGzjyJ2Wg7TwLT0xHwkrmJY4jLAmzefKAesmiyXwG6X6ubAeGnU8nbO+Gjw0G8Wm
 V03iQeFZ4f8ddwMkS9fH9FsOz7IWFekfRnHyvl3iY0xIk2mLAd+vZOx4IHTOp0S8FrvY3s2foC3
 9BD/zTWcq0kEgalTxeqXaS2F9/s1TBSW+9/XgefKm00Im+1I
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

Drop unused defines and obsolete prototypes from the imx-drm.h header.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm.h b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
index e721bebda2bd..e01f026047de 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm.h
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
@@ -3,14 +3,9 @@
 #define _IMX_DRM_H_
 
 struct device_node;
-struct drm_crtc;
 struct drm_connector;
 struct drm_device;
-struct drm_display_mode;
 struct drm_encoder;
-struct drm_framebuffer;
-struct drm_plane;
-struct platform_device;
 
 struct imx_crtc_state {
 	struct drm_crtc_state			base;
@@ -24,16 +19,9 @@ static inline struct imx_crtc_state *to_imx_crtc_state(struct drm_crtc_state *s)
 {
 	return container_of(s, struct imx_crtc_state, base);
 }
-int imx_drm_init_drm(struct platform_device *pdev,
-		int preferred_bpp);
-int imx_drm_exit_drm(void);
 
 extern struct platform_driver ipu_drm_driver;
 
-void imx_drm_mode_config_init(struct drm_device *drm);
-
-struct drm_gem_dma_object *imx_drm_fb_get_obj(struct drm_framebuffer *fb);
-
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 

-- 
2.39.2

