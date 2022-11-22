Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50410634404
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F83610E439;
	Tue, 22 Nov 2022 18:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DCC10E439;
 Tue, 22 Nov 2022 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669143232; x=1700679232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fw5hdW+KRNDPt8sP8xQMcdEnizvQFxbcHOSWVLNOpQ0=;
 b=oDWJysims9XYjsfr9/pGx6TJRWcmX/CkPOw0C42vOSEKMr5003KQ1ayX
 YaOkr+t6B0LPfxYoD1FJdDsuYWa+3vWchnpC8HLJPGwdfU9hxG1as/kkM
 B1/GknCPsXm/ddf5L5mVM6XgL91C6Z3SC+aAcGmwv9BYzYe++BDyvYZz5
 +JJy94AKHKPSHm9ZAOlpWc2XJ1J4beL5Dv0b0qDDsupHxSzWXbDr1WH/H
 Grvj6cC606KlkYWdCUh28fU5z0ZYMpK83YeFnEv8GruiyzXI9O91tS4ok
 4mJug/MJ6pWh6Uz6hE8fZKr5fMfnSpbEMewgjlJvanpmSjx4swPODdzWO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294277800"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="294277800"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 10:53:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="970571497"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="970571497"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 22 Nov 2022 10:53:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 10:53:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 10:53:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 10:53:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 10:53:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHi0JgY+5TPYftelWCfjn6fS9cDxglCJTn6piJmq9jbOOTvtY/BhzND4Sohg5hi1+/b/KESiLyJFjOkjhzuUx9Z2jBnZP1fDk1FS3cnm5GHr2y8NJET01QjJY8wQ4X9Y2u3F8cs4J3Zu8Y8IDGcmkkHdp3VA6FhAI3ti6LE9GAu0zudRBWk3WNzT4ryb2CqYrowLLoP2GdZi8ufRwcN4Mm+WiH8N8x1b7ByjFvfNLxwXyWauNyfdbBGalQX0J8oB0JbV1uOqygeJXmkp41Kz/7jcDRUP0wCJtVvMBS+elWgjqSpvwt1viF9kHisYW8srjAKJms/CvDO1rwY3q2OOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVOLAoJGgfcKo1krGBWH0rhJRwUmYtmR4pMGfl9wJlI=;
 b=OBd96UYV3HzS4tBu6uBtyXgqlQeNWBx0k79l9wrBIplm0xeK8p7x+DHL4SdT7BxCvItR1+hwUQvsoKB3AgVsfjGOMmfQfwUlI+gt57yHLLLfDzHK7gbm2sNPZUrkrew4sy+OGi64cpQRRq4Q5xtrgfc0WjkYz9yEBDbZqqLS/9aMpG9lsl/sEArjRftU0+ME2eFu5Do4yS9fhPigRHkdGJJIXGU7U/xKACLdnvk/MuakLrac15eLA8Phyog4W/KUI4n5/HW47AkeWvZHDieWVy9t0+PolIE75WB/fVvXzuM3kGzdRNaCNEX2YHM8Ee+tA+Nw9aMeA6QBvDciDeKcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 18:53:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 18:53:48 +0000
Date: Tue, 22 Nov 2022 13:53:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915/gsc: Skip the version check
 when fetching the GSC FW
Message-ID: <Y30auWXksc0GGEOO@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221121231617.1110329-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 48214fe7-b44c-408a-28ff-08daccbae3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3TdKiNUJ+KUopXtapLN7hdRlPXty2ekxLOKw1SiD/k+1LzEn/Jynwa7kVFF8SFMKVy8q2HUKkgzSAv8roRSBZx0eHwPIrL/uwOSL4/2Hv70TbM16Qt+JYpm7igk+2FWBlzbTjyzttUbUgPbmcd/3e11AN9Ry/gyuDgmGOWc8DAMir/byz9Rp5HyCI45M3ieWH08pgwvACGWHXrhnY21M/6+L6DY8lw36FkwDIyBW90nZ0+cLuH/Eg2B3PmFTvEMYPq1zo8tm1A9rLd14sMuHIUL2YuUrd/ACZSUmRItISzy5t1uMqhFOCRONHA4oyrUKSgkmDZD6hPnDkPsqiphxjVf1aKHj+ECNmt2XrnBQnyaFACuxyvG9CfTe8OZk1KWg6LWsDcIKCtHlSIwGlKLI1mWiX1iM5ZaHNhyZ5vHisS7aPjdzGW1mCgQZ7/iYRAcJjZFVeZU0VA2sQQ3OWtx0M3yCyzLkjUPlz9EDbvICd2pVJnhh5PFzkBPv7dnYBgRWd7IXquD2GnAsld4JcAQC1ldT120DB133oN+7xM9ro5rqxsuTcdAcJie0UqARLVUqo6HWGaNi/Mklo/FXUhpYdc6yuzoaC5S+nTlltsX1YERrCuoKeGzguvR+lowP/ThhmKPn/r9fcKL3fLa775clg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199015)(6512007)(2616005)(83380400001)(82960400001)(26005)(38100700002)(186003)(44832011)(2906002)(5660300002)(41300700001)(6506007)(66946007)(6486002)(37006003)(6666004)(478600001)(66556008)(8936002)(6636002)(4326008)(6862004)(316002)(8676002)(66476007)(450100002)(66899015)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ryuLeufVUOeB84cl2za73UekAuW1pkVdHRUsv2cFnoP/IbxHBHrFMgphtpGr?=
 =?us-ascii?Q?nhxxxwcrGztle/ab3RE7Si6nfxo53OF6PmZhQdDm8V+pbxmv5pJJ3SjTI6a9?=
 =?us-ascii?Q?cMAzcz0z1KQculuVnhQkzjE09xPn0WO/AuTJqUQQUT2yc3FVyGHKNlroUN4v?=
 =?us-ascii?Q?+9tgwBX1G4OeSGV7XEBwM8+4xyR3wXkmoYx57H1uX0/K8K/pLMwsLlEWWUAL?=
 =?us-ascii?Q?iz6OQpR6CrCMSwuqfL1HjsAPxQxIXljMirkSgc1a0Zs/evOzgOzmXlb/9TUU?=
 =?us-ascii?Q?Cyy3rB6q3Y+iQYBKHWWBP+ENE4jWQE3/PYUZAE6Fal68lYBWXA+gLfoJJbuc?=
 =?us-ascii?Q?gG7KQiSzrSpzEmFdHH8lo73bp6nnjbnQGDz1wSDXSx24K+UlJ40TP7JE9gSJ?=
 =?us-ascii?Q?G4LllO9MevUwkZRS7WqHgLsrJaddrXMVRgGWZukv8vU8WN6l7HkskRIPtKWO?=
 =?us-ascii?Q?00blPWeZlHATdNS8ov+kBXqjIV0QTaoI4Tjy7GZf4eytsfFI+9PAP85fkKYc?=
 =?us-ascii?Q?tZn2JVHtFZIQL3PjacAggx/t5mLrdyayBEwaZEHQEjQqvFPbtJ2rZh6In5az?=
 =?us-ascii?Q?IdX6E8z11qpq3gqKxHA7XDi0s+pRKMcB/zIyE7rCGeQIlGU+EzfPGfuTKGTA?=
 =?us-ascii?Q?X9HgC4Wb8GvF0j86VflrLxLuU7rLVnF1/PJLucOIFNopTvTzYlf35q7+stDh?=
 =?us-ascii?Q?E47t2a+xt4DV904Y0021F32lV4AbKBaZVMAZMgY85Hn1jDeELR/O5piZgXAf?=
 =?us-ascii?Q?5hj8PyS8D8n2yGHg8/pj/wWpQQ5tJW1CCHBKo5YGhmnWscS+ziY9JbVHeN4g?=
 =?us-ascii?Q?TvCSD7PEKT9hhsbtxxf2X/NttesAH8wx//eGSFq1YIjIGPUKuUOieqnI2/F4?=
 =?us-ascii?Q?XJJduJkMdgf2sUrzgkro4SRBnVqphADJx09NOulMJCzH2fw3gXny2SL9U7wa?=
 =?us-ascii?Q?BUsSUC1Ng55kjn+6/WM3kbHrz32NS/2muZnoCK0+o9hkqlkSk1qQeA8L+qMe?=
 =?us-ascii?Q?l/ai9sNzsr+ofWV7GpEs+PGHVE2NPorhfBw5kUjRY46VL7J7I9917eDbVlQj?=
 =?us-ascii?Q?rIQrUW4sZEHRrjIzatxA4+bUS/HsCvjPWHLDMJ3mKoC0r7nEnefWXoYVQGLk?=
 =?us-ascii?Q?Zh5B+FTHSYfJ8+kb1loLD5rLpGQShW2CxgzlVYB0a2isK7nUQVdMpET6kcjP?=
 =?us-ascii?Q?E3etVJYmyPqCPcqVC0ZGVeB6aFiy87V7fMtLYPGCkCvBU3agIcXwxFq566S1?=
 =?us-ascii?Q?spTYtF6MPJcrsvBjUJX9BNC0qf9R33BHK9Gygap//JNM2EStEBRJgiioinzO?=
 =?us-ascii?Q?OCUvfgag04q8/KqcyXj/NpFeWDSF8K+lVxcwFz+8/5TtI27qq2zRw5WIHqQh?=
 =?us-ascii?Q?nymo/Nt16YlFahISBNxp05etEcB5VcmZJBQnKiawj+/ESz/w6YvF4lbPMCdG?=
 =?us-ascii?Q?JUaldKG/ykA7XzfVUN7nIz8s6Mrwv6UDBD9nHbkCNjR5jKVUJ15RAgYgSiU4?=
 =?us-ascii?Q?rl7ARQXcTliPIkKqqrI0WyJkG/JLI+U/Igg0P4vOfyJuMMaRAGZUYYii3GXU?=
 =?us-ascii?Q?poOEHSZ03dccfGWxw1oFg9hHx16CNsOW0KIV2UH/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48214fe7-b44c-408a-28ff-08daccbae3cc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 18:53:48.6949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNmGHQe8Fx8hYRK/4wpyfsUSWvNzu4ePzxkJpMhvuBsC641l0FB0WkxpChzFPmh/6FtKrxPGf6/4R9e2e2QxNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
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

On Mon, Nov 21, 2022 at 03:16:13PM -0800, Daniele Ceraolo Spurio wrote:
> The current exectation from the FW side is that the driver will query
> the GSC FW version after the FW is loaded, similarly to what the mei
> driver does on DG2. However, we're discussing with the FW team if there
> is a way to extract the version from the bin file before loading, so we
> can keep the code the same as for older FWs.
> 
> Since the GSC FW version is not currently required for functionality and
> is only needed for debug purposes, we can skip the FW version for now at
> fetch time and add it later on when we've agreed on the approach.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 29 +++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 5b2e4503aee7..3df52fd59edc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -564,6 +564,26 @@ static int check_ccs_header(struct intel_gt *gt,
>  	return 0;
>  }
>  
> +static int check_fw_header(struct intel_gt *gt,
> +			   const struct firmware *fw,
> +			   struct intel_uc_fw *uc_fw)
> +{
> +	int err = 0;
> +
> +	/* GSC FW version is queried after the FW is loaded */
> +	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
> +		return 0;
> +
> +	if (uc_fw->loaded_via_gsc)
> +		err = check_gsc_manifest(fw, uc_fw);
> +	else
> +		err = check_ccs_header(gt, fw, uc_fw);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  /**
>   * intel_uc_fw_fetch - fetch uC firmware
>   * @uc_fw: uC firmware
> @@ -633,14 +653,11 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>  	if (err)
>  		goto fail;
>  
> -	if (uc_fw->loaded_via_gsc)
> -		err = check_gsc_manifest(fw, uc_fw);
> -	else
> -		err = check_ccs_header(gt, fw, uc_fw);
> +	err = check_fw_header(gt, fw, uc_fw);
>  	if (err)
>  		goto fail;
>  
> -	if (uc_fw->file_wanted.major_ver) {
> +	if (uc_fw->file_wanted.major_ver && uc_fw->file_selected.major_ver) {
>  		/* Check the file's major version was as it claimed */
>  		if (uc_fw->file_selected.major_ver != uc_fw->file_wanted.major_ver) {
>  			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
> @@ -657,7 +674,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>  		}
>  	}
>  
> -	if (old_ver) {
> +	if (old_ver && uc_fw->file_selected.major_ver) {
>  		/* Preserve the version that was really wanted */
>  		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
>  
> -- 
> 2.37.3
> 
