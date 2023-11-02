Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80F7DFBC1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 21:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA96E10E37E;
	Thu,  2 Nov 2023 20:56:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CB910E37B;
 Thu,  2 Nov 2023 20:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698958562; x=1730494562;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=taxJAa40qJEatIZMna6o9A39YvEr+m5gfkPoUpYMCVA=;
 b=Wd+5UA/1S2N2FNKnUCTYlBP383fl3R07mNDrqmpMQP2SKwpMjhyFQBFl
 vJpcxz39Ozc1Bw79mFVyyz9aFQHkfU3M5l31Ow3vm/vZEO155GToOHQeN
 /Bw//FXp55R1VdSX9pQbDKfR1n8wwL3pgFUc58c8reiYTOk3ziNq8fSzo
 +4Aw/bP0zM8lhxZMTJvVevQQHthG+ndCFggt6DiP8iBq92JHmuEESpgyX
 3mdouowqaJsrXnH0XPSXQySsQ0KHbU2FuiEwsIgBDznGGDQEi5tasv82g
 bwXl49NosYQWqqNAHwzmcw8DZy2tkFWS07J7j9Us8VphAWro/p2MY/nH5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="475054931"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="475054931"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 13:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="885000892"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="885000892"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 13:56:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 13:56:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 13:56:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 13:55:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idz7gNZdChsZuI0VynEPp0LZtIELW6k5SbV1PCemGaRd7w0nC9sP4Q4p8YnCvVfPsgx0WGJ2IB4iLSP1/GUpIvlWvlnpJw9VwQ48bg8xeTpzLCsqAiTVjHbm+rlM1OOI/SI+TsDANbNPVHiTprQSIJqUIu781GqiiGV3uvLPzfVLm10jGvvUxf6XkiUyYWPqyglLCLABjm/6cNKbSL5kdpkYf9dMTqdPm1iN6/DbtEx/Y9VY2DQc5pp23sh0VaCebftp2hVEP6obM4M1+ZQOSQl2+hPLCvz71Ywi2+VOiN4mBqS3PThy6yp8g9RaQhaKXn2PAmHyNqj1R/kIh5xuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibmUqzrSus+PfKtY7GAqXzmz9xwmOgWT9gmGvtmzA1E=;
 b=JbzxTXVxZZk/kXcLvwDsesqdDfBnIWQgGP6isBebr5jZBKQMPThUoHZ3/lEUXwFkGmre407Y2MlHEG6/zL6VFyhwG4FX1/yFPJOIUTem2BrJm0NJY5A94uUXZtdehhDUAZNhvSBtpSdunx3O5GpBPM32tE3hTQv3gjlpCG91W+SII2MgZolWgX71H8e5soJCD3TwwsbOSYfe/zNLjHuFiU1o74CUdwnn33Rk37WsunqexncvhiWWSjx+wk5xCUHzkfFHM94OrIOjqt2YEpOLT3uJNYs9KXPLU0+9d8FDpl0I/yGcjxbz1tHsJZryn8H6+z/CFHvYAUKRaOGtIEa55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Thu, 2 Nov
 2023 20:55:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6933.026; Thu, 2 Nov 2023
 20:55:49 +0000
Date: Thu, 2 Nov 2023 16:55:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [PATCH v2 4/4] drm/i915/mtl: Add module parameter override for
 Wa_16019325821/Wa_14019159160
Message-ID: <ZUQM0aBad0YKK9SL@intel.com>
References: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
 <20231027211814.2696398-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231027211814.2696398-5-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: a823626a-2cd8-4020-4c91-08dbdbe617d6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+PQo2Mj2x1JhZcyeHsMF80jmIc84O27squYlgZM9OPfKK9+gg+Jd7xIXEJXS/mQSJ6F6bOciL8XY7inE5ut6GEX5d8ealuqiaID83+gxy4+YNXUhsCqhoAUJjZH94dGZPLnVqfS3zBAJRrW3KchwfJYCYlHxo8O9MQ1wN1alBMflo/x/tapyJ6BBrLuWiq2NpITA6uKlCWY+UrZf7Q5l+aRL2YkCArbCtRVmy6Ep2jVxMsfiNaDNaYB0KJFw5sS4F/9P/CPZr4WPDyQ/KVGEgLINCV8Y7Gesvy+ozRsS2hinZB+M9ul4Lk9BUqhwz85U9vPBPw+yCQdWD83zUKKdNC01lq1zByWytPUzZRRu7EL700V6Ls/rFzij6DfQXbkz3zW2uJu8EIGKJisrC6YgFHmuky02Iupv2LGEiIYhlwENrYubXsvYaZJjC+AYf21QU75OfhPC2tOAkm5InExzhaxJUCegySK4o9KMcUCYHtFaK31v7jsHZQJFTUNUlKqT9SC0ygDuTVAZl0YdwaDBhUooccTXNgVLSfYFWpngHcbVervtaAS033a/YwSCsJh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(66476007)(6666004)(6636002)(66556008)(66946007)(37006003)(82960400001)(316002)(54906003)(6512007)(6486002)(478600001)(83380400001)(6506007)(26005)(2616005)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(34206002)(44832011)(36756003)(38100700002)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/hnCfaw/ZdEhnahSXVYnw+HUqP33fiGK/74AlI4NkoUybJu/dGuR1hj8VIg2?=
 =?us-ascii?Q?7hwNSQP/GSogojcoxN89/gqRnX8hzh6x5JMcQG6FM6tQ9jaMCZHtjLoNWoO6?=
 =?us-ascii?Q?ugnKW9HCSQcpioD4c3LQfbujEFmJUI9wQgt833VNNoDBVQnGPja6J8mkwNt/?=
 =?us-ascii?Q?1SHYYU8yAjyo9x/kkrPDXxGBsmiOcfAbTj2rZkUz/Fgx565nfDhKuNH4uqj2?=
 =?us-ascii?Q?/FSzhBTQ7ReZxQTWZOeK1SiJ0PFberFA0Kl6xjbAd61PqUNtlzBcTQz4jzEV?=
 =?us-ascii?Q?FPF4b3MkClUNc2j1vFCHDuj5UunyO/5M414i/SVWpmxh5+KtI0tEn7Ou6xPy?=
 =?us-ascii?Q?h7+CX0CTtJg2zyFaSxyWvM7wavKD9urp00ufv+C2hWq1jNGOmptIYNVWtqD2?=
 =?us-ascii?Q?QlvJxdYu4foSC0/psKBqVj0HVMIbZoEjldFWB7mRciFYfx9CNnV9srvfCY0E?=
 =?us-ascii?Q?sbbZ+pJA/lajkf/bGd1ng+Qq6/mBwHuOj5+l46h/oshJCORUrIav6LinbH2J?=
 =?us-ascii?Q?yMQA8E35rm96wFfRTddTZIAu/F4lWeZZ9x4B/tkhHznJd9mXn5QJHZY74pJR?=
 =?us-ascii?Q?7pTdAg/2L+V+OWqqr3PlU4IcfKdLIzrJrqk/iJZmhXFPI0R6FqBHCVjH4c8n?=
 =?us-ascii?Q?Q60X4B4ndn8IPECFo2a6gZv+PybRLcVo4U3Ij+Pt+sy9HePY2xhuqMSdPEnP?=
 =?us-ascii?Q?aa4/DBXtKwOjctcvKA8WQXVAQaLQBR+bQ+DYD1B7gvpOveVHlppslom7ZIq6?=
 =?us-ascii?Q?7DrS5HSDe5AMDIOGk77XB6ekqeF29f1HrRdhsAIO4dmHhAY3yqBbH0fEN8vy?=
 =?us-ascii?Q?S7aQ29L9sSUwOCpy+e/1hFTohZAlg1WpfWi7+wXmA2VUFYqN+VMPYWQx8fl1?=
 =?us-ascii?Q?9fZJUVRZ4fJJ/aFqEmvdFoCAdqLUdtDJCaqg+TDREIGps4W2hGGZSdtcaN0r?=
 =?us-ascii?Q?EO7RR5MAsPc+BcCU+/ppBBWjz24Qh4JCOF57cOcYjWl3973NXV334BWJQPzf?=
 =?us-ascii?Q?IK17v3ceK80Zo8QtuXsRKe2MUZKtNyPtBKrUXDY953EWaASi5bYCCy9cI90D?=
 =?us-ascii?Q?q7/abkAFqlwmnWEOSIZLjF+5H+c6wKZPKo4wpe+sfHPWo+bRIvsNBQNYZEl9?=
 =?us-ascii?Q?tQBy7mVIXWw4QMaRMdyBchRoqr3NmcdP/GIOdrDbYsSgi2VF7Ie5llNknot4?=
 =?us-ascii?Q?0pCv34TEoZ/9n+xSspB08Os1t3Wnh5b60+C5xu0xEaaG2udhkPaO2+Ny3RRc?=
 =?us-ascii?Q?/ufmcPl4mZmDlgtPDNtjPYftb2M7bWSToavAywMWpQ1ILxlGbwT34IzQ7h5A?=
 =?us-ascii?Q?i7lXAS88gHBwlFXH05gtB+C6cohvNT8hqXfR7DtYu0zlFyztijCcpSEIMGFa?=
 =?us-ascii?Q?JTT2dFq59zN/SG5Q2ljhbQ/V5eTORAHdfRUva6W/0/+kn/dDNxMfEWhA0EI6?=
 =?us-ascii?Q?BsctmPmeZUlp8uA2aBpMmpi4tGA4mXwiD1h2s/ahnvsTc79OEtuIF/Nrsz9X?=
 =?us-ascii?Q?R2QiDJRhiQVFtoLOLEhfyBaVIXiA8ulSNt/lEEKQwzizOgWraMLzBeUjtBo1?=
 =?us-ascii?Q?aJL83CEGTsUWEEN0jSGLFaoBJKgOF845dO9Q+HLb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a823626a-2cd8-4020-4c91-08dbdbe617d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 20:55:49.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6wAZcbiozjfkYpWspO4/Nkihe5BDoicSedefNUOC24hte/QJAKXq9jHRjsJ/QewJKWXES5dSBkGAWHyfxYVdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 02:18:14PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> These w/a's can have signficant performance implications for any
> workload which uses both RCS and CCS. On the other hand, the hang
> itself is only seen in one or two very specific workloads. So add a
> module parameter to control whether the w/a's are enabled or not and
> default to not.

No, we are not adding a module parameter for a hardware workaround.

we need data to decide what's the impact and decide if we will live
the workaround enabled or disabled and we are not allowing toggle.

we also need to push back on hardware teams to continue pursuing
better and more feasible workaround.

or we need to disable the feature itself. But no module parameter
for hardware workarounds.

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c            | 3 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c        | 3 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
>  drivers/gpu/drm/i915/i915_params.c                | 3 +++
>  drivers/gpu/drm/i915/i915_params.h                | 1 +
>  5 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 6252f32d67011..4c89983b1e907 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -296,7 +296,8 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>  
>  	/* Wa_16019325821 */
>  	/* Wa_14019159160 */
> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
> +	if (gt->i915->params.enable_mtl_rcs_ccs_wa &&
> +	    IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
>  		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
>  
>  	/*
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 8f7298cbbc322..78757e78bce88 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -845,7 +845,8 @@ static void guc_waklv_init(struct intel_guc *guc)
>  	remain = guc_ads_waklv_size(guc);
>  
>  	/* Wa_14019159160 */
> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
> +	if (gt->i915->params.enable_mtl_rcs_ccs_wa &&
> +	    IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
>  		size = guc_waklv_ra_mode(guc, offset, remain);
>  		offset += size;
>  		remain -= size;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 225812b299524..4de54a100c451 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4384,7 +4384,8 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>  
>  	/* Wa_16019325821 */
>  	/* Wa_14019159160 */
> -	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
> +	if (engine->i915->params.enable_mtl_rcs_ccs_wa &&
> +	    (engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
>  	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
>  		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>  
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index de43048543e8b..1004171d99943 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -134,6 +134,9 @@ i915_param_named_unsafe(lmem_size, uint, 0400,
>  i915_param_named_unsafe(lmem_bar_size, uint, 0400,
>  			"Set the lmem bar size(in MiB).");
>  
> +i915_param_named(enable_mtl_rcs_ccs_wa, bool, 0400,
> +	"Enable the RCS/CCS switchout hold workaround for MTL (only some workloads are affected by issue and w/a has a performance penalty) (default:false)");
> +
>  static void _param_print_bool(struct drm_printer *p, const char *name,
>  			      bool val)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 1315d7fac850f..971a765d74f56 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -62,6 +62,7 @@ struct drm_printer;
>  	param(unsigned int, lmem_size, 0, 0400) \
>  	param(unsigned int, lmem_bar_size, 0, 0400) \
>  	/* leave bools at the end to not create holes */ \
> +	param(bool, enable_mtl_rcs_ccs_wa, false, 0x400) \
>  	param(bool, enable_hangcheck, true, 0600) \
>  	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
>  	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
> -- 
> 2.41.0
> 
