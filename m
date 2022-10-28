Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0840610892
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 05:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3BB10E029;
	Fri, 28 Oct 2022 03:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E87910E029;
 Fri, 28 Oct 2022 03:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666926691; x=1698462691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aGfL6j57yibqWrnQR3aLext0EGEZp6OMOWZzqEGqKZE=;
 b=hhhIv1rKJpkUsJiywSXB0YT9kN1MtEfsOInvxo6tTcdR+rEOg5cDeQWg
 CohfYVYnqC786yekp24FePgcTwyNAUs+s22ytKxe/GYXTh/qaEjqTDitO
 KB3G6KYZF74mj0Quoi5PdkHjec+QkBO2rk1Kj2E4yE5tFexalrxYIBwIr
 nxfE1CtCr6uirjTwY/v9petWfJgwQyj8hzmL1SIIbCTbzZ1FMQanIVxiO
 Ade62QTC7bZ7QXrE64zduFT40BmdNP5Nuff4YTXbfYYiqcvOapTzUgwQE
 +XNDLYBNXFghRSRA7RLkTO3cqhuYQc/S7xNh7f6MSsAgo73vWqi9RK7hJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="372612031"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="372612031"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 20:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="807680134"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="807680134"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 27 Oct 2022 20:11:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 20:11:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 20:11:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 20:11:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 20:11:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpZTwhX0ufRMCPS4K34rWFzga9OfC7YzE61nfoEZxby7ZQo0mYr/WHytHxoS9X6evm+qy+Gnjh4E0mnJJAHYoJLbjHGrAhRF0zrE2Q2e/+hDzYZDxZVE7JaEwb2OFnMvc51Ahm4N6Du1nJKw6f07pSHkXviBHN9A4PnL4kP8MwBWsVJgNEeTYXrGI05K3gL8tRU2iNu1/fHG/v0kBcFqZvMt78QZ9o8SUB8cSx6pbwBmw3GdRPhId5y6h3gMkM1GYBMiVn9DcG6dtf68DQkoeHLsfGusZboUrj8OWGM1uH+ioaR5gn6SbzT5VhNjWqGroKVbjvU0ruLtRUd9KVp97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WkhpvovE8HZ+HAyDxR9zT3UdhZnE/SUEqt6C54ebFQ=;
 b=NoFXnANcC/M16zCpRZHaRtte/NoQqqBHMhyQ1pw8knIWWjb9dMZ7/BdY6anRFHTGgNf7mQVOieDb1uRer7x9vPVuspwGi9EcaBIPefvGFgJhjURq+fEwb4QWKXmc4nyacqj5VsR73AED96+6y0+pMGp5NfaPj8nHnr6IcJ+mAg2BGV3KUJAHi9QCmZkGRFUgRqCV/CD2rhT2K63WFA0HJ6mfP9i59Y+epUU0C+CQPKWAxWj0wetXTI0+0LVWklSnpIGRnPKP8rVeoBkFEVEFrByJS34UbKLh5H1CIfBcYy1TVxJcqM57kgE+ncCSP0NrS6p0KOuQohYsIBxXyZkcWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 28 Oct
 2022 03:11:23 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57%5]) with mapi id 15.20.5746.028; Fri, 28 Oct 2022
 03:11:22 +0000
Date: Thu, 27 Oct 2022 20:11:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/5] drm/i915/mtl: add GSC CS interrupt support
Message-ID: <Y1tIWPl752tBJm6n@mdroper-desk1.amr.corp.intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221027221554.2638087-4-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|MW4PR11MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: f53d8e73-b3d2-4740-15b6-08dab892178c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xe0QNniPy006FDK3hNjaaTXPnNZxT8/aCdGCYh6n+7GrkGF5Yp90s94GaCpmSjXU8bbHcj1OqtmAaK9S2nlV1++0QgkL7+c97WiH0I4iRgg7l/u+M66erm1QQcVFIXIggNGutgqGWnPn5kQpJHljDw4ckdK4f61UyljjsYL5HRopMN+WHnpR/Pk5a92zcH6n9cSvbeYgnSeUI5crFaRKmM2o/+hKrDzTIoy8OeShnvN01y84A63dDGDHXm6lJ34yZ9tY2CrSDmxt6B6HaYKD4jmEcVdfS7OzlNtPa2Bi3ZHM4zAnW1d6KBlVNCUmpJyB/naBWKCHfx4I9VTKK0gulgN/D8vjVCgvA0mJnjrvb2w0aVEhfRDyXXPEiu4MG/LOaT2JM4dJMtypTTsLXwHWqDhqXljUDDHU66TNr+O2sZ+grulq7ogk8UlOMuVeKZi5uzwSvnX91c/wMc3Aiwf2EJHG++p4e7Bm0OWhCUyyK7G1WOKn8Hg9kA8tb4++igMV/8uVtM4VYROXfdqxS6mYu2XIQ7SvQGoO5teWGvzwKM0Rn9k/bPB6cbIdC1HHAObRJ5ByzPTp8Wct/nWU9i/WyONgPIK9GPYNhXJ93XeqIc4IFYs44wLscGEdOlY7NjPju/BAPXkn9RRsyTHKhvFnlh74+c2UFRbeYsAPaSZC5MHgiQHK5/6GTFvjXf2KhShWGHaK9JvV9/byMzZp2Y66yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(4326008)(66556008)(8676002)(6506007)(8936002)(66946007)(6862004)(316002)(26005)(66476007)(6636002)(41300700001)(83380400001)(82960400001)(6512007)(86362001)(38100700002)(5660300002)(6486002)(2906002)(186003)(478600001)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Myg2qifUwoJ4924w/ytxMXBEdzs8KOPy5zCLejfnBZqn0finRL1iM32VKNdG?=
 =?us-ascii?Q?SH4XH7Nd61PZa8UcTNoHL8RLjvyL6xzKjqVF9zvX5x3Wd6fPXbjeG0vbH5wB?=
 =?us-ascii?Q?tYQNItnl/DRxdLXuGUst4SE1iZ0L2Wq/Cyz4dJGvaAOn4zFIAiAfqbKzMtS7?=
 =?us-ascii?Q?vpC4xC99aSBIEvFa9mckweAZVk/mKeIRfNDZ21sY+3ppex4thOYj70AlQ4G9?=
 =?us-ascii?Q?KGVqGrSZs2OUA2dYKxUs+wiuIvLi5nGH3stu3dQNFMvYzFPwvvpjJHNaPJgS?=
 =?us-ascii?Q?EOWsE3jRJMghH2D7j+F6v2AxD1qa1X5vszrqRfXcjIyO77xAFb+T6OeREzZ4?=
 =?us-ascii?Q?EUBrkN6Q7hqWpWDhbGTvBkaHsSTJtHUZmb2/Hww7MvnJV3q0OXACzxwsxZYy?=
 =?us-ascii?Q?wEnERa1UzwCYU5mUXXp1Fl6Ao0K50HeJ6UxUm3QshL3RrG2O4yLDPF8Ha0NH?=
 =?us-ascii?Q?VEJ0WmtJZqxuz7Sq/SJAsrlSAFdusXICyv/kqWFskcd2UQa39kydiW7N9Yq+?=
 =?us-ascii?Q?MNo68e4Ljsa6tXOiYgWsFxInLpliP34FUyae/vk3/CtTV97Xu/jBUyTpafza?=
 =?us-ascii?Q?8AucZUucGul1YTwKtIUAgrLls61qe90XkPiNecXs3AndiFsxEb7xNnbhUIi6?=
 =?us-ascii?Q?Cxw3jrm1OkaYPsZn0nHC8QvZYxT/faseaEvtII23uZBwLSlQubbpNQeYTkJX?=
 =?us-ascii?Q?rayX3MUYWWmtvfrNl78fm6JinGw88oggWTEx4FPUJhpcYOD6o8FRzpvHZO+0?=
 =?us-ascii?Q?bnwbDw28CYZkOWqTsfHM+kmeq53h+E0QVkcY7P49O9IpG6cQqKLjLTHhp8cl?=
 =?us-ascii?Q?7P7GvGDPFNX9gXeT43ocdPGuM0AuOH1mjOe6JO9sdH+4rXdqDUNhIAFIIFfB?=
 =?us-ascii?Q?NUsr8JGhxHDrENbAlz/HkF6TjK+RnE3N84lUn7vo87WX7/jEKL35nihOU+uR?=
 =?us-ascii?Q?QdNq0SXDCKo6dd9Vjsl63/7AIZV3D022ZZejJpSj6PCEim++MRbjFEIo8OfM?=
 =?us-ascii?Q?yCDn/cDTtlJw9Ok1etrJM6coSOtA+8ZhaMusA1oolRTKMWnAQzR/Ef/bkdTL?=
 =?us-ascii?Q?z3GrVHhFfqGGFJ7g05HmvTzlYPtdDD9BbXd5ZgihqWnOA4I8Mhb/k6MFFLG8?=
 =?us-ascii?Q?yZAi2VQQ/0OO5Pxqhb4wjGJMNY+K3/gdq5XNbWqYXof/Kd5IbZXB+GuB/NpV?=
 =?us-ascii?Q?A2nKRlOo14UjInb4wEj3WeOS4D4aLFaE/B7SzIH4Fnh7RBi1qdlD7FlRAPqx?=
 =?us-ascii?Q?7Pm/+8bprOGBZijwdRtjzhPBTQEKbTTzgsHLLQyAQ/ufqBOPcBizsxyEZjHx?=
 =?us-ascii?Q?o6tktgjrk9eeE6GsNPOCIx21k7Qfyat2gVFT63cTlnQjEEz5FCOu9SGYUkq0?=
 =?us-ascii?Q?DnUckOimuSMYzTb0kq4itPXRpZE+5hz7+L2q3dhMNoHWM4PC6Kuyi/0mgIVT?=
 =?us-ascii?Q?Gt6aXuC45dnAD7IDXMQDH7tucJwubQxmdobf/ZALMQemt35gRaoONz7YK37w?=
 =?us-ascii?Q?4tuHQwNpCBBKFfbTK+xnjNKKCN3PjzU00PDMwM+rsJ+th13INeG7xBWMjsM5?=
 =?us-ascii?Q?LiiSMSLj9Ju5U9d8Xo22iiTp/Sp3YyydndKFi2z0sXl6voTmsNPqyiLVAMvW?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f53d8e73-b3d2-4740-15b6-08dab892178c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 03:11:22.8638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVLLDcFp/0VL4nPvCsRLQzodbIxvjrTN0H94hA4cF2RgZF31/oYdPIkDAIkjXQy5XNAVjdP2s+cWFKPjnixvXaLpvLNom04AyljXy6P07nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 03:15:52PM -0700, Daniele Ceraolo Spurio wrote:
> The GSC CS re-uses the same interrupt bits that the GSC used in older
> platforms. This means that we can now have an engine interrupt coming
> out of OTHER_CLASS, so we need to handle that appropriately.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c | 78 ++++++++++++++------------
>  1 file changed, 43 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index f26882fdc24c..34ff1ee7e931 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -81,35 +81,27 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
>  		  instance, iir);
>  }
>  
> -static void
> -gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
> -			 const u8 instance, const u16 iir)
> +static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
>  {
> -	struct intel_engine_cs *engine;
> -
> -	/*
> -	 * Platforms with standalone media have their media engines in another
> -	 * GT.
> -	 */
> -	if (MEDIA_VER(gt->i915) >= 13 &&
> -	    (class == VIDEO_DECODE_CLASS || class == VIDEO_ENHANCEMENT_CLASS)) {
> -		if (!gt->i915->media_gt)
> -			goto err;
> +	struct intel_gt *media_gt = gt->i915->media_gt;
>  
> -		gt = gt->i915->media_gt;
> +	/* we expect the non-media gt to be passed in */
> +	GEM_BUG_ON(gt == media_gt);
> +
> +	if (!media_gt)
> +		return gt;
> +
> +	switch (class) {
> +	case VIDEO_DECODE_CLASS:
> +	case VIDEO_ENHANCEMENT_CLASS:
> +		return media_gt;
> +	case OTHER_CLASS:
> +		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
> +			return media_gt;
> +		fallthrough;
> +	default:
> +		return gt;
>  	}
> -
> -	if (instance <= MAX_ENGINE_INSTANCE)
> -		engine = gt->engine_class[class][instance];
> -	else
> -		engine = NULL;
> -
> -	if (likely(engine))
> -		return intel_engine_cs_irq(engine, iir);
> -
> -err:
> -	WARN_ONCE(1, "unhandled engine interrupt class=0x%x, instance=0x%x\n",
> -		  class, instance);
>  }
>  
>  static void
> @@ -118,12 +110,24 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
>  	const u8 class = GEN11_INTR_ENGINE_CLASS(identity);
>  	const u8 instance = GEN11_INTR_ENGINE_INSTANCE(identity);
>  	const u16 intr = GEN11_INTR_ENGINE_INTR(identity);
> +	struct intel_engine_cs *engine;
>  
>  	if (unlikely(!intr))
>  		return;
>  
> -	if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
> -		return gen11_engine_irq_handler(gt, class, instance, intr);
> +	/*
> +	 * Platforms with standalone media have the media and GSC engines in
> +	 * another GT.
> +	 */
> +	gt = pick_gt(gt, class, instance);
> +
> +	if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE)
> +		engine = gt->engine_class[class][instance];
> +	else
> +		engine = NULL;
> +
> +	if (engine)
> +		return intel_engine_cs_irq(engine, intr);
>  
>  	if (class == OTHER_CLASS)
>  		return gen11_other_irq_handler(gt, instance, intr);
> @@ -206,7 +210,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>  	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE,	  0);
>  	if (CCS_MASK(gt))
>  		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, 0);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
>  		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, 0);
>  
>  	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
> @@ -233,7 +237,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>  		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~0);
>  	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
>  		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~0);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
>  		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~0);
>  
>  	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
> @@ -249,7 +253,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  {
>  	struct intel_uncore *uncore = gt->uncore;
>  	u32 irqs = GT_RENDER_USER_INTERRUPT;
> -	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
> +	u32 gsc_mask = 0;
>  	u32 dmask;
>  	u32 smask;
>  
> @@ -261,6 +265,11 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  	dmask = irqs << 16 | irqs;
>  	smask = irqs << 16;
>  
> +	if (HAS_ENGINE(gt, GSC0))
> +		gsc_mask = irqs;
> +	else if (HAS_HECI_GSC(gt->i915))
> +		gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
> +
>  	BUILD_BUG_ON(irqs & 0xffff0000);
>  
>  	/* Enable RCS, BCS, VCS and VECS class interrupts. */
> @@ -268,9 +277,8 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask);
>  	if (CCS_MASK(gt))
>  		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
> -	if (HAS_HECI_GSC(gt->i915))
> -		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE,
> -				   gsc_mask);
> +	if (gsc_mask)
> +		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, gsc_mask);
>  
>  	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>  	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
> @@ -296,7 +304,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~dmask);
>  	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
>  		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (gsc_mask)
>  		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>  
>  	/*
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
