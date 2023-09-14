Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2857A09B8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 17:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0FB10E13B;
	Thu, 14 Sep 2023 15:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2C610E13B;
 Thu, 14 Sep 2023 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694706612; x=1726242612;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t9jB6VwGXiuSjww49tUIWhk1U0iefnTEvEqjqdUWvDE=;
 b=MVjFzhv5yZFnlOEHCK9DCflmnrtKJ4+c4IEMBjtGgZiNtpfRrfLNwqta
 vD8e5ovIovL/VkkmdLGwES2m4ex7BY1A2wsX6IrWNadDFC8p9PLj8FgCt
 FLOlW4Q2Q60bvd350t9Ko9y4ZtV8AgNfyZg/GMW6RHxe705UmYB2KjcMD
 hYOPDojJUtlaq+edCAtElvUU4XYJstu/COqMmgv5sWrRCgaE17qQDCGY9
 2S6mQNIgD569blXcBgKgjfutk/XiWauU97Y9AMNOK0o4J2y0SbeBqgoGm
 6Fn1PQe+zgwCIB63mYm9Rh4S4JS0TEdBhVhfPEYtBwfmXX+QF2CTplty0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359247850"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="359247850"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868290106"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="868290106"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 08:50:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 08:50:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 08:50:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 08:50:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZbNKFfEBbZwJ3NXRSVx1pLXldcIQdU9pmRgwbPAWQlGOqU1D6VYeXhVc2SrLTVFBlqaiMRTivcOYC9J73Y/sr0ZY5Wnd/kCVxml9cXFZ6stRyjLXLllTamY4ZxEr3APlHxTpGOjOD2CQW8rNOhkB6smtbWYbljMS/x+1KDExrwiGPj/2jmb8ziF+CYI3892v2tUHuzmJIUCa5L6MiwA2IellWG9SybKsnXGVXt4QT/emlk2zfqbJNFvQyO5AlABU2saZ1jd6LwqF4P1EHw6OHTp0zqC4Z1kqsSVZd7XbKMfrn09yPQLgRsbO69bZaKQDzvvfLEoN88V4WVxJcqSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAY+228dpCMxTHtn53w0ueGEFCihkssYD2MTjDyKXZg=;
 b=VDadKkrpui92uD0zDk1iLG+Rdar+DvPNdV6ZXcAysPKPk3vPj8zNjLYTVLr1jywQmasVaxF3ggMe7VkEy7rfYzxcqb9r1ch+NWZQXGT+tAlYA5RYvRaaEdfHVZ2sdymVeHrcPc7EFqrwNKlyYnp8YVVF2QikPjSBhNhSAhBt9HB36eZJ5khnF3aPbXuP6y1DcyPKJCPxXShPH8N2kBzEJuMFw/kgiTVzI9z50gVinVk96TfBLubHzcCjmOcRWq2tAcEkKjzSUK83mehu5kowWFCDJLbYn+Fo1PnXqKQQ36RRKyBqphfjKbLNwOWL/Py92VFSN3awvscQ9zLNYycPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8320.namprd11.prod.outlook.com (2603:10b6:806:37c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Thu, 14 Sep
 2023 15:50:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 15:50:07 +0000
Date: Thu, 14 Sep 2023 15:49:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler /
 entity
Message-ID: <ZQMrbwUqxinDyWjf@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-4-matthew.brost@intel.com>
 <da5a4c90-5a8d-4248-bc8e-b0bd2a03aa5f@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <da5a4c90-5a8d-4248-bc8e-b0bd2a03aa5f@amd.com>
X-ClientProxiedBy: BYAPR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:a03:80::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd59c94-7a04-4502-3433-08dbb53a453f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MgueWbksi9wtadM99XJOJGS7Ig3RoNt4r4M/JCgVbNi/FaPpqPDN/HL5gBA4g9FKXCwSZ+Y96CLzIR/t7JP8wMkG6wXobScUiF9udN/rurKdR3ThUSa/XwBfd1JqUsWE8L5JWRKLBGL7GALZo4XoBURQUABxaqrUKRoYID+cd4dC0DOa+RfJLmhN+O3rQvLUyye71a1ypIfGXdb2t60HPB8bIa3fqoxfFF5BZvVZ5QVD0j9jxKuqK4WmASuTkd77v8CytfrBQ4s5tpeBBDlHgnRqGfilrz8t7i6I3Bqrj5ORb4gXyjqaP6ZTTCq+sz1XUlWOL3K0Iutc8O9gZBqU+O0wBNaq2tTOMLWqnBEDgojSZjuls4iy9R9q8OFB5hf/FOmWl414ymAQKOxnF1lM0QfXMSo9Zv6SZ230fduYuGTZqrNt3HCo9XmG6x5Vp7JKjcf5KVN/OVKfStC55zuw0s3Rx6uDbKFOpNeTlcdca95aUBKbP02nuIpM3IiGrVnyROVxuOs3KYjN+hOVmn56lS+gBeSE6aPleK4CiAlVYOSiorakM+pymO4wTB22+wIq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(1800799009)(451199024)(186009)(2906002)(6486002)(53546011)(6666004)(6506007)(478600001)(83380400001)(30864003)(8936002)(26005)(6512007)(44832011)(66476007)(7416002)(41300700001)(316002)(66556008)(66946007)(8676002)(6916009)(4326008)(5660300002)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i65+WRikj6UeaV921vzd07QeU8S/4RNpjKzgZ8GEEPht5WErHrPbM+YUbU0/?=
 =?us-ascii?Q?fezoqtwd61TcnSQ0MuPO1Q5jYwb976DlGj259zcaiYFwxbRNR3lZh0PbAJb8?=
 =?us-ascii?Q?P0e04aXmgpySxuH1+I3nW5tcjVz+bk2ASn9zN0BX2STQtZuXG6VWbnwmNkgN?=
 =?us-ascii?Q?ZVlKcsUHW1JMV3xe9eQyAu/u3fLMlIOdLUntGlPEQdRvjvmJthKW+5W8Ao+2?=
 =?us-ascii?Q?nzfpZceOX8peZIbPcGmdGNjDCWcMtHO1Ml+q2FJzfk+eBtoIi/+AqWrwvvBU?=
 =?us-ascii?Q?qeQ/xj2+V5GpU1WKrR9poT6uxlCSZx8NS938T1QpQ6Z2JYddMCYvWZOYFsRg?=
 =?us-ascii?Q?aJGg5G3K/H0EeM1+V79TDMeynyT+3pErFZB6K/eS9jjUjkVoW5tx4S8WyFTU?=
 =?us-ascii?Q?AoupaMvz3PNqkU/rKeLaDNounBSVhk+b1haEaEqb/v1WAuxRENxK+Hqejl97?=
 =?us-ascii?Q?dHtXLmzhEnJAOSSJTvm4lNgQJILnmBnayfTVE8hl84eMm54rbOaaLqvUXHsy?=
 =?us-ascii?Q?M9M0rU8sS2ctPqFGIXeS4f0gRjHu/HTUPUSTT+CxUUfsIsuy3fut9YFh8r4s?=
 =?us-ascii?Q?QbdNtVVk1scsem/vY4B0ynBSoqK4zVIz4KiHmsAyjj+CcabcPrnjpsTDJ4Ik?=
 =?us-ascii?Q?LH9TwVocxqD+94gFW5v4PEa39t6wxoxFpLOex86YAaqivSJb93fjidNVQuiM?=
 =?us-ascii?Q?DiFRoF7KSBD36p9A7k6iH4UWQYxbztRJV9TCH2YKQwSCJfhHcKC+x94Xsj9E?=
 =?us-ascii?Q?hfBZDX5aBJSsR4WFOQdoszNwyl2+YPjeZpkXnEeNWoX8h9kD2jvNLrH/Mmp+?=
 =?us-ascii?Q?FHrCccokj6wTAFsS4nSqa1sd847eUA2PUscSlc+1+b/CJdFousKLhBsCz1ND?=
 =?us-ascii?Q?rNpNG8YtnI/nCoHT83eY2xLtvXJgMervcxDVYWpJlg9hFRv5TbkfKCS5x7BD?=
 =?us-ascii?Q?J6SusKJ1R05/KZb0EsCUYM6DDePDmtmsPKW9rdd2tYc3vJOKOlrbjjCc0wSI?=
 =?us-ascii?Q?hgHDrtQB9D9uOUWQcXDtQ1E5XewStRljUBycGayctX7yLbxcmjRZNJJCERQH?=
 =?us-ascii?Q?mnXi44KJXHld2t6ep+xVXS3lvo040Z/DMnPLY1scajgDbxiHXoOM2o6S11rS?=
 =?us-ascii?Q?pI2CNjmKKNPDhsmbM0z8lhkgql0PtDORR+aA2fRtNjxSJMkeOlYkUSavB04b?=
 =?us-ascii?Q?J1nrphoKvmuyRBie95mdohP790dZ3sPOKAbVsGBqIPG8+SgkHkls2Wt6+kev?=
 =?us-ascii?Q?Xy8mpsf3o0Ti31wv0QS4f3I3PtGrc6g+vdrkUdcgVTCnNkAYOQlJTSfUTiXk?=
 =?us-ascii?Q?0AoHVPMG2IPmBMiPDtFu9ZSFH5ZmK5+M6EgFLNiwDNdCeP5T7gl7niIMx85n?=
 =?us-ascii?Q?J37uOBWlnsXxvJ3KBXa2I80Gk1uOyiJ2j0XQ2jydVxMpCBk/5CCBDertCd7l?=
 =?us-ascii?Q?g/EnG1zwP+Pvm6WF+q08ZklwYPqDqNEjoZRpLjtrhVLyN9s8j8EEs4fzyv1z?=
 =?us-ascii?Q?dGhdB8A7o3cCwNMBtbI71mWSHWC1+cf8b8et9Jv9xxH+NvMGstpkUcGPtn3n?=
 =?us-ascii?Q?H5gRKExazzlUKPS9sapPVoMZqqPvz63BCh9CaLqArm4e/GMe0Df3Nim21Tgk?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd59c94-7a04-4502-3433-08dbb53a453f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 15:50:07.9056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csX1aNaYAwWK9WD7cG1VNLPvxGmYZL1RYLJQ1zvTr4Igzqf0LmV/M8fPJ+bmjogkY3yeHE56g+Mp3/PcfJ0nOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8320
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 12:18:11AM -0400, Luben Tuikov wrote:
> On 2023-09-11 22:16, Matthew Brost wrote:
> > Rather than a global modparam for scheduling policy, move the scheduling
> > policy to scheduler / entity so user can control each scheduler / entity
> > policy.
> > 
> > v2:
> >   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
> >   - Only include policy in scheduler (Luben)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
> >  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
> >  drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
> >  drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
> >  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
> >  drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
> >  drivers/gpu/drm/scheduler/sched_main.c     | 23 +++++++++++++++------
> >  drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
> >  include/drm/gpu_scheduler.h                | 20 ++++++++++++------
> >  10 files changed, 72 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index c83a76bccc1d..ecb00991dd51 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2309,6 +2309,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >  				   ring->num_hw_submission, 0,
> >  				   timeout, adev->reset_domain->wq,
> >  				   ring->sched_score, ring->name,
> > +				   DRM_SCHED_POLICY_DEFAULT,
> >  				   adev->dev);
> >  		if (r) {
> >  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 618a804ddc34..3646f995ca94 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >  			     msecs_to_jiffies(500), NULL, NULL,
> > -			     dev_name(gpu->dev), gpu->dev);
> > +			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
> > +			     gpu->dev);
> >  	if (ret)
> >  		return ret;
> >  
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index 8d858aed0e56..465d4bf3882b 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >  			      lima_job_hang_limit,
> >  			      msecs_to_jiffies(timeout), NULL,
> > -			      NULL, name, pipe->ldev->dev);
> > +			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
> > +			      pipe->ldev->dev);
> >  }
> >  
> >  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index b8865e61b40f..f45e674a0aaf 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -96,7 +96,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >  
> >  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >  			num_hw_submissions, 0, sched_timeout,
> > -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> > +			NULL, NULL, to_msm_bo(ring->bo)->name,
> > +			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
> >  	if (ret) {
> >  		goto fail;
> >  	}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index d458c2227d4f..70e497e40c70 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -431,7 +431,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
> >  
> >  	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
> >  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> > -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> > +			      NULL, NULL, "nouveau_sched",
> > +			      DRM_SCHED_POLICY_DEFAULT, drm->dev->dev);
> >  }
> >  
> >  void nouveau_sched_fini(struct nouveau_drm *drm)
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 326ca1ddf1d7..ad36bf3a4699 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -835,7 +835,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >  				     nentries, 0,
> >  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >  				     pfdev->reset.wq,
> > -				     NULL, "pan_js", pfdev->dev);
> > +				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
> > +				     pfdev->dev);
> >  		if (ret) {
> >  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> >  			goto err_sched;
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> > index a42763e1429d..65a972b52eda 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -33,6 +33,20 @@
> >  #define to_drm_sched_job(sched_job)		\
> >  		container_of((sched_job), struct drm_sched_job, queue_node)
> >  
> > +static bool bad_policies(struct drm_gpu_scheduler **sched_list,
> > +			 unsigned int num_sched_list)
> 
> Rename the function to the status quo,
> 	drm_sched_policy_mismatch(...
> 
> > +{
> > +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> > +	unsigned int i;
> > +
> > +	/* All schedule policies must match */
> > +	for (i = 1; i < num_sched_list; ++i)
> > +		if (sched_policy != sched_list[i]->sched_policy)
> > +			return true;
> > +
> > +	return false;
> > +}
> > +
> >  /**
> >   * drm_sched_entity_init - Init a context entity used by scheduler when
> >   * submit to HW ring.
> > @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >  			  unsigned int num_sched_list,
> >  			  atomic_t *guilty)
> >  {
> > -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> > +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> > +	    bad_policies(sched_list, num_sched_list))
> >  		return -EINVAL;
> >  
> >  	memset(entity, 0, sizeof(struct drm_sched_entity));
> > @@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >  	 * Update the entity's location in the min heap according to
> >  	 * the timestamp of the next job, if any.
> >  	 */
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> >  		struct drm_sched_job *next;
> >  
> >  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> >  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  {
> >  	struct drm_sched_entity *entity = sched_job->entity;
> > -	bool first;
> > +	bool first, fifo = entity->rq->sched->sched_policy ==
> > +		DRM_SCHED_POLICY_FIFO;
> >  	ktime_t submit_ts;
> >  
> >  	trace_drm_sched_job(sched_job, entity);
> > @@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  		drm_sched_rq_add_entity(entity->rq, entity);
> >  		spin_unlock(&entity->rq_lock);
> >  
> > -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +		if (fifo)
> >  			drm_sched_rq_update_fifo(entity, submit_ts);
> >  
> >  		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 614e8c97a622..545d5298c086 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -66,14 +66,14 @@
> >  #define to_drm_sched_job(sched_job)		\
> >  		container_of((sched_job), struct drm_sched_job, queue_node)
> >  
> > -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> > +int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> >  
> >  /**
> >   * DOC: sched_policy (int)
> >   * Used to override default entities scheduling policy in a run queue.
> >   */
> > -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> > -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> > +MODULE_PARM_DESC(sched_policy, "Specify the default scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> 
> Note, that you don't need to add "default" in the text as it is already there at the very end "FIFO (default)."
> Else, it gets confusing what is meant by "default". Like this:
> 
> 	Specify the default scheduling policy for entities on a run-queue, 1 = Round Robin, 2 = FIFO (default).
> 
> See "default" appear twice and it creates confusion? We don't need our internal "default" play to get
> exported all the way to the casual user reading this. It is much clear, however,
> 
> 	Specify the scheduling policy for entities on a run-queue, 1 = Round Robin, 2 = FIFO (default).
> 
> To mean, if unset, the default one would be used. But this is all internal code stuff.
> 
> So I'd say leave this one alone.
> 
> > +module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
> 
> Put "default" as a postfix:
> default_drm_sched_policy --> drm_sched_policy_default
> 
> >  
> >  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> >  							    const struct rb_node *b)
> > @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >  	if (rq->current_entity == entity)
> >  		rq->current_entity = NULL;
> >  
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
> >  		drm_sched_rq_remove_fifo_locked(entity);
> >  
> >  	spin_unlock(&rq->lock);
> > @@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >  
> >  	/* Kernel run queue has higher priority than normal run queue*/
> >  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> > +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> >  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> >  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> >  		if (entity)
> > @@ -1071,6 +1071,7 @@ static void drm_sched_main(struct work_struct *w)
> >   *		used
> >   * @score: optional score atomic shared with other schedulers
> >   * @name: name used for debugging
> > + * @sched_policy: schedule policy
> >   * @dev: target &struct device
> >   *
> >   * Return 0 on success, otherwise error code.
> > @@ -1080,9 +1081,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   struct workqueue_struct *submit_wq,
> >  		   unsigned hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev)
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev)
> >  {
> >  	int i;
> > +
> > +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> > +		return -EINVAL;
> > +
> >  	sched->ops = ops;
> >  	sched->hw_submission_limit = hw_submission;
> >  	sched->name = name;
> > @@ -1092,6 +1099,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	sched->hang_limit = hang_limit;
> >  	sched->score = score ? score : &sched->_score;
> >  	sched->dev = dev;
> > +	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
> > +		sched->sched_policy = default_drm_sched_policy;
> > +	else
> > +		sched->sched_policy = sched_policy;
> >  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >  
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 38e092ea41e6..5e3fe77fa991 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_bin_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_bin", v3d->drm.dev);
> > +			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_render_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_render", v3d->drm.dev);
> > +			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		goto fail;
> >  
> > @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			     &v3d_tfu_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_tfu", v3d->drm.dev);
> > +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >  	if (ret)
> >  		goto fail;
> >  
> > @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  				     &v3d_csd_sched_ops, NULL,
> >  				     hw_jobs_limit, job_hang_limit,
> >  				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_csd", v3d->drm.dev);
> > +				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
> > +				     v3d->drm.dev);
> >  		if (ret)
> >  			goto fail;
> >  
> > @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  				     &v3d_cache_clean_sched_ops, NULL,
> >  				     hw_jobs_limit, job_hang_limit,
> >  				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > +				     NULL, "v3d_cache_clean",
> > +				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
> >  		if (ret)
> >  			goto fail;
> >  	}
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 278106e358a8..897d52a4ff4f 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -72,11 +72,15 @@ enum drm_sched_priority {
> >  	DRM_SCHED_PRIORITY_UNSET = -2
> >  };
> >  
> > -/* Used to chose between FIFO and RR jobs scheduling */
> > -extern int drm_sched_policy;
> > -
> > -#define DRM_SCHED_POLICY_RR    0
> > -#define DRM_SCHED_POLICY_FIFO  1
> > +/* Used to chose default scheduling policy*/
> > +extern int default_drm_sched_policy;
> > +
> > +enum drm_sched_policy {
> > +	DRM_SCHED_POLICY_DEFAULT,
> > +	DRM_SCHED_POLICY_RR,
> > +	DRM_SCHED_POLICY_FIFO,
> > +	DRM_SCHED_POLICY_COUNT,
> > +};
> 
> No. Use as the first (0th) element name "DRM_SCHED_POLICY_UNSET".
> The DRM scheduling policies are,
> 	* unset, meaning no preference, whatever the default is, (but that's NOT the "default"),
> 	* Round-Robin, and
> 	* FIFO.
> "Default" is a _result_ of the policy being _unset_. "Default" is not a policy.
> IOW, we want to say,
> 	"If you don't set the policy (i.e. it's unset), we'll set it to the default one,
> which could be either Round-Robin, or FIFO."
> 
> It may look a bit strange in function calls up there, "What do you mean `unset'? What is it?"
> but it needs to be understood that the _policy_ is "unset", "rr", or "fifo", and if it is "unset",
> we'll set it to whatever the default one was set to, at boot/compile time, RR or FIFO.
> 
> Note that "unset" is equivalent to a function not having the policy parameter altogether (as right now).
> Now that you're adding it, you can extend that, as opposed to renaming the enum
> to "DEFAULT" to tell the caller that it will be set to the default one. But we don't need
> to tell function behaviour in the name of a function parameter/enum element.
> 

s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ it is.

Matt

> >  
> >  /**
> >   * struct drm_sched_entity - A wrapper around a job queue (typically
> > @@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
> >   *              guilty and it will no longer be considered for scheduling.
> >   * @score: score to help loadbalancer pick a idle sched
> >   * @_score: score used when the driver doesn't provide one
> > + * @sched_policy: Schedule policy for scheduler
> >   * @ready: marks if the underlying HW is ready to work
> >   * @free_guilty: A hit to time out handler to free the guilty job.
> >   * @pause_submit: pause queuing of @work_submit on @submit_wq
> > @@ -514,6 +519,7 @@ struct drm_gpu_scheduler {
> >  	int				hang_limit;
> >  	atomic_t                        *score;
> >  	atomic_t                        _score;
> > +	enum drm_sched_policy		sched_policy;
> >  	bool				ready;
> >  	bool				free_guilty;
> >  	bool				pause_submit;
> > @@ -525,7 +531,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   struct workqueue_struct *submit_wq,
> >  		   uint32_t hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev);
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev);
> >  
> >  void drm_sched_fini(struct drm_gpu_scheduler *sched);
> >  int drm_sched_job_init(struct drm_sched_job *job,
> 
> -- 
> Regards,
> Luben
> 
