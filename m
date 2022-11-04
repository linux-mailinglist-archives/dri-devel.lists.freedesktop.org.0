Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6197619F3E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 18:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656D410E979;
	Fri,  4 Nov 2022 17:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A87110E979;
 Fri,  4 Nov 2022 17:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667584332; x=1699120332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=idCOXFgErugmxnI0R9B1GWVkJGcbmjy6zlkYgEzgty4=;
 b=f4N5hT5mJSNEGMrdISgNj+33NCbOmm8fh/Jj8+Xbxvrtnbjpf9TgQJbM
 7w0Wv8Dv2QyL0IaKDe7n6Y5QbHK6/is1YjAh5o8Ix/Yv59T9Eey3XFkOq
 xgG5+XEcaeU5ug6J0W9+BvjNX7kr+rlVmgrexYuKwq8MZzUUs/4+rkK54
 3pYwdErJ366k76TWgIIGuCYlI88Do0tYK06lGlCtTYfZOXYySlH0gmbiC
 fz2tRExgGr7BQoi9IxxIP159N4MawuyaEvGx/N6YiF+cPFV4IkEmqObO5
 ejqjQJdefKDke5bOWzITXwSNXnpavvgoGMRonKPCkAvEpj9kvwyAmlSb7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="374268328"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="374268328"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="704168543"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="704168543"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2022 10:51:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 10:51:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 10:51:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 10:51:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofyawGQOsFW+eq/3+laHIuqH8wIGTGOUKDOUQ79L3tx2Oo4dRZOs/5VthYfATtQD6z2adi34e0oNs1r5w8Szf9UcfAfUcL1Pt9Mda29iVjaN/vGWyZc/mfcBP4FhsXiCYCPwKJrGeS+H4ipXDweOz2jXYoh22pmcbho7L8lWcg3+Rov3JcmOdAyr19dcagC1SO+TrxfwUGIzcc1LRYEUEHtZK2WlfijdENwK/o8bD6dkLK4JgrzJtnwuCNpjbYNK5b2ArVC2KBs8M3DPk10+zJt78nId/e6oUBGBRTv5y1wOvKvrkm4YvfZCW9tm/Uvz1ZZMDfE4R6crvdadzMsgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mEZNaqZIlVXg09kvCLqokhvJ+pgjHj2GBf8sl/wE8Q=;
 b=bZ4BmMm1xI1alJowdmKe75plnEw6PFLBb8ZvjZSk8Bz3C+KzaocEaeFnCl0UELPsEUw68Tn7uYQRJbSHLQcJx4Vn8udgIFSCnO0MLvChszkY8UXPLXmyk4kf+6WxDqqVlPGe2Fbj8YdCAJUCOJlm4Y7BPEypis/2Ux+oXGpajAQQBQ/3iIvqCbP3lznCqUNQq2mjAbMkc6RlKwZHfIpcctlJPHvq77Db2lhi8vy0bnpCeV1MxdK3vdk/0GS4bNHFoGcnBXsCwbUEayNVy3N6HWuEf8Nl1+3qMz1P1LGNetOjQzEUE3qdfRCwZytAMkxPRs8TEO7MLXRpjjotjDxe/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 17:51:49 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::64f1:5ad2:be63:7272]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::64f1:5ad2:be63:7272%2]) with mapi id 15.20.5791.020; Fri, 4 Nov 2022
 17:51:48 +0000
Date: Fri, 4 Nov 2022 13:51:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/i915/mtl: Add Wa_14017073508 for SAMedia
Message-ID: <Y2VRMD+OZ7GQvP7C@intel.com>
References: <20221103184559.2306481-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221103184559.2306481-1-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|CO1PR11MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb0d5f8-1944-4f80-92ed-08dabe8d3ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bDkQa/4RAwz1azWt86rtCBaVivbb3t1pVSitg0REJkn1V8LxOcFF+aB2TTRxaJ0soXK9/8vFT8vb3la9nsTE5aT+1E0u3UwykNVvj2QauHImSXLNZ+4b35U1CFB9WDUlEl1WbW9DWlKGIfORgbx0cYRjjRiIYSykvWZE0SJ2ZT02SPlC+BcvGR5zrr4mBN61qWPwjLh9fMryQ8/01tYUfQCKDw8RvuClCkuxe7zHU1L3Wr+sBZKt/isCN4n7Bmc7pBg6VeW/abROVonjZvoz30WWoHkRRSInD/OXB/dTy7OopFtLcNV1M3ZzOOP+htjCfQF/DITto1a0pi0alOouJJtP8W5TrYPJzzEybVk0Cim9XPFJi1x32BcRRxcmpO0qpJDvxD/obmZwPOU3RVhUqIScYEAN/UiA+1LSKIAh63GycIuqfu69XZbsH20jzQLfXJ2T9vPZFhmOKEA2WJKHqW6QT2y1YznPXdFNwwE/MlfL1Duw8E9+fP+NmKNL5b2Ercxz38/78+FIE4rTDHaiVvLjv5GgmOs3lMTxk3n/zhDfM2A4vhA4SYi0IplsbLM4+go9zoOGV8wtl+boYTFK8moPln8yteP5PlCkUoaxGFjJTwQ4M1JkV8U4WgDaIlX1VgggXN4sd5vmfZa0Nz8S1oqGFeKzHkCZmgnbY7tOP5aovDehxVLEJSRiOHG9obky8MFL+mEl3aBY3L5MXo2aMV+GHtgLSJdN5J1TIxOmnchzrEbCWqbo0dQLPIJDxtHRC3dKHAILZG68InlCfpzC6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199015)(2906002)(4326008)(66946007)(6506007)(41300700001)(26005)(44832011)(37006003)(66476007)(6862004)(316002)(8676002)(8936002)(6636002)(66556008)(36756003)(5660300002)(6486002)(6666004)(82960400001)(478600001)(38100700002)(6512007)(86362001)(450100002)(2616005)(83380400001)(186003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZWaoZttGuTQLW72R7J7V05Au1CKqvDllzMaPvjPHEACK4q4zt+z6lJQrWeXe?=
 =?us-ascii?Q?16UOa5vv2U0Flowmug/s18naFV7faPrc5MnAiD0sjKkV2ARShHCnP8cJ4gWq?=
 =?us-ascii?Q?xnBXpH1TG9RoDdK/22NWnRFGpOdbJLm0XW1XSZEPAGjq8plcnylZxpHTdAEZ?=
 =?us-ascii?Q?cuXrdlK6I/IYV4SCZ7SZzrFIVvLyw3s2WKLka3vHdmrummBF6MxQN4Izmb5b?=
 =?us-ascii?Q?CAuEZK0/WNvZ2Ci0G/uVEz0AxDWif13Zc+dO7J9cbrn/zYWmhYC2qhHV5V7d?=
 =?us-ascii?Q?o/Fw+07927jbeUt47kdGP8Sxq0fl4Xc2bYDPsB0KE0VkLvyKGgKVRzfXNzSy?=
 =?us-ascii?Q?1fzsehNlAieIrnHIX7gViqLWEvtj4nf0qsFeO6PqvdoxPF3ORpdUc2fAhMF+?=
 =?us-ascii?Q?DJ5ApugnK8LTsVNw05x+htcrrvuynEMwPGJshRDTDcIqod2EG0Dr5N1IOwi/?=
 =?us-ascii?Q?p8hL6IzPKprKioPjZk0WaJFqnRTtmjEVGPaVRHmCVrpUL/3IpIgS3EVjVKTk?=
 =?us-ascii?Q?9bm/KVpisM14XBt5aiP8DFuFy0SiVVPjOT+kn3kBwDO7hWO87GC6C+xl2dMP?=
 =?us-ascii?Q?FSj4y5EGtwhRem+U1Uu3XwJD6iSbxxebIiK7a0wdBpQq8EyRP45t0X6h8UC9?=
 =?us-ascii?Q?BLQXvxRkS+xKqRrjx2bH1COadxdhroiewZ49lj4tzezFr4+ZO4dE0vzam4gp?=
 =?us-ascii?Q?H5ZtA2IYjwB1zZ18jLi0JtCe/AFxGGiAxyEy8y22v0zjGAoF9UnG1hBNMZu3?=
 =?us-ascii?Q?+rRvI8oGC58JDRdTbpUmwFSvRyTLWOeVHgp89x0gTzf+NT17R2ASMQaFuvHO?=
 =?us-ascii?Q?xzyJivzaVpIQydVNrAy3a38qyFllIMqJ79x+YWwYes7CpCNftA2QrsbVIaU3?=
 =?us-ascii?Q?OfpZjTm9UoEtbWDFt0yhZnkhiaEO6Zq7f4O09GjPTM/p1LC6APU6z/BtzbdD?=
 =?us-ascii?Q?of43cB8hFZ/llNaO+9lLV7TxwyAhY6UG7FAqRh8/Ke8WDtCQjMk4/eP/1z63?=
 =?us-ascii?Q?82lWCvCSkajUf7446eJ+Maa+z5Ve5JA6+R6AWHd9lw7rgHVdbkr8X78uU6Pn?=
 =?us-ascii?Q?m0clP9kUwqPyBn3L2lauNpbeNFQlJI66jJN0zO8wIA3TW2Mg74tj7Xns5PtH?=
 =?us-ascii?Q?NnWgqIWVl48+rGcSHPf2IieoD6G4d5bBlC9sgr63eELwjVxBWNHwfftBlTaI?=
 =?us-ascii?Q?2K76apEk6b08c710cPLw3/s8aFU8JzDN6ocUWnai7GPR/apLQbvk1pRGnx0H?=
 =?us-ascii?Q?BRlWiD3xS6S+vbPEdHaOPqb8jUaNtHAt0+MSEZwGfFZUQxHqfrMVHAfHgCY7?=
 =?us-ascii?Q?GNYXzMCa3cC5uMx6pIPAUL83j/ZBp3bsD2P4Amqil/85nOAK8yLg4R632gQ1?=
 =?us-ascii?Q?o53u/VCfOrurRwSrhjD4eBOa5FDm8HmajWWA10ecGJ4wJOY0edBHeA4rzIde?=
 =?us-ascii?Q?K8GUAUS9vNZJopGoTV5JVlOYhaxoNCMofkBEKIRHMIPR5u/eIVJSDujnG3wF?=
 =?us-ascii?Q?dZxQ4Zxk/P6XE9KISeI5mUKxOnvJ6Tnwbu2dt0DkO4rZslwgn2qgmKTeRcKX?=
 =?us-ascii?Q?Pag0ThSi5oMhwWLc9qdIR0RR11LXV+elZEWq+Bs9cKJmL2uQGMb89xVygPXe?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb0d5f8-1944-4f80-92ed-08dabe8d3ed0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 17:51:48.2056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mka2Dz3EpfC3Z796WQtKsrjOpascJ0IVukv+HgCEnOiBNspaldxbFP0xVtuAUrwGlwq3pQkWuiW1kTKnj0IUSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
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
Cc: radhakrishna.sripada@intel.com, anshuman.gupta@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, daniele.ceraolospurio@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, Nov 04, 2022 at 12:15:59AM +0530, Badal Nilawar wrote:
> This workaround is added for Media tile of MTL A step. It is to help
> pcode workaround which handles the hardware issue seen during package C2/C3
> transitions due to RC6 entry/exit transitions on Media tile. As a part of
> workaround pcode expect kmd to send mailbox message "media busy" when
> components of Media tile are in use and "media idle" otherwise.
> As per workaround description gucrc need to be disabled so enabled
> host based RC for Media tile.
> 
> v2:
>  - Correct workaround id (Matt)
>  - Fix review comments (Rodrigo)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 27 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 13 ++++++++++-
>  drivers/gpu/drm/i915/i915_drv.h           |  4 ++++
>  drivers/gpu/drm/i915/i915_reg.h           |  9 ++++++++
>  4 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index f553e2173bda..833b7682643f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -19,10 +19,31 @@
>  #include "intel_rc6.h"
>  #include "intel_rps.h"
>  #include "intel_wakeref.h"
> +#include "intel_pcode.h"
>  #include "pxp/intel_pxp_pm.h"
>  
>  #define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
>  
> +static void mtl_media_busy(struct intel_gt *gt)
> +{
> +	/* Wa_14017073508: mtl */
> +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	    gt->type == GT_MEDIA)
> +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
> +				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> +				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
> +}
> +
> +static void mtl_media_idle(struct intel_gt *gt)
> +{
> +	/* Wa_14017073508: mtl */
> +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	    gt->type == GT_MEDIA)
> +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
> +				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> +				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
> +}
> +
>  static void user_forcewake(struct intel_gt *gt, bool suspend)
>  {
>  	int count = atomic_read(&gt->user_wakeref);
> @@ -70,6 +91,9 @@ static int __gt_unpark(struct intel_wakeref *wf)
>  
>  	GT_TRACE(gt, "\n");
>  
> +	/* Wa_14017073508: mtl */
> +	mtl_media_busy(gt);
> +
>  	/*
>  	 * It seems that the DMC likes to transition between the DC states a lot
>  	 * when there are no connected displays (no active power domains) during
> @@ -119,6 +143,9 @@ static int __gt_park(struct intel_wakeref *wf)
>  	GEM_BUG_ON(!wakeref);
>  	intel_display_power_put_async(i915, POWER_DOMAIN_GT_IRQ, wakeref);
>  
> +	/* Wa_14017073508: mtl */
> +	mtl_media_idle(gt);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index 8f8dd05835c5..b5855091cf6a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -11,9 +11,20 @@
>  
>  static bool __guc_rc_supported(struct intel_guc *guc)
>  {
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	/*
> +	 * Wa_14017073508: mtl
> +	 * Do not enable gucrc to avoid additional interrupts which
> +	 * may disrupt pcode wa.
> +	 */
> +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	    gt->type == GT_MEDIA)
> +		return false;
> +
>  	/* GuC RC is unavailable for pre-Gen12 */
>  	return guc->submission_supported &&
> -		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
> +		GRAPHICS_VER(gt->i915) >= 12;
>  }
>  
>  static bool __guc_rc_selected(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 05b3300cc4ed..659b92382ff2 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -740,6 +740,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
>  	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
>  
> +#define IS_MTL_GRAPHICS_STEP(__i915, variant, since, until) \
> +	(IS_SUBPLATFORM(__i915, INTEL_METEORLAKE, INTEL_SUBPLATFORM_##variant) && \
> +	 IS_GRAPHICS_STEP(__i915, since, until))
> +
>  /*
>   * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
>   * create three variants (G10, G11, and G12) which each have distinct
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 765a10e0de88..23d732413919 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6679,6 +6679,15 @@
>  /*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
>  #define     PCODE_MBOX_DOMAIN_NONE		0x0
>  #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
> +
> +/* Wa_14017210380: mtl */
> +#define   PCODE_MBOX_GT_STATE			0x50
> +/* sub-commands (param1) */
> +#define     PCODE_MBOX_GT_STATE_MEDIA_BUSY	0x1
> +#define     PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY	0x2
> +/* param2 */
> +#define     PCODE_MBOX_GT_STATE_DOMAIN_MEDIA	0x1
> +
>  #define GEN6_PCODE_DATA				_MMIO(0x138128)
>  #define   GEN6_PCODE_FREQ_IA_RATIO_SHIFT	8
>  #define   GEN6_PCODE_FREQ_RING_RATIO_SHIFT	16
> -- 
> 2.25.1
> 
