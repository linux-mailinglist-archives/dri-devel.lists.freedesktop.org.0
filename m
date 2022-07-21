Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD657C1C3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 02:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9992B42C;
	Thu, 21 Jul 2022 00:54:58 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EB72B5C0;
 Thu, 21 Jul 2022 00:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658364897; x=1689900897;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Uc33w13Fw5EBugjLyy67IoJnBgXbzpyayA7AC8kiIg=;
 b=ZDjIiWhuDw6v0UGlchHtUCqQoqAKffWIeaR0KDEx7mV3SdR2oRFMfhpQ
 yFxNPhB7Uyiw2kF4UPoOGsYm1uJBfxlKeKrezI7lO0RYQfkDkMczs8jfq
 W691p2rPw7NXSfHqZ0u3bWqsiXNc4GxpQW5Id/BazznHIEH+qiN64SEtR
 9y4K9Wy+gqKuoQ2oYCYTWlLm7jzptjSUgk2m/kE45gXU/OlFrB/wcKmUR
 wi7Q8T/3io0V3LrGGVboy7miEWDGyQGnBNmAZQeB2wXhyqoaJT5jNtP3H
 8Cqw6EFxwgXtZ5XueHDIvMZyWCabIzjxl1XvLnUa9A+NT2jZ4zdsIRPcP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="273763840"
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; d="scan'208";a="273763840"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 17:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; d="scan'208";a="598276360"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 20 Jul 2022 17:54:56 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 17:54:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 20 Jul 2022 17:54:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Jul 2022 17:54:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBQdZX/D4VD5TAazrj0h+UijNCCzUfm9CMkM/McU+heNJXFVQmnWoWPmyXd6R7wAIdue+DqNAeYYpR4ePV6Yzs3a5Gk8U786ATLzrKzezuNPpOfuqMNJJLLVt9sU3OIWfNkpg3PXbOljiquEdUMl2veB78MfdFP5/IezaxNkehMRBtqpNP7ojdGMJgyZH045a4yEEcoaGazsi3M7yx3oSFtNL6rgoDYBCpBYBptLc5iYwf5WAB2GY2iU06tjrlHHw5sNUHF9EdHJ0b4FKOsGr9G/escqr8DaDz2Tn6iQ28ftIx5b+UP2thvtltH/8AKP8b6dKkPXdoqZlMLJJNKUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuXvpCpy3Fsm2q26H2tEE0PAZ18u+4mAiYhLobEYr3M=;
 b=NBMLY+7LMWi2Mai3K4SYBnga40aKRbiYn0mSuhbPwMPm7/AIRSE4aYF1bZnkvupGXfXmsMJBV3psIh6gls4AJkwSCvDYc0LwShfE2VNesM8ptaPnTLlmfNcN5bhogmJPPecRoR5SC+4N1XQDwooUVUGUJp7q3zSTPp7RV+4xJgxMiaRxnSgo8eRCM2GWYbzVBPBTGpcKrSeAsetfny/JzbL1MgxU1piWRqmSW5bUhmCehh+p0mhk2TwRSw7y9h4XG4P1aM5sdwDkFaEQC/3/r4ze+Qd8P8jqqGLSvXDdbqMyjNQPY3wqka4seuVIHvInV7u9MieVvUgCQymudn6FAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Thu, 21 Jul
 2022 00:54:54 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 00:54:54 +0000
Message-ID: <ce12b1df-8845-64d6-4fcd-e2e650c3bf34@intel.com>
Date: Wed, 20 Jul 2022 17:54:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 01/12] drm/i915: Remove bogus GEM_BUG_ON in
 unpark
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-2-John.C.Harrison@Intel.com>
 <d1cfac14-4c01-ce53-586f-01f8998bbab4@linux.intel.com>
 <c86064c9-cbcc-cdc5-0654-0493c8d3d444@intel.com>
 <0337c3d4-811e-1f5a-fe26-f0e8068497b8@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <0337c3d4-811e-1f5a-fe26-f0e8068497b8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f04f701-ae8c-4621-2bf7-08da6ab39fd2
X-MS-TrafficTypeDiagnostic: MN2PR11MB4678:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZdEb+wDjMMA8b/Bd1w42N3j8LU/Lmwh8LR3eO0B7RDD2zNfvz3xPYywUh7Xuhh7ATyNmJ9tDDH1jl9UvrMtqIChoYZJOmKh6KlLF0Kv/9IGH6LuipjVJBALlKtyvxhD2JCinMxumBcPXTInTVcas7n/CzpFm0iBJJJK0wOvMdjZqBnEz5PWVCLkmdjVXZrN3WZedkgIex8crXcvxRb0okFCwAlFemYmBHOsjJcW8oGFTHVZzMgc6flgF41NKyhX9R/jm6Plb0ND797+C9YRp7Nup9HD8jc1hk9D00oEGKl3yco2dNRmnOrB/WGo5mxxDr7zh2JlbqkbnqzxaZ+pED1g2LyEILE7nsU/eCjKY8TITT4vYc153bdVcmewJfYaYuX11+ASYI3Ws3kB2AnARH3Po9GvtvgywAYtbP/hR5Z0KUzwrzJLPMh3JVUnDWaGrcIeS5GQQIgAfQCJZ4WZDAquWEe2FcnlPmusIL3fq2iaR9IZaaGPEZwm7NdKfne13wLkx/Eq/z+hisMg0sjOuNEZUe/M550USAQT0V2TigML0uJ/MV/UVUQa2f30tVvyP9eIKwWfs+Z7+Vw+m83tbWKjr1weMJJs04yFS4UaTXVl9b7EKNPcoB2x6/rbEZTdxpejAe+yGS8kMjI30f2YyuQSIjkD6Ibc6rIfFRqBj0gRGFxU947yO5O7RBegf0SbGEIeNOV5+MpnR0jtZqjF8v5IEWbQ3sSWsCu4GBT+bmOcTJLHWay7o9D3ZZIpnpeNBPwfLtqPYc1ffYanCsDZuOVzwAs5G0kz42gnmj0+A5O5wQ2kL1CUIM4Thdb3RQG8JBpzVngq5c+eatyD3dBelFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(136003)(396003)(366004)(346002)(316002)(8936002)(8676002)(38100700002)(66946007)(4326008)(53546011)(31686004)(31696002)(86362001)(5660300002)(82960400001)(83380400001)(6666004)(6506007)(66556008)(66476007)(41300700001)(2616005)(2906002)(26005)(6486002)(186003)(478600001)(6512007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkZwQzhrb3VhajRUcVhRcE01eDc0VVkzL0ZISHdwRmNyTGNzcDQ4QkJaZ1Ew?=
 =?utf-8?B?Zk1OVkhFSi9oOE9yUndmc0Q0eUtsbWJFbDBad0ZGY1VXeEtZcWVjak4vY3dI?=
 =?utf-8?B?OVhiRGJHWjFDWUMyOTduNkFSNlBOMVNreWRNNFJrZE1CVHV5TE51K1V4dGxR?=
 =?utf-8?B?QkxVM3FZMm56SllqMnhRRjdqcWYzL0NlenB3UWx3cS8xVTl5QnhmcEYrQURT?=
 =?utf-8?B?U0hQZHl4blo2QVQ2RjVOYmZVNTlqeUJRTkZQbytCQldiR1V6dmlyT1p6U3Jk?=
 =?utf-8?B?a2hrUkFCZnkvbnZJYzIxZGtReExKTnM1YkthY0NXV0xyWFRzcjFHazk2dGhE?=
 =?utf-8?B?VmRUQ2Rub3VpcVVQcWV1QkJJSFVjcG9CU3gxSmZuTUY4bENxUDZTZVk1WUFO?=
 =?utf-8?B?MkZibHgwK1hnMXdBRk1hTEE2aldEUTBVU2swUCtVRmoyOFIzbTNPMk1EazBT?=
 =?utf-8?B?REV2R0tlTkt4YitGRFk0dkp6TldXZVRhTHFvRFZtZHB5Q1FMTzBnNmVGWHJH?=
 =?utf-8?B?VmxqVytvUnFyYzBJMWhBdGZpdkgraCtEakxKVFU0ZHN1MlFIcm5WRWJYRkZM?=
 =?utf-8?B?SVErRWRpeDM0QzBNWUo1ZFFyejR5R1FXdmRLNUVJZFJqV2xUcGc3RXV1ejVD?=
 =?utf-8?B?UHBrOTh2cVhxSGtpWnBKYjdROEVjcUJmYXVEemRhY0twTEdhU1lHanc5Ymd5?=
 =?utf-8?B?bnVlSGt2TTByUk5RWkRkTEhHcFRkZDN1Qjh0L041ZFhGMEtCdHVxVnVuTEdL?=
 =?utf-8?B?YWNXdkM1YTQ4TVByU05YeGJzWnB6YjRZamlRNE9aazJWazJkaVUxR2hXMGMv?=
 =?utf-8?B?SDNnbzVHY0RHTlZTUnpzNjZ0THpLWGIzbkV3SW42b3JWMVE5aWRwcFVXcnFP?=
 =?utf-8?B?ZWdCakVoSW43ZkRZakJnT2k0Q25XKzAzanRVbElIaEhnM1E2aTZLVmNicEhX?=
 =?utf-8?B?RVNWYXFOQkI3ZE9tcGJwSjU5OHBGK3FmWnlYNDFrZlU0M2NJRjZTbTcvUTNC?=
 =?utf-8?B?NG5yZ3VTZjJGNzJIMGhzaGI1RGYxZHF2UzFSNlhTVlR2N1VrK3NOMk5MaTR5?=
 =?utf-8?B?QTk0V0hKbWo3UWpyaDBrVWJZVXZVc080Y2RVU3VYTU9NVzI0ODdFMkpENWdZ?=
 =?utf-8?B?cHQxaGIxWk9ZVHRVYjQrWmJDWDAyWFRNeTQ1YVhDL25HcloxNVFSWHJQOGwv?=
 =?utf-8?B?QWpXeTdHVW45aklwUno1S3BMamFoenlHQnRjQVNDa1Q3dlF4bjB2U0ZzSkxi?=
 =?utf-8?B?M0k5N3RpSWhWajByMVpleFVKVlFRVUJqTEtIcW9uUnFmVHlicVA0QkRGTHc5?=
 =?utf-8?B?VnlUVm80ZDcwYXdlNG1JWitta0JGUmt0L1F3ZzFRVDhXdTBOUTFudjUrR3E4?=
 =?utf-8?B?NExNYytRcUczSEtNdGZNdGtTQ1NmTDlvMm1DYzNmdE0xTllqQnM4eFdDMHl5?=
 =?utf-8?B?dVp2MEdPeE93UDAzUDJUZVVjZmdvMHM4LzdYajN1YjQvVGtaZ2c0U09zMXFr?=
 =?utf-8?B?Z29rMkhwLzE3eVlmQkkyb25mY2t4UEc0eWQweGU5b3FreXBic0tMRjBLN0JY?=
 =?utf-8?B?TkJZbkhJUmR1N1JseVJWSUpWV0pVdE52WWtYb1lQNEkwQ093eXRmZi9SZXNk?=
 =?utf-8?B?VExrTjlaQ1ZyNnVJMGpLQU1iTHA5ZEVvZjZZUENZUE5TRHpHTTIzOXF2NXpm?=
 =?utf-8?B?MGo2R0JpMWlyc0ZWNURoUEUrWjh0Z0p3M0VPUmM2dDI2WkYvUHF5UzFuYWZj?=
 =?utf-8?B?cnlLVndBWE16QkhiT2gweVJKUEtYSFVzYk10Yk5aMHJwd2lpUlZuZlBoeEk0?=
 =?utf-8?B?UnFuU3BHa0s1UkREaWFCbE5FRDY2bXBqR3MzRWNhQ3ZyTGs4WG4wRUVTUjd2?=
 =?utf-8?B?TS9aOXZpQkk1b0UzMHZ0MTY5SlVJQnpWdFp0ai9RWWdsL3ZMZVNtaStYNm4v?=
 =?utf-8?B?dm5jL3FpODQ2ekZRNS8xUVJHK2t6OFk5ZDlrcEMvc3JEZEhCQjdqV21Senk5?=
 =?utf-8?B?V1BmYmZZN0ZRaFJPc3MzVThBbEFrQUVKcVYrV3Ira01UWDFzYzY1a0NFVWRB?=
 =?utf-8?B?QUkzV0YzZmRzaTVjWWpYOCtDOGo0Z3VqemhNaHFuT1grU2hKS0dJU0V6WWQw?=
 =?utf-8?B?SkxyWkVicWFOQ3o4S29YSVdSMnB6dExKZ2dVanNQRFlvVDJVaU5jcFdDUWRI?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f04f701-ae8c-4621-2bf7-08da6ab39fd2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 00:54:54.1106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKwjVK3SRuiE5eymxbmpr46guXXrEAZ0Dmc2Njo9WDm0bnEQgh02FgJvlZ8seMorLIjjlt+wzyjLefBTF3sUD2cmm1RvbX+ZJJpbHtPYdo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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



On 7/19/2022 02:42, Tvrtko Ursulin wrote:
>
> On 19/07/2022 01:05, John Harrison wrote:
>> On 7/18/2022 05:15, Tvrtko Ursulin wrote:
>>>
>>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>> Remove bogus GEM_BUG_ON which compared kernel context timeline 
>>>> seqno to
>>>> seqno in memory on engine PM unpark. If a GT reset occurred these 
>>>> values
>>>> might not match as a kernel context could be skipped. This bug was
>>>> hidden by always switching to a kernel context on park (execlists
>>>> requirement).
>>>
>>> Reset of the kernel context? Under which circumstances does that 
>>> happen?
>> As per description, the issue is with full GT reset.
>>
>>>
>>> It is unclear if the claim is this to be a general problem or the 
>>> assert is only invalid with the GuC. Lack of a CI reported issue 
>>> suggests it is not a generic problem?
>> Currently it is not an issue because we always switch to the kernel 
>> context because that's how execlists works and the entire driver is 
>> fundamentally based on execlist operation. When we stop using the 
>> kernel context as a (non-functional) barrier when using GuC 
>> submission, then you would see an issue without this fix.
>
> Issue is with GuC, GuC and full reset, or with full reset regardless 
> of the backend?
The issue is with code making invalid assumptions. The assumption is 
currently not failing because the execlist backend requires the use of a 
barrier context for a bunch of operations. The GuC backend does not 
require this. In fact, the barrier context does not function as a 
barrier when the scheduler is external to i915. Hence the desire to 
remove the use of the barrier context from generic i915 operation and 
make it only used when in execlist mode. At that point, the invalid 
assumption will no longer work and the BUG will fire.

>
> If issue is only with GuC patch should have drm/i915/guc prefix as 
> minimum. But if it actually only becomes a problem when GuC backend 
> stops parking with the kernel context when I think the whole unpark 
> code should be refactored in a cleaner way than just removing the one 
> assert. Otherwise what is the point of leaving everything else in there?
>
> Or if the issue is backend agnostic, *if* full reset happens to hit 
> during parking, then it is different. Wouldn't that be a race with 
> parking and reset which probably shouldn't happen to start with.
>
The issue is neither with GuC nor with resets, GT or otherwise. The 
issue is with generic i915 code making assumptions about backend 
implementations that are only correct for the execlist implementation.

John.


> Regards,
>
> Tvrtko
>
>>
>> John.
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>> index b0a4a2dbe3ee9..fb3e1599d04ec 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>> @@ -68,8 +68,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
>>>>                ce->timeline->seqno,
>>>>                READ_ONCE(*ce->timeline->hwsp_seqno),
>>>>                ce->ring->emit);
>>>> -        GEM_BUG_ON(ce->timeline->seqno !=
>>>> -               READ_ONCE(*ce->timeline->hwsp_seqno));
>>>>       }
>>>>         if (engine->unpark)
>>

