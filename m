Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916079CF5F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1620110E408;
	Tue, 12 Sep 2023 11:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646B410E405;
 Tue, 12 Sep 2023 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516896; x=1726052896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oz1RcKvblXXPHelKKKqJMVLdd9DLgmSG1JGiEpa7cYU=;
 b=Up5pl+aZOlcJhgN1aLSHUMg7n6IZXFVLqlb3+TiG8anLQ5iRdUNlXxB6
 aDDnWLXANZf/+zqM3wFWLJL/O+BfnLJlHSGyKF2WxOtFIuzhQ8MLjePpb
 OcXqT7uKqfhcO+vpd1EQan32xHBsYazHsw0MCVoKn3GPagyTDKSoft4EO
 2PalZEg89EL5F1z5jEOLC9P4NNjWiIuwy7wAQWjlGPDAmCMQtJzyCH/ms
 TOcp7TDqcZ1/llWwfvTIhc3aI15SlC3a2L6XGDM0w8gmTExc2aJED/4WJ
 DZiquK0LnYw9FYkAhUKFmYwWI5C83DSozdtumEzmTdLyrwtWWyeZ8i0qL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442358539"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442358539"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813778579"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="813778579"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:08:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 19/19] drm/i915/display: add I915 conditional build to
 vlv_dsi_pll.h
Date: Tue, 12 Sep 2023 14:06:46 +0300
Message-Id: <930c8d332d425a54dae7af16aed26ec293f80afd.1694514689.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694514689.git.jani.nikula@intel.com>
References: <cover.1694514689.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add stubs for !I915. Not all the functions need to be stubbed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi_pll.h b/drivers/gpu/drm/i915/display/vlv_dsi_pll.h
index ab9291ad1e79..fbe5113dbeb9 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi_pll.h
+++ b/drivers/gpu/drm/i915/display/vlv_dsi_pll.h
@@ -32,7 +32,16 @@ u32 bxt_dsi_get_pclk(struct intel_encoder *encoder,
 		     struct intel_crtc_state *config);
 void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port);
 
+#ifdef I915
 void assert_dsi_pll_enabled(struct drm_i915_private *i915);
 void assert_dsi_pll_disabled(struct drm_i915_private *i915);
+#else
+static inline void assert_dsi_pll_enabled(struct drm_i915_private *i915)
+{
+}
+static inline void assert_dsi_pll_disabled(struct drm_i915_private *i915)
+{
+}
+#endif
 
 #endif /* __VLV_DSI_PLL_H__ */
-- 
2.39.2

