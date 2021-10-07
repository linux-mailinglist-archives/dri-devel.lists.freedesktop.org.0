Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE2425B92
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F31C6E02C;
	Thu,  7 Oct 2021 19:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879666E02A;
 Thu,  7 Oct 2021 19:35:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="289843117"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="289843117"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 12:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="478691818"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 07 Oct 2021 12:35:13 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 12:35:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 12:35:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 12:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDC9svf8ag++U5MALXbWgs3yCSRGhTRULN3RqPrixmzxoSk04rJWd3JbkaeRSGVspczXLUAsfumjXI7vQeRJjuSEbFMsKT8WYTdj9EWIbTql4LAMO2T4FpP5V1tU+ATQf7NM/ylEwdrHQ1VHk/qSjueuZkZPL5Zk/rX3/Xck4drehMpl3fAcKnRhlrl98N1eXfvMvEeO56PoYZVML0GtxYpTTvdYAh+3D0z0mZSIQoHXnJjTeus7xMtrBoS9hxNP+KS8lc8e3o2gshwxGW5Ocf6cZinHd//xOKZN3O8uVMKxfYUM9pM4/oKTjuLJy8kiEE0AuQtkQUACpEL9g1Stog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLOGZ8kD+/mI3Vl9oHqit4y1qOn1qfDmnpxRVOaZRzM=;
 b=ip29e3v/vZIAtgo7iWibsm7vdZwKR3ral+p1BOWHp3cEghX8yorZVSktrzaxdw/xn0271IAcuCEPGu/i1xbTbNWRRwzEoL6jfJsKRyEDbN8uSwTxhogMmIKebT6FWwqnOKr1SsZ5hXs3Du3Z9xWJU0CgM9nx1SDwQBWJUj7bXEyKzh9ndyMIo6EwQO8E6Mnp2YAJvV3/eOJfhoLoDVs7jkXcdMsfCBFswLpeFWuTqGOb2828If8B9GQbaVKn2p869Q7wefRFiPX1q+R1/q1wh/VvlAWdU4RifXwOhqdWaf/SDCy6Icu+yCT1oUTZzPCE4CtaOa6myivnxz4EqRWf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLOGZ8kD+/mI3Vl9oHqit4y1qOn1qfDmnpxRVOaZRzM=;
 b=PSmAG2HJ5b5IEkRo3ys8Zl9rkFiVM9ik0tMgb7a77MrjQ7Q5gZd/kNIgtcmoZ6r12/r2rIp/TGyoG/CnEYFJ0r5jwIXDYNOZKTA7zmtamurZMCZFUNSRnsPqiPScrACb2LX1ZtvRAhdMQ2kozT86gUYyty8oU4kB9kYBFX4SGUI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 19:35:11 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 19:35:11 +0000
Subject: Re: [PATCH 07/26] drm/i915/guc: Introduce context parent-child
 relationship
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-8-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <624cb924-dadc-89f8-6f52-c56366f15eb1@intel.com>
Date: Thu, 7 Oct 2021 12:35:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 BYAPR08CA0008.namprd08.prod.outlook.com (2603:10b6:a03:100::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 19:35:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f189aef-4b65-46a2-4a94-08d989c993ec
X-MS-TrafficTypeDiagnostic: PH0PR11MB5628:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5628750A667F205DAF2092BFBDB19@PH0PR11MB5628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OQDYfaF6xfruKBtwhEQa6lenL89sZHChE1GdM1WyN6ygiqeCjlboF+FWZm15GfKKkJXG1AoWnffpG4snXN9vQYlr7QwDmIP8I2BZeOw21+K0OJQpHdoGaXEuu6qJ6PVT8WQstNLkLsR7+lZVTd/LmPLMFbA4COhCX8eNejYFs8JFB0U3EnjN/M/gXYi/K7dhPqQqoPqfY+ZnzERZJtcTe2MFZmBLo4NzEuZu15CAWmos/pWnj6EzgY4JBVJ4rqzlfzlPrgInDIbqFetbPo8kHtKu6w37dcDpjSilICs9CNFww/zQOWkOBVCJrkPBJUVZQXh1cUmapbf+aE0AzjPrOM67LmO3UivF3hScrIuf0RjSs/0o/bfoGskL/jL2pbC9as7nnbpEqdJ1TNF1dj3lv4KM1kN33WsBiMfMfhLYLJQGphvn9kqziTM8Lc+CHXggXr+qn/AsMyFSFKg36y9r7w7YmoI5jnTl0hrqFz+N/pnSpF/yM3wRzjUo0XZO40gdUgZsa7wFRLTqhhcgih1eMhew7L0IZXeRaSPuvsFKL+rP/blVDN9uI3fHp5kt+Vd5soduNGXfOspZx2u+UYjHYIfDtxoxGtp79yenaFvcc2BoyUW58CoRVQKInsierxBjMnZg5I56ikvjD97yDNZkwushipNE7HRmfqMV3sVENmMCaXoVKRL6OZyR6HjFXJtwFWwcG3R5fYC53T0TEd87OQuL+iC0MyLDmL6+nn/5SkNXSDGQqOJp8RHIvP0/QHVWZ+PFTkK+zvcQVAfCQfHCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(31686004)(36756003)(186003)(83380400001)(38100700002)(2616005)(450100002)(956004)(316002)(26005)(16576012)(4326008)(508600001)(86362001)(6666004)(2906002)(8936002)(31696002)(66556008)(5660300002)(107886003)(8676002)(66476007)(66946007)(6486002)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEtFbkd0VHhhNU1oTCtva0ZnYjBVTURBd3piRGZDTks5T1NIdHVUeEFkN1JE?=
 =?utf-8?B?aVk3b29OY0xSVXNrbUJjQ0pQR3BudmQ5ZUNUWjZxUy9LMUdVMWorY09uVWhY?=
 =?utf-8?B?VHNCcGlvUGZjWFUvYzBZa2xiajd6NEZ2SFptZmdSOVp1VkthbVc0MllMeG9s?=
 =?utf-8?B?V1JsUEN3ZE94SlV3WVFJR2VyLzRLa2orVnlOSlkyb2JPQWFSRmJrTWpmMFVK?=
 =?utf-8?B?YldkSnJnZzhhSjlXZlp5QzRTeUhmK3dYcFJLS2ZId3h4Sk5VTXZySG1vWU1y?=
 =?utf-8?B?d0VEM0tnUXJWV3BsNlNJa1VqeW11LzA5R1V4VHNYci9ZNkpUbUZwZmc1SE0r?=
 =?utf-8?B?aXRXa3lLSTlLNDhLM0ZFZ1JjV0VvMzBYTnRHamk3RDFDSXBXUUc0SFVVeHdI?=
 =?utf-8?B?TG96NDQ3SU1GeGgzUU1DOUdtUndQRkJGaHNpQXVxS2cvRi8wSEJwUTVXcjlh?=
 =?utf-8?B?by85OXZVV3VBOGdJTVMvS21oMGRjakN3cU1UTGV0UnAzUWRqLzBHajZNVVBU?=
 =?utf-8?B?SGt5cTQrTVVZYTVKNHlSUmJSWTFremJqOFV2NmI2ODgxdDFyakE5bTlHUkZi?=
 =?utf-8?B?TkRkRFJ2Zy82VDZPcXlWYVVJTS9kNnRJZ25LK1R3dXVlQ0Fod0VKU3NFamFQ?=
 =?utf-8?B?TnpzRmpYc1VLSlR1UXZhalZQbWQ4RWMvYXF6SUdodDUrZXNtQjBRL0JveG1a?=
 =?utf-8?B?UkNpQnR2ZUN1VHczNnpmM2RPejZpUzAzWTdMUjgzbmxRNUNibm8yRmZab0N5?=
 =?utf-8?B?K3BBNFZIK0xkejVQR0c0VTBRaHhXT3h1RUExWUVYWVBrVis3ZVpYb3JVTVZE?=
 =?utf-8?B?N0lrbDU0ZjI4bkgvdnFkeXFSdDlxakVEZmprNDN0S3FEQ0NEWUZ2MnRpVWdl?=
 =?utf-8?B?dG1IUVhpamgxWWtjaFBsQ2NWSW1EdnNGY1ZlMXBpSGpVM0NGbkNZUlRoWWpI?=
 =?utf-8?B?d29uWUZBSUxRNTlFWlZxNUJpK1V3SGlXNHFjaXY4Yk1yTVdSL05saXZsWUV6?=
 =?utf-8?B?T3I5dzFIVXc0YzdUMFRvdVYwNCthanBiNlpoKzdHZGVoOVRrTzVsNUJyb1A1?=
 =?utf-8?B?eGFscW0yYmp4YzdHMGV5aFZNb0F1ZW1OMlpRWmlmcllrTlRmdXJ1WUhHbG9B?=
 =?utf-8?B?ZnhIdmNJZGxJdmJWU3Rib0M2ek5JUVBSbUJOMklTQXNnWnVCRTBWbkRCeWFv?=
 =?utf-8?B?MkhGbDl0QXJHTVllWXYxL1hQaTI2aXpuY2I4UXFTemNOREt5SDk3YzlSSlAw?=
 =?utf-8?B?TkIwRmdCS3lVU1F0dVR5UEYvM3lMM3hqZzJYQnptRHFLMzlnWmZvaUxZRm9v?=
 =?utf-8?B?YzBobFVpY3FJSVJYRWcvSlRTMlpJNk8wTUhUSkVNZ2dyckJ5aVQ3dHJibXA4?=
 =?utf-8?B?ZFR4V01jdUp3ajd0YXhlK0huaU5VcVRWTmpYWUNqYkdLdW1lTHJadGlwOC9S?=
 =?utf-8?B?V1JZeVZ2ZGlpdmRBSzltSmUyaTlnb0llaXNkaU96c05jR0lNV1NIYzJhOEhk?=
 =?utf-8?B?UUlaNFlPM0RpTkRrWFdBWlM3Mmo1b0ZwdExPKzUyU3J6YXFycHRuQi9IeEx6?=
 =?utf-8?B?bEc0TmZqbi9KZFlvY0lOWmVCdHltRnp6T2FsWERZM01nNE9jRWJkaUZXQkNC?=
 =?utf-8?B?WTdXdS8zUEUyd1ZYZWsyUG9xOEl5UkZiNzMreGZ1c0tmRU8rNjVMc0syQ21T?=
 =?utf-8?B?UFp0SldGWXUxVUF3a2dkVHNkY2pUS1QrMVNha3JoTGV3eFBEczQyRXBxOTlB?=
 =?utf-8?Q?tve2vJFVG4FBbXq0Yia9kPPl7MzHZ9jXXx1BI7Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f189aef-4b65-46a2-4a94-08d989c993ec
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 19:35:11.4436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKOmT0G4JxP8w/IPoI4yLhVIwrw3fcRk5qjKeP2/bE692NaR0zXuIdOPdKWe8+/3dJOP1pgivLfkl8NE6+EL/oCW8kaU6TvK+YY7kCHOIHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/4/2021 15:06, Matthew Brost wrote:
> Introduce context parent-child relationship. Once this relationship is
> created all pinning / unpinning operations are directed to the parent
> context. The parent context is responsible for pinning all of its'
No need for an apostrophe.

> children and itself.
>
> This is a precursor to the full GuC multi-lrc implementation but aligns
> to how GuC mutli-lrc interface is defined - a single H2G is used
> register / deregister all of the contexts simultaneously.
>
> Subsequent patches in the series will implement the pinning / unpinning
> operations for parent / child contexts.
>
> v2:
>   (Daniel Vetter)
>    - Add kernel doc, add wrapper to access parent to ensure safety
> v3:
>   (John Harrison)
>    - Fix comment explaing GEM_BUG_ON in to_parent()
>    - Make variable names generic (non-GuC specific)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       | 29 +++++++++++++
>   drivers/gpu/drm/i915/gt/intel_context.h       | 41 +++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_context_types.h | 21 ++++++++++
>   3 files changed, 91 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index f601323b939f..c5bb7ccfb3f8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -403,6 +403,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   
>   	INIT_LIST_HEAD(&ce->destroyed_link);
>   
> +	INIT_LIST_HEAD(&ce->parallel.child_list);
> +
>   	/*
>   	 * Initialize fence to be complete as this is expected to be complete
>   	 * unless there is a pending schedule disable outstanding.
> @@ -417,10 +419,17 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   
>   void intel_context_fini(struct intel_context *ce)
>   {
> +	struct intel_context *child, *next;
> +
>   	if (ce->timeline)
>   		intel_timeline_put(ce->timeline);
>   	i915_vm_put(ce->vm);
>   
> +	/* Need to put the creation ref for the children */
> +	if (intel_context_is_parent(ce))
> +		for_each_child_safe(ce, child, next)
> +			intel_context_put(child);
> +
>   	mutex_destroy(&ce->pin_mutex);
>   	i915_active_fini(&ce->active);
>   	i915_sw_fence_fini(&ce->guc_state.blocked);
> @@ -537,6 +546,26 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   	return active;
>   }
>   
> +void intel_context_bind_parent_child(struct intel_context *parent,
> +				     struct intel_context *child)
> +{
> +	/*
> +	 * Callers responsibility to validate that this function is used
> +	 * correctly but we use GEM_BUG_ON here ensure that they do.
> +	 */
> +	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
> +	GEM_BUG_ON(intel_context_is_pinned(parent));
> +	GEM_BUG_ON(intel_context_is_child(parent));
> +	GEM_BUG_ON(intel_context_is_pinned(child));
> +	GEM_BUG_ON(intel_context_is_child(child));
> +	GEM_BUG_ON(intel_context_is_parent(child));
> +
> +	parent->parallel.number_children++;
> +	list_add_tail(&child->parallel.child_link,
> +		      &parent->parallel.child_list);
> +	child->parallel.parent = parent;
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_context.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index c41098950746..b63c10a144af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -44,6 +44,47 @@ void intel_context_free(struct intel_context *ce);
>   int intel_context_reconfigure_sseu(struct intel_context *ce,
>   				   const struct intel_sseu sseu);
>   
> +static inline bool intel_context_is_child(struct intel_context *ce)
> +{
> +	return !!ce->parallel.parent;
> +}
> +
> +static inline bool intel_context_is_parent(struct intel_context *ce)
> +{
> +	return !!ce->parallel.number_children;
> +}
> +
> +static inline bool intel_context_is_pinned(struct intel_context *ce);
> +
> +static inline struct intel_context *
> +intel_context_to_parent(struct intel_context *ce)
> +{
> +	if (intel_context_is_child(ce)) {
> +		/*
> +		 * The parent holds ref count to the child so it is always safe
> +		 * for the parent to access the child, but the child has a
> +		 * pointer to the parent without a ref. To ensure this is safe
> +		 * the child should only access the parent pointer while the
> +		 * parent is pinned.
> +		 */
> +		GEM_BUG_ON(!intel_context_is_pinned(ce->parallel.parent));
> +
> +		return ce->parallel.parent;
> +	} else {
> +		return ce;
> +	}
> +}
> +
> +void intel_context_bind_parent_child(struct intel_context *parent,
> +				     struct intel_context *child);
> +
> +#define for_each_child(parent, ce)\
> +	list_for_each_entry(ce, &(parent)->parallel.child_list,\
> +			    parallel.child_link)
> +#define for_each_child_safe(parent, ce, cn)\
> +	list_for_each_entry_safe(ce, cn, &(parent)->parallel.child_list,\
> +				 parallel.child_link)
> +
>   /**
>    * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
>    * @ce - the context
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 4613d027cbc3..76dfca57cb45 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -220,6 +220,27 @@ struct intel_context {
>   	 */
>   	struct list_head destroyed_link;
>   
> +	/** @parallel: sub-structure for parallel submission members */
> +	struct {
> +		union {
> +			/**
> +			 * @child_list: parent's list of children
> +			 * contexts, no protection as immutable after context
> +			 * creation
> +			 */
> +			struct list_head child_list;
> +			/**
> +			 * @child_link: child's link into parent's list of
> +			 * children
> +			 */
> +			struct list_head child_link;
> +		};
> +		/** @parent: pointer to parent if child */
> +		struct intel_context *parent;
> +		/** @number_children: number of children if parent */
> +		u8 number_children;
Is there any particular reason for using 'u8'? A simple 'int' can be 
much more efficient depending upon the host CPU architecture.

Not a blocker though. So with the typo above fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> +	} parallel;
> +
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest

