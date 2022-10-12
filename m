Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C545FBFFD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 06:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AB310E326;
	Wed, 12 Oct 2022 04:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF4010E320;
 Wed, 12 Oct 2022 04:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665550303; x=1697086303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=trOZeSN/sAQ6QPyIH22yKHJNbvNXL/LVcvSAB4nj+zU=;
 b=JCqBySz5PYcWSK85MUojjOCGp2vFLWaMiIwKNObRzAipBJKGzC+NaiBZ
 NW7VowRT22onuRjq1RM+wZa7meaPKr+X/7Ia3IazCmjQxqFwsaCK7SwDM
 vGAfaV6KRy/H8Z5kCIRThupU8TTbUiw3kOuWfrTX2B+s4798CS6ENBxOB
 muJyaxJbrDFwc/9b+FC5j8ALOtdBvI31aVUTl0B8mj6zdjBxYiBQ35wkt
 XSxkmmeiQvZFppE1cOMO+l/sQxpaIxu5l8Smz4JGHcUunlKJIAojuobLb
 7wIc00IXLGYNXL2Mcp2j3qbPZhgxCCL5RiuMmCfijSKbv59pxo9Ff43eY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="284423460"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="284423460"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 21:51:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="577698658"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="577698658"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 21:51:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/3] drm/i915: Fix coding style on DPLL*_ENABLE defines
Date: Tue, 11 Oct 2022 21:51:09 -0700
Message-Id: <20221011-pick-even-ranges-v1-2-1aaea52752ed@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
References: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abide by the rules in the top of the header: 2 spaces for bitfield,
prefix offsets with underscore and prefer the use of REG_BIT().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
(cherry picked from commit c5545ec37a7f5b928f3f6e3993f1f24b9e70ba32)
---
 drivers/gpu/drm/i915/i915_reg.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d157dd693e41..ad8f839046f5 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7305,20 +7305,20 @@ enum skl_power_gate {
 							ADLS_DPCLKA_DDIK_SEL_MASK)
 
 /* ICL PLL */
-#define DPLL0_ENABLE		0x46010
-#define DPLL1_ENABLE		0x46014
+#define _DPLL0_ENABLE		0x46010
+#define _DPLL1_ENABLE		0x46014
 #define _ADLS_DPLL2_ENABLE	0x46018
 #define _ADLS_DPLL3_ENABLE	0x46030
-#define  PLL_ENABLE		(1 << 31)
-#define  PLL_LOCK		(1 << 30)
-#define  PLL_POWER_ENABLE	(1 << 27)
-#define  PLL_POWER_STATE	(1 << 26)
-#define ICL_DPLL_ENABLE(pll)	_MMIO_PLL3(pll, DPLL0_ENABLE, DPLL1_ENABLE, \
+#define   PLL_ENABLE		REG_BIT(31)
+#define   PLL_LOCK		REG_BIT(30)
+#define   PLL_POWER_ENABLE	REG_BIT(27)
+#define   PLL_POWER_STATE	REG_BIT(26)
+#define ICL_DPLL_ENABLE(pll)	_MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
 					   _ADLS_DPLL2_ENABLE, _ADLS_DPLL3_ENABLE)
 
 #define _DG2_PLL3_ENABLE	0x4601C
 
-#define DG2_PLL_ENABLE(pll) _MMIO_PLL3(pll, DPLL0_ENABLE, DPLL1_ENABLE, \
+#define DG2_PLL_ENABLE(pll) _MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
 				       _ADLS_DPLL2_ENABLE, _DG2_PLL3_ENABLE)
 
 #define TBT_PLL_ENABLE		_MMIO(0x46020)
@@ -7327,12 +7327,12 @@ enum skl_power_gate {
 #define _MG_PLL2_ENABLE		0x46034
 #define _MG_PLL3_ENABLE		0x46038
 #define _MG_PLL4_ENABLE		0x4603C
-/* Bits are the same as DPLL0_ENABLE */
+/* Bits are the same as _DPLL0_ENABLE */
 #define MG_PLL_ENABLE(tc_port)	_MMIO_PORT((tc_port), _MG_PLL1_ENABLE, \
 					   _MG_PLL2_ENABLE)
 
 /* DG1 PLL */
-#define DG1_DPLL_ENABLE(pll)    _MMIO_PLL3(pll, DPLL0_ENABLE, DPLL1_ENABLE, \
+#define DG1_DPLL_ENABLE(pll)    _MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
 					   _MG_PLL1_ENABLE, _MG_PLL2_ENABLE)
 
 /* ADL-P Type C PLL */

-- 
b4 0.10.1
