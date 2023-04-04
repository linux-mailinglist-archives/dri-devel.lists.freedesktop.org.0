Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF66D63EB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB0610E690;
	Tue,  4 Apr 2023 13:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871CD10E690;
 Tue,  4 Apr 2023 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680616332; x=1712152332;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mzbUwxTtHKkVw5BUEk5KUZZC8P3efIOyxEGudZm1bME=;
 b=CDchDEfwcZdBBw3mK4ACqf56nu8Fl0NhPYgAE+nhTIufL0TXR9XeP0IO
 CTP4Qthig8nCdq0r+2RtbkJ6nb8l8QVzBXtICHufu1FsQdNuOvV2hws2h
 OsayRDPUN/RTZdSFOhQAFPSkRZTjp3uNVb838plTa/1/8jxJCkbNdYCMP
 X9hafcwogfaFZMOCMzimoPS/B7Q806zLYNsc5WKzTJexkovkmnv8+Q2lz
 3o2feoaJZr48d4shZkyJ61saPwm+rEHg1d08sNGvUAybjGCeXuZO2olHS
 KhQpXmSXbPjPIoNA1DdzOCrtCgEOfjXgGJnBz4s2Y+hdPdQuBCj+fmjxe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="343884252"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="343884252"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 06:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="636510659"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="636510659"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 04 Apr 2023 06:52:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 06:52:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 06:52:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 06:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ke4D0RqVLDojwPhsTYMNy13Z9erqrZSH/c46o93xFpdIM/CafISd/6BAIssF4kfdixoLdyIkpTQptwLrYEeodAKjwXMM+lX6ceqYZVWiOw8PN1aidFK6/SbYfEqBmm4X+SNZQstReOSHChaW9ieaSSrQrcGEPXtaV0pShQkHKKKnclGDdf/JxH6BR57tTmK0f8b4OkEgNNLtsqkB8FOdveqFAcRfvaZkDYrTTPMXImrGenBBf6zh/1P/USlINWxO9eyY5xgN99eSg94O/2aQt0DsCpm8IoVkdHiad+o0sBZ/GSKIqfQ+p0LMQTbwhaqdbWgz5oPS4Xo/Uc9pFZShjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLjwoWQAlaSakIbTZd7+386eXfHZQN19zMWCFdoqGOw=;
 b=lr20jSQSf8Jn0ZhYWm6UPy2DxukbOqOzjKJtZT1fvQtlQP+8hgP7cYlEttYwchCFdDcPRuJzu7Q7SphliGKKdxnyUW2w5UBTIegozJNEDHaMqJTlfT3omshazF9DuhhsF8EyIl05va2Rwokw2fVydJ66q893XEuOHx/6UMR39ARcVovfbXOymNJ1FzV65Bvx5AHwXbzMosdbG2HNqyajCadfK2uPkY8hRojx29xmRTaiC+mEg7hKfconPC+1w+IzOVU6lYh9ZHTJ94IJ3toIJF+U4KbdpJ36rjt3BvRAYEOsCl7VbUBU0FhNWmpmdDd+iOD00qVrgX2+wats81Ccng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Tue, 4 Apr
 2023 13:52:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 13:52:08 +0000
Date: Tue, 4 Apr 2023 13:52:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZCwrgvAHGvdTCe7K@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <15dafc15-332e-2559-a9c4-61ad442ef44a@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15dafc15-332e-2559-a9c4-61ad442ef44a@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cee67ad-32e4-4824-839a-08db3513c82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VlOR4h6FDA1MWeiRDrhUmr22A4igraMVwbO49mFpyCp933whj4mmq3rR5ovl6m/QKc2YpFyTSZy0ugBuIYSBgtTcaHGBisrk4jLJPjgTrw8Rz7RTXdXp5WCjFH1ZZDgyncODhCi9SxXkRzutKLYGY/GfUoaMFhmVfJFmsvzBiL8xlKbmXZnLKvD0j8fWZh4yorqd6iLOveRIc6wWjXULLYJaWHVsub/2Uz5Bub77G99/6cUi7dSRElOxgG1IydC8ZdQliD1WhIYXeqnLKsdua2FkXE/j2eVp3f3RYSE/t9bXb8x7XvZZIpxOfJR+F7cFPE7cbSW/+xnUmj15qVBAcuX2X7CDQTukCCsC++y3eYFd54voieaBv/eE/EjYjB9U98FMCxMmfxDkUPGgqRR23TyJfIfWVzweIbfNstnh0vyCwdranxtWkuqa/+60Whc1EQgXY86kd60ncAykmcW12EUSzRIsfU6FAf4Mr2MtUR9zq0m5vqxPbU5EG8bH1RND0EgX28gZOYxQXuKyLeJVaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(41300700001)(66556008)(66946007)(6916009)(66476007)(4326008)(316002)(8676002)(8936002)(5660300002)(7416002)(82960400001)(38100700002)(83380400001)(53546011)(966005)(66574015)(44832011)(6486002)(6512007)(6666004)(26005)(478600001)(6506007)(186003)(86362001)(2906002)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DbTvqHvC0PPItiLAcQz3w01GMOqtJpl0clkZxzDg2hT+oltzx2SJctPlg6?=
 =?iso-8859-1?Q?1hPppRG1DQ7VgyG1YxH0nceROOBcPobFdUDHFLaXmJc7qwfCQY4LRk19cn?=
 =?iso-8859-1?Q?hDGUJVFSguAofzCiC0EjvUdHnRewnztnfULo0nqajE07J2tGdthrKcysNN?=
 =?iso-8859-1?Q?DDClH0m4NBJCxyTS9aLvx4itZoNg0WwcK1YTvz/xo4xen1YHBFPE9uVwRU?=
 =?iso-8859-1?Q?aBMmPk57DA7MS4RC+91MqohRMSIPqtNkwbc6OKkEe34F2UlkHx31K71V4p?=
 =?iso-8859-1?Q?cVb7Q0hPQoRGMSKz43Svtb7HabKsFuDMm10MAh9QWR3FGkAvsfuNk1u7pm?=
 =?iso-8859-1?Q?/OM0sHzmkDBHAw9np5B6HHMp17gmuvsoQUZOXLVQkVIHfKLy98dxwR2LhB?=
 =?iso-8859-1?Q?CgBfpW9A/rghv4MvsAdNAiyroyJYIcgz+gISqUU2xhvfMqKUQm6hENLQG/?=
 =?iso-8859-1?Q?qybAlWBVwvpxmlEPEK8Tl8Y5UaEYsrgjS708Qws8mgtBB1DtqcwccF8jru?=
 =?iso-8859-1?Q?EOXfe3fJ0zG4gnwzidvMXLsKMRUZwV6lNxwjgberARKTqTe5vhefj0Q+a7?=
 =?iso-8859-1?Q?OVo62vslM6XlgpyTXdKAT4lpFKl4EwXioZ3lDfTtaJkNQu+pRXeDAcJQZ4?=
 =?iso-8859-1?Q?ce8qeXm2HVoItEwC/kGb11ewJWU5bWKTN+meKpAU8vnNxKN+S8oiG35gKj?=
 =?iso-8859-1?Q?EMvsiAbQNJFOV6t2cniLDJXtzCNDjqOUSRhVW/hmFZPJHIZqT0Ehq0YqDX?=
 =?iso-8859-1?Q?5YrLaOfcjH3oTAX/R6KtUhkxtxaZYAFiTKfm4YRMR5EynBa32uYPAaFgJL?=
 =?iso-8859-1?Q?UEwqADsWkxxPgpnrBgLAHdb+W3/6ZB3cj+5m5+O0jN4kgWYq7WmbJS+Z+b?=
 =?iso-8859-1?Q?Fl/jzHnBUNXCbvlmJ9tUfg1CDmLDqtte5nWhZ7/KtQ+LSjvFqgIIjKrJRQ?=
 =?iso-8859-1?Q?IEYL3hRDqRduGBegoh9eJMZJNTImRSWZR0wjcFUTG7gRWRxYNcNZYu5wye?=
 =?iso-8859-1?Q?NQ+zG/sgcu7RlA4j1Z/fn4PyLFpIgy3B83f50A/mT8S/HejvVvBfU14DP+?=
 =?iso-8859-1?Q?sirEBWYXWimbLBxNAP/8K1uW8BofJhHl+zThOArm3pe9+m9Q5YiR9GizPg?=
 =?iso-8859-1?Q?zIbpzXxCmKY+udJtROz0ctq5A78GFUsOLJa+uylPEDF9VMJw4sc849CIZT?=
 =?iso-8859-1?Q?hSi+h4T6OeuDwmK4wLP5/A7vD3PSQq0I7NFfqZf98uxm8Bjosmc8ljFBOD?=
 =?iso-8859-1?Q?i4qUtB5s4iREB5KEINVkYKhlps8XmtsN2Ctiqt8g3SzdHB1nyU1o0xyqmt?=
 =?iso-8859-1?Q?GZV74viSRRz+FJbmWxDHB4snpu1SHLp2OHoKUDl/QlcYz9TMq7mNu18nDa?=
 =?iso-8859-1?Q?8LWG8KOqsOULFZtJETi7S6IF74HCxYzsBS3X5M+e25yBtAsXDhjgXVfXik?=
 =?iso-8859-1?Q?nllK9KFu/6X3vZGBnCqyEz3FVb5JxrenKWMnoK3iVnyvwgHMbaLAEeIQa6?=
 =?iso-8859-1?Q?zxz8g9ZBVIy8IGQ8BAvk7vTyA9S4n9E6wy6m7luLD1YZpok+ftLD8xW58t?=
 =?iso-8859-1?Q?Cx10G/p80hAMOReCjwNbnEneuMQB/CugPfHfQA9w9uU09cxo7bnfgWE8Gy?=
 =?iso-8859-1?Q?cubp4s04KJw+5SduZBBj2m+uLmPs6a2oaoDmd8fjawPmsEHoVgopMxyg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cee67ad-32e4-4824-839a-08db3513c82a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:52:08.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hB85YfM0YUa56O3CNdI+I9ztS9JWs7MH3yj7E8dnjhGFG475g9HhuV+toIH5MI8GYFH4Pg7aQNmMvjtIcb5YTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

On Tue, Apr 04, 2023 at 10:43:03AM +0100, Tvrtko Ursulin wrote:
> 
> On 04/04/2023 01:22, Matthew Brost wrote:
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
> 
> Once you add capability for a more proper 1:1 via
> DRM_SCHED_POLICY_SINGLE_ENTITY, do you still have further need to replace
> kthreads with a wq?
> 
> Or in other words, what purpose does the offloading of a job picking code to
> a separate execution context serve? Could it be done directly in the 1:1
> mode and leave kthread setup for N:M?
> 

Addressed the other two on my reply to Christian...

For this one basically the concept of a single entity point IMO is a
very good concept which I'd like to keep. But most important reason
being the main execution thread (now worker) is kicked when a dependency
for a job is resolved, dependencies are dma-fences signaled via a
callback, and these call backs can be signaled in IRQ contexts. We
absolutely do not want to enter the backend in an IRQ context for a
variety of reasons.

Matt

> Apart from those design level questions, low level open IMO still is that
> default fallback of using the system_wq has the potential to affect latency
> for other drivers. But that's for those driver owners to approve.
> 
> Regards,
> 
> Tvrtko
> 
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
