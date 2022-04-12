Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D8D4FC923
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FA410E16C;
	Tue, 12 Apr 2022 00:14:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF4210E16C;
 Tue, 12 Apr 2022 00:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649722439; x=1681258439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8YV25stXvmevzL/3qFO1OMLZegovcDbeC0sYLd26ZqQ=;
 b=RjSRZG8q3A3rjiyiAKRrpLNoa4OMqORAcxrqzE7r22nipFQ9AJaVcdLb
 bqPxkOtVhveox36WtOCpU7pvryR4yhdbAtHy9o0CBxwdKC8S4j0+dDj1H
 KNlv2eLuYI8BhjmWd433EhaGQO92csFQ0RtTzLz4WAlYVY12wPC1wnHqw
 4X/xSkipsLg/8lKz8I1pQhoUs/rTSDVsZ1/+3IfdP9Ux/+nK2W+k53cg7
 DcaxevUoG4Ic/TKYlegCjwt5BTG/vX08C0KEs4I/Y8eYTsfbfQtfDu+Op
 USC+ffRaM0dnYfwXWsM01sbiYB8r7HNeG6N9lZiAxq0B1o4gVlr2Dm0aJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="325155986"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="325155986"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="590103217"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 11 Apr 2022 17:13:59 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 17:13:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Apr 2022 17:13:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Apr 2022 17:13:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3vD+mASpEwP69H1gleSQZ+jnbYjfqYjhcjgbKBggJYV2FHo1BH/l5Di0m6jcCBmjlPHYXQDGauKEiSGIUpx+3eM3GGDyaApXANghVSi4iDcaNa4S1/kHnwJKSD9UeJsZuocFNZhqsqh6lO0XWdBdDOxlwhnujAvbymEN3Z6dfwTnoRtS9EwSrIKgW2EiUBkahuMLxeP/e35VTKPVCPzbCdNNva59XPvjzgV1Hb4C2aPMSaHDA+k0fuHItCX6hNKtTdcEY+e9TV8c+P4k0o4M9gPnhHP4fcpeJC/dWWJ2igUbUBaS3c4lr2ZBzL66ArtEy7+Kv+SJrIxiY9Zy9SrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usHgeSFR5sNNIN/pJqJ77iCRwDLx6jLySPtg3TrBMV0=;
 b=g4XBU1EejT3dzCG264SalPODszEmH6ATNIv1duehzAH7WjtJyifhlwwYOmrTMQOkx98BUp8G6kZeaANJxPZv0/YkJ6VzfRnetTKkSGPAmakNrLAlMztXY7KxGgC87Jq1J2+QkYxll6892eMNRqz3L3tWPYY2AnhICCskusiALA3rLlxsA6YLUZ9ZWOb6yLzH6HZcu59I9hLI1PanmjeUJGHymVEKag1sMLwyVlCTYYikDbrZhnvyLym93eG5b6072+MN+wgl5SwzCCJjOaVkVlGrGKQwaq+EhlYaQ2APWL6f7YSlTgNyXTlmhp2ItXwPSlEQ06kJoEIEGbAU3qkzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN6PR11MB3008.namprd11.prod.outlook.com (2603:10b6:805:cf::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Tue, 12 Apr 2022 00:13:55 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b561:17d8:3112:913f]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b561:17d8:3112:913f%7]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 00:13:55 +0000
Message-ID: <1197b8dd-b138-3bcd-e37e-057c31d9eab3@intel.com>
Date: Mon, 11 Apr 2022 17:13:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] drm/i915/guc: Update context registration to new GuC
 API
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
 <20220408180326.1454951-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220408180326.1454951-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a325c51-fb1c-4028-1584-08da1c19554e
X-MS-TrafficTypeDiagnostic: SN6PR11MB3008:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB3008F1A7C841B6AA73B3C02EF4ED9@SN6PR11MB3008.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUeLwrRAPR99ytD7SNDszyKGUfliLz88sl0YKdNLreVJwWxIMYCha7YL6KEdkHmAqF7fhrxsO0OfATJVoXU6IKhln5bBbX40SnfPmJWpJ4vDp58RaCSM6yg0sgqpm03Lx5ygq3EKaBz71TcrwvXeaq+ptvCN27mhI4S5KCGHDTBOU7s2CLr3PErhyZjKgV2mFo4JihaM9VzgsZozWrw+ZXpRXbecsxvji/QsmKsQQx+/9c/36jOpzwMsAfXQj518rmRhQeGYzDHFQvxdmWTSBS5Cw8T/X6UXLiZd/t8PFMP0B4B6Y0Qs5oZNeUZMeAi+eOQnBI8qPhfBM+e4D/sdqEHWb36XqhaIaJvJLGakOhP3QOJXJoMlCR9+QkWll4+wVYJhMsQq2wsbYcgYneAocdfsVODRMKtENCipHOo7mJ0S5VtNFfdsJF3JFgLeGPSnfnBSTtDWAqyylMvX6BFCThoGCDKgwPVbYpaN2Zb5w5KK7br/4Mo9xDTrYFGgP7AhjYlab5+MHalbMNUhGhadAKA2UXf81/k+NA84QvLyhH897jhrZUhuudG4JKkzNplXxFwNXRsyv8/DUeGHXdoW14Gn32W+NcEk/YZquc3sEua12NLUjSVwaz7jA+VgGddF5i049dHJEIVzHzk4sV2Ne+0dbsftwdsj24aOuQWKiO5RXp6XRqKEpqK2mFOHS3riTA6MUZWAfogbvKifAHFCG1BKUVPbQ19umYRj5EVpO/R7egLZ4cz+eC+duhldtS5E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(66476007)(8936002)(450100002)(5660300002)(508600001)(30864003)(6512007)(31686004)(66946007)(2616005)(186003)(6506007)(53546011)(26005)(38100700002)(83380400001)(15650500001)(36756003)(66556008)(2906002)(86362001)(8676002)(82960400001)(4326008)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVdFeExQb0hsVjR2YnArcFFEWHA3aXE3ZWYrL1pWNm1PamszNDdGQWU1NjZQ?=
 =?utf-8?B?bCs1UHVYak9SUVM2YWlFaUZaVHQxRXNSMlEyS0YwemdIWldlMmdCUDA4SFo0?=
 =?utf-8?B?UEQ3SWJSYzd5NkxtelNsQmlIM1dUdVFvUjE5Q2VzQzlUOE94cUNJRHF2WWFV?=
 =?utf-8?B?SzdmT1VZRkVkM21OSGZmNkJIUEdYSVhnZEs0Q0xpcWRuVWpTL0FWVWQvMEli?=
 =?utf-8?B?VjZ5QUhneUNrNTBNOWw4eUZtVFJlT3hBdlF4d2NmZjRtNVVtYjhXRmwvWXdv?=
 =?utf-8?B?N2l0ZWJFODgzdHlycytDc2h5Rk4xUjVkUnlQdFdIeHd6TXY1dXRUTElGV2RI?=
 =?utf-8?B?UDI0OHF4TXU3RUJQSi9RVGJpM0xCZWZVUGpzMmlBZE1ISklTWU02WlRRaS9r?=
 =?utf-8?B?bk03THVnVncvdkIrZng3R3dXaHY0L2R5RE1KVDJySTdndlRCUzhadldOcWVp?=
 =?utf-8?B?eTVESkg0aGhoWjN2WlpqTE5Hdi9DS1BtL2VlK2xWSFFjRUczRGI5V3Izdzg5?=
 =?utf-8?B?eStLUm93VGsyMk1PaGVxTkh5UUFpbERvU2NvbmVFalIydjczL1pGWUF4Q2Fz?=
 =?utf-8?B?SWxOTXBPNjRveFB1SENwWnBqMkVXRndLS1dzVHlXZndjM2ExNnU0a3JhemJ1?=
 =?utf-8?B?eDRkM2xReDhsQXAvRlZ0YUxSVlZjUHNaQUF3OUdWNGI4OXVKdGg1YVlod1Er?=
 =?utf-8?B?dU1WYlVRck5FcXhpTVY3RlRqeStWc1BwMlk3ZitWN0w2V3p1T2RnVElMeTln?=
 =?utf-8?B?NkxueFJTL1MzeEhxMXpTSWtLejA4YzI4NlQ1a0paWkw0R3JuaytRNnk2OWVO?=
 =?utf-8?B?L0pYK0kwR05NaE90WnVtV0VsampVTEFoMFQ3VXRWdm5uVWl0Y1pxOUxUeVVE?=
 =?utf-8?B?NWEvTDVqbkV4WUVBZU5JTXg2ZzlFRzZuMTNoUURkYlBmT29WaDRTbjVXY0ZL?=
 =?utf-8?B?RlVyUnhGVEhPZStNTGpKcURmM2F1amp3RDN0cVg1eW1KSllSOHJyMmNZSTYr?=
 =?utf-8?B?WFViTFJXelh1WjFuUkZiWjB1WUxtcXJmUitJU2VnaFlOWmtVTnZ0RkVOU0x4?=
 =?utf-8?B?SVpKSEJkb1J6SW9nN0YzalBLZ1dKcW1JYjVRKzJBL09ZM3FvU0s4UWVOYlRV?=
 =?utf-8?B?Y3U3OUtid1JvcVBXMEFHWi9odG44T251bGV6Q1ZwT1phZXYzbWVGYjg2ak9z?=
 =?utf-8?B?Mm5TMU1NMFBvZHlNWHkrQVZmSXQ3KzNQVUJubmQ1QlF0am5yRVl4MTZ1dnQx?=
 =?utf-8?B?RFg1UHk2Y2ZXbmtndkJaenhrdE1NajlrWHl5bEdrdGVTeWl3YTlTTlU4eDFJ?=
 =?utf-8?B?WWhscGtiUEZzREN5NElmU1pnVERzbkJWSDc0Tk45RnpwQ0IrdEp0T2lISjJV?=
 =?utf-8?B?d3p5SDJFanF3ZXpEMVZEZ3psWGF0Q3FzNHNoUks0V1BBZkJMaG9mQTdtS2xC?=
 =?utf-8?B?UkRlaWNUTkErWjVOSkp1dElkOTMxK1E2em5OSm54VzJ3eXJVT3JwWXNEMkpy?=
 =?utf-8?B?WGZoODNnQUt2WDloVGhqaHFpY3p3ci9kZ0xvb1pxcW1LT0hnZWdlQk9wYlM5?=
 =?utf-8?B?OXczT2VveDU5cUJzZUtBUEJkeTlNbTVqaXlsTFZ6ZzJGL1ErTWJtWUpnb0lt?=
 =?utf-8?B?bE1HaE42VW1KeFVuL3RLUEJBTmdjdU5PTXhMMmZLeUNRV2xVRHd2bkhsbGEx?=
 =?utf-8?B?NXZsSWVJOHNUdHVucEJMdDdBMHVYS0IxOHc4b0QyTHoybGZ1K1lvSjBlVHgr?=
 =?utf-8?B?eGtsOWR5SVY0elJXR3JwWkJ5TmhBUXkvRHg5NzJ6anJzNm1XU0ZNeG4yczRh?=
 =?utf-8?B?VTFYcnRkZ0JzN3YyYWpWTmtra0VnM2tXZnNZeU9SbkxvTnRrbnpQSkRud2lR?=
 =?utf-8?B?Y3FRbFp0UEUyS0lKcXB6UVpQZmoxUXdDekh3UWtmWkt4dXBPcWxpQkhrK2Mr?=
 =?utf-8?B?TFh4QTlmdGRSRjZhV3UzNXcvNkFXaTFOb0tKMm5NdXFDeC9TU3c2WnFkdnhW?=
 =?utf-8?B?MGNWdHBReGcyZk40YkV1OU1OZzJ5ODVvandmT2tEOUxGNGE5a056eUVzbVFi?=
 =?utf-8?B?dm9LVnhZZHVRZHR3Sk13blBKNndqSzlhWE5ERmlwRW9PRE9zRnZjcG5tRFR4?=
 =?utf-8?B?aGw0TDNJODk1ZjgyRzIyQ0R1SExHdGZYR2FDNWNtMU1hbFc4ZHJQQjE0RHJh?=
 =?utf-8?B?bVFTQk5QOEFsdEJqNktWM1BUcy91VFhneVBoNlpPaU1SSGRuTkQ3YTBwaE9z?=
 =?utf-8?B?UHdvYzlXQlRVeGt5RWlNSmU0OS9Sd1VYeTNNWmsydnZOOHBVeG9NVStDNGU2?=
 =?utf-8?B?Q3V4d1pyTS90dEwvWlZwVWR0eW9UWSttR2RoVGNuOHd6RURwNXlCbmtuc21N?=
 =?utf-8?Q?D0E0Opm7haKBpWDtgcZZD9So7frDmgOFdmXsf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a325c51-fb1c-4028-1584-08da1c19554e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 00:13:55.8380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udjY3razwFfUOTw64kp+GiACix+4ROdhOCREiyn/kaXAryE+lfco3YsShyiVxtxD/ehzqbCKnxz9uI+wnuSl92DIqfYnFZoIDAEfz+VHBmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3008
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/8/2022 11:03 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The latest GuC firmware drops the context descriptor pool in favour of
> passing all creation data in the create H2G. It also greatly simplifies
> the work queue and removes the process descriptor used for multi-LRC
> submission. So, remove all mention of LRC and process descriptors and
> update the registration code accordingly.
>
> Unfortunately, the new API also removes the ability to set default
> values for the scheduling policies at context registration time.
> Instead, a follow up H2G must be sent. This will be addressed in the
> next patch.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   5 -
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  52 ++---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 221 ++++++++----------
>   3 files changed, 116 insertions(+), 162 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 4e431c14b118..3f3373f68123 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -170,11 +170,6 @@ struct intel_guc {
>   	/** @ads_engine_usage_size: size of engine usage in the ADS */
>   	u32 ads_engine_usage_size;
>   
> -	/** @lrc_desc_pool: object allocated to hold the GuC LRC descriptor pool */
> -	struct i915_vma *lrc_desc_pool;
> -	/** @lrc_desc_pool_vaddr: contents of the GuC LRC descriptor pool */
> -	void *lrc_desc_pool_vaddr;
> -
>   	/**
>   	 * @context_lookup: used to resolve intel_context from guc_id, if a
>   	 * context is present in this structure it is registered with the GuC
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index f21b6de46a99..0e1e8d0079b5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -197,20 +197,28 @@ struct guc_wq_item {
>   	u32 fence_id;
>   } __packed;
>   
> -struct guc_process_desc {
> -	u32 stage_id;
> -	u64 db_base_addr;
> +struct guc_sched_wq_desc {
>   	u32 head;
>   	u32 tail;
>   	u32 error_offset;
> -	u64 wq_base_addr;
> -	u32 wq_size_bytes;
>   	u32 wq_status;
> -	u32 engine_presence;
> -	u32 priority;
> -	u32 reserved[36];
> +	u32 reserved[28];
>   } __packed;
>   
> +/* Helper for context registration H2G */
> +struct guc_ctxt_registration_info {
> +	u32 flags;
> +	u32 context_idx;
> +	u32 engine_class;
> +	u32 engine_submit_mask;
> +	u32 wq_desc_lo;
> +	u32 wq_desc_hi;
> +	u32 wq_base_lo;
> +	u32 wq_base_hi;
> +	u32 wq_size;
> +	u32 hwlrca_lo;
> +	u32 hwlrca_hi;
> +};
>   #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
>   
>   #define CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
> @@ -219,34 +227,6 @@ struct guc_process_desc {
>   /* Preempt to idle on quantum expiry */
>   #define CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE	BIT(0)
>   
> -/*
> - * GuC Context registration descriptor.
> - * FIXME: This is only required to exist during context registration.
> - * The current 1:1 between guc_lrc_desc and LRCs for the lifetime of the LRC
> - * is not required.
> - */
> -struct guc_lrc_desc {
> -	u32 hw_context_desc;
> -	u32 slpm_perf_mode_hint;	/* SPLC v1 only */
> -	u32 slpm_freq_hint;
> -	u32 engine_submit_mask;		/* In logical space */
> -	u8 engine_class;
> -	u8 reserved0[3];
> -	u32 priority;
> -	u32 process_desc;
> -	u32 wq_addr;
> -	u32 wq_size;
> -	u32 context_flags;		/* CONTEXT_REGISTRATION_* */
> -	/* Time for one workload to execute. (in micro seconds) */
> -	u32 execution_quantum;
> -	/* Time to wait for a preemption request to complete before issuing a
> -	 * reset. (in micro seconds).
> -	 */
> -	u32 preemption_timeout;
> -	u32 policy_flags;		/* CONTEXT_POLICY_* */
> -	u32 reserved1[19];
> -} __packed;
> -
>   #define GUC_POWER_UNSPECIFIED	0
>   #define GUC_POWER_D0		1
>   #define GUC_POWER_D1		2
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e1612c393781..bd0584d7d489 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -396,12 +396,12 @@ struct sync_semaphore {
>   };
>   
>   struct parent_scratch {
> -	struct guc_process_desc pdesc;
> +	struct guc_sched_wq_desc wq_desc;
>   
>   	struct sync_semaphore go;
>   	struct sync_semaphore join[MAX_ENGINE_INSTANCE + 1];
>   
> -	u8 unused[WQ_OFFSET - sizeof(struct guc_process_desc) -
> +	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
>   		sizeof(struct sync_semaphore) * (MAX_ENGINE_INSTANCE + 2)];
>   
>   	u32 wq[WQ_SIZE / sizeof(u32)];
> @@ -438,15 +438,15 @@ __get_parent_scratch(struct intel_context *ce)
>   		   LRC_STATE_OFFSET) / sizeof(u32)));
>   }
>   
> -static struct guc_process_desc *
> -__get_process_desc(struct intel_context *ce)
> +static struct guc_sched_wq_desc *
> +__get_wq_desc(struct intel_context *ce)
>   {
>   	struct parent_scratch *ps = __get_parent_scratch(ce);
>   
> -	return &ps->pdesc;
> +	return &ps->wq_desc;
>   }
>   
> -static u32 *get_wq_pointer(struct guc_process_desc *desc,
> +static u32 *get_wq_pointer(struct guc_sched_wq_desc *wq_desc,
>   			   struct intel_context *ce,
>   			   u32 wqi_size)
>   {
> @@ -458,7 +458,7 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
>   #define AVAILABLE_SPACE	\
>   	CIRC_SPACE(ce->parallel.guc.wqi_tail, ce->parallel.guc.wqi_head, WQ_SIZE)
>   	if (wqi_size > AVAILABLE_SPACE) {
> -		ce->parallel.guc.wqi_head = READ_ONCE(desc->head);
> +		ce->parallel.guc.wqi_head = READ_ONCE(wq_desc->head);
>   
>   		if (wqi_size > AVAILABLE_SPACE)
>   			return NULL;
> @@ -468,15 +468,6 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
>   	return &__get_parent_scratch(ce)->wq[ce->parallel.guc.wqi_tail / sizeof(u32)];
>   }
>   
> -static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> -{
> -	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> -
> -	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
> -
> -	return &base[index];
> -}
> -
>   static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>   {
>   	struct intel_context *ce = xa_load(&guc->context_lookup, id);
> @@ -486,39 +477,11 @@ static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>   	return ce;
>   }
>   
> -static int guc_lrc_desc_pool_create(struct intel_guc *guc)
> -{
> -	u32 size;
> -	int ret;
> -
> -	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
> -			  GUC_MAX_CONTEXT_ID);
> -	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
> -					     (void **)&guc->lrc_desc_pool_vaddr);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> -}
> -
> -static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
> -{
> -	guc->lrc_desc_pool_vaddr = NULL;
> -	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
> -}
> -
>   static inline bool guc_submission_initialized(struct intel_guc *guc)
>   {
>   	return guc->submission_initialized;
>   }
>   
> -static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
> -{
> -	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> -
> -	memset(desc, 0, sizeof(*desc));
> -}
> -
>   static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
>   {
>   	return __get_context(guc, id);
> @@ -545,8 +508,6 @@ static inline void clr_ctx_id_mapping(struct intel_guc *guc, u32 id)
>   	if (unlikely(!guc_submission_initialized(guc)))
>   		return;
>   
> -	_reset_lrc_desc(guc, id);
> -
>   	/*
>   	 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
>   	 * the lower level functions directly.
> @@ -751,7 +712,7 @@ static u32 wq_space_until_wrap(struct intel_context *ce)
>   	return (WQ_SIZE - ce->parallel.guc.wqi_tail);
>   }
>   
> -static void write_wqi(struct guc_process_desc *desc,
> +static void write_wqi(struct guc_sched_wq_desc *wq_desc,
>   		      struct intel_context *ce,
>   		      u32 wqi_size)
>   {
> @@ -764,13 +725,13 @@ static void write_wqi(struct guc_process_desc *desc,
>   
>   	ce->parallel.guc.wqi_tail = (ce->parallel.guc.wqi_tail + wqi_size) &
>   		(WQ_SIZE - 1);
> -	WRITE_ONCE(desc->tail, ce->parallel.guc.wqi_tail);
> +	WRITE_ONCE(wq_desc->tail, ce->parallel.guc.wqi_tail);
>   }
>   
>   static int guc_wq_noop_append(struct intel_context *ce)
>   {
> -	struct guc_process_desc *desc = __get_process_desc(ce);
> -	u32 *wqi = get_wq_pointer(desc, ce, wq_space_until_wrap(ce));
> +	struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
> +	u32 *wqi = get_wq_pointer(wq_desc, ce, wq_space_until_wrap(ce));
>   	u32 len_dw = wq_space_until_wrap(ce) / sizeof(u32) - 1;
>   
>   	if (!wqi)
> @@ -789,7 +750,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
>   {
>   	struct intel_context *ce = request_to_scheduling_context(rq);
>   	struct intel_context *child;
> -	struct guc_process_desc *desc = __get_process_desc(ce);
> +	struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
>   	unsigned int wqi_size = (ce->parallel.number_children + 4) *
>   		sizeof(u32);
>   	u32 *wqi;
> @@ -809,7 +770,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
>   			return ret;
>   	}
>   
> -	wqi = get_wq_pointer(desc, ce, wqi_size);
> +	wqi = get_wq_pointer(wq_desc, ce, wqi_size);
>   	if (!wqi)
>   		return -EBUSY;
>   
> @@ -824,7 +785,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
>   	for_each_child(ce, child)
>   		*wqi++ = child->ring->tail / sizeof(u64);
>   
> -	write_wqi(desc, ce, wqi_size);
> +	write_wqi(wq_desc, ce, wqi_size);
>   
>   	return 0;
>   }
> @@ -1812,20 +1773,10 @@ static void reset_fail_worker_func(struct work_struct *w);
>   int intel_guc_submission_init(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> -	int ret;
>   
>   	if (guc->submission_initialized)
>   		return 0;
>   
> -	ret = guc_lrc_desc_pool_create(guc);
> -	if (ret)
> -		return ret;
> -	/*
> -	 * Keep static analysers happy, let them know that we allocated the
> -	 * vma after testing that it didn't exist earlier.
> -	 */
> -	GEM_BUG_ON(!guc->lrc_desc_pool);
> -
>   	guc->submission_state.guc_ids_bitmap =
>   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>   	if (!guc->submission_state.guc_ids_bitmap)

I was trying to understand why you didn't have to update the error 
handling to not delete the desc pool if guc_ids_bitmap fails to allocate 
and I realized that that cleanup is actually missing, so this fixes a 
potential leak as well.

> @@ -1844,7 +1795,6 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   		return;
>   
>   	guc_flush_destroyed_contexts(guc);
> -	guc_lrc_desc_pool_destroy(guc);
>   	i915_sched_engine_put(guc->sched_engine);
>   	bitmap_free(guc->submission_state.guc_ids_bitmap);
>   	guc->submission_initialized = false;
> @@ -2104,63 +2054,88 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   
>   static int __guc_action_register_multi_lrc(struct intel_guc *guc,
>   					   struct intel_context *ce,
> -					   u32 guc_id,
> -					   u32 offset,
> +					   struct guc_ctxt_registration_info *info,
>   					   bool loop)
>   {
>   	struct intel_context *child;
> -	u32 action[4 + MAX_ENGINE_INSTANCE];
> +	u32 action[13 + (MAX_ENGINE_INSTANCE * 2)];
>   	int len = 0;
> +	u32 next_id;
>   
>   	GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
>   
>   	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
> -	action[len++] = guc_id;
> +	action[len++] = info->flags;
> +	action[len++] = info->context_idx;
> +	action[len++] = info->engine_class;
> +	action[len++] = info->engine_submit_mask;
> +	action[len++] = info->wq_desc_lo;
> +	action[len++] = info->wq_desc_hi;
> +	action[len++] = info->wq_base_lo;
> +	action[len++] = info->wq_base_hi;
> +	action[len++] = info->wq_size;
>   	action[len++] = ce->parallel.number_children + 1;
> -	action[len++] = offset;
> +	action[len++] = info->hwlrca_lo;
> +	action[len++] = info->hwlrca_hi;
> +
> +	next_id = info->context_idx + 1;
>   	for_each_child(ce, child) {
> -		offset += sizeof(struct guc_lrc_desc);
> -		action[len++] = offset;
> +		GEM_BUG_ON(next_id++ != child->guc_id.id);
> +
> +		/*
> +		 * NB: GuC interface supports 64 bit LRCA even though i915
> +		 * only supports 32 bit currently.
> +		 */

It's not i915 that only supports 32b, it's the HW.

Assuming that, as you said in the cover letter, this is going to be 
squashed before merge and so all the ifdef and dead code will go away:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +		action[len++] = lower_32_bits(child->lrc.lrca);
> +		action[len++] = upper_32_bits(child->lrc.lrca);
>   	}
>   
> +	GEM_BUG_ON(len > ARRAY_SIZE(action));
> +
>   	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
>   }
>   
>   static int __guc_action_register_context(struct intel_guc *guc,
> -					 u32 guc_id,
> -					 u32 offset,
> +					 struct guc_ctxt_registration_info *info,
>   					 bool loop)
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> -		guc_id,
> -		offset,
> +		info->flags,
> +		info->context_idx,
> +		info->engine_class,
> +		info->engine_submit_mask,
> +		info->wq_desc_lo,
> +		info->wq_desc_hi,
> +		info->wq_base_lo,
> +		info->wq_base_hi,
> +		info->wq_size,
> +		info->hwlrca_lo,
> +		info->hwlrca_hi,
>   	};
>   
>   	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
>   					     0, loop);
>   }
>   
> -static void prepare_context_registration_info(struct intel_context *ce);
> +static void prepare_context_registration_info(struct intel_context *ce,
> +					      struct guc_ctxt_registration_info *info);
>   
>   static int register_context(struct intel_context *ce, bool loop)
>   {
> +	struct guc_ctxt_registration_info info;
>   	struct intel_guc *guc = ce_to_guc(ce);
> -	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
> -		ce->guc_id.id * sizeof(struct guc_lrc_desc);
>   	int ret;
>   
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	prepare_context_registration_info(ce);
> +	prepare_context_registration_info(ce, &info);
>   
>   	if (intel_context_is_parent(ce))
> -		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
> -						      offset, loop);
> +		ret = __guc_action_register_multi_lrc(guc, ce, &info, loop);
>   	else
> -		ret = __guc_action_register_context(guc, ce->guc_id.id, offset,
> -						    loop);
> +		ret = __guc_action_register_context(guc, &info, loop);
>   	if (likely(!ret)) {
>   		unsigned long flags;
>   
> @@ -2216,6 +2191,8 @@ static inline u32 get_children_join_value(struct intel_context *ce,
>   	return __get_parent_scratch(ce)->join[child_index].semaphore;
>   }
>   
> +#if 0
> +/* FIXME: This needs to be updated for new v70 interface... */
>   static void guc_context_policy_init(struct intel_engine_cs *engine,
>   				    struct guc_lrc_desc *desc)
>   {
> @@ -2228,14 +2205,14 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
>   	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
>   	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>   }
> +#endif
>   
> -static void prepare_context_registration_info(struct intel_context *ce)
> +static void prepare_context_registration_info(struct intel_context *ce,
> +					      struct guc_ctxt_registration_info *info)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
>   	u32 ctx_id = ce->guc_id.id;
> -	struct guc_lrc_desc *desc;
> -	struct intel_context *child;
>   
>   	GEM_BUG_ON(!engine->mask);
>   
> @@ -2246,47 +2223,49 @@ static void prepare_context_registration_info(struct intel_context *ce)
>   	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
>   		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>   
> -	desc = __get_lrc_desc(guc, ctx_id);
> -	desc->engine_class = engine_class_to_guc_class(engine->class);
> -	desc->engine_submit_mask = engine->logical_mask;
> -	desc->hw_context_desc = ce->lrc.lrca;
> -	desc->priority = ce->guc_state.prio;
> -	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> -	guc_context_policy_init(engine, desc);
> +	memset(info, 0, sizeof(*info));
> +	info->context_idx = ctx_id;
> +	info->engine_class = engine_class_to_guc_class(engine->class);
> +	info->engine_submit_mask = engine->logical_mask;
> +	/*
> +	 * NB: GuC interface supports 64 bit LRCA even though i915
> +	 * only supports 32 bit currently.
> +	 */
> +	info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
> +	info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
> +	info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +	/* FIXME: This needs to be updated for new v70 interface... */
> +	//desc->priority = ce->guc_state.prio;
> +	//guc_context_policy_init(engine, desc);
>   
>   	/*
>   	 * If context is a parent, we need to register a process descriptor
>   	 * describing a work queue and register all child contexts.
>   	 */
>   	if (intel_context_is_parent(ce)) {
> -		struct guc_process_desc *pdesc;
> +		struct guc_sched_wq_desc *wq_desc;
> +		u64 wq_desc_offset, wq_base_offset;
>   
>   		ce->parallel.guc.wqi_tail = 0;
>   		ce->parallel.guc.wqi_head = 0;
>   
> -		desc->process_desc = i915_ggtt_offset(ce->state) +
> -			__get_parent_scratch_offset(ce);
> -		desc->wq_addr = i915_ggtt_offset(ce->state) +
> -			__get_wq_offset(ce);
> -		desc->wq_size = WQ_SIZE;
> -
> -		pdesc = __get_process_desc(ce);
> -		memset(pdesc, 0, sizeof(*(pdesc)));
> -		pdesc->stage_id = ce->guc_id.id;
> -		pdesc->wq_base_addr = desc->wq_addr;
> -		pdesc->wq_size_bytes = desc->wq_size;
> -		pdesc->wq_status = WQ_STATUS_ACTIVE;
> -
> -		for_each_child(ce, child) {
> -			desc = __get_lrc_desc(guc, child->guc_id.id);
> -
> -			desc->engine_class =
> -				engine_class_to_guc_class(engine->class);
> -			desc->hw_context_desc = child->lrc.lrca;
> -			desc->priority = ce->guc_state.prio;
> -			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> -			guc_context_policy_init(engine, desc);
> -		}
> +		wq_desc_offset = i915_ggtt_offset(ce->state) +
> +				 __get_parent_scratch_offset(ce);
> +		wq_base_offset = i915_ggtt_offset(ce->state) +
> +				 __get_wq_offset(ce);
> +		info->wq_desc_lo = lower_32_bits(wq_desc_offset);
> +		info->wq_desc_hi = upper_32_bits(wq_desc_offset);
> +		info->wq_base_lo = lower_32_bits(wq_base_offset);
> +		info->wq_base_hi = upper_32_bits(wq_base_offset);
> +		info->wq_size = WQ_SIZE;
> +
> +		wq_desc = __get_wq_desc(ce);
> +		memset(wq_desc, 0, sizeof(*wq_desc));
> +		wq_desc->wq_status = WQ_STATUS_ACTIVE;
> +
> +		/* FIXME: This needs to be updated for new v70 interface... */
> +		//desc->priority = ce->guc_state.prio;
> +		//guc_context_policy_init(engine, desc);
>   
>   		clear_children_join_go_memory(ce);
>   	}
> @@ -4360,17 +4339,17 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   		guc_log_context_priority(p, ce);
>   
>   		if (intel_context_is_parent(ce)) {
> -			struct guc_process_desc *desc = __get_process_desc(ce);
> +			struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
>   			struct intel_context *child;
>   
>   			drm_printf(p, "\t\tNumber children: %u\n",
>   				   ce->parallel.number_children);
>   			drm_printf(p, "\t\tWQI Head: %u\n",
> -				   READ_ONCE(desc->head));
> +				   READ_ONCE(wq_desc->head));
>   			drm_printf(p, "\t\tWQI Tail: %u\n",
> -				   READ_ONCE(desc->tail));
> +				   READ_ONCE(wq_desc->tail));
>   			drm_printf(p, "\t\tWQI Status: %u\n\n",
> -				   READ_ONCE(desc->wq_status));
> +				   READ_ONCE(wq_desc->wq_status));
>   
>   			if (ce->engine->emit_bb_start ==
>   			    emit_bb_start_parent_no_preempt_mid_batch) {

