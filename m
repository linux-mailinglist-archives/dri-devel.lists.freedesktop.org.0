Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAB94BFB3A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A96010E8DD;
	Tue, 22 Feb 2022 14:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3E410E8DC;
 Tue, 22 Feb 2022 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645541541; x=1677077541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=irVaX36N/M8s11QUohRAudxJ45Jgx3HeWjOyH32BPIY=;
 b=H2FqZZxaWtBD6a/umZOweH+YD7Z9cHgS0G1VUT2cYT8NkVHQah//dVrE
 KkMGl2KtEE1K146U+7O76ome3mU8/ydtQv0Mas/oMUsELqH8VAdSlSHYa
 yRLB5UTnV3PRey9fqnINYjgcL3gwUITRXXWwpjJUo4SKYC8JcDjir8Me5
 bm5DJ3xTW04O5F2TI+1r6vdL4N2U7uIQ+GMOUjeVXA1ntceHrKJQXkkoR
 Y+DsINKTxa0yV4mYacxm+doRjj6qPtf+s8VRWlaJjThOmYQv/7im6vAni
 5Hcv7VK0ItFDLFe84rE5Mpd56bENa+v086K7TGGIc2XJvk2B16bEWc2v+ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="231688374"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="231688374"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 06:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="573454006"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2022 06:52:06 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 06:52:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 06:52:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 06:52:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 06:52:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo6IgLHLaoGPwi2Vhu8fLGmwanWpAX+Py7ChQ2DtwpagkgPSp4VZdXTcjkqDuNLwytbehE9MsqpArK3tmNeJGOT50mfZeafNuJtAMBF7YoJHWiPOEPecB84yg43Iex24Hf0T6nQhyhPIvXnK0BYmHohO9O3eVa009/bgOH2K35j8/x6bf7azF0oeac5yTCfYE8+FI7WhEoOAfq7b9l7+PE4yzIBcNQw3TG6rnPzspVebRS0eEsBlMcOZlKxgJkMYj9qsaqPRj2Jr/9NoRA54GJlKjoJTi3NfLkojTHz58PTjbUD2z5dMoaksPnuG4fYId0+rTeypAqK3VRGpRDPyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCAHtC0lLFe8vADp9D+F90EUfwkaaw5i/LgsZKbdWAI=;
 b=jvWGsuRmAEpgr5dXSSO53lsuWd8HbHWoTJlpRQTXhOn/rq4w8K75tsTqSSda3a5QAPS5axytVE4pHAqzUjshJLVDv/O4VTcpUyB0NqV2K0vF8Mqq4I+nw5AhKO0hmEYKjZRRxgDe6CA1ROQ97qcElc7vD7jNM50Gdgec0x6swZCRnffaPl37vDlkaaliZosOpjJ+bV9SFMop0E9nDofvuoqa4/8cpzTd5PngnRz4INdtbwCoCWiGphHT0A+aAlbIYp5ujOzuNEvEGbk7HofF0N7j+v3mPqXFcQDdx8cpn9PXapUfaUWnLFdv8QfHIWMaPaONffibsbV7COeQWrIUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 22 Feb
 2022 14:52:03 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:52:03 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/i915: Avoid dereferencing io mapped memory
Date: Tue, 22 Feb 2022 20:22:06 +0530
Message-ID: <20220222145206.76118-8-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0112.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::28)
 To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bde1d2c7-52b9-4a62-5f79-08d9f612e37f
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB56277989BF6FDBE77F50E48E9F3B9@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: goVmsD+40HP9fmEVyDGCrR5PHvCvZHu/ze+KHyMtxyQINYK8RjfiK5rtB1JearxTD6nVerUXsV35G8ti4FTRSbrukeqzuDf+G0CglaP3t+zPA+NrdpcHR6wlarCH8m0aHcd38SfRRyzLAZwYdKoelcxUG3wqfpuuadyU8KDjsdp1Pbwd7jDgpClYy7WVACCwZp65ESuzZF5QbIgzc8rO5Ng4KC16bzmILkiCJNybabSLnvKMti1QXHmP1TyoMYeRAoig/8m6tzB7hJWR4GdHQDR9DJuE99NlwkmORbT3NhhH7tJ9d09W0hYcRUkiNNKHtZYhuGQLexrlf3GSGIvXQMwo9ejRtBhHu8zyIoo5/3pD7MQ2CptKXmWnhHo50JOLK4wD5cvMBtQVfcDMiDdxIxcNsxZc33M2X5ocJ6l9Nh4gBA4px/bFLa1IY5gb+nCm78L6il6kBW3ZdNUBxdJNI0yh5fIPc09HR25SjZVpcSrtY6QTPiuBAbxZgwdNwda/OpO5e8iYZTVx6E9nVDfa6KszCbRfcVEJ1ZUZyU4u9dxCQE7TaGa2Dolwun7zHxT4NX4Wb0TVJUseYUJQp1/VR9Xw1OTWtVGPLCxdgf49GAbH5rG09Itw12bZP9C+qznY8UUIMuHT2vb3SgVNe7K5EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(82960400001)(38100700002)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(450100002)(8936002)(44832011)(5660300002)(2906002)(107886003)(2616005)(36756003)(186003)(26005)(1076003)(83380400001)(6486002)(508600001)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HiSSE3ErvX0EdoBdhij69HPW/qb/EKqjRYqpJlAIW4hJk6jPQiWGsfhFxnAP?=
 =?us-ascii?Q?v21iuPUORUFMqlGEeLes6VMcqsjuu+NUeCu2nALG1Un+9qGMgc2294e6mw4L?=
 =?us-ascii?Q?q9Vb5FABeQmblr7DYJYWQ2cZwJJ5IYEASNVjmB59Lh+CPdKm8Rn2KDPQ6xRj?=
 =?us-ascii?Q?mL5OqWSO2OkoqlGaszJaxabbyjpTM1BImq1MRs3BJ/QRJns+jVo+bJTFPye1?=
 =?us-ascii?Q?89GNvapo3rG7p/RxRahcUAswwMBgbxEzrf/vN9Qtj2RsFZ+T3uA+gAydtWCQ?=
 =?us-ascii?Q?Qk3wlcJ9Igmn5A8AWuF3EQ2scNXGqNtbk1M5U2h1ebXrjZDY1RkFANkx4y1a?=
 =?us-ascii?Q?roYehMHZ0U26qU4vcXwzQP68rWN6FCQsCgD3+XyG/U/uaANmdRnaYeQzAHk7?=
 =?us-ascii?Q?1h6Ao6ccExJkjy4YkzvlOrC+V/8FSIiLN6P9ql08EFLFXjwArhG9Rbo4EOAs?=
 =?us-ascii?Q?b3zvE/qhp93lm0OYm/zM2TAqLDdaNXqPn5uHOoFolKM/2kDI0JooL2VlbtRJ?=
 =?us-ascii?Q?pP9aV/cGuJ9hiroLD67GFOo4WVZvtvwi6yigf13iQgUpO2pjzVp2f2HBEOTe?=
 =?us-ascii?Q?okLkwokHWdwjsYJuSk3BGMg8kJ7eg4zzXtiI7BCBRu+SIdHDNE/mlXQ3zlhl?=
 =?us-ascii?Q?oJDsW71pgrE5xbvTHCqW86/ddxHpZIXmmo3bfFaNM/x1bkVPAlyQRDf0+jei?=
 =?us-ascii?Q?02W/qBcWRSTVcp0EaNKvnlYS6mraROKazEGXe2JRY1VjnA0sUVpikQeZqEBz?=
 =?us-ascii?Q?TkO2szgRSoyKqIp7lB3mWmzTPBS54w7QP7ZD7V6x7d8WAsvTB+TQDfvPwg9J?=
 =?us-ascii?Q?lnRuAaUKCEJWjzCy0dHt+l9PrQ1RFB3i3AYDcNLbJaJyj3SEh9Rb51GjoTcT?=
 =?us-ascii?Q?4M31qxGInvOCJSW5ZrUp0qdfiJExjNhzL72wRGvSTY5eomXskuENM7mNTKAc?=
 =?us-ascii?Q?iUL87tmjGvACWnJvj3ZcvjPMJBAxK9vIqmVBU/+7liZtiM2ywodu0MJxJhNA?=
 =?us-ascii?Q?p0O4CqswgRR2PH96naCDvSbSx5moiftFAiA7DzoPp2EKn/nx4UijMupVJs7H?=
 =?us-ascii?Q?QR3vftkNZDD1E151BTIG+lwYHVukhzRMHzjK0Mniz9KPvSylZjg6ijYTznsk?=
 =?us-ascii?Q?P+Mzl5ua+DbwuYMvRtcnzEC4Q5Lgwc6E7DzpX4Cs8HUtaMdcCjuZ88yRniGX?=
 =?us-ascii?Q?nkhfrKexaaSNKjUV+iTScB75tF44MoG0xayL8OAfMCT/w2zFre+sI3vgXJnt?=
 =?us-ascii?Q?toHt+10HmjIinAiT1gCwJpaqbbqJAjn0gqkTCTc/AchdcO1tDpeTowbAU9/X?=
 =?us-ascii?Q?URVBy2JZIszLGQASIztPHuF4gYuEnp1Y2/wTdFzesxFpE6edMOTxltPuwrna?=
 =?us-ascii?Q?aWFcY6LmZsB/N0lzKavPr07tgJiC7Pa88XC1tKolLmRjTFtxxcM2WnMSkF4I?=
 =?us-ascii?Q?omGfxTESijfEB8lrBwRmYIcvmWLWQaOiEgoO72HQ3yw+0Fm7Ie81Ran/EMwH?=
 =?us-ascii?Q?W/MY5GEj7o5n/Eg7+BN0FZw+nPpmf874aeSH97m4E2rNNs1LyXBp00sAgunh?=
 =?us-ascii?Q?akT/k8h3rzZL+QCAKLYBKE7LG3O1PxVCXylILcscpWuxEEk0Ho/ygoy3nr+R?=
 =?us-ascii?Q?NQaWClbzTABmU5qM9vHPaLiAYDPaEfiyUdyX1p61kq+fEb/c2hqtvWIWOX/z?=
 =?us-ascii?Q?eKcpDXDLuCp0iRc2sUWaGdDk8KK/ID4sanp+SeZtyp2qhjbhRVDKtT6eTMHs?=
 =?us-ascii?Q?iQmlh/Ryzw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bde1d2c7-52b9-4a62-5f79-08d9f612e37f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:52:03.7974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtcDYv2sUqi1q4GbXJbIuxJu/fQP9TK6seBMDWvEuEzBom371o3kWLS2Y4wcsV0O2gRAqaXP2Lt6050KmclwAlSsWM7dTpuxA/EybripowublmuD7cWmmqoXmyNg9FXV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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
index 1d042551619e..0c5917a7a545 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -258,9 +258,12 @@ static bool compress_init(struct i915_vma_compress *c)
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
@@ -292,15 +295,17 @@ static void *compress_next_page(struct i915_vma_compress *c,
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
@@ -389,9 +394,8 @@ static bool compress_start(struct i915_vma_compress *c)
 }
 
 static int compress_page(struct i915_vma_compress *c,
-			 void *src,
-			 struct i915_vma_coredump *dst,
-			 bool wc)
+			 struct iosys_map *src,
+			 struct i915_vma_coredump *dst)
 {
 	void *ptr;
 
@@ -399,8 +403,7 @@ static int compress_page(struct i915_vma_compress *c,
 	if (!ptr)
 		return -ENOMEM;
 
-	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
-		memcpy(ptr, src, PAGE_SIZE);
+	drm_memcpy_from_wc_vaddr(ptr, src, PAGE_SIZE);
 	list_add_tail(&virt_to_page(ptr)->lru, &dst->page_list);
 	cond_resched();
 
@@ -1054,6 +1057,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	if (drm_mm_node_allocated(&ggtt->error_capture)) {
 		void __iomem *s;
 		dma_addr_t dma;
+		struct iosys_map src;
 
 		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
 			mutex_lock(&ggtt->error_mutex);
@@ -1062,9 +1066,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			mb();
 
 			s = io_mapping_map_wc(&ggtt->iomap, slot, PAGE_SIZE);
-			ret = compress_page(compress,
-					    (void  __force *)s, dst,
-					    true);
+			iosys_map_set_vaddr_iomem(&src, s);
+			ret = compress_page(compress, &src, dst);
 			io_mapping_unmap(s);
 
 			mb();
@@ -1076,6 +1079,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	} else if (vma_res->bi.lmem) {
 		struct intel_memory_region *mem = vma_res->mr;
 		dma_addr_t dma;
+		struct iosys_map src;
 
 		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
 			void __iomem *s;
@@ -1083,15 +1087,15 @@ i915_vma_coredump_create(const struct intel_gt *gt,
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
@@ -1099,7 +1103,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 			drm_clflush_pages(&page, 1);
 
 			s = kmap(page);
-			ret = compress_page(compress, s, dst, false);
+			iosys_map_set_vaddr(&src, s);
+			ret = compress_page(compress, &src, dst);
 			kunmap(page);
 
 			drm_clflush_pages(&page, 1);
-- 
2.25.1

