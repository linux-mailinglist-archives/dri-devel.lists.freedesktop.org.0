Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F33213F7AF3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 18:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04EE6E3DA;
	Wed, 25 Aug 2021 16:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E446E3D8;
 Wed, 25 Aug 2021 16:52:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204699123"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="204699123"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 09:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="494480780"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2021 09:52:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 09:52:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 09:52:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 09:52:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 09:52:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/dm6H2gS74/8sHKkHygNhyeq96/6dqniVR6uzM4eOzs8doUGdhj5Xo7zkF8Mx+rQPLTfyci/LLninUhFKwmRatdHXUzouidDc2Iv/1yl2oCrDxEQymvE8re61J71RKCSoCx3UJ2xTVLPAc5nYEDfPtymAF/ct2fa7mD5HfxxbmJB0voQn/VjvSbps93NrtbZM/9YZ8mQyENFbABQyl9k6f+ZGVgfK7wvMJZSMX6zmFBGl67HtXIbFHzEK/kdNiwWyn9EsgjzQzzPMrDUpTs6tNnzvISS0QtCbDav5HO5N3TIeZK8s8uH6ahSOKtKZF9zhNLrVYxQwTPqgH+q7W7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGWYoB//D9iz5EO8cZP28WeG6v8t8sb3J1BGy889Zms=;
 b=e08n6ehiYgxhRnEsQfi1nudPKr4GIpJDmFU5ucW51X3tDpFafdF2OqBBcqLV6YVOM25Vh+neO/H61dLja8wtVfSPL9397/wLNnt56+GYVC2c0JXX+/6KbBz/YZ1V4GZoFI3/BDudAyPBa6FkQCXNVmA7euLTCcjMLcNp7+s+3g3pIlkYFYhmc2pWDyTj+aevf941+DBEHD9RgvFrJNkvbEN6Wi087wyShYS4o968V0j4yrbxL9d6LvW8Z61j+pw5UIcxQPXDcWgdkXYF2aWNmBqJR+ijHDWIiG9/EU5FzAtGp1t3bRR9lBnajTvGZ/aUxtaBWKrH7gQL4MZHIltSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGWYoB//D9iz5EO8cZP28WeG6v8t8sb3J1BGy889Zms=;
 b=xxMsRwzwbtTP4+zt7wtHR4GuLvFKcIly9Qg1PToEppnDVLSH4Cy6IKK+khVKlOsvXdclRRdW4Rl+rkjlouxCByDSk6g8HJA9UNVkt23QHrUvcgR5arRDaOOSw1GA+Vb+Jv+PVf/+VwHmxaF0Sq25emVCrPcXsF0tE7BSc/rv1A0=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1769.namprd11.prod.outlook.com (2603:10b6:3:10a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Wed, 25 Aug 2021 16:52:08 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.019; Wed, 25 Aug 2021
 16:52:08 +0000
Subject: Re: [Intel-gfx] [PATCH 20/27] drm/i915/guc: Rework and simplify
 locking
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-21-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <2ef5b144-540d-2aad-11a7-3cfab89a1dcf@intel.com>
Date: Wed, 25 Aug 2021 09:52:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-21-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MW4PR04CA0256.namprd04.prod.outlook.com
 (2603:10b6:303:88::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MW4PR04CA0256.namprd04.prod.outlook.com (2603:10b6:303:88::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 16:52:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b74840b-4fdc-421a-b91d-08d967e8ad2a
X-MS-TrafficTypeDiagnostic: DM5PR11MB1769:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB1769780428448BBC981246D9F4C69@DM5PR11MB1769.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tlh0JS53M5ZVEDr2lgFN7ybTH0nlc6tL3JXf2aPWzHNV3vDhSzpe7RVyR+MWRe5SS50a9dsk71Cpoa+SeES0mOTJkO7lor+s3+GmzrQKDu4kfogez3Dp7wgSn1GiI+8SfXiGYaQthNiR/CxVHsAs4I827cSCBseU+Lvs0VafJm+mfiZigW6BqpwB+uTcMQZSaMdKIcEVfZcqRFGiLviH3B0N7/VYB+Yge4dVfz93fThX6S2eLf/5VPio95Wub0MpAm1ZJbClG33uzNkTJdvFgIsDJHE8/h4K/roPxHSaXjdiZkavEVuKN2WlrXBr1VkKLgqdDflM7XHgqui1SZ+GMiBeoHbv0YbR1cqnaYpLjXndijsHG1vp8wj5cmDU/PjEVK0xTLf5V9aMVc8yAt8djt31K/VoHUHGj+plAULlVdNt6E18iijE5MfeVRYwgLJa9pj6984/8naLWTOZNZmHgdEGLv81e33AcMXx/aLhjx4LuWtXh9oOmxaXSCzM7LE+SAOX30pJE4zF3nVoiWhgawV/Q30LUPVKsb7L5aeyHfz9MXlTYbX7Rky7GfqT//QqdIxqW8STWVxUc4C5l3hnT5Vrqc9wpL+bLZNtIr1Tj5v1JZ/kjvuQvaeeWUSR/28IsB54fKIDfazWj1eytJYALbvUHk0SrifiwY8gIx8uAu5IF5NAORYFSapVTDTbWaM7zD2mIy+dr/8YCqF2ojI2hd8wWGGUrQbiejjegLT0wTxs0o5ARRNcDRj6D4KAiKpywZTLIZhHl+tgQFi0cUvtQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(186003)(4326008)(31686004)(31696002)(30864003)(38100700002)(6486002)(26005)(8676002)(2906002)(16576012)(66556008)(86362001)(8936002)(5660300002)(2616005)(956004)(53546011)(66946007)(66476007)(316002)(478600001)(83380400001)(36756003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkxTQ2NOWjZOOVZOaktyTWhqaFZOc0cvWFdscDA2eWloaHpWOW50NDhDQndZ?=
 =?utf-8?B?cmxXRURpQnh1RFN0SWYxNWp2cHl1YWFCMno3UTZPZ2JjcXplTjhQZGNvdEVT?=
 =?utf-8?B?eUxNSVM4MS9pY1JYR1IvWW13amRiL0xhV0t4R2NtM0V2VnZwY1JFeUVyU1VN?=
 =?utf-8?B?cUtQTDk3QzFhYjF0Vng2QzVJSWtNWU5yQ24rVkhlTGcyZGh4N3kzbmhlRmJw?=
 =?utf-8?B?TzRUZ282dVpUTk4zR1lEQTNiVWRBT3BGRmQyWVgzY0txTWlkbG9uc1NwbVNB?=
 =?utf-8?B?ODBHSGhKcUsveWdZZUp6SjM0OUFVb2NUOFczejlNMm0rVS9LcFpRaTB2SUVP?=
 =?utf-8?B?dmNtYWV0SWZMeEVaRUJlTFd4TW1ad0lEZmZ2dHNBQjVpNU9vdklCRWtnZTFs?=
 =?utf-8?B?RGdsclVLQlE2dzVTOGVJVmFVV1FMaE5JM3ZUS0FvVzNVZjdNWm42RGtLNmZm?=
 =?utf-8?B?a3JibVJqYVBibTBESHB4SWY2empRYXdEZjJ0TlJTL2NOU2YvVVVPUVZ2YXlW?=
 =?utf-8?B?MDF0aE5LOFZaa0IzV3hYQUMyVTFzc3VKL0ZxcC9QaHp6TW03aUhlK2VVemls?=
 =?utf-8?B?ZGRqVFhhRE1ZMDF2bWoyeU94NGhCOGdWM2JYWG9yYjc0amc3RitvYnJ6Q1pI?=
 =?utf-8?B?c0dnaGlrOEsxNzJkM2s2bDdGNVJMdFRTNXlHOUo0VVFtc2tLakZWR3BBVTVT?=
 =?utf-8?B?dm5KNHpUVW03d25aKzFKYWhOcXo3MzVGOUlRTktlYjkxU0RWUVFPTlc0aVUy?=
 =?utf-8?B?ai9xZ0RuQzcvdjdhdThiUXovQ3hNRHdPekJTUXFFQnJUU1NtNTdSL3FSMWFB?=
 =?utf-8?B?a3BDZ2lKUEZkWCttYWZmRXhDYXRZQlhRVy9SeGttUjQxQzI4VFhCSm1SVTNm?=
 =?utf-8?B?cUR3YS94VjVpZ1M5Qkg1Qzllb1pudElzaW5Gdkl1OHpSUGtRSVQ4SXJKbGZF?=
 =?utf-8?B?MzJKM0dUNk44THhWMWh6bHFYemt1QzdTb2ZRcEdDQVpmU000enFGQkFDdkpk?=
 =?utf-8?B?YmxRcWRJQi8rQVVmQUd0NnVmSGhHRENWR0FVUVoxTVNub0s3Q1lHWTYyQ0NB?=
 =?utf-8?B?MnJEakdtZXNoM0ZCeWswVVA0U0VaQ3RubkdNUUwvaXpIeXc4ZEVGRXVIdEZG?=
 =?utf-8?B?ZGdIUGRZMGFTbk0rNWpoTU4xVm9QTGoyaDVnL2VYeWZkTEE2ZSs5R2FDZytI?=
 =?utf-8?B?ZzJqNllBR2tRQzRDMEF0cWtMUUdjaDBZSmF3aUVhMzNaY2lQUGxCMHlhTnpu?=
 =?utf-8?B?eVBQZllnejVybjZqMlNVa3BmbEdhZEN0QVljaWZGMWdoMEFvZW53ekp3L0Ft?=
 =?utf-8?B?WnByaGxoWXhGbGloVHd0dVIwU2JMVys2OCt6QTVIeXYwUTFMaVlCQ0VjMis4?=
 =?utf-8?B?a0ZuOUg5WE02MnFVeTZhOGFkUUF3NE1JVitOd0pTZVVTUVJkZTd5cFpQRy8z?=
 =?utf-8?B?ZytiaTdNdTcxbVJwUUxVOXYrZTltWDVYenpLaTV5aldPdEZnMmVGS3NlYVI1?=
 =?utf-8?B?SXMrV1hPSXZlRHMwMCt0ME4zMUJFTmFRWVgzQkFza2Uya0ZrWUV5bmFnOExp?=
 =?utf-8?B?Q0lEdlVpbVkyYVRSLzFIeEJEZjZxWXYvYnNOZStqZnFFaktWbmQyM1JraVdi?=
 =?utf-8?B?bmc3YmlRZlZ3MDNhOWZ2S0w3bVJqcVNPdFZPWHNKSm1VOVMvVC9jdXJsTWJM?=
 =?utf-8?B?dlBhMndiS05KQ3VoZ0g5NzBkemF5M0VVZjFLOEpJUlZ0aEdSb21wSVQvd2dT?=
 =?utf-8?Q?2arDC47aUSm3Uj8Jaz2+lc0Y/EZIjmZ4mA3oOdg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b74840b-4fdc-421a-b91d-08d967e8ad2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 16:52:08.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPckq2vHEc5q10cQKMBj9EUhgy8QAFE5IhmW6gpH+CI1BhzQsBlUAywQ4MxRh640BDBhja+MI0sWdZJPrCoHYUGpPqhI0bj8Q/3uwjfIsmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1769
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> Rework and simplify the locking with GuC subission. Drop
> sched_state_no_lock and move all fields under the guc_state.sched_state
> and protect all these fields with guc_state.lock . This requires
> changing the locking hierarchy from guc_state.lock -> sched_engine.lock
> to sched_engine.lock -> guc_state.lock.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   5 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 186 ++++++++----------
>   drivers/gpu/drm/i915/i915_trace.h             |   6 +-
>   3 files changed, 89 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index c06171ee8792..d5d643b04d54 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -161,7 +161,7 @@ struct intel_context {
>   		 * sched_state: scheduling state of this context using GuC
>   		 * submission
>   		 */
> -		u16 sched_state;
> +		u32 sched_state;
>   		/*
>   		 * fences: maintains of list of requests that have a submit
>   		 * fence related to GuC submission
> @@ -178,9 +178,6 @@ struct intel_context {
>   		struct list_head requests;
>   	} guc_active;
>   
> -	/* GuC scheduling state flags that do not require a lock. */
> -	atomic_t guc_sched_state_no_lock;
> -
>   	/* GuC LRC descriptor ID */
>   	u16 guc_id;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 053f4485d6e9..509b298e7cf3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -72,86 +72,23 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>   
>   #define GUC_REQUEST_SIZE 64 /* bytes */
>   
> -/*
> - * Below is a set of functions which control the GuC scheduling state which do
> - * not require a lock as all state transitions are mutually exclusive. i.e. It
> - * is not possible for the context pinning code and submission, for the same
> - * context, to be executing simultaneously. We still need an atomic as it is
> - * possible for some of the bits to changing at the same time though.
> - */
> -#define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
> -#define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
> -#define SCHED_STATE_NO_LOCK_REGISTERED			BIT(2)
> -static inline bool context_enabled(struct intel_context *ce)
> -{
> -	return (atomic_read(&ce->guc_sched_state_no_lock) &
> -		SCHED_STATE_NO_LOCK_ENABLED);
> -}
> -
> -static inline void set_context_enabled(struct intel_context *ce)
> -{
> -	atomic_or(SCHED_STATE_NO_LOCK_ENABLED, &ce->guc_sched_state_no_lock);
> -}
> -
> -static inline void clr_context_enabled(struct intel_context *ce)
> -{
> -	atomic_and((u32)~SCHED_STATE_NO_LOCK_ENABLED,
> -		   &ce->guc_sched_state_no_lock);
> -}
> -
> -static inline bool context_pending_enable(struct intel_context *ce)
> -{
> -	return (atomic_read(&ce->guc_sched_state_no_lock) &
> -		SCHED_STATE_NO_LOCK_PENDING_ENABLE);
> -}
> -
> -static inline void set_context_pending_enable(struct intel_context *ce)
> -{
> -	atomic_or(SCHED_STATE_NO_LOCK_PENDING_ENABLE,
> -		  &ce->guc_sched_state_no_lock);
> -}
> -
> -static inline void clr_context_pending_enable(struct intel_context *ce)
> -{
> -	atomic_and((u32)~SCHED_STATE_NO_LOCK_PENDING_ENABLE,
> -		   &ce->guc_sched_state_no_lock);
> -}
> -
> -static inline bool context_registered(struct intel_context *ce)
> -{
> -	return (atomic_read(&ce->guc_sched_state_no_lock) &
> -		SCHED_STATE_NO_LOCK_REGISTERED);
> -}
> -
> -static inline void set_context_registered(struct intel_context *ce)
> -{
> -	atomic_or(SCHED_STATE_NO_LOCK_REGISTERED,
> -		  &ce->guc_sched_state_no_lock);
> -}
> -
> -static inline void clr_context_registered(struct intel_context *ce)
> -{
> -	atomic_and((u32)~SCHED_STATE_NO_LOCK_REGISTERED,
> -		   &ce->guc_sched_state_no_lock);
> -}
> -
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
> - * require a lock, aside from the special case where the functions are called
> - * from guc_lrc_desc_pin(). In that case it isn't possible for any other code
> - * path to be executing on the context.
> + * require a lock.
>    */
>   #define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
>   #define SCHED_STATE_DESTROYED				BIT(1)
>   #define SCHED_STATE_PENDING_DISABLE			BIT(2)
>   #define SCHED_STATE_BANNED				BIT(3)
> -#define SCHED_STATE_BLOCKED_SHIFT			4
> +#define SCHED_STATE_ENABLED				BIT(4)
> +#define SCHED_STATE_PENDING_ENABLE			BIT(5)
> +#define SCHED_STATE_REGISTERED				BIT(6)
> +#define SCHED_STATE_BLOCKED_SHIFT			7
>   #define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
>   #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
>   static inline void init_sched_state(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
> -	atomic_set(&ce->guc_sched_state_no_lock, 0);
>   	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
>   }
>   
> @@ -162,9 +99,8 @@ static bool sched_state_is_init(struct intel_context *ce)
>   	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
>   	 * suspend.
>   	 */
> -	return !(atomic_read(&ce->guc_sched_state_no_lock) &
> -		 ~SCHED_STATE_NO_LOCK_REGISTERED) &&
> -		!(ce->guc_state.sched_state &= ~SCHED_STATE_BLOCKED_MASK);
> +	return !(ce->guc_state.sched_state &=
> +		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
>   }
>   
>   static inline bool
> @@ -237,6 +173,57 @@ static inline void clr_context_banned(struct intel_context *ce)
>   	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
>   }
>   
> +static inline bool context_enabled(struct intel_context *ce)
> +{
> +	return ce->guc_state.sched_state & SCHED_STATE_ENABLED;
> +}
> +
> +static inline void set_context_enabled(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state |= SCHED_STATE_ENABLED;
> +}
> +
> +static inline void clr_context_enabled(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &= ~SCHED_STATE_ENABLED;
> +}
> +
> +static inline bool context_pending_enable(struct intel_context *ce)
> +{
> +	return ce->guc_state.sched_state & SCHED_STATE_PENDING_ENABLE;
> +}
> +
> +static inline void set_context_pending_enable(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state |= SCHED_STATE_PENDING_ENABLE;
> +}
> +
> +static inline void clr_context_pending_enable(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_ENABLE;
> +}
> +
> +static inline bool context_registered(struct intel_context *ce)
> +{
> +	return ce->guc_state.sched_state & SCHED_STATE_REGISTERED;
> +}
> +
> +static inline void set_context_registered(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state |= SCHED_STATE_REGISTERED;
> +}
> +
> +static inline void clr_context_registered(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &= ~SCHED_STATE_REGISTERED;
> +}
> +
>   static inline u32 context_blocked(struct intel_context *ce)
>   {
>   	return (ce->guc_state.sched_state & SCHED_STATE_BLOCKED_MASK) >>
> @@ -245,7 +232,6 @@ static inline u32 context_blocked(struct intel_context *ce)
>   
>   static inline void incr_context_blocked(struct intel_context *ce)
>   {
> -	lockdep_assert_held(&ce->engine->sched_engine->lock);
>   	lockdep_assert_held(&ce->guc_state.lock);
>   
>   	ce->guc_state.sched_state += SCHED_STATE_BLOCKED;
> @@ -255,7 +241,6 @@ static inline void incr_context_blocked(struct intel_context *ce)
>   
>   static inline void decr_context_blocked(struct intel_context *ce)
>   {
> -	lockdep_assert_held(&ce->engine->sched_engine->lock);
>   	lockdep_assert_held(&ce->guc_state.lock);
>   
>   	GEM_BUG_ON(!context_blocked(ce));	/* Underflow check */
> @@ -450,6 +435,8 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	u32 g2h_len_dw = 0;
>   	bool enabled;
>   
> +	lockdep_assert_held(&rq->engine->sched_engine->lock);
> +
>   	/*
>   	 * Corner case where requests were sitting in the priority list or a
>   	 * request resubmitted after the context was banned.
> @@ -457,7 +444,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	if (unlikely(intel_context_is_banned(ce))) {
>   		i915_request_put(i915_request_mark_eio(rq));
>   		intel_engine_signal_breadcrumbs(ce->engine);
> -		goto out;
> +		return 0;
>   	}
>   
>   	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
> @@ -470,9 +457,11 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	if (unlikely(!lrc_desc_registered(guc, ce->guc_id))) {
>   		err = guc_lrc_desc_pin(ce, false);
>   		if (unlikely(err))
> -			goto out;
> +			return err;
>   	}
>   
> +	spin_lock(&ce->guc_state.lock);
> +
>   	/*
>   	 * The request / context will be run on the hardware when scheduling
>   	 * gets enabled in the unblock.
> @@ -507,6 +496,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   		trace_i915_request_guc_submit(rq);
>   
>   out:
> +	spin_unlock(&ce->guc_state.lock);
>   	return err;
>   }
>   
> @@ -727,8 +717,6 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   	spin_lock_irq(&guc_to_gt(guc)->irq_lock);
>   	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
>   
> -	guc_flush_submissions(guc);
> -
>   	flush_work(&guc->ct.requests.worker);
>   
>   	scrub_guc_desc_for_outstanding_g2h(guc);
> @@ -1133,7 +1121,11 @@ static int steal_guc_id(struct intel_guc *guc)
>   
>   		list_del_init(&ce->guc_id_link);
>   		guc_id = ce->guc_id;
> +
> +		spin_lock(&ce->guc_state.lock);
>   		clr_context_registered(ce);
> +		spin_unlock(&ce->guc_state.lock);
> +
>   		set_context_guc_id_invalid(ce);
>   		return guc_id;
>   	} else {
> @@ -1169,6 +1161,8 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   try_again:
>   	spin_lock_irqsave(&guc->contexts_lock, flags);
>   
> +	might_lock(&ce->guc_state.lock);
> +
>   	if (context_guc_id_invalid(ce)) {
>   		ret = assign_guc_id(guc, &ce->guc_id);
>   		if (ret)
> @@ -1248,8 +1242,13 @@ static int register_context(struct intel_context *ce, bool loop)
>   	trace_intel_context_register(ce);
>   
>   	ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
> -	if (likely(!ret))
> +	if (likely(!ret)) {
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&ce->guc_state.lock, flags);
>   		set_context_registered(ce);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	}
>   
>   	return ret;
>   }
> @@ -1525,7 +1524,6 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
>   static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> -	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
>   	unsigned long flags;
>   	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
>   	intel_wakeref_t wakeref;
> @@ -1534,13 +1532,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
> -	/*
> -	 * Sync with submission path, increment before below changes to context
> -	 * state.
> -	 */
> -	spin_lock(&sched_engine->lock);
>   	incr_context_blocked(ce);
> -	spin_unlock(&sched_engine->lock);
>   
>   	enabled = context_enabled(ce);
>   	if (unlikely(!enabled || submission_disabled(guc))) {
> @@ -1569,7 +1561,6 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   static void guc_context_unblock(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> -	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
>   	unsigned long flags;
>   	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
>   	intel_wakeref_t wakeref;
> @@ -1594,13 +1585,7 @@ static void guc_context_unblock(struct intel_context *ce)
>   		intel_context_get(ce);
>   	}
>   
> -	/*
> -	 * Sync with submission path, decrement after above changes to context
> -	 * state.
> -	 */
> -	spin_lock(&sched_engine->lock);
>   	decr_context_blocked(ce);
> -	spin_unlock(&sched_engine->lock);
>   
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> @@ -1710,7 +1695,9 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   
>   	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
>   	    !lrc_desc_registered(guc, ce->guc_id)) {
> +		spin_lock_irqsave(&ce->guc_state.lock, flags);

We do take this lock a few lines below this. Would it be worth just 
moving that up and do everything under the lock?

Anyway, all calls to the updated set/clr functions have been updated to 
be correctly locked, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   		clr_context_enabled(ce);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   		goto unpin;
>   	}
>   
> @@ -1760,7 +1747,6 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
>   	GEM_BUG_ON(context_enabled(ce));
>   
> -	clr_context_registered(ce);
>   	deregister_context(ce, ce->guc_id, true);
>   }
>   
> @@ -1833,8 +1819,10 @@ static void guc_context_destroy(struct kref *kref)
>   	/* Seal race with Reset */
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   	disabled = submission_disabled(guc);
> -	if (likely(!disabled))
> +	if (likely(!disabled)) {
>   		set_context_destroyed(ce);
> +		clr_context_registered(ce);
> +	}
>   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   	if (unlikely(disabled)) {
>   		release_guc_id(guc, ce);
> @@ -2697,8 +2685,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   		     (!context_pending_enable(ce) &&
>   		     !context_pending_disable(ce)))) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Bad context sched_state 0x%x, 0x%x, desc_idx %u",
> -			atomic_read(&ce->guc_sched_state_no_lock),
> +			"Bad context sched_state 0x%x, desc_idx %u",
>   			ce->guc_state.sched_state, desc_idx);
>   		return -EPROTO;
>   	}
> @@ -2713,7 +2700,9 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   		}
>   #endif
>   
> +		spin_lock_irqsave(&ce->guc_state.lock, flags);
>   		clr_context_pending_enable(ce);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   	} else if (context_pending_disable(ce)) {
>   		bool banned;
>   
> @@ -2987,9 +2976,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   			   atomic_read(&ce->pin_count));
>   		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
>   			   atomic_read(&ce->guc_id_ref));
> -		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
> -			   ce->guc_state.sched_state,
> -			   atomic_read(&ce->guc_sched_state_no_lock));
> +		drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
> +			   ce->guc_state.sched_state);
>   
>   		guc_log_context_priority(p, ce);
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 806ad688274b..0a77eb2944b5 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -903,7 +903,6 @@ DECLARE_EVENT_CLASS(intel_context,
>   			     __field(u32, guc_id)
>   			     __field(int, pin_count)
>   			     __field(u32, sched_state)
> -			     __field(u32, guc_sched_state_no_lock)
>   			     __field(u8, guc_prio)
>   			     ),
>   
> @@ -911,15 +910,12 @@ DECLARE_EVENT_CLASS(intel_context,
>   			   __entry->guc_id = ce->guc_id;
>   			   __entry->pin_count = atomic_read(&ce->pin_count);
>   			   __entry->sched_state = ce->guc_state.sched_state;
> -			   __entry->guc_sched_state_no_lock =
> -			   atomic_read(&ce->guc_sched_state_no_lock);
>   			   __entry->guc_prio = ce->guc_prio;
>   			   ),
>   
> -		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x, guc_prio=%u",
> +		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",
>   			      __entry->guc_id, __entry->pin_count,
>   			      __entry->sched_state,
> -			      __entry->guc_sched_state_no_lock,
>   			      __entry->guc_prio)
>   );
>   

