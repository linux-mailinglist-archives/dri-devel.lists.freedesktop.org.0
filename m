Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC78763BC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E24113881;
	Fri,  8 Mar 2024 11:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC505XQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA6D113881;
 Fri,  8 Mar 2024 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709898978; x=1741434978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rK7kWWs4+hVfvlukxJc/lA8cslM+lNCJn3z4mbIHEm8=;
 b=DC505XQdlukoCgFomJasIDknoYYpBbtNbcCZD9UufCG1BqHOSzOugTHZ
 wGPGOlACLUf0MFmvyykL1NpYU42OiizPi4llCTYUygWs/aVYO8VsfeSfw
 URls2ZiGD+bG/oDFVtRmVTIVrOBVe5mme3WbYXDPboqDzlYj6opEZBsti
 +usZilTPbar2svQnQq69cPxqWcW6+7mVLd88ivszmzCunCUX+r01k12Gh
 WZFevoX2yQPPB8NBg04cv2ZzjUlO0/ujvcf3BW8tAIsy7Pj0VeirhbSdV
 Jm2k2ctSfKEJoWluWvJLpnbvW2Xx2eQMz7ZOPtCCSi1YeyP2mtS/Xtbqx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22139932"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="22139932"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10487644"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 01/16] drm: add missing header guards to drm_crtc_internal.h
Date: Fri,  8 Mar 2024 13:55:39 +0200
Message-Id: <7ad51d9fb9c42c9901c5c1d5d16e32e857da9758.1709898638.git.jani.nikula@intel.com>
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

