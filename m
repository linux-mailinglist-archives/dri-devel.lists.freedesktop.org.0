Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2481D75B8C5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 22:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EEC10E17D;
	Thu, 20 Jul 2023 20:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFF910E17D;
 Thu, 20 Jul 2023 20:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689885265; x=1721421265;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QQd/70tDy4wVSMd2Ss7NnaefdV5/IG0cGxn+RPpLT2g=;
 b=Prb/Kja8WBhtuV+sj2vjtQEK58s1yFwOxdnAs8iCUI1Srxqy6aqjzshC
 xzowerxMzeSLJiZJQicqEKLplL5EaHX7S7DkkPvGA0IfeSH8E3NiWJpmP
 XVJL9LZAUAUV5NzMPn5tr5Bdee9d2zCi6/8bwqSJN1a2Ja7zGrtn1tG+1
 sid5VUQRpPH69soV80xtt6Re5iA7TQyDmCi2jjoHTFIP1zVYmfPkikop4
 fV3/V0QCoydRziY4na3R7cHY1aMhD2r/PD+Z0LxJOQVIvGDVgkqVVkAOF
 bftvMtKpAuGEQk56W37ACYdWHM9hGSbmoK1nX8eJM/0rVxXB9hr3iX9iZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="351741836"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="351741836"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 13:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848590304"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="848590304"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2023 13:34:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 13:34:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 13:34:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 13:34:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 13:34:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7LnkQ30EqgXBzWXXLwNw9hkOsokW8nNN2cX8RtJCwQzLXsbGSnXjd6SUictm1HGdNSfCH8/j9aki8+aw9pbzR0owyCKp1M2VFIsPsSZk015j+SRKXa9TUMgk1RwFxqq02BdQk9dR6YDkQ/7Tu/DFOPeDdlRxOoR9oItuQbmroLTysLlmxqC/plPrJG6O2T6lGh99D94x+MpYZjJhnol49QgTCzN9vuYZ8FVY7WMYqaoxppIbP5nNEUn51TT1r+p1Qj5zf7z/seiXL8soMs26ciG0htxD8h/Go7MVYyqgIkjrplNLqChP2uLBx0KWiNZ6VVAjk4zRWylzBcppY3/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWQfcmxXYjSEc0Um+Rcy/XdUZFgrJwDHAsPa34nj/AU=;
 b=KfxkHtlIxVWjTiZeeu37LBbU2IMmx0eOxnz13iJjJ5wa2MS46D66oKGdYtRL9+d2JnccJyWTTesiwNdFSKxLux21fiXsGJbB3i6buAnFQFSBY8vx7ypzB3Q/D8epihv+l8OJtEMHmwdev24ekleyYMWyxeWzKOXxhS409yYHGRPYLLk2BtEjRDWeOwxlzmechqOkDbkldX/viSQ7J5mwQbquctuamVUtqOsknlGO1ewiyC7FwGboukd86hKTYBvPDvXht+ezqDh8jaDd04GHROicGeNHeoz0Scjyje+H8aY/fH8x8DZfe8p2Lvj7J48Eb8qeqWnUY4aWHv/tkIBkfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV3PR11MB8727.namprd11.prod.outlook.com (2603:10b6:408:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 20:34:15 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 20:34:14 +0000
Date: Thu, 20 Jul 2023 13:34:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 2/9] drm/i915: Add the has_aux_ccs device property
Message-ID: <20230720203411.GV138014@mdroper-desk1.amr.corp.intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
 <20230719110729.618733-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719110729.618733-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0056.namprd08.prod.outlook.com
 (2603:10b6:a03:117::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV3PR11MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 68085b92-0c5e-4e2e-a555-08db8960ae74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BCvxTJC8XMH9Mw9p9EMt/fSHNYGLLEtrf1lC1vi9Qd74llV1/OMDtv7THRwr46V+lJ2xIRsYHslxP29HhqMdD/qD50lxoJEvS8auNvFFW/k0T87IsJDyhZAbDP6vk1htENYqMyHH8GqClLb1BzNqzJ2Ew0cV54l/JFFWATPUM9JGNMXmP4z9K2y6zLh5POlg1bgUIpRTT4ZQEZMoxeHCmmZ3DTjTQrumpEX31EnE9+FS0IotMrIvRw7paTwZhvbvpCImnZw+lu8/eVH0gSpbmgWAQ8LBdmabe31PRPZsob8Oo2MOR+3J97R4VOHEddxE+yVA4XqVBtuQmWh+EWUC1JXAudcYxQRSpb/Kgp9Ot+IfeIAIm6PgDjZGhj9OE7BUzqH8Ge2mNICNr5uLAU/ZR2KIeSVX/oxM+9D9Lecd1ncZkgIN3zycQqt5ueGIt4grp0jsftNdPvajwN9UX5QEe1bVPDiY5/DgI8crUbXk1wz/+7gjcVtk7n9yzlTxskRmy4bDMNgbPqulith1YizqKV+ujlPFYIuCW2zvYR7ZlzGqa7eSyaPowICrMKc3k7My
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(8936002)(8676002)(66476007)(66556008)(41300700001)(6486002)(66946007)(316002)(6916009)(4326008)(5660300002)(6512007)(54906003)(82960400001)(6666004)(33656002)(2906002)(478600001)(83380400001)(6506007)(26005)(1076003)(38100700002)(86362001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U+QrEgHOjFjfcmPsDKjLZ5EW3JMjdfDBPIMkGPLD17oqRtwty7yJSe/E8edS?=
 =?us-ascii?Q?CbL/P41bKTw1ak/x+M6lvhFCHdmSvjjszAjTh6DOH1Atadaxvb3Wnkh7RqvG?=
 =?us-ascii?Q?ll8h2aQY8kPd/FOJCLXrly2HQlJssWG3VovaOMr2xI2k+E+j4D1yN/4BmeUv?=
 =?us-ascii?Q?fP1oBfjMYSHjlvSC8WjKHE6Ld0Pk/NnftSQkf71OIcLxbVvHxQhshbqYkGlO?=
 =?us-ascii?Q?g4HTFXLKHBBsl2cR4vXczIgIj/O81ggVx0HT67q5tSnCmE4kgJbnQEeC/x01?=
 =?us-ascii?Q?mzKswcx2NsU9cRgP2BK9/9yErjgwxwEdkOh/DdUny8ihCaU9twti3WweQyTQ?=
 =?us-ascii?Q?hOoGwSAVOlp45LNjpwbnZTVWnhB/hM6pHlktVbKTQdkv4a7BhT4gKAMDW87D?=
 =?us-ascii?Q?JU0s3waSR2wRZPTSqBzRIcjsvrvLFFOObWyHvg+d6Yu6DiIeb0ptEA14ZLV/?=
 =?us-ascii?Q?BZl69nUUSWMins21PEm9lZQHdm8DCoOxbWVB5d8QngpNPaw7Appn/4jiXgfl?=
 =?us-ascii?Q?37prv5xzO5KnPMkpz3ongDToIjN+j9VRr7bdoudYQCGatlRoWhg9WxOaqoBi?=
 =?us-ascii?Q?B4RDBdCPew2nWsVcdEU5z02MFV4K2iPAQ6tZkQTP2MdKoNY6w09Lt/t3NKyU?=
 =?us-ascii?Q?+NjCEn5x0MuX32UY32lizjaMf3gGa60SilB0k6g2oZ+JC9NaIclWYygSL5AA?=
 =?us-ascii?Q?DrY1WmOfuJ21/GKO9o9UkSoNyFXuaIPt8LfEA7qOKAAKxNHsmShvrPVZ+kUQ?=
 =?us-ascii?Q?yqqxMNhJfeP8umanXcU5Wpy/Gz/kKSILrah30vhgMr9cAHBIZknqOt8fOOTf?=
 =?us-ascii?Q?FtERyIA1Q66hbW49N8m4gbBiMU6zi3AYQ7wJfF1fyvR7GybtWIoNdEXO6VxL?=
 =?us-ascii?Q?SFB4HUgtn5qicR7TMNxl8WQv5p4HM2Kt4UqNDxFcDla65NuBAmSKOhdKfwqx?=
 =?us-ascii?Q?PIYYBPC75cVS83Mh5CN/m3J/K4eO0RSDEgNUqMQxDkOoUve7NgS7yB1KyNn0?=
 =?us-ascii?Q?Lt/yVa01MeFCFLMiFgofnkvhCrescfipmpWvqianaTclLIcaFDKjV+E5L3VX?=
 =?us-ascii?Q?WOLAUmPGQWIjv+FYsIbL+ACs588ZOX1938RcoCsEUYHCCf+Mh/b9Og3ik3Z0?=
 =?us-ascii?Q?yl4XBUwht8VxmXr46uFKh3QRqj3GKaB9u25q0OKVy5eDtjCUsE8AnBnD4t22?=
 =?us-ascii?Q?5ygO7Rb34b5RMDugEwyNCSU+DgafC+iMBMdzQHj9Y2Eg6MQBRUBeFtAXWimx?=
 =?us-ascii?Q?HLx5wYg65EyOle7N6o6vxNLQYtlYY2YxCbrWKdaYHuQ+p6iwacoQ8HAb1DIM?=
 =?us-ascii?Q?lrFAmBaU1VrC8IC07hWgUzhmi0cZnPX9/Pn0Vc5Cufujn46EjYSGYA7ChmIv?=
 =?us-ascii?Q?lkuQvbG6DGxJoV2TeT1dBUiTIUffZluqwXZVllTL1s38DmHi2yryFmxlYarD?=
 =?us-ascii?Q?X5SgKTQmrJ8Nr/WKiTJKWwU1NABrcbeA81ZvljsQLUY2M4o+WryR8b4umvPH?=
 =?us-ascii?Q?RNPma3k8Ybcz7k+Hyech5FqlFIZZHpnNN3DWj6ihOgf/P8GR5zxo6C1DB8Pi?=
 =?us-ascii?Q?buQcn4dhReOOeLlTsux+9TT2qAXQ7tecYNh6Ym6PtehjE3VFhg7dtCE7w+ci?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68085b92-0c5e-4e2e-a555-08db8960ae74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 20:34:14.2216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+UiQPqSjlU8b4H742wW46zw8sSjITMySAQQ6B1bV/esYQtNATQNInnYWb9cT2lXtw9PjH/ZIND9CUnJSjHB2urBaltV9HCcsXinh47IKOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8727
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 01:07:22PM +0200, Andi Shyti wrote:
> We always assumed that a device might either have AUX or FLAT
> CCS, but this is an approximation that is not always true as it
> requires some further per device checks.
> 
> Add the "has_aux_ccs" flag in the intel_device_info structure in
> order to have a per device flag indicating of the AUX CCS.

I think this flag is a bit misnamed/inaccurate at the moment.  AuxCCS in
general has been around for ages.  Bspec 14276 indicates the GT side of
the hardware has had AuxCCS since at least SNB (gen6).  You seem to just
be setting this flag on the platforms where we need to do TLB
invalidation for the AUX (gen12), which is a small subset of the
platforms that had this compression in general.

I kind of feel like the helper function approach might still be simpler
than using a device flag, but if you want to stick with the flag it's
probably best to rename it slightly so that it more accurately reflects
what we're using it for.


Matt

> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 4 ++--
>  drivers/gpu/drm/i915/i915_drv.h          | 1 +
>  drivers/gpu/drm/i915/i915_pci.c          | 5 ++++-
>  drivers/gpu/drm/i915/intel_device_info.h | 1 +
>  4 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 563efee055602..0d4d5e0407a2d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -267,7 +267,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		else if (engine->class == COMPUTE_CLASS)
>  			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
> -		if (!HAS_FLAT_CCS(rq->engine->i915))
> +		if (HAS_AUX_CCS(rq->engine->i915))
>  			count = 8 + 4;
>  		else
>  			count = 8;
> @@ -307,7 +307,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  	if (mode & EMIT_INVALIDATE) {
>  		cmd += 2;
>  
> -		if (!HAS_FLAT_CCS(rq->engine->i915) &&
> +		if (HAS_AUX_CCS(rq->engine->i915) &&
>  		    (rq->engine->class == VIDEO_DECODE_CLASS ||
>  		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
>  			aux_inv = rq->engine->mask &
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 682ef2b5c7d59..e9cc048b5727a 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -848,6 +848,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   * stored in lmem to support the 3D and media compression formats.
>   */
>  #define HAS_FLAT_CCS(i915)   (INTEL_INFO(i915)->has_flat_ccs)
> +#define HAS_AUX_CCS(i915)    (INTEL_INFO(i915)->has_aux_ccs)
>  
>  #define HAS_GT_UC(i915)	(INTEL_INFO(i915)->has_gt_uc)
>  
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index fcacdc21643cf..c9ff1d11a9fce 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -643,7 +643,8 @@ static const struct intel_device_info jsl_info = {
>  	TGL_CACHELEVEL, \
>  	.has_global_mocs = 1, \
>  	.has_pxp = 1, \
> -	.max_pat_index = 3
> +	.max_pat_index = 3, \
> +	.has_aux_ccs = 1
>  
>  static const struct intel_device_info tgl_info = {
>  	GEN12_FEATURES,
> @@ -775,6 +776,7 @@ static const struct intel_device_info dg2_info = {
>  
>  static const struct intel_device_info ats_m_info = {
>  	DG2_FEATURES,
> +	.has_aux_ccs = 1,
>  	.require_force_probe = 1,
>  	.tuning_thread_rr_after_dep = 1,
>  };
> @@ -827,6 +829,7 @@ static const struct intel_device_info mtl_info = {
>  	.__runtime.media.ip.ver = 13,
>  	PLATFORM(INTEL_METEORLAKE),
>  	.extra_gt_list = xelpmp_extra_gt,
> +	.has_aux_ccs = 1,
>  	.has_flat_ccs = 0,
>  	.has_gmd_id = 1,
>  	.has_guc_deprivilege = 1,
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index dbfe6443457b5..93485507506cc 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -151,6 +151,7 @@ enum intel_ppgtt_type {
>  	func(has_reset_engine); \
>  	func(has_3d_pipeline); \
>  	func(has_4tile); \
> +	func(has_aux_ccs); \
>  	func(has_flat_ccs); \
>  	func(has_global_mocs); \
>  	func(has_gmd_id); \
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
