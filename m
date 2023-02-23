Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562956A1F38
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 17:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3856E10EC86;
	Fri, 24 Feb 2023 16:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01B010EC7F;
 Fri, 24 Feb 2023 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677254484; x=1708790484;
 h=resent-from:resent-date:resent-message-id:resent-to:date:
 from:to:cc:subject:message-id:references:in-reply-to:
 mime-version; bh=8fA78tkcrnRONR8TzSo+zfYDkg/pEDkOoDcJeFmQMZ8=;
 b=mX9D7oZIZxglq+xqxrVDGKaY0pxD3tq7yAksZCpe9ybPa3b9CIG/CZIQ
 ocSJoc6ohr4/pcn814i++i89vYFVFhSJkwmFSPrRW8INyhNX1M+h33Hp/
 2ELcmCuR1CP5p8UQni70l8HA9deLxGdoE1evDIlp4qXZLY0YLU31gr7qB
 khWwPuwe/m9UJ/1P6Vi3FAHbPz9nkyGh/U5s4VLL7ArFGtsHLnZB57DYq
 c/A1B7ICr0EjGDHCoSpa7VWCD5xoKbTnEcErGHT/zvA3TUBRTXQUgDhgf
 NPNlB4vN7W23HrFT85reC4ihyJJkitLUc1QTJFRw41BRtyAFmh37mIXb1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313142653"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="313142653"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 08:01:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815796964"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="815796964"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 08:01:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 08:01:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 08:01:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 08:01:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=creQKiOR9s1Y5PsotzaM4vHbWSlvagKNcFDK0vfz/qV+o0bmXeU2qqD/CnudP8B6eRsOEDydTKP0gK5RgwIJytNjKSq1VPwC3Y8CyKYARLClohvBQgmH0yACAIplkSWTPMYwDDUG+EOzQoakkRzdYoVxoZwRdyeN0/4mOrbjVfBglxdhpa6aH9V77jw4+D6LFCn9JuS8bWTw3P/DWjAHPHVG46r/4ho0MTOwVaGdIcrY6KATWvr7RhWF2Uz0ajopgGiGcGG4wDcznUhj7bCddFFkgs6OVjJsEhu5YxEJxM4OMXpGgvoC/ULQrsJQetT9BAp/xtet8VHaz+/eK01sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwYYgrhE3rHUPxAr7C75esOUgP+HynDswr6tZ9YbfEI=;
 b=GvGypSW9fAUbNJVwOeCXoAkGPO1TWfVbG667d8ANojhZEn5IhZBuCFu2mBby8MKgtWxokCKhh22WHMpBT1eBIPhb/Yl3/4S9a9gi5Yh1gfGeXiiyb00EaFOJaH/lg22FVc6I7k83S6PSBOyNmdpNLjfRy6A7EAIwSOhCV9BIbvaVCVhlhiakEbysSzB7gPU0EwNpHdOicRVwirfaNCK0uqASyNQyYnDSoS8pCWqBTGxpbvo/ISEFtI2BXSmnyhtcWfVWYlOT1r6OHBrMBb/jW2GrtYyJix0XJgixewRL4Gb/IVtGax5WTs/zka+fL3BbqdD6Pv5GhLANMiMeHDpNDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 16:01:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 16:01:12 +0000
Resent-From: Matt Roper <matthew.d.roper@intel.com>
Resent-Date: Fri, 24 Feb 2023 08:01:10 -0800
Resent-Message-ID: <Y/jfRscOTTBVq79k@mdroper-desk1.amr.corp.intel.com>
Resent-To: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Date: Thu, 23 Feb 2023 13:13:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL
 SoC Step
Message-ID: <Y/fW7AwGnT7KJJCS@mdroper-desk1.amr.corp.intel.com>
References: <20230223184140.3452853-1-badal.nilawar@intel.com>
 <Y/fKjHl/xb1CBD/b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y/fKjHl/xb1CBD/b@intel.com>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e5fa5f-d41f-46e8-5894-08db16805a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7NQB+blNEFRVCVwgkFeNCpMtqbwPMQZoRrb9lVq/TvtIoX7ZVMh1nMOhVEWkuHELD2nYHXo/WQ2+AjBbfgfmW6yRiux7S9nFM1it531a3D2Myh+JZlAvUsY6C6sNrvwvwbl2WJZ+I5tqxGTG2lFqKUGnaTw1gMrZKmUD6IjVI6FQG9wtD5urcXgMa4vSzKofafWDKJ6LAkODD+mDLXZI3tRFPYVLex3Keg84l3xoAWL9yBKtzVkNc/0QUqfITN+a/OFIxFTSm11aEYtBnDqxM3pNVdISJI1R58J0mTxAEKlYsGez9sQu1bZo2VTBDWfyYSryc6sK96l7jysEz2OQ0QfZgPRi/ce0ITgo4ZoXTR2/qkxr5uqEQQE242q6oWICGShDiLKhKKCN9yL6la/G5WzG9OR6KLT4nPA+vGP82wHynFpwNmAVPYf7TKDzxuIPI5fqnTmdF6RKvaUBjoKkO3hOc74CMMYgQbbYMIpnPHDnZVjiJN5IMY7hS/6pqYjfgF/zaDO++wTYhOiivVbXfIu/gvyOGp7nlw9j+p4A7Y+fElbEE5+0qfrBjQEaVldynStD/DIGenzu2I0g1Xn+mBNkrNKsE06VeGpuENO9ncesGI1aO9x5whcHux0kldZfVTOSHhlTVXicnCxCJ8TzXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199018)(186003)(26005)(82960400001)(5660300002)(4326008)(83380400001)(38100700002)(450100002)(8936002)(6862004)(41300700001)(8676002)(66946007)(2906002)(66476007)(6512007)(66556008)(478600001)(6506007)(316002)(6636002)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BynX3AYIIrq90mN+qL96bick/iwAv7y37OAeRgrTmP9uJFh9KNWlramd+Qfj?=
 =?us-ascii?Q?TA5rlJgZuS2FJS324JOQHQZtuCVvx+nSZMFlWPrFodgOkq6u+i1PNrJDC4P5?=
 =?us-ascii?Q?mnGIFRDmNusKgcOx/zdZE0IXSwqPL/Qyr7tmELYaqkYCSte5i5oc2NadciQW?=
 =?us-ascii?Q?gWoJRzl+EBnzhZV2npG0uj5z3pv2CctNBZIydWDdnYlc3yutQovTVAIC+rLp?=
 =?us-ascii?Q?Fq+ZmQZPuDTi5a5rjAWSGHRRzJp/yKZIjcx5TRClPf0x19I4XJ9bvRY9Q2Fb?=
 =?us-ascii?Q?56HAlupMIgTd7+Un2X/71Nb4fX4PqK8OJKy4v5/fP/AyKMipciR9RbWnyeWC?=
 =?us-ascii?Q?m/f2exFBX8BznKrWkr+K1iUM5DEfYCi4uDiLUL6KheWRvp+r8wqEN7jA+tNL?=
 =?us-ascii?Q?gdKw587ZdQiGZ4iVS/RrsK+OkbtLKaSBqhsHTBzbbwdld4mI5HVsXWbyQ8CJ?=
 =?us-ascii?Q?i53shxtVcXWvHM9ljtfG90DEyt8aR4OlozLI+UxNhbEo/A0/URaufCF6LgmD?=
 =?us-ascii?Q?wf47XiYs5+DO9jsu83TTwB2fvYxvsanLB30wh5W4nExf1k0NHDHCszXkiXjw?=
 =?us-ascii?Q?EvTlZ12k0OLRm79mQIZI/w+61GJGXOdA1xLdM8teb891tlpaWlpNkUo+I++T?=
 =?us-ascii?Q?/Zw3HuhSNCFPJ/I+h82UXMrNr9eooJT64mOCQmNgezsuN8NktLP/2h310Y96?=
 =?us-ascii?Q?/h/m7Pw7DSxIC+DzAg6y3zBSD5Tn1IKTIdehO/yuVtIY3NQjO0tXclZj56Nh?=
 =?us-ascii?Q?+OvhFkWnbc9Z75IIOnkpm/TclabKOufEWow1gyv6CeKlmhKtmMZmHD7saesI?=
 =?us-ascii?Q?IhYErxKrp5qT5d2c++tU6kGLlFaYipLikou9GPU0JQFlnJ/1RTga+Y7vk2i4?=
 =?us-ascii?Q?5/1lAiKsDvZGydiMu22hU9Cl0mdbAP61kmXEo7eg+zGJDnph23nRR6PKy0qZ?=
 =?us-ascii?Q?G402XmH4DnG6ENLZm05pjATZhU2dRdscpclhyXEU1Y9mWTCNNcW+GO1/pHPw?=
 =?us-ascii?Q?aI4KpP7607UtD+3KYkG9tG1hFjuUT5i8rogybDfga8OX/tfHIFBIW0V71/kF?=
 =?us-ascii?Q?ueNLvLIp+cFZ1rirmC3PuZAQzmggaWz1BMITGZ4Buk/SRJAuJZW9K4XCir+n?=
 =?us-ascii?Q?icKIJB4f7ms0QetB2rpAOH5Yq6sDKNIYryUQ7gwvraBFwaTVwQj1rEEAJ4Rk?=
 =?us-ascii?Q?4uKmBcKu6uhrxO3/d00wUH2PdbTNDC0m5D7a5NGh2e6ZjdTtQS2IxjZy66Hc?=
 =?us-ascii?Q?jZh+Kk4dn8gf1PBiH0WE5K+k8E+woxyfLeTiu9rF5TAKxiLIJFJFha5PkRJQ?=
 =?us-ascii?Q?klYG1VuQ+P/zsKBpW8e0Q5r/QlWl8GvA/6k7gxN4OAy/ma5IJTQaf2Py+NOT?=
 =?us-ascii?Q?eEObwaEpVszCLNoOlzVjLKMWDKDOIDS17E+je++IoBCWdoA0k8V6wl5If/z4?=
 =?us-ascii?Q?47VjKpiKSCd0S62ACVHd9wy4up3alkXjMBfAwG10oHtz3pK3h7F1mKNpfJyM?=
 =?us-ascii?Q?vXakYqlsXaS3uV1xWeKYz3bCaPS60qdCFtLqqs84f3Qpla0XmXcr7x47acXR?=
 =?us-ascii?Q?7EZ04tc91+2zDikapXZTMEylscxyvM6k8VPjWQ+2O7Vqgsx7v0jNDuwm+Jxj?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e5fa5f-d41f-46e8-5894-08db16805a1f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:01:12.8248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Fv8hWxbSvAXKQsIIWrSRW/v7lMVJ7WkURvxV2H5WKzSZQAzbU7ZuAAkRH7G5Eqde4+lT5Z13C3NRmWOBAhcGBAnc1zDLi1VDhnZJ5s0zuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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
 Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 03:20:28PM -0500, Rodrigo Vivi wrote:
> On Fri, Feb 24, 2023 at 12:11:40AM +0530, Badal Nilawar wrote:
> > Apply Wa_14017073508 for MTL SoC die A step instead of graphics step.
> > To get the SoC die stepping there is no direct interface so using
> > revid as revid 0 aligns with SoC die A step.
> > 
> > Bspec: 55420
> 
> This doesn't prove anything. It is just saying Die A0 with GT A0,
> die B0 with GT B0 and so on... Please help me to understand that
> better offline before we move forward...

The definition of the workaround doesn't say anything about SoC
steppings that I can see.  The workaround itself is tagged as being
being tied to Xe_LPM+ (i.e., the media IP), not to MTL as a platform and
not to the Xe_LPG graphics IP.  In relation to the media IP
specifically, the bounds are listed as needed from A0, fixed in B0.  So
unless there's a belief that the workaround itself is incorrect, I think
the bounds should be

        IS_MTL_MEDIA_STEP(i915, STEP_A0, STEP_B0)


Matt

> 
> > 
> > Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > index cef3d6f5c34e..4ba3c8c97ccc 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > @@ -29,7 +29,7 @@
> >  static void mtl_media_busy(struct intel_gt *gt)
> >  {
> >  	/* Wa_14017073508: mtl */
> > -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> > +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
> >  	    gt->type == GT_MEDIA)
> >  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
> >  				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> > @@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)
> >  static void mtl_media_idle(struct intel_gt *gt)
> >  {
> >  	/* Wa_14017073508: mtl */
> > -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> > +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
> >  	    gt->type == GT_MEDIA)
> >  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
> >  				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> > index fcf51614f9a4..7429c233ad45 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> > @@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
> >  	 * Do not enable gucrc to avoid additional interrupts which
> >  	 * may disrupt pcode wa.
> >  	 */
> > -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> > +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
> >  	    gt->type == GT_MEDIA)
> >  		return false;
> >  
> > -- 
> > 2.25.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
