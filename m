Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A41923A96
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D1D10E5A9;
	Tue,  2 Jul 2024 09:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mP8qjxWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0510E5A3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:48:59 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso42345921fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719913737; x=1720518537; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zMfKgTFDHkwJCeUJvNPaxF1oMIhQ0c5OI5BCMTfEDCs=;
 b=mP8qjxWTLzGBDpX1LTNm1jP6geJlPNhuDR22+U5xYVbq7y7Z4g64JZdjf3jUNcF8ih
 NPhicEu60jZPoQJh7UYQbxH9AWlfJy4zBXzBlBjzP3YFuGQBng/EVFL1S8U+iGUQWkiA
 lzET1rf9QSppyY1AEWMeKqwn72g4OLmwNhmZylI9VdwKs9LWFX7HXsxf7tOz7yw8LDta
 J9lJyIYC87/s3nyg2OGbWS1M/domxUDqOw3tu4wEk+WZ0LQMpo+4yVD3f4SkyVdEqVms
 XQ3BGZGgLpvJgb7wfiRFtZfmpxhh/yxbb18wnB4CcJFVEQy8UqGdIqx9JfVjKOcpd6z3
 1EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719913737; x=1720518537;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMfKgTFDHkwJCeUJvNPaxF1oMIhQ0c5OI5BCMTfEDCs=;
 b=pTDWgPX+93KZrDN7fA6dkLp+CvV/89zIX7SyQoGeJ3TStoOO3zIJfmxfmcLNt/zMeG
 wllnRyB9MB7exxC43jqQjLLLiXLDgl7xc/mJvRjLaOpwHVHubHhsGUNQTO5Gy2NyZUTK
 Mh09piksr5ZGB5MjdQw/JcPvnlJ80c/n2msAERdoEBwwvfWO5DroYfFQlXKEEm2/gWkc
 1yzgUf+cKHfWaQC7vyvzqDqa1C7iJ2HKLw9Ad7xD6jy5c+eJLdT1WqFLofgII0dwtKl4
 tIGJ+Mm8m/H0NsUxA6cPRqsXpCBnWWf29+1ToAHL9vEq3+cjyarOd0kK/ZQTIdUoCAji
 Wq6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiBRtjoMtGnsMGPptf+s4bauih8qoueHySqe44VkFmpntjEClVwsybe2UY0xKdvaReTwicdKJXvldK2k+Warb4vsCgB9CkZhoVK4Bwa8CH
X-Gm-Message-State: AOJu0Yw4/BsukwFIMZte6cl4asgwz5e6Kve3xkWfaniKB2Qk4aYda4dJ
 6g0AalKS+7s972IY+CpbsIoqexjEKFky7MG3RFqGOfonELHQlhc2vXtyhfObFBc=
X-Google-Smtp-Source: AGHT+IFdaqNk/YBQI79JMZgPPVDzQ8r2QaVueo1kugYWDyxFiIuMlN4vOElT1qOB4NowPdRrYtbqSQ==
X-Received: by 2002:a2e:a702:0:b0:2ed:a091:f54c with SMTP id
 38308e7fff4ca-2ee5e3ae50emr42630861fa.23.1719913736322; 
 Tue, 02 Jul 2024 02:48:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160e333sm16231161fa.5.2024.07.02.02.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:48:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jul 2024 12:48:54 +0300
Subject: [PATCH v3 3/4] drm/bridge-connector: move to DRM_DISPLAY_HELPER module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-3-12b0e3124ca4@linaro.org>
References: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
In-Reply-To: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11112;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEu8F3MssoKDb+QQZWwR5R5Ax2lz2UkYvPYt1wioZ5M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmg80F8ZWyWkyyc3QAemCdZTBWhJfq0V0Gs+fkf
 iMxBwUvTwWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZoPNBQAKCRCLPIo+Aiko
 1fR6B/0ZTaw/CY4NGnO6mbaRwCOlUXuVLCAKQSb4NnIy0rVV3JiDoP30xWsYPx9GneZianjjudG
 J988rMbqJ8qNRGZ2hLkpRUujNu2HTlp9PgTK5Ol2HzuXZTESZ79JpkvmsSXCHPeIYgwXK/psHTN
 s5G4KsSilB9lvqDhiRW8t3VpiPJPJSEb/BDt7LyMvPNh4RKgJ9MML1EkQc5Zn8VIC6PzkQgh0Sj
 XfjiGyO9ziGtJjG9EjbztUlGk3XxjrYxrF1mcINGFuKr6rSe7IbkEPUrpFz+exggCs0RoDRPqL+
 4y371LVTPvFETDH5aWWTPEltPanW70x4mG7fKrNNfKD0GPXg
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

drm_bridge_connector is a "leaf" driver, belonging to the display
helper, rather than the "CRTC" drm_kms_helper module. Move the driver
to the drm/display and add necessary Kconfig selection clauses.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/Makefile                             | 1 -
 drivers/gpu/drm/bridge/Kconfig                       | 1 +
 drivers/gpu/drm/display/Kconfig                      | 6 ++++++
 drivers/gpu/drm/display/Makefile                     | 2 ++
 drivers/gpu/drm/{ => display}/drm_bridge_connector.c | 0
 drivers/gpu/drm/imx/dcss/Kconfig                     | 2 ++
 drivers/gpu/drm/imx/lcdc/Kconfig                     | 2 ++
 drivers/gpu/drm/ingenic/Kconfig                      | 2 ++
 drivers/gpu/drm/kmb/Kconfig                          | 2 ++
 drivers/gpu/drm/mediatek/Kconfig                     | 2 ++
 drivers/gpu/drm/meson/Kconfig                        | 2 ++
 drivers/gpu/drm/msm/Kconfig                          | 1 +
 drivers/gpu/drm/omapdrm/Kconfig                      | 2 ++
 drivers/gpu/drm/renesas/rcar-du/Kconfig              | 2 ++
 drivers/gpu/drm/renesas/rz-du/Kconfig                | 2 ++
 drivers/gpu/drm/renesas/shmobile/Kconfig             | 2 ++
 drivers/gpu/drm/rockchip/Kconfig                     | 4 ++++
 drivers/gpu/drm/tegra/Kconfig                        | 1 +
 drivers/gpu/drm/tidss/Kconfig                        | 2 ++
 drivers/gpu/drm/xlnx/Kconfig                         | 1 +
 20 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 68cc9258ffc4..fa432a1ac9e2 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -128,7 +128,6 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 drm_kms_helper-y := \
 	drm_atomic_helper.o \
 	drm_atomic_state_helper.o \
-	drm_bridge_connector.o \
 	drm_crtc_helper.o \
 	drm_damage_helper.o \
 	drm_encoder_slave.o \
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c621be1a99a8..3eb955333c80 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -390,6 +390,7 @@ config DRM_TI_SN65DSI86
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 479e62690d75..1a192a45961b 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -6,6 +6,12 @@ config DRM_DISPLAY_HELPER
 	help
 	  DRM helpers for display adapters.
 
+config DRM_BRIDGE_CONNECTOR
+	bool
+	depends on DRM && DRM_BRIDGE && DRM_DISPLAY_HELPER
+	help
+	  DRM connector implementation terminating DRM bridge chains.
+
 config DRM_DISPLAY_DP_AUX_BUS
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 629df2f4d322..fbb9d2b8acd4 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -3,6 +3,8 @@
 obj-$(CONFIG_DRM_DISPLAY_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_display_helper-y := drm_display_helper_mod.o
+drm_display_helper-$(CONFIG_DRM_BRIDGE_CONNECTOR) += \
+	drm_bridge_connector.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_dual_mode_helper.o \
 	drm_dp_helper.o \
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
similarity index 100%
rename from drivers/gpu/drm/drm_bridge_connector.c
rename to drivers/gpu/drm/display/drm_bridge_connector.c
diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 3ffc061d392b..59e3b6a1dff0 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -2,6 +2,8 @@ config DRM_IMX_DCSS
 	tristate "i.MX8MQ DCSS"
 	select IMX_IRQSTEER
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	depends on DRM && ARCH_MXC && ARM64
diff --git a/drivers/gpu/drm/imx/lcdc/Kconfig b/drivers/gpu/drm/imx/lcdc/Kconfig
index 7e57922bbd9d..9c28bb0f4662 100644
--- a/drivers/gpu/drm/imx/lcdc/Kconfig
+++ b/drivers/gpu/drm/imx/lcdc/Kconfig
@@ -3,5 +3,7 @@ config DRM_IMX_LCDC
       depends on DRM && (ARCH_MXC || COMPILE_TEST)
       select DRM_GEM_DMA_HELPER
       select DRM_KMS_HELPER
+      select DRM_DISPLAY_HELPER
+      select DRM_BRIDGE_CONNECTOR
       help
         Found on i.MX1, i.MX21, i.MX25 and i.MX27.
diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 3db117c5edd9..8cd7b750dffe 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -8,6 +8,8 @@ config DRM_INGENIC
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select REGMAP
 	select REGMAP_MMIO
diff --git a/drivers/gpu/drm/kmb/Kconfig b/drivers/gpu/drm/kmb/Kconfig
index fd011367db1d..e5ae3ec52392 100644
--- a/drivers/gpu/drm/kmb/Kconfig
+++ b/drivers/gpu/drm/kmb/Kconfig
@@ -3,6 +3,8 @@ config DRM_KMB_DISPLAY
 	depends on DRM
 	depends on ARCH_KEEMBAY || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DSI
 	help
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index d6449ebae838..417ac8c9af41 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -9,6 +9,8 @@ config DRM_MEDIATEK
 	depends on MTK_MMSYS
 	select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select MEMORY
diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index 615fdd0ce41b..2544756538cc 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -4,6 +4,8 @@ config DRM_MESON
 	depends on DRM && OF && (ARM || ARM64)
 	depends on ARCH_MESON || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_DISPLAY_CONNECTOR
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 26a4c71da63a..90c68106b63b 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -17,6 +17,7 @@ config DRM_MSM
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 6c49270cb290..0c6d5afc1ef4 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -4,6 +4,8 @@ config DRM_OMAP
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index c17e7c50492c..025677fe88d3 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -5,6 +5,8 @@ config DRM_RCAR_DU
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 5f0db2c5fee6..e1a6dd322caf 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -6,6 +6,8 @@ config DRM_RZG2L_DU
 	depends on VIDEO_RENESAS_VSP1
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you have an RZ/G2L alike chipset.
diff --git a/drivers/gpu/drm/renesas/shmobile/Kconfig b/drivers/gpu/drm/renesas/shmobile/Kconfig
index 027220b8fe1c..c329ab8a7a8b 100644
--- a/drivers/gpu/drm/renesas/shmobile/Kconfig
+++ b/drivers/gpu/drm/renesas/shmobile/Kconfig
@@ -5,6 +5,8 @@ config DRM_SHMOBILE
 	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 7df875e38517..23c49e91f1cc 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -86,6 +86,8 @@ config ROCKCHIP_LVDS
 	bool "Rockchip LVDS support"
 	depends on DRM_ROCKCHIP
 	depends on PINCTRL && OF
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option to enable support for Rockchip LVDS controllers.
 	  Rockchip rk3288 SoC has LVDS TX Controller can be used, and it
@@ -96,6 +98,8 @@ config ROCKCHIP_RGB
 	bool "Rockchip RGB support"
 	depends on DRM_ROCKCHIP
 	depends on PINCTRL
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  Choose this option to enable support for Rockchip RGB output.
 	  Some Rockchip CRTCs, like rv1108, can directly output parallel
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 782f51d3044a..e688d8104652 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -8,6 +8,7 @@ config DRM_TEGRA
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/tidss/Kconfig b/drivers/gpu/drm/tidss/Kconfig
index 378600806167..2385c56493b9 100644
--- a/drivers/gpu/drm/tidss/Kconfig
+++ b/drivers/gpu/drm/tidss/Kconfig
@@ -3,6 +3,8 @@ config DRM_TIDSS
 	depends on DRM && OF
 	depends on ARM || ARM64 || COMPILE_TEST
 	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	help
 	  The TI Keystone family SoCs introduced a new generation of
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 68ee897de9d7..626e5ac4c33d 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -8,6 +8,7 @@ config DRM_ZYNQMP_DPSUB
 	select DMA_ENGINE
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select GENERIC_PHY

-- 
2.39.2

