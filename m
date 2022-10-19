Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C766051CB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 23:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D0810E09C;
	Wed, 19 Oct 2022 21:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5227C10E0AB;
 Wed, 19 Oct 2022 21:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666213931; x=1697749931;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cxUFR00bWlOyq3utjMBJWZlh5HlUb9DrAk3gwxVhlOk=;
 b=mFb57vODh30Zp1offHfDokW2P/O0ZB0xIQg9DD7hNAC/SWZKFbteO96n
 KPnunjh1iL5KVsP4a5WAxHoqF8aV0uSf/HMKWfkhrcEI3j6zzVdWoYv7q
 lgz5cGrHGTVkqyCJR3USwFyEUmI1q91m7mngT4gZQ+E4HGOp213hQjZlY
 dFG+TdJY5FWc0aUS9myZy0GVubny5iFyuOsI7OyJgK5Q2lLcHqKJOLH86
 XT4Q7pLIOEGfAcBJBC7J70otxBQ0vw208yoUplsR8asEY+HC3HsW4uuN7
 BGVY+6m3mX7RqkZWo2/SSsdis6jWMgX4ltjhMW3YanQQ+ggsAspjTDKPz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="305266230"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="305266230"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 14:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="624312507"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="624312507"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 19 Oct 2022 14:12:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 14:12:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 14:12:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 14:12:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 14:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1HJt1K0YaZjyqP1EM7ffA9QpLUJu4UO9q3lHxWxGoHrL+YuZR7RjFSCB3vuecAj9moZwLynueo7FEiwd/WSQpFy9Ntim95+E8tTubyydl/mNorA/a/i/+s1JrrCkNLDtpbDGKz9gL/kG4jbvzE3yJ06iS2t7mew2mVGD9wlTTMTQ2SFCu2gfRYsSWg0LuBKagHZE7z7GUMoA7GIPL6RTUb3UejY7jjLarsLQoxS9OaJ8rtTPK3Sif2IMyf5OgspiZd/xJIUBZDRPpbqyp1nkLc/ZHaqLyY88WQ9f4opJGybqJCDqUMWujU3GuCu9LKUP3riVQAjRxFbnQIklEyw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cieR85Taq0qbaPtlkDyd72z67QY7oxc9kDbKnzeQs+U=;
 b=cifOeTgm8W7WuP3LAENXl2zqGfVvahxPcQTnD9e5dgC/vJSpnnu8AQyKFe6Lyb4F1FJEX5Uru/mLHvLqnObfiV/K2lPvncyiHt/pj43b0ZxX4Q9/FD3bmhhLlPQ8VwW3qvQBG6HGNJfWr3OgOCof+EGgaDuTAV0Pe9LjIdbA28oLVe506xGnj6bhWiHugv+dmT+ZzFUkEq3SJ0vFllVGS2MwZh1BIYfcplh3LQ8gO0vncpMZEFEDaow/z9LV59pCXiHPWt9/YntOq3sXXhxAgIrcM3AprQuY/oHm/rsk36myTGLwsh393nBiG47Dg4aIAvHk2sLC7l85hWyQ++QGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 21:12:07 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 21:12:06 +0000
Message-ID: <4fa5bd14-f891-3909-68c5-3b6b43ca27d1@intel.com>
Date: Wed, 19 Oct 2022 14:12:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20221018221546.17852-1-vinay.belgaumkar@intel.com>
 <c46f4714-7c12-c331-ec4f-ab52a7c499cf@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <c46f4714-7c12-c331-ec4f-ab52a7c499cf@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::28) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: be17fc3a-ffca-416f-1aab-08dab21693e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /YUxqAjRWJAYhLnAOu9y+vvbaRKXmORHY+X8dWUPKjILkbk13eSdxq+wvWzo1GtFcc2YfbLjPMiUhwgXHVL7vjONDE08uVmjkv6lmV/tZvhezuntt9RkMZwF4P1y5zNMc/cGyQ00bfr70nzhhb0jWp2n/Nv8J2Ss05oZbMq9+FcCQn+RkG8q5nWjn01kSlZG21NxBlAChAjBYASAadA99FZFnD/ij1mJvZoHJsIOLekopINTw9z2odxOusHUu52bW6hsOutEhL5wu35VamFd2mwH3i/HodZS19Ld++0Gb0pSFBR818k9Ly6EpR2ukDAJcqhHoM/UCR9nbKAW2DNwlNLMV0i047lsT9P8X7Ik+tiZAEgltt4sj7o5D1bHBYE0vef0S64SgeRjnzX//0yhhxkYzDXNBppkbPE9VOz1FI8u+Un0lSrf8q0pjahSLefblotinjcXJAQnCUJthyhkHNaz+eG8HXU/OvXrVl3znmdCRKUxF3lT9mhCew6UeN9Q3XH6g7RZfXnvU4znGImFvNJdMmW3Axn3xkg+lHmuvRMzCuzMWwgyTVswKTuo1EY7FUoBVZ57OPfb3W9K/n2gxo/hiTXzTdI/HEo+kIO29go+izBMENgrKDbHbXljNAi3X1QrKHy+6VJgygDZUH/e6/KbUOjahnhnjzzrWV825wDESzy7lrsLg9aPBP5DULIpPxVo+uVtT5/1a+nZOPE1NLT9s4lPk6J8UyeBMR338TWVJeFUWiNVjUgZNdtyf2M/kGNN0NTByb6ZEgB+qdkQ8AmHKlURrX2y+ddoLaC0HWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(36756003)(31686004)(186003)(82960400001)(38100700002)(86362001)(83380400001)(2616005)(8676002)(26005)(6512007)(6506007)(66476007)(478600001)(6486002)(31696002)(316002)(66556008)(66946007)(2906002)(53546011)(5660300002)(41300700001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGF3a3FaRnZteFlxUVVGaGFadzRWa3Nib213Y0h1RVJJejdFS1htYnk1S2xh?=
 =?utf-8?B?TWlXZmFWN01vc2QwRy9ML3IwenhKRkZwdzZna1orUkF3STJTeThablBBUzVi?=
 =?utf-8?B?Mm9qYVk3MGRsR3hEdG5WekdOckNBTFFxZExXck8yR2VrWS9Vd0RGbWtFM1Uz?=
 =?utf-8?B?QXRQRGRjSnpWOTZMZURtRTRQcHZSTk5sanI0NXdWYTlOY1lLQnYxcndPcmI0?=
 =?utf-8?B?K2VibmZnQ3VXa2VzV2Y3MGNpUHpaeitHOTVTVTNyTzNtRjUwbm5VUlJKZ2Yw?=
 =?utf-8?B?UXUweXZtbG5YODFPaitMTjdqM0UyYUFGK3MxeS85V0RpU2lPOEJsdHd0TkQ3?=
 =?utf-8?B?S1o2YU83UVN0SWhIRGdlZVIranZWTlppOXJvRFk3WjdRbEpNYjZpbFE0ZWc2?=
 =?utf-8?B?WnVTeUh0UldlQ2EvTzczbmtGakF1cWZ5czdUeVd1Z2ZtZU9ZbGxRM1RNR0R4?=
 =?utf-8?B?bG52MU5oak1jWFFHRkY0clFhdE9MYWVFM3FtTnh3RU83a0YxV0o4dU5lQXZB?=
 =?utf-8?B?bUZBMnZERDl5OWgvQXVHdnh5TmNBNXhydFFvTjVmdGZ3Sk5DS0luU1dDSDJo?=
 =?utf-8?B?NVhsbVA2aElWQVlFdmRQaTFweDNEUFY3NHJybEVMaGZCUXVVNXozT2NvczRu?=
 =?utf-8?B?Q3JjWm1qR0JDdmgwdlI2cWM1ZUkvbTNmZzZxN1lVL3YyOHNkSkFBTUR4L3lQ?=
 =?utf-8?B?WmljS3BZcGVLR0lrM3laNEh6UC9KRW93cm16RmgwdjQ0U1BpbC9VclczWE9M?=
 =?utf-8?B?UCtKNEFUamZ1eWlpcE5vVFFPQ2RReHZmNmVFSkxSVHBRL04zcldWTXlnL1J2?=
 =?utf-8?B?NDFHM1lLMWVONmNvcDk4UmRaL3RrcVF2M1ZMUnJKU25LT09mM0dRSHQ5aktP?=
 =?utf-8?B?VmRwS0Q0ZlR2RDV2c1I1R2hRcmJtOCtIL1VWYkxUUGNqTmcrQlBFYUF1bERW?=
 =?utf-8?B?NkRUU2Roc05wRk4xMGcwWi9vcUk4bkJmY3g4ejNyNExyVGRlS2VFZk5MdElF?=
 =?utf-8?B?OVJCK2RnMjdkVTlBTXhQUEE3NEp0ajJrMThzUVRaY0I3dUJZbzhoU2ljYUNa?=
 =?utf-8?B?Z2dGeXZKc3FrR0JRMzVxMmIraHVnTWZWdmxmWjRpMUhkdmhyaW01bk9MNUoz?=
 =?utf-8?B?NFZXWjVBVXUrZUlYUjQrb05URXhENzdvMnBhM0JQR29nMytLSnNDS2pBMGIv?=
 =?utf-8?B?QnVsK1BhY2FBYlErN3c2dVR4eUpXOEMxS05SeVN5RlRqVGdxV2R6bFUyeHUz?=
 =?utf-8?B?dmFOWVUxeWNPc2Nvek5pb0Y5aEt4SFJrTk9mOUZSU01kMU1TdFpCZFJ6Ty94?=
 =?utf-8?B?c3F6WDdyQUhhazFycHZJN0dCdlM5R3gxN3Mza3VqcGphbFJyOHljVHdodVI0?=
 =?utf-8?B?cDJjSllCYkIvM1BrNHNsK3pnUXJjQ3h5MW1HNlkzVE1ORGJRZFFDaDhacXlH?=
 =?utf-8?B?N1FKdDVOS0NXWjBGT25qN0xxQUEvWjdvMkRzY2kwelQyNFFVUGYvZG1PK3ZY?=
 =?utf-8?B?ek4rYW82a3VqY3M5TVdnUm5uWitUN09QaENQdlppVjZzUzNDR3hmQjV1VU16?=
 =?utf-8?B?bElHYkxhY1RjWVEzREFzUWtnYytXME00RjNyK2JpQUFFcWFWRnNrdEhUM3FO?=
 =?utf-8?B?TVVOczZqeXpuek00WXkrWEZGNjRoNnpkZHF6SDI1NnZOcHlweHNTMnEwclVk?=
 =?utf-8?B?L04rSmJkeTBPYnpieUo1VUhTMTZOR1JGdjFvMjNaVzBkVWlmNHZXNG8wNkhv?=
 =?utf-8?B?M2tjNEViajFCZU9VNzlqayswcFIwUXM5TTc4bHgvNUJsMTB2MmhTZFRUbXJZ?=
 =?utf-8?B?NUZiQ2l5SGVqSFdoY1ltdGNScXZMSGVqK1dqc2w3TlowN29Bb2JZMnFFWDU1?=
 =?utf-8?B?OWdMVmswb081NmNpcjFGV21iRUxGUjRlbEtScmZhZVlWQ0MvZmFCK1dnNHd1?=
 =?utf-8?B?amhpYzZIM0FMUnV0ZzN2SHdyekFEcmVHTHNscWFJdGx4MU85blR1MEszVHhN?=
 =?utf-8?B?VGU2M0l3RnBrQnhDMnVkMVFtRjVHTWIrcEZ2Q2pSeVlKRDE0cm5ud08wYktx?=
 =?utf-8?B?bHZLY0pWRHJ0WVJudHZrbkxpc00rdmk1Wm9zYU01ZWhsMFJZQ2dTTHdzbytr?=
 =?utf-8?B?U0NSMFJwWWNMY1dpYUhtQXNhdHY1OW01OUN1VVFVWHhZOEN2b3pKb1lGaHgx?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be17fc3a-ffca-416f-1aab-08dab21693e3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 21:12:06.9005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALeaRZOrXPbuFYkWvagpH8e/XrWPjQ+/hJlb2wVuScuOhrvl7eWdSsIo23eLQM0pSVD+k3/htWy4D/oiH/p2V5ziHfvJeQfj9Nz+HsFJsF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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


On 10/19/2022 12:40 AM, Tvrtko Ursulin wrote:
>
> On 18/10/2022 23:15, Vinay Belgaumkar wrote:
>> Waitboost (when SLPC is enabled) results in a H2G message. This can 
>> result
>> in thousands of messages during a stress test and fill up an already 
>> full
>> CTB. There is no need to request for RP0 if GuC is already requesting 
>> the
>> same.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c 
>> b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index fc23c562d9b2..a20ae4fceac8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -1005,13 +1005,20 @@ void intel_rps_dec_waiters(struct intel_rps 
>> *rps)
>>   void intel_rps_boost(struct i915_request *rq)
>>   {
>>       struct intel_guc_slpc *slpc;
>> +    struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>         if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
>>           return;
>>   +    /* If GuC is already requesting RP0, skip */
>> +    if (rps_uses_slpc(rps)) {
>> +        slpc = rps_to_slpc(rps);
>> +        if (intel_rps_get_requested_frequency(rps) == slpc->rp0_freq)
One correction here is this should be slpc->boost_freq.
>> +            return;
>> +    }
>> +
>
> Feels a little bit like a layering violation. Wait boost reference 
> counts and request markings will changed based on asynchronous state - 
> a mmio read.
>
> Also, a little below we have this:
>
> """
>     /* Serializes with i915_request_retire() */
>     if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>         struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>
>         if (rps_uses_slpc(rps)) {
>             slpc = rps_to_slpc(rps);
>
>             /* Return if old value is non zero */
>             if (!atomic_fetch_inc(&slpc->num_waiters))
>
> ***>>>> Wouldn't it skip doing anything here already? <<<<***
It will skip only if boost is already happening. This patch is trying to 
prevent even that first one if possible.
>
>                 schedule_work(&slpc->boost_work);
>
>             return;
>         }
>
>         if (atomic_fetch_inc(&rps->num_waiters))
>             return;
> """
>
> But I wonder if this is not a layering violation already. Looks like 
> one for me at the moment. And as it happens there is an ongoing debug 
> of clvk slowness where I was a bit puzzled by the lack of "boost 
> fence" in trace_printk logs - but now I see how that happens. Does not 
> feel right to me that we lose that tracing with SLPC.
Agreed. Will add the trace to the SLPC case as well.  However, the 
question is what does that trace indicate? Even in the host case, we log 
the trace, but may skip the actual boost as the req is already matching 
boost freq. IMO, we should log the trace only when we actually decide to 
boost.
>
> So in general - why the correct approach wouldn't be to solve this in 
> the worker - which perhaps should fork to slpc specific branch and do 
> the consolidations/skips based on mmio reads in there?

sure, I can move the mmio read to the SLPC worker thread.

Thanks,

Vinay.

>
> Regards,
>
> Tvrtko
>
>>       /* Serializes with i915_request_retire() */
>>       if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>> -        struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>             if (rps_uses_slpc(rps)) {
>>               slpc = rps_to_slpc(rps);
