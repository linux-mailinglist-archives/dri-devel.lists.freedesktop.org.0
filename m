Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690AA5F1543
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 23:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5971110EDAB;
	Fri, 30 Sep 2022 21:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8612610EDAB;
 Fri, 30 Sep 2022 21:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664574898; x=1696110898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9QtrDyIUmoiKlSTEVvheAjUXMiZVIvlFgQP344iQE1U=;
 b=MZvYeQVhNnl3IWHQtG7x5xlAVkJdqBchZP9sP6csPsCFrs5XrnoI2cFT
 uqPMdN1jdL+5hUsQZ1Jyuca/BhQtSmxY4Uk8c87tlXYdBffrqqztUpM/e
 RqCXn7M9nLfXK9uzc1CgH0lhCApJTa0rmXFlSNHnJ8HqJZ9uh2Elfb/DP
 8CoZTju0P+X9TS6IMnnWX+y5B6epfQj0UqRot58XzVpVJOE0jLJ0Saul5
 ETM80XvXoT+XJ+behM+HiqJTWH6J9MPEk0rLMKwS+lpxMj0DA1GTBFTF5
 c5sHTH+1T94MzEQL45z9fOS5rmb76wiwrIMGWgqhiduWb2fQkJAE8nnW0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="302276974"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="302276974"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 14:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="951706423"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="951706423"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2022 14:54:57 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 14:54:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 14:54:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 30 Sep 2022 14:54:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 30 Sep 2022 14:54:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFr7DjioR3uJ0J0t3Ix3oO8TCqQ69nKKMHMMVgYQD4I30LCbTNOTj19G9PmGBts/gUf5fxE3Fmhdpem98IZ+Pc/KNLgBmD117AtnFikDjeF76EgCYXS0aJKQtKZDfZW2Ycxd5pbeb1lSURy/ly4ppPxGBq/7eKIStuwDzO1qj6LYxSsDsxvVPXVqrpYaYXYZptmhT28a66P9WOo28yJPERk5sWR9StGY/bAGSBWRh/kgOkSGDmxULd5/C/1wy7Uu5BPEuizOkeTav5WoLSp5cEJ43lWH4hImC7ZMWQv+yAvvrpSxNczClqQuH/HdG6Ea/XD+9fSiKW5JThuJ7PL3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOLzKZUKRcJjSio599ILfXhWMvoNP9BDdZY+cMVzxdM=;
 b=gAUsSAx99udth4VC3IaO12SatbM7KWA34moELeZKEC6f44Rx0SRBZH11c/Yhb8Zc/1iWnyS8p6L8qbq0vjgIMl3Isv0lUZxd0lnpRjVyfJGaaHzk1ynKb6DHLSpza1BBRJimBB7chjBqN+2PjY9jYq0YgR9KanpdWFEDa1MX/0KLGh2rk/czmOE7GX/UoLOmjsmrS7EiG3FwCgwSPgweOnPu2AlF+B1P/Sd151Blj/ImcEen9/h3aPgPtjEzdO553JxncNrdoM8yxH6joklZhj7XwzTfwrAIexKU1t+PLs5Riuu1pngw7RqfViyaxiB7ppaoTgww/QKnEqMLJ/woCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM4PR11MB5408.namprd11.prod.outlook.com (2603:10b6:5:397::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.22; Fri, 30 Sep
 2022 21:54:54 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 21:54:54 +0000
Date: Fri, 30 Sep 2022 14:54:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 02/12] drm/i915/xehp: Create separate reg definitions for
 new MCR registers
Message-ID: <Yzdlqybq3jW9I4vq@mdroper-desk1.amr.corp.intel.com>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
 <20220919223259.263525-3-matthew.d.roper@intel.com>
 <YzQY/A0k08hdGsOh@bala-ubuntu>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YzQY/A0k08hdGsOh@bala-ubuntu>
X-ClientProxiedBy: BY5PR16CA0024.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::37) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM4PR11MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: 566586c8-babe-415c-8a6a-08daa32e686a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6GVTPx6xkyO7SJfVrZPujmkHGCEWOF/MWgNumFyBU/if6/oZrPkylYj+4hGs1nuLs89rEMt0hMLAc4QdSEYJ3M6BWxQ3o8nBaALyfx7VLGbHFgMjlqSLdVyd8QvFhOxsgXoFgiINpGzaqjzEBq3gA06qiJu9lLDzqsbetMpnMcwJPHgbZhPGNd/5WO1+zevHIE53ogY1zIoz3zfeAg8oJzocNcDwfuSC6eZ+kiFaHKYACfBLDsN/9jne4xrS7Hl7WRC0CqqXkeFu2V8vCFWsSN2UFcptEZAUY1Sd4inUbB5PQRYoThTijLs3BL6PqP1MvenwIy4gHrTidWnmifTEjSJbRzuQO9LEoTnx51WkXLPZi/uu2/RndiaAQooiJHYUQs6wskmZVK7YN9rtWOusjVy4eN++ckW0bTbmIlhbSbHj3whosE1yWetuof8Q8rFnjsFpd2uoWFiy1Yu4bXEW1bdIReTSrVc5jZP+lbLDIXfKe74oXMJqt0BN3agilmc7zD78EkdmtGX4/shS+/T/wdyJtkpr4nZbtjVHR5GXdbRJEMvoj6KayjZQRZ0vqfzmZ7xwaWM4HTLa2N0xCs40cVlKtcpl3JjFj34JP0/FeyGPXnAryBE2puxBW7qkWpGwtuExISg3hNrs48ih2l2YD/48Kudp5T3Vy0vprJKNmUxnFLG91Xt7cY4LJQAO51+/NkM6hptmrpXOq6lYzBAdWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199015)(6486002)(2906002)(83380400001)(66574015)(41300700001)(82960400001)(316002)(6506007)(38100700002)(478600001)(86362001)(6636002)(66556008)(66946007)(6666004)(450100002)(186003)(4326008)(66476007)(8676002)(26005)(6512007)(53546011)(5660300002)(30864003)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i4nlgqXqqDR5Wo5f8NWSpSbQw/oERsrxhHsaXqWAYj5R3RCf+aHQDDfIUlq7?=
 =?us-ascii?Q?fDHVpOcuEQ8SEiC14K+gF85Mu7PQSOtDARm+9Eux87G/8jEyp5upw/WEwhwf?=
 =?us-ascii?Q?4PsMgxFduHVXN/ugrCHLSOdfic4A36LqsLXwlXLBEALC63DO2BJoGUdEdW0r?=
 =?us-ascii?Q?ZSBkK4AoYvHqm8urbHXzLalmROeA3O/PfS/mLKcETbrHr71ACdERU2iwtM7E?=
 =?us-ascii?Q?NodlH0PyGKJpJl2cbBE8wchXqcrhyVcFHaiLG4jZCPUfT1FVJIN3k9+NrtlN?=
 =?us-ascii?Q?DRc+vWBLlHRyB72hnL/jGzwUVXzVXEML3EyEkXcIDL6iyPT09tZDz1SGrGJd?=
 =?us-ascii?Q?4aIPF7INIxAo5YY1ILXjnWkBl+3dqlhbpl3gVlWwfXZoauZK/Ax449YvBnq/?=
 =?us-ascii?Q?xkuWuf+m68pgpLdfnyzH7KzploaqAq+jvRmSlw7zUhKmoLDso9GrMEn1EDna?=
 =?us-ascii?Q?aSunCWbAPFp3kfx7h+jLyAmIaq2dJBM+JnYgycS7GLJoG3GYTSDz5ybwFYHO?=
 =?us-ascii?Q?OtP77oyBkclaA+Us+DvJl0v4RH6tOcwkvb6EMl0ImV70XhZ4CPaGEdyhC0KF?=
 =?us-ascii?Q?JqJVgNytS0ezJtUO18p4Js4JXUztKV5XRCjY9th2o/1Ted5Sx+uXjwm6gwVK?=
 =?us-ascii?Q?BQbcrCZnTHA4qpIynsTeKXqTkD2x2LZOeLSenVx9kPPUixErUzv9urjGDo5a?=
 =?us-ascii?Q?8z6Ld3Zqvob8lrgpXmL9L4toHVj02Le3dvH0D2uXns9p1T/Je/I7DSyGRpuF?=
 =?us-ascii?Q?aotCJSNZFoF/wQUcqW8fJ2Q/IA8rKOhi2rgQA8WDMQ3VF2vw7ys5V7sc1lbE?=
 =?us-ascii?Q?f6U0705jZ8yvr9/jC4vw7qfra93XxI5kf3MtXYuCNEhYI+WztBvPgJUDn/wN?=
 =?us-ascii?Q?ZuBUJC8T9X2KIQTwybFipldeAXjQ3vO5/oayDx02nhYW0lijSaUfA6Imh8pR?=
 =?us-ascii?Q?C03UIRmOEYEAWcu6bDI97KVitlUDiJKMGNsQStOyEd8x6F7C/E5HjY5FnkxC?=
 =?us-ascii?Q?NcwIE9kIniBSv2kixAP8UtbzE8ls7FvpBt2XY2AAnL01NZV+VDazqOKU4Y9E?=
 =?us-ascii?Q?nbJpxXgGiM/4J4Wdj3TqUlLkRXrBXCegtv8zCiG3acjvCHUBoXncSt+NHD05?=
 =?us-ascii?Q?DB9tCZPguCYDplXk6yn68oDHajlXtjDy2VPKd7qSfefo9mRHaZX08/WSao3M?=
 =?us-ascii?Q?P7aFyWrFk7yDbYR2vITbR5pUDuip8ker7jNdpF531C3i8Vz+87hTS6F1yfcE?=
 =?us-ascii?Q?05Iktzv4FyrVgK9/pUt0Cn7fwaNj03r8anNjWLVTjgYAhrpVPM9UWTwdcbX5?=
 =?us-ascii?Q?f3hVvJEsnCPAXaUN8GN+TDkLHxDjNszHFkni4/hD0lVNyAHYyq0ffgm8C63O?=
 =?us-ascii?Q?bz3x3f26VvSkeolpXye3f1W4+Wsc3GiQNAQ7DpqMv9l3v+r/16lX60088vVM?=
 =?us-ascii?Q?5ULXg7URvL5RJcqesJGh0QJjJ6h9okrST2XYvcMFhhNtjuHNgQ0M0dxhC52A?=
 =?us-ascii?Q?I0cNGaxtVfeYg8uOxlbQQ4/I9/0VEQRfoRR5dXDCbLGEDttK2gRMTV1iK9Pf?=
 =?us-ascii?Q?bfcX0ZKG7VRcpENsAbynZdgqGXVCd6/Jn28C5QVXx5Lp0447m0Aqra2vGoNd?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 566586c8-babe-415c-8a6a-08daa32e686a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 21:54:54.4325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+7ivX+UdDuM+T1YOUsnGmhl/fWrkj+4P5qZKhYN8pLJL7l/KWvioVCVQvlNZXoqHGX58uX1q5qEQoIm7djgn5mfGxBLTc27BKchanR46ZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5408
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

On Wed, Sep 28, 2022 at 03:20:52PM +0530, Balasubramani Vivekanandan wrote:
> On 19.09.2022 15:32, Matt Roper wrote:
> > Starting in Xe_HP, several registers our driver works with have been
> > converted from singleton registers into replicated registers with
> > multicast behavior.  Although the registers are still located at the
> > same MMIO offsets as on previous platforms, let's duplicate the register
> > definitions in preparation for upcoming patches that will handle
> > multicast registers in a special manner.
> > 
> > The registers that are now replicated on Xe_HP are:
> >  * PAT_INDEX (mslice replication)
> >  * FF_MODE2 (gslice replication)
> >  * COMMON_SLICE_CHICKEN3 (gslice replication)
> >  * SLICE_COMMON_ECO_CHICKEN1 (gslice replication)
> >  * SLICE_UNIT_LEVEL_CLKGATE (gslice replication)
> >  * LNCFCMOCS (lncf replication)
> > 
> > Bspec: 66534
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 18 ++++++++-----
> >  drivers/gpu/drm/i915/gt/intel_gtt.c         | 29 ++++++++++++++-------
> >  drivers/gpu/drm/i915/gt/intel_mocs.c        |  5 +++-
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 24 ++++++++---------
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  |  7 +++--
> >  5 files changed, 52 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index e5a1ea255640..559e3473f14c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -329,6 +329,7 @@
> >  #define GEN7_TLB_RD_ADDR			_MMIO(0x4700)
> >  
> >  #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> > +#define XEHP_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> >  
> >  #define XEHP_TILE0_ADDR_RANGE			_MMIO(0x4900)
> >  #define   XEHP_TILE_LMEM_RANGE_SHIFT		8
> > @@ -387,7 +388,8 @@
> >  #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
> >  #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
> >  
> > -#define FF_MODE2				_MMIO(0x6604)
> > +#define GEN12_FF_MODE2				_MMIO(0x6604)
> > +#define XEHP_FF_MODE2				_MMIO(0x6604)
> >  #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
> >  #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
> >  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> > @@ -442,6 +444,7 @@
> >  #define GEN8_HDC_CHICKEN1			_MMIO(0x7304)
> >  
> >  #define GEN11_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
> > +#define XEHP_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
> >  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> >  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE	REG_BIT(12)
> >  #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
> > @@ -455,10 +458,9 @@
> >  #define   DISABLE_PIXEL_MASK_CAMMING		(1 << 14)
> >  
> >  #define GEN9_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
> > -#define   GEN11_STATE_CACHE_REDIRECT_TO_CS	(1 << 11)
> > -
> > -#define SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
> > +#define XEHP_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
> >  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
> > +#define   GEN11_STATE_CACHE_REDIRECT_TO_CS	(1 << 11)
> >  
> >  #define GEN9_SLICE_PGCTL_ACK(slice)		_MMIO(0x804c + (slice) * 0x4)
> >  #define GEN10_SLICE_PGCTL_ACK(slice)		_MMIO(0x804c + ((slice) / 3) * 0x34 + \
> > @@ -703,7 +705,8 @@
> >  #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
> >  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
> >  
> > -#define SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> > +#define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> > +#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> >  #define   SARBUNIT_CLKGATE_DIS			(1 << 5)
> >  #define   RCCUNIT_CLKGATE_DIS			(1 << 7)
> >  #define   MSCUNIT_CLKGATE_DIS			(1 << 10)
> > @@ -718,7 +721,7 @@
> >  #define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)
> >  #define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
> >  
> > -#define SUBSLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x9524)
> > +#define GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9524)
> >  #define   DSS_ROUTER_CLKGATE_DIS		REG_BIT(28)
> >  #define   GWUNIT_CLKGATE_DIS			REG_BIT(16)
> >  
> > @@ -943,7 +946,8 @@
> >  
> >  /* MOCS (Memory Object Control State) registers */
> >  #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> 
> GEN9_LNCFCMOCS is used in few functions in file selftest_mocs.c. This
> patch has untouched those instances. Is it by intention to handle it
> part of a separate series?  If the plan is to handle it later sometime
> can we create a ticket to keep track of it?

Both of the instances there are just looking up the offset of the
register (which is the same for both the MCR and non-MCR version of the
register) and aren't doing any CPU reads/writes directly where the
multicast nature of the register would come into play.  So I think it's
okay to keep using the GEN9_ version there to keep things simple.  But
I'll add a note about it to the commit message.


Matt

> 
> Regards,
> Bala
> 
> > -#define GEN9_LNCFCMOCS_REG_COUNT		32
> > +#define XEHP_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> > +#define LNCFCMOCS_REG_COUNT			32
> >  
> >  #define GEN7_L3CNTLREG3				_MMIO(0xb024)
> >  
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > index b67831833c9a..601d89b4feb1 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > @@ -479,15 +479,26 @@ void gtt_write_workarounds(struct intel_gt *gt)
> >  
> >  static void tgl_setup_private_ppat(struct intel_uncore *uncore)
> >  {
> > -	/* TGL doesn't support LLC or AGE settings */
> > -	intel_uncore_write(uncore, GEN12_PAT_INDEX(0), GEN8_PPAT_WB);
> > -	intel_uncore_write(uncore, GEN12_PAT_INDEX(1), GEN8_PPAT_WC);
> > -	intel_uncore_write(uncore, GEN12_PAT_INDEX(2), GEN8_PPAT_WT);
> > -	intel_uncore_write(uncore, GEN12_PAT_INDEX(3), GEN8_PPAT_UC);
> > -	intel_uncore_write(uncore, GEN12_PAT_INDEX(4), GEN8_PPAT_WB);
> > -	intel_uncore_write(uncore, GEN12_PAT_INDEX(5), GEN8_PPAT_WB);
> > -	intel_uncore_write(uncore, GEN12_PAT_INDEX(6), GEN8_PPAT_WB);
> > -	intel_uncore_write(uncore, GEN12_PAT_INDEX(7), GEN8_PPAT_WB);
> > +	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 50)) {
> > +		intel_uncore_write(uncore, XEHP_PAT_INDEX(0), GEN8_PPAT_WB);
> > +		intel_uncore_write(uncore, XEHP_PAT_INDEX(1), GEN8_PPAT_WC);
> > +		intel_uncore_write(uncore, XEHP_PAT_INDEX(2), GEN8_PPAT_WT);
> > +		intel_uncore_write(uncore, XEHP_PAT_INDEX(3), GEN8_PPAT_UC);
> > +		intel_uncore_write(uncore, XEHP_PAT_INDEX(4), GEN8_PPAT_WB);
> > +		intel_uncore_write(uncore, XEHP_PAT_INDEX(5), GEN8_PPAT_WB);
> > +		intel_uncore_write(uncore, XEHP_PAT_INDEX(6), GEN8_PPAT_WB);
> > +		intel_uncore_write(uncore, XEHP_PAT_INDEX(7), GEN8_PPAT_WB);
> > +	} else {
> > +		/* TGL doesn't support LLC or AGE settings */
> > +		intel_uncore_write(uncore, GEN12_PAT_INDEX(0), GEN8_PPAT_WB);
> > +		intel_uncore_write(uncore, GEN12_PAT_INDEX(1), GEN8_PPAT_WC);
> > +		intel_uncore_write(uncore, GEN12_PAT_INDEX(2), GEN8_PPAT_WT);
> > +		intel_uncore_write(uncore, GEN12_PAT_INDEX(3), GEN8_PPAT_UC);
> > +		intel_uncore_write(uncore, GEN12_PAT_INDEX(4), GEN8_PPAT_WB);
> > +		intel_uncore_write(uncore, GEN12_PAT_INDEX(5), GEN8_PPAT_WB);
> > +		intel_uncore_write(uncore, GEN12_PAT_INDEX(6), GEN8_PPAT_WB);
> > +		intel_uncore_write(uncore, GEN12_PAT_INDEX(7), GEN8_PPAT_WB);
> > +	}
> >  }
> >  
> >  static void icl_setup_private_ppat(struct intel_uncore *uncore)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> > index c6ebe2781076..06643701bf24 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> > @@ -608,7 +608,10 @@ static void init_l3cc_table(struct intel_uncore *uncore,
> >  	u32 l3cc;
> >  
> >  	for_each_l3cc(l3cc, table, i)
> > -		intel_uncore_write_fw(uncore, GEN9_LNCFCMOCS(i), l3cc);
> > +		if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 50))
> > +			intel_uncore_write_fw(uncore, XEHP_LNCFCMOCS(i), l3cc);
> > +		else
> > +			intel_uncore_write_fw(uncore, GEN9_LNCFCMOCS(i), l3cc);
> >  }
> >  
> >  void intel_mocs_init_engine(struct intel_engine_cs *engine)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index e382cb4c6971..eff5f4f85374 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -572,7 +572,7 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
> >  	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> >  			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
> >  	wa_add(wal,
> > -	       FF_MODE2,
> > +	       XEHP_FF_MODE2,
> >  	       FF_MODE2_TDS_TIMER_MASK,
> >  	       FF_MODE2_TDS_TIMER_128,
> >  	       0, false);
> > @@ -599,7 +599,7 @@ static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
> >  	 * verification is ignored.
> >  	 */
> >  	wa_add(wal,
> > -	       FF_MODE2,
> > +	       GEN12_FF_MODE2,
> >  	       FF_MODE2_TDS_TIMER_MASK,
> >  	       FF_MODE2_TDS_TIMER_128,
> >  	       0, false);
> > @@ -637,7 +637,7 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
> >  	 * to Wa_1608008084.
> >  	 */
> >  	wa_add(wal,
> > -	       FF_MODE2,
> > +	       GEN12_FF_MODE2,
> >  	       FF_MODE2_GS_TIMER_MASK,
> >  	       FF_MODE2_GS_TIMER_224,
> >  	       0, false);
> > @@ -670,7 +670,7 @@ static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
> >  
> >  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
> >  		/* Wa_14010469329:dg2_g10 */
> > -		wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
> > +		wa_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
> >  			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE);
> >  
> >  		/*
> > @@ -678,12 +678,12 @@ static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
> >  		 * Wa_22010613112:dg2_g10
> >  		 * Wa_14010698770:dg2_g10
> >  		 */
> > -		wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
> > +		wa_masked_en(wal, XEHP_COMMON_SLICE_CHICKEN3,
> >  			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
> >  	}
> >  
> >  	/* Wa_16013271637:dg2 */
> > -	wa_masked_en(wal, SLICE_COMMON_ECO_CHICKEN1,
> > +	wa_masked_en(wal, XEHP_SLICE_COMMON_ECO_CHICKEN1,
> >  		     MSC_MSAA_REODER_BUF_BYPASS_DISABLE);
> >  
> >  	/* Wa_14014947963:dg2 */
> > @@ -1255,14 +1255,14 @@ icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  
> >  	/* Wa_1406680159:icl,ehl */
> >  	wa_write_or(wal,
> > -		    SUBSLICE_UNIT_LEVEL_CLKGATE,
> > +		    GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
> >  		    GWUNIT_CLKGATE_DIS);
> >  
> >  	/* Wa_1607087056:icl,ehl,jsl */
> >  	if (IS_ICELAKE(i915) ||
> >  	    IS_JSL_EHL_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
> >  		wa_write_or(wal,
> > -			    SLICE_UNIT_LEVEL_CLKGATE,
> > +			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
> >  			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
> >  
> >  	/*
> > @@ -1322,7 +1322,7 @@ tgl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  	/* Wa_1607087056:tgl also know as BUG:1409180338 */
> >  	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
> >  		wa_write_or(wal,
> > -			    SLICE_UNIT_LEVEL_CLKGATE,
> > +			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
> >  			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
> >  
> >  	/* Wa_1408615072:tgl[a0] */
> > @@ -1341,7 +1341,7 @@ dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  	/* Wa_1607087056:dg1 */
> >  	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
> >  		wa_write_or(wal,
> > -			    SLICE_UNIT_LEVEL_CLKGATE,
> > +			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
> >  			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
> >  
> >  	/* Wa_1409420604:dg1 */
> > @@ -1445,7 +1445,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  			    CG3DDISCFEG_CLKGATE_DIS);
> >  
> >  		/* Wa_14011006942:dg2 */
> > -		wa_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE,
> > +		wa_write_or(wal, GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE,
> >  			    DSS_ROUTER_CLKGATE_DIS);
> >  	}
> >  
> > @@ -1457,7 +1457,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  		wa_write_or(wal, UNSLCGCTL9444, LTCDD_CLKGATE_DIS);
> >  
> >  		/* Wa_14011371254:dg2_g10 */
> > -		wa_write_or(wal, SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
> > +		wa_write_or(wal, XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
> >  
> >  		/* Wa_14011431319:dg2_g10 */
> >  		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > index 74cbe8eaf531..7d9f4f57ca95 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> > @@ -372,8 +372,11 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
> >  					false);
> >  
> >  	/* add in local MOCS registers */
> > -	for (i = 0; i < GEN9_LNCFCMOCS_REG_COUNT; i++)
> > -		ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
> > +	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++)
> > +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
> > +			ret |= GUC_MMIO_REG_ADD(gt, regset, XEHP_LNCFCMOCS(i), false);
> > +		else
> > +			ret |= GUC_MMIO_REG_ADD(gt, regset, GEN9_LNCFCMOCS(i), false);
> >  
> >  	return ret ? -1 : 0;
> >  }
> > -- 
> > 2.37.3
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
