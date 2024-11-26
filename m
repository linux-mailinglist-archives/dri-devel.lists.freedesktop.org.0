Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CE39D9847
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F26610E89C;
	Tue, 26 Nov 2024 13:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNv0m3T8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF5610E899;
 Tue, 26 Nov 2024 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627209; x=1764163209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rehJkBC3pvblNXstRixXxh8m67FRuMMLfQ9XcFwQIRU=;
 b=iNv0m3T8mhmJU5xG8T2fs6d6g9QI0ENmJU43D3fQQfMcAuitRMs78HpY
 kn1b4U/eGsnynZKvDtVhoPKnv157GHPFYZah4Sth72kQsIhYhcDfqlKkH
 dSnf+t6lebrWiXBjsOXP8cQsjLOcIApebEzvvnk0TGhviYENd1YRA763f
 pIJ1vxnuDfbAeqKSBzSD/jUe4blP9yeUtNQBbC5c8S2v+rRdqYcZpfwjK
 IsfvQIJVYrC4bFobBgGcPu1lfED+2dlTVBvmrbEHXvoVpYFqn9+h98XXc
 nSveGbHb1Jl1ZWFk8qqWGM1eT7pfYeUAV9bdulIw55MNHGNwyoYj3wf3K g==;
X-CSE-ConnectionGUID: 4sAxZEcURuWkvhf+9dHukw==
X-CSE-MsgGUID: 4lcBRZusTDqYOvrg8f6Dwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170209"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170209"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:09 -0800
X-CSE-ConnectionGUID: U9Gq+YPdRua/eQMvX4K0NA==
X-CSE-MsgGUID: iDvVCuaATZya1P4BNgnnRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874695"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:05 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 10/25] drm/i915: Add identifiers for intel color blocks
Date: Tue, 26 Nov 2024 18:57:15 +0530
Message-ID: <20241126132730.1192571-11-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

