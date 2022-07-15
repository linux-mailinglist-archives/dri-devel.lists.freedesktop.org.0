Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B14575913
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 03:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A71C10F877;
	Fri, 15 Jul 2022 01:19:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDDA10F877;
 Fri, 15 Jul 2022 01:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657847991; x=1689383991;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zK4gNb1V45Yeiirq0drE5mTP+ZLCPFFAgYOkIApuLas=;
 b=D8AjravpyoIdYHIPjUMrAgzcOLhavNW45qiA8AHnPK9Hav3mAd9nOOyg
 XU/5b/sIONUxwmm5C8KCjxstw24g3tfu9dmLNg7RXjKs7wiDMlGrhQHjY
 UCRSaL2wF0wBVTOQbGZ/iU6tyYxn6CsDWNyHxu8qqnkqitrNEh3y3JJEf
 2T4y/UWmvpjsJXs1MNSyki02NYtxVMuZrz3sHQ/VtUbvEhf+bybSmKsAh
 A3DvlmXxMn9ZamBKQKzwco0pLxTZg3cFrt9LqhnJVjQUqhNmJEZKOQT+V
 llpqVnshdfBikKnSCPLsVZTtocJgyRECqAENaoIZqq776UGcZxuwE+t+R A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286413491"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="286413491"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 18:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; d="scan'208";a="600327360"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2022 18:19:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Jul 2022 18:19:40 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Jul 2022 18:19:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Jul 2022 18:19:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Jul 2022 18:19:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUm5Q6MhIuU3F2OUrC0P089+UipgXw8X6g6CrzOokE9GpDKqNupRzyFmbUO8/LqRhxWuU9FDqwLWyULxbeg7iT7qceqMoEFZQZDXeTVT7xM9hyIWLiTJ6CWuNDtAsTI5RCWRrW+MDFlEQ/td1QjEy4NdjsuRDC+ImjdVkJmkVc8Q1XkxnOWARGk+uvdYpzPsMwllpPyGgGiVymfnoRgm0nXy6kYFa2pXnOYKRX6X4F3roZEuhkHaGL0vXRhWFbVQDd2aHSJOW0QktvM0Ot2+FbvmM4xT/8MuDVooq9ao7X92IanJEFf6JcI7oo2bCB7FF7kZuiQm2+Tlfzpm353itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qh104ryI4gwY3aN9ZowAco7jX7d/keUuL+Z9S0paSZo=;
 b=MTRIvVwyWi5MbKw14KV4WpZxAhxlZperhum3ufJCLO8WsMQZ0iyE3A3AkTPIZKwYiRQD5ot41ZTyZuWBpfMlBQ4EFyl9soIJAdB6SfY8BQ2IWX2ktA6TMGhO/zBWGm18ohOq2pRUJeJXbgq5ffQixmQVXViWXyNK6m1OZq4itCQJC6bR+m3o276j2gM4ASxF3jsKZ9N9VoEfC/Wx2anc6ObAIWsmCv7JlwORfv712F+UB4F6iX7/utlDpIVcA3RJ1WRr84nXoYxemU/QE2Xk49bAjRJSoC1ctv0xAPZwYwxk5b0ua0bfGrEtFqoDbBy+H/bSW2GMsb3Rpd3lPnjUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH2PR11MB4245.namprd11.prod.outlook.com (2603:10b6:610:44::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 15 Jul
 2022 01:19:36 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 01:19:35 +0000
Message-ID: <2c1543d4-f358-e695-6cc6-6eccfc06af39@intel.com>
Date: Thu, 14 Jul 2022 18:19:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915/guc: Don't use pr_err when not necessary
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220715004028.2126239-1-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220715004028.2126239-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa1639b7-ea5d-48fe-9e5e-08da66001472
X-MS-TrafficTypeDiagnostic: CH2PR11MB4245:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wmpp+fzlvKSyNEjx71qkL7I9yQF0ptp2BzEfofoIxFSZpNf++mVLKyqokr69L0B5bjC5Z8DHoI7uetulwGIsRI9T/w3SZ0d9xzxSXLKikC4L89gl0ioQKcAkNyQ5bFMer6lu08JT944I2S6/Ibv1e+Ae/Np8TMBuKTz/kbbh56weN9GbirbGQftGoftwDvRxrTi9h1V5Qu3+yWtBKc/iwMOA4mB0eBGPKRezhn5UvjD6KqLRaR9nKvoobOwm3GCUGjvp96TrAZk6HvWw4vQc/oW43goEk2X5MbdqVFkYgp2UcVzHEruFGwnobtBfprjQv6Pu3yS87zfGMRuWnnwG6O6AuqxvG9B8it+4sc6SK/9Om5rXwUsr6Xu4CzUNqaBpQTLuOnTJc+gundXpHXSICMg4QU20oZltn56VjoS3Y2Qr3hiAVdhtzCmrs7DpodJ/R899InEfAi8HQhqmwLBQhP8YdKzs+a/xh3BHpswT9klZcNFxjVX2QY6EFNHVSVX15KVWciU2/5A3RNHjU/27zDDe1g7Gs3jk/4zq1mnE81oRAaLKDNf+ph5sootn+20CNXOHRkFD/ELzhUF3JCFT+YusSSLirgCGlo33PwlQOtiK1tsWTtOL2TH+tgfAzwI1va5d9rsNX513FdeRVfaBPcrhvCJLIHMD2uY/D19+qgdy982a8TyBMLPO2SeSbPOCMMz2oe0vV67a68ju+FADcnqGrV9MKkZMXov4g+nGA6RfpUSWXPWfOARAn72dJfYBz9Xsfiemp/jZrn9ofv12h41OpksE6eYUe9WivXf5pwBQ78bQw8vp35BV1zO02FrkLxIJE1iykOwMODPOCTaEY0qDFQ4XZJOfwGKsj2OhljK3aEY9oS5ajwuyLrbakdEXQIeRg5svQX3fJcoWqFmDVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(136003)(376002)(39860400002)(366004)(31696002)(31686004)(83380400001)(5660300002)(86362001)(36756003)(6512007)(38100700002)(26005)(82960400001)(450100002)(53546011)(66556008)(66476007)(6506007)(4326008)(6916009)(6486002)(41300700001)(8676002)(2616005)(2906002)(316002)(186003)(478600001)(66946007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RldaUkVpREdpTUxGQnhxZ3cvQXA2YkI4K214R09UTGtSNU9GSlMvWTczT293?=
 =?utf-8?B?R2s1L2hsLzNBMytZdFZ3RjlKSW92NG5sZzlWWDc3MzNRTHFrSmNqRVc1cXA0?=
 =?utf-8?B?RnRxdWJCZTZMVWFRb1JyN25jRUpWSEpSMk0yckxaMy9Jbk9wazk2dDJlaVBW?=
 =?utf-8?B?TjNtL0tjVFhTYkhDR3RyK1U1c0NITytneFo3MEJPS3BCUm55M1BpdWkxaWJF?=
 =?utf-8?B?R1VDaWprNzVyR2xHbXlnbXRkS3RZSEc5THlrTEMrMi9nUTNvYWMzNnVQdE14?=
 =?utf-8?B?Q1YxN1J6VWZieFFrdzVNY3VIVEFuOHAveFo1RXgyZjFTYVNKLzNvMklvemx5?=
 =?utf-8?B?UlFHWGU3cm01aUhtZGF0U2hpUWxnK1BJSW1lcHloVDhTcE5IelpSeGtwMTN3?=
 =?utf-8?B?Z0E1M0V6NkZ2VFFKYnFtOGJJemhJMTVsNXRxUnVqNEJYUDdCMWJxSytMS0lj?=
 =?utf-8?B?WFVzMURZQlZsaVh2YmQ4SkhIdVFDb2VMZE42KzhjL3FQenNxSGRtZmx6M1Ns?=
 =?utf-8?B?MHFadzZrQ3pMdmZJQlZQeG0wQnJnbENMTzZkd3h3N25YelkvajYraVpqdkZW?=
 =?utf-8?B?L1hSYkJuOTRHeWtGc201ZllCRHowNGd4K0dLU3JDNmsxRGVyd295Ym9FSkRV?=
 =?utf-8?B?eGt1ZjU4ZDVCMkl5WVhBeDVjV0VUSXNjNUF3OUpQNmV5dXIzVDRseFM2UzVW?=
 =?utf-8?B?WkdtTERTcjhDNE9vSkZSMHZCT1BuNXdITlBZb3lTSUlpQXBJYXhIR1pIazdN?=
 =?utf-8?B?V0hwV2twV2pmOXQ3VkEyYTFYY1g4K1g5Z0JwaGs0dm0xQXcxNFJlSEJiVTBm?=
 =?utf-8?B?Z0F0eHdFelhxTGg0VVJ5MDVyV2pDYUdmekx5KzFBODZHVy9SZEllZGZ0UWU1?=
 =?utf-8?B?R1c3bzlLTGcyMWt6Szh6SzlhNU15R1VQcGxzeGJGRUJVL0F4eVFEQStmYnBU?=
 =?utf-8?B?cTRmckt5d01NWnZZMzNOUDRPSEJNUURZNEpNY2ZQWVBDMVliellsc09TNmRE?=
 =?utf-8?B?WEtmWjljTUZsa0RQQnNXb1ZQNkRPbWxjTHovL0c4c2IvaXM3S3JpTnBwYStI?=
 =?utf-8?B?bW5lVmtjSmlkV05IRFovYWNhVUk3SkY2ZkFkV3JwTU5oclZuOHRWV04wTTVC?=
 =?utf-8?B?Rm1SUHJ1aWtRWUpNbVlMcmNwNzl0WCtFaEplZDRmU0Z3LzNTaXh3dmYzVWpJ?=
 =?utf-8?B?cWNTNHA2WWMvcWZTZmQvS1FYRi9KYW9pZ3pIUWVKRFoxMzZnYmp0ZjZpSEtB?=
 =?utf-8?B?a25WUnJsWFV2aGJHK2IzeG5zNUhkUXNabUZlU2NJT2NZMHJYQU13akwwZzlQ?=
 =?utf-8?B?MlhzcHZoYlM4OWhNbmsraHY4L3E4dzR2U25mQlBnbzRmRitUMy9GY1hmSkhV?=
 =?utf-8?B?Snk3ZXdWQzk5K0lPYXNUSFVRYllBSjhhaEFFOWx5b3MxTTh4dlQ3NXpEYmNW?=
 =?utf-8?B?SkNDdzRyM2ZydTJ2R2VnUVMwNDR0VEtwQ0hJNlFkRnFIeFpVYXR1WWtNZ2Fw?=
 =?utf-8?B?Q2lXT1JaWTc5VjdJUnBZa3k2aU81V3BTT3Y1ZXgvR0RyM0ppSUF5L1g5TnRY?=
 =?utf-8?B?REVTU3RNbGFhdnE1VzJsUHAzK21uU1BabjVJL3RFR1JxMDA3U3ZZcktRbGRv?=
 =?utf-8?B?NDB5OCtNSGF1N3ZRcVROd2gzeDZvU1ZuV3UzNjFaZ2svYnRxbXZEN0R6MU1m?=
 =?utf-8?B?RVRQNkc4TzFTblhmaElWNHIvd3BycWx4VFYvUWJpeEQyZVdnWUViaVhYVHJ2?=
 =?utf-8?B?c0RBdGl0M2JuY1lxb21NeElTalFMUmM2S3E1K0dUMjNiUllBUjF1UWRZTkwv?=
 =?utf-8?B?QkZSQ1Z2U2FuTE4xcWNGcytkbCtmbytoYldkOHZEL3IxODNuNFR3RzNTbWRW?=
 =?utf-8?B?NW8vOWZvNHV4QVRoRWZvN0c2SUxVYWJRY3N5VithdzMxa1MxMDBSSm83Skg5?=
 =?utf-8?B?alJQZzJHVVRqOFVGd00yTExiekZrczI5ejJHTDJJRTNRRnUxWXlZeUYrd2po?=
 =?utf-8?B?ckdKaUZWd1lDVGMvbUVZN1d4R0pWWENodFZweGxzN1ZKQzlOQU5aOUw3SXBM?=
 =?utf-8?B?Mi8xRHA1RHBBcTFOeHNNdmcxSEtrMFBmWXEvWklNUHA5VldVUDRUd01DZVFJ?=
 =?utf-8?B?cmI5Sk1DbVV4YXJKWkZxNXRRNHY5MzdHcnFSdmhxRUdrVW5mZnVucWoyV1Q1?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1639b7-ea5d-48fe-9e5e-08da66001472
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 01:19:35.8716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85h4AUx2dgR102DriFLPB6Sbo7FdaETvhRt3rqvj9YKfebB1EZLpI8XGGG9DkcHOiMqWki+8I7mG1jw4rzuxhT/omzqVn+1Odq0e5yJHipc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4245
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

On 7/14/2022 17:40, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A bunch of code was copy/pasted using pr_err as the default way to
> report errors. However, drm_err is significantly more useful in
> identifying where the error came from. So update the code to use that
> instead.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
PS: Forgot to include the r-b tag from the previous post of this patch. 
Only change to this one is fix the last minute drm_debug to be drm_dbg 
and word the the commit message a bit better.



On 6/7/2022 15:25, Dixit, Ashutosh wrote:
> On Tue, 07 Jun 2022 15:23:17 -0700, John Harrison wrote:
>> On 6/7/2022 15:07, Dixit, Ashutosh wrote:
>>> On Tue, 07 Jun 2022 14:51:03 -0700, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Don't use pr_err in places where we have access to a struct_drm.
>>> Seem to be many more pr_err's in selftests. Is there a reason why drm_err's
>>> cannot be used in selftests (especially those using an i915 device)?
>>> Thanks.
>> I figured I'd start small and just do the gt/uc ones to being with as those
>> are the ones that affect me.
>>
>> It sounds like the only reason to use pr_err is in the mock selftests where
>> there is no easy access to a DRM structure. For everything else, there is
>> no reason that I am aware of.
> Fair enough:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>



> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++---
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 37 +++++++++----------
>   .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 10 ++---
>   3 files changed, 28 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 27363091e1afa..19fde6bda8f9c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -195,11 +195,11 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   			    fw_blobs[i].rev < fw_blobs[i - 1].rev)
>   				continue;
>   
> -			pr_err("invalid FW blob order: %s r%u comes before %s r%u\n",
> -			       intel_platform_name(fw_blobs[i - 1].p),
> -			       fw_blobs[i - 1].rev,
> -			       intel_platform_name(fw_blobs[i].p),
> -			       fw_blobs[i].rev);
> +			drm_err(&i915->drm, "Invalid FW blob order: %s r%u comes before %s r%u\n",
> +				intel_platform_name(fw_blobs[i - 1].p),
> +				fw_blobs[i - 1].rev,
> +				intel_platform_name(fw_blobs[i].p),
> +				fw_blobs[i].rev);
>   
>   			uc_fw->path = NULL;
>   		}
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index 1df71d0796aec..20e0c39259fba 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -62,7 +62,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>   		ce = intel_context_create(engine);
>   		if (IS_ERR(ce)) {
>   			ret = PTR_ERR(ce);
> -			pr_err("Failed to create context, %d: %d\n", i, ret);
> +			drm_err(&gt->i915->drm, "Failed to create context, %d: %d\n", i, ret);
>   			goto err;
>   		}
>   
> @@ -83,7 +83,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>   
>   		if (IS_ERR(rq)) {
>   			ret = PTR_ERR(rq);
> -			pr_err("Failed to create request, %d: %d\n", i, ret);
> +			drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n", i, ret);
>   			goto err;
>   		}
>   
> @@ -93,7 +93,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>   	for (i = 0; i < 3; ++i) {
>   		ret = i915_request_wait(last[i], 0, HZ);
>   		if (ret < 0) {
> -			pr_err("Last request failed to complete: %d\n", ret);
> +			drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
>   			goto err;
>   		}
>   		i915_request_put(last[i]);
> @@ -110,7 +110,7 @@ static int intel_guc_scrub_ctbs(void *arg)
>   	/* GT will not idle if G2H are lost */
>   	ret = intel_gt_wait_for_idle(gt, HZ);
>   	if (ret < 0) {
> -		pr_err("GT failed to idle: %d\n", ret);
> +		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>   		goto err;
>   	}
>   
> @@ -150,7 +150,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>   
>   	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
>   	if (!ce) {
> -		pr_err("Context array allocation failed\n");
> +		drm_err(&gt->i915->drm, "Context array allocation failed\n");
>   		return -ENOMEM;
>   	}
>   
> @@ -164,24 +164,24 @@ static int intel_guc_steal_guc_ids(void *arg)
>   	if (IS_ERR(ce[context_index])) {
>   		ret = PTR_ERR(ce[context_index]);
>   		ce[context_index] = NULL;
> -		pr_err("Failed to create context: %d\n", ret);
> +		drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
>   		goto err_wakeref;
>   	}
>   	ret = igt_spinner_init(&spin, engine->gt);
>   	if (ret) {
> -		pr_err("Failed to create spinner: %d\n", ret);
> +		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
>   		goto err_contexts;
>   	}
>   	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
>   					     MI_ARB_CHECK);
>   	if (IS_ERR(spin_rq)) {
>   		ret = PTR_ERR(spin_rq);
> -		pr_err("Failed to create spinner request: %d\n", ret);
> +		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
>   		goto err_contexts;
>   	}
>   	ret = request_add_spin(spin_rq, &spin);
>   	if (ret) {
> -		pr_err("Failed to add Spinner request: %d\n", ret);
> +		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
>   		goto err_spin_rq;
>   	}
>   
> @@ -191,7 +191,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>   		if (IS_ERR(ce[context_index])) {
>   			ret = PTR_ERR(ce[context_index--]);
>   			ce[context_index] = NULL;
> -			pr_err("Failed to create context: %d\n", ret);
> +			drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
>   			goto err_spin_rq;
>   		}
>   
> @@ -200,8 +200,8 @@ static int intel_guc_steal_guc_ids(void *arg)
>   			ret = PTR_ERR(rq);
>   			rq = NULL;
>   			if (ret != -EAGAIN) {
> -				pr_err("Failed to create request, %d: %d\n",
> -				       context_index, ret);
> +				drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n",
> +					context_index, ret);
>   				goto err_spin_rq;
>   			}
>   		} else {
> @@ -215,7 +215,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>   	igt_spinner_end(&spin);
>   	ret = intel_selftest_wait_for_rq(spin_rq);
>   	if (ret) {
> -		pr_err("Spin request failed to complete: %d\n", ret);
> +		drm_err(&gt->i915->drm, "Spin request failed to complete: %d\n", ret);
>   		i915_request_put(last);
>   		goto err_spin_rq;
>   	}
> @@ -227,7 +227,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>   	ret = i915_request_wait(last, 0, HZ * 30);
>   	i915_request_put(last);
>   	if (ret < 0) {
> -		pr_err("Last request failed to complete: %d\n", ret);
> +		drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
>   		goto err_spin_rq;
>   	}
>   
> @@ -235,7 +235,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>   	rq = nop_user_request(ce[context_index], NULL);
>   	if (IS_ERR(rq)) {
>   		ret = PTR_ERR(rq);
> -		pr_err("Failed to steal guc_id, %d: %d\n", context_index, ret);
> +		drm_err(&gt->i915->drm, "Failed to steal guc_id, %d: %d\n", context_index, ret);
>   		goto err_spin_rq;
>   	}
>   
> @@ -243,21 +243,20 @@ static int intel_guc_steal_guc_ids(void *arg)
>   	ret = i915_request_wait(rq, 0, HZ);
>   	i915_request_put(rq);
>   	if (ret < 0) {
> -		pr_err("Request with stolen guc_id failed to complete: %d\n",
> -		       ret);
> +		drm_err(&gt->i915->drm, "Request with stolen guc_id failed to complete: %d\n", ret);
>   		goto err_spin_rq;
>   	}
>   
>   	/* Wait for idle */
>   	ret = intel_gt_wait_for_idle(gt, HZ * 30);
>   	if (ret < 0) {
> -		pr_err("GT failed to idle: %d\n", ret);
> +		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>   		goto err_spin_rq;
>   	}
>   
>   	/* Verify a guc_id was stolen */
>   	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
> -		pr_err("No guc_id was stolen");
> +		drm_err(&gt->i915->drm, "No guc_id was stolen");
>   		ret = -EINVAL;
>   	} else {
>   		ret = 0;
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
> index 812220a43df81..d17982c36d256 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
> @@ -115,30 +115,30 @@ static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
>   
>   	parent = multi_lrc_create_parent(gt, class, 0);
>   	if (IS_ERR(parent)) {
> -		pr_err("Failed creating contexts: %ld", PTR_ERR(parent));
> +		drm_err(&gt->i915->drm, "Failed creating contexts: %ld", PTR_ERR(parent));
>   		return PTR_ERR(parent);
>   	} else if (!parent) {
> -		pr_debug("Not enough engines in class: %d", class);
> +		drm_dbg(&gt->i915->drm, "Not enough engines in class: %d", class);
>   		return 0;
>   	}
>   
>   	rq = multi_lrc_nop_request(parent);
>   	if (IS_ERR(rq)) {
>   		ret = PTR_ERR(rq);
> -		pr_err("Failed creating requests: %d", ret);
> +		drm_err(&gt->i915->drm, "Failed creating requests: %d", ret);
>   		goto out;
>   	}
>   
>   	ret = intel_selftest_wait_for_rq(rq);
>   	if (ret)
> -		pr_err("Failed waiting on request: %d", ret);
> +		drm_err(&gt->i915->drm, "Failed waiting on request: %d", ret);
>   
>   	i915_request_put(rq);
>   
>   	if (ret >= 0) {
>   		ret = intel_gt_wait_for_idle(gt, HZ * 5);
>   		if (ret < 0)
> -			pr_err("GT failed to idle: %d\n", ret);
> +			drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
>   	}
>   
>   out:

