Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6B66627B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 19:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4376410E7D6;
	Wed, 11 Jan 2023 18:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE69010E7D6;
 Wed, 11 Jan 2023 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673460445; x=1704996445;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vkD2VzAQdaHv79Kt32RLAfJDwgzXJEH5aJMQPZ9EysY=;
 b=fy3ecWp6cLgb6jOZtYO/GZcDXlJ0RjindWVQXao8jWVGTtq/+kDijvOg
 Ffep13xju01L/Ah/B2pv6olJMN9SELL4guyohT5WoUVCHcGqM1ZIuxbHn
 oWteo6uqNo2bO6fk3z+DC/8scKOoHnnIozZHiunIJWUFDSWcwkAAl84pA
 FD7wvLYl9pg1Zyv9bksJQXWZYdkyfpMPZnsjrKS4lpnUlkBup5HjTb0lW
 LF4dBsjZD6T1sq84Ntgxqe9piGQCDBMHMrKMDjBZwVJD9WUrWcPxk4mir
 IbPvOJ1BM8NLvPZKO1v+L+ddN6wmD6dzeCx3Dfja6qZV5xztDG159k13d Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324734129"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324734129"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 10:07:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635062214"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="635062214"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 10:07:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 10:07:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 10:07:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 10:07:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 10:07:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSgOoxmYUTHm4NOPhGbj0WVZNvR5YhzS30tlRQxzsJeYakPV5WqmqwUYIqjibUY7AiDLOQqV9bXvaj8ciHgkRIrk9JJlNLFdb7gxhO1Pan9Mw+hZYwCVpaBM5U2ZgKgw6QQFvUskFtwxJNyv0FNHGorG1CT+Nzjtk7OUNUvAQqKU7z1Z3mKKAj3qz8o6R/5H1Nxk7fcQwlG3ZKrZmxa29cQ6KtvzYofnQuDgbDwcM/XgQ789SebE0JOCyTvz+M6we0mxIBerSbbBpyRIfvhoCgN0wUewBawbHlbbzfB5HLYJv4Ae2H9Cj6PkUBBkGHpjfCDSZLQFw2HZejjSJ20qvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HlVY4h1pNu3efjOXWCfiYWxJHmYJvkx70fU7fLwm+8=;
 b=Az11DtnEECBugwUPtyGmS+L2/xatwJ4yIKU5+L/eOaAK0czkP9hI4LpJObWxuKZduakPlHmV7ytjB9JD0j6vVhL7ncQ3Q4/tOl9brgDWV3hLcizDHANjHC8yz7m23jVSgOYgvRT9xgFzDX6rr2MrLWPUZV5nhV0XrzA51vMyjO4m5rRELRQ0ZT3loV3g3X/VxSDbCXx/KtaFIIftBsGqbDBFliB5zxZ9yJN2M2X/0+MuHZJy5l5s1Q3d+/LD2E3ZpzrSoPHSkwz0TsH02V+BcN6sBnE1ThkgGixzvUPabekANvhOe64qSkA0DqAFDY+Wtem4Bk9DWujM2cr/wxLyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 18:07:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 18:07:19 +0000
Date: Wed, 11 Jan 2023 18:07:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y776yIC+iJDlchjo@DUT025-TGLU.fm.intel.com>
References: <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
 <Y72KdvHchbAzbYW2@DUT025-TGLU.fm.intel.com>
 <b3225349-85fa-b30a-319c-604334e2f7e2@linux.intel.com>
 <Y722HdwGKB8swy0B@DUT025-TGLU.fm.intel.com>
 <703310df-21c8-57ac-8b27-4ae342265df1@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <703310df-21c8-57ac-8b27-4ae342265df1@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b27e16b-37c0-4512-fd2d-08daf3feadc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYIbcLGC1M7bswQnvx07x8NYOzg2ptaV+5mqcmyAS+EDRxybjY4W+DlgudyZAqbvRStc3dHy9yP3MFCFcsV9aZimUMfVNCZrEeH9dBNWy5au6Fx8mmpJMj+xcVDrYK1+mUTKUvbTP2GstK42R+sIcQXUTldIazLqoKrkHK4TZ36rLtGrzL8F98+d1Iv0IkF25Uz5Y7pl85iBuLXx/FIsK6azbjb22/yEOy9QYos10cZH5yY4fpsCPSkeFlPc4wz1jw9OfOt9j9qUuJs6zeRp2+xWgmYEQUdGQjlmY/HNJWf+iCCjclZWkiKFoaKzM8wS5Njp0kyldZNcilN8bUiPQRIj2iROr5ooBx4YLerw24SHjxLMV1SYaoLkgeC62TkB3V+roCdokG9rfPIB1QaDQomUqM69FM00ajVXlNDioAcVHU4EzUwbwb/3wyDhtQUJ5j6Y7pK2kt7Spjfvfgid/bBp9DGV4LMvClnqBuZGoAnXhuk3ZGghkMe/w7lBS7vlHt+Muc4IUKmpgAUHrx+YhajFFWDEzT5ojNYz1DNYD4sDzAqGYk5MVXoKgf6h63AQQL0r/ACZzZAxtztasO3jr99IJQ6Jma9vAgBbHAZ0Gd1CuGfSXwtCzKoTvd43dciSF5kUMq7/TEMcZARaKaJ56Y5AOQK13dEbBTMa/8RpoGT/RnoBF3HpHUCQf00S9gXB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(6506007)(82960400001)(6666004)(38100700002)(53546011)(66899015)(2906002)(44832011)(478600001)(6486002)(186003)(6512007)(26005)(316002)(5660300002)(8936002)(83380400001)(86362001)(66476007)(4326008)(8676002)(41300700001)(6916009)(66556008)(66946007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vwV+GC5WM9wdTaeE1us5zmWMJ0kB9yc8YRIlwUptix/LS6Y+Mu9f+tcwEy?=
 =?iso-8859-1?Q?R/q1I7Yq0bKPmjdvGivazBSfLtXGqbtv+8WxFCSRTnH/ucsZBh4vU17MTz?=
 =?iso-8859-1?Q?a8ouxcG/XVnGCl265T9wjs6btU7yKBiM0+7pePbWduPIAP0Vrq3oNXbHRG?=
 =?iso-8859-1?Q?hHEGFFuCM6Szdd5EqO9h2nvB+e8ieKsqqT1SzbnFz7cxT9896Vr+xz8t2I?=
 =?iso-8859-1?Q?q3DiH3dxNJ2IosVR4E1wDl4NQ7/VK5k71V+sl0B58qQC6MsNvliBI8In6R?=
 =?iso-8859-1?Q?md3B+llOThXjf/a+p+J0dCnIANGTCwOQRHYKlZtPWUvFJY+6jkQMDICDfh?=
 =?iso-8859-1?Q?v+yAfZxlekFFPRC4M3B7QjACKuveYvOVzp/MdBnjSI2jTrO1lt1XYnqYOe?=
 =?iso-8859-1?Q?g6p1QsT6Y9gXcfzJFQcP3bJyvlDZpdThx/CkUz1C5+uyXFKmgD9e+Y5uiX?=
 =?iso-8859-1?Q?X+N3G3QNGoOypQv7FcYbLBZ2LhEfiGC6q1MN197L6B0Nf+cLfXNEZvA9Wt?=
 =?iso-8859-1?Q?CeRIJ4fR2UvtpYiNtvDVKAJzROQ4le7fiDGhSZyPNr6kNjjmLyzN+uaRpH?=
 =?iso-8859-1?Q?xGLk2jjyUnKRxJz4MBSvarygPmKAhIooy1vCh+QwDjYufAjBPxzIBZCKwy?=
 =?iso-8859-1?Q?h3DlBF4LorvgODVOoJHokdqqYbxX7Jw6gp1g0kkxNfJ1ZtQGE7tKekOpqg?=
 =?iso-8859-1?Q?RaBHcC52U8Hr5+Q/JtocGt4gxQtUHjVsNv4mYqMaiiHP/Q6El8nERKthLd?=
 =?iso-8859-1?Q?8s8q4w61OGq2CHznEPMUN0Rrt09pusqef6VNI2lwKbOV8XsADaXgor91/N?=
 =?iso-8859-1?Q?b7adpBplI3XpkIVEEvxG2mY9Gv9QZmrYyWFMl0t38eBrCa6tc2hJa88HpA?=
 =?iso-8859-1?Q?edBSMdKAvSxx2slbpcOUasEAYgJdk6s2vq3NWlhT0E0V07AiJj5o/7c2BB?=
 =?iso-8859-1?Q?d+Rdtls+54zL9TsBA1F+hL4rfmYZIYa08ZI7zfGSmAsGY5uG3KKcgL87Ki?=
 =?iso-8859-1?Q?cYgOWiX6TzU1e8Ip6eK2yxPJioZqxROSIAg225wrMQXusMcrORL+UoQvMI?=
 =?iso-8859-1?Q?7tKLMRMh5Pv1xACmHoqBqHZ06MDMQaNUld1y8AiX1T2VnVyE9GARw00sbo?=
 =?iso-8859-1?Q?QyDB/GZuI6+1kf7P10UzpjuXEU8h48Hk+6kiT3Yf6oXZlLxlpFc2XEz4BO?=
 =?iso-8859-1?Q?6wRK9nlYtV/YbWN9R0c8OiCnIpRUfKe3cuLo5rw8kxXmXDr5jXMmXG2GTZ?=
 =?iso-8859-1?Q?NkVP2YcPqwhVgRri55/TGEOsHIZv0iLtcrp4dm76OyxQ9zESkXFJ7RBmkv?=
 =?iso-8859-1?Q?qUG6e6fCAFf/yjGfrLaNlkjf8s1xIMKCgahnJvSISHnQS6fE7Jxta9XNua?=
 =?iso-8859-1?Q?u9ksYCVM+uYVmGSv/cM0Dqzqm8GL9GqjiWjZOgF67GR4r8n4svRtUBPAUb?=
 =?iso-8859-1?Q?vCUz1J82braVcgJR0Abw5Vu4s8jQrXmtajRsj3gvzjnEHQuZQ6vQuW6jfx?=
 =?iso-8859-1?Q?X5rPljR2oWluAKUHrObQj12GPOLvUTrnUf4cWFjbu0xy3v2hEZHBJvhz6N?=
 =?iso-8859-1?Q?/EXNivlYs73VDUr8S2ZE0PjtzMPehaXCIcZ+esEm8Vm19llf0ZtIfvoF/V?=
 =?iso-8859-1?Q?ibhXUCjAJTu8EwkiZKsZ2fjwGdHcuJR/kPL0peTV2kvaaTF5TlYe4gog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b27e16b-37c0-4512-fd2d-08daf3feadc9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 18:07:19.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmXPtvmOUweYYUfa1dIXHcyqu3l6XPuJ1RVvkUJPuQgnzvrW21B8ijtQPJj0F9U2HYWoNJyksDhL2pVMQrLZGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 09:17:01AM +0000, Tvrtko Ursulin wrote:
> 
> On 10/01/2023 19:01, Matthew Brost wrote:
> > On Tue, Jan 10, 2023 at 04:50:55PM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 10/01/2023 15:55, Matthew Brost wrote:
> > > > On Tue, Jan 10, 2023 at 12:19:35PM +0000, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 10/01/2023 11:28, Tvrtko Ursulin wrote:
> > > > > > 
> > > > > > 
> > > > > > On 09/01/2023 17:27, Jason Ekstrand wrote:
> > > > > > 
> > > > > > [snip]
> > > > > > 
> > > > > > >        >>> AFAICT it proposes to have 1:1 between *userspace* created
> > > > > > >       contexts (per
> > > > > > >        >>> context _and_ engine) and drm_sched. I am not sure avoiding
> > > > > > >       invasive changes
> > > > > > >        >>> to the shared code is in the spirit of the overall idea and
> > > > > > > instead
> > > > > > >        >>> opportunity should be used to look at way to refactor/improve
> > > > > > >       drm_sched.
> > > > > > > 
> > > > > > > 
> > > > > > > Maybe?  I'm not convinced that what Xe is doing is an abuse at all
> > > > > > > or really needs to drive a re-factor.  (More on that later.)
> > > > > > > There's only one real issue which is that it fires off potentially a
> > > > > > > lot of kthreads. Even that's not that bad given that kthreads are
> > > > > > > pretty light and you're not likely to have more kthreads than
> > > > > > > userspace threads which are much heavier.  Not ideal, but not the
> > > > > > > end of the world either.  Definitely something we can/should
> > > > > > > optimize but if we went through with Xe without this patch, it would
> > > > > > > probably be mostly ok.
> > > > > > > 
> > > > > > >        >> Yes, it is 1:1 *userspace* engines and drm_sched.
> > > > > > >        >>
> > > > > > >        >> I'm not really prepared to make large changes to DRM scheduler
> > > > > > >       at the
> > > > > > >        >> moment for Xe as they are not really required nor does Boris
> > > > > > >       seem they
> > > > > > >        >> will be required for his work either. I am interested to see
> > > > > > >       what Boris
> > > > > > >        >> comes up with.
> > > > > > >        >>
> > > > > > >        >>> Even on the low level, the idea to replace drm_sched threads
> > > > > > >       with workers
> > > > > > >        >>> has a few problems.
> > > > > > >        >>>
> > > > > > >        >>> To start with, the pattern of:
> > > > > > >        >>>
> > > > > > >        >>>    while (not_stopped) {
> > > > > > >        >>>     keep picking jobs
> > > > > > >        >>>    }
> > > > > > >        >>>
> > > > > > >        >>> Feels fundamentally in disagreement with workers (while
> > > > > > >       obviously fits
> > > > > > >        >>> perfectly with the current kthread design).
> > > > > > >        >>
> > > > > > >        >> The while loop breaks and worker exists if no jobs are ready.
> > > > > > > 
> > > > > > > 
> > > > > > > I'm not very familiar with workqueues. What are you saying would fit
> > > > > > > better? One scheduling job per work item rather than one big work
> > > > > > > item which handles all available jobs?
> > > > > > 
> > > > > > Yes and no, it indeed IMO does not fit to have a work item which is
> > > > > > potentially unbound in runtime. But it is a bit moot conceptual mismatch
> > > > > > because it is a worst case / theoretical, and I think due more
> > > > > > fundamental concerns.
> > > > > > 
> > > > > > If we have to go back to the low level side of things, I've picked this
> > > > > > random spot to consolidate what I have already mentioned and perhaps
> > > > > > expand.
> > > > > > 
> > > > > > To start with, let me pull out some thoughts from workqueue.rst:
> > > > > > 
> > > > > > """
> > > > > > Generally, work items are not expected to hog a CPU and consume many
> > > > > > cycles. That means maintaining just enough concurrency to prevent work
> > > > > > processing from stalling should be optimal.
> > > > > > """
> > > > > > 
> > > > > > For unbound queues:
> > > > > > """
> > > > > > The responsibility of regulating concurrency level is on the users.
> > > > > > """
> > > > > > 
> > > > > > Given the unbound queues will be spawned on demand to service all queued
> > > > > > work items (more interesting when mixing up with the system_unbound_wq),
> > > > > > in the proposed design the number of instantiated worker threads does
> > > > > > not correspond to the number of user threads (as you have elsewhere
> > > > > > stated), but pessimistically to the number of active user contexts. That
> > > > > > is the number which drives the maximum number of not-runnable jobs that
> > > > > > can become runnable at once, and hence spawn that many work items, and
> > > > > > in turn unbound worker threads.
> > > > > > 
> > > > > > Several problems there.
> > > > > > 
> > > > > > It is fundamentally pointless to have potentially that many more threads
> > > > > > than the number of CPU cores - it simply creates a scheduling storm.
> > > > > 
> > > > > To make matters worse, if I follow the code correctly, all these per user
> > > > > context worker thread / work items end up contending on the same lock or
> > > > > circular buffer, both are one instance per GPU:
> > > > > 
> > > > > guc_engine_run_job
> > > > >    -> submit_engine
> > > > >       a) wq_item_append
> > > > >           -> wq_wait_for_space
> > > > >             -> msleep
> > > > 
> > > > a) is dedicated per xe_engine
> > > 
> > > Hah true, what its for then? I thought throttling the LRCA ring is done via:
> > > 
> > 
> > This is a per guc_id 'work queue' which is used for parallel submission
> > (e.g. multiple LRC tail values need to written atomically by the GuC).
> > Again in practice there should always be space.
> 
> Speaking of guc id, where does blocking when none are available happen in
> the non parallel case?
> 

We have 64k guc_ids on native, 1k guc_ids with 64k VFs. Either way we
think that is more than enough and can just reject xe_engine creation if
we run out of guc_ids. If this proves to false, we can fix this but the
guc_id stealing the i915 is rather complicated and hopefully not needed.

We will limit the number of guc_ids allowed per user pid to reasonible
number to prevent a DoS. Elevated pids (e.g. IGTs) will be able do to
whatever they want.

> > >    drm_sched_init(&ge->sched, &drm_sched_ops,
> > > 		 e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> > > 
> > > Is there something more to throttle other than the ring? It is throttling
> > > something using msleeps..
> > > 
> > > > Also you missed the step of programming the ring which is dedicated per xe_engine
> > > 
> > > I was trying to quickly find places which serialize on something in the
> > > backend, ringbuffer emission did not seem to do that but maybe I missed
> > > something.
> > > 
> > 
> > xe_ring_ops vfunc emit_job is called to write the ring.
> 
> Right but does it serialize between different contexts, I didn't spot that
> it does in which case it wasn't relevant to the sub story.
>

Right just saying this is an additional step that is done in parallel
between xe_engines.
 
> > > > 
> > > > >       b) xe_guc_ct_send
> > > > >           -> guc_ct_send
> > > > >             -> mutex_lock(&ct->lock);
> > > > >             -> later a potential msleep in h2g_has_room
> > > > 
> > > > Techincally there is 1 instance per GT not GPU, yes this is shared but
> > > > in practice there will always be space in the CT channel so contention
> > > > on the lock should be rare.
> > > 
> > > Yeah I used the term GPU to be more understandable to outside audience.
> > > 
> > > I am somewhat disappointed that the Xe opportunity hasn't been used to
> > > improve upon the CT communication bottlenecks. I mean those backoff sleeps
> > > and lock contention. I wish there would be a single thread in charge of the
> > > CT channel and internal users (other parts of the driver) would be able to
> > > send their requests to it in a more efficient manner, with less lock
> > > contention and centralized backoff.
> > > 
> > 
> > Well the CT backend was more or less a complete rewrite. Mutexes
> > actually work rather well to ensure fairness compared to the spin locks
> > used in the i915. This code was pretty heavily reviewed by Daniel and
> > both of us landed a big mutex for all of the CT code compared to the 3
> > or 4 spin locks used in the i915.
> 
> Are the "nb" sends gone? But that aside, I wasn't meaning just the locking
> but the high level approach. Never  mind.
>

xe_guc_ct_send is non-blocking, xe_guc_ct_send_block is blocking. I
don't think the later is used yet.
 
> > > > I haven't read your rather long reply yet, but also FWIW using a
> > > > workqueue has suggested by AMD (original authors of the DRM scheduler)
> > > > when we ran this design by them.
> > > 
> > > Commit message says nothing about that. ;)
> > > 
> > 
> > Yea I missed that, will fix in the next rev. Just dug through my emails
> > and Christian suggested a work queue and Andrey also gave some input on
> > the DRM scheduler design.
> > 
> > Also in the next will likely update the run_wq to be passed in by the
> > user.
> 
> Yes, and IMO that may need to be non-optional.
>

Yea, will fix.

Matt
 
> Regards,
> 
> Tvrtko
