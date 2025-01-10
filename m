Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1BDA0907D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 13:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D974E10F084;
	Fri, 10 Jan 2025 12:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KmsHaL98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BBA10F084
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:33:04 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54026562221so2048837e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 04:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736512323; x=1737117123; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hiEWcElxhZTK73TnXgswdyP6JxZMw7F27l1xnn3hpWk=;
 b=KmsHaL98Gvwf8yoJ4Szh9WfORMKLqAKjTjOXooaL7DF/DhE87ZQV6CsLZin3cdQC9k
 yieFsRjx9t/eJyUH4A98KwhH0EfSEBFzMmCaLWQqhoQaVDHr163rdb9Kwa5lgIGLursY
 DZn4khu96VIF8ZDlsjgzbpEEtNShMgWPEdZYG5pDkqddgfxZGME2CJ4XkwRnfDec/dgL
 MxMIbLcc2yVIl51hkXWIPKZSOtVslXI/dK03JUzFDPZc2kqVaGGTrzDMSHih1kx2x9/W
 AN4sm+TSLfT/EUyHtwgLVwQdWhRLrTJeSJhuo1sNNrrfsKxTqzShvmtGlawokCpETg99
 aBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736512323; x=1737117123;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hiEWcElxhZTK73TnXgswdyP6JxZMw7F27l1xnn3hpWk=;
 b=Id5V2zqkdXXomglfTs+2xMO1cdGzX3YNeTm1DlVs5rCYMq1MMZWAhQeOzOAnsu2X22
 QipNdrGdlVOlPUu4RszXZKaCeRn0vPKHSCZoqSYWCZCmUylf4iM1CllB03U2EWXN5iiX
 fNYkQxIt5/73TSxnghtutcO4G55Xn02KvJFbK3itR/RxvJAfuzL2qrBOZWe6xdQ7kFcg
 JprcpHOCuzfrktJCLtNdpedOoqKTlLz9hqplDLW/9n6HE3QHuzJq9h8PzeAdUn/AxaLt
 fxVREODQhTdWKfuX2UneGvJK1xHIVjQRXptN0dVoMLSk0e6SVgTzcxC/OGrThW8AOVe5
 tvhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgz9cJjT86IC+qh6aWGD1NOd+K0ux86gE+5SJD4LD2pO2AyFke7kDwSzan4DePIvO04qrs9p75oLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO4kn6+tcVdFb+H337UR44X/QkYy+RI12R8RuHvCTgEQ5Yow3r
 jynK6PA8pSARgTnSjK3vJQYwG0vpEfchuc6mA5a652t7LY6p8W5tBLXJud61zjI=
X-Gm-Gg: ASbGncsk/X96iNLJI7bpiQK1GiqcUgJ/PKUpMgOHijY7FpOwqEgjlnCD3OIGRoCdSk1
 Wjdlt/MsFAgknOkuinU0iOwV52wzzQcGkfJi77GxCFhke7kmBvwCK8maMM6iE1qZRNix0gQ9AIc
 MeKHVzHnoYY2NCHnxUdarzoRhJNuyDTamJwL3hdQz0vItZ+HUpbZHv6wItv8+tKzkHhy798+XPq
 f095ACNgq3+XGh1/h65WvuPe7Q2vtrN4vVPnP1/WzyicYqE8We7kJHmDLyjrZeT
X-Google-Smtp-Source: AGHT+IHDSOgExi0q9r6Qp60KV0c5WHDnz8FIQrxe1koxDTMIZtWbTmGKRVyZC0HDHCHMKRyp+Z0SjA==
X-Received: by 2002:a05:651c:1a0c:b0:2fc:9622:794b with SMTP id
 38308e7fff4ca-305f45a4294mr31226241fa.24.1736512322679; 
 Fri, 10 Jan 2025 04:32:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0cedafsm4720691fa.29.2025.01.10.04.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 04:32:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 14:31:55 +0200
Subject: [PATCH v2 3/3] drm/i2c: move TDA drivers under drivers/gpu/drm/bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-move-tda998x-v2-3-ef2ae5832d21@linaro.org>
References: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
In-Reply-To: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4898;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=g+7ytvieuvI7RKTOj/q24QGGdISGbPrB0TEqnLrOfZk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qjsE0c92aDhzJ7Yv13+amIte8Pn708fZ1ERGhtM9M3N
 zbF6X86GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARxbns/xN+Z3QWbFrlw68o
 GTldfeuBh+I+fL/UU23C4ifv9j7YevdqVQmf8Z8Pk3r61UvmMnbNKTsRandK/9c/FxtF+6eL/Q7
 93aAZIcjz/0rF7PwPU26HM75c+TfrdXCAtNnT3Jn7e+ez9//J+WmcuqztR3M7X3LSUtdN5kanRU
 OD3ntvU/vtfe90kHXYcv3SVSo85nwqPi6fzCLfbr5y8PDi2F3TIkqyg5eZX7rg8iNyl5m4VuP0x
 6cWrubJOuns7Lcp7L1u6IVnhl2nZCM8kvdtt5h86EGChLjOyaLkpcmsAlbaSh28PiKCzzVcLu/y
 MDHgTW+YbDt9Zt9ZxgrLNTWJN++vyXhazzLL7+MF7oxyAA==
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

TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
and TDA19989 chips, so it is being instantiated by the TDA998x driver.
Move it together with the TDA998x under bridge drivers subdir.

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

