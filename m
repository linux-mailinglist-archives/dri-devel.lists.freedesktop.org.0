Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC66108D0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 05:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E85D10E0D8;
	Fri, 28 Oct 2022 03:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4C510E0D8;
 Fri, 28 Oct 2022 03:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666928464; x=1698464464;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pa7+z9IGsX0jvKKgFrBoz652kiKTUv4stKoxbp4piq0=;
 b=ieybFBWXiZjnIYtDuQO07PlNLW8nftjc9khZGn+/yLFeHl4t1u8hhG5m
 MQHgM0qTifOH8Pa6ZVxuLj/piTbDPUUh0WmHPUr0kHs8qqbvfkxBrSa9K
 ufAD3F9pVhaYTGRITZ1OTIOd9rCMMHZpcwcx0VXLHPP35Gn3ECi3Adtc1
 ybbM4onabd7g28XZpR0OaXg4Ppcg8qp23+YQyQgnyYCFt4Pc1nNia5TEk
 qvbzZou7IYGKuEDdxX4vOOuh+ei1KPkn2a3urrgRO2SDwZXv/GQZJwlks
 S4vKI/kH1W3c475Ni333kn1TheboXve1M0gckuIQ8SwIrEGth4u59pAPI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="310098676"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="310098676"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 20:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="757943558"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="757943558"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 27 Oct 2022 20:41:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 20:41:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 20:41:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 20:41:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 20:41:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIlkI30X/ARVDBEBBWI5DFsfTPsi7csHVl2ECm3mxl3FlSYgniPx9dDJcdk3zK6bi0HowSfMnX8nfreYcy2TGZ9aY9SyUojwvJVzWMv2S8Wt/HWAeARkX9Bz2ZKDBqI+PqlQbtQFUo736G3Fm1CDE4e9DZZI7yYJ8yl/aF2KMvvQCF9/r1zy2iDtVdde8N8t3B+Qhn2Yj4JG54W9n6t1X3e1dDFJOyDCyBcotgEWf/3xhJLCRP2pRk2xd7RKm76mVaEbkoYtASg3giBwafxNx88WMRWfzOERK3BW2snAnqq8rXhiQIAoctwmKR6LVPRoejNG2GExx37kofqvl4fdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvEEK//zPpJKujmE2YTW7KPbOkcQ571+vhs4qOUI4fU=;
 b=FjPRVZwQ4F3sdkICo3uEa7YSm3L3QXJ17dfPLE1IxI1x5zNrgGCDQiI/HgrA0DnHSlpYEVDJB4wiNKlhAKod09kTAt9tZmNP+dDjxXRQD70djFLF8pK/TOVqnY8FE9ORCzxJnvI8obrCChPRTNWqvVh2Rhs0Bt7XO/u8D/msHPXlOhrkaFSy0JdLvJFDu9fuEeicrfFvqf+FpUo4EJU0e5qRN+33Fg1M75G0WTaff28wZ4LclDRL7yXRyPrL1B9/cQdUV5dh+q6iBsgSJcd8RLOMg2krP1a8yS99bT+ftYGtudvti/5ZXs8CAePRaf6tRuFFVm4Jna8AM+ZzzViPFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 03:40:56 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57%5]) with mapi id 15.20.5746.028; Fri, 28 Oct 2022
 03:40:56 +0000
Date: Thu, 27 Oct 2022 20:40:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 5/5] drm/i915/mtl: don't expose GSC command streamer to
 the user
Message-ID: <Y1tPRlMIWsachnkQ@mdroper-desk1.amr.corp.intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221027221554.2638087-6-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR17CA0038.namprd17.prod.outlook.com
 (2603:10b6:a03:167::15) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 43a2e9d8-12ec-4df9-4dbf-08dab89638e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkIISSOhjG2Rd1KSV1hN07vAObDExAs5q7M/Mq+RqGfavEhxeMvNSg+zGAL2c0Syw0h1tZ6bT2z1qLpC7fTwFeOvVF5IchOBSCk3aYYn5h2W0HmS/Zw485FvO/eJy1U3jPS2AQVXDhmbI21gIw5SjVPIAmbqUpsdyuFiHtj75Bd+bc5H9Q/pfEb7eWmNypvtm1xs/cWDlHovuWdortJOXZmuJ/WRK4KFUB7bD+ylFatTN9vihxgwYzZ4LHAeOxvXN+dpIMSLONBu3uwz0lb1en/4f4Eo6sfOwn1c+PKZxyIiKHXNuM1BKg1gLsar5HXa663lL+DnAblCi3hc6mkizS/7ezzgvxEDKQiKQOrS+1P15hXhfesEyfKJ6GqEAz9AifP/zqhw2DqFoFbp/8iYjE4FmWIM59hWuLCN9KrX7wSA/sgttzDIxAzSvipy8z3zhmM1sD6iksnHCZBbO9QcVpExMbmb2BZ2gOaVDK1uT2Nh8EioB++GQacfjvNuqUTH1GNFNnKlv8qdReE6A+L+ZN/kkwSmTV2PIR5mgDquF0lMbYygNIhp/SmgcbVG71Bj3ENSkrsxlvyp81INHqs1gk1EUeO4E2EUVV4sgkHrwFioWfDFo9I6ISYo051mmDUm6DfrgepHPxCSEnVxwKeDOUz8Qxwc8U7A+E60WncPoz/wcFjAFDjwO1BCn1IM21BFID4JIl2tTQq9QOfAc2QvHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199015)(66946007)(316002)(6636002)(66556008)(6512007)(26005)(6506007)(8676002)(66476007)(4326008)(41300700001)(5660300002)(6862004)(450100002)(8936002)(86362001)(6486002)(2906002)(186003)(82960400001)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8MmATsAqkoUnbTqhxI004XL5+f7ozHgk7i+d6bkrB4KbJsGzI4qeYF+IOd7Q?=
 =?us-ascii?Q?KnZbk89QbxFc5Z1d7t45wOWuGwJtcqYfXFjRY43E8Vo58GHKZ2p+BSZ4Lz6T?=
 =?us-ascii?Q?lSi/TtqFjnF9E/sRfhlntOWCI2MhlJHvEKpYMAUMcoGrPHiv+K30pyor/Xgw?=
 =?us-ascii?Q?I1+3SmMFsycqn92ufTc0/lNkj6LxGRJLiqiqkq4x7cxq/JQ7ott31rxkv78c?=
 =?us-ascii?Q?6DXS5t1DaEG4aHSvucn3yhHwQ/zbEK5jvhsyj1RyJJ0d4zTMOtOq66YMijQD?=
 =?us-ascii?Q?81AJSL8smoArTS/nd3+1eIh5Wv3H2wES+bK9+srVv05TWZ8vCq7t5N0Fb+YM?=
 =?us-ascii?Q?Ltjywigtbgb3enOrno9Z/my3wy4M05RMYn7/BSl7VOGLoigfREHCAHCUZabp?=
 =?us-ascii?Q?oFhRzANTo+HgHpZBYVqjIFGuQ7ddgBvVRgHQfloCaiwDCbCzuZVvXck65nu2?=
 =?us-ascii?Q?+C89vy75JMIdLoC6s49UCj3UsPNLGO+RpKsRaEIuFcDCXrsv5WjB88j30FWF?=
 =?us-ascii?Q?y5B2goODiibg4a5sC8en545fdGTM8GXHQJ14OjiN4gaaJrChWUYGVxTp2Lsh?=
 =?us-ascii?Q?yQGfMTkSYk6gp3+I1IXtWBxqRLl/CMHI/rZg5NznSn4FJEN2YmMa30wy0IlC?=
 =?us-ascii?Q?Ip9f5LO2ZghF2Zif8VMKLAWTq1onfQOcmDu5af1Du+CwxiIGpmemWyamLCpG?=
 =?us-ascii?Q?15xtu90DsohpH7YoPNgwSBLLQH7S6xdXrwW7x2pJo+NmYVAm0llfRzYbDj9s?=
 =?us-ascii?Q?5uEHD3D4Imm7DSJzTFt6SaBOrGzZwwsYhxS+3GVmr7olhEHmMLKGN2M/9hZm?=
 =?us-ascii?Q?bKVqmLeY4fkb06/4dqDqqeEd9Ydr/Sg9bNF6ERDtbJspKklX2ifmRvnBl/6X?=
 =?us-ascii?Q?wiSuSPwlVoDXQeQEmY1kphNcK3/1hCveP1sq2ypp+JJubILGpRB25PKVLH3A?=
 =?us-ascii?Q?ysR7a+tcIpgDaGKvqa8rksgapGT2BqJ82fj6PybmXOwUWfQv3YO74KAOweks?=
 =?us-ascii?Q?iX7qw5YXR5tXYWv1zJBo623A/9NtsoLKv9B7IA8FLY3UHAGcZEK5i5D79nLx?=
 =?us-ascii?Q?IARP+cyvOISDWxPTiDC92nkWVo7S2V5jfiViObQw0dPPkBbDKKdTh3NAZPHB?=
 =?us-ascii?Q?ZlllXsr3kARjgyPL3KkdPAmKp98JDM4gc9UzqOh8M0z2/dqp2F40UU/Ugkwn?=
 =?us-ascii?Q?dMTqauIbLhllkq01UH1k7e6f7imfhHO3TIOArixOa7p/oK1E0BT/CKAzXKlU?=
 =?us-ascii?Q?UGvOzNtDJT8CQyTXQ/r8PES7W+mPjMd23tvuz8T0JG7vfQGVkaiBvBur2Idq?=
 =?us-ascii?Q?XKDDle2te0I5PWVAbw+YCVUASds1tPExbk8dKAKbsIinN0emSPCLYKcpv7fA?=
 =?us-ascii?Q?O/ayeOYYKqwZByi6GGTBrl7D9DUV3TE6oBSNSq4cQRM4ZccI0pstTYJkDuw6?=
 =?us-ascii?Q?6jPMX/HD2YpaQ6ZLthB1/N64thuwzdiPYjcbIsqgFquaW6fkp9qYnbEU5cXM?=
 =?us-ascii?Q?kvH2nCQKsmxFazeF5+RSkaWx0gD6bEG4Uff2wI3HXA3xKa+Jf2nHpMzAyv40?=
 =?us-ascii?Q?RDIwRWuNjpD1UqFNhFLUoZ4Eo2yrut4gwucBeR03iwCvRd+4CWUaBrywNSwJ?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a2e9d8-12ec-4df9-4dbf-08dab89638e2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 03:40:56.6869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBUg4HzMFsJcGn3Jqqc4VFtYMmFitWiFtHJh3l0dSbvlVB/Ve+ZnA6bCA+cBx+mjolfTx7ZfxWK3pX70Pp24SU1X1TQ0tK7odGMT8IR1ej4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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

On Thu, Oct 27, 2022 at 03:15:54PM -0700, Daniele Ceraolo Spurio wrote:
> There is no userspace user for this CS yet, we only need it for internal
> kernel ops (e.g. HuC, PXP), so don't expose it.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Since we never expose it to userspace, we also never get to the point of
doing an engine rename and removing the apostrophe.  I assume we're okay
with this engine continuing to show up as "other'6" in debug logs?

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_user.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 79312b734690..ca795daca116 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -211,6 +211,10 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  		if (intel_gt_has_unrecoverable_error(engine->gt))
>  			continue; /* ignore incomplete engines */
>  
> +		/* don't expose GSC engine to user */
> +		if (engine->class == OTHER_CLASS)
> +			continue;
> +
>  		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
>  		engine->uabi_class = uabi_classes[engine->class];
>  
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
