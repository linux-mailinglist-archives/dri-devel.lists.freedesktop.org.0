Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDF652CEF8
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2F311B114;
	Thu, 19 May 2022 09:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B94811B10D;
 Thu, 19 May 2022 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652951292; x=1684487292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KCR7qtfpF2xl6X9Vw4TSaKpuBRSCpvrkzS+IxLqnmQc=;
 b=mvdTEuHZxd2PylCfo6VLJnjxSdn7bMpoRr+gYlSkVicbrRgkwebflWvd
 hJbD5C5wxObhKhIR2p4inGp47ezJsL/hyhgtpzCW09EjWBxpd7HwJIheA
 MizALwuiV6RvlX9DPt1IbF2OlAy9BVH1zRMIcYwQ6kXFFjbJ+FJ9BHooT
 WNeGCIS+1eX1R/RJyyxFjwcH3F0eeu8145ZgL67Lyr/LQyXqeFHk8RyYt
 lUUxwgAAZxtVk8XQkBTIltHQmVCUkebmFor7EeXjUByTJvjUZnt0R4HbZ
 WdHmXf5IqHeUhY8mKUAcn9NSMYvZKAfH1OKylDw/rgW+HI7d/dadNN24Y w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358511890"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="358511890"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="639699264"
Received: from wangyaqi-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.199.90])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:10 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] Revert "drm/i915: Drop has_dp_mst from device info"
Date: Thu, 19 May 2022 10:07:57 +0100
Message-Id: <20220519090802.1294691-3-tvrtko.ursulin@linux.intel.com>
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

This reverts commit eb86f645ab9b90c47de7ebe229feae7ac999421b.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 2 +-
 drivers/gpu/drm/i915/i915_pci.c          | 3 +++
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index f4d070d2803c..7c25602b4e50 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1295,13 +1295,13 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_IPS(dev_priv)	(IS_HSW_ULT(dev_priv) || IS_BROADWELL(dev_priv))
 
+#define HAS_DP_MST(dev_priv)	(INTEL_INFO(dev_priv)->display.has_dp_mst)
 #define HAS_DP20(dev_priv)	(IS_DG2(dev_priv))
 
 #define HAS_CDCLK_CRAWL(dev_priv)	 (INTEL_INFO(dev_priv)->display.has_cdclk_crawl)
 #define HAS_DDI(dev_priv)		 (DISPLAY_VER(dev_priv) >= 9 || \
 					  IS_BROADWELL(dev_priv) || \
 					  IS_HASWELL(dev_priv))
-#define HAS_DP_MST(dev_priv)		 (HAS_DDI(dev_priv))
 #define HAS_FPGA_DBG_UNCLAIMED(dev_priv) (INTEL_INFO(dev_priv)->display.has_fpga_dbg)
 #define HAS_PSR(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_psr)
 #define HAS_PSR_HW_TRACKING(dev_priv) \
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index b00f2ddb5de6..5eaec25b5489 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -536,6 +536,7 @@ static const struct intel_device_info vlv_info = {
 	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP), \
 	.display.has_fpga_dbg = 1, \
+	.display.has_dp_mst = 1, \
 	.has_rc6p = 0 /* RC6p removed-by HSW */, \
 	HSW_PIPE_OFFSETS, \
 	.has_runtime_pm = 1
@@ -689,6 +690,7 @@ static const struct intel_device_info skl_gt4_info = {
 	.has_runtime_pm = 1, \
 	.display.has_dmc = 1, \
 	.has_rps = true, \
+	.display.has_dp_mst = 1, \
 	.has_logical_ring_contexts = 1, \
 	.dma_mask_size = 39, \
 	.ppgtt_type = INTEL_PPGTT_FULL, \
@@ -929,6 +931,7 @@ static const struct intel_device_info adl_s_info = {
 	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2) | BIT(DBUF_S3) |		\
 		BIT(DBUF_S4),							\
 	.display.has_dmc = 1,							\
+	.display.has_dp_mst = 1,						\
 	.display.has_dsb = 1,							\
 	.display.has_dsc = 1,							\
 	.display.fbc_mask = BIT(INTEL_FBC_A),					\
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index f698e7b18640..71e528b7e9e8 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -168,6 +168,7 @@ enum intel_ppgtt_type {
 	func(cursor_needs_physical); \
 	func(has_cdclk_crawl); \
 	func(has_dmc); \
+	func(has_dp_mst); \
 	func(has_dsb); \
 	func(has_dsc); \
 	func(has_fpga_dbg); \
-- 
2.32.0

