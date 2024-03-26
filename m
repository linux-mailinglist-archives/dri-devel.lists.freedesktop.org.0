Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7688BFFE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 11:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393FB10EE4F;
	Tue, 26 Mar 2024 10:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gH0x19XB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538B910EE4F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:57:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 24501CE201C;
 Tue, 26 Mar 2024 10:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D80CC433C7;
 Tue, 26 Mar 2024 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711450618;
 bh=fNaimuoHSsgrvou3A7pRWnd9jF14e+9xHIs3h+JgTaw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gH0x19XBvDh1eUYm0MuAJ/XB9pRJTN/dDs3H+LxJQvhMuaVUFvXLqpKWGVpoD6pVi
 mGcuS3EYtvCJs4Wn8qmRM7sQCXci0qmFi92/iiQ6CFhE2LFj3BjNtZrA7DoEkBnUsP
 dZ+OWaLVhXTMfjGVoyCTPO7VZ2pRMIU2LZ6ILD9K7Sqx5Jdjp4hosvXVhM9wSmC/M1
 LyG93w5YXFZozC+DU2YGFDvVdjY0xanIEpwtHvOfU2V/rOT04TrhewC3GGiJZxBe8e
 NAI4dW2+Xuo3hoEgwC+caywRMLxUTVPde7HxslNa+BpXy7Mx36UuSFtKc+ZhNkA38n
 filFwH1sse0jg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 26 Mar 2024 11:56:17 +0100
Subject: [PATCH v2 04/12] drm/display: Make DisplayPort CEC-over-AUX
 Kconfig name consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-kms-kconfig-helpers-v2-4-3b0aeee32217@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fNaimuoHSsgrvou3A7pRWnd9jF14e+9xHIs3h+JgTaw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlMK6+p6AXWtXML+mkXluR9Frr1NjkwIYVX9aLdBr8fv
 j5LfWZ2TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgInsFGKsj5LnjH/+3GXNjW25
 vzXb/vT82vnpi6/POrVjZvqv2vv3d2w3mnmjtYylYAtDmNPLtyx9jA2Lfjq6zTnLp7f4d8NWFs9
 7rherXM1PrPNRSl/HMTsuxX3FP9394v93v/mhxf+r5bJMHQsA
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

