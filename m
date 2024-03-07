Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9638749BB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD041135F6;
	Thu,  7 Mar 2024 08:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrFL+MmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3810F10F17A;
 Thu,  7 Mar 2024 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709800535; x=1741336535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rK7kWWs4+hVfvlukxJc/lA8cslM+lNCJn3z4mbIHEm8=;
 b=ZrFL+MmRZMitqQw78qloaH0mE0yju7RUXF9YY6AJ5ltmWNM763SHoYZC
 4cI7GOBUIooZcIE8K/T7v9qhehcGGwItvqearOyquExYhJ3wBaQPW7/I7
 cTJ1OpakUCwB0XGoNTGNn1sOO3C5+2BcZO0+3EgIwA6dQ+qFwI+6Vpn8t
 vS90bxvSiVcQCpjA4xKX+TYcdDC7RjRP2WMYil9MXQ2jVjBKkmDozAymh
 H6bVc/CTh3FtL371Em3pvoz1ct8uNKxRseLWa+Z4eMdV9PkVDLACgZ0lD
 eXPnUjOy86B6jjsNC4fLKygLMtjrT/Z8HS9xzn98aO7D07NQQH9X2Scs1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4577769"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4577769"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:35:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="10199079"
Received: from tcavalax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.241])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:35:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] drm: add missing header guards to drm_crtc_internal.h
Date: Thu,  7 Mar 2024 10:35:26 +0200
Message-Id: <20240307083526.2605475-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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

Including the file twice can lead to errors.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index c0c5d79ed4c9..0c693229a1c9 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -32,6 +32,9 @@
  * and are not exported to drivers.
  */
 
+#ifndef __DRM_CRTC_INTERNAL_H__
+#define __DRM_CRTC_INTERNAL_H__
+
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -305,3 +308,5 @@ drm_edid_load_firmware(struct drm_connector *connector)
 	return ERR_PTR(-ENOENT);
 }
 #endif
+
+#endif /* __DRM_CRTC_INTERNAL_H__ */
-- 
2.39.2

