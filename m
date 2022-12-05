Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922896436E0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 22:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7135610E0E6;
	Mon,  5 Dec 2022 21:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C6A10E0E6;
 Mon,  5 Dec 2022 21:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670275825; x=1701811825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BHNHVQ64HQ3tLRXNUUVUptTfhXwbkJM4/XwmA6Zx7kk=;
 b=gS3pRY9K8zBg/QPzsTsnck4Mdk9RdNODruP4rQYTyttA8YCdksboxP4E
 Fa3QaVCQsRAKcnB30YBXGIuAePcjCusHcii+4n4AtPwAB7BhkyZIphcIP
 gQFCgP01BaAam1Dpb47r42cGl1nFN/ixQsp0/U0pCPeTYDLHK5D8LE0/n
 V+tAxl5OtiZ5Rtk84Tqw7yqASrpinSPaRZ73Qmirfh1p5il48oJZz0jKf
 cQFOyjYpChGP3g1Rqm8c0mDmRlBtayjvR5MxU92vPt0KX0rpW/sebXnYI
 QO6XboKb7I5YHJBfsZwxUypkngCSAO3N1Ul+MC6p+tXFvgQGCVBUM0E5d Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="296159885"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="296159885"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 13:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="714555394"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="714555394"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2022 13:30:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 13:30:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 13:30:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 13:30:24 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 13:30:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLBkLOIhiPV6r0ZcRctMKUdeurr8i3Msg1/I5fqND1cTeUWCjT/uCEbcbVvBJAjkA603JQf5D3CgjGdiNEwdDh61TCaeQK3Az9JH04DIlWISeuTnUXm3/aWohO6z3iijj+pfGyJxF7aqI2UdsOyhkpJSNek2G8McvucPHd+rWNlySwVUk1+PCB/Llri7HEEHkvXSTj5E7/MzXLHJJitcuhkfT8bRupCayBxsJ56SBX7t+oaJWpzUiw5IgPJbnGQZmBM2TpFlDQG3cg5xWb6g8yyKUkATdSbDgHqvyhghjKt19zZ4zPNBReV2gaBNjW78DAfCthJM/ykgakFm7qHibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ziE8kgGbBwHg5Is0FabVtGJlrCAxeoYmjb5ijA3yIs=;
 b=FJkeuck5cwhNduHPLET3CcNciTbbWVOKTXIYdOu8pLqLBMCuLycpq6G3nHvVC9U0Yb8zLOQmZUi/gZ3FAMCxtjkhc8b3GVVUMOgoY4sunQMOm/rEOcPXC19Ge1vJHdpLOj06Ll8AipB0ss1OxiTy0onbDcd5AMjNw02l9qZliXCuMqk91zW7MFNDFtyrR64ancVlBRO+CCFQ0A2vZZ3rO+QYsVv59I9WY0MApJiDHmojFhSGM8K37TrFjArlPnEhfAIRCHnovM62mpUfYOWPZ0uXfzO7OC6WDlLiLXgZE6PQQKjpC5nPtz6uLHOCRsdylEFxglGKra82jvy8HI3YOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by MW4PR11MB6788.namprd11.prod.outlook.com (2603:10b6:303:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 21:30:21 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475%7]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 21:30:21 +0000
Date: Mon, 5 Dec 2022 13:30:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/i915/gen12: Apply recommended L3 hashing mask
Message-ID: <Y45i6d/43/iSP/Ki@mdroper-desk1.amr.corp.intel.com>
References: <20221201222210.344152-1-matthew.d.roper@intel.com>
 <20221205193329.v6jd7zgej7lm2xyb@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221205193329.v6jd7zgej7lm2xyb@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|MW4PR11MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: ad51cf33-1e00-4fca-c5ea-08dad707e8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iF1Kc6OCDLi41Y3WL+MrUgYsSEovKEywnBsj3zKtw1H+DIzYlOiDB1N4bviTqqIPpRsLuhEIzKqJlGz9DXaFJIVGv8vVKF40OPmgxB4uWG6HMzM9qrcOvvqdoUbdc32bIQghY98gZIIS34gpjf0N3vZTaDApIZ6FmkPtXaOYLT3QdeLmBaboPrQOzeGNFShsCWWvLa/0NSBfslGm8k06Via79RwBNB6duQ3EoFiraITerGki9+sRwQkN7RnoDuyARZvRvncLXtpLt3kfT+Zudpw3fI2kgRRwVmZf+4RP+1rrLq39BpW2FnY/PbZk+VxHoRDps3vZ+npzzkCtVE+tVgU2M8Vfpj+6WLyUYhpqvaJRUAsMa7iLH9IC02fCwKxG/Z/IJMpp6g0ZBVoTnd8GZwQ8mhoVL7MYLMkrBnC2CFezg++5SQXzh+jbWBR+sAa2Z6LPhBoLep0aaVgjzPfXZy3P9UrGmzntQUwIQaza7froShYvCQf4Kemy/bt3JtILc+NncrCrZFgvU/7lc0Aqr2EfAwbl1bn4bE226cY5dVDoGBRMC04h4iI5hoBuHp72ZjXNkOodx+myv2vi/m1xlaH0D5hDxrnYe8mjApNT1icZl4HVGMZRZAZ4WaDEBJxQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(82960400001)(38100700002)(86362001)(83380400001)(41300700001)(2906002)(6862004)(5660300002)(6512007)(26005)(6506007)(186003)(6666004)(6636002)(8936002)(316002)(66556008)(450100002)(66476007)(8676002)(6486002)(66946007)(478600001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a+wnC00vknRyVX8WZkavh0iWewYzBY5CXHWHM8lrcSNjYFdwQuNKnQqSlS55?=
 =?us-ascii?Q?gjtQiRo4renRZ4v3h7JV68lb3uvEz+R//gYII2MbJV3e7B58m2BvMEKOb/z3?=
 =?us-ascii?Q?oIeJJ2kazkNpW329dsRH1yXYJc6X73wt8iK9Hz4jyd1X4U9SS1AEtrS5UzmU?=
 =?us-ascii?Q?jhaP5pBVXHM9Fkl2dwznxNBAaHMRpKkmC/mXA9DZV/mRo/BHORiMJPcstWLk?=
 =?us-ascii?Q?fYSMdch3Y9YV+xPGWyQcRAbixq0OUTK0gsDi+cBi/ev3hJ560FCRsoIThXXC?=
 =?us-ascii?Q?Xps4xH2pzP7xVvtDqjgznRH9i2EQ1UvXLJqNeUXLE24O9t8z3yKdBwmd1qBI?=
 =?us-ascii?Q?GlyR/N81MdvnEdpbEm+xy9h3SyJ5Jz42lNDEyNWSLOBHgr0DjDbGaeZzI1O6?=
 =?us-ascii?Q?tsWVSqHZJmTLzr3XAYwlZg07b+KQUzBdhhBuBdEPauX0jh66g/bLrVJ8LP6M?=
 =?us-ascii?Q?kdWWqeNSzHOuFUFzjUrlVMBpTgdmQp/0rwsgbmQshtnW7G2ANb0Lt4h2IsLe?=
 =?us-ascii?Q?vg+1TE9vJeD2UpXGDffxRczrApqA22gtlWOrvPbghqxYx3tsEnB3YDudV7nX?=
 =?us-ascii?Q?uWZhL8qLlXSjGbSN3CQek1C6XOEoJQk/8/gQV88b8zHQkubSNUioI7OHAwCX?=
 =?us-ascii?Q?k7o/BPTk91yb7qbEg58/ez89Rw8JyI10H35Pr5XAf8lb+rEPBBa8l1MRb+dH?=
 =?us-ascii?Q?w9y855fv8X/fyl2hCXyi/FpFKVzkTWv9BshuDVJ8W7iA1WQch+OIH5AINl/p?=
 =?us-ascii?Q?BCKf4MTl2dyHcZ9Wf3W1LJI4/ZmcFwVxb3+M+OS5AToQ04qmp4gXqiU0hqd3?=
 =?us-ascii?Q?L3VPDGumQ8sy9RUss0dqdUqr3YPJVlpA2jm04YFuPvmAgnJsbWIePIx7sNvq?=
 =?us-ascii?Q?d8iYbUmarTJtgqEwhm78hz39Uz7zblJnm7ABrWM4CAl0J7Mxj2ILZhRIJhrr?=
 =?us-ascii?Q?I9W2lyZZEjaAH0D2hNZiizcTkbGXBxjSmsG+qwOid1Zyr/ENWzzsVYAVlbLM?=
 =?us-ascii?Q?ZPbL6VnPLDB1wjp2PsHOEEBdArrMAEJPKG5KeXauGjJneiCWGMrG+F+JdTrj?=
 =?us-ascii?Q?NRJpFIu+/G+NFv+UvFtUOIbF9g3sf4mSJBEgJ5Z28G4K1T7uXdvx496ofA0b?=
 =?us-ascii?Q?2zP0qjjdbNuBJ5TUrnSw1e+fZJsYbWON14xK/otZ9gsRLJpVIEWH7ukEXrSr?=
 =?us-ascii?Q?WUvV0KGR0t55hh78px9pZCAP7as3K3hwZczLplfFSTSvEHzc/gqQkRsLFiQW?=
 =?us-ascii?Q?PanNW+1czA4fh68AqeMdCL+F3WyF5+xBzQeOMExLr+XZ+BxuXXKnsLdReuh+?=
 =?us-ascii?Q?GfvCM7cM7jOQRUBvsCBAW2Mcu0qA3/ZXA/Gc2rmTlJoq/9UHTNYPS3AdKqPl?=
 =?us-ascii?Q?+LD2HzPW0yO9T9XgjYEk5fLjMWsxwt/oAdJUmcYRiXZOhbtZzHwSbdpaVaT+?=
 =?us-ascii?Q?rJ2LaxleATAtO7OX2cH0L/QFeo+swzRnO9KeW9XhKClwNK+XtISy4DEa3KS3?=
 =?us-ascii?Q?NbgTa5gaag/IXbzM6lQi8966nXBx10l9Dwg4FbVI3mLGHMykJp4QPrLT3NXG?=
 =?us-ascii?Q?fpV2n0MXUkyA0X+Wg8XBMg31RanG9f4O2kZ/gP7ZPrTbRy/2clu1faDN3CW8?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad51cf33-1e00-4fca-c5ea-08dad707e8db
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 21:30:21.2336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpVH0d4EEP1YqMsI/Hn4fCR9TYitCipzqmWHAYL8Joc0fsfRaCoNLy0nsjjchyYqkLIt2EvHWCPDksVUoji3jiYKDpjiDJhK10D/S5JvmxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6788
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

On Mon, Dec 05, 2022 at 04:33:29PM -0300, Gustavo Sousa wrote:
> On Thu, Dec 01, 2022 at 02:22:10PM -0800, Matt Roper wrote:
> > The TGL/RKL/DG1/ADL performance tuning guide suggests programming a
> > literal value of 0x2FC0100F for this register.  The register's hardware
> > default value is 0x2FC0108F, so this translates to just clearing one
> > bit.
> > 
> > Take this opportunity to also clean up the register definition and
> > re-write its existing bits/fields in the preferred notation.
> > 
> > Bspec: 31870
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 9 +++++----
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++++
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 61a5c9a83b1b..f8eb807b56f9 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -958,10 +958,11 @@
> >  #define   GEN7_DISABLE_SAMPLER_PREFETCH		(1 << 30)
> >  
> >  #define GEN8_GARBCNTL				_MMIO(0xb004)
> > -#define   GEN9_GAPS_TSV_CREDIT_DISABLE		(1 << 7)
> > -#define   GEN11_ARBITRATION_PRIO_ORDER_MASK	(0x3f << 22)
> > -#define   GEN11_HASH_CTRL_EXCL_MASK		(0x7f << 0)
> > -#define   GEN11_HASH_CTRL_EXCL_BIT0		(1 << 0)
> > +#define   GEN11_ARBITRATION_PRIO_ORDER_MASK	REG_GENMASK(27, 22)
> > +#define   GEN12_BUS_HASH_CTL_BIT_EXC		REG_BIT(7)
> > +#define   GEN9_GAPS_TSV_CREDIT_DISABLE		REG_BIT(7)
> > +#define   GEN11_HASH_CTRL_EXCL_MASK		REG_GENMASK(6, 0)
> > +#define   GEN11_HASH_CTRL_EXCL_BIT0		REG_FIELD_PREP(GEN11_HASH_CTRL_EXCL_MASK, 0x1)
> >  
> >  #define GEN9_SCRATCH_LNCF1			_MMIO(0xb008)
> >  #define   GEN9_LNCF_NONIA_COHERENT_ATOMICS_ENABLE	REG_BIT(0)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index 85822ebb0d64..2f13a92f77d3 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -2937,6 +2937,10 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
> >  	if (INTEL_INFO(i915)->tuning_thread_rr_after_dep)
> >  		wa_mcr_masked_field_set(wal, GEN9_ROW_CHICKEN4, THREAD_EX_ARB_MODE,
> >  					THREAD_EX_ARB_MODE_RR_AFTER_DEP);
> > +
> > +	if (GRAPHICS_VER(i915) == 12 && GRAPHICS_VER_FULL(i915) < IP_VER(12, 50)) {
> > +		wa_write_clr(wal, GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC);
> > +	}
> 
> Removing the unnecessary braces as pointed out by dim checkpatch,
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Dropped the braces and applied to drm-intel-gt-next.  Thanks for the
review.


Matt

> 
> >  }
> >  
> >  /*
> > -- 
> > 2.38.1
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
