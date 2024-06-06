Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D438FF3B0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 19:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A8310EA3F;
	Thu,  6 Jun 2024 17:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hgc8YqqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BD110EA37;
 Thu,  6 Jun 2024 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717694857; x=1749230857;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RcDL/Bcd2pt8iHzJpuMiHwN3tIAqOLxq7UNjs9B9kGM=;
 b=Hgc8YqqEtwoMBgKejJj9+PLXDBgdtZ8x4EFucgd4lG9WaY6nwOa0L7Xq
 ihL0fHrscIgs5jf0QKCt0ZocKd7LAaIjStAzJtTz8svLlTPXZyumPSj2a
 ywER68GfwPlBwKh+NQuP//q3jC9St+mM93miY0vuZaAp/3bkmMap5kWLX
 zztecK01a6Ur7mFyrlPAie2UhCHjiwEn/J4thY2Be4qbrALZXib2Tb+Xf
 ouotAcZ98Tnn6hf68T3Ff0ppRoCF3tw4T8Qmwm7CA09pqMhBZkx7uTYI4
 5AGC/BLd1DV29dAXHEMLbck/3HkWfhJhVv/w5+NOmNLf2gcwIpQ5KyOHS w==;
X-CSE-ConnectionGUID: QoS90eEpRf+CZuiNhiuxoA==
X-CSE-MsgGUID: 33HyCYblRe+IYTxe+s51kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14566341"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14566341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:27:31 -0700
X-CSE-ConnectionGUID: 0k7aWFWWRlS3MCQKp3TmrA==
X-CSE-MsgGUID: DI4eCiCSSYWjt4am8FnNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38050040"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 10:27:30 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:27:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 10:27:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:27:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoHW6QSVmu+HvkIKxtCmziWtKQE+R2wvvlvrZIqEvOS7aZf9+geh0F73YDpSofpqRTv7N35PEo4fF7gZteysjrQYzgs839QUBfSkBftLn8CJGrfHRr3l3U50yBwsXTLEEYP+xTJ5OB2CCb8ctogW7tRkxS3GTvazStPm6AXvDUa5v+fm7BnqN+46670WZZAOsXI1sgG2j3eFJOQwmYd5Ec2JAocoEgdg5SoThjlOPiGG/gjrdKiZypcb2mjKk7rIoHlBv0aGFdlh3HUYdynylfwT4sHgom4RpFddXJJo4r9HbnvcvjUzMcZdaQ1MR8vJH7LQCYUlTWxCYfIDpCwLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y70e+POca3M49zXxsEtXHNUH394OyXDmve4GfFi0PAk=;
 b=GJiqWeF45uMVXawfuifH2+5VIIw3jJwvrSfWJtbZku6JWtCN3Pp5kEF/m4tuS59jQvPUnRAhn3ScnijtE948bN3HE5SOyv24jlv4PFUytW4qYm3DfuhzmPkU7/VT5qtepl79V88xdqzpbWHifoUugHcn2HUr+/6DTkRHXrGJZ5BwiD1E78QMpiDNqpcEx17ErIMf8JnaQRvPaPLPSH5MzmKDGtih6X/2NqRlCqJJqpozj4/wEacN8l2gBlDEUSxnWE6NEivskD1nOi7a5WBkf8r5mVztE/bSE3+eycSkNXKEAImK+BI+qycHPK5QROzkNrbl9l5xbz/vXOzZ1nwFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 17:27:28 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 17:27:28 +0000
Date: Thu, 6 Jun 2024 13:27:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: Add DRM-managed drm_mm_init()
Message-ID: <ZmHxfnQKDlO516tK@intel.com>
References: <20240524133518.976-1-michal.wajdeczko@intel.com>
 <20240524133518.976-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240524133518.976-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4cdb19-8546-4a94-a6c3-08dc864df067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iXDeH8yBgzOF1L4Jc6YLdZsorzTBAN0lJvy9XQ/UwbJthu0JMcNCKlmnrnAH?=
 =?us-ascii?Q?Uqh37GBekyNf2zWF7uhBoONmOpnvl1AemSTFRpmkXJ/KoYqte8GMWHh8tFz7?=
 =?us-ascii?Q?fsXUAGavCQQ+DL+vbNEzEV3k/xaB3ShANaLXUVr4xK7get0HAs4rpQyamtKm?=
 =?us-ascii?Q?a09ZPcX9Kr20eqvIE2FKjACMRS1Zzku5UBwgtISXsbBrTP1v4GO9EtSTzWed?=
 =?us-ascii?Q?Y1HMdwV3y3+37bsBhcUOeQo4QEbALb8SuIu8oJ+Y8E11pABKsbLRMUn4uMpI?=
 =?us-ascii?Q?J+dxnCyZ+kKif9ag8GSwHuvU3BrcnUFmY8gKKIzXd2LbmaqJV1OThMHKLAUV?=
 =?us-ascii?Q?96nmeJ+zu64+Pbe3QSb0gClv/IzgstfUQfiQoivYwauFA2hsT2Cs7xi7nnhb?=
 =?us-ascii?Q?wQEIvNcc/gfPt/r5+qIJOD03cWLF90GM037EeQyjNQpYxz6ur+JgpQB+bWZH?=
 =?us-ascii?Q?46WYjtKRATc7Dc+x1jlCVeO9XDlAkGvqmvXZ/Op+0aem+7uML99JkA9a2xPO?=
 =?us-ascii?Q?Dm3LyeRPNpxxMtqvixbcPbnCw6wOZbsfAazUDucCg0jDgGki7pQfx8RJ7cvs?=
 =?us-ascii?Q?hWF/NBcIeKUw06G/CG3hryguD/oddlEN00oJkVa8OCKnmvVyEjadXsoTs4VN?=
 =?us-ascii?Q?je459GvfdwhTB97v300roJXztd0FzZlnfzDAMb/6lXFi2QMndVt2jpYGNHCB?=
 =?us-ascii?Q?fIfL9hCUwIlmnk2ZfBEbdpTCI6amajoEJQirZhQ0De2J3XzN7+S1KBnKK5VS?=
 =?us-ascii?Q?VqLExF6sp0rYPqX/ZWatN82q54ggmugwsmVUHM6WXcE/CCTTRcPvJxdIXSEa?=
 =?us-ascii?Q?CNAggimkdKi18/v7Un04s6t5DILODOKQ7xnRiNZgvfiZUa4bfEiOQ4upyL2B?=
 =?us-ascii?Q?fi1SrGW2Z/IXPBvTvxdNZWE99uY6VYrRv8l+AestH3n5UMM7U4sIdp1M757/?=
 =?us-ascii?Q?VG27cUfzbGALkx6uDRHCbLKxniXH7rxo5txWgitnnil9h3iZ9fi9tYNZ6sYH?=
 =?us-ascii?Q?PWyv83/nyopQYCFrEgJFkqcjrT38k7Jh8XrI1ZAS8Z2Jaq7vxlcp5wYxV/XD?=
 =?us-ascii?Q?1dC/FbthEXIdF49ewC2lFbwchWWw/3cuIcjD9iL3EecvI1yJMyfP1/dEanpe?=
 =?us-ascii?Q?rmHAkqzkvCi/OxndCi/8wTzixjundZuyl+RJNoxzfj9fCR1zp7yyvSv4mPlQ?=
 =?us-ascii?Q?hlznXl5wq6+2OI+U3/U7ynzpnKp7kySz27U6lWqM1GB/JBvsgFlQ9CdahxFM?=
 =?us-ascii?Q?tvF7QBaoxRPqAmD9yUhpY6hqsvUUeup3tHYp7hBSE4bGcsIeIcKlPJ3sbnYI?=
 =?us-ascii?Q?rpOMjBvkneObpxiviokBowhT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JqWVHwgovi+MxeiWmQDxiVXFwzdR/TfG8kUHfWCQ1qn4NytGWCiETuLqnrSa?=
 =?us-ascii?Q?JCiv98NY3PhlIQT5UsyUP9ClziaWkPJPXjn2s75dWwk0CgcxeLaqHQpYdyTN?=
 =?us-ascii?Q?3fAcg4b1bUTHBTCKhnr6UMcRX7BrRFvA3V3T4xkvfihWNS7mte/2suRelCbt?=
 =?us-ascii?Q?6Gj4GPYXH3arAtbp1CudpHDHz42Gw3TflB04QcHC0n9LZOQdq7/C2yVu0Vkm?=
 =?us-ascii?Q?ChFleDpprJ+Cug+8RximKW1cm2ZHTaAdspsE8RU8hPbXhoCgOpQ1JZrFSIS9?=
 =?us-ascii?Q?aGtJytkaXu5ZHrBcTtOcMMdPeOYd5O+KxC2kdZYyTUyA4f19Sw08yXIIJZ+d?=
 =?us-ascii?Q?HRZ6cDxKqSVfX6AxFJDYPxwYM3RIjwu9eIIUYE0oFbxGEC5O/muK7WVRZqGR?=
 =?us-ascii?Q?UZXRyzODRxNNKQjBJhIjoNRsoxpz4k18glB3cmhBYCjRz1agbPZ3Y75HZnMo?=
 =?us-ascii?Q?qP/tFSAJ8zrXMYhTfNORdK/XscqEjCzPNXgVBU1R18+nV+8WE6O98VUyNnbj?=
 =?us-ascii?Q?JuIlPzarvRxcwKIobO0m17LYpeVW20ktI+KliduP1R5IV5jBRzzMp1WZc+hb?=
 =?us-ascii?Q?KRz7k2bksXn9m/lrYeBjqvZa9oj3Q498Mk43TTeDYl1rITUCyL5TSTxB8b5Y?=
 =?us-ascii?Q?drrOfGf8FOOM11xlGV4y4TH5w3YZb41U61fHefxEHpCQzwfoiGsbIpFEnauy?=
 =?us-ascii?Q?LXNiFUIIlUvpbQ3nKE5g9Glg6xKKO2yh3OnrhWPjruUU5TH/V96Fbw5MYAkq?=
 =?us-ascii?Q?1fTq1wb9FB+O+I8EIraiTx0Z9i80pLxryjCEKB4XZwndJcMhjkbch6AHNlUT?=
 =?us-ascii?Q?Os8oubowaP3pY1GbP1QW6F5IsK45gUnwn/U90CF7X9Iz48WDgVmT8mM7lTaQ?=
 =?us-ascii?Q?5GFHOyW0RKpLNJmBJDfvbER7OqvX4n6q2xoHng79WE619rxwKDe533y5gAiG?=
 =?us-ascii?Q?6svlocqIgERlAVa6sRjwZExLVnTTMzL/SiUDhUr0UFZMVfup3NrvJQcJFFNW?=
 =?us-ascii?Q?96MOEo+yJz5AAiX2kISK663LZXgAJfcgOtx8lVxP+UzYbHLnv4sy8qC2KnXk?=
 =?us-ascii?Q?eOprW+Wjlr+ADyqV68/sXHE01cloYaemjYYq8DFgs7kUJwkF0mwtfj+t5yS7?=
 =?us-ascii?Q?oavxcR19S51pchXmbbZ+EzZkvplsGZPMlR8W01nUd/hHQcnQfEMOtVUBLAj+?=
 =?us-ascii?Q?oKs8fTIyB11TtBMsiFdHP86ElCInkCTSdX2z2rP37fQtvLI8Wrlgng1SAYnJ?=
 =?us-ascii?Q?Nd5MpuWnEnucqr/b9hjEAQ8gMjpLGuc7yqsIhAd95zN2x21bwzmtPO5cWvuY?=
 =?us-ascii?Q?3cm5L2l8wI31zLRoBLWJ++Ext5nqSHq/0EW7h+1OYiymDln4uv7ZRiEvYM4D?=
 =?us-ascii?Q?sGfuf5dBSO0YjqeTAuWpwIEbVfPNefD/Be9Z2SSnrxuBS7z4WeouFKOqrN4I?=
 =?us-ascii?Q?Uum2N6bfNW545vyy854dT10yBfFQm7L5qEylBA4xDjuUAV6GFbfAt3S8GBMe?=
 =?us-ascii?Q?23zwU90rJa9wJRc7Kfqu2G5kNvQ5kfQ3WBZo04JJTJKS0j/WxqZbGIiHxLXS?=
 =?us-ascii?Q?eu6UJ/5tHfZXJV4PKD+eM7FGSV2SoiJDXdE2fS6j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4cdb19-8546-4a94-a6c3-08dc864df067
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 17:27:28.5444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0n9bzHPSCnCyZhP0I34rtIHMohMwWLMrhu9OKK9s+PqhK6W2cQoLH6L8avWCHMhn6x2nCPqrQ1LktSxbqkB3Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 24, 2024 at 03:35:17PM +0200, Michal Wajdeczko wrote:
> Add drmm_mm_init(), a helper that provides managed allocator cleanup.
> The allocator will be cleaned up with the final reference of the DRM
> device.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_managed.c | 27 +++++++++++++++++++++++++++
>  include/drm/drm_managed.h     |  3 +++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 7646f67bda4e..2fb9656bada3 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -13,6 +13,7 @@
>  #include <linux/spinlock.h>
>  
>  #include <drm/drm_device.h>
> +#include <drm/drm_mm.h>
>  #include <drm/drm_print.h>
>  
>  #include "drm_internal.h"
> @@ -310,3 +311,29 @@ void __drmm_mutex_release(struct drm_device *dev, void *res)
>  	mutex_destroy(lock);
>  }
>  EXPORT_SYMBOL(__drmm_mutex_release);
> +
> +static void __drmm_mm_takedown(struct drm_device *dev, void *res)
> +{
> +	struct drm_mm *mm = res;
> +
> +	drm_mm_takedown(mm);
> +}
> +
> +/**
> + * drmm_mm_init - &drm_device managed drm_mm_init()
> + * @dev: DRM device
> + * @mm: the drm_mm structure to initialize
> + * @start: start of the range managed by @mm
> + * @size: end of the range managed by @mm
> + *
> + * This is a &drm_device managed version of drm_mm_init().
> + * The initialized allocator will be cleaned up on the final drm_dev_put().
> + *
> + * Return: 0 on success, or a negative errno code otherwise.
> + */
> +int drmm_mm_init(struct drm_device *dev, struct drm_mm *mm, u64 start, u64 size)
> +{
> +	drm_mm_init(mm, start, size);
> +	return drmm_add_action_or_reset(dev, __drmm_mm_takedown, mm);
> +}
> +EXPORT_SYMBOL(drmm_mm_init);
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index f547b09ca023..e8c2f29cb88a 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>  
>  struct drm_device;
> +struct drm_mm;
>  struct mutex;
>  
>  typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
> @@ -127,4 +128,6 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
>  	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
>  })									     \
>  
> +int drmm_mm_init(struct drm_device *dev, struct drm_mm *mm, u64 start, u64 size);

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  #endif
> -- 
> 2.43.0
> 
