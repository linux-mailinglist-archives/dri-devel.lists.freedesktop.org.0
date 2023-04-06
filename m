Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 414126D8D42
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 04:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9959410E004;
	Thu,  6 Apr 2023 02:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1706A10E004;
 Thu,  6 Apr 2023 02:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680746908; x=1712282908;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1bZSBNz+8y/sOzHiDbWW1DFTEEWMwj5q4lcxNkHmJpM=;
 b=f+m5yiHrjTiq3z+Ose0FMn1rxqAdWSS1O3eJOkk1Si6ZQf8wHkv2474k
 NAtaIxbKc0YLaeVgEhAhTAxv58dDy9UxkTnA941JFrctJWe4S+1KAFONB
 GgqfF3S/08oiTar5am35dCUx5H1Tgt76IqmTV8vEXcS3vqA0NtrxT0NmO
 3BOrUTOVgtj42g51n2DT+h5Ylb88zuMbbvjiGK2F/gCT+icepFXbwFApi
 0NKqs64OpitZxuV5g0MRTBYqXE7z2ff21GJSY7GKV4fFYnZfUUHkwXpgf
 DwIpnCfX/N4VZziyGiJbYnAg49yWRx+5S51jX68ChZXvQZppj6VyC1mw/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342628558"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="342628558"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 19:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="810825655"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="810825655"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 05 Apr 2023 19:08:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 19:08:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 19:08:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 19:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Utyu1+Z+TR0usx/OZNPhvzY26SM2Aa9hFGCeZPKHy47mlfn0xsYnlqnz51Cvj/2AOBm+9DU5HBbeir8W+Zq3umOZS9oRckDN4ic9MyIwF/ix1aGkG6nTDgq4Pt+0yPEwmD5I13SOF/w9YB7PK4+WupdjFPr88Yw0zsBBiN36OyoeMTxZ2Q8UCEoTn0JYtJvecb/UVrqyJNJoWGA3hC+GkLChpgowb0qHConOxda92z0YNpC6N9OtFYjDfX0r9dHVJOSPW9lEgEO2WKIeSpY4fbvpTRUHPZaDDBFSu3j7kndjMFaQQTKya936iJDMxfxV2LPC+3oSmdmn9QrniFZUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi88RojH4Rbn8gh7WRHtx6r0G4ANl6zC7ooIEU6qpas=;
 b=lvdS/rDCI06wLljEjYQKBx+lNNS/+5NljEP8gNSxPdvaLMLUmkZDH028YlymlD721N543ImGCf+/UhhQiUDxl//WAcGdwGml4uC83C8nepaBt2jo6oHFCrinF1o/qBfgzh9o5C8VNBNmwk/Q0FZ6Hrw/aCkmFTZq7kHzPRPG5G8V/xxsiW0zEHo4+4TDeTL4F5nZgB9/qVRjUShH5kzVhvy1MNxQnN+JbiaGZnUvCCU/A0cCSmrm/u/btpKxJlq90yqvDg6qJvrdR7joP5SWgk9h0v3lCc6tZW/7e7oJ0/XVtAEcrTfNS6b27fxZIcZmLzXJOK3lpcirgmieYs3u/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Thu, 6 Apr
 2023 02:08:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 02:08:16 +0000
Date: Thu, 6 Apr 2023 02:08:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZC4pinCurycVe4bi@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
 <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
 <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
 <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
 <CAKMK7uFEGoaOmewGmP4H_ouqZiMKAiaKwEohGCZq5T-UJYMf_w@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uFEGoaOmewGmP4H_ouqZiMKAiaKwEohGCZq5T-UJYMf_w@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4ca115-ffad-4aaf-5f23-08db3643c88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3pKgxdIVvQP6ZA0t4vjRt+zBzTGWJI88nJK4bBcrj3mt/oJCOlppHwvFVUCrchCK9qY2vgJv1JO4SVuMT5hhzZv/13wbH68RUcUhlykzKiAnaF5mz3ommf2RM52UwVPJ7VpjW7dJd5a3/qV6SrnxI6Db7bJXCjPid7PoLzNxGYFLH2kOmvE776OuB2l7MAAg1Vt4AVsoePCoRaFZAkjBldeGzC69v9nNrkhI56kPZUIl3NKFbl3ycBekDiRXw8Ce3NgmWjvvGlWttVRWCpT1VONPOxtr6SuFvjH3VcEgM7WmQKK8z9BsZrOAfq0PNhctssxZ7oZkhwbB/0dCh7gjggJjdMn7IAKO/ffzJ7czZEp7e0anRiA6/ck3QBaEXUYhGj/Gw4gxCmmgQNc7bBBJAZcoEutwQCva5o+VOeRkMxhPCbzyP2cwHl33d4h9fOPF+YyIFMhSUSgKBsEardZ1uNmTfD3NewRjq58ZjO1soh2d8huAmSXpFrwspuNsipKrv9yY6HqJAT9l6bKaKVZtQcF6cNy3ELRv3W7Aq3MwNHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(44832011)(5660300002)(66476007)(6916009)(478600001)(4326008)(66946007)(66556008)(316002)(8936002)(7416002)(38100700002)(82960400001)(41300700001)(8676002)(83380400001)(6506007)(966005)(66574015)(6486002)(6666004)(6512007)(186003)(26005)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FTVV/mgjq4wARDTeKX3T+gbmxcAyBK5InYYe9YRLST+v0QtCZAFje5QfQR?=
 =?iso-8859-1?Q?Hd3ROwINIgvw6kZhHDlb9KOjSi+t8WIUkmeQg4oi8GsIGFVh7VymXH3cJV?=
 =?iso-8859-1?Q?4NrzVZ/2vgJotbGrmnAYQPhMyI01PtGq9GCrNdszTVM4dZNEY++IyOPAbG?=
 =?iso-8859-1?Q?Q4CVPX+WaJPKTEM65ywJ2+klFRFMVdBxa2A+QmStyVucUvnL7AiUXka2BR?=
 =?iso-8859-1?Q?MsU75vWce/7FJsdiRxzXrwkBF4plGX/pEqEDxTN9QZmi1MW9YpLawm/iTz?=
 =?iso-8859-1?Q?m27ykNHNh+boleXu7zR89hcRZRjXXP6j0FLwb4YSnq0ccll2BkjJyA8iUs?=
 =?iso-8859-1?Q?JwJxQDxy6bm90yKwiy5MhvGyOzZ8s8ySCEwqYTmAxYcJpfOsT3Xp62weYn?=
 =?iso-8859-1?Q?gyj+YYXgSqt575+5T1Lk03FOB/AK69H4JM3fRAEWc5mzzqpNJQTos3sVN5?=
 =?iso-8859-1?Q?T4gP3qwB0c3MQA2PBv6h8FAL+lgmNWRLwmqRgB6t12QjMog/gzWRE3GHLh?=
 =?iso-8859-1?Q?kA03OQBJMFWByox6YczAslZWa65y8692EaLeUysg18iEcS5GoeQ4LTpI7f?=
 =?iso-8859-1?Q?LSGV0o0yRLIlqfzrgR9zIeKsZY2CLBMZpNK2dEk/4202096ImlNRr1M4ju?=
 =?iso-8859-1?Q?i1dpfaUUjN/dZ16pwnImg0xX8Z/TLnB5a2zMuXw4bxIc2s3W5uUOX/itqf?=
 =?iso-8859-1?Q?Kjc3a5nRFZ2wUIi8unYkZHt6EppRG4aM2hl+Dw13sskJdMydLf3VbH6H96?=
 =?iso-8859-1?Q?iBoZx0H9owwA4esKgLGRbEvAqqFyvPvvvWdUGXz2mW4RKgHFPWbpTlvanH?=
 =?iso-8859-1?Q?i4pz5+x6ZSEZW+3J0e8pN2eBTGycD7526TUBd/4mjD5M0uEpRWhvvAZKnk?=
 =?iso-8859-1?Q?eRCFPuWenLafKUr24MgZRBflInk5KVTtz8YrCkFBwH217re1dZjXJHurlb?=
 =?iso-8859-1?Q?5QKFFgD0W9OxfqHFaCA0CoRvr4mUNobKGmQo9sXWZi0mGIPTYBuX+rhSLb?=
 =?iso-8859-1?Q?nIIXz4sS9iJY+dhXVuqtYT+hooyJzqNGJwKNWCEeTcyjhujLzfeTJe4ZCc?=
 =?iso-8859-1?Q?gRUEIfdXnYhM5frqGqxX1Tpg+Zl2HNPwyPQ7CWY0uTN0qoPu+8jISaGa+c?=
 =?iso-8859-1?Q?zUPE4ltbJJdQIrYW0VDXUVIKmiVXn2jlaPLMHPwv0idNjO3VFXRSbaOPtQ?=
 =?iso-8859-1?Q?h4NFJoU4VQO/xq1Yb5iSJbFwdH8auppOWh6qlmDOGfmMKPNU6ko7ujcjt+?=
 =?iso-8859-1?Q?tCKsyZHo8CqF6hUEdknhctIe8opJUuLQgcwSJPe9ohLqv4A91G7Oy4Z9Cj?=
 =?iso-8859-1?Q?slUcaln2ylYDA56Gs6yeZO2k/+08NlUhDVxgXcJRcmSg+AvM0hz4r3/Doe?=
 =?iso-8859-1?Q?r8dTh8yVmpwqTELJOXDNm7jLkSEhvU2k2VReG0mOr8DBTty17gZ+4vD4QB?=
 =?iso-8859-1?Q?Q60NsZP+tMJ7I22hbQy5zwBAQ+oe/tzvciACaGv3AXVElQ7/9NkT9kn/Mg?=
 =?iso-8859-1?Q?cmtGx+8X84CgB5PYzK2q9LQT+v77sjiB6hq5+xdspqtKSylaYDdPSVzkID?=
 =?iso-8859-1?Q?hmw7u6ZLh+QeErqOsyT56MT23AcwNwrXIqZkQZT56sTPNPlX4XfYNAlMKN?=
 =?iso-8859-1?Q?jdFtbYlRSDbYS8bsz8RE351PpgXhwxhUouj/hZ1A+yCaSM52R9n6ePWQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4ca115-ffad-4aaf-5f23-08db3643c88c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 02:08:16.0109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzZ46yNkRdqGnCgNdDeZnP9RydO0lmlfMzoyHgahbdV7+Gla7cR/hdngEArp1LBWen0IB0tWNAhGoEydJOt5Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 12:12:27PM +0200, Daniel Vetter wrote:
> On Wed, 5 Apr 2023 at 11:57, Christian König <christian.koenig@amd.com> wrote:
> >
> > Am 05.04.23 um 11:07 schrieb Daniel Vetter:
> > > [SNIP]
> > >> I would approach it from the complete other side. This component here is a
> > >> tool to decide what job should run next.
> > >>
> > >> How that is then signaled and run should not be part of the scheduler, but
> > >> another more higher level component.
> > >>
> > >> This way you also don't have a problem with not using DMA-fences as
> > >> dependencies as well as constrains for running more jobs.
> > > I think we're talking about two things here and mixing them up.
> > >
> > > For the dependencies I agree with you, and imo that higher level tool
> > > should probably just be an on-demand submit thread in userspace for the
> > > rare case where the kernel would need to sort out a dependency otherwise
> > > (due to running out of ringspace in the per-ctx ringbuffer).
> > >
> > > The other thing is the message passing stuff, and this is what I was
> > > talking about above. This has nothing to do with handling dependencies,
> > > but with talking to the gpu fw. Here the intel design issue is that the fw
> > > only provides a single queue, and it's in-order. Which means it
> > > fundamentally has the stalling issue you describe as a point against a
> > > message passing design. And fundamentally we need to be able to talk to
> > > the fw in the scheduler ->run_job callback.
> > >
> > > The proposal here for the message passing part is that since it has the
> > > stalling issue already anyway, and the scheduler needs to be involved
> > > anyway, it makes sense to integrated this (as an optional thing, only for
> > > drivers which have this kind of fw interface) into the scheduler.
> > > Otherwise you just end up with two layers for no reason and more ping-pong
> > > delay because the ->run_job needs to kick off the subordinate driver layer
> > > first. Note that for this case the optional message passing support in the
> > > drm/scheduler actually makes things better, because it allows you to cut
> > > out one layer.
> > >
> > > Of course if a driver with better fw interface uses this message passing
> > > support, then that's bad. Hence the big warning in the kerneldoc.
> >
> > Well what I wanted to say is that if you design the dependency handling
> > / scheduler properly you don't need the message passing through it.
> >
> > For example if the GPU scheduler component uses a work item to do it's
> > handling instead of a kthread you could also let the driver specify the
> > work queue where this work item is executed on.
> >
> > When you design it like this the driver specifies the thread context of
> > execution for it's job. In other words it can specify a single threaded
> > firmware work queue as well.
> >
> > When you then have other messages which needs to be passed to the
> > firmware you can also use the same single threaded workqueue for this.
> >
> > Drivers which have a different firmware interface would just use one of
> > the system work queues instead.
> >
> > This approach basically decouples the GPU scheduler component from the
> > message passing functionality.
> 
> Hm I guess we've been talking past each another big time, because
> that's really what I thought was under discussions? Essentially the
> current rfc, but implementing with some polish.
>

I think Daniel pretty much nailed it here (thanks), to recap:

1. I want the messages in the same worker so run_job / free_job /
process_msg execution is mutual exclusive and also so during reset paths
if the worker is stopped all the entry points can't be entered.

If this is a NAK, then another worker is fine I guess. A lock between
run_job / free_job + process_msg should solve the exclusion issue and the
reset paths can also stop this new worker too. That being said I'd
rather leave this as is but will not fight this point.

2. process_msg is just used to communicate with the firmware using the
same queue as submission. Waiting for space in this queue is the only
place this function can block (same as submission), well actually we
have the concept a preempt time slice but that sleeps for 10 ms by
default. Also preempt is only used in LR entities so I don't think it is
relavent in this case either.

3. Agree this is in the dma-fence signaling path (if process_msg is in
the submission worker) so we can't block indefinitely or an unreasonable
period of time (i.e. we must obey dma-fence rules).

4. Agree the documentation for thw usage of the messaging interface
needs to be clear.

5. Agree that my code could alway use polishing.

Lets close on #1 then can I get on general Ack on this part of the RFC
and apply the polish in the full review process?

Matt

> iow I agree with you (I think at least).
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
