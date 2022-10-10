Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D095FA273
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 19:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFD510E68F;
	Mon, 10 Oct 2022 17:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A295610E687;
 Mon, 10 Oct 2022 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665421720; x=1696957720;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UXtYVrtdaYcc+ZvLNAw6/KvMv5NbQVuiKDaRGGjRJM0=;
 b=DOq/YS8cDr6XWZGvwSqN5uGrIIL7j4Bfu2SoYaokSRMUb4tVF5bLbkxQ
 /9AlzYjvZsBHOmavXvzcAwbyeEGKrhZdqYR8hZyiq0us8QXetQfOkHGKZ
 8pOnNdKfmz92TaPKl01gJ6JZOIQDNXYzRQreU7HTbOj+4Jg0LnReL69OJ
 tUeXvdJvZtDCgeaTZp7xACNc1GFTsoAQNtx0KOr2gCweYiBUx2T69tj/H
 aXl86aRejbr6/4y/tkJ4V+ZCt63VAlrK1InEbosRfa9qofC47SyzGWXNi
 2sVAmSreqfdOQHLV4NpTD8bsdM52++0YOnpsSYack0GoPv1fFJnySgoEl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="303022368"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="303022368"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 10:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="621095397"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="621095397"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 10 Oct 2022 10:08:30 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 10:08:16 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 10:08:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 10:08:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 10:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S488MRW9HEvc5sfqWHzMxaqjO8yAXsoeLz24rXAWqPK6UVQt3y5e01FWXxkpb5M8Rl9LqR+ZD2aoVQBeABrb+0+CpoeZsipbR/exaGXTU8quNojwTzb+E6qehhgJ0UKsiYCNrx8bxFnM+3I3OJGKLwMYX/1DU3zuMKEvpk6ru+yR+N+k5r8Wdna6WY/u3BRSEG0gz2m1dQyMZ5jKJZhVUDiSZ08+lRHkcF8k0+AuI1yO7kDtg7y/BhEtGtAvIfqlKHWNlcljqBJ3+EBcGR07SOUZgPu/3qaJjR4+iC7gCSyPjb/4+W3J+Ur67S18bujyXaGaUZqNlqgQ2P7/nuSbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URNpdEhtQ0dKltO83YlUyHgoz47Gyh1KskfhcSR23VY=;
 b=bCSVlbmsWNZYPeVJl7DznLHnyQN+kX2iNpDmecccEnebXfU40sduzJfZuj4IIbID/fbL0rGTIGnxBYMLgxUm+TVCSJXx0TDZgvhpa2/tp8aILnBSZ7W3XMBDPDCFZw80hYO/I1mUCFrrCjAy1hm5ANf/JiDy3D3EdC1eE3ttmFED0Wf2KTNRNRg8P8R8DIQ9IyGWETj/nz90huNrj7iPQLTcRI04EzRcZ2VLHyMIQGAVBj6XFDr9GgQlIwjtrHyLJy5HQBOKJAszd8rOq4sD8Om7A5DY9/oYkhS8RskGVdFcby8P8KJB8UfdvIRj/vwDRS3SAqT57kH5scV9ZhUrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 17:08:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%4]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 17:08:13 +0000
Date: Mon, 10 Oct 2022 13:08:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/slpc: Update the frequency
 debugfs
Message-ID: <Y0RReLjwsKslJWP6@intel.com>
References: <20221005155943.34747-1-vinay.belgaumkar@intel.com>
 <20221005155943.34747-3-vinay.belgaumkar@intel.com>
 <Yz9Hkhw7GO2ATCcQ@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yz9Hkhw7GO2ATCcQ@intel.com>
X-ClientProxiedBy: SJ0PR05CA0157.namprd05.prod.outlook.com
 (2603:10b6:a03:339::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 82396dd1-804c-4166-06fc-08daaae203cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +41U2oiI/RPG9iwsyLgnfvvnZt7Cc3xGSoWaw7Rj7r5BrhKz7wp61MPCUr7tiqmTBEii28kthh+uDGzp4g/UeAwqphDl/ZhcMZOEf5q6/+KhYujQTgJDepz6IVBPnZ0xDEjdnwOhMjtMFvR1umvA2tf0uqUGaPoli3AslRczlvuk2n9byeRpAJwKwF9FX0aeDPl513fZ364SM1SRpprJMBryggW+3VtKt3tK0XTHuNsBGxezlZIJ83YNI3k6fMfK4wj0ZFt3AYQ+QQHJ/Uo5OFnW6o/SfCF99r83CKoTmZbEL2Mm6jDIt4ux9P+bV09PaGCtQeg9KtLwO/mr4fL8DJ8s4XITQOl489JcVCt/i5bPUe+fHq/BDA3WaSZjxty87RU1rSFgDexENqQhjEvrJLlRSVAjmfBE3R/NQE2Vdz4Jq1iqcDNflwRADL2KQsJuQgJ4GKjozDhIfdlW+OKGPaZqQTKzI3AsfNJb3LokBjILMDgOGG5T8MusUcbMD9ut7g2hzIZGSV2wuYomEOZdxA0FVaFAVFgrLdngrOf5BKZkRHz9hORGiUKsTjN2hIgH5r0LTEKN0R96Jcogxp6M+oms6dyEy+2NAcC/3726kRiuekhq96GavxMdNW8lNWjnrlqSxcrEfrPjIRT/C1caE2C1pEhSfBuksOJrz/u+w5H1QM2z88kx2V6TQaTknwrkkFLFpcwH1OU63uGap3Re+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(86362001)(36756003)(66476007)(4326008)(38100700002)(6636002)(316002)(66556008)(450100002)(66946007)(8676002)(478600001)(6506007)(6666004)(83380400001)(26005)(6512007)(5660300002)(6486002)(6862004)(186003)(37006003)(82960400001)(2616005)(44832011)(2906002)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wDyMnE3XiEaVmnLpMY0JCdyux/fTRvQhStkAh/gi9mEDSw0+JQXau1iz7skj?=
 =?us-ascii?Q?/05Nnt5YgtYulmIlvtwgHpyy7kzGAaAqDL8OYd1kspXBDCFAOKZXzzciFO3Z?=
 =?us-ascii?Q?8xVfc+jJjvoltuNSHT58XyuuhyKimOpRh4VIDdBjQOHErlIOheVq4ggCIxXY?=
 =?us-ascii?Q?fRw1+wVg4zuqmeTQO7j4Hi+x/tt8xdKes/8670eY9fKcg8BQire8o6WnX4Sr?=
 =?us-ascii?Q?Dzr8cLbgqAxaKq85kPVVVVVWOtO6W+HqyC9iUBmGUOd27YJ0/6+oQBqWBruo?=
 =?us-ascii?Q?3poyul3Xyow+JUFheFfmM4WBXC8YLz1BKJqhxt0mNgOD5MdsiZTWZBV4uaGQ?=
 =?us-ascii?Q?zSA7lMgi39PNGSFJN0mp1aWDVoN/VOLplLyGZFDokIBIfvmt7DYw2+nYoMVf?=
 =?us-ascii?Q?7lCeUBUgwlon10e3GECcMdZMUmMc2sEDhCHZEAS2Ru3ZZ501MbMxG6iimWQw?=
 =?us-ascii?Q?PtfXRcRXWEVmonW27ct865OJNhrWQcj1xdygrgtqTw6dAtBciqDBcu/pIOvl?=
 =?us-ascii?Q?+8ncWLPjo6xKbLBNvOut+Onujjj8sOk5TOfU1rE2RpAi4jAEHd225d8i4Hsy?=
 =?us-ascii?Q?k0YUjOz83cz4Tu6OQ8+QkmsxtKiajHzYyhLzodE5q41HdsY3CB49caf+v58u?=
 =?us-ascii?Q?ga4SHTLlr3+StspilpLjOEF4TiwhXd3PJKecNSH/qKSyt5BCmgLoF32tkWco?=
 =?us-ascii?Q?+4gq3kJ9BdB3RBM/Nch+8TfC81EEMaOIWZ5CObIDeGIGq6+PZCgAGRz2yPvw?=
 =?us-ascii?Q?1cCEWrq8eg+G1/s/ijTDpe8sJ0HuLji+I2FIHLuUdvbpSOI+BCogJ+LPwU9I?=
 =?us-ascii?Q?MCfX32exFRLpD3CcqRMlN2sJPX2W57ZqsdtuUygcq0Qg76ojBHXElo2t33pK?=
 =?us-ascii?Q?+k91S9wTHRJ7ZUdJbk8Z2UgFrjOhk1aRzyrkn9TV/4BgeMtQoit+sEd9XLk/?=
 =?us-ascii?Q?jkdLN9YLkb3hPsIVNkLVbSBZ7I2gV5+OjxTtlFYy4a19wslIieTCcD3sX2vJ?=
 =?us-ascii?Q?fmT7FStWFJHByuxXgtq7u72KfCt5nbzn5VJO5YGfm5acfGT3CHYiUM+0oGDW?=
 =?us-ascii?Q?VhzUdB51GphT/t+gZsLbzMZVFw8G6TF0NypX1gRxxDB1L1JYbWbJMxWV6K+K?=
 =?us-ascii?Q?RlpHE0zzC7NUUUgb8cs2SaOrFxxiOn5O4ftU13O9F/hhsXho9qf/2Ea3fyus?=
 =?us-ascii?Q?x3RsvAD2DHTgkAtQaXmKbs237swWSfuq6cp4Xozi8UyvpWO1U2BE7x0TCJ0q?=
 =?us-ascii?Q?I7Jr5huTHOVuKz58czHY2Z5FooNq7Wh2VM9dKXrHt8aXVWKa9iLhklANFWtA?=
 =?us-ascii?Q?pyUWITBtgbDDcz5fX2sAzRdYsnL6GzaE2c9xyUADZicxToXVP1BX1FqrdGpo?=
 =?us-ascii?Q?qE/I61GVbiWJ9B7GYfl20US+Pn3VquEWNr4ozpLisVF1XduI6a1VxAUJuxYS?=
 =?us-ascii?Q?xNdSMuFejCh+pDclNBf/Kra2pfchpG1o7NhknqQhEz5TYVo60e896qkpG1PK?=
 =?us-ascii?Q?2cmxuBs7Cxxu2S2PdClB/4Jtx7O9zIn93qPe/D3xqHN/Mm/GJcqZ9KUVFzfk?=
 =?us-ascii?Q?pZ3iSaIJHm/ElOIjGLCLJbHgWBrIlnW+a1bwIBf9CWNZv73PpUA9Vu9YHytU?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82396dd1-804c-4166-06fc-08daaae203cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 17:08:13.6606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bb1zqS5AvbS3fnjgW+rVdXE16GXR9q+CuLxfJ+7Dtrfw6yZhtwSGY4u5/A6sxedPM8JI9CZMA2k1n9oxeiBnwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
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

On Thu, Oct 06, 2022 at 05:24:34PM -0400, Rodrigo Vivi wrote:
> On Wed, Oct 05, 2022 at 08:59:43AM -0700, Vinay Belgaumkar wrote:
> > Read the values stored in the SLPC structures. Remove the
> > fields that are no longer valid (like RPS interrupts) as
> > well.
> > 
> > v2: Move all functionality changes to this patch (Jani)
> > v3: Fix compile warning and if condition (Jani)
> > 
> > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_rps.c | 46 ++++++++++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > index 737db780db00..fc23c562d9b2 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > @@ -2219,7 +2219,7 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
> >  		return intel_gpu_freq(rps, rps->min_freq);
> >  }
> >  
> > -void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> > +static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> >  {
> >  	struct intel_gt *gt = rps_to_gt(rps);
> >  	struct drm_i915_private *i915 = gt->i915;
> > @@ -2382,6 +2382,50 @@ void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> >  		   intel_gpu_freq(rps, rps->efficient_freq));
> >  }
> >  
> > +static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> > +{
> > +	struct intel_gt *gt = rps_to_gt(rps);
> > +	struct intel_uncore *uncore = gt->uncore;
> > +	struct intel_rps_freq_caps caps;
> > +	u32 pm_mask;
> > +
> > +	gen6_rps_get_freq_caps(rps, &caps);
> > +	pm_mask = intel_uncore_read(uncore, GEN6_PMINTRMSK);
> > +
> > +	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
> > +	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
> > +		   rps->pm_intrmsk_mbz);
> > +	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
> > +	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
> > +	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
> > +		   intel_gpu_freq(rps, caps.min_freq));
> > +	drm_printf(p, "Nominal (RP1) frequency: %dMHz\n",
> > +		   intel_gpu_freq(rps, caps.rp1_freq));
> > +	drm_printf(p, "Max non-overclocked (RP0) frequency: %dMHz\n",
> > +		   intel_gpu_freq(rps, caps.rp0_freq));
> > +	drm_printf(p, "Current freq: %d MHz\n",
> > +		   intel_rps_get_requested_frequency(rps));
> > +	drm_printf(p, "Actual freq: %d MHz\n",
> > +		   intel_rps_read_actual_frequency(rps));
> > +	drm_printf(p, "Min freq: %d MHz\n",
> > +		   intel_rps_get_min_frequency(rps));
> > +	drm_printf(p, "Boost freq: %d MHz\n",
> > +		   intel_rps_get_boost_frequency(rps));
> > +	drm_printf(p, "Max freq: %d MHz\n",
> > +		   intel_rps_get_max_frequency(rps));
> > +	drm_printf(p,
> > +		   "efficient (RPe) frequency: %d MHz\n",
> > +		   intel_gpu_freq(rps, caps.rp1_freq));
> 
> Well, my feelings with these are:
> 
> 1. We have these already in sysfs and we don't need to duplicated here.
> But we have this already duplicated for years
> 
> 2. We should probably simply remove this file when using SLPC and force
> folks to look to the sysfs files?
> 
> 3. Maybe we should take the simple lazy approach to just fix the values
> that are wrong?
> 
> But well, we might end up bikeshedding this for years... At least the
> new version for SLPC is clean, so I won't block.
> 
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> (but I will hold the merge until tomorrow to see if anyone disagrees)

pushed now. Any clean-up can be done on top if we see a need.
Thanks for the patch.

> 
> 
> > +}
> > +
> > +void gen6_rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
> > +{
> > +	if (rps_uses_slpc(rps))
> > +		return slpc_frequency_dump(rps, p);
> > +	else
> > +		return rps_frequency_dump(rps, p);
> > +}
> > +
> >  static int set_max_freq(struct intel_rps *rps, u32 val)
> >  {
> >  	struct drm_i915_private *i915 = rps_to_i915(rps);
> > -- 
> > 2.35.1
> > 
