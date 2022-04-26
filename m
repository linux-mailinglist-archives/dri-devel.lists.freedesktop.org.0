Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB80510484
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECED10E8AE;
	Tue, 26 Apr 2022 16:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CF810E1A2;
 Tue, 26 Apr 2022 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991834; x=1682527834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hFIyWXO5Fk4RSCOFUltPrE0ZuK9WfH61NqbS2AfTyIo=;
 b=ekN3eY061fizzEhNPN1raHvOJI1NodB48b4Q38YE266hnbx+MuHnnmDG
 fmpQpsq4/qjMpIRpx4g7vO2ak+z8CnpY4U68r9S9XI8ey7U0zP/a3UMCi
 WAbgw5oYXtXO/oTlKfRVwKQLAnQForqTMKEoRiAHIER9b52RxM0vWZqVh
 rUskOxy8v0wWK7nyCxSh/lc135Z43OHwduy4zUmQ80nykZ6DGfEMsEa35
 3rbMZ/pHpozMksB19EkIgHgaPYRvbs9hATp1yfNIeKWQ5p5Q+aMO4XgzX
 S8TkozITD2fjLk1RtBYb2DG+c1nlHE2j73iPJwgU9N7yC7fJqvSZq5Yg+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="247581913"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="247581913"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="580034562"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 26 Apr 2022 09:50:33 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:50:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ769Wb9EONGZpBtKLYL9d8r73x4iddKXvzFqd1QsoUGHLMKhpyXJ9HmciS3KDhXDWrwZU/s3VzXeWxdW3xTMgfRz44740gTQhQvVNsr/Qzb4IW45IvuLZ9xQSj53S1oX+tAWqSKra8QgvogvZdObIickOHUaAGbknqwQwJPsL+lvwJLPoAuckSr9F5GvLLoCCHCLsxp0xCBJcQxsX/PgaX8pcvtYTrOS1uS80Lcl8lzu5+YU3OyiDT+a+s+ZiQboJz5tvUZXgmCmNtmml+zExRnIgrBPWARaC5UbKEEnT53rnNjbK6S/Q783ps/05YLSnkayk/f374+N68k0AlNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bdLQRIVNNXWh8ngcRa7sgwrI4C3A9gMhN3czoh9EvI=;
 b=BxAs7S2wplnfjDOwZgerFeXqXSg9PMiT/TcI6sA6ACPtSWgMZeSqmRzoVeRd+fX7yrHrcjocxA2bNMbVAC5Uz4RtqbSkqD4zrWccvGiMBQKenm+iwfeS7skRV1JNirDj2Z+BigMONi+mHij+T3r3fZR2BrbuUjK30PZWrFnhXew4CbfFjDo8If4ZI1VNXK6EnL84w6DqTQiK6LgHVxdc9p907odbpZ5mhvCoYNlWCHdcBFLXp7kP5ydGuZkRpTxSUiGEr382+vwvfXZ0zbpc8xvXhUIkbm7TmU1ATJzukPoBtBmttkSmo966IaE8nni1A2MkAquLDf/hJMyAF84UCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by MN2PR11MB4366.namprd11.prod.outlook.com (2603:10b6:208:190::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:50:25 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:50:25 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 7/7] drm/i915: Avoid dereferencing io mapped memory
Date: Tue, 26 Apr 2022 22:21:48 +0530
Message-ID: <20220426165148.1784-8-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::32) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbf06cdc-e615-4488-c1b1-08da27a4dc8a
X-MS-TrafficTypeDiagnostic: MN2PR11MB4366:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtFwd,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB4366BFD0C17F141CADB566559FFB9@MN2PR11MB4366.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ibwKaWztwZVg1p8cXdzxRZNa4PZkBRZRvmjHPVvs1k8QXp6CM63HDuQ6HDloLY/9tf5McKdjhX/7PJ3MaE32HtqS0IAB4xtBY6zbt4lpcynMtqpAhBJH3Q3HD2hBWxdtAdM1s4gLpXmsX9Jp/2lE+yYKtFesWJcdG9lPJZNFSqCCknacNVL8wyab4gAtqR9W2SWGBuXmlecG6ZEWQzci/xzhyR1nuKorgLlBulRI7is5O+5MLLXGoGJbQFwpgapsUFM76wQgOSoYWm2EbBgiclNC38uFlSOhEw9R8NSFpUua6OQarQAh6dMjkSSY3Hzt8aLXIpMBLCeAclvrE+6WfpVffxQEyqCNk4UAfihMkoMDJClS8ZOLi0HJMiAh4RgMPUrCZF+HolYlxnheKiQpfOgL78pq9eOmHr66B04YaJdpMhL+jnBZjcXZJl0MCFeqnox3EYyuhuwezelVNSr48D2v6/5TvyifFIezHRLLtk5rj3f1aZCtTVvuUzlI7OgdPHwNRLTU6Jp4llQ6BR2pIJHLNaSdFtyO85JNtILRgDQq6kUFOMOE28hNZTKXdU1ovNMqWgTFGPg66NKsi2/4lEMb7f3D7MtWvkHlR914nIi7UEoLl+2lPHPRxzJUDMRNHVsm+yTWQQ+tdrrFd/hEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(2616005)(66946007)(6512007)(5660300002)(107886003)(82960400001)(450100002)(26005)(8936002)(66556008)(54906003)(316002)(86362001)(2906002)(1076003)(38100700002)(44832011)(6486002)(508600001)(4326008)(8676002)(66476007)(83380400001)(186003)(6506007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6+Qfw3f9piRCywR+/eLkDQT3FCTKnv6VrkNwU6JUZOxuyKU9PPpv2BvlEy3+?=
 =?us-ascii?Q?5DLXhKbPRWkFCEDAH69BLbGE4D72IPYfZIFp+VbJk7esFBd4Jq8Zn369LhZW?=
 =?us-ascii?Q?4oz8FECDTQvRgv6ZRhq8asqPb7x0DFRAECMFTO7CSH42/tWzJTXNTVTafiRS?=
 =?us-ascii?Q?n2/wsMhEonLba/U2PZB741UAiHBAVrzm83xlhzVAwoIXbx4VKSmXHR087HcU?=
 =?us-ascii?Q?kLeV7OyvQlYWl04p8wG0ovuKElj/vVtDa7BinXk0iGHr7T1lBzTYFgChHN5M?=
 =?us-ascii?Q?hmDl+hUpi2f4XeQMc9KtiGG6JCVcV5xYpQ3lWdojSGCr3IktfhC4+Ho/+rsg?=
 =?us-ascii?Q?aKqZ2uG/JK+5LgI0q3TjhnC9RK6Etk6KEcovRHdCHfnU8QdyQ/+LGXogBtyG?=
 =?us-ascii?Q?2lI9KwHNTCto7i9ovitHVLbhBgTRSpnsYISF1i059BgauvajW6R+L9FqZrFe?=
 =?us-ascii?Q?VIF+laAJkKcVtmZ6LUR1uw0uySNWuMCH6Q3xspq7O5go0zCbxUNI3jTP1tAu?=
 =?us-ascii?Q?frEKBR34wUnU8vAiOp0KWebFAjDKJmwXH6js/ZJxnDOvMqV3O1HMs85L6EMo?=
 =?us-ascii?Q?mcqh6VTfbTBxHp6tUMB7WNXZVskRpJbVGx+sMH/92cxhuEhAxqTdGaq+gDPc?=
 =?us-ascii?Q?2gn4lGH821uOJ+YqQKveh95RB32tre6RzXVtno+JdxoNjwUn4KMSWKewF9ok?=
 =?us-ascii?Q?rJ+FfaXoqIUAVj67rGfEVBTVFN9Xm4EK6LJjiWtKuOSYlu0rfGckxjHe9dX9?=
 =?us-ascii?Q?r143Up52QHGAisYTOFOGX37BVqlI/ajrSI2W+qnBS4u9t5ZMX3XBSc3mYRzc?=
 =?us-ascii?Q?pj46lhUa0rNIZBJ6JdCIyPvGvP0Ud6IQMj2JNr5ap1xvify0Xcisn/Az1/ic?=
 =?us-ascii?Q?pnFGH8kV5x0fjo1n/w9W2j4tVx6HcwqJf0XomGaFbZQvtUufh6IiFqkqmatk?=
 =?us-ascii?Q?BSohChq285ofQlrIjsm9RRC2/c/9U6G8L0fFrG33eUj0bYfTPvl1LXDHlM55?=
 =?us-ascii?Q?uTWFAxFk4SIJKc4NucKjiZmTwAyiqCbcwXFdUz0KxueXPDrctIy/m/HtjU8W?=
 =?us-ascii?Q?7bIlSZEMnwxII6sGj/n85P8iBaw9w7F9zuxvF2MpMmg5+p9BNYX3qIwpq1iM?=
 =?us-ascii?Q?EDT6NlfAlxre8uWK1a37l2Tune5W6dfMraNXCXHRjwYSmOXiOTbLDOMNg571?=
 =?us-ascii?Q?L4PRjJIMXp0391Z+ZmdBp4a6i1zMs5OFmH3NDaiGlswuScLAOj9ai1B561km?=
 =?us-ascii?Q?JYtQx2SiPzZtUNixHes00vVo4andj2aSmIlVX+zl0vuavYqTTwSGxPtGyAjo?=
 =?us-ascii?Q?mo+wAEIzPD6fDT7fgosQ6VkkL1kuDtdboVY7zfyMxowBRGHmgIyIDmDu/Vaz?=
 =?us-ascii?Q?y+TZ5S16ykKTFkzOHuyOXB+SNvL+vE8Kd85hOcgZwiVC+p0B5FD6kokKsnOr?=
 =?us-ascii?Q?D0rhXQ5HO2KLmPpHRF3IebFwXWsh4V2xAScCx/GAA0ZBM+CCqWK22GLXy6X9?=
 =?us-ascii?Q?0X0blyZOMQSnUVz5NEW5/eJ7CfN3oQmeAKcR5zVJGyBjNrV/Q0ARLImgQjhU?=
 =?us-ascii?Q?LVTzE4LuBx80cOHabGapaqEbtE2fIebbGDNdGRwvudR9B9gKR1e6gMjBI1nk?=
 =?us-ascii?Q?M/gYoCoe0keex9ecN+1zok9rG0uhqkiQZkggdB5Ghn3D+19zqnJ//2hnQNXg?=
 =?us-ascii?Q?RJfZIjrorYqhOjI9IFmsfNEXmnUVXHfA0Hr65wHIeagxRoyUGC6PVmtCGlaf?=
 =?us-ascii?Q?nbWpIxbovqS9m2vsSv7w0IsWuVCT1MfowQnjef3bRLbKrvB0z8pQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf06cdc-e615-4488-c1b1-08da27a4dc8a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:50:25.6422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTq3ClfgTm6/vZG8NNjaRnofD+VQlSraQ8s5ag+1tK8wzEpBSlgNX0s22PDgeE4xpOmpMSt+mPdmz4WH1MjzJmIaG7hnTIK1n9D2U2UBiRUqDQGdoWLNImRWhWzSYgt4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4366
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
Cc: siva.mullati@intel.com, lucas.demarchi@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
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
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 45 +++++++++++++++------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 0512c66fa4f3..9cafacb4ceb6 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -262,9 +262,12 @@ static bool compress_init(struct i915_vma_compress *c)
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
@@ -296,15 +299,17 @@ static void *compress_next_page(struct i915_vma_compress *c,
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
+		drm_memcpy_from_wc_vaddr(c->tmp, src, 0, PAGE_SIZE);
 		zstream->next_in = c->tmp;
+	} else {
+		zstream->next_in = src->vaddr;
+	}
 	zstream->avail_in = PAGE_SIZE;
 
 	do {
@@ -393,9 +398,8 @@ static bool compress_start(struct i915_vma_compress *c)
 }
 
 static int compress_page(struct i915_vma_compress *c,
-			 void *src,
-			 struct i915_vma_coredump *dst,
-			 bool wc)
+			 struct iosys_map *src,
+			 struct i915_vma_coredump *dst)
 {
 	void *ptr;
 
@@ -403,8 +407,7 @@ static int compress_page(struct i915_vma_compress *c,
 	if (!ptr)
 		return -ENOMEM;
 
-	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
-		memcpy(ptr, src, PAGE_SIZE);
+	drm_memcpy_from_wc_vaddr(ptr, src, 0, PAGE_SIZE);
 	list_add_tail(&virt_to_page(ptr)->lru, &dst->page_list);
 	cond_resched();
 
@@ -1092,6 +1095,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	if (drm_mm_node_allocated(&ggtt->error_capture)) {
 		void __iomem *s;
 		dma_addr_t dma;
+		struct iosys_map src;
 
 		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
 			mutex_lock(&ggtt->error_mutex);
@@ -1100,9 +1104,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			mb();
 
 			s = io_mapping_map_wc(&ggtt->iomap, slot, PAGE_SIZE);
-			ret = compress_page(compress,
-					    (void  __force *)s, dst,
-					    true);
+			iosys_map_set_vaddr_iomem(&src, s);
+			ret = compress_page(compress, &src, dst);
 			io_mapping_unmap(s);
 
 			mb();
@@ -1114,6 +1117,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	} else if (vma_res->bi.lmem) {
 		struct intel_memory_region *mem = vma_res->mr;
 		dma_addr_t dma;
+		struct iosys_map src;
 
 		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
 			void __iomem *s;
@@ -1121,15 +1125,15 @@ i915_vma_coredump_create(const struct intel_gt *gt,
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
@@ -1137,7 +1141,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			drm_clflush_pages(&page, 1);
 
 			s = kmap(page);
-			ret = compress_page(compress, s, dst, false);
+			iosys_map_set_vaddr(&src, s);
+			ret = compress_page(compress, &src, dst);
 			kunmap(page);
 
 			drm_clflush_pages(&page, 1);
-- 
2.25.1

