Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FBDA42991
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE36210E47F;
	Mon, 24 Feb 2025 17:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8ls+Bgu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C3E10E359;
 Mon, 24 Feb 2025 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418013; x=1771954013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FOhGyt1L922aiINIgghYvB5cpcCq5GAK8slzVg9G34E=;
 b=S8ls+Bgura7Nvapqr6kkhyKgfBa/g9Ij39IywS4AZWBviySMkW/nSTu1
 y21YR9CNZBLv/w/+XXKrw6rdxuSn0idJLS1CwNyqfsAGV/89xoDLm09F9
 t4n3BBisM6yL9lLbagIiPN6/0BwxPoyK1i6iEuUY9A/YoRQrQz3EImZW3
 nM9rtfmenSWONloog/XvG+vQH+EtQgxWqMhtt/WRnfx7V9U9znqO+TanQ
 E8Aa2+ZMMH0UOJnw6DdK55ZOWxQn/JLn5A5clxdWc5L4L9cOu6FlqZIII
 lPJc5BDEJ/5KFJgBP9ZSmxggXLRoCvuCPwZIpinJUwd9axvdPGdFsuRHb g==;
X-CSE-ConnectionGUID: Kv6CcPiMRlShXD6W7EbdzA==
X-CSE-MsgGUID: WDjkqS2+QnCsAel5w79w1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601710"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601710"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:26:53 -0800
X-CSE-ConnectionGUID: 5x1MxDrBQj27jN29pQR2Hw==
X-CSE-MsgGUID: ktI/bhMwQD+exdC4P8p8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374096"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:26:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:26:49 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/dp: Add definitions for POST_LT_ADJ training sequence
Date: Mon, 24 Feb 2025 19:26:37 +0200
Message-ID: <20250224172645.15763-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add the bit definitions needed for POST_LT_ADJ sequence.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index c413ef68f9a3..260948a8f550 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -115,6 +115,7 @@
 
 #define DP_MAX_LANE_COUNT                   0x002
 # define DP_MAX_LANE_COUNT_MASK		    0x1f
+# define DP_POST_LT_ADJ_REQ_SUPPORTED	    (1 << 5) /* 1.3 */
 # define DP_TPS3_SUPPORTED		    (1 << 6) /* 1.2 */
 # define DP_ENHANCED_FRAME_CAP		    (1 << 7)
 
@@ -571,6 +572,7 @@
 
 #define DP_LANE_COUNT_SET	            0x101
 # define DP_LANE_COUNT_MASK		    0x0f
+# define DP_POST_LT_ADJ_REQ_GRANTED         (1 << 5) /* 1.3 */
 # define DP_LANE_COUNT_ENHANCED_FRAME_EN    (1 << 7)
 
 #define DP_TRAINING_PATTERN_SET	            0x102
@@ -791,6 +793,7 @@
 #define  DP_128B132B_DPRX_EQ_INTERLANE_ALIGN_DONE       (1 << 2) /* 2.0 E11 */
 #define  DP_128B132B_DPRX_CDS_INTERLANE_ALIGN_DONE      (1 << 3) /* 2.0 E11 */
 #define  DP_128B132B_LT_FAILED                          (1 << 4) /* 2.0 E11 */
+#define  DP_POST_LT_ADJ_REQ_IN_PROGRESS                 (1 << 5) /* 1.3 */
 #define  DP_DOWNSTREAM_PORT_STATUS_CHANGED              (1 << 6)
 #define  DP_LINK_STATUS_UPDATED                         (1 << 7)
 
-- 
2.45.3

