Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3F5F1127
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 19:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B513010E32E;
	Fri, 30 Sep 2022 17:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9770610E32E;
 Fri, 30 Sep 2022 17:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664560153; x=1696096153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zDP1P6akFKMLGRLLd23ejeoGHiexxl+JuT6eIYQb748=;
 b=NS8tEIAVj3VBX+AR0Sludc5tVpnxi1QtXfTyFkStGft9l4TotIzUpX53
 Kgcm1KRyGVRG53LXXH39JShc2TRcGGDG7n8Wqia/Rb0eLGUtvuMtu7QoJ
 uBvMxKZRgpIklIz4dlssaPuTfwjcCZ3xmNYMkwgg5gUJW+DXCt2flvmxu
 zswTvSpC7CpgvUDIJcFYKmp+RK5cdK2NilLFfdgDB0cWm45zM6o0sqNyk
 fpBG/BZHuAk5MPBXFfsjgtb62rHVdd4PKZPoWjKUeO/l2Y2OInoZu3N+P
 Xp8wCkkHLEXiZdMi+F7R11S/cmjdfTPht7mhScriGf9aH19SAVRklrfr9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="285386903"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="285386903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 10:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="951631633"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="951631633"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2022 10:49:12 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 10:49:12 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 10:49:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 10:49:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 10:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnHKLebBeCD0upRwLeWROELgvtfunTzSnxknLGNKfWc31u4ZfpUIqNlPt+rgscqTdrkAK5kB8Uz21LPqJx3MpDURrQ+NyIHrK2BATilN8a+HbwyVYswc5qFL4wB5ey4hhUnYda0ccfJf2SwEQGPSQL2UPss/Q9dv5cU504fvAWBYkElp2pRoISxSOM3D5s+Ec0kLTlwdDcrgHfJuUCPGcC3oZw3orEd0yEQJtxw3eRto/XWIWxL+YdnvXkfVvD9PhL+Kz626b/+KZzJYsWAZtuF/XaY1UOarhMiKqhtMM+nIeRVBfagC/fPTx2uRUTchfxzTUzanxlpJrCNcnD687w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EarieCbbk/yhgePRoInLSldzyYagduwTGlls7l7WzgI=;
 b=IAuLRwX9rXbijcIPmRW85nxx89QrpVxoPrR3gi/u34l8ewMoyYJCT1Y2YhPOMrIJzNws+hVfZ9/DYiVuNscOrw/SKeRnSnqS0vpO55kJogKO39QcybkJQdB8VHRbYyaVHj0coIeiDLCyUd3MoHECg/lda5a1COevkXq6jUai+LaG0TKChrjkfq7NHhERw7udxRAJTnKXM+lfR+kCJqYXySkYwcYJMsMb3SVrCfmkuE/cH779GYU5wMujlSdCnRYrgr5llUpp2MPsUpJufQmBoSZxLSqjYI7rYuyk1dMNGVUdLKaWpaB5iqNoHsGqikd63xGUMnJSInM4joivN4686Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Fri, 30 Sep 2022 17:49:09 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 17:49:08 +0000
Date: Fri, 30 Sep 2022 10:49:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Fix __gen125_emit_bb_start() without WA
Message-ID: <YzcsElCoVApN+7RA@mdroper-desk1.amr.corp.intel.com>
References: <20220930050903.3479619-1-lucas.demarchi@intel.com>
 <20220930050903.3479619-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220930050903.3479619-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: e63a7fd4-a1b1-44c7-f870-08daa30c1335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9WAriYgTF4hW0flqTqEz4AJH0hKc2K1ZLT9pv9nj+Z5EDE8NXrC7NX8RQHG9iXvexzQgcsx3VDSaUUIgLILIX6tF9J6upD8PReYKm0IBVWLbVzaOhbdaBLhlwvz08DIQ+mhoUxtD0mGASYA6CnpUlKLsrR5ovGJBg2RXv4wQMAZdB69W3qYHODbGq5TGqpaXuawnGPJ5wT6z/1UO9dLFyWy+IFhA5yzC6neIyO5Q8KqfpkGsWDcUYOS3t07X02is82JGg37HFZ5+kdlO3BUKVjwfiRCxrKbK61fZRTKPpC8faiGFl+ZFQkIqF3jlAjuuf1VV1tQmSKPNAwu9Ts/1tSKtvMr8xHVYuEnRi5eicfsY3QzLX6V86FsxX8yD154Fdpcj9QW+KtmERDGhAs2yVbQFATRC50ce62j9vmAldL2F+Pz+3M9AUltjWVGsgvlVcoB6+2zE/46HcsPO/WrcsDkQlM4uZbL/TGttw53tDzracnuTxgN3vdh3RzRS/ZXvJU9C5gmEIOxOltc709GPiXWX/3G4o4pwlNhztaoLcAtu4U2+lT8+4wVBXC8nfj7kT3wH7sXOenFPtmdbIZUar6bkvHl049Un3O02fqKh0XnNaQ0GgdiWBuaUwRPOnaUKCkbAEjCM3IruIuAgCWNqQLMCtQSXk1NtMhN5v5mWZdqVJLtCFEs4S4RABmzHe4fkR8EU694IPL/IIN03nMpW8nGNIT6An1dErLKd9kJvQ8Mw7qwr7YWXTELYMjkwNLC+qQnfL8KJEVERlku/sdINw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(66556008)(6486002)(478600001)(6506007)(8936002)(2906002)(54906003)(6636002)(316002)(186003)(6512007)(83380400001)(26005)(38100700002)(66946007)(4326008)(8676002)(66476007)(82960400001)(6862004)(41300700001)(86362001)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QIq+3VHOAelVxL5a4ZhmRRUVwb3vKEcUQ/F4fWEYCPu+T2FFt3UlyiOdbxM7?=
 =?us-ascii?Q?Uk9rl/LTAwUg3Ux9GXXPuXhyauS16Gc4MJ1TGOuyQnYHaVeIraD/j6OCRpJ8?=
 =?us-ascii?Q?cL3uOoApEdmoy9gVNJAZrdQxfxIPumWZ6jVh5Lr+DmGBRnqrA40bc/QhHOFs?=
 =?us-ascii?Q?oO/Nuu1S8239KB2C/X8poNfVJTIPQq49OBprlX3k9YehrH1XW1ynq+cpelpV?=
 =?us-ascii?Q?JYh9nVZ7PzNw909qkeM3/WWhlBu/O2Y5hSXtf80EB8WD1SsfMG2DiaCPrS62?=
 =?us-ascii?Q?NTwRVrIZS0/0oWEdFXCtoAaXX68Mylon+YuY3/+bmxEHCc+1sfvk11EpGwSg?=
 =?us-ascii?Q?DiYbCMp72C1TEpxcgrtRz2vFfruzTvGh3Ke2Ixsje5GoplMlfAYrmwPBEqZe?=
 =?us-ascii?Q?0itUoppi5Cz4bw84S8cnmtWtTJhLKzqvRvXVDPRi14eBovXigv6OW2m70J8C?=
 =?us-ascii?Q?RLzGnLlu0JndmqHkuRm90IEcaKWjOcZ4wEktBocbNCleqDmnD1k0gX5CNPpr?=
 =?us-ascii?Q?tOXDQhFPzhkp0HVLcFmbPd/cplTmleVE+86irr/GbxFIF/jc4WjY6TIdDUys?=
 =?us-ascii?Q?EK/shwHrEid0sbjcKcKmMregD+3yaeT8/MzIUdIIMPLV41D2L5TnLWg3aErF?=
 =?us-ascii?Q?IT8lsLiEert6XfU0PGK+UDyilZIiouZZUfpDQiyelEHDsPOxEkssbp7/NZCE?=
 =?us-ascii?Q?0wtZRTwZAATUxmZNpYIIzSZxQyKwy8pTyWlWH7yKuDkHL8WUjMrtOKSqWlec?=
 =?us-ascii?Q?Kr47irN5zSYRPtwNW0PUhAYa5aL+ZOYMFL+QFzxLCT5BIFrfoCyHsS12A8EI?=
 =?us-ascii?Q?ewOwwSeapc1Z7rpzoozWfrLCm66HriEMaDYVkJIOymgdp53xATKazcfm2VYq?=
 =?us-ascii?Q?Q2g5a8Bbqt0bUHCF6hI8x2D/JXevg2L/uBJb0dTMOfV426PtqZUfd3zLIdKj?=
 =?us-ascii?Q?iXwM0I1WW3BLe4o1scE6LM1RgGIcUi8VVKevyZ4WrJRi74ip3XWTpAvQPrqw?=
 =?us-ascii?Q?7tgLTK5sh+i1aG1fnMa5IO0/zz4zXICokiHBbSTG2lR+TNIvZ27R+Z7yl1mh?=
 =?us-ascii?Q?5gkpTORNLsuXnbA5i1Q1/tWZXccbOS94JVjsqBjMS0Xbc+TSXTHY2t/yW0Zq?=
 =?us-ascii?Q?9z+9HPIcDzqSHIl1S8i10Od78QO6aQLGulbLwlIsWpobHZy1wyw/pj4lVPS/?=
 =?us-ascii?Q?dKE/UA6qhRvfbHgZOlo8Tf1JdO1bYMFdEkAP98TxwmOlgrLZb7saMPMtf+We?=
 =?us-ascii?Q?mcBhNyYKf5B41RAb0toBgOO8PZD/7lP2cJW+mYnWP2HAheZzq6gpvakLMvQ0?=
 =?us-ascii?Q?vKzgS4fx+2AZ9fL4cFqbPV0in0FxrdnhtviGMvSK4SXEb7S6/x+cGc64TUZP?=
 =?us-ascii?Q?3q2BTZPMHGIPCD2t+uxYjSoFLSZm74kwAiTIEmr1kX/BuzmwUZYvTK8witiA?=
 =?us-ascii?Q?W+7cnHZHY3TfznB3zooyJaCQtlYMT/OkWFPj4OF/pinjKuCv8VJfqSOOfKmR?=
 =?us-ascii?Q?kaK3Mm6Ri5fX4+HUSIC/eFiLMufMUM2Dh3DwBZbYyuuIc4td0BCSC3aXqYFb?=
 =?us-ascii?Q?b/zXWarZqSXTlHhiF/j9geBgrgkmFOtoqj4LKnGY5dRKq82DzX/0vNSBSR4T?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e63a7fd4-a1b1-44c7-f870-08daa30c1335
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 17:49:08.6241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8Xid1uo4vPr1wJGhGlb8DPJBUNHGUjExTsYr11nYuK7v4jvbiCZ/EiIHwHPtsXsbcT2ueLz+cLn1/QMGmD6zTE75SxdPkxPGvTsa7KkU+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 29, 2022 at 10:09:01PM -0700, Lucas De Marchi wrote:
> ce->wa_bb_page is allocated only for graphics version 12. However
> __gen125_emit_bb_start() is used for any graphics version >= 12.50. For
> the currently supported platforms this is not an issue, but for future
> ones there's a mismatch causing the jump to
> `wa_offset + DG2_PREDICATE_RESULT_BB` to be invalid since wa_offset is
> not correct.
> 
> As in other places in the driver, check for graphics version "greater or
> equal" to future-proof the support for new platforms.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c |  2 ++
>  drivers/gpu/drm/i915/gt/intel_lrc.c      | 19 +++++++++----------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 31a2fbd8c4a8..e000eaf8abed 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -405,6 +405,8 @@ static int __gen125_emit_bb_start(struct i915_request *rq,
>  	u32 wa_offset = lrc_indirect_bb(ce);
>  	u32 *cs;
>  
> +	GEM_BUG_ON(!ce->wa_bb_page);
> +
>  	cs = intel_ring_begin(rq, 12);
>  	if (IS_ERR(cs))
>  		return PTR_ERR(cs);
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index e84ef3859934..3515882a91fb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -825,19 +825,18 @@ static int lrc_ring_cmd_buf_cctl(const struct intel_engine_cs *engine)
>  static u32
>  lrc_ring_indirect_offset_default(const struct intel_engine_cs *engine)
>  {
> -	switch (GRAPHICS_VER(engine->i915)) {
> -	default:
> -		MISSING_CASE(GRAPHICS_VER(engine->i915));
> -		fallthrough;
> -	case 12:
> +	if (GRAPHICS_VER(engine->i915) >= 12)
>  		return GEN12_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT;
> -	case 11:
> +	else if (GRAPHICS_VER(engine->i915) >= 11)
>  		return GEN11_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT;
> -	case 9:
> +	else if (GRAPHICS_VER(engine->i915) >= 9)
>  		return GEN9_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT;
> -	case 8:
> +	else if (GRAPHICS_VER(engine->i915) >= 8)
>  		return GEN8_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT;
> -	}
> +
> +	GEM_BUG_ON(GRAPHICS_VER(engine->i915) < 8);
> +
> +	return 0;
>  }
>  
>  static void
> @@ -1092,7 +1091,7 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>  	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
>  		context_size += I915_GTT_PAGE_SIZE; /* for redzone */
>  
> -	if (GRAPHICS_VER(engine->i915) == 12) {
> +	if (GRAPHICS_VER(engine->i915) >= 12) {
>  		ce->wa_bb_page = context_size / PAGE_SIZE;
>  		context_size += PAGE_SIZE;
>  	}
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
