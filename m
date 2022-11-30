Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7D63E272
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 22:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694F610E4D5;
	Wed, 30 Nov 2022 21:04:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B40510E0DD;
 Wed, 30 Nov 2022 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669842269; x=1701378269;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JMR6AMtcKttzMjH94Yo2hGQ/ma+UiHN7mLPGmGMuIQ4=;
 b=TJRg44jlML4pg4ks7CwL1B418jEI/IBDdz4nyf3vO0eWbVJNetxy1QMy
 xqnF2d5w+5pEs8zGjH0PWIAoSUoEgu/3RPg+JGHNd9pdjoxrUOiJ3Kfia
 amr/HrGc6r1uolEolTwf6uhX9wykdulKZqR6eIX3OPDkUybTCPQfHS5/j
 Pf4bvZt9GPMMsVFnhXxfeqlCRIVzAjvqL0TCOflwEbOZapvAfR0he3OGK
 rZ/b0mXOpa5OvdJcMV0VXL6Kog2Px/OMjJ9SLp3qH/v0kYUidVcL6zh1U
 hVypvxE2Ik57Q2/20pcT+6lZ9eIoQmN91QBhTKiKZxVxrMZ9iUruwu7wT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="314210329"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="314210329"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 13:04:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="750508531"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="750508531"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2022 13:04:28 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 13:04:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 13:04:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 13:04:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaebR0bos+HPcMmarKU6AwttZGJYTbNW7dLCbkVW6dn+EOX1vT7MaaIVih0FLCO0uh4AWms/P2RTUoX7JX1J4A3HfJcf0Ga1CDIzCrrVDlQDozPuk3Cq5f8pQMqqfe0IA+QAbeAEi9IB9pFPWLw73XfhYmPOceRnjbpn5hdyUJj+bbuDI/CuHnGyNMBPTg66AIFwzm5caUgG7AKo4y28ZSFUTRC3OZlZCO8H9dYDKTZbBdHT4Am24kly3v3a8pnCg9x0oc1DjbG6cSYGidy37y8WoS0p7n6ejWXCPn2xGN3fCDDEwRj4ao++TBk0E+sNDmRio3wEXsiUcI6SHbgQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2TA03So2oEA89ziVOoL4F5A5wLkYi5tQUKVLFobJnk=;
 b=FggddBwyDs45yj4oAvtOYXPEV9efR1zp5kpLeOXu5/sD0T6MXRDPMn2ISlWvf0sb19UHVtUJRgbOdLR+ebrBfHSOzLpBiCVcG7KulPSFw+D/QZxRUovHF8mB2+yS3CoQ9W18uMhQC/8zIRyPP1zul9FBJfTE5AtChBMUjj44zcnoAOh8bluF7gR1ea2K9yKaQvUCkTFrX9TBnQLVyAkQb4VecNo0Cq1d2VXwdTxHTGroXx2GxehhxeGtGtWtjpc+qz2f230Jg05JvxJjzwFkilX9iXrs48hD1lfOoda++MLAHXDtIprWCYxmpJnuusN6P+EfJbcIOPMspXHnX8WAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 21:04:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::aaaa:56aa:988:ba00]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::aaaa:56aa:988:ba00%7]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 21:04:25 +0000
Message-ID: <751f5d84-b7c4-e459-957a-06ad47d4b1de@intel.com>
Date: Wed, 30 Nov 2022 13:04:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Look for a guilty context
 when an engine reset fails
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
 <20221129211253.3183480-3-John.C.Harrison@Intel.com>
 <17ba580d-556b-c963-703c-b80e74c050f9@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <17ba580d-556b-c963-703c-b80e74c050f9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0155.namprd04.prod.outlook.com
 (2603:10b6:303:85::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW3PR11MB4745:EE_
X-MS-Office365-Filtering-Correlation-Id: c8462c7a-cd61-4147-ef72-08dad316767b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzgYc000pY8j1ckgYJJIIKh7wibEU1VoagEhsVKAAAvZovRfM7zOy8mAwwMSzcw7g7xo7HYcCXN8UUnVLu2eSTczetJyD5VFYXsuX1O9HWvNF4raVZaUEYisF23wqT8QZci1nEIXyD9XzSyKR2mXGa0mi6lY4W6whTEj4xYO+vtPuDvkEh0LAya6GoLvRqIAC//4ny+2MYQslLFwV1EUVCpY0i03nCN+qGaP0J+C9CDUkzI88Y4j5yDyNm/ltHIiWzOGZic59jyn3pD7Hut+bAChiyTXnoN8CmmbFdWBfUoDtTRrHnu13U3bKQbyKYEiVb9bRCasK1Ms2iYKv2A+zJC7LXHNBai9GiYhIbdRD7r0NjryXeBkX+NDPNxPRlHBLsIyhLZWXWOcaY3vFIJmV1nwEFfmDCF8KOSWFChgnFL+8t7lzUqa2SodOmnCGy6s/PXW4b5TwRkudmCTW5YDCbE8FgWA/uLzYw8Fct5ptWCVb5E36cI84iDhCjBmWjPgbLnk0APCCJsDBGRyd+rcL47HswXsHyWL5/u9aVLFNSd5l8BNY5lPNeJhRio3Qzo16CoDKTUhS0aXK/Q4QF/AelVvbhL146jSvVGsHpHFeOXQwOKDCw56iLdm7yo1cKibSN/kbQnoDilJlvtMhmOi30xOZFuDz03ToYuCRJZeNNXecD/6HKmbW7NPK3Q/kHjQ2FsuXso50AzCFuBQt7p07wX5wL7CaZIrIfwZCEbxqts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199015)(6506007)(66476007)(31686004)(82960400001)(5660300002)(36756003)(6486002)(478600001)(38100700002)(8936002)(31696002)(66946007)(86362001)(8676002)(4326008)(83380400001)(2906002)(2616005)(66556008)(316002)(41300700001)(186003)(53546011)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUR5S1VmMm8vUEFqaWw0ZXZwam1Nam1lK1VBQXhCMlJkaElWbFZxRkR6OGFH?=
 =?utf-8?B?Unp2WmthRUJKRkx3WWg5NWl0OUFyM2h3NFUvLzA2dXE4MlkvbFZIWis1d01j?=
 =?utf-8?B?MXNOSlI3aDBGemJJOUUrUWNFTGFYSUY3ZkNDN3NxK2JEMnZSRnlVUWdIdng4?=
 =?utf-8?B?djBnYTgvSk92eEUrMUFTSlg5cXhhTnpZVGhBQmhMV0txL1BRQm1ydm14ZmYw?=
 =?utf-8?B?N2NhOXRQSjFsTmsvRHZhWnM5NlI3TDByWDFYbysxMC9tUTlXTVpHV29xYXJz?=
 =?utf-8?B?RUJhUE4wdDNrNHVyOXZtUFFlK1BleC8xdm85ZDNzemwvZmpJNW9QUFpOU1A4?=
 =?utf-8?B?dFJTeDFiMkNLeURMSlN4TXJTdUdqM0MzaS84cFYxRTBHTFNyME1zWTFsTzV2?=
 =?utf-8?B?ancxSllhRUhPL1VrSU1tdDBORW9sWkUwM2hLVU1KZTR3YlBzQXltbDQ1T21B?=
 =?utf-8?B?SGFQWFQwV3hNNm5yM0VqSEZKOFU0L1h5Y3RpUVRkMmdDYlYwN3NCZTQ3NnEw?=
 =?utf-8?B?OHI0dzUzSWZ3S2hNbjZEWTJMMklpY2pQNWdlVkk0ODk2aHk2SzNuS2pIZ1hD?=
 =?utf-8?B?UVdrQmVKR29FMkJYblBzSFFTT0VBOUYrKzVsSzZ0bUZSbU13aHVhdzBvS01v?=
 =?utf-8?B?amdQaWFoa1A1ZktoQUcwZnMrcXdEL0FUYW1kdHlzemZxdk5MQkpPaDd6ZUhp?=
 =?utf-8?B?V3RpT1ZJZFl2d1N1amFiL09LUmkxdUFrck8vZnFjU3NGZ2ttd3owVkptRXlv?=
 =?utf-8?B?Sk1MUjhGWVp6cnJxcXhuSlJCSTErUklCUkZuYUE4amo3d29yS01DRzZpYnhw?=
 =?utf-8?B?bVFramZRSklDNDdPemM4d3RmUTBmSGV3NUZmYURQT3FMU2JpM01ub0RPaXox?=
 =?utf-8?B?VE1KK2lYMFFzVHJZYXdNK2svbHFMbXJheGRNSnM3UVhvaStXTlRmVmV0VUN5?=
 =?utf-8?B?YkowN3hkdXdQMHZjYXRmamVRdlA1eS9vR0FCaTU1RW5QZ3BlNVdUSDFtMzNM?=
 =?utf-8?B?ZUJONlllb1lBZU5walhZdUhBSnlhZ1ZpQUpMMDhQQ1MyZk1FWDFNV1V5bHlj?=
 =?utf-8?B?RUhMUENFOWZ5b1B4R3FJL0dOWHgzSjRidXRWTjJ1eVYraVNDejNnRU5sbExP?=
 =?utf-8?B?Y083c3BjZ0VJYzE0eGgrYWw1NitRTXRIRUFKdUg1cVBuN0ZIdnBuUEgrWCtR?=
 =?utf-8?B?Y2YxR2FGeDRYUEVzWS83bFZhQjgvK1hudUtQbWZ2WnZzSGg0akx4MC9jSTBU?=
 =?utf-8?B?cjdVUzFvVUhwdFlnS21vWmtrQ3JUU0dyRVZEOFN6Y2QrWVRiQVRoOHJKNkVo?=
 =?utf-8?B?QWx5dlVlckpCU0hvYXBsUmgwY1haVmdMMlUyd09ha0FlM0wxcHpYSW9wVHV5?=
 =?utf-8?B?dHNuVzZTVUJHL21NV2JERDZSb251eDVJREZYTk5BVU5QTHJrMURDeS8yc2Zq?=
 =?utf-8?B?R2FwMXloc2M5YUNFR3pkajl4eW1iaDZGY1ZGTmNJKzdLVVMxRTEyNjlrd0pw?=
 =?utf-8?B?OFd3cnFyWXY3V0o0RGpMS0xWVmJXMjBoV3poREI2Z0pIMkhHeldiWmUrSEhK?=
 =?utf-8?B?RzY4elUxZ3E3VFdRbVhDRmV3SDAvb2RCUVUrVVFEcVBrSDRJQ3A3SDhYTXdx?=
 =?utf-8?B?b3NBRTdkWWV5b1JGT3dGelBvRXFINXcxL3FUWFUrczdFUkdmM2hhNzExcnZh?=
 =?utf-8?B?ZWF4ckZnQkZXQTZSaEpweTNUMjd3dDlkeFErWEpiN0tkVG01YVN0Unhob2t3?=
 =?utf-8?B?VXFpY3NKd0VjUFN4WWM0MFZCWEdvOFRaRU1vUW9sZVk5dmR4MjJFWDZVU0ZP?=
 =?utf-8?B?am40NFdyWkxkeThVelQ2NTM2VExkWXl0Ymk5YnpzVUc4Q2M0a0NyUTlvdkhV?=
 =?utf-8?B?MEtiTWZ2OVFkNVg4NDFHTFlvYjNzUWpzcTNRSVloZHJYK3p5NTFRQ1dzdWx1?=
 =?utf-8?B?WTN2b0JzcmpnTGorcW5RbDk0R2ZZRlFhcHBkczFPRFBsMkdWWVIrYkQ0b1Fl?=
 =?utf-8?B?cEV3TUlLeW5LYnh2aEhzdGtSNG9TTVFsSklCRC8wQUZsTW5SNk9GL2c3dVlH?=
 =?utf-8?B?T3M4T1p3MllnNjJLamtJS3NaN1BEZTBOZ0lSV2I4UDJGdkdRL09yTURMeWx4?=
 =?utf-8?B?YUdnR1BQMzYrekxVMlhQRzlnaGdJeWxIdGlVS3dIN05WcEVNU3VoZXRHN1Qr?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8462c7a-cd61-4147-ef72-08dad316767b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 21:04:25.8483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScXwyvRs12+FD+fLY7ceRrDGdS5B4Wh/4/RxtYExSLQgAIIVX/RIYIVuM8jdHV6HYAHjv73gjl6xbxjs9j10e1i04oS4tV/hSkSocHIeyvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
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

On 11/30/2022 00:30, Tvrtko Ursulin wrote:
> On 29/11/2022 21:12, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Engine resets are supposed to never happen. But in the case when one
>
> Engine resets or engine reset failures? Hopefully the latter.
>
Oops. Yes, that was meant to say "engine resets are never supposed to fail."

>> does (due to unknwon reasons that normally come down to a missing
unknwon -> unknown

>> w/a), it is useful to get as much information out of the system as
>> possible. Given that the GuC effectively dies on such a situation, it
>> is not possible to get a guilty context notification back. So do a
>> manual search instead. Given that GuC is dead, this is safe because
>> GuC won't be changing the engine state asynchronously.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 0a42f1807f52c..c82730804a1c4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -4751,11 +4751,24 @@ static void reset_fail_worker_func(struct 
>> work_struct *w)
>>       guc->submission_state.reset_fail_mask = 0;
>>       spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>   -    if (likely(reset_fail_mask))
>> +    if (likely(reset_fail_mask)) {
>> +        struct intel_engine_cs *engine;
>> +        enum intel_engine_id id;
>> +
>> +        /*
>> +         * GuC is toast at this point - it dead loops after sending 
>> the failed
>> +         * reset notification. So need to manually determine the 
>> guilty context.
>> +         * Note that it should be safe/reliable to do this here 
>> because the GuC
>> +         * is toast and will not be scheduling behind the KMD's back.
>> +         */
>> +        for_each_engine_masked(engine, gt, reset_fail_mask, id)
>> +            intel_guc_find_hung_context(engine);
>> +
>>           intel_gt_handle_error(gt, reset_fail_mask,
>>                         I915_ERROR_CAPTURE,
>>                         "GuC failed to reset engine mask=0x%x\n",
>>                         reset_fail_mask);
>
> If GuC is defined by ABI contract to be dead, should the flow be 
> attempting to do a full GPU reset here, or maybe it happens somewhere 
> else as a consequence anyway? (In which case is the engine reset here 
> even needed?)
This is a full GT reset. i915 is not allowed to perform an engine reset 
when using GuC submission. Those can only be done by GuC. So any forced 
reset by i915 will be escalated to full GT internally.

John.

>
> Regards,
>
> Tvrtko
>
>> +    }
>>   }
>>     int intel_guc_engine_failure_process_msg(struct intel_guc *guc,

