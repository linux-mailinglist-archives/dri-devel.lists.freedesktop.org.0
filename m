Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804F165F600
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 22:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D39710E37C;
	Thu,  5 Jan 2023 21:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7075610E2A1;
 Thu,  5 Jan 2023 21:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672955041; x=1704491041;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7xCfqJyI6Y7eGoICrUyz1DGXKJRvHMmDbpijGm8acM4=;
 b=BhKSR1SS+OaYIUy4N4Ez0net6/UianQyfAfEcVEGLsQ6ZpXu9wr1396u
 dWtgOddrxTGYQ16VlkyF2kAUerEBVZ47rbl4qzx1+PTEyjQcpd6fMogMp
 i3ArsxhgL1k/J51xboxq9SRQY9Fr4URTJepkC8rByZer030OAcOYMksYn
 EltMQjDasn2+7p5UlOVlXLkJJdwUzgs544ObG2nEV+h1V8UfUPDN0hly2
 p/nEh/e5am0JZANmfAyhpL9mS6srcqeRpaSYm/0CFEp8RHsNyh04Sciqi
 xB4eHktNWgHPG0HKUZnGTmyU0P64FNTIxYJCUjjNev56bucLno07e9b+N Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="302030202"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="302030202"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 13:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="657679958"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="657679958"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jan 2023 13:44:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 13:44:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 13:44:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 5 Jan 2023 13:44:00 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 5 Jan 2023 13:43:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i78XYpaH5EkS7/Bs6bGR9WtdCUxwnMLlY58MVTvIeMYW4wTokUNIOInIdViUtTcf0tx46qrUbHZr4nYFK/FB+KT9UGaW6E2konUCqAAC3JVonmRfrAxfeKR0qtDj+egFqUZ4hd/jQIlcoz8rvb1HcvnuZ0O4a/1oIAdgNeQRtRXQKPJKVm0H9Om1tyUjuugSzhQFboxTr6TG+hrTQ2h4rCTQrOvBswKDP9sIxlGWQhYxMPkjrzQlJzkF+jexUCIEx9JPcS9L/NSxBEDn/c9QLI2waWXU6AJorUWp/P//ckTQ9LN4lolvyyvgpeg+AGGXlsMliAhtWEtBm+WuCO3YAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41yEAkupNuKNqBaUWyHWrQVC6ptBVOvf5PwDtXbyRWM=;
 b=g1zJX2O9JoffPWxEPChjNUFWvnLrMdcXZdamKRNIA2cQDW+5NhOkxZttmuwyWUE7pdtDIfcvFMMad5CsxIYKn0j0WN0YzBttpxym80TPH5TRzSA1qyZdYPQe/1ueE4Ju0idhI2uA7aHduxtyIr6zohIPsmT0+M5deJ9Sao7k55fdzPssmRjXjvIjRHWg9l77ks+Tj/f71xv6Uh08syacohAVtrOG4MFS1PtGeNtn8fK2r/e6X0vjJ1ym2pPe5dfQn4wJQZSJdr9rA3UkjHpYuvRqbfFghxyWC3wgvVVE0G0DPBleErX7kvC7VLVOq9UNO9LK7A03fXckSk4FIBtvtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 21:43:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%5]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 21:43:52 +0000
Date: Thu, 5 Jan 2023 21:43:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1656c6-27ce-4907-7eb0-08daef65f000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHDZIduBTsdwK7GqwFk+2aqB4KW9e1h2KvtT+wC7BP4pdQRV6C/r7Eissw4G6kwlybtLrcvrc88fBmKmY6jBa9HgIGiFm1yu/PnBZs/QMyK8hRipwnVY8edFPmnaAdFOrymoyhCnTWt4IqJGAIYZ8mZiyDeLbs1r4tssxkS9NlSywgyYR2zJmWWBgEARlKHmf5cYM27iyHiPoWRZDKloA0QVbe3tcjp38tLghvdq1a128XvCF8oA8ZgnNCRQTS3NhI7w6k+MtpefVT5JYvVzit5mn0uAxikUcC2lliB4HiXyH8klYZJMfN6VNz1OQrvu3XoAdHuZIJ8xUsZxeNdpkJsMPwd9ZhFe1UQ/t0eezTUffPy1uDY0GzSOMX5s/7ZUqoe2txS8p0QC6Cy+wfIoJRIWi1/stOZ+/uFx9iytPC9YnbvtE73i7E3IUMSkt66YIMtjdJA6FzhWL7ftnCkN5QginbgLYbCiWaUfo2ZPrxkb+9Aig5B8P/eNfMPGXn0UsFwO39892BXI9+H7eL8VlGBWrbXLQPT3Mcr2IrK/EKKiBr1UKsBCBUaClRISN0ZDdBw7viw8cDYF0+B9p4w/NCoGYcG37YvCBuxF1nXvwsShr6xGOLXQhOMkndjR+LNae3N0Swzdwq6+0JAo3WHiVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199015)(83380400001)(86362001)(82960400001)(38100700002)(44832011)(2906002)(6916009)(66899015)(5660300002)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(316002)(41300700001)(478600001)(26005)(186003)(53546011)(6486002)(6512007)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cBC9MWSJSYIri8f2GrRAxRBsd8UmkJSYLH8FOBnIlMjNzI75cRcfEPw9U9lq?=
 =?us-ascii?Q?JQjbruLuz6gTrRWXLa1/ES0yCR91wLRFEZQw1SieY2fltw58t6gGXz1iR4Cm?=
 =?us-ascii?Q?esHKWZvFiGIbd7pZcBiZN9w8CPaqJ+dF3E5fZbFHG5PTtQONCVKU0AoA8Y5M?=
 =?us-ascii?Q?xpiuF6F0sClmkgzHBQJX5RZaP25pnW+7/pflFD56w2SusuTB11z/3FV2RdEz?=
 =?us-ascii?Q?FHp6WZqz4aBDGJ3dZ5mFeWXocUCFC8kTKxi9GZEJvNZ90X0pkBokYFIWP1rs?=
 =?us-ascii?Q?JFg0jEgbypszMyr3V1Fq1Tgj+HJyqXsH6Z4FoZGfWzfM6xDBn7gfi0CIq+3b?=
 =?us-ascii?Q?TfvGS1MXxUzyc8rffICtDsvwdnhx2mj9VSU7m671VNl6c4/n4FZkzrSpNITW?=
 =?us-ascii?Q?iWLRt5yqSfwxFzhPIEvcZITu2PMQAh96VabY6nqg6BC2j9h9ROHQ+ZZR8BqA?=
 =?us-ascii?Q?G0YPirmBtsAEljzYDRrlJfLfI+Qnwb38rNQHHPQWC+ta5tY1R6QeySeRHyYe?=
 =?us-ascii?Q?JvFMLXd30D5KI19qJ6IxHq5FEbdxEQjjirSIlsfXko40y0m7zgvPOpe+y3ll?=
 =?us-ascii?Q?z0ZpInu4twIAtbSx+moCCVz/dXKXQOG2ITDH5XgWRXK1F0SXHx2j7ve/37y6?=
 =?us-ascii?Q?wXo3WQ/M1ktohhHnF/uX7SPMvPBiyIT02nGoB3Q6M6VXB48nx4M+vTPlyxu7?=
 =?us-ascii?Q?9ofNBwpADt5im1wupaccOWh1l0Qmkld4BvrxPyCxfl2sp0VVtidMjf8/h3hS?=
 =?us-ascii?Q?Z0VBYSwMZ3JS+Ks/Ay5BDzGB/1trDVjCMDBckAWlJKc4vmhXH6lGXehZx+lo?=
 =?us-ascii?Q?Vq0ZQLTxJ69qvdMEb6YdlZnhKG+XkGsS9yv5JT5yx45wNIlknixN7Fyamwbf?=
 =?us-ascii?Q?9gM3evY+yLHBoI5sc0z0HhVw2ZzE42oycmESzaz7V1cAVdW+BrCUHmr6CNv7?=
 =?us-ascii?Q?YZibycJMox0iSbggf7jSwbmUEaxMJIOBGlHdhu6umOgE+9L9VHNCJ+HsNLBk?=
 =?us-ascii?Q?Ahx/KiZnZRNgR3NeJ3fFn/ftz3YCvE8b0DOMKONJgHRkM4yrclOEca1tk15U?=
 =?us-ascii?Q?6sJcRTP/NS3rfVow/vZi0rl/TdGAJ3Zno7OWgGdqfaqBmRGs5DdhgPscpTEN?=
 =?us-ascii?Q?a/St4a9xSRwM2g2gsDisY8OgnRXhFNteshjLjd50rxYudIjfQk8WJxgKXPD9?=
 =?us-ascii?Q?bUwszcR3TIT2upCR0G+gCOwDwQPbLmTv7DuNCoYguX8ZcxmwyXc5dpww7rcu?=
 =?us-ascii?Q?PDy7dfzqHWgBL/XJzCQNp1pvp8N6xoBRv1BbNPH11GjmCn1RjcZhTYxYRIz/?=
 =?us-ascii?Q?UakLNFtV5gwIfajwWmWoQQuR16tOwvOBimP3d9g1kGX6XrcACcJfDoRhe2ii?=
 =?us-ascii?Q?02NOuBRm3/CacqAdH7oHZLpeTgS6q0JKbGQsNeEsfYePJMpc9+KmtZu2PlLM?=
 =?us-ascii?Q?oDdcyT1Ndku75gcgJXOdzsK+XmK2uoPXy4gMJPntp1pTs/eG5Lj8gE7N4RN3?=
 =?us-ascii?Q?cwTaM26pmiX6Eli5oxfudkgRdUH4VvibCjVJC4/tevVxglwGKwutj8DxOJnL?=
 =?us-ascii?Q?+DZBO5EOxzhoT4F9v/zPCQU5hVomfq7i6IhWoWF97w3S4k8aT1Mav5xc2jyK?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1656c6-27ce-4907-7eb0-08daef65f000
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 21:43:52.5208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFW9V/aM0eMNRBjylH6MRabu6rqW4W3lzf0Yo4kSn6Fnh/Xu3lLFCMxm8hhDbJKDme1swedrGbfrz/CKg9ls6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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
Cc: intel-gfx@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 03, 2023 at 01:02:15PM +0000, Tvrtko Ursulin wrote:
> 
> On 02/01/2023 07:30, Boris Brezillon wrote:
> > On Fri, 30 Dec 2022 12:55:08 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> > > On Fri, 30 Dec 2022 11:20:42 +0100
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > 
> > > > Hello Matthew,
> > > > 
> > > > On Thu, 22 Dec 2022 14:21:11 -0800
> > > > Matthew Brost <matthew.brost@intel.com> wrote:
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
> > > > 
> > > > Oh, that's interesting. I've been trying to solve the same sort of
> > > > issues to support Arm's new Mali GPU which is relying on a FW-assisted
> > > > scheduling scheme (you give the FW N streams to execute, and it does
> > > > the scheduling between those N command streams, the kernel driver
> > > > does timeslice scheduling to update the command streams passed to the
> > > > FW). I must admit I gave up on using drm_sched at some point, mostly
> > > > because the integration with drm_sched was painful, but also because I
> > > > felt trying to bend drm_sched to make it interact with a
> > > > timeslice-oriented scheduling model wasn't really future proof. Giving
> > > > drm_sched_entity exlusive access to a drm_gpu_scheduler probably might
> > > > help for a few things (didn't think it through yet), but I feel it's
> > > > coming short on other aspects we have to deal with on Arm GPUs.
> > > 
> > > Ok, so I just had a quick look at the Xe driver and how it
> > > instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
> > > have a better understanding of how you get away with using drm_sched
> > > while still controlling how scheduling is really done. Here
> > > drm_gpu_scheduler is just a dummy abstract that let's you use the
> > > drm_sched job queuing/dep/tracking mechanism. The whole run-queue
> > > selection is dumb because there's only one entity ever bound to the
> > > scheduler (the one that's part of the xe_guc_engine object which also
> > > contains the drm_gpu_scheduler instance). I guess the main issue we'd
> > > have on Arm is the fact that the stream doesn't necessarily get
> > > scheduled when ->run_job() is called, it can be placed in the runnable
> > > queue and be picked later by the kernel-side scheduler when a FW slot
> > > gets released. That can probably be sorted out by manually disabling the
> > > job timer and re-enabling it when the stream gets picked by the
> > > scheduler. But my main concern remains, we're basically abusing
> > > drm_sched here.
> > > 
> > > For the Arm driver, that means turning the following sequence
> > > 
> > > 1. wait for job deps
> > > 2. queue job to ringbuf and push the stream to the runnable
> > >     queue (if it wasn't queued already). Wakeup the timeslice scheduler
> > >     to re-evaluate (if the stream is not on a FW slot already)
> > > 3. stream gets picked by the timeslice scheduler and sent to the FW for
> > >     execution
> > > 
> > > into
> > > 
> > > 1. queue job to entity which takes care of waiting for job deps for
> > >     us
> > > 2. schedule a drm_sched_main iteration
> > > 3. the only available entity is picked, and the first job from this
> > >     entity is dequeued. ->run_job() is called: the job is queued to the
> > >     ringbuf and the stream is pushed to the runnable queue (if it wasn't
> > >     queued already). Wakeup the timeslice scheduler to re-evaluate (if
> > >     the stream is not on a FW slot already)
> > > 4. stream gets picked by the timeslice scheduler and sent to the FW for
> > >     execution
> > > 
> > > That's one extra step we don't really need. To sum-up, yes, all the
> > > job/entity tracking might be interesting to share/re-use, but I wonder
> > > if we couldn't have that without pulling out the scheduling part of
> > > drm_sched, or maybe I'm missing something, and there's something in
> > > drm_gpu_scheduler you really need.
> > 
> > On second thought, that's probably an acceptable overhead (not even
> > sure the extra step I was mentioning exists in practice, because dep
> > fence signaled state is checked as part of the drm_sched_main
> > iteration, so that's basically replacing the worker I schedule to
> > check job deps), and I like the idea of being able to re-use drm_sched
> > dep-tracking without resorting to invasive changes to the existing
> > logic, so I'll probably give it a try.
> 
> I agree with the concerns and think that how Xe proposes to integrate with
> drm_sched is a problem, or at least significantly inelegant.
>

Inelegant is a matter of opinion, I actually rather like this solution.

BTW this isn't my design rather this was Jason's idea.
 
> AFAICT it proposes to have 1:1 between *userspace* created contexts (per
> context _and_ engine) and drm_sched. I am not sure avoiding invasive changes
> to the shared code is in the spirit of the overall idea and instead
> opportunity should be used to look at way to refactor/improve drm_sched.
>

Yes, it is 1:1 *userspace* engines and drm_sched.

I'm not really prepared to make large changes to DRM scheduler at the
moment for Xe as they are not really required nor does Boris seem they
will be required for his work either. I am interested to see what Boris
comes up with.

> Even on the low level, the idea to replace drm_sched threads with workers
> has a few problems.
> 
> To start with, the pattern of:
> 
>   while (not_stopped) {
> 	keep picking jobs
>   }
> 
> Feels fundamentally in disagreement with workers (while obviously fits
> perfectly with the current kthread design).
>

The while loop breaks and worker exists if no jobs are ready.

> Secondly, it probably demands separate workers (not optional), otherwise
> behaviour of shared workqueues has either the potential to explode number
> kernel threads anyway, or add latency.
> 

Right now the system_unbound_wq is used which does have a limit on the
number of threads, right? I do have a FIXME to allow a worker to be
passed in similar to TDR.

WRT to latency, the 1:1 ratio could actually have lower latency as 2 GPU
schedulers can be pushing jobs into the backend / cleaning up jobs in
parallel.

> What would be interesting to learn is whether the option of refactoring
> drm_sched to deal with out of order completion was considered and what were
> the conclusions.
>

I coded this up a while back when trying to convert the i915 to the DRM
scheduler it isn't all that hard either. The free flow control on the
ring (e.g. set job limit == SIZE OF RING / MAX JOB SIZE) is really what
sold me on the this design.

> Second option perhaps to split out the drm_sched code into parts which would
> lend themselves more to "pick and choose" of its functionalities.
> Specifically, Xe wants frontend dependency tracking, but not any scheduling
> really (neither least busy drm_sched, neither FIFO/RQ entity picking), so
> even having all these data structures in memory is a waste.
> 

I don't think that we are wasting memory is a very good argument for
making intrusive changes to the DRM scheduler.

> With the first option then the end result could be drm_sched per engine
> class (hardware view), which I think fits with the GuC model. Give all
> schedulable contexts (entities) to the GuC and then mostly forget about
> them. Timeslicing and re-ordering and all happens transparently to the
> kernel from that point until completion.
> 

Out-of-order problem still exists here.

> Or with the second option you would build on some smaller refactored
> sub-components of drm_sched, by maybe splitting the dependency tracking from
> scheduling (RR/FIFO entity picking code).
> 
> Second option is especially a bit vague and I haven't thought about the
> required mechanics, but it just appeared too obvious the proposed design has
> a bit too much impedance mismatch.
>

IMO ROI on this is low and again lets see what Boris comes up with.

Matt

> Oh and as a side note, when I went into the drm_sched code base to remind
> myself how things worked, it is quite easy to find some FIXME comments which
> suggest people working on it are unsure of locking desing there and such. So
> perhaps that all needs cleanup too, I mean would benefit from
> refactoring/improving work as brainstormed above anyway.
> 
> Regards,
> 
> Tvrtko
