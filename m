Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BF6D85FF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 20:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221DC10E34C;
	Wed,  5 Apr 2023 18:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E86010E34C;
 Wed,  5 Apr 2023 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680719409; x=1712255409;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GKPHyt3OXswZNea+lVHzQfnKAp3/UHh9YETTH0kRu1Y=;
 b=IYXdydxL2MjFih5YgaFW+JElFZEpSCXOjG9FoR1YRx65Y0naTv2wAYrd
 KvUVnVlb/mPjmzDCT6cjlR/zwaWasJlLao0lgNisPwcyWw2BW/g70bS8r
 UsoQV1nwGSZbTFoKLuRwpsQVW4mzUZ88A4fCjn7lviw9opGBTg+946hQ/
 g1N2bXH7j3P9FxCRrgTaI7uO3syVj7AmYc77YjmURMRJKofvTJnxC2zAD
 naRrYlIJytB2nm9sNzprGHyOh/+D7RPkafCEy7dVxKUVurR4nxh+LzrYh
 SYYuVG0P5JB02BImkpcbAb1u4+p39PN19cdj7EGScm9msfaZnH0h98hlO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428821441"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="428821441"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 11:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="776162257"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="776162257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Apr 2023 11:30:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 11:30:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 11:30:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 11:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+uxZc4oRibceKqgmaQjFjLTx+gqvW9QHlBEfV4quqFnccoJ3ojK3L5rSSIqtNjbfxN/ewn23vS1VRnckVFv0VjOjdZKoy/iAjTKfB1qZmUHuU0/x1qRjF2On+XFrsSlLt89FUcA+YljhgGfhr/0RR7Dk2VEsGxuJ7Ws6L9Gx9O/+2HSPhLunjnoxYPI/cCEtJMbIp/Y/9js+IrUGCZMw1skaftLRhp03xLdVVxVGF0bLS4ax3iLP9pNK2kO1zit2RrUKt9jMnu/43YZhYQWgVyDWHKmDrUHkfIko9jAjr3hkgED+b1oh1A54lGY/F7BP+Fqd+km6EDMmSeQ2J2+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IENjQjwvG6gjbPpfiy80HqRFWY5MQZWENj2Bx35rXSo=;
 b=QrAKPQHvQjmSQXxe+6VyAlWB/zBc9c1uoFPsLOGTcouGS/0UCs98Usjpww31LE1mzQpE7ofd4MUiO1zohwNgpaYzEyuHvWJJo94lCvgSN3bjcQ/V+H1qNsh3Iy5W6x7WOL8gZnCvTN5WGBXNSx67FWwv+s6fSp6+V3gFBIhs22FgqxAiLwgDZZDggS6Aa8iRKAtgFblZZcLNM5HRhc49O5L0qi8aCgcoMokHnLUUCdAEAfsjtSBaoXxGslabsTkW/dKaCbNosRrRlkc3wnwl9ttthstvgr1eeNgPStWt4hsrxQco284K5aCGASzbLLeD8/B4Ks8/F7V+Lx0uYjoUoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 18:29:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 18:29:59 +0000
Date: Wed, 5 Apr 2023 18:29:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 02/10] drm/sched: Move schedule policy to scheduler /
 entity
Message-ID: <ZC2+IhNuntxV0eiB@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-3-matthew.brost@intel.com>
 <698b54e7-9ae1-d0db-fd42-572d43180dac@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <698b54e7-9ae1-d0db-fd42-572d43180dac@amd.com>
X-ClientProxiedBy: SJ0PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: a73a2992-c95e-4b7e-fcd7-08db3603c345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ceB4GqIZr/Vqy143JCh0OD1CqefjUJiPPEQhcpyEuYdjIw3W5FtMS8Hzq/KGsKrEwqndBvE/kv74SiLPoz5zJGCXtVNLX5bNj3uGlX2oV2Fbzq1JHTKGTgqR9gYsjBT0OHDO4LU0+H2nU4N9TogJT4qlIRu4/IJyCbhvlvM3TrZctUj8i0i8WMJnqrHss2DYjimlVqa40DC6zrCrKv+lwi8ITme4Ytn5Xh6MWUlj5VuWwTqVhHLl1erDTPYU0bwuy29tDnhzM6YycRBPptfxR1g9kRUfgF8Ly3meuhWYrCmYiQ+fNUBweXyX1Z6LaL5MlOXUxo25+Ujv2WoDLeSUn1XEOu9DmscxnVamQp6P4P8RJ63Xm4phnWRv9WvKbaKqZSj3QzC43v5fRDEbsvCwuTq+NKY0zSBnBhZbpDtsp9oT8H9qLlNw+/MinVaduqNsMQNNiyJXLnyS+luUZiZS36LI2D+34YrYL210UbjQU4AwYnmVl/u6wnvKKN7BUQfi9aqgHu0OIVlfKL6OcERoMGkBIkQffKEauDnGndqyv5VGEtXyYHIAkXjkL9yZz/gI+905/ASs+PbQcG+4g+BAq/HcmFmY2GVLC1lpxVyvyL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(6512007)(6506007)(26005)(6666004)(6486002)(86362001)(83380400001)(38100700002)(82960400001)(186003)(53546011)(6916009)(8676002)(66476007)(4326008)(8936002)(41300700001)(66946007)(66556008)(5660300002)(2906002)(44832011)(7416002)(30864003)(478600001)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LiL3nw3MctwrHoqUwlnw9kZ1g/3ACHq1els8cwEq3KZ/lgtG6WhLbkC1aiei?=
 =?us-ascii?Q?CIDlIYrb93p+0jxYNPf62RwPVeKTliAM3Ew7kyKNpMaOthsWMW0gz/3zMb9J?=
 =?us-ascii?Q?LW/R/GvWU2Np71pNtvsTfjsaIoL9SPSjpgz/nOagzd09tC0U7EC2tZvffD4a?=
 =?us-ascii?Q?vqrGD/lcN2w1u4JsA/4qWeM+/9nVR//GNpub5AyobU53CKKk8/028EvY4oTQ?=
 =?us-ascii?Q?Y/G1iIjB94BpZAB9LCDSAjXG9bfmPgHtZwUQDkt/B08RZC2glwKDyt6uPrFw?=
 =?us-ascii?Q?xituoGvCEwvgYTOF4uwYDLT3k3kce10xSJgy3F3Vd/wCS2jCqU2/c2s/nSnC?=
 =?us-ascii?Q?Dj32t34Uu4LPS3Dfg9X9uj/ANWJFn/EEvdp2eqhkbbIrAJ5hkHp7gviaUP7y?=
 =?us-ascii?Q?ett8Pl/EEpL2OTqCfroFibENXRaom8prPYORA00de0gwddzHwSrHTnRMccIZ?=
 =?us-ascii?Q?kMrgyptrmN1RRL7TOTEr0K2mIKjBfXORopgKxTmKVWHPpk05pFWAOqmUQvKv?=
 =?us-ascii?Q?XCUxKWCsqSNHyU/AS/ZrnFpXyOfnJB0Vf7yQg3kEEdzTO6v1faZxUDAu5NZP?=
 =?us-ascii?Q?zsjT3P5abJuKA5qEzBuaZ4RyAlsHTjsQVcSDkvaeXPzKy9XT58omSHNhMNUA?=
 =?us-ascii?Q?Mru3IUWhfnd/Mle3+HlZKmc1mrCyGb7YFvpw3F41uGOmZe/qAPWDNvrCyvnW?=
 =?us-ascii?Q?ZNVZN1LIwGizstqv4jrJmVAdMC5UNSpEkqgxoqlxR8F+v57xs5ws3jysbbtk?=
 =?us-ascii?Q?C2sBI09WVFUhoOvzOAQQlLCQThPTOmKuq1JUL5zE2uyJv6940ctdG3yqrCJH?=
 =?us-ascii?Q?JIUrTN1akIAVkHCEjzGSB6ievZ11eMk9oVgrFL6QL985b+AYF7Q6Km8KqKDO?=
 =?us-ascii?Q?N04Xu5q7JTySQlidr6ehD2Zz7DgnFnc319WkXDmG6x0sEuvOozK6Wp2RsfEC?=
 =?us-ascii?Q?eM9AdG7Doni3fQ2oHEWsC4Hyd3k4tcRlv3M2HN4+S4+wiI09MYfMbP8amtDG?=
 =?us-ascii?Q?jfx/x3fyINShOZlfm6EptIn8vmtCRFopUXbiT/3Qrwx0MWNRJGMx6Pv2NyDg?=
 =?us-ascii?Q?Fh575fDQF47AZldmoOSrIXyvOicgRnfPhAGvAP6oT+WXg27cnFs777ecn7i4?=
 =?us-ascii?Q?CsJTwHlandyQmBpBChqAq8YQ26I/Fu1XQ1JuzncO6+5VboWFk6cvu2itxeAm?=
 =?us-ascii?Q?IetVz/pP2wMqPUfqhDnucCBeNkt+OSutovytCzXH4S9K/74lSy6hQCgTZhZi?=
 =?us-ascii?Q?+BL8lS7mOeY4RW30Nze9TwOFBeN92rjIHIltCLFJ9YrtBAte5+pffmYqAzUR?=
 =?us-ascii?Q?W/0+gaaQI4ksBZVlRhPZPBUkuJfTnGGeDS8gi5sgmBNAOL3IdCtrRjgDt1au?=
 =?us-ascii?Q?XVW97beTieZuS52mWCiSDwu1rRP9JfAV0B4fr2p003NJCbYYnCxvyd6x9b7D?=
 =?us-ascii?Q?N+Jljh0oODtzdbU0OHpQjeXRv4uqz1W5Q6Z43KAi8dqGnu1P6xT5ekBVk3TJ?=
 =?us-ascii?Q?wWlL7hmhctnYv2NU+oV1Fu2AHj/I5eGju6MV8MJvXk0DJ9ODdNdb46n5C0vm?=
 =?us-ascii?Q?6QK0J5ydQ0oq9fjjM0Us4W7Z8X/MlrWn6+x44+78puOy2pWdsLBcGU3KCzFT?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a73a2992-c95e-4b7e-fcd7-08db3603c345
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:29:59.4092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oyuCzyrqMNrXRbTZQ3Cu0K6gHvCOoaB1huKyRFxuvxF39h66koJkjZ2NRhIV0nsS79La6817Pw9VhHj8beREw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 01:37:22PM -0400, Luben Tuikov wrote:
> Hi,
> 
> Inlined:
> 

Thanks for the feedback.

> On 2023-04-03 20:22, Matthew Brost wrote:
> > Rather than a global modparam for scheduling policy, move the scheduling
> > policy to scheduler / entity so user can control each scheduler / entity
> > policy.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
> >  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
> >  drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
> >  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
> >  drivers/gpu/drm/scheduler/sched_entity.c   | 25 ++++++++++++++++++----
> >  drivers/gpu/drm/scheduler/sched_main.c     | 21 +++++++++++++-----
> >  drivers/gpu/drm/v3d/v3d_sched.c            | 15 ++++++++-----
> >  include/drm/gpu_scheduler.h                | 23 ++++++++++++++------
> >  9 files changed, 73 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 00c9c03c8f94..4df0fca5a74c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2368,6 +2368,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >  				   ring->num_hw_submission, amdgpu_job_hang_limit,
> >  				   timeout, adev->reset_domain->wq,
> >  				   ring->sched_score, ring->name,
> > +				   DRM_SCHED_POLICY_DEFAULT,
> >  				   adev->dev);
> >  		if (r) {
> >  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 8486a2923f1b..61204a3f8b0b 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -136,7 +136,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
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
> > index 54f53bece27c..33042ba6ae93 100644
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
> > index 5879fc262047..f408a9097315 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -97,7 +97,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >  
> >  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >  			num_hw_submissions, 0, sched_timeout,
> > -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> > +			NULL, NULL, to_msm_bo(ring->bo)->name,
> > +			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
> >  	if (ret) {
> >  		goto fail;
> >  	}
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index f48b07056a16..effa48b33dce 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -819,7 +819,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
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
> > index 15d04a0ec623..f1299e51860b 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -33,6 +33,20 @@
> >  #define to_drm_sched_job(sched_job)		\
> >  		container_of((sched_job), struct drm_sched_job, queue_node)
> >  
> > +static bool bad_policies(struct drm_gpu_scheduler **sched_list,
> > +			 unsigned int num_sched_list)
> > +{
> > +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> > +	unsigned int i;
> > +
> > +	/* All scdedule policies must match */
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
> > @@ -75,8 +90,10 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
> >  	entity->last_scheduled = NULL;
> >  	RB_CLEAR_NODE(&entity->rb_tree_node);
> >  
> > -	if(num_sched_list)
> > +	if(num_sched_list) {
> >  		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> > +		entity->sched_policy = sched_list[0]->sched_policy;
> > +	}
> >  
> >  	init_completion(&entity->entity_idle);
> >  
> > @@ -440,7 +457,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> >  	 * Update the entity's location in the min heap according to
> >  	 * the timestamp of the next job, if any.
> >  	 */
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> > +	if (entity->sched_policy == DRM_SCHED_POLICY_FIFO) {
> 
> The entity (context) shouldn't have the "sched_policy" property.
> That property belong only to the scheduler.
> 

Sure. Will have to drop the union of sched_main & rq then.

> >  		struct drm_sched_job *next;
> >  
> >  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > @@ -528,7 +545,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >  		drm_sched_rq_add_entity(entity->rq, entity);
> >  		spin_unlock(&entity->rq_lock);
> >  
> > -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +		if (entity->sched_policy == DRM_SCHED_POLICY_FIFO)
> >  			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
> >  
> >  		drm_sched_wakeup(entity->rq->sched);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 808008990721..77894976fa55 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -62,14 +62,14 @@
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
> >  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> > -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> > +module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
> >  
> >  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> >  							    const struct rb_node *b)
> > @@ -173,7 +173,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >  	if (rq->current_entity == entity)
> >  		rq->current_entity = NULL;
> >  
> > -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> > +	if (entity->sched_policy == DRM_SCHED_POLICY_FIFO)
> >  		drm_sched_rq_remove_fifo_locked(entity);
> >  
> >  	spin_unlock(&rq->lock);
> > @@ -931,7 +931,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >  
> >  	/* Kernel run queue has higher priority than normal run queue*/
> >  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> > +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> >  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> >  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> >  		if (entity)
> > @@ -1106,6 +1106,7 @@ static void drm_sched_main(struct work_struct *w)
> >   *		used
> >   * @score: optional score atomic shared with other schedulers
> >   * @name: name used for debugging
> > + * @sched_policy: schedule policy
> >   * @dev: target &struct device
> >   *
> >   * Return 0 on success, otherwise error code.
> > @@ -1115,9 +1116,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   struct workqueue_struct *run_wq,
> >  		   unsigned hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> > -		   atomic_t *score, const char *name, struct device *dev)
> > +		   atomic_t *score, const char *name,
> > +		   enum drm_sched_policy sched_policy,
> > +		   struct device *dev)
> >  {
> >  	int i;
> > +
> > +	if (sched_policy >= DRM_SCHED_POLICY_MAX)
> > +		return -EINVAL;
> > +
> >  	sched->ops = ops;
> >  	sched->hw_submission_limit = hw_submission;
> >  	sched->name = name;
> > @@ -1127,6 +1134,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
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
> > index 98fb5f85eba6..39cb72b7fe5d 100644
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
> > +	DRM_SCHED_POLICY_MAX,
> > +};
> 
> Please don't use MAX. It is very confusing, as maximum and minimum values
> are values which can be attained, in literature and common use.
> For instance, "the maximum temperature today is 287K, also expect rains"
> means that that temperature will actually be attained.
> 
> Use, DRM_SCHED_POLICY_COUNT for instance, since for 0-based indexing,
> as that of C enums, the last element in the set is in fact the number of
> elements, i.e. the count of the set. (_NUM is also bad as it means
> "number" which could really be anything.)
> 
> So using DRM_SCHED_POLICY_COUNT is most clear.
>

Got it, will change.
 
> >  
> >  /**
> >   * struct drm_sched_entity - A wrapper around a job queue (typically
> > @@ -217,6 +221,9 @@ struct drm_sched_entity {
> >  	 */
> >  	bool 				stopped;
> >  
> > +	/** @sched_policy: Schedule policy for entity */
> > +	enum drm_sched_policy		sched_policy;
> > +
> 
> This creates data redundancy. "sched_policy" should only be found
> in the drm_gpu_scheduler structure. The context's tasks then get to run
> on a scheduler with such and such priority. We shouldn't have this here,
> only in drm_gpu_scheduler structure.
> 

Addressed above, will do.

Matt

> Regards,
> Luben
> 
> >  	/**
> >  	 * @entity_idle:
> >  	 *
> > @@ -489,6 +496,7 @@ struct drm_sched_backend_ops {
> >   *              guilty and it will no longer be considered for scheduling.
> >   * @score: score to help loadbalancer pick a idle sched
> >   * @_score: score used when the driver doesn't provide one
> > + * @sched_policy: Schedule policy for scheduler
> >   * @ready: marks if the underlying HW is ready to work
> >   * @free_guilty: A hit to time out handler to free the guilty job.
> >   * @pause_run_wq: pause queuing of @work_run on @run_wq
> > @@ -514,6 +522,7 @@ struct drm_gpu_scheduler {
> >  	int				hang_limit;
> >  	atomic_t                        *score;
> >  	atomic_t                        _score;
> > +	enum drm_sched_policy		sched_policy;
> >  	bool				ready;
> >  	bool				free_guilty;
> >  	bool				pause_run_wq;
> > @@ -525,7 +534,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   struct workqueue_struct *run_wq,
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
