Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4437BA234
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 17:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CDC10E421;
	Thu,  5 Oct 2023 15:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7896010E420;
 Thu,  5 Oct 2023 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519263; x=1728055263;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DEnI5MWjbOBW3c1wM7YqJoe+NR/cZ8+8Gbx59qDm6dY=;
 b=grnLaUK3Y0kbupNKlntax/Nxx/fz7VW4ISSyn23zJyLXKhkI5iIyreCL
 gqO4GfDQohS53OdIoKbdcz+YINQ930iO1AjaCWnq1tnGjGkcELzYJLqqf
 9NKHocJkVMW0XVGgI8lY8fzUaViX9JAXowaOvVH3VASMxlIEUubhYHipR
 wL4gDcTW9palqGvFbXJdK+awYDxxnopbUG89qCBFBfJ04Jzjwybl+l391
 fKHHOVnwBY0+Tiv94yN1TWNE/RI56DTBTab0crP9rLi+3uXu9+zZ3Ubkn
 sV3VNaGvhY707Hj7g3ZryxGrRbsNtv+9D5/dy5IPPA+ZhFmaNqxuePA9N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386358576"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="386358576"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817641204"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="817641204"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:21:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:21:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:21:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:21:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:21:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKETVUZYtv9/sEg9RjFDVOaZtfOcXU/8HSSVkf/lBmQlRhqNiYdIhs1HUXzLF+O8VPwwNot2eD6xZeM8Kj1Rn6z4N/2JylaJ9+rOOX+Yk5GkbavdDr+j4M02S4jI3R96uiTqRKJliOnW8IJspoK1numKQdH8zXhaRSrf5OUorbOGF7c1/WKlK3rRTVvcaXUlwKj9y2/TIfiTSTYe9PdAWMXN7o/QhrPxcEoUdhGci0bwSBSmL3XO+JwAAD+Gqpao/kbr4/XLo/yTGC1+lf0S/rnHS7QGpNYR8+r9+5RsWTC2LSfuIy7+971ds7aHqaqg/ljmlZ0ZHkTtADHH32GPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhxN1m0lQc056z27+V39zhTTZDetKU+63qjNUgv7UvU=;
 b=KnA5d/khGw5sMGfKjKMFNbHgXH7xjmFu2/tuGGu+U7CyuLDjEpz0uGl7wNC5HhvpYxHQTr6kaFYenC8b/1ZgxWBaDoa2wpL5vQtJvDFJLfyjApbm79UKbhf4tWcMeYWYvKVzzT1qJ94O0ik/7XGq2wrIX/Ey4RikczJXcXtMy2U7pP19nTVFtxducIOfHaPrqBghAnUGl72u6oC467ynOt9mpW7W68fmnHLw/T/oBBkVRdbCZg3lfjtdaC9FgCUUfraDy2leUo4DkWO20bVEj2+gCDEeEM4AHMi/B/Pz+Di3JunNl3jhbyIMtb0WdvVKUpIMDhQcbqp49TeOCpbcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Thu, 5 Oct
 2023 15:20:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 15:20:59 +0000
Date: Thu, 5 Oct 2023 15:19:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 02/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <ZR7UEUlQBHad/LN4@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
 <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
 <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
X-ClientProxiedBy: MW4PR04CA0111.namprd04.prod.outlook.com
 (2603:10b6:303:83::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 10160a35-0d1c-47cc-1e0c-08dbc5b6ad80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UnOfJ5QYEQj7cx1f5zfb6+b+HViSaq6wQRfCjKnFwBk0N1R5Oue+FXfaNCaWHHeKLpXnCtgx21HIsHkZfoN7jz01SX4ngVPJKHOC5CCoNx0rjkG48wIamVj/NIkpxGF3tUha6p6jxqpGO5mka/c4RDS0tTVjfryqtkADR79cj5iQzBx1LCX8uGT1hqs81BGxaJV/0jvdje/9VGw905lrIVsQLf4Ib5RWD2dt/f2qGSqKft/Ls+tM5Mz3hLUuLcpiw7zavr1fFj5zAqPNCi0fQHyu9A58RuOrsRYXcloA67NkFW4b4hFukj3oUXTTROtn274xoBxcWhkqYCFhA4HWpXXXsCtSJ6z84dfutCTtq/DvLHvafm3hc6zD3TZmyeV83IvgyFXR1b6MEwqG3q+/kxrElpmfFXJ0Jn94hg5kAo5z575oZ6IKw6ysXePU9xKGV+9oTw9mbHSXeNuzw2fXjbIENHdQwdkAwelm6k/LvoqpnbFwwaPeBVQ39nyNQrZ69GkP/W5pMGDzCUqMfZL3T4VswK8ZAYRnDS1YXHWhbuT21+Z27Hzk8u+KCGQELzZd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(8936002)(6916009)(66556008)(44832011)(66946007)(4326008)(5660300002)(316002)(41300700001)(7416002)(478600001)(66476007)(53546011)(2906002)(6506007)(6486002)(6666004)(26005)(6512007)(38100700002)(83380400001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpwTIk+Z03ZL/u8Zuwfe8lapri4hIAHYNnhd2g7rPsrBKSYY+KsFXcCwQcPN?=
 =?us-ascii?Q?YXOZ0lDaP0YpwtHveBit2PZoK1oFtIB9SXnYkzVrE3BIPNLa24avYYR43EUh?=
 =?us-ascii?Q?Y0KVfUYke6z4D0y+qD6ZwUCjYPomHcXnTi3Bp6reci980CvOaQi5KFVDNCl/?=
 =?us-ascii?Q?Q2RiPfxbdgCddhW8FwpF8U0b/tP9EvVbCGdBoXUIQ5DScuwhsfnDumuyRlKO?=
 =?us-ascii?Q?xiA5K+zK1Ze29xyqYHTXNS0mFCsPMUlGGHj1Jr0txm9IEyq6EZtOjfK7BKSO?=
 =?us-ascii?Q?5jKN/n9zvPmXdu1o/bRIRaFgBY1KJvEHJSZV/UtJ2n8Q+g16h6AB8OhbiPhp?=
 =?us-ascii?Q?bXiZsbeaEkDaNv3wwpyD4pdGLFIGmnUfCByWJ/tbyD6lvgnZLdXnMrPBvn77?=
 =?us-ascii?Q?rqhRX8BcPKrnfUS6rFfH0NHDm2QZmjtoMhOvyGr8ADfNNsK+S1M8SsJI6LYZ?=
 =?us-ascii?Q?FP5K6yXnGAN01w7TPZ0323EaoaOMzdjwbvM3/CeLOnBnmikGfQ4HdvnfY7qj?=
 =?us-ascii?Q?fWvHrtar0Y8zO9mpcWJV88D1SR/6m9wEECTPLeec3LwAh7pby5/VnmWvq1Hk?=
 =?us-ascii?Q?jzJo18PbEUB6fbbBJElhXeqI4RvPq4DnPVVfjmUgd+5dzkNo5zhdIU5g8O1T?=
 =?us-ascii?Q?1RzMjiIjI5vSBmTkiFHU9Xg744FH7P56+y3bzSkrL9dELJR9yQJgQ6S33YSI?=
 =?us-ascii?Q?sZbkKeV1fUocbKpHXrBQyzqmv+R0akmzFhaZUlVsw1cpUXWbj+ezB+PJoaq7?=
 =?us-ascii?Q?zEsUV0XNYDZc9+vHVTfAJSDNc06Z+RSoRIx5mL66Oh5dHXHbDu94V6Q/V7d7?=
 =?us-ascii?Q?FOPCcND0jg+WwyrnYvbkqT+MDB/NzKU+JthPHWcVn4loSfjs/9GFPJDkpncT?=
 =?us-ascii?Q?PAmGpuTJE9Xl2omxLP11qCo9i8erD1Wy2PNu8eQyYPay5ORnZtEYuntl9xpo?=
 =?us-ascii?Q?GTZW9psu2I74UjTOIaAnkvBd5CevQ9l66nGsoCrGky0UWYGXN0jfIOxYpMoW?=
 =?us-ascii?Q?RfnpRsGhQwRcLc96wuuYDG2F78vD29cARKnnC4TQN0vnXBc6H8nMaTQQ3QnZ?=
 =?us-ascii?Q?w3DkwnZMvouQAY6xFlYWMOvMqrwUlWikQeO+pmb5JIw+u2Apts2+DaxijQwb?=
 =?us-ascii?Q?uh5iWH9goZRSg6Da4gvumFndCJsI2IL7IM7JinAAqMV0sYzHY1GQbCBU7NPd?=
 =?us-ascii?Q?Zrx85bM+C4s9Rbphfel9c+oOb1TIaF+lmYo/+6KTzBp7McPfyualZWoKMkvo?=
 =?us-ascii?Q?DEIL51BtraE+CA7HyoUXNVOLqAUUNCdnE/cO+D6WLFO6KbeQgXpvr2DqXoJq?=
 =?us-ascii?Q?7X+96UTRvaTHMXXeP04aql1/jMmwZZxW5zbPBUgeq7osim2dHR/GnexKS6t+?=
 =?us-ascii?Q?tqzuiYHVEMZ+0bruJGuKWQNgx+S55b3eLX7pY0+kmsDSnsegxRpyQXftcKlZ?=
 =?us-ascii?Q?hdlbBdPgnM/8vy+1WFzLVC1SMn686q/Wfpyb2zDz4tuVvrbFuGB4wdtpwUE6?=
 =?us-ascii?Q?g9RhKZSNf9vG8Uitmfo3Wj7PvQCmGUtmp0ZfUtrqomxhOr4b6gPFZfVgxLQu?=
 =?us-ascii?Q?+IqJCJdP86OGlzcyC3vzJF3OH45WTVenP6eJ+P10HK2EDLUw5oLST7H7+zoM?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10160a35-0d1c-47cc-1e0c-08dbc5b6ad80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 15:20:59.1730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbkbD/eQZKNIZGijZKSp6vImboBLSLZSnwJF9lrsb8xWNhqD2CZZOhbVUzEI5WCa6AdipRhXuBPXcqoCSKfiBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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

On Thu, Oct 05, 2023 at 12:13:01AM -0400, Luben Tuikov wrote:
> On 2023-10-04 23:33, Matthew Brost wrote:
> > On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
> >> Hi,
> >>
> >> On 2023-09-19 01:01, Matthew Brost wrote:
> >>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> >>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> >>> seems a bit odd but let us explain the reasoning below.
> >>>
> >>> 1. In XE the submission order from multiple drm_sched_entity is not
> >>> guaranteed to be the same completion even if targeting the same hardware
> >>> engine. This is because in XE we have a firmware scheduler, the GuC,
> >>> which allowed to reorder, timeslice, and preempt submissions. If a using
> >>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> >>> apart as the TDR expects submission order == completion order. Using a
> >>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> >>>
> >>> 2. In XE submissions are done via programming a ring buffer (circular
> >>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> >>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> >>> control on the ring for free.
> >>>
> >>> A problem with this design is currently a drm_gpu_scheduler uses a
> >>> kthread for submission / job cleanup. This doesn't scale if a large
> >>> number of drm_gpu_scheduler are used. To work around the scaling issue,
> >>> use a worker rather than kthread for submission / job cleanup.
> >>>
> >>> v2:
> >>>   - (Rob Clark) Fix msm build
> >>>   - Pass in run work queue
> >>> v3:
> >>>   - (Boris) don't have loop in worker
> >>> v4:
> >>>   - (Tvrtko) break out submit ready, stop, start helpers into own patch
> >>> v5:
> >>>   - (Boris) default to ordered work queue
> >>>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
> >>>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
> >>>  drivers/gpu/drm/lima/lima_sched.c          |   2 +-
> >>>  drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
> >>>  drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
> >>>  drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
> >>>  drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
> >>>  drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
> >>>  include/drm/gpu_scheduler.h                |  14 ++-
> >>>  9 files changed, 79 insertions(+), 75 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>> index e366f61c3aed..16f3cfe1574a 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>> @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> >>>  			break;
> >>>  		}
> >>>  
> >>> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
> >>> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
> >>>  				   ring->num_hw_submission, 0,
> >>>  				   timeout, adev->reset_domain->wq,
> >>>  				   ring->sched_score, ring->name,
> >>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>> index 345fec6cb1a4..618a804ddc34 100644
> >>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> >>> @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >>>  {
> >>>  	int ret;
> >>>  
> >>> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> >>> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> >>>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> >>>  			     msecs_to_jiffies(500), NULL, NULL,
> >>>  			     dev_name(gpu->dev), gpu->dev);
> >>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> >>> index ffd91a5ee299..8d858aed0e56 100644
> >>> --- a/drivers/gpu/drm/lima/lima_sched.c
> >>> +++ b/drivers/gpu/drm/lima/lima_sched.c
> >>> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >>>  
> >>>  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> >>>  
> >>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> >>> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
> >>>  			      lima_job_hang_limit,
> >>>  			      msecs_to_jiffies(timeout), NULL,
> >>>  			      NULL, name, pipe->ldev->dev);
> >>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> >>> index 40c0bc35a44c..b8865e61b40f 100644
> >>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> >>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> >>> @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >>>  	 /* currently managing hangcheck ourselves: */
> >>>  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
> >>>  
> >>> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
> >>> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> >>>  			num_hw_submissions, 0, sched_timeout,
> >>>  			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> >>
> >> checkpatch.pl complains here about unmatched open parens.
> >>
> > 
> > Will fix and run checkpatch before posting next rev.
> > 
> >>>  	if (ret) {
> >>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> >>> index 88217185e0f3..d458c2227d4f 100644
> >>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> >>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> >>> @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
> >>>  	if (!drm->sched_wq)
> >>>  		return -ENOMEM;
> >>>  
> >>> -	return drm_sched_init(sched, &nouveau_sched_ops,
> >>> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
> >>>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> >>>  			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> >>>  }
> >>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> >>> index 033f5e684707..326ca1ddf1d7 100644
> >>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> >>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> >>> @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
> >>>  		js->queue[j].fence_context = dma_fence_context_alloc(1);
> >>>  
> >>>  		ret = drm_sched_init(&js->queue[j].sched,
> >>> -				     &panfrost_sched_ops,
> >>> +				     &panfrost_sched_ops, NULL,
> >>>  				     nentries, 0,
> >>>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
> >>>  				     pfdev->reset.wq,
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> >>> index e4fa62abca41..ee6281942e36 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>> @@ -48,7 +48,6 @@
> >>>   * through the jobs entity pointer.
> >>>   */
> >>>  
> >>> -#include <linux/kthread.h>
> >>>  #include <linux/wait.h>
> >>>  #include <linux/sched.h>
> >>>  #include <linux/completion.h>
> >>> @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >>>  	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> >>>  }
> >>>  
> >>> +/**
> >>> + * drm_sched_submit_queue - scheduler queue submission
> >>
> >> There is no verb in the description, and is not clear what
> >> this function does unless one reads the code. Given that this
> >> is DOC, this should be clearer here. Something like "queue
> >> scheduler work to be executed" or something to that effect.
> >>
> > 
> > Will fix.
> >  
> >> Coming back to this from reading the patch below, it was somewhat
> >> unclear what "drm_sched_submit_queue()" does, since when reading
> >> below, "submit" was being read by my mind as an adjective, as opposed
> >> to a verb. Perhaps something like:
> >>
> >> drm_sched_queue_submit(), or
> >> drm_sched_queue_exec(), or
> >> drm_sched_queue_push(), or something to that effect. You pick. :-)
> >>
> > 
> > I prefer the name as is. In this patch we have:
> > 
> > drm_sched_submit_queue()
> > drm_sched_submit_start)
> > drm_sched_submit_stop()
> > drm_sched_submit_ready()
> > 
> > I like all these functions start with 'drm_sched_submit' which allows
> > for easy searching for the functions that touch the DRM scheduler
> > submission state.
> > 
> > With a little better doc are you fine with the names as is.
> 
> Notice the following scheme in the naming,
> 
> drm_sched_submit_queue()
> drm_sched_submit_start)
> drm_sched_submit_stop()
> drm_sched_submit_ready()
> \---+---/ \--+-/ \-+-/ 
>     |        |     +---> a verb
>     |        +---------> should be a noun (something in the component)
>     +------------------> the kernel/software component
> 
> And although "queue" can technically be used as a verb too, I'd rather it be "enqueue",
> like this:
> 
> drm_sched_submit_enqueue()
> 
> And using "submit" as the noun of the component is a bit cringy,
> since "submit" is really a verb, and it's cringy to make it a "state"
> or an "object" we operate on in the DRM Scheduler. "Submission" is
> a noun, but "submission enqueue/start/stop/ready" doesn't sound
> very well thought out. "Submission" really is what the work-queue
> does.
> 
> I'd rather it be a real object, like for instance,
> 
> drm_sched_wqueue_enqueue()
> drm_sched_wqueue_start)
> drm_sched_wqueue_stop()
> drm_sched_wqueue_ready()
> 
> Which tells me that the component is the DRM Scheduler, the object is a/the work-queue,
> and the last word as the verb, is the action we're performing on the object, i.e. the work-queue.
> Plus, all these functions actually do operate on work-queues, directly or indirectly, 
> are new, so it's a win-win naming scheme.
> 
> I think that that would be most likeable.

Thanks for the detailed explaination. I can adjust the names in the next rev.

Matt

> -- 
> Regards,
> Luben
> 
