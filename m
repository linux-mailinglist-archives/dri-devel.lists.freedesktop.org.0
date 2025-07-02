Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5049AF0F06
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA5B10E67A;
	Wed,  2 Jul 2025 09:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHz10hGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F6110E668;
 Wed,  2 Jul 2025 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447282; x=1782983282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rehJkBC3pvblNXstRixXxh8m67FRuMMLfQ9XcFwQIRU=;
 b=OHz10hGnbxb8Uan3BVh3eRdWYNq1WQMxErYfmi+Xve+4AdAibUPVl0ZE
 nyWK2FNi+bF/XB61KeFO0kSDwyDzTej7HI8ucRXfSLr0k/3WuanffvjbR
 Fn88ADxyY1GwqSGRNSRLJ4tXr6gF6wjvCtNVxoO6gcAK/NVpA147kVu0K
 O9sWSi5bPWkQYGmKZ2XnUJPaK81VAUc7YpVV+0EifBQY2yDzKzbg0FznY
 DKbqgqCFzFJv33KKW0WtYtRAJwDt9kBMc5u8VBj5arVTiu+PFI5sO4uID
 yJhoxnCyokSeOIipsncIG+ZDdK1c2Rko7U4xxqiy32HCijOTf+MdZa0hO g==;
X-CSE-ConnectionGUID: SjM777oBQymsoX83oL0XLA==
X-CSE-MsgGUID: wUTzzoNlR1e4bbruQmPFmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427012"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427012"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:02 -0700
X-CSE-ConnectionGUID: QmXl5OqDRMyDxbcgXahPeA==
X-CSE-MsgGUID: zEwuvJ/jT0CgTSXBHikr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536466"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:07:58 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 07/24] drm/i915: Add identifiers for intel color blocks
Date: Wed,  2 Jul 2025 14:49:19 +0530
Message-ID: <20250702091936.3004854-8-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

