Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D0C52CF02
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305B188FB2;
	Thu, 19 May 2022 09:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5182011B121;
 Thu, 19 May 2022 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652951300; x=1684487300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wwP1ksR/6Ok7OZe5W/BoGiQBDHGuq8r7iW0ClAQe9cc=;
 b=O10lYcj/X0Iu8lN8RpwMkyxWLmLoGN3aWK/RhT/8eQ/Hr8HSc8eT7UPo
 zjgaOLxfdtYbJ9OJTMl+tMAvHImXmzwjp3pqe2i5IT8jFo7D3oPV+PEEo
 ZkaO5i3X0MlGuIjtrphBhTUk8rttluXJc4Krvas4n02X1uQyW+pi4cAw1
 4KFOiWq5BzQR9qB7l8Xx1DCUHS7lFrbU8KLwVxJWWVb3JhHswdP7D8xeC
 EqZ8MG4qCqPkqiMGdzX/RtVNbo69+9yzrtq29iiR7WqV8VrNLz5dFTZ5h
 vhjMSQqXl8MJUVKv2sfJCGVOSGjY7bzgVABiilOPr62ucdvhHdwCUYTHZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358511927"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="358511927"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="639699301"
Received: from wangyaqi-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.199.90])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:18 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] Revert "drm/i915: Drop has_gt_uc from device info"
Date: Thu, 19 May 2022 10:08:02 +0100
Message-Id: <20220519090802.1294691-8-tvrtko.ursulin@linux.intel.com>
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

This reverts commit 222ff6db8a0dcb86f2bb65fc8656aec635a737a6.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c    | 2 +-
 drivers/gpu/drm/i915/i915_pci.c          | 3 +++
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 3a2db27cbe1c..b389674b5210 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1356,7 +1356,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
  */
 #define HAS_FLAT_CCS(dev_priv)   (INTEL_INFO(dev_priv)->has_flat_ccs)
 
-#define HAS_GT_UC(dev_priv)	(GRAPHICS_VER(dev_priv) >= 9)
+#define HAS_GT_UC(dev_priv)	(INTEL_INFO(dev_priv)->has_gt_uc)
 
 #define HAS_POOLED_EU(dev_priv)	(INTEL_INFO(dev_priv)->has_pooled_eu)
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 5bd9cb899852..0512c66fa4f3 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -2008,7 +2008,7 @@ __i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask, u32 du
 			return ERR_PTR(-ENOMEM);
 		}
 
-		if (HAS_GT_UC(i915)) {
+		if (INTEL_INFO(i915)->has_gt_uc) {
 			error->gt->uc = gt_record_uc(error->gt, compress);
 			if (error->gt->uc) {
 				if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 938c18321ef8..07722cdf63ac 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -644,6 +644,7 @@ static const struct intel_device_info chv_info = {
 	GEN(9), \
 	GEN9_DEFAULT_PAGE_SIZES, \
 	.display.has_dmc = 1, \
+	.has_gt_uc = 1, \
 	.display.has_hdcp = 1, \
 	.display.has_ipc = 1, \
 	.display.has_psr = 1, \
@@ -704,6 +705,7 @@ static const struct intel_device_info skl_gt4_info = {
 	.has_rps = true, \
 	.display.has_dp_mst = 1, \
 	.has_logical_ring_contexts = 1, \
+	.has_gt_uc = 1, \
 	.dma_mask_size = 39, \
 	.ppgtt_type = INTEL_PPGTT_FULL, \
 	.ppgtt_size = 48, \
@@ -1006,6 +1008,7 @@ static const struct intel_device_info adl_p_info = {
 	.has_64bit_reloc = 1, \
 	.has_flat_ccs = 1, \
 	.has_global_mocs = 1, \
+	.has_gt_uc = 1, \
 	.has_llc = 1, \
 	.has_logical_ring_contexts = 1, \
 	.has_logical_ring_elsq = 1, \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index ecc3403c2aa9..09e33296157a 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -146,6 +146,7 @@ enum intel_ppgtt_type {
 	func(has_4tile); \
 	func(has_flat_ccs); \
 	func(has_global_mocs); \
+	func(has_gt_uc); \
 	func(has_heci_pxp); \
 	func(has_heci_gscfi); \
 	func(has_guc_deprivilege); \
-- 
2.32.0

