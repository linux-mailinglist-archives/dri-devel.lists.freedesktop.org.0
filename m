Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DEB6725A3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 18:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C907110E7CF;
	Wed, 18 Jan 2023 17:55:48 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DA410E7CF;
 Wed, 18 Jan 2023 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674064547; x=1705600547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UR+hnzOulDhuI99JoqlPJvuJQyF7RLXnav/HOEYcF8o=;
 b=ZbJbmZiRv6GWRT0gSOMwkKpPY4r7ZeDNfsS/tMZZYoYvIPxTlybrpL3d
 6mg0LKfDzmev8eWOAco+lLhDp5pP/2Uo0jmykv3lAruqyhHsQspqv/QHw
 0fHn4/aEm8zrZ1HM5pLoJU6YzdUg50LlnlS0O00gITshhVPZqy+OgISsb
 KlBMzscnVxd2NF/S4UDyTjr8YDQFwjYExoY3ah7aTdit/fFTHvbY44fjE
 geePhkeKTORgkz5a62Iqz2OY6E++aqJWk6P+7j8Wm5ZNGTLP0yPEu2ahJ
 PXrgKoQYWR6cR+Fevr4TEqNiVVbMbMzh0G2zwjajI61ipPG/rqmSm2I6m g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305428408"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="305428408"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 09:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728307375"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="728307375"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 09:55:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 09:55:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 09:55:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 09:55:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 09:55:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q92jUB5EWeIoeYvRK+isKJJLFQ38OSE9gnEmIL/aDcer7FRGqVV8nT2FUtYJRG2vy+Rycj4ZnkDnFuIE8OQrnqt5sP1hrTa79LUGiYK40Ynjv8KfLkCefeWahltvnIhDs+jSkAxBtJC4Ye2gUdjI8SBNIsrlehPr9vbjqhjw9zJ+kOpT3rKIeifinaIznNs551KFXmFXkv23L57ftZPpZhFHZACoY3zlZqJI8pQK7dlZE0kNJQSaNkiGvoDpfnj53NKQWI7Nroxyf3iuRrl2c3Y/8DIhyRd11SpjWFFucWBlHR3t6mVBgTe39K2zV/sUVsovuXn2WgxF1L8+zuMDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV6SsnGEg9+e03+pVH3BXf4JMmnWy/3CzhDMh2z4KHA=;
 b=B547BufSAxJZSij04fVSteyNRB7qfpGQw2DSs7tewLGekuxaouRgzxk1HsH4/tL2Davxnk/XfhKg88ZwvD8VX7B4g1qGItxAGTpbvMotaujVM1tvsjzQ9xsjo25tuY11wZ22302s1SfdOCHYra2p3JkkO3y7JQNeaF3ZxUD+yXPGgM1K9lczb14gbMv6i7m7REAQIiWZBn69L0SQ/2GWAmswCRlepa4l3d2p0wVOIvZBKZs08Kdm/gq5g4LnfmMF0WRVJ/F63CGKz0oN7+Sa/1PWexJVmNvJux5aRyLfO7zwjvzvse2Pm2etFpD8N/HzQcI0x4+U6FDi4VHUMqITow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN0PR11MB6087.namprd11.prod.outlook.com (2603:10b6:208:3cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 17:55:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 17:55:43 +0000
Message-ID: <b26a8817-7167-761d-9634-07d3af5e6e00@intel.com>
Date: Wed, 18 Jan 2023 09:55:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/5] drm/i915: Fix request locking during error capture
 & debugfs dump
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
 <20230117213630.2897570-2-John.C.Harrison@Intel.com>
 <f2c7519b-9a6b-e750-e64c-c1d38720391d@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f2c7519b-9a6b-e750-e64c-c1d38720391d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MN0PR11MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff4e049-3492-4a90-6484-08daf97d3846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bcvNlUJU7+5euFdLT9zYrIQHaJYhjn6e3Je0lI03IvsyUV4nXxsFZq+SiR9krrPNUTxR5nFWXTglrn/Fgaq5So4R1N7bTketWleA2ezYLcYbz9kPXt/X9anJ9oUMe+rRIdtWdcpYuhDSZc/dDMBwWOeNUkAXLhhVcbKBrcB3XK6BMriX6WZqAoQr/b4qK5fb+27s0HaETeTjZn8m+YHKh5Ul9jIPi/1vgBYwYGG0qNVmYxlsX9KZKDNC00QVAPlXFrV47K/qATMBLSXbWHiROHkl5ct0P8zznAPBe3Z1eMBZDE9iQFEbdZzAP9aRe0OHDVq7LiTRxd68gz4bdq2mg50WwteobCwuydw/wX8+gqi2t7ea9XCxcrHuigX4xEpoApzxjOrjye/ZUwZFiwz1bG5IpnoaMsY7dq7TUA0uzfJy2FlbVHe6ob8TCD7c0MkkABeFQSsByBZBqW6wW6T1HUsqsJnkIOLtAoj+sst1xc9GBLiFldgb5eoBOLfFoHBiS2pYdUl7E4JLtgJ2Bn692kR/Xd5ZbolyUZyWqRBVoecZK+mgojEvj18QhlAkjLPHe5b15Tcqgr7k95J7yHRscmkP5w8QxPXCxd4wlJk5MvxGVT19sATmoWavngGRX7+C6vm6ubWxa1YiDDPpSmh5mgkdFEZl58PM5gNqfGayidaixQK/KfR2eQ9K22i2P5qVQ8Pd1xeBjAg2RDwKs0x9t8ko5lypplErPvQ7Fp/ScSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199015)(36756003)(66946007)(6512007)(66556008)(31686004)(186003)(26005)(41300700001)(6486002)(478600001)(66476007)(6506007)(53546011)(2616005)(4326008)(8676002)(31696002)(2906002)(86362001)(83380400001)(66899015)(8936002)(316002)(82960400001)(38100700002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2JhZk0rUEJXU3RwZ0dKRzJMc01hdjlwc041ek41ZDJ3bEd5UjlLSnlMV3Fw?=
 =?utf-8?B?U2hPcFhkL3NtRVNPODBZeXp2VXgxNEdnbTc0bHgwYllaSFdTQ21QelFrT1V6?=
 =?utf-8?B?MEprSW9leWhqbXFFa0Y4Y1BURUd1RXFPMm13ZmQ4eU95ODY4UkEyUkVNVEhS?=
 =?utf-8?B?VTNVc0YxaFREZ1E5aStTcUJPZDVuUnRYVGRmRm1wQWpic1E2S0tRMDBZeU1X?=
 =?utf-8?B?anVuWDI4czNHaGo3N1EySmJ3cHBkUytXUUNnV25lUTFDWlhkU0pEaDVZY200?=
 =?utf-8?B?ZXkrZzdzOXhTQ0EwTEZaR3llMUt1T2Jrc1RTdGJkVktQbTBNcjFzNDIwdWtj?=
 =?utf-8?B?Qyt5T29EYnVzckFLTWtjV3JJbkJlV2tUa1FBcWdpdWVibUZUbWQ0cXErN1Jy?=
 =?utf-8?B?Q3Q2aGJBekRiTHA0eUNiS3BXT3NicENsNUVGallHY0ZtTWkvKzNIR0tWWDdu?=
 =?utf-8?B?Z0lURi9RcDgvODNQc0dkclMwWjBVTkxsSnVDMlAzOVAxeG8yUUZ1ZUMvdy9T?=
 =?utf-8?B?b1FibE4wN1BvNm8rNXZHYkU2c1hzSXNseWVtbHBQb3h6RG1HQURjdkVFQmtp?=
 =?utf-8?B?K3BXSUh0aS9ndW5PUGpJcytTYkNyVER3K3VYK2RmSVQxYmZwVnpwbVZsVWt3?=
 =?utf-8?B?SlJjd0x3WjlhK2VyYVo1bE9YeUZpS1U3ZEVTbFltTVNLZEN3aEF6Mjd3a1dX?=
 =?utf-8?B?R3Z2Y0JFYU5NUmkvYXBvMDNIS0pML1FRUXliNVJLM3gvOWRRM0hXMDFGZ3c2?=
 =?utf-8?B?MmsvRmRhNjJNYzY1WWQzV0FEZ3J1ZTVZTjJ5UUNhZHNuZ1Y3VjRYdTJWTDJl?=
 =?utf-8?B?aTB1YUlyTnBHWGdoOVhtbVpTaG45aEY4OGVpUEJpd1BUTjlMcHRrdlY4RExh?=
 =?utf-8?B?VkwvdURTU1BOVkN2VnJmSFJxVHNRdnJibm90RE83K3FUbHI3L0FTeXFlNlpI?=
 =?utf-8?B?Z3FJWGlKeWI2UXVHQ1YvWXFaeFYrdGRHRWJSZy9FOFh2ZlIzdEJuSnpoZTdh?=
 =?utf-8?B?SXNzQUhyYTN3ZjhHOThLM1NLcnRESUsvNTFKNUFvTGp1dlNXeHB1NU05bkR1?=
 =?utf-8?B?WnBEMzNVYXZieFloc3I2VXRwZ1NLTkJxNFEwS0JieDVOTnExVmNDVmc2elRS?=
 =?utf-8?B?MzVZR0ZaS05UMjdrM2wwUVV5cE9PSm5EQzYwTU0rV2ZpYXBvNmFoOFBzd1BT?=
 =?utf-8?B?em9LTWFONENFajU2emE4YXFBSlA2cy82Y2JLTXhyMWxmSmd2MVgzcTdxWkg1?=
 =?utf-8?B?cEF6Y25MS0tvTm5RMDdnUHNYU25OZndWVWkvMzAvWENOMUdiVVJadTFjTm0r?=
 =?utf-8?B?bXBTV3ZybGVqZmFXNlljVHZQZUtRTzZUbFlYblE4QmN2Yk9TZlZIbDlyUFhj?=
 =?utf-8?B?TlllOVpoOG9yV3JZRGFmT2ljaGZzUmFTMUdhZnBiWkJFQWZCM25KL0pnckc4?=
 =?utf-8?B?TWlZcENGRW83b3FqSTJrdmdaL3d3Y2hKQStYdWdma0ZQS2NTOTBWK0pIUW8z?=
 =?utf-8?B?OGh2bVBqSUN5ZkZwbmtLWWgxcERlNXl5ZmVCV2owcjFCNHEvV1dLNUJRZnlz?=
 =?utf-8?B?N09ZT25XZW1LWnpuNitSR1hESm5SL1JpVHNKNWgwOGlYZ1RTc3RLWHQ3Qyt3?=
 =?utf-8?B?NGVicGVyQ1Yrbk1JT1FJODZOZU1rMWxTdDNBMDBMVlpoSUJ2ZHBScTBoRzll?=
 =?utf-8?B?MHpadGtwK3JQYnVNanR2ZVZ6VDIyU2JwcHFiQVNha0Y3Q0h0WXJHeGphdDBZ?=
 =?utf-8?B?YUl4TFZMSEhiZXBXUHZiK1ViUjZHaGN1Mmg5UlJrakxkeU85b1JYR2FtWG9X?=
 =?utf-8?B?b2ZoZWlsRXRuNGM0K0toMWhDTGJVMjA5bnovWG11NS80Vzg5UngzZEdrM2R5?=
 =?utf-8?B?b2VqY3dDYW5GUXJRVDVPWlBQU0FFd3E1WkhPV3FycVc5ZlVObkcxUXJneXVM?=
 =?utf-8?B?SmpGOGthb2lIQ21DSUlUaCsxR3hhZWJYRDF5VHg2bTRXdFJSS25OZXcramhn?=
 =?utf-8?B?MHVyNWM0U2g0VG9vcU1KUWt5dWpXTVMxektSK0JaYnhvdjJSWHZVbDBMZHVs?=
 =?utf-8?B?TVNXNEs4d01kbTJaL05KY3JhMVg1N3hDZFpuSm9UOUpVMkpKSlBwNFJhMWUw?=
 =?utf-8?B?ZUY0SGZ0TTR0YzMxTXVIa1BwZ20raHdXMy9FUDAvcFNzYmJ3MjdKdFAraThi?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff4e049-3492-4a90-6484-08daf97d3846
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 17:55:43.7962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unJWs91ydzTErRoLzG6KQ4pUEtYiv2+9ZW2plqWWvOtPpWy2cIF0Gf3PTSBtD+IFrSglAv1LMfEhyKn80Wci/n7KpsJ5FOypfd2lJjHlBpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6087
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

On 1/18/2023 08:22, Tvrtko Ursulin wrote:
> On 17/01/2023 21:36, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When GuC support was added to error capture, the locking around the
>> request object was broken. Fix it up.
>>
>> The context based search manages the spinlocking around the search
>> internally. So it needs to grab the reference count internally as
>> well. The execlist only request based search relies on external
>> locking, so it needs an external reference count. So no change to that
>> code itself but the context version does change.
>>
>> The only other caller is the code for dumping engine state to debugfs.
>> That code wasn't previously getting an explicit reference at all as it
>> does everything while holding the execlist specific spinlock. So that
>> needs updaing as well as that spinlock doesn't help when using GuC
>> submission. Rather than trying to conditionally get/put depending on
>> submission model, just change it to always do the get/put.
>>
>> In addition, intel_guc_find_hung_context() was not acquiring the
>> correct spinlock before searching the request list. So fix that up too.
>>
>> Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full 
>> GPU reset
>> with GuC")
>> Fixes: 573ba126aef3 ("drm/i915/guc: Capture error state on context 
>> reset")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Michael Cheng <michael.cheng@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Bruce Chang <yu.bruce.chang@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_context.c           |  1 +
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  7 ++++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++++
>>   drivers/gpu/drm/i915/i915_gpu_error.c             |  5 ++---
>>   4 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c 
>> b/drivers/gpu/drm/i915/gt/intel_context.c
>> index e94365b08f1ef..df64cf1954c1d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>> @@ -552,6 +552,7 @@ struct i915_request 
>> *intel_context_find_active_request(struct intel_context *ce)
>>             active = rq;
>>       }
>> +    active = i915_request_get_rcu(active);
>>       spin_unlock_irqrestore(&parent->guc_state.lock, flags);
>>         return active;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 922f1bb22dc68..517d1fb7ae333 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -2236,10 +2236,13 @@ static void 
>> engine_dump_active_requests(struct intel_engine_cs *engine, struct d
>>       guc = intel_uc_uses_guc_submission(&engine->gt->uc);
>>       if (guc) {
>>           ce = intel_engine_get_hung_context(engine);
>> -        if (ce)
>> +        if (ce) {
>> +            /* This will reference count the request (if found) */
>>               hung_rq = intel_context_find_active_request(ce);
>> +        }
>>       } else {
>>           hung_rq = intel_engine_execlist_find_hung_request(engine);
>> +        hung_rq = i915_request_get_rcu(hung_rq);
>
> Looks like intel_engine_execlist_find_hung_request can return NULL 
> which i915_request_get_rcu will not handle.
Doh! That is correct.

>
> Maybe it would come up simpler if intel_context_find_active_request 
> wouldn't be getting the reference and then you can get one here at a 
> single place for both branches?
That would require moving the spinlock outside of 
intel_context_find_active_request so that it can be held while acquiring 
the request reference. And that means bleeding internal knowledge of 
which spinlock outside of the implementation and into the caller. As 
noted, the ideal would be extending the execlist implementation to do 
early tagging of the hung context/request at the point of hang 
detection. As opposed to rescanning the entire request list again at 
this point. And that will mean the lock being used inside 
'context_find_active' would be dependent upon GuC vs execlist backend. 
Which is an implementation detail we really should not be leaking out to 
the caller.

IMHO, it would be better to refactor engine_dump_active_requests() to 
acquire the sched_engine spinlock internally and only around the code 
which actually needs it (some of which is maybe execlist specific and 
not valid with GuC submission?). Certainly grabbing two independent 
spinlocks in a nested manner is not a good idea when there is no reason 
to do so.

John.

>
>>       }
>>         if (hung_rq)
>> @@ -2250,6 +2253,8 @@ static void engine_dump_active_requests(struct 
>> intel_engine_cs *engine, struct d
>>       else
>> intel_engine_dump_active_requests(&engine->sched_engine->requests,
>>                             hung_rq, m);
>> +    if (hung_rq)
>> +        i915_request_put(hung_rq);
>>   }
>>     void intel_engine_dump(struct intel_engine_cs *engine,
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b436dd7f12e42..3b34a82d692be 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -4820,6 +4820,8 @@ void intel_guc_find_hung_context(struct 
>> intel_engine_cs *engine)
>>         xa_lock_irqsave(&guc->context_lookup, flags);
>>       xa_for_each(&guc->context_lookup, index, ce) {
>> +        bool found;
>> +
>>           if (!kref_get_unless_zero(&ce->ref))
>>               continue;
>>   @@ -4836,10 +4838,18 @@ void intel_guc_find_hung_context(struct 
>> intel_engine_cs *engine)
>>                   goto next;
>>           }
>>   +        found = false;
>> +        spin_lock(&ce->guc_state.lock);
>>           list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
>>               if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
>>                   continue;
>>   +            found = true;
>> +            break;
>> +        }
>> +        spin_unlock(&ce->guc_state.lock);
>> +
>> +        if (found) {
>>               intel_engine_set_hung_context(engine, ce);
>>                 /* Can only cope with one hang at a time... */
>> @@ -4847,6 +4857,7 @@ void intel_guc_find_hung_context(struct 
>> intel_engine_cs *engine)
>>               xa_lock(&guc->context_lookup);
>>               goto done;
>>           }
>> +
>>   next:
>>           intel_context_put(ce);
>>           xa_lock(&guc->context_lookup);
>
> This hunk I have to leave for someone who know the GuC backend well.
>
> Regards,
>
> Tvrtko
>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 9d5d5a397b64e..4107a0dfcca7d 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1607,6 +1607,7 @@ capture_engine(struct intel_engine_cs *engine,
>>       ce = intel_engine_get_hung_context(engine);
>>       if (ce) {
>>           intel_engine_clear_hung_context(engine);
>> +        /* This will reference count the request (if found) */
>>           rq = intel_context_find_active_request(ce);
>>           if (!rq || !i915_request_started(rq))
>>               goto no_request_capture;
>> @@ -1618,13 +1619,11 @@ capture_engine(struct intel_engine_cs *engine,
>>           if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
>> spin_lock_irqsave(&engine->sched_engine->lock, flags);
>>               rq = intel_engine_execlist_find_hung_request(engine);
>> +            rq = i915_request_get_rcu(rq);
>> spin_unlock_irqrestore(&engine->sched_engine->lock,
>>                              flags);
>>           }
>>       }
>> -    if (rq)
>> -        rq = i915_request_get_rcu(rq);
>> -
>>       if (!rq)
>>           goto no_request_capture;

