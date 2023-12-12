Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E780ED73
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536DD10E1F4;
	Tue, 12 Dec 2023 13:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4929610E1B5;
 Tue, 12 Dec 2023 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702387564; x=1733923564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eJNTm1WfbFuaQeej5dzgOSuNaQzmTL36M6ZWScZJKm4=;
 b=ejUvDLYmp7/8rp6BYhOITkSZxH/0c0c42pJwL8SjzGSiWzyhksLwmlod
 9t7hVJANAlCXDDATlqgMoec6xQqmqXcCWRlQBYWB2SqSL41eUujdBeX8m
 8TOz/aboiV1pu/9bZYbEPl00Mi7K2ykSk9iqPJyZtqeg0ZSOtBygCQkcO
 53wiLS/iT81+xiKVBtQK3LnigLcauxPYtrcFDfPhebb9UUlzhDvLBXk85
 mNTv3g8KbaMijijLltmp9DLCAiH7JhsKFfmQADS0VVI1Q9i0lnoo3LS8m
 eh37LWBBCVE0b9DSs/RjqH3d4JAx3l2jcPQhuSMnvWNr7ntZ80JicDbpc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="459121061"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="459121061"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946757989"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="946757989"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:26:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/edid: replace __attribute__((packed)) with __packed
Date: Tue, 12 Dec 2023 15:25:56 +0200
Message-Id: <20231212132557.3777281-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__packed is preferred over __attribute__((packed)).

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_edid.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 518d1b8106c7..54cc6f04a708 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -46,7 +46,7 @@ struct est_timings {
 	u8 t1;
 	u8 t2;
 	u8 mfg_rsvd;
-} __attribute__((packed));
+} __packed;
 
 /* 00=16:10, 01=4:3, 10=5:4, 11=16:9 */
 #define EDID_TIMING_ASPECT_SHIFT 6
@@ -59,7 +59,7 @@ struct est_timings {
 struct std_timing {
 	u8 hsize; /* need to multiply by 8 then add 248 */
 	u8 vfreq_aspect;
-} __attribute__((packed));
+} __packed;
 
 #define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
 #define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
@@ -85,12 +85,12 @@ struct detailed_pixel_timing {
 	u8 hborder;
 	u8 vborder;
 	u8 misc;
-} __attribute__((packed));
+} __packed;
 
 /* If it's not pixel timing, it'll be one of the below */
 struct detailed_data_string {
 	u8 str[13];
-} __attribute__((packed));
+} __packed;
 
 #define DRM_EDID_RANGE_OFFSET_MIN_VFREQ (1 << 0) /* 1.4 */
 #define DRM_EDID_RANGE_OFFSET_MAX_VFREQ (1 << 1) /* 1.4 */
@@ -120,7 +120,7 @@ struct detailed_data_monitor_range {
 			__le16 m;
 			u8 k;
 			u8 j; /* need to divide by 2 */
-		} __attribute__((packed)) gtf2;
+		} __packed gtf2;
 		struct {
 			u8 version;
 			u8 data1; /* high 6 bits: extra clock resolution */
@@ -129,27 +129,27 @@ struct detailed_data_monitor_range {
 			u8 flags; /* preferred aspect and blanking support */
 			u8 supported_scalings;
 			u8 preferred_refresh;
-		} __attribute__((packed)) cvt;
-	} __attribute__((packed)) formula;
-} __attribute__((packed));
+		} __packed cvt;
+	} __packed formula;
+} __packed;
 
 struct detailed_data_wpindex {
 	u8 white_yx_lo; /* Lower 2 bits each */
 	u8 white_x_hi;
 	u8 white_y_hi;
 	u8 gamma; /* need to divide by 100 then add 1 */
-} __attribute__((packed));
+} __packed;
 
 struct detailed_data_color_point {
 	u8 windex1;
 	u8 wpindex1[3];
 	u8 windex2;
 	u8 wpindex2[3];
-} __attribute__((packed));
+} __packed;
 
 struct cvt_timing {
 	u8 code[3];
-} __attribute__((packed));
+} __packed;
 
 struct detailed_non_pixel {
 	u8 pad1;
@@ -163,8 +163,8 @@ struct detailed_non_pixel {
 		struct detailed_data_wpindex color;
 		struct std_timing timings[6];
 		struct cvt_timing cvt[4];
-	} __attribute__((packed)) data;
-} __attribute__((packed));
+	} __packed data;
+} __packed;
 
 #define EDID_DETAIL_EST_TIMINGS 0xf7
 #define EDID_DETAIL_CVT_3BYTE 0xf8
@@ -181,8 +181,8 @@ struct detailed_timing {
 	union {
 		struct detailed_pixel_timing pixel_data;
 		struct detailed_non_pixel other_data;
-	} __attribute__((packed)) data;
-} __attribute__((packed));
+	} __packed data;
+} __packed;
 
 #define DRM_EDID_INPUT_SERRATION_VSYNC (1 << 0)
 #define DRM_EDID_INPUT_SYNC_ON_GREEN   (1 << 1)
@@ -307,7 +307,7 @@ struct edid {
 	u8 extensions;
 	/* Checksum */
 	u8 checksum;
-} __attribute__((packed));
+} __packed;
 
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
-- 
2.39.2

