Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7055FF775
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 02:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58A910E1C6;
	Sat, 15 Oct 2022 00:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A35010E1C6;
 Sat, 15 Oct 2022 00:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665792182; x=1697328182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TXKuqOay9otT1+0AEbR7bFzEEjUTB0f4IQEcHqW2wnY=;
 b=A6OLM6U+bUtzBsV84Gasoi/as4GYf2nSdrTiWAyzzJMnct13msntl9+6
 qpn5WIMCDwdIz6i9J7ot1Ap7q2vkRiKSAXQB2r8tjlU2/33KcFgD+IxkY
 qVY2rXDqjkIlSyVmk5PitgHk6LkzvsW/Xt+bWO3TCzQgt9PDbyFqZFmdb
 wyRhSl9ygh/4odudn73/tQbOCt1kmkp7x90PQxbY2JRy7r0RohExNSmRt
 O5jXv2NxSU983tb5T+ZFN/hzWVtDiuG90CGDAONuFTuUFDoYqeP9zEotb
 DMOFKjXlZQaq/7xosI4HfbC5JkST26qI6k0LRr+bFUJSCbr7kNF3AGr5k A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="332019259"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="332019259"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 17:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="605542570"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="605542570"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 14 Oct 2022 17:03:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 17:03:01 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 17:03:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 14 Oct 2022 17:03:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 14 Oct 2022 17:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRI+XZTbeE5EZGd3C8vOKHE8zyZMgEVdX+d80vSuXAX1J0IY5W5x4Z3AercZfLyfwkOtZcYYb0lYgZGug2fara2NZmqHY54W3IBFBn5lyUHX6luwyJaDIrPMNz4hkSFlt+O3yw06PhN5ID8fkPg2miyWKjw2FxBv/wWn/TtS5PB5/EmRRw/MP3xdeU7sU3IaYRgQpw5iunIjhhS0l8h9TrZeJ5D6P6shJACuSrVTvdnZT3w6uQJQOmi0z7CcWshEv8Z7y6Tx0NU+vqswIDr2pR3vHC2Br44L3LTOSYAHChllCId9KZGZPiaxN3NiJZ845KAMcUnKDnwQOIhf9bTw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOenYtddbsZbpGpe+WwKD7YXJB58v5bdbZzF3Es8mFU=;
 b=Vy3euAUK2VAudNexZR0qWcYHP3ZNXU1zha0yaDOacm0+mIPHjU9i9rzNKpTjIbgten7WxRzSRuHg1tYwKlgPeF6ChqCEUbvgZowKUbEw27HfJaKrQ8+pbuR4jFd8OT42KERmQsBHuSGVsWWIhQzUuFpdJPoH1i5wR4iHk5F8+LVVFuR06hIqOL9x0KYuC+56kBZuFCnZ5/birCkZQbnWDpmSO4uLtMSz2C78NDoW3sD8s/uX6yTG8qSk1OqMtFBKTJ/CWVxKK58dTSR+/yKayId0sPq/wYr6QKAUrXesPuxrSCDaowjQ4nYaGH+IB+az096PgRfeyeLLLC3zKEpoSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sat, 15 Oct
 2022 00:02:59 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5723.029; Sat, 15 Oct 2022
 00:02:59 +0000
Date: Fri, 14 Oct 2022 17:02:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 7/7] drm/i915/guc: handle interrupts from media GuC
Message-ID: <Y0n4sEqNjNnhNxcY@mdroper-desk1.amr.corp.intel.com>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
 <20221013000332.1738078-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221013000332.1738078-8-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6b46b0-fda0-4a98-b04f-08daae409e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tOA6p4ZWFJ91O9Zsn7AJ3UTG3sBnyNfP/48FI1nDBY8FTpY10hroOdUD3T3OqniggAJeqKxgfyfSX3mpVTUpUbKgGSrnvezPtaHXsQFQW0vHJzEQusOKyKy0PCswcG2KqqxJ1rARb1Y2Ot8LgeYS/5WoqGiyh8qkWoif4bu2yUMpwVyUZWydNcYZLlsmHW4mAg8ir0ShjFahw0heDIpfWa0aSHx5y0hjtf7KU4iit/Qe3RLnSJXTXMPH898dYz2BcX85xIOVOZ3YAC3KuUQ59M4O51GJt9aZh7eD31izc1JVp8s2pVlyOmeOkm5S+XFEINiZexILTX9PKVXG5ufVUhdOXC09U1qZY7jRmVMgGphKtO7LR/AUa6jwtR6pUkUTv90bs481uOU4Rhr3kg4LI+mLJWDTVrfx/HMstPXgLU02pAFN/1zWVzbZn1VDnYTX1P9HWrj7GT3/hh3SbDeAixY4h/vB06qqCKvlklmQHdH1vycN/BX1Ljsz45UoLrSqUtzmjo2L7YJzRUW2j66kLxhvGJdOc8jYUlkbf/YFiiOEjUSr/r6w0KqsVdMysqeEW6t9kr8kMVPGT5QsRfvXJrIbvLVgFmJ398oKCF8H2EYkPnaYGMtVJLpjYgTwkcDPO5TzyVPVIuUr1CJIgcz3cwmGMDhgqrY5Q3BlVoNSFbIG2zAqHgi8Z2aq4oMrQlI3HqXqGNBpOiawblnAsCldcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199015)(82960400001)(86362001)(6506007)(26005)(4326008)(8676002)(41300700001)(6512007)(6862004)(8936002)(66556008)(478600001)(66476007)(6486002)(5660300002)(450100002)(6636002)(54906003)(66946007)(6666004)(107886003)(316002)(38100700002)(2906002)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dUrA2pKFLz3if0ChQG+b/O2QnKzXOnENm4aZSmQdAg6edVHZZiDK60lMnSTA?=
 =?us-ascii?Q?N5DCKmjeJVV459bwqpHcxKWuiFBOtuGivAXpS96Gs4D7iOCQaGlzW+nscA7R?=
 =?us-ascii?Q?GwqpfHfxwyPlcExDldNnan7qLoIQjq/5krrwje44KKlmjuSMusPUedil0hiQ?=
 =?us-ascii?Q?q3nasElgq4jhUAZd3XqTq72jY1z4k28m8ldpaa+Wi87xD0vOQCvPi1aOMfPT?=
 =?us-ascii?Q?ib0/7yUZPoeVP0mdY73Ejo+jtSr8UxOAJOSRDnJSKhZGLgF9yXwHo0RSX1Mj?=
 =?us-ascii?Q?Ah0AyR+8L+h9vKQfCEm3aZ7scv0fW0HNdNJNkAaLvGlykZqprXmR67gnAEde?=
 =?us-ascii?Q?7KYdErhm5IviSdU153DzxMpJO0WjgdRBqvx7XBK9bzf1IZfQH3y5pq7fJOFT?=
 =?us-ascii?Q?ibk5w9plRbVTL2Nh5eP3ktgIRCG52zlDvL5u2SDhwfd3aqsMRYbe5gEXJ8UR?=
 =?us-ascii?Q?RqdAhKxiN6qLwbrKTuaLPMDItdWewqMgJXoSAYb1cABVTANY/NlcaudefoXT?=
 =?us-ascii?Q?YdOk9WJIEZfY/oUzG8w5UUpPEAdCXw61BumJh1J9FAgLP8zljV283VPu3kyW?=
 =?us-ascii?Q?zc+fd3hGw6/dnP8M3ann1sCaV5khpX6uFCzdqs2MRStjUQJ0khY37pesJ5Jv?=
 =?us-ascii?Q?xF2V5zaXRWXCcXTqy27b57rtssG4Zvqsgz42LOj54j8r/lAk1JymQ04BBN7h?=
 =?us-ascii?Q?I/sK2k+AJ8vpPFvnbcb195ksWVjnzwH/0mP2DejWGzqW08bNKGGfsY3HWpne?=
 =?us-ascii?Q?REnezX3ZmeqLIDv/+TBpnqoewBorps/ARpOiXOjfO0HyelEjijvlp1RHFa/L?=
 =?us-ascii?Q?DbrYroev0ja5WlYXbzpbprQFAli3a8Pu+s1Hxp5yrl2EsGFn8pS7oPfKrNN6?=
 =?us-ascii?Q?O1gZKxeVSjtcn0kgvNP28hnm+hZOJHEWCSAOW3d3YtvV9Gh8HfwAtbRBxSux?=
 =?us-ascii?Q?oqW2fwrIgxhKym2M7c8E10L0kK14XLLCgInmB6WdoBnkLrT5LP0RpBHio3oR?=
 =?us-ascii?Q?jWlBwksvJMoaMA6Dj0J78hITnKj8w02Zt2sj6LBsQOI3CwQHH3GP0mOaKUwN?=
 =?us-ascii?Q?iFcraXiITs/3kuSQ7ZbrS7e3oa6fSGk5CmXJBXbfcfqPFtCvyTRV/Rfu4V1D?=
 =?us-ascii?Q?LQ7QKtK9FoGtOaVYKQvJLryICpGIRvv1IHoSQlnDk6inxePk5JwYanKDqiKf?=
 =?us-ascii?Q?DGetIyTV1m1GGCp1fu5afiqAFC/yUcs7q9ftNPTm/k4PeNjO6+DrJBCvt3pj?=
 =?us-ascii?Q?34/kmSlUO7nYCmG81HLlbPt68GQYbHaF6Qv3VZ1w0yKSS2g/nTbF6KKhWxdX?=
 =?us-ascii?Q?tlUDCK1eZeVRB7qYbYXYmYgfk87UUO2Yui6VyTXydCkDkG72rXpjOj/EwO6O?=
 =?us-ascii?Q?DJRFl/D3N8Moe33kZDM6HjnLe4Y3OxbFiCpJjEJLJG0VQjBraVZbXjQHjrC6?=
 =?us-ascii?Q?Ny2tHeIYCLCr2fdQRJjXBTZe4DmXoAXWScoT3zxwEhPM62fbUICSBMt/zHaM?=
 =?us-ascii?Q?RALbVlPi610NGV03foAz27QPTtS1hHDpy00oxBus8gkCT1CyGdyZFYfnTblQ?=
 =?us-ascii?Q?FRhMFEdf3Xesyd1CecFdmYYaaK1c3Kvh1bX4VMZkkSk75UIHvffecNdhJqMZ?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6b46b0-fda0-4a98-b04f-08daae409e8b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 00:02:58.9628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smwNgbeJkuLZGqvt3Pe4BUUCuCADJBQa9kna1G1uFqHWHBdF4B6dOkIG3L9zIcTBC6W5BDkmioXpkx6/8doZ8D6ML1MaRpX4/0Obe2Fgmng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
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
Cc: intel-gfx@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022 at 05:03:32PM -0700, Daniele Ceraolo Spurio wrote:
> The render and media GuCs share the same interrupt enable register, so
> we can no longer disable interrupts when we disable communication for
> one of the GuCs as this would impact the other GuC. Instead, we keep the
> interrupts always enabled in HW and use a variable in the GuC structure
> to determine if we want to service the received interrupts or not.
> 
> v2: use MTL_ prefix for reg definition (Matt)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 21 ++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c  | 29 ++++++++++++++-----------
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h  |  5 ++++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c   |  8 +++++--
>  5 files changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index f26882fdc24c..f6805088c0eb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -17,6 +17,9 @@
>  
>  static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>  {
> +	if (unlikely(!guc->interrupts.enabled))
> +		return;
> +
>  	if (iir & GUC_INTR_GUC2HOST)
>  		intel_guc_to_host_event_handler(guc);
>  }
> @@ -249,6 +252,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  {
>  	struct intel_uncore *uncore = gt->uncore;
>  	u32 irqs = GT_RENDER_USER_INTERRUPT;
> +	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
>  	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
>  	u32 dmask;
>  	u32 smask;
> @@ -299,6 +303,19 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  	if (HAS_HECI_GSC(gt->i915))
>  		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>  
> +	if (guc_mask) {
> +		/* the enable bit is common for both GTs but the masks are separate */
> +		u32 mask = gt->type == GT_MEDIA ?
> +			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
> +			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
> +
> +		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
> +				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
> +
> +		/* we might not be the first GT to write this reg */
> +		intel_uncore_rmw(uncore, MTL_GUC_MGUC_INTR_MASK, mask, 0);
> +	}
> +
>  	/*
>  	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>  	 * is enabled/disabled.
> @@ -307,10 +324,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>  	gt->pm_imr = ~gt->pm_ier;
>  	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
>  	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
> -
> -	/* Same thing for GuC interrupts */
> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
>  }
>  
>  void gen5_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 7f79bbf97828..8b597a918f24 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1523,6 +1523,7 @@
>  #define   GEN11_CSME				(31)
>  #define   GEN11_GUNIT				(28)
>  #define   GEN11_GUC				(25)
> +#define   MTL_MGUC				(24)
>  #define   GEN11_WDPERF				(20)
>  #define   GEN11_KCR				(19)
>  #define   GEN11_GTPM				(16)
> @@ -1577,6 +1578,7 @@
>  #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
>  #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
>  #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
> +#define MTL_GUC_MGUC_INTR_MASK			_MMIO(0x1900e8) /* MTL+ */
>  #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
>  #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
>  #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index b3600be61a9a..09f2a673aa19 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -98,6 +98,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>  		     gt->pm_guc_events);
>  	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>  	spin_unlock_irq(gt->irq_lock);
> +
> +	guc->interrupts.enabled = true;
>  }
>  
>  static void gen9_disable_guc_interrupts(struct intel_guc *guc)
> @@ -105,6 +107,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>  	struct intel_gt *gt = guc_to_gt(guc);
>  
>  	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
> +	guc->interrupts.enabled = false;
>  
>  	spin_lock_irq(gt->irq_lock);
>  
> @@ -116,39 +119,39 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>  	gen9_reset_guc_interrupts(guc);
>  }
>  
> +static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
> +{
> +	u32 irq = gt->type == GT_MEDIA ? MTL_MGUC : GEN11_GUC;
> +
> +	lockdep_assert_held(gt->irq_lock);
> +	return gen11_gt_reset_one_iir(gt, 0, irq);
> +}
> +
>  static void gen11_reset_guc_interrupts(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
>  
>  	spin_lock_irq(gt->irq_lock);
> -	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
> +	__gen11_reset_guc_interrupts(gt);
>  	spin_unlock_irq(gt->irq_lock);
>  }
>  
>  static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
> -	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>  
>  	spin_lock_irq(gt->irq_lock);
> -	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
> -	intel_uncore_write(gt->uncore,
> -			   GEN11_GUC_SG_INTR_ENABLE, events);
> -	intel_uncore_write(gt->uncore,
> -			   GEN11_GUC_SG_INTR_MASK, ~events);
> +	__gen11_reset_guc_interrupts(gt);
>  	spin_unlock_irq(gt->irq_lock);
> +
> +	guc->interrupts.enabled = true;
>  }
>  
>  static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>  {
>  	struct intel_gt *gt = guc_to_gt(guc);
>  
> -	spin_lock_irq(gt->irq_lock);
> -
> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
> -
> -	spin_unlock_irq(gt->irq_lock);
> +	guc->interrupts.enabled = false;
>  	intel_synchronize_irq(gt->i915);
>  
>  	gen11_reset_guc_interrupts(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 804133df1ac9..061d55de3a94 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -78,6 +78,7 @@ struct intel_guc {
>  
>  	/** @interrupts: pointers to GuC interrupt-managing functions. */
>  	struct {
> +		bool enabled;
>  		void (*reset)(struct intel_guc *guc);
>  		void (*enable)(struct intel_guc *guc);
>  		void (*disable)(struct intel_guc *guc);
> @@ -316,9 +317,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>  	return err;
>  }
>  
> +/* Only call this from the interrupt handler code */
>  static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>  {
> -	intel_guc_ct_event_handler(&guc->ct);
> +	if (guc->interrupts.enabled)
> +		intel_guc_ct_event_handler(&guc->ct);
>  }
>  
>  /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 4cd8a787f9e5..1d28286e6f06 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -636,8 +636,10 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>  {
>  	struct intel_guc *guc = &uc->guc;
>  
> -	if (!intel_guc_is_ready(guc))
> +	if (!intel_guc_is_ready(guc)) {
> +		guc->interrupts.enabled = false;
>  		return;
> +	}
>  
>  	/*
>  	 * Wait for any outstanding CTB before tearing down communication /w the
> @@ -657,8 +659,10 @@ void intel_uc_suspend(struct intel_uc *uc)
>  	intel_wakeref_t wakeref;
>  	int err;
>  
> -	if (!intel_guc_is_ready(guc))
> +	if (!intel_guc_is_ready(guc)) {
> +		guc->interrupts.enabled = false;
>  		return;
> +	}
>  
>  	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
>  		err = intel_guc_suspend(guc);
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
