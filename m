Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D175AE6B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 14:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F7810E137;
	Thu, 20 Jul 2023 12:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9459810E135;
 Thu, 20 Jul 2023 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689856232; x=1721392232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ab8E4/mxrtJLf7Yt+T+O6NRCxOghO9pbGYcc9xmH9CE=;
 b=ARmmnsL64kuEAjGA5b5h/HbFj4qw6bcHio2shF7lkyqfzcWQ137ieNoI
 hIu9zJpMaQHgQ9BTT2nnf7AaIdvs/+g6SoqL6aI95ZRglVsCsrkq2NQke
 rPShBGRycQLHAWQ3gcAHTWSIq5Cu5Y/3vFxfRjjOgNrDiMyQvHe0rIy3J
 rP43sLyS3BdrJJ5iMF52QBdLo2AL0YbXepPbQ5eOwMThccXffWo2fyLqw
 XQpHykPhpnYcNFX01DfKUHMWc/nHJo9cC1duRDtIobACbmDMv+O3pKNKj
 S23Utjc3e2Xac+jOatUagnb8DGyKGEDUDTgtLdIV16hclNaU897cUqedC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430484539"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="430484539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 05:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="814506115"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="814506115"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 05:30:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 05:30:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 05:30:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 05:30:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 05:30:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E37goz1wxSQeImmXhbh/h8fJq2G6Ll99hRN8i43RJ4Wv2k1aq+vPVrzuL5GyU9kM62eKTd/FUa79oUH5oGr1RX5D+uQfJ7otIty63ck54nHAtnQ6Z9vKfj37ecLZAcvUKCc+KaBqjsQX3/DHe55OhabN0net8bKCiOxeDZKB/DJyY2nO8TnyyAtxuzjOkGKo146l29COlILudXHjsE2T9T1VS39n8it427w6OyTm8UAW63pfKc34DGY2R/Qu7bt/luYTP9yFmOux1z3Cj65zhZQabyeS9oGQjoCrM1E2+d3k7Qyx9rNIss4U8GqFfiRbO2EjPD1TxKX0qJ26epG2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5x5yyqC5ptegqsHmI0xH54yEzaAtzCobzoUmrbqwaA=;
 b=P7R+HoiHQP1odTAZEh/g8BSS2JaniN2EgzsGs5as3NeSxCY+HvQY04oYCVKkEEw2ppV1QhMRFf8EoFEjsgixymvBXKQBGFzRxNI3wjZOU07WIryq6PuldGcoZeOfHnzfELFRGowx3GQ+CohrzBwvaaTiDKBjvfOcejqbwRz3X8YGAlN2IqVly5bMMdvHSgd3/F0WEv01t3WVBmAAFol3oXBYsLMFOR9nzj93L+j3a0D/7/7H7TDpq336GiqaLb7Xd2HU/7d/9HcApPYGNIUPeUBjwZKv3ZsUUKyWll3/WeM8nIpFAif6JF732DP0Zpum7fXJ/JYGcithuaIi3CAL0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 12:30:21 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1272:a789:3ebd:6bee]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1272:a789:3ebd:6bee%7]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 12:30:21 +0000
Message-ID: <bb62cc74-fc17-1727-1708-4825ebe79298@intel.com>
Date: Thu, 20 Jul 2023 14:30:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 5/9] drm/i915/gt: Refactor intel_emit_pipe_control_cs()
 in a single function
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Chris
 Wilson" <chris@chris-wilson.co.uk>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
 <20230719110729.618733-6-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230719110729.618733-6-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SJ2PR11MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7849c2-6d1f-410b-b607-08db891d1577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gIM7I+Ta5Q7vxhzMedkd8pCDopFB/yhBJV58Pd9pxQnHNAmkdaXvsciQjF6ZP7aIGeP2umWCgI85T7otXvCpwXEQjdVAFUpGF1rZV7F3Y+WlX6sHdU1VfestTvdni6CR7NGMwQFA8MaLFrUZk/0yTrZ1jKXWxnZA5bwmKVmGBBNHeS7X/jwvaSHCX353Rkcimz0szWPQZGkDAxuJ9KAkVRikS0VWmQREqryt16tJREReFbp5tIT7z9UD6VyhYRYeoJ+7CZWEKKOl7ItTjycjrWrWGyfOiukrGPA+I+jNlOSEttdV+31CmPtLQVnXehVuysjsisvPf86+WPLx8arINYS8elIYaCCxDMO8a1BRcHafCd/UTqEieRXLyWKnxRS3QcvRsSjdxl5c9xBtIxVpWfICGYKvGQuYoe4EFtwjL4C1yykw3+5yQwbu+GMCqQORGcVBJK6pdd7cX5/1O3fUKe1cKf0cure3bgaYFGuUvgO+9MzO8ywu0EZbJ+QTJAnvBPiU9D+U8U/z73jiPiMVv9jLzYTmKKuD6nPuMe3YT2KQ2L8/kPKjyuPMa3LdVDBbpE1eSrfmAsI+5IHDITyh6KpD5v2j9iHK3hEjUwkJAOa5XbsAkthGaUhcYtSd/mB+kxyt110SlkFXn90gvJx1bQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(6666004)(82960400001)(2906002)(6486002)(8936002)(8676002)(5660300002)(44832011)(31686004)(31696002)(6512007)(38100700002)(41300700001)(6636002)(316002)(66946007)(4326008)(478600001)(66556008)(66476007)(110136005)(54906003)(186003)(2616005)(26005)(6506007)(86362001)(36756003)(83380400001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z25XbjhyeEdaYVhNMlJXdk55Wm5USFVaWVg3Qzl2MElRd3FXRHJVREhqVEU3?=
 =?utf-8?B?UWZaem1waTNWdkV3OGIxaEFZV0VqRHhkUGVYY1Z2YjV0WU53RDZWNnI4ckt1?=
 =?utf-8?B?RTh0L3FqdnUrczFTa2o3RTB0VjNWZzZ6UDNoYlBHU1Njb0dpUy8xcDc5WEhl?=
 =?utf-8?B?dEtIZHZyYjJ5RVVTQzF1UWxPOTJxbVI1K2h3bm5VZlNuMlQvWldmenlwYW5o?=
 =?utf-8?B?eUg3bDJYb2ZpUUFWanA2UG1uM2dyTjhzeTExVlFnYkNWRHNwby9lMXM0VWRy?=
 =?utf-8?B?S1N1eEFJZmdaTmR1RXVaZW51MWU2TWZLbEZqcnBhVTc0TmRIR3lRdVZFdzNC?=
 =?utf-8?B?Rm5MazEzV1lSaEp4L2hUYmlCdzBENFgrdDFjR2xKU00wTGR3SllRM09yT2RD?=
 =?utf-8?B?UFc0bE1tQ1hPTWdCMnFMWmlsWVFEOXo0TUp2Ry9CK3p3R3pIZStqN1Jjb3Jj?=
 =?utf-8?B?M1hSOXVxN1B5ZDNoUjZEMms0RzdPTWpCZlhNVHlLTUlib0JseEZRY0tpdXBi?=
 =?utf-8?B?MmFjVWp2MnROb1pHMFF6QWkxUndQRFZuY2xmY1dpQ3h1VXIvUG02SXZWRHVr?=
 =?utf-8?B?MzN2bk8yTzFzaUgrbnhkdHBaUWEwTWpSQkgvc3psT1pIVGdCRnFHejdFd1p0?=
 =?utf-8?B?ZDhZL0JuUkNsd2Q5a2Mxbld3OXJiSXZxcGwwZmsrVGkydENNalBoWVllZGVQ?=
 =?utf-8?B?TDlBSlNEd0kzeFZtbmJONDdUUE05MEVveFNsampkTlJFczZoTmpxdDZJbzhF?=
 =?utf-8?B?SnIyMFVWbW9GUWxoeUxhRkNUbzBEdjRkSklCdGsvWTIzWjRMc3RuVlFIL2I3?=
 =?utf-8?B?TWc1LzlNRXQ4WFltZll5Y2l1QkZsQitXNlg5R1VueTZ4ZHJVUTZiSGhkTW9X?=
 =?utf-8?B?S2FmMnU1c1E3NU8zRmRYTzhJTC9XMURReFZ0a0djUXZxbmh3cXkremk1KzZ1?=
 =?utf-8?B?VVdOVWxkNWpnNFBtVzNxQ09mOXlCV0R1cTF0cFVxbUgxc05XNFpiemZ6cnYr?=
 =?utf-8?B?alE0bVVUY1hNU0JleW5XaUpqMUNMWG5uaGwzWTUrYThtaWdPd3poc0N2WUNj?=
 =?utf-8?B?T216RGI5aHQySENTVUcvVGtrWnFQeFVzNEl3eU5uRmZzaGlGcTZBZENYNUhG?=
 =?utf-8?B?ajhwalZCVW1Lc3dFZjRVTUhydzkyL3lKTjR5YTVKR2ZlclVVUnNDTm9PY1Yw?=
 =?utf-8?B?T1hjaHZOeENoc3krRDNVRW1QUDd0WnJpQy9EZ0Q3cWdrc3lGbDh4TEx5Skxp?=
 =?utf-8?B?ditOQzVGS2dVQ2VXL1RGMGxHVHlZeFNaQ2VaOUE0eUtYOFBEQ050UnhDMitk?=
 =?utf-8?B?SWJPdndwdWo0Nk5TN1AvbVRRL1Fvb0hkRUZCUUgyMU40TUVkbDBtczFKMEh1?=
 =?utf-8?B?dDdOd0tjaU8vaEJEcUJYMDA1cmthVmhHcmtGeGx2bFZqQWdSKzBWNndCVDdN?=
 =?utf-8?B?UjhTZCtGdko4UEw1amF2TkpTdktpQXgyWkdBMC9oUDRYMDFJWU5EdzlJbGVV?=
 =?utf-8?B?LzMzRlpiQ0NQa1JkTEZFMk1ZYUMzRUpOSUlVV3diYTB2YlVaalI0Rmlldm1x?=
 =?utf-8?B?YndIUmN0ZVIxN1F3b0ROSHQwcTFkdzFBTHhNcnZVTktyUWJ1Q0hJOTR0cGtu?=
 =?utf-8?B?VEp1RnpPeDZiNk0rUk12ZTZ5YnF4d1pwRllSaE5uMXkzN2YwTVhHcmJMalVY?=
 =?utf-8?B?c0RHeFBCSWR2MWFlMWhxM1lUR2YxbjB6ZnFTK2hSaU9kUmphcmdBM3NKVkpO?=
 =?utf-8?B?eUZZQTg0KzhOMWEwY0JJWW5QSm93bnlhQ2FBTVRxT05kUytScWs1ZmpveEgw?=
 =?utf-8?B?RWFucmJscitGWU5RNFBPdXVzRHF5cmV3VFF3aE5vTGVvSXRWZVBwd2s2M0E2?=
 =?utf-8?B?RmY2elhEbDUwRXUybkVSOUV3c01QK0xmd0dsZE1XSk5sM080K1lXSzQ0V3lo?=
 =?utf-8?B?RDFaNk05MGFDempQdS80VjdZendQeW95ZXFwWVBEWG83WW9PQzJ2Y1h4Y1lN?=
 =?utf-8?B?ekdoZ253T2ptaWtCSm9BV2pPS2ttUXlRdG5mYTVvRHB4ZEIyRGRtRS9vUHAv?=
 =?utf-8?B?cVFLU29JTW00S1JPUk1GTVR2Vmh4ZzVLY0dCaWJHaUhjWmJDalBCOE9ndmZl?=
 =?utf-8?Q?YjS+4JtqM+Euj1VlhyaodLUcT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7849c2-6d1f-410b-b607-08db891d1577
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 12:30:21.2571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFB4DeMq5hlZRo9w+zKt0lzyK32IhYiRWwMlLxaqUHrNPBV8c2eM6SiKEzpTq12cwoqBKerRl/h++W/aXlFjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of the patches are needed to be backported to v5.8 so I wonder if 
you should do the refactoring later in the series.

I guess best way is to check if you can apply the series in v5.8



On 7/19/2023 1:07 PM, Andi Shyti wrote:
> Just a trivial refactoring for reducing the number of code
> duplicate. This will come at handy in the next commits.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 44 +++++++++++++-----------
>   1 file changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 7566c89d9def3..1b1dadacfbf42 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -177,23 +177,31 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
>   	return cs;
>   }
>   
> +static u32 *intel_emit_pipe_control_cs(struct i915_request *rq, u32 bit_group_0,
> +				       u32 bit_group_1, u32 offset)
> +{
> +	u32 *cs;
> +
> +	cs = intel_ring_begin(rq, 6);
> +	if (IS_ERR(cs))
> +		return cs;
> +
> +	cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> +				     LRC_PPHWSP_SCRATCH_ADDR);
> +	intel_ring_advance(rq, cs);
> +
> +	return cs;
> +}
> +
>   static int mtl_dummy_pipe_control(struct i915_request *rq)
>   {
>   	/* Wa_14016712196 */
>   	if (IS_MTL_GRAPHICS_STEP(rq->engine->i915, M, STEP_A0, STEP_B0) ||
> -	    IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0)) {
> -		u32 *cs;
> -
> -		/* dummy PIPE_CONTROL + depth flush */
> -		cs = intel_ring_begin(rq, 6);
> -		if (IS_ERR(cs))
> -			return PTR_ERR(cs);
> -		cs = gen12_emit_pipe_control(cs,
> -					     0,
> -					     PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> -					     LRC_PPHWSP_SCRATCH_ADDR);
> -		intel_ring_advance(rq, cs);
> -	}
> +	    IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0))
> +		intel_emit_pipe_control_cs(rq,
> +					   0,
> +					   PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> +					   LRC_PPHWSP_SCRATCH_ADDR);
>   
>   	return 0;
>   }
> @@ -210,7 +218,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		u32 bit_group_0 = 0;
>   		u32 bit_group_1 = 0;
>   		int err;
> -		u32 *cs;
>   
>   		err = mtl_dummy_pipe_control(rq);
>   		if (err)
> @@ -237,13 +244,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		else if (engine->class == COMPUTE_CLASS)
>   			bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>   
> -		cs = intel_ring_begin(rq, 6);
> -		if (IS_ERR(cs))
> -			return PTR_ERR(cs);
> -
> -		cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> -					     LRC_PPHWSP_SCRATCH_ADDR);
> -		intel_ring_advance(rq, cs);
> +		intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
> +					   LRC_PPHWSP_SCRATCH_ADDR);
>   	}
>   
>   	if (mode & EMIT_INVALIDATE) {
