Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995615EE3E7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FAE10E56B;
	Wed, 28 Sep 2022 18:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BBE10E551;
 Wed, 28 Sep 2022 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664388481; x=1695924481;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MXaNdTsP0mo4WMbxcpArgKywvVWvnmeVkiXgC2rnMTs=;
 b=fXaYSxzhMywwZN/GoiL4HbjSFntlug4PmDA3z+5l/bmjFDtAO/Rk3feY
 rWQXGKUpWFKhIcxY6FDquQ9m4LVSBht2SFiODneKESUgFTUQcObooIWqm
 pUwOcNoF+chMfiYdgvdFOv1kj8jBBUf184a4LgJJevkTSX6iAFHHNmqh9
 1AfkdfXTAJPIIRtw0PuamYYasrcjXbOktR1fXv/All6VHcMKY8nOz4Zgp
 nkRyZni2TjgQ27WVOlng4yVOgnzNVDAQ6FleyYVGrLowgSU6PFX74hXA+
 E24xF5FDApUDkiFUbhJYiwaeTYlqMhJHcKJqtYLNAVeG13t2Ij9yhFZTD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="303162461"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="303162461"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 11:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="726057619"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="726057619"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2022 11:08:00 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 11:07:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 28 Sep 2022 11:07:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 28 Sep 2022 11:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SljHUeUDn8S+Q1PoN5urJdsANb2KvW8Z918Q5fjwigk2zIfXyKMiHpNXyj+ikSOzUwMFt0/3K/6hqBpm++iKadaRtfkVb50aEbaQOKCObwhyVtLoELgte9db9QZXJC6DRyF0kWk5Osq7fClU0+55BZp7F52RD7ln771iYnGt5qkVLBC3rx10mhaZW1h7SsjFHjtJBKgbkV4LeoAGCfo72dy8kj52I+QCVxnc8LQMNjY/EFdZVEco2PkRrOoXhvDrIB3xptreYKHxSHaZm1wXk/uk9eMLK6ysoxRh9XWuItjA+QH+kqO6Czwps6XTOyNFbezh1E4+nfxL897kC0UphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3yeav/rMHiDoDVCR5TWJgwzqDh4ULutZUY3kWSatfo=;
 b=MBgM/qCQqU9YP/pBl2xNPwL1uzxevfxeibjFT1iM23B9ykMa5MyEzpE5sLcXrDxGLQvsRnwqMCJMtiJwU+2H7FOzzXyUF4amgvLAgDCHffHAapu2tJHk/PuanPEICNuz9QkeEYjjr528HXO+AL0bYaJu/XtHMxBLddQ23MTIKTxj5OhZE8azjj18oIUnH6DAz8MgCoSscpbhOOY0hi+jvtTvk83XTDZZW9GJxK49mF17mGPSc1DkZYgkO1b7CxOFGwuYk+0VHxkwOh4ZGt1fHaSCGZMraMb4t0isk2gZioKcLAGZrJuQVFH6aXzWSLi+tKHqUdEEyHU7aOvNySVD2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Wed, 28 Sep
 2022 18:07:50 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 18:07:50 +0000
Date: Wed, 28 Sep 2022 11:07:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 7/7] drm/i915/guc: handle interrupts from media GuC
Message-ID: <YzSNdLG7hVPoyCoU@mdroper-desk1.amr.corp.intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-8-daniele.ceraolospurio@intel.com>
 <YzOQ+bcBA+PwRZek@mdroper-desk1.amr.corp.intel.com>
 <87978a20-0f9e-62e8-63b8-9ffb94e71463@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87978a20-0f9e-62e8-63b8-9ffb94e71463@intel.com>
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH7PR11MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d64686-f8aa-44b8-2e94-08daa17c5b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zSPOTrJjCDhDdtdsePN93bYL1EwQ8HJWW4zPLWnX+8gruMlgPs9JLAFEDrVQMEozTLFRZGSEVioNePP2qdg8rVRz/R0xlKV66Y1OKRupJ+BkwgyvUJ7vRh74oGQvTxjQlVoZt0aM01N1igubeh5BxqZ71kJ58diDHACgpDmSkFwvcAgeeXvgnKSZHZ7YL0oM9yoNB99pd/5Y1xzAsPjDXAiNOhcW8p5tIumhjp09gPPVhRzBWtGIHTJjCUZNHPgOJ2oa/pBcAHvwZvx09NAZ0YaNQhjBLf2OJpw+b79mBGLcfwL/LzDubKalELHKCJUWd9x5Z3G/X/0++sabQyY4GvOzvVYsCAnZctfs3ksarSD9EjaFZQZymKg+QS+4i8c3RNirhOZbNWd3LgyHOuaHXXnwKAgtCvtaBZ9jMOcZxOqkzVzXvgyS+0lcu82jTibtbdIX+d7QFe/sv71EKeZoZOWXRGMqI5NqdJibuClb2w6bnz+O3dV4RqS7RcIKe8G2vu9wo67xlTktu8hGNDyXt+QhkOcz+MMLbehSYmaFVMz49L/8f8mL7XPsNWdUzEtr7UcBVql+2dGTNb9gYW3PRJZxfNINEjmBPYHBl2rTxlLgfv74b60ML+AzfvlB02yZFiSNNiQ1Silp8YqpYoHMHwR8bV5BSS+tpx0tcTgXIkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199015)(6506007)(2906002)(30864003)(53546011)(82960400001)(38100700002)(5660300002)(26005)(86362001)(54906003)(6636002)(966005)(316002)(6486002)(186003)(6512007)(6862004)(8936002)(66946007)(41300700001)(478600001)(66556008)(4326008)(66476007)(83380400001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F8GJJxS0wd/DmKIVrOdEt3jxg4ilHyQu2e5Qw/cSxlawMmjQtRjWgmHmi5QU?=
 =?us-ascii?Q?QLAYjBAKKtjTL7twX8AavZJhOKCyo/qQTTKA9UNyErgPgmGVO7dzr1dcMof7?=
 =?us-ascii?Q?vLfseEjRqVkGG0GhNtl9s/J6uht1JPRMbmx3/pe7MK8TC0ZvlYQ8qbxeNSuv?=
 =?us-ascii?Q?DTGXEtjRkwrqzBwgmXckEo2dc5tI3T37TZfPx2fMbTGOk7Kom3pZTD0YbFOv?=
 =?us-ascii?Q?6KEvQreEzUlTlVL/GK1iYyBhAnMLlGIg9i2X0U/ZEhWmy2r31hzb7l0GfWga?=
 =?us-ascii?Q?Tnnx0Im3HbLZCNGMuFHvK1fBD6frEtLGgcUtfd8CRoVBTeV+ZZ+c3flJuKy2?=
 =?us-ascii?Q?vOBa3f56vrP0lmBy4gnqr/evG+YlWLhh7qjLNQ8klyx+W/1AcfCdiomVwTKz?=
 =?us-ascii?Q?z43WqzoErpEZ+8xg0GuO0iLsCXdymcBJoQCn0Bi2SCDpLTLl+6fQr2hAj7Ta?=
 =?us-ascii?Q?HtD0ZD5gSyS/PM7K4fmxCqOfkQKa0LBcQnHWBJwmHnv0twglG/81tHy11aTa?=
 =?us-ascii?Q?FFIMHquQbvf61cK0jyraKpliQoUbFjWvfytA/afX4vQXv52Jd8QvNPVVNSMG?=
 =?us-ascii?Q?AcOPKEjDJe+1Tcpb5AuJQwtuKqXHf5fLtPrTKOALruCoex0RwXKDS+t/CL4m?=
 =?us-ascii?Q?3pqfRFaPfNoQItwV/YM3jZYl3ydL8wKdwd0hcSNGuR8/BMckwsZl1Q6yEVNr?=
 =?us-ascii?Q?+AwiX4PNOOg/ty/DZZBPUUThY4KizK3tIu+LkehSUX6Xb8+q/j/zDpDZFtSJ?=
 =?us-ascii?Q?A0FimL3OobW+u6dQsY+1zI0t5Ms/2+mr7dS2g1Ci1kdDzdpjJCqukrBvNDRq?=
 =?us-ascii?Q?YukGU4q38pIdIeQhbEFTEZmfZMF6IvHK+RIbU9pz09cgzjRy8GYarFbaA8Ff?=
 =?us-ascii?Q?unyRZ5a3cJ7wxM9/Fxa8sNxRruM8FI0ohXoQ/n+EtjXJMAZp9CKR4BbRCw67?=
 =?us-ascii?Q?Euvw3IjtKPpI5xhQ+3o1fBDSrzD6hFRuytEAmyQ5uAtO+8bitlG4tFbdsdAB?=
 =?us-ascii?Q?O3zMc+qSs+wwINE9ap0F6uIh94+fsfDnppnNr8vpK7cFQq6MRHCpDuoFN7Sl?=
 =?us-ascii?Q?iwY5M9aaKa/HI5HJ/BpVyVOUehVpMyOfBaYLzlo2WS2D0ltvnG0wXTW9Fext?=
 =?us-ascii?Q?1tC6xK39nnvyykRwSLkF/4Sj3nhlGzO2d30kmbnrVGmIrfOzyJmWCxQjwY1e?=
 =?us-ascii?Q?HrBv+y2ZtQKZkmCB/eqt1bpio5YxSifTPe/6sAxX6PwP+LddvrX1SDHyFoly?=
 =?us-ascii?Q?E1IYdmMzQuqfLRiKz5V+1NSDvcCXbIXFxwiKFeAtSG0PFMFf/aTCkw5CCg/2?=
 =?us-ascii?Q?zR3Rhdh0G69SqP1VdfRCI7b1fhHEqAE66o/KD60Opv58wQLWl3VgczTlxTi1?=
 =?us-ascii?Q?RBzuB70udJAoNktCfqkAGspaS8r0IXJiLqfcVFm0mVQWLjedS6oUuG3Vvhae?=
 =?us-ascii?Q?UCZfmD2ShM8eSz2uRhangXAT+Sx8i21UUkteBV31AbweSmERT7D9zCZYpt4s?=
 =?us-ascii?Q?u5CNSi6ki9E/VliSBPOxSeYZdjcNyM6N0G0m373Me/XCtYd203834JXOVRsO?=
 =?us-ascii?Q?lE3K3U3ak7NrQVtDCKtt38j5+J+i32vA+XreSF/5SgyKTio9yiBxXC7p+FhF?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d64686-f8aa-44b8-2e94-08daa17c5b25
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 18:07:50.5401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkUlPswVFaYD7nOQ9g9lUQ9j3+YvSXuhBLBt1b5pHR8rv4VAH/V6aFLlAbWv7/tAFXFZGr98moRKsHX8fVKoVLoboA1eOgGY9LVlNiOWN4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 05:22:41PM -0700, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 9/27/2022 5:10 PM, Matt Roper wrote:
> > On Thu, Sep 22, 2022 at 03:11:17PM -0700, Daniele Ceraolo Spurio wrote:
> > > The render and media GuCs share the same interrupt enable register, so
> > > we can no longer disable interrupts when we disable communication for
> > > one of the GuCs as this would impact the other GuC. Instead, we keep the
> > > interrupts always enabled in HW and use a variable in the GuC structure
> > > to determine if we want to service the received interrupts or not.
> > Even if they have a unified enable bit, can't we still just update the
> > per-GuC mask bit to get the same behavior (i.e., no interrupts
> > delivered to the host for that specific GuC)?
> 
> We could yes, but we've avoided dynamically using masks for gen11+ because
> it can mess with rc6 (e.g., see
> https://patchwork.freedesktop.org/patch/207829/).

+Cc Mika & Tvrtko in case they remember more historic details.

Is that expected/documented behavior?  Or is it an unlabelled workaround
that might not be an issue anymore on newer platforms?  Also, it looks
like that patch only applies to RING_IMR and doesn't necessarily impact
other interrupt masking such as the GuC mask.

The code today (which seems to be in use without problem on both gen12
and xehp) is setting all mask bits in GEN11_GUC_SG_INTR_MASK and only
clearing the single G2H bit at the point G2H interrupts are enabled.
GEN11_GUC_SG_INTR_MASK has now become GEN12_GUC_MGUC_INTR_MASK, but it
seems like keeping the masking logic the same as we've been using on
gen12 and xehp would be fine if we just never clear the enable bit?

> 
> > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 21 ++++++++++++++----
> > >   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc.c  | 29 ++++++++++++++-----------
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc.h  |  5 ++++-
> > >   drivers/gpu/drm/i915/gt/uc/intel_uc.c   |  8 +++++--
> > >   5 files changed, 45 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> > > index f26882fdc24c..e33ed9ae1439 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> > > @@ -17,6 +17,9 @@
> > >   static void guc_irq_handler(struct intel_guc *guc, u16 iir)
> > >   {
> > > +	if (unlikely(!guc->interrupts.enabled))
> > > +		return;
> > > +
> > >   	if (iir & GUC_INTR_GUC2HOST)
> > >   		intel_guc_to_host_event_handler(guc);
> > >   }
> > > @@ -249,6 +252,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
> > >   {
> > >   	struct intel_uncore *uncore = gt->uncore;
> > >   	u32 irqs = GT_RENDER_USER_INTERRUPT;
> > > +	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
> > >   	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
> > >   	u32 dmask;
> > >   	u32 smask;
> > > @@ -299,6 +303,19 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
> > >   	if (HAS_HECI_GSC(gt->i915))
> > >   		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
> > > +	if (guc_mask) {
> > > +		/* the enable bit is common for both GTs but the masks are separate */
> > > +		u32 mask = gt->type == GT_MEDIA ?
> > > +			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
> > > +			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
> > > +
> > > +		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
> > > +				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
> > > +
> > > +		/* we might not be the first GT to write this reg */
> > > +		intel_uncore_rmw(uncore, GEN12_GUC_MGUC_INTR_MASK, mask, 0);
> > > +	}
> > > +
> > >   	/*
> > >   	 * RPS interrupts will get enabled/disabled on demand when RPS itself
> > >   	 * is enabled/disabled.
> > > @@ -307,10 +324,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
> > >   	gt->pm_imr = ~gt->pm_ier;
> > >   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
> > >   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
> > > -
> > > -	/* Same thing for GuC interrupts */
> > > -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> > > -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
> > >   }
> > >   void gen5_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > index 1cbb7226400b..792809e49680 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > @@ -1519,6 +1519,7 @@
> > >   #define   GEN11_CSME				(31)
> > >   #define   GEN11_GUNIT				(28)
> > >   #define   GEN11_GUC				(25)
> > > +#define   GEN12_GUCM				(24)
> > >   #define   GEN11_WDPERF				(20)
> > >   #define   GEN11_KCR				(19)
> > >   #define   GEN11_GTPM				(16)
> > > @@ -1573,6 +1574,7 @@
> > >   #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
> > >   #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
> > >   #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
> > > +#define GEN12_GUC_MGUC_INTR_MASK		_MMIO(0x1900e8) /* MTL+ */
> > Technically we should probably give this a "MTL_" prefix or something
> > since we're not referring to new platforms as "gen12" anymore.
> 
> ok. Should I change GEN12_GUCM as well?

Yeah, at this point "gen12" is a historic term that only covers the
pre-Xe_HP platforms and we've been asked not to use it for any newer
platforms, even if they happen to have an IP version with a major number
of "12."

> 
> > 
> > >   #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
> > >   #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
> > >   #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > index b0beab44b34c..ab0263d8e1cf 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > @@ -98,6 +98,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
> > >   		     gt->pm_guc_events);
> > >   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
> > >   	spin_unlock_irq(gt->irq_lock);
> > > +
> > > +	guc->interrupts.enabled = true;
> > >   }
> > >   static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> > > @@ -105,6 +107,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> > >   	struct intel_gt *gt = guc_to_gt(guc);
> > >   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
> > > +	guc->interrupts.enabled = false;
> > >   	spin_lock_irq(gt->irq_lock);
> > > @@ -116,39 +119,39 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> > >   	gen9_reset_guc_interrupts(guc);
> > >   }
> > > +static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
> > > +{
> > > +	u32 irq = gt->type == GT_MEDIA ? GEN12_GUCM : GEN11_GUC;
> > > +
> > > +	lockdep_assert_held(gt->irq_lock);
> > > +	return gen11_gt_reset_one_iir(gt, 0, irq);
> > > +}
> > > +
> > >   static void gen11_reset_guc_interrupts(struct intel_guc *guc)
> > >   {
> > >   	struct intel_gt *gt = guc_to_gt(guc);
> > >   	spin_lock_irq(gt->irq_lock);
> > > -	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
> > > +	__gen11_reset_guc_interrupts(gt);
> > >   	spin_unlock_irq(gt->irq_lock);
> > >   }
> > >   static void gen11_enable_guc_interrupts(struct intel_guc *guc)
> > >   {
> > >   	struct intel_gt *gt = guc_to_gt(guc);
> > > -	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
> > >   	spin_lock_irq(gt->irq_lock);
> > > -	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
> > > -	intel_uncore_write(gt->uncore,
> > > -			   GEN11_GUC_SG_INTR_ENABLE, events);
> > > -	intel_uncore_write(gt->uncore,
> > > -			   GEN11_GUC_SG_INTR_MASK, ~events);
> > The modified postinstall left us with GUC2HOST enabled but masked.
> > Don't we still need to clear the mask so the interrupts will start being
> > delivered?
> 
> The postinstall does:
> 
> intel_uncore_rmw(uncore, GEN12_GUC_MGUC_INTR_MASK, mask, 0);
> 
> which clears the "mask" (i.e. the G2H interrupt shifted based on which GuC
> it is) in the mask register, so the G2H is allowed.

Woops, yeah.  I got the order of the rmw parameters mixed up here.


Matt

> 
> Daniele
> 
> > 
> > 
> > Matt
> > 
> > > +	__gen11_reset_guc_interrupts(gt);
> > >   	spin_unlock_irq(gt->irq_lock);
> > > +
> > > +	guc->interrupts.enabled = true;
> > >   }
> > >   static void gen11_disable_guc_interrupts(struct intel_guc *guc)
> > >   {
> > >   	struct intel_gt *gt = guc_to_gt(guc);
> > > -	spin_lock_irq(gt->irq_lock);
> > > -
> > > -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
> > > -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> > > -
> > > -	spin_unlock_irq(gt->irq_lock);
> > > +	guc->interrupts.enabled = false;
> > >   	intel_synchronize_irq(gt->i915);
> > >   	gen11_reset_guc_interrupts(guc);
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > index 804133df1ac9..061d55de3a94 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > @@ -78,6 +78,7 @@ struct intel_guc {
> > >   	/** @interrupts: pointers to GuC interrupt-managing functions. */
> > >   	struct {
> > > +		bool enabled;
> > >   		void (*reset)(struct intel_guc *guc);
> > >   		void (*enable)(struct intel_guc *guc);
> > >   		void (*disable)(struct intel_guc *guc);
> > > @@ -316,9 +317,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
> > >   	return err;
> > >   }
> > > +/* Only call this from the interrupt handler code */
> > >   static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
> > >   {
> > > -	intel_guc_ct_event_handler(&guc->ct);
> > > +	if (guc->interrupts.enabled)
> > > +		intel_guc_ct_event_handler(&guc->ct);
> > >   }
> > >   /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > index 4cd8a787f9e5..1d28286e6f06 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > @@ -636,8 +636,10 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
> > >   {
> > >   	struct intel_guc *guc = &uc->guc;
> > > -	if (!intel_guc_is_ready(guc))
> > > +	if (!intel_guc_is_ready(guc)) {
> > > +		guc->interrupts.enabled = false;
> > >   		return;
> > > +	}
> > >   	/*
> > >   	 * Wait for any outstanding CTB before tearing down communication /w the
> > > @@ -657,8 +659,10 @@ void intel_uc_suspend(struct intel_uc *uc)
> > >   	intel_wakeref_t wakeref;
> > >   	int err;
> > > -	if (!intel_guc_is_ready(guc))
> > > +	if (!intel_guc_is_ready(guc)) {
> > > +		guc->interrupts.enabled = false;
> > >   		return;
> > > +	}
> > >   	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
> > >   		err = intel_guc_suspend(guc);
> > > -- 
> > > 2.37.3
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
