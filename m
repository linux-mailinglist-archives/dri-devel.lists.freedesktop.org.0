Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75A36D6D88
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB5A10E2D7;
	Tue,  4 Apr 2023 20:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D5110E2D7;
 Tue,  4 Apr 2023 20:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680638647; x=1712174647;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+nIsqZ8VwC5H4xz6oD1WFZMM3FjFc2cILBQmzl0kjaw=;
 b=SLUBbLXH04zEhu1lPrj/S6CkPxi2Im8uuryGXWCsMQKkUGc6h5vbrqZn
 aX8/c6sS9nHKS73LyunaovmvTiOBMDFqrfQhfnJLsTkbOc5OSHJvx4t1N
 O0N0PevY3LDoIiNGY5qqPnO/QptlsVYPAX8z9FeSnFc0IMtf8TfCYL7d7
 XGnh7+Is2VjW07KYxa8xlzCNdBunsqEXe3/dtk6mJwQSR3dOSmmlA5bgq
 qfP5XVmA911d3E048JkF5qXwqkgsX4A6fxTRIZG/FZfLtc+S3J8ZYV3HG
 ebrbsBPPuKY4eCd2MXrqwyc7IR9rOVNUhLmmVlJ8jd8CMFctw7yF98sco Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428576607"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="428576607"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716763473"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="716763473"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 04 Apr 2023 13:04:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 13:03:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 13:03:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 13:03:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 13:03:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwIQMPywAs03JQWBi4OvrU6BlVi5tdZ9885H4uiHz5oL/KOf03CtAr150fuSs2R9+cXP3LMdZt4MXhZDTNBf9kU4j4e57ZAzlMytIw//P3404uqY9WdYaufAyS0O+fniIR8nsY4q8H9yJ0U1sG5yELFV3KPiTDhzqe6/9PhYCjhdTpxNQ6afIUaQAU8yu+lrhiQItG93AbJVUbQ5AWcFm/xmA2b8X6YGbOIETgfW1G6fYPmGfgpT1Oe1XeCjUqPcM5yWhjltQhWbM2Scg4nuF+E8FYW2gG6YXkHdS7GcOzc8DZbtIGFfalpHFj1QRdY9C1OyQYenmKEHaN55GLc/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXNCgsR3duUgEpfyJuvtvLiFDTC7N7f8yI9eScSkUEY=;
 b=D7Cq2VO++NK1BfpU0OuOtfTf3wxVobfKVV8otsmAFgNn3xU0mSPTaAT2kLwHJ9FB06Mq09tGVT995V4CYN0FGAgen2VfZaqBwBrkRFeCu5zcUiO8on8LSBfXywbYuYKrQSFrTXqaI9pqMxnqKVW33oFRK4NeZgztn2L6gWmVo3h/EcjwhrpZgpAa1DDAlTogRofR1V1Wo8ZEmCsjbYkYgjuvFu1ONRlH0flFEVxhRT6qLO5VXvRASxY8kKG/+33ilOTfYzrMGzpWRLsCiAt7ebp1pCO8CgKyVyfaZwatnZdDzReiIMLXBzS1j5jpvZHhdnxzPpkDmzrvCKDxDq/8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6961.namprd11.prod.outlook.com (2603:10b6:930:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 20:03:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 20:03:57 +0000
Date: Tue, 4 Apr 2023 20:03:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZCyCpyFmteD0uZ3v@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <CAKMK7uGeBJRQ4dKfY=wRvw-o7qdzurFHzUymxGsLWr4Y_nQPAA@mail.gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uGeBJRQ4dKfY=wRvw-o7qdzurFHzUymxGsLWr4Y_nQPAA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c130bad-00e0-427a-de92-08db3547b90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lV+KyyEEgTLaV9obPzUqdj5Si/oBO4pPkzG9VIQcXRzaKx/mWBaooWuqEtMujESY9PpXt3zdEOzcMdHLXlJ+6413PKEBi29x+EgKDGV2bWandnMHGqeszlTg0HG/nAHBL7R3L7WiL/eYPgAvTdOYtIWJ6YVniw1hWpyVKbQiuBUZjbwV1sIjLL/4BNFVqeMIjRvH2yzHD1E1EcCHCKPNtvGivSLLurMr6HIfV/3mbpW1CgsixfxHGdQfZrdOV+jUTSPRBcsiV+nUyzdxe2urrD7emXaRSeqEnXISe8U+eP8leYDpzmdQAxBoRnEOJjCry/7teYkoGwpO9mgC4essGONOzzsOR+0+kXt0tgWiqYaL8ndIuPJbYmgIM8KdoIw0n3KdkC370+QgzudlO+aGwyOs45IYZImMCde4Cy60zxXjOI2j0boXcQhGOK3wrbbJn8kbDk6YRw1XP6KrdoWMvlmIyDDiZk5W6bfUGw1Os3h4KuDyUc0FtJZjBWGCjTaaOvDqxmXHhh02nM+szgmMFL3O9aitBAtSYfpuDBgXTnTR7T1Jj8GL7qThBavLSzjR+JMUR5jsiRz+1H5co5sQfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(66899021)(38100700002)(82960400001)(8676002)(44832011)(54906003)(86362001)(316002)(5660300002)(66556008)(66476007)(6916009)(66946007)(4326008)(6666004)(478600001)(41300700001)(8936002)(7416002)(26005)(6506007)(6486002)(966005)(66574015)(53546011)(6512007)(2906002)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IikXqcDnBlZAOh30noU63o/1K/FlPkurtGbONrD2zxLfLYb+XDRoonykYM?=
 =?iso-8859-1?Q?A0Ul87CRZRd9nqbeAMbc19G55HWkEQZRWk2uJH3h0gkqcoIiFANMHLo9AV?=
 =?iso-8859-1?Q?2Sctb36ABogRvkoV6bpdId/njVbyQiyWIL9SHFTT8WZ6ErXixgGh+Z7K/Z?=
 =?iso-8859-1?Q?PddQsMmbiMLZX7HFV/tH2/7+YcC0M3lGcOq2+KOVEtc6RCy3ellvntwSeA?=
 =?iso-8859-1?Q?M6jcDdxGU36ykwx1jFS2wI23xu/4ilbtAmULGko0WCHaLBCzLybh283lwr?=
 =?iso-8859-1?Q?tg/hC0XEIjJ3pJFGsgEqiU5etA+tQ8Ovbxt+hlvj99u2PIsxaxO70h11aK?=
 =?iso-8859-1?Q?QNNEmQX6ZDyP4bddqptGcnZrO7WL43MFsmM9jUviUmBmdrnNL+xOXaCtI1?=
 =?iso-8859-1?Q?9GPsnVQgJGznexVgzDQiuAlfRokms0NYfQBSN/A+bZk7nJQ2wLYEtw6UvH?=
 =?iso-8859-1?Q?YOFlp5kkofCQd/5/7kGgSXKG+ytEOKed0JPK09ACtqDayCq3u+nLLd1/90?=
 =?iso-8859-1?Q?kPUIelki9rYP3W8w4Dx/JhgyVTUjnOmwAZH4LrsB0MDyLRv+IyLSXhWwmR?=
 =?iso-8859-1?Q?cvYu1Ar6a2HgVv9bVZea5NmQaDfVv9ubme/G031ij0cYZ43HuRR5MFmqVG?=
 =?iso-8859-1?Q?NviAbAFm+h8nWJbTV5k5orb/+2SBKP02v3A6do31QqDB9wXJq7FIfDBeTl?=
 =?iso-8859-1?Q?2hmir+Nlnu5Qfn5gzwPYs07OfvMqDlrMah8ySG11p9FiQjhBF2vcYaOwV2?=
 =?iso-8859-1?Q?qZmGUr5Os7wLoo9uDXL37Y/EtGT43XSyXZCj1qH4Ien2WFEaeSVJAhyu+m?=
 =?iso-8859-1?Q?7AVI1gvf0oYyae0XuBMYoD5aEKnSDvsIzDX3jURQp3Hx9NF48FiJMaw6P0?=
 =?iso-8859-1?Q?T1rZ07Xjf3Od94r/Z+sbqG/iZgx2xjbCL8Jy2aDSRjo8xrrvLdgzML7x4i?=
 =?iso-8859-1?Q?lZynWOFM6FGik1p6fYHczWcEcm2WJMrY0f4HAm2D21lK7okDbYO7vknJU+?=
 =?iso-8859-1?Q?udg3OXl4ao0S8At6UdRwC5cRrX6XJw7d4GIoaMRMj+Bwa5gQmNGrxTHoR4?=
 =?iso-8859-1?Q?5lXElSoKzcLfYYFdR9v6/veZzpJGrLxj3tHBFmI1vYALi16fmhgonr1LL0?=
 =?iso-8859-1?Q?GB94xsGz/psK8CLUCy9HXfxXqmWgfUSuMWVCsNTcy2N3jBiRsXQZ0E8VGp?=
 =?iso-8859-1?Q?THljUSRMtpN6hkbWQUGniz2YJFqnrT/B/J1PRxKLPs7dUog5O57bqk5/0y?=
 =?iso-8859-1?Q?Y/VJaJ3MV0ciFZe/DqOrrSRDy+rUGlSeJNsg4v9s0xmu9lUDtwPU9q/yT7?=
 =?iso-8859-1?Q?YhNNSwHYCmRWzCa4CtJiDlWXlePG/qa5+LL8bn4JT7dOsNqkM6F2UcaQP1?=
 =?iso-8859-1?Q?PR1nkqVT5krrMI1TZaBVWcuB8Z+2OU5kQw5YR9V62x2jDQfVk0BBrEz5wF?=
 =?iso-8859-1?Q?mlSOcnDm+F5jBGDbGIUS8B8idoXlf/Ntx/Kl6dqi/LGQsBuB+dOmsog8R5?=
 =?iso-8859-1?Q?hfeZO8UNM2yCKujjyqi+zp9MkNWNVWuMOLQ4vu7hcA/QFAtVBiMz01wtCC?=
 =?iso-8859-1?Q?O50hcd0MqbELuCC2ya/Te8ufz0a8GR91Iwqa67TXrvn4qnOfMkn7L0pi4B?=
 =?iso-8859-1?Q?8qeuyzeXgkkd8bBbKCa3zLo9o8yrFk/yc7iup+kGO0CqhWUu0XMICY2A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c130bad-00e0-427a-de92-08db3547b90b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 20:03:56.8218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAdAmWnfNnS+5ZZLMc58suU55YD+aS4uyx5eOsDFvvh236zGtL/PUFrl4wiqH9HE8Lqnqy4Ebff9SBzUuLnu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6961
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

On Tue, Apr 04, 2023 at 09:00:59PM +0200, Daniel Vetter wrote:
> On Tue, 4 Apr 2023 at 15:10, Christian König <christian.koenig@amd.com> wrote:
> >
> > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > Hi, Christian,
> > >
> > > On 4/4/23 11:09, Christian König wrote:
> > >> Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > >>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > >>>
> > >>> For long-running workloads, drivers either need to open-code completion
> > >>> waits, invent their own synchronization primitives or internally use
> > >>> dma-fences that do not obey the cross-driver dma-fence protocol, but
> > >>> without any lockdep annotation all these approaches are error prone.
> > >>>
> > >>> So since for example the drm scheduler uses dma-fences it is
> > >>> desirable for
> > >>> a driver to be able to use it for throttling and error handling also
> > >>> with
> > >>> internal dma-fences tha do not obey the cros-driver dma-fence protocol.
> > >>>
> > >>> Introduce long-running completion fences in form of dma-fences, and add
> > >>> lockdep annotation for them. In particular:
> > >>>
> > >>> * Do not allow waiting under any memory management locks.
> > >>> * Do not allow to attach them to a dma-resv object.
> > >>> * Introduce a new interface for adding callbacks making the helper
> > >>> adding
> > >>>    a callback sign off on that it is aware that the dma-fence may not
> > >>>    complete anytime soon. Typically this will be the scheduler chaining
> > >>>    a new long-running fence on another one.
> > >>
> > >> Well that's pretty much what I tried before:
> > >> https://lwn.net/Articles/893704/
> > >>
> > >> And the reasons why it was rejected haven't changed.
> > >>
> > >> Regards,
> > >> Christian.
> > >>
> > > Yes, TBH this was mostly to get discussion going how we'd best tackle
> > > this problem while being able to reuse the scheduler for long-running
> > > workloads.
> > >
> > > I couldn't see any clear decision on your series, though, but one main
> > > difference I see is that this is intended for driver-internal use
> > > only. (I'm counting using the drm_scheduler as a helper for
> > > driver-private use). This is by no means a way to try tackle the
> > > indefinite fence problem.
> >
> > Well this was just my latest try to tackle this, but essentially the
> > problems are the same as with your approach: When we express such
> > operations as dma_fence there is always the change that we leak that
> > somewhere.
> >
> > My approach of adding a flag noting that this operation is dangerous and
> > can't be synced with something memory management depends on tried to
> > contain this as much as possible, but Daniel still pretty clearly
> > rejected it (for good reasons I think).
> 
> Yeah I still don't like dma_fence that somehow have totally different
> semantics in that critical piece of "will it complete or will it
> deadlock?" :-)

Not going to touch LR dma-fences in this reply, I think we can continue
the LR fence discussion of the fork of this thread I just responded to.
Have a response the preempt fence discussion below.

> >
> > >
> > > We could ofc invent a completely different data-type that abstracts
> > > the synchronization the scheduler needs in the long-running case, or
> > > each driver could hack something up, like sleeping in the
> > > prepare_job() or run_job() callback for throttling, but those waits
> > > should still be annotated in one way or annotated one way or another
> > > (and probably in a similar way across drivers) to make sure we don't
> > > do anything bad.
> > >
> > >  So any suggestions as to what would be the better solution here would
> > > be appreciated.
> >
> > Mhm, do we really the the GPU scheduler for that?
> >
> > I mean in the 1 to 1 case  you basically just need a component which
> > collects the dependencies as dma_fence and if all of them are fulfilled
> > schedules a work item.
> >
> > As long as the work item itself doesn't produce a dma_fence it can then
> > still just wait for other none dma_fence dependencies.
> 
> Yeah that's the important thing, for long-running jobs dependencies as
> dma_fence should be totally fine. You're just not allowed to have any
> outgoing dma_fences at all (except the magic preemption fence).
> 
> > Then the work function could submit the work and wait for the result.
> >
> > The work item would then pretty much represent what you want, you can
> > wait for it to finish and pass it along as long running dependency.
> >
> > Maybe give it a funky name and wrap it up in a structure, but that's
> > basically it.
> 
> Like do we need this? If the kernel ever waits for a long-running
> compute job to finnish I'd call that a bug. Any functional
> dependencies between engines or whatever are userspace's problem only,
> which it needs to sort out using userspace memory fences.
> 
> The only things the kernel needs are some way to track dependencies as
> dma_fence (because memory management move the memory away and we need
> to move it back in, ideally pipelined). And it needs the special
> preempt fence (if we don't have pagefaults) so that you have a fence
> to attach to all the dma_resv for memory management purposes. Now the
> scheduler already has almost all the pieces (at least if we assume
> there's some magic fw which time-slices these contexts on its own),
> and we just need a few minimal changes:
> - allowing the scheduler to ignore the completion fence and just
> immediately push the next "job" in if its dependencies are ready
> - maybe minimal amounts of scaffolding to handle the preemption
> dma_fence because that's not entirely trivial. I think ideally we'd
> put that into drm_sched_entity since you can only ever have one active
> preempt dma_fence per gpu ctx/entity.
> 

Yep, preempt fence is per entity in Xe (xe_engine). We install these
into the VM and all external BOs mapped in the VM dma-resv slots.
Wondering if we can make all of this very generic between the DRM
scheduler + GPUVA...

Matt

> None of this needs a dma_fence_is_lr anywhere at all.
> 
> Of course there's the somewhat related issue of "how do we transport
> these userspace memory fences around from app to compositor", and
> that's a lot more gnarly. I still don't think dma_fence_is_lr is
> anywhere near what the solution should look like for that.
> -Daniel
> 
> 
> > Regards,
> > Christian.
> >
> > >
> > > Thanks,
> > >
> > > Thomas
> > >
> > >
> > >
> > >
> > >
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
