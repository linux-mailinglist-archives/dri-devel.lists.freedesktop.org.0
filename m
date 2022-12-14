Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22DB64C35F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 05:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE56210E1B1;
	Wed, 14 Dec 2022 04:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F04C10E110;
 Wed, 14 Dec 2022 04:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670993933; x=1702529933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cTQFD0m1CaQuox7vdQckQJXpLILmQQB0B2KRi9doEmw=;
 b=CuNEDINi+v2kRL7jY8LmMsS1Jt4ow64DlBSyyd4qgYf1xs0gTZJhwDlD
 eWqNVwQyxZGHQIZ5QS+Q6bEZM5fS1DRx+wy+YNOsGVr/HEqvOlsbyEq1A
 Ba6zuJWDRKnOiOD77GWjDkOqrvU3knH+BR0a8kuWJVBrUvms+RAsFoQuW
 60nAzGMd7Q4vtw5goYeGxjvBXA8Q+WNnZdZ6q3l4R+rQvySKeWm3VK9aI
 zqzQIfLq/HhGrOds/xEX5H6lK3j3bKoZPOXGwZTQhv3gqQXNOzm1mc0mY
 OuLrGpWrJp5/L3sVWwski9lms2wQw5zrEqm1lQmcz+tDpAR8rW6lemKOv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="319456057"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; d="scan'208";a="319456057"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 20:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="823129772"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; d="scan'208";a="823129772"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 13 Dec 2022 20:58:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 20:58:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 20:58:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 13 Dec 2022 20:58:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMTLuxZbRHrVpVMrJ7F5u6i6OwuFkfanAxjZ4REUia01hRVBl1WyN1tidgHKEJ27NasxKOMPm2W7SDSJk6FGAtPSuJxIIeBBfNPPQiRGAZSqTkCAQxCDZ0bDkFXfHOV+CxAPTHrYEWsPnRA8jPeaSY8NLDLQ2it0huhx7GOH2b8RD/O8igOf+jfeuBVAfZx2dSi/tRlV2Zx7cc6JnZbdvqNepegejCsNa5uAoJHWSSnoULpN7qkasip9L1w/VywRerb+H95DXSipNsS8P/qK2zMSbi25gr4Mr1g5sBv7vwM3nNOectiFluR26vP1slbkfUA3ZefWzC6nXHtEALhkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1NNNYPtBdm7AXQAA4JlbZe+AG3anrTzhF6LdUh2v30=;
 b=iYWg18QzKKPjYqbbwifzaXuRhYVLlKYOEA6U659MUz/b6+jowX89l0WCC/og6p60/QW0Fknj1Beh05p6s+zUe54Z+0a3yc7nvyUXBYEGL2WY7nx0JspTA3dJjTyZtPteH8yPDM0zaSGALbqhWNpRm77TvR7QbfpRKNmQhxzSgcxLVvWUbRd8e75c+PqS80fKPZYnUpvabSkmM9xXHG1DNdtGETgg56QvQvzKkEzyLDVFGvM6QyHWFKu41J7fr5N+y6ReYmlBz0NvLLsDeCeNfchPfWMGvgndrOdR2tSU+3amwxG1NzwOIe4g5+DewucVCIadUe3ddiFZO4bz9kTRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 04:58:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337%9]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 04:58:44 +0000
Date: Tue, 13 Dec 2022 20:58:34 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v8 21/22] drm/i915/vm_bind: Properly build persistent map
 sg table
Message-ID: <Y5lX+rKcXkV9YoPI@nvishwa1-DESK>
References: <20221129072635.847-1-niranjana.vishwanathapura@intel.com>
 <20221129072635.847-22-niranjana.vishwanathapura@intel.com>
 <b6f14794-caa4-d19e-e61a-2778dad3f57b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b6f14794-caa4-d19e-e61a-2778dad3f57b@intel.com>
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ2PR11MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: b0370316-51bd-49ed-afb5-08dadd8fdfb1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7KjJ5dkHw8qCm2sWVzYF85Y2vZ6Fx7SRp0yaHQpSUn//aZP0SJpCUKpHo1eSt3QG4fc+PHJc2UESzDj6+9O6HH2W2g7envaDS56jR+iq7xfb2+Vp4oZkib/MCavN/NXj2dSSEi7zRzf6D+6k+F//BewViqBG6A3JZAIZG/demddD5GxwRT3hKyxEUorteSDVR5wpTfwJkOqFhRWxJPpBDsoYwLCP/hfVBWnD+PCCAWHB5MfkTHND+SCQgYbgHiZEg8VGu9Z3Tg0oDoDqF7I2LI4vqCK5GTTLxDqyLksLssytvFWZkKT9Sw9ecnKEFnI09S4kDaAfjv9amt114oq6mCRH7yW/D09e7uFiTZLAHxpffPv1i3um3RRO0xlHqVYaYZpISr9leTLWVjjZMR2OZ/NJ3M7w/e2yc5mJFUOOMhjvYz7KDls2cmKxllRMlc3W4Xp3Qr1eCuaC4vBzctDk4DSwiqDt1imzY04CojfE/+1ENRDn6Y2ehTu/PlGFic9GlTKX9ePFhGkNrQJ+L2Fm6TTq/FT9yQZW0A5wZY2pYOuMGwq1s1ApWkWwtxfm7wAvg6aKI9D660dxqvI7qHuoCU74UbnFIUXlc9qWccM8U5TKyRtKJ3FMvRH/bLxEjOlahOWmAR7gryntHEIGaGfitCOTH88YnJMPeGWRUn/FxJ2Gdw6zr/iwWktSDpRZwdUKev8P4FI++qmqxNJz3CmRkbTGw8DomtC3y4fKFSGvpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(6512007)(478600001)(9686003)(26005)(66476007)(38100700002)(82960400001)(8676002)(8936002)(966005)(66556008)(6862004)(6486002)(66946007)(6636002)(6666004)(4326008)(316002)(86362001)(2906002)(44832011)(6506007)(41300700001)(186003)(83380400001)(5660300002)(33716001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nlb/OrPX+cfG8AMQ3iBiNP3HXATxD+XcGvF38Nq6+27Kl7M/C/a5VKsiV6kP?=
 =?us-ascii?Q?BZce/Okx/rRmiJFr0xx15Oz1cEok1XyK9vC7JZDk4KCthYFg1CWshoWe6FPC?=
 =?us-ascii?Q?qY2mb7ePnP2lBMMT5N2+vc+/oFKZhVOUuJhv10Wlnbv5CTBAWAJUia4Xeppa?=
 =?us-ascii?Q?0/ZbCaOadP6mq1LGkAm1Q3GH81C3D0v8uXYb9q7cWBJRVxixe+Tni/7OvENh?=
 =?us-ascii?Q?w+QyrEG2I9cDUZiqVHm9iYsO7BDsUH2yDgHsyMsCv2FlrfE1l9t+Y8tE0Hvv?=
 =?us-ascii?Q?Kb5qV80zGZ/4WPFwxtWDos5q3rQXVyzFimyfmzoGnfHFfXsv83jJh+p6GPxd?=
 =?us-ascii?Q?AAmOQ98LD7UwqItnJVN0fxyDeluC61KK+nsNBqM0livmlpJVkPYXebhu8QAZ?=
 =?us-ascii?Q?AnKA7/n04c6LMiFW35/dUydRtMEmIyDB20rd2z4hKxiw6+/h4P1iiechKYDy?=
 =?us-ascii?Q?dkBwtQwHYe3zLN5bLcxYhVfWsAkNVPyGUh/hV0Q54lWDWxgyUb+0y6mGDQ74?=
 =?us-ascii?Q?8RJQ38LngVPvlBChByiEMmWNJFiPNDATcTtXLbj387iceW7166ZWwap2rIVX?=
 =?us-ascii?Q?1dNCdY9IpLDexhyBCVJCsgrmkWZRY8QYgWCRUzWs2WiT2C0U9qYaVKECd1ib?=
 =?us-ascii?Q?MvtP7z1GCMcUNLETBc/J+JM8uDmeKSI9LO+td2FJbk+crRKuSP8cZmh9ULBF?=
 =?us-ascii?Q?X6KkK5BkknuaVqafBhwSnBdqBBhk6qg1P5JDTdtyShRtOWsQ777wxf+C97Sq?=
 =?us-ascii?Q?KECdM2z3HqRqlJnHkOd8WL6GjKyorwG6ZLYIsxYU3M86qMJenEjt9A69A7Hq?=
 =?us-ascii?Q?26oV01mCLgYWIpToCmNKI+3qMu5pAuwANqWOJbnj1+xpIYuoubV4TxpLLP1Z?=
 =?us-ascii?Q?W5HuNzqaxhz0VAh5didQKQjVaJ4KkrFMKW3cte9kgz9oAqxnq8eJHz3Dn9pM?=
 =?us-ascii?Q?uQkT+gaO1RQ4OXCErTd6MHuYWqHkdzU5jAWTXRl20vrn5AqrVVz5NnBzmCBq?=
 =?us-ascii?Q?Z675kmgLtQP6UZOUkD2A30sSwgEXecuHyjKrxLeBb4YtxgdHpvygPtMh1FyZ?=
 =?us-ascii?Q?ksrD2NkmgNSzpvHehKcMzFTwNw6tl1yuge6IyaSKq72jRpxYy0POqZapMzjM?=
 =?us-ascii?Q?c1qCmimGYt9blei9P4+VCiYJIfwXuBrEZmRf1uuyf8cCQ+4NIA30W/mBZL6z?=
 =?us-ascii?Q?dPJqPz6RAscHa6XYqM/zGt/KE7jCkqCJZ7ySpXpWpv6ISkGM3n9FzCp/B6r4?=
 =?us-ascii?Q?lBc695VwnR3+KY357nhZnfejAM5Ig36moB6LuNCKHPuCVomucwWjbL2raOb8?=
 =?us-ascii?Q?BXfpc6e4Sar5XsZJEBz9l7Aa3/5hBTi71K6TghtIA04xGqGS08cRwGy1FvYy?=
 =?us-ascii?Q?u2QmJDPqdLBCFHWFBZlTFSbbQRL3/a3GYNNhaA9eUivqMBM2fJJZdNyZ7rpb?=
 =?us-ascii?Q?nfel0K2zPXYwciaUdkShxdadLiDkN4CfwmjaFG3WFaSC/PfphmAW52e5uqyl?=
 =?us-ascii?Q?XPFZppyfPNOfSUV+7TltT/AgQ9OouZZlbH2gxEs9Xclcu0rZLOMrc9zhwoeY?=
 =?us-ascii?Q?YgOJKct8DnS+alGlCqI6MrNbXWanqFaIFLx2dwLWlU3++0l9kOiHz1QKirVG?=
 =?us-ascii?Q?F59Upv8TTJ4Zs0l8gmSSlgg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0370316-51bd-49ed-afb5-08dadd8fdfb1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 04:58:44.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTqVp5j4kt0vB0F2djIe1MNJzs5aYnAISkCg+QNUFkgSiQuhIsz9yNexDrj0Ly1eGbFdc+rsQemiMa2bk04pnZzdvOCrWLckbl2uLoaRYQfeRusN3E6+OR8hRLlW81Nt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 06:17:01PM +0000, Matthew Auld wrote:
>On 29/11/2022 07:26, Niranjana Vishwanathapura wrote:
>>Properly build the sg table for persistent mapping which can
>>be partial map of the underlying object. Ensure the sg pages
>>are properly set for page backed regions. The dump capture
>>support requires this for page backed regions.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/i915/i915_vma.c | 120 +++++++++++++++++++++++++++++++-
>>  1 file changed, 119 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>index 1b9033865768..68a9ac77b4f2 100644
>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>@@ -1298,6 +1298,120 @@ intel_partial_pages(const struct i915_gtt_view *view,
>>  	return ERR_PTR(ret);
>>  }
>>+static unsigned int
>>+intel_copy_dma_sg(struct sg_table *src_st, struct sg_table *dst_st,
>>+		  u64 offset, u64 length, bool dry_run)
>>+{
>>+	struct scatterlist *dst_sg, *src_sg;
>>+	unsigned int i, len, nents = 0;
>>+
>>+	dst_sg = dst_st->sgl;
>>+	for_each_sgtable_dma_sg(src_st, src_sg, i) {
>>+		if (sg_dma_len(src_sg) <= offset) {
>>+			offset -= sg_dma_len(src_sg);
>>+			continue;
>>+		}
>>+
>>+		nents++;
>>+		len = min(sg_dma_len(src_sg) - offset, length);
>>+		if (!dry_run) {
>>+			sg_dma_address(dst_sg) = sg_dma_address(src_sg) + offset;
>>+			sg_dma_len(dst_sg) = len;
>>+			dst_sg = sg_next(dst_sg);
>>+		}
>>+
>>+		length -= len;
>>+		offset = 0;
>>+		if (!length)
>>+			break;
>>+	}
>>+	WARN_ON_ONCE(length);
>>+
>>+	return nents;
>>+}
>>+
>>+static unsigned int
>>+intel_copy_sg(struct sg_table *src_st, struct sg_table *dst_st,
>>+	      u64 offset, u64 length, bool dry_run)
>>+{
>>+	struct scatterlist *dst_sg, *src_sg;
>>+	unsigned int i, len, nents = 0;
>>+
>>+	dst_sg = dst_st->sgl;
>>+	for_each_sgtable_sg(src_st, src_sg, i) {
>>+		if (src_sg->length <= offset) {
>>+			offset -= src_sg->length;
>>+			continue;
>>+		}
>>+
>>+		nents++;
>>+		len = min(src_sg->length - offset, length);
>>+		if (!dry_run) {
>>+			unsigned long pfn;
>>+
>>+			pfn = page_to_pfn(sg_page(src_sg)) + offset / PAGE_SIZE;
>>+			sg_set_page(dst_sg, pfn_to_page(pfn), len, 0);
>>+			dst_sg = sg_next(dst_sg);
>>+		}
>>+
>>+		length -= len;
>>+		offset = 0;
>>+		if (!length)
>>+			break;
>>+	}
>>+	WARN_ON_ONCE(length);
>>+
>>+	return nents;
>>+}
>>+
>>+static noinline struct sg_table *
>>+intel_persistent_partial_pages(const struct i915_gtt_view *view,
>>+			       struct drm_i915_gem_object *obj)
>>+{
>>+	u64 offset = view->partial.offset << PAGE_SHIFT;
>>+	struct sg_table *st, *obj_st = obj->mm.pages;
>>+	u64 length = view->partial.size << PAGE_SHIFT;
>>+	struct scatterlist *sg;
>>+	unsigned int nents;
>>+	int ret = -ENOMEM;
>>+
>>+	st = kmalloc(sizeof(*st), GFP_KERNEL);
>>+	if (!st)
>>+		goto err_st_alloc;
>>+
>>+	/* Get required sg_table size */
>>+	nents = intel_copy_dma_sg(obj_st, st, offset, length, true);
>>+	if (i915_gem_object_has_struct_page(obj)) {
>>+		unsigned int pg_nents;
>>+
>>+		pg_nents = intel_copy_sg(obj_st, st, offset, length, true);
>>+		if (nents < pg_nents)
>>+			nents = pg_nents;
>>+	}
>>+
>>+	ret = sg_alloc_table(st, nents, GFP_KERNEL);
>>+	if (ret)
>>+		goto err_sg_alloc;
>>+
>>+	/* Build sg_table for specified <offset, length> section */
>>+	intel_copy_dma_sg(obj_st, st, offset, length, false);
>>+	if (i915_gem_object_has_struct_page(obj))
>>+		intel_copy_sg(obj_st, st, offset, length, false);
>>+
>>+	/* Mark last sg */
>>+	sg = st->sgl;
>>+	while (sg_next(sg))
>>+		sg = sg_next(sg);
>>+	sg_mark_end(sg);
>
>Do we need this bit? The nents is exactly orig_nents, and 
>sg_alloc_table will already mark the end for you.
>

Ok, looks like we don't need it as sg_alloc_table() sets it.
While looking at sg_alloc_table(), looks like it is possible for it
to return with -ENOMEM with partial built table, but we are not
cleaning it anywhere. Something to consider later may be.
https://elixir.bootlin.com/linux/latest/source/lib/scatterlist.c#L330

>Is it not possible to re-use remap_contiguous_pages() somehow? Also do 
>we need the dry_run bit if we use sg_trim()? Maybe something like:
>
>dst = sg_alloc_table(partial.size);
>
>remap_contigious_pages_sg(dst, src);
>i915_sg_trim(dst);
>
>dst->nents = 0;
>sg = remap_contigious_pages_dma_sg(dst, src);
>

But then those remap_contiguous_pages[_dma]_sg would look just like
out intel_copy[_dma]_sg().
And the problem I have with i915_sg_trim() is that it uses _sg iterator
only and not _dma_sg iterator. I think at least in theory, it is possible
to have more number of dma_sg elements than the sg (page) elements. Right?
That is why I am doing a dry run of both above and getting the max of both.

Niranjana

>>+
>>+	return st;
>>+
>>+err_sg_alloc:
>>+	kfree(st);
>>+err_st_alloc:
>>+	return ERR_PTR(ret);
>>+}
>>+
>>  static int
>>  __i915_vma_get_pages(struct i915_vma *vma)
>>  {
>>@@ -1330,7 +1444,11 @@ __i915_vma_get_pages(struct i915_vma *vma)
>>  		break;
>>  	case I915_GTT_VIEW_PARTIAL:
>>-		pages = intel_partial_pages(&vma->gtt_view, vma->obj);
>>+		if (i915_vma_is_persistent(vma))
>>+			pages = intel_persistent_partial_pages(&vma->gtt_view,
>>+							       vma->obj);
>>+		else
>>+			pages = intel_partial_pages(&vma->gtt_view, vma->obj);
>>  		break;
>>  	}
