Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1971D4C0693
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CC810E354;
	Wed, 23 Feb 2022 01:00:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E3C10E314;
 Wed, 23 Feb 2022 01:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645578053; x=1677114053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SOWZkca8hARRZa5mgZqzntIg9oHJOfQywVoctco9eD4=;
 b=EWU7QbZn8K4ZWnhs/rn+HpdzsgkQWcZKLIZOF85WcDFxOT570chSm0gz
 RfwUbcs5toD0oT5FwgrqZdgPwrhMpQMps0Hs0f98L8QiyvvQeTmcyfrY/
 3k3AzrD3XLW1zSZJynS7eKXkCYRg09AAy0P4vNxSWoovW1hWNZsTnkMDU
 XJRvdoUlbOME1HVKq4P5I29gwBOTKXd/F02SguAskUfnLUGEFJdTBOiAI
 uLemaFem6YdB67ZWAmy6qnS3CjLtoqZsN2TVuBbrLfzNeMDTn3Ex6ry4+
 4UcYi5Ya5arkKl2oqFj+WQ2wKKPN5MaiadjcxV5KykkyO4njI0k1pZwc4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="239241745"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="239241745"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="776501779"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2022 17:00:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 17:00:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 17:00:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:00:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyfG+WHYu3vdpmialWEf3gTAcOZtQvikkNWeAfqC9RIGyvrAXguv9KCr2vrkuzKDW4kbW/h2mcay7tdxUK5E/Ue0RK1FE/8KEFjWwBfpDfTd7E3Zy7PLPau7lCfY2ynmr4kElNXs1LRcp3jFBRz3IqO9s+i3VrtpDGyunRkBOTzfCXmL+JQgv8r1g0KgucpYSlqxNDXcepwg+5U+1pQ+SQ17uXeRtgWLym+HQMERX2k64LZecRLlq4ryx8cDIofDwyZyew0EObgRNm9K6jbuWFIt5WQErZklGDc2/fzutH5FvJrilIwhkk33STuKQg1q/6EnH5uhLDuxw1g2Yt+eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWuW8sf4TL1A3mmTJ2hKN7cjVDdesV9m9KVq9+fJXAA=;
 b=dX5mxPbWDpSk4Nj5ygtfU6mFAhisVJtywt3rREkQubR5bZ6XcolVyIFvyltGOHkAo3OEduKn9ot2ayzftvoI3rv7uo3svKS+AAz75H999zaiiSL72wAki/OMGCVjm/jOvX2ZyzeYbGHsWC7SZQ2DDmo9QA7NNq9nWBC524px9t/Uw5jbTyVy+5rogt2uzCkqrfK12nJBr1nQKNeoZNrguUINOc+yJYjcioEuy2c1Co5KJ84AlR3bqoC1riLTPOcRrgk02ge4Bogjffjs+9J2/XdZ04SZ0d0yDwD9sCWF0SFyl9kDEGhNBPPnmVbOxApoexgkrW/ZBO1rjp5jd7HoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH0PR11MB5394.namprd11.prod.outlook.com (2603:10b6:610:b9::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Wed, 23 Feb 2022 01:00:49 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 01:00:49 +0000
Message-ID: <76086279-3214-7351-5825-bbf88f70b701@intel.com>
Date: Tue, 22 Feb 2022 17:00:34 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/8] drm/i915/guc: Better name for context id limit
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217235207.930153-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12386ed0-5057-4036-cae1-08d9f667ee87
X-MS-TrafficTypeDiagnostic: CH0PR11MB5394:EE_
X-Microsoft-Antispam-PRVS: <CH0PR11MB5394230C0D248140C351F85DF43C9@CH0PR11MB5394.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FuxVbrJBf4XskpieNSgx32S43buXsOMf+488JPdh8feAun2bJ0NjyyUT7UgskiBV6zLjHiTRwNbsyPfRC4jP6fYUsHzwO4mioftKdFJDw7jIToa4/rrnhjFfcUqv2+SLbdIFWNqu5hJVn0scRkpf1St6pFKQBz01fWtv6VhL6Uv+rFMDtXklL3Nc7xR/rV5XRvamdJph96G3FFKZzZ3uLYXSbQLB1DlvlRJ7w6poimFeWdkZe7L/8Re8RkybKgRIfGH7x4eNO0HVhIW3kcrzYoEqP8UxGMNSqGdXy6D8k//fw7WDRe/iKnYEuQseJ6PqgkkMmmyMRtXrJQiv8sVfOO5oYvYwYxjGtEWWSHm4aA5hGIl0W0hc9dsK+0KuEOIp9JX0AYIoRWySu1LsfyYN+Fy5QSEmZmvl9ptqFvU2ExLCw0HWm5HdDynqGlo+JC8tPyJmnPxTAEWrCxkrhAb7h+VvsPir01QjA1yrEumQhT7G9qklXlHpZbU/K6dSz2wBhUbWhHmAbKtPBFkEz1kvtz/9TBVZH6Q61ltokPhHltFpCfkvOt1c1FFzvouTDmjbLh1mUXa63lxfZswLFVu0QJG98PokfABM0dp1Hbh4M6+f5iZfKIPIbtBuhUgJSY/qaoHpE18sGU9BJTnyhA/jaMhPJdKcxYxbAR1IizAmBznrFfRzsMXJePhfulaz7K/BY8RWczdm2vWqMv11eZNjDmbWNGbfmLfsO/mg45pZ0WAW0PvA4xr1AyiYl6AzlCw7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(450100002)(316002)(2616005)(2906002)(66556008)(5660300002)(8676002)(82960400001)(66476007)(6506007)(36756003)(6512007)(38100700002)(6486002)(508600001)(8936002)(53546011)(86362001)(26005)(31696002)(31686004)(66946007)(4326008)(6666004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0ZqMDJYaW1ydWZyWFVBNmJiQS9yZHBqdGNKRi9FOW83UEowSS96alBnUVlD?=
 =?utf-8?B?djJaK3lid2M5eVhpbjh3YjR5WXRwa2tNOHNPbzRCcEJTNmZLYis5ZUpqcjhn?=
 =?utf-8?B?YXpFNXZ1NTZNTklGdXZnLzFQZDN0YzdCbUxnbzljRVBpMlpsbktjRmJENmpL?=
 =?utf-8?B?UGtJV213SS9oOWxpdmtyUk1qMTBCSEFGVTQyY3Q2cHI5am43ZG5pQjZXN0NX?=
 =?utf-8?B?TnVIVCtBYUY3Z2NNQ1o5V2NYbHcrMEttZG1KaFFEd1FqTmVSbW1HbE9jWmZN?=
 =?utf-8?B?UUtZbUI2cWI1U0lWcFFsOHhjZWpPVDZYZzRTaXYvcjZib3gzS2NBZ3pFUXkx?=
 =?utf-8?B?THlYRnRPSnBBd2hHaWlzeC91OWJLbzlOSmluSDdGSXFERzQ3aHRYQTBtbHZ0?=
 =?utf-8?B?VkNhb09DN3FzTjh4aVY1VmVIVkQ3MzZaTUxvVTB5SlhQLzFqZjFTTWJDRGJG?=
 =?utf-8?B?K3BZTnZzb1owdnFueC9oMVV0dTVpMTBOSVQ1RUVnMjFrbVc3dFhwZXhOUzQ2?=
 =?utf-8?B?L2tERGlFZDFRa3AxWGxZNFBhVndXOTRZVjBuSVIrNkJxYVZveXpvempqd1Fu?=
 =?utf-8?B?OCtMSjg0a2I5aE5kaDRMeGJUOWhadjZjUGl6VEVVYzJKaTNzMlNRK0kxbGRp?=
 =?utf-8?B?M2ZhbkROSEFqdkJPRTVRNU9FeEtOY01HV2ZmV3JLcTdSVnJ3a0czSnNsbHlL?=
 =?utf-8?B?VDFSZE1pMTdObEFXWU1rY2RLYldzeG9YQXdGS3EwOHY4ZmxkYlF2QytRY2d0?=
 =?utf-8?B?VGU1SjEybGZCWGtqd0s4WmtURVowVWFrK1RYRDNmalkvQ2ZoR1dKMGFKMW1m?=
 =?utf-8?B?SUtHWEFiV0dSMVlESU1COWNRTnlnZkxMZDZMU3pnRUhIOFZZanBTNFFUNUVX?=
 =?utf-8?B?aXFJak4vbXI5RUpuMUhDNy8xUHNRTmNqeVNCdkk2cTVYeER4dklNWjgrclMv?=
 =?utf-8?B?djVZa3FlRlRPVi9rMWllK1NQTEFocjFEUkJETGtUdUl0REVYOHpBeWY1endz?=
 =?utf-8?B?bnFncDByTlIwNHZ5RXBCdjB2TkNiVTUvMHhJV3E5cWtCL3Btc29GNXpaRDdT?=
 =?utf-8?B?YmlZNE1pL3JZY2VjWWxTMkczaGg4WkFjVEhhUytkSmRYckpKMDU3TWw4bkN3?=
 =?utf-8?B?bG04MmdqRFFraHlkLzVKOVZoRkhGTVdhTjZZV1pWNmZ0elZlMFdxd1ViN1Bx?=
 =?utf-8?B?dmdpeWk0cExSQTVSRDU5V29uSkp3WWNtSEM4S2tDSURhbnNFV25iNlpaQnQ1?=
 =?utf-8?B?RkpBYVhYd0p6OUp3RmRBc3E3cEJEYlo2TlB3Y3loVnBmV0ZpZWNEYll4RndV?=
 =?utf-8?B?eUUzYWdYdzFnYVhRemtKcXh3c2JTRS91aEp3TlVQSldQQzB0WjN2K0pNTHd0?=
 =?utf-8?B?SHY0RVZ2cXJzSGlicjBYM0R6WWJ2Z1d0TWhOSDJZNEZvZXVkc0ozQU1pdDJB?=
 =?utf-8?B?QUNGQ0ZxdURiY0Y1S1lkQTN0WDlyUW5qQXZ5bk1uaHUrUmZuNDJOU3d3aDlh?=
 =?utf-8?B?cjVrUUZRdENianhuOUJpNi9Zc053dGxqT01hWWd0YkhzaGdiTDJ2cHRIOFFj?=
 =?utf-8?B?bWpkbVJBRHVPVE43ME5PVzJGbStnbWZvS0kwc054QTQ3dzFkZExqZGJOYkFx?=
 =?utf-8?B?UlE4d0N4YWV4TldSMmtuS0J5YVJ3TmJvVmg3M0FHRnNjWnYrSFY5cDIybC8z?=
 =?utf-8?B?U0dTK0t5RUNDWjJHZ0xmcXpKSUNpbU9HaTB3OUYvTSs1dHR6NXJZMktnY0Ir?=
 =?utf-8?B?S2hCWHl5WWxzUlgzL0lpeVY5ZVRNYjl5bTlJM2IyWTh3ZEQybUtTVXRoNHVv?=
 =?utf-8?B?K0c0TFpNZHBOTGFGcnpETEdRZk8xRG1KRHJtdDdZNkFoN3M0OEVuVlRNL1Uw?=
 =?utf-8?B?c1ZLR3Nrems4ZlJ5Z0xJTHVoVDh0aTNSMlo5d2xhVHFCdzV0aXpCWUpBWjBI?=
 =?utf-8?B?MlYvM1BvLzBWSWpJRHBGd2dLZC9QOEFNM21Dc2JGUVpoMWRPWW11RHMrT01j?=
 =?utf-8?B?U0dHVWtyNUlVMFA4c1g4YVZzdlhRTjdIeUxDMERhREFZUHN0d2J0YnBqeWN4?=
 =?utf-8?B?b3U5aml3OWJQYjNwcGZoVm9IVGp1S1pMcWxwRk9IYk55ZVdWUHB2bnpBcGpV?=
 =?utf-8?B?NE1nZTJGVU5VckxCK2FJR0tadm9WdVljYTRwMEtrR1hhQk5BNEgrWElYOTZ3?=
 =?utf-8?B?MktQYmZQYzlkVkZjS0d1WnIxak9keUlUMXgxREtYeTZDTzljbkFRYzZUTnUv?=
 =?utf-8?B?UnROaDBXa2FJZXd4bEtIdk5LZUhnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12386ed0-5057-4036-cae1-08d9f667ee87
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:00:49.7639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vo1n1zThJdrH0/1EshqRFK1H3SjrtryqGT5Fmm4CREoi2NQE9d4idDidlgpfH7GI1bR42iBBVZZkJK0dOut+CeApkRv1e9RysGZFfedg7K8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5394
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



On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor pool is going away. So, stop using it as the limit
> for how many context ids are available.

I think this could be slightly reworded to make it clear that the 
numbers are not changing. Maybe add something like "the desc pool is 
sized based on the maximum numbers of contexts supported by the GuC, so 
define that limit directly".

>
> While at it, also update a kzalloc(sizeof()*count) to be a
> kcalloc(count,size).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_context.c          |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h      |  4 ++--
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 ++++++++--------
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c        |  2 +-
>   4 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5d0ec7c49b6a..d87145b8fca0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -400,7 +400,7 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	INIT_LIST_HEAD(&ce->guc_state.fences);
>   	INIT_LIST_HEAD(&ce->guc_state.requests);
>   
> -	ce->guc_id.id = GUC_INVALID_LRC_ID;
> +	ce->guc_id.id = GUC_INVALID_CONTEXT_ID;
>   	INIT_LIST_HEAD(&ce->guc_id.link);
>   
>   	INIT_LIST_HEAD(&ce->destroyed_link);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 6a4612a852e2..11099f0320ce 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -32,8 +32,8 @@
>   #define GUC_CLIENT_PRIORITY_NORMAL	3
>   #define GUC_CLIENT_PRIORITY_NUM		4
>   
> -#define GUC_MAX_LRC_DESCRIPTORS		65535
> -#define	GUC_INVALID_LRC_ID		GUC_MAX_LRC_DESCRIPTORS
> +#define GUC_MAX_CONTEXT_ID		65535
> +#define	GUC_INVALID_CONTEXT_ID		GUC_MAX_CONTEXT_ID
>   
>   #define GUC_RENDER_ENGINE		0
>   #define GUC_VIDEO_ENGINE		1
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 11bf56b5a266..ad784e8068c7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -354,12 +354,12 @@ request_to_scheduling_context(struct i915_request *rq)
>   
>   static inline bool context_guc_id_invalid(struct intel_context *ce)
>   {
> -	return ce->guc_id.id == GUC_INVALID_LRC_ID;
> +	return ce->guc_id.id == GUC_INVALID_CONTEXT_ID;
>   }
>   
>   static inline void set_context_guc_id_invalid(struct intel_context *ce)
>   {
> -	ce->guc_id.id = GUC_INVALID_LRC_ID;
> +	ce->guc_id.id = GUC_INVALID_CONTEXT_ID;
>   }
>   
>   static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
> @@ -474,7 +474,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
>   
> -	GEM_BUG_ON(index >= GUC_MAX_LRC_DESCRIPTORS);
> +	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
>   
>   	return &base[index];
>   }
> @@ -483,7 +483,7 @@ static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>   {
>   	struct intel_context *ce = xa_load(&guc->context_lookup, id);
>   
> -	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
> +	GEM_BUG_ON(id >= GUC_MAX_CONTEXT_ID);
>   
>   	return ce;
>   }
> @@ -494,7 +494,7 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
>   	int ret;
>   
>   	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
> -			  GUC_MAX_LRC_DESCRIPTORS);
> +			  GUC_MAX_CONTEXT_ID);
>   	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
>   					     (void **)&guc->lrc_desc_pool_vaddr);
>   	if (ret)
> @@ -2441,7 +2441,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   		GUC_CONTEXT_DISABLE
>   	};
>   
> -	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
> +	GEM_BUG_ON(guc_id == GUC_INVALID_CONTEXT_ID);
>   
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_sched_disable(ce);
> @@ -3840,7 +3840,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> -	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
> +	guc->submission_state.num_guc_ids = GUC_MAX_CONTEXT_ID;
>   	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
> @@ -3850,7 +3850,7 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   {
>   	struct intel_context *ce;
>   
> -	if (unlikely(desc_idx >= GUC_MAX_LRC_DESCRIPTORS)) {
> +	if (unlikely(desc_idx >= GUC_MAX_CONTEXT_ID)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
>   			"Invalid desc_idx %u", desc_idx);
>   		return NULL;
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index a115894d5896..1df71d0796ae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -148,7 +148,7 @@ static int intel_guc_steal_guc_ids(void *arg)
>   	struct i915_request *spin_rq = NULL, *rq, *last = NULL;
>   	int number_guc_id_stolen = guc->number_guc_id_stolen;
>   
> -	ce = kzalloc(sizeof(*ce) * GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL);
> +	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
>   	if (!ce) {
>   		pr_err("Context array allocation failed\n");
>   		return -ENOMEM;

