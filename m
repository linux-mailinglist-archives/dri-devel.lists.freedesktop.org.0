Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AAF5B0FC2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 00:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D0410E8F2;
	Wed,  7 Sep 2022 22:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E9710E8ED;
 Wed,  7 Sep 2022 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662589226; x=1694125226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zO5uDjlbUd1NhI4uqchb65TqucWhffeBIbDSPcWkM6k=;
 b=TnaSJ1GUqoo/xryymiON4GW+WlLi9URowGn8YBykKMwdkFnESw+bgsYG
 bEUfZprfi2WYWxGR9VljmjtRpjoEa0XBrcnhkGj2k0NzQBfrBup5PiTdM
 hNETFyWwcc/aDazcBKrbBObGN+9HjX1rqCmQ2MZgFLQUnFN0jsmtHNJoj
 2eqYbhllwY74Zw8HUe8VeBM0Qrhpa9w9GHMhPCK6kpdx6USnpIww76HH0
 hfV+iKdLHPtzRG8CdIVyOUZTDqUJksx2qSory/WDeHEplJ1Jg0JS4TYlf
 at+AWRMaadVt83OSsJbwYext4k9HVX121RDRfiI2YzkW7yBN4iAHneIx0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="280042361"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="280042361"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 15:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="790215623"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 07 Sep 2022 15:20:26 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:20:25 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:20:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 15:20:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 15:20:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuXKZMqjK0ZrAYb2pw0aAL8lx4h61siVfo0n1UJa32he3SXX42oVLfpeOJus45LQH8rq+Jj6ENxRZ5oBnxeVJXadkdZmvLM4bK2ipVuGSEf2c22Cc4ynGkhG+qCKmFK2R364BNdub08yWYF7aBEY/g4XapkkF4DsHs+Y2YaMXglIO4iJHfDkyyJW0vt+K0lHIGN69pIC+SmS7XpQL5F5t6PmlHZNj+6Al8COuA2aOcf4oNgiGw62FrUpJ7E3SAisUTFGsbHd47GhKLPGkXDDgbMRPRZlbcr/4TPisCt/LqnDF6MOkk6LPdRSmP1rTaguj2JVjfcZAR3naR/kuR7Eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaUt+422+OUuLdugJ6ObMQMAuS+bntlWXfZg+AqOYWI=;
 b=HX+hl5TR+2bo6gRFXwnGtxlPXjABvWeDHEt209rkw04E/5JoZJl+aml0bI/xdD10Cac4eXq1UyLIUv9daeBm/QCJDQaK9PJ8NysMgGz5q91aMQV8NAk7QytHm3ON9OZuqPwH+2usBNsw6OBnUX1WiAQqlyrBT9s1nLeKBpXVQdC1bJEodyoPAgEn5WhgL4VhzSfsQavbfBO/TN31Cb+CeI82l4J7rFYcbKtvPfkuaJ5EOmkfyX/sf85v8eGmY3l67c05F/RAlDXnvbFDzn/2MRjRPFit6e2vCjxA6qy068xe8CwYfStf2ESywCwf33RdjtSFbZMgYW+cKfmuHQgvHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM6PR11MB2683.namprd11.prod.outlook.com (2603:10b6:5:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 22:20:23 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Wed, 7 Sep 2022
 22:20:23 +0000
Date: Wed, 7 Sep 2022 15:20:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gt: Extract function to apply media fuses
Message-ID: <YxkZJBhZRLlA1mXT@mdroper-desk1.amr.corp.intel.com>
References: <20220907203911.1662804-1-lucas.demarchi@intel.com>
 <20220907203911.1662804-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220907203911.1662804-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4111130a-84de-43c3-73ec-08da911f2807
X-MS-TrafficTypeDiagnostic: DM6PR11MB2683:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RmhQKqeJFJZL5vjcslDbjrW7uMPxZTbR7kyoRC7UkSqmik+jLIk9HqNFsNxGjxhCi22b3LkpU1u2VX5Qu5M5veGVcmVrjscHjW755VXGiqglbx9/CyRkBdf0RYiUWslbUZ7XSGs565qgsYMR/tERnH7yPDWv5SAOY+/emLyPL6uhautJ2TI8SZQdKZNyf5N8af+EhvXynyszFd4TGsArmcxIgRaRsVkDcXcKhzIPUY05Rp1Qis+VGT7nqIpcUx1bKfGwX3kT6ahqsp0cxPQ3i+pr1v+L1PjcRuyMa8vxiFxOZpm5U9vMWkk8/NypizxoHZ0bP9A7/QMzn7MTR2oEapQzvbOaN8x09KGOYVNvFQUVisqprDSVqk6k1GH3Sim0HmZdb7VXFMXqXtttuxv/BcVVAC3iIeGyYsaQgs0cvXD1sfA7k5jUJhd/wKuG4sYhdUnpyVUMwUVT5fYX0X4hkrSjD8KgoRVqTIQU2b2fDpo7G35z6lW7ZsmPWMvy73qKHK9w3GuGJlj9PiNiMBK0u5NLCgC+wMliVeM8K9olf5oC/YuAeyHHeHgiQ2Sqrpy1+JCnQRJVdt1Kx9T1ovHP+qr0J2DbmKyqDtL4bBfWpb+zTBFctjX20vUFtByWZxEfOy9KP6ZjwObPTixaku0SP9JhCdzlmJ+Pj6fO3mQUWh3uXj4xzGX5eKjSAElGG/E8wp6rql1eXf05x6zkfqHqgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(346002)(136003)(376002)(396003)(8676002)(186003)(66476007)(83380400001)(450100002)(4326008)(66556008)(66946007)(6636002)(316002)(41300700001)(86362001)(6512007)(26005)(82960400001)(6862004)(5660300002)(2906002)(6486002)(6506007)(8936002)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SuOh5YuWRzmaU6V7UVKFf4VkIh2ewFZBt0J+FO53z1spSlsBUGz/e3axK4Sf?=
 =?us-ascii?Q?84WXFUPirPRN/GfQhZFZkxUE7hqFgGNm2fU0MGFhLEfcRyT/OAo9kDySLzaK?=
 =?us-ascii?Q?l3P+pfmuy5MpJDRD4AI8NrGWsH2zTU7DVaWU1dPMdGQ6ab5UY+CcPBIlDmid?=
 =?us-ascii?Q?RsEhXUP6fqx1tNejr8hnYUwWnPDWGDRMHNRA5LA3UCDOSyPoiDptLNYtbN3E?=
 =?us-ascii?Q?zcb4Ke61fwVhrLfA+C0eLQCIay1l/+qhtygPEYFYVZX3Yf0pH0wl3w8yr7Mp?=
 =?us-ascii?Q?UdUvRLG4aJGybd9O5RX/dr/pu+WACSWZfIcqSRYtaTiVEZ6YvRmTmq16rYLZ?=
 =?us-ascii?Q?RF3j7W3OlfXswiiJkBQ8LKGn4/aF9EF5FRChLOJtlogQtVFjOjntxiyYP7LM?=
 =?us-ascii?Q?0ytaoXsO+SU/8eUDOvyru7/pw1TT0Gyqg1MDazzW2JYxDhjMl4+LkRTeCYDc?=
 =?us-ascii?Q?95gSQwgkDCRrrsihtJqPnZ7+8eBfO8dySQJNLC3zwhamaAeSr7RGzQqPXEcS?=
 =?us-ascii?Q?agqXEFCPNxesYdE+btLX4jA7OhiufAtdpUPkknK8vrfCPFu8MbgESS5ZXRly?=
 =?us-ascii?Q?yFGvOkIMfS8h+/pd+dp3CCZCjBBVp4uouxxKZc12l1gK7DW8h+2+kO7R3GZz?=
 =?us-ascii?Q?wXe36YXv/DpMB8MojsqoIKDwjFWDzlV4VKkxBvtAAIBu1mAJfxpkHGtTUHBA?=
 =?us-ascii?Q?dFGUaJb25r+czjPT6pE68ycSVAy07gz27q+8TIOvgvW2wa8jfbxWtkX+JiOT?=
 =?us-ascii?Q?H0an6NWXpg+ZSSfKx3Tkvt64q391xEAi1sT5NbCZXp5ji9aODy3u9ELEkDwi?=
 =?us-ascii?Q?aNfPelFjHTGFqBppNKmAev2MGtvylYkNLZdotVmpysMSdH5i1HjuMS3vTXL8?=
 =?us-ascii?Q?/kziiOtrDRcaD0rXdHa3aPB0w9xbrkxLqxKWPKg6vxGlBqlBPdbY4XOMFbv0?=
 =?us-ascii?Q?g52gbQonWBjZefF7VBNM0zrF1aFfSmfNOufT6pEUd34Qi1XChfx/ay41kXHm?=
 =?us-ascii?Q?Gy1aORlTDuvkauUKqTUfcE6UZNb/r0r4GTV+r9hHNgtx8DNhCtFizepEGlw6?=
 =?us-ascii?Q?oR0NvkAMzQgXehBLWtx2CdWAoXxZCx/Q6Xxirb4KIwQ+kcYnr8mHSDcj2BKg?=
 =?us-ascii?Q?BwhVwQWBqvhwicVhMoH8YxMmLUFIP2Cg0QxNLs4TKfF2a6tBc18V+3iQw4ek?=
 =?us-ascii?Q?ay6WKTe3bAd0a0dOx8NfYHaTFwR4+zQKsxLrtnO0+21SMnW3QUkCRakkYvzY?=
 =?us-ascii?Q?iVo8qFqmkRfbcIbMYMLKj7io2Ft5nNRjC2lFrAQY9TaVHLz+f3pPB8N3B1AG?=
 =?us-ascii?Q?GKo9/9guhB2o8mAKODRt+o/e0Oq7Nk7Z5rQUTSgAOr95WfwDIQUUNkC89uv6?=
 =?us-ascii?Q?eSSxnLnHfeaXiO+wNL8RpJB03e6s1aVmgnZuEKvvxiN50gNKIqSvDupDV+9V?=
 =?us-ascii?Q?b51x01AwUaX7G3mqZrqsReH39zICWtrd3azwfN8kIdOjQzrUFlB/VjLwmn5F?=
 =?us-ascii?Q?uxMqf1VBrqVv2zo+0y4xi4txhs0mnYQqWeTF6+ka6HYlmBJQgtdglG0/ba3x?=
 =?us-ascii?Q?Sejex1wmLl6nI+PPrN/ODLbxlwnZmtvjmO37jdMiM8rEABGfTzE8/LXI1P9k?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4111130a-84de-43c3-73ec-08da911f2807
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 22:20:22.9343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 831JRIj8fh+94E6MNoK0F+lABwiBbtj1MMbifGGHf1Av0Ul+2LA/ERH//Rz509O31Kq+7BMIEG1K1S+ekiuhY76ORylAf76sLBxNSWIbozs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2683
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 01:39:11PM -0700, Lucas De Marchi wrote:
> Just like is done for compute and copy engines, extract a function to
> handle media engines. While at it, be consistent on using or not the
> uncore/gt/info variable aliases.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 136 ++++++++++++----------
>  1 file changed, 72 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 5cddee7c2f1d..5b9dfa0cd467 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -665,6 +665,74 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
>  	return false;
>  }
>  
> +static void engine_mask_apply_media_fuses(struct intel_gt *gt)
> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	unsigned int logical_vdbox = 0;
> +	unsigned int i;
> +	u32 media_fuse, fuse1;
> +	u16 vdbox_mask;
> +	u16 vebox_mask;
> +
> +	if (MEDIA_VER(gt->i915) < 11)
> +		return;
> +
> +	/*
> +	 * On newer platforms the fusing register is called 'enable' and has
> +	 * enable semantics, while on older platforms it is called 'disable'
> +	 * and bits have disable semantices.
> +	 */
> +	media_fuse = intel_uncore_read(gt->uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
> +	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
> +		media_fuse = ~media_fuse;
> +
> +	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
> +	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
> +		      GEN11_GT_VEBOX_DISABLE_SHIFT;
> +
> +	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
> +		fuse1 = intel_uncore_read(gt->uncore, HSW_PAVP_FUSE1);
> +		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
> +	} else {
> +		gt->info.sfc_mask = ~0;
> +	}
> +
> +	for (i = 0; i < I915_MAX_VCS; i++) {
> +		if (!HAS_ENGINE(gt, _VCS(i))) {
> +			vdbox_mask &= ~BIT(i);
> +			continue;
> +		}
> +
> +		if (!(BIT(i) & vdbox_mask)) {
> +			gt->info.engine_mask &= ~BIT(_VCS(i));
> +			drm_dbg(&i915->drm, "vcs%u fused off\n", i);
> +			continue;
> +		}
> +
> +		if (gen11_vdbox_has_sfc(gt, i, logical_vdbox, vdbox_mask))
> +			gt->info.vdbox_sfc_access |= BIT(i);
> +		logical_vdbox++;
> +	}
> +	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
> +		vdbox_mask, VDBOX_MASK(gt));
> +	GEM_BUG_ON(vdbox_mask != VDBOX_MASK(gt));
> +
> +	for (i = 0; i < I915_MAX_VECS; i++) {
> +		if (!HAS_ENGINE(gt, _VECS(i))) {
> +			vebox_mask &= ~BIT(i);
> +			continue;
> +		}
> +
> +		if (!(BIT(i) & vebox_mask)) {
> +			gt->info.engine_mask &= ~BIT(_VECS(i));
> +			drm_dbg(&i915->drm, "vecs%u fused off\n", i);
> +		}
> +	}
> +	drm_dbg(&i915->drm, "vebox enable: %04x, instances: %04lx\n",
> +		vebox_mask, VEBOX_MASK(gt));
> +	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
> +}
> +
>  static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> @@ -673,6 +741,9 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
>  	unsigned long ccs_mask;
>  	unsigned int i;
>  
> +	if (GRAPHICS_VER(i915) < 11)
> +		return;
> +
>  	if (hweight32(CCS_MASK(gt)) <= 1)
>  		return;
>  
> @@ -730,73 +801,10 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
>  	struct intel_gt_info *info = &gt->info;
> -	struct intel_uncore *uncore = gt->uncore;
> -	unsigned int logical_vdbox = 0;
> -	unsigned int i;
> -	u32 media_fuse, fuse1;
> -	u16 vdbox_mask;
> -	u16 vebox_mask;
>  
>  	info->engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
>  
> -	if (GRAPHICS_VER(i915) < 11)
> -		return info->engine_mask;
> -
> -	/*
> -	 * On newer platforms the fusing register is called 'enable' and has
> -	 * enable semantics, while on older platforms it is called 'disable'
> -	 * and bits have disable semantices.
> -	 */
> -	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
> -	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
> -		media_fuse = ~media_fuse;
> -
> -	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
> -	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
> -		      GEN11_GT_VEBOX_DISABLE_SHIFT;
> -
> -	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
> -		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
> -		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
> -	} else {
> -		gt->info.sfc_mask = ~0;
> -	}
> -
> -	for (i = 0; i < I915_MAX_VCS; i++) {
> -		if (!HAS_ENGINE(gt, _VCS(i))) {
> -			vdbox_mask &= ~BIT(i);
> -			continue;
> -		}
> -
> -		if (!(BIT(i) & vdbox_mask)) {
> -			info->engine_mask &= ~BIT(_VCS(i));
> -			drm_dbg(&i915->drm, "vcs%u fused off\n", i);
> -			continue;
> -		}
> -
> -		if (gen11_vdbox_has_sfc(gt, i, logical_vdbox, vdbox_mask))
> -			gt->info.vdbox_sfc_access |= BIT(i);
> -		logical_vdbox++;
> -	}
> -	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
> -		vdbox_mask, VDBOX_MASK(gt));
> -	GEM_BUG_ON(vdbox_mask != VDBOX_MASK(gt));
> -
> -	for (i = 0; i < I915_MAX_VECS; i++) {
> -		if (!HAS_ENGINE(gt, _VECS(i))) {
> -			vebox_mask &= ~BIT(i);
> -			continue;
> -		}
> -
> -		if (!(BIT(i) & vebox_mask)) {
> -			info->engine_mask &= ~BIT(_VECS(i));
> -			drm_dbg(&i915->drm, "vecs%u fused off\n", i);
> -		}
> -	}
> -	drm_dbg(&i915->drm, "vebox enable: %04x, instances: %04lx\n",
> -		vebox_mask, VEBOX_MASK(gt));
> -	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
> -
> +	engine_mask_apply_media_fuses(gt);
>  	engine_mask_apply_compute_fuses(gt);
>  	engine_mask_apply_copy_fuses(gt);
>  
> -- 
> 2.37.2
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
