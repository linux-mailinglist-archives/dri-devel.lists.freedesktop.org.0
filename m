Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4416510481
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AFA10E8C5;
	Tue, 26 Apr 2022 16:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF29510E8C5;
 Tue, 26 Apr 2022 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991823; x=1682527823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kp9f1K84DUS2EQcnbOmchQ5uEL8S409tuqqTioPZs9Q=;
 b=U6iVr6fG+QwWfBjH71PQRROMjkRge1jm6DMOimb7Z0hzl6I9+6sntuMj
 ViNAQJp/YSmBFOBA0wLm9+glB1LhLxLaPViRAO5jsQt5/K75WSmYxfBh1
 QtFmthLFFqvIrsqpN19YXcEiUiw8Dt9CnYXUwfCVwwWNA1DVGfEiq5cCU
 2rdL0u2XIG1xW7pKjFSVvzxqeX/4+Nim5AzIAW8XRZbqx84F3WRHX6F6a
 KwnXf8Se715/cPdlIgTYfjQQrTBacDsZVlj4DEpyoMqqDh8DqEio3ppTB
 a6BEEfDl6FVW4X0CKGA2nuOkZjTaMslxYv3rdc2uyLFl1On3WQ4ZRSmQ+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="246216736"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="246216736"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="617085581"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2022 09:50:13 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:50:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip3g2sxpJCIKyYpXCxJUl9r8SXLleH44KNgA94MbUcRfEB6mPqChNZ19eNbUxVufLsKUTU2hM1ZulBW5V1XsP0+HQ0Setjnl+Lg8kJJy5FcfkHHYx5dlC2y/XB44D/nOx44/s54YhDJBAhUdZ4b/vAsfztmCCwkv9Jd47zMT5/RGUMjaZ90uXi7FqVULY5HAq0XPGqRChHx9eALeaGVk3e4dAoWEckUffZHMzMQSBrwavj6VhZ8WP1PyF0rOdZudtUy4qexY8KCbWmq1eF/uBGxdMjIIFeYC0DPNi++cnZYKHQl1T+s6XataU1h22gniH3bKhmNTrgDFq1G3wEe8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrEShwNQQEkIHmiF3bdcCy5SeqDf+wQB9nQGIXfGjUM=;
 b=d6qH940hFM5+oaw23RtmpLch1T9FfY5BAVQr3P1xA4N7Zcc6dL6yXn0u7tVva3qtOrVUy+Jo3/6DTKhIpRPrxmhIANk4L2hnY3/sEIeuCHEzyR1PVDX8Bgcb2m1dOUHNjE8Qt59dzEXLDZ3U5lZUMxONQ4mFb3j/A1lfu8vzmaJ0n2MrPcpT/PHx3/RJaObEt+iHmHM/HcFfGus8jbUXme/hKDJMmZpCq5q0s+uRzI+/HepwmJKpr2JGMgIPEyEZBal9HicKwhH8OPxWOYCfRTNTI5HMJu2NuQyc+1CUJf6RYSZiuQxKGSQUb+J25lvkHokSKzCc8qkZMbFS5ir52w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM6PR11MB3658.namprd11.prod.outlook.com (2603:10b6:5:142::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:50:10 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:50:10 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 5/7] drm/i915/selftests: use the memcpy_from_wc call from
 the drm
Date: Tue, 26 Apr 2022 22:21:46 +0530
Message-ID: <20220426165148.1784-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::7) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da8a7784-ebfa-4def-e702-08da27a4d372
X-MS-TrafficTypeDiagnostic: DM6PR11MB3658:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtFwd,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3658830B2E49B3A89D75A9759FFB9@DM6PR11MB3658.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AUpIT/ndc79z+bWDVvVYYA0byr7foGE0TgQbkW38D+eWqXFXLSjp//RoR9xZgkTNeT9LL5VF89MvDrn0LPZoqVoHqb0LRnj7wiqtNpW8Mcgl9hOY05tM2hu1QX2njaDKmUza99K3yACZYN/GfUHMoYHqj/7375YwS4T9q2GDJFG9y50dCXa6GwRJWXAG6CxJAuDZcBgSRPyJ25qHlPl/jqcQowIPWRf9Wfzy7wETStB37FVQF2lZjAVIgzM+M5Vl9o2bvArdEHIwoLSvRorhNLtc1HNKkixY5zkBI1ScBgHtzDEz+D1AqPQ+/Z9bAq1AbxFuKQQOqh84bmrjErGVI0L1pz6JnZgfoiMHfqzi6Jjw7GSXws+iDFyUEjKpigyMIx9f57Tz+82WllC0qgx+WefixKv1DNXBMKaQZbttVeIwoZERyNrBLorF2c9zFCfsypyR9bNpZi3kdeQVhTHt0Xz8fAv9a0leuEk+o/OrqXxUAN05AsZwlsy8XYse87H6ZZzmTAFam7Y/4E2UE5cVP/HkJkkfjDmSyZbwZn0O86OgeLczJf28By3XZPrbclccYA+Zb2pp7dqHyWKmltON0sMhAE+IDl1QIZxOk6qAWd9NL9BuRBsizD07pfk2IFJiLJHb7h2Vws7+nJzmih9TIafouU4jxXP+fZjR7XE+rbYU7M1t3IJV4NpAK2GRomQjS7skQBuhlG85Jq+QbciJhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(6506007)(6512007)(186003)(83380400001)(1076003)(2616005)(2906002)(316002)(54906003)(86362001)(82960400001)(36756003)(6486002)(43170500006)(508600001)(5660300002)(44832011)(4326008)(26005)(66556008)(8936002)(38100700002)(66476007)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hpof4k0YfHjs4atVuOCCDHY2k6bEqdXPl9xksMYKO3mTOz26wruKtbkO3127?=
 =?us-ascii?Q?ckm9ZqGbLD/5tOzxRzx2fbfk15hhEJ0iV1e08UyfOffLl79tTy+9ojLmBqmF?=
 =?us-ascii?Q?bgLXprH1hZwFAGZGKZUL0LJIxeYyOIK14yKnnVr6mUhsT7aPqjRyeJy4Ex8Z?=
 =?us-ascii?Q?TTzsFsyEC68PI4um6eO4mEE4KBMGL/BsRCp5M6CovQvZjvce0ExWw7pEBgy8?=
 =?us-ascii?Q?eppyq4KRTI3aW5UEoA7gaK+Mj6xTxg9wr04zM6/laIOWWWXKidNO8TyPI4Oy?=
 =?us-ascii?Q?yYHIGxLhFvvSYMWsjRlfwF1uCgyJkT1j4ZnrSZ4ov0Z9XjX5gS3Gk78DWuZz?=
 =?us-ascii?Q?DLWxEX4Ag3LjrGnHmWv8XM2B8MPx7sSOZImgbr/wkcRTCFQM46DHs8CrX2vi?=
 =?us-ascii?Q?k5F7pgr0rLhlveW3n6HjmMx1inxgcnq4CuULdVSDcvJYkys65cTndi2akJqe?=
 =?us-ascii?Q?1IzKrr2vgf4h3SCoMacFj/gzNHtzsJKYaHAWo4HhUqrViSdVPEcM49+m0C3P?=
 =?us-ascii?Q?9wXZN+zr19ZeO5JzHgltTWGuI/pnh505df2VXPKf1cGEa+IxB+fWCaeHbm9M?=
 =?us-ascii?Q?hFLbQ2cWCL085heT219Dr9NiaNxXQzUniF3VFYB5Hc148HpIcV/RkDVEtULM?=
 =?us-ascii?Q?d3nWwLVgyPhdlX7BSpJxQYEs+m7rugvw5O1+OLdeZ1jqSSVDNnyloHw3/N43?=
 =?us-ascii?Q?7KWbsqrC02tPxtYOc7A4w9Oy4zQr+4KvrOV0DXhNF1ITfll7/AUfMucCN2Hg?=
 =?us-ascii?Q?CpaqfWpK2avZ4E7PfKyc+3p2uBjSPumqF0Smco9OEN+rMjVOUD6OwMn1Ok6p?=
 =?us-ascii?Q?Rv3w5wVKszEXiYW1Bf/heRpyFhsK/xpRKRwfEmoOUVAv30XTrwRtK2RM+igA?=
 =?us-ascii?Q?IngAsJEDr3EaIlgmmO3slfz+FpDrWStpGPTm5AXAB3WOlzLTLzhbTSkBGRGN?=
 =?us-ascii?Q?tfNsmSDnXpgYu1YcAsmpJCz5c104twEndwz18hbIMKYuOzEOYw8IxHt2e2Wq?=
 =?us-ascii?Q?kdc4i0n4lxVWFh8ZnSQATAzlIrx8Ays/8g5rgwre6WK7nPAZRceaBJqbOf2s?=
 =?us-ascii?Q?VbCs3GINp6gGgqyZp7evln8GOt36dYULmf+j6JcFNfa5CRWtWE9zTamA46pF?=
 =?us-ascii?Q?DMrpDzmZ9NKmKZqIpWYReQOSoUO2JEaH/EvAF177FfuYAkS1OozxB6KxA7aK?=
 =?us-ascii?Q?a7pYbvFhJJMjL1tuYiK1CNlHFQ10eH+4ugU2YrLTDAZ078juv/izAaJB4mQS?=
 =?us-ascii?Q?u9hx6IM+wHLIpyCO+KTR32wMtRPnN17QUxoVWwkMeWAZfSVOFMoDrdV9ejMK?=
 =?us-ascii?Q?xfnjD5Kagb37XE/FrUJJc6MHPoKVDNy1F2+qKeoY/vV+rXmI0ouR5qyd83FC?=
 =?us-ascii?Q?7NiQSVHgWpAgS86J5JiLTd79enUBBUTWzz0yR02xiBHOZLHIFXJ2qE2MO25j?=
 =?us-ascii?Q?55cItPv7s7Jd744buuoxOcHGVkAMnYhevkK9WVEMZS6927Vpyi20kJljZWGx?=
 =?us-ascii?Q?AtxS9JvcLYae7FgF4PpQZB872mIMU7KnsiJTSds206HucWdrrOJN0d7AKbfQ?=
 =?us-ascii?Q?GKBLcw8YTG+i4GVCWvJ6excBKHpyh30o27HeFw1dqK3SA5X2dKeSRf1tD5yl?=
 =?us-ascii?Q?RPGZoQ+VgHZdzC15qmbxSUjiEdIOu5J9T+B1CXL1asYl3Wg/c2GIy3H88SWS?=
 =?us-ascii?Q?wmiUHODl0vMWJ5h8P1Muw/CN/p4oIBv5dKiJU+z/GzubuRyMfVpOB9tyqYN0?=
 =?us-ascii?Q?gwjZVBIwdjh8xv8DYPHczHMghDCRwNcSAUSrzMn4l/cTFLwNQHG0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da8a7784-ebfa-4def-e702-08da27a4d372
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:50:10.3082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/+9itxgz2Z5ZuZ6gmFqjIdmGRoY2CGmKbSPCatmUzDRTiMyPkjBEjN/17JWgNXXgeS5PJUhDaXW02cpUk+PV/QbDACFrBPwzWSM1Lu9B9U/GWfGTbtnyVafk4/svtcA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3658
X-OriginatorOrg: intel.com
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, lucas.demarchi@intel.com,
 siva.mullati@intel.com, Matthew Auld <matthew.auld@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
by the implementation in drm_cache.c.
Updated to use the functions provided by drm_cache.c.

v2: check if the source and destination memory address is from local
    memory or system memory and initialize the iosys_map accordingly
    (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 .../drm/i915/selftests/intel_memory_region.c  | 41 +++++++++++++------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 73eb53edb8de..420210c20ad5 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -7,6 +7,7 @@
 #include <linux/sort.h>
 
 #include <drm/drm_buddy.h>
+#include <drm/drm_cache.h>
 
 #include "../i915_selftest.h"
 
@@ -1141,7 +1142,7 @@ static const char *repr_type(u32 type)
 
 static struct drm_i915_gem_object *
 create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
-			  void **out_addr)
+			  struct iosys_map *out_addr)
 {
 	struct drm_i915_gem_object *obj;
 	void *addr;
@@ -1161,7 +1162,11 @@ create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
 		return addr;
 	}
 
-	*out_addr = addr;
+	if (i915_gem_object_is_lmem(obj))
+		iosys_map_set_vaddr_iomem(out_addr, (void __iomem *)addr);
+	else
+		iosys_map_set_vaddr(out_addr, addr);
+
 	return obj;
 }
 
@@ -1172,24 +1177,33 @@ static int wrap_ktime_compare(const void *A, const void *B)
 	return ktime_compare(*a, *b);
 }
 
-static void igt_memcpy_long(void *dst, const void *src, size_t size)
+static void igt_memcpy_long(struct iosys_map *dst, struct iosys_map *src,
+			    size_t size)
 {
-	unsigned long *tmp = dst;
-	const unsigned long *s = src;
+	unsigned long *tmp = dst->is_iomem ?
+				(unsigned long __force *)dst->vaddr_iomem :
+				dst->vaddr;
+	const unsigned long *s = src->is_iomem ?
+				(unsigned long __force *)src->vaddr_iomem :
+				src->vaddr;
 
 	size = size / sizeof(unsigned long);
 	while (size--)
 		*tmp++ = *s++;
 }
 
-static inline void igt_memcpy(void *dst, const void *src, size_t size)
+static inline void igt_memcpy(struct iosys_map *dst, struct iosys_map *src,
+			      size_t size)
 {
-	memcpy(dst, src, size);
+	memcpy(dst->is_iomem ? (void __force *)dst->vaddr_iomem : dst->vaddr,
+	       src->is_iomem ? (void __force *)src->vaddr_iomem : src->vaddr,
+	       size);
 }
 
-static inline void igt_memcpy_from_wc(void *dst, const void *src, size_t size)
+static inline void igt_memcpy_from_wc(struct iosys_map *dst, struct iosys_map *src,
+				      size_t size)
 {
-	i915_memcpy_from_wc(dst, src, size);
+	drm_memcpy_from_wc(dst, src, size);
 }
 
 static int _perf_memcpy(struct intel_memory_region *src_mr,
@@ -1199,7 +1213,8 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
 	struct drm_i915_private *i915 = src_mr->i915;
 	const struct {
 		const char *name;
-		void (*copy)(void *dst, const void *src, size_t size);
+		void (*copy)(struct iosys_map *dst, struct iosys_map *src,
+			     size_t size);
 		bool skip;
 	} tests[] = {
 		{
@@ -1213,11 +1228,11 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
 		{
 			"memcpy_from_wc",
 			igt_memcpy_from_wc,
-			!i915_has_memcpy_from_wc(),
+			!drm_memcpy_fastcopy_supported(),
 		},
 	};
 	struct drm_i915_gem_object *src, *dst;
-	void *src_addr, *dst_addr;
+	struct iosys_map src_addr, dst_addr;
 	int ret = 0;
 	int i;
 
@@ -1245,7 +1260,7 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
 
 			t0 = ktime_get();
 
-			tests[i].copy(dst_addr, src_addr, size);
+			tests[i].copy(&dst_addr, &src_addr, size);
 
 			t1 = ktime_get();
 			t[pass] = ktime_sub(t1, t0);
-- 
2.25.1

