Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E3F74B2F0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 16:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2537410E59E;
	Fri,  7 Jul 2023 14:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEA610E59E;
 Fri,  7 Jul 2023 14:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688739443; x=1720275443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=amfqCa0LMArTEX/2sTzgKkl3/8K97IG9/FvxL3wryXc=;
 b=jB2RD3R+QP0OjKLQFR0Vg99JxdaDHhQPOEfqaOX9Ha6IY6DlV1tqB77m
 qNqg4cu5fiAlG0h68nw9fmLQDK55nsBKXkQba4U/58O/vcv2O4KRgkuJz
 WdNw01+QXhCGm+bRS8AGXaGq520syJ6uFNVpWIDSxXqSUOhQyKfJXnTAw
 08OKNkVjYMjscafZr0zscV7kfvcDoa/8346iWcru2XLQR/0IJaqTjdDIC
 efWmT/fn5OIBWWDmoyMx2Ra8n8bXrA4A9I7vArApq0/Rn7SK0txv8LttI
 gKqvnVjBKViGxACa9/a2n/IsnXn1ZPDtWF1T9g3R1NNO+5PqkOHvSKUtm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="363933747"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="363933747"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 07:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="1050557222"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="1050557222"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jul 2023 07:17:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 07:17:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 07:17:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 07:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCWLal2xprYYdImvDx4Ubql1KqZVoK70UouYAxKQIONLy5BIHQLKl89deehCVSvzHhx78Ud98SVg3a8xp0tl3i9EkoYQrH8yCy0ZWBJSsaEiNUOmgMrTT1TBVv+0IKdFp1l8PYraKO0QBffYbj5HqAPm3WUBeDfE7PzdVL2Q1PO/zE7jAhwzmgFOtMWf+FMLFWNubnA4cDTx1QsQjCtOLHE1XAngQM5Dn7TNYamhxiAmZsRTLtFqaxi8vGzVD1Mt7Gu9yVyEkGfoG9Zha0T4nLX6R1HTqQB/tF9R74D6D/dzgZMKTiRxaEl89Ux31MsvgUTgWTc+j0nW634AseGS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Db4kabap0n1jGWYEox8dRzZ/RnaIECmCLyFG75uk6cE=;
 b=K6OX+SdwW5+jmUZXExBphjEsojo8vL00QOx1OhID3pdvZBqSyquacCmIi4xAPkNQ+/GZi/WReY/LWVtBgITvP6AtLgdl5KQ/dl6AHYWzAmFwy+3SvLy1GsgzV7k8axiakd8RzH8UPlRNa+UaXP6I/W1Vx1dL6LYx8ykmAnoA1vdnyXuDi0LefeJRXNApoVlSuSFlbbNDo77habR4dv3JZgNP4DWSHytttWIjgY6NVH6/hkz7+xv7Q3ttU28iGpqyMK8u3A1twaAsyhpXsH6vHnMqh217Lg4XXYOqFkaNFWGYvWgx4xH13fku0MU5Di6SF7EXAD/jSp2ukBwBYUZypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 14:17:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 14:17:07 +0000
Date: Fri, 7 Jul 2023 10:17:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Remove dead code from
 gen8_pte_encode
Message-ID: <ZKgeGwl0nj9QAptv@intel.com>
References: <20230707124644.3965281-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230707124644.3965281-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4800:EE_
X-MS-Office365-Filtering-Correlation-Id: 022da0d5-1dd5-4507-5d66-08db7ef4d832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjbBFTA2FHSABMJQKlaVJAW9cki809uV3OvkfBugvEMIx8GioEfrgAgqeqX+Wc/HCUuKL2akJlif0Z8en5+CtXm20xDwrB3uahPG+9IGI1T7bhx3KphyTsczO4ESTUsgOYk14O6/yrtKVr1bp8G6EdHxaEmkAUBFYjjwgwYOM1VtcO2dsm7e+MAXaNWCPQQK2QQna+fgOL+z1sP8rk12b2j6tprfE9qooB0IdLU2gB2kWHEPclPABte/0KZemlNkPrHgctixy92aAI8FD3gU7laKbWt5LqD/Ct5/DiVAoTlsR1xGCKRdwLjrdR3/5sYnRycxbxZqFNIeQwNN+r7h4vR26Ak7ouih/KKLmZJ+taIQeTyrIkD09zmnu0WHghZRJY7f/HFHnCjq98i+CgnvHZaf8rGcxrXAjO/Of76N9n5Vg3O/ucDf/oQVb3x5WUgVvumIurvtNOuXpJ8atSNW0iBOhP/GBoqreTQm5hXO0K3Sq7pGycvji25j6TTI3aPqObIiwcsyNF+LsddlB5+BDVIWKgNMxPMT6NjAF2yYDKloyapQqhWjMGTTf9dyfPjU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(44832011)(86362001)(5660300002)(36756003)(2906002)(6512007)(6506007)(186003)(83380400001)(26005)(6486002)(82960400001)(66556008)(6916009)(316002)(66476007)(38100700002)(66946007)(6666004)(2616005)(41300700001)(8676002)(4326008)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0KJ482UtodE9bSZP/9jg64aKGAwTeLREETUqcx37aO0quqiFge9vkwUa/N0o?=
 =?us-ascii?Q?WbzVbEGuFgKXlP8kVclTflCu+Bmuy+5Lc7K0rQJa36/ss4lJp5TzJlSt5mU7?=
 =?us-ascii?Q?s/BDVDYMPS7j3PDV8IQIl6h6eZRER17vLZvUVZJQ/ZpaYZn62vZDn/nNHF1/?=
 =?us-ascii?Q?yiqOxqxvPAVe2MrtC1CAFWz6IqTuLCAVF8Ln0Q6DScFEG1k3NlyKnvrg7fNK?=
 =?us-ascii?Q?znGm/8vuWhbAXQmh5ME9BcHJr7bR38rT/c5jAxQ2MTbUU2Gx6jZMfTLVmsJG?=
 =?us-ascii?Q?JWDabbMRf4tEz7oBpSRYnVN+YerLrH/tg6PC0uEs2KV18V9h+Kb+y/+6urUx?=
 =?us-ascii?Q?R+yKBs3Aa2iMtGp+kpcSe+rI0FrAwXsMfHPlE7AP0hg7qVcexro2db+S1Jfj?=
 =?us-ascii?Q?pDL6dFztO2SaeFa6nlVq0d1FWN7ojubiRF4c2P1V9uJAY17WxQaYN3mncOvK?=
 =?us-ascii?Q?je/6azaUghocmInzoRFPMUe547Fi7JpAJ7dca/+eO4q0zBnZt98DDahXPW58?=
 =?us-ascii?Q?r8ZmtCY/1dVKL+x/00pnUfofUb1JN4xvo0vojE4luSoca40EIpK3N91mTBaj?=
 =?us-ascii?Q?R25eXUtUi2YXlCh0MJnk34++VJWJr/3etm55x3fOdY/5d38wvrCZTmEnYKFu?=
 =?us-ascii?Q?VlTjVzKWTal7+qMr/Gv3cPOBJObwblp4hhH6pArsw6zpoEfGg5cJrcJEpru5?=
 =?us-ascii?Q?36/hBLk8JLb3TKxaevgwcRK0RSrycMEkXVkK3ptqW/DSxncUqkVXgwhLyyo3?=
 =?us-ascii?Q?kS/Qr1+ieqd+LWalZP8sBxgYRw4aD+oXxOxq808ZQQ+xQtg5ctcpEUP1LBOE?=
 =?us-ascii?Q?g7eB+EqyuoA2yWApAR4DwTwxXGAQvmaF2g5drtLT3yqgmC4ULLKJlqK4RFuc?=
 =?us-ascii?Q?yycJfiNo07q2yihiHWfLWK6a+rN2Kbwifb1b8ofOcGXxrAQh6lfQBoJV5SK3?=
 =?us-ascii?Q?FR5WtUek7BtiuxKvhi/sT6q38czX6A521UzJxaSVZIa7hHJT5tqiAQ04pUq7?=
 =?us-ascii?Q?2XznTiWO9+87G2RAxMlYZ7FyQq5KCDEueY8wM5HWqXFwYdqwFUQ/OgJDLOdP?=
 =?us-ascii?Q?d7PbmsV2YxGQ2cq8SrTwDrl3UQ8Rf0NOywcTLAmBu96MhTOKZWsrJ3TWnfZq?=
 =?us-ascii?Q?ldA5pMKSA+sz+ullh4R2NtYWHBk1edaRMBtsUAkn2JxL4CUD2RYzpR+e+5Ya?=
 =?us-ascii?Q?uTIPzX4TOALOz1R2GDYmdqt+jRxvMcpygqsyrBe0E/xLcAAVfajtPkJYvYZg?=
 =?us-ascii?Q?k9PobDBW8WWTzRjSxm98FIR1Rf7c0R7Zp+r3zByEygLfbn2kfOq5qHnBi/dz?=
 =?us-ascii?Q?8Mrt4s6GToY5pQQfxK1s7sWWqZaBs8KTwJobrHmHloFkmu2Dr3lUKrEEXjr4?=
 =?us-ascii?Q?Xzr2o+xDVXz3IGjyMYqWa++LYwaZxuBiP1W5gge3C5xpe8IK5FO93RQo8woa?=
 =?us-ascii?Q?X1MI8KsyNMm+GRNIoOsprkEhr3iL3x0bnVgEhZjf29CIfl7Iih+l+A8oVKaa?=
 =?us-ascii?Q?etVDgCne+V2UaxZN+lAOnFrpnQsbdWHIZnBpLmSd0pX4r9l////AtERo8E/5?=
 =?us-ascii?Q?5ozufuxvXxOWfLPsAjJdifq3gwN3tG2mKZHCjk9c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 022da0d5-1dd5-4507-5d66-08db7ef4d832
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 14:17:07.1182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlPbsy2he/B07xPIzMhgx55UKVSQ5ZTwZv5E1V+YgqjBLfaOk4zMwv7wSHaq7UBegwmddIzhqDXIrg+UsOMRLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
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
Cc: Intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 07, 2023 at 01:46:44PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Commit 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> added a dedicated gen12_pte_encode but forgot to remove the Gen12 specific
> bit from gen8_pte_encode.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index f948d33e5ec5..c8568e5d1147 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -37,9 +37,6 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>  	if (unlikely(flags & PTE_READ_ONLY))
>  		pte &= ~GEN8_PAGE_RW;
>  
> -	if (flags & PTE_LM)
> -		pte |= GEN12_PPGTT_PTE_LM;
> -
>  	/*
>  	 * For pre-gen12 platforms pat_index is the same as enum
>  	 * i915_cache_level, so the switch-case here is still valid.
> -- 
> 2.39.2
> 
