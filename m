Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA767CC0B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95EE10E8EA;
	Thu, 26 Jan 2023 13:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEC110E8EA;
 Thu, 26 Jan 2023 13:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674739632; x=1706275632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jrgUsU/O1R3hgBYjaT/NMSgCwu0h2gamWe/eMhRrHWI=;
 b=cq31VyquvNxk8jjzT47jB1oHvFR8pKmEpsnNtf9uILfnoFNWBKJ7H+7M
 MsrCDtirie7tYhaNKsZEOVmbCqgluQQlskNaJJeHSMYixZeGy4on1QDgd
 oz96uJi6uOC6tva/BpnX6+6XRnwthmhCuvPWA5qVyqkcFrfuuUaOdxKzx
 FLYBxx75V6Yk3pv5ey5AvFbDyLZzIunAb+7d7j86g5TDAwvLz2SuW1ITM
 eUHd3pI1NF8BntrqZ8RrnJxMs3PvXQG+xVHop69R3rxUbbnGgiTx03bQy
 c65SX8ClRimw44pSBeicx+Ry2pdDloVA6O1VrO+lCf3i1FKLyxTuL2G58 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="328058661"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="328058661"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 05:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="731401896"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="731401896"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2023 05:27:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 05:27:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 05:27:08 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 05:27:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/L9IbGdQIA+2Q+afw/BHKlYgF1iNBtlcElU0fu5WGAXW/Cfm4racEB3VVeod1obLpev6J7xpiBaPJHaJ9NcSAskddCWjHHzNgK4VtEEXn9cNppP05TWUUN+MR6xj1zB2/caNOKm1qXCYPlki8bgV/e10KI6Pyo+ZJRgQIWhB4L5EN3CRFfuc5Pl69oqLfABCV5WYSJ5vwBHDJLxHGxoncWQw/vz/OCDmZqNBDrwGp9jgm6DQDsKyUn7+9GCPmPd1p0kYTdAjkg72WzZDpSHgagH8vz/rhx0Fk41LxHI7gjF6iLfuw3c1lCEV5ZgGZt0enWYIcF7rThKhe1EFrweNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9KTVUDueNTLf5cCGqqDEgQfsmf+opj7Fl4m+5N4HUk=;
 b=AMDktmMZnjBNxdCuNrmibqH+6qq51Bp44YvuE0NLLE3sppoO8iLQu4taxED+SJ5BbkJA1h//OTMziCioJsxYdZZTtkfSANCsL51oRg7cIWd5uS6Ar1kqGFlvQbHc9QzA0N3TPzLjPDol0i0W+C1VR+phZx45Z03TJyxzx6GcarDNvWt4nxxMbZheoxWFe1MO64lHskkRlNZ0JYPzGOmpvrDCvKiXX5xSnoD3nglXL2YDAT8eHtTl3AS0PD0trmN2LDPV389KtxoE4VHkkJ3QQQ4tjkiEfjlOTBvVswkmTEBTqJNvu8DKAQKZPFPZYokbbZzayO129EHw1tsXo06k/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by MW5PR11MB5761.namprd11.prod.outlook.com (2603:10b6:303:195::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 13:27:06 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 13:27:06 +0000
Date: Thu, 26 Jan 2023 10:27:00 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/i915/xehp: GAM registers don't need to be
 re-applied on engine resets
Message-ID: <20230126132700.prxz3bszhxhyz5sc@gjsousa-mobl2>
References: <20230125234159.3015385-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230125234159.3015385-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR07CA0094.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::35) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|MW5PR11MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 35454d16-8d42-4157-a949-08daffa104bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UD+qJo/bDxQ0MRLd3/UBrzKS+PQ6n8pbtGB4DOydBoToRC8ufUnhk9gjhvHES9Oa3n3tCURwJaRpV5WHPWnzXH1Fqk+jHHq1xZM0ZZuDIfPihdtlqAKtQ9yXU23J2R/CJy6pGMQs4iQ72omsYr4PwJW5p+IdLVnLEfEukUeNfOwOvvJQRvBR9HI2niu33uuB/yrh1rjt7FCf28Q0nMtqoVfvGQz7XrCa09vNoU5mAQlXt/9kkKwX92MecwgiSUSa1HEg4Sb89W/6A5P/ihNFEA0uc5BsV02XKFf5I8epN01E1lKqz8JtDz+j2M1NHsEzxdlFk/tY+szQvZN1jLdCnFpLJpJo63tgPvItXPWkEAs1g99z95AZvBPf3w2HUnjoSy2DOi3CahBXVXfxKixYm5fKyx0Xc6J7szzxpZvT1ss1NZLDhktEFC6kMF+zWfrRkF2KsM0EPHpsJZRSlMzFFfsogYKE3vI5v3/Mah8vd7fS47Yp7Rxo3qZK9zcQsdntZU7V1NjWDomSfyeDE/6go381NfvgO3kq2rGu6IgP2+40y1OhJMp+mycNLIZ3clvLCplpDD+RE9lT1CLlhjA7jC5ojZoYWAJrvq6DNdI6vU5RYlYK8DWng5AA9osiP3mLB8Ra/TCW4FxHmt3RwUPocKXdv3JhlYYFuG68nbhXh6m4m1gM4ctBfwvE/BuSroci
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199018)(33716001)(1076003)(38100700002)(2906002)(44832011)(316002)(478600001)(6486002)(8936002)(41300700001)(86362001)(83380400001)(6512007)(186003)(26005)(6666004)(9686003)(6506007)(66574015)(450100002)(82960400001)(4326008)(5660300002)(8676002)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3xnfI4yXS+8ghOWdvX4P/9l/II1NHHarDARZTrYqFn5GOeZmP3gM7gSii/Ci?=
 =?us-ascii?Q?WbyV4IKHL9Tzgc3t2Oa2l2X036+JSyWMUjvdlYVyy4e6GdHAmbdJ4iVmlTq9?=
 =?us-ascii?Q?qAmlvJFW7J4bkwH9NMnTTlgsg8bP3fE5V3FQKK3HkMcAgAXiN5FCi5TKdkhN?=
 =?us-ascii?Q?ngUtadLKIFBXaBvd+hJj6Xzg7TgwH2YCK2kjjO4926RmolPy4YkE8PEC63sn?=
 =?us-ascii?Q?BzP/n15QFQNyzTYMyaHjesj+lKza8oO8ftuCC6/9sSpzEdTgKTxORcwrhULO?=
 =?us-ascii?Q?2wol+pBYOmz8UlLsaKxVF2Vjy9yCYifyCNptVdFIDxiu+k2EZuDfyHAhHuM2?=
 =?us-ascii?Q?07ES+kyEfREPi1ODg9Q4uC3AbQkkyC9wZPwVzt7IdZ9dkz7j6PTo+GE689Cm?=
 =?us-ascii?Q?wzlxmLCQqcM+Sx9my0t1jZSR0J/vvV/lr17/ytT/wAUOcNfPfXql/l40aqFj?=
 =?us-ascii?Q?EN5Juc4HxocjN1/gazYhHDmiYT41xXwkqE8wyoGgDI8wGNhNRkxEg0GWbcub?=
 =?us-ascii?Q?QrJzzGYkHOOAEs5wQTXg9qBL1jW/yRhpApd3RXgXF13EhYemrYR0tK3b5eef?=
 =?us-ascii?Q?nJ+ZT+Ft3/CFyq5/47/cKSct9TRc3EwZ95cLFv0bEXv/s6zYwB/t7ARARNxN?=
 =?us-ascii?Q?mm7kHhFkztKLVj3bqAXJe2u5S3ps7FctwLvrHQXH9NfgVI5eW378ph4Z+wBh?=
 =?us-ascii?Q?flwWe+vTbptAoSv2wfkDl0UH0hfOBme0eCsYmRJdIj6JD28ABdhOWDT/hS4q?=
 =?us-ascii?Q?5O0r4MwUz58WgWxax+2BG77tDoJVTjOu9d1dgxVLEvmHx9NxTxdMc80TAACf?=
 =?us-ascii?Q?z6kx+2h3apQgCoLQ5PGVAk1oekl0pI6yX/MhAjt5GZ95+UZTJgvoxX1z6ZW9?=
 =?us-ascii?Q?pG+Q0RXHvGIUJ2SisCrwCvii+vcdrr4b59GnH4sUKRAS4c9mZFobZq2Vm58e?=
 =?us-ascii?Q?BhWxQoLPQWCskIgl4w5OWaLTIfLOBb7y/tYhTg4fLxLRV9j12isSqN0VBGww?=
 =?us-ascii?Q?BYtBfqG80z04Z6I+tlKDvdSlolbzhDgTmCwhC8KHOBpsUBziWzUy2EIziQvT?=
 =?us-ascii?Q?brPA/k4mTVbUzPwJlsiN6hO6fjApoqlcuVPzP/rhlFgC0Vhlv1rAU6FQfDrX?=
 =?us-ascii?Q?ilUGWOVnWrjapkUNjdGJs+2yj/O6ApEqbycn1/BlYHeHkaFooRuGVkUNOGZI?=
 =?us-ascii?Q?3+jh9En4kdS26dw5Ns6TsjZXDYjTX0Go2SqzE0xYkiX/MVkjxd+FbaZnNQKi?=
 =?us-ascii?Q?xkTqL46YkUw0UMXGXuexZTsPrVExHgeqJZvtSYoM78FFoBZ0NUrwhndoT13/?=
 =?us-ascii?Q?1SmIX3ShuJF/lRzz//qlz17HBcGEpIKzAd7alpJ4Bh0kwhrO07hJVbYQmFP8?=
 =?us-ascii?Q?/4Va78V214TmyZY0xZCXOaIDFL3EnUZ37MKP7nW0eBQPTTI6IqWUVuBESoPK?=
 =?us-ascii?Q?zas+YePMv564vqoP//fdl2yMaeFm+rU4pHuOs4729MRh1v2d0bAFa826M2Hj?=
 =?us-ascii?Q?z6scI1JcuuKYWvnt+3ag7F8Tt0JbQbdCvO9RL4uNP8u3jiVQaS7EDDSmQcb3?=
 =?us-ascii?Q?/5VQ9xpY4gfONW5mr0Woxo+pQzGh1Ulcm215AD90ugNNUeg5o6RBjrwZvQNa?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35454d16-8d42-4157-a949-08daffa104bc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 13:27:06.4699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxGBPmz40+pyB7/iRCU14E99e9jTVLsWaSvobfOcRSs53BrsD6E5/UfCghqdlVc+MXMQNhLeSJAfPEo55r+Tww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5761
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

On Wed, Jan 25, 2023 at 03:41:57PM -0800, Matt Roper wrote:
> Register reset characteristics (i.e., whether the register maintains or
> loses its value on engine reset) is an important factor that determines
> which wa_list we want to add workarounds to.  We recently found out that
> the bspec documentation for the Xe_HP's "GAM" registers in the 0xC800 -
> 0xCFFF range was misleading; these registers do not actually lose their
> value on engine resets as the documentation implied.  This means there's
> no need to re-apply workarounds touching these registers after a reset,
> and the corresponding workarounds should be moved from the 'engine'
> lists back to the 'gt' list.
> 
> v2:
>  - Don't add Wa_18018781329 to xehpsdv; the original condition didn't
>    include that platform.  (Gustavo)
>  - Move the MTL code to the GT function as-is for now; we'll take care
>    of the additional fixes needed in a follow-up patch.
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Fixes: edf176f48d87 ("drm/i915/dg2: Move misplaced 'ctx' & 'gt' wa's to engine wa list")
> Fixes: b2006061ae28 ("drm/i915/xehpsdv: Move render/compute engine reset domains related workarounds")
> Fixes: 41bb543f5598 ("drm/i915/mtl: Add initial gt workarounds")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 77 ++++++++++++---------
>  1 file changed, 44 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 4efc1a532982..9db60078460a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1559,6 +1559,13 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  
>  	/* Wa_14011060649:xehpsdv */
>  	wa_14011060649(gt, wal);
> +
> +	/* Wa_14012362059:xehpsdv */
> +	wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> +
> +	/* Wa_14014368820:xehpsdv */
> +	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> +		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
>  }
>  
>  static void
> @@ -1599,6 +1606,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  				DSS_ROUTER_CLKGATE_DIS);
>  	}
>  
> +	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0) ||
> +	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_B0)) {
> +		/* Wa_14012362059:dg2 */
> +		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> +	}
> +
>  	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0)) {
>  		/* Wa_14010948348:dg2_g10 */
>  		wa_write_or(wal, UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS);
> @@ -1644,6 +1657,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  
>  		/* Wa_14011028019:dg2_g10 */
>  		wa_mcr_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
> +
> +		/* Wa_14010680813:dg2_g10 */
> +		wa_write_or(wal, GEN12_GAMSTLB_CTRL,
> +			    CONTROL_BLOCK_CLKGATE_DIS |
> +			    EGRESS_BLOCK_CLKGATE_DIS |
> +			    TAG_BLOCK_CLKGATE_DIS);
>  	}
>  
>  	/* Wa_14014830051:dg2 */
> @@ -1658,6 +1677,16 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  
>  	/* Wa_14015795083 */
>  	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> +
> +	/* Wa_18018781329 */
> +	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> +
> +	/* Wa_1509235366:dg2 */
> +	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> +		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
>  }
>  
>  static void
> @@ -1667,16 +1696,29 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  
>  	/* Wa_14015795083 */
>  	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> +
> +	/* Wa_18018781329 */
> +	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
>  }
>  
>  static void
>  xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
> -	/* Wa_14014830051 */
>  	if (IS_MTL_GRAPHICS_STEP(gt->i915, M, STEP_A0, STEP_B0) ||
> -	    IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0))
> +	    IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0)) {
> +		/* Wa_14014830051 */
>  		wa_mcr_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
>  
> +		/* Wa_18018781329 */
> +		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	}
> +
>  	/*
>  	 * Unlike older platforms, we no longer setup implicit steering here;
>  	 * all MCR accesses are explicitly steered.
> @@ -2351,12 +2393,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  				 GEN12_DISABLE_READ_SUPPRESSION);
>  	}
>  
> -	if (IS_DG2(i915)) {
> -		/* Wa_1509235366:dg2 */
> -		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> -			    GLOBAL_INVALIDATION_MODE);
> -	}
> -
>  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
>  		/* Wa_14013392000:dg2_g11 */
>  		wa_mcr_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
> @@ -2416,18 +2452,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  		wa_mcr_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
>  				 DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA);
>  
> -	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
> -		/* Wa_14010680813:dg2_g10 */
> -		wa_write_or(wal, GEN12_GAMSTLB_CTRL, CONTROL_BLOCK_CLKGATE_DIS |
> -			    EGRESS_BLOCK_CLKGATE_DIS | TAG_BLOCK_CLKGATE_DIS);
> -	}
> -
> -	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
> -	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
> -		/* Wa_14012362059:dg2 */
> -		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> -	}
> -
>  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_B0, STEP_FOREVER) ||
>  	    IS_DG2_G10(i915)) {
>  		/* Wa_22014600077:dg2 */
> @@ -2990,12 +3014,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  	    IS_MTL_GRAPHICS_STEP(i915, P, STEP_A0, STEP_B0) ||
>  	    IS_PONTEVECCHIO(i915) ||
>  	    IS_DG2(i915)) {
> -		/* Wa_18018781329 */
> -		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> -
>  		/* Wa_22014226127 */
>  		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
>  	}
> @@ -3062,13 +3080,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  			wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
>  			wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
>  		}
> -
> -		/* Wa_14012362059:xehpsdv */
> -		wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> -
> -		/* Wa_14014368820:xehpsdv */
> -		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> -				GLOBAL_INVALIDATION_MODE);
>  	}
>  
>  	if (IS_DG2(i915) || IS_PONTEVECCHIO(i915)) {
> -- 
> 2.39.1
> 
