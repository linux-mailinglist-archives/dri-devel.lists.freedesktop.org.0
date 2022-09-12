Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4405F5B5D38
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 17:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D9410E5B5;
	Mon, 12 Sep 2022 15:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266CA10E5A6;
 Mon, 12 Sep 2022 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662996777; x=1694532777;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qJLYusFJDq+PMs02ep7vGgp8KFK0jA92GgYffIKtONI=;
 b=g5grASdfIleM1s9Nqz5lLbdK5gL3jqTYiACOEJTmeHbkZq9D6HpCVWmQ
 EZ+1EbW9GtG8i+JPhHSyLkV1HPSS/wLKv2b9XjM3pJFEJzyt6XyDlXOoj
 qUzvnSLzrQIjjjFExu7ggAu1+/FfGALUklvG0qo8vWOFN7V8wWix0BhdL
 KsUFx996rXeeGeVTgvnqK5qtn7/eMAYQpQAh1qPdgsxHueCuWzPj0sddI
 N/9HQwOURYb1gelt84kpGzEID39v4gljh9JqBYf58xPu7z5Gdthc0RDL1
 rVufBdgN2M3o8IyXGk/0i5LpHI5dc7NwxGPR1IlXvw4N9zxl3rphuy4V4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="359620407"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="359620407"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 08:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="618593612"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 12 Sep 2022 08:32:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 08:32:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 08:32:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 08:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPOjW5qfAaibdFyVDiymkHiQfGwPxhoRiamZ9JWu+/7dWvDg5hw6H8qUIWKTHOdmelWiWzLwzRb0g9YUy4OrHexRpDZPZsF4zYUIUsBJipD60sL1fiDhlbGF7pLRJHA8MNuChas86YKExzDBZxzlfOxmGiOARzsbXesaNfizlXk2GcKOqdwMiFLzrH8n4tBCfqGyEA6U2KAqkUUyEqK/rb14kv4AFnkXI1gkUSJ2N9FLl+lVUYa8TiGmoIeqE9TrrGu+zSg9Eypkg0T4fQ8+qBclzy09vZwcFbY46BCK1Uqn5Mkdlxl70TmPQvzwmr/4fP+iamUIJzpeBNsEabAlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuE9lv0zc/lg/wcFZI3aonD0zXHzk7D3HTe8zrwvW7s=;
 b=hJKaNxV/25thaRIiDLOGG5QxHbw2nKb2kSAk+4UoMfzPUjvM1UGMFqKq/G4Fe6lnILL5UYLeMnMvrVEVBqJ4Fhyd9XeMkUaQxrQHGr1jt29zCL29s62HmSIPYAzeSFAHsqlSeWt8WAVj2YFm0d670AdPt0EV/+GoUsUSCFWq0VNgryiXr1yOm1pzf3jxic+SKa4Rotmk8uGP/iRtrOaQcAY5SFmuLm1RZUIMGHPXrf7FbqCu+wIF8+4fxYemkVfmu2j/lNu8t71/NcGqUBjdBvcpbcvljHpE2G+AcJ9B43F5yRTY+hwmRRmiT2DZ2dowEg/GYsuUt9Q3K3bMgTI0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 15:32:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 15:32:54 +0000
Date: Mon, 12 Sep 2022 08:32:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/gt: Extract function to
 apply media fuses
Message-ID: <20220912153252.zdcfz2m4qhdb3a3d@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220909-media-v2-0-6f20f322b4ef@intel.com>
 <20220909-media-v2-2-6f20f322b4ef@intel.com>
 <afe54574-6d28-9915-c673-bf925ce994f3@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <afe54574-6d28-9915-c673-bf925ce994f3@intel.com>
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 732b8059-42bc-43f6-a71d-08da94d40f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ao3zCmNPTD85c4jSGowLbBU5XQX2ISq2EYTLu9yxwxzP0Pl/IUmvSjLnReLXtslCoVv3Xk75+fp0m+mER5SekiA/VymacMMo7JSrSGryl7ySY7Jr3Xbpab6+mmrTjEvkQvJKiFKRmud6+ZJc06FV3m429Lf3FUJ9BYmZfiN8U9QOwn8oIOl/ozU1dy1adqpUILYWFHEPd0RtvVHhcSSpG7riLbUh+uaM8HRvTudcyiwHYNmf1I/3xSNRB9NabFYaXWPIhDl+xVKqF/4S2lmm4os0KnPy4lfukPU0qwmZvvNqjIWnoledQljx/l3UniyUWoJ4oEVCCVD73eEfUllPz6SZI0MUhRBr0udahMiZUsttc/kfet8m3UqWEcXbvKYxk5h4ZsxPLdv5uPPjdlW3o+aBzqJ34DCcxVj2UsZjUH99ivIH0ihApNtVEX6IJDQU01dEgnzCjlyuwBQSpiCIinhaurQOvs3cnCQUQtSuwalL0WN4s4MCPHBTt0HM3vCTNFVMSH/dVvW90WVhg7mto4nPvK62AiMCUGi3RvLhggJ6mN2REHmGRHgl+BmDEMXPYnwUkhBhjjsvm9d/HJFtVGgOaipgw8od6K2HUuIdE0brjMOTID3Nz7RFeprtiROZG1M8RYPRUF2n78Ur1JjNj4K8pdPydpoNUVTy3LQWQlyhF/52SXBOrN9OIMc3blQfcpCKv/AbPRt8UVYamkeIvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(39860400002)(136003)(346002)(8676002)(450100002)(38100700002)(82960400001)(8936002)(66476007)(4326008)(66556008)(66946007)(36756003)(86362001)(478600001)(83380400001)(6506007)(9686003)(26005)(6512007)(41300700001)(6636002)(316002)(1076003)(6486002)(186003)(2906002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WaKjeqG+nn/YVstbtipYDWkeg+Z8j2447xX9x3UQFjZ1OwWQRDGfjza5xoFa?=
 =?us-ascii?Q?kjmigK8z71w3YHtCt/lGQ6yjVoCv67lICQ0Jz6bqQDgX2zkpVL+avEwnS4xU?=
 =?us-ascii?Q?X/UXIN/zJKZXXPYgtLWqg7J3cPe2zMb4Dx9AzP8kIdnWm0B5HV4tjA3rNl15?=
 =?us-ascii?Q?j3nDgt1RcWO26X1c28mgdSoyts/LsdCspMM1EVmctp6rcZKjik0jQ/6pSxQb?=
 =?us-ascii?Q?RGUSYpLTrEKjnngHiZrSuJgRFz8605ij27KDSu3gXiWqBUt+E9jkAOWlYz/3?=
 =?us-ascii?Q?zAz+0yV20yUWzBFGg0k6VvjPEYGixp4M9O91AmGpC0O3l0nlqPMEeim5Ic7w?=
 =?us-ascii?Q?V5jw51jg6JAJ3v4LXmDtNZZOkUFlEu/KPbmXSAnCEwCPOk5Z80jaGWA8zTG8?=
 =?us-ascii?Q?45mHz//2d9JbojERO9++3sFYYzMEOCxIrTofmcNyylmjZNp6waSyWTpiPwKQ?=
 =?us-ascii?Q?2IT8tAr7YmHVGiFTAufYkCs9dS+8ctGy5OVJMd0+Ek9J1P6pQjzkXQMtGwx5?=
 =?us-ascii?Q?imwf5YhoY48MmXR5/Bj2lk+dj6l/CtfDFN3J5Cwa8NyROgdoe0oQrYWpzp/9?=
 =?us-ascii?Q?yF868IeTjDxXMgiIusXbQ1Mdu97NzE+95zdWuK4jfO2+bu9tF2HHA3pNd35T?=
 =?us-ascii?Q?jA/8a3qf90CZg2TL/v2N/hpERNDF7KBw2QgnraHW2HIPQ6xA6/yxM1HHkRY7?=
 =?us-ascii?Q?0LK9RD9YYvD8gPGiFNLe2+03YoCfEstD+IEQMG4KDA8sLc4eL58pG7yLXxf7?=
 =?us-ascii?Q?aXdze5MdeEtx7gYBH5/CcaXoMpVVT7GO/7h6EWo2FVVshjvOZ0AjI8eBo9VL?=
 =?us-ascii?Q?pYcH+A+ui5JPrJBYDCveQUhTHzip5if71I5i/Q3pFhPFCvP4L/av61mNTzuL?=
 =?us-ascii?Q?GIrZC8yf6RgybQ+PsL6hTzsQywWvRFqvZKyMmQg2yqpZWTL5dSbzhQHNzHol?=
 =?us-ascii?Q?4BXwkWq/HA2PfCrSjaAOW88alEdmdsHUXuxrZv/uoxkDCGed+XHqY3sRwZvz?=
 =?us-ascii?Q?r54VyN0hP0AgCddYsy/bTmKtnj6u4T4nBqRhGMKkNuwd8iKnf+6KYkWySZ5C?=
 =?us-ascii?Q?vfqEuNAgPWgVbyD5JH40zEz4EiyvxLOFwDNTG6o/oCLDQEjEWkEeCFunBy5C?=
 =?us-ascii?Q?9iFb5TxDzpmAJHq5rAHD3YWvLaLzc7tz6+Xbc4BUeMhCXmpLMt4L6UM450Go?=
 =?us-ascii?Q?w6cmWoTsedW3Nc9ZkvkLtnCY3vgfQrSVFjSBQMZ9Ift91nxaam7/o3oRzZMd?=
 =?us-ascii?Q?YUgFFRhSM0XEP5hYzd3/sJABr17n0b3ARRd2JlIX/9dGuQ4FL9Rm0bQPRZ+S?=
 =?us-ascii?Q?ZdSgOAYMPofmbTval1MHcrrngpV9fqapryhHd7v+RRm2eJOVcoqMjFvgvE+T?=
 =?us-ascii?Q?lGtOl1d5BBqJdHVcE1RveysRl2w5465wSlRTiwwxkIw/4hxlp8UgmJjYd7+Y?=
 =?us-ascii?Q?bmJSkloqoaTL2wFram/VqVgb0YduJaB8ksjPQZ/m+lzrF0cQxDQd4h9PxWFp?=
 =?us-ascii?Q?6X9vlHeVSP1Gp4GqF9eH1ErLwySFrD4kVunPRa6gewqGyuyRaTnQhzk9j14r?=
 =?us-ascii?Q?bYIoSP7nKO2vUcXhRjtx/FQz2zAtVQgalK6U0UF3ieMSekaivvFDDtcrQAQ4?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732b8059-42bc-43f6-a71d-08da94d40f80
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 15:32:54.2913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFrs1zh9SwRXNdLt9Pi4gQ6A3Ufdq6aauyTg07YnqSvNbv1LOlvTWDm8Dh7pYgJtRabuxuPUsilHrDmCYj6wWdTVlPMcV6z0t7XOel3iZR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
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

On Mon, Sep 12, 2022 at 10:56:16AM +0200, Andrzej Hajda wrote:
>On 10.09.2022 01:18, Lucas De Marchi wrote:
>>Just like is done for compute and copy engines, extract a function to
>>handle media engines. While at it, be consistent on using or not the
>>uncore/gt/info variable aliases.
>>
>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>index b6602439224d..814f83b5fe59 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>@@ -663,6 +663,74 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
>>  	return false;
>>  }
>>+static void engine_mask_apply_media_fuses(struct intel_gt *gt)
>>+{
>>+	struct drm_i915_private *i915 = gt->i915;
>>+	unsigned int logical_vdbox = 0;
>>+	unsigned int i;
>>+	u32 media_fuse, fuse1;
>>+	u16 vdbox_mask;
>>+	u16 vebox_mask;
>>+
>>+	if (MEDIA_VER(gt->i915) < 11)
>>+		return;
>>+
>>+	/*
>>+	 * On newer platforms the fusing register is called 'enable' and has
>>+	 * enable semantics, while on older platforms it is called 'disable'
>>+	 * and bits have disable semantices.
>>+	 */
>>+	media_fuse = intel_uncore_read(gt->uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
>>+	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
>>+		media_fuse = ~media_fuse;
>>+
>>+	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
>>+	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
>>+		      GEN11_GT_VEBOX_DISABLE_SHIFT;
>>+
>>+	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
>>+		fuse1 = intel_uncore_read(gt->uncore, HSW_PAVP_FUSE1);
>>+		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
>>+	} else {
>>+		gt->info.sfc_mask = ~0;
>>+	}
>>+
>>+	for (i = 0; i < I915_MAX_VCS; i++) {
>>+		if (!HAS_ENGINE(gt, _VCS(i))) {
>>+			vdbox_mask &= ~BIT(i);
>>+			continue;
>>+		}
>>+
>>+		if (!(BIT(i) & vdbox_mask)) {
>>+			gt->info.engine_mask &= ~BIT(_VCS(i));
>>+			drm_dbg(&i915->drm, "vcs%u fused off\n", i);
>>+			continue;
>>+		}
>>+
>>+		if (gen11_vdbox_has_sfc(gt, i, logical_vdbox, vdbox_mask))
>>+			gt->info.vdbox_sfc_access |= BIT(i);
>>+		logical_vdbox++;
>>+	}
>>+	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
>>+		vdbox_mask, VDBOX_MASK(gt));
>>+	GEM_BUG_ON(vdbox_mask != VDBOX_MASK(gt));
>>+
>>+	for (i = 0; i < I915_MAX_VECS; i++) {
>>+		if (!HAS_ENGINE(gt, _VECS(i))) {
>>+			vebox_mask &= ~BIT(i);
>>+			continue;
>>+		}
>>+
>>+		if (!(BIT(i) & vebox_mask)) {
>>+			gt->info.engine_mask &= ~BIT(_VECS(i));
>>+			drm_dbg(&i915->drm, "vecs%u fused off\n", i);
>>+		}
>>+	}
>>+	drm_dbg(&i915->drm, "vebox enable: %04x, instances: %04lx\n",
>>+		vebox_mask, VEBOX_MASK(gt));
>>+	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
>>+}
>>+
>>  static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
>>  {
>>  	struct drm_i915_private *i915 = gt->i915;
>>@@ -671,6 +739,9 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
>>  	unsigned long ccs_mask;
>>  	unsigned int i;
>>+	if (GRAPHICS_VER(i915) < 11)
>>+		return;
>>+
>
>Why there is no similar sentinel in case of engine_mask_apply_copy_fuses?
>Beside this:
>Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

I noticed it too while doing these patches. I have a pending one for
that, but it seems I failed to send it on Friday.

drm/i915: Skip applying copy engine fuses

Support for reading the fuses to check what are the Link Copy engines
was added in commit ad5f74f34201 ("drm/i915/pvc: read fuses for link
copy engines"). However they were added unconditionally because the
FUSE3 register is present since graphics version 10.

However the bitfield with meml3 fuses only exists since graphics version
12. Moreover, Link Copy engines are currently only available in PVC.
Tying additional copy engines to the meml3 fuses is not correct for
other platforms.

Make sure there is a check for  `12.60 <= ver < 12.70`. Later platforms
may extend this function later if it's needed to fuse off copy engines.

Currently it's harmless as the Link Copy engines are still not exported:
info->engine_mask only has BCS0 set and the register is only read for
platforms that do have it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 4 ++++
  1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 6e0122b3dca2..ac5ff17888cd 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -694,6 +694,10 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
  	unsigned long meml3_mask;
  	unsigned long quad;
  
+	if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
+	      GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
+		return;
+
  	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
  	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
  
