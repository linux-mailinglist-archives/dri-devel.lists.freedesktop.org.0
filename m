Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327FC68EF58
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 13:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1875910E0C7;
	Wed,  8 Feb 2023 12:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4873D10E0C7;
 Wed,  8 Feb 2023 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675860737; x=1707396737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qvRbGS18X6R9L0RJky2Hqbk7zXrRD7jt9yoF/EZXElY=;
 b=DSXWSDWusrZOcb+2xsXbPeJokRi//tlBsOFg91sY6Vg5/8faoM6g4Qb4
 rbEQBlUCyR2dbnS8BPqESD/kmT+NK/MmgZJDn4hWJFpTs1lecIaw0V5as
 F4D1HQbf+M4Hmpvin62GazZwuBN6Sg6K1VHXybk4+GL+ChBSwGEHP1qOE
 GOn66SwdHlIPCyRg2xdRUXaIN46IqjcSuw2yinCgpmnvX3kTfMezA1rnY
 2siEQMhINkyugCQYL8pWFbnjQkSiMuK8mJCpFNepEL7Rm3UuLWIt9HFLh
 20yz3q12Fp/4jDwVJrPCEK9opgIRJqG/gZVmr7vPHXMAqpoSwTn3m0M/2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="329812212"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; d="scan'208";a="329812212"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 04:52:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="644855045"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; d="scan'208";a="644855045"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 04:52:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 04:52:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 8 Feb 2023 04:52:14 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 8 Feb 2023 04:52:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmRsTpPXAaNMeludnqGhAY8yUECutt46YWCSUcPrTsEARo4vvbyUERAuvGW5wk+sjWKCvaUsZnPrxW+r5HQMPr5wd7t9KazvjZVf30Msmaa0FOJH8yowDgtcCPCefLyRWHIyF35hFk73OVcul3ycmciMNJkKqBuhm3P1V7EWqjzHy5EfPygshEBQiROol57QB/wAXT3ZVhH6D3w7fOuunOB9UdSIlgcXYYF2p8xIGlcwQrxPI+0Ym9xp/XKKm8PvEKnUzbNAqkeQjHjWqD+vY4jXz6JQO5X+PCG+Yhb7RbzXc8usAmkQtRQym6yaEEih2KHMqXpodU8uv32bkS430Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx2BizQTdTHbEHlj6YnYjxJ1r5+IR2odOQmFbqWIA8c=;
 b=AIM719hXhPR9b9wjZLvO2vp9EMiUpFPVEKqJJO6xCL+ZwVNpefzCJEdRjlW6hI/Ta7K7WhVTF03iM/jB457vhldLihFHEllpC5Xvok/aXF2rv4+fSZt6pRJ+61mzrds98472LN7q7HACal6V8pqdwAYAvSeEdo1lY0PuWA6RluMG7qKJL9WDUGUA8t+8ddjDNpKOZpkwFpmonbq+kvkKDSEFwmDBg1pkMil6CJncysImAT/Y/5i67sypM2QB5MDHOek6VYOTw5JFTRk4P0mB7SwUxsxRSqosfpC485j+qtOeo/BeW0/Dbb/qakVX2kuLyD9prq8KfGIZhrzaRpL5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CH3PR11MB7204.namprd11.prod.outlook.com (2603:10b6:610:146::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:52:05 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 12:52:05 +0000
Date: Wed, 8 Feb 2023 09:51:59 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/selftest: Use forcewake to
 sanity check engine wa lists
Message-ID: <20230208125159.spqbpfcj5o3n4cik@gjsousa-mobl2>
References: <20230201222831.608281-1-matthew.d.roper@intel.com>
 <20230201222831.608281-4-matthew.d.roper@intel.com>
 <20230207223758.dzttji47phxgogp6@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230207223758.dzttji47phxgogp6@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CH3PR11MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 07942983-f29c-4845-02c4-08db09d3478d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKzJ01LaWvDWTSQwGd0UzJ7Fdsh2PuvLyAHv5/ylP4Ka8fec/GpuRdMf+Vsv0oaTHHM9IldS4QRhG8DMcjrWBUi8EitLCtVTuumNXGbt66xDgBE3sDgH17lJDBYZYNgAZ9k80YpgaNkQIy9j6EWT6mbqWe4TMCgI47kupwCIBWHsUlK60+qNGpWnlq+CgZHljKmXceGuN0ZjIOwuSPfqk3FrXTXH8XLjXcx42t7eaOS7FYaeHU9OgoNwUeLMiTySRZM6qguFql0Tb40S96lSSsHgDblc9k7EaiT/yS9OQVgX/RhAgZDldcUzsy/xL4UxD2mXfPzuj/69ZeEXbi2ep209fEuXlwIgsED/JP3w2wGR3NOJ2iTpRHjSvnhrEKboawovYbZDD5MQs1Hqe3x6eHCa1T2k7lP9p7mAMz2rdJwHi89APD0HYHEfwtLdghbXrLB2iFcrcfawIK92PlXaNkvzGIKMNXhQpMWbEqyVAJRVarbgyvuP7bd44RQtD6ywRWRjw0BEdPpxjBkerh7MQZiLZic+Vbz585+Ec6h3PiYD6sMOvfritoqwBI4Lc16R3KuBn1fs8RqfwPpLy2NFwdhhdnOaPCcwVs3kVvkgaCBSmTJBPXDplUn04EIFruL9dK8YJ4NnfYTGKjzfZt3wag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199018)(316002)(8936002)(6506007)(1076003)(6512007)(9686003)(186003)(26005)(86362001)(478600001)(6666004)(38100700002)(82960400001)(5660300002)(44832011)(6486002)(33716001)(2906002)(8676002)(66946007)(66556008)(66476007)(41300700001)(450100002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQPR24u7vOOipkI+eRWzwpGk0qv0GPOTVbw/zcV2RDU1QBnChR0qP29tnmXx?=
 =?us-ascii?Q?9Orxns/wLRLJAXS3gnKY6TEQ+/vOa0fDSZSBftt0bEdg5ud5KDxY+xo1B5hV?=
 =?us-ascii?Q?bibNHEvOyA6YrW8iNCWBfFWlvZ1dCdF+RYZJFmBncdHp0oRmHzSsiTGOfNj+?=
 =?us-ascii?Q?HBh1bwRnmOQnUaZDRrcJ8eu795JjooEsph/hHmAloHXZkVIxXxdkyYyXiBP0?=
 =?us-ascii?Q?/k5bTngso3KSnV8WJXT1wdaeysw21t3SXsER+/S91PMMwC1db9rghIkO3IoO?=
 =?us-ascii?Q?WA2WBL8H+4LTPeKecrg6EMvCZVrcq0XIrzl6VV+SXqV3KBQJQPMS0rR/iqjq?=
 =?us-ascii?Q?jZ2ee4JdiMfhFLtQOpW80O8um4RgXL74uvJbh5jlyr3ygyavoiNXeF6Gk4nR?=
 =?us-ascii?Q?ZmRnPnSrr9UQtI78HCqt1pacnUjyOLLs4Sh2EGD55CXqeQDaZtF23gYdrXg+?=
 =?us-ascii?Q?4OFC7nulrJlUOW0b2zcW4BXPt1hpZHauTb9XhYPo3KjgVK78mUXiZqc0MwuO?=
 =?us-ascii?Q?znH7rsgMqlIOj7W4HnbfS6f/IjZsfx5byDwz1a6CWBCt/aAw2J7mVeP2ETkH?=
 =?us-ascii?Q?r0ooeXMpnJD65U8H49R298zEAYOvAlLSxPrEIPOLbYhJdl5BKx/cuUKdSqel?=
 =?us-ascii?Q?FgTrUXeti1ZWLJoiZKzyPAqgJ04/N1c9HmWgcoN5BLNx7cRDTmAKw+6gG/Gw?=
 =?us-ascii?Q?LnCFaqHv9og+pDoP3685ykElvACcdPl23T5OhhQOJrot7bUYVEsA5la2FHrU?=
 =?us-ascii?Q?Un+1zCxzdpH3C3saQ90taNJfp8Gct1YJW8AidSGtwLZ+zpihRurPheQPIfU0?=
 =?us-ascii?Q?HPtGC7brWC0a8N3A7GwzVfbFlKlyRPMMiaoT2m8/mDknw7Umi8hEmVDH8TfS?=
 =?us-ascii?Q?4VXhV8Y6zbwQwmhKV5gHphoBvH4tmVYnh0t5RFdtTETndu/o2yVReKHU8wHm?=
 =?us-ascii?Q?sx5P7FBLRW1CN6rTOF6clrIg6EH6YqMFaQx3G8FKqe7W3GJj3aWYGNWDDdLh?=
 =?us-ascii?Q?KzIr820TNWfb7xD+hsKltE4pwK9In6pTQL21XptdBI1Z9A6JfP1V5e4VB5Ux?=
 =?us-ascii?Q?edc9k1JE50rc6xML12YSA6IVFhPp44qCGSxogj5Qs3tfA8WvcvmjP65s9u5W?=
 =?us-ascii?Q?upCW/o24pfHIkqgp9RuCohOKxFaq6I5CjpULP1yTlYS9VXoqdMAvv28Gq7RE?=
 =?us-ascii?Q?yyA0TSJquu7oir6+e/cAXs5xbVjiXVu8usQNyIQtmkBmcroOp3BHZaMYJMCl?=
 =?us-ascii?Q?Q9PawQwaq6JO4mQXZoUgFTBzK1o/jEum6LnfVRa+QHIjXe5+wEfroLReI4wI?=
 =?us-ascii?Q?7WldM6a5R0UPvhPQ4dOQMLtw9FjTmfqnTmwgrjXfCFd9ZuGf/eVKi72a4a8t?=
 =?us-ascii?Q?nGvCDLDmoZAP+uIkORigADQ7F+zkUQ2e3DG8P+wJaxd11fja2SKkyZgaAr7C?=
 =?us-ascii?Q?m4MibUDtneQPFva/G+lT8A/f2h0dWREzJPscsbRoMCg/bfd4y3ADS4/2MAAk?=
 =?us-ascii?Q?ZAOmF+tr2vl1NrLrbYByNT5TiKcj607vwPQdUnJU5LF7g4TB2dDJfUGWp/NI?=
 =?us-ascii?Q?BqID9ao8JfwezOiBKKz8NNpv/kF+oLx4PrYsL/9Fik1eROJDVjl2qPazRn3K?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07942983-f29c-4845-02c4-08db09d3478d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:52:05.0136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZA7b1BFUlC2p71juYek0asL9zr2TwhHFy1hxRz1sCHWr2dcgmMwZrjCfZRj6ouPZ6UTnsWS1b8uGjiuQ4PAWRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7204
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 07:37:58PM -0300, Gustavo Sousa wrote:
> On Wed, Feb 01, 2023 at 02:28:31PM -0800, Matt Roper wrote:
> > Although register information in the bspec includes a field that is
> > supposed to reflect a register's reset characteristics (i.e., whether a
> > register maintains its value through engine resets), it's been
> > discovered that this information is incorrect for some register ranges
> > (i.e., registers that are not affected by engine resets are tagged in a
> > way that indicates they would be).
> > 
> > We can sanity check workaround registers placed on the RCS/CCS engine
> > workaround lists (including those placed there via the
> > general_render_compute_wa_init() function) by comparing against the
> > forcewake table.  As far as we know, there's never a case where a
> > register that lives outside the RENDER powerwell will be reset by an
> > RCS/CCS engine reset.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  .../gpu/drm/i915/gt/selftest_workarounds.c    | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> > index 14a8b25b6204..1bc8febc5c1d 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> > @@ -1362,12 +1362,64 @@ live_engine_reset_workarounds(void *arg)
> >  	return ret;
> >  }
> >  
> > +/*
> > + * The bspec's documentation for register reset behavior can be unreliable for
> > + * some MMIO ranges.  But in general we do not expect registers outside the
> > + * RENDER forcewake domain to be reset by RCS/CCS engine resets.  If we find
> > + * workaround registers on an RCS or CCS engine's list, it likely indicates
> 
> I think "workaround registers" is too general and makes the sentence a bit
> confusing. I believe you mean those registers mentioned in the previous
> sentence, right? Maybe s/workaround registers/said registers/?
> 
> > + * the register is misdocumented in the bspec and the workaround implementation
> > + * should be moved to the GT workaround list instead.
> > + */
> > +static int
> > +live_check_engine_workarounds_fw(void *arg)
> > +{
> > +	struct intel_gt *gt = arg;
> > +	struct intel_engine_cs *engine;
> > +	struct wa_lists *lists;
> > +	enum intel_engine_id id;
> > +	int ret = 0;
> > +
> > +	lists = kzalloc(sizeof(*lists), GFP_KERNEL);
> > +	if (!lists)
> > +		return -ENOMEM;
> > +
> > +	reference_lists_init(gt, lists);
> > +
> > +	for_each_engine(engine, gt, id) {
> > +		struct i915_wa_list *wal = &lists->engine[id].wa_list;
> > +		struct i915_wa *wa;
> > +		int i;
> > +
> > +		if (engine->class != RENDER_CLASS &&
> > +		    engine->class != COMPUTE_CLASS)
> > +			continue;
> > +
> > +		for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
> > +			enum forcewake_domains fw;
> > +
> > +			fw = intel_uncore_forcewake_for_reg(gt->uncore, wa->reg,
> > +							    FW_REG_READ | FW_REG_WRITE);
> > +			if ((fw & FORCEWAKE_RENDER) == 0) {
> > +				pr_err("%s: Register %#x not in RENDER forcewake domain!\n",
> > +				       engine->name, i915_mmio_reg_offset(wa->reg));
> 
> I think it is safer to use the correct member (wa->reg vs wa->mcr_reg) according
> to the value of wa->is_mcr. Coincidently the reg member for both types have the
> same offset in the struct, but I do not think we should rely on that.
> 
> One issue is that, unlike i915_mmio_reg_offset(),
> intel_uncore_forcewake_for_reg() is not implemented with generics and expects
> i915_reg_t. A workaround here would be "converting" the wa->mcr_reg (when
> wa->is_mcr holds) an i915_reg_t by copying the correct fields. While this is
> trivial since both types have only one field, I think the proper way
> (future-proof) of doing that is by having a dedicated function/macro to do the
> transformation.

Ah, we already have that: mcr_reg_cast()

:-)

So my suggestion is:

    i915_reg_t reg = wa->is_mcr ? mcr_reg_cast(wa->mcr_reg) : wa->reg;

Ans use reg as argument for both intel_uncore_forcewake_for_reg() and
i915_mmio_reg_offset().

> 
> Thinking about an alternative approach, do you think we could say that
> i915_mcr_reg_t will always have the same fields as i915_reg_t? In that case, we
> could tweak the type definition (or at least formalize via code documentation)
> to reflect that and then it would be okay to always use wa->reg here, as
> i915_mcr_reg_t would be thought as a subclass of i915_reg_t.
> 
> > +				ret = -EINVAL;
> > +			}
> > +		}
> > +	}
> > +
> > +	reference_lists_fini(gt, lists);
> > +	kfree(lists);
> > +
> > +	return ret;
> > +}
> > +
> >  int intel_workarounds_live_selftests(struct drm_i915_private *i915)
> >  {
> >  	static const struct i915_subtest tests[] = {
> >  		SUBTEST(live_dirty_whitelist),
> >  		SUBTEST(live_reset_whitelist),
> >  		SUBTEST(live_isolated_whitelist),
> > +		SUBTEST(live_check_engine_workarounds_fw),
> >  		SUBTEST(live_gpu_reset_workarounds),
> >  		SUBTEST(live_engine_reset_workarounds),
> >  	};
> > -- 
> > 2.39.1
> > 
