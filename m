Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51026348C0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424510E477;
	Tue, 22 Nov 2022 20:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FBE10E476;
 Tue, 22 Nov 2022 20:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669150380; x=1700686380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SW33DWOmXUK/JJoESgcTly8eNUJMiRhFJGopVSzcxC0=;
 b=eWQY53vTnLecpjzUyryabc2WDLjYBDbePtJnvQxI9tpSg/qHX+QJeRFT
 h4Ic5h5mia0tL89wxauUFMJDVxgJb4HRe0SERlwElXADkZReMU163iu7u
 Kdf/SchvniYjuMeMSgjt1BM/jn299gtNrxQ3a8lnfAm9uUqRNyqARcJ8q
 fR+iwpbxhAuAGFqNX1Q19dS56Nq2qWXxUnTnP1rLOc/ZSyI8Rm7RIg+Kv
 tv6l8BGhXtHZg+wsKNW0zN8YZYU8E8ehTGwEATSNOC+7yOiE7RJKEJn/p
 bAA7zipyZvLC53TUOkI/naUD2zpPQlIKWl/WLXGdo/tbksTsemw2SaF8P Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="376058146"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="376058146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="672620007"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="672620007"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 22 Nov 2022 12:52:55 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 12:52:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 12:52:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 12:52:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 12:52:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRrc6/PU/wFK1nMHCvwbBinO41hN6amf3D68d5EHpgU/9rxKnF0ynDdO3gZHCsDmTV6SbAzL2hx9cFByMSNZpFYysmop5qpj9F1uEcu1GXJ1NYdbATsXO7Ca6axkRNlwnCaXpkQmxk0e4nTMUhXRDxEk3mYhFKyikGv7YvUsb6ZXbJBdhCpgprf/eTcNW+0fP/nAS4v9aoJP2atlKVcLFYBgHg/3SsFMJhIL5v6j4uYZ8LK2ZIUccP10viJfndBQfvieBKJTG03cM1ptdg1+Ie2ISOVWGhGKe8Y4vBeqhs9OVH97BApIEn2xkrHkKcIvd9VTGEjYuVTwJHdvYYYhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4SlyXxDAJV3Z7csyCiHhJqIjJC5f3QqeK9NNVQykKY=;
 b=hB5K7+ukURsiAOTN6Rrww6cqVNXESIfTiW/eUF8+Ueg1Bhs3eZjvreZEeCE/OBSRlzr2kt6Eg5Wj+cTsV/Qo12vKMDYQGzHiWSfW/yfPgRMEtQtZvSf/nRlDumF7Lp/zSI+gea298UYXxhf7lZSNBosQSmGFTWL08fn6k+lfox4F7VeJrJw0BuM1bR2BfKCI8tpCGqQWuKb1wQS0ZR0X6O0skj69+jGqLLnsPXAU+xBR/AeXKgAE2irQtrZuC7z3Fj7qrnX13yrMxcHkbssc0ZMSDj0ztQ0BnYZhq1IYgZ4wx2Hqa+lb8PVlODKB9blYxamOTYTYsOr+DVBiQj+c+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 22 Nov
 2022 20:52:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 20:52:53 +0000
Date: Tue, 22 Nov 2022 15:52:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/mtl: MTL has one GSC CS on the
 media GT
Message-ID: <Y302obVw1e2rcIQE@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221121231617.1110329-7-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: ae13b561-720d-4c67-1030-08dacccb8638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OkPuXC1O7icenIs8mE+SuItbBrE8aFC4eo9In3vZyiI8GKMhuCepfXZ7wBpkyErBB64Ztr6dgmYZMSpcsVm0tL0QnDIkgl85ULJH8NKSPYShN+emh2abFHkwO2/pDjgG2+9Qlo+ZhsNJICCRiR16R8Wbf3ntdhutyizYX/mwx5sx8J74aPUnvE5uDTEvi3MFZKukTn8RH/IoXCxY8QZTigyZGswgzNt1zWbndBOv8IOvS85//gjRDkmkMUyz5gKYOzJYUMFdDtIld3r6Ew00kS0yS9JciuWa6jOBKMUQh2bLeUj9sOERpXKfYsdq5ui3MBoy9JVkKM2Cn05xF/SvvBAPTwZhmnAxfdFY/o7ZfXVIu9FUdTsOqYUcdEgtPn7iqzKtnH+nynF65DahpgkKqOK+M6Y3ek4YbmXHl9L0nJHE3vtrpdtiJtZut4IL0OMT3Gfu30waXFNCFI0inJvhKcxMfEbtfcN3X+YGK21FoXXsQf+06AjPUvaZwTWe5Vem006oaKHLiSPvPrY7/fqIUqz3vC7MbifFJSgMK+L3odCLYlAq40JGRRvrkP/iJSohiKMxh40r6kzgYl1FCVA8m28xxE+sBdQxWCBGjifmWWthzjmrFwI08VcakwGmiOLc+k4Q8ZY8PCibTYsjf1imw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(44832011)(450100002)(41300700001)(5660300002)(6862004)(8936002)(66556008)(8676002)(82960400001)(4326008)(186003)(38100700002)(66946007)(2906002)(6666004)(66476007)(478600001)(6506007)(86362001)(83380400001)(37006003)(6486002)(316002)(36756003)(26005)(6512007)(6636002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQ7vcQrv/jLN6QR7o/cEl3RW/PeFWdvQnGFhHF/uU5u5ivLeDQWD+c5XSoeo?=
 =?us-ascii?Q?cFAkLrfWCL3GhfhBiieertV8H0XzrzK5s5ysgoFj6DxbstAdT4GLM6Gktm67?=
 =?us-ascii?Q?Rzoah7LKKJbXO02HiZCKdK75BdZmGj+ZQASmVH/9S6O2dCypOhxJb8rynzOr?=
 =?us-ascii?Q?exrt1x07uX94m3rPOLCWKUoyTSFE+6xT9K41mNs5axrofAUGu9gL/vnYJB0A?=
 =?us-ascii?Q?vlgD1jRRD1u5siiMys05LmLzV/Fe6ftDBGYdagD3wtaiPPHf0F4xFl2aBFeN?=
 =?us-ascii?Q?nxWmtEI/FY3qRBYN43JHryJWHMV18mb+uYQDiQKBTm7DnbooCtDpP/wdqGaq?=
 =?us-ascii?Q?ecFemWDiwNgAKmtok/OmtyVr+FBGWR7A3TfbT9YjIdBZsUnWORK8dq0ArmeF?=
 =?us-ascii?Q?HKsSh+qXIl+MSumQDqA+WlWXgHBZh9Jc54km34bQd3mx9TdjZlQTXhVrfRC3?=
 =?us-ascii?Q?iDSurUE3GoqF4WQ8Bnm9NmVt7i6d3jCjFVyeH96pgktxGfo7GmSzvVoY+5E5?=
 =?us-ascii?Q?zTFz4VBdd/KNyxGzJ3TBSXRRPNvdK7Wi7rUDYYIFfJl+Pf8Jbfb5XkV8wXdG?=
 =?us-ascii?Q?IilhVfe6osMI7N7WMF+Cm7NtueLOn/vg3fp07UB1n+sBkpJ6fLjZ30A1J0Xm?=
 =?us-ascii?Q?8rgBi50EYJiSnZ+WAti0oPQymgaG7MN2XG7xaKerj+WxnFEu6nQz200deir1?=
 =?us-ascii?Q?G0rnqaPWbjHw8pwgMiynMiFT3PSf6ayQPlCIhCqAYnsWbtlaTm3sjTbcMkan?=
 =?us-ascii?Q?jjFSAJenHt4/o7ciGjoujK3OuRy2I2rxym6hcMC1P2oXoF3ZMLO6mdcZFf6x?=
 =?us-ascii?Q?SK57aQIsET25jgiW5kkIDvw7S/4DogjoqGum455RdxgGP+Uc4thXBiLIDdIv?=
 =?us-ascii?Q?2lv82X84XnqZM4E6KPOQnrdlJGNFou3jLrA1BJ/AVJsCT99dTwAzkw9A39K7?=
 =?us-ascii?Q?G1pQTBS5OxtTgBxySThoZKWEjMrMHa1qWZiRj7YPdUCCMq9qX0sQ+l5DeECW?=
 =?us-ascii?Q?YeXG3dPGwtwJSdq+szQAgkInEaZHbmmbcjptThSXP123CY2AkwdLr+4CeBEE?=
 =?us-ascii?Q?lSRoTJWKxcpN04ris44788f7ophAnup9YtdwOgFsLHeX48KlcrUxs68iiIB+?=
 =?us-ascii?Q?z0ndoAPP9fQVqr/l6+h4bWsofnQ06zO/9iV0jsxYINfUUkF39CGrds3QzYAv?=
 =?us-ascii?Q?puP61HswlG/+iEhytqjsCGqo69PWCG08yUd2zglFVDfRKywW65FbaQsn2miF?=
 =?us-ascii?Q?sq+81YDLkHvKx/Bb6lN2nC/M7Yqb5eCKcPCmON7GkKkr/zS5+gEtqnLInTYf?=
 =?us-ascii?Q?4eRRQLczVyNscZQm1LRUDqyzok1jS6BkBThpTF571R8tWBvLNBi9uun3OCvP?=
 =?us-ascii?Q?8y/9tnfg//4Dy/ozuCIAtlamTo2adw/uSak8C7ay0j8qWZDPxAVFLABheOo/?=
 =?us-ascii?Q?xHXKxSreZimnkePWq8gjXWD0D30n2yHcVPfx3eiy+IXnOMNZRz4ho2b8DPZu?=
 =?us-ascii?Q?yBi6jkhHfL2RoRtAUAc40d1ZGKfVP/puXIhunxgzUbInnD6rPUxXg3W19nM7?=
 =?us-ascii?Q?oyS7leQUtQ0t7jedB+xvG6jeD4CpBSsZqK2gDOP+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae13b561-720d-4c67-1030-08dacccb8638
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 20:52:53.0941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIWxK51GQjSzCiCBvK4L3BeGQypmaEEiU+yBtGtPTQQs4dzwO4wz6VIvAk+syySBHYU5fhCRxlVRMtWY9ul8MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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

On Mon, Nov 21, 2022 at 03:16:17PM -0800, Daniele Ceraolo Spurio wrote:
> Now that we have the GSC FW support code as a user to the GSC CS, we
> can add the relevant flag to the engine mask. Note that the engine will
> still be disabled until we define the GSC FW binary file.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 6da9784fe4a2..46acbf390195 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1124,7 +1124,7 @@ static const struct intel_gt_definition xelpmp_extra_gt[] = {
>  		.type = GT_MEDIA,
>  		.name = "Standalone Media GT",
>  		.gsi_offset = MTL_MEDIA_GSI_BASE,
> -		.engine_mask = BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
> +		.engine_mask = BIT(VECS0) | BIT(VCS0) | BIT(VCS2) | BIT(GSC0),
>  	},
>  	{}
>  };
> -- 
> 2.37.3
> 
