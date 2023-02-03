Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7578688C56
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 02:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0096610E6E0;
	Fri,  3 Feb 2023 01:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E8010E6D2;
 Fri,  3 Feb 2023 01:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675386738; x=1706922738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fUPxvtQYc8TLG3mv0BvzybW7mnO0CuHVn7XGbKJBSeU=;
 b=cHKGy29FLZtFfT32H7QecvOpZSrjDZheMxriEJCbZiFnu8QsQASnmQS+
 lq3uqHszN21cbErgiAKCmWuX7TvdPY9GfwTxra2l/x0AR6KAwgWZbIc2I
 S9dWpg4Z/B97Yl/r8Gt0zXAfXxqwHuRnoK7Mxro4RH+cHkQX230/qMDGI
 EBVcTX4Bko7te7x5M9N5w4cH3+QwEFh1c6zuFXPyqbZegQgiGyaD53UTx
 6yCnPg4OnQKOdRe/EVno2ySlbdaf/R0DP1OTWLqyGV/S/uC9rFdTbeQM2
 miWBSe88Dy4rUBMUg1cK9QJONjbosmBm7rISOmQVuL1KTR358P4ijsXi9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="391022030"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="391022030"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 17:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="697894257"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="697894257"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 02 Feb 2023 17:12:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 17:12:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 17:12:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 17:12:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 17:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDrHKXAEH2D3Y5HjvFoysXnlhqmxeVWrb0rTijWpKpzfj49tXShk0bZlQQwDfDLpiMBls1vK+zUMFS/BvkG5NnHd6lBBDVt56biqiYgfLS/L4qgI5r9XTzeyX4Gomk74khHziWJ1ZpDpGwi/u+r1EqSCR7numTL+EJdbmbr4FCzI+a9/fWbhn9+V1I9Rm0b407Ho3QfZk/4a2qwfupMgXP33NPBeZzU9ZSxvNiOLruaku3qLevp9FgDzQhjxF2RsoWyCoqo40XPCwLK3QI5+7f22osd+Nbb1bOvJt7H0+VU+KRJAwd0jby1f7e3kyRD4puYvxBUCCEvCfavIDRh3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nsbVB1RrguuHAqeh5MHt5Kz++VpSgCgJFFKK1JfBFo=;
 b=Z1b6NZJCsmWeh6arnogTJS7kMbYgp7nRAbsByUtNTDmwVAvx110MXcG9aYbr1lxaKLLrKs7c6BwzYJoA9iJaZOwL0dfGpMl3jEYGx5dKopWDwvmw32z2exUaX7kQ9spjXIfrhvHMv/XSDfV4L3ypPxtnjkiCatNNNwrHY7czwG5LJEkJFTBq6pQWKL2xNcPMBsKlX6g0gIIHyNd7AgZUcn8oDU6/4V7dUozkwRttzzbcOrRx+Ys3GfXuRR1F1svieXJH07ML+oYOqkmSkqyGG3lsxq371FNMKAjHjKxCTEDrT9yN4aXkAztXooS6E894TabNS+yIr8EwNzanIWabKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5481.namprd11.prod.outlook.com (2603:10b6:408:102::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 01:12:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%6]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 01:12:13 +0000
Date: Thu, 2 Feb 2023 17:12:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Fix GEN8_MISCCPCTL
Message-ID: <Y9xfahu4Mf+fAank@mdroper-desk1.amr.corp.intel.com>
References: <20230203005709.2612633-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230203005709.2612633-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5481:EE_
X-MS-Office365-Filtering-Correlation-Id: 101bd92b-6e76-4006-4c1f-08db0583aea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vm/Sc7BYy31M/+2aJyJpy2xmkWnLOcp2PSj9m05st7VK5bV4Gj4xcxRn4hekKROhbRvRNvvvJKRSDIx5AVbH0gvqfa3O+JfUX8EtfjbT4EfaJMzq0q/IjjB2V6j9ROqNncvoBRSxlBoVSCLTnfSuY2QvzbsyLFb0ArxvPd1fJ3DEl/gYylSMNjvj7Ke2jGQ4jylcnAYDV9ZUL7Cm4hyuaAb7LVTnGJ8ETE9FaKWGzBnwbbB51y5bzPuRlxMsB1gZXETy1FniopG+fL+2SoORYT20QrX765XQ6C4xz4UWNh3927bBn/s6mnCZ/FIisrnY8NSpQbyguYvv5bg2/egrw1dY4g+jRYfL6Lo3odOnd5tkjxCiZVoLFSBzLdPV8I2dOXxSFoAfiKXD8VFi0PXSXg8YYCNFqrx3NyVTJZvf+nUkToikx7+gwr2SXbVdoLO4vx6Nipn7CELOcUf23BL8MJNMJrBOjTgw24sV7rHmU0W0twNuBVW3EhXCK1/ITlJdV2Fc0EMrYzqZ0zHOxRil8+h9/KU4p8rN/zUW+QIkV21O76IZ2A/l8yr4B+zyklj5cH5xAoHk898DQ6gCQMzRr6RPqPhiSpLqzyqA6q5OyhasaFBGWIKZFaY9Ai3FhLKBeccv4Ds+zMDwpYe6WnbqQ6kWPKZK0KMvQfcnD/m93Q5s2MIE4tcTC/PyJDtgDDJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199018)(6636002)(8936002)(6862004)(54906003)(5660300002)(4326008)(316002)(2906002)(8676002)(41300700001)(66556008)(6512007)(66476007)(6486002)(26005)(66946007)(478600001)(6506007)(186003)(83380400001)(107886003)(38100700002)(450100002)(86362001)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jPPJmVidf/C0y9EQADuNg0U/Ouk9OqzrHWxuOjq4ILXnDYcXl0BOHUJbIdOv?=
 =?us-ascii?Q?cIlwVevVwzwUlTknmuBJ6WsMylJJKPgzUCBaycz+8rS5KycCBg3WXkwNhnRc?=
 =?us-ascii?Q?Fg7QKzYP7CCXUk25kCkIm8NZBZA0VAzzp9PiRNuBM3FUp7nZSKR4gCWhaZLi?=
 =?us-ascii?Q?K9IQ5FDuXkCLzX0jHhrft9qpQNWNLiW/jQWLBGhub+EIzOwjrqZI3NHraRLm?=
 =?us-ascii?Q?5JhvhRCWqoMs55yZG7qFvMILx/9T1UXZv4E7ZDeq6FSp0tbRsC1pIY+c4pUA?=
 =?us-ascii?Q?14xUu9iRKRHwhlZnzh+bD9J4xUNXZiSTqqlCF4c7TVe+LGdD6zZSSoEuUN/c?=
 =?us-ascii?Q?JzZTqGbFaaCwOlrpKpbiSrMGCHHbjpybKCiUaluCV9LzvxBM5+sWrID37S7h?=
 =?us-ascii?Q?6Hl00OpCSzCLb4cm+UsDXbLjDYCCV3lqS6XPLOEjvl2kXiaO/cNKxl0S2VA1?=
 =?us-ascii?Q?oGnwQvsVdVYsTuXCMZy+bWnF/w14L+kfszwGU2LIQibX+7bQ5Srgu6eVLLSe?=
 =?us-ascii?Q?dleugLbd4cQSRxn/bD0GDNltyHqrxhYERN0G1kVrm6qkoWh2Z+cqJVDioWSv?=
 =?us-ascii?Q?xq+T1TlqdC6Hkc7jt79+f3cYM2J3cRr3RfExlTzWeulgoF82VhTnIn4QAsju?=
 =?us-ascii?Q?dXMHiRN/3Ys/Y39QwLai4rHoTAYX0OTlnDYh1/rcu3aOZ37UY2EN4QEF20D/?=
 =?us-ascii?Q?jMEjWuGgy9aScN1Ca5m2rp+PQzRaVOgqDkNlRSBj7lrNaunAhPfGmAMuD2Oc?=
 =?us-ascii?Q?ManAeCXMEeDEJhWiNaD9KckEbsxp3a+F+PM3UIez30Po2wa0cbWLLXu/Iqql?=
 =?us-ascii?Q?PRihkUfD4zj/f+5I/OqtEbfJvFX3bl5fUmUqc2qC7wZfIVVGGephniVCVcsg?=
 =?us-ascii?Q?jc55qLnnag3Vc9dfGX1C0eYvrER99ok+Px4tOdMSMm6rTp/ZpGIe7Zez81VE?=
 =?us-ascii?Q?5/d7T2nUBf4WqP9W9NfpF9aOW6c3QumtcqrgwAZBDx0umy6rZhZ6OwFm4S8g?=
 =?us-ascii?Q?VD5OS5DErRC4Kg34OwPR+jS6MhPqu6danOHE97h1wix53RlSn7rIuy4yvjtm?=
 =?us-ascii?Q?Izu8+rdYQGM68Bn4aflzbSvy2HmuLm3OKvvMwdWuV+ghihqCCDh9XxexuNnq?=
 =?us-ascii?Q?wkBc3mKM0tH09qhUQJQ2O2O1i8IeRYA0DHev/Dg4SxLgOWfQ8+lgsRBV+mqe?=
 =?us-ascii?Q?FXB70FK9f+4Iu+8MBw4fCr5uVPfy7S8hKJWkOt+zgoyYKV+ALbVyjkExehhB?=
 =?us-ascii?Q?qlBTrJvu9CWgDN1MO5Oc4fX3K2LkVX9J6O2qdA8/2CbAq8l/egku5I28DLln?=
 =?us-ascii?Q?oLgA6jqxYuJ+xb3oO32BNZocs3itW89TNUztyDs5pWlwcOW95tTMo9FXa7Kp?=
 =?us-ascii?Q?rfqK8krNyS9rtA9hT7T2whiNY8VrQEsEBJtPDF1sW99KVO3J5S/54JEa6tMY?=
 =?us-ascii?Q?OFMTBzorbx8tGbYVPUJCs7upR5V5OvJCQRdAU8aPa42tYl2kUy44yhBkBixw?=
 =?us-ascii?Q?+toRMmpD6v8JAZ5oCMT2wtNBX063rNj5LWnSRzvtxlymRfKDbz4JsK68AiO4?=
 =?us-ascii?Q?YttpCqk3gPWiH/lOSWoDomPSu9WMPnZCQ9qFlWmpBuJ/7LNb4Yy3HEtGVzC5?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 101bd92b-6e76-4006-4c1f-08db0583aea7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 01:12:13.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ces0Y9cPcBdqYgALsfk/XnuR2PhK6QInUN9h1pBVJu433Eb/jCUNHu0B/c4gC8J29EeQsW9fj7DOgwxxzPtoB2HjbDaUUapLe1W9etmc8lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5481
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-gfx@lists.freedesktop.org, Matt Atwood <matthew.s.atwood@intel.com>,
 dri-devel@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 04:57:08PM -0800, Lucas De Marchi wrote:
> Register 0x9424 is not replicated on any platform, so it shouldn't be
> declared with REG_MCR(). Declaring it with _MMIO() is basically
> duplicate of the GEN7 version, so just remove the GEN8 and change all
> the callers to use the right functions.

According to an old copy of bspec page 13991, 0x9400-0x97FF was an MCR
range on gen8 platforms.  Newer copies of that bspec page forgot to even
include the register range table, so it's not obvious unless you dig
through the history and look at a version from before Aug 2020.

However bspec page 66673 indicates that this range went back to being a
singleton range in gen9 (and the other forcewake pages for newer
platforms indicate it stayed that way), so that means BDW and CHV are
the _only_ platforms that should treat it as MCR.  Usage for other
platforms should either add a new "GEN9" definition, or just go back to
using the GEN7 definition.


Matt

> 
> Also use intel_uncore_rmw() rather than a read + write where possible.
> 
> Fixes: a9e69428b1b4 ("drm/i915: Define MCR registers explicitly")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  5 +----
>  drivers/gpu/drm/i915/gt/intel_workarounds.c |  4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c   |  5 ++---
>  drivers/gpu/drm/i915/intel_pm.c             | 10 +++++-----
>  4 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 7fa18a3b3957..cc1539c7a6b6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -686,10 +686,7 @@
>  #define GEN6_RSTCTL				_MMIO(0x9420)
>  
>  #define GEN7_MISCCPCTL				_MMIO(0x9424)
> -#define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
> -
> -#define GEN8_MISCCPCTL				MCR_REG(0x9424)
> -#define   GEN8_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
> +#define   GEN7_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
>  #define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
>  #define   GEN8_DOP_CLOCK_GATE_CFCLK_ENABLE	(1 << 2)
>  #define   GEN8_DOP_CLOCK_GATE_GUC_ENABLE	(1 << 4)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 29718d0595f4..cfc122c17e28 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1645,7 +1645,7 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	wa_mcr_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
>  
>  	/* Wa_14015795083 */
> -	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> +	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>  
>  	/* Wa_18018781329 */
>  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> @@ -1664,7 +1664,7 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	pvc_init_mcr(gt, wal);
>  
>  	/* Wa_14015795083 */
> -	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> +	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>  
>  	/* Wa_18018781329 */
>  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 3d2249bda368..69133420c78b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -39,9 +39,8 @@ static void guc_prepare_xfer(struct intel_gt *gt)
>  
>  	if (GRAPHICS_VER(uncore->i915) == 9) {
>  		/* DOP Clock Gating Enable for GuC clocks */
> -		intel_gt_mcr_multicast_write(gt, GEN8_MISCCPCTL,
> -					     GEN8_DOP_CLOCK_GATE_GUC_ENABLE |
> -					     intel_gt_mcr_read_any(gt, GEN8_MISCCPCTL));
> +		intel_uncore_rmw(uncore, GEN7_MISCCPCTL, 0,
> +				 GEN8_DOP_CLOCK_GATE_GUC_ENABLE);
>  
>  		/* allows for 5us (in 10ns units) before GT can go to RC6 */
>  		intel_uncore_write(uncore, GUC_ARAT_C6DIS, 0x1FF);
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index e0364c4141b8..798607959458 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -4300,8 +4300,8 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>  	u32 val;
>  
>  	/* WaTempDisableDOPClkGating:bdw */
> -	misccpctl = intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
> -					       GEN8_DOP_CLOCK_GATE_ENABLE, 0);
> +	misccpctl = intel_uncore_rmw(&dev_priv->uncore, GEN7_MISCCPCTL,
> +				     GEN7_DOP_CLOCK_GATE_ENABLE, 0);
>  
>  	val = intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
>  	val &= ~L3_PRIO_CREDITS_MASK;
> @@ -4315,7 +4315,7 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>  	 */
>  	intel_gt_mcr_read_any(to_gt(dev_priv), GEN8_L3SQCREG1);
>  	udelay(1);
> -	intel_gt_mcr_multicast_write(to_gt(dev_priv), GEN8_MISCCPCTL, misccpctl);
> +	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl);
>  }
>  
>  static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
> @@ -4453,8 +4453,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
>  	gen9_init_clock_gating(dev_priv);
>  
>  	/* WaDisableDopClockGating:skl */
> -	intel_gt_mcr_multicast_rmw(to_gt(dev_priv), GEN8_MISCCPCTL,
> -				   GEN8_DOP_CLOCK_GATE_ENABLE, 0);
> +	intel_uncore_rmw(&dev_priv->uncore, GEN7_MISCCPCTL,
> +			 GEN7_DOP_CLOCK_GATE_ENABLE, 0);
>  
>  	/* WAC6entrylatency:skl */
>  	intel_uncore_rmw(&dev_priv->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
