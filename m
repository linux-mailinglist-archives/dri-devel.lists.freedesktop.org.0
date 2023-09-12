Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C629579CF6D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB48710E3FD;
	Tue, 12 Sep 2023 11:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDAC10E3FD;
 Tue, 12 Sep 2023 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516927; x=1726052927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rPCdIxqGsqJNXINHrxSR54PoT6U/948h0IaXHU3bho=;
 b=JhpGKTGhnmPnS68PWHEwRmnpTdl6eNLgBeUQakWo2ixU90YkvENK/GT4
 ymYlw/T/+wPhN5EOwWrXMQeQNCic2gWj/kDMuE5pajflyaRPvVarrMgTe
 vJhPlOC3CZNQbBcaK2EE07AYuchvuPNu54kc2l0L/aBU2XXp0eetJNjp4
 cPbiC9str8Sut+fS/jhaEWwsxXVrwpBMrwrFgG0+xTG0U48hFJNlGzogQ
 2aKv1hw9CwrYj7o+AJ2o0iYl8x8o+zgAyPGW4ejktCY6p4OUkU4Q9KP0S
 cuNqKDCqjuKWcT0mGO/6qT/j+YIzKLrtcPeIHShgLI6ljv1HZHgVCIIhX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378253111"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="378253111"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074512697"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="1074512697"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/19] drm/i915/display: add I915 conditional build to
 vlv_dsi.h
Date: Tue, 12 Sep 2023 14:06:40 +0300
Message-Id: <9f538824f15096b0c1444ee50d175a0a22d7bd5e.1694514689.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/vlv_dsi.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.h b/drivers/gpu/drm/i915/display/vlv_dsi.h
index 0c2b279df9d4..cf9d7b82f288 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.h
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.h
@@ -12,8 +12,21 @@ enum port;
 struct drm_i915_private;
 struct intel_dsi;
 
+#ifdef I915
 void vlv_dsi_wait_for_fifo_empty(struct intel_dsi *intel_dsi, enum port port);
 enum mipi_dsi_pixel_format pixel_format_from_register_bits(u32 fmt);
 void vlv_dsi_init(struct drm_i915_private *dev_priv);
+#else
+static inline void vlv_dsi_wait_for_fifo_empty(struct intel_dsi *intel_dsi, enum port port)
+{
+}
+static inline enum mipi_dsi_pixel_format pixel_format_from_register_bits(u32 fmt)
+{
+	return 0;
+}
+static inline void vlv_dsi_init(struct drm_i915_private *dev_priv)
+{
+}
+#endif
 
 #endif /* __VLV_DSI_H__ */
-- 
2.39.2

