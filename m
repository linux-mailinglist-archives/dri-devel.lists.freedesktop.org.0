Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0456E9D57
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 22:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE1D10E2FF;
	Thu, 20 Apr 2023 20:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7B410E2E6;
 Thu, 20 Apr 2023 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682023262; x=1713559262;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EtP1HekBOwcwVuxC973uBBoCmP0PJNYCA3bea6VPipI=;
 b=ExdBCjty3pRmEdYRuorR8bl9sSQLYp/Yb+TXHzeh3j340HxqBoBgA7tE
 4KvgJfK0CNcOMgVxxW4kdlZfKFHxBM3VBj9PY8JdGkcmHUKkebtzUGnwu
 PWtSfhAU7p7z7vX8HWIoSRY8N6UoImdWJm6OwvZs8gwl19UH6D1mPR5gp
 NBcu6VxT5a/HbGFhysSPhc6VvVId1p7rOKiM44LJyhDDAxerkGM5trUBG
 K4orMpVNG6nZ3XEfqUqB5fbauKL1AiGwGWPtFxYiFUvVXGOvGcEjaZ7TX
 YBfsi+0JEoxNTHpdDFs1tuYb5jOenWW6HgciRdvq0bulaAMOtF8r9YwxO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="373765266"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="373765266"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 13:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="761335234"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="761335234"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2023 13:41:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 13:41:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 13:41:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 13:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWKcX99mqjH8yLTszQs86n4f+Gmc4tZmyskYWpTttyVcgDI0M0IpI9Q+gmil1OvcVSyWXrZKal1yrYZ/mbbkRjUrwvyG47BdwhaXjrZlvZUU3E3B9FQkUnd8SEvLg7am6GIWFObXc0NMmwH+ohhPcYKCGQkauKryuMUEL2IjnmBfwkikv0kil/KBP3ExRO896t5lt6EwwPNyEYsSTcPvUean8F03c6JyOond96Bd5SsG1bUQZwagJq1d16SYiQ/03ohTFTCahemLF9nqZ+8VCZvLWxc5nwwC9MKzbr6lgXL9TVzoLIVTrYW6A+n1FIEb4ZHaaNbj44yQhPnYf4RSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG2UfEj7SZGpHJXLAQBhkXAPqX4/27Eioueaw4GGtA8=;
 b=mGsdDBbuuvwidKIZa0uH5q2K/88bcC5lqIzarqzqO4EyvYxMvF0bnpE8F+dijGB1HaEcETABGiQBjoP6EUOmH2S2dPnKXxt1h8AKODG67pOqle3/HOiLH1FKX4QSqvERbG0cY4QXiHqPBrP/kXrpT5fU4znbC3awliIiSMkZFbIa5mLYm/Lq6KncRmRd+6EGq4n1lZBNP3V0BSyWa7gr+l5G7OwyOwa0zDYGp2xpMFotdgAtezXGFy7ZYavd8omyklONEC4PHD3rz43uFMNybZQEgyMRuRqzcPNP53UvzKY55lnYE2l6rRaE659nwSflx4gOr4QfnZQLW+vwH5MbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB5600.namprd11.prod.outlook.com (2603:10b6:a03:3ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 20:40:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 20 Apr 2023
 20:40:59 +0000
Date: Thu, 20 Apr 2023 13:40:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Message-ID: <20230420204056.GZ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-4-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419230058.2659455-4-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e11c527-2050-4b15-2e07-08db41df8c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqOXTt/iHan3JD3POwHNaoHgRc23n6i9vGMdmqyAP4nkFrFQyq/J7kgUYoYTFh/VTM5ULe3H5hspdo3U6EIHzrVyRIE52w6y8UdaDzq0BA5tyVMWorOlnrPCuHzksm5byQ0H/Lo/p4Jid1z3szzTp3rJdaJ9yPIPDz1nz2pwYiIka29TiQ0If4OW9t52y4gU6Xd3ANZmIcvxQBhxms3SRYfX8eLKbuCG3Q0fRTLxWFgVHiL6Ker0dKtueRPqwF9HUiB6Q/eUW4Xst6+TExsDUFeBSR2gQtOucGCtVY5YMVdNazJmkBKkjZrG0JQXhaae4nzWTql8qN0IJbHNyxJL9jPvkaBNxp+fh4/4RlXfvxOF995t/DDlqFOGlc9PLvXoi7ZjYKiHEGyw0fYjemeCciRckaseecAPFTbVk+/SCwZqFoTCNlOZla9QNBww1bghMACkJ07yfQEU+h0M/nMhGktld4fi5F5+RYXn4WWXv40FWSlbqEYE/r7EiNT6W4cKhI86ZJjwN3aHYl0Zysy3wSzoA289Epa2nXGzDFHyzra/CgEqKRbvZN7TBHu1WZqL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(54906003)(83380400001)(478600001)(86362001)(6486002)(6512007)(26005)(1076003)(6506007)(6666004)(4326008)(316002)(450100002)(66556008)(66946007)(66476007)(186003)(6636002)(8676002)(8936002)(34206002)(2906002)(41300700001)(38100700002)(5660300002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qE3xdh5WDhOvbT4WRKMc11Sl7wbVZjD7L7eqy2i4EEWyDD4S8hyzWpglMGZN?=
 =?us-ascii?Q?Dsad6ksq+6XgJq3YCT9U/m508EB73qL43Kh/Td9mKSPIQxl+6a4NN+NEI2zc?=
 =?us-ascii?Q?LZTLOwLb5y1mzW7CVr9G+kpYpWS8Tcunm2GQx+FloLwHivtHvBAIU9aHyUPO?=
 =?us-ascii?Q?Bkh4E4L78loLacdlNsKeZQVxoJnEHFDxDe0HlebqDvlSoEyj/v5EayIfBLpP?=
 =?us-ascii?Q?XmLbQdCzUTCWzYlH0yPpXs0PjrmPFWQXDYOCKIKoktauOvXhGz/PdMIs4KHe?=
 =?us-ascii?Q?NwqxnwYBtbf7JPks01mE/jM/oB6uGrfChxlhmchaxsThV9z0/bOZR9knWami?=
 =?us-ascii?Q?HafpWE2cteE/XXtMbqaV266FBSs6JyMdMc+XUjH+OuqPo9DRaRMDL7KndHwu?=
 =?us-ascii?Q?hNnYyZzqm6It5HKPmLkA6zSVTrBO4OSYmiaJOHLrgx67jUxXGUECtmcagnjN?=
 =?us-ascii?Q?yF8bROFaMxo5zAs7s/l5vrkf99RQ98T/1Y25UTek9+j+/G5aFuABYi05LpTH?=
 =?us-ascii?Q?ZRy+Sat6tD5tS6bvG8bh52yTav2JyT3mV0oonvA0uCgarFRsqcdGeKgoZNll?=
 =?us-ascii?Q?UCJTBEIqek0DfErJcJ38umF6SXW/4Frb0pbJoPJxthycuaLrrI7gbcp3ESjT?=
 =?us-ascii?Q?GM+sTODqpzM/Sgl/H0E/mXo0N6JbHIdAYa7ZDJDgIimHmACVWf+baBBXTGMx?=
 =?us-ascii?Q?3PDGi2h4eDpV6ltZbPtH3y2uxI3g4lAT4cJlX9zk9tSR78mC/hRdz3cFB2tm?=
 =?us-ascii?Q?9ZRBsOukMvdfVgzv7b5Lv2uL1T4tFxYDRZO1Q0oFjQ8UEBwaQ6JWX5e3mWzo?=
 =?us-ascii?Q?alGbVOUlMCuRx5QcstBnATcd6w4/cXeGjNZReykwGdFiWBY/3icl0DoEzFwW?=
 =?us-ascii?Q?C+VgH2n1zrD5GmAZKFDBLDLF5bTbM8lh+3Re1cGbzKQxWeMac0wWQ+AlKqsV?=
 =?us-ascii?Q?DF+RuiAHfGrmbfIGiUo/rVqJuDAAhvnElYiJtfIBGFRjbBRynWecLJ7x3KpT?=
 =?us-ascii?Q?Id01M4Jm6zquIPh8UG7izgN8CC9iizzxfSzM7Tewu83T2O31CnDGwzRvJr5k?=
 =?us-ascii?Q?K/vplh0oNWnFIXRb4DlBawGmvm6xXK//NuSxPcJk1M0HoZZWxT5fx55Z3zdH?=
 =?us-ascii?Q?/ARl7q1CExyMc/Fr6d7aM4j9dYBgO4EWa3zNDUDjyI6nuYubngrO7BxWZ7ej?=
 =?us-ascii?Q?XORD+vC9GnbJpQh/jYxNckHgvOsUMz8QxupGsHkuT8wv8D1EYE96NyTQ7GGX?=
 =?us-ascii?Q?D1UYmSK5bmOq2QDhNcbTdpEylzZPb3++BJfVTVbTlmLx5TlpLYtdICdZjWub?=
 =?us-ascii?Q?AhS6BXAA+/5KVbH0JR7orIotaCc9EWthttGZt1F7nCQzfgo7kx/BLc279VlW?=
 =?us-ascii?Q?qgF2PT9LnlTMSvPbdXuYIY9i4Ty5c8uuy7xkyY1lmtVl4R/l+Ukl5nLUqKGh?=
 =?us-ascii?Q?dQ2ntRjUV559VE10j8CsgHtljMWauqw9RlqNibngQzLNxWs7meiNQgpwOZMV?=
 =?us-ascii?Q?/u4XUb05pNPQtkteI2oaDG2BkPvV7Z8XW4u+I+tJt4ufkJ873fZ7GF6R5q7K?=
 =?us-ascii?Q?e5WJZ15GGqs5P8IzlSAnHKbQ0gpEgru4ncV4snjbis8bEJ4dJvs5RVARWvog?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e11c527-2050-4b15-2e07-08db41df8c5c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 20:40:59.5064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DWHssgbwVcmYur7O9e1f2YA2PNmtVyjJ7aI3Z1ds2HWV6SRq5SclrVUwd9cP74/8w32AFh+oZ7u+m4GIqMPXV7twozO4tZIeu4ON6lq0Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5600
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 04:00:53PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> PTE encode functions are platform dependent. This patch implements
> PTE functions for MTL, and ensures the correct PTE encode function
> is used by calling pte_encode function pointer instead of the
> hardcoded gen8 version of PTE encode.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>

Bspec: 45015, 45040

> ---
>  drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 45 ++++++++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 +++++++++++++++++--
>  3 files changed, 72 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
> index b8027392144d..c5eacfdba1a5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>  	vm->vma_ops.bind_vma    = dpt_bind_vma;
>  	vm->vma_ops.unbind_vma  = dpt_unbind_vma;
>  
> -	vm->pte_encode = gen8_ggtt_pte_encode;
> +	vm->pte_encode = vm->gt->ggtt->vm.pte_encode;
>  
>  	dpt->obj = dpt_obj;
>  	dpt->obj->is_dpt = true;
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 4daaa6f55668..11b91e0453c8 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>  	return pte;
>  }
>  
> +static u64 mtl_pte_encode(dma_addr_t addr,
> +			  enum i915_cache_level level,
> +			  u32 flags)
> +{
> +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> +
> +	if (unlikely(flags & PTE_READ_ONLY))
> +		pte &= ~GEN8_PAGE_RW;
> +
> +	if (flags & PTE_LM)
> +		pte |= GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;

GEN12_PPGTT_PTE_NC got defined in the previous patch as BIT(5).  But
according to bspec 45040, bit 5 is ignored in the PTE encoding.  What is
this trying to do?


Matt

> +
> +	switch (level) {
> +	case I915_CACHE_NONE:
> +		pte |= GEN12_PPGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_LLC:
> +	case I915_CACHE_L3_LLC:
> +		pte |= GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_WT:
> +		pte |= GEN12_PPGTT_PTE_PAT0;
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
>  static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
>  {
>  	struct drm_i915_private *i915 = ppgtt->vm.i915;
> @@ -427,7 +455,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>  		      u32 flags)
>  {
>  	struct i915_page_directory *pd;
> -	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
> +	const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, cache_level, flags);
>  	gen8_pte_t *vaddr;
>  
>  	pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
> @@ -580,7 +608,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
>  				   enum i915_cache_level cache_level,
>  				   u32 flags)
>  {
> -	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
> +	const gen8_pte_t pte_encode = vm->pte_encode(0, cache_level, flags);
>  	unsigned int rem = sg_dma_len(iter->sg);
>  	u64 start = vma_res->start;
>  
> @@ -743,7 +771,7 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
>  	GEM_BUG_ON(pt->is_compact);
>  
>  	vaddr = px_vaddr(pt);
> -	vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
> +	vaddr[gen8_pd_index(idx, 0)] = vm->pte_encode(addr, level, flags);
>  	drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
>  }
>  
> @@ -773,7 +801,7 @@ static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
>  	}
>  
>  	vaddr = px_vaddr(pt);
> -	vaddr[gen8_pd_index(idx, 0) / 16] = gen8_pte_encode(addr, level, flags);
> +	vaddr[gen8_pd_index(idx, 0) / 16] = vm->pte_encode(addr, level, flags);
>  }
>  
>  static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
> @@ -820,8 +848,8 @@ static int gen8_init_scratch(struct i915_address_space *vm)
>  		pte_flags |= PTE_LM;
>  
>  	vm->scratch[0]->encode =
> -		gen8_pte_encode(px_dma(vm->scratch[0]),
> -				I915_CACHE_NONE, pte_flags);
> +		vm->pte_encode(px_dma(vm->scratch[0]),
> +			       I915_CACHE_NONE, pte_flags);
>  
>  	for (i = 1; i <= vm->top; i++) {
>  		struct drm_i915_gem_object *obj;
> @@ -963,7 +991,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>  	 */
>  	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
>  
> -	ppgtt->vm.pte_encode = gen8_pte_encode;
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		ppgtt->vm.pte_encode = mtl_pte_encode;
> +	else
> +		ppgtt->vm.pte_encode = gen8_pte_encode;
>  
>  	ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
>  	ppgtt->vm.insert_entries = gen8_ppgtt_insert;
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 3c7f1ed92f5b..20915edc8bd9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -220,6 +220,33 @@ static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>  	}
>  }
>  
> +static u64 mtl_ggtt_pte_encode(dma_addr_t addr,
> +			       enum i915_cache_level level,
> +			       u32 flags)
> +{
> +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT;
> +
> +	WARN_ON_ONCE(addr & ~GEN12_GGTT_PTE_ADDR_MASK);
> +
> +	if (flags & PTE_LM)
> +		pte |= GEN12_GGTT_PTE_LM;
> +
> +	switch (level) {
> +	case I915_CACHE_NONE:
> +		pte |= MTL_GGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_LLC:
> +	case I915_CACHE_L3_LLC:
> +		pte |= MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
> +		break;
> +	case I915_CACHE_WT:
> +		pte |= MTL_GGTT_PTE_PAT0;
> +		break;
> +	}
> +
> +	return pte;
> +}
> +
>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
>  			 enum i915_cache_level level,
>  			 u32 flags)
> @@ -247,7 +274,7 @@ static void gen8_ggtt_insert_page(struct i915_address_space *vm,
>  	gen8_pte_t __iomem *pte =
>  		(gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_SIZE;
>  
> -	gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, flags));
> +	gen8_set_pte(pte, ggtt->vm.pte_encode(addr, level, flags));
>  
>  	ggtt->invalidate(ggtt);
>  }
> @@ -257,8 +284,8 @@ static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
>  				     enum i915_cache_level level,
>  				     u32 flags)
>  {
> -	const gen8_pte_t pte_encode = gen8_ggtt_pte_encode(0, level, flags);
>  	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +	const gen8_pte_t pte_encode = ggtt->vm.pte_encode(0, level, flags);
>  	gen8_pte_t __iomem *gte;
>  	gen8_pte_t __iomem *end;
>  	struct sgt_iter iter;
> @@ -981,7 +1008,10 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  	ggtt->vm.vma_ops.bind_vma    = intel_ggtt_bind_vma;
>  	ggtt->vm.vma_ops.unbind_vma  = intel_ggtt_unbind_vma;
>  
> -	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		ggtt->vm.pte_encode = mtl_ggtt_pte_encode;
> +	else
> +		ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>  
>  	return ggtt_probe_common(ggtt, size);
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
