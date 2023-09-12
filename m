Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2756379CF53
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CF210E3FB;
	Tue, 12 Sep 2023 11:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9070310E3FE;
 Tue, 12 Sep 2023 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516860; x=1726052860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eR6U3wGrUl9y3C/W8ue69z+jLpseWEDAt7uM6TWxig4=;
 b=Jr4Hqt7/BzVTlMJgzWkEJSxqgW0MtcQMnbuOSFSdMm0I+MWTxEzDECH8
 Pz3aBJwspVJWgt7JvFcYIzokOxsarKVl4SaLRXd2msOswYvwon1V2KtNr
 T/ed/4ruDj4/hgBUnUQvZwCf4LTK5zGM9Elq9H3np2ShHhD8P+SJv5ucf
 14W0Vwmt2mkQ2OFLSS47yHwCRaTjgJ59Mt3bpphdtjSal/CPnNOre/qfa
 qsWLJTMUdjOhgzYm8UIxCiEPoXcQYVi5QzTUuB/iAeVQBovr1lEscq8o5
 uPCorbuOWWvO8WgvIKF8IpVwf30DRS7xGzGy5Fc/C2LJs6Gi3DgykZBCk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375671481"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="375671481"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="809200624"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="809200624"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/19] drm/i915/display: add I915 conditional build to
 intel_pch_display.h
Date: Tue, 12 Sep 2023 14:06:34 +0300
Message-Id: <02de0089de58c9fb19b6b56121f6c917f51b4561.1694514689.git.jani.nikula@intel.com>
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
 .../gpu/drm/i915/display/intel_pch_display.h  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_pch_display.h b/drivers/gpu/drm/i915/display/intel_pch_display.h
index 41a63413cb3d..35f8288af3d1 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_display.h
+++ b/drivers/gpu/drm/i915/display/intel_pch_display.h
@@ -15,6 +15,7 @@ struct intel_crtc;
 struct intel_crtc_state;
 struct intel_link_m_n;
 
+#ifdef I915
 bool intel_has_pch_trancoder(struct drm_i915_private *i915,
 			     enum pipe pch_transcoder);
 enum pipe intel_crtc_pch_transcoder(struct intel_crtc *crtc);
@@ -41,5 +42,57 @@ void intel_pch_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    struct intel_link_m_n *m_n);
 
 void intel_pch_sanitize(struct drm_i915_private *i915);
+#else
+static inline bool intel_has_pch_trancoder(struct drm_i915_private *i915,
+					   enum pipe pch_transcoder)
+{
+	return false;
+}
+static inline int intel_crtc_pch_transcoder(struct intel_crtc *crtc)
+{
+	return 0;
+}
+static inline void ilk_pch_pre_enable(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc)
+{
+}
+static inline void ilk_pch_enable(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc)
+{
+}
+static inline void ilk_pch_disable(struct intel_atomic_state *state,
+				   struct intel_crtc *crtc)
+{
+}
+static inline void ilk_pch_post_disable(struct intel_atomic_state *state,
+					struct intel_crtc *crtc)
+{
+}
+static inline void ilk_pch_get_config(struct intel_crtc_state *crtc_state)
+{
+}
+static inline void lpt_pch_enable(struct intel_atomic_state *state,
+				  struct intel_crtc *crtc)
+{
+}
+static inline void lpt_pch_disable(struct intel_atomic_state *state,
+				   struct intel_crtc *crtc)
+{
+}
+static inline void lpt_pch_get_config(struct intel_crtc_state *crtc_state)
+{
+}
+static inline void intel_pch_transcoder_get_m1_n1(struct intel_crtc *crtc,
+						  struct intel_link_m_n *m_n)
+{
+}
+static inline void intel_pch_transcoder_get_m2_n2(struct intel_crtc *crtc,
+						  struct intel_link_m_n *m_n)
+{
+}
+static inline void intel_pch_sanitize(struct drm_i915_private *i915)
+{
+}
+#endif
 
 #endif
-- 
2.39.2

