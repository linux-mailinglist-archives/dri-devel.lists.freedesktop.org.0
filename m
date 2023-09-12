Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741679CF60
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787B710E405;
	Tue, 12 Sep 2023 11:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7602B10E405;
 Tue, 12 Sep 2023 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516897; x=1726052897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4XAQW1BHI2dlnaaUbv9hWIVV7GbB7gnTaTbdd1yN9G0=;
 b=LEXUXNmnJnJWUHZ38QpnMPE/H2YGhqEyuLlcLZDM3TLFauWDjbaYPVb2
 Tx8GogNo4p+M7ZIkpGY6r0SlKAGlrPk882ssShq259+407AQLL7uChWOH
 +Ar4k/C1wOXAFxknYGevgbNy5jJhzfNToPusku57o+83xFAgJ3My3jsDy
 ykf7hrD669xqfhwaEixcXtliyZ/ayoYq6BFISPy1NCD6ejeBES9ISX617
 0Vwx+jSjlICuhmnIdjqu1cz5yWrgP1XtNizzOjuplSFlNzElN4YLzU7vw
 X2G6SYWmhmMc5RAp0QZN/sNFjFQHDxbAWMa1gRLyRnIhwDiwTmIRYT5To Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409295550"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="409295550"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743688202"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743688202"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/19] drm/i915/display: add I915 conditional build to g4x_dp.h
Date: Tue, 12 Sep 2023 14:06:37 +0300
Message-Id: <ba92fc1dee1f71018179dbe10b91982c9c93e7e6.1694514689.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/g4x_dp.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.h b/drivers/gpu/drm/i915/display/g4x_dp.h
index a38b3e1e01d3..a10638ab749c 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.h
+++ b/drivers/gpu/drm/i915/display/g4x_dp.h
@@ -17,6 +17,7 @@ struct intel_crtc_state;
 struct intel_dp;
 struct intel_encoder;
 
+#ifdef I915
 const struct dpll *vlv_get_dpll(struct drm_i915_private *i915);
 enum pipe vlv_active_pipe(struct intel_dp *intel_dp);
 void g4x_dp_set_clock(struct intel_encoder *encoder,
@@ -26,5 +27,30 @@ bool g4x_dp_port_enabled(struct drm_i915_private *dev_priv,
 			 enum pipe *pipe);
 bool g4x_dp_init(struct drm_i915_private *dev_priv,
 		 i915_reg_t output_reg, enum port port);
+#else
+static inline const struct dpll *vlv_get_dpll(struct drm_i915_private *i915)
+{
+	return NULL;
+}
+static inline int vlv_active_pipe(struct intel_dp *intel_dp)
+{
+	return 0;
+}
+static inline void g4x_dp_set_clock(struct intel_encoder *encoder,
+				    struct intel_crtc_state *pipe_config)
+{
+}
+static inline bool g4x_dp_port_enabled(struct drm_i915_private *dev_priv,
+				       i915_reg_t dp_reg, int port,
+				       enum pipe *pipe)
+{
+	return false;
+}
+static inline bool g4x_dp_init(struct drm_i915_private *dev_priv,
+			       i915_reg_t output_reg, int port)
+{
+	return false;
+}
+#endif
 
 #endif
-- 
2.39.2

