Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB4699C01
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 19:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0857110EE89;
	Thu, 16 Feb 2023 18:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB7510EE88;
 Thu, 16 Feb 2023 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676571609; x=1708107609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/nPVJwjCsgkrzsKIb72sJNyidQlLOBF4eH8VFX8BvTM=;
 b=e1appNzMi+nKGwj5uDM2vRzuQiClNNIz7huukLz5a4ATSbheliochLtT
 +Obm/7ayFxj/bw7n3rT8q+OOiO5rAicXfxT9wJHFLxXWsKsqcgZsfWlng
 lF6QMXW7TMFIfjUbIhS7ceqpVwdfhD2X3iGcQR5kw9RTGeATeW1Sm1OON
 HuHolxMRSPvjg0CDkTPXjXjfoQ18v6bv7wZJe9jbsowhZ7wA+sBkLRaSn
 07CZF2OpeGg2R4KvFE3aB6+I3+OLL36wD0hBqN/cvrp6VKU3p/i0aKM3X
 OVXpMTitSZJYIklUB7pQysPrZKMPrPrzMvFiXxMSh931H7WM0fn7Fq5uj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311427502"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311427502"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 10:20:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="779467848"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="779467848"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2023 10:20:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 10:20:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 10:20:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 10:20:07 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 10:20:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enjc/3TFyAMZgst+Gz6LtXEaONOwJEm1wUfsGg/oYBfKYXu1Dy0JZmjO+Ovfi3XAwLzXxUL1qt7Cv9b637fxeAq9rgobtgRCXKqWssuEs+7hwyRfW66eeg2nquB2jHjJEXe4YnQ2Mi6W8hV+NMVdqPOFkI6s3+fsHMDvl5PhPYrhaxJJvRPuoVUGSnWLYy7UbgsuIxaIfUtT40zQXAuQjGvtaTLlXDYqwiCbOnxN/4zcbk14+r5GMfLL4UCbq609nHs+YNgIO4a2MnEQEx3e4lZQylPENe7FWlmYzOwW75Bqg0zqgin4cYMOO/exXCWrdiYoyeVH52EdBbsfm8GHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNQVzZBcYb+tXPqAIf3G6445bCRZo4Ez8Zv3F/jzMy8=;
 b=KlemV/KzZjXzcFidhZRtMZ5mLS2Sj9Q8mWhJ26/EMWnjraWhqGs3qjMgHou6ZhYjZBYxUpLfUz/QQis04LqderERyow7Wn8ySerQKSqr+wT12X58LJvQ6CRnXPz3Q78zJPT/Ar/TQA0Fe4XpFSvk3bOmIUKUgHh2onzU8hm1Uu8nAveA2HSZFQUf9tqpef1bYa9AVY06CQOIeD8WBVzJB7QmTKikAAD/4tgFzGWEWFIpKBnP9OcnQSrCddHOGTJYq7l4+xtLH5Ef7OBahx2ACFwUoruDv4Pp4fHH5xp/qHv2BP+q1GVZ6LXERyXhxp9c5RIdLK/PVSvx1BZOjQaWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 18:19:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 18:19:58 +0000
Date: Thu, 16 Feb 2023 13:19:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Rob Clark <robdclark@gmail.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
Message-ID: <Y+5zyeSncSbsXHWG@intel.com>
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: bd04de2e-d964-409f-6a2b-08db104a6920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzOlQxNVve9NRtaX9LLpUcJHVcq3Z+VP8ngExH5RrERABo6soVwc2QkO5pw5LkZASgnBMqjX75PUhotaoGK5OStw2AizVXeVwfcriFFSodMw2wlFG4elt1jpytjmJ/YOuhE4oNM6Mvc787XddRO36jhqJSphvmwCOF4Gp5GT9qPo9PU10BMonk1XCDKPpprd1PMKvOFaGLNCkoCf8xWNm68iGKEYWpHJUugTk/40UibrBAYqtl+AAECMA2KqoJHFP6pgBqei9sxShwb3P3PYth+UOIDqX/caGbQOuo42UA76hQeUzM2wvT507jCkZLWLxBImx22GVR63DlVIzfVPd5lJOMBxCHdqercIPByE2TYQiAUPKG7szPsZ+Vbau9yEaIZSQROuu0GhfoXR3cSWF/eg8UmiyAxxaZoTrintU+f5taiQEvctkg/rQsxwNOWd6MZbMR/ZHJISUef35fHVMNZ/5gf/IQD0kqkVTbpc43LO4KTR0NA3/cZBwz0iJmDc4ZDDZ1LYRqJuhFVvlKz7+7juW+Z/cx/IhltrBfEkVqCKtHdOl6OoRL+6hvlRMgs6aqsq/+Epnu3MZBQj66RCeUAPY2qbW1e7hp2EOgeek4iueQHTHsVia1Gn7MEmplW4j/EmN8Cwjt8N4NEC+ke0kRceVHIGvNoaAokwDJzu34ygWbfVZGxyur+qniUcTT3l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199018)(26005)(38100700002)(6486002)(966005)(6506007)(6666004)(186003)(478600001)(6512007)(53546011)(54906003)(82960400001)(110136005)(83380400001)(2616005)(2906002)(41300700001)(86362001)(36756003)(8676002)(66946007)(66556008)(66476007)(316002)(44832011)(4326008)(5660300002)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EnZ1E3z4tYpJS5C8WJCnrIfkmuiKZmTIU5Nlyv3he0THUrBz7M9XIRCVZ+cj?=
 =?us-ascii?Q?C/UlXBg261dBF4akjyyfiP4H4SY6CQMPSa6uAKet6+l9dZVIpQFHZml9lT96?=
 =?us-ascii?Q?QmxIm393QEyVgf21UhuQJYXVl9HIJVI9FtKaf1OGa4Sw7iwJBL/DVtfEaXVD?=
 =?us-ascii?Q?PtGVCOpS36iZGc2kYU5d9rkt4EybFJJ1n4xQGDUey3JTfkCIqoBUnkLdeQaS?=
 =?us-ascii?Q?zH6YEVKIWEf/mFrOdMXnTRBvNcrDh3zoUTfc2MzuNxEmETp0/rrvbpxiBw2+?=
 =?us-ascii?Q?ZXHx68xxxy/rFFpSCLFaVefCpQNsOfy1HgaNDMd4de17PFgmjQph2ejnDfRi?=
 =?us-ascii?Q?wkLQSLIHbG3f9Hnqhnk1uOmFp/fp87mOrRb1d8OE9A3BXLkjo78czJyOSiPg?=
 =?us-ascii?Q?+8LxjeQ1+ORLnjH26SvhsaZpo6nuQ00EFVZETTJdHCjPkVW82Ma4i0C1URgN?=
 =?us-ascii?Q?LFe0lF86HLB7C53BKdkM+N0yYzHCgm0vXhyZpvDoOhkWeYB/u++8doBXcXDv?=
 =?us-ascii?Q?6Qb1ZvbrZ3bjHUVZwW3W9teWMrrUCJzYRYwXqfkgnZVeoUxKdFYG4iIMzyp7?=
 =?us-ascii?Q?yHqvq/ZqsnnLOJxKYnevol95jo85tTUTXBP68xYr0boBADPcAR7La6AIOjWV?=
 =?us-ascii?Q?6T+JKrjwe95iEXsYKEuG0aIWapqqF1483GN2hne8jdejkvmCUtHz1wjunCL0?=
 =?us-ascii?Q?a71Z4NNKp7FXQM2RCUY+OKK2vezTTNWS877YS5jIlwSoLXg2oLL2d6Jxxuvx?=
 =?us-ascii?Q?Xbx7HtcRhqH5LA5ooepPDVQCy+JPcc+8GM9buQbgjMn3iMsMMfGtWsHV3mwX?=
 =?us-ascii?Q?++SrRFePmqRuaXuZzPWqZ6niVA+lkYLgaCqbazuvXxL44JxwjC8QjB8n40Kq?=
 =?us-ascii?Q?VegfIaxH9IIObHUnMyIGuphl/ylacCta9f0E7Xwc+EhbwUQhPb9/HQNjGwz7?=
 =?us-ascii?Q?UpUoA1LyMxuLjlDfA4ips0fFBAH5n4DybsQXwezKR5sbFEhzX4+dZCckMtoA?=
 =?us-ascii?Q?VyWo7hHuJiXembVqxJhHmCB8BaJF045bB1W5V9W4eBe70F3OpsSHul3SqTcM?=
 =?us-ascii?Q?QTxE9pjkOpL7sZsH8BBesNst9Ysc5fv23kRL4BFPb0KcP8N9oc2551IjF+Wx?=
 =?us-ascii?Q?G9yo3vujnMQ6utj7Gtal5bFsvz/JpjzJ9YHJ1Y14ZXQdXTKJBgKzOdCnqr/x?=
 =?us-ascii?Q?47P1o0CVdRvtHLx0aRjJRKNSzb9CnuHFaKRtjRBD1L+IesE0j15JqkNAoas1?=
 =?us-ascii?Q?sIgSqO6j62ZMOWbSStTk+OUnpqKxeWIFFuuVbRUtuGTmhCBwPawa9NqTZunx?=
 =?us-ascii?Q?iX9yj2qDvEvixxRgP/Y9TxnvoJlaqif6WY/8KCc9+eeuvwn+sxdBECwNpBNJ?=
 =?us-ascii?Q?mJVUqkyOLp8Bw1NtdaMv+oayNqLj/tjSY/dibgrrdHPAGjsJA0PajuvRIFPg?=
 =?us-ascii?Q?kBgT1nOK1k1HXs+cYGx/uu/ys1bCiE3WnLd2mizAbkx4cC/CWJ8K8HK1enSM?=
 =?us-ascii?Q?A0hMiB1V1UBQFBzEWZP2WvYOQ+vWYX+BOIfZNrPSdh0HqGfPEBwDHja9xuDG?=
 =?us-ascii?Q?t+UVPP6o87rUMDWgsm9kSno11NFkezyCnyIe++ukQ5UA7t8OPJjhURr7Icc1?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd04de2e-d964-409f-6a2b-08db104a6920
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 18:19:58.4475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGUv0i9orWmEAEoN/8FtF1Pfdk8sHVDvKv0q/Fa449XVEv1hDZz4V6m5RgaCcNGasFlahZQ8WTzKakmJpqIiCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 11:14:00AM -0800, Rob Clark wrote:
> On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >
> > In i915 we have this concept of "wait boosting" where we give a priority boost
> > for instance to fences which are actively waited upon from userspace. This has
> > it's pros and cons and can certainly be discussed at lenght. However fact is
> > some workloads really like it.
> >
> > Problem is that with the arrival of drm syncobj and a new userspace waiting
> > entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
> > this mini series really (really) quickly to see if some discussion can be had.
> >
> > It adds a concept of "wait count" to dma fence, which is incremented for every
> > explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
> > dma_fence_add_callback but from explicit/userspace wait paths).
> 
> I was thinking about a similar thing, but in the context of dma_fence
> (or rather sync_file) fd poll()ing.  How does the kernel differentiate
> between "housekeeping" poll()ers that don't want to trigger boost but
> simply know when to do cleanup, and waiters who are waiting with some
> urgency.  I think we could use EPOLLPRI for this purpose.
> 
> Not sure how that translates to waits via the syncobj.  But I think we
> want to let userspace give some hint about urgent vs housekeeping
> waits.

Should the hint be on the waits, or should the hints be on the executed
context?

In the end we need some way to quickly ramp-up the frequency to avoid
the execution bubbles.

waitboost is trying to guess that, but in some cases it guess wrong
and waste power.

btw, this is something that other drivers might need:

https://gitlab.freedesktop.org/drm/amd/-/issues/1500#note_825883
Cc: Alex Deucher <alexander.deucher@amd.com>

> 
> Also, on a related topic: https://lwn.net/Articles/868468/
> 
> BR,
> -R
> 
> > Individual drivers can then inspect this via dma_fence_wait_count() and decide
> > to wait boost the waits on such fences.
> >
> > Again, quickly put together and smoke tested only - no guarantees whatsoever and
> > I will rely on interested parties to test and report if it even works or how
> > well.
> >
> > v2:
> >  * Small fixups based on CI feedback:
> >     * Handle decrement correctly for already signalled case while adding callback.
> >     * Remove i915 assert which was making sure struct i915_request does not grow.
> >  * Split out the i915 patch into three separate functional changes.
> >
> > Tvrtko Ursulin (5):
> >   dma-fence: Track explicit waiters
> >   drm/syncobj: Mark syncobj waits as external waiters
> >   drm/i915: Waitboost external waits
> >   drm/i915: Mark waits as explicit
> >   drm/i915: Wait boost requests waited upon by others
> >
> >  drivers/dma-buf/dma-fence.c               | 102 ++++++++++++++++------
> >  drivers/gpu/drm/drm_syncobj.c             |   6 +-
> >  drivers/gpu/drm/i915/gt/intel_engine_pm.c |   1 -
> >  drivers/gpu/drm/i915/i915_request.c       |  13 ++-
> >  include/linux/dma-fence.h                 |  14 +++
> >  5 files changed, 101 insertions(+), 35 deletions(-)
> >
> > --
> > 2.34.1
> >
