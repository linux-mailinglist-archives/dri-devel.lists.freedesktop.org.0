Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D4EC079A1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 19:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31DF10E1AE;
	Fri, 24 Oct 2025 17:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F56c4M7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F4C10E162;
 Fri, 24 Oct 2025 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761328517; x=1792864517;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6u5Gda3piKaIIq24o0AGSTgB/V0ItnaT0NYuHPCTBVU=;
 b=F56c4M7b+mLctJZDSd2VzDcvj5q9bm665gs+h7fw2CfsHpLRYPUdImi2
 FGVeyg5QtIjPvNH7A9fiW2a78UOpqm7J/VxEP5fkFEPvRK7gan4gqvdUJ
 hTyvszazrh8AdvlDRYfmoRHSCOq+yUIz0lD97rfAVMIKMF3K0bqYJi8kK
 wrWsQ1XG38IhCltVV72hrr1mazI5iCiRB7EvZcVeoDQZzkVNL5tfRO3hN
 6L9752NxCU1blnnoI5eJVeFckdfD9sBVYlH9UWuFiSLnccYsTDzSQ8hPK
 stojA0YylonY99illOwBAXw87Py8G8ryODoSi5XFJnybQH7/jz4z7YEOJ w==;
X-CSE-ConnectionGUID: 2cXFXHYXQ52ZqV+PGyx29Q==
X-CSE-MsgGUID: zW5j8MUOScmvCVqm9TKZIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73803268"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="73803268"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 10:55:16 -0700
X-CSE-ConnectionGUID: +9rI+2UxSvSRZ79mwy/ClA==
X-CSE-MsgGUID: qaqzwzkfSiuTVAHl8IS9Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="188874645"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 10:55:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 10:55:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 10:55:15 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 10:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD7Wa6sNlmi69rHb+y2uM4HJMo+4cAXBlC4p0dTEzrCtBNCelh/fgkz+OtfQQ1jGqzpOWjrdBMF63hA0eaa3+PaKSbrHMppHbaJJ1P29GOjrRUqhUxdvU/aDRgUDpahNkf8Gujha31SAjKczZlbhT97hqVqP/9pYb2F4QjFxYsB+db1l1d7slWq4xhhz96G/2R3Jkc6aW6PbuGPKK7w/2vs4iK6nfyys41sXicjsuqmQnMLMU++ccR81YH34/zuEecRUg1POxYwMTQNfvBmeHqkgY65ReiKI8QaJUy7hWzAJTlQoQpm1wr/CVix5952Iz0Z/1Yjuy7f7jYFCRXy4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCxDD4uTlSx3RwiVs4mgSpkaGtFaqvROaxBEc8NWZNE=;
 b=wASfQfDaWxErPWqrawLI1ZeXktsuxducnl0BE2JseHeSLYzEHK29pisP8kMqTBEc5euZ4okOFOBQblMqPNu3sH9j6BnI9y43AuwVmE9zGDmxmKBJMvPFMhiiE+U6y9LmAVKoK75JUPXAzJ8jj/4XwIzE293HzWKFTiP/f/pB0K9/r89veRYgefbdS8tGvlappdYlYuPgX06GxWISR35imJVSzQTWxlFDd4J2dMlk3BpmgnI5JznwHCfYzVz6X6gEvZhr31nnjsMCx7sYV9ZiHwXkvPRwChVhDDndinejBQGprpVD/M1qWxuMP6lXg47jI5ujgXE7428CFXXipM5PaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8144.namprd11.prod.outlook.com (2603:10b6:610:18d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 17:55:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 17:55:13 +0000
Date: Fri, 24 Oct 2025 10:55:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 26/27] drm/xe: Remove drm_sched_init_args->num_rqs usage
Message-ID: <aPu9fhBqEq0pbe1+@lstrano-desk.jf.intel.com>
References: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
 <20251024160800.79836-27-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024160800.79836-27-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e08236c-1050-4fca-1100-08de13267b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2ocBtikPrTHSpqab4A14/e4qK4ERhZsSkuJRlwVkBw9efQny/mG0dBOCE4?=
 =?iso-8859-1?Q?T/dAP2+5W1eBHw4Umot8kNyCjwSzzdT1avG/epVhXVl8YRjsUI1ZQDGE12?=
 =?iso-8859-1?Q?rEq/PN3Mtz/7r0MNCZUSCOj3UPkhRr/I40C/Ft+4y0fI4L3PpbRw7Cz1/4?=
 =?iso-8859-1?Q?kh9qaFIo7C1O40QZsJ9ZGCPPSqXF7enReH4vCuyBfOQeCqAU4z4MwPxJS2?=
 =?iso-8859-1?Q?Nl47/XHSDKUoPHKuoxjjtqGsyhQxSmxpxdUddCaVRTK65rDsLqb0BmvESm?=
 =?iso-8859-1?Q?8IWVCpmv9YIDoJP1nje6M5wql4fknJkGhvDdGnCwuoOpjNL9fCwc4YAOL0?=
 =?iso-8859-1?Q?kkrNfCiNw80lvpb3qTGrBw8+gmp7Y8g/kiR9MXNRl0T+EW0dKoMU2Uc/xV?=
 =?iso-8859-1?Q?ajQA9XKfxY31WMPv+wUyqj7BTc5j4u9GKnAJ5TMmdJq1pS6VtDenTRNDEX?=
 =?iso-8859-1?Q?DqVj+l1T34CID6erz+kiqChswT7GAksfrX1Fg0vvhxJmRgwNVOELbPw+P8?=
 =?iso-8859-1?Q?RNYygwGB00qGapbeebF5YVX8bCbTme4B8E9KuMz0TobedPJCAxiG4DYe5l?=
 =?iso-8859-1?Q?87dBqdzPA9f41kUkg4yI3hIE199etBk0G3hCCsPnWTvJ9bikOybRJ1OeDS?=
 =?iso-8859-1?Q?0bd/82uow2XnhnqV/ujKe8Qp4XH/Xt47VOFzUqCP88BkLVQRqOLZ7dIe2P?=
 =?iso-8859-1?Q?v86m5xpBUlyOg3Vwg2olIOLmvwatT9bxIFQTNeb0hvH3Smumlyau4Q91ij?=
 =?iso-8859-1?Q?mE3Z8lZYdpoLo8+DhfuBVbbd9/BnhNLuK0mqKnK18MJRtnftqbkPVfUqhD?=
 =?iso-8859-1?Q?v3QSjsGnIpOirG1l0bgKkRcJmsCLAQ0q0JIsBdUd8C4TAuih+ztFwtt2fa?=
 =?iso-8859-1?Q?FC5eCKoehHw8ZUKMrA9Ka0MEKsFh5OvV3rZ+lnLSOPHT/Ht39M4Z3cb85i?=
 =?iso-8859-1?Q?FDVCgbQ1DA7CcP4R1oukmQ+KceE37CIvpDV1vHC2pNUzlkscjBZiCC3YFC?=
 =?iso-8859-1?Q?w26e6X6lQhPDkOv+DjqY2S2tgYx/tJIyC3DNQaUlsZpan5knyHN024r6ZZ?=
 =?iso-8859-1?Q?YyDDt5OPCpgcJvKVqyMy1DMQYch62WYEqGsDraVR2MVEReCnZwWqrs0mG/?=
 =?iso-8859-1?Q?vk44+5s4kZW4T/eJmagC1ST8Nnt6lySo/2jfdg471iEI0Zip/VrteiRvlL?=
 =?iso-8859-1?Q?JGHAB1b6a45rT9x6hS8E5nsUUweLtWDaEEIhNAQg0mu5CnM7ucd89eH8bj?=
 =?iso-8859-1?Q?1CXlESB3m2Omm5mdVLoKkWrTzRjwiGmm0sFK2qEC89wco+bZc3YxJiRFgB?=
 =?iso-8859-1?Q?J7GW6OzUbDqnR//cENYPkktxdjqQ2WmlTztYC7OTr4Z5U7INwXNMs0PsMz?=
 =?iso-8859-1?Q?P6HktvJC8InDTIogQ8w2YCy0m/F1THp9haUMqe6bVbaSjX1wzGGohiQ1iK?=
 =?iso-8859-1?Q?Qc5XJUGetJC9YbTrLpK855W1sgWSPaisNhwNXrEsx6E5WDVSj7aqRe5D0N?=
 =?iso-8859-1?Q?6tb53Q4oMfUq13RME8L1E7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XadjcW8H/6gPcQnQUimZbGL/zsozwR1ARWtKv2btikWVw78hLnUaX6JzzR?=
 =?iso-8859-1?Q?2kC41n4TqJ09PS5bCvjEF4maaOLTDmmgwhWrVZvBk1QQtpVDoE1cz6uWrs?=
 =?iso-8859-1?Q?0hNTlDyELAZHP9aK5HxaDgwV7NFE5gHeHtrQZJiIqkiyAKxV9aUGFm+vkv?=
 =?iso-8859-1?Q?w5nIYaoHopfUPk0mlYADtomyG4TioNhnswGj0mmHIOGeYIrI1yU+BBnKa5?=
 =?iso-8859-1?Q?rNqiqDbj8L5DPvLu7AejBg9kKKANXbuitFcLfvf7v5VuEz0t67vTEdUzY0?=
 =?iso-8859-1?Q?UYZ1rkK6Hnzqk5og+nS1yfupuZyhRSqtBYN9Zwhw4FkzfF8ju4TISuVibm?=
 =?iso-8859-1?Q?+fmEAQzxXDuIjQbTvG1xwDGLW+takxJG549TWO0a7nh74OYXU6Ln1ZXTok?=
 =?iso-8859-1?Q?P9Xs55PP4v31HNnbEPAWOClS1y896f8xb8ARGc0/B5sw5lk4Ovmr48JLNE?=
 =?iso-8859-1?Q?S7je8PBvby/HJvxWH83I+stLreghNiy6rxQa4t4dLYK3Y2r+0MM5iCGf/k?=
 =?iso-8859-1?Q?th+Q1HczBBD/4IGba65PcJpO602j6xORPZa0LHKsY3aFjZQgQ8pJ5pqeWx?=
 =?iso-8859-1?Q?9f697YvWh26yShsXXBNmmbkwdX7BT8Y/0fKp0qftrzreErR2tPF05Lsjm/?=
 =?iso-8859-1?Q?8UxkBr9R5Wd9OvQg7dozMg9k492ARjyJd8sI2jiE/+x6LgvJ6bx0BvzJMH?=
 =?iso-8859-1?Q?zYouefAp3e7N71NB7rvMWR/4GlOkBG16iEXm5ux8yqGgdTnwgtL3vipB5/?=
 =?iso-8859-1?Q?kCYGPEi8yGfLgfWXSAwFwtp7T9nA347YapHnkURetXA/VBiMHfkrRqANxN?=
 =?iso-8859-1?Q?8ZwQSqchKla0QElvF3IDYYFFFeWyb75NZlz+YNUvXZwkH+Nl5VM0G1lSsX?=
 =?iso-8859-1?Q?6APdeLcSzZGi5oyjqJ/1HIyaIQUDRWrqcYMha4g3PqjYFmsiMLAYoJVhAK?=
 =?iso-8859-1?Q?k9KaS8yxu38lqLrvRk9G3KQOClrBYrmPzBcBJxa/nOgnvssR0ZZhg3ppcA?=
 =?iso-8859-1?Q?XnfK0Ge3bYgN1l2TxDi9q5IB/exRR/mBSIezjZKzXH0QLqYYQD/RMGhHg/?=
 =?iso-8859-1?Q?7XyCf45bcY9BiLC3QXGah87OZ+rvAKVWl3i9Rk3DQyd+8iLe1rHeJCZ6LL?=
 =?iso-8859-1?Q?3wkeIRDLYxPtoQlagPKEsWRD0hNZfeJc7LbRF3bGkmUKs+g/29Sa58KRLg?=
 =?iso-8859-1?Q?+H5klaC2xi3RBVfk+Nfv4Ef3Wa1xLGhDR2Y5ILfFVM5ldcutdr18qiqmYn?=
 =?iso-8859-1?Q?ss+3eIjC2ePbvP0VbEvt27J833xTO0Bu7RbVCfXP+RAwma6s5FJdv1DCV/?=
 =?iso-8859-1?Q?ktDAsnMgnasr+Y4M/QnH++QhEUkJXpzvBZVlNnGs/6vCWlfKbKOo07Zu//?=
 =?iso-8859-1?Q?XAHa2oO3pwURn4V5hMdhXz+9L6EKnB7O4Ov7NYBQJ721/JTyfMxiW2KhgI?=
 =?iso-8859-1?Q?xItsgEHU/kP2K91GSz/jPomWh1+LtnnKFIxzy1B0tl5kPPeyLox6PWOdmo?=
 =?iso-8859-1?Q?zEnwmi6L9dp1jfx0F1ajkow7OkQH7oNj5c7cf4Fg4afXaKoxT6dATCpOyp?=
 =?iso-8859-1?Q?USXWi8qW809iqMH3GWeJaa6GQUiF96tslBSVYkiu+fnQczMwl3kegyDNKX?=
 =?iso-8859-1?Q?xhu6Z2buq19eHTNX2MjzRw6/hN7Z7IdpTKkhPEoIgq5yF6bYFJsxhCEA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e08236c-1050-4fca-1100-08de13267b6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 17:55:13.5298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndgo36002F8j4YZqStduqrPRxuQL3zWqWYs3xwfp/D3kcvWH26ca8Usl7w2Pp2nQk+Kf49XACUhuM5rinv2N6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8144
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

On Fri, Oct 24, 2025 at 05:07:59PM +0100, Tvrtko Ursulin wrote:
> Remove member no longer used by the scheduler core.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_dep_scheduler.c | 1 -
>  drivers/gpu/drm/xe/xe_execlist.c      | 1 -
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> index 9bd3bfd2e526..2c7f43e61069 100644
> --- a/drivers/gpu/drm/xe/xe_dep_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> @@ -78,7 +78,6 @@ xe_dep_scheduler_create(struct xe_device *xe,
>  	const struct drm_sched_init_args args = {
>  		.ops = &sched_ops,
>  		.submit_wq = submit_wq,
> -		.num_rqs = 1,
>  		.credit_limit = job_limit,
>  		.timeout = MAX_SCHEDULE_TIMEOUT,
>  		.name = name,
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 769d05517f93..84a46b919221 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -338,7 +338,6 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>  	struct drm_gpu_scheduler *sched;
>  	const struct drm_sched_init_args args = {
>  		.ops = &drm_sched_ops,
> -		.num_rqs = 1,
>  		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
>  		.hang_limit = XE_SCHED_HANG_LIMIT,
>  		.timeout = XE_SCHED_JOB_TIMEOUT,
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index f91e06d03511..cdd70e32cdb3 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -66,7 +66,6 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>  	const struct drm_sched_init_args args = {
>  		.ops = ops,
>  		.submit_wq = submit_wq,
> -		.num_rqs = 1,
>  		.credit_limit = hw_submission,
>  		.hang_limit = hang_limit,
>  		.timeout = timeout,
> -- 
> 2.48.0
> 
