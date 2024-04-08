Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C149C89BAFB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3691122E9;
	Mon,  8 Apr 2024 08:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="larGtFsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600CB112303;
 Mon,  8 Apr 2024 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712566584; x=1744102584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12zjj2/En7RptkNkfL85EdZZ8p/Xi8cCRzRJe7hvj4I=;
 b=larGtFsQySTAKHhi+cxk0IRT4bjhf4JWn/EE/tfMgnNXPSENE0tvQWFs
 NT2tyNdvW0RWszfHPBqr8DchmUe1Zm9BTCcaEfZVzQi377ujI74Tt7R33
 twt4Yq3LdBc2yqALjMfNxZno9nqxhDGQBWrdTD+5SFd5TiIXW/gU64HW3
 UpmwiJbjZH1MgGSxNZPW1w4BIIF0HFDid6pTkIEkFn7WRn2AEGnIbwyyI
 GUbHfwaFqU+CVyaPgNwU3x+5cBxA345UC6C9HeT2HM6eLhgAD8TTzKgVT
 Yx8pSp2oSRYYgjh5QEhp+atuUUJLCIGpB2abeFeqpl78BHZWOQ0qVkiUk g==;
X-CSE-ConnectionGUID: SZ5iUlQKQqWbXd2AKI5QnA==
X-CSE-MsgGUID: m63YkiZSTm2KaJm5eJ17Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25279165"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="25279165"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:24 -0700
X-CSE-ConnectionGUID: AjCocfsRSwKHp+NTzlVPNw==
X-CSE-MsgGUID: /jRX+WS0Rky88uTAqAJVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19732884"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 2/7] drm/edid: move all internal declarations to
 drm_crtc_internal.h
Date: Mon,  8 Apr 2024 11:56:03 +0300
Message-Id: <34f4686f306e8bde1f168a5f3127c1d280dce2dc.1712565984.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712565984.git.jani.nikula@intel.com>
References: <cover.1712565984.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The declarations for internal EDID functions are a bit scattered. Put
them all in drm_crtc_internal.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 6 ++++++
 drivers/gpu/drm/drm_displayid.c     | 1 +
 drivers/gpu/drm/drm_eld.c           | 4 +++-
 drivers/gpu/drm/drm_internal.h      | 5 -----
 include/drm/drm_edid.h              | 3 ---
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 0c693229a1c9..2256893d7d67 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -43,12 +43,14 @@ enum drm_color_range;
 enum drm_connector_force;
 enum drm_mode_status;
 
+struct cea_sad;
 struct drm_atomic_state;
 struct drm_bridge;
 struct drm_connector;
 struct drm_crtc;
 struct drm_device;
 struct drm_display_mode;
+struct drm_edid;
 struct drm_file;
 struct drm_framebuffer;
 struct drm_mode_create_dumb;
@@ -297,6 +299,10 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
 int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m);
 int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
 int drm_edid_override_reset(struct drm_connector *connector);
+const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
+				  int ext_id, int *ext_index);
+void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
+void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
 
 /* drm_edid_load.c */
 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index f72a893c7deb..f800dc0906d5 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -6,6 +6,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+#include "drm_crtc_internal.h"
 #include "drm_displayid_internal.h"
 
 static const struct displayid_header *
diff --git a/drivers/gpu/drm/drm_eld.c b/drivers/gpu/drm/drm_eld.c
index 5177991aa272..c0428d07de53 100644
--- a/drivers/gpu/drm/drm_eld.c
+++ b/drivers/gpu/drm/drm_eld.c
@@ -3,10 +3,12 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/export.h>
+
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 
-#include "drm_internal.h"
+#include "drm_crtc_internal.h"
 
 /**
  * drm_eld_sad_get - get SAD from ELD to struct cea_sad
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 2215baef9a3e..690505a1f7a5 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -35,7 +35,6 @@
 
 #define DRM_IF_VERSION(maj, min) (maj << 16 | min)
 
-struct cea_sad;
 struct dentry;
 struct dma_buf;
 struct iosys_map;
@@ -278,8 +277,4 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
 void drm_framebuffer_debugfs_init(struct drm_device *dev);
 
-/* drm_edid.c */
-void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
-void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
-
 #endif /* __DRM_INTERNAL_H__ */
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 6f65bbf655a1..6eadc4f12c07 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -467,7 +467,4 @@ int drm_edid_connector_update(struct drm_connector *connector,
 int drm_edid_connector_add_modes(struct drm_connector *connector);
 bool drm_edid_is_digital(const struct drm_edid *drm_edid);
 
-const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
-				  int ext_id, int *ext_index);
-
 #endif /* __DRM_EDID_H__ */
-- 
2.39.2

