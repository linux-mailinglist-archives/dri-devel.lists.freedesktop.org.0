Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9953CEFE8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 01:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E667989AB6;
	Mon, 19 Jul 2021 23:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E290089A1E;
 Mon, 19 Jul 2021 23:34:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="198420427"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="198420427"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 16:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="575604281"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2021 16:34:01 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 16:34:01 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 16:34:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 16:34:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 16:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1X9iLzvB53h8ykb085k+ASs5/wbIRv84z34GKhcMVLy4jN2MR7PsAwg2e4NhNRemNt4S89jmzBwNr3UWDKoA/c7R+pJtCjXk7PaOefvZxil8MVdZXbmW+ZNzTdQFe0pRkjLFBFGJhYr11UIbIRKhDTrPcloNqKGbzLMk2zmYTnUkn+qrUW9Q5WddYdL/hsFxwcL5agKdn8hU87GhiKedOYrmfOPTwNZ9gt7eFEYI2FQqByuy/ioGT8s4mjF0c3QQv/Vml05bnrYnyNEcWJEAep+4uE85T8yVi+mtye8Mh1L6SKlAleQ4SHUqBH2oxyHqbnhW3/n/Kp8bZfJLV1lZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05eXPUMP58+GI7iMsYTwCKFL8klL1Pm3uWeiFC6Axk0=;
 b=KUTouWv8aa8PF5jG0TDjLGeSE/0VCKllyP2VtmRPR+IGpMSOmu6+yfqlrBVjtE4HePi5JaPK0PNd/yyKYHcJ0nleB4Rgdb9ZubLfdhehYWHSjMRmFyQh1w2m2P8vCcpJ3FiS9SA1arU0Zbn95NhxOXveQUf+edj7KfObXm1j1zDgeK6WLgnw4Ca1050cvE91y3UPf2Gu4nd5WmQHzPz9A8wGdOfjP51yrgaQkbMw3NNIYBNfAhqFqXrF/zD23CKDnYMvZqCXShIEdyzKfXjpFjmVVPxT/5I4TgBJWPCP2BXz6pUTKZIKlqLyUX4VboqRmyDgAeESdFiUQl1vNd/l7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05eXPUMP58+GI7iMsYTwCKFL8klL1Pm3uWeiFC6Axk0=;
 b=tomGFEvEbODOn+dsovc11vaU5pFeWmQ8LOEQv/nJBpv4yKyoD8/+JjfjN8PubeJ/UrtEKWpLrlNW7lKybcPrQlFVvP+IlLy2Qf2ztRCaduxP18C5EEXTp7ETAO/A/iJmZWO0bFhEwrRDkEh2/TL6NuBChG8YpqsCndujs0IbhPE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:389::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22; Mon, 19 Jul 2021 23:33:58 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 23:33:58 +0000
Subject: Re: [PATCH 19/51] drm/i915/guc: GuC virtual engines
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-20-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <21e009a1-5e63-0c8a-3b7e-2c070abae309@intel.com>
Date: Mon, 19 Jul 2021 16:33:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <20210716201724.54804-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MW4PR04CA0270.namprd04.prod.outlook.com (2603:10b6:303:88::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 23:33:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94781f10-3d62-4e5f-a13b-08d94b0dae5d
X-MS-TrafficTypeDiagnostic: DM4PR11MB5230:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR11MB5230AE58AF5D3F29BA913316F4E19@DM4PR11MB5230.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SZVEX+QamfTL/4eG8mVrTtRHedYePjk5PeUwxblweFM3kzTcrzeIRt2mi9XulA0sGlcb1W6FjiCuJ3CuvcmkY9N15lvviZX/YPGYSOLaSuZt4RV80a+xF0aoDRYSVe+LoHBmnSYuChCqijV53eQk6X3SCShz2inULWTIVuI2W+nERytGJC2Z5JuNfADjHJPlCVV3MNutczT3MNah1bkq8/HWVBGbp1XkSjTIU5zL1BlgCCDTAidsUIICHtgo5zuqjNWLEWCNwRqIH9Yl7yr69YsiyjCfj3t1Gbg73a2oCtBQ4jHeuf391Gb+e19JENf4NAcpcmUsdbRKfAUNAHMxfuYO31cE/1pUpm6f79vKfw9hUAZSdO+5NhwXFRJn/ZFXJ6V1bEYMsnG/uxaQJYxjLZVUSsKqEmGhiPjeWOl5FMkfsGz9/GQZm3JSuiiwD067asCrKd9sU1oXdrcTeognlHQMCtgSECALNAvw2DLiEVStkSB+MGP5L5XLvlpqpNinBsl7gr4DzoabYEj1TD63HQS3icZnCtIkJCytUxTDknQ04AGCwSJF6VPKa2KbUVW27RwwVhLB2Hvgmcke6tmmffEtkDGur7wAa+KA3SfobSzBA0+gxeNmSS12v4UTGUax0JiClR68B1q7050B9nNnJI7jqEiIuTjeYo4dHbZzXa5GBv3FkM9yyugLdDwTEQFeuQukU75NLD5RMWc5sAZG7bC3FcMjWj9eGCeIvSqYS2Hk/ImtNRiGrUxXZZNzwzM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(4326008)(316002)(66556008)(66476007)(38100700002)(31686004)(31696002)(66946007)(53546011)(8936002)(450100002)(5660300002)(30864003)(2906002)(36756003)(8676002)(2616005)(83380400001)(478600001)(16576012)(26005)(107886003)(956004)(186003)(6486002)(86362001)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?diszMlF6azVQUzVNU1cyMzVqZmNrRkRUNHJPQ2p6a0EreWF6TzJjVWpzNE5q?=
 =?utf-8?B?TDhZVXNhSmNmU2w0aVd2WVFUbUR5eDQ5N25EVlZ5dXN2OU9iSGdOMUE1eVRT?=
 =?utf-8?B?VmRmOWxNSTIxZXNjbEE2aVlMdml2dVVnZW91cWtkcWoxWU4ySmo3dW9sK1lR?=
 =?utf-8?B?UUdFZnJDS2dBc2xnT21YUDJ1RWV0dFBJOU9mQlB4aEMyRUI4elc2N0FWT2Va?=
 =?utf-8?B?REhpOFErdGd3Q0p5d2F1SWJRT2lkMUdMampoZEVmSVdWM1JiOThrQXYwMFNX?=
 =?utf-8?B?UUJJWDZVY1ZYQVhLVjBYRmRkMFFIL1BISDJ0VW02ZXZ5dDQrN0RTb1lHSEZ0?=
 =?utf-8?B?ckhoRzBXaGZnMEFySS9STmtzdmNqL2VUcDRGTFd2b3VKTkorTzdPT3JnaDNw?=
 =?utf-8?B?cTQ1d3duUWpvWUpZeGJBZkFZNDRKcVhGMXZsaE00SmhmTzdlSllmU2hXVzlp?=
 =?utf-8?B?M1pXOGpCTFlHMEsyc2tUUzRvejdxSDdCb25jRkQyLzVJb3Y3YUdFZlQyWStX?=
 =?utf-8?B?aTRSeUl4VjRGR0w0aHBTQ0tsYzRQWlhqMzVOUVltVVFtRm9WNENwQ2lqNW9B?=
 =?utf-8?B?RVpMNWhoOG9tak4wSFZjcHRXZDJNRjlFT2tMeVMwczZ2R3MvUW5GMW9sYWhl?=
 =?utf-8?B?cmpYb3ZWZGFvcSt5MTA5VDlVSm83bTh6SkpEZGxDenB0VXZ2dXI5NzlWeUNx?=
 =?utf-8?B?elV3dy9DWlZXN0FNcTVVNzVhZTRLc3diOHFHODNnQXJtT2NGRW5Mc1ZXeFdY?=
 =?utf-8?B?bGdZajgvQzd2NGlGMXVXK3dFZkFiMUEyQXM4ZEJnWEZnRmxEK0N4WllxS2xr?=
 =?utf-8?B?ZDg1enZnRERhRlk3K1NpeHRVY3RkT0VUcE8rN3I0dUZyQXFQZU5SaXMzSkxD?=
 =?utf-8?B?NWlQTGxSYldBc3p0MEVxYndvc2J3VHBXOHRIa1VoQnNpTXlUMGZDZlRRZjkv?=
 =?utf-8?B?bE5MNHhzZVVBUjF3Z0NOSnVHMmFwMHQ3VUtKOG5FSFJsRWE4L1NqM3pnZExH?=
 =?utf-8?B?Y1B6WlgrOE9OenMxdEJPNnFJTHhqZWRnb3B4Q2M0QVZFYkpYeCtaOUR0ejFj?=
 =?utf-8?B?OC9XUkcwZlV6dXdUbS92RWkvaGlPUUVHSGZFSnpWUy9UWGFWQmFXTDRuQXBl?=
 =?utf-8?B?WC9lVXhSV3hIYmdwVk5GbktrYmRHK0hFbnFKUmJ6WkQxVGl6Tzg5WkxxRFhW?=
 =?utf-8?B?QnNJZGJlOWJLVXprYk5HVXRIMDFUUFA2bjJoOGkxZzEvMk1rWkRQVkRtWHdt?=
 =?utf-8?B?ODdQaTVFTXFCeEpKUUErL3JrVUJTZkRrTFNBL2JaaUtaVHFXOGZjSzc0OWhH?=
 =?utf-8?B?NXJnVEdnYU10OHIwcUtyR1BwSERBZlJpK1pxcEhRRCswTXQrLzRYTXlzVk02?=
 =?utf-8?B?Z0tuWnEyUGtpSXc5alBXdkRvd0tNVGNqbW9tUno1V01iQnU5ek1BbjJEc1FV?=
 =?utf-8?B?cFhUUVZEN0E4WUxHUUVoQlBUUi9HT0xOajN4MVVsczFJd0xvdC8xRlhhNnZh?=
 =?utf-8?B?Z3lHc0ZYN0xQRnF6alkrbGxOdld5NlNaK3V3aUJzZjl0OGluOTByczhENlBD?=
 =?utf-8?B?Zm5mUG9rVVVCd1RDS3lyNWpOeU80RVZoYlZqbTlHWkNnL2h3U1R6UzZLN05h?=
 =?utf-8?B?Ry9DNWE3WmhEakd3ejJHVVhhWHJ5V1RhdFdOK1JZSEJLdXFQOVRPZktqeUhL?=
 =?utf-8?B?V05VZTRuY2ZlWXpjeWN0dENTUXZVTnJVbGwwZEpsUEtlLzNzL0tkVWtXb3Vs?=
 =?utf-8?Q?PoD4yX7m7aueUIiO0OvC4BTUkClY1YkqcxWLHp1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94781f10-3d62-4e5f-a13b-08d94b0dae5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 23:33:58.3159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0I3h9SHs8QnUhx4Ae7pGcGney5CrZosZICbUi78rcMhyRj4clh9pi5myVSDUdQtWxtycJNnlrgQUmqUGeBszrlVVeWLmyTkLE9h+6aXvMbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/16/2021 1:16 PM, Matthew Brost wrote:
> Implement GuC virtual engines. Rather simple implementation, basically
> just allocate an engine, setup context enter / exit function to virtual
> engine specific functions, set all other variables / functions to guc
> versions, and set the engine mask to that of all the siblings.
>
> v2: Update to work with proto-ctx
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |   8 +-
>   drivers/gpu/drm/i915/gem/i915_gem_context.h   |   1 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   6 +
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  27 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  14 +
>   .../drm/i915/gt/intel_execlists_submission.c  |  29 ++-
>   .../drm/i915/gt/intel_execlists_submission.h  |   4 -
>   drivers/gpu/drm/i915/gt/selftest_execlists.c  |  12 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 240 +++++++++++++++++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   2 +
>   10 files changed, 308 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 64659802d4df..edefe299bd76 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -74,7 +74,6 @@
>   #include "gt/intel_context_param.h"
>   #include "gt/intel_engine_heartbeat.h"
>   #include "gt/intel_engine_user.h"
> -#include "gt/intel_execlists_submission.h" /* virtual_engine */
>   #include "gt/intel_gpu_commands.h"
>   #include "gt/intel_ring.h"
>   
> @@ -363,9 +362,6 @@ set_proto_ctx_engines_balance(struct i915_user_extension __user *base,
>   	if (!HAS_EXECLISTS(i915))
>   		return -ENODEV;
>   
> -	if (intel_uc_uses_guc_submission(&i915->gt.uc))
> -		return -ENODEV; /* not implement yet */
> -
>   	if (get_user(idx, &ext->engine_index))
>   		return -EFAULT;
>   
> @@ -950,8 +946,8 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   			break;
>   
>   		case I915_GEM_ENGINE_TYPE_BALANCED:
> -			ce = intel_execlists_create_virtual(pe[n].siblings,
> -							    pe[n].num_siblings);
> +			ce = intel_engine_create_virtual(pe[n].siblings,
> +							 pe[n].num_siblings);
>   			break;
>   
>   		case I915_GEM_ENGINE_TYPE_INVALID:
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> index 20411db84914..2639c719a7a6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -10,6 +10,7 @@
>   #include "i915_gem_context_types.h"
>   
>   #include "gt/intel_context.h"
> +#include "gt/intel_engine.h"

Apologies for the late question, but why do you need this include in 
this header? nothing else is changing within the file.

>   
>   #include "i915_drv.h"
>   #include "i915_gem.h"
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 4a5518d295c2..542c98418771 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -47,6 +47,12 @@ struct intel_context_ops {
>   
>   	void (*reset)(struct intel_context *ce);
>   	void (*destroy)(struct kref *kref);
> +
> +	/* virtual engine/context interface */
> +	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
> +						unsigned int count);
> +	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
> +					       unsigned int sibling);
>   };
>   
>   struct intel_context {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index f911c1224ab2..9fec0aca5f4b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -273,13 +273,38 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>   	return intel_engine_has_preemption(engine);
>   }
>   
> +struct intel_context *
> +intel_engine_create_virtual(struct intel_engine_cs **siblings,
> +			    unsigned int count);
> +
> +static inline bool
> +intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
> +{
> +	if (intel_engine_uses_guc(engine))
> +		return intel_guc_virtual_engine_has_heartbeat(engine);
> +	else
> +		GEM_BUG_ON("Only should be called in GuC submission");

I insist that this needs a better explanation, as I've commented on the 
previous rev. Given that this is a shared file, it is not immediately 
evident why this call shouldn't be called with the execlists backend.

Daniele

> +
> +	return false;
> +}
> +
>   static inline bool
>   intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>   {
>   	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>   		return false;
>   
> -	return READ_ONCE(engine->props.heartbeat_interval_ms);
> +	if (intel_engine_is_virtual(engine))
> +		return intel_virtual_engine_has_heartbeat(engine);
> +	else
> +		return READ_ONCE(engine->props.heartbeat_interval_ms);
> +}
> +
> +static inline struct intel_engine_cs *
> +intel_engine_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
> +{
> +	GEM_BUG_ON(!intel_engine_is_virtual(engine));
> +	return engine->cops->get_sibling(engine, sibling);
>   }
>   
>   #endif /* _INTEL_RINGBUFFER_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index d561573ed98c..b7292d5cb7da 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1737,6 +1737,20 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>   	return total;
>   }
>   
> +struct intel_context *
> +intel_engine_create_virtual(struct intel_engine_cs **siblings,
> +			    unsigned int count)
> +{
> +	if (count == 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (count == 1)
> +		return intel_context_create(siblings[0]);
> +
> +	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
> +	return siblings[0]->cops->create_virtual(siblings, count);
> +}
> +
>   static bool match_ring(struct i915_request *rq)
>   {
>   	u32 ring = ENGINE_READ(rq->engine, RING_START);
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 56e25090da67..28492cdce706 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -193,6 +193,9 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
>   	return container_of(engine, struct virtual_engine, base);
>   }
>   
> +static struct intel_context *
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +
>   static struct i915_request *
>   __active_request(const struct intel_timeline * const tl,
>   		 struct i915_request *rq,
> @@ -2548,6 +2551,8 @@ static const struct intel_context_ops execlists_context_ops = {
>   
>   	.reset = lrc_reset,
>   	.destroy = lrc_destroy,
> +
> +	.create_virtual = execlists_create_virtual,
>   };
>   
>   static int emit_pdps(struct i915_request *rq)
> @@ -3493,6 +3498,17 @@ static void virtual_context_exit(struct intel_context *ce)
>   		intel_engine_pm_put(ve->siblings[n]);
>   }
>   
> +static struct intel_engine_cs *
> +virtual_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
> +{
> +	struct virtual_engine *ve = to_virtual_engine(engine);
> +
> +	if (sibling >= ve->num_siblings)
> +		return NULL;
> +
> +	return ve->siblings[sibling];
> +}
> +
>   static const struct intel_context_ops virtual_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
> @@ -3507,6 +3523,8 @@ static const struct intel_context_ops virtual_context_ops = {
>   	.exit = virtual_context_exit,
>   
>   	.destroy = virtual_context_destroy,
> +
> +	.get_sibling = virtual_get_sibling,
>   };
>   
>   static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
> @@ -3655,20 +3673,13 @@ static void virtual_submit_request(struct i915_request *rq)
>   	spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
>   }
>   
> -struct intel_context *
> -intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> -			       unsigned int count)
> +static struct intel_context *
> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   {
>   	struct virtual_engine *ve;
>   	unsigned int n;
>   	int err;
>   
> -	if (count == 0)
> -		return ERR_PTR(-EINVAL);
> -
> -	if (count == 1)
> -		return intel_context_create(siblings[0]);
> -
>   	ve = kzalloc(struct_size(ve, siblings, count), GFP_KERNEL);
>   	if (!ve)
>   		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> index ad4f3e1a0fde..a1aa92c983a5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
> @@ -32,10 +32,6 @@ void intel_execlists_show_requests(struct intel_engine_cs *engine,
>   							int indent),
>   				   unsigned int max);
>   
> -struct intel_context *
> -intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> -			       unsigned int count);
> -
>   bool
>   intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
>   
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 73ddc6e14730..59cf8afc6d6f 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -3727,7 +3727,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
>   	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
>   
>   	for (n = 0; n < nctx; n++) {
> -		ve[n] = intel_execlists_create_virtual(siblings, nsibling);
> +		ve[n] = intel_engine_create_virtual(siblings, nsibling);
>   		if (IS_ERR(ve[n])) {
>   			err = PTR_ERR(ve[n]);
>   			nctx = n;
> @@ -3923,7 +3923,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
>   	 * restrict it to our desired engine within the virtual engine.
>   	 */
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_close;
> @@ -4054,7 +4054,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
>   		i915_request_add(rq);
>   	}
>   
> -	ce = intel_execlists_create_virtual(siblings, nsibling);
> +	ce = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ce)) {
>   		err = PTR_ERR(ce);
>   		goto out;
> @@ -4106,7 +4106,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
>   
>   	/* XXX We do not handle oversubscription and fairness with normal rq */
>   	for (n = 0; n < nsibling; n++) {
> -		ce = intel_execlists_create_virtual(siblings, nsibling);
> +		ce = intel_engine_create_virtual(siblings, nsibling);
>   		if (IS_ERR(ce)) {
>   			err = PTR_ERR(ce);
>   			goto out;
> @@ -4208,7 +4208,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
>   	if (err)
>   		goto out_scratch;
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_scratch;
> @@ -4348,7 +4348,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
>   	if (igt_spinner_init(&spin, gt))
>   		return -ENOMEM;
>   
> -	ve = intel_execlists_create_virtual(siblings, nsibling);
> +	ve = intel_engine_create_virtual(siblings, nsibling);
>   	if (IS_ERR(ve)) {
>   		err = PTR_ERR(ve);
>   		goto out_spin;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 05958260e849..7b3e1c91e689 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -60,6 +60,15 @@
>    *
>    */
>   
> +/* GuC Virtual Engine */
> +struct guc_virtual_engine {
> +	struct intel_engine_cs base;
> +	struct intel_context context;
> +};
> +
> +static struct intel_context *
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> +
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
>   /*
> @@ -925,20 +934,35 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
>   	return ret;
>   }
>   
> -static int guc_context_pre_pin(struct intel_context *ce,
> -			       struct i915_gem_ww_ctx *ww,
> -			       void **vaddr)
> +static int __guc_context_pre_pin(struct intel_context *ce,
> +				 struct intel_engine_cs *engine,
> +				 struct i915_gem_ww_ctx *ww,
> +				 void **vaddr)
>   {
> -	return lrc_pre_pin(ce, ce->engine, ww, vaddr);
> +	return lrc_pre_pin(ce, engine, ww, vaddr);
>   }
>   
> -static int guc_context_pin(struct intel_context *ce, void *vaddr)
> +static int __guc_context_pin(struct intel_context *ce,
> +			     struct intel_engine_cs *engine,
> +			     void *vaddr)
>   {
>   	if (i915_ggtt_offset(ce->state) !=
>   	    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK))
>   		set_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
>   
> -	return lrc_pin(ce, ce->engine, vaddr);
> +	return lrc_pin(ce, engine, vaddr);
> +}
> +
> +static int guc_context_pre_pin(struct intel_context *ce,
> +			       struct i915_gem_ww_ctx *ww,
> +			       void **vaddr)
> +{
> +	return __guc_context_pre_pin(ce, ce->engine, ww, vaddr);
> +}
> +
> +static int guc_context_pin(struct intel_context *ce, void *vaddr)
> +{
> +	return __guc_context_pin(ce, ce->engine, vaddr);
>   }
>   
>   static void guc_context_unpin(struct intel_context *ce)
> @@ -1043,6 +1067,21 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	deregister_context(ce, ce->guc_id);
>   }
>   
> +static void __guc_context_destroy(struct intel_context *ce)
> +{
> +	lrc_fini(ce);
> +	intel_context_fini(ce);
> +
> +	if (intel_engine_is_virtual(ce->engine)) {
> +		struct guc_virtual_engine *ve =
> +			container_of(ce, typeof(*ve), context);
> +
> +		kfree(ve);
> +	} else {
> +		intel_context_free(ce);
> +	}
> +}
> +
>   static void guc_context_destroy(struct kref *kref)
>   {
>   	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> @@ -1059,7 +1098,7 @@ static void guc_context_destroy(struct kref *kref)
>   	if (context_guc_id_invalid(ce) ||
>   	    !lrc_desc_registered(guc, ce->guc_id)) {
>   		release_guc_id(guc, ce);
> -		lrc_destroy(kref);
> +		__guc_context_destroy(ce);
>   		return;
>   	}
>   
> @@ -1075,7 +1114,7 @@ static void guc_context_destroy(struct kref *kref)
>   	if (context_guc_id_invalid(ce)) {
>   		__release_guc_id(guc, ce);
>   		spin_unlock_irqrestore(&guc->contexts_lock, flags);
> -		lrc_destroy(kref);
> +		__guc_context_destroy(ce);
>   		return;
>   	}
>   
> @@ -1120,6 +1159,8 @@ static const struct intel_context_ops guc_context_ops = {
>   
>   	.reset = lrc_reset,
>   	.destroy = guc_context_destroy,
> +
> +	.create_virtual = guc_create_virtual,
>   };
>   
>   static void __guc_signal_context_fence(struct intel_context *ce)
> @@ -1248,6 +1289,83 @@ static int guc_request_alloc(struct i915_request *rq)
>   	return 0;
>   }
>   
> +static struct intel_engine_cs *
> +guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
> +{
> +	struct intel_engine_cs *engine;
> +	intel_engine_mask_t tmp, mask = ve->mask;
> +	unsigned int num_siblings = 0;
> +
> +	for_each_engine_masked(engine, ve->gt, mask, tmp)
> +		if (num_siblings++ == sibling)
> +			return engine;
> +
> +	return NULL;
> +}
> +
> +static int guc_virtual_context_pre_pin(struct intel_context *ce,
> +				       struct i915_gem_ww_ctx *ww,
> +				       void **vaddr)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return __guc_context_pre_pin(ce, engine, ww, vaddr);
> +}
> +
> +static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return __guc_context_pin(ce, engine, vaddr);
> +}
> +
> +static void guc_virtual_context_enter(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_get(engine);
> +
> +	intel_timeline_enter(ce->timeline);
> +}
> +
> +static void guc_virtual_context_exit(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_put(engine);
> +
> +	intel_timeline_exit(ce->timeline);
> +}
> +
> +static int guc_virtual_context_alloc(struct intel_context *ce)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	return lrc_alloc(ce, engine);
> +}
> +
> +static const struct intel_context_ops virtual_guc_context_ops = {
> +	.alloc = guc_virtual_context_alloc,
> +
> +	.pre_pin = guc_virtual_context_pre_pin,
> +	.pin = guc_virtual_context_pin,
> +	.unpin = guc_context_unpin,
> +	.post_unpin = guc_context_post_unpin,
> +
> +	.enter = guc_virtual_context_enter,
> +	.exit = guc_virtual_context_exit,
> +
> +	.sched_disable = guc_context_sched_disable,
> +
> +	.destroy = guc_context_destroy,
> +
> +	.get_sibling = guc_virtual_get_sibling,
> +};
> +
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
>   {
>   	struct intel_timeline *tl;
> @@ -1559,7 +1677,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   	} else if (context_destroyed(ce)) {
>   		/* Context has been destroyed */
>   		release_guc_id(guc, ce);
> -		lrc_destroy(&ce->ref);
> +		__guc_context_destroy(ce);
>   	}
>   
>   	decr_outstanding_submission_g2h(guc);
> @@ -1674,3 +1792,107 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   			   atomic_read(&ce->guc_sched_state_no_lock));
>   	}
>   }
> +
> +static struct intel_context *
> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> +{
> +	struct guc_virtual_engine *ve;
> +	struct intel_guc *guc;
> +	unsigned int n;
> +	int err;
> +
> +	ve = kzalloc(sizeof(*ve), GFP_KERNEL);
> +	if (!ve)
> +		return ERR_PTR(-ENOMEM);
> +
> +	guc = &siblings[0]->gt->uc.guc;
> +
> +	ve->base.i915 = siblings[0]->i915;
> +	ve->base.gt = siblings[0]->gt;
> +	ve->base.uncore = siblings[0]->uncore;
> +	ve->base.id = -1;
> +
> +	ve->base.uabi_class = I915_ENGINE_CLASS_INVALID;
> +	ve->base.instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
> +	ve->base.uabi_instance = I915_ENGINE_CLASS_INVALID_VIRTUAL;
> +	ve->base.saturated = ALL_ENGINES;
> +	ve->base.breadcrumbs = intel_breadcrumbs_create(&ve->base);
> +	if (!ve->base.breadcrumbs) {
> +		kfree(ve);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	snprintf(ve->base.name, sizeof(ve->base.name), "virtual");
> +
> +	ve->base.sched_engine = i915_sched_engine_get(guc->sched_engine);
> +
> +	ve->base.cops = &virtual_guc_context_ops;
> +	ve->base.request_alloc = guc_request_alloc;
> +
> +	ve->base.submit_request = guc_submit_request;
> +
> +	ve->base.flags = I915_ENGINE_IS_VIRTUAL;
> +
> +	intel_context_init(&ve->context, &ve->base);
> +
> +	for (n = 0; n < count; n++) {
> +		struct intel_engine_cs *sibling = siblings[n];
> +
> +		GEM_BUG_ON(!is_power_of_2(sibling->mask));
> +		if (sibling->mask & ve->base.mask) {
> +			DRM_DEBUG("duplicate %s entry in load balancer\n",
> +				  sibling->name);
> +			err = -EINVAL;
> +			goto err_put;
> +		}
> +
> +		ve->base.mask |= sibling->mask;
> +
> +		if (n != 0 && ve->base.class != sibling->class) {
> +			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
> +				  sibling->class, ve->base.class);
> +			err = -EINVAL;
> +			goto err_put;
> +		} else if (n == 0) {
> +			ve->base.class = sibling->class;
> +			ve->base.uabi_class = sibling->uabi_class;
> +			snprintf(ve->base.name, sizeof(ve->base.name),
> +				 "v%dx%d", ve->base.class, count);
> +			ve->base.context_size = sibling->context_size;
> +
> +			ve->base.emit_bb_start = sibling->emit_bb_start;
> +			ve->base.emit_flush = sibling->emit_flush;
> +			ve->base.emit_init_breadcrumb =
> +				sibling->emit_init_breadcrumb;
> +			ve->base.emit_fini_breadcrumb =
> +				sibling->emit_fini_breadcrumb;
> +			ve->base.emit_fini_breadcrumb_dw =
> +				sibling->emit_fini_breadcrumb_dw;
> +
> +			ve->base.flags |= sibling->flags;
> +
> +			ve->base.props.timeslice_duration_ms =
> +				sibling->props.timeslice_duration_ms;
> +		}
> +	}
> +
> +	return &ve->context;
> +
> +err_put:
> +	intel_context_put(&ve->context);
> +	return ERR_PTR(err);
> +}
> +
> +
> +
> +bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
> +{
> +	struct intel_engine_cs *engine;
> +	intel_engine_mask_t tmp, mask = ve->mask;
> +
> +	for_each_engine_masked(engine, ve->gt, mask, tmp)
> +		if (READ_ONCE(engine->props.heartbeat_interval_ms))
> +			return true;
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index 2b9470c90558..5f263ac4f46a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -26,6 +26,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   					     struct drm_printer *p);
>   
> +bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
> +
>   static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>   {
>   	/* XXX: GuC submission is unavailable for now */

