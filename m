Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0EC8A98D7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0982C113BE1;
	Thu, 18 Apr 2024 11:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYQ0MVsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344DB113BE1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713440542; x=1744976542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=annPOjj4wnZWBGUdX3uNj6MZSmILT/RjLuk2rKr0FNI=;
 b=nYQ0MVsDQMagnO7EXlMg+STu3GBWKBLcNDoEIAyY9QiuTmoLmlV0yqL5
 0eJEK5WtUpZbU5u03tu2gibl7bqmoN+CGBOI99ohF3oskhiVpj41p/a9Z
 8Zbtkc8wr1XpYYwkoloIuQ/4qF0IpZp6zh/h15m+WE/x0e7u/D3+xqtpz
 Z4btPGg49npGjXhJichAkz29GW8fkLFNA3YHbEw7Yw6zO8qbJQdO9/Aix
 PB0c7RY7ttPkgNM4D3AWEEeoY0afO6EPCNtNpQ7fv1D5HniZKEIv/Nfsb
 5Z3sxB7L5/C9NpETeyn+HD7hR2NdiFZh/WhEQU/hz4LOHvR2SgxK8qX6g Q==;
X-CSE-ConnectionGUID: XR5R89BiS3GWKY12XFq3yA==
X-CSE-MsgGUID: PVIe+QznSL2dq3gZdfEaQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="11924073"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="11924073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:42:22 -0700
X-CSE-ConnectionGUID: VHhfKsKJSJGUheQ+cH1RCg==
X-CSE-MsgGUID: zdxoUNxzTfW38+0OUMv1kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23035461"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Apr 2024 04:42:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Apr 2024 14:42:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm: Fix plane SIZE_HINTS property docs
Date: Thu, 18 Apr 2024 14:42:18 +0300
Message-ID: <20240418114218.9162-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Fix the typos in the plane SIZE_HINTS kernel docs.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 9677547d8362 ("drm: Introduce plane SIZE_HINTS property")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_plane.c   | 2 +-
 include/drm/drm_mode_config.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index eecc24c54efd..57662a1fd345 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1750,7 +1750,7 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
 
 /**
- * drm_plane_add_size_hint_property - create a size hint property
+ * drm_plane_add_size_hints_property - create a size hints property
  *
  * @plane: drm plane
  * @hints: size hints
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 06d7777a881f..8de3c9a5f61b 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -953,7 +953,7 @@ struct drm_mode_config {
 	struct drm_property *modifiers_property;
 
 	/**
-	 * @size_hints_propertty: Plane SIZE_HINTS property.
+	 * @size_hints_property: Plane SIZE_HINTS property.
 	 */
 	struct drm_property *size_hints_property;
 
-- 
2.43.2

