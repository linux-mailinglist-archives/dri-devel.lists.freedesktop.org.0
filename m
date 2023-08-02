Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E176C3E3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 06:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F5F10E48E;
	Wed,  2 Aug 2023 04:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADB410E48E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 04:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690949218; x=1722485218;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nXcep8MB9NHtr63SFUxa4+fZLGwdyAIVx7M5qmU6ZkA=;
 b=fAe3Xu9ARM/B3aUC74SdsxR0gIPq1dOfw+xQ1rlExuHNUpxYBk/zvWrJ
 YEqhBUh0tMy/uvosYiR8bbhht/enKxafuBwTXgZWqktms7to/g2gXMz6c
 j+MEwUEDXtZEkNkky8ghxKD3vYbbKAvAw5JLdeU/fp8v0W9qJF1JjaWf2
 KHgFdUtxDAqgmQkA7ClvaditsYc4dNBuvNzlt5fvoaPdGibSZ5Y13wuIh
 361QsGBXzF4B3MAELJCIMFpUpeOH7y/GAAeE4UQzUccU17o5jtuhD4bjH
 NURk6qrr5PiHmX5jkVx1ixze4oj3B17BQMQ1AX6BLeVwajyqE7F83HpZV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="455841629"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="455841629"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 21:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="842973191"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="842973191"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2023 21:06:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 21:06:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 21:06:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 21:06:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 21:06:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eqwzbd/x9NX9rCtMwK3y8GE8U8dx0mSJzijd53fUyhFaRr3SuZnslXeyu9LVgdzLoBYU+hyNIaT5t5Tx1kuKlvhCR8Ds6qm4u1ObiE3dP1gX27nTgN1f3Q1VKMaejGqDoL/92VUmm2BOSTw/tGzzV+pMzGYANsKRPeuF3YsTqbKYdngeDajE8X4d7O7i3DzwbX5KlY0I7iARG2nJ9pgCcwtIH/587/hYzyPeN/zUxoZnbiZMx3AGqEXe2TI7kx8wNyBRoUhrEVzQ7pXcUGsQjsJ0fBPAUENSj/p0RAWArwxmThoSJ5gqno4+mbpwvy4cVOwszEIGKQrLuf7zvqv8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq1jGOSlPYRAJ7RffYBccVTPlcTz92l7M/oPuoHSdDY=;
 b=cPTCcqyB5dxZN0WK1FWL/F3F2OfBfqCDTT3p8T4iUK4CCGB+R/pKtXV7LAIxwh8AD6Nr+cIjOcYq0cVyYYExm6OAAsueMwwNtXKVJyxttzIk38/hhJXTkQ5o6ZJZUAAjuesZADvk1AXswGpejR5ZhO2Mt30GJkc7s4MfIW5v+YIBn9b2WFVqNcL4yRXNzFkGiWUgCCf9SfEyo/1Y9PBCPaC78s+SAg6oiCdUMZeObEmINoX7B7RT1AHafCHeYAI7dtfopx+wejfNQk41WJBDdYlhXgA11dhYQokDLFypXRMzfv/X9/1dBeefYD0upz9RO7v5wK7Ukbm4TL2z8wKYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 04:06:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 04:06:48 +0000
Date: Wed, 2 Aug 2023 04:06:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
Message-ID: <ZMnWKXRmCVFRNLMT@DUT025-TGLU.fm.intel.com>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
 <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
X-ClientProxiedBy: BYAPR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::42) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4001d4-d6af-4fdd-19d7-08db930de4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ks7z2VeaNhnXOdGBq5eLmVOf3vHkWtBCjmzad+B93YwH0ZAd26GgvGLnMQMiegyFu18hyiBf5bvUIYE3IaIPFIGrQlCV9N0r2dbbRg6R5RcU7WGH1D8vokrNnN8Qm/Xoa11syswCdK90Ci80hsWWBl3IyB4woHYBRyDbqo1JzioExBfNqFXOTFsAQQyo1BNHMcbsbz7oXghTBYyhzUB3D5WHCqeKwAsukTmQ8TjXJ/R6AkU7X9UPy5GLgs6It/aQoWnmqrigY6ONnYLZoV9V6f5pxR20zHC5omYUgwV6XhxBBgGBSC0odANP49e77jSusGLBEg9wJMDtg33MfTUqTE9MQQ/2o0pBqwNKaCtgPEbWSGE45LZA3gM6b/9iTI2CL2IjpyQZlFgUgT4O8f6QyUa+p3JPBBBO3gu6XEcPKknyetYIdGqpp0hQVAHjsLKUXGzrdExe38c2JJW3+Y1kQYo1mYRGR8XoJZT3eoMeyPWhS9Bq6KPL4B0BIgT6fCG8/sAcqZQxdPH0DCVYGVoooJGwXcL06srJ/8JNNBnG+ZBzZyhupPpYpTG7MPZF+otT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(44832011)(66556008)(66476007)(6916009)(4326008)(66946007)(2906002)(38100700002)(82960400001)(53546011)(186003)(6506007)(26005)(7416002)(83380400001)(54906003)(86362001)(478600001)(6512007)(6666004)(6486002)(30864003)(41300700001)(8936002)(8676002)(5660300002)(316002)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxMFCk2g1okG9FAgFZR/vwdqH+TK3PhVAcyWL0/3UZDFEvPOO5JPbg3d1XCw?=
 =?us-ascii?Q?KHaS73AUhqo+mfgZsBxMHOqPll2hUt4pqMA5z0FI1A/JErEZGI1gYZsoIfA3?=
 =?us-ascii?Q?B0KK1CRVhAG2AW981TRyxww6jk4xeILnXE/Nz6JfJjE2+17DY+sgzcaECaKq?=
 =?us-ascii?Q?3SBCfMT5Z5iFpOg9/ffC6DTWW8SPsmGQnXfo11oaGZCj7wzaKGxMtv3Kfe6O?=
 =?us-ascii?Q?XVjw3fP3pdHi0M/i3l/4vvlkPH5PrTeruZfOc80GVp4H98aNYrYj7zTcKC+c?=
 =?us-ascii?Q?s1P3ihPkbpCiUA/O60rhXMzv1+9eCgyolJfKVJf6kVqzxdGiabZjMfV2wcdu?=
 =?us-ascii?Q?bGUqW+mqvV4c220smk6wottd/kMlVGKtmxQV5sZCfC/bAyjluNFVJjBgAx4R?=
 =?us-ascii?Q?Lt5iY1Cdarr+FJ9ja6cXsOGzAOb2WjVnaqXLLXqq3sKOa/T8vJFPYm/PMHLV?=
 =?us-ascii?Q?jqgqm8QcwFyfA3ut/Qz5MEafBS44Un2rGXLztBpxyJIrcPPZ+SBqpIgohFWf?=
 =?us-ascii?Q?HYrrINX43pdb/MCLeGxHzW7jOpLcwWOtjAGCFAsQqOtesy9DhcJUQx3RzZGe?=
 =?us-ascii?Q?Q6JnQip6uOs1DdwzhRm8DoQil1cthPWvMgHxBifZ1EEjS0VdiU8+4bg7XjYe?=
 =?us-ascii?Q?zgvcz8i4ja/V49zNKZ8BXhRvGbtZl1IOtzA3ByhOEUgM9fWs7/yVf1P3mLkp?=
 =?us-ascii?Q?8Nnha0PIHuDYe7AdaySbcLrDyt17V1htp5WqTxZ6jF5EO9TEa/MyS7aKedsV?=
 =?us-ascii?Q?Z+CXkbnbmNLtI3chTJEaG4iEBko3ZOoVOfUvZP13A0cvpV6tGoSBNPN6cLO7?=
 =?us-ascii?Q?QMHpm2biuIMBeyyFvq+vOSMCBiAVLC/DY1hgdFacwCoG+s6MNUX8mp6byQVR?=
 =?us-ascii?Q?2rjsPzzelBlTe/Wo3TouOg+wd03Ol41QOGgf0FhB2DeX1t25Fnbx6SHD3z+y?=
 =?us-ascii?Q?XxGAEJd8c0IB7daLMBSArkPtaxm7YOqP1ybiVzziCXX55v0PlAoDiKRIiVhU?=
 =?us-ascii?Q?jJOT3m122I2yKhO3zMxUEu2k4Z7QvfocIbOCvW87RNP/AIQKFOwBLjcNo9lD?=
 =?us-ascii?Q?V4+RW+XUQEQzWykORCTNaAsK/9kykhAIxM7cDXwNTidTQSoP3CP+jiagUsMo?=
 =?us-ascii?Q?CRHr7NZqB72zvJX387Dhfwi6HNGfqesaKQz88MgjvDov6DUl/wlGt3+ZDs9s?=
 =?us-ascii?Q?GBINO1kPjfAmgf1XHTd5Ao1L/ZYQoqbubKDKh3VhyFSyyTzWIp9bJdIe6fvb?=
 =?us-ascii?Q?EVXMOip8QkPsX7JOk5tqJp9GTgYHsecmt8gV/Ns/bXM07x0mc2j9bJSuP+nn?=
 =?us-ascii?Q?eLzDqf28Hzo5KL5eiOXNpIrjwDNgIZJOmkWLf7P63iE/0yXR6EixL2gHgJkb?=
 =?us-ascii?Q?baPD1MLVbUev3jLbUJlDb0J2sZ1NuUKOSRcmP+oKDytywhnaaW0veGCiv7ms?=
 =?us-ascii?Q?irPrHEC/4LfvA+i6WVuYTaW0oA7BTu9bkV4KyR56DMQW7j9eORD5z/3XITWn?=
 =?us-ascii?Q?1DJhNNa1Dpl4jJn3Lhoh65H93TynYp0iL6k+bW+04DXrK35ks9fxr/wOWTMA?=
 =?us-ascii?Q?siDhzTgroQqDWvfcEUMGR20BFQUrUNfm/rg2+cbvhIHsbmZVG2ahhBLBI1Cr?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4001d4-d6af-4fdd-19d7-08db930de4ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 04:06:48.4612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrEBbXdDBOTvHDHlINhcXASBMk2DQrRLe2KyxIuSdYAjBnPQtydI9c0+4Wn9URkPanR70U/vMUPCQJ7WGExe2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 asahi@lists.linux.dev, Sumit Semwal <sumit.semwal@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 01:40:38PM -0400, Luben Tuikov wrote:
> On 2023-07-16 03:51, Asahi Lina wrote:
> > On 15/07/2023 16.14, Luben Tuikov wrote:
> >> On 2023-07-14 04:21, Asahi Lina wrote:
> >>> drm_sched_fini() currently leaves any pending jobs dangling, which
> >>> causes segfaults and other badness when job completion fences are
> >>> signaled after the scheduler is torn down.
> >>
> >> If there are pending jobs, ideally we want to call into the driver,
> >> so that it can release resources it may be holding for those.
> >> The idea behind "pending" is that they are pending in the hardware
> >> and we don't know their state until signalled/the callback called.
> >> (Or unless the device is reset and we get a notification of that fact.)
> > 
> > That's what the job->free_job() callback does, then the driver is free 
> > to do whatever it wants with those jobs. A driver could opt to 
> > synchronously kill those jobs (if it can) or account for them 
> > separately/asynchronously.
> > 
> > What this patch basically says is that if you destroy a scheduler with 
> > pending jobs, it immediately considers them terminated with an error, 
> > and returns ownership back to the driver for freeing. Then the driver 
> > can decide how to handle the rest and whatever the underlying hardware 
> > state is.
> > 
> >>> Explicitly detach all jobs from their completion callbacks and free
> >>> them. This makes it possible to write a sensible safe abstraction for
> >>> drm_sched, without having to externally duplicate the tracking of
> >>> in-flight jobs.
> >>>
> >>> This shouldn't regress any existing drivers, since calling
> >>> drm_sched_fini() with any pending jobs is broken and this change should
> >>> be a no-op if there are no pending jobs.
> >>
> >> While this statement is true on its own, it kind of contradicts
> >> the premise of the first paragraph.
> > 
> > I mean right *now* it's broken, before this patch. I'm trying to make it 
> > safe, but it shouldn't regress any exiting drivers since if they trigger 
> > this code path they are broken today.
> 
> Not sure about other drivers--they can speak for themselves and the CC list
> should include them--please use "dim add-missing-cc" and make sure
> that the Git commit description contains the Cc tags--then git send-email
> will populate the SMTP CC. Feel free to add more Cc tags on top of that.
> 

Xe doesn't need this as our reference counting scheme doesn't allow
drm_sched_fini to be called when jobs are pending. If we want to
teardown a drm_sched we set TDR timeout to zero and all pending jobs
gets cleaned up that way, the ref of sched will go to zero, and
drm_sched_fini is called. The caveat here being I think we need a worker
to call drm_sched_fini as the last ref to scheduler might be dropped
from within scheduler main thread.

That being said, I doubt this patch breaks anything in Xe so do not a
real strong opinion on this.

Matt

> > 
> >>
> >>> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >>> ---
> >>>   drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++++++++++++++++++--
> >>>   1 file changed, 30 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> >>> index 1f3bc3606239..a4da4aac0efd 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>> @@ -1186,10 +1186,38 @@ EXPORT_SYMBOL(drm_sched_init);
> >>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
> >>>   {
> >>>   	struct drm_sched_entity *s_entity;
> >>> +	struct drm_sched_job *s_job, *tmp;
> >>>   	int i;
> >>>   
> >>> -	if (sched->thread)
> >>> -		kthread_stop(sched->thread);
> >>> +	if (!sched->thread)
> >>> +		return;
> >>> +
> >>> +	/*
> >>> +	 * Stop the scheduler, detaching all jobs from their hardware callbacks
> >>> +	 * and cleaning up complete jobs.
> >>> +	 */
> >>> +	drm_sched_stop(sched, NULL);
> >>> +
> >>> +	/*
> >>> +	 * Iterate through the pending job list and free all jobs.
> >>> +	 * This assumes the driver has either guaranteed jobs are already stopped, or that
> >>> +	 * otherwise it is responsible for keeping any necessary data structures for
> >>> +	 * in-progress jobs alive even when the free_job() callback is called early (e.g. by
> >>> +	 * putting them in its own queue or doing its own refcounting).
> >>> +	 */
> >>> +	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
> >>> +		spin_lock(&sched->job_list_lock);
> >>> +		list_del_init(&s_job->list);
> >>> +		spin_unlock(&sched->job_list_lock);
> >>> +
> >>> +		dma_fence_set_error(&s_job->s_fence->finished, -ESRCH);
> >>> +		drm_sched_fence_finished(s_job->s_fence);
> >>
> >> I'd imagine it's better to rebase this on top of drm-misc-next where
> >> drm_sched_fence_finished() takes one more parameter--the error.
> > 
> > Ah, sure! I can do that.
> 
> It's worth posting it as a stand-alone patch. Please make sure to add Cc tags
> into the commit description--use "dim add-missing-cc", perhaps also
> git-blame and git-log might help with additional Cc. "scripts/get_maintainer.pl"
> for files unaffected by this commit. (dim add-missing-cc uses get_maintainer.pl
> for affected files.)
> 
> Feel free to post it stand-alone and we'll let the natural review process take over. :-)
> 
> > 
> >>
> >>> +
> >>> +		WARN_ON(s_job->s_fence->parent);
> >>> +		sched->ops->free_job(s_job);
> >>> +	}
> >>> +
> >>> +	kthread_stop(sched->thread);
> >>>   
> >>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >>>   		struct drm_sched_rq *rq = &sched->sched_rq[i];
> >>>
> >>
> >> Conceptually I don't mind this patch--I see what it is trying to achieve,
> >> but technically, we want the driver to detect GPU removal and return shared
> >> resources back, such as "jobs", which DRM is also aware of.
> > 
> > I think you missed the context of why I'm doing this, so in short: my
> 
> As a general rule of thumb, in my writing emails I try to avoid using
> "you" and "I" as much as possible--it sets this divisive stage, and it
> can get misrepresented, especially in email.
> 
> As is the case in research literature, if I absolutely have to use a pronoun--which
> rarely happens, I always use "we", and this is the most number of "I"-s I've used
> in a long while.
> 
> > use case (like Xe's) involves using a separate drm_sched instance *per 
> > file* since these queues are scheduled directly by the firmware. So this 
> > isn't about GPU removal, but rather about a GPU context going away while 
> > jobs are in flight (e.g. the process got killed). We want that to 
> > quickly kill the "DRM view" of the world, including signaling all the 
> > fences with an error and freeing resources like the scheduler itself.
> > 
> > In the case of this particular GPU, there is no known way to actively 
> > and synchronously abort GPU jobs, so we need to let them run to 
> > completion (or failure), but we don't want that to block process cleanup 
> > and freeing a bunch of high-level resources. The driver is architected 
> > roughly along the lines of a firmware abstraction layer that maps to the 
> > firmware shared memory structures, and then a layer on top that 
> > implements the DRM view. When a process gets killed, the DRM side (which 
> > includes the scheduler, etc.) gets torn down immediately, and it makes 
> > sense to handle this cleanup inside drm_sched since it already has a 
> > view into what jobs are in flight. Otherwise, I would have to duplicate 
> > job tracking in the driver (actually worse: in the Rust abstraction for 
> > safety), which doesn't make much sense.
> > 
> > But what I *do* have in the driver is tracking of the firmware 
> > structures. So when the drm_sched gets torn down and all the jobs 
> > killed, the underlying firmware jobs do run to completion, and the 
> > resources they use are all cleaned up after that (it's all reference 
> > counted).
> 
> The ref-count definitely helps here.
> 
> > The primitive involved here is that in-flight firmware jobs 
> > are assigned an event completion slot, and that keeps a reference to 
> > them from a global array until the events fire and all the jobs are 
> > known to have completed. This keeps things memory-safe, since we 
> > absolutely cannot free/destroy firmware structures while they are in use 
> > (otherwise the firmware crashes, which is fatal on these GPUs - requires 
> > a full system reboot to recover).
> > 
> > In practice, with the VM map model that we use, what ends up happening 
> > when a process gets killed is that all the user objects for in-flight 
> > jobs get unmapped, which usually causes the GPU hardware (not firmware) 
> > to fault. This then triggers early termination of jobs anyway via the 
> > firmware fault recovery flow. But even that takes some short amount of 
> > time, and by then all the drm_sched stuff is long gone and we're just 
> > dealing with the in-flight firmware stuff.
> > 
> >> In the case where we're initiating the tear, we should notify the driver that
> >> we're about to forget jobs (resources), so that it knows to return them back
> >> or that it shouldn't notify us for them (since we've notified we're forgetting them.)
> > 
> > That contradicts Christian's comment. I tried to document that (after 
> > this patch) the scheduler no longer cares about hw fences and whether 
> > they are signaled or not after it's destroyed, and I got a strongly 
> > worded NAK for it. Sooo... which is it? Is it okay for drivers not to 
> > signal the hw fence after a scheduler teardown, or not?
> 
> Christian is correct in that we don't want to hang upstream control
> to the whims of a low-level device driver.
> 
> > But really, I don't see a use case for an explicit "about to forget job" 
> > callback. The job free callback already serves the purpose of telling 
> 
> Long time ago, in a galaxy far far away, this was needed in order
> to prevent device write-DMA into non-existing (random) memory. As
> this is not the case anymore, go with Christian's comment.
> 
> > the driver to clean up resources associated with a job. If it wants to 
> > synchronously abort things there, it could easily take over its own 
> > fence signaling and do something with the underlying stuff if the fence 
> > is not signaled yet.
> > 
> > In my case, since the driver is written in Rust and free_job() just maps 
> > to the destructor (Drop impl), that just ends up freeing a bunch of 
> > memory and other objects, and I don't particularly care about the state 
> > of the firmware side any more after that. The flow is the same whether 
> > it was a successful job completion, a failure, or an early destruction 
> > due to the drm_sched getting torn down.
> > 
> >> (Note also that in this latter case, traditionally, the device would be reset,
> >> so that we can guarantee that it has forgotten all shared resources which
> >> we are to tear up. This is somewhat more complicated with GPUs, thus the method
> >> pointed out above.)
> > 
> > Yeah, in the firmware scheduling case we can't do this at all unless the 
> > firmware has an explicit teardown/forget op (which I'm not aware of) and 
> > a full GPU reset isn't something we can do either. Hence we just let the 
> > underlying jobs complete. In practice they tend to die pretty quickly 
> > anyway once all the buffers are unmapped.
> 
> Perhaps in the future, as more complex workloads are deferred to this
> hardware and driver, a real-time requirement might be needed for this
> "tend to die pretty quickly", that that there's some guarantee of
> work resuming in some finite time.
> -- 
> Regards,
> Luben
> 
> > 
> > ~~ Lina
> > 
> 
