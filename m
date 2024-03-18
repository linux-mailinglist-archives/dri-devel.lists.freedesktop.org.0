Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC187F0B2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 21:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8AF10FF70;
	Mon, 18 Mar 2024 20:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROiOltkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC9010FF4C;
 Mon, 18 Mar 2024 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710792035; x=1742328035;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tt6JwU0vR5aKGBehnhi8ZXzkiy37W2F81Hq+oMBII+s=;
 b=ROiOltkH/FFEg4W+D++q1+uw9UlPYug5yTH9HMKNROSQ4t+cMJIVekts
 4dM06CuDkdwC82XYmnbnstn1zrOBstZl0iFR/+zUgwsQozj+6TjG5b8WL
 QulslinIP1vSlfr33SEsPzdZUWhDITmW5kAbdUyBc1+DbHyQYV8LBiSGK
 jZMynvW7qxbcs+xyal9qW56HCkiqIxCDfxYm7bDTAWmaLJHGEJiDGneZT
 9xOlBYcV0kVAz7TGRWA4Ufzy1KH77VshpXCEF/NDKsZCPzPndCZp4Iqj2
 Hx3inXRgGirqu5T+tzniIx5FpYYkXtDrfWE1497aYC1nVoFG852J8JYHc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17029353"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="17029353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18307059"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 13:00:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 13:00:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 13:00:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 13:00:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 13:00:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4Iuqvr2Lm8ocVQJdLYE0j3OsIXYZF05sf5ANn36eWGMCst3T+JLDmbUPC9nHHOTzTOk+GSPPJ4fOqK5Owa65zp7opGrQ2tfVc+pFNceJT+7iHmNw/AJ+TOIesmMTnugZnMkbaR3mzferXmi/vOcuhdrjotxwsgM8Avr1S/hq5l5yJ/cgKzgSciHTPwqqnmJcqlwPlswGvRq7fuAlzYfdDStjH7L92r5gZpgzy5vL6dD8UHG7GWDNpi/K2IReX88enWVG4nTPTD3LOqcelrk2/t6PJDoJeQytyDXNVVH0nfmyZ9jMhOQtZDblefqX1Eb/mQ9VbbHFfPWmKJpBzpN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KJ5QYlRrfGGE6TGH08zh2D5at+H0ComBATuFuwtIJA=;
 b=lwDPL3pFmNEJG61ufeocQxFKQpYggUmfagyUhahcF6/0qn10vkfud/0qj+KVChI9sFe/+Q0MofMSa4PrwrGv8SULQiDN5iza4yzEEXLeaMEe6kqQyTuVZefKah+XVbLApE+lj8Wi/Hsols/ZwBUCj+qaaysA2H86P6Idt3muZNdr9QnIXM14uyzArQs610r3QS/psannz+N0T69qq59A2Q382bhPfZs5SLBV4MUzaBJj41Xot6UdY7bvIqEyMjBnDfd1PMe2ui8qNT0pCU8T8Rk8nYmgnFDV+sbnyWQ2LGxSQY8xnlyHkMQORCFmw6bfgaju5OC+sf+Hb94VzoM4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8261.namprd11.prod.outlook.com (2603:10b6:806:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 20:00:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 20:00:29 +0000
Date: Mon, 18 Mar 2024 16:00:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Reset queue_priority_hint on parking
Message-ID: <ZfidWNb369Cs0XJF@intel.com>
References: <20240318135906.716055-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318135906.716055-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8261:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k69m0QhvuXhK59x2hGTC8fnofIEfHGhsH+okswlL61jzES0HQ4b9zTx1n2PvmMXm2lc8uyGd+8W6sRjj1cimIkcasVgRVOeo/R4ank7+ywx9eYB2ppveLznEHQveSBod9c3jSIjrO1a/KGmaUZSMtHwQ+fN83M6XqplSvaOzgyy/7NFwUpUg+vUv5ImwqSMzz3eh7Z2JhcDVhePHWbJ1ShlEESK4Bhnc84EWcbiJadPO2/z+0C2BUH2Hiw7zZY/MvFH6oqK8dfsVnYnFy7X2lx9vNvBEm15Rv3oC06Ymms6MZBHfF2loepjPLgU4QLH/rq4VBrOgcwx+7X1HzMOlUFDIWenSHPW0u9zi3AqB6l2lteSh5RYyGIQUC9tBNfbxe513RSKhFPctJ0tvtQbeGZjMfT+6YTfyY9dNP+NOS7qXwRiWF2uUcBBA/8JpNaP9CptaWXdtphnqxduJrERxc4DvenSzbwwvbBZuQNmye9yhk9GR+Co8ia9hIie9Vrm9TRHfSo+VOBTVivygny4TW9FRzUG4pKokcNsX8llLDTXqMz/03VclJbVx/Ev7ep+SY7SvqE3bvm4GZGP4C94YDymffH3RAFp5/AHc82liJoY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lw08kleb8BvI6uytdao8p9mzQJwuf8f9J5Cu9v0bz/Af4/5PW6Qytayv/qgQ?=
 =?us-ascii?Q?QXugZn7U5nl1uElXVYEzOCKIz5SEU1JSQrnQKSToRVURw1PGO1fBjfqxO1oH?=
 =?us-ascii?Q?m383xZPJIAT0tJ6HWYjE0KTh4oURPBGl9FLM0hgKAyBpJvpCpA4OyLCoEzzE?=
 =?us-ascii?Q?1Fwps6/NYJprPHiLMohV+MLYd5iqdE0O7/Eko/pRBIqqBTlmMvichO86FBR/?=
 =?us-ascii?Q?BZkdqVU+2ft/g3f/mHJq7c9ZrYrfVqqSoI1SUsLAr9Z0P+tkC3ppWUJNE2Mh?=
 =?us-ascii?Q?zLeQS+L/MmFKWhCd3aKG18HxT25i8MpxgJ4saaM1YVeiLzqHz52sKIldPWpy?=
 =?us-ascii?Q?k9htAMysFquazsccqJ8kTNm+sPXzOiJqSFoSYSZp94YCuoEuDQRd3ccVAVw2?=
 =?us-ascii?Q?/0C4jo7KLoqkYFVADTvlEWOQ0Y0ZI0wYGVBbb4WJWiGZfnOpf8TukLozu0um?=
 =?us-ascii?Q?1q/cbC0QKNhrBk6LboVHBGxvGtSFdq8lG+Vsy5Zwp8diUGmIhqdKxczODTUF?=
 =?us-ascii?Q?0BuuVZclpiHhDM8fC4GRo4x32NUCc234yIcQ/nDJvkU1caW8OEkssVERQzyD?=
 =?us-ascii?Q?Phbk1k8jnIEMWjNqBBXccGCZ17OT/KtwxSFzNg/XcBPM0+VxYBB5QPml3/ad?=
 =?us-ascii?Q?OMwMRlN6k53nYFitajtJkn9EUIbAAUhznn2+SBXNHr/ajljneJQeeqmP5lId?=
 =?us-ascii?Q?a3Bn+SpPM4+3bXAaOQ7CF++VR7VL/YaXIe1dW153TJ+VhYB9a9PvnsoGu/ja?=
 =?us-ascii?Q?GLJZvF194pBENezNnAst8/BibOTDYXQD32Lltx0cLeiK3+MHxKsUmXQhejsm?=
 =?us-ascii?Q?JkCHO/GrjWHZPe9s3e7ogJIb390J77FCUH/T78lCW0BucS+/EwyBfFq393PU?=
 =?us-ascii?Q?ute5HoE9RXcAb6RERj499IOfhto8NGIzLnfdT+k8SAUk0dOHSOsSoJhnnRKp?=
 =?us-ascii?Q?lSXx5s6Y1EjUOYoLkMyHz6w5iGOgdbealLre9FNE9+Og2cNSi8mErm0aV/HB?=
 =?us-ascii?Q?dpw+Je1MyRq0gGSW/8tWhzxZyqQzOuJYlRc1Y+i3mSFqluJVYoIuOiVl4gKC?=
 =?us-ascii?Q?eW/eHkf9GyAJ0oTXkdwjzPHW93NgoKHH3Ar6WGnc3Asn6AdlxW9QznHlVuCY?=
 =?us-ascii?Q?vGxKGBnLK8rZYohpBRXhHO00oYfw7HrluW+Gf/x40IFbsTi3Ea/UXKMJsGDP?=
 =?us-ascii?Q?oInxxHHrBZ8SGzQU6ZIY4GaRiNKQn6D7T3380I/LBdBt5H003O5K5NrgzvJe?=
 =?us-ascii?Q?2nzecOeVLZzHxtoXPZVifkQkpNhkBkFa4Tb3S7MOe/7ZxutbAB1K6W8+nG/j?=
 =?us-ascii?Q?oyCYv0M6xkm8YMH/8ZfhSWQl5y4xoBEbiZEjkRKQK8BR5Zo+UYKzeiug3rGW?=
 =?us-ascii?Q?6/RXGqduO9sMwoHAVCktvKwgdXzJWy7Z3O75m8GJ8ROuxmBwZQNAS4FDgJna?=
 =?us-ascii?Q?Oh0JY8yV+QMsObDikX0N+OHx660v9zs1IXfn61fRLF4RyP8+BsFplP3JXYGv?=
 =?us-ascii?Q?rmU00sBs94AFPh0EdBXgWzaZCfjBTQFpm2qPNoLnOB5c2yk10mtQdP1OhP6Y?=
 =?us-ascii?Q?DW+yIAk6acvYRhAGWe7sdvra7xvBUNP77DLF1rLy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21baee3e-5849-4c3d-c86f-08dc47860f9f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 20:00:29.6342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtGHLmgX1gck9zbHyavrhwR3j4V2VH/g54UFnMFvIKZcOyg9iRDgwvS1WUiIMc/AE2c863VJlcsdVaqvO2FhNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8261
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

On Mon, Mar 18, 2024 at 02:58:47PM +0100, Janusz Krzysztofik wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Originally, with strict in order execution, we could complete execution
> only when the queue was empty. Preempt-to-busy allows replacement of an
> active request that may complete before the preemption is processed by
> HW. If that happens, the request is retired from the queue, but the
> queue_priority_hint remains set, preventing direct submission until
> after the next CS interrupt is processed.

perhaps we are missing some intel_engine_flush_submission at preepmtion?

I wonder if there could be anything else we might be missing
with the lack of the flush.

> 
> This preempt-to-busy race can be triggered by the heartbeat, which will
> also act as the power-management barrier and upon completion allow us to
> idle the HW. We may process the completion of the heartbeat, and begin
> parking the engine before the CS event that restores the
> queue_priority_hint, causing us to fail the assertion that it is MIN.
> 
> <3>[  166.210729] __engine_park:283 GEM_BUG_ON(engine->sched_engine->queue_priority_hint != (-((int)(~0U >> 1)) - 1))
> <0>[  166.210781] Dumping ftrace buffer:
> <0>[  166.210795] ---------------------------------
> ...
> <0>[  167.302811] drm_fdin-1097      2..s1. 165741070us : trace_ports: 0000:00:02.0 rcs0: promote { ccid:20 1217:2 prio 0 }
> <0>[  167.302861] drm_fdin-1097      2d.s2. 165741072us : execlists_submission_tasklet: 0000:00:02.0 rcs0: preempting last=1217:2, prio=0, hint=2147483646
> <0>[  167.302928] drm_fdin-1097      2d.s2. 165741072us : __i915_request_unsubmit: 0000:00:02.0 rcs0: fence 1217:2, current 0
> <0>[  167.302992] drm_fdin-1097      2d.s2. 165741073us : __i915_request_submit: 0000:00:02.0 rcs0: fence 3:4660, current 4659
> <0>[  167.303044] drm_fdin-1097      2d.s1. 165741076us : execlists_submission_tasklet: 0000:00:02.0 rcs0: context:3 schedule-in, ccid:40
> <0>[  167.303095] drm_fdin-1097      2d.s1. 165741077us : trace_ports: 0000:00:02.0 rcs0: submit { ccid:40 3:4660* prio 2147483646 }
> <0>[  167.303159] kworker/-89       11..... 165741139us : i915_request_retire.part.0: 0000:00:02.0 rcs0: fence c90:2, current 2
> <0>[  167.303208] kworker/-89       11..... 165741148us : __intel_context_do_unpin: 0000:00:02.0 rcs0: context:c90 unpin
> <0>[  167.303272] kworker/-89       11..... 165741159us : i915_request_retire.part.0: 0000:00:02.0 rcs0: fence 1217:2, current 2
> <0>[  167.303321] kworker/-89       11..... 165741166us : __intel_context_do_unpin: 0000:00:02.0 rcs0: context:1217 unpin
> <0>[  167.303384] kworker/-89       11..... 165741170us : i915_request_retire.part.0: 0000:00:02.0 rcs0: fence 3:4660, current 4660
> <0>[  167.303434] kworker/-89       11d..1. 165741172us : __intel_context_retire: 0000:00:02.0 rcs0: context:1216 retire runtime: { total:56028ns, avg:56028ns }
> <0>[  167.303484] kworker/-89       11..... 165741198us : __engine_park: 0000:00:02.0 rcs0: parked
> <0>[  167.303534]   <idle>-0         5d.H3. 165741207us : execlists_irq_handler: 0000:00:02.0 rcs0: semaphore yield: 00000040
> <0>[  167.303583] kworker/-89       11..... 165741397us : __intel_context_retire: 0000:00:02.0 rcs0: context:1217 retire runtime: { total:325575ns, avg:0ns }
> <0>[  167.303756] kworker/-89       11..... 165741777us : __intel_context_retire: 0000:00:02.0 rcs0: context:c90 retire runtime: { total:0ns, avg:0ns }
> <0>[  167.303806] kworker/-89       11..... 165742017us : __engine_park: __engine_park:283 GEM_BUG_ON(engine->sched_engine->queue_priority_hint != (-((int)(~0U >> 1)) - 1))
> <0>[  167.303811] ---------------------------------
> <4>[  167.304722] ------------[ cut here ]------------
> <2>[  167.304725] kernel BUG at drivers/gpu/drm/i915/gt/intel_engine_pm.c:283!
> <4>[  167.304731] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> <4>[  167.304734] CPU: 11 PID: 89 Comm: kworker/11:1 Tainted: G        W          6.8.0-rc2-CI_DRM_14193-gc655e0fd2804+ #1
> <4>[  167.304736] Hardware name: Intel Corporation Rocket Lake Client Platform/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
> <4>[  167.304738] Workqueue: i915-unordered retire_work_handler [i915]
> <4>[  167.304839] RIP: 0010:__engine_park+0x3fd/0x680 [i915]
> <4>[  167.304937] Code: 00 48 c7 c2 b0 e5 86 a0 48 8d 3d 00 00 00 00 e8 79 48 d4 e0 bf 01 00 00 00 e8 ef 0a d4 e0 31 f6 bf 09 00 00 00 e8 03 49 c0 e0 <0f> 0b 0f 0b be 01 00 00 00 e8 f5 61 fd ff 31 c0 e9 34 fd ff ff 48
> <4>[  167.304940] RSP: 0018:ffffc9000059fce0 EFLAGS: 00010246
> <4>[  167.304942] RAX: 0000000000000200 RBX: 0000000000000000 RCX: 0000000000000006
> <4>[  167.304944] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000009
> <4>[  167.304946] RBP: ffff8881330ca1b0 R08: 0000000000000001 R09: 0000000000000001
> <4>[  167.304947] R10: 0000000000000001 R11: 0000000000000001 R12: ffff8881330ca000
> <4>[  167.304948] R13: ffff888110f02aa0 R14: ffff88812d1d0205 R15: ffff88811277d4f0
> <4>[  167.304950] FS:  0000000000000000(0000) GS:ffff88844f780000(0000) knlGS:0000000000000000
> <4>[  167.304952] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[  167.304953] CR2: 00007fc362200c40 CR3: 000000013306e003 CR4: 0000000000770ef0
> <4>[  167.304955] PKRU: 55555554
> <4>[  167.304957] Call Trace:
> <4>[  167.304958]  <TASK>
> <4>[  167.305573]  ____intel_wakeref_put_last+0x1d/0x80 [i915]
> <4>[  167.305685]  i915_request_retire.part.0+0x34f/0x600 [i915]
> <4>[  167.305800]  retire_requests+0x51/0x80 [i915]
> <4>[  167.305892]  intel_gt_retire_requests_timeout+0x27f/0x700 [i915]
> <4>[  167.305985]  process_scheduled_works+0x2db/0x530
> <4>[  167.305990]  worker_thread+0x18c/0x350
> <4>[  167.305993]  kthread+0xfe/0x130
> <4>[  167.305997]  ret_from_fork+0x2c/0x50
> <4>[  167.306001]  ret_from_fork_asm+0x1b/0x30
> <4>[  167.306004]  </TASK>
> 
> It is necessary for the queue_priority_hint to be lower than the next
> request submission upon waking up, as we rely on the hint to decide when
> to kick the tasklet to submit that first request.
> 
> Fixes: 22b7a426bbe1 ("drm/i915/execlists: Preempt-to-busy")
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/10154
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.4+
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c            | 3 ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index 96bdb93a948d1..fb7bff27b45a3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -279,9 +279,6 @@ static int __engine_park(struct intel_wakeref *wf)
>  	intel_engine_park_heartbeat(engine);
>  	intel_breadcrumbs_park(engine->breadcrumbs);
>  
> -	/* Must be reset upon idling, or we may miss the busy wakeup. */
> -	GEM_BUG_ON(engine->sched_engine->queue_priority_hint != INT_MIN);
> -
>  	if (engine->park)
>  		engine->park(engine);
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 42aade0faf2d1..b061a0a0d6b08 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3272,6 +3272,9 @@ static void execlists_park(struct intel_engine_cs *engine)
>  {
>  	cancel_timer(&engine->execlists.timer);
>  	cancel_timer(&engine->execlists.preempt);
> +
> +	/* Reset upon idling, or we may delay the busy wakeup. */
> +	WRITE_ONCE(engine->sched_engine->queue_priority_hint, INT_MIN);

maybe better to leave only the scheduler code touching their variables.

but no big blocker and this code seems safe and the mentioned bug,
so,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  }
>  
>  static void add_to_engine(struct i915_request *rq)
> -- 
> 2.43.0
> 
