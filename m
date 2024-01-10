Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD36A829B0C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 14:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269D710E044;
	Wed, 10 Jan 2024 13:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38310E044
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704892583; x=1736428583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bi00YTP/YDnin5cwFEWEK52xuDg4Q8dVyRBr2Z8awG8=;
 b=D8MSFPkQE4uA7qm5YDBqS2k8DeQQOPm2QoSj8uJkaibP4H4jwHqxjmj+
 AoPpUDU2FnOyqy7xoNYIoXK7Op5eZZYEDZ6lMu/qNAM7r7skXQ6iEfwdd
 c3t9wD8xy8aMrrz5rDqFWt0Am4QQlway83yeDF4BSo4rFy3VupC2MhGFa
 FpGDaLGcvx1CA5gUHwmCJ4kciEP90UNaUIWaKV9VRbYLWdSMbA/kj3oAn
 8zf0r2Oba9GWh1/hzhp39BA4oqs4bkYS+RXOXVVDClypFEhy6TM973zEG
 K4vHUE9NauYTG902OjbnxaCRPVPSsndWr62er5J2dTFl3YCW+76oBUXak w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="402291616"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="402291616"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 05:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="782178131"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="782178131"
Received: from vsovraso-mobl.ccr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.211.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 05:16:21 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/13] drm/panelreplay: dpcd register definition for
 panelreplay SU
Date: Wed, 10 Jan 2024 15:15:45 +0200
Message-Id: <20240110131545.2471813-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add definitions for panel replay selective update

v2: Remove unnecessary Cc from commit message

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 281afff6ee4e..4ebf79948c7f 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -548,6 +548,12 @@
 # define DP_PANEL_REPLAY_SUPPORT            (1 << 0)
 # define DP_PANEL_REPLAY_SU_SUPPORT         (1 << 1)
 
+#define DP_PANEL_PANEL_REPLAY_CAPABILITY		0xb1
+# define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+
+#define DP_PANEL_PANEL_REPLAY_X_GRANULARITY		0xb2
+#define DP_PANEL_PANEL_REPLAY_Y_GRANULARITY		0xb4
+
 /* Link Configuration */
 #define	DP_LINK_BW_SET		            0x100
 # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
-- 
2.34.1

