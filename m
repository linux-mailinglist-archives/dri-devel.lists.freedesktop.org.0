Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F22379CF72
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F57210E411;
	Tue, 12 Sep 2023 11:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD9610E409;
 Tue, 12 Sep 2023 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516929; x=1726052929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+WJEg9s/ERPz9aqCZSeJAqjV1Oo9uT8a6MSiIwmXkYE=;
 b=iEliIzTRewdxq0YFMzl31u2CYRfOg/6sfjZy9hIvXk8rDBlbWYPAZ0gp
 8+wuajQytlt+OgZuwSClTMUyoqkYi4fNvV+vfFFyvo6gt0N9y7Ocw1zC7
 QGOAHsM0JRtRkqT/RkSq9MQCQdyHclO8s1R9aap9/ruNZITmUpObe7xWV
 s3rn9yMnPdNWP+oZHC86aVPcHSkcqF83zGlE8+hbo5gq2zomODWT+tpla
 Sd4UEUL2IaWomu6oGR2Bcms1n79smuUILa53hDg2WX7jiNEBjvdugdTzP
 r0bt75bb3r5B0dM/pTVk5lLlnxrO006ELkZy6UYcJEw4vEupNFMzeiuHA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378253136"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="378253136"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074512713"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="1074512713"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 15/19] drm/i915/display: add I915 conditional build to
 g4x_hdmi.h
Date: Tue, 12 Sep 2023 14:06:42 +0300
Message-Id: <ba2eea7ac081d0858a573062f197e00f3b186faf.1694514689.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/g4x_hdmi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/g4x_hdmi.h b/drivers/gpu/drm/i915/display/g4x_hdmi.h
index 1e3ea7f3c846..817f55c7a3a1 100644
--- a/drivers/gpu/drm/i915/display/g4x_hdmi.h
+++ b/drivers/gpu/drm/i915/display/g4x_hdmi.h
@@ -15,9 +15,21 @@ struct drm_atomic_state;
 struct drm_connector;
 struct drm_i915_private;
 
+#ifdef I915
 void g4x_hdmi_init(struct drm_i915_private *dev_priv,
 		   i915_reg_t hdmi_reg, enum port port);
 int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
 				    struct drm_atomic_state *state);
+#else
+static inline void g4x_hdmi_init(struct drm_i915_private *dev_priv,
+				 i915_reg_t hdmi_reg, int port)
+{
+}
+static inline int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
+						  struct drm_atomic_state *state)
+{
+	return 0;
+}
+#endif
 
 #endif
-- 
2.39.2

