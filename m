Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13928784F3F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 05:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96BF10E0FD;
	Wed, 23 Aug 2023 03:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFB410E0FD;
 Wed, 23 Aug 2023 03:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692761322; x=1724297322;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JOpGh2CdXxuOCdTnaYNhnJVn09kYWYJy17H2+PbgQi0=;
 b=ZsG6/rFs+oKlWjJyFuxAdQF/THsOZ6cUCHThd0zabOpUIYcr1uEzAIeP
 LLEkv2N44DawfXlBnJQY1q5Bk5q2vbI60NZBDXN6+/+obDiAxAs1Po5M8
 HJxpVCE+uwg5PRnyRtEe+5kthJLTXEHcDTVDLBMuKSJLhYJY5K5eeZLtC
 vuZdXu9WmAvhSZRkwwGs6kntobYpIEHYc9l5yYeaAg9Y08s4JvWA2IIgq
 pFVpqqBCDs5vWxolR7ZHBE8Xbe/Hv0IIZQksxebZxAEubGkiAAUNKDmT6
 DmuIWU67QiVGm2uDQiVzWPLWvR9FJHmk+IMUg3k8EcYMdVHW8q25xqXfb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="371464615"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="371464615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 20:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="771563980"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="771563980"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 22 Aug 2023 20:28:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 20:28:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 20:28:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 20:28:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 20:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyalJyOPOq5zrnOQVng/LVzMHAF7Cx3DglXEmuCphKNf5tAoN3EZNer+7ayGX8Zq2/ZVF2nkGT0iHEhdBmy4XrtDzS0sbWOg+5HZpECBk1wiXbUqJbXv1xT9yt5d5E4ul7Z1DlSRebZc7aJxeKgzuNrRe98Yok69clxI+L/fPm5PKcdjrL1DSPXBhPuFgS+Rzwjz+YIujYNa3can3lbFIEdlAqvsleJ3eJyOvMoeBdydoGa7JC+97FtztUcSmSS8n9Om1LWBGu38+i43TIZEJAqCMgZ/zer6gpujyPkeVlBMQblBXNN3SEf13oSa2EE+bwbyCBnPdMREX3rbmXGPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4f5pM4iPDWUhzaIgnEzu2uHP3N3TVyCstfbp5E+UmfE=;
 b=gct47Vt3ArFCPVJL8iCZbpXvk4hif+SJz+gjg0BDVcxfMk1YNjK1llxS/fS/gocFOWSlv0q1BMiYMxzNWGZfxrHLxBKuxX4ZZ1RNmP1K7bvAJVfg9wX0eJSH6qIY60uAhnwoF2PGtlG21d+dWoakECVq/OjqRt3SZWbsH7cIJ4VP/HsN7iHgExW1dBryCEdMEH+RN6v2XpWGOXqBy8UwzKfuJPynjoJP9sM9L4uJ95zDYUB65CoJvD4hW1sghNnb7ohCNWEy3+/Pi21ixwM9f+4thxOa/zxFpgu8QRJ4wXUhtny17zlscenbV7pO9C5ehIu76dEfB6Fa64hRpUfypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 03:28:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 03:28:36 +0000
Date: Wed, 23 Aug 2023 03:27:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZOV8l08PZ/lqfGx9@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
 <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
 <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
 <c7c32797-9ca1-9f78-d3e6-07f827731ee6@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7c32797-9ca1-9f78-d3e6-07f827731ee6@amd.com>
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 742809ca-00d1-444e-baf5-08dba3890902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hftM/rAhIwvYaPF2/fjzrsc6NPfQufT6pxJXAF8Vx59VPtLlZGfiGPoyqgVSiS4omSfb5lWxh7wX4FKl4MRu7NDZ7IeAwV5uJl2kbnJa1ZHk9l12k6uubdNxeO8ad2bMQkLHvIaoQ6LQJff5txpKTX0DdIfQhvFelXcx3/LmC1hWat5X3n2ZAYznDaSUQkGdfF46p/6HB4286AHwvmyTBDSsTIeL5BQLhU8KnX61GyBnd1gcnruVy3aqJOqPWXXJHlKa3Y/FlYk8rI/PrPgqVhkKRWvCn8DSySIWLDngIFwdi85Jpb6z/l1lxue/4yLxErqXo2rTebWXmfJHbBhiMC+2E4Zr2EXtqGTNSerc5xzfZ+Ns3+x98Ues6uqNxAceWNIwuiQK8Y0cXRJacka8WbhOKgh2o+x6YuubkMdPVYfbrO9pK4nd+skA4yb2iZqkjiBzQAY47PeNtZee+6KRQMzy1NBBNm81RLlUuFGtUksvfgF+RaOjfpdnbxxaQVGjrd39b84NYj6EG0Z2t/rl45tAoLAkcLnBZcTClEeeokFOd7WwExf6hszSfof0M1eQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(1800799009)(186009)(451199024)(6666004)(6486002)(6506007)(38100700002)(6512007)(82960400001)(66574015)(83380400001)(26005)(66556008)(2906002)(6916009)(316002)(66946007)(30864003)(66476007)(5660300002)(86362001)(41300700001)(44832011)(7416002)(478600001)(8676002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KwljO59+WcRSntSCCWiaRNUBha8wSdewnuxCjpp8axNgJZdf8XVaW9C+x0?=
 =?iso-8859-1?Q?Hi2TtVcVn8NWpVWw3AqI2rjiuDjO/43/8muPLgkxDxrxm9ck5Xqop94ne5?=
 =?iso-8859-1?Q?KyI+NUVb6c+FCaZS8s4mpYatMkCGkH3Jkr4N51vwLrvAIEDrpA5hntj5T8?=
 =?iso-8859-1?Q?hDaLvVftiqTLaj5uca746KNEodqOuQpQA/R11Xmi+L+HE0R3w99vJ6vkGk?=
 =?iso-8859-1?Q?vmOSHgzbZAZuEQ2RWAoYO3LeEXWY/6wLunQkPchhMp/pnKFvNId9hty+Oz?=
 =?iso-8859-1?Q?ADblkuIFomf1KU7LrujabbEW1DW+qrrHZUxNGsIZDdLkeBA2s/dMgakoQE?=
 =?iso-8859-1?Q?ErepYvvHddvqxS9joBdLzjBzeQzMFgW7DArwZBFFlZNbNudW1fLf22sSSp?=
 =?iso-8859-1?Q?08fA0HXn0jE3J9w3+vvTwdJW0tLXAdMZrW/WsiPV+hRvIPA1k4gpw7e95G?=
 =?iso-8859-1?Q?Fm9L+XhXgnRR3ydB3Jl4dJTovWzOm+jXn1dNbcMGdODT0kFIvs0LAL9PQK?=
 =?iso-8859-1?Q?McFkRgVbC07hUr/KEL9d6n66dbS6Asy0zt44lzr/Ghz2sW3mh4sSsE6/g2?=
 =?iso-8859-1?Q?iw3goWhh0/qdOig/CgV8dPvlgimf4jukVIxKXIKF7ChIsFEuVdSgwxNRjs?=
 =?iso-8859-1?Q?KeWZoq8YidHlDzTKIlfp5a0o/fZIQtPQYrecfRsg9bYwAY2Z9RkePtekna?=
 =?iso-8859-1?Q?NPUrSZdDVJg9YPvMGMCXC2zBIbtaDiphg8YWnanBD/fV1wR/VQqCYWGOU2?=
 =?iso-8859-1?Q?H4YoynzqJ7pvSK/mguh4oOOgLnx+jiItdwqiNn0BUwBaR4g+1LBgc2AVKn?=
 =?iso-8859-1?Q?B4l2PhmsHvFpTWII4QH4LYp1UgerI/MCd8pYfUw+LkGZSBhrQ4tJUAntr6?=
 =?iso-8859-1?Q?oRPVD2XsH8Os8S+ORfjwDJxWgtGXElNt8JJHymB1dNCWNFy/dGDPskqTxT?=
 =?iso-8859-1?Q?Bo2bcbkYChBitq51sRxbLVsHgkhQAINq99gN+RT14njZQlha3q6KKyyBuZ?=
 =?iso-8859-1?Q?BYQifH5NhwTktaVi8K8jD/nLpZejoypI9yDWqRnm3NxlOrsKrauRs4Lb2U?=
 =?iso-8859-1?Q?fzbgKSCgjPcwopEEIF4vznG6OIAQPcmBgt8pxIkFgN9QGuIeaLggkzdGph?=
 =?iso-8859-1?Q?oG+J1es/GcLipLRcBxXfnBFsPlWAj9OO2xGTtz/LjZCgag9Xj2kVN4CTdV?=
 =?iso-8859-1?Q?26VHvIYF0gkv4IDCLTubJ0JQT/wNYRB7rICSlIptbAJ9HMHSS96n6lNfuB?=
 =?iso-8859-1?Q?QqkPiwe4uhv5l+7OmqCbAnyYtpndyFKK8tkiENh6WoIivus5XNi9lMVt5C?=
 =?iso-8859-1?Q?pCzj7y6LfJv91DeoE7/Vz2H93cHw0RqIb61dMQ8e+9PGmtFjHJk8PPDoGT?=
 =?iso-8859-1?Q?FtHd1pEf17NidZIDD6S+p9xj/Eq7ugLdtgv1kxUK+kwB0ncvyoePHeLhfB?=
 =?iso-8859-1?Q?3igaiQ8zoUFbsdXTaVNYmuZpqxl1PK4ntyLKTBYLkqjnBKsP52iVs9IFBe?=
 =?iso-8859-1?Q?JINH4ZA8mCGwZkW4jTq09IJWE+XHOX2zpxxlHkVsgji5lvNvluLDR4/pH2?=
 =?iso-8859-1?Q?OHahxoHMX2NFv+Lu1UlZuczrQMvqUkObgGcE8F41LquVYBrY3bbhP7N6te?=
 =?iso-8859-1?Q?vokeD50JrsO+EzjKZbrmROp4EWs3tBMGtlX1mSs3O9VaX3SqvMm6+l6w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 742809ca-00d1-444e-baf5-08dba3890902
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 03:28:36.1866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOO+SuOcPphaRBgwXPYPLQA0hbA5K9Yx9ezY4XUJtWzHaAhAXsrq2yPzLjytRNUJP8qPpi/T6SucTm+dTurIFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 03:17:29PM +0200, Christian König wrote:
> Am 18.08.23 um 15:13 schrieb Matthew Brost:
> > On Fri, Aug 18, 2023 at 07:27:33AM +0200, Christian König wrote:
> > > Am 17.08.23 um 19:54 schrieb Matthew Brost:
> > > > On Thu, Aug 17, 2023 at 03:39:40PM +0200, Christian König wrote:
> > > > > Am 11.08.23 um 04:31 schrieb Matthew Brost:
> > > > > > Rather than call free_job and run_job in same work item have a dedicated
> > > > > > work item for each. This aligns with the design and intended use of work
> > > > > > queues.
> > > > > I would rather say we should get completely rid of the free_job callback.
> > > > > 
> > > > Would we still have work item? e.g. Would we still want to call
> > > > drm_sched_get_cleanup_job which removes the job from the pending list
> > > > and adjusts the TDR? Trying to figure out out what this looks like. We
> > > > probably can't do all of this from an IRQ context.
> > > > 
> > > > > Essentially the job is just the container which carries the information
> > > > > which are necessary before you push it to the hw. The real representation of
> > > > > the submission is actually the scheduler fence.
> > > > > 
> > > > Most of the free_jobs call plus drm_sched_job_cleanup + a put on job. In
> > > > Xe this cannot be called from an IRQ context either.
> > > > 
> > > > I'm just confused what exactly you are suggesting here.
> > > To summarize on one sentence: Instead of the job we keep the scheduler and
> > > hardware fences around after pushing the job to the hw.
> > > 
> > > The free_job callback would then be replaced by dropping the reference on
> > > the scheduler and hw fence.
> > > 
> > > Would that work for you?
> > > 
> > I don't think so for a few reasons.
> > 
> > The job and hw fence are different structures (also different allocs too)
> > for a reason. The job referenced until it is complete (hw fence is
> > signaled) and the free_job is called. This reference is needed for the
> > TDR to work properly and also some reset flows too.
> 
> That is exactly what I want to avoid, tying the TDR to the job is what some
> AMD engineers pushed for because it looked like a simple solution and made
> the whole thing similar to what Windows does.
> 
> This turned the previous relatively clean scheduler and TDR design into a
> complete nightmare. The job contains quite a bunch of things which are not
> necessarily available after the application which submitted the job is torn
> down.
>

Agree the TDR shouldn't be accessing anything application specific
rather just internal job state required to tear the job down on the
hardware.
 
> So what happens is that you either have stale pointers in the TDR which can
> go boom extremely easily or we somehow find a way to keep the necessary

I have not experenced the TDR going boom in Xe.

> structures (which include struct thread_info and struct file for this driver
> connection) alive until all submissions are completed.
> 

In Xe we keep everything alive until all submissions are completed. By
everything I mean the drm job, entity, scheduler, and VM via a reference
counting scheme. All of these structures are just kernel state which can
safely be accessed even if the application has been killed.

If we need to teardown on demand we just set the TDR to a minimum value and
it kicks the jobs off the hardware, gracefully cleans everything up and
drops all references. This is a benefit of the 1 to 1 relationship, not
sure if this works with how AMDGPU uses the scheduler.

> Delaying application tear down is also not an option because then you run
> into massive trouble with the OOM killer (or more generally OOM handling).
> See what we do in drm_sched_entity_flush() as well.
> 

Not an issue for Xe, we never call drm_sched_entity_flush as our
referencing counting scheme is all jobs are finished before we attempt
to tear down entity / scheduler.

> Since adding the TDR support we completely exercised this through in the
> last two or three years or so. And to sum it up I would really like to get
> away from this mess again.
> 
> Compared to that what i915 does is actually rather clean I think.
> 

Not even close, resets where a nightmare in the i915 (I spend years
trying to get this right and probably still completely work) and in Xe
basically got it right on the attempt.

> >   Also in Xe some of
> > things done in free_job cannot be from an IRQ context, hence calling
> > this from the scheduler worker is rather helpful.
> 
> Well putting things for cleanup into a workitem doesn't sounds like
> something hard.
>

That is exactly what we doing in the scheduler with the free_job
workitem.

> Question is what do you really need for TDR which is not inside the hardware
> fence?
>

A reference to the entity to be able to kick the job off the hardware.
A reference to the entity, job, and VM for error capture.

We also need a reference to the job for recovery after a GPU reset so
run_job can be called again for innocent jobs.

All of this leads to believe we need to stick with the design.

Matt

> Regards,
> Christian.
> 
> > 
> > The HW fence can live for longer as it can be installed in dma-resv
> > slots, syncobjs, etc... If the job and hw fence are combined now we
> > holding on the memory for the longer and perhaps at the mercy of the
> > user. We also run the risk of the final put being done from an IRQ
> > context which again wont work in Xe as it is currently coded. Lastly 2
> > jobs from the same scheduler could do the final put in parallel, so
> > rather than having free_job serialized by the worker now multiple jobs
> > are freeing themselves at the same time. This might not be an issue but
> > adds another level of raceyness that needs to be accounted for. None of
> > this sounds desirable to me.
> > 
> > FWIW what you suggesting sounds like how the i915 did things
> > (i915_request and hw fence in 1 memory alloc) and that turned out to be
> > a huge mess. As rule of thumb I generally do the opposite of whatever
> > the i915 did.
> > 
> > Matt
> > 
> > > Christian.
> > > 
> > > > Matt
> > > > 
> > > > > All the lifetime issues we had came from ignoring this fact and I think we
> > > > > should push for fixing this design up again.
> > > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
> > > > > >     include/drm/gpu_scheduler.h            |   8 +-
> > > > > >     2 files changed, 106 insertions(+), 39 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > index cede47afc800..b67469eac179 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > > > >      * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> > > > > >      *
> > > > > >      * @rq: scheduler run queue to check.
> > > > > > + * @dequeue: dequeue selected entity
> > > > > >      *
> > > > > >      * Try to find a ready entity, returns NULL if none found.
> > > > > >      */
> > > > > >     static struct drm_sched_entity *
> > > > > > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> > > > > >     {
> > > > > >     	struct drm_sched_entity *entity;
> > > > > > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > >     	if (entity) {
> > > > > >     		list_for_each_entry_continue(entity, &rq->entities, list) {
> > > > > >     			if (drm_sched_entity_is_ready(entity)) {
> > > > > > -				rq->current_entity = entity;
> > > > > > -				reinit_completion(&entity->entity_idle);
> > > > > > +				if (dequeue) {
> > > > > > +					rq->current_entity = entity;
> > > > > > +					reinit_completion(&entity->entity_idle);
> > > > > > +				}
> > > > > >     				spin_unlock(&rq->lock);
> > > > > >     				return entity;
> > > > > >     			}
> > > > > > @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > >     	list_for_each_entry(entity, &rq->entities, list) {
> > > > > >     		if (drm_sched_entity_is_ready(entity)) {
> > > > > > -			rq->current_entity = entity;
> > > > > > -			reinit_completion(&entity->entity_idle);
> > > > > > +			if (dequeue) {
> > > > > > +				rq->current_entity = entity;
> > > > > > +				reinit_completion(&entity->entity_idle);
> > > > > > +			}
> > > > > >     			spin_unlock(&rq->lock);
> > > > > >     			return entity;
> > > > > >     		}
> > > > > > @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > > >      * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> > > > > >      *
> > > > > >      * @rq: scheduler run queue to check.
> > > > > > + * @dequeue: dequeue selected entity
> > > > > >      *
> > > > > >      * Find oldest waiting ready entity, returns NULL if none found.
> > > > > >      */
> > > > > >     static struct drm_sched_entity *
> > > > > > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> > > > > >     {
> > > > > >     	struct rb_node *rb;
> > > > > > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > >     		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> > > > > >     		if (drm_sched_entity_is_ready(entity)) {
> > > > > > -			rq->current_entity = entity;
> > > > > > -			reinit_completion(&entity->entity_idle);
> > > > > > +			if (dequeue) {
> > > > > > +				rq->current_entity = entity;
> > > > > > +				reinit_completion(&entity->entity_idle);
> > > > > > +			}
> > > > > >     			break;
> > > > > >     		}
> > > > > >     	}
> > > > > > @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > > >     }
> > > > > >     /**
> > > > > > - * drm_sched_submit_queue - scheduler queue submission
> > > > > > + * drm_sched_run_job_queue - queue job submission
> > > > > >      * @sched: scheduler instance
> > > > > >      */
> > > > > > -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > > > > > +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> > > > > >     {
> > > > > >     	if (!READ_ONCE(sched->pause_submit))
> > > > > > -		queue_work(sched->submit_wq, &sched->work_submit);
> > > > > > +		queue_work(sched->submit_wq, &sched->work_run_job);
> > > > > > +}
> > > > > > +
> > > > > > +static struct drm_sched_entity *
> > > > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> > > > > > +
> > > > > > +/**
> > > > > > + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> > > > > > + * @sched: scheduler instance
> > > > > > + */
> > > > > > +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > > > +{
> > > > > > +	if (drm_sched_select_entity(sched, false))
> > > > > > +		drm_sched_run_job_queue(sched);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * drm_sched_free_job_queue - queue free job
> > > > > > + *
> > > > > > + * @sched: scheduler instance to queue free job
> > > > > > + */
> > > > > > +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> > > > > > +{
> > > > > > +	if (!READ_ONCE(sched->pause_submit))
> > > > > > +		queue_work(sched->submit_wq, &sched->work_free_job);
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * drm_sched_free_job_queue_if_ready - queue free job if ready
> > > > > > + *
> > > > > > + * @sched: scheduler instance to queue free job
> > > > > > + */
> > > > > > +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > > > +{
> > > > > > +	struct drm_sched_job *job;
> > > > > > +
> > > > > > +	spin_lock(&sched->job_list_lock);
> > > > > > +	job = list_first_entry_or_null(&sched->pending_list,
> > > > > > +				       struct drm_sched_job, list);
> > > > > > +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > > > > > +		drm_sched_free_job_queue(sched);
> > > > > > +	spin_unlock(&sched->job_list_lock);
> > > > > >     }
> > > > > >     /**
> > > > > > @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> > > > > >     	dma_fence_get(&s_fence->finished);
> > > > > >     	drm_sched_fence_finished(s_fence, result);
> > > > > >     	dma_fence_put(&s_fence->finished);
> > > > > > -	drm_sched_submit_queue(sched);
> > > > > > +	drm_sched_free_job_queue(sched);
> > > > > >     }
> > > > > >     /**
> > > > > > @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> > > > > >     void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> > > > > >     {
> > > > > >     	if (drm_sched_can_queue(sched))
> > > > > > -		drm_sched_submit_queue(sched);
> > > > > > +		drm_sched_run_job_queue(sched);
> > > > > >     }
> > > > > >     /**
> > > > > >      * drm_sched_select_entity - Select next entity to process
> > > > > >      *
> > > > > >      * @sched: scheduler instance
> > > > > > + * @dequeue: dequeue selected entity
> > > > > >      *
> > > > > >      * Returns the entity to process or NULL if none are found.
> > > > > >      */
> > > > > >     static struct drm_sched_entity *
> > > > > > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> > > > > >     {
> > > > > >     	struct drm_sched_entity *entity;
> > > > > >     	int i;
> > > > > > @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > > >     	/* Kernel run queue has higher priority than normal run queue*/
> > > > > >     	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > > > > >     		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > > > > > -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > > > > > -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > > > > > +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > > > > > +							dequeue) :
> > > > > > +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > > > > > +						      dequeue);
> > > > > >     		if (entity)
> > > > > >     			break;
> > > > > >     	}
> > > > > > @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > > > >     EXPORT_SYMBOL(drm_sched_pick_best);
> > > > > >     /**
> > > > > > - * drm_sched_main - main scheduler thread
> > > > > > + * drm_sched_free_job_work - worker to call free_job
> > > > > >      *
> > > > > > - * @param: scheduler instance
> > > > > > + * @w: free job work
> > > > > >      */
> > > > > > -static void drm_sched_main(struct work_struct *w)
> > > > > > +static void drm_sched_free_job_work(struct work_struct *w)
> > > > > >     {
> > > > > >     	struct drm_gpu_scheduler *sched =
> > > > > > -		container_of(w, struct drm_gpu_scheduler, work_submit);
> > > > > > -	struct drm_sched_entity *entity;
> > > > > > +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> > > > > >     	struct drm_sched_job *cleanup_job;
> > > > > > -	int r;
> > > > > >     	if (READ_ONCE(sched->pause_submit))
> > > > > >     		return;
> > > > > >     	cleanup_job = drm_sched_get_cleanup_job(sched);
> > > > > > -	entity = drm_sched_select_entity(sched);
> > > > > > +	if (cleanup_job) {
> > > > > > +		sched->ops->free_job(cleanup_job);
> > > > > > +
> > > > > > +		drm_sched_free_job_queue_if_ready(sched);
> > > > > > +		drm_sched_run_job_queue_if_ready(sched);
> > > > > > +	}
> > > > > > +}
> > > > > > -	if (!entity && !cleanup_job)
> > > > > > -		return;	/* No more work */
> > > > > > +/**
> > > > > > + * drm_sched_run_job_work - worker to call run_job
> > > > > > + *
> > > > > > + * @w: run job work
> > > > > > + */
> > > > > > +static void drm_sched_run_job_work(struct work_struct *w)
> > > > > > +{
> > > > > > +	struct drm_gpu_scheduler *sched =
> > > > > > +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > > > > +	struct drm_sched_entity *entity;
> > > > > > +	int r;
> > > > > > -	if (cleanup_job)
> > > > > > -		sched->ops->free_job(cleanup_job);
> > > > > > +	if (READ_ONCE(sched->pause_submit))
> > > > > > +		return;
> > > > > > +	entity = drm_sched_select_entity(sched, true);
> > > > > >     	if (entity) {
> > > > > >     		struct dma_fence *fence;
> > > > > >     		struct drm_sched_fence *s_fence;
> > > > > > @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > > >     		sched_job = drm_sched_entity_pop_job(entity);
> > > > > >     		if (!sched_job) {
> > > > > >     			complete_all(&entity->entity_idle);
> > > > > > -			if (!cleanup_job)
> > > > > > -				return;	/* No more work */
> > > > > > -			goto again;
> > > > > > +			return;	/* No more work */
> > > > > >     		}
> > > > > >     		s_fence = sched_job->s_fence;
> > > > > > @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
> > > > > >     		}
> > > > > >     		wake_up(&sched->job_scheduled);
> > > > > > +		drm_sched_run_job_queue_if_ready(sched);
> > > > > >     	}
> > > > > > -
> > > > > > -again:
> > > > > > -	drm_sched_submit_queue(sched);
> > > > > >     }
> > > > > >     /**
> > > > > > @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > > >     	spin_lock_init(&sched->job_list_lock);
> > > > > >     	atomic_set(&sched->hw_rq_count, 0);
> > > > > >     	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > > > -	INIT_WORK(&sched->work_submit, drm_sched_main);
> > > > > > +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > > > > > +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > > > > >     	atomic_set(&sched->_score, 0);
> > > > > >     	atomic64_set(&sched->job_id_count, 0);
> > > > > >     	sched->pause_submit = false;
> > > > > > @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> > > > > >     void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> > > > > >     {
> > > > > >     	WRITE_ONCE(sched->pause_submit, true);
> > > > > > -	cancel_work_sync(&sched->work_submit);
> > > > > > +	cancel_work_sync(&sched->work_run_job);
> > > > > > +	cancel_work_sync(&sched->work_free_job);
> > > > > >     }
> > > > > >     EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > > > @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > > >     void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> > > > > >     {
> > > > > >     	WRITE_ONCE(sched->pause_submit, false);
> > > > > > -	queue_work(sched->submit_wq, &sched->work_submit);
> > > > > > +	queue_work(sched->submit_wq, &sched->work_run_job);
> > > > > > +	queue_work(sched->submit_wq, &sched->work_free_job);
> > > > > >     }
> > > > > >     EXPORT_SYMBOL(drm_sched_submit_start);
> > > > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > > > index 04eec2d7635f..fbc083a92757 100644
> > > > > > --- a/include/drm/gpu_scheduler.h
> > > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > > @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
> > > > > >      *                 finished.
> > > > > >      * @hw_rq_count: the number of jobs currently in the hardware queue.
> > > > > >      * @job_id_count: used to assign unique id to the each job.
> > > > > > - * @submit_wq: workqueue used to queue @work_submit
> > > > > > + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> > > > > >      * @timeout_wq: workqueue used to queue @work_tdr
> > > > > > - * @work_submit: schedules jobs and cleans up entities
> > > > > > + * @work_run_job: schedules jobs
> > > > > > + * @work_free_job: cleans up jobs
> > > > > >      * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > > > >      *            timeout interval is over.
> > > > > >      * @pending_list: the list of jobs which are currently in the job queue.
> > > > > > @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
> > > > > >     	atomic64_t			job_id_count;
> > > > > >     	struct workqueue_struct		*submit_wq;
> > > > > >     	struct workqueue_struct		*timeout_wq;
> > > > > > -	struct work_struct		work_submit;
> > > > > > +	struct work_struct		work_run_job;
> > > > > > +	struct work_struct		work_free_job;
> > > > > >     	struct delayed_work		work_tdr;
> > > > > >     	struct list_head		pending_list;
> > > > > >     	spinlock_t			job_list_lock;
> 
