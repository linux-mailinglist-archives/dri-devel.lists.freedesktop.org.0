Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A9452CEF9
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2DC11B116;
	Thu, 19 May 2022 09:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C4D11B10A;
 Thu, 19 May 2022 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652951290; x=1684487290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhF7MjXaZDK9apCEYmjWvGn+ChV7x/2RNlpB+5XmbBs=;
 b=NxzavgkM5K3IE6dX98CrZ0qpne+gYNI/8T5CzRccqFJFyIH2KSN6xhWN
 bcvBYwv+O2fFpR6G0CGf+gsbShUNnwCYS7BZ+Gs/2XBSL7MfJYhYNSq5Q
 QdAHI6UuKaGCeAdXUV+XP3NtAFptKCiwCOEvyPDEMTe3ArPCNwncdBy2G
 2MGDOH+BnRLRxAeogpnwepvxmrZvnVbn3L8rfbtzdZf69gTNxOWijrOmE
 NBnBaTmGOGUCy4bOLGGpsUGLYPJP4cHw/qpCZ2R7jDUqNju2t8dVU7lly
 uYRcyJ2vVxmpQ/+GJUtZj5tLT9W+LU2rBtczN80WAl7l9sTufhYZi8TX3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358511884"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="358511884"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="639699258"
Received: from wangyaqi-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.199.90])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:09 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] Revert "drm/i915: Drop has_psr from device info"
Date: Thu, 19 May 2022 10:07:56 +0100
Message-Id: <20220519090802.1294691-2-tvrtko.ursulin@linux.intel.com>
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

This reverts commit b15a7357a84f091fde8ce35bf2fd494150ad4bd0.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 2 +-
 drivers/gpu/drm/i915/i915_pci.c          | 3 +++
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 10f273800645..f4d070d2803c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1303,7 +1303,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 					  IS_HASWELL(dev_priv))
 #define HAS_DP_MST(dev_priv)		 (HAS_DDI(dev_priv))
 #define HAS_FPGA_DBG_UNCLAIMED(dev_priv) (INTEL_INFO(dev_priv)->display.has_fpga_dbg)
-#define HAS_PSR(dev_priv)		 (DISPLAY_VER(dev_priv) >= 9)
+#define HAS_PSR(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_psr)
 #define HAS_PSR_HW_TRACKING(dev_priv) \
 	(INTEL_INFO(dev_priv)->display.has_psr_hw_tracking)
 #define HAS_PSR2_SEL_FETCH(dev_priv)	 (DISPLAY_VER(dev_priv) >= 12)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index d8d893bafa51..b00f2ddb5de6 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -635,6 +635,7 @@ static const struct intel_device_info chv_info = {
 	.display.has_dmc = 1, \
 	.display.has_hdcp = 1, \
 	.display.has_ipc = 1, \
+	.display.has_psr = 1, \
 	.display.has_psr_hw_tracking = 1, \
 	.dbuf.size = 896 - 4, /* 4 blocks for bypass path allocation */ \
 	.dbuf.slice_mask = BIT(DBUF_S1)
@@ -683,6 +684,7 @@ static const struct intel_device_info skl_gt4_info = {
 	.display.has_fpga_dbg = 1, \
 	.display.fbc_mask = BIT(INTEL_FBC_A), \
 	.display.has_hdcp = 1, \
+	.display.has_psr = 1, \
 	.display.has_psr_hw_tracking = 1, \
 	.has_runtime_pm = 1, \
 	.display.has_dmc = 1, \
@@ -934,6 +936,7 @@ static const struct intel_device_info adl_s_info = {
 	.display.has_hdcp = 1,							\
 	.display.has_hotplug = 1,						\
 	.display.has_ipc = 1,							\
+	.display.has_psr = 1,							\
 	.display.ver = 13,							\
 	.display.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),	\
 	.pipe_offsets = {							\
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 60fc35ae81df..f698e7b18640 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -178,6 +178,7 @@ enum intel_ppgtt_type {
 	func(has_ipc); \
 	func(has_modular_fia); \
 	func(has_overlay); \
+	func(has_psr); \
 	func(has_psr_hw_tracking); \
 	func(overlay_needs_physical); \
 	func(supports_tv);
-- 
2.32.0

