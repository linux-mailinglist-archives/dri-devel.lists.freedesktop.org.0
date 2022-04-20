Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0B5086AA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ED510E8BC;
	Wed, 20 Apr 2022 11:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A33D10E87E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:09:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C61A2112B;
 Wed, 20 Apr 2022 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650452942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGi1eKQFVXA39eNG3O/gxiQ9xIDgWvszNAIvTN5nULQ=;
 b=arkU37VwSyOSCCWgS3H8LX+SK42A9ZqK9yMMxFzn2le4R5btEhyIOnwovOx/X613xn/Auw
 bsd0hJggMzIPU3Y4dj1+XqfHOLeKpQNUk4eoSz3/qnFNh4VeV0Pq4Q8s4AJsYsB89rLUC7
 quO5e9PmXwwwfIJrsUY/TnxDXE8+jsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650452942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGi1eKQFVXA39eNG3O/gxiQ9xIDgWvszNAIvTN5nULQ=;
 b=jf7r5h7xPfNJMJ/XlVALnELP9TJXmE/hnGKag6DYH8sug0rgPIg2NbHmvdBxm1QRI6O7wj
 CiQmlhsObxKYORDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BBA413AE0;
 Wed, 20 Apr 2022 11:09:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +MVfGc7pX2LaPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Apr 2022 11:09:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, lyude@redhat.com,
 javierm@redhat.com
Subject: [PATCH v2 1/8] drm: Put related statements next to each other in
 Makefile
Date: Wed, 20 Apr 2022 13:08:53 +0200
Message-Id: <20220420110900.8707-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420110900.8707-1-tzimmermann@suse.de>
References: <20220420110900.8707-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Give the Makefile a bit more structure by putting rules for core,
helpers, drivers, etc next to each other.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/Makefile | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c2ef5f9fce54..e5929437e13c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -18,7 +18,6 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
 		drm_client_modeset.o drm_atomic_uapi.o \
 		drm_managed.o drm_vblank_work.o
-
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
 			    drm_hashtab.o drm_irq.o drm_legacy_misc.o drm_lock.o \
 			    drm_memory.o drm_scatter.o drm_vm.o
@@ -30,8 +29,16 @@ drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
 drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
+obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
+obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
+
+#
+# Memory-management helpers
+#
+
+obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
 drm_cma_helper-y := drm_gem_cma_helper.o
 drm_cma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_cma_helper.o
@@ -40,14 +47,16 @@ obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
 drm_shmem_helper-y := drm_gem_shmem_helper.o
 obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
 
-obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
-
 drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
 drm_ttm_helper-y := drm_gem_ttm_helper.o
 obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 
+#
+# Modesetting helpers
+#
+
 drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
 		drm_dsc.o drm_encoder_slave.o drm_flip_work.o drm_hdcp.o \
 		drm_probe_helper.o \
@@ -60,14 +69,16 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
 		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
-
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
+
+#
+# Drivers and the rest
+#
+
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
 
-obj-$(CONFIG_DRM)	+= drm.o
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
-obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-y			+= arm/
 obj-y			+= dp/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
-- 
2.35.1

