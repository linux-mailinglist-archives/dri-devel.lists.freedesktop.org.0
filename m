Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFCA6E9DB6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 23:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC8B10E302;
	Thu, 20 Apr 2023 21:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88A910E220;
 Thu, 20 Apr 2023 21:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682025268; x=1713561268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=exg/gD9szwldtX4qvKceH4YiVploDSmSNcRgIIaGtBQ=;
 b=SmKkR2yeL4ICOgfMNKowehkgGIbMoM49eTAfzpq2iXhuOeREheMcLuQL
 cMaqZZ1W2Ie8piUOHaenMVFUasj3biV+D+p0vg44JLBKPLjefK/s3otmq
 wDwduIbiT47UkWq+FnPyI+7GoXWrAUSDCeRfcU5joufz8k19CI/C0AG2/
 xL8Vxlo5EnKcqZHe1uAYwGJ+1i3W8Bd+HLyu9tt5VQIpOWEfEU2L6S82Y
 biEyixiwML/UtA44EQ87UVpR1VEZ5ELZ3AAQa7aYPj4AD14lTrlKRN96y
 8bzI0dU7/AEfepLFChOZ+aLg8qJ/9BKi0si4ZHNX/PWKRwIPlv0pzMGjp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344607456"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="344607456"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 14:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="642281578"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="642281578"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 20 Apr 2023 14:14:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 14:14:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 14:14:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 14:14:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 14:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9hjGjLPhh8R9TwBajllMbZqpSHzz+pmtCCzaXt+vyLu45U1Yu6q7Ds0Rw5jeFiPGf5lLRYwfOjcFQySyz13cQmTrBhKUm01lb3MN/4o7+r4Uw7rJz8/uXxT0uxgaBO0xpSVLWs+EH9sNaAKsLxxK7thNgRML3s00AscaSGrgITGIWHY7uBsDnBSPJuXXZ+xq6Wz5lQ7dQ1C70xPZxn+lSsfrdExYsM53eGKc0GGt8dJi93DBC35shz1VeklXSA5Xi3htULeJyvXlCUvkClLBcYHXCLYqJfSQkDsU3R18wlU0I29DpKOvn8KMAKZ2GSWErnjTVQQ2qlNgsI10KZ9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oYGryVhdS+TUs/g87FXXhx25KUz0Tg91hrxky9wpfY=;
 b=d1B+kEw217+8C7ZGX0OUKAcW1w/+uoIKZnQhKDKdEn2Se0vaxXjGjN2G9k6G+g4jbaUVjgztKqdUBhiTY8b+LO6UaWuolYz/12fvYk8npVUwjkuZOGucdyi+QqgTS6fJkp145Uf/KX/ZWQriG8S97Vz299Rwi4S7LwwqCHZsMiDLuegltBTb/cHkqF8ocSpyMaU6JEL2K0zw1gzLJ3+2So2csZV5S1X1ym+UDsKiYF64B+NYYB+fcPvxwg/whH4fAEoYd3j9h+C8rQ2/sV5WdFXdUrGyxW8EkOqJMpUT/9kah5LliUrWGVbNy2ZwZI+iQ12OvvKXAM1cdbbJjY52DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 21:14:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 20 Apr 2023
 21:14:23 +0000
Date: Thu, 20 Apr 2023 14:14:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/8] drm/i915: preparation for using PAT index
Message-ID: <20230420211420.GC4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-7-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419230058.2659455-7-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 921c1745-def7-46ba-0a42-08db41e436b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vkvpoN5GpeSY61bt6G4A35VLBRCuGPEYNw4GSmGiwBNRhpZuEX8tuESAKVhHygox2NkwCoHYCAasz/1fzdA5vLVeKZlMKTh37Dv58RjMMzgR0a24nmqTQAjJ8M5o9J02G11txhcqMi8fhKishdzemPekjGmEwC4ALImykHzWtn1NbgkzvRWslfun7ip3JERKoRSUUmW5TaZ+m6BW0N/QXhLUESg+8BmLDhbAbHv3Jr5daRQqOZksEGVYlbq+u3e3enfHnEmp6P5jNxscxbHt49yTn+GyLvA3Z0QKrcQ2qsUy3Tm4iUJc+Snu2Xdorpfoq9MFMko+MdG/41ttlVORVlc4uBbowW3xNC54xVM+vavR+FBYJXWXTry4b0+FoY/tjAvUjYgCxYxcoBD9OFtJaUHW5QL+WYfFq2jwRpGpR7nV0gViG7Gu8C0HodCtvgBlYmYCAkF0iNM5OKajA4z0s68kMKQl8BS/Kc2Uf/ye/dkRsTQPin0ynr7xxzBqT5vbn/YXCf5YZpils99WEodCK6nXqdyeCuJnRHb/75hrqEIzw1fc0ErrrqKRrLmaTj2G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199021)(66899021)(6636002)(66946007)(66556008)(66476007)(4326008)(478600001)(38100700002)(33656002)(83380400001)(186003)(2906002)(41300700001)(6486002)(6506007)(1076003)(26005)(30864003)(8676002)(82960400001)(8936002)(86362001)(34206002)(5660300002)(316002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxJVcde/+sS4L2vdLqBRahklVzxpRkuvO2l+AkEQbLF68g5ne4tS/3QzQM7j?=
 =?us-ascii?Q?LizEbqRzoeRRSZ3Uk67CAGoYYYD9+g0MAvZpQ7PXdM/DFFtW5/oCUvG432yE?=
 =?us-ascii?Q?DWqtqjw890uPuCw9rV6NUcfRL4PmrbY7Ibrdr8hZBMJRxN7knnKyBe24Hhds?=
 =?us-ascii?Q?3BqEprqW7zUhUeK0AtGRMET6JGYVpmPeozWNGqy3wBQgwdRgZSvnMCT0Bx4i?=
 =?us-ascii?Q?IhdMk3G1750FtkYsX8fPGk5dwEDx/SiuV2pv1xCrqOeKUfyZs/rsSCvS7k1/?=
 =?us-ascii?Q?GNL0b0W8uSm5Cg3PAjRVtvdywEgMxPCqS1Qi9hgW4CbHA3LJXRMo9Uop+jwm?=
 =?us-ascii?Q?8Sf3dgx0rgq7C4aNFCky9oHEdXtkQ9dFN10WmBo9R5HbYfvHalXk9hudw326?=
 =?us-ascii?Q?EvaUErwGsp8T9Xq94koPe1eX9ITm4jLt+A7FeBYvJjoyj0NX2vnGt1Ba0I3d?=
 =?us-ascii?Q?nVogwVVlOmI55bLaKCD9ORohLklG9Nxeob8dWdnXCHgiwGFGLsoZ+mDZn8WU?=
 =?us-ascii?Q?jFg7YcwkbZK1WXNJB1M/fC/w3hULrUrluZo27TDD3hQaaXGnA41GljCEKisg?=
 =?us-ascii?Q?XFVEUWpysIqPaharqZNC4JH0W5ispM5/vnadA+2Wet+vjMlUofCMZ6yuhUpS?=
 =?us-ascii?Q?7YyW0iuQkk5YePfevxl90JqMZkqU6A64AE3oZQ2jET8+qFmjh5h8UExGJTPh?=
 =?us-ascii?Q?e06hOhnQ6zvQn2SsUYJlMf8m7qVHb6WBn6LD9qT7Pw/A9kWadtR6pGsVt9l5?=
 =?us-ascii?Q?IeH9yjXkGho8Y8dkdCrmJc1tMTKZbDKX67jzPIVJbTfhTvLeRe1VjPkpeAZu?=
 =?us-ascii?Q?zN3QFeJ+/Aa/Mgn2kgOkIyRPtTzex2L9pxLdY8OUspXZw6Takev6CiXHqBBg?=
 =?us-ascii?Q?65Kk5Parj0/J1KDgw97mx4wLmtFQ8zXeHxEnTrAxIPVmvlzHrKvMPm40Zf5S?=
 =?us-ascii?Q?S6jtRkAS/YiD7FDkMmlVn6RqeUh5KasuJBNP4zzRQ2gFXRyERxmjEzzOCLlu?=
 =?us-ascii?Q?gxMghIjbrhsHFebgFA3jUOM9jSYS0fJLry2Zje2AYrrq8BxG6qeWnu88lR5H?=
 =?us-ascii?Q?PoIxMd47Zpvx4y79yMW9u6ogFJH9zyUjdC9Qve6Rg+2VkxL7dc+RRSuVFTM7?=
 =?us-ascii?Q?xi/y6Lk+EDSXHuf6CzxV8rlx0OEQt00HsbFIJ9TovOQhd+4+CXFI+8b3Trfk?=
 =?us-ascii?Q?wEBiOwekI2Srs5ulJqwfE0FKjD95k7Ze0ywuyfjMB46bw8DWamWAAaGbNzE+?=
 =?us-ascii?Q?YWE18TmnD/ljgcizVwZutl95YBGmORf0yt9/ZQE7AAM+kTHWRi9C1GgQ28Vs?=
 =?us-ascii?Q?1+e3wRskSkr8lmWMiSjCrbBGQFd1cHa2FY+NcvzuWob975iAFN3C2ujge+ya?=
 =?us-ascii?Q?wDiQlL58CX7vMVawnScWsI14qHWDYv1yXfxNiHrMaDFYeC9Vgev+5iqbLMzZ?=
 =?us-ascii?Q?7WLxPKxLNZsffsq0R4cYWgO0EK8OgATV/I1m/I9v+997W/qoSkD/9Acsf0uR?=
 =?us-ascii?Q?FnrwH4OaiRDJv0CU4vqFJ/X9lU2YHcBi+NwAvtIaZIn/IzEigQiJmoyFKmKo?=
 =?us-ascii?Q?KM30I+qoD6HVdjGvMwRYqmO+DhiqwUJirHKYsazqwv6B+CYyLyoHbM6F9Q1A?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 921c1745-def7-46ba-0a42-08db41e436b8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 21:14:23.1461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vjj2wIv7IJK22VOIAIEXhBSvpEtCIAtiCIc/yI9ksEZO/0H++oZ8H2TXThz6McxYwDMV70T+PKUuVT1B+6wQu2CAxrxALxuvpADsidcupjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 04:00:56PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> This patch is a preparation for replacing enum i915_cache_level with PAT
> index. Caching policy for buffer objects is set through the PAT index in
> PTE, the old i915_cache_level is not sufficient to represent all caching
> modes supported by the hardware.
> 
> Preparing the transition by adding some platform dependent data structures
> and helper functions to translate the cache_level to pat_index.
> 
> cachelevel_to_pat: a platform dependent array mapping cache_level to
>                    pat_index.
> 
> max_pat_index: the maximum PAT index supported by the hardware. Needed for
>                validating the PAT index passed in from user space.

The description here doesn't quite match how it's being used.  For
platforms like MTL, the hardware supports PAT indices 0-15.  The bspec
only gives us values to program for the first 5 of those entries and we
leave the rest at their hardware default (fully cached).  In the code
below, you're setting max_pat_index to the size of the bspec-defined
table (i.e., max=4 on MTL).  That's fine, but it means the description
here ("maximum...supported by hardware") is inaccurate.


Matt

> 
> i915_gem_get_pat_index: function to convert cache_level to PAT index.
> 
> obj_to_i915(obj): macro moved to header file for wider usage.
> 
> I915_MAX_CACHE_LEVEL: upper bound of i915_cache_level for the
>                       convenience of coding.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  9 +++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  4 +
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  6 ++
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          |  6 ++
>  drivers/gpu/drm/i915/i915_pci.c               | 75 +++++++++++++++++--
>  drivers/gpu/drm/i915/intel_device_info.h      |  5 ++
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++
>  9 files changed, 107 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 4666bb82f312..8c70a0ec7d2f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -45,6 +45,15 @@ static struct kmem_cache *slab_objects;
>  
>  static const struct drm_gem_object_funcs i915_gem_object_funcs;
>  
> +unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
> +				    enum i915_cache_level level)
> +{
> +	if (drm_WARN_ON(&i915->drm, level >= I915_MAX_CACHE_LEVEL))
> +		return 0;
> +
> +	return INTEL_INFO(i915)->cachelevel_to_pat[level];
> +}
> +
>  struct drm_i915_gem_object *i915_gem_object_alloc(void)
>  {
>  	struct drm_i915_gem_object *obj;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 885ccde9dc3c..4c92e17b4337 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -20,6 +20,8 @@
>  
>  enum intel_region_id;
>  
> +#define obj_to_i915(obj__) to_i915((obj__)->base.dev)
> +
>  static inline bool i915_gem_object_size_2big(u64 size)
>  {
>  	struct drm_i915_gem_object *obj;
> @@ -30,6 +32,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>  	return false;
>  }
>  
> +unsigned int i915_gem_get_pat_index(struct drm_i915_private *i915,
> +				    enum i915_cache_level level);
>  void i915_gem_init__objects(struct drm_i915_private *i915);
>  
>  void i915_objects_module_exit(void);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 830c11431ee8..41b35abccf88 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -194,6 +194,7 @@ enum i915_cache_level {
>  	 * engine.
>  	 */
>  	I915_CACHE_WT,
> +	I915_MAX_CACHE_LEVEL,
>  };
>  
>  enum i915_map_type {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index b1672e054b21..214763942aa2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -460,8 +460,6 @@ void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
>  	fs_reclaim_release(GFP_KERNEL);
>  }
>  
> -#define obj_to_i915(obj__) to_i915((obj__)->base.dev)
> -
>  /**
>   * i915_gem_object_make_unshrinkable - Hide the object from the shrinker. By
>   * default all object types that support shrinking(see IS_SHRINKABLE), will also
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 11b91e0453c8..7a4b1d1afce9 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -78,6 +78,12 @@ static u64 mtl_pte_encode(dma_addr_t addr,
>  	case I915_CACHE_WT:
>  		pte |= GEN12_PPGTT_PTE_PAT0;
>  		break;
> +	default:
> +		/* This should never happen. Added to deal with the compile
> +		 * error due to the addition of I915_MAX_CACHE_LEVEL. Will
> +		 * be removed by the pat_index patch.
> +		 */
> +		break;
>  	}
>  
>  	return pte;
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 20915edc8bd9..c8390d03fce2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -242,6 +242,12 @@ static u64 mtl_ggtt_pte_encode(dma_addr_t addr,
>  	case I915_CACHE_WT:
>  		pte |= MTL_GGTT_PTE_PAT0;
>  		break;
> +	default:
> +		/* This should never happen. Added to deal with the compile
> +		 * error due to the addition of I915_MAX_CACHE_LEVEL. Will
> +		 * be removed by the pat_index patch.
> +		 */
> +		break;
>  	}
>  
>  	return pte;
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 272a8ba37b64..4ca0ea8fce9b 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -30,6 +30,7 @@
>  #include "display/intel_display_driver.h"
>  #include "gt/intel_gt_regs.h"
>  #include "gt/intel_sa_media.h"
> +#include "gem/i915_gem_object_types.h"
>  
>  #include "i915_driver.h"
>  #include "i915_drv.h"
> @@ -164,6 +165,38 @@
>  		.gamma_lut_tests = DRM_COLOR_LUT_NON_DECREASING, \
>  	}
>  
> +#define LEGACY_CACHELEVEL \
> +	.cachelevel_to_pat = { \
> +		[I915_CACHE_NONE]   = 0, \
> +		[I915_CACHE_LLC]    = 1, \
> +		[I915_CACHE_L3_LLC] = 2, \
> +		[I915_CACHE_WT]     = 3, \
> +	}
> +
> +#define TGL_CACHELEVEL \
> +	.cachelevel_to_pat = { \
> +		[I915_CACHE_NONE]   = 3, \
> +		[I915_CACHE_LLC]    = 0, \
> +		[I915_CACHE_L3_LLC] = 0, \
> +		[I915_CACHE_WT]     = 2, \
> +	}
> +
> +#define PVC_CACHELEVEL \
> +	.cachelevel_to_pat = { \
> +		[I915_CACHE_NONE]   = 0, \
> +		[I915_CACHE_LLC]    = 3, \
> +		[I915_CACHE_L3_LLC] = 3, \
> +		[I915_CACHE_WT]     = 2, \
> +	}
> +
> +#define MTL_CACHELEVEL \
> +	.cachelevel_to_pat = { \
> +		[I915_CACHE_NONE]   = 2, \
> +		[I915_CACHE_LLC]    = 3, \
> +		[I915_CACHE_L3_LLC] = 3, \
> +		[I915_CACHE_WT]     = 1, \
> +	}
> +
>  /* Keep in gen based order, and chronological order within a gen */
>  
>  #define GEN_DEFAULT_PAGE_SIZES \
> @@ -189,11 +222,13 @@
>  	.has_snoop = true, \
>  	.has_coherent_ggtt = false, \
>  	.dma_mask_size = 32, \
> +	.max_pat_index = 3, \
>  	I9XX_PIPE_OFFSETS, \
>  	I9XX_CURSOR_OFFSETS, \
>  	I9XX_COLORS, \
>  	GEN_DEFAULT_PAGE_SIZES, \
> -	GEN_DEFAULT_REGIONS
> +	GEN_DEFAULT_REGIONS, \
> +	LEGACY_CACHELEVEL
>  
>  #define I845_FEATURES \
>  	GEN(2), \
> @@ -210,11 +245,13 @@
>  	.has_snoop = true, \
>  	.has_coherent_ggtt = false, \
>  	.dma_mask_size = 32, \
> +	.max_pat_index = 3, \
>  	I845_PIPE_OFFSETS, \
>  	I845_CURSOR_OFFSETS, \
>  	I845_COLORS, \
>  	GEN_DEFAULT_PAGE_SIZES, \
> -	GEN_DEFAULT_REGIONS
> +	GEN_DEFAULT_REGIONS, \
> +	LEGACY_CACHELEVEL
>  
>  static const struct intel_device_info i830_info = {
>  	I830_FEATURES,
> @@ -249,11 +286,13 @@ static const struct intel_device_info i865g_info = {
>  	.has_snoop = true, \
>  	.has_coherent_ggtt = true, \
>  	.dma_mask_size = 32, \
> +	.max_pat_index = 3, \
>  	I9XX_PIPE_OFFSETS, \
>  	I9XX_CURSOR_OFFSETS, \
>  	I9XX_COLORS, \
>  	GEN_DEFAULT_PAGE_SIZES, \
> -	GEN_DEFAULT_REGIONS
> +	GEN_DEFAULT_REGIONS, \
> +	LEGACY_CACHELEVEL
>  
>  static const struct intel_device_info i915g_info = {
>  	GEN3_FEATURES,
> @@ -341,11 +380,13 @@ static const struct intel_device_info pnv_m_info = {
>  	.has_snoop = true, \
>  	.has_coherent_ggtt = true, \
>  	.dma_mask_size = 36, \
> +	.max_pat_index = 3, \
>  	I9XX_PIPE_OFFSETS, \
>  	I9XX_CURSOR_OFFSETS, \
>  	I9XX_COLORS, \
>  	GEN_DEFAULT_PAGE_SIZES, \
> -	GEN_DEFAULT_REGIONS
> +	GEN_DEFAULT_REGIONS, \
> +	LEGACY_CACHELEVEL
>  
>  static const struct intel_device_info i965g_info = {
>  	GEN4_FEATURES,
> @@ -395,11 +436,13 @@ static const struct intel_device_info gm45_info = {
>  	/* ilk does support rc6, but we do not implement [power] contexts */ \
>  	.has_rc6 = 0, \
>  	.dma_mask_size = 36, \
> +	.max_pat_index = 3, \
>  	I9XX_PIPE_OFFSETS, \
>  	I9XX_CURSOR_OFFSETS, \
>  	ILK_COLORS, \
>  	GEN_DEFAULT_PAGE_SIZES, \
> -	GEN_DEFAULT_REGIONS
> +	GEN_DEFAULT_REGIONS, \
> +	LEGACY_CACHELEVEL
>  
>  static const struct intel_device_info ilk_d_info = {
>  	GEN5_FEATURES,
> @@ -429,13 +472,15 @@ static const struct intel_device_info ilk_m_info = {
>  	.has_rc6p = 0, \
>  	.has_rps = true, \
>  	.dma_mask_size = 40, \
> +	.max_pat_index = 3, \
>  	.__runtime.ppgtt_type = INTEL_PPGTT_ALIASING, \
>  	.__runtime.ppgtt_size = 31, \
>  	I9XX_PIPE_OFFSETS, \
>  	I9XX_CURSOR_OFFSETS, \
>  	ILK_COLORS, \
>  	GEN_DEFAULT_PAGE_SIZES, \
> -	GEN_DEFAULT_REGIONS
> +	GEN_DEFAULT_REGIONS, \
> +	LEGACY_CACHELEVEL
>  
>  #define SNB_D_PLATFORM \
>  	GEN6_FEATURES, \
> @@ -482,13 +527,15 @@ static const struct intel_device_info snb_m_gt2_info = {
>  	.has_reset_engine = true, \
>  	.has_rps = true, \
>  	.dma_mask_size = 40, \
> +	.max_pat_index = 3, \
>  	.__runtime.ppgtt_type = INTEL_PPGTT_ALIASING, \
>  	.__runtime.ppgtt_size = 31, \
>  	IVB_PIPE_OFFSETS, \
>  	IVB_CURSOR_OFFSETS, \
>  	IVB_COLORS, \
>  	GEN_DEFAULT_PAGE_SIZES, \
> -	GEN_DEFAULT_REGIONS
> +	GEN_DEFAULT_REGIONS, \
> +	LEGACY_CACHELEVEL
>  
>  #define IVB_D_PLATFORM \
>  	GEN7_FEATURES, \
> @@ -542,6 +589,7 @@ static const struct intel_device_info vlv_info = {
>  	.display.has_gmch = 1,
>  	.display.has_hotplug = 1,
>  	.dma_mask_size = 40,
> +	.max_pat_index = 3,
>  	.__runtime.ppgtt_type = INTEL_PPGTT_ALIASING,
>  	.__runtime.ppgtt_size = 31,
>  	.has_snoop = true,
> @@ -553,6 +601,7 @@ static const struct intel_device_info vlv_info = {
>  	I9XX_COLORS,
>  	GEN_DEFAULT_PAGE_SIZES,
>  	GEN_DEFAULT_REGIONS,
> +	LEGACY_CACHELEVEL,
>  };
>  
>  #define G75_FEATURES  \
> @@ -640,6 +689,7 @@ static const struct intel_device_info chv_info = {
>  	.has_logical_ring_contexts = 1,
>  	.display.has_gmch = 1,
>  	.dma_mask_size = 39,
> +	.max_pat_index = 3,
>  	.__runtime.ppgtt_type = INTEL_PPGTT_FULL,
>  	.__runtime.ppgtt_size = 32,
>  	.has_reset_engine = 1,
> @@ -651,6 +701,7 @@ static const struct intel_device_info chv_info = {
>  	CHV_COLORS,
>  	GEN_DEFAULT_PAGE_SIZES,
>  	GEN_DEFAULT_REGIONS,
> +	LEGACY_CACHELEVEL,
>  };
>  
>  #define GEN9_DEFAULT_PAGE_SIZES \
> @@ -890,9 +941,11 @@ static const struct intel_device_info jsl_info = {
>  		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
>  	}, \
>  	TGL_CURSOR_OFFSETS, \
> +	TGL_CACHELEVEL, \
>  	.has_global_mocs = 1, \
>  	.has_pxp = 1, \
> -	.display.has_dsb = 1
> +	.display.has_dsb = 1, \
> +	.max_pat_index = 3
>  
>  static const struct intel_device_info tgl_info = {
>  	GEN12_FEATURES,
> @@ -1014,6 +1067,7 @@ static const struct intel_device_info adl_p_info = {
>  	.__runtime.graphics.ip.ver = 12, \
>  	.__runtime.graphics.ip.rel = 50, \
>  	XE_HP_PAGE_SIZES, \
> +	TGL_CACHELEVEL, \
>  	.dma_mask_size = 46, \
>  	.has_3d_pipeline = 1, \
>  	.has_64bit_reloc = 1, \
> @@ -1032,6 +1086,7 @@ static const struct intel_device_info adl_p_info = {
>  	.has_reset_engine = 1, \
>  	.has_rps = 1, \
>  	.has_runtime_pm = 1, \
> +	.max_pat_index = 3, \
>  	.__runtime.ppgtt_size = 48, \
>  	.__runtime.ppgtt_type = INTEL_PPGTT_FULL
>  
> @@ -1108,11 +1163,13 @@ static const struct intel_device_info pvc_info = {
>  	PLATFORM(INTEL_PONTEVECCHIO),
>  	NO_DISPLAY,
>  	.has_flat_ccs = 0,
> +	.max_pat_index = 7,
>  	.__runtime.platform_engine_mask =
>  		BIT(BCS0) |
>  		BIT(VCS0) |
>  		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
>  	.require_force_probe = 1,
> +	PVC_CACHELEVEL,
>  };
>  
>  #define XE_LPDP_FEATURES	\
> @@ -1150,9 +1207,11 @@ static const struct intel_device_info mtl_info = {
>  	.has_llc = 0,
>  	.has_mslice_steering = 0,
>  	.has_snoop = 1,
> +	.max_pat_index = 4,
>  	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>  	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
>  	.require_force_probe = 1,
> +	MTL_CACHELEVEL,
>  };
>  
>  #undef PLATFORM
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index f032f2500f50..959a4080840c 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -35,6 +35,8 @@
>  #include "gt/intel_context_types.h"
>  #include "gt/intel_sseu.h"
>  
> +#include "gem/i915_gem_object_types.h"
> +
>  struct drm_printer;
>  struct drm_i915_private;
>  struct intel_gt_definition;
> @@ -308,6 +310,9 @@ struct intel_device_info {
>  	 * Initial runtime info. Do not access outside of i915_driver_create().
>  	 */
>  	const struct intel_runtime_info __runtime;
> +
> +	u32 cachelevel_to_pat[I915_MAX_CACHE_LEVEL];
> +	u32 max_pat_index;
>  };
>  
>  struct intel_driver_caps {
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index f6a7c0bd2955..0eda8b4ee17f 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -123,7 +123,9 @@ struct drm_i915_private *mock_gem_device(void)
>  	static struct dev_iommu fake_iommu = { .priv = (void *)-1 };
>  #endif
>  	struct drm_i915_private *i915;
> +	struct intel_device_info *i915_info;
>  	struct pci_dev *pdev;
> +	unsigned int i;
>  	int ret;
>  
>  	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
> @@ -180,6 +182,13 @@ struct drm_i915_private *mock_gem_device(void)
>  		I915_GTT_PAGE_SIZE_2M;
>  
>  	RUNTIME_INFO(i915)->memory_regions = REGION_SMEM;
> +
> +	/* simply use legacy cache level for mock device */
> +	i915_info = (struct intel_device_info *)INTEL_INFO(i915);
> +	i915_info->max_pat_index = 3;
> +	for (i = 0; i < I915_MAX_CACHE_LEVEL; i++)
> +		i915_info->cachelevel_to_pat[i] = i;
> +
>  	intel_memory_regions_hw_probe(i915);
>  
>  	spin_lock_init(&i915->gpu_error.lock);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
