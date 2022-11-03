Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA16187DC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 19:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06C110E7C1;
	Thu,  3 Nov 2022 18:46:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5549810E7BE;
 Thu,  3 Nov 2022 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667501163; x=1699037163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I/r+xOTjeCB3nLYC0hEO/FUk/x7F26Bfb77vCQqATZw=;
 b=FrsR+2Ul3UU0Dr4OrqLJZqE7/Do1RJxc0iY7PRsAf6NuQGeLPYQS0o7F
 /XSjmeubK9xWD+V2AAah7zsSwgQjtOkfgz4Qm09b59hYdRM86dNyt7qTP
 7HgRK3ckfd5ZFHlULPBNCZUVa5vlCGsVBVCmBtwshVzaJSCvEZek32dRZ
 VRI0DfXWfZfUTTtMPhzNDQIqHO7DP0TxuDDHmCKLqpbp9JUtNjmDlIESV
 p0CJVQMVeu88qmLTKepYi1St8kX0EUlt+t6WPZ69PFIdHMSz7+VOOXGKa
 Cv7TQ0/3qvyP9GEV9kDjhY+MG++3i99NdRER2TeETd4IFiT8HlDEnGysS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="289491339"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; d="scan'208";a="289491339"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 11:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666077426"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; d="scan'208";a="666077426"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 03 Nov 2022 11:46:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 11:46:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 11:46:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 11:46:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 11:46:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtYqOXiZ19Wvq5cdQSycSFOUjrxZ2eiKaQLE4CH9zuw0pKFeaTwvTmlGaKlUXI3EkSei0VBTrUEzXSqmuKoi93Hn2ODg8cEfgHZQ6TQgXLxTWZdJNtSITVKWlWlLaBXxlOqhbFtWVdRP15v5oTBy/IUjM2R25zKMfjlNJoC9UP38SZQBRsTIuz1mbUASfkMXdwDEjQGuDtXSnKR6R6OjhwO4faYmU8sGroWqiAfIcHWKF7Cxakr93crjcDu8bdOStKUAAqyAO7uv1abyygeq7DWfUgBuhwGpe2ALxpfrTM1RiO6Uk0d4t7ya4TfH8BKvEnGa/MytNo5DPGsA/EyBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iilsHKNP6gKmGTAwLw6ylqM0U9tB9Fz/DSTtqnKz0Lw=;
 b=ThAKj5CnIf50Cx4PfpDFRXW11O3X0ZPhkvyY3tfYo/OFE380XkbpiIPUCvyfjTbmMzFw0kuUC1bJAiWo0nsCraviYRzjB2QG/Hg9LmAGLBaO8wFSXpA8dooE/AKOtuSaJzf2fk1nbdHqgVe1oWvQ09YrsXuKYuGGPfhsf/LX7rpvSA5iMV/A5HcJNa7uphJG0B3ruISj8l34SlXHkCd91d0LnW3N8BH+AJoqAKHiPhuoHu19wSFhxr6vq9goig/Yex4TpRKmz1O7bXa0p9cMAndkIsEs+MPfOgp9b+zSKzkMOl35cUFyXeqJlHj7WyePALkpBlBIf9tWteoVrl6p6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 18:45:59 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 18:45:59 +0000
Message-ID: <989a06f7-9b27-cdf3-c521-60156c78f0ca@intel.com>
Date: Thu, 3 Nov 2022 11:45:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/guc: Don't deadlock busyness
 stats vs reset
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
 <20221102192109.2492625-3-John.C.Harrison@Intel.com>
 <46b26193-8f46-af55-c152-b43839087ea4@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <46b26193-8f46-af55-c152-b43839087ea4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 493e526c-987a-438b-b5fc-08dabdcba60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9mW7AJZNTm67Sp9Cri3iF6+ugKR9u2fVvLCjXMgpAkN2XvqeBlGlCoAdgFX8UIml3WFb8l6qhekEMs+7eO3exiYyLB6gVzjRR/s4DbNi/m8Vt223yIN8tw2zKnDGuZ1J0q5HOzlaQKjneHnCRW/8sn1c+5q+PZAyxZ3ZUnyPNyCKR6af6AmKYTwe/3PlgCPBLaLbRnhHjOWGjjPuxIg8fUq3l3JVDbWODH6N7c9YC+jhJTxMKiABEWEHEHwylLcydS5Q9nFWyiQnX1FZSPIdlKXrXs2RVhFyleS2M7UMrs2soxFSM/Cqfv8S0jb/+2pn8dEMZOaRtoaqUB610pQ2eU7WKyD/+PTJEj8nsEo9h0tWfwBYIZZDT3KYZRiYVq3YFireDue+jnOgXHj4B+dzdIchKeiU8Z2H7jN8s7vaKzcdW+n1bWUbCCBmaWqTj7DK+GTRVOo9usBDpC/PFfE+HtJrVvTtmA6RgSPZjV69IL3jE8B2vbnZosrhFu/WN7buk2krpNp6K1JCXmkgeHFWdcRgMgNazsOapM6R77IS75WY8SmE6Xgrnyc+6z7HVuQFvzndCZSIVaNvf3FU/EC980JZupa/5SMUdqTLk7BF9kstUs/DUEnY0pAMBmluXqXSIdqS1XKna0o+kb4x/5VayIaZlOfbDg3zx5KqH6k2DVXvSBiVWWEAWh241BfWYSBMpEiXdsPOvGg8G8jugG9rj6qTmu1mpvFIX+k6wjn7axOJ5TMMFanywuMHfhwP8HsM8vfCDI2nKsTIDHuFn6OxM/rVZncG4WUkdu/v3yuqw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(478600001)(31686004)(6636002)(53546011)(6506007)(316002)(66476007)(66946007)(4326008)(110136005)(8676002)(66556008)(6486002)(82960400001)(38100700002)(5660300002)(41300700001)(8936002)(26005)(6512007)(2906002)(36756003)(2616005)(186003)(83380400001)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUZIaUlZbmlkTmJtS3o2dGhOQ0pXa3dJaEgxc29tQlh0Wks2ODZyMEIxWTUw?=
 =?utf-8?B?SEpDSVE2akhRNVU5OEtTemdxcmNYY2UzbnB2cVJ1L20vUVFHOE1yRm55Q2h4?=
 =?utf-8?B?TXQ1VHVpeVkxWlZkYXRwdEFmMTVHT28vWEdpRlRxQm0yYjN3S2k0Nnk0clJH?=
 =?utf-8?B?WmxURGNaOGFjbVlCL3lrN0pBMDJMZkN6VVJyYUZRY2hpVUtSY3E5WEZwTzVv?=
 =?utf-8?B?UjNBWDgwMUV4alQ2NGhQNU1IYktObTg2RjJ5eDQ4dFdaKzZHUElIOWFIVmlR?=
 =?utf-8?B?aTBoVjRFdW1jSTVxVEcxSjh0aVhJZUxvRlo1aEJJWWhPTDJFQ0JTWnNYR2tq?=
 =?utf-8?B?bVUrY3NDa1FhMk9hR3RYZWtKb1NMSXZCKytkWUJmUzZVODRPZ0ErSU9zRHph?=
 =?utf-8?B?b2NaTktHY3lmVG1QMUdWV3RJbzhNaDJFb3JjcDZaRmRnV1VaKzVqMndzdk1B?=
 =?utf-8?B?RjBBQmY4VUNZWjJZQlMwanJacFlwSGIxVkNVQmdtQkVKT1VwTXpLZ3pjcnBD?=
 =?utf-8?B?Q0l0MEhSc2RHa2hjK0R4NmhRZ1FkUzVWc0Y0OGh4ZzFOT0FqL2pzSDU5Mi85?=
 =?utf-8?B?RUVzSE5Yd3hBSjQ1KzNUL2t6U0NmUktRVXVyOWM0WVhKSlNzRDA3cDNpR0Q2?=
 =?utf-8?B?eFgxRzVTS3pGLzZnVjEvZ1hqYXl1WXV1WjcwUmpPUTllWnhoWE1qYlFkcGE0?=
 =?utf-8?B?QmpnUHhiTkVOZkVTdCsxNG5RT1d6bm1xeWxkUVpobEZDdlFGeS9hZTRrSGYy?=
 =?utf-8?B?QjFEZkFRbEJpWjhlMENFUlo3ak5jR2VLdkhLblBMOEk2ZFdBcTJUdU4zaW4w?=
 =?utf-8?B?MjhWTDVadEhWaWpudStkemthVElieE1mSUl0U3VuaHVuZE9UL3lWRjN4QXZz?=
 =?utf-8?B?eWRYTXFaTndFc1llV0FBNzhreWxGc280NDBVWCtQRlBvOERHQUJLWkRJeVpp?=
 =?utf-8?B?NHQ1SzdUYnpVYmxTT0VTd2U2ZXE1QlNITUdnL04wcjJ3OTZkUFpocW9KeUg3?=
 =?utf-8?B?M1V6aGFVeks2RUxVR2NyYnFoa3l5K2krRitkOHVGVVhyK3E5VVFNOWJkTndH?=
 =?utf-8?B?RjNqbWk4L01GYWR5cnFYMnFSVloxc3VBcGpIWm1CTG1uM3VkYjd5K3R6Y21y?=
 =?utf-8?B?c1luMFl6c3d2TlFiZDFtTGhPWXJGbnZVYndwWVd5NVVROWlFSUlyK2N1MlFw?=
 =?utf-8?B?WXRoa0VTcUJEVVBac3NqOGlqN2JWZUxZVTdpdVpmMStzcFJkcGpncitYNkVM?=
 =?utf-8?B?MHlST2VJblJiNmpET25sTXE0RWEveEg4NkhFM295amNRMWIrM2FRcWJiTjRk?=
 =?utf-8?B?RlY4eHNrRmlFelorRmE0K2ZweWJaK1ZCOUFrbS9ub2U5Zm1jTHJOdE9DOUlq?=
 =?utf-8?B?ZUZGOFlIM0p3N2JMeUc5TE9sOXMrTVdBeVhpWit6akpvQ0M1NGo2d0JodFVS?=
 =?utf-8?B?eHY2N2ZMcVFaUDJtTWkzSVA1VjdCNTBvcjZPSWhFZ1ptZU5zMnFic3Foc2lV?=
 =?utf-8?B?Qi9jR3ZYM3V1QTcyMjFYZ0pwVXJHMzEvRnMzcnRCM01kOUxsNThPeHZRVjB2?=
 =?utf-8?B?VENzTThtS2JFUmdTVU5MQVJ4UHgrRzR1RUdtSFp4K3ZjOW5ua2txd3RDdHhv?=
 =?utf-8?B?RmFFTFJQelUzQ3lhaGVzVFZaZkx5bDZoZ1dHenkveHVuQ3lVK3p5Wmw2bmFS?=
 =?utf-8?B?Z3FjK3RnZnlSdDZKUm96T2NvMnNObDVOSXYwWUYvZlFFTXprZGp4T3dTZHpS?=
 =?utf-8?B?NmVRb1FZVHBNRENjTk5nUkt0M3FORm93Vi8wdWRxQUhJbGRRMTNVYVVkUFNr?=
 =?utf-8?B?RG05R0txcWNMcE0yM2NNQ0hqRWtWS2MzVjVadzFiTS84K2Rza0FkcDZEUHJl?=
 =?utf-8?B?Mk5yWFVRNHBPcHNuQi83NEljZTV3UDl5RmhjanFKRExIdUdXRkhIZGhTekRx?=
 =?utf-8?B?TzJlclZCbi8wN0hVUy9iSFlqNHFsbXl6UVVSQnFLL0tubU9LWDZwQzRHcm5w?=
 =?utf-8?B?TWVrbVdmYWQ5SFUzeWdBR3gvMCtsOGtYdWtWdnhPN3lVSkxBK1BPeHNTN2FW?=
 =?utf-8?B?SHVpNjJOdFJMZU9LTUdHbEFsSFZJWDBicXBIbTd1K0h6a1Rka0FHdXloL3Vy?=
 =?utf-8?B?LzJmMGxHOGE4OGIwQitHUUlEZlVUYVgreHZ1bWVPU1lzdG9MUURXZ3FKMUl5?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 493e526c-987a-438b-b5fc-08dabdcba60e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:45:58.9276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH7EOI0RIY/bYBGRBQLcxaizskGwYMasJ+HG7v6QnX0jOEAMo0/wgrOXitbAuEezcnLgk0bAXCIV2yuvhxWfn/GWTO+Uf83iAEtaMd9gNnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
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

On 11/3/2022 04:31, Tvrtko Ursulin wrote:
> On 02/11/2022 19:21, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The engine busyness stats has a worker function to do things like
>> 64bit extend the 32bit hardware counters. The GuC's reset prepare
>> function flushes out this worker function to ensure no corruption
>> happens during the reset. Unforunately, the worker function has an
>> infinite wait for active resets to finish before doing its work. Thus
>> a deadlock would occur if the worker function had actually started
>> just as the reset starts.
>>
>> The function being used to lock the reset-in-progress mutex is called
>> intel_gt_reset_trylock(). However, as noted it does not follow
>> standard 'trylock' conventions and exit if already locked. So rename
>> the current _trylock function to intel_gt_reset_lock_interruptible(),
>> which is the behaviour it actually provides. In addition, add a new
>> implementation of _trylock and call that from the busyness stats
>> worker instead.
>>
>> v2: Rename existing trylock to interruptible rather than trying to
>> preserve the existing (confusing) naming scheme (review comments from
>> Tvrtko).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c       |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_reset.c          | 18 ++++++++++++++++--
>>   drivers/gpu/drm/i915/gt/intel_reset.h          |  1 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c  |  4 +++-
>>   4 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index e63329bc80659..c29efdef8313a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -330,7 +330,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>>       if (ret)
>>           goto err_rpm;
>>   -    ret = intel_gt_reset_trylock(ggtt->vm.gt, &srcu);
>> +    ret = intel_gt_reset_lock_interruptible(ggtt->vm.gt, &srcu);
>>       if (ret)
>>           goto err_pages;
>>   diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index 3159df6cdd492..24736ebee17c2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -1407,15 +1407,19 @@ void intel_gt_handle_error(struct intel_gt *gt,
>>       intel_runtime_pm_put(gt->uncore->rpm, wakeref);
>>   }
>>   -int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>> +static int _intel_gt_reset_lock(struct intel_gt *gt, int *srcu, bool 
>> retry)
>>   {
>>       might_lock(&gt->reset.backoff_srcu);
>> -    might_sleep();
>> +    if (retry)
>> +        might_sleep();
>>         rcu_read_lock();
>>       while (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>>           rcu_read_unlock();
>>   +        if (!retry)
>> +            return -EBUSY;
>> +
>>           if (wait_event_interruptible(gt->reset.queue,
>>                            !test_bit(I915_RESET_BACKOFF,
>>                                  &gt->reset.flags)))
>> @@ -1429,6 +1433,16 @@ int intel_gt_reset_trylock(struct intel_gt 
>> *gt, int *srcu)
>>       return 0;
>>   }
>>   +int intel_gt_reset_trylock(struct intel_gt *gt, int *srcu)
>> +{
>> +    return _intel_gt_reset_lock(gt, srcu, false);
>> +}
>> +
>> +int intel_gt_reset_lock_interruptible(struct intel_gt *gt, int *srcu)
>> +{
>> +    return _intel_gt_reset_lock(gt, srcu, true);
>> +}
>> +
>>   void intel_gt_reset_unlock(struct intel_gt *gt, int tag)
>>   __releases(&gt->reset.backoff_srcu)
>>   {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h 
>> b/drivers/gpu/drm/i915/gt/intel_reset.h
>> index adc734e673870..25c975b6e8fc0 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.h
>> @@ -39,6 +39,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs 
>> *engine,
>>   void __i915_request_reset(struct i915_request *rq, bool guilty);
>>     int __must_check intel_gt_reset_trylock(struct intel_gt *gt, int 
>> *srcu);
>> +int __must_check intel_gt_reset_lock_interruptible(struct intel_gt 
>> *gt, int *srcu);
>>   void intel_gt_reset_unlock(struct intel_gt *gt, int tag);
>>     void intel_gt_set_wedged(struct intel_gt *gt);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 941613be3b9dd..92e514061d20b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1401,7 +1401,9 @@ static void guc_timestamp_ping(struct 
>> work_struct *wrk)
>>         /*
>>        * Synchronize with gt reset to make sure the worker does not
>> -     * corrupt the engine/guc stats.
>> +     * corrupt the engine/guc stats. NB: can't actually block waiting
>> +     * for a reset to complete as the reset requires flushing out
>> +     * this worker thread if started. So waiting would deadlock.
>>        */
>>       ret = intel_gt_reset_trylock(gt, &srcu);
>>       if (ret)
>
> LGTM but I don't remember fully how ping worker and reset interact so 
> I'll let Umesh r-b. Like is it okay to skip the ping or we'd need to 
> re-schedule it ASAP due wrap issues? Maybe reset makes that pointless, 
> I don't remember.
The reset is cancelling the worker anyway. And it will then be 
rescheduled once the reset is done. And the ping time is defined as 
1/8th the wrap time (being approx 223 seconds on current platforms). So 
as long as the reset doesn't take longer than about 200s, there is no 
issue. And if the reset did take longer than that then we have bigger 
issues than the busyness stats (which can't actually be counting anyway 
because nothing is running if the GT is in reset) being slightly off.

John.

>
> Regards,
>
> Tvrtko

