Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEA68D7536
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B21410E052;
	Sun,  2 Jun 2024 12:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gKrrkY0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F26310E052
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:52 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52b912198f1so1553520e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329890; x=1717934690; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qCmMEV20sJhl6q9JP4BtOvE1ThwKifoA/eb2lcmOX/k=;
 b=gKrrkY0yTxuXtnbw/+a+3X+FdNZp82XsASwhSaPIR0813ECq+lIhf3I1p5E4bHea3j
 oqEUclu5jkKl3r2ufwgpwax7vcPrsOotIYxybWYnPztoPlMfIfbqFPIrRim0cRFykn/T
 EYj6C6P0aiyM7ifQr7/zF/qh1M6gTnWeMv3GM8D/zPYWUgbQmOheGWMVYavTBD6k7IKY
 TlpQx+wnNQgsdDC3t7RgD5sy+5fOlRpD0b4k1JYZVKkoRnxHZ0D9hFcMxkHcbJj4mGiP
 EuZKeikz/+KXTQBySGLRJBKRnmDEUi4zdhNo8WnPAGQfUSAMeUAc67i+iKrDIBNPppcS
 RbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329890; x=1717934690;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qCmMEV20sJhl6q9JP4BtOvE1ThwKifoA/eb2lcmOX/k=;
 b=c3znpe8N0SI1Du/Cx60Gmmp/87zuccHF89HhFgU0swjuhwQH3qZ0mxBAp1BoeI1odQ
 jEBVJ9Jzo1JDhueaamVt49bTmANECToxbJwPWhsk8dKxLKP72Tj3/+Zbx3SM7YwtFq8E
 83o+c5AjUfkwm8aoGlYv/wnIR61P1NbOjwLj13tQ+IZSQkdh7ClHBXGBkCDUDN7vObws
 i1gs4cacFfOLU9ZvRBZbeDyr3+/TKqcpEvq7a70iqyZjwNfHyjav+U+HLmXjpYefITHC
 3eIG0Z574hrvb9ix0ITygD4/Dam9RD5t5RmRr5JTNhXF4seH1P8Z8tIBBXRrphCXA6l0
 Al2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaMRTnrgDDfdsSBo8wL3LvM/7ADGf5lB5bXZ5Tggm3BjvI8+mYMP7sME9ySZwJx7cGA7g5knHc88LkBuPw35Lm96mION+tGmSHI7qLahdI
X-Gm-Message-State: AOJu0YyI0enB7GYD0VG3LM97kAeWwYVB4BI/U4mibttsXS0MjKlVBz4u
 fZpDIdaw1gk2uniAZFMlCkVDCMdCxK9TmsUmUE/8Fm6YPJb82j5sLkw+0JGg9L8=
X-Google-Smtp-Source: AGHT+IGCiCd1TG61yPuHP2aBTp9MSL5cxIMjf2EW/NA9zU4V8f7CT49VmAhc+8/OK+n9wpRK9ETuPg==
X-Received: by 2002:ac2:58ed:0:b0:51c:c1a3:a4f9 with SMTP id
 2adb3069b0e04-52b896d8790mr3599090e87.64.1717329890158; 
 Sun, 02 Jun 2024 05:04:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:44 +0300
Subject: [PATCH v3 04/12] drm/imx: parallel-display: drop edid override support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-4-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=p3R84UdnZzJNiooJHROp8P8TIKNW8VASKGnwF+31z+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/cNOEQ83ng70X09QmeKaF0NL8z0h92yMj9M
 305afztkWaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3AAKCRCLPIo+Aiko
 1XexCACDSDdz/1zzBjj/fpPm9P74sgM1RPvq3rFuMSGAAgAMTldnUNhsH2r3LcogCivWWmXLeQF
 FqDenyVNvckt6NZDDg6cToyVSWnoY0/ZPbdNrI7al6UeND2y/snsiBo+L3ozuiDfoDdPm9ntfyI
 kBjy+bvMhGTmH9M5MvVwx9D5yk3XRVD6h2WP7dYTK0WpupSnRdq1EMF9Tl4jmYZY5LxwM41oc0h
 xvy5dVsY3tkCZI0dutTeNAPMJ5H4I6LVRLSiqOob7HGMrppHtwBbxjKtIro4Lqr1zr3Co29GKT4
 Kx6xBvRoI1UOucJZYh4Ditfs6oa2OpLJk1rEb2MW/QQnLOZQ
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

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
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

