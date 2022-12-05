Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111ED643308
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 20:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3D810E138;
	Mon,  5 Dec 2022 19:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1FE10E138;
 Mon,  5 Dec 2022 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670268824; x=1701804824;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PCxCsgpNtAB3dkAF8xgWq4i3NS62MVOJKQw1d3JOzVU=;
 b=EJt9AgrCizrUd5CmyMRevT8zYpb9aHI34xS9YmWSfGqZ9Z6OT3DFdBHZ
 R/LDKX1T3mqyN3NRMScMlUfOe+1gwm3j91eoEYUvbkzvrpz8i2KM25biK
 1X1MmcbWUI3yMKlDqNzTU2Kact+DS9e6ozidhPp9tIwjM5MZCVierSSew
 gUio5kIhtGchMbRJ2Y06oQjojwQwyklMsxQeoWbJ0dZaWIk2NCjnKSppC
 QLKollptCKh9wprfoRz1EjUiQFCh6dOI4bK6/kSRKb9ozH9W5FzebcL8x
 6ylX72D+r5qsTESDv4qm01C1a6l7axeDPV4NzdSTviC5FKdFGgYCWmvB5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="317587928"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="317587928"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 11:33:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="770463375"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="770463375"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 05 Dec 2022 11:33:43 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 11:33:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 11:33:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 11:33:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUY8WDoxitCcPisIkSA8g32fLqE9Wy3rOezyCEdSeVx61IfRb6HfCkhrVvmz/EbtqXa/Uppg37hrTxseOIotCYyzg/gE02o4elJo9ZhU4tbuErHfVYtpB+eqlZ9zqSwR9AKTNDdwhpjlmAq5AcHk5M80Q1ZVg7RFEXLneOvwqqFAiF4APEMLMqjra72C7jwyYaIyhAdHrPZ9cWQReZVvYVpjolGQ52O7OO4JvSiUxHdyk0MV7U4PDiwdGPj8P/NxpG6P0Pjcs5KazvGkuXdRa/v8rVjCkoU8pp3aGnMbTOvLf3Om3V2fNMODN8Z6x5N2ufiBTV/VSEm/rlbr44miIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZebPCMwcV7ynlkC7XGREEyrxOFWQSb6263UOZlCisRA=;
 b=jtK2jCnjG9NmM//kYOIM/z2A/SCAKwHv9K/xlPZBN7pOX/uWPoRaoy+ayf6dcYUy/iHaoBcVyWq6pjoen4NxSvyAmwNAXKzSRvZozbunKPaL3D3YRyNTY+8H1pgqqu6fSkm4z9/gXDSGxD5e+b/0icY4L+8DNVtTXq0T99k1kvWzfVbJBtAIfcgoAGCDgz60XL/nIMgbqdFTkqKJIb0TSRYUtKojCnAJ/h3f6Y5kmMNgUpiw05i1tWXz56/KPETsoZKpAaJtKao82cjq99wE6wFOUCyPK6kLqB/1NCRfKk7musvCXM/VsAVI8gTdVZZBsYbuf56+Yurp2sMUvz7NYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 19:33:35 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::993c:13fc:ebc9:7168]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::993c:13fc:ebc9:7168%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 19:33:35 +0000
Date: Mon, 5 Dec 2022 16:33:29 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gen12: Apply recommended L3 hashing mask
Message-ID: <20221205193329.v6jd7zgej7lm2xyb@gjsousa-mobl2>
References: <20221201222210.344152-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221201222210.344152-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 4154b8cb-f394-49fc-6126-08dad6f799c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UN47hbPU93WsuUm5CYEAk2ufLCgL9ZYSpAj2XqREg3yOzlqDJuP+ufD4FpHFKRmZHI3WloRagZ5ALOFNZz2MCDKV1uaM/xLgqaWd4IpawRTKpW8M+u0aKy6BPkinqfIzGjVZuDkTqIfXRLOXH72aNAlURaSnbRx9Tf2dIT4O54qrPQFOqyB/h7sMkItJV0XoiI20NFUWFgNuomxydG0lXyXoAFtozdAk7hZH+Z1iCXI+LqAIqhvNjBXTFoNd+BkMR5Fkr7FPRwL3fjdOsKWs1RwyYS0DfR1w8JQsuKMaPy9uhYX9RbcdpTTOVxXPIOYD4CVn5KuBJo7YOfEIlSt7+LflRGO+GDW/nQAkyB7WkD5zfA2BK/9uHN1TmD8gRLPEUfLj2gBaqenftxg4cnfQfn2F5BEgLxGFN9mHPs6PNxF7zCsVgP/PpLaajKKhWJ0TijAHxBDda4zN9Ab3G+qqJzOtw/zA0cfJo3SZ9KR8m3CrzF2DeMviCXUBiSZ4uDwJmvaEJMexgcYIQuSHep3PmnvHRkXvfAqjkJ3a/L6uuUX8e78CATUuOn56YmsrsKbeFuZXg4p3J/xBLnkM6ZgqmDdm1C829tA4HJ9oh/EMr7gyf17MV5K+08e7mVjyCisdPCGogeNS6N19GxkkiaSTpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199015)(86362001)(6486002)(478600001)(26005)(6512007)(9686003)(66946007)(2906002)(8676002)(186003)(5660300002)(44832011)(6506007)(4326008)(6666004)(41300700001)(66476007)(66556008)(316002)(8936002)(450100002)(38100700002)(82960400001)(1076003)(83380400001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kgibt3Db9+g/n+O7M3eXGlFVrYMdi6x68d/u+3n/35RvdZoVb/u87D0Dl5RA?=
 =?us-ascii?Q?pmCODxC3VwYm4ayUiA6sCDvt5whA8a9evtU4LQQ7PlYQ4PRAxi3aHD1srFMk?=
 =?us-ascii?Q?BocN5O/y4pdyAC+m5M8tHGMxVPQPOObR6nTCKM44OPJdjku5Mnqm7Lyur0N2?=
 =?us-ascii?Q?WrhZWKpPwbU+sJhT9mg2ut9nj76HJgFcNxJhq8iLs5R0bGpXWffUg8/1oJSR?=
 =?us-ascii?Q?1ZwzHnpZI17Smi+Bi+hnMmn01EWPPK3s2CMoHvCO2mSiuGWMnVJTkVwnG7e3?=
 =?us-ascii?Q?G0crbbZeoM2LsgxMXPU1j0bnhvUpS3ltZvTVV8jUif1bMhBqRqDPpS7E7v8D?=
 =?us-ascii?Q?/fQrhk0D4Qd+7KYnaLafYTxaEtPY+gv5CrHOGCeXE5IAocEr6CsHm9oLKJMb?=
 =?us-ascii?Q?/LiaH7FhWNPbEEwx041y11Ak8sNm1wa46Yayvk43PhbGoKvNmBvWabTtjsxD?=
 =?us-ascii?Q?lDxnD6CedzWEtiWKXrCcUOb8r1UEpDZa77XmQCEas0APhgi+eY0hHzbZqih6?=
 =?us-ascii?Q?MEaZciJBcyY8me48g76Z0RM0pnTdsbMPHwVQ/sEVS8NuxqiVaaI8ijjINXAh?=
 =?us-ascii?Q?6dqpm+u3C5KTmAZT1DpnJmg6UlJEF886Y5dkuzC2XDfiAxiSXK3Af5gqk7CF?=
 =?us-ascii?Q?TAi93kOOTSQkKCYdhUB3McMbz0noeM/2Z3BmpMZBdNbUEE90R//hMwCkSzuT?=
 =?us-ascii?Q?5X0AlY4o1YgjgGbUSCgRqF6qdycpqCuwAzIyL+2CA4aFTZ4onV7l+Ox9Gbh2?=
 =?us-ascii?Q?iRUotmEX+uIn/2dbjEHU++aN6MVYnvcAb4piAJSvmRF/W5sv9uxCxLQf3vz6?=
 =?us-ascii?Q?9F4al+SCw3l8tYjNSFDc7G5T+mlVPjthheOO6TbB/mOBch37A1c15ND8jxri?=
 =?us-ascii?Q?4F9s28H7R2VqJY1+Ut0IKuFBYKWPPInTyap0g2D+mgBU7f0tvRlukAmsVeld?=
 =?us-ascii?Q?XfTUbSYL5YXHXmBpWS+kq3jKpW76qJ0Qx2nKhkblUly5G25RGJRoZ07Uw+wE?=
 =?us-ascii?Q?ndKCgq96/JmgndtOP0z4RnZ1hMs3DfcCyzbBFoyIe6MHYkISrbS/AiIY93Rt?=
 =?us-ascii?Q?wq7yl4e7G08x52yJs9Kpf2xQPwUcs0veMu3p1POao0+8fMn7zOG9oS/t98td?=
 =?us-ascii?Q?iEb1qK7hHgB1D+P3mb4uK3Mj6f0xqhOfX/xYPQASFpR5ycFu9SzJ1bMM1RwP?=
 =?us-ascii?Q?ctmewysjDGTKyj6G0aoLLMvi6JeA4rtct2cBj7mPPjNxP0xBSVB/hzXsF5QG?=
 =?us-ascii?Q?7EISeP3Lg2OVj0NhypmDbYFW/7ofijNgZgwlaD0252phLv1fArq5PrvTk96Y?=
 =?us-ascii?Q?CiAJDR53XWOiP6Xp3M7nZpo1kUF6We7+DQsruLkc2ummX4pqTAFZ8BhD4sE2?=
 =?us-ascii?Q?kz3vWjAxoFA/iQ9yGJeK71F9Wx5IKm7TfTX4l53U7K76gbmlFTGHiRBti5Hd?=
 =?us-ascii?Q?2s2k54jcdS4BmGSDsS/rlpQbpBQNwB8syGUdpE9xbrN0bAljNL61YvYspVEj?=
 =?us-ascii?Q?ssDg4DeKa1gZFy3BZnpNiCQPrbBxZtoMQjB8jszeK52w5wsvHsj4S0gVtl1I?=
 =?us-ascii?Q?TadMymq/nf0jiKQ9LqiUmnWE4KQQ0GognFZF491YBIX6HU5NN5iW4QULPwsj?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4154b8cb-f394-49fc-6126-08dad6f799c4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 19:33:35.5615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QisGaT8yxTtyeuOYb1gh2pQdIFtXJRAavYJkgo4foSLwl1S7YP9OQ2mZu2nXF5dQOPx94Gi3pfA8pnIszsT/JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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

On Thu, Dec 01, 2022 at 02:22:10PM -0800, Matt Roper wrote:
> The TGL/RKL/DG1/ADL performance tuning guide suggests programming a
> literal value of 0x2FC0100F for this register.  The register's hardware
> default value is 0x2FC0108F, so this translates to just clearing one
> bit.
> 
> Take this opportunity to also clean up the register definition and
> re-write its existing bits/fields in the preferred notation.
> 
> Bspec: 31870
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 9 +++++----
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 61a5c9a83b1b..f8eb807b56f9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -958,10 +958,11 @@
>  #define   GEN7_DISABLE_SAMPLER_PREFETCH		(1 << 30)
>  
>  #define GEN8_GARBCNTL				_MMIO(0xb004)
> -#define   GEN9_GAPS_TSV_CREDIT_DISABLE		(1 << 7)
> -#define   GEN11_ARBITRATION_PRIO_ORDER_MASK	(0x3f << 22)
> -#define   GEN11_HASH_CTRL_EXCL_MASK		(0x7f << 0)
> -#define   GEN11_HASH_CTRL_EXCL_BIT0		(1 << 0)
> +#define   GEN11_ARBITRATION_PRIO_ORDER_MASK	REG_GENMASK(27, 22)
> +#define   GEN12_BUS_HASH_CTL_BIT_EXC		REG_BIT(7)
> +#define   GEN9_GAPS_TSV_CREDIT_DISABLE		REG_BIT(7)
> +#define   GEN11_HASH_CTRL_EXCL_MASK		REG_GENMASK(6, 0)
> +#define   GEN11_HASH_CTRL_EXCL_BIT0		REG_FIELD_PREP(GEN11_HASH_CTRL_EXCL_MASK, 0x1)
>  
>  #define GEN9_SCRATCH_LNCF1			_MMIO(0xb008)
>  #define   GEN9_LNCF_NONIA_COHERENT_ATOMICS_ENABLE	REG_BIT(0)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 85822ebb0d64..2f13a92f77d3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2937,6 +2937,10 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  	if (INTEL_INFO(i915)->tuning_thread_rr_after_dep)
>  		wa_mcr_masked_field_set(wal, GEN9_ROW_CHICKEN4, THREAD_EX_ARB_MODE,
>  					THREAD_EX_ARB_MODE_RR_AFTER_DEP);
> +
> +	if (GRAPHICS_VER(i915) == 12 && GRAPHICS_VER_FULL(i915) < IP_VER(12, 50)) {
> +		wa_write_clr(wal, GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC);
> +	}

Removing the unnecessary braces as pointed out by dim checkpatch,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>  }
>  
>  /*
> -- 
> 2.38.1
> 
