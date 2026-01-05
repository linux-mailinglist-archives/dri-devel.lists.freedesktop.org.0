Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3B6CF4D03
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7510E41F;
	Mon,  5 Jan 2026 16:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hM4HPcQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DCE10E41B;
 Mon,  5 Jan 2026 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767631872; x=1799167872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uAae95ePgNqNZH0fEi0lSPhEsb0gh1xcrGiG9KiZZIU=;
 b=hM4HPcQv0drEdNbQkKlojvcPvJerCyqT8kdRSrPGHXmqn9gdkCbmXfSC
 oqua1Us8rJT8Qn1ujpxjQE6B4BJ1XTLLqv8L1GpEl6hNXkvtP6nbO5W87
 10YFRJeyD4OU7c1ZfPbhGtkpRxsPEVvO7a8UpuuVQeeCJ5MlGHOALzDO5
 iTDcdUTqQFLPybCZcbaw6inmuMs4LhfN/842k91JLivHyC1XQWcQVb+dM
 R2cyTo6ciuOgc+w5t4MykN3A+HtOOKnhwQl5flf+Af0HOEgqnuq6p/95q
 IgmYRYvbIiOihoTeaSEu31DL3v2WR0wPlnK+0Q2/yzyqi6dA79BE//W2c g==;
X-CSE-ConnectionGUID: PHNSbbkDRkyiKvw0ktDBCg==
X-CSE-MsgGUID: ZRLG+nTARDm5Hi+P/WsVJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56561299"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="56561299"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:51:12 -0800
X-CSE-ConnectionGUID: sJwkCEjsQAidAel7Nj1czA==
X-CSE-MsgGUID: gGF8CbOLRg+xrCv8tnLn2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202447709"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:51:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:51:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 08:51:11 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:51:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6a7Q0cha/38gUrDbITLoIuazp3eRLqcm9WGDP3fCaognBd8lnmIJRue9AeafoxLAhisUTAsbQ3BJpgsPExCgjtMJd2jXYtz6f5jflp3+ndf+UijkyiBoXSaHZVctppvPPdg3Brz8pSgwmmeY+bxN/7H56lBY8VU1mu9O6zNTNeTqxDp1ngBcc2VSXb81krjTZlF7o1SISkY3Q5JqVkKDb+8Nh2EJRLpZKDqdDvt6HpIyS/4LxbskapMdydHZc1/dOuhMgmBlv98ANO1WXdXUxoTD0vlncgWU+qKiRQY6HM2DqQeV/cAp9UU9NgfNS+BUi/ASzGE8e6nNe5ORU4lnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70uQEDhlFt2jdkEAnwAskbPq2o2dWi1K6XrSqLEP5Y8=;
 b=YgXbt8FxiFZb48AV9hsUT6Zpfut4z9wz4Zh9EqMeKO66bMCpt6QjtqlAx2zOZtEX7y0HlBwWncVk5mWy6j+JzjM5+QJpmiFqGnihFr4O5VTTrZpg0b5oagPzOqP8lIyYuswN1GPPaZngSgFrV5/b5kpD2It5JRWq4r6B4NOOdKjoOzHo7Z7QOm6nBc+mGK0tWtkPwHvLFuZsl1kiVwz6X9cQEOeWjGM7QlNLy7PM7n+gHzJXagKC2mRIMCiS4U45SfZdqtL3Y7yujd20wfTCBYLItkm92FcFpYuZvzPul8pCumJ5WeUpVtQMExV6rU6F6L9OcU3VLFxx4zZPCHf91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 5 Jan
 2026 16:51:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 5 Jan 2026
 16:51:05 +0000
Date: Mon, 5 Jan 2026 08:51:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/5] DONOTMERGE drm/pagemap: Add drm_pagemap_cpages
Message-ID: <aVvr9+8TaxtpUTUW@lstrano-desk.jf.intel.com>
References: <20260105111945.73292-1-francois.dugast@intel.com>
 <20260105111945.73292-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105111945.73292-5-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: db2a11da-bd96-487f-a4eb-08de4c7a9e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?glu+iyBZT6OEyYV+oGgh4lcP+ZrNI9+DTbe7u3OnRF6JE5JGShy1URc+e6kh?=
 =?us-ascii?Q?0ymTXTSLEvAjlctXd51oG0SLBaPVBmO9HsdN3kbu32A7a92gI+xVE2DPWBKs?=
 =?us-ascii?Q?iC8l/8owpWO2kiHzg9/HiJFTWFy3mAOsqQW7DCoeD0aVirndC83ReJxU952s?=
 =?us-ascii?Q?ApF8fkGLDeUE0dGnspEEm66SwYMdSoETPAu9Uw9aV/Im+l8Ni6kPCwsuAC89?=
 =?us-ascii?Q?e+HgBck+VLImSyMq10dZAmYBXlq8D5gXNm4rejvUX9d3hdL6+BrGsWUfa18K?=
 =?us-ascii?Q?OdKwuATtjfZ2QFMZ2EkeeSpLyIIl3KYs/fYp3gdm2XYs/qTUUb/mBEzfF6HX?=
 =?us-ascii?Q?2jm0mojmYV4h6JzK6l52Ydpwroq14R8B1ERuQDC318to/MDNkZlNC/R/oDAT?=
 =?us-ascii?Q?y0iwlNeE7Ksu6Ir9UB+tbCxFuxSYThRexnWLxDopdX+VoGRDZXO8WtHY5boN?=
 =?us-ascii?Q?OELtmyUBSBbSg8pdLoPUvK2H3kTAcprsqiYJD/IB3ZYo8UXxlOlmIFL4lUJb?=
 =?us-ascii?Q?US6tnlTwNijc/uTBcwzBF3l2lv7ie8/wnPATh+0DF8nlwsxXTsK+w4wElkLd?=
 =?us-ascii?Q?ZWFbGFakwBdxEGPZ8EcEkY5+4ulJaX3v1iU/ayl3+EJn267y3nCRaqqeX46k?=
 =?us-ascii?Q?EddDJByqE0558FK60W++K2Hry74Zh+FwxMxtU4murolGJBfLzPiOqj766x0w?=
 =?us-ascii?Q?Fxtla7Poyyq0zxhF4X8GyArzezGKipW4wpqLnMkbcXw1ThDay7w6WqEL4s1t?=
 =?us-ascii?Q?It1tKmWm71pjUTN4b5W1ZPI16gjcob8ZChS0R2s9TZYa9tk4OiA1F9dUpVix?=
 =?us-ascii?Q?XYuiI9kx3rBNRffIAmrXdK3VJ7huFV7R0vogUfp9IOzeduXL3iRenZ1oNr7+?=
 =?us-ascii?Q?x6UOgFKtI1LM5noToYIzwxnSUQpZWbYfHA59GM9nM/i66ebZMArna5ToLfoz?=
 =?us-ascii?Q?Yz2U0pdD20RPkACA/KxD7qQen51vwQn9bcbj1QyaB10WIBDNJd6TDIw3AJbn?=
 =?us-ascii?Q?1QzM9w06gJbVZs5tbXt/kAbKyxomucBUe5sMA1OGlYMqNkANkSYYaLeP+fh1?=
 =?us-ascii?Q?8B8Ou9gIvZPK09BVjd3ER/Yv6wLAtzITDmWfTcY4zHfpWSNKG05wheDoPLwe?=
 =?us-ascii?Q?f3f1KISoRBPbMjTrd/nsfZuMdkBejg8Uk4TGbwGegwgC2PU5s4dlQQUU3AgD?=
 =?us-ascii?Q?Q5vc+8SwoLTyTQYhxbkk6UzLPpi82nsl7gkcla5hdJlWwT6/KYUU40rshB7r?=
 =?us-ascii?Q?MWRryaOzHruqazu54kU7zswEwB/AwO7OVgQmAKN8uErbkOotP1n5L3T6Hg9e?=
 =?us-ascii?Q?kzV6aVEThHcG5DEYbSSy8Zg6XpFnTUP76UtEhH9nkGrn2zFg6MQrMtcbCqjc?=
 =?us-ascii?Q?1bYTGrsuuZSQ89L+8C0SiqkuYOjBsuRk+xA9pTFn5HWH9dthlEcjh4Kv88Rq?=
 =?us-ascii?Q?t9t8G2AGWxiwnLL8uPYogeFFEPxk6c4W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zsu8/kANAkPTKi6JDBhV4NHIqcBLrFzsi61N5tw9uqgDJ0OFuPherTWPUSLG?=
 =?us-ascii?Q?u+g4o17leKGMjFH8SfgDDQXi3yvpgciAilWhy4XZHtNyvKaLY+wBhqBucB3f?=
 =?us-ascii?Q?hM5pDsRAlzlTz0PpV5BGHq8ajl/JJw8elKW5f8AZZKh2MfYLG5NXRe9gfiAa?=
 =?us-ascii?Q?JQajS1SOLVoTgXJdjSv6UFYVkEcGSTqrGi64yAbaQQEGqXVadQQdnmLuz1K+?=
 =?us-ascii?Q?i/XlPHXO8JX9cJmXEgCUrZxtOWGuovx1Cgpjo2erRJZYrfqm5kOkg0lX1SYY?=
 =?us-ascii?Q?RHaTKQRquQfUfbFbKcelJXcSpCkZv1fCxQW21e0mJyQL6zRGVV74Hh1qiKH0?=
 =?us-ascii?Q?/YBglv3K339qFGH4Anpd+evKCjIM9avJEPcQy0wehivjNQEQXTJTIzEijGhD?=
 =?us-ascii?Q?wrLONJAtOq606geVlYvuzjWlprP7IFF250Xss5cueATGcGCXAA73f39mnS/v?=
 =?us-ascii?Q?9pAs3SJAbrjZUVRu0xX7uJbvzH9lJ9NlnsP7AVbhVzlvX1kzCVHPGsaFKMCl?=
 =?us-ascii?Q?RPTe50yhh45IOMCZtQkmGcN+gHNfDqLAWF/7JFyXxqJGAJuzNAqai0lLU5NZ?=
 =?us-ascii?Q?ytp9h1fJx7dL2EolH89Nwv05iZFwawcVdcivvffsBcGuOpY9Buru6F+gM7sW?=
 =?us-ascii?Q?PitPYLHbRQInm9OPHDBt2TeHgcqVkg11g60UbXRsryoNWtRl3aoUX8fguTkq?=
 =?us-ascii?Q?5kKHvGX2wvKz45hqIlV6d5DTtmcv9Ds0zRv8qYYMzFZMLDjzHDNQ4/slMVDV?=
 =?us-ascii?Q?H6R/wqxTvxJfPatXBkD+tO/kiFKhBACxSGSBxlRN/QuoVMNvqXc29acygkZe?=
 =?us-ascii?Q?kHh9tiJ0/H+ihca5KgKHx2DTsJmoaD9b8eqnP3mTJKQMeBp5rIKp5cfeZSLb?=
 =?us-ascii?Q?GP7Sd8PYdgVXOuT6F9SSGuKH8WMMcohtK7eYjlMiPjVw8lSGZp7nmZ9nTLcu?=
 =?us-ascii?Q?02gr7xU58b+q5Z8szQkjNRORu7WfPiQf+SWWZRb6FN29OI9g8b0em1XwoDF8?=
 =?us-ascii?Q?LVof+JhYWpjVPzlGA8hP6nRfZcfgzOdp84qtIyOTOgqveZ2XFpITWVthoE24?=
 =?us-ascii?Q?t17d3FJqMN8/kLGLvUaf1ox9mPrNS+Xc3L4sssb95q0C1ZyKfk2p99KylAyJ?=
 =?us-ascii?Q?WbS52kJPoKfZGT3BGNqdLNQ5rJG+7bTENzxcDIIPoSf51EULZQCr2laxS01+?=
 =?us-ascii?Q?YQH/SL7bm7d58BZvTs2HNyQVdGLTDkJDn9Ehv2AD88hDmkO+P2+iMHr3ugs9?=
 =?us-ascii?Q?0A318e5voWG7+IPLlsat4Yl/h/ndggHLFd0wUJ4jqi/DCUbWmMRpowNhRjA+?=
 =?us-ascii?Q?bOK1i0KhvVddMm5eYUhCayjjGQ4ceiC+AyySAgGDEJBB648Wlrj1PB/bHUX0?=
 =?us-ascii?Q?vTlL/EHO+9lH/51Q6Zw2YWndgCjL+rXy35OnbD18hxByEhJ2Md+aqAtUJQq3?=
 =?us-ascii?Q?YCB5IfTQNtmg6TWnNOlyMUGjiBDM2fcrUjBSm9daaSswGEuHikTsDeWAXtTb?=
 =?us-ascii?Q?8Qg1oXMI1zaqM05CZw1ER/GqGPsyHfhAbihXMyKZTXaHh4wMp4oEuGuj6j50?=
 =?us-ascii?Q?LinBLGZB6GH5SgBQASPpsrQCEpdqXJWBBaOCVkkDkt3Cufk4UnRh1qwirJ4c?=
 =?us-ascii?Q?BZQ7fCEpmAdP/SJ9OeE68wZ0S50zuGbWM7ucu/SDUS4dofBqqJqqyu6tV1Mj?=
 =?us-ascii?Q?OJ+cBjpsgs8FupAVX+2Q067s9KxgBNm08jcZxuEeP9Phq9+lhtq96owA7NWf?=
 =?us-ascii?Q?y0F23Ng5UYvR6+pVnIXckELY98xrFt8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db2a11da-bd96-487f-a4eb-08de4c7a9e26
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:51:05.7765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J86xqrUXf4YFVyYrcAIdRHQpW1m+pPMjxUdTlpUGaPeOpMo63KxZHCGLomUXixm3sWKOxq9mYnrsKuJPI4BS5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
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

On Mon, Jan 05, 2026 at 12:18:27PM +0100, Francois Dugast wrote:
> This code was written by Matt Brost. This is a placeholder until his
> patch is available.
> 

Patch looks good to me, change myself to author and use this commit message:

drm/xe: Correct cpages calculation for migrate_vma_setup

cpages returned from migrate_vma_setup represents the total number of
individual pages found, not the number of 4K pages. The math in
drm_pagemap_migrate_to_devmem for npages is based on the number of 4K
pages, so cpages != npages can fail even if the entire memory range is
found in migrate_vma_setup (e.g., when a single 2M page is found).
Add drm_pagemap_cpages, which converts cpages to the number of 4K pages
found.

> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 36 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index db3795f03aca..05e708730132 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -452,6 +452,39 @@ static int drm_pagemap_migrate_range(struct drm_pagemap_devmem *devmem,
>  	return ret;
>  }
>  
> +/**
> + * drm_pagemap_cpages() - Count collected pages
> + * @migrate_pfn: Array of migrate_pfn entries to account
> + * @npages: Number of entries in @migrate_pfn
> + *
> + * Compute the total number of minimum-sized pages represented by the
> + * collected entries in @migrate_pfn. The total is derived from the
> + * order encoded in each entry.
> + *
> + * Return: Total number of minimum-sized pages.
> + */
> +static int drm_pagemap_cpages(unsigned long *migrate_pfn, unsigned long npages)
> +{
> +	unsigned long i, cpages = 0;
> +
> +	for (i = 0; i < npages;) {
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +		struct folio *folio;
> +		unsigned int order = 0;
> +
> +		if (!page)
> +			goto next;
> +
> +		folio = page_folio(page);
> +		order = folio_order(folio);
> +		cpages += NR_PAGES(order);
> +next:
> +		i += NR_PAGES(order);
> +	}
> +
> +	return cpages;
> +}
> +
>  /**
>   * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
>   * @devmem_allocation: The device memory allocation to migrate to.
> @@ -554,7 +587,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_free;
>  	}
>  
> -	if (migrate.cpages != npages) {
> +	if (migrate.cpages != npages &&
> +	    drm_pagemap_cpages(migrate.src, npages) != npages) {
>  		/*
>  		 * Some pages to migrate. But we want to migrate all or
>  		 * nothing. Raced or unknown device pages.
> -- 
> 2.43.0
> 
