Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88A549E50
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF6010F7AC;
	Mon, 13 Jun 2022 20:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFDA89167;
 Mon, 13 Jun 2022 20:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655150616; x=1686686616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OuJvC5P5CUBOVvbQ2+vWqnl/AWQxe/KvsjH0ne2NRhY=;
 b=TWLCY8tVDzAWFtkTyOLC6RY0o0ZS7tEbx4pd3fLbgI05jsxrWO8VESf5
 Dbhob9JWLQ49CNOqE9B6Z73eESptQrJzBVXktddIRPH+FtnE2wmkRbTb2
 E0YpxODxKHKSdZr1d6jZBCwtcbgKqWYfN1fv1H5Jtlp8CLMCa5JvPSb6L
 K6opiagFhOjN7kgB8NwtEVVYxnjGz5A77sGl8eVRVNKkNOgquAQ/jTPom
 eouuyuatHrPMFBo+Br5/o1Av+vTgG8TghC/YYLYZAHiNv+jELRul/3zOV
 XUSD5BJZzOq/45Z9I/wQbVQ+5j2hvlCgegLdaG8+csD1Tb9nV/8GwjQ8i g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="267088040"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="267088040"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 13:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="582377641"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga007.jf.intel.com with SMTP; 13 Jun 2022 13:03:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Jun 2022 23:03:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm: Remove unnecessary junk from drm_crtc.h
Date: Mon, 13 Jun 2022 23:03:14 +0300
Message-Id: <20220613200317.11305-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
References: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_crtc.h is including several entirely unnecessary headers,
and also contains unused forward declarations. Remove it all.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/drm_crtc.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index c404b6e81220..1cbd95689f33 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -29,18 +29,12 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/fb.h>
-#include <linux/hdmi.h>
 #include <linux/media-bus-format.h>
-#include <uapi/drm/drm_mode.h>
-#include <uapi/drm/drm_fourcc.h>
 #include <drm/drm_modeset_lock.h>
-#include <drm/drm_rect.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_device.h>
-#include <drm/drm_property.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_color_mgmt.h>
 #include <drm/drm_debugfs_crc.h>
 #include <drm/drm_mode_config.h>
 
@@ -49,11 +43,9 @@ struct drm_device;
 struct drm_framebuffer;
 struct drm_mode_set;
 struct drm_file;
-struct drm_clip_rect;
 struct drm_printer;
 struct drm_self_refresh_data;
 struct device_node;
-struct dma_fence;
 struct edid;
 
 static inline int64_t U642I64(uint64_t val)
-- 
2.35.1

