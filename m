Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6FF3F37BC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 02:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC676EB45;
	Sat, 21 Aug 2021 00:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8946EB3D;
 Sat, 21 Aug 2021 00:31:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="238992256"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="238992256"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 17:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="642295344"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 20 Aug 2021 17:31:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 20 Aug 2021 17:31:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 20 Aug 2021 17:31:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 20 Aug 2021 17:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvWvTVMYSX4b0XEVp70Ar3UU9qEBb/kSCUm31zhiM3sFr/vN7bl3Q30McQ78zhV+uOzBrcsF6jUJekKouvtreYQBu1qJjcHgbIx0rFwJISA5Jwqmzbzu5HfGpSN8vIrdafewstXpL66xKYF7fTC5UOdpMTA420nqLMSupDVjyxyOa9MhfoYbYA6mytyrzGmbHrjceSNQTXmI5dGb3WIYmz/z0QogUknpQ2vZqDTMYKXdNIqvVvwUY7mGyylyfniB4/CxaBntH17mIX++ZcwhNwlJysey/hOiwPp18OkPT14pSdNMrLb6xqXtbIBiy49xZtLGdcNp1cOGvwElpicKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHqGQH42040AZcnqMcZ24PwXIwdoSLBdma0vNJZ4z9w=;
 b=ehr/kEkMcytrzWTSAYJYoEr8GgdopkEQLwDVfpPwClkhTT6CkybeWhU69VocVOB9Cz0TRPCthbF5/S9bnJnnJ72utCl63iocuLm6OGJqHbsV21W+Yar2kwGA8r94dQRnPJrtW82RMfL+G/ZUhYnfLlrCiys3CDhMW8LXFm6bB2aNbkR/oaB2lpws+kbljsYMbtwj0ETPcbSjHofYoFMc9SgtnTKogUexW4VMQtiIRwZ2Bz5Qm5lCIGWDzjoBYqwu/aAZ28Zk/fwucLetEYG2k6808B6OKKBQ26YnwseMR8fBJL4Bd+4ChcpVGsuGdSyT52tU6UpABe4Z1ma4el8VqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHqGQH42040AZcnqMcZ24PwXIwdoSLBdma0vNJZ4z9w=;
 b=Ys1juMXlLERg31xK1rLsider3/oR0KUwY6Kz/oWCX28Z1R4QEWuwlHzmA4ufUhplvQygZDlILjcJFKNeKBkNlrNQZvc49mP/S2utpmOF6l4LLdcUinGqJUr/AhDRWy4CgPRsmgHPntZ3mn5Q35pyflu/p2y2gMZmcRCY6lVUD9Y=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Sat, 21 Aug 2021 00:31:01 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.021; Sat, 21 Aug 2021
 00:31:01 +0000
Subject: Re: [PATCH 19/27] drm/i915/guc: Move guc_blocked fence to struct
 guc_state
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-20-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <7c00b48c-0f23-f9cf-5457-e52d76481cf0@intel.com>
Date: Fri, 20 Aug 2021 17:30:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: CO1PR15CA0101.namprd15.prod.outlook.com
 (2603:10b6:101:21::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 CO1PR15CA0101.namprd15.prod.outlook.com (2603:10b6:101:21::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Sat, 21 Aug 2021 00:31:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dbb02f0-02ab-49be-6848-08d9643af3a5
X-MS-TrafficTypeDiagnostic: DM6PR11MB4691:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB46919FF6D9CEAF3D8B425F63F4C29@DM6PR11MB4691.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N8HjmAJ6IPFDrx/4+eVukyErryqToI/OdxL9XeyCG3WnitwoK+pDlHKz5/gdrypLMRqMnprw2dhRHjb3N9j9ILHK9s1Xb/tqTA0W/aRRJzym3isVN2XLP0eJLM8RTyiI6/5vmiHTs1m/9RPhVVRQmMfXIu1s96z2frNLDJRFYVyw5nryKcXKPP0251c81AiOXKaOr5vvTPkYPlFw8OdIO1DBgfYPm1C1eOIta+y44+17ysW5Jnz9UNDIzCk2rXsS21nKIz4C+zpOgWdq8xTLbm3L2LRZTgcQV/BA/Z9NMfRAzQOQ9lY9Cw4rW5HpZa+Sjtg5wiURi1PSaX39KwdZb1be+PwbYxctd5f3nXJ9zfiD4uNt/ytm+9EJYEe3bOIQG+gBIuuiQcFYgVscAe8w5k5v3YO7XMBia0NzJKoqWi670Kdzup0Ml7qnXY6yJyozveXmrR2FUZ33WfoNp1uTJNA//bK+CDc2lncwecKO40ffEa0Q0c3XyHP9T6xbs3THOcv59uaO9j6z8ZQ6thRIDD/TmhNWI/UJpRcF4ShRZeBgpi1aCdGk9nHBjPPlcfIerN7zCB1JukObR1DLDISkiwWY/6vqCXNgDHO3VEIh3NJoU58kz9yj9b7oO2WxFuTFwEwWOQu1iLnKj1Qn2v7QgS/n/n0aKGvRTFBHNYa7FBzk+4KOLsBTZnTpHYKBX0pEjl34qg9iyYt7E51P7bD3O6OhOKrxFwSR4FQVJ4EBIUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(956004)(2616005)(2906002)(6666004)(6486002)(86362001)(16576012)(8676002)(316002)(5660300002)(4326008)(31696002)(8936002)(38100700002)(186003)(36756003)(83380400001)(31686004)(478600001)(66556008)(66946007)(66476007)(26005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnRoei9nVXhyem9YZFpRdlRlYXIxeDFqQjJuV21ZejR1UFI5TDhGZ2RBK0dv?=
 =?utf-8?B?N1pMRllTazc1V0lyRWtKZEhsUE1MRkNlam4vdXZkTXdNOUQ3TGVReDRhOU5V?=
 =?utf-8?B?TzN1OGFBbTlYSmhOQ3paTnpkQUdtYUlkZW9DamlGZmZSM2VBSGp6K2hibmhs?=
 =?utf-8?B?V25jdXF2R045TGNZM0hTYi83eXkralMxVklqb1lROXowNnNsMUxnMk0yMUNL?=
 =?utf-8?B?TUdnY1NiYnBoZHRxUFVyY1cwVWE5bFZBVUdKUU5pK0N2WXN1N1VGV1czMzJN?=
 =?utf-8?B?VFRxb1UzdkZTSkt2Tk96VGtrRys1UmZrMGl4Z2pYU3BtRkdvS1RHRmV4T3BD?=
 =?utf-8?B?WmFtZTIvMTlVWVE0Z0F4LzJFQkI2ckFrV2VNWTdlUkIvVmtlbjBLYlduTExo?=
 =?utf-8?B?bmtuTTRINFVBSVFIcFJDd2RyZXpBTnBzMkZsUEwvVUxlWVR2TGJVRllkQm12?=
 =?utf-8?B?NkM2eDJhQk10VUQwbFZObGl2SmhVWWpTTUUxdExtcUozc3FTWEUyZm1RWU9V?=
 =?utf-8?B?Q2tYR21IaW1LRU43Rkxnamd4ckRlVncrOTFWdytPdityTmVRVEkwNmVwQUVU?=
 =?utf-8?B?K1JnN0tBWGh3MWZ1ckgySEhESDlHbExlUlYzalBGYnUxL3FOVWE1YWM2Mnly?=
 =?utf-8?B?M1A0YWZaU0RSSmJ0RkFNaUlXU1ozMWRZd1RucUllRTk5K3Z4cFQ5K3NpcUxa?=
 =?utf-8?B?ei9SVisybmVwdDdCYnNhTUpjZDI0Ky9CR0VZNzNOTjFEUzJDNWtwNWlFTnpL?=
 =?utf-8?B?ejdqWFRKQTcxYk4xU2RjdUN5WktIY1FMZkY4aGpwSy9MK3RoUnlBSWFacjhr?=
 =?utf-8?B?azE5cXNpK3d2QUUyYmVCYVR1UjJWZ2JBMzB4TThlNFlUY3loQ2ViT1RtdVVF?=
 =?utf-8?B?bDkvcDJtMlpla0RlSDhTcXFrOEk0MzNXUUYzTTMzRmFVSVhCbWxQR1graTVI?=
 =?utf-8?B?UXRzT2dkaWUzeFYrWHhhcS9Cakhnd2tkc0loN1Uxcm43TGcwV21kMCtNazBj?=
 =?utf-8?B?aDBIRUphaWpNOHZPQXF2OXhBOXJUM1pLc0FIK2Iza000M3krSjc4dGhITDZp?=
 =?utf-8?B?L2VvQjduUUNQcDhObWw1S1VFQTZPTG5JVXlIYXFseUx4ZG9OZG1RVGNOQklo?=
 =?utf-8?B?ZEozSTdXZmNjakR6WDRkNVJ6dEh3RVFNcXBIejZvS1I5dWJZNlMwYnVwSVhz?=
 =?utf-8?B?cURaRVRKRTBjaDgvM08vaklJUDZrR0MwVDhQekFwNTNXaEdhT0UzditHa0FV?=
 =?utf-8?B?Z3k5ZHhZRG9kdTdobUE1QUhUSXByelJCSDY1SktWNWs1c0VZTTF5VElsczV2?=
 =?utf-8?B?TFRYSU1IZHptL1QyL0JEQTJxc3NYcitHK3VZNUEwNEdTWWM5NnE5c2tzVGJm?=
 =?utf-8?B?dG1OWkl3QzZiTDhldllPbG1BdG9iOTY0UFNHbnVNUGkyZEFINnVjRHJvYjll?=
 =?utf-8?B?WlR2T3hmT2s3VnEzc3Zrd2VCc2RmTXVjbXVrUFdIWHJzWVVjUGgxUHU1N3hN?=
 =?utf-8?B?dktiZzE2UHZqdm9rL0lIWExMUTJwelJBVHF2dlkxemNtV1VUTzFKbmMrU3Fj?=
 =?utf-8?B?TkpZZTZoQ2VQZnZ0V05wWW1jUjd1Sk9IdkJSVHJRaE9TNEp2UG80L1A3aDVV?=
 =?utf-8?B?angvcE9VcTQ5c2paSFpyUmdoKzVBcGpZTlIxZTdUK2UwWnM0SXpHQjFGVnlY?=
 =?utf-8?B?UWs4TFhSN2txOGVaVWcyQk9WU3k0RDdqOEl6dlhWU1dYbjlNczJ6WHh1QWIw?=
 =?utf-8?Q?BgfxerwcdKRznBG6gTUoE25g4zvf/2ubYZqBE+K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbb02f0-02ab-49be-6848-08d9643af3a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2021 00:31:01.0072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zltNwf4fHtPWtQS4h/8nFcYHMhnvNL4rgn6iebKQ+BGb1sfnEKsxKFpVRSqJ1rHY8ND5ql2LHCi0hHAePpuJIRGlGwVOMqsvGyd84Mf35gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
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
> Move guc_blocked fence to struct guc_state as the lock which protects
> the fence lives there.
>
> s/ce->guc_blocked/ce->guc_state.blocked_fence/g

Could also call it just ce->guc_state.blocked, blocked_fence sounds to 
me like the fence itself is blocked.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c        |  5 +++--
>   drivers/gpu/drm/i915/gt/intel_context_types.h  |  5 ++---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +++++++++---------
>   3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 745e84c72c90..0e48939ec85f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -405,8 +405,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	 * Initialize fence to be complete as this is expected to be complete
>   	 * unless there is a pending schedule disable outstanding.
>   	 */
> -	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
> -	i915_sw_fence_commit(&ce->guc_blocked);
> +	i915_sw_fence_init(&ce->guc_state.blocked_fence,
> +			   sw_fence_dummy_notify);
> +	i915_sw_fence_commit(&ce->guc_state.blocked_fence);
>   
>   	i915_active_init(&ce->active,
>   			 __intel_context_active, __intel_context_retire, 0);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 3a73f3117873..c06171ee8792 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -167,6 +167,8 @@ struct intel_context {
>   		 * fence related to GuC submission
>   		 */
>   		struct list_head fences;
> +		/* GuC context blocked fence */
> +		struct i915_sw_fence blocked_fence;
>   	} guc_state;
>   
>   	struct {
> @@ -190,9 +192,6 @@ struct intel_context {
>   	 */
>   	struct list_head guc_id_link;
>   
> -	/* GuC context blocked fence */
> -	struct i915_sw_fence guc_blocked;
> -
>   	/*
>   	 * GuC priority management
>   	 */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index deb2e821e441..053f4485d6e9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1490,24 +1490,24 @@ static void guc_blocked_fence_complete(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   
> -	if (!i915_sw_fence_done(&ce->guc_blocked))
> -		i915_sw_fence_complete(&ce->guc_blocked);
> +	if (!i915_sw_fence_done(&ce->guc_state.blocked_fence))
> +		i915_sw_fence_complete(&ce->guc_state.blocked_fence);
>   }
>   
>   static void guc_blocked_fence_reinit(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
> -	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_blocked));
> +	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_state.blocked_fence));
>   
>   	/*
>   	 * This fence is always complete unless a pending schedule disable is
>   	 * outstanding. We arm the fence here and complete it when we receive
>   	 * the pending schedule disable complete message.
>   	 */
> -	i915_sw_fence_fini(&ce->guc_blocked);
> -	i915_sw_fence_reinit(&ce->guc_blocked);
> -	i915_sw_fence_await(&ce->guc_blocked);
> -	i915_sw_fence_commit(&ce->guc_blocked);
> +	i915_sw_fence_fini(&ce->guc_state.blocked_fence);
> +	i915_sw_fence_reinit(&ce->guc_state.blocked_fence);
> +	i915_sw_fence_await(&ce->guc_state.blocked_fence);
> +	i915_sw_fence_commit(&ce->guc_state.blocked_fence);
>   }
>   
>   static u16 prep_context_pending_disable(struct intel_context *ce)
> @@ -1547,7 +1547,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   		if (enabled)
>   			clr_context_enabled(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> -		return &ce->guc_blocked;
> +		return &ce->guc_state.blocked_fence;
>   	}
>   
>   	/*
> @@ -1563,7 +1563,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   	with_intel_runtime_pm(runtime_pm, wakeref)
>   		__guc_context_sched_disable(guc, ce, guc_id);
>   
> -	return &ce->guc_blocked;
> +	return &ce->guc_state.blocked_fence;
>   }
>   
>   static void guc_context_unblock(struct intel_context *ce)

