Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E6986B53C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8510E470;
	Wed, 28 Feb 2024 16:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsuGHghr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FB210E470;
 Wed, 28 Feb 2024 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709138774; x=1740674774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3mDLj9wiwILjbR9ADm1Yg57UFDZbC2vkkj5xTJ03rm0=;
 b=GsuGHghrcAzkeu9z/4OFH2zg9nk6I5xPTTtFjjVcXvOT95HGQvObL2NL
 Qzz0x51ul1xZET0LwLZ5mHdHYSXAsnfek6qFzT2Pf5YU43qhCtmw5wiq7
 R6wovY/H0OtYaZ9vpdDoGHqXR23gjsbRzBDZ1KwIf4d23CSj/BlqFnO4J
 /cOiFwNN8QMDkgwnW5fImapKoeTB2g3mnx4iB4/v6F9kLzLwar3uCvMnY
 IChUxoR5+Bb2mWS3NkK587jAsfGxKAUsZ69Tp7aZd8oedamoIvx0t0vRC
 6dFV3XDsPBvg24gfnlmwfxi414revzPYtwd3oq6ecqgz4oQxYdzE7hddF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3715688"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3715688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="30676710"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:46:12 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/dp: Fix documentation of DP tunnel functions
Date: Wed, 28 Feb 2024 18:46:36 +0200
Message-ID: <20240228164636.1540903-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the documentation issues below, also reported by 'make htmldocs':

drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or struct member 'tunnel' not described in 'drm_dp_tunnel_put'
drivers/gpu/drm/display/drm_dp_tunnel.c:447: warning: Function parameter or struct member 'tracker' not described in 'drm_dp_tunnel_put'
drivers/gpu/drm/display/drm_dp_tunnel.c:1185: warning: expecting prototype for drm_dp_tunnel_atomic_get_allocated_bw(). Prototype was for drm_dp_tunnel_get_allocated_bw() instead
drivers/gpu/drm/display/drm_dp_tunnel.c:1903: warning: Function parameter or struct member 'max_group_count' not described in 'drm_dp_tunnel_mgr_create'

Fixes: 295654f7e554 ("drm/dp: Add support for DP tunneling")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 120e0de674c19..017f1d4c63415 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -436,8 +436,8 @@ EXPORT_SYMBOL(drm_dp_tunnel_get);
 
 /**
  * drm_dp_tunnel_put - Put a reference for a DP tunnel
- * @tunnel - Tunnel object
- * @tracker - Debug tracker for the reference
+ * @tunnel: Tunnel object
+ * @tracker: Debug tracker for the reference
  *
  * Put a reference for @tunnel along with its debug *@tracker, which
  * was obtained with drm_dp_tunnel_get().
@@ -1170,7 +1170,7 @@ int drm_dp_tunnel_alloc_bw(struct drm_dp_tunnel *tunnel, int bw)
 EXPORT_SYMBOL(drm_dp_tunnel_alloc_bw);
 
 /**
- * drm_dp_tunnel_atomic_get_allocated_bw - Get the BW allocated for a DP tunnel
+ * drm_dp_tunnel_get_allocated_bw - Get the BW allocated for a DP tunnel
  * @tunnel: Tunnel object
  *
  * Get the current BW allocated for @tunnel. After the tunnel is created /
@@ -1892,6 +1892,7 @@ static void destroy_mgr(struct drm_dp_tunnel_mgr *mgr)
 /**
  * drm_dp_tunnel_mgr_create - Create a DP tunnel manager
  * @dev: DRM device object
+ * @max_group_count: Maximum number of tunnel groups
  *
  * Creates a DP tunnel manager for @dev.
  *
-- 
2.43.3

