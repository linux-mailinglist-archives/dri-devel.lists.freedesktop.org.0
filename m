Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0E07566FD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 16:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1810710E273;
	Mon, 17 Jul 2023 14:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3910E26C;
 Mon, 17 Jul 2023 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689605980; x=1721141980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+5sdg4L4o9lN19oZp5SNJ8hveenAkZAztlIic/ceuQE=;
 b=VsKdHCXrUKHBBEF1ShXkCXPnneroCHyShMGFeT2jPBy49UOaY6+AWiu5
 gyeDqGPNZOSbZjgVVNyEkXxmWbltrFxCNm9kVslaS3kocki2VoWVP/aYf
 9uqIZBqv55TJNdYdzYEIVmW/ehYif2H/dl2ku2HYq+BxfB/1HCU7OPSKR
 ur7/XnWOMN9rdK5p6Rvvk/yLNZpsraX7ShfK+9oCtDBbNr0AXlYr9c4FX
 ggNYak18bPZVz9HJUiXY4KkItwQMcUep9Um2Ovn0gsWL1mSveCYCxCcwd
 ESQql5zmQX31Vg+RkA6C8VE/MdyLAO5BVAPAEhyOddshX14BkeFbeIkPF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355886295"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="355886295"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="700517094"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="700517094"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 17 Jul 2023 07:59:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 07:59:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 07:59:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 07:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb+fbdL8e5awuFU+h3QZcaood6xvCiCY2AVI/0nZfudhrk2GRhqc0pWcWn/fTEphvYQzwC4UTGZBaYLBC2kAD+jFFXaR7MGD03vVHtHk0eqcfY0FHqmRJTanIQwmER+EFkbsEUdLBdO9inSJimGECd1csLDm59vP6b7wNE+LUmD/0S3vVVdGoDqiMvozzwQdQDepfkTcoxFi8wOZldsn2ZZak/y94C4E40PWWtA5ce5jtY1aj+1STG3bJ99i7d4YhB411/Y7i9IUpghAt4E5mg48ID82VwW5623xAZTI7zz9i6+u9oc+bmYtRiXkBY9mYVZ2v0D8J5b3jta1lvV89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYMwSoEWmhxrIiGTHEl0nJSdHL27gYEqKbyZgnbHVa8=;
 b=PbSjjARK1dBJmZCDHvQeWRQhbKxOPwXmmj6njgLboIXqzloFOqts17CkwQUXdUAl4hyzs0OPAXVcgMivp5H0zEPpELWkUE1CgINHJ7NO2Mxh2k4tZHrZ4Zg2melmjKuYU1DRSwB5joCVTH+Q5qqrcxGAXmJXjDxspGYkhfMXjrNCVs5oNqe1mYH3elGs21YLThz1iLV8sTgo6LTdCt4kXjPz6ebU7itEERtqTvRKFJZYVTpWPz7qihGkiDeeDK3GY7wNqd13kqzb3o+P4cF/bm179Xtlp6ShfVkaiQWaUG6jGFwu4HHW4/qp12U12HEvvDwswpEvreHGKCO2InTvfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4561.namprd11.prod.outlook.com (2603:10b6:5:2ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 14:59:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 14:59:36 +0000
Date: Mon, 17 Jul 2023 10:59:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] drm: Spelling s/sempahore/semaphore/
Message-ID: <ZLVXUlZJO/cuT4Jw@intel.com>
References: <8b0542c12a2427f34a792c41ac2d2a2922874bfa.1689600102.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8b0542c12a2427f34a792c41ac2d2a2922874bfa.1689600102.git.geert+renesas@glider.be>
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5bf78a-436b-417e-97c8-08db86d66f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzB8LXajxGB7OP6oSg4ZQ9wyah/A+kSX2q/YBVzzN8/jaNsR49Zhx7y3YnzpVpwrnMj0lSdqTfWLxR+zxfRYLqnp+9Tq2kvM3qemu3Ir3jF7ZZ8FzawtdGegQujglvvlV0nJJBGGxrNK4WcxJGAGephClmvr9CbOvRIp0ML8QNsSm67Vx/TvmjPPaUnvnAJBY0SAiGvcp/7O0XD025OP9UUjty+Ey//vH0SaDH34gb0XkOYOOnPHs88wdBckGK+j6UF7QBwo9Q59J5ggzwXLrBEZZYJuNdHjVMKNtvYQK7h1hJF8ZGKo6LHhgfxGskwtoKEZ4xObGRahPlK2g7hLW8zrjy/ApX2YlKF1C+R9MZOz0HTvjyIRmrpbCwNRPvnXU9GnVTeKSGJJu+cW6TWWlnGpOCSrwO55rEvgl2xcVUb+YtvJgUktxG4plau/7KMVpDRrBbgKulDSGfXdA4R9EyfnEYJDFgNKc2bITphoVnItpGN+0tuXlPUnu8BMxZw9aOPN3fn1KpKDjDwaiHg0LypJAVp6Az6HQVLPT3Tk8i0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199021)(86362001)(2906002)(36756003)(44832011)(966005)(6512007)(186003)(83380400001)(6506007)(26005)(38100700002)(82960400001)(6486002)(6666004)(54906003)(316002)(66556008)(66476007)(66946007)(2616005)(4326008)(5660300002)(478600001)(41300700001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EladRS7q1FGM1Lsnsyjmg7+XfN/OJ2ME7vWop5VwN6PxYK7jJu0d33APX8Ei?=
 =?us-ascii?Q?3gUBDGGtOG5g+u7+oZ/3EUMq/qzusOStjZyOQtgXU1EuFAgu+Q75wuI3Ddvh?=
 =?us-ascii?Q?CU7ArlXjMhUPAGo372uszFQHXswRZlbw6kozd5fB9Pi1EGpZDQCzwuei35V2?=
 =?us-ascii?Q?UtLqkelADeWGeIrZO7xOBgJEs4YBj4y7bgfCw0P3+N9MRNFkB3lSqzcdeWMX?=
 =?us-ascii?Q?KwiBMHv2f8yThk7lXAZl/danUiSbIy2r6IXh8/h68+8wKDDKqR0hHQzYz2iU?=
 =?us-ascii?Q?H9mS8ABzGfIM/3+q1Mn8MA+6fFA3jfxxI32s5j8NsC0Tm7OzTDdCNDIMqS4R?=
 =?us-ascii?Q?z74Iqdaz3qLke8cljTeqPFJ6YYfH5JD7TUGflqQuX330eY3H1oEs3EovNiOl?=
 =?us-ascii?Q?wskg03jTUlo05OnMmx1AZP4SiaFNwXdiVACDrcmoMaeCnIM/NnKrboV05Myb?=
 =?us-ascii?Q?7ucfLGwrPMiD7pfAdkkkQPjvScGnbXcmhBSN6Z+0NObdscpiyXL9ZKqk+c+I?=
 =?us-ascii?Q?aUvxSZP8+/zIYPpg5HOGqpxW6gLB8pa8RAPPT8IkV9pRX+mNxggqvasp4jWm?=
 =?us-ascii?Q?PZ2SxBGbUXqZf3Buw7EGjzFoMAAsPZiZkDW0yxll43PrL7eNi+6zNcAMfoJ7?=
 =?us-ascii?Q?obx+tU59v/EB4DYBIdEWkrDZZB3eyF+I/1hXzUtlY/l8ywReGMgA5nBsGMW3?=
 =?us-ascii?Q?1np6bPkWu8GMPuwrdKbhyUxAVwmma6KZudYZfGA1hYegXOQqFL5a+C3AUwhb?=
 =?us-ascii?Q?8hIKtnwJ1y5zwJpOwDW4fhtTIJVOdsUk42T1vUylcahhnKxSx2DziesdgvOe?=
 =?us-ascii?Q?0JVpXalfVNj6+ZGtCdP62rs4cGM5mxwcuamWoP6UBrPBBmc4nzixn+WaY4uC?=
 =?us-ascii?Q?y7GPoSVMixdzvRvW2IuxM6YcNDPXRvLWkNmlDoI3EtQHYWP4IUpSbi6eaMxF?=
 =?us-ascii?Q?sfCgQYtMcea4sBYN+HToFxn0MopfElznOwZjnQtKN2Cz4KhwRFwy+oB29WUU?=
 =?us-ascii?Q?pS7Gav9FJEGVEwgSSwayiTdvQ0epU9wIX2ZlaKRD8bkDp78ze3qfOdI+cyML?=
 =?us-ascii?Q?mM7KShmQD9boEuqe8KjfEW4h6Ww8BeSjeAJQff+sm/PkFnGD2IcVO4cX8vao?=
 =?us-ascii?Q?RmF0zxAmUr7s/Dr6zhfCMceXXy2narUnXDzMBbFLRohnzHciqUcZ8KcEmDZ7?=
 =?us-ascii?Q?9QMhY1RBhDUAxWtnNjkyy/Ia0J2JlOMFJ2ljH9KRMJToix0Uvj0DNUZ9f3Jk?=
 =?us-ascii?Q?opmhuyGPNCgiScHtGUgnhPOYUpIJLJP14pDzp4mqAB+yLOlhMSZY8ng3ie2O?=
 =?us-ascii?Q?Bva3kJcPnnymWcPAke6SjxoVqmZ93Rtuu0KarzR2XHc7nnaeoOeT6Ofrl6AO?=
 =?us-ascii?Q?pbSBCiwqFWo3+ToNLOqB+XmPdy6tXHGV+qaD5GweKkrVAW/QjSaJTNHOFjTr?=
 =?us-ascii?Q?eBf1d/a/xOvx3T8yEzLZZR1k4eRJ7p6x8Jo+DxGV9dxz3KH8ggqqeeS9yaFM?=
 =?us-ascii?Q?wiAAzKHsVOhxhpYx6cxV41HgaQVoLmAfREorpg3goWPt+456anKw+3IL+7br?=
 =?us-ascii?Q?ID+vjjp930xhKUH1b8t5nWb4jIZlEASe31UdCOh9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5bf78a-436b-417e-97c8-08db86d66f9c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 14:59:36.2725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l31kFh0DvdK06BR7n2znWN3MrbzkvMOHGrUwP85PO42Y2pUGuN/yD4gk+eAhdYN9Scs0a5WlG2dCYkK366j9KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 03:23:20PM +0200, Geert Uytterhoeven wrote:
> Fix misspellings of "semaphore".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  drivers/gpu/drm/i915/i915_request.c | 2 +-
>  drivers/gpu/drm/radeon/cik.c        | 2 +-
>  drivers/gpu/drm/radeon/r600.c       | 2 +-
>  include/drm/task_barrier.h          | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 894068bb37b6f1b6..32323bb801a139b7 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1220,7 +1220,7 @@ emit_semaphore_wait(struct i915_request *to,
>  	/*
>  	 * If this or its dependents are waiting on an external fence
>  	 * that may fail catastrophically, then we want to avoid using
> -	 * sempahores as they bypass the fence signaling metadata, and we
> +	 * semaphores as they bypass the fence signaling metadata, and we
>  	 * lose the fence->error propagation.
>  	 */
>  	if (from->sched.flags & I915_SCHED_HAS_EXTERNAL_CHAIN)


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

to take this through drm-misc

> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 5819737c21c678d3..5d6b81a6578ef2ba 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -3603,7 +3603,7 @@ void cik_fence_compute_ring_emit(struct radeon_device *rdev,
>   * @rdev: radeon_device pointer
>   * @ring: radeon ring buffer object
>   * @semaphore: radeon semaphore object
> - * @emit_wait: Is this a sempahore wait?
> + * @emit_wait: Is this a semaphore wait?
>   *
>   * Emits a semaphore signal/wait packet to the CP ring and prevents the PFP
>   * from running ahead of semaphore waits.
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> index 382795a8b3c064ba..a17b95eec65fb810 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -2918,7 +2918,7 @@ void r600_fence_ring_emit(struct radeon_device *rdev,
>   * @rdev: radeon_device pointer
>   * @ring: radeon ring buffer object
>   * @semaphore: radeon semaphore object
> - * @emit_wait: Is this a sempahore wait?
> + * @emit_wait: Is this a semaphore wait?
>   *
>   * Emits a semaphore signal/wait packet to the CP ring and prevents the PFP
>   * from running ahead of semaphore waits.
> diff --git a/include/drm/task_barrier.h b/include/drm/task_barrier.h
> index 087e3f649c52f02d..217c1cf21c1ab7d5 100644
> --- a/include/drm/task_barrier.h
> +++ b/include/drm/task_barrier.h
> @@ -25,7 +25,7 @@
>  
>  /*
>   * Reusable 2 PHASE task barrier (randevouz point) implementation for N tasks.
> - * Based on the Little book of sempahores - https://greenteapress.com/wp/semaphores/
> + * Based on the Little book of semaphores - https://greenteapress.com/wp/semaphores/
>   */
>  
>  
> -- 
> 2.34.1
> 
