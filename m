Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8D69511DF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 04:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F9710E2E6;
	Wed, 14 Aug 2024 02:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKd65tYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E991810E2D2;
 Wed, 14 Aug 2024 02:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723601393; x=1755137393;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F/pfNlf+IAk4qlBhv1ZvrLnIh/vKJs5OwS9xlU79vDo=;
 b=CKd65tYy2WP9LGTIU2xaCJuD4VsY73z+uGKLIP8z4u396xt3BZLeyRAV
 xD3VB6zpTmxKcWvMyuVagBbs4MuZep0NJXNijuhPFDvlUvGybf7VaU4IE
 +npI/NgeWddaHwGuJT/f5SBxoCE5c34LkUCxSPETZJWeA2k09g4NzftXd
 ito77s7K32daGTNiKLtvl3F5JlCiAID4S6SWLqXQjjECyvwnMHSa1sjzx
 NGKAI9UFqSd1SrhSVkAI+zU0QuH0JLVYuYoEUvFeSNcFZjWLWmJu/oQjx
 pZyxb6RAqqMgBQuwlcoBpRXrVPn/ZBAjRqz9OASUuYg/zwlx2JSbZm5KT w==;
X-CSE-ConnectionGUID: B4wgvPgTR+6rW/y+b7MV6A==
X-CSE-MsgGUID: 7MqwJKMwTiCvaCTJfFCs8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21437396"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="21437396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 19:09:52 -0700
X-CSE-ConnectionGUID: xP29DnCzSd243EAAs28L2A==
X-CSE-MsgGUID: 7wZHfgYtRkaSM52FVudN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="63517468"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 19:09:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 19:09:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 19:09:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 19:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZnNqyXIChj63QH8VnyL3oAp0LifeLoinr8ukiLu2/NTm2WU7U/BUgSeKNfgHdAMtN4xSdo5TvXvqUC2w8ZOVKY9AHbfRabbGuuhYcT5orobiLCFRbL9m+mU+0E0s1bPfiQOkXgAcIGJuH4+lvfz+Vy79GcyAHcqU9xCdyPWKZcPZQLBKxe1Yc5NlWVNMwBnuYbSiv9LGCCTWCzxvsvTImZkLvSJqnUmciBPAuNZhncje89qQWucd2weSAqDGdqUV/ZDW1soXbtRddH1gnOd+IQ9c5fTMtITDNoxfkKKrpWKVrbzKV9dbGrGuMCLaQq6UeUrFohxkHgpgewqIzyKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfiCRKdeWQrqx7z2F95wcCbvjrQ0YD1WQUhP2vz7m34=;
 b=JNc9oGo/yZquI/dYlbryAZLMdjExuFI5rd6if+HQruYKmvEbsywCEVXnNoz8MX3EGS0fnSqZ5kLT1SzKvyLyhJmQk62UtDY1n7AStDpP8xFkZ4Jz9wuTbWxhTZQqCg3Wt1vHgMlfXTmRTXJWIs8MpTAx3b74cqdCGmymlQVN0HOd4sSNtO0oVJysTM8SsujDtvDYiwPpsVvn79LTWkSGiP1LtKJ8992bIg7Yvkr77LRaOP5f+ZbnU5kJq8O+dJkNz98Srh5oefhYLNK1aVme2i52kh9WYXn7BoMkRmXWWFqQAuWrottEB/CmCVlvIVyWWFwjGUQFYmeCTZ0UyRUmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5874.namprd11.prod.outlook.com (2603:10b6:806:229::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Wed, 14 Aug
 2024 02:09:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 02:09:48 +0000
Date: Wed, 14 Aug 2024 02:08:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZrwRsXT3gu3WgjCe@DUT025-TGLU.fm.intel.com>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
 <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
 <ZrnRuRGjxHe5zxuf@phenom.ffwll.local>
 <Zrn3QqOvOEW2EYB0@ashyti-mobl2.lan>
 <ZrogDGT326oSUZls@phenom.ffwll.local>
 <ZrrK5yjirbjJQSFL@DUT025-TGLU.fm.intel.com>
 <ZrtpM6ILa0laVR1N@phenom.ffwll.local>
 <ZruvEu0BafdsVjSi@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZruvEu0BafdsVjSi@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: b378b47e-1d23-43f5-18c8-08dcbc062c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2fiOQjMHWvpi+m/npbp9gKrJvCCmiriSBVMFXUChHBFZbkxjrQ7kMXtbzcDR?=
 =?us-ascii?Q?+omuO7Jqn3eMAqMhXszkCigLa+5pOEq+WUCi/bMjQ4q4FnhMfHVgluQayYVi?=
 =?us-ascii?Q?4zEPl3EQj1hm1C41r5y9vc74og4lqgnzv504kq1cVUzQL+MycpYUbjRYqm/L?=
 =?us-ascii?Q?SMtW9agP+PIfZS24rCSYt9FQuCMn/hXGHvIzBsa29Dt3XGzcGyu7iGIV3mph?=
 =?us-ascii?Q?wGts61sO1x/krgtZuKQeWZBKI8AJhzhe/nbR9b7edjhYf9D9g5rA36d1cJgN?=
 =?us-ascii?Q?CIWYE/Mh0VrciVPFLBytlIo6TdYfWELVq9170gu7OWOXRkgiqXsqGTzPHMF2?=
 =?us-ascii?Q?fuyEkDcxKIWb2I++Td3RDCTlgp1V23X+Wo8OIatLoszNPBxrEOvVRm0YjV80?=
 =?us-ascii?Q?gLJoxpT4T6OVAWYfzhUMbTJCSU9hlJ3kAgf3dYb0Q7SadC6NTugENdyKWV1+?=
 =?us-ascii?Q?Kihz29r8tZYcDhdDsjpKL4EFqSGqAlHlpD4YMVEUX+5DduBUSogHeiNQEiuB?=
 =?us-ascii?Q?bTa5RW43SLk46YLeIKZ541QFpMidG1+5Igv052mLPeQDWRh3CPJ7ApjaoRP1?=
 =?us-ascii?Q?onkPdxvTxl6fjqHfUiVS2baVIyTScHGMkHzwHAPGBpR5ouEglkJw1iOs2O78?=
 =?us-ascii?Q?jJETCgIH65Puvz57TO/RxuD4rA8/umPORtpoxbUuTpntuMf/4gjYqf4x9nBk?=
 =?us-ascii?Q?UpBRFiT7fggxL+9xBGKyCrEJQV4Em5yyRcDXVqoNC/G1Uevpwf/NXkbqEluP?=
 =?us-ascii?Q?8iMxIzXBQgpJtjYSj9xO3wEp+axU+WzutJxDzMnByn8s8HC9/WziD3UXE3PP?=
 =?us-ascii?Q?47pTsgks/1x2SHUDdjwh9ONYXyVpKDoQ0xucBDRQG30RflClGR323W8UgR5b?=
 =?us-ascii?Q?xVZFf7CStLiKhmTB/iI1hcXPHhhBxl8iuA0VyJUg0JpcxkSXUWdpzlz0uicv?=
 =?us-ascii?Q?zyXzzRhzASbm6BogM70Hygx+0Kx79Osnzb5H3ixK3ilRUyV6AmG1YvYQqfID?=
 =?us-ascii?Q?zpaK2xJe00zr3LMFR/YvEPDgR6Ja6g0gZWq3zGyXo0VhRGiq8SvEohCi14o3?=
 =?us-ascii?Q?sOV4dKWjKIifXWE46T6F9zWvqWGpkDHSsapLuEVtbVKqf72+WvCeSig09T/b?=
 =?us-ascii?Q?HgV2pZsGAtSxmQEd6nrSQzJ5FzVbgqtBJVnDGLRRBjB+62Syu3ziu5Ad8nj1?=
 =?us-ascii?Q?v707DteqQgPwGDnLKkTRviib0QEYRlJiaRHAFIrXf29N6xTF+X6hEk7OuoX2?=
 =?us-ascii?Q?mzh0r4ZbfM8X5S72lSJboYSV4UVMhEqBWYMW6dItldo76ZJjIUY5YoWoNcDn?=
 =?us-ascii?Q?pF4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qsYJ3C3aeb09rnSKkVz7h3euOGaN2JHQ4CMcxpB1HMuEmpYkY8p5p6qfmzWP?=
 =?us-ascii?Q?0UFjTCqIKU4ztyLc1GMuFE2OkfVcKZ/M1zB6fyfHH02JweRWdP4xZZp9lasm?=
 =?us-ascii?Q?QuXMapFNWf7UNoGV1Y18RJZLGybpinSb/zMqMZuHRyEz7uhqh/AnZU5fTbJP?=
 =?us-ascii?Q?RiYgb7QhNjExD0qtTsYMtDir0KiIAE22lCB9HgwHJE6ovFkhFYIroAVLsoK9?=
 =?us-ascii?Q?fhaRVaaGw4xOpyvw2P2V7cd7ZudYc5n+kVVK9qZQzPCzmopPVnr9KvydDaVw?=
 =?us-ascii?Q?4OGLpYOkpDBLA+u//IvYIcitTwksYrd1APekWUfjfatE58Yn79jBWOMFRIF+?=
 =?us-ascii?Q?RHUcVCWdswpXD9pdIOI/amivHrPf4W6i0/67TT8BxQqjShLXj8AA3F0TCY+q?=
 =?us-ascii?Q?Kq0LjUqU1ptcsrbzCn6E28B1QlRVGTp8IX+MHqr0TJoYBujNvRwcU2wrB9BL?=
 =?us-ascii?Q?GK0rPIkwUgTf3YKLAYp1wqx1MnyHu892o71NuyrVYVxH3CsdJ9Vo7kzwuTrt?=
 =?us-ascii?Q?SlYrJNJ5DAJbg2+WwJPtkCrzhC5p30XOASfvCb312TYz+BDb7hmQ1N9TFc01?=
 =?us-ascii?Q?DUD9Fv+PB4QoLusk2G3FWokqifSl63D6hOp+HFG6C89DwP1aOLZ1Ju0BBUbF?=
 =?us-ascii?Q?M8Rm8or8UROwWapxqMzoZaQoD710ZILaXSf16VJGOMOwIG+QQ0uQ2RePvgVA?=
 =?us-ascii?Q?MOlouOWIFsLvIFmyIz1eVkPtFx7cXafh5zt9y/z9zsFz2olPGwHqg8NvJUiX?=
 =?us-ascii?Q?kGAR/xhFS30/I+TAl/6mOrclJUcu1EBaY9zBLLPv6sJ2NJSV/GmkyM2d03kU?=
 =?us-ascii?Q?0lyRDG2jBd2pba+4djaAVeWJz79PfWAxBGow+KHUwpRoe8amZxz24OjPVRUp?=
 =?us-ascii?Q?+DmhoUL+Rs1QOZWsLiG2sAwm4MMBtoYD3uR0ltoxbcJJvYqH8PiSjJiqmyMv?=
 =?us-ascii?Q?D9nGhkvOrFPEkH28ysLjSfu5OEOllPOkThT2GpZZoNzKbC0Bo3rhGZAiSc2H?=
 =?us-ascii?Q?ZNv2OZKPfJg8yVrFvg81NC8YqpjgZcP8zbzUlG/HtMaARXtxZblj5pwz/wNu?=
 =?us-ascii?Q?81iDaG4N6fvXa1S8YjzNs8YcCHDU5UylbJpqIzNnJ2qR06NE4zkt/ijBAIzO?=
 =?us-ascii?Q?zUpa9fWE2Z2Qr/aEbzTkX8y2aiX/zFtJ2XqvhG53a3JQ06KIxmewl+6Rs/GU?=
 =?us-ascii?Q?BismnFsoMZDfkB4wpUuhYcnGYLnUHbU7Sds3jNKAZph7HcycZJv+YiqCEB3Z?=
 =?us-ascii?Q?3UgdYH0WBc1wAkCiRmqhrF4XuvSTyJRUh74qJXsdfOz/2aMLVJRyKQsS1Jf8?=
 =?us-ascii?Q?G4NnhHTlkXhxstXL9xqhEqr6tIPYJNnmU+IhEHLmr+/+xxLdF5E2UueooA/u?=
 =?us-ascii?Q?Lpdd61d8eKrUjucAD6L61c2rZOzcK1iS7FOeRVSSDzknCANvXceYWjbNQIQy?=
 =?us-ascii?Q?yKWMayy6BsvM5SIIk9GxPCdmBkgjTrsAUDlTnwho/HXM10sa7nowMDNG9vLP?=
 =?us-ascii?Q?ZZt8nXWen2J53sunpCoWrMtRSobG5fmAGuljxIijkPUBTrxnTJoALTL2S4tA?=
 =?us-ascii?Q?mnLmMbWgdaexwjrxdJ2+kAsQKJLpL8WziAblloWmyt38LxNDp7S4d6Z0ymAv?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b378b47e-1d23-43f5-18c8-08dcbc062c7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 02:09:48.3441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddIg61q4yhOnKMQ+PZL823d3de0ct96s7ZfnRX0+YioGkLDbEuSNWjaajrm+R3ZExhxQe41J5g63l0kW8VXMwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5874
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

On Tue, Aug 13, 2024 at 07:08:02PM +0000, Matthew Brost wrote:
> On Tue, Aug 13, 2024 at 04:09:55PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 13, 2024 at 02:54:31AM +0000, Matthew Brost wrote:
> > > On Mon, Aug 12, 2024 at 04:45:32PM +0200, Daniel Vetter wrote:
> > > > On Mon, Aug 12, 2024 at 01:51:30PM +0200, Andi Shyti wrote:
> > > > > Hi Daniel,
> > > > > 
> > > > > On Mon, Aug 12, 2024 at 11:11:21AM +0200, Daniel Vetter wrote:
> > > > > > On Fri, Aug 09, 2024 at 11:20:56AM +0100, Andi Shyti wrote:
> > > > > > > On Fri, Aug 09, 2024 at 10:53:38AM +0200, Daniel Vetter wrote:
> > > > > > > > On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> > > > > > > > > This patch series concludes on the memory mapping fixes and
> > > > > > > > > improvements by allowing partial memory mapping for the cpu
> > > > > > > > > memory as well.
> > > > > > > > > 
> > > > > > > > > The partial memory mapping by adding an object offset was
> > > > > > > > > implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> > > > > > > > > Virtual Memory mapping boundaries calculation") for the gtt
> > > > > > > > > memory.
> > > > > > > > 
> > > > > > > > Does userspace actually care? Do we have a flag or something, so that
> > > > > > > > userspace can discover this?
> > > > > > > > 
> > > > > > > > Adding complexity of any kind is absolute no-go, unless there's a
> > > > > > > > userspace need. This also includes the gtt accidental fix.
> > > > > > > 
> > > > > > > Actually this missing functionality was initially filed as a bug
> > > > > > > by mesa folks. So that this patch was requested by them (Lionel
> > > > > > > is Cc'ed).
> > > > > > > 
> > > > > > > The tests cases that have been sent previously and I'm going to
> > > > > > > send again, are directly taken from mesa use cases.
> > > > > > 
> > > > > > Please add the relevant mesa MR to this patch then, and some relevant
> > > > > > explanations for how userspace detects this all and decides to use it.
> > > > > 
> > > > > AFAIK, there is no Mesa MR. We are adding a feature that was
> > > > > missing, but Mesa already supported it (indeed, Nimroy suggested
> > > > > adding the Fixes tag for this).
> > > > > 
> > > > > Also because, Mesa was receiving an invalid address error and
> > > > > asked to support the partial mapping of the memory.
> > > > 
> > > > Uh this sounds a bit too much like just yolo'ing uabi. There's two cases:
> > > > 
> > > > - Either this is a regression, it worked previously, mesa is now angry.
> > > >   Then we absolutely need a Fixes: tag, and we also need that for the
> > > >   preceeding work to re-enable this for gtt mappings.
> > > > 
> > > > - Or mesa is just plain wrong here, which is what my guess is. Because bo
> > > >   mappings have always been full-object (except for the old-style shm
> > > >   mmaps). In that case mesa needs to be fixed (because we're not going to
> > > >   backport old uapi).
> > > > 
> > > >   Also in that case, _if_ (and that's a really big if) we really want this
> > > >   uapi, we need it in xe too, it needs a proper mesa MR to use it, it
> > > 
> > > I looked at this code from Xe PoV to see if we support this and I think
> > > we actually do as our CPU fault handler more or less just calls
> > > ttm_bo_vm_fault_reserved which has similar code to this patch. So I
> > > think this actually a valid fix. Can't be 100% sure though as I quickly
> > > just reversed engineered this code and TTM.
> > 
> > That's the fault path, which isn't relevant here since you already have
> > the vma set up. The relevant path is the mmap path, which is common for
> > all gem drivers nowadays and the lookup handled entirely in the core. Well
> > except for i915-gem being absolutely massively over the top special in
> > everything. i915-gem being extremely special here is also why this patch
> > caught my attention, because it just furthers the divergence instead of at
> > least stopping. Since we've given up on trying to get i915-gem onto common
> > code and patterns that's not an option, and the reason why xe exists ...
> > 
> > Anyway that common gem bo mmap code code is in drm_gem_mmap and still only
> > allows exact matches.
> > 
> > Unless I'm completely blind, it does happen :-)
> > 
> 
> Not blind.
> 
> > > We don't have IGT test cases for this in Xe though, we likely should add
> > > some if mesa is doing this.
> > 
> > I'd expect they would fail ...
> >
> 
> Just wrote one, it fails.
> 
> So agree with everything you are saying. Sorry for the noise. 

To be clear what I agree with:

- Xe doesn't support partial mmaps, if the i915 / Mesa needs to support
  partial mmaps Xe needs changed in step with the i915 (it is a 1 line
  change in drm_gem_mmap which then will a community ack too)
- We need IGTs for partial mmaps in both i915 and Xe
- The Mesa use needs to be understood ensuring this isn't a bug on their
  end and this actually required
- If partial mmaps are actually required, I'd like to see this in 6.12
  for Xe as we are about to remove force probe

Also thanks catching this Sima.

Matt

> 
> Matt
> 
> > Cheers, Sima
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
