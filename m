Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA188DBA7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB94910F9F7;
	Wed, 27 Mar 2024 10:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uhciMTry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED08A10F9F1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3DC326137F;
 Wed, 27 Mar 2024 10:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3CBC433F1;
 Wed, 27 Mar 2024 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537061;
 bh=kGyo58CD6ROSYAR1Q4756JymBSX6cjb7X9lRa5UFvDI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=uhciMTrygUptrpGXAHX+4UL08kN4fIiUVgBN+hrIKkITvtthunJp6/qdpZaUKvgCU
 ZO8ZSjZbDWUrjfp6Ia19gkwsdEK5glX0WIJHiuxDkbJKdh8mwTvqasu8VbVFfBwvh/
 HjGvviECbysBXa22mHgD67jU9vPubSgdWFXSTlKmreOK5RERgvhf1ua7k9CiP6zel4
 qVogBwu3JluerFx+n8zE0J2jdy1TBMuuPk55SV6SYRnbsb9cBme7mbjOA9ZulRQEdq
 vKHpEK+zF3/LoCQiil0V3bkrcIQmEKYfx5bxnOoT3AaSMbW+1AsrzgGoIPodUknyaJ
 5EgOYQjZeC9wg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Mar 2024 11:57:05 +0100
Subject: [PATCH v3 10/13] drm: Switch DRM_DISPLAY_DP_HELPER to depends on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-kms-kconfig-helpers-v3-10-eafee11b84b3@kernel.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=18103; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kGyo58CD6ROSYAR1Q4756JymBSX6cjb7X9lRa5UFvDI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMv5s15tREu6e/vX9p0qLyazGCDcYF+ouOL61nkOrs0
 /hf939Hx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIvjVjfVnHynk7BW7wCrXx
 6d/36Dqbm7upyCdfem9x8L+naTerkwQPbA7q0u1RNxWO4s3cn7mBsb744jwdBbbyFvdtBoI3mrz
 55b9eWxe+66+czyVeecfttTbvmBvKXBv5721a/cfx3sOMDQA=
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
DRM_DISPLAY_DP_HELPER to depend on it.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/Kconfig                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig      |  2 +-
 drivers/gpu/drm/bridge/Kconfig          | 10 +++++-----
 drivers/gpu/drm/bridge/analogix/Kconfig |  6 +++---
 drivers/gpu/drm/bridge/cadence/Kconfig  |  2 +-
 drivers/gpu/drm/display/Kconfig         |  1 +
 drivers/gpu/drm/exynos/Kconfig          |  2 +-
 drivers/gpu/drm/i915/Kconfig            |  2 +-
 drivers/gpu/drm/mediatek/Kconfig        |  2 +-
 drivers/gpu/drm/msm/Kconfig             |  2 +-
 drivers/gpu/drm/nouveau/Kconfig         |  2 +-
 drivers/gpu/drm/panel/Kconfig           |  8 ++++----
 drivers/gpu/drm/radeon/Kconfig          |  2 +-
 drivers/gpu/drm/rockchip/Kconfig        |  4 ++--
 drivers/gpu/drm/tegra/Kconfig           |  2 +-
 drivers/gpu/drm/xe/Kconfig              |  2 +-
 drivers/gpu/drm/xlnx/Kconfig            |  2 +-
 17 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1eb939463c35..50b809346bf9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -72,15 +72,15 @@ config DRM_KUNIT_TEST_HELPERS
 	  KUnit Helpers for KMS drivers.
 
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
 	depends on DRM
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on KUNIT
 	depends on MMU
 	select DRM_BUDDY
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index cf931b94a188..ba09121e7deb 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: MIT
 
 config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
 	depends on !UML
 	select FW_LOADER
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SCHED
 	select DRM_TTM
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 5d0193a87314..54d45dd31b7f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -91,13 +91,13 @@ config DRM_FSL_LDB
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_DP_HELPER
 	select EXTCON
 	select CRYPTO
@@ -225,13 +225,13 @@ config DRM_PARADE_PS8622
 	  Parade eDP-LVDS bridge chip driver.
 
 config DRM_PARADE_PS8640
 	tristate "Parade PS8640 MIPI DSI to eDP Converter"
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	help
 	  Choose this option if you have PS8640 for display
@@ -311,13 +311,13 @@ config DRM_TOSHIBA_TC358764
 	help
 	  Toshiba TC358764 DSI/LVDS bridge driver.
 
 config DRM_TOSHIBA_TC358767
 	tristate "Toshiba TC358767 eDP bridge"
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	help
@@ -334,13 +334,13 @@ config DRM_TOSHIBA_TC358768
 	help
 	  Toshiba TC358768AXBG/TC358778XBG DSI bridge chip driver.
 
 config DRM_TOSHIBA_TC358775
 	tristate "Toshiba TC358775 DSI/LVDS bridge"
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	help
@@ -380,13 +380,13 @@ config DRM_TI_SN65DSI83
 	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver
 
 config DRM_TI_SN65DSI86
 	tristate "TI SN65DSI86 DSI to eDP bridge"
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index ec98c9453573..9659df6718de 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -1,25 +1,25 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ANALOGIX_ANX6345
 	tristate "Analogix ANX6345 bridge"
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_ANALOGIX_DP
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
 	  ANX6345 is an ultra-low power Full-HD DisplayPort/eDP
 	  transmitter designed for portable devices. The
 	  ANX6345 transforms the LVTTL RGB output of an
 	  application processor to eDP or DisplayPort.
 
 config DRM_ANALOGIX_ANX78XX
 	tristate "Analogix ANX78XX bridge"
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
 	  ANX78XX is an ultra-low power Full-HD SlimPort transmitter
 	  designed for portable devices. The ANX78XX transforms
@@ -32,13 +32,13 @@ config DRM_ANALOGIX_DP
 
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_MIPI_DSI
 	help
 	  ANX7625 is an ultra-low power 4K mobile HD transmitter
 	  designed for portable devices. It converts MIPI/DPI to
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index 20143afded40..3480fd4d0a5f 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -21,13 +21,13 @@ config DRM_CDNS_DSI_J721E
 	  the routing of the DSS DPI signal to the Cadence DSI.
 endif
 
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
 	help
 	  Support Cadence DPI to DP bridge. This is an internal
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 0cd439691422..9801f47a3704 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -37,10 +37,11 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 	  channel.
 
 config DRM_DISPLAY_DP_HELPER
 	bool "DRM DisplayPort Helpers"
 	depends on DRM_DISPLAY_HELPER
+	default y
 	help
 	  DRM display helpers for DisplayPort.
 
 config DRM_DISPLAY_DP_TUNNEL
 	bool "DRM DisplayPort tunnels support"
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 4b0183bf221c..6a26a0b8eff2 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -65,13 +65,13 @@ config DRM_EXYNOS_DSI
 	  This enables support for Exynos MIPI-DSI device.
 
 config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
-	select DRM_DISPLAY_DP_HELPER
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
 	  This enables support for DP device.
 
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 43183a68a095..dbde4e29d93a 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -1,19 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on X86 && PCI
 	depends on !PREEMPT_RT
 	select INTEL_GTT if X86
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
 	select SHMEM
 	select TMPFS
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 2add54486ac4..6caab8d4d4e0 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -21,14 +21,14 @@ config DRM_MEDIATEK
 	  buffer management to userspace.
 
 config DRM_MEDIATEK_DP
 	tristate "DRM DPTX Support for MediaTek SoCs"
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MEDIATEK
 	select PHY_MTK_DP
-	select DRM_DISPLAY_DP_HELPER
 	help
 	  DRM/KMS Display Port driver for MediaTek SoCs.
 
 config DRM_MEDIATEK_HDMI
 	tristate "DRM HDMI Support for Mediatek SoCs"
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 28a898722ace..f7708590583e 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -4,21 +4,21 @@ config DRM_MSM
 	tristate "MSM DRM"
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
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
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 5ac852b816db..7cc305b2826d 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -1,15 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
 	depends on DRM
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on PCI
 	depends on MMU
 	select IOMMU_API
 	select FW_LOADER
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 01235397c493..154f5bf82980 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -532,14 +532,14 @@ config DRM_PANEL_RAYDIUM_RM68200
 	  720x1280 DSI video mode panel.
 
 config DRM_PANEL_RAYDIUM_RM692E5
 	tristate "Raydium RM692E5-based DSI panel"
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MIPI_DSI
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	help
 	  Say Y here if you want to enable support for Raydium RM692E5-based
 	  display panels, such as the one found in the Fairphone 5 smartphone.
 
 config DRM_PANEL_RONBO_RB070D30
@@ -559,14 +559,14 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
 
 config DRM_PANEL_SAMSUNG_ATNA33XC20
 	tristate "Samsung ATNA33XC20 eDP panel"
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	depends on PM
-	select DRM_DISPLAY_DP_HELPER
 	help
 	  DRM panel driver for the Samsung ATNA33XC20 panel. This panel can't
 	  be handled by the DRM_PANEL_SIMPLE driver because its power
 	  sequencing is non-standard.
 
@@ -799,15 +799,15 @@ config DRM_PANEL_STARTEK_KD070FHFID015
 
 config DRM_PANEL_EDP
 	tristate "support for simple Embedded DisplayPort panels"
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	depends on PM
 	select VIDEOMODE_HELPERS
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_KMS_HELPER
 	help
 	  DRM panel driver for dumb eDP panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
 	  that it can be automatically turned off when the panel goes into a
@@ -878,14 +878,14 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	  Video Mode panel
 
 config DRM_PANEL_VISIONOX_R66451
 	tristate "Visionox R66451"
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MIPI_DSI
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox
 	  R66451 1080x2340 AMOLED DSI panel.
 
 config DRM_PANEL_VISIONOX_RM69299
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index 07d330450f05..18c867219a70 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -2,15 +2,15 @@
 
 config DRM_RADEON
 	tristate "ATI Radeon"
 	depends on AGP || !AGP
 	depends on DRM
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on PCI
 	depends on MMU
 	select FW_LOADER
-	select DRM_DISPLAY_DP_HELPER
         select DRM_KMS_HELPER
 	select DRM_SUBALLOC_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index b72c0bbf346d..4b49a14758fe 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -33,23 +33,23 @@ config ROCKCHIP_VOP2
 	  This selects support for the VOP2 driver. The VOP2 hardware is
 	  first found on the RK3568.
 
 config ROCKCHIP_ANALOGIX_DP
 	bool "Rockchip specific extensions for Analogix DP driver"
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on ROCKCHIP_VOP
-	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Analogix Core DP driver. If you want to enable DP
 	  on RK3288 or RK3399 based SoC, you should select this option.
 
 config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
-	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the cdn DP driver. If you want to enable Dp on
 	  RK3399 based SoC, you should select this
 	  option.
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index e0385d175ec6..bb6e35261f11 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -3,13 +3,13 @@ config DRM_TEGRA
 	tristate "NVIDIA Tegra DRM"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index be29e5cd5215..02da2faf5ae3 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on (m || (y && KUNIT=y))
 	depends on DRM
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
@@ -15,11 +16,10 @@ config DRM_XE
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_MIPI_DSI
 	select RELAY
 	select IRQ_WORK
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 7a14a8c2e7be..41d753b14ccd 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -2,16 +2,16 @@ config DRM_ZYNQMP_DPSUB
 	tristate "ZynqMP DisplayPort Controller Driver"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DMADEVICES
 	depends on DRM
+	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	depends on PHY_XILINX_ZYNQMP
 	depends on XILINX_ZYNQMP_DPDMA
 	select DMA_ENGINE
-	select DRM_DISPLAY_DP_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select GENERIC_PHY
 	help
 	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose

-- 
2.44.0

