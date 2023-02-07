Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA568E1EB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 21:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383F310E5DD;
	Tue,  7 Feb 2023 20:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8151910E5D3;
 Tue,  7 Feb 2023 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675802027; x=1707338027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1pKjqSab4Tl+AxE0VkUC6DGiIeGQoNGESDw6wdzY1y4=;
 b=Zrc7vqm+BkI419ujSZctqdC+qKB0PKoCs0NOHtMbrMqnN44hJEpc5fLe
 BvrdxSZvIp8vcKcqvcifdZm08qWzx6R9hR/iszQfbs1znQDEgWsZXYoOg
 G8a6QRWkcWHHP+NMERLg76bZVeBMqt3PZx3cVs65HEO9QqZBbR9oWnB7O
 wu6n+vEc6tKLYKYS3akUh0emy5IzJ5G7myeltB+PGUcaMpRuYsiN8Rk2N
 sfl7YxuENsTIqQUObkdiOE69Y+DO0+BWmW9gaBKcqOxSzFaKZ0t0T7BfR
 Pi0x7gIwpzXpnyeiF9cifmiONbDGD1UJTJ/9gDwUOsleTx7XkeN9bnetw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="331753829"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; d="scan'208";a="331753829"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 12:33:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="790931986"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; d="scan'208";a="790931986"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 07 Feb 2023 12:33:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 12:33:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 12:33:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 12:33:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 7 Feb 2023 12:33:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7hBXR2FPIc8rMXIBhSAkA31mDJAI8lyX8r3cPCID27l4ItEc/cqPKDFfW6lgdKepglpX2tZl8Af5eyltw9IEwefaXOUXSTAL42s1SYyi3S1c0R+kTr5QLvxqa4I8XEQyuDNRnpwCdIYH6t7gjv8BzrBlKzOHXHuGCUTFHYrbeP/1SspYE7BpWvGR9HrqPd/QsXN5oayynP96C+c0OuNw5JIkE/vFSpmz/N2o3xxjuNFIAQRGez+8vb0PIAGW4qoCoXKUYfX2dv1rihrZDG03Ok3ofO5aNnI/W0xCd5vngEBq19Luv8OTtJGsROovChQjCJvF6VZuZ/89MmOrDC+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s40rRIY4Xzw+Gt/HWhMq7cTJhPC52BnfIZh6e7ETP+g=;
 b=jrpepT3XSe7p6szZgv/AwKUjZqcpG2euS/i7/hKb9xPHdeLZeH+/35R4Z8BBycjGWPN8l0gWbAVsAwxUp5mLzeQQ45pL0wphf5ZlZY/i1c42DRn3DoGXmTwOqq/l/QiZ8l5rJ2GqkKZoCwt/pO10IdVoOtCBKIZ4Xk2qEGRctii6QTMFk4zib4hI09KAFOD1+616pC6fqOY5q0zOzkCzL5f/p2/nW9LOxgtHMUXiVr/JTOGGkxzuL2zhMsGDbT/NiM6lNxcLmwbLaC8JnCiUiLaJZxTZR6ShVwld+7NNjkBg1HXF992kMREd9tpqi7ovoY5EBB/FIIehcreZWkSY3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by BL3PR11MB5699.namprd11.prod.outlook.com (2603:10b6:208:33e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 20:33:36 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::8808:cbc4:63f2:eb7e%4]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 20:33:36 +0000
Date: Tue, 7 Feb 2023 17:33:28 -0300
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/i915/xehp: LNCF/LBCF workarounds should be on
 the GT list
Message-ID: <20230207203328.ffkl6abhfgzbgg55@gjsousa-mobl2>
References: <20230201222831.608281-1-matthew.d.roper@intel.com>
 <20230201222831.608281-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230201222831.608281-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|BL3PR11MB5699:EE_
X-MS-Office365-Filtering-Correlation-Id: efe03d2b-fe81-4835-95c4-08db094a965d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rlaUk51AhzH+QqNLysU15FYabS+s1EYji8S2AAxU/c64JgosAG2FDachjmHqpqaNci7KFzGRMFCRxgCEkug92s7TIAv0wqdmyYHzJJklhOPf7laxlkqBrFltdGAypKw+OmrdtG8d+SrWJ8Og0SvSXQlyeihVIk0ap5yVACm12bnbY5nADNhN0tPnrQvoPM8fuku5ruvNCA+9ApAOKn8owPQNnLfWAEUCy4vTXnrV6eBRur0fYpTkkwQzfq4nqED8vDFD6D8Py2XrLFn88vewBcxSf8U0/pTuqo2mZnqy8DZQ4hp3BqsayhpYl4/zfNLXvN4v27l4kNZ0LVY8j9YBxz+XJt+VVuA1G41vqcsovCjNKdBMw076zQaJpGz4xAyYmhLII2hENGAqmxULyEPzbjtaGWwtimI8+Y1QZ8dQWUwBVxn6KQ2VGB83thowZ99q8Z4a0IQLe+2ca1ihM7kpnsbjmLIvzsIVg/AbXhk4jYvxKXxONpubBDoNUE/vjqPxhk/TUWF9rkj0kukJx0FRaO4WedUk0JYkuLEEIZLEnC185o57dgLi8Ig3azKJS4pb9y7jrPNqhLEJIVANTPwEBwbeNmCXhmngpMt/tFmUlzMUQMJzO8kROV48jr1XTqBC5xoOOxbBdBHpI5zhoJxtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199018)(6512007)(186003)(26005)(83380400001)(2906002)(33716001)(82960400001)(38100700002)(316002)(6486002)(478600001)(66556008)(4326008)(8676002)(66946007)(86362001)(66476007)(6506007)(6666004)(9686003)(1076003)(41300700001)(8936002)(450100002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cg0Q4K8S0ayfQp4Dw0avNn8UG2sxgWuCUjOS4qTf7xBNyfOJB3P0Y4VJke2Y?=
 =?us-ascii?Q?8e9iX1hQE/xBX6L01V66i83TJyZS0bi96bChc9xSr2aoiPp1p5BZZlAHOL84?=
 =?us-ascii?Q?OLfifzc0IqCZO7DTTLkJgIOxv5AgclHy3tNgEvteLYzvtou37Ff7mn6aOfPT?=
 =?us-ascii?Q?p3vw4E6LZXx3R8Q3YrMrpYAe7kTXi1iJgyliZFZf6BW0hE3Vi+NHZafP+92Q?=
 =?us-ascii?Q?8ZJcjEonuZzb70IPDoeKMeZwXOwH5Z/p1UmWIEG/ljnpvHqRfZncwueWXSUX?=
 =?us-ascii?Q?faMDWDRNQ2rAymiZK9X+C9YjvggknRs7NQ3/EWj+NWiJ0KTyPVlSDQATknG0?=
 =?us-ascii?Q?PasHT+rLfciAEkZZoMm2DYZpwKUewukOGY/ONTYfJx23HbooPwa19BC70QBs?=
 =?us-ascii?Q?mO0KZPorEMSG5b3cd4hxH/kEosWpEv9wP2Sz/5UE09hzUktmLWUaqyu3NSCp?=
 =?us-ascii?Q?cK2lrTQVVgEp/JEGItlnUP7abNi4i6OLM/1KCHBUfvqhLWEBWIFd1Pg8wmsu?=
 =?us-ascii?Q?g77bt2eAMuWcZ9c5JvpFLa2PdAXyRgdxQWL1+IB6A+IWn2C+sN9NM5rOn9dc?=
 =?us-ascii?Q?9x9fDsy20uQiNKrjO1wHRASDj+Ac/ql9IFxBcfxo07Wz/ANdtRB/pGEVmJLw?=
 =?us-ascii?Q?CoD8krX+4Q2OH6BxygAeyM9LNkQlV4iYtK+nh/godvFs1jlBmYEoUg+jwjMw?=
 =?us-ascii?Q?bb6RtV8YKPq4/98GZjLnPF48/u/2JX3LZ1apeA9l3CMNqhwfbTBpYLhwQdCm?=
 =?us-ascii?Q?ICCxonBdXKEvet1vbYW3dnpNDhX5ultbiH6/Rkb+ybXFoBHkYpBOoXL04vRE?=
 =?us-ascii?Q?JwOENC/jXSvw8mjQPR7Q4yxl+rT6vbpY2xjwcFOYfNymOr1XqAMS3OCc8ZI8?=
 =?us-ascii?Q?IEBATrltbzi2vnYUmFgT/O5YqNf/5VxE7skMauYieTIQXJrN98jSZPGY92Yq?=
 =?us-ascii?Q?OFJCV4A+ZBXBQPCaH9eQF0G9hdo/4Ug0mN133FLbjjaOVpKEmB0fjkRcAZf7?=
 =?us-ascii?Q?cCbT+XYKRjCOkZy6as48EHXi0oGENXrFqnM00vte+L84WJ4BTibIFboGS9Xz?=
 =?us-ascii?Q?3BE9/jQDIzAi4bfAc9BYNqidK+UHi0A9rnlgeymUSjJQ9Or2PMyaAcBjECIY?=
 =?us-ascii?Q?CRov3ac2sendyyddObqM+bEapONc/rfCpNRPfSXLKnLNaSHvxZNEo2cEoxzK?=
 =?us-ascii?Q?1UdeGI7KlsK92zcQhzmdiJcMLI8qPYdXnw1yQqOLL+yfE10Gpqrcfnrt3vLh?=
 =?us-ascii?Q?XHjvoOMdfvkrS5iCMJBsJDDh7Re0OE4/lUq0D7hnurvQwLm/dzAldwghIjKI?=
 =?us-ascii?Q?PkQ1c+1hhaIu5nc7D1CZ/RdiNVI1pfNJdoDBwwh7KqpfRis1ZvOCzDMGQVTZ?=
 =?us-ascii?Q?qpEJsaNS5OPVdTa+MtDqyqJb9p1/8Kkt2e3OPKWs+9M+XlZqrbjZRk6S0tzw?=
 =?us-ascii?Q?wqpHYIS7wU4L041V9yRElANpcg28Fr2NIPv21EN/th/m84WLQ2HLWnVlQjlN?=
 =?us-ascii?Q?zWL78ejC96/P66F5K4XoeY7LNu31lCDKVTldWG56YPR7usvxVlJ4bFEiVHsL?=
 =?us-ascii?Q?bgfqZLCkb0OTHxVU6rcRDLV9TaNm6uR80J/T4l8zod0MysbvwFm+yn0vxk+w?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efe03d2b-fe81-4835-95c4-08db094a965d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 20:33:36.1752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0r5tNGn8pVrYYz72gPYxvYMtCGpm7kGjPYl3PwLC1674fGpg1em2GAZMZ8B3NTg5MdoTDsfrSpZV3pq8r/i+Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5699
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

On Wed, Feb 01, 2023 at 02:28:30PM -0800, Matt Roper wrote:
> Although registers in the L3 bank/node configuration ranges are marked
> as having "DEV" reset characteristics in the bspec, this appears to be a
> hold-over from pre-Xe_HP platforms.  In reality, these registers
> maintain their values across engine resets, meaning that workarounds
> and tuning settings targetting them should be placed on the GT
> workaround list rather than an engine workaround list.
> 
> Note that an extra clue here is that these registers moved from the
> RENDER forcewake domain to the GT forcewake domain in Xe_HP; generally
> RCS/CCS engine resets should not lead to the reset of a register that
> lives outside the RENDER domain.

Looked and it seems DG2 also has GT forcewake domain for XEHP_L3NODEARBCFG.
Shouldn't Wa_14010648519 be fixed as well then? Or am I missing
something?

> 
> Re-applying these registers on engine resets wouldn't actually hurt
> anything, but is unnecessary and just makes it more confusing to anyone
> trying to decipher how these registers really work.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 61 +++++++++++++--------
>  1 file changed, 38 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 7e93ba6b3208..09c9837458b5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1499,6 +1499,12 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	/* Wa_1409757795:xehpsdv */
>  	wa_mcr_write_or(wal, SCCGCTL94DC, CG3DDISURB);
>  
> +	/* Wa_18011725039:xehpsdv */
> +	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
> +		wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
> +		wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
> +	}
> +
>  	/* Wa_16011155590:xehpsdv */
>  	if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
>  		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
> @@ -1548,6 +1554,9 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	/* Wa_14014368820:xehpsdv */
>  	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
>  			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
> +
> +	/* Wa_14010670810:xehpsdv */
> +	wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
>  }
>  
>  static void
> @@ -1684,6 +1693,9 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
>  	wa_mcr_write_or(wal, XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
>  	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
> +
> +	/* Wa_16016694945 */
> +	wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
>  }
>  
>  static void
> @@ -1724,11 +1736,36 @@ xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	debug_dump_steering(gt);
>  }
>  
> +/*
> + * The bspec performance guide has recommended MMIO tuning settings.  These
> + * aren't truly "workarounds" but we want to program them through the
> + * workaround infrastructure to make sure they're (re)applied at the proper
> + * times.
> + *
> + * The settings in this function are for settings that persist through
> + * engine resets and also are not part of any engine's register state context.
> + * I.e., settings that only need to be re-applied in the event of a full GT
> + * reset.
> + */
> +static void gt_tuning_settings(struct intel_gt *gt, struct i915_wa_list *wal)
> +{
> +	if (IS_PONTEVECCHIO(gt->i915)) {
> +		wa_mcr_write(wal, XEHPC_L3SCRUB,
> +			     SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
> +		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
> +	}
> +
> +	if (IS_DG2(gt->i915))
> +		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
> +}
> +
>  static void
>  gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
>  
> +	gt_tuning_settings(gt, wal);
> +
>  	if (gt->type == GT_MEDIA) {
>  		if (MEDIA_VER(i915) >= 13)
>  			xelpmp_gt_workarounds_init(gt, wal);
> @@ -2897,16 +2934,8 @@ static void
>  add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  				   struct i915_wa_list *wal)
>  {
> -	if (IS_PONTEVECCHIO(i915)) {
> -		wa_mcr_write(wal, XEHPC_L3SCRUB,
> -			 SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
> -		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
> -	}
> -
> -	if (IS_DG2(i915)) {
> -		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
> +	if (IS_DG2(i915))
>  		wa_mcr_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
> -	}
>  
>  	/*
>  	 * This tuning setting proves beneficial only on ATS-M designs; the
> @@ -2988,11 +3017,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  			   0, false);
>  	}
>  
> -	if (IS_PONTEVECCHIO(i915)) {
> -		/* Wa_16016694945 */
> -		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
> -	}
> -
>  	if (IS_XEHPSDV(i915)) {
>  		/* Wa_1409954639 */
>  		wa_mcr_masked_en(wal,
> @@ -3004,18 +3028,9 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  				 GEN9_ROW_CHICKEN4,
>  				 GEN12_DISABLE_GRF_CLEAR);
>  
> -		/* Wa_14010670810:xehpsdv */
> -		wa_mcr_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
> -
>  		/* Wa_14010449647:xehpsdv */
>  		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
> -
> -		/* Wa_18011725039:xehpsdv */
> -		if (IS_XEHPSDV_GRAPHICS_STEP(i915, STEP_A1, STEP_B0)) {
> -			wa_mcr_masked_dis(wal, MLTICTXCTL, TDONRENDER);
> -			wa_mcr_write_or(wal, L3SQCREG1_CCS0, FLUSHALLNONCOH);
> -		}
>  	}
>  
>  	if (IS_DG2(i915) || IS_PONTEVECCHIO(i915)) {
> -- 
> 2.39.1
> 
