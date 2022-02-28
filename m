Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E7D4C7DA8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 23:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AD910E1D7;
	Mon, 28 Feb 2022 22:45:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0C010E1D7;
 Mon, 28 Feb 2022 22:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646088334; x=1677624334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=aA0bIZ30JGAJ48iJhB6xy2IRQ3BPSzAEwhj4EhMHZkc=;
 b=hU+ScER2X6T82qFCfwNO/JKM6zbgdOY0sDMlxrg+8dwARJsXLVEuAlxC
 EveCRHn+766Hhdpn8yjN9vnMypu/PNWAPi05mOvpVL20zkiiID1UFs9lI
 rqB5zeFObuG+yQGxSzPPTteeXsxvsmZ+VB7+HqGHfzYqF6c2VN7BLqm0L
 z4gjsqp2B0H/5jfnViMxelEODZZGCFTpmSSGoMfxyV4L1QkNwLECpeVK5
 Bvxb3eQM40CpFvXbV0bihfLETnfe7lqIWwqxwuqU0YbAHVv7mouGYPtjR
 bgi+wqEzpzQYLdTQ6eLBPomeWQMvRrkxQHSZ1yJ/pPlE4U4Wc9JJiUxaX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="253196442"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
 d="scan'208,217";a="253196442"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 14:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
 d="scan'208,217";a="544886962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2022 14:45:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 14:45:13 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 14:45:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 14:45:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 14:45:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EekED5eF/k7x/q4MzKaPrqnoUsXrRRNMNfxBNcWxSRgP+/B1yFZgAm0DXM5gP1VLSG2mpAGNxye5my3QAOQspyhaE05u9+JxB0A2iD9n4Zk7S56iiolDB1HGOy2vlyg9in1lOEg6CimZlDFJBFQl45yZ+mfiw6f3BlLrHiuMqK2238r2Euppw21PPOumuJ/1kwD9QK8OqVmLdoueAOFfoxOkGwnDhmh4Dq7Mw0l/G0dfMwaa13HFeEk0EbTd23bgLeP4Cap08gc0B5WPrq39nBUzWhGghYWyr4kUR5niRb1tITjHjW/jWL4CHy9hlxiSyIHdxjxEpDqdGQ0PaKpMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwK9r7SEwyIWq+f1oLt8XAowBNWmY21UOtgX37NYVG0=;
 b=TZc8jEK83oSasE+Mrmei5d4SNN68b/rxZGP8bL1G89RTPXG75seNpwxLEQe15QJmHu22x7Ao3TeAnep6GqMwTesHn4t6wxTbqyRdk/lsUNynF3BSq7g0AHk+z0TzVthrFza8+/PqMsvu4o4ipXbVYeNY/52oWNIBoTAxyUoVm4V0VZ/kYUlfCnAt7vihAXkrs6BkB95WIkkNNVEy73k4R5nDf+yVQFn40vkTGAUo2WDxRa1CBE7GvfhEBkl/HhBXlyiQaqmPG8m5B9+u+1RC4pYJ1zmbXYobQkHKLm9ulcyE2MqpQaI/HtO1k84YgEgMVsGt/bzMWIrRGtvwtZ5Gbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 22:45:11 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 22:45:11 +0000
Content-Type: multipart/alternative;
 boundary="------------UHkBWQVGE8eTohzzorAu4rXP"
Message-ID: <999f2252-6b91-aa12-409d-5a17bc5a07ba@intel.com>
Date: Mon, 28 Feb 2022 14:45:08 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/i915/guc: Fix flag query helper function to not
 modify state
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217212942.629922-1-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217212942.629922-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82773745-d34e-4833-9f54-08d9fb0bf9de
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB3908EDA868A5A63E783C5B2AF4019@BN6PR11MB3908.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SLhv26vRfiJBHNIa0u+OEYNhRVyxKHrno09Z/nwTlVF7bL7Ls6gIsvCOauA7g60V0UBOPqdaMP+LDFFmTlMAh3144O5PQjZuoerGPuLUnu33s+goj5MkwIsT4NKfZEud90mYh6vHPUyVltJutxuCRmE/jpGZ0o6MUMJIUq3t07SHn05MfizJ1QeaG+Fo52BHeYtNda27cz/YT1AYjF/+zJEUBQdGs/Fy3GaFozAio2pGO2BZNRMJ4CaYOA1jr1AOoczPlmoQjar0y9XOLIvuWyYuyf4oly2041n7hZpP5C4PSq7tJ7emGWGNl5IjpE84Xf9X6ZXvkF7vOlPIqt5dVjEIS5kpga96by9e1F6m9I0IN2TSdVfivbU2Egyrq/2mkoHrz+B9sF8wF0/V9z2sWwTHxAbBAjX0iAJBldGuNA6N0kOzwkKKEZtIUorOB3vb2B6KpupnxmmcMYindCOZ9NmAbz5tGI4/zHqmuH7BtLh/gaoJ4q/4DupTsqTDzwDLp2Y+Or02sKuzwgKwgj0487aOJZR4QWUvX1SjA9o5cS23oHRL0xgsyHzfKYFS7fIKK17z2dPbHjnnp9fTK62Zs4GPTJnzwqcVFStAq0r9bd9RjpWLlzuGak817XexcERSiAQVSTug6qKNiI0gsfiMpy98HCWDD0ds2IQA5JIPpvhw/xb8HyWcVHvAOrDCclQap9iLw2yLMY7SSevCx/ASFoMrJb0u56YFYSKWOGbcVCWG+h1PK0yfsWbDpRkkWbO2tbozOmoDRObibTzkNWpBpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(450100002)(33964004)(508600001)(316002)(6506007)(82960400001)(83380400001)(6512007)(5660300002)(2906002)(6486002)(31696002)(8936002)(6666004)(38100700002)(2616005)(86362001)(4326008)(66556008)(66476007)(66946007)(186003)(26005)(36756003)(31686004)(8676002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sml1aEEzaDZzall5S0c5QUV1Z0hDL3loR3QzRklFUWFBVkpUWUt5RmhvWjdl?=
 =?utf-8?B?YWRacnJEOUR4emJlS2VPMTk1OEp2bXRacGh3UC9SbGd1NmlrRi9OOERkNFRO?=
 =?utf-8?B?YWx0dHBRQjk5TmM4NnFuNndmK2k4Rk9LVHE0c2VpREFqVS93T055WkplYUJm?=
 =?utf-8?B?bkdabjVqR1N0bkhnRzdCTDNtbkdPdnNvUVBWOGtseDYvQkQ4MXl5Q2Z1Wmhs?=
 =?utf-8?B?cXpVNFgvSUQxWE1Lcm9kOGZIRUR0dVFObmhFellNWllNL3lFV2xGM2ZGWlFF?=
 =?utf-8?B?bUppZGl5WVBsdm5HRi8rSVhRT1gxOXkxUTZnOHgrTEZhQ3lnV3RBSGZ6YTFF?=
 =?utf-8?B?MUd0NXJQeXRQa0FkbDl0MWlDSFpHdjhKeVNCWW5pOHNXMTdOZVBxWDRMam43?=
 =?utf-8?B?endLMWxTQi93N0NrU3RVZUxuZ2NSNUFPcWQxTHJHWFlJVDRLVGEvYytnOHpS?=
 =?utf-8?B?RjNKSTg4NlA2WGlCMVJDWGtFNE9qQVJLUzM0c3FRWitwMjVaV0YxQUZQOW8z?=
 =?utf-8?B?Z1QxTzNTMUVGZnduMllJOVdxcmt4TDVRUkl4YXFGcWRPY2pWUTFOTmNmMnVO?=
 =?utf-8?B?RTlTZVlybElmaW5vOVNobXFuRDFMM05nT2kxcXh3RGVHN0dGcmlYc2xKNEln?=
 =?utf-8?B?MmJ4REJEcUlreUMxL2dZd0JCTkdsUFN2T3A5OFVNUXdDUkpRbC83TjJoYWFI?=
 =?utf-8?B?c2VKdnU2Qk8vTXlSazJvQ3M2UE01UitZYVdubWZGUzFvMGhUSEhZd21KOHUz?=
 =?utf-8?B?R1NMVkd1aVcrWWh6bXdXNGowajZYK1ZrdkMyTlFFb0FMaHVraDl6aUF4M0hi?=
 =?utf-8?B?Qm50YWJiekg2S3RvREF1Z1YwYkVxM3FSTWNOV0lkTGdVZmRjUlQ0K2FmV1lT?=
 =?utf-8?B?MVZ2OGk1NGowRElWLzY1UERQVmtjSWZLYitEb25TOENSeER2eHNEWE9VZWJI?=
 =?utf-8?B?bWtoamY0bTM0SnZ0RXRuZEp4U3hzMCtWdVY0eXYzVGlxUEE5M20yUi9zYzRq?=
 =?utf-8?B?L0JEVkdnZlFyRmw4d0VveEpRS1hlVGpwaFVlY0NmMUhZQTNJRUlGbDhhUkNr?=
 =?utf-8?B?WTFtbUVXV056WUdOZjNBdFZ2SGo1UjVzWXNwZmVPQnVyQWdWOW1oRktLeDR6?=
 =?utf-8?B?Vzd2dGF5QU9GWk5CM1J3QVNISWZOTWJjeXRTejJjMzFOYXpidU1ZVHhTNjE0?=
 =?utf-8?B?ZXZrUXFac1JIZmRyZkNUWVl1cXdINnRobVRSSWQ5L2Vpb1hVT0NtVzFXd0w1?=
 =?utf-8?B?SlVuUnZpcWtRVEUxTmRaNVFFRkl5WjJrWTcwQzZ6eTQ0Uk9jN2lUQkRlSmYx?=
 =?utf-8?B?YUtqVHh1dFVxVzNEZWNTaDlCVlo4eGxLSGdQbmQzRi96dEhqZG9DdlArRnlE?=
 =?utf-8?B?MHc5eXQweHFQb0VERmtyZWdBb0psM0pHcTZ3K1ZNYktXMitmVFBIRnZRMHNk?=
 =?utf-8?B?ZHdyYzVobXRyaDl0QlA4S1RjSGdEQWFiSmFzSEFyQ1ErTVZGZDFwM1VPSTZS?=
 =?utf-8?B?bTRJN29Sa1JKRmJrenAyck5SYVdUbWpTaHBzZ0tZUnpqUnFTS3BxOGpVeGZy?=
 =?utf-8?B?VlFDT3d1S0RhWnI2S2pjM3VmT3FKL1cwOHU3WEpzdjRnVWw1WGJldWk2dkd5?=
 =?utf-8?B?NmprRU9HUk40aDVZWVFERlBWUmhab1pwOHFKWnJTZlRjdVFBMVI3aU1UeFlO?=
 =?utf-8?B?VmtaR3hMZk1UNE92OEdCdTM5b2I0SkEvSUpvMHhzQUsranYzRXc0Y24vY2kv?=
 =?utf-8?B?WkV4L0FaNWRFSGRTclpSbzBUN2J3VS9LS0JKcmYxY21TWnRFcHEvNkladjlk?=
 =?utf-8?B?WGxNbE04NE8vUW16S1VqU3VWUEZDaDRJellJNDJjczF0ZlpZV0thUWgwQmZ5?=
 =?utf-8?B?c1ZmZHFYZklYZlNpNWlTYnFCYnpiVnF6Uzhub3UyZ0Vxay9VRGdIUERsV3Fu?=
 =?utf-8?B?eG1zOVZWV1JZU3FBUDVDNTlIL3NmcEN5ZnZTRk5wSGZyUnNyTjlhbjROejdY?=
 =?utf-8?B?TGhrUUd1Smtsc2tFYVY5TlY5V0tXdkErRDhVbnZtTEJDUjNCMFRybHJUeWFT?=
 =?utf-8?B?ZmRQVnN2K2NBcUdER0p3d3hGbEdheXdOdHBSQmdqU2Q2bTNiS1lOZnFkUkdD?=
 =?utf-8?B?N3RscGFHeWNsZ2VoSjQwTGpKWFlUUVRXY0NNTnFpN0paOFllRU96K1BQV01D?=
 =?utf-8?B?WEpuYmh1ekg3MDdJQUFPcXBuekVtVUNDbnJSdWNLYTlRcUdrOGpJQXFRWGF5?=
 =?utf-8?B?TmxWOXE1ME5MWThmNUZ2SnFNM2RRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82773745-d34e-4833-9f54-08d9fb0bf9de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 22:45:10.7777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: io/nkd6MeFBSv+6byHUmBnMTLQ3thFjOEJiXKOWt+TN6nuZKRYRYw40FL/0zFzEGVfn4Y6Ih1ovJfpu7Z6aW6a+9rLBcXrO8l/hppCtdmZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3908
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

--------------UHkBWQVGE8eTohzzorAu4rXP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 2/17/2022 1:29 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison<John.C.Harrison@Intel.com>
>
> A flag query helper was actually writing to the flags word rather than
> just reading. Fix that. Also update the function's comment as it was
> out of date.
>
> NB: No need for a 'Fixes' tag. The test was only ever used inside a
> BUG_ON during context registration. Rather than asserting that the
> condition was true, it was making the condition true. So, in theory,
> there was no consequence because we should never have hit a BUG_ON
> anyway. Which means the write should always have been a no-op.
>
> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>

|Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> 
Daniele|



> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..d9f4218f5ef4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -174,11 +174,8 @@ static inline void init_sched_state(struct intel_context *ce)
>   __maybe_unused
>   static bool sched_state_is_init(struct intel_context *ce)
>   {
> -	/*
> -	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
> -	 * suspend.
> -	 */
> -	return !(ce->guc_state.sched_state &=
> +	/* Kernel contexts can have SCHED_STATE_REGISTERED after suspend. */
> +	return !(ce->guc_state.sched_state &
>   		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
>   }
>   

--------------UHkBWQVGE8eTohzzorAu4rXP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/17/2022 1:29 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:John.C.Harrison@Intel.com">John.C.Harrison@Intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220217212942.629922-1-John.C.Harrison@Intel.com">
      <pre class="moz-quote-pre" wrap="">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

A flag query helper was actually writing to the flags word rather than
just reading. Fix that. Also update the function's comment as it was
out of date.

NB: No need for a 'Fixes' tag. The test was only ever used inside a
BUG_ON during context registration. Rather than asserting that the
condition was true, it was making the condition true. So, in theory,
there was no consequence because we should never have hit a BUG_ON
anyway. Which means the write should always have been a no-op.

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a></pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff">Reviewed-by: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>

Daniele</code></pre>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20220217212942.629922-1-John.C.Harrison@Intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..d9f4218f5ef4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -174,11 +174,8 @@ static inline void init_sched_state(struct intel_context *ce)
 __maybe_unused
 static bool sched_state_is_init(struct intel_context *ce)
 {
-	/*
-	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
-	 * suspend.
-	 */
-	return !(ce-&gt;guc_state.sched_state &amp;=
+	/* Kernel contexts can have SCHED_STATE_REGISTERED after suspend. */
+	return !(ce-&gt;guc_state.sched_state &amp;
 		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
 }
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------UHkBWQVGE8eTohzzorAu4rXP--
