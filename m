Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8FC6D8B46
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 01:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5534E10EA81;
	Wed,  5 Apr 2023 23:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D510EA81;
 Wed,  5 Apr 2023 23:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680739133; x=1712275133;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FsTXOqY1F+/QvtYmofKCIhUwgdeDmkqKiHko81FTH2Y=;
 b=OQ3IxB7UxROiv+sBemWql7rOAQFOwoEUk5bCPORrXeG8jv0VNrwj//Qt
 1wGjk966G+f6OZ3pUCG+K7nQvG2ixkC24ljrcW48fAHudIfCXJgCiYCMy
 VQGiEXvqkX46Jdzft9XEnSrP4+guK5Xy9nGC1Rc1wBSFyi0PW9E2kGxZM
 HEbogJxaSf9A5t+coj8cWnHirz6jEsaHukid7tcljzaqUDz6yE4hgLP/e
 sETFqf/aLS1eekeAFg3+Aj6Dpoytz27Am8nhFIvkzsP40wxsHOiNrLmkF
 mc91Thbt1sfvtys5HI3e8ebie7ALUE6dH8jpjLl937JTi4wxE6YpPocce Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342610859"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="342610859"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 16:58:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="810801404"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="810801404"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 05 Apr 2023 16:58:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 16:58:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 16:58:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 16:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgLhJq1OTuZY2FlNr8hjqTeTqdWEtF3Y+cbX1MRILgxBdIyc62mkPg6kEftHcBXFpW8ZlfQKS+3cNWCyspwhAF1Otz0Ds5u5+v7ZueYZrw3obU4jGdl/1Xw1zMHKSFKMT6uW13eZhr3LDeELJ/i+IJgtKUjN6nZeHNgBBWPLYD+uq+T6dF78Q7Ig5c5knXp90xxySHnzeBsMQXJrG+OrqizaTIXJMG/eQFHdKRXfdEm7g9lePSSfA+lcPv84vCkrD9tM6HF+htXRYP6315f9vMyD0UkcTNZIZXMkIUALl6/I7hy9LzVjChAfkI5XBuDIZR67SHB/oCIt6AnpB0Mx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBHWLYTeNVSazav6ChToe4ctAzTofE2106fhuPLXHnU=;
 b=Ah5j+jvP+qOokJhdzRwUr5c/Y8C+XlYW1jfseN6htZ8RRkPTtoluRAtW4sO/0L7i6tk95vWmEcjbHuhwZo2C5ABbOlT8W1yCwPzaMXogry7w6wkEooNMaiqqdBCDL/0Nt9YCUjBuzxOHqPpQFMR0MfTIP+dKFoJSGNPC8VxWzlei5I6bbQzGWhtrUF2qsWiRsdjHuqQphxnTgm/5fr2qKpRbBbo8L4Hev0b+2kkwEnomXGBPhoECwVhfAKKw8/yRowtbt7GSyqSbzqkc3kPBE/yqd4O4C0zlG7jdjHnzaSp374YAT2J6re2Lwye8ulr1COpzVt3L6fOdGwDzM+VG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 23:58:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 23:58:49 +0000
Date: Wed, 5 Apr 2023 23:58:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZC4LNOuOza9RX9TJ@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
 <ZCx/C4cOwPcPQZ0R@DUT025-TGLU.fm.intel.com>
 <ZC1y9ON07yTYNTz6@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZC1y9ON07yTYNTz6@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 182d75f8-5086-41e3-ed0d-08db3631b358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQfXnztsJSKA1ctq/4mXZu673FfmV5Q3pzxFqQVRoj0ASY/UQFKOKMuiKzF2P1wF9Ti7LGAnZ/mrNyKSZvGfL1ySGhEX49bieDOJGPzlPBLOF6jN1+7GCvC5sJhGIGZNyMy9HJfqsiGqLzwH20wtZ++vFXrCZqvpWsyfttLdrb0zOpR8l2IDGX4eMIFCHYMJIf6rbVQNFbeawmerhW0ZAiq8MCNoQ/0YfIegmO01lw6BmrI09ugDr3sVMjTeHjmrv+zinS3zOdHpuwOAGtH5FdGaMgun4c+WCn1K5uvgjCDhj9tHsJLyH41z3iSb54RlAedu2kg0Tw63tnN7lia45+qLjvvnqidLtc6iO1OfVADO23EM/8L+toh5urLRaTvs8oWdrYRghBZXzpFi3qT8HEwf3+756iqnwJNm5LUb2LOpX8KGi3iOdITeCD/FDZyZYOJ6h8yMhWRULb6Kdu2mTErt6c6ED7/mX47l7n7exMLN0LvHHYfprIfqW1lPfl2yAHtvQi18/gOjMLYAHeO3ahKmwWvfk4GDI6quZWtDkg/HQl03zz+SKB0x64eOXK4VJTOsvi8vDdo880qtKUsuHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(6486002)(30864003)(66556008)(54906003)(8676002)(66476007)(6916009)(66946007)(41300700001)(478600001)(316002)(4326008)(86362001)(6666004)(6506007)(966005)(53546011)(186003)(38100700002)(6512007)(82960400001)(83380400001)(2906002)(7416002)(5660300002)(26005)(44832011)(8936002)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mWon++hd0H1CvDkRKv5MT+KQltdctj/tErIeH0eiIvelS0gRX5efnN2K/U?=
 =?iso-8859-1?Q?ErbU4h2lgkAumSMxnRUBVbe/ovWWcJ1AtJ3fkj7N1gUa0T5EgCAXVCbzwV?=
 =?iso-8859-1?Q?mOxVIeyOq5yZpGKi0f0d4YQ7vL4lKwtYODDGOoi/dk/tE1rHSYF0ORPZ5l?=
 =?iso-8859-1?Q?RgmyASXVctpoHzuAg2Uud3DMA9FP5JqpX2ifLEwzmT1yqcb6xUfDcoB1fw?=
 =?iso-8859-1?Q?+WN5+MIR/cJnMKnXXTiExuHaTq+GUgJ+/v7Rz0QRMsjHi/i22z6DzJflVG?=
 =?iso-8859-1?Q?2TS+zIHmwovCQnd1u67hX/X2nP1jWyUR6tVsm5yPGtWvoX9aVvd3tV2jfq?=
 =?iso-8859-1?Q?QhycXHWgpVkNwkafgIQDDUkQHxtwolLtcmWP0uGbOszNpmec5espplR9L9?=
 =?iso-8859-1?Q?b9/jaO+Re/vMDDP5468AAdWnfuhPo95yYybo5TC++BDtEPDd61U7kvtu5C?=
 =?iso-8859-1?Q?ZYYIIb2DRrCRgEhlEA9dckqvYntGU49rlLFqnBi6gZtvdF//HubQEDfqbG?=
 =?iso-8859-1?Q?qKttYbh+5Q1ZRScBRtvJT8yeQy4Cvzci/80gy5JFEBLGlXByhiuiPiRdiJ?=
 =?iso-8859-1?Q?17s6QmkkfGlKXHVBuV1SgUejB/LCYzbTQOF1LOq5xt3mOCvpO9VjakhKYj?=
 =?iso-8859-1?Q?ZOeO3c5wmbMw7nwlNFKX4aYU1Ap7cNdWz4g6l+awKY1EPJrHwLlBHpwXtr?=
 =?iso-8859-1?Q?5MGT5H61QVRBO5NpblZJ3x9jfDvqEuGfOPqhbKyJpunvcR8bNo/Od3KkB+?=
 =?iso-8859-1?Q?mel1xH3NPVc9HBvuao9tk60M/xLDxdKDi/xqnDFvQVF4DpNeO+oGB/J7q6?=
 =?iso-8859-1?Q?I4/Aa/DAWiXLvLHz2UWFqVTsOJsEwpZFCNyEqTQffMny8nMmiM6lAF2wJt?=
 =?iso-8859-1?Q?4fRkRRSvNhCA/vCN+aanetA8CFjS/GuDntRPQ78TYgoJmbKt3O/t6gaFbb?=
 =?iso-8859-1?Q?OZ8o4UTXErXXjeq2RCDnYL4EwOkiUHrf/46wPfLmd3t6j1cr6zq5Lyeha6?=
 =?iso-8859-1?Q?Di0+xKOiEzb2Gu9PBL0cfOre9vCgj7px1EeAh71DkPNUw9Qe3sVLlHfDRd?=
 =?iso-8859-1?Q?cDkGaILre0Y5tdeRrumJBBlpeOA5tRNRoW//6dLMVe+/ZYzFGwKbe/B7RE?=
 =?iso-8859-1?Q?BkcUPrlCeq2uVSYVIzJqhxSXiRN/s4Wnpc4CwNKyeBjo8vz67dJMG4w9fi?=
 =?iso-8859-1?Q?61aTgIsgDkN8a7D3Bk8VzmMtSYiwEiaYjp357TvYlbvFCTlMGKoL69qYFU?=
 =?iso-8859-1?Q?mHTf4e////qNvrdLxQcTtNwSpnf+YqUtjP7j9NYIUw2wqRNFJ+X2JOjiWv?=
 =?iso-8859-1?Q?jPSfDsKJxvTE8P5YWiG8KVOlob5Y8JodcWRRC0ojumVIQP/N8fucoPgZgA?=
 =?iso-8859-1?Q?dsmeUpncMXm2L/m7UYq+PVvoy38avsSctB1IEUuxqI0Gia8rLf8Ydf8YzS?=
 =?iso-8859-1?Q?XNU+aEW1PTI5kkPnEYe/0Lrjl0nB6vCTLXJEDBicgMuJJY6R0Mutr4sJ3J?=
 =?iso-8859-1?Q?jCyyM/u7VxM9a+hNdQx/27NL3RWhONzKHHs7cku35cXUJM5Vw6ARoCFxJu?=
 =?iso-8859-1?Q?ZrbIw1/It7qlFclv7Jdw4jF+5OA0wHo5MCBdRtkrtUKMWMESVa3j/ZKgmI?=
 =?iso-8859-1?Q?EmqfzrncI+tB4jNZaHimZ+kJVBo4J0b/tNpJ4gNinbseHlMJWM/0K6MA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 182d75f8-5086-41e3-ed0d-08db3631b358
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 23:58:49.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGMb731qEKX50f28SiQaZ43fp1mczypjlpauWaARzLQLijIjX4fptL7pXyiZIpOZcv4Lyn6ivMMhtuIjBx0keA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
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

On Wed, Apr 05, 2023 at 03:09:08PM +0200, Daniel Vetter wrote:
> On Tue, Apr 04, 2023 at 07:48:27PM +0000, Matthew Brost wrote:
> > On Tue, Apr 04, 2023 at 09:25:52PM +0200, Daniel Vetter wrote:
> > > On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
> > > > On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström (Intel) wrote:
> > > > > 
> > > > > On 4/4/23 15:10, Christian König wrote:
> > > > > > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > > > > > Hi, Christian,
> > > > > > > 
> > > > > > > On 4/4/23 11:09, Christian König wrote:
> > > > > > > > Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > > > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > > > > 
> > > > > > > > > For long-running workloads, drivers either need to open-code
> > > > > > > > > completion
> > > > > > > > > waits, invent their own synchronization primitives or internally use
> > > > > > > > > dma-fences that do not obey the cross-driver dma-fence protocol, but
> > > > > > > > > without any lockdep annotation all these approaches are error prone.
> > > > > > > > > 
> > > > > > > > > So since for example the drm scheduler uses dma-fences it is
> > > > > > > > > desirable for
> > > > > > > > > a driver to be able to use it for throttling and error
> > > > > > > > > handling also with
> > > > > > > > > internal dma-fences tha do not obey the cros-driver
> > > > > > > > > dma-fence protocol.
> > > > > > > > > 
> > > > > > > > > Introduce long-running completion fences in form of
> > > > > > > > > dma-fences, and add
> > > > > > > > > lockdep annotation for them. In particular:
> > > > > > > > > 
> > > > > > > > > * Do not allow waiting under any memory management locks.
> > > > > > > > > * Do not allow to attach them to a dma-resv object.
> > > > > > > > > * Introduce a new interface for adding callbacks making the
> > > > > > > > > helper adding
> > > > > > > > >    a callback sign off on that it is aware that the dma-fence may not
> > > > > > > > >    complete anytime soon. Typically this will be the
> > > > > > > > > scheduler chaining
> > > > > > > > >    a new long-running fence on another one.
> > > > > > > > 
> > > > > > > > Well that's pretty much what I tried before:
> > > > > > > > https://lwn.net/Articles/893704/
> > > > > > > > 
> > > > 
> > > > I don't think this quite the same, this explictly enforces that we don't
> > > > break the dma-fence rules (in path of memory allocations, exported in
> > > > any way), essentially this just SW sync point reusing dma-fence the
> > > > infrastructure for signaling / callbacks. I believe your series tried to
> > > > export these fences to user space (admittedly I haven't fully read your
> > > > series).
> > > > 
> > > > In this use case we essentially just want to flow control the ring via
> > > > the dma-scheduler + maintain a list of pending jobs so the TDR can be
> > > > used for cleanup if LR entity encounters an error. To me this seems
> > > > perfectly reasonable but I know dma-femce rules are akin to a holy war.
> > > > 
> > > > If we return NULL in run_job, now we have to be able to sink all jobs
> > > > in the backend regardless on ring space, maintain a list of jobs pending
> > > > for cleanup after errors, and write a different cleanup path as now the
> > > > TDR doesn't work. Seems very, very silly to duplicate all of this code
> > > > when the DRM scheduler provides all of this for us. Also if we go this
> > > > route, now all drivers are going to invent ways to handle LR jobs /w the
> > > > DRM scheduler.
> > > > 
> > > > This solution is pretty clear, mark the scheduler as LR, and don't
> > > > export any fences from the scheduler. If you try to export these fences
> > > > a blow up happens.
> > > 
> > > The problem is if you mix things up. Like for resets you need all the
> > > schedulers on an engine/set-of-engines to quiescent or things get
> > > potentially hilarious. If you now have a scheduler in forever limbo, the
> > > dma_fence guarantees are right out the window.
> > > 
> > 
> > Right, a GT reset on Xe is:
> > 
> > Stop all schedulers
> > Do a reset
> > Ban any schedulers which we think caused the GT reset
> > Resubmit all schedulers which we think were good
> > Restart all schedulers
> > 
> > None of this flow depends on LR dma-fences, all of this uses the DRM
> > sched infrastructure and work very well compared to the i915. Rewriting
> > all this with a driver specific implementation is what we are trying to
> > avoid.
> > 
> > Similarly if LR entity hangs on its own (not a GT reset, rather the
> > firmware does the reset for us) we use all the DRM scheduler
> > infrastructure to handle this. Again this works rather well...
> 
> Yeah this is why I don't think duplicating everything that long-running
> jobs need makes any sense. iow I agree with you.
> 

Glad we agree.

> > > But the issue you're having is fairly specific if it's just about
> > > ringspace. I think the dumbest fix is to just block in submit if you run
> > > out of per-ctx ringspace, and call it a day. This notion that somehow the
> > 
> > How does that not break the dma-fence rules? A job can publish its
> > finished fence after ARM, if the finished fence fence waits on ring
> > space that may not free up in a reasonable amount of time we now have
> > broken the dma-dence rules. My understanding is any dma-fence must only
> > on other dma-fence, Christian seems to agree and NAK'd just blocking if
> > no space available [1]. IMO this series ensures we don't break dma-fence
> > rules by restricting how the finished fence can be used.
> 
> Oh I meant in the submit ioctl, _before_ you even call
> drm_sched_job_arm(). It's ok to block in there indefinitely.
>

Ok, but how do we determine if their is ring space, wait on xe_hw_fence
which is a dma-fence. We just move a wait from the scheduler to the exec
IOCTL and I realy fail to see the point of that.

> > > kernel is supposed to provide a bottomless queue of anything userspace
> > > submits simply doesn't hold up in reality (as much as userspace standards
> > > committees would like it to), and as long as it doesn't have a real-world
> > > perf impact it doesn't really matter why we end up blocking in the submit
> > > ioctl. It might also be a simple memory allocation that hits a snag in
> > > page reclaim.
> > > 
> > > > > > > > And the reasons why it was rejected haven't changed.
> > > > > > > > 
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > > 
> > > > > > > Yes, TBH this was mostly to get discussion going how we'd best
> > > > > > > tackle this problem while being able to reuse the scheduler for
> > > > > > > long-running workloads.
> > > > > > > 
> > > > > > > I couldn't see any clear decision on your series, though, but one
> > > > > > > main difference I see is that this is intended for driver-internal
> > > > > > > use only. (I'm counting using the drm_scheduler as a helper for
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
> > > > > > >  So any suggestions as to what would be the better solution here
> > > > > > > would be appreciated.
> > > > > > 
> > > > > > Mhm, do we really the the GPU scheduler for that?
> > > > > > 
> > > > 
> > > > I think we need to solve this within the DRM scheduler one way or
> > > > another.
> > > 
> > > Yeah so if we conclude that the queue really must be bottomless then I
> > > agree drm-sched should help out sort out the mess. Because I'm guessing
> > > that every driver will have this issue. But that's a big if.
> > > 
> > > I guess if we teach the drm scheduler that some jobs are fairly endless
> > > then maybe it wouldn't be too far-fetched to also teach it to wait for a
> > > previous one to finish (but not with the dma_fence that preempts, which we
> > > put into the dma_resv for memory management, but some other struct
> > > completion). The scheduler already has a concept of not stuffing too much
> > > stuff into the same queue after all, so this should fit?
> > 
> > See above, exact same situation as spinning on flow controling the ring,
> > this IMO absolutely breaks the dma-fence rules. IMO the correct solution
> > is to have a DRM that doesn't export dma-fences, this is exactly what
> > this series does as if we try to, boom lockdep / warn on blow up.
> 
> I dont think it's impossible to do this correctly, but definitely very,
> very hard. Which is why neither Christian nor me like the idea :-)
> 
> Essentially you'd have to make sure that any indefinite way will still
> react to drm_sched_job, so that you're not holding up a gt reset or
> anything like that, but only ever hold up forward progress for this
> specific scheduler/drm_sched_entity. Which you can do as long (and again,
> another hugely tricky detail) you still obey the preempt-ctx dma_fence and
> manage to preempt the underlying long-running ctx even when the drm/sched
> is stuck waiting for an indefinite fence (like waiting for ringspace or
> something like that).
> 
> So I don't think it's impossible, but very far away from "a good idea" :-)
> 
> Hence to proposal to bail out of this entire mess by throwing EWOULDBLCK
> back to userspace directly from the ioctl function, where you still can do
> that without breaking any dma_fence rules. Or if it's not a case that
> matters in practice, simply block in the ioctl handler instead of
> returning EWOULDBLCK.

Returning EWOULDBLCK on a full ring is reasonsible I guess but again
without returning a fence in run job the TDR can't be used for clean up
on LR entities which will result in duplicate code open coded by each
driver. Same goes for checking ring full in exec.

How about this:
- We mark xe_hw_fence as LR to ensure it can't be exported, return this
  in run_job which gives flow control on the ring + the handy TDR
  functionality
- When a scheduler is marked as LR, we do not generate finished fences
  for jobs
- We heavily, heavily scrutinize any usage of the LR fence flag going
  foward
- We document all of this very loudly

Is this reasonable?

Matt

> -Daniel
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/525461/?series=114772&rev=2
> > 
> > > -Daniel
> > > 
> > > 
> > > > > > I mean in the 1 to 1 case  you basically just need a component which
> > > > > > collects the dependencies as dma_fence and if all of them are fulfilled
> > > > > > schedules a work item.
> > > > > > 
> > > > > > As long as the work item itself doesn't produce a dma_fence it can then
> > > > > > still just wait for other none dma_fence dependencies.
> > > > > > 
> > > > > > Then the work function could submit the work and wait for the result.
> > > > > > 
> > > > > > The work item would then pretty much represent what you want, you can
> > > > > > wait for it to finish and pass it along as long running dependency.
> > > > > > 
> > > > > > Maybe give it a funky name and wrap it up in a structure, but that's
> > > > > > basically it.
> > > > > > 
> > > > > This very much sounds like a i915_sw_fence for the dependency tracking and
> > > > > dma_fence_work for the actual work although it's completion fence is a
> > > > > dma_fence.
> > > > >
> > > > 
> > > > Agree this does sound to i915ish as stated below one of mandates in Xe
> > > > was to use the DRM scheduler. Beyond that as someone who a submission
> > > > backend in the i915 and Xe, I love how the DRM scheduler works (single
> > > > entry point), it makes everything so much easier.
> > > > 
> > > > Matt
> > > > 
> > > > > Although that goes against the whole idea of a condition for merging the xe
> > > > > driver would be that we implement some sort of minimal scaffolding for
> > > > > long-running workloads in the drm scheduler, and the thinking behind that is
> > > > > to avoid implementing intel-specific solutions like those...
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > Thomas
> > > > > 
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
