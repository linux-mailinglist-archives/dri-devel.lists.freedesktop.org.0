Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D4A89BAFC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2761122F5;
	Mon,  8 Apr 2024 08:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOLTkl3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41EA1122FB;
 Mon,  8 Apr 2024 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712566590; x=1744102590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BnavicqBEYhBzwyTj6BAbml9agI26PcL36kEbvLlQBk=;
 b=cOLTkl3wRZWKjefKlpvK/CrDgsKDiJuF4m6x8fyGzzkSo3edVlrDqTxu
 vO9JHRr5Z02WvVYJ3p9ZCJ8K3E9XPwmZjQXoEBriP6mZjSwcRUczG08AC
 fUiKJhnHWlJYP88oqXbIE9v2KyxoInRQWYBYen19HO/8Nbg1aNSpAikET
 t8Z0hcyP9IRyXwZMeqt3834oBihI+CWNdI3h9YCP6QYvWoZPOECIEsngB
 U/7FjHehfiyCcdbKfZ1hsn7f0NuVhVvzM8hHOYEn8FRmO0O/jWWES3WmG
 4MG2IqC+1Y3CiSYyOp5Wj2f8dVFk57NFha43KCMwx37gk+n+EGDeD9WO8 Q==;
X-CSE-ConnectionGUID: FGs6oYL5RyO+8R6QNlxZ0A==
X-CSE-MsgGUID: /2xQnC4URPeLQtEP6MwmYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7997457"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7997457"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:29 -0700
X-CSE-ConnectionGUID: tfOlfydsR+SGFLb6dfKvTA==
X-CSE-MsgGUID: BRSxGKmARym/YDq/OxCvVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24294339"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 3/7] drm/edid: group struct drm_edid based declarations
 together
Date: Mon,  8 Apr 2024 11:56:04 +0300
Message-Id: <57ced070ad4f3a91af66661dcfb6f19687aae3cf.1712565984.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712565984.git.jani.nikula@intel.com>
References: <cover.1712565984.git.jani.nikula@intel.com>
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
index 6eadc4f12c07..19814bb1103c 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -417,10 +417,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
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
@@ -460,11 +456,15 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
 					    int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
 					    void *context);
+const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
 const struct drm_edid *drm_edid_read_switcheroo(struct drm_connector *connector,
 						struct i2c_adapter *adapter);
 int drm_edid_connector_update(struct drm_connector *connector,
 			      const struct drm_edid *edid);
 int drm_edid_connector_add_modes(struct drm_connector *connector);
 bool drm_edid_is_digital(const struct drm_edid *drm_edid);
+u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
+bool drm_edid_match(const struct drm_edid *drm_edid,
+		    const struct drm_edid_ident *ident);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.39.2

