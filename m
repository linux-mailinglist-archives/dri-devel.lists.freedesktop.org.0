Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F169F658749
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 23:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1010E22A;
	Wed, 28 Dec 2022 22:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD8110E223;
 Wed, 28 Dec 2022 22:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672266109; x=1703802109;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ocF7WDoSn9rr0vXLwJldg8J1Ze8SnIC5leN+AaXMGS0=;
 b=JpaZHVe/MopS8mWMkobG2iN9ksnISHvNvsIDW4KVZzZV9GdH/Ilxqqdd
 TbADNxFMohDYckjZoaCBGuic3tlkKVFEd4LlN8GvfPQdAlV/wlHAAAs2e
 ZoSSfrygw6MqNHOg71MCi1WAdrw5nlnxEvrbx8kNEHX4H9XuHPxht4972
 oZjXWj14NaAmT/6RkVqd62W6eQwXWr87O+wraa4tUNlFSbn7FbYEr7XyQ
 f5r/CkvUdMRD2F7n6QVZbVsBSREBv8U1eZ5sbU7lXNisAyHxWA/wT/MOg
 yti06f32oCmC6qo7RqaqdOR+DLobRu3WT7/io9zmw90PNlxx5jNaxMj7/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="319659045"
X-IronPort-AV: E=Sophos;i="5.96,282,1665471600"; d="scan'208";a="319659045"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2022 14:21:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="982190503"
X-IronPort-AV: E=Sophos;i="5.96,282,1665471600"; d="scan'208";a="982190503"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 28 Dec 2022 14:21:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 28 Dec 2022 14:21:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 28 Dec 2022 14:21:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 28 Dec 2022 14:21:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbMJ5NpAJWBX6ucuEsLB76fIF5JWg9wpdc2IFcQLTD3XyVLWPnTGGNjhWRDOd6F9ysCnw1xa2VJDeqiTQ05H4vQWOhKN0sZa809hdvjH0Yx4RzzCMlL1jVnKPz2LsV8tbcCblgtQc3hqiDjIsjYmXqa+07Du6LJu62TD1eR6/KsNuH800RfnEudmjVGVpcABltUgxztPoCG3cDGCOU7l+aHscBbzOnhYSK8HXFRpxm+icJn4Iz081+UPcReiCfhOhjukkP2h2TeTRrMSo2QbDq1EFLHSY8yN4jcgaHwdfCwvVpUTRByTBNhdCH4UQetUb/EM9ydKBvfeMUkM9cfj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhfhuyUxkDtS1WTk5DU66+sXVB89AHL4jR9ESozdYLw=;
 b=j2Sh59eKS/VlhEsWuCXN6jFKO6Ta0mB701tHJQ8UVVp4S2PL5N03/owRkxAkZQrkChBKNQBBehYvm3OGB7UWgzYF/6YK+33I+ZjQmuXSbRHhcZnMr6T6RJ/NliGxsNrx0ckIMiQARfoHym40sUkC0oPTxyzLuV1uxyFGjmK3NH0NdgPjSgQaZHPd4Er0aR8t60eSemQVGVMTisT5ObXMk6NOsu9Z01FGF8f6kGMyu3FGuL8ve5XN2gvpRV+r5jrsQIkXaPW8F95hLYRThMEoI3HzAh18ApX+2mSNuPXgEy/PXIo+/KUNFIMIFtiYbcoW/KQeHeirpZ9v8gTSGGS4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 22:21:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::31b8:f03e:e818:7835]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::31b8:f03e:e818:7835%3]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 22:21:45 +0000
Date: Wed, 28 Dec 2022 22:21:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y6zBW7qlEwIxYywk@DUT025-TGLU.fm.intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <CAF6AEGvin1x1xW4GWVtP+exiDeza5EWcChDURgX-9mcqbs8APw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAF6AEGvin1x1xW4GWVtP+exiDeza5EWcChDURgX-9mcqbs8APw@mail.gmail.com>
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 491051c2-5191-4abd-1d76-08dae921e781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJon2Un5yFlmKgyZQJ+tG4eat5QKhQp+EDbfXpxcK1ACou4AaNQJFW4Npn7H7Ky1mNzKBHayiAR5gS+AT0S9C2nF2+8ZfPtEkrFVeo/bf11ZVGfGkCtidBMOCpyPsHtpq13AW+LkYHPp5ewc2l/Pft9b2mT7P3ZINz6qXZbABlYv3658YglNFJd1QVS8tHdLcrVgYioPPWilKedz3R7vQ3AArYavvmGjol38NkSl7FjIzvGuGAsglRHTdKvQB7V66Bwq0i5UvCU+iybg9KFjrSskyp2eRj4bbq3T3tc53UDCY7RdPloKCSyBthkXBtVZnQbimmEYTYFhDWdJbr83af8jNpt5PJgc7Xq1zt4B5J6cIAR9eSybzVeyluW2jJng2bpPpeF/0TTnRft7OjY7UiwTTlYJcwcf0zJFeYGsNBXYX2l8Wv9H4TrDXa6uT149jjw3GbyYZSsyPCco8nnPngJqk0/Gxo4GXgd2ag6iZEWaXg8XQPpNlbWyIztqiiRO9zfWv4JQbSlc6/4xrZGHPEeqrDbsFBdsruZWm9ncbPIb+6+oyiWr0zDroxoBjsT2xseijkWopeQmRxKFBpfUSfJ2TfgNWX6yZoLvJWJAhQoxYk11u61tKPVXZNvvV9XX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199015)(41300700001)(6666004)(6506007)(53546011)(186003)(6512007)(26005)(2906002)(6486002)(30864003)(8936002)(5660300002)(316002)(478600001)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(44832011)(6916009)(82960400001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IcJ/xhcpFu0f5qfD+zKzqegrkeN3pruNhzo4u9KmQitqZSR+X7/qOihLlbyr?=
 =?us-ascii?Q?nufpem/wyx0mUgsomWBw5ujRoek/3rq+8M2aSjU5pzaC3JXS/R2W/Z2uYoR8?=
 =?us-ascii?Q?jXyORRGlU/vcW/elxqV93yDwxMWSay8GGvQIUt9xzE9G7sBxhG9R8nME792b?=
 =?us-ascii?Q?WiUpa9esRJ3U3uuuZA4f0oudxBZ//8Udb9exgxKYAMor+YZKsyzUfu9pVKRp?=
 =?us-ascii?Q?oJ+02IHqo68xyFNhTdoH2kYpFBIUo1lHMue8Do+gjJ/T5hoKHaYgmzznBy4C?=
 =?us-ascii?Q?TazaID3NjnxAQv2x+S0Ov3xBf/bmL7cByT0FpYvSTbheSEpqCetTjT+MvqwX?=
 =?us-ascii?Q?P24P7c1v/K0aktaL7mktEUdWVdZEaHHC2aybB7LUg9nLPhK0N15zNZlw2vqn?=
 =?us-ascii?Q?RSZ4Z0M5zjvT2310u54jBAo4XrI4YSgScWD/sylvOOpvBwu06c5YJkpNlEPY?=
 =?us-ascii?Q?d5g8/bWr9kSoA/qg/UNk6gRPjbpQ16TEHa6xMAVb9xC+npCwBS0hCgUjJczN?=
 =?us-ascii?Q?vv6IgtWx/HCaAXTYO0JZMvqZ7eT7IWEU0OOR+UsOWrT0JkpUtG5sTs0mwQ0W?=
 =?us-ascii?Q?KH1sAjKcyQ/ZRPx+Qx+VXvs+7n4DYtDdPnUd+jANArqrcjb2FwZxpZEPtx/w?=
 =?us-ascii?Q?RA0jMHj0jzQwaD2uhnVIo080bkCy8kQ3zPoGHVnxgiy8KtSZwz4wxqbHeXx/?=
 =?us-ascii?Q?z1LmcK+2Zj0dEVxgny+xv0M6YA3Vzi5zekOfotHJiIIgKSVyZS48kVzwOfEm?=
 =?us-ascii?Q?pf6Su+6IfzumsCF/yukd00X3esDx5GFMtmCfFAbGv3rgCHyQNBkO+tulw+qm?=
 =?us-ascii?Q?im0vyfTdQuSyt3Vu61GGgOU87C1TH3zLj4CEdSuTpvjB9FlkYVlJbqGEiyEy?=
 =?us-ascii?Q?15K9ciMyNuaa0JmssVZeewupuyn5hgn29JAl0ElawPpnqE3AZNbiiC3ulTAf?=
 =?us-ascii?Q?qw8BhxNGg0xZLJidejEibQ6nlR4YBKoPidqBgEDRM+QITn8iXjthCHMprTlb?=
 =?us-ascii?Q?f0WhgEB79vCGTZQhI8ah8c2OWuTdvOKCdCNC18sCZxn02yT67fEbbTFUH0vz?=
 =?us-ascii?Q?7TQswTrtAjVuoDnyCDWtU/wUmQ2SiBAnls+REYfUp6SOCVY2TUGNEL4K/Lvr?=
 =?us-ascii?Q?PtAxAMQaxGcm/GycLIMFS5KPl+N0SkFSsrKJIrK2+M0BQWcdFDGccOyNFmbp?=
 =?us-ascii?Q?J9qZxJpQ67QRdpCCESveiRMpz6xFaMvuYTRvdA45m9ufa7R1uCWynvBh5sWM?=
 =?us-ascii?Q?3qKvzEgSaVgVjidpzvZXVfKiIYDYEee/Epb29SUyqHszaNkEkJDmUiz4eSte?=
 =?us-ascii?Q?sdOsKfnuL5OYm6h80uZntHNonK+yLO+JzOODtbmv4PlQKZc+edSDrtpNPnHv?=
 =?us-ascii?Q?Am4AYPNiinbr5iBk1jGRNmKePEcNL/lHJmKCpHf6H41wUVbUt8D6InuwrzIl?=
 =?us-ascii?Q?QpsLKr5Y+IoI0ZN1zEUQWAQQUw0HsXuCmlIjyEHh8ouJxBZmQKqPUOlZ5oLZ?=
 =?us-ascii?Q?0UqfWuPWV9U4g3NTBmcUF0yCAgv0EekziCymJgaUAM5f/FUqBcBc1ORmw2xL?=
 =?us-ascii?Q?RcwfdN8ALDr8AGn/UoUYtSNMZZbQDvw/ZLfTIGTxjB+9R8xN1NNiC70Qnp4A?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 491051c2-5191-4abd-1d76-08dae921e781
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 22:21:45.6349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0q93vnt31hhX3v8q5Ey4QNQYHnOCDQfbH59R95ZNX5wx/fcKhOPXNecD/1aNu4mw5FMbG3634ghUMB3z0250KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7578
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 09:42:58AM -0800, Rob Clark wrote:
> On Thu, Dec 22, 2022 at 2:29 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
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
> 
> You might want to enable CONFIG_DRM_MSM in your kconfig, I think you
> missed a part
> 
> BR,
> -R
> 

Thanks for feedback Rob, yes indeed we missed updating the MSM driver. Fixed up
in our Xe repo and will be fixed in the next rev on the list.

Matt

> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  12 +-
> >  drivers/gpu/drm/scheduler/sched_main.c      | 124 ++++++++++++--------
> >  include/drm/gpu_scheduler.h                 |  13 +-
> >  4 files changed, 93 insertions(+), 70 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > index f60753f97ac5..9c2a10aeb0b3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > @@ -1489,9 +1489,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
> >         for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
> >                 struct amdgpu_ring *ring = adev->rings[i];
> >
> > -               if (!ring || !ring->sched.thread)
> > +               if (!ring || !ring->sched.ready)
> >                         continue;
> > -               kthread_park(ring->sched.thread);
> > +               drm_sched_run_wq_stop(&ring->sched);
> >         }
> >
> >         seq_printf(m, "run ib test:\n");
> > @@ -1505,9 +1505,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
> >         for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
> >                 struct amdgpu_ring *ring = adev->rings[i];
> >
> > -               if (!ring || !ring->sched.thread)
> > +               if (!ring || !ring->sched.ready)
> >                         continue;
> > -               kthread_unpark(ring->sched.thread);
> > +               drm_sched_run_wq_start(&ring->sched);
> >         }
> >
> >         up_write(&adev->reset_domain->sem);
> > @@ -1727,7 +1727,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
> >
> >         ring = adev->rings[val];
> >
> > -       if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
> > +       if (!ring || !ring->funcs->preempt_ib || !ring->sched.ready)
> >                 return -EINVAL;
> >
> >         /* the last preemption failed */
> > @@ -1745,7 +1745,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
> >                 goto pro_end;
> >
> >         /* stop the scheduler */
> > -       kthread_park(ring->sched.thread);
> > +       drm_sched_run_wq_stop(&ring->sched);
> >
> >         /* preempt the IB */
> >         r = amdgpu_ring_preempt_ib(ring);
> > @@ -1779,7 +1779,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
> >
> >  failure:
> >         /* restart the scheduler */
> > -       kthread_unpark(ring->sched.thread);
> > +       drm_sched_run_wq_start(&ring->sched);
> >
> >         up_read(&adev->reset_domain->sem);
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index 076ae400d099..9552929ccf87 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -4577,7 +4577,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
> >         for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >                 struct amdgpu_ring *ring = adev->rings[i];
> >
> > -               if (!ring || !ring->sched.thread)
> > +               if (!ring || !ring->sched.ready)
> >                         continue;
> >
> >                 spin_lock(&ring->sched.job_list_lock);
> > @@ -4708,7 +4708,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
> >         for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >                 struct amdgpu_ring *ring = adev->rings[i];
> >
> > -               if (!ring || !ring->sched.thread)
> > +               if (!ring || !ring->sched.ready)
> >                         continue;
> >
> >                 /*clear job fence from fence drv to avoid force_completion
> > @@ -5247,7 +5247,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> >                 for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >                         struct amdgpu_ring *ring = tmp_adev->rings[i];
> >
> > -                       if (!ring || !ring->sched.thread)
> > +                       if (!ring || !ring->sched.ready)
> >                                 continue;
> >
> >                         drm_sched_stop(&ring->sched, job ? &job->base : NULL);
> > @@ -5321,7 +5321,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> >                 for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >                         struct amdgpu_ring *ring = tmp_adev->rings[i];
> >
> > -                       if (!ring || !ring->sched.thread)
> > +                       if (!ring || !ring->sched.ready)
> >                                 continue;
> >
> >                         drm_sched_start(&ring->sched, true);
> > @@ -5648,7 +5648,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
> >                 for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >                         struct amdgpu_ring *ring = adev->rings[i];
> >
> > -                       if (!ring || !ring->sched.thread)
> > +                       if (!ring || !ring->sched.ready)
> >                                 continue;
> >
> >                         drm_sched_stop(&ring->sched, NULL);
> > @@ -5776,7 +5776,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
> >         for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> >                 struct amdgpu_ring *ring = adev->rings[i];
> >
> > -               if (!ring || !ring->sched.thread)
> > +               if (!ring || !ring->sched.ready)
> >                         continue;
> >
> >                 drm_sched_start(&ring->sched, true);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 27d52ffbb808..8c64045d0692 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -44,7 +44,6 @@
> >   * The jobs in a entity are always scheduled in the order that they were pushed.
> >   */
> >
> > -#include <linux/kthread.h>
> >  #include <linux/wait.h>
> >  #include <linux/sched.h>
> >  #include <linux/completion.h>
> > @@ -251,6 +250,53 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >         return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> >  }
> >
> > +/**
> > + * drm_sched_run_wq_stop - stop scheduler run worker
> > + *
> > + * @sched: scheduler instance to stop run worker
> > + */
> > +void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched)
> > +{
> > +       sched->pause_run_wq = true;
> > +       smp_wmb();
> > +
> > +       cancel_work_sync(&sched->work_run);
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
> > +       sched->pause_run_wq = false;
> > +       smp_wmb();
> > +
> > +       queue_work(sched->run_wq, &sched->work_run);
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
> > +       smp_rmb();
> > +
> > +       /*
> > +        * Try not to schedule work if pause_run_wq set but not the end of world
> > +        * if we do as either it will be cancelled by the above
> > +        * cancel_work_sync, or drm_sched_main turns into a NOP while
> > +        * pause_run_wq is set.
> > +        */
> > +       if (!sched->pause_run_wq)
> > +               queue_work(sched->run_wq, &sched->work_run);
> > +}
> > +
> >  /**
> >   * drm_sched_job_done - complete a job
> >   * @s_job: pointer to the job which is done
> > @@ -270,7 +316,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
> >         dma_fence_get(&s_fence->finished);
> >         drm_sched_fence_finished(s_fence);
> >         dma_fence_put(&s_fence->finished);
> > -       wake_up_interruptible(&sched->wake_up_worker);
> > +       drm_sched_run_wq_queue(sched);
> >  }
> >
> >  /**
> > @@ -433,7 +479,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >  {
> >         struct drm_sched_job *s_job, *tmp;
> >
> > -       kthread_park(sched->thread);
> > +       drm_sched_run_wq_stop(sched);
> >
> >         /*
> >          * Reinsert back the bad job here - now it's safe as
> > @@ -546,7 +592,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> >                 spin_unlock(&sched->job_list_lock);
> >         }
> >
> > -       kthread_unpark(sched->thread);
> > +       drm_sched_run_wq_start(sched);
> >  }
> >  EXPORT_SYMBOL(drm_sched_start);
> >
> > @@ -831,7 +877,7 @@ static bool drm_sched_ready(struct drm_gpu_scheduler *sched)
> >  void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
> >  {
> >         if (drm_sched_ready(sched))
> > -               wake_up_interruptible(&sched->wake_up_worker);
> > +               drm_sched_run_wq_queue(sched);
> >  }
> >
> >  /**
> > @@ -941,60 +987,42 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> >  }
> >  EXPORT_SYMBOL(drm_sched_pick_best);
> >
> > -/**
> > - * drm_sched_blocked - check if the scheduler is blocked
> > - *
> > - * @sched: scheduler instance
> > - *
> > - * Returns true if blocked, otherwise false.
> > - */
> > -static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
> > -{
> > -       if (kthread_should_park()) {
> > -               kthread_parkme();
> > -               return true;
> > -       }
> > -
> > -       return false;
> > -}
> > -
> >  /**
> >   * drm_sched_main - main scheduler thread
> >   *
> >   * @param: scheduler instance
> > - *
> > - * Returns 0.
> >   */
> > -static int drm_sched_main(void *param)
> > +static void drm_sched_main(struct work_struct *w)
> >  {
> > -       struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> > +       struct drm_gpu_scheduler *sched =
> > +               container_of(w, struct drm_gpu_scheduler, work_run);
> >         int r;
> >
> > -       sched_set_fifo_low(current);
> > -
> > -       while (!kthread_should_stop()) {
> > -               struct drm_sched_entity *entity = NULL;
> > +       while (!READ_ONCE(sched->pause_run_wq)) {
> > +               struct drm_sched_entity *entity;
> >                 struct drm_sched_fence *s_fence;
> >                 struct drm_sched_job *sched_job;
> >                 struct dma_fence *fence;
> > -               struct drm_sched_job *cleanup_job = NULL;
> > +               struct drm_sched_job *cleanup_job;
> >
> > -               wait_event_interruptible(sched->wake_up_worker,
> > -                                        (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
> > -                                        (!drm_sched_blocked(sched) &&
> > -                                         (entity = drm_sched_select_entity(sched))) ||
> > -                                        kthread_should_stop());
> > +               cleanup_job = drm_sched_get_cleanup_job(sched);
> > +               entity = drm_sched_select_entity(sched);
> >
> >                 if (cleanup_job)
> >                         sched->ops->free_job(cleanup_job);
> >
> > -               if (!entity)
> > +               if (!entity) {
> > +                       if (!cleanup_job)
> > +                               break;
> >                         continue;
> > +               }
> >
> >                 sched_job = drm_sched_entity_pop_job(entity);
> >
> >                 if (!sched_job) {
> >                         complete_all(&entity->entity_idle);
> > +                       if (!cleanup_job)
> > +                               break;
> >                         continue;
> >                 }
> >
> > @@ -1022,14 +1050,14 @@ static int drm_sched_main(void *param)
> >                                           r);
> >                 } else {
> >                         if (IS_ERR(fence))
> > -                               dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
> > +                               dma_fence_set_error(&s_fence->finished,
> > +                                                   PTR_ERR(fence));
> >
> >                         drm_sched_job_done(sched_job);
> >                 }
> >
> >                 wake_up(&sched->job_scheduled);
> >         }
> > -       return 0;
> >  }
> >
> >  /**
> > @@ -1054,35 +1082,28 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >                    long timeout, struct workqueue_struct *timeout_wq,
> >                    atomic_t *score, const char *name, struct device *dev)
> >  {
> > -       int i, ret;
> > +       int i;
> >         sched->ops = ops;
> >         sched->hw_submission_limit = hw_submission;
> >         sched->name = name;
> >         sched->timeout = timeout;
> >         sched->timeout_wq = timeout_wq ? : system_wq;
> > +       sched->run_wq = system_wq;      /* FIXME: Let user pass this in */
> >         sched->hang_limit = hang_limit;
> >         sched->score = score ? score : &sched->_score;
> >         sched->dev = dev;
> >         for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >                 drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >
> > -       init_waitqueue_head(&sched->wake_up_worker);
> >         init_waitqueue_head(&sched->job_scheduled);
> >         INIT_LIST_HEAD(&sched->pending_list);
> >         spin_lock_init(&sched->job_list_lock);
> >         atomic_set(&sched->hw_rq_count, 0);
> >         INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > +       INIT_WORK(&sched->work_run, drm_sched_main);
> >         atomic_set(&sched->_score, 0);
> >         atomic64_set(&sched->job_id_count, 0);
> > -
> > -       /* Each scheduler will run on a seperate kernel thread */
> > -       sched->thread = kthread_run(drm_sched_main, sched, sched->name);
> > -       if (IS_ERR(sched->thread)) {
> > -               ret = PTR_ERR(sched->thread);
> > -               sched->thread = NULL;
> > -               DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
> > -               return ret;
> > -       }
> > +       sched->pause_run_wq = false;
> >
> >         sched->ready = true;
> >         return 0;
> > @@ -1101,8 +1122,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >         struct drm_sched_entity *s_entity;
> >         int i;
> >
> > -       if (sched->thread)
> > -               kthread_stop(sched->thread);
> > +       drm_sched_run_wq_stop(sched);
> >
> >         for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >                 struct drm_sched_rq *rq = &sched->sched_rq[i];
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index ca857ec9e7eb..ff50f3c289cd 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -456,17 +456,16 @@ struct drm_sched_backend_ops {
> >   * @timeout: the time after which a job is removed from the scheduler.
> >   * @name: name of the ring for which this scheduler is being used.
> >   * @sched_rq: priority wise array of run queues.
> > - * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
> > - *                  is ready to be scheduled.
> >   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
> >   *                 waits on this wait queue until all the scheduled jobs are
> >   *                 finished.
> >   * @hw_rq_count: the number of jobs currently in the hardware queue.
> >   * @job_id_count: used to assign unique id to the each job.
> > + * @run_wq: workqueue used to queue @work_run
> >   * @timeout_wq: workqueue used to queue @work_tdr
> > + * @work_run: schedules jobs and cleans up entities
> >   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> >   *            timeout interval is over.
> > - * @thread: the kthread on which the scheduler which run.
> >   * @pending_list: the list of jobs which are currently in the job queue.
> >   * @job_list_lock: lock to protect the pending_list.
> >   * @hang_limit: once the hangs by a job crosses this limit then it is marked
> > @@ -475,6 +474,7 @@ struct drm_sched_backend_ops {
> >   * @_score: score used when the driver doesn't provide one
> >   * @ready: marks if the underlying HW is ready to work
> >   * @free_guilty: A hit to time out handler to free the guilty job.
> > + * @pause_run_wq: pause queuing of @work_run on @run_wq
> >   * @dev: system &struct device
> >   *
> >   * One scheduler is implemented for each hardware ring.
> > @@ -485,13 +485,13 @@ struct drm_gpu_scheduler {
> >         long                            timeout;
> >         const char                      *name;
> >         struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
> > -       wait_queue_head_t               wake_up_worker;
> >         wait_queue_head_t               job_scheduled;
> >         atomic_t                        hw_rq_count;
> >         atomic64_t                      job_id_count;
> > +       struct workqueue_struct         *run_wq;
> >         struct workqueue_struct         *timeout_wq;
> > +       struct work_struct              work_run;
> >         struct delayed_work             work_tdr;
> > -       struct task_struct              *thread;
> >         struct list_head                pending_list;
> >         spinlock_t                      job_list_lock;
> >         int                             hang_limit;
> > @@ -499,6 +499,7 @@ struct drm_gpu_scheduler {
> >         atomic_t                        _score;
> >         bool                            ready;
> >         bool                            free_guilty;
> > +       bool                            pause_run_wq;
> >         struct device                   *dev;
> >  };
> >
> > @@ -529,6 +530,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >
> >  void drm_sched_job_cleanup(struct drm_sched_job *job);
> >  void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > +void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
> > +void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
> >  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> >  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
> >  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> > --
> > 2.37.3
> >
