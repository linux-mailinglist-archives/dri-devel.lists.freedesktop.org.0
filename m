Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C628B2C893
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 17:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201AB10E626;
	Tue, 19 Aug 2025 15:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+cmlCIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D925C10E626;
 Tue, 19 Aug 2025 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755617912; x=1787153912;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iW896345ODoLgfk7bPLk2G2OUlsEh9WHfTqwmgCI8Wg=;
 b=N+cmlCIV0EAntb5iK8+j7QRkGEAfIeJ7jFFkEVBNjRiUxWulv7onan7E
 gz6hEDg4TmP8BW+K1JOOcxLHNr2nJd+E7DlsH9xeKYCV3ZLEyEmq9yZ+E
 5MJraoPbVd+W5I9A1KE+Z4oQ2andIT7Xny6iRbvcZPdYSr8PrZLLS7hTU
 ORUiZedBGCvzhH4yunikse29YLBcEKUx8ZXITWb1EMBSCRJK1kHwry2Ur
 NK9YZBvBNzSKiecqEX3A4DZW+NzebOJRd9p2OePcrkVqpcw5BhCVMZin+
 I5rmzgxEGFaitBqgZGxYKn5PCg8876Z6soHO+mRg6+vmwVjk1o5p14rok Q==;
X-CSE-ConnectionGUID: fjSXaU26QzqVQO/8hvVzZQ==
X-CSE-MsgGUID: cdri/OCVQZibcxR5M+1MVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57935141"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57935141"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:38:31 -0700
X-CSE-ConnectionGUID: gckl3Jr8QbeChuXRVSkp+Q==
X-CSE-MsgGUID: zo3yZlQfRx+4CeD+vL8nyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="205029381"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:38:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 08:38:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 08:38:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 08:38:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgQ/Ah/GxKsPUPAbkbnCaRdGUGsP+mZZLhD8o0BDoZ57mZpwP7ejbVQRLhu2KlvRX23dwLuDxyzXtPZOt7FlnW3GIywUx7gyHzFQ6wayfxQQvfU+QKEjPBcBMIzWIvzb+en7Ql1mhdwTFxQr/TWZFMId6bMPVYQegNQeqpSCntBLXWK05DEsKR8EfeQWtsv0SNlvr5ZK8pbPC1uhAdkgs6ZWMOYam3ZYFGhROc57C3j97x7jmP+m+Js7z56NzskjrHujQQfGWZFp+XgTZPxjlPmbQGgT6CagQjrt2PTG62dSJXzawNHluC3fzzYAoB/wQvKVw3MC0LJ6NA5TyjbRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/cuYtLvF0c3oZIAtA6iflQ1eRzXSaA7R9Eg4SL1dbY=;
 b=aX4W220QpvZJXT30nidQKt1E0ukiXFJgLQD6l9W0Jfq+Es8Wo525RIiEN1XnpXb+ONqFYaIWKZ3vKnAQG6RQ0b56y3P0mch4ZTxQK0eIj7MSKmdJ8eSGAALWkdEpcpQHtR1R2qaBuLDxi5FGX6p/wdR3k+xvKmvNW673OfQj8Y5YG5+Kq7+6OXm8ENugk45dSBWTDTUKYHk3nTxGNjFa5+f53L9Q1TqdVZb/COB3iw+cBNMHVuqt3dbNDB2CNHH7+xxbG8kgtNF26TDUV0/dOHVcFl6nKo67rDjDRabbjVpGSZekEfKGe+euzD9GDLKDvzIbjt8sBFQhqt/ed5ZSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 15:38:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 15:38:28 +0000
Date: Tue, 19 Aug 2025 08:38:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/gpusvm: some kernel-doc fixes
Message-ID: <aKSacWRJhswQUUqm@lstrano-desk.jf.intel.com>
References: <20250819152707.136531-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250819152707.136531-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 310540bb-0ef4-4563-cb1b-08dddf367179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?54DgWloYb+7c7xE6H2k/xkbs//Uvrv+COGWgR3FkNuF4h8EFKTbpQB1rcQZe?=
 =?us-ascii?Q?QtvbaAf3EtLZ/CuB6QS4NUqWSArbtl4muNTOKQxqX3G4V2M4O9lO+B9kw84w?=
 =?us-ascii?Q?q/izCF+OLXk3UEtaAncSfL43nYkwbmFpcfgttuGWZfF7A43OYA5evLfLg2Rv?=
 =?us-ascii?Q?wYL2rEAKgBHVQLYittlOGSl9mURcXJSfoQtSF4s4FxIbnH8S/kM7o6N1N/jm?=
 =?us-ascii?Q?BjE/5FI9a4sWK9gzuiTxgUxORgXVzDgY69B84Q87EU3bPNLALWCdq1rKnjzM?=
 =?us-ascii?Q?dNu16gUHAu/Mpewd4ZT4ena9jSx7rUkbivK//8k1xlRvfJ3VB+HUF0Oj6qH/?=
 =?us-ascii?Q?Tbuy30oUOPUWYJzJ/u4lIn1Q23qYR7qYhNx0+aslrmby7/A+CkgCLEJrwzbc?=
 =?us-ascii?Q?5amY5loDariHKZnRKfaV4xlVppzr0jeOPphJqttI14QsivUL8HXxoD3mx2j9?=
 =?us-ascii?Q?3Ph5FUvLtgp0YVtjlg43YXfLQyXdcdiuRgs1N+2+SfHCLKV5AjZOrDvjqFjZ?=
 =?us-ascii?Q?6tEXOIPwdaPHNMwvtzztRfo1LscoWbfDGcsoyHOLemMDqtWV4wgg/zDyjROb?=
 =?us-ascii?Q?WUpLMbcfMEryMKz4cfLxitWfrUgbuZEojnSOMPAM4Ka3pFD/rExdKEBMUoK8?=
 =?us-ascii?Q?kWQScaDLAeU7Tuy+WrkTdIRQOJri2S2zA2OT0rCleECIbw69tDBgPG3ciYjV?=
 =?us-ascii?Q?XsajC9PGjfVPspXN9ShZsEtcXgFSRMY3wrpG7ym8/C7SmYMGX4Hkb3MdC/Ly?=
 =?us-ascii?Q?MBIlCemDBZ9e+bgrEkmbVZnT07O+Y0EE6ILeT1LQuVuTIUxeD6uY3pGt55HX?=
 =?us-ascii?Q?FaZ/lwNYRUWaQX8UYTRLBWovemzOlRoQMZzJlr4SHaXgxYf04IH59e16J+VG?=
 =?us-ascii?Q?A6AKBG/vHzFSYMUUPtnyHWej53UIpPRB/lTLWPQkB47FZOozNoJ/nX1Ros9V?=
 =?us-ascii?Q?B3sPK7z5BT3ONI08Qncs81bnGOSAcIgP7zxup6dTZj/11pS5axmZDIga93J/?=
 =?us-ascii?Q?92uAGREPUOAhPhWAQyD1pNbcTqF8cLiFjCDq9S4446shB1xenQd8tKBGEwo6?=
 =?us-ascii?Q?OFlFG+1XsRmu0xOjgWDTrKb16rhzaYi8dWYVvAKNZpojvTN3KHU+I1COwR5p?=
 =?us-ascii?Q?SEO2ppBtHIy/rS1/Ny2EmVbI6Ywb96oQ/e29XkIBnBaTk1UvR8jErk2+PHP4?=
 =?us-ascii?Q?0fYbqH7EZF3aHFI2QkfVfffUbvQqbzPjRW+yRxPHBBVp2/Uwc5Yly5X3HuT0?=
 =?us-ascii?Q?aRra51cPGeSz+P2CDrS8oMk3di0uiHox6OCkIyp+tU3l94ZVJcFaj1gCnKt8?=
 =?us-ascii?Q?kKWLglbQJSrpkYv6V+z6kPKTt2V3PhzwA/D5XCI4rUy0fN+CpNLcQNmqUlaI?=
 =?us-ascii?Q?m9TZxYM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXfQj9HIDvJDzU6iQqQGIeOIX691zh6MRzdySb4RALVwuUqvhOrcBcqipau2?=
 =?us-ascii?Q?nf3RUpjDHfq4L9KweL/JhWkBSPxcJTnI1TLQsVxQ6WQFP3mErUZvCFtknruF?=
 =?us-ascii?Q?R+FbBXmlmDN7uNic6h7i0WTMuhCaJNQboseZOEkCDfWnrtiAHyQPasKodTia?=
 =?us-ascii?Q?LWHP/zl/DDPiLoLmGXttXdZ9tq5Lj4nY0iVbGnpptKsrR44j3jerW+XR5v5k?=
 =?us-ascii?Q?Liz5zvhDlvukr2p+dQ77ZZk0mGtrOA8ab3RYtCHEkxDlBvhz3Va+szQcY9Qd?=
 =?us-ascii?Q?jY2cR36+uVNh0jNQdgjOLDVvNSeA9qLoaVAyu+z0sefiaDLIH/tWUZ1Fq4rx?=
 =?us-ascii?Q?BjepxCJoJbe8lZfR0jFVPf0X65FKkFOdnbnXaUau/rO0yTuFgrkOknEGCguh?=
 =?us-ascii?Q?/kJp2iC7KBY8yPFuvf7fx9d2WmtAzL+Vzw6p5uS0diHkg2RNs/YQ/pf3JOyP?=
 =?us-ascii?Q?6NVT9KMVL+/xK1Hg3mxi3XQ4EsqaPft0Ztzl7MGCUFTiMgp7GfsX3leAQk2F?=
 =?us-ascii?Q?fphrE0sWOTlaXMrriyBSo8AGxCGZ1Nsvpd10xXp/G2PFJMXTR5skETfy2aXg?=
 =?us-ascii?Q?MGYA4iHxdWf4m9QQkLlHZCX0/pqiMlN/65d/x6BeOOJQeC+DrHnGvdPU43Ob?=
 =?us-ascii?Q?RXwLTI1wKeZETJI3M+FfBV8tnRz5BWmsb4sf2ZhwnxFEeilTC6LJslrckwfW?=
 =?us-ascii?Q?+7V9x96s5dPlEblnJs+Yvmwqb4KbZvMkinCRGPghLiVnmaa/CsjHHZ84jguP?=
 =?us-ascii?Q?/Wbm2IhVsU9vXZpsaJ8me5003kmjR/Q8R2NfBrOVfZgiJFnKHWthJ+vV6O5z?=
 =?us-ascii?Q?dZKbo3ZSmhvrR5pk3MZwagar2ILPMRU/GLU6Ih68WW1lFkUn1tMq03tN4Dec?=
 =?us-ascii?Q?VNHgc6Cpp3/LN/cC53X/Trla77XiFiW/rWRuSSesuXqZxKfLpInzM+q2/k+N?=
 =?us-ascii?Q?aDsaH6//azyrAOomLG6kOyahaK9bRLZk8a4S6bgUU+5JEXNQHwq65Dpz4H71?=
 =?us-ascii?Q?6cga9V9kw0NbiUHVv+Aeomh6NTA8zAzIhRcqlaxjTZnduDvEc4RJ+END7kO5?=
 =?us-ascii?Q?Tx4ikOeUsUma8pvj3YWWCzHFJGStC+RZmaxvDA224EkgxBHTmciJwSxZ0JuJ?=
 =?us-ascii?Q?53DaP7J2Ky+SblokO5jprP3f8DXY3K1LqeruWx+jeQ9rx+EDpGdKjblAFopf?=
 =?us-ascii?Q?Vou5x99+U+zaGGwVNvbH5/Rv8TFWTLDexU4Db9aQMBpkvhx+HZjHyHuLD6Px?=
 =?us-ascii?Q?rRsALzG5p3Yr3Eyi71sPdKPS6FP6kllXpqWGn06Bac+mMgAW/zcuCcR91DSH?=
 =?us-ascii?Q?0yqIOxjXm1AMSXVPRWGgi3dRovGFtXPbv0IopbqRYn7NTcP7VX+ShrNquCZ7?=
 =?us-ascii?Q?I0VpGfr/bytKRzba/fhd1hEuE2U9LYzABwh2eH8Yo6QFy83N8AtmZFzfbnqG?=
 =?us-ascii?Q?n4YyHT/tApVoFvlNsi14aNnYlRZ9NhCK6d8GpAnBfS5Se1SnNQN++IBWwkcq?=
 =?us-ascii?Q?PQcPuLYe3Tw5pkk7AxB2cjKTrpkHR6YJd9EfNgM4VGOCmKfSHryCr63vEGfT?=
 =?us-ascii?Q?3xBOql57zUT7rVCUMT+DOvChCnEYRaCbmqjDISTnSz06yJEmpRgKQ5In40UI?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 310540bb-0ef4-4563-cb1b-08dddf367179
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:38:28.2815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aioJBeoLFwBuRwKFQe91izvW2YVQpDkA4vFY9XGWMhCOkY5KFVz9aDG6v1UU+P0iXYrHwL5jPlfKfzuv0HJ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7907
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

On Tue, Aug 19, 2025 at 04:27:08PM +0100, Matthew Auld wrote:
> This should be enough to get scripts/kernel-doc passing for
> drm_gpusvm.[ch], so we can then add them to our CI build infra.
> 
> v2:
>  - Also drop misplaced range_evict()
> 
> Link: https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/86
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 661306da6b2d..85e0e0a8718e 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -345,7 +345,7 @@ notifier_iter_first(struct rb_root_cached *root, unsigned long start,
>  /**
>   * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
>   * @notifier__: Iterator variable for the notifiers
> - * @notifier__: Pointer to the GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure
>   * @start__: Start address of the notifier
>   * @end__: End address of the notifier
>   *
> @@ -360,7 +360,7 @@ notifier_iter_first(struct rb_root_cached *root, unsigned long start,
>   * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
>   * @notifier__: Iterator variable for the notifiers
>   * @next__: Iterator variable for the notifiers temporay storage
> - * @notifier__: Pointer to the GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure
>   * @start__: Start address of the notifier
>   * @end__: End address of the notifier
>   *
> @@ -1437,7 +1437,6 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
>  
>  /**
>   * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
> - * drm_gpusvm_range_evict() - Evict GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
>   * @range: Pointer to the GPU SVM range structure
>   * @ctx: GPU SVM context
> -- 
> 2.50.1
> 
