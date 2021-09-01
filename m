Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BCD3FE3B2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51956E2C7;
	Wed,  1 Sep 2021 20:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5407D6E2C7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:20:39 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id m26so747630pff.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8qwumdZ9oBSWiOJWekiuI9kVQEVD+hbH3p2QOU9bho=;
 b=dGj++XtGx8+YT5EUHae2J5PWQLwHqUTj2jp6r/tq26hWAY1hkxlVyj7ULBKz4DkFSj
 VjCPkPykivBT/WV4nRKWjF3HSnfpPda6cQXInEjQeCNQDUwE5yYaF3bHA2df7g1REnUm
 MQ5qPM6zRYAaqR6MAT3gxj62FAX1+fkS/ngdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8qwumdZ9oBSWiOJWekiuI9kVQEVD+hbH3p2QOU9bho=;
 b=J+3VxG3AtPiMrrY+7KtQj5qt8HGxlc7I6SJeEvv3qi7LjTVR6rS/xbQSGNW2gd44/w
 A5keYLqWU8QEIjq8tbAi8/S0Unrb++XojoCfJ2BrytKASt2+4+4LFbRCsmnXR4lHVjsR
 3gW5A9pxA9ZyHT478AT69AR4B7bAbGqSvo5U8JtpHHSEaT+gBRyLIgSJRqUgi+xH4rE5
 eOx84fenT76Diz2HyqUIx7XOBRSkw3R4aD19n3vIyRScbVgOlZEQUEngrPyoRQEaUprU
 CHdj/3N3yXf5pAgPE8VCMdz8sTMjKrRPtnMrE45Nzf5fA5bbYJ7RSKvXoABxul2LKQJn
 hX0Q==
X-Gm-Message-State: AOAM532a4vWp/ckSPf0uaZ3uHgPsEgLTfH2xPCgEEYp/9IgJrPX2c8Gs
 C5kS6hkcXfZ5Cb7LPl5v4hQUtQ==
X-Google-Smtp-Source: ABdhPJwKHIxkRf8tll3o/JV+NozSZXR8JXT86l6s5dscYRAz4FpIBM4E8sqjB/y0dJgJoM/pnV6YcQ==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr819727pga.50.1630527638889;
 Wed, 01 Sep 2021 13:20:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:958b:b561:a735:e774])
 by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 13:20:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Fabio Estevam <festevam@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lionel Debieve <lionel.debieve@st.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Olivier Moysan <olivier.moysan@st.com>, Olof Johansson <olof@lixom.net>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Razvan Stefanescu <razvan.stefanescu@microchip.com>,
 Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE now gets
 PANEL_SIMPLE_EDP
Date: Wed,  1 Sep 2021 13:19:24 -0700
Message-Id: <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In the patch ("drm/panel-simple-edp: Split eDP panels out of
panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
give everyone who had the old driver enabled the new driver too. If
folks want to opt-out of one or the other they always can later.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm/configs/at91_dt_defconfig   | 1 +
 arch/arm/configs/exynos_defconfig    | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm/configs/lpc32xx_defconfig   | 1 +
 arch/arm/configs/multi_v5_defconfig  | 1 +
 arch/arm/configs/multi_v7_defconfig  | 1 +
 arch/arm/configs/omap2plus_defconfig | 1 +
 arch/arm/configs/qcom_defconfig      | 1 +
 arch/arm/configs/realview_defconfig  | 1 +
 arch/arm/configs/sama5_defconfig     | 1 +
 arch/arm/configs/shmobile_defconfig  | 1 +
 arch/arm/configs/sunxi_defconfig     | 1 +
 arch/arm/configs/tegra_defconfig     | 1 +
 arch/arm/configs/versatile_defconfig | 1 +
 arch/arm/configs/vexpress_defconfig  | 1 +
 15 files changed, 15 insertions(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index b1564e0aa000..3c92ba8c850d 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_MT9V032=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_FB_ATMEL=y
 CONFIG_BACKLIGHT_ATMEL_LCDC=y
 CONFIG_BACKLIGHT_PWM=y
diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index f4e1873912a3..3fc348d5765d 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -227,6 +227,7 @@ CONFIG_DRM_EXYNOS_DPI=y
 CONFIG_DRM_EXYNOS_DSI=y
 CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_PANEL_SAMSUNG_LD9040=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 079fcd8d1d11..ece13c0dc153 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -280,6 +280,7 @@ CONFIG_DRM=y
 CONFIG_DRM_MSM=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
 CONFIG_DRM_TI_TFP410=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 989bcc84e7fb..86db9cdced97 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -108,6 +108,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 80a3ae02d759..fab163305918 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -194,6 +194,7 @@ CONFIG_VIDEO_ATMEL_ISI=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=m
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_ASPEED_GFX=m
 CONFIG_FB_IMX=y
 CONFIG_FB_ATMEL=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d9abaae118dd..d299d0045823 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -699,6 +699,7 @@ CONFIG_DRM_TEGRA=y
 CONFIG_DRM_STM=m
 CONFIG_DRM_STM_DSI=m
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
 CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
 CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 2ac2418084ab..dcc55aa62d69 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -511,6 +511,7 @@ CONFIG_OMAP2_DSS_DSI=y
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_PANEL_DSI_CM=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_SIMPLE_EDP=m
 CONFIG_DRM_PANEL_LG_LB035Q02=m
 CONFIG_DRM_PANEL_NEC_NL8048HL11=m
 CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 26353cbfa968..37116db013f8 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -158,6 +158,7 @@ CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
 CONFIG_DRM_MSM=m
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_ANALOGIX_ANX78XX=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index 4c01e313099f..c433890fc4e9 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -61,6 +61,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 17db3b3e2dd3..c2ab428e6327 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -160,6 +160,7 @@ CONFIG_VIDEO_MT9V032=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index d9a27e4e0914..3b3e9a16c956 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -129,6 +129,7 @@ CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_LVDS_CODEC=y
 CONFIG_DRM_SII902X=y
diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index a60c134c5e04..f6b4f6684631 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -108,6 +108,7 @@ CONFIG_DRM_SUN4I_HDMI_CEC=y
 CONFIG_DRM_SUN8I_DW_HDMI=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_LIMA=y
 CONFIG_FB_SIMPLE=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 3d8d8af9524d..918134415254 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -204,6 +204,7 @@ CONFIG_DRM_TEGRA=y
 CONFIG_DRM_TEGRA_STAGING=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_LVDS_CODEC=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index b703f4757021..f424671523a9 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -57,6 +57,7 @@ CONFIG_GPIO_PL061=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_ARM_VERSATILE=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index b5e246dd23f4..baf9c7810a14 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -77,6 +77,7 @@ CONFIG_SENSORS_VEXPRESS=y
 CONFIG_REGULATOR_VEXPRESS=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_PL111=y
 CONFIG_FB=y
-- 
2.33.0.259.gc128427fd7-goog

