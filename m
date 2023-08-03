Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C2576ECF3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B6210E60F;
	Thu,  3 Aug 2023 14:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5581110E60C;
 Thu,  3 Aug 2023 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691073847; x=1722609847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1Bq63xwM8HCCiQ5pwNU52yGxBMAy9Qs8cRD75zc16J4=;
 b=ZrC+yosiA7Cgbqakasrkv5+8IaXaTBxz1vCDx8Ev9e/98hXZSJK65Hy3
 v8IaM0ZL4DoZD2WC6k08EA4YFrb4Yn3ZVM7WYGyO+K+whDYq3Tp6HZCGZ
 SRUMYYIMZ2OMCD09479jOs5vmDOexfMXTbPECwMbnCUluEurEJkWCx12s
 2gaQNsRBFf/1r7delffxgl0pRy1cddI1RxBxK+Czt0ltwScncKrIZenOI
 bYx6B4XVzmjcUGJ63aPxOY7EsnY2FIUSrbGpZBiyckc9SbJPALOA4GQpY
 eH6IIiUzvm8D65lRaaotQN3OJDfwiT2VGPUt86y11C+74AqpUKiN63RX2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="359946776"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="359946776"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 07:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="976085508"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="976085508"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 07:44:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 07:44:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 07:44:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 07:44:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 07:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGPIPq/W7+X8qbu4tTTYrkioaHXjyzx9ll1ElLZXUkaa9kBfsYfU9Idg7PFvI/GpS60Hjd9GRxFjnKFhCD5zBhESE6HP0jVJipjNU7pLfxJHYbNS/stQDA1wMrbFMho5FQyPs2082gb4Ttytv+G5iOHzJTweIGgcMkrxXHKLURdMCBzelKMgJVArFjf29Bi0jIrfcC0HCrciRAOxG4LqzKm9UEm1VYGXvwLY5EDySrTOpm+mOLREYYTvY+M+C6h6a+EDovzYixpdYc6ABlEDxxd/mU9gAsgFAl8KfsOBvtCt/Hf+DnZ2+VsvQPvNXNpK7wnQejNDeY0tsrjFFRHOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXn0V+ezOLkS/cz804URh4l454k25nojvHuP0rG3S5g=;
 b=O0FwtyADTfLrJ+NxGlOh9SxTqePdBSerqXG0uqmW6F2fqSFv+niwE9d13VWSQyktOWSCF+jB3A/Mqr6ymbMMj3FlVhcD6bLf2AuR+iXa8nqW416++04vrumBR4Z1u4ryorVijesukaLLiwNgVAUUdnP+gsG4nnEWwbZEdX2lg8LDWMbMnzTIrBp4W+Vlw9XQZqApMiSAIS9otug1w3uGMDK8xNJfwBE0qy9rrO0V2N6rHxTJc+GBgZYH9zPMJlc0PUnUVgSNg8SVRqBzFgH+ZVVFuDG6yWX223USWJOrF44/lBQhJLR2bB/XGGUIFTxQYnGDR0MjBw/qzffj2dduGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM8PR11MB5685.namprd11.prod.outlook.com (2603:10b6:8:20::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 14:44:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 14:44:02 +0000
Date: Thu, 3 Aug 2023 14:43:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/8] drm/sched: Convert drm scheduler to use a work queue
 rather than kthread
Message-ID: <ZMu9AIygJb7U9IXr@DUT025-TGLU.fm.intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-2-matthew.brost@intel.com>
 <1ac4423c-42cd-490d-245b-bf81ef26900d@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1ac4423c-42cd-490d-245b-bf81ef26900d@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM8PR11MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: f51e3cda-511d-491b-f031-08db9430143a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0J+5qJfGEiY+za43rTaFdiIYaKS0PKX3VhYsqO1zbFrY0I/rLVzeOlOeusyvCNok9CIIuPE5qIZGS5AliGQZL7pteU9dcCp02m9pDJfHvO4lUaPgSTiHGGGuW8NQiIKYUrhOwm/SO2dc0Q6Zv6jyXjRf/3EpAQJexA5Fd03y8ZMHyiqHmiUX1Ga2fyVseAE3lirExOF5PLkqD/cWqh4q5IQoy9uDYbqAQCsrbuK9jL3DR3ArFeIusYsluHSxwPVEGiGDDyDEwH0xDuUdguJUEZYA6CTQGQ6ty//eOIdzn4iG7YlmHRD634CqW+3SboT39C+8eGep9uLA/AH/TGN+k2J2G32exhazDb5yRZ9XMYXvs/dcLHQYiarv4q3gd7hcRrjrIcwKev+wWQBGZQ6B1tL8D7YPkVqLUaIEcbaepuiyabU9IAx0DXSxPo6gJZZYKXoDJFdryoN0jH0YRBULgIeGeEXcXM3EwfJSGu5rexygC1d811uMZ+M7Tb8qXsdctHXWfb0UJY0FAvMUtNT3YtzKdewqJuoI0iOxih+Dehwnu+rOaTcyYPHy0H61RAr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(30864003)(66556008)(41300700001)(6916009)(316002)(2906002)(66946007)(4326008)(66476007)(44832011)(8936002)(8676002)(5660300002)(82960400001)(26005)(53546011)(186003)(6506007)(86362001)(83380400001)(38100700002)(478600001)(6512007)(6486002)(6666004)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zYEL8A9a/OIpXaqwPB72VC681FxskNcl791Ji1F/FvvXfSQHfHhiAluYN+JK?=
 =?us-ascii?Q?Pcez32fHm3miN7dgsErUdOo2coQYtm8i/OOKN7LTO2qrQM8unDcyOA8VySCq?=
 =?us-ascii?Q?Tf9UYwLcQ6zn/Otk6ZpNuaf5jA05/159a48M9jZIyOUcO9QEMhVz7UQUoMNO?=
 =?us-ascii?Q?Q96GUgjTQMD9IBysqGQBUY7mhUNQhM0id8WeqWwaKT7wEEAxuCcS2H02Jw+V?=
 =?us-ascii?Q?GHXbsdXUhJUBXHStcwukYbMKDePyTyCTCQ0NALJOlXaLQQwvaq9/3OtOVyke?=
 =?us-ascii?Q?MshyaTYPrfzr7TemqFyPRPrVvwyXXzv+AjJ0cQ1Re7uGzSpgwToAfZQ8MPA/?=
 =?us-ascii?Q?Gx+85zCf7EVszfAf2GjsJKE9ZZw2Ir8Kblxu5QvA5Hf7IcVHMDxhgf5ipxA3?=
 =?us-ascii?Q?qhRTQJNUn8vXijNaR9OCh9G1o5cav4tkmZu+DxkuvMU6VWh6Lnp8defTpcY7?=
 =?us-ascii?Q?GPt6mrV2gZFkF7t8MQP2A2hcfyQ/5/1NQGp/IbpqdGHbq6fldgKrPKKZ19yi?=
 =?us-ascii?Q?icd1M2BMzWNmCZqB4mfohz79vgpY22yW2oLSUDGfJNs4Qzd6c5e24FvJawez?=
 =?us-ascii?Q?915OUXHd8pj/CwsYUsEkaU+8C6CpUYpSl30Jlp3d49jtNDrOdTrKIcSWdpvD?=
 =?us-ascii?Q?uxvJYmBvCQCJgW/EM9SPfxdaYfS13DQFZY7OptIUMVH9RQRWr+Vq9kIu4D6N?=
 =?us-ascii?Q?ZxSu+vBqNvXxqqWD8xZnUS03WnLT1nsheZPSuFL9+c6fVSZTEnJN1EwEwpZs?=
 =?us-ascii?Q?U26m8DSbbEiY4B8N7qDLQceqgwbSn/itNoQSRINPfefMk0vXSwZccC26IkVB?=
 =?us-ascii?Q?cWhjAlpB0L9TydY4FL06MtSV0i2GcYcf4+D3cvxRSoPjZ5blgnuthoXHhs2M?=
 =?us-ascii?Q?0Hw4+gm287iB49sP4/Aj+MklGteMtpquQo0FH0E8twgtFM4g0dncajh1NlVP?=
 =?us-ascii?Q?n1VfSfL4dNVKkey+zH2Q6oCZu/tFQdnavkb7REHNbXyL252O9bGrXK2Xas8S?=
 =?us-ascii?Q?ydDSba+H2AlVZWte3WmQFGAERRh/iKbAq6fruKly5dRh+bL550jcZU7GkBU4?=
 =?us-ascii?Q?M6OyGxYa05ICq1aj0/EKnkuTbBmCGII1xVVM7/sOxv6r2eEl9IE+w54/lqT3?=
 =?us-ascii?Q?p3Gpm1WeF+jjs5+qzYFrzRB4E2QYsMQTKsYCm6DA4omfZ/Zu2k2ponZGk0Yk?=
 =?us-ascii?Q?nTC4lXTTG5hR7fqHL5HjyFz1uwCJ7beKLKhQjyNxrmkGh6YvBZQqcGFWcbzj?=
 =?us-ascii?Q?Us6AWw9l7NoXfl/kNl8UoBCtLJs6XIhx33H/AMaSK2uF7Uf1bQ6bvKRmOydn?=
 =?us-ascii?Q?ERD/tUYAyoNf7W5QwgeB1+/yjKci/Ky9Lmp0cn01k71WNQexZTQ8aPU9TLRE?=
 =?us-ascii?Q?I9OD8456lnNFj9k7WI0MQ6ASN1e4tfJ/N19vQlQG2siTlkY3xf0466UBy7ye?=
 =?us-ascii?Q?x1TW4iYOZowSrcNL/3win70F93FE8ze3zPawcLsseY9+2gGRID4oczk0k96b?=
 =?us-ascii?Q?+xcSQIlkKUMb7IX22ZW3KxagYc5i051jbzPY+hOdhD0ZN1F10F8Ox3asCy7f?=
 =?us-ascii?Q?O0wSXRJOs0Cwjry0QuPEt7pnPrjWK3KU3Pd9hTdvSY3Mf9NXpF5qAXMWwW6j?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f51e3cda-511d-491b-f031-08db9430143a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 14:44:02.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMPej8r/MysSQUDW5FGfCyXRz4BVSdKlJOBuGh8F6PJ9ryoFQH4HRbC7YEiZ3ULtCW4t6YJarIhQX6Elf+esOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5685
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

On Thu, Aug 03, 2023 at 11:11:13AM +0100, Tvrtko Ursulin wrote:
> 
> On 01/08/2023 21:50, Matthew Brost wrote:
> > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> > seems a bit odd but let us explain the reasoning below.
> > 
> > 1. In XE the submission order from multiple drm_sched_entity is not
> > guaranteed to be the same completion even if targeting the same hardware
> > engine. This is because in XE we have a firmware scheduler, the GuC,
> > which allowed to reorder, timeslice, and preempt submissions. If a using
> > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> > apart as the TDR expects submission order == completion order. Using a
> > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> > 
> > 2. In XE submissions are done via programming a ring buffer (circular
> > buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> > limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> > control on the ring for free.
> > 
> > A problem with this design is currently a drm_gpu_scheduler uses a
> > kthread for submission / job cleanup. This doesn't scale if a large
> > number of drm_gpu_scheduler are used. To work around the scaling issue,
> > use a worker rather than kthread for submission / job cleanup.
> > 
> > v2:
> >    - (Rob Clark) Fix msm build
> >    - Pass in run work queue
> > v3:
> >    - (Boris) don't have loop in worker
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  14 +-
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   2 +-
> >   drivers/gpu/drm/lima/lima_sched.c           |   2 +-
> >   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c        |   2 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c     |   2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c      | 136 +++++++++++---------
> >   drivers/gpu/drm/v3d/v3d_sched.c             |  10 +-
> >   include/drm/gpu_scheduler.h                 |  14 +-
> >   10 files changed, 113 insertions(+), 89 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > index f60753f97ac5..9c2a10aeb0b3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > @@ -1489,9 +1489,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
> >   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
> >   		struct amdgpu_ring *ring = adev->rings[i];
> > -		if (!ring || !ring->sched.thread)
> > +		if (!ring || !ring->sched.ready)
> >   			continue;
> > -		kthread_park(ring->sched.thread);
> > +		drm_sched_run_wq_stop(&ring->sched);
> 
> It would be good to split out adding of these wrappers (including adding one
> for ring->sched.thread/ready) to a standalong preceding patch. That way at
> least some mechanical changes to various drivers would be separated from
> functional changes.
>

Sure.
 
> Also, perhaps do not have the wq in the name if it is not really needed to
> be verbose with the underlying implementation like that? Like would
> drm_sched_run/pause. Or even __drm_sched_start/stop, dunno, just an idea.
>

Sure.
 
> >   	}
> >   	seq_printf(m, "run ib test:\n");
> > @@ -1505,9 +1505,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
> >   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
> >   		struct amdgpu_ring *ring = adev->rings[i];
> > -		if (!ring || !ring->sched.thread)
> > +		if (!ring || !ring->sched.ready)
> >   			continue;
> > -		kthread_unpark(ring->sched.thread);
> > +		drm_sched_run_wq_start(&ring->sched);
> >   	}
> >   	up_write(&adev->reset_domain->sem);
> > @@ -1727,7 +1727,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
> >   	ring = adev->rings[val];
> > -	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
> > +	if (!ring || !ring->funcs->preempt_ib || !ring->sched.ready)
> >   		return -EINVAL;
> >   	/* the last preemption failed */
> > @@ -1745,7 +1745,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
> >   		goto pro_end;
> >   	/* stop the scheduler */
> > -	kthread_park(ring->sched.thread);
> > +	drm_sched_run_wq_stop(&ring->sched);
> >   	/* preempt the IB */
> >   	r = amdgpu_ring_preempt_ib(ring);
> > @@ -1779,7 +1779,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
> >   failure:
> >   	/* restart the scheduler */
> > -	kthread_unpark(ring->sched.thread);
> > +	drm_sched_run_wq_start(&ring->sched);
> >   	up_read(&adev->reset_domain->sem);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index fac9312b1695..00c9c03c8f94 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2364,7 +2364,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >   			break;
> >   		}
> > -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> > +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> >   				   ring->num_hw_submission, amdgpu_job_hang_limit,
> >   				   timeout, adev->reset_domain->wq,
> >   				   ring->sched_score, ring->name,
> > @@ -4627,7 +4627,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
> >   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >   		struct amdgpu_ring *ring = adev->rings[i];
> > -		if (!ring || !ring->sched.thread)
> > +		if (!ring || !ring->sched.ready)
> >   			continue;
> >   		spin_lock(&ring->sched.job_list_lock);
> > @@ -4753,7 +4753,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
> >   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >   		struct amdgpu_ring *ring = adev->rings[i];
> > -		if (!ring || !ring->sched.thread)
> > +		if (!ring || !ring->sched.ready)
> >   			continue;
> >   		/*clear job fence from fence drv to avoid force_completion
> > @@ -5294,7 +5294,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> >   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >   			struct amdgpu_ring *ring = tmp_adev->rings[i];
> > -			if (!ring || !ring->sched.thread)
> > +			if (!ring || !ring->sched.ready)
> >   				continue;
> >   			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
> > @@ -5369,7 +5369,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> >   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >   			struct amdgpu_ring *ring = tmp_adev->rings[i];
> > -			if (!ring || !ring->sched.thread)
> > +			if (!ring || !ring->sched.ready)
> >   				continue;
> >   			drm_sched_start(&ring->sched, true);
> > @@ -5696,7 +5696,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
> >   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >   			struct amdgpu_ring *ring = adev->rings[i];
> > -			if (!ring || !ring->sched.thread)
> > +			if (!ring || !ring->sched.ready)
> >   				continue;
> >   			drm_sched_stop(&ring->sched, NULL);
> > @@ -5824,7 +5824,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
> >   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >   		struct amdgpu_ring *ring = adev->rings[i];
> > -		if (!ring || !ring->sched.thread)
> > +		if (!ring || !ring->sched.ready)
> >   			continue;
> >   		drm_sched_start(&ring->sched, true);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 1ae87dfd19c4..8486a2923f1b 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -133,7 +133,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >   {
> >   	int ret;
> > -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >   			     msecs_to_jiffies(500), NULL, NULL,
> >   			     dev_name(gpu->dev), gpu->dev);
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index ff003403fbbc..54f53bece27c 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> > -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> > +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >   			      lima_job_hang_limit,
> >   			      msecs_to_jiffies(timeout), NULL,
> >   			      NULL, name, pipe->ldev->dev);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index c5c4c93b3689..f76ce11a5384 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -662,7 +662,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
> >   	 */
> >   	for (i = 0; i < gpu->nr_rings; i++) {
> >   		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> > -		kthread_park(sched->thread);
> > +
> > +		drm_sched_run_wq_stop(sched);
> >   	}
> >   }
> > @@ -672,7 +673,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
> >   	for (i = 0; i < gpu->nr_rings; i++) {
> >   		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> > -		kthread_unpark(sched->thread);
> > +
> > +		drm_sched_run_wq_start(sched);
> >   	}
> >   }
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index 57a8e9564540..5879fc262047 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -95,7 +95,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >   	 /* currently managing hangcheck ourselves: */
> >   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> > -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> > +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >   			num_hw_submissions, 0, sched_timeout,
> >   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> >   	if (ret) {
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index dbc597ab46fb..f48b07056a16 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -815,7 +815,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >   		js->queue[j].fence_context = dma_fence_context_alloc(1);
> >   		ret = drm_sched_init(&js->queue[j].sched,
> > -				     &panfrost_sched_ops,
> > +				     &panfrost_sched_ops, NULL,
> >   				     nentries, 0,
> >   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >   				     pfdev->reset.wq,
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index a18c8f5e8cc0..c3eed9e8062a 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -44,7 +44,6 @@
> >    * The jobs in a entity are always scheduled in the order that they were pushed.
> >    */
> > -#include <linux/kthread.h>
> >   #include <linux/wait.h>
> >   #include <linux/sched.h>
> >   #include <linux/completion.h>
> > @@ -252,6 +251,47 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >   	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> >   }
> > +/**
> > + * drm_sched_run_wq_stop - stop scheduler run worker
> > + *
> > + * @sched: scheduler instance to stop run worker
> > + */
> > +void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched)
> > +{
> > +	WRITE_ONCE(sched->pause_run_wq, true);
> > +	cancel_work_sync(&sched->work_run);
> > +}
> > +EXPORT_SYMBOL(drm_sched_run_wq_stop);
> > +
> > +/**
> > + * drm_sched_run_wq_start - start scheduler run worker
> > + *
> > + * @sched: scheduler instance to start run worker
> > + */
> > +void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched)
> > +{
> > +	WRITE_ONCE(sched->pause_run_wq, false);
> > +	queue_work(sched->run_wq, &sched->work_run);
> > +}
> > +EXPORT_SYMBOL(drm_sched_run_wq_start);
> > +
> > +/**
> > + * drm_sched_run_wq_queue - queue scheduler run worker
> > + *
> > + * @sched: scheduler instance to queue run worker
> > + */
> > +static void drm_sched_run_wq_queue(struct drm_gpu_scheduler *sched)
> > +{
> > +	/*
> > +	 * Try not to schedule work if pause_run_wq set but not the end of world
> > +	 * if we do as either it will be cancelled by the above
> > +	 * cancel_work_sync, or drm_sched_main turns into a NOP while
> > +	 * pause_run_wq is set.
> > +	 */
> > +	if (!READ_ONCE(sched->pause_run_wq))
> > +		queue_work(sched->run_wq, &sched->work_run);
> > +}
> > +
> >   /**
> >    * drm_sched_job_done - complete a job
> >    * @s_job: pointer to the job which is done
> > @@ -271,7 +311,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
> >   	dma_fence_get(&s_fence->finished);
> >   	drm_sched_fence_finished(s_fence);
> >   	dma_fence_put(&s_fence->finished);
> > -	wake_up_interruptible(&sched->wake_up_worker);
> > +	drm_sched_run_wq_queue(sched);
> >   }
> >   /**
> > @@ -434,7 +474,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >   {
> >   	struct drm_sched_job *s_job, *tmp;
> > -	kthread_park(sched->thread);
> > +	drm_sched_run_wq_stop(sched);
> >   	/*
> >   	 * Reinsert back the bad job here - now it's safe as
> > @@ -547,7 +587,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> >   		spin_unlock(&sched->job_list_lock);
> >   	}
> > -	kthread_unpark(sched->thread);
> > +	drm_sched_run_wq_start(sched);
> >   }
> >   EXPORT_SYMBOL(drm_sched_start);
> > @@ -864,7 +904,7 @@ static bool drm_sched_ready(struct drm_gpu_scheduler *sched)
> >   void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
> >   {
> >   	if (drm_sched_ready(sched))
> > -		wake_up_interruptible(&sched->wake_up_worker);
> > +		drm_sched_run_wq_queue(sched);
> >   }
> >   /**
> > @@ -974,61 +1014,42 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> >   }
> >   EXPORT_SYMBOL(drm_sched_pick_best);
> > -/**
> > - * drm_sched_blocked - check if the scheduler is blocked
> > - *
> > - * @sched: scheduler instance
> > - *
> > - * Returns true if blocked, otherwise false.
> > - */
> > -static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
> > -{
> > -	if (kthread_should_park()) {
> > -		kthread_parkme();
> > -		return true;
> > -	}
> > -
> > -	return false;
> > -}
> > -
> >   /**
> >    * drm_sched_main - main scheduler thread
> >    *
> >    * @param: scheduler instance
> > - *
> > - * Returns 0.
> >    */
> > -static int drm_sched_main(void *param)
> > +static void drm_sched_main(struct work_struct *w)
> >   {
> > -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> > +	struct drm_gpu_scheduler *sched =
> > +		container_of(w, struct drm_gpu_scheduler, work_run);
> > +	struct drm_sched_entity *entity;
> > +	struct drm_sched_job *cleanup_job;
> >   	int r;
> > -	sched_set_fifo_low(current);
> > +	if (READ_ONCE(sched->pause_run_wq))
> > +		return;
> 
> Is there a point to this check given the comment in drm_sched_run_wq_queue?
> 

I think so.

> > -	while (!kthread_should_stop()) {
> > -		struct drm_sched_entity *entity = NULL;
> > -		struct drm_sched_fence *s_fence;
> > -		struct drm_sched_job *sched_job;
> > -		struct dma_fence *fence;
> > -		struct drm_sched_job *cleanup_job = NULL;
> > +	cleanup_job = drm_sched_get_cleanup_job(sched);
> > +	entity = drm_sched_select_entity(sched);
> > -		wait_event_interruptible(sched->wake_up_worker,
> > -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
> > -					 (!drm_sched_blocked(sched) &&
> > -					  (entity = drm_sched_select_entity(sched))) ||
> > -					 kthread_should_stop());
> > +	if (!entity && !cleanup_job)
> > +		return;	/* No more work */
> > -		if (cleanup_job)
> > -			sched->ops->free_job(cleanup_job);
> > +	if (cleanup_job)
> > +		sched->ops->free_job(cleanup_job);
> > -		if (!entity)
> > -			continue;
> > +	if (entity) {
> > +		struct dma_fence *fence;
> > +		struct drm_sched_fence *s_fence;
> > +		struct drm_sched_job *sched_job;
> >   		sched_job = drm_sched_entity_pop_job(entity);
> > -
> >   		if (!sched_job) {
> >   			complete_all(&entity->entity_idle);
> > -			continue;
> > +			if (!cleanup_job)
> > +				return;	/* No more work */
> > +			goto again;
> 
> Loop is gone but now it re-arms itself which is needed to avoid starvation?
> Is it guaranteed to be effective by the wq contract?
>

Yea.
 
> >   		}
> >   		s_fence = sched_job->s_fence;
> > @@ -1055,14 +1076,17 @@ static int drm_sched_main(void *param)
> >   					  r);
> >   		} else {
> >   			if (IS_ERR(fence))
> > -				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
> > +				dma_fence_set_error(&s_fence->finished,
> > +						    PTR_ERR(fence));
> >   			drm_sched_job_done(sched_job);
> >   		}
> >   		wake_up(&sched->job_scheduled);
> >   	}
> > -	return 0;
> > +
> > +again:
> > +	drm_sched_run_wq_queue(sched);
> >   }
> >   /**
> > @@ -1070,6 +1094,7 @@ static int drm_sched_main(void *param)
> >    *
> >    * @sched: scheduler instance
> >    * @ops: backend operations for this scheduler
> > + * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
> >    * @hw_submission: number of hw submissions that can be in flight
> >    * @hang_limit: number of times to allow a job to hang before dropping it
> >    * @timeout: timeout value in jiffies for the scheduler
> > @@ -1083,14 +1108,16 @@ static int drm_sched_main(void *param)
> >    */
> >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *run_wq,
> >   		   unsigned hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> >   		   atomic_t *score, const char *name, struct device *dev)
> >   {
> > -	int i, ret;
> > +	int i;
> >   	sched->ops = ops;
> >   	sched->hw_submission_limit = hw_submission;
> >   	sched->name = name;
> > +	sched->run_wq = run_wq ? : system_wq;
> 
> I still think it is not nice to implicitly move everyone over to the shared
> system wq. Maybe even more so with now one at a time execution, since effect
> on latency can be even greater.
>

No one that has a stake in this has pushed back that I can recall. Open
to feedback stakeholders (maintainers of drivers that use the drm
scheduler). The i915 doesn't use the DRM scheduler last time I looked.
Has that changed?
 
> Have you considered kthread_work as a backend? Maybe it would work to have
> callers pass in a kthread_worker they create, or provide a drm_sched helper
> to create one, which would then be passed to drm_sched_init.
>
> That would enable per driver kthread_worker, or per device, or whatever
> granularity each driver would want/need/desire.
> 
> driver init:
> struct drm_sched_worker = drm_sched_create_worker(...);
> 
> queue/whatever init:
> drm_sched_init(.., worker, ...);
>

This idea doesn't seem to work for varitey of reasons. Will type it out
if needed but not going to spend time on this unless someone with a
stake raises this as an issue.
 
> You could create one inside drm_sched_init if not passed in, which would
> keep the behaviour for existing drivers more similar - they would still have
> a 1:1 kthread context for their exclusive use.
> 

Part of the idea of a work queue is so a user can't directly create a
kthread via an IOCTL (XE_EXEC_QUEUE_CREATE). What you suggesting exposes
this issue.

> And I *think* self-re-arming would be less problematic latency wise since
> kthread_worker consumes everything queued without relinquishing control and
> execution context would be guaranteed not to be shared with random system
> stuff.
> 

So this is essentially so we can use a loop? Seems like a lot effort for
what is pure speculation. Again if a stakeholder raises an issue we can
address then.

Matt

> Regards,
> 
> Tvrtko
> 
> >   	sched->timeout = timeout;
> >   	sched->timeout_wq = timeout_wq ? : system_wq;
> >   	sched->hang_limit = hang_limit;
> > @@ -1099,23 +1126,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >   		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> > -	init_waitqueue_head(&sched->wake_up_worker);
> >   	init_waitqueue_head(&sched->job_scheduled);
> >   	INIT_LIST_HEAD(&sched->pending_list);
> >   	spin_lock_init(&sched->job_list_lock);
> >   	atomic_set(&sched->hw_rq_count, 0);
> >   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > +	INIT_WORK(&sched->work_run, drm_sched_main);
> >   	atomic_set(&sched->_score, 0);
> >   	atomic64_set(&sched->job_id_count, 0);
> > -
> > -	/* Each scheduler will run on a seperate kernel thread */
> > -	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
> > -	if (IS_ERR(sched->thread)) {
> > -		ret = PTR_ERR(sched->thread);
> > -		sched->thread = NULL;
> > -		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
> > -		return ret;
> > -	}
> > +	sched->pause_run_wq = false;
> >   	sched->ready = true;
> >   	return 0;
> > @@ -1134,8 +1153,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >   	struct drm_sched_entity *s_entity;
> >   	int i;
> > -	if (sched->thread)
> > -		kthread_stop(sched->thread);
> > +	drm_sched_run_wq_stop(sched);
> >   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >   		struct drm_sched_rq *rq = &sched->sched_rq[i];
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 06238e6d7f5c..38e092ea41e6 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   	int ret;
> >   	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > -			     &v3d_bin_sched_ops,
> > +			     &v3d_bin_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> >   			     NULL, "v3d_bin", v3d->drm.dev);
> > @@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   		return ret;
> >   	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > -			     &v3d_render_sched_ops,
> > +			     &v3d_render_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> >   			     NULL, "v3d_render", v3d->drm.dev);
> > @@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   		goto fail;
> >   	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > -			     &v3d_tfu_sched_ops,
> > +			     &v3d_tfu_sched_ops, NULL,
> >   			     hw_jobs_limit, job_hang_limit,
> >   			     msecs_to_jiffies(hang_limit_ms), NULL,
> >   			     NULL, "v3d_tfu", v3d->drm.dev);
> > @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   	if (v3d_has_csd(v3d)) {
> >   		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > -				     &v3d_csd_sched_ops,
> > +				     &v3d_csd_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> >   				     NULL, "v3d_csd", v3d->drm.dev);
> > @@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >   			goto fail;
> >   		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> > -				     &v3d_cache_clean_sched_ops,
> > +				     &v3d_cache_clean_sched_ops, NULL,
> >   				     hw_jobs_limit, job_hang_limit,
> >   				     msecs_to_jiffies(hang_limit_ms), NULL,
> >   				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index c0586d832260..98fb5f85eba6 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -473,17 +473,16 @@ struct drm_sched_backend_ops {
> >    * @timeout: the time after which a job is removed from the scheduler.
> >    * @name: name of the ring for which this scheduler is being used.
> >    * @sched_rq: priority wise array of run queues.
> > - * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
> > - *                  is ready to be scheduled.
> >    * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
> >    *                 waits on this wait queue until all the scheduled jobs are
> >    *                 finished.
> >    * @hw_rq_count: the number of jobs currently in the hardware queue.
> >    * @job_id_count: used to assign unique id to the each job.
> > + * @run_wq: workqueue used to queue @work_run
> >    * @timeout_wq: workqueue used to queue @work_tdr
> > + * @work_run: schedules jobs and cleans up entities
> >    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> >    *            timeout interval is over.
> > - * @thread: the kthread on which the scheduler which run.
> >    * @pending_list: the list of jobs which are currently in the job queue.
> >    * @job_list_lock: lock to protect the pending_list.
> >    * @hang_limit: once the hangs by a job crosses this limit then it is marked
> > @@ -492,6 +491,7 @@ struct drm_sched_backend_ops {
> >    * @_score: score used when the driver doesn't provide one
> >    * @ready: marks if the underlying HW is ready to work
> >    * @free_guilty: A hit to time out handler to free the guilty job.
> > + * @pause_run_wq: pause queuing of @work_run on @run_wq
> >    * @dev: system &struct device
> >    *
> >    * One scheduler is implemented for each hardware ring.
> > @@ -502,13 +502,13 @@ struct drm_gpu_scheduler {
> >   	long				timeout;
> >   	const char			*name;
> >   	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
> > -	wait_queue_head_t		wake_up_worker;
> >   	wait_queue_head_t		job_scheduled;
> >   	atomic_t			hw_rq_count;
> >   	atomic64_t			job_id_count;
> > +	struct workqueue_struct		*run_wq;
> >   	struct workqueue_struct		*timeout_wq;
> > +	struct work_struct		work_run;
> >   	struct delayed_work		work_tdr;
> > -	struct task_struct		*thread;
> >   	struct list_head		pending_list;
> >   	spinlock_t			job_list_lock;
> >   	int				hang_limit;
> > @@ -516,11 +516,13 @@ struct drm_gpu_scheduler {
> >   	atomic_t                        _score;
> >   	bool				ready;
> >   	bool				free_guilty;
> > +	bool				pause_run_wq;
> >   	struct device			*dev;
> >   };
> >   int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *run_wq,
> >   		   uint32_t hw_submission, unsigned hang_limit,
> >   		   long timeout, struct workqueue_struct *timeout_wq,
> >   		   atomic_t *score, const char *name, struct device *dev);
> > @@ -550,6 +552,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >   void drm_sched_job_cleanup(struct drm_sched_job *job);
> >   void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > +void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
> > +void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
> >   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> >   void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
> >   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
