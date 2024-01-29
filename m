Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D159841200
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 19:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA35112AAF;
	Mon, 29 Jan 2024 18:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160D4112AAE;
 Mon, 29 Jan 2024 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706553084; x=1738089084;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jycyvytSS2I8bEn++yVPrqBSLxG6XCM6cO98DvACWS8=;
 b=cLnubRQs6jnYi7M/ZawLbKxTw2fgsHWMT41I8iKKv+/TSMP53/WV5IFX
 tuevYCnVzX+JWw1L+TP56ZNtWW9hlaDjpTOpgk+1XJT8UbOMhaI2kmruK
 Kng+GzPV1W6q2Kj5FMP59giyC7E6V8KBGV5hV3ISdyXTQvSP2P4DxzpCL
 wVSL46L7iQBRq5s54OTlHqO+rFQgX9UlXeTFslEkS54Rax8bnAs2CP2LB
 BZoPD5UgBemx5bffryNbiSnNzTLnr+0B8FhQjCgHNLC7ts5PkEUI8M16x
 RtKtc5TogPQAHRZE2gnMGoagyk148jiHSN/QOCgni7I85fuhnMGRM5hs+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2925654"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2925654"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907211659"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="907211659"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 10:31:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 10:31:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 10:31:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 10:31:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1TzI+KiZsvlFKHWZPPtAd7ebaUrI0ZRvojwtqd1L+/Du6v/xNdVY9viex+odD1r4sscx1DE9KpJylw5q0FSBYNQPFNXEivCwy60mp024Mdel2lpi5CintTiKyfZvG1kmZIoOtA8PoTSogwlyhdwzoD1jaXNOixM/SfSDsD/oUMvRE1tyvebx9LNvM1Z0DLKs/EKvB8ImBiZhEejNqH75hCynEn72qyYcrtQT1AUZblLt7xUaU9ZRONP7FrDl+x5bCTER5WhvP/lPyIVCfg/KdZXP+UGjYaFF9wG3ldlK1tT/MBWRXmaAfJwjRfkPBmMwASojQwG68lln8kH/10u7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFBlQDRgpuP9Sm8ocAZiUPtnQKxAb1W6jVywTzS/wlw=;
 b=JwSIX1SubH/jneBMpi7Q6YM80XdN3o8E+oBWJnpycMaFBnYLIInQwB5wiYQNTLiT5hatdvQWSfOQfChWNahxbIi+Ne0b1+cC0Kpk8F/H3ywpSZemGmb6p/TdRZqmtRVVoEbaUiSpDnKmxJHAFdLct5YI/ZLRnFtEPIniYzjTQqgCb1VydpG46aojiDDfPTpkzy1xn1Dt6FhwEEz7dD0s9m0cFxzGgkNdkHN06+kEIxUe9BKjsRAs5EnA4HP/vEaFR3GnFxX8JHUj10azEY8zS4Xghx6PF3rWt5oePNd7xluxAt6UTE1ixAe0Rk4AbuPakrAv/HizUAq+BCkUVWM1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 18:31:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.028; Mon, 29 Jan 2024
 18:31:20 +0000
Date: Mon, 29 Jan 2024 18:31:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Message-ID: <Zbfu5twlZxGuQvYN@DUT025-TGLU.fm.intel.com>
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <b94aca06-858e-4575-a4c4-40be8d8d4d35@amd.com>
 <ZbKaqdu5Y/WNwWVX@DUT025-TGLU.fm.intel.com>
 <0bef4c76-924f-442f-af9c-d701e640db41@amd.com>
 <ZbPd590k4s5z1/a9@DUT025-TGLU.fm.intel.com>
 <79a8fe04-66a3-406d-981a-06e40b386d99@amd.com>
 <1ad510fc-99e3-4d12-ae35-baaa8badc730@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ad510fc-99e3-4d12-ae35-baaa8badc730@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1bde5e-f555-488b-4df6-08dc20f87d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3zjvqDX+fJ9bOna+J0ENMD6FJ37VVDNF3Z6wNCurtEZig/fS0lQ4dKnD412DzkupxUnqeHWeQnv55w/1eaxdAUOMZsqTSzgaXS6Um32Kiq0eB9R+30jjhaTMmbSk7NHcSZzU+g9H6MvIHCMk6c0gWoUCSPq9gc9daajOozeqyoBWXM03nbhAMU0C6s/GYSe4KzX+CzFFGnjHLmxyKK8q9Bl+PXc9ikatRMxHwFgUzmO/pFD2swDZ1fOfu89PuGyd9yYLLk98vCwGKTmJEDSHi3SfZ9AMPXiXKAN/4y62a2FzDugVIfwNs8rT1sf0cajsjgai917Coh9n3yzE/Na7qlMfiAClpfmEZvf+FK6vwDkxfZeQoKdj3QUlws0uHyrvqN9die1n/374CrA5DxX7iQOWLM8W9mjKx8gNNqwlB0VS/g7503fCspd41LpNWNzJC3KjK9+WT2RidsR7oVgBHwwnS/3nhLgZbXVdLXGqv0T2HQ1EhcQJg1y1eP/uUSiCMEgafHTu4ddQqIX8B/Kz3EUmm08rKVRftHyezVXnzYN5It345cOM+zIdYpd+/WRy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(86362001)(316002)(83380400001)(6512007)(6506007)(66476007)(66556008)(66946007)(6916009)(54906003)(38100700002)(8676002)(44832011)(82960400001)(4326008)(6666004)(6486002)(26005)(53546011)(8936002)(478600001)(2906002)(5660300002)(41300700001)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GqrUyG2fPHiqdlegWq+tC4Zh0y0CS9wCVfIiPTz2nZBTRgycxJK0B0NVZF?=
 =?iso-8859-1?Q?Ma9wzTCzv8tbZGIz4IgQIsNsyPkoGOA7Oi9O7jB6xYCZVsuRHnuVnVKx31?=
 =?iso-8859-1?Q?XDCS8XXKnEFKWq7TK72X+5PQ2ou34BALmeE/VOG21ckXixfwgQxaP+r/Nj?=
 =?iso-8859-1?Q?S/hPeGIHMXFdXjPizVlq9+WAgCuht7umV08ldswHvn+UlrTAmpcBpv4uez?=
 =?iso-8859-1?Q?ncmkoTjalXB6zkZHf3Ow2GKIrQL8fttKY59goRdHenDlAbPyYpwuShfCfR?=
 =?iso-8859-1?Q?1GPOi3HuY+XuNxYg95TOsDpp3DyXXURWQpqYfCJZV0M1UXZPACdyOZCatd?=
 =?iso-8859-1?Q?4KTczDbqzNuZuIQuqBwgmWDhK06KGX/qqEV5K6p+rbkeADO4WwPpqDWW5Y?=
 =?iso-8859-1?Q?pkqfBcshyvH2uAPMMmOWCIMHY1b9a8d21phMYYoU3O21VSoTqkHZU7UgUX?=
 =?iso-8859-1?Q?dzbiRbLXEB4AxaHca7PbzS5EMaMrw57FInMWxBV9hJ80+00p47KK14FTT0?=
 =?iso-8859-1?Q?TL3BPqjElWm1iuEc73KARNDqVhABGEGwwotLJzvecO3EblkJB+Ti73YC2y?=
 =?iso-8859-1?Q?5GDmBIH7zJaO6pIeQIMzmVy3tZoeSnPs2RGT0e/Ii7kmHau4leh+Mp9DSd?=
 =?iso-8859-1?Q?IDMCBjrQcREP6Z9G0Vjz1wG1wmFTdxu7qWVlpSPOyEnfwOkkbcre5XGmni?=
 =?iso-8859-1?Q?9aPQWzViiT3QuwBpYgx6OsLrofOd3pFaHmaFfvbgZnwGG3zSYw52FPVQg8?=
 =?iso-8859-1?Q?fMsrBsMx7Z7eeFlf9VKfpDuNbgG7Vgi0VuQOCPFht3MeiCbY78oTI9OhNA?=
 =?iso-8859-1?Q?C5e0qOx1IhcavQW+vj4XsEoAAACqrBt3oslsxbaNXZ46zzwW/i+jizuqOQ?=
 =?iso-8859-1?Q?j+3NKX8hNgU3ZoThZCu2qJNGwYlYJdX995R1u2U5D8i2w0UGQC1Y4ICWiG?=
 =?iso-8859-1?Q?vnqhAoUCqf+HnOZpz7MreIvt1qvCOZNLTmB7dB+ez5+2daiUotfzZKj6q0?=
 =?iso-8859-1?Q?k73NS1+XfgVgfckDlotiBJuopvQfSl6UNAVFuCO1x9ralgUhJsUWppsWNV?=
 =?iso-8859-1?Q?ewhc5kAo4/yt/sRYQAohH+vo38G8mW2MPz+lgIOYMziH6BA0KdNzDjEs5N?=
 =?iso-8859-1?Q?80z593590eGj9RW4mGDDYI8jVw/LDTxI1aKj5v+xGBgqelem1FYMK4PBVV?=
 =?iso-8859-1?Q?xVcgPPOU3sDtOcqlVNOZ/Gtn0avAsatnOXxbv45Si5zq7GIH1VcgllzLBo?=
 =?iso-8859-1?Q?Gduod0dVcAMXR4Dpp2xyme065nsqYd087XngxE8u2GpLu2iXSriRAH9tfL?=
 =?iso-8859-1?Q?q0xZes/KtQZ26zHHUxb4v6wV43xRXKMNWNetk41c2GhR6lfcF66FTUA+Ye?=
 =?iso-8859-1?Q?lv6V6RamyONnDMJk24hCLupXazqRFDFUu/+5jWPZUG654EQJlTPZ0Hg/+K?=
 =?iso-8859-1?Q?dDWcsjXRRDA8Fh9s5Bl3bDKbYrj3WyG1ZxH5ymhLx2+3PAXqhnDsN1Emqv?=
 =?iso-8859-1?Q?zIW2xDKx6oMRPezpZ8/QHQgGSm5S1G8bCZJFcP2jMqxaJrvWujkidYSPI1?=
 =?iso-8859-1?Q?y0t3hlFOHcw3VzTB54Bkl683fsmbAop9CSePACDfIYU80hnZfQHyIoTYWT?=
 =?iso-8859-1?Q?YhheXmvqFRnmVRJgNbJLaRcOi4AO7qDOTiZ0JYJZBe5aCysb/z3+lRjA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1bde5e-f555-488b-4df6-08dc20f87d23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 18:31:20.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpAsqmRIUfP792kMLB8aGeoNMAgb+v9UJwJcqfLZkxvGOcJKS8C0tov8oSH6WQdKIZlEhyNMeHdLnXv0LhcXwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 12:10:52PM -0500, Luben Tuikov wrote:
> On 2024-01-29 02:44, Christian König wrote:
> > Am 26.01.24 um 17:29 schrieb Matthew Brost:
> >> On Fri, Jan 26, 2024 at 11:32:57AM +0100, Christian König wrote:
> >>> Am 25.01.24 um 18:30 schrieb Matthew Brost:
> >>>> On Thu, Jan 25, 2024 at 04:12:58PM +0100, Christian König wrote:
> >>>>> Am 24.01.24 um 22:08 schrieb Matthew Brost:
> >>>>>> All entities must be drained in the DRM scheduler run job worker to
> >>>>>> avoid the following case. An entity found that is ready, no job found
> >>>>>> ready on entity, and run job worker goes idle with other entities + jobs
> >>>>>> ready. Draining all ready entities (i.e. loop over all ready entities)
> >>>>>> in the run job worker ensures all job that are ready will be scheduled.
> >>>>> That doesn't make sense. drm_sched_select_entity() only returns entities
> >>>>> which are "ready", e.g. have a job to run.
> >>>>>
> >>>> That is what I thought too, hence my original design but it is not
> >>>> exactly true. Let me explain.
> >>>>
> >>>> drm_sched_select_entity() returns an entity with a non-empty spsc queue
> >>>> (job in queue) and no *current* waiting dependecies [1]. Dependecies for
> >>>> an entity can be added when drm_sched_entity_pop_job() is called [2][3]
> >>>> returning a NULL job. Thus we can get into a scenario where 2 entities
> >>>> A and B both have jobs and no current dependecies. A's job is waiting
> >>>> B's job, entity A gets selected first, a dependecy gets installed in
> >>>> drm_sched_entity_pop_job(), run work goes idle, and now we deadlock.
> >>> And here is the real problem. run work doesn't goes idle in that moment.
> >>>
> >>> drm_sched_run_job_work() should restarts itself until there is either no
> >>> more space in the ring buffer or it can't find a ready entity any more.
> >>>
> >>> At least that was the original design when that was all still driven by a
> >>> kthread.
> >>>
> >>> It can perfectly be that we messed this up when switching from kthread to a
> >>> work item.
> >>>
> >> Right, that what this patch does - the run worker does not go idle until
> >> no ready entities are found. That was incorrect in the original patch
> >> and fixed here. Do you have any issues with this fix? It has been tested
> >> 3x times and clearly fixes the issue.
> > 
> > Ah! Yes in this case that patch here is a little bit ugly as well.
> > 
> > The original idea was that run_job restarts so that we are able to pause 
> > the submission thread without searching for an entity to submit more.
> > 
> > I strongly suggest to replace the while loop with a call to 
> > drm_sched_run_job_queue() so that when the entity can't provide a job we 
> > just restart the queuing work.
> 
> I agree with Christian. This more closely preserves the original design
> of the GPU schedulers, so we should go with that.
> -- 
> Regards,
> Luben

As this patch is already in rc2 will post a patch shortly replacing the
loop with a re-queuing design.

Thanks,
Matt
