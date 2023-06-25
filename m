Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DBB73D308
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 20:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EE110E0CC;
	Sun, 25 Jun 2023 18:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E52D10E085;
 Sun, 25 Jun 2023 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687718394; x=1719254394;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q6R71amRjNIc5cllZZ5FPVU9/46mtY678jxBRQOQ7pQ=;
 b=JTRVH29Fqkw1z2EBFWt0tkYMPPJHPw9yACyRcUMA7/nFup7SgzoTxYR9
 G+wVJlkR7GPE0Y6HUBGF8xoZa9A+grleq8QRVajqT9Olk1uiLbIThHwx/
 U5W3QkKcmhmi55C6rTCRP0YjRMs7mF7FPlTPzoCQHtctdNaZtDZyOYU+g
 6zlNATVcNaX/FToeyj0s0Hvw6P/72Gi3cN05UVKU2kYmWFPq7ufZEsg8f
 CNC1SCkOSRzppsNveEZ009dO5GxK3mfF3suDC8ITt878I4GcXsQ+F12se
 XJYE1tGGz/HhpgHzwX18rsEII78DlTFwsKeFnnCHZvOFmzPoOUHSaKBpa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="447487191"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="447487191"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2023 11:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="745546243"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="745546243"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 25 Jun 2023 11:39:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 25 Jun 2023 11:39:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 11:39:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 25 Jun 2023 11:39:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 25 Jun 2023 11:39:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrHA5yty8nwi+QS6SgOOAIys38bY5p1B5bSTcxIMzhjkdJ3ecrw9+dd+lH94IHEHVnmHINgFolK7VEq/fIvI7GbxwwaPxZfpv34GRsjQjN17zrvdOiZ6fZpqexCQinJUIPxJ/VOYj2bYcr4lFF2Kst66S1ZaByxVN5eMlQp2O4XrQTlSAnN+qHF1/Axk9fuMcrMRm4YFf2XIASzC9+8QlgO6AEMIiQdoFFb7AT6dqJuDYsVvTYZgyNZlaaBG3kxZjFIQKLwQnp++hedcETmuy86Ow1Pq75YD6OXp8o5f+awP1Bjbx2fczMBic/ebl2xY2RUXycrsfbUbS+KWtnrnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjUm3GHKyAEYM9ErdytRh8lkcURDOG0751m1LMoHwCg=;
 b=VaUnOu2iM7iG/T5w+GQ33mX2wPuv9NWzyzNTWSb1Ryysq5q7hF9ACbNA0tVIdhPLCw4c6OWl5e73K829LqL5A0BFloc9xb9fkOg4A14X+CONDKLXVBd28cPT53MR111F33ziZMg+en6WpFypXtfVQyorA1WOWMRJNdc+cjreAtT8KxPbDMWhy5n2IsbnVLgNO1NtCPlrtbObCULNQYWeeoezY8e7oJ0/xnZnoW6JA5qYOIfMlTnYa+WmUkiBQRtA6aTVs5VnvudM6O9l/H1HzcJBd60oKh1D8OIhqDlFWoLrkszSPhDe5B+EBGR/Kxppq9yYRHPowdC3lcr+lPjM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Sun, 25 Jun 2023 18:39:47 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6521.024; Sun, 25 Jun 2023
 18:39:47 +0000
Date: Sun, 25 Jun 2023 11:39:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 2/6] drm/i915/gt: Clear all bits from GEN12_FF_MODE2
Message-ID: <20230625183943.GO5433@mdroper-desk1.amr.corp.intel.com>
References: <20230624171757.3906095-1-lucas.demarchi@intel.com>
 <20230624171757.3906095-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230624171757.3906095-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR01CA0011.prod.exchangelabs.com (2603:10b6:a02:80::24)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e593201-fc13-40ec-f09a-08db75ab8cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dj7YrlkhD5DbPF5iqJs8P+1rj9Eqy0PCRfUmHNpPUvNJcrlWVK9j6yaqHq5zrvslC8I971iZuKrOnwA9yreBJky/QdNeh8LyaTgT6f8L9zWxJPN2RAJIFPrgbu5fFQ+hsDVSYYBGoymn7jRjTRiizvukjhbAcOjszf29mLJDo6+Uwo4NaF7D1sZ2Wy33w2ZNtAKuyyqlu88kU/QSlg43cU+m24eLoKOARAPwiNxVzdvsdDrpX7h/YGuCDoyT/WqejmC/mccwl00MG2z3VUIqLKm4tVdBrltSwWStzWWMnOERUG0ii7oq6bEoquJxDM52s4EffAkWLbZnEduZ3128NrkV00GNOXjcCuhT0t2SghJ9a8mrKGZG8xUTkFSV9N+O2aKqcm7qgAWxyP52/TZPeB+dHVKvAK2pOdACCYqyAEfUjLtZUAiU5Xm3S8rwjMyTIDriu89HifvLCK92OwNeObXnRJfh/5wjbDK36HBuTYREyu1AxJSz9zd1UzTU2lqBlgHc9W9RPEwjDGxGguTvaq4IjhbRkXN8tBY9fJ8tGes2JyvAwCWkKDTwIWwsd9NC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(316002)(66946007)(66556008)(66476007)(33656002)(6636002)(4326008)(478600001)(8936002)(8676002)(6862004)(5660300002)(86362001)(41300700001)(6486002)(2906002)(26005)(186003)(6512007)(6506007)(1076003)(38100700002)(6666004)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jn4iW8noojmz7K0cU+WklWkgpDKNdkedq0TNeZGlzbWlwVVTUAovl9OXj5R3?=
 =?us-ascii?Q?icpBlpPrDWkSVUGHcq8E/AYZtuqQJZlZhJ/VXa1MHaM/pPDCpj42coTnmd1V?=
 =?us-ascii?Q?btpsTFFSSm8bepLmX7dlY0R31CB4C9I0GSdzuLk3mvZzh9AjmsdHexWuS1x5?=
 =?us-ascii?Q?zNdyA4tuZd1lOGGUQVNkPxaMOaRW7MoKFVBD18yvCoydjXkCiq3UAfVjs9qX?=
 =?us-ascii?Q?/23T8Aq1TkWB15xZgJq3bAhiDwHFaAGmX+pETWE7D84EHd9Nvb6Ugg/AqdNo?=
 =?us-ascii?Q?tVnG5vtuCnHRVVTyRxVCfrywXPsFxHIV4j6lRFD+H8VYMjxb1oGiwFaOr3mJ?=
 =?us-ascii?Q?8LoXP0cIc3kP3p3V2rx8k9ah5bUgmbBJ8A9NsnJlB/j0iOqv2GCiqu2+gXP5?=
 =?us-ascii?Q?iXDQskhvGX6mbYOuMREtBG8BZ3R5mBZx1lzahfrsuFHx0kH9XtoHPxwm+e+3?=
 =?us-ascii?Q?aowyBYBeLgV1VtKqvBCHQKESDCm3MyyJZqVTg4VcO6eocYk7GiN4WuiGqQTP?=
 =?us-ascii?Q?zAglTFIiQ9AYhrKJb+NJueY8z9hfLFSAs4dwDH3IoVcwPypPbdLVqVr3Khca?=
 =?us-ascii?Q?0G03xAEzClFPbVC7xzsXlFkTQNakAyufp5cjY7VgngDkuW05RSTVUAFzDFDg?=
 =?us-ascii?Q?2Y/a/AK+SpJqaugSz1dMjRArjO6AQ5nRoSC9a39PAE7+7oudMNvWERLO8C80?=
 =?us-ascii?Q?FDOVe/1P7QA0GITfaPmK4fxUFn38RcvxgEVepqEH3W0A/lsRbZoq5121GPeG?=
 =?us-ascii?Q?Za6Z7bIVb9Xo+Q81WPMnSyLv8OiZC5OAqcWOjjdqydWbqchk4vY3Eh3dfVY9?=
 =?us-ascii?Q?lhF9lxFcN3EJ42MSwj3ACo6MNn/s8G/KMCU3OH4w1p/gg0bOEZPz0YbrYQ3y?=
 =?us-ascii?Q?xl5DGz3sDiESlMt0ELRBA4caoIvllINBBT9vuvjc5Uz1n/OtUjs4w6etIGxT?=
 =?us-ascii?Q?Q3SzroL4IfBg6kycV/Fb512/cOPJz0b/RYjDCfXWgFGCLvdksDptfyiQ3KA5?=
 =?us-ascii?Q?5qVkm+ApoEyirNrGMlP7tGZVaLOmBwGPbrrXhIOg9Kqum7XGD5PVqjoDOA7M?=
 =?us-ascii?Q?GoCoLLcN23l5wo6hb6TmrXiAuqAr/XGLCPIz0JWo1SdlZWltTZ8oGFiN8zf1?=
 =?us-ascii?Q?X+AvD+gjNFJkHVSmehlRmBdy4sUfi/r2MKxntFfDCXXkYoNO/nIU9q25kE3j?=
 =?us-ascii?Q?outCY+2xqh2zlJ/X4JD234FcTDvpLchQfKS9Q4Dh6TPVh1zeLZxqc3jv/txW?=
 =?us-ascii?Q?cxdg1C2+p5BIYhiu+JkChTh08qcniZRqSh8hYwmyLiipHMgxNyRs/Tb+UrcP?=
 =?us-ascii?Q?NsH/Y40EeZmk+i6nxJ6cQdV890nsMLmEMGNXJgTUL4t1FAA8y80ZdbBYEK4n?=
 =?us-ascii?Q?veYmIPit+yqNLhUqJCys2UVZUZAPjPHY4zZUUUGZeLba5w8AcPL0Kpw0E9gA?=
 =?us-ascii?Q?r2YOlob5ftXOZ7U45kHXQp1OtdjC5fAH48x/7lHptHhzFf3bF2ehOKk1/nJc?=
 =?us-ascii?Q?EPny5eEyT3Rmb2YPI3SAcrZO904xTVKyghr5ZTR50CZkU5ouRE569qBfq5i/?=
 =?us-ascii?Q?I7zrW+rqj5v1S+HX9I4I+hAC0NnTK6rbvoUkzNuiPfJz0C05CdXgljOgLQwW?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e593201-fc13-40ec-f09a-08db75ab8cd1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 18:39:46.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9nVouQG7ahxmTRyK4qnTTby4w8SNdRwEkk4OFiu1Mvd7jntZoERQmCr05Q/Cl4Nhg8wkUgMQHPx5ECJsBqF/xvgI/E858VNd0hAqicIryc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
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
Cc: intel-gfx@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 24, 2023 at 10:17:53AM -0700, Lucas De Marchi wrote:
> Right now context workarounds don't do a rmw and instead only write to
> the register. Since 2 separate programmings to the same register are
> coalesced into a single write, this is not problematic for
> GEN12_FF_MODE2 since both TDS and GS timer are going to be written
> together and the other remaining bits be zeroed.
> 
> However in order to fix other workarounds that may want to preserve the
> unrelated bits in the same register, context workarounds need to
> be changed to a rmw. To prepare for that, move the programming of
> GEN12_FF_MODE2 to a single place so the value passed for "clear" can
> be all the bits. Otherwise the second workaround would be dropped as
> it'd be detected as overwriting a previously programmed workaround.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 51 +++++++--------------
>  1 file changed, 17 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 8f8346df3c18..7d48bd57b6ef 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -693,40 +693,11 @@ static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
>  		   0, false);
>  }
>  
> -/*
> - * These settings aren't actually workarounds, but general tuning settings that
> - * need to be programmed on several platforms.
> - */
> -static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
> -				     struct i915_wa_list *wal)
> -{
> -	/*
> -	 * Although some platforms refer to it as Wa_1604555607, we need to
> -	 * program it even on those that don't explicitly list that
> -	 * workaround.
> -	 *
> -	 * Note that the programming of this register is further modified
> -	 * according to the FF_MODE2 guidance given by Wa_1608008084:gen12.
> -	 * Wa_1608008084 tells us the FF_MODE2 register will return the wrong
> -	 * value when read. The default value for this register is zero for all
> -	 * fields and there are no bit masks. So instead of doing a RMW we
> -	 * should just write TDS timer value. For the same reason read
> -	 * verification is ignored.
> -	 */
> -	wa_add(wal,
> -	       GEN12_FF_MODE2,
> -	       FF_MODE2_TDS_TIMER_MASK,
> -	       FF_MODE2_TDS_TIMER_128,
> -	       0, false);
> -}
> -
>  static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
>  				       struct i915_wa_list *wal)
>  {
>  	struct drm_i915_private *i915 = engine->i915;
>  
> -	gen12_ctx_gt_tuning_init(engine, wal);
> -
>  	/*
>  	 * Wa_1409142259:tgl,dg1,adl-p
>  	 * Wa_1409347922:tgl,dg1,adl-p
> @@ -748,15 +719,27 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
>  			    GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL);
>  
>  	/*
> -	 * Wa_16011163337
> +	 * Wa_16011163337 - GS_TIMER
> +	 *
> +	 * TDS_TIMER: Although some platforms refer to it as Wa_1604555607, we
> +	 * need to program it even on those that don't explicitly list that
> +	 * workaround.
> +	 *
> +	 * Note that the programming of GEN12_FF_MODE2 is further modified
> +	 * according to the FF_MODE2 guidance given by Wa_1608008084.
> +	 * Wa_1608008084 tells us the FF_MODE2 register will return the wrong
> +	 * value when read from the CPU.
>  	 *
> -	 * Like in gen12_ctx_gt_tuning_init(), read verification is ignored due
> -	 * to Wa_1608008084.
> +	 * The default value for this register is zero for all fields.
> +	 * So instead of doing a RMW we should just write the desired values
> +	 * for TDS and GS timers. Note that since the readback can't be trusted,
> +	 * the clear mask is just set to ~0 to make sure other bits are not
> +	 * inadvertently set. For the same reason read verification is ignored.
>  	 */
>  	wa_add(wal,
>  	       GEN12_FF_MODE2,
> -	       FF_MODE2_GS_TIMER_MASK,
> -	       FF_MODE2_GS_TIMER_224,
> +	       ~0,
> +	       FF_MODE2_TDS_TIMER_128 | FF_MODE2_GS_TIMER_224,
>  	       0, false);
>  
>  	if (!IS_DG1(i915)) {
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
