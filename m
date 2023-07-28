Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F2766FA5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80FA10E18C;
	Fri, 28 Jul 2023 14:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6803710E0D9;
 Fri, 28 Jul 2023 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690555340; x=1722091340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hOvsk5/BXIKFbxI94egt6FItE/yJewhagg1s4vXSoLM=;
 b=A6ANF4EXmWncfRt8G6iliSFaES54R7oGt3TovSaaKfqlO4ye+YXdIC8u
 1UJZ3p3Ld4lccAAcoyKIuyOysoKHWR3qf0L614f/6jhWr5c+oG5q8pDq7
 tlKEnTYVz8gUJnzOKmJVkqN/KG+aGijm1uFxXgMkqFlAdsK1in7EI105/
 YvdyueZksueuwl1UVzFQ/UFOWMUsqRCjCFvhAIDNDWmTRQZlQj8LJqIHH
 4OEE7RMvEHNOH5n63T8fe3tBEtfTL2se8UktW64gAaX0+KkmFyY75ONR1
 uT+qchra3ZCqS6r3xzQ8E4RhSLtqETB/gzLqjUk8VDnJ65FQxAeQHxCXG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353519065"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="353519065"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 07:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817537520"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="817537520"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2023 07:41:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:41:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:41:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 07:41:36 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 07:41:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6gQz71+YHZ4cHqYgQAfxyfmxfmP4R18UFJrIpaU426GAw0woZCvsTCVhITCxfyhCXQpyPh2uZDvb1PdD5a6lXfozYA4Pg/xKWcpiMaVBk76Mupzd5ZWGiEUYjtxO82rLJ2aXYyoiROfElxySahbUB3BXwwvOoyhBcoujTyVu/UMQ76JiMBLAwlJTzN85dGV5u7fFFSBnRHFPzjmh3FausJVm9U5vi2kQUhJhiwRf5GuWU64bk0MJXa0Cir+LDSbjnM9h6QrzQwHzI/v9FK23z/eKLyRxR4jXBnDRW4ohbyHoH9XTPhmNl+6cMOqTLJ/RnsMEwkXvZbRrTuYwVXA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHTydtVHeVdh8EqaBDQ36XyY5rxJOBT5hZk7gHTxwh8=;
 b=YiTEdcJyuxFYgn8QXB1Y/4P/4f68V7evv0KfIbd/Ny0x1ZnI2ipmKgs6Elr2YMq9X1ze2I9FC8TOhSZ/2ZhgvxNTnI6p9fmSk7vtPOW7qcah+oBcmttc3ooDMC3J7OsRh4kt40xySbXjUE7LcJMDSv/L1QAQQJPhFMu2FyOT2tA8g/kj6NjTUu9FOvMvrKSSAvY+RHfglAB3U2AS+9QJzWOBQiH/+JiPfEPzA+CjKkDaMue9vpeOCX0OECjsjRLtV3Rp6WGiKbLVetAx++lIgnEef9xsyYk/pXjXgh0ti4DDQhV7TDOicEl0RXtFDc+Vjt7mgH+wJp34xbJOhlg3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 14:41:34 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 14:41:33 +0000
Date: Fri, 28 Jul 2023 07:41:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 2/8] drm/i915: Split PTE encode between Gen12
 and Meteorlake
Message-ID: <20230728144130.GJ138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-3-tvrtko.ursulin@linux.intel.com>
 <20230727222544.GB138014@mdroper-desk1.amr.corp.intel.com>
 <fcca49f6-158d-1504-bc33-263095690e95@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fcca49f6-158d-1504-bc33-263095690e95@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d789d7-60eb-4ca4-6be6-08db8f78bcb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcWskhzrDO+QdO1yfqO2ukephBp00WKF1BWt3K8+TBPU9Sm33kw1m8GhdqlMu6zgUChp1BVee+NPErMM3ixqOvHWLRRbFWfkoAGttM/nKEHwIOAtYEiXU2gOmp7RjbJevEGSfr3MS0kh30SMWXo8iYG4rk227bgceX5Q4eSdAPbkV19b8pNS38OPiWWfRY1nrCmhplbM5ABS5cq6fM136LRjtTvdGinyuVDC/fi1mY6EGq7V+j6ZqZ7vxePSbGhWjY7yCPZiSPoyA7asTMCJFiKS0AHDNsvM/gULu4W7iGnKmG8/X0ryAKI3QHOpRxpWHvUfg+fWEYuJGj/13WLKX5LMjyDgzRo4/IZNwhB78NTFj5gSsldh1vYADXZImNLeHAoM0uo685hNHAGcsCO+F+NZB9BUQoIcUd4rzmPlrNfPfQLAoUXX8XjtGrabC0DdtxQg7Vl1FyU6/qoSx6Wob4Otyi4VEmFlDVMd8FCezrDDWpO5fpfdUP58Lrzy9GiBKcvsYFXLA5ai7p/6U+ZAn+chkjWw6+ZpVvh3iCBywVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(8676002)(8936002)(1076003)(26005)(41300700001)(82960400001)(4326008)(6916009)(966005)(6512007)(316002)(5660300002)(186003)(53546011)(6506007)(6486002)(66476007)(66556008)(478600001)(66946007)(33656002)(86362001)(83380400001)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ubHiGnkWlomRKq+M1DNhHY4yvd4wjzOwC+VyQms4xF+3sGB3SkCL2x4dTJZU?=
 =?us-ascii?Q?vZCfhZTB+ypsiRrecYGRP2vbwmvRVMvGZfOjJf6fAMIkKuqfSirxmGCWiZEy?=
 =?us-ascii?Q?gaoIVytJwPc0HTFIUTk9AT9/3ozvTy3W4ANlO3N4ATK+fbn7HncWzjTZC5DO?=
 =?us-ascii?Q?tZPQ4G/y7OiJ00q1XjeQmlvjw73knw48ka1fOzfbbNX+cF60+zGTvRVPivIg?=
 =?us-ascii?Q?YzUW9QHth1evWdLUJaZKwwELjjoL8gIeW3qt/aHGDAp9QbAbLyPFzhDPJ/Un?=
 =?us-ascii?Q?Yn7jdRvrOWX/EbMsMGeFjVVNtUXL6W6bDal0X0e+oAIOcTykdcvqvu1cpEW0?=
 =?us-ascii?Q?EHgyCzQOMLRR7uvJFExcYB1tsfbp4b27olb33WdPPd2mW6LO8x3hX6zl81ud?=
 =?us-ascii?Q?17683iO3zpAhGbpTM6pU66G3rFPLg4sqNKpIEPXzeJxJ3+IMS9IYN7bmCe0X?=
 =?us-ascii?Q?9oHAQJWbU77HI1ZS9wSer2undVaMBEOmW9RZXoEbvYvqaYgYPe4vcjHrIEWd?=
 =?us-ascii?Q?HpvexBiOeuKWmDHeLTji9s+kICfYwrU8FLgOCAXGHUtGQpkoZErJSSmuTRN6?=
 =?us-ascii?Q?fF7efRE+D2ywdUZgv0P/sq3J3IZfWcY+7i8Ls+hQuhWD4iUwc09yE5lqi/4U?=
 =?us-ascii?Q?TqIBh9jl0jeWGv+MWDThvp1cIlfHfJJsZJw0mtphOdxo8NooWiTANFn0XbW9?=
 =?us-ascii?Q?W9k/7xerbCyjLFXP75mwURCpZ58RVOGAPLBQ9D7XpbocwavBLP7yfaLZQb17?=
 =?us-ascii?Q?890mMO8tYiJ4cx2OjY1q//had0BDZkAf75QfhbhTBPLcM4/8VSvYDDHc4cAd?=
 =?us-ascii?Q?ovuRPI0REhypRgRCshAxVyNQhrxb5CT+mh67oH4gwrEn23sBeg8duUHYLQsy?=
 =?us-ascii?Q?veEEavTUBM2vzSGmuf7jo+R/fT0AVXCyJf78dNVWFbuTQRfuB+7/gI0QkDyQ?=
 =?us-ascii?Q?Fh27iIHPe+qs+iWwh1878YV1riUhfXQvLliorW8q6tn3zaKqZ4wCvVUzBi+5?=
 =?us-ascii?Q?wlObJdYz9MTIseOgoM7jpcV8kqWoUlcFJYGJPC5oFoKOcOxTOaSnuHq4TtvK?=
 =?us-ascii?Q?UZOSOSEz7zPx5f7XcBqFrFPv/yqPnuWK13M2UEvUoTNPCvg4eIoALPbr9OVq?=
 =?us-ascii?Q?dmcJKnlvUYLHwaXsCp91aGDPQ2k+G0UtlIvtqkAzJALPm+CkiVOtBPGELdbg?=
 =?us-ascii?Q?LWTnj6T5gjgiinBj+2uGX830Rm9T6aoRJVMkYQnrNRApD5NNC2wqjTmrv3EB?=
 =?us-ascii?Q?ojduyqmMmQfEE8fmLeXN10XI6H/cKoMu6tITYzpqgUUg4z0biLQyXcnaDL2z?=
 =?us-ascii?Q?Hd7goBDC0gK3JH/g/qYyBr+SQF/RrYeuzSvfDsHzYgRKNHkBF5TraYOzh9VN?=
 =?us-ascii?Q?iJacs/vZPKJp5FHKCHbtHN8HeYxC5gAQ/uzbQSjl7an73LeO5qfqc9zTMySo?=
 =?us-ascii?Q?JtFryh/bW2rcIxAgfYRQGboBzgu3JcXQAliKFKsaUnZNSXnKsKCB6kYuA4sj?=
 =?us-ascii?Q?eOAhPJt/sdAQn5gMYQ6iZeWtB4SCahNZUPsN/RHUYUuGnVCLFsYHDMTradus?=
 =?us-ascii?Q?6dwNdBMFw3ROEB3KszmljMwBrzUE5hJrN2NN7UYf1QrhwqM/W0GRFcAPVF3b?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d789d7-60eb-4ca4-6be6-08db8f78bcb3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 14:41:32.9392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpCwYl4SwQzSSuIAizBTH82EbiFiJSVQCrOqwrMgATQOqd6VuASybyMAfC6bf5FXZvPY7qkuS0NPGq870w/xNb2nqV+oMYwhEkCI10IvhUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 09:18:36AM +0100, Tvrtko Ursulin wrote:
> 
> On 27/07/2023 23:25, Matt Roper wrote:
> > On Thu, Jul 27, 2023 at 03:54:58PM +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > No need to run extra instructions which will never trigger on platforms
> > > before Meteorlake.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 26 ++++++++++++++++++++++++++
> > >   1 file changed, 26 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > > index c8568e5d1147..862ac1d2de25 100644
> > > --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > > +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> > > @@ -63,6 +63,30 @@ static u64 gen12_pte_encode(dma_addr_t addr,
> > >   {
> > >   	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> > > +	if (unlikely(flags & PTE_READ_ONLY))
> > > +		pte &= ~GEN8_PAGE_RW;
> > > +
> > > +	if (flags & PTE_LM)
> > > +		pte |= GEN12_PPGTT_PTE_LM;
> > > +
> > > +	if (pat_index & BIT(0))
> > > +		pte |= GEN12_PPGTT_PTE_PAT0;
> > > +
> > > +	if (pat_index & BIT(1))
> > > +		pte |= GEN12_PPGTT_PTE_PAT1;
> > > +
> > > +	if (pat_index & BIT(2))
> > > +		pte |= GEN12_PPGTT_PTE_PAT2;
> > > +
> > > +	return pte;
> > > +}
> > > +
> > > +static u64 mtl_pte_encode(dma_addr_t addr,
> > > +			  unsigned int pat_index,
> > > +			  u32 flags)
> > > +{
> > > +	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> > > +
> > 
> > Would it be more readable to start with
> > 
> >          gen8_pte_t pte = gen12_pte_encode(addr, pat_index, flags);
> > 
> > and then |-in only the MTL-specific bit(s) as appropriate?
> > 
> > >   	if (unlikely(flags & PTE_READ_ONLY))
> > >   		pte &= ~GEN8_PAGE_RW;
> > > @@ -995,6 +1019,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
> > >   	 */
> > >   	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
> > > +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> > > +		ppgtt->vm.pte_encode = mtl_pte_encode;
> > >   	if (GRAPHICS_VER(gt->i915) >= 12)
> > >   		ppgtt->vm.pte_encode = gen12_pte_encode;
> > 
> > I think you wanted 'else if' here.  Otherwise you clobber the MTL
> > function pointer.
> 
> Doh this was a strong fail.. Yes and yes.. I even had it like you suggest in
> that patch I mentioned to you earlier..
> https://patchwork.freedesktop.org/patch/546013/?series=120341&rev=2.
> 
> Do you have an opinion on that one perhaps?

Yeah, I overlooked that patch before, but it looks good to me.


Matt


> 
> Thanks,
> 
> Tvrtko

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
