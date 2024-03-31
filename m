Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA888935C7
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B43510E9EF;
	Sun, 31 Mar 2024 20:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Eswf0eX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4703E10E9EF
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:11 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2d8129797fcso6739651fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916949; x=1712521749; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2KzzvmMhfp7akZBSkslfuhmya0L5lQxB1AJ+Wft0o54=;
 b=Eswf0eX56rMezCGj2PBbcqXjHNybe8xIq2N4OJ0leV5+C1/7fZdzWiTx/nNxn8XGP8
 +gHAhulLTj72Sc214BFh9Qq9WqH2Dp/TKBDeNDakLMpCG8MW52DkmpgZcl64z0t5xgpy
 t8CNfEIGfIHuTZvVTW8Fn9gXkbiit1I0L6Y3utfIcLwATPvaprjlfqUUskU8/kxj/ZV3
 jRnVO2uCGg9Dbg+M8iNNWZNeVAzA/J2trpXLkVgAr8vwDUCq+SENsCi45b03RmTemM2q
 Hy6xdTpVDB1x8yoNPN+tJ4ToXUDBZvf1jtDBcp8G3WJnNc2MuRgkNxs/Gfptwzuoz9HN
 JY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916949; x=1712521749;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2KzzvmMhfp7akZBSkslfuhmya0L5lQxB1AJ+Wft0o54=;
 b=WPZunRfq0hBy81Y+iaPYNT/vQbxFpnbloAKtIs5atTWVfLgy57/Fpu+Vjy5ReshA39
 oVjEh5bCp68mzkUfjl9l7ya/LATapQd8pILjjaAxRDAbwJzePnCgLUR6WHH0OZKrUsth
 6ThHWxKNZ5pDcmJdcNe3HjjKBDa8zNUPHsMLx4VKgnwrJLa2Jl0Ua7PjrvP6G7ni5bok
 vakfTLEMsEVcphx7mu3ng5CG9Ymp2sji7Pm/nF9gPXjTpra4yNzyYKfEJZAjVO24Qv5r
 /dEA1229vGvCIIhHv07P5ldsRMFILdxyagCzcTbyAvq6BeA1lDnvACLioHIQrm5WoJiM
 VRDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX84O5e3SX74ZC+y1Ws1BNOmb/fvB5XDvEzCjm5eBcYtw+OqOwwFi2XutlUT1neA+3NuvBFCyAOb7vwjaRQvK+VULIVJ4xdOf8UM8bDqKmt
X-Gm-Message-State: AOJu0YyCcDLpzBsNH1KBKIA28XUCiN+v1BPQo4OhDdaZnJbWXEZJxiZ1
 BVV7GPbS8Yt5nyaQL/WI0sMIfZJvuc6Nj5uUW7jU42e8L1mJmspoiGeH+5zWFcc=
X-Google-Smtp-Source: AGHT+IFlkJbTHllJhmxuQLe8rza7jxEC5/tq80FTXBgl9MrRzWWrHRQfdLsjPQ9eVX4jnPTBNpNLUg==
X-Received: by 2002:a19:6a10:0:b0:513:aef9:5401 with SMTP id
 u16-20020a196a10000000b00513aef95401mr5436071lfu.66.1711916949484; 
 Sun, 31 Mar 2024 13:29:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:01 +0300
Subject: [PATCH v2 04/12] drm/imx: parallel-display: drop edid override support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-4-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q3tsX2NxDW1TnkNSTRHZJWIJp8sJ+Hj1Kz/G4qOQ9+Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCcePmSKVxsfb2BiMoKNsmfnhrGb3P7osuWj7O
 9DlQcsEYQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjwAKCRCLPIo+Aiko
 1Qq2CACzcRHGJvXSJ7Ml0+GAsmRZ4aF7aq9y0LhhBKlCwrSYCrgMog440nF/nbZUYZiK8u/syu7
 X7M9jd37lBHflsClDpkrCAJAFgL8Hy1OrsgnkPfJcJGNqR/ReWQeiIw+nvjFjw82vTwVdbH0g2L
 v+7eIkFQJRCLM73SR0E0NEkn/asUVzqJH4GCtRJGk795BuD5Yh/al4Noqb7JNS6+/5o79bnEYqF
 YcexNCg3EklMvns+D8cGpuavkOoPp87gn18lL6wGJCeewjR8Z6Y4Cv97kxpChprIzs3uAK+XbJL
 Ueb7+4iT2BBwCcNThuXHvZBvxBNr3Z+G/ZsWs8lNmtlT6Czi
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

None of the in-kernel DT files ever used edid override with the
fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
core allows one to either override it via the debugfs or to load it via
request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
EDID and/or modes are to be provided as a part of the panel driver.

Drop support for the edid property.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 55dedd73f528..4d17fb96e77c 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -16,7 +16,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -34,7 +33,6 @@ struct imx_parallel_display_encoder {
 
 struct imx_parallel_display {
 	struct device *dev;
-	void *edid;
 	u32 bus_format;
 	u32 bus_flags;
 	struct drm_display_mode mode;
@@ -62,11 +60,6 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (imxpd->edid) {
-		drm_connector_update_edid_property(connector, imxpd->edid);
-		num_modes = drm_add_edid_modes(connector, imxpd->edid);
-	}
-
 	if (np) {
 		struct drm_display_mode *mode = drm_mode_create(connector->dev);
 		int ret;
@@ -312,9 +305,7 @@ static int imx_pd_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	const u8 *edidp;
 	struct imx_parallel_display *imxpd;
-	int edid_len;
 	int ret;
 	u32 bus_format = 0;
 	const char *fmt;
@@ -329,10 +320,6 @@ static int imx_pd_probe(struct platform_device *pdev)
 	if (ret && ret != -ENODEV)
 		return ret;
 
-	edidp = of_get_property(np, "edid", &edid_len);
-	if (edidp)
-		imxpd->edid = devm_kmemdup(dev, edidp, edid_len, GFP_KERNEL);
-
 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
 	if (!ret) {
 		if (!strcmp(fmt, "rgb24"))

-- 
2.39.2

