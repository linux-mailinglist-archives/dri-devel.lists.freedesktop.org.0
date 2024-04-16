Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB12C8A66EB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D193C112B34;
	Tue, 16 Apr 2024 09:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lrsW2S8a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B428112B34;
 Tue, 16 Apr 2024 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713259215; x=1744795215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aM2yxv0756H19FkPHtA81LF5zBpjrJ0X2CurGOAaUzU=;
 b=lrsW2S8aE03fNx0LOkSIOpFE0PUetkYTJuTf8Gy83v5TtNmpPYzsFovI
 ejZSIo2Lb35/WV0869/wb7+ujDIrQPXTijp+zCaLOwMdbxyXwCs29Q56U
 vBQ+ZtyPo6NaZBCkF4AuD0zIVubYfqHGfORWk+I2fJd2sLmqY7WrLF7fQ
 /PH9vbbi5MkTQOAac2UVnAXFCwXnP7FPcRDvDzlMzuOHqQ/mfozaOfZfS
 0WWikYs2FyIk4nbGidruvQp/lQ7YASmqLEM30UHCiJ81o2vpzWW6FRfot
 1HtPuRH7buDm6f9vOC4WvoN1yjEHv3YtBgFFp1HLthGq5uC+IE0ljJ5IX g==;
X-CSE-ConnectionGUID: m04WvjWkRmCEEnLqUBxv/A==
X-CSE-MsgGUID: NLCa4qVrTpauK0OSCvCMRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8606005"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8606005"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:15 -0700
X-CSE-ConnectionGUID: MdDJv48lQoCv8NbeJTqR4Q==
X-CSE-MsgGUID: XDhSKAZFRWyTyB2ma+68zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22199312"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [REBASE 2/7] drm/edid: move all internal declarations to
 drm_crtc_internal.h
Date: Tue, 16 Apr 2024 12:19:55 +0300
Message-Id: <9ae137ea51f9cc2ccb3899b0acda553e6a8ce2db.1713259151.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
References: <cover.1713259151.git.jani.nikula@intel.com>
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
index 8e0e32349332..324e900cc287 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -485,7 +485,4 @@ void drm_edid_get_product_id(const struct drm_edid *drm_edid,
 void drm_edid_print_product_id(struct drm_printer *p,
 			       const struct drm_edid_product_id *id, bool raw);
 
-const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
-				  int ext_id, int *ext_index);
-
 #endif /* __DRM_EDID_H__ */
-- 
2.39.2

