Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E38877ED7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCFA112754;
	Mon, 11 Mar 2024 11:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z4G93CPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AB41126CD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:20:43 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d3f4fef377so53779371fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710156042; x=1710760842; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y8Mz1SrrU5s0SvG5lNUUvBk8SH1QEwpuUJsxf2sSYp8=;
 b=Z4G93CPY8cMS0IKI0Im7NZGWlMhY9G8NWsWe1pl7AA9a7M74Ly8QPNpaj08jio2Lbm
 Ev+Xljbn1J9rddOcLYfpxTFQ26c7eiBBus2QdLnu3Zdz2NkzNfKS/Bdc4Fy7eCunUAG0
 b16JW9iLmJtezHHRxvV6jhFkP9iQhBy0g7VPAvzRUAPBjpFzemGNSSuGY/T1gjvsP0n4
 s/CMzDTn7Mczrrng9q32dHQ1aWmT9553XcSxiVeXUy53c5Vptb7lbYSad3npygiOANw/
 wWfwoKetlX78j0iU5I0Uevbp3/Ufbi4JcWdYtBplNAzIEk4fea1AYOcseAWp8nOByJeo
 CEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710156042; x=1710760842;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y8Mz1SrrU5s0SvG5lNUUvBk8SH1QEwpuUJsxf2sSYp8=;
 b=FzLBTk8ErFGhfUPUVsssRtvUF6l6F6WFQE48Vsh24a1uFAJaqsxbFdn2QX4VzzcvOh
 TL47SqhqcTCEo2g+OY7ZJUXTM1kRSag/lMWZlcZW2gSajcmGDTC7axpV8ShwUogmU95E
 iFuAWufsClROUFmLBqt2BpoCGtYfpe2mhIPTZQ88nQ2xpiS1NXPa+sN3RN6NlKOgDX9K
 fQaYZcuKz05XBspebfeI5e5hY9QR+9NTVQUBN2j8fj7wD2wQ+vKP7mYMgdGVZ4nUq38T
 mc69H+U+gxdZDOg7mgUERvJ8q7Reo6B4GwNJL34S0hHmhd4RZfrrtra2JC/EseLU6o97
 jxJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLmqtit6bhIjG09IweMLKZ1OkY9iJP9mfBjukZiu4an0XmzgU9VvZ3/XgNwxjpr6Veja9zcqfGlWoTu08yQLeYn0wEAvZ/jY9M/bd7lp51
X-Gm-Message-State: AOJu0Yz9hEPtEFtZiarUXji9IPchfyLy3JnOe7shXidWgUuYt6tkVG6z
 LBjdAaFtxqQIvEcbyq7Q1jAH8GJ8N7oyb3/r5eIhAthCuNOWsIgDXG26PdUBN20=
X-Google-Smtp-Source: AGHT+IGqAhe+1Se4Tmw4xu0A3Nkx9yGY4+FnsmQk4e2SdM2jX1oMyWDtYqtFTQ/d/Sc3k+n9g80tow==
X-Received: by 2002:a2e:3306:0:b0:2d3:f352:3406 with SMTP id
 d6-20020a2e3306000000b002d3f3523406mr3846006ljc.46.1710156041996; 
 Mon, 11 Mar 2024 04:20:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:20:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:12 +0200
Subject: [PATCH 04/12] drm/imx: parallel-display: drop edid override
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-4-e104f05caa51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2276;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=otRF0WM2vzdwskj5zPMELQrxSXcHtXRqOyPOOstx8go=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDNBWN5PcXva2X3BynfIJxAxvscbxmupR6u
 Q+OGRG8YUWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1XJOB/4osTf+FfxlQ2fIHBLSA/xhZy3lpIvGKap6LB4bJ/znr81eejo3rbmP2tbHlcCb7m1jN69
 u0Uarv0On6KIWd+tfUJkhrVa/0L9s7ZKLd3qYdStycR4YOxJLrAZmjyzj2dqjWd05m5IlXNJpRS
 95yIOp8ilWbKOzUp/n++/0QrfM6+ZfuTW76c9w1QolXh2IssHXKwKcWrWkpWsfC4QX5t+d3OIm6
 X1RFRKadRehNzHpmrp7zyFYtlBsHP/cgvEf6e/5a6RIZJAAtVN8PFOQdLOJ/WiqyXNE0ZIdQB7K
 R+YBQtQor6Cb68P6+ShVR3o7mkcMW0WiGg6Rgb7s5OS+1p29
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
index 70349739dd89..2d044ea1920a 100644
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

