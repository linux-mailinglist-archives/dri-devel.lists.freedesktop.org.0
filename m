Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 765A752CF00
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A9111B120;
	Thu, 19 May 2022 09:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9646B11B11B;
 Thu, 19 May 2022 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652951298; x=1684487298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hmNBCtYD/Gr1g+nUAY3Jz1UJUczMFtXfPDqrZuDzssE=;
 b=RDwSfc5Vs85aAUcGyLJbDP1VOE47Osg0e3hZRYMIbnQ8fH2TNQXJa6QQ
 ybvKYGDkOl6tfUYH3QJ2sP/nVPkZtaqK6h8Gi10FCDmeYkQjzB8/1davk
 oh+SBUz2GxU9owR5uuhR0RDUdReRY2vwt5taZMK2m8CQP60UqMiEddodw
 dBF6xUjvFU5MiktD7q1ODjuszEfdgW87jlyDjdlFSYFonSD8bURWuIP31
 jqrhOL5kn6nAfDqzIfyc2jQvKibILWAh7tJyqONMy448yOxwieFgOqjqh
 F1w4HmvK0UmTGAsog9Ap5Ez1XQZzhe7Dte0VxHWBrD9PDQsQ7++rUQJV0 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358511915"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="358511915"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="639699294"
Received: from wangyaqi-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.199.90])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:17 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] Revert "drm/i915: Drop has_rc6 from device info"
Date: Thu, 19 May 2022 10:08:01 +0100
Message-Id: <20220519090802.1294691-7-tvrtko.ursulin@linux.intel.com>
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

This reverts commit 218076abbcd647de46635d21331a34b814f90906.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 3 +--
 drivers/gpu/drm/i915/i915_pci.c          | 8 ++++++++
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index ba93faf3545d..3a2db27cbe1c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1308,8 +1308,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_PSR2_SEL_FETCH(dev_priv)	 (DISPLAY_VER(dev_priv) >= 12)
 #define HAS_TRANSCODER(dev_priv, trans)	 ((INTEL_INFO(dev_priv)->display.cpu_transcoder_mask & BIT(trans)) != 0)
 
-/* ilk does support rc6, but we do not implement [power] contexts */
-#define HAS_RC6(dev_priv)		 (GRAPHICS_VER(dev_priv) >= 6)
+#define HAS_RC6(dev_priv)		 (INTEL_INFO(dev_priv)->has_rc6)
 #define HAS_RC6p(dev_priv)		 (INTEL_INFO(dev_priv)->has_rc6p)
 #define HAS_RC6pp(dev_priv)		 (false) /* HW was never validated */
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 542553e1be9e..938c18321ef8 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -376,6 +376,8 @@ static const struct intel_device_info gm45_info = {
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0), \
 	.has_snoop = true, \
 	.has_coherent_ggtt = true, \
+	/* ilk does support rc6, but we do not implement [power] contexts */ \
+	.has_rc6 = 0, \
 	.dma_mask_size = 36, \
 	I9XX_PIPE_OFFSETS, \
 	I9XX_CURSOR_OFFSETS, \
@@ -405,6 +407,7 @@ static const struct intel_device_info ilk_m_info = {
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0), \
 	.has_coherent_ggtt = true, \
 	.has_llc = 1, \
+	.has_rc6 = 1, \
 	.has_rc6p = 1, \
 	.has_rps = true, \
 	.dma_mask_size = 40, \
@@ -455,6 +458,7 @@ static const struct intel_device_info snb_m_gt2_info = {
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0), \
 	.has_coherent_ggtt = true, \
 	.has_llc = 1, \
+	.has_rc6 = 1, \
 	.has_rc6p = 1, \
 	.has_reset_engine = true, \
 	.has_rps = true, \
@@ -514,6 +518,7 @@ static const struct intel_device_info vlv_info = {
 	.display.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B),
 	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B),
 	.has_runtime_pm = 1,
+	.has_rc6 = 1,
 	.has_reset_engine = true,
 	.has_rps = true,
 	.display.has_gmch = 1,
@@ -612,6 +617,7 @@ static const struct intel_device_info chv_info = {
 	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0) | BIT(VECS0),
 	.has_64bit_reloc = 1,
 	.has_runtime_pm = 1,
+	.has_rc6 = 1,
 	.has_rps = true,
 	.has_logical_ring_contexts = 1,
 	.display.has_gmch = 1,
@@ -694,6 +700,7 @@ static const struct intel_device_info skl_gt4_info = {
 	.display.has_psr_hw_tracking = 1, \
 	.has_runtime_pm = 1, \
 	.display.has_dmc = 1, \
+	.has_rc6 = 1, \
 	.has_rps = true, \
 	.display.has_dp_mst = 1, \
 	.has_logical_ring_contexts = 1, \
@@ -1003,6 +1010,7 @@ static const struct intel_device_info adl_p_info = {
 	.has_logical_ring_contexts = 1, \
 	.has_logical_ring_elsq = 1, \
 	.has_mslices = 1, \
+	.has_rc6 = 1, \
 	.has_reset_engine = 1, \
 	.has_rps = 1, \
 	.has_runtime_pm = 1, \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 991ed8f304b5..ecc3403c2aa9 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -157,6 +157,7 @@ enum intel_ppgtt_type {
 	func(has_mslices); \
 	func(has_pooled_eu); \
 	func(has_pxp); \
+	func(has_rc6); \
 	func(has_rc6p); \
 	func(has_rps); \
 	func(has_runtime_pm); \
-- 
2.32.0

