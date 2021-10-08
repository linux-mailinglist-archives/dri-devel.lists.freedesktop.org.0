Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA26426F77
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3976E0F6;
	Fri,  8 Oct 2021 17:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5B66E0EF;
 Fri,  8 Oct 2021 17:20:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="226454123"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="226454123"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 10:20:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="561382319"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Oct 2021 10:20:22 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 10:20:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 8 Oct 2021 10:20:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 8 Oct 2021 10:20:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOKM/OGA7IQDbGlTDaWt0uUmoOfyGo+cMNaIrk/cLYDzEcsZE1jyNKZKRCMkl+R2PRN/WEGtVTnFRKwrRMLhAcZHedTovKeRM5yrOLg1P9/K0/BWRS6Ymh2Cs9biCXPOuT29bVlsPPa4C0TXNT5dQCaSSiXtu/LlZMqPTVw+51OjkmUSbw56APbPjrVShwtPX2Se0UviyLkFjAXznv5A1zHToHdA9Ns4bdSqum7e3pKz6I1wlbHE163VYnbI7ulO4Xz3wc3/a3ONYQ31DwpqBcqWzNnaPjFGLamwdqq8uUvKa9VyJPGAGB7xyaZp+Agt7tIEIW3H9wIZkQt7JeACfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ucjJsZOptSS76cStEuJmuaIHzUxYM4catRaYsOcLH8=;
 b=fwPsOH6StwTKSxEJ8q7KkurGzL6Z6JoLVGRZFLlPNxSg9Oa0fEZ2W4meWMVyvprh7S8X4vBx74Z3+EwyQDohUbxzj/dIP8WuvWHfz0M7wgzJOy9u/NHkbtq5C5Opzm9p9kGykdQIqxyJukuUXFgR+Gzl2LXPKbwF5wlPMDZPnIdRnwST0rzssl/ODajzV4v9hQfyujLTTVCO78xMA82endT0ZKYID1+2QdFFXVDKE/jWpzWdQX3wvY1p1xR/1uEaRhvDtQEm+n4b4g1typ7KUdAf8YMaXzhhb88m9eo4YhbN0aE2pNGwEPwmd01D9bLNuVWt89TVJR2oMFXVO/XO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ucjJsZOptSS76cStEuJmuaIHzUxYM4catRaYsOcLH8=;
 b=wxjYKvFawdpPBgE0+L2IX0DFxhboKZE+9yrPs7k3zRmsZKw0FyMFoSJJgSaC0Vye50KLQrKIUSf3i/dGZ9Ol5F6oIA9iQdc/miUF1VHkinpil5cLJhs3S7lP2iAiPQjIXnlhWfZFhQWqUVyVQPTgqO1Gq+szcb1uCC00Pnpo/gk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5594.namprd11.prod.outlook.com (2603:10b6:510:e4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 17:20:20 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 17:20:20 +0000
Subject: Re: [Intel-gfx] [PATCH 08/26] drm/i915/guc: Add multi-lrc context
 registration
From: John Harrison <john.c.harrison@intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-9-matthew.brost@intel.com>
 <f03536a0-2ffe-ed40-041e-0f277960a60d@intel.com>
Message-ID: <0042b6c3-137d-83cf-dd48-eeffff61046a@intel.com>
Date: Fri, 8 Oct 2021 10:20:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <f03536a0-2ffe-ed40-041e-0f277960a60d@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MW2PR16CA0052.namprd16.prod.outlook.com
 (2603:10b6:907:1::29) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW2PR16CA0052.namprd16.prod.outlook.com (2603:10b6:907:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 8 Oct 2021 17:20:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52fd7722-c5ca-4b66-11f8-08d98a7fe7a4
X-MS-TrafficTypeDiagnostic: PH0PR11MB5594:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55940B03BF41AB7D4E283F06BDB29@PH0PR11MB5594.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3/T9WwYXIFYcFnAG4mhlFrfsaIdoDgvzaKw8ASpajHZU4FeMlWnbMluyfymjJYTYL7ThPnUSyNRgPmsH7kgrtzl+W80+ENGaWrCg1SzEjXJ4EKGZj9XYYnh+SOtJoe6sOa91XOJQ/Z1BruTT65Z4JOwg6HaHXsMGIrYHQDqPeRBnlavPLeorCzjyYOI8ksql3ad5olVRLtjFPOIdFKo7RAHjcMatvo0K301/7TQLSjx5f3yYZ9I7fDetwDEoB9sN6hBq5xU1vhENdys8/G3bDY39W/93P7qBSpxmNOg0L0E1wY58CSFP841tX5wUaUroWW6XGqm5gquDzHQ4Hf2zRcXOQudxzBh3sWVjA2dqZsro2mV9oI5oIVb0ql7DfR1+JnzTCIqLtMsmgUVQnp4EKdvhmylauAv50EbLx4v9dAF7qVyYZOEt7FlpUQUzHdlbvRU+RK7edljHKyXQPUNVmNNB7UPMHu9tOwDiHZ51/1j1skP4EY32+QCmhNS9ZHsWDvr/T87aOWsYUb6E3JB4sgQmot3V+JD9pXgeShw1g1hIOeph0isjNwhUuHxPLcotLEibT3aHBbk64i0ma0FUGBaTeUIf3YTwliwPh/jtjHfYzupzLZ7GC8vwxwUuBtuKkqW4ZnwTa2100Cy3PoAZ2GihaGRi2WuXFZoPQ+u7QNHuYn+geR+i3tgEEj3HtH7s9YePuV8nT8HE7P7TK0RJySV5UfJVAssMHDHiTQxc2ZKaoV5/UEtmatGKEbWgtzWU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(450100002)(4326008)(66476007)(36756003)(31686004)(8676002)(5660300002)(66556008)(66946007)(6666004)(316002)(8936002)(956004)(508600001)(107886003)(6486002)(53546011)(83380400001)(2906002)(2616005)(186003)(26005)(16576012)(31696002)(38100700002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzF1MkpKYTBOdHp3bStPaUN3Y1ExU3FVTlQ2SXRJeGo2MGovZ0wzT0JTa2Jk?=
 =?utf-8?B?ckhCalk3L1JHVzZYdGw3MnhXZ3lla0Z2WExoNTNiMjdoRytzZTJLSU0wQzF1?=
 =?utf-8?B?N3I1dXRQSnZRVXdtalQzY0RTcTFYUVhwMldmQmNQam01WUs3N3F6Y1hCT1Vr?=
 =?utf-8?B?VHh5NEV4M0h3ZDczWTdhaXhJQ2FGbU5UT0EvdFB6TEF3VzJzLzdMajQ5MzZi?=
 =?utf-8?B?SCt0VlkxOUlSdnlldmtlam5za2gwQUtaZFVyVklaNVVnR1Rwck5pVDl2eWx1?=
 =?utf-8?B?RUFjUHpaa2xkTEhiYjNJWlh6YUh2WDI3SkFUd0dQM21OVmttMitMNW52TjBt?=
 =?utf-8?B?dnhxbmpTZ2dvTXV1Njc5M0lRNHZrbHVlSitXTFN0OE8yUU00OVhpQ1FzKzVF?=
 =?utf-8?B?QkpZd3BobTMzRVhvNzJ0Q3JUSm10L3kzVXk2eG93djV1TS96bnFhMlVEeTg4?=
 =?utf-8?B?TGVZZE5JWXZ1NTlXUWRhUmxxUjAzV24xQThWWkE0RnBHckdoVStQRnIyTUJx?=
 =?utf-8?B?ZTRTNmMzRUxGS0psNkphbzN5Rmh4T0hQTFkxM25RRXF1K0ZINm9sQURsQWZq?=
 =?utf-8?B?NWlZVDZqWU82dXYyNkE0bnd1TjkybW44WkZLQVZwOXlEUGZ5UHJlQm83dGtr?=
 =?utf-8?B?a0xLQ3pmQjBtdHVYcWlQUTEyLzZBanc4MThSQzNYTUJyQ1QreTdqWGVYenhG?=
 =?utf-8?B?Q3BrQ21WY3dJSnVWVWFRQ2Qwek90Z256OFJrTjJOUFpLN1pkUUVKUDMzSVNo?=
 =?utf-8?B?a3VaQkJnQkFyN1B2aWFEZWdlbmZXbGtmRVZQTFBZUG9DZDB5Ky9wdDdBR08v?=
 =?utf-8?B?cWI2WWdkUmhCQnVTaTk2T1BzMUNnRHJYeExrUTdCRm1yOFNiOTFkNUhEQ3VZ?=
 =?utf-8?B?OGtPcGM0Tm91OGdLcWZ3cmJWR2NWV1R0WUg4M3QzV1hHaURvM1NOSmRxTVpm?=
 =?utf-8?B?Q0JYbmVTQnA5NmNMb1owSlVYWDFwdksweUV5UnR1akZiYmM1SVhqMm9nMUJj?=
 =?utf-8?B?eEZVNjFrZEptaFpucGNCZ1dSUnVmU09SdjJzVWZhNDFlZVZqOWJkN1c5MUx1?=
 =?utf-8?B?MWdSWEp2UFpGUXFvQjJWYlpUaU1GS1JjWWoyOXg3dTUxTjczakxUemxMbGJs?=
 =?utf-8?B?K1pUSEpaR1hIOU8yeWh1NWV2MCthUlZYNXpaSHMrWTJsb1FJVUN4Z09qaC9n?=
 =?utf-8?B?WVgzQU9EbHhFeExER0JZTS8zYWY0Zmc0eVBJSG5DYi9VWDdWalFBSURLRUw2?=
 =?utf-8?B?M1hKdDhnS1UyY0d0Vk50QmlDTStEeGlBaDdqYmxIQmUxWDlpVDJSWUplb2Mx?=
 =?utf-8?B?akZ1c296TEVQSWgvSlU4RVZoWVYxMXVwY1J1UEpKY3N1d0hEcXhJekcxaTVm?=
 =?utf-8?B?ek5kWWJaNE1aS2s1SHBjNG11RFc4OHFWekFPM3pqS0IxK2RERW02ZTRaVFFu?=
 =?utf-8?B?U0VIaFdUaE1vbkF5YmtTNmI0TW1VYnRNTFJCMk1IQ2hSM0pvRzVJTTIzUmNq?=
 =?utf-8?B?VUlNVjVmc3dRdGlGWmo5YTF3Z1VlYWwxWjFoVEt0QU1MNURLd2NSQk41aS9u?=
 =?utf-8?B?NTVEWlU0S2VrTEpyeWI2SlNuQ3pnclZtL3RmbStkb2I4L1dTVmhHTytNRFlh?=
 =?utf-8?B?OE1GdDVJT2xEYnlWK2xCNVJmZ3lTTmhYR3g2cXlPMzhXL0FlZnh6UHd1aFRy?=
 =?utf-8?B?eTgveERMR2FONlBvZFRseXB0MGQza28wZUVpazVWMzcrZkVjVlc2UmtHNnI4?=
 =?utf-8?Q?9X/KfS/0pmAWPwkfLSbzNZBI+Up0YxwoxH70YUE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fd7722-c5ca-4b66-11f8-08d98a7fe7a4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 17:20:20.3097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4i7jSZ7rZxoGVff1RGrBG1dm0/k6rayQri6c4N6P7jdG8ejVOxxs+PCU+w/Zd4opEVlgdUWJl0LPEMdx2LBn2SRuHdL1Ni4S52ehztD0i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5594
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

On 10/7/2021 12:50, John Harrison wrote:
> On 10/4/2021 15:06, Matthew Brost wrote:
>> Add multi-lrc context registration H2G. In addition a workqueue and
>> process descriptor are setup during multi-lrc context registration as
>> these data structures are needed for multi-lrc submission.
>>
>> v2:
>>   (John Harrison)
>>    - Move GuC specific fields into sub-struct
>>    - Clean up WQ defines
>>    - Add comment explaining math to derive WQ / PD address
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  12 ++
>>   drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
>>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 -
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 114 +++++++++++++++++-
>>   5 files changed, 131 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_context_types.h
>> index 76dfca57cb45..48decb5ee954 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>> @@ -239,6 +239,18 @@ struct intel_context {
>>           struct intel_context *parent;
>>           /** @number_children: number of children if parent */
>>           u8 number_children;
>> +        /** @guc: GuC specific members for parallel submission */
>> +        struct {
>> +            /** @wqi_head: head pointer in work queue */
>> +            u16 wqi_head;
>> +            /** @wqi_tail: tail pointer in work queue */
>> +            u16 wqi_tail;
PS: As per comments on previous rev, something somewhere needs to 
explicitly state what WQI means. One suggestion was to do that here, 
ideally with maybe a brief description of what the queue is, how it is 
used, etc. Although probably it would be better kept in a GuC specific 
file. E.g. added to guc_fwif.h in patch #12.

John.

>> +            /**
>> +             * @parent_page: page in context state (ce->state) used
>> +             * by parent for work queue, process descriptor
>> +             */
>> +            u8 parent_page;
>> +        } guc;
>>       } parallel;
>>     #ifdef CONFIG_DRM_I915_SELFTEST
>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c 
>> b/drivers/gpu/drm/i915/gt/intel_lrc.c
>> index 3ef9eaf8c50e..57339d5c1fc8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>> @@ -942,6 +942,11 @@ __lrc_alloc_state(struct intel_context *ce, 
>> struct intel_engine_cs *engine)
>>           context_size += PAGE_SIZE;
>>       }
>>   +    if (intel_context_is_parent(ce) && 
>> intel_engine_uses_guc(engine)) {
>> +        ce->parallel.guc.parent_page = context_size / PAGE_SIZE;
>> +        context_size += PAGE_SIZE;
>> +    }
>> +
>>       obj = i915_gem_object_create_lmem(engine->i915, context_size,
>>                         I915_BO_ALLOC_PM_VOLATILE);
>>       if (IS_ERR(obj))
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> index 8ff582222aff..ba10bd374cee 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>> @@ -142,6 +142,7 @@ enum intel_guc_action {
>>       INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>>       INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>>       INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>> +    INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>       INTEL_GUC_ACTION_RESET_CLIENT = 0x5507,
>>       INTEL_GUC_ACTION_LIMIT
>>   };
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index fa4be13c8854..0eeb2a9feeed 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -52,8 +52,6 @@
>>     #define GUC_DOORBELL_INVALID        256
>>   -#define GUC_WQ_SIZE            (PAGE_SIZE * 2)
>> -
>>   /* Work queue item header definitions */
>>   #define WQ_STATUS_ACTIVE        1
>>   #define WQ_STATUS_SUSPENDED        2
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 451d9ae861a6..ab6d7fc1b0b1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -344,6 +344,45 @@ static inline struct i915_priolist 
>> *to_priolist(struct rb_node *rb)
>>       return rb_entry(rb, struct i915_priolist, node);
>>   }
>>   +/*
>> + * When using multi-lrc submission an extra page in the context 
>> state is
>> + * reserved for the process descriptor and work queue.
>> + *
>> + * The layout of this page is below:
>> + * 0                        guc_process_desc
>> + * ...                        unused
>> + * PAGE_SIZE / 2                work queue start
>> + * ...                        work queue
>> + * PAGE_SIZE - 1                work queue end
>> + */
>> +#define WQ_SIZE            (PAGE_SIZE / 2)
>> +#define WQ_OFFSET        (PAGE_SIZE - WQ_SIZE)
> I thought you were going with '#define PARENT_SCRATCH SIZE PAGE_SIZE' 
> and then using that everywhere else? Unless there is a fundamental 
> reason why the above must be exactly a page in size then I think the 
> size should be defined once and re-used rather than assumed in 
> multiple places (including in the description comment).
>
>> +static u32 __get_process_desc_offset(struct intel_context *ce)
>> +{
>> +    GEM_BUG_ON(!ce->parallel.guc.parent_page);
>> +
>> +    return ce->parallel.guc.parent_page * PAGE_SIZE;
>> +}
>> +
>> +static u32 __get_wq_offset(struct intel_context *ce)
>> +{
>> +    return __get_process_desc_offset(ce) + WQ_OFFSET;
>> +}
>> +
>> +static struct guc_process_desc *
>> +__get_process_desc(struct intel_context *ce)
>> +{
>> +    /*
>> +     * Need to subtract LRC_STATE_OFFSET here as the
>> +     * parallel.guc.parent_page is the offset into ce->state while
>> +     * ce->lrc_reg_reg is ce->state + LRC_STATE_OFFSET.
>> +     */
>> +    return (struct guc_process_desc *)
>> +        (ce->lrc_reg_state +
>> +         ((__get_process_desc_offset(ce) -
>> +           LRC_STATE_OFFSET) / sizeof(u32)));
>> +}
>> +
>>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, 
>> u32 index)
>>   {
>>       struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
>> @@ -1365,6 +1404,30 @@ static void unpin_guc_id(struct intel_guc 
>> *guc, struct intel_context *ce)
>>       spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>   }
>>   +static int __guc_action_register_multi_lrc(struct intel_guc *guc,
>> +                       struct intel_context *ce,
>> +                       u32 guc_id,
>> +                       u32 offset,
>> +                       bool loop)
>> +{
>> +    struct intel_context *child;
>> +    u32 action[4 + MAX_ENGINE_INSTANCE];
>> +    int len = 0;
>> +
>> +    GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
>> +
>> +    action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
>> +    action[len++] = guc_id;
>> +    action[len++] = ce->parallel.number_children + 1;
>> +    action[len++] = offset;
>> +    for_each_child(ce, child) {
>> +        offset += sizeof(struct guc_lrc_desc);
>> +        action[len++] = offset;
>> +    }
>> +
>> +    return guc_submission_send_busy_loop(guc, action, len, 0, loop);
>> +}
>> +
>>   static int __guc_action_register_context(struct intel_guc *guc,
>>                        u32 guc_id,
>>                        u32 offset,
>> @@ -1387,9 +1450,15 @@ static int register_context(struct 
>> intel_context *ce, bool loop)
>>           ce->guc_id.id * sizeof(struct guc_lrc_desc);
>>       int ret;
>>   +    GEM_BUG_ON(intel_context_is_child(ce));
>>       trace_intel_context_register(ce);
>>   -    ret = __guc_action_register_context(guc, ce->guc_id.id, 
>> offset, loop);
>> +    if (intel_context_is_parent(ce))
>> +        ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
>> +                              offset, loop);
>> +    else
>> +        ret = __guc_action_register_context(guc, ce->guc_id.id, offset,
>> +                            loop);
>>       if (likely(!ret)) {
>>           unsigned long flags;
>>   @@ -1418,6 +1487,7 @@ static int deregister_context(struct 
>> intel_context *ce, u32 guc_id)
>>   {
>>       struct intel_guc *guc = ce_to_guc(ce);
>>   +    GEM_BUG_ON(intel_context_is_child(ce));
>>       trace_intel_context_deregister(ce);
>>         return __guc_action_deregister_context(guc, guc_id);
>> @@ -1445,6 +1515,7 @@ static int guc_lrc_desc_pin(struct 
>> intel_context *ce, bool loop)
>>       struct guc_lrc_desc *desc;
>>       bool context_registered;
>>       intel_wakeref_t wakeref;
>> +    struct intel_context *child;
>>       int ret = 0;
>>         GEM_BUG_ON(!engine->mask);
>> @@ -1470,6 +1541,41 @@ static int guc_lrc_desc_pin(struct 
>> intel_context *ce, bool loop)
>>       desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>       guc_context_policy_init(engine, desc);
>>   +    /*
>> +     * Context is a parent, we need to register a process descriptor
>> +     * describing a work queue and register all child contexts.
>> +     */
> This was now meant to say 'If the context is a parent...'?
>
> John.
>
>> +    if (intel_context_is_parent(ce)) {
>> +        struct guc_process_desc *pdesc;
>> +
>> +        ce->parallel.guc.wqi_tail = 0;
>> +        ce->parallel.guc.wqi_head = 0;
>> +
>> +        desc->process_desc = i915_ggtt_offset(ce->state) +
>> +            __get_process_desc_offset(ce);
>> +        desc->wq_addr = i915_ggtt_offset(ce->state) +
>> +            __get_wq_offset(ce);
>> +        desc->wq_size = WQ_SIZE;
>> +
>> +        pdesc = __get_process_desc(ce);
>> +        memset(pdesc, 0, sizeof(*(pdesc)));
>> +        pdesc->stage_id = ce->guc_id.id;
>> +        pdesc->wq_base_addr = desc->wq_addr;
>> +        pdesc->wq_size_bytes = desc->wq_size;
>> +        pdesc->wq_status = WQ_STATUS_ACTIVE;
>> +
>> +        for_each_child(ce, child) {
>> +            desc = __get_lrc_desc(guc, child->guc_id.id);
>> +
>> +            desc->engine_class =
>> +                engine_class_to_guc_class(engine->class);
>> +            desc->hw_context_desc = child->lrc.lrca;
>> +            desc->priority = ce->guc_state.prio;
>> +            desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>> +            guc_context_policy_init(engine, desc);
>> +        }
>> +    }
>> +
>>       /*
>>        * The context_lookup xarray is used to determine if the hardware
>>        * context is currently registered. There are two cases in 
>> which it
>> @@ -2804,6 +2910,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 
>> desc_idx)
>>           return NULL;
>>       }
>>   +    if (unlikely(intel_context_is_child(ce))) {
>> +        drm_err(&guc_to_gt(guc)->i915->drm,
>> +            "Context is child, desc_idx %u", desc_idx);
>> +        return NULL;
>> +    }
>> +
>>       return ce;
>>   }
>

