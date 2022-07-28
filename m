Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC058367B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 03:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD09110FA55;
	Thu, 28 Jul 2022 01:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C06D10FA55;
 Thu, 28 Jul 2022 01:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658972684; x=1690508684;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wVjmGpXAsY8916UXzt533e7mCBLfvlJI/GYGTvbE8HE=;
 b=Tq7SMrsXr6CxXs6HfiYMuxaWYKOFtRKGWOc3e6DcEH/dmEfeB+rtL5kJ
 PmKKCdI7cvWM0TR7ek46+ZjbR9GAHbpVpstkt0faoqiRdPbpxugP2/m/q
 DMHtM0m01NjIZTthOZZW52Vo8tsucexCBC6Xy7VdNRTH5YEy6BHEb7Yti
 5iBG/6rGyoeuck3pbKjCIBEnF9ima7qe92FCN11xlR0LT7FTxXE7dEXWF
 9E8WdfOrmeOcNL38MkNUsRrHMd2kFttR5KMbL/KrC65E9MdMc7lNW5bYK
 6goIsT3FOh/tv0K6Q87fhkWjS55rHgRVpFwaXcEZmLmShiovkieK4hQb4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="314177803"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="314177803"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 18:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="727136803"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 27 Jul 2022 18:44:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 18:44:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 18:44:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 18:44:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 18:44:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzkEUWPnnwsYRun3SAqFnNLnn3w+9xilzdx14zt5KZc4qXLBXQnB9dOZ6lL2Glv/jJ+AoXj9Dq9qQakvLOKJSoPT8ZvPTvYnGQAzbtVR3G5HTl0oneaaKGCsMSrx4mbN9vZLGVZx7OxrXjAOBdMKJ3FsdnDA1IlDn73H8pbANm0uT5jKQxngvpt5B7qJAfM2tUtTe0sKBaBzDpCbGe4hs7xUgcxOxMCnwRjn/4/f3DWtoYeLMrsfvAJKPXMtuSi2I3/pWnL70WY5Up9wtH7/QouzMPbLK3F1s2gzgSE281AJlaAd/Q2A6HCPUgCw1NWBskM+SuBVtmP5d7yFqbTPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PPZyFDITavMqpMRJ5eG5iehqsvLAl9ShuPSgant6sk=;
 b=mmG3AXKxR15zZyqWmajmp9JJQM4xoBEfDmIGG2CYG4eriO5oUceFv4KJhGlIqwDyNOPsuM8kYdHUSdeSJL87Ckcaz3zvhJ2rndsCDNZxA0mmznyAPaMr2IRi7wyu27deMC6EGsvZZ9kbr52wHTJTr1U9sEdJd3Z4KmSyDinSGsJeF4dqFvqx5Oy9qFSRPETJBe9TVaHlFNDytMBiDxib7KFDvGHeMjekRxYdg6/+KgXZ+MibfwGIl0pTxfJWBmuedI0L+OtBN/V9hROYnTo+/5K5TT9rFThViBKifA/vejZpA8h4YhK2zhEHtbAXydbkUY8zDJEFrhl4k+fc92sE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 01:44:27 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 01:44:26 +0000
Message-ID: <1e05b82e-b19e-644c-c1a6-614de643dc64@intel.com>
Date: Wed, 27 Jul 2022 18:44:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915/guc: Don't send policy update for child contexts.
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220728003339.2361010-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220728003339.2361010-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a76197-970a-48b2-ed96-08da703ab480
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pEva/t0Ydau01qnEZqX4EyrqAejKX1T99aPB1gqCnnAy4mP/TIFLPyRaF44EUL2UMS0TAd5EvVY0faefwGpmbMcDgvM6JwWr6CBazi9Q9BSOBT2d7KoduJHAPTP8cM/QXPJdKhB1QgYr4CqHJy+9WVrtmHjvntimW2yAfGjNrRA1t++47idFWdmZAg5gE7f55t/Lzco/fp3E+OhhxgPupp2xyYufMPwWcDRBcwbBGKlzfvtg0leJ47CH6W79gvxLbKSBBWPiBeWvfIezNb7NQPM6O0H9PO2FQ4nocfta2DYI3U/nYZ5AlGxsUme24ETGPCUT9Bt/6DhdntQBC9vhmWswoXb4gOvG2U+3oNrypyda2xcUL6c53jHirIScTev9AhS6kqmM2llsDb8H5WRtJWLCxlmanifXEqvQbg/NBXOlq+PNf8saITlm7Egk4udX3OXuuenGEFdjWSr69AJUYAzlfmZsdAKMU59X4iI1J4NloZ+vfxa/L41v+cZUI936R7LDasyXSb0D4HaGLTNtZAZ4Y3KgfAbqOcIzar9j3eyy9NGzlez3J9NzR5Sp+S66C2r8anRv15z/AI9U821wp6YBijjBHh9AWXpnlySYQNywJbCSVrEA+gRX8nYTNcqFRGuBygA5Zxu4adnW1TWi9h07o+pC2jb3Hh6ElB4AqzCD3/9zLedggGdGPdhSqBp8Mg+M8c7Ly8TE93cPzecuRnmwRUVgrOFCWiIXv4aFt90wsLV0eT3Axspn6tpstIGg3ELWPwk1M2ExAd5/zFLq3hPevk2bSdwO9JM9wR39e0pNVrmc07QmOELG9wvlNvRQdXvV9dzEh5yC7QMZmI25ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(136003)(346002)(396003)(376002)(2906002)(15650500001)(31686004)(2616005)(41300700001)(36756003)(31696002)(316002)(86362001)(83380400001)(478600001)(450100002)(26005)(38100700002)(6486002)(66556008)(5660300002)(66946007)(8676002)(4326008)(8936002)(6512007)(66476007)(186003)(6506007)(53546011)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1A4UU9LM3hPU1JZUkxSNGpZWkVzdGgzQy8vcGtEL094Q0NWWmNjeEQzOTh0?=
 =?utf-8?B?M3dqSW1rdy9OaUFnYVVHckJQRG5RbVU4d0RQN3pBYjczaXBGWUdKbkh2NHZn?=
 =?utf-8?B?S2tQTG5jcjB1RktoUmsyeU5vK3l6TmVoZktRanNWTVlNa0tDeGIvekpWUFFw?=
 =?utf-8?B?YzdGRGovVytVSjMwRmJQaE56S1ZlcGZ3Rkx2WUZVTnJUeUNadlBwenZlUUhy?=
 =?utf-8?B?N0t3dlVrRFh5QzVCMUpkL0p5VHF4LzhCbDViMXNFRStXTHV2aFhMbjcycUll?=
 =?utf-8?B?SDlScUE4dGhwckNXNUdoTEMrMnZWQVlsK1hzM1ZaUStYSzlXSWlyZmhsMGt3?=
 =?utf-8?B?c3JyRWtnOGdDeFY5enlLN1VTZWRDRE5JRnljWHVVcjIxODRsRG1GYlhjYTc4?=
 =?utf-8?B?SERRd240YjNpbFROTEtOeDZsUW9YMzRYQ3YyczVzT0lUWHlTYzNncWVkN3NL?=
 =?utf-8?B?NnA1bldnUVRxZzZuOEpPa09NeTJsRW9icjVMeHN1YjM1bklTRUxuMGMxYXBL?=
 =?utf-8?B?YjN5TEsyZTdQNUljQ1NtV1Z4RDlmR29zR2NDN1NCc3ZsMnlEWjZhUkF6ZkMz?=
 =?utf-8?B?Mkc0UndUOWN4MWk2cTJwUVJlY2phUEZhNmFJM3l2N3UzdkpsN0ZPUW55Yml6?=
 =?utf-8?B?WUkrUENRNmZrSy9VdE5mWnlyWDVvV3hMaVkxWGJtRWhHZGN5NDBDYmZpU2pv?=
 =?utf-8?B?Y09rdVlUM3RLRXpzUk92OHcrZURJTmFCYVV1SmJrL1hQSjcvRm1CeXB0YzRK?=
 =?utf-8?B?TTZKRGVWRGNCT2pzNVNsZ25nMlhFRmJXbmp2WU5nMEpWVDRSKzVlZW1ndjJR?=
 =?utf-8?B?SFI1Vmw5eUlDVEYxcy9KR0pqUmkwK0o1cG1YT2xpZlgyc0ptME11eUZUeEk3?=
 =?utf-8?B?VnIxVGgzT2JjY0dRN1JmVWs5ZnNIWTI2V2EyeVlvcVlKb09iaHY5Z1psNlBJ?=
 =?utf-8?B?dmQzcnpmbkRORCs0SzluUXhNSS85bDQ5Rmk0S1FHUlBiYU90K0MySitJK0ZQ?=
 =?utf-8?B?YmovSXZpbkR2bUt2UFUrUGdCdzJXQi9aZjFLSGlFOTI0L0dORmdVMGIvZUkw?=
 =?utf-8?B?b3VVUExsMHVuUWE3ek8zSFNicFlNR2lyUkhhYWF4WXhVYTc2eVJMdUQ5RGxi?=
 =?utf-8?B?N1F6QnZUREhtRDZHTnoxR25TV2NDZzZPWTVmZHNmK1NlY1VkLzRoQytsZ2I2?=
 =?utf-8?B?RFhHUzkvangzdlFkWldyUGtQbGx2NmU3aDVTd0lqZ3BUV1d5ei9nSStsUklV?=
 =?utf-8?B?WHM2a2x6ZEtSOUFDcHFCalQyQ2FIa2l5NnFaaHJUOWZWVUxvenREWkl4WllU?=
 =?utf-8?B?Szk2SVh1MWJQSGhHTTBybnArK0F2d3prMTVkRlFLNDlwUjUzU1huSmdhTHpy?=
 =?utf-8?B?dTAvRFpkV0pzVFdDVlJGby96YVF3WTRPR1IvRHVZcW81SW8wb1phQ1pzeDZO?=
 =?utf-8?B?VG43bGxIMERXeTZyR05RbVJ0dUFaUWhzMUcxYnRZbGU2ZCtSNTNjWVJyK2NH?=
 =?utf-8?B?aFRlVVZaZExBN0gzL0daVjNGbXRkN2liRkNacEZuVGMyNUN2SnNqQ2FJYThH?=
 =?utf-8?B?M1pramQrTGNPNHA3TDd1S2hhUHkvR0U1SEZjeWliUWRQWXNyNXphQ0pNeVU5?=
 =?utf-8?B?akdoQnNha01FNFR3d29pVGFHUUtNOFJOaCthN1ZZa3NmK1FDVE00NnFxRTlp?=
 =?utf-8?B?b1RJUXQ1VDM2RjVqQ1loTm9TZ1NlR1hFU2tLYjY4ZE9rWklOTHdxUVVkeS9x?=
 =?utf-8?B?dGhvWnJ0WTZqUXZPczRqbGdxaVlhWGNXbTkwcjdqMkNTWFh6eWgyWGFlLzFh?=
 =?utf-8?B?ZEExS2FsMCtIK2xubTdBcU11cFU3U2oycGN6UHdKTzdibXVZUjd2VDV6c0hq?=
 =?utf-8?B?U0FJTjNwZ0krOXdGUitUL1AxU3orNDQ1ZnFDZi9jc3F4OTJsYkdWamRGWkVT?=
 =?utf-8?B?TWZvQzNKVnk2TzZRWjVSbzdHeE5WcWlkTkRzMDRuei9MbnFlL1V1bnFCUUhE?=
 =?utf-8?B?bjBiVCt0L1cwTUZDRzE2K0xHSXhtbHJaUll6cnZTdVRjRk1NRisxaGluQmRa?=
 =?utf-8?B?Y3BpaFdhbTRDY0dGcXRGcHgxTVZHVml1OHQ2ZmM0a0hRT3hYd0dBaDdOVlJE?=
 =?utf-8?B?Q0dWaHE2WFRndGZCT2ZUZ0dOODlsV0VZdDVNL1hnVU9SekJqY0JYK3ZXTURB?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a76197-970a-48b2-ed96-08da703ab480
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 01:44:26.8546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APq/drf+lCGAhKB9PuYMww4p4ywKqKVNklhIdnBj9VjHUtN/cpGifsoiRpEStGQxlTjyldiC/n+vTReNLBbPkIgn776dpNN1+d1Zh5fI7W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/2022 17:33, Daniele Ceraolo Spurio wrote:
> The GuC FW applies the parent context policy to all the children,
> so individual updates to the children are not supported and we
> should not send them.
>
> Note that sending the message did not have any functional consequences,
> because the GuC just drops it and logs an error; since we were trying
> to set the child policy to match the parent anyway the message being
> dropped was not a problem.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
Needs a Fixes tag for the original v70 update patch?

John.

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +------------------
>   1 file changed, 1 insertion(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 76916aed897a..5e31e2540297 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2420,7 +2420,6 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>   	struct context_policy policy;
>   	u32 execution_quantum;
>   	u32 preemption_timeout;
> -	bool missing = false;
>   	unsigned long flags;
>   	int ret;
>   
> @@ -2438,32 +2437,9 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>   		__guc_context_policy_add_preempt_to_idle(&policy, 1);
>   
>   	ret = __guc_context_set_context_policies(guc, &policy, loop);
> -	missing = ret != 0;
> -
> -	if (!missing && intel_context_is_parent(ce)) {
> -		struct intel_context *child;
> -
> -		for_each_child(ce, child) {
> -			__guc_context_policy_start_klv(&policy, child->guc_id.id);
> -
> -			if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> -				__guc_context_policy_add_preempt_to_idle(&policy, 1);
> -
> -			child->guc_state.prio = ce->guc_state.prio;
> -			__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> -			__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
> -			__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> -
> -			ret = __guc_context_set_context_policies(guc, &policy, loop);
> -			if (ret) {
> -				missing = true;
> -				break;
> -			}
> -		}
> -	}
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	if (missing)
> +	if (ret != 0)
>   		set_context_policy_required(ce);
>   	else
>   		clr_context_policy_required(ce);

