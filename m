Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D187B7F91
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA7D10E114;
	Wed,  4 Oct 2023 12:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F0C10E114;
 Wed,  4 Oct 2023 12:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696423537; x=1727959537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0Q/OChL+BXRL3jognXvmtNtGUFMRyPe4PVM+T+/6jDY=;
 b=HD4MHEyMpc9s1b99hEh5jXctQk2AFb9GTt1ISxI73aqHeQRZoJLDStKc
 KCY7/+QF3d19/w0MIVMxerv+f1+g2zhjSLQLf+64tR8E1PAHz0wIgb8sO
 +gwPvypuYYp1jNS8P4LPW62Fu7TrQiOhH8J32bmMYzbyXy62r/nGV9q/X
 0G+A5s2mA71Lx8cgmq2A4ri8P0sq5+RcKe9tPsxEiuK2XSKIPBpuAyQxT
 wOGzAVxApOMcs6eKCi5AbArGt46hf9PCFleijzpm1fZVKcFg3JcDusXkQ
 qMQ8jvE39ay4QJEjaB2TIMF+LGU8UcwxFAGFAYfzHDQvJZoLiy8hg7lPk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380434223"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="380434223"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="751266540"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="751266540"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 05:44:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 05:44:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 05:44:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 05:44:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbpzYoCnAGeSXe5RxKmgRuNSQLGuhMO8eOXIoRmFlUhmx4BXle+d/8CzdNXx7N3hP442MMngAisw1JWjUtnh0z2GfofTY+tX/9NP2KcTwgAG/LQ65b+9KttEHi0s1paGgz1L2WuyjOQgz0k2U1QHh6vCCCPxPjPFu2p0fpauVSl7roQXL7mWkqoOEf6+/xQBtXASU79h33iYLgJgmyLgfSGaT6gslrN41TVUzHmyndLj+8+FFAWXfK9eCBdytXRvnYBI54a129TzOCiuNVtvdfaI0DLleOC7m+0L0XmCqqNliT5JOd9r2AIuJX34XCfqFu59j2Y/adPwv6EGb+2qAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCCTDxNmP9FQAGGNlRmfEwO2P/FR7JN9lpNI4ZBjsa4=;
 b=AFmCVqeHn4yA1trz4Kk8IFYSVlIZydEcqHuDt3uuLdFp24f0xNC3PuoWKkMYxMFflwCsyWG+QXe+nV4A5r4uUOuKAjSpMr3xamWT1BOxN3BmIQPRfs3bWL7yWnSnJU1qegGM0D3vNozn+bvaPZ76s2mFwN4rBTd/JJZ9aNnzlOV61D4c4K1wdjV9s1ngfQLmFaKA4dKPFyPpwr1aL+iaR3c/N1oxHbh3b/Zqi/dfzbwqwfITfYp1JHvNt7qlKuQG7NWDFEJzNW5MLImWgheFuFFI8NYhCktencV2okuy/itOdsVV/mEzLISgTWpjA3oPYN6FzYvuy5Nqa+Kvv2q/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB5681.namprd11.prod.outlook.com (2603:10b6:208:33c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 12:44:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 12:44:45 +0000
Date: Wed, 4 Oct 2023 08:44:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915: Reduce MCR lock surface
Message-ID: <ZR1eOHqOFK57OURn@intel.com>
References: <20231004120407.12251-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004120407.12251-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ea92d0-abc6-4f6c-eea2-08dbc4d7afc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tnC0ZlPQISyI1ZnANWcDCUdZUrlUA5+D+wDK/4ExUOyTxdpA3xPMk0Iwk/EvlUU7teiN+cIRcFGvU+EpXr/UpzB1/eed2muQUT5qm42RjBQl8Vk8Xx+7RYAkzZPkMuSDLgHyZmFH8vollj4jZGqu6qvYQ4Z4iGYeJGgV+S6MDX5M6wY4xCaFEFukkbHZOZQv0MpHfE2yhx+dVTDNtCiEfY4zxW8uQkExkEtq2RPWKp70quhrhATZUc5YXVTGw/mzlEL8l7h+uRqsWpiypq9piuW/p33+UT3B7qRGvYJjwiOwGNalImYBFZQZJQuaQQMgZ0sW/rb7JvNSZoVQK//oeLfuSbp2LX+eH4lAdlFH0WtBd4ataRB8tH4qULvUMQlWLzBGSCQ57V3MlnSObXGlX1h4fGoBqOG8AT4o+Az6Uw+0+spNX+B4j1JbCPjH7VrUoiePF7htOG70f+CYF9IMGQvsRxLPq7UxigqLNWHkDRaSHs2s4TdzoWP1SnkHNnpkJyMn50MqAqolPQLTGJP7UpNjIyXLuVAgpU4cA9L2N2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6512007)(6666004)(6506007)(478600001)(966005)(6486002)(86362001)(38100700002)(82960400001)(2906002)(83380400001)(26005)(2616005)(36756003)(37006003)(66556008)(66476007)(66946007)(5660300002)(44832011)(41300700001)(6636002)(4326008)(8936002)(8676002)(6862004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zNFxbPGkF044cRpAz253M3Jz4dEYYEa/nZXVNCbcKNvEAzRu04i27pbjBbbf?=
 =?us-ascii?Q?rsarvQ5Q2+uiWayzsKOcGMX4kzJp3UnZnA8Y18j1um3fvqhFFeMDgGwWHfS7?=
 =?us-ascii?Q?d/o4oa82X+nNdB31yWh6ntQmaGuYpRiWLDF8IpJMw3n4x7FRZ+vvnciaM+ls?=
 =?us-ascii?Q?1RH7leRgGWN2ChKS9ykL5uT3OqEksjrraoDz6hA2zJlGd1ym/UyqsjlkapUX?=
 =?us-ascii?Q?0U9UxPEJb7RQpDvFa4+KSOtTD8F1gc8+nmPAhr0ZO75t3ubueveMmqGhaNQL?=
 =?us-ascii?Q?l880WU4UEmnq3/nUNW9GvZuIeXLDrTvu+CCJskzmieeKU/5BGWndb6Xjdt7J?=
 =?us-ascii?Q?M+rlcxKZpUp2dFyeD1W0CejmYI/OsEzyYk0EJHK19V6pgUddUBBW4urI7pOg?=
 =?us-ascii?Q?I0clUB3AA0/VxCpSOJRsWuhxeEcQvbZ66eNrGu0k7ufY+3mMCv9K4xkG03jZ?=
 =?us-ascii?Q?G8fr/rEdD/EU6AEJ+OKJqhMnG++gBWj3Lo39r60baPiUnRPfoRDBe2Mi6GEf?=
 =?us-ascii?Q?oCW8ZENDwyT8zboBmfhp9pAKlza4O6juu/CKCXRzciyyQFxMKs1MVWLiNDlo?=
 =?us-ascii?Q?zu33R2IT/U0rC9dfALd6sCJVLXHHUgz1h3Pk9FTsrGn0X2wGc/2zjgtHWwuV?=
 =?us-ascii?Q?MdPKM2/OAumyT+sflFn9ZDAFalQXEELuRmD/I7uxGSAluvC+LT6NH0PPK9od?=
 =?us-ascii?Q?L2CuBag9UFXytaykuVTbY/wZKR/XwKgAb+G1acx1vGGE2gd+k4T0dG6TPiGI?=
 =?us-ascii?Q?SAJTPYzHI3eEOJOhZEBdD8k5JBmwoaJRptJ3g++K05BdDzDjHfFWVwdfNMMA?=
 =?us-ascii?Q?x4vKN8+XFA5fnpbz1DOpDgozzLmMyzXzB+BVmPZR8mOc5pvg/L2oeva2/nYh?=
 =?us-ascii?Q?eKtAm2kPK96QJgKs8T72mD6fN3XE+NJTrIaJCYWPQZIv6LesFi2rFRv+ySbW?=
 =?us-ascii?Q?wxupXey87OwAiKlFhZY+kbjCV8uMdr03YCQoCU73x606wE2WRQgYST8roSos?=
 =?us-ascii?Q?uTzYi41BwwlpJ8yEf4QddJlHYGctVMUD+eQSIjP2gc+KUm7HbOVQqe2CX52S?=
 =?us-ascii?Q?tYzATQS5+x+DF2u6tSdQ5t31WXwabZ4ODe0bhVm91J03YLxJyrpF3d2/vzna?=
 =?us-ascii?Q?sRsVOjltOjKofYhevzXZbZddioQD70oQ4ChjJX+ZJlEl6pMlhN79LkR45+iG?=
 =?us-ascii?Q?jS1qkZPpPBCnTZ3ESF1GCIimxxMvoPtEZmGC855oOfQAVJ8o+XYAGkLGG3MQ?=
 =?us-ascii?Q?Fw1pWtl93pqSTnICzfz5sXtZCGppJ9zHnzjV645KgLHP6DWS8SLZMOD3+Sle?=
 =?us-ascii?Q?LSnpIJLvdzomNsrFq6q7gKFDpzKwQH42SLS3OrRNhB6EMr0Ki9XdBbmM2FSk?=
 =?us-ascii?Q?tiZOSaZvYGWJT4z3xWko3pVEB3DwvRmCyoM1pTSopGvV9sHmhCfDGrue/h+7?=
 =?us-ascii?Q?oW88ByeXzYa00mjhm1jOwgCCeZRMk90LiFVEfzAZMC4ncKknryAEGKETEviW?=
 =?us-ascii?Q?yjVdcGsqNihpCAiPVkS5y6diaetE2327xItoe+6L0o1uA9MesDOLVmNXIZrU?=
 =?us-ascii?Q?ocH1vIMGCSn7JLjvlJcjThDCl4Fco6twKqcdmMoa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ea92d0-abc6-4f6c-eea2-08dbc4d7afc2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 12:44:45.3305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVhwduuhE7vFn9EHnpaUijkZqzU0h61btE00/h7uU9BcPVwkK2/5JceYA0adkMSH7tqj1gcBCmWpcSWHsRd+PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5681
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org, andi.shyti@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 02:04:07PM +0200, Nirmoy Das wrote:
> Take the mcr lock only when driver needs to write into a mcr based
> tlb based registers.
> 
> To prevent GT reset interference, employ gt->reset.mutex instead, since
> intel_gt_mcr_multicast_write relies on gt->uncore->lock not being held.

This looks a lot like protecting code and not protecting data [1]

But to be really honest I'm afraid we were already doing this before
this patch but with 2 other locks instead.

[1] - https://blog.ffwll.ch/2022/07/locking-engineering.html

> 
> v2: remove unused var, flags.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_tlb.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
> index 139608c30d97..0ad905df4a98 100644
> --- a/drivers/gpu/drm/i915/gt/intel_tlb.c
> +++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
> @@ -52,15 +52,13 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	struct intel_engine_cs *engine;
>  	intel_engine_mask_t awake, tmp;
>  	enum intel_engine_id id;
> -	unsigned long flags;
>  
>  	if (GRAPHICS_VER(i915) < 8)
>  		return;
>  
>  	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>  
> -	intel_gt_mcr_lock(gt, &flags);
> -	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
> +	mutex_lock(&gt->reset.mutex);/* serialise invalidate with GT reset */

I'm still looking at this and the commit message above and trying to understand
why we are doing this and changing the previous 2 by this other one. why?

>  
>  	awake = 0;
>  	for_each_engine(engine, gt, id) {
> @@ -68,9 +66,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  			continue;
>  
>  		if (engine->tlb_inv.mcr)
> -			intel_gt_mcr_multicast_write_fw(gt,
> -							engine->tlb_inv.reg.mcr_reg,
> -							engine->tlb_inv.request);
> +			intel_gt_mcr_multicast_write(gt,
> +						     engine->tlb_inv.reg.mcr_reg,
> +						     engine->tlb_inv.request);

you are already taking the forcewake_all domain above, so you wouldn't
need to convert this to the variant that grabs the forcewake underneath.

Also this is not mentioned in the commit message above.

>  		else
>  			intel_uncore_write_fw(uncore,
>  					      engine->tlb_inv.reg.reg,
> @@ -90,8 +88,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	     IS_ALDERLAKE_P(i915)))
>  		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
>  
> -	spin_unlock(&uncore->lock);
> -	intel_gt_mcr_unlock(gt, flags);
> +	mutex_unlock(&gt->reset.mutex);
>  
>  	for_each_engine_masked(engine, gt, awake, tmp) {
>  		if (wait_for_invalidate(engine))
> -- 
> 2.41.0
> 
