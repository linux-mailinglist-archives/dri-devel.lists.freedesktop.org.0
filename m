Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8DCA26625
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 22:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39D710E579;
	Mon,  3 Feb 2025 21:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ib84FhSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFDB10E1D5;
 Mon,  3 Feb 2025 21:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738619674; x=1770155674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z3iZCHaxLHZfl6dM86wDVuM3/KPNGKIDWaL6OB57ftE=;
 b=ib84FhSJ1Y8T9R2hvPGp8yu+4dX/tEuGMU/ws/i1jwHzFIGyhMJYOnx6
 BrdUnoxNCJcgwpRWlnT/M6ADFPivLNS8vr/+y9hRgV/1G661ViLD9yR6w
 U6FvO4dBZJgq3R0wY2b1tMrZMxSHlap1SvMb9suYnnNdO34QBWxzuqOcK
 m+q6I+jtefKDxo56Tm+tHzHoUvDxcvpPwy7XLdaJhycTiGZOsRwWYuV8R
 4i4nxZk9Y3TXnfVyTSSKMbpUVkkReEJw3XIPms0JQN5g1/Bp5XSBG1hw1
 e8RpFwMm19jly1dI/7ILjnVVpABXu8nskDfzVADh/ooa3lRecoArTjfS0 Q==;
X-CSE-ConnectionGUID: HAbQMPmcSp2hEN3+zuoy3A==
X-CSE-MsgGUID: JeEiCjamSTqagmw51GxSJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39008121"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="39008121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 13:54:33 -0800
X-CSE-ConnectionGUID: kahn88EOQmOiXMT7lpdz9w==
X-CSE-MsgGUID: PDMFpMuySrm4FeQ9XRwnqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="141280063"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 13:54:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 13:54:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 13:54:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 13:54:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5bgmUsPZczs4Y4rfYXRsORop4iuUSfDgrKEEZx/sB/8YNusdL0UajBDtGrFloga2L7AIJ0/Iu3dwUICqup2EBUH73lEQ/xmAafsoJJKJAhB4PdykYoKkt5DCtuV6LYsMacpHxzRTaq2RPeMgt3GDO4j+hspM5cH0axLiWEKEw1o9ubIdcLdmU8DN6rRDzquGzb64An3TSTZRMcKvU4Cqnvvo+UGhgEFVZimV+W2dsMUQ1JUQ5Z/YxjCX4Z+wrEUdO4eDvmgnS7OXTPjpfYmIVYARuBpRKI5qjAMVUoUuM3LVUlIlJ68mJcu0ass84Kua13zGIDFPmkNNRkSaPGvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewtFDUEKkPVo9nA0wKEaiqrEQ33Ev6KEyAVzkn6B6sQ=;
 b=j5xpyd3VoLKVK0JoDeBQxiLrcg+IzW8FnwdqLhTcKQf2bB/GbgUUGiIB2204sY0gK2Vg4/nihbW564/dIlXM9QiXjASgwIDxWkvf280kkOC5jTAPI7mGwbaS8Da5qhuXW4tMprM15sVg/rW1kSP/x7ot2vwgw+C/87N5sYLuBu0ab5gJYryHdkHk7RwT35H/4ksVKO2idqnWV2KqQUBHsr/SBjjwm4HbZ5gCOwlBJqb0mQOxC6K5zLduzR/PnrCL0B6mPMu8eEROTINl2SSTMz0fDz7IxyDpX7swV2UxvYLilVd9JdHPf6S/iW1kk7nI0AZ5LYUq82huLm/2OOROYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 21:54:30 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 21:54:28 +0000
Date: Mon, 3 Feb 2025 16:54:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] drm/i915/selftest: Fix spelling mistake "ofset" ->
 "offset"
Message-ID: <Z6E7EDj67tPMSLp9@intel.com>
References: <20250202221431.199802-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250202221431.199802-1-colin.i.king@gmail.com>
X-ClientProxiedBy: MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::16) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b3becf-e517-40ba-65ca-08dd449d5506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wZdqmfFuRl3alx4+i1WK9sbUMEOwqaL6Cxg31w4aNnErhZ7nzttMdEEgXyA/?=
 =?us-ascii?Q?IEbcZ7KvqIlSJ4zzF4mX5yuWTHbm7f2xyxXEQCzEW/6G/JCHnf3PQWi5zoic?=
 =?us-ascii?Q?3ZuNwZjxAdpDQQAydM/EvKyYfzdeZEwY7HgyVC+8jYWQYrr59jXtuGeYwzUY?=
 =?us-ascii?Q?RDfsiQSMhOJ8ESpO6NIGSpWpP8ovmF3Tm/7GkuZnt5sEPbhVg0+erXmgHkjs?=
 =?us-ascii?Q?ZSoXAyrRT6oIUDYBTZIyXME/B5sdhFW2U+hA4Zu6Pu1qgPA8bggd5Y4bUd7J?=
 =?us-ascii?Q?U4i2vBYVJ8OlAHi/bmUB8ys+3UWDGmyoiZcGAtwLHdb0iNqqj0t0mEUlycUj?=
 =?us-ascii?Q?5zdUS+gizJkzNjv7BR5cXhYAVm0kMtvDqZ6mPEqQqHzQQYD/C50Z6GQmwYKI?=
 =?us-ascii?Q?hvnXRTTRnjSGauskwkLoS9+i+UtBP5JVtZCfPClpfj9DjjVRX5BKtq8gxqy7?=
 =?us-ascii?Q?/osPCiWdbGAku0pTBDcpwuFs11LZA4gS59rmWxOrZbNqQ2NDAH+A7vb1bJAr?=
 =?us-ascii?Q?jCTnlE87ZtALNR5Ua7Y1GZTzmuUtTdDRcKHDJ0/+TZpjBN80Gbas2fuLZYNG?=
 =?us-ascii?Q?Z4PsWJ0T2mRkPkzDs9XZ/9F34zMEPU/Tovm6DkJ/62ER0ILsEBFJvZsY5zok?=
 =?us-ascii?Q?qAFjP6upx/zGnNoDJ77jwYHPdkwmC1SitVT6tST4ymUEj839Hth7ta3Ybi3l?=
 =?us-ascii?Q?U3ir5WvcjHKn5Do9eFQJHPFuauODmoRy20xHB/yi+xK94XDKqA4vrzO6NpJg?=
 =?us-ascii?Q?yog9J79wqgJFRSI/Qdg3F68Jk/H8/Badz+oX2Riab+5UopYh9XVG1BWp2WTz?=
 =?us-ascii?Q?A94ttrKK57aoyKrr0MyzToe3twqRwPs/qRY3MPmEvPNcBr1CjCooNiKuWlae?=
 =?us-ascii?Q?uNqLTc81l9OJ4Pr/BtwlviqlzYyuL0ZMscu76ERO/YwrIv0/+7Hyh2i6AH2r?=
 =?us-ascii?Q?KGCOikA4zTyE/HkhE4YZUS0grqmIqmrfe+1aUIYaQWhKbfJYuwSv1cqW7bnd?=
 =?us-ascii?Q?vMu8bin32ELHrdOxkjpChR7wcwoKqpoViB4glz/8V7U8PprJ/ztXnvudpF/6?=
 =?us-ascii?Q?2EalaZmug9PnviMG+0E8nb8NPZ637sO3GCjjhfEKm27iqNcXgnQ1ux+K1vgn?=
 =?us-ascii?Q?Hlo8ZOXfK9G7UAqrE2Uj4HYcG2mrxAxlUv5Rifbm/gGRQynd7ETX8QWEyEWQ?=
 =?us-ascii?Q?643vdEKJr4Mt+R+hKrHTIO3DbFrv2j/NksVy235aB+gt2XcA8cSnZYH9xCSR?=
 =?us-ascii?Q?Azhl/Yz3FyuwDyq1O4+OzaEljiPjQjyufgDLzQyqlHjD3tvj1a+U+hmhaLBM?=
 =?us-ascii?Q?Gagw/6FMpYBuelikK9dShjjk+Zz2YJQJGtd/2d1H8ruPpHGqsGDs9CrMH+ic?=
 =?us-ascii?Q?xThZreRExsN2+2e/ZNvW9DeLa4BK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dnAberS9HhM7cEI8CyNRp5bzwyYEzhy1sb7goa/5ANzEciyVogeJBsAS+qES?=
 =?us-ascii?Q?Prll8rVkZs2hB/aEGKydJp8J+Yqqot+V+7j3KzZ+L1Halstw9Xyl1EGu1mBV?=
 =?us-ascii?Q?NhOBcq14xx1CaDm4V6XiY14uiYM0SeDHKJIA1/brReS1EHbI8kgZf3/IsLho?=
 =?us-ascii?Q?VZ2ETm8ZbFG+9ZLTpgttvZ4SfXs1P6l/4QyT6h+cF1Bin1L8aKiuBCj6XrPM?=
 =?us-ascii?Q?13N8sA4OmzKZGxEuw5ZykYtu+I3iG67Pd8n+R6+nYO1PPeii95ICrnyQYjtJ?=
 =?us-ascii?Q?aDOB+cnu7E3WmDGFJuE0zKClSOPwz4VSx8V1mu8qmj9wB9FDuyJy5ZEeUNfU?=
 =?us-ascii?Q?iJDyKjixRgC2oBt3Ek+W9bLJ4YQ4OdQTODYZGtLPaIhvm5BDdynRtEXOk4Qm?=
 =?us-ascii?Q?+ZCbBwi39YFzlJRGps8f4mvw+40qOEnj6lFUlZvsHsmcZu33Ibe8FBF0YLcp?=
 =?us-ascii?Q?D/7mFWCGE790IRAQWPnWxCjcqzI5SbWcrRfJ31+LFvMzIqRkJYgTq3uYr6q6?=
 =?us-ascii?Q?yMbC9H/sh76i4jtzt76J9B+F7wcSSFp6biNr82h2ATlk6ZcfCjXB61CwRdZf?=
 =?us-ascii?Q?oMdGAQpx2FgDb9GYC+LkaFxB6ZKHRUSEnGMsQNtGeor0nEwL87tT5URZmK3x?=
 =?us-ascii?Q?0V2uHtwWbP6KwVle6Ggu0ytGg0S4P9gBdMmBfPElYew3t3EYFzhlRcmFarIf?=
 =?us-ascii?Q?AjFp3oNFjJTanWbjq2q9eNO/j7y1yWZn8clcG7NlPScWvMH2l59ZDBaVB0Q1?=
 =?us-ascii?Q?FYb0/s/sSnG2HBq1v7CwAp4Xc03C4cCmdZLiOFPifJQKwSsG1D4S8gJgdtK4?=
 =?us-ascii?Q?7jHKO999cMXk+kLhyxCuEO+5iVUO39WFrJyWaFbOt1vg2CHYed5tGaGoSNiL?=
 =?us-ascii?Q?vaV+IKF/6f74np6e75NuqMsf3gpvtX67yVRanomn94wQFNE3hem+6zGSgT17?=
 =?us-ascii?Q?dC8EL3zwKr4LXd+3ojnjuta72rgwEZwbBWDvBbOPUlylK3BNRAef+HkRYj7j?=
 =?us-ascii?Q?AO9X+LKqIAIv9JI2+rroGvBvgTrxKJU5rw57rmPILZHKQnk10HEJwoe0iUEa?=
 =?us-ascii?Q?P8IyYvgvaMZn3+/mt52cqQEbpO/CNRE8ZCqJSzcGBYL8IJT96oOBTm8k+enD?=
 =?us-ascii?Q?9r/AtU9V9faL3eBu14xEYF7306j4lsE9y/mdM6E9Lc7NZs5XxmCikwIv0T0d?=
 =?us-ascii?Q?80m5sUZ0ZC/U6nMawXtdtFPZRWyWBsn3MbE+Ou8FvSuRioya+eqxLth0lHeB?=
 =?us-ascii?Q?GFBu9bfWE20I0f7GqMWMmzj64Jeu/DTZHp4WFg9XznkTCc+kNh91IYKcRC/A?=
 =?us-ascii?Q?0a4ms/+yz68bXjA0qdDrAQ8zocN/3kugs+uP2WeFX2Z4kUnAXI5ruye4Qphi?=
 =?us-ascii?Q?4SBoiAjbRNLoYYom6adw9ccipnPEcX/mLvQaP5RLXVjqu3pMtmWf2qqUSVDa?=
 =?us-ascii?Q?wmyzd+cRQcwmkm80FlEKImpWOQbXhgjS79BC4Kjw9aTawRf4I1KjRkd3AOXD?=
 =?us-ascii?Q?T+mdqcMs52rM3N8bisdysZDyvkS9Bas/Hxn6pOkXvKeKrRzWj1JE/hDZi3r1?=
 =?us-ascii?Q?Czm/AcJM/RRVoJ2ydK+VsLL29IwcV8v3urFXs57ChCc4PvSeKWcqv4ScSlFQ?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b3becf-e517-40ba-65ca-08dd449d5506
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 21:54:28.5176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQT//jfFHmDetZOLwYnp530+Fd6PR0qC77JYUzCOlrTE+Y/DPY4/Rzjthre+EEwCIu1VBn9Tl6AaFUDgM6yKzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
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

On Sun, Feb 02, 2025 at 10:14:31PM +0000, Colin Ian King wrote:
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 5c397a2df70e..3eff0894c26c 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -964,7 +964,7 @@ static int __shrink_hole(struct i915_address_space *vm,
>  			break;
>  
>  		if (igt_timeout(end_time,
> -				"%s timed out at ofset %llx [%llx - %llx]\n",
> +				"%s timed out at offset %llx [%llx - %llx]\n",

Thanks for your patch, but this has already been fixed
by accc7f5bf230 ("drm/i915/selftests: fix typos in i915/selftests files")
which is already merged to drm-intel-next.

>  				__func__, addr, hole_start, hole_end)) {
>  			err = -EINTR;
>  			break;
> -- 
> 2.47.2
> 
