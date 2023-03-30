Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647726D090A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685C210EEC5;
	Thu, 30 Mar 2023 15:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3B10EEC5;
 Thu, 30 Mar 2023 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680188737; x=1711724737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NyqYXy+0yjiNSnF5Uyf/8PEL6Swi3G6OhgmBE9uKwTQ=;
 b=URvPdzm7KaUAQzRN+9HJpwQ1OFhq4HUJ2MRuVeoKv4rWLcQCOIe9h5tM
 OJlhnhI6dNSy79w41892c0J67b8Iajqt9QOsAQjL724/JfS1XOOBELB5b
 ZXNzKCjUfZ95Dm/HkzIJmx3N9aEe8LXg56F84hFIjrd+tWlAOaNdY39aj
 1NnYLeEdAZchITVQbMfIFW718IznZovnfgPwpnnNpz80Ao1/z2Jjq3Wao
 6PVhzfDYqOVW114n9PIbJhnmMNT2+qKGu1NP4CC4cRQlSXmj6T5th+M47
 XFdP2Kzwqga5sKOtMtMa26vOZDTBL2OX0M9hQzXbEIKarfYM3pzEEhr+l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="338691667"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="338691667"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:04:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662052743"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="662052743"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 30 Mar 2023 08:04:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 08:04:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 08:04:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 08:04:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVQEWT/p34Lrukr9wQbk56bD9ek6G5WqX3bLOLJ8zmz2BGcTnjRBmuYdTZwPDnIwS6do7MnUwCliyR+/xGVN3Mz43BnmmCDGcWCCWj7/YfpN85mYs2RQOg8MFzBXxiG8NmSq8J3GBhBBFeYETNOn08IsYcPu1Mgo18VT27rQuuRVTEoLt2lIfKWZ9TwKEiOqxhWC7rDUsP5sRPNaE+1I9AYkPdZNFxWbGPFXP4EnOHNO58830r+ZTnuR1npnQUAoOZmqX9lvRXaIHW/zAU72aenH6z+UL41RyJHJMwblvlyHClDIS6tJymEI8xUif2xBs1tppl9CWyYsb6PeRM9wDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oc5vIazPJ0gWkW59oK9vUaf3Br1nHNAd7Fa1tTDyCjs=;
 b=b9vFx59KHIGeu4c26EI3iOwqyQ1G4fODdAhD1QZWeWEs/vxe6+N4P3NyyP2zZtfXC99V4f9Djcf7MVhO4IU4UOJOFlF8PTMreOU5xNC8ZAyRUHIhvcpHqcP1Vfb0t8HF+n0Pfbd4l7EJq1n1V/gSUFh9gEEIJc1iACYbdboPwFR3FqnjGB8rmqoxzZOF7eA0VOakf9Wf2amtLWOSuR12oiSRT8ImEtXf2+PchWLKvm+pGwJohwj+LBO0M/yrRoJqnEnIvsOiAVm2lKd6Vv7dxW43KXOImzgYPLPzJmoaYyUML7PrhoVcgHxOtS6EqquPD6MgIZH6xNF9TcXmNE9nwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4946.namprd11.prod.outlook.com (2603:10b6:303:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 15:04:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Thu, 30 Mar 2023
 15:04:04 +0000
Date: Thu, 30 Mar 2023 11:03:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Hold a wakeref for the active VM
Message-ID: <ZCWk3Wb2eMpN9dw0@intel.com>
References: <20230330-hold_wakeref_for_active_vm-v1-1-baca712692f6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230330-hold_wakeref_for_active_vm-v1-1-baca712692f6@intel.com>
X-ClientProxiedBy: SJ0PR03CA0287.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7f5a44-da30-4f7a-83a5-08db31300064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XVeAnZ7/Di3d6jK5uuAXXQ5tilpH3AocD4HUg4X+a5ZbcnKVaG+DdpkTM/0iRyQuhm167hXA+GvqNw3c3g5FK2N+xcB00BNNoqk4dT/LushQUVkJg5VIRIbjV2wMBab8yX3LcUWBwtsyVdTu4ST/aS28tT1fBxb8YABDz9wOR+9j9QJN6jWVIhSJCBneh7xyzeENP6NpCJUSfCy9+mGCKHnXUC3aA0KqsQciYHxMTKQS/ggjmvsI12SLhwJ3EHYhRQd3P/g0ZAF33XbXL1sgTX5+pT/6lmsDXOg/zb7g2iUagF3C0oBswFfCkcLvCTB8HwMfxk6ZpNTylR3Bv6ODDBmksohioyKW4pxqCJjfj4MawUlE0AO2HcCSH0z40CWZYowOYulskU++znsXoBYEzppdQW/7R8PM5kloT6XIaDhEyu+lgTp7vognddN0CmqwX/wYkaw0IVQBnQbxuDRYSpKZe1uICAaHEOkERtTMBQ67iJ9ZeI53Il9Ln9OyfTzln5B+RWKNkqIvhB24Y3w47BHULaWGXR+82sM+i+8eJvMnQCAYs013esG22Y7AljUr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(66946007)(38100700002)(86362001)(66476007)(66556008)(36756003)(8676002)(37006003)(5660300002)(186003)(6862004)(6636002)(83380400001)(7416002)(8936002)(41300700001)(2616005)(478600001)(6666004)(6486002)(6506007)(6512007)(54906003)(26005)(316002)(4326008)(82960400001)(2906002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C/HQ373cG9kdhr0q6KV9xf6HEdnJDq+WwXjiJGdK0jwb8crl2w7jP47lYoxY?=
 =?us-ascii?Q?It+xWRenGI+zF9H/MfCMsVsDoEkPIHbJ/U74tLZR9ShZ4qKS32cAZoz5DMxR?=
 =?us-ascii?Q?MdTcopBik36VxDQlYbZDV5A/uupiRi45slzKnbe0b8psGrRXdTfKaUrLiO+z?=
 =?us-ascii?Q?di3ydu2u1SSggKrC6lOriN0UrznuGfyJy5nx+h7Q43kbQCKqHkLo9Ob0aSQW?=
 =?us-ascii?Q?Hmys6fdB8PbXm008HcXUB6Q8tRQp51fuood4PJx+nVmsKe8ruyd4I9mv2w+1?=
 =?us-ascii?Q?ug1Ve6AD5/1BjZofJ6hMcVuOBM9SpAHzOvHr2dUd2m0M3z89ndzaRUQGuRZn?=
 =?us-ascii?Q?sRIqpyid4GZOhx5jPltzvmN01MkIuR9Vp6Ut43IEFcz9KK9Cc/LNK9+/Zd6m?=
 =?us-ascii?Q?6nVRzOUo9r/q7sNcEXdLnVF6B3DOzacCZuoZWA68OakBrvvNlEOH0d8ylyyi?=
 =?us-ascii?Q?84QeQy6PMInsh5Pjl/IL6Hg9sw+iJ42x+zPqOI3SWOrP+YZZEJ1OaiJasrkI?=
 =?us-ascii?Q?vZuyoRaasZrMkGX/CgIAwvQi5fg3wwv3wQUYx1ENahc3dyue48bsw2D8zNPv?=
 =?us-ascii?Q?3MIfK5MA2KUloTmuK0eB74bckOgxd4Efcx/k6gBus9UcvunXBoBOwM6y/uv6?=
 =?us-ascii?Q?5xhclPcXxC2oekuJY+KNkmYMrzfG47t/FkzYUy8EktZj2g66I4nxDII+1Qp8?=
 =?us-ascii?Q?fmG37FdYiuNCdTK6oDeSwRuN8b4xxTdDT1O+KiqDcLkoVSNgDgys+EIpCGBL?=
 =?us-ascii?Q?Krcft9Cu0O2qHpJl5JByUhUxojSF4sx6XNsYduTV4A9t7CKPYMG/cG+OKlK9?=
 =?us-ascii?Q?hiNfpVrtO6thh8WTqCV/ARjYHVviftEuqN4/fJgf3l4ke5EE+BxrFF12eoru?=
 =?us-ascii?Q?4unM9UaVos9V6np0st+VdO9on89RdabCUFvr6t9YMHVTadL3K+SNrttdP027?=
 =?us-ascii?Q?qJI+xXvBNudA4loWsPT1dpIjkiuMgWe56L4kYWJtr478rAPDGuNgHS5otjfk?=
 =?us-ascii?Q?nm2d1CC/wdvf1//8RttWnFHWl5APrn4mJm3tDYdyVco7+e36oWywUaWh1s8b?=
 =?us-ascii?Q?NuEsFDFoqa3ep7LqZTWc3jUw5eVng7gPZgopBWhaQ1lveSdNIKz1rToJy7Jy?=
 =?us-ascii?Q?gfmzw4adcAeXmcQVYQPi9iUM/wrCGISr2U1dRvSGdUcu6p2wAyTkEFFSsEiR?=
 =?us-ascii?Q?dwpwwm8W/YlGJB6Kp4zErbHHidCg2Yiz6k0IZeGrcElWkmKk7I4FrOBr+OMS?=
 =?us-ascii?Q?bdt4BxDFzjMbz+JYce3dgkdYozXFSTsmgXk1bTe/ulrQohayc1BKzpwZ3d22?=
 =?us-ascii?Q?1w4oMmDFfCqv+3zwsB4VvIDfaZr5ktMikhW4VrvA3cibM/q0vYotUUNtwMYb?=
 =?us-ascii?Q?rzLXRPeISjxwFYS5gtiF25y8LFYgG38D25nTUH1QMIIX11lSQfI0BtTEcaEv?=
 =?us-ascii?Q?2vqmiqymfEoiM+wzJuMyo0As7a7+tej5tsRjL85Sh5FM/xspo1UdhpZGm7sT?=
 =?us-ascii?Q?PMohmhkek+jMmPHb4zdIq0XGyj+90yeR938nlwb7Wblv5eFJaYUmVVhIIwKE?=
 =?us-ascii?Q?35DoAp5p+oQ2/CeT2TaD0EOBbKp1OZH2rnv7AbEb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7f5a44-da30-4f7a-83a5-08db31300064
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:04:04.1740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rq0uc9id8Jl5Qss+y7O78hDQL+uEGODvffAvxZBAFDP7iG32trv8RUZNRcy0yeKzccEu/uzVlBODniUJetfKkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Chris
 Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 04:35:39PM +0200, Andrzej Hajda wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> There may be a disconnect between the GT used by the engine and the GT
> used for the VM, requiring us to hold a wakeref on both while the GPU is
> active with this request.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> [ahajda: removed not-yet-upstremed wakeref tracking bits]
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_context.h   | 15 +++++++++++----
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c |  3 +++
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 0a8d553da3f439..48f888c3da083b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -14,6 +14,7 @@
>  #include "i915_drv.h"
>  #include "intel_context_types.h"
>  #include "intel_engine_types.h"
> +#include "intel_gt_pm.h"
>  #include "intel_ring_types.h"
>  #include "intel_timeline_types.h"
>  #include "i915_trace.h"
> @@ -207,8 +208,11 @@ void intel_context_exit_engine(struct intel_context *ce);
>  static inline void intel_context_enter(struct intel_context *ce)
>  {
>  	lockdep_assert_held(&ce->timeline->mutex);
> -	if (!ce->active_count++)
> -		ce->ops->enter(ce);
> +	if (ce->active_count++)
> +		return;
> +
> +	ce->ops->enter(ce);
> +	intel_gt_pm_get(ce->vm->gt);
>  }
>  
>  static inline void intel_context_mark_active(struct intel_context *ce)
> @@ -222,8 +226,11 @@ static inline void intel_context_exit(struct intel_context *ce)
>  {
>  	lockdep_assert_held(&ce->timeline->mutex);
>  	GEM_BUG_ON(!ce->active_count);
> -	if (!--ce->active_count)
> -		ce->ops->exit(ce);
> +	if (--ce->active_count)
> +		return;
> +
> +	intel_gt_pm_put_async(ce->vm->gt);
> +	ce->ops->exit(ce);

so far so good. this all matches the commit msg and seems a good move.


>  }
>  
>  static inline struct intel_context *intel_context_get(struct intel_context *ce)
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index e971b153fda976..ac0566c5e99e17 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -114,6 +114,9 @@ __queue_and_release_pm(struct i915_request *rq,
>  
>  	ENGINE_TRACE(engine, "parking\n");
>  
> +	GEM_BUG_ON(rq->context->active_count != 1);

why do you need this here? should it be a separated patch with
separated explanation?


> +	__intel_gt_pm_get(engine->gt);

why? I mean, why the get in the release pm?
and where's the put for this get?
should it be a separated patch as well?

> +
>  	/*
>  	 * We have to serialise all potential retirement paths with our
>  	 * submission, as we don't want to underflow either the
> 
> ---
> base-commit: 3385d6482cd60f2a0bbb0fa97b70ae7dbba4f95c
> change-id: 20230330-hold_wakeref_for_active_vm-7f013a449ef3
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
