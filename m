Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AC9ABE143
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A75B10E66A;
	Tue, 20 May 2025 16:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDTtR5Gk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DFE10E592;
 Tue, 20 May 2025 16:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747760038; x=1779296038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQTRqEXr2cUatg2aRhA+tFtjd+VJAHFAjTbtQH8g3HQ=;
 b=KDTtR5GkT959p4DETCJ8SLzNvYqmKbsUdhiyry0Y40Soai4ETWnmg93Y
 qZCOydo1b8VL1f/b/2a9ZWB58KG90tdAanNwSy+jV8CLMs9isPIY2rO+6
 0yscFAAd7qL6kqYgkiVfNe7HimSFknKwuVhg1lX6yfaK+YAyT9+j9WPUM
 Grivh8eIvF2PE487JUOr7h1emoibiw6DvcWf6ZJuv+Qbrou+HbOMXWOOA
 IX0GDPT9LRtr5QQUk7OAAWi1Hq2TRD38yPRkdqeBEDpRB6dkhvuHK/KNV
 1Qbdxka7ywcFrOrJ2K0X+vqe7tF8xWA5kTyPMDPPvCsUDy4gUcxitTed2 g==;
X-CSE-ConnectionGUID: +Vfm6znLR9+Sd4xJzfZuKA==
X-CSE-MsgGUID: O8NV0oIOQsy4d7Z67UyOnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37322236"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="37322236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 09:53:58 -0700
X-CSE-ConnectionGUID: R3rdR07NSgKlzt6miQATDw==
X-CSE-MsgGUID: 2N5TGAd6Qa+LTyaLJgE6qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="163038234"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.130])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 09:53:56 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 09/12] drm/i915/display: Add PHY_CMN1_CONTROL register
 definitions
Date: Tue, 20 May 2025 19:53:23 +0300
Message-ID: <20250520165326.1631330-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520165326.1631330-1-jouni.hogander@intel.com>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add PHY_CMN1_CONTROL register and its definitions to configure port LFPS
sending.

Bspec: 68962
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
index 59c22beaf1de..580a43be195e 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
@@ -285,6 +285,9 @@
 #define PHY_CX0_TX_CONTROL(tx, control)	(0x400 + ((tx) - 1) * 0x200 + (control))
 #define   CONTROL2_DISABLE_SINGLE_TX	REG_BIT(6)
 
+#define PHY_CMN1_CONTROL(tx, control)	(0x800 + ((tx) - 1) * 0x200 + (control))
+#define   CONTROL0_MAC_TRANSMIT_LFPS	REG_BIT(1)
+
 /* C20 Registers */
 #define PHY_C20_WR_ADDRESS_L		0xC02
 #define PHY_C20_WR_ADDRESS_H		0xC03
-- 
2.43.0

