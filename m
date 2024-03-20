Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196E8818D0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C0510FB20;
	Wed, 20 Mar 2024 20:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtkK7ddm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F9A10FB66;
 Wed, 20 Mar 2024 20:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710967982; x=1742503982;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mqYFCOSOSCw8Nq9Psg3k1QSm1oZt1GC/MJ20wwkkkVU=;
 b=CtkK7ddmMg+9vPAOuchv228BN/rBTApInKtwSnOeXEmCL0h83glQ2hsC
 Nn8qc9h99LolbYT6JEkNwkHa6GDVf5g7AH5Fp1kGaN8HZfodnj8lgNjct
 bGbnCHtU25EMBX7t5PCWWxPfdh8/hhUt/z/AYwvIbktHQ1PNiQ8XAyaO5
 yA2v+/6ObpyUuRYveuyer8YJuMu6KywkhBi+jPNh5Q6GyzAvF8VIy00aG
 35Ga/8XKR854PXi8BtuHYX5zR4K0XjICD0e+HZeyedReGOVcgsSIZCRCV
 a6Sjipo/3Dmcm9lOR5c9L3mGzAgHYtyD3A09FFyHyHstKKJh+Xk1xcckw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23377981"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="23377981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="19006853"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 13:53:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:53:01 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:53:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 13:53:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 13:53:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTrbe3v41vu+IWZSW/Z9MqjZZ6aETBaCZ9WFf+MgSAy/sf5+VMSfHciszisCmfCqPynOtb/GzdxopjFO0WS76iog25AJNgGia13Gyj52t3Vv8Pq11EHFLOVfxcA5CZ4ss5zAu3rxdt05cArWMSsflDi+CpWX0uPiKRQMeWZpPk8lxyFJ/EP/1LB+5KSgKki2A9ZUx/1gA9siN8EaYu9Jzz3ul3bwpL+usP1Tp4N6wT7WFYBc+0JYQtlLK9F8i6kZPlDszJvmPjs7rFjPR1Fk3uWq6m8Wxn7GxUOHhcy/+eqgirlFw27owKeL0VIeZdvHq77z8YJFdIX1WsD+GYNbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N9FrooGnGZLcVK6wg5NJAsNgRl2GJ42B34o8B4syAo=;
 b=FouBH9LLqh2SAHa1j5eY4hH2EW234qcSKYLWHt/vJFtTX04U2/Pyn/RZ5TQluca9DvSuvyF/X6xINAWnSDEg6wMQjcfrE0aJdzpG0Rz6dj0Urlfr/2PGhbffHEXM7H78Tb/NivRwH9jLdRUMbieQ1ff9FDHwzENwyW3CtNWnWavq5a9rh0V4xWCpkTujVjmLHuvrEbbbQxfuBPH+vqf5Ec89gwmrqkZ1p8vQ1wWbe34V/WSdfsIqz/6eZZDXrl85LoEp7cKfsjpneS++pu6GUpX+jfN1TqUnSoJK55aAyfPlRBv5kRKxdpFq3u3EeKvt+8V+CiY+wvVdcQwTl1sn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7659.namprd11.prod.outlook.com (2603:10b6:510:28e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 20:52:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 20:52:58 +0000
Date: Wed, 20 Mar 2024 16:52:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC 2/2] drm/xe/FLR: Support PCIe FLR
Message-ID: <ZftMph8PQBlunnmi@intel.com>
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
 <20240320104426.1592959-3-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320104426.1592959-3-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0067.prod.exchangelabs.com (2603:10b6:a03:94::44)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 119e4ce6-d265-4610-1b0c-08dc491fb952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QllyZrqAVO+spK9lk10hlTsBVef7C3B/8ZW8xQFyRrezmOc8GXYoQV8X+Af7Mc/fJwFy5llIXBBxkVGNplMX78XHgFaFZKRrj7/sUQuNdYahdOhKRfYzZmwi3B+5hYw46S4UWdneeDMox+ZlkvcXjpueqgQ9F6RcEXN8oJgvF6Wk6iieEjWvsqZTSoxQmTkH0sFMpr7QMu1gJ191E3+2PnCRGeBxCjJr3IlAIFq/eo9KYChiLbUCnNLWhbQ3cZxv6SupWHWRfGhmM4YaMI/ztbREJrYmbLIe5QvY9Ap0vdZOzycEMN9B/IZOVRxJU/3xP+SMHDzzwbQr5jOTTNFpE4iToK6/k3GzbkrlNhIpFzTtWzcBfCKzWYpPs9o17P02qVi4ypa20MbujayvHoDts0hgbFr9FRcrxXIxqT40ruusnzSsTZB0CY/RrMBGPUpJ/kT+P+vNK198Ju3NxpSFeWYfxfpt3FMtQ5FOhIlOoHFGY7uwXc5PcU/rm/fHa+LlFZwFGQNSqwsiJgNStiB+7i9oPUeo7piJ1PGFaN7bUPpxKQbuQtjJj5DQlSIp449udc6+Jl0nm6ObXGMCjlfTNcvBQnwCQiFZzwnQsabQDpyn4eEjbbI0+6YeXtorDvixBHSVSB41bPdjJ7WGRQx+kjLbNNEVVnK28WyhD9UzwIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?V/g+fXko6qGLUa2/+AfjYWtc6ddyHtGSEDv+isqdU9/eo+tQUur2zaRFW5?=
 =?iso-8859-1?Q?RS8jySaKETJ+JZQGg/YVIh7wFFbRSrjHRVg/O6Cd2UqEVDfNwSwCgUEaC6?=
 =?iso-8859-1?Q?jMp77VuMF4loGcyqLbD3Mux9HEaEthG0YaMp8HcujrcPc1OA32MeG2/sIJ?=
 =?iso-8859-1?Q?IUHtXA4JIFhNn225TpRq4iSSBitof4XTmGS7BNF0GxvwdYTY1GyFhkOBmf?=
 =?iso-8859-1?Q?lAS1RKl8jAGoInAE+usa9O2zCbV0L+2Nf0PxNm+a1R/1Z4SrUyWGHb7d6I?=
 =?iso-8859-1?Q?il3R8MDNiWqTzesOwFTDCkeXbDbsEtE28t7NfE4RNKJ7ioP/3Xgx/0fgBM?=
 =?iso-8859-1?Q?bZ3fvSV12jvKNXXeBUl+OgdsVOj6o+Bwutai7USLRAqm8/eSMOu6Znu2aO?=
 =?iso-8859-1?Q?jMXMT+tRg85+yrzrOClhF1TMcxZaFyqNTIO4PaTy2IgopP5obXUj5sQGlb?=
 =?iso-8859-1?Q?Q20QOxN6Hhb0Tj0dht0cv5Y0HkEdtxVRd2+pNtuHjgIF4DcZJqc71BhiNe?=
 =?iso-8859-1?Q?CcDh4Z6zROl5ojX6jwoafLXQ6G9BhFx5aIRaNEhl7g4eSE/YG7FHTCEzF+?=
 =?iso-8859-1?Q?/OfZ7edOO7LUvH1NRL71rmppvtjTfWB9RXYKor1KSeldm2UUB6NwMU6Mw3?=
 =?iso-8859-1?Q?hnFgV7t+6VhlLaAu1FbafW30N+L/4G3hN1/SYfC0WVp0kGtQosi4ysfwx2?=
 =?iso-8859-1?Q?lSEI5cp3f78Sqa1cNh8GKG023LVrU41Hfq7VFT7sxbuiF/ZHXDaQdSl8Qe?=
 =?iso-8859-1?Q?Xf2U4PxDWrFBlbzxg44HVSDKH03ONaqoQzaks4nscoHryIm3+TrzM8ZvxJ?=
 =?iso-8859-1?Q?4VzUJoMwd9NINvE7c9GOLj2oUJw7MhwS4pFfI0edv6vC8QMMGjgl5pf6W3?=
 =?iso-8859-1?Q?ztVajw0O6bWCj4cULZsQFPY/EtbkxjBczt0s/8ztJLIkrY5y7hd+USGlUR?=
 =?iso-8859-1?Q?9qjBQE6GdIfIjivpIhmlTca2BOB1dOAXxkEBzK7F8FmvlQezGTbYhP03vO?=
 =?iso-8859-1?Q?QT8y1jl30Kh51CMqNUvqqtZytQcjXqqEyO3mFR0U88yr5WK199uK8mbc3g?=
 =?iso-8859-1?Q?VDiOuQlnjV5796FGDIkwQH/yuQqwYs/gDyriAi/jd3CpUu7qiQjTRJMN+C?=
 =?iso-8859-1?Q?nVrODYX4LIqLNCVckbJzNDTm57utgcv5jhoRsMnOTsap9msYlObcc4UHOI?=
 =?iso-8859-1?Q?MArasmHCWwTSNn1UTNWKooCHl6+j6O42wh+YfenXg1j+s6mNWNfdLBepMG?=
 =?iso-8859-1?Q?cDV/q2g5KJEdrrZij6cyaIv2I21DrxEraN6ek/S0Pkjno+Z0gF5oHewnCr?=
 =?iso-8859-1?Q?DqW4NjVYrbFRSfMpNkAPUGEmaVV3X9W2xfAUz58yNfVpKRThHorFyMnc3/?=
 =?iso-8859-1?Q?rXcrF7prCQTN+Lh4t8bm8ReoupWWFzpGy4yD5dcA1yCKMXmp//TI+gyt9Q?=
 =?iso-8859-1?Q?gVXBsTXFPhpF1mgbknvQL5oQ8RnuCKt4tE397LdYDT7C9t4QTaT+KST/wU?=
 =?iso-8859-1?Q?P9wUJ3TGqjGeFuOPrPCZkRqBVNxsOsBzC/bc2cfrus/CEXJpI86sShiPgn?=
 =?iso-8859-1?Q?jkeFwskguzKhXPI1Yl9wah0CVFiT1gzVnNVESHoaI7JAGtKZen0pfiDmWq?=
 =?iso-8859-1?Q?3WfbX1tdpIItpb9lugC7XVVL4yxorYZodL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 119e4ce6-d265-4610-1b0c-08dc491fb952
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 20:52:58.4149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPro2Xw4B6uw9AmSPYoaYg+91nRDO/q4huwxIW428aWlcowcbeJaIgbVuDvvPSdSlpzoxiQOdpQTfxXt/nwf2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7659
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

On Wed, Mar 20, 2024 at 04:14:26PM +0530, Aravind Iddamsetty wrote:
> PCI subsystem provides callbacks to inform the driver about a request to
> do function level reset by user, initiated by writing to sysfs entry
> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
> without the need to do unbind and rebind as the driver needs to
> reinitialize the device afresh post FLR.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +
>  drivers/gpu/drm/xe/xe_gt.c           | 31 ++++++---
>  drivers/gpu/drm/xe/xe_gt.h           |  1 +
>  drivers/gpu/drm/xe/xe_pci.c          | 53 ++++++++++++++--
>  drivers/gpu/drm/xe/xe_pci.h          |  6 +-
>  drivers/gpu/drm/xe/xe_pci_err.c      | 94 ++++++++++++++++++++++++++++
>  7 files changed, 174 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3c3e67885559..1447712fec65 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>  	xe_module.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_err.o \
>  	xe_pcode.o \
>  	xe_pm.o \
>  	xe_preempt_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9785eef2e5a4..e9b8c7cbb428 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -455,6 +455,9 @@ struct xe_device {
>  	/** @needs_flr_on_fini: requests function-reset on fini */
>  	bool needs_flr_on_fini;
>  
> +	/** @pci_state: PCI state of device */
> +	struct pci_saved_state *pci_state;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 85408e7a932b..437874a9a5a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +/* Idle the GT */
> +int xe_idle_gt(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	xe_gt_sanitize(gt);
> +
> +	xe_uc_gucrc_disable(&gt->uc);
> +	xe_uc_stop_prepare(&gt->uc);
> +	xe_gt_pagefault_reset(gt);
> +
> +	err = xe_uc_stop(&gt->uc);
> +	if (err)
> +		return err;
> +
> +	xe_gt_tlb_invalidation_reset(gt);
> +
> +	return err;
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
> @@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
>  	}
>  
>  	xe_pm_runtime_get(gt_to_xe(gt));
> -	xe_gt_sanitize(gt);
>  
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (err)
>  		goto err_msg;
>  
> -	xe_uc_gucrc_disable(&gt->uc);
> -	xe_uc_stop_prepare(&gt->uc);
> -	xe_gt_pagefault_reset(gt);
> -
> -	err = xe_uc_stop(&gt->uc);
> -	if (err)
> -		goto err_out;
> -
> -	xe_gt_tlb_invalidation_reset(gt);
> +	xe_idle_gt(gt);
>  
>  	err = do_gt_reset(gt);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index ed6ea8057e35..77df919199cc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  void xe_gt_remove(struct xe_gt *gt);
> +int xe_idle_gt(struct xe_gt *gt);
>  
>  /**
>   * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c401d4890386..fcd2a7f66f7b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -383,6 +383,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>  
>  #undef INTEL_VGA_DEVICE
>  
> +static bool xe_save_pci_state(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	if (pci_save_state(pdev))
> +		return false;
> +
> +	kfree(xe->pci_state);
> +
> +	xe->pci_state = pci_store_saved_state(pdev);
> +
> +	if (!xe->pci_state) {
> +		drm_err(&xe->drm, "Failed to store PCI saved state\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +void xe_load_pci_state(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!xe->pci_state)
> +		return;
> +
> +	ret = pci_load_saved_state(pdev, xe->pci_state);
> +	if (!ret) {
> +		pci_restore_state(pdev);
> +	} else {
> +		drm_warn(&xe->drm, "Failed to load PCI state err:%d\n", ret);
> +	}
> +}
> +
>  /* is device_id present in comma separated list of ids */
>  static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
>  {
> @@ -688,10 +723,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
> +
> +	kfree(xe->pci_state);
>  	pci_set_drvdata(pdev, NULL);
>  }
>  
> -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>  	const struct xe_subplatform_desc *subplatform_desc;
> @@ -786,6 +823,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>  		str_yes_no(xe->d3cold.capable));
>  
> +	if (xe_save_pci_state(pdev))
> +		pci_restore_state(pdev);
> +
>  	return 0;
>  }
>  
> @@ -833,7 +873,7 @@ static int xe_pci_suspend(struct device *dev)
>  	 */
>  	d3cold_toggle(pdev, D3COLD_ENABLE);
>  
> -	pci_save_state(pdev);
> +	xe_save_pci_state(pdev);
>  	pci_disable_device(pdev);
>  
>  	return 0;
> @@ -857,6 +897,8 @@ static int xe_pci_resume(struct device *dev)
>  
>  	pci_set_master(pdev);
>  
> +	xe_load_pci_state(pdev);
> +
>  	err = xe_pm_resume(pdev_to_xe_device(pdev));
>  	if (err)
>  		return err;
> @@ -874,7 +916,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>  	if (err)
>  		return err;
>  
> -	pci_save_state(pdev);
> +	xe_save_pci_state(pdev);
>  
>  	if (xe->d3cold.allowed) {
>  		d3cold_toggle(pdev, D3COLD_ENABLE);
> @@ -899,7 +941,7 @@ static int xe_pci_runtime_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> -	pci_restore_state(pdev);
> +	xe_load_pci_state(pdev);
>  
>  	if (xe->d3cold.allowed) {
>  		err = pci_enable_device(pdev);
> @@ -928,6 +970,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>  };
>  #endif
>  
> +extern const struct pci_error_handlers xe_pci_err_handlers;
> +
>  static struct pci_driver xe_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
> @@ -937,6 +981,7 @@ static struct pci_driver xe_pci_driver = {
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> +	.err_handler = &xe_pci_err_handlers,
>  };
>  
>  int xe_register_pci_driver(void)
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 611c1209b14c..9faf5380a09e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -6,7 +6,11 @@
>  #ifndef _XE_PCI_H_
>  #define _XE_PCI_H_
>  
> +struct pci_dev;
> +struct pci_device_id;
> +
>  int xe_register_pci_driver(void);
>  void xe_unregister_pci_driver(void);
> -
> +void xe_load_pci_state(struct pci_dev *pdev);
> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
> new file mode 100644
> index 000000000000..ecc467a9c3af
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +#include <drm/drm_drv.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_printk.h"
> +#include "xe_pci.h"
> +#include "xe_pm.h"
> +
> +/**
> + * xe_pci_reset_prepare - Called when user issued a function level reset
> + * via /sys/bus/pci/devices/.../reset.
> + * @pdev: PCI device struct
> + */
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +	struct xe_gt *gt;
> +	int id, err;
> +
> +	pci_warn(pdev, "preparing for PCIe FLR reset\n");
> +
> +	drm_warn(&xe->drm, "removing device access to userspace\n");
> +	drm_dev_unplug(&xe->drm);
> +
> +	xe_pm_runtime_get(xe);
> +	/* idle the GTs */
> +	for_each_gt(gt, xe, id) {
> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		if (err)
> +			goto reset;
> +		err = xe_idle_gt(gt);
> +		if (err) {
> +			xe_gt_err(gt, "failed to idle gt (%pe)\n", ERR_PTR(err));
> +			goto reset;
> +		}
> +
> +		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +		XE_WARN_ON(err);
> +	}
> +	xe_pm_runtime_put(xe);

perhaps we should only return the ref at the end of the done call?

> +
> +reset:
> +	pci_disable_device(pdev);
> +}
> +
> +/**
> + * xe_pci_reset_done - Called when function level reset is done.
> + * @pdev: PCI device struct
> + */
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pci_get_drvdata(pdev);
> +
> +	dev_info(&pdev->dev,
> +		 "PCI device went through FLR, reenabling the device\n");
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return;
> +	}
> +	pci_set_master(pdev);
> +	xe_load_pci_state(pdev);
> +
> +	/*
> +	 * We want to completely clean the driver and even destroy
> +	 * the xe private data and reinitialize afresh similar to
> +	 * probe
> +	 */
> +	pdev->driver->remove(pdev);
> +	if (pci_dev_msi_enabled(pdev))
> +		pci_free_irq_vectors(pdev);
> +
> +	devm_drm_release_action(&xe->drm);

is there any opportunity to have that done at the prepare fn?
or do we really need that to happen after the pci state restoration?

> +	pci_disable_device(pdev);
> +
> +	/*
> +	 * if this fails the driver might be in a stale state, only option is
> +	 * to unbind and rebind
> +	 */
> +	xe_pci_probe(pdev, ent);
> +}
> +
> +const struct pci_error_handlers xe_pci_err_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,

I had recently got to this functions while working on the xe_wedged/busted
thing and I was considering something exactly like that.
But you actually got something much simpler then I had thought.

how's the test of that? working reliably?
any IGT?

Thanks for taking care of that.

> +};
> -- 
> 2.25.1
> 
