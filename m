Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D979CF58
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E92610E402;
	Tue, 12 Sep 2023 11:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597AF10E401;
 Tue, 12 Sep 2023 11:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516886; x=1726052886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kY6B/GS+/qj8YYnxQ5H5gwfoRUVrD29brphio3IGgUE=;
 b=epZznVKM+SSsh2uSuTfzGBxwUbxC/+aVa3KLGhM9+0C/JSHNpeOmRXLU
 MGtHxIEIYBJh7xq8gpi2UZc2UBZIcFD1st6WVeJhex2aqKlaiJvhjek2i
 cmVICH92uJ6AoBbrCkwKi9akCb3zCu3MqOyuERLbpFHERQIKEPn8S+FSa
 sHfjrFLSvVvkQ6Rw7hOd1tkGHHqDnRK5suwGNShAJhU8gti7G4h25Cxpk
 mV5S0KIRCJ1zfWrBHB0ps5MTamshXpyrOXSP+41F/TIhjzQs56GBMPqf8
 P06dxKzg4BKM7zp9vxfCO8LsmXaxrIOTrpkOELLQ2aHgJRxfxufYx7nwV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442358488"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442358488"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="737090718"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="737090718"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:08:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 16/19] drm/i915/display: add I915 conditional build to
 intel_dvo.h
Date: Tue, 12 Sep 2023 14:06:43 +0300
Message-Id: <d43b27742297083b37d52222c4bb72b062ef4967.1694514689.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_dvo.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dvo.h b/drivers/gpu/drm/i915/display/intel_dvo.h
index 3ed0fdf8efff..bf7a356422ab 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.h
+++ b/drivers/gpu/drm/i915/display/intel_dvo.h
@@ -8,6 +8,12 @@
 
 struct drm_i915_private;
 
+#ifdef I915
 void intel_dvo_init(struct drm_i915_private *dev_priv);
+#else
+static inline void intel_dvo_init(struct drm_i915_private *dev_priv)
+{
+}
+#endif
 
 #endif /* __INTEL_DVO_H__ */
-- 
2.39.2

