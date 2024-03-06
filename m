Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A7F873F3C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B73113428;
	Wed,  6 Mar 2024 18:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aro3mmdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9B311342B;
 Wed,  6 Mar 2024 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749944; x=1741285944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+rG656GKd62P2B6U/UgyN6yMZZ6toMb/xAUz6HU8CQ=;
 b=aro3mmdtniDJb+Szi6Q/8m1eyKvBzTPDc5gx+xd6lEExSr13pDoOUtSf
 0B9mq2LTzZzfA112QqSmoTc0oqdyR2njirLHKd7XeUS6didx2l4jv+jTq
 sWAKE8ZN7snbbu/WFLGUXA4bhzBev1uCr57SFdRK8l5eMJthFc3m+/MNU
 zGhNreZbbKfDWcX6g7SKO1rfMEZO6YXe6x9INcjv+ubFu43CgUPUFpVBF
 DV/FtnFtk1fiKb7YJYcPgv8jsTpmcs56rMB8qolHnm3aZ1HhQg3FAnkWg
 p55BsPfU27zdmKP4WRc/YQNodNlSdRnYUdNeYW9D4dagJ4l1XiQgOq9wK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102698"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14415785"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 10/22] drm/lease: make drm_lease.h self-contained
Date: Wed,  6 Mar 2024 20:31:15 +0200
Message-Id: <3a38688e90bb775380aad5b6aad5dce3d9d87ca7.1709749576.git.jani.nikula@intel.com>
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

Include <linux/types.h> for types used.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_lease.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_lease.h b/include/drm/drm_lease.h
index 5c9ef6a2aeae..53545b4ca9ef 100644
--- a/include/drm/drm_lease.h
+++ b/include/drm/drm_lease.h
@@ -6,6 +6,8 @@
 #ifndef _DRM_LEASE_H_
 #define _DRM_LEASE_H_
 
+#include <linux/types.h>
+
 struct drm_file;
 struct drm_device;
 struct drm_master;
-- 
2.39.2

