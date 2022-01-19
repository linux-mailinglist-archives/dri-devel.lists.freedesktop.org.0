Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6762E493258
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 02:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B047010E64F;
	Wed, 19 Jan 2022 01:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961B510E570;
 Wed, 19 Jan 2022 01:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642555843; x=1674091843;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aFjMTsEu3mlzQ2gWGrLb6JjtYCx0a2jLsr+vrKo6Caw=;
 b=hQbUztytTd9Ufc52FeZkDq8xnLK+cbdVA+VbdmXURgzk0gBZnaNOduMU
 2/HUvdHjMmtcqcqZA3eLRtU+XCUcP2FC6E96bUaDCsmOdBDTPlKU/DEFG
 htQ8kpkTCbBEmlnGFwmQgYZYWXR5+iWyrFLh+rXxeutUFv5veasdWEEwL
 GmENK3DqFTEgvqBgdYaErgWNW637yEYk5LSK0qO5yr0zjw2CejEr4Yq1l
 oRTS12CeQdGbNXzi0Hns396OE+B7VwaJy54DT/NtwMlqsFdN0oAfLGZwr
 qotGzmLRRFALWOyEo8nT09QpzW7cEw/Y/0Eg6p8BVI2/vPMlqODRl2c5H Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232318847"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="232318847"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 17:30:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="560873093"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 18 Jan 2022 17:30:42 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 17:30:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 17:30:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 17:30:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLfi5+ygan5XbcvJsvUbIuRl52quFWX5mesVHAhIcvqmpBiNqqk4D7qNVcTUNIeFvXFBvQN4JGQ5m2EchnoNF1kjMC8cOyfqA4MSyCPCMmvOXrZ1BS/ZcETrn/8PMLrLFajE2buy/J/Vvz6L6jZ+oH+/eO5ts/gV68JybO2b3mDXgWi1iQpUQ7fAywOoNhpEiGQ68p+upjDF3jLHr9sXzsw9FbPuXSUj/qCVovDJl4xd3kgwQJGw6/ASWPZR4UYzOuNlL9DMIQwhJpTTggTkC30kq0clFhyaZu0kxtL0ydb/p0dznmEcFfpUWYRcNRAwhF38dPxVrKZc1HIiqMlqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2go2taePG/nJFsfTWl1UO29EgqofDYaI+nSUf6Bg/o=;
 b=GqdG4VqhZUWxT0HxiwD4CWbwSAdMCcJ+9+jcNOFVamAmpyuD+cnVM/+f21BXJ+ilLNWDdfDM3pWpn6DGANg/dwurbBaGZPVh35uRP8eD/U9D09nvYNPu11Y9eIZgBQU3S8/sHgGY1qcPnzPW5a5shSY/ExlZhpScnQb4n4OjwtWY2D9xUkj92w0UhSl+Ciu80TLH/njCAFnRpcmV8Ab4R6QZF6BfxcZoQ35d9l0QSqyWm4VX9u8Cy8MZYzHVhICrGHRtAW5XAs9sVlC22kCeaPMWhFIrB2rKiOG0r8rsP8BTMReEyKteX4XsLAISRV/3E9zd1kWIQorR9CF4ZM/bkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 01:29:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 01:29:57 +0000
Message-ID: <22b0f8c6-fea1-f03c-d91f-253de481287f@intel.com>
Date: Tue, 18 Jan 2022 17:29:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] drm/i915: Allocate intel_engine_coredump_alloc with
 ALLOW_FAIL
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220118214357.33740-1-matthew.brost@intel.com>
 <20220118214357.33740-2-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220118214357.33740-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO1PR15CA0081.namprd15.prod.outlook.com
 (2603:10b6:101:20::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bde2113-e2d5-4770-049d-08d9daeb33f4
X-MS-TrafficTypeDiagnostic: BYAPR11MB2680:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB2680F7CC1227B186B75815B2BD599@BYAPR11MB2680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzGa2S7gw5zmkDRPJH9p2eLUbsL5jULNabb6m6laztQFxUlLOO/k2hgzzlKO+qw05YWXXv9UmrPEnBrKD3bQWtLKLBMY5eC58M27nIrlH5YWzgsXSZRcHxGu6Mm9xKi21jg/lg6WSKvEiChWgfPOPA3S8zGW+aQ66squWO61lg5CXb1CeVCJDRouidsu08iUfL+8XvLUXO29zMb5R0fvoaQTFrFuo37651nyOrmQNb6j/vyycuDmbqfI/JXLl249yJSpcHcPssHakNNoNHwkAUtfae1PCx9q/2fTSX2Jr8etdgGOM/YTFnEqpE0qnEw3+EuPs/d+o7F6xqh0DhxlfvAgPTO/qv1oX7FKBqlw4mCWXYwaazXRAsGgokD1uf0pvJLi4opf1RXw6yTvHUV/FeCb49YC44nn2Nhk82QV1QeZ8u73HGOYdsjUqOJtakzeYdVD2ZmTzsxIaqUkPJ4pDz6YmiqSQ+tWX70B/MxvYjm9ienlZRurWPuwV4TY+1om9I4HooOlppLkuh6jYqOwP/TkRiho4YODayRVG5sPAc00NF5KlaoYOyPxFeFgOwJMwaokKplGA11ya8oOYZACZT2pF/YKZ5UDqOhy3asPpbRwu7zuyhL915Cfkc2otLUzI2M25+eV8ZarX7c13pinVHmkjhti5Cl5P+zL3NDLsCNhgVOlzlz31nTaUWvW9dLPfPkjYlgVPt+YGwVY/1AATgcqZN/eJ9smaUSaS1t08H7kFr7QK2jZG9oOYTMtXwKG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(38100700002)(6512007)(2616005)(31686004)(82960400001)(86362001)(4326008)(31696002)(83380400001)(5660300002)(66476007)(8936002)(6506007)(26005)(66556008)(66946007)(6486002)(186003)(508600001)(8676002)(53546011)(2906002)(36756003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjV0bG5ySjkvSnhTL0VrR3A3ZnViTDYzZk94eHVuVThsekFkNVJDVElRdXFX?=
 =?utf-8?B?SnFrcjhLWWs5MGFOdXBLM2JMYWV6TjBuTmloWTRxVTJBSWQvZTFPOTZtTkRW?=
 =?utf-8?B?ZmNjd1JMNWlKTjBQWVRIc0doSDRZSW5oZ3pINDZDaU51TUMxc2pxS1JFTjIy?=
 =?utf-8?B?YUtIci80Rm9meDU2cEFtTCtZSXQ4OHQ1UGpUWkttUEYzWWRGaElrRlZKUmM5?=
 =?utf-8?B?a3RyeFRZa1I3L2dBQUtsckFPZUNSYjFCMG5xM2Y5cEpXN0dIY1A4bUwwUGwv?=
 =?utf-8?B?dkd1WTAycEVhRHJIMGQ0SHNlYm1NSlA3blJkRG1NVWJiZUZVU2tmVUFieXh3?=
 =?utf-8?B?RFNDSkl4RDFMUUh5bjBjVzVHRzdxSVB0cUJ1T3JFb2IyQXNxT2E0cTBQMk12?=
 =?utf-8?B?OTk2dmRqRGU2bTNPUEx0WEJoNWtYaXlFYWxDNmRqMGR2b1pNSjlKQWYzRlFL?=
 =?utf-8?B?UDNNckdVWWpuaFpZUll6YWZRaCtPTWRpdFVsUlFMZ0xGc2VSdGxNaE40Ukk0?=
 =?utf-8?B?Vm1JQlJYODhqeENaSzdtR2x2ZXVMWDdCOE5HYXluT0ljR1lEOFlpTlh5ZlNJ?=
 =?utf-8?B?WFN2b2g2UWxlL2lJMTEwSmh2bjNydFV1Wm83MmhVSTZiOS9ieUhjNElrQkF1?=
 =?utf-8?B?eHpxa0EyMURQNk4vNU5keXRhU2NHNWhUeVQ2RUN6bXhxSytBYnZZNTMxUFU5?=
 =?utf-8?B?bi9DU1NOcmdpWFN4VEF2MzZHV0g5MGdnempvR0pwaXNZZ3JONW9ERGwwUFN1?=
 =?utf-8?B?UDh3OTNuS0lWVEd5eEQ1b0pxYjB0ZWRkN2FDNThZQlRCanBlc2VHMkJwbTYz?=
 =?utf-8?B?N21ya0tzamRhN05UMWtsd2R4bERUQ0hCZWdSaW95UFBpaTg5aXJVbThzd3Ju?=
 =?utf-8?B?NURwbW9wNXhGNEUvemM1dFY1R1ZIUU8wM2xkRlo4MnM4azBhZVFqRjBMbzM5?=
 =?utf-8?B?MHNCTEtqRHJGSzREaUNJUDVvdEE4OU52NDdpNjR5YXNuaUZTNEE1ME5jYzhB?=
 =?utf-8?B?Nmc1UXRhaWVON3gvcEhsSEIzU2hqMXBDZE9EQVRueldGL0tuRzFvQlF3aHN5?=
 =?utf-8?B?M1ZsK3hTcExzMFBELzZMV3h1dHQ5WHRxNE9ocGtBSURqRXdGS2hITEZwdzVU?=
 =?utf-8?B?V003VTBaTU1tTlZQQVYzVTdmd0NYaTVPYTlOZWYrR2tjcDVzYWJhUWk5WmFi?=
 =?utf-8?B?Wm12enFtcTNHbHlYSmpBSEd4QXhqMHpSNzJlTi9JdC9DQW9JTFFzbVIrVmlZ?=
 =?utf-8?B?Y1Y0UlJVYUw3N0FVaEtSOG90cG9pbUNFRWpsdkUvZDJXT0grTktOQzM4Nnhl?=
 =?utf-8?B?cUNBQnVvZU5FV01KVGd0RWpTeG04ZWpzNnRZSHVtZVgrMHFOMzVKR3NUOE0x?=
 =?utf-8?B?UFBHMXRRdG5saHByZUJDdVhzSlloRW5LYVBUeDNUMzAxK0Z5U2h6NExDVE1j?=
 =?utf-8?B?bjRuNDRiTU9HUzR0S2lndEFZMDQ1V1FRYTlLODRmZ2pyalpJYmFIMHNoWGhr?=
 =?utf-8?B?ckFZQlBkL2VyaGE2VzZydTllYkNIYWxvY3pDQkM5VVNKUnl2dHkvUHJNcnBM?=
 =?utf-8?B?Y2hvQTU3UGZ1VWxJRFBBeTVhRmh3Q2JaUzhPSVNXZlgvd0NUSXZBaUFqQ3dm?=
 =?utf-8?B?UmFuZWlPSjc4d2hNcGU2VlpuWm1IVUxPMis3ek1xZGpqc0phdlhqQnFhU1Vl?=
 =?utf-8?B?YlBzYUs1bmVybnZldGVrWnduRUxPUnplc1YrUndJdGhOZ2RKTnhuWUxSZnRZ?=
 =?utf-8?B?dG5WNjBHY0thWHlESGNjZVREZS9WdjVKemx3dU5GdUFMdEV4Y25sRGVnN2Nh?=
 =?utf-8?B?UTRaRzBzVUhtUDdOWWNuRVhHVXpPS0E4dHZUdVB6UCtHdFFSMm9CczFZc0JS?=
 =?utf-8?B?TUxqQnpQOUtXbG9ONmVaMWcxNnBEL29Sck1CUyt5OElUVVlkaFhidG1HNmZM?=
 =?utf-8?B?TFJKV2pLSHlQSVFPNXROMG5KTVJqVm5MTkVtYkRBeWE1Y0RsRWtUcUFWSEpK?=
 =?utf-8?B?YTlFM1B4YzBjVFVDd1BlMWFSek5LZDcrVS82b2FHVkJQQXFQcVVqeDJGTUVs?=
 =?utf-8?B?S2lOUFMxQ2dldlNvVHNzRUV1TzFjdi9vdFR3bnNaQWEwVU02QW9NczI4Z3dF?=
 =?utf-8?B?aGp0Q0xucHVQalh3dUFFRERHZVljbFMxd1F2a0NoVTIrbUJlS1pKMVpIYmVa?=
 =?utf-8?B?U1Blajh5eEg3WVpFNjRjN01uc1c4Q2JDeG1ucGxMd2gvREpsa0hTa0t0aHhI?=
 =?utf-8?Q?S7e3HIpjdqHYRRWWvIClrjVFCeKWWB9bu1/P/aMSp8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bde2113-e2d5-4770-049d-08d9daeb33f4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 01:29:57.5466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaAMTZIUDT/7lkK93bhnKYVc2AyON4g6caaj/HrKohJRhleDRdl6gyQRddlxk4hR0I0AL+NkHO/nM7aquLkOGWTPsNC29D6E6TJIeRMs67I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
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
Cc: thomas.hellstrom@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/2022 13:43, Matthew Brost wrote:
> Allocate intel_engine_coredump_alloc with ALLOW_FAIL rather than
> GFP_KERNEL do fully decouple the error capture from fence signalling.
s/do/to/

>
> Fixes: 8b91cdd4f8649 ("drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code")
Does this really count as a bug fix over that patch? Isn't it more of a 
changing in policy now that we do DRM fence signalling and that other 
changes related to error capture behaviour have been implemented.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 67f3515f07e7a..aee42eae4729f 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1516,7 +1516,7 @@ capture_engine(struct intel_engine_cs *engine,
>   	struct i915_request *rq = NULL;
>   	unsigned long flags;
>   
> -	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
> +	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL);
This still makes me nervous that we will fail to allocate engine 
captures in stress test scenarios, which are exactly the kind of 
situations where we need valid error captures.

There is also still a GFP_KERNEL in __i915_error_grow(). Doesn't that 
need updating as well?

John.

>   	if (!ee)
>   		return NULL;
>   

