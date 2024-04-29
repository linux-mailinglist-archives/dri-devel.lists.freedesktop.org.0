Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D04F8B588A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 14:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8965112C17;
	Mon, 29 Apr 2024 12:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hR2IgmP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597AE112C08;
 Mon, 29 Apr 2024 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714393819; x=1745929819;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=21uk46vGV5V/YBhLu+M6w4B33ZfVV0Rl5WEWjaa/StQ=;
 b=hR2IgmP+rtepinbKTSyw0Tw5rf9YTTIQ1cVbwZW9wzB0N+j1fpdCuHND
 V1HL70z9wWKpUFUkc5C4DG2DmsqhXr8EqP3tspm7b8o4c0MR46f1VrPXY
 Aye7JDFX4gR9hIozjXNUKTbyUX54y8l+SZWuNPd9kE4gn2nfE9rDj439C
 5XvhikcK1MHgPoJC8kEoSFgmof++2n1ydROxhSzl+XI+quRKKmUkJgeZ1
 1mtkqMwFSt2S7R4L4bpmEHtB0cZnrqAfhjGVQAUAcYxKUW5sgECn72m6s
 fhAH3hlM5z13PcfDncG+obImYNwXLXiqrpVJ2EbdlJ6CuEIO9VkiKSIus g==;
X-CSE-ConnectionGUID: DTU49WeoT0C5GktdZfmi5Q==
X-CSE-MsgGUID: +pmqNA4lTE6GlVH0+8rgeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10160094"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10160094"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:30:18 -0700
X-CSE-ConnectionGUID: EX9uCASrQ5OHFIwfh3do3g==
X-CSE-MsgGUID: lVmC5Y7iT0yJNF+Zjx6IYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="57287663"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 05:30:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 05:30:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 05:30:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 05:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zjoxddwo/tDrvo0OBZZZvtyg7kidYLIkN0Xm47wZaqkTCkXtMdVrHTm3gjzPqkO7XaH4GHsb2g7xVVWdtEXtTD+BxruSTUyw90TYIXrB2v5347WzmlVHAc2t5fmHqgM/omEz+/LzeY8XxHJxXPIcO30CVt5P+Z6n0GmYDHtpjNK/k7bex+Jo5TZdPcgHTX9qc6f705jJeU5EV2Z5mKz8/77CQnA2Shxluqgx6cHbh7keLJN1v7uvC5w2naC9f2OIKo2m2UFxOUxcskptS7KwDM8o6rM82xFoirtmhGn0oaIW+7IdWBOc7KMHldnTVMkPHneikg3lnOxQlV3a9+mAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iB3jhH5Uwx5Rp2IGITaKM/vwSK+zZVrXkU0Sj/XplY=;
 b=BuSuGhV/jf/cMYGi3IQomABCyTz1NmA+iBLqkdxbRoYRSIUjZqsSwhLZFptqHTN1U1HMuXTfrX0BvhO82LMlqpQ7k4YA2XnsNwwHiRQhnloRu8iClgFa+vXOIA5TDsxHSaW0tMueiA7WaAr/CaE90ntW2DZDpCLifFkcxJ/Xb3WP5wduZLzTBrPEl/fsW4y2bnvjQFDuIdkb2D45DWAsiVhgtKNJCFmjDhi9zzDMiNKluuqZu9EyanHHhBR6HkEr77PMCjVL44t92r7CPaWludFbg/3OQFYrfbJbK/pgbtuX9Q3hEHRihZyCJn6EjTz8nbRa0wl45xkQvYVBm/TfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 12:30:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 12:30:10 +0000
Date: Mon, 29 Apr 2024 08:30:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Andi Shyti <andi.shyti@kernel.org>,
 "Gnattu OC" <gnattuoc@me.com>, Chris Wilson <chris.p.wilson@linux.intel.com>, 
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/gt: Automate CCS Mode setting during engine
 resets
Message-ID: <Zi-SzrXPlEpL0Bun@intel.com>
References: <20240426000723.229296-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240426000723.229296-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 2590300c-71ed-4147-45a6-08dc68481c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8Xs7WNxE5rWDqnVqWPbAEiN5sZAhXmFuvy2lp5ePkFtBNriI1tdnpgorFX+Q?=
 =?us-ascii?Q?R7tW/gE5XuhOkSe2AuliBDMi2gwrsFnrdyH4oOM8T/GwirF9F4BUJVLJ45dW?=
 =?us-ascii?Q?v9N2rCTgaTYkIczd0L2wnsANh/SCDwcb+ZPA7pX941DT2Ec4FEWf6oOTotEG?=
 =?us-ascii?Q?lpvmbRJPrqmVwKCuPf0fvBbaen7SB2Cmja6RbKfa2ZPwEhQtm+Mt6rucWWOW?=
 =?us-ascii?Q?/gUqJjT53KyxAWGe0ngOD0ePZHw3DUP4tID36QYdsqkNO+vc/Lt9t+PLetjv?=
 =?us-ascii?Q?hePPBG+xSF6fziPB+ibSWZOtiO76Yg9zRYyPiU2nKGRab/m7jRdrOqXNHhG3?=
 =?us-ascii?Q?gDlWVjOaDu6IEO7bmXIAVMKAo6VD0tLWdzN/FKje0X6fNB4vGyzr8q/f2jr7?=
 =?us-ascii?Q?fvxW9UZ4HKhfeEO96/HLadpYsb/kKuGB7LA7fwzwTFp7gP3hTJPmchBoUWoP?=
 =?us-ascii?Q?L6E3W5X3WsMHmGpVanEupXERDEUsvB4Z+xZcZEu8wuoCbJKfrTSyx+Z6p+an?=
 =?us-ascii?Q?4vvY6pyaSPWmR4MKRNsnuTdCyOtsxPABL139Y5MpdbfLJbyr5/nsvNHQ+gxs?=
 =?us-ascii?Q?EC+Qx1uAHjA3jLGPzQnmsbYw1JzJxpUJiYzR8KFoO4xto5W5HiWCB2QzXIR5?=
 =?us-ascii?Q?ev2QK8trvksa0rXzsaJdwNkp159FskMpRkIH2Tjq3/kO1tC1gIZx9corDruR?=
 =?us-ascii?Q?DXC4ul5JUlY+aAOhg9s7QmEt8gNfg0dkwmquExDkkTMHaMQzB5jU1OiyaLuY?=
 =?us-ascii?Q?u1IP+nNO9EcK1h/hyZrmt8qZaZStAEXPF2pJcMqp67JBAMjpS+wd44sDrCzA?=
 =?us-ascii?Q?NFu5BoKjKus82WRg8uOI0PWYr64kQlVwb9s5uQ/Alv3tmDEsrDhOJbYEXRHF?=
 =?us-ascii?Q?iWU+SumBKMFnAUEHWpN1mynhjZFl1T8M0Z5AeAZGW7rlmLG+BY66xLrJ3qtJ?=
 =?us-ascii?Q?qqi8DzrCET65Is4619Lzt6+CLvFDwl0Q4cIldit7WtVBqOa86keMmypFYk4I?=
 =?us-ascii?Q?7ZLtD5haj7zDUNDu95XvoQpOi/CQXCRiK7yGb+dWIGFSTh/g72lLPgTVnina?=
 =?us-ascii?Q?EblaFsr8wOjgwpajZW7dmeq4WuKzTOuNzSFKaak0miDBW7VRh8PCuIhk75FK?=
 =?us-ascii?Q?ZwNPBAO6yB7Kh4GnowrMlsp6u0z6tFynfLgKZXoc2lBvzzBaG5MEDSnr09FX?=
 =?us-ascii?Q?3uQp5fGPkZaF9nOX2QGbsV5I+oxvjGaUGM1HlQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/kAGShtEMQCSOU2oXxtjVjq8kTMxkdmYmTobLihDvLy8olXeT0evFxWc8D6s?=
 =?us-ascii?Q?hDWKdZ2AvBun1ux51ao4/s/yPwLCAypPv0iqv1q/aGK/IliFfkZRmXQDzuSQ?=
 =?us-ascii?Q?HAZWKMskIi3tafTQJtlZqHoXekHLfcXJfIRpCUNSnRZHhtMNCKuyMrgGnMTO?=
 =?us-ascii?Q?s+XGo+NGUSYRZjBJU2CUjCqVh17F2qg3fFC33pk7aoQXF/mUM2GH8FiKXAe2?=
 =?us-ascii?Q?RGdSYiYr+VfIecYdJN9+EDp/kHJ5jLzBSwQCDmqC97i06ChCthZrsb4xfiwh?=
 =?us-ascii?Q?W80QD4BMbmQtAjjPlLJra8eSmmC8ceAvyulZ3C7WYr9F4YA+41naNPNhhxWG?=
 =?us-ascii?Q?Q+sfMTWStkDI0nOPPfLPUUlRE1HXsvPe0+vbhwsWH2lb1XyeafTZxkX8u/MB?=
 =?us-ascii?Q?m6xvEIqbWjIinX4/u968micfIF3t5AjO1AuF+RC+8k8aaOGRbrOzvcK7Yxx/?=
 =?us-ascii?Q?bcebEgas9ZJtrH9eSRj2xz8t+FcozQccHOgmycQBsrkZZBLGYO1G/26dPBsu?=
 =?us-ascii?Q?KHmXi8ossDKHsxKbZYz7IkbgdLoCYV/3qnUDdACHsVfVMrNgy/cZKepVJRhu?=
 =?us-ascii?Q?inkBMk0pdhFTco79/8T64+uP9H3Zixr64gzN69Eg9uXs8QDaFgzyQCtL7eXg?=
 =?us-ascii?Q?aGc5qxBQcFBTFzI6vd04AuBvFXLNKZZsP7m6brEbHiPm4W3tFkbXNXWLzTCc?=
 =?us-ascii?Q?ghECDP8ZhUTvck3BsH4NqdpI/LtCWRTEY4Y6gTxvvVlqWURfok27PPOEgIQ8?=
 =?us-ascii?Q?jlG5h7UETlE5pfGTa6jWXBqMo4pu7tUrQclSwc8KjtCbLz9BZtSjEajA90Cb?=
 =?us-ascii?Q?Jo85P2QrtkbRNk0x7X/zzJyOBY+Wo0P1u1HI6GPIiXmIjV9V5Qcdz1rrvgfc?=
 =?us-ascii?Q?ui7GMRtUD756RJMxvZAINnl5TAL2AgRUaq5AheeGFlCzUGpW8WquyquCDjIc?=
 =?us-ascii?Q?gYR2DjB7rGC2YkV6J5LhAoca4KmAxEI7WQrVz71HYQlusrZz1WNP0IsvhEAh?=
 =?us-ascii?Q?dJlPkTHcf+NXzvCgyvtusf21yFtIzuqff9wYMsc+1c2T0xmuq+vq9GnvT+Lw?=
 =?us-ascii?Q?5nMwITxBE7wjGQgr7WsTtWBS0k1W8PqSajRA0vMw1z54f5SS56nAayYPlyS+?=
 =?us-ascii?Q?zPSWXRxkXI3eOhriuJuNg5K9lCyVb6/rKDVemehU2UsfAHEEM0lJuM47CXOe?=
 =?us-ascii?Q?5dntc6J2wNaxwJbs7DMaNJxTWWJXhB19Ie1sshyRDhdM2WhraL5E53wtCqer?=
 =?us-ascii?Q?KPAduXUw39/WL82AL0Y2hWi0c4C/CqjwKKEAQCgA66RvKxDyIkbDKH0Nf/+B?=
 =?us-ascii?Q?IJ1cuyF2EI0HW6Ye2GGFGwqafIbnZb3yv57uO4iJ9kbAOkaWOByL9jiQ8wKK?=
 =?us-ascii?Q?u/rr77Jhz3uUNX2qRdE9ikQ5KRGuPmEORa3y9R37qZYSTIoato9eSvj8Qjb5?=
 =?us-ascii?Q?7MmI73tEXZO+RDG8I8Ey01R2I+o4V9t1fYlvhSku1yMhxBa2KTUMC8NzTpAR?=
 =?us-ascii?Q?yLIPaRFYXxdfRA0uv5DrwZATG9NrKPCGtXGpgp33m/rJnLXkz10bZIub2NIG?=
 =?us-ascii?Q?Y4EkuMH2SZ8EwChIL5YKQSo8msJd0DcVYf1UdO7F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2590300c-71ed-4147-45a6-08dc68481c5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 12:30:10.5502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjXDWwiv2/jrVn0dHXMmmiHTqQuTgzZ9KwjJIFauycO0R5xFeVEhjxBh4quSAnGgxY9UC2BJWx4N03XwRdDzEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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

On Fri, Apr 26, 2024 at 02:07:23AM +0200, Andi Shyti wrote:
> We missed setting the CCS mode during resume and engine resets.
> Create a workaround to be added in the engine's workaround list.
> This workaround sets the XEHP_CCS_MODE value at every reset.
> 
> The issue can be reproduced by running:
> 
>   $ clpeak --kernel-latency
> 
> Without resetting the CCS mode, we encounter a fence timeout:
> 
>   Fence expiration time out i915-0000:03:00.0:clpeak[2387]:2!
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10895
> Fixes: 6db31251bb26 ("drm/i915/gt: Enable only one CCS for compute workload")
> Reported-by: Gnattu OC <gnattuoc@me.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> Hi Gnattu,
> 
> thanks again for reporting this issue and for your prompt
> replies on the issue. Would you give this patch a chance?
> 
> Andi
> 
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 6 +++---
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 2 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 +++-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> index 044219c5960a..99b71bb7da0a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> @@ -8,14 +8,14 @@
>  #include "intel_gt_ccs_mode.h"
>  #include "intel_gt_regs.h"
>  
> -void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt)
>  {
>  	int cslice;
>  	u32 mode = 0;
>  	int first_ccs = __ffs(CCS_MASK(gt));
>  
>  	if (!IS_DG2(gt->i915))
> -		return;
> +		return 0;
>  
>  	/* Build the value for the fixed CCS load balancing */
>  	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
> @@ -35,5 +35,5 @@ void intel_gt_apply_ccs_mode(struct intel_gt *gt)
>  						     XEHP_CCS_MODE_CSLICE_MASK);
>  	}
>  
> -	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
> +	return mode;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> index 9e5549caeb26..55547f2ff426 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> @@ -8,6 +8,6 @@
>  
>  struct intel_gt;
>  
> -void intel_gt_apply_ccs_mode(struct intel_gt *gt);
> +unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt);
>  
>  #endif /* __INTEL_GT_CCS_MODE_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 68b6aa11bcf7..58693923bf6c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2703,6 +2703,7 @@ add_render_compute_tuning_settings(struct intel_gt *gt,
>  static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  {
>  	struct intel_gt *gt = engine->gt;
> +	u32 mode;
>  
>  	if (!IS_DG2(gt->i915))
>  		return;
> @@ -2719,7 +2720,8 @@ static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_li
>  	 * After having disabled automatic load balancing we need to
>  	 * assign all slices to a single CCS. We will call it CCS mode 1
>  	 */
> -	intel_gt_apply_ccs_mode(gt);
> +	mode = intel_gt_apply_ccs_mode(gt);
> +	wa_masked_en(wal, XEHP_CCS_MODE, mode);
>  }
>  
>  /*
> -- 
> 2.43.0
> 
