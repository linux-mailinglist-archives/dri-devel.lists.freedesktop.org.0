Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60FA5D6F7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3266010E6F3;
	Wed, 12 Mar 2025 07:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+W8CBbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC82210E6F3;
 Wed, 12 Mar 2025 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763567; x=1773299567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rehJkBC3pvblNXstRixXxh8m67FRuMMLfQ9XcFwQIRU=;
 b=E+W8CBbZOL3GQy1RO1ZhUiAxyKYZpBZGxTcGjAw6OwRA3LxrRCoVVX0D
 HChjWU/XEIhfJ+y5tE1tilI48+iTl1l8B1eQ/n/GhDuN0Ztpailg0nM9W
 k3Lrb82sot0B8iu8SL1GRy7CbAy5UeI9qX9lCVLExe5tdXusG9KKIMqcc
 y0zXV4PdEd0W1qPkzDfFqmhdsnWGJThzLmksGl+SnrSbnkWSubJrMpmdY
 dFHjHqE2spoVufX8hVAOPcS3Y1vjwzoO45TG/1sf+NuFkW/kezLiPsxx/
 2mce4/4Y4qaHg86dusOJrspqhFFAqgeSdJ9T5ysgMfhLTODyGm9iUIIjE Q==;
X-CSE-ConnectionGUID: KXgRx51QTbGpPhnh3b1WqA==
X-CSE-MsgGUID: 6obVkl+RSeeOBskAGyDeaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288756"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288756"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:47 -0700
X-CSE-ConnectionGUID: CgdS+L8yTrO9v0FrR/yrYA==
X-CSE-MsgGUID: YnnWdZAwSKaLX0nYUKSDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120366239"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:43 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 08/23] drm/i915: Add identifiers for intel color blocks
Date: Wed, 12 Mar 2025 12:54:10 +0530
Message-ID: <20250312072425.3099205-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add macros to identify intel color blocks. It will help
in mapping drm_color_ops to intel color HW blocks

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_limits.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index f0fa27e365ab..97c960cc16aa 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -138,4 +138,17 @@ enum hpd_pin {
 	HPD_NUM_PINS
 };
 
+/*
+ * Intel Color Blocks
+ *
+ */
+
+enum intel_color_block {
+	CB_PLANE_PRE_CSC_LUT,
+	CB_PLANE_CSC,
+	CB_PLANE_POST_CSC_LUT,
+
+	I915_MAX_CB
+};
+
 #endif /* __INTEL_DISPLAY_LIMITS_H__ */
-- 
2.42.0

