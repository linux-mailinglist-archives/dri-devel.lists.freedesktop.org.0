Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F4A7BC33C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 02:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9539C10E579;
	Sat,  7 Oct 2023 00:10:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8250A10E051;
 Sat,  7 Oct 2023 00:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696637436; x=1728173436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vmAv93tMU+6UtoZQ2pHtU/zIYvYkd/IG166ritmAFVE=;
 b=e032Ud1zYBtabBQxhNVDTKKqAxr1SpV/5y3vemDl+6muSbiQd0dGU0mb
 mp8VtBrN/5xEN03WnJX1U//mOIDGDOoDa1O8qUrtxjafpu5mQp+zyhIeh
 68NbidDoxN9zCv//mWVCFBvA36oGWCY249437Xi99kgGv4rqpQrV3SyzC
 xICLHoVaiSplaulmnfjXMMFTjvzLRQL+TjKWlK5SXG4vLrgpHiQWN21qj
 YZm2ez6r1i0o/fAu5QZzKJXhSSeXP0+j9MBx4cgWB+fCvqIdeWllJw2Rt
 wgz/5O44UPYeqrj1ORml40rFqVdoFF3eUg1s9oG/c++efmSzNY0nCr7+W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386695699"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="386695699"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 17:10:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="756017793"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="756017793"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 17:10:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 17:10:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 17:10:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 17:10:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Br5OX1Ibkcx0JG9yY3Ku0iQdhjkgH/j6nIwx0IuXv5qqtM4qmxWZg3IM7T5yR3yXvNqkjv8fp0p15cQate6fu+/V/comRLdodXzNuVAjbm+o93S2zYJ/ptSHVeVlJi7boGUmuU9LPSD/9OeP7Z6efRlHDU+ngZoAvCCvf9PVtVMR3VPOuLyAao7jiMxUFMp/ONACUEdhvDCJL05s1Z7b42vLwhwKSttSRdaXFb7+hVGriFATFxQooU1UpJkLmrVHSyNdOdBvvncUePGIL51lzPni15cD+ef5FZfbxCX4FmJTZgI2XDH5hmjSFKptpbW9lx0/7uvUqSa+4WkLW7kx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhLQUO9YdM++dtguSLlByd86Sc3C+UkFG2hd6w07rZw=;
 b=TQ+lnyZSJ8FKkgEJOciSgUFuzirRGZ8jWsGIoBoLQuPFHRrlk7xNxtlY8YCM/Vb821uYnqqO+k+5sqTx9vHPVrR4vLWFfuwS0z/tu3b6lRkZDlMhBjYx1JYft6uY2kSXe44ASY4xHxoBYrCqJ+zTxpub+tQJvwfEcQw5P+NILtIMIVKZN79kXd9C7aVQ6uohqkdLH/RtD7z/b+aBFXtvpO1jnCJdOVju989ZkOAVY0U362FQbVr6QykwdjZ7ORcbex4MYb3IMCnlX1ME2XI+T9pMah5T0WDWwP99nY6ZBFvvIolUpR0bhkF9+eB6QY8OZ1Vt8rtU0NjPQFV67l4c3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Sat, 7 Oct
 2023 00:10:32 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720%4]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 00:10:31 +0000
Message-ID: <f705d300-6f76-14fe-8321-167a2c572ec9@intel.com>
Date: Fri, 6 Oct 2023 17:10:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915: Enable Wa_16019325821
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230915215537.220331-1-John.C.Harrison@Intel.com>
 <20230915215537.220331-3-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230915215537.220331-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 42672cc1-eb91-4323-d121-08dbc6c9d1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJ9+jiqrzwSsOp7h80jJ5R4uJOMUA6G1it66+O7xd4mGr8KQRODIx6tffUnzu9LoNl5wk0+/ipr8GkG1nTMkc2N2XibCnmjUhj+tB2xPqFlgj8XCQA08wCgy/JtALv4bkdb7ObqTEwqbCvI0kJAixpjH4+eFRSSxgGjKrt88UUolMABYqP8PFf46oHQUTJshGylX/6b72S8h99WZPV+fpsExasn1b4JZDoO2JCZKmPDS0BWMCuNM6W4tCEwgxBCLuHAP4JIm7UetQXCRagLDmYqsVEv/fY4h5krlOFfllLH1JUYTuMD7E3aTJdeu8mOE2rVscDX5ukdcHoCAZmE9q4zIBCr1aVorFQlidZiVxFB6TOlWdxfbeky0jTScHt+WB0bjrgH7yjFQgdXnm1W0LjETthdZA2zJCOalbN+dZ4paRHhI6EAdD7l2ed6jyLZ23HfsOhlu5ywNFeAqA9YGBYDsqWoPhYXFBrqEoaKkSLwNjKFCQngFF9gqY5f5zF3zi/w0CokaXuey/1x0zEGioJuDqYGdZb5FmaFAdQ2mJJr8L8gzsgmOsl7gLFsRX/2wYaDBwkVdXznieR/MLscWCxNg0ikn/+2l25Gf6rH/XI0yw5Oz5LNS/x/x19w7ilJgwxEA8BrPCWaKXya79/GvCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(53546011)(6486002)(6512007)(6506007)(478600001)(83380400001)(2616005)(316002)(26005)(2906002)(66556008)(66476007)(4326008)(5660300002)(450100002)(8936002)(41300700001)(66946007)(8676002)(36756003)(86362001)(31696002)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUZZOHltYW9uLzZSdnJvTms0ejZITG5EbndZUnBlbU9IRTF3NVo1K3Rxck8v?=
 =?utf-8?B?aSs0Y3pyZm9ubDNTOVlqTDl3L3BDakNZM1FKOUtYWDhuR2FndXJZM3lPaGJ2?=
 =?utf-8?B?UmpXT3VKTXVqWEY0M3UxSCs4SVRpR1Q0aGo2YUgrSXh4Q2tNcnNuTjdrOVBn?=
 =?utf-8?B?dThYcEhQSEZCS2t4bDFuTGJpajlKZmdTdDFqZUVrcVIzcmR3ai9acFRyVnlD?=
 =?utf-8?B?ckRIUkNjTDRqVTBTK3diQXEyNnFSNjZaOERFMHVvSENRaE1TK01kM2pPTitv?=
 =?utf-8?B?Z0NwWmgwYmRsZytlVzJaR0xmdFUzYjRXcWp6RkpUUFVrb3k4QnJtNTl4Q2dl?=
 =?utf-8?B?ZXRmWnhUa0liamVBR0VFY1FxU3pkMEJ6NUhFYlErcWZvakNCZTlmUGVlZ2hj?=
 =?utf-8?B?dHM1MnFqQ0VmZHExMEgwUEF1Q3ZLczljL1JOWjBvRlYyRENUdC9ZTzZaV1JW?=
 =?utf-8?B?aXBSVkVPYzdoWXBETkNEWlFVK2FaN0U1NzZ6NGtiWVFZS1FreVdhK0dLNXlo?=
 =?utf-8?B?TUdMcEpXL2kvSnRmSS9SdWh3MmNHbk9ubFRqNm55RVZVVjNYTmttRmVqcitj?=
 =?utf-8?B?YVRBYmhVV1JzMm85TVFTWXI4RmlYdTd3VkhYRkVBcElMTWVETkpldGtCTDlw?=
 =?utf-8?B?RXpsRkdTeUZOeERKakNaQ3NWZ1RjZVdtYTgxRHYwTHpBOHhQbTF5S255NTY1?=
 =?utf-8?B?bmxONGhvMUJyWWEvUlNyamxHeTQ5V3N6RENRODg1ZW0zNzNucXBrSXFBcm42?=
 =?utf-8?B?d3NPdFZ3aW5Vd1U2ZW5KT2h3bERUOG1YcTF3ck1OUDJNdktoU3lhUEdleG5l?=
 =?utf-8?B?dk1sMEE4NjYyejBGZDkyVzFLUGUyY2pENjNuY3ZaNThML1pTUVBTekM2WVNB?=
 =?utf-8?B?UnZERmJkWTVJcTNOMkMyQ0s3Mm04cEJ5eDRFZHZFZXBQRGdNNHd0QmxyZ0NJ?=
 =?utf-8?B?Tk9ZWWVQNGMwWTJHMXI0Z0dkcjZzdkl0QVdYYk1RRHJTV01hOVJ0TGh4a204?=
 =?utf-8?B?QTEvdGpTVllSbHcwUk9QaXNuemU0ZEdWb3VqTWZ0dkV0eHVTTktteFBwQ0JH?=
 =?utf-8?B?NGRKK2RqQzR5TFVTaFVnZ1l3QXVVRmErSy9OR1RYOWFWUndOWkltUTlOMmZI?=
 =?utf-8?B?a0lNelFLamljSTFjd2JGMUtxZ2IwWG96WUtKWkorWlFtMFZWRDJ6WlZkejZU?=
 =?utf-8?B?UmRqbjUyK1NxSEVjSWE2d29TY3BhZ3dYVmt1TkF1TnNscDlPRVorQ3YzWk5Y?=
 =?utf-8?B?K1U4RGR0OVZ3eW1DdWhOQzEwN1BKOXVOYUNiMjE1LzRrcmtoOHFRQzQ3a2FN?=
 =?utf-8?B?c0o1dCtSZ3JrVWp0YTNBQ2RFUlNsSlFSaFpwdEFNbFRXUWtuWkRCZE02TCt5?=
 =?utf-8?B?SzRBeXdHSGt1dTR6cFZMRk1ObGpDWU1LUDlmL3c1bzlvMnVXRlBnN0JKdXNz?=
 =?utf-8?B?R01qU3RQQzBXekxSTFI4VC9ENXFtdWcyR0VpN0N0cDlJS1BWVDFiK2VMM01J?=
 =?utf-8?B?RG5oWjlFTzZXTVZKTVlXd2IzU1FPclQwa1RpOGdDOTdFL3ZGVERZb3hqNlln?=
 =?utf-8?B?d0g3bGdzanA4TFQ0M3BVR1AzQVI1a2hGYjFkS3JxZTZkeTZyL0E4R1Zvbnd1?=
 =?utf-8?B?UTRTWHZibXF5VHJBNjU0dlBKcHJtTnZheVlvNVhMSno1RXIrQjFYTkdOSUdP?=
 =?utf-8?B?eHVkeGE0V1BjdHd0TVhsa2J4Y09VNnNCK1hHZjhNa1YrbVAxVTdtQjRDZjgw?=
 =?utf-8?B?SFphcTNNa3ZWemZrRGREU1VSeTFmcDhzSDkxTWZQMjJzZTdUZmtHYlU4ZjNv?=
 =?utf-8?B?WG9PSGo4RVBRUVN4c2RxOTYvUTg2NWEyYTE5RjZ5a2dReS9yOFVpS1dNMTdE?=
 =?utf-8?B?WmpNSWJUQnNaTWM0QnVoYitXTVMyelRYRHB6dkJlbytaejFGU1B2STR3Ukxx?=
 =?utf-8?B?bVExUG00bElNY0F1NmpUa0tQSGJQOEV4L2pTdDg3M2FMVXNpOXgzb1d5L3pi?=
 =?utf-8?B?RUp4OExla1F6ZTJLQUtVK0RUUXVhTVlrYWJsWkQrT0IxVEJkYi84aDBGTGgr?=
 =?utf-8?B?VWNZV0pqQ2V3enpEajRRMzgyZ1dpS2YwMy9GSDVOSjRrTXQ5Y3QrZzIxdlNx?=
 =?utf-8?B?ZXN6RFQyYXplbC9OQVcyUk5qdGRQOFFBVksycTZHaE52ditsTDZYODNvbU5P?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42672cc1-eb91-4323-d121-08dbc6c9d1fa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 00:10:31.8177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzgJc9y/Uw0OprovRvinzfqKKcpEfSs59G5bYBvxGliaYucZ9rI1x2NrlbQ8kAE1N/7CieCmMpYD5WDOtEEd/j3Il41Ad8y+pmtNHXs+yjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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


On 9/15/2023 2:55 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Some platforms require holding RCS context switches until CCS is idle
> (the reverse w/a of Wa_14014475959). Some platforms require both
> versions.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 19 +++++++++++--------
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  7 ++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 ++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 +++++++-
>   5 files changed, 28 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 0143445dba830..8b494825c55f2 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -733,21 +733,23 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   }
>   
>   /* Wa_14014475959:dg2 */
> -#define CCS_SEMAPHORE_PPHWSP_OFFSET	0x540
> -static u32 ccs_semaphore_offset(struct i915_request *rq)
> +/* Wa_16019325821 */
> +#define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET	0x540
> +static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
>   {
>   	return i915_ggtt_offset(rq->context->state) +
> -		(LRC_PPHWSP_PN * PAGE_SIZE) + CCS_SEMAPHORE_PPHWSP_OFFSET;
> +		(LRC_PPHWSP_PN * PAGE_SIZE) + HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET;
>   }
>   
>   /* Wa_14014475959:dg2 */
> -static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
> +/* Wa_16019325821 */
> +static u32 *hold_switchout_emit_wa_busywait(struct i915_request *rq, u32 *cs)
>   {
>   	int i;
>   
>   	*cs++ = MI_ATOMIC_INLINE | MI_ATOMIC_GLOBAL_GTT | MI_ATOMIC_CS_STALL |
>   		MI_ATOMIC_MOVE;
> -	*cs++ = ccs_semaphore_offset(rq);
> +	*cs++ = hold_switchout_semaphore_offset(rq);
>   	*cs++ = 0;
>   	*cs++ = 1;
>   
> @@ -763,7 +765,7 @@ static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
>   		MI_SEMAPHORE_POLL |
>   		MI_SEMAPHORE_SAD_EQ_SDD;
>   	*cs++ = 0;
> -	*cs++ = ccs_semaphore_offset(rq);
> +	*cs++ = hold_switchout_semaphore_offset(rq);
>   	*cs++ = 0;
>   
>   	return cs;
> @@ -780,8 +782,9 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   		cs = gen12_emit_preempt_busywait(rq, cs);
>   
>   	/* Wa_14014475959:dg2 */
> -	if (intel_engine_uses_wa_hold_ccs_switchout(rq->engine))
> -		cs = ccs_emit_wa_busywait(rq, cs);
> +	/* Wa_16019325821 */
> +	if (intel_engine_uses_wa_hold_switchout(rq->engine))
> +		cs = hold_switchout_emit_wa_busywait(rq, cs);
>   
>   	rq->tail = intel_ring_offset(rq, cs);
>   	assert_ring_tail_valid(rq->ring, rq->tail);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index a7e6775980043..68fe1cef9cd94 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -573,7 +573,7 @@ struct intel_engine_cs {
>   #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
>   #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
>   #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
> -#define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
> +#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
>   	unsigned int flags;
>   
>   	/*
> @@ -683,10 +683,11 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
>   }
>   
>   /* Wa_14014475959:dg2 */
> +/* Wa_16019325821 */
>   static inline bool
> -intel_engine_uses_wa_hold_ccs_switchout(struct intel_engine_cs *engine)
> +intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
>   {
> -	return engine->flags & I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
> +	return engine->flags & I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>   }
>   
>   #endif /* __INTEL_ENGINE_TYPES_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 27df41c53b890..4001679ba0793 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -294,6 +294,10 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   	    IS_DG2(gt->i915))
>   		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>   
> +	/* Wa_16019325821 */
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
> +		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
> +
>   	/*
>   	 * Wa_14012197797
>   	 * Wa_22011391025
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index b4d56eccfb1f0..f97af0168a66b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -95,8 +95,9 @@
>   #define   GUC_WA_GAM_CREDITS		BIT(10)
>   #define   GUC_WA_DUAL_QUEUE		BIT(11)
>   #define   GUC_WA_RCS_RESET_BEFORE_RC6	BIT(13)
> -#define   GUC_WA_CONTEXT_ISOLATION	BIT(15)
>   #define   GUC_WA_PRE_PARSER		BIT(14)
> +#define   GUC_WA_CONTEXT_ISOLATION	BIT(15)
> +#define   GUC_WA_RCS_CCS_SWITCHOUT	BIT(16)
>   #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
>   #define   GUC_WA_POLLCS			BIT(18)
>   #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index cabdc645fcddb..ff38a815701ce 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4267,7 +4267,13 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   	if (engine->class == COMPUTE_CLASS)
>   		if (IS_GFX_GT_IP_STEP(engine->gt, IP_VER(12, 70), STEP_A0, STEP_B0) ||
>   		    IS_DG2(engine->i915))
> -			engine->flags |= I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
> +			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
> +
> +	/* Wa_16019325821 */
> +	if (engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS)

do we need to set the flag for compute class again here? It has been 
done above. Other than that, this is

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +		if (IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
> +			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
> +
>   
>   	/*
>   	 * TODO: GuC supports timeslicing and semaphores as well, but they're
