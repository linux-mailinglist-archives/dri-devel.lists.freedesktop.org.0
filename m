Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8D27AAD14
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 10:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E359A10E132;
	Fri, 22 Sep 2023 08:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2CD10E11C;
 Fri, 22 Sep 2023 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695372545; x=1726908545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oBUTtzKXUXJy6s2yTtAOdIsGaHdKjqBEkEQplDlVIts=;
 b=Qlh/51oIa8rnp+G9b4v3coN9WgKAtH17x57VwlVI4pb5yVY3RklGhuVg
 z0vwf0nw5Pxh8j5FWBCwJYIANYmeE+V54XHc3aeFVBNpnJnbVBzfhDquM
 roebsic1TWKqrkG6P3upOwlgDnxAtdK9qEf/OUW4b8L9RbLTa0WBNZOBp
 PoinncdaCBpFYpMHZms44Id3aumCR4j/UO5K4r3N6fLXmzlfljyRewLDm
 /q5TzRdZ/Uhp66Y+tbX9EaisKt2hV4Iw2KGonHzsXodCoJhTfRn425CYW
 9AN8g03O/ff3+nufO8f2+U2v3pKiRTTFPgWtcktfuiGYjZOaLmAjK9Io2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383524449"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="383524449"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 01:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="741022633"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="741022633"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 01:49:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 01:49:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 01:49:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 01:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHeI3fjRDFrPUjOwMluX7u/yHebJHFqfV6TdmSMLbdYbQech7tfFzfbfiDTfAxpS7Y2Tlg5tt2S5Q1hrsOh63hfbPDxp4bPYMAb5x7T2fwJMWPZxIZSCxC5WvIalbYUA1s/nY+lGV0IZ6TAN6KUzKRv4kLIlurbisT4NUok0PYyPbGg/BZncHMSTU+uWA9x/3YzsAr7RV8WA8wNWVFImo1m309bkGrGQWcfeGXPgZuagg/DpikJi3jpdOHhfGslzd896G1yzfukKS9ieIriby2QQ34OP8ZV/WAOfpKfI0K3j8lih6OAsKSUyI/XsUA5GEj+z6eIk9bZazcEnbfA2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er0g2akUN3z6E2mHT9IwsMMUa3f+KiXd7DWMOVf7ocw=;
 b=F7ns1nEXtL4e1agZifzFlSEBNsZg0zM7aNDkI5zNdMN5Gbx/FfSscpXzRl/48aJDvwPfLBZwBlV3W1KpNXPn8kdY9v9ktRndHueMi38GCZD2FndqWFsvd9R05aBubCuG3/Aidp2fnlYDnSRuK1iEzFhQFU98ugRtIWgrel0H1dIfo+iqreQGrqD2bU25qsiplbbHLTUFtfhj7llg7j4upXJtUgFmWm4UY2QCC+hN1IqeXCZG3+GXFoTpVpBOOACzjX8m0OPmrv+ieFk8lxr6m3fUcif4gdhpeU8leN0WCvsOT+xemjIVAHNg669iqnr9Ppyvy/0LcsRNW4rnQWAXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 08:49:01 +0000
Received: from BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::a20a:c16c:d141:c840]) by BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::a20a:c16c:d141:c840%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 08:49:01 +0000
Message-ID: <652f7064-2523-f810-3075-d66196fc42e2@intel.com>
Date: Fri, 22 Sep 2023 14:18:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH 5/5] drm/i915: Implement fdinfo memory stats printing
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
 <20230921114852.192862-6-tvrtko.ursulin@linux.intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230921114852.192862-6-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::19) To BL1PR11MB5480.namprd11.prod.outlook.com
 (2603:10b6:208:314::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5480:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3d9080-9b02-4606-b8ab-08dbbb48c454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ENyWgu0uGX5qjutUnxYKPHFjWxDWrRV8IeOnXVBy3ZMDnNxxcXYqPYATb4cnQv8mqS8L03et16rQ8fniBpVFNZZpBbyJyDkAPRQqP4mJ8KGLfrPmLYxlsB7dRzlavGM7IaC40sFxFfgrA1azMFqpJrtZN57v/jYjzRDIRGf71/sp7i4W200N6ljx75tX7qw7q6+HmGpuBJMBCTLAJKH6IMO51oUrnmiXRuf4F3P9Hw2InDkL4Hb9xeak9cHJvzmmCCvQr5rAMIJXSJPuRXMFFodfNyulcS0WSG0VrtEvuLKZ7f8T0M7JzUKMhh4+dMsWlXMWkdWatNunRoiJvzCK4mIWOPB4Gz1anSwwYW18oX5talhXZyfFC7JzTv7TWGpekFjPYtaNvoaNmUuy3CbeLbDe0n9z1oZZM11Tz2nHrZeK5A+Bn13XKKCTy8FGXq+rqIe0clMf9L1Z7msBgMmJVRdvxFPh6UcLYi2vM79lGBrJt6gD3SBUuAhpm5DHGgV+7ayBJZHJbYjaELYugK2BuweZXi5DQbA7fgU3zs7MwE7lZqppTh92bsqHf0XgNstfHgagIsSdQIMvxedQ/O6EgLikvuh6BscF+QhYacRQtY5InNusDYLPxuxGxJU1TnT+V9IDl5MMI3qeJ69tI+9WGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5480.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(1800799009)(451199024)(186009)(6666004)(66946007)(83380400001)(26005)(316002)(54906003)(66556008)(66476007)(2616005)(478600001)(8936002)(41300700001)(5660300002)(4326008)(2906002)(6512007)(6506007)(8676002)(53546011)(6486002)(86362001)(82960400001)(36756003)(38100700002)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm83T2pIYkY5a2NYN1Jrdy8xREpaV0FRWEhNODF6WERaaUt3bzYvU1VqSzhx?=
 =?utf-8?B?TVFOUHVZamhQSVIvL3VLdFdtTU16VkgzdUtObXpFSUlMTjh4TGlib2RjVDRx?=
 =?utf-8?B?M2wwMFFZYXI3dTIyUTc0RStpY0s5d2crdnNOQmRoeThvbFBzcG5lRGdWL0Mz?=
 =?utf-8?B?ZEh4MVZsMll4UE5taWhLdS9GcEgvYndadmVnRHNUUDdIN2xycFppVGJRN3E0?=
 =?utf-8?B?QUZHVXAvN3poMWJLT0YyT05SeWZ3RFh5aExKQ2M1RVdzVXArb0Z5UUN5Mlp3?=
 =?utf-8?B?WWFpYWdtaXVaRzduL0xRYUswNC9pU0Q1eWhVdmtZUUI0SDAyblBzUENiTGxY?=
 =?utf-8?B?RXoydWNRM1lTYzhqZ2ZzK25sbnRJb2IzNUNydUFLMGFzZmJpKzZBendBakFF?=
 =?utf-8?B?bUJEMDRpZ0oycVRrNGRsRHVyUmY5NEphNU05alZsODNZMjFUV2NtVG5RNHZD?=
 =?utf-8?B?OS9XcEkwRnNzcE9WUlhQdkF2cjVTK0h4VnVTa3NTVjIxR1JJZlpPakpQako3?=
 =?utf-8?B?QmFEdHBCTittQjdqdXEwK3Z6eHpTbHBMdjlMWTB1dXNoK29iSTF4SEQ2M2Z3?=
 =?utf-8?B?bEVENGZQQkl5WWFrZFdJelRKTFNlcWplM1ZYMFc0WUVhd1RhMmk3d3dKelQ0?=
 =?utf-8?B?cUdUeTAzSHZNbzZMcngyZWRuaUdsdWVNdDg4UjhCeXFlcGpmejNxa3JzV00r?=
 =?utf-8?B?VmVJOWh6bDhRQmN5WkIxeWFHTWIzOFNmVDE5UEQwTWRVeElqUGl2THZIWmlX?=
 =?utf-8?B?UlZOdkVsaDZwWG9Pd1RHa2l3bytpRkxNYzlxNXV4SEYrZUt0ZVQrZEplRDBm?=
 =?utf-8?B?N1oveXdNYmJuZUxIaERXSkdkMll0Yk52azR1QStaUENON3hDMEV4LzN4WFh3?=
 =?utf-8?B?eUhvVHQ1MkRLcmtHQ3RoSGFmRXZNcTJFOXlacmRYelNpSTRFVjJ1RWVVVWJ3?=
 =?utf-8?B?WE95a1RxaUlXVmIyN0FpdnBiNlFEYWliUklybUtqZUZvR3ZETlFaV3NSVXZZ?=
 =?utf-8?B?Q3JUaTIxVXVUWEVIMFRDUmFIbGh1dHNxNEhvM1dpYUU0bm1VQXZMNjhpVWdx?=
 =?utf-8?B?VkdpSXdaWjArMEhsd2d2MUZuQnFJTGEvY2loQmxHNG5ldERuVDEzZ29aaXRK?=
 =?utf-8?B?RDZyQ3VKYWZoT1ZpWmZNVzMyRTVkR1JraGxScTQwT2JTRzJxSkpyakZqaHg3?=
 =?utf-8?B?ZHJIMzN6ZHkydVhLbk9NVmxnQ3FNcE81Q0c1TXhXU1BjNk1XTGErQUhBWlZZ?=
 =?utf-8?B?WjBGaU1DZ0JjYUVrbTZ1S05EbG14ci8ydm5TQ3JIUlY4TWRRNFVzdDk3Tity?=
 =?utf-8?B?ZlF3U2pEeWRRaHI5OENDdVE2SnQ3YVBNOG9kQWtGNnN5bWVsSytlL2psYjZt?=
 =?utf-8?B?eU12WjdyYlJ5Wnd2MFUzR0drOWFSQ0dabHZ2UWVGRlZOUklPUGRKYWo2TldC?=
 =?utf-8?B?Z056OUt1ZHdYZmp6bjgrQTlWN3BHZ2M2VEdVUkxjdWx6bjc0VTg1VGpiSUNI?=
 =?utf-8?B?KzhkclFWT2NaR1l6YmtLS0ozSmlaOUJleDhsaUR5ZGVuQ1NORkplb0R1aUhs?=
 =?utf-8?B?dWlURmRrUmV6bGZMQ2RUOHM0dEdPTmhsUFFZRitWd1lkWmdLakRkb2s5MWdw?=
 =?utf-8?B?VUpqQW9OQkhZOGwvaHZ5YTFxc0IxendyTm1mYWZoS3JjSnM3bU92Z0N6OXQy?=
 =?utf-8?B?ZUJ0UXVhdm9OVFN1TUlxeEp5OVVyckFCUUd3VjhSM3d2QTN4aDFUU0h5Ykla?=
 =?utf-8?B?bWJCbEtyS3I5d1RCOFJHdkt5ZTAxVUFOZEpXa2IzWW1NbE0rR0lOa2t3cGJI?=
 =?utf-8?B?OTFwUVpDSlVFQmFjMWxWVUt4QVhYYVgrNGJGdnQxSDExNFQvdnZVaVBHdWJG?=
 =?utf-8?B?UzEvNml6V0QyTnRMOXFtTS9rV3R6R2ppVWowL1QvVWE4NjE3dXpRanNCUVJU?=
 =?utf-8?B?UkpnWlVlSHJJYkpaRzEvWVhJS1VKRjJUOXN5Tkc4bVhkMjdZVis5bzk0Z2RE?=
 =?utf-8?B?TzYyWFNNTzAyQVpMcWFISnBFUE56cm11N29HRWRySkhRSlBPMTlxTkJwSDdR?=
 =?utf-8?B?Y3N6eGFPQldUclh3MFI1TTd3Y24yL2ZtQit5dFlNZ2s5YlhkRjhkYTd5bDc4?=
 =?utf-8?B?Q25WaGVUdHlxbGlIbHd4d2h6NG5jU1FGNkV5cFVQT0pFNHNHWlpQWXUzS1E3?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3d9080-9b02-4606-b8ab-08dbbb48c454
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 08:49:01.2617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGbcYMFmWasjXmPhCv3Nspt1FRAyEiYjORdFFTi2XrXxewy/I6wq6l13bWDnZJ8KBsWGBV/agQVU//N8B7sfdd/hnfVt1xJrTJ/QX02qrXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
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
Cc: Tejas
 Upadhyay <tejas.upadhyay@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21-09-2023 17:18, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Use the newly added drm_print_memory_stats helper to show memory
> utilisation of our objects in drm/driver specific fdinfo output.
> 
> To collect the stats we walk the per memory regions object lists
> and accumulate object size into the respective drm_memory_stats
> categories.
> 
> Objects with multiple possible placements are reported in multiple
> regions for total and shared sizes, while other categories are

I guess you forgot to correct this.

> counted only for the currently active region.
> 
> v2:
>  * Only account against the active region.
>  * Use DMA_RESV_USAGE_BOOKKEEP when testing for active. (Tejas)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> # v1
> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index a61356012df8..94abc2fb2ea6 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -45,6 +45,68 @@ void __i915_drm_client_free(struct kref *kref)
>  }
>  
>  #ifdef CONFIG_PROC_FS
> +static void
> +obj_meminfo(struct drm_i915_gem_object *obj,
> +	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
> +{
> +	const enum intel_region_id id = obj->mm.region ?
> +					obj->mm.region->id : INTEL_REGION_SMEM;
> +	const u64 sz = obj->base.size;
> +
> +	if (obj->base.handle_count > 1)
> +		stats[id].shared += sz;
> +	else
> +		stats[id].private += sz;
> +
> +	if (i915_gem_object_has_pages(obj)) {
> +		stats[id].resident += sz;
> +
> +		if (!dma_resv_test_signaled(obj->base.resv,
> +					    DMA_RESV_USAGE_BOOKKEEP))
> +			stats[id].active += sz;
> +		else if (i915_gem_object_is_shrinkable(obj) &&
> +			 obj->mm.madv == I915_MADV_DONTNEED)
> +			stats[id].purgeable += sz;
> +	}
> +}
> +
> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
> +	struct drm_i915_file_private *fpriv = file->driver_priv;
> +	struct i915_drm_client *client = fpriv->client;
> +	struct drm_i915_private *i915 = fpriv->i915;
> +	struct drm_i915_gem_object *obj;
> +	struct intel_memory_region *mr;
> +	struct list_head *pos;
> +	unsigned int id;
> +
> +	/* Public objects. */
> +	spin_lock(&file->table_lock);
> +	idr_for_each_entry(&file->object_idr, obj, id)
> +		obj_meminfo(obj, stats);
> +	spin_unlock(&file->table_lock);
> +
> +	/* Internal objects. */
> +	rcu_read_lock();
> +	list_for_each_rcu(pos, &client->objects_list) {
> +		obj = i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
> +							 client_link));
> +		if (!obj)
> +			continue;
> +		obj_meminfo(obj, stats);
> +		i915_gem_object_put(obj);
> +	}
> +	rcu_read_unlock();
> +
> +	for_each_memory_region(mr, i915, id)
> +		drm_print_memory_stats(p,
> +				       &stats[id],
> +				       DRM_GEM_OBJECT_RESIDENT |
> +				       DRM_GEM_OBJECT_PURGEABLE,
> +				       mr->name);
> +}
> +
>  static const char * const uabi_class_names[] = {
>  	[I915_ENGINE_CLASS_RENDER] = "render",
>  	[I915_ENGINE_CLASS_COPY] = "copy",
> @@ -106,6 +168,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	 * ******************************************************************
>  	 */
>  
> +	show_meminfo(p, file);
> +
>  	if (GRAPHICS_VER(i915) < 8)
>  		return;
>  

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Thanks,
Aravind.
