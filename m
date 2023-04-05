Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8176D864C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 20:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ED110E1B7;
	Wed,  5 Apr 2023 18:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513B410E0E9;
 Wed,  5 Apr 2023 18:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680720812; x=1712256812;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xN1Wibee+elSPVJI3f8+iT7frlbiK3OCjpkL7UW7ERs=;
 b=IUjRYndpLlwrGxy9n8ehxfGRjgp9OCDnYZEmEGKtwYG0uKBFA89DRoyz
 l8iVThrKs1It5G1eDvjgB/Hp9rXYo0Jitcuuf1bg4mrF7IPKVHrX/6X7f
 gGMvWvoZxLshZt0ED9FVTvV1TIfh4beziQP6P3AVyi0RvUVsX4skbanKb
 Pnu0onKhu+RzudStT6C4MO9GTXpSQtjS+vwzTrYsgRmFI0SkjJ73JIAJe
 7dIV8MPEgq5fLfTBTt9mawQ1uug8dl3hihlwgjOVNUZ55dolYdP4vpfRi
 x0Vm9tHdD+Lc1FerkRPXIGQVR08Md9TIFf6rqceYZ1TDRZmA6c2yA39CJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342553749"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="342553749"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 11:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756091402"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="756091402"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 05 Apr 2023 11:53:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 11:53:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 11:53:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 11:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMTzlHOIS9znywmf+42bRVX5FkeP9Yw22HwrYHk7/0nRuih8KheiNUjOuWydwDN3JZpC6OrJ9vuklgS9m7g+mFpiZwvddttnF48CEFCPILTbCHYohigzMU8jvgWvw0xNJIdWf9J+VKX1kJSlYiWuYkgg/zhyZ9jODHC796QTNwoj/4JgGhyRSzz1Z5l1QfYimCA2ObhcXE9CA0dUZ7dg78Dxjskt5BKJO6e8C/6zV/YdzYYYUgX41vUwu722G7yACGmRMtpuZdq2fVef6/5S049UoBzuqnk1c8Q3XVDaxXEu70UWAonD1iO8zscinR4Cnx4XYWg8htOTlLAvo8rnHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=715WWiOQuQumm6D7YG+7ZF0UfzrIvEw+kY119HRxUKU=;
 b=UauQkj30SUTHsZ8jBlHjjd50PYOFtNwXK/kwCYeoa1HlZiO2P1gqMIfbbQKAhM21ue3rOlqRnAUHD5XedjTqfsQmYIZ2rEoNxn0RgipkCcyjg66vd8Qx4Xyc8UEEwlCJ0p65Gk1bNO/MAX9Xl3JpGCauEwZc1n6YFeIdtutcfOiHLmK6yrDEM1Q4ZC4FOScamVaZ8PIY/soCJVJjqhmZZvC9CHwFROKcWCn+Ptco+dMMW8s1pe8rUqB0BKLlVH5PqYaGUdIoLnj400KR5XqsqWtcgaSeQCaagTCeOOcRJMtZfsBGfksYAxThk/abylI3LIR/jK5qyfRH+28GiVi09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 18:53:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 18:53:20 +0000
Date: Wed, 5 Apr 2023 18:53:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZC3Dmno7s05/5VPN@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
 <018b891d-ec31-b8c2-f987-45a204ed77ed@amd.com>
 <SA1PR11MB69918B99750334B368E196B992909@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB69918B99750334B368E196B992909@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 294cf550-cf89-4621-e5fd-08db3607066f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIrit6W9auaWWlv07mejUK0MWxLcFv8ldbXf89cDdvuAvse9wyXUKp5Ye6LDfc/HZhkoBf0bLDq8Pr7jRi8LDr9fVUNrR3c6S+VSAq3RRS1DSOg4uuuVTADJVmIn6YsTTD4NZa3KONvC5NcBDuGMQqIN+t9Vtx9Kbh4gLH3wWWPJnZorO/5qvJKR6/voJeYISrf+4TazIk+rspCZJgmBkvD8aEZMPO7VVZ1iYiNeyDqY8OZdz1l2d4iJ3e2nOXtKOlfhYzaY27WTLCjWmNNRqM61J2PXaCCTKR1BEuKtl9/XVjQ00QQwOIpKmF4x8rQ6UaRfj/qFpO+NJutDnfbfhewEwLa2C1OaloWJHIU5Z40aBs25HjvmmWZR05ZSlTiNocIYFQ+HEVLGMkOtuA4MHwOfUqPwBTyChgG4Z1gqncSl6CjgM80X7i87nPI/MFpB0G+eof5zQKbiiK+rqEoKosoWIessw8bWBOP74cbRjLS4nTUa2tuhdR2ScprtubeQ+EX5E0JAm3b6C3ZKjdiYWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(86362001)(2906002)(66899021)(6862004)(6666004)(6486002)(966005)(186003)(53546011)(83380400001)(66574015)(6506007)(26005)(6512007)(478600001)(4326008)(66946007)(8676002)(66556008)(82960400001)(41300700001)(66476007)(38100700002)(5660300002)(6636002)(316002)(44832011)(30864003)(8936002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?teh8xbsTnNWSes8iwTfSC8T7PRu/uo2YSsFkRRiGJ6XxWk4m8KltEwvR7z?=
 =?iso-8859-1?Q?RDPCda2VpdxeAQghggnrWC1GpicGxDlD9YhCRY8r1Fd8lakr7Xx6wTwgAK?=
 =?iso-8859-1?Q?SI28/8tf16i4bifL9u4OY8A5znLKLRYpaHomAwat94S0b+yUy2lZ7j7wS2?=
 =?iso-8859-1?Q?HrGRYZWzyUotJq1LOmbZA866q877u5pTyoF6OYWeFtzi1VU4FFiGaRttS0?=
 =?iso-8859-1?Q?GYYoVBoeYly5NuSzjMK7IKbqehcKRngUjZMqjqSLb6i28ajM3W3HPKn54e?=
 =?iso-8859-1?Q?Co8Cqjion2cSd+inyK9LUo40DgJF4VLDm7TiNtYoRbTJ42eS8RBCyGaJxG?=
 =?iso-8859-1?Q?yyCpWvQ3bxirwklTF/xwf3eX4IkTnKiWPQTDkWa0soX/JnMCxmQTRnjWBw?=
 =?iso-8859-1?Q?jl7ZWEHxuOEs04SyoBklc35CqzLycYNJXX33ig/3ng+x2l24UrAZAehIG2?=
 =?iso-8859-1?Q?bjE32fxlrkvGJ4VnH6t6OVEG8OUa00PaiNudcezu7JhQqyNTwLpaW1e90c?=
 =?iso-8859-1?Q?aLwVrXAdeHzFYxoPSTTfGrP/riNIon3c4nBcOnHC1n3OQt6ziCX/JWPA4O?=
 =?iso-8859-1?Q?6+qZTO3RR5SLUEIhk+qIqFdKRcsckmHKphP1/2f4LH6pobBhsg2TGKFMaB?=
 =?iso-8859-1?Q?Fl0wi3fp8lL8fZcJgHFV5fgkdsvaPqB0DXtcMesxSHNvgSFKzIIM8bCR5+?=
 =?iso-8859-1?Q?sRa6eKJPDeYaI2Z/lOJy8XIo8p5cMKxxSJpIRUQBEnmcbq2OdTkbieauad?=
 =?iso-8859-1?Q?AX7feG+bLS4Qx3Z2pJV7wj/Lh04YqE9OnHpvlo1imQzfbWKz7j2YznCtPW?=
 =?iso-8859-1?Q?hgo5fNao62cC0qe143x94e19qW1WKAh4HQOjmxLvyNP8f7ZHiMrXkDjdUo?=
 =?iso-8859-1?Q?HnFiD9Ic9k+proRGg50rVYlknBajBHppZ5N3sOHg0a5hLKAOfxRC/vdaRe?=
 =?iso-8859-1?Q?7aPQGAjePmAKYqrsZwj0KFH9nfYc+bciHiE4ea40oTg0/g9FKUho5eTcN/?=
 =?iso-8859-1?Q?ZJ+z70dle2U1k1BsmqfRsi1TmrGtCTJYjq0rKkxbFsoA6av2ZX5mHSK4iC?=
 =?iso-8859-1?Q?k2YQcCOS+yVSv398iM+nMlP0Kz6V3HcIDpv+bjUaY1/diJKDPDPUPpvIGL?=
 =?iso-8859-1?Q?z7rAsgbEiXXLe6pJxq5gPoaJ2I3X6NYCtD2nK5ApDi/3WSW+PWEHMafDXB?=
 =?iso-8859-1?Q?xiV6UtLfzdjP+ne1nhXAebUi/3d4yd+phNoKZW/IcII6u+H7catZs541ex?=
 =?iso-8859-1?Q?sHplgBhNCsbwaoaPf9cUyyLfZLFEgC+YoTva5nzfF9b9ZxD3DI+NIv4wB1?=
 =?iso-8859-1?Q?4B+l/GlB4ZzJZpWLE8McQrha0KnsBf5kIciy7bi0cyg0RZiF+PLbVLKCyH?=
 =?iso-8859-1?Q?G/eittOMACorrl0FQyyVoqPENQPJhKlFgVsB53WkpxdCxDX7dlySgLYR4/?=
 =?iso-8859-1?Q?g/h97KAZNZAoBGWeLuOO4/MOhqA7uW0sOgH8vmrE1XA5Undbv9L3b6qUW/?=
 =?iso-8859-1?Q?mLX61T4bCZ3SPap1ADY/2BKwZXy2juwTCzOaJ6eWEEyOrAREPJtjt08Qu0?=
 =?iso-8859-1?Q?ck1tbpcuaJvoWWTjNyoTLTidG86NIK3sjBpVWou3ihThO9cVSg5wZLVVOP?=
 =?iso-8859-1?Q?uWXfHkH03ue7Hm8senqHDaqWfSI2ns2GU8aLinyJlWv3NxQ34px6cLaw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 294cf550-cf89-4621-e5fd-08db3607066f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:53:20.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7I5JYQtQnoxdfK6fv4T6CHcndkgbLWGLc5aPCJC0a+FfAH8Sx5fEXMrXGtJshIdyGRtpZsW0Q0ps1Fh2/+Z7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "lina@asahilina.net" <lina@asahilina.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 12:06:53PM -0600, Zeng, Oak wrote:
> Hi,
> 
> Using dma-fence for completion/dependency tracking for long-run workload(more precisely on-demand paging/page fault enabled workload) can cause deadlock. This seems the significant issue here. Other issues such as the drm scheduler completion order implication etc are minors which can be solve inside the framework of drm scheduler. We need to evaluate below paths:
> 
> 	1) still use drm scheduler for job submission, and use dma-fence for job completion waiting/dependency tracking. This is solution proposed in this series. Annotate dma-fence for long-run workload: user can still wait dma-fence for job completion but can't wait dma-fence while holding any memory management locks.  We still use dma-fence for dependency tracking. But it is just very easily run into deadlock when on-demand paging is in the picture. The annotation helps us to detect deadlock but not solve deadlock problems. Seems *not* a complete solution: It is almost impossible to completely avoid dependency deadlock in complex runtime environment
>

No one can wait on LR fence, so it is impossible to deadlock. The
annotations enforce this. Literally this is only for flow controling the
ring / hold pending jobs in in the DRM schedule list.

> 	2) Still use drm scheduler but not use dma-fence for completion signaling and dependency tracking. This way we still get some free functions (reset, err handling ring flow control as Matt said)from drm scheduler, but push the dependency/completion tracking completely to user space using techniques such as user space fence. User space doesn't have chance to wait fence while holding a kernel memory management lock, thus the dma-fence deadlock issue is solved.
>

We use user space fence for syncs.

> 	3) Completely discard drm scheduler and dma-fence for long-run workload. Use user queue/doorbell for super fast submission, directly interact with fw scheduler. Use user fence for completion/dependency tracking.
> 

This is a hard no from me, I want 1 submission path in Xe. Either we use
the DRM scheduler or we don't.

Matt

> Thanks,
> Oak
> 
> > -----Original Message-----
> > From: Christian König <christian.koenig@amd.com>
> > Sent: April 5, 2023 3:30 AM
> > To: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> > robdclark@chromium.org; thomas.hellstrom@linux.intel.com; airlied@linux.ie;
> > lina@asahilina.net; boris.brezillon@collabora.com; faith.ekstrand@collabora.com
> > Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
> > plans
> > 
> > Am 04.04.23 um 20:08 schrieb Matthew Brost:
> > > On Tue, Apr 04, 2023 at 12:02:03PM -0600, Zeng, Oak wrote:
> > >> Hi Matt, Thomas,
> > >>
> > >> Some very bold out of box thinking in this area:
> > >>
> > >> 1. so you want to use drm scheduler and dma-fence for long running workload.
> > Why you want to do this in the first place? What is the benefit? Drm scheduler is
> > pretty much a software scheduler. Modern gpu has scheduler built at fw/hw
> > level, as you said below for intel this is Guc. Can xe driver just directly submit job
> > to Guc, bypassing drm scheduler?
> > >>
> > > If we did that now we have 2 paths for dependency track, flow controling
> > > the ring, resets / error handling / backend submission implementations.
> > > We don't want this.
> > 
> > Well exactly that's the point: Why?
> > 
> > As far as I can see that are two completely distinct use cases, so you
> > absolutely do want two completely distinct implementations for this.
> > 
> > >> 2. using dma-fence for long run workload: I am well aware that page fault (and
> > the consequent memory allocation/lock acquiring to fix the fault) can cause
> > deadlock for a dma-fence wait. But I am not convinced that dma-fence can't be
> > used purely because the nature of the workload that it runs very long (indefinite).
> > I did a math: the dma_fence_wait_timeout function's third param is the timeout
> > which is a signed long type. If HZ is 1000, this is about 23 days. If 23 days is not long
> > enough, can we just change the timeout parameter to signed 64 bits so it is much
> > longer than our life time...
> > >>
> > >> So I mainly argue we can't use dma-fence for long-run workload is not
> > because the workload runs very long, rather because of the fact that we use
> > page fault for long-run workload. If we enable page fault for short-run workload,
> > we can't use dma-fence either. Page fault is the key thing here.
> > >>
> > >> Now since we use page fault which is *fundamentally* controversial with
> > dma-fence design, why now just introduce a independent concept such as user-
> > fence instead of extending existing dma-fence?
> > >>
> > >> I like unified design. If drm scheduler, dma-fence can be extended to work for
> > everything, it is beautiful. But seems we have some fundamental problem here.
> > >>
> > > Thomas's patches turn a dma-fence into KMD sync point (e.g. we just use
> > > the signal / CB infrastructure) and enforce we don't use use these
> > > dma-fences from the scheduler in memory reclaim paths or export these to
> > > user space or other drivers. Think of this mode as SW only fence.
> > 
> > Yeah and I truly think this is an really bad idea.
> > 
> > The signal/CB infrastructure in the dma_fence turned out to be the
> > absolutely nightmare I initially predicted. Sorry to say that, but in
> > this case the "I've told you so" is appropriate in my opinion.
> > 
> > If we need infrastructure for long running dependency tracking we should
> > encapsulate that in a new framework and not try to mangle the existing
> > code for something it was never intended for.
> > 
> > Christian.
> > 
> > >
> > > Matt
> > >
> > >> Thanks,
> > >> Oak
> > >>
> > >>> -----Original Message-----
> > >>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > >>> Matthew Brost
> > >>> Sent: April 3, 2023 8:22 PM
> > >>> To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > >>> Cc: robdclark@chromium.org; thomas.hellstrom@linux.intel.com;
> > airlied@linux.ie;
> > >>> lina@asahilina.net; boris.brezillon@collabora.com; Brost, Matthew
> > >>> <matthew.brost@intel.com>; christian.koenig@amd.com;
> > >>> faith.ekstrand@collabora.com
> > >>> Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
> > plans
> > >>>
> > >>> Hello,
> > >>>
> > >>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > >>> have been asked to merge our common DRM scheduler patches first as well
> > >>> as develop a common solution for long running workloads with the DRM
> > >>> scheduler. This RFC series is our first attempt at doing this. We
> > >>> welcome any and all feedback.
> > >>>
> > >>> This can we thought of as 4 parts detailed below.
> > >>>
> > >>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > >>> entity (patches 1-3)
> > >>>
> > >>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > >>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > >>> severals problems as the DRM was originally designed to schedule jobs on
> > >>> hardware queues. The main problem being that DRM scheduler expects the
> > >>> submission order of jobs to be the completion order of jobs even across
> > >>> multiple entities. This assumption falls apart with a firmware scheduler
> > >>> as a firmware scheduler has no concept of jobs and jobs can complete out
> > >>> of order. A novel solution for was originally thought of by Faith during
> > >>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> > >>> and entity. I believe the AGX driver [3] is using this approach and
> > >>> Boris may use approach as well for the Mali driver [4].
> > >>>
> > >>> To support a 1 to 1 relationship we move the main execution function
> > >>> from a kthread to a work queue and add a new scheduling mode which
> > >>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > >>> The new scheduling mode should unify all drivers usage with a 1 to 1
> > >>> relationship and can be thought of as using scheduler as a dependency /
> > >>> infligt job tracker rather than a true scheduler.
> > >>>
> > >>> - Generic messaging interface for DRM scheduler
> > >>>
> > >>> Idea is to be able to communicate to the submission backend with in band
> > >>> (relative to main execution function) messages. Messages are backend
> > >>> defined and flexable enough for any use case. In Xe we use these
> > >>> messages to clean up entites, set properties for entites, and suspend /
> > >>> resume execution of an entity [5]. I suspect other driver can leverage
> > >>> this messaging concept too as it a convenient way to avoid races in the
> > >>> backend.
> > >>>
> > >>> - Support for using TDR for all error paths of a scheduler / entity
> > >>>
> > >>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
> > >>>
> > >>> - Annotate dma-fences for long running workloads.
> > >>>
> > >>> The idea here is to use dma-fences only as sync points within the
> > >>> scheduler and never export them for long running workloads. By
> > >>> annotating these fences as long running we ensure that these dma-fences
> > >>> are never used in a way that breaks the dma-fence rules. A benefit of
> > >>> thus approach is the scheduler can still safely flow control the
> > >>> execution ring buffer via the job limit without breaking the dma-fence
> > >>> rules.
> > >>>
> > >>> Again this a first draft and looking forward to feedback.
> > >>>
> > >>> Enjoy - Matt
> > >>>
> > >>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > >>> [2] https://patchwork.freedesktop.org/series/112188/
> > >>> [3] https://patchwork.freedesktop.org/series/114772/
> > >>> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> > >>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-
> > >>> next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> > >>>
> > >>> Matthew Brost (8):
> > >>>    drm/sched: Convert drm scheduler to use a work queue rather than
> > >>>      kthread
> > >>>    drm/sched: Move schedule policy to scheduler / entity
> > >>>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> > >>>    drm/sched: Add generic scheduler message interface
> > >>>    drm/sched: Start run wq before TDR in drm_sched_start
> > >>>    drm/sched: Submit job before starting TDR
> > >>>    drm/sched: Add helper to set TDR timeout
> > >>>    drm/syncobj: Warn on long running dma-fences
> > >>>
> > >>> Thomas Hellström (2):
> > >>>    dma-buf/dma-fence: Introduce long-running completion fences
> > >>>    drm/sched: Support long-running sched entities
> > >>>
> > >>>   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> > >>>   drivers/dma-buf/dma-resv.c                  |   5 +
> > >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> > >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> > >>>   drivers/gpu/drm/drm_syncobj.c               |   5 +-
> > >>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> > >>>   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> > >>>   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> > >>>   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> > >>>   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> > >>>   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> > >>>   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> > >>>   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
> > >>>   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> > >>>   include/drm/gpu_scheduler.h                 | 130 +++++++--
> > >>>   include/linux/dma-fence.h                   |  60 ++++-
> > >>>   16 files changed, 649 insertions(+), 184 deletions(-)
> > >>>
> > >>> --
> > >>> 2.34.1
> 
