Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD2B610687
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 01:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC6410E737;
	Thu, 27 Oct 2022 23:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E89910E737;
 Thu, 27 Oct 2022 23:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666914609; x=1698450609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fw0nTHb82AnwBZGOLpHZHaLVgPzloEFpv+Q2fHz5KkA=;
 b=nCfypIqC0GS8APCGIJAp/C0E3H/FTdqUuveDic2iMl66YorfoCgVRmfd
 y62VjQ0bN3ceNJOfj+fCp+tGW6j9Xpg4cjdUwOp+ekvAUe6lEiezrMIQv
 4HOr3+yxguFPyeqNmUud+/yWsmqZ4BcAW//v9LrBNqmhnriYu6chjeFEG
 yiBoG12TXQcd4vWsHi8cTUr0yFJxxdxJAECW5FiA0FF/tqySZzzZJ2UPR
 Ju7b+k9goENCsAGM1pGR7Mm+wnGY3mO7lmz+fa0o63XHfr5NGoG3tqemf
 jFGs/+Za3zGryIJihyP9QzSsoZ/Gef8rzzBdYUwQYR4Dom3VxjAPcRI/U A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="308358877"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="308358877"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 16:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="701538365"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="701538365"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2022 16:50:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 16:50:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 16:50:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 16:50:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 16:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFb6kowX4HjXxcjjEvqbE8AzA3mQ9PCb74FSeFik2luKsEXgPe0TFb1/0GlnaVO0OunQk97X6BgyC3VZR/f2rfgNbaZmV7Wzi5+09tt+nBTgK8AYf4uSwl9nDkx1+vxTs2DzkG4eAVqP3Zbn/oHJPp77ezLRHJDUviT3GuX33w3GlBctV4IPOyopd9o9AZL2eTeuttCnl4LM2N1eiYHYfQq6H5AtIGhEH4vxwHMz0+uWbwuCvyTUpUm39aHEf88Ls3W9gHb03A10IuaxuWIaHaaFel5IwYlMcmo4tLqOuYLUHvauB2kxhm3zwf09aPMt7oUAPxt/XaSFpZ7gNvUAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiJkIOI8pMKm20Xl1OrPlaxT4BJq4L0ORNUNy6o2dgM=;
 b=KZyv8nLCURueQNBzoCJqCkj2LPTJDIzIQpWicngis3iMb6aixzU2wsN90s1u6kAlf+CW/wl21ofE6ZNCap6SNy5MG80vRlMU4lBL/h//Fj/4k7VZLeuvWh9zDSCDTLwb0/S13Uc9Abpc6NisN064XnTW/OgoJaXrh2Lv/EZ+ybuOlgfpuf5BcLG20dachdd34Y++vWwqaoOjPQoZTFAZBmbFyJjpYRi6Y1kN2Br+Gkff4NmOauIkHlt3M9HFu0plw1BjqFigVNkLsySNsRgGARSr0OR4jrTkdt64FoSNqX88lbpTHjk5IrkHOuI7+NBkT1GSKfImJo9j6VIX+IJZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 23:50:05 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57%5]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 23:50:04 +0000
Date: Thu, 27 Oct 2022 16:50:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 2/5] drm/i915/mtl: pass the GSC CS info to the GuC
Message-ID: <Y1sZKrd5YlpHMNhq@mdroper-desk1.amr.corp.intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221027221554.2638087-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM8PR11MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6116cd-fb19-4b1e-8d01-08dab875f852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NbkbsaeqmDp7lDRvI/bI6jUwJRw+r2lajd+kRSwJauM9L2AQ/WCW6yiJtvV4UbKwAi9X4kAo7vSph7ktg2f+PZhqbj2D5WQLLSk7JneTslKXM7uFyNMUNriQRq5Hmfk59TnXMhfTKnmHueHwW8n+u4t0i6uOR6Idx4CX3j5GEo3h/p7JaO8urbCOfTIFsURB3RQKeMS0D0mHD/6tEH9k0y50UgETsN6uc2RiNADPhpA9VMcEykvS2aIG28SQ/3xFkHz/X1UY0p3DOOaAXy3GZ+FTObBaa+QWyMhkKNKk68qLOSzbK+5+qjMc1WrZL4flhMC0iK/kSiW/x6ln3jup/ibRb+JrjnQWXzq60qO/BMqeY9iHQKbLQaCkfV0RAbatjzo38Dl6VCdanzYsbSZFRpeHXtO5Ue4XFLQTtc/lXrAMBzbFuu1hvu4FdX3AAcv/CHJmFueopgjO0xRTxC1m7fGYGwxrlQPICH2+y19f+ALypqJr6HvjRLflIz4mE828eTkL1umKj5SqL5zunp2reNV8qTf6BS3Efv0MAw75XopJZAE2dcN4vOMhOyr1Q+qpI85mV8AXL7PS7sf11sSSmuc4nb9RAvBYpx+5uyVs0Cu9myxrFcslcl0s4qPy1DaJeIt6VlLVRV+GXRf8ggdk/gM0k/WzbW9pftTNl0ygcL55NIaA7NtqIc2o+iEOn3pCTCuHdPOk2T8EkDxHdKj2EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199015)(6512007)(5660300002)(6862004)(26005)(86362001)(6486002)(6506007)(83380400001)(186003)(38100700002)(478600001)(82960400001)(2906002)(8936002)(8676002)(4326008)(450100002)(41300700001)(6636002)(316002)(66556008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v6DNDX7qHUA2pZ3khB9dTsE+yp9FGPW3Bun+Iavyj9TpzPXTwv0TL8ASnpjp?=
 =?us-ascii?Q?xtXa4Gcxg1g8mrz4LDbMxHFzZG4Nli74I/ynMH5mk7VdrO57DTgVh545hGwS?=
 =?us-ascii?Q?ZaSyuUhSXZ9rgHYFYGKaVoCjsribD6ivthvlfy85KaGLZvmIH4Fxqzwr/qfW?=
 =?us-ascii?Q?CtvyvS60aYqYXvE3zTBHOypEisF5PNZuiUZLsf4gm7ZYMM/F4AMLE92GWJOJ?=
 =?us-ascii?Q?zA6ed0q6xYEyrVKIPqR79NwWDPGEM6plGVijxh1q/B28dM5X1gtu1lLBkaTP?=
 =?us-ascii?Q?T/FHwHPnuQWHse9gReJMax8bNrVDjuGEuIAK99t4qF9CXzb4BYp4YqtVBS9s?=
 =?us-ascii?Q?1nNn5g5YZJFaU6zT6tDY+MkPl9OvrYinmEFKO51tmNINCfEzAhEEONBl4VCp?=
 =?us-ascii?Q?tHP208UTLN2Bs1tAhKEnv78LzMJ0j8+j2EOSNKkHijplN6j69hjwdW++BmVQ?=
 =?us-ascii?Q?pGHZauzVU740K9yQqJW7ZG1Xpiqv72EyyFVdU5uL1abgz2sdOJXGxnD0I++l?=
 =?us-ascii?Q?4qmtLtlHKxw4Tzx6XoGDDDiLSZbES0ZBjGSBI0dzwLtnx5Cb8tPor3sjUJ2N?=
 =?us-ascii?Q?PLSE5NYxT9O1opKuKZ3ujs1c13sz3tF2C4lMDHUaAV8zO6MRrW5LebiTC9ZR?=
 =?us-ascii?Q?mMF+QvBXWtYbKlypCFfKkryYQm5vbqBAcTO2chKr86oTRbKAclJAfb0vX97Q?=
 =?us-ascii?Q?FQEeNaPVdG5Lufx3zaSQFm7p965vDh2oxRiOKfJJ/JGzGPZJJBt13G9W9eOH?=
 =?us-ascii?Q?n4A9ecTkv2Cl6h/gexaYjW9joK6hAz4T7KIWLFsByXL/59KE2ILfWmCjws2Z?=
 =?us-ascii?Q?AvG4MbirZgMfEz3EwU1TJztVLgsTlnX77zCRn/YZOEkwNkUF5+OlDje47cMx?=
 =?us-ascii?Q?nGVjQGKVgeyp+yJa/1LP6PrcJ9DULFzM7ieaYmejorEZnxgYt261+fKpbkDB?=
 =?us-ascii?Q?Ar/rII5JYqe+qusYgi/PlyCi406fVkmSB6SYmfQJl+gudByVOhjAWShkga33?=
 =?us-ascii?Q?1hHydJPaMSoUV9YmkIGIv5cMbdLcgKGWXNQtltgM3QHPC0512w2Gnv0ucmhY?=
 =?us-ascii?Q?ao/0tUnsSJ9nxrnDBkHnR2+b8wjvf424kf1InjH1r4SH3z3Po+0Sz7/c8F+g?=
 =?us-ascii?Q?tLkqL4M/c6mrbXrw/+5KtPUyYq3Huq00aUKryGuIWhcrA/ZLcObctuktaI1Q?=
 =?us-ascii?Q?8MuqP4pPja8BiY+q/0yq9FheI4vycJ/2VAAuKgsJ7i8UT4NOiBYOjLPSLd3S?=
 =?us-ascii?Q?A5aY7bFap4r/2HQghtzfocaZCUBi/g8NOaUstxmEspP/qEWr1B/9Gjkyou/Y?=
 =?us-ascii?Q?xKqIXWLumsERi/tnOvj8uY2LzXkJFo9l2kSCdi84QlpyqjNQcqLri8K+UfS0?=
 =?us-ascii?Q?q2ZGqOj4KvICMfLtVQI4zTpQDLZvyO+c/fpbIoQ76WlnDdbUCgoPyL6Wq3XF?=
 =?us-ascii?Q?M7rios6K11zSuErhEL8nIhFKhYiUiRbihDifcJPAwQw1q4gUMDWS6GYQjnk6?=
 =?us-ascii?Q?OvLp5lj46R4aM/xJe8Julob2LBc54ce+zie3/n8uiRiNt0f6n9ZdzhcQ3jS6?=
 =?us-ascii?Q?6sLOqZL5+CtMRfFI7GGNlCt+yGKOYDijmun6lP/e8b+slBjJJAsKYg9oW+t3?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6116cd-fb19-4b1e-8d01-08dab875f852
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 23:50:04.5846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+xVjQaRv8IFcU8mGdcx4M//+/PmPqQIrJko1CmF0D3uMlNnApFN8+z9ECVUrx03EX638M1R/KcFKwZtXC1z942NbNm204TbwtAfOn7PoH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5624
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

On Thu, Oct 27, 2022 at 03:15:51PM -0700, Daniele Ceraolo Spurio wrote:
> We need to tell the GuC that the GSC CS is there. The GuC interface
> swaps COMPUTE and OTHER class, so we also need to handle that.

When I first read the second sentence here, I thought you were saying
that the GuC interface had changed and redefined its own enums, but
that's not the case.  I think you just meant that the FOO_CLASS and
GUC_FOO_CLASS enums are nearly the same except that they order COMPUTE
and OTHER classes differently.  Honestly I think that's already pretty
clear from the existing values and mapping tables, even before this
patch, so I'd just leave this sentence off to avoid confusion.

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 11 +++++------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  7 +++++--
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 34ef4f36e660..63e3d98788bd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -478,6 +478,11 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
>  	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], BCS_MASK(gt));
>  	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));
>  	info_map_write(info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS], VEBOX_MASK(gt));
> +
> +	/* The GSC engine is an instance (6) of OTHER_CLASS */
> +	if (gt->engine[GSC0])
> +		info_map_write(info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS],
> +			       BIT(gt->engine[GSC0]->instance));
>  }
>  
>  #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
> @@ -519,9 +524,6 @@ static int guc_prep_golden_context(struct intel_guc *guc)
>  	}
>  
>  	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
> -		if (engine_class == OTHER_CLASS)
> -			continue;
> -
>  		guc_class = engine_class_to_guc_class(engine_class);
>  
>  		if (!info_map_read(&info_map, engine_enabled_masks[guc_class]))
> @@ -599,9 +601,6 @@ static void guc_init_golden_context(struct intel_guc *guc)
>  	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
>  
>  	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
> -		if (engine_class == OTHER_CLASS)
> -			continue;
> -
>  		guc_class = engine_class_to_guc_class(engine_class);
>  		if (!ads_blob_read(guc, system_info.engine_enabled_masks[guc_class]))
>  			continue;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 968ebd79dce7..4ae5fc2f6002 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -47,7 +47,8 @@
>  #define GUC_VIDEOENHANCE_CLASS		2
>  #define GUC_BLITTER_CLASS		3
>  #define GUC_COMPUTE_CLASS		4
> -#define GUC_LAST_ENGINE_CLASS		GUC_COMPUTE_CLASS
> +#define GUC_GSC_OTHER_CLASS		5
> +#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
>  #define GUC_MAX_ENGINE_CLASSES		16
>  #define GUC_MAX_INSTANCES_PER_CLASS	32
>  
> @@ -169,6 +170,7 @@ static u8 engine_class_guc_class_map[] = {
>  	[COPY_ENGINE_CLASS]       = GUC_BLITTER_CLASS,
>  	[VIDEO_DECODE_CLASS]      = GUC_VIDEO_CLASS,
>  	[VIDEO_ENHANCEMENT_CLASS] = GUC_VIDEOENHANCE_CLASS,
> +	[OTHER_CLASS]             = GUC_GSC_OTHER_CLASS,
>  	[COMPUTE_CLASS]           = GUC_COMPUTE_CLASS,
>  };
>  
> @@ -178,12 +180,13 @@ static u8 guc_class_engine_class_map[] = {
>  	[GUC_VIDEO_CLASS]        = VIDEO_DECODE_CLASS,
>  	[GUC_VIDEOENHANCE_CLASS] = VIDEO_ENHANCEMENT_CLASS,
>  	[GUC_COMPUTE_CLASS]      = COMPUTE_CLASS,
> +	[GUC_GSC_OTHER_CLASS]    = OTHER_CLASS,
>  };
>  
>  static inline u8 engine_class_to_guc_class(u8 class)
>  {
>  	BUILD_BUG_ON(ARRAY_SIZE(engine_class_guc_class_map) != MAX_ENGINE_CLASS + 1);
> -	GEM_BUG_ON(class > MAX_ENGINE_CLASS || class == OTHER_CLASS);
> +	GEM_BUG_ON(class > MAX_ENGINE_CLASS);
>  
>  	return engine_class_guc_class_map[class];
>  }
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
