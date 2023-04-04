Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8C6D6E49
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5861C10E7A6;
	Tue,  4 Apr 2023 20:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8983710E797;
 Tue,  4 Apr 2023 20:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680641225; x=1712177225;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l37yOOTKQc/sN4H4ueBqPIuTjBlDxl2ae/a3hQOYaBI=;
 b=jk1k9Kh+KoABen4hFEwxoxUj7RuHRG0UQe8p1uMKUFYRbnsKR8wCQ9/H
 3W2B0HMclYlMuLNwLmPktcKd65mzTyQE0kd3IGJfSI19306EpDAxdhyA2
 6ZElv7r/OqwS2z0wZRWMSgJSmytuX2D6+/kgbG3M71/gWXNGE5XWc/8WL
 tv73V0r3nYzaEVPOqffjAalBfIDFIMZA5Dsq010fkUj6tG+xeftPeGUX7
 Jswpq/yH9NINdVzFT6HqhDrzNlzvY45i7iu/5ghiB960GVGfXiO9URfPj
 onCyKBDfTfzNh+5iuPtuhixSeTmoizln1GyodWsVly5blenc1kYM49Qan Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="339793006"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="339793006"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932576776"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="932576776"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 04 Apr 2023 13:47:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 13:47:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 13:47:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 13:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMQ/Z6HcoEjUx+BkSPOHBN9czz8sXRvPqS8tmgqYyXOsCpO9tv0Mm8JYLVso+PsjFn/Ki8SCQ7RQYjoDIyKZteClDjmKLlDzYVkRqEcC875mGesx0bvzASiw1PkpW7Qmk/Xj7nqtcjkY2YvL1HSdgCumxqV+9okep1Co75PrFhGrmsJnj0BQY6aiP3siXPpjWDgf4hwbHnV4nnGjArdI1EeMFlnAiUQc5sjJq8HdX0lroYXFwLScY366Qutt9MLoUiycwU8h7t1rFUyIbxNbB+Zee0uYnuepMRczDouTq2QSE3kioDT0RLDW+HpT8AF7uKWNS4vCMvEjOZhn40JOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ycd6zdebEn8DFtpa/6IuSo9ZY1+kStKrmNta+BNUa+k=;
 b=k4DQKqppEzFULF0RmdURABTVJHdfYu6e1WxlpFJRyLD+j7lHxN98pJ/DUtbBYQ3DtngJM2nVqteHV/ovEb1DhDdrhgXrdVpiPj7Id1Pc7x0g5OFb6PZHwy6TEUjav0X1XeUi2bJlJ13AFNCa5o+3XRer7Jlb9Ci8bjZjapaxwmiY7N+FUm6QVQI4azC7Ee3NpN4qDNaD5SjtL4flDlu6VZws0aKPq5eixuy8B+vNGrWKQfxubLvaR57E8ERLCTwSLrsiEVftYxRIhE9yjOVgQyOyMwo8RxY3LjQxeleGordwUpy/IFHy9B/ntUc7De9WdTHu1lA+4ExSoq6Xp4SiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 20:47:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 20:47:00 +0000
Date: Tue, 4 Apr 2023 20:46:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZCyMv0odIYcpFyGr@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <CAKMK7uGeBJRQ4dKfY=wRvw-o7qdzurFHzUymxGsLWr4Y_nQPAA@mail.gmail.com>
 <ZCyCpyFmteD0uZ3v@DUT025-TGLU.fm.intel.com>
 <CAKMK7uG7C9or+L4sS1e7u14wbXt2=0-wGnLxjZ3uSGvM7-Vd4g@mail.gmail.com>
 <ZCyGWXmQ7q2ZMtID@DUT025-TGLU.fm.intel.com>
 <ZCyJPvlH3U4lho6l@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCyJPvlH3U4lho6l@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3b95d8-c88c-4c76-0cd1-08db354dbcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/FNOm5Ov1NNjVZof4kOEjz2vamqIbWXhUb2jQlBOMm1ONwVglIV+0HNOHM/06ahTy2Fqaju0bDy3T5PQREtpsubNdnYysiEPiX9/94WcvnRaHDQOY5eQm5lJeX7dQQaDm4bUMMHJM9eJsQFsQKfO2s3zVcN9Fa3w6hK/55fAimXfxsL2scfPRWyD0rSi5LPeQKXL99HGFpVtTaSC+INWnG4iCSclCyp++FlycRTCRajKrzjd4Vtu1wzTHR+Z23RSmTWbBTyUgGEPkoMu7IvKW4aEbouXvv+eWjXME95mefADbNb2sXy9jet4ctQBZKVrUzGAN3r/EQgpnDKMRZ7bmy3BBWPCyMIifZWON68KHHvIXaz/Z1tCVXiKG6q20GnkMYQtplE7nGjbUtE0eoasgj423sVZD4mP1SD/vc67/NgmrR/x8TZjGKjL2EsRfmPuic4r4RP0pFOAR0FPcsGoK4SEdwpDlh/7ySGJ8/iqJmHoxfjDnqLtXdxtAJb/yKJ1meRWaAfRJj374QxzgouUwLdieljOWq2EweJFjoleKc/Tia4mzlxP5Iqwe01bV0Xt7gUgTBvA1YxO0+2v0WFkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199021)(4326008)(66946007)(6916009)(44832011)(54906003)(316002)(66476007)(66556008)(8676002)(478600001)(7416002)(8936002)(5660300002)(2906002)(53546011)(966005)(186003)(6506007)(6512007)(26005)(41300700001)(6486002)(6666004)(83380400001)(66574015)(82960400001)(66899021)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3j4i53xdsmellbNVwUVz+F7931hLRL/Lmq8FfClYa9EyisCVZXLmc2QCn9?=
 =?iso-8859-1?Q?7s6p2owpUa4tBKy9e1Xdg+CccX8Y0rSTKi2PVbKLd7SUJFWC5nS4Yk4im+?=
 =?iso-8859-1?Q?qJ1hCa32ADW8Y9Gh6F87MsM3HT1vFNtOxIzp7J/QhWnFpwB6Vyqcp5AFtV?=
 =?iso-8859-1?Q?Rtp/0dJfwnwitaXPhsyJoDHsZDqzX0EYSMmLC83ccQUPy+lwf8JfF86BqM?=
 =?iso-8859-1?Q?z1/vCB0zFcLFgbLRS2e8UJw6/pjR4rrEtm1KKhtWraefVzTmVxsKEg1oEF?=
 =?iso-8859-1?Q?DBGE3ReFK/crzPwsLNfX9QP8o7dCfO3PlXbPnZo7zv4CNbRr56LIPbBUhl?=
 =?iso-8859-1?Q?LtBi13IF1QsHvz4UEZMyp0o7NL/wcc14cAJTEq7dM2F7MLZnR8pC3R3ZyA?=
 =?iso-8859-1?Q?/dMPiQVR1k2Qab1sKeRCnvmMEIOdAUoPkqXhqNn03uELXxU+nA2bOa9cN9?=
 =?iso-8859-1?Q?DqMDWoQ2N8zOORrvRIEKI1p9orzQBLgxgHAb9JGFISg1e/0hithEb7LdX9?=
 =?iso-8859-1?Q?NN1VdAWkaKYWTFHqdDIwBViqhqP2peNstopy/mOM+NIQce0G80bt2sSKhf?=
 =?iso-8859-1?Q?bkPXOgwwuVH2e2+zHBITCi1vllzIphJJsmtWo7WzcNBfxnOh9ZN1xbj11m?=
 =?iso-8859-1?Q?q5kOzDga0pFS/ulhyZWY4j9FSxZ2y7C3t8twuhvoB8faQqcV3uT4FXj2Ep?=
 =?iso-8859-1?Q?tmeuljFeXdOVNOm1cZB5fgBj8D+w9JLZ5li5n0UwOxDirdUdQwjxITaScI?=
 =?iso-8859-1?Q?N/uGWYj87DGRX4C3RrPdeOhX+cXh0iCH3S5roD8v6var500ORXN3Lg1dDn?=
 =?iso-8859-1?Q?etrzSmDtMmzPs1w/eT1tVugx0bk8YTT5Pujn3UagO17t9Hs3Umt2MxzPvc?=
 =?iso-8859-1?Q?8ZERU7nQ/1u1KZn57mQkaVGxfBsxDlir+96yHEgR7X/z74JMKAke1XyVj7?=
 =?iso-8859-1?Q?6Yfe2x8KkvQ7lB4El5ILuPOWgWnyRyZk24rre0e2wb01yWm83aiYwzF4Ae?=
 =?iso-8859-1?Q?UgDX3Q6W07JzsuV+hZ9gtNjY0YOK4Red8rFEnF0zfpD9KudP7fAG1YfRnn?=
 =?iso-8859-1?Q?DPoN8jivtPKbcRm5IdmNUDXIjmVMaujzhp1IgYx0LjxBc6lP7MQLahJsZS?=
 =?iso-8859-1?Q?oesNsDNJvBShfhcWo+pVtIvZpdExSEYcVMTHN0fJxgm9gi4ortkRWLlY1T?=
 =?iso-8859-1?Q?wd4xu3EtG3ft8+sDj0pp8ZdbxC63e1A8URBhRmpHHnzIR5XG5tyBcmMYXw?=
 =?iso-8859-1?Q?VI8RxbTJbzV3cTLj2STAypAd8/Zx/jYzE+qXhBIGjVHrne1+P1B3m7/wwP?=
 =?iso-8859-1?Q?t4uguWT6JITMVEzr/tcaQnXuOjMi2GqiUWYAebwlhqIb7s1kzBJL5dUBR6?=
 =?iso-8859-1?Q?/IRQXMxEAHmAgupl5eTlDTO6Yjw8scLTk+GQzVwCD2xEAo6vQsc1sMWQr2?=
 =?iso-8859-1?Q?FUp2UHQ+mBGwIyPtgSeBO+jxGdA4uA/mcbgFqcr/fufBTTqegFFCpxLxnV?=
 =?iso-8859-1?Q?vvow8uEdvF0YIrzhMY9P4FaTTzzSx22WGRvkLnphX99PimC75fi9W2uJt5?=
 =?iso-8859-1?Q?l5Yiqp5rF63Wdc4q+val1DsruZMtQ35z4sQqFyWoW4npjqWjY/EisYIkv+?=
 =?iso-8859-1?Q?pFoApDkS1kd3m5OCAarEgBfvhQDaIlMsU3sP/SI2z/SlL1Q0atudh0YA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3b95d8-c88c-4c76-0cd1-08db354dbcfa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 20:47:00.4156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BJFoVYR0294TlBOC33yYG0y3FPfp+aZRVQ2IWyibQDaEfHdxsDUwZNBEVnI63mvh7W5rN9x9AaWX1Y5d0saCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
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
Cc: robdclark@chromium.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 10:31:58PM +0200, Daniel Vetter wrote:
> On Tue, Apr 04, 2023 at 08:19:37PM +0000, Matthew Brost wrote:
> > On Tue, Apr 04, 2023 at 10:11:59PM +0200, Daniel Vetter wrote:
> > > On Tue, 4 Apr 2023 at 22:04, Matthew Brost <matthew.brost@intel.com> wrote:
> > > >
> > > > On Tue, Apr 04, 2023 at 09:00:59PM +0200, Daniel Vetter wrote:
> > > > > On Tue, 4 Apr 2023 at 15:10, Christian König <christian.koenig@amd.com> wrote:
> > > > > >
> > > > > > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > > > > > Hi, Christian,
> > > > > > >
> > > > > > > On 4/4/23 11:09, Christian König wrote:
> > > > > > >> Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > > >>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > >>>
> > > > > > >>> For long-running workloads, drivers either need to open-code completion
> > > > > > >>> waits, invent their own synchronization primitives or internally use
> > > > > > >>> dma-fences that do not obey the cross-driver dma-fence protocol, but
> > > > > > >>> without any lockdep annotation all these approaches are error prone.
> > > > > > >>>
> > > > > > >>> So since for example the drm scheduler uses dma-fences it is
> > > > > > >>> desirable for
> > > > > > >>> a driver to be able to use it for throttling and error handling also
> > > > > > >>> with
> > > > > > >>> internal dma-fences tha do not obey the cros-driver dma-fence protocol.
> > > > > > >>>
> > > > > > >>> Introduce long-running completion fences in form of dma-fences, and add
> > > > > > >>> lockdep annotation for them. In particular:
> > > > > > >>>
> > > > > > >>> * Do not allow waiting under any memory management locks.
> > > > > > >>> * Do not allow to attach them to a dma-resv object.
> > > > > > >>> * Introduce a new interface for adding callbacks making the helper
> > > > > > >>> adding
> > > > > > >>>    a callback sign off on that it is aware that the dma-fence may not
> > > > > > >>>    complete anytime soon. Typically this will be the scheduler chaining
> > > > > > >>>    a new long-running fence on another one.
> > > > > > >>
> > > > > > >> Well that's pretty much what I tried before:
> > > > > > >> https://lwn.net/Articles/893704/
> > > > > > >>
> > > > > > >> And the reasons why it was rejected haven't changed.
> > > > > > >>
> > > > > > >> Regards,
> > > > > > >> Christian.
> > > > > > >>
> > > > > > > Yes, TBH this was mostly to get discussion going how we'd best tackle
> > > > > > > this problem while being able to reuse the scheduler for long-running
> > > > > > > workloads.
> > > > > > >
> > > > > > > I couldn't see any clear decision on your series, though, but one main
> > > > > > > difference I see is that this is intended for driver-internal use
> > > > > > > only. (I'm counting using the drm_scheduler as a helper for
> > > > > > > driver-private use). This is by no means a way to try tackle the
> > > > > > > indefinite fence problem.
> > > > > >
> > > > > > Well this was just my latest try to tackle this, but essentially the
> > > > > > problems are the same as with your approach: When we express such
> > > > > > operations as dma_fence there is always the change that we leak that
> > > > > > somewhere.
> > > > > >
> > > > > > My approach of adding a flag noting that this operation is dangerous and
> > > > > > can't be synced with something memory management depends on tried to
> > > > > > contain this as much as possible, but Daniel still pretty clearly
> > > > > > rejected it (for good reasons I think).
> > > > >
> > > > > Yeah I still don't like dma_fence that somehow have totally different
> > > > > semantics in that critical piece of "will it complete or will it
> > > > > deadlock?" :-)
> > > >
> > > > Not going to touch LR dma-fences in this reply, I think we can continue
> > > > the LR fence discussion of the fork of this thread I just responded to.
> > > > Have a response the preempt fence discussion below.
> > > >
> > > > > >
> > > > > > >
> > > > > > > We could ofc invent a completely different data-type that abstracts
> > > > > > > the synchronization the scheduler needs in the long-running case, or
> > > > > > > each driver could hack something up, like sleeping in the
> > > > > > > prepare_job() or run_job() callback for throttling, but those waits
> > > > > > > should still be annotated in one way or annotated one way or another
> > > > > > > (and probably in a similar way across drivers) to make sure we don't
> > > > > > > do anything bad.
> > > > > > >
> > > > > > >  So any suggestions as to what would be the better solution here would
> > > > > > > be appreciated.
> > > > > >
> > > > > > Mhm, do we really the the GPU scheduler for that?
> > > > > >
> > > > > > I mean in the 1 to 1 case  you basically just need a component which
> > > > > > collects the dependencies as dma_fence and if all of them are fulfilled
> > > > > > schedules a work item.
> > > > > >
> > > > > > As long as the work item itself doesn't produce a dma_fence it can then
> > > > > > still just wait for other none dma_fence dependencies.
> > > > >
> > > > > Yeah that's the important thing, for long-running jobs dependencies as
> > > > > dma_fence should be totally fine. You're just not allowed to have any
> > > > > outgoing dma_fences at all (except the magic preemption fence).
> > > > >
> > > > > > Then the work function could submit the work and wait for the result.
> > > > > >
> > > > > > The work item would then pretty much represent what you want, you can
> > > > > > wait for it to finish and pass it along as long running dependency.
> > > > > >
> > > > > > Maybe give it a funky name and wrap it up in a structure, but that's
> > > > > > basically it.
> > > > >
> > > > > Like do we need this? If the kernel ever waits for a long-running
> > > > > compute job to finnish I'd call that a bug. Any functional
> > > > > dependencies between engines or whatever are userspace's problem only,
> > > > > which it needs to sort out using userspace memory fences.
> > > > >
> > > > > The only things the kernel needs are some way to track dependencies as
> > > > > dma_fence (because memory management move the memory away and we need
> > > > > to move it back in, ideally pipelined). And it needs the special
> > > > > preempt fence (if we don't have pagefaults) so that you have a fence
> > > > > to attach to all the dma_resv for memory management purposes. Now the
> > > > > scheduler already has almost all the pieces (at least if we assume
> > > > > there's some magic fw which time-slices these contexts on its own),
> > > > > and we just need a few minimal changes:
> > > > > - allowing the scheduler to ignore the completion fence and just
> > > > > immediately push the next "job" in if its dependencies are ready
> > > > > - maybe minimal amounts of scaffolding to handle the preemption
> > > > > dma_fence because that's not entirely trivial. I think ideally we'd
> > > > > put that into drm_sched_entity since you can only ever have one active
> > > > > preempt dma_fence per gpu ctx/entity.
> > > > >
> > > >
> > > > Yep, preempt fence is per entity in Xe (xe_engine). We install these
> > > > into the VM and all external BOs mapped in the VM dma-resv slots.
> > > > Wondering if we can make all of this very generic between the DRM
> > > > scheduler + GPUVA...
> > > 
> > > I think if the drm/sched just takes care of the preempt ctx dma_fence
> > > (and still stores it in the same slot in the drm_sched_job struct like
> > > a end-of-batch dma_fence job would), and then the gpuva shared code
> > > just has functions to smash these into the right dma_resv structures
> > > then you have all the pieces. Maybe for a bit more flexibility the
> > > gpuva code takes dma_fence and not directly the drm_sched_job, but
> > > maybe even that level of integration makes sense (but imo optional, a
> > > bit of driver glue code is fine).
> > > 
> > > Yeah that's roughly what I think we should at least aim for since
> > > there's quiet a few drivers in-flight that all need these pieces (more
> > > or less at least).
> > 
> > That is very close to what I'm thinking too, we want to tackle userptr +
> > GPUVA too, think that will be next but can add this to the list of
> > things to do.
> 
> I discussed userptr+gpuva a bit with Rodrigo (and maybe Thomas H not sure
> anymore) and it sounded a bit like that's maybe a bridge too far. At least
> until we have some other drivers that also need that combo. But can't hurt
> to at least think how it would ideally integrate from xe's pov.
> -Daniel

I spoke with dakr today about on IRC, Nouveua is going to implement
userptr soon. I think the idea would be for Xe and Nouveua to
collaborate on what we stick in GPUVA for userptr + if we have common
DRM helper functions. We may land on something really small (e.g. we
store userpr address with a NULL gem in the gpuva structure) or we might
land on common locking, page population, and MMU notifier? Interested to
see where we land.

Matt

> 
> > 
> > Matt
> > 
> > > -Daniel
> > > >
> > > > Matt
> > > >
> > > > > None of this needs a dma_fence_is_lr anywhere at all.
> > > > >
> > > > > Of course there's the somewhat related issue of "how do we transport
> > > > > these userspace memory fences around from app to compositor", and
> > > > > that's a lot more gnarly. I still don't think dma_fence_is_lr is
> > > > > anywhere near what the solution should look like for that.
> > > > > -Daniel
> > > > >
> > > > >
> > > > > > Regards,
> > > > > > Christian.
> > > > > >
> > > > > > >
> > > > > > > Thanks,
> > > > > > >
> > > > > > > Thomas
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > 
> > > 
> > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
