Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C806A1F32
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 17:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A3910EC71;
	Fri, 24 Feb 2023 16:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2719C10EC6D;
 Fri, 24 Feb 2023 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677254443; x=1708790443;
 h=resent-from:resent-date:resent-message-id:resent-to:date:
 from:to:cc:subject:message-id:references:in-reply-to:
 mime-version; bh=fXduKKwC4aaelFSr6VqNLfYogVXC6PZ3tiu3HTkgWus=;
 b=Ady+f3Y/u0DAu4DGx1vA/rQ39VLPkW6lkLy6L54tNftl4SIpRJ2kKPFw
 p8G3K8f9esMEPua34C4ZarnjjnH9vCUqDCIcbqIE2tt7MEfyXZTAIFys7
 t4aW4rbScHeJk0FnvUqgORrjtrI1mDJpqNCEINaB+NTbXM23lBBP/iV0r
 CSFKtl2vmbbeJVSErpUwWvZnuZ6m2brGvk8LJUJ+yWZtrdMxXCiS8nRJ5
 gEN6ejG6v8KgJfNzeKuSUSQwg+vcx/8lC9k6wEKbdnYSrcPlbXCdEKw3F
 EKRXEkcjalbTrzhJAqjcQrOgn4bduvrDccg7tCdyYE+XPBnZCmx2yU235 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="331238262"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="331238262"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 08:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="846985390"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="846985390"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 24 Feb 2023 08:00:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 08:00:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 08:00:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 08:00:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3uLkufAgXuc24ypCD2FHwkhe/DvqpMKmzN5eUBk3Hm3h033jNPgSHObmlwSF+N5sSV5dUMsF6rm3SKjOyxDuhb6IQrf8JWNIbuM744QaMYsPusgHQqva9Ov1uFW84zoJJty3KgT9lwYpqPMDe/GM+6jAwrW/h4eNJrZh/z3XRk1Wu1SlUsdJndl4armktTPBROQNggeNQGbKZybdCuxOsttbeDC26kH49eLqLfXHcg8fsJF3iObTIR0nx/f+nv7ns9TBZ36dxIOCgNjvbt3DQhd87s+0QkwvLAz4iGF9s4iQT77/36udJGyagLPjIZqc51axjtjA8LcQXHtSzj/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzVmitJTFRQjgIoMiR9TINKkVKxprASQ96GgNDQ9D78=;
 b=P46RtGpJb4zFyr57knhyEG9tSfTteKdl/C4Tpwm0yuyq2fw/WGyMt4KuRqmPn3SGZHizPxzDrgF13MI9sXe40Oy9w5ZAuYcoktxezlIbe8DlSp7V8H8NI9yoq+37QSuEDRju9XpERv4CmUShURrAIcCRbZsVCyCxmDxHrp8UzzZboZQMir6YSETjWaTkt014RyNY69ToKATYiWoHkrYD7fyEVThOq2j7K/wDKKxiq5NJ7RslWoRbIhJOGw6btp7BesT1cj/hbU9QshKV+DFWr0tiOwG57Jndn5kB+3doqeXaO4bK2VwulBKk9t4Gi3VjgrZ0LTHDEAvpgZKQjaobZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 16:00:36 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 16:00:36 +0000
Resent-From: Matt Roper <matthew.d.roper@intel.com>
Resent-Date: Fri, 24 Feb 2023 08:00:34 -0800
Resent-Message-ID: <Y/jfInAv8ksL1j+f@mdroper-desk1.amr.corp.intel.com>
Resent-To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Date: Thu, 23 Feb 2023 09:03:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Add engine TLB invalidation
Message-ID: <Y/ecZlT6wd+YC3V7@mdroper-desk1.amr.corp.intel.com>
References: <20230217185433.2418370-1-matthew.d.roper@intel.com>
 <dee15378-e102-3f9b-16f1-bb43f0bb179a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dee15378-e102-3f9b-16f1-bb43f0bb179a@intel.com>
X-ClientProxiedBy: SJ0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: af7edc16-e36e-4420-1547-08db1680448e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eea5mDrw3AZfOhV+RjaHTSE22Y7XMWPUfuhXyMHf4nvIuzuODrHkQy7V7I6iM/Tzm7LFeP4p5J8lQmhPXMsLoswVt82mlp78GD49Q8m8w5xApea52Nh27daiXOITo5pr7zsG00aNFDf3RMzkP5dEpD671fjBEq6MjQE+RYfWJBjsJyLU+u4lpRvRVYi8cAjHV2yVcaH5QdoAJdCUgxW2dMZO1Cr0BCw9U1TQQ1ACF5OlyOs1T+/WWi9UG4ODFElXNgl1OjpMF5p+3sINGFbvB6fBTynpxK80kpP6G5q/yIlKPH6J8hFYfaQcaai0UiNKIQ+yfysEcqJ3rgoQfJQ+n2Ef5qkxjsqwQh6tiE59oYoAVTC8iQxeUWDdNrBKHDciEsCErltH+zZgrb8mN89rj8KDTiQm4SsUNIlQvBmLFicdLBDwHHpT/FuNXHR8mnjX55eDsGt8EKjZkeDIAl/qtwmRGxp02wXLpgPDzoxPJdLtP7u4LXIczXwhpOkjBLdKGSOo6NqS+EwZ5asgRTig3jwskf1Ukiucb0fDEfDRoAq1j5k9T5Iv/ybjOjoD1Yftdi6bwjfbbVUqD8lFAJmFlx/HjfJBkdpKRHC5N55URFRcodATgDQmlhjv1VgPygcksA6YvtUhM2neY+gDj/Mr4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199018)(186003)(26005)(82960400001)(5660300002)(4326008)(83380400001)(38100700002)(450100002)(8936002)(6862004)(41300700001)(8676002)(66946007)(2906002)(66476007)(6512007)(66556008)(478600001)(53546011)(6506007)(316002)(6636002)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nqgHP19aRPXmuUoK94YH7I4akl+z+e9f/3NKFylEgpzf1BiK67N/o2EY1GEG?=
 =?us-ascii?Q?saUL50LARVso6cF8JqfeMeLdU5DVSk6UzAtp2K1iPenzqVAIq4jUo9gPDke7?=
 =?us-ascii?Q?7bepIH2J5QN3FaxqdfU/IEHXzRGvK0xi8/hvannPmhnVDvCK893xzgrMK94C?=
 =?us-ascii?Q?Qwt5V+qS8Xok4T6o/rxsBORaLTXc0RpBDEtYgBkitebc4vVD1CLyrU8samMU?=
 =?us-ascii?Q?LFK8XL3fQG+o909Wwn7i9UeuOMfbzcdjC4nuGSodBjLTMwR4m0/yEX9Yap+g?=
 =?us-ascii?Q?W8Pb9pKcmveLrIhh45EX27WcGqhWrx4QIDHcszzeTjOJt5oLNLDIYCLxOY7f?=
 =?us-ascii?Q?gTSsS/4ksEnV7fSTTq01iSTnbm5wMZWo3QzGwpZUGTP5r/g5HH/ifw30qR+H?=
 =?us-ascii?Q?AhTcXpuYS+QehVX77PvJ3BZGv7rsiDs9mdsVvDcV8i+Yh4FmDN/PTp6ptkFP?=
 =?us-ascii?Q?3BZ8u+DrVTe1R/3kKCft0Mdyk3zuCSVEOGMz4DRfZ60vIMk5aAyyazQp5Fbi?=
 =?us-ascii?Q?yDiNWlhL4Ay4ebbRR/XAZXz/Xyl1Wm/22w48HCx1s+aAwHAhCf97xcC9xjCH?=
 =?us-ascii?Q?KMb55CrSCkqONEYZMNLmkZ8V066pU2uZh1nod12mee5pGT2dedj8vU7Te/Ya?=
 =?us-ascii?Q?3b6B4v/sbBGyl+zQmrCj4jhaqq6UW++O/2qXlEX2wPqAWro2AaovbzEqPs1Z?=
 =?us-ascii?Q?SZGoxGG6f1/SYf+remnGcWKFj1wbekRntFN7yYhpj08lLzK1SnvUF2KbGk6Y?=
 =?us-ascii?Q?7UDFxB86njj/5JQyoSSwS+xvleihNzrkP3t8y2fBmkT79hDdckJmZvUd7F8m?=
 =?us-ascii?Q?IZko9tKInTUZahBtZgwj2F8zKtjgmQZcPPjFdN/KsCyRM7G90ozsYJ8S28yY?=
 =?us-ascii?Q?ou0mSbZaWMlclgwN7vzrB06AhICjnjTjgSOb/fI4AXjuVhRqZ5AMVgMSWFfP?=
 =?us-ascii?Q?dtnII9vm09Wb85U6e506t+DlUfFJDOz94yVUhXqKboD0UuZqqyDXClpRwozd?=
 =?us-ascii?Q?WRS5T8SkErc1TxA8hrQm8hqIX2F1GH8+4Jji7iFGOrw7nqrn0U/XReNrSmSv?=
 =?us-ascii?Q?//7wzjG5s4dHOOQAWSP+SI4uQ2eYCCcj2KLfz/mL8CzsxG/D/Vm+UdPbBlMO?=
 =?us-ascii?Q?O5KElUmwCNIJOEAYzLcySrvs21orXJTR9D/LoKtBPPBUvXYX3NElriDy64Mu?=
 =?us-ascii?Q?yB8KSsxFedtB3duV8KNWioO98JTApCOZ1sxnc6JTR3uoXgCYDbDROdEn8uOJ?=
 =?us-ascii?Q?09zhKMr+Vxrs//u4haZocXtc1rz6J4i37snrqCo5ZQDMdMP4exXrUkV667x1?=
 =?us-ascii?Q?sBAr8Pq81I2Z5C2xPeyDf4hU+HJjrKxAafdfHgwO+diDsgKN8wVASml4D12C?=
 =?us-ascii?Q?yW+ETw6ax3TlGfv5qY3kL7sxoyau82krJIUdAcep5w4+w4ksR8skv8V/GvEZ?=
 =?us-ascii?Q?04AQpND/dT/K1LKnawfnfijI7pCPE89A1357HAj32kiqvuQe9/O+6XXbZRf5?=
 =?us-ascii?Q?HQOwrbfY8Yo/jk5LCEcsr7Sfwv2n9WNrxhrB+JrkquXoIgFK0p8tBrxc3Ooo?=
 =?us-ascii?Q?KelSFtKj6668SV/gl/LQftOKX989cCm2AhhdyoPUK6nJgoNMTX9hslHBRUFR?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af7edc16-e36e-4420-1547-08db1680448e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:00:36.6574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THIWwIgPDFBhEelXSsOvrkKKR7vxuLfYJWLgTO/qbj6W1HgwlPeQuygLEkm+EznAKmiyTQAprpX8XANYmABlPUQA//MTTME3ezPXREof9M0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 10:08:51AM +0100, Andrzej Hajda wrote:
> On 17.02.2023 19:54, Matt Roper wrote:
> > MTL's primary GT can continue to use the same engine TLB invalidation
> > programming as past Xe_HP-based platforms.  However the media GT needs
> > some special handling:
> >   * Invalidation registers on the media GT are singleton registers
> >     (unlike the primary GT where they are still MCR).
> >   * Since the GSC is now exposed as an engine, there's a new register to
> >     use for TLB invalidation.  The offset is identical to the compute
> >     engine offset, but this is expected --- compute engines only exist on
> >     the primary GT while the GSC only exists on the media GT.
> >   * Although there's only a single GSC engine instance, it inexplicably
> >     uses bit 1 to request invalidations rather than bit 0.
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 52 ++++++++++++++++-------
> >   drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  1 +
> >   2 files changed, 38 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > index f3a91e7f85f7..af8e158fbd84 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > @@ -1166,6 +1166,11 @@ static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> >   		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
> >   		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
> >   	};
> > +	static const union intel_engine_tlb_inv_reg xelpmp_regs[] = {
> > +		[VIDEO_DECODE_CLASS].reg	  = GEN12_VD_TLB_INV_CR,
> > +		[VIDEO_ENHANCEMENT_CLASS].reg     = GEN12_VE_TLB_INV_CR,
> > +		[OTHER_CLASS].reg		  = XELPMP_GSC_TLB_INV_CR,
> > +	};
> >   	struct drm_i915_private *i915 = engine->i915;
> >   	const unsigned int instance = engine->instance;
> >   	const unsigned int class = engine->class;
> > @@ -1185,19 +1190,28 @@ static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> >   	 * 12.00 -> 12.50 transition multi cast handling is required too.
> >   	 */
> > -	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> > -	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
> > -		regs = xehp_regs;
> > -		num = ARRAY_SIZE(xehp_regs);
> > -	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> > -		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> > -		regs = gen12_regs;
> > -		num = ARRAY_SIZE(gen12_regs);
> > -	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> > -		regs = gen8_regs;
> > -		num = ARRAY_SIZE(gen8_regs);
> > -	} else if (GRAPHICS_VER(i915) < 8) {
> > -		return 0;
> > +	if (engine->gt->type == GT_MEDIA) {
> > +		if (MEDIA_VER_FULL(i915) == IP_VER(13, 0)) {
> > +			regs = xelpmp_regs;
> > +			num = ARRAY_SIZE(xelpmp_regs);
> > +		}
> 
> As I understand currently only GEN13 of media can have GT_MEDIA, so fallback
> to gt_WARN_ONCE below is expected behavior.

"Gen" terminology isn't used anymore, but yes, standalone media is a new
feature starting from media version 13.

> 
> > +	} else {
> > +		if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 71) ||
> 
> 12.71 is not yet present in i915_pci.c, maybe they should be added together,
> up to you.

No, i915_pci.c isn't the source of IP versions anymore.  Starting with
MTL (and continuing with future platforms), the graphics, media, and
display IP versions are read out directly from the hardware itself (the
GMD_ID registers); they no longer get derived from PCI devid matching.
The vestigial 12.70 value in i915_pci.c shouldn't get used anywhere
except as a very basic sanity check that the GMD_ID registers are
correctly reporting a high enough version.


Matt

> 
> > +		    GRAPHICS_VER_FULL(i915) == IP_VER(12, 70)  > +		    GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
> > +		    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
> > +			regs = xehp_regs;
> > +			num = ARRAY_SIZE(xehp_regs);
> > +		} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> > +			   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> > +			regs = gen12_regs;
> > +			num = ARRAY_SIZE(gen12_regs);
> > +		} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> > +			regs = gen8_regs;
> > +			num = ARRAY_SIZE(gen8_regs);
> > +		} else if (GRAPHICS_VER(i915) < 8) {
> > +			return 0;
> > +		}
> >   	}
> >   	if (gt_WARN_ONCE(engine->gt, !num,
> > @@ -1212,7 +1226,14 @@ static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> >   	reg = regs[class];
> > -	if (regs == gen8_regs && class == VIDEO_DECODE_CLASS && instance == 1) {
> > +	if (class == OTHER_CLASS) {
> 
> Maybe it would be safer:
> 	if (regs == xelpmp_regs && class == OTHER_CLASS)
> 
> 
> > +		/*
> > +		 * There's only a single GSC instance, but it uses register bit
> > +		 * 1 instead of either 0 or OTHER_GSC_INSTANCE.
> > +		 */
> > +		GEM_WARN_ON(instance != OTHER_GSC_INSTANCE);
> > +		val = 1;
> > +	} else if (regs == gen8_regs && class == VIDEO_DECODE_CLASS && instance == 1) {
> >   		reg.reg = GEN8_M2TCR;
> >   		val = 0;
> >   	} else {
> > @@ -1228,7 +1249,8 @@ static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> >   	if (GRAPHICS_VER(i915) >= 12 &&
> >   	    (engine->class == VIDEO_DECODE_CLASS ||
> >   	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > -	     engine->class == COMPUTE_CLASS))
> > +	     engine->class == COMPUTE_CLASS ||
> > +	     engine->class == OTHER_CLASS))
> This is little surprise, I would expect non-masked reg for single instance,
> but it follows bspec, so OK.
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Regards
> Andrzej
> 
> >   		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
> >   	else
> >   		engine->tlb_inv.request = val;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 416976d396ba..423e3e9c564b 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1090,6 +1090,7 @@
> >   #define XEHP_BLT_TLB_INV_CR			MCR_REG(0xcee4)
> >   #define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
> >   #define XEHP_COMPCTX_TLB_INV_CR			MCR_REG(0xcf04)
> > +#define XELPMP_GSC_TLB_INV_CR			_MMIO(0xcf04)   /* media GT only */
> >   #define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
> >   #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
