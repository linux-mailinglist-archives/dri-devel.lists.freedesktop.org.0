Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCD1756E2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 22:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F105410E153;
	Mon, 17 Jul 2023 20:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EB610E04A;
 Mon, 17 Jul 2023 20:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689625636; x=1721161636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/hseDkDa1KW/Rij5uy53T5rgqkFXZMR2+tzfyBtTYrw=;
 b=OaMMd/kDBpE8mcRhEIMgbrA32S+MNm9fZAax14KhKFybm8DlpyqPmLCY
 z8hN3lFaBjTet4l4OyNG5NhFj5S4VTu6EjL+10impwu71u5+y3pRuxiPT
 prrWLj1Xj5+8+ZlugiDaBCRUcT4J5AiiereH1Q700+kFWFs7HfKvhUVnc
 CbU2f36jgAWI0Z7CfHMSeNFHVMw7oq3UqyF+ALfca+TQX/Byu6VUOUIVZ
 QMuqRQatGX3HT/HEHDl+QWERk3PmPikEBBfievqlYMa8KW79pfvh4ORtI
 2AX0w8Ek1YSKzEUBd3vZNuUdbJy9bm9xSFBirSIHXT3hT/t6ew53RG6Rb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396863826"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="396863826"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 13:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="758552178"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="758552178"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 17 Jul 2023 13:27:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 13:27:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 13:27:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 13:27:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 13:27:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVoIUOBdhQg6WMy0YhqO+MS/pmpiuwPRZe5YZ4MDiH2XWO0G4Ne2Rh1/E5F8DfmiVxjZwckrGCQWVjYFsP+YaxzmXT/dlBppLEpINBM3+Urfu6Dz8n7mPj/FBcZa5TVPJktRsA+diyILtwDiO2BbbxttARXdZPAnDnZHuUyon7o0cnL30/vkNiqSX/eNlOTRzYDo/stnZgw5lMGSTJHpClp7uNmjXA4kfPATZsy39BNHGiB4EZ4xFdI8mlt2AtlbfnQKeLHu+/SBn9PsV9UH3knizN0ipXcJJOsa1shQHEb696YD80TUW3f1tusQc58Zt8STddEhq4aUoXby1phXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5kWNh0dEB+rf/aIRHtefCcJtAEJfjg04dnl8MbM+jQ=;
 b=SlWRhTcoPEH0c1creBaYAJHCk3C7gsi/16Y0UbCxbMwqam8fBrbGZVFBnzg3ezxt1eIdj3051xrnQfbZTdckOnYWt6UBIqBwfIKVNE3MXRJ+ix5sRTkc88ISt/hybc4Bnvuu8AmLIL/u1xKZ9ffVpkQFnO12Kou01bYUX4itKVNEE2qKym/nadKwdka8mAJkpRnH+Tz5yqJ8/R3vu00oezDOwjj/1yIgX3MEnB3gHtgT3qkBg0q21GFt/cHVyN69WwhvsRSx2CRRSvUW6RzD43dXaFkkGhox/fd6lBq9Ga6XntIUKVq0H4lvw4eN71763t/mdXVC7kO8Bo25HqPfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Mon, 17 Jul
 2023 20:27:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 20:27:13 +0000
Date: Mon, 17 Jul 2023 13:27:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 6/6] drm/i915/gt: Support aux invalidation on all
 engines
Message-ID: <20230717202709.GF138014@mdroper-desk1.amr.corp.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-7-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717173059.422892-7-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 289b8e34-04d5-4e81-bdc8-08db87043428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2U7hBiOszjQbs05Qlw2BKrn3fvY350pUBORRGzfsa5ocKTmUpN7NCHjHrEWRn3LHNZrVpSP3JZ1J7dd5qLXmhBaLcIJ2DcwwHIyGkPlyCkBvo8Pe81u5miYjsG0aI5JJ4MkzWjFB5wR+yfHSsPDT9DEyL+BRLrrxcD0Klti1zDHemreVtkFYVnppaWepdrrVeKX5mxzLtMyah7Cd0+d0WSzxobfqzdB4uqe9DabDRgpXIbg9RxUJENtHPOMReKLTBgdsqyv5+edxZJZYqcpQxmXMERNIuaL4HRdDRfoYnSVq/vpwpbVYSSh3Td/q8ta2JfY0+eXh2LSOBknb7efDGV1zUl98LYY0gfDNOIBLD1iYq1fuUgy2E3gPJD2mgkec7IKWrXPjukTk4vyMFTfWilGtWAkJyuUgvPDSQfFLvLSIdH+FZ4WAE7qWAUCJQr1il3nw6THD9B36eRRDb5xgLz4oHhQsMf7HXbQg9kPIDI2M+T4856ASj4HSiL7pHQVLixyFI/rYCQU2ueyCYTHuv9kealsnazIMwjNc3LliY9ivPQytTWD5Jd1F3J24q8sa58vrWIlvvfxLnQgKtWRVFL6GJtzZ3Xd/R3UlmcCbk74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(478600001)(6486002)(6666004)(54906003)(186003)(6506007)(1076003)(26005)(6512007)(2906002)(316002)(66556008)(41300700001)(66946007)(66476007)(6916009)(4326008)(8676002)(5660300002)(8936002)(38100700002)(82960400001)(33656002)(86362001)(83380400001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TpnppRZ4KPqkcm6IHSueYbFDjXXhsuQ2fT8mpbY0aaE16xooLSq5t7cBswSt?=
 =?us-ascii?Q?rVrZAEYYNPSLY6ZAhpI6i0sqv8KOWaxXMySRVHclWdrGtD8DtL1xYpNMaGpA?=
 =?us-ascii?Q?Gd+QQC8PojQYfhNHk9r487rAzLbGDs14IJolXwTYE9CONBQLgSSF/jJ1YFJr?=
 =?us-ascii?Q?h5CdV32XYhHayeQ4GU+pG+RF2iriJdp4I2vU1T28iefXSpTbAOad0/meTj/0?=
 =?us-ascii?Q?xvL9RctVcVd+2PVA/D3QTbSXd063qJ8CTLnRVm9ILlbOWqNnCUghPcH2cXy8?=
 =?us-ascii?Q?HDlwEWT4xDPJ5U+wVwMzHz618mqq+ijpoRb6p6aOzuk+JfGB382IZBJIEhef?=
 =?us-ascii?Q?GHae7LWDytifzKfANmKhbTrBkWfXG/qXd0FH3dIqNurQ4cC7GM585URSL6gf?=
 =?us-ascii?Q?1CeuIWnhjALKHY1MtMRl5ZHI7PWCatMNkqwYNzOioAEJJRnrMVa9F00f9gW/?=
 =?us-ascii?Q?Ly6tzX3v+6kUo38DsPAXie3xlEinN0ZeWAVQiwUaQxYCTgE6RhrjyGf71UMH?=
 =?us-ascii?Q?1LGgBYzRCucRgeowFoB0Zw34Z6ASzkD13IAlQHoszqyN0+ku6wxGMp6mUgEj?=
 =?us-ascii?Q?oVYHvNwFU6D/2GmOGJ5DkTmYcA9gPySflx0qItoAJZLVvXjgi4b4r3S1LVI9?=
 =?us-ascii?Q?ywxgFxzKZipnGYCIX2qSdlnPBYcorUg+ggdOobzGaOm9NkwnBegm7OEJr7m8?=
 =?us-ascii?Q?I95K9IHyZhwY9vK90U3UHx3ybgS5h4KY26Ln6gK/Q/DEVRZN62uQ5n9yCQWB?=
 =?us-ascii?Q?GIffjaQWR+oh84ifHv8eBb/tKpMPXtDRhN5c6KjXlF6EwnYTgl5ZbctNqrhj?=
 =?us-ascii?Q?vDMcoy1LT+Bjy0x1BpODZ3jXqoOhImiOrMfJZ3u49SVdTLq43YaKiArGdp+S?=
 =?us-ascii?Q?8dSsBiUD0Bjen1hgBBYZKeLysolI4eMSaGVONlmXHk+McPLMwFWFIwZ/0RTf?=
 =?us-ascii?Q?lkIkVW/Vh08bHGpiZYDoH9OZJjcxcgwYbl/r2Tw5kLeHX/fdk5h5Z0Ks5teJ?=
 =?us-ascii?Q?AKW3eAQAfIgGX6IZUpHHg+xuC4fZzzqhqbI/c3/tpwyO0yN6vwlmS+6UrGlU?=
 =?us-ascii?Q?S1YYWhZpU7DOO1w+5gEF5KJu36DMAwxkf7psCgSoHSOvaCfb6cWM0XlF6mgJ?=
 =?us-ascii?Q?PzKgPfE8NyC11XO4KykrviQkZ3SAIBtGzjK6KMR72YADYDPnfLjK4SLSsc9H?=
 =?us-ascii?Q?7KQXRxyktoeGKhdIGjKU6d6UqoEcD7DaMc1bV7IFcuwH1HJVR9aM+Gfnn9L4?=
 =?us-ascii?Q?yIiC3YSWslg+Ab5pyMl/3ShbCjDjpw9hxYIJr2gtXFzlxeyv+rQcehmNmBHL?=
 =?us-ascii?Q?Qafw006fa+vK5cFImd6OCIbpFNSFGEhA9EFHBy6j5dEEEi2njToc8CylasLt?=
 =?us-ascii?Q?g8XVzrCnEDxmJfxtgyv7uuAtOGggTa47fBzcZsPh0wKQFILCitm+zqJ913Qx?=
 =?us-ascii?Q?scHTsHuueqrxLywK/1EH2p6qVQmBsI3P7OzMRzvSGuMjNOOzRn2YIt14fuJX?=
 =?us-ascii?Q?XKHqt7QT37lm8hdRdshfkBMLOctRvH783+F3JYOBLms9b8kBioyeMTbQ+Q+J?=
 =?us-ascii?Q?oAHExy8OQzGyTaGC2HZtquuJKC5o0eA/WRxzepM7zf8nA9P1kGI9n0FV5WYf?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 289b8e34-04d5-4e81-bdc8-08db87043428
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 20:27:12.8995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zy7L3jPhiROeF22Qgok6C+3z0cLauX+bdXRIEgY0g3jnQkaBuW6rOdo9fsXdtdwzqFEqqxGc8eh8IvrzyZwKrerQBsdcBDG0zdII2rSlBK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 07:30:59PM +0200, Andi Shyti wrote:
> Perform some refactoring with the purpose of keeping in one
> single place all the operations around the aux table
> invalidation.
> 
> With this refactoring add more engines where the invalidation
> should be performed.
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 63 +++++++++++++++---------
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 +-
>  drivers/gpu/drm/i915/gt/intel_lrc.c      | 17 +------
>  3 files changed, 44 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index fbc70f3b7f2fd..6d21a1ac06e73 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -165,7 +165,8 @@ static u32 preparser_disable(bool state)
>  	return MI_ARB_CHECK | 1 << 8 | state;
>  }
>  
> -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
> +static u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs,
> +				     const i915_reg_t inv_reg)
>  {
>  	u32 gsi_offset = gt->uncore->gsi_offset;
>  
> @@ -187,6 +188,40 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
>  	return cs;
>  }
>  
> +static i915_reg_t intel_get_aux_inv_reg(struct intel_engine_cs *engine)

Generally we try to avoid putting "intel_" and "i915_" prefixes on
static functions.

> +{
> +	if (HAS_FLAT_CCS(engine->i915))
> +		return _MMIO(0);
> +
> +	switch (engine->id) {
> +	case RCS0:
> +		return GEN12_CCS_AUX_INV;
> +	case VCS0:
> +		return GEN12_VD0_AUX_INV;
> +	case VCS2:
> +		return GEN12_VD2_AUX_INV;
> +	case VECS0:
> +		return GEN12_VE0_AUX_INV;

We need CCS0 here (0x42c0).  And on graphics versions 12.70 and beyond
we also need BCS0 too (0x4248) since the blitter gained the ability to
interpret CCS compression.

> +	default:
> +		return _MMIO(0);

It might be cleaner to use INVALID_MMIO_REG here (and then check for
i915_mmio_reg_valid() below).

> +	}
> +}
> +
> +static bool intel_engine_has_aux_inv(struct intel_engine_cs *engine)
> +{
> +	i915_reg_t reg = intel_get_aux_inv_reg(engine);
> +
> +	return !!reg.reg;
> +}
> +
> +u32 *intel_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs)
> +{
> +	i915_reg_t reg = intel_get_aux_inv_reg(engine);
> +	struct intel_gt *gt = engine->gt;
> +
> +	return reg.reg ? gen12_emit_aux_table_inv(gt, cs, reg) : cs;
> +}

Rather than adding this new wrapper function, can we just do the
register lookup at the top of gen12_emit_aux_table_inv() (and bail out
of that function early if there isn't a valid register)?

Keeping the non-static function as the one with "gen12" in the name also
helps reduce confusion about whether this is something that older
platforms should have been calling as well.


Matt

> +
>  static int mtl_dummy_pipe_control(struct i915_request *rq)
>  {
>  	/* Wa_14016712196 */
> @@ -311,11 +346,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
>  
> -		if (!HAS_FLAT_CCS(rq->engine->i915)) {
> -			/* hsdes: 1809175790 */
> -			cs = gen12_emit_aux_table_inv(rq->engine->gt, cs,
> -						      GEN12_CCS_AUX_INV);
> -		}
> +		cs = intel_emit_aux_table_inv(engine, cs);
>  
>  		*cs++ = preparser_disable(false);
>  		intel_ring_advance(rq, cs);
> @@ -326,21 +357,14 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  {
> -	intel_engine_mask_t aux_inv = 0;
>  	u32 cmd, *cs;
>  
>  	cmd = 4;
>  	if (mode & EMIT_INVALIDATE) {
>  		cmd += 2;
>  
> -		if (!HAS_FLAT_CCS(rq->engine->i915) &&
> -		    (rq->engine->class == VIDEO_DECODE_CLASS ||
> -		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
> -			aux_inv = rq->engine->mask &
> -				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> -			if (aux_inv)
> -				cmd += 10;
> -		}
> +		if (intel_engine_has_aux_inv(rq->engine))
> +			cmd += 10;
>  	}
>  
>  	cs = intel_ring_begin(rq, cmd);
> @@ -371,14 +395,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  	*cs++ = 0; /* upper addr */
>  	*cs++ = 0; /* value */
>  
> -	if (aux_inv) { /* hsdes: 1809175790 */
> -		if (rq->engine->class == VIDEO_DECODE_CLASS)
> -			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_VD0_AUX_INV);
> -		else
> -			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_VE0_AUX_INV);
> -	}
> +	cs = intel_emit_aux_table_inv(rq->engine, cs);
>  
>  	if (mode & EMIT_INVALIDATE)
>  		*cs++ = preparser_disable(false);
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> index 655e5c00ddc27..d938c94524510 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.h
> @@ -13,6 +13,7 @@
>  #include "intel_gt_regs.h"
>  #include "intel_gpu_commands.h"
>  
> +struct intel_engine_cs;
>  struct intel_gt;
>  struct i915_request;
>  
> @@ -46,7 +47,7 @@ u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>  u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>  u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs);
>  
> -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg);
> +u32 *intel_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs);
>  
>  static inline u32 *
>  __gen8_emit_pipe_control(u32 *batch, u32 flags0, u32 flags1, u32 offset)
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 235f3fab60a98..70054767c88c3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1371,10 +1371,7 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
>  	    IS_DG2_G11(ce->engine->i915))
>  		cs = gen8_emit_pipe_control(cs, PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE, 0);
>  
> -	/* hsdes: 1809175790 */
> -	if (!HAS_FLAT_CCS(ce->engine->i915))
> -		cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -					      cs, GEN12_CCS_AUX_INV);
> +	cs = intel_emit_aux_table_inv(ce->engine, cs);
>  
>  	/* Wa_16014892111 */
>  	if (IS_MTL_GRAPHICS_STEP(ce->engine->i915, M, STEP_A0, STEP_B0) ||
> @@ -1399,17 +1396,7 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
>  						    PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE,
>  						    0);
>  
> -	/* hsdes: 1809175790 */
> -	if (!HAS_FLAT_CCS(ce->engine->i915)) {
> -		if (ce->engine->class == VIDEO_DECODE_CLASS)
> -			cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -						      cs, GEN12_VD0_AUX_INV);
> -		else if (ce->engine->class == VIDEO_ENHANCEMENT_CLASS)
> -			cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -						      cs, GEN12_VE0_AUX_INV);
> -	}
> -
> -	return cs;
> +	return intel_emit_aux_table_inv(ce->engine, cs);
>  }
>  
>  static void
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
