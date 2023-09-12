Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0A779CF43
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC8010E3F5;
	Tue, 12 Sep 2023 11:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0458C10E3F5;
 Tue, 12 Sep 2023 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516829; x=1726052829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nf0Qsw4wCohlJTd4J1JigV87Nwbvi5a08HZffpPbinQ=;
 b=ICa2bRTPG2tIa4BeNCF0u//JaYWATAGr/Mu1FVFsJu12fvWLWLIHU2pK
 hIvwOOtiiKEPWinrL1+iChM+nU+N1iHiXlOGT9aG2g/Jys/N/0oU7k53C
 TWTulfVdypRCYSy3B3M1JQDUdVKEWG1Yl/b+ZLbyDgkY5lxSIaoWYOtV9
 UkFxvH9DmkRtfNXYg6ExSqfChQ3wqaeS9VOY0Dzaq6d4VB97Dpdaw57OT
 mrkn33V1rxfRrhOj4GldOdVvl6flQRNMPMOtUgeg7HMC8dNLYVEDAmUX+
 CH91TD2nCgk0ieDgKNHmw2PR5ZQJbaMSTzlCQ+7FlVJSkwbAwNNLhB5gL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375671324"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="375671324"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="809200436"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="809200436"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/19] drm/i915/display: add I915 conditional build to
 hsw_ips.h
Date: Tue, 12 Sep 2023 14:06:30 +0300
Message-Id: <04469b92be51b8394d74a508174f041aa7e011e8.1694514689.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/hsw_ips.h | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/hsw_ips.h b/drivers/gpu/drm/i915/display/hsw_ips.h
index 4eb83b350791..35364228e1c1 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.h
+++ b/drivers/gpu/drm/i915/display/hsw_ips.h
@@ -12,6 +12,7 @@ struct intel_atomic_state;
 struct intel_crtc;
 struct intel_crtc_state;
 
+#ifdef I915
 bool hsw_ips_disable(const struct intel_crtc_state *crtc_state);
 bool hsw_ips_pre_update(struct intel_atomic_state *state,
 			struct intel_crtc *crtc);
@@ -23,5 +24,39 @@ int hsw_ips_compute_config(struct intel_atomic_state *state,
 			   struct intel_crtc *crtc);
 void hsw_ips_get_config(struct intel_crtc_state *crtc_state);
 void hsw_ips_crtc_debugfs_add(struct intel_crtc *crtc);
+#else
+static inline bool hsw_ips_disable(const struct intel_crtc_state *crtc_state)
+{
+	return false;
+}
+static inline bool hsw_ips_pre_update(struct intel_atomic_state *state,
+				      struct intel_crtc *crtc)
+{
+	return false;
+}
+static inline void hsw_ips_post_update(struct intel_atomic_state *state,
+				       struct intel_crtc *crtc)
+{
+}
+static inline bool hsw_crtc_supports_ips(struct intel_crtc *crtc)
+{
+	return false;
+}
+static inline bool hsw_crtc_state_ips_capable(const struct intel_crtc_state *crtc_state)
+{
+	return false;
+}
+static inline int hsw_ips_compute_config(struct intel_atomic_state *state,
+					 struct intel_crtc *crtc)
+{
+	return 0;
+}
+static inline void hsw_ips_get_config(struct intel_crtc_state *crtc_state)
+{
+}
+static inline void hsw_ips_crtc_debugfs_add(struct intel_crtc *crtc)
+{
+}
+#endif
 
 #endif /* __HSW_IPS_H__ */
-- 
2.39.2

