Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74982576F65
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F087112AC6;
	Sat, 16 Jul 2022 14:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B25610E05A;
 Fri, 15 Jul 2022 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657916896; x=1689452896;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6hr0AO+ycGUSP0um2EOi0OroHtHaNKxXRJ5jIcs2tC4=;
 b=nCktzDSlEAyOSX2h3Fe9Axbc7t6TPirL/qSBE3JoS6lF0enHP3aMrJ+0
 w2ytTI379mZm3cdjqe5RGSNuIn1BNjzt4iTGt7RdfZ+xUtpK9jBmKItaX
 81Apg3TaBTSfkcvNDTZHUfDUOKpGVOioLN+mUL9XvPDThZh7RHH5iEHeX
 qyH4oOZ3hhM5MJjfCZkcC3QkAYIhqmEoxEhE48GBJdG/BhLS5w6ZL9NAf
 lqzOlh5MR581GurYVCc3MfVpoi93zbpeWWIPGuK+Mwsai/rSh9b4RmSM4
 ZZRDjXDxg8w8NlIwnskVha2fh5qD5xUP2GXcQHXUsvwkF5RvcTgT0Pwda A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="265683151"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="265683151"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 13:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="686092245"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2022 13:28:16 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 13:28:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 13:28:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 13:28:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLmrUQcOJyVjW8lZdZpCzmQE2cezDSpQmXbsSMF/ZtwP2WILBQVUlpAexfljZtUVxsUKq4MChYMPprpmAvQkAVM1Fr1jTVsXb7y539Yzz+CI/Kl6DcvBmRuqdTG4kkKblLb4XfnbasFdDk6/nLgXXiFR7cB9BWV49filJ20C2RKX5B8xpkdBhZvMUfKzW6W7EcyQjXRjnA0FxDulkaf3jx8qPVafYY2dby8oojfabcjbX7vSu1nFGW4jypUvu3SEDYbeJNFvr/dB6FBYdIF1bMDLYJj/HokNchufs8Ft6sibJm2/wcsCY5BmCQVuYPn7wCkxTMUwqHsp+ZQMpwMR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6MkzIb0AF/v7r+ys38ErG4ZlGG44pjc1wGf2kab0+g=;
 b=XJ/XAVIkmGEnEsED1/kRib4QWcV9LvW951mgz5jSwRbo33APl3vdRR1ZIu4QYg78aZ5KbmxaUY44+vhjzfKLpB3+moAAdFnd0kC+WvhJ6pxHBbQrtioYIey13EyGoDOqbHlEr005jHyXdJH8/f0R2pALJ89KjUNlj6uJC9LAFIhfOIKfUBwwdAkz+Php2Zdw1uiHHgZO/xwoS92FL/mx8/eCMA1hRpLxNGmclvEStjiJztD7raMInt0BKRuvlrUybtWypX4GPuxDajRhBxh9vjIwlah/dbVMdxZE7qqlx/biXsT7N2c3bSnYnAjX3KVYqfYzruD0xYuZMdOE1R7TmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN7PR11MB2724.namprd11.prod.outlook.com (2603:10b6:406:b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Fri, 15 Jul
 2022 20:28:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 20:28:13 +0000
Date: Fri, 15 Jul 2022 16:28:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH RFC] drm/i915/gt: Retry RING_HEAD reset until
 it sticks
Message-ID: <YtHN2ZXvpuIWYBpo@intel.com>
References: <2378da383d043de17172d928e59da0ec423cae76.1657873550.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2378da383d043de17172d928e59da0ec423cae76.1657873550.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa7013df-9b10-4572-c311-08da66a08a6a
X-MS-TrafficTypeDiagnostic: BN7PR11MB2724:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DNRP2qK5OtjUQKc77OgM53g+NNNIWM3an225MLl1EHbJ41UlI39uLHfKFebS1DJiE7eWsG2pdpJTIDiBd0mD0VA1OXx7FIPd5thhLcnIIHice9w30wNw3nw0tPZ+qH98XTxvYd2GCGTkiKE+fnai8FVXGKjmg3IXJ7f7OIrzVmPins4uIJzA1odz8gOAAp1dCCNtYGPs3uWRpNSbynO4KvgSmZ14lA/6NtFGiosgfdwxIdXR2uaThhZYH3c1wWv4RF/faMYOOMH8qwBD1K/1MNxBeOP1dkZuMf1iuT7OCj0ekY7FGJdnePph0Y3BHV19xoeO8o6j8FecdcP0vd9mpJAVoEx8Y4JOxKWg+dYINMFpHTYbNf0ww2UxrWIeB1hEHOKvGipqQq5l4qDsNc/X/TYNb6muJQsAQBLBnuPR+cc2KbXnXEZNOI+jqwACl6bpFz2c21F8T7LYPEeTRRiOe4Xh6SEzS0jWakRYdco12Hlbf8kvOP8XegjJRl1In8k1gBsBiffB7d+tf0evdiBM2Nz3Z6exmJDsmRv5+X0CIrS02d2Vb2yiMNTnZlV9kAvHsDmQx2cissjOBvZwuH7HRXpgmeNg5VLx6yokHU/vPHPyvhHlaPAODyZ9pRkjM/xtEp1Jk2yl8DaNGhgGaTbwTBTjLPRV3uFpOhdMlAm2wpSh1NwMN3+fnJYTcLPi3zNlibowvfGUyaQaPLcpQ8k2OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(396003)(366004)(39860400002)(376002)(36756003)(5660300002)(38100700002)(2906002)(44832011)(83380400001)(8936002)(82960400001)(2616005)(66556008)(316002)(8676002)(4326008)(186003)(478600001)(6666004)(66476007)(66946007)(86362001)(6512007)(54906003)(6916009)(41300700001)(966005)(6486002)(26005)(6506007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3mfqARPYdSjzQ3rapdH6tA4ZricKmYSPErs3rJ8FPpGz/zy9CRgZ2IVhOomB?=
 =?us-ascii?Q?MRO8ooYakiFKgIquAMW6LMUaHT4JfVzTC0Z8ragpj1RxrHPTPLWq/k7fMhMx?=
 =?us-ascii?Q?/ZG/L9T+YjB7zdoqK/WTQrVMcx8zUjOcNGWr8tVZ+WJIpb4j6sKWR+tIMijb?=
 =?us-ascii?Q?3WrfFX0oWjPpxQR3j/sSWJMG5F4yhS9GsuftpR8z1pqWphwpJhns1iGclVNe?=
 =?us-ascii?Q?1Sblaq9Km79+NMeaOsWnmLXDGhwi+Fp/sN39mV3tZWZk9Squx9pc0PTjx0IV?=
 =?us-ascii?Q?7f4geirUPAmGYoHmAJ7dxaZeOHvYI3uIadr1a2/u4gATgCn/kDwDKOFVs0Vo?=
 =?us-ascii?Q?TnkjhQHLu4UW1hbhmBewI44OajdaEbdEIuZX4g40Th5/sIFqh4oPPx84sjd5?=
 =?us-ascii?Q?pIYwJ3C6VodLLMEi97691ihxcEJoWOvkUYz93EnHNa1WRFmszI7KkyY+dSIf?=
 =?us-ascii?Q?m/+Z5VZz7o8ONBonQ3Ad/yDW0aoAwp3nmbb7pMzIctrXLMkR5bxiS2xWcLaX?=
 =?us-ascii?Q?qqqfo0yVvYXn1xi1+Ob3KIi3c6NLJOXbriOUtyhKYOQy2sa23bLFTBBmFSwi?=
 =?us-ascii?Q?NYp8J7WSKrrAz3wQ/ZmJCYMphkNxcFeQtiN/Pp+eP25fez9MhqCeBgwvm4OQ?=
 =?us-ascii?Q?gkrJJhmYW0ZEu5grmC3ZRrDt1ssjtOxaitJkoGB8MoRwAPJuTxrPDNb7fSsF?=
 =?us-ascii?Q?3VsDsrmIuO3Tea+wN1rTyLn4SYZ8UNQAriFTaBeR7BdtrsmFmJsrMRef6RyB?=
 =?us-ascii?Q?8Alh+RTstqo+Db6Wu6vk0+GpkLXSD/SGG/mydUjHAXhnn0IVWLo64ryxau6r?=
 =?us-ascii?Q?t30ww3OcUMm9NnKEZlS7K86yc+kwdhnc/eJc4k33JLrbqzJoo/cvwvGoQdU5?=
 =?us-ascii?Q?G005JhlM9EAPELrZfVJtFcnEt87mgzB0Rm4Mv48RH7vsoVvqFCWeFcp4zMvy?=
 =?us-ascii?Q?omnG5s6HBbsVRtp8UzI2rqmCx8EC0BrzJYu6eCsrH3Ags5RlRncVh0KIc+zc?=
 =?us-ascii?Q?PaHG/oVJWObB3EW8NRkag4+gJBWuEgvwMAIOfyqPzD1Ag0nyGsw/PMLYJ/ON?=
 =?us-ascii?Q?mmrmVdNbT/oQ0QD1rE1Eo90ArVGMgv9EbkHP+Y56MGgXVQT+EMCJiV+v4zZy?=
 =?us-ascii?Q?9qckA1h+bb8uiT6x+bXNaMOEzOBsMgXkr46BFto2DDSbyHKmBhgNb68k2Jh3?=
 =?us-ascii?Q?7laX9lmkfJ1+V4rpdSo4Ysiju9/pGC374B2iopgqQMNtrvaaUR4lXka54/8A?=
 =?us-ascii?Q?uolzJChxkCbpPqXbb2afe/4npaP8n0mCD9ENbiRgkdmts+/cemzY/FnhMd13?=
 =?us-ascii?Q?i/9Mu9TZg/dzO6r1EppWbgV+bPfdiMdk2McMR5D7hk6O45Xx/FRYQ9GIp5vf?=
 =?us-ascii?Q?vgckLAOFxtVo4SmrFii2mhtXqdxna4RMxH/4xuxOBov78vpHMkrnaWiJ1nRx?=
 =?us-ascii?Q?FH4C6iLoUgaY/1tHHs4vADJoha4KduhfYXH3AJuDt6nqRLaLRvLjl6xDS/g/?=
 =?us-ascii?Q?8JcnNm7w5g28lDngAMi9DnVu523BXARCnEG0HF5quSwAmIJYyEpwe7gkyJCh?=
 =?us-ascii?Q?tUT1cizVsV7QW9O31kqF3iJ88Z80suEnA39mTetpmRwEw/NWOtlyWpdeGRoD?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7013df-9b10-4572-c311-08da66a08a6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 20:28:13.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElML3heDenoy386MVqL64V0dzCwEGGgsMyAi0Mh96JM0KDk17v84DVdCJT5WYQNfUU3dR3mcZrqUMcvXLAliWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2724
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chris
 Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 09:26:16AM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> On Haswell, in particular, we see an issue where resets fails because

Can we then make this platform specific?
Only because some older hw doesn't behave like expected we shouldn't
make this a default & global workaround.

> the engine resumes from an incorrect RING_HEAD. Since the RING_HEAD
> doesn't point to the remaining requests to re-run, but may instead point
> into the uninitialised portion of the ring, the GPU may be then fed
> invalid instructions from a privileged context, oft pushing the GPU into
> an unrecoverable hang.
> 
> If at first the write doesn't succeed, try, try again.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/5432
> Testcase: igt/i915_selftest/hangcheck
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  .../gpu/drm/i915/gt/intel_ring_submission.c   | 44 +++++++++++++------
>  drivers/gpu/drm/i915/i915_utils.h             | 10 +++++
>  2 files changed, 40 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index d5d6f1fadcae..cc53feb1f8ed 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -190,6 +190,7 @@ static bool stop_ring(struct intel_engine_cs *engine)
>  static int xcs_resume(struct intel_engine_cs *engine)
>  {
>  	struct intel_ring *ring = engine->legacy.ring;
> +	ktime_t kt;
>  
>  	ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
>  		     ring->head, ring->tail);
> @@ -228,9 +229,20 @@ static int xcs_resume(struct intel_engine_cs *engine)
>  	set_pp_dir(engine);
>  
>  	/* First wake the ring up to an empty/idle ring */
> -	ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
> +	until_timeout_ns(kt, 2 * NSEC_PER_MSEC) {
> +		ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
> +		if (ENGINE_READ_FW(engine, RING_HEAD) == ring->head)
> +			break;
> +	}
> +
>  	ENGINE_WRITE_FW(engine, RING_TAIL, ring->head);
> -	ENGINE_POSTING_READ(engine, RING_TAIL);
> +	if (ENGINE_READ_FW(engine, RING_HEAD) != ENGINE_READ_FW(engine, RING_TAIL)) {
> +		ENGINE_TRACE(engine, "failed to reset empty ring: [%x, %x]: %x\n",
> +			     ENGINE_READ_FW(engine, RING_HEAD),
> +			     ENGINE_READ_FW(engine, RING_TAIL),
> +			     ring->head);
> +		goto err;
> +	}

commit message mentions until this point I'm afraid... everything below
(except the new until_timeout_ns) looks like a different patch to me,
or deserves some mention in the commit msg.

>  
>  	ENGINE_WRITE_FW(engine, RING_CTL,
>  			RING_CTL_SIZE(ring->size) | RING_VALID);
> @@ -239,12 +251,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
>  	if (__intel_wait_for_register_fw(engine->uncore,
>  					 RING_CTL(engine->mmio_base),
>  					 RING_VALID, RING_VALID,
> -					 5000, 0, NULL))
> +					 5000, 0, NULL)) {
> +		ENGINE_TRACE(engine, "failed to restart\n");
>  		goto err;
> +	}
>  
> -	if (GRAPHICS_VER(engine->i915) > 2)
> +	if (GRAPHICS_VER(engine->i915) > 2) {
>  		ENGINE_WRITE_FW(engine,
>  				RING_MI_MODE, _MASKED_BIT_DISABLE(STOP_RING));
> +		ENGINE_POSTING_READ(engine, RING_MI_MODE);
> +	}
>  
>  	/* Now awake, let it get started */
>  	if (ring->tail != ring->head) {
> @@ -257,16 +273,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
>  	return 0;
>  
>  err:
> -	drm_err(&engine->i915->drm,
> -		"%s initialization failed; "
> -		"ctl %08x (valid? %d) head %08x [%08x] tail %08x [%08x] start %08x [expected %08x]\n",
> -		engine->name,
> -		ENGINE_READ(engine, RING_CTL),
> -		ENGINE_READ(engine, RING_CTL) & RING_VALID,
> -		ENGINE_READ(engine, RING_HEAD), ring->head,
> -		ENGINE_READ(engine, RING_TAIL), ring->tail,
> -		ENGINE_READ(engine, RING_START),
> -		i915_ggtt_offset(ring->vma));
> +	ENGINE_TRACE(engine,
> +		     "initialization failed; "
> +		     "ctl %08x (valid? %d) head %08x [%08x] tail %08x [%08x] start %08x [expected %08x]\n",
> +		     ENGINE_READ(engine, RING_CTL),
> +		     ENGINE_READ(engine, RING_CTL) & RING_VALID,
> +		     ENGINE_READ(engine, RING_HEAD), ring->head,
> +		     ENGINE_READ(engine, RING_TAIL), ring->tail,
> +		     ENGINE_READ(engine, RING_START),
> +		     i915_ggtt_offset(ring->vma));
> +	GEM_TRACE_DUMP();
>  	return -EIO;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..717fb6b9cc15 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -256,6 +256,16 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
>  	}
>  }
>  
> +/**
> + * until_timeout_ns - Keep retrying (busy spin) until the duration has passed
> + * @end: temporary var to be used to track the spent time
> + * @timeout_ns: Maximum timeout, in nanosseconds
> + */
> +#define until_timeout_ns(end, timeout_ns) \
> +	for ((end) = ktime_get() + (timeout_ns); \
> +	     ktime_before(ktime_get(), (end)); \
> +	     cpu_relax())
> +

why do we need yet another timeout macro and cannot use any of the existent ways?

>  /**
>   * __wait_for - magic wait macro
>   *
> -- 
> 2.36.1
> 
> 
