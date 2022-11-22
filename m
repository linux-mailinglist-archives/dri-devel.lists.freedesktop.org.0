Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F36348AB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DB310E471;
	Tue, 22 Nov 2022 20:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C4710E46E;
 Tue, 22 Nov 2022 20:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669150004; x=1700686004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cHX9562mKpDoRis6B5DtPYffnp9ez9aaKemd/Gsu/DA=;
 b=hkfsBAxSz+58aRB8n0QiEqy2RM2ALbA/8Lu+W/bAKCamXRuUcs26xuoI
 0zwUoPDmljkVLH5lyvx7chNFEuP4Qn+AIW+dqtI6oDf4tgXnq5NJIJTvL
 33A1E9MNraqdyMUPlvwXyfy/wuWdek4A3+7XJsEGVdDoj6o1x2XML0mmM
 HL0qnGSXgx0U6DAhQ4Asa1mbp7aEzcQ/Bh2N220MzO1sjbDU5BXAgt5TC
 fz7Fy+4sWhLBg13BnhT2UXIv+RzJQxqkEfue1vnv/v1OvLQRjqtbnKebb
 r9akRTjdw/+yqBLjMUrziDozqIA76M5F4YLDesshe7hBq/SN+yH/FIX9o A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="340785335"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="340785335"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641547291"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="641547291"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 22 Nov 2022 12:46:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 12:46:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 12:46:42 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 12:46:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUx8dKbBl+7iF0fN6VKRBWwQz0brhkFrV8qkcj2SYbcY5Pj72PNjl/UnWHyV8UlmzP5wwW9WkFbpILC0DlBROmzbuYSxmc6NNGfpVHhauGhlDnZLrEuTjXbmljQCsFqNvo+4agtoscY99K2niDzCj/Pfa0QrvveBV961mjlpYqRcok/I4BT4Zb8d57dFhJBpOl/Eka+FecX0zBKtkQyMo09zLt8q8FC0HUvugVXLBAScSSayAiDbk/ykEts4RKI1vDoUZaPUlQWjo7UPGYd7UlaVOVnxyCrG0RkGUQ941g7ognKVx3HqvvXlzrILJBA6t4FFtK/2Yi1MFBKLaX7iIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqGSpMFOtsYKDHDPo3pPB0YDpmmYPvsaAkVHLGVeVP0=;
 b=jBvpBMCmVIn1w6/Jopks2s4v39u7cP0pi+C1qTzUWyBJv+6VAMLmOGPkhoR6j/mSJDPQG5gEI7egu5cocGO6tdOe6CKi+wyyYU6xJ1Vidmxg5MzmvyTry6AxMs14A4twJ8jonWqArQYHI7zRAXCu5Q0NXjS0uwLRjNGjnf641tor4NWxQ5Fw3o5Tq+ZK9380LVvqlRxA0QAgloVIxtsf/l/veyi/EOyhSOg4rSIqtnLRQmAbdomeVj7w22kvIikKWYWrMWvtjGvFDuKFGDC1o5+K3djUhnyQ/jMMgntQcvPzhJYel+8PknrZ8uSaOCYBl7fU/qwp0DVqsn4ptBVWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 20:46:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 20:46:40 +0000
Date: Tue, 22 Nov 2022 15:46:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915/gsc: Do a driver-FLR on unload
 if GSC was loaded
Message-ID: <Y301LJvlfcUh7ADn@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: e8509bf5-4573-4752-3fc5-08dacccaa801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Go1fxu7S81HIHPXJfjzmvnB0pPwJafHS7ffJyL0l+nkA1Gise/Il/9YtbatcIESrtt0RYreHmGDwUFFyvKKffov8F9LESidbs8UNinYL+eT36431YUBsHmCwIfo/AOrZRVquyauMrdBBwm0ywjPLKFcihUI9lcpOGwky79RRavJuQMk9Bg2pGFeNW+EaioZN/SyABnhJO4XlhYXMx+rOvSF2MA/p/KjY8Tfmz0IzrKCMJHZdKrKCy9M+FySXCB0XsxVy+lYWOpbYM6Rqn9ervZAVz3STxR6zk3U7YZTDy2iMfCNr7NGIS6bhcsBWk1QM4TgHPM7P2fXVRIbg0tggQOXaWtcejqmYahyk0RPXJFErtzI3n6YU1DH+W6lonkIyuuee9scA+CLwud1WP0BN3o7lEXwjP3BNTuHSZjuOwGGUUagsAh/Ea1+urRMAmeUVPseh53X5BexBzd5/PxElQjNP0BrITwylVFpWU51RSZwTLPlqoVQMmU7cbm7xlLRKdhNgY5kmCo06yd5X3hmix2uqENT3PUSG250IwBGkxu94ecbRq+AP6WLnAhk6rwvh/E+Sal4UESgZkfIXWS8VF5V3eK7NNxyBT87ntzziVfGKhqtM+y0tkdHX5J81oEJo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199015)(6512007)(2616005)(82960400001)(83380400001)(38100700002)(26005)(2906002)(186003)(44832011)(5660300002)(6506007)(6486002)(37006003)(66556008)(41300700001)(8676002)(6666004)(478600001)(316002)(66946007)(6862004)(8936002)(4326008)(66476007)(6636002)(450100002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zp+h4s+xYAzGqnRUTF8tOFeYbwBJjvnItOEkx3EOyEnIK/w10uKEvVgIkvpZ?=
 =?us-ascii?Q?4kBnafSaeoW8H40+faqe6p121NooQFKHtY/04t1G196ZOZxxI+DbEkfXunKn?=
 =?us-ascii?Q?46W7i3UK/kWhvhxOq+/VSD+adOlxN/CkyiEPnRD3gAxLE8+253mubcMd1iDM?=
 =?us-ascii?Q?m9P0sfq8YcvKWZAooQvfV/fm73Sr1ZKg7eEgLIsSY0BJdP2kiKC9NeoL+GB5?=
 =?us-ascii?Q?vCy3ob5C29SFmFPgbZPlPqhuspUrG53jKh8jLYLj+TVQh3xDzqxG+Q3x5h/a?=
 =?us-ascii?Q?5pVeYqaDDymjx/P5SeT/wfOh0Q9/tzXW4ctUXKTfAMvlJyw3wx03TVM8OrUP?=
 =?us-ascii?Q?GD2oA8x9nBs2gfe80YRbWHhDsQExPgati/Ij0VaRzDvp7+KlC6lRMawELZWV?=
 =?us-ascii?Q?RIIQ7Is/RvhTXU4UM27yKVXz3LyapkwCkH0Z8nlhJtmmlfkG/zJgnLrZFxvs?=
 =?us-ascii?Q?1FYokZYLX5iGFZOzhLErH58hhC3qnDW1u3pszULi51v+NJJFD0dRcYT7xbxK?=
 =?us-ascii?Q?oVuWMVh/iPOOtZPerwzZ5Jl305oBgNghYA5SyIPFgIPdqQ1JQoTWyt6HYKzz?=
 =?us-ascii?Q?aP3epwRAZg+sDkCLPEKzL2fpjjMKgkrER/5nMEw7raJaZiSW02+LAL/0n+iL?=
 =?us-ascii?Q?HKoOwWS8m6fzfQCD/4/XBuFU0DQZKGlM0l/uENwVjzIdF9YVg3XOBglFNHIk?=
 =?us-ascii?Q?Hnz0Bic1NvBuYF8LJSej15twxThMFshz4btVbJg7arB3VyMqOaZWwsE4Ct15?=
 =?us-ascii?Q?1XcncgbaatqNfi769t2OSMAU2zDod/x9C6cDYEiE4bGXr+/mYl+CmRN+rZ/n?=
 =?us-ascii?Q?ZPOs8y8GYHdPdr4Fi/MpMyG7QiZFXXfYtyRXrQpot4sQjD5/QDuiilrV5q5q?=
 =?us-ascii?Q?jmcmhnMPevWyPJ2ZQotUqP+JDAcpaCj2+HYR6ic8PoZZ8j4Ny11OsxRiY4Wb?=
 =?us-ascii?Q?LgzjwBArrM8UIFASKMyTQgaI2vyUCUzI5nPkF6g+LapoSHLL/bN1fZzrV7yg?=
 =?us-ascii?Q?Xg0WQKAeQ4InYPV54ue6MnK8YFDtmqQMq+f9QOuyv9iBE/Dd7bkEKLsoYwi9?=
 =?us-ascii?Q?xgFWQU/wzGen08mRYtq3auBMfS4tJCHdOVXl7yiLLpAnkcOydhr2zwrsNpSq?=
 =?us-ascii?Q?j4PvGOMLAqI4jN5VhuCORcNMmbxsPYJjwakY/AOIM0JV7dhZHhlu2v/Se+3v?=
 =?us-ascii?Q?+JgcZaMJi6jlWw7UvWwhHkw2evieUH2cgtGOQunJl1GMNzk5AY41COp0O5LW?=
 =?us-ascii?Q?MRlUSprCogHblxrwliC9h7QQJECS6fvWrQwGw+74DTmo7idJEM2LtmW5sDd+?=
 =?us-ascii?Q?A/6N1eST9NhB5l5XlWMWElO+P6L9taajk6YikxxCEin0LSvd8+YYy1U6VW3I?=
 =?us-ascii?Q?eh6zyVdzuL2V2CdtBA+8z0nE+/ZDnUHlFtc4P0hjlDMURLJ/yjzKj/3uMH3Y?=
 =?us-ascii?Q?DjeM1smwt4BKrzGaip+CfaB2ba18CDvADU4sj/KpirJeslfGMay8Z2RmM2VO?=
 =?us-ascii?Q?vH4P+6+/GlTn4KRZelUP+HBbNQPihOC6SYPDuVnSylZQW99fcO/dGWvkbnGO?=
 =?us-ascii?Q?Ucekru6x1owkZJnvctg/hIX6ApPkrcCldZ5qitLU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8509bf5-4573-4752-3fc5-08dacccaa801
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 20:46:40.3910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCALAHIwg4gnbZOs8oe0s0udgxVjfQdeZTwopA1N8SSCCx0qgKqSX2jj/w1KuHPD3vRS50SVI/8rrOqON5p9bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 03:16:15PM -0800, Daniele Ceraolo Spurio wrote:
> If the GSC was loaded, the only way to stop it during the driver unload
> flow is to do a driver-FLR.
> The driver-FLR is not the same as PCI config space FLR in that
> it doesn't reset the SGUnit and doesn't modify the PCI config
> space. Thus, it doesn't require a re-enumeration of the PCI BARs.
> However, the driver-FLR does cause a memory wipe of graphics memory
> on all discrete GPU platforms or a wipe limited to stolen memory
> on the integrated GPU platforms.

Nothing major or blocking, but a few thoughts:

1. Should we document this in the code, at least in a comment in the
flr function?
2. Should we call this driver_initiated_flr, aiming to reduce even more
the ambiguity of it?

> 
> We perform the FLR as the last action before releasing the MMIO bar, so
> that we don't have to care about the consequences of the reset on the
> unload flow.

3. should we try to implement this already in the gt_reset case as the
last resrouce before wedging the gt? So we can already test this flow
in the current platforms?

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c |  9 +++++
>  drivers/gpu/drm/i915/i915_reg.h           |  3 ++
>  drivers/gpu/drm/i915/intel_uncore.c       | 45 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_uncore.h       | 13 +++++++
>  4 files changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 510fb47193ec..5dad3c19c445 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -173,6 +173,15 @@ int intel_gsc_fw_upload(struct intel_gsc_uc *gsc)
>  	if (err)
>  		goto fail;
>  
> +	/*
> +	 * Once the GSC FW is loaded, the only way to kill it on driver unload
> +	 * is to do a driver FLR. Given this is a very disruptive action, we
> +	 * want to do it as the last action before releasing the access to the
> +	 * MMIO bar, which means we need to do it as part of the primary uncore
> +	 * cleanup.
> +	 */
> +	intel_uncore_set_flr_on_fini(&gt->i915->uncore);
> +
>  	/* FW is not fully operational until we enable SW proxy */
>  	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 8e1892d14774..60e55245200b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -118,6 +118,9 @@
>  
>  #define GU_CNTL				_MMIO(0x101010)
>  #define   LMEM_INIT			REG_BIT(7)
> +#define   DRIVERFLR			REG_BIT(31)
> +#define GU_DEBUG			_MMIO(0x101018)
> +#define   DRIVERFLR_STATUS		REG_BIT(31)
>  
>  #define GEN6_STOLEN_RESERVED		_MMIO(0x1082C0)
>  #define GEN6_STOLEN_RESERVED_ADDR_MASK	(0xFFF << 20)
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 8006a6c61466..c1befa33ff59 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2703,6 +2703,48 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>  	}
>  }
>  
> +static void driver_flr(struct intel_uncore *uncore)
> +{
> +	struct drm_i915_private *i915 = uncore->i915;
> +	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
> +	int ret;
> +
> +	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
> +
> +	/*
> +	 * Make sure any pending FLR requests have cleared by waiting for the
> +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
> +	 * to make sure it's not still set from a prior attempt (it's a write to
> +	 * clear bit).
> +	 * Note that we should never be in a situation where a previous attempt
> +	 * is still pending (unless the HW is totally dead), but better to be
> +	 * safe in case something unexpected happens
> +	 */
> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm,
> +			"Failed to wait for Driver-FLR bit to clear! %d\n",
> +			ret);
> +		return;
> +	}
> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	/* Trigger the actual Driver-FLR */
> +	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
> +
> +	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
> +					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> +					 flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
> +
> +	return;
> +}
> +
>  /* Called via drm-managed action */
>  void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>  {
> @@ -2716,6 +2758,9 @@ void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>  		intel_uncore_fw_domains_fini(uncore);
>  		iosf_mbi_punit_release();
>  	}
> +
> +	if (intel_uncore_needs_flr_on_fini(uncore))
> +		driver_flr(uncore);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 5449146a0624..a9fa0b11e7e4 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -153,6 +153,7 @@ struct intel_uncore {
>  #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
>  #define UNCORE_HAS_DBG_UNCLAIMED	BIT(2)
>  #define UNCORE_HAS_FIFO			BIT(3)
> +#define UNCORE_NEEDS_FLR_ON_FINI	BIT(3)
>  
>  	const struct intel_forcewake_range *fw_domains_table;
>  	unsigned int fw_domains_table_entries;
> @@ -223,6 +224,18 @@ intel_uncore_has_fifo(const struct intel_uncore *uncore)
>  	return uncore->flags & UNCORE_HAS_FIFO;
>  }
>  
> +static inline bool
> +intel_uncore_needs_flr_on_fini(const struct intel_uncore *uncore)
> +{
> +	return uncore->flags & UNCORE_NEEDS_FLR_ON_FINI;
> +}
> +
> +static inline bool
> +intel_uncore_set_flr_on_fini(struct intel_uncore *uncore)
> +{
> +	return uncore->flags |= UNCORE_NEEDS_FLR_ON_FINI;
> +}
> +
>  void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
>  void intel_uncore_init_early(struct intel_uncore *uncore,
>  			     struct intel_gt *gt);
> -- 
> 2.37.3
> 
