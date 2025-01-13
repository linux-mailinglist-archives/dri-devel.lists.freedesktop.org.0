Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3097A0B39D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20E610E607;
	Mon, 13 Jan 2025 09:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LJWBsjiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC72210E607
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:53:52 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso4434057e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736762031; x=1737366831; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tYam0PHNUR63LLlWlH1Vtdfw12t5C9h1Tb67zYZaKyw=;
 b=LJWBsjiP9vIa7qAC7+7oQd2wSV8Vx4UfffpL8y3P4HjDDa/HfGzRonHhOJVXzQiV7F
 z39jv+cCJCsXnSeciSaZ2Ib/ma/fnA+1mcEJOW0WFjCu07CSDpBAzZxAl9vmqlygLkwb
 CxRdc1YuNtlw8WNukJxa0S8dMdy9kU22e9+jFWOyGPfnAkhbsvSDU1jyvFduT86On1Za
 l7YiXUmdk4BdToO8IqXyag+nufpWZrCKoiLyz5eC/+tGB6OHMx6AVhIFFZ41kjIWezVn
 xbU5zj3xIe+eX/sVZoC0xdmPvg8EkIFvleVq7TNklJNxxTit5ZqeFE3UvmOzAMqU18wQ
 YdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736762031; x=1737366831;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYam0PHNUR63LLlWlH1Vtdfw12t5C9h1Tb67zYZaKyw=;
 b=TN1nAkNTfsqWaoACy1TRwmg0HLA6G9cLox9WQyHnZwKuGjR3xGWq3Pej4kFQ8kyIzt
 rzxPEaqrqcsVpAIgtsB4cpOppn2NenCkYEkCpZ0l0hQ4SdcMVyM2zFBJlnodsg3cZ6Je
 TCDxVHK5bFigld365aqOjJD/R3hOUCDjQIu8F1m14a87uVV8e63TsQc3REPXECLajwn5
 fFQJs/IG+PshzCHNjUp/nh/UWeSsR0Xc3DUb7Vb4kWgQjIjiewuSo3wBS+aDmQDTBa7H
 VHd40mVBeOeq1oOXJ3p7mGKtFZcmjT0sKhxWJxrDDm77OfKPGlhvwXDlUbXrckoxjBNi
 x79A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOQ3KVUay294PUQOt3ofbIxB3sYEkVLHG0VoOFDXzXWcxS4UDpoVM/60NE1Ql8kp7RT5dfTw2K0os=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlAd5ymdWrvUKxs5xAc3II0tDZ6que8RPCLd6swjdzKc6oy5UO
 eVAqjzgcG3CxHXbR0Bieo4ViUrsNgVhYo/g/FGNrc9GT3acvqN7Vqk4KWk3Eo2I=
X-Gm-Gg: ASbGnctmGfsgwp3SBpnfhTqkBWTH/EGwyN/O1/NRDNzfE+c7bDK11MbS+dOKYie2u7Y
 eKIdB7je4WYa8Hbzo0uSi3RCzdQBrKsvp4szdEWesXMXFrQ3tN+J8qjoNEPNE/e7uJsl3tiDWO9
 z4U+a0g4bIdvI3EzUM/UZ41MgZ8r31bCIzYokb7+a2igp9TU4NHPuTeh7YTGw9km8iUWXBsE55y
 OPqd0k+HJK52gQXMyHu3nGaQ+0T3MKtkAysFDmd9y6sGQlNhqKaXtcWBEORv4AQ
X-Google-Smtp-Source: AGHT+IEgZgMT6aGcz1FkeuACFwbNLj4TxthV4kSPiuMJ/6t2E3WuFNbC0Qw+Px78twvyB2hiXv5GzQ==
X-Received: by 2002:a05:6512:318b:b0:542:23b2:8010 with SMTP id
 2adb3069b0e04-5428a68a3e5mr4531967e87.23.1736762031085; 
 Mon, 13 Jan 2025 01:53:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6a67sm1287085e87.167.2025.01.13.01.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:53:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 Jan 2025 11:53:46 +0200
Subject: [PATCH v3 3/3] drm/i2c: move TDA998x driver under
 drivers/gpu/drm/bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-drm-move-tda998x-v3-3-214e0682a5e4@linaro.org>
References: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
In-Reply-To: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4689;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ic17kfBFEswigerUPPyAWbVpLAW5I7CJRGIoF3f2Cz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnhOKqewzGoygP5cg0eoYvM91fAPhTv299hcS1p
 OK4U+10NraJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4TiqgAKCRCLPIo+Aiko
 1ZINCACp1RNdlKNHD1se30iTWT5n30rRxiyxYCZcqKUjC5TLJQ5gmkz2sv+HltGnP/RxTLTdp41
 0WvWsU9C0PO7X/KXxRUzP1A7Dzwll13s0kxmMDJf1+tbBMQgiLBKqbeZNSjKgIeTzZAQg5+v94n
 MSiG2ONdyWD0JY/dxl3rSRWCLNRZnE9J7mCnXoe7LRtBDBF+vL7j4sVkKenzUbB4dbXixGaqdz5
 JLtz6MEnjtW7susXlaSx+L6bHYP7SPIfuzCfs6WnHn+QqKMFG7byaSskl5rEL4LWOvbHU7E3lpx
 K69eJ4UwN9AlE3ZYk3oeWu82lrvS/ESmhG2XKt9FoLalcI93
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

TDA998x is the HDMI bridge driver, incorporating drm_connector and
optional drm_encoder (created via the component bind API by the TICLDC
and HDLCD drivers). Thus it should be residing together with the other
DRM bridge drivers under drivers/gpu/drm/bridge/.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                                   |  2 +-
 drivers/gpu/drm/arm/Kconfig                   |  1 +
 drivers/gpu/drm/bridge/Kconfig                |  8 ++++++++
 drivers/gpu/drm/bridge/Makefile               |  4 ++++
 drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c |  0
 drivers/gpu/drm/i2c/Kconfig                   | 13 -------------
 drivers/gpu/drm/i2c/Makefile                  |  3 ---
 7 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 223eb6bfd0579768c246dcc51831048627fb8d02..7a15fb49c2905dcba7bc08f03abe12bd7f493f84 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17045,7 +17045,7 @@ M:	Russell King <linux@armlinux.org.uk>
 S:	Maintained
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
-F:	drivers/gpu/drm/i2c/tda998x_drv.c
+F:	drivers/gpu/drm/bridge/tda998x_drv.c
 F:	include/dt-bindings/display/tda998x.h
 K:	"nxp,tda998x"
 
diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index c901ac00c0c3a8f356bd53d97305c6b39b3e6662..ed3ed617c6884876368c8bd072c53f1b710df443 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -9,6 +9,7 @@ config DRM_HDLCD
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
+	select DRM_BRIDGE # for TDA998x
 	help
 	  Choose this option if you have an ARM High Definition Colour LCD
 	  controller.
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6b4664d91faa80f096ac6a0548ed342e802ae68b..d20f1646dac27898ecb7599a9a06663357dcca14 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,14 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_I2C_NXP_TDA998X
+       tristate "NXP Semiconductors TDA998X HDMI encoder"
+       default m if DRM_TILCDC
+       select CEC_CORE if CEC_NOTIFIER
+       select SND_SOC_HDMI_CODEC if SND_SOC
+       help
+         Support for NXP Semiconductors TDA998X HDMI encoders.
+
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 97304b429a530c108dcbff906965cda091b0a7a2..245e8a27e3fc525ffe02103e4436c71313f55d9a 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,10 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+
+tda998x-y := tda998x_drv.o
+obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
+
 obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
similarity index 100%
rename from drivers/gpu/drm/i2c/tda998x_drv.c
rename to drivers/gpu/drm/bridge/tda998x_drv.c
diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
deleted file mode 100644
index 1aa2a0bf5cc183b4ce92fc4f7eb61fd0065250d1..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/i2c/Kconfig
+++ /dev/null
@@ -1,13 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-menu "I2C encoder or helper chips"
-     depends on DRM && DRM_KMS_HELPER && I2C
-
-config DRM_I2C_NXP_TDA998X
-	tristate "NXP Semiconductors TDA998X HDMI encoder"
-	default m if DRM_TILCDC
-	select CEC_CORE if CEC_NOTIFIER
-	select SND_SOC_HDMI_CODEC if SND_SOC
-	help
-	  Support for NXP Semiconductors TDA998X HDMI encoders.
-
-endmenu
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
deleted file mode 100644
index 45791fbfae983eecf58565109cf8eecb6431643b..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/i2c/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-tda998x-y := tda998x_drv.o
-obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o

-- 
2.39.5

