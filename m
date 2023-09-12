Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7F79CF41
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEFD10E3F1;
	Tue, 12 Sep 2023 11:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB99D10E3F4;
 Tue, 12 Sep 2023 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516825; x=1726052825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MGfx0GOMz6INcnx6B5Zl0QrJmI8j7xF3zwGm0Ai2CM=;
 b=YCAYiHEcyPfwUW/8Ebx1ydySfQXynTpyIoKlEIltMKAKTwvYzoZEv3ff
 tSa7swnYp1AvSywOjqOVlopkciu4/NpxzaWdXNw6jhkSu7r80h1QEkh2c
 RJTAKIgOuI4d3EsjSLzxmyOuHuUeuqrWWJXqJCerVyh5AN3mj7vn5+0D3
 9dxzWrnmacKICWdQU2IVDbJn4gNqAlg3+mbMOnbdCDbmDqo/c490L5tKY
 ZNI7s9b3Ap0l13HpDxnwHsPnYkH+B/vpVQduPIG+vLPV0FZrzX0Q7SqVA
 TCVXnoAh0c1p2X/PKN3s3qg45uCETf/iVsOfb+XRdoN3TPVSYnxEKdUuz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375671314"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="375671314"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="809200404"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="809200404"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/19] drm/i915/display: add I915 conditional build to
 intel_lvds.h
Date: Tue, 12 Sep 2023 14:06:29 +0300
Message-Id: <f06a88a69b7e326ff0914baca5e6a0e5f06e1867.1694514689.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_lvds.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_lvds.h b/drivers/gpu/drm/i915/display/intel_lvds.h
index 9d3372dc503f..7ad5fa9c0434 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.h
+++ b/drivers/gpu/drm/i915/display/intel_lvds.h
@@ -13,10 +13,29 @@
 enum pipe;
 struct drm_i915_private;
 
+#ifdef I915
 bool intel_lvds_port_enabled(struct drm_i915_private *dev_priv,
 			     i915_reg_t lvds_reg, enum pipe *pipe);
 void intel_lvds_init(struct drm_i915_private *dev_priv);
 struct intel_encoder *intel_get_lvds_encoder(struct drm_i915_private *dev_priv);
 bool intel_is_dual_link_lvds(struct drm_i915_private *dev_priv);
+#else
+static inline bool intel_lvds_port_enabled(struct drm_i915_private *dev_priv,
+					   i915_reg_t lvds_reg, enum pipe *pipe)
+{
+	return false;
+}
+static inline void intel_lvds_init(struct drm_i915_private *dev_priv)
+{
+}
+static inline struct intel_encoder *intel_get_lvds_encoder(struct drm_i915_private *dev_priv)
+{
+	return NULL;
+}
+static inline bool intel_is_dual_link_lvds(struct drm_i915_private *dev_priv)
+{
+	return false;
+}
+#endif
 
 #endif /* __INTEL_LVDS_H__ */
-- 
2.39.2

