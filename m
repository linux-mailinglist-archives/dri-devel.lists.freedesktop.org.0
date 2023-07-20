Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804075A361
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 02:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CEA10E541;
	Thu, 20 Jul 2023 00:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B83810E059;
 Thu, 20 Jul 2023 00:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689812541; x=1721348541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s+O/4rUDH3EQ6Rz9TU9dwTkfCr4d0i+cb1o/fZy8tBs=;
 b=duG3TCIFO61SNtygu7Dk90hFQWPHSaCHlwRZZnSGSaYVdvTxa4RforHs
 a6fWlqDSGLIB6Qniys9847Iz5b8pMSatRXric3lLuSUy+bi5CZ6YXiYjU
 ryyMktzZUJ3XU0ZB6epY/ZAmMBBcaiBOj02CiQfzQ5FxAsqpWor1YpADO
 Ii/5+yVd4TA0tL5PLHWJNtFU9uenmBoYNPPCKnop1uJmY17Ft4hkYJp5o
 hB4+uFuLgcoDBmcWqIGGT/rvTAERQcZiqyTlTfUEFCNoZyJG+lYD8Qlvb
 ubDrBygth2EXmhdiy5iqZkkTsr42eksq5VC8N4kFtBen1hxCmWKwBZNw3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="452977043"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="452977043"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 17:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674505524"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="674505524"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 19 Jul 2023 17:22:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 17:22:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 17:22:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 17:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+IKx2eZt82pdMG4z88oBfS2yskuT4nrcSAiapt0jB3iD2IR1Hg2HWayozcLQ+LGcB3FjZgDZczOjILsRQ6J3TDYW3MksJFh1aJuntVtfdH3QZFQSv2FU4R8SNw3GOOlvbzKnCP76Jmhv98j9OLfIIvYWRQaCv2qUqFVHdDBm5PNNeWCz+YckbESQCGUq7V/6wjSFjee+pQAR/HINB2j3a4eqBfV3xAYDSv1r+P63rBLyhFLwQRHDhF4wz/PNYxMViXuP+ZBJabZ9AorDNhWo7BDQxcmdCnTKtfDX5exOSGmbu7nX7zrtRvQQ8X/a/qMt2X1mWIU53EjVweTqnSKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JA7gnrmY/tw5UnvWKekx8gjqMB+5+1L3C9LbNGEJkPk=;
 b=U6wBzHcSl3vzSLSMEOLVQrOd/YhHPt/ToDBjMuyyivtLJudVEIcrhwcCPzVMURl/Y42T2eOxbhoNDaXrhkzYG+Eo3bkuR3i3JDFj33idI36cfhlPelISkLCeB0RcpIumqMuS9x6diI+qJSPB0LNesvg5x7b1Y4PStY3izewgJrMOw+eD4g1jPcThNzMfslOf0n5QY4iv3QJ8L9xzm8dpaUs3lLKfcM13byJmZLrOYItr0MOp0ocfCwWaQNlGYYoe4vPTKDwQfRULjZrZUAC9YRK+Lc8lATma6pEF5fz/NsZmKO1/8opWkZvoCzXtMeb1W+de7ov8Q28V5Ut0uRm6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Thu, 20 Jul 2023 00:22:12 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 00:22:12 +0000
Date: Wed, 19 Jul 2023 17:22:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [PATCH v3] drm/i915: Refactor PAT/object cache handling
Message-ID: <20230720002208.GU209733@mdroper-desk1.amr.corp.intel.com>
References: <20230719123730.1094726-1-tvrtko.ursulin@linux.intel.com>
 <20230719223143.GP138014@mdroper-desk1.amr.corp.intel.com>
 <BYAPR11MB2567588886FB6EC3F357586B9A3EA@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2567588886FB6EC3F357586B9A3EA@BYAPR11MB2567.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf727fe-24e0-4a6b-6bf1-08db88b75c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvx1KsXxaFU7SVfXaksHGDxyr2Q630eCLZ/HWRIxFeDzHL6YJb46Tz1kFOl79P4v0ODN9gXbdFmROJg2YbbjLF6mKhvBXCUNg6Rz4gvCO1Zk9rAeVx904vfLfVf7vJZmOJcBqE9b+q/Ypy9Hy5Aq5EUrBNm6MRT75iyAXp2ERjhSf4iRVs8NmXewi07oyHsHHIQZcvXlK4gEKj/bhfQF5N5rdAVOay2TzBe8yBNqLchSSRwupRWhwLFrmMggE9HuGImfWHPRLeWC6RXifLNWlMzTRczL2JRB+1mhvEw1aNX0dLCXPXtVLsxpRiIOwyaOLY4FExK9suB23klQeRNF4zUVWTzmjI72e+DGIBdWItY4hjspm+GoCm/bxNAZIzHyPBB+BmeLYtP6iw9hXDzqyqjJ/SnnR9MPCDIdoa57HqFCHcZkU8PZ4scgl59mRCEjb9dRLG8OSauLasyzU85gN1OSIN4Dy7cS4trgOWr+e6/Iu3oKP7YOtQZsUHaOWi3SpXWEaELZqDztITeBft0Aer9OYXJBMn2Jc0Jcob1MHv9qZ/cpdyiupZnl440LHwuK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(6512007)(6506007)(1076003)(26005)(66946007)(54906003)(38100700002)(66556008)(66476007)(5660300002)(2906002)(316002)(6862004)(33656002)(8936002)(4326008)(86362001)(8676002)(41300700001)(6486002)(6636002)(6666004)(478600001)(82960400001)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ybE5PQwRCEJgqeGMBQcT0UZFV1osTDAv3HJ6HEd+/reckozokIfrxZp3+p8R?=
 =?us-ascii?Q?C9Fd0VJ7bXMc7ag/lnF6uwxwb2LE8DBj88c39Mie8VoAucoDnE+fSZvthHzy?=
 =?us-ascii?Q?rTykGN29xNa3YKIJf7pZL8Y/+fgUmJCMCaJtwedwYjDao4XIrNDJlmMHfgD7?=
 =?us-ascii?Q?WOFqgzeo6eVLjYz5qNT/PTNrET2ofYVnM8s6aaRzlb4awAjIErW6okvy71PU?=
 =?us-ascii?Q?uK9Wp2Ssrm++6ALxL7gSK6hGotmExEVTTMOaGB9DY9YTxudG3qyGl8asL2RZ?=
 =?us-ascii?Q?8/cAl3az7JVUposXCg2ysKi/kyI2TGk1CeE1FJvYu77laLIBX8fAhHvnIUhW?=
 =?us-ascii?Q?ZsflZvjeizM7a0kOpOPX0jzbwp2SEahgAUMxwPBKo6xe7wFs+jN2D3qMvpx2?=
 =?us-ascii?Q?oQBd5B9iM3DG55xDBG1xMNepvhInQ0QAF1Itojzs9/Ii4HYElSpbrYvrSVPc?=
 =?us-ascii?Q?Zfsk9Oa1bTAWqJrJvw9lsfkdipnhvSluzmT4RH3HaTx1y+VkHE+fI0Il+vwQ?=
 =?us-ascii?Q?KSYtQyiMSIvQxpPKHGcJSJNCUNhND8cUmuezNAhsQKnJugThtP3RtJDgU0EJ?=
 =?us-ascii?Q?mLExt25Nur4Cb3A060Im9G1sOKWhO9pPGF2aKdXXxZYC5fhsXzSHlXKf5e8V?=
 =?us-ascii?Q?ljq/leL0c7pbL8q6VxmEKaZ6xWkBMUUNvhufLWhHiijcLrcSt6SCKu9my18i?=
 =?us-ascii?Q?vWBBTykiAT1W5UZDtfqITbJyWhWBVrYKSzB+KvcQYYJf2gC7R5/OWceWoJdm?=
 =?us-ascii?Q?6toWbt6DtQ14OzXBIcA1STYdqRfxL5M1ggQ3nvCpgWCCIfmartJkGgMxKsCT?=
 =?us-ascii?Q?Md/DxobuxX+WXueclIEErqhegfKLmZFge/GCb0f8nSAj157X2FxuvXJgTTdm?=
 =?us-ascii?Q?sG3GMUFD28PGg2i4u1Yc5Xwx8WMnWlqR1VHN2Nx6NSCzzj2QRq9i7TzJ1lZ2?=
 =?us-ascii?Q?Sjq54CGpI5SvHNOJfjZFxZMSVW4UI2ZhyYo7GVMONBp2NFu0WIfOaI0E9K+B?=
 =?us-ascii?Q?vYGhFb8dyGiyMWoOvx/hUx+GrF3n93jkemw8QQ2yh5TqG9PwSyXCmK1O+RK0?=
 =?us-ascii?Q?7PouW5ptYsrqCSuXNfh5+jiiFWSwWwmdlmhtTk5OwK9qPLd9jMI5RY5J9zgP?=
 =?us-ascii?Q?TX2YVe2lPQ2Fys78pqxwilHRtRDejfzOpWPB6MMioUV1McPHvDzXN6VNxpcy?=
 =?us-ascii?Q?jWsWDQqTklBcpuD0q/dAEmt+Z2XRXEl04SorHU8oJd98h/fK+EjUmFGBWZ2B?=
 =?us-ascii?Q?B4Wld+gWVsO1es4OQm5v8t1EOq83UUijIzBbQUjtU7XSCC0rX8PCRA4Xegf+?=
 =?us-ascii?Q?UF1BZE83fj+KaoxKp/fY3bjpSNHOwIkhbcBjpa5eHUY4WH0kNxtkX9Rzy+PY?=
 =?us-ascii?Q?64ahPeN04ybDsR0zqn2ZjXA3eLKXQBcj5FtpisFSaLtGn+6/X17gyzmI8Aqp?=
 =?us-ascii?Q?yf35l3AhGSlhf4wJTkd+lyn0jMg/IhCE0kTxeradw19ADeeiEN7okklV25tx?=
 =?us-ascii?Q?70TLUo9tJaSOfPStXFK3fI/XFHh18m5Odtoy4SFL0vz3ewueLwP4idCdWJ/a?=
 =?us-ascii?Q?CPZ5lxC5G76RRqtpLmNwNeT72YzjfrijDLCXHTx/EBYPmybtqN0MvLdl6mem?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf727fe-24e0-4a6b-6bf1-08db88b75c85
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 00:22:12.1657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RikPZZnYUdraZGZWTCSHsteLLwBPWKA7jJd1B9rBK0yw0c2RcWaI81mKn6YpXaZttLIq17DgI9UcSdiDGfWc9GOLJDL1056Y2SP3bIGh+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 05:07:15PM -0700, Yang, Fei wrote:
> [snip]
> >> @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
> >
> > The code change here looks accurate, but while we're here, I have a side
> > question about this function in general...it was originally introduced
> > in commit 48004881f693 ("drm/i915: Mark CPU cache as dirty when used for
> > rendering") which states that GPU rendering ends up in the CPU cache
> > (and thus needs a clflush later to make sure it lands in memory).  That
> > makes sense to me for LLC platforms, but is it really true for non-LLC
> > snooping platforms (like MTL) as the commit states?
> 
> For non-LLC platforms objects can be set to 1-way coherent which means
> GPU rendering ending up in CPU cache as well, so for non-LLC platform
> the logic here should be checking 1-way coherent flag.

That's the part that I'm questioning (and not just for MTL, but for all
of our other non-LLC platforms too).  Just because there's coherency
doesn't mean that device writes landed in the CPU cache.  Coherency is
also achieved if device writes invalidate the contents of the CPU cache.
I thought our non-LLC snooping platforms were coherent due to
write-invalidate rather than write-update, but I can't find it
specifically documented anywhere at the moment.  If write-invalidate was
used, then there shouldn't be a need for a later clflush either.

> 
> > My understanding
> > was that snooping platforms just invalidated the CPU cache to prevent
> > future CPU reads from seeing stale data but didn't actually stick any
> > new data in there?  Am I off track or is the original logic of this
> > function not quite right?
> >
> > Anyway, even if the logic of this function is wrong, it's a mistake that
> > would only hurt performance
> 
> Yes, this logic will introduce performance impact because it's missing the
> checking for obj->pat_set_by_user. For objects with pat_set_by_user==true,
> even if the object is snooping or 1-way coherent, we don't want to enforce
> a clflush here since the coherency is supposed to be handled by user space.
> 
> > (flushing more often than we truly need to)
> > rather than functionality, so not something we really need to dig into
> > right now as part of this patch.
> >
> >>      if (IS_DGFX(i915))
> >>              return false;
> >>
> >> -    /*
> >> -     * For objects created by userspace through GEM_CREATE with pat_index
> >> -     * set by set_pat extension, i915_gem_object_has_cache_level() will
> >> -     * always return true, because the coherency of such object is managed
> >> -     * by userspace. Othereise the call here would fall back to checking
> >> -     * whether the object is un-cached or write-through.
> >> -     */
> >> -    return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
> >> -             i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
> >> +    return i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1 &&
> >> +           i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WT) != 1;
> >>  }
> 
> [snip]
> >> @@ -640,15 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
> >>      if (DBG_FORCE_RELOC == FORCE_GTT_RELOC)
> >>              return false;
> >>
> >> -    /*
> >> -     * For objects created by userspace through GEM_CREATE with pat_index
> >> -     * set by set_pat extension, i915_gem_object_has_cache_level() always
> >> -     * return true, otherwise the call would fall back to checking whether
> >> -     * the object is un-cached.
> >> -     */
> >>      return (cache->has_llc ||
> >>              obj->cache_dirty ||
> >> -            !i915_gem_object_has_cache_level(obj, I915_CACHE_NONE));
> >> +            i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) != 1);
> >
> > Platforms with relocations and platforms with user-specified PAT have no
> > overlap, right?  So a -1 return should be impossible here and this is
> > one case where we could just treat the return value as a boolean, right?
> 
> My understanding is that the condition here means to say that, if GPU
> access is uncached, don't use CPU reloc because the CPU cache might
> contain stale data. This condition is sufficient for snooping platforms.
> But from MTL onward, the condition show be whether the GPU access is
> coherent with CPU. So, we should be checking 1-way coherent flag instead
> of UC mode, because even if the GPU access is WB, it's still non-coherent,
> thus CPU cache could be out-dated.

My point is that this is relocation code --- it should be impossible to
get here on MTL and beyond, right?  So user-provided PAT isn't a
consideration.

> 
> [snip]
> >> @@ -208,12 +230,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
> >>      if (!(obj->flags & I915_BO_ALLOC_USER))
> >>              return false;
> >>
> >> -    /*
> >> -     * Always flush cache for UMD objects at creation time.
> >> -     */
> >> -    if (obj->pat_set_by_user)
> >> -            return true;
> >> -
> 
> I'm still worried that the removal of these lines would cause the
> MESA failure seen before. I know you are checking pat index below, but
> that is only about GPU access. It doesn't tell you how CPU is going to
> access the memory. If user space is setting an uncached PAT, then use
> copy engine to zero out the memory, but on the CPU side the mapping is
> cacheable, you could still seeing garbage data.
> 
> I agree the lines don't belong here because it doesn't have anything
> to do with LLC, but they need to be moved to the right location instead
> of being removed.

These lines got replaced with a check for the specific PAT indices that
are problematic rather than just assuming any user-provided PAT might
cause problems.  But I had some concerns about the specific logic there
in my review as well.


Matt

> 
> >>      /*
> >>       * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
> >>       * possible for userspace to bypass the GTT caching bits set by the
> >> @@ -226,7 +242,21 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
> >>       * it, but since i915 takes the stance of always zeroing memory before
> >>       * handing it to userspace, we need to prevent this.
> >>       */
> >> -    return IS_JSL_EHL(i915);
> >> +    if (IS_JSL_EHL(i915))
> >> +            return true;
> >> +

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
