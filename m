Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7B9873F22
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA39E113421;
	Wed,  6 Mar 2024 18:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DgIseS9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92AD113420;
 Wed,  6 Mar 2024 18:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749906; x=1741285906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yG1LpTcJqzmN8OP4k89EVBJEUwWfcGkn17HFCUkG1l8=;
 b=DgIseS9AC/Y1pIp7tJrmGx02jMXQ5xCsa9Bl8eTcQN5Du08Iv7AJFrOd
 +Ala/6l7s+A40BoR3KvK5EYUBhxkN/XCVi7LlzfbdBqlAYqaJySa0IPNL
 r5gDT1X7z99y7r2+Q+IEeZrLbPazPNjdR/dRdaxh9Ar1tYIb4HycW03Ju
 X5bQZZrN7auSwB5MSW2jOxznXMNbg81en2OZwEnAFWx/NDo3lG7TmabpQ
 7CaxKMHI6QCSfff/AmyqB5mI/26+9aYS/ZboG+RwHwTJVIWe9+CWIkTAw
 v4ngIrgPaNODM2hk4s51OPQWujtK6fNOpfDi5dMZzElMbWiGsnx6hsiFY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15818021"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15818021"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9922777"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 02/22] drm: add missing header guards to drm_internal.h
Date: Wed,  6 Mar 2024 20:31:07 +0200
Message-Id: <6e744360513e581765147ea7b1e693f4bffe03a9.1709749576.git.jani.nikula@intel.com>
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

Including the file twice leads to errors.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 8e4faf0a28e6..d69744c9ac15 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -21,6 +21,9 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#ifndef __DRM_INTERNAL_H__
+#define __DRM_INTERNAL_H__
+
 #include <linux/kthread.h>
 #include <linux/types.h>
 
@@ -276,3 +279,5 @@ void drm_framebuffer_debugfs_init(struct drm_device *dev);
 /* drm_edid.c */
 void drm_edid_cta_sad_get(const struct cea_sad *cta_sad, u8 *sad);
 void drm_edid_cta_sad_set(struct cea_sad *cta_sad, const u8 *sad);
+
+#endif /* __DRM_INTERNAL_H__ */
-- 
2.39.2

