Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C088BFFB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7E810EE49;
	Tue, 26 Mar 2024 10:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F5jGQW/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD8510EE52
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:56:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 82635CE203A;
 Tue, 26 Mar 2024 10:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF19C433C7;
 Tue, 26 Mar 2024 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711450603;
 bh=6YHAR4FANIY4gggXqvwFdYXIu5n/BHilhIrv6dzRnAg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=F5jGQW/iyue2I1tew9f2og4NU1JtvvXkx3ml32VDwAkLp8WzOJR5MZcVfKYE/M/MJ
 bcsrLuwxuMd0aOKN1r+8eecdc9aWpf48iOEZmkyXNwNLjPBuEp+g+Qf6zAYkh3ajDA
 KRCwZerfnYiblWY9i4MbGOKL0i6BFaa/C1U0aSlB1SRKFuSB6EfTGETPjvE1ym0jXk
 28IrirIVH8oP+efJGO46Xdk3ilZPDck/NkdKqaPLi/jdzo9xJen8TPq8pmsm/FzJzl
 ijt2FHFiwit+U//aBjbbYEoVt7g9VtctCMbVPNTwTg9y9TMl0kga6sPsOKwK4qb/Xt
 lsCGK7xGrOw+Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 Mar 2024 11:56:14 +0100
Subject: [PATCH v2 01/12] drm/display: Make DisplayPort AUX bus Kconfig
 name consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-kms-kconfig-helpers-v2-1-3b0aeee32217@kernel.org>
References: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
In-Reply-To: <20240326-kms-kconfig-helpers-v2-0-3b0aeee32217@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6624; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6YHAR4FANIY4gggXqvwFdYXIu5n/BHilhIrv6dzRnAg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMK69W3VqZu9a60Op9o6buIrOwpj92c0WaBcrn/49aq
 7ufK1a/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzERpqxVshL2Pfa7pplexNX
 8aWqPQl7eN73u+H5+m3e7yWOL1mYHVg7YXdop3RItOU+pulakRdXM9ZwcZqY1um07ZKyiJy+9lj
 uFNtJ0+QeZMxaO6nm7GvOJfekX3jop4Sn7L/tNuGF5NnXx/0B
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

While most display helpers Kconfig symbols have the DRM_DISPLAY prefix,
the DisplayPort AUX bus implementation uses DRM_DP_AUX_BUS.

Since the number of users is limited and it's a selected symbol, we can
easily rename it to make it consistent.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig          | 6 +++---
 drivers/gpu/drm/bridge/analogix/Kconfig | 2 +-
 drivers/gpu/drm/display/Kconfig         | 2 +-
 drivers/gpu/drm/display/Makefile        | 2 +-
 drivers/gpu/drm/mediatek/Kconfig        | 2 +-
 drivers/gpu/drm/msm/Kconfig             | 2 +-
 drivers/gpu/drm/panel/Kconfig           | 4 ++--
 drivers/gpu/drm/tegra/Kconfig           | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index efd996f6c138..703c3e30885b 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -94,11 +94,11 @@ config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_DP_HELPER
 	select EXTCON
 	select CRYPTO
 	select CRYPTO_HASH
@@ -227,11 +227,11 @@ config DRM_PARADE_PS8622
 config DRM_PARADE_PS8640
 	tristate "Parade PS8640 MIPI DSI to eDP Converter"
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	help
 	  Choose this option if you have PS8640 for display
@@ -387,11 +387,11 @@ config DRM_TI_SN65DSI86
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
 config DRM_TI_TPD12S015
 	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 173dada218ec..4846b2e9be7c 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -35,11 +35,11 @@ config DRM_ANALOGIX_ANX7625
 	depends on DRM
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_MIPI_DSI
 	help
 	  ANX7625 is an ultra-low power 4K mobile HD transmitter
 	  designed for portable devices. It converts MIPI/DPI to
 	  DisplayPort1.3 4K.
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index c0f56888c328..843d74db1dce 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: MIT
 
-config DRM_DP_AUX_BUS
+config DRM_DISPLAY_DP_AUX_BUS
 	tristate
 	depends on DRM
 	depends on OF || COMPILE_TEST
 
 config DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 7ca61333c669..3edf1ba2764e 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: MIT
 
-obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
+obj-$(CONFIG_DRM_DISPLAY_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_display_helper-y := drm_display_helper_mod.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_dual_mode_helper.o \
 	drm_dp_helper.o \
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 76cab28e010c..96cbe020f493 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -24,11 +24,11 @@ config DRM_MEDIATEK_DP
 	tristate "DRM DPTX Support for MediaTek SoCs"
 	depends on DRM_MEDIATEK
 	select PHY_MTK_DP
 	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  DRM/KMS Display Port driver for MediaTek SoCs.
 
 config DRM_MEDIATEK_HDMI
 	tristate "DRM HDMI Support for Mediatek SoCs"
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f202f26adab2..27d72ed8b389 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -12,11 +12,11 @@ config DRM_MSM
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 6dc451f58a3e..9eefe09c2ecb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -562,11 +562,11 @@ config DRM_PANEL_SAMSUNG_ATNA33XC20
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  DRM panel driver for the Samsung ATNA33XC20 panel. This panel can't
 	  be handled by the DRM_PANEL_SIMPLE driver because its power
 	  sequencing is non-standard.
 
@@ -803,11 +803,11 @@ config DRM_PANEL_EDP
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
 	select VIDEOMODE_HELPERS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	help
 	  DRM panel driver for dumb eDP panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
 	  that it can be automatically turned off when the panel goes into a
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 84e7e6bc3a0c..782f51d3044a 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -6,11 +6,11 @@ config DRM_TEGRA
 	depends on DRM
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
-	select DRM_DP_AUX_BUS
+	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
 	select TEGRA_HOST1X

-- 
2.44.0

