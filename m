Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6AF8763BD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696CF113890;
	Fri,  8 Mar 2024 11:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BId0Xjb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F35C113891;
 Fri,  8 Mar 2024 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709898985; x=1741434985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CTPcs7gJuj6JlaTYnuH/lcoKl2nbSpOCazCs7Xt3yAA=;
 b=BId0Xjb6oAsUmQlTl47gADK5FWCFpdaNr/81SFFkzP1TGfXrsi4suOI6
 GxYgnx40YggggVZwYwWzbVWBPuJZ4qKjafj44YrO7pQtwN+ItMtvHOVHA
 c2u2p9JKR562VlTMm+dl5AeQWcGCYkgHxEc+A3ieN83fvWWSLfJJJ6PBJ
 jfpRv/mn8qkN4ydoPiGRyHT+78C0bns0UYiLJQb6qoP2cSu7OyPDe6wZZ
 NeOyPK6ZxEDRt8B/xwLZMG3jyeIo2eZ94s2d35/jd7srK+pE22jCsiqcY
 dp/x5mJNtvNAT5GkNJ3i6l7wIuKUKbGD8E9zMSBSoJj/+XZPcJlkLB7UJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15262246"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15262246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10892592"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 02/16] drm: add missing header guards to
 drm_crtc_helper_internal.h
Date: Fri,  8 Mar 2024 13:55:40 +0200
Message-Id: <b5020cdc2ff6d2f4992ea25cf88d528e4738d700.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_crtc_helper_internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
index 28e04e750130..ed4deed07abd 100644
--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
@@ -26,6 +26,9 @@
  * implementation details and are not exported to drivers.
  */
 
+#ifndef __DRM_CRTC_HELPER_INTERNAL_H__
+#define __DRM_CRTC_HELPER_INTERNAL_H__
+
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
@@ -44,3 +47,5 @@ drm_connector_mode_valid(struct drm_connector *connector,
 
 struct drm_encoder *
 drm_connector_get_single_encoder(struct drm_connector *connector);
+
+#endif /* __DRM_CRTC_HELPER_INTERNAL_H__ */
-- 
2.39.2

