Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2661FD99
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 19:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803BF10E1C8;
	Mon,  7 Nov 2022 18:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B366F10E1C8;
 Mon,  7 Nov 2022 18:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667845962; x=1699381962;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qqBkyDZ2TljTJF8aXERJW3WjNIOR0P7zU+EMJiV6pWo=;
 b=hw1qDdieR1UNi5dMgMTo2LI2roeOIMPJFhYc+DXRt+u41xP0758hOuUB
 TLOZJMqAlIVzIu92QzitEyNRQuXbO2jIPguq69NapI9x2QRdFumWcCjAw
 hIMbUJziujEeUYYmPo8mI44Ab+gvmAqTRZLL3+dwr3FoYlip8HF0+9g4d
 3k4zN3h43m9q/KLqnC+FiG6s9cPq+oYoMirJtgsohSiTqWyaVnMyGGj9Z
 OpEDsXiQk7akMmczL6n86V82b6vyVOJxL3NOgIBeWKK8IxOn1uTr4LLx1
 hyfE2MtwDOTV84+lhQAaWmL41hpP4JQrO9fcv8iV6JYS1c74kcJGPaZfB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="372629246"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="372629246"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 10:32:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="778604116"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="778604116"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2022 10:32:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 10:32:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 10:32:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 10:32:40 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 10:32:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdOD4PQJ+Ck8YcRTpW9h9ND4EEQfk4l3B7AWTe1eezOaanlEeYnaSSEnFZIH2T1dvXC0PUkuH0POc1oD2k+9AJ9WOL/GPNf9MNqY4b7BB3FWagKr5vT+XL4meVGNnxDO+z9hDoRIL0C69nYJLdEe+DgkWQO2QCFwYV2dTNXQzM4x6+Y2ef/Hog16Xdtva1E28oc9ShwpRxnG4lKWHAxrNAWWIZBXg7th8XIHf+EyeOn+cLG0NzMRAsWcfSSw9pn66DC3xWAWWJT9sz+kqn8uAKMtcZzBbdLG/RWB+ViW396eZSj1GDzYYWU6wQCRg4BBg5ng3eHfidGbhCgkQVNPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gmu3sAWZp1MbAEHY8iOva7fkCz9xHvT5fQUC1CtAcJE=;
 b=OVAM+RryaLFjstfFlR+UXRHbZTAZr+LYrg4cDysX8HJjSL7SNWuN9qhvEk3LXXf6Z0S5u0llxaZZGKO6Ogp/kNxH2WQCrjQiqIzms5q5GG8q55VEBaTsuqyCN4AHo/crc/JXOrv8on0Wks8WUWzgpp9dmhkqWLr2VadIbUg1wYS47PFB/VXd39wsTwi+67czDdyDcAk2Qjkl8YgvcHoKqptw6DPLQ+r1JoYI0kB+63W86xHFJZKIMdSb6OY5RwgNKnryn/H0V/z8OyP/zVUYNfczkebjBA9gTDW+Np8xaKqZxCprhkIRVu/Ok6XoQl9vQF8k6oXIbnfR54tz7aoqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 18:32:38 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 18:32:38 +0000
Date: Mon, 7 Nov 2022 10:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 3/5] drm/i915/mtl: add GSC CS interrupt support
Message-ID: <Y2lPROxrfk5e198t@mdroper-desk1.amr.corp.intel.com>
References: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
 <20221102171047.2787951-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221102171047.2787951-4-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::21) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH7PR11MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5530be-f35a-4ded-71ab-08dac0ee72c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: toqm7TUnXaAv5bol3YWI05kT+UOimVIeCnN7aXNpxppAa1RdCaKKxVPYAqY2tM3iAvHWpPTLDKoB4v0/2g4jpK1zOnM/AOe63lIvrOLLnfY4/CPFgYen0N5OrmCkay8+BGBqF7apx39VDIG/akpkbgIpHLNy9T1hJnZtXdC0bMxx2EGqiOhmujDWlzakqsHFi4ElGXm8M0ufjvWCZPGE6QXQvSZ3mvUMyafALvfOb3P+68vpmLloJyT3t2LF345WLzq3cfp2qrLL+OuTuLvsxVil24dDFP8GVjBijsSvb7e2anjQTEUnaGQmUmb/dj8MO0n0wptqbEYpcx1J8MS8PoKPHThtQKbPGF5raFsha2uFeUrWsYvD2EDmA4SHBiNoZXoBGdWT3+LgVegv5LToDMwhoqUfrlIzDQt5lIdUdJHW7LJWxFP6UGsP+dHwDvFXbaR3noa6iFh8sXt0VRdRJFasqTrpBnSuEBY4VCxTIdliOOVDu6Eu/A6ejcsWSZpnCpQzFdykUesBdCzn1gmspjFRX6G3A3/iXBKdM6PNpkbfkJzHxgIfs0kJIWhQhRoEVI5+tlvgbKB2IjmzRDnKqpFRYEu0FgG3CQfzHb1s/o+A5Qv7m2PEd9cf59Mobjo+j8R5NAOmcz07aoJfFkCUWqTfJuLh+ovC30U+zGvGF4oh8SoivDivYs8ThkNegBgDxgk+94AW6Jb0C4w96xcICA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199015)(186003)(26005)(6512007)(6506007)(83380400001)(2906002)(66556008)(478600001)(6636002)(316002)(6486002)(5660300002)(38100700002)(41300700001)(6862004)(8936002)(4326008)(66946007)(66476007)(8676002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KPtH/XEr65Bnd0pJkTzS1jxUpTfxM4VWixiB5jSNtNG4/AppXWP5E4Atze3P?=
 =?us-ascii?Q?cDi+Htb0j9VlwN80bbhJiQqRvrjkq7dA6uIl+9nnNDEolno0bfFQQQePiEEC?=
 =?us-ascii?Q?hl09kLdaWZlqkqr7mXiqJMHEATlxJZe5DK8RJict6O5JCCLE5BiRdE5nWm5R?=
 =?us-ascii?Q?94hEyE/9U0s9RW5tDfDRXpxsYs3+wgaK6Jr/5X0q1kdy8Fr8nv6JK5XvJX2O?=
 =?us-ascii?Q?IU+nVJeNnUFz81NRVILGPQ42wTVSvuAQ6SQqUCLGZbzPLZXQtozNb24qqZWU?=
 =?us-ascii?Q?54TZCVThr0QUEq5yTugmajp4YmdJDGlhf3ZwV7CHLB05EPU3u0rZFANcHb+U?=
 =?us-ascii?Q?K/q9+BqviUQ6d8qqyJ8eI1aQtk7ZOPArPj7C9Qw8Z0zy3XUQ5V0FSj2KP5Fg?=
 =?us-ascii?Q?gp7vhDdKOdRhHRPTOf2fTinghrn4yUcB0o4cuYCo60sCgU0ok80MjW3KC2wV?=
 =?us-ascii?Q?IUUjEQnr9Dh8cnlJ4gye0Bhf48HJq5Dzdx80NdKswInvmkYXBzekzqWrj0Oo?=
 =?us-ascii?Q?GcPvMyAuh0Fof3DrgufPV3omJGJYiA8VgLAPVVDnQWpajgVuttekEbK3NtDB?=
 =?us-ascii?Q?txYgc2k1NKkwlY9iU2eMt8BlysgxLyS1hqxPVkev/H7Q71Z1BoXGEmHB2/ER?=
 =?us-ascii?Q?QWoOQilhYpxOyzSoS1cujuUVDiotX/oay3kInWmbo9tADvPzSi9TPAZruCkP?=
 =?us-ascii?Q?vsTZp3t39XaHGl1KKOd9zpRNX77Sv8bdV38detApY8/9CH4BPm3e1QCvpm71?=
 =?us-ascii?Q?ZRck+yB7p7/6t5tUrflz8D4tJbOUgIEutUKdF5BJn+DCTYgRPcbRNZ2zgQoT?=
 =?us-ascii?Q?hYVLPNSjCVWDjCHKgozSwcMfpv3KNP8AUOyqsZUa1JfqrsL6AmERhdeQf8rQ?=
 =?us-ascii?Q?uMVuA0qQTo47rr67bjv9kTaqDW59T4ar3TYUMpKJ3BdrTwqhSgg+rh39iJ0J?=
 =?us-ascii?Q?UQ3WlwXzBXP85kePGryQ+bQFS8GgLJCLXypz0RNHPOziRYhwoP7PKXqLWMxv?=
 =?us-ascii?Q?QIuUS2IAiPSs1ahKJtpB077oo0GosKB0vBCpUPOThRZt+iULA6otBf5ys4UK?=
 =?us-ascii?Q?Mw5EUbQDdSX/23rSeQGyY4iOVoEmJ9sM6XeWmffzETwG5z/hJz16RVLhuUT2?=
 =?us-ascii?Q?zEdusGhV7VHMmDo5liQ+slCYWhlF4BfRBDyJAFFOPZGgQmO9FYoBvIHOGu0l?=
 =?us-ascii?Q?/FTfKKXKPua2dvh0DtUq24SDOIhYxCs1jsPxYnF4oVafBPc4cYemSm774qmI?=
 =?us-ascii?Q?hvmOop47SUSRz0bs4NwC3RufkJJewOR8l8VJV/BJPo7X83TwAwg5+bd6ekPU?=
 =?us-ascii?Q?HQgpQkhpYChdJ42C3hPqIt8RqOZoSi/wOy4g+mCKolaxcAknqCAsz6KODKrg?=
 =?us-ascii?Q?YgO54auUCIlXf7dp73g+97xF5vyROCUxyBuKXcn4UCjq1D/xmZCVpUZkQlzJ?=
 =?us-ascii?Q?RPLm9oy1JnfdL1rx7FUyj3RJ76ltp20QoLv9qx10RTieoTESIShGXEShOvVG?=
 =?us-ascii?Q?GBhoWOnSTQxWyeaA7abB68DRUcuDOjsoMgW08O6mTuuqM47TcjtBCtL0Ygn/?=
 =?us-ascii?Q?Jeeit6SrG14zNLuCHtnZWpPIifH/hLQ5f4s1m+Dzd1GTGqm3g686qDIblF27?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5530be-f35a-4ded-71ab-08dac0ee72c6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 18:32:38.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSykp14HE/uw31cPdsdsxD/1erwmw03rRar5lkC3z+zcB87Hoh9EWUjaTHtLK92rSgUxyVJ1O24+I/x3QgWChEV7sB34CwhufToz+NmPm8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 10:10:45AM -0700, Daniele Ceraolo Spurio wrote:
> The GSC CS re-uses the same interrupt bits that the GSC used in older
> platforms. This means that we can now have an engine interrupt coming
> out of OTHER_CLASS, so we need to handle that appropriately.
> 
> v2: clean up the if statement for the engine irq (Tvrtko)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> #v1

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

for v2 as well.

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c | 75 ++++++++++++++------------
>  1 file changed, 40 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index f26882fdc24c..b197f0e9794f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -81,35 +81,27 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
>  		  instance, iir);
>  }
>  
> -static void
> -gen11_engine_irq_handler(struct intel_gt *gt, const u8 class,
> -			 const u8 instance, const u16 iir)
> +static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
>  {
> -	struct intel_engine_cs *engine;
> -
> -	/*
> -	 * Platforms with standalone media have their media engines in another
> -	 * GT.
> -	 */
> -	if (MEDIA_VER(gt->i915) >= 13 &&
> -	    (class == VIDEO_DECODE_CLASS || class == VIDEO_ENHANCEMENT_CLASS)) {
> -		if (!gt->i915->media_gt)
> -			goto err;
> +	struct intel_gt *media_gt = gt->i915->media_gt;
>  
> -		gt = gt->i915->media_gt;
> +	/* we expect the non-media gt to be passed in */
> +	GEM_BUG_ON(gt == media_gt);
> +
> +	if (!media_gt)
> +		return gt;
> +
> +	switch (class) {
> +	case VIDEO_DECODE_CLASS:
> +	case VIDEO_ENHANCEMENT_CLASS:
> +		return media_gt;
> +	case OTHER_CLASS:
> +		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
> +			return media_gt;
> +		fallthrough;
> +	default:
> +		return gt;
>  	}
> -
> -	if (instance <= MAX_ENGINE_INSTANCE)
> -		engine = gt->engine_class[class][instance];
> -	else
> -		engine = NULL;
> -
> -	if (likely(engine))
> -		return intel_engine_cs_irq(engine, iir);
> -
> -err:
> -	WARN_ONCE(1, "unhandled engine interrupt class=0x%x, instance=0x%x\n",
> -		  class, instance);
>  }
>  
>  static void
> @@ -122,8 +114,17 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
>  	if (unlikely(!intr))
>  		return;
>  
> -	if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
> -		return gen11_engine_irq_handler(gt, class, instance, intr);
> +	/*
> +	 * Platforms with standalone media have the media and GSC engines in
> +	 * another GT.
> +	 */
> +	gt = pick_gt(gt, class, instance);
> +
> +	if (class <= MAX_ENGINE_CLASS && instance <= MAX_ENGINE_INSTANCE) {
> +		struct intel_engine_cs *engine = gt->engine_class[class][instance];
> +		if (engine)
> +			return intel_engine_cs_irq(engine, intr);
> +	}
>  
>  	if (class == OTHER_CLASS)
>  		return gen11_other_irq_handler(gt, instance, intr);
> @@ -206,7 +207,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>  	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE,	  0);
>  	if (CCS_MASK(gt))
>  		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, 0);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
>  		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, 0);
>  
>  	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
> @@ -233,7 +234,7 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
>  		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~0);
>  	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
>  		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~0);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (HAS_HECI_GSC(gt->i915) || HAS_ENGINE(gt, GSC0))
>  		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~0);
>  
>  	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
> @@ -249,7 +250,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  {
>  	struct intel_uncore *uncore = gt->uncore;
>  	u32 irqs = GT_RENDER_USER_INTERRUPT;
> -	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
> +	u32 gsc_mask = 0;
>  	u32 dmask;
>  	u32 smask;
>  
> @@ -261,6 +262,11 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  	dmask = irqs << 16 | irqs;
>  	smask = irqs << 16;
>  
> +	if (HAS_ENGINE(gt, GSC0))
> +		gsc_mask = irqs;
> +	else if (HAS_HECI_GSC(gt->i915))
> +		gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
> +
>  	BUILD_BUG_ON(irqs & 0xffff0000);
>  
>  	/* Enable RCS, BCS, VCS and VECS class interrupts. */
> @@ -268,9 +274,8 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask);
>  	if (CCS_MASK(gt))
>  		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
> -	if (HAS_HECI_GSC(gt->i915))
> -		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE,
> -				   gsc_mask);
> +	if (gsc_mask)
> +		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, gsc_mask);
>  
>  	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>  	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
> @@ -296,7 +301,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~dmask);
>  	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
>  		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
> -	if (HAS_HECI_GSC(gt->i915))
> +	if (gsc_mask)
>  		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>  
>  	/*
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
