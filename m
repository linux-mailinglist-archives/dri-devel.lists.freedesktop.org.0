Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D386E9DE7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 23:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3D510E2DD;
	Thu, 20 Apr 2023 21:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A628110E2DD;
 Thu, 20 Apr 2023 21:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682026260; x=1713562260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YPkCYoH+y9+Lc2jgVBVQeyxwA5Nyu0F+VwjrKoRfT1w=;
 b=MbyIDPbV3Jw2ID6vvyj82yaCMs02XEYBrUEMkO0V39eqFi1FG+6klxPO
 n3qUe45uBYemT5OuhumXwQ/lapb+7Gnmwp8yyy2QhBFFzpbUr+UXSyMu1
 17IuDwEtiGBYyNTlCrpTSDmKXa0onisRq4L4OvSu0dzZUU52WWXvcFloF
 7k7fOBZvfVf2DdvoWdIpgIXyVRiIsvCFHx+q9aM4bkwbvccI7rEdYJQ3f
 /v5f5uUI4jne7faSPexnHqH7NTUgi5FwAajkdslE46iyGZb/3NkBvqvDA
 0nndIDp85IMmbpJnyPi57oQwp2o/Ug+tAfI27xW4RfR2R2DFXVa4gP8es Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="373774068"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="373774068"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 14:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816182913"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="816182913"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 14:30:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 14:30:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 14:30:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 14:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBhjej2/oUV3f6XKSeIjrzeowe7AiBEhptuhHzdbsxhpdDjyJz5NrIZD9Nz8M6BWn/zVkHzn5DclPsv3yNTvBwzQFRS3SFH4XWg2xZe5Y6KsscjugwmVs2rgmHFo+UNhA8/szndI631MC7sEm1jHEg3sCOMmKFkjjzmCVBld+hrtjjHu4UsGgWso0Nq5DEzjolcGoZiUNnPySwJrGOMl/ggXXMyLe6Dh0IMMGu5AxVWHfjP596Eg2PwZ9WTnczH0EuAItES54I6QefPlMVz35PRQI4FlFWVxOkxCWYxXjwTsmMMg88JypsN3P87t5/EsBsw291SvKF3GOcrefkeoag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6r+62npF7zwG+aCr1nNLoylHgVWjKv1nUaQjTsFy5I=;
 b=B31CrcgUa52DA7SSD5uh8Lii5H1Gwxgw+uf6tl2yJT0S4O3ub10EHskGct5n8wDktdBW+uz7h0lJEW7NCAL0TJbl1mL1CBLzCuzsTrPsFivX+ryFRXc1PDP438BSGHVqrHwFfnuai6L4L09HYYuGyvNW8YyrH+I5QwtMTLVVw5LN1PZ87O1vcGT70ytMGdhWK5vKBfeWHkhVwq8lJbTO+DX1HoijB9iexVcx85puKMgddApmw/CIs7twLas27b80OrYd7r62/5NFJ/qo9b9/TbHE+TKXH3Df1XYz0XoPN8dvmmNfrWXdIrYFZkVM4L2khNucBWzWV8wQSmNvSOLLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5000.namprd11.prod.outlook.com (2603:10b6:510:41::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 21:30:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 20 Apr 2023
 21:30:56 +0000
Date: Thu, 20 Apr 2023 14:30:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: workaround coherency issue for
 Media
Message-ID: <20230420213052.GE4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230420113859.30965-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230420113859.30965-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::42) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0c96dd-9503-4853-2bc3-08db41e68669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TkswwLM+mX2PJcq/Yo0k45OBhuqauRqMCRNoFU79MN7A2FwQcLOjXxBHfl5KNvh+QOK5Qar7jg36YGaSo2/9kvbiPrUyUsvfeQNCDdXtI3iQnq7ycrVaWw8rhPsbXmcc5iFCE9mO2/QBculFNVYodiYODBazk9VqvRofdPnw8WZY4DndBKWEt5/ZEK0MOP5gBbLeD3juPmT9lBtyObKE1nvELyK3WzyTaRUzNxHR59c+3MmIUspGvOKvf17XiKYel8pO4nFBvj93Hyw0AyAN4hJ59zMRYAHcT8ZTvCup2oB655wtba/ewFPdedPGf61L9ZIgu7dve+3quPs+wq5zgOCPlmyG6+yZmIe4N0IV6R+RNuVt62ofGvTZMIHPI2szzoNLPUIl7O16E57aDvSsNo/EwsSN5FBFgijRwNA2YoBz8X0/dqq+H+GgD4dSZCYXD5/gEFh30U8huJQ4s9ytlYNPLN8WBQcumS4o/lp0oFqnz1OBH/NGxWfboIGMvtKGCtzjXapRfwTPfPYFTKALf1AJozudXz8wdGwI4nvda1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(450100002)(66946007)(66476007)(478600001)(4326008)(66556008)(6636002)(316002)(8676002)(5660300002)(8936002)(6862004)(38100700002)(41300700001)(82960400001)(186003)(83380400001)(6486002)(6666004)(26005)(6512007)(6506007)(966005)(1076003)(33656002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8ew5/IfzzNJEJFwy6MBgAdZwI1oAy1LI4zuSEKzeGPvrog/5OMKWJUKxzATS?=
 =?us-ascii?Q?uBR/64fDdWDLqEUg4lGPvDfnzHvU4xlax0G8aV4GRt71/m563wghmiv92pb9?=
 =?us-ascii?Q?iCobEa1OrGn99aXBhnYxV8EGkCoRhTjLSJqg7sGUAhsAIq0tZPVATe1u/Qig?=
 =?us-ascii?Q?zkECmfd199O12CveEFUF/RIs7hm2e3M4pRhsEZdppBX9+UrwXIWjoYJgvolT?=
 =?us-ascii?Q?dy8l3MnAXfl78+ozAl5E4p8iOQlWTXOfrqFBMpDrleiIEUsXfROlQe/DJ4DL?=
 =?us-ascii?Q?j+MjU6gcCbzSkOBzthy6FJpd0pQ3oUUIQ2AkaKw/IYRk9X1Cf/iASnFSJl++?=
 =?us-ascii?Q?p0lJ94F4LzNw6dduU1tBwgVuC9/5sNlnUsSiyIR4Wsw0svIENo57aWTk/7k8?=
 =?us-ascii?Q?OO/Q9XgANofiHrldU9jPsq1s49LQpT1j2W225mt1DnxRbTmdPR6kKOldQ0nq?=
 =?us-ascii?Q?1yd0CQrN/w24s5p4PuREGaHPHc9/qW1FO7/ee5Kgq0vkXbpNmcKuMM2Wmpxp?=
 =?us-ascii?Q?gBb87kVtM1WYkrk0AAi4fe0a0Ak0CmJTBOjb+5MO34fK7m/7fN0k+Z8BEQuW?=
 =?us-ascii?Q?/1quF1ywGhACmWdkV2cdRlLS6eqQhWLJd6Er2zFXk6c5+iOd2gdtcYQIG7Vu?=
 =?us-ascii?Q?F3F9C9mSVK29f6hHE/G2FIINgJavqIE6wpZj2mrbT2hrmzoPmNyMCTC4hYwt?=
 =?us-ascii?Q?zvs4KnCecOly3e5eJr730NdAfoQ5XK2BkqAPHAjQ6ecQlPc4BevCHy4wM1sz?=
 =?us-ascii?Q?0t6YtTNyOPYlNkpKt6XiXIwZu9zKiDNdpPOPBUZxAmg8tHu5mc/ae+4AAHd2?=
 =?us-ascii?Q?8VipWsjJrr+sL3F2mGvomJy70PHQNu+Ofor42qNErlVuDK2nMEocxKDaQFgX?=
 =?us-ascii?Q?mz4SZZEbOu4qkvPumS+wKB211flqI5TZnlvcIa1pBYgPENJ7CJ0+xp7lvg0B?=
 =?us-ascii?Q?1aiOYfSlSe4UCcB3F3HdVcPqIvl06KvYmuMyZbaN2KOzPmOa5KZDsDsoD1P5?=
 =?us-ascii?Q?BHiQ4645GZUzHTbdhSnQUEhs4D+Ud9pihgoLDRpoKC++2AWWDfGGAPH01Q8y?=
 =?us-ascii?Q?Wtv5NjNzd4erq7tfVL+jpNbV8abUWWMFY6Bk/oqqbhIUNLJkCpsnzAbjrNWe?=
 =?us-ascii?Q?E+AzE9YXt2PbP/lTo6kgm4zuIMME2Ld/FJOYJPB6ke0HTIL/fQcj6qx5u6Nb?=
 =?us-ascii?Q?N23tuLjWtbG7wAIZM1BBJVYNTiel02Wrwce8EloN9rMDBaibWV+aDd2zOlWO?=
 =?us-ascii?Q?s82osJiGKcCxYKU8HTrcNUunBbgicOY4VzTxicjZ3DxTfiSBHM8n2QjMNs/2?=
 =?us-ascii?Q?1cSlTAse44QiyORWoDKuEXwPQ/cKvbpXtUxzv0DlDVFTWXly1oaj4Zo6WDnT?=
 =?us-ascii?Q?/+oXVrTd71ZAHVCHxyyKlYv2OgKzj4Db0d9qhhiVzYi/jh+J42+SZueWSOQL?=
 =?us-ascii?Q?LGsGT2bV3S2FjwMol3zwMJ0y1i9S/oM73bKo42WLmXjL/MhSbFbWRRrlyRzZ?=
 =?us-ascii?Q?iyc44M5IUgTC93hBxEV8UpcjgwpadKXIrIZB6m8rkkxDPyRahaJiF44ToFdx?=
 =?us-ascii?Q?5IraUqkoT/Kx+pdrbVMi48IOiVHTwGONR0WXGnR5Ge3Fe/o7V19QOGK7/EgE?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0c96dd-9503-4853-2bc3-08db41e68669
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 21:30:55.8593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M28TsrAYv6nN54YLErdsVTbCtK7naVUn8Fi/vuEMjCP3tlDKFKm1IUnviwYBAyL+NfQlF3JBHBAco8uqGXxAV5QJPTAJnnTmVOLOYE04IrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 01:38:59PM +0200, Nirmoy Das wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> This patch implements Wa_22016122933.
> 
> In MTL, memory writes initiated by Media tile update the whole
> cache line even for partial writes. This creates a coherency
> problem for cacheable memory if both CPU and GPU are writing data
> to different locations within a single cache line. CTB communication
> is impacted by this issue because the head and tail pointers are
> adjacent words within a cache line (see struct guc_ct_buffer_desc),
> where one is written by GuC and the other by the host.
> This patch circumvents the issue by making CPU/GPU shared memory
> uncacheable (WC on CPU side, and PAT index 2 for GPU). Also for
> CTB which is being updated by both CPU and GuC, mfence instruction
> is added to make sure the CPU writes are visible to GPU right away
> (flush the write combining buffer).

I posted a note about the commit message here on the original series
about an hour ago:

https://lore.kernel.org/intel-gfx/20230420205238.GA4085390@mdroper-desk1.amr.corp.intel.com/

Patch itself looks fine, I just think the last sentence above should be
simplified to avoid inaccuracy.


Matt

> 
> While fixing the CTB issue, we noticed some random GSC firmware
> loading failure because the share buffers are cacheable (WB) on CPU
> side but uncached on GPU side. To fix these issues we need to map
> such shared buffers as WC on CPU side. Since such allocations are
> not all done through GuC allocator, to avoid too many code changes,
> the i915_coherent_map_type() is now hard coded to return WC for MTL.
> 
> BSpec: 45101
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++++-
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 +++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 ++++++
>  4 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index ecd86130b74f..89fc8ea6bcfc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -469,7 +469,10 @@ enum i915_map_type i915_coherent_map_type(struct drm_i915_private *i915,
>  					  struct drm_i915_gem_object *obj,
>  					  bool always_coherent)
>  {
> -	if (i915_gem_object_is_lmem(obj))
> +	/*
> +	 * Wa_22016122933: always return I915_MAP_WC for MTL
> +	 */
> +	if (i915_gem_object_is_lmem(obj) || IS_METEORLAKE(i915))
>  		return I915_MAP_WC;
>  	if (HAS_LLC(i915) || always_coherent)
>  		return I915_MAP_WB;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 1d9fdfb11268..236673c02f9a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -110,6 +110,13 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>  	if (obj->base.size < gsc->fw.size)
>  		return -ENOSPC;
>  
> +	/*
> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
> +	 * as WC on CPU side and UC (PAT index 2) on GPU side
> +	 */
> +	if (IS_METEORLAKE(i915))
> +		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
>  	dst = i915_gem_object_pin_map_unlocked(obj,
>  					       i915_coherent_map_type(i915, obj, true));
>  	if (IS_ERR(dst))
> @@ -125,6 +132,12 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>  	memset(dst, 0, obj->base.size);
>  	memcpy(dst, src, gsc->fw.size);
>  
> +	/*
> +	 * Wa_22016122933: Making sure the data in dst is
> +	 * visible to GSC right away
> +	 */
> +	intel_guc_write_barrier(&gt->uc.guc);
> +
>  	i915_gem_object_unpin_map(gsc->fw.obj);
>  	i915_gem_object_unpin_map(obj);
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index e89f16ecf1ae..c9f20385f6a0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -744,6 +744,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
>  	if (IS_ERR(obj))
>  		return ERR_CAST(obj);
>  
> +	/*
> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
> +	 * as WC on CPU side and UC (PAT index 2) on GPU side
> +	 */
> +	if (IS_METEORLAKE(gt->i915))
> +		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
>  	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>  	if (IS_ERR(vma))
>  		goto err;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 1803a633ed64..99a0a89091e7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -902,6 +902,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	/* now update descriptor */
>  	WRITE_ONCE(desc->head, head);
>  
> +	/*
> +	 * Wa_22016122933: Making sure the head update is
> +	 * visible to GuC right away
> +	 */
> +	intel_guc_write_barrier(ct_to_guc(ct));
> +
>  	return available - len;
>  
>  corrupted:
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
