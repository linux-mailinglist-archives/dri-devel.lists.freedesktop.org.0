Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E047C51D1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 13:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEAF10E6E8;
	Wed, 11 Oct 2023 11:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535D110E6DA;
 Wed, 11 Oct 2023 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697023382; x=1728559382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xb2APKrXNvGC5bZYGTkbnNiS3wPaTkA6o/wAyms02FA=;
 b=Knc2K35Dz90wTDpnSXy8yzN77RvJf2oUPOZgCsFJlpLx4JEivhx/Amcy
 o3cbmVUD56XTrWmeZpBz9s0mvPHhaxVaa9SuUzi/Vo9203NIONZdhevAK
 IQABlq9ogU+0hgzTIKPWiG4gIsbCfgXEsWpY6DJDPpHb413Vt1Po+dzHW
 XPP+G+8hsZ4Rcm1GcTJGxYMpl6iXCC/XN+NhilSfbBV0eLf1YkmzKQ+VX
 +SLEOoW3rM3kQBlU/5ee3AxOXzJGCK+P3W4zhWyFC9z2qd+AdGVU4BeiR
 VHwirQVnlFunVBuQAA/ktusHEmq1apjyTT0WYG7h14qeg5vF4FVD3NWsZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387482619"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="387482619"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 04:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877630903"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="877630903"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga004.jf.intel.com with ESMTP; 11 Oct 2023 04:21:31 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Date: Wed, 11 Oct 2023 16:39:31 +0530
Message-Id: <20231011110936.1851563-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231011110936.1851563-1-animesh.manna@intel.com>
References: <20231011110936.1851563-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DPCD register definition for discovering, enabling and
checking status of panel replay of the sink.

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 include/drm/display/drm_dp.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e69cece404b3..fc42b622ef32 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -543,6 +543,10 @@
 /* DFP Capability Extension */
 #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
 
+#define DP_PANEL_REPLAY_CAP                 0x0b0  /* DP 2.0 */
+# define DP_PANEL_REPLAY_SUPPORT            (1 << 0)
+# define DP_PANEL_REPLAY_SU_SUPPORT         (1 << 1)
+
 /* Link Configuration */
 #define	DP_LINK_BW_SET		            0x100
 # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
@@ -716,6 +720,13 @@
 #define DP_BRANCH_DEVICE_CTRL		    0x1a1
 # define DP_BRANCH_DEVICE_IRQ_HPD	    (1 << 0)
 
+#define PANEL_REPLAY_CONFIG                             0x1b0  /* DP 2.0 */
+# define DP_PANEL_REPLAY_ENABLE                         (1 << 0)
+# define DP_PANEL_REPLAY_UNRECOVERABLE_ERROR_EN         (1 << 3)
+# define DP_PANEL_REPLAY_RFB_STORAGE_ERROR_EN           (1 << 4)
+# define DP_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR_EN      (1 << 5)
+# define DP_PANEL_REPLAY_SU_ENABLE                      (1 << 6)
+
 #define DP_PAYLOAD_ALLOCATE_SET		    0x1c0
 #define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
 #define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
@@ -1105,6 +1116,18 @@
 #define DP_LANE_ALIGN_STATUS_UPDATED_ESI       0x200e /* status same as 0x204 */
 #define DP_SINK_STATUS_ESI                     0x200f /* status same as 0x205 */
 
+#define DP_PANEL_REPLAY_ERROR_STATUS                   0x2020  /* DP 2.1*/
+# define DP_PANEL_REPLAY_LINK_CRC_ERROR                (1 << 0)
+# define DP_PANEL_REPLAY_RFB_STORAGE_ERROR             (1 << 1)
+# define DP_PANEL_REPLAY_VSC_SDP_UNCORRECTABLE_ERROR   (1 << 2)
+
+#define DP_SINK_DEVICE_PR_AND_FRAME_LOCK_STATUS        0x2022  /* DP 2.1 */
+# define DP_SINK_DEVICE_PANEL_REPLAY_STATUS_MASK       (7 << 0)
+# define DP_SINK_FRAME_LOCKED_SHIFT                    3
+# define DP_SINK_FRAME_LOCKED_MASK                     (3 << 3)
+# define DP_SINK_FRAME_LOCKED_STATUS_VALID_SHIFT       5
+# define DP_SINK_FRAME_LOCKED_STATUS_VALID_MASK        (1 << 5)
+
 /* Extended Receiver Capability: See DP_DPCD_REV for definitions */
 #define DP_DP13_DPCD_REV                    0x2200
 
-- 
2.29.0

