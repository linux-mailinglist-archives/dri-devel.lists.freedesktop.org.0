Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2025ABEFEA
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 11:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE8A10E6F2;
	Wed, 21 May 2025 09:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfUnwMTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC6510E6F3;
 Wed, 21 May 2025 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747819995; x=1779355995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQTRqEXr2cUatg2aRhA+tFtjd+VJAHFAjTbtQH8g3HQ=;
 b=RfUnwMTbtNEX6XaAuzydM3BEPhe6jUMPHo0Upd390qV6RwOB1CV0Hb3k
 2weDpk2B/CNjDRmrBQT2+GZ0v1gCbIvcgz79pQ5mR0M5RKH/6pYWIEvvP
 xa7fIHzLlSCnWLrx/UJRk9c8g1KaGyG5lbWJQoC1nNAeNg93crGsiL01L
 L+rRMJRYvYCT0d0p59AkVZVlM6gFDMpnULhUNI8ZEDRPtBVCDbS+7M5V6
 rKJEcwXj84YlKX7KvlQpt7zO7SHb+VRG4M3wXndLod8Xxnr8yTd17jkeS
 +VOUDlGum5OKa/aHRRxN07hpJekTJdyPPsNstITpXgqOdKFoTnVxDr0v6 Q==;
X-CSE-ConnectionGUID: ncTX9v4HTg+Z2zcLhebs1w==
X-CSE-MsgGUID: r1KzF/8mS/ejcowqruODCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49714361"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49714361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:33:14 -0700
X-CSE-ConnectionGUID: hKLyNhW5T0yXJO7UlWTdkQ==
X-CSE-MsgGUID: dyEbSnJ4S1axE1GrfpyDcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140407127"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:33:13 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 09/12] drm/i915/display: Add PHY_CMN1_CONTROL register
 definitions
Date: Wed, 21 May 2025 12:32:37 +0300
Message-ID: <20250521093240.2284835-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521093240.2284835-1-jouni.hogander@intel.com>
References: <20250521093240.2284835-1-jouni.hogander@intel.com>
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

