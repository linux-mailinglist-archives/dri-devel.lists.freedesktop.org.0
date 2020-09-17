Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AE26D986
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 12:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B886EBA5;
	Thu, 17 Sep 2020 10:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540FD6EBA5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:50:37 +0000 (UTC)
IronPort-SDR: RQZCs89vm6jvd+gAt+i3PpQXKZdZ8CPkOpGks0+k6JxkCTKS7RQ+VhU9NPoFFaUJgh58nsRiaO
 PlmQwFnhjilQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="223849100"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="223849100"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:50:35 -0700
IronPort-SDR: 9ixvbWo2nUANdtFn/7l/DdJ3IlBGPch3GNJNK4ZlJC/rV5emtRAJ0z6gHKP7zJ5DQ6icdqCopF
 D388KTr8kXcw==
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="483698277"
Received: from wgitix-mobl.ger.corp.intel.com (HELO localhost) ([10.251.83.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:50:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp: add subheadings to DPCD address definitions
Date: Thu, 17 Sep 2020 13:50:37 +0300
Message-Id: <20200917105038.12313-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the subheadings from the DP spec. No functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_dp_helper.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 5c45195ced32..3d9900e7d57c 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -104,8 +104,9 @@
 #define DP_AUX_I2C_REPLY_DEFER		(0x2 << 2)
 #define DP_AUX_I2C_REPLY_MASK		(0x3 << 2)
 
-/* AUX CH addresses */
-/* DPCD */
+/* DPCD Field Address Mapping */
+
+/* Receiver Capability */
 #define DP_DPCD_REV                         0x000
 # define DP_DPCD_REV_10                     0x10
 # define DP_DPCD_REV_11                     0x11
@@ -407,7 +408,7 @@
 #define DP_DSC_BRANCH_OVERALL_THROUGHPUT_1  0x0a1
 #define DP_DSC_BRANCH_MAX_LINE_WIDTH        0x0a2
 
-/* link configuration */
+/* Link Configuration */
 #define	DP_LINK_BW_SET		            0x100
 # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
 # define DP_LINK_BW_1_62		    0x06
@@ -561,6 +562,7 @@
 #define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
 #define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
 
+/* Link/Sink Device Status */
 #define DP_SINK_COUNT			    0x200
 /* prior to 1.2 bit 7 was reserved mbz */
 # define DP_GET_SINK_COUNT(x)		    ((((x) & 0x80) >> 1) | ((x) & 0x3f))
@@ -760,20 +762,27 @@
 #define DP_VC_PAYLOAD_ID_SLOT_1             0x2c1   /* 1.2 MST */
 /* up to ID_SLOT_63 at 0x2ff */
 
+/* Source Device-specific */
 #define DP_SOURCE_OUI			    0x300
+
+/* Sink Device-specific */
 #define DP_SINK_OUI			    0x400
+
+/* Branch Device-specific */
 #define DP_BRANCH_OUI			    0x500
 #define DP_BRANCH_ID                        0x503
 #define DP_BRANCH_REVISION_START            0x509
 #define DP_BRANCH_HW_REV                    0x509
 #define DP_BRANCH_SW_REV                    0x50A
 
+/* Link/Sink Device Power Control */
 #define DP_SET_POWER                        0x600
 # define DP_SET_POWER_D0                    0x1
 # define DP_SET_POWER_D3                    0x2
 # define DP_SET_POWER_MASK                  0x3
 # define DP_SET_POWER_D3_AUX_ON             0x5
 
+/* eDP-specific */
 #define DP_EDP_DPCD_REV			    0x700    /* eDP 1.2 */
 # define DP_EDP_11			    0x00
 # define DP_EDP_12			    0x01
@@ -857,11 +866,13 @@
 #define DP_EDP_REGIONAL_BACKLIGHT_BASE      0x740    /* eDP 1.4 */
 #define DP_EDP_REGIONAL_BACKLIGHT_0	    0x741    /* eDP 1.4 */
 
+/* Sideband MSG Buffers */
 #define DP_SIDEBAND_MSG_DOWN_REQ_BASE	    0x1000   /* 1.2 MST */
 #define DP_SIDEBAND_MSG_UP_REP_BASE	    0x1200   /* 1.2 MST */
 #define DP_SIDEBAND_MSG_DOWN_REP_BASE	    0x1400   /* 1.2 MST */
 #define DP_SIDEBAND_MSG_UP_REQ_BASE	    0x1600   /* 1.2 MST */
 
+/* DPRX Event Status Indicator */
 #define DP_SINK_COUNT_ESI		    0x2002   /* 1.2 */
 /* 0-5 sink count */
 # define DP_SINK_COUNT_CP_READY             (1 << 6)
@@ -915,6 +926,7 @@
 #define DP_LANE_ALIGN_STATUS_UPDATED_ESI       0x200e /* status same as 0x204 */
 #define DP_SINK_STATUS_ESI                     0x200f /* status same as 0x205 */
 
+/* Extended Receiver Capability */
 #define DP_DP13_DPCD_REV                    0x2200
 #define DP_DP13_MAX_LINK_RATE               0x2201
 
@@ -928,6 +940,7 @@
 # define DP_VSC_EXT_CEA_SDP_SUPPORTED			(1 << 6)  /* DP 1.4 */
 # define DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED		(1 << 7)  /* DP 1.4 */
 
+/* Protocol Converter Extension */
 /* HDMI CEC tunneling over AUX DP 1.3 section 5.3.3.3.1 DPCD 1.4+ */
 #define DP_CEC_TUNNELING_CAPABILITY            0x3000
 # define DP_CEC_TUNNELING_CAPABLE               (1 << 0)
@@ -984,6 +997,7 @@
 #define DP_CEC_TX_MESSAGE_BUFFER               0x3020
 #define DP_CEC_MESSAGE_BUFFER_LENGTH             0x10
 
+/* HDCP 1.3 and HDCP 2.2 */
 #define DP_AUX_HDCP_BKSV		0x68000
 #define DP_AUX_HDCP_RI_PRIME		0x68005
 #define DP_AUX_HDCP_AKSV		0x68007
@@ -1029,7 +1043,7 @@
 #define DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET	0x69494
 #define DP_HDCP_2_2_REG_DBG_OFFSET		0x69518
 
-/* Link Training (LT)-tunable PHY Repeaters */
+/* LTTPR: Link Training (LT)-tunable PHY Repeaters */
 #define DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV 0xf0000 /* 1.3 */
 #define DP_MAX_LINK_RATE_PHY_REPEATER			    0xf0001 /* 1.4a */
 #define DP_PHY_REPEATER_CNT				    0xf0002 /* 1.3 */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
