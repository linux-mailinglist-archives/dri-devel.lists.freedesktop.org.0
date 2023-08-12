Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000CD779CF9
	for <lists+dri-devel@lfdr.de>; Sat, 12 Aug 2023 05:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00E310E138;
	Sat, 12 Aug 2023 03:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2E210E138;
 Sat, 12 Aug 2023 03:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691810463; x=1723346463;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y3VYFFGr7JuE9VPiH3KgjuCyjp+YwlfmeJ9XHcLcBrk=;
 b=cncAWuZvoB1zVQ6gMtzjjOIfJS2yqNvBc6fZ88oHvYUJvBEDgh4v+6xQ
 QhKltH7d8tYGw9e0/JwYBwmPLd2semP6XxllvVXEE3ST+pD5wUVU1QwkB
 iQCcfcO9H1c1wrfv21UZnQFHvoGFT3GOa29H/02Eo2gO4213hC73fksi5
 Dn5qJNys1wsfjFryt/Nql4YC19TaUaPUELKDRxF4qHsg8ObX/K2w8FY4z
 ATbs5oT9KUQOtjVSWkZ7BZB/4+6TNN5pxfiOveb6hlSszNPFyRGlPRJ2A
 Sx1BB9Hx5JDHyBlQwmV4TBDcaiolbISKIWfRm/UHlVdxqsIkd0P4dia6z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402780655"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="402780655"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 20:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="856479955"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="856479955"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 11 Aug 2023 20:21:02 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 20:21:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 20:21:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 20:21:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KijLYiaeYp/HGeBKaCwE6i9UCFOTIRJkhVCGuEUhpKjMOZNU+UkhMX5NCc5UI1BCa3SUs1MCYXeeznVnTXThM9cy/0hjYSN1N++ZhiiVl85cTHHa9uFHF6Nkk3Vd1FdsWAnOrYl5uPq1baxUOvANpw74yaR5mTNA2mAQeIMrss/kDTumTxNkXjJ8E6XXT8ahdLExvVNkQYnlG5pB81A+VMbewKcjfGW0dXGg9xoAfYKT5WOY85ir9VNWDiXK5JUxchWORy95FJwQ82oukFo684dA/fUK+YyGXaq9XNPa4lwGhXogdeFj/5XdVIGyfr0geP9xri7X5E7swFg5biLSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6uaucnwIsKpQR1jtVmCltud5HJhjFehTgfIKOotapg=;
 b=mVxe5Qdm1wWQgDfLblMNg1CPTYrbpNOHUgXWsFVsJqIMtTvpYnXp1TpDoAN8qzvx2Mk8qRZdcc6ErmkpmCAL9YJDn+4Kp06WD+mV/xZF68GkLFBHNkFW2frI5h9G6R3Vg1PMQt9G8K/JihwJhsZp9/6q0HHpPlxPOy0rxO8YltshR/Phm+acMHi448JiJLephFYD5ak02KwfKCgjHe8i374gjdRNBqw0TqX8zaE48evjvsiH+rLCzB8Iz9d3MfmwWw+VXP5GxiKQ5iqFIq0EI5t+2DyczouAXJ9ZXonQAAF0ymdTHA1lRAi9ulFuoeR6fdqYm/rMbW+dYs14TVxkfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Sat, 12 Aug
 2023 03:20:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%4]) with mapi id 15.20.6652.029; Sat, 12 Aug 2023
 03:20:59 +0000
Date: Sat, 12 Aug 2023 03:20:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 2/9] drm/sched: Move schedule policy to scheduler /
 entity
Message-ID: <ZNb6aLwKRYdW0NSf@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-3-matthew.brost@intel.com>
 <830e7e1b-7a7b-e9c4-ad97-eba03bbf1728@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <830e7e1b-7a7b-e9c4-ad97-eba03bbf1728@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: dc12e297-5989-4226-cbf2-08db9ae32638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLmWidri2XNOW3xnMjsSgCXTNOmx3fJOJQOJwjAk9tU6hxzj+pA1Sc2Emju6BO0Gxi+pbeMC6fG0cvcz2AjfOBybqV+ytQcOnD0lHsJC0hkq0LZmiCl3LyQ7vjGv7pbx5XtctBFudBD0PTVupSU0TOSUpv/Wh0h0nmwfW1y8fmVHiPqS/ho3ceU8GffA2I+uRDktnS2T+dXoR3TD6ZBqSUXz14/dt1HcD9n+iDTvSyGzwy4EBSGRchw0ZIAAbiLDHXQ4zbiih08KROuDekhq3wFQ9XzhMVx3xhlmyX/iyCS8ehQp0rI/p8PZlgeq12XlHTrIlGd9Otbv9ZU7b54Ub/lEii2KlIrJxoDsapxuPOuRduOs76UrzQLDR3aGXK0NgRgJ4GvXGFkVhog8hdoLB0xh1Mpj3drE//guw4sbcngKXQ95Bn2Zxd6LCTsPqkbMgwyc43INURxlwA1YLeSOn6xWuXt83218Y+tPLK1+DXd/S0sKXfWxxOfeJUdMrPJGufJPklusE94nPfgsKZnahyCj3VOn6yHi6sHMIQ3/0989TfFatC+f9KcqUZ44PKdn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(396003)(366004)(346002)(1800799006)(451199021)(186006)(7416002)(66476007)(83380400001)(66946007)(478600001)(66574015)(86362001)(26005)(6506007)(2906002)(6916009)(66556008)(316002)(53546011)(44832011)(41300700001)(6486002)(5660300002)(6666004)(6512007)(38100700002)(8936002)(82960400001)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PRQU4JbKgb7psYghWKjs5F8P4VrFR1DUlrS9RtyEhRcKiDe6TXAcg45TGL?=
 =?iso-8859-1?Q?zkEv/DTywj4wVfKAyLG+K+hvb1VkTvBLwJuvT1aE+tqWFkeBnsZnjJwtM4?=
 =?iso-8859-1?Q?nQP3UODdNC6BZERsfA3nicoIa7GZiXjabo005jTOtkBbd0HS944pMQeqFq?=
 =?iso-8859-1?Q?lnNwv5FngjgwGg70/T7s4qDuPDtjcO1/iCu6qe8f+PUd4OPHwysF27WOjd?=
 =?iso-8859-1?Q?ACXWtBtaYc0+rcsYHcXb2a9/7EZivRe1Zj7kItrYkGwj0sjE5Nd2lpZ7sw?=
 =?iso-8859-1?Q?fBXbv09p84DeX4+Ve+00wcYq1mppKh9ZnrvI2NZmK/0A/fbrQl+sGic/Na?=
 =?iso-8859-1?Q?QlTetjJtYv1YMhkmR4Nk/1KOIcS47/1qXuvpoUi1APOFQpyVawatXwxZdF?=
 =?iso-8859-1?Q?dx57yyf8FWz440Slr8hMdMwsTx2yh8ztFCNHpukRQVb+Xz+7HBQmWAG2d4?=
 =?iso-8859-1?Q?9l4HYJeS+4yeOfMzPglNAQaUPIX5Y0doo5J/H4DngK6qGDf0RN/yptr9ug?=
 =?iso-8859-1?Q?fPCRSsYCfBsrfdyvsepUNI53ph2Y3nBUwjZrF1DR0DFxDPsUjnRm0Eer0H?=
 =?iso-8859-1?Q?DbFb3e78wm25IifJQqMptIa4wSPo/aWMmfQObssAXTLWNkHRHq7XCGoXD8?=
 =?iso-8859-1?Q?+H6RQBD6aPpvX8Rf83ajglE+QGU6F5j2VZ5ACjtmMqzUO9ax8f1HWEn28A?=
 =?iso-8859-1?Q?jUOdWPFGfk791D+VkfNQCb0KVBxSnAK65zGUPH3kErmqKRByFPYys+2so1?=
 =?iso-8859-1?Q?HWATBP2i0noGlLNX4cdtSbhl1gZ+EYexqF9AxB2m0NY0yoFVsboDhF7had?=
 =?iso-8859-1?Q?Fugub/oUZ1Qd9UkC45+S9EPR3HNE+MRd27iwTXa3jhTHS28aL49hQVgAt3?=
 =?iso-8859-1?Q?As+vbDHuggA3mP9ZM8g7d2VCUunhLHRj8xbSV8E4P+Er0YR3EFQUuV3vlh?=
 =?iso-8859-1?Q?4KlbqbBZqsqwFtybbGFjMtoYXdoJmixgBLbdLrS3jlB+L1JfF2wtF9PLNy?=
 =?iso-8859-1?Q?dcWwY2ISt2Mak07O6p/ZYb+QiMP0lxWouooemk9+OH+MleMsDDQp3OwN3N?=
 =?iso-8859-1?Q?cHlWahP3NrXpqWtcHl05/blosXneDv+f05Sn4Ti4z9Tq9jr8aH2DUO4r3t?=
 =?iso-8859-1?Q?cYbsjWfIP1dq0qZA1ztd3MIgJau/d5dMtuSDeT0yCvFgNHAMErzMgI69rA?=
 =?iso-8859-1?Q?vcCCGKZZi4MQDJ1DY/w0/fkeS0pDIHLpjo6Wda8IjvgKI7ANdArgrp5lUn?=
 =?iso-8859-1?Q?x0zlAGsJjwLhzws+WnTGKAni0X6MDKaTsrWne6DP9AZu9eMp+5Nv5NQjjZ?=
 =?iso-8859-1?Q?KxBkPIIfhinhmDVElAkPWBReIq8jb7C9uqOtCqq85TXp96ff2gV+Klb/4V?=
 =?iso-8859-1?Q?Wh2by0zedNebSTB7VTfB1nvvFzI3lN2aa0K0Pao6cK9Kkaf3afyzPYRubW?=
 =?iso-8859-1?Q?yZ+mpp+J8sd02Y/8+NcDouIrRKpT6CzyVLcb1UqSw4mtlh5NnyBJjZSaFf?=
 =?iso-8859-1?Q?fzVlt0OgIY6u6c8bodp3zLR1IHs3rYiaiNMLbYpNHxC767zIyh6aLu0Woc?=
 =?iso-8859-1?Q?xPKFAm4ghHE3lQbmWg9+Y89vxU2i5tL/53JCUJ7hWSbel5zPLlugkD79qn?=
 =?iso-8859-1?Q?Y5l3OV7p9XHxD+RL/gnreqDvLQb3N6mnlkyoAXq4dLBMVVm1N9bDOjxQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc12e297-5989-4226-cbf2-08db9ae32638
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2023 03:20:59.4214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aAyDqRzX7n7EScskTvP6v70My+KJRso+ZxzcTrQySOWDrzM/ivGPV93XyQ5tIUxCbtF+UMKQdGwXZ9YBw+TRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 06:43:22PM -0300, Maira Canal wrote:
> Hi Matthew,
> 
> I'm not sure in which tree you plan to apply this series, but if you
> plan to apply it on drm-misc-next, it would be nice to rebase on top of
> it. It would make it easier for driver maintainers to review it.
> 

I rebased this on drm-tip but forgot the first patch in the series.

Let me make sure I get this correct and will send a rev3 early next week.

> Apart from the small nit below it, I tested the Xe tree on v3d and things
> seems to be running smoothly.
> 
> On 8/10/23 23:31, Matthew Brost wrote:
> > Rather than a global modparam for scheduling policy, move the scheduling
> > policy to scheduler / entity so user can control each scheduler / entity
> > policy.
> > 
> > v2:
> >    - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
> >    - Only include policy in scheduler (Luben)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
> >   drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
> >   drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
> >   drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
> >   drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
> >   drivers/gpu/drm/scheduler/sched_main.c     | 23 +++++++++++++++------
> >   drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
> >   include/drm/gpu_scheduler.h                | 20 ++++++++++++------
> >   10 files changed, 72 insertions(+), 26 deletions(-)
> > 
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 38e092ea41e6..5e3fe77fa991 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_bin_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_bin", v3d->drm.dev);
> > +			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		return ret;
> > @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_render_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_render", v3d->drm.dev);
> > +			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
> 
> Small nit: s/ULL/NULL
> 

Yep, will fix.

Matt

> Best Regards,
> - Maíra
> 
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		goto fail;
> > @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			     &v3d_tfu_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> > -			     NULL, "v3d_tfu", v3d->drm.dev);
> > +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
> > +			     v3d->drm.dev);
> >   	if (ret)
> >   		goto fail;
> > @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   				     &v3d_csd_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_csd", v3d->drm.dev);
> > +				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
> > +				     v3d->drm.dev);
> >   		if (ret)
> >   			goto fail;
> > @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   				     &v3d_cache_clean_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> > -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > +				     NULL, "v3d_cache_clean",
> > +				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
> >   		if (ret)
> >   			goto fail;
> >   	}
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 278106e358a8..897d52a4ff4f 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -72,11 +72,15 @@ enum drm_sched_priority {
> >   	DRM_SCHED_PRIORITY_UNSET = -2
> >   };
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
> >   /**
> >    * struct drm_sched_entity - A wrapper around a job queue (typically
> > @@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
> >    *              guilty and it will no longer be considered for scheduling.
> >    * @score: score to help loadbalancer pick a idle sched
> >    * @_score: score used when the driver doesn't provide one
> > + * @sched_policy: Schedule policy for scheduler
> >    * @ready: marks if the underlying HW is ready to work
> >    * @free_guilty: A hit to time out handler to free the guilty job.
> >    * @pause_submit: pause queuing of @work_submit on @submit_wq
> > @@ -514,6 +519,7 @@ struct drm_gpu_scheduler {
> >   	int				hang_limit;
> >   	atomic_t                        *score;
> >   	atomic_t                        _score;
> > +	enum drm_sched_policy		sched_policy;
> >   	bool				ready;
> >   	bool				free_guilty;
> >   	bool				pause_submit;
> > @@ -525,7 +531,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   struct workqueue_struct *submit_wq,
> >   		   uint32_t hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev);
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev);
> >   void drm_sched_fini(struct drm_gpu_scheduler *sched);
> >   int drm_sched_job_init(struct drm_sched_job *job,
