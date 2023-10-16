Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C317CACE4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3151610E214;
	Mon, 16 Oct 2023 15:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4445710E211;
 Mon, 16 Oct 2023 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697468733; x=1729004733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AXzusKii0QF/Mq6tds+8bhhHrhaeYoJhdnLtkumOq1c=;
 b=fNfoXE9Maqz0LeKbvSoIJegqBuKxpWcuJDigWf54YeXU+ISnpHOj+0Xh
 SFI77k/iay7P/zwvfr/cLan6hSzT0a7B0wEwu/ENjfEOJUhCyFRrgt8XX
 HdVmdgxOjaA/djWjG1as1Ijl+Gd5yBpjKcKfr1cnFeE8LseB/GIgEOYQ8
 us/U/MdyOoYnqatx8QXywTRb6RWc6MH+Cuai69zAs+rEZADC9NUHbYnzJ
 CHv6LLGE5PJgmcBfLSgaO9DS9RAiS4NDdKL31CjFcIC74OKGDfR/Lu2vM
 bS0S41oxKFQwh8hvjdAwVycLkyvhwWWrR5wJ3TU/SSYPrYSDwr36aWIgc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389409816"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="389409816"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846418235"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="846418235"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 08:05:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:05:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:05:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQJMRpier6BYDLaYfHF10/uarogLXQyHuRCgUk1TbMwN5ke0e7wKr5F7l0pZsGcoFo/gjWa3BdsG0p7BJF1eDtODG/M+6rkVff4jYxLR/9KqpJy0NMWMqsMjDKUYCYqyocuxFnMpd+a+7p2QHby4pYKcbvtCzkhlnKWzldMj72YAN23XBR14Z5cBAIGv/V1c5hptfapQ1hbfQQysfetuvCjVWo8oTWku/To1E7vNEVJICdkHBrvXdF8x9FS+TN+o2SNcxo/G8sLmhuToj3FuAdhWqFyTfXY9XAmXVyQ4Jqr1z2z1pk+rK3JM23o3xLq63B0C2Kt7m8YM6mE/epaF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNhzu0Q9iUA8XAhw3Ntiql+jPPGZE1rt9TYri5QOmkM=;
 b=dA2RWl4I+WKuOw37jiuX7ZL1SxNGw4lzxqEtNTjosS2IOKzYAF3W7o9fsGRiT2Kg+ukEYfM180GHrfkrNUnes7kSKtd4ByGCwUXwZdU3hb9mkmLELQfQ0O60/d97Ktt4QM5fw2VXQdKYU2D5kKXheKZv29bK17bYGeqSOJiAVnSUiFEfStrZiwHzZXdnrCyAxClo6ToreqrvFzW0qPQ0D+JAcK54mriY78pRWMWM5WbXkhIJhkAuF10rNMppzV2oqlvIa4ryECi9NpVnBVu4LtFNOcez6Qlfht73Fp1siatQIF2t3C3cdEZNs6szpqeQia1EAXuS488zYM8WWDJzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 15:05:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:05:02 +0000
Date: Mon, 16 Oct 2023 15:03:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v5 7/7] drm/sched: Add helper to queue TDR immediately
 for current and future jobs
Message-ID: <ZS1QyQ5KCFHLw4Vy@DUT025-TGLU.fm.intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-8-matthew.brost@intel.com>
 <5bb39d18-f5de-4b74-b55a-6067b6166309@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5bb39d18-f5de-4b74-b55a-6067b6166309@amd.com>
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 30402e3f-e761-4224-8c3c-08dbce594624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x9kBxLJ67a17svem1Jr+mZ6ByR7BMkX98FaSPoZeJvX5q/J5Ux59UGTV+EHLwKOiC1xmVOJcWP4Mgb98Czr7SKys3TJSQpFBqOURIiwr1BbTkzkEMU9R1wekWzZjEup3jN3k+ucsaIpmKAvcMUi2m+9cUUB18fz109xPWFXNLmUft9lcjfDrWf4s8bNmoUxflw3Er6CUWnxNgoqqD2fpXKM3JOzTHbnbi1Fz/fOba5zAWzldQyqNKmhI3OcO5vKIHArOb04Rs6sb9ZKW05rRiTs98zNKmwljNT4W6d/hrrZyydu/IzEo7R6vIQNRKNvGzT6gDpehxnVW26zU58+TLI+fJmC5kL1StOiwoFw7wqh0aP6maY0hWh8f2Kbrb1qdrUUT5mOlKrheNOBCkhAer1cUffmnytKDab7BT8A2p4Oea/izYsfTo6ydjhRaP/cy5+8b4i+J/BeE+eZRrhecC95j2KFR7MP61l6xfvaOQ2ZQB8qSQvoUI7CwXi70FVH+531woxO4kNPgJz+kft5pYBu3C4MrIqfRAtwYmf5m98/IAWB9vccf5YDXxzjE7yweLAT1MQ6zH8XE4TjHxccsduiLTekVELLF745iE2S7kfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(39860400002)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(44832011)(86362001)(41300700001)(2906002)(7416002)(5660300002)(8676002)(4001150100001)(4326008)(6486002)(66946007)(66556008)(83380400001)(6916009)(316002)(8936002)(66476007)(478600001)(6512007)(38100700002)(53546011)(6666004)(82960400001)(26005)(6506007)(14773004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wJzU0IHNxCQnrJ6iJSmg396EBcZvk/4wISMyiZ6P6toQVT61t86pm/fr6LZc?=
 =?us-ascii?Q?T5K2+XyXSArR8/wgF7O0jTRYwzxvVdQbEexd+yCS0amNo4Lc4K9jCuMOLYDe?=
 =?us-ascii?Q?ax6j84Jzl3PRoDAeBALYhKxDUJ3IYTUTI2FpPKJtvY12Vla7KKLtFGs3u42O?=
 =?us-ascii?Q?74H2PqkIT+dNl8ZWewk2Xu9M7AJHWm9cIlqGeEbABO4R2ap4WD9bCwFNJz0x?=
 =?us-ascii?Q?hu4hVDbJ7CAwNwnmaSxalTseX0noJkb3lB5RvQ9fqeSrYWpJYRV81YkpCvF4?=
 =?us-ascii?Q?DE9dzkmzmHz1PUeOn5Lm7Jd0hN46FFraGEdKeMwu6fBDkj15vxpmHOquQ+fR?=
 =?us-ascii?Q?MO4jRRx+eVxH9+5jNYsM7d4ft2sUoysFH/ymTrsM86d9Stzh0BYgqR8p11cT?=
 =?us-ascii?Q?Xi1NexuRQMLu4tZFfepXXvYPxXJtH50O6n7b1XG9NkWkyYAMwNCnTgl+sCm2?=
 =?us-ascii?Q?J7LnI1cnLkGU/xtx4NO3W1EMFzBO9lGOB7U7Ydp90Q7gFn2TZnaDvChdBXsU?=
 =?us-ascii?Q?N+7fef8Mrl8iCrtL1vbpWOP6aBSPbcLx0x07+64xoJqHrQgPFivkqtD//H7v?=
 =?us-ascii?Q?qVo6JwN4ENYLEtuez+5n+3k/aPcwphJoxGOZUWEnVBT0kHt4NRczAqHKvxqS?=
 =?us-ascii?Q?YisoHw587QezxuBe5Qt9CLJtfYiuHNnhiQ00+7znYqvWKQ3KanhBdgdjhfS7?=
 =?us-ascii?Q?iSeyVuXUujGjRDlnJseuU3MeDI1T16EqYGGRIfPn+vefhDacwS3eOxMcXZWV?=
 =?us-ascii?Q?1otMUAzUNdxOMGZvtUk5YgDO3JHZH49ZIHGCXyYr2X137PdgkXkkCg3f+IiC?=
 =?us-ascii?Q?kAZv3L/DdTUqonc7oLJWDDnCG9lrlggK1uAsh0IUTLhKhNyv9coMTiR07wT0?=
 =?us-ascii?Q?BjP5YRgcGdeVIeoeugeo9XQCkpyM+WyV+tAiORoSAvYAhzc6NkKDLkzSrRkj?=
 =?us-ascii?Q?v6kUHWWSplnWg1RhfO19ox5riAVUzifrDb8l+oA4Twoz69QmN5Gcs6mRQbAK?=
 =?us-ascii?Q?doHh772WC3HMWDb3qpfCW+wxo8mJ8NTf9hGR9DTfTVcmoHwrn+dXtIiscoZ2?=
 =?us-ascii?Q?xP1csMt4d0MtwL5Z7Ws67mKgAfbtoPJc3UHNSogXyyCiGFbx22aGDrAKZ19X?=
 =?us-ascii?Q?iRI/Zy4jTr1egvSjAwZHzX3CeIzEtlwMuDRv7ThFGDLpFglwmM0qvciHgzNj?=
 =?us-ascii?Q?2LHez8wYMxh3OBoqQ8JEFsS7pWroXF3SdpwHscuDpEShtwgv8aYgeVEm/g5n?=
 =?us-ascii?Q?b+eVPAO4AGkuKCNfVJiTkNxqjB7ONXhGpMfmLlBM+7HlF+XGO029eINaqqnE?=
 =?us-ascii?Q?QJ5R+31s8B586LCOj8yZVvDBwP22EWBSICTRDKZKajdCslMWqdjHBhzKY96h?=
 =?us-ascii?Q?TOBjUiRPuHoKg4/Wy9MySetnILvWtfmmydRSuXohDeAclj5APX2qvQQsPqRW?=
 =?us-ascii?Q?qpNRkYq13fRO06r/+GkQWkh6kY8fzCsTxhO7qIE8E6OKr3Ur6OJ+1BSQe+Xt?=
 =?us-ascii?Q?csVYqkBXKaoj/khyy3/Y34MSL96bcGyeIfduul8wohQFnrVllOmu9i85I2Qp?=
 =?us-ascii?Q?lzTdop8TkE9Q7mH7XO9UJhgO6z6wGXnM0JQOn2a9Tc4h7bO1sL6WbQdJeU51?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30402e3f-e761-4224-8c3c-08dbce594624
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:05:02.9181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTOJ0tQ9RwBYRrXSdQTMVH/rCffPh0bXMNlCe48CbckvCLJX32IJVRUScwKy0xYZiHQpKRayDMAV2ZrFRplu1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
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
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 11:04:47PM -0400, Luben Tuikov wrote:
> On 2023-10-11 19:58, Matthew Brost wrote:
> > Add helper to queue TDR immediately for current and future jobs. This is
> > used in Xe, a new Intel GPU driver, to trigger a TDR to cleanup a
> > drm_scheduler that encounter errors.
> 
> I think the best (most optimal) thing to do is to remove the last sentence
> mentioning Xe. It is irrelevant to this patch. This patch is functional
> as is, and worth having it as is.
> 
> So it's best to have just:
> 
> 	Add a helper whereby a driver can invoke TDR immediately.
> 

+1.

> Also remove "for current and future jobs" from the title, as it is
> implied by how TDR works. We want to say less.
> 
> 	drm/sched: Add a helper to queue TDR immediately
>

Yep, my bad I forgot to adjust the commit message in this rev. Will fix.

Matt

> These are only GPU scheduler changes, worth having on their own. The fact
> that a new (future as of this moment) driver (Xe) would use them is irrelevant
> at the moment. Other drivers (new, current?) would most likely end up using the changes
> of these patches, and these changes go in on their own merit.
> 
> Regards,
> Luben
> 
> > 
> > v2:
> >  - Drop timeout args, rename function, use mod delayed work (Luben)
> > v3:
> >  - s/XE/Xe (Luben)
> >  - present tense in commit message (Luben)
> >  - Adjust comment for drm_sched_tdr_queue_imm (Luben)
> > 
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++++++++++-
> >  include/drm/gpu_scheduler.h            |  1 +
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index c4d5c3d265a8..f2846745b067 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -431,7 +431,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
> >  
> >  	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> >  	    !list_empty(&sched->pending_list))
> > -		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> > +		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> >  }
> >  
> >  static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> > @@ -441,6 +441,22 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> >  	spin_unlock(&sched->job_list_lock);
> >  }
> >  
> > +/**
> > + * drm_sched_tdr_queue_imm: - immediately start job timeout handler
> > + *
> > + * @sched: scheduler for which the timeout handling should be started.
> > + *
> > + * Start timeout handling immediately for the named scheduler.
> > + */
> > +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
> > +{
> > +	spin_lock(&sched->job_list_lock);
> > +	sched->timeout = 0;
> > +	drm_sched_start_timeout(sched);
> > +	spin_unlock(&sched->job_list_lock);
> > +}
> > +EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> > +
> >  /**
> >   * drm_sched_fault - immediately start timeout handler
> >   *
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 625ffe040de3..998b32b8d212 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -568,6 +568,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				    struct drm_gpu_scheduler **sched_list,
> >                                     unsigned int num_sched_list);
> >  
> > +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
> >  void drm_sched_job_cleanup(struct drm_sched_job *job);
> >  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> >  bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
> 
