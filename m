Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562956E9DA3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 23:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A906710E065;
	Thu, 20 Apr 2023 21:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36A10E065;
 Thu, 20 Apr 2023 21:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682024735; x=1713560735;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=edREO4D34Qkhlts7iwhDynQUHXN6ZCKxnYktA6FLZWw=;
 b=DpIdHKDj5GSXQby7jlON2Q+5TwuHkB6XNIDUCxeW93LiRRGN6tzQqmTp
 Toq0lVZVfv/uH5rCx27Sy6dFMq9rouMRewoBxB0w2t3sbXcBNpN+V27h9
 eCS6Er8feUSwEuivIBI6hUaMV+3BWqNiPVZafKtxeYjTl7KypDV7+c5/F
 xgnWcA8e0GpNS1sJvmHYWi5jDt/c23Adcja337tSm7zXtQo2vCHuUaDca
 4Yoc2ShhKdRh9z/BBM1jxwPbR/GzQitx7PG8xG6T5ikE6ega1BudJHR7m
 wGY7mp4eH3oYs13eVy6a1eXRNYkfwowcLXXUthx84n4gPREBoF3rUUahX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="330048133"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="330048133"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 14:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692056711"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="692056711"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 14:05:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 14:05:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 14:05:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 14:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YifNZUSY7OtRefTduWWSCIy3eK6ZDD9j6c+CIt3SJ3vhyupgTFzl2JleGNENTlzJR0hgfA2ScWetpwnBsELI0xAj4DbannPdCazRDmygOzuwB8K/Aci5cRK9YrBt7SN5H20TVdT84agVLniJN9msr2I/xo6k/QBqirU19pE3z9APVKr9eSTajPUYg3dVeTOtEREXrTnxW83N6gKENgFP/z9g4CiBV0GtpmN2FPGlx9HSZdBttShJWHkPfaTLwsddXqq1z61x10Nfs4XydeClQ3Wiof5YPsFVeRwsllpH36Zujssu1W1QjhoOPMv3nuOIGaECYu7IWMiar8ALE2c/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCQHY7wLxn+CQwmr23t9a+pIgNO7RsYNQvp7cgNTzNw=;
 b=FctYxXh4Zd9F9iTG0BASeICIsesBU+NULKDNqdWTBaD8C2iYMNhLrCnRr/2R690ly1s+3XOq+8L95B5WaX+4m+dvzjLhX6tpepDsDpAghZ8TQEbb3bwSbPTw46C9gz7s+NT8+eeijfDjweD75CSXH3o4LI1CfvlR1ISr2Rdlm281gn0XR41xInugZtfe4ikKBTD4bLn/5gMvpsIJoLGvfeaTCkq1j5e3vwTW+Y+wzplISAHXgocJY1PdmrInCv2fFATiK9S1FCePAtwt6z1lOkK8BlyihlLY4IFkO3ni5MvlaRfxe2kqZdpjmKQYtcbIlnQi7kpMCJ4lWWvZLqWcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 21:05:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 20 Apr 2023
 21:05:31 +0000
Date: Thu, 20 Apr 2023 14:05:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/mtl: end support for set
 caching ioctl
Message-ID: <20230420210528.GB4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-6-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419230058.2659455-6-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebe01b3-e59d-4772-5b60-08db41e2f9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a3xIWCGklOCGc/W3v9aDEyMFgvcwwSMwb9Gh8gD1DrXuUsU7LHLyU1Lh0Gx5lC7tPP2bZ37xcSkn/iwmXUfFykvUyFh7lquEarqfK69pBsKpIa1yubEZiBf8upVx1FutYqlGIdihiJu35Go2CyMErXB9Eo8QCOGfWbfSs1qUFzq2ZI1QO2NWvlMQjvzamneLTCcixZvrtNhpz0RNk2l8Yusu0qMesyVkefstwre/WKbA7cHviNdD+57uIHBhFik6602nZ4HYTAjZoeVzdkymvUYQZzU4/oKJuJMjVmGuhE4GcJjS5AfA1jeDVa6a/51dU18ydwuHh47WxrXn/MvEOOBh0sLjpIRyR8gK8Wc3N8nIBZNB7aNHSwMpmwVyOgvkAeLWIqvu0HSLE/Ju288zGgB9sXvYsaL9MZbN6NgB+T3aeDKEmT2eL2YgWfFIVrBVEYV2OlXf5DBlS9UDJGyykkvPqFuZ/RVNdorS0W+xOJAD8xTHljUW5bWSB89mhi7m/uhUBxbR8gYyLQK1LrFN0aCz3MqBZ/A0U71HyfYzz484kRJHwm20TqbA+wMPbMmZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199021)(6636002)(450100002)(66946007)(66556008)(66476007)(4326008)(478600001)(38100700002)(33656002)(83380400001)(186003)(2906002)(41300700001)(6486002)(6506007)(1076003)(6666004)(26005)(8676002)(82960400001)(8936002)(86362001)(34206002)(5660300002)(316002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZrmG+q/6rPA1ad8pJiWasdqKhCLdeweKhT0gvvjPjybV+4lCZP7leqkP458?=
 =?us-ascii?Q?gJlkTBhIdHHwk3t9vTwiy4CMUmQT6Rh3kEJ5yqnBPPMjVv1FFIWIJOAbhQ2G?=
 =?us-ascii?Q?SUbChmjGrUE0Dz3dK7OChW8Ar47WmoNOLHTbkRV8grJ7D7ENU4G6U9+/mgqB?=
 =?us-ascii?Q?RrYMZOMGhiuUiXkz+1vPOga37cKF/lXtWYr+SGwJEtL4SszVPX73rHbcuDsr?=
 =?us-ascii?Q?NUfPIEl83Q6LDLaJjNR2/mddqCeKsrooXhjWRjmubLovlQfY5o2R+1oA0LVc?=
 =?us-ascii?Q?IVQq3gyEXZKwKM11cnKXenTAbTIFqgh/GDsELzzFa3j852pOgAaKQvp03/n/?=
 =?us-ascii?Q?RyXiYUvGVHGazi2/mfA0KXGGPlpNtkbmrRi8ZxazYC1bUh3v5dDFDlK06Ii9?=
 =?us-ascii?Q?ZSdYKtj1bRO4b3NVe2ndfSdpYxiW7jRzWhdDgTWrN1JPZOTcDjG0nh+hX010?=
 =?us-ascii?Q?hmZynjpaVUltAloTiFxYnVrl0yLPATUrZku7s0ADvulBWWDS767FUz4USVD3?=
 =?us-ascii?Q?DwGiS+urAhdA/xKx6R8tWdHDDcRjiInmQ4SQRNKfKtSXDFuYU1G2Lf6SgjSZ?=
 =?us-ascii?Q?48FSqekoGyiGWaC2ri8gOiEObyOI/1ux3iYZ08RgZPmxTYSpL5ZN/ua6bByt?=
 =?us-ascii?Q?JIFrw1LO8yr8CPufw/n8eGYND3eODFUYdJjjTywB2whYTUqMsYdgCE0wfgwW?=
 =?us-ascii?Q?jG2nLajavN6G+5M+HjD5Rb/NIMouD4HCwPsSsSjdFq/xO1zNjhKY95fjCGVB?=
 =?us-ascii?Q?51DlFuNL3CXTcRtLjG/xaCw0h90qiyLVv0vPkenzYdCimfqsDUhe0gvasBe+?=
 =?us-ascii?Q?b9b4chCGebOAWxZNMxSF+SiCYsOVwAP+3pXyh+hjWOKRg/mXlvOwBnxhqCtd?=
 =?us-ascii?Q?Ff3kULFTwlF4TgU65gaDdr1esqWb3wLZT/SXrSApaIY58nv30RKC321uPszw?=
 =?us-ascii?Q?N44aTaQ0LnqgdNorGcLtQM1ajHOOh3fvAwyracQb7wpCRhX6ZrsMlveDW4j7?=
 =?us-ascii?Q?IbTBXrhoH5141OQQWr4LqIKYGueosqnhxUf7M4wq3rZpGDsjVflQtmAhEyyl?=
 =?us-ascii?Q?MBmBwHc+kP3GeT2qadnadjyAq2zm3l+Eooidl+NT0g/HEe1p8piHT+hEXv3Y?=
 =?us-ascii?Q?ebqn6l4p7lB5sJf5ZoQZRy5T6x/PlB82OOTXTrEyXY7hTmYzPRA2GJBGofTn?=
 =?us-ascii?Q?UWXezys8pGh1SRyI6uQUJ+e5z/rAmUfD0Oai9pnKb73sZ0ONSDFclVbrsH5o?=
 =?us-ascii?Q?7S4FbbBQVk0npdbeJ7VjpJzNslym9XBHNe4FxmADDECMa5NhwlJ3vkyztbjv?=
 =?us-ascii?Q?QwHeOLq8xSeREXrwUU0fY0+98IuUtImh2js/wTwz8GrrgiaNR4Rs3zSx/y2Y?=
 =?us-ascii?Q?+5PjdDExlekY44jsjQzTojomxr6wV4zAWDQQ6pB947HNfROJ/ne6UhjhZAc1?=
 =?us-ascii?Q?G555FRyibCLT9TK+LT9HsOEiMRud2YFwUu3LuFXGufAeUfeIUvH5Mp99U15P?=
 =?us-ascii?Q?TkfsqILr8cPDbDpkSDdW9zFOXNlQA7zCrFuT4CF1THBTQvsbrSlrFYXk0qsT?=
 =?us-ascii?Q?CeXU0SNlnnbKCB5lQJFGRDnyb19ZpBHArQm9uVoN3U+qaOfQ49IoTOv2AcJP?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebe01b3-e59d-4772-5b60-08db41e2f9cf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 21:05:31.5745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45Mnje/le86/kRp5WPIkJ9ZgaUme4o0kDVpwnRnTMXhe1iXHFYVJM6kKFvuqegpSUzJOWHGDfqZQjXaNnt8ISKRKa2+UYPIA5v0cUvXmlNA=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 04:00:55PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> The design is to keep Buffer Object's caching policy immutable through
> out its life cycle. This patch ends the support for set caching ioctl
> from MTL onward. While doing that we also set BO's to be 1-way coherent
> at creation time because GPU is no longer automatically snooping CPU
> cache. For UMD's need to fine tune the caching policy for BO's, a follow
> up patch will extend the GEM_CREATE uAPI to allow UMD's specify caching
> mode at BO creation time.

Nitpick:  I don't think "UMD" is a term that anyone really uses outside
of Intel.  It's probably better to just say "userspace" instead of
"UMD" since that's more accurate anyway.


Matt

> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c | 3 +++
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 9 ++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index d2d5a24301b2..bb3575b1479f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -337,6 +337,9 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
>  	if (IS_DGFX(i915))
>  		return -ENODEV;
>  
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		return -EOPNOTSUPP;
> +
>  	switch (args->caching) {
>  	case I915_CACHING_NONE:
>  		level = I915_CACHE_NONE;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 37d1efcd3ca6..cad4a6017f4b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -601,7 +601,14 @@ static int shmem_object_init(struct intel_memory_region *mem,
>  	obj->write_domain = I915_GEM_DOMAIN_CPU;
>  	obj->read_domains = I915_GEM_DOMAIN_CPU;
>  
> -	if (HAS_LLC(i915))
> +	/*
> +	 * MTL doesn't snoop CPU cache by default for GPU access (namely
> +	 * 1-way coherency). However some UMD's are currently depending on
> +	 * that. Make 1-way coherent the default setting for MTL. A follow
> +	 * up patch will extend the GEM_CREATE uAPI to allow UMD's specify
> +	 * caching mode at BO creation time
> +	 */
> +	if (HAS_LLC(i915) || (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)))
>  		/* On some devices, we can have the GPU use the LLC (the CPU
>  		 * cache) for about a 10% performance improvement
>  		 * compared to uncached.  Graphics requests other than
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
