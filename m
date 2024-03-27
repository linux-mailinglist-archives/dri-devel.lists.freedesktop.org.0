Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAB588DBAC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE1510F9FE;
	Wed, 27 Mar 2024 10:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BF8WM20W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0B10F9F1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0084614FA;
 Wed, 27 Mar 2024 10:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312E9C433F1;
 Wed, 27 Mar 2024 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537067;
 bh=2kt1kehu3JZoboV5MHS0JZcHKjYjo4qrDvg78NpfccI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BF8WM20WFZVUq8dlOSsSP97qm5IMXAUOnoFZxWXI+peire0C0M7A/EDhpj4id2685
 gQc4IuwaxWgUIVLHUkr2Lzuu9J2a/VFol1vckB0f5YoOwqQCP9QZ1KgdkL1VtlCoUg
 byybZ/esYV7JW9dzbbkaDY+IBTCs9V3AAuy5yVxgOoEAjRRF4Us44J77bY79AMkq1s
 kgpF3E+Tyjqbljwz389P0GO1GqWc+AJefdGc+c4bQh3Xg4StDaeCcEbLU0vO5vK1Uh
 9PjBBmqGVMcuM8Bn3yNRoJtcUV6/WxlPVf18OrNeNyWvaSXzhHFZaKdlq9UYQzGPk8
 PGoVsnpapVNCQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Mar 2024 11:57:07 +0100
Subject: [PATCH v3 12/13] drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-kms-kconfig-helpers-v3-12-eafee11b84b3@kernel.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6612; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2kt1kehu3JZoboV5MHS0JZcHKjYjo4qrDvg78NpfccI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMv1s233LcXRZdevlztqNhFt/quU43zsavbJvkI8Zn7
 z1J/uLMjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRhCeMDfurD0ic7mi3/e5g
 N6NUtjdbWe2vjse80xmLw2U6H5gbq4Uwp242XTfR+tV8CyPl+ggWxhrui2e5X+4X8F3xIfHdeRv
 mnfKpdyp9pimdLpr804fHuJJ7wswzcywqZJ/fYGwJdt1W0AAA
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
DRM_DISPLAY_HDMI_HELPER to depend on it.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig      | 2 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig | 2 +-
 drivers/gpu/drm/display/Kconfig         | 1 +
 drivers/gpu/drm/i915/Kconfig            | 2 +-
 drivers/gpu/drm/nouveau/Kconfig         | 2 +-
 drivers/gpu/drm/tegra/Kconfig           | 2 +-
 drivers/gpu/drm/vc4/Kconfig             | 2 +-
 drivers/gpu/drm/xe/Kconfig              | 2 +-
 8 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 1662dc49f18e..b0365cc1374e 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -3,16 +3,16 @@
 config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HDCP_HELPER
+	depends on DRM_DISPLAY_HDMI_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
 	depends on !UML
 	select FW_LOADER
-	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SCHED
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select POWER_SUPPLY
diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index f366ece47146..387f5bd86089 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_DW_HDMI
 	tristate
+	depends on DRM_DISPLAY_HDMI_HELPER
 	depends on DRM_DISPLAY_HELPER
-	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_MMIO
 	select CEC_CORE if CEC_NOTIFIER
 
 config DRM_DW_HDMI_AHB_AUDIO
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index d65f1a37c08c..01f2a231aa5f 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -72,7 +72,8 @@ config DRM_DISPLAY_HDCP_HELPER
 	  DRM display helpers for HDCP.
 
 config DRM_DISPLAY_HDMI_HELPER
 	bool "DRM HDMI Helpers"
 	depends on DRM_DISPLAY_HELPER
+	default y
 	help
 	  DRM display helpers for HDMI.
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 87ef8c4d72a5..4f0d18a16b0f 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -2,20 +2,20 @@
 config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HDCP_HELPER
+	depends on DRM_DISPLAY_HDMI_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on X86 && PCI
 	depends on !PREEMPT_RT
 	select INTEL_GTT if X86
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
 	select SHMEM
 	select TMPFS
-	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select RELAY
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 7cc305b2826d..4c10b400658c 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM_DISPLAY_HDMI_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on PCI
 	depends on MMU
 	select IOMMU_API
 	select FW_LOADER
-	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
 	select DRM_GPUVM
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index bb6e35261f11..6974caa99ece 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -4,13 +4,13 @@ config DRM_TEGRA
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM_DISPLAY_HDMI_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
 	select TEGRA_HOST1X
diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 98772a6b5bf0..4801f8b64d3d 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -2,17 +2,17 @@
 config DRM_VC4
 	tristate "Broadcom VC4 Graphics"
 	depends on ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
+	depends on DRM_DISPLAY_HDMI_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on PM
 	# Make sure not 'y' when RASPBERRYPI_FIRMWARE is 'm'. This can only
 	# happen when COMPILE_TEST=y, hence the added !RASPBERRYPI_FIRMWARE.
 	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
 	depends on SND && SND_SOC
-	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
 	select SND_PCM
 	select SND_PCM_ELD
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1fa8ef75823c..bfa0e9d4bd64 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -3,10 +3,11 @@ config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on (m || (y && KUNIT=y))
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HDCP_HELPER
+	depends on DRM_DISPLAY_HDMI_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
@@ -17,11 +18,10 @@ config DRM_XE
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
-	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_MIPI_DSI
 	select RELAY
 	select IRQ_WORK
 	# xe depends on ACPI_VIDEO when ACPI is enabled
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick

-- 
2.44.0

