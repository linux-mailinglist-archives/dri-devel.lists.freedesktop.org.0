Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB9F68F893
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 21:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A86D10E3B4;
	Wed,  8 Feb 2023 20:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B667897FB;
 Wed,  8 Feb 2023 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675886893; x=1707422893;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rMul5DThoaxcyDce+6lHJdZyJXQM/VgEOavO8KlKsdE=;
 b=bjNlCritKVhw49xNKnjTzy2D8w4rpQIiT5E1J0rGQzX9eYYBIC17Ln9e
 c3IpcH3sDlA+vTnt44913TP4ZKV4csfElwHMHuetqqvSAA3ykXGsZNEHK
 CBOgp+i6daNVkqy77fNg9cCIXEtlp2T6JifV054gIZhjkJwPk2WVqT7O3
 Ifa2tokh0JTQ9XJsjPHvLcFrLSL8ujKteSiM7rdOev2gR/Sf0B4K0J7bM
 fRaFaXv0R6bEZ55odigyt/fvEGrw6w9kjmKC0dqkfI176bpEtCg6FYOjM
 G5Vj8ncCDUzUgKyW++SaTd0Zgp7SfWaRrMuzpEG+u32Nz7izz1ypVEVFE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="357310412"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="357310412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 12:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="731012781"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="731012781"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 08 Feb 2023 12:08:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 12:08:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 8 Feb 2023 12:08:11 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 8 Feb 2023 12:08:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCEx/N+h6JksjwQkK2cwiIB94XSo6P8kgFRd9EOB6duhI9BBXrsYstx3/5I4GVskVbSYig+GQB0NzvQfAGsn9Z41xdLf0BRz7qei+U9hxIeeu2iXCSlyOPsYHSRo2pKK6FjQu1U3IhyNy5gGByqcWT0JG5VzGlG4nbE514sG9p6cs4dJw1/cHD7zjsThqntqIfBEWPWNq82RDMGrF+PWMvDdqxPXU4bRcKjkCCz9UCtLDRUuh28N5gt4ktAnyLbA3x2w75n7VLEVmhRVy7BJIuKTWjjumMwOxay9m+2nv7SakdLSGHw5tmiiP2na9qjDlGvC6Q3WptLf5fz9VfmqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RuUSURifP71OGH7ojn9Nhjuxk6VUZoWsstzNP6uS2s=;
 b=ew96KAXkHrRF2I06Th97eUhGrKJdORQeVmn8RxPWmrlmkcGJskQItihcH/Q0NklSPEpZMDcbp9MfLxNNDJrfJRbKC+9vXw5ps5Au5umtxjpam/MHXscfbxl/jdj5mHo6bAY72Tr4yPL6N3pbwDDhm4ZoT9GaKnlPH3C7LWIthxXoHBM5LWkESI1FPottYuT3kUutSKqtoxj/YOBQQLjfvBqIPULLFkgVtNZ9yznm9Nd8hk1G8q50l0bJ/pzXG5K/peGT14J0PKQqwGNkcN/NPNphS5AiwLP6xzlGv04IJ1we7jMw5N+mVLY+qm0OQaxvCEBbjWx7qBfU/TxVCTKfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Wed, 8 Feb
 2023 20:08:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6064.031; Wed, 8 Feb 2023
 20:08:09 +0000
Date: Wed, 8 Feb 2023 15:08:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] Revert "drm/i915/hwmon: Enable PL1 power limit"
Message-ID: <Y+QBJLXJ7uTo3p7l@intel.com>
References: <20230208190312.1611335-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230208190312.1611335-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adbe9b3-fc2b-4608-8be1-08db0a103307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqauColTF/tZHTbVHJo1COViEzL94v/56GExAlxneZ9o99LzOV4dL945reewjgStLpIUCX8aPUWvmFbyvsJdGCZbFpUTZRKMRbCSIhoVfi3CCRnJ2r/B0YjRxcXBT7BBh98zzefM+sxOmWuXWoyXIxfH6QEnKgRxr1Hr+1l799xzknz/9IMj8W7TRYC11wCU/xUwEMxv4SdX8iOywGTWAhfdCOq0Vft0NJWWdtA9/6ulwGpm6H1YDzNqVLV3q5uspvs91P1R5dKHxF5D9QatuU395m50joj4w7SQnGLaEJwE4pVLvdFykoLwhWVi5JFvUPbGs0Ld6HtOd5lgkx7eTj+j0+VMqDZptdui+e3zpqFUOZxWJCriXP5S2E8pvBY+wiwo+e6KL5NsemEIIsoKdMxtsfwlPNXAtXgq5m3mgtIKOXWtI7Jw0Iw3F1FX7H6u7YrglOsUx1nwMDCCeC6I1OfiJ7gJ9vFk02AO0BB+G1BinCYTKf7ZRVcDz+DnVTjByutyHdf14VFYGhIfFcvqMkj0WLhLMusL5MEnOMOTFQDUUYuplItu5EuirxT/nXI8SXR7JV3VCaLX45c1Z8wHW/u8NidnFyhAtoBsK5/15yNm+fyX8H3Mm04URPIo8adNvbMrq4X5F9zErnBCkw/iBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(186003)(6512007)(26005)(6666004)(2616005)(6486002)(966005)(6506007)(82960400001)(478600001)(86362001)(38100700002)(2906002)(8936002)(6862004)(44832011)(37006003)(316002)(5660300002)(4326008)(450100002)(36756003)(41300700001)(83380400001)(8676002)(6636002)(66946007)(66556008)(66476007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zYAOCcAI8ZMmbqm+QA4Gx9lVhP+GFMSFiilOj21cK7+V9r/1BcRoeZQt0sLX?=
 =?us-ascii?Q?7Ps91sWSDKl8Wt/sKTxZMPYBUc3ctDM8ZFG3ZBTPP2RnCd7FxqKqk+ljVTIN?=
 =?us-ascii?Q?3jMRl2wf6EYurkxNyhXZXQ2tVUIaAzE4ZH+g+T/vildYJjtgokK+mdipG7b5?=
 =?us-ascii?Q?sURp0FSNAx2LNRpLCmm2rVhFdY07dWE+72CMCRv7j8YfsLqETcn8HIacrHjv?=
 =?us-ascii?Q?Z2qhbvunjmkEBfZca9lZWHiBbBpGPzWIR7l8u/aVcE1eSqHja4Lt3nf467Nv?=
 =?us-ascii?Q?HUvw9o3s4fLlz77ozmHROYfTOyV+wwBi42gmSpKPEniX8yCf0gm+op+pb7Jk?=
 =?us-ascii?Q?A3KpIpElyWUChSz53cLK7eTJxaYNb+8BOawLEdgfGopWkGjaZEHMOQXUMKtj?=
 =?us-ascii?Q?aqcncW+ZK55lXl3PV5J3qRsjjCCpgBj7HLombcZsehlHy5uwPOBpAJFoB6b1?=
 =?us-ascii?Q?R9Knte4cQmbazdXhah1Psd3YnZDQmG3iWvbZq+jWPcoXbDLSAMRpoD181EGr?=
 =?us-ascii?Q?XwWom3JNjhaVsDoeEB/6oyuo2oFid6oEJdRcjGQl0FDEDNIpqXqmtp8J/9gR?=
 =?us-ascii?Q?qoBv3vdES0eSHM+EACSiMRZC3BtkqwG+B/02AlirUuJ5KOGWG7+AwbfanSIA?=
 =?us-ascii?Q?XM83zabu/V8EzdVi4bPNbPRmqHFl416sG462WDyLImDChT6cz1b/wJ542GOG?=
 =?us-ascii?Q?xfnJmZSj9zlgGY/W1JDhlZJUuLEpiI1h7xSL8R71cuYTfLy7NZotKxclH+g7?=
 =?us-ascii?Q?ESRckkKB0M3TTN6jokVtWEZO0DGzKUiIaRPlHZqqs07GqMy2ae2E9Oc+q1M7?=
 =?us-ascii?Q?hSww7RvwHDJXGlTNY/iDCBTO0aAUYHrNNj0XwaY8d2ophxoGC0ygD/WQbSkS?=
 =?us-ascii?Q?OCQlOmRpM2phJOfK4dy0QGwAivvVqjF3ZzwUeFW3NJB1vpRMVXB1LbT7pNiq?=
 =?us-ascii?Q?Uc0gJ3WkRyf40fRc4Hwyy0SJcectHzSfKvvcYpiMiMz79XDWb3a+fFPGuRdL?=
 =?us-ascii?Q?HkPMcllpI4YpHcY9kcwlJGRdxRdvo0NeaCnAHTvikDwHpXtA/0OmXpHXmtFZ?=
 =?us-ascii?Q?MrqCOhFfBCGR4DtlZkAjYFULXo+uIr5cns0KKJ2jZ/PVxDHsegUc2A98JyJx?=
 =?us-ascii?Q?dmM+5/lCgmkhgTxi3OPXD4miSWGDu1KDlxufyk1YSWKOb0TyEjsIiM/+9iQU?=
 =?us-ascii?Q?vWBySWkUhqiNOG38efsaYAum4UsyTCprXAbNjBrpI0u8fZ60zDF4XOs8XQYn?=
 =?us-ascii?Q?F9hL5leDNB7M9uNkMJzWI6NVf8XiTuk66wlr2lvc5hmy0bPkYy7Hsm6iBO85?=
 =?us-ascii?Q?cLRPZVIFHdlZAMvfVklOz6eofP33Uc7FZtRb0j0GrFBxhLIt4C/ZJSqxqOb/?=
 =?us-ascii?Q?XEISMHRPSbgJ4aI/JkbfLqmrGStxmMszyxwvVbVf6GB2ik4x3lwCaX0rxL4/?=
 =?us-ascii?Q?09RU/OBiaTOj5H3qKQMwTXhoFrW1Esyx+HMm0F0Cec8VKvrk6a1jwu/bIPGy?=
 =?us-ascii?Q?FJNmalOFJ+sMMeAT8yCTt0pum7IboC+TNegT8FsrFevX5i0VphJm6X9OXFWF?=
 =?us-ascii?Q?nXFTCnk6UHrNlQZSCL+KO4ikqpTRZ3uG1UVCsCN7QSbkWlgXE2EOkwe8k8Mf?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adbe9b3-fc2b-4608-8be1-08db0a103307
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 20:08:09.7755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyBav05vsQo/IP6MXD8RS01iJfPp6s1YZ5XPEElrUCc6qzSH5fOUBr01ZV8zf8xAIDX1V09KdWFRkbIDen2U2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
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
Cc: intel-gfx@lists.freedesktop.org, Matthew
 Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 gwan-gyeong.mun@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 08, 2023 at 11:03:12AM -0800, Ashutosh Dixit wrote:
> This reverts commit 0349c41b05968befaffa5fbb7e73d0ee6004f610.
> 
> 0349c41b0596 ("drm/i915/hwmon: Enable PL1 power limit") is incorrect and
> caused a major regression on ATSM. The change enabled the PL1 power limit
> but FW sets the default value of the PL1 limit to 0 which implies HW now
> works at minimum power and therefore the lowest effective frequency. This
> means all workloads now run slower resulting in even GuC FW load operations
> timing out, rendering ATSM unusable.
> 
> A different solution to the original issue of the PL1 limit being disabled
> on ATSM is needed but till that is developed, revert 0349c41b0596.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8062

pushed to drm-intel-next and removed from drm-intel-fixes.

Thanks for the quick reaction.

> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 4683a5b96eff1..1225bc432f0d5 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -687,11 +687,6 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>  		for_each_gt(gt, i915, i)
>  			hwm_energy(&hwmon->ddat_gt[i], &energy);
>  	}
> -
> -	/* Enable PL1 power limit */
> -	if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> -		hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> -						    PKG_PWR_LIM_1_EN, PKG_PWR_LIM_1_EN);
>  }
>  
>  void i915_hwmon_register(struct drm_i915_private *i915)
> -- 
> 2.38.0
> 
