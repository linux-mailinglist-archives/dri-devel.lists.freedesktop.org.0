Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09067C116
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 00:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E75A10E3AB;
	Wed, 25 Jan 2023 23:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BA510E3AB;
 Wed, 25 Jan 2023 23:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674690213; x=1706226213;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NX+HGpFLRg+kQTu+o7HWZ4y47EnlY/+WxcitOePNuXg=;
 b=WL6ui7REGUbFw4qO9GwKwIYPcO0C7Y9zy7jj7MmZOIiKZR9ku+5zXWD6
 Fhli9Cmb9pRvvi6XbGoDimcN6RpTKowW2bRC8bCP2ACR+ScgjqnnYfu+2
 qlxRXrENqZHIJRKgkkHmDivm9wDU0dD7Nuz95cGgZy3EvUUysWjzewnK3
 6g2OFD3QD84sLkESOE9Ykwq8+HDQ/DpZEIU2tQRyHfiXxpwKy3yI9fFuA
 /BLzMHAStDt/OEhZ0ilVd2thPuzfnL/TmiiLT9wljtRodZWllO7XNo9md
 Sk14j1VJTM6WWB+DXXwAAyvRH0AuDfX2K1ZrMQkzBMJy2PKfgoeZGaasl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="314615828"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="314615828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 15:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="662662689"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="662662689"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 25 Jan 2023 15:43:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 15:43:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 25 Jan 2023 15:43:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 25 Jan 2023 15:43:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 25 Jan 2023 15:43:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6TCzYqH0FhgFicmdyuG8g28KhEUS/GPpTpsvIG2drvT2E08I2URcpdM3KKvYmIw/aYH9xkY47TlY6eGLSvMV4QccIsG+4gzF5mWQ2UhPerrYoDlj8C1kGv+wmF3tr+EKKq7z0NaBCXHdnql0AJTI4eEV6uI9x4VeSZUDuP793iAuTJs1FZANqukCT7uYUIfivhuvPgFb+NHCdgYD62Ef0FU9ghkXZ5A91Za43fcbhL7LqRHEEw4l8jV8b5sQT/wDPJTrHqpJSRwWrMM49MShz78cjlxeqUeZn4KKf4spQQ30zynIsMLfASVBY5nYkq5FzXWiukpjRjvwvc2238p/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EGwc8bGePanR36VpPvam7m/W/+ZaJsJdvO3y/BZBkI=;
 b=e9FFHxkG7cwtHg0Wwxr/tOM8BtmXwbv8+qdhEGLpv59mXd4e1IxoXzoueVUdc73MB1WXDhVAxWgOGlKV7TSQoJWSkOYliITtANhxpPxTlSk8sut3rsYQFF/WLlV00iUvweGbVRm/Y6MeuOpFbhu6WdnAwMOktBjbNzN5WxILRB452u9mDjjRY96dDg7tpZ1gLQG0r0TpTESo5j6dG1FTfI3YiEbFEZupY3u7DAYkCWgqhH3TSHA9dAvzlMoI0bqqefqSob/Q9ESEh7RKyE2ZxQLaakOtIO31q+dQ0M9seeCSYRvJdFbBoRDGytHb1tfC+CUB1s3RjHte7987mqapgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by SA1PR11MB6989.namprd11.prod.outlook.com (2603:10b6:806:2be::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 23:43:30 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::afeb:140c:915f:6003]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::afeb:140c:915f:6003%5]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 23:43:29 +0000
Date: Wed, 25 Jan 2023 15:43:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/i915/mtl: Correct implementation of
 Wa_18018781329
Message-ID: <Y9G+nlNmglzExuPt@mdroper-desk1.amr.corp.intel.com>
References: <20230125234159.3015385-1-matthew.d.roper@intel.com>
 <20230125234159.3015385-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230125234159.3015385-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::8) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|SA1PR11MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: d5032d49-6af0-4288-ce6c-08daff2df60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AF3BsHfrDmzYp7Dd9YXDxpXE0dgu3I/0bIEGNskUfiV6MXlnopN6ezQNB68MfcKMed5GyU+zVc2TFA3AZxl+byRnHQRe7sHLJzluZuffllK7USyzhtG/RSdCEboOtJkvx4RaeRkr1S95S1arHPcOYqOx+cIR8hXQN60tsFBmmBN24LidNZnlzpz7F1AeMFmHx9HOauGiMjpbgMABrxTEzPFnzkS4YePzMnr7yanXPzjeTmsN2whx8zA0AstqpL73UeQTkW+CF5fOjqsL9qJRSNbVSzNxG7Fzo3JnDIDBv4UYOYsq574y2kp39l4FgUANK5TFj/RP5n3pEGK9hA0pMNBzJK//tWzFGo4LwdvXbjSnXnWwCX09UyJFc6MOhV8UYXBf0jYhrGr9CVhmV3yiK+cZr3OcEITuiqyu1rhKTHcqBorI32SnbNkHaM2t3S/ofe6ABT8evC/8J1fD5JlRqUMcGsa+vJerln5zEh6jOl63sZ1ULTMeqQ7LJNU87vgZUNkJsrrRN2PujE06JqANCKxnM3BFJIfle12g+F1DwFherkSIBPJAutWxqy63Vy2JgS4cGZbfCi7VqYGUr3ZlMYqrCrKMmm5L7DuDPF5pIvgE+/eVr9Kmniy3LmpVozevfGXO7qgqiVgl/XAPCVYVkdkjppfvNudvX58a7yinrGo2B+0k/n/vjEiaM0G8UYA8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199018)(38100700002)(83380400001)(26005)(478600001)(6916009)(8676002)(66556008)(66476007)(186003)(107886003)(6486002)(450100002)(66946007)(2906002)(41300700001)(86362001)(82960400001)(5660300002)(6506007)(6666004)(316002)(6512007)(8936002)(4326008)(66899018)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZexfwpWx8RpT6lmGP7A3xHjm8txtbhe9dM3K002k5AKm8LCEAsY3+d6DadMa?=
 =?us-ascii?Q?7aKoya4S++rynfaytOM0I3LLYL3xK71x+YEDhKjO9zBixA2YLJ9Q/2WKDS0g?=
 =?us-ascii?Q?uyD6BFunvEydMTUF7rF57GJqPhYZk4QqNC74akHZRZQ8XGxMQOEFj33qYEgR?=
 =?us-ascii?Q?R1AQ77XE9Ycq0emb2NKieWEsmmBt+DyY+Z6rtKQ+73cgms1kNb3B+FlNYmJH?=
 =?us-ascii?Q?LaxXmDA9CrLkuNc+5FwECja2lN0f9rjNncYVcvCvVja073hdJEWoo4HYvkKw?=
 =?us-ascii?Q?bzM2IBcPOgH+irz978WxVsTXjIN47cRNLy03Px9kMxyY4XsimjkksKpmoybq?=
 =?us-ascii?Q?V7//oZi8jYALfNmSLTTDaE9Tl/yYg3qcEzrx46zrre9W64VjFtTI0PUvw0aH?=
 =?us-ascii?Q?VOQngU8sP1walunZ1liVa775wHZAWufEfMhegtS8okhgoV8YVaKfA+NeDteF?=
 =?us-ascii?Q?u89kjYz2Pq5YYDWuC2PycMP95e+ZFQRYi04jPn8521Kdi4riPyuaJYcXQJVQ?=
 =?us-ascii?Q?zFiNlwYp1BVVEAdOd5Mzu6Se7VPXn+Z3UVp5k3AkITMdFVc1UCvPcqyxeLcD?=
 =?us-ascii?Q?n/WHHvQGnZn9W8YlO3uC15s69T5clq/aRmWFFmmJjt6cDEe0sEnDoFfhiL2r?=
 =?us-ascii?Q?IkAbbszpLEbIr9JqpN+MB/lzMAHkTEFuRxiXrS52xE49nNsTBLLIcYYEQaC/?=
 =?us-ascii?Q?iszwIr+F4SPGTEPQ6ZX5IxdmU8vxEO4UWBnaFcu73JFIGJCIQAjYqNog+1b7?=
 =?us-ascii?Q?EFfZjbGDb3VHz1aQoorw8rblLImm8oK69VySoAi9ZLgRxaMfSHpDFMRthSWJ?=
 =?us-ascii?Q?j0z2cwzQHlORzgevHjPhKGdhiKPGp0il9HZ52nUF3dqW75onxw1XK+fer/cX?=
 =?us-ascii?Q?OIZ74Cu+CYegKaR+m44HvG8xTH8zKrUjLXtExfVBmNeq7JZX+ANo3lEJd2HI?=
 =?us-ascii?Q?3lw7jW7SfOawfBWw2wrPMlM8rTZ+lN7ACPSOoAF//YYiYXi5bssKyeLrxuo3?=
 =?us-ascii?Q?ZjfotW05D6up+6p3sqUV+pGsqU5TUVXtUT59mqRmp88cgTokgu83xrM/i9LA?=
 =?us-ascii?Q?JLbd16S6Kljo2f/+sxGxSlbK/K15tUK1Zs06/46h2e8QM+eCTlRMqwxhCHAO?=
 =?us-ascii?Q?tZ1upFhnCM7+Jdos0gfBIVQORCQV1WaKNjWzbjvmHV4npeFbSRTw9DkWSZTg?=
 =?us-ascii?Q?8ypPrZ77gk7YjfgHO1edIv/sxIfEMUaqJtGDzLTawo+iUBCBWmwGZg4gWPYE?=
 =?us-ascii?Q?nM0VzGfEIxpdtg/60KOP+MH5O3C9Y5PIBWh+ekxoNFGufcGHJ8cSh3HimmCz?=
 =?us-ascii?Q?trwOF3DxkK+i8GiN8DWwA17heXGCuKWs5WaCsK8pRWvhn/agO4epYxWHd2VG?=
 =?us-ascii?Q?Kgqp81FNmaFTG70O2rb3B7jDmlCMochbbaTZ8dPr9Zjq8svOnw+/ZGzP6tny?=
 =?us-ascii?Q?xWVD7W/mw4BefkETgWwSue2NjR51cdvr8Htjm0ZJq3cGu83IO5tRKdVt7bZz?=
 =?us-ascii?Q?YC1ezfg2OupaYyrKCtPll0wG1vmU8f1F9AcBH0sb5wxwPG6Dbx7zKkExE4uE?=
 =?us-ascii?Q?5BEjACUtdXw+D/8UGHjhRz6U86oMZYZnNaYVbyqrbfLIGL8vSdSO9OlS8Wvm?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5032d49-6af0-4288-ce6c-08daff2df60e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 23:43:29.4685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TY8U13RLWhiypy9YOPwE5LL/TzBuSqp1kvfbTmEqr89xNczesoqsDgY8YK8sgTkdGN6Vur+UMADmzMO4Q0QZJcWZfMOxGQHG5ZshQNbz0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6989
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
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 03:41:58PM -0800, Matt Roper wrote:
> Workaround Wa_18018781329 has applied to several recent Xe_HP-based
> platforms.  However there are some extra gotchas to implementing this
> properly for MTL that we need to take into account:
> 
>  * Due to the separation of media and render/compute into separate GTs,
>    this workaround needs to be implemented on each GT, not just the
>    primary GT.  Since each class of register only exists on one of the
>    two GTs, we should program the appropriate registers on each GT.
> 
>  * As with past Xe_HP platforms, the registers on the primary GT (Xe_LPG
>    IP) are multicast/replicated registers and should be handled with the
>    MCR-aware functions.  However the registers on the media GT (Xe_LPM+
>    IP) are regular singleton registers and should _not_ use MCR
>    handling.  We need to create separate register definitions for the
>    Xe_HP multicast form and the Xe_LPM+ singleton form and use each in
>    the appropriate place.
> 
>  * Starting with MTL, workarounds documented by the hardware teams are
>    technically associated with IP versions/steppings rather than
>    top-level platforms.  That means we should take care to check the
>    media IP version rather than the graphics IP version when deciding
>    whether the workaround is needed on the Xe_LPM+ media GT (in this
>    case the workaround applies to both IPs and the stepping bounds are
>    identical, but we should still write the code appropriately to set a
>    proper precedent for future workaround implementations).
> 
>  * It's worth noting that the GSC register and the CCS register are
>    defined with the same MMIO offset (0xCF30).  Since the CCS is only
>    relevant to the primary GT and the GSC is only relevant to the media
>    GT there isn't actually a clash here (the media GT automatically adds
>    the additional 0x380000 GSI offset).  However there's currently a
>    glitch in the bspec where the CCS register doesn't show up at all and
>    the GSC register is listed as existing on both GTs.  That's a known
>    documentation problem for several registers with shared GSC/CCS
>    offsets; rest assured that the CCS register really does still exist.
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Forgot to add:

Fixes: 41bb543f5598 ("drm/i915/mtl: Add initial gt workarounds")


Matt

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  7 +++++--
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 22 ++++++++++++++-------
>  drivers/gpu/drm/i915/i915_drv.h             |  4 ++++
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 2727645864db..310bdde049ab 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1100,8 +1100,11 @@
>  #define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
>  #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
>  #define COMP_MOD_CTRL				MCR_REG(0xcf30)
> -#define VDBX_MOD_CTRL				MCR_REG(0xcf34)
> -#define VEBX_MOD_CTRL				MCR_REG(0xcf38)
> +#define XELPMP_GSC_MOD_CTRL			_MMIO(0xcf30)	/* media GT only */
> +#define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
> +#define XELPMP_VDBX_MOD_CTRL			_MMIO(0xcf34)
> +#define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
> +#define XELPMP_VEBX_MOD_CTRL			_MMIO(0xcf38)
>  #define   FORCE_MISS_FTLB			REG_BIT(3)
>  
>  #define GEN12_GAMSTLB_CTRL			_MMIO(0xcf4c)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 9db60078460a..4c978abf3e2a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1681,8 +1681,8 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	/* Wa_18018781329 */
>  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
>  	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> -	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> -	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
>  
>  	/* Wa_1509235366:dg2 */
>  	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
> @@ -1700,8 +1700,8 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	/* Wa_18018781329 */
>  	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
>  	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> -	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> -	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
>  }
>  
>  static void
> @@ -1715,8 +1715,6 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  		/* Wa_18018781329 */
>  		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
>  		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> -		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
>  	}
>  
>  	/*
> @@ -1729,7 +1727,17 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  static void
>  xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
> -	/* FIXME: Actual workarounds will be added in future patch(es) */
> +	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0)) {
> +		/*
> +		 * Wa_18018781329
> +		 *
> +		 * Note that although these registers are MCR on the primary
> +		 * GT, the media GT's versions are regular singleton registers.
> +		 */
> +		wa_write_or(wal, XELPMP_GSC_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_write_or(wal, XELPMP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
> +		wa_write_or(wal, XELPMP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> +	}
>  
>  	debug_dump_steering(gt);
>  }
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 48c838b4ea62..4295306487c7 100644
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
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
