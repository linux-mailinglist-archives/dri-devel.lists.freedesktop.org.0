Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CFC79CF5E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A62710E407;
	Tue, 12 Sep 2023 11:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6422410E404;
 Tue, 12 Sep 2023 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516895; x=1726052895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uOO2PgFugq5SunLhIgn8wopturCtoXlIy0pYUjPimvs=;
 b=eupH0F6C/9ZJrevnNy9wjUU0ya5Kq+fKVN/CBB5BOQ8SVcEnX3IFQHQl
 HzzFQMfGxrf6aksCRI5XxkCYrHP0SvkmTRfDdw5rZ8p5sQBpBY2utiDio
 6O8dEGo283RuiCS/IIWFzkln4m0gt3yk1aas0N744rdh/MuhUk/UWU04W
 yuC9O38GAd1WXVMzM1O2PFW/1S3sWXgZ4VBtQ3NuGEwDpgJzLNhAd+ewr
 hSaMLaOk93PzemHbzTpzwNkDPVYb1RFVFjOp3OERRTezIgLCv+iXc1SAC
 ciabPySVHAZoeFuDJHE9VLT4omwAwLtb3Eg9IA+no/vShAN81Q+0w4DYB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409295514"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="409295514"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743688160"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743688160"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:07:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/19] drm/i915/display: add I915 conditional build to
 intel_overlay.h
Date: Tue, 12 Sep 2023 14:06:36 +0300
Message-Id: <45a127d37816ac97dfe493beeed060e323047014.1694514689.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_overlay.h | 35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.h b/drivers/gpu/drm/i915/display/intel_overlay.h
index a167c28acd27..c3f68fce6f08 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.h
+++ b/drivers/gpu/drm/i915/display/intel_overlay.h
@@ -13,6 +13,7 @@ struct drm_i915_private;
 struct intel_overlay;
 struct intel_overlay_error_state;
 
+#ifdef I915
 void intel_overlay_setup(struct drm_i915_private *dev_priv);
 void intel_overlay_cleanup(struct drm_i915_private *dev_priv);
 int intel_overlay_switch_off(struct intel_overlay *overlay);
@@ -25,5 +26,39 @@ struct intel_overlay_error_state *
 intel_overlay_capture_error_state(struct drm_i915_private *dev_priv);
 void intel_overlay_print_error_state(struct drm_i915_error_state_buf *e,
 				     struct intel_overlay_error_state *error);
+#else
+static inline void intel_overlay_setup(struct drm_i915_private *dev_priv)
+{
+}
+static inline void intel_overlay_cleanup(struct drm_i915_private *dev_priv)
+{
+}
+static inline int intel_overlay_switch_off(struct intel_overlay *overlay)
+{
+	return 0;
+}
+static inline int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
+				  struct drm_file *file_priv)
+{
+	return 0;
+}
+static inline int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
+					    struct drm_file *file_priv)
+{
+	return 0;
+}
+static inline void intel_overlay_reset(struct drm_i915_private *dev_priv)
+{
+}
+static inline struct intel_overlay_error_state *
+intel_overlay_capture_error_state(struct drm_i915_private *dev_priv)
+{
+	return NULL;
+}
+static inline void intel_overlay_print_error_state(struct drm_i915_error_state_buf *e,
+						   struct intel_overlay_error_state *error)
+{
+}
+#endif
 
 #endif /* __INTEL_OVERLAY_H__ */
-- 
2.39.2

