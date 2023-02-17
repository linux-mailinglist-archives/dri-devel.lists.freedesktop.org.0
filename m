Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D42A69B41D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 21:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E159210E467;
	Fri, 17 Feb 2023 20:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9629D10E460;
 Fri, 17 Feb 2023 20:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676666749; x=1708202749;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cBzepI8toCH0EcYeFd/zU2wH+XvjgBj6U2TQqAlT7PU=;
 b=U91y51ZX+HBZEqKOijXTYkau5ECS8YmL2uluE9iGbpB16t9Jkx0Z+mPS
 1C2LhAtEg2MRTtC/lQY7eOw6aAua5m5czKwTroO1y5gZjHLE6vdUTAoQX
 +OMVqiSMiL3y+dOZReswm/wsw9su8tVtVvjLaLWezBFJd8cPFTzNirxit
 Vmxv6ahgltbRIXD6iMVX0jCQyzNJ/d4d173WdBub/ZO/4aWEF1oUZV83Y
 +lMbOIRFsn2k6xUTWBDdwLkZ0mqalLdDNYjnUFR+TbC37Bt5gNs/sTI4d
 R+k7zasubxQiDmyXzo054Ffwn7nVokmMaj+6ehL8jQane0NW125YR4j8e A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="418307317"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="418307317"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="703056996"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="703056996"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 17 Feb 2023 12:45:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:45:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:45:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:45:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIgG3J14nCvit+uJpyDqc5J5MY9Z6Z35vDsVKxNxlSw0LfRzngOUTAuSTurbFV8Ys4McT9gTje9yXdHiEf2BH4Jkm5InuJAo1mhW5+D9HkpOz6h1BebsnaHRaQgIaIZFgEBiwHvwxOwxUyYtZX00W1FV/MI+9J822SbBnH5XMdRUAbG6DGIeO2FHxem0Z/huyNwQo+y4zHdgrGlJpXMls+yS7eY7Ua+cgHpUpTR1feq7rX0HL7Gu4w/XVBkjG2o1OHnc8t2DPYLbSM3E5kR3Hgu6UiJ6bvcBLkQ/C829GRd3EYjuVTGt5VZc56P1UVZ3uRg+B9+6Tve4qtYKNlQ2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8jFOkXgNhlyCy4eVFNjKBJES+Mh4xyWaBekqgdA60o=;
 b=YmX9jkglUHSToHFvWASyKvmacM6o5rn+/6K8i6yL0BvpOnhoGYV1tGtfWh21ZQbK04cQKfQuD+/zgRtj2E/70eSDBItGCT2onFverh0iWGZ5WOCxjaDhOBhMFjeu70MR0UpBNpJGSLVEs7YmgWkIOd2rD41+xvygxJPSB5sYPYZCUkNDavLracMFCAjW/AeOxIsbHVMXQ4QEuJLW2Z4quoyofX7B0O4qVgkL51RB/VpptJKNMu+/9/KJiL0OVTw/Gfj+QyYkLtQ0W6OvOG3Pmn7uGKt4Pv9G9upVJ+3mkLIlZ0BhHQl3/uaP8VkLtbzmA7FosHuFKWHqgw9ck2/FXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Fri, 17 Feb
 2023 20:45:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 20:45:45 +0000
Date: Fri, 17 Feb 2023 15:45:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
Message-ID: <Y+/ndNIu/kYGiVh5@intel.com>
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
 <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
 <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
 <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
X-ClientProxiedBy: BY5PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bfdc0e-241f-4bd4-1053-08db1127f15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mj+wy/e3DE4H8MdVBc4FWxDEy5ti1PcgCGEn7ZdRNFJ9ijjWPpDg6VEaBfPskrxwqi31gUZFbGcF9yMRk3wMfnoVHs4aGcOfy1RmPZ8uRRnSpaY3hJ7JafQ+J6DZIBbsp7fj63SK+3ahi/Sgv9iS+iDnDmDm3u4NnYxtEtEEYwp3/mpr82jGE1EnWAz2O/zEvYWG9jrQ7OPUwiMjAIGXAznbwji5W3m5k9SU5953FQ4x8RbWzVQr9UBCNFXXJ6Uzz22LYvryfunsbm5jelfJ6MFjNUdReqqWc/4JmodSPmFDNcKEFIPNgjNXouQsXVk3SsQ+Il60CmT4zf6DJGrlOriD9M72KXfUdgzpyCx/VEzhv76yFojF1f080FTJQd/J3O6u0kU1vZpqE5bNJozylk2canxXc3wUKpQ/cwLHS5NiJSqQlafSksqBXYHiI6zAZEFRKCLxYnDFuCOnnyki5Ey6eADxCugfrWPyhWaSb41CNWv0GgjFEoNlYs/yPaiyr9iKVbhzWHp0IkrwrEOOIRgKeSZv5Zxsk8WLfnoM5Dg5TdIXUMJ9D2eL6WcwHezWKgrzD1ueW1o8FICUZzjKrnulVpziXlZO8MxrpGJsFqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199018)(86362001)(66946007)(26005)(966005)(2616005)(478600001)(6512007)(8676002)(186003)(4326008)(5660300002)(6486002)(6666004)(6916009)(66476007)(53546011)(66556008)(54906003)(316002)(30864003)(44832011)(83380400001)(6506007)(82960400001)(2906002)(38100700002)(41300700001)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4IA86zD3OCSYsuNyRteZdnkRKxvGyT98DOacOZXkohlW84pmLzpfVZFnk7gk?=
 =?us-ascii?Q?vgOOPHRuAMzWbHOqxuoefk4vQ0s0ldvjYTUrwv2nccwqbOwY+W7J9R+mCB8g?=
 =?us-ascii?Q?5crS2nlBKPCakpIqBeZIlG7IXpu/1aunexZgTuPZ7gF+UdT4BrOsMKOOv5BC?=
 =?us-ascii?Q?vmu2kQp/93CLv473S6pm9PdgsCCBt7PKI6X014C/0FJX46qaZXowElvCAcv5?=
 =?us-ascii?Q?WX4/z4cX3woz34Fm8CI7ZzYfwJ1if29uy3gRVMQBKX9fy6FL4OcZfk9WlrLt?=
 =?us-ascii?Q?Fk4DDlUOzcRpIKkfBNACKfdo0C8A0wTZeO64Q3OR7V8Z2COYRCVcKBio9BN5?=
 =?us-ascii?Q?QGA2NHqWR6ZdKKmjpmGUTo4VABxKK835sQ+z8BmiwbJmukDLi6B3QMFOHyO4?=
 =?us-ascii?Q?hgm9EfjsR7RXbuwL1B6IxMYRUgLTLTSxHpofmHTjuffgMVqTiVYtnl0rOPqg?=
 =?us-ascii?Q?30C58rxarfcxoACzYgngVlqwjdPFLyy0FLN7ixUJI85doniqcC+6FQ2t8ZZt?=
 =?us-ascii?Q?+9i88V2f+7V9CtYnqfg5RF2yT3WMIUJIn/XSuX040SFa1sRixa+LVSb7vE2k?=
 =?us-ascii?Q?/JgRhbdds4MDY6DpKguPPQZ1/Yh/Pon1SKKv7OzAalCYEMwGNNkDp4XO8EPU?=
 =?us-ascii?Q?bPR/JX7G0cVBtqKComuQtAnUe3fp3zfKOjxU06YTEfIZiGNWu2/PteZQb2AP?=
 =?us-ascii?Q?wNe3tqQwqblHcOB016jU7E7AdtWoZxcPyMRwGbokgGlpQfUzf+PbXhwjtvY7?=
 =?us-ascii?Q?YqpNO6Jovm8VwB2VFbzuau+4IgkK4TRQBM7HSX09lKlge4Kxxb9XdDveRKUS?=
 =?us-ascii?Q?w+HjAIWVQB4M3glwjJzfMjgQVycmlIpL+bbL1RIgqa5+3NM59OfFc/k/oThi?=
 =?us-ascii?Q?A60RyOIE5iSChAdvNdJIj9/9DQ0pSGDsCvqLl7c06D19HHimf9u/TO18LxQ1?=
 =?us-ascii?Q?tJZix2iRH7JuJ21XUn7wQNMkd2Gb97Ti56glwhNUAD8hmJ7BrjzCTc3+y3BI?=
 =?us-ascii?Q?5fwiDDZSrjUEvDR7Ku1dOr+JqfuqUbPFzTLvKDwFVEtB0xi0XTJdKiNnNfp3?=
 =?us-ascii?Q?1Ah9hAYxZ+WOAwoNzqnMC3GaqJby5gIeppESK+yMdisoy6qlffEOrKaPyWiH?=
 =?us-ascii?Q?ksLs5kk6mSuV3gAMwaNMgXaGJmSvUl+Vb41ikOQ3Xfd7Hety+eKdc6dZrLsg?=
 =?us-ascii?Q?XvQ7n+Nn0wIKHuTaMrU1tG8ZOVuDaINIK8EeJCWe95Ugv65LjXOebnrhPHoc?=
 =?us-ascii?Q?yG6XHMeeAbkBArPPLwfGKQzMclP87Ab6NlWJKmAOEaw1i3sSQwtqhIzRTFyp?=
 =?us-ascii?Q?VG0p3XKqABDPB6Q+3rsJA4NuB4kjA6YSKrD4cZvaS5Nov2PY2RzXDScIiBR4?=
 =?us-ascii?Q?G0hhgOLvUkEa2BYL7q/oxI0NqG/ffQN36+5Z5q0rUtU/qjynltBXCHy4OEZh?=
 =?us-ascii?Q?bGydVOnkC+4DnIWYTTcE9wwUlYdLy4TEeapyx6kSuO255E79YBHXEW3jE28j?=
 =?us-ascii?Q?VLafFdkDTMEfZxuHHWBWrcR9bcl01ShiYVmSgVMHltAhUIcrNqaNZcIHavaj?=
 =?us-ascii?Q?PC1zgkUM9b81DyHovi6ih5XsGXQ7B6fS4uwYCTOP+IJL3c15feCM6m+TyxzB?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bfdc0e-241f-4bd4-1053-08db1127f15f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:45:45.7117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTfYK59PwIVXgcTHboUCqvBznaEpNW4eSs/ilbm6IXjE38Y6JoP7DtI1dA2zD6i3aiA0KNdKlNxzuICGX2oMgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 09:00:49AM -0800, Rob Clark wrote:
> On Fri, Feb 17, 2023 at 8:03 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >
> > On 17/02/2023 14:55, Rob Clark wrote:
> > > On Fri, Feb 17, 2023 at 4:56 AM Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com> wrote:
> > >>
> > >>
> > >> On 16/02/2023 18:19, Rodrigo Vivi wrote:
> > >>> On Tue, Feb 14, 2023 at 11:14:00AM -0800, Rob Clark wrote:
> > >>>> On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
> > >>>> <tvrtko.ursulin@linux.intel.com> wrote:
> > >>>>>
> > >>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > >>>>>
> > >>>>> In i915 we have this concept of "wait boosting" where we give a priority boost
> > >>>>> for instance to fences which are actively waited upon from userspace. This has
> > >>>>> it's pros and cons and can certainly be discussed at lenght. However fact is
> > >>>>> some workloads really like it.
> > >>>>>
> > >>>>> Problem is that with the arrival of drm syncobj and a new userspace waiting
> > >>>>> entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
> > >>>>> this mini series really (really) quickly to see if some discussion can be had.
> > >>>>>
> > >>>>> It adds a concept of "wait count" to dma fence, which is incremented for every
> > >>>>> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
> > >>>>> dma_fence_add_callback but from explicit/userspace wait paths).
> > >>>>
> > >>>> I was thinking about a similar thing, but in the context of dma_fence
> > >>>> (or rather sync_file) fd poll()ing.  How does the kernel differentiate
> > >>>> between "housekeeping" poll()ers that don't want to trigger boost but
> > >>>> simply know when to do cleanup, and waiters who are waiting with some
> > >>>> urgency.  I think we could use EPOLLPRI for this purpose.
> > >>>>
> > >>>> Not sure how that translates to waits via the syncobj.  But I think we
> > >>>> want to let userspace give some hint about urgent vs housekeeping
> > >>>> waits.
> > >>>
> > >>> Should the hint be on the waits, or should the hints be on the executed
> > >>> context?
> > >>>
> > >>> In the end we need some way to quickly ramp-up the frequency to avoid
> > >>> the execution bubbles.
> > >>>
> > >>> waitboost is trying to guess that, but in some cases it guess wrong
> > >>> and waste power.
> > >>
> > >> Do we have a list of workloads which shows who benefits and who loses
> > >> from the current implementation of waitboost?
> > >>> btw, this is something that other drivers might need:
> > >>>
> > >>> https://gitlab.freedesktop.org/drm/amd/-/issues/1500#note_825883
> > >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> > >>
> > >> I have several issues with the context hint if it would directly
> > >> influence frequency selection in the "more power" direction.
> > >>
> > >> First of all, assume a context hint would replace the waitboost. Which
> > >> applications would need to set it to restore the lost performance and
> > >> how would they set it?
> > >>
> > >> Then I don't even think userspace necessarily knows. Think of a layer
> > >> like OpenCL. It doesn't really know in advance the profile of
> > >> submissions vs waits. It depends on the CPU vs GPU speed, so hardware
> > >> generation, and the actual size of the workload which can be influenced
> > >> by the application (or user) and not the library.
> > >>
> > >> The approach also lends itself well for the "arms race" where every
> > >> application can say "Me me me, I am the most important workload there is!".
> > >
> > > since there is discussion happening in two places:
> > >
> > > https://gitlab.freedesktop.org/drm/intel/-/issues/8014#note_1777433
> > >
> > > What I think you might want is a ctx boost_mask which lets an app or
> > > driver disable certain boost signals/classes.  Where fence waits is
> > > one class of boost, but hypothetical other signals like touchscreen
> > > (or other) input events could be another class of boost.  A compute
> > > workload might be interested in fence wait boosts but could care less
> > > about input events.
> >
> > I think it can only be apps which could have any chance knowing whether
> > their use of a library is latency sensitive or not. Which means new
> > library extensions and their adoption. So I have some strong reservation
> > that route is feasible.
> >
> > Or we tie with priority which many drivers do. Normal and above gets the
> > boosting and what lowered itself does not (aka SCHED_IDLE/SCHED_BATCH).
> 
> yeah, that sounds reasonable.
> 

on that gitlab-issue discussion Emma Anholt was against using the priority
to influence frequency since that should be more about latency.

or we are talking about something different priority here?

> > Related note is that we lack any external control of our scheduling
> > decisions so we really do suck compared to other scheduling domains like
> > CPU and IO etc.
> >
> > >> The last concern is for me shared with the proposal to expose deadlines
> > >> or high priority waits as explicit uapi knobs. Both come under the "what
> > >> application told us it will do" category vs what it actually does. So I
> > >> think it is slightly weaker than basing decisions of waits.
> > >>
> > >> The current waitboost is a bit detached from that problem because when
> > >> we waitboost for flips we _know_ it is an actual framebuffer in the flip
> > >> chain. When we waitboost for waits we also know someone is waiting. We
> > >> are not trusting userspace telling us this will be a buffer in the flip
> > >> chain or that this is a context which will have a certain duty-cycle.
> > >>
> > >> But yes, even if the input is truthful, latter is still only a
> > >> heuristics because nothing says all waits are important. AFAIU it just
> > >> happened to work well in the past.
> > >>
> > >> I do understand I am effectively arguing for more heuristics, which may
> > >> sound a bit against the common wisdom. This is because in general I
> > >> think the logic to do the right thing, be it in the driver or in the
> > >> firmware, can work best if it has a holistic view. Simply put it needs
> > >> to have more inputs to the decisions it is making.
> > >>
> > >> That is what my series is proposing - adding a common signal of "someone
> > >> in userspace is waiting". What happens with that signal needs not be
> > >> defined (promised) in the uapi contract.
> > >>
> > >> Say you route it to SLPC logic. It doesn't need to do with it what
> > >> legacy i915 is doing today. It just needs to do something which works
> > >> best for majority of workloads. It can even ignore it if that works for it.
> > >>
> > >> Finally, back to the immediate problem is when people replace the OpenCL
> > >> NEO driver with clvk that performance tanks. Because former does waits
> > >> using i915 specific ioctls and so triggers waitboost, latter waits on
> > >> syncobj so no waitboost and performance is bad. What short term solution
> > >> can we come up with? Or we say to not use clvk? I also wonder if other
> > >> Vulkan based stuff is perhaps missing those easy performance gains..
> > >>
> > >> Perhaps strictly speaking Rob's and mine proposal are not mutually
> > >> exclusive. Yes I could piggy back on his with an "immediate deadline for
> > >> waits" idea, but they could also be separate concepts if we concluded
> > >> "someone is waiting" signal is useful to have. Or it takes to long to
> > >> upstream the full deadline idea.
> > >
> > > Let me re-spin my series and add the syncobj wait flag and i915 bits
> >
> > I think wait flag is questionable unless it is inverted to imply waits
> > which can be de-prioritized (again same parallel with SCHED_IDLE/BATCH).
> > Having a flag which "makes things faster" IMO should require elevated
> > privilege (to avoid the "arms race") at which point I fear it quickly
> > becomes uninteresting.
> 
> I guess you could make the argument in either direction.  Making the
> default behavior ramp up clocks could be a power regression.

yeap, exactly the media / video conference case.

> 
> I also think the "arms race" scenario isn't really as much of a
> problem as you think.  There aren't _that_ many things using the GPU
> at the same time (compared to # of things using CPU).   And a lot of
> mobile games throttle framerate to avoid draining your battery too
> quickly (after all, if your battery is dead you can't keep buying loot
> boxes or whatever).

Very good point.

And in the GPU case they rely a lot on the profiles. Which btw, seems
to be the Radeon solution. They boost the freq if the high performance
profile is selected and don't care about the execution bubbles if low
or mid profiles are selected, or something like that.

> 
> > > adapted from your patches..  I think the basic idea of deadlines
> > > (which includes "I want it NOW" ;-)) isn't controversial, but the
> > > original idea got caught up in some bikeshed (what about compositors
> > > that wait on fences in userspace to decide which surfaces to update in
> > > the next frame), plus me getting busy and generally not having a good
> > > plan for how to leverage this from VM guests (which is becoming
> > > increasingly important for CrOS).  I think I can build on some ongoing
> > > virtgpu fencing improvement work to solve the latter.  But now that we
> > > have a 2nd use-case for this, it makes sense to respin.
> >
> > Sure, I was looking at the old version already. It is interesting. But
> > also IMO needs quite a bit more work to approach achieving what is
> > implied from the name of the feature. It would need proper deadline
> > based sched job picking, and even then drm sched is mostly just a
> > frontend. So once past runnable status and jobs handed over to backend,
> > without further driver work it probably wouldn't be very effective past
> > very lightly loaded systems.
> 
> Yes, but all of that is not part of dma_fence ;-)
> 
> A pretty common challenging usecase is still the single fullscreen
> game, where scheduling isn't the problem, but landing at an
> appropriate GPU freq absolutely is.  (UI workloads are perhaps more
> interesting from a scheduler standpoint, but they generally aren't
> challenging from a load/freq standpoint.)
> 
> Fwiw, the original motivation of the series was to implement something
> akin to i915 pageflip boosting without having to abandon the atomic
> helpers.  (And, I guess it would also let i915 preserve that feature
> if it switched to atomic helpers.. I'm unsure if there are still other
> things blocking i915's migration.)
> 
> > Then if we fast forward to a world where schedulers perhaps become fully
> > deadline aware (we even had this for i915 few years back) then the
> > question will be does equating waits with immediate deadlines still
> > works. Maybe not too well because we wouldn't have the ability to
> > distinguish between the "someone is waiting" signal from the otherwise
> > propagated deadlines.
> 
> Is there any other way to handle a wait boost than expressing it as an
> ASAP deadline?
> 
> BR,
> -R
> 
> >
> > Regards,
> >
> > Tvrtko
