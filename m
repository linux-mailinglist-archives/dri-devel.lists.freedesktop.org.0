Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8487E0A9B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 22:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB99A10EAC9;
	Fri,  3 Nov 2023 21:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9DE10EAC9;
 Fri,  3 Nov 2023 21:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699045975; x=1730581975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xb2APKrXNvGC5bZYGTkbnNiS3wPaTkA6o/wAyms02FA=;
 b=B4RAAIFUZDJSVMEZaoqAIzcXDNbbvbSK+TEzVY4Xcz2jgQCyS54FPlvI
 HZayw1spLv2hl2tu2fR/VYSQAc80epi5KbN3U6kndjB+9GRw+PNrMi5Pf
 AzZSz08HxHKrZevNqlUPlEX2JGf1vwVPHA2n667yNTNZyitNrY9NyW7Bc
 YI8eJLol/sNtTL0vMhBFn9HH7zXiEdrs5OMirH/se1+5vo64+P14/NqdN
 iGkGZbrI+TetiHMzMnPMIWsZ4oC4to7+GDu+ewIb5JFO4E/8TTj0axWAI
 a/O0f3sBpLCYZkuNllyjiV7o5vMcquPLR+VkYFo6h228k/ARruERr58Ij w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="379416723"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="379416723"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 14:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="790877336"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="790877336"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga008.jf.intel.com with ESMTP; 03 Nov 2023 14:12:52 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Date: Sat,  4 Nov 2023 02:30:30 +0530
Message-Id: <20231103210035.3151502-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231103210035.3151502-1-animesh.manna@intel.com>
References: <20231103210035.3151502-1-animesh.manna@intel.com>
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
 Arun R Murthy <arun.r.murthy@intel.com>
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

