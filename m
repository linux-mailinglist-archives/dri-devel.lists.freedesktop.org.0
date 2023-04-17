Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 925F96E5552
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 01:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908710E63B;
	Mon, 17 Apr 2023 23:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE86910E63B;
 Mon, 17 Apr 2023 23:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681774582; x=1713310582;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V+6iaG07ko7zpdX5jgWAafRG/+1ZWqxqXK6lC8udED4=;
 b=A9adu7aEUkZx6WOAksxwzW4X0QHQhgbOqyoUfBcEBPrOhPs7bb4KuNnM
 FHvyRktzlWw7Z9nANQkyGw+wSSA3pJuBUxVYPbgKewtnhnvkgdggzVPvb
 usBsrLUCElXE4KDASdh3fJa6moA6Y5nTEhFG+qdnzZhmCSAP56we46+Ok
 BA3ALX80PDSxZNVCXgca9Nh1vDXd5EcwwO2iJllc4Y+qcWxMV3ks8VgdZ
 B9IXht/070OiUydYb7rrfNvO6cHC2AT+5YFsZaDjqsTz1ZylHOyX/MCNP
 2rc80B4EkMJ3Wroh+cwMbwN5082ex4sCqgBRgpMeOBn3isLJID0RrPm8F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="431319771"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="431319771"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 16:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="802315847"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="802315847"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2023 16:36:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 16:36:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 16:36:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 16:36:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 16:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqGVWm+8z6HYldZZcCZmSWLkIgNxAbiokZGHA0VDbxu11vsv0nHAeYJPj3wsG1coz/rAPvKXqourn2mmfDCVmZJGW63OdAM4kKcg7o9QKJK9vheJ/2aF/4piu1PabRglKwnjAtebzNtPCNJd2wpQYaHRGxySTC6LUIeDTbLIL5kZcppewIl0xjcNrAxGr9H1onKGH9KqJR3P4dAZYMvQd8aN71e+QqIRmzuIJTXWPLxoVYzo55+0EO+t0Onam7NSw9Gjr744HldbZs7s+yTtTEwVdeeOogUDvox+irGjbfO1jkL0SKFZfMcUKQxUGuQAKu/5mdD8raksa/11K17WmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8r5K2P0xZueNh82ukz857OrxdVD6YKEFeNHKRKWIXuc=;
 b=G1qzpfehvLM8RafFPOwC/oQWDHL5OI5ltvF7sLG+8aXH5cKwnJnawmTKx2AQafI92w8gSGJXP/I5aDhHlr49MB1lU+6N1EFOjK0OFQidb1SqCuqs6/6vjOciIlI8m2KVXPkw3eY/iB7rkfsorr70npZ0rjZo602JFWLP4eTtiVP2SVl4zFwu4rsBZz0HEiZ1FAkYhtL5KmMt85L6JLCwmHk9e4bqoV5DzmTrL/ystL5Bi0wGQ5iOquDNE+b6hNwj48kGSAmNdMNrXFwOU8qjimIp7hqKtckAwNiuwZhA8/Fq+bOEf/itMwwvCC53JQQkEeWxxX3hLsmMSMi9Wbjg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 23:36:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 23:36:17 +0000
Date: Mon, 17 Apr 2023 16:36:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4] drm/i915: Make IRQ reset and postinstall multi-gt aware
Message-ID: <20230417233614.GD2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230417223443.1284617-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230417223443.1284617-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4518:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef5eb7d-f980-484b-68a7-08db3f9c8a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +HQ676GiS6eOtOKkP/mFFLKb1hEP1FPg9afcV4VDJO+alq+/zU9mUOXnAJsVEe8qzl6NKDUbTUWhzQAWX5aUJm11co1Dma0Fq7dEtxmTfOIy59q7bCGA7ZyPPGbm3FagZXiJyhIbtoeBQwDquDY7gVPWkuZ1YsOixP+3peWzNbaGzQPiaXhyeANWtp1cqafvXp5BUEkYs0XOnaMxOr03WWNVNveYJ1tao8QWuG/7cXfEn9baPVHZ0GRbBNH1vjTMh232gE0hqSOWuXsdcdb0KRcCIF7vyODKKTB4uMq/9a1IWGApUbwsmpbwKVlT+z6f4LmqJbwmmnqgBm3fljtInpoM7RYmjmigJ1/X01CiGeeeEKyy5wqZ0L+fwnp98kndHc3aOREuTnbJv10zFA2ZBpoJNLL5Re8YEGzoscmv5W0NzVgzLgWf7DviVkJXbnn8QUpvd1JW2ynMLEaP2k9EYtYDOgZJL0k+3gS0/ZV4GavSIOwUae0wYXTKOC6WKlSJqr0WekMGU7+/KHElj49MKlF0byM52XtZps8jpzFUuvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199021)(33656002)(86362001)(2906002)(6666004)(6486002)(186003)(83380400001)(6512007)(6506007)(1076003)(26005)(966005)(82960400001)(66556008)(66946007)(66476007)(478600001)(4326008)(6916009)(41300700001)(8936002)(38100700002)(54906003)(316002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aq3YaQllYUHGFgPdHUyH8Tk8QnNvWykPE46Qyhgkcuol65M7QKBvindrdFg0?=
 =?us-ascii?Q?sNja0eVjFSNXqhQV1RemNoRdwFuanfIVTsTRHzBTQjg0+ybMLoyvg4bC5Dgc?=
 =?us-ascii?Q?6sULkyCYB0tDTdP/QfDt7+CQia1D1iTEJVSAxiunPWmkrSH6KrH9vCQD9TWr?=
 =?us-ascii?Q?hlI+RkOqhe3bsWIUuVw8VnJ0EtjvryriaMiL9QPwrhZdG6H17l08TdmXyeEQ?=
 =?us-ascii?Q?TjZnbDYkGkgqaO6wNgacBaqHXq5cQFZUTRCvAik+B2aCNpAJhu+shD6uuUiz?=
 =?us-ascii?Q?ChZKj6G4GBcLcaJVxNf3nKPL7Tgt91oUDHxnJVNnBcHBESf0bgSFK98WzZq9?=
 =?us-ascii?Q?+yaYGcQNPAFgm4GyfLNHwDY3er3dT/OKr+YD7jyptK38f3rXTGZqNcG5tk2h?=
 =?us-ascii?Q?/uESdFeKrnpVtYKxJv3fOib76etHZGoCIvBCgpnMpiTpXMhQcEdXBDCdE7By?=
 =?us-ascii?Q?npcXP15IYVPc4tHiZREfhHblvoBhx8W3GcUx9uaAm1f1yCSEE1Jaxa8HsvfO?=
 =?us-ascii?Q?xZYfouzUSdY6pfFg1Qo/UndPHR8Pw5tNnxlTMwQbFqyyIqvED7kriu/LX730?=
 =?us-ascii?Q?xXprNuUiVNgIxZTDwtroPY6NzGYxTvnTD46UGWU+//aew7mg1SQUH5BMjEI3?=
 =?us-ascii?Q?IDyzrBR/BY/Dtt7pnVZvM/WtiWYzmsPmkwEyIwz8GCHD/NE9zmuTQiuAyQT6?=
 =?us-ascii?Q?IpCxcREyyJR8lzr+0qZXhvsEjovxMOgTbsJdyLBX2CaFsGw942DnuQLlE7wK?=
 =?us-ascii?Q?yB1vR0CUMC+a4TpmWpxGM+9whibJs3PXPcB1imYs21Ie2GSJNXwina16yoRI?=
 =?us-ascii?Q?hMmoW9AvLTz7Hc46yVp4s+R0SugyJ5JuBEr/IV9gmgZlpiUyKkJsfngYNzAB?=
 =?us-ascii?Q?KtavEuhS4bm+qBzCPeghqRRMjZtTF+CuKvUmwQUXT37o9SBFfMo9JgUfuUw0?=
 =?us-ascii?Q?Yg95CGL71F5uOVSWLoZxlk1784nUl5qTVQuNLMkivtrlvboPrvA8s4DhU2J4?=
 =?us-ascii?Q?MbfgDQzMlK/jSnw5KAT/Cix6v1JWdGE+EGg1X35ID8CSVjucc49n+N31UL5b?=
 =?us-ascii?Q?hf5edIJv3I3BD/K8Lru9PCTTBZBMEAkvQ4HSqdyV3eZL1JmQZxgoyMzj9WIL?=
 =?us-ascii?Q?1vuuH1DxNoJBWS+MoL+E4r9WLYg0FKBoLIMSF47SNOfLgOpcPV4K3edTg26Z?=
 =?us-ascii?Q?ASmSzLtigv665NVyRbUFY9GH7tmSCVUj3eexviKbhytijHsKBkV50rWUcNCA?=
 =?us-ascii?Q?2OesvQzCpGJc8DQiotjRktCjEy56C0Rxqw89iU4im/c2DmuS8H2+SZJZfU4f?=
 =?us-ascii?Q?v47nmpFSA/WRhPWN7J0QQDvxLnbjsbmlXVpsKg40J+3gJhQ5qaqyCk3d0Jhu?=
 =?us-ascii?Q?yh+6Vn2QsYa3nAl6JglDCBfo4wXd9SBVa2zRnUwnb+Bn3aybl6VvOdcNdAid?=
 =?us-ascii?Q?cD3alHtrhCfFywJXr4Hy1/kf35MMYiI/4UG7D8IkjCwV3SUEwb7ZZX/j94ad?=
 =?us-ascii?Q?popsu/KHL8QrUlqFdcNaADe+0RqGtNd0Vs9v7v1PZI9iBupM+HiYxABpkyrn?=
 =?us-ascii?Q?dqCHbchg6AyzSLhSsjv/O7zLtoEk0gpVtXoc8xeri0/Amp+rmr/OJPda2Rjr?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef5eb7d-f980-484b-68a7-08db3f9c8a86
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 23:36:17.7568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rovTDe/WfhrZQsi2g+0k0cwdGhqvwkZ2FKBHWs6FyYCAVRo0eevjUGG5uIZKd+Td1HoSe0INhyb5Da6ApSTcKSH4zyowc3wutEwGbRB5C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Andi
 Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 12:34:43AM +0200, Andi Shyti wrote:
> In multi-gt systems IRQs need to be reset and enabled per GT.
> 
> This might add some redundancy when handling interrupts for
> engines that might not exist in every tile, but helps to keep the
> code cleaner and more understandable.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
> Hi,
> 
> The rsults of this patch are more than promising as we are able
> to have MTL booting and executing basic tests.(*)
> 
> Thank you Daniele and Matt for the valuable exchange of opinions.
> 
> Amdo
> 
> (*) https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_115465v5/index.html?
> 
> Changelog
> =========
> v3 -> v4
>  - do not change the initial gt and uncore initialization in
>    order to gain a better understanding at a glance of the
>    purpose of all the local variables.

I think I may not have explained myself well on the previous feedback
here.  What I meant was that rather than doing

        struct intel_uncore *uncore = to_gt(dev_priv)->uncore;

as you were in the previous rev, you can simply do

        struct intel_uncore *uncore = dev_priv->uncore;

because gt0's uncore pointer is always the same as dev_priv's.  Since
we're using the uncore variable to access display-specific gunit stuff I
figured that was slightly more clear to the reader to take the
device-level pointer rather than grabbing it from any of the GTs. 

That said, using "uncore = gt->uncore" as you have in this version
doesn't cause any real problems since the actual registers being
accessed are sgunit registers and thus don't get translated by GSI
offset.  You still wind up at the same sgunit register offsets on MTL no
matter which GT you grab an uncore from, and display/gunit isn't
something that PVC even needs to worry about.  So

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> v2 -> v3
>  - keep GUnit irq initialization out of the for_each_gt() loop as
>    the media GT doesn't have a GUnit.
> v1 -> v2
>  - improve description in the commit log.
> 
>  drivers/gpu/drm/i915/i915_irq.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index dea1a117f3fa1..c027fd5189b85 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -2858,10 +2858,13 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_gt *gt = to_gt(dev_priv);
>  	struct intel_uncore *uncore = gt->uncore;
> +	unsigned int i;
>  
>  	dg1_master_intr_disable(dev_priv->uncore.regs);
>  
> -	gen11_gt_irq_reset(gt);
> +	for_each_gt(gt, dev_priv, i)
> +		gen11_gt_irq_reset(gt);
> +
>  	gen11_display_irq_reset(dev_priv);
>  
>  	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
> @@ -3646,8 +3649,10 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
>  	struct intel_gt *gt = to_gt(dev_priv);
>  	struct intel_uncore *uncore = gt->uncore;
>  	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
> +	unsigned int i;
>  
> -	gen11_gt_irq_postinstall(gt);
> +	for_each_gt(gt, dev_priv, i)
> +		gen11_gt_irq_postinstall(gt);
>  
>  	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
>  
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
