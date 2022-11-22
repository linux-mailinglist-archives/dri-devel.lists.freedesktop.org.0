Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC84634B69
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EB310E4B7;
	Tue, 22 Nov 2022 23:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5384110E4CB;
 Tue, 22 Nov 2022 23:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669161569; x=1700697569;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OIVeITUWHMN6S8ZZVifBcPxko6qkLTwQEXMFGWclMkc=;
 b=VEPI6ECBYOh9M6upJM0DfmpsVXX7hTXID1b8gcowObs/tUcYpZYI74nz
 jg0JYGP+IHPObRYbNM0CcqX0O0bblo4NVrH7/XeA8O9xLQkdja5XyBwmn
 SiWoD74esRHmnX84ZTrh2q2AMEUUI3877k+Qtu94p+GEgBKynXg91gd7P
 fAX7QQ8/JpbI2KN+XusynqyjbNc7Z4LSHoU42f3GZqW7pl+YDPVajiBfD
 5QYqJRgqtb3JDJga/I6WrGhMP6fVIO9saREMiAna9FinXxI2nAmz/Hpy7
 U1kVPSJmhnGjf1Y4XQW8RbdqEfH59Ax6k+YDzEsmKuEUcCGfo2yXZlvI4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="297300779"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="297300779"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 15:59:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="816280875"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="816280875"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 22 Nov 2022 15:59:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 15:59:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 15:59:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 15:59:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 15:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4xxaLmckIua5DZbYsDAkQ2ch5xyictdPOxX10N7ZfrWUwoG31fRKb++saZQwVyl8bNUyC71Z8fObV0UCXzlciWjx7kdl089yQ42lxNvy/X7CZprenjpwF6He8I1lUt4uTWPhK/AC53BAgEBtDRUXFuL2gTnj/k6cFPhGpTDs4zHXeJPfxZ2JfOdWqdYD9gnE7HHkS0nCJh5d8dPmf2uf9DEkuabWe9vw/i+R8upMINyh9jcrOc25WjxaRJzUpxCZWBQXaumu0dmEFPubDwoO8/adZ7QZpqfcsSnc1HCR2w9ivMu7gk8ikEeXnN9IqwdAOg9QezrArdQgubxM1xuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Mg1IMsOqVmCQztQbAdZ/K1Hgswa1MDn5rc1z9RPgxQ=;
 b=LGdLJ1OS64wnp5d3KieLQYldlj+OSuelIaEw/9EUX4sEIqRyMK2nC08tmAzh+7Ib+Ov0LZ/adAfoko2pNqFJPPwueTeSWiqkjDCY5m5hPiVg8CvMiH4ww5+VIhZf/2Lh0ohhYSGTdMJSeKUvqeZuzHAMj0WheFYOUco6jqYS6fyNcUNaxexMBZW3WBsZHl80cWHOyfILnpOhV+W0QlsWUfzcwqx6k2xX1yas8xt4Ld4+ONrVrS4D72UlHR3qm2pz22QyDwM0IufID6vBQZDpDIi5rQcCZyVNnakmExZBoyZ1DrA9enNYBrW7fVudlx+itu8/3kt9VTZiGG9Wr1Ozqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Tue, 22 Nov
 2022 23:59:26 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e%7]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 23:59:26 +0000
Date: Tue, 22 Nov 2022 15:59:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH v4] drm/i915/mtl: Media GT and Render GT share common GGTT
Message-ID: <Y31iW0lCuUcx4pNg@mdroper-desk1.amr.corp.intel.com>
References: <20221122070126.4813-1-aravind.iddamsetty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221122070126.4813-1-aravind.iddamsetty@intel.com>
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0b5027-79bf-48c8-776b-08dacce595b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tsk4pUzfj0Uy34p5jVlpsCe0rOrtz6AJzo1VgwuVWRTi1ggRsVKiJBYVU3358PydOH0/zubmb7qguUhph/1A8HxQqi/bB3gk8yEo0D+TTwnJ0uXZczWv7rbllI1rLLZS4ybQCPf3ND3a17qEkn/slsk0f0nNMiscifsC0Hs6N1IXHLrKrLmj8lfxKA37HRQYowuayrL25aN2C1tWm0AQTuJOFSLtzoh5yQW9KB2fjEdKqLbdO61tAdDAqqgMaZThSmSsigfIRKkOxKIR6wiILaM0Y8eX5JPQiQwqTQv4YoPfp883mtvrSrnj8D2iIdkjfSyw/M0mncJVmV5/xTSk4zQ7yKTzISYDH/VRYbC+lPI7WafvVhs+bBRVEB3eS73kp6Au70TWFOCJsZiVA9u4g3b++1YL1ns2u0k/4yO8/RZbB6+gDE3mGZdCb30HVwp8pTwvZcJviiq1ABGaIKsFV6cckJY0K5IRpPvLcY7MItMFV4kFgfz5wSr5ESwV9jJX0301dvoyS5h9EyXVJ5rUpdlQNGGGwagi8G098HH2GBzK/P4TmBa84sHbOW+7S7PwuE+jL4foUVVc8GVsAnhN4k+C8YrJWnZM33BpZ7QLRm2rYx32JZw4MevddsyMSucL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(450100002)(83380400001)(316002)(6512007)(186003)(26005)(8936002)(6636002)(66946007)(86362001)(82960400001)(30864003)(4326008)(8676002)(5660300002)(2906002)(66556008)(66476007)(6862004)(38100700002)(41300700001)(6486002)(6666004)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zetloujd3rn4bF618Ukfwckx4HgJJy0nVqFrbcoKF2zH97m9KxQqP0jE8u4r?=
 =?us-ascii?Q?mn/EAKra5ACqgGSqrLxz2BBkPVLhcLzzRUo4pCRezEY1VP0UHgE1GzVUOd0N?=
 =?us-ascii?Q?BOSJA+jTzziqF7HNXadto37J5Pph+7qAHVBec03pRGnV33CHhfv8FX+5ygZ6?=
 =?us-ascii?Q?FYbpyToiFU18H6xTrCFwOwOpJfhUhaG98rMciXz2TKM22RLdyPfZw7GyDraB?=
 =?us-ascii?Q?9iHAamgInZWLtvEalpk6N7OYrnbjLj1l41UYtBiKF6JCKzS7/MgN/HVCdbcC?=
 =?us-ascii?Q?pNwSCs3AzVzqFrh002TGui5WPsdnAIOVCuTkE6jtSuX2+o3aDEMxgcnxD9KV?=
 =?us-ascii?Q?qfr431xWlRBtf7bv6pKxoI6XRdmfmuHBT/DCZyyZAkZrZOHlOzhql4BcAuEy?=
 =?us-ascii?Q?IGExk8g4PkI7I3dVmegKHpz5xNlqsNUpPq8aD0IMJ/nzolkOiauI9z0EF67q?=
 =?us-ascii?Q?VsHrKWGnUip64+FzJwj5MquKr+Hs4nVheyqgvlfzlf0CwyGD6vdfudEN38N5?=
 =?us-ascii?Q?fHIpvG4oYhpMYQy+fC/HtSH4FXvA4md4yDVwcD8CuveMa+kiOoHLNwRrCTvZ?=
 =?us-ascii?Q?oyVCDPPQ+5A9iFUUxpP1oT1QzTVYaB/727d8+eNPNFx4gp2yJQ1qshlyMRAi?=
 =?us-ascii?Q?JJreDW5phodPc1+WvXS/fjrftROnRbtzFhCf2W7e/Ea+Sq3tZbWBWBFpIuqR?=
 =?us-ascii?Q?S6AwrmPcqlVFyrRfyTDKViPD9obKyvr2uK1G+O1mo6ABV5blFJLzw6Nx75Hz?=
 =?us-ascii?Q?x8qYyfXvhMrsZRNMvxrru4lgY19QCZqne2BlE+GzVVcIN6r+zRb0RFbALFSY?=
 =?us-ascii?Q?Dk+vQUMvm01YjBOiG3MQdvUB9EQ8J1r5ktjIF6TDwK/0TqupTWYmJV+ioRLx?=
 =?us-ascii?Q?nzTJIKBG7KmR9NmNG36qPivFX/8YxWpkw5Ukzdpsh+S6M7pHuViapUIkgsdl?=
 =?us-ascii?Q?zQzljG/LPmuG0OYprAE8p2fiSsBYVjO9Wk0U12KmUCAInwHm4GVMmui47Fj3?=
 =?us-ascii?Q?Juxf2kR1aKcFIDjsqNsvAO3n6fq33WPlY3Is2eiDdw40pb1KSWjOpRPeLAs6?=
 =?us-ascii?Q?oXyHqGexTFYAzWeMibmdaYanabk6KT8l0yfzK8oB9IyGNbrHGKT3vLjfCApP?=
 =?us-ascii?Q?vJMUywioV/PRmc1Rkm/upPbeV6IDLk/D39JSOT0MsXQCD8Oray0/wdvJEYoZ?=
 =?us-ascii?Q?Uifeoi21XQOkzMBdmJnSRUj8cvNPBBTHFTUIkOv3rpzimYEWIUafjWcdKbPX?=
 =?us-ascii?Q?GPAKTXbEn/ouVTExpM20zFBfUk7UImSjYCRY4ZiiqI5iELNBhPROMmgOebd0?=
 =?us-ascii?Q?uk9pX6vCqmOcvholqhcQ8CCqLpETIX+gTI0kacAZLRgMcaMA+22pN7bUxdef?=
 =?us-ascii?Q?s2fRydjJTNAOVEKXjjS8PTYvSqhcLnw1HasrKMAoOa91c92zRuU5lk0poMq+?=
 =?us-ascii?Q?BgESBTsszE3g12XKMwGlfFYjrEcnDK0MOWxNK3INcCjg7xYWTIE9txmDYxKA?=
 =?us-ascii?Q?zYemAX8Lxyxcx+zoNyEjLboERJJS+t2QkS5iCl6qU0UD2D9kYAbFZddKRhoX?=
 =?us-ascii?Q?jtUVIdQm4UeaUU6sKXXuop1HoKQdf0BukGvExb5LeiiMKa9byBbk6OyZbfhF?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0b5027-79bf-48c8-776b-08dacce595b4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 23:59:25.9586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaVFahG8SkumTccQED/psQCOblrgrhbh4AzmBkNyVSJvylq8JcAMOT6Gsi873XT0U0/vkoB8udUR/nET2mvuGbzcsON760cNntf/KnDurTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
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

On Tue, Nov 22, 2022 at 12:31:26PM +0530, Aravind Iddamsetty wrote:
> On XE_LPM+ platforms the media engines are carved out into a separate
> GT but have a common GGTMMADR address range which essentially makes
> the GGTT address space to be shared between media and render GT. As a
> result any updates in GGTT shall invalidate TLB of GTs sharing it and
> similarly any operation on GGTT requiring an action on a GT will have to
> involve all GTs sharing it. setup_private_pat was being done on a per
> GGTT based as that doesn't touch any GGTT structures moved it to per GT
> based.
> 
> BSPEC: 63834
> 
> v2:
> 1. Add details to commit msg
> 2. includes fix for failure to add item to ggtt->gt_list, as suggested
> by Lucas
> 3. as ggtt_flush() is used only for ggtt drop i915_is_ggtt check within
> it.
> 4. setup_private_pat moved out of intel_gt_tiles_init
> 
> v3:
> 1. Move out for_each_gt from i915_driver.c (Jani Nikula)
> 
> v4: drop using RCU primitives on ggtt->gt_list as it is not an RCU list
> (Matt Roper)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c      | 54 +++++++++++++++++------
>  drivers/gpu/drm/i915/gt/intel_gt.c        | 13 +++++-
>  drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 ++
>  drivers/gpu/drm/i915/gt/intel_gtt.h       |  4 ++
>  drivers/gpu/drm/i915/i915_driver.c        | 12 ++---
>  drivers/gpu/drm/i915/i915_gem.c           |  2 +
>  drivers/gpu/drm/i915/i915_gem_evict.c     | 51 +++++++++++++++------
>  drivers/gpu/drm/i915/i915_vma.c           |  5 ++-
>  drivers/gpu/drm/i915/selftests/i915_gem.c |  2 +
>  9 files changed, 111 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 8145851ad23d..7644738b9cdb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>  #include <linux/stop_machine.h>
>  
> +#include <drm/drm_managed.h>
>  #include <drm/i915_drm.h>
>  #include <drm/intel-gtt.h>
>  
> @@ -196,10 +197,13 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>  
>  void i915_ggtt_suspend(struct i915_ggtt *ggtt)
>  {
> +	struct intel_gt *gt;
> +
>  	i915_ggtt_suspend_vm(&ggtt->vm);
>  	ggtt->invalidate(ggtt);
>  
> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +		intel_gt_check_and_clear_faults(gt);
>  }
>  
>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
> @@ -225,16 +229,21 @@ static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>  
>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>  {
> -	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>  	struct drm_i915_private *i915 = ggtt->vm.i915;
>  
>  	gen8_ggtt_invalidate(ggtt);
>  
> -	if (GRAPHICS_VER(i915) >= 12)
> -		intel_uncore_write_fw(uncore, GEN12_GUC_TLB_INV_CR,
> -				      GEN12_GUC_TLB_INV_CR_INVALIDATE);
> -	else
> -		intel_uncore_write_fw(uncore, GEN8_GTCR, GEN8_GTCR_INVALIDATE);
> +	if (GRAPHICS_VER(i915) >= 12) {
> +		struct intel_gt *gt;
> +
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +			intel_uncore_write_fw(gt->uncore,
> +					      GEN12_GUC_TLB_INV_CR,
> +					      GEN12_GUC_TLB_INV_CR_INVALIDATE);
> +	} else {
> +		intel_uncore_write_fw(ggtt->vm.gt->uncore,
> +				      GEN8_GTCR, GEN8_GTCR_INVALIDATE);
> +	}
>  }
>  
>  u64 gen8_ggtt_pte_encode(dma_addr_t addr,
> @@ -986,8 +995,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  
>  	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>  
> -	setup_private_pat(ggtt->vm.gt);
> -
>  	return ggtt_probe_common(ggtt, size);
>  }
>  
> @@ -1196,7 +1203,14 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
>   */
>  int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>  {
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
> +
> +	for_each_gt(gt, i915, i) {
> +		ret = intel_gt_assign_ggtt(gt);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>  	if (ret)
> @@ -1208,6 +1222,19 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>  	return 0;
>  }
>  
> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915)
> +{
> +	struct i915_ggtt *ggtt;
> +
> +	ggtt = drmm_kzalloc(&i915->drm, sizeof(*ggtt), GFP_KERNEL);
> +	if (!ggtt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&ggtt->gt_list);
> +
> +	return ggtt;
> +}
> +
>  int i915_ggtt_enable_hw(struct drm_i915_private *i915)
>  {
>  	if (GRAPHICS_VER(i915) < 6)
> @@ -1296,9 +1323,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>  
>  void i915_ggtt_resume(struct i915_ggtt *ggtt)
>  {
> +	struct intel_gt *gt;
>  	bool flush;
>  
> -	intel_gt_check_and_clear_faults(ggtt->vm.gt);
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +		intel_gt_check_and_clear_faults(gt);
>  
>  	flush = i915_ggtt_resume_vm(&ggtt->vm);
>  
> @@ -1307,9 +1336,6 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>  	if (flush)
>  		wbinvd_on_all_cpus();
>  
> -	if (GRAPHICS_VER(ggtt->vm.i915) >= 8)
> -		setup_private_pat(ggtt->vm.gt);
> -
>  	intel_ggtt_restore_fences(ggtt);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index b5ad9caa5537..b03788d7674e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -110,9 +110,18 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>  
>  int intel_gt_assign_ggtt(struct intel_gt *gt)
>  {
> -	gt->ggtt = drmm_kzalloc(&gt->i915->drm, sizeof(*gt->ggtt), GFP_KERNEL);
> +	/* Media GT shares primary GT's GGTT */
> +	if (gt->type == GT_MEDIA) {
> +		gt->ggtt = to_gt(gt->i915)->ggtt;
> +	} else {
> +		gt->ggtt = i915_ggtt_create(gt->i915);
> +		if (IS_ERR(gt->ggtt))
> +			return PTR_ERR(gt->ggtt);
> +	}
>  
> -	return gt->ggtt ? 0 : -ENOMEM;
> +	list_add_tail(&gt->ggtt_link, &gt->ggtt->gt_list);
> +
> +	return 0;
>  }
>  
>  int intel_gt_init_mmio(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index c1d9cd255e06..8d915640914b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -277,6 +277,9 @@ struct intel_gt {
>  	struct kobject *sysfs_defaults;
>  
>  	struct i915_perf_gt perf;
> +
> +	/** link: &ggtt.gt_list */
> +	struct list_head ggtt_link;
>  };
>  
>  struct intel_gt_definition {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 4d75ba4bb41d..d1900fec6cd1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -390,6 +390,9 @@ struct i915_ggtt {
>  	struct mutex error_mutex;
>  	struct drm_mm_node error_capture;
>  	struct drm_mm_node uc_fw;
> +
> +	/** List of GTs mapping this GGTT */
> +	struct list_head gt_list;
>  };
>  
>  struct i915_ppgtt {
> @@ -584,6 +587,7 @@ void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
>  int i915_init_ggtt(struct drm_i915_private *i915);
>  void i915_ggtt_driver_release(struct drm_i915_private *i915);
>  void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
> +struct i915_ggtt *i915_ggtt_create(struct drm_i915_private *i915);
>  
>  static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 69103ae37779..4e1bb3c23c63 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -612,10 +612,6 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>  
>  	i915_perf_init(dev_priv);
>  
> -	ret = intel_gt_assign_ggtt(to_gt(dev_priv));
> -	if (ret)
> -		goto err_perf;
> -
>  	ret = i915_ggtt_probe_hw(dev_priv);
>  	if (ret)
>  		goto err_perf;
> @@ -1316,7 +1312,8 @@ int i915_driver_suspend_switcheroo(struct drm_i915_private *i915,
>  static int i915_drm_resume(struct drm_device *dev)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>  
>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
> @@ -1331,6 +1328,11 @@ static int i915_drm_resume(struct drm_device *dev)
>  		drm_err(&dev_priv->drm, "failed to re-enable GGTT\n");
>  
>  	i915_ggtt_resume(to_gt(dev_priv)->ggtt);
> +
> +	for_each_gt(gt, dev_priv, i)
> +		if (GRAPHICS_VER(gt->i915) >= 8)
> +			setup_private_pat(gt);
> +
>  	/* Must be called after GGTT is resumed. */
>  	intel_dpt_resume(dev_priv);
>  
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 8468ca9885fd..086c4702e1bf 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1143,6 +1143,8 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
>  	for_each_gt(gt, dev_priv, i) {
>  		intel_uc_fetch_firmwares(&gt->uc);
>  		intel_wopcm_init(&gt->wopcm);
> +		if (GRAPHICS_VER(dev_priv) >= 8)
> +			setup_private_pat(gt);
>  	}
>  
>  	ret = i915_init_ggtt(dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index f025ee4fa526..4cfe36b0366b 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -43,16 +43,25 @@ static bool dying_vma(struct i915_vma *vma)
>  	return !kref_read(&vma->obj->base.refcount);
>  }
>  
> -static int ggtt_flush(struct intel_gt *gt)
> +static int ggtt_flush(struct i915_address_space *vm)
>  {
> -	/*
> -	 * Not everything in the GGTT is tracked via vma (otherwise we
> -	 * could evict as required with minimal stalling) so we are forced
> -	 * to idle the GPU and explicitly retire outstanding requests in
> -	 * the hopes that we can then remove contexts and the like only
> -	 * bound by their active reference.
> -	 */
> -	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +	struct intel_gt *gt;
> +	int ret = 0;
> +
> +	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
> +		/*
> +		 * Not everything in the GGTT is tracked via vma (otherwise we
> +		 * could evict as required with minimal stalling) so we are forced
> +		 * to idle the GPU and explicitly retire outstanding requests in
> +		 * the hopes that we can then remove contexts and the like only
> +		 * bound by their active reference.
> +		 */
> +		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
> +		if (ret)
> +			return ret;
> +	}
> +	return ret;
>  }
>  
>  static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
> @@ -149,6 +158,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  	struct drm_mm_node *node;
>  	enum drm_mm_insert_mode mode;
>  	struct i915_vma *active;
> +	struct intel_gt *gt;
>  	int ret;
>  
>  	lockdep_assert_held(&vm->mutex);
> @@ -174,7 +184,14 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  				    min_size, alignment, color,
>  				    start, end, mode);
>  
> -	intel_gt_retire_requests(vm->gt);
> +	if (i915_is_ggtt(vm)) {
> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +			intel_gt_retire_requests(gt);
> +	} else {
> +		intel_gt_retire_requests(vm->gt);
> +	}
>  
>  search_again:
>  	active = NULL;
> @@ -246,7 +263,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>  	if (I915_SELFTEST_ONLY(igt_evict_ctl.fail_if_busy))
>  		return -EBUSY;
>  
> -	ret = ggtt_flush(vm->gt);
> +	ret = ggtt_flush(vm);
>  	if (ret)
>  		return ret;
>  
> @@ -332,7 +349,15 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>  	 * a stray pin (preventing eviction) that can only be resolved by
>  	 * retiring.
>  	 */
> -	intel_gt_retire_requests(vm->gt);
> +	if (i915_is_ggtt(vm)) {
> +		struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> +		struct intel_gt *gt;
> +
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +			intel_gt_retire_requests(gt);
> +	} else {
> +		intel_gt_retire_requests(vm->gt);
> +	}
>  
>  	if (i915_vm_has_cache_coloring(vm)) {
>  		/* Expand search to cover neighbouring guard pages (or lack!) */
> @@ -438,7 +463,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>  	 * switch otherwise is ineffective.
>  	 */
>  	if (i915_is_ggtt(vm)) {
> -		ret = ggtt_flush(vm->gt);
> +		ret = ggtt_flush(vm);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 703fee6b5f75..726705b10637 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1544,6 +1544,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  			   u32 align, unsigned int flags)
>  {
>  	struct i915_address_space *vm = vma->vm;
> +	struct intel_gt *gt;
> +	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
>  	int err;
>  
>  	do {
> @@ -1559,7 +1561,8 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  		}
>  
>  		/* Unlike i915_vma_pin, we don't take no for an answer! */
> -		flush_idle_contexts(vm->gt);
> +		list_for_each_entry(gt, &ggtt->gt_list, ggtt_link)
> +			flush_idle_contexts(gt);
>  		if (mutex_lock_interruptible(&vm->mutex) == 0) {
>  			/*
>  			 * We pass NULL ww here, as we don't want to unbind
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index e5dd82e7e480..2535b9684bd1 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -127,6 +127,8 @@ static void igt_pm_resume(struct drm_i915_private *i915)
>  	 */
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		i915_ggtt_resume(to_gt(i915)->ggtt);
> +		if (GRAPHICS_VER(i915) >= 8)
> +			setup_private_pat(to_gt(i915));
>  		i915_gem_resume(i915);
>  	}
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
