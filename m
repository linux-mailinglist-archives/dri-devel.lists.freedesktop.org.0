Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401E6E9D74
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 22:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923C10E295;
	Thu, 20 Apr 2023 20:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8D810E21E;
 Thu, 20 Apr 2023 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682023966; x=1713559966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1+F2lMaFXwJi1BQ3nkm6lPrSpvXGH9eswzpea1koQXU=;
 b=Lto6l86wG6R0mWD5HUTrdXXBPyWuTbHps3fVkhN0sUXwzWVeWSUHgOJ2
 sb8dTe20sB336WKu9e9Q1QmccfzvWEeCrDoYcwd20WwwAUgc6eGarJLBm
 6RxsTanGn4x3v9VZaWvvXTtzlT3IMf+A0ct/QPPCw81qSonq0IdTOlNPY
 taOlczKx43P91UYMP/XYO2nthlB9cqKzOuu7P4bYI7mCnHiV4AdcDHDSr
 NCg1HmkJsXGvIPZ1RCXlSCaWLdb50LmtvnUxT8gP1CcHkKJFSC0WieFi2
 6iN4dF5rz7rcfOBG40tb1Ok58rytZ6z1KIk07zVc+GdN/8cmlndy+87Oy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411109659"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="411109659"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 13:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685511883"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="685511883"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 13:52:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 13:52:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 13:52:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 13:52:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 13:52:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0lyDn2tmHQbKTMXDIok3ya9Dc1oJgUkq9BJocHdKneLTwPzBC7eUACIEph1JpxDTW/WBIVQfRot4F3jInCXfWuAZjkZXEV6CDeKjelhTxxL3GIRvBolHKibANDwaDXNPTIpFD8IMLeNe+i5QAK4KZOLuvtOR+Cfgb/YxvTWkFfg3eTCuBJFMUHcWUZvl8rF9J7M7BeVPtZgniRvJ1LPuoI0xUgYZLkCy6QKrvvJKxEaDMt2ui9tNSvrsTDNbs6BOs7tCcxRwQK2YiAN4y6nS1D826TAgNuL6M/fe1zgb0QzSjb89WAmWh8m2gZL/WyO697WFEZ76nBRf7Qxo9pbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPq9Zc8Rx3jKOXvODN9VZRT8T40MhPulAlC/MfwjhO0=;
 b=axYjbx8P3vpwaZYdm2g3DqTyBlJsh38ZlyiMoQ+HwfEmzj65rDRDv+GktUbVZbdSP7R9sesRuX0DcVAAjuG7Bdfi7CONyCMoR3aTUBhsRTJr1Vn8cNwIs7ia1Vc8w/LZp88f6w5VUxmGmPKgqu2+tCTkuqIM74STQcuqDfZ7gSNX2q6xyDFtzS1Ip9L2N4pljVpcf5iBX9CAgyEG4eG/MmHOl1PznXYGFJWdJKgdD2d4NH7exY3pugLtsQ59su6am6bvWkYXoYlWvS1cm+47EctMt388vALQ4t6IwHgyN9kvBh7jlObtNF7AnQnBPVxJBHhD5BIaDk8EB31dj+Lvpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 20:52:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 20 Apr 2023
 20:52:42 +0000
Date: Thu, 20 Apr 2023 13:52:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Message-ID: <20230420205238.GA4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-5-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419230058.2659455-5-fei.yang@intel.com>
X-ClientProxiedBy: BY5PR16CA0010.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e810e5-e842-4b66-0d00-08db41e12ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O2E7I2ssIWmgMNpGeFZTlhPj2B+sjyWG5baWXnFp9m68DrS1PIN3RkgXPq9xZaudv2dqxhXU3eLlQlrdYFL6PFeah1vfW9UXptxxwWPJ/utVqiRTsbysUJFg6/bHQoMJG6Mvi2jzHhI/E3CwHdVvNhfaJFiuUWojKMFGfAs7M2+RfA4rOchEUAKwstrwk4jUllPB6YMY7hE0wLtVmj0JynO33c/sEwX2006+cWnLtdDMyMiitlCkTdL/LZaQlWUc0t6xORpUeIIkMxxmOo/mWW8QJ4KA/6k1+ddrLOl0squdW3QbRwvsFFfOxAceJBKpu8olFjLrEoDcnpRead61CvdEofC8Ukcz/PHD0UvGQnuM1M5RfbgaQuLNOTaZwCWpwVvHn6ZaqsqVR/opWBzHedFH2rsCZHNcA/gnyWkgUwELV9Lv3NIjWkoqmfzzX64LJLPObVDQL9mcJOt3n2b3W5/jiz1MAOzLjhmB1Is6t355DIwqdUL6DbamZYZr2zbDiU+oZJJn4vHQVYHwA8zCFcHJpv6sRN4HaQzQWeUwNSrzo5v5p/bil0dM1+fr0i+V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(82960400001)(38100700002)(186003)(8676002)(2906002)(6512007)(6506007)(26005)(5660300002)(1076003)(83380400001)(478600001)(33656002)(6636002)(6486002)(86362001)(6666004)(41300700001)(34206002)(8936002)(450100002)(4326008)(316002)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BsNWuG2sfqgjM3IjiXPxpSFJgA5cWT22tl9eAuvhD7nBpuprijDwdEsZgN6V?=
 =?us-ascii?Q?wzVB5evfGjnF1DKOFI1X8jqDXhHCoWoWJSWgPWob78GtRHer988qi0pAAOJ0?=
 =?us-ascii?Q?S7fWbjv5VbbmbiTC2hHh5AV4QMOk3pwuwRdU10YpuIH2WWQ55ZL/eBNja+JS?=
 =?us-ascii?Q?iE8z+MpAAu5RvsvULoOYb8en6smx8Wc9oAG1qhEwymBg9PyfAjbtSZ58mY7L?=
 =?us-ascii?Q?SW6JV079GDrrGbCpPHHw5KCY5uAGEkpqcZ5KPg/EPOwGUxFT3WicEFs7ApX7?=
 =?us-ascii?Q?D1kD4Xlc351J++JkLlSx9DpWPkqAjs/H97hBg55m4gUeafWWIzsitBjCNPDV?=
 =?us-ascii?Q?Izh9eOOw8pxH4s35Hnp8oP6wtRS75+R6//7iYaH5u7AvxM4wcQ8H5zJxVD3K?=
 =?us-ascii?Q?jxMeyQ7NodV7U27hS4lXCvBG0fZWHwKg7Oo7ryDxV4m+/vi1S51ovCMknE+1?=
 =?us-ascii?Q?oudAYvkk9ube2whcKLkFGDtJvX69Z7KqJYr2GWwAms7DbvGEU5xfoDemuvGT?=
 =?us-ascii?Q?hggc1HFGdqT7+JrM6roMVepzL3jmiuXjlgfYkV9o5f2PZs9RPz2+Hau07ViV?=
 =?us-ascii?Q?WSiZGBPxl15N8W1dqNOWDORQEDdyEji5xeVhQrWThugF/GtQ/fG6O8CG7jU7?=
 =?us-ascii?Q?TXXyS9M1fDHqxwD1cFOpx21BQ4qwT3f2ee2LzdFefV0CgZnOlnscFImqjWzY?=
 =?us-ascii?Q?rgIGBjJpjHCFVM4X5BlgmYExNwOO++lfkIe9dplx3qOtaSsXiTNtQma/VZCz?=
 =?us-ascii?Q?PkfEt13vVLYUV4QAHHEyZYtXscuDjf6So5qObeEEwj1y7WogURrpwc2ia0J6?=
 =?us-ascii?Q?dW3QZIwb9X8XMrwoAhpUxol/9tvql5pG3TvoiIirpNoLwY/bcSCk7BMoxJ9u?=
 =?us-ascii?Q?RS2VKwb+uoIM90GkoAflkRfU5I1cGbWwaAx+idU2u5E9V5Z4Tk81xMUq0IS+?=
 =?us-ascii?Q?+ATpX5h1/VD+8GRZkbl71fUQWK04e9gYmWHV8GuRgYUn7w0e02tpJ5nv/TBY?=
 =?us-ascii?Q?vB6mJ+g6QvqLycM1YF/koPIOJiC256S8+LSKlMgn6DP7PNKQVfxmCST1x7qH?=
 =?us-ascii?Q?jJnOGQAY/7QSVg+ppqH2hK5hvly/KGecyPf2T4jAemMtsbbNk+RJhu5N8xMq?=
 =?us-ascii?Q?a8Yc9mTNtz8sDsBgollTz20p0C9562uNHJS2n1ijBZxgeNrBOocgMe97bqHr?=
 =?us-ascii?Q?9yH90vgoFmXXd5fTfEaHzIrKr6Lqm8tnTyvvPUm6JtUEx0ZkYi4mgtGUq9jS?=
 =?us-ascii?Q?iJYybj9ycBS19yvZD3RNywtxxa7GvTn/Cu3gffKvjWXgXaUfOvr+QWggSyJo?=
 =?us-ascii?Q?Piaj435Tm7YVEIA7Da6ePkj7avGARRvlwFwcx9WGWyGsXVNqyAPChWVEmPG2?=
 =?us-ascii?Q?9CTdkgYx8ZJj57ehlsYiXXBxMMaCCVzHnMNUDTUkRWxUFo213CnWBSdbPKEU?=
 =?us-ascii?Q?hxgqhBIHtGb4o+tK4Uatk6XXsBxKcyys+2+WUqF+zfgZIbnYiiUZ/n0pvJAX?=
 =?us-ascii?Q?5UxE0X1A68AmvUf3zNV7fGKa02pQ6mtHnHwAww+ulxAqQwu3ZdYinwtpYB+x?=
 =?us-ascii?Q?VKmWhP3YOEY4oOCwslvY7Y+27YxURfr//kPCBmSq9xERqLdine41zyxPNrlk?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e810e5-e842-4b66-0d00-08db41e12ebe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 20:52:41.3931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iR1beCTsRcD1OkH4HMjXNcvx9gNPCBYEZxXUgS8WonlzWDOPxZnWHGEaxVzFaA8HSvmODvYnSUhDgyYXWmwwgCy3xYfCaU1RBeQKqp/58oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
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
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 04:00:54PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> This patch implements Wa_22016122933.
> 
> In MTL, memory writes initiated by Media tile update the whole
> cache line even for partial writes. This creates a coherency
> problem for cacheable memory if both CPU and GPU are writing data
> to different locations within a single cache line. CTB communication
> is impacted by this issue because the head and tail pointers are
> adjacent words within a cache line (see struct guc_ct_buffer_desc),
> where one is written by GuC and the other by the host.
> This patch circumvents the issue by making CPU/GPU shared memory
> uncacheable (WC on CPU side, and PAT index 2 for GPU). Also for
> CTB which is being updated by both CPU and GuC, mfence instruction
> is added to make sure the CPU writes are visible to GPU right away
> (flush the write combining buffer).

Is this description accurate?  This patch doesn't insert an mfence
instruction itself, it just calls intel_guc_write_barrier().  On
platforms like MTL that aren't using local memory, that issues a wmb()
barrier, which I believe is implemented as an sfence, not mfence.  You'd
need to be doing a mb() call to get an mfence.

I think in general this level of explanation is unnecessary; you can
just give a high-level description indicating that we force the
write-combine buffer to be flushed and not give the low-level specifics
of what instruction that translates to at the x86 level.

Aside from simplifying the commit message,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> While fixing the CTB issue, we noticed some random GSC firmware
> loading failure because the share buffers are cacheable (WB) on CPU
> side but uncached on GPU side. To fix these issues we need to map
> such shared buffers as WC on CPU side. Since such allocations are
> not all done through GuC allocator, to avoid too many code changes,
> the i915_coherent_map_type() is now hard coded to return WC for MTL.
> 
> BSpec: 45101
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++++-
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 +++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 ++++++
>  4 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index ecd86130b74f..89fc8ea6bcfc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -469,7 +469,10 @@ enum i915_map_type i915_coherent_map_type(struct drm_i915_private *i915,
>  					  struct drm_i915_gem_object *obj,
>  					  bool always_coherent)
>  {
> -	if (i915_gem_object_is_lmem(obj))
> +	/*
> +	 * Wa_22016122933: always return I915_MAP_WC for MTL
> +	 */
> +	if (i915_gem_object_is_lmem(obj) || IS_METEORLAKE(i915))
>  		return I915_MAP_WC;
>  	if (HAS_LLC(i915) || always_coherent)
>  		return I915_MAP_WB;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 1d9fdfb11268..236673c02f9a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -110,6 +110,13 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>  	if (obj->base.size < gsc->fw.size)
>  		return -ENOSPC;
>  
> +	/*
> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
> +	 * as WC on CPU side and UC (PAT index 2) on GPU side
> +	 */
> +	if (IS_METEORLAKE(i915))
> +		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
>  	dst = i915_gem_object_pin_map_unlocked(obj,
>  					       i915_coherent_map_type(i915, obj, true));
>  	if (IS_ERR(dst))
> @@ -125,6 +132,12 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>  	memset(dst, 0, obj->base.size);
>  	memcpy(dst, src, gsc->fw.size);
>  
> +	/*
> +	 * Wa_22016122933: Making sure the data in dst is
> +	 * visible to GSC right away
> +	 */
> +	intel_guc_write_barrier(&gt->uc.guc);
> +
>  	i915_gem_object_unpin_map(gsc->fw.obj);
>  	i915_gem_object_unpin_map(obj);
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index e89f16ecf1ae..c9f20385f6a0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -744,6 +744,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
>  	if (IS_ERR(obj))
>  		return ERR_CAST(obj);
>  
> +	/*
> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
> +	 * as WC on CPU side and UC (PAT index 2) on GPU side
> +	 */
> +	if (IS_METEORLAKE(gt->i915))
> +		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
>  	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>  	if (IS_ERR(vma))
>  		goto err;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 1803a633ed64..99a0a89091e7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -902,6 +902,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	/* now update descriptor */
>  	WRITE_ONCE(desc->head, head);
>  
> +	/*
> +	 * Wa_22016122933: Making sure the head update is
> +	 * visible to GuC right away
> +	 */
> +	intel_guc_write_barrier(ct_to_guc(ct));
> +
>  	return available - len;
>  
>  corrupted:
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
