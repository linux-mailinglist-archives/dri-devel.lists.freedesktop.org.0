Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D588DBA9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DD810F9F5;
	Wed, 27 Mar 2024 10:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fDlYL7DX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE2210F9F1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 23E57CE2616;
 Wed, 27 Mar 2024 10:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1C9C43390;
 Wed, 27 Mar 2024 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537056;
 bh=dXVd/6RN8bz2UHnkFJgFuQbgdRHpYaojdg/ZcF4WE6k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fDlYL7DXJ+8oytXmBy5WHmPeah+3j1/2BLHri9r7P40hkSV/GF4OD2+gC1RJ39oM4
 QUhMpwBUIAc6FL6fi7wtj7aKBX6P9OD0ogLt0j9cYVrqqjzBGyNSDz2rLPIgrgzcaX
 6sAVykPaJNmljfQc0Y5FJcZ6Cs4bTUV1anK/Kq+hlrClWlQf2X6HfT4cSRogp26iHo
 x2BRe96loGiD0RZ3OpfDZGkhnlYt3VX+Jb55nNsg0k/p9VZ5tYv73QmKNr6SkUMl92
 exswOc3mZqR2qa9Nxo0e4gZTSCg7Fwzc3HL5H38WMTXw886iDBVfG9hOgf8yQvizAQ
 9hIydt9srmT3w==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Mar 2024 11:57:03 +0100
Subject: [PATCH v3 08/13] drm: Switch DRM_DISPLAY_HELPER to depends on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-kms-kconfig-helpers-v3-8-eafee11b84b3@kernel.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=20855; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dXVd/6RN8bz2UHnkFJgFuQbgdRHpYaojdg/ZcF4WE6k=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMv5s523StFOuKp9dMepVTLeHH7P1igtnMbN71DplMb
 UYfeqd1TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIlsW8jYcDr4FTdv4Nsijubt
 JqfvMF3sWTHfrp7T0tvj1qeNTZ1NhbN+TRBfLJUdLLya4etcR2d1xjrbhR5dyzdvab8Vq/P219e
 2aQ75+3uevvW82Xs/+f6ULL62c7suubkXPrRy/3SA+3fdel8A
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
DRM_DISPLAY_HELPER to depend on it.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/Kconfig                 |  6 ++++--
 drivers/gpu/drm/amd/amdgpu/Kconfig      |  6 ++++--
 drivers/gpu/drm/bridge/Kconfig          | 10 +++++-----
 drivers/gpu/drm/bridge/analogix/Kconfig |  6 +++---
 drivers/gpu/drm/bridge/cadence/Kconfig  |  4 ++--
 drivers/gpu/drm/bridge/synopsys/Kconfig |  2 +-
 drivers/gpu/drm/display/Kconfig         |  1 +
 drivers/gpu/drm/exynos/Kconfig          |  2 +-
 drivers/gpu/drm/i915/Kconfig            |  2 +-
 drivers/gpu/drm/mediatek/Kconfig        |  2 +-
 drivers/gpu/drm/msm/Kconfig             |  4 ++--
 drivers/gpu/drm/nouveau/Kconfig         |  6 ++++--
 drivers/gpu/drm/panel/Kconfig           | 20 ++++++++++----------
 drivers/gpu/drm/radeon/Kconfig          |  6 ++++--
 drivers/gpu/drm/rockchip/Kconfig        |  4 ++--
 drivers/gpu/drm/tegra/Kconfig           |  2 +-
 drivers/gpu/drm/vc4/Kconfig             |  8 ++++----
 drivers/gpu/drm/xe/Kconfig              |  7 +++++--
 drivers/gpu/drm/xlnx/Kconfig            |  6 ++++--
 19 files changed, 59 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 16029435b750..1eb939463c35 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -71,14 +71,16 @@ config DRM_KUNIT_TEST_HELPERS
 	help
 	  KUnit Helpers for KMS drivers.
 
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
-	depends on DRM && KUNIT && MMU
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on KUNIT
+	depends on MMU
 	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 22d88f8ef527..cf931b94a188 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -1,16 +1,18 @@
 # SPDX-License-Identifier: MIT
 
 config DRM_AMDGPU
 	tristate "AMD GPU"
-	depends on DRM && PCI && MMU
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on MMU
+	depends on PCI
 	depends on !UML
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SCHED
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select POWER_SUPPLY
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 703c3e30885b..aa870e68e165 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,14 +90,14 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
+	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_DP_HELPER
 	select EXTCON
 	select CRYPTO
@@ -224,13 +224,13 @@ config DRM_PARADE_PS8622
 	help
 	  Parade eDP-LVDS bridge chip driver.
 
 config DRM_PARADE_PS8640
 	tristate "Parade PS8640 MIPI DSI to eDP Converter"
+	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	help
@@ -311,13 +311,13 @@ config DRM_TOSHIBA_TC358764
 	help
 	  Toshiba TC358764 DSI/LVDS bridge driver.
 
 config DRM_TOSHIBA_TC358767
 	tristate "Toshiba TC358767 eDP bridge"
+	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
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
+	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	help
@@ -379,13 +379,13 @@ config DRM_TI_SN65DSI83
 	help
 	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver
 
 config DRM_TI_SN65DSI86
 	tristate "TI SN65DSI86 DSI to eDP bridge"
+	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 4846b2e9be7c..16d18dde483a 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -1,25 +1,25 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ANALOGIX_ANX6345
 	tristate "Analogix ANX6345 bridge"
+	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_ANALOGIX_DP
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
 	  ANX6345 is an ultra-low power Full-HD DisplayPort/eDP
 	  transmitter designed for portable devices. The
 	  ANX6345 transforms the LVTTL RGB output of an
 	  application processor to eDP or DisplayPort.
 
 config DRM_ANALOGIX_ANX78XX
 	tristate "Analogix ANX78XX bridge"
+	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
 	  ANX78XX is an ultra-low power Full-HD SlimPort transmitter
 	  designed for portable devices. The ANX78XX transforms
@@ -31,14 +31,14 @@ config DRM_ANALOGIX_DP
 	depends on DRM
 
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
+	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_MIPI_DSI
 	help
 	  ANX7625 is an ultra-low power 4K mobile HD transmitter
 	  designed for portable devices. It converts MIPI/DPI to
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index cced81633ddc..20143afded40 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -21,16 +21,16 @@ config DRM_CDNS_DSI_J721E
 	  the routing of the DSS DPI signal to the Cadence DSI.
 endif
 
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
+	depends on DRM_DISPLAY_HELPER
+	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
-	depends on OF
 	help
 	  Support Cadence DPI to DP bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
 	  It takes a DPI stream as input and outputs it encoded
 	  in DP format.
diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index 15fc182d05ef..f366ece47146 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_DW_HDMI
 	tristate
+	depends on DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_MMIO
 	select CEC_CORE if CEC_NOTIFIER
 
 config DRM_DW_HDMI_AHB_AUDIO
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index c77e7f85bd67..cffa2acdbc6c 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: MIT
 
 config DRM_DISPLAY_HELPER
 	tristate "DRM Display Helpers"
 	depends on DRM
+	default y
 	help
 	  DRM helpers for display adapters.
 
 config DRM_DISPLAY_DP_AUX_BUS
 	tristate "DRM DisplayPort AUX bus support"
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 733b109a5095..4b0183bf221c 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -2,11 +2,10 @@
 config DRM_EXYNOS
 	tristate "DRM Support for Samsung SoC Exynos Series"
 	depends on OF && DRM && COMMON_CLK
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	depends on MMU
-	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	help
@@ -66,10 +65,11 @@ config DRM_EXYNOS_DSI
 	  This enables support for Exynos MIPI-DSI device.
 
 config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
+	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
 	select DRM_DISPLAY_DP_HELPER
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 5932024f8f95..43183a68a095 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -1,9 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
+	depends on DRM_DISPLAY_HELPER
 	depends on X86 && PCI
 	depends on !PREEMPT_RT
 	select INTEL_GTT if X86
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
@@ -11,11 +12,10 @@ config DRM_I915
 	select SHMEM
 	select TMPFS
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select RELAY
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 96cbe020f493..50bb28327f65 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -20,13 +20,13 @@ config DRM_MEDIATEK
 	  This driver provides kernel mode setting and
 	  buffer management to userspace.
 
 config DRM_MEDIATEK_DP
 	tristate "DRM DPTX Support for MediaTek SoCs"
+	depends on DRM_DISPLAY_HELPER
 	depends on DRM_MEDIATEK
 	select PHY_MTK_DP
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  DRM/KMS Display Port driver for MediaTek SoCs.
 
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 27d72ed8b389..2055266506e5 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -1,12 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config DRM_MSM
 	tristate "MSM DRM"
-	depends on DRM
 	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
 	depends on COMMON_CLK
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
 	depends on IOMMU_SUPPORT
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
@@ -14,11 +15,10 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index ceef470c9fbf..5ac852b816db 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -1,14 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
-	depends on DRM && PCI && MMU
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on PCI
+	depends on MMU
 	select IOMMU_API
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
 	select DRM_GPUVM
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 9eefe09c2ecb..c83285811bb3 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -531,15 +531,15 @@ config DRM_PANEL_RAYDIUM_RM68200
 	  Say Y here if you want to enable support for Raydium RM68200
 	  720x1280 DSI video mode panel.
 
 config DRM_PANEL_RAYDIUM_RM692E5
 	tristate "Raydium RM692E5-based DSI panel"
-	depends on OF
-	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_HELPER
+	depends on DRM_MIPI_DSI
+	depends on OF
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Raydium RM692E5-based
 	  display panels, such as the one found in the Fairphone 5 smartphone.
 
 config DRM_PANEL_RONBO_RB070D30
@@ -557,15 +557,15 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
 config DRM_PANEL_SAMSUNG_ATNA33XC20
 	tristate "Samsung ATNA33XC20 eDP panel"
-	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_HELPER
+	depends on OF
 	depends on PM
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	help
 	  DRM panel driver for the Samsung ATNA33XC20 panel. This panel can't
 	  be handled by the DRM_PANEL_SIMPLE driver because its power
 	  sequencing is non-standard.
@@ -797,16 +797,16 @@ config DRM_PANEL_STARTEK_KD070FHFID015
 	  with a resolution of 1024 x 600 pixels. It provides a MIPI DSI interface to
 	  the host, a built-in LED backlight and touch controller.
 
 config DRM_PANEL_EDP
 	tristate "support for simple Embedded DisplayPort panels"
-	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_HELPER
+	depends on OF
 	depends on PM
 	select VIDEOMODE_HELPERS
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	help
 	  DRM panel driver for dumb eDP panels that need at most a regulator and
 	  a GPIO to be powered up. Optionally a backlight can be attached so
@@ -877,15 +877,15 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
 
 config DRM_PANEL_VISIONOX_R66451
 	tristate "Visionox R66451"
-	depends on OF
-	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_HELPER
+	depends on DRM_MIPI_DSI
+	depends on OF
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox
 	  R66451 1080x2340 AMOLED DSI panel.
 
 config DRM_PANEL_VISIONOX_RM69299
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index f98356be0af2..07d330450f05 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -1,14 +1,16 @@
 # SPDX-License-Identifier: MIT
 
 config DRM_RADEON
 	tristate "ATI Radeon"
-	depends on DRM && PCI && MMU
 	depends on AGP || !AGP
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on PCI
+	depends on MMU
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
         select DRM_KMS_HELPER
 	select DRM_SUBALLOC_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 0d5260e10f27..b72c0bbf346d 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -33,22 +33,22 @@ config ROCKCHIP_VOP2
 	  This selects support for the VOP2 driver. The VOP2 hardware is
 	  first found on the RK3568.
 
 config ROCKCHIP_ANALOGIX_DP
 	bool "Rockchip specific extensions for Analogix DP driver"
+	depends on DRM_DISPLAY_HELPER
 	depends on ROCKCHIP_VOP
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Analogix Core DP driver. If you want to enable DP
 	  on RK3288 or RK3399 based SoC, you should select this option.
 
 config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
+	depends on DRM_DISPLAY_HELPER
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the cdn DP driver. If you want to enable Dp on
 	  RK3399 based SoC, you should select this
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 782f51d3044a..44381ee6ea9e 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -2,14 +2,14 @@
 config DRM_TEGRA
 	tristate "NVIDIA Tegra DRM"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
+	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 91dcf8d174d6..98772a6b5bf0 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -1,18 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_VC4
 	tristate "Broadcom VC4 Graphics"
 	depends on ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST
+	depends on COMMON_CLK
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on PM
 	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
 	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
 	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
-	depends on DRM
 	depends on SND && SND_SOC
-	depends on COMMON_CLK
-	depends on PM
 	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
 	select SND_PCM
 	select SND_PCM_ELD
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1a556d087e63..be29e5cd5215 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,9 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe Graphics"
-	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
+	depends on (m || (y && KUNIT=y))
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on MMU
+	depends on PCI
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
 	select SHMEM
 	select TMPFS
@@ -14,11 +18,10 @@ config DRM_XE
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_MIPI_DSI
 	select RELAY
 	select IRQ_WORK
 	# xe depends on ACPI_VIDEO when ACPI is enabled
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 68ee897de9d7..7a14a8c2e7be 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -1,15 +1,17 @@
 config DRM_ZYNQMP_DPSUB
 	tristate "ZynqMP DisplayPort Controller Driver"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
-	depends on COMMON_CLK && DRM && OF
+	depends on COMMON_CLK
 	depends on DMADEVICES
+	depends on DRM
+	depends on DRM_DISPLAY_HELPER
+	depends on OF
 	depends on PHY_XILINX_ZYNQMP
 	depends on XILINX_ZYNQMP_DPDMA
 	select DMA_ENGINE
 	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select GENERIC_PHY
 	help
 	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose

-- 
2.44.0

