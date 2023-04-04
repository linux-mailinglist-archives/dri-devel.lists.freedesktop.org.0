Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425466D6D68
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 21:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D4010E78D;
	Tue,  4 Apr 2023 19:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BA710E33A;
 Tue,  4 Apr 2023 19:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680637718; x=1712173718;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hcqmhPyr9Fc0jTetYkkt5l047L3g5YGZPw+0+kHuG34=;
 b=hqs0niXWEyMfV3D7m66nuQJUzGIqsTLB3s+YL4f2NY0hyQLvCJ3uRYM+
 jlsvKxdWNgz/AU+L6XaYPf9ndMbdWE7OpTn+Yl8xA9hRJ9BmTPCNkeDhY
 hMHSKvDLw/apJTcu0x0a7v7yRQ4eZJC8PMbewUDAag/o9iglG/eTg8Rff
 rBDDNhzOhoFmzOgEOmLbCkPbCwBukz8zh6Ca5kQ/qmyulnaj1vzzWrKm6
 ZCPVZ1/YngN+AjQQKnn5tar/JXkC4KsGet2ABGayA82OBYjFB8R85J92e
 KJtRJdMVfPlGyeafa3cKE0D3azpR43ngZCQPvYhHenYg+dAOP/Px8ICVy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342308649"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="342308649"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 12:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932564816"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="932564816"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 04 Apr 2023 12:48:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 12:48:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 12:48:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 12:48:36 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 12:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wur3CxcUAYzQuq24Ks8w1sOZ2xIESf2G8pzmB9CDov80yXH/KSusiPew40C9Rk65KNb3GE5RolQ6TWvp3qQO7ToKQYnGYUP2BmRXdZg3sXGIl/DqNDHZK3fBYHJyPeBBwzGcvWxBxCF8CZsb05Gbm363A9iHGKzysVthOctem51aS8PTFTa2SP1CyL8EOCPV93WPZyGrlCnZDr34uPg0+qGz+phb0AQtc3uCo1gh9Fd1J44vm5yX2TYtRCOZyX+DWwGIrIb0BenV65rcdm7NgCqk5mOMl5YgruCgAldODSxK+mbCJhsDjffintUCMYt6O/0bxy7yldRKANA2U7A20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0xDJJajRm8vrQppca2LMFZLFbsYEUf3Xe5hPszhuBc=;
 b=X67yDB6cdT38to2jtf1ToHnbtBQRZ6spfr+vdmC0Hz2g0POnBggL/nUHbuEedVAelBlT3pI66n0pkRFEWXJtOkoRIySWRqRfBdwp14d0Xa0mHj8mKglfSsHDKG1rA2pR3+xtTGR0uPfx4LR69rk9Uq1jRtwwByz9fWjS6IbBjpzgNyboXTUd42QOZyNzRJiClm2bX1w02ZcUyNIA6qUKYk7wbGxC9qY/yrhuDRR7roWS0c+fGiggKRX+JOMAQv9PU4aLMNx4+EtBkfahiTpW3Rlvr9ouuPheTbOxjSRJ2GJbXzE7prsVeuu1YioHScbeIYhsY/Iz3UapthPP+7Z3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8324.namprd11.prod.outlook.com (2603:10b6:a03:538::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 19:48:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 19:48:33 +0000
Date: Tue, 4 Apr 2023 19:48:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZCx/C4cOwPcPQZ0R@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7641a5-c4c8-49eb-b3e5-08db35459282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRYGbJqXounuxJmt/eEFl+iSVa3aQwrmwCFn8JFKk/e156lchfbxMPonWMjBpRAf/Dpj8a49sa/nOU8NfKxAm0iGkX+tkxkHbhRQ0aZRcNYr1OsMk5zuD6fSrl+VpS+WNjsvx/l3Rrz1lF9k7NtVkeIc9mEZsbTn0ysk/OC88MsZF1YNyNBsCmWlj18Y4xSX7VmkrWElcSIj2i+PvyN4ye19Bv7hr4cSlAb93jvAjLvbgCAHAQP7yqTXWzm+r8C1BWGbdXR9mcIMA0KVB852I7nqnIhnzlMooy3BuA4MctZXOCTv1LGnXIUEWQyDwCS1VETRfIdMfB72+GCO4ONwJ4Egia+tceX53A7uhHss/kd2YduYvMAgiOyad9CwmGNMP/z8RDSoQWbONIRvc0mW+y/5GvrXSB+5tp5D70ug3E5hTr5GvcNZmowex7oGlLYnh7udTFb7qRl3MOYhkdjkaeew2SQy02XyP/29a7Tlg4pTDLjG+rB77jx/rjw0sYzljpC9m7U56nm9n43hPJg3SJF6HBFfShn4ceNyseYpYtUgoBiZY20dKYdMMrKye+4oVV/IIQtwgV7WKF9YZlpyiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199021)(82960400001)(38100700002)(316002)(83380400001)(54906003)(478600001)(7416002)(8676002)(8936002)(30864003)(5660300002)(2906002)(41300700001)(66556008)(6512007)(53546011)(6506007)(186003)(86362001)(26005)(4326008)(66946007)(6916009)(44832011)(66574015)(966005)(6666004)(66476007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4QAYKzkJdu5KNEfXrY23NZVkn/0Ax73lpn9Vh4Qpl7yRQT5QbDMYOgyk15?=
 =?iso-8859-1?Q?1spWKNSErhAJ/csrCeNmW0qchakKy5aURPoXRgDD9RSIBpHAt3kEPD6+4c?=
 =?iso-8859-1?Q?DhPh8WKbOWYgBY4E0UClT9cIbJC50uX81dsI13qKm8rEq6K1iu4FFj1MQ8?=
 =?iso-8859-1?Q?QYOMh9FE0mzFHYlaJ/tAFiaMgUNGogYOBdvTdjjML/LMnTZ/q2RfiK0Jcf?=
 =?iso-8859-1?Q?x2UGRPwoaG5c1drnuhLWgmaDz9bN17wOpt9fjwn1mX49RI2PWJOK67Azt6?=
 =?iso-8859-1?Q?qmLa8yM4E0OO2yay6FaGZxkUjGp2yrZC2uW7vrDyAKl1Dd8bQk9wbv6beN?=
 =?iso-8859-1?Q?MS4Na/NR0KbMlK5vBZjxEU7NepM4A6n2FzPVlY3QFi+Okb0UjHh8W8htOB?=
 =?iso-8859-1?Q?+2SZBc0yNVBA60wns3B4uCoBrSp4EOglpvCrDj9SU8IAbZfghHruo0qGo7?=
 =?iso-8859-1?Q?UcWv9mxdOfByCGE9myKMcB2hPlChWLzPVSqW2zP195ZiCJpADxNvpe66/+?=
 =?iso-8859-1?Q?SEiFei0sjD+cHl64WYNRiruHAba2+iAMalNUQ9LHre/h1YU/Up3hgAzXL0?=
 =?iso-8859-1?Q?RC5dDqK2UHTlAdOwkLhqkonsdX7LWT+UqZG1ycF0TFVvixfZnY2/LoBwo/?=
 =?iso-8859-1?Q?cVb3fLlw8FaUKrMily5TRrZNja/c4ABGTT13uRKBpbpXVLcEEE8eIT+Rzt?=
 =?iso-8859-1?Q?4M0qHB/p67yT63WW8B0UCuWv2QO2o5CLh1uUTEE/yYsss6JB88W53VxTyt?=
 =?iso-8859-1?Q?X812A58PvzZyLLdskDE4SMWdu0GnK+SH1OBERATw0lT6ZgUV4q/UXLpoo8?=
 =?iso-8859-1?Q?o5pBv1WDngiKvhEkY7BO2VLTjvUOgnX8+LXYWHa16wgOS4n7HSHWdHgyKq?=
 =?iso-8859-1?Q?Qli1rgkEuGJqSWT2JNKLaeyHLUQYFNaAL+iFfFMb0n8USHDSbuzjsltFLV?=
 =?iso-8859-1?Q?MnjP8KWNLK8NZPIWsCBSdI1rD5Yz1lzXQ/LqLXhYIDjxd+mrDFCZuIwhUS?=
 =?iso-8859-1?Q?6e4QffeoSbQaJ8aVNHushXWk6gTXUAo/CWoshQz3MIPa5OUejqkPo4CI4C?=
 =?iso-8859-1?Q?GejkO2Y6g+n/AkQCJ4RZtQK/AKPKMxLH6r6TLAkzBqAFyzSpMDtrBii/68?=
 =?iso-8859-1?Q?aQU/NdP4YB3LYKqzDURNC5YsgiHDTpXWew/3YLPdyNzCrKx/Te5tbjGzMp?=
 =?iso-8859-1?Q?Ih+1fD1hkiaegeIF3Ms8ZZEoMEwMToLzqlRqJW0kgkcjB1ypxaNid+gHvX?=
 =?iso-8859-1?Q?KPsBS9eet8x9RTDiPc6HvHWoD+hw1E4LaZeIIzH0ri66iti6K6TjktQsE6?=
 =?iso-8859-1?Q?dBu/96fyXHGreLKc/uWeIXvQ/iK7VtcAU8VL3ZP3khE1LEXLBjb5bfGAyI?=
 =?iso-8859-1?Q?E1K5rHf3clyf+RWHX2mEu0hNf907btcNXUSSuVuiTX4pH3mpTQhFSvifgs?=
 =?iso-8859-1?Q?oZJr0mgX8WobmjP9J+qbBUtLMxNvzVm/tO/Aq1IN/ukCjAveYWPzF0tMCA?=
 =?iso-8859-1?Q?VJ2CXeOIBxcGAaFED3ghyxqrEkx7iqWu3A9KaSe/6XRdPk7b9pQV+g6hY2?=
 =?iso-8859-1?Q?3RzERajWqC3u23vCMHSlMxijI0Ohs5wnN1aXTR4pEGFT07limuPIx5SKjT?=
 =?iso-8859-1?Q?TLFcZqmnanQpWP1NeR6aeZOyz/JuUhrS0CEhXi9VqdtVAYmItCRqRQrQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7641a5-c4c8-49eb-b3e5-08db35459282
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 19:48:33.1979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpdwpixnTwa5qyW3blIFSFMrjB2tFazsIg+b7Q3uOPzAy5iS79A4uMxYPsxWhRGGg/EXK/G6j+yU9zX9ghtWTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8324
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
 airlied@linux.ie, lina@asahilina.net,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 09:25:52PM +0200, Daniel Vetter wrote:
> On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
> > On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström (Intel) wrote:
> > > 
> > > On 4/4/23 15:10, Christian König wrote:
> > > > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > > > Hi, Christian,
> > > > > 
> > > > > On 4/4/23 11:09, Christian König wrote:
> > > > > > Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > > 
> > > > > > > For long-running workloads, drivers either need to open-code
> > > > > > > completion
> > > > > > > waits, invent their own synchronization primitives or internally use
> > > > > > > dma-fences that do not obey the cross-driver dma-fence protocol, but
> > > > > > > without any lockdep annotation all these approaches are error prone.
> > > > > > > 
> > > > > > > So since for example the drm scheduler uses dma-fences it is
> > > > > > > desirable for
> > > > > > > a driver to be able to use it for throttling and error
> > > > > > > handling also with
> > > > > > > internal dma-fences tha do not obey the cros-driver
> > > > > > > dma-fence protocol.
> > > > > > > 
> > > > > > > Introduce long-running completion fences in form of
> > > > > > > dma-fences, and add
> > > > > > > lockdep annotation for them. In particular:
> > > > > > > 
> > > > > > > * Do not allow waiting under any memory management locks.
> > > > > > > * Do not allow to attach them to a dma-resv object.
> > > > > > > * Introduce a new interface for adding callbacks making the
> > > > > > > helper adding
> > > > > > >    a callback sign off on that it is aware that the dma-fence may not
> > > > > > >    complete anytime soon. Typically this will be the
> > > > > > > scheduler chaining
> > > > > > >    a new long-running fence on another one.
> > > > > > 
> > > > > > Well that's pretty much what I tried before:
> > > > > > https://lwn.net/Articles/893704/
> > > > > > 
> > 
> > I don't think this quite the same, this explictly enforces that we don't
> > break the dma-fence rules (in path of memory allocations, exported in
> > any way), essentially this just SW sync point reusing dma-fence the
> > infrastructure for signaling / callbacks. I believe your series tried to
> > export these fences to user space (admittedly I haven't fully read your
> > series).
> > 
> > In this use case we essentially just want to flow control the ring via
> > the dma-scheduler + maintain a list of pending jobs so the TDR can be
> > used for cleanup if LR entity encounters an error. To me this seems
> > perfectly reasonable but I know dma-femce rules are akin to a holy war.
> > 
> > If we return NULL in run_job, now we have to be able to sink all jobs
> > in the backend regardless on ring space, maintain a list of jobs pending
> > for cleanup after errors, and write a different cleanup path as now the
> > TDR doesn't work. Seems very, very silly to duplicate all of this code
> > when the DRM scheduler provides all of this for us. Also if we go this
> > route, now all drivers are going to invent ways to handle LR jobs /w the
> > DRM scheduler.
> > 
> > This solution is pretty clear, mark the scheduler as LR, and don't
> > export any fences from the scheduler. If you try to export these fences
> > a blow up happens.
> 
> The problem is if you mix things up. Like for resets you need all the
> schedulers on an engine/set-of-engines to quiescent or things get
> potentially hilarious. If you now have a scheduler in forever limbo, the
> dma_fence guarantees are right out the window.
> 

Right, a GT reset on Xe is:

Stop all schedulers
Do a reset
Ban any schedulers which we think caused the GT reset
Resubmit all schedulers which we think were good
Restart all schedulers

None of this flow depends on LR dma-fences, all of this uses the DRM
sched infrastructure and work very well compared to the i915. Rewriting
all this with a driver specific implementation is what we are trying to
avoid.

Similarly if LR entity hangs on its own (not a GT reset, rather the
firmware does the reset for us) we use all the DRM scheduler
infrastructure to handle this. Again this works rather well...

> But the issue you're having is fairly specific if it's just about
> ringspace. I think the dumbest fix is to just block in submit if you run
> out of per-ctx ringspace, and call it a day. This notion that somehow the

How does that not break the dma-fence rules? A job can publish its
finished fence after ARM, if the finished fence fence waits on ring
space that may not free up in a reasonable amount of time we now have
broken the dma-dence rules. My understanding is any dma-fence must only
on other dma-fence, Christian seems to agree and NAK'd just blocking if
no space available [1]. IMO this series ensures we don't break dma-fence
rules by restricting how the finished fence can be used.

> kernel is supposed to provide a bottomless queue of anything userspace
> submits simply doesn't hold up in reality (as much as userspace standards
> committees would like it to), and as long as it doesn't have a real-world
> perf impact it doesn't really matter why we end up blocking in the submit
> ioctl. It might also be a simple memory allocation that hits a snag in
> page reclaim.
> 
> > > > > > And the reasons why it was rejected haven't changed.
> > > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
> > > > > Yes, TBH this was mostly to get discussion going how we'd best
> > > > > tackle this problem while being able to reuse the scheduler for
> > > > > long-running workloads.
> > > > > 
> > > > > I couldn't see any clear decision on your series, though, but one
> > > > > main difference I see is that this is intended for driver-internal
> > > > > use only. (I'm counting using the drm_scheduler as a helper for
> > > > > driver-private use). This is by no means a way to try tackle the
> > > > > indefinite fence problem.
> > > > 
> > > > Well this was just my latest try to tackle this, but essentially the
> > > > problems are the same as with your approach: When we express such
> > > > operations as dma_fence there is always the change that we leak that
> > > > somewhere.
> > > > 
> > > > My approach of adding a flag noting that this operation is dangerous and
> > > > can't be synced with something memory management depends on tried to
> > > > contain this as much as possible, but Daniel still pretty clearly
> > > > rejected it (for good reasons I think).
> > > > 
> > > > > 
> > > > > We could ofc invent a completely different data-type that abstracts
> > > > > the synchronization the scheduler needs in the long-running case, or
> > > > > each driver could hack something up, like sleeping in the
> > > > > prepare_job() or run_job() callback for throttling, but those waits
> > > > > should still be annotated in one way or annotated one way or another
> > > > > (and probably in a similar way across drivers) to make sure we don't
> > > > > do anything bad.
> > > > > 
> > > > >  So any suggestions as to what would be the better solution here
> > > > > would be appreciated.
> > > > 
> > > > Mhm, do we really the the GPU scheduler for that?
> > > > 
> > 
> > I think we need to solve this within the DRM scheduler one way or
> > another.
> 
> Yeah so if we conclude that the queue really must be bottomless then I
> agree drm-sched should help out sort out the mess. Because I'm guessing
> that every driver will have this issue. But that's a big if.
> 
> I guess if we teach the drm scheduler that some jobs are fairly endless
> then maybe it wouldn't be too far-fetched to also teach it to wait for a
> previous one to finish (but not with the dma_fence that preempts, which we
> put into the dma_resv for memory management, but some other struct
> completion). The scheduler already has a concept of not stuffing too much
> stuff into the same queue after all, so this should fit?

See above, exact same situation as spinning on flow controling the ring,
this IMO absolutely breaks the dma-fence rules. IMO the correct solution
is to have a DRM that doesn't export dma-fences, this is exactly what
this series does as if we try to, boom lockdep / warn on blow up.

Matt

[1] https://patchwork.freedesktop.org/patch/525461/?series=114772&rev=2

> -Daniel
> 
> 
> > > > I mean in the 1 to 1 case  you basically just need a component which
> > > > collects the dependencies as dma_fence and if all of them are fulfilled
> > > > schedules a work item.
> > > > 
> > > > As long as the work item itself doesn't produce a dma_fence it can then
> > > > still just wait for other none dma_fence dependencies.
> > > > 
> > > > Then the work function could submit the work and wait for the result.
> > > > 
> > > > The work item would then pretty much represent what you want, you can
> > > > wait for it to finish and pass it along as long running dependency.
> > > > 
> > > > Maybe give it a funky name and wrap it up in a structure, but that's
> > > > basically it.
> > > > 
> > > This very much sounds like a i915_sw_fence for the dependency tracking and
> > > dma_fence_work for the actual work although it's completion fence is a
> > > dma_fence.
> > >
> > 
> > Agree this does sound to i915ish as stated below one of mandates in Xe
> > was to use the DRM scheduler. Beyond that as someone who a submission
> > backend in the i915 and Xe, I love how the DRM scheduler works (single
> > entry point), it makes everything so much easier.
> > 
> > Matt
> > 
> > > Although that goes against the whole idea of a condition for merging the xe
> > > driver would be that we implement some sort of minimal scaffolding for
> > > long-running workloads in the drm scheduler, and the thinking behind that is
> > > to avoid implementing intel-specific solutions like those...
> > > 
> > > Thanks,
> > > 
> > > Thomas
> > > 
> > > 
> > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > Thomas
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
