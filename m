Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9050614FC8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 17:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4C410E109;
	Tue,  1 Nov 2022 16:56:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C08E10E109;
 Tue,  1 Nov 2022 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667321774; x=1698857774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzG6bbFXcKjVjm/yyTWJAxAUGQmN36W6XKY/Mj6WUiw=;
 b=juCteUmY3x5QMw1nf37rXymKYOAG309LeizGRdkrGPXghJcZlZ9nwNu2
 qpzL8i7Q/vJd0+WiagBid7oHmyHn0kmsKhGol3N4zJgQjW38J9JeaQ5ev
 gGVFjMeKHofuLx1XX80HXcmcLAgnURHPGAhtWH6KYXXKvrTRkoWUAaCdc
 s6+vmYALNDMuScGSNBvsywe6e9MQwfjhJXp10x1UJ6rfPqHobO7UZPr/5
 yj5SakC209+2zRUlX7r1x78dBzMj6HBAE33QTsouOLcGQscaRrHdqnoCH
 rpEmwqXN1soolsIUHNx+MDwc0qHmuYjuHVk+QZmDs7XTuTVZAobVb4hx2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="373401918"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="373401918"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 09:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="808963305"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="808963305"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 01 Nov 2022 09:56:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 09:56:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 09:56:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 09:56:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 09:56:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee0OMaslLEPRPaiOjdUyDauiqXSQZgmHj8x/gmosqPJBCzTegRGQM/vvlmQrBtsIIiH42TzqozMlN8y/11qp9VBNfb4zKuIFuPjj8gmqdYMSMpEDOF4j8Rf3/7h0UOx/AZPnrF8kGlVfTkPkCySbQkafEfT1ve+v1GL/Aq0hNJa7Iw4tX3TUWouBwTbIzj9DWLlESx7Pv+KzfCK77P470c/UQGNNIVPQxMXmpg8m+IeGJrxuKNLnAY+vSOWxV7vpkrCVtzxgPRx725/T//FXTw8zNiXgfxkuVrhTCAGuUmzHYK8f7cPYLpeycquQoXRN3I9Q43b4JnkEE1ZlB5Ywug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFyW+c6ZhfaYAm+I2vZIk8rOSTHA0o6dxR3+CYBXtyI=;
 b=WNtqxc0oqkAkDrvy1OVYJzXthwnAwJaCgg7ZXloqdxSVO9J833uLYqLoiddXjtMkZtQWiuEtSG9AIn6WM8HQ1/m7mUoLIumK6KP5ansDSWyIr2hLijAyjsJNVNAg8JsLjR65QOWwKzlVzWnp9afIP55plae5Y0um0Sev9bEN8QvrI2aWxVgqlHYyOC3uhCbc0qXvV8MtibVcA2ugGMayCKtciag3sGmUJ/+OpERlSq8RBWyJV5mFlCE8fN1VX7eMPZ6t6I6rOQAeVp98Jvru7u6b7g98Y1e6CWkfus2aZeQg4DfQuNNLajcFTMtZ9PCpdhd4nwKOYaT1oPzKu4tWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 16:56:04 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 16:56:04 +0000
Message-ID: <4eae646a-345b-40d7-1ac6-4de027ee1fd4@intel.com>
Date: Tue, 1 Nov 2022 09:56:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Don't deadlock busyness
 stats vs reset
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
 <20221028194649.1130223-3-John.C.Harrison@Intel.com>
 <56a6c98a-069c-77b0-d6c5-4575bc324075@linux.intel.com>
 <2e7cf7c4-76cb-5a69-8a61-7d1da3577060@linux.intel.com>
 <3f83f31f-28d4-5b68-3066-5a0b58e20e56@intel.com>
 <95404887-f886-078f-c644-635ada7d8bee@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <95404887-f886-078f-c644-635ada7d8bee@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH0PR11MB5265:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ba7140-6c45-42b2-e7bc-08dabc29f6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9O84ZEel/rJEj5slOc4p2eDmoyOL87io14eUMtV7YxmC+9+A1PdUq18W7w1m/FI4U/zhq51oitu6pX/9iuuCdHBun4D6F95ccuvR+4mnwfDdtgoIoqyCZ0QYGz1lBN7vKzTQ4/r7R3As5Ucv831Jv8OcWPk8CW9EvoymLQrqK8ScFgapKr3b9MFAMAcjOUNSJWuSuyNRdz5TUahAnL8dCr6rf9GdTMVNd9scDTKZHPMsGsS3o1csc4CmizYm5X+nILNkp8bHGCkYY1fWjwRi0QelNpo0+1+oWX/hAXgCek2e0nkWFgnKttEO5pfuLuvxui7pVlKLlu4gsdtIj80A4vHM/6xGhMuT7JlDQw465ho5Cw3NvF/SEuGvkMeWC4T2MvXpjjq4XDVUSs32GkTNknpgg0Cx6kL+qoQ/PEeuKNROixiSOiPBMFWoP6KZKjRFOXrSy/fLXojWc7eMjR+gHHkxeV8l1yYKt/QQD6G9Ts73qODeK5JlBMxtt3NT3Ay8mOLK6OHqIDMgsIJdLqV7jRWZHy7Onohy2lX6L3BGeQ87eEgSeRXTIiWjLEWW/GVrgEi0e8LHQCwxn0k/z3hAPgce81QqpVnNoSXrQOZqF/L0MbCHScoCbZyqAv2Srh6xlXRtvGx9bkr5p9z9j+SqATStBPIzyFpBL34HYVKljT4v8UvoDufw+v7JXfzLt9WSh7YXURSiPrk2azxbnXne0wQVG9EjsWkClWHBdbfUweGHDvWxaVAYJ1FQ6eMMEl/6jJU/zR2hMbjDihYFwIQq7fuswN3rqbGGY6l2qyKqIxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199015)(26005)(6512007)(2616005)(53546011)(478600001)(83380400001)(6506007)(186003)(2906002)(316002)(66556008)(66946007)(6486002)(66476007)(8936002)(8676002)(4326008)(5660300002)(41300700001)(31696002)(86362001)(36756003)(38100700002)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVZZOTY1L3d5TDREcU5DU3EyVlJGQ0xabVNYTytPQjl2bjFoLzJ6Mm8vYlJD?=
 =?utf-8?B?N1I0TVgwdnZEa29rWmxnMDdrRWVYMEtCM25tMEx6R2ZsV2NpQlczYzNGRkxM?=
 =?utf-8?B?S1RyR1FtU05wSnM3c2FrditPZ0ovdlorWFJLeGovWkxFWC9PSkRmNk92Nk9q?=
 =?utf-8?B?NWxXSFczTm1FV013dVZaL1QxU3Y4UGQvWWVLQ2hRRTFwb0U1S2dYYmUrTE0v?=
 =?utf-8?B?YTNBL1FFNUhPNWlnLzNOcHdodkdaTW1Zd0NQenE0N1FCSXoybGRBUmlHc1Vi?=
 =?utf-8?B?Y0g0VVJsdnZ2TlM0c0dZSGdZUWZqUUpXYzlyZnFwaHpEeUJhbmh3TGh1c1RW?=
 =?utf-8?B?QzZSTE5iWkVObzQ3UHdmVnhORkJ6Mk5QYTh6dW1NeTZ0WjgxbFp3SU40K29n?=
 =?utf-8?B?RXNpam9oVVZJZnhaWWpUSUIvZ1lsZ1VtYUJBMStlL29LVm9WVlN1L0p1bTlU?=
 =?utf-8?B?c3FkNnA1RGxwbDRaS1VETW9NYXo3cnZyMnNuUWpMNnpvN1VTcjRHWGx0UUc2?=
 =?utf-8?B?ZExYMzBPUVN5V08rT01qcU51YlphV3JIWi9GVEx2c0ZXdWVUTEY2ZjhRM1ZM?=
 =?utf-8?B?ajl3QmxnVkdFb0d6dnNremhXVUpjOVVVODJjWFJ6SFMvVzVuYkVHaVlxQVRG?=
 =?utf-8?B?NFlMSDluTFVvYkxwVkdLb09TMHJxU2pPNDM5RkU3ZHVvenNLVWw2eWNRZW5j?=
 =?utf-8?B?bWlZa3BvTFFEV2k2UGs0bWV5VXNlSG5ReE13eU50dmw3RGxwWkp1aDVCeVQw?=
 =?utf-8?B?eVpOMlRoWG5nRllYdkFyOUlLMXFEVjVjVXM3cG5TaklOdjhUbS96cWoyL0dG?=
 =?utf-8?B?SlVLMnRFazJITGxNZnY2WmpzOUp3SXBaVmgxajllQlNZbWpjT2NNRTJJY3Jv?=
 =?utf-8?B?YXpjbktUb0ZaN3E4R240dFY4ZFE5MVVEMzlmcTBCK0Fma29TamFPU1ZVUTA0?=
 =?utf-8?B?cktWTThyVjUvTDhSR0poS01RQVltN2NscENGSUFaQndQTTFHdENUQkNFTWRh?=
 =?utf-8?B?SjhtSGMrM1Uxc0o3OFc2NEZMQW9oYlZYWTh0dlZqWk1lemNMakFRbFJvZjdT?=
 =?utf-8?B?QlZJcU9FY3owSHVrYkFVQWQ1eDRrSG5QMkUyRngvNDJIL3k0SU1TVWFnU3FH?=
 =?utf-8?B?SFBvNXc5OXJ4YjQwTzNQZU9zSDFJOWVjQm95eUpiM3pMRHFHS3BPbXM0djNh?=
 =?utf-8?B?b2hnUk1IcmRBZzlKTjZvcDBucWx2b2JsaGxLL0czR0FQTmhzbjlKV3Fhb2ZH?=
 =?utf-8?B?dGhIWjZtWHJyVWdJRmd0azdSVnhlZjJpNU8ySlFIYUtpUVVMbkd4eDM0VHRD?=
 =?utf-8?B?eldmL1dWTXRURHNUM3g5Lzd6SzRsOGJGcnl0N0FJRzNkWUJCTEhrWWJKL2Zk?=
 =?utf-8?B?UmlWdlRQdktZY3I0UFk1MHJYQ0JlSUFPSDNhZEljTCtVODdUWlQzUWFYQmp1?=
 =?utf-8?B?SlhBa0RZZ3pFR2JFaFdORXBySUdsd1B3djRsRDFFSjVpenp3Vkw1WFVlR2VJ?=
 =?utf-8?B?UXN1MFI1ZWI0UlM0VG0vK3dSOHRZNVpXczcxRm9ybnVSellKN2dKdC9UOVVO?=
 =?utf-8?B?UFZoc3piKzA5U2ZtbnlTNEJ1dkdCK3hQRGh1MjVaSU9HbzQ1d1NISHpaSlJH?=
 =?utf-8?B?elJJZ0MrQVJRSTBwTUx2SWwvRlFVZzg0a083RUZQK2dBenFzaDQwQmZ0eVFM?=
 =?utf-8?B?emc5b0lDazR0Ri9UTFlISHM3VlFseThoTytKQWh3RkdhazB2ZEVnNmtGWWlo?=
 =?utf-8?B?N243cXNTM0JaaEo4eXZyNzZBcmpzRDRvWVhXYjhTRE91Qy9uSW1TREtqMW9v?=
 =?utf-8?B?Tjd2eUp6WFJsQzFMSlVkaE5sakVoN1NwblVOSEdrSlBkam9kK3dtQTllY3VK?=
 =?utf-8?B?bEV6bDRDajRROWtpQlM4YzZMZHBGcFB4S0R6R3ZqOHJMVEdLbkU2Q1F3bWFD?=
 =?utf-8?B?SEpkU3JpK3JOOGpaNEt4Y2kvWldkZUZpUlM0TzdxU0lkZVlGbitmbFpsWlFO?=
 =?utf-8?B?Wi85Uml4V1hUOWM2bW9lV3FOZGYxa1VBOE5EZGdMNUpHRUFJTEt3WEtHMVht?=
 =?utf-8?B?b3N4aTFSTzJPNzJXSm1QamhYcU5qV3k1NjB1UUNyNi9pajVITVFPdVdZTFVL?=
 =?utf-8?B?MFp2aHNjV3E2bW9Td2hyQjdvRk9nclh2QldWNWhodzNtOERlNkhqYVVWMUhL?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ba7140-6c45-42b2-e7bc-08dabc29f6bc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 16:56:04.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yW2LR2G8o+FgCSCYIDyiulfDUym+IoipTcRVNab/VN818zRDAhVxl7kW9r33/m13t/hvheU47hM3A3EkD7biXQvq/aa7cpWyV93UgHZBeFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
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

On 11/1/2022 02:58, Tvrtko Ursulin wrote:
> On 31/10/2022 18:30, John Harrison wrote:
>> On 10/31/2022 05:51, Tvrtko Ursulin wrote:
>>> On 31/10/2022 10:09, Tvrtko Ursulin wrote:
>>>> On 28/10/2022 20:46, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> The engine busyness stats has a worker function to do things like
>>>>> 64bit extend the 32bit hardware counters. The GuC's reset prepare
>>>>> function flushes out this worker function to ensure no corruption
>>>>> happens during the reset. Unforunately, the worker function has an
>>>>> infinite wait for active resets to finish before doing its work. Thus
>>>>> a deadlock would occur if the worker function had actually started
>>>>> just as the reset starts.
>>>>>
>>>>> Update the worker to abort if a reset is in progress rather than
>>>>> waiting for it to complete. It will still acquire the reset lock in
>>>>> the case where a reset was not already in progress. So the processing
>>>>> is still safe from corruption, but the deadlock can no longer occur.
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/intel_reset.c             | 15 
>>>>> ++++++++++++++-
>>>>>   drivers/gpu/drm/i915/gt/intel_reset.h             |  1 +
>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++++--
>>>>>   3 files changed, 19 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>> index 3159df6cdd492..2f48c6e4420ea 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>>> @@ -1407,7 +1407,7 @@ void intel_gt_handle_error(struct intel_gt *gt,
>>>>>       intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>>>>>   }
>>>>> -int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>>>>> +static int _intel_gt_reset_trylock(struct intel_gt *gt, int 
>>>>> *srcu, bool retry)
>>>>>   {
>>>>>       might_lock(&gt->reset.backoff_srcu);
>>>>>       might_sleep();
>>>>> @@ -1416,6 +1416,9 @@ int intel_gt_reset_trylock(struct intel_gt 
>>>>> *gt, int *srcu)
>>>>>       while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>>>>>           rcu_read_unlock();
>>>>> +        if (!retry)
>>>>> +            return -EBUSY;
>>>>> +
>>>>>           if (wait_event_interruptible(gt->reset.queue,
>>>>>                            !test_bit(I915_RESET_BACKOFF,
>>>>> &gt->reset.flags)))
>>>>
>>>> Would it be more obvious to rename the existing semantics to 
>>>> intel_gt_reset_interruptible(), while the flavour you add in this 
>>>> patch truly is trylock? I am not sure, since it's all a bit 
>>>> special, but trylock sure feels confusing if it can sleep forever...
>> To me, it would seem totally more obvious to have a function called 
>> 'trylock' not wait forever until it can manage to acquire the lock. 
>> However, according to '2caffbf1176256 drm/i915: Revoke mmaps and 
>> prevent access to fence registers across reset', the current 
>> behaviour is exactly how the code was originally written and 
>> intended. It hasn't just mutated into some confused evolution a 
>> thousand patches later. So I figure there is some subtle but 
>> important reason why it was named how it is named and yet does what 
>> it does. Therefore it seemed safest to not change it unnecessarily.
>
> Yeah I looked at that but honestly I don't see the trylock semantics 
> anywhere. The only failure to lock path comes from 
> wait_event_interruptible. It could have easily been just a naming mishap.
>
> And I find adding a retry parameter to something called trylock makes 
> this even more non-intuitive and would personally rather rename it 
> all. Proof in the pudding is that the trylock naming did bite during 
> development and review of the code this patch is now fixing.
>
> I do however understand your point about a degree of uncertainty but 
> my feeling is to rather err on the side of obvious naming. Shall we 
> ask for a third opinion?
Umesh had commented (internally) that the naming seems wrong and would 
be good to change it. So we already have a third :).

To be clear, you are thinking to keep the wrappers but rename to 
intel_gt_reset_trylock() [retry = false] and 
intel_gt_reset_interruptible() [retry = true]? Which will obviously 
involve updating all but one existing user to use the interruptible name 
as the existing name will change behaviour in a backwards breaking manner.

John.

>
>>> Oh and might_sleep() shouldn't be there with the trylock version - I 
>>> mean any flavour of the real trylock.
>> You mean if the code is split into two completely separate functions? 
>> Or do you just mean to wrap the might_sleep() call with 'if(!retry)'?
>>
>> And just to be totally clear, the unconditional call to 
>> rcu_read_lock() is not something that can sleep? One doesn't need a 
>> might_sleep() before doing that lock?
>
> Corrrect, rcu_read_lock() can not sleep - it just disables preemption. 
> So leaving the unconditional might_sleep() would have opportunity for 
> false positives.
>
> Regards,
>
> Tvrtko

