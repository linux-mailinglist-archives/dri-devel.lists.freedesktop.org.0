Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553269F619
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 15:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD71710E9C9;
	Wed, 22 Feb 2023 14:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAD610E9C9;
 Wed, 22 Feb 2023 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677074789; x=1708610789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6ejl8O43sXjG63dQ8URuMWKTNITxYTaHBmq0UMbFQtA=;
 b=esX4A7X8i6rxq13xtE3Tij++Cqo3M4ZdpfNBpmxqVZJZ3lsXSopXAwHZ
 Z94XJxgV27DD9I/9sO4rlC52a1dz0DXl2aoQURoQYwYjADds62g8peFkC
 kwZM+ctj0r3bH0djPmIRkhdedNpskeB80zEVDvJCv04LHqUUTlu2MeJpu
 6UGL67+/lkomVsII7qTGHN5kd2OcZX2D4rocvsxkWesPRspxp+RQlWyV2
 3LvWq2TilI7NIFTPve69ML6fWNZLSbqkAI4FLyHrWsKgpK8E55aH8dS7X
 UbYtu10kkrj0qhsfIsGk1dLyMNcxDecMG8TrNeCJAB9LHJT0JKsBTfZ6t g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331599531"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="331599531"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 06:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="665353779"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="665353779"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2023 06:05:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 06:05:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 06:05:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 06:05:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 06:05:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjnLlgKpZrJTyAtfdeJBFdPz2s4YDBow2R1ji54x/apTrsrXuQM5XyISrLgtZ8WKcovB2I6wqn+UWP82Olc2o+vaboZ3dvS/HEOuLcfcEY7SAts+n9UB/7iV84/HHv2+ja1TaZdMEbtLZh55Ts70Snp4mHggHR6LKve9f6pAraMPSwEqGqoIIqj2BLLSfWYhhE3fY9Fu4K51sd5uN9/BfgPuC87gac4TqXKagBQu95OzODN4zKbq3pTtDH41zTVfpj5sY7I+HvSLRA9qhZaIxT8sJz6l0aJYhpwqR3o9qy8cmM3/oEea3//Qz60iD2qqLamcq9zzj8dHLT7JyKuApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF1WMjTEcPyWKSG8rS+aa1/AQxAifeUdsHbH/rpiGco=;
 b=R9aiKnbMzKRfw0FRR/MR6dJYpGhcd+cgH4nJY91QQTQQb32BsIefCYNmX+7gkG4u1KY8cy6kjSdjUH6gFJaRtoghoeG1rDb15rHto+xZIloPCnXbOthyTEDFr+HuPSPACTYsAI0XQUtwQ5caN+2MeHSHT33w3sM/uzsdFyU2Z79KPG17SnV5TspKd3nkk6K7U+ApdtPot3olN499ogZLeha4QoQzw35iuR1WIMY5yeTSD+ybXrpAqcypaHsdk44UP4EKyU4Un84VD1TZtqxHchyvJ18nzt1HH0lfYTyA7j53StmyluevjMJzGz8Tw38khpFOWKsc4FsF3JiSx4UdSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 14:05:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6111.020; Wed, 22 Feb 2023
 14:05:36 +0000
Date: Wed, 22 Feb 2023 09:05:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 09/14] drm/syncobj: Add deadline support for syncobj
 waits
Message-ID: <Y/YhKiuOHiX2LcyL@intel.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
 <20230220201916.1822214-10-robdclark@gmail.com>
 <20230221105307.7430c301@eldfell>
 <CAF6AEGtd_9JYtPU-AGmZY0My_d48rSSWQiD-efbR2KFxD-+tTA@mail.gmail.com>
 <20230222120904.5c281652@eldfell>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230222120904.5c281652@eldfell>
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: c4041bd2-b55e-41ed-697a-08db14dddec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npALK68Z7jm1hos3ISyvXomN2EG1BvqCk7WzkCuHVafWFzwM2+3UBZj4GLpjUZoM1savj5ej5x8/nH/Gb6INSBxIke7rewQXBZnAZnA97S0knheGnKFMGqAn2MNI4sA+a76YhCmuj2NTme1SdnnBWntqnoSsbo25Pclc04qLy+i8RZH/vMNT8bVSY4eCrBZ7Ai4fdI0fXEEUPt13ViR2abP3CqyF7wfDGLkbUfwtQUYT6X/dqgLBNJbztoPZcLK4KPqNsznYID/zcBKb09CB3m95905Z3caIngKa9ltckTbabCJ2OCIxqqeVU2z3jjGI959rfpNu1jwohBFoBylAityGl0oP3hIlYuXEgkp8AbqQhjACILMJcc6aobog6uVoEyFE/ou21O4DmwD8S8rCO92YbWZuMKVdhv4J0mcju6Sn3ld0TAQdOmAmB23SAb3Nw1FIvfUGCXd52uWgE3BeOUSOhmIsqOHjppCBXNjY5jGv/PegTkQvNUI4TGkrqf8TR/soVZIuDPDlPj3jhsT2LPmVp89HImaq9wrEWopmW11c+8sqzpcsItYfRtevuCQ/BVH4xQqUaeobk+nJsYj1v06rSu/G+GSnnJq5HV3gz0Pnr+w3Q2gy5w65hS7TjfBJ+gzqDMjVuzpmxyXW8GeeDJCE88XZhyYDu2G/UFDzpGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199018)(82960400001)(2616005)(54906003)(86362001)(478600001)(26005)(83380400001)(6916009)(2906002)(8936002)(5660300002)(38100700002)(8676002)(66556008)(66946007)(66476007)(41300700001)(966005)(6506007)(4326008)(53546011)(6486002)(186003)(6512007)(316002)(6666004)(7416002)(36756003)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+BIOzLUB+JRBlslkfJRUZ+RFdZwRurtJdOE0fATxWcvETYkeBb3olRDmA0FX?=
 =?us-ascii?Q?H1XTUxUTHNIKuEFCbKdNe8Len1dzhfUC6i30Nq98H2Mb4kKGxHiply+L1prF?=
 =?us-ascii?Q?KMYH0/pWNsDkAAWIz4EudOIumAZvwzqPlMcj5P6wG8w8gX0DpPBGf0PN/xD/?=
 =?us-ascii?Q?1OkB3KTXFehuUE8/qhDaivpgcPfRNRoJcAo5toprCRH/oXwMc/95RJcHQ6/f?=
 =?us-ascii?Q?nZnMeBEbB3epz/M8LnglAaZUNuBFZGq7PLSq/a2AbOncBT7c97xawpeSJdlG?=
 =?us-ascii?Q?9TdyMdfQzlLhtub5khdFoqIY7du9cTnMB+nOB8XH/4dCQ97anhkrCCrA0a9t?=
 =?us-ascii?Q?7ZrGCnGvVV5imePm2JyuC1Wd2IRuMTjntpH0OR+YMeVJQG8ij+nLdDA5rm44?=
 =?us-ascii?Q?eHiO7BDD16LJx8Tea6ZConQbjY5dJMHmlYQgyCURwo7I55RaXgVzs0pMqLwk?=
 =?us-ascii?Q?el99O7p5+m56MACb2BJ/36U/0wUSfT2i1BMiZguYwZFN91f6OVOOgax4/mGO?=
 =?us-ascii?Q?b50A5Jac1RUyyo84BVkNqAjLhVfXJZD0GgC3Hh7Y5NFG6gXk+q8u/xdgbrvR?=
 =?us-ascii?Q?BCFvFYZBYZ/MPai/vLsMCTbXv46E29c8t9dZgBdGcFJWv91kQFaihOJoS8Vk?=
 =?us-ascii?Q?DqhgCChDK3hvlNoorbBC0ryaRodIzlO8qkI7wAsUdTbjHMs2hMrMEsE/n1Dk?=
 =?us-ascii?Q?QkIt88CI9wVpwoXVuBsd0Ou0ce1+Z+BiZR7sEZwP4qW0TUSLI1gA/eOeS+NU?=
 =?us-ascii?Q?2U+pt0feMratmLhmN9O3hn6H0mSJGNBesjnxbnREp0Vp7l3OHoKefBytPFTp?=
 =?us-ascii?Q?v5GlzYsnAaYop4dYLr3c3wsvKywysZBW/jHtbtx1wRLSMlf7Zd4KTCBp5LcK?=
 =?us-ascii?Q?s9edMEg4ll8eSwNvFyaFt5lFeOh7TUiQNv3fPrV7w3vsn0zG888Fb1wRwa66?=
 =?us-ascii?Q?wEOM8SokUqS9FF4fjWBSYY/foA1XBdeGOV8OifbKVspGfRpUJtcvqhlDbpdc?=
 =?us-ascii?Q?Vxgec/2HqQsuW5CnAl5V9gmX9+p6r/y8lwYGUxN9mQI1QtwICozI7m99idYt?=
 =?us-ascii?Q?vyPQmrTgG218qY7iP50R1X8x+xA1zUdElVsqOYQySfro8jGMthBuAGH3XXrd?=
 =?us-ascii?Q?YWFn9SdJmG0U34jWKUaLxW9eDbdoLSZSopQUQ0uNCdDOHK+i4YaPrOepzFUy?=
 =?us-ascii?Q?QLpOaap64YZp6+JDenyNmx80s2i3kVrxf5WkIn//aAtcQ/lDf5f/0V5Mljy0?=
 =?us-ascii?Q?3w6gVynZGQOkAOXuoQ3osZbEh+6mQjZsCPxh2Pcuc9sZTHRNS31yydo4DlqX?=
 =?us-ascii?Q?oo3KsEnYpl7cLmoHVHhLmzy6DjWBenXdSc04jRe5/BPSQUpd5/k5aJvXCTov?=
 =?us-ascii?Q?uuvOtdncHEiNKGLgBbenF+be7RNIw6nt4mlebFSqNjr19RRFbXGgNDI3p9xe?=
 =?us-ascii?Q?N50RlfxjgMzsjdh9RJMSPzzNMFnxad1r0mZCxw0Y7QCfolm2Q0lbLFJ+4rns?=
 =?us-ascii?Q?OATxLXyEyR2Qfo1Z162QSkJmL9BFIbGKlt8ZztXZJwcLIqmiarXTayZ8NdZZ?=
 =?us-ascii?Q?gAXlggdNDVwcBYlW+1ULyw4FWQuCSNt82+vrA1FEj9EkQTocwvfkROlnUTOl?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4041bd2-b55e-41ed-697a-08db14dddec9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 14:05:36.7063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ja+na1AJt7qyO0I7t2W9wt1dGf9BNx0VVxwbGqs5tI9UBFf0AixunfHarrByWuBVXcHhf2l3NLYI/gor94KOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 12:09:04PM +0200, Pekka Paalanen wrote:
> On Tue, 21 Feb 2023 09:25:18 -0800
> Rob Clark <robdclark@gmail.com> wrote:
> 
> > On Tue, Feb 21, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Mon, 20 Feb 2023 12:18:56 -0800
> > > Rob Clark <robdclark@gmail.com> wrote:
> > >  
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Add a new flag to let userspace provide a deadline as a hint for syncobj
> > > > and timeline waits.  This gives a hint to the driver signaling the
> > > > backing fences about how soon userspace needs it to compete work, so it
> > > > can addjust GPU frequency accordingly.  An immediate deadline can be
> > > > given to provide something equivalent to i915 "wait boost".
> > > >
> > > > v2: Use absolute u64 ns value for deadline hint, drop cap and driver
> > > >     feature flag in favor of allowing count_handles==0 as a way for
> > > >     userspace to probe kernel for support of new flag
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_syncobj.c | 59 +++++++++++++++++++++++++++--------
> > > >  include/uapi/drm/drm.h        |  5 +++
> > > >  2 files changed, 51 insertions(+), 13 deletions(-)  
> > >
> > > ...
> > >  
> > > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > > index 642808520d92..aefc8cc743e0 100644
> > > > --- a/include/uapi/drm/drm.h
> > > > +++ b/include/uapi/drm/drm.h
> > > > @@ -887,6 +887,7 @@ struct drm_syncobj_transfer {
> > > >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
> > > >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
> > > >  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
> > > > +#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline based to deadline_nsec/sec */  
> > >
> > > Hi,
> > >
> > > where is the UAPI documentation explaining what is a "fence deadline"
> > > and what setting it does here?  
> > 
> > It's with the rest of the drm_syncobj UAPI docs ;-)
> 
> Is that https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#dma-fence-uabi-sync-file ?
> 
> That whole page never mentions e.g. WAIT_AVAILABLE, so at least the
> flags are not there. Does not mention syncobj_wait either.

probably this:
https://docs.kernel.org/gpu/drm-mm.html

the new one needs to be added there as well.

> 
> I could ask where the real non-IGT userspace is or the plan for it,
> too, since this is new DRM UAPI.

yeap, it looks like we need to close on this...
https://gitlab.freedesktop.org/drm/intel/-/issues/8014

I confess I got lost on the many discussions and on how this will
be used. Is mesa going to set the deadline based on the vk priority?

Will this continue to be internal? I didn't get the broader picture
I'm afraid...

> 
> 
> Thanks,
> pq
> 
> > 
> > BR,
> > -R
> > 
> > > btw. no nsec/sec anymore.
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > >  
> > > >  struct drm_syncobj_wait {
> > > >       __u64 handles;
> > > >       /* absolute timeout */
> > > > @@ -895,6 +896,8 @@ struct drm_syncobj_wait {
> > > >       __u32 flags;
> > > >       __u32 first_signaled; /* only valid when not waiting all */
> > > >       __u32 pad;
> > > > +     /* Deadline hint to set on backing fence(s) in CLOCK_MONOTONIC: */
> > > > +     __u64 deadline_ns;
> > > >  };
> > > >
> > > >  struct drm_syncobj_timeline_wait {
> > > > @@ -907,6 +910,8 @@ struct drm_syncobj_timeline_wait {
> > > >       __u32 flags;
> > > >       __u32 first_signaled; /* only valid when not waiting all */
> > > >       __u32 pad;
> > > > +     /* Deadline hint to set on backing fence(s) in CLOCK_MONOTONIC: */
> > > > +     __u64 deadline_ns;
> > > >  };
> > > >
> > > >  
> > >  
> 


