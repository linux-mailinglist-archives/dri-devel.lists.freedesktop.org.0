Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5F578EC4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 02:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7290A113972;
	Tue, 19 Jul 2022 00:10:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EB1113972;
 Tue, 19 Jul 2022 00:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658189425; x=1689725425;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K+XAfksf/qhSINfSIiMrktGeq7NCNGrc5qCwaury3SE=;
 b=KdqV5i+0PpPt9E3teEVgefwi6VbTPOwgVUhWyNXtgHShHMT08GrBXLZy
 rSr/VHly4sGbI+KuJZ6/ROdIeT4MNu/lkouwjW11bJKU3B24oEX8ZErKz
 iUg1qP4NpKotz+9QXBVkGWpe2UGRapiIDT7m7z0xrFMON8mWW69EO7Jzs
 fpvc1+9iWgfPsOC2ZN3yy0rSx/FsmvbwfPLycEZT3KWp4Ti2po355pZRI
 G1NBQ/exY/YHyT04grVUkoBnOtavZR6MDezc28JiGa5atgdn6y6MrAQCa
 MYG7l3yg9RWSUSNEhnLlDri8lZWIYOzIcvEGIe6ZSZGN6+NFwMEydo08+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="372654352"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="372654352"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 17:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="601389346"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2022 17:10:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 18 Jul 2022 17:10:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 18 Jul 2022 17:10:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 17:09:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8PwHQ0D/ujeiF+QJPJsXea39pX5XtDCJOJb5YRthXdN0/DHlHV49AnwCzL3EV8qf7KIv2vcaNx3v6UpPNx2Cj06hYy/dsWJqw/Ng+r7lvXhjx9EcmIMP0F5wcrZCt/diAn/4yDeGLPL7WNwxoumNg3uYHpj4ybo/pBhNMPCUysPmjCfoOjO+Y93MxwNX627lIRTwxgMqbh45foe8VZDyV26ZlpdlvMhIb4Ya2OlLhuTWlJ3fV6ySIQsrLHrU/E4psLaP7nsz4gd9p02f155ctSt3W6B7Kpso5fKyzUyGcQS1OuLRAIqEOGpKhtuBN0F57w7/UlaT/hiTlNGLoBNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KofVorUMH3NIYkJ/CPP1weZOAM+prJOK8H1KW0I05s=;
 b=PCJSNE+fRCU3Ts8bD03OJ6uO5En8jlLEru7Ji6Gv/FrtnvreYngASM83fCrqiA3e+ZJyaoVahJM/LEyL6oaZUWamYKfQHAN+52anAFj78cchm8Pc+DxD7V5fUBvtTXJ0V/IxjMiOmeqnr00DrsBhLxwA+GMC53/c9b6bUdsYa2HbJdujSew1eQMncMo98f20bmp5RbNcyiKGbbp0ERYAJM+aXvWFMpTUwU/BMebIkUbu2dHmcOqQ1KMOFRnOTqucZW4Ca0q/D6KCQA/pfiK8yncPie0txOCyZEQB9+aLxSvPYK33al7IWIzhhNHhTMdaORIofti0GXOBEU9BFVZntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM5PR1101MB2266.namprd11.prod.outlook.com (2603:10b6:4:57::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Tue, 19 Jul
 2022 00:09:53 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 00:09:53 +0000
Message-ID: <4f14835e-300e-a1b7-bebb-8ecbb07ab682@intel.com>
Date: Mon, 18 Jul 2022 17:09:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 02/12] drm/i915/guc: Don't call ring_is_idle
 in GuC submission
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>, Matthew Brost <matthew.brost@intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-3-John.C.Harrison@Intel.com>
 <2f9959ae-40fe-f14d-8e70-e94f03237769@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2f9959ae-40fe-f14d-8e70-e94f03237769@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b089748-5666-4f9b-a51b-08da691b014b
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2266:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mb17Qx+pgAUgURksqqWFWYuTWPe06JsYr9oL8hG7oEuuTSWycO6V9utnwBclVP0oa//Dbrh0R41p8HXVif2GhFA5Yk5lsyEPgzZ8mlUmL57qH1Q5RZ+5MgTapudfwDs7LtLxAkwA1dBlV+iXTZzsEN+/dSqnEealVphqgrIWichNxLPTkKBk220KHYxXB0h994SubZ/7QhXML+V4wMCkxifEvhm7zh8BkUsrbSIWJ7QwyExAUNJqzXiOyr5QduArHGJ0OpTkCG3Q1JQ3LQyRbpuK3yn5wqbvc7/0LFFqlyP84pwj+tZhs2xOFEZwpneR3NL4Ay2yRPGEXAjyGJ6Uz8pIXZqUvhQKOVFpx4L1bi6WuJl76ivlGx7eNhTFAW8thEBroKXo/t9ylt/VxyKfnRDH3r0V8g7Px1jeZrjC7Xad6XztFrc48C1HW+oopbdE6t7g3bb09Q9Fm+Eh2P/OYdwgFo6YzY7D7tuLS2YvVq0q8pGfD2AonISezEEa8kgM0CqRdpHTFp8JlCG+Nv4J8dZmHI5JAkWlHR5xWhTKdMyDMDS8HaU03aRvkgjXe7qkuSzyXyrur8//A1HHM3UhuFZGu1seje0pcOyKTZgCA2PBcBVYMhrNk+PFTOfzFEmQPGmG+txPtJarBmDFxxwN93x+KlZtlqxF4Q1V8pqgEWtUTCCKcfpNum0AgCxKc7Mqg151US4P9eO+KlOHsB1A/gvKy17uFIsT9NzHm9AcO8PI4+/BpsGqikhh3Y6sTFdmQ0xftq8DRCncLrD6LdbuG8QxdmeTO34Hl/gwEr3Om3KdX2/4nHatG33niV6KQmq00yFUM+HwaSUj3Q9oc28nWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(346002)(376002)(396003)(136003)(38100700002)(86362001)(31696002)(36756003)(82960400001)(31686004)(2616005)(186003)(6506007)(478600001)(6512007)(6486002)(41300700001)(53546011)(110136005)(26005)(66556008)(66476007)(66946007)(316002)(2906002)(8936002)(6636002)(5660300002)(4326008)(8676002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2FFdFVScDFiUThIRWhybHlxY2o5RDlIbVBPcWQ1TitlYTZhUnZpSkVGRkhI?=
 =?utf-8?B?TjhLTmZ2ZklOMEdldGtxeWJiSHF0dS9HZzRPUkpwdmVyMWtiMUtuYW1SMTNj?=
 =?utf-8?B?U2lDd0ZqQURIb29Cd3NZWTlmK3gwRCt3SS9rK2NMbnRFTHNnYm1aWjd0THda?=
 =?utf-8?B?aW16QkdlTWExYmtzWTFheVdNYnZ6YkNZdVN2V3pzczYwd1NlU2N0WXNKa1Fx?=
 =?utf-8?B?SlVFWnQ3YWxkR1lZYnNRckpDZkNEUjlZZk9laHhRVm02anVOUjJaa0Znd2VE?=
 =?utf-8?B?WWJyVlFMZS9scitWWldWbW5LbGw4T2ZwamlBNW1mdUEyb20wNDd0aTRLU0pB?=
 =?utf-8?B?OG1nRktLc2R3NHRHUTc2N2xIUm5iaSswOS9oVHNKUyttbnRZYWtubzBoTjd5?=
 =?utf-8?B?Ujl5RnRyOG53ekNEL1dmR2R4OFhucWdXazVGU0ZqK3BMZmNGdjVBNkJVcGNp?=
 =?utf-8?B?Yk9lNXFhbFZCZE9iT1ZXYWVyOUFTQ3dlbk1FM3Q5aFRsK2t2U2hxNkd1YzZz?=
 =?utf-8?B?MU9NSmFVdS95cFdieHRTbUI2VnhlamFyR284T2dLMmFLVjk1Ny8vZEptdVh1?=
 =?utf-8?B?OGYwOHQveWcwTkVOKzVkaDJTRGxRWjJWd3VRK2dMcFdIOHZ6QlgzWUdDNERj?=
 =?utf-8?B?QTNyZEdIUGF4VEQ2bUJYMFN6d01rdXZqN1N4SlVNN2NjRmdqQU1DRUhCSXIy?=
 =?utf-8?B?dEVhNlk5aXdKYjUza0ZiblZQNUx2S3c3UXBPUGNpZ2FuZVhoRFdJVXUvWTJw?=
 =?utf-8?B?SGFlSFlnQ0d3dDJGMHNubUU1aElzTFZUZUFIUG9tU2tWTStYSW5LMFROT01E?=
 =?utf-8?B?VEtxTlB6dEJQS3JQK3gwQU1JbVB2NzkwRHVOQi8rby9oa2J5MVlxS3hKemE5?=
 =?utf-8?B?SDFWWmowTHlGVkdOUEdVQ29waEJHVXFTUWExeGxhdndBTk1NRnZyYWQwSHd0?=
 =?utf-8?B?ZDNKcmRFT1VaQkxEQmdVaHc1TWlGSmdsMXdiWmZQd0pKcHBURS9mWE5GTTIv?=
 =?utf-8?B?T0QwMWY1bzdrVFppQVlLTUFZSzFGUlM4elU3UytXdDJvTVUzR2R1d1E0L3Uv?=
 =?utf-8?B?ckZXSjFaNGNScXlLcXJQNzZCOE5Jd1RtcmZ1Ynk2ZXNtQ2NpdTNnT09RYlZq?=
 =?utf-8?B?dkFpQXZPK3lDZHk1VVFLTm4xQXNwR3ZNOEZHb3ZDNkdQYVF2TDhmVllVcmpO?=
 =?utf-8?B?QjNxSERGTXBYM2VvWVk2MXhaRmJOcEtJaUJLS3VRd05YVzNDc0JoSTJ6Umhv?=
 =?utf-8?B?eHJEMDBzMWhZNnllb0Q1ZTJ1QVRkWk9KK0FhbGJ4QWhMT0NBaiszNEdZN1pN?=
 =?utf-8?B?L0V0RkhwemZOd2l4ZEhpQk9IcHB4UW1IN2ZOaHV6cU1lVTlXQzYxVzVTQzRP?=
 =?utf-8?B?SlZGYUJKSDM0YkhmZ0VROHBDdWpUeWgwV2RZTmF2RHBuNWNydkZkMnp6WUE0?=
 =?utf-8?B?dFJUVXcrMVc1Yi9VbmF3VE5rZEY4NVBFRjB4aXY0L1JucjlpUFJuem9OSXRD?=
 =?utf-8?B?VFRjK3o0SVI0SlY5SXcxSWhCRDB5cHdTSWRBRXQ2OUQxNEhwOEdXbXZuQVZC?=
 =?utf-8?B?cjJNUVkrSlZhbjRRalVaL3NBd1pZRlRTZ0FUaWppSy8xYVF0UkhnUm1oSlNU?=
 =?utf-8?B?TXlsWG41Z2tEbXQvL29DS1pDcW1OYUVoTHRzL0JCNnMwMWU3UG8rR1hGLzdW?=
 =?utf-8?B?bkc0MUUwc2hVKzkvQXcrQXAwWVJkTDFDU01hZXI2LzluWGkrb2xLakk2Mkgy?=
 =?utf-8?B?dnVrQWI4UWZudGhTQmV4NDhuajFvSkQ1WlBNeTM4TVFzYVFqUWpzWngwR285?=
 =?utf-8?B?K1ZDbE5CL2pLdEkwWU0yc3pMb0Jzb3lodFY3L3pYOENxTFdSRFZPMXNacFRy?=
 =?utf-8?B?d1BhcDhLeWZXdlRQR1NVRzlhN242RjFVRXZKdUN0WWFuSUlMZENIRUcxck00?=
 =?utf-8?B?cUNVZU9JYjdrbkxnWG5Cb1NJN0R6UC9GaUtWU2lVWk0vTTNXYXJKU3I0dFd4?=
 =?utf-8?B?ZDladEtFZVUwOXN1QnBLR2t0MkUzcUNKQkltdTI1Z00xeVNXakJPTHRzR254?=
 =?utf-8?B?eWhWZk9kY2hOY1dKRXFuMXJDQjBRdWVlMVkxR1lOK1J2ak5ycmZLKzVKZ1Jw?=
 =?utf-8?B?bS9ndGpFQ2taRmxjcm5QcW9TMC9EV0NiOTNodFBFZy9GM2VwSVdQaXRyc1U0?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b089748-5666-4f9b-a51b-08da691b014b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 00:09:53.4520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXCo8d2PJNnE8074WNOh+T0XzHy/PQ9p9783DYi0EA8Tu6V8y2t+qP8Qg7qZFt7azGtl9lQLueSzZ8QixUmMqr1SwfR5UVyYWXJQ/tJj3ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2266
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

On 7/18/2022 05:26, Tvrtko Ursulin wrote:
>
> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>> From: Matthew Brost <matthew.brost@intel.com>
>>
>> The engine registers really shouldn't be touched during GuC submission
>> as the GuC owns the registers. Don't call ring_is_idle and tie
>
> Touch being just read and it is somehow harmful?
The registers are meaningless when GuC is controlling the submission. 
The i915 driver has no knowledge of what context is or is not executing 
on any given engine at any given time. So reading reading the ring 
registers is incorrect - it can lead to bad assumptions about what state 
the hardware is in.

>
>> intel_engine_is_idle strictly to the engine pm.
>
> Strictly seems wrong - it is just ring_is_idle check that is replaced 
> and not the whole implementation of intel_engine_is_idle.
>
>> Because intel_engine_is_idle tied to the engine pm, retire requests
>> before checking intel_engines_are_idle in gt_drop_caches, and lastly
> Why is re-ordering important? I at least can't understand it. I hope 
> it's not working around IGT failures.
If requests are physically completed but not retired then they will be 
holding unnecessary PM references. So we need to flush those out before 
checking for idle.

>
>> increase the timeout in gt_drop_caches for the intel_engines_are_idle
>> check.
>
> Same here - why?
@Matthew Brost - do you recall which particular tests were hitting an 
issue? I'm guessing gem_ctx_create? I believe that's the one that 
creates and destroys thousands of contexts. That is much slower with GuC 
(GuC communication required) than with execlists (i915 internal state 
change only).

John.



>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +++++++++++++
>>   drivers/gpu/drm/i915/i915_debugfs.c       |  6 +++---
>>   drivers/gpu/drm/i915/i915_drv.h           |  2 +-
>>   3 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 283870c659911..959a7c92e8f4d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -1602,6 +1602,9 @@ static bool ring_is_idle(struct intel_engine_cs 
>> *engine)
>>   {
>>       bool idle = true;
>>   +    /* GuC submission shouldn't access HEAD & TAIL via MMIO */
>> +    GEM_BUG_ON(intel_engine_uses_guc(engine));
>> +
>>       if (I915_SELFTEST_ONLY(!engine->mmio_base))
>>           return true;
>>   @@ -1668,6 +1671,16 @@ bool intel_engine_is_idle(struct 
>> intel_engine_cs *engine)
>>       if (!i915_sched_engine_is_empty(engine->sched_engine))
>>           return false;
>>   +    /*
>> +     * We shouldn't touch engine registers with GuC submission as 
>> the GuC
>> +     * owns the registers. Let's tie the idle to engine pm, at worst 
>> this
>> +     * function sometimes will falsely report non-idle when idle 
>> during the
>> +     * delay to retire requests or with virtual engines and a request
>> +     * running on another instance within the same class / submit mask.
>> +     */
>> +    if (intel_engine_uses_guc(engine))
>> +        return false;
>> +
>>       /* Ring stopped? */
>>       return ring_is_idle(engine);
>>   }
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>> b/drivers/gpu/drm/i915/i915_debugfs.c
>> index 94e5c29d2ee3a..ee5334840e9cb 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -654,13 +654,13 @@ gt_drop_caches(struct intel_gt *gt, u64 val)
>>   {
>>       int ret;
>>   +    if (val & DROP_RETIRE || val & DROP_RESET_ACTIVE)
>> +        intel_gt_retire_requests(gt);
>> +
>>       if (val & DROP_RESET_ACTIVE &&
>>           wait_for(intel_engines_are_idle(gt), 
>> I915_IDLE_ENGINES_TIMEOUT))
>>           intel_gt_set_wedged(gt);
>>   -    if (val & DROP_RETIRE)
>> -        intel_gt_retire_requests(gt);
>> -
>>       if (val & (DROP_IDLE | DROP_ACTIVE)) {
>>           ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>           if (ret)
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>> b/drivers/gpu/drm/i915/i915_drv.h
>> index c22f29c3faa0e..53c7474dde495 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -278,7 +278,7 @@ struct i915_gem_mm {
>>       u32 shrink_count;
>>   };
>>   -#define I915_IDLE_ENGINES_TIMEOUT (200) /* in ms */
>> +#define I915_IDLE_ENGINES_TIMEOUT (500) /* in ms */
>>     unsigned long i915_fence_context_timeout(const struct 
>> drm_i915_private *i915,
>>                        u64 context);

