Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820D75EF3E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE7A10E298;
	Mon, 24 Jul 2023 09:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CF910E087;
 Mon, 24 Jul 2023 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690191452; x=1721727452;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nr6f+fU2HAD7XPU42iIFjbiczsw+NNTAUtCHkfHu26Q=;
 b=J3uUCOYl0qV5Cn/ZFMWEPnyNxUhwoIQ0CM6koE6YcSMcWDBMyY2yzi4X
 qdPOx8SbZVFAe0tqNXyeSv3m07zSA/87kJAx678A3VcICdVTz5zuiz1Nq
 qZ6LhVCvxL7YElIwD24ocIqYf+S9oHCNNLUhp8PV1PsrQu20FkW+CJHl4
 zAYXzs92LglCoUHqs5rohVNlR4zHLPKnYNuDWsXz9/VPQ6ZpS//euXMSX
 3wUO+c0wSN+p6YVZZMKPiHgzmJj4Lm5MJqRzQ+KBP8uKo3We0foGaxyuq
 6Nm9zONnH1jYs/uI/5fA2sS7CJUYTYOLPJJIkxnwmOlb/qvIYyW5l0MW+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352293407"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="352293407"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972199973"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="972199973"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2023 02:37:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 02:37:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 02:37:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 02:37:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 02:37:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQ7C0pp39AdrKrZ7rVf6Nu7rdbchj8AwtBSX+qCjRBphWhdU+E9n31091G7/bSwUN73MJGxz4M6JKm9Us/6uqOD2KuULxX7tDKnjKAd3Dt5aCkLe++3cL0uTxZ7tqgSZlhfY93pI8aiGCkdg77VxEQXOEWl8E6Vxr4D/81xlDaH/SYxeW6r1iNiD2af4o/2D2FrwaaccGxSpQD8X42Za4pPRl4oIg3Dq3yHag/VQmaOJrRQ4E1acE/lOY7ZxZJdGXaDxtdPEKGcSMGkRhS5U0vQoorv72TBix19Mv5jayQm8OS4AoBRL+0tzcMn2mjMQQ1ztJpRfRN1XISbzo21UzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrSgY/OMggQg+ET5nTTtwrjXNp7AgOP5ZA9jxOnAtPE=;
 b=BFRAsyFDHVd4RjqWBN8JmAij7mz++QDoqLklQaTR2dh1S62mEslpfPxbd8q02g7a11vdj9+3q3IcvZTCO8wPWLS0kPdHSb0/DYvvUJX4W3Mh+MgpXXywJo2mu/L6ZBFvFok0G/40uV3OQMk2Pj6UI196DA0e0vl0uBr5hMcb7SHennZxgNftBLRNAXiwSK0w9RAbCRe9rdPhDG2sP8dvY0dydzDXDYOfDg6YLEox3DJougW+4SbxfneTrN5baLrk2V/seE4OF96pQ+2UIY+4ctJat6EmMVsOryFaQhV4E7OdVjtps7PvOtGxEJ5U6e9uODqyPbQlz7u2L6SMiwyeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Mon, 24 Jul
 2023 09:37:29 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1272:a789:3ebd:6bee]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1272:a789:3ebd:6bee%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 09:37:28 +0000
Message-ID: <5cad5767-8e4a-52a3-8f5b-2999954fed50@intel.com>
Date: Mon, 24 Jul 2023 11:37:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 6/9] drm/i915/gt: Refactor intel_emit_pipe_control_cs()
 in a single function
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-7-andi.shyti@linux.intel.com>
 <dc09292f-e2e8-c800-b39e-99f5364a8a76@linux.intel.com>
 <ZL5BhY6C2uzqd/bU@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZL5BhY6C2uzqd/bU@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0e4471-639a-4afb-d001-08db8c2998a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JY0oeohtJK6UgT65AuJOMfx6mC4IQ7csfy5kcKOW0KE1r6zoDqVrRxDow3kc9f08rHUntBylH4rNVXvuRZkqrtDe1KNIZV+HluuSvW4RaIZbrE/D8ujxyvsHOXsmSnerqPS0bJqHMSm2U4hk/axpt/Y6TJ9Qw6oSTZavpj6DFXqef1lzkZUM59fxc7M0FCgkw0UYujQm2EbMHLKqhN45o7sTovvYcukvwr9LmH/Jf8F1zZ0iuOgu5VDy3kd9ib0Zm8QthK5zxqRevsH7wXVsn+D9rfrBdIcZ8XuL1ktSasKdZTYRTzl9JcaXQz+tqvvxAqCzG72cqYGoQgr4lbQ5lTS6rA/0/Dvi7iyDA734ZCaJpwEMF7oUcctgi4x9ZlU8P9m0zWILfUaqD+Ge0lTTc/0RYkhUCtwqJYbIgGK2umBzdaGS3ASIZsSvc0dZM+sFhgBcDkfRj+TrZxi4TMdoUrxhRYqMl9msCEp56mOCHCJ7z3d033K2jBkQirdR2vsfpqCOSKYOf7m/GzPfsqFmhS5pAGv+V+9TBPNEJJVZkSNBjQ+uVyB5A7E2dmiT5oUkl8tdjqm68//rfFqN5pr4TSESu3yCsCp/GrEUuoior1a4BkOslNVMAPrIhPI4YUFXWJtQvzWEQPM2G9eil/QPkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(31686004)(6666004)(41300700001)(316002)(6486002)(36756003)(478600001)(4326008)(6512007)(31696002)(86362001)(54906003)(66946007)(110136005)(66476007)(66556008)(186003)(6506007)(53546011)(83380400001)(2616005)(2906002)(8936002)(38100700002)(82960400001)(8676002)(44832011)(26005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0N4ZHBVWGdhRGYwVkZVQUs5dlR3T04zbURZUlhDdlFoVnE0cG1EMU9lNjln?=
 =?utf-8?B?UUI0SzlZK3BvZTN1WjJjUGR5b2lXek9kc1lkVnBJdXgrM04vSTVKU0FCT2pz?=
 =?utf-8?B?OWJmWXFIa2dCdlNxNVQ3ZHp0bk1wVE1VckNRM2xyL2MvSWtvLy9TaUVpdG9O?=
 =?utf-8?B?cldqdG9MdnVhQ1RRV2FzVjdkVUlpV1V5bjdXMmdIQWJJWG1hNGNKdlpDNG9W?=
 =?utf-8?B?dlJqU2pjd0tvUEp3V3ZkRmRtV253SmxkN0VuWVU3ekRjSEFmY0Q1QU1oMi9G?=
 =?utf-8?B?cG81NFlSKzl2S2lWbUFzQ1Z0Z0lyNUFwU0Q2S0NaRTFFbXo5WCs5S2ZVam9J?=
 =?utf-8?B?WUl2UjhFWmtpUEZNZCtkL0Iva0NWZHpBM3J3ckFYUFQzb1VjZWpIdjFwN0VC?=
 =?utf-8?B?VHlBdElsRDgyRGF4MnRzdUc3aFc3ZmZRYVBxeGozQjhXek9kOVBjdkdiUU5L?=
 =?utf-8?B?Q2RmL3QwekIrRUFMNkZBZ240ZU9ObTZmdGF3WGlpK29aV2YrZGE0dkZjWHln?=
 =?utf-8?B?MFBDc0Mwa3VZQkRVMStvcWVVSTZMQ2pOU2xicDNJcDRQT1JNbDY0Y2FyV1Jm?=
 =?utf-8?B?bXJ3L0d4eS93ckdWR3hLRGlBYXFjQzEveCtkL3AwWVczcDZtdksvdWx3TUI5?=
 =?utf-8?B?UkduWjl5L241M0wycEpwRjBtbENERGNET3RUNk4wZklIYk1qWUpWcXA0U3pR?=
 =?utf-8?B?QUNIVWJ5aysvdTVIamtoR1dHR0Q1SG56ejM1ZjZYNUZXRGNGZVkzQUcxRitr?=
 =?utf-8?B?UXNKM1BzZ2Y4SlBSK0FuVzh1TnYwQ0RDWXkrSXZyTTBQUFhSTmlxTTYyYlRz?=
 =?utf-8?B?d3c3S3pzeGhaNjYxbVdCbXk4SDNpSFdHVFdMTk5sVG0xN1IxNkVzUE9PMEF2?=
 =?utf-8?B?MUpVM09iQ2k5VG80ZHdKYmQvSmFMZUgyblhmeWJoeVRJMG5wNGkyQU9wQ202?=
 =?utf-8?B?VGNITVYrd3RMTm5CV1VBNE1nc0dlSjJLd3FtcVNkb0pub2dvVkF1NEVaaFlr?=
 =?utf-8?B?WTNRRTlkdW04cGpVQVJvMW5ETXIraXdCdmkya0xiQXh0VjNVTnRuMGVlNWpo?=
 =?utf-8?B?bGVTNS9KVGVlc3hQVGp1ZTZMM3hJbTFrMWZJRFlIOVhPVWhGY0hlNE1QUU5n?=
 =?utf-8?B?aTBoWVpycXdrNStEcmhUcjl5RkV0aGd6dnZja0owMDRjM0kyaW5XYlpsdnFk?=
 =?utf-8?B?L1Z3MXhJb2prWWZuWDRNY2ROVk1lbXhzelRhN0paRDZNRWpiOUMveTVUaytX?=
 =?utf-8?B?azdZVlArMjhBTE5BelJ2ZUlJL2VhczlaSGxTVUgzcjIrVWkzTnhqNGVvOHc4?=
 =?utf-8?B?S2JLQkt6QWhqZzJMRllvSSs5UDRWU2Rtak9lTm9HQlhuVlZObnNqUzFKZ2Jy?=
 =?utf-8?B?NS91M1o5TkI3OWlDckNNNGVsNVhHUncxL093ZURaNzdXMXA0RlVvU2k0ZEQ3?=
 =?utf-8?B?TURPVHNHVjZlWjFIMjZHNFBWRkdYMmtaSDJ3RDZsRXRwYTA4VGpMaHNxTTRC?=
 =?utf-8?B?R0o4TUw1blhuVEpqSlVyeW4wbi8yNzBMVmxWNklsQkZoZ1prTFJ5OTBYWVNk?=
 =?utf-8?B?dkR4cFczY1J6Z1RoK3dNRmQ2WFg0RXRtNTZNQlFJNm1tZXZBZ29GNmtreDBl?=
 =?utf-8?B?WnJFKys5S0xXWUFiM05sNmpkcFl5VVozVmYyNEZyb3dndk1BOWs3MjZ0UjFU?=
 =?utf-8?B?cHVaeXBZV2JOb1dkRkErSDVhZEZuMm02YU5rT0ZlZmNTck83aEFaQlhpYTNJ?=
 =?utf-8?B?bEI5dHM2Z216YkpqeHpEcHptWjQzMjh0MFl0V3pJYjl3Yzh5cjd2emZNdWJt?=
 =?utf-8?B?THMvaS9iMjBpS2ZaTksxMXE2SGRUYXY0TkhQekxFQXhlUHlZVUd5ckovRjBM?=
 =?utf-8?B?NkRmaW5KSk11SkxsYjNxK09HdFRwVjlOU3BZMkU1bks3TGVOdHV0blNpMDdw?=
 =?utf-8?B?TzBnUEZYbklLeGRtbWNEcjd6emNSVFI5WGcrd3A5QWxLZ216RXRHeFE4SUdG?=
 =?utf-8?B?Tkh5NzJFQm5mUy9VcWRkeWRGeG5wOU1YYndyT2lHL0t3Y0tUSDk0b1g1RVlO?=
 =?utf-8?B?clFtcXBQOHF4K25FRlRWZlpwWnk3T05kN0IzRGplMXQwa1daNDRFMzhsUnc2?=
 =?utf-8?Q?L/jk2A9rn+MZp0KyF9NC/u3eu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0e4471-639a-4afb-d001-08db8c2998a2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 09:37:28.7867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8Fe8ph/c9R+b9YZsZtX47t6LRmWCIlqYPVIuNQvllHLcLQpAZlx5CGAmgKFiXgmBhGliTASsuoQknEy6mGh/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 linux-stable <stable@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi

On 7/24/2023 11:16 AM, Andi Shyti wrote:
> Hi Nirmoy,
>
>>       static int mtl_dummy_pipe_control(struct i915_request *rq)
>>       {
>>              /* Wa_14016712196 */
>>              if (IS_MTL_GRAPHICS_STEP(rq->engine->i915, M, STEP_A0, STEP_B0) ||
>>      -           IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0)) {
>>      -               u32 *cs;
>>      -
>>      -               /* dummy PIPE_CONTROL + depth flush */
>>      -               cs = intel_ring_begin(rq, 6);
>>      -               if (IS_ERR(cs))
>>      -                       return PTR_ERR(cs);
>>      -               cs = gen12_emit_pipe_control(cs,
>>      -                                            0,
>>      -                                            PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>>      -                                            LRC_PPHWSP_SCRATCH_ADDR);
>>      -               intel_ring_advance(rq, cs);
>>      -       }
>>      +           IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0))
>>      +               return gen12_emit_pipe_control_cs(rq, 0,
>>      +                                       PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>>      +                                       LRC_PPHWSP_SCRATCH_ADDR);
>>
>> Don't think this will get backported to 5.8+. I think mtl introduced after
>> that.
>>
>> If that is not an issue for rest of the series and then
> to be honest I don't think I fully understood the stable
> policies, as in this series only two are the patches that are
> really fixing things and the rest are only support.
>
> In this case I think this will produce a conflict that will be
> eventually fixed (... I guess!).


As far as I know, it is developer responsibility to port the patch to 
stable version if there is conflict.

Regards,

Nirmoy

>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Thanks,
> Andi
