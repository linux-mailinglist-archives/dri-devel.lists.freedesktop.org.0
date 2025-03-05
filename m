Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E215A4FFDC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E6310E79B;
	Wed,  5 Mar 2025 13:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5c0SXxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CB410E797;
 Wed,  5 Mar 2025 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180478; x=1772716478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rehJkBC3pvblNXstRixXxh8m67FRuMMLfQ9XcFwQIRU=;
 b=h5c0SXxRw8kST9b1eJ5tuF5vFxJ0YRnctJpw0d/upoi+DVY3xF/ypU1K
 jR1tqBFhVdw80PszFdRR1T5F6OLTqwvik/xexIvsJ6DEG1an+kfXa3Svj
 1rSDSeph9b0/pMGCT/rsx1lPzgU2YAjYIyU9P1LRcC2DvWmkPDSKPtzSV
 mnCekU3EdMN1CJ8JnSJfnjhrV2oE6lB+rHfWtGT0gdjSDVhGkAdELrGB6
 AanZv1MJnMGso/UiyenW0nQEB0p4jrGrZAMKnsFJVSUdHU6sQuEAe34YI
 Q3XzXBTEZH9cq5r9E2ql42fJGNkRKTcgAEaAFa9qPWZFqaa1+JZaLL2CI Q==;
X-CSE-ConnectionGUID: YIFTjS5/TTW3eZ0OCN9UZw==
X-CSE-MsgGUID: l8ck98TaRv+GfPeVKkGMPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685460"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685460"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:37 -0800
X-CSE-ConnectionGUID: 0smsza3lTUiJ0T//exYfVA==
X-CSE-MsgGUID: +aRg5jSJS8Wgp533U1JNvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701124"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:33 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 08/23] drm/i915: Add identifiers for intel color blocks
Date: Wed,  5 Mar 2025 18:55:53 +0530
Message-ID: <20250305132608.2379253-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

