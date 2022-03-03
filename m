Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB84CC4C8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A933110EB84;
	Thu,  3 Mar 2022 18:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A2A10EB52;
 Thu,  3 Mar 2022 18:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646331130; x=1677867130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CqlmECBwlEhnOSQC/pW6GEWuVPtyWloEsTLzNHSqYaU=;
 b=NdZAvoJujzZ7MZS79vYfILvzPD4hwI1dwlDy40XvirQfCOZFMCZvNL3b
 VPdpCVjoKyw4lVBmLXiGmEoyItGB/5rFqeCoaaGm8bhfVYu1oGeWh678F
 kRnelqhgHJ6PorD9OuMwPtTi+ZX97aVJ1qTJB4adRkvx8F9uuWvRgVjkU
 SgzZ33FfJNrXbgxd+yJs9+XN+u3kh+/16We5pYCXdxhXT5jpAh5MhSpvv
 LtmHT1wUPo3Q3OAsQ59psA+nM8IAArTIM0seSn/xlFbRtFV+2L2ZclCc8
 Su7pfhTRRYCCZlJNub5IKa26rRUjI3ue9oA4zgJWq7+SxCIl+rdZYgCZL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="252587846"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="252587846"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 09:59:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="545950334"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2022 09:59:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:45 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 09:59:45 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOPHAA8hMqXG5C7ZYU40SppOR4UZP8mgOKWV2iXP5jdBbBB5PeXjpRA8bhxR95MArRwUtAL9u0Wo7LcgLsO2u1kLVfrzX8/HI8v6nRq6lZ13SEdJDk6UP1K+HCF535YdOuXPzHOjIYMmVNu7TLgPIa6m8tPJm3jjY/pOWdCeIKxcsf+YhSCGOd87RH7kza0maB/gESMmRzNAVcFA/8duaNp779McMV5VtROdJsC5MEtlhM9theiVEc8Gl9Ay+ZpuOWQLjf0KNBsFuemFdAmZlJpxMTZAOQPBhmoJSoRJAa69narWAZmuCQe+X5aF8bsAD+UP2djGuae0xDRhaa0lNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOxHsXhI7jcvcKHdAGKceNRuz0Vkd1a4r+RGqSKhSV8=;
 b=ibsFgxzu1wWaEAqpoBnVvtpAAWVzgMvkjTJBXHxpPIf4POcmiqNDWnLDg7dTeyyrC6x27E+5U9v7i7R2zl83W7K6hVmjsGemqnr9CrbkpTKbzLJXTnmeIWhDWMJjNgizUwsQ0EWClAB1AeLZCEihFzC24O7xsesWxuD1/JiU3jzCqLwFVJSnZC+ic9YtxckgNbKqZAINzZZuDSGA/ejH98sSV9afog3fTLXW+SiBRD2KPLa9Oif6T+l7Btpq4UnAVbyPwSJjsC2MpfDzFjX7V9HND8FTbaZHj720pnPSC1k9g3NYAxHWtILX1Nyy8hYfylOidKENteRN7MSK6NQsyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM5PR11MB1244.namprd11.prod.outlook.com (2603:10b6:3:13::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 17:59:42 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:59:41 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 7/7] drm/i915: Avoid dereferencing io mapped memory
Date: Thu, 3 Mar 2022 23:30:13 +0530
Message-ID: <20220303180013.512219-8-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0082.apcprd02.prod.outlook.com
 (2603:1096:4:90::22) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 761a239c-84d3-48be-b10f-08d9fd3f978f
X-MS-TrafficTypeDiagnostic: DM5PR11MB1244:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB124462DAF9EA9D21F08C02F29F049@DM5PR11MB1244.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPuYqVazJGs11SZxSPYF7T70qxK0rU7Tl34yyX0WGIX+beXxHac0ZjX3ibYAQSEqIHVuCl1zxLSviCEqz/iNoD3w3oDzJWyBRFlptDJ6uhMufMSsFzAUC90q2AVxaVbpflXlhJZiXt/e3m76gwRl2byS1XGs6kz2n3HlI2hZiaM+v+qBXJZk0GdR84D7yKKQd9buOjSLU4ei9QWtXAyhJirMNQsBQy3Tj7gMBhwM1cBA+imK84X2lhpy3WIdu349QWB0cfL5CwWD3ptG9pkvUxeChRsv1KnL4OiJ+1YPDh+ZH67lESRyVLaaEeYm+3eniFnNMYZUUL5G4cml6tn7PP6Rg6FDONZ/kc7hVNajuJXhAkjHvLqNiD+xgjqWP6YX/FchiBTQsK5GQvOkiKHhUCKckwp5lXe3XPUmST38wbUD3LrbvKIh02ogGnyrKNC2aM55fNQoHyXBwniuC6Ks//nutv3Y9tkAUTBYUBVi1MOfuzOzI4/p7XdLXWoSIudtnwj1kzYcljbGRPN0fn1NPkjyP5BpVbW6mzZXd1FWFxQe53iyO8z8Fdm0huk2jkJl+g83N0KB5qEG6A9Ul7iwRr/vcEsj1GWHS3tNnFPW6K3s9SxChnP16oFuSB8vIGWgLM0D6iE0IxrDlowEJ+jkIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(38100700002)(66946007)(66556008)(6666004)(450100002)(66476007)(8676002)(82960400001)(86362001)(4326008)(83380400001)(36756003)(6506007)(107886003)(1076003)(2616005)(5660300002)(2906002)(6512007)(44832011)(186003)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YaRj3LCdlQ1OKfD4k+JCAEJIgZjQcZKhRF+/xKgcw1yD5Fvih+LJsKyG95Cl?=
 =?us-ascii?Q?XCwjOWsuJ6ZDYKZhFUr/OsjamLLMRQBwnRtut8UaPx3eCcIEEbr0Ysr73ysn?=
 =?us-ascii?Q?myf95hZeUeqlWzE/Wry4pE+nAPvGO7XabGefqTkDOu2F6PtRW2rXTt9MdcSv?=
 =?us-ascii?Q?EV9C8KqzgaxaLRNBsnFcZJYn/3MtZCImW5UhxS0Enr2cJapA66LLm+O+J2e7?=
 =?us-ascii?Q?jLeHqSRw7VXmcrcPdKMAUuRAhGI+yWHogb1O5mWRT7WbAfLisCQXrHxNvMeh?=
 =?us-ascii?Q?nvYitOcjJgMd5as7plTUrZpFwFEz1v55zmaQ6uA8Cfw4mUvBzk5bx7zCMA2c?=
 =?us-ascii?Q?2lMdNMPQP9cHkMxZyRNGOh9RSHIpsePoloDK60vUp54pVeizyArPOjFmFNuG?=
 =?us-ascii?Q?S68YINXTMyeTLVc4Apebzp/k0Xmkeflkl6qNAOTw9vmxHNqZgbzflYQKlz34?=
 =?us-ascii?Q?+foSTAS8ORX+A1OXEXc5J8G2GXmpjuePhpwHRnEaBKUKv/fPCyg/rLVm2wAr?=
 =?us-ascii?Q?JAdteSQQLIrxF0hzrB+kuPTnBQonOsZXruOk2sDDP+rx4n0yYUI0diPZNQTh?=
 =?us-ascii?Q?/90HyFEyYk1bfdtL+fPQ0skyDjXCuB6NikvgkysqbKKXWXK0DQ4IPSTZIjaT?=
 =?us-ascii?Q?aSdIYfgeyZ+V09vcjUQjs9hIVbtPmI4DpxGY0cVZWdL13JgNcEPJNbtoHX4g?=
 =?us-ascii?Q?NV7GVm5iLjqerI+SVC7hWFcEZFmMi9/y+0BUH++D0J73WzDj802cR1f8sklh?=
 =?us-ascii?Q?94Edfp2VpmizDvQktw8hbYlcAD77wJzzMdcs9XHg/a7I1ccchsTE6Sm6GBjD?=
 =?us-ascii?Q?niu9PorYAXB8qwiGCeckn4r0IL79uw9MG5GvdCFQscySQMcdkpe9K08COABI?=
 =?us-ascii?Q?yISg1n4DMGrEYDDEMtbSAlAWutWdTBSV1H7lXqtPu141rPV5IqBkrrmftbn5?=
 =?us-ascii?Q?lHq+mGD4duXQ07oCruY6Ymc46m1n2Hgl+bs96DJCi2ykF7uVhnY37VSNgRZG?=
 =?us-ascii?Q?bcF9QJElBwDDEOGOF2IcOxbmDOuiwiAbtLURrw1KGx4ZCNj7d6k0b2T6Elbl?=
 =?us-ascii?Q?i+DstNDDInqqBrRThY+8FeIEpiX3/xyqIYi7VXXuS18ZLU7yOfZyEDzY8Azu?=
 =?us-ascii?Q?bCU3t6cAGhURQdtWy1J/c7PpPSDm9WLvdJXqUNwo2Wf/qfpKYcNUeibJqdJa?=
 =?us-ascii?Q?up3er6QIUTF2BWqDasElYDc9SW0Df/A246CN4C5WJmlaJl4w9IZ9/BsNwO4c?=
 =?us-ascii?Q?vpH9sVD8xRXfIGQueS4awjLNq4KVn08kaMca/EodcN87q3AZ0GrQHJYRxWeY?=
 =?us-ascii?Q?1OncZIyY3mlUUeGVeL3nFo68IT86nC2ojLiNFP16v6NzkkoNyKSsfQ56CET7?=
 =?us-ascii?Q?jsJxYLneImpqC2Lyl8HPM3dG1hEwSYaTbFVCqF3NvmshUSGmbTO3U+wEcbg4?=
 =?us-ascii?Q?8JGgn1OJsfAHMGWbfTvmpD0qayfqGdSMzMQHaG4D0JbWLCnY+I96OrVqj1vV?=
 =?us-ascii?Q?dNwOP0vA95+XH2sR+c63B7+02kzzwGC9UbybRSgqCoKu4ec3CBFweDQjugvJ?=
 =?us-ascii?Q?idmRNtKJQcbX0NfYlCAi6tDxRy/3E7KQEEhbwGUiZwlV7V5TGvfHbUUNQw3I?=
 =?us-ascii?Q?rUmkGtQ7MamY8XvGbicSb3J/3cPOsrzwaHLiA3ZHflwFNeRK/f8xmYJmV/kw?=
 =?us-ascii?Q?WK24SAF/3rhxglur6EWLZbghhTH5uRoOoxD/L9WaDeSGSfhkHOMf+GG63uJS?=
 =?us-ascii?Q?vh0PGWPl3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 761a239c-84d3-48be-b10f-08d9fd3f978f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:59:41.8741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7H9Xd/nJnq1NKoJDFnwdLt7JbgOkLpTJTzk9ScBwEh67i3NMHRbKrLtljE9SzfpAV6s5Gcu/HaKWyUz8hjMBXA4gyjB0nrE8AtqPU7HGxyltIyVpHBsaqKR7DgnGtbvX
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

Pointer passed to zlib_deflate() for compression could point to io
mapped memory and might end up in direct derefencing.
io mapped memory is copied to a temporary buffer, which is then shared
to zlib_deflate(), only for the case where platform supports fast copy
using non-temporal instructions. If the platform lacks support,
then io mapped memory is directly used.

Direct dereferencing of io memory makes driver not portable outside
x86 and should be avoided.

With this patch, io memory is always copied to a temporary buffer
irrespective of platform support for fast copy. The
i915_has_memcpy_from_wc() check is removed. And
drm_memcpy_from_wc_vaddr() is now used for copying instead of
i915_memcpy_from_wc() for 2 reasons.
- i915_memcpy_from_wc() will be deprecated.
- drm_memcpy_from_wc_vaddr() will not fail if the fast copy is not
supported instead continues copying using memcpy_fromio as fallback.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 45 +++++++++++++++------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 4967e79806f8..1ca5072b85db 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -259,9 +259,12 @@ static bool compress_init(struct i915_vma_compress *c)
 		return false;
 	}
 
-	c->tmp = NULL;
-	if (i915_has_memcpy_from_wc())
-		c->tmp = pool_alloc(&c->pool, ALLOW_FAIL);
+	c->tmp = pool_alloc(&c->pool, ALLOW_FAIL);
+	if (!c->tmp) {
+		kfree(zstream->workspace);
+		pool_fini(&c->pool);
+		return false;
+	}
 
 	return true;
 }
@@ -293,15 +296,17 @@ static void *compress_next_page(struct i915_vma_compress *c,
 }
 
 static int compress_page(struct i915_vma_compress *c,
-			 void *src,
-			 struct i915_vma_coredump *dst,
-			 bool wc)
+			 struct iosys_map *src,
+			 struct i915_vma_coredump *dst)
 {
 	struct z_stream_s *zstream = &c->zstream;
 
-	zstream->next_in = src;
-	if (wc && c->tmp && i915_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
+	if (src->is_iomem) {
+		drm_memcpy_from_wc_vaddr(c->tmp, src, PAGE_SIZE);
 		zstream->next_in = c->tmp;
+	} else {
+		zstream->next_in = src->vaddr;
+	}
 	zstream->avail_in = PAGE_SIZE;
 
 	do {
@@ -390,9 +395,8 @@ static bool compress_start(struct i915_vma_compress *c)
 }
 
 static int compress_page(struct i915_vma_compress *c,
-			 void *src,
-			 struct i915_vma_coredump *dst,
-			 bool wc)
+			 struct iosys_map *src,
+			 struct i915_vma_coredump *dst)
 {
 	void *ptr;
 
@@ -400,8 +404,7 @@ static int compress_page(struct i915_vma_compress *c,
 	if (!ptr)
 		return -ENOMEM;
 
-	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
-		memcpy(ptr, src, PAGE_SIZE);
+	drm_memcpy_from_wc_vaddr(ptr, src, PAGE_SIZE);
 	list_add_tail(&virt_to_page(ptr)->lru, &dst->page_list);
 	cond_resched();
 
@@ -1055,6 +1058,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	if (drm_mm_node_allocated(&ggtt->error_capture)) {
 		void __iomem *s;
 		dma_addr_t dma;
+		struct iosys_map src;
 
 		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
 			mutex_lock(&ggtt->error_mutex);
@@ -1063,9 +1067,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			mb();
 
 			s = io_mapping_map_wc(&ggtt->iomap, slot, PAGE_SIZE);
-			ret = compress_page(compress,
-					    (void  __force *)s, dst,
-					    true);
+			iosys_map_set_vaddr_iomem(&src, s);
+			ret = compress_page(compress, &src, dst);
 			io_mapping_unmap(s);
 
 			mb();
@@ -1077,6 +1080,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	} else if (vma_res->bi.lmem) {
 		struct intel_memory_region *mem = vma_res->mr;
 		dma_addr_t dma;
+		struct iosys_map src;
 
 		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
 			void __iomem *s;
@@ -1084,15 +1088,15 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			s = io_mapping_map_wc(&mem->iomap,
 					      dma - mem->region.start,
 					      PAGE_SIZE);
-			ret = compress_page(compress,
-					    (void __force *)s, dst,
-					    true);
+			iosys_map_set_vaddr_iomem(&src, s);
+			ret = compress_page(compress, &src, dst);
 			io_mapping_unmap(s);
 			if (ret)
 				break;
 		}
 	} else {
 		struct page *page;
+		struct iosys_map src;
 
 		for_each_sgt_page(page, iter, vma_res->bi.pages) {
 			void *s;
@@ -1100,7 +1104,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			drm_clflush_pages(&page, 1);
 
 			s = kmap(page);
-			ret = compress_page(compress, s, dst, false);
+			iosys_map_set_vaddr(&src, s);
+			ret = compress_page(compress, &src, dst);
 			kunmap(page);
 
 			drm_clflush_pages(&page, 1);
-- 
2.25.1

