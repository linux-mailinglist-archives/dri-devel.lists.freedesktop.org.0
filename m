Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B9571791
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 12:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574538B329;
	Tue, 12 Jul 2022 10:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D2718A103;
 Tue, 12 Jul 2022 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657623034; x=1689159034;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pvIs5gsRKjJwwL1a6D7bCLQa9VihmFyZizYNC3XwrQI=;
 b=UmJefyHbbCqXDEZVDsrMLCGSn+e2c2FuqKkxrtlunbksDg7MygyreGa1
 iWSh0r/GnZcAsBO+uMCyDjwemmR2UXPVbECe2fpdT/xFVxC3eS1HV9sNG
 5Xdq4nptTFjgtoYCyAIgdG5oIsUXCEpa6vR1uoOykQbUFkap4Byhoin4y
 AKOvT1KP9nIzHoDfS/E6ICOv+s6xykf4m/pG+jSciiToCHzZkzRdLrcU8
 hJyxMk5eIT/fdDjOrJ33dijdtMYmwEmT/+BapCUqfFsnOE9ePUT15/3fh
 PU94nqKLsmlA0dU0usU5Omm8vE2iz72yKpOLJ2yXHenMypbM43yjEQgXD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="267937722"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="267937722"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 03:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="570144985"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 12 Jul 2022 03:50:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 03:50:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 03:50:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 03:50:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 03:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PexfJT1XjTCS1io51pApJAIkheidwfIonkhICr6TzA3QvcGxtrG6/gyRMYMCJNRPaq28w1uTLNA1ytB+aQ0OHR0KT5sWES4/XJdC8f0Kius0CiUnWX7Eqpvw8M4SS3ONY0FRnyvK+FUQJ8nQfP2hs5EgKe0QLabj2BZREhBeywHREaYmOBbcWIoQUrlDirT2ZV+5vKNOZeIFwXmPtJLKwzYFh0omWfsppsVJX7OOOHuIc5pHJg9jGeUbqny3wF5vScayCYUUQIV155YVdSOjrz8I24kmngjTNqzvQbO7wYDU+kKkPUnfEIY7vEJP6bOp9FOTF+xONYzGPgbyNvubng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfWXryo6kH61KEhYYkCcdP5Cee01/g6H2Kb9E1JLN/k=;
 b=eQ8nohO1WhHucTCwHYitMc/NlILxpvdHkImxONgW7vQ2NNdSPNPmnSPDSnZqmzTOez4E517Kid5KA+3/Sy6XHNQFXOvsj6Jwx6mIwsGX4eaObPX3oTH5X1MEvfTltt21Tl4yjNzT4S2PFI5So2ZTD8C5WwCml5wtZ92j3yD8Z97zWTMjhDY9RMa0+h0BuW7+Nzs02lFbIcejIeuOAuNtS7DweKkQVYIyrPp6Y3LRCLgtBtrkefEWZ3qKhe0h7WIk+QcA1oHQDQtGZnJT1lTxF27AIePOv/mGDNLlWtjPFPQY25KUC2G6A47socV+WTMo/tCOzak27xiKhAZnxcgzCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by CY4PR1101MB2311.namprd11.prod.outlook.com (2603:10b6:910:23::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Tue, 12 Jul
 2022 10:50:26 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::49da:18ae:2975:c398%8]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 10:50:26 +0000
Message-ID: <6930263d-e803-771f-c4cc-42c478a7d5dd@intel.com>
Date: Tue, 12 Jul 2022 13:50:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/7] drm: Move and add a few utility macros into drm
 util header
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-2-gwan-gyeong.mun@intel.com>
 <20220705162320.3f64e203@maurocar-mobl2>
 <2da2f40a-cf5e-ed3d-fee7-877910f377bb@intel.com>
 <20220706190513.38bf0be0@maurocar-mobl2>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220706190513.38bf0be0@maurocar-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df50caf6-0ac5-4715-4594-08da63f453f5
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2311:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OkMkNiEOOuHjkJz1EbE10+pG+eWLfOCrfrAzmuULAS3q6ToN+1YMuQD+0djhkXOmO7+DFvbduxoZg/UIg+0V6JktnaM7jNUg2XjnKYifAUR6EWKv7uNCG8c/F83cKMSkOWdr0wrI6Mz9+eqR1jzeS5HCNStZ9MAhvfaEU+2yhvbwIObikJgXxbQjJl+7YB0ooiVh2Amou0rbjM4XGA9NhULuaBFFVCaofYhkyCisqZroh5cV7nWI36C7wqlF0S4xmCn/2+uD12JA767kvBAzCn/jMC5+4943g3AA4ZP+AGH7eBe/DSMGzDrFOspl8f7bfoYQASe/Nt7F77eGZ/98+fQOdlxlxQAgvEu0zT6wvj+l67KhNl8qtPIdFWI67xMV+r937qLyPmJMDW+rvLUBWMhoPayEcOIgDGuwsG5mJJCPlXHdvoZfdRh8SKbUdD56gjYN4ngVj43FKsZ1nVW2v/AH9l/yw54OLISH1xwbaqFC1rlyEhIXAMok4dhMdSwj8r1kvmDRiuMh4cjOMfDbgMjSxb7RL1n7oJl1PXNOaOafm4925utT4I2N9dvl2GqihAOuTc9xeYdS3IMsN1bbOYpq30h9xiqoCphPaVXernleZVczv0i3XB5uwV7trzVBvlY0whLnxhiVsyr3WtnawVSpuzjt3smrn6+sfnlaojgq7BKKm4zGk1X9jRrMppVtbznaHmJFI9Cy0Ddd1dKtQWDGH3e9mtcz+NiLGBbFZHF8dWgerGjcEbm8d/NcZFoMidIwi69O/g1xY2UD/EB0omV6cFd0/+1BOk+OFK7d6uFlzOkzBqYhIerrIaP9zveMJC8UuALfFZ7080Rbdw8yhbyjRj8Ha6LlrUkM6nL/f0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(39860400002)(376002)(136003)(83380400001)(66574015)(38100700002)(4326008)(8676002)(66476007)(31696002)(2616005)(66946007)(66556008)(86362001)(186003)(82960400001)(8936002)(36756003)(2906002)(5660300002)(6506007)(6916009)(316002)(6486002)(53546011)(6512007)(26005)(6666004)(41300700001)(31686004)(478600001)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkFLRHJEK1BmWFo4dDdyMGdsbDd3bDR5L21tYWJ6MWUyYlJOTTd6cUZmU2hy?=
 =?utf-8?B?bFFpSDFzRkxpR05TTm5QMXVLMm5uM2xuUGlVTnRZU1gzbkJyT2NFcUtZRndx?=
 =?utf-8?B?UkpQMllpaHZSL05KbzJTMllRN1dRWUg4Nm01YWJBRDFnR2lhR2lmL1Rrand2?=
 =?utf-8?B?cXRKc3lVZ3N3M0dhZkQrVnFzRE9ESWw4eTRFU0ZSK1V4ajg0SlJDUFNXOWV0?=
 =?utf-8?B?VWEvMHdOVlJWYThjTEN1bEQwbVhMc2dsdHhsSCtXQ1FuanIvZUJMajAwNFVw?=
 =?utf-8?B?SUJkTGQrS2d6NXUrcm5yd3ZzcndjUnB5ZEZRMHY1d2pydHJGZUdhQmpneWtK?=
 =?utf-8?B?d1NCUmJEQ2ZOWGxPM0Izb2xLMWZYSmNtM1RNSTVJcllvZS9QRVRKNmVPTzlt?=
 =?utf-8?B?T0JpQWp0TW1YbU9RM3lRWGx2dDJ0ODE0dmNBdU40a1g1VHp4NHVhbG9rVHRl?=
 =?utf-8?B?RS9qN3lITVp6QkdaM2JqeFJqQmVkeFlod3VwbUhGQlNjU3pYTjd6dXY4NjFr?=
 =?utf-8?B?RFpoTDdJVmxoa2FKbVdmUVdBdzZZaTJFcUhJWkU2dUp1K2k4Um5IS1dFMHdk?=
 =?utf-8?B?RXhsc2F6UFBTWGxidTEyUm5LWk00NmJqRm1xNUU1R3pKYlFKVm1MT0NmSzFa?=
 =?utf-8?B?eXRFbTBHUHNKRkdxWW96emlJb1NpWHgraWxDSnp6UUhleTYyRkZVVG1nazdl?=
 =?utf-8?B?RVYwYUdsMjdTNmp0UjI3V3FlZVV4alVwbmJsWUlwdm1wekplZ0FEVElmUitj?=
 =?utf-8?B?RE5JN0JqbCtXQTJjMGdpR004SzBvb2VsOHdGdnlZR1lTTHZtcUJodGRuUE1B?=
 =?utf-8?B?c2Rja05Va25YL1ZDM1h0NGVsajQycy84YnYyQ2xLOHBqNTNxaVA3VUdFTEQz?=
 =?utf-8?B?V08xam5rdEVsK3N2aVZUMEkwaitpY2tzb2FxSmdHQk85UHZxdldTS2JWeU83?=
 =?utf-8?B?TWRIYStXaW9wVnhDSUZ3WkZ1ai9EN3ZWUktpT1ZZUXVLa1BnbFprSmIrQWdY?=
 =?utf-8?B?dWQ0bHBpMHAvWGp3TTZqcHNybDJ3alRRK3AvUHBUM1VBM1B6NHBQNGplbDhV?=
 =?utf-8?B?N0Z2dExQM1ZSeXNOWGZvQjZRblNiVFhKN2tjM2hoMmNpL0N3K1Y3SVRKMHp2?=
 =?utf-8?B?OUsvVmNpcXhIenhHZGgzczc3MjhUczZBbVo1V0JRNkM1cWtwT1hTTzJTRG5Z?=
 =?utf-8?B?S2MvZkNMVnZVdjdlNEZEL3N5QXF2Zm96VjNCTUQ0YXdnd1dNWFJsK2tlSFMz?=
 =?utf-8?B?SWtjbXR3RWN0V1NmMHFsc1NoVER0QndrWnBadFl6anBTR25oSTB2SDRWYmFv?=
 =?utf-8?B?Vk9uUXRjR3doMVJFL3dzaVQycmVWN3B0WE1BZ3piRmpDWStJK1owVmRjNERN?=
 =?utf-8?B?MTZzLzY0QnIrYi9WZTJsQXdQbDZNWTJ5a1p6bjcrcWs0Szdwb0dSQ1JGK0tW?=
 =?utf-8?B?UllNMnR2WkRkdVZ3WFZmaEhNaEo4T29xZjM4ZHQ0WndyRmRER2JzbUpCWWtn?=
 =?utf-8?B?Q1RTVlJZa2dkdWduMUFFekx5aEg5SlFDbThGb25ZSE02cEZHUEVUenJzOXEr?=
 =?utf-8?B?ZTRXdGhoaFkxbnhKMVFJRG50ZmFiNktWNmhKbU02YmIxR2o2VEdEdUpjNWI4?=
 =?utf-8?B?Q0RFRkU3VU1QZjFiSDk3QXRoK29YbzJ6ODliZER5YytGblhOSFBGSEZ0T0Iy?=
 =?utf-8?B?dExrVkN6T1U0ZGZjZURTNkdSeXdtZ1JEMFJSOXdBa3RGdFlHWmVnTkhoRFJj?=
 =?utf-8?B?R1VCNlladXhKTk9WMWtrN1krNGtkRlFUUVZySjd4dk5aMXFSTmRYRng3RFhI?=
 =?utf-8?B?K1lFdng2Nk95U0F6M1F1K2RBeFFqcGFHVGkwRTNJcndvbXNLdjd4cWhtd0lE?=
 =?utf-8?B?L1oyMUhKS2NSUEdhaGVhUFVnR0JNeDYzTkljajNUQXB0WHZZOEh6TEhNdlZl?=
 =?utf-8?B?M2Fxc0szeThTTEpuMjBLSHlXa0I0NTY0a3UwQ2s0RThja1JpbUhxOFZOSzUx?=
 =?utf-8?B?cEppeXhHV1B2dG8vb1l3ekFkVGNoTVFTN1d2Sm1HQjlkRWhNcW5DV1ZTV3FR?=
 =?utf-8?B?bE9BSlZLZTNWYkdTZUF0R080ZUkxNnRKS21ta0ZFdkVTd3JrNUdOY3Frclcz?=
 =?utf-8?B?R0JJWklmcHFNeThLUlN1bEhTU2c3R21POFRtdFhFSkJBUzBQbHN1VE5qNFlu?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df50caf6-0ac5-4715-4594-08da63f453f5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:50:26.0442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wA9fJoHLY++Lt/3vaBj4YDEs7dUF+QT9xwYqmRO+UroWggE1MJCyb0dbl6MK3qRp0lpz5z3/LVV6U9ah7DfJ97+7ZSXT9s9SORhrCdd/Svk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2311
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/6/22 8:05 PM, Mauro Carvalho Chehab wrote:
> On Wed, 6 Jul 2022 18:04:20 +0300
> Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> 
>> On 7/5/22 5:23 PM, Mauro Carvalho Chehab wrote:
>>> On Tue,  5 Jul 2022 15:24:49 +0300
>>> Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
>>>    
>>>> It moves overflows_type utility macro into drm util header from i915_utils
>>>> header. The overflows_type can be used to catch the truncation between data
>>>> types. And it adds safe_conversion() macro which performs a type conversion
>>>> (cast) of an source value into a new variable, checking that the
>>>> destination is large enough to hold the source value.
>>>> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
>>>> while compiling.
>>>>
>>>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/i915_utils.h |  5 +--
>>>>    include/drm/drm_util.h            | 54 +++++++++++++++++++++++++++++++
>>>>    2 files changed, 55 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
>>>> index c10d68cdc3ca..345e5b2dc1cd 100644
>>>> --- a/drivers/gpu/drm/i915/i915_utils.h
>>>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>>>> @@ -32,6 +32,7 @@
>>>>    #include <linux/types.h>
>>>>    #include <linux/workqueue.h>
>>>>    #include <linux/sched/clock.h>
>>>> +#include <drm/drm_util.h>
>>>>    
>>>>    #ifdef CONFIG_X86
>>>>    #include <asm/hypervisor.h>
>>>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>>>    #define range_overflows_end_t(type, start, size, max) \
>>>>    	range_overflows_end((type)(start), (type)(size), (type)(max))
>>>>    
>>>> -/* Note we don't consider signbits :| */
>>>> -#define overflows_type(x, T) \
>>>> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>>>> -
>>>>    #define ptr_mask_bits(ptr, n) ({					\
>>>>    	unsigned long __v = (unsigned long)(ptr);			\
>>>>    	(typeof(ptr))(__v & -BIT(n));					\
>>>> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
>>>> index 79952d8c4bba..c56230e39e37 100644
>>>> --- a/include/drm/drm_util.h
>>>> +++ b/include/drm/drm_util.h
>>>> @@ -62,6 +62,60 @@
>>>>     */
>>>>    #define for_each_if(condition) if (!(condition)) {} else
>>>>    
>>>> +/**
>>>> + * overflows_type - helper for checking the truncation between data types
>>>> + * @x: Source for overflow type comparison
>>>> + * @T: Destination for overflow type comparison
>>>> + *
>>>> + * It compares the values and size of each data type between the first and
>>>> + * second argument to check whether truncation can occur when assigning the
>>>> + * first argument to the variable of the second argument.
>>>> + * It does't consider signbits.
>>>> + *
>>>> + * Returns:
>>>> + * True if truncation can occur, false otherwise.
>>>> + */
>>>> +#define overflows_type(x, T) \
>>>> +	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>>>
>>> As pointed on its description, this macro only works if both types
>>> are either signed or unsigned. However, the macro itself doesn't check
>>> it.
>>>
>>> It probably worth adding something there to ensure that both types are
>>> either signed or unsigned. I would add this ancillary macro probably on
>>> on a generic kernel header - as this can be useful outside drm:
>>>
>>> 	#define sign_matches(x, y) \
>>> 	        (!((typeof(x))-1 >= 0) ^ ((typeof(y))-1 >= 0))
>>>
>>> And then include use it at overflows_type:
>>>
>>> 	BUILD_BUG_ON(!sign_matches(x, T))
>>>    
>> Hi Mauro, thanks for checking it.
>>
>> What you commented here (sign_matches macro) is to check whether the
>> sign bits of two types are the same,  but the purpose of the
>> overflows_type() macro checks overflows while assigning a variable with
>> a large data size (BITS_PER_TYPE is large) to a variable with a small
>> data size (BITS_PER_TYPE is small).
> 
> True, but the problem is that such macro just assumes that either both
> are signed or unsigned without actually checking it.
> 
> Basically, if one tries to store for instance a s32 value on an u64 var,
> the value won't be stored correctly, due to an underflow. As the hole
> idea of this macro is to exactly detect if the "container" variable
> is big enough to properly represent the measure, it sounds incomplete
> to not handle the integer signal.
> 
> Btw, after reviewing all patches, using BUILD_BUG_ON() is not needed
> here, as such macro (or similar) is already used at the callers code.
> 
> So, I would just return false if the signals are incompatible, e. g.
> if the type of the source value is signed and the type of the
> destination value is unsigned.
> 
> So:
> 
> #define overflows_type(x, T) \
> 	(!signal_matches(x,T) || (sizeof(x) > sizeof(T)))
> 
> Should do the trick[1].
> 
> [1] using BITS_PER_TYPE() macro is not really needed, as this is
>      defined as:
> 
> 	#define BITS_PER_BYTE              8
> 	#define BITS_PER_TYPE(type)      (sizeof(type) * BITS_PER_BYTE)
> 
>      So, checking if sizeof(x) > sizeof(T) is enough. Btw, the check
>      there seems to be inverted, making the macro to always return zero!
> 
> Yet, strictly speaking, it is possible to store an unsigned value on a
> signed type, if the signed type is bigger than the size of unsigned
> (so, a s64 int can store u32, but a s32 can't store u32).
> 
> Adding a check that would consider this should be like:
> 
> 	#define is_type_unsigned(x) ((typeof(x))-1 >= 0)
> 	#define is_type_signed(x) (!is_type_unsigned(x))
> 	#define overflows_type(x, T)							 \
> 	(										 \
> 		(is_type_signed(x) && is_type_unsigned(T)) ||				 \
> 		(is_type_unsigned(x) && is_type_signed(T) && (sizeof(x) == sizeof(T))) ||\
> 		(sizeof(x) > sizeof(T))							 \
> 	) 	
> 
> This should be generic enough to be used anywhere.
> 
>> we can check the additional sign bit by adding sign_matches() to the
>> overflows_type() macro, but in the current scenario, it is used only
>> when the sign bit is the same.
> 
> Yeah, but "current scenarios" can easily be extended to something
> else, quickly going sideways specially on a subsystem-wide macro.
> Also, getting this right is particularly tricky when comparing typedef
> integers. So, I would be more comfortable if the logic will also
> check the signal at the destination variable.
> 
>> Should the macro be extended even for cases where the sign bit is
>> different in the current state? (If yes, I'll updated it as v3)
>>
>> In addition, the place where this macro is currently used is only in the
>> i915 driver, so it has been moved to the header of the drm subsystem.
>> IMHO, moving the macro location so that it can be used by multiple
>> subsystems of linux would be a good idea when there is a use case for
>> this macro. What do you think?
> 
> Good point. Yeah, it can stay there while not needed outside drm.
> 
> Btw, in order to get it right, I suggest double-checking in userspace
> how each macros are evaluated, like using the code below.
> 
> It helps to check if the logic is doing what's expected or not.
> 
Thanks for sharing your nice comments and ideas.
The currently used oveflows_type() macro has a requirement to check not 
only the overflow check using the size of the container, but also the 
overflow that may occur when an actual variable is assigned.
In relation to this, I wrote a macro based on the logic below and tested 
all scenarios that can be used in c code.

#define BITS_PER_BYTE           8
#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)

#define is_type_unsigned(x) ((typeof(x))-1 >= 0)

bool overflows = false;
if (is_type_unsigned(x)) {
   if (is_type_unsigned(T)) { // x: unsigned, T: unsigned
     if (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
       overflows = true;
   } else { // x: unsigned, T: signed
     if (sizeof(x) >= sizeof(T) && (x) >> BITS_PER_TYPE(T) - 1)
       overflows = true;
   }
} else {
   if (is_type_unsigned(T)) {  // x: signed, T: unsigned
     if ((x) < 0)  // sign bit is negative, negative value
       overflows = true;
     else { // sign bit is positive, positive value
       if (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
         overflows = true;
     }
   } else {  // x: signed, T: signed
     if (sizeof(x) > sizeof(T)) {
       if ((x) < 0) { // sign bit is negative, negative value
         if (((x) * -1) >> BITS_PER_TYPE(T)) {
             /* Since signed numbers treat negative numbers as
                2's complement, convert them to positive numbers,
                perform bitshift operations, and perform overflow checking.
             */
           overflows = true;
         }
       }
       else { // positive value.
         if ((x) >> BITS_PER_TYPE(T))
           overflows = true;
       }
     }
   }
}


Here is the code that was actually tested:
The patch applied with is_type_unsigned() / oveflows_type() used in the 
code below will be sent back as a new version.

#include <stdio.h>
#include <limits.h>
#include <assert.h>

#define BITS_PER_BYTE           8
#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)

#define is_type_unsigned(x) ((typeof(x))-1 >= (typeof(x))0)

#define overflows_type(x, T) \
	(is_type_unsigned(x) ? \
		is_type_unsigned(T) ? \
			(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
			: (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 1)) ? 1 : 0 \
	: is_type_unsigned(T) ? \
		((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 
: 0 \
		: (sizeof(x) > sizeof(T)) ? \
			((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0\
				: ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
			: 0)

typedef char s8;
typedef unsigned char u8;
typedef short s16;
typedef unsigned short u16;
typedef int s32;
typedef unsigned int u32;
typedef long long s64;
typedef unsigned long long u64;

int main(void) {
	/* test variable, test type */
	/* 1.  overflows_type(x, T) x: unsigned, T: unsigned */
	{
		u32 x = UINT_MAX;
		u16 T;
		/* expected overflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, u16));

		x = USHRT_MAX;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, u16));
	}
	{
		u64 x = ULLONG_MAX;
		u8 T;
		/* expected overflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, u8));

		x = UCHAR_MAX;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, u8));
	}
	{
		u8 x = UCHAR_MAX;
		u64 T;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, u64));
	}

	/* 2.  overflows_type(x, T) x: unsigned, T: signed */
	{
		u32 x = UINT_MAX;
		s16 T;
		/* expected overflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, s16));

		x = SHRT_MAX;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s16));

		x = SHRT_MAX + 1;
		/* expected overflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, s16));
	}
	{
		u64 x = ULLONG_MAX;
		s8 T;
		/* expected overflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, s8));

		x = SCHAR_MAX;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s8));
	}
	{
		u8 x = UCHAR_MAX;
		s32 T;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s32));
	}

	/* 3.  overflows_type(x, T) x: signed, T: unsigned */
	{
		s32 x = INT_MAX;
		u16 T;
		/* expected overflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, u16));

		x = INT_MIN;
		/* expected underflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, u16));

		x = USHRT_MAX;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, u16));
	}
	{
		s16 x = SHRT_MAX;
		u32 T;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, u32));

		x = SHRT_MIN;
		/* expected underflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, u32));
	}
	{
		s32 x = INT_MAX;
		u32 T;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, u32));

		x = INT_MIN;
		/* expected underflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, u32));
	}

	/* 4.  overflows_type(x, T) x: signed, T: signed */
	{
		s32 x = INT_MAX;
		s16 T;
		/* expected overflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, s16));

		x = INT_MIN;
		/* expected overflow */
		assert(overflows_type(x, T));
		assert(overflows_type(x, s16));


		x = SHRT_MAX;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s16));

		x = SHRT_MIN;
		/* expected not underflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s16));
	}
	{
		s16 x = SHRT_MAX;
		s32 T;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s32));

		x = SHRT_MIN;
		/* expected not underflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s32));
	}
	{
		s64 x = LLONG_MAX;
		s64 T;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s64));

		x = LLONG_MIN;
		/* expected not underflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, s64));
	}

	{
		u64 x = 123456;
		int *T;
		/* expected not overflow */
		assert(!overflows_type(x, T));
		assert(!overflows_type(x, int *));
	}
	return 0;
}



> ----
> 
> #include <stdio.h>
> #include <stdint.h>
> 
> // Kernel definitions from bits.h and bitops.h
> #define BITS_PER_BYTE              8
> #define BITS_PER_TYPE(type)      (sizeof(type) * BITS_PER_BYTE)
> 
> #define sign_matches(x, y) \
> 	(!((typeof(x))-1 >= 0) ^ ((typeof(y))-1 >= 0))
> 
> #define is_type_unsigned(x) ((typeof(x))-1 >= 0)
> #define is_type_signed(x) (!is_type_unsigned(x))
> 
> #define overflows_type(x, T)								 \
> 	(										 \
> 		(is_type_signed(x) && is_type_unsigned(T)) ||				 \
> 		(is_type_unsigned(x) && is_type_signed(T) && (sizeof(x) == sizeof(T))) ||\
> 		(sizeof(x) > sizeof(T))							 \
> 	) ? "OVERFLOW" : "don't overflow"
> 
> int main(void)
> {
> 	uint32_t	u32_1 = 0, u32_2 = 0;
> 	int32_t		s32_1 = 0, s32_2 = 0;
> 	uint64_t	u64_1 = 0, u64_2 = 0;
> 	int64_t		s64_1 = 0, s64_2 = 0;
> 
> 	printf("u32 stored into u32: %s\n", overflows_type(u32_1, u32_2));
> 	printf("u64 stored into u32: %s\n", overflows_type(u64_1, u32_2));
> 	printf("s32 stored into u32: %s\n", overflows_type(s32_1, u32_2));
> 	printf("s64 stored into u32: %s\n", overflows_type(s64_1, u32_2));
> 
> 	printf("u32 stored into s32: %s\n", overflows_type(u32_1, s32_2));
> 	printf("u64 stored into s32: %s\n", overflows_type(u64_1, s32_2));
> 	printf("s32 stored into s32: %s\n", overflows_type(s32_1, s32_2));
> 	printf("s64 stored into s32: %s\n", overflows_type(s64_1, s32_2));
> 
> 	printf("u32 stored into u64: %s\n", overflows_type(u32_1, u64_2));
> 	printf("u64 stored into u64: %s\n", overflows_type(u64_1, u64_2));
> 	printf("s32 stored into u64: %s\n", overflows_type(s32_1, u64_2));
> 	printf("s64 stored into u64: %s\n", overflows_type(s64_1, u64_2));
> 
> 	printf("u32 stored into s64: %s\n", overflows_type(u32_1, s64_2));
> 	printf("u64 stored into s64: %s\n", overflows_type(u64_1, s64_2));
> 	printf("s32 stored into u64: %s\n", overflows_type(s32_1, u64_2));
> 	printf("s64 stored into u64: %s\n", overflows_type(s64_1, u64_2));
> 
> 	// Shutup warnings
> 	s64_1 = u32_1 + u32_2 + s64_2 + s32_1 + s32_2 + u64_1 + u64_2;
> 
> 	return 0;
> }
> 
