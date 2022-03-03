Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77A4CC4B6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1790E10E2DF;
	Thu,  3 Mar 2022 18:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8645910E2DF;
 Thu,  3 Mar 2022 18:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646331044; x=1677867044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0zpW5I8VBVh5I97TA8yzzUAQStOlssMkQN1WkuDg3vI=;
 b=MvoZz3gdOD0qbSM80fpAwiUWSlHC3N1RqQiXqf6k1O/tRcKhRiaoEBel
 oLs3/75sOvh2PSmJVW9NVV88Zow2/Rxb9V/Slm/iR06R6XycL0nWh0ytL
 sweGUlwG34sE+5aBUOylKYMepljoorbvLjhsPbzKtbQ/zJvfeS+RsDSSv
 T+GVWq9DCJVdgcu248OMwcWcMgWVY652/xDsX7SzYhWmIfqvR+bjVI1F1
 2C5zmOOUUTKvZ8FeH2XXDpuGednVTwvefSbYKc9onCeSwtcLIbtWGsfOE
 gzjrsXiKU/0hepEGIjI+geESop86ULFWzQN2ComOBGaJywyJxvI7dgsfs A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="241182035"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="241182035"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 09:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="630879382"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Mar 2022 09:59:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 09:59:31 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1mrSVhm8UQECAXpVrdocErcayu5a9HOoGjr73i0cj3QlVQNIJQjXWAvdWL8qJ54wtrKg5OVx8soFTTRw2RLSY72i9jOKvJ2OA9o3hDLYYcNU0yjANIJ417UDwnYdf0FVsd+X3ObURX8rvKYx+kQv88wjMD/Pt4G59Qy6FZ2JgRajyMABCzBoe8q/Ie5NMvZlND9c6O3xtBguMh1ZKo4DBCmzf0UxgAuMFBNBrQNv/TN28njmZRhcS+3Fn6kxvtDahRwBpzS8wYkPk7RVZU+ruPVlRHDTL8zNwaMWMpjOLG8Oa4HoUnXNMKiMSBpxgZoZhLc7su4fymcz3r+0H8+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUr83TSIBgXMiyFTM1aqKiygP/UN91aaYvGJIOhNLZI=;
 b=Y6xiNb9hBflbvLpyxxBvIvAXWHKF5/VZNleqvl503c5Lomtfdu7tvWjVPGXuqFmjJ6ck+OedXyT3f+tCn4d3HCp5Kl4R7hWIvBAV+vb/ecx2FjXwnvDo1FbFI0YG8r924s1zkxfU+EgjC7XAJorRGklaEDHEp2e139Yhc2mk7VtS8u4gKutECm4+F8tcY3+tDUZpTczessTcUfzMjhNsg7c50Q1UPDq3pZKuQy0xqpJLbCAJuIsZtK+STgiKd/2BrQGVkVCOOGpjr4oJhEdkn0v0snI/qGtPjhQG6KSMcDfXkI0+u1/vNWVq0Q3+Qgiouje+XW5DLyzf6QWCZYslZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM5PR11MB1244.namprd11.prod.outlook.com (2603:10b6:3:13::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 17:59:27 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:59:27 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 5/7] drm/i915/selftests: use the memcpy_from_wc call from
 the drm
Date: Thu, 3 Mar 2022 23:30:11 +0530
Message-ID: <20220303180013.512219-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0001.apcprd06.prod.outlook.com (2603:1096:3::11)
 To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1175f0f-1f3b-49e2-4ee6-08d9fd3f8ef8
X-MS-TrafficTypeDiagnostic: DM5PR11MB1244:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB1244BEF0C1B7AB29A66F6AA79F049@DM5PR11MB1244.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N8mX0Sb/CMuEJnn3BRBKdFYo0gbiN3r83aGP+FVXCBgFvoYcZvu6uk+HPT1F0oI+n2hLlQfMNDazslByhzNrMaJHA84dxIYv5wdnlsmwX10v6CIUXBpn1lOUizN2X6z/bDbRkpSMqQ79NVO34ImsKrB2HL3iscIaazvjT/+QQuv4swzWUnyn8X0ktZMTwFu4C2dn1hhKvEW8otlY27gf3HiQawaMVOiod9ZFJigtXdf2GMl0CiLwj7f74dbiDs+aCxpeDom4JOmbhpgQaarKuw7jdqqdnIhgWpbxUk//AJ57QVDH22C6vR77PYN+pIcqcrJR//xAL3sqwgHHwwIH9nunnqSc7hO65aTPn7OdZasmuCuVypqkH8MS15ynq+uH5MuDk0kLx3WYJdkZmG/frvJbFNydi+fLQ1RmZnIJsMbQEOL6xJuv9MQdtw/LM/ISWeROXYQtcQvyquElwi7LwpUeMk5IJI9muttiz9h1zHS0kaWzpW0o8OBVk+R8+q/X8kttyefegbIwdc7uuGx32wfGEuhmCmE4IqFo0z3uezjqMNlGeTdthDBgrBVTECzc0M8Oooul+l6EquqYF21s5OetaiDACfeHznB18/MAL7bOVKZJL/egs4oZ9MVa/EahnFMXmIZB0PLTRuMMFGJkG7NBSZMzesBEnxU28cHL3rx57fCeTSMDOmISrkXiq9WwUDmdBPc6KoMIcEXAxFUuTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(38100700002)(66946007)(66556008)(6666004)(66476007)(8676002)(82960400001)(86362001)(4326008)(54906003)(83380400001)(43170500006)(36756003)(6506007)(1076003)(2616005)(5660300002)(2906002)(6512007)(44832011)(186003)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cGlN0rLEGPqtl9pW4eoo8Kx4GrCzQDqd1/0ZFhJGkbpRy+mI8qW74sv//LKR?=
 =?us-ascii?Q?qQ0Hqswk99mzm5w7z6l8yAk3M1sYRmyJWHPJsVlpgoZAbFbSREiGODeyBNNU?=
 =?us-ascii?Q?DEZgfbD7RbJ16VJbQlc8iceW4O/+P7BY9dg55EDXNv4jBJT5+7OCHt7uqkl1?=
 =?us-ascii?Q?PaSLjHPGPIbPS89drRQ38gxAACmmTzJYfUPLb8MNDCfoYFbEqpIuY1t8WUJM?=
 =?us-ascii?Q?oRlIrYfTtJqthslm95NPwrfy2wlhF5HXtszLhTqbm9P0oGsjbHkcKlFBiDxW?=
 =?us-ascii?Q?/MOfPAiuJtX+pWW+ig4z4FPJSMr2E98LeD9ljJbjr/oipNcLqtd6KTv3T+CV?=
 =?us-ascii?Q?8bKk1tPxYmxEQgQbRz5hMeHJ8PzIFMp3DfMcBUULLxUV2Fbd3sj7d3LtZd1A?=
 =?us-ascii?Q?zyY5bUM+3nWIZV5hjGIZ3kRl1POgswk/SAPtfYtL8KfRLdizYbTgy4bcCxuu?=
 =?us-ascii?Q?pNzZ72HmznfJ3HSxCAIr1FYu+QlOZ9wRcG1OroFACUO6M4g1SrNFOa7ON+FV?=
 =?us-ascii?Q?bmjzbVqFcxK75Uk1HPyGKxWJ38+a9T/VI+9nT7fZEx49v15X1GN0oGmOhip4?=
 =?us-ascii?Q?9qOhUJrBR2iMM/uGxe5JFjmcTMrXUrIJHIvxouw1rpRF8u3PCQOLbTEuK8mX?=
 =?us-ascii?Q?ynVayL89RU6obB3lDqcDCvPTDJmDXCOWrp39e+Sv9H4AoIIu17++tSErAkkH?=
 =?us-ascii?Q?/cMA3D7bemwt6VtW2CA91lKinsreIOSYt3ikWsAIfSx5hXXXP+ooxuco3Vjj?=
 =?us-ascii?Q?c5bcEg5wh23MPRO8u+A2rmiaf851xBIre0uAG1KNpwYlrIRo7oFyXoevgx78?=
 =?us-ascii?Q?u5O9Cf/qoueV0rgEDuphGjYMiQoS8BblBzycWFGRVRH9wj9X+NfiCx0Uqier?=
 =?us-ascii?Q?vVxQ5PzrDIGm8Re8lGSuCk0WBej06AIcKnvh+9spPVPyAIeZDfCyhTbj4TWj?=
 =?us-ascii?Q?S9BGRZA6hI2CMJGKEuJsY6Y9ilFB6vl5qf+mcXfDbl8TO/hzt2vStkGxfJML?=
 =?us-ascii?Q?JJe+xqARLRtraYWXSd/YkXt1wRtC6MUHnOdQbU3TNLUyjRkooeyNuxTmlDRn?=
 =?us-ascii?Q?tYdLi+4jcLpdRYDsqPRwW/+brRqMsb6RROYYTAci44P1nJI/BXyDeR8nNFYf?=
 =?us-ascii?Q?Nc3qTSPuUXHxhXxONGtH/6tOTyJpIid0SyPL3kFYlUpCYvTSTSpmmPLG5690?=
 =?us-ascii?Q?gq29F0DFh2SZt6NsGCyaTVyZG6/GS4VLnreZzc3QrGBYbqlZYKhAZEXFrL5T?=
 =?us-ascii?Q?mHCOgX9MQzE8VtgIFjtVlCLoNJQV275PiXVf2+c/no63UdYJhB3aR51UtcQN?=
 =?us-ascii?Q?B9rayjqQrIxW1/E25g9TOJoeEE3Gnr4n7J8yktge3TaO7HCcKPe7dZKGUXWb?=
 =?us-ascii?Q?W01ByRAjOKQOsfQb1sV5LwcUwxfQNQjWta5YU+fAWumopgFF9OwApR1X+XF4?=
 =?us-ascii?Q?SE0aApLWf7nT9UY3JTmB165RHqcYKGFj/uXmychmtLzMfOEXzsIm3LkdwhZm?=
 =?us-ascii?Q?3+rl/f0aB/UcpNKjxXkEkg/fQtEyTEDoTadHYfX2XZ90awsjoQygqQAURoaM?=
 =?us-ascii?Q?CjoYLJvNmjH07XATbcduN+NZE4LJTPEgfnxmHdszpQ4f+VOuFQZC4lL4xrIu?=
 =?us-ascii?Q?zOOGuwnvemNlmtNdVqCyAzcNAvuZB7+6kwMwUfbPX+Nwbx2UroKVR67eDvSZ?=
 =?us-ascii?Q?FUbY/l35N3aNjXgeVYAD0H8tTcEWrAk5hg4DwpcF95UKetsHZBJ94o1xsCi/?=
 =?us-ascii?Q?mjgtgT4LiQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1175f0f-1f3b-49e2-4ee6-08d9fd3f8ef8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:59:27.4446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiOdEEqVwf5RXgqokEaYr4GMFcVpKTs6EjzgvDp+ftC+s4t/gnX/m1EELoQJ1cyA7wc0LNGZvzE60ilQTaPZyANQ00WFpNsMKmydi2Y2mxGZ+xh5Gg7VFwqAta6mo/+k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1244
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
 michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 siva.mullati@intel.com, Matthew Auld <matthew.auld@intel.com>
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

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 .../drm/i915/selftests/intel_memory_region.c  | 41 +++++++++++++------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index ba32893e0873..d16ecb905f3b 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -7,6 +7,7 @@
 #include <linux/sort.h>
 
 #include <drm/drm_buddy.h>
+#include <drm/drm_cache.h>
 
 #include "../i915_selftest.h"
 
@@ -1133,7 +1134,7 @@ static const char *repr_type(u32 type)
 
 static struct drm_i915_gem_object *
 create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
-			  void **out_addr)
+			  struct iosys_map *out_addr)
 {
 	struct drm_i915_gem_object *obj;
 	void *addr;
@@ -1153,7 +1154,11 @@ create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
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
 
@@ -1164,24 +1169,33 @@ static int wrap_ktime_compare(const void *A, const void *B)
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
@@ -1191,7 +1205,8 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
 	struct drm_i915_private *i915 = src_mr->i915;
 	const struct {
 		const char *name;
-		void (*copy)(void *dst, const void *src, size_t size);
+		void (*copy)(struct iosys_map *dst, struct iosys_map *src,
+			     size_t size);
 		bool skip;
 	} tests[] = {
 		{
@@ -1205,11 +1220,11 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
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
 
@@ -1237,7 +1252,7 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
 
 			t0 = ktime_get();
 
-			tests[i].copy(dst_addr, src_addr, size);
+			tests[i].copy(&dst_addr, &src_addr, size);
 
 			t1 = ktime_get();
 			t[pass] = ktime_sub(t1, t0);
-- 
2.25.1

