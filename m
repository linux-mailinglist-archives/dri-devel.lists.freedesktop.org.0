Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76DB52CEFA
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CB611B11A;
	Thu, 19 May 2022 09:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594F111B115;
 Thu, 19 May 2022 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652951295; x=1684487295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NYdDdxPTxs0qimNbx4S2Te3rbwrw2uk/H/X4LmXwUAc=;
 b=OQX5pQE5aK0ofExfjoMXfEV+b6CbRXAOBiCASpRHh1qLXAiVZS0XW65V
 FZnPNmOBNFfUgDQ41A8HS7BkvjKyyEO9EuTD+VeNH7oDvpnxbbb/Fe+qu
 AkY4jj6jbk1ApziHXCCvkl8TR/6ZI8XRMLLSHaj2/OE+oDbR5/VU5syIs
 8eJkdYH+g6BkfL7HuINgD2zn/J0a5C+1UVc5tK6AbBsM5FEGW90xTYEOR
 TfacCdelEVysRrSKit6PwGndGPseY0H7kKuPSnrdhTFF7L+aJRZvvd7ik
 wiIx3+clPuiFnbTEW2+jqOntzfS/8pn5fSz4w4cdRIlRFLVdHoJl2+17P Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358511903"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="358511903"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="639699273"
Received: from wangyaqi-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.199.90])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:13 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] Revert "drm/i915: Drop has_logical_ring_elsq from device
 info"
Date: Thu, 19 May 2022 10:07:59 +0100
Message-Id: <20220519090802.1294691-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220519090802.1294691-1-tvrtko.ursulin@linux.intel.com>
References: <20220519090802.1294691-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This reverts commit b6411373d3954c8fe4617c27f90f773108b0ab03.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 3 ++-
 drivers/gpu/drm/i915/i915_pci.c          | 4 +++-
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c051b9420d2e..ba93faf3545d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1247,7 +1247,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_LOGICAL_RING_CONTEXTS(dev_priv) \
 		(INTEL_INFO(dev_priv)->has_logical_ring_contexts)
-#define HAS_LOGICAL_RING_ELSQ(dev_priv) (GRAPHICS_VER(dev_priv) >= 11)
+#define HAS_LOGICAL_RING_ELSQ(dev_priv) \
+		(INTEL_INFO(dev_priv)->has_logical_ring_elsq)
 
 #define HAS_EXECLISTS(dev_priv) HAS_LOGICAL_RING_CONTEXTS(dev_priv)
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index f8292d7b90f4..cd0b542a3a3a 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -809,7 +809,8 @@ static const struct intel_device_info cml_gt2_info = {
 	.dbuf.size = 2048, \
 	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2), \
 	.display.has_dsc = 1, \
-	.has_coherent_ggtt = false
+	.has_coherent_ggtt = false, \
+	.has_logical_ring_elsq = 1
 
 static const struct intel_device_info icl_info = {
 	GEN11_FEATURES,
@@ -996,6 +997,7 @@ static const struct intel_device_info adl_p_info = {
 	.has_global_mocs = 1, \
 	.has_llc = 1, \
 	.has_logical_ring_contexts = 1, \
+	.has_logical_ring_elsq = 1, \
 	.has_mslices = 1, \
 	.has_rps = 1, \
 	.has_runtime_pm = 1, \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index ec6d834cda09..0eaa3e0b4389 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -152,6 +152,7 @@ enum intel_ppgtt_type {
 	func(has_l3_dpf); \
 	func(has_llc); \
 	func(has_logical_ring_contexts); \
+	func(has_logical_ring_elsq); \
 	func(has_mslices); \
 	func(has_pooled_eu); \
 	func(has_pxp); \
-- 
2.32.0

