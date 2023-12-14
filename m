Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD681297A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 08:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B9C10E2B1;
	Thu, 14 Dec 2023 07:36:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1010E8D4;
 Thu, 14 Dec 2023 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702539359; x=1734075359;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pJdxHeL8fgiZB6oeKGcubXS4gZxaG5LjSc9xyjI9xf0=;
 b=cn4dcb3bXStxG/qgFLfVJtxZoR5s2BxpvJFhG76aV+F6bs6um5SIqiZW
 Rge6l3TsudYuWIN6VbbQTvS2z/CYawoY5J5Cxi/NMNknJSlHb71/qKfWn
 y9RtRJnK17RbZ8RL/nT15bgiMWRW8hM3Vh7ktfoYppxkw32d/CvbJAuQm
 ecLe4BFSd+OA2q0saeYiLPkpsawFOJkZJyc20NNaX8/MDawA7PCD3BuAx
 pRObzZB7tj42C6Tj2INlf1OEyajXLubvP1xWruwjBgzWryLWQOjVQsnN1
 F6zfuKRued3Xp8f45j2VYQYPl1G9HXVOhaoDv4RvWfEJXhvvCuFUduEoT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16630935"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="16630935"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 23:35:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="840178001"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="840178001"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 23:35:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 23:35:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 23:35:54 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 23:35:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avvV6YfCteK4Z6WUrhu4oqnF2DTN0TX7ucD7AizhDqBHwYvwyvl5zIesj/KdDhOb03R7GNy6wNIPkWP1Cy16vzLdSRYN42smjvLPETzgzZ75UccSq8QIHvGQrWEff7PeXSBGJWahOGQw30KJHBNqGKqX3aizwyQ+DC/IwdXd0zl34B0usG63hH0L8h8fUGdRlg1lIVQYaKqxbhq13IwkmMIQ0kIv6pPv/aQGXou/vtAmHDPfYT1WrKpLBULDb8gGXbR/8l5J4v+qVWdO1KqFsWW4wlCGaKJI6KJIndVyJb6EbhmwF/qr4M2/W1s82/NwkQAUIC9ivMZic8PABDp29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KsWYzSTnq/3jL8sTl5a4BOi0gtp6kTZKAo3FwbpVtI=;
 b=RsSwPItBzS0U2THmWRcDQa2FPCkl3TX3w1tN5jZGR9+bAAYRvy9qEH3tK1Yir62mpDkRmQ6WBHw9e606MKYFlb8ZPbnYqh61C2mKsCf0yX5b9ksg54Wer+P1V7Gy7dJNYZVYg39BjEYe76Wp4nIs2zvWYKxqVWwEd04KJfPOPknbLuSyJCDhdWBd9d3QW5K1ULtzD5eOUal7n/3MxstjQ/3GoCYH5JcV5X5ckkVQa7TBxNNLQkXqF0oQFRaRhyQJKBwc47wqX8643acFsisHdo3Waiz4KOimzUN1HMLy0M85qZkC11TDVPHx2LEBzotjk4bA0Hqed86jv0Z2f5XcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 07:35:51 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 07:35:51 +0000
Message-ID: <0fe8ca5d-ce97-4ef0-a609-519bedf04f93@intel.com>
Date: Wed, 13 Dec 2023 23:35:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v2 3/4] drm/i915/guc: Enable Wa_14019159160
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
 <20231027211814.2696398-4-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20231027211814.2696398-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CY5PR11MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: f38526b0-f0fb-442e-3532-08dbfc774c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QSnAY1Xidd6zqmq1IHctsj/bewfBvPmkvsQ5ga/e8rVuMDaNZqYcfUBxJPk2eMMx2Nr8548tmLuo43ANhPJiMPAjVtOOpkD5Cvkde/SL480xxlOEYVAPJSj/qIrJkbZEccwxGBD8IF4L4iF0RqxeGkdfwT6hjX1WQChhNX9u33OyXVIVWZm1l1v2k5ZXYVpzNZLk3vCYSoKJbrtWlG3dY4m+0mtlWBywC0S2qIAmOPvmMWTzjNYD82Hex3vvcURVX89XDaCFNqp0RXHNK9Ct7jERvtNlWV0cHzyZWJCjXpQMZx10BeOnEOuL5DN9nenJUXC1Kn7PluvMfd+WjmEzXwyFl87Lp3FxlIa/+A+sGSQPSF1AAXogS70akRxlEtGxSOr6YRV1Ku3fAQhf6Oq0uNXovQCbYJ4mADb04qubjRCj4BkGBcJlfWlwA0sTcUyJbnHAESEQ9dFzBhwOwVNwT2RKQv8PSygTj8OrtRpOj/kbbzrlCWFfcPpZkj8olgBPOGJJ3R/nupEPEcHaYKXtYLHfE9+Qi9Uw0WQ8PJvCPLVq8I8rs1px1PXeHRW6saf0QkY7P0pZM7/frmgpf5kX3E43KvzXRj8yLNQ3zIUTYAR7WKrPR7APUwxYCHNXFneI4fXv+yqrvPs0R/Za6+Fu8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2616005)(450100002)(4326008)(8936002)(8676002)(316002)(26005)(478600001)(6486002)(82960400001)(38100700002)(53546011)(6512007)(66946007)(66556008)(66476007)(6506007)(5660300002)(36756003)(31686004)(83380400001)(2906002)(86362001)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVhWSTNLalRiTU1BNWNleXpLQWhyN2JlbHdBMGNEYlorMlNWSHBuSERuSDhB?=
 =?utf-8?B?R3kwc2Q5bjByV2svb0JZcldXdDJweEtwUmc0TlpXd0plZkw2QXhZZVliUGJl?=
 =?utf-8?B?Y2xYSldkek1ONHFWK1lycTlscFl1dnh0dHN1akdHd09XbVhMV1grWVVEc0JW?=
 =?utf-8?B?SXdicE80RStvaUFma3l6U3EvMGRWc0ovN3J3dXZBNmNpNWNxS05UdHJhOW1z?=
 =?utf-8?B?eXVBQU12K1Qyamk4eUZFaFBOUDFNUDBsc2RJdEFDOG01S0hQd25pTDV5T1Yz?=
 =?utf-8?B?RUxBcXo1MkNFRytsNlczUlBFTGNEWkk1aGlwWFVPMTdRWUR4bFNqN2RsMW9o?=
 =?utf-8?B?L1JHRWhBUHNrVnBkWWtVcitpUkd6UEsrT0FrbFA0OHErQ0ZMWTg1dWJOazZy?=
 =?utf-8?B?RUJ2SWx5RDZTVmYzWWwwRTVqanlYV2JLczZZMmZQbVNIem94UXQrSGZKSzVi?=
 =?utf-8?B?cElMYzVBZVdnQjl0VWUvWkV1TS96SWpqVWV4NUlHT2pIcjZkSWpqTExQQTl6?=
 =?utf-8?B?eE8wbGp2TTgxMkloVEZYZUxQUTlwQjUwTEIyQ3NQV0toRFhhV3ZYV3ovUTdX?=
 =?utf-8?B?Z3lzbE1Gb3JaVnNvZGVrRFlHWm9iK1F4ZVdaRVN1ekZoOURBL25ORkpTcWVh?=
 =?utf-8?B?cVM1aXY1SVFIdVZHYUlhdmtrajdNcXRPYUc1ZzNUaTU0dDBjWkxPZ0Yvakkr?=
 =?utf-8?B?SmRtenpHdkp0b2N2clVqNzdHQXExY09NYTYrMnIrTXJMTWVSVUpNVkx2eEVZ?=
 =?utf-8?B?NElOeWcwUGdGUE5OSE9reEx5elQyNW5NdlZBdkpLSXN6L1oveW9JeGt1Sy9j?=
 =?utf-8?B?UlYyN3h2OUE4K1hLK0ZhOXQ1WXB2MU1PclRub1VYd0MyUVV0RzRBYi9RNGJw?=
 =?utf-8?B?OHJGbVRrVDB1RnFDWXNIWmJPaXp2ODdTYXQwU0dVL0ZYbDVnU2EzTXIwZU1F?=
 =?utf-8?B?TVUwRlR0b3JYY256SGVGeXN2cnBBWm5ZZmhIM2lGWUVteFBwMUJKOXl1Zm9E?=
 =?utf-8?B?WlFuaW9iYlB4RkUrY0pGRVU0ODVEZlovRXNYYUlwYzJ0RWkyN1Zyd1Y3RFBY?=
 =?utf-8?B?OTRuRHJyRk5OcGxUbWdwUUZMYTkwTmxtbHZMcHFvNnBsdm9zV20vNU5xcTVy?=
 =?utf-8?B?MXU4anFCT2Z0VkRyOWF3STNwTmNlR1N4ZzRHRktObW9KQ3JrOFhDRVRzM2Iw?=
 =?utf-8?B?WTh3bldrTGgvWjZzRjgrT1pDckhsQ2FXZm9yMGZ0RWpIYXdLSTdSa1VxZjRX?=
 =?utf-8?B?OUVuTWRpYmRUK3R0N282STJHTVlndktIb1JydUdONjZzUmwzUmp0c2ZhTVBz?=
 =?utf-8?B?ZUNvV0ozM0s1b0Vmc25Da1JpSGVHODNCcFE1WnVPbFdPbllOV0FReGQxc1VO?=
 =?utf-8?B?M3o5bzRIY0RNeVZ1NnJ5dXZUS2Mra0g5T0lHNXVCUHBmVENtVEpZTlU2SzdH?=
 =?utf-8?B?cmZSNDBURC9IaVBkK2JNWDZZSG5BWVN1SVpkdk9Fc0xzbVVvc2syaG1pQTFM?=
 =?utf-8?B?ZDEraDlWZmw3WjYwVFVhbWhsODFhZjBxMGUvU1ZjcXUxVFdIWG5qUzkyazBV?=
 =?utf-8?B?b1JuR1VTNEhsMHEzaVZlemgrSkszaldDUUZKUE4vRDMzclBMa3FuMkt6NU5B?=
 =?utf-8?B?L1ZWY0VTQzdmTGk1RXZERzVJM3cyZTV1QUtNZDN1YUNQdDh2R1FvQTlsM3pn?=
 =?utf-8?B?V0g3Q1ZoV2dtSEUxVEpockNIWU1XU2NXeHRSaFBpMEtSWCs2ZklZUVV6VlVI?=
 =?utf-8?B?TEJXeFh4Z2FYZFBkQ2N6cUZHeU83RHFXNHhSbGJjWWVFbVRudmd6dGlWWllD?=
 =?utf-8?B?aWNyeW1iRk9QZmtGMGc2NXVnTXd0dktHQ0Y2NnFTYnpaWmlXT005d2VqZG8y?=
 =?utf-8?B?dXA1bmt3ZjcvM0ZYbGY3eFRXM3lmYmsvaVpla3Z0Z0Uyc05pYUU0bU5Nb1RC?=
 =?utf-8?B?M2I3UUpWVldPTzhXaER4VkpxZ0VDWE1DSzI1UUptTmZ2aHJHQ01zZUdYKzRS?=
 =?utf-8?B?NDhScVV0VXloQnRLakRIVkUxb1lZYTNTeExIdERqYlMyQzNRejgvRmF2UVdt?=
 =?utf-8?B?VVp5cldKcjlKK2xyVEMzaXF0MVUvOUhTV0h4OXFsM3A1bWdNSXdLYWtveGpq?=
 =?utf-8?B?RU5XNnljZ1ZnUWt3dGZscDAvVm1oY0hUMEZzWUQ3d2tndHhUcmViMis3b1ow?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f38526b0-f0fb-442e-3532-08dbfc774c11
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 07:35:51.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flD/g0/RjMagRF/8CH5LmbHoscYV1j2NUrjjxXt89yNIAB90a/mXTcprwSin61kQxmWXSy9/Oq9L34hN87vgsdMXCWsNklRAJ9Rb5AuGXUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6342
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


On 10/27/2023 2:18 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Use the new w/a KLV support to enable a MTL w/a. Note, this w/a is a
> super-set of Wa_16019325821, so requires turning that one as well as
> setting the new flag for Wa_14019159160 itself.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  3 ++
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
>   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  7 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 34 ++++++++++++++-----
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  1 +
>   6 files changed, 38 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 9cccd60a5c41d..359b21fb02ab2 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -744,6 +744,7 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   
>   /* Wa_14014475959:dg2 */
>   /* Wa_16019325821 */
> +/* Wa_14019159160 */
>   #define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET	0x540
>   static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
>   {
> @@ -753,6 +754,7 @@ static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
>   
>   /* Wa_14014475959:dg2 */
>   /* Wa_16019325821 */
> +/* Wa_14019159160 */
>   static u32 *hold_switchout_emit_wa_busywait(struct i915_request *rq, u32 *cs)
>   {
>   	int i;
> @@ -793,6 +795,7 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   
>   	/* Wa_14014475959:dg2 */
>   	/* Wa_16019325821 */
> +	/* Wa_14019159160 */
>   	if (intel_engine_uses_wa_hold_switchout(rq->engine))
>   		cs = hold_switchout_emit_wa_busywait(rq, cs);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index f08739d020332..3b4993955a4b6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -695,6 +695,7 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
>   
>   /* Wa_14014475959:dg2 */
>   /* Wa_16019325821 */
> +/* Wa_14019159160 */
>   static inline bool
>   intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index 58012edd4eb0e..bebf28e3c4794 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -101,4 +101,11 @@ enum {
>   	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
>   };
>   
> +/*
> + * Workaround keys:
> + */
> +enum {
> +	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
> +};
> +
>   #endif /* _ABI_GUC_KLVS_ABI_H */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 0e6c160de3315..6252f32d67011 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -295,6 +295,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>   
>   	/* Wa_16019325821 */
> +	/* Wa_14019159160 */
>   	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
>   		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 251e7a7a05cb8..8f7298cbbc322 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -810,6 +810,25 @@ guc_capture_prep_lists(struct intel_guc *guc)
>   	return PAGE_ALIGN(total_size);
>   }
>   
> +/* Wa_14019159160 */
> +static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
> +{
> +	u32 size;
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */
> +		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		/* 0 dwords data */
> +	};
> +
> +	size = sizeof(klv_entry);
> +	GEM_BUG_ON(remain < size);
> +
> +	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
> +
> +	return size;
> +}
> +
>   static void guc_waklv_init(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> @@ -825,15 +844,12 @@ static void guc_waklv_init(struct intel_guc *guc)
>   	offset = guc_ads_waklv_offset(guc);
>   	remain = guc_ads_waklv_size(guc);
>   
> -	/*
> -	 * Add workarounds here:
> -	 *
> -	 * if (want_wa_<name>) {
> -	 *	size = guc_waklv_<name>(guc, offset, remain);
> -	 *	offset += size;
> -	 *	remain -= size;
> -	 * }
> -	 */
> +	/* Wa_14019159160 */
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
> +		size = guc_waklv_ra_mode(guc, offset, remain);
> +		offset += size;
> +		remain -= size;
> +	}
>   
>   	size = guc_ads_waklv_size(guc) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index bdb321d8e265d..225812b299524 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4383,6 +4383,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>   
>   	/* Wa_16019325821 */
> +	/* Wa_14019159160 */

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
>   	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
>   		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
