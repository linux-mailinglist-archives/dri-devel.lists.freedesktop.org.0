Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE0877EE2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5BC1127BD;
	Mon, 11 Mar 2024 11:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gNkBXQpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EE61126CD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:20:43 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d28e465655so63815871fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710156041; x=1710760841; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Zef0nzZ2xvfKTTGhbb7RG1PfMMOjv1sjApX9pDJjmRc=;
 b=gNkBXQpZS8FMGtSuYA36Yv0BW5LT2LTVLGmOiPc11tuK2CUsGvWvY5PwhSpHH6o6LB
 eJvHKSehykBzuPUQsVYHGqbHfKv6k1GQPgwKwWs9jRg5sruMCLtA0TqGI4vAC24MDT9j
 WG5mYDEWSczJAAjhKep75sBeRWTuu1T1Yxe8P6uaQlMC5du1WOB/N5BK87Iv/IQuLino
 QCtHhutpqdcL2/zw7mXFyp6G0ZFuEfzbidZ4OVxCXUW7jid/sLqo034e1sPuTc6X7lA3
 u5VSkwHmMh1zkyFnO1rBKAki/WMDh1vXA9Bp/j/F0oJwm/K8If5cUz6YIgQb+mjRCX93
 lbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710156041; x=1710760841;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zef0nzZ2xvfKTTGhbb7RG1PfMMOjv1sjApX9pDJjmRc=;
 b=SeQlcJSJgdQT0wddtUDkj2EtHsRkNHw76Ingt1cyTex1U/T0CXb6CqglSdGGBBMOzv
 l9EEQaFLSFa4HU1Lc7/FERhSAsZNCT618Mg8u/sl8RK7Ow/b28woG3KIHLvOzq0PFVu6
 O19C5qSS8RbNBZFfvGB2DpVe4n9etL8qAgIORh+HyL6+3TGfBdt1ZSNnSno6BleTZknL
 KYg7pVkCBEiRWO4tD4kVWb/Y9FT3OPtnqOuR2sdaje5FgK09TXffkBKytuSitAnzIGpi
 BOex1TfwWdfZmFgoUtPiTRDSFVYu0flNlow/L/hOfreJQfLo8zhaVdgDyQ53h1m9U/k3
 35xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5D9Yskjd9iYQV0AeoCmIqa6NkXrpVrNCMwxglbBG4eVOWKyCKEOxcFTYKXi972xTyai8aasb6h2mrMSt2nEvy148CCWTruxLmcg1CtCiJ
X-Gm-Message-State: AOJu0Yzt6vpvwl7phvWWByF5oB0Sozn7Nc5w0xtEOppXrX9x+mqnPXLT
 SPmYzLvb0Jm3zJ4BwgqFMhcebup5N0KYoDL1hBcmBibmyEgPDOGUsBrR9LRzOfw=
X-Google-Smtp-Source: AGHT+IGayv+PpX9zAAHSP8SflubaUb3k6JWZQzkHKZXejF/ylBMmobaETzEOak+dTBGpNFNxaR8l9w==
X-Received: by 2002:a05:651c:1a0e:b0:2d4:49d2:a3d1 with SMTP id
 by14-20020a05651c1a0e00b002d449d2a3d1mr187992ljb.1.1710156040918; 
 Mon, 11 Mar 2024 04:20:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:20:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:11 +0200
Subject: [PATCH 03/12] drm/imx: cleanup the imx-drm header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-3-e104f05caa51@linaro.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
In-Reply-To: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDYTLRCINK5qAZo9ZeD9v6zVyvNykpsNtd3
 gn8XZDNDTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1dGLCACi2am7a7E0ilLnUCgllinsWaJWythlIwTcuZOie4ikmbjYL4Luka6hmBbxx7mzPZT0T9K
 /v61fhn0eAbp3pvUrj+2Bi7N7fUszoaqRnsYDUqNThrQmNXrL88AHRHWE1KOKbcwVebi+hC6sBO
 dLiKou1b7bVLZiRbw14yy0IHSrbye1n0k9qq7gGgXwpVJHrEpFu7hAr/BlCrzOUCPfbS1MDOB2z
 O+hzrmfY5oZEcT3HZxr6QYeanQaye4pmmFnVEDe7dQUy+pbgxzJ3tNPyzpus3pVYQ6GikNt3bXB
 7kiBHQMJYPpISn0Zi75Uc3XnIq/neudkPfEOQgcI7NSUXFA3
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

