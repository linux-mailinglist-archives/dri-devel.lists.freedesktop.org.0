Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA2DC5766A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 13:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6524F10E7F3;
	Thu, 13 Nov 2025 12:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6/Fv5MM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE8610E7F4;
 Thu, 13 Nov 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763036932; x=1794572932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=94tKXuOQfC27mOeuPLaZiWIjBgBkhzUfNIPNaQxCMKQ=;
 b=d6/Fv5MMh7fGCGpe0K5jotSZl1TYyRyCGaqlRic79OaGYlbeZsbIlXQZ
 7ScX42b2EtcyH5FNKATHn+VhHosNmbrj4byxjL4Gjg0j7IphASNPrcI/G
 L7kCc3Gm1shXMnTrsWYDXzqQ+a3OXVvy0+shasp1RzqbyI1xKhbbSncJ3
 MURI2QXnx4PdDCcvIxdsjz5N4dXDBY8O6vwpiF9Mgn+xOzTmXlhXw1h0H
 gIzEHXTAfQM1CygjGukunXXaz/l2GooQ/18wSd3lSqH2gwZuI1W6ol6VG
 EdZVzWf5mVERMTTdbERabpQD938DOAz//xTWTYsBM8Wc6Zb+5KeJDqMd4 A==;
X-CSE-ConnectionGUID: vU0uukS1SyaAc8aRckMDTw==
X-CSE-MsgGUID: pmR9+rlcQWuvIW11FsKVZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="52677889"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="52677889"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 04:28:52 -0800
X-CSE-ConnectionGUID: 5YPUDH/GQLydwv6n25xPow==
X-CSE-MsgGUID: DRL0DhDUQ9yHh+74eoE6rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="188757724"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 13 Nov 2025 04:28:50 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 01/10] drm/i915/alpm: Add DPCD definition for DP2.1 ALPM
 capability
Date: Thu, 13 Nov 2025 17:31:10 +0530
Message-Id: <20251113120119.1437955-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251113120119.1437955-1-animesh.manna@intel.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
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

Add required DPCD address which will be needed to enable DP2.1 ALPM.

Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 include/drm/display/drm_dp.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e4eebabab975..b4bacbcf130e 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1512,6 +1512,8 @@
 /* See DP_128B132B_SUPPORTED_LINK_RATES for values */
 #define DP_PHY_REPEATER_128B132B_RATES			    0xf0007 /* 2.0 */
 #define DP_PHY_REPEATER_EQ_DONE                             0xf0008 /* 2.0 E11 */
+#define DP_LTTPR_ALPM_CAPABILITIES                          0xf0009 /* 2.1 */
+#define DP_TOTAL_LTTPR_CNT                                  0xf000a /* 2.1 */
 
 enum drm_dp_phy {
 	DP_PHY_DPRX,
@@ -1691,7 +1693,7 @@ enum drm_dp_phy {
 #define DP_DSC_BRANCH_CAP_SIZE		3
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	5
-#define DP_LTTPR_COMMON_CAP_SIZE	8
+#define DP_LTTPR_COMMON_CAP_SIZE	10
 #define DP_LTTPR_PHY_CAP_SIZE		3
 
 #define DP_SDP_AUDIO_TIMESTAMP		0x01
-- 
2.29.0

