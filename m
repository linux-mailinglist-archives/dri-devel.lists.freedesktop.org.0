Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37592D976
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E4610E8D1;
	Wed, 10 Jul 2024 19:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqtbMDrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C550210E8D1;
 Wed, 10 Jul 2024 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720640565; x=1752176565;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zSZSr5wwRbUyaiSFkHeE3K5Qw2O8QQBB++xv4m44NRs=;
 b=cqtbMDrx2G4BSjzwH5PSj1GI1xPRQDorOqdfqEZNSahv+Vyoqhn5g643
 PtPMB5vlOc/lArBJAf8Sc2yGpnR/DUv0i0I2QFz0ljfI0gHIZG1JXTIuz
 eDxgYMAqeMkbUfH4Z/8qKn0yWN24Hyc6p86pX94pEU69so2FN7kR8NXeF
 egUvogHPdTdB9fCymlYD/ST0kWOmEpUxrccH6TxzdN+z/oHi0wfsL98P3
 5ZjCLfYEVugX5fo8U+L4waxEq9VEOyzkL2P0hIydA+B4Y8IPJbYXd5pjy
 HkntMk8DlqFaFPgqODg3pMpA/aufsisl8wucCE48it1iyAeLGB8B6a+UO w==;
X-CSE-ConnectionGUID: xVH8ghRCRRKYtePbsoqdNw==
X-CSE-MsgGUID: VjuCYoGuTICaf+2is0CyyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17934424"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17934424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 12:42:41 -0700
X-CSE-ConnectionGUID: 3eY/Oyp2RvCadYMBYao0ig==
X-CSE-MsgGUID: ZJsEFZ8GTVOfPrba/LnK9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="71547946"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 12:42:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 12:42:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 12:42:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 12:42:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwbpvPh1ut3UVZz57ZrkciuNxgEMwcjgvxm5oWN9t5ll4fKmIbRUW3p0ab0RSMXI2HZzx+gHKwXxXAS6C2l5kW2pNyhO9irLNxGMoC3U837zLQQhqeJf/aBFEnve2/9mt4Ca8lOXlHLFYr0hUxcf0BJJ7towXOMZAbTCASyWfsxxO6WvmO/OZtCkEUDZyAC3KtJUARuHP6WSmZS86CuAy9Lwtf9fBuBvHwniFYeeDlQPalVOZdEHf8qE+U7Q1rraxAiUTLmBA8T9rWyYH1F6wMdWarrBgUtH3MqoJjKgZAtVxhD7bbYAk0xr1uc+13IaZLxvvkEd9/QCw0YWBFw/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+QpZsWQRvMv7Pr7WJCaDl8zQ16m8tqiYqUnMJWjitU=;
 b=EZ36zgD9TPRL1M1efHWcC1P6uc2QdSZT0KFVXj8wlSurVuYlL1qlha304VbNXMNf1M/uurAz6qxlwSZ9THemfCZSfuBR/WTsfTCoKzCySAEwSqnjpn7R7QCGVL/Vl/ioUauCeKKgX1e+PVTeT9A91RaugkT6BV37otZJddKdUxT2hctMzl9kDx8MpY+PQmWhRIMgpAjQsy9kTM9Zvwg6d9h4n7T+SEJ33MkDQekTQ0Rf+b9AmOlX1bd8LOC0xHRsfCbIIYdPe62c6AxvGOT2DmMJIePX/BeoA1EzwgVT25JF0TqA4y6jz62HzxUJkvKg/A7d5R+MskDfSX0gXE9sMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 19:42:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 19:42:36 +0000
Date: Wed, 10 Jul 2024 14:42:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-xe-next-fixes
Message-ID: <75cpujr5wxkeul2nnrlwunjryt2lqykzms7vudur5xoxl4dris@lz2hhlv5x767>
References: <Zo2sO4t32dxqy6Q7@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zo2sO4t32dxqy6Q7@intel.com>
X-ClientProxiedBy: MW2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:907::18)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: f9299bbd-287a-4d42-a03d-08dca11872d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?viptWX1rQi5Q6CVgdo0OgvqO9l2UfBCZlqLf5odjV41dupejTF9VQTeiwM?=
 =?iso-8859-1?Q?6JRea2bMmNNhQ7+/w9DW1l1Ojr7DsUCMGgJL9LcjnRH7qMZ5l9NKfGhxhd?=
 =?iso-8859-1?Q?T/uYA1asE0ZxrsykMEh6j/aaVRVzOYqfef8AcTJLBT4cYj8DCvxZpDJSaY?=
 =?iso-8859-1?Q?QJxZZnnwy+0h9RWupk7EAQRmGe8GJEnFw5ki1pp89rJN6V/w7oeDrUi7b0?=
 =?iso-8859-1?Q?H0X1CcMe0KpVoYkHsduKM0apAnti2sGyZCEgWCr+tm8eXxwgeNxNBSl3M3?=
 =?iso-8859-1?Q?L/qbmtEp+bbzQOSH1fou7jDITwi5QtIdkIMUcmsERpxH58ap/GmjYRWFJU?=
 =?iso-8859-1?Q?EaXAXkR5ee/Z6vnRHnoMrlo8rnkwoS/sj+Kx3l17WOEDkVFt3TKTzps8aO?=
 =?iso-8859-1?Q?lY/axefgbL5IejgkNNGwsHoaJ6MftmcAmDQqxGz2rIXzaoGfnX/EEmUP4a?=
 =?iso-8859-1?Q?wBkQiSiYBZrQ1UoMAMnFcHGqyqth9kKZ7CkTRMIhZGn2zr1XNnD90FRQkQ?=
 =?iso-8859-1?Q?Rb3lv3bxo4cE3VR0Nh0dAebRXp5lS2v7Ao3JnRdnbUcXd4Y5h/7757G5bA?=
 =?iso-8859-1?Q?u6J4nBHZpW2kU2TU2NfluSHW7rEOKr12oynpifR4wxweLIpuezF4hAu0OL?=
 =?iso-8859-1?Q?3d6IkN5/Mk7RgSwQRwZU4YCJ0EZgu1ljPlZSHn8QHeTSDbLbRCym/wXaRn?=
 =?iso-8859-1?Q?oX8bhRFpmfU9F7xjEP/wV/IQzpqnXYanmqyU/HDkTadKogpkC47yS9uP7C?=
 =?iso-8859-1?Q?3VQzguyJ0CrmH2EFW4XhCZTntTWpuKLMI+8ewiL25wK1ckGonPqOt+aAe/?=
 =?iso-8859-1?Q?w+sfCe+V5n2dd4WT5tX4x7Z/fhsDsCYU1l5YpLRR+gtAfddrDNm+Gz71ej?=
 =?iso-8859-1?Q?nF4n7Kzf1OZWQKQue/wioBC7Y003CPmELN03VNq06IRg+jfeaJlu7JtmeO?=
 =?iso-8859-1?Q?aA0IPXYhqz6Hz0QqnE1pU3Ql2qx60STMofe4ayRFX7c4r5sVRBf2Pk2U2U?=
 =?iso-8859-1?Q?ugTVFc6pMBSDRw0LO6LCfF+35noP/6N/tENs3DzuicTv0TeoHkLH8iXdbO?=
 =?iso-8859-1?Q?yfoLcb8rHfnj/fP9IkMFaM5OLvGdzJL2my8ipPMVpK0eUNjRP+8dLfe5dS?=
 =?iso-8859-1?Q?BePwLGK6T2R/ce+i12q0d3w1BpMr0NjwJcBdmLb2LYesc1CT/fopQ8u7HP?=
 =?iso-8859-1?Q?v68AMiq+7/kNC84LGx01fmvBuDveVmY2j+nWD5JbFB+BXM4uqD7uOBGqRj?=
 =?iso-8859-1?Q?CU0l6jYR973VGjwEiAiDXXodJJmfF8726a7q2qpPc0OEtlsmYrS/ocI/OA?=
 =?iso-8859-1?Q?wtEn/YNBfjs3HZ+i1ph79JtzoHPLZtWx+gaQ3UJL+nN8gn0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mhzQrecpikmMM2VYTp0tj20a/iFJ6z+z2WX8UXn83q05RV0elvy6Usy8Yd?=
 =?iso-8859-1?Q?qzv4RhHuOtRACABZed35qvR0ZZuEDCGN8cWj++XrRO7517xYuv0KfVdgh8?=
 =?iso-8859-1?Q?KxPBL7JpkH01oMrZE7KP47LFUTMSqnR8j2eVFFWKnDHbHn1YqFokTzWL29?=
 =?iso-8859-1?Q?eS/c3PF2eMcYzfyQBOAMATKDdqpJ7NTWI1AaJxyF3vMP3gsQfC8V4XLZzM?=
 =?iso-8859-1?Q?vRoDI2uGusgCI1ZD7kucLhN/Cvt/EOIPGiNBrRwIXmGK6tx60N+YuZVJ2K?=
 =?iso-8859-1?Q?bbs4BOljOvr0SCzFKcZyX31yCgISrKCFBuX5p8Chj1nRIxMz0rcsFiIKaJ?=
 =?iso-8859-1?Q?SNh0qnEOEI9KovqpbDifpAONXZ9bU4OS43c0oi7Bh/uOOYEPR4J7o3QlyR?=
 =?iso-8859-1?Q?aRFcZvPr3WrK73jmdEJdjGZIp3nZ3BJelnZsrKoYlA042n9cqN0/YY5Xf9?=
 =?iso-8859-1?Q?/nV4zhS+ihET/SsRN/hjeCXu5a5j83OPNAh9kn8bpMaT2hBfC1/EipnuvF?=
 =?iso-8859-1?Q?8WCii9qFcJo4sOlxHk1mjJVdpgDXaL2xLHI8soXuALO2jsSEdZ3f3tsQ2+?=
 =?iso-8859-1?Q?5uKdUbw7sIarGh17W08jHQJUbUhfDANP0/2MmRX9x13KwQnq6+/Ud0uEjq?=
 =?iso-8859-1?Q?KXb6o5mAct4zo/DTRJqbwP/9i+IA+O7qW925XwrwjEjerO+LJwPxSBo6ON?=
 =?iso-8859-1?Q?ONQdMu7Mdemr9DQWvJXefqkKzpx1FEX6rxvxvCf6HccEKDe9M+5F1U6idv?=
 =?iso-8859-1?Q?Vda7d5CHQF3D/4Xgnflk43aM7P9AMUkdCF6sd3uOHWKGtJbuKtCwXRSza0?=
 =?iso-8859-1?Q?XesBItP/uJVeoCixWMHtEcFLiLDAR5zzflld+eUfEizIHZL71iPmRzAp4O?=
 =?iso-8859-1?Q?tHaZqOxKWcvu9PiBroP/pq3QBqqjY+MoTWSUXa7H0bmBSZRmnq8zNscy5I?=
 =?iso-8859-1?Q?G5hX3NSE0IsJai0iiHzgZ7zfgbpBOAjw5apUBYdk75ZsQ3yQHSZ/xnuPzO?=
 =?iso-8859-1?Q?oO/7NoJYOhZA5TkK5EGSOItSREjgSHUgfYEFbtsrLkxMjVaAx25MrCpU7I?=
 =?iso-8859-1?Q?09T2esJkdf17NTUDyLQoe3vBnc4zPRY8l+vXtS5Q3dkxU5YWy63xS5mztM?=
 =?iso-8859-1?Q?v3c1WWtMa0hb881GqMlrHjUoMp/B6/ESP0JYJ1E+uHGPOBvU0kHlyl6H9T?=
 =?iso-8859-1?Q?7yVHX4AiSVtDt6/Hush+tbb0GJ/51Q9Q/HcxaNF0UX4DGojRqEZUrLiv8O?=
 =?iso-8859-1?Q?s6JPEp4MXdEQRyTpHS5IRcC1baTgYIUEzjEpPWD9Xo5CyMv1xTxQbyq+Oe?=
 =?iso-8859-1?Q?ZjhDt+3X2/cpkjKJlmM8Pq0v67Hc8BSEvlVYuT3Ol3AL7nL3N48f3X7Ez5?=
 =?iso-8859-1?Q?TRF8SAA69R2G/2wil2RwseWupM/AckJcwenNJuyr0AfxyYv96eexwMmxGL?=
 =?iso-8859-1?Q?oi159neWmBN/hcwBLXT5oV+CmPLCyIVHYmsfXt4qt29zdkLBC6sukujGDY?=
 =?iso-8859-1?Q?HVq/brXJDqMEyIoLj5RHRGW2DRhoB0eXvcNWysN+Oo0GpYMiWgD4C2F673?=
 =?iso-8859-1?Q?75L0ZmNm5+BQk3ieAb0CQFJ8fSicn5XIBRsNksOKzKpi/BcQYvpd0shOBU?=
 =?iso-8859-1?Q?l8n6KPfbxUBnUWNADd7JSGn5FnSM1PS1UHBUvpzlXOq0MhnqDkNkSwqQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9299bbd-287a-4d42-a03d-08dca11872d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 19:42:35.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj67e2x26Qxu69+kA99FkpKsf/nurz3aNazA5MzSYFojVQ5NpcCevocJAVoE/8bGbWYVhDnE4NmC88ryLAva4dMt+F0B3PaJWUc7iJku/4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

On Tue, Jul 09, 2024 at 05:31:39PM GMT, Rodrigo Vivi wrote:
>Hi Dave and Sima,
>
> Here goes a very early drm-xe-next-fixes with 2 important fixes
> that are going to impact user space.
>
> 1. The first one is the rename of the OA stuff from the bad 'perf'
> name to the xe_observation. Although the rename in the uapi
> header is likely inoffensive because our UMDs always copy the
> header to their code, there's a sysfs filename change that is
> impacting mesa.
>
> For this one Mesa MR is ready and they are only waiting for this
> pull request to be picked by you so they can merge that to Mesa:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30027
>
> With both sides in place, there won't be any kernel version
> released with the bad naming and no Mesa released using that
> filename. This is the main reason that I'm sending this PR
> earlier than normal.
>
> 2. The second case, which also impact user space is the
> write-back caching mode for system memory on DGFX. In this case
> we introduce a limitation in the cache selection uapi that is
> transparent to UMDs. I mean, no change on their side is needed.
> Coherence is maintained with some know possible visible and
> acceptable/accepted differences in CPU access speed.

but this commit is also going to drm-xe-fixes, so I don't think we
should have it in this pull. I'm looking at some changes to dim to avoid
this kind of problem in future.

Lucas De Marchi

>
> Thanks,
> Rodrigo.
>
>drm-xe-next-fixes-2024-07-09:
>UAPI Changes:
>- Rename xe perf layer as xe observation layer (Ashutosh)
>- Use write-back caching mode for system memory on DGFX (Thomas)
>
>Driver Changes:
>- Drop trace_xe_hw_fence_free (Brost)
>The following changes since commit 62a05f4ae9c1fb70bc75d494c9c1c373d2c2e374:
>
>  Merge tag 'drm-msm-next-2024-07-04' of https://gitlab.freedesktop.org/drm/msm into drm-next (2024-07-05 12:45:41 +0200)
>
>are available in the Git repository at:
>
>  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2024-07-09
>
>for you to fetch changes up to 463108053c19f24fa228863824698d5ca72826b6:
>
>  drm/xe: Drop trace_xe_hw_fence_free (2024-07-09 16:21:26 -0400)
>
>----------------------------------------------------------------
>UAPI Changes:
>- Rename xe perf layer as xe observation layer (Ashutosh)
>- Use write-back caching mode for system memory on DGFX (Thomas)
>
>Driver Changes:
>- Drop trace_xe_hw_fence_free (Brost)
>
>----------------------------------------------------------------
>Ashutosh Dixit (1):
>      drm/xe/uapi: Rename xe perf layer as xe observation layer
>
>Matthew Brost (1):
>      drm/xe: Drop trace_xe_hw_fence_free
>
>Thomas Hellström (1):
>      drm/xe: Use write-back caching mode for system memory on DGFX
>
> drivers/gpu/drm/xe/Makefile          |   2 +-
> drivers/gpu/drm/xe/xe_bo.c           |  47 +++++++++------
> drivers/gpu/drm/xe/xe_bo_types.h     |   3 +-
> drivers/gpu/drm/xe/xe_device.c       |   4 +-
> drivers/gpu/drm/xe/xe_device_types.h |   2 +-
> drivers/gpu/drm/xe/xe_gt_types.h     |   2 +-
> drivers/gpu/drm/xe/xe_hw_fence.c     |   1 -
> drivers/gpu/drm/xe/xe_module.c       |   6 +-
> drivers/gpu/drm/xe/xe_oa.c           |  34 +++++------
> drivers/gpu/drm/xe/xe_observation.c  |  93 +++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_observation.h  |  20 +++++++
> drivers/gpu/drm/xe/xe_perf.c         |  92 -----------------------------
> drivers/gpu/drm/xe/xe_perf.h         |  20 -------
> drivers/gpu/drm/xe/xe_trace.h        |   5 --
> include/uapi/drm/xe_drm.h            | 110 +++++++++++++++++++----------------
> 15 files changed, 227 insertions(+), 214 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_observation.c
> create mode 100644 drivers/gpu/drm/xe/xe_observation.h
> delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
> delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
