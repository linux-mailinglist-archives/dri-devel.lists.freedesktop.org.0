Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B092165C7C5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 20:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1233A10E4D6;
	Tue,  3 Jan 2023 19:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0081B10E062;
 Tue,  3 Jan 2023 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672775895; x=1704311895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MCZfa7KhophHaUPUqmZ6QYXhnn16voqZZF5pK6HhhXg=;
 b=mk6tdfMSiBv8xJQJ6eoUEzdHeETi7QaaOBM8BgzHl8Hs7XIe7rEuu+p5
 Kgza334He07Pt5AgbYNX+cZmO+CSjutTJRTcs0EMPxPr7n6xjxcaG3WYQ
 3Rs5IF8QvaonoA4d0ZVhHYbC6CW7DUI/bOc42ydFjrSZyKqcf9rREdkXd
 LyZ0S0DaIAI9G2za6nrjX1zy3FSbxIf5GcQYI6mXYjDl6Q3TAXe0USoZI
 5oomqtIO7b9n9LOHA748ofBgNaQSRfjXRSso00RCfii0zUoc1/8jcbgeq
 Ov2G/LkpV1zy8r5YEaR0WME/W4iJj8IGUs1UnGV5xiSDqs11OL5Pf+f57 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="386180455"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="386180455"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 11:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="828946786"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="828946786"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 03 Jan 2023 11:58:02 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 3 Jan 2023 11:58:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 3 Jan 2023 11:58:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 3 Jan 2023 11:58:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 3 Jan 2023 11:57:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrR7ORM4cOJ6NK4H1IW47pxBOnUYVVlOVYXKrp1iXDrr1acLCw1ivussnL2Uin44RkSNr7ax/i0j+lOUN4m5NZQZH0a85bz1b+A53Qmo5sEQTXf/B1yhuPLRMon/V0AtilUf/Ndx1f7GC8qysfOmuVS5SQ/UCjhuT4py90gFqZDIQcPAMSfKMFJk7xX5ykUTv9FHK607344iPAwqzR/XDsB8fAOoGM9vS1MxNFBRLN9PqE57PYCh4yf9sR3nTtNTjxzKg9W4N5EEY98RKDNEcqvFngL0Jyi7xNp+J6+8jkCyx6HQ2Fe9jDF4QtMiGdDmgErd+8guyjyxcv2J4aKZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl9okC0gDTzIiut26rmlhrk/jMPOoIZpDuGv4AEKO6E=;
 b=m43zgwHQC89hYiZ9Lc/apD3X0BQLIUfV4PhUqFlSqUDiQjXjTtwzAiOAdFh+WxuDeJ26Ns1+CzXoQY+1MNQ/K6Ix9Mutoj7R1dqcIYWn4XrgiB44A2m+TuxJZxYOTzVi7AnwgXOM1KGbssUByWz8Qsl0bqP4Ge9u8VbBZLa6b9FSq5tkKWsU37i/ME8Nj8QvBPVQZfjYYoYDEcM/9udbkRS2dEiJVSh/ozg+YYM71YG61v6EzPTWPnJ2A6K44cqu+cz3txyUW5HT6cgxLKZExB4ccWf8vC9UR1U3Rn0hy26dWjOcVjZPr3+y9fQY2fz8v4bzF3/vQioGndyaV9DDDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 19:57:57 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 19:57:57 +0000
Date: Tue, 3 Jan 2023 11:57:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Consolidate TLB invalidation
 flow
Message-ID: <Y7SIwogJwS2teOgy@mdroper-desk1.amr.corp.intel.com>
References: <20221219101316.168129-1-tvrtko.ursulin@linux.intel.com>
 <20221219101316.168129-3-tvrtko.ursulin@linux.intel.com>
 <083b4424-d984-a2d2-1f58-035e4c1c82bd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <083b4424-d984-a2d2-1f58-035e4c1c82bd@intel.com>
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b2b757-c2f2-4a0b-7e78-08daedc4cf18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUbUWpgbOje35R+IwrD1HoLTrcHKrMgJAHy21ui0Jjtvm8343uXlN1x5u63jtv0RmMYXuQjNMQgsFTgWX39WV0IQ1IEuPtBLMknixivVRCN9Goh9aiUGRMwZyY/mVHlrTg8+QuUDiTWPq5PgRDJ+eFvVBeH1ZzpEQlV04cwVL2JHVQfK1MIq9RVfYXuFFyKZHh06Gpv69WcPSkI2Bmd91Bt6ehujZGzfl1SuaZjjsQojbnWLHRkWba1kL4UKCcBV4WQzWhl4bR9GTXSURuW/Le9XePy+B5f6P+RX5Ls9OfbUVhDq1mh8mrJNq2x+C1X41ZDg5ArfK6KHzyms6vFD+i7SBeRfWCUE91kqk6+iMpyfMz+Pw7hXBeJybj33jFnFcRQ1+1+ifqLRdTUixmU8dkgLMuw2OiaUDrIgOfeBDNEV9VDiQMI+1E3DVJIj2Iw6nrQ4aj3JV6T4r2AfMNE+KbVdYOgybvMzuXc/MtFeHyDn+sVf6v+lnIIbT1n79BhvAyCcOSCmJGrfsPqKqILZHofdxukmMAZtlAqM0rOC8DheyZV7lz7Tt1P8REfuBHW+f7Wd/ZyoUW3cEv4oef/IVtPdSjCz/R7d9kB4vdBuxKUK4DQwTCxo5EGvptYVoQDFxto72fq/HedYtpWeit6GhfRlZhlW2p/HJYQWQBrfdj47gOCXjo3NgME21FqgbbNN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(66946007)(8676002)(66556008)(4326008)(66476007)(41300700001)(30864003)(316002)(6636002)(82960400001)(2906002)(86362001)(38100700002)(5660300002)(8936002)(83380400001)(6486002)(6862004)(6506007)(53546011)(478600001)(186003)(6512007)(26005)(6666004)(22166006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dF2fEleivvRKuNIrZH6zr8Lq5TfWCA74Gr2maG30LnUvdT83c/HvbB8JNHQb?=
 =?us-ascii?Q?WFxW/GE4mWOfbhybUPUN2xfNf24BvxiV9uYTeP3JD4SDnjHQQ7ELr8Kgw7Lt?=
 =?us-ascii?Q?Eqso4C+aFZ00dAZiw4t2DYO4mUv/6r/oTG5PzQulDhHF0NrlMfB/PO0etZDR?=
 =?us-ascii?Q?+7Y87uqPoORm0EQRXP1w/ZuOza5QnIfKuLPiaKMXItIUXQCcomRPOKvYFJRr?=
 =?us-ascii?Q?N8tCtff9AR1QRpYusokVWcuzV2g/j9BcjX+HjmX+SWvH4Whtf3nqgtmVlKcS?=
 =?us-ascii?Q?kJcLwO3KEuEArRPm/7EgNcIFQ8bvqyaWpgZZ/NT56tYFvE+ID7d0Ny/NrZxX?=
 =?us-ascii?Q?uRgVDqyno0vG0TjH8gtYjPjM+jN1xswTCwoziQQnIEPdAOt2W2jlinNt2lJg?=
 =?us-ascii?Q?/ghUsUZOpnMkK+AiohG32cYgVSUmPSFRYZX2n7P5rbv6gHxjv5c7As6LQ7hx?=
 =?us-ascii?Q?/EiosWz+UTXHzLcL5max35ZspbTmMd4M2p8CSsw82HnQzd198DkZKDM0pG4h?=
 =?us-ascii?Q?LOlodHZOv98wDrQAfY/Wt4Bei9HO4HYbAGaMEimUXe9igNdq9RMYR5pLWSk4?=
 =?us-ascii?Q?siAuvrj/fc91FhS5hvRLHlvdjp7G4wnaU9RxSibNF82Rz59JxOwa8CVDeuYz?=
 =?us-ascii?Q?2nWi85S439SCOLkA8eO3RvMPMK/QA+hivfG6VkrjUppwOKwMhFmGVh/Y3Dmm?=
 =?us-ascii?Q?BfwfAxG4gWy5LyLND2WkqDYDOmxWDdVTyAVYujAnb4KHKVQkArNsLhDfcP8l?=
 =?us-ascii?Q?ZQlibPaRdQnKEi5JMB/fmw+675J2DWmCdBhx79pwxLt2QETVLU3mQCUrCxmf?=
 =?us-ascii?Q?tv4N1hveEridLfS6rBplp6brNQ9Ne83LTvhUWl3MSp+NVFTaFv657BLrgC3X?=
 =?us-ascii?Q?uYjHUKL7y4dIZWmRts65ShfwqQjr6VnZWQFwjkyggkdlvxB8DiB1cA5aOrlu?=
 =?us-ascii?Q?CsHm5MhOFIbmUTStj/sKIOm02TZ0pSCz4NmV28ylfCNfYhAGGiJ7+F9ibjxZ?=
 =?us-ascii?Q?xDE0G9sKsFna+MNx8MwA0lvdVijXXA6CYCcvt8dY6bcwPO7qr1z+avBIgQCz?=
 =?us-ascii?Q?M5mX5UGLyObzIPTDANl7LUSXrVW7W3OlL8U3cABEgaIc0fwtG5i1nnPiHvRV?=
 =?us-ascii?Q?tsa07bUYiYkmvLFEqb6/XfgJSJTqBpQr6sioBdCMKrsJa/Ij1qXfMidrgVVT?=
 =?us-ascii?Q?LajiwJGKeXbqXMLA5zyTePpJRFXZruVcACSaIrzJcoq03zluSO2Ncq5gGSmg?=
 =?us-ascii?Q?AwXTJ2QSSVdQFnam07D/182SyedVW14KT6CxlX7EsFK/0BF+Y4wMqpkuqbsm?=
 =?us-ascii?Q?5tCxvvX09M8mrYPu+pNLPeo3dEGmVHWpYm2JyZYxEse45lHtoon542cQNX4E?=
 =?us-ascii?Q?YwKKIvbuVSGsblmnDgw+VIk0TM03hwlbsNauyCQPhLJwkB0cTmYk5qspIwR5?=
 =?us-ascii?Q?W/6VhWWt6tPZdjMkfGRYR0A15MenhxBoFEVynq3+8tHXZLOBoxNCgBiTU41H?=
 =?us-ascii?Q?JH8fpU9oMsHHKurCn218EkP/gzunBVrdOSjW/3V0p6DeaSNTHhbr02OgLx5d?=
 =?us-ascii?Q?FT0OUpC9Wxa7ARfA8RFKk1fUfwnt7lHwpiwu9Ksy7gybk1quZJFPx6u9TaZc?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b2b757-c2f2-4a0b-7e78-08daedc4cf18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 19:57:57.1927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hcqFnJp0CsLv4cWVADsud/JW9nX/fJPlL++JyYRTsgBgtcgPzWf0MPLYKbVJckd7Giwk/v+Sc7UFghHFUDGyD1MgCvIysD42gdbXUK34oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
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
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 19, 2022 at 05:10:02PM +0100, Andrzej Hajda wrote:
> On 19.12.2022 11:13, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > As the logic for selecting the register and corresponsing values grew, the
> 
> corresponding
> 
> > code become a bit unsightly. Consolidate by storing the required values at
> > engine init time in the engine itself, and by doing so minimise the amount
> > of invariant platform and engine checks during each and every TLB
> > invalidation.
> > 
> > v2:
> >   * Fail engine probe if TLB invlidations registers are unknown.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
> > ---
> >   drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  93 +++++++++++++
> >   drivers/gpu/drm/i915/gt/intel_engine_types.h |  15 +++
> >   drivers/gpu/drm/i915/gt/intel_gt.c           | 135 +++----------------
> >   3 files changed, 128 insertions(+), 115 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > index 99c4b866addd..d47dadfc25c8 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > @@ -1143,12 +1143,105 @@ static int init_status_page(struct intel_engine_cs *engine)
> >   	return ret;
> >   }
> > +static int intel_engine_init_tlb_invalidation(struct intel_engine_cs *engine)
> > +{
> > +	static const union intel_engine_tlb_inv_reg gen8_regs[] = {
> > +		[RENDER_CLASS].reg		= GEN8_RTCR,
> > +		[VIDEO_DECODE_CLASS].reg	= GEN8_M1TCR, /* , GEN8_M2TCR */
> > +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN8_VTCR,
> > +		[COPY_ENGINE_CLASS].reg		= GEN8_BTCR,
> > +	};
> > +	static const union intel_engine_tlb_inv_reg gen12_regs[] = {
> > +		[RENDER_CLASS].reg		= GEN12_GFX_TLB_INV_CR,
> > +		[VIDEO_DECODE_CLASS].reg	= GEN12_VD_TLB_INV_CR,
> > +		[VIDEO_ENHANCEMENT_CLASS].reg	= GEN12_VE_TLB_INV_CR,
> > +		[COPY_ENGINE_CLASS].reg		= GEN12_BLT_TLB_INV_CR,
> > +		[COMPUTE_CLASS].reg		= GEN12_COMPCTX_TLB_INV_CR,
> > +	};
> > +	static const union intel_engine_tlb_inv_reg xehp_regs[] = {
> > +		[RENDER_CLASS].mcr_reg		  = XEHP_GFX_TLB_INV_CR,
> > +		[VIDEO_DECODE_CLASS].mcr_reg	  = XEHP_VD_TLB_INV_CR,
> > +		[VIDEO_ENHANCEMENT_CLASS].mcr_reg = XEHP_VE_TLB_INV_CR,
> > +		[COPY_ENGINE_CLASS].mcr_reg	  = XEHP_BLT_TLB_INV_CR,
> > +		[COMPUTE_CLASS].mcr_reg		  = XEHP_COMPCTX_TLB_INV_CR,
> > +	};
> > +	struct drm_i915_private *i915 = engine->i915;
> > +	const union intel_engine_tlb_inv_reg *regs;
> > +	union intel_engine_tlb_inv_reg reg;
> > +	unsigned int class = engine->class;
> > +	unsigned int num = 0;
> > +	u32 val;
> > +
> > +	/*
> > +	 * New platforms should not be added with catch-all-newer (>=)
> > +	 * condition so that any later platform added triggers the below warning
> > +	 * and in turn mandates a human cross-check of whether the invalidation
> > +	 * flows have compatible semantics.
> > +	 *
> > +	 * For instance with the 11.00 -> 12.00 transition three out of five
> > +	 * respective engine registers were moved to masked type. Then after the
> > +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> > +	 */
> > +
> > +	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {

This is bad...it only captures XEHPSDV and breaks the handling of DG2
(12.55), PVC (12.60), and MTL (12.70, 12.71, and 12.72).  You're not
hitting the warning as expected since those are all now being captured
by the next case of the if/else ladder.  With the way GMD_ID works, we
may also get new version numbers that silently show up in hardware too
at some point (e.g., 12.73, 12.74, etc.)

> > +		regs = xehp_regs;
> > +		num = ARRAY_SIZE(xehp_regs);
> > +	} else if (GRAPHICS_VER(i915) == 12) {

You'd want to change this to 

        GRAPHICS_VER_FULL(i915) == IP_VER(12, 0)

to get the behavior you expected.


Matt

> > +		regs = gen12_regs;
> > +		num = ARRAY_SIZE(gen12_regs);
> > +	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> > +		regs = gen8_regs;
> > +		num = ARRAY_SIZE(gen8_regs);
> > +	} else if (GRAPHICS_VER(i915) < 8) {
> > +		return 0;
> > +	} > +
> > +	if (drm_WARN_ONCE(&i915->drm, !num,
> > +			  "Platform does not implement TLB invalidation!"))
> > +		return -ENODEV;
> > +
> > +	if (drm_WARN_ON_ONCE(&i915->drm,
> > +			     class >= num ||
> > +			     (!regs[class].reg.reg &&
> > +			      !regs[class].mcr_reg.reg)))
> > +		return -ERANGE;
> 
> I hope the propagation of -ERANGE to device probe is OK.
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Regards
> Andrzej
> 
> > +
> > +	reg = regs[class];
> > +
> > +	if (GRAPHICS_VER(i915) == 8 && class == VIDEO_DECODE_CLASS) {
> > +		reg.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> > +		val = 0;
> > +	} else {
> > +		val = engine->instance;
> > +	}
> > +
> > +	val = BIT(val);
> > +
> > +	engine->tlb_inv.mcr = regs == xehp_regs;
> > +	engine->tlb_inv.reg = reg;
> > +	engine->tlb_inv.done = val;
> > +
> > +	if (GRAPHICS_VER(i915) >= 12 &&
> > +	    (engine->class == VIDEO_DECODE_CLASS ||
> > +	     engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > +	     engine->class == COMPUTE_CLASS))
> > +		engine->tlb_inv.request = _MASKED_BIT_ENABLE(val);
> > +	else
> > +		engine->tlb_inv.request = val;
> > +
> > +	return 0;
> > +}
> > +
> >   static int engine_setup_common(struct intel_engine_cs *engine)
> >   {
> >   	int err;
> >   	init_llist_head(&engine->barrier_tasks);
> > +	err = intel_engine_init_tlb_invalidation(engine);
> > +	if (err)
> > +		return err;
> > +
> >   	err = init_status_page(engine);
> >   	if (err)
> >   		return err;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > index 4fd54fb8810f..8c661fe89314 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > @@ -341,6 +341,19 @@ struct intel_engine_guc_stats {
> >   	u64 start_gt_clk;
> >   };
> > +union intel_engine_tlb_inv_reg {
> > +	i915_reg_t	reg;
> > +	i915_mcr_reg_t	mcr_reg;
> > +};
> > +
> > +struct intel_engine_tlb_inv
> > +{
> > +	bool mcr;
> > +	union intel_engine_tlb_inv_reg reg;
> > +	u32 request;
> > +	u32 done;
> > +};
> > +
> >   struct intel_engine_cs {
> >   	struct drm_i915_private *i915;
> >   	struct intel_gt *gt;
> > @@ -372,6 +385,8 @@ struct intel_engine_cs {
> >   	u32 context_size;
> >   	u32 mmio_base;
> > +	struct intel_engine_tlb_inv tlb_inv;
> > +
> >   	/*
> >   	 * Some w/a require forcewake to be held (which prevents RC6) while
> >   	 * a particular engine is active. If so, we set fw_domain to which
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > index 854841a731cb..9fb0ac03f51a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -983,36 +983,6 @@ void intel_gt_info_print(const struct intel_gt_info *info,
> >   	intel_sseu_dump(&info->sseu, p);
> >   }
> > -struct reg_and_bit {
> > -	union {
> > -		i915_reg_t reg;
> > -		i915_mcr_reg_t mcr_reg;
> > -	};
> > -	u32 bit;
> > -};
> > -
> > -static struct reg_and_bit
> > -get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> > -		const i915_reg_t *regs, const unsigned int num)
> > -{
> > -	const unsigned int class = engine->class;
> > -	struct reg_and_bit rb = { };
> > -
> > -	if (drm_WARN_ON_ONCE(&engine->i915->drm,
> > -			     class >= num || !regs[class].reg))
> > -		return rb;
> > -
> > -	rb.reg = regs[class];
> > -	if (gen8 && class == VIDEO_DECODE_CLASS)
> > -		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
> > -	else
> > -		rb.bit = engine->instance;
> > -
> > -	rb.bit = BIT(rb.bit);
> > -
> > -	return rb;
> > -}
> > -
> >   /*
> >    * HW architecture suggest typical invalidation time at 40us,
> >    * with pessimistic cases up to 100us and a recommendation to
> > @@ -1026,14 +996,20 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
> >    * but are now considered MCR registers.  Since they exist within a GAM range,
> >    * the primary instance of the register rolls up the status from each unit.
> >    */
> > -static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> > +static int wait_for_invalidate(struct intel_engine_cs *engine)
> >   {
> > -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
> > -		return intel_gt_mcr_wait_for_reg(gt, rb.mcr_reg, rb.bit, 0,
> > +	if (engine->tlb_inv.mcr)
> > +		return intel_gt_mcr_wait_for_reg(engine->gt,
> > +						 engine->tlb_inv.reg.mcr_reg,
> > +						 engine->tlb_inv.done,
> > +						 0,
> >   						 TLB_INVAL_TIMEOUT_US,
> >   						 TLB_INVAL_TIMEOUT_MS);
> >   	else
> > -		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
> > +		return __intel_wait_for_register_fw(engine->gt->uncore,
> > +						    engine->tlb_inv.reg.reg,
> > +						    engine->tlb_inv.done,
> > +						    0,
> >   						    TLB_INVAL_TIMEOUT_US,
> >   						    TLB_INVAL_TIMEOUT_MS,
> >   						    NULL);
> > @@ -1041,61 +1017,14 @@ static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
> >   static void mmio_invalidate_full(struct intel_gt *gt)
> >   {
> > -	static const i915_reg_t gen8_regs[] = {
> > -		[RENDER_CLASS]			= GEN8_RTCR,
> > -		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
> > -		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
> > -		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
> > -	};
> > -	static const i915_reg_t gen12_regs[] = {
> > -		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
> > -		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
> > -		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
> > -		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> > -		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
> > -	};
> > -	static const i915_mcr_reg_t xehp_regs[] = {
> > -		[RENDER_CLASS]			= XEHP_GFX_TLB_INV_CR,
> > -		[VIDEO_DECODE_CLASS]		= XEHP_VD_TLB_INV_CR,
> > -		[VIDEO_ENHANCEMENT_CLASS]	= XEHP_VE_TLB_INV_CR,
> > -		[COPY_ENGINE_CLASS]		= XEHP_BLT_TLB_INV_CR,
> > -		[COMPUTE_CLASS]			= XEHP_COMPCTX_TLB_INV_CR,
> > -	};
> >   	struct drm_i915_private *i915 = gt->i915;
> >   	struct intel_uncore *uncore = gt->uncore;
> >   	struct intel_engine_cs *engine;
> >   	intel_engine_mask_t awake, tmp;
> >   	enum intel_engine_id id;
> > -	const i915_reg_t *regs;
> > -	unsigned int num = 0;
> >   	unsigned long flags;
> > -	/*
> > -	 * New platforms should not be added with catch-all-newer (>=)
> > -	 * condition so that any later platform added triggers the below warning
> > -	 * and in turn mandates a human cross-check of whether the invalidation
> > -	 * flows have compatible semantics.
> > -	 *
> > -	 * For instance with the 11.00 -> 12.00 transition three out of five
> > -	 * respective engine registers were moved to masked type. Then after the
> > -	 * 12.00 -> 12.50 transition multi cast handling is required too.
> > -	 */
> > -
> > -	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
> > -		regs = NULL;
> > -		num = ARRAY_SIZE(xehp_regs);
> > -	} else if (GRAPHICS_VER(i915) == 12) {
> > -		regs = gen12_regs;
> > -		num = ARRAY_SIZE(gen12_regs);
> > -	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> > -		regs = gen8_regs;
> > -		num = ARRAY_SIZE(gen8_regs);
> > -	} else if (GRAPHICS_VER(i915) < 8) {
> > -		return;
> > -	}
> > -
> > -	if (drm_WARN_ONCE(&i915->drm, !num,
> > -			  "Platform does not implement TLB invalidation!"))
> > +	if (GRAPHICS_VER(i915) < 8)
> >   		return;
> >   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> > @@ -1105,33 +1034,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> >   	awake = 0;
> >   	for_each_engine(engine, gt, id) {
> > -		struct reg_and_bit rb;
> > -
> >   		if (!intel_engine_pm_is_awake(engine))
> >   			continue;
> > -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> > -			u32 val = BIT(engine->instance);
> > -
> > -			if (engine->class == VIDEO_DECODE_CLASS ||
> > -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > -			    engine->class == COMPUTE_CLASS)
> > -				val = _MASKED_BIT_ENABLE(val);
> > +		if (engine->tlb_inv.mcr)
> >   			intel_gt_mcr_multicast_write_fw(gt,
> > -							xehp_regs[engine->class],
> > -							val);
> > -		} else {
> > -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> > -			if (!i915_mmio_reg_offset(rb.reg))
> > -				continue;
> > -
> > -			if (GRAPHICS_VER(i915) == 12 && (engine->class == VIDEO_DECODE_CLASS ||
> > -			    engine->class == VIDEO_ENHANCEMENT_CLASS ||
> > -			    engine->class == COMPUTE_CLASS))
> > -				rb.bit = _MASKED_BIT_ENABLE(rb.bit);
> > -
> > -			intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> > -		}
> > +							engine->tlb_inv.reg.mcr_reg,
> > +							engine->tlb_inv.request);
> > +		else
> > +			intel_uncore_write_fw(uncore,
> > +					      engine->tlb_inv.reg.reg,
> > +					      engine->tlb_inv.request);
> > +
> >   		awake |= engine->mask;
> >   	}
> > @@ -1150,16 +1064,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> >   	intel_gt_mcr_unlock(gt, flags);
> >   	for_each_engine_masked(engine, gt, awake, tmp) {
> > -		struct reg_and_bit rb;
> > -
> > -		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> > -			rb.mcr_reg = xehp_regs[engine->class];
> > -			rb.bit = BIT(engine->instance);
> > -		} else {
> > -			rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> > -		}
> > -
> > -		if (wait_for_invalidate(gt, rb))
> > +		if (wait_for_invalidate(engine))
> >   			drm_err_ratelimited(&gt->i915->drm,
> >   					    "%s TLB invalidation did not complete in %ums!\n",
> >   					    engine->name, TLB_INVAL_TIMEOUT_MS);
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
