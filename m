Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08217BBB87
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E8110E51D;
	Fri,  6 Oct 2023 15:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C931510E519;
 Fri,  6 Oct 2023 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696605325; x=1728141325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jUhSgFfk6KmpNVpjxR1Ym/pNAx1yGpjAGJQho9I0NEI=;
 b=XeJnVIG1PYwj4wf9x1AgBfeyQWaPFxE+bQU1L+gN4AdLX88gf1/0+ciu
 x3kgK9Qf4S61kKwC3OcpMGtJty9PXc8hBBLQykKGSoZlT02S58S8utY4F
 LjVzuVPP1JLslyoYQ0EFf4LJGtQixptw8rw7DWn2Jk1dyTRO5YsZCI3Nb
 Ny1TndKXj8+3rbW2wda7j3EfFncACM60wkbNRZRwO4hKeIuXSllBOxQ+x
 gqnLshvnQ/FayFCqBi6kL+pdRmLzWQtEf+3og8eypSw/ZvtIf5FdEtAur
 1xZgYI2UozdnLP8OPpfGT3s2Ryz1GFqEjMVAXChnYQSicrnjNJbdA8iYe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="382631668"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="382631668"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 08:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="745892798"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="745892798"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 08:15:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 08:15:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 08:15:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 08:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPIQIGaN334FOOeoUFW/BMO7g3lFRdsdN/2u2ByAVncKo6tIe32HPf0PQKscHd9dKsu5D+g9P2AHFsxWfQIMdy1BRviKJDJNLiSBr9/eTYiSgUQCANTdb0Ny6BgF9F4bvUIDpEIPy4/wkYMDC9YVgJk6SBcGyH6XQxrtvodwggwYAvU4KHbjAgn4AorJE03PrEYu8z7S3Nq3eiXICI5qBgYiE0963w2uHQ540kLFqRM2IBx1KwlcyFfwyQBCbbrbKwN7SXyW5Gfo+zd/hKFd73mJN2373Uz7zwrf7sUw+x1Cmh0AHAYSV5WZcHL36bPvQbRE3vr13S+xWS2rb8/Rhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEa4eei3H0ELQQ3Hr9jV4thVERm93k58eU9Ghx2YTpY=;
 b=KvEH88kQc81M3S+pnijrUOiyOYa0g734WVQFbXPE8L2h1uTo9yintTshBok4PT86JkWk6l6e27ErlPNaim8q+N5/Zd3ChEHuDOMe4MOJ8cx/L1BRdSJ9jXrBSY6Sk+g6+vOEA08dZWWl3NvY3G7ajsiELB/Y64tixP/lCHCMb5D21BS28AMsbRXxH6zgmTy5d66HIODGzqacJ790QQSgMSD8w9B8+zAUOC+rdDdIe+FQzi1l0928KsGtR61Gyq1zWXi72SbgVvWzso2UVP3Of99FQ8upFC2bkZJ71HbLwOLjUZ9hBXvhN77sLT/4/SZF7fTqm2r0GONtARBpJIK8AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Fri, 6 Oct
 2023 15:15:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.039; Fri, 6 Oct 2023
 15:15:20 +0000
Date: Fri, 6 Oct 2023 15:14:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v4 02/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <ZSAkPF1nExMBz89Z@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
 <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
 <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
 <1e911601-f126-4e55-35e7-1a5e395b5fd2@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1e911601-f126-4e55-35e7-1a5e395b5fd2@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3c0943-0be8-41c7-271e-08dbc67f0dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRgySg78iN/affRKe/lCbX3IG6bTr5Kfz+qDOWQ1MOxgcjAksyVNGtScbvh+fJ/bjpyadrweEO4PrqaUWFhWjbicJO7LwkBGQMFbC8dMEj1+y+FfdI9kdGhcEeoxcw3em/Co+pgWwoMbj1WRLrtgHQkCTw//xsnX4InypBiVE3GvZZC721IMD4v3shHrpaKcqrlSr6166RrhpVcV2XVVx6kXdKvlAqt6XAKjclF+p/217KrqNHsZ4g/rTsa1GAbmFStks7C0rOHzDztLbIciP8uc82Z58HTfnrn5/2fKwtTKJqh5wL+VOt9eRHhc6ZKQLpRfNRimlyusUuylM9sY6lJgKFEu8+mJI7bIspHk7tc5fP94V9qXDL90q4XdDc55HwgwmSLvjH3cO1xz/aFHO8tvsBSeQOMKzBH2MlNmXSfn7AIU/rOoCHzBgLU0p78Md7C69TI3FqeRCd9rjTv8LZJDGRx6Nxfb/8T/bc+ArPzADAPaH/2dabRLz9uMS3u8eztlD2WI4FKqpVszKgkq/QvdiqhhxN3/sxxIyP9xEaCP7woxMFMRjw3Bw4q9b9ML
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6506007)(6666004)(53546011)(6512007)(478600001)(6486002)(38100700002)(86362001)(82960400001)(7416002)(316002)(6916009)(30864003)(83380400001)(26005)(2906002)(66556008)(4326008)(8676002)(66946007)(8936002)(66476007)(41300700001)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ZMoMUp6cuBWvXni1Sqt47cF7TEDqyCMVEA90zhPsdGXb5rFokrg/xAGk2QG?=
 =?us-ascii?Q?gHUeyySrtvn3/352LSbYTCASR5EdN0mU+gYDJACzl9GLmDstplgla2iz4MDi?=
 =?us-ascii?Q?br5tcZWpYvLSsIEHPogD4aw9EFk/i6jZ7ClfB2IV9q1hMZtCqWq+B/21ZEeA?=
 =?us-ascii?Q?7V3zhl+25hV2HqWGddt6jpY44+T4fz3qn5e2MQqO6UyV3bAZW1GTSNdxTeVN?=
 =?us-ascii?Q?81jahAYxgvcyEEYC5sgOPLvPhZr+8dLKXkm61/cbfWqvkC+xKU1CCJmaDEFP?=
 =?us-ascii?Q?fg0XkOZS0nDmvdF0IQxAcB5nL2JeFevgiGUH/1Jf+W/8a9QXqSc/q/+asOHZ?=
 =?us-ascii?Q?aOi8IsHenuYCPX+o6LUmdKrq0q9++QBFdCJgeM/HyJoNE5kVrShXUdxZYVAg?=
 =?us-ascii?Q?t3rz97CHzNsu/OWH46N0H+nMxPNnX5YvGMPLqnK3oWLT9xv3wpcX4kb+dKWM?=
 =?us-ascii?Q?ca5BBL+jzmFT5R4Ur6loZBBmByqia7sGBNwak4AzEsT/8DGDPTjXqGefO1iO?=
 =?us-ascii?Q?EINOGe/dGL1q8sJNDflzUVx8QG8iDo6zmGSCEmAR7hTwVEF8q4aii+m2euGG?=
 =?us-ascii?Q?RB9T4+vvGnPfzYx4UdeHiwC4Nud1vKvG8yjbK/NmD4zWc7NSaisEXDm4sY9Z?=
 =?us-ascii?Q?XGT+lTF8IbferhX3nFyP4hQHxlcTmdj2gS4HwF/unFFTQ5xKWUrYG487WF4p?=
 =?us-ascii?Q?VvAxNsJgj5gt0Ts/MS6O0SW/+zoy/S5JzLplDwEX6zIfaCBlrv7vmSHpBWvD?=
 =?us-ascii?Q?pxTZCxaxWloMwnYkWXrWnWsxoaMvYLjtgWwJu01z+EPHVe/PbCq+r7YUFpyS?=
 =?us-ascii?Q?2iEhMedxg7D8hPL6YyDjhweOgsrt77Is1vmSIZy2uX2zyqKyCCrxGQYygj/0?=
 =?us-ascii?Q?Tbu1QtdxKTmibWhKeXuEcP05ezajD7jW2kG14FzIOXrJLnAnTT79teLXR6Pf?=
 =?us-ascii?Q?AugHrIpWBL2SeOwjyF1bzNyomJQW28wzbw1gloysn9HHLSZBcGmf76Z0HurZ?=
 =?us-ascii?Q?oKArMhm/aelFIxWUeuz9dsgsRz78BkPnTfGBbDz6XOn5oK1apXJKE2TjtrOs?=
 =?us-ascii?Q?8H0WA0qWreGI2vFFCedahpIIRCiR0D+1TuutaXjQ3960KIKOZ7a0AxtPDVYG?=
 =?us-ascii?Q?wEh3JYMHqNhy2el2Q80NX+BcuIbvuk6lhRMjzibjDgtjDLpYFQO23at6xEF2?=
 =?us-ascii?Q?+g6IhZg6loQAXLoDCzqA+LPoZsCR5OSk1Oe7eJGxERncJ2q6zHW71KKobqF/?=
 =?us-ascii?Q?OFn83fGV8/61OzQ/9FtpDNiEOV6cbdwmwaxYMFcniwlWnjrdLNu0+nAzVaVT?=
 =?us-ascii?Q?eqNsfri9ln4unpOmkrUt1woAKH+2LoZfXcLOtoFLtteb329XtwPDoon4tOYq?=
 =?us-ascii?Q?018YBl8IExpsDx9KVjxvmYmJ0Q146tlfuCikeQcDZ4u7nf8y+QyEOAash71+?=
 =?us-ascii?Q?2VQedRpXgAFnYPbXxqmuiwzYlh2kWK2+C7tUvcW4AEUkWoJshyY/TjP4DX+g?=
 =?us-ascii?Q?mFPKecNxzzvFK4wFTaNjAHGUWWwFjF8KUwIYYhf1PRUpYN9VOUUn4E6SQUHq?=
 =?us-ascii?Q?XWlojYgi0Rkq63ttxE5xL41FI4Bh0RelCjzT/4ecjPhY+ctzltXO2jW1OwCO?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3c0943-0be8-41c7-271e-08dbc67f0dbf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 15:15:19.9738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REp0dbsHYNRcmV2sF3Ozg0RKN7vZdyP7Nt1MhL93U7Tu9ZCQbIYoLnR7Q3WSKHJ5Sa2XYyP8NerW4SxHNFinVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dakr@redhat.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 08:59:15AM +0100, Tvrtko Ursulin wrote:
> 
> On 05/10/2023 05:13, Luben Tuikov wrote:
> > On 2023-10-04 23:33, Matthew Brost wrote:
> > > On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
> > > > Hi,
> > > > 
> > > > On 2023-09-19 01:01, Matthew Brost wrote:
> > > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> > > > > seems a bit odd but let us explain the reasoning below.
> > > > > 
> > > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > > guaranteed to be the same completion even if targeting the same hardware
> > > > > engine. This is because in XE we have a firmware scheduler, the GuC,
> > > > > which allowed to reorder, timeslice, and preempt submissions. If a using
> > > > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> > > > > apart as the TDR expects submission order == completion order. Using a
> > > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> > > > > 
> > > > > 2. In XE submissions are done via programming a ring buffer (circular
> > > > > buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> > > > > limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> > > > > control on the ring for free.
> > > > > 
> > > > > A problem with this design is currently a drm_gpu_scheduler uses a
> > > > > kthread for submission / job cleanup. This doesn't scale if a large
> > > > > number of drm_gpu_scheduler are used. To work around the scaling issue,
> > > > > use a worker rather than kthread for submission / job cleanup.
> > > > > 
> > > > > v2:
> > > > >    - (Rob Clark) Fix msm build
> > > > >    - Pass in run work queue
> > > > > v3:
> > > > >    - (Boris) don't have loop in worker
> > > > > v4:
> > > > >    - (Tvrtko) break out submit ready, stop, start helpers into own patch
> > > > > v5:
> > > > >    - (Boris) default to ordered work queue
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
> > > > >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
> > > > >   drivers/gpu/drm/lima/lima_sched.c          |   2 +-
> > > > >   drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
> > > > >   drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
> > > > >   drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
> > > > >   drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
> > > > >   drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
> > > > >   include/drm/gpu_scheduler.h                |  14 ++-
> > > > >   9 files changed, 79 insertions(+), 75 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > index e366f61c3aed..16f3cfe1574a 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > > > >   			break;
> > > > >   		}
> > > > > -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> > > > > +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> > > > >   				   ring->num_hw_submission, 0,
> > > > >   				   timeout, adev->reset_domain->wq,
> > > > >   				   ring->sched_score, ring->name,
> > > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > index 345fec6cb1a4..618a804ddc34 100644
> > > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > > > @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> > > > >   {
> > > > >   	int ret;
> > > > > -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > > > > +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> > > > >   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> > > > >   			     msecs_to_jiffies(500), NULL, NULL,
> > > > >   			     dev_name(gpu->dev), gpu->dev);
> > > > > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > > > > index ffd91a5ee299..8d858aed0e56 100644
> > > > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > > > @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> > > > >   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> > > > > -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> > > > > +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> > > > >   			      lima_job_hang_limit,
> > > > >   			      msecs_to_jiffies(timeout), NULL,
> > > > >   			      NULL, name, pipe->ldev->dev);
> > > > > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > > > index 40c0bc35a44c..b8865e61b40f 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > > > > @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> > > > >   	 /* currently managing hangcheck ourselves: */
> > > > >   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> > > > > -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> > > > > +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> > > > >   			num_hw_submissions, 0, sched_timeout,
> > > > >   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> > > > 
> > > > checkpatch.pl complains here about unmatched open parens.
> > > > 
> > > 
> > > Will fix and run checkpatch before posting next rev.
> > > 
> > > > >   	if (ret) {
> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > index 88217185e0f3..d458c2227d4f 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
> > > > >   	if (!drm->sched_wq)
> > > > >   		return -ENOMEM;
> > > > > -	return drm_sched_init(sched, &nouveau_sched_ops,
> > > > > +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
> > > > >   			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> > > > >   			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> > > > >   }
> > > > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > index 033f5e684707..326ca1ddf1d7 100644
> > > > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > > > @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> > > > >   		js->queue[j].fence_context = dma_fence_context_alloc(1);
> > > > >   		ret = drm_sched_init(&js->queue[j].sched,
> > > > > -				     &panfrost_sched_ops,
> > > > > +				     &panfrost_sched_ops, NULL,
> > > > >   				     nentries, 0,
> > > > >   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > > >   				     pfdev->reset.wq,
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index e4fa62abca41..ee6281942e36 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -48,7 +48,6 @@
> > > > >    * through the jobs entity pointer.
> > > > >    */
> > > > > -#include <linux/kthread.h>
> > > > >   #include <linux/wait.h>
> > > > >   #include <linux/sched.h>
> > > > >   #include <linux/completion.h>
> > > > > @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > >   	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> > > > >   }
> > > > > +/**
> > > > > + * drm_sched_submit_queue - scheduler queue submission
> > > > 
> > > > There is no verb in the description, and is not clear what
> > > > this function does unless one reads the code. Given that this
> > > > is DOC, this should be clearer here. Something like "queue
> > > > scheduler work to be executed" or something to that effect.
> > > > 
> > > 
> > > Will fix.
> > > > Coming back to this from reading the patch below, it was somewhat
> > > > unclear what "drm_sched_submit_queue()" does, since when reading
> > > > below, "submit" was being read by my mind as an adjective, as opposed
> > > > to a verb. Perhaps something like:
> > > > 
> > > > drm_sched_queue_submit(), or
> > > > drm_sched_queue_exec(), or
> > > > drm_sched_queue_push(), or something to that effect. You pick. :-)
> > > > 
> > > 
> > > I prefer the name as is. In this patch we have:
> > > 
> > > drm_sched_submit_queue()
> > > drm_sched_submit_start)
> > > drm_sched_submit_stop()
> > > drm_sched_submit_ready()
> > > 
> > > I like all these functions start with 'drm_sched_submit' which allows
> > > for easy searching for the functions that touch the DRM scheduler
> > > submission state.
> > > 
> > > With a little better doc are you fine with the names as is.
> > 
> > Notice the following scheme in the naming,
> > 
> > drm_sched_submit_queue()
> > drm_sched_submit_start)
> > drm_sched_submit_stop()
> > drm_sched_submit_ready()
> > \---+---/ \--+-/ \-+-/
> >      |        |     +---> a verb
> >      |        +---------> should be a noun (something in the component)
> >      +------------------> the kernel/software component
> > 
> > And although "queue" can technically be used as a verb too, I'd rather it be "enqueue",
> > like this:
> > 
> > drm_sched_submit_enqueue()
> > 
> > And using "submit" as the noun of the component is a bit cringy,
> > since "submit" is really a verb, and it's cringy to make it a "state"
> > or an "object" we operate on in the DRM Scheduler. "Submission" is
> > a noun, but "submission enqueue/start/stop/ready" doesn't sound
> > very well thought out. "Submission" really is what the work-queue
> > does.
> > 
> > I'd rather it be a real object, like for instance,
> > 
> > drm_sched_wqueue_enqueue()
> > drm_sched_wqueue_start)
> > drm_sched_wqueue_stop()
> > drm_sched_wqueue_ready()
> > 

How about:

drm_sched_submission_enqueue()
drm_sched_submission_start)
drm_sched_submission_stop()
drm_sched_submission_ready()

Matt

> > Which tells me that the component is the DRM Scheduler, the object is a/the work-queue,
> > and the last word as the verb, is the action we're performing on the object, i.e. the work-queue.
> > Plus, all these functions actually do operate on work-queues, directly or indirectly,
> > are new, so it's a win-win naming scheme.
> > 
> > I think that that would be most likeable.
> 
> FWIW I was suggesting not to encode the fact submit queue is implemented
> with a workqueue in the API name. IMO it would be nicer and less maintenance
> churn should something channge if the external components can be isolated
> from that detail.
> 
> drm_sched_submit_queue_$verb? If not viewed as too verbose...
> 
> Regards,
> 
> Tvrtko
