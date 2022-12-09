Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F18648A8B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 23:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EB110E58B;
	Fri,  9 Dec 2022 22:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509E10E590
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 22:06:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3lVS-0004Cr-71; Fri, 09 Dec 2022 23:06:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3lVN-003Rl1-6k; Fri, 09 Dec 2022 23:06:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3lVN-003s4M-7n; Fri, 09 Dec 2022 23:06:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomi Valkeinen <tomba@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] drm: Drop ARCH_MULTIPLATFORM from dependencies
Date: Fri,  9 Dec 2022 23:05:54 +0100
Message-Id: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3841;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=g7U++VBYjsw72zS1Mwx3VnFa6URcPWkN6VrvjEwwg+s=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjk7E/6dUH2l3E5Z1fbm4ZVcX+8Ul6vtdDy7DiDQTE
 jebjo+eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5OxPwAKCRDB/BR4rcrsCW5TB/
 4lA5OoB41UM9P/8u1JBYMhLilxGrFM1Y54iJlvJgc/oXkK1jJMZ5g4Z0wDyUJk+jaOjTZ+ucgbEcvZ
 TbVwY98MfzHS/YBINUJgmf9I0iZW5TSZn1stSHaFUF1zPa0lChc2eEU2HvshYM9y98rdcRGjv03q8B
 +OFu/jfxW55oiq0x5Vwh7XU2YiX5+sKJDYmG2t1+M4OzzM09d6G/MA2VHlE5q3WtuQbUDjo9vEJPXj
 HuNDm6s+dzgZGQOSO6tzbv0/N6YOdsPnVDdCz3sSglOH8OQtFPkInp7Cf/ceRjnNANv442zRzK6Gmb
 qIjlDkziphIEaaVCEa2nIGiqLEm0Bp
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of these dependencies used to be sensible when only a small part of
the platforms supported by ARCH=arm could be compiled together in a
single kernel image. Nowadays ARCH_MULTIPLATFORM is only used as a guard
for kernel options incompatible with a multiplatform image. See commit
84fc86360623 ("ARM: make ARCH_MULTIPLATFORM user-visible") for some more
details.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/exynos/Kconfig  | 2 +-
 drivers/gpu/drm/imx/Kconfig     | 2 +-
 drivers/gpu/drm/omapdrm/Kconfig | 2 +-
 drivers/gpu/drm/sti/Kconfig     | 2 +-
 drivers/gpu/drm/stm/Kconfig     | 2 +-
 drivers/gpu/ipu-v3/Kconfig      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 3d2f025d4fd4..4049fa4273ab 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -2,7 +2,7 @@
 config DRM_EXYNOS
 	tristate "DRM Support for Samsung SoC Exynos Series"
 	depends on OF && DRM && COMMON_CLK
-	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST
+	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	depends on MMU
 	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index fd5b2471fdf0..773888839497 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -4,7 +4,7 @@ config DRM_IMX
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select DRM_GEM_DMA_HELPER
-	depends on DRM && (ARCH_MXC || ARCH_MULTIPLATFORM || COMPILE_TEST)
+	depends on DRM && (ARCH_MXC || COMPILE_TEST)
 	depends on IMX_IPUV3_CORE
 	help
 	  enable i.MX graphics support
diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 455e1a91f0e5..76ded1568bd0 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -2,7 +2,7 @@
 config DRM_OMAP
 	tristate "OMAP DRM"
 	depends on DRM && OF
-	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
+	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select HDMI
diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
index f2a880c48485..3c7a5feff8de 100644
--- a/drivers/gpu/drm/sti/Kconfig
+++ b/drivers/gpu/drm/sti/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_STI
 	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
-	depends on OF && DRM && (ARCH_STI || ARCH_MULTIPLATFORM)
+	depends on OF && DRM && ARCH_STI
 	select RESET_CONTROLLER
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
diff --git a/drivers/gpu/drm/stm/Kconfig b/drivers/gpu/drm/stm/Kconfig
index ded72f879482..fa49cde43bb2 100644
--- a/drivers/gpu/drm/stm/Kconfig
+++ b/drivers/gpu/drm/stm/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_STM
 	tristate "DRM Support for STMicroelectronics SoC Series"
-	depends on DRM && (ARCH_STM32 || ARCH_MULTIPLATFORM)
+	depends on DRM && ARCH_STM32
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/ipu-v3/Kconfig b/drivers/gpu/ipu-v3/Kconfig
index 061fb990c120..7dece2a53c5c 100644
--- a/drivers/gpu/ipu-v3/Kconfig
+++ b/drivers/gpu/ipu-v3/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config IMX_IPUV3_CORE
 	tristate "IPUv3 core support"
-	depends on SOC_IMX5 || SOC_IMX6Q || ARCH_MULTIPLATFORM || COMPILE_TEST
+	depends on SOC_IMX5 || SOC_IMX6Q || COMPILE_TEST
 	depends on DRM || !DRM # if DRM=m, this can't be 'y'
 	select BITREVERSE
 	select GENERIC_ALLOCATOR if DRM

base-commit: 0d1409e4ff08aa4a9a254d3f723410db32aa7552
-- 
2.38.1

