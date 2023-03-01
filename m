Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7106A7462
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 20:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265D510E21F;
	Wed,  1 Mar 2023 19:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0346D10E233;
 Wed,  1 Mar 2023 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677699397; x=1709235397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=86Js8WuPysqfIGbUvMKqHF7lLxximpmr84UFqMp04fM=;
 b=doT+EoyvQp7WVPXczvm1wbN+Pkb6DAWjUy9t6wwyZSS79nvB6ZM7C2y6
 PRR4kwDjdlAW16VQNgc1OL9Gnc0K0U/LSASlAg8pM1GWaGhCeyF5LvNPd
 4i4hUgoPLirCpkSNH3LRBlFSoUGnif3DfhwcwRS7yPNLrd2YohCYdoHTw
 3OTnxIw/xMHkdnf6WTwNML35Gd6xrAyMjeK8rN3AhCI1FrhSHgGxV+jug
 exARI7SX4bQKudyDHX7XZ993+19ij3+RZZyHvYqL3pD5p8+0aXRtkIs25
 pzn9oB6tTBQenPAv5CLbDhAdShBc69NzDd8dDuwYG5mYFBcvI8kJYZ76W g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399290750"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="399290750"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 11:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="920362929"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="920362929"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 01 Mar 2023 11:36:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 11:36:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 11:36:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 11:36:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbPfZ3w+Y3QzSjAph0h20t8kZ7DbcpVw0cwOWdArCboHC8YBdc0iM4O6UofzuuYlVe4BzKEOL6UOZBMOKt4NS/yUtnc8IaUCu8Z6KD9DkRckS89k4MFz75+rSd5fY8lkl26IFKNckFeVX1B0eQn2wCMobKAHUZTXrPgrIH3Sqi4DyYFfDQH2r5EgAt2SoGmwp2/G2TOs33y1EVba9i7HPStIqBfSPw32iyQ6KzF+Iz8e+ZuZxZQkY04lLvy71zY9M6vY6zvV0q0c0KEhWzFo+SOIjsuxOYPz/u8mGvZjwYvyLlA99rJ6Smvta+Cm3DyHya4gBKBd12eAMSabcNZmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsOtel1VfRrTF4hvaD7Ndob6wbveWd/Aru+WMyiZJDY=;
 b=IuDdoR21f7uuvRQP5hPYzmVhH18MtOUtryB0j5tTVyysBU3IsR5aDef4+AU82Xow06NbbqYfS9dkUGBYxQV5hAPciI7yk8QFDtgD0ZTLTi4zsGq457RD1HZl4hoKXwM5LW0aRSxAUg6MxbhnbW2773qFoevSqiRviAo39FkcZpCgZp3s+4Qh7OqNUkvuo317Ih0GPv8muPczate7yzXAaHcoAjApoaQkdB8pxptIKPETujbn+8KEUcmbeHJRrE7/bBLsa4dYbpbLyLfkO8j8uAGVWAW0urQWHsBMCFwvkBIaxVDQWy0CGLgSVLYxuqexEvYm8iM9ASWGl+QPsFOfxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Wed, 1 Mar 2023 19:36:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 19:36:31 +0000
Date: Wed, 1 Mar 2023 11:36:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/i915/mtl: Apply Wa_14017073508 for MTL Media Step
Message-ID: <Y/+pO+hu8+5j4oKW@mdroper-desk1.amr.corp.intel.com>
References: <20230301101251.1203215-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230301101251.1203215-1-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR08CA0052.namprd08.prod.outlook.com
 (2603:10b6:a03:117::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ae2f7b-5499-463c-650e-08db1a8c41e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uobj9zsoDSJJtlrRaVRSdnT0jDUjzGkCTIdry+QpKzlSKrUlWDVnEMuhAECdwLyibKxWFlWUJKz8SkIbAFLHPz22vSLT/m9sL6hAKgU6NRGK1yhF7YGcCyihAoVjG8uCPFVMB6EazwWeY948P8RbyDkD85LUYp6bw28hcN9Q2I7igHx83346vCBIh9Tx7T2/L4fLQMqPXfsgFCj75/BjF5DpiQhaMicZXgg7oFivhDM3FvgvPhTxq7ODuBo+O1pv8T8lkxM6IBqv7qjiltjmcvF1vqgUwEixgBQs7uFuJRFawk8XKBfAk3JYbUW9NYjc+pfK/4Xow1fkT84l92sAhk82PF4VNUG6mIxBMX0mrqCmSoP8wQqcFqAGElPF0g1Tw0FGZXwdarl2mFQCRoOf1PVf0HGRlFZhGqGcm7EZX+XbMdUOh5zV0MlWu6Ltt9j74PHleqnP+x9DW219/Dj9A0FUpXB8h3w/QSqYXWq5B1FJgFlFbNKx1BZ9pkWGs85uZS0hnYJw7RhQlnZi2cTevN5BxFLtWzGbpoKexfAnY+zL2zS9DXeJ/PMGsFYML1T7U2Q1SKLHXzZfQnYGAj344U/Vmv1qIxL2b76ig4P8yrbG8mAELukM/FHfoVH8iGTrjF0qkPWuEp4vYVIkhb4zrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199018)(82960400001)(26005)(316002)(41300700001)(6862004)(5660300002)(8936002)(186003)(4326008)(107886003)(6506007)(66946007)(8676002)(450100002)(38100700002)(6512007)(6486002)(83380400001)(478600001)(6666004)(66556008)(66476007)(86362001)(6636002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?78GE2iVVv7bbG/5K/gDNzrjW5LJZUDTRvxwLnnveSFLWQiro+MnlB5OTXXBG?=
 =?us-ascii?Q?vvXw/r8ebZTKtRHF+y7rt1dTSzLuQR1x/awKRqnd2hApjybHjcDZpRpdpZhh?=
 =?us-ascii?Q?x51IYGHHGpo2rLCo75qD7xO/699H/fDzBGwER0vJeCKjVshkq7e7KFy9tHgK?=
 =?us-ascii?Q?SB6Y847xcGstwT8POczn1JEzcQFVjKGPhVCbmWFN3n+Q/uochPa53kkJyYQx?=
 =?us-ascii?Q?WQGIwV/tS6FYUCx+6ShiXh0EuSMK2MnWydmC0R2wEIsNNkomSyclwC4b1xzB?=
 =?us-ascii?Q?lvXIFl5E/8XOUhHfBJqfpsNn30GIz7jcertnbWXIB6YfdRShKtGSBmjimIid?=
 =?us-ascii?Q?IFoomr5EwXGmI7zlYLSwnWT0dJ00DTT+1I+9bdQtUk3xzYnkYYTieGcaCt8E?=
 =?us-ascii?Q?9nygL2X9gnJqkGDZcD0DOUsmIPJXsz4Te8wMlMYTYzzC9At1Xrz9tcXgcmeG?=
 =?us-ascii?Q?fbCz8F216cSqFPwI7w5EZjIaOEuBjXC8xqVa0ZBN6vNd1qaZ6qHY2JdmfMFQ?=
 =?us-ascii?Q?RxyGelPItA6CSXiQA7JosMcMhlNut8oL5upZSMVGEMshQSiGeiE+GBJLHBLr?=
 =?us-ascii?Q?d9ARY6zY4oSApzh7yovn5NcmlPPlRJBtbxIr670Ou4RIBperPAHJMR6sZ8cJ?=
 =?us-ascii?Q?kYpeU4QqTZo9gJGsUras50bEEalWDzEDQyo4bjN/1xdGDxZyarK5UTukvFNa?=
 =?us-ascii?Q?6rj5yM1gaV2Mh2ah0dASvgJzsfec7og1hqCz38uY2fma0TwJUwQDtmI5wSPB?=
 =?us-ascii?Q?zpPQ8jt1itZVI3fq7nJJH0M1AjhpudSqqjN0Y+NCWKGxLXIONzrliouNQXif?=
 =?us-ascii?Q?sRkRRr4lw3wg6t6zAoKrPNdjcqXFSyIRPpNXxsaisChcXuz5Wn2nsjrYFvhQ?=
 =?us-ascii?Q?T50XIxhtyJjfEQ1gedY492G9fmvQFMzOGS2xlNqJ9X+rLL3zLA+ifHJVCRKt?=
 =?us-ascii?Q?gk+iuLb/G1i9zyY8PXYTBLm5WwiXFD0w9qiew4w71SdJle04bnlbUgeHWBmd?=
 =?us-ascii?Q?1l9PiOABoZC+pgzbMmcgPAp0mLSmN3jVLcLrE2tbjRZJkkIglBJECJ80zdZT?=
 =?us-ascii?Q?9hUQwrUbNZ7/B1D25t4Fa39MeR1zKw+u8bxzgAq8CD6gwwb9r6SY7PFaMKP9?=
 =?us-ascii?Q?knYt1YdtHDB/l8A+yLIkv4L9tjNVgkvG2PdAamWBWmI2BdQDCxBZUhvJcQnn?=
 =?us-ascii?Q?9LibpX6sVHaquQypihiRAOOckn9dve/Yfvz+MRVqUghmSREcKbDUyhSPa5YU?=
 =?us-ascii?Q?2faYnbZGOpSlEUt7AxcD2RV60LrAclSTD7MK0HrNTZ9TT13oxYF5QT6JB43S?=
 =?us-ascii?Q?Jo0dejBEkVAsKq2a8Ab+69pPu2V/YPJBJ18A83qxCmf9b9TCAp1fbLHbF5Ph?=
 =?us-ascii?Q?Q2m74kwDTh2ivFz+GTU0qCm5pO2uQtM8oDkuioaPGg8Pz+mskvINs5lrH0Vf?=
 =?us-ascii?Q?rWBuYx5kV5GUPPaNrWl0Ytk3i/EPiKVRpMwyc+GfwN0R8cuEt9GS+ePHh7em?=
 =?us-ascii?Q?ckR75m689GSM46775wF7ZCnoAwqEYCH/Ps5g8uO9gOPn8n8O4VVXq5ZsL5nn?=
 =?us-ascii?Q?cSLuuGWYT5/I2SRTGFMpK+yW7pM3g700gWJOz5zfjjNI5r8HT//E8rfcHeQV?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ae2f7b-5499-463c-650e-08db1a8c41e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 19:36:30.8279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7754mS5M7TQsetrSXriSOzNVtb2r1gx7JxKikAjPSuU7b7RVknApH2/H9u72eme+b/yuZfK5IfOOvb3BNH3K4iUDibVq/9Y4h5Tb3lPc7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
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
Cc: tvrtko.ursulin@intel.com, anshuman.gupta@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jon.ewins@intel.com, rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 01, 2023 at 03:42:51PM +0530, Badal Nilawar wrote:
> Apply Wa_14017073508 for MTL Media step instead of graphics step.
> 
> v2: Use Media stepping instead of SoC die stepping (Matt)
> 
> Bspec: 66623
> 
> Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index cef3d6f5c34e..a14f23b3355a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -29,7 +29,7 @@
>  static void mtl_media_busy(struct intel_gt *gt)
>  {
>  	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0) &&
>  	    gt->type == GT_MEDIA)
>  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>  				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> @@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)
>  static void mtl_media_idle(struct intel_gt *gt)
>  {
>  	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0) &&
>  	    gt->type == GT_MEDIA)
>  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>  				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index fcf51614f9a4..a53a995c3950 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
>  	 * Do not enable gucrc to avoid additional interrupts which
>  	 * may disrupt pcode wa.
>  	 */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0) &&
>  	    gt->type == GT_MEDIA)
>  		return false;
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
