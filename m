Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F88856B7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B614B10E4C2;
	Thu, 21 Mar 2024 09:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COm9w4wG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918D010E4C2;
 Thu, 21 Mar 2024 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711014352; x=1742550352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BnavicqBEYhBzwyTj6BAbml9agI26PcL36kEbvLlQBk=;
 b=COm9w4wGW6Dafxi/f1jsp2zBddp3TMj44gbnm0ay2SMqk7BWWZylcILQ
 83HisJhhYgXcURK4NT/3lSnCgFnxKjp0XW2WjuOLIBX+daborPq7h/YqC
 sn2WburgJqxSvJaZfSQubZ518X4WhXsZm6QziZEuXd2d8a+jqTzft2zM8
 tYIMCUlXfEQ9f6ohZ6dtH0gIpqSOhT5w3FJo3ycN4dTE79Pi6Kbw6XyCC
 qJxlyiKU6SQoPIdL8wvYZGLhCH217Of87f3KK10/HfLiLazOx7xImOtxM
 MIkoC/rdTLlRL8QViUq99g7BRG9lNEKgF3OUPqtQ+5PcKPVsE5jkAmouR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28462379"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="28462379"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14854758"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:45:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 3/3] drm/edid: group struct drm_edid based declarations
 together
Date: Thu, 21 Mar 2024 11:45:31 +0200
Message-Id: <774899a4f138bc2d9736af75b0f331cca1a13341.1711014272.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711014272.git.jani.nikula@intel.com>
References: <cover.1711014272.git.jani.nikula@intel.com>
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

