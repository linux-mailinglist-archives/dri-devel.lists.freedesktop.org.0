Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921DA837515
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 22:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242B110EF5E;
	Mon, 22 Jan 2024 21:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7254910EC31;
 Mon, 22 Jan 2024 21:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958053; x=1737494053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LiHuXB9m8tmMj3b9KiQAYrTdkGGpX6YBVC02UWMeRdA=;
 b=GIxDdfpf/gSxU55fuwlqEaiwALHAF98pygWlr0KKZFwRH4xvkzeEj8qF
 yicI9LQBxpa53io6u7PCPGdJU1flcPGc1c2K64wOOwVdvBqee1CUXk/Ex
 fRNPpgfKuEgvcANmctdWlslI1g1hClQRXKm50n6gOLQOQxohSqET4FBEM
 C0NTE3oxuWTp/LqFLJOUYl2FPwgKlAvjpNSi7wE86C2X70Cl3Sk2lxMgt
 fEhpahvD3Hmrg9xu4pm0sENO5AyJy5HqEkewXsU5eJf5JvIs78l7KkmqU
 C1v0qdfgcyDnbU0mEzeHRb6TTJk7EP7Pm8VmmqdmVglbii/wCroaqyljl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="19898019"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="19898019"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="27494637"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 13:14:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:14:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 13:14:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 13:14:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 13:13:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkF4IUO6XuKdj9p0JPLQwYwtf5/9vgT4DBZ0flK02ZcQvs+bBeeenFlUH8I/qI4BhxeldnhCJNxfHJjjjD/qkbByVnInpgkiFHnGX8B0aS6xZU0c24PteD6r3n14CABtr8JIkV5e250b8HhXWYxi/HfKDpPWhBySNzdk6j6brYp0V8D64/2fwGyBmcPjTsAC84zfRsbr/6nm7pKON5q/mwU3ZlBUqSR2S+LlUPnTIM2mu/nVcact+hUy6agfy6BzLAzjikI/TWxogX4h8TwNBmWYBoeexC4YonGrT+uigB3xXaTmw0cXr4+zUqik0TY8WZs0OIET2iia+KvqQTw1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TiPLfx+BxoY3i5xwQ/3nXj/NaxyKySwotwIC07QfAU=;
 b=oDTtxOuHilBRsQTG/1rpWucyITAjCwr6Qxl9V87PvizJ8eFSlhPRL0d3LBfMRn3kTpQT5HJeF7i4KlyKAuXvcHoFZttVx/ocnqKNrC4jcarcvOQI02ajCisH9TGvOGmKXsRsOIV6/OxWlvthL2i/9lOK8F3YZKOKVb7rvTooZ8o6nqgK9g51770ySMs33vOQBGwbjL8A07u5lYqay/ZxT6ICqq+kD2QHWhtyWxS9x/qu9SmYzPmOZ9VYDSrcUYTAx1n/AFFbeAjWDRrSB0JzP2/q2F8A0OKJ6kdZnAnkpbveG6vzynehhd8lOmPLh/349wJ21a992Rxcrjd+Gb85Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 21:13:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 21:13:37 +0000
Date: Mon, 22 Jan 2024 16:13:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v4 2/3] Manually revert "drm/i915: Fix a VMA UAF for
 multi-gt platform"
Message-ID: <Za7afPr_7qjyHHIM@intel.com>
References: <20240122141007.401490-5-janusz.krzysztofik@linux.intel.com>
 <20240122141007.401490-7-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240122141007.401490-7-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: a0217259-0ceb-42cc-1505-08dc1b8effed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTYWRAwAMpC+jqgMSS/6yE3KIen+68Enpy8e1ySG81UvR/61DsXS1C3l0zFH27w88jxMRPZfJjhVjU0p23+WSlQbmpEPRpxOZ+H720JGPpfKRFz7fz2qMhBzuiE2+k1GFUnFXdG0SG4oydVwGCHQUjbaqbcunaJ1CeB+ishglcXvNxlQCJgP6I4pNnTmEyC5vdZqcoSzjiqsG+OMSNvc4SE6r2cYlvZHAznFfdpRCppi1LIJ/XPr/qRgFQWZjsx+hOjOeVAFwRg9S1dCup3jMSJNNj+zR6kKH0cbjDCtIynoi6QkDj3+hoYGJn6sAnlh+AELvOWwMjwgJs7icWTkuy+oci7drKQaFudxytQiuMchGIR9F7t3HJ14uQF+wa1rcU6fJTKSi0VhK+/DE6S4oLFP6tbS/jN6hjNIny/0gyeLQJNTInWQsf6qQPaSiCN3LWl28+4GBXBeEd5nZNobWObdSNWQzR63ZMFW8ULdYJGF6JFnPwgf53POPjxdvc50cSxjZqlQkhmaH/uViIBg5RFF7kIRm6Uiz5X2BCXXf+1k0P5CT56AQXm3HB3mLK24gMa4PLbcXE2mn26TFkkMgDRec+xg/U1972w9iJLC6e4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6916009)(54906003)(6486002)(82960400001)(66476007)(8936002)(8676002)(316002)(38100700002)(4326008)(66556008)(66946007)(83380400001)(6506007)(2616005)(6512007)(6666004)(478600001)(36756003)(44832011)(5660300002)(2906002)(41300700001)(7416002)(26005)(86362001)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2zbDXvCv5uTQb8bQ8/z6jAxR/hpWjedVPABjcRLTPNAyfZ0b84PmuSbdEtx3?=
 =?us-ascii?Q?up1+l6oznytQU9/1jsdek03HJAD8jlqdnktp61qRMtOjgO9HBAf0RyypIJWP?=
 =?us-ascii?Q?T8mXDRpP0XMxscySsASn2alEQvnxdA9118cBivRkiaYtrcVQb5yfTbgupKKB?=
 =?us-ascii?Q?wYJEIE6zufMhwUyBlK0sMpXZ34N4f/4DRiUTo6OM8y9zzF8y9/q5ABtptaa4?=
 =?us-ascii?Q?RVkTqB7CKgXsgEcZM/CVuMqvXTEc5jg/jsZ/M7IzHiOCvzpTE2xfEpwopGMs?=
 =?us-ascii?Q?Eq8SCnEpwLeUpV3YzZEzF7mv4wcnYeNo4NWyisA9awvQieV8fuixZid3TvOO?=
 =?us-ascii?Q?aTdHcJEWw84kaTxGtYsECFaMqVap7XZk/GT15kNhI4YlCNz49kaoMtZKng/u?=
 =?us-ascii?Q?8+Q4Xej6H/hQcr2GeZL1qe1TO35xpeWsCEi8s4fy4P8S9j/vheBNRjfyyeDh?=
 =?us-ascii?Q?s7sWMJ0l8UV6GMGYEjAQa571AaxPix0pFtUXrDFLGEsBCL1W6KL+6hhEqe1G?=
 =?us-ascii?Q?U7M4fftgrqu9/p6x6IAmkoDjnyR18Jyry+BVOZj5u7wRRtAFHLLrG/XRWXtm?=
 =?us-ascii?Q?9GmfL5SCSmkAqpVyjlVeUKO0lBT+EpV4DYkoe3gLnSeuiGv6GgbQmbtN7uS0?=
 =?us-ascii?Q?DZqLYgoQQsrTi//xfewFEzgfQpXNP2PaG+jNXaHki07yp/lAJsI4INnHmGpP?=
 =?us-ascii?Q?PCIVb59m1kAooliFbcDjudNZlAVRUrBkaoOY95Yr3yo7EvrnmSLlOl7ixbSv?=
 =?us-ascii?Q?hEPJm3qsznhBGNSckS6hpxwHA1mN9dIwWTw5aY/vg9+xxBw80L0e0FuMYju2?=
 =?us-ascii?Q?XEgfJS8wz2zlDMDwAJeO6swt3KP09/xuUeWcYKsNOV1LE5xlwWmB0T+QAPvZ?=
 =?us-ascii?Q?3fj4nD0E0LFydp5QQrKmUTmRoRYWQceUWDLGAH6c2fatW5m8vfjznaK3FRYK?=
 =?us-ascii?Q?1xa4SZ97YNeIDcP+2Y1TN1z/oxhaSq8z1mmD+vPM3U01AMX0iiDM3LxKKdpc?=
 =?us-ascii?Q?bn0WqTjIHQj1qmUKwekDqtmQ+1WfPL5L2cEdP62CWEz+rEB25NvmLT2mgj6B?=
 =?us-ascii?Q?+QLCajirVlxjwY0vR3L7iN9Ps6YSGte80Njlid1D1gMHT75LbDAH9KchTTg7?=
 =?us-ascii?Q?H2SSh/jTkkbJfHqmn6+2DdG5jCrMAXmoRGfaOkRupuCPZ9w72gNtWI1V+VW2?=
 =?us-ascii?Q?XCflQEqzxpDsxeSX7jLl+2dDMg7ifDV+Zm65miMgDwMZIryNWV9eXIsdycXs?=
 =?us-ascii?Q?quVLeg0T6FhC0iJKJzSDjCkbSpmGfjOuE++T+7a28oBH8sPECR30M64K9xLD?=
 =?us-ascii?Q?p/w4tGcZwRJTr8CwvJJRZLMaoraaRG/LMcsFRVAmsFAf454ZvXHry6sOBgEb?=
 =?us-ascii?Q?uN+tlqDuDFfycVhSzWHLiLO2k6hNZiiqaCly+n5QwgfllImyIkrS/JFM0Ts0?=
 =?us-ascii?Q?Ln+c2CjhGJKHBYYpVKVk4sXcr9PfhfLMr/nxXnwCQk7V9tc6vc/6eC8zHAuC?=
 =?us-ascii?Q?Dzy64sM2lMPm4QaYQxUc9bmPJlKNpZYc3uetOiOdCxFxeiEua6oi6NA5PBYx?=
 =?us-ascii?Q?4eS0ghbHS3YqVk74msJ+7fhQpj/lgt+C0D6je54W239zmVjoXrvm08iGEOfv?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0217259-0ceb-42cc-1505-08dc1b8effed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 21:13:37.5592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPhzioUCAE0laYI7kiKfgYk2IZoD2XX+sX5gKlwiQ98DjSBW08rrcoIT538XSVARevKAYirLWkssgcXuE1ZIVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8346
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Nirmoy
 Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 03:04:43PM +0100, Janusz Krzysztofik wrote:
> This reverts changes introduced by commit f56fe3e91787, obsoleted by
> "drm/i915/vma: Fix UAF on destroy against retire race".

I believe the good chunk of the first commit message should be moved
here instead.

But why did you do a 'manually revert'? revert itself didn't apply?
maybe you could avoid the word 'revert' and use something like
Remove extra multi-gt pm-references... or something like that.

> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index d3a771afb083e..cedca8fd8754d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2686,7 +2686,6 @@ static int
>  eb_select_engine(struct i915_execbuffer *eb)
>  {
>  	struct intel_context *ce, *child;
> -	struct intel_gt *gt;
>  	unsigned int idx;
>  	int err;
>  
> @@ -2710,17 +2709,10 @@ eb_select_engine(struct i915_execbuffer *eb)
>  		}
>  	}
>  	eb->num_batches = ce->parallel.number_children + 1;
> -	gt = ce->engine->gt;
>  
>  	for_each_child(ce, child)
>  		intel_context_get(child);
>  	eb->wakeref = intel_gt_pm_get(ce->engine->gt);
> -	/*
> -	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
> -	 * free VMAs while execbuf ioctl is validating VMAs.
> -	 */
> -	if (gt->info.id)
> -		eb->wakeref_gt0 = intel_gt_pm_get(to_gt(gt->i915));
>  
>  	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>  		err = intel_context_alloc_state(ce);
> @@ -2759,9 +2751,6 @@ eb_select_engine(struct i915_execbuffer *eb)
>  	return err;
>  
>  err:
> -	if (gt->info.id)
> -		intel_gt_pm_put(to_gt(gt->i915), eb->wakeref_gt0);
> -
>  	intel_gt_pm_put(ce->engine->gt, eb->wakeref);
>  	for_each_child(ce, child)
>  		intel_context_put(child);
> @@ -2775,12 +2764,6 @@ eb_put_engine(struct i915_execbuffer *eb)
>  	struct intel_context *child;
>  
>  	i915_vm_put(eb->context->vm);
> -	/*
> -	 * This works in conjunction with eb_select_engine() to prevent
> -	 * i915_vma_parked() from interfering while execbuf validates vmas.
> -	 */
> -	if (eb->gt->info.id)
> -		intel_gt_pm_put(to_gt(eb->gt->i915), eb->wakeref_gt0);
>  	intel_gt_pm_put(eb->context->engine->gt, eb->wakeref);
>  	for_each_child(eb->context, child)
>  		intel_context_put(child);
> -- 
> 2.43.0
> 
