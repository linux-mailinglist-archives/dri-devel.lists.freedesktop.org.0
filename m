Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD97A899BE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B5F10E011;
	Tue, 15 Apr 2025 10:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmHtfo7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2844310E011;
 Tue, 15 Apr 2025 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712412; x=1776248412;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=6JnyBeep9PfceCahYLMzYYzub61SUU3NVXOOl5QquY4=;
 b=hmHtfo7nyIxX58nG2aUaV8CK8MJo0UhNhrD1CQukTwF1Lnjo4KzBFyvD
 4cWPVePGXmfz/zXabJ7Jm9qiM1OE/bBI4J117hYPsBR2vzQojOn3LURoH
 sy2oEI04AMDQkXlO1ocHIlUjSUIcNfNJRsb7UDfZ4mbZdeVpgget3LleR
 JSL69Bew7M9np1T3iDT1YYS7i63Z78uVsZzIYdJHIgRIqlcDufRlf8yd0
 5S1J9FZHEpc+N5j0b1p9pWvu7196zgLBhmwtWQ8c4MxNlXiXhCE+l5gdv
 pXw524b0W8CGKsuap75CDp1rgX8HwCHI32iJMdEkZP3gtx5hr9OWquLZT Q==;
X-CSE-ConnectionGUID: mYC1GnUSQsaae30vJ3U0lA==
X-CSE-MsgGUID: 1cKlkJaORZWfkCp/ObImig==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927395"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927395"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:20:12 -0700
X-CSE-ConnectionGUID: mEVJOVQOQ4SWn6e2t8fHyA==
X-CSE-MsgGUID: thIQBwCsSN66eUcXl7uIlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131061207"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:20:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 03:20:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 03:20:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 03:20:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0uaoMwPrD2O5JfCsn/qzkVzq4B7sUrMsZbJl+9e82saOQvrGpfK32U2jG+PCjmWw1sHQPdskcndCNrH9jkX8iaGOlRXQ6i+hc5EXnTRsSFydPaQsDiolUT4lcMshUlf1mik2PhzcEnvgMSS6eo9Xdy+qhjckQqHR6bU4QZxDwUSEyoE2odrMZ19lMfWQ85g59WxP6mUS0WuOXYnDsztloXRep3ceOlX7fOCIcBY9Bv5hEvnSHdNMIQn2YP+lGAY3yc/F5vsIwDYLlGVOflcGpY1ShLonLba0eog8achusLIi1lWC62k0bKPOzUbhQyNJjlCDPH7Gu33VBP5biSwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r312qpy3I1ShpZnZk6ZZL2l1p9l+Nncpjphw3dwLiQ=;
 b=rL6j/mmwHZgwnmuxgnxccwl1vCs4xN4v2pIxGkkKiabGNohCNMMrZPgPmmqXYKElItbzd/Q1lyAlp2z2sDSdVrYwMRyeUWRjVX4ClrLqFkTigo3MJQMvJRCDIimJXtIqjo70G07oByU/GZ/ErLIRWwb2dAoNRek8XxePdLHxNzPrzeiTndGCmiC7tMPpvLwIBbqhjjYspvYkzZgACUIDusvcWCuiOI6602q/rNCg1Y7vIVKb9HbJlVHY1ExQB2t33rVaTpmC59/vd79tlZAa6YZuiTI/SNlY5vlgnEKnxC4CbuhictHdei8ggKJqtoMWXUmLtTE7/oGQ4HXjY+3fBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 10:20:08 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 10:20:08 +0000
Date: Tue, 15 Apr 2025 13:20:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v2 1/3] drm/display/dp: Export fn to calculate link
 symbol cycles
Message-ID: <Z_4y2sa2V3kxmxcp@ideak-desk.fi.intel.com>
References: <20250415-hblank-v2-0-1a23e9d97360@intel.com>
 <20250415-hblank-v2-1-1a23e9d97360@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250415-hblank-v2-1-1a23e9d97360@intel.com>
X-ClientProxiedBy: DBBPR09CA0047.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::35) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: fca01d3e-7a8b-4038-98ee-08dd7c0718bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D2yyinWpx9GvtjyV0m5y6nDeLVukz813CWXp9gTv/XZLK+vfHG531+cLk8Tb?=
 =?us-ascii?Q?DzZwY0mZySm/2fVRawMf07ODPxn6sitEJYbYARc+DYoOOLDFvdOieDopnlbI?=
 =?us-ascii?Q?YDiRBpRAWwwuUdr5zT1koDNs8FTX8TdEH4b3ImBJdDx9vDJgBPEZk1Fjz7je?=
 =?us-ascii?Q?q7k5KYP6BdQgnFvfHJ1vJvf14bDMri7F0FFf5ZzHMTb3rXjrsuQjF3cRZ3N+?=
 =?us-ascii?Q?uPgLVOqEM2e+u75dR3qdm5mgQdSeWOkYzPYPOMHkv+OswpSzVJZezZ/dIBlQ?=
 =?us-ascii?Q?SUqh5Ewhkd8C60OQ/XtCkwqTyTX7v6sQ9p94qAcRWXMW5ZQDjTFJZ4mgOqLY?=
 =?us-ascii?Q?oxD4Iag3nevEETjBmUMK2q5N5aH/uMlJquXD0T5DyKciwCx1bL0rijTGLHRY?=
 =?us-ascii?Q?TeKCEs0JXHUn+moNGjo6PlJHDzx2UKA1nJ2HpbGUoe8H45MAs1giv2qzJYo7?=
 =?us-ascii?Q?0OMDppJOQznsPh35U69o3JprAh69CtE71eGi/sQeqTkOeCpdrSdluJolg+2z?=
 =?us-ascii?Q?eoQSc+tQI5uwod1sA4Ybkdhvb6dpqD5dIs3vy9Oxx5xkwTijr2ufDYyA3/Wf?=
 =?us-ascii?Q?mCDaJZf58cvGGadLbBUnKKZ41vYwQNQIffc0QPomIBTQTR54YmfrbDrnREGC?=
 =?us-ascii?Q?ieE4zVZYN8l4Z3ggFy+3CuB8m3+tKDoaXiAS2ehzC8J53ylbf3xX8bZdn9zO?=
 =?us-ascii?Q?kZyS3u2h5nusTWerRfnGVdYyODcyHzkNgwbGIqBwCrWXq8ScMAutZojpC93D?=
 =?us-ascii?Q?iCgWjXsUzSQyokVuEQhoQuZTOO0/MQ94cQwxByPTh2ixg1cITl3aYpvVXsH/?=
 =?us-ascii?Q?DOWnTcQQP2aCUygkQ0KjwLVvJ0TBWWB9a6wAIt23oJZwN09NwXXOqBVINCSK?=
 =?us-ascii?Q?iA7cf2L7Mc3qTCiEnkUKZrN1617EgAlL3lR6xOUQ8zv9q0Yln26fzGVkH+DJ?=
 =?us-ascii?Q?UgQuhnDYicjZTcwd709hDrWWbuSOfN9yBfdlwhE9MIJ3GdYnA+1cO7uX232y?=
 =?us-ascii?Q?WBGr781nEDkb2t+uWUwGK4DB5Trewjj7wntXD2CmGDX/KeTAiQPilN9bxTmt?=
 =?us-ascii?Q?xne4IpmvL2aswg9FHW0NoE+aBbTj8nVOKU23+4VDwf+BUG4kxB7L0RUs5W6u?=
 =?us-ascii?Q?NwvoQK/1RhWqvg8wGecqk9AoWLowaFI+kFWT3P3aDix3BQoTne23GiDS3NJB?=
 =?us-ascii?Q?eJA7+RIMo5bPvxzvEmA4j5zJyc7bejjYzRJIPVvd0ehofzefe/wRDAlQHcwF?=
 =?us-ascii?Q?5G1mKTNAp5AeHCiGKPW7Rc4m2spkBHs13NdyZy4nD+ObUnAM1DeeBntiqGDB?=
 =?us-ascii?Q?R8iRk8V2DmfNx4YZ2ouUxLe+hrRxDQfp6OAiPDbQkyQcNMHHADZIv//HugxF?=
 =?us-ascii?Q?HNSCrJB4WUqXjPBKXlQdNiAqXGCdQCNSJY2A4UlNkfZpY4wgrkkcWsQpgu8s?=
 =?us-ascii?Q?VtctsnAdcoE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TLuK4MQup1Wrgvx0JCxDar/+WVq+WwM7jmmMOAeiNyENQCFBuCvd2mVTnkZZ?=
 =?us-ascii?Q?mOU15TuQ58PhMyEbJ9t1me2deAS+EOmSjlrAS2OUn3ukhV3iP8stvpDEFbA3?=
 =?us-ascii?Q?rNgkrv68rGV0GHqDrb5656xxKa6lu9PMgmLoj+cUWmT1mhgxL8zZK2v1W+mx?=
 =?us-ascii?Q?UseUlpOSwMq84x0MSNeOnUV0+nDLh7AHS9Sd2gdi7O50GH+5lh1rjRzyp8Aa?=
 =?us-ascii?Q?YbLjZ/3n8dQDuezAu5wRP2CubFQ/Q9gD+P4lmXnTvgfyEWRnqMljoSvBo2vr?=
 =?us-ascii?Q?C1Jcci1agO/KAiW2Z9NRgPc2kICCDFp31rEi5BdFHtfUHbNysFNtw6KbHDu5?=
 =?us-ascii?Q?kyTjhHtvUWxwnxt+fEkqf1j3MI5wmPVYTwiIW/+YS8kZeRDffAe7FkFSrH2K?=
 =?us-ascii?Q?Sro+8GLXLCxeZDjcWSlNXMB/HLcUzCllLqqBR6BQKGd+9h6MEM8F1BBXwhe9?=
 =?us-ascii?Q?lLx6jbIMEN2RKXXX3SZCupamthXzHM0Mo6L4yQHsSLArFlpShfYfvO9jSzf+?=
 =?us-ascii?Q?P24pqkVGgn8sWbKI/wOB3N0sPi4Xcl/o6ilTRr43/3DC15qu/gaWC8B1p0qg?=
 =?us-ascii?Q?38BtqxngkzBvmB/U7oP/36vXObXC6cd579Z3OxQIM46fScKbuWqwhcW8OFIs?=
 =?us-ascii?Q?NAWun0jHbuBiNq4dbzkRyKR5i4/9MQ5iG+EBWRpdJieI0OhPkGEx4N+5+HqH?=
 =?us-ascii?Q?xx1KHg7uhZgXGcw2H51o1SW9992DifTF8qnJxkGjXpaoVFiyDtB21weWfWQ/?=
 =?us-ascii?Q?t5m1MwlU2q6l3qT6cConrEm9/wCXdteWpuHDrhnMHSm2SJXwfpY2RJMGwjfg?=
 =?us-ascii?Q?jz0ICNqUQXd1gUTSkgA4oRJATAVtUjBL8ZivVgtOa/4mUMCJ6aKzFEPN7xNL?=
 =?us-ascii?Q?Drvx0lcngq6PxlbyuJHEgQDixB5Xb1Tu+ldwqbiVvlghq2zUGp/RBvtZH3+C?=
 =?us-ascii?Q?MECG96jYAOL7lbCN1RA/u1sHPb2SH0phPu+sNXPRub0K5tlVHDtnO8ggudhR?=
 =?us-ascii?Q?L7pMHfXOB2DDz61rAIcRuZWqahc4e0N+2hIF3xbh4dEEHrZ+yckd+vHVvqvr?=
 =?us-ascii?Q?7yvpTAZL7xs+kJx/qWgzstqLKM9GVAtHXUheKANADZ8PoBWUA5RoSqvug2Lr?=
 =?us-ascii?Q?Dz7zTNXhirVXwhL0Mhut17u7sGAZHExnUeiwh05FpOuCnsc76OKD0NnVf8uC?=
 =?us-ascii?Q?R+AmuJjs63Nlfl7uHV4nGA6j8tNd8QC+/H+K4tPtD0PCSf87FJwJYUCDAsQb?=
 =?us-ascii?Q?8BxlgPUg5wRZoewimKDkMISf+Aw+859k0lRWfwjmhreoRlHnRcsRccrQIiSA?=
 =?us-ascii?Q?Byx//LqYHdyFmm08rYfAKHIoifXFkphEsfnVt/v5EwccKn+ex6TxrvxbiHeb?=
 =?us-ascii?Q?zgUSFCH1gOM6e5uNXW+juhQdBolVSE6PtQWzMdkQGsCKO8x+AqHb3PBTKauk?=
 =?us-ascii?Q?m8Gx+pu/jAAx0hAi3kQwEkrHYI7s/G26I+SfBbQoyp0fI3b3QQBjWa7RNc2S?=
 =?us-ascii?Q?vNhnmzbvKhAr5GusJerbWpEhEDOxNO4PCCJZciRj65wjOVzzMNZoJOFzzd58?=
 =?us-ascii?Q?UHpYOTtgiM4taXyZ3R5vgwPYEVs7QXh1CwKv9o0w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fca01d3e-7a8b-4038-98ee-08dd7c0718bf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 10:20:08.0884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNXwIwicP8EqcRD9aDpmNi1s74UUDnL7MQp8PR15t71owwzGx4uSA6GeRY+TGEeGyLfiQ4Dpb5LkV5KTx71s7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 15, 2025 at 01:25:07PM +0530, Arun R Murthy wrote:
> Unify the function to calculate the link symbol cycles for both dsc and
> non-dsc case and export the function so that it can be used in the
> respective platform display drivers for other calculations.
> 
> v2: unify the fn for both dsc and non-dsc case (Imre)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 47 ++++++++++++++++-----------------
>  include/drm/display/drm_dp_helper.h     |  3 +++
>  2 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..1a5ff9ba6505f312ee41eb3bcc8b53d318411c03 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4393,25 +4393,30 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>  #endif
>  
>  /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> -static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> -				     int symbol_size, bool is_mst)
> +/**
> + * drm_dp_link_symbol_cycles - calculate the link symbol count
> + * @lane_coount: DP link lane count
> + * @pixels: horizontal active pixels
> + * @bpp_x16: bits per pixel in .4 binary fixed format
> + * @symbol_size: DP symbol size
> + * @is_mst: is mst or sst
> + * @slice_count: number of slices
> + *
> + * Calculate the link symbol cycles for both dsc and non dsc case and
> + * return the count.
> + */
> +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> +			      int symbol_size, bool is_mst, int slice_count)
>  {
> -	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
> +	int pix = slice_count ? DIV_ROUND_UP(pixels, slice_count) : pixels;
> +	int cycles = DIV_ROUND_UP(pix * bpp_x16, 16 * symbol_size * lane_count);
>  	int align = is_mst ? 4 / lane_count : 1;
> +	int slice_data_cycles = ALIGN(cycles, align);
>  
> -	return ALIGN(cycles, align);
> -}
> -
> -static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> -					 int bpp_x16, int symbol_size, bool is_mst)
> -{
> -	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
> -	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
> -							  bpp_x16, symbol_size, is_mst);
> -	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
> -
> -	return slice_count * (slice_data_cycles + slice_eoc_cycles);
> +	return slice_count ? (slice_count * (slice_data_cycles + align)) :
> +			     slice_data_cycles;

I'd like to preserve in the code what the DSC EOC cycles are and the way
the data symbol cycles are calculated could be kept as-is. So could
you instead do the following, renaming drm_dp_link_symbol_cycles() to
drm_dp_link_data_symbol_cycles()?:

-static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
-                                        int bpp_x16, int symbol_size, bool is_mst)
int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
+                             int bpp_x16, int symbol_size, bool is_mst)
 {
+       int slice_count = dsc_slice_count ? : 1;
        int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
-       int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
-                                                         bpp_x16, symbol_size, is_mst);
-       int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
+       int slice_data_cycles = drm_dp_link_data_symbol_cycles(lane_count, slice_pixels,
+                                                              bpp_x16, symbol_size, is_mst);
+       int slice_eoc_cycles = 0;
+
+       if (dsc_slice_count)
+               slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
 
        return slice_count * (slice_data_cycles + slice_eoc_cycles);
 }

>  }
> +EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
>  
>  /**
>   * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
> @@ -4486,15 +4491,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>  	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
>  		(flags & DRM_DP_BW_OVERHEAD_FEC));
>  
> -	if (flags & DRM_DP_BW_OVERHEAD_DSC)
> -		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count, hactive,
> -							      dsc_slice_count,
> -							      bpp_x16, symbol_size,
> -							      is_mst);
> -	else
> -		symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> -							  bpp_x16, symbol_size,
> -							  is_mst);
> +	symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> +						  bpp_x16, symbol_size,
> +						  is_mst, dsc_slice_count);
>  
>  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
>  					    overhead * 16),
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index d9614e2c89397536f44bb7258e894628ae1dccc9..22ae37e7870f1008acfc980a9b46d8dea1fbbe10 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -972,4 +972,7 @@ int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
>  
>  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
>  
> +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> +			      int symbol_size, bool is_mst, int slice_count);
> +
>  #endif /* _DRM_DP_HELPER_H_ */
> 
> -- 
> 2.25.1
> 
