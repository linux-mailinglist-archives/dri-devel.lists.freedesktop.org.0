Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0079CF65
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D764110E3F8;
	Tue, 12 Sep 2023 11:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1759310E40A;
 Tue, 12 Sep 2023 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516900; x=1726052900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FVAh4On5XdvV9iSCLEiakjacIZp6jEqoSMEB6aLwj64=;
 b=g+ut6h3hUzLcJ+hdA7nA/ehL9gg4X/hEq0+4FuE9NbqgBEpkD0r6DRlo
 QVIyjmNii443s56F4EuYgdxlS1tPAl26r9aALJCqaLGTqyYB8/T1wwnJL
 sYfXopFJ+BTZk0eoMucD+7Eekg3tmhuZzvDlUceQK/+Kkef68OviTrSY1
 MkQe2demf4iDfb5mMfUzSRRbYOIFxpx2Ev6J8K3hVSumWdfHJkmxZPnOu
 pFFtlsXroKqjsI2hC10NdDqFLVB3SRJAXqD5m1TMAztaMOVGmXVHzqWfZ
 Asy7DBx8i9nXSFUxhFG+nfyVMAKeHURoQEx8StZwO/5p1g8m2iEbyh/no Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409295586"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="409295586"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743688248"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743688248"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/19] drm/i915/display: add I915 conditional build to
 intel_crt.h
Date: Tue, 12 Sep 2023 14:06:39 +0300
Message-Id: <89a6daca98f87ed1a8a54367a977f146216330d2.1694514689.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_crt.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.h b/drivers/gpu/drm/i915/display/intel_crt.h
index c6071efd93ce..fe7690c2b948 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.h
+++ b/drivers/gpu/drm/i915/display/intel_crt.h
@@ -12,9 +12,23 @@ enum pipe;
 struct drm_encoder;
 struct drm_i915_private;
 
+#ifdef I915
 bool intel_crt_port_enabled(struct drm_i915_private *dev_priv,
 			    i915_reg_t adpa_reg, enum pipe *pipe);
 void intel_crt_init(struct drm_i915_private *dev_priv);
 void intel_crt_reset(struct drm_encoder *encoder);
+#else
+static inline bool intel_crt_port_enabled(struct drm_i915_private *dev_priv,
+					  i915_reg_t adpa_reg, enum pipe *pipe)
+{
+	return false;
+}
+static inline void intel_crt_init(struct drm_i915_private *dev_priv)
+{
+}
+static inline void intel_crt_reset(struct drm_encoder *encoder)
+{
+}
+#endif
 
 #endif /* __INTEL_CRT_H__ */
-- 
2.39.2

