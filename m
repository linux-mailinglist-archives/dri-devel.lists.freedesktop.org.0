Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B44ABF372
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316A811B51F;
	Wed, 21 May 2025 11:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffTGpT4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8683710F085;
 Wed, 21 May 2025 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828437; x=1779364437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQTRqEXr2cUatg2aRhA+tFtjd+VJAHFAjTbtQH8g3HQ=;
 b=ffTGpT4qmHq1JfXLPL0hYzQqBpO46u+1QSGS+GLTOZFySrB3UuDXR4C5
 yNXIzs0qxdIqfmjXj32RveL3I5kAtvpwgkDn1NCb3QwdLWRLEyekVy2BW
 hZHPWr0bimOgqPmNsDJfFF4g+CO3lEFvzhYo2wAyfxGFkU3nGwQPJn4tQ
 Y4YhPHUNr4VKrGmU2Abps6XnsqH0Pj2X2tbslpELW2BzIM3GG2sGlZ0Nm
 edAySZH306/iHPVVqc/XLv5yCvQg3G6xTJmYtHqF+a5sU8rUAo0gmRS1W
 7s5GjFoJBUCCLBJsTk6xaQaz9iQJ1hUaSZKks+q4AAW1ov4PEf3iMrQNT Q==;
X-CSE-ConnectionGUID: MkiYfBsyTWyYkYkvCVDMBg==
X-CSE-MsgGUID: LnXrwBuLS9q8ttiB7Y1pbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67217837"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="67217837"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:57 -0700
X-CSE-ConnectionGUID: syiKcGecTlaO/PF8B533bw==
X-CSE-MsgGUID: gIHi0ZpiRoS09nqgHOtsfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140452930"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:54 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 09/12] drm/i915/display: Add PHY_CMN1_CONTROL register
 definitions
Date: Wed, 21 May 2025 14:53:16 +0300
Message-ID: <20250521115319.2380655-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521115319.2380655-1-jouni.hogander@intel.com>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
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

