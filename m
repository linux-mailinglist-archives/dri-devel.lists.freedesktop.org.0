Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A46ED370
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 19:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751C10E3F1;
	Mon, 24 Apr 2023 17:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AAD10E1C1;
 Mon, 24 Apr 2023 17:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682356840; x=1713892840;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VIaKn89iPxjllHrIdIfXplGfvk9xt0O0VkV0FnUQmpU=;
 b=I/s2uEQNowOg/4L4IgNJIHMTPqZWe2THWeP1hB0lGo8ll6kHRSAqe0iM
 6X3wP3L/Qd/1CVmrKvful8OPV0FgmmFLfQHywaZ6zDvjDvhZx5yTB/8uj
 1Jm/LvGT8vOW4xpOmiEO3BMx86SLa4MeGjX35wkLAXXJBg88/VYv2xvlU
 0b/IwwLecAjj4nbSvgbXux/2Bfq2glqWfnl0ECe/oWRzJqMIjzlkiIPqt
 qU0WsZccQdBZaiLgEi9ceyhK4xVOplq1zyw8ZNSeaN6jmw2bo5JJ4UvJo
 XOzJY+Q/8U1pmdb+K8bMlRcG56yvkz61jErIIy7nV9ETx80ey8FrL3Ujz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330713968"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330713968"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 10:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="782469377"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="782469377"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2023 10:20:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 10:20:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 10:20:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 10:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4LooDo7qP31OVp9BPV+gwRCJZTioA3t32nDSqzQdkt/MYDO2L28IcykkT9Aoha6YHXwxbFTA33vNjeG+I2rRqZ3SzRz1K9aOLKPI0vphnLtugq7vGlVkQoTJ6N/43Zjf6Q3F0uUw/XeeGZwX+sI+2UWm5s/mjaRw5YKAgJM+EujXQK3no5T1gOeNsE6IucMeDagHaOIvSjlyn8t+vv/0TMlIQfy+4VRxZnqTnkNMiHjh7r2JvTmkhXJAfHGndOK8bdZB31bzc0J3tOLjuSQCETvdeJ0lMeWdI7QIRw1j/bT1Y8QXm2RB43OrNaj2KQkyjPDF2Ywr25Z9ZbyzIYajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqY19z5yIZ0iKaj4kpDg9rnmdIcVYV0N+Pj8FemQN94=;
 b=aRPBzDM4f9d0Tur9fJnE+dsS+EDXQkzzuEqsdhnE0wrJpQJTci0C4k6UBzPxhhgyHYy2EirfOb+jlcwU3i3ifFtdXkS02Pn5ZO4/zOkL4NTrSj5s1DeO5br7ta4lApT02w4zy9+tBnQPd342b16d/pUAhlZ8xv3vkQ3Puzh0K58uTfUWVs87w/2D+ack+IpJiZWaMchCV5jixHKObTZ4deGV9gjX8J80R7Pud0KQnARK1tbuyxZr4vAV7nEbHef7ww1+L0Glb6lRVZroq3FZF0BTO6bt36G8ppHXMIIJhdEG+B/1g2OZmMhg39gJeQu7Z565RktSi+xuB7cpX1mMDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 17:20:32 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 17:20:32 +0000
Date: Mon, 24 Apr 2023 10:20:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Message-ID: <20230424172029.GA6250@mdroper-desk1.amr.corp.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-4-fei.yang@intel.com>
 <20230420204056.GZ4085390@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567042124B3E0D09E1696489A609@BYAPR11MB2567.namprd11.prod.outlook.com>
 <20230421174252.GO4085390@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567E74CCD65192A9F699B169A669@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2567E74CCD65192A9F699B169A669@BYAPR11MB2567.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: d8321066-4f72-42ec-4941-08db44e83529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J7oz9NKeE56x11EwtcNtSrjDLA03oHGL8Lu4WYN/gYG4KC2MZQHYFojvKRRj9QEywSss+I96B5hKN90fzDvXDR+S/v4YxT3iEDBypp2Lter+BBMT/Cr/NYNzG5e8Or2rNcV5n1AHhc8v8/LfQTS/089aSorz3JsqEQ7ea7NGi5vqGgXmGprEr9j56X405WDvkAKQoaedp5MHf8rS9jiRj677TXqgHUS7zNDykCcvebyb6qJz53c1krTopzFLZ5pcHzI4Za1Hd4W2nOxuaT4n5/zmXEwh9DTi77y/hVENm17hPJzMx/fu/BJbLWJ1A3Ol7I/6eo4cxB5jRPn90eee3qF72/2r/T1+aANzwY0LOa45w4xb4+55kWk+YswrWVaejW4ptim2Fn4ydJ6kspCyN0FznXzSWGk6mAZhF9KNN+SbP7UHw8dQ7MDACUdrGMRLlGILG11/HkQR9D1My5zIYEU9Bxdr+xZnwu3+VMi+uypBMyOAZVwFNAYH0dFrwL69w/bjfP2iMdOrmUZEeNnSj75/sVGBOei09j5LuoqA6I/7UVw6MF6OlVhJdLZOWIOc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(66946007)(83380400001)(2906002)(450100002)(6512007)(6506007)(26005)(1076003)(316002)(66476007)(66556008)(82960400001)(6666004)(33656002)(4326008)(8676002)(6862004)(41300700001)(38100700002)(8936002)(5660300002)(54906003)(6636002)(86362001)(478600001)(186003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+bVZ0xzA4e5coCJcRMg2vvVhN/HYBupMILZvtUmXZw3dwV55Woi1CzGSd3mh?=
 =?us-ascii?Q?yYwwoQMFovYldlO/aOsDS5knC3pOsXC3hJ/KOKy8MHrJLXapuWLpaOGD1V8l?=
 =?us-ascii?Q?xHOgFlG7YtP5/0p1iTzB+RblBOzCRsbDsSrXs4i6/SzHiz6b6/soIw0+TgZ4?=
 =?us-ascii?Q?FXyMCjFiOQ0yW6a1HPnHhGpv0USQe3LAER2LBH0HYVfr2ZMdVNFAspEWHNlY?=
 =?us-ascii?Q?drfkTg432rC5/ykGERfxzbsKv4JkMJlS6y1NeUHdw2D4nmrgtAJQ8xL2RTjF?=
 =?us-ascii?Q?R2zNHydrp2cxz1lT39CAAFAALZ4+wVrwPjKDtnqseXoF6PAPmW75nrhXZwKX?=
 =?us-ascii?Q?w7BnPiYFJP/j7SUz4Z4imRZjiWb7iZKkhZ720TDz9VuLzJjLPk8o4F6HfjBg?=
 =?us-ascii?Q?14rixc/XmxOu8qlMhsu6lEQ5WXIN3g5fMiClRy0W36t1QhlX2r6s0ShKxveC?=
 =?us-ascii?Q?yzMkslPAk1dMVrFP/4Yn2UfE5GmeQ6zTNuioxZiwAk9OdGZiydmzKTTAHVnt?=
 =?us-ascii?Q?Ecv00w5y5ovDa7wVjzlCPPl594depVhmyRQhDSBUlVNWH/TwY/OpsB3cAbkn?=
 =?us-ascii?Q?Kz0zS0fYr5VTJ6/pdEgwA9a8bnKWZI7X2ybGE8abXkYrzfGYZ9Z1zK3yUkjj?=
 =?us-ascii?Q?hCyFrcpmZzqTrXchT66JnaJyEV76ahbVrpddHqn17zFG+EMsKvd+xuSsCjqQ?=
 =?us-ascii?Q?zIO2w5DnNK/lxrQGU0t9K2TxzPepaoNUm7XP/hQ948y9BlWhZUIkdABOyMZO?=
 =?us-ascii?Q?ZLBa9XxCKsF8OXF3bU5nnxcnlNUGl2gQyeC3U5qRtjKLsThE8WzQWceO2JLE?=
 =?us-ascii?Q?lOIKM76px+HengzF33xbKIMw4qoghi8WFyjyzZcOeVozXuc9aJh+0SdxUj5+?=
 =?us-ascii?Q?bdArMOAo69qff6+iPUZ12r0uP8gglyHGRu8Os+m8XDfqGKuO8Jt4in4z0WfS?=
 =?us-ascii?Q?vP9Xl537bo9rUdcJTdkcRBQlIDfaMAxzwOnHNy/lkkUnjQGyr/+RYpJP02FX?=
 =?us-ascii?Q?p5A42j8cOTyfvmAcFQSA/gXPfRjG7hp6YpJrJC1rZCbaP9sFtOprkSxY5P7g?=
 =?us-ascii?Q?77ipHCHFfxrp9qTjyRHKMm/5lS2hqzOYgEsBwY/FiFLuk8oFPB3YqFpk2WuV?=
 =?us-ascii?Q?C/YRgocU5eG7ZWD0znx+bP1OGTm2940lO+qJP0bpF5/npNCQIKjFkj2VHwE2?=
 =?us-ascii?Q?YEJgd+CVqXLgaPLVX8go2ZvjunvGCrPfHVc27j2GYvnZtURPYwI76GkyRyDw?=
 =?us-ascii?Q?EFjisby74Xs294BNvrB3XaNvcKtj5SfxSzLNwBncCwUU/SH81efWCE0evnwV?=
 =?us-ascii?Q?9fAhp6fOsgY2kGEg3aOQycDvJ5nZo+ecat52AWXfyN7IICjFI3MSF+Y6sT1F?=
 =?us-ascii?Q?cysW93We7CgxPn1zXr2+v3bhffbnGqReSeC2YPGnX+h6u9P3v1eYi3ZZb2ls?=
 =?us-ascii?Q?zZ1fYQUcMWDDOFaF3XvStldvMoxXVFukHmv3N2oB1vp/cctGZ4k856SRG+zE?=
 =?us-ascii?Q?45FsaUpOM+lL0B2lGC6QUwj6tV3XOz/49L0j6W6XSINoNphg+ejQyv5vaqBN?=
 =?us-ascii?Q?GZw6OWOojr1XKLu+SsMjV8aAbpsXlfFaugMTrE7dHzOv6p5jNw3SGnJ+vDX8?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8321066-4f72-42ec-4941-08db44e83529
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 17:20:32.0686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCkOthoGDSrZ0X3FRI94SWaPInCKAie0g7c1Va1gUYip0nzjueSxOpl+WShB+rOw/P61t0cnRXBA2hvMbSMi77L/scKrGOhJRZHtwtXgqgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 23, 2023 at 12:37:27AM -0700, Yang, Fei wrote:
> > On Fri, Apr 21, 2023 at 10:27:22AM -0700, Yang, Fei wrote:
> >>> On Wed, Apr 19, 2023 at 04:00:53PM -0700, fei.yang@intel.com wrote:
> >>>> From: Fei Yang <fei.yang@intel.com>
> >>>>
> >>>> PTE encode functions are platform dependent. This patch implements
> >>>> PTE functions for MTL, and ensures the correct PTE encode function
> >>>> is used by calling pte_encode function pointer instead of the
> >>>> hardcoded gen8 version of PTE encode.
> >>>>
> >>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> >>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> >>>> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> >>>
> >>> Bspec: 45015, 45040
> >>>
> >>>> ---
> >>>>  drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
> >>>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 45 ++++++++++++++++++++----
> >>>>  drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 +++++++++++++++++--
> >>>>  3 files changed, 72 insertions(+), 11 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c
> >>b/drivers/gpu/drm/i915/display/intel_dpt.c
> >>>> index b8027392144d..c5eacfdba1a5 100644
> >>>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> >>>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> >>>> @@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
> >>>>        vm->vma_ops.bind_vma    = dpt_bind_vma;
> >>>>        vm->vma_ops.unbind_vma  = dpt_unbind_vma;
> >>>>
> >>>> -     vm->pte_encode = gen8_ggtt_pte_encode;
> >>>> +     vm->pte_encode = vm->gt->ggtt->vm.pte_encode;
> >>>>
> >>>>        dpt->obj = dpt_obj;
> >>>>        dpt->obj->is_dpt = true;
> >>>> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> >>>>  b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> >>>> index 4daaa6f55668..11b91e0453c8 100644
> >>>> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> >>>> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> >>>> @@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
> >>>>        return pte;
> >>>>  }
> >>>>
> >>>> +static u64 mtl_pte_encode(dma_addr_t addr,
> >>>> +                       enum i915_cache_level level,
> >>>> +                       u32 flags)
> >>>> +{
> >>>> +     gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> >>>> +
> >>>> +     if (unlikely(flags & PTE_READ_ONLY))
> >>>> +             pte &= ~GEN8_PAGE_RW;
> >>>> +
> >>>> +     if (flags & PTE_LM)
> >>>> +             pte |= GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
> >>>
> >>> GEN12_PPGTT_PTE_NC got defined in the previous patch as BIT(5).  But
> >>> according to bspec 45040, bit 5 is ignored in the PTE encoding.  What is
> >>> this trying to do?
> >>
> >> This takes effect only for PTE_LM, doesn't affect MTL.
> >> PTE_NC is needed for PVC (use of access counter).
> >> I believe this function was writen based on the one for PVC. And this
> >> function did get extended to cover all gen12 in a later patch.
> >
> > Even though MTL doesn't have local memory, PTE_LM is supposed to be
> > used on MTL for access to BAR2 stolen memory.
> 
> You were right, but I still think this code is fine because this bit is
> ignored for MTL anyway and it is needed for other platforms with LMEM.
> Otherwise this code would have some sort of platform checking which is
> hard to do because we don't have platform info here.
> Or we would have to define another PTE encode function for platforms
> needing PTE_NC just for this one difference, then manage the function
> pointer correctly.

MTL is the only platform that uses this function right now:

   +       if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
   +               ppgtt->vm.pte_encode = mtl_pte_encode;
   +       else
   +               ppgtt->vm.pte_encode = gen8_pte_encode;

If this is intended for PVC, then you have it in the wrong function to
begin with (and it also shouldn't be in a patch labelled "mtl").  If
you're trying to future-proof for some post-MTL discrete platform, then
such code should be saved until we enable that platform so that it can
be properly reviewed.


Matt

> 
> -Fei
> 
> > Matt
> >
> >> -Fei
> >>> Matt
> >>>
> >>>> +
> >>>> +     switch (level) {
> >>>> +     case I915_CACHE_NONE:
> >>>> +             pte |= GEN12_PPGTT_PTE_PAT1;
> >>>> +             break;

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
