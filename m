Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5247920CF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0982810E459;
	Tue,  5 Sep 2023 07:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8994910E443;
 Tue,  5 Sep 2023 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693900019; x=1725436019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NSfcYR8zlIMGPD2LR0iXCEkFu7zFHcr55+l0eE5wgC0=;
 b=Azo4oa8fePpv7bGFCUZXTtzHiNKmM6rAn3uxMcQRfh9+1XYufbVMbYbF
 GzKJkYWF3aQTcE8GvYMZKB+3gK8UXZqu4Q+L7xTwVYmVmAPhag5YbpkNV
 wpZkaGhrOzS8Z60ckzA8Anghw0TvCUekVREY9YokIoNB8jyqptJyFEd1I
 UXX5GGeEDIjEXBu5wzKk8ZDpxoSNgi8Rq6H8MZnaZ3ERFuTFWbMARgxGA
 wJ4NMxKO0VEHLc+FkjMk+P/tPlAsNqqycoKC3JPyeRnSZU7aq3UPKdgPJ
 9s18v9nah0E4raLQ9lnPZnEJ0UU0KXpaR1FPWj1/vESbve+HsptHAXn50 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="443133622"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="443133622"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 00:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="855878445"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="855878445"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2023 00:46:57 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Date: Tue,  5 Sep 2023 13:05:46 +0530
Message-Id: <20230905073551.958368-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20230905073551.958368-1-animesh.manna@intel.com>
References: <20230905073551.958368-1-animesh.manna@intel.com>
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
Cc: jani.nikula@intel.com, jouni.hogander@intel.com,
 Animesh Manna <animesh.manna@intel.com>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DPCD register definition for discovering, enabling and
checking status of panel replay of the sink.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 include/drm/display/drm_dp.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e69cece404b3..23c2a68c32a4 100644
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
+# define DP_PANEL_REPLAY_UNRECOVERABLE_ERROR            (1 << 3)
+# define DP_PANEL_REPLAY_RFB_STORAGE_ERROR              (1 << 4)
+# define DP_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR         (1 << 5)
+# define DP_PANEL_REPLAY_SU_ENABLE                      (1 << 6)
+
 #define DP_PAYLOAD_ALLOCATE_SET		    0x1c0
 #define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
 #define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
@@ -1105,6 +1116,13 @@
 #define DP_LANE_ALIGN_STATUS_UPDATED_ESI       0x200e /* status same as 0x204 */
 #define DP_SINK_STATUS_ESI                     0x200f /* status same as 0x205 */
 
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

