Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF28B75B8EC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 22:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4E910E19E;
	Thu, 20 Jul 2023 20:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4077310E19E;
 Thu, 20 Jul 2023 20:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689886396; x=1721422396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=crcKyzFazjW0l/qDB+YwdSPBEHwqAh/s+u+pGmWavwM=;
 b=fD2EKx6iA0N2el3gkQJtv0wuVJQgKJIGfXbX7d30f8691T25EcwoM0Zu
 T7WGWMaNENPkvwPnuq8WGDVy07o6NZLtR+MJaKk2CnnhxYtr7oD3bunoR
 nRRheMhIdKEr8ohl4Vy2529a78aCYRewVre91vtUWwAAzOPsF97ry/iOO
 OgG6F0IMQq6t80hOatm01Sx4WfQR17DQhGcy5tGWD//eXv0JjPFVL6DY9
 0mUeKPtSlySzYitmEkKfJcMXIWPmTgx4hh8m8X4mxM3MFx+KKpdoZzaj2
 E14ZdOJORZMOuy333c1AF+2DQcydR8dFkv1/jowpB8BPMvdokgvq4tKwg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356846018"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="356846018"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 13:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848599866"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="848599866"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2023 13:53:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 13:53:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 13:53:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 13:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RccPRSG8CDVPDoWu6uHttukJqD0xvWuCEgF+7DCch7CZ/RcN8FgthGrO+Z+OlbBI+y8r6zdK4K045t5UmauipvCLKZwOA84vEAQVOTBsOroP3YZZKGjcgaxUsvcHAEI1XMIQhJSZmWCbUJb0FFOeW9GS2+57Lo3+GudfTQUAMj4p+1LxGMhrVC1Zr9lcOjbQc6Vf2rzkP+8oMAseuzXnsBm6Z/6THv3MduPKiaiRi18lRu5P5Ks0RPJ31FSK1QZVBambk34Sjhg3Au6TweVh2qWrZwEWtzlo5fcAr9dVtrqpThyX4OKMK9WBLT/tfTo161qlSsJ7hd6RO5Fov06VKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpXjxeVR2Erf1ae596dO3aHutBrREEZoV5q2TTzXtII=;
 b=LKnw+MtqRMbRyn9c26nq3P7KzcUk7zkfrYb7kt8H3AzZMTub8OJ2stOMoYCf0TyT1byG5eOAVRHhn1KFvZm3CDNI4PhyJvAmIbgWdIzmGsnjeRz1Nq1zuTSxD4jQJtoaulLCy4+qBTJ1nRaEMqc8l3BSgYskBMm0N9P3Oah+a4AGLMf3p7J+IsTj4cH7fFGg5BLoj4v85cObP8yzbkszAgt0klBCyRJgX1DcHuRp0uNDQ6JIj8ig1fcPrQPEPPWqrjulCMUZ++VOSsagUsdqNp1Hr+X+FTtPHPw4JHfLp3JjGjYbCQgXNTXmtrCdMGHmW5aLcek2zWtTC7dRWmPePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.25; Thu, 20 Jul 2023 20:53:12 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 20:53:12 +0000
Date: Thu, 20 Jul 2023 13:53:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 5/9] drm/i915/gt: Refactor
 intel_emit_pipe_control_cs() in a single function
Message-ID: <20230720205308.GW138014@mdroper-desk1.amr.corp.intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
 <20230719110729.618733-6-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719110729.618733-6-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: ee552c37-f398-4283-edf7-08db896354bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/HcexhRz096ViV7tYC/L3UmfFJCVjbNGHW/pb851SrMoGg+puPJ0E64Nq6RomTIDXMDBwX7j6h0yaKAWAlkF2SwSHTcOmdoYv+5hAd2+CXqdwrG3RncTNzY4omnpJuZHrcctlE3+doDpRXxFvtJOfvngEnc5X02/eqgCxAwD5Jii5IrTmLcJ5uwG64raRcc9CyRCXPXqV3SHuWZe/ARpPPNLycm8M2w+xHBfoYlsq9G+SogYVNUEL9i1qgvLrPhkpHauUAehJIBsVWuA4Ai+NjUiih/+LQscF/3ySj1UQW3bIkeqHjLKyzBr8iD00ZvHlbnNI88JYkdHObvCrr83JEgi9iE9jM0MoKscyaOdSJOjLotqDgYvgZ2rTdMSC0W+0t/GizDBGUXjSrx7pHn0S5cVJpS6n8YUoOAiUq/9eoH63VFF1VaiFZ6l8W8/BK1GSmSqK5P2KRrhpbvxqDczhRHBvtUTijQ4aCDTNNmvafy7iR365ic6HTOY5dEdTsgdq56/aKuQEi5Q+424/xo4ZnrZY8dGVIFRBSgQZaS8QXpDiq+lK2wUWUs0Kc+cC2T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(66476007)(478600001)(186003)(26005)(6506007)(41300700001)(1076003)(6512007)(6666004)(6486002)(54906003)(316002)(6916009)(4326008)(5660300002)(8936002)(66556008)(8676002)(66946007)(2906002)(83380400001)(38100700002)(82960400001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mkcKI8xPI0EoWWF9eYRpqi+4iD69kCE7RxG1AAjtWcGEAjsq4NDCLDyvPvBg?=
 =?us-ascii?Q?09ewUDzm8njywbRrfBXiUay+uteQjErP8ezpDwqmqcG5oe303oR42o0GfPlV?=
 =?us-ascii?Q?TzMK4pMCshtIihfnYr33qMaFQXSTk/PD24p8uAW5VWuugBlhAg7slDGwJIhw?=
 =?us-ascii?Q?2MxtNlT3C3vKnjRv6Vd1Gv6Yr0FFRfqKss0QnzeFFjN4WoHWwwcvyO/+nmH7?=
 =?us-ascii?Q?/oYquZvvdF6rlqrzvEGbTrIpeFN3nvmB9OCf/D1AMgMsGUbR4oRqR68fyERj?=
 =?us-ascii?Q?TE3efrsNMhI55rduxbth49p27E/8AIxxiK7wCElq//lBrqWn3HbQuEQMiPkv?=
 =?us-ascii?Q?gK231d/t1KaWKfzWEBFldNyvyTE0b1fudrwOQ+qxctirOf8xbDQcbVJo49d4?=
 =?us-ascii?Q?ba8orKjfR8pjN5OqL9iGtPzy3P56HTBio9zyLhXjBxn5bOQb91IUtPmD4EV3?=
 =?us-ascii?Q?Ty8ZGpbYlTAaqOsab/Aogr/c86zxRB1e4u5pUSBOTMCtVp+ZSDb+dIsP7bHq?=
 =?us-ascii?Q?mtKvqn/w3Y0IMD0/VkgvAKbFx1mxIvtDX/GQEG8J6O7qbLnSrMTJRgscWcBw?=
 =?us-ascii?Q?+H6U4uYqq98PA3mnfkyzyIXM2Ww82SCt1FwB/c7coM68/CZiEdkhYcassMLF?=
 =?us-ascii?Q?69RBzuMC1mEF+tMAYXfLeEdgA/8eMDtbHC/lF70Du3fYfhicB7LAG/ZugYhE?=
 =?us-ascii?Q?1l3yyVnWF4/LhL1mTajIWGwh7fBvJHuIgdkh2DlRWatnp/GjbM73qJNPEv8E?=
 =?us-ascii?Q?MrjBPESpC7riHR7dJaJPlzDj7KgEtb62BxO6yeQHZVAihXUJmfPjLLA8oBXk?=
 =?us-ascii?Q?VuNsji6QkkCKQiZt0MuuEPl/PDXroGR5d/ejsGmtTkDOxPjaLvqmIHHrkiSQ?=
 =?us-ascii?Q?PN0/+Pu5161iZKkVfhhXQxE4J4mGZsHKZpaGhZnSIMKZcKnY/jU1fbksIXO8?=
 =?us-ascii?Q?12mkMOrsAnUreIYp9hkbtoAVKh6Qrt9E1lvlghLNRKLrI/npgB91UjWG33j4?=
 =?us-ascii?Q?hJiR8K/GwjnR8CxbYf/ZpJwANJNBhd1Ce0GJ0wrkPOZjUfHu0dcLcYuYDdhJ?=
 =?us-ascii?Q?fCT82ukMhhirlQwQbaiykaVMXAoGH/Ytl87hFRP/jqUMY4CEECVXBFg2s61N?=
 =?us-ascii?Q?XVa4s0ezOJxSU87m1vJTTvdXasjYweJNwmPf5JVTR2mYq8LPjzIALu5iDaaX?=
 =?us-ascii?Q?El6JBDkCw33jaiIGP+HZMc7KMPBzrKVGR6NMNURZGlLKdZUMqjyQNdwW3tg+?=
 =?us-ascii?Q?2nvkeApYMxu0Z2hlFZmnDFqoGE1RoWsBHS1jVgNXONo17vAhLyo/hj8kRC+4?=
 =?us-ascii?Q?pohrqMzsxJ/fczFeT4QtgU+1md1Qazp4gtDMH2QC/SKezljpq1JfkdJnkZFc?=
 =?us-ascii?Q?o0SUi+HhYsuEizYgKGr+qz1lkujxlR57huMDwkC9Oug3LrD4FoeQX8aQPGAY?=
 =?us-ascii?Q?nBUlA1CoCIjbCcBmzlyNbXyOCQ/ozPm31OrPItaST74HhHTa5vaP/JLO4NRz?=
 =?us-ascii?Q?QCOGl0x4XZYbdPBWgwMK4T++3gHw05xXx6As5X0e415Mt9rRpAeJIu7rhTQt?=
 =?us-ascii?Q?w0GthHTtxKTapPwwdWbP0BfI849LvJ2gQH8s4sBzsRQ3phQATc0Gq6Decat9?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee552c37-f398-4283-edf7-08db896354bf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 20:53:12.0977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utxJZGy83YjCoFUxR75jYcSs68x5ENo+hrhMSaw32OARhW/d/VMppB1cUcyxnjc3CQOkOwIuXKE6vu6w+OwGmtEyaiOmUJOzpwun2QcNYOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 01:07:25PM +0200, Andi Shyti wrote:
> Just a trivial refactoring for reducing the number of code
> duplicate. This will come at handy in the next commits.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 44 +++++++++++++-----------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 7566c89d9def3..1b1dadacfbf42 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -177,23 +177,31 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
>  	return cs;
>  }
>  
> +static u32 *intel_emit_pipe_control_cs(struct i915_request *rq, u32 bit_group_0,

This is another case where it gets confusing because this function name
sounds like it's something generic, but it actually only applies to a
small subset of platforms (gen12).

> +				       u32 bit_group_1, u32 offset)
> +{
> +	u32 *cs;
> +
> +	cs = intel_ring_begin(rq, 6);
> +	if (IS_ERR(cs))
> +		return cs;

We're not actually checking for this error at the callsites.  Should we
be checking for it and propagating it farther up the call stack?

> +
> +	cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> +				     LRC_PPHWSP_SCRATCH_ADDR);
> +	intel_ring_advance(rq, cs);
> +
> +	return cs;

This cursor never gets used for anything.  We can probably just make
this function return an int error code.


Matt

> +}
> +
>  static int mtl_dummy_pipe_control(struct i915_request *rq)
>  {
>  	/* Wa_14016712196 */
>  	if (IS_MTL_GRAPHICS_STEP(rq->engine->i915, M, STEP_A0, STEP_B0) ||
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
>  	return 0;
>  }
> @@ -210,7 +218,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		u32 bit_group_0 = 0;
>  		u32 bit_group_1 = 0;
>  		int err;
> -		u32 *cs;
>  
>  		err = mtl_dummy_pipe_control(rq);
>  		if (err)
> @@ -237,13 +244,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		else if (engine->class == COMPUTE_CLASS)
>  			bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
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
>  	}
>  
>  	if (mode & EMIT_INVALIDATE) {
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
