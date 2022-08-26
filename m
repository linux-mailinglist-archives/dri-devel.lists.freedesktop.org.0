Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4DD5A2A0F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C423010E963;
	Fri, 26 Aug 2022 14:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AA110E483;
 Fri, 26 Aug 2022 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661525583; x=1693061583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vjPNHeLNlzdf53TF6za1Yo4QGC3z+oyR+Wa6FGNJgHs=;
 b=DzxsoVwi8K1wbYW4URbmxJixReP2WU9B30et5NzYxEIxODmxKsfp49lw
 N8io3QcMqozV0dcId4sRyexyywYzRsz55JsDjt1ZdJgPrZV8qm0zuSaYP
 GfXUdKBByQ64gA8cQlgodaG1It34sFYTRhe+lev1jLhRJQ6QSIr/HjZJ0
 jE4SvJ/aridHpNqbqWhE7rLduklB9XemFYv8QvdORih00c2syuA+g8QaL
 Ep6+u1efsxhOOGFbcwTqPNH3QhZKv4Y16FiM0zmFxsubDfvcLMAFpFh7j
 3POSsmoJ8SPhdyU8erU8BCBA7WOKk9dOUFrdSI8RMPRTEimKVBdypQMtB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="294527014"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="294527014"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 07:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="736646547"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 26 Aug 2022 07:53:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 07:53:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 07:53:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 07:53:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3ewG7pEK+tTBQg0CXEnVfT7EVy6Kh+shujWy09rjKbRQzt9BEF7EkgY2G0ZACrgD4piOsSc7QYWpIK0eQu9JJGYFyWbdIwdjVHKX0kiMtOkPMAqvgXuX077Isv+ZH6aW5cVK6KJkfz08crDPxcvsaWitQ9qzxUJQfecWavCryChUrXMIoz/PvBZ/D7FoeM7muvqeSmSgzEAkBbNX+RVB9rfIF5DUWkZeGWnFYi0mywMpZcH9NSST9MX6s/a3H00ADQr7fSL4+AZx4TFiaYb9bkOIshqYrP2wY1uxs3qzf0fZut/qXVCPqeIrTEoVE4dnFNCxzcAsDmKHKR7AaWmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4Ec+P5KBm2EqkS3EiIrN03Q218OLYaoeUra65YhszU=;
 b=WSr4Zjmf7CfbkFpp+XDrzvJ3XHe1IYSk+Li4c3/0u7j7D3cadXu7GboByASMSIVcRz+ZT9xiid1WK0bf2gFzhPZoHwEB2tkaU3jDzQSss+iZ0XaeCJtoZT9Ed64StzLxA8VDMsn5d0t7vDQLuwtvmnsVjqC9J76XojXZMEU3yNdmzQzsG7Bwb8InzYHxiIsVmICO/52wW4AR8QXxWj1/xwYYuWvK5XNEt0IousBEftwE+WiDB8VBQaB4+Sk8cx2jTihmFTeNv+ddwhV7pzdjrCzuzpg84u8dEq94nFNESyee8g7d5hD/dsTm3jmD7FCCzLYZIht4+TUTC13exqJYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 MWHPR11MB2016.namprd11.prod.outlook.com (2603:10b6:300:26::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Fri, 26 Aug 2022 14:52:40 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 14:52:39 +0000
Date: Fri, 26 Aug 2022 20:22:30 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: Incorporate Wa_16014892111
 into DRAW_WATERMARK tuning
Message-ID: <YwjeLmWRd0y6WKOl@bala-ubuntu>
References: <20220823202449.83727-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220823202449.83727-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BMXPR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::29) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 771e06a4-c890-4c28-5898-08da87729f6c
X-MS-TrafficTypeDiagnostic: MWHPR11MB2016:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ceQehhmVoDCsza/x0bLwnOCwtcDopBTrZHG8JLyEOyxaSH0e5WvRjkqiFLwHUc9mAG7xM6LQ8++WKBTT07LlZYgg5+PFc2WaLaI6QLxteUGRMQFpeZyPeJKAfF2zKdidsx1CSSuVJFVuh1olFfzKUflpBztQjYfPWURtiSBZO4mJgKWU9fvwLu3oyLrfujpvXp+kkhNlsymzZlqHF8eguQH0FFIKr04oBqH70KyuMta1KyNdxVE/j9Q1p6yASiwDz41CWhxvg8PLkq/n74aYdYm6dheT+5SrvsqdQvZJR0A/Pc4m2i0l9gBrfO9lm4XVK2w/s+I8pC3H/YhHA3xkatUJBbQ5z8WJPah0KZ6K4j65fqIYkpuOeDk/GGHbqC/wx2L6L3Btv50D1fFE1RQDzp9S/ylJYjnkLwV7FK7HCvMjuQbRCgUAKrqZcILjS3MlKya6JrdtljjULMtdJtKgBw+3D77LhQodbkXMtNKeC883jnu2M+m/kKj5YAgHrQ67lloyBN2eyLW129OAcBnxkAMJG7rworPpwKUvx6b0Q/vVLIWx3S49zjEoctPVqXHqscQH4qQ/E6ho1/xPz4u91FVmtyuUTUjwFcvq99EgvuNLYRwF+BijJp8o7c7j2POiAS9+0e08/iT4VL9rVwhPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(396003)(39860400002)(366004)(136003)(346002)(5660300002)(8936002)(38100700002)(9686003)(6666004)(33716001)(6512007)(26005)(6506007)(53546011)(6486002)(966005)(478600001)(86362001)(44832011)(41300700001)(2906002)(83380400001)(186003)(66476007)(82960400001)(316002)(450100002)(8676002)(66556008)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkZxL1NEUU53N1dmUWVYb1Qwc0REUkNFTzV2N0V0aTBESkRtYU5mL3BQNGM5?=
 =?utf-8?B?b05NeWQyNW54cWp6RHRyOWE3b0lHQW5iL1FmV292MkF1SUNKdXhndW9sOTA3?=
 =?utf-8?B?cDRoYkNqb0VhTi9XV05aNVR3aUJPOWJ3cXE4N0xXWjVJbGptbTFVK1FhR3hU?=
 =?utf-8?B?bDZqQmtHa2JydS9XNTJrWkcyUnV0TENyNmtkdjJ1UWIvWnVKWi9OWHUyV1A3?=
 =?utf-8?B?ZitYSmozWko4K0JhY3VYQ0M0ODVNZDd5SzJGc1p4RzU5ME1TY3NmQUlzdWEw?=
 =?utf-8?B?ekFnREpCbS9KNWxYcTdremhqU0toZzZ4K0l4bGoxMWRPVHQ5bHNsZVE5eHZR?=
 =?utf-8?B?SXBrTTVwbDdOcUM0VjZyUFhUQ2htcm1TVXczOW9KQVVZNjlGU1VoQ0IvbTVy?=
 =?utf-8?B?UDc1RjFXY2xLNWkvSHBqaW5wK2xsMkxZQkZORC8yMGdNZFlmYVNrS2VPa2xT?=
 =?utf-8?B?Rkg4c3ZyV2Rmb1AxTXN4WWdvdWFubms5RnNaS25la1JjNWZwTXlmTHYycmg1?=
 =?utf-8?B?VEh2UVNRdWxZM29vZEhyTzh5S1VvdWFOV2NMbjJqQ1ptelFjZldBRC9uYllG?=
 =?utf-8?B?N2pNV2ZLZ2pCOHB2Z2JUaDljQ2dtQUJhVzVONWlPMkhHNkhMTjdLeStSUjQx?=
 =?utf-8?B?aDBrNmxvMjRHTC81Nktqd1FXNzVLdEM4T2J2YmV1MlRsKzluSU5IUnNEaS92?=
 =?utf-8?B?cFVFbzM3MXo0MmFOSnRoUmNRdHQrWk5YOGpTek5MN0ViMU04U0NLajVzUmlp?=
 =?utf-8?B?a3RydUhqWVFBQ2tsVTlOb3dFTU9WOXFSczRpQmtXZFh6c0hUbE1oY3g2cUpj?=
 =?utf-8?B?alY2TE5IWUtxMzlLMDlXMWc4K01GbE1MS0l3d2hLbFlQUUl6a1VINlkzMDlq?=
 =?utf-8?B?WmxiVCtXV0dXTndsbGNWMUREZnpJWlY5b29vckYySFdHd3NNdmZ0cnhhaVNy?=
 =?utf-8?B?bjNuRFRmVVM2L3EwUlVjbjJydi9EYlhzenVQRWlxWCt1RVlBVVNTa1IzQ2Fy?=
 =?utf-8?B?RXV4TGNFd09oTWpRY3NIR1pVdzNGVzlGU21aZklwTzZXRTR4L1ZBdzdwZjdu?=
 =?utf-8?B?TW1HRDVCSFJqVVJ5d2RZNGZvSUVlc1FFQU5aWmtITlJHUEtsYWY3bnR1cVNP?=
 =?utf-8?B?Ty84YngxdWxQdDNtcllrc29EMHBLY1k2RTdZdHNueDZBWTJ0RC9yaHQ5cExW?=
 =?utf-8?B?S0RSU1ZWTlpxc1hra21QWVJFb0kxRWpabXpCQU9wbVN1QmgrYnBJRDh3NkZJ?=
 =?utf-8?B?SGVxcGh0YW5qWWd3RjdkNTgvdHJMcC85Mi9yOWUvQnZjRG5saHkyL2NySmNu?=
 =?utf-8?B?dkY2WlJyS2p1YXNBNFY4RVVyK3YrZkNvOGlqR2UrN2o4RXNNU3QzSVBBaFBZ?=
 =?utf-8?B?NVFNTFZ1bzRacmhwMWUrZG1hVnRueWdrbkV4NEVFTFM4bUJkRVUvakdXT1pO?=
 =?utf-8?B?NDBXZHJlcGFGa2dzSzFSakR6RGlURFJORHJPb1FSZytsNmZ6NEdZLzdPQm9R?=
 =?utf-8?B?aExQSFFsTGREZUNMVnpYV3FLYzdSWmNlN0dSaVBuVTFOT21qZW1YZ3pSNWFT?=
 =?utf-8?B?VFUyNW5tdnRMcFNvcjZzKzVUL0UybW9PR0FSeXFzeWJYNmFnbCtUcStENTRn?=
 =?utf-8?B?bGNSTE1MaGNXb3ErYU96L1Q5R0xKajVmZlhyeVRSSHQwNGp5a0NpWitxQUtN?=
 =?utf-8?B?eFd0Q0I0RGt3STRrLzM5aytJZDhtREFpZW5BZnhBcHBQdUNtYVZ0LzNsSG9O?=
 =?utf-8?B?bDRWV3Uzb2tHVG52OXAvWHhlb3FNTU9xQVJ5THZXTVplWXlmQVhjQVBOclNv?=
 =?utf-8?B?M1VMNXlSd1Rla2tSd3hLWXB2NEpobm9mc2p1aDNkbXBlV3hqSUtiYjMyZWs4?=
 =?utf-8?B?WkUvako1RjY3SEdsRmZXR2c0cXlNNmlJaHJWcENFNVpHV0tmR3ZEbnN3K1ds?=
 =?utf-8?B?V3I0Q0ZWR3lMUFBaSkZYYjhQdEJ0ZTEvK3djRjBNQno2KzB4N3QyeDQ4czFw?=
 =?utf-8?B?RHFGV3E1TFl5clJnMjg0MWl1TzduZnpPS3c3cHQzMXFIVXNpZ2pJT1FRcHBB?=
 =?utf-8?B?Tm41L0tPS2hKZjVZWUZtMHo4TW90WWdNWVlKWTU3M3EyUHBubng1TUovdUdL?=
 =?utf-8?B?NTBvY0lQZnNxSXkxRHlYWWpWTEdIV1lZQU5wdlhNMWN3QU13Z1VFM09KMHlP?=
 =?utf-8?Q?A8C3KX/nYIO4JtDsE/6lloE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 771e06a4-c890-4c28-5898-08da87729f6c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 14:52:39.8608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnKWlKL6hY2Bnj+WgUMmPsUxFlhOmoRDZnNvYaZYfozwkSBfE44kJOyzD7u6CNfyvl/A2tkq3SPIubK33xPNV8O7apXN2xYZi/l4yT1F2VVd02s0A2qXTnLlIsWgnlTC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2016
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

On 23.08.2022 13:24, Matt Roper wrote:
> Although register tuning settings are generally implemented via the
> workaround infrastructure, it turns out that the DRAW_WATERMARK register
> is not properly saved/restored by hardware around power events (i.e.,
> RC6 entry) so updates to the value cannot be applied in the usual
> manner.  New workaround Wa_16014892111 informs us that any tuning
> updates to this register must instead be applied via an INDIRECT_CTX
> batch buffer.  This will ensure that the necessary value is re-applied
> when a context begins running, even if an RC6 entry had wiped the
> register back to hardware defaults since the last context ran.
> 
> Fixes: 6dc85721df74 ("drm/i915/dg2: Add additional tuning settings")
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6642
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c         | 21 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c |  2 --
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index eec73c66406c..070cec4ff8a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1242,6 +1242,23 @@ dg2_emit_rcs_hang_wabb(const struct intel_context *ce, u32 *cs)
>  	return cs;
>  }
>  
> +/*
> + * The bspec's tuning guide asks us to program a vertical watermark value of
> + * 0x3FF.  However this register is not saved/restored properly by the
> + * hardware, so we're required to apply the desired value via INDIRECT_CTX
> + * batch buffer to ensure the value takes effect properly.  All other bits
> + * in this register should remain at 0 (the hardware default).
> + */
> +static u32 *
> +dg2_emit_draw_watermark_setting(u32 *cs)
> +{
> +	*cs++ = MI_LOAD_REGISTER_IMM(1);
> +	*cs++ = i915_mmio_reg_offset(DRAW_WATERMARK);
> +	*cs++ = REG_FIELD_PREP(VERT_WM_VAL, 0x3FF);
> +
> +	return cs;
> +}
> +
>  static u32 *
>  gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
>  {
> @@ -1263,6 +1280,10 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
>  	if (!HAS_FLAT_CCS(ce->engine->i915))
>  		cs = gen12_emit_aux_table_inv(cs, GEN12_GFX_CCS_AUX_NV);
>  
> +	/* Wa_16014892111 */
> +	if (IS_DG2(ce->engine->i915))
> +		cs = dg2_emit_draw_watermark_setting(cs);
> +
>  	return cs;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 31e129329fb0..3cdb8294e13f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2685,8 +2685,6 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  	if (IS_DG2(i915)) {
>  		wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
>  		wa_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
> -		wa_write_clr_set(wal, DRAW_WATERMARK, VERT_WM_VAL,
> -				 REG_FIELD_PREP(VERT_WM_VAL, 0x3FF));
>  
>  		/*
>  		 * This is also listed as Wa_22012654132 for certain DG2
> -- 
> 2.37.2
> 
