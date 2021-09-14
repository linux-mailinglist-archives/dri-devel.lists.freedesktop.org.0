Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60440BC20
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 01:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348BC6E83A;
	Tue, 14 Sep 2021 23:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E1D6E839;
 Tue, 14 Sep 2021 23:23:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="201662662"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="201662662"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 16:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="470503921"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 14 Sep 2021 16:23:35 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 16:23:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 16:23:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 14 Sep 2021 16:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8bxdfmln5lSkU8M3Pbszb461q7lX0bGd9chWUZFsc5EuJ47Xr7ZtWw/bQCFefFU9qp3bEdvZlrxcx09rbevS0mTRloRa7+8Bfz5pV6l/pMDNg+GnuDgFdsAgtRqkFHbcPu1uIqKpVTz/uF8P29OeeNpxcMflQjDrUVRStNQR41KtQv2jd5SQGDJDnADV+woO56M5NEDtoGwlbiip6vmvW6G9yviU7pbjQhbbfM6zsgiWdQ2GgQR/GY9rRT5SIN1uuWuyg1JZUzlsrmUeEfxejfacoxTQ9NXryZiZAmd71UQ1+aRDwc6jERaWC5HloJv06I3VIWXjOoPe/vc74GzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GLm9r6usjngJqO565enKF/nirhVBiXteZtY5LGpYlxI=;
 b=NBO/214EB/Xs3KVTqKpw0FfCAtKVuuspXGZP4dnxOphrdJ8fCTeqPCRwllnl8kCNPAZvVtDNYG0erqM61KExcmpt5etzqYUM2LRoR7aSPWsE7xPMEL5VtxMjG5TvteSATSSkg+L9fkQNiWjq/MHwhb+XAA2yLADqHL2/698QlQOZz1sfVvc5EYNqqUu+P/dZHP6mbwA4NuqLszwpv10pdRTJ1Gm+fs3OTDZKrKfEkujiCdGYpNazaCni7+QDLvWR2PCrcXgyhDst33mhVZaFSFjRPgEeB2EvfPk8TRnaU7d6qIZYSqW2jH6s1yGzJfur8BeoLRMzG8XBqimMCWI+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLm9r6usjngJqO565enKF/nirhVBiXteZtY5LGpYlxI=;
 b=g4IrUIXMo1tE5JaL/wqSSx7Y1udKwVmSQGkbiZ/Xo8Df+23kzSCvZ79LAF2z3LaYIOMxQ+iCJ6hDFj97MgKK+4d8AS85EI5ctC8Y1pgZZ7MdW0LLs8eWnOC80y5rA/K+OyZi06ivKpG/VFahJH0Xrc0Md6uLzUHDiSvctZBxzWA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5610.namprd11.prod.outlook.com (2603:10b6:510:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 23:23:29 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 23:23:29 +0000
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Refcount context during
 error capture
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>
References: <20210914050956.30685-1-matthew.brost@intel.com>
 <20210914050956.30685-5-matthew.brost@intel.com>
 <YUCxwV+A3C8BXQp+@phenom.ffwll.local>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <03f76ec8-0d10-6078-3dfe-ef72eeaac487@intel.com>
Date: Tue, 14 Sep 2021 16:23:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <YUCxwV+A3C8BXQp+@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0288.namprd04.prod.outlook.com
 (2603:10b6:303:89::23) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR04CA0288.namprd04.prod.outlook.com (2603:10b6:303:89::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Tue, 14 Sep 2021 23:23:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42ab3479-7163-4fc5-1692-08d977d6a8da
X-MS-TrafficTypeDiagnostic: PH0PR11MB5610:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56105E06800A04A4B3DB9D9BBDDA9@PH0PR11MB5610.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p3ZoVg/KjJK28U0ZAhK9DG7bUb9qhAiBjxPmBgf1H2BxRb+2WV0To1xjmgdTxirJLSJ9T1RtATOMLu9533En/AVSMJ991fAqj4SMpYWaampWuB0FDmU6BiQsCojw4f1LZapRtjqwx8YeHT79JQMZp08h2GOtn/2rym4xSmUWw86TIB1VReAtYdrI/6tAMZ3gVd26ZpypkebzO/ybHE1vlqUeIEFG4aoMgwnncKxPPGQPQU9XV0krLenbfyedHjIS4cPAct95VtGvKuhOWmNKgizdch8k019ji6sz8XQmo7WZvaMgLKwntxAfXZfqCyuqo5piRAvuDaZrNT3tUWJCHu7B7yEDka4TrPxkKaIA//PkNvjfXsIkCAO/yW+q668R478PjrdKEO0DeGW7tDzILbAYCdXUzE8tW4RSmIg05JEeG+MY+U9hDF0i3+xIDHIS4GaHC6NVviVebNy5aFUBElYy2RFASUE91HtRDxtc/BeeqqvlRHFpF3Vs0505Qy0bQ+U/IuoQw/rvsbIEQCPe/4jpv3vwWP8ilR5kaGuoFZh18TT9p1OOlSHnLMN+yIDHFwJlz6qNP0/74g91yaDf5CsGmyLWFepJUCdR4hH0IgsnF6622H3oL95Wr3RCLL8xpsBawOHYsjgILC3By6cQClzFa2aCscz42kZ7Y4pFyDBepG199ZIc48QdHqbWeYJSEZ0RTXtQhQpZiSlN6DLJvLSIla8exwdZrpJqeS37CFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66946007)(31686004)(6636002)(8676002)(66476007)(66556008)(31696002)(6486002)(956004)(107886003)(110136005)(4326008)(2616005)(53546011)(2906002)(5660300002)(508600001)(186003)(26005)(38100700002)(83380400001)(86362001)(16576012)(316002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y052SWo0c0I3Y0dPVWQzV3lMc3ExbDhWTTlXQUFucENKNnpiWWVtSVpBcDl1?=
 =?utf-8?B?QTFXY0Fsb05QdXQ3TTVqVEVyS3FGYWluaVFVdzZ2MGtBbDRFeDVmTFNIY2VM?=
 =?utf-8?B?WElQdDU2RTJtR0F4VVl5eDBIV2VKRTMzT1kyaWpBdDhjczQyckF5R3RRZlVh?=
 =?utf-8?B?ZmpkeG8ydUVLTGs1Wm5SR1JSWlUzV2t2Z0dlN2JBSkJ3Vlc4UXFkdDU2d0V1?=
 =?utf-8?B?M1owb2M3ZkwwVFBnK09raXFTcFJFaGNBTllTMmdqWERobDAxa1UxLzNoR1NO?=
 =?utf-8?B?dzNrS1JRRGRDQTVjRTdQWGVOZnpWbnZ5ZmkwaHZ6b2NMckFOZDBYUWU3QkFB?=
 =?utf-8?B?SXcvSm1WdnJVUEJnaUV5UGFjSDM5aThZTlVYQ050N0tvclV5KzFQeVRRTXNv?=
 =?utf-8?B?NTB0VVNVTE9VaTVOdVJPNUdFa0p6QUxNRUl1eE54RnhRaWFmaDh3Y0Q4Wjkv?=
 =?utf-8?B?TmtsMEZHcE9Ta01kV3pOa1FOTEVTTnFGSzZwZmdiZ3V4OC9SaGZEVUpTMUE5?=
 =?utf-8?B?SktVUUk4UnJBMERDK3E4a0Y5c0liTjdnRzhjeC85UFN4cUhET01qS2JueVR2?=
 =?utf-8?B?VG9aRE5LQVVqTUd2emhaNGNneVpjOVdvM3AvSjNRSDh2czhhWkhQTTNvMldQ?=
 =?utf-8?B?VC9VOHo3Y2JTY1RCL21YRHcxMHJROFR0UUxzOHRoQlZsdnkreWhDN2dydFky?=
 =?utf-8?B?MjU4WHpsZ2J2Yk5KNm1pcHNmcFFMSzRmV2ZhSUNadEthR3pJOFFPNEY5bExY?=
 =?utf-8?B?V0VJOUJUaDFQVWJFUGRzdkp6WjNtdW5vZ1pFVDBHWXFUKy9hdTBQc0JWWVRh?=
 =?utf-8?B?ajRFQmhVUUNKT0VWTFpOc2JQcWFZQ3Y3UTloK2MwZFRPTVhVQzFlRGxlbXpS?=
 =?utf-8?B?amxQRFlFbWMvem5pMGJIcXAxWU1TUWlaRFFKOUhQN3k4UllwdkN3ZzVoSWxV?=
 =?utf-8?B?b0JiYlMxaXBBSjYxTno1dW5yeVJ3cGkvMnFHYTk3all3Wm9HM2ZPeTBhMnJp?=
 =?utf-8?B?ZjQzNzJ5YlM0VmpGbDZLOVR5NEpyL3dOTTM5OXRGTTIzMFNzMnpOdkxEeHRH?=
 =?utf-8?B?Z2lmc0NIYzRBb0NyVDJUN2oxeXlpUTlFdHRORC9jcHZuakhpbnNwMzljRDRi?=
 =?utf-8?B?cWxEendPbGRPbjZMN1ZHdkVodDF0cURwT2Z3cHFnaWlYNVM3TEVDRmRCM2Zk?=
 =?utf-8?B?SEZpOTExS1daNHptTzRPWDZYejlXVHZpRVc0Y2IzbWNEY01Ick91ZFBZZnd6?=
 =?utf-8?B?aENUYnlHOWlBYXlGMDZNa2pVNFQwMVFXdEFNVmp3c1ZDRjhGVFpsRzdzdnlW?=
 =?utf-8?B?eTZxT3JCS1BFTzB3MC9vUE9tRzhiTUFOVFdoTFRDMzBvWjBpbnQ1b3dETzZj?=
 =?utf-8?B?NnR2QXlPUE13WldTbVE5RldtUVR0RGE3bHRjN1FMbHJDTVBVMk1vaWJ4Wnlm?=
 =?utf-8?B?Z0FOVi9EY3h3dEdvb3kvZno1ejdjaFBrOFhhL3dqMm5wMjV3UEhUQlpuekR6?=
 =?utf-8?B?OG9EaWZuSHhqZW9PZ2x3UUdkaHUzUzlVYSs3WUgrUFFWejQza0hrM3FzQVp1?=
 =?utf-8?B?S3dpQitHRlI4aDZzcGxwL29qbW9jdXpkdU56bTVQK0RNelIzNDJFQTZKZnhW?=
 =?utf-8?B?cy9DT1RUNFgyRWFxRHBYVGpPNWlrT2xYVytpQjU2czl3R3hkNkFBcGwvVWxQ?=
 =?utf-8?B?TTcyZG83WXF3YWg5Q3N2RURGS2N4Vzg0amsvazhHUTBCN2ZvNnd2N1RGQldB?=
 =?utf-8?Q?PxM2Y1JelCC2fsLNk/OxHkO968LZjVkkQ7JysfA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ab3479-7163-4fc5-1692-08d977d6a8da
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 23:23:29.0870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41DFOlzOGrw0Ii2882O8SzQuG1+lvPbjZXNLE9KHB54Pi+8vKITZnJBcO25/9qQqZi5ANGJjmw18/9g49Q9Cma9SSqj16XQj6vemmgrnl7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5610
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

On 9/14/2021 07:29, Daniel Vetter wrote:
> On Mon, Sep 13, 2021 at 10:09:56PM -0700, Matthew Brost wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When i915 receives a context reset notification from GuC, it triggers
>> an error capture before resetting any outstanding requsts of that
>> context. Unfortunately, the error capture is not a time bound
>> operation. In certain situations it can take a long time, particularly
>> when multiple large LMEM buffers must be read back and eoncoded. If
>> this delay is longer than other timeouts (heartbeat, test recovery,
>> etc.) then a full GT reset can be triggered in the middle.
>>
>> That can result in the context being reset by GuC actually being
>> destroyed before the error capture completes and the GuC submission
>> code resumes. Thus, the GuC side can start dereferencing stale
>> pointers and Bad Things ensue.
>>
>> So add a refcount get of the context during the entire reset
>> operation. That way, the context can't be destroyed part way through
>> no matter what other resets or user interactions occur.
>>
>> v2:
>>   (Matthew Brost)
>>    - Update patch to work with async error capture
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> This sounds like a fundamental issue in our reset/scheduler design. If we
> have multiple timeout-things working in parallel, then there's going to be
> an endless whack-a-mole fireworks show.
>
> Reset is not a perf critical path (aside from media timeout, which guc
> handles internally anyway). Simplicity trumps everything else. The fix
> here is to guarantee that anything related to reset cannot happen in
> parallel with anything else related to reset/timeout. At least on a
> per-engine (and really on a per-reset domain) basis.
>
> The fix we've developed for drm/sched is that the driver can allocate a
> single-thread work queue, pass it to each drm/sched instance, and all
> timeout handling is run in there.
>
> For i915 it's more of a mess since we have a ton of random things that
> time out/reset potentially going on in parallel. But that's the design we
> should head towards.
>
> _not_ sprinkling random refcounts all over the place until most of the
> oops/splats disappear. That's cargo-culting, not engineering.
> -Daniel
Not sure I follow this.

The code pulls an intel_context object out of a structure and proceeds 
to dereference it in what can be a slow piece of code that is running in 
a worker thread and is therefore already asynchronous to other activity. 
Acquiring a reference count on that object while holding its pointer is 
standard practice, I thought. That's the whole point of reference counting!

To be clear, this is not adding a brand new reference count object. It 
is merely taking the correct lock on an object while accessing that object.

It uses the xarray's lock while accessing the xarray and then the ce's 
lock while accessing the ce and makes sure to overlap the two to prevent 
any race conditions. To me, that seems like a) correct object access 
practice and b) it should have been there in the first place.

John.


>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 +++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 1986a57b52cc..02917fc4d4a8 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2888,6 +2888,8 @@ static void capture_worker_func(struct work_struct *w)
>>   	intel_engine_set_hung_context(engine, ce);
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>>   		i915_capture_error_state(gt, ce->engine->mask);
>> +
>> +	intel_context_put(ce);
>>   }
>>   
>>   static void capture_error_state(struct intel_guc *guc,
>> @@ -2924,7 +2926,7 @@ static void guc_context_replay(struct intel_context *ce)
>>   	tasklet_hi_schedule(&sched_engine->tasklet);
>>   }
>>   
>> -static void guc_handle_context_reset(struct intel_guc *guc,
>> +static bool guc_handle_context_reset(struct intel_guc *guc,
>>   				     struct intel_context *ce)
>>   {
>>   	trace_intel_context_reset(ce);
>> @@ -2937,7 +2939,11 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>>   		   !context_blocked(ce))) {
>>   		capture_error_state(guc, ce);
>>   		guc_context_replay(ce);
>> +
>> +		return false;
>>   	}
>> +
>> +	return true;
>>   }
>>   
>>   int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>> @@ -2945,6 +2951,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>>   {
>>   	struct intel_context *ce;
>>   	int desc_idx;
>> +	unsigned long flags;
>>   
>>   	if (unlikely(len != 1)) {
>>   		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
>> @@ -2952,11 +2959,24 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>>   	}
>>   
>>   	desc_idx = msg[0];
>> +
>> +	/*
>> +	 * The context lookup uses the xarray but lookups only require an RCU lock
>> +	 * not the full spinlock. So take the lock explicitly and keep it until the
>> +	 * context has been reference count locked to ensure it can't be destroyed
>> +	 * asynchronously until the reset is done.
>> +	 */
>> +	xa_lock_irqsave(&guc->context_lookup, flags);
>>   	ce = g2h_context_lookup(guc, desc_idx);
>> +	if (ce)
>> +		intel_context_get(ce);
>> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>> +
>>   	if (unlikely(!ce))
>>   		return -EPROTO;
>>   
>> -	guc_handle_context_reset(guc, ce);
>> +	if (guc_handle_context_reset(guc, ce))
>> +		intel_context_put(ce);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.32.0
>>

