Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5CB516A67
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 07:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE5A10FF03;
	Mon,  2 May 2022 05:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6484110FF03;
 Mon,  2 May 2022 05:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651470175; x=1683006175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uC08SyD/FbB/UHchFEIwG08FyHsijYYW/t66o8Pb0jU=;
 b=FXRsRPG+31Yuh3pCHizkNEtaNl/LSKA0hxX4aYHNG4BxJS4Qcc0EwBzE
 x7zsVzLfhgp+RMKIMgSrT+/eKs+NMM3TP2NTWNOEjiG5j5Sb4owWVqLNt
 ZKxr/VI2vi/TwMP0WboDq9Q3xWfHfhrU7FTJGLUVFdKs2e2up12Sn0a/2
 DQraZnK1ax/h2YeGs2PTKWLiKvPBaOuIr+cdKIhVAqPL+wGG/mWvIt5sJ
 eYDafxnWe7UvbYjO8zg6ox22SarzrQxd8RWBKuR6uiudUkEqN7PIZDk5M
 +ktv7J7mfzWAXfhtqzuKN93g48YXWs0AzeruvzWCsVWdYIgBXpuSNcOyM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="330111155"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="330111155"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 22:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="619750880"
Received: from kandpal.iind.intel.com ([10.190.239.32])
 by fmsmga008.fm.intel.com with ESMTP; 01 May 2022 22:42:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Define WD trancoder for i915
Date: Mon,  2 May 2022 11:12:18 +0530
Message-Id: <20220502054219.2083162-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502054219.2083162-1-suraj.kandpal@intel.com>
References: <20220502054219.2083162-1-suraj.kandpal@intel.com>
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
Cc: jani.nikula@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 uma.shankar@intel.com, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding WD Types, WD transcoder to enum list and WD Transcoder offsets

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.h       | 6 ++++++
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
 drivers/gpu/drm/i915/i915_reg.h                    | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 187910d94ec6..62dc26b3bf76 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -119,6 +119,8 @@ enum transcoder {
 	TRANSCODER_DSI_1,
 	TRANSCODER_DSI_A = TRANSCODER_DSI_0,	/* legacy DSI */
 	TRANSCODER_DSI_C = TRANSCODER_DSI_1,	/* legacy DSI */
+	TRANSCODER_WD_0,
+	TRANSCODER_WD_1,
 
 	I915_MAX_TRANSCODERS
 };
@@ -140,6 +142,10 @@ static inline const char *transcoder_name(enum transcoder transcoder)
 		return "DSI A";
 	case TRANSCODER_DSI_C:
 		return "DSI C";
+	case TRANSCODER_WD_0:
+		return "WD 0";
+	case TRANSCODER_WD_1:
+		return "WD 1";
 	default:
 		return "<invalid>";
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c4ccb03424f1..be47f7ba592c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -79,6 +79,7 @@ enum intel_output_type {
 	INTEL_OUTPUT_DSI = 9,
 	INTEL_OUTPUT_DDI = 10,
 	INTEL_OUTPUT_DP_MST = 11,
+	INTEL_OUTPUT_WD = 12,
 };
 
 enum hdmi_force_audio {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9ccb67eec1bd..e9f6301a6394 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2044,6 +2044,8 @@
 #define TRANSCODER_EDP_OFFSET 0x6f000
 #define TRANSCODER_DSI0_OFFSET	0x6b000
 #define TRANSCODER_DSI1_OFFSET	0x6b800
+#define TRANSCODER_WD0_OFFSET	0x6e000
+#define TRANSCODER_WD1_OFFSET	0x6e800
 
 #define HTOTAL(trans)		_MMIO_TRANS2(trans, _HTOTAL_A)
 #define HBLANK(trans)		_MMIO_TRANS2(trans, _HBLANK_A)
-- 
2.35.1

