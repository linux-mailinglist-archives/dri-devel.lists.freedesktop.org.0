Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B338757F1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFFD10E34B;
	Tue, 18 Jul 2023 14:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5133010E34A;
 Tue, 18 Jul 2023 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689689588; x=1721225588;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ETxCK9d2O+jmTAqVkAKDprlKJnz4Q/9u1PUDnfFfPGA=;
 b=bI+QttSqo8dC0jD2N2bGNVd58WDiKC3eD/kO3ME6nTaJfJE0Ke6JMR2C
 s9wXg8B2cIbj/tE+sXD/yJHvVaP5Zcc//hY0Fa6Iv6BGLpSWE11qkKzjq
 37EAhCbF5TLXv3gR8u+kxaEbw3nws6g2NAs9VNZdlwM8CP54tMzyxtTYg
 FQOtN2fl+gHp9mNdPhY1Lxs8c2JwCsUlDHXLGWlvyND5KS6hHFF9omXW9
 79uVcS2qyySmsgY/YyiqSBH7UxQlt8XbTEJKqdZMh87c11p4E9GtqaVY4
 Afvdw6I1s92+QnLsbnuVut6TVG0m77PwyyjcVcd8c6cuGbAn8kIBhH6iC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="351081773"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="351081773"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 07:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789060829"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="789060829"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2023 07:13:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 07:13:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 07:13:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 07:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzmfwIs1aucx7VrFSCAgwzSFKZfsWDxD1vNLWPxI3c9lNg6bWzy2JujByFofXznHYP0eKHRRmaJxFIi8xOplJC9m/zyKnY+DK+OntCmuzqTkefN0t4QVfn8SJhAvhz51gX7QwcG3T8Q6EamDmPyhsUIq0orlWioE1jlNJDnVcoN7Dj6k/4+cZK7RgW++8XUh/DXjpCLNuDjm0oMWbSE3x0r6GfMKwiqbq18IG27yXYSdatucI7JlpGojSxcYihlws36gkCI9R/IMQNMOW8v3sRyKxWexN0C6P6Nr5ApvlzLlSzhgrqoGHoaBrzfaZ0RsCk2YgHMWqicThlPSyMd97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLqci0KnpSIUGhUkQc+sRQp5kHgC/Fr9eV39s6P/3O8=;
 b=Cr+fv3MND3ucr15oAcOVdo8EyrG/MN8dkQcSxQdu8OHVGem+7VLsjU2cYXcjN08t0woiPbPuoivLiwQCO+TWMCSRTUjOYyhrmNirnNqtp1vwPulzJu6AUiUvCSmCf4v0JtRZiTNUEqJzqQ7Qbyi2rDhzmRPCzHPyeqOGSz7bN2CWH4Kg34yuivDBYkMfZ5KKDtffmVfi5mMSK8ZWwLLk6/vYCLL9ExYeD/pPFqA/MV4RNYZZm+/DthXdb9qjvNlAhNB4D41UDH5k5yDu1tM73MzrISawWo9s51LjBzapUt1rBG5hS/oFvpMMqmh8e6YnTjScrblWlS6l/Gq9OgApxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Tue, 18 Jul
 2023 14:13:03 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1272:a789:3ebd:6bee]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1272:a789:3ebd:6bee%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 14:13:03 +0000
Message-ID: <00d7515b-8e02-e3e1-2018-67fe0073b427@intel.com>
Date: Tue, 18 Jul 2023 16:12:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 7/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
To: Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Chris
 Wilson" <chris@chris-wilson.co.uk>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230718133836.574781-1-andi.shyti@linux.intel.com>
 <20230718133836.574781-8-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230718133836.574781-8-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::6) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d48ea9-3fa5-4b07-c192-08db8799195e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O8qTsxJRDW+9kAfT42nso5oVtWDbCEIn/SuQ7pHfbBa8W0Yjp4V0lXzCDGkP3fryxJleXN5uvV9pT86VPYQtucAbEOPFUimLdZnmY5u/JDkEH7AyS0p30Rj/KQ7mvekUnAARSFwuXoXTKHaAiDPEub8DX//v+3r0vjNgB9j6Rkvw0lGWaM6dqpEE2UYsSov8yhlffvDMkqxVlimvEZmnuaEVyJNMQgXhR3wxxsIcLie2mdIetPiTtWfBT+g2QglBq74GuR8QqLnZhoD3QYzq9ARRtF64G/aOz7Nv2hhJ/SjyZ0QH/Up3kMHDgRAlhBAIe9G3AWIt1CbvmTuxHruoBGfzxiN77w1HWQ8tqMfWb39xB4PpQ32QQZNxCXBtACKyY4T/dKwkht9tigyhcPSLgjmsQ364tiWSBDoEWuELlUi6oTC6Is/B+6peeOj0xatdOVh3Vj2AFFdM8kMQUIKDqpr1DgsRnoaT7AwRCQnvBAqOfebRTRQnLYTR7Y7wkHrwA9f/BwZGuesjgVo/GJPH8X8iCOW11+5soVPFFNIoxB3MwWyjFUZPs5Jbjcya/6lAsO5kJCTIU9zaUUymTMs8x2EQt90WCYa+4KZnhlOnJIOb4SeSaPk8LLGTXI7PrzblyQ5GSeP9ecQbNNNJPKTUWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199021)(8676002)(8936002)(2906002)(83380400001)(36756003)(38100700002)(2616005)(82960400001)(31696002)(44832011)(86362001)(5660300002)(6506007)(26005)(53546011)(186003)(54906003)(110136005)(6486002)(6666004)(316002)(66556008)(6636002)(66946007)(66476007)(31686004)(4326008)(41300700001)(478600001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1hiUFhRUzV2bnVwMkwySzRMRGdBakwrVWhhT1llMnJVbWtFWTE1aGdJM2Vx?=
 =?utf-8?B?TkNVbnYrREhwT09YdHlobmwvTUdoNE9tdEc5NXVyMWJJZWRKZWE2R2Y1UjMz?=
 =?utf-8?B?NzNtY04rcEJkcGdwbmRqL1c0RHUwOXM1LzNsdzBnellMeGFBUWdFQkkvQ20w?=
 =?utf-8?B?b0w1V1lyNzk5TUkwV002MlQxRGsrVzVDYW5TMGxvanRpb1cvcUo2VHowd2xm?=
 =?utf-8?B?eEVUVDRPd3l5dTJDNWpScUsySGhBL20wZ1JsR29GMmVFeUhvUHBFaWdQSGVL?=
 =?utf-8?B?U1Z3R0hYSFB2a2VTYTZVQXFQMFZ6OVV4ejE0Sy9oeXByVjVVY1pQRUNUWFZ2?=
 =?utf-8?B?dkpFaGY1VVlpSG5Ob1EvMGw2SkpYVTNreXFGRFRKRmhMTWRxaWxMTzdrRFlt?=
 =?utf-8?B?TGRpZlVtVzZ3dnNOR0wwemVnSGJzazd6UGl6YnJFWG54aWFRQWQ1MmdnZ3dP?=
 =?utf-8?B?TzE2RUNiNGhYYkVPeHJrL0hjYkNwcjl6MytYWFF5SzBjZTZXbEx2S2kycCtT?=
 =?utf-8?B?SndvZWdHR0I1eWo0UHk0WDBkYkxMcVlUZFQ0d1RNenZBS1g0Y0pJNFJiV0sv?=
 =?utf-8?B?aXVCTndRS2ZDaHNXbGxTTzhPYmJ0OGx2U25pL0NzUGthZDdVbXl5Z3ZhQkMx?=
 =?utf-8?B?K0Z4ZW13WXd5MzRhZWUzMVJpYzE4NGxmbXphRlhOajQ5SXlnUHU0MjhUYUFY?=
 =?utf-8?B?OFIwMm44UDZObVRDWWplRXRTbkx1bHFVWFJjT1lCTjZGa1ZwY0dLajdqUGNu?=
 =?utf-8?B?VU5sdmZ3QlVmem8vbHI5STJNbEM3aExVd2pOTlYvaEMweU13c0dYWUpZZVNH?=
 =?utf-8?B?SXF2TDU4RklRbjVKN1hyNnh5eldHVDJCY0JxVHFkQno4djFCU2RZWm9JN3Zt?=
 =?utf-8?B?ekRERHl5WnNQbzhvaU14Y24vOE16a0I5U21NZ0dRZ1dsK0JlVGMvNGtxOE5F?=
 =?utf-8?B?K0dYdGlxZ3NsdSt4MC9IT1BoSTBHdDJ3N1FVR2N6K2dzUFlJTXJhZ0V3Ukdx?=
 =?utf-8?B?N214WWlxREN0dXU5dnpONFd0aU4yQ0pXNnNGbmZZRVlYUHRpZUhiQVpQUG5O?=
 =?utf-8?B?eHA5eGswRXlqcEMvb3E1NFRaclVjL1BQeERrYzRsdXkyQjQ2cnVQbEVwM2N0?=
 =?utf-8?B?Nmp4bk5iQlB6cFpPZEg5d0FjZWcvZlhZSHdUcWxrQVJxVlRXNmtZOUdVVEds?=
 =?utf-8?B?SFBVcWFITmp4eVpxV0NFMU1hdkxUZU5USkNMRjE3djMzbmZpUGs4QW51eGoy?=
 =?utf-8?B?a3ovL0JwUWNHRy8weEZuRlVSbmMrUE9WLzU2b0VzclBtWTlTYVRqQ1RaV2pq?=
 =?utf-8?B?UndDcEpKOHNEcXJWZVovdmVJYXF2YVlVTm1LVEtwOUZrVlU5YkhXMEorUkpB?=
 =?utf-8?B?UDhtUHNQeHBQS091ZjBVQUlieXdpamsvSzNLY2VoTmlMdFZWS0ovdVhSNEFm?=
 =?utf-8?B?N0tKaEFrcDZKS0xCR2lZVzVqT0ljTWdXeEJIOEhvU1FVS3p3M1dZSzEyMitk?=
 =?utf-8?B?NlRVbE9WZEFnektuaUlXcFcwL0F6bEVzNkVxcVBuVUs2UjBvUDBGMFI0S3Ry?=
 =?utf-8?B?NmZ6ZnYwcDEvNEg2Z05LV1I5MkJVejVaS0FKdVZIOXhjaVhzdE9RWkJST3hT?=
 =?utf-8?B?UU80TVlPcFloR3NIOS9TZXRzVUkwTXlTV2o0clNOdjdzU3d6OU45WTNjeXpY?=
 =?utf-8?B?N3I5MGF2OFdKSDc5MU5iV3FjYkdNME1IQmhQd1JNbkJKTk5OMnlhUW5Yclcr?=
 =?utf-8?B?N3JOeU5nZTJJdTcrK3JCUVVyYWYwSDJGcnBWdzVQQXVhUWJJUHBlUW00d2dh?=
 =?utf-8?B?R1FZdFU3Q2srdjNPK1AyMGVoQ2IrVDVXR0p0SVFxQ1Vvam9wQmZER1JoNnJL?=
 =?utf-8?B?WnExWWIyREJnOTNUV1dxd21ldCtYdlJQbDl2cU1pYzhsZWc0Y1Z5K3NJMFRR?=
 =?utf-8?B?ZWNCamlPRXNkb2hDdEhxclJJOU90TThPNTYyNVg2enQ1b1NrVlhUTjJnWDZV?=
 =?utf-8?B?c1JOV1lXQ0E4QzgycGg2N0NsZUZlcSt6aXVaUkthTk45aFY0MmIxT0RyZnFn?=
 =?utf-8?B?TU9UbC8vY3lSOHBRZzcwNTk2MmdjVnRXQXU0UExKVmRmL3NzWkpydHJ3dnAy?=
 =?utf-8?Q?YJ8Ee9dk/oL1wAujw06k15OOc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d48ea9-3fa5-4b07-c192-08db8799195e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 14:13:03.1630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wpJKbbkp3b3mhGK/9+/iwyLXdxpJyImvPPPrxYSOyzqBvA3Znpn+OTabTVUPhCAG3darGrrpmOHmupTjUnywQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
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

Hi Andi,

On 7/18/2023 3:38 PM, Andi Shyti wrote:
> Commit af9e423a8aae ("drm/i915/gt: Ensure memory quiesced before
> invalidation") has made sure that the memory is quiesced before
> invalidating the AUX CCS table. Do it for all the other engines
> and not just RCS.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 71 +++++++++++++++++---
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
>   2 files changed, 62 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 3275e55b18d90..2f40cd515cc78 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -225,6 +225,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>   
> +		/*
> +		 * When required, in MTL+ platforms we need to
> +		 * set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> @@ -309,20 +316,64 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   {
>   	intel_engine_mask_t aux_inv = 0;
> -	u32 cmd, *cs;
> +	u32 cmd = 4;
> +	u32 *cs;
>   
> -	cmd = 4;
> -	if (mode & EMIT_INVALIDATE) {
> +	if (mode & EMIT_INVALIDATE)
>   		cmd += 2;
>   
> -		if (HAS_AUX_CCS(rq->engine->i915) &&
> -		    (rq->engine->class == VIDEO_DECODE_CLASS ||
> -		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
> -			aux_inv = rq->engine->mask &
> -				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> -			if (aux_inv)
> -				cmd += 4;
> +	if (HAS_AUX_CCS(rq->engine->i915))
> +		aux_inv = rq->engine->mask &
> +			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> +
> +	/*
> +	 * Aux invalidations on Aux CCS platforms require
> +	 * memory traffic is quiesced prior.
> +	 */
> +	if (aux_inv) {
> +		u32 bit_group_0 = 0;
> +		u32 bit_group_1 = 0;
> +
> +		cmd += 4;
> +
> +		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +
> +		switch (rq->engine->class) {
> +		case VIDEO_DECODE_CLASS:
> +			bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> +			bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
> +			bit_group_1 |= PIPE_CONTROL_DC_FLUSH_ENABLE;
> +			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +			bit_group_1 |= PIPE_CONTROL_CS_STALL;
> +
> +			/*
> +			 * When required, in MTL+ platforms we need to
> +			 * set the CCS_FLUSH bit in the pipe control
> +			 */
> +			if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +				bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
> +			break;
> +
> +		case VIDEO_ENHANCEMENT_CLASS:
> +		case COMPUTE_CLASS:
> +			bit_group_1 |= MI_FLUSH_DW;
> +
> +			break;
> +
> +		case COPY_ENGINE_CLASS:
> +			/*
> +			 * When required, in MTL+ platforms we need to
> +			 * set the CCS_FLUSH bit in the pipe control
> +			 */
> +			if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +				bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +			break;
>   		}
> +
> +		if (bit_group_1 || bit_group_0)
> +			intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
> +						   LRC_PPHWSP_SCRATCH_ADDR);


The pipe control is limited to render and compute engines only and

gen12_emit_flush_xcs() gets called only for other engines(BCS,VE,VD) AFAIU. So I imagine changes for this patch as:

gen12_emit_flush_rcs()
	pipe_control with CCS_FLUSH
	AUX CCS inval
gen12_emit_flush_xcs()
	MI_FLUSH_DW (with CCS flush for BCS)
	AUX CCS inval

(Note that ccs flush bit for MI_FLUSH_DW is at 16 )

Regards,
Nirmoy

>   	}
>   
>   	cs = intel_ring_begin(rq, cmd);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>   #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>   #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>   #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>   #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */
