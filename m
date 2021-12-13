Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0D447249A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED4F10E722;
	Mon, 13 Dec 2021 09:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1310E707;
 Mon, 13 Dec 2021 09:36:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A9C3C1F3B0;
 Mon, 13 Dec 2021 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639388214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73CtBu3d59pYCmG3VQt0f/2WoOvpkbFVTTn+gbGH4Tw=;
 b=hbpr3rcEX9B+VHWPXY8kgh+Kb2AueylMYU+OfqZBhP3+UkVKQ4pCh4b7gpLzyX0ZkIb6qk
 zkl894BfC9JBMhIA9Pddc3YCQiYz5g11svWsRZWLoSixmBwYEK2ixo7VGIDbDpqWFu8kSx
 4MpxUfcdOUMj4drExtekDJhtRtuilig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639388214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73CtBu3d59pYCmG3VQt0f/2WoOvpkbFVTTn+gbGH4Tw=;
 b=fEgikt+WaojM6iv4PePUieh/d6EPwcXR8oGu8vQ0Ueebd+GYTLCX5tyIQ+mW+ZSOy2tb27
 yS2dg2nG2jDECFBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 694A713CCB;
 Mon, 13 Dec 2021 09:36:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gNTOGDYUt2E+JwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Dec 2021 09:36:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH 2/3] drm/dp: Move DP declarations into separate header file
Date: Mon, 13 Dec 2021 10:36:49 +0100
Message-Id: <20211213093650.19598-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213093650.19598-1-tzimmermann@suse.de>
References: <20211213093650.19598-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the DP declarations from other helpers before moving the
DP functions into a separate module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_crtc_helper_internal.h | 27 ---------------------
 drivers/gpu/drm/drm_dp_aux_dev.c           |  2 +-
 drivers/gpu/drm/drm_dp_helper.c            |  2 +-
 drivers/gpu/drm/drm_dp_helper_internal.h   | 28 ++++++++++++++++++++++
 drivers/gpu/drm/drm_dp_mst_topology.c      |  2 +-
 drivers/gpu/drm/drm_kms_helper_common.c    |  1 +
 6 files changed, 32 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_dp_helper_internal.h

diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
index 61e09f8a8d0f..28e04e750130 100644
--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
@@ -28,36 +28,9 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_modes.h>
 
-/* drm_dp_aux_dev.c */
-#ifdef CONFIG_DRM_DP_AUX_CHARDEV
-int drm_dp_aux_dev_init(void);
-void drm_dp_aux_dev_exit(void);
-int drm_dp_aux_register_devnode(struct drm_dp_aux *aux);
-void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux);
-#else
-static inline int drm_dp_aux_dev_init(void)
-{
-	return 0;
-}
-
-static inline void drm_dp_aux_dev_exit(void)
-{
-}
-
-static inline int drm_dp_aux_register_devnode(struct drm_dp_aux *aux)
-{
-	return 0;
-}
-
-static inline void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux)
-{
-}
-#endif
-
 /* drm_probe_helper.c */
 enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
 					 const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/drm_dp_aux_dev.c b/drivers/gpu/drm/drm_dp_aux_dev.c
index 06b374cae956..0618dfe16660 100644
--- a/drivers/gpu/drm/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/drm_dp_aux_dev.c
@@ -40,7 +40,7 @@
 #include <drm/drm_dp_mst_helper.h>
 #include <drm/drm_print.h>
 
-#include "drm_crtc_helper_internal.h"
+#include "drm_dp_helper_internal.h"
 
 struct drm_dp_aux_dev {
 	unsigned index;
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 23f9073bc473..e995a0262ed7 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -35,7 +35,7 @@
 #include <drm/drm_dp_mst_helper.h>
 #include <drm/drm_panel.h>
 
-#include "drm_crtc_helper_internal.h"
+#include "drm_dp_helper_internal.h"
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
diff --git a/drivers/gpu/drm/drm_dp_helper_internal.h b/drivers/gpu/drm/drm_dp_helper_internal.h
new file mode 100644
index 000000000000..5c9f8bb0c99a
--- /dev/null
+++ b/drivers/gpu/drm/drm_dp_helper_internal.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT */
+
+#include <drm/drm_dp_helper.h>
+
+#ifdef CONFIG_DRM_DP_AUX_CHARDEV
+int drm_dp_aux_dev_init(void);
+void drm_dp_aux_dev_exit(void);
+int drm_dp_aux_register_devnode(struct drm_dp_aux *aux);
+void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux);
+#else
+static inline int drm_dp_aux_dev_init(void)
+{
+	return 0;
+}
+
+static inline void drm_dp_aux_dev_exit(void)
+{
+}
+
+static inline int drm_dp_aux_register_devnode(struct drm_dp_aux *aux)
+{
+	return 0;
+}
+
+static inline void drm_dp_aux_unregister_devnode(struct drm_dp_aux *aux)
+{
+}
+#endif
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 7f0ff96261cf..9f7b0b606924 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -45,7 +45,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
-#include "drm_crtc_helper_internal.h"
+#include "drm_dp_helper_internal.h"
 #include "drm_dp_mst_topology_internal.h"
 
 /**
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
index 47e92400548d..88260d26409c 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -29,6 +29,7 @@
 
 #include <drm/drm_print.h>
 
+#include "drm_dp_helper_internal.h"
 #include "drm_crtc_helper_internal.h"
 
 MODULE_AUTHOR("David Airlie, Jesse Barnes");
-- 
2.34.1

