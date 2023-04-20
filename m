Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE426E9D39
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 22:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C44910ECDE;
	Thu, 20 Apr 2023 20:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABB410E1E2;
 Thu, 20 Apr 2023 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682022554; x=1713558554;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ypELGQxoGWnrX+0BaITvFNGKAb0MJoiUdUC/8WSfen4=;
 b=nrEx6CYiCyz8iDXZwdSQ30hAZ2WC09QUGRfjOGfpfF1DLwxtTpoO+c/U
 3xBKvO4MC1IFZx10tEA1g1IsciRG4/vV1m+6kzx4sQN9//A2d+3pU3aE9
 s/UWQ6Ogec099iRn6psl8Ddm2O4AbGcU4flYIQXMCyQMWXrq5R8rWjoci
 T5fPCBbGnm16EYbd7CBBio+DgQYt/3kiGv3BRpiCKEO/Y8V0kyxXnTxsL
 lfHBJWD9lPWvLD5QIbt2+gWKtdbLWPwZQjrLA+nb6bsafOZZ2Si5LB4RZ
 mNcXZjAOzstP5G52EDPF/3lGUUe2n/Xh8xKsTp3oBNHaTPnm/FDiWxOHE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344599616"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="344599616"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 13:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021696155"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="1021696155"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2023 13:29:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 13:29:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 13:29:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 13:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gq7VZbeiEdoKbfzfKL+XEsW3Cfu0CUNciY7rpvBF6mN15ItpSiSOrweDX9EFkijSZzJmGN0FHVXMyBwzx5IhD23WHTSv6LBSBVQwDe3fkSx/hnlKqJA2izGqbRvkc54CUxjSmPNEMZOhBpb5q98cBJRai5wKkzqF+mvWXtSp3I1GNMwVN+OVqo99jYDDuH2lmwnLzaUa8oDquuhALtBhCynw+FDlhg0hTWk9IVR+PvDRhF4qUFqQqMKPiTDq2YsNVWG8BIBvDHBIN0vRahnxFKOJL8q3/J5kCYjYlG2PkOwGMQGLKV2QXKQXtIrsziOSogjW/8kCV9OORVlalZAW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FQsEdvQuZ3pjS7ZBq7awh2FcpNcJCR5y1gENnXjyVo=;
 b=VSJ8yLaSztccI14A6ZwCkEI+dG/E4GgsBof25xgaMJc8IVBn0agnYp1Jk8rzGlQPeTGscw71EF+9Y/eGswP4Dc3vtVWOqhHrIVzOJU8SGhEKbja02Er6eKjM5uwHwIVxj0S49ypBTBGfyTGi1NN1RxYLYru04mZYEWu41hl7H7vzuu5YlTphcQZMbN4NjXUrmoaIaBXoxnAMOLLwXZlcxVsrCHiaygWMzvD3H8LGIVHqqWhwWSEG7+8hSUhAbZ50tav7Ql46VO8J02T1KO+ig7PQ7QdYABFjdjOt9f/8gVM7nifRReQL/QqRH3hwJPzYXyAXXtVU2L+NZ19/PqicUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Thu, 20 Apr
 2023 20:29:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Thu, 20 Apr 2023
 20:29:08 +0000
Date: Thu, 20 Apr 2023 13:29:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Message-ID: <20230420202904.GY4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-3-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419230058.2659455-3-fei.yang@intel.com>
X-ClientProxiedBy: BYAPR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b507cd1-2040-43a3-9b6e-08db41dde442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9IRq2X+cRnSqhnrbRWfjXdPZaFMxwxbuTtOdwYeY1CA4X32bsZqmR9laue6g5JnBr8cgnmFNMzBxN4J9KtYhFVCUWUxcRzoHAqKmISJq5s4G4qwIR1Te2K5cXgb94Rb8VM07j2pCy0H4HNDVuzDYcFi1blibiQp3quyGZJnqsxmnMkbNTmuvz+MNa+BbSOhB0uC6WY5v3zOcaDl7FNdBD0Zp6fwR/uBv0cn2n7E1pvbAAGZTJPI3p7dMPsYpJpsLjvA0TSVAb5purbbmoVhj0mK10Z11MypsG+uakX4VneuvTDd00QLhLXcwIqq49Fp+t6RlNbPUmZ+J1QaWkyw1rN6J9SdCyi9GylSMNeiNRq9zRkTcI/JqQPn0oLoTi44i8SH5KykkmplTwKLogOfNoRc8Rs32O2Vc4QpT4TDRrTTrJxZv6BS4fDdWzRaMTYcvsPNy82Zft0CDPmi5yRRybHjxs/0p+4mc7eLXm1YRo7kz2e2XH6Mbgtxs2GlWAIzQ1oTEafOH9yJZHru9i0XioCmjYvQK2AGo24rcT8GhfU+bJiwYn/Pl7xNbFNOlVm6Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(30864003)(66899021)(2906002)(478600001)(6666004)(86362001)(33656002)(26005)(6506007)(6512007)(1076003)(107886003)(6486002)(186003)(41300700001)(82960400001)(34206002)(54906003)(8936002)(8676002)(38100700002)(4326008)(66556008)(66476007)(450100002)(83380400001)(66946007)(316002)(6636002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rWUENIa5pJiPcyIWZIsIk5T3LgPg+15pLQt1DFwsgz2UtsK94ZHPzmg25cKE?=
 =?us-ascii?Q?FZ00YtiABqbGyinooT/gSUqKmUCmTVdvpb3gCe0AbrGJSNZ23MCTWJwnFEdA?=
 =?us-ascii?Q?/xTcfvUWVZgGwkuapxPeqeFgFi1AJ+abGBHOk+QyzYN18Y3I4QGOkbnjErFc?=
 =?us-ascii?Q?yRCFhKychG+mHMZsRbHAMauL308Q1zrICEt96kxUJuHYAwKKlqLAzBE3jq+f?=
 =?us-ascii?Q?mztIRle6APw+B7qcKs7BbZyZXM+MgfkbilRrJEvRHE/51+gNdM7S6ANxzS5u?=
 =?us-ascii?Q?vdABvVlulTzKWkrCZvadnnCj6dTqbRFS39mcZDtOhmaeCUJ2m4ik98SnEzIx?=
 =?us-ascii?Q?hapFpPaxBzPFunN1pueAk6hB1XnZGnVuuPBbxR0LWzdBrdMkJg19jRNucYHS?=
 =?us-ascii?Q?hDXM84yMyU9EoZqVCKHfPADuPHhCPnC/PCqEYQWKxnMuKg5Ujl1UDSvLH7lO?=
 =?us-ascii?Q?cl0LThagJ/wqX2nREPgKcnUte1EHddHCaCjxNsS/vft0WoqOvitHhlEmtB2B?=
 =?us-ascii?Q?ySRgE3aHQDT8k/3Zs9YeAsBk+5f4U6VxMjFBsuwdxDApH44ZjiHjpeVqea1T?=
 =?us-ascii?Q?CPYJwT6PDut1N8wYf+O43dEyrwImUt55Fro027d30+VcQY2KGweMpPvh7Vuf?=
 =?us-ascii?Q?m91baQKl1Z7x6B0inZf609pk7TLyTkAGlqWwPA4dcYZCRQvJniPf6EgttpWE?=
 =?us-ascii?Q?ZKSD3ENQIpL+ffC0RHCpJm+tGtFqX+fJi7CQ0XR4BQAY5i8wCuZBUnxNk3fA?=
 =?us-ascii?Q?2MIzlc0WVVPn5Y+hd3xil+WMTNwZjc0lyIQkvsk4jzd8tbllNk91yrKolb0m?=
 =?us-ascii?Q?XSkrivaQlxUh4X9TIeFjhWWsGFFJ5wy4wtUQ3Ch+jgEcHBRPkIUkn3Ny/n6r?=
 =?us-ascii?Q?mtWcJJwlm8TwNWKG5HtUxg1loe4fmE5dGL8xYhysp0ozcz3vsMfm5N279Y1r?=
 =?us-ascii?Q?PHfx7JMNj/y9WKz+vixFicq2W8jaCayNXnxL2z4Qlt/D8xCDMuKipD1f19GC?=
 =?us-ascii?Q?ymQVue2ElOxNL5a1NhcNg0ibyWtkp9A5mDOXyuq30dd+JscusxwmMmqrucka?=
 =?us-ascii?Q?SbjctGYAnWwnPQUG5RqL+ixvyeY9+PyIYR0lTFFRgOSwXAo3TcdZLyOuGX+v?=
 =?us-ascii?Q?dQVcxSzgMHUKiE32uI+4AGVJria3gGb+nbltiXH6Nx7foPWT4zfNIXX3tc2z?=
 =?us-ascii?Q?ffyU2ls1xZuLWw25wS0DHMLI6xMqWe/opmwsmcbbZWzLIF+Odv+RcG8FA4Kr?=
 =?us-ascii?Q?2i3j/zwxGnUANaHfPKzh0Ymlw8bJgzsVFpGlszAs6A4/JiOICHeY1+SVQeD0?=
 =?us-ascii?Q?1fVPVmKVW0hMCPlPGeLTfJxHCAwpnID0LBc7boGxaO6ETYtV6isgwyspGUZF?=
 =?us-ascii?Q?k4r+I3zw9Q5xA/SBVghiTepNpsMpe0/pyM5IXUkkYdDs59VA5iVfxl52rr+2?=
 =?us-ascii?Q?Va/FXkhfdPFnK0YTCUnkom9nl8NBDzizwYaRg9XKDTrDqq1BRojVUxPs4F3Y?=
 =?us-ascii?Q?GDerZ3ltfM5D+Gj441tP2bld6MFMr5TO/vKL9w7EHaMSaQZJka7rFcF35peG?=
 =?us-ascii?Q?rqqhZLyFxIOpvfGWWSf6DTxT9/Gs20UkP0ed58hS8xopnTeU7DGWbfBNhhCo?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b507cd1-2040-43a3-9b6e-08db41dde442
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 20:29:07.8797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YOkMiP0l8KM24G8VKvCwp2XVcNDIw1J1hFxkIBbIjBaAienfBony31M4rzaa5Pra7AFdHKNe82HwI7Cm+ghPYzyE1lu4t+rFELoDG1V2kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Madhumitha
 Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 04:00:52PM -0700, fei.yang@intel.com wrote:
> From: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> 
> On MTL, GT can no longer allocate on LLC - only the CPU can.
> This, along with addition of support for L4 cache calls for
> a MOCS/PAT table update.
> Also the PAT index registers are multicasted for primary GT,
> and there is an address jump from index 7 to 8. This patch
> makes sure that these registers are programmed in the proper
> way.
> 
> BSpec: 44509, 45101, 44235
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 ++++++++++++++-
>  drivers/gpu/drm/i915/gt/intel_gtt.h     | 20 ++++++-
>  drivers/gpu/drm/i915/gt/intel_mocs.c    | 76 +++++++++++++++++++++++--
>  drivers/gpu/drm/i915/gt/selftest_mocs.c |  2 +-
>  5 files changed, 143 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index fd1f9cd35e9d..e8c3b762a92a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -356,7 +356,11 @@
>  #define GEN7_TLB_RD_ADDR			_MMIO(0x4700)
>  
>  #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> -#define XEHP_PAT_INDEX(index)			MCR_REG(0x4800 + (index) * 4)
> +#define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
> +								   0x4800, 0x4804, \
> +								   0x4848, 0x484c)
> +#define XEHP_PAT_INDEX(index)			MCR_REG(_PAT_INDEX(index))
> +#define XELPMP_PAT_INDEX(index)			_MMIO(_PAT_INDEX(index))
>  
>  #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
>  #define   XEHP_TILE_LMEM_RANGE_SHIFT		8
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 4f436ba7a3c8..2f6a9be0ffe6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -468,6 +468,44 @@ void gtt_write_workarounds(struct intel_gt *gt)
>  	}
>  }
>  
> +static void xelpmp_setup_private_ppat(struct intel_uncore *uncore)
> +{
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(0),
> +			   MTL_PPAT_L4_0_WB);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(1),
> +			   MTL_PPAT_L4_1_WT);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(2),
> +			   MTL_PPAT_L4_3_UC);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(3),
> +			   MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
> +	intel_uncore_write(uncore, XELPMP_PAT_INDEX(4),
> +			   MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
> +
> +	/*
> +	 * Remaining PAT entries are left at the hardware-default
> +	 * fully-cached setting
> +	 */
> +}
> +
> +static void xelpg_setup_private_ppat(struct intel_gt *gt)
> +{
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(0),
> +				     MTL_PPAT_L4_0_WB);
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(1),
> +				     MTL_PPAT_L4_1_WT);
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(2),
> +				     MTL_PPAT_L4_3_UC);
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(3),
> +				     MTL_PPAT_L4_0_WB | MTL_2_COH_1W);
> +	intel_gt_mcr_multicast_write(gt, XEHP_PAT_INDEX(4),
> +				     MTL_PPAT_L4_0_WB | MTL_3_COH_2W);
> +
> +	/*
> +	 * Remaining PAT entries are left at the hardware-default
> +	 * fully-cached setting
> +	 */
> +}
> +
>  static void tgl_setup_private_ppat(struct intel_uncore *uncore)
>  {
>  	/* TGL doesn't support LLC or AGE settings */
> @@ -603,7 +641,14 @@ void setup_private_pat(struct intel_gt *gt)
>  
>  	GEM_BUG_ON(GRAPHICS_VER(i915) < 8);
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +	if (gt->type == GT_MEDIA) {
> +		xelpmp_setup_private_ppat(gt->uncore);
> +		return;
> +	}
> +
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		xelpg_setup_private_ppat(gt);
> +	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>  		xehp_setup_private_ppat(gt);
>  	else if (GRAPHICS_VER(i915) >= 12)
>  		tgl_setup_private_ppat(uncore);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 69ce55f517f5..854ec09fd588 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
>  #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
>  #define BYT_PTE_WRITEABLE		REG_BIT(1)
>  
> +#define MTL_PPGTT_PTE_PAT3	BIT_ULL(62)
>  #define GEN12_PPGTT_PTE_LM	BIT_ULL(11)
> +#define GEN12_PPGTT_PTE_PAT2	BIT_ULL(7)
> +#define GEN12_PPGTT_PTE_NC	BIT_ULL(5)
> +#define GEN12_PPGTT_PTE_PAT1	BIT_ULL(4)
> +#define GEN12_PPGTT_PTE_PAT0	BIT_ULL(3)
>  
> -#define GEN12_GGTT_PTE_LM	BIT_ULL(1)
> +#define GEN12_GGTT_PTE_LM		BIT_ULL(1)
> +#define MTL_GGTT_PTE_PAT0		BIT_ULL(52)
> +#define MTL_GGTT_PTE_PAT1		BIT_ULL(53)
> +#define GEN12_GGTT_PTE_ADDR_MASK	GENMASK_ULL(45, 12)
> +#define MTL_GGTT_PTE_PAT_MASK		GENMASK_ULL(53, 52)

All these PTE bits should probably move to the next patch that deals
with PTE encoding.  They aren't related to the table settings being
defined in this patch.

>  
>  #define GEN12_PDE_64K BIT(6)
>  #define GEN12_PTE_PS64 BIT(8)
> @@ -147,6 +156,15 @@ typedef u64 gen8_pte_t;
>  #define GEN8_PDE_IPS_64K BIT(11)
>  #define GEN8_PDE_PS_2M   BIT(7)
>  
> +#define MTL_PPAT_L4_CACHE_POLICY_MASK	REG_GENMASK(3, 2)
> +#define MTL_PAT_INDEX_COH_MODE_MASK	REG_GENMASK(1, 0)
> +#define MTL_PPAT_L4_3_UC	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> +#define MTL_PPAT_L4_1_WT	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> +#define MTL_PPAT_L4_0_WB	REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> +#define MTL_3_COH_2W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
> +#define MTL_2_COH_1W	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
> +#define MTL_0_COH_NON	REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)

This last definition isn't used or needed.

> +
>  enum i915_cache_level;
>  
>  struct drm_i915_gem_object;
> diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> index 69b489e8dfed..89570f137b2c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> @@ -40,6 +40,10 @@ struct drm_i915_mocs_table {
>  #define LE_COS(value)		((value) << 15)
>  #define LE_SSE(value)		((value) << 17)
>  
> +/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> +#define _L4_CACHEABILITY(value)	((value) << 2)
> +#define IG_PAT(value)		((value) << 8)
> +
>  /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per word */
>  #define L3_ESC(value)		((value) << 0)
>  #define L3_SCC(value)		((value) << 1)
> @@ -50,6 +54,7 @@ struct drm_i915_mocs_table {
>  /* Helper defines */
>  #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
>  #define PVC_NUM_MOCS_ENTRIES	3
> +#define MTL_NUM_MOCS_ENTRIES	16
>  
>  /* (e)LLC caching options */
>  /*
> @@ -73,6 +78,12 @@ struct drm_i915_mocs_table {
>  #define L3_2_RESERVED		_L3_CACHEABILITY(2)
>  #define L3_3_WB			_L3_CACHEABILITY(3)
>  
> +/* L4 caching options */
> +#define L4_0_WB			_L4_CACHEABILITY(0)
> +#define L4_1_WT			_L4_CACHEABILITY(1)
> +#define L4_2_RESERVED		_L4_CACHEABILITY(2)
> +#define L4_3_UC			_L4_CACHEABILITY(3)
> +
>  #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
>  	[__idx] = { \
>  		.control_value = __control_value, \
> @@ -416,6 +427,57 @@ static const struct drm_i915_mocs_entry pvc_mocs_table[] = {
>  	MOCS_ENTRY(2, 0, L3_3_WB),
>  };
>  
> +static const struct drm_i915_mocs_entry mtl_mocs_table[] = {
> +	/* Error - Reserved for Non-Use */
> +	MOCS_ENTRY(0,
> +		   IG_PAT(0),
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* Cached - L3 + L4 */
> +	MOCS_ENTRY(1,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* L4 - GO:L3 */
> +	MOCS_ENTRY(2,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_1_UC),
> +	/* Uncached - GO:L3 */
> +	MOCS_ENTRY(3,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_LKUP(1) | L3_1_UC),
> +	/* L4 - GO:Mem */
> +	MOCS_ENTRY(4,
> +		   IG_PAT(1),
> +		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
> +	/* Uncached - GO:Mem */
> +	MOCS_ENTRY(5,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
> +	/* L4 - L3:NoLKUP; GO:L3 */
> +	MOCS_ENTRY(6,
> +		   IG_PAT(1),
> +		   L3_1_UC),
> +	/* Uncached - L3:NoLKUP; GO:L3 */
> +	MOCS_ENTRY(7,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_1_UC),
> +	/* L4 - L3:NoLKUP; GO:Mem */
> +	MOCS_ENTRY(8,
> +		   IG_PAT(1),
> +		   L3_GLBGO(1) | L3_1_UC),
> +	/* Uncached - L3:NoLKUP; GO:Mem */
> +	MOCS_ENTRY(9,
> +		   IG_PAT(1) | L4_3_UC,
> +		   L3_GLBGO(1) | L3_1_UC),
> +	/* Display - L3; L4:WT */
> +	MOCS_ENTRY(14,
> +		   IG_PAT(1) | L4_1_WT,
> +		   L3_LKUP(1) | L3_3_WB),
> +	/* CCS - Non-Displayable */
> +	MOCS_ENTRY(15,
> +		   IG_PAT(1),
> +		   L3_GLBGO(1) | L3_1_UC),
> +};
> +
>  enum {
>  	HAS_GLOBAL_MOCS = BIT(0),
>  	HAS_ENGINE_MOCS = BIT(1),
> @@ -445,7 +507,13 @@ static unsigned int get_mocs_settings(const struct drm_i915_private *i915,
>  	memset(table, 0, sizeof(struct drm_i915_mocs_table));
>  
>  	table->unused_entries_index = I915_MOCS_PTE;
> -	if (IS_PONTEVECCHIO(i915)) {
> +	if (IS_METEORLAKE(i915)) {
> +		table->size = ARRAY_SIZE(mtl_mocs_table);
> +		table->table = mtl_mocs_table;
> +		table->n_entries = MTL_NUM_MOCS_ENTRIES;
> +		table->uc_index = 9;
> +		table->unused_entries_index = 1;
> +	} else if (IS_PONTEVECCHIO(i915)) {
>  		table->size = ARRAY_SIZE(pvc_mocs_table);
>  		table->table = pvc_mocs_table;
>  		table->n_entries = PVC_NUM_MOCS_ENTRIES;
> @@ -646,9 +714,9 @@ void intel_mocs_init_engine(struct intel_engine_cs *engine)
>  		init_l3cc_table(engine->gt, &table);
>  }
>  
> -static u32 global_mocs_offset(void)
> +static u32 global_mocs_offset(struct intel_gt *gt)
>  {
> -	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0));
> +	return i915_mmio_reg_offset(GEN12_GLOBAL_MOCS(0)) + gt->uncore->gsi_offset;

The main use of this function is as a parameter to __init_mocs_table().
The value ultimately gets used in intel_uncore_write_fw, which will
already apply the GSI offset automatically; the extra addition here is
unnecessary.

It seems this is an attempt to work around the secondary usage in a
selftest (where the value is encoded into a MI_STORE_REGISTER_MEM_GEN8).
Since the selftest is building register offsets into the GPU
instructions it is generating, it would probably make more sense to move
the GSI translation into the selftest itself so that it's clear what's
happening and why.

Fixing the selftest should also probably be done in a separate patch.
We can keep this patch focused on the primary goal of providing the new
tables documented in the bspec.


Matt

>  }
>  
>  void intel_set_mocs_index(struct intel_gt *gt)
> @@ -671,7 +739,7 @@ void intel_mocs_init(struct intel_gt *gt)
>  	 */
>  	flags = get_mocs_settings(gt->i915, &table);
>  	if (flags & HAS_GLOBAL_MOCS)
> -		__init_mocs_table(gt->uncore, &table, global_mocs_offset());
> +		__init_mocs_table(gt->uncore, &table, global_mocs_offset(gt));
>  
>  	/*
>  	 * Initialize the L3CC table as part of mocs initalization to make
> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> index ca009a6a13bd..730796346514 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> @@ -137,7 +137,7 @@ static int read_mocs_table(struct i915_request *rq,
>  		return 0;
>  
>  	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
> -		addr = global_mocs_offset();
> +		addr = global_mocs_offset(rq->engine->gt);
>  	else
>  		addr = mocs_offset(rq->engine);
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
