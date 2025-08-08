Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03911B1EA7B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB1E10E951;
	Fri,  8 Aug 2025 14:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdtWt8aG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D0810E94F;
 Fri,  8 Aug 2025 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754663950; x=1786199950;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sxrDxzNakENOkIAxQ0YMKRA26n230LPnbIv2/CbkhAE=;
 b=GdtWt8aGP6SGFLFEr/ThryneAJYpInBDpzTo6LLKmp+y2iP/ThBz6hZ9
 83AOi2WI/WIF5N3Rgjbz4AkKczHNrDWImZdhXCNIUw9vhYJ09QblJf/aP
 wfflX4O1lF98vCW9dXeNonkidcZ5og0bKoNT7XkcQTTH/1Vh+VCYk+GIc
 sQ12X+ScPD0O1q6TVEoEeM75ZmiGLoUJ00sgSPlyMdThn76VBx6SjhS+b
 twdlS3r9GWm6URNiTzkeg6fCUWQDRR2i18ReijN98gSVlZWy5dOeH9nbd
 cR08HJfoF0dMinUwnUezc4yUJGtXCtEVR3lB2ngGHztiZnM9jlzMq4VCA Q==;
X-CSE-ConnectionGUID: 1Qa2pgJ+SXG26Xxhs9EbLg==
X-CSE-MsgGUID: 9uwtAXZKQGSWY9nrGyj5sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56889025"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56889025"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:39:09 -0700
X-CSE-ConnectionGUID: sFFFqkkDS86kLXBomv2Urg==
X-CSE-MsgGUID: 3r5xv72VRiKYlmr6dDBMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="166140250"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:39:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:39:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:39:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 07:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZxj5JP8cvsBn5XNe+UBgtvfzeGNGCoPRv5WNKgsCOROU3eeQf022Zt2Zlq86amYfcuyTFw0jPNY02cqm2iAadRvrCBMcLqQpXtrPOgWA/ItgJ4+wqY6nysyK/Ff7AW8JBh5b/ZtBY8f6QaUAs4+h514bVeo5bQImuNEbW8FnpeeOdp0TObZvwrzj9nZpMcAlKnQvFZh6qAlXQ20PdcFZh6tmHn9hldlAqXGEkNeDBg44p+jJ0KcOwEg/ul16yKPAi9m6H25FXTjLnoEN+c3u68XxWfNQcntYZPrb1ZRph8sBBF19HT5GV4CBmmCKfRxFyd5KhiA1RnGtaRBrMtx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHZTcboizCl2/HD+LppSiClmRc1HCis8eqRfpndtvFU=;
 b=cmojexjMZz3sJrdEnJeF1tnek9hZxEr39P8fI1c4CG3Xo82K+oymDXceqq/M2Ua6qezmHHXiKWuILnAT+ghYER6MBzx5Na47XLSBr+GQmeEie1lI2VOVcoLn2EZu5jG+ycSv/atNZYKucyKIy0RDlF7yDsZc68sBxgsIonyN2O1ugW5uq0tRLdIVziVGV+8l8Sx0Fz9sfN27C0otQT23VA3b5BvriyOrww1k0ckvBx7cGd/hsRn5unMeNbx8RXRrroRrHy9HSDEbQ/k1qNJsnQ2QozmL1jJAG1/ZHeLXsee/1bm1Hz+eLghXyyXnqMyTdBNDZ70hU2whL/6JS13KTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 14:39:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:39:05 +0000
Date: Fri, 8 Aug 2025 10:39:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 6/9 v2] drm/i915/display: Remove outdated struct_mutex
 comments
Message-ID: <aJYMBA2Md-0dwzwp@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-7-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807170212.285385-7-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR05CA0166.namprd05.prod.outlook.com
 (2603:10b6:a03:339::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 5003fc50-53fa-420e-11d5-08ddd689534c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E7keE4emxNRlfFzZ/KeWIIM3tTSsmDZJX1H1yHdKmJMi5cYMPSvA7zoK5JfJ?=
 =?us-ascii?Q?j8iNYdr1VBrARq38dXjBeqMMVmICM76De3S2XXwMgLvQWUzkwctDgXdrHl3V?=
 =?us-ascii?Q?mqsrP8W1OxvHWqafjXiUCjx4P43qtQbBIYeO2T+TsfqENaK2vXM3ZI9ltATR?=
 =?us-ascii?Q?jW4jbp2+82qlZ5G6HLD6ogDtpMm5G+dBh6iWI+sZkAqUXfA5FwbrToG0DSZC?=
 =?us-ascii?Q?KL/N+5GZ5XRDyH//kgZiy1k3Vt3uEiQpVjpIejllmn9jt47kSjBLjKqp+v8t?=
 =?us-ascii?Q?dmkAQAxLkvaFXZ3W1Mswsu3jz0Zy9NAebtw/O23JA020siq5jcpuy/UZ6u3n?=
 =?us-ascii?Q?GeCWJXjelKO47+nwTTLGm/zL+somNsR8UJXOYJZURxVGlXFVQdYe1aj+lydt?=
 =?us-ascii?Q?eWg6KrGtgSNQUiTf+sLgJRE2/NMI8SxMz68avFsIRzgw8jSY29DkvfdVhUOf?=
 =?us-ascii?Q?aZHHCvkmo0yzhMrV52JldVN+JU8TK6IDT9wrPbqUTH1op8vNj+QQIHhJJRcz?=
 =?us-ascii?Q?vfrlubzqNwsXKnmA5OebYLa04CO0ALIiYEFmNs/HQ7o7mum9pmcgTq8tAiIA?=
 =?us-ascii?Q?j3PfU2fvAS2HJKfAKEK43AMbIme9lBHyl+GTzxJFP1m2PoOB4v1M2J7A5sp7?=
 =?us-ascii?Q?9VoE0jk/t3LAxzJEdnrbcR72Uo9xVuir5wuL5Dk6H2NxjT6YJfBwEsRVWdoa?=
 =?us-ascii?Q?ss2PwjV5tlKEUtlHidn1GOIFA0ThkpH/8uq6iFzmRmDpaTFMmaAS8evymEkW?=
 =?us-ascii?Q?ySW4MjiZpc7QaqHGCOBwEsTwvaeKI/5ok9HaqRzmLNmhEEIKzghsTtTjz1I7?=
 =?us-ascii?Q?oATt0DX3le3qO1nTLb20fL1fzbiuBOeZNugqGErBsbx46v+YMUZ4lwqVx++m?=
 =?us-ascii?Q?nwTJHI1HJFcitzZ8bPwIJhr2gM3Jlmx5CHuH2WoMte9UPGb5W4ysdfS4qHIy?=
 =?us-ascii?Q?N65YWY63cLrJMBpPTgwWX040n8RnOaGpzuyvw9i3I/cPGV9w4DRTvU17qzWp?=
 =?us-ascii?Q?c52RVcqFG0A2NHjJxW/XFPkAoPdM789/59MmT8wmJgOQHfKsgPt2erOJkqkP?=
 =?us-ascii?Q?BOqizLuzdZ3LGxXhOSFnjkgAmQvf9eLB65npNG/lbwrqEF3EYXkwn6KW7dZ+?=
 =?us-ascii?Q?Dp5RjhFuClJTFL3m/iP10pN7YfKXhF5ABYwosCYHj5IAJCYvmGsSWihr3X3N?=
 =?us-ascii?Q?4uwBitjrJPFPPn7qgXV+95l1R+1jUyTCk34JAOBGSgjW5S0flZsNNSK4eKqp?=
 =?us-ascii?Q?fRLlIXSHp1vV6POxGKRwQpEf491xYkikFlKOa+C2i8chxe7wHzNrqJ7mA1Fc?=
 =?us-ascii?Q?OGMMEOyYGbVih0gosa7HK1uFJ6rqkyw917ybWbLGYMzoGanJ7HPWiQMKmQuv?=
 =?us-ascii?Q?4SEC6hGsclMAemYpwTUpyuidxxhNlsvJXY/l5lomyCWD0WfX5Vs24adP1o/r?=
 =?us-ascii?Q?5N5gkyOE2bg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QW4PWNyI1RrzQPbNhqrIZniFz68JHn+vc7kzDzcgjyfbIaYWI+gubEeWYxY9?=
 =?us-ascii?Q?bWBR1gL9c+Ne5yndG/WowcTQO2qjvZPGMNYtJqOrunxNCNUis8rMutHCwOyv?=
 =?us-ascii?Q?7DtAJwz0TkqDDfa4xUt89SKFmWBvShP1KPfDYLfRidokGFGbsO3CpkNArDgL?=
 =?us-ascii?Q?vrRT+39rFfdMB+Db3g+MFCG9M+8Lvz/VtMISBMQ6uk3q7HE4U73/MzgiONS6?=
 =?us-ascii?Q?LcH0fR2PHUAHyivKH+sP8Owee4jdHfhDw7Y/yCB6BVVaZHYAiqmFMuQU+UXE?=
 =?us-ascii?Q?KfWdhs6cqTzzBzWXXLWdAGyetLTAwhYzhK/zKCqhWKOM3Le3u0i98wkrlxUo?=
 =?us-ascii?Q?QkKRVRtW3Wkc8rbO6x99uAh4P+ObiH8V98igQaU7yfJ3GqXKELPj4OACxeZ0?=
 =?us-ascii?Q?+u7JFkANN0PxcyRqkziPhoWF8e7AMq3qoIQKGno8Ce55RDrsd2zUcrQ/jNCT?=
 =?us-ascii?Q?vxmOW9qBtDeLBq40RrvQlGZGyNaH31+T4IgU6v+BSwhQE/THqyo1clRikTmE?=
 =?us-ascii?Q?4KrscTxeCfJ4rK+MChmreXv+dfS65SgMbf3j+DINh4YXOb+L9yXST02zRDtG?=
 =?us-ascii?Q?w2bu2dtdsQ9/qEsiZHo+PjUlJFL0p0fdc9ZzR8XO/d0f55MB86OMyYxQA+iJ?=
 =?us-ascii?Q?mWkjgnTbhUBE4J0kAGbU2yYsDVQlDSBPFcWFxtc+Bz8meCJ4v4p7D22Z4uZD?=
 =?us-ascii?Q?3wcnoWdW2Ske86BlfpZe+b4M7NGRRyF1eVBtv2YAdbFe/RMwV3aEqYBQ08Tz?=
 =?us-ascii?Q?3bgZLgEOMccOWXoiDOlJbGrxmtWh4kkXd/+GkZbuSlGm3UF/2s+N0TJxTNI9?=
 =?us-ascii?Q?zdOYqXLsXbsIxHUdp325JiSJCVCFso4eGZs5yIIjElr9vUJDkmNDb1v+ITWn?=
 =?us-ascii?Q?4o6kjuDnvRThKZR+rbpwJL8uwzXjaj4sswyO8/pWeTHSWMRxhSPwj8WZAG5M?=
 =?us-ascii?Q?w006x7nP+6OzF7JL2I7FbHJcXd4GwCJGMimAS9GQgWTQyKMCDTGgAJqUmZO3?=
 =?us-ascii?Q?VqtAYP1NMSNInC1B8arL0iAQo/Ym04OUp/AM5N0Wmdhxy7/+8x67SkiGlNWO?=
 =?us-ascii?Q?/rndpHgkBPOGxCf+7d1OIbShmdiFHklD/65xE381EpfZ4YxcYfHDtZs//nl3?=
 =?us-ascii?Q?6CCAguTJ2vhyKswgTzm7f5hqIPIzgN8aKxf9WRGECZB71OJfMey63pPaBkcd?=
 =?us-ascii?Q?2aSGBgpquotU88M9IFFbU8+iELRcV/xO3lZwfot1M3jo2nabHLXAk/Rm2Rl4?=
 =?us-ascii?Q?ELsbJPXtF9z72RSDRiXCpqWmMdtvi6Lkpoxp6+ujF+E5NC5SI3YrT0ZAgPp6?=
 =?us-ascii?Q?oF+uHF8JvQnY9W5qR7yAWpuwWviile7wKat21UjuqlBHcmIIfoHxfv0CMUDm?=
 =?us-ascii?Q?uR0vym6A/d1IH42dY2OWRpJmYI+8QWmjd2pTCE2GimntZIaf1eaYBpWIL83R?=
 =?us-ascii?Q?UVMH6TLb41IQ1QsDuVd2iddp/RP/9+YZ6q89+fSxeCVcNfhwtoCGl/lQf8XJ?=
 =?us-ascii?Q?q/EShxNhE252uOeskJoavkzFpOlmll3vzvnRnwldM/IsEFI0+paceUHgmTlN?=
 =?us-ascii?Q?J3xePERFfQHzTRh+LWqEzKGdAH1e95OLtDum0G2K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5003fc50-53fa-420e-11d5-08ddd689534c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:39:05.5696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW7BLwaqwDtV/zcFWqxxXUwGU3yzAYjrUKbjIrSbSjxPxhzIr8C45wnQZEUd3kwyYn8YxgWSuhTfoYIp+2wkmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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

On Thu, Aug 07, 2025 at 02:02:05PM -0300, Luiz Otavio Mello wrote:
> The struct_mutex will be removed from the DRM subsystem, as it was a
> legacy BKL that was only used by i915 driver. After review, it was
> concluded that its usage was no longer necessary
> 
> This patch update a comment about struct_mutex in i915/display, in order
> to prevent future misunderstandings.
> 
> * intel_fbc.c: Removed the statement that intel_fbc->lock is the inner
>   lock when overlapping with struct_mutex, since struct_mutex is no
>   longer used anywhere in the driver.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index d4c5deff9cbe..aaaabba77b88 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -98,11 +98,7 @@ struct intel_fbc {
>  	struct intel_display *display;
>  	const struct intel_fbc_funcs *funcs;
>  
> -	/*
> -	 * This is always the inner lock when overlapping with
> -	 * struct_mutex and it's the outer lock when overlapping
> -	 * with stolen_lock.
> -	 */
> +	/* This is always the outer lock when overlapping with stolen_lock */
>  	struct mutex lock;
>  	unsigned int busy_bits;
>  
> -- 
> 2.50.1
> 
