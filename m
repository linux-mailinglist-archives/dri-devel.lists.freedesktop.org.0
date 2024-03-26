Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B288C002
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761C710EE67;
	Tue, 26 Mar 2024 10:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iykCeujz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84FB10EE64
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:57:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C37F560DB4;
 Tue, 26 Mar 2024 10:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F00C433C7;
 Tue, 26 Mar 2024 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711450631;
 bh=kIy+SAKcGbI3RqEUeocmP6GKIk2I79hGffUfhzlx0Gk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iykCeujzEevIkD3ZoDjfuFzntUqJT8+BOHBrEQVh0NxMX44qcjywDofs4Zh7h2ZS2
 K1WvUcAuadF/oQ5CjFGeghOytyZnXPmCKZ2Grnoz/B8dolrIclwmSg+aK7MBGzULrR
 BIT5Ksz8ciHexUNsB0NEqybhxWlpqM1XtkfivaIByTAt4UOqh5KJ05/uNZH/1qwumC
 2ks3KY/cFWB+SSYrTJPo4q2d3k4bA6vEVOGa0+8Pq1NAzFluQ3Zno06R0yhlAzXOLY
 RNL6TE2ArKxZVF0u7d69pP2AL2QnNJ7CYuSyVaDiU0n8z50SaVhv4HMvCskg2rs/5J
 HzYb10gsAaBPg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 Mar 2024 11:56:21 +0100
Subject: [PATCH v2 08/12] drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-kms-kconfig-helpers-v2-8-3b0aeee32217@kernel.org>
References: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
In-Reply-To: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7718; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kIy+SAKcGbI3RqEUeocmP6GKIk2I79hGffUfhzlx0Gk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMK28sbRSPfbj/yZUZ6Sc53p/mm7csVvH31HPff5cd9
 XyhE9++q2MqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5KQrY31VcJ5rctrlPTyt
 SXNNKheUpmxTLPfa7rbJxURR/fSsU/W/Zt0vn8HT7GvIcMm/dKPyL8Z6t13LJznukr/ynf/sL46
 cvg0rEtWebzhfeOfOiRcdzw6vdfKb41K/jOH6LDHTe1s+v9Y6AAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Most of our helpers have relied on being selected so far through
Kconfig, but that creates issues when we have multiple layers of helpers
with some depending on others.

Indeed, select doesn't select a dependency's dependencies, and thus
isn't super intuitive. Depends on however doesn't have that limitation,
so we can just switch all the drivers that were selecting
DRM_DISPLAY_DP_AUX_BUS to depend on it.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig          | 6 +++---
 drivers/gpu/drm/bridge/analogix/Kconfig | 2 +-
 drivers/gpu/drm/display/Kconfig         | 1 +
 drivers/gpu/drm/mediatek/Kconfig        | 2 +-
 drivers/gpu/drm/msm/Kconfig             | 2 +-
 drivers/gpu/drm/panel/Kconfig           | 4 ++--
 drivers/gpu/drm/tegra/Kconfig           | 2 +-
 7 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index aa870e68e165..5d0193a87314 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,15 +90,15 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
-	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_DP_HELPER
 	select EXTCON
 	select CRYPTO
 	select CRYPTO_HASH
@@ -224,14 +224,14 @@ config DRM_PARADE_PS8622
 	help
 	  Parade eDP-LVDS bridge chip driver.
 
 config DRM_PARADE_PS8640
 	tristate "Parade PS8640 MIPI DSI to eDP Converter"
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	help
 	  Choose this option if you have PS8640 for display
@@ -379,19 +379,19 @@ config DRM_TI_SN65DSI83
 	help
 	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver
 
 config DRM_TI_SN65DSI86
 	tristate "TI SN65DSI86 DSI to eDP bridge"
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
-	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
 config DRM_TI_TPD12S015
 	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 16d18dde483a..ec98c9453573 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -31,15 +31,15 @@ config DRM_ANALOGIX_DP
 	depends on DRM
 
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
-	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_MIPI_DSI
 	help
 	  ANX7625 is an ultra-low power 4K mobile HD transmitter
 	  designed for portable devices. It converts MIPI/DPI to
 	  DisplayPort1.3 4K.
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index cffa2acdbc6c..0cd439691422 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -9,10 +9,11 @@ config DRM_DISPLAY_HELPER
 
 config DRM_DISPLAY_DP_AUX_BUS
 	tristate "DRM DisplayPort AUX bus support"
 	depends on DRM
 	depends on OF || COMPILE_TEST
+	default y
 
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	depends on DRM
 	depends on DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 50bb28327f65..2add54486ac4 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -20,15 +20,15 @@ config DRM_MEDIATEK
 	  This driver provides kernel mode setting and
 	  buffer management to userspace.
 
 config DRM_MEDIATEK_DP
 	tristate "DRM DPTX Support for MediaTek SoCs"
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MEDIATEK
 	select PHY_MTK_DP
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  DRM/KMS Display Port driver for MediaTek SoCs.
 
 config DRM_MEDIATEK_HDMI
 	tristate "DRM HDMI Support for Mediatek SoCs"
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 2055266506e5..28a898722ace 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -3,21 +3,21 @@
 config DRM_MSM
 	tristate "MSM DRM"
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on IOMMU_SUPPORT
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_BRIDGE
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index c83285811bb3..01235397c493 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -558,15 +558,15 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
 	select VIDEOMODE_HELPERS
 
 config DRM_PANEL_SAMSUNG_ATNA33XC20
 	tristate "Samsung ATNA33XC20 eDP panel"
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	depends on PM
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  DRM panel driver for the Samsung ATNA33XC20 panel. This panel can't
 	  be handled by the DRM_PANEL_SIMPLE driver because its power
 	  sequencing is non-standard.
 
@@ -798,16 +798,16 @@ config DRM_PANEL_STARTEK_KD070FHFID015
 	  the host, a built-in LED backlight and touch controller.
 
 config DRM_PANEL_EDP
 	tristate "support for simple Embedded DisplayPort panels"
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	depends on PM
 	select VIDEOMODE_HELPERS
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	help
 	  DRM panel driver for dumb eDP panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
 	  that it can be automatically turned off when the panel goes into a
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 44381ee6ea9e..e0385d175ec6 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -2,15 +2,15 @@
 config DRM_TEGRA
 	tristate "NVIDIA Tegra DRM"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
+	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
 	select TEGRA_HOST1X

-- 
2.44.0

