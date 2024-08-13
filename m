Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F145F950CE1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB4710E3DA;
	Tue, 13 Aug 2024 19:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgrH3C4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D530610E3DA;
 Tue, 13 Aug 2024 19:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723576153; x=1755112153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ROis5DL6h9gSvnnBepvWUD1IIIhTabbM47EQ0Ppm42g=;
 b=jgrH3C4FbD9cXFXFq9TsJ9alLEkwoGsekejgXBd81AMUgGHbXxIt6Gok
 ZPxmc6SdCf87xAiPqtjn33p+eEi/n03RYnrHERrNKGp7Sg2dDigq+8mBw
 IwFyfnPDZ0VqsWZ0xR2ayS5mlgkM7ZQcCTQ9qgrW4/kKm7ddK0gE34bN8
 aRJ1fGp7b0UgvTHA5gHBdZuEAdjiZDqONUJ+8yQJpThkMp07MOGHo/je3
 sXM437c0iuoA1L2+m8A6bwqHRcfFSMgklGsjgDzu14vY9Cr1b+QhbtB0A
 qJAoQ/0MVWq8cZMb+bL4NIXkGNfwapDbPkvsDgTdQkcjOoS5PCCeVAMLE Q==;
X-CSE-ConnectionGUID: yZkwH71aRja760jVrmCFug==
X-CSE-MsgGUID: dbQSsK1FRbC5IO5NGyBJew==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="47162564"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="47162564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:09:12 -0700
X-CSE-ConnectionGUID: zFk5wz9PRB+b6d4tUEAmGQ==
X-CSE-MsgGUID: D5ckQiCcR7m6xpSjYyTCZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="89439379"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 12:09:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 12:09:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 12:09:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 12:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H342UkK41lV4cmKGyG05ueByK567I+Pw7geLNiVlNJ6E0JVXF/JVcUdwfkVfYTa5fQGww7gQ9OuxCNycjuKLvXpTyYGyAViAUbXUq6XCRHk71/QPFEP9SAl6wuNpXt5e30tpTso+ENeIpZXv+jTQA4C8QXVYdPnwb2JTcrdZHV5BDDl3LfclHv1a0k0Meg8jmLYaqyMUYhXBeZam16YxFK5O7gI21mwhkCB/oJEUhstv9vSJyWAaRPbaux+rFCkODNTcjOnlJRS2vRI4gpyr7Ei1vlGUQO4xfBBb/XyiamsEhm4rZhZi/rm66gzX5HHuUbHu7DOMx6kPu/sM2z1b1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+x9Io18Jh/NjvvYy1jLUqXJxkrqqg+q7iwVfyN+6oE=;
 b=WMwmSjNgqbOuIdZlGeLyDO2bvA8+x9DXNTiYbgq6wOXXz0mysFpgK/kWe8FWN71RoZQXuDd2NDLBvidlcHq0XaWUOV5rEKXLXEjFyvFzc8svsXEeYAGjqBiBFwvXpDTBfIFz6aTCRBCebRbSVxd3aIEVAkSnbwxcLDlAEwBovhMnnOM8OeEECy8SDlnnLOboq4vO+mzeiCPiXYTZkdzDAQZcVa0Bw7/jftjtnclBQmsmHU9U3jhH9M4rZf2+hRFjzCTHfb1CRC4yS7/VSrBL80GNDdDptLXPkwv+bkcRFhmcjEW8K8VDvjsd/KGA2SBHLnyeCpJR62f/AwJxEWPiHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7770.namprd11.prod.outlook.com (2603:10b6:610:129::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Tue, 13 Aug
 2024 19:09:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 19:09:07 +0000
Date: Tue, 13 Aug 2024 19:08:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZruvEu0BafdsVjSi@DUT025-TGLU.fm.intel.com>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
 <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
 <ZrnRuRGjxHe5zxuf@phenom.ffwll.local>
 <Zrn3QqOvOEW2EYB0@ashyti-mobl2.lan>
 <ZrogDGT326oSUZls@phenom.ffwll.local>
 <ZrrK5yjirbjJQSFL@DUT025-TGLU.fm.intel.com>
 <ZrtpM6ILa0laVR1N@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrtpM6ILa0laVR1N@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c34556-ee45-4c64-ea59-08dcbbcb67cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mUwOHrAyWOBZZLw7nbMtLCecwejq54p2fn8brEVSBSvnSBOUc9QIfqP2UmTa?=
 =?us-ascii?Q?PrCH+pnW9SIr1ZiD5WZfnFs+LPT9+QY4AOn91gRE/dkymnw9RIw6bFOtQUEP?=
 =?us-ascii?Q?MLJHiWxZkYZJ/XbW3WFv7FlX/Mdlkyl2q9Ec/o7lE2zCebh3f6qE+moElDZl?=
 =?us-ascii?Q?Bw5aHPd/0QcLtorRwW3Ziamn6BDi/xLxVN3RW7/1Yvwt1QwybGreezFQW/S3?=
 =?us-ascii?Q?w6sD3wtRW1NZHfJ+4ive65Tysp/zoQg3fOHijA4TRYAncZ5pRsCEkSDLaI2A?=
 =?us-ascii?Q?v2bE7i5rgegtpf08AmP1OygXqNb9tMI1mqxySf0mNJTQYlOU329tEJT5vDqV?=
 =?us-ascii?Q?XGAlDa5XcRq2+pPDRVutt+pxXZmzrW+EjsIgRLGZFUo8OMOpKTr4pKpLcrEW?=
 =?us-ascii?Q?wmvqGt9AG/m1jN1F0IgB5GeyDgRZ8Xptc9//DC8gGVb5/JEA4srSyY+3PCQh?=
 =?us-ascii?Q?N59DdneXH8KZtZaDUr45jOwFLi2b+4SyjVQl1TWvxftB6akzJdvbOOyjb24V?=
 =?us-ascii?Q?7zM4Iu0hXSOqw8qry8iFTl1pCWWUeU8y0Tn78JGPBuNaMsM4uWIadaXD4j8A?=
 =?us-ascii?Q?pAfdMzP8NejQTIUwbPU1riraRO3j30rXxMs+wQoRTen0Dva3llptHEK+U17i?=
 =?us-ascii?Q?+7nK0A9Ov2niSrw8P9S4ybu7Vj+VxfIX9himnbDhVkWwvhb+KOcRO3cd1aV3?=
 =?us-ascii?Q?dkvSVZVHMuNJHE4BSl3VMezm+bBw2B3Sg6bZsxjBEhasKeuHoctiYnRYsjeQ?=
 =?us-ascii?Q?9Vzsq5SGVRHfwmUlk5p8barOgRyh9z+GzdhWxzBSDIEWduaaLozVwB3pRRal?=
 =?us-ascii?Q?3xxwLU3pYO/BRtySLEFSRqwRrgagcHMgLcIzZryU8lPMLJRIMoG4EOYCC1xk?=
 =?us-ascii?Q?7GR4RT5vqB8FCSUkSwnl2WumtGerKJzRMG24500x0WIQB9srmBsYFgWL/oyl?=
 =?us-ascii?Q?aX0QOoj+TLtMvBJ1JHQkcxBp1UHq2x5sksTBcWLTpvkkULu/ny7/ZZGvC1Gx?=
 =?us-ascii?Q?SCcsiw/ByeOs5eaU/TMGhTH0zePzWdRfJZR1em2Gk6xIv5gxoPiNMa+2+K6r?=
 =?us-ascii?Q?RpSln2UvAardObRE12zZJdqBOEhbBS3+10kXwtddN99FUt/AMo97i1Xw33DW?=
 =?us-ascii?Q?oh68ZSxagcTxajGFHJTOT4ZDfFp5Hlj1PSy9NWizbE/fLAoRZA4Ddany507E?=
 =?us-ascii?Q?6YxNH3e4TmrCn5j97SQ41KfN3wSPKohmyw9Fch8Y9pyfLZAfLokgOAMQYo/q?=
 =?us-ascii?Q?B3bxC4705XsRlyz36GY2XOeu7keZl+oX28RfZWs1AmD/EOGyTjGGoP20Y/sr?=
 =?us-ascii?Q?TWA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yWXcNvtOFqEu5GVDHLhM87BKiIiU+PF9T+WJS5rxnJjbzROcFoazj3MdqhEf?=
 =?us-ascii?Q?JyBRJ10+2M6uYn2l7LOTwfJl2EwPw3Jq/mVFXG5P964iw/2WypJXEf4W/6bW?=
 =?us-ascii?Q?fJosSCio5Pm5pKQMMUOJdDua+W/BdK0rKFOwTXXvzc5rSzYMzrEIQgjAZRGm?=
 =?us-ascii?Q?l2rEqhB/zA4nvnn9cahrqYxN3YZaWIWk1EKr79Yin+hUtiu0YQqxKcRTFdtz?=
 =?us-ascii?Q?+MUtwqDAqxdKYL3gxx8ApD2Q0OLm/93TWlsAK8cP2uZAtDBgvlixNH/IrFCn?=
 =?us-ascii?Q?qzQWMvz1HGJ9gnFBMomUb2O0j0UNzxyZtG70aJG4aaAEtyQTdgrZYs67Pio1?=
 =?us-ascii?Q?6cvBJ7UIqQGAPvpVOX2Xn+TXZwtCOZIeOU8Le+RRjm+0qwx9SJUoK4VzsQkB?=
 =?us-ascii?Q?OKRINQQPfDpFgd3LWxUrMy5J3EdyXGXD/jpVKFZkycjQXRYnCZ4HvgNyIicC?=
 =?us-ascii?Q?bkp/jAqGX4/JKCfmnNi0VVSDwHPyJCxw/JXYUlAqyzYosk9FYBm1+A+pIUSO?=
 =?us-ascii?Q?SZ0l3XZ+XOGdzY63+MZrkWpklpCBI+le0aTJkeVCVk8FPFpshoXf2rLdUpjY?=
 =?us-ascii?Q?pZV//ir5/IQnc23QnKaOn4Sk/XymG3fIVYbGXWYi5KgVeMe4VRMKcRnP6P71?=
 =?us-ascii?Q?NrrC/pPwdV2qUV94R7VlFxUpS4iA0MkNxB5Av+shS3HOVd75rjwm3joXlVK2?=
 =?us-ascii?Q?EFvu42+enmTLG6y8KNwI5E71qQui5gCR9WjITLDDTQHXc3sTyajdy8/Qrv3M?=
 =?us-ascii?Q?IB67vR150Qhdn3o8CEtUGIgPp/gGYUOfOv0piIfCjdk72XrkQQg5csYToRzN?=
 =?us-ascii?Q?9UjfSsz9VMRvK62Og/Tp/EZqXRlLes1hE14bRpbr0oxFd8p3eiditBOPwnzO?=
 =?us-ascii?Q?3dPEZv18McUc1rzLt1WzugLMWWYfBusRDzfpAwDbqqld2fi8Tj0j9UdiPtUe?=
 =?us-ascii?Q?s3QkRvAu6XGMDfjPTcSWnGckrLS68pfdN/FyaRZtQBlMIgG+OMyuHSyGk1Um?=
 =?us-ascii?Q?hzmZs1EGpul+rloQDwLd62yV83buqotD8KW4im388FmYuTzBae8ijM0pGanX?=
 =?us-ascii?Q?mN6tuhdWGO20kc4RQwuVDKcDduErg9ATCtol73aHNRX7toTXAW48mQE8hlAz?=
 =?us-ascii?Q?AhdMmmOR26SepdiO8KT3NgSTOpM7SN8yeDtPScBkf4aRjdRHgqNVFzn9/Pqi?=
 =?us-ascii?Q?pcU7leA7ZASf54pErxHbVrT3n5G3TORDfLPWZKZ2d5eRCE9a+XLxAsuETbHF?=
 =?us-ascii?Q?ugTAOclFHcCuG/WlZ7VymAE7Fl8bE5CJQpaFiQb1vrZ/sIV33GqUGJsWhuUB?=
 =?us-ascii?Q?3LPysoQTDGo9MtIHOg9uaG9Cin7cN/zAK9tF6nPVzWs5iVnoPIjlOnixUoIy?=
 =?us-ascii?Q?PpVNy1t1wBvAX/pL5GJMItK2uUE1UND26a+OYycQ2Rp9ZsppaTi5mnLLYMw6?=
 =?us-ascii?Q?ptVWgPu61EtubtW8EsBkNug4fvU1OhhL0rXu0H0CfV6Tk16CJFJ7152R+DcW?=
 =?us-ascii?Q?mXVFAd/LAm1Q+qjRDFonrDxyk7lJPiJg3L+c2h069NjRKyA9cCK/iDmG+l5b?=
 =?us-ascii?Q?pezNzR6Yz+qh9o7836EEKOfvgaHi+mujMiyjqBTV/aLQAPqpfSrbfrUCJRw0?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c34556-ee45-4c64-ea59-08dcbbcb67cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 19:09:07.5121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1gd+0xZafTryZNPnaw5WSKgu4h221rog/YXZp0rtH6ICZa91eqZmd4V+UaXKbFMWGrMzd81Zz9Pc/Erjnx4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 13, 2024 at 04:09:55PM +0200, Daniel Vetter wrote:
> On Tue, Aug 13, 2024 at 02:54:31AM +0000, Matthew Brost wrote:
> > On Mon, Aug 12, 2024 at 04:45:32PM +0200, Daniel Vetter wrote:
> > > On Mon, Aug 12, 2024 at 01:51:30PM +0200, Andi Shyti wrote:
> > > > Hi Daniel,
> > > > 
> > > > On Mon, Aug 12, 2024 at 11:11:21AM +0200, Daniel Vetter wrote:
> > > > > On Fri, Aug 09, 2024 at 11:20:56AM +0100, Andi Shyti wrote:
> > > > > > On Fri, Aug 09, 2024 at 10:53:38AM +0200, Daniel Vetter wrote:
> > > > > > > On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> > > > > > > > This patch series concludes on the memory mapping fixes and
> > > > > > > > improvements by allowing partial memory mapping for the cpu
> > > > > > > > memory as well.
> > > > > > > > 
> > > > > > > > The partial memory mapping by adding an object offset was
> > > > > > > > implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> > > > > > > > Virtual Memory mapping boundaries calculation") for the gtt
> > > > > > > > memory.
> > > > > > > 
> > > > > > > Does userspace actually care? Do we have a flag or something, so that
> > > > > > > userspace can discover this?
> > > > > > > 
> > > > > > > Adding complexity of any kind is absolute no-go, unless there's a
> > > > > > > userspace need. This also includes the gtt accidental fix.
> > > > > > 
> > > > > > Actually this missing functionality was initially filed as a bug
> > > > > > by mesa folks. So that this patch was requested by them (Lionel
> > > > > > is Cc'ed).
> > > > > > 
> > > > > > The tests cases that have been sent previously and I'm going to
> > > > > > send again, are directly taken from mesa use cases.
> > > > > 
> > > > > Please add the relevant mesa MR to this patch then, and some relevant
> > > > > explanations for how userspace detects this all and decides to use it.
> > > > 
> > > > AFAIK, there is no Mesa MR. We are adding a feature that was
> > > > missing, but Mesa already supported it (indeed, Nimroy suggested
> > > > adding the Fixes tag for this).
> > > > 
> > > > Also because, Mesa was receiving an invalid address error and
> > > > asked to support the partial mapping of the memory.
> > > 
> > > Uh this sounds a bit too much like just yolo'ing uabi. There's two cases:
> > > 
> > > - Either this is a regression, it worked previously, mesa is now angry.
> > >   Then we absolutely need a Fixes: tag, and we also need that for the
> > >   preceeding work to re-enable this for gtt mappings.
> > > 
> > > - Or mesa is just plain wrong here, which is what my guess is. Because bo
> > >   mappings have always been full-object (except for the old-style shm
> > >   mmaps). In that case mesa needs to be fixed (because we're not going to
> > >   backport old uapi).
> > > 
> > >   Also in that case, _if_ (and that's a really big if) we really want this
> > >   uapi, we need it in xe too, it needs a proper mesa MR to use it, it
> > 
> > I looked at this code from Xe PoV to see if we support this and I think
> > we actually do as our CPU fault handler more or less just calls
> > ttm_bo_vm_fault_reserved which has similar code to this patch. So I
> > think this actually a valid fix. Can't be 100% sure though as I quickly
> > just reversed engineered this code and TTM.
> 
> That's the fault path, which isn't relevant here since you already have
> the vma set up. The relevant path is the mmap path, which is common for
> all gem drivers nowadays and the lookup handled entirely in the core. Well
> except for i915-gem being absolutely massively over the top special in
> everything. i915-gem being extremely special here is also why this patch
> caught my attention, because it just furthers the divergence instead of at
> least stopping. Since we've given up on trying to get i915-gem onto common
> code and patterns that's not an option, and the reason why xe exists ...
> 
> Anyway that common gem bo mmap code code is in drm_gem_mmap and still only
> allows exact matches.
> 
> Unless I'm completely blind, it does happen :-)
> 

Not blind.

> > We don't have IGT test cases for this in Xe though, we likely should add
> > some if mesa is doing this.
> 
> I'd expect they would fail ...
>

Just wrote one, it fails.

So agree with everything you are saying. Sorry for the noise. 

Matt

> Cheers, Sima
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
