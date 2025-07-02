Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F75AF644C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 23:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EF610E78C;
	Wed,  2 Jul 2025 21:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOfxc6bM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9723A10E764;
 Wed,  2 Jul 2025 21:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751492825; x=1783028825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wz4knTEev62/EDZxC3eYcIs94nUHhx7B/ddsLo+dD8I=;
 b=OOfxc6bMIrpJxLVVpSeSWfBIDUeE/bDzLz6rzMobWwZK0B9J6IU74qEn
 ymr8ebZubOxKTPM0Yfzbx/58DIZ1VNgFHN9Ky+00VkYYy0R5kTLzmMLzc
 rcJbzqkaJauA96nmEl0xpCMdgxr3SYSV02PMkR8aI4w4CrhRWkZqCe5xM
 4IoyaAV5no0KBfWnO5idEmjprKcEFqxCSvwqzvuBVvE6dTTNYvGQ3ttOO
 1BQl879iMvNEx05HXj2bcMoA276HpPg8ChVsjwMqHKUU2/Idgh+dztaC1
 vzYfxfVyDEoiexf+lCNmK2GNvqe5QJwlePExH/RuT777cnbIgAGq/sAwm g==;
X-CSE-ConnectionGUID: rF3ohSkfQMi2n5FlxCUkYA==
X-CSE-MsgGUID: ggOVRUynQPuD2/IbDWRTvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71236053"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="71236053"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:47:05 -0700
X-CSE-ConnectionGUID: lYkpz49JRh6pAYNFQ0C9nw==
X-CSE-MsgGUID: n1AnaYyHTluEAl6emi3yqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154685858"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:47:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:47:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:47:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yllUirRHJGccxBR1mg17aqSmx4XNPF21cwgUUPFvrRlbKYMMx4jYcbHNAxDk6veMgHC2nzBeEyWRUmIDPQOBP1TckxmIb5zcDNcvyFwos3kfHxb9t9G9I5bJgSjFWVjlJXEsPfhYaIeskFZZMZ453I3mUuflFTlNzKeizb41wCeJrQLEqs/UHPwoUel7rYzqHLWu4l2KsMdhKNLarEbF9eM/LNsaKJWnLzz0JvSyfaUkv9AxuvsnQJgFuxkrb8jcGT1Fsb6DzLGlWJE27kg6Z1Eq4RXyxCtN1LSL0OVdK/kEEFzyrr1MpmnkWRng+9ezDNceFQIbOaZ1vNCznnOGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj+wmaRWlhuByPQUBzuQseFVf+L7ZtxuYg2jTdof2c0=;
 b=EOVu6nYpokrbgsn75YPzHfrEbMVseyo2zAQ8oP+kYkKRS5YHPYfn/pAd27flRW/DsHtAf7TPiL1JNUPzslq4oh/3DU2RoIIGNNvgtygR45mvloAbecUOCfh2wABhyx+KbIxrIZih2YM56YWQ1LKGreQLZWYAZOfwUCBCeh2FmUlAQgl0Sp8C56ARzHbB613x0EJDRRGWMhU+W7Y9cmxVEL/I/q1tUHqpmjsThguViyN3b8Rp/4Nle2yn05Q6DhW+oK/JQX10IlFD/GtpfLqWsA/eJQ0FNNP+CtR259UoulrJYdAvnwWwKhWOC5z03FbWBWm1SZ24uTI5z01pa/Ayqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 21:47:00 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%5]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 21:47:00 +0000
Date: Wed, 2 Jul 2025 17:46:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 in rpm resume
Message-ID: <aGWo0EdbOGea7-dL@intel.com>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
 <20250702165216.557074-7-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702165216.557074-7-badal.nilawar@intel.com>
X-ClientProxiedBy: BY5PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:180::20) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b65bc7-ca2e-4c4b-d38a-08ddb9b1f991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?agoniy4MEWoJ6lPa9wrOLTnxDcr6TuTnHwD7yDAtEyGYm0J9WVEQ8GRt2cZf?=
 =?us-ascii?Q?4LkpOaZGUuJhIj66Y+ttJXlTWsRqCgHWRv/73aUDxc0zyV0U7DRW7OA+2kbB?=
 =?us-ascii?Q?wJCDBXEHmGI81anzhlFn+J/FwlSL/oOTxRFjQLgsQxk8N4xlHUiBXgY+Laau?=
 =?us-ascii?Q?ZghvCN0/G+Ppa8pgWqVJv8TrZ3OzDP56BPftoyFTxpvb3V/rCxxkZX3K2apF?=
 =?us-ascii?Q?Y6NiQGDS7PB3tj0E4WvjKuyTXRKXI4dGI2ocZXPB9d/e032rQ974qPf+XXWz?=
 =?us-ascii?Q?+TlaomYchmk6UWT7Xj2um0575PD87XsA97Aqrh/Jp+Mdm190/g/Oag8GMpXA?=
 =?us-ascii?Q?iqQgKXlAWRX/dzxUugT0IuFKfibENAoq4sMf8U783Wa3qbblT/TCtcSkRGGN?=
 =?us-ascii?Q?nSwPZndnMzpKDjm+Xo20mretqv4brh4JhIpesjFZvp8rbr5EJLJMHjtAcGhG?=
 =?us-ascii?Q?6WpbT76wC1tZUkm+Nx5Cf0/fTF62UwFPucTgwEYbwte7Z4yEBw2gBunVltBE?=
 =?us-ascii?Q?uh0g9fApIHB1WFPuN3/Daf/VDcjirWyaKG8fwDxMJLVF8rHPMrMgMbKzRqnp?=
 =?us-ascii?Q?wZmDTbs422AIxTfze1D2xL2RsF49gSyMXO5CGV+NN+vOBpORn+6o7Wk6dM1i?=
 =?us-ascii?Q?DvGApgSa1UkDKiyRn71OS1ePqToTSVvYadLF4lYzUy2pwPFxz018hAZq2LUB?=
 =?us-ascii?Q?/lG8Tulb25tXuFSuPINP+MD8CbOdx0id/e37didWFIn3NepP/vvfDi4nEAjt?=
 =?us-ascii?Q?zw8HPT0rtIXAbKL4Nan+X0GAvaXGaJfuEEdemMliHgQy3pMqnplGH4HyZ4Zc?=
 =?us-ascii?Q?To7USNM2lUItEqXqZ8/GnaqF5M7fTQBr0hM9/H1zX0aS6DI9f7kOpaWoQhue?=
 =?us-ascii?Q?ZBSr6zER2ijvVmUFkZhOHgflq+nJDQvf9A3ENgtwyKmNbr8IFW4fOx+KByNF?=
 =?us-ascii?Q?mSwS6/idQ0yaKoNU//y2md+A0xgKn7IT7lKMe1zUN8YPKNuFYwPMt1UnLAmv?=
 =?us-ascii?Q?gvSkmyf1TQMVEfEzE/g7g7WhwJad35Ig7cYP6IEuOF79Ngu8PukKTVJ9F15c?=
 =?us-ascii?Q?FAxp6SKWLNe4XM9rdU2KUteVX5y97KKd9h116Jn6Bgvr/Te0laNgJ8YJT1en?=
 =?us-ascii?Q?P871/GgYwKv+SVaFvuuXYU0SzVuKU8Vc31snwWdXqZfy4Rciu2jFlNVe7lrK?=
 =?us-ascii?Q?Wuj4H5RUa+zNEj4EkQ19kryvMRkuzsVJ1knNH99QcKqSGYgqSnfN1FD8J4Tx?=
 =?us-ascii?Q?f6kLHupORqpq5vzpKnoPfjtHqpYWO994f+WO5l2VY3nB9Qd37SMwnE3Z95Qj?=
 =?us-ascii?Q?NiwMDtOwW+zocrEnYnJv0JNU6JOToG5FMs7H+S+ASZs7V+9dm8NuPEfLPGyG?=
 =?us-ascii?Q?0R5ZjTmtRAXR/3s/mALJSq49QD7qtIhBuR+orsduJz+8GEszW6BjjgxAVrh/?=
 =?us-ascii?Q?Joyl8WKcTqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?awY07EX7dpmWUNW3ZTB4VaobnlOch/JRIDYHouTM2tR5D4eA0mbZuemwLl/C?=
 =?us-ascii?Q?h6A0ghhMzXOm36FP4ju79k7GuVT8kkYu7NCVeYiHG3Z9cyaQ3K61XXKq5EV5?=
 =?us-ascii?Q?nz/HVvNczdUX9giImtDAvLIsp+d1nTJjJhaOT+WmPKIlTf9Evk+t7CHXU3Ru?=
 =?us-ascii?Q?t6tFEiyQzGeZV4LIqcJFVw0vuGyyZ/6wl+2KqXfXYw31YgIhnklugi0Y8rI2?=
 =?us-ascii?Q?EEAGCrjWwWCqhoKHR4OU7jcb6wKcfq20RfxcGtRL3qib/dfOmOKqh4NT/h2D?=
 =?us-ascii?Q?ich8Ne2O01TyxFpNp90ZQhLrCz8fWEDahaf/WT75SmSywJsHCmc9LX7JWjKx?=
 =?us-ascii?Q?prQmkacVe1Q3I8wXMPcvmBFDDV0ttV3EKW7M9C8l7Ep+Hh/EeGWwLLh7FddK?=
 =?us-ascii?Q?4T7yXr7xDadsM9sgzRQDgdRLFQNIqVQKkzIUWIvWu8lEo+EiWyxrnzdlNUUg?=
 =?us-ascii?Q?kZiz54ZBGdQjtSD2jcYdbqNm2gJQG7kDociQx7e5lvqj4iS3bImJ6/FjtzE+?=
 =?us-ascii?Q?Fl0hXlWpJ0OAvQ6MFxL4fqHPIJ7innSZbQ3cQVupK32QijQA9kSJcj2kwY4a?=
 =?us-ascii?Q?iVW3Xa1wm80nAtY4kFgbzy1tqJnGvnxjvcaAmcrVGFe7s0RF+jE1GPvow9Nc?=
 =?us-ascii?Q?Y7z9c4rx/SYWq6a9Hc+/gnn44EaFD5I36bcwZjruqE0v+Yk/w2jJh9bJp2a6?=
 =?us-ascii?Q?6eIMUTRbvAmIakzCAmayeHvdOOAb/JtAAiCBR/hhcBDl66C+EFPvAEUBeZtg?=
 =?us-ascii?Q?GzN5VkhLLBLjYC7gYKerFAf7dGIp2cOnQvq/llUm4gy3qUUUeMZ38qpWTZzM?=
 =?us-ascii?Q?fQt5Tj3qk0WlOE2GksNZ0+xchNjanCD9ROEtMJWkbxpfSyVRszXMRvDZ6AWA?=
 =?us-ascii?Q?cwwyvp3RS2Yv3NPfeuIxP33NUwHEAAkKE48x4cOgaGpR4vTVsh2fLWRWmvQP?=
 =?us-ascii?Q?caUb12+AIO8ldVnRQMi14/sbCkX1n7VmJyt75erq4lU2KyVUwAHuLIy0zBXV?=
 =?us-ascii?Q?Nhy6a6dStYm8op1QhY9BujYg4HVcmWJtuU0YtdozpHwGLZ8rHIjSoH41p2QH?=
 =?us-ascii?Q?P125e7B671h5o5Z2WUxmtzsd/Uk4svqrUyBnN85eiNTShu4WG9zViRkC7b2X?=
 =?us-ascii?Q?SXqAheJYjR4EEN1fGQAS1RGfAXlfsA5YdhC8DQMap6rR9K0WD6Muk+oRS8uj?=
 =?us-ascii?Q?JhXETaOioKWDjr4fSD2VX13jjsIavmAE2oaV1yBAZmuDNITFMgKv2a1VlG5g?=
 =?us-ascii?Q?5gP2cADjDec2zHTxlGhfqRvD2I7xu//Xq2LczmK6mjjrDWn7lloH5gh0rRyV?=
 =?us-ascii?Q?cWhy7b6GgOufGZawh6fSzVTy+40egheGQ7X8CPK2O8k9JLOdh0XBZr7nEuwo?=
 =?us-ascii?Q?g9Qta8PJHUSxUFwIjR7TDpqpatxom9djqixlFk8bdEaDsDbZQMDV/DmyT3jk?=
 =?us-ascii?Q?AqUk1D869/B1SCatkeFI7vmhSH2qqxAGsavfd9clv3UiSsuuTOJgdeCMgBNg?=
 =?us-ascii?Q?ZjNYxjzoltVZauCciGlPy9bWirGMsfM8viIUyqAp9eFqYjBrwesiTdoDdqjy?=
 =?us-ascii?Q?LRVhAU/C4ADh+NsBVxiFoSrhBBn/AvYRyuBVxLp0CsFszIGwiSycpJgGExVW?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b65bc7-ca2e-4c4b-d38a-08ddb9b1f991
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:47:00.6359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lx05Lze0jzIT2qNDjwmcxmn26O5GNn/OJUb52M7brk2bcnWMWAB948axUbqSmuqKLDeV1p5ImX8Eo5QvF01rQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
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

On Wed, Jul 02, 2025 at 10:22:12PM +0530, Badal Nilawar wrote:
> Reload late binding fw during runtime resume.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v5: Flush worker in rpm suspend is not needed any more as
>     xe_late_bind_fw_load gets the rpm ref before queuing worker
>     to ensure worker completes lb fw loading.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
>  drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
>  drivers/gpu/drm/xe/xe_pm.c           | 4 ++++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 56166816a535..3fb84d2f0a76 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -82,7 +82,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>  		return 0;
>  }
>  
> -static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
>  {
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
>  	struct xe_late_bind_fw *lbfw;
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index 28d56ed2bfdc..07e437390539 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -12,5 +12,6 @@ struct xe_late_bind;
>  
>  int xe_late_bind_init(struct xe_late_bind *late_bind);
>  int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ff749edc005b..734fe259600e 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_irq.h"
> +#include "xe_late_bind_fw.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
>  #include "xe_trace.h"
> @@ -550,6 +551,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_pxp_pm_resume(xe->pxp);
>  
> +	if (xe->d3cold.allowed)
> +		xe_late_bind_fw_load(&xe->late_bind);
> +
>  out:
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
> -- 
> 2.34.1
> 
