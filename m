Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA069B030
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E2910E1CB;
	Fri, 17 Feb 2023 16:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEE510E1CB;
 Fri, 17 Feb 2023 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676650050; x=1708186050;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XEkZSchF4ZjnmEkTCXpesmtvFD7UvuYtf/+v7RSjcV0=;
 b=cSi2AwH+tY4GZs34Dv4SlV+ZqA0VMEK1gNGSdiTNtAENU1oREnUuXYBS
 414quGMflCNL/7JOo/YjUn5NrR4/wYwKOfUD/xJu/xq6ykMPLOsmCOp02
 1AMrFrM3CDaN9rq2YVP2GSUm5HoecgdyjI9xWdD8C/GJURwa3X75hSowu
 91g8H837tH45Ja4R9eDFaz0+gmbXDm8i0lKtDSx8WldZoRfmUVoQ5N59A
 A0H9HVfuQNQPmcHiRcNfAv8Q5t9/3kKqHUmjmhJt/Rbl6hIKXGLIDJRjR
 1x/nvYN/ofD6hBM7Sp6vfcZTPSp+y4G5IW018faAde2nTFEdwMTlQuP5F w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="312385904"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="312385904"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="703003029"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="703003029"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 17 Feb 2023 08:07:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 08:07:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 08:07:29 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 08:07:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLdCdE7Fh9/Tba3qhic57aGRcb3M0wjmCLvM5H9s0+Dwsr0yyGWCbQO/FHaBbitJpO1ex8MjLvVH2rERzuKduP6KzI4VraBU3AtfXbvkOHdM5Gu0hHYJ0Ppl2m7sZgdrC9kTr5JkVCWALMD70rLomyyqIjHB5DRVNKH6r4eGE5LpG3LcEzy/qHAFodNNhxH3k+vZh4iqPVHSE6mFv2JzwICPC8PLj8vssSEfbd/S0jV8nt49uagGnpi7BSwFXCOBE4q9YBwUMsjgV84FL6T9stZfpRrNGF9m06RI7tH/nG844N+dFJ/7XgvRMzrAeimrVaRyL/5UFNlhv0PjfhwGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIO4FoTb8LnX3H7+bbPkSqfzmmJoPAgkgTF5GX3L/Kk=;
 b=S5DmbfJ1GCsrGrhmVpeJMCb5OmYGzwDvy5RD0g0ObxJgMJGP810wTRvJSJ3DTnL8LA+WaO0sRpl927U4XhCLXcMQJXoBMeTI2u1pqBRUj5iEvL6JEj8O/hEuexUmhLFW3lmPAYUc3GegvJyRWn9QWjdG8J6vdz1bgQnRqO485XMWi0iCtOcVjVaz+2w/a7hNRl7f7dNTGQMfVKDlJPu0YzuEB9ThvxMIRkT8s+HG98yrProKeOGzeouZChwlVq/jIChnDPNtaJA5MzUFjWbTX1XkC0StOToYzIMUEFqzNUwJ0yhYsjoGO9BOcV8ToYycJxPQAmK1wnhUtLt7A7CSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 16:07:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 16:07:27 +0000
Date: Fri, 17 Feb 2023 11:07:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/i915/guc: avoid FIELD_PREP warning
Message-ID: <Y++mOIxOQFCmchM5@intel.com>
References: <20230217124724.1324126-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217124724.1324126-1-arnd@kernel.org>
X-ClientProxiedBy: BYAPR07CA0052.namprd07.prod.outlook.com
 (2603:10b6:a03:60::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f5f1c6-ea0f-4856-3cbc-08db1101109b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChEfS7eHantRjLECByi2Bhp22XN2IQpKSZ5pIV9GBe2Os0HG+bTReuSU7aNPrkQGf3Ro5mk4RhyZ7gE85gnMo9FZizYS09vpgZiklCT4Rgguzq1xfaDPPchLAdmCIyG6o1iIvE/Xwkt0TC+iK/T5xV1zlgnQzZwBTdqrXx41USUwVmb7jRO7n5Bm9mqzQtY7Degm4AnB2Rn6/TJ0S6QbAF6KziZRiBUarjLdZhzi/a7O8mc09II6iHOQU+bOQ2rka+0uSVYpcEktgiIGX3WLZhQR7WbQukvxN1BapDmCnP2K5pVdS8G5yyHhnt06tDjDzckKm6d1S0C9H6u3TLKyaChrxof9goAIVGnDQViUtuT/noh9cfUGtIVki4YGlJn7OvRYy18kB4Jw4Z62cQotvsq/q3qM8Yc3a73gWI0t3PuoPQ8A0UmStDz5hlORfEx5/KjWWehXugwv+kyuy3ypHTlFUjlJgF4P1lRxSA5ED5gkPVxJwK6cw8RVNvRCo7kH6NyM8pusQZst76zM5JuVg7s6Nl63QVF/jWQkYL3tJjdB3SJI/CAGaC3SgDG12LwiDb6ICrkpNnrJdo2/M2HN58R8rggAvQJUnppJABckn1WfhpoU5HgU6UynvdtQbMdBKOQ8KWKyDi7RGgAp/xHvaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199018)(44832011)(7416002)(36756003)(5660300002)(83380400001)(6506007)(6486002)(26005)(2616005)(186003)(6512007)(66556008)(6666004)(4326008)(66946007)(82960400001)(38100700002)(8676002)(86362001)(41300700001)(66476007)(478600001)(8936002)(6916009)(54906003)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c6DKaHmP3eFwudk7+bOdC+uBNQJxWhQ8CufNSjbTMReOgGkrQGrqMhu1qy6C?=
 =?us-ascii?Q?BOOArGJqAstKWqkHx6Vwc8GjQUdNzsdJCIDW0DQHDrTJd5kJf9iwjCqhjLSA?=
 =?us-ascii?Q?oiKJe31eQe3DBLkIBhSZ6BqpzlHWLtBMbm9nJYQNNMhPc6zdNvB7lN5ChX+g?=
 =?us-ascii?Q?cLDYowBH5FafyGnPO8qEgvxuS/YG8Sc2D5sCT3U5Bbtz5BPH4t5TE6CZrYTU?=
 =?us-ascii?Q?6KaGx2hGT32HnP5R0pE78nK+ShJh4vpr+omWwr8UKWXdtfBOwQTqard/E1MS?=
 =?us-ascii?Q?W5YtZwWMpQ6j/58T4TS3PkDSVLZCdCXekFgWlAO6bvlBPVEaV300pAQUJu3A?=
 =?us-ascii?Q?aD6oERbsB5414bDJcVwpCcUsA8lDO+0zyPtY2YBywZqXRqv0mGrnE0FJJUMt?=
 =?us-ascii?Q?JQvDEMTsG9ZRzW240b1F02ah/ZrUp86Wp3BXxkB5C0JIo9db5XXl8pnA2ib7?=
 =?us-ascii?Q?osS6I0cTJzD6GCwGDnGx8+uuH/FtcQ/UHfFW3T0mVvtB9TXD0cHDhy8dVBzc?=
 =?us-ascii?Q?aMSQguNYUPeqBuwG1BrY0w/l17AR15kMpQDqkb269nxU9GleZBgmmDiTyoHB?=
 =?us-ascii?Q?/jJXZOPWflkWfeSHA/x1oLrkLNOrKJPWX0H/X+dz60rFHlFlgHqg2nhmE6/p?=
 =?us-ascii?Q?T4hzuTmRDiprK1c6Luy2ehxax7mWztyn8L+zimh6efILnsyIpwanWvbaiS+A?=
 =?us-ascii?Q?fekY0CzdGE0iUrLdvGxl3sAw+DIsvg4/8RQFyge/kvqHfLcGVGSAzW89WHeR?=
 =?us-ascii?Q?JT0DBQc+vCp+/JV0cBbr0OOlChsD1p5ZoCywaYttzAc/CJZBvwW9Wtg51MWT?=
 =?us-ascii?Q?nYwUxULsFIt0CgxaxMljENB+0mSUM7VUt0vJ6OSDfGXtYg1irWOF/2pcsM8H?=
 =?us-ascii?Q?JpMt0X8Ql21YZYwtDFHU0Et6EnrV7yYl5S7Os0tuwxj5DGb4eW1FXCTeXwL9?=
 =?us-ascii?Q?Ts1PN1DVTZhyhzFQz5mu45FPV2NwtU4hLjkvF3OHId0tJgU0uAnsaCc+uvyU?=
 =?us-ascii?Q?eSZk2MxhQEX0LbX5LqtS+o+gz6gFOoGc/zAv6ODQVLZb/DWS3O6Jb8jQFXrJ?=
 =?us-ascii?Q?PA/xr4vzkVDq/FHJDNjXw4PUN8afeEdDYmzp/wWyqyU+Oby69r/nxtqdvkxC?=
 =?us-ascii?Q?QhVyInlmp4WTj/GS6qT52zEfN4q2GW97OddwbMkRnf+C007qUT4E3PKkLxpZ?=
 =?us-ascii?Q?X0SVGETcGF5x+gYzEFPHAIbqFOVsNP0teVa4FJP6vvMoPzKGG2joxuBQuHbm?=
 =?us-ascii?Q?XI/dl1keXa1kbWVCkdIevCqO3sCmMk5w5zgkRhE0c5M3qkBPvuGPztqP/692?=
 =?us-ascii?Q?ET2Wb1KZ3WecsUPI3XoWpV8Qu8ZywiCgvrzFklWu5XmGRxQf84LqjDR2quWj?=
 =?us-ascii?Q?ouDIB8Q15QxQOrtqgFh4HBGRUN0wyeWtAy6oz/F/3DE2dGOAygO3zTVrqfnv?=
 =?us-ascii?Q?ZsNr17tY5inF2u6eG2NIF7o5kGGqh4RID6I+UmSy/XNDmCzhfTsHW+72viUd?=
 =?us-ascii?Q?dyCcwlhy7lbZKlfYfMxKYwx7Oba/q+QA9X0i9VoGbeHLr4PhAaRGKKzK2vp2?=
 =?us-ascii?Q?v1GdSjjFp/QXTG/goKM+2TA4VcINsIs3JebVyLX+dgMXIsbohkDyJQFquY/6?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f5f1c6-ea0f-4856-3cbc-08db1101109b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:07:27.7586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caIjNIXwnhpjA54/vQzRwR/SahdQe++VTotLlIcYd5t+0MyTecyZaqeaTwJsIkO1YXGYzejLSU9Km+3qDTqhdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 01:46:50PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With gcc-7 and earlier, there are lots of warnings like
> 
> In file included from <command-line>:0:0:
> In function '__guc_context_policy_add_priority.isra.66',
>     inlined from '__guc_context_set_prio.isra.67' at drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3292:3,
>     inlined from 'guc_context_set_prio' at drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3320:2:
> include/linux/compiler_types.h:399:38: error: call to '__compiletime_assert_631' declared with attribute error: FIELD_PREP: mask is not constant
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^
> ...
> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2422:3: note: in expansion of macro 'FIELD_PREP'
>    FIELD_PREP(GUC_KLV_0_KEY, GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
>    ^~~~~~~~~~
> 
> Make sure that GUC_KLV_0_KEY is an unsigned value to avoid the warning.
> 
> Fixes: 77b6f79df66e ("drm/i915/guc: Update to GuC version 69.0.3")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index 58012edd4eb0..4f4f53c42a9c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -29,9 +29,9 @@
>   */
>  
>  #define GUC_KLV_LEN_MIN				1u
> -#define GUC_KLV_0_KEY				(0xffff << 16)
> -#define GUC_KLV_0_LEN				(0xffff << 0)
> -#define GUC_KLV_n_VALUE				(0xffffffff << 0)
> +#define GUC_KLV_0_KEY				(0xffffu << 16)
> +#define GUC_KLV_0_LEN				(0xffffu << 0)
> +#define GUC_KLV_n_VALUE				(0xffffffffu << 0)

what about changing them to GENMASK?

>  
>  /**
>   * DOC: GuC Self Config KLVs
> -- 
> 2.39.1
> 
