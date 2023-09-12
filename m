Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E940079D4A7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 17:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1CB10E434;
	Tue, 12 Sep 2023 15:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A1A10E431;
 Tue, 12 Sep 2023 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694531948; x=1726067948;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ty0WTJ45MpFjGOtFrD1gzOPCWauMejpNvUijz5/ZXkQ=;
 b=lrl/hrmx5+vR8HXAnBAEza9NJ4F24jmZ62GQdGjHkz6Ca7IhMdfRnVdD
 H/wAicCOyiusXy2rIfwnKpFumypO8u6J/Il1Ckg6gitsYF4KiyzGvxLg0
 GguZMmcZaVBi5UbI+DBWSnSuzROGngBDJb1BNNDV0Jpo53ker9KP9XPak
 RWYNthtf/VxKehWCr3RWt2h7FEfjKeDfpVN9Ng6rDqSP69XnoS0jA19uM
 9V6x/G3VBylJwBwhBJzjmTOh0jpFMIUgMQFRMfLrGT9Acy/wOnxRbAPOV
 bwWysaypZGhxbVuXJRblU9EySASq8tTvQ6zUdgWKvphgdncwoePRLXgJH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357837426"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="357837426"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 08:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="833937200"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="833937200"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 08:19:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 08:19:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 08:19:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 08:19:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 08:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSQB63vhx/QbvYQ5yWF0kBeBeGrWyHHfzeRNPye9Mrn0q0wym32IwRB9DWxEFE7TB+QzVcWk3pnzNB62QjNgo9xuJT9dVxu8G4HLxKkRw6TO2/J3MQXqJbRGE/TiJKYkyly2vEWLz6FAGwzxHum4mGC5RjgG1ISZa1o86LdeLa7y6QxKlxmlZuCm5UsomOGWuAYLCPKZUJOudEJcKYyGvEYU5k1UJ+UOmFeWl7a2J4B8TMBYLzWjCQ66vZ3nViMW36PUakbbv525ZW40Fnbiruz+i4Q8O8Q3FEfZEeuF77UQ2hQ0WvzZ2jZ+S6bK7N30FF+Dc3HNoUD0Mbe56pwy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/1nO+o+Bc9XLG7+ZRPOWcAkkFKBHecwH+fn4ArwZpA=;
 b=BFYk08f9AD7rCDcdB6OV8FgrKyqRCP/8K/jl+wGTlZMZqRhoXluK9arWQCQI9zu2Yc96FBfnn9OkrSFVze+Rsnh0/6RkyyUZFQrMmpSFQTAq2SB3E+N4B+Re/hDZVL2mmDFC/taOWuU+Ix1Eim2NUOmFqMC/3iCZZ+coxLvM/VjUVVH5DQn+5PwBz1Hur1O5irvcwRDpTES9I0aU4SBmStKknCxT8eBdsjTduvwjGMm8a15YJmLszWk6QpbIWedQ4/Gdim11ghW2VPf1IP7ObwidgFOUPCCAtH3BT90c39rhY8WcZH7BoPayaQfNey0MU4mIvA4m/i8w89ZK5+XbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6693.namprd11.prod.outlook.com (2603:10b6:a03:44b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 15:18:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 15:18:58 +0000
Date: Tue, 12 Sep 2023 15:17:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler /
 entity
Message-ID: <ZQCA+ioDY6gk/oiI@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-4-matthew.brost@intel.com>
 <202309122100.HAEi8ytJ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202309122100.HAEi8ytJ-lkp@intel.com>
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d102d80-8b8d-4439-eecb-08dbb3a3965d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0PqvrStGJUaxtmVJEUy9h56Rtk6OYWcLRYF7ViBYD/D9Pu5kWBjK+W+bAVONzKgfRPzUTtZAj8XXIfz8xdoE2jlb5l941qCfjtZKAi0D7dFS49Ln9mxlv+7DAxsdj6qg+WblnlpuZDJDFUJg3EzaVUoI/fq9FSRiURmbeOUVxoK7ibehUU1yTCukxrAtnEAmhP0WntJa8VTeC9a1AJSLNzaqqOgpNoJ9rY380uP+2aLTHmi4sxtt8wW93aFXDUpPLs3CVn32xNlGF5oSVRRXHNp92vHYu95H24aphRkgadfK4L5GW4J3SVVp/spWUGZ1PYnjYLYBnuTyBwaUHRuZRBlCMZQwDLrzWhVBvCQxo9WHzeAbtLQdeTPzjcfjLYn21ahK5PN71cvMAF5W7+wRPyeYdB1t/HWJQMpKWv89+5hMsHAI1cCSq+ih9t+Uzt0zCNESuYO6TUwKjBBdAjLXbpVeY06xy7m1sucgSBoPqCsOjIJ1ro6cZZ+WKU5cplPHBq44X5kUAhXrGPzGgVhNRecegJwpuwtRSMWAU598zx/DCBxYEUgEpEkj13V8kY7xEyiAk0pdFoPFvPj/vMvwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(186009)(1800799009)(451199024)(6486002)(7416002)(41300700001)(6506007)(316002)(966005)(2906002)(478600001)(86362001)(66946007)(6636002)(66556008)(82960400001)(66476007)(38100700002)(6666004)(5660300002)(83380400001)(8936002)(8676002)(6862004)(26005)(4326008)(44832011)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iP1zMldrDox3JWf+g8NwecqJ243T5VKiTUcCsB06wNZ4DYhJ8+zmZ2025JoI?=
 =?us-ascii?Q?x3ByOZED7esaJnmTV5iwG2K1Lg3UTFhCzGu8hfGODjAnvSE8IcFfoFQzJZiI?=
 =?us-ascii?Q?M190ALfIGR9Y5ysq/8OUWosblHOoqlZVg3oZEPeFtAxShaAQDg9jhxbUhzG9?=
 =?us-ascii?Q?OQg3OidUsj4USocrXW/ctgNiyVbKpbb57nETmwrusJe1uxYwQ+LuLwXS/OSy?=
 =?us-ascii?Q?MKyFcfuz7h2MfYoglEn9yK4a2hhDwhes239U4CX5jYLAIfVm+gPf6NULyQg/?=
 =?us-ascii?Q?cyiHO2lZFZ1lkPl8kf5OdmXepkU1jtANteA8Ch5H6cBQLiVBAEcvfgWUfXBc?=
 =?us-ascii?Q?hCymixQYWwDJBUEXvafmv1yU5xZDR8cwWe2g7DYajmk9pmSMcm6uSWlbVvma?=
 =?us-ascii?Q?V15GritkKzhDyl8zOQSl494iSz1KeB0rDAy6MZqF1opKfNiDrz7WPYw9m0z0?=
 =?us-ascii?Q?otxWTMxNrRlH6gvCY9QsKn165xrb8XwabobhVK/je9W/FWHUBSWN0d8/KK9I?=
 =?us-ascii?Q?yGw0MUvhZfl6fLNjCqX/p9GF0uK6RDpcC0RAYIkfnPKiYytOLzMnB0VcJokp?=
 =?us-ascii?Q?DPnPe4B1Kov77cDUfrvlgtj36DaHTqIfTS+NIjTnEEFltdNlj9g81A9oVWiA?=
 =?us-ascii?Q?0/qgY7I50CKwuLahcOJRKKCl5LyekQDqaLEa9IGF7BiUEARLbSAHcT2E0sLZ?=
 =?us-ascii?Q?HhZBBAgGiQudIHDuE7jgErIv4EoEQ5CpjPLZFw+F8A1rvTHhzfh+HQAudHJ0?=
 =?us-ascii?Q?JJy9H68cs1bzebGniwvyVV1w0l7clUoTLGbvJDn6BRWt4UF5fgKfyzoVBxOn?=
 =?us-ascii?Q?moTnRYCLTCdb++GktiCmjEz6di+BWXAwyfx90OoKG1052PwYndXaR6RZwQpn?=
 =?us-ascii?Q?zGa+YBEu88bdmnsoK5ygSFtPshlJVwzsS96n2DI2YJI91J+L4UbAyDUd2TCr?=
 =?us-ascii?Q?RGnMS8OjshWfRwodkBgEwYAxV9jezyuYfbcFqSAr2o7Q1sknMjidJ+qrPjte?=
 =?us-ascii?Q?asCqo9gZL7Yw3AZM1fw5Pr8qyu86+OMfOUo5hN2XvdQXF2Wk9+kNteRM5bG5?=
 =?us-ascii?Q?PHNo/Uz9Kt07tArPuAEKpQBKt4Ai3TW2+MzC4gZFIL4YAeFsvxdRMuTFArLr?=
 =?us-ascii?Q?P13fVGc4Ek9v9DTY/hhWA+Xu9pfuiSgrqqz7gR/UcUAo4tNm/i7JZY669Mmu?=
 =?us-ascii?Q?+EF8s/X43ovkFWniozAPSNjjxpaozHzrbv7ZcmEM1TDqXayoE/dOIfUMrVR+?=
 =?us-ascii?Q?YuIHgFslbp6FdKdc7cjJoSE2IB+b+ISLOy9jC39QrZsVjQQ9MZnNSoiX0BYz?=
 =?us-ascii?Q?3Ihk5fn+WlCZBpZspWHqOteHxCbPxFyLVobFqLaPEGAR+vkYPYYpAZ8kVfWl?=
 =?us-ascii?Q?kTZN86K9sWn7HNlV+9IEG7P2IKmVPbPbJ/QN4PrPFNWN3XgDR3v3qPTdhFfh?=
 =?us-ascii?Q?CReR0xwvZE3aNSb/wcuChO9UePRuiH/gb3Om40w8QqRr21m/VgOpZb6xVPUg?=
 =?us-ascii?Q?tDz9bv7wcA9TluKlM8/X6wMTGkHtPP8drEyzyAePGCJh58E45Pps8x7Im/mB?=
 =?us-ascii?Q?73KfFxPQu8UlwI/cXKpAw603xW9CM2BXNDRIymXKAyBDQVkQvqjNi67B5SV/?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d102d80-8b8d-4439-eecb-08dbb3a3965d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 15:18:58.8309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rnya9rbLo9zOUKKSfuRZRbuJGzcnQq2wgDGo4ZCPplJY+sqXcZjnp5d8ir7SsJJlBx2l0XxdMzNHGKfqfeKM8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6693
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, mcanal@igalia.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 llvm@lists.linux.dev, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 10:11:56PM +0800, kernel test robot wrote:
> Hi Matthew,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on drm/drm-next]
> [also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6-rc1 next-20230912]
> [cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-drm_sched_submit_-helpers/20230912-102001
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> patch link:    https://lore.kernel.org/r/20230912021615.2086698-4-matthew.brost%40intel.com
> patch subject: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler / entity
> config: arm64-randconfig-r032-20230912 (https://download.01.org/0day-ci/archive/20230912/202309122100.HAEi8ytJ-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122100.HAEi8ytJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309122100.HAEi8ytJ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/v3d/v3d_sched.c:403:9: error: use of undeclared identifier 'ULL'
>                                 ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
>                                 ^

Typos, s/ULL/NULL in next rev.

Matt

>    1 error generated.
> 
> 
> vim +/ULL +403 drivers/gpu/drm/v3d/v3d_sched.c
> 
>    381	
>    382	int
>    383	v3d_sched_init(struct v3d_dev *v3d)
>    384	{
>    385		int hw_jobs_limit = 1;
>    386		int job_hang_limit = 0;
>    387		int hang_limit_ms = 500;
>    388		int ret;
>    389	
>    390		ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
>    391				     &v3d_bin_sched_ops, NULL,
>    392				     hw_jobs_limit, job_hang_limit,
>    393				     msecs_to_jiffies(hang_limit_ms), NULL,
>    394				     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
>    395				     v3d->drm.dev);
>    396		if (ret)
>    397			return ret;
>    398	
>    399		ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>    400				     &v3d_render_sched_ops, NULL,
>    401				     hw_jobs_limit, job_hang_limit,
>    402				     msecs_to_jiffies(hang_limit_ms), NULL,
>  > 403				     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
>    404				     v3d->drm.dev);
>    405		if (ret)
>    406			goto fail;
>    407	
>    408		ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
>    409				     &v3d_tfu_sched_ops, NULL,
>    410				     hw_jobs_limit, job_hang_limit,
>    411				     msecs_to_jiffies(hang_limit_ms), NULL,
>    412				     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
>    413				     v3d->drm.dev);
>    414		if (ret)
>    415			goto fail;
>    416	
>    417		if (v3d_has_csd(v3d)) {
>    418			ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
>    419					     &v3d_csd_sched_ops, NULL,
>    420					     hw_jobs_limit, job_hang_limit,
>    421					     msecs_to_jiffies(hang_limit_ms), NULL,
>    422					     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
>    423					     v3d->drm.dev);
>    424			if (ret)
>    425				goto fail;
>    426	
>    427			ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
>    428					     &v3d_cache_clean_sched_ops, NULL,
>    429					     hw_jobs_limit, job_hang_limit,
>    430					     msecs_to_jiffies(hang_limit_ms), NULL,
>    431					     NULL, "v3d_cache_clean",
>    432					     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
>    433			if (ret)
>    434				goto fail;
>    435		}
>    436	
>    437		return 0;
>    438	
>    439	fail:
>    440		v3d_sched_fini(v3d);
>    441		return ret;
>    442	}
>    443	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
