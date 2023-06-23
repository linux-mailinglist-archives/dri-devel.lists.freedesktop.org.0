Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8FF73C35E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EA210E6CB;
	Fri, 23 Jun 2023 21:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3C510E6CB;
 Fri, 23 Jun 2023 21:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687557414; x=1719093414;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m4YJcjLkxA1KXhynsyMbESAVjgmba2X1b3dBSCNHUSw=;
 b=S9uPEuOey3XUIAb4X2fWn+Re1C1YBXsyBxGM2LkLpc8TRiabXPSldCR9
 YnwcQ6mlzT1omqI3QRWrPYjWW4GvkpWZlMhpdXq35eh/AFI7YDYeZz44R
 KqrLjz1axsRggCyZxCkvLDhYUM6t9PeJg3EbVDLca1NNlr2FDflN9LyVB
 qvA8yaqmOPOk6sIj8AaIwGaCZrimo+gvIdzfcgB2QcvY6IApkzWLXynq7
 yC6egNvmh9I0ur763cOaQHQTG0k9/2k6Wrp1an64m2HBvU6ds2pcDIr7B
 D2LGp0x4MjAhGcXjnj50NSAG/Y7l2Ae8D4+q68gVQ3htWjDf3co3I9F2l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="345625856"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="345625856"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 14:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="839592003"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="839592003"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 23 Jun 2023 14:56:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 14:56:53 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 23 Jun 2023 14:56:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 23 Jun 2023 14:56:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 23 Jun 2023 14:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYjTx9DRWOhQVqZuNzIlGR9Wx50Ru83ZcT0KtBTdmcwcoCdaqP77c9FmSAKhYpo+6z82ctqURSHfNOgfoAV+aKlpcTHLmlE9z6OCn6mo9eKdJRnUs51C5Lz+A78AB+1iQzAwWiNAaD6AyEV4xsgMMaXgVbSgoz5BC3BJfbBpn+XwtDTLlcYUDSI/Jq4+nL4CNMz7PLsuab5PUGgwFuHkeEEJNk78FKEHyFaKHzTOMHLW73WyEBUuTi+bPxGCHaq7aT/B3iKsXrBCaNhfyJAISCIlkIK/ruDwdl5BG5UxP3KE6QRPZhc1L+80AT1UhjFBcZw2dFaC4qAjXzq9deUGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXhHbzxg5Ag368w8Hza3D53j6GaY/c06rEgd8mKtqdI=;
 b=hpvrmFvtbCADWhVrKVZZLNZFl+HAIOcjoeOjs04t9ieOBQ69m3og4EbIE+c6zTOthF7I64USvdcujcidP9xXNTxgYx6Jw8M1vTY1lnAvRb8/7h5NLpnG31hKzWQt4/I+A2nH1iOz2YtHRdtIA5JxBKEeiADJm7EiVoaM46KVy3B6KGoyccRrOir4kUrUoH90LybEkckz0It4lmKtnRWsq7jZorzpDNu9Nw3jGk0UBb/5L4hmKtQkM6kNcbg8ovZbTP9BmFLO+VoBybzXiExe21EbbefwZaoK5ulCnZrm5x6ITowyxZz94ceK9EEyssefGM0X2exgMNedAXL5UM/wCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5360.namprd11.prod.outlook.com (2603:10b6:5:397::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Fri, 23 Jun 2023 21:56:49 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 21:56:49 +0000
Date: Fri, 23 Jun 2023 14:56:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/gt: Fix context workarounds with non-masked
 regs
Message-ID: <20230623215646.GJ5433@mdroper-desk1.amr.corp.intel.com>
References: <20230622182731.3765039-1-lucas.demarchi@intel.com>
 <3337022.2OMYdDKdcH@mizzik>
 <ehp36knxqfilobajjyk54oamk3n43s3cja5webx3q4jzm6xrlm@idrattdnr3fa>
 <2063427.kFxYfkjxrY@mizzik>
 <aet7uj3ldnjk5rdgc2fwsn42uqgx5kbxau3efvdgmnhq473s2m@d6uyzwskmfaf>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aet7uj3ldnjk5rdgc2fwsn42uqgx5kbxau3efvdgmnhq473s2m@d6uyzwskmfaf>
X-ClientProxiedBy: BYAPR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5360:EE_
X-MS-Office365-Filtering-Correlation-Id: 90668ad1-a93b-4d24-bf6b-08db7434bf07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFanIP2J0nASCmx9futPbhocY2qJxI3rRHOxum1/q2/2TpfYa7mEouFlI2PKq5oFq8+buv10Ya71G6DM8GeyyCW2/oxuG+Zq41kaqAs2FYbpWaJUdhCX6nwxXbsagGQkcOR7eOtPfJx7ZAj6uPNOtQibTHZpKefhZYPCoxJBUV+ORvgVwV6P60ybqUAKCOJqDNh2MDUbyOPUCBpEYHWBItmNovAUEf+PjHHtjnUxEir93MXbItI4YZv74nXl/My8XsXIMjG0Qlt5NCuEtgh8ETQXJllxIatDgCJA04l60JaLK0K7/ixSTBV2owdIczpYLLjIy/HAMluF8EZe8mMEdXCmYcEthD69sY00x1zBss6vWD94ygVWUqaz8Xai+c4Wx3JMr89r7uqOYxHjx0TVOWde6SVHeD95qy99T6GtEfYq+9Bi8l9UsHP7mqkTi3qxrgHevAkn+TRceF90iAM+u6s+kRCl6FRO4zM2MLar2ycEOdKE8E441eOok+k6jwlUn2ge9ezH8QysDWjPPOwfp9LwYSh6RXvPIRJTVAPRjib6ano/oZuJpaAlZamFYQGX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(6862004)(2906002)(478600001)(33656002)(38100700002)(5660300002)(66476007)(66946007)(83380400001)(66556008)(6666004)(6486002)(6636002)(4326008)(316002)(41300700001)(86362001)(8676002)(82960400001)(8936002)(53546011)(6506007)(6512007)(1076003)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c+LhMYYIvmeY1AmElKTe9EMyUWSK3H6okRzwOamFmoHfDXkq5DZtAmBv29T3?=
 =?us-ascii?Q?DuveBXDjYiH0gGxmYM2WyQQxkAczSV6EJML0bR+ztb4K9iWXqdJwbBNxhZQz?=
 =?us-ascii?Q?w1R3UNAwjl8CRjoqlSr6dvebMY05S/foR5RHv75hRMrojHIkTE8cO0814SMZ?=
 =?us-ascii?Q?6LFlvpHhM63VpfkBvFkdfcGsBiBgQbb5nPVNJNNBFMV/uTuvKgRGVag+ZBO/?=
 =?us-ascii?Q?3ISmw2kIUduvSOaN5nHOk8Dwr8TxC9y1jxV7lTusq4TitD0PGnFz5HjLjKxw?=
 =?us-ascii?Q?CriKOcIJkag/Ko5ZxbQOPGANAYFdTxtWT4+sJfEE+1Es8suiuw+aKb7nJbFP?=
 =?us-ascii?Q?wCHzozAqbRuEmK0qsYm7IMOW+eVkycwdmmxm0cRCeGY0R0s6h2KbOz9EcWKJ?=
 =?us-ascii?Q?rmCOzzoTK+XUo4YsvvYDVSbG9Z/2rvNRbo1GqXp2yoUSyJ5+EBmN50CGmpu5?=
 =?us-ascii?Q?FV+uSXN48HC9yB7lY6TBglmD/ggRwTWE2Ivu0hmLnQdqRkh1YZ7/wpK1vLMI?=
 =?us-ascii?Q?nvC+M72Q0d+KchZrt2Gx2IuQnhHr3ls9TyuDOi8ktGdKGPB76HWoFM7FI9SU?=
 =?us-ascii?Q?gHJiB/YkkXCoQr2Sz13kWoalqoL1PgrM9s4P4PkD4W1cGb0p7V2m79yNhECd?=
 =?us-ascii?Q?jl8ciaquHN0BD3Uu1k3PRax1igvwdLobC6jf9O1M2suF4e6lk/v20LyhTs23?=
 =?us-ascii?Q?vluvOHkRirBQ6kqDicBf8fOfAIRN9+9JFpYusr1h1ZEzZmnUc/VF5RI2zXyy?=
 =?us-ascii?Q?kUkVWBWDR98gKmzUQ5yEOD0qoN0TSocRTY3gp+6vTr+eeXxbHkw23Rps4lt5?=
 =?us-ascii?Q?vtMZJi68+8732IDE2ZDBTHk8VlYoGZykD3IyjLs6ywcRA37+sI60CBPgxP5+?=
 =?us-ascii?Q?s4BKAIXUWVD7H6S8qFOmQKbSXdwCh1F9FyoaLlPiJ8aSYzDkDs358iGQDkD+?=
 =?us-ascii?Q?oeSlQQ3kmNHaEVPy+E4wMFq8L3VcBromk5uPZaJbnmfl0jBVzfM6nwQNBAxh?=
 =?us-ascii?Q?2f8OOO/nfC2CFxaVIe0QPB2pEEl0Cz005BoRU2ISoI4/240t3KwMupi8RRxv?=
 =?us-ascii?Q?qVYUXBS8JRnilD1mQbe0EmZ9qwuppfz9TCEpkcInB1BkQ1F13oTNF+JuHYwD?=
 =?us-ascii?Q?R8exUX8s8wr/IFoabisD9xYaDaCffUW8iL2RCMrX8iJNgbinwAhKyg0Tp8bP?=
 =?us-ascii?Q?NsRpGKf+K2g9Nv02BK+XKCcb3mfpGe6cEUKE0PKQylIf8w+aO/KtXAtVRfwc?=
 =?us-ascii?Q?wPwuT23Dq3t/4Wj/sWmODxncinLO6I5YvJYRW6vTT6yBghUMWNWn6Js2ZsJB?=
 =?us-ascii?Q?QDBPqz3myaLVEATWx8d7xiM0XlBFt/Nbjnk3qDHUVU+KQuQ2jTq5mnIFSQXH?=
 =?us-ascii?Q?4DgVbNDsPozeQ/EKp+1jxpJFdZ8lmLj5+Oqync/cyUMOFWxa3/K9pfdXZB5c?=
 =?us-ascii?Q?f7IrN8hZFQiQVH3utPzzd2xv28UG23k6J9s63tk6NFtR5LuMy/Rrz1Otac+L?=
 =?us-ascii?Q?xNKmFYAv6OQ6caQOUQLGWquuWrYrqJJltkYKEiSi0pwukZauAAm8H44ssLCk?=
 =?us-ascii?Q?Lbso3xA2BW5mRsT8bvU5m9n4wutUrH+87stlJ8OrSvVg2hV/Zy/nFhj1ptBE?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90668ad1-a93b-4d24-bf6b-08db7434bf07
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 21:56:49.6379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hz07GJXev7OGy0OtvXLKh+X7jOBxlb/cHboDw4EY7QeXIPBW0/TqWx14x+2r4fEs7wALSwD+t7iYAxL+a0elpFGdbTPFH6pwQHWN2R8BeMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5360
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
Cc: stable@vger.kernel.org, Kenneth Graunke <kenneth@whitecape.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 02:05:20PM -0700, Lucas De Marchi wrote:
> On Fri, Jun 23, 2023 at 12:48:13PM -0700, Kenneth Graunke wrote:
> > On Friday, June 23, 2023 8:49:05 AM PDT Lucas De Marchi wrote:
> > > On Thu, Jun 22, 2023 at 04:37:21PM -0700, Kenneth Graunke wrote:
> > > >On Thursday, June 22, 2023 11:27:30 AM PDT Lucas De Marchi wrote:
> > > >> Most of the context workarounds tweak masked registers, but not all. For
> > > >> masked registers, when writing the value it's sufficient to just write
> > > >> the wa->set_bits since that will take care of both the clr and set bits
> > > >> as well as not overwriting other bits.
> > > >>
> > > >> However there are some workarounds, the registers are non-masked. Up
> > > >> until now the driver was simply emitting a MI_LOAD_REGISTER_IMM with the
> > > >> set_bits to program the register via the GPU in the WA bb. This has the
> > > >> side effect of overwriting the content of the register outside of bits
> > > >> that should be set and also doesn't handle the bits that should be
> > > >> cleared.
> > > >>
> > > >> Kenneth reported that on DG2, mesa was seeing a weird behavior due to
> > > >> the kernel programming of L3SQCREG5 in dg2_ctx_gt_tuning_init(). With
> > > >> the GPU idle, that register could be read via intel_reg as 0x00e001ff,
> > > >> but during a 3D workload it would change to 0x0000007f. So the
> > > >> programming of that tuning was affecting more than the bits in
> > > >> L3_PWM_TIMER_INIT_VAL_MASK. Matt Roper noticed the lack of rmw for the
> > > >> context workarounds due to the use of MI_LOAD_REGISTER_IMM.
> > > >>
> > > >> So, for registers that are not masked, read its value via mmio, modify
> > > >> and then set it in the buffer to be written by the GPU. This should take
> > > >> care in a simple way of programming just the bits required by the
> > > >> tuning/workaround. If in future there are registers that involved that
> > > >> can't be read by the CPU, a more complex approach may be required like
> > > >> a) issuing additional instructions to read and modify; or b) scan the
> > > >> golden context and patch it in place before saving it; or something
> > > >> else. But for now this should suffice.
> > > >>
> > > >> Scanning the context workarounds for all platforms, these are the
> > > >> impacted ones with the respective registers
> > > >>
> > > >> 	mtl: DRAW_WATERMARK
> > > >> 	mtl/dg2: XEHP_L3SQCREG5, XEHP_FF_MODE2
> > > >> 	gen12: GEN12_FF_MODE2
> > > >
> > > >Speaking of GEN12_FF_MODE2...there's a big scary comment above that
> > > >workaround write which says that register "will return the wrong value
> > > >when read."  I think with this patch, we'll start doing a RMW cycle for
> > > >the register, which could mix in some of this "wrong value".  The
> > > >comment mentions that the intention is to write the whole register,
> > > >as the default value is 0 for all fields.
> > > 
> > > Good point. That also means we don't need to backport this patch to
> > > stable kernel to any gen12, since overwritting the other bits is
> > > actually the intended behavior.
> > > 
> > > >
> > > >Maybe what we want to do is change gen12_ctx_gt_tuning_init to do
> > > >
> > > >    wa_write(wal, GEN12_FF_MODE2, FF_MODE2_TDS_TIMER_128);
> > > >
> > > >so it has a clear mask of ~0 instead of FF_MODE2_TDS_TIMER_MASK, and
> > > 
> > > In order to ignore read back when verifying, we would still need to use
> > > wa_add(), but changing the mask. We don't have a wa_write() that ends up
> > > with { .clr = ~0, .read_mask = 0 }.
> > > 
> > > 	wa_add(wal,
> > > 	       GEN12_FF_MODE2,
> > > 	       ~0, FF_MODE2_TDS_TIMER_128,
> > > 	       0, false);
> > 
> > Good point!  Though, I just noticed another bug here:
> > 
> > gen12_ctx_workarounds_init sets FF_MODE2_GS_TIMER_224 to avoid hangs
> > in the HS/DS unit, after gen12_ctx_gt_tuning_init set TDS_TIMER_128
> > for performance.  One of those is going to clobber the other; we're
> > likely losing the TDS tuning today.  Combining those workarounds into
> 
> we are not losing it today. As long as the wa list is the same, we do detect collisions when
> adding workarounds and they are coallesced before applying. However,
> indeed if we change this to make clear be ~0, then they will collide and
> we will see a warning.
> 
> Applying them together in a single operation would indeed solve it
> with a side-effect of moving this back to the workarounds. Either that
> or
> 
> a) we handle the read_back == 0 && clear == U32_MAX specially when
>    adding WAs. If that is true, then the check for collisions can
>    be adjusted to allow that.
> 
> b) we give up on this approach and proceed with one of
> 
> 	1) scan the ctx wa list. If it has any non-masked register,
> 	   we submit a job to read it from the GPU side. MCR will
> 	   make this harder as the steering from the GPU side is
> 	   different than the CPU
> 
> 	2) emit additional commands to read and modify the register from
> 	   the GPU side
> 
> 	3) find the register in the golden context and patch it in place
> 
> 
> 
> 
> > one place seems like an easy way to fix that.
> 
> I'm leaning towards this option in the hope we don't have have
> another GEN12_FF_MODE2 in future.
> 
> Matt, we've been pushing towards separating the tuning from the WAs, but
> here we'd go the other way. Anything against doing this for now?

That's probably fine as long as we leave a comment behind in the tuning
section explaining why that specific setting is found in a different
spot.


Matt


> 
> thanks
> Lucas De Marchi
> 
> > 
> > > >then in this patch update your condition below from
> > > >
> > > >+		if (wa->masked_reg || wa->set == U32_MAX) {
> > > >
> > > >to
> > > >
> > > >+		if (wa->masked_reg || wa->set == U32_MAX || wa->clear == U32_MAX) {
> > > 
> > > yeah... and maybe also warn if wa->read is 0, which means it's one
> > > of the registers we can't/shouldn't read from the CPU.
> > > 
> > > >
> > > >because if we're clearing all bits then we don't care about doing a
> > > >read-modify-write either.
> > > 
> > > thanks
> > > Lucas De Marchi
> > > 
> > > >
> > > >--Ken
> > > 
> > > 
> > > 
> > 
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
