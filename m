Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529EB1EA73
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA31610E946;
	Fri,  8 Aug 2025 14:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RV8q3pfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B6010E943;
 Fri,  8 Aug 2025 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754663879; x=1786199879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ijOKOok1dAjTchxNU1oyMN174/1c/Ev/UXmmEg8+KaA=;
 b=RV8q3pfBfbI086alEEVCVZqc2akFObIxet+ZIuTV3pLYDH8xR9ympB8u
 cilHG9/YltkkVKsTtDHOw1gQCNDn9OJM0Qru5dGt6UMVJRbbgAIU5GtEW
 37mT+gS/e/IAtvDBoWeDAgE24z2fGyyvMHgrb+9V9F7/xBRdCQEdjmaMI
 HX1Ip+ToxIkgOH8W4men1oFzmImlvJtfjs1N9o2BKjXTM2C06ZfR3P+cA
 a1a52MGP0yQnQ4TH3Cdt+iCDJhg36OhBeohKHTcdbeEt0F89V/LKWcPWU
 NiG88TP7aW3tPcBFuuEoOB+GTEZGXJH4ZOhX1GpBVZtgAe2T6pJG3q6le w==;
X-CSE-ConnectionGUID: GB+UNg9LQ5W8Tv6s2IARHg==
X-CSE-MsgGUID: RYP1+z9gRtGhumkiZWb01g==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56934912"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56934912"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:37:53 -0700
X-CSE-ConnectionGUID: GdFcdJ6wSyKuKbrlsoqi9Q==
X-CSE-MsgGUID: 3LBCUk3HTYK5Dywi54vftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165246798"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:37:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:37:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:37:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUBVoDrMqbcl+8MNo42JmTkSz7KFWzOdPM4PuEedlbXj2kbd53FtlXYyTCIHOF62o/bwExVyPArCz18Icjree78Iph/bTEgdgYsC6Z+MXgqyUw5xmCtnL4af9aCkphLeA0N03VL5LLP8+tyWSnlKIyz4F/0ygtI74w+6QHLhBFtHPV1B5ps9szUKBG6eA+45GAMXY3ajfgm9lMwfcoGPL7+qDOWA39qzbPRq77Ks6o45+gZA19PCASNZdLzCPxXqveKScbILnFfR8TZ9njoo7YEYMUF3r7SMlcXUYuRb+7GDdFklNOdx4Nnw3bs0puK2eWsHZjiB8PoVBwX1oJEvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEmEWv1CrrAjHFQFRZJHEMLfR9DmWYAEzvgX1fNmGp4=;
 b=Cfv6TVZHA6nywyGvVXIaTrdQz2iMaJiLs2/WMivUJMUp7d5WICRtVcpZRhekYYD3e/KSo6yIWrWLiSrGn1l+KJfDpaATVNcz9I05NZkjLaQDO4x7jCjAEn/TmK5FTf0QA+MGtVK+63SeziJZ2KQdPNYexp1VrWYdF3i4PHqbFp+KXI7FZYSy2Q26tPyC7tfvUZ2km5biTdc9LgWGSlYSBLA21/15iA8Rm+VWlLPCKc+9spZX28QtC2p/ohRjr8t3ONzkVBUiMsEIUo2u1c+YXl85nOKUdsSeJILJMK2X164z2NdAlbCpLabHhQgGQTnzfi7uqc5zSEhQYfs24igKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 14:37:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:37:49 +0000
Date: Fri, 8 Aug 2025 10:37:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 2/9 v2] drm/i915: Remove struct_mutex in i915_irq.c
Message-ID: <aJYLuXEim4jmyMHz@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-3-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807170212.285385-3-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: bb903653-b8b7-4e27-edfa-08ddd6892601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MjCN4Sg45DXFV9ayTPypvLQ53+8PtwVahMI8+IedHc95igr/TJXF61waICRB?=
 =?us-ascii?Q?alWMjIe/+JtdOmu3RK6LCzXDmUnAQeui8oLo9FNh+B3nwkxqDBa5jz/mU4Ew?=
 =?us-ascii?Q?K75ufxy2tviUVm83UkQxqzzXxy9m5Id902nEJAwYnAfwfrT0jdSiFYMjjFhy?=
 =?us-ascii?Q?wonEIUe23b0EeAbkp1ZpFMhQYlNpH7LN7jbvQNbL/GC590c+YBbZfEbZdNlK?=
 =?us-ascii?Q?WXS/cdRxZ1yPgLSFaklfgS2M3E++By6jvHnPTurpvjj/OeoXLgJ8hAYqAt71?=
 =?us-ascii?Q?LAuqewInRdjFDVZ7F8duuKJDL9tkcx7Hck+66+qeve+tlrpXwyYBsxUdbDST?=
 =?us-ascii?Q?IE/ZQhdcyPm1I7VWgTmxHUjqevVIleq6fiSXdDu7Al+s9ELbBe3JSTEs90x/?=
 =?us-ascii?Q?vzrvEKB9xcZzgIBoZaoZIdSC/5rccMJfTXyU6fhiCPhnMjcoxfv/sdp4v+/3?=
 =?us-ascii?Q?Ikvmn8Ij2Fzdu1/fvkonVts7d4upQD7/w1V/uYxLI7iJade3EFP1cc30hch3?=
 =?us-ascii?Q?CZ25gGyeCCJVrDdvLLfTSoiZlBFp+6Lcau6i2H4pelm7xbEfaw2jLbMTXUNm?=
 =?us-ascii?Q?ialOVaNuzIzwCw5Gj35gy+I7W2OWy3PRiY+Who2gYcTQQ7oMmiSNq+Tyk+ul?=
 =?us-ascii?Q?AWLvds2sFbT41Q8/uyoCp7JL3vg00PnSHcXAdqBdNdwcw+OoQs7XbDGaVj59?=
 =?us-ascii?Q?xysKVQpCjNuo7se2oFh4B4JI9+dXi8rUwOoEpcfonYtM2OdurD3BqgXwI0Ra?=
 =?us-ascii?Q?eZgYdcPrib1M3BNjMwS/2Pu1ADgZFS6R1hnMqqqDEaJBMu7/bH73fbkKTobw?=
 =?us-ascii?Q?4r4kjJw5pYo8rib0nurYs+Rt861X4dLNG4/IYgmQE3o1at4YN6h4kfdhd5HS?=
 =?us-ascii?Q?QYxmltgAIcgH5geEmfWF8KQlbds4ti2Wlr/LMVqzM3rr7CG45OPwzcIqvMaU?=
 =?us-ascii?Q?oaqWGRAkl16Vmr29VC0jP1D+VnxZnGCGakPF5M9aQ3bTr/enzVsWlBiVJ62F?=
 =?us-ascii?Q?mGIgf9RX8BaE9rC3SbkvmhA9NjExN6YWLlhMM/K6O0KWNmmruaIHCS9QUqab?=
 =?us-ascii?Q?erTezmvZelJmzii/QUDSVRyGVJ1CU7GgLRFWorLIUQpEOwBk9ktk9oUARXX7?=
 =?us-ascii?Q?qF18k+gRpzyjhilGOezdMPKzn5uI1e+FA0mQ2V7pvpNqwuW/EjOVD0SyAS3f?=
 =?us-ascii?Q?tM0yp4TEkfp18G2RrLhWHWDgno8tiA4g5WsiPX7t5d06rQwVQkxgVmlK0kTZ?=
 =?us-ascii?Q?mzK/0iZL40242N51Jcs1Ff4929uRbiPNdsIpP0+G1pluU1YkjIg8AodIk9rY?=
 =?us-ascii?Q?GdXhSWtsn/F4zWBem9gnM0Qi7gZxfiwBLx+dUi2LqUiAhVlGGz2ijIP2DtjZ?=
 =?us-ascii?Q?3k+7jiq74i/2Mu+kvtIIuPmLW/6BBhYGV1jVroYI4FXCb1Wg444HQyDFZTfx?=
 =?us-ascii?Q?oKxLSV5eIaU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?296tyTbQ0vM+L5wK1KLHUQ/fPRhxUbx3s7CbKhBplSWQ7nJhgdE7oYND5im4?=
 =?us-ascii?Q?fmF+Tn+nnHM9KpXZxlJy3pPHFAbgg9w7LSEYuXusS94kAhoZ9ief59JZEs5r?=
 =?us-ascii?Q?maXK6tGd5+AZJlhyZlVkurYyVuI819wOQs/OjTEYYTvgIt2l7wDcbcFnc1vE?=
 =?us-ascii?Q?TErzsB0Z6be9g0onHVLWQvxoodjdg+I325cRwUzkEAQ58BYjL2jz/9jZXMqq?=
 =?us-ascii?Q?h9+J0iPFNYHN/CSOB+rAFjQOxP2mmgBd8Q9c1whv2ha6nv722utBlABACMg9?=
 =?us-ascii?Q?iCUxXmgrw5dcHDtEQ8dcOiqiItyzcVPVhdOIsTPs/i2BM53mfL4ip0rHNsvx?=
 =?us-ascii?Q?tzGEqcPMp95oioUkril5QNfwP8TqiBKUxk7Os3F7AFuiavCDw0Sgjaon8J5r?=
 =?us-ascii?Q?lMz/cTL9HKv9A/3bqSgzjKv4o0ZMnHDI860P2/ZNRFfMvawSWZlOfGdoxXtH?=
 =?us-ascii?Q?2NmZ6E3ItgkSTOCIThOOLorg/L16fgJV5GwoVvRoqHEiXJCuaQT0873WoZVE?=
 =?us-ascii?Q?Gg54l/UXC0Z0+JY+j4hldAPJSReJjgMzYmUVXuk7/ofua0dQX/qSZ5rh+xw5?=
 =?us-ascii?Q?Yx6dqw4EhT2PA7zrZ6b/lFvM8Jn2a8+zyOUf5E7bxQIZfedvO/g/vmGqCFNt?=
 =?us-ascii?Q?L4r2M2jq/+/5Wdxu7vbc+XQ1NDgJ/gf5r0Sxxwy2lpnGr9cv+DpU+sbThnRx?=
 =?us-ascii?Q?GI+Nby5S7VPK1TIGMXJBjkgKVUaH6jOSYK96wn75KmRP5hY/u3dmGH8B6ZyK?=
 =?us-ascii?Q?OQ2ZdbzBC4FPvxXrOW3UvrNbK0ezdESjUDfuaPkCIjI0aqdvXsW3/hqpivRE?=
 =?us-ascii?Q?4iIXWhO73pWn4AmyKDWwB1RTnqQjvE2GFGlJ3OteUspD1CX4GO3gz7mcwlle?=
 =?us-ascii?Q?1a3jD62E8pJ9YfVibUw3QZ84UB2YS5N3f6WWLgUkxBHj50JJnDmTvrXaNIRB?=
 =?us-ascii?Q?Gfjrsn0W7hkqm5XfOmc3Ci44NFJbJ9gx2zzlFxXo6UzZN5UE3cby+uNw9QTO?=
 =?us-ascii?Q?UNyUH1lY5Wp246Wf/qaBw5Wb37eevRK1HnzFOBj7fLaJCR/jKXliW+dX7fP+?=
 =?us-ascii?Q?G70ebcynyC3i2hXighqYChgdfeFPCbhOVExbyYO5SoDpr/V/rLpYWrmVlVCo?=
 =?us-ascii?Q?1V03WU7VqOkfcSUI2mv8yIbADD3CKH0AbjzWnxKE9TnpTJcjsQ5O8H3UuPGQ?=
 =?us-ascii?Q?Ai4NHPaGT7THDmM4RC2qaYY5P4eyoWkKMdNjq+bV2McLYfVbNG/yH0QawtFf?=
 =?us-ascii?Q?NUoJrdlqkcGy83cu17zJzXyRM85DlHcQS4i3CPkFaDSLGG2GdhN/uKAoUKUZ?=
 =?us-ascii?Q?z5BN3R6h6rb4x7VQlZeNI4v3riyf2TcoF0tg8uSFqNRClGEn+xA6tNVMjWnb?=
 =?us-ascii?Q?ffEQBU1e7Sc0Rc7uNQZ/n6LHJ2wxehsC3mROAjwAn87aYTbnWQ9dxlylIYDk?=
 =?us-ascii?Q?KYPak+WTQrNnfX8ZESEvgVaYkPs0/TAbQaD6f/84PM/f5IFsM/kVP/wCg4sC?=
 =?us-ascii?Q?hcPGQjovAijDaiESaWgVZJu1aJfWxwk/SMYEbdoF5Oyy8jC1fY7pMUmlfCuP?=
 =?us-ascii?Q?n/hYh4MUIE7tJyIZQK9VfHH4ntdE9t9YYy6tuwQsXUsIrFjaDQASi5yempOa?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb903653-b8b7-4e27-edfa-08ddd6892601
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:37:49.4801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLmrdGWB00ERiDh3C0sJOSoy0ZKG77dCI9HWgLRM2g2NXWOBskazihq9p5I0UuX00GWNzFf6Y1WkEREAj+u4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 07, 2025 at 02:02:01PM -0300, Luiz Otavio Mello wrote:
> Remove struct_mutex from ivb_parity_work() function.
> 
> The ivb_parity_work runs in a workqueue so it cannot race with itself.
> 
> Also, it is not protecting anything with the other remaining usage of
> struct_mutex.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_irq.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index cdfb09464134..83b08dacd194 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -163,11 +163,6 @@ static void ivb_parity_work(struct work_struct *work)
>  	u32 misccpctl;
>  	u8 slice = 0;
>  
> -	/* We must turn off DOP level clock gating to access the L3 registers.
> -	 * In order to prevent a get/put style interface, acquire struct mutex
> -	 * any time we access those registers.
> -	 */
> -	mutex_lock(&dev_priv->struct_mutex);
>  
>  	/* If we've screwed up tracking, just let the interrupt fire again */
>  	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
> @@ -225,7 +220,6 @@ static void ivb_parity_work(struct work_struct *work)
>  	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
>  	spin_unlock_irq(gt->irq_lock);
>  
> -	mutex_unlock(&dev_priv->struct_mutex);
>  }
>  
>  static irqreturn_t valleyview_irq_handler(int irq, void *arg)
> -- 
> 2.50.1
> 
