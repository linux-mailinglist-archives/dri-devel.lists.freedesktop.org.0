Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED27977629F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 16:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C5E10E44A;
	Wed,  9 Aug 2023 14:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EA010E087;
 Wed,  9 Aug 2023 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691591862; x=1723127862;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MNOuMb1bazzBahBVCm4cFcD+C0/miy7V1zNM8WcsPCo=;
 b=ixiFhgU+wKR8XPxsmQZZG5heXaAAJuKJH412bg6QLCUXbJNplCoOKW2A
 ia8oEKcLF7IDDgjvpxjJyS6W2Eela0gWRQyFVvxMpHSQYStf6iTdzTz4/
 GF29n3tRgOfaG+xyojT4BmkPJZfsgr3OIBy1iJjyrdfCfzZwNVXCF30bB
 KbPV42DoDWn3ZY7wtoa3U0g1Vh/Ex84tHnK57mXxm82XUT2HrQNfSBTBV
 QOIHW6IFP0xG3wdKITWnV08lHgUeorWc5ZWbtdYSoarKUmYMnBHW3Fka5
 Iidn6S0HPclHEjsC+SM89o1gob4QqLPVVguqyifnXN+ThZREyIrvkyuci A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370041742"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="370041742"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062498623"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062498623"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 07:37:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 07:37:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 07:37:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 07:37:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eybz6fNnBM6rOgOnklW1waieMs6BAlikvbk2ips67Ib4jhPtPGI/vyJJcPBlmLuG9g0iZnnwKWvi7QtgrF2a5VHvedl4JTKRHbzdOJZ2v/4ERiYYKsCv8UdsWnQY4rjlAYW0mMagpzl09FWoCKIXR2aeSaxeryyfPR3TZJw+LAsMZ5rSc5fMHYE9mTdJDMpB+kB5tai5F1ex01J1hlGvCSiKBNm1EUHmwmghwljveWRKqpr2TJjddlmXcHibTmOjG3IPrUg56HsQFvzQvmoh1mQW8FTyuNCDo9L0XPIW6WdOj/2VguZAQW0XxA6wum1siIe9xDcVP1cwxcKZk2Hjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2idZ5kErt2oc/otoZhak3n5J4fL54/Nr/0/2sQa1mg=;
 b=Jb5lBq+Bo0ie/JqPBDR/UKCRvl5E0A7EUKPUqBbiweAX9eIUlQLEXmbzOml+uUsuN8C3BzQAsnk3btdrYFm1bOMIa0VMu9OTXTiwQlTM2a/TnJBvT/XQTe8khI97tNbzYbXj5HqEJSWClVcnNH3I/MrGEJ7atH1X9ZnBw9t29D/T3dwJxuC2YWQg7DlOCBXQOQmdi9B7UaWwk2CY8DhVmSNl71Of1PjRAIT6TkEWO8KpILkntHvBkvJmRieGbNVm3Jgvc6ZvVkIxCB7qQVXEPnNqtTlm9dqEVZZYKgTJBqRWu+gFn72v3U1YUSO96mtbDNTpzePXd+HmLBJVvPQ24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 14:37:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 14:37:37 +0000
Date: Wed, 9 Aug 2023 14:36:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
Message-ID: <ZNOkf0MO0VA9tTOK@DUT025-TGLU.fm.intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
 <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
 <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
 <88b40106-e24f-e286-c3a3-363a6b2462ee@amd.com>
 <ZMy73BrH55NGq6Ba@phenom.ffwll.local>
 <ZM0HfRR8CczTLpao@DUT025-TGLU.fm.intel.com>
 <b19bb89c-a814-2519-e037-ee1c33dce02f@amd.com>
 <ZNJL4Sgigy4JsprS@DUT025-TGLU.fm.intel.com>
 <90b19c2c-972b-28f4-2274-aa904f40084f@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90b19c2c-972b-28f4-2274-aa904f40084f@amd.com>
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a302b6-504b-4592-1ea6-08db98e62d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Md16U36LsKaN0TVy0GZLs5dA/y5/aP3Km/90tWqAoyeYZuo2LT1N43d3FikHRBrJcUgrC3+r/M5VAXJUk+m2Rm+XIH5C7g3QoD6RgeRvSbhQLBAT02J5w8ALgORyR9oLm7oXLAGCCNMtlsCnv2VO13rVwDZRgxDheh3UsnsgWP4bBKg7jfaQTQls3nzAnOZObVj5YcbbTfwZNU8oJ81Gvd3r8KqhRz6dZGe9XWSK+sdlUL+Q4ThWeb96BS67R6nrxgsBKgMl9T9IofWMYrI2RzJLOTw5ixtGkE7NVqUCOLSREUvW/n+Lfiac40do37fbkJjlNQJZ/z39VPABtRg4FDV6VK85FAYgxnSwvtvo+s2Wlfjc2NN7TFPXireXpP+Rpn1c3rgqKi4+Ud9gxlIY50Q+hSZm5EKTmpd7J/2jf4F42oGFaMV6L0WgraU8YcfO18kEUOT3jlFcUnNQNShwqKSMxZqjYtltZpmqII+VI/uuNQzyyb7PpKuP99oJpynjur3dXeUENCWg7WdFUTmizfANKOm2UMWUntYGMXziBDiIgiOEaWEkrNXSC8qjGh9Tz4/EtynWkEcUj/GglkTjd95bCy598Q3bEgO4DwtsgbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(396003)(136003)(376002)(186006)(1800799006)(451199021)(478600001)(6666004)(6916009)(66556008)(66476007)(66946007)(26005)(6506007)(6486002)(6512007)(966005)(4326008)(30864003)(2906002)(41300700001)(7416002)(44832011)(316002)(15650500001)(8676002)(5660300002)(82960400001)(38100700002)(86362001)(8936002)(83380400001)(66574015)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aZ9Z/OfBFtrW0eCV/KMcfSW6E5S/At3b/WAOrjcJ9pdXC5k+9QgnwwBRhT?=
 =?iso-8859-1?Q?U9unC/8yc8Ct4IHUdgHDCjZ6tqSx+9DUp8dNM+9e/01rHX2rKsq7HjK/Uu?=
 =?iso-8859-1?Q?BKUyKJalNcdxS66ZkPfY8tDDMEJ4ezKGUbVObKtm3DG8egMvATR8iQkge1?=
 =?iso-8859-1?Q?Tikp4m+tIA3aHfwpFS/CHWdHd/ktrPIybnxn9Wm9C59QXg1NxOQv6pgWFj?=
 =?iso-8859-1?Q?5vPI9672zh79LD1/aYhXPftayU1N4DrFGxbTF7XCo4aWnuUbfE6ElRxk18?=
 =?iso-8859-1?Q?I7MUr77JSMvtHWuFGCAOjKk+GJLpaiodvEaqLqJSSY6OI/+fQ+NomTAa/i?=
 =?iso-8859-1?Q?EVjTNB9XxKcn9qTkk1eV+GI5bmS6i3tv4fcqcLgbu7bZ+QQCIRK8LEjFPN?=
 =?iso-8859-1?Q?vXTBYEQAw7hVf/1ZtZIExEDOXbBUgHjNLK6b9zOrzDz5cbathbAjr09oM0?=
 =?iso-8859-1?Q?0RpytU4yeyG0O/pcSmAb/q0Ry9a5GHowkhZZp1rPqcV99emd1mZQjlE5Fk?=
 =?iso-8859-1?Q?EeVB7G+sksz0NE2pQxUVJ0S6Wi5ICxzy5as5mP5YeiB+58a1U0KEt/qjh8?=
 =?iso-8859-1?Q?FTiGqNadFLuyxIiGCC9nIVdo0xq/If4wMdXtCxi1oqvD04tanCxxD5q4VZ?=
 =?iso-8859-1?Q?XSHoLRYRRH3OgJl6xtzwsVMfs44sKwMHkki7hv4LlfLNAqcKsa0WYueIAf?=
 =?iso-8859-1?Q?5/C9Tgcbh4DFFLBzRUlytu2Iy1gwmFxdxB3ffbPWKATP0zM2KPP6FBKG6z?=
 =?iso-8859-1?Q?HE3ljU2qJ1W/4OAO1ohdxVohsHq6AakNtTaj+IYz++Ba2nvUG4MImvjWhk?=
 =?iso-8859-1?Q?vkxg0k16AXZBI3h8Ge8epLt9kK4ml9qptuGcRuUnxWVtcuNPEaGJ21x48W?=
 =?iso-8859-1?Q?AEj5q2xfKcFRfU0cRTuMRAsoeJoXDG0TkjmTSCaY+bpzqP5tisJFziNHEY?=
 =?iso-8859-1?Q?AP+9T8k4xrHiZzFVHo9uvCaSZDSOUbkL1gOqlFDGzE1qwU34SN+tkDTZVS?=
 =?iso-8859-1?Q?QQyLqDiTsq7jG5feO+rPrWpgjreqh2cYGrBG6jAFbo4GMBchX0bqZ1lXyv?=
 =?iso-8859-1?Q?dko2NvLxMCZ+2qc9fOXU3Sd9xwT/kZ41nWGiPXVAgzZCJWOeXK9vxFRGWP?=
 =?iso-8859-1?Q?nP1VM5X9BLWz0t8FkmvDzj3hve5zLOOojoo0EIcAqtmAxU4XNNLPawyAX2?=
 =?iso-8859-1?Q?dvMLtpbX1GPMJevqpfbPGP74aNy7uNTuzS7VpkPTwDJvmY3JcpfIGr71vN?=
 =?iso-8859-1?Q?ad9+vMqgq9Wiu89IbPrNvtXJdankHsP0sqL8mAgDj+C5UR/QnultRgQGi3?=
 =?iso-8859-1?Q?Nn59Wg3VGmX31npxkXOfrYYwSYxQ/Dv56iw001/FSw8IAPZLTS19J7fmWZ?=
 =?iso-8859-1?Q?EacPfz/e7UVfcOSnd/AcziPIHxwcYj32c/M60UmVA7OfiFqw1uWOUXFx1Z?=
 =?iso-8859-1?Q?pZzdYXx1orxcEXDpfwO+qo5ZF99lDriHKFTUxcf4OVd/8lj5+5Tw1k+OGM?=
 =?iso-8859-1?Q?PHUTBLEH+gz5K+jVyUiA42nS6eveWk+5a+wlQWqnsaX28WO61imAEl0A0r?=
 =?iso-8859-1?Q?W/UxZePbdTHMgBZ8n7fRqb4cnIrg0YUTW3lODqxZd8dRKjaC8PBXZURin7?=
 =?iso-8859-1?Q?o+m94mVseEqB6TPjgN3R7AKMHyC+ZBqddfI04kC11RUlYbD8Eg8PeznQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a302b6-504b-4592-1ea6-08db98e62d52
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 14:37:37.4813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY2EiR9QQ2J4fR59ixDLmMdfptJ+ZQnMozdiV1HoRJeFkaFfUfrvQcUgk6TBp0Q7YQV/QUtIkAJlgBZV9BRvNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
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

On Tue, Aug 08, 2023 at 04:14:55PM +0200, Christian König wrote:
> Am 08.08.23 um 16:06 schrieb Matthew Brost:
> > [SNIP]
> > > Basically workqueues are the in kernel infrastructure for exactly that use
> > > case and we are trying to re-create that here and that is usually a rather
> > > bad idea.
> > > 
> > Ok let me play around with what this would look like in Xe, what you are
> > suggesting would be ordered-wq per scheduler, work item for run job,
> > work item for clean up job, and work item for a message. That might
> > work I suppose? Only issue I see is scaling as this exposes an
> > ordered-wq creation directly to an IOCTL. No idea if that is actually a
> > concern though.
> 
> That's a very good question I can't answer of hand either.
> 
> But from the history of work queues I know that they were invented to reduce
> the overhead/costs of having many kernel threads.
> 
> So my educated guess is that you probably won't find anything better at the
> moment. If work queues then indeed don't match this use case then we need to
> figure out how to improve them or find a different solution.
> 

I looked at workqueue code and think the workqueue creation is decoupled
from kthread creation in most cases so I think this fits.

Hacked together a quick PoC of this on top of Xe, seems to work, and
like how the code looks too. Need to clean it up a bit and run some perf
tests but looks promising. Hopely it all comes together and can get
another spin of this series out fairly soon.

Matt

> Christian.
> 
> > 
> > Matt
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Matt
> > > > 
> > > > > Or what am I missing?
> > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
> > > > > > > Worst case I think this isn't a dead-end and can be refactored to
> > > > > > > internally use the workqueue services, with the new functions here
> > > > > > > just being dumb wrappers until everyone is converted over. So it
> > > > > > > doesn't look like an expensive mistake, if it turns out to be a
> > > > > > > mistake.
> > > > > > > -Daniel
> > > > > > > 
> > > > > > > 
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > > 
> > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > ---
> > > > > > > > >      drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++-
> > > > > > > > >      include/drm/gpu_scheduler.h            | 29 +++++++++++++-
> > > > > > > > >      2 files changed, 78 insertions(+), 3 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > index 2597fb298733..84821a124ca2 100644
> > > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > > @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > > > > > > >      }
> > > > > > > > >      EXPORT_SYMBOL(drm_sched_pick_best);
> > > > > > > > > 
> > > > > > > > > +/**
> > > > > > > > > + * drm_sched_add_msg - add scheduler message
> > > > > > > > > + *
> > > > > > > > > + * @sched: scheduler instance
> > > > > > > > > + * @msg: message to be added
> > > > > > > > > + *
> > > > > > > > > + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
> > > > > > > > > + * Messages processing will stop if schedule run wq is stopped and resume when
> > > > > > > > > + * run wq is started.
> > > > > > > > > + */
> > > > > > > > > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > > > > > > > > +                    struct drm_sched_msg *msg)
> > > > > > > > > +{
> > > > > > > > > +     spin_lock(&sched->job_list_lock);
> > > > > > > > > +     list_add_tail(&msg->link, &sched->msgs);
> > > > > > > > > +     spin_unlock(&sched->job_list_lock);
> > > > > > > > > +
> > > > > > > > > +     drm_sched_run_wq_queue(sched);
> > > > > > > > > +}
> > > > > > > > > +EXPORT_SYMBOL(drm_sched_add_msg);
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * drm_sched_get_msg - get scheduler message
> > > > > > > > > + *
> > > > > > > > > + * @sched: scheduler instance
> > > > > > > > > + *
> > > > > > > > > + * Returns NULL or message
> > > > > > > > > + */
> > > > > > > > > +static struct drm_sched_msg *
> > > > > > > > > +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
> > > > > > > > > +{
> > > > > > > > > +     struct drm_sched_msg *msg;
> > > > > > > > > +
> > > > > > > > > +     spin_lock(&sched->job_list_lock);
> > > > > > > > > +     msg = list_first_entry_or_null(&sched->msgs,
> > > > > > > > > +                                    struct drm_sched_msg, link);
> > > > > > > > > +     if (msg)
> > > > > > > > > +             list_del(&msg->link);
> > > > > > > > > +     spin_unlock(&sched->job_list_lock);
> > > > > > > > > +
> > > > > > > > > +     return msg;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >      /**
> > > > > > > > >       * drm_sched_main - main scheduler thread
> > > > > > > > >       *
> > > > > > > > > @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > > > >                  container_of(w, struct drm_gpu_scheduler, work_run);
> > > > > > > > >          struct drm_sched_entity *entity;
> > > > > > > > >          struct drm_sched_job *cleanup_job;
> > > > > > > > > +     struct drm_sched_msg *msg;
> > > > > > > > >          int r;
> > > > > > > > > 
> > > > > > > > >          if (READ_ONCE(sched->pause_run_wq))
> > > > > > > > > @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > > > > 
> > > > > > > > >          cleanup_job = drm_sched_get_cleanup_job(sched);
> > > > > > > > >          entity = drm_sched_select_entity(sched);
> > > > > > > > > +     msg = drm_sched_get_msg(sched);
> > > > > > > > > 
> > > > > > > > > -     if (!entity && !cleanup_job)
> > > > > > > > > +     if (!entity && !cleanup_job && !msg)
> > > > > > > > >                  return; /* No more work */
> > > > > > > > > 
> > > > > > > > >          if (cleanup_job)
> > > > > > > > >                  sched->ops->free_job(cleanup_job);
> > > > > > > > > +     if (msg)
> > > > > > > > > +             sched->ops->process_msg(msg);
> > > > > > > > > 
> > > > > > > > >          if (entity) {
> > > > > > > > >                  struct dma_fence *fence;
> > > > > > > > > @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
> > > > > > > > >                  sched_job = drm_sched_entity_pop_job(entity);
> > > > > > > > >                  if (!sched_job) {
> > > > > > > > >                          complete_all(&entity->entity_idle);
> > > > > > > > > -                     if (!cleanup_job)
> > > > > > > > > +                     if (!cleanup_job && !msg)
> > > > > > > > >                                  return; /* No more work */
> > > > > > > > >                          goto again;
> > > > > > > > >                  }
> > > > > > > > > @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > > > > > > > 
> > > > > > > > >          init_waitqueue_head(&sched->job_scheduled);
> > > > > > > > >          INIT_LIST_HEAD(&sched->pending_list);
> > > > > > > > > +     INIT_LIST_HEAD(&sched->msgs);
> > > > > > > > >          spin_lock_init(&sched->job_list_lock);
> > > > > > > > >          atomic_set(&sched->hw_rq_count, 0);
> > > > > > > > >          INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > > > > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > > > > > > index df1993dd44ae..267bd060d178 100644
> > > > > > > > > --- a/include/drm/gpu_scheduler.h
> > > > > > > > > +++ b/include/drm/gpu_scheduler.h
> > > > > > > > > @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
> > > > > > > > >          DRM_GPU_SCHED_STAT_ENODEV,
> > > > > > > > >      };
> > > > > > > > > 
> > > > > > > > > +/**
> > > > > > > > > + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
> > > > > > > > > + * message
> > > > > > > > > + *
> > > > > > > > > + * Generic enough for backend defined messages, backend can expand if needed.
> > > > > > > > > + */
> > > > > > > > > +struct drm_sched_msg {
> > > > > > > > > +     /** @link: list link into the gpu scheduler list of messages */
> > > > > > > > > +     struct list_head                link;
> > > > > > > > > +     /**
> > > > > > > > > +      * @private_data: opaque pointer to message private data (backend defined)
> > > > > > > > > +      */
> > > > > > > > > +     void                            *private_data;
> > > > > > > > > +     /** @opcode: opcode of message (backend defined) */
> > > > > > > > > +     unsigned int                    opcode;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > >      /**
> > > > > > > > >       * struct drm_sched_backend_ops - Define the backend operations
> > > > > > > > >       *  called by the scheduler
> > > > > > > > > @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
> > > > > > > > >               * and it's time to clean it up.
> > > > > > > > >           */
> > > > > > > > >          void (*free_job)(struct drm_sched_job *sched_job);
> > > > > > > > > +
> > > > > > > > > +     /**
> > > > > > > > > +      * @process_msg: Process a message. Allowed to block, it is this
> > > > > > > > > +      * function's responsibility to free message if dynamically allocated.
> > > > > > > > > +      */
> > > > > > > > > +     void (*process_msg)(struct drm_sched_msg *msg);
> > > > > > > > >      };
> > > > > > > > > 
> > > > > > > > >      /**
> > > > > > > > > @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
> > > > > > > > >       * @timeout: the time after which a job is removed from the scheduler.
> > > > > > > > >       * @name: name of the ring for which this scheduler is being used.
> > > > > > > > >       * @sched_rq: priority wise array of run queues.
> > > > > > > > > + * @msgs: list of messages to be processed in @work_run
> > > > > > > > >       * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
> > > > > > > > >       *                 waits on this wait queue until all the scheduled jobs are
> > > > > > > > >       *                 finished.
> > > > > > > > > @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
> > > > > > > > >       * @job_id_count: used to assign unique id to the each job.
> > > > > > > > >       * @run_wq: workqueue used to queue @work_run
> > > > > > > > >       * @timeout_wq: workqueue used to queue @work_tdr
> > > > > > > > > - * @work_run: schedules jobs and cleans up entities
> > > > > > > > > + * @work_run: schedules jobs, cleans up jobs, and processes messages
> > > > > > > > >       * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > > > > > > >       *            timeout interval is over.
> > > > > > > > >       * @pending_list: the list of jobs which are currently in the job queue.
> > > > > > > > > @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
> > > > > > > > >          long                            timeout;
> > > > > > > > >          const char                      *name;
> > > > > > > > >          struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
> > > > > > > > > +     struct list_head                msgs;
> > > > > > > > >          wait_queue_head_t               job_scheduled;
> > > > > > > > >          atomic_t                        hw_rq_count;
> > > > > > > > >          atomic64_t                      job_id_count;
> > > > > > > > > @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > > > > > > > > 
> > > > > > > > >      void drm_sched_job_cleanup(struct drm_sched_job *job);
> > > > > > > > >      void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > > > > > > > +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> > > > > > > > > +                    struct drm_sched_msg *msg);
> > > > > > > > >      void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
> > > > > > > > >      void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
> > > > > > > > >      void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
> > > > > -- 
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> 
