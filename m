Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D948F79CF68
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C4B10E40E;
	Tue, 12 Sep 2023 11:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6124810E40C;
 Tue, 12 Sep 2023 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516902; x=1726052902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P0cElYOitY9ppHpI2d7RvgE23u/lZogtas5Ihfn5W4Y=;
 b=Vc5qEo7lxds+xNQ77pPo66OjecyL+1D9Rpts3sRq+f0G8bFThVU/bzxq
 Gy0H4TYzhi+vj1sc2PAMr4ip5GlTrF0nje0dtXiRsf+/a61O9mpErnTJR
 5yOYXiW6+8OSNaBzxc/QQjy+PEBwYDTNOIy4uqX7ahVl4cDgP3ewwPHnf
 grknS4zhPAQuc8YMBkEJu7mUMXJmlBMKUY+uADF0Df7vui61E+EsmfM3b
 htXevIQzX3bH9ViJ2RrVOFEcQHEdB3yaT4lnhSIw/i3p5jK6DkZg1Xqiv
 thRy4K/BgD6e2Bfj8GWgoCa0Ygsto3tiMrDFtnG6/bp1VRwH+UvKfmQKq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409295622"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="409295622"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743688286"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743688286"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/19] drm/i915/display: add I915 conditional build to
 i9xx_wm.h
Date: Tue, 12 Sep 2023 14:06:41 +0300
Message-Id: <bf15b14d3d060fdb256c78d4b8514d642a8958e6.1694514689.git.jani.nikula@intel.com>
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

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.h b/drivers/gpu/drm/i915/display/i9xx_wm.h
index b87ae369685a..de0920730ab2 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.h
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.h
@@ -12,9 +12,26 @@ struct drm_i915_private;
 struct intel_crtc_state;
 struct intel_plane_state;
 
+#ifdef I915
 bool ilk_disable_lp_wm(struct drm_i915_private *i915);
 void ilk_wm_sanitize(struct drm_i915_private *i915);
 bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable);
 void i9xx_wm_init(struct drm_i915_private *i915);
+#else
+static inline bool ilk_disable_lp_wm(struct drm_i915_private *i915)
+{
+	return false;
+}
+static inline void ilk_wm_sanitize(struct drm_i915_private *i915)
+{
+}
+static inline bool intel_set_memory_cxsr(struct drm_i915_private *i915, bool enable)
+{
+	return false;
+}
+static inline void i9xx_wm_init(struct drm_i915_private *i915)
+{
+}
+#endif
 
 #endif /* __I9XX_WM_H__ */
-- 
2.39.2

