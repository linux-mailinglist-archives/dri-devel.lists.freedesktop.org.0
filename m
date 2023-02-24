Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680BF6A2398
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC8810ED18;
	Fri, 24 Feb 2023 21:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B18010ED17;
 Fri, 24 Feb 2023 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677273429; x=1708809429;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L/fMwfDA5ypcK+cZke6H7hr8oqF6/v4HI45+W7ojd2w=;
 b=YoBWpp4zsc1W1pzyFdfLO+CwRt4gFj5xqGIQmBwP2axC1AeOYlC2TdRp
 mzDTh7JZlLwqmDgiGmpCMU6O+cIvQMNhPv7VV7uvfq3+jpiz4gRYzef4n
 l3c0ld9+H82yscZYhqi3sn2EvBczGl0F6Z4ow5vDijbVjjSO0fa0PIR9x
 6dULVmhHvPmtwW9Z/H+fkHs3cNrELB03HgiaAxFocLq6lN4OMrAC91PIL
 E/wwlLq+BPeDXcLtIcHe7XEbiqDI0y5bd32h4hOuPJ7DE6NrwJhEVyc8M
 RK/tax2StCj1CGAM+1fFOhXY3lDKJpW4E72Ii8KBVr9d0MXErAqCUtPVe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361088825"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="361088825"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 13:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="666289658"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="666289658"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 24 Feb 2023 13:17:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 13:17:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 13:17:06 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 13:17:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNsJbUTBEZRq5bf/5kLMADdfNucM9W5LJDGU5d3OGji1eZnXds0+tfOpsIUndy+dE5LBsTloxwr983maaYmOwo3gQHAJDWzgLVepBh9nAzbHgp2VH0opu1sxyBtDHcebzk3uld/vJ0qkkWnGFBjqRE5F0B0cJaWLMfSSDCJQ+RArTGs6oCXLKxylRHD0auzhD8G/VDVy49iDItG7z5qgSY6t2Q3QIs5knTMPM1F9ygeiiyCdh4W8UtY0j3MIAiuKKpuVmtt9bb8FV1ahgmDIYCqEtkz309qQwYKOMOl9ch+mMnUlslv+8za50ILaySRhkBsqnMChv8VID7FzjySV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtJ7aaPyx5XaM29fChb3e/C6/Csw17O0yuKGQruL1zQ=;
 b=J+7Sz5vn0bSQv2AJQQ2l7t1XPgcSW5MqnyHp3ouSVQEJrSG8qub0ADY8DFtEqLaz1h1ZQjgjsV5vGqB6E8rC4/cz8+diGSLZWsehYtnWli1VBX9Rc0F0Rn4j9CvVNXgb8g5dyt35O1wI3HS8f3J7oMrnW6v7rhFtKlrXpIx3tcXmn8gefY1FcbsEmzV8YJudG6YyPYZaMJKXsbvDjp6OWMI55Cz3YOnZu/XtLaG9BL0jv7YaU+Lw1rWWCvARI2nzveFp+pbISo/kEO3XRZryXzplKlDzqe55wmq4KapockfM2EmJEPUyOBBrXadBxmWu8JsuAHPdX3LN60dNl9YmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 21:17:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 21:17:05 +0000
Date: Fri, 24 Feb 2023 13:17:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/i915: Move MCR_REG define to i915_reg_defs.h
Message-ID: <Y/kpTeUhuYn0IgL/@mdroper-desk1.amr.corp.intel.com>
References: <20230224211221.1557268-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230224211221.1557268-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL3PR11MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 578bedde-1247-4ac7-a6c9-08db16ac7a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfBJWAppdEtTOZoWWPHNaoRTD6vjFyROJUJrfeBxYdNOP/2iU9YnFTTea0kuvMdJD1v8nxzhcxlsRTiiz6TTzmYtgMCpzJSpSqDV0nD7ybL2WuhrlxgU5YIyhabd7Nnm275DZa1ukup6hjaojSH8aDCOYgjlMG3M94zCujpeuriYk9asEdTHSPlInWtywFcLY+Sir3HEFtg+l/RiK80Sb5pdRaE9FcrzvTdzm+kIQoMJVHgUUeuKTpMTTsLQjyr7s8+VNSFyQ5+KWxefM51YfAlpCUr1wOFbjUDrGROQWcsssdK4Ht3KC/fteHlc33sMAVcRPir29CQyuhch/lmFyJKoW8SWF+v+g8vI5kO+BW/Egwd2Fk980k0fq+0DzLGQaQEu0fNCDJbqlkaSyhrycQNfoKoA7CB9YvCk45A1r57DylVXLg5nMcSLrIeZUqXDOefCzsVHzAejbPj3/EIMG7dacPNSMuycW9tbWZbuu6Nq/0/dzifOhr/FHw3ed0UYgTU3LWDPFOmUMrIwR8KBDrVMKi7zdiigXkghSPPcdDJe3xQFSm9xTXiCwo/4RdEPZtn+E0Vpj2acTkODamZ/Gca2FDcibUmAZ4PTUAOZns1X5YGvXG2Jjbtd0D9D3fX6WG9FEzkqJdv7Ugizoz+yUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(478600001)(6512007)(6666004)(186003)(26005)(66476007)(41300700001)(66556008)(66946007)(6506007)(316002)(4326008)(8676002)(83380400001)(6862004)(8936002)(5660300002)(2906002)(38100700002)(82960400001)(6486002)(86362001)(6636002)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kemqjKUSMW7z6C0APEtpl7R1taKQIi3D6n89M9If9ygJDtwfs8hKMFXbYcLo?=
 =?us-ascii?Q?deITp+uW4y7X8Njf3WC7pOzEoMHCxZZdB16Bs5sp/dfZz283u3sd/Te7idLC?=
 =?us-ascii?Q?DOd12mJOnzLwZ9lLMtdudDzPDg6hFitnJzGq+xL+/dKWFuvEJrNO314BN2Vv?=
 =?us-ascii?Q?ObQ1a0NRC5UOAwI+YmheAw3FUnHjmtxV2IeRBDGzPZTWYObhZZYc9qmVN8W0?=
 =?us-ascii?Q?u+m3lYpUjEhpcg99oF9lVi7eHrFU1MvKS4ksDkkxW/2opOokXkPzTwyrrP50?=
 =?us-ascii?Q?XQ2v5ETHmBIvhpu/Bwg3eXI/x8wHllOXuFQGc0H3WUxAY0gT3hN8/hfRXNRm?=
 =?us-ascii?Q?Bs9Noen7p0rKKXw4091QQCtyo0SMSz3tmPbb+qcC6crYnJIOOicdxh3ox9PG?=
 =?us-ascii?Q?W0hk4rc/8vrhwupR4PICuoLRj1nQcL2W2QNDdSNJQZoGb7vzzbAvMSA24bUd?=
 =?us-ascii?Q?QH7c4pxuywke9IhOVvj/HjvshLmSrNmj5U4r8Q0dLFpKYEx6pngUEoOQoZeA?=
 =?us-ascii?Q?TPMirMvXjox8HEYt6C5aoQIjnBojB/snCOcNDss06YjBtYYEBhkY8bq3k2SG?=
 =?us-ascii?Q?75n1Gb0RC4GlbgrwLLcbbMK7h6qCG7GUpcWl6GyGle291Ery9OqWBbRXjDCc?=
 =?us-ascii?Q?najRKBrFSg9EQW5yetnn5Jj/MIoG+IPOTT0k9I1Zb4P845meJPEeY27SZfLz?=
 =?us-ascii?Q?DfrJB0y30FjttuR7Cs8/EYMV7tqrgaVatqkXXcUVDihgXLElJiXLKQ8t54Cm?=
 =?us-ascii?Q?rRDjCta08K59H6THcywPwdv2FNkjMcs1Nqrvsh0mKvNPh2TEL5+Rrag1znjr?=
 =?us-ascii?Q?LwE8c2GHQnOZWn30joUMWdoKei9cZ/3ssU/45XYUc8O4Er+x+xrZiIaeaZWE?=
 =?us-ascii?Q?AOs8xpkl8EBtzvBpoIz5zlp8FlFnoF4VsPRq+uolp22lLys6dd36XcywZmtO?=
 =?us-ascii?Q?A9JaPV0rjKRkNypPsyt0Ace9DIG4Fs+9lS2t4nJJ5lcXmFk0lw3eRD2/DEZH?=
 =?us-ascii?Q?7UAUKcaaJPwr2Dg06OKT/tunCcVTLTdSuvG9SuzTGlz9U5jugc5z/pGDK5t2?=
 =?us-ascii?Q?u+Wo67/6T9O/8/5/l9miKolTc5N2fO1CzasMkHy8HEdxJ7JHbt805RDX1HuP?=
 =?us-ascii?Q?WgZtcubJzUuM7tJdSHYqJ+0ibG+N3/Sp8RcV5UhyptO3kDgYPqTZ6E8zoT6h?=
 =?us-ascii?Q?8+9xCnAT2IcpGP0Q0GLZGxU4mT326dMx9ShrbVNZ7kjj0X51FzpACMwQZNI5?=
 =?us-ascii?Q?niMRzd9lRZi4fx4X0QYuZPf0c2Helkdt5NMdVvbPratjrj7SPXqb8mCm1vz3?=
 =?us-ascii?Q?XFim6UAwkF/77/ikGrOxTMnAy+mMl/sKUGyn42gpl3ZUbyjbzDX0Oa79Rpet?=
 =?us-ascii?Q?jSwWFVIndQzJg5ZN8Q+L+OWpHGlPkmNt6QN4L0p6aXOXmbvZf7MQljut73tT?=
 =?us-ascii?Q?qFH4Dbp+jZRCvF8JYOdIpl182/wiG2iCHrEQwcEmbHve38dZ0H25hLaYVFTs?=
 =?us-ascii?Q?QA1oq4QdY+lE/7O4Os4SIVrUYqcFq6XX9VrkMGMc8QZ/F+rqYiv7WpRrAl3s?=
 =?us-ascii?Q?GzhW1dBhTYUZ8Z93olUdA8yxnazMmdzQ2WRsIgDlXMwq/GFv8uTGuHAP2VYA?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 578bedde-1247-4ac7-a6c9-08db16ac7a62
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 21:17:04.9966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOILDv8rMQnVDxiUQ7Ndn7I0Qszehf7XQa9Vkr6SCD2JScb0IUPRJbVM6lQjWD+ztmvNc95uK92YUAnHrtAkt2723gUxmc6J5P5ZKms5lDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 01:12:21PM -0800, Lucas De Marchi wrote:
> Define MCR_REG() in the same header where i915_mcr_reg_t is defined,
> like i915_reg_t and _MMIO(). It's a more natural place for such a
> definition so it's not mixed with the registers for the platforms.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 2 --
>  drivers/gpu/drm/i915/i915_reg_defs.h    | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 416976d396ba..de2e85fd2f93 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -9,8 +9,6 @@
>  #include "i915_reg_defs.h"
>  #include "display/intel_display_reg_defs.h"	/* VLV_DISPLAY_BASE */
>  
> -#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
> -
>  /*
>   * The perf control registers are technically multicast registers, but the
>   * driver never needs to read/write them directly; we only use them to build
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index 983c5aa3045b..db26de6b57bc 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -165,6 +165,8 @@ typedef struct {
>  	u32 reg;
>  } i915_mcr_reg_t;
>  
> +#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
> +
>  #define INVALID_MMIO_REG _MMIO(0)
>  
>  /*
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
