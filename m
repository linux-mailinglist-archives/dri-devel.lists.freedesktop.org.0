Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01465F4B5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 20:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D8D10E495;
	Thu,  5 Jan 2023 19:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7E710E2AD;
 Thu,  5 Jan 2023 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672947649; x=1704483649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1GJZwDVry9lpLTkQG5qgNF10nsX3xDbYHHmpwsCAgsc=;
 b=ThHyb9f2SYsil79w3eQY/YH+8KNjLXp2Fiyef/wi7cNz1HzMRTEqdlxT
 GCP/XL2/DwRrjWMdVLYNOzgLDHloLcTxfFEgEm9AczqdWCZDkAzux+yaN
 lbzSdQFi06B2ksAo4u6KTeIcuTbs7e36ZZcBtorAhyz8YrmJXL7qIdpRh
 lGwiCvhZGXY3RTuBFg4F/AQS8LvT6F6rKwG1Ca8kIXbOdy0UzdyKdMhs0
 6lKoI82dkr2khBUZh2fIQlpw1VnJEfKJLTMDK1vVD1g17MgETVVEOIF7y
 qIjogGioWXNyhf9t/daZHGSjyraNNOCbrAxvDEvKzmIUUWcmQT89zNBw0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="322373840"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="322373840"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 11:40:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="798034200"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="798034200"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2023 11:40:49 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 11:40:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 11:40:48 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 5 Jan 2023 11:40:48 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 5 Jan 2023 11:40:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHTcMk6mVFnkTo5Kt92UXLlfzGvmyqmzqfPH8FS9rnG5ZW3PSeFTnnMkhVuPDugB/MdNNJ+vZ3pmhoINFNmrZPcZEiMmoDkllN4VGhs0QCW0ygIC+UIBhiNPyO+OpArSm0aB/Je7idUeBdOVXTDlEIqrI8+Kq14IhANe/GzOctMuoJt11lJBoHrWU/TPfob8VpmtwDr4k1SfV/07h3jt9juA1GBZiSHviZjeLTE/zACgWH2GHgSx4fn6KvsxB+e+W84LdIJlatCawGNfP03S0/y5UbV1vn4XKnrbKWh512Z85Iwse+GbSCsQ9EpGzoRhz7BXVZfyM0BRQcfQ0Wb9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fVAtQ3QazqWa8WhreSm2VNtoVs4q1bqC/lmDHTjHbE=;
 b=EWb59cKZ1dsL1FT6AekIol/8KiYwt3MHRRcdz2+BoSDtEFmHFZFuX2wc5E2o5XBA3eSWPC6N1LsA/mWKy5sTF7GrEhPm1I5TE5HK9MElKiKh1Hbg7DZV3xROWr67MoQizu6mX7CkazVil3yoyaxPRgVAuX4XW7Cs4rac7US49Cf+RTq7yQ/68ilGmjS7FILnHkWeCuZBsECKsMu5bEbBuodlR5qHjR3dBbU3Tfz7QRMFNFjR8wBrpXlTtzeC22NTWPedSbZi7PTYYZBc2o82mddTNqiFFQDtTTD4utIFvU6F9TayBT0slzpVc8KvhBBZ8HrG488sX6UoWfVuHce4/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 19:40:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%5]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 19:40:45 +0000
Date: Thu, 5 Jan 2023 19:40:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RFC PATCH 04/20] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <Y7cns9bpfIslkCPu@DUT025-TGLU.fm.intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230102083019.24b99647@collabora.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: e676f946-fa46-42f6-544c-08daef54bd40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pt1BnGgbwTxuWKcp7XsezW9Ih52QlRkAQb+BuQbUMHvq0b6c43tVCwrYs3nF5z+CMfzNiU75bteR4eVA+Z3bxInntHMyM+xOFrvqh99sygESz2qX6BdgJ0NqgQ0yQbq7TJuTNeMnHen3H9se9Y1e3qJ9eNPv8nR0zB31EubepQMwp1517qpTj8uou5HhXPv+6eLx6A4vb3wyqYsrEefSZ3arKnt3xHLrRuVHdHb81ITPMM3nEhFwdfc+EgVBctFbXpwZmwxkkBMIvOZ7UGiCJSPXW/WJK9EKb+blT7DLaJlHndMmlUddXW/Bg8RANfP00Bis6AYOSHkyjoOgYaY7I3N4YuP6nX1H3nt1tF2+04LoYj/ipF6WOxQZLF22j9qoT0Xjgpq8UtCAOf1jJcCtUP3eTC9UX3g6Vry03cvXZjJIZIYIDVUT8yoh0mOdyniHIscTp3lC6ar5c5f04w1qbxNy4DJipk2vhwSVUBfSvfahXFKOuoayCtuGXU/6nyTz0le3NAMHezt3oz5ojz0V1mZDx0LSMaetPplieHf7UWaqyiuzpggMfvQGySFM+0lMzd7pRl9tWJu/0P7Otk7U7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199015)(66899015)(186003)(6666004)(6512007)(26005)(83380400001)(6486002)(8936002)(478600001)(6506007)(44832011)(966005)(6916009)(316002)(66946007)(66476007)(8676002)(66556008)(4326008)(41300700001)(82960400001)(5660300002)(2906002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n0R71zzWVgQs4/VzKbap3fFFquxVnpbJGPTve7qyqMP9j4N6BuBSvLNjXeA1?=
 =?us-ascii?Q?Rjct1TfNKlMuDcRcwLOgK07MJyBUsZAdmRnfufTyVuci9j16MzRXmTpHSD5Q?=
 =?us-ascii?Q?+uDsADpj4cYEes+ydlUsjW1aJtt/xat2/OasvmTbMEcNqpLG8VXWZGmpa76I?=
 =?us-ascii?Q?rKQfUOYOQyLcFKsY7lOAOLlCLYkVcXxEkhhhpj+6e0snXxRGwYgNeQsdYq4R?=
 =?us-ascii?Q?WBPgmfDos2AHnxxcliQYxyFJJkdKzcBQc+XcowZqI7Pq4i4taBZjkF91ych0?=
 =?us-ascii?Q?ZTU+GPhOY9kR69HWgCk1ie9J9uF/oi4MaKcU2WdXRAQINcK/Zr33x4qxrWiW?=
 =?us-ascii?Q?PVmfoHL1wT7UL2pZ0w+Fjwnv0vvasNNiLKAdx4Q5isXqW0zpFpI2gbfYudtX?=
 =?us-ascii?Q?KAypYhWd19Zji4jDZB/ro92nWMx3ZwTwg1St3BzUe3WS8JrLo21cFjopX1Dw?=
 =?us-ascii?Q?bcnsgPkqQqHQ9NTCyKxigcONVw5YizAFNdElhbbKX28wJDLZ8xbVaE5IfQo7?=
 =?us-ascii?Q?bFKtPYNekulSUiv4vLVeZtXRIvebrwyriar5Gua9YFS9ecZFyX6QTEGxHb/L?=
 =?us-ascii?Q?4KCctL87H1oXe5aV7ZhcIOEtpxkbRwqMBFzs0VrQLpPccakW1hZNU1KvG6PR?=
 =?us-ascii?Q?JZtxVVmJUKBspNcLuI2dp2elZXw1ThmQIrC2W9AKpfk9GRe92d7baNAGYPc4?=
 =?us-ascii?Q?5zpL8g13Ou58W2Leaor7vAUKXb9HhShm8U7uEkVQdJEZ4Md6qkrhuyikedn+?=
 =?us-ascii?Q?+w5xuhBb3dG5QtNWf/xwVgan+dO2Ksn/wLbkulhJgg7IK5oyqOO0+e65FXtJ?=
 =?us-ascii?Q?fUL8SZ1Ak0yNeEUljY53kIrOQHzvhkcra4+GDoOsMrK4eeAShW+2Dm1ccKBd?=
 =?us-ascii?Q?/K1AgCovrW8tsmlNVJAN0TIW8CWNSOnPOvRuzmBYhxeoXjevaRVrDzwGhrxc?=
 =?us-ascii?Q?5jq//fwCTzykdeqfG61+W5WSvZheJt70DPjoU+riI9wT83sA4spJdRijgZqz?=
 =?us-ascii?Q?0qNfVFhV6x8KPReMyn9PCpAGCzfieDFbhoQH/YXo/9HSdq8szd9TCKnqewkq?=
 =?us-ascii?Q?aFlmkTrHw8f9zNQnppLL6pTjq27nI6LOxGfhFmNeRpqmkkdtFpjA5IHTeQG7?=
 =?us-ascii?Q?KARHVDV0toquY4ApJWbCpeQWg1sI2GQrS5V+IEQyBhGnDC/RC472SmY85HIt?=
 =?us-ascii?Q?QomAT1NYIHSaIOeiecWI/4Y6+Ycp9mIQUFinUwIE8SYqD3x1DnhSEwxYD6Ho?=
 =?us-ascii?Q?QWwEkJXv3REDP7u6e/TFIfSrXI/z4wsxQIeBD2jdBZ58/EyXyJ1527FElH9u?=
 =?us-ascii?Q?NbxzxQ0CX33/sYuHkBe5/dhG9qDlsf4uFQ2JYGjBATQ8OCq2angmQXJQPOkr?=
 =?us-ascii?Q?o5jt85tx34olr9L2JgOMhKFZ3g3WL7ejL9pAN9IUq3gDHn41LRSkX4YL7UAt?=
 =?us-ascii?Q?IQdUnEwmD433QrJPwDH0XQJ9skn3qLqqp/dwxh8LPIllZBWqth5u5For6p4z?=
 =?us-ascii?Q?i1lENtrGEyD+CO5ijEBDdVkmxvm9yNJBvR4Y15xW52YM1/tbj98xH4X+E1R0?=
 =?us-ascii?Q?fug464OnpKm8QWpm2Nx5jg0Vvcj6V0C4TBR0DNAP0MeEYCz6h+fSBvH8HpXW?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e676f946-fa46-42f6-544c-08daef54bd40
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 19:40:45.9309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRhcok74m8sn8IPuGz2wJToJCvyUZG0aEy917cQhSJ2TjKKSCqh9Ndevojf7LyuP1BNj4BnXif85N8tRny9KuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
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

On Mon, Jan 02, 2023 at 08:30:19AM +0100, Boris Brezillon wrote:
> On Fri, 30 Dec 2022 12:55:08 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Fri, 30 Dec 2022 11:20:42 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> > > Hello Matthew,
> > > 
> > > On Thu, 22 Dec 2022 14:21:11 -0800
> > > Matthew Brost <matthew.brost@intel.com> wrote:
> > >   
> > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> > > > seems a bit odd but let us explain the reasoning below.
> > > > 
> > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > guaranteed to be the same completion even if targeting the same hardware
> > > > engine. This is because in XE we have a firmware scheduler, the GuC,
> > > > which allowed to reorder, timeslice, and preempt submissions. If a using
> > > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> > > > apart as the TDR expects submission order == completion order. Using a
> > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.    
> > > 
> > > Oh, that's interesting. I've been trying to solve the same sort of
> > > issues to support Arm's new Mali GPU which is relying on a FW-assisted
> > > scheduling scheme (you give the FW N streams to execute, and it does
> > > the scheduling between those N command streams, the kernel driver
> > > does timeslice scheduling to update the command streams passed to the
> > > FW). I must admit I gave up on using drm_sched at some point, mostly
> > > because the integration with drm_sched was painful, but also because I
> > > felt trying to bend drm_sched to make it interact with a
> > > timeslice-oriented scheduling model wasn't really future proof. Giving
> > > drm_sched_entity exlusive access to a drm_gpu_scheduler probably might
> > > help for a few things (didn't think it through yet), but I feel it's
> > > coming short on other aspects we have to deal with on Arm GPUs.  
> > 
> > Ok, so I just had a quick look at the Xe driver and how it
> > instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
> > have a better understanding of how you get away with using drm_sched
> > while still controlling how scheduling is really done. Here
> > drm_gpu_scheduler is just a dummy abstract that let's you use the
> > drm_sched job queuing/dep/tracking mechanism. The whole run-queue

You nailed it here, we use the DRM scheduler for queuing jobs,
dependency tracking and releasing jobs to be scheduled when dependencies
are met, and lastly a tracking mechanism of inflights jobs that need to
be cleaned up if an error occurs. It doesn't actually do any scheduling
aside from the most basic level of not overflowing the submission ring
buffer. In this sense, a 1 to 1 relationship between entity and
scheduler fits quite well.

FWIW this design was also ran by AMD quite a while ago (off the list)
and we didn't get any serious push back. Things can change however...

> > selection is dumb because there's only one entity ever bound to the
> > scheduler (the one that's part of the xe_guc_engine object which also
> > contains the drm_gpu_scheduler instance). I guess the main issue we'd
> > have on Arm is the fact that the stream doesn't necessarily get
> > scheduled when ->run_job() is called, it can be placed in the runnable
> > queue and be picked later by the kernel-side scheduler when a FW slot
> > gets released. That can probably be sorted out by manually disabling the
> > job timer and re-enabling it when the stream gets picked by the
> > scheduler. But my main concern remains, we're basically abusing
> > drm_sched here.
> > 

That's a matter of opinion, yes we are using it slightly differently
than anyone else but IMO the fact the DRM scheduler works for the Xe use
case with barely any changes is a testament to its design.

> > For the Arm driver, that means turning the following sequence
> > 
> > 1. wait for job deps
> > 2. queue job to ringbuf and push the stream to the runnable
> >    queue (if it wasn't queued already). Wakeup the timeslice scheduler
> >    to re-evaluate (if the stream is not on a FW slot already)
> > 3. stream gets picked by the timeslice scheduler and sent to the FW for
> >    execution
> > 
> > into
> > 
> > 1. queue job to entity which takes care of waiting for job deps for
> >    us
> > 2. schedule a drm_sched_main iteration
> > 3. the only available entity is picked, and the first job from this
> >    entity is dequeued. ->run_job() is called: the job is queued to the
> >    ringbuf and the stream is pushed to the runnable queue (if it wasn't
> >    queued already). Wakeup the timeslice scheduler to re-evaluate (if
> >    the stream is not on a FW slot already)
> > 4. stream gets picked by the timeslice scheduler and sent to the FW for
> >    execution
> >

Yes, an extra step but you get to use all the nice DRM scheduler
functions for dependency tracking. Also in our case we really want a
single entry point in the backend (the work queue). Also see [1] which
helped us seal a bunch of races we had in the i915 by using a single
entry point. All these benefits are why we landed on the DRM scheduler
and it has worked of rather nicely compared to the i915.

[1] https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
 
> > That's one extra step we don't really need. To sum-up, yes, all the
> > job/entity tracking might be interesting to share/re-use, but I wonder
> > if we couldn't have that without pulling out the scheduling part of
> > drm_sched, or maybe I'm missing something, and there's something in
> > drm_gpu_scheduler you really need.
> 
> On second thought, that's probably an acceptable overhead (not even
> sure the extra step I was mentioning exists in practice, because dep
> fence signaled state is checked as part of the drm_sched_main
> iteration, so that's basically replacing the worker I schedule to
> check job deps), and I like the idea of being able to re-use drm_sched
> dep-tracking without resorting to invasive changes to the existing
> logic, so I'll probably give it a try.

Let me know how this goes.

Matt
