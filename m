Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323AA67BAF0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2224810E38E;
	Wed, 25 Jan 2023 19:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CACF10E0FB;
 Wed, 25 Jan 2023 19:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674675886; x=1706211886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dW49actBARtmYM4B5359uJhHhg70Vsij7vKVtwAQ9j8=;
 b=HO0skgmIMrrcSftk3DMOUuFbLc51si43NYFhyMFUYYprIGCUWQiM8GkW
 18RBiJKQAOQDnNwc/S+xFIZXe4M+7ja+8izJiduVf7h9jh3o/VZb9PSe5
 +Y/+/TBvxsfNNFhBirlnCPwYzTaLXhAfPvkrA+CuccPI1kZdsDrmbtlFa
 Ir5rvfdINfvVlUPV7y6NmdGpciXND+SQ2sGzQjLbsnl2uxTfkj54JObQL
 pqqQrmjpjLfK7zOEaXT6we16avIWJTIusxbfw51/UU87q2xqtf1jtQ74w
 O2tDPSD4Q69pGiL4ZPlyFq7qDPyHfuZaMBR9gnb135nYClSGFq2Dw33Ox w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="306318935"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="306318935"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 11:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="786554406"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="786554406"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 25 Jan 2023 11:44:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 11:44:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 11:44:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 11:44:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 11:44:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0riUS3Z8nphYzKlB9qSr+AO/UTMMAy3+c+WfAWzhjfeMj5gfGzsWIg3cJgrosI5PnbKAEbGIBCCRKEyQ4UbAKTA0A97nOL4wmuXHzqYvVrIuEXv/XsIVP8oAAkTsdNrFysCW12+dko3nWVXKoFJ45fNflaF7oOWIww455IY6ScfqapYeAWQ9HXFUOlBzplRmC+mxbbvgA+fOZeVuQS6puRcHAl/tr2humW10jA/fwl9JZIlEuc4zCLMkKs3Sle2rYxAIvsU41CQxLHc9XBPfWHz2T/OgW/csmDdMilUqQGUcopEyI+rocqiujVLFz6EhIQbq9+gr3yBE9w+RP+DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TudOdK4KwRaZ7S+L1mC775Hv+C6eXqoVCmnXzO0s5Ms=;
 b=foQETneuzF9hynIXye02gM50C79W61V/U3wXS8QHfRPA363M5v8p5M99QH1UoA46iKD8CIE+PBYgEfKd4kSzGJnq5UbF9axfxpJm50ypX/Nqh8PE7PoBWmsISWWynFQZ63cxv/L0jukzRQkEaQPwijSkNoXsNBosmwWLkHii/FIM1buw58ZQ6HefAHhk1PnGIRZoFhB5FhqG/h0sNSoWTormb2ZXCZhtDg8xF1ihz7onYB70DgJ8SGW9Wy91hw/aXdvFTIMfsaKf2xOT67DVxmAlvtYfIQuJIAbBrJVr1PU7mJXJjH9xMsQ2TjiYoBSLS+/2Aif/CQuH9CJj36mVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH0PR11MB5016.namprd11.prod.outlook.com (2603:10b6:510:32::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:44:34 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6043.021; Wed, 25 Jan 2023
 19:44:33 +0000
Date: Wed, 25 Jan 2023 16:44:27 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/i915/xehp: Annotate a couple more workaround
 registers as MCR
Message-ID: <20230125194427.yo6pkyd4gtu3kws7@gjsousa-mobl2>
References: <20230125011407.2821808-1-matthew.d.roper@intel.com>
 <20230125011407.2821808-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230125011407.2821808-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH0PR11MB5016:EE_
X-MS-Office365-Filtering-Correlation-Id: d4263129-8009-4337-f7c6-08daff0c9551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+TAFf7+PtrZ07sla4RP8JFm6DO6UU5K24dNrOJJMKKyfJc3dlfPR9OuI3DBUhQYCxXD+2tFbtkRgJ57fmyyl5NFnQxM8Ly334HR7sRxvDanRQA3rHFVckWycalDny/boGnR7M561FT6mZJx+MeakGNXsqZXQoASkw2bNHi1rMdUpr+04hA6IRhhSWa6K3bsgFY/4RfwxgdrHQ1aojwnlDbQA0fCDa4fBZtKyLjBNHMSphAazwh/MJN8r4MX9slxe3+z2FYocl/WTIn37EQgtn2gkWltbff9Kv9+7yy1Bcunq6pVp1GF+XNFHDFutjlXiopbIKJVohubnhLkcucdYv/lQQIMavId4ZLKlJwjk+yZpZup+ovbb4xw0rbEmLAHOI9XrCaRHcWxQUxoWQXa6yVXhuaqIxlpTiPKZ/kt7Vz7Bx4J6cxnmp+FVYoEf6ApFn4PMGmYGMHsEJniUvfaaenokrhx6rHh1k4pVUalNnBp0Oz0D+on30rs2QGCQljncuAMq/3EFK0+AGR2JykiQ89uFGZem3ThFtgCfL9U4Iyswa7G1gFNz8QlsTb/gJ+YnmAx/GMHPPwAIrgndwE5Hw2pNmMCqITi+m/SkG5p/xr3RTZd33a/V2rmlReKVON09w+Cf+t+12ZZWSGqVferEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199018)(66476007)(66556008)(4326008)(8676002)(450100002)(316002)(26005)(6512007)(41300700001)(8936002)(1076003)(38100700002)(44832011)(5660300002)(82960400001)(6486002)(2906002)(6506007)(9686003)(478600001)(86362001)(6666004)(83380400001)(66946007)(33716001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynCTLqMRaG6jAH2nUEQBAX+xPNHC1vdE2PZkwle2wr/BYkk5IfdB5mb6QW9c?=
 =?us-ascii?Q?dwmZdw9OBRfBFfUc61DDYtKQtghIZ40O2IbKDuOZZ0/n1bBc2rpBHhhwv0PC?=
 =?us-ascii?Q?7rKoou2dubIKYX8fsByHzKUxXcoCdZgFBTz3gi8Y7DMpaSMOdX/knCx6SDHS?=
 =?us-ascii?Q?eS4AJ9xRKoFfbWKGLHSODYhpvdxW4amjO5LyT607B9SJa9z8HeAgexZBC/67?=
 =?us-ascii?Q?2pV1ovJhYag4VQ7aUEDETHDVQOP8G7e7NZQZhJoqw9Vy4ILdKkci5iTHzfOc?=
 =?us-ascii?Q?/hc093LBw/9ajVbheKA4CBO9Ant/CGcqPjHuFhy3VuqzeW743dXqDnpMdNz3?=
 =?us-ascii?Q?cz/NZHeBQhraGu89xuKdYe37kJDYxFnuZmnDky2OswERpFfX459k0WI4You0?=
 =?us-ascii?Q?tpgQ7wMy3mIVN5WQZU78FXNUAmd2yg8nwmaC2ikmt0zNXchYXGTVG1HA1oa4?=
 =?us-ascii?Q?x1q7ZLlR50PSOQObe6nBzfRiE+aO9BBOi42dCTUyvIv6h2yT+RBQ9Zeibz9w?=
 =?us-ascii?Q?ccRI3jUvNvylDWIV6AA0BRl53h+oFcTHPuZD/D84JbLP+bLmeEJaLSAGk1h3?=
 =?us-ascii?Q?uaQPOrVNURiXdHT4lJAMaa03U0tZmayI1EFMh6ltCMaEbmxDVX3dbZK9jt6i?=
 =?us-ascii?Q?CkHgrNo7OrczMiTwRdroR4jUs/9bbyLKjgztPkTqpo65GhfczdRb3jrfuK//?=
 =?us-ascii?Q?ag1lsBoa4RUvDo8PymYYrSJC3YbXmTiu/ZHXOT0LCy9pqYiAdK4kRME81meI?=
 =?us-ascii?Q?Gsl1+BZROxTbBOSD/rvHRzT0RsXBHU8wU4NdBnBi+/rLdtUnv0bXEcqKp62+?=
 =?us-ascii?Q?0V9nvmuvuWkBOPAD+a6ahAUs7Jg2eABfcGSxhBQswKuhQc+f6akrzknozhp1?=
 =?us-ascii?Q?f0y66smC15NqU8+/j9vkhDuycc1zb7ghnen6l2l3L3Z8yj3Wx5FBNRIS0/xL?=
 =?us-ascii?Q?jE70BsbbgLEEnrCEWUXYT2Wg+ZL8lEfAZuECgjG7ee2fkBDIzzAM4voAMjB0?=
 =?us-ascii?Q?Da+uswiY+DF5LaARLvOkIWKAhPHr7CAJ/UH01MFTvyjAMs8lPiwOJ/Z2WR7+?=
 =?us-ascii?Q?JCnx0wKq+jx9fXxumMWjJ9d1arHLkjX857vIFT8znE705EasxAfUkpGruoHb?=
 =?us-ascii?Q?Iw7jwWHUZCW2HeW/1qRjZPL2kWDUQ12hOPwwYeSm+oVZUJXWNbLewsSmHB1y?=
 =?us-ascii?Q?jOwLcp/t+wRGSjJKJhTAGy6OgG9NeCPFVD9ZSV/r1jZoy9rsSEQHyLmF6rj3?=
 =?us-ascii?Q?mknttxa82szkPZL1Tm7FiDr5c7pm2GkH1QmTkR0hvLff65PDSRG6Q72oLGGO?=
 =?us-ascii?Q?do+sum33xJ8goQyec6KG6Nxq8Ofccn2+EWP7cB0OOgX8BS/O/KjgOW32sqOE?=
 =?us-ascii?Q?d/j/SY5Tyz7NckGyv721ZEm8xxYI+woMNp0+VwwCCMh/xlOeczvtvQFLDIof?=
 =?us-ascii?Q?a8f61IfMjcyrHG+engcCeS6JvLLZM5MzvPxE1yTKX+sHvhKxEZYvPgghRDGD?=
 =?us-ascii?Q?eSnx969P8YeMTie4cgcGS9vOizmJSt3+VclBiMMYxW54cz/uTo/pOjyPRebt?=
 =?us-ascii?Q?okEkIokVt5v8nBxJw+HQY4sLcbcKe8gsiK0xJXBt0TVTXW642Bx8VYSloPwK?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4263129-8009-4337-f7c6-08daff0c9551
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:44:33.7932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hah/b+w6y75hRKegaPrVxqfbU8mJjwVbziyxmHZb6e7sD/X1MvPmr4oIgt9tcXN+WiWjjx+j96cjv643hVGGZQ==
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

On Tue, Jan 24, 2023 at 05:14:07PM -0800, Matt Roper wrote:
> GAMSTLB_CTRL and GAMCNTRL_CTRL became multicast/replicated registers on
> Xe_HP.  They should be defined accordingly and use MCR-aware operations.
> 
> These registers have only been used for some dg2/xehpsdv workarounds, so
> this fix is mostly just for consistency/future-proofing; even lacking
> the MCR annotation, workarounds will always be properly applied in a
> multicast manner on these platforms.
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Fixes: 58bc2453ab8a ("drm/i915: Define multicast registers as a new type")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 16 ++++++++--------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 4a37d048b512..a0ebf3fa63ca 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1105,12 +1105,12 @@
>  #define VEBX_MOD_CTRL				MCR_REG(0xcf38)
>  #define   FORCE_MISS_FTLB			REG_BIT(3)
>  
> -#define GEN12_GAMSTLB_CTRL			_MMIO(0xcf4c)
> +#define XEHP_GAMSTLB_CTRL			MCR_REG(0xcf4c)
>  #define   CONTROL_BLOCK_CLKGATE_DIS		REG_BIT(12)
>  #define   EGRESS_BLOCK_CLKGATE_DIS		REG_BIT(11)
>  #define   TAG_BLOCK_CLKGATE_DIS			REG_BIT(7)
>  
> -#define GEN12_GAMCNTRL_CTRL			_MMIO(0xcf54)
> +#define XEHP_GAMCNTRL_CTRL			MCR_REG(0xcf54)
>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 0e7f64bb2860..94eb498f3c2c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1570,8 +1570,8 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
>  
>  	/* Wa_14014368820:xehpsdv */
> -	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> -		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
> +	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
> +			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
>  }
>  
>  static void
> @@ -1665,10 +1665,10 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  		wa_mcr_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
>  
>  		/* Wa_14010680813:dg2_g10 */
> -		wa_write_or(wal, GEN12_GAMSTLB_CTRL,
> -			    CONTROL_BLOCK_CLKGATE_DIS |
> -			    EGRESS_BLOCK_CLKGATE_DIS |
> -			    TAG_BLOCK_CLKGATE_DIS);
> +		wa_mcr_write_or(wal, XEHP_GAMSTLB_CTRL,
> +				CONTROL_BLOCK_CLKGATE_DIS |
> +				EGRESS_BLOCK_CLKGATE_DIS |
> +				TAG_BLOCK_CLKGATE_DIS);
>  	}
>  
>  	/* Wa_14014830051:dg2 */
> @@ -1691,8 +1691,8 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
>  
>  	/* Wa_1509235366:dg2 */
> -	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> -		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
> +	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
> +			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
>  }
>  
>  static void
> -- 
> 2.39.0
> 
