Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A44675E1E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C369F10E3A0;
	Fri, 20 Jan 2023 19:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC2110E39D;
 Fri, 20 Jan 2023 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243317; x=1705779317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m2qH4BxQ5ldd7JJareYs7kXQrvh8VxPnVgLDrLfG+fs=;
 b=cngmhpNjoGb7SBkhCXI0AuJfMZQWIsJ2eeY+3E9HEzszzZB+dk9+uS8/
 bgGYDXHHPerdotbdOmFpx1Sw/HU8keWZYlxnvY7N3XYyaJ4l5dM0oIelz
 x46OEdP0WPlA5gwINvaQkTCETdr4/EvRrA9Z2kJeTxP+xQK9UTupvcjsL
 qhOB4zpB7tl15RSqZzGgiPUSE8ydL61YwO/kl6IyTgfVrhctOO8BEvh5r
 S3zFWZaYg4SEqrk8cdhBhGG6gYAcu13heXnpUQHpyXK1RpiozaUPISF0u
 b6Kh7aljcnM81t6BFzZEBAcdjTZrILumk2Azy45NoNlUBFExu28ZHx9Fj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903531"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903531"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518301"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518301"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/i915: Fix coding style on DPLL*_ENABLE defines
Date: Fri, 20 Jan 2023 11:34:51 -0800
Message-Id: <20230120193457.3295977-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120193457.3295977-1-lucas.demarchi@intel.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abide by the rules in the top of the header: 2 spaces for bitfield,
prefix offsets with underscore and prefer the use of REG_BIT().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 3b2642397b82..8da3546d82fb 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7224,20 +7224,20 @@ enum skl_power_gate {
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
@@ -7246,12 +7246,12 @@ enum skl_power_gate {
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
2.39.0

