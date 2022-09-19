Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9C5BD79B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C5610E1B2;
	Mon, 19 Sep 2022 22:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C93C10E1A3;
 Mon, 19 Sep 2022 22:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663627610; x=1695163610;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f5dR5RYTWZWTVug5iu79iIb+V0p7d+0glDhbinWwjNA=;
 b=ZGC57aqPKfV+lasHeBA6we7mJubuTj4QdQjpGg6eWiLNwcxIjI8b7e+W
 3zAgIpgutGepwXDBJ9SR2n0uMkhLRKpy7gn/onh4Xu/Wgnu/bPkHBC1s/
 KRbnSGH40r5BINXqadD9ysnpYr/aMFxde9wSQ/wbT5nrIpCFtpf406/EG
 rTb2/0vXqvUnrQwUIJQcuBPznTb3A/kW9nS1cELdptV3JeIOOTbJTAkgS
 PApdSXvb+H14IoekAjVSnPdPmUZNSVB00qg56kKUbDddFYkga++zrcuM8
 tmKm8xE4pkDDzZEJoT3+t+HQ92nw0XjxYyOAFZiSoNAf7Pb+tftW8ad5g w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="298267061"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="298267061"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="614168928"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 19 Sep 2022 15:46:49 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 15:46:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 19 Sep 2022 15:46:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 19 Sep 2022 15:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmVJY5TvclTnBODg68oTCzKnQ4Ry5yu8wG584l4QOQo9hedEus6Owfli8k2N+Zz8xEkqosd3d52ZIz+wTQxwcQoj1qU43DkYF3LAkFGCpY39x9C74T8Qn0vXH0WDnmzxRhI0uRl00tLmVRw3+C9YPCpelyShTwZDp3Od8OzBt8JXPgQbl7dLBAPka3IjNucd7rVyec71SryqCf9scSjroWQXk8iygdhi84ilsoL1vd8IiqaGcKIpuh2t8yArr2p3HUo9lLx64LfhFKAj+mVJLdrPpW6293ErFP2erhy7G1oUqQgRHFyVagqxjKp7W1tMO4S2J2bVa+Kjb/CZGsnNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4nfg9c4TrcZHqjoPX17B0vHQGbSV1HmCG457Bm7TRo=;
 b=A7OoPZ0Dw3YL4u4WvaVJ9npJ7WGwwizKJ7XMgb73hsnFwZ5O5C4MjrXCxXMKEm8oBPcqN2n7ZfvqtS3EoHIGw5h+SA3E0VP9HObhi97wBz7PSNa4QVY6XNlLhUx0bKh0D1aR55Gthl58lAOKwgNDl8BU+EYwKTHWOuFEPH0/bBe1DaHDMNmprERdkWMiqxwufB+b1um7ArzBAZPyMeqQ6YGPpTQPseWhJOS9feaTMZm7ECk57ndqy6Iwzkn45hIdcLQFTVOw71sTQMFCHkd3E9G2W4hzE2JXAjuqrCgPyXlR85DWIkhRnvhFuoaWsGAL52PUPmH81I9ki2o73UOVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 22:46:47 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5632.021; Mon, 19 Sep
 2022 22:46:46 +0000
Date: Mon, 19 Sep 2022 15:46:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/mtl: Modify CAGF functions for MTL
Message-ID: <YyjxVHRRTOZAjQod@mdroper-desk1.amr.corp.intel.com>
References: <20220919115906.1264041-1-badal.nilawar@intel.com>
 <20220919115906.1264041-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220919115906.1264041-2-badal.nilawar@intel.com>
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM4PR11MB5456:EE_
X-MS-Office365-Filtering-Correlation-Id: 976700f0-f864-4f57-ca5b-08da9a90d50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gfnw+nfFrpkL1qsKIyNoBlUtTYnkSlkgfZJcFPMepSjkK8vZFwBjnPLQbrcqd09IDRFgddz+MTicQUv2BsHELazZZRaJCjt0t9wMHNNeeCU2CzYiNR8JeSzkGoZgMtFgwV7NxhbAL2AQwC0XLcJEFX/By4uoWLM4Et86I4Fuolp568RdkDg/mzUSoNsaYm0S+Ls19VQmpFsrNe77OMDFfyOY58srRL+lAx0Px7FL3MHpGyVvumRPML4ZfZz/zR9xMSBgnCoIZKA+N9zy/xT6k5J1h9FcyhQmBYT3hpulcg4IJ5WXnx8JL6LC4sOIpKYaAdQhQBxCssvbb+ybWNRRsOkAMzwg0tWRSIOBL+PjI0CWk2+2uoVFDbC9WsGb64nCzbPuChQ7Y3U86Vnx0pZ0TX78ilhrz8qWJOhmJdu90TThpfVsE0ix9pGAuZberVxC+VYaEai76NNYrt70RODoKlKa7T+R7JEBX72VOLjjGMO6cOY14AxZFG1tS+RLMZfZifbOpOtqswIUxY8NVDTbdoicAA2ZldlMvDWom6Axj3vMoe9DKZtGtmP65cYs4M8JQeigeWcgnDdebEHOAvLE+hXM/E7vnkVj4LG5VQ9hpvI4QtDghZsard8xdhUNWQgR3K2xt9T0O0cGweejwJLt/+KM9BKtusu38TzxjTFLoQHZJWqcju/AtMPtFt2pgTfSIR3uSnVGqQ0DOYZuQVgzZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(2906002)(316002)(82960400001)(38100700002)(4326008)(8676002)(66556008)(5660300002)(6862004)(66476007)(66946007)(450100002)(86362001)(6636002)(8936002)(186003)(478600001)(6512007)(26005)(41300700001)(83380400001)(6486002)(6506007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?loR76V7PVnQqCtZT5YbMSH+FhkJpijiH8Vy91vl7OpeMinaZpHjTq7nWTt5U?=
 =?us-ascii?Q?Vg1l058ivPfYElh/pF+AS1DfMrYocPbauDSQGfySCJy7cE5g75wjpt7+GQGE?=
 =?us-ascii?Q?mrAbnRCp0wlxUfsIs7IaEGGOM3OgK6fHVkWWXdQfmNicRqqA5qbLsVPWCjVr?=
 =?us-ascii?Q?0yZIuXypCjm8kY48qaFZzp2K4T1mPdc46r3RNKQla/MRTgu2aB4t5zH7czsv?=
 =?us-ascii?Q?0KLLhRN8m8WhRxUocb8SlGM+VTMFyocAcb/m3h9johQRnMAHcVJ4rhSlWjWA?=
 =?us-ascii?Q?eemEjBTOD0JlZ2+tUijpLhhf4rBhPph0AIUMZVwXMfSfxfy7jfH9RXftf9sN?=
 =?us-ascii?Q?yP25EPl29ezAUwaWs920WzAE2xGuVtu7rtvAq6i2vY37lIk77eKhiJw83RtZ?=
 =?us-ascii?Q?QJPfd/4eSQhNG13SLvwRU8X0OHSufSQZudQ3ML3XPIZP3+LhYfvmQsdgxTK/?=
 =?us-ascii?Q?PwmuCrGIDXi8i7kSzDp0kz5bGcTniFNeXFOXFsTCZhcvNHs4Ioiy80sattHP?=
 =?us-ascii?Q?bpioWJjlttrkMTb/j2i9zuw8n/f7A3HiPdpG5HoTtQ9yT7lkj+lE1IAXW0z7?=
 =?us-ascii?Q?w5DiZgXaZxJbHbcz5tWV+jkehjHz1rw7L5f5RNQmaTd7xWPtgJGaf+ISS8LG?=
 =?us-ascii?Q?l1YZcBIRv01voSFMYQBHfKEHOb6FmXyAi36i9TY2/cNeRc/eWLg/rfo3PgcS?=
 =?us-ascii?Q?SqGxRzeMhpzKA7Lctm8VTbztjpxExk1eRfFvFDQ2MQVjtmzU2mDFVdMha3Xk?=
 =?us-ascii?Q?30Pdnv82uSxHWl/iYwDz9nHE79BzcRyrtTJ12uqVXp5RYGDEw+avkqRCvO7L?=
 =?us-ascii?Q?wPxK0OtsK1X+NfajppONf9t0RE/VMz+dHaBabkh3Oen0cKFUYWZIUiVkBDej?=
 =?us-ascii?Q?mO2nvFLj9TMliMnyogzg2doqaZmP1eG6164TnyX8/VJRAhzbhtkDpg1LRxwh?=
 =?us-ascii?Q?AaZS2+eX5VshiKJDaSrJuyLmfW3rXrKVPEysMhKSCco7wFVtdDwkzgGGSd8Y?=
 =?us-ascii?Q?jCWL3WHdh55j53Iw2rXKe29Nx+fqmUcxCqFPDw1g6m5DgHjnL79yKcGC7pbu?=
 =?us-ascii?Q?kWDy3ma3xSTP/O/v0DpbrRAxZYm8Ys8zy5NLbbYDr9u26GzktB2dLEFjF0XZ?=
 =?us-ascii?Q?y19p1Q4Y4hjQA5SVTuic9tn0BD/rne8MmfMYtpX/woFFbaFl8jnKQiS4ranj?=
 =?us-ascii?Q?B+fpYbw/R3ZXepDEC9GT1Sz9Fu5/eI8kqpZXCJ85QHJS8CkVrEdrmgIjw9mv?=
 =?us-ascii?Q?ZCB7uk2HFbImZKqvti6zQH3CbhSQlpHM2lDWsJsvKlO3i+GABaJHuNjld3el?=
 =?us-ascii?Q?Fn95ZHyulir3vQS0v2iV7iCEOXBrSLewbSdkCoYQz4D2u0A4J7P78VI6xHDR?=
 =?us-ascii?Q?m3+jn5CGigZVxRIoeIJhj9jp78X2Ya3X185fRbDg8GqFZaRCq2SNbKqSfvsg?=
 =?us-ascii?Q?iKQ1pwaMCfhTabx7QLU7p5vpIU9YJMsR9NX0sQ87Vmo4wiXiWgNqTZcwuMOZ?=
 =?us-ascii?Q?ERQ+7AOXb6hgVeAPRgcfVZW2wFpFYpLmb+51grPNh6zh2DQldEUW1NqsqbD5?=
 =?us-ascii?Q?zb2TAmkd1TLQKn0xJVC3UDvEO6VifZyCWF7k8sNilaqJFFjWvS4vjKXH1c3Z?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 976700f0-f864-4f57-ca5b-08da9a90d50f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 22:46:46.8615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX1v01LcfpSIKgzNOLnzX0wnpUUbc7zbaCXYDXeJiSxgOk6uRu5vpMsZt9IPbo0/SBQChjXlj6Y+SWrgWU51IrGNKWFrD99loLvj63DOmsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5456
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
Cc: andi.shyti@intel.com, anshuman.gupta@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 05:29:05PM +0530, Badal Nilawar wrote:
> Updated the CAGF functions to get actual resolved frequency of
> 3D and SAMedia
> 
> Bspec: 66300
> 
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 8 ++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.c     | 6 +++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 2275ee47da95..7819d32db956 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1510,6 +1510,14 @@
>  #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>  #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>  
> +/*
> + * MTL: Workpoint reg to get Core C state and act freq of 3D, SAMedia/
> + * 3D - 0x0C60 , SAMedia - 0x380C60
> + * Intel uncore handler redirects transactions for SAMedia to MTL_MEDIA_GSI_BASE
> + */
> +#define MTL_MIRROR_TARGET_WP1          _MMIO(0x0C60)
> +#define   MTL_CAGF_MASK                REG_GENMASK(8, 0)
> +

This register is at the wrong place in the file (and is misformatted).
 - Keep it sorted with respect to the other registers in the file.
 - Write it as "0xc60" for consistency with all the other registers
   (i.e., lower-case hex, no unnecessary 0 prefix).
 - The whitespace between the name and the REG_GENMASK should be tabs,
   not spaces, ensuring it's lined up with the other definitions.

i915_reg.h turned into a huge mess over time because it wasn't
consistently organized or formatted so nobody knew what to do when
adding new registers.  We're trying to do a better job of following
consistent rules with the new register headers so that we don't wind up
with the same confusion again.

>  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>  #define   GEN11_CSME				(31)
>  #define   GEN11_GUNIT				(28)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 17b40b625e31..c2349949ebae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2075,6 +2075,8 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
>  
>  	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>  		cagf = (rpstat >> 8) & 0xff;
> +	else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		cagf = rpstat & MTL_CAGF_MASK;

Generally we try to put the newer platform at the top of if/else
ladders.  So this new MTL code should come before the VLV/CHV branch.

>  	else if (GRAPHICS_VER(i915) >= 9)
>  		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
>  	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
> @@ -2098,7 +2100,9 @@ static u32 read_cagf(struct intel_rps *rps)
>  		vlv_punit_get(i915);
>  		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
>  		vlv_punit_put(i915);
> -	} else if (GRAPHICS_VER(i915) >= 6) {
> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		freq = intel_uncore_read(rps_to_gt(rps)->uncore, MTL_MIRROR_TARGET_WP1);

Same here.


Matt

> +	else if (GRAPHICS_VER(i915) >= 6) {
>  		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
>  	} else {
>  		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
