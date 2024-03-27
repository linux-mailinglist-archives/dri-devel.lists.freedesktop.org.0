Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0281588DBA3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 11:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9617810F9F3;
	Wed, 27 Mar 2024 10:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TuQXpbyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342A010ECA7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 10:57:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DC646137F;
 Wed, 27 Mar 2024 10:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5675C43394;
 Wed, 27 Mar 2024 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711537042;
 bh=F7FdfU7blZriNzF4/MKYY5vKASqwwpJqvhdEe2wM730=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TuQXpbygroLDQP5fmHMB3ZsfoloiBRLcZ/MGYCVLfxxHmUAQ4wAHC7+AKnTnM7/el
 wVgrEs675FIgbXVtMr8c+mpnazxlO6+Kc54Hh2d07lTR2d0VQnWsLG5Svbad2iWDSG
 41jOMLowzlFo16H5EZVWwpgYZ2ZqamCA5p7W7yOAeESBWA8Z4G+ubnhJBL3EDy84bg
 OZzht/e062QaSBJcMEYC0qq87NTGDtGqPaDS6AQigCVNi04YZdMNDJxtydLN856kP2
 wIwvbIq1ESGg6oWOVV+U4u3EjAtByi7puHq0MEGaKl0HDnT7rUCg0xbMyAjzUVNhGP
 SsdiAZvxZOfbQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 27 Mar 2024 11:56:58 +0100
Subject: [PATCH v3 03/13] drm/display: Make DisplayPort AUX Chardev Kconfig
 name consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-kms-kconfig-helpers-v3-3-eafee11b84b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4470; i=mripard@kernel.org;
 h=from:subject:message-id; bh=F7FdfU7blZriNzF4/MKYY5vKASqwwpJqvhdEe2wM730=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnMvxte7RObsOnhx1/7pYLW2Cw8eat0Kv+mVTOWLfzts
 tS+coLBxI6pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwEZbtjPUunr7SJu1pL33X
 Pyv0e+B6pnvz9OcH9ykyTmrzDpT9s++Hofn8ZvUvPb+spx9q6V+/YyZjwy/LfyXrN7+arhS334o
 57O/HI7d4fMLyPqhk7NsuZLLu9MIZ2R+nft5caPf2wf5pgqwH5wIA
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
the DisplayPort-AUX chardev interface uses DRM_DP_AUX_CHARDEV.

Since the number of users is limited and it's a selected symbol, we can
easily rename it to make it consistent.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/Kconfig                  | 2 +-
 drivers/gpu/drm/display/Makefile                 | 2 +-
 drivers/gpu/drm/display/drm_dp_helper.c          | 2 +-
 drivers/gpu/drm/display/drm_dp_helper_internal.h | 2 +-
 drivers/gpu/drm/i915/Kconfig.debug               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 0d350e9db807..038be9795581 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -48,11 +48,11 @@ config DRM_DISPLAY_HDMI_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
 
-config DRM_DP_AUX_CHARDEV
+config DRM_DISPLAY_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
 	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 3edf1ba2764e..44015aef1e8c 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -12,9 +12,9 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
 	drm_dp_tunnel.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
-drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
 obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 266826eac4a7..66a1785447b8 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2111,11 +2111,11 @@ EXPORT_SYMBOL(drm_dp_aux_init);
  * &drm_dp_aux.dev will typically be the &drm_connector &device which
  * corresponds to @aux. For these devices, it's advised to call
  * drm_dp_aux_register() in &drm_connector_funcs.late_register, and likewise to
  * call drm_dp_aux_unregister() in &drm_connector_funcs.early_unregister.
  * Functions which don't follow this will likely Oops when
- * %CONFIG_DRM_DP_AUX_CHARDEV is enabled.
+ * %CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV is enabled.
  *
  * For devices where the AUX channel is a device that exists independently of
  * the &drm_device that uses it, such as SoCs and bridge devices, it is
  * recommended to call drm_dp_aux_register() after a &drm_device has been
  * assigned to &drm_dp_aux.drm_dev, and likewise to call
diff --git a/drivers/gpu/drm/display/drm_dp_helper_internal.h b/drivers/gpu/drm/display/drm_dp_helper_internal.h
index 8917fc3af9ec..737949a2820f 100644
--- a/drivers/gpu/drm/display/drm_dp_helper_internal.h
+++ b/drivers/gpu/drm/display/drm_dp_helper_internal.h
@@ -3,11 +3,11 @@
 #ifndef DRM_DP_HELPER_INTERNAL_H
 #define DRM_DP_HELPER_INTERNAL_H
 
 struct drm_dp_aux;
 
-#ifdef CONFIG_DRM_DP_AUX_CHARDEV
+#ifdef CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV
 int drm_dp_aux_dev_init(void);
 void drm_dp_aux_dev_exit(void);
 int drm_dp_aux_register_devnode(struct drm_dp_aux *aux);
 void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux);
 #else
diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 5ae02c1cd25c..d8397065c3f0 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -25,11 +25,11 @@ config DRM_I915_DEBUG
 	select PREEMPT_COUNT
 	select I2C_CHARDEV
 	select REF_TRACKER
 	select STACKDEPOT
 	select STACKTRACE
-	select DRM_DP_AUX_CHARDEV
+	select DRM_DISPLAY_DP_AUX_CHARDEV
 	select DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG if DRM_I915_DP_TUNNEL
 	select X86_MSR # used by igt/pm_rpm
 	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
 	select DRM_DEBUG_MM if DRM=y
 	select DRM_EXPORT_FOR_TESTS if m

-- 
2.44.0

