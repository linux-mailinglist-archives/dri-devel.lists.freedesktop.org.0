Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13588DBA2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972A410F9F4;
	Wed, 27 Mar 2024 10:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c5mqt2E9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204C10F9EC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CF8561423;
 Wed, 27 Mar 2024 10:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7F2C43394;
 Wed, 27 Mar 2024 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537045;
 bh=fNaimuoHSsgrvou3A7pRWnd9jF14e+9xHIs3h+JgTaw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=c5mqt2E9R/cmAj1brpjBe+PI2wocPxMXCCAGQ2/PoOc9+NrCoUa1x2hF4Q/ISrH+6
 4D3BZvilQ2qMeXh3rYvaOqOhnT/a7zNM6mb5NLI9lr+72y24pc99QUrNWE7av+zr38
 fDR7723LmqEuGtc7+kxTtn/RE/1cDGAp1VMl4Q5vFnszIpzK8AQ1D49qPml8gKD3W/
 dKvx4/eePO9qM5qCRvsJud+z/V3gWDd3AF+eapSU6YKST+sth21AFcBzvnr3FrBmdA
 obt1rDwaVVGaJHrbawLpQ77/VE2iEJNey0aplp2u4/enjQMEoKqPju78EBXdtC+hkh
 8nmc0sLtezWDQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Mar 2024 11:56:59 +0100
Subject: [PATCH v3 04/13] drm/display: Make DisplayPort CEC-over-AUX
 Kconfig name consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-kms-kconfig-helpers-v3-4-eafee11b84b3@kernel.org>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
In-Reply-To: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fNaimuoHSsgrvou3A7pRWnd9jF14e+9xHIs3h+JgTaw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMvxu/rnwYfH2OQcTOE5tTr/hIHSnyNZ/3zJ1pSrfjz
 5se2wR6O6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEwpcx1sfl/IysCtt26KFt
 xDWG+h7eGW9YmDnO6ml/mPnH5QbLzrNHulkz5QP+sqeHKO458Ei2mLGhI+bLzH1ic/Tf5viW3e3
 UM6meWZRmVO1vKHrn6YMXmunZdUpqvw9fCD+w9pJHxaI5tWEA
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
the DisplayPort CEC tunnelling implementation uses CONFIG_DRM_DISPLAY_DP_AUX_CEC.

Since the number of users is limited, we can easily rename it to make it
consistent.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/parisc/configs/generic-32bit_defconfig | 2 +-
 drivers/gpu/drm/display/Kconfig             | 2 +-
 drivers/gpu/drm/display/Makefile            | 2 +-
 include/drm/display/drm_dp_helper.h         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index ee4febb30386..5ce258f3fffa 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -129,11 +129,11 @@ CONFIG_PRINTER=m
 CONFIG_PPDEV=m
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_HWMON=m
 CONFIG_DRM=m
-CONFIG_DRM_DP_CEC=y
+CONFIG_DRM_DISPLAY_DP_AUX_CEC=y
 # CONFIG_DRM_I2C_CH7006 is not set
 # CONFIG_DRM_I2C_SIL164 is not set
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
 # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 038be9795581..35cb68db0bfd 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -57,11 +57,11 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
 	  read and write values to arbitrary DPCD registers on the DP aux
 	  channel.
 
-config DRM_DP_CEC
+config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 44015aef1e8c..17d2cc73ff56 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -13,8 +13,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
-drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_AUX_CEC) += drm_dp_cec.o
 
 obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index a62fcd051d4d..46f4e0467d24 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -720,11 +720,11 @@ static inline int drm_panel_dp_aux_backlight(struct drm_panel *panel,
 	return 0;
 }
 
 #endif
 
-#ifdef CONFIG_DRM_DP_CEC
+#ifdef CONFIG_DRM_DISPLAY_DP_AUX_CEC
 void drm_dp_cec_irq(struct drm_dp_aux *aux);
 void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
 				   struct drm_connector *connector);
 void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
 void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address);

-- 
2.44.0

