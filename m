Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701F68E01D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 19:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADF510E595;
	Tue,  7 Feb 2023 18:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7983910E1EC;
 Tue,  7 Feb 2023 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675794866; x=1707330866;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HryswaQmYhAKyrJSfSKqnvMRWyCWw6DhiJ/6sQ7EMbA=;
 b=nFwxe5UJNIIsfV6RYmk2MYdLHZxMvoY/dhio0FijSII1O2O3OEQDVppf
 8LO1i1QczhfV9nRx+ImghUiT3oKgBTBlrgvrEwfCa5h7K+QrTMAsn2LxA
 UbJ+s1b5rgFuTA2IK7sANYusOtKJQKzltxmaHeXU6WE3H7cp6OOsJ6gGn
 WC+VuBjL9jzYMk+7OeQpUn+lB/XnujjedmzWGJOAHGDT8frA+01uf2eIM
 L2Iis3+SBe4Q3fi1375UIs1xkCtarDl9aCnBnV6DNGHviSKqEeeLqV+vz
 9vSQorzYt2r8f5gfRN9d6NWzH5RGdJf6eR86MifH0JilSuee/R3z+Zx4I g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="391986536"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="391986536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 10:34:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="616909476"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="616909476"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 07 Feb 2023 10:34:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 10:34:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 10:34:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 10:34:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 7 Feb 2023 10:34:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFaK4W5w3/V6nkGeawnSyyBWGQx0ERS1d9BswEUxmwduD0y4MsaV6MPEOWT7TwOQuAlY2ztwUTOtzkv6FmVTM4V/khE5Btf+y8If50wTS7POpPWnMg4JCpajqTAFEGn61UsQdrJCZ0DcVTpXrrJqcfqRlnDxi9fG+HWX7bIAcc0gHo/pvXyz3QG4cppXVEnKQWt/HlhAnGs7QOZBPO3ubk6AVGjDePz08cpSs/6NixF+uytN2EnZ6/f4+BN9TrsR+656LC3gdTmljWtafWeh5T7yyVAgPH2g+eqtQgVMt31Gc3Sv8x3TJJ7gXlks1gayA/A2j+oBzI21AAtYu+xSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjcXoqfkeiH4hyKSfwDhbEdxcTzH3ZJOB18JOQ8/hWA=;
 b=PGdgTcvf743Bbahv0Mx+YU9LMIhuB6ZH5ZBuHj6KxCQj0kSP3vRNqAsT2sH2xOtxXC9W3AXQ1x75HevrvXsnvHIXwaoGfjv4OUJDFU1S2NXdPYouibgOqSaU/oz6awHC+ZdR+aV9xBYtLRcoj4tnG7/BDGoGlDRz2OuUCuBNUV2SGSwYgn3iCIn0qycrej4gyPIMtEPwTY+k+xUP91dDdP3WvZ5V7askHFucVYfxDnV6uTSjnP8cOs+o0XuH957HN5zio9aAzfMBAxK2uGHAsYx2bM/ybrdAxkl1HK4KoqAcA3nEe2HTWsU7A/mwK6d5SqSG0MYdx+lcHzQhb4LzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Tue, 7 Feb
 2023 18:34:07 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 18:34:07 +0000
Date: Tue, 7 Feb 2023 15:33:59 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/pvc: Annotate two more
 workaround/tuning registers as MCR
Message-ID: <20230207183359.5gkrecww4dudh5lj@gjsousa-mobl2>
References: <20230201222831.608281-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230201222831.608281-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|MN0PR11MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 54445619-61b4-4234-0f81-08db0939e573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMnjMfFXaijQSo84bL3NsCd8sIgfE3xWOTCd33AHy32nVwBhM3B7Z/T0eUwLfIDYqHQr7gIJcJBzP4WYp8maVZItzSBPjTazYS4iafR6CxxFg98xHU8f0g0cEyx8CTqcDKYI+v1NoWDpdOONHVO/EYTBzffUJ8UnLQp0cRKHYZNF1FZNlXVWFQOmZ2IiAX9Kw+PxmTNVyEmKUufxYsEfPCFXi9V/3Gn2P1e34VSm+BpsU3/8iNXxqyMQpPrNxyo52ttX1sbXAru2NJxK2HlAJsNZeDPySP8EFoPAFCidkVnnPNvgzbb18sZu6Fns5vjgElwUXgKzGbqXMu7VS8bWDzY5RfZSxzhD1ezECy+Ns/Jr9DyqlpSMEr4OvzNtmnDqwcSA8BFCD1JPZjQTtsbmV7dar6yc/eYKjBdvdpnMKGSaWzbOwfHwwFxHyFMuQpcq9Y2HvloEXTes8vBfFk454ugf9TbMowGZavnscKgBHmacGMFo8L9dUwoQwY8qbNCZ7+EXTVqS86/7fZt19kcDIkxbcyEZKz/H96iaTnE3GLGsqsV2FQnaTzU2JPcRlXQ8zV+VbJM1S8i05UBw5WCEjNkp0K3BdVUa5NCusqbNdK6JD79WazhF/KBXwhvxtGH5OMDM5do6JLD/a+Tpr9oqxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199018)(316002)(33716001)(450100002)(8676002)(66556008)(66476007)(8936002)(66946007)(4326008)(41300700001)(5660300002)(82960400001)(86362001)(38100700002)(6506007)(9686003)(6666004)(186003)(26005)(6512007)(1076003)(2906002)(478600001)(6486002)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tIkO5841k2Nl/Di2Nd/RKP1usZJkCaraYIk4bvmVrQ7xXSoqFnL6uFqSAasM?=
 =?us-ascii?Q?RSXB4p5pylFVQmyFvUBnmyjk7Xbfxq7zmBXAMTNkZOEpoTQVS+yY5fyIiK62?=
 =?us-ascii?Q?yGtajIBiJfWOgmKPpM8WavrzXFOaYpz9wvtV2Yu9OkykNzk2Z2imwGNJUkiW?=
 =?us-ascii?Q?4d/AvLAgBTDbHpsojES3AtQdmqqMWwr+BDv0FBSQHQxqcMtirJ6dQ6KGDhBf?=
 =?us-ascii?Q?ET+CfV0XJxgLsETd3yqgFjweZuKt3AW2o+TcBkFqr3dAeRQY15zzrmo/0asg?=
 =?us-ascii?Q?nZ11OjIz76ykXWVKeLOxAgO6NNx6IXZqwxXvnUdcfRELw2e/kHEWv879nSpo?=
 =?us-ascii?Q?2ojCsOLE670z8bGPu17LSFGIIIjhOG30W5iAM5qjapMOqCaeCNkmzH1RDHPi?=
 =?us-ascii?Q?1ALdxb+SnXCjDF38uQ9rrA5Ijb++G8HZz/oFJupkLxHVp2bm3rurY6+EzJwK?=
 =?us-ascii?Q?DQSskOOWGQ3nGJcCaPzbmvuvqrMG/S93Df+Hq+a8nL6ndx0f5IaggYBkh2Oe?=
 =?us-ascii?Q?FZC+2QmNtO9o8SKZ6MvnpdtptPdyJS9eQl5VJ2mRxFcToQC8+8mvAmmBH3Ec?=
 =?us-ascii?Q?e8cnl+APsCUV40yqja7InWvxQ7ZDKJT285ZUtRpyHRvcNnPcdR5sejrIcXu0?=
 =?us-ascii?Q?Dp0yC4Dj49vIbpMtK1Pmzf1bzfMfIK4Ab4kisnyBObyTx/JN5T/MoorRt6Sa?=
 =?us-ascii?Q?4Sy3SnXBgZs9owwskAyE8y7LkFWcgJbbTP6elpR1fHCHXehrnFIGCIZ0ZXbY?=
 =?us-ascii?Q?Uv4hA2CRkNF6PqKLSp5b1XT2gDb4gxj77G/fVUvb8/RTyZVk6CCVbdmk52sX?=
 =?us-ascii?Q?0YJW1MrcD9rfbli64Da/4GpOmDzDAMzrs6SOOpHBsYf9anKlSiGw7jjo3xsn?=
 =?us-ascii?Q?h3NUV8ToEfBHUvBRUCRqtENkvvzEkY6aexHWHXsifTfj6WXTtGV6sMzlKtvB?=
 =?us-ascii?Q?W25jMDHvKASfVVbeiY0E20nyFV9UpWt3MQ+0Yhyn2q6Bu4rvEDFuwe52L+mf?=
 =?us-ascii?Q?UbonQ8Q0qjPJvV5kQbVurZylcYOAW/i6AqJMherqjfJh892BwqEk/8HKSIhB?=
 =?us-ascii?Q?9Bqm1xOKPhWiXudNmCjN/F3czq1iFkyWMi34Hgjmu7J5gb+chSg8UFoLCiID?=
 =?us-ascii?Q?KnaWzIDhBerjL6nqz6YaQOfPx4l+mCMUCO6f78e/IZazFQrRg27y5fujBKXF?=
 =?us-ascii?Q?gM1dhAbQ4EjoAAgxnTwnOedOpINVAMK5xJvMq6gspl0yoXf8hBlWA7TC9pNo?=
 =?us-ascii?Q?J9Vp7TnOotNhnFEjIeUXxY4GX6RbEynXhl/JBnmNULVuWhx2b3tlVTskO4vs?=
 =?us-ascii?Q?4NtAMB6z7nNAJElFekF7/lNhxWyu2+sY2zz1GLGEU7RodPfYlwQTfFIVGzm8?=
 =?us-ascii?Q?siiLO1+pKcNF7TdFLjvpeCoeDc6++iygmfta+mFsM8jqBu7hCDwNhdqqXxRX?=
 =?us-ascii?Q?nfUGvRGddGldzBqXi84HPHfCm31TrAbGzaZtXjKQHwkTzFgfVs5++f1ZSb/+?=
 =?us-ascii?Q?61djYkGhsemG+IPXmdpmBSUk7FUo0NnjkoCG5rLGigmYB5cHF97gHdGz1yXb?=
 =?us-ascii?Q?kr1pEC/E8CwRr7h1MPZ4aQMt2xMlCDl2hLxCj3c3V8X0JizKYMhDJ8qebK9k?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54445619-61b4-4234-0f81-08db0939e573
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 18:34:07.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5Wf/ia/pVaGxlra8xmfHyYUjQPsOwRfy7aRgPLS5fH+JhCStfHzynHLU2VzvGoIyTPsYefYpc3cFM1LotMBeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
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

On Wed, Feb 01, 2023 at 02:28:28PM -0800, Matt Roper wrote:
> XEHPC_LNCFMISCCFGREG0 and XEHPC_L3SCRUB are both in MCR register ranges
> on PVC (with HALFBSLICE and L3BANK replication respectively), so they
> should be explicitly declared as MCR registers and use MCR-aware
> workaround handlers.
> 
> The workarounds/tuning settings should still be applied properly on PVC
> even without the MCR annotation, but readback verification on
> CONFIG_DRM_I915_DEBUG_GEM builds could potentitally give false positive
> "workaround lost on load" warnings on parts fused such that a unicast
> read targets a terminated register instance.
> 
> Fixes: a9e69428b1b4 ("drm/i915: Define MCR registers explicitly")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 +++++++++---
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 7fa18a3b3957..928698c621e5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -979,7 +979,7 @@
>  #define   GEN7_WA_FOR_GEN7_L3_CONTROL		0x3C47FF8C
>  #define   GEN7_L3AGDIS				(1 << 19)
>  
> -#define XEHPC_LNCFMISCCFGREG0			_MMIO(0xb01c)
> +#define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
>  #define   XEHPC_HOSTCACHEEN			REG_BIT(1)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
>  
> @@ -1042,7 +1042,7 @@
>  #define XEHP_L3SCQREG7				MCR_REG(0xb188)
>  #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
>  
> -#define XEHPC_L3SCRUB				_MMIO(0xb18c)
> +#define XEHPC_L3SCRUB				MCR_REG(0xb18c)
>  #define   SCRUB_CL_DWNGRADE_SHARED		REG_BIT(12)
>  #define   SCRUB_RATE_PER_BANK_MASK		REG_GENMASK(2, 0)
>  #define   SCRUB_RATE_4B_PER_CLK			REG_FIELD_PREP(SCRUB_RATE_PER_BANK_MASK, 0x6)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 29718d0595f4..f45ca3d4a07c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -240,6 +240,12 @@ wa_write(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
>  	wa_write_clr_set(wal, reg, ~0, set);
>  }
>  
> +static void
> +wa_mcr_write(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 set)
> +{
> +	wa_mcr_write_clr_set(wal, reg, ~0, set);
> +}
> +
>  static void
>  wa_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
>  {
> @@ -2892,9 +2898,9 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  				   struct i915_wa_list *wal)
>  {
>  	if (IS_PONTEVECCHIO(i915)) {
> -		wa_write(wal, XEHPC_L3SCRUB,
> +		wa_mcr_write(wal, XEHPC_L3SCRUB,
>  			 SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
> -		wa_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
> +		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
>  	}
>  
>  	if (IS_DG2(i915)) {
> @@ -2984,7 +2990,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  
>  	if (IS_PONTEVECCHIO(i915)) {
>  		/* Wa_16016694945 */
> -		wa_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
> +		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
>  	}
>  
>  	if (IS_XEHPSDV(i915)) {
> -- 
> 2.39.1
> 
