Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AB7B9A36
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 05:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4621C10E1A8;
	Thu,  5 Oct 2023 03:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D9210E1A8;
 Thu,  5 Oct 2023 03:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696476915; x=1728012915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZhlTyztd3F3pYUytKxRWEluXNqPXUAyWFoJAX3cB1aU=;
 b=cXiscf3pIU4ipRLpP28v6FPN0yCpt9NkwQbjGFGSHE99nPjV4FXaqdlZ
 TxfFokyEVJck/my+WMf/FPdtW/a0kUVdwd5h85R0gHIjaAqW/Yuou7tMo
 bbnCXro+on7iJiT+0QIBo8i7jv4Phtt1etE8CGkPa+PWBQuYE7mB2bAwE
 z1jfp5+wSy3B1EF+qD4X1T3uXuUDzm1cjSs958KSWDHyD/gg0MXbTCO/m
 9PrJ1TLJ34ncAJrv4w9SXcIQ8FmgvRGHZJs1fJghZOMqI4DrYbFqxy/Oc
 dbf7yRE3mps+1xQgc/ss/kFqjNasPVtblicpzFl9UKRyIqSJFlHkBMGxC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382259711"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="382259711"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 20:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867710716"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="867710716"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 20:35:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 20:35:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 20:35:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 20:35:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL9h4vl9LmBbz6S9vtbIY8ZG8n3EB6BUt9czYuHqeyB2IeQ1oPBlFzus8Y3ggr+rvc31WEjD6Vlb7IahxwhN9cFF8ct6H2xzbP/WRISYd2i92wch9Rf9XwP1ah5xPsDyIQ4p0RPmh5uzmcTnoQI53TPEq9JSdLKUFXuxMAvbj2cVP+OFqsk9on44ulIggoMm7x4cAgmXIkxLYhOkIvLqkd3oc6wfuzqeK8ATGTNDC0TkX2G+SIuLIpw/xnI90T8lB3HtD1wVHp7e4c0fnJqZpsWmDMu5Le+WmutRtkbGbvRENuDXD7JJ1oUsVDRc0Abqt42ragoePOcfFXjIHBGSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YFy91+qG2VWbtENtYCt6VON4yJdCodyKME9PMbUWf0=;
 b=X3fMc5GoyKdvvsvCwsP8xWYEoM8aHHb8X/vT6dAQjA69uyEEs+/6HtAHl04kmr9hP3W2oJCaSgfNFc4VN1eH/2CrZlqe6I67ATvtbsDUQacTQUaw+5HgTR4OhzPUVDAxwGDQHONhKwsTrcj5LZomrnyuu9gG75FFrO+uC/ua1cu0sHC8MEAnFQ5W6t8FeSffjLInr8L6PhYMRONCHq1xFhX/8uKctCFlipxxDhys3vuXpVlGVlN/JbSbuhtdSVWkwpnXSkqonLWeUaWsfC3cX9YXxTFJa4hK07Dx8ZsJ8xnRk6OUAPSjMuIcn9cIuOdHnd068s9s5HTK7ebN9EsckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Thu, 5 Oct
 2023 03:35:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:35:09 +0000
Date: Thu, 5 Oct 2023 03:33:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 02/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
X-ClientProxiedBy: MW4PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:303:8d::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 64225ecd-e3c8-4eec-511b-08dbc554135c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O5/FscvDgsf/zj/qVX/2jxlPm9gViv1IQNIVx32TbWvTTKfggbCZcNSPLSaLC23sjR1SqZsIyogvXbcXzFO2AZrPpAFL56etSXkJ6SLb7Q0XKNQm51KZGQxhBozeu79zAbEVdtgVyMaJWE5X3DTpGItF1iPPsxU3dehSZIPpP0j+DK0qjUUEW54q7TDcEHfU0oS7sWlUZkGbBMlaHhVxVzPA405v1qPIvtf9xJLTjjUWhs5B4ncqMTA/wEY0KR1yaOyylESqgrlFVIyz31f87QnJYgDnK6+Anf4MuZTaQzve58TgFmH23wg5qEm668AvhDfhb6SYtbHUvv3xVreqJTOKFF0uM2mgNH7C1kL8wLwM4kLrsyINUKTNbOgN/6h4dKdBzPwmhp7sHa6FylbnzdC13ESO71AvatJMqqw5t268OGhyHj3ctGqWzugFDolB1aRKom9SP3pMOR53Nr7C13QDFmj4Rwo4M6fMlpzSylqXyb7l+kVyvRl/QbY1DJ+5TE2jsPU5+lWRceQgg5hr8UdbRXQrLi1mN8YJydPG3VUb7Xc4kvquHpxw+4lIssOVcmyAeTUnOwgO3pxZHqX4stactU51jt7ID3v4fPyNdwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6666004)(6486002)(478600001)(6512007)(26005)(38100700002)(82960400001)(83380400001)(86362001)(53546011)(316002)(6506007)(66476007)(66556008)(7416002)(66946007)(6916009)(41300700001)(5660300002)(44832011)(8936002)(8676002)(4326008)(2906002)(30864003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RUcNjZAYxanhBkh/aHlmmLEh2xMNfGjv0FZ3/RukIu/RaUYm81vRSpvtNqu6?=
 =?us-ascii?Q?q/Wbx9mCi+7CLSVzgPr07kpr+QpNqopvtj02MGB8rv4zvno0eOkmel21cuKf?=
 =?us-ascii?Q?kANZz340CYhf+B1xLFAZoZTTJNcL+knRyUJy7YCvBgBwvBfTgKfzABNMzQcc?=
 =?us-ascii?Q?JOO/tZuvrO3NKE9dp/Dmb0larFI1hK3/JmgXG3GlfeeDfMCqclegYvJV1xlh?=
 =?us-ascii?Q?o1H8MnZlVJIA+ezA0E8Ui0xUn38ChhgHwgOccAflIMCeYcDhnVDqThAhAPyT?=
 =?us-ascii?Q?VicUE288INqldKIyAr7iTUhHLZ5sRMg5actOeYEzcsjHxoKiQ3sN4RFMjQ+J?=
 =?us-ascii?Q?1M8SJdsKUl7u0Vpjf06IOtCJOaXGdX2Y7BWr0Ciyo0gZ/bNiZtKU+wGXPkIN?=
 =?us-ascii?Q?QHOFtdphlgaWBX3IchaEmJHnoT6ARVdA1cwivGQThAQyf3UIee/AvjTaB59b?=
 =?us-ascii?Q?eHWvilxmxr8oAMTz5T6PIjkK6yYcwWjPulsKKBLu7ZY6l3MGArNyZfoJYjoy?=
 =?us-ascii?Q?bLpTcm4TaaJVXBUlf8eTPL7xEr8bY4nIKCnUTMrqDQ8PpLQaAeNZEXSBwral?=
 =?us-ascii?Q?6Nb6oz64poTgiojE9LatDvvj519ox+oDAKs4HKO1Z0aKxoVqk2WNMGjHT1CG?=
 =?us-ascii?Q?m4K6f7rMSvfUj+7uXJzqKHDmn4bn5wGywJtxIDVKFr4BgMqUaVjVklaDxCtW?=
 =?us-ascii?Q?T7fTgapenHv+/D0vuZqp3dCf2BiqCFMjImVpKaNH2cIZu+jimvNVNM/OQu96?=
 =?us-ascii?Q?6XO1kGqcFMjvSek6KFZsmtoIyOVt1RhONiqZptaZyN1mPGiSwsTVF4JZolYJ?=
 =?us-ascii?Q?P53Q2cUsaHDDGODhzG9zszSVnDv3gnRIIhh+R9QnN64maDwEU0qWK2vPyg5b?=
 =?us-ascii?Q?tG9EXwqO8ScSe7sRudE9zWdBNFH6aa2hi5mHY+4BFBjt7jj0Mn4YOnt4+pPg?=
 =?us-ascii?Q?1Pj5DTYvrb8OiNXKrBeTpbdwO0YOxtvX50MAEd/d89R3Zq0NQ0aMR/7fvJwE?=
 =?us-ascii?Q?UllkAN68cwzI9t64WWu4R66sQAsJ05TTynsOZMTENdJPAJC4/DX71S7//1FC?=
 =?us-ascii?Q?ADWRixhY7kFQPHToHqCg7IX1ERXw3vymDx0/XJxYrle8c3Gebt5Eyddt5KKp?=
 =?us-ascii?Q?tIDfHjB1NsvabVH0Zu0lZJw6LQEqdHm8NpROJIIFPK0PwFjZLDkQ2i7DBuoV?=
 =?us-ascii?Q?W310miHGoNq5JJgHinATKeCs9LxuS8ev1DDPBxYUox5AKCSnNroA6pSyMCXK?=
 =?us-ascii?Q?0bIQDe54UuRic7Pm0Nj9H2gp5yfWsAyI1O/b5X7LblpjxrBgFoRI9VD2o5H4?=
 =?us-ascii?Q?egu47i6R68PXsHQiOLZoKQdE6LV7Xuu840swvJE8IclNYjU85ZUFZJwkgJgC?=
 =?us-ascii?Q?ow0agLY6L+af0KRfRSkO4xg5nadOHe7gBxvpMIKcbuGYgxDarwfcKhF9Gwim?=
 =?us-ascii?Q?pNpJwCIDQHjSB14FZxaL6w9XqRSIpN8LDjr0rfSv4sNlBqnAZDjDmIC1mWFP?=
 =?us-ascii?Q?tv7QaINuYx/NrF0rw6jO3uFcfkm5+YsbBZoqb1jFqZvPtF2UgX5mVSYejVma?=
 =?us-ascii?Q?5Q7QhH9PEtNv22ndMUMhvJUIIwiraY0rWk/t1Oh7r4ApFpRzFwk1qZLSNLTV?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64225ecd-e3c8-4eec-511b-08dbc554135c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:35:09.7702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYe400RwMJwiBcKxKVvCEsitiO6MiS/l0j3oOQU0tOkQwJzzpbvdfi1CTA/mdZbziu8WSEe0xfE0+P26eL8gtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
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
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
> Hi,
> 
> On 2023-09-19 01:01, Matthew Brost wrote:
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
> >   - (Rob Clark) Fix msm build
> >   - Pass in run work queue
> > v3:
> >   - (Boris) don't have loop in worker
> > v4:
> >   - (Tvrtko) break out submit ready, stop, start helpers into own patch
> > v5:
> >   - (Boris) default to ordered work queue
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
> >  drivers/gpu/drm/lima/lima_sched.c          |   2 +-
> >  drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
> >  drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
> >  drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
> >  drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
> >  drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
> >  include/drm/gpu_scheduler.h                |  14 ++-
> >  9 files changed, 79 insertions(+), 75 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index e366f61c3aed..16f3cfe1574a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >  			break;
> >  		}
> >  
> > -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> > +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> >  				   ring->num_hw_submission, 0,
> >  				   timeout, adev->reset_domain->wq,
> >  				   ring->sched_score, ring->name,
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 345fec6cb1a4..618a804ddc34 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >  {
> >  	int ret;
> >  
> > -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >  			     msecs_to_jiffies(500), NULL, NULL,
> >  			     dev_name(gpu->dev), gpu->dev);
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index ffd91a5ee299..8d858aed0e56 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >  
> >  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> >  
> > -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> > +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >  			      lima_job_hang_limit,
> >  			      msecs_to_jiffies(timeout), NULL,
> >  			      NULL, name, pipe->ldev->dev);
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index 40c0bc35a44c..b8865e61b40f 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >  	 /* currently managing hangcheck ourselves: */
> >  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> >  
> > -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> > +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >  			num_hw_submissions, 0, sched_timeout,
> >  			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> 
> checkpatch.pl complains here about unmatched open parens.
> 

Will fix and run checkpatch before posting next rev.

> >  	if (ret) {
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 88217185e0f3..d458c2227d4f 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
> >  	if (!drm->sched_wq)
> >  		return -ENOMEM;
> >  
> > -	return drm_sched_init(sched, &nouveau_sched_ops,
> > +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
> >  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> >  			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> >  }
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 033f5e684707..326ca1ddf1d7 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >  		js->queue[j].fence_context = dma_fence_context_alloc(1);
> >  
> >  		ret = drm_sched_init(&js->queue[j].sched,
> > -				     &panfrost_sched_ops,
> > +				     &panfrost_sched_ops, NULL,
> >  				     nentries, 0,
> >  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >  				     pfdev->reset.wq,
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index e4fa62abca41..ee6281942e36 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -48,7 +48,6 @@
> >   * through the jobs entity pointer.
> >   */
> >  
> > -#include <linux/kthread.h>
> >  #include <linux/wait.h>
> >  #include <linux/sched.h>
> >  #include <linux/completion.h>
> > @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >  	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> >  }
> >  
> > +/**
> > + * drm_sched_submit_queue - scheduler queue submission
> 
> There is no verb in the description, and is not clear what
> this function does unless one reads the code. Given that this
> is DOC, this should be clearer here. Something like "queue
> scheduler work to be executed" or something to that effect.
>

Will fix.
 
> Coming back to this from reading the patch below, it was somewhat
> unclear what "drm_sched_submit_queue()" does, since when reading
> below, "submit" was being read by my mind as an adjective, as opposed
> to a verb. Perhaps something like:
> 
> drm_sched_queue_submit(), or
> drm_sched_queue_exec(), or
> drm_sched_queue_push(), or something to that effect. You pick. :-)
>

I prefer the name as is. In this patch we have:

drm_sched_submit_queue()
drm_sched_submit_start)
drm_sched_submit_stop()
drm_sched_submit_ready()

I like all these functions start with 'drm_sched_submit' which allows
for easy searching for the functions that touch the DRM scheduler
submission state.

With a little better doc are you fine with the names as is.

> Note that it doesn't have to be 100% reflective of the fact that
> we're putting this on a workqueue and it would be executed sooner
> or later, so long as it conveys the fact that we're executing this
> scheduler queue.
> 
> > + * @sched: scheduler instance
> > + */
> > +static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > +{
> > +	if (!READ_ONCE(sched->pause_submit))
> > +		queue_work(sched->submit_wq, &sched->work_submit);
> > +}
> > +
> >  /**
> >   * drm_sched_job_done - complete a job
> >   * @s_job: pointer to the job which is done
> > @@ -275,7 +284,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> >  	dma_fence_get(&s_fence->finished);
> >  	drm_sched_fence_finished(s_fence, result);
> >  	dma_fence_put(&s_fence->finished);
> > -	wake_up_interruptible(&sched->wake_up_worker);
> > +	drm_sched_submit_queue(sched);
> >  }
> >  
> >  /**
> > @@ -868,7 +877,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> >  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> >  {
> >  	if (drm_sched_can_queue(sched))
> > -		wake_up_interruptible(&sched->wake_up_worker);
> > +		drm_sched_submit_queue(sched);
> >  }
> >  
> >  /**
> > @@ -978,61 +987,42 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
> > -	if (kthread_should_park()) {
> > -		kthread_parkme();
> > -		return true;
> > -	}
> > -
> > -	return false;
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
> > -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> > +	struct drm_gpu_scheduler *sched =
> > +		container_of(w, struct drm_gpu_scheduler, work_submit);
> > +	struct drm_sched_entity *entity;
> > +	struct drm_sched_job *cleanup_job;
> >  	int r;
> >  
> > -	sched_set_fifo_low(current);
> > +	if (READ_ONCE(sched->pause_submit))
> > +		return;
> >  
> > -	while (!kthread_should_stop()) {
> > -		struct drm_sched_entity *entity = NULL;
> > -		struct drm_sched_fence *s_fence;
> > -		struct drm_sched_job *sched_job;
> > -		struct dma_fence *fence;
> > -		struct drm_sched_job *cleanup_job = NULL;
> > +	cleanup_job = drm_sched_get_cleanup_job(sched);
> > +	entity = drm_sched_select_entity(sched);
> >  
> > -		wait_event_interruptible(sched->wake_up_worker,
> > -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
> > -					 (!drm_sched_blocked(sched) &&
> > -					  (entity = drm_sched_select_entity(sched))) ||
> > -					 kthread_should_stop());
> > +	if (!entity && !cleanup_job)
> > +		return;	/* No more work */
> >  
> > -		if (cleanup_job)
> > -			sched->ops->free_job(cleanup_job);
> > +	if (cleanup_job)
> > +		sched->ops->free_job(cleanup_job);
> >  
> > -		if (!entity)
> > -			continue;
> > +	if (entity) {
> > +		struct dma_fence *fence;
> > +		struct drm_sched_fence *s_fence;
> > +		struct drm_sched_job *sched_job;
> >  
> >  		sched_job = drm_sched_entity_pop_job(entity);
> > -
> >  		if (!sched_job) {
> >  			complete_all(&entity->entity_idle);
> > -			continue;
> > +			if (!cleanup_job)
> > +				return;	/* No more work */
> > +			goto again;
> >  		}
> >  
> >  		s_fence = sched_job->s_fence;
> > @@ -1063,7 +1053,9 @@ static int drm_sched_main(void *param)
> >  
> >  		wake_up(&sched->job_scheduled);
> >  	}
> > -	return 0;
> > +
> > +again:
> > +	drm_sched_submit_queue(sched);
> >  }
> >  
> >  /**
> > @@ -1071,6 +1063,8 @@ static int drm_sched_main(void *param)
> >   *
> >   * @sched: scheduler instance
> >   * @ops: backend operations for this scheduler
> > + * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
> > + *	       allocated and used
> >   * @hw_submission: number of hw submissions that can be in flight
> >   * @hang_limit: number of times to allow a job to hang before dropping it
> >   * @timeout: timeout value in jiffies for the scheduler
> > @@ -1084,14 +1078,25 @@ static int drm_sched_main(void *param)
> >   */
> >  int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *submit_wq,
> >  		   unsigned hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> >  		   atomic_t *score, const char *name, struct device *dev)
> >  {
> > -	int i, ret;
> > +	int i;
> >  	sched->ops = ops;
> >  	sched->hw_submission_limit = hw_submission;
> >  	sched->name = name;
> > +	if (!submit_wq) {
> > +		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> > +		if (!sched->submit_wq)
> > +			return -ENOMEM;
> > +
> > +		sched->alloc_submit_wq = true;
> > +	} else {
> > +		sched->submit_wq = submit_wq;
> > +		sched->alloc_submit_wq = false;
> > +	}
> 
> This if-conditional, I would've written:
> 
> 	if (submit_wq) {
> 		sched->submit_wq = submit_wq;
> 		sched->alloc_submit_wq = false;
> 	} else {
> 		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> 		if (!sched->submit_wq)
> 			return -ENOMEM;
> 
> 		sched->alloc_submit_wq = true;
> 	}
> 
> It's easier to understand testing for positivity, than negativity.
>

+1, will do this all in future patches.
 
> 
> >  	sched->timeout = timeout;
> >  	sched->timeout_wq = timeout_wq ? : system_wq;
> >  	sched->hang_limit = hang_limit;
> > @@ -1100,23 +1105,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >  
> > -	init_waitqueue_head(&sched->wake_up_worker);
> >  	init_waitqueue_head(&sched->job_scheduled);
> >  	INIT_LIST_HEAD(&sched->pending_list);
> >  	spin_lock_init(&sched->job_list_lock);
> >  	atomic_set(&sched->hw_rq_count, 0);
> >  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > +	INIT_WORK(&sched->work_submit, drm_sched_main);
> >  	atomic_set(&sched->_score, 0);
> >  	atomic64_set(&sched->job_id_count, 0);
> > -
> > -	/* Each scheduler will run on a seperate kernel thread */
> > -	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
> > -	if (IS_ERR(sched->thread)) {
> > -		ret = PTR_ERR(sched->thread);
> > -		sched->thread = NULL;
> > -		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
> > -		return ret;
> > -	}
> > +	sched->pause_submit = false;
> >  
> >  	sched->ready = true;
> >  	return 0;
> > @@ -1135,8 +1132,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >  	struct drm_sched_entity *s_entity;
> >  	int i;
> >  
> > -	if (sched->thread)
> > -		kthread_stop(sched->thread);
> > +	drm_sched_submit_stop(sched);
> >  
> >  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >  		struct drm_sched_rq *rq = &sched->sched_rq[i];
> > @@ -1159,6 +1155,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >  	/* Confirm no work left behind accessing device structures */
> >  	cancel_delayed_work_sync(&sched->work_tdr);
> >  
> > +	if (sched->alloc_submit_wq)
> > +		destroy_workqueue(sched->submit_wq);
> >  	sched->ready = false;
> >  }
> >  EXPORT_SYMBOL(drm_sched_fini);
> > @@ -1216,7 +1214,7 @@ EXPORT_SYMBOL(drm_sched_increase_karma);
> >   */
> >  bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
> >  {
> > -	return !!sched->thread;
> > +	return sched->ready;
> >  
> >  }
> >  EXPORT_SYMBOL(drm_sched_submit_ready);
> > @@ -1228,7 +1226,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> >   */
> >  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> >  {
> > -	kthread_park(sched->thread);
> > +	WRITE_ONCE(sched->pause_submit, true);
> > +	cancel_work_sync(&sched->work_submit);
> >  }
> >  EXPORT_SYMBOL(drm_sched_submit_stop);
> >  
> > @@ -1239,6 +1238,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> >   */
> >  void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> >  {
> > -	kthread_unpark(sched->thread);
> > +	WRITE_ONCE(sched->pause_submit, false);
> > +	queue_work(sched->submit_wq, &sched->work_submit);
> >  }
> >  EXPORT_SYMBOL(drm_sched_submit_start);
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 06238e6d7f5c..38e092ea41e6 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  	int ret;
> >  
> >  	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > -			     &v3d_bin_sched_ops,
> > +			     &v3d_bin_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> >  			     NULL, "v3d_bin", v3d->drm.dev);
> > @@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  		return ret;
> >  
> >  	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > -			     &v3d_render_sched_ops,
> > +			     &v3d_render_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> >  			     NULL, "v3d_render", v3d->drm.dev);
> > @@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  		goto fail;
> >  
> >  	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > -			     &v3d_tfu_sched_ops,
> > +			     &v3d_tfu_sched_ops, NULL,
> >  			     hw_jobs_limit, job_hang_limit,
> >  			     msecs_to_jiffies(hang_limit_ms), NULL,
> >  			     NULL, "v3d_tfu", v3d->drm.dev);
> > @@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  
> >  	if (v3d_has_csd(v3d)) {
> >  		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > -				     &v3d_csd_sched_ops,
> > +				     &v3d_csd_sched_ops, NULL,
> >  				     hw_jobs_limit, job_hang_limit,
> >  				     msecs_to_jiffies(hang_limit_ms), NULL,
> >  				     NULL, "v3d_csd", v3d->drm.dev);
> > @@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
> >  			goto fail;
> >  
> >  		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> > -				     &v3d_cache_clean_sched_ops,
> > +				     &v3d_cache_clean_sched_ops, NULL,
> >  				     hw_jobs_limit, job_hang_limit,
> >  				     msecs_to_jiffies(hang_limit_ms), NULL,
> >  				     NULL, "v3d_cache_clean", v3d->drm.dev);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index f12c5aea5294..95927c52383c 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -473,17 +473,16 @@ struct drm_sched_backend_ops {
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
> > + * @submit_wq: workqueue used to queue @work_submit
> >   * @timeout_wq: workqueue used to queue @work_tdr
> > + * @work_submit: schedules jobs and cleans up entities
> >   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> >   *            timeout interval is over.
> > - * @thread: the kthread on which the scheduler which run.
> >   * @pending_list: the list of jobs which are currently in the job queue.
> >   * @job_list_lock: lock to protect the pending_list.
> >   * @hang_limit: once the hangs by a job crosses this limit then it is marked
> > @@ -492,6 +491,8 @@ struct drm_sched_backend_ops {
> >   * @_score: score used when the driver doesn't provide one
> >   * @ready: marks if the underlying HW is ready to work
> >   * @free_guilty: A hit to time out handler to free the guilty job.
> > + * @pause_submit: pause queuing of @work_submit on @submit_wq
> > + * @alloc_submit_wq: scheduler own allocation of @submit_wq
> >   * @dev: system &struct device
> >   *
> >   * One scheduler is implemented for each hardware ring.
> > @@ -502,13 +503,13 @@ struct drm_gpu_scheduler {
> >  	long				timeout;
> >  	const char			*name;
> >  	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
> > -	wait_queue_head_t		wake_up_worker;
> >  	wait_queue_head_t		job_scheduled;
> >  	atomic_t			hw_rq_count;
> >  	atomic64_t			job_id_count;
> > +	struct workqueue_struct		*submit_wq;
> >  	struct workqueue_struct		*timeout_wq;
> > +	struct work_struct		work_submit;
> >  	struct delayed_work		work_tdr;
> > -	struct task_struct		*thread;
> >  	struct list_head		pending_list;
> >  	spinlock_t			job_list_lock;
> >  	int				hang_limit;
> > @@ -516,11 +517,14 @@ struct drm_gpu_scheduler {
> >  	atomic_t                        _score;
> >  	bool				ready;
> >  	bool				free_guilty;
> > +	bool				pause_submit;
> > +	bool				alloc_submit_wq;
> 
> Please rename it to what it actually describes:
> 
> alloc_submit_wq --> own_submit_wq
> 
> to mean "do we own the submit wq". Then the check becomes
> the intuitive,
> 	if (sched->own_submit_wq)
> 		destroy_workqueue(sched->submit_wq);
>

Got it, agree.
 
> >  	struct device			*dev;
> >  };
> >  
> >  int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *submit_wq,
> >  		   uint32_t hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> >  		   atomic_t *score, const char *name, struct device *dev);
> 
> This is a good patch.

Thanks for the review.

Matt

> -- 
> Regards,
> Luben
> 
