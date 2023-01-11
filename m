Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C652F666250
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF8510E7D8;
	Wed, 11 Jan 2023 17:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77C10E7C3;
 Wed, 11 Jan 2023 17:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673459578; x=1704995578;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RQQEQgxx/Zss6XOSnId4MoOp8Nc+SgG+xc45zarqvks=;
 b=DKrKvesHb00Mpo3wJvy8ZRY6GsnXiaTaCGr9ySFdVmltHw7spe2RBz8u
 /FXVNZ9O8w4p7WrDAZzqDhNN9aMUZAItpA4kHecMU34p46D12XQ0V/mge
 r0ioNab0TD3YLPEmDLutIdgPkmVJQbdUniIfUwcPE31ReilmUzI6mFz/P
 g0MHFE/rS4aaNtOnX00mzvsjSSfBsAdoDkrO2OfO3HUEYz9b6hSFMEuZ3
 S5//OJMUwHYnv7n1AG1Q80QMF3nplwhapPkMXYRF6AirUJlSXfum85ZUC
 BikPGORswxp4UCNvZcGoizbaZdW4vVxPsiKm/Dbz31juOLqe8EiDS++Vd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325502032"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="325502032"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 09:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746260086"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="746260086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2023 09:52:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 09:52:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 09:52:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 09:52:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 09:52:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TieD7wyOn88osNQUbck4Z4mSvbtMd97hdurLiEugBr2MYj4NtJbjstNDbVr0ITFXdUkIl2O2wjt27OqqiJs/2TrHj0APhrJ4wwScF1ST0iiXS6zSvmOEPV7FZxWrZvm8F5AIU2CP0E5OqbooK+oMMyA8wvf7wqXUWHN173sGyv7J5EoID94/Mdg+tAZ1BABYCzV1Oy7ZPBejObFYHptZoYqnx3aUxU0Sd1Cjv3HXpTssjDkWY16X6NleCStZRN0nPA8vGhV2cG6Iy9WHtI622ccXi9KKGWVP2RPNBloNiUuZyTZ39HqjHAVCaqN6vRhhrOxxn3JlYlaKYz8EPdhdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE19+wXSkc+FpwvO/KkX3gWSf54n5JJQ5G8/NXNcuJU=;
 b=LU8/Y2FStL3pqVwDepfr7WjcUTDe2pRpwFHFdLHH6rW5pQ4DnFD2+YuMYhZrGIk39NwrIXs6AIRDI97iSIZkbneWSfX2UHKAy+1zyAurL2sRfoeG75YeX2zVgwHDRoKhEHOth/01bnOxCnz5SMrWWCQUqW7ynRyx4VL5ORAP707052bDnT9Ko7jWxWKdjkjd1bBr3oXuXabDEvAKfQWfweiZphtW1AB7mwJQj5ZXySZrD0RzNlWt1vTMWnjQAViD2YyDPNzrIy9rBtbAyKB8PEagX4Li5bXknuNUAKre7VAOanpUzn9n+dT/4pQMw/Ccd8+azG8Ifmgi4vg5BYdALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6847.namprd11.prod.outlook.com (2603:10b6:806:29e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 17:52:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 17:52:50 +0000
Date: Wed, 11 Jan 2023 17:52:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y773Y0Q+dekoLqd5@DUT025-TGLU.fm.intel.com>
References: <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <Y72UpKPX6lr/ea7R@DUT025-TGLU.fm.intel.com>
 <Y74NSVeWdiKxdYci@DUT025-TGLU.fm.intel.com>
 <a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0036.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 326ec6c1-ef82-43c4-2495-08daf3fca7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fBfatxy0aX0cNGVT3/TW6IHq1fgUwFU1xo8bgxKaXT84+izw5pgVoywjRI9eSrJerdna2zo19i0aC1rpe/3pwJgZx4l4DgBbkWu1ti4PqIcCcet9SylmCsXMFF+C8rS10gnifFpKUssqApjYvU8BNO79vO39oYzMMLexXILE/ArIfTO10XXs9hceqYp5LfDBU0nEGVCh8n2Fm1BRY0rJQg87qwoHZvYFhK2dlRjlykSSNy52oRaaIhhc4SwNNUYjfxSJkII0CpNgDyuVVz5XmjhnNBiSdKWLQQmqdM3textMJux3pWRK5v3uD6q1hrrhzuQemgnfUx+1bYw9GQWgPaiN3PvpLXEJLufUopMwjsMYdhw3zuvnhNdQRLvmXD5A4tXZb0bIx2Gc5HWMWc5FpTTan0/bmoFyREOmSOlGNJKYCoEwParVjfOM+/x+l6DUl06Phu0Kow9XrVquQVDQExb2jDvZgq5ul8AGpJwvhHkG+ZamItaRcEHEmrJ24+tcpmqexaNv9ewxhzS67cC3A+Gx/sGWbKpjy04o0i2E2Uft2/VyNFX1RusH1fjw8Zo8bdL+/eau0nYUWVqFjTTBvSV3rpd8HxjP3BdZeJeHwXAVoLGCjjgsYnocgKK1pWFSCKGrxahi21sOHMosLnhIYUtid5dBcRbd3/s8JCS/g8t4nN3kOhFLFooDAu5UZ7iZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199015)(66899015)(2906002)(82960400001)(38100700002)(41300700001)(316002)(6916009)(66476007)(8676002)(186003)(4326008)(5660300002)(86362001)(66556008)(66946007)(478600001)(26005)(6506007)(83380400001)(53546011)(6512007)(44832011)(6486002)(6666004)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?P+OzIjoHXncwyPCdAJBXSXW/rpz2FMgnqCLfSAoogYRbz9VgB3DKU1td2p?=
 =?iso-8859-1?Q?bqVOhkqCEQzUOxdhPde3wPdponu8/21AT7wSmNdU/izWSD1e02KNmbsLa6?=
 =?iso-8859-1?Q?T07r7X/GzCHtp9nmAe1TeKS+Fy9D5JXOnBONSgoVLgEE3/gXLMio0W3zrx?=
 =?iso-8859-1?Q?tfw5br3fis179uzVfbssvO7x4xIFtbkRAQ16KCSZjNEFfgEBfEOABN3Aoc?=
 =?iso-8859-1?Q?7Tg7xy+/4pd4tvww1bPB78uOAEYhnDxy92O85aP1Pmv/L3PDY0Yj0Xbjqn?=
 =?iso-8859-1?Q?Tt8XXZrzGSh1DmCN/K0FScxc4eiLXexIbIY1PpIHNl59mSXs9QEupTwiFN?=
 =?iso-8859-1?Q?+pDiK11rVApDOrj2s4F5G0zFcnc7qAvYhzwnXw4cmth9gyMYqCvrnIXepW?=
 =?iso-8859-1?Q?7s8ErEvU/MA37w62/0gO/QP2AIPwRev34ZRWrPTJWs4QsbfFgRtHKoHNcv?=
 =?iso-8859-1?Q?qkDyw7t8KY6HbvyPj6912PqQoa/57jnSW7APsKtInxXtkBceJ3wNWK0S37?=
 =?iso-8859-1?Q?Lc0c5oMB+DuJpvLjVY/L3bwVkM17Cd59jWUWamp/ZWvoPSmBz98uRVFmnY?=
 =?iso-8859-1?Q?CbPV9FIKpLn2nyLnNZmpMQ34Retl5XCqLgrBjytFCT2LmhIMVkFoITW2u4?=
 =?iso-8859-1?Q?8JYEU4NbJ6ZnWSlbRh5oV17eAjGkddpgy2Y9hop08M1bpLodo7pKRwrl4P?=
 =?iso-8859-1?Q?rs4/l+Ns8BMbjmTU3SNb1ih51HZkyixy0qwoSC7LLOtxSMd6Nc+0X55f5u?=
 =?iso-8859-1?Q?ujNrtkZDsq5d3I+Cz6TCGhs32NiZ3vVsdp64yIzfrCM+ffqlan53swC5gH?=
 =?iso-8859-1?Q?Sr3syw0YAYXGQjgzc6i3NPR71ejwuzi12342Ha7lYkVwKuKs6lTynxoBcM?=
 =?iso-8859-1?Q?T3Mn1dE/lJ5SNGSFdyYO7iqtYk5WtL3bAa/MxMgQs3j6f1ou3o2iLODgZ3?=
 =?iso-8859-1?Q?olljC2mlUBkuMEbpuURfT/mbj2aqSWT1F6dJ380VB18IFpRe3SbE6bTgqv?=
 =?iso-8859-1?Q?ZvVZZbwOQSGV9uW2yIqGOl5IxeAdMSooOQABjDWG3if3BD7EzGGPRyTqdf?=
 =?iso-8859-1?Q?e3Gn4ezKalN4lGHfxC3KPct/ZmpMt5Um9BBKk0mxttR/tzX+0geGOKl3YK?=
 =?iso-8859-1?Q?KhXtlOKuMe4J5enZ10XS12D+leASBRKWMwUeluYph8x4adtuZig6vvnqLc?=
 =?iso-8859-1?Q?0ubzSd22ioSMtGR5D4FrLxP4KtO8uRXbRgiHsWkLLGXOx7/L/gBsRDQi8Z?=
 =?iso-8859-1?Q?UPJ+CIaYt5z8pTCvJFa5a89xeTdFJ7L+31MBa20iwBc0DlpKsyUxjnj2gA?=
 =?iso-8859-1?Q?BMV1Cn9SJ7w+Q26nCnulTJdStpb3a5NpOlyILIK+No8PoW7tDSt9JqT/NP?=
 =?iso-8859-1?Q?rPaXR+6e1jhoeCh+DgoV2PDJrUso/XSSmHqWj46iYv9hauu1LSyDzFeCje?=
 =?iso-8859-1?Q?NjaY0PJ6vAwaQerCollDv5YxgZgBMNfspJjK6xgqje17hk0VLJ74BjQm8/?=
 =?iso-8859-1?Q?s9vsEvgQ4Qut6odrMvQlGSy+2zTqI93hP/bZS945aVNJH148noSxEbzUvm?=
 =?iso-8859-1?Q?67Pfv/ui74W+Ore73Ksf4l3A9omwJlY/GRyHBEBFb84ujOxAhnzcqpSEZ+?=
 =?iso-8859-1?Q?Z0f1a2fay/60wFF6ivAS93iBl/3lsAEQiSum4LKBlSsnnu4C9Xuh+eMw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 326ec6c1-ef82-43c4-2495-08daf3fca7de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 17:52:50.1414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pey8X42jbUjf/0bZ65t6UsEFAVL/r5W5j6Z1m4hTSHrLUKXR6Mne+ASidD6HkqJvKvKqmwv6TdoqggRuvA6IDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6847
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
Cc: intel-gfx@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 09:09:45AM +0000, Tvrtko Ursulin wrote:
> 
> On 11/01/2023 01:13, Matthew Brost wrote:
> > On Tue, Jan 10, 2023 at 04:39:00PM +0000, Matthew Brost wrote:
> > > On Tue, Jan 10, 2023 at 11:28:08AM +0000, Tvrtko Ursulin wrote:
> > > > 
> > > > 
> > > > On 09/01/2023 17:27, Jason Ekstrand wrote:
> > > > 
> > > > [snip]
> > > > 
> > > > >       >>> AFAICT it proposes to have 1:1 between *userspace* created
> > > > >      contexts (per
> > > > >       >>> context _and_ engine) and drm_sched. I am not sure avoiding
> > > > >      invasive changes
> > > > >       >>> to the shared code is in the spirit of the overall idea and instead
> > > > >       >>> opportunity should be used to look at way to refactor/improve
> > > > >      drm_sched.
> > > > > 
> > > > > 
> > > > > Maybe?  I'm not convinced that what Xe is doing is an abuse at all or
> > > > > really needs to drive a re-factor.  (More on that later.)  There's only
> > > > > one real issue which is that it fires off potentially a lot of kthreads.
> > > > > Even that's not that bad given that kthreads are pretty light and you're
> > > > > not likely to have more kthreads than userspace threads which are much
> > > > > heavier.  Not ideal, but not the end of the world either.  Definitely
> > > > > something we can/should optimize but if we went through with Xe without
> > > > > this patch, it would probably be mostly ok.
> > > > > 
> > > > >       >> Yes, it is 1:1 *userspace* engines and drm_sched.
> > > > >       >>
> > > > >       >> I'm not really prepared to make large changes to DRM scheduler
> > > > >      at the
> > > > >       >> moment for Xe as they are not really required nor does Boris
> > > > >      seem they
> > > > >       >> will be required for his work either. I am interested to see
> > > > >      what Boris
> > > > >       >> comes up with.
> > > > >       >>
> > > > >       >>> Even on the low level, the idea to replace drm_sched threads
> > > > >      with workers
> > > > >       >>> has a few problems.
> > > > >       >>>
> > > > >       >>> To start with, the pattern of:
> > > > >       >>>
> > > > >       >>>    while (not_stopped) {
> > > > >       >>>     keep picking jobs
> > > > >       >>>    }
> > > > >       >>>
> > > > >       >>> Feels fundamentally in disagreement with workers (while
> > > > >      obviously fits
> > > > >       >>> perfectly with the current kthread design).
> > > > >       >>
> > > > >       >> The while loop breaks and worker exists if no jobs are ready.
> > > > > 
> > > > > 
> > > > > I'm not very familiar with workqueues. What are you saying would fit
> > > > > better? One scheduling job per work item rather than one big work item
> > > > > which handles all available jobs?
> > > > 
> > > > Yes and no, it indeed IMO does not fit to have a work item which is
> > > > potentially unbound in runtime. But it is a bit moot conceptual mismatch
> > > > because it is a worst case / theoretical, and I think due more fundamental
> > > > concerns.
> > > > 
> > > > If we have to go back to the low level side of things, I've picked this
> > > > random spot to consolidate what I have already mentioned and perhaps expand.
> > > > 
> > > > To start with, let me pull out some thoughts from workqueue.rst:
> > > > 
> > > > """
> > > > Generally, work items are not expected to hog a CPU and consume many cycles.
> > > > That means maintaining just enough concurrency to prevent work processing
> > > > from stalling should be optimal.
> > > > """
> > > > 
> > > > For unbound queues:
> > > > """
> > > > The responsibility of regulating concurrency level is on the users.
> > > > """
> > > > 
> > > > Given the unbound queues will be spawned on demand to service all queued
> > > > work items (more interesting when mixing up with the system_unbound_wq), in
> > > > the proposed design the number of instantiated worker threads does not
> > > > correspond to the number of user threads (as you have elsewhere stated), but
> > > > pessimistically to the number of active user contexts. That is the number
> > > > which drives the maximum number of not-runnable jobs that can become
> > > > runnable at once, and hence spawn that many work items, and in turn unbound
> > > > worker threads.
> > > > 
> > > > Several problems there.
> > > > 
> > > > It is fundamentally pointless to have potentially that many more threads
> > > > than the number of CPU cores - it simply creates a scheduling storm.
> > > > 
> > > 
> > > We can use a different work queue if this is an issue, have a FIXME
> > > which indicates we should allow the user to pass in the work queue.
> > > 
> > > > Unbound workers have no CPU / cache locality either and no connection with
> > > > the CPU scheduler to optimize scheduling patterns. This may matter either on
> > > > large systems or on small ones. Whereas the current design allows for
> > > > scheduler to notice userspace CPU thread keeps waking up the same drm
> > > > scheduler kernel thread, and so it can keep them on the same CPU, the
> > > > unbound workers lose that ability and so 2nd CPU might be getting woken up
> > > > from low sleep for every submission.
> > > > 
> > > 
> > > I guess I don't understand kthread vs. workqueue scheduling internals.
> > 
> > Looked into this and we are not using unbound workers rather we are just
> > using the system_wq which is indeed bound. Again we can change this so a
> > user can just pass in worker too. After doing a of research bound
> > workers allows the scheduler to use locality too avoid that exact
> > problem your reading.
> > 
> > TL;DR I'm not buying any of these arguments although it is possible I am
> > missing something.
> 
> Well you told me it's using unbound.. message id
> Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com:
> 
> """
> Right now the system_unbound_wq is used which does have a limit on the
> number of threads, right? I do have a FIXME to allow a worker to be
> passed in similar to TDR.
> """
> 

Yea, my mistake. A quick look at the shows we are using system_wq (same
as TDR).

> With bound workers you will indeed get CPU locality. I am not sure what it
> will do in terms of concurrency. If it will serialize work items to fewer
> spawned workers that will be good for the CT contention issue, but may
> negatively affect latency. And possibly preemption / time slicing decisions
> since the order of submitting to the backend will not be in the order of
> context priority, hence high prio may be submitted right after low and
> immediately trigger preemption.
>

We should probably use system_highpri_wq for high priority contexts
(xe_engine).
 
> Anyway, since you are not buying any arguments on paper perhaps you are more
> open towards testing. If you would adapt gem_wsim for Xe you would be able
> to spawn N simulated transcode sessions on any Gen11+ machine and try it
> out.
> 
> For example:
> 
> gem_wsim -w benchmarks/wsim/media_load_balance_fhd26u7.wsim -c 36 -r 600
> 
> That will run you 36 parallel transcoding sessions streams for 600 frames
> each. No client setup needed whatsoever apart from compiling IGT.
> 
> In the past that was quite a handy tool to identify scheduling issues, or
> validate changes against. All workloads with the media prefix have actually
> been hand crafted by looking at what real media pipelines do with real data.
> Few years back at least.
> 

Porting this is non-trivial as this is 2.5k. Also in Xe we are trending
to use UMD benchmarks to determine if there are performance problems as
in the i915 we had tons microbenchmarks / IGT benchmarks that we found
meant absolutely nothing. Can't say if this benchmark falls into that
category.

We VK and compute benchmarks running and haven't found any major issues
yet. The media UMD hasn't been ported because of the VM bind dependency
so I can't say if there are any issues with the media UMD + Xe.

What I can do hack up xe_exec_threads to really hammer Xe - change it to
128x xe_engines + 8k execs per thread. Each exec is super simple, it
just stores a dword. It creates a thread per hardware engine, so on TGL
this is 5x threads.

Results below:
root@DUT025-TGLU:mbrost# xe_exec_threads --r threads-basic
IGT-Version: 1.26-ge26de4b2 (x86_64) (Linux: 6.1.0-rc1-xe+ x86_64)
Starting subtest: threads-basic
Subtest threads-basic: SUCCESS (1.215s)
root@DUT025-TGLU:mbrost# dumptrace | grep job | wc
  40960  491520 7401728
root@DUT025-TGLU:mbrost# dumptrace | grep engine | wc
    645    7095   82457

So with 640 xe_engines (5x are VM engines) it takes 1.215 seconds test
time to run 40960 execs. That seems to indicate we do not have a
scheduling problem.

This is 8 core (or at least 8 threads) TGL:

root@DUT025-TGLU:mbrost# cat /proc/cpuinfo
...
processor       : 7
vendor_id       : GenuineIntel
cpu family      : 6
model           : 140
model name      : 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GHz
stepping        : 1
microcode       : 0x3a
cpu MHz         : 2344.098
cache size      : 12288 KB
physical id     : 0
siblings        : 8
core id         : 3
cpu cores       : 4
...

Enough data to be convinced there is not issue with this design? I can
also hack up Xe to use less GPU schedulers /w a kthreads but again that
isn't trivial and doesn't seem necessary based on these results.

> It could show you real world behaviour of the kworkers approach and it could
> also enable you to cross reference any power and performance changes
> relative to i915. Background story there is that media servers like to fit N
> streams to a server and if a change comes along which suddenly makes only
> N-1 stream fit before dropping out of realtime, that's a big problem.
> 
> If you will believe me there is value in that kind of testing I am happy to
> help you add Xe support to the tool, time permitting so possibly guidance
> only at the moment.

If we want to port the tool I wont stop you and provide support if you
struggle with the uAPI but based on my results above I don't think this
is necessary.

Matt

> 
> Regards,
> 
> Tvrtko
