Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDC26D6CD5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 21:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A3C10E054;
	Tue,  4 Apr 2023 19:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D1710E054;
 Tue,  4 Apr 2023 19:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680634955; x=1712170955;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=74IGNFcJNvaTLdXjwROhgmtHuvWIT+GRETMLST2XGkc=;
 b=Df+CInfSVKF19TVeoB1IL7S7BbcUU2TOJfxOUd0wv32LbMV93p8Y2n1q
 FEYjPnIQfAX+KqH2O5uQ12ganuMy2TcDNJfSUCarL0sM/w/l4gM7l0myq
 jLtpRYkAjcGosR8GTKU1clWLX1c6n+/T09o1kxtueEptRxC68O9ZUShnw
 9R0SW0jngqLy5eMUL5XTMw8O0sYsHR5vzEGcU0aCKebgrhuZFkD3TtVt8
 cUGmfnwbG3zm21I8itnsYR85eMOyJSQBry36gXW/x3l0/8xzhDtLCvGK7
 ASGVBzU8O2wJl5X35WGgJeoaM/1DQz2Gy92nP8HaYsFulKAhRd3FtTpPw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="341005046"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="341005046"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 12:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716751840"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="716751840"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 04 Apr 2023 12:02:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 12:02:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 12:02:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 12:02:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODarxx+9VYNLmg9wrZG2kf9SLmKE+YmVjiRtwX3ZSV1H0wCLydYEStLcLjjRFID8pZ55tZ28SOAtKEIg9pUzi8h+6XGhnjMFiQim5U6bv8vmu1AgYBKqV+hpwTp0EC3qHAxw5jQV8Ur7tzrNMBcemXmbkrMg1uxqNfswfCjrJsrKZhaVXBXMwul2GIlopo8zMGvAr1zCwPNEYX4wNq0yWp8UH6GRrOIvcKKl3ujvMuiqKay61+c/lVLNjOO8PXZlKK+qIhaCRZkHVTVCzlTUvOP+j9ggRbhVNtqfXBYuLnWqSOfLDPiDbpwRQQU8dE5HQDP+Xl7dPvmS9o+dTIiL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R12Z4MunI6Fbh2YonIVfhLelwx5BUCeQ3SXlSKxy8c=;
 b=UznZuJFCcuIs5GB9g5S556yXqnlXcvkD+9OepMRzDgXPlmXdnw0oMgzZu4Y2TkALCeG91vO9RdrAB9iov0/XlAyNeopQ6hB0vEgUZkrFmU6qzq7lJ1HXwjDKr8qo2Q+2EH/hSgmHpjFADAJXp2GaBJhx3xFr1T0eNCNLiUh7YEx2G5XWsMAoluYsKsdyQsLzVWsCmAa2WI/U04pYxQELt0uN2BJ5uwXph8HeFkahrEJ8vZKX1SRttujaEhbg6sGWPrPY3DYjHvEXh6lXxFyYeG/vqeRbG3zCsWrtq07xHDuARc29+P5hu/NPxq33wdO/e62YsoPo2r92DaYZdiiuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 19:02:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 19:02:28 +0000
Date: Tue, 4 Apr 2023 19:02:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
X-ClientProxiedBy: SJ0PR05CA0197.namprd05.prod.outlook.com
 (2603:10b6:a03:330::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f626eb6-ea8d-4022-631f-08db353f2260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Um5Zmhn8dfRrIK4tG0DwzcfsO41pJ0gkplMqh9NDhx8ElzPD3QzKpBXdfm0+wRcpvqVl4m9nJK+B9MNM+dIW+5EBjoDOkeKIV/Fvzrte/VuYVhtpktZhZI1PVpEJjs+KSeD7kkAWOzY/imy3bm7iATQasm6puPkH+B3ocJ8EcALpAkPYWPY1+fgTB6tXBHf/pJIg2L8NaS4DDqjYYRQElKBHpJV/2JmjYWp2YsOy5RbT/N0t6R/9/TzWsEfhgzVg45O2S/n+sCo/w6E73OGxuXtQ5Gvd0p+bipAIdYbXJ0acuu9l5bkBMaVpn9r9X5N21eh1sqYH9NuZt/McNJwuX29L2j9S0cPZKa5pOoKeEFpRZzpfV/xOZWjKftOieZAA+55iqzPjEJi8+4kD88OamOriASdkHpPwGyU4gLmMDnmCSEf5MfdVemrunxSt4DbKMqtcB7bk4SwZ1fNxgqkMqpKYmnI5531Dt0dSZcWQ9guRNwxgJbBKVWhGEAZD6KHO7Rgvn7CGuxqqUosjnYy2gm+y+Ypo1W44xJxn7UQCs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(38100700002)(5660300002)(7416002)(44832011)(6916009)(83380400001)(66574015)(316002)(54906003)(53546011)(6486002)(966005)(86362001)(6512007)(186003)(478600001)(6666004)(6506007)(26005)(66556008)(82960400001)(66476007)(41300700001)(4326008)(8676002)(66946007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4hzUnUm8Xb6j0otvCP0IOlJQL1MU4zdlr2SgGh3b0eK5DxHJRLaxSwIOpW?=
 =?iso-8859-1?Q?fakvfbHy32+bgJNtBs7tRP9NAGrDtFpNlrdGMrCY5yjk4h5vcSb4i9pZkT?=
 =?iso-8859-1?Q?hwhLbMD1kIY06ZmbBpG4i4usLIEUMOM1YrNXOrBaxfGiKkZ3FxbbRXVkZT?=
 =?iso-8859-1?Q?Yqd0jsDTK7Okt4eGWBxFcu3xBaP2NPecVQz1WYx0P8hDktG88DRM+Wadp5?=
 =?iso-8859-1?Q?rNhajwExaSTs15RekLWWGyEuSKXzam+kmuGx/Lmun00M53jFsyANyZQUbN?=
 =?iso-8859-1?Q?w5NH4m9YplHTEmvbKlItV4qhKvn7WRSc4mjWi/UPDmCFaRCR49Z/l0IG7z?=
 =?iso-8859-1?Q?wlPUuN4QH2n5DlPC057zZFNBWdNUaaV4hQqLKl7E+q+7DwDZaSGScECml6?=
 =?iso-8859-1?Q?Muq4UDt/Q7z0CyKJqookQcgvrVoz4ctQaGNNJ57X82ptreu3oF12HxdCcs?=
 =?iso-8859-1?Q?LtHi8nA3w9T+vZ3wDUHkfQHpAzo0Z5LgCsglmlnoG3rwbavfUahb6SUM2w?=
 =?iso-8859-1?Q?RDZYL95xVSqlIT9nEJKWLV9dRZ3bap4YELVpvSDgZTw0SWosBspapqiTo9?=
 =?iso-8859-1?Q?VyahdAR2N45ei8tACGT7JtxoKQMiyCbZeaiqbCZNmLLShq+QB4U4l1qOdO?=
 =?iso-8859-1?Q?5vGvLiS0O936mLW81I1l0bGh3kTdmC/W9Ihb1BxakwoAbakCfU3bTGCl67?=
 =?iso-8859-1?Q?9DfuXOFU0noeytH15f1KLhoECOuImCsUQsp1lZd5HJ2FZwC1GtBRF7fp3m?=
 =?iso-8859-1?Q?c059AoRFJmoS27zO3uhH8QRY4CKVlfzTPE+DKsD4Iem4v4cCZqNqNUbTAl?=
 =?iso-8859-1?Q?2aAFjIvXefSU8gSbMaXSD1P48cMTSewZeCbUCm3LocM6LPNU6IsO2QLewK?=
 =?iso-8859-1?Q?+ATAel5YV3aATJnZcvvgR19OHkuOgZxnmWkf6uVn76UvMbtTpxhszvIHPs?=
 =?iso-8859-1?Q?W9CtMGskhLRQOrjLE9D+pDLHLdqx4hBjJGNlM3wYFSqiZNfvBjeUiDkMsV?=
 =?iso-8859-1?Q?YGqjZQhYaGnNBuRUiTjzUBUypF0yw+JMiQXXVEphMA+to5f24lwxXrBUis?=
 =?iso-8859-1?Q?xC9JZj/FkYPWmXI3S3+mZE64EpgHa9O2Y3kG4VUQ82C4TSGTv6FN4CtM3N?=
 =?iso-8859-1?Q?h+Cfjhh1lZ9tntSoT/wLdnbMTR305k10QjDPL1W0aFeqhHkLjI1WosoIbq?=
 =?iso-8859-1?Q?kmBQDXA6jq2vIn2O+cKE5e9dO0G+bT514U4MjXCX109H1rXMIyox7KifP0?=
 =?iso-8859-1?Q?uGPLo5LP/KT5bnp0LN2xH8xvQey6JbAIIP+AybFEh5hoU5xeUEiKsVujVh?=
 =?iso-8859-1?Q?NxbfVvRYkXdlRFeZVp3M7OFbbOqh4S8jULkU4BmnLlGfH+D2Udh+nBAx42?=
 =?iso-8859-1?Q?RrCI9K6jMdx6SA0ciBRwhkVs6ptPmDH6JbV325K10qN3vD7U2FMn8Lhitw?=
 =?iso-8859-1?Q?2RaE9AMCLDG75Q6ZQ+GyqfB3wF8nwa4A+izvzZ3AH2vWFgXapxvFpAWztn?=
 =?iso-8859-1?Q?TQm6lkrkGGclIfyH7n+IygoCg2IcgdjzQJoAATe+su4XrSGivMsfpnSeXJ?=
 =?iso-8859-1?Q?3VhA6wvNfcF0AvvV/YZ25Cw0+FPftxzSUg0GIxfJczywA4z5H6E0p/tn+X?=
 =?iso-8859-1?Q?wmS9kzDrCNHnloLEEM4r0HW3VjmoJjb8sXYy99eehd1x0DHhVrLO7+9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f626eb6-ea8d-4022-631f-08db353f2260
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 19:02:28.1125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u15L/rhgjv/+soYHc9ktmAskHwkJN2Z2QsIedkkz8bix+q1+dc/vXEZyUZtnacovWJE2elJa/kMmQ9fXUrQ9cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
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

On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström (Intel) wrote:
> 
> On 4/4/23 15:10, Christian König wrote:
> > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > Hi, Christian,
> > > 
> > > On 4/4/23 11:09, Christian König wrote:
> > > > Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > 
> > > > > For long-running workloads, drivers either need to open-code
> > > > > completion
> > > > > waits, invent their own synchronization primitives or internally use
> > > > > dma-fences that do not obey the cross-driver dma-fence protocol, but
> > > > > without any lockdep annotation all these approaches are error prone.
> > > > > 
> > > > > So since for example the drm scheduler uses dma-fences it is
> > > > > desirable for
> > > > > a driver to be able to use it for throttling and error
> > > > > handling also with
> > > > > internal dma-fences tha do not obey the cros-driver
> > > > > dma-fence protocol.
> > > > > 
> > > > > Introduce long-running completion fences in form of
> > > > > dma-fences, and add
> > > > > lockdep annotation for them. In particular:
> > > > > 
> > > > > * Do not allow waiting under any memory management locks.
> > > > > * Do not allow to attach them to a dma-resv object.
> > > > > * Introduce a new interface for adding callbacks making the
> > > > > helper adding
> > > > >    a callback sign off on that it is aware that the dma-fence may not
> > > > >    complete anytime soon. Typically this will be the
> > > > > scheduler chaining
> > > > >    a new long-running fence on another one.
> > > > 
> > > > Well that's pretty much what I tried before:
> > > > https://lwn.net/Articles/893704/
> > > > 

I don't think this quite the same, this explictly enforces that we don't
break the dma-fence rules (in path of memory allocations, exported in
any way), essentially this just SW sync point reusing dma-fence the
infrastructure for signaling / callbacks. I believe your series tried to
export these fences to user space (admittedly I haven't fully read your
series).

In this use case we essentially just want to flow control the ring via
the dma-scheduler + maintain a list of pending jobs so the TDR can be
used for cleanup if LR entity encounters an error. To me this seems
perfectly reasonable but I know dma-femce rules are akin to a holy war.

If we return NULL in run_job, now we have to be able to sink all jobs
in the backend regardless on ring space, maintain a list of jobs pending
for cleanup after errors, and write a different cleanup path as now the
TDR doesn't work. Seems very, very silly to duplicate all of this code
when the DRM scheduler provides all of this for us. Also if we go this
route, now all drivers are going to invent ways to handle LR jobs /w the
DRM scheduler.

This solution is pretty clear, mark the scheduler as LR, and don't
export any fences from the scheduler. If you try to export these fences
a blow up happens.

> > > > And the reasons why it was rejected haven't changed.
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > Yes, TBH this was mostly to get discussion going how we'd best
> > > tackle this problem while being able to reuse the scheduler for
> > > long-running workloads.
> > > 
> > > I couldn't see any clear decision on your series, though, but one
> > > main difference I see is that this is intended for driver-internal
> > > use only. (I'm counting using the drm_scheduler as a helper for
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
> > >  So any suggestions as to what would be the better solution here
> > > would be appreciated.
> > 
> > Mhm, do we really the the GPU scheduler for that?
> > 

I think we need to solve this within the DRM scheduler one way or
another.

> > I mean in the 1 to 1 case  you basically just need a component which
> > collects the dependencies as dma_fence and if all of them are fulfilled
> > schedules a work item.
> > 
> > As long as the work item itself doesn't produce a dma_fence it can then
> > still just wait for other none dma_fence dependencies.
> > 
> > Then the work function could submit the work and wait for the result.
> > 
> > The work item would then pretty much represent what you want, you can
> > wait for it to finish and pass it along as long running dependency.
> > 
> > Maybe give it a funky name and wrap it up in a structure, but that's
> > basically it.
> > 
> This very much sounds like a i915_sw_fence for the dependency tracking and
> dma_fence_work for the actual work although it's completion fence is a
> dma_fence.
>

Agree this does sound to i915ish as stated below one of mandates in Xe
was to use the DRM scheduler. Beyond that as someone who a submission
backend in the i915 and Xe, I love how the DRM scheduler works (single
entry point), it makes everything so much easier.

Matt

> Although that goes against the whole idea of a condition for merging the xe
> driver would be that we implement some sort of minimal scaffolding for
> long-running workloads in the drm scheduler, and the thinking behind that is
> to avoid implementing intel-specific solutions like those...
> 
> Thanks,
> 
> Thomas
> 
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
