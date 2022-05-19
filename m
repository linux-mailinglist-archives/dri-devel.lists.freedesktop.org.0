Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD3952CEFD
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC1111B117;
	Thu, 19 May 2022 09:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E6411B117;
 Thu, 19 May 2022 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652951297; x=1684487297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9d/1A42OgT2gcqPn94vqCEJacWXeg5ag/Y1B8S3yO3U=;
 b=YA1G/a7d7Chgo8hAZMx45GGvPW17EO1cDjKafqhLstWShzDnGNpFARv1
 GkdTWke6xdbb1Puy2E5sAyS8hRy07RrxJ6UZVo0ZysQUP2hDuKfUFA6hy
 z14Czw2BoORefa2Z9EOaU1SK47nm1bDlNUT8Xu6ne3bKGg7zXab3THTUj
 VGi3vfA3In3oKd3uzz+KQjM2xPArvIETq3ClnFR/6GSIJC6I0EBHGWKbF
 wcHWsRLJDgeIRMNIxD5vFcM/uUXXVQumKXB4EyzjDqhCQmQ/EVJuYxJlY
 5IdfH4SKJ041wbxeIDNDkizQFYtHF7nF+GqI4jk/psM/nHHpDFso8GXLw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358511910"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="358511910"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="639699283"
Received: from wangyaqi-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.199.90])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:15 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] Revert "drm/i915: Drop has_reset_engine from device info"
Date: Thu, 19 May 2022 10:08:00 +0100
Message-Id: <20220519090802.1294691-6-tvrtko.ursulin@linux.intel.com>
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

This reverts commit 922abe4d19bd21b38298f3902674774b92a49293.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c    | 2 +-
 drivers/gpu/drm/i915/i915_pci.c          | 5 +++++
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 11bf33f1f772..a5338c3fde7a 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -699,7 +699,7 @@ bool intel_has_reset_engine(const struct intel_gt *gt)
 	if (gt->i915->params.reset < 2)
 		return false;
 
-	return GRAPHICS_VER(gt->i915) >= 7;
+	return INTEL_INFO(gt->i915)->has_reset_engine;
 }
 
 int intel_reset_guc(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index cd0b542a3a3a..542553e1be9e 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -456,6 +456,7 @@ static const struct intel_device_info snb_m_gt2_info = {
 	.has_coherent_ggtt = true, \
 	.has_llc = 1, \
 	.has_rc6p = 1, \
+	.has_reset_engine = true, \
 	.has_rps = true, \
 	.dma_mask_size = 40, \
 	.ppgtt_type = INTEL_PPGTT_ALIASING, \
@@ -513,6 +514,7 @@ static const struct intel_device_info vlv_info = {
 	.display.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B),
 	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B),
 	.has_runtime_pm = 1,
+	.has_reset_engine = true,
 	.has_rps = true,
 	.display.has_gmch = 1,
 	.display.has_hotplug = 1,
@@ -616,6 +618,7 @@ static const struct intel_device_info chv_info = {
 	.dma_mask_size = 39,
 	.ppgtt_type = INTEL_PPGTT_FULL,
 	.ppgtt_size = 32,
+	.has_reset_engine = 1,
 	.has_snoop = true,
 	.has_coherent_ggtt = false,
 	.display_mmio_offset = VLV_DISPLAY_BASE,
@@ -697,6 +700,7 @@ static const struct intel_device_info skl_gt4_info = {
 	.dma_mask_size = 39, \
 	.ppgtt_type = INTEL_PPGTT_FULL, \
 	.ppgtt_size = 48, \
+	.has_reset_engine = 1, \
 	.has_snoop = true, \
 	.has_coherent_ggtt = false, \
 	.display.has_ipc = 1, \
@@ -999,6 +1003,7 @@ static const struct intel_device_info adl_p_info = {
 	.has_logical_ring_contexts = 1, \
 	.has_logical_ring_elsq = 1, \
 	.has_mslices = 1, \
+	.has_reset_engine = 1, \
 	.has_rps = 1, \
 	.has_runtime_pm = 1, \
 	.ppgtt_size = 48, \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 0eaa3e0b4389..991ed8f304b5 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -142,6 +142,7 @@ enum intel_ppgtt_type {
 	func(has_64k_pages); \
 	func(needs_compact_pt); \
 	func(gpu_reset_clobbers_display); \
+	func(has_reset_engine); \
 	func(has_4tile); \
 	func(has_flat_ccs); \
 	func(has_global_mocs); \
-- 
2.32.0

