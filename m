Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E31131D8CD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 12:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F4D6E4E6;
	Wed, 17 Feb 2021 11:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ADF6E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 11:50:23 +0000 (UTC)
IronPort-SDR: /+g4KCyfi6wfGVWDv39ZfOiUVsAiql87QwQvukdTv+LK76wfiPKNwIpnSMrSiG72nEthYUq8vK
 6uQQuHW5YUnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="170307966"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="170307966"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 03:50:23 -0800
IronPort-SDR: nTeQnzKkwC6byGDZkEhbgiSAKzK/xFCjacQXKaNWTu3m1SQUSOte9NPFKK8Du8I+B3uZqIKQx+
 ILDjh79DFPag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="419072421"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2021 03:50:21 -0800
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 1/2] intel: sync i915_pciids.h with kernel
Date: Wed, 17 Feb 2021 17:10:04 +0530
Message-Id: <20210217114005.11888-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210217114005.11888-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210217114005.11888-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Align with kernel commits:

0883d63b19bb ("drm/i915/adl_s: Add ADL-S platform info and PCI ids")
04057a1afc75 ("drm/i915: Sort EHL/JSL PCI IDs")
0e8e272f1368 ("drm/i915/ehl: Remove invalid PCI ID")
605f9c290c1a ("drm/i915: Sort ICL PCI IDs")
514dc424ce4f ("drm/i915: Sort CNL PCI IDs")
32d4ec9a1681 ("drm/i915: Sort CFL PCI IDs")
df3478af1d73 ("drm/i915: Sort CML PCI IDs")
cd988984cbea ("drm/i915: Sort KBL PCI IDs")
b04d36f73771 ("drm/i915: Sort SKL PCI IDs")
9c0b2d30441b ("drm/i915: Sort HSW PCI IDs")
79033a0a7898 ("drm/i915: Ocd the HSW PCI ID hex numbers")
cfb3db8fdae2 ("drm/i915: Try to fix the SKL GT3/4 vs. GT3e/4e comments")
03e399020cd2 ("drm/i915: Add SKL GT1.5 PCI IDs")
812f044df08c ("drm/i915: Reclassify SKL 0x1923 and 0x1927 as ULT")
194909a32aed ("drm/i915: Reclassify SKL 0x192a as GT3")
82e84284ab7d ("drm/i915: Update Haswell PCI IDs")
24ea098b7c0d ("drm/i915/jsl: Split EHL/JSL platform info and PCI ids")
b50b7991b739 ("drm/i915/dg1: add more PCI ids")
d452bd091e16 ("drm/i915: break TGL pci-ids in GT 1 & 2")
f2bde2546b81 ("drm/i915: Remove dubious Valleyview PCI IDs")
0883d63b19bb ("drm/i915/adl_s: Add ADL-S platform info and PCI ids")
04057a1afc75 ("drm/i915: Sort EHL/JSL PCI IDs")
0e8e272f1368 ("drm/i915/ehl: Remove invalid PCI ID")
605f9c290c1a ("drm/i915: Sort ICL PCI IDs")
514dc424ce4f ("drm/i915: Sort CNL PCI IDs")
32d4ec9a1681 ("drm/i915: Sort CFL PCI IDs")
df3478af1d73 ("drm/i915: Sort CML PCI IDs")
cd988984cbea ("drm/i915: Sort KBL PCI IDs")
b04d36f73771 ("drm/i915: Sort SKL PCI IDs")
9c0b2d30441b ("drm/i915: Sort HSW PCI IDs")
79033a0a7898 ("drm/i915: Ocd the HSW PCI ID hex numbers")
cfb3db8fdae2 ("drm/i915: Try to fix the SKL GT3/4 vs. GT3e/4e comments")
03e399020cd2 ("drm/i915: Add SKL GT1.5 PCI IDs")
812f044df08c ("drm/i915: Reclassify SKL 0x1923 and 0x1927 as ULT")
194909a32aed ("drm/i915: Reclassify SKL 0x192a as GT3")
82e84284ab7d ("drm/i915: Update Haswell PCI IDs")
24ea098b7c0d ("drm/i915/jsl: Split EHL/JSL platform info and PCI ids")
b50b7991b739 ("drm/i915/dg1: add more PCI ids")
d452bd091e16 ("drm/i915: break TGL pci-ids in GT 1 & 2")

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 intel/i915_pciids.h | 177 +++++++++++++++++++++++++-------------------
 1 file changed, 101 insertions(+), 76 deletions(-)

diff --git a/intel/i915_pciids.h b/intel/i915_pciids.h
index 8e7ae30e..ebd0dd1c 100644
--- a/intel/i915_pciids.h
+++ b/intel/i915_pciids.h
@@ -170,9 +170,9 @@
 
 #define INTEL_HSW_ULT_GT1_IDS(info) \
 	INTEL_VGA_DEVICE(0x0A02, info), /* ULT GT1 desktop */ \
+	INTEL_VGA_DEVICE(0x0A06, info), /* ULT GT1 mobile */ \
 	INTEL_VGA_DEVICE(0x0A0A, info), /* ULT GT1 server */ \
-	INTEL_VGA_DEVICE(0x0A0B, info), /* ULT GT1 reserved */ \
-	INTEL_VGA_DEVICE(0x0A06, info)  /* ULT GT1 mobile */
+	INTEL_VGA_DEVICE(0x0A0B, info)  /* ULT GT1 reserved */
 
 #define INTEL_HSW_ULX_GT1_IDS(info) \
 	INTEL_VGA_DEVICE(0x0A0E, info) /* ULX GT1 mobile */
@@ -181,26 +181,26 @@
 	INTEL_HSW_ULT_GT1_IDS(info), \
 	INTEL_HSW_ULX_GT1_IDS(info), \
 	INTEL_VGA_DEVICE(0x0402, info), /* GT1 desktop */ \
-	INTEL_VGA_DEVICE(0x040a, info), /* GT1 server */ \
+	INTEL_VGA_DEVICE(0x0406, info), /* GT1 mobile */ \
+	INTEL_VGA_DEVICE(0x040A, info), /* GT1 server */ \
 	INTEL_VGA_DEVICE(0x040B, info), /* GT1 reserved */ \
 	INTEL_VGA_DEVICE(0x040E, info), /* GT1 reserved */ \
 	INTEL_VGA_DEVICE(0x0C02, info), /* SDV GT1 desktop */ \
+	INTEL_VGA_DEVICE(0x0C06, info), /* SDV GT1 mobile */ \
 	INTEL_VGA_DEVICE(0x0C0A, info), /* SDV GT1 server */ \
 	INTEL_VGA_DEVICE(0x0C0B, info), /* SDV GT1 reserved */ \
 	INTEL_VGA_DEVICE(0x0C0E, info), /* SDV GT1 reserved */ \
 	INTEL_VGA_DEVICE(0x0D02, info), /* CRW GT1 desktop */ \
+	INTEL_VGA_DEVICE(0x0D06, info), /* CRW GT1 mobile */	\
 	INTEL_VGA_DEVICE(0x0D0A, info), /* CRW GT1 server */ \
 	INTEL_VGA_DEVICE(0x0D0B, info), /* CRW GT1 reserved */ \
-	INTEL_VGA_DEVICE(0x0D0E, info), /* CRW GT1 reserved */ \
-	INTEL_VGA_DEVICE(0x0406, info), /* GT1 mobile */ \
-	INTEL_VGA_DEVICE(0x0C06, info), /* SDV GT1 mobile */ \
-	INTEL_VGA_DEVICE(0x0D06, info)  /* CRW GT1 mobile */
+	INTEL_VGA_DEVICE(0x0D0E, info)  /* CRW GT1 reserved */
 
 #define INTEL_HSW_ULT_GT2_IDS(info) \
 	INTEL_VGA_DEVICE(0x0A12, info), /* ULT GT2 desktop */ \
+	INTEL_VGA_DEVICE(0x0A16, info), /* ULT GT2 mobile */	\
 	INTEL_VGA_DEVICE(0x0A1A, info), /* ULT GT2 server */ \
-	INTEL_VGA_DEVICE(0x0A1B, info), /* ULT GT2 reserved */ \
-	INTEL_VGA_DEVICE(0x0A16, info)  /* ULT GT2 mobile */
+	INTEL_VGA_DEVICE(0x0A1B, info)  /* ULT GT2 reserved */ \
 
 #define INTEL_HSW_ULX_GT2_IDS(info) \
 	INTEL_VGA_DEVICE(0x0A1E, info) /* ULX GT2 mobile */ \
@@ -209,45 +209,45 @@
 	INTEL_HSW_ULT_GT2_IDS(info), \
 	INTEL_HSW_ULX_GT2_IDS(info), \
 	INTEL_VGA_DEVICE(0x0412, info), /* GT2 desktop */ \
-	INTEL_VGA_DEVICE(0x041a, info), /* GT2 server */ \
+	INTEL_VGA_DEVICE(0x0416, info), /* GT2 mobile */ \
+	INTEL_VGA_DEVICE(0x041A, info), /* GT2 server */ \
 	INTEL_VGA_DEVICE(0x041B, info), /* GT2 reserved */ \
 	INTEL_VGA_DEVICE(0x041E, info), /* GT2 reserved */ \
 	INTEL_VGA_DEVICE(0x0C12, info), /* SDV GT2 desktop */ \
+	INTEL_VGA_DEVICE(0x0C16, info), /* SDV GT2 mobile */ \
 	INTEL_VGA_DEVICE(0x0C1A, info), /* SDV GT2 server */ \
 	INTEL_VGA_DEVICE(0x0C1B, info), /* SDV GT2 reserved */ \
 	INTEL_VGA_DEVICE(0x0C1E, info), /* SDV GT2 reserved */ \
 	INTEL_VGA_DEVICE(0x0D12, info), /* CRW GT2 desktop */ \
+	INTEL_VGA_DEVICE(0x0D16, info), /* CRW GT2 mobile */ \
 	INTEL_VGA_DEVICE(0x0D1A, info), /* CRW GT2 server */ \
 	INTEL_VGA_DEVICE(0x0D1B, info), /* CRW GT2 reserved */ \
-	INTEL_VGA_DEVICE(0x0D1E, info), /* CRW GT2 reserved */ \
-	INTEL_VGA_DEVICE(0x0416, info), /* GT2 mobile */ \
-	INTEL_VGA_DEVICE(0x0426, info), /* GT2 mobile */ \
-	INTEL_VGA_DEVICE(0x0C16, info), /* SDV GT2 mobile */ \
-	INTEL_VGA_DEVICE(0x0D16, info)  /* CRW GT2 mobile */
+	INTEL_VGA_DEVICE(0x0D1E, info)  /* CRW GT2 reserved */
 
 #define INTEL_HSW_ULT_GT3_IDS(info) \
 	INTEL_VGA_DEVICE(0x0A22, info), /* ULT GT3 desktop */ \
+	INTEL_VGA_DEVICE(0x0A26, info), /* ULT GT3 mobile */ \
 	INTEL_VGA_DEVICE(0x0A2A, info), /* ULT GT3 server */ \
 	INTEL_VGA_DEVICE(0x0A2B, info), /* ULT GT3 reserved */ \
-	INTEL_VGA_DEVICE(0x0A26, info), /* ULT GT3 mobile */ \
 	INTEL_VGA_DEVICE(0x0A2E, info)  /* ULT GT3 reserved */
 
 #define INTEL_HSW_GT3_IDS(info) \
 	INTEL_HSW_ULT_GT3_IDS(info), \
 	INTEL_VGA_DEVICE(0x0422, info), /* GT3 desktop */ \
-	INTEL_VGA_DEVICE(0x042a, info), /* GT3 server */ \
+	INTEL_VGA_DEVICE(0x0426, info), /* GT3 mobile */ \
+	INTEL_VGA_DEVICE(0x042A, info), /* GT3 server */ \
 	INTEL_VGA_DEVICE(0x042B, info), /* GT3 reserved */ \
 	INTEL_VGA_DEVICE(0x042E, info), /* GT3 reserved */ \
 	INTEL_VGA_DEVICE(0x0C22, info), /* SDV GT3 desktop */ \
+	INTEL_VGA_DEVICE(0x0C26, info), /* SDV GT3 mobile */ \
 	INTEL_VGA_DEVICE(0x0C2A, info), /* SDV GT3 server */ \
 	INTEL_VGA_DEVICE(0x0C2B, info), /* SDV GT3 reserved */ \
 	INTEL_VGA_DEVICE(0x0C2E, info), /* SDV GT3 reserved */ \
 	INTEL_VGA_DEVICE(0x0D22, info), /* CRW GT3 desktop */ \
+	INTEL_VGA_DEVICE(0x0D26, info), /* CRW GT3 mobile */ \
 	INTEL_VGA_DEVICE(0x0D2A, info), /* CRW GT3 server */ \
 	INTEL_VGA_DEVICE(0x0D2B, info), /* CRW GT3 reserved */ \
-	INTEL_VGA_DEVICE(0x0D2E, info), /* CRW GT3 reserved */ \
-	INTEL_VGA_DEVICE(0x0C26, info), /* SDV GT3 mobile */ \
-	INTEL_VGA_DEVICE(0x0D26, info)  /* CRW GT3 mobile */
+	INTEL_VGA_DEVICE(0x0D2E, info)  /* CRW GT3 reserved */
 
 #define INTEL_HSW_IDS(info) \
 	INTEL_HSW_GT1_IDS(info), \
@@ -329,17 +329,20 @@
 	INTEL_VGA_DEVICE(0x22b3, info)
 
 #define INTEL_SKL_ULT_GT1_IDS(info) \
-	INTEL_VGA_DEVICE(0x1906, info) /* ULT GT1 */
+	INTEL_VGA_DEVICE(0x1906, info), /* ULT GT1 */ \
+	INTEL_VGA_DEVICE(0x1913, info)  /* ULT GT1.5 */
 
 #define INTEL_SKL_ULX_GT1_IDS(info) \
-	INTEL_VGA_DEVICE(0x190E, info) /* ULX GT1 */
+	INTEL_VGA_DEVICE(0x190E, info), /* ULX GT1 */ \
+	INTEL_VGA_DEVICE(0x1915, info)  /* ULX GT1.5 */
 
 #define INTEL_SKL_GT1_IDS(info)	\
 	INTEL_SKL_ULT_GT1_IDS(info), \
 	INTEL_SKL_ULX_GT1_IDS(info), \
 	INTEL_VGA_DEVICE(0x1902, info), /* DT  GT1 */ \
+	INTEL_VGA_DEVICE(0x190A, info), /* SRV GT1 */ \
 	INTEL_VGA_DEVICE(0x190B, info), /* Halo GT1 */ \
-	INTEL_VGA_DEVICE(0x190A, info) /* SRV GT1 */
+	INTEL_VGA_DEVICE(0x1917, info)  /* DT  GT1.5 */
 
 #define INTEL_SKL_ULT_GT2_IDS(info) \
 	INTEL_VGA_DEVICE(0x1916, info), /* ULT GT2 */ \
@@ -352,26 +355,26 @@
 	INTEL_SKL_ULT_GT2_IDS(info), \
 	INTEL_SKL_ULX_GT2_IDS(info), \
 	INTEL_VGA_DEVICE(0x1912, info), /* DT  GT2 */ \
-	INTEL_VGA_DEVICE(0x191B, info), /* Halo GT2 */ \
 	INTEL_VGA_DEVICE(0x191A, info), /* SRV GT2 */ \
+	INTEL_VGA_DEVICE(0x191B, info), /* Halo GT2 */ \
 	INTEL_VGA_DEVICE(0x191D, info)  /* WKS GT2 */
 
 #define INTEL_SKL_ULT_GT3_IDS(info) \
-	INTEL_VGA_DEVICE(0x1926, info) /* ULT GT3 */
+	INTEL_VGA_DEVICE(0x1923, info), /* ULT GT3 */ \
+	INTEL_VGA_DEVICE(0x1926, info), /* ULT GT3e */ \
+	INTEL_VGA_DEVICE(0x1927, info)  /* ULT GT3e */
 
 #define INTEL_SKL_GT3_IDS(info) \
 	INTEL_SKL_ULT_GT3_IDS(info), \
-	INTEL_VGA_DEVICE(0x1923, info), /* ULT GT3 */ \
-	INTEL_VGA_DEVICE(0x1927, info), /* ULT GT3 */ \
-	INTEL_VGA_DEVICE(0x192B, info), /* Halo GT3 */ \
-	INTEL_VGA_DEVICE(0x192D, info)  /* SRV GT3 */
+	INTEL_VGA_DEVICE(0x192A, info), /* SRV GT3 */ \
+	INTEL_VGA_DEVICE(0x192B, info), /* Halo GT3e */ \
+	INTEL_VGA_DEVICE(0x192D, info)  /* SRV GT3e */
 
 #define INTEL_SKL_GT4_IDS(info) \
 	INTEL_VGA_DEVICE(0x1932, info), /* DT GT4 */ \
-	INTEL_VGA_DEVICE(0x193B, info), /* Halo GT4 */ \
-	INTEL_VGA_DEVICE(0x193D, info), /* WKS GT4 */ \
-	INTEL_VGA_DEVICE(0x192A, info), /* SRV GT4 */ \
-	INTEL_VGA_DEVICE(0x193A, info)  /* SRV GT4e */
+	INTEL_VGA_DEVICE(0x193A, info), /* SRV GT4e */ \
+	INTEL_VGA_DEVICE(0x193B, info), /* Halo GT4e */ \
+	INTEL_VGA_DEVICE(0x193D, info) /* WKS GT4e */
 
 #define INTEL_SKL_IDS(info)	 \
 	INTEL_SKL_GT1_IDS(info), \
@@ -403,8 +406,8 @@
 	INTEL_KBL_ULX_GT1_IDS(info), \
 	INTEL_VGA_DEVICE(0x5902, info), /* DT  GT1 */ \
 	INTEL_VGA_DEVICE(0x5908, info), /* Halo GT1 */ \
-	INTEL_VGA_DEVICE(0x590B, info), /* Halo GT1 */ \
-	INTEL_VGA_DEVICE(0x590A, info) /* SRV GT1 */
+	INTEL_VGA_DEVICE(0x590A, info), /* SRV GT1 */ \
+	INTEL_VGA_DEVICE(0x590B, info) /* Halo GT1 */
 
 #define INTEL_KBL_ULT_GT2_IDS(info) \
 	INTEL_VGA_DEVICE(0x5916, info), /* ULT GT2 */ \
@@ -416,10 +419,10 @@
 #define INTEL_KBL_GT2_IDS(info)	\
 	INTEL_KBL_ULT_GT2_IDS(info), \
 	INTEL_KBL_ULX_GT2_IDS(info), \
-	INTEL_VGA_DEVICE(0x5917, info), /* Mobile GT2 */ \
 	INTEL_VGA_DEVICE(0x5912, info), /* DT  GT2 */ \
-	INTEL_VGA_DEVICE(0x591B, info), /* Halo GT2 */ \
+	INTEL_VGA_DEVICE(0x5917, info), /* Mobile GT2 */ \
 	INTEL_VGA_DEVICE(0x591A, info), /* SRV GT2 */ \
+	INTEL_VGA_DEVICE(0x591B, info), /* Halo GT2 */ \
 	INTEL_VGA_DEVICE(0x591D, info) /* WKS GT2 */
 
 #define INTEL_KBL_ULT_GT3_IDS(info) \
@@ -444,10 +447,10 @@
 
 /* CML GT1 */
 #define INTEL_CML_GT1_IDS(info)	\
-	INTEL_VGA_DEVICE(0x9BA5, info), \
-	INTEL_VGA_DEVICE(0x9BA8, info), \
+	INTEL_VGA_DEVICE(0x9BA2, info), \
 	INTEL_VGA_DEVICE(0x9BA4, info), \
-	INTEL_VGA_DEVICE(0x9BA2, info)
+	INTEL_VGA_DEVICE(0x9BA5, info), \
+	INTEL_VGA_DEVICE(0x9BA8, info)
 
 #define INTEL_CML_U_GT1_IDS(info) \
 	INTEL_VGA_DEVICE(0x9B21, info), \
@@ -456,11 +459,11 @@
 
 /* CML GT2 */
 #define INTEL_CML_GT2_IDS(info)	\
-	INTEL_VGA_DEVICE(0x9BC5, info), \
-	INTEL_VGA_DEVICE(0x9BC8, info), \
-	INTEL_VGA_DEVICE(0x9BC4, info), \
 	INTEL_VGA_DEVICE(0x9BC2, info), \
+	INTEL_VGA_DEVICE(0x9BC4, info), \
+	INTEL_VGA_DEVICE(0x9BC5, info), \
 	INTEL_VGA_DEVICE(0x9BC6, info), \
+	INTEL_VGA_DEVICE(0x9BC8, info), \
 	INTEL_VGA_DEVICE(0x9BE6, info), \
 	INTEL_VGA_DEVICE(0x9BF6, info)
 
@@ -494,8 +497,8 @@
 	INTEL_VGA_DEVICE(0x3E9C, info)
 
 #define INTEL_CFL_H_GT2_IDS(info) \
-	INTEL_VGA_DEVICE(0x3E9B, info), /* Halo GT2 */ \
-	INTEL_VGA_DEVICE(0x3E94, info)  /* Halo GT2 */
+	INTEL_VGA_DEVICE(0x3E94, info),  /* Halo GT2 */ \
+	INTEL_VGA_DEVICE(0x3E9B, info) /* Halo GT2 */
 
 /* CFL U GT2 */
 #define INTEL_CFL_U_GT2_IDS(info) \
@@ -540,73 +543,81 @@
 
 /* CNL */
 #define INTEL_CNL_PORT_F_IDS(info) \
-	INTEL_VGA_DEVICE(0x5A54, info), \
-	INTEL_VGA_DEVICE(0x5A5C, info), \
 	INTEL_VGA_DEVICE(0x5A44, info), \
-	INTEL_VGA_DEVICE(0x5A4C, info)
+	INTEL_VGA_DEVICE(0x5A4C, info), \
+	INTEL_VGA_DEVICE(0x5A54, info), \
+	INTEL_VGA_DEVICE(0x5A5C, info)
 
 #define INTEL_CNL_IDS(info) \
 	INTEL_CNL_PORT_F_IDS(info), \
-	INTEL_VGA_DEVICE(0x5A51, info), \
-	INTEL_VGA_DEVICE(0x5A59, info), \
+	INTEL_VGA_DEVICE(0x5A40, info), \
 	INTEL_VGA_DEVICE(0x5A41, info), \
-	INTEL_VGA_DEVICE(0x5A49, info), \
-	INTEL_VGA_DEVICE(0x5A52, info), \
-	INTEL_VGA_DEVICE(0x5A5A, info), \
 	INTEL_VGA_DEVICE(0x5A42, info), \
+	INTEL_VGA_DEVICE(0x5A49, info), \
 	INTEL_VGA_DEVICE(0x5A4A, info), \
 	INTEL_VGA_DEVICE(0x5A50, info), \
-	INTEL_VGA_DEVICE(0x5A40, info)
+	INTEL_VGA_DEVICE(0x5A51, info), \
+	INTEL_VGA_DEVICE(0x5A52, info), \
+	INTEL_VGA_DEVICE(0x5A59, info), \
+	INTEL_VGA_DEVICE(0x5A5A, info)
 
 /* ICL */
 #define INTEL_ICL_PORT_F_IDS(info) \
 	INTEL_VGA_DEVICE(0x8A50, info), \
-	INTEL_VGA_DEVICE(0x8A5C, info), \
-	INTEL_VGA_DEVICE(0x8A59, info),	\
-	INTEL_VGA_DEVICE(0x8A58, info),	\
 	INTEL_VGA_DEVICE(0x8A52, info), \
+	INTEL_VGA_DEVICE(0x8A53, info), \
+	INTEL_VGA_DEVICE(0x8A54, info), \
+	INTEL_VGA_DEVICE(0x8A56, info), \
+	INTEL_VGA_DEVICE(0x8A57, info), \
+	INTEL_VGA_DEVICE(0x8A58, info),	\
+	INTEL_VGA_DEVICE(0x8A59, info),	\
 	INTEL_VGA_DEVICE(0x8A5A, info), \
 	INTEL_VGA_DEVICE(0x8A5B, info), \
-	INTEL_VGA_DEVICE(0x8A57, info), \
-	INTEL_VGA_DEVICE(0x8A56, info), \
-	INTEL_VGA_DEVICE(0x8A71, info), \
+	INTEL_VGA_DEVICE(0x8A5C, info), \
 	INTEL_VGA_DEVICE(0x8A70, info), \
-	INTEL_VGA_DEVICE(0x8A53, info), \
-	INTEL_VGA_DEVICE(0x8A54, info)
+	INTEL_VGA_DEVICE(0x8A71, info)
 
 #define INTEL_ICL_11_IDS(info) \
 	INTEL_ICL_PORT_F_IDS(info), \
 	INTEL_VGA_DEVICE(0x8A51, info), \
 	INTEL_VGA_DEVICE(0x8A5D, info)
 
-/* EHL/JSL */
+/* EHL */
 #define INTEL_EHL_IDS(info) \
-	INTEL_VGA_DEVICE(0x4500, info),	\
-	INTEL_VGA_DEVICE(0x4571, info), \
-	INTEL_VGA_DEVICE(0x4551, info), \
 	INTEL_VGA_DEVICE(0x4541, info), \
-	INTEL_VGA_DEVICE(0x4E71, info), \
-	INTEL_VGA_DEVICE(0x4557, info), \
+	INTEL_VGA_DEVICE(0x4551, info), \
 	INTEL_VGA_DEVICE(0x4555, info), \
-	INTEL_VGA_DEVICE(0x4E61, info), \
-	INTEL_VGA_DEVICE(0x4E57, info), \
+	INTEL_VGA_DEVICE(0x4557, info), \
+	INTEL_VGA_DEVICE(0x4571, info)
+
+/* JSL */
+#define INTEL_JSL_IDS(info) \
+	INTEL_VGA_DEVICE(0x4E51, info), \
 	INTEL_VGA_DEVICE(0x4E55, info), \
-	INTEL_VGA_DEVICE(0x4E51, info)
+	INTEL_VGA_DEVICE(0x4E57, info), \
+	INTEL_VGA_DEVICE(0x4E61, info), \
+	INTEL_VGA_DEVICE(0x4E71, info)
 
 /* TGL */
-#define INTEL_TGL_12_IDS(info) \
+#define INTEL_TGL_12_GT1_IDS(info) \
+	INTEL_VGA_DEVICE(0x9A60, info), \
+	INTEL_VGA_DEVICE(0x9A68, info), \
+	INTEL_VGA_DEVICE(0x9A70, info)
+
+#define INTEL_TGL_12_GT2_IDS(info) \
 	INTEL_VGA_DEVICE(0x9A40, info), \
 	INTEL_VGA_DEVICE(0x9A49, info), \
 	INTEL_VGA_DEVICE(0x9A59, info), \
-	INTEL_VGA_DEVICE(0x9A60, info), \
-	INTEL_VGA_DEVICE(0x9A68, info), \
-	INTEL_VGA_DEVICE(0x9A70, info), \
 	INTEL_VGA_DEVICE(0x9A78, info), \
 	INTEL_VGA_DEVICE(0x9AC0, info), \
 	INTEL_VGA_DEVICE(0x9AC9, info), \
 	INTEL_VGA_DEVICE(0x9AD9, info), \
 	INTEL_VGA_DEVICE(0x9AF8, info)
 
+#define INTEL_TGL_12_IDS(info) \
+	INTEL_TGL_12_GT1_IDS(info), \
+	INTEL_TGL_12_GT2_IDS(info)
+
 /* RKL */
 #define INTEL_RKL_IDS(info) \
 	INTEL_VGA_DEVICE(0x4C80, info), \
@@ -618,6 +629,20 @@
 
 /* DG1 */
 #define INTEL_DG1_IDS(info) \
-	INTEL_VGA_DEVICE(0x4905, info)
+	INTEL_VGA_DEVICE(0x4905, info), \
+	INTEL_VGA_DEVICE(0x4906, info), \
+	INTEL_VGA_DEVICE(0x4907, info), \
+	INTEL_VGA_DEVICE(0x4908, info)
+
+/* ADL-S */
+#define INTEL_ADLS_IDS(info) \
+	INTEL_VGA_DEVICE(0x4680, info), \
+	INTEL_VGA_DEVICE(0x4681, info), \
+	INTEL_VGA_DEVICE(0x4682, info), \
+	INTEL_VGA_DEVICE(0x4683, info), \
+	INTEL_VGA_DEVICE(0x4690, info), \
+	INTEL_VGA_DEVICE(0x4691, info), \
+	INTEL_VGA_DEVICE(0x4692, info), \
+	INTEL_VGA_DEVICE(0x4693, info)
 
 #endif /* _I915_PCIIDS_H */
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
