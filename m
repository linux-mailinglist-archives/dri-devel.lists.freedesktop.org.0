Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C366456C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F068610E5FB;
	Tue, 10 Jan 2023 15:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033CA10E5FB;
 Tue, 10 Jan 2023 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673366167; x=1704902167;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=32jrGc9kkNCawP68MaMQv95opYWqHEoHocWWXf5SHLI=;
 b=LMuhAItnpP9w0dKE/TVqrxPvuuab415D+j9SUNrFTuPWNIruUwFkj8ak
 aQbpvaWQRLSXshIspG8fHMYb8aCWrrHG7db6qjy3EDXyHlmhhfJdJTS9m
 ui369rBnszUKtag/jMLugTqX0DgLLSZWOzFQaz9uXHafM5Pv+J/5RFt3f
 suaHoXrubNZ2bNXm0U6tOLDo3vfq2So5BzyhaoYWBxGB0xt6Fclsj/cZ/
 lUpTWHfX89RxswfN1QWduXavDec0+I4PJVI9PadjrSJe/4ssHJ/8vBH9/
 tvH7wS1/VdLbLwWUUkfW/8qKiG8kWJvIOVhzD1zbvGTKZ1LjuPrY+jsex g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="306690609"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="306690609"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 07:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="902414522"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="902414522"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jan 2023 07:56:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 07:56:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 10 Jan 2023 07:56:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 10 Jan 2023 07:56:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnJKdIqroGX+57lfAlSecyO5SFPu7ZnVuNAzjeKFwEIaAv505zMU1Z+kXm+jT/w+RgDA3lamFFvYpvgI5Bmwrt9+eOXfpW+Py0sRtq7RSq37MgRPqvCj/cCLOUG6r70GDeHIT6YWbjzXuGPaz3UxfRd/P6dZ5Mj4tMF/h3OZkZ6qb38uYSMMBKOsgJhH3oRhim6qk1HAs619qNw2/tEX/rT66TWl+AF692QD8J03CLGxUaW4YSxpbg4D20/ZvXQ1zMiG0W9k03MM5AVzYqPL+NFpakA1PFQICuoZjTGxrkZF5wlz2C+5cHrijVFX/c11gMp46Uqs3SaxyT/dabEahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt5QTKfaTMAeazvlZbNbdGEeIDnuZIHyeEBRS6a62Lw=;
 b=Jsyr17BwwhHYnpRWUvFLbat/lXfIsn+wXMkgtCTL/U6+4t9wOYWgAnIyp4nSr8UGjcfLzE0UPMjTMMmFNvy7lAPua0dBB0+DwY0KCt9dQwdbtiqk7j8/RdKdxP2RelgFEC59BGtf7oMT3RsS5shzCyFhRZc1/mepEJaTak6j9uxFkshd0bMF6pwBXkQMQrHkA1vh/2+MxunI+dLU9H8AiMsL6+ZyJfTKa36mF1XivASrQxFlG6pIhmLjGKTusrOIEkZKsDaNk2+crhJvGUeywoxV5U6Anf2APqt74REq4GxNH2AbNyMQi71DhQb4aN9UkPCrz7HnIFIUIvwz0wLc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 15:56:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 15:56:04 +0000
Date: Tue, 10 Jan 2023 15:55:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y72KdvHchbAzbYW2@DUT025-TGLU.fm.intel.com>
References: <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a39adb-dd74-4218-dd5c-08daf3232d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Z0Wil8jaixUQOTJziBHpOYsTO9GvmCAKRsGgzzNUzBu6GhCduodjnjORJp3OV9fDtppY5QS4qDqUU/QXMo1+dYg5YxgCOLrHY5UiLMpkP3fLIO18N8TI+/iEIYsUKMDxTy4RrMTMvq8ce/b2TXtmjEpKoI9AMrqf99C4MMdqVbY6KEeU3Yw3XSjhsplvC3HFv39IzM5N98hPDgXTpQczKo5E/63NT/pKbJKKANPSHJptw0FwDyqtACZOFVt4rvFVyjkYh40mFG2vs4ksxUYQx5IhjWuSRbzfuH8CogrvgKjHIWSubilRCdidydMZPQ5aWjYSRoYTflL0hIftPQWA2hcAU2LcypqMlU7xEpiEUKriYc8IV7Z8DTW3IysTiR2Q8SgkJvCJa0HFqRKe9pujyhfu73qqd2dSwMoKJ0SSoWQ1Q2fyrjyd6WuPEE44bQ25QqnTU/fkQiPvoIBh9bWR4RMzfOXiYSZo2Y+BQh/JTVJ5HoQr92pIOXgT3c61MAhDpsxZ/7S/g9/DcOWtc34FjJ+9nQ1Y/Ez2cgmnm4WPP9uxHCoQnXtZpB8B3qjx9ct007h1Aogflx+PYbSDgRs+5Hy5UBS4YKLtqojsrqzSqVaqQUdveCCK03ruLWUsZUqzLovvDBbXvsXIjAjxeJwng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(66899015)(8936002)(2906002)(5660300002)(41300700001)(4326008)(316002)(6916009)(8676002)(66556008)(66476007)(66946007)(44832011)(26005)(6512007)(38100700002)(86362001)(186003)(83380400001)(53546011)(478600001)(82960400001)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w8NY8FhGYE+WSNwiRhzPc/7fDDHrUxjQGKFE9NVhaEzaC+Fs06tHnYs30y?=
 =?iso-8859-1?Q?y4TGnO+OJafQwhkBB/2SwX3vyOYyGVE2kiw61DjmEcm1fWk4mIvgYAsore?=
 =?iso-8859-1?Q?W7deoLNY+LTOJEJOENbQSGlaGpBgURwDUoV+9yw5rVcjYcUktDpTFMnnrz?=
 =?iso-8859-1?Q?GE6M477BS6palE9Ytg7vS9WK/RQFWkfSBbi1bFhxUmS1JoVcdNJbAa/kF2?=
 =?iso-8859-1?Q?W9NEAjXD1sjaTKIdNxnj7UXusoPml2AbF4AjOej+E8BGxn748KCGSG18cz?=
 =?iso-8859-1?Q?LYowLp+SaNdQLfUgLqkAzR8GBlKMkLugKf8DLGKl9ld3pOTsM5uuZt6TA7?=
 =?iso-8859-1?Q?Ntz9SuvWU2TeL4sKevFJrJU3lmW1JTL7ss1WHFUOlqxKbTvp2Cd9gmlPXQ?=
 =?iso-8859-1?Q?HvhbTEBVq44bnyUecABfJ7lNFWbjkLZmi0PrHjV5X+InO00KKPmo1rnwzr?=
 =?iso-8859-1?Q?SkOfe6CXqEmkorY7NjX1xMcUBq1oYsIekpZz1daZbmGUIBdOLSn2jj3io6?=
 =?iso-8859-1?Q?ylpaMzD55T8JACfsc0o8Cu099UvjM1Ssp4BHuy/c6uBrwS4tEz6AW/Ihp8?=
 =?iso-8859-1?Q?jxL0MtlYzfHinXykqlq2ci9kzSq26EkzPDpD8duhvMlBTRq6bM3e6fRyOo?=
 =?iso-8859-1?Q?O6k/fMuHxE6vdeMbV/XBXK2LdemqDm360THH4/IEiwtIaCOdCKuyvw0UE6?=
 =?iso-8859-1?Q?a9gqE8wkwVYsCI3iX8aGxZaJraHuxsbDqmq3TTMXwL8ZorvDu67GmIKMu/?=
 =?iso-8859-1?Q?VVx712n4FriYOVVPSQJ8ZYLN6fACqHL/ujzeLeaggDXnUfSCGQQ3jx3Euw?=
 =?iso-8859-1?Q?Z5sD0gyJtxbBF7mPrW3y7LnQpB06arZAo8+csZpVaWXw7Q8Tkd8avojXDF?=
 =?iso-8859-1?Q?QpBT074Z/FIhQPtGC8q860iS1fUQ78CbyvqJJDFLj8QywwBQXlP65FEQ93?=
 =?iso-8859-1?Q?xPDH9BXeFQBdosiIkLWVmfzATGkE/Xcvx5a0Yepuwy9E7yzCQ/IgmPFHii?=
 =?iso-8859-1?Q?Jm07C3A0dnEN/y2zet//ws3MKc/HpGYUko2+MLtUo91tvIhLeSTM9kqnkX?=
 =?iso-8859-1?Q?AjKmDx0N4Frp8bXyA5FpJx0eHGAGQKbtIGAF7WyrfiN+HPjhB1UZkLmUxr?=
 =?iso-8859-1?Q?lAQ6d1c23EiL6USdhR5IU3P6cSRKCh0vcBEAG/3Old82RwuVO/dkbSlCrd?=
 =?iso-8859-1?Q?KbC4Slv8pLX57Mr63Z1FEOBTRl4J856Dj5uviagUKCKV91OEXScV8k9lPp?=
 =?iso-8859-1?Q?vSN7MIyzsxvk5IPJQXb9KzXeWaIFT2RmtRmO97TItYWiujiCslTDRbVfOH?=
 =?iso-8859-1?Q?aufahDQ8faT3nYZqTundzDqkOeFROCaPTaik9LqbfuFzWl0rP1gaux+YFS?=
 =?iso-8859-1?Q?rVrfKIuAqw/hER8tcPlEkBZozYNHcTD8s2q0NeFmDjmSr5epax7ooJahCc?=
 =?iso-8859-1?Q?07mArRTod57X3eLUkoerJpT74hyLnZMz9ZwekQfbrKV8d4qpz8q68KGcZg?=
 =?iso-8859-1?Q?Ub6dlRQWzoD0GAxvHBGx3geNqJklmG6CKPovJLvEt6SNbWCzYUn8TTnpSI?=
 =?iso-8859-1?Q?tFVXIITGdSEUf7xE3WnFds1vy5bopAqsKVv9sQiXKuH9R1F3G6hgp0PzmO?=
 =?iso-8859-1?Q?XRVjQWR+2yAZ6CaA7z6aXyIBkLfWu4GgcWWwJ7v0kGCkWn10MjTKDMvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a39adb-dd74-4218-dd5c-08daf3232d71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:56:03.9438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JihJGeMZZkThliMXIyTDRe5LdMx+1/iACv5mBBYjVSMGQhclZsi51d+SD9ZgOVqcg8mb+YS3Lcc4NlP+j70tww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
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

On Tue, Jan 10, 2023 at 12:19:35PM +0000, Tvrtko Ursulin wrote:
> 
> On 10/01/2023 11:28, Tvrtko Ursulin wrote:
> > 
> > 
> > On 09/01/2023 17:27, Jason Ekstrand wrote:
> > 
> > [snip]
> > 
> > >      >>> AFAICT it proposes to have 1:1 between *userspace* created
> > >     contexts (per
> > >      >>> context _and_ engine) and drm_sched. I am not sure avoiding
> > >     invasive changes
> > >      >>> to the shared code is in the spirit of the overall idea and
> > > instead
> > >      >>> opportunity should be used to look at way to refactor/improve
> > >     drm_sched.
> > > 
> > > 
> > > Maybe?  I'm not convinced that what Xe is doing is an abuse at all
> > > or really needs to drive a re-factor.  (More on that later.) 
> > > There's only one real issue which is that it fires off potentially a
> > > lot of kthreads. Even that's not that bad given that kthreads are
> > > pretty light and you're not likely to have more kthreads than
> > > userspace threads which are much heavier.  Not ideal, but not the
> > > end of the world either.  Definitely something we can/should
> > > optimize but if we went through with Xe without this patch, it would
> > > probably be mostly ok.
> > > 
> > >      >> Yes, it is 1:1 *userspace* engines and drm_sched.
> > >      >>
> > >      >> I'm not really prepared to make large changes to DRM scheduler
> > >     at the
> > >      >> moment for Xe as they are not really required nor does Boris
> > >     seem they
> > >      >> will be required for his work either. I am interested to see
> > >     what Boris
> > >      >> comes up with.
> > >      >>
> > >      >>> Even on the low level, the idea to replace drm_sched threads
> > >     with workers
> > >      >>> has a few problems.
> > >      >>>
> > >      >>> To start with, the pattern of:
> > >      >>>
> > >      >>>    while (not_stopped) {
> > >      >>>     keep picking jobs
> > >      >>>    }
> > >      >>>
> > >      >>> Feels fundamentally in disagreement with workers (while
> > >     obviously fits
> > >      >>> perfectly with the current kthread design).
> > >      >>
> > >      >> The while loop breaks and worker exists if no jobs are ready.
> > > 
> > > 
> > > I'm not very familiar with workqueues. What are you saying would fit
> > > better? One scheduling job per work item rather than one big work
> > > item which handles all available jobs?
> > 
> > Yes and no, it indeed IMO does not fit to have a work item which is
> > potentially unbound in runtime. But it is a bit moot conceptual mismatch
> > because it is a worst case / theoretical, and I think due more
> > fundamental concerns.
> > 
> > If we have to go back to the low level side of things, I've picked this
> > random spot to consolidate what I have already mentioned and perhaps
> > expand.
> > 
> > To start with, let me pull out some thoughts from workqueue.rst:
> > 
> > """
> > Generally, work items are not expected to hog a CPU and consume many
> > cycles. That means maintaining just enough concurrency to prevent work
> > processing from stalling should be optimal.
> > """
> > 
> > For unbound queues:
> > """
> > The responsibility of regulating concurrency level is on the users.
> > """
> > 
> > Given the unbound queues will be spawned on demand to service all queued
> > work items (more interesting when mixing up with the system_unbound_wq),
> > in the proposed design the number of instantiated worker threads does
> > not correspond to the number of user threads (as you have elsewhere
> > stated), but pessimistically to the number of active user contexts. That
> > is the number which drives the maximum number of not-runnable jobs that
> > can become runnable at once, and hence spawn that many work items, and
> > in turn unbound worker threads.
> > 
> > Several problems there.
> > 
> > It is fundamentally pointless to have potentially that many more threads
> > than the number of CPU cores - it simply creates a scheduling storm.
> 
> To make matters worse, if I follow the code correctly, all these per user
> context worker thread / work items end up contending on the same lock or
> circular buffer, both are one instance per GPU:
> 
> guc_engine_run_job
>  -> submit_engine
>     a) wq_item_append
>         -> wq_wait_for_space
>           -> msleep

a) is dedicated per xe_engine

Also you missed the step of programming the ring which is dedicated per xe_engine

>     b) xe_guc_ct_send
>         -> guc_ct_send
>           -> mutex_lock(&ct->lock);
>           -> later a potential msleep in h2g_has_room

Techincally there is 1 instance per GT not GPU, yes this is shared but
in practice there will always be space in the CT channel so contention
on the lock should be rare.

I haven't read your rather long reply yet, but also FWIW using a
workqueue has suggested by AMD (original authors of the DRM scheduler)
when we ran this design by them.

Matt 

> 
> Regards,
> 
> Tvrtko
