Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840DC6053B1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 01:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0556C10E0EC;
	Wed, 19 Oct 2022 23:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E58D10E0EC;
 Wed, 19 Oct 2022 23:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666220730; x=1697756730;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4eaDCgP6lRX7srWzYClLw0Qu5x2prddoO0cy4Dxdgis=;
 b=hPrExASAIpp9j8+Trg5fcdgEdPJHLjZ0EO3xMnSk0zJca3IiAhChVexc
 6Fa51PLnDPDBE4PvjfR7Rs1dQgerMwnXNZUCCUMZJ8wlifE6QVqojtteI
 aYkCmXbFPBImNuD+zEqRx3cv+QhDuXpRV/BHSYpRoSF0J7vywgtnWt84J
 rK3hNh3v08NKQ5QV2RS5W9HGLBPJU1h3PfVn1O25oWTPvwe2oUVsgiVz5
 PLjrWfKP1tD2ANaQ0Dure6nvQH31cT14SmqplufwNAUXOMgCQbltXU56I
 F48aQrTMn+f6O3cOHwPLX6srbhwMJTX+L0IwTScmXAnWcCXatNg4/bOFW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306541980"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="306541980"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 16:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="631896818"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="631896818"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 19 Oct 2022 16:05:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 16:05:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 16:05:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 16:05:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfOtSydCTQkRQkn1UMbbaUH3uW8/chDRBJl7Dd5Q+jwcfnyECZjl0YAv+0r5v+yVYdtHTAdMufR/bCf5q7DrvvagV+rWChAR+2YluCqmqS4CxZRWnGqb022FtTlf//v4dEDrGdhrvrJANu2n0suo6g97S0MaUHUW/mGhRhovOkYukmLQB8V+lNEF5rHyloJEiiyVKabT/WCI+sK181EbRcfo1RKR8/S0T8J6bW6Pv2IRhP80Xg7UcTzetBsouoKhNNA66ZDOyOnlc5c8hLXcMFxzlWshQfQzCVQ9wkr2ITvmmi+4hXu/YDRvcYBdHaPfQBAvBPx7AMa4CdEDXPv9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdMJiCNGlkS2vEPeUV9cxm8ES7gDb2S+n+YVVropZiE=;
 b=G+TX0FPNi9B/kkfSWL9Be2SdURvU3y0TjyLTIU4FvicIJPeCHdjsudBL2CdbsiUJMUx3K9FCncxwtIOS1xt8grJQlMRaFGRaxLOjTrjEN6IxW2mvaqZshbJmLUg2Q4IRZl+Uq2dqn7PSFfDGy76c/bhqmAwqWLY2/234C9RL0HazKeRYUb3Dn0dj9bgKcgre8Tnh53IsdDOadfkKgqunMJVA+O5AKjHaWZsL16zB34MkhALfyR5Y09Mp+bfN18gU1TT8Gj+yR07n1qiV/l9YnmHmshP9p5qXrhVQwOMMQt3k5FUcurkT+G6454LjoneGn94TmMIwytMpwxbBrYiouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by BL1PR11MB5349.namprd11.prod.outlook.com (2603:10b6:208:308::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 23:05:11 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 23:05:11 +0000
Message-ID: <961d9096-75b5-e6eb-a8ca-af5306cf1fa2@intel.com>
Date: Wed, 19 Oct 2022 16:05:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20221018221546.17852-1-vinay.belgaumkar@intel.com>
 <c46f4714-7c12-c331-ec4f-ab52a7c499cf@linux.intel.com>
 <4fa5bd14-f891-3909-68c5-3b6b43ca27d1@intel.com>
In-Reply-To: <4fa5bd14-f891-3909-68c5-3b6b43ca27d1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::32) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|BL1PR11MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6f1581-dd8e-4460-9c61-08dab2265fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WirbM5q7MzxDpr331wwXDSyJQ7ogstenK/3l3XD4XLEjFpUZdAoNooHmvXiQ4gZBzkd+UhedUlxC6XKMlGKfWlDh3UskBON9tnUDuC1KXSu/S4tLyg2HPG8kN7vlrdAIw54gPNTU5iXnT98YtysIYnw7o5FzpYArhzP7PIJeFXNXQYuPVqZMKeGM5+QsrgWuQVmfZsZcnBMppDyPhsXLj1XcQ5SpwJIT5PfU+VeQPUTx7cVibo90Kz0PsfQuqdn4ZmXEpz85mUWcz6MqXyyA54oCug3PW49mu69SomgwMviOpzUQOQV8NXL0iL6Sb9yvP85z43E9KskNFbqGxHXFkIW8HifRqLREhz2ZjtObc5+tESTfLhC+AyGHkRltSYmDJ0C0ST5TwpivbHKAr/4EK2jVW9y3Gs6qbbE6glzu+9U4+7yFb9+Gsxy1Ds8qXSHHpLXedudn2xDbwKD30q49HuiebK+AObQnQc5aBojg6RwzIkS31eEN+wX0tE5Rvo3dDM7m6jowj9fgLTx5Ay5X7jL89uPxlky2rMBz+39FmzBaAQqBtAGZ6HX+usHGd4K59VlpCjmlhKSjFFYXlHy6aJF14a+PTj6FSo3vi70hzJfYx8VBfrXrFnoj7Z1YykgRb9feA1LEzcCCiDH3KLU0m/bdvoPl/Uw9XG26TDEdymRVrtl57f7dSS9cQiQlWrXpP6C1phHQMFfjZj2G+lH53ie8Q3wBsWhq46uwKp1b0Om1M+GJhW/ekbAX/czjj7V/DhXu79xw/IRke6NeNFVk4bjQcxWu6NE79X4dUUAnB6g/UtOMF9v/iOuihGI+KCmAlSHhkytv1f+PBlzRlC17Th+Y/3QLt/uQRQdqX4/DaDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(83380400001)(2616005)(31696002)(86362001)(82960400001)(38100700002)(66556008)(66476007)(41300700001)(66946007)(6486002)(8936002)(316002)(8676002)(26005)(6512007)(6506007)(53546011)(186003)(5660300002)(2906002)(478600001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2dQSjFtY3UxNnhsWHBWQUFsNmRRbjM0bUFqVFFJalE4VmZFbTRkZWZ0cG5V?=
 =?utf-8?B?MEdqb2xKT2NHMGdKNkZ1c3RES2V5OFJadktHYWQ2b2hkQVRyY3VNWG94eWJS?=
 =?utf-8?B?aGg2MDZReHJUaGV0UnNFaUxqZDZZTlIvaVJUU2hyU3BpSjd1M2FhYVJLSzZD?=
 =?utf-8?B?SXUzZUJiVXhEUTdLT1gycDVLMWh2akRCL3NnbHNWK2ZaR2V5MXp6SFVreTVI?=
 =?utf-8?B?Z3lFVzUxM0NGSVQwODRMbzhBRzlqZWJ3L2wvUk9ySXVSZWI2SUUvSVE5ZXU2?=
 =?utf-8?B?SzBMTkQ1cTVCNFV5R3Z0SWdZUHkvQ2Q0ZlJRZGNPSkJHUkVCdDBMM3oxbFor?=
 =?utf-8?B?ODNaSnM4NUthY2ZWMzFPaXFoMWo2Q3BiSjB3VFNXZHJTVWRJZUNrVFFobTVh?=
 =?utf-8?B?aHNGSnNtRktnanZ4VDlWdkJRSTNBa1F6MTh2cGc5UzNtOU1FZk9xMUhVRWxN?=
 =?utf-8?B?dENWUjdjTHNpK0FPdlQzYmJTeG5MVWR5Wi9rdWpUZmF5ZlBQa04xQU5MOG9x?=
 =?utf-8?B?QWxHNmh2dlZVWXRXSjMzdWFJQVlHMk5ueUtLemV4Z3VVYlVFN1dJcmZJSjJK?=
 =?utf-8?B?amV4bExGWnZKZXFGaGR4cEpzRGIrcmxxZlJrd3lhUzR1MFl3ZTZ1U0wzOVFC?=
 =?utf-8?B?M2NiUC9zZmhOQmhpSmtHdnc5Z1JndHlQMmxKblVXMGxlM0VObUJhK3JJQnJ2?=
 =?utf-8?B?Yk1vNVlVOG9nYmlaL2JadzlvZUYvWHZybEYwdG1YRmF0ZTBWMzVnSFNITzJz?=
 =?utf-8?B?QjJ5RmZPd1BoSSs5MHdYV1o0Smw3aEJoUUxZVXNKNzYzODIzd0xLSG1DSzhM?=
 =?utf-8?B?WUZWbXI0b3k3bGdDSW9sWnJtblNzbUFHNzQ1dXBCdUsydVdhSmdwNXBaZDhh?=
 =?utf-8?B?bVd1WDVYdXB4SGZqMXZHWlMxZTZmaGwvWkhGeDJiVHptZWVoaWxSRFN2Wisy?=
 =?utf-8?B?RVBnSzZIa2NSSEdnNUtZR1JmOE5YNER4YWZ0Qk1IWE9JREJ2YmhMWUFxRFBo?=
 =?utf-8?B?dWdEQlNwbTdsRGhuOEZwQ0F2YUdxZnRZZUZTWHkxZkFPcnc1SUFFbDRmdXBW?=
 =?utf-8?B?K21ReDNObkNFeHF5UTNjamRNaVV2TEx2RHRaeUZyajJmWXRLaVRKcDMyTml4?=
 =?utf-8?B?ZkRRajc1S3R4ZFlsTlZzTmV3OFRXdUtpTjhtUEdML2hmMmNqOWZDOENWR2dz?=
 =?utf-8?B?UkxqV1dGb1pHdDFxcjN2M0wzcUtjVW9PWlpUczlSa3Q2azhFZDVIa0RCK2Fk?=
 =?utf-8?B?WXJXZVlYamRFRHo3WXJNKzBpQ3pQVTMxK3lRYVUwUVhidGo5aXptUFJrclRz?=
 =?utf-8?B?WDFPUmlkR2w2ZGNGZTBiZUpvSGxJZDdSOWZQeUlJMGpld1hBT1JJaUFCejF6?=
 =?utf-8?B?LzB1K1Y0ZThxOFB3cnRMaDJETW0xUEtWZHFVR0srR1VTWGtWY0NWWGszTnlT?=
 =?utf-8?B?UGNDMi90aGtqQktQeWozSEJTV3VNeGdNa0RoNlpOMkFZUzdoMXUzZitoeHAw?=
 =?utf-8?B?NUZraHNOSzlXOFM1UjFBQ1djSHdTTzVDZHR0SVNMR0VlWEx2MURndVozRk1v?=
 =?utf-8?B?ck96Y3lGNzFqRlNnWmZYeUZCbElDZ2dXYUZpbi9YYjR1U3lBWkJZNnJqQUlz?=
 =?utf-8?B?d2pxSjVLakcxNEhUaGNlb0JkZjFuUVdxR0IvM2dFQVNaTUI5aWpmUnBGUjFU?=
 =?utf-8?B?MDVtaG5uLzRzbFVWb0NHeVBPKzBLNG92Z29vN2tNM3g0TnZnNWUwQ3B6WnFv?=
 =?utf-8?B?WS8walFLTys4VkpVSW1JQUFsbWliWEZBenlzNUJKaUpKVWVGVEh4bC9iU1lN?=
 =?utf-8?B?ZWZNM2ZNUUFkNGZpSFBQQ1FLMG9EejhDYWg0K3NReEdGV3FzQnZTVm9YdU0x?=
 =?utf-8?B?dFRQcTIwODJvR3ZwZCtJM2FHZEZESENpZ2VhV01EUmEreUpjekZVaG4rWWg0?=
 =?utf-8?B?NGpVMWZyb1hVblg0NDhEVGJINlhvTHo2aDc4bXRLM0JGUFlpQktNRzNGck1s?=
 =?utf-8?B?dTcydEJUaW56N3k4V0pwZFlNRSsyeExHZndoSjE1eUt5V3N4R1ptckQ0Z1lq?=
 =?utf-8?B?cDdraGRESHdJVCtsWkM5VXFTYkhmTU4zcHh1SWhSTTBaamlKTDJiMmlpTkZp?=
 =?utf-8?B?bkJCNGtoMDZlV3I0TlJuWVo0ejl2SklqM29ZdzBCTDZaajRyeXgwdkRTQ3gw?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6f1581-dd8e-4460-9c61-08dab2265fc4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 23:05:11.3443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0DPUZjns8YvG8RVHjBSz7xYZDopCN2MqmN0SHTPt/MSLNnMrvy1CmeTuqQihQ9EgW/K7QdLEe3HH5Rp2CYhF/UuSORT6ylieBa4TFRzbAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5349
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


On 10/19/2022 2:12 PM, Belgaumkar, Vinay wrote:
>
> On 10/19/2022 12:40 AM, Tvrtko Ursulin wrote:
>>
>> On 18/10/2022 23:15, Vinay Belgaumkar wrote:
>>> Waitboost (when SLPC is enabled) results in a H2G message. This can 
>>> result
>>> in thousands of messages during a stress test and fill up an already 
>>> full
>>> CTB. There is no need to request for RP0 if GuC is already 
>>> requesting the
>>> same.
>>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_rps.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c 
>>> b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> index fc23c562d9b2..a20ae4fceac8 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> @@ -1005,13 +1005,20 @@ void intel_rps_dec_waiters(struct intel_rps 
>>> *rps)
>>>   void intel_rps_boost(struct i915_request *rq)
>>>   {
>>>       struct intel_guc_slpc *slpc;
>>> +    struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>>         if (i915_request_signaled(rq) || 
>>> i915_request_has_waitboost(rq))
>>>           return;
>>>   +    /* If GuC is already requesting RP0, skip */
>>> +    if (rps_uses_slpc(rps)) {
>>> +        slpc = rps_to_slpc(rps);
>>> +        if (intel_rps_get_requested_frequency(rps) == slpc->rp0_freq)
> One correction here is this should be slpc->boost_freq.
>>> +            return;
>>> +    }
>>> +
>>
>> Feels a little bit like a layering violation. Wait boost reference 
>> counts and request markings will changed based on asynchronous state 
>> - a mmio read.
>>
>> Also, a little below we have this:
>>
>> """
>>     /* Serializes with i915_request_retire() */
>>     if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>>         struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>
>>         if (rps_uses_slpc(rps)) {
>>             slpc = rps_to_slpc(rps);
>>
>>             /* Return if old value is non zero */
>>             if (!atomic_fetch_inc(&slpc->num_waiters))
>>
>> ***>>>> Wouldn't it skip doing anything here already? <<<<***
> It will skip only if boost is already happening. This patch is trying 
> to prevent even that first one if possible.
>>
>>                 schedule_work(&slpc->boost_work);
>>
>>             return;
>>         }
>>
>>         if (atomic_fetch_inc(&rps->num_waiters))
>>             return;
>> """
>>
>> But I wonder if this is not a layering violation already. Looks like 
>> one for me at the moment. And as it happens there is an ongoing debug 
>> of clvk slowness where I was a bit puzzled by the lack of "boost 
>> fence" in trace_printk logs - but now I see how that happens. Does 
>> not feel right to me that we lose that tracing with SLPC.
> Agreed. Will add the trace to the SLPC case as well.  However, the 
> question is what does that trace indicate? Even in the host case, we 
> log the trace, but may skip the actual boost as the req is already 
> matching boost freq. IMO, we should log the trace only when we 
> actually decide to boost.
On second thoughts, that trace only tracks the boost fence, which is set 
in this case. So, might be ok to have it regardless. We count the 
num_boosts anyways if we ever wanted to know how many of those actually 
went on to boost the freq.
>>
>> So in general - why the correct approach wouldn't be to solve this in 
>> the worker - which perhaps should fork to slpc specific branch and do 
>> the consolidations/skips based on mmio reads in there?
>
> sure, I can move the mmio read to the SLPC worker thread.
>
> Thanks,
>
> Vinay.
>
>>
>> Regards,
>>
>> Tvrtko
>>
>>>       /* Serializes with i915_request_retire() */
>>>       if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>>> -        struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>>             if (rps_uses_slpc(rps)) {
>>>               slpc = rps_to_slpc(rps);
