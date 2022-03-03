Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDDA4CC4C4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D58F10EB50;
	Thu,  3 Mar 2022 18:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F12A10E303;
 Thu,  3 Mar 2022 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646331115; x=1677867115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qTJQJ710YTKIuHN3NBYyrEEJW+TKEb9fFOKa53hnfCc=;
 b=jficyyMY7KvhASpimU84Ho/CmZWY6vbEWflcZP4ySynqRWRmcmLAuPZe
 F+p4WRVPqGItToeQYiIWTYL59wOdBWOUrk3pgvRCsrJ+PkhGKshjY6TuV
 JibZMgDWmruXfZyJzCktPa/nBsUdsPhLB2wPu2j+BNny5CtPR/NlaNWTe
 R1kkgaodtFcM1pTterbc6eLgWToU7BeFacNDkS1gD/4eyValNUsKJHy0j
 uivHWbSeT3YKNF9o21PbRZ3w2EtHWOIwW4ngc9pJpPmCTpfcKEJnSKPX+
 D/A+zRa75QcCm33uIxj+HWqj3uwH2hE2K8Tz1kZ56akZFJZ/cqzALAlI2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233724220"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="233724220"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 09:59:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="809779373"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 03 Mar 2022 09:59:17 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 09:59:16 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSZVrqC4nBfSQCHf+UsDm4xu4Bm/dm/tUR1i6SxioS1GmI6jK+53cqtvqUUEj4B70F/bHnu57tkx/ZdJiH0RKh+7PtAT6bYDytJrzjVYHWuMGVYw1cF6tyXKtZ/e0UKAzpqcBApMU1jg+LBJa0wRe/ccuyBwzl0MysSgCbx6SarAh614a02LOAANjSR6A9kAlqHlJJX3W1f7G0srEp9CCLLkoJz8qvCTcoeR+rsPRNDDNgDVfR6smsTNkCKzX9OqF7NSY9giGsBJNwL72Z5L9r1as1xwU3R2HlGoe/LzqzHSpF1nK0/Z3N6eKwT2j5CkWDhH61VnBl4wUitHZzzf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XbGA0N5K1TgLHXMorTLj+9Me8m/AnpOweQjLjKuon0=;
 b=YTqpuJVsy3n/htg0ZTjF5DbABhL88q/UiW6AXtf9e5lVAM4ux91f8wvbqmBc/SEgjlXqgxvtKTjWRs7h8CVyQpW2EMwyV3EOsrUeBv+/aAKIMxd+WPHiyIpLoFObyuv5bmmW0gF7uW5hFmoGG5xjUCrxsKON+mQ3pHqkd71/zrN4rfDQnSloikNWe4xlHnwQbpf73qBZPt2uhbaldjyqGO++aod7cYbwc9vDISoFzySOM3udzu+Wqv+OGGogI08HQVidexRFyyaeOBiVytYCpGA/UFv4MXZ8OgdKesZH3FfAOU5i7//DiTm04LEFzO/ibOA1C8OEhzULiCwwhKQDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM5PR11MB1244.namprd11.prod.outlook.com (2603:10b6:3:13::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 17:59:14 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:59:14 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/7] drm/i915: use the memcpy_from_wc call from the drm
Date: Thu, 3 Mar 2022 23:30:09 +0530
Message-ID: <20220303180013.512219-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0153.apcprd06.prod.outlook.com
 (2603:1096:1:1f::31) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aef690b-afde-4e81-e790-08d9fd3f872f
X-MS-TrafficTypeDiagnostic: DM5PR11MB1244:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB12443455ABA7BDF9A37E62309F049@DM5PR11MB1244.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXbye5NXkpThz7d0tyTjEmHT9BVgfLvvSi8a9jJnJTERyR5uiNe34wgY+LXixLpfbafUjc1HWVEt0799N5dIZcJPDpk11Tx9kxSsvFpq5Ovn0GMr/01/KsQkqOMZ5lExvTEc1fnArQ7ujoqULH1VNTXLIfKFu69uj8iMNxhAMhoNy6eZ+pXjXKGIeDvQUomfhGadGkuUYTswrPfx1qtU4UkF9QmoVWtQftEW201shkRyy7ja4s5r2yScUEe7IAiPWxlZTR4HZBVCVfeTR+csHCh5KBah875b8YCd/5TfGTgKprZhCuAWyUfcVOqRu6dGW4H1rHrsZyjW00Ol4tZLVDZODFs1OdWIKHkor8BDyH5YL1szMT3+5ZG/ys9DjNeoWtZ/cjGdJDZwc7enO5AGoGo4TQ/nPYxzYzGFX/LOxvgfqLYTLzl5d7qIKkeigdeeRi05uKLTP1lc1LqphjH6JixNwtYSBtdtPXW/+kqv2xBYh9/osTL7x3jsT8vHbLtVYR2+09v0vgyd4HQmmL+xgYuWVoBj15ClcOSdGz1kJw+mwjgyxCe+AGpGRJMd51UCHRgQBKxrUUewCD0fPiZor5f0MIuXFsNq80dyHjFWjn3QFlv4zy9OCe38fBlyonea36eM+TD1WRUfUUzU821ZLKV2owWQtpAspjFKr25b8fuozi7CkfR+KoBnJK7yjwTv+DGpRmW/5nTnQ1gx118cBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(38100700002)(66946007)(66556008)(6666004)(450100002)(66476007)(8676002)(82960400001)(86362001)(4326008)(83380400001)(43170500006)(36756003)(6506007)(107886003)(1076003)(2616005)(5660300002)(2906002)(6512007)(44832011)(186003)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K0HGaA/D709e76sQGn5l2X/GeVoqo1f/Y4Q4CiCvvd18yzwE+nl2988Lt/GY?=
 =?us-ascii?Q?r035UVzBJlGscYMndP5tKzN+Wx80Q5rRqCv9W8p058fQ2s5K32HASOGvXGmE?=
 =?us-ascii?Q?6DRDeXJsDY7YqRMV+0N31063aOQd8NQ0GOJNDsqf2GDGJcAVfpe+e73w6TPc?=
 =?us-ascii?Q?pH06iFHbirUWMGdeAdDfjCS4F2+OIbbZu+w7DnP7tDg6J+BpkhHgUanBVSLy?=
 =?us-ascii?Q?HqwBoIt2aEYvYJDtm7feLfkcGhqRe0c2vtT2YrBINz9LhO3bhRV8w4hX27EE?=
 =?us-ascii?Q?f8jzA0OkdcdeMSgelixD0bSa17OsVOI8w4qxFJPzv/AyG2KxZpavtC9QJQOz?=
 =?us-ascii?Q?wNN7cj5Y43fkd0qu6yIBMUiSqXTTLiYtwaTn6CdmQE5h7eT6FsfpCA7B6J4n?=
 =?us-ascii?Q?+l6JWlxBWFqsbnQOnJ7TKGwp+Lw9kCBhUPchxYqxtcF44AeThmnIv+vKKv8V?=
 =?us-ascii?Q?rz3dzXTFRNZYXkOh2lKNbOXzf1HjZ++C/M012uO6K10aE2W0Ty23MfP+5if9?=
 =?us-ascii?Q?37SmjQkj92nJcZ1OScaBNZakBMS1K5+ya0jibnErY3mv104wXidchF4LARYA?=
 =?us-ascii?Q?9qp+0EZ/bNFAguCbhDtIG+5jwaFjS+hI4ABVSNsUCCvGpFcyXSjP97gcjM1R?=
 =?us-ascii?Q?/vjpu0ikxvInbJggxPkKnXiGJ35l6R8LnzcoTexFw7PrASpaTTfJupnPM/vP?=
 =?us-ascii?Q?8B1iRKRCGEcDLVDBXW+0ipq7hv1EdVF0XZJJZY3hRo//LFbvvNJOnuY1E6Gt?=
 =?us-ascii?Q?9xslkBR5JrmaXQxn7xlVq34tF9O369IgRkrR97rCm4dG+1G9Hh7oxk1bQvT6?=
 =?us-ascii?Q?Qb71uwPDKnkqzl+wj6GLxewoFmQSFys+0ZfEtqoEpVHnP7JGxU3WQ7m8KQMP?=
 =?us-ascii?Q?JX8u60P6v1BpP4WL31vKtYPqSk/KxmMd4b8n7Ty8gBwmivxxCTLOn+066ltJ?=
 =?us-ascii?Q?qMogFlgSWJr/JCVdZe5jwaV56Svm6GHjq2EmSDGOm6McWJL4PVZPbFYGnNUb?=
 =?us-ascii?Q?QBKStn0uvOWL49WiKgCRyttCDfDsvxzxPU6dalSnZEKRE4fDE9YnrAlHufLf?=
 =?us-ascii?Q?5sCDKSgEGHkj3dldLbuxhQXAH8J9fI2QzK170jD1Q3K0NJZ4pi+wUAqCqywr?=
 =?us-ascii?Q?LoP47y8vub21aMwe1MVt2SlVHeBUr4EVUiVNY/uTq6+ZoVUlB1bbNxXUkzZa?=
 =?us-ascii?Q?rvToC9P2fTTHuY2UwKk1an1gKYps2EwdxUdFS27rFc4DXFaJpND9vCUxGC4/?=
 =?us-ascii?Q?jcLvT53GIX4wIpNHL0xlEj8tws0cnFf/Kt1YBdG/Y7Z8qMcX4S1Od1VSy61V?=
 =?us-ascii?Q?QMo4bVsyWl7vMKPjE3AlQFrSNuNKtT3pXAx/ssHY5GLgBDWMDM8lo4MZdXDq?=
 =?us-ascii?Q?ctls9mM88GmXDMa9XMISdFwvuSyTp07ByXQVAowNpE8wfBmYOa9gg/vPKR8u?=
 =?us-ascii?Q?HkYpxnxH9WYiLaE1f+w1pbOidK6mt4JH1PH2s6vKFcFf6mDCIMbtf9c2gmtv?=
 =?us-ascii?Q?GWNSo/MlnI4dsVFGyxaWE6iSjiiL4SU+OmPHH/2kp+/qvdSoAI71XVrdZ/Fr?=
 =?us-ascii?Q?SlGs1GL5CNJ94pRm6shyNOdq/edRDCja/Oqw7Un0K/cNz9Ylac70RZEtRUYh?=
 =?us-ascii?Q?Tl4y0AiwKTZa5S0pM8S7rlSULhl+xUCDMuSx/G2smVX+y0vUHDVIijLU2cc5?=
 =?us-ascii?Q?5UJJXB7FPCxyH4vnDHZyM7md5lPs966Z+PTtzm5Ypp+bL4+wt4TBlcpZSK1E?=
 =?us-ascii?Q?/d9aM+Gydw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aef690b-afde-4e81-e790-08d9fd3f872f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:59:14.4028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: we1/+JN7lMRWHxp/iUmj8mae+iR/HEyyx+ASVJfWCMVkkRD+IXJPZkY/Lv5APipvODvh4ifHfxrp4EPJgHq1HZ/tO99T5gnq28oddU2rmylgTqma2t5cSu7ffsb26uTA
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
Cc: michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
by the implementation in drm_cache.c.
Updated to use the functions provided by drm_cache.c.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 372bc220faeb..5de657c3190e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -438,6 +438,8 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
 {
 	void __iomem *src_map;
 	void __iomem *src_ptr;
+	struct iosys_map src;
+
 	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
 
 	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
@@ -445,8 +447,8 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
 				    PAGE_SIZE);
 
 	src_ptr = src_map + offset_in_page(offset);
-	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
-		memcpy_fromio(dst, src_ptr, size);
+	iosys_map_set_vaddr_iomem(&src, src_ptr);
+	drm_memcpy_from_wc_vaddr(dst, &src, size);
 
 	io_mapping_unmap(src_map);
 }
-- 
2.25.1

