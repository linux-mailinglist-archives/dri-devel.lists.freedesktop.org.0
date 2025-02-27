Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DAAA48A0C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 21:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890E110EB8E;
	Thu, 27 Feb 2025 20:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5q9/glj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0632910EB8D;
 Thu, 27 Feb 2025 20:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740688957; x=1772224957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/6f+n0PEa1PJRAyTWxSuLzZ1xxzmZSWh1hTCLk2GLbI=;
 b=K5q9/gljeXPLQH7HxEFSVJjNWcVp5L8pbYEpbvNCqoMpgl2zzqSpbPbU
 KfiKAZGIHj3m2ymHENwuGrA0Gj/8RqdMO/7F6YHa5FgMqlP8r68HtvyYX
 MpZNSmZT3VyOLfyJvG5WD4TP0kIhEY1KU8jd8D7MNTqZjrz6P8CZEskLH
 9W/yMT9nxwpIIOBe7mRb4AA9BloKiPB/Y5k1Qw7PHJRi9Y377I/CKqdh+
 Bf/hY5CZy00jziN4wLBzuCH68Bqgbt2QVwlZ/KjuXxZWYIVW2ac19Q1fN
 MeVkdu+o6wwK+0JJ1TMYzOqxIkhVhGVKUA/fxdHodmDXXYWL65UjWKyLK w==;
X-CSE-ConnectionGUID: 6THHTd8tShehO+AXmeSeBw==
X-CSE-MsgGUID: 6HdoecwGTiqOAUj5C4Tx1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52244060"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="52244060"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 12:42:36 -0800
X-CSE-ConnectionGUID: jPSfeu74Q4WtLQSrWEPcaA==
X-CSE-MsgGUID: 4/MvH6IkR0mvqMj89808TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122365967"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 27 Feb 2025 12:42:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Feb 2025 22:42:32 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/dp: Add definitions for POST_LT_ADJ training
 sequence
Date: Thu, 27 Feb 2025 22:42:32 +0200
Message-ID: <20250227204232.15624-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250224172645.15763-2-ville.syrjala@linux.intel.com>
References: <20250224172645.15763-2-ville.syrjala@linux.intel.com>
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

v2: DP_POST_LT_ADJ_REQ_IN_PROGRESS is bit 1 not 5 (Jani)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index c413ef68f9a3..e2d2ae573d8b 100644
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
@@ -788,6 +790,7 @@
 
 #define DP_LANE_ALIGN_STATUS_UPDATED                    0x204
 #define  DP_INTERLANE_ALIGN_DONE                        (1 << 0)
+#define  DP_POST_LT_ADJ_REQ_IN_PROGRESS                 (1 << 1) /* 1.3 */
 #define  DP_128B132B_DPRX_EQ_INTERLANE_ALIGN_DONE       (1 << 2) /* 2.0 E11 */
 #define  DP_128B132B_DPRX_CDS_INTERLANE_ALIGN_DONE      (1 << 3) /* 2.0 E11 */
 #define  DP_128B132B_LT_FAILED                          (1 << 4) /* 2.0 E11 */
-- 
2.45.3

