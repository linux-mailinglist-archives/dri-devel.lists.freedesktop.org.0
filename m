Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201A88A065
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342BD10E874;
	Mon, 25 Mar 2024 12:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S4zcI4Gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E8B10E868
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:52:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A45DCE17E2;
 Mon, 25 Mar 2024 12:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAEAC433F1;
 Mon, 25 Mar 2024 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711371165;
 bh=ZYo44Ql09eNjuYqa18v+UzTGOmFIhSJ4fxWWqhrYyqQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=S4zcI4Gi3p47xEm/KD5kRoXXZmIU/IIXRt1XUpoWTPSV0eiYVs+vJtvg2/lTy+rJg
 E1fv5CNPNDvGq/MVfjhPIjzB13qNLkeyeq/9bBTL2d4HQg0KS6Kt7Dz1QPE6GTqFwf
 6T7CFdcGtORnl5zqCwtof5OIagulQ5A0A9p5cCwSbozjIyg30Qm/UtlNrYzy8/WRAi
 3cs5B1jSyEhTJANvvd5b87mAxfxPOeNv0CBEGgeNxjJqiWjQ4MO2N2puerpSHk/vBO
 IA9kLgxo22d59CNx18ZJlaRNmjyS3K9JHJKwU8+N+/8GXa5tgonKE61lJQdupD/DF3
 jv+ILHY2k6Myw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Mar 2024 13:52:12 +0100
Subject: [PATCH 10/12] drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-kms-kconfig-helpers-v1-10-bfec6949d9c3@kernel.org>
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
In-Reply-To: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5316; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZYo44Ql09eNjuYqa18v+UzTGOmFIhSJ4fxWWqhrYyqQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGmMxdVuG7fPt7JSWHJErvuTzoYcwauKO+8lXt7bV3M6j
 VGxlkO/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExEr5OxYcvO/MOOz6/8cecM
 qzuQ/7HrwWSpvXlajy/fEZKaPFP2/gxZndlWTTmrfk86diLc7rvxVMY6g/hTB4PjncT1mW8edL7
 s+s7Br93/wQEfweMnN3/RPvv23KNgo6q9sQbrDu6f1LiFe58xAA==
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
DRM_DISPLAY_HDCP_HELPER to depend on it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig      | 2 +-
 drivers/gpu/drm/bridge/Kconfig          | 2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig | 2 +-
 drivers/gpu/drm/bridge/cadence/Kconfig  | 2 +-
 drivers/gpu/drm/i915/Kconfig            | 2 +-
 drivers/gpu/drm/xe/Kconfig              | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index ba09121e7deb..1662dc49f18e 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -2,17 +2,17 @@
 
 config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
 	depends on !UML
 	select FW_LOADER
 	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SCHED
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select POWER_SUPPLY
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 54d45dd31b7f..6e6ec300ab16 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -92,13 +92,13 @@ config DRM_FSL_LDB
 
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_DP_HELPER
 	select EXTCON
 	select CRYPTO
 	select CRYPTO_HASH
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 9659df6718de..12bfea53bf24 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -33,13 +33,13 @@ config DRM_ANALOGIX_DP
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_AUX_BUS
 	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_MIPI_DSI
 	help
 	  ANX7625 is an ultra-low power 4K mobile HD transmitter
 	  designed for portable devices. It converts MIPI/DPI to
 	  DisplayPort1.3 4K.
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index 3480fd4d0a5f..7817f6f56607 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -22,13 +22,13 @@ config DRM_CDNS_DSI_J721E
 endif
 
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
 	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
-	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
 	help
 	  Support Cadence DPI to DP bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index dbde4e29d93a..87ef8c4d72a5 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on X86 && PCI
 	depends on !PREEMPT_RT
 	select INTEL_GTT if X86
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
 	select SHMEM
 	select TMPFS
-	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 02da2faf5ae3..1fa8ef75823c 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -2,10 +2,11 @@
 config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on (m || (y && KUNIT=y))
 	depends on DRM
 	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on MMU
 	depends on PCI
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
@@ -16,11 +17,10 @@ config DRM_XE
 	select DRM_EXEC
 	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST != n
 	select DRM_PANEL
 	select DRM_SUBALLOC_HELPER
-	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_MIPI_DSI
 	select RELAY
 	select IRQ_WORK
 	# xe depends on ACPI_VIDEO when ACPI is enabled

-- 
2.44.0

