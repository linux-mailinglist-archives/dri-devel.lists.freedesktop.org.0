Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C13D18C9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 23:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33A76E9E0;
	Wed, 21 Jul 2021 21:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A4F6E9DA;
 Wed, 21 Jul 2021 21:10:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198790598"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="198790598"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="415681128"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 21 Jul 2021 14:10:45 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 14:10:44 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 21 Jul 2021 14:10:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 21 Jul 2021 14:10:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 21 Jul 2021 14:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoNiVBUc0KzD8dza10XWOFtCSnvci0jTvc7pGbO8elf88oOYNW8A4+M2TJOykJaDP7xVI568bQc7dTXscqyHggP0DcKz1yWGS34JRunwXTNf2Ve/Ag7vxirqcNGJuihmGMHNlIa9NJM3HC9bosMuMJzokFsQn3LyjdoqnlBIrDgy6oRJcO1BXyPwTZg4piNbYg3dHN5xqlA3yHW6Ck7fnOsdCd0L72UnoAsnkFkmnXtzDrkb0kJc1qB2Wbzi9XrVrTwNUe2spS2kkugEqFN8m3+/CRK7v1GCz9h6uqHnzlPUBLfbqcR1f9NLCVCTvKRpPsajnarH8v+Jz+Hcaz4ZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS8EnGEPuoMSHYBw7wUadTBjjEIlsRxvzJre+NY2DJU=;
 b=VM6rS2RPNV40uYlJtHoXvw4SZgTrLGzmjEzKAjNNEhppF72GBqbBmjlNiYB0W4HPuDQ65vzP6p0VK9drdl0ODwNkMPLwMdcjxf6XNVolVfy2zm46jZ3YGu/WbHcWy6VewsFtK+SbRCvTVHYfa4ReWPERpXRkBhKq1Y8uOLfpe2AfgQO66a2I1DVJ8Bn8ZNWw20dhdrslC/S69zpwKeEfeLuOVfBzxtOnvDBY8ZP81KpSPQbyTTY7ondpEr9L/M9peZHRpV5cwJQmW97Zg/u5p8CnkA9yVn7KqyuSD52WFTnM20S18EuhupnJZ3ow+wV+savYksThJniYriYNVNe86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS8EnGEPuoMSHYBw7wUadTBjjEIlsRxvzJre+NY2DJU=;
 b=anHPN0U7sjyXDMXVTTiWfkNJl8mzdH2wpuDNLv+mpc+FgkHlVq5GBvzgBpsFyYVm0p5O0PbKhrvVu2+L0CC7l6YH1sJpmpuFhPRnB6zY5UoNVwDr1mkxkjZSFd/4KHn5jLQ3ZfxZM8+y0A0zbCCDSeNDaBOsZHhBlcledmwfym4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23; Wed, 21 Jul 2021 21:10:26 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 21:10:26 +0000
Subject: Re: [PATCH 12/18] drm/i915/guc: Ensure request ordering via
 completion fences
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210720223921.56160-1-matthew.brost@intel.com>
 <20210720223921.56160-13-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <0d1a0999-c094-9682-9ad9-bda10db87cef@intel.com>
Date: Wed, 21 Jul 2021 14:10:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210720223921.56160-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR01CA0005.prod.exchangelabs.com (2603:10b6:a02:80::18)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR01CA0005.prod.exchangelabs.com (2603:10b6:a02:80::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 21:10:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2bad4e5-780b-404e-1733-08d94c8bf64f
X-MS-TrafficTypeDiagnostic: DM6PR11MB4641:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB46411F299C551724E5D1997FF4E39@DM6PR11MB4641.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: edIxihYxvKTgMuAlrjzI45jh5i7k8oYhLlUZC+qwo8ivBsefV6sF/yvycgTJw5ANwSBa9D9sTUumugL3ARRht7ev0cNKjdBWn63MIjApb0GyoFjebTASTQ5trtjlXIudRCspebjF95ej6BHnnxuQrQl5pGR02yTPEfw38rOhfxTP/JSSVDBRtN3f8drgr3Pls1fRDAUm5L48SdFGWOt2fdiS/px068eYy5cp0SWa76e3Gge3SS0QyRHlNH2ERD1wqLzSiEs2nM60ag4WTCcwwtq12FMEAjs7Mp0Cin9gf3O2/R1iOO8E8SE/CRu9o8ko1ZUV/4Cy4uXMouVHTAtQrKvYM3/ckkhCtRYsEe+fvCSDnD65TDcrAA/uwgBrpwk26IZuMeq/VyhiLaffcWyeWVW7/mXMsg9IYdPuKfHra59hXOx8G6WV4ksEOUVR/s6DQHCAu36t/DUSw03W34Vt/jugNVLHL7vOpbjHzXUTmPLyOB8joP3h0vkcPcccKH+hoxR7twK3qxrAnyrWs8pbwx389/AxuTzwkAkRosuGy3l6Jpo8ydxW7DG7hAw+OTcY5u+U82g/tgVzQbZ6dl/GWnKHojRlqi6Rkrg6QpJOjSpqqNTKfBamxI9RpofiKS0TK9XP7xZC/WbCrWoQbJBFWg5YL9kFyb32KQMjygMI6vsR1qwosfn05C09cfgQDK7ZtAZ4FtA8jznuIdiear6zQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(186003)(4326008)(66476007)(83380400001)(5660300002)(107886003)(478600001)(450100002)(26005)(6486002)(38100700002)(8676002)(2906002)(86362001)(2616005)(36756003)(31696002)(956004)(53546011)(66556008)(8936002)(316002)(31686004)(66946007)(16576012)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTB3dXg4Rk4xZkdud2krWWppODlsa1h4ZldLb2FPak1hU21qOUFXVldvYkhX?=
 =?utf-8?B?Uk0yWmFvMS9QY2prdXh3cm50cVFIem5iNnRxdVl5N1Y5dUhrQ21ZbzhQYVZE?=
 =?utf-8?B?VjUrMWdhYm92M2RFemJWSTdRbW1laTVhVXoxRk1sZnV0WUo5ckdRcnVPT1U2?=
 =?utf-8?B?SFFUQjg0UlQ5WHltMURpNWtZNkVHVGs1b2tBMGdCQXVMSmp2K05MZ2hZSVdz?=
 =?utf-8?B?Ynd3L3ZZTUlGOWdKeTlRdzdPWjJZOFgvUktpRXVOVmFieFdVUFZDeUM5VTVN?=
 =?utf-8?B?cmR6T0dlZk9CQ2l6cysvaW1GSWFhSGlUVTZUVDQ1Y0NBRitVZzhibjNoYkxP?=
 =?utf-8?B?dFBxUGx1Y0VURDNPRFFLR3VLZDhWQmdTVldUekpXTXE3ajhlZGorbDVDNndp?=
 =?utf-8?B?UGYvb1E2U3dWSG5Kb3BMNDlSZ3hzcERlS0tHYzdyNXhJM1R0Sk5KclRGWS9y?=
 =?utf-8?B?bHF1Uy9sU09CQmI1MjFnbFhCdkJrMHZEUUhmaHBFbTdoWUt5NmZsd1BZbGpX?=
 =?utf-8?B?QTd4aU80WjJ2dzQ4bzNiQ3VxMURkaWc0RlRLT1hKZFROQ1ZvZDNHY3dpWjM2?=
 =?utf-8?B?bHozcXo4MHZ3MllTSkxGQTdoOHF4NnhpemlQU2JFWFRRS292Z1hmTEtUN3Yw?=
 =?utf-8?B?dmJURHNpWXJRNlZvYUtZZ0dtRUw3YWVlUDFWMnppcnE2WWVjNnNLWjNWT2Q5?=
 =?utf-8?B?TkloSHgwL2Jadm1wYW5LNlhVUkcwMjBnUldYSy9nTERRd0YrMFZ4RnVxbEFl?=
 =?utf-8?B?K2JOTUdLMmpuMHozQkpSb09Hd1pjSDduK2pvN3hhYytBMmRuSkVBWXoxRzZH?=
 =?utf-8?B?RWFzdklBb1FNYjRad3d5amgxUW1hbHRoMUIyaHY5NDd6TGZQZTYyVTZmNldk?=
 =?utf-8?B?aXVHV1F2MUhXL0FuQjF6djYwNEpVanRkNHFQM2R0UVJNS2JsOWI1ODBSTmFV?=
 =?utf-8?B?WC9NZm9JaVduY0xBSVNFMy9RZWtJVzZhNmNxRG1DMnNBOUlaNENidXRoYXpQ?=
 =?utf-8?B?ZjRvb2xtVnZhRFJZbngxOGcralNaWkpjRFRQQlpadXpIS25LMi90TmVVUFFn?=
 =?utf-8?B?S2ovbDZhKzNpM21DclZqU0p1TlFKTGt6ajRUTjR4anlHT2tlK3h3cEVRM0Iv?=
 =?utf-8?B?OG5rT1ljWlF0aTlnRnptMEYrNjh5dXZLZzhqRGZFc21KczdkYlMwZitwZzVK?=
 =?utf-8?B?aTIrOVIwWWtLa3pZMFlIdXBUNW1pS1VGWkl3TDRVZStJRkc3emVLTC8yb3U3?=
 =?utf-8?B?THZvaE5qNzFaaW9QZmN3VDRBTE0yQjVERHFFaENnR3pRVXhrRm96M0s0VFEx?=
 =?utf-8?B?V3J0Y3BOTnZCa3gwcEt2S2ZOZ2loMkdYQzQwRzdKVXBXcXNxQ3I3UjVTSWd0?=
 =?utf-8?B?YlBpaGl3SUxGT0dWeStvdnhXNFdhcHYrUGlKS0Q2bUxlSFh6KzNoM2w4U3M5?=
 =?utf-8?B?K3RoQ1JSSHBYd1VsRFI2SXFwUFlVQlZTZG1qZUtkUjBRaVVCOGJ6ZCs5VUdv?=
 =?utf-8?B?WERmWndhMFFoY1ZBSXNzN1M0eWt3NE9qN1JmZTVXTnhCT2tFaWorZDMvREZs?=
 =?utf-8?B?MnZjWjhtdVFTTVh2eXI1ZmNuOUFBajYzOVBVb2N5cDVybkNHV3ZYeThJSHdO?=
 =?utf-8?B?SmVKcWp6cHNndSthbzFNR3A2eGw0ZmNQaTNBRW9zT1lqUzFFUXJ3UlFJdVpW?=
 =?utf-8?B?Z3A2b0FMWGpEcGh4V0lXTXRxR0VIbG80aEE0MlVodXdxL2hpV28vclBLenFR?=
 =?utf-8?Q?ZuHcs0n/f9jxxPvFhDu/X/W8CMjHK5OaXkhpmrg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bad4e5-780b-404e-1733-08d94c8bf64f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 21:10:26.7035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDyXelosDhcDHJYkVbhrHaDIDXN+In/GLClaQUAuMFsX3IIlvf0ZkMKZ1rykJ7GppcxSz+E8y0Ls0y9im2xlRGzOA9iF/mfVDrD0na9jYi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/20/2021 3:39 PM, Matthew Brost wrote:
> If two requests are on the same ring, they are explicitly ordered by the
> HW. So, a submission fence is sufficient to ensure ordering when using
> the new GuC submission interface. Conversely, if two requests share a
> timeline and are on the same physical engine but different context this
> doesn't ensure ordering on the new GuC submission interface. So, a
> completion fence needs to be used to ensure ordering.
>
> v2:
>   (Daniele)
>    - Don't delete spin lock
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_request.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index ef26724fe980..3ecdc9180d8f 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -432,6 +432,7 @@ void i915_request_retire_upto(struct i915_request *rq)
>   
>   	do {
>   		tmp = list_first_entry(&tl->requests, typeof(*tmp), link);
> +		GEM_BUG_ON(!i915_request_completed(tmp));
>   	} while (i915_request_retire(tmp) && tmp != rq);
>   }
>   
> @@ -1380,6 +1381,9 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
>   	return err;
>   }
>   
> +static int
> +i915_request_await_request(struct i915_request *to, struct i915_request *from);
> +

I missed it in the previous rev, but this forward decl seems unneeded.
With it dropped:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   int
>   i915_request_await_execution(struct i915_request *rq,
>   			     struct dma_fence *fence)
> @@ -1463,7 +1467,8 @@ i915_request_await_request(struct i915_request *to, struct i915_request *from)
>   			return ret;
>   	}
>   
> -	if (is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
> +	if (!intel_engine_uses_guc(to->engine) &&
> +	    is_power_of_2(to->execution_mask | READ_ONCE(from->execution_mask)))
>   		ret = await_request_submit(to, from);
>   	else
>   		ret = emit_semaphore_wait(to, from, I915_FENCE_GFP);
> @@ -1622,6 +1627,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   	prev = to_request(__i915_active_fence_set(&timeline->last_request,
>   						  &rq->fence));
>   	if (prev && !__i915_request_is_complete(prev)) {
> +		bool uses_guc = intel_engine_uses_guc(rq->engine);
> +
>   		/*
>   		 * The requests are supposed to be kept in order. However,
>   		 * we need to be wary in case the timeline->last_request
> @@ -1632,7 +1639,8 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   			   i915_seqno_passed(prev->fence.seqno,
>   					     rq->fence.seqno));
>   
> -		if (is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask))
> +		if ((!uses_guc && is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask)) ||
> +		    (uses_guc && prev->context == rq->context))
>   			i915_sw_fence_await_sw_fence(&rq->submit,
>   						     &prev->submit,
>   						     &rq->submitq);

