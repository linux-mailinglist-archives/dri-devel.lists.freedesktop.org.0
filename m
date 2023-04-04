Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D26D62BA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12FD10E2F1;
	Tue,  4 Apr 2023 13:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFE410E140;
 Tue,  4 Apr 2023 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680614633; x=1712150633;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eNCATYE9IQ2RtLJmE3xm83uiqREi9nuQPoNzNKpcdVw=;
 b=YFcRjhLHePlPNd5C2Q0ZhM4QzffBe8z5xKMP39XvkMewfukHIQ86xbS1
 fHQZMdrAkKbjtJ5bxRzQhW6n6lbqxXh+0I89KJG97vZkAp09GFE9EWZEh
 6PH9plKW8gPW4C+rSRjHf8Ai6Rzcnm54w+CXfj4ho8Nu/aM9m0uH9SmN0
 Waw+DnsKFYwyf6zE+M4QE1BfSi8f4hVypz8DJYS9RAKTb56RfyJs8EyiP
 15xGXnLi2y8s9u66CkguBxakUZH1OHEWRK6ctPP2e7nFeobgg7PLazySV
 YWzQrMlXMWshM6xxma5LOpsesWD3nr3Ue3H8d83O6+yGT6qn2w/fqUI0I A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="330766825"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="330766825"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 06:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="797516812"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="797516812"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2023 06:23:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 06:23:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 06:23:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 06:23:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU7d9uYvs9SAJ4UASxbImF0la2mYPU2Uzhi5YJ+ow+GUB7w08U3P2cyjUw/JR95SgLnaIwDK61C6iyCWpCja3TDvJ0kEk4NWOSgPNowhYvEjnaG6ZekTSxICed3jdO/Zl7tpyOsZxNjsUV14i0PXfaX3R5lQO6QzXb4cSUasyRcM43Fn68wslCoZ4rc1/d9kEhehgn77HpvWJtLwpcLua/a4FgRw+eGU0iMqou0FYDIolXaobIeaiIekkkLZJNnA2zv+hFPyWDew6ENh9spX5m78NPkegGu/BnZqL+qZO6QVoFL9NDP51NaTwC+goYYjbghYr8MNi1lUWVUtlMq9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vEgaRCfUlf2Q1NPcNNcpzfuz/6+2dgy91jwew29w/4=;
 b=EuTONwiEdUE+dCi3HztHOQriS4Gf9z6dIDDWPOvZKEoD3JgGSK4ymRAa93bPsVeXJccWD8bNa5LNFH5Veh6bdXOv/kNFBqovEdnPhZVevRLtwvgH+BlahuwMo+KBa0nmDniREaP3SIFtawzhPzCJ0I696OAQchqEA/dvCU0Dxu6f9EW1t3cZg42ABN1VY8IVlDSCruBxn4E0waSpuDDvLCXdkCxtn9hQDdESoa5kMqNdiv2PNlVgo1DV+rDOvRYr1tXq4Tf2d5oalpnPDi2vRRM3Cx1nlFpOQSKwAg+Q+aEso6tmw+8sQtAVll5pj9md0bcR0wDDod+Tj6V5BB5DEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 13:23:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 13:23:41 +0000
Date: Tue, 4 Apr 2023 13:23:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZCwk2IB21wGvoMPK@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <1f89e43f-fcf0-80ad-4319-26e3dfe8b0c1@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f89e43f-fcf0-80ad-4319-26e3dfe8b0c1@amd.com>
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b25f323-c37e-4ba5-7436-08db350fcee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +uKqiC5HkI8fnlJsY/7IyGfCA0qp4rqZIGcMVWjT8ZKtF49v5EInX9VmYvoY7iUT3fsbrAoKSEy8Cl/UaXGIlsWKKve6T9D9WDTEIHou/30cuMhnIT41bEOT1IV+KfkVrBWy/pTbN3RJVwp499jHnKf2oPmN/+v/PmJdb6ivDD8KweYaF4WOHnMC6Jvno4g8HNGztmHKgBsTg5/Ll6yDd8jytgMDO8OHO7YpMOfG3R8hvy316pblJyGMLGok7eQ4JXEEtYoW+4riOloC7ZMqSo04bVKIUEru1z8Uv8uY+r5hA0D+Lc64snybAlgUKYqlWwUHihxNubhj6yuPfJVIhC9e2uH9R33FkDXAeFotSa9E5chwkiv/FG2Jb4vfC9RPvmub6xQqCrpsTBFb+8x5m3FTFlLvfLQopFWC+BVwgBgG8iLyAfW21h4TWw4DZ3t6J4YvzBAzr4nZ5ehWfTzi+VIFFxeZsdyDwjIizmxM1N8vGg+Hp7xgCpn+JT/6YkfvPnBz/PJlSysF0LfnCdXR4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(6486002)(966005)(5660300002)(82960400001)(478600001)(38100700002)(66476007)(4326008)(66556008)(66946007)(6916009)(86362001)(8676002)(41300700001)(316002)(8936002)(44832011)(186003)(26005)(6512007)(6506007)(2906002)(6666004)(66899021)(7416002)(83380400001)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Lq6W91SnD2LZ3ry5xZLewrUq/YZOjZEG1jxBILSz8QtzwgZoQCK5y2GbKt?=
 =?iso-8859-1?Q?RZc9AMqRkWeaxU6fgOU7OkHlPX7euXdB/dgggWDue1OAYIPJra1g3HviHG?=
 =?iso-8859-1?Q?Xvh+fhTlqDxM8/ZGqc94S46+wnzc1E4LdTJqooTLlDHIss9mh20eGPVgoM?=
 =?iso-8859-1?Q?ZbrWIEjSabb+NbBFLfg6Ds7uPoRMNqoLf8mqF9nqlGkl3oxubwleWD6NAA?=
 =?iso-8859-1?Q?IZ10W8CrmhDqP35UHQM5ZqQ2DBj5cv+HOcE2w3+jxWixtVmU+9RSStprw1?=
 =?iso-8859-1?Q?ILduwRXUPWzRgb1dQ2CsC9KZ5vZLCJ79OZpgtIi/dIdQmalBbNe6UVTHOq?=
 =?iso-8859-1?Q?GpVpGFDX2fx4BleeilNdhCe2NNaon5uEpdkaj1BRtrlipPguVTEv7CVizK?=
 =?iso-8859-1?Q?vX8BvaILOFZ6uYprMFY9hhSm3QOVBL5oum758WW/0MW5UBlRbMOqPxEdoT?=
 =?iso-8859-1?Q?NDYnn3cgltjRlnmMDSp9OObrxo7MfLCRzEO+rpBb/RtirV8NL5SOirOHO3?=
 =?iso-8859-1?Q?e/PFYTEW9WEgRopngh1nb89C9BzgK89JVXZ8NleOieeB7Txp/TXY8xV4J5?=
 =?iso-8859-1?Q?64DauP7LdwBLtbx0IRAE71d2EtT+Db/5QGIhvDR4WmdHMMaI5W1jEbhqgA?=
 =?iso-8859-1?Q?pgJfj0Afo8yVi49+4umoaZKqQzlyAbfLUSJVgZr9WdVSf6ufSfB4GXdRUa?=
 =?iso-8859-1?Q?YVLsOaEphZ2EEyMi1v4CIP1iYYq4KKLqVsy8zPMB9VFKQtU5wIqvEd2rRk?=
 =?iso-8859-1?Q?8CASVy7C0DQEa9xkGcVDeRCPch8kkm442nxj/WmZMcphc/q8GjFVyyCiGi?=
 =?iso-8859-1?Q?7b+qH9xEq7xwEDN7wQ4MoHqPRsNeZ7zElobl01FeeQRq75CkbLqZ6eVwhl?=
 =?iso-8859-1?Q?aN5k4AeCSudfRfrS0vuJCOwMVjbyN0FZpiKcDE0715W8aoJYUhLWI3jM5N?=
 =?iso-8859-1?Q?//W8dMKSyo1Mdo+nzzquAmBKXxxtRP4OCpZA0a/uzjcjWju1KLcZxToeJt?=
 =?iso-8859-1?Q?5VKvwRcz7trIAJ7cJSnchONTZKbFmRbPG+ZDuCE7ivxiLDllWM0gNSb/uC?=
 =?iso-8859-1?Q?y/j6Ev7VsTisDfi27epMhH+DUhbr/nDUh9wJX0eIJECgel+aZ9SOfMl2nx?=
 =?iso-8859-1?Q?Enf6YbStiTi14YpIRz7meCyXV+edM+rUdftGc45IMxzJdAiLSHZunvL/39?=
 =?iso-8859-1?Q?jYrD2ahSxhvDlivtnPEo7tdhwlgTvrz/HxZjTpL0zXTsdWBQDgajOqhnJY?=
 =?iso-8859-1?Q?zW5B01zPI4BaWRiUX4OuYuYTGdf8uGzpOOphzNK+/aDQJbcIH4OXF8j1H8?=
 =?iso-8859-1?Q?FUa/koFW21P9l3u4IOWgmzdgEgUqeGGDOP3nHjAEq0z4dy1PfHLK5Syh6y?=
 =?iso-8859-1?Q?MbKb3Yif56GRoBAke25lkUlEEIJNhNLlWX5/R6lxzDlg2QOrXgXrpseF95?=
 =?iso-8859-1?Q?kjmtsuyN3Fm0t9kiyUAkiPnMtDnAHa3f4ApKT7ewesc4+R3HD9mgsOm7W0?=
 =?iso-8859-1?Q?s8Wm+qZeJixuotcX6bRm+Tq0FEh/DNg1Y+k45HWlw1F/aFhH7ztou5IBf3?=
 =?iso-8859-1?Q?qUvm0R1gHFeYN0PmuTofEQPjLLi6PBwFt9Kpt66e5uuu0FPcBDW/DMISjL?=
 =?iso-8859-1?Q?bhEOPh0OMckaGoCNGEvKIonjnluQcpzA0fN78hAhp9HXV5HWcvvkbv7Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b25f323-c37e-4ba5-7436-08db350fcee6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:23:41.7197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QScPpObhky+oebpkD7VmZ3/PxpmaFTK+Cu8fWQ4oxMpuUctBrzOpi2MpSWPJzOeCkfvQBhPRYzhn989AlTmnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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
 lina@asahilina.net, dri-devel@lists.freedesktop.org, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 11:04:54AM +0200, Christian König wrote:
> Please make sure to CC Luben on scheduler patches.
> 

Sure, figured I was missing a few people.

Matt

> Regards,
> Christian.
> 
> Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > Hello,
> > 
> > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > have been asked to merge our common DRM scheduler patches first as well
> > as develop a common solution for long running workloads with the DRM
> > scheduler. This RFC series is our first attempt at doing this. We
> > welcome any and all feedback.
> > 
> > This can we thought of as 4 parts detailed below.
> > 
> > - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > entity (patches 1-3)
> > 
> > In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > severals problems as the DRM was originally designed to schedule jobs on
> > hardware queues. The main problem being that DRM scheduler expects the
> > submission order of jobs to be the completion order of jobs even across
> > multiple entities. This assumption falls apart with a firmware scheduler
> > as a firmware scheduler has no concept of jobs and jobs can complete out
> > of order. A novel solution for was originally thought of by Faith during
> > the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> > and entity. I believe the AGX driver [3] is using this approach and
> > Boris may use approach as well for the Mali driver [4].
> > 
> > To support a 1 to 1 relationship we move the main execution function
> > from a kthread to a work queue and add a new scheduling mode which
> > bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > The new scheduling mode should unify all drivers usage with a 1 to 1
> > relationship and can be thought of as using scheduler as a dependency /
> > infligt job tracker rather than a true scheduler.
> > 
> > - Generic messaging interface for DRM scheduler
> > 
> > Idea is to be able to communicate to the submission backend with in band
> > (relative to main execution function) messages. Messages are backend
> > defined and flexable enough for any use case. In Xe we use these
> > messages to clean up entites, set properties for entites, and suspend /
> > resume execution of an entity [5]. I suspect other driver can leverage
> > this messaging concept too as it a convenient way to avoid races in the
> > backend.
> > 
> > - Support for using TDR for all error paths of a scheduler / entity
> > 
> > Fix a few races / bugs, add function to dynamically set the TDR timeout.
> > 
> > - Annotate dma-fences for long running workloads.
> > 
> > The idea here is to use dma-fences only as sync points within the
> > scheduler and never export them for long running workloads. By
> > annotating these fences as long running we ensure that these dma-fences
> > are never used in a way that breaks the dma-fence rules. A benefit of
> > thus approach is the scheduler can still safely flow control the
> > execution ring buffer via the job limit without breaking the dma-fence
> > rules.
> > 
> > Again this a first draft and looking forward to feedback.
> > 
> > Enjoy - Matt
> > 
> > [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > [2] https://patchwork.freedesktop.org/series/112188/
> > [3] https://patchwork.freedesktop.org/series/114772/
> > [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> > [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> > 
> > Matthew Brost (8):
> >    drm/sched: Convert drm scheduler to use a work queue rather than
> >      kthread
> >    drm/sched: Move schedule policy to scheduler / entity
> >    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> >    drm/sched: Add generic scheduler message interface
> >    drm/sched: Start run wq before TDR in drm_sched_start
> >    drm/sched: Submit job before starting TDR
> >    drm/sched: Add helper to set TDR timeout
> >    drm/syncobj: Warn on long running dma-fences
> > 
> > Thomas Hellström (2):
> >    dma-buf/dma-fence: Introduce long-running completion fences
> >    drm/sched: Support long-running sched entities
> > 
> >   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> >   drivers/dma-buf/dma-resv.c                  |   5 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> >   drivers/gpu/drm/drm_syncobj.c               |   5 +-
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> >   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> >   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> >   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> >   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> >   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
> >   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> >   include/drm/gpu_scheduler.h                 | 130 +++++++--
> >   include/linux/dma-fence.h                   |  60 ++++-
> >   16 files changed, 649 insertions(+), 184 deletions(-)
> > 
> 
