Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D78A66F4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA98B112B3F;
	Tue, 16 Apr 2024 09:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8Gx2U5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7714710FCBC;
 Tue, 16 Apr 2024 09:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713259220; x=1744795220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qj8Y9E33Ohcq7vRBOVReilOeWjY+ZrfZOEay1NYYdVA=;
 b=L8Gx2U5z0ZFmvIXZ8pdfKAJkq4v9TaOM5oSKgUG0KoKpD3RXHuOEkgNK
 F8O0Bn1Hl1y3QOPEzPHEfoDbcs7pIowJbIo0IEkwFkIMIl1pQi+JjFwem
 ZxiVPv2+7g0BJMwJIdYm3KT4paOII/2PitBhEHj9ZfDAgDtNexAENTm5t
 XRdYcQKOTvBmAHdjlA23FEZlVvS8zxd5hD8IcwkxfGENopmzkc3Z433hI
 8wIN+p8ObipCFRwJIVtjuzVGYhNuX43ss2tuEBFsTTY1E2Vximw0UbFHr
 75gj0OdOzuUZYvBrBZeU9bB8fQbpBsvKLlqhQC140qhiUcjuMQSJJTJou w==;
X-CSE-ConnectionGUID: AVgP98wTRvqrbEbIHUsfkQ==
X-CSE-MsgGUID: sJv0d9UPQeiRb9dWOk3cIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8606011"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8606011"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:20 -0700
X-CSE-ConnectionGUID: NWQlPjmZQEub1trDbcmkXA==
X-CSE-MsgGUID: t0Hr1Ua7Sw+AILEVG9Z2kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22199341"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [REBASE 3/7] drm/edid: group struct drm_edid based declarations
 together
Date: Tue, 16 Apr 2024 12:19:56 +0300
Message-Id: <2634de73734dfbf0a772511a80eab966c8206cf2.1713259151.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
References: <cover.1713259151.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Keep the declarations for struct drm_edid based functions together.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_edid.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 324e900cc287..92fff199aa78 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -431,10 +431,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
-const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
-u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
-bool drm_edid_match(const struct drm_edid *drm_edid,
-		    const struct drm_edid_ident *ident);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
 struct edid *drm_edid_duplicate(const struct edid *edid);
@@ -474,6 +470,7 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
 					    int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
 					    void *context);
+const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
 const struct drm_edid *drm_edid_read_switcheroo(struct drm_connector *connector,
 						struct i2c_adapter *adapter);
 int drm_edid_connector_update(struct drm_connector *connector,
@@ -484,5 +481,8 @@ void drm_edid_get_product_id(const struct drm_edid *drm_edid,
 			     struct drm_edid_product_id *id);
 void drm_edid_print_product_id(struct drm_printer *p,
 			       const struct drm_edid_product_id *id, bool raw);
+u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
+bool drm_edid_match(const struct drm_edid *drm_edid,
+		    const struct drm_edid_ident *ident);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.39.2

