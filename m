Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49BC67BAEF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF03910E38B;
	Wed, 25 Jan 2023 19:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348E10E0FB;
 Wed, 25 Jan 2023 19:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674675821; x=1706211821;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nlTkud9ftC8mUhqnayPwz5OnXD1a7ELQdCRT0sRaom8=;
 b=U9HXEsyGoTd1PWek2CtBs/jaOTfJLMXanzf/WVZiQidXMYOfffgAIGhF
 0bBMfrk5jGftvRdBruf8BHJqOCjTaWahxVCRtFLNW4uIQ3D/q6UfumqlU
 mk5eFPFGQEk/LZqoLvRo46470MMU0Wft21k/MnCHqFTgA8KYKvrMn905M
 w8Ll7bhexuajCIzq2Ke4UKoBftgmzZaK8D3HNGOpMtABN46zOxcHyjvpy
 opc3kUcFFI2KdAgWhbDNxzTVKvF2kg0A1lWKn/AN49ovNgabdAJYT3Yl1
 n0stkVRgS1/4/SrhVIMuPnwWAFsZwLISS3IDYtFxfolVuSJ1prk+pEIFt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="325333593"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="325333593"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 11:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="726009063"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="726009063"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jan 2023 11:43:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 11:43:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 11:43:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 11:43:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 11:43:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fK3kxZKzZaCMDt2G0mNbedmw2bxHhYrZvQqR3R2iLydkW5LVrRg4rbeiDpjFaBFbINwg10OEl+qUukDXcXXRvkbG4NTThI1Ij0CCSHlb4h7U/2O2waQ9jQvxbN5i8fmcAdkFGLjy4+cxlXGanKb9VahphbikdRGTzHFLAXynFrljq6w62YkAamZcnGe/IbI/SSYvxidSVBcZwXkeSrSZHj5h/8RhqSJHZhZlTj0+q4D+C0FOnzcOauStaGlb4Y54InjeA5lIPwqq9/XbtxTikSalLkuvRtd76O/TFKfyRFvQsXY+mp8DaZVs5o0lWcbyoJE4fgUXgyq5c5YDOBSecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE+ezw6d/zUus1IdnPLu8Rv8IOjH+BqaecHxltmFCgc=;
 b=I14/Brp8EkmlUnMqkGeaf/sTTF50Im5BfU1y4hW796N2j+ang6lY5wjjGjnHRu3Xc1FbA8lht9MdX3Gj/xGF4738vvi7aClJbm/kbRkpPYl3gzGjTho7lEc4JVBucIz1Bg/JtlCrl5fPtSjtYxhExcbbuXn09jD3+JkCD2Tdo3gybhD1eS/bMLn3lXH7ZuXSt/cwebtXwY6Bej/JmpWyDhlhUDyIzcHLFzyJXe+aDPWBuF7/4C5Ml6Q8ygAQ4Gbf8umyyKquj0N+MACfW788CGA1s7KNNNJ/gldDx7WkbBz6uhhZLM/LbdcrFT8ci/VIDrCW/OnZrlAy1s9YqciOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH0PR11MB5016.namprd11.prod.outlook.com (2603:10b6:510:32::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:43:35 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6043.021; Wed, 25 Jan 2023
 19:43:35 +0000
Date: Wed, 25 Jan 2023 16:43:29 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/i915/xehp: GAM registers don't need to be
 re-applied on engine resets
Message-ID: <20230125194329.ekbjjywhtlt573op@gjsousa-mobl2>
References: <20230125011407.2821808-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230125011407.2821808-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH0PR11MB5016:EE_
X-MS-Office365-Filtering-Correlation-Id: 129938af-8ab2-4dc6-61a7-08daff0c72ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqi9PiSiOKs1V55c7DzKFUNmP35fjMtklrTrt0iRlCsdeEty1JvGPceG+bY3O8MxqFypes2X3Z3JfVDjz1a3kbADvbWQDfUsq6bC1LV5JbUtMcvQRJc4fHp99HMGWtPT4Z48AtIHUtmmiaBvUdC62G6bkGQ7mzqmoeDC9LyDZvd7LwTJZNVowDDGWekSS+TR1avYlwaWKMNSzPKlJGkVo+8aIG/4WYZKjNeoyX+KfMl8sQF6VQBXH5sU4LPLNuOnWkXg5zoEmxqgOX1mmHOs1b95bc0gJ7HiQAQf5W3TcOL8+TgFWRlf4t7VoWbrSUfSuVyJkzbWpVQU9z3Kfj3MtaRjVHMWJsjphb/U1wOTERjHW6vWE0MjCu5G4R1Ds+wHhwOKPGo0h2krd716Q51G3H90CbU0V0t3be7MixqZqYWWXQVvb3T3aLwhD5DH0A7kvDwOPjAlo9f9yPDsENdQdpbgqxZctEfjwQjBt6yco8Cy+rLdvDFIQKQzLosaDhjGqX2jufAGc4ef7hC9/BIet8nOcCfap4oEYANH1imeRtUUXRPfjySuben/icc69uokQ75gCePPUq35+4N2JFutQPBFf7wrC/VO+mZbErdPVXT/DCpcEMrkKjNEYtc2AOh7pFhm5pDyDzbkfjNU5eDq0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199018)(66476007)(66556008)(4326008)(8676002)(450100002)(316002)(26005)(6512007)(41300700001)(8936002)(1076003)(38100700002)(44832011)(5660300002)(82960400001)(6486002)(2906002)(6506007)(9686003)(478600001)(86362001)(6666004)(83380400001)(66946007)(66574015)(33716001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rWiXUQjIk/3GcSOo8hEoCOZ/xrBK8j51XEaX8tlmxr3KNz1y8fcSoQOAeUKt?=
 =?us-ascii?Q?Dg4E+qKYlRgLfswpqB3ML6VETuT3tLopPQnRAPAkXS0d5CwyGtaW4s5ZlH6N?=
 =?us-ascii?Q?8LAO+UjUOHz5yfBMzOAHCROg2oavJa5x8Uf0GfMbxnWJEccgLT2k5I+M8bjw?=
 =?us-ascii?Q?fq3gRNgfZdEelQc1z9LlHrdgJIcMJ4ZRLr6YtUQWa8asCPDOwJohPD1yH7BO?=
 =?us-ascii?Q?pgmXXBcxfTAGC8IcuMYFfGf95N3kv8DCkbQ4qQDmzZmJyyur+PO2yAAxSHUG?=
 =?us-ascii?Q?lHcxWYIsMGeSIlmUADKMo4Qahxw3GxbPVF9s0ySwUi3/bMlsAwMAfYH3qrET?=
 =?us-ascii?Q?x4rYPqL/n/EMn4jVI2KvpMsRiCgF6DTmQZIAq0e5zSXFVqJSW6+qJRgqsyIy?=
 =?us-ascii?Q?wN1kBebCwoagD+y/wpYmTvQ3CInN1S+MJ9gfrL2nLZGzgVsaXn+Q10AAlvpu?=
 =?us-ascii?Q?rIOfWlnwrh9JbgNqF/ofcI4JPOUjATspamtNY44U9YbQCO93hyvF7/qUVk+p?=
 =?us-ascii?Q?Q1SkGbchJbZQk3CgZOJT6HhnqQFIBRAIUzli9OsmnM0sFfXa561fZeSftiau?=
 =?us-ascii?Q?PuJklmbkZ7PSW1rxm9SAexrWJSP1DinjpIJGGyur2uwkYmUmTyF2840aOy9h?=
 =?us-ascii?Q?8y5pReFp7KGjlOHkY8BA1YYvc19RZsYpFmq/jPAagQqYHaA4xGXHiA3E2/YB?=
 =?us-ascii?Q?LtSd81CEPc/kZEuueZUoJWb+hX/4Zy50nf8oN2Bm6IX1xCH+mkzYlWlthcux?=
 =?us-ascii?Q?PH3t+eTYpBAbYdfMC01W+IRDET5nPvjvgU+KfqTKuG3n3QLfnGczb1BXh3AJ?=
 =?us-ascii?Q?RYXFOVYn5MDYZUw/118isO3l7oBgUY4l7817WfLtbAy/KnNM9+k/Gkja8fdY?=
 =?us-ascii?Q?BPhlAqCXqO8z7Ot8ffOCLWywgmM7YMTdGLdQeNGe6gSof+0yHWLGJxqG2leC?=
 =?us-ascii?Q?zIQy2ejoyOAzriQa8RYp74kxCa9n8GcIkvGih7SONByMZWEztp30im/tC7LK?=
 =?us-ascii?Q?eFHl+7EpZXhwKO+Yx9lxO3YAk9M2q89+fDktC5R0fCEsTodmUSqTocX1eOFA?=
 =?us-ascii?Q?gwSVybKZIQ630Bk8gn3FI/n5OD2v/Z7V3jmy3OlGu463FY9jT9DEhtEBCCQf?=
 =?us-ascii?Q?NupzY8m5h2gOt3AHFBD2F0maZL6tUEVTDX4I4Y2pAUkLOC9hTijUQOQ+jpUx?=
 =?us-ascii?Q?1gj+d19OETz/lV2U+/gKMIVZM16f2+JX32apDmxaiKKnM8GdThiBrtN1Ej0C?=
 =?us-ascii?Q?GFoVJ7ybIWrNN5SRlZbjxsjxVSveGY9cOW2fyuVESZQjXhcK7stwc0Rc0oOK?=
 =?us-ascii?Q?MMTA8pVawRoZ3VoKyxSsg38oEbXbLOPwG9IO2L7cFvNmv3LuzjA9m/yoTqBe?=
 =?us-ascii?Q?pYtpVyF9FVHx/jDGfsuOQL0ClPsGyXR663tgAxl0f77fWEFq04sNuFfxuKrN?=
 =?us-ascii?Q?A/hihqUpN+XgTrmYYrkZlt7G2EnWG+GFSMjd39YVgCbpZ8/nlPYjD/bQdK7M?=
 =?us-ascii?Q?ySe0HjbDA3boiv3Tac7HeZ0aFV4Kmgp5ySih+u7W0ka7iv38RUk25tzLueMu?=
 =?us-ascii?Q?ndp4v3O+yD+T04TgtLEcJ0A1UvfFSQ3U8WbEAia7/sas/olQRB2ZGeO/V7Jp?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 129938af-8ab2-4dc6-61a7-08daff0c72ad
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:43:35.7345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMuQDtcKvQbE62ZEeBiyQcCfOSUMBt822+Qw6o9q0SY0fO3b+8k3A4Ab2MrGF3l+DTBRbaE2Li+ygh1/45CVhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5016
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

On Tue, Jan 24, 2023 at 05:14:06PM -0800, Matt Roper wrote:
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
> While moving these GAM-related workarounds to the various platforms' GT
> workaround functions, we should also take care to handle Wa_18018781329
> properly for MTL's two GTs --- the render/compute setting should be set
> on the primary GT where those engines reside, and the vd/ve/gsc setting
> should be set on the media GT.  Previously the VD/VE/GSC setting was not
> being properly applied.
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Fixes: edf176f48d87 ("drm/i915/dg2: Move misplaced 'ctx' & 'gt' wa's to engine wa list")
> Fixes: b2006061ae28 ("drm/i915/xehpsdv: Move render/compute engine reset domains related workarounds")
> Fixes: 41bb543f5598 ("drm/i915/mtl: Add initial gt workarounds")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 88 +++++++++++++--------
>  drivers/gpu/drm/i915/i915_drv.h             |  4 +
>  3 files changed, 59 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 2727645864db..4a37d048b512 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1100,6 +1100,7 @@
>  #define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
>  #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
>  #define COMP_MOD_CTRL				MCR_REG(0xcf30)
> +#define GSC_MOD_CTRL				MCR_REG(0xcf30)	/* media GT only */
>  #define VDBX_MOD_CTRL				MCR_REG(0xcf34)
>  #define VEBX_MOD_CTRL				MCR_REG(0xcf38)
>  #define   FORCE_MISS_FTLB			REG_BIT(3)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 4efc1a532982..0e7f64bb2860 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1559,6 +1559,19 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  
>  	/* Wa_14011060649:xehpsdv */
>  	wa_14011060649(gt, wal);
> +
> +	/* Wa_18018781329 */
> +	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);

Maybe worth mentioning in the commit message that Wa_18018781329 is being
extended to XEHPSDV in this patch? This could also be on its own patch.

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
> @@ -1599,6 +1612,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
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
> @@ -1644,6 +1663,12 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
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
> @@ -1658,6 +1683,16 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
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
> @@ -1667,16 +1702,27 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
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
> +	}
> +
>  	/*
>  	 * Unlike older platforms, we no longer setup implicit steering here;
>  	 * all MCR accesses are explicitly steered.
> @@ -1687,7 +1733,12 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  static void
>  xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
> -	/* FIXME: Actual workarounds will be added in future patch(es) */
> +	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0)) {
> +		/* Wa_18018781329 */
> +		wa_mcr_write_or(wal, GSC_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);

By looking at the spec, I under the assumption that GAM registers in MTL Media
are not multicast. Am I wrong?

> +	}
>  
>  	debug_dump_steering(gt);
>  }
> @@ -2351,12 +2402,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
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
> @@ -2416,18 +2461,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
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
> @@ -2990,12 +3023,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
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
> @@ -3062,13 +3089,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
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
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 2a6e212f8824..e90baa28a308 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -696,6 +696,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  	(IS_METEORLAKE(__i915) && \
>  	 IS_DISPLAY_STEP(__i915, since, until))
>  
> +#define IS_MTL_MEDIA_STEP(__i915, since, until) \
> +	(IS_METEORLAKE(__i915) && \
> +	 IS_MEDIA_STEP(__i915, since, until))
> +
>  /*
>   * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
>   * create three variants (G10, G11, and G12) which each have distinct
> -- 
> 2.39.0
> 
