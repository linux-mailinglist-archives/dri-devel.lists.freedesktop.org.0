Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D546BB4197
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 15:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F5810E7F0;
	Thu,  2 Oct 2025 13:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jH5NGpq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC12910E7E7;
 Thu,  2 Oct 2025 13:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759413370; x=1790949370;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jGdU60lFmu7uEwXUCC8ePGR4cwotmrU3LLzB2u5y/V4=;
 b=jH5NGpq+y7aeKVfnl5a/VgoKSrTGqoyyEvNv7wODgjfc8wthdrXcrrg1
 iOvbnCSh/74/aGfaYm0n9XzQJxJ4r0u5aanFEvfQmOdHF17A317FlwMVO
 JZbiWyr+kQlMRJ5/GQHEEiTIJAVXG2WH4J1Aht77wyN/3zoFy2h0xe54N
 EJyKUIm6qmw74KU5w42zEsmsYvl1MLZaL9kHhVcUzcqqH03LagMML46yO
 fNblIBY21jNSYikeuXDdHijmPoEM808L5zUtHaYC7zin9788Sw5+0xgEV
 MZyv4aVVeHuSX2GwykyJnSIjGpixkzyFcZOIQDPtNS+Fzgil++EwDyEVO A==;
X-CSE-ConnectionGUID: yd0MJNkGR3OeHZNKWwz2gg==
X-CSE-MsgGUID: jS3zLFnyREeh9oE0z6h98w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61608158"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61608158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:56:10 -0700
X-CSE-ConnectionGUID: qoN6jfbpTsijYeUxLvtoHw==
X-CSE-MsgGUID: hkZ5seMlQLKKONyyGvNF+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="183069285"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:56:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 06:56:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 06:56:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 06:56:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Phw4KbhnSrQErl6hz0dcwWW0LvOPju7fspziNBiuAdc9EykfHzwNOE4QzDXuC0pALDB2SW5yxD+EINig6IsD8a5w2XAMGvtvu2+Gegrr9ZVVF2xJ8L2VtXSsMP+hmVgjWbHwxm+Mu9hR45IvZgOFPavn9ar7qc2ydrKBruPTp0bjTmaF+uurY0a34y8TIKO7lwRW2Oigw1iPCvvvW1XoyxQfneiYtO49i2DTFrPZjLikvwjokiI7M0DNZuoNisLebrMFtnVbPRpcq+kwu0Gd1Jm1ETkVdtBoUB9qyRy+htjPYXrHRXZeZrZTckU058etmCseH/fyfud6Bccq8peb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rd3hWMqULPpTQvTLqPHiBFFX01rV+CgEmuHNVxzwQFY=;
 b=QGzLdlAPH0BjHEjUK3ife2uBIm1/oDmtIT710gGBWvpDvhpBUGaeuMnyPfMQyZghCcCL6jJ0LLJIa/aaW+cBE4Idqps3kAlupS4KeH5IVS1y4T9LlgH7K/NNc1/CLd7ak/UCvOkGGoa1nCyh0Ior+o0gq0+V+tzgepDXoDEYKfoKtQsh/Wo9CL7IldmKflp0jOPiLrcT7xnmUFsSJpJH6lnuSHKspbmukOkwqADfNv8L9/XK51pUVFn3Axuje8w1hNO5vOfNQvustH0MW+a5b0P13EeOR/JQHYJedeRQCoyCZQhC0Tb7/n2wGN4G8ibCClSlw/hxArXsIlhHFNCAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 13:56:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Thu, 2 Oct 2025
 13:56:02 +0000
Date: Thu, 2 Oct 2025 09:55:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: Re: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Message-ID: <aN6EbmgZYchyMHRn@intel.com>
References: <20251002084828.11-1-alsp705@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251002084828.11-1-alsp705@gmail.com>
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cca2cf2-eb65-4f75-e47b-08de01bb6c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0PxNkXgOXwJKJP2hSqmH5PAXGRHgnlvkpG5SlA5ITvR0FEBStAKgTKT+0b7/?=
 =?us-ascii?Q?MP72w053OUPKpEIRznYPnBfJx1mPvCRQABGmEpEdsiQsAxcy3nD0sYhPLoqh?=
 =?us-ascii?Q?utj2O2fUpbJAmf0xtkn2Eppm0QM0FWzJJRKWuvjUbak/HJmfP+e5yJJfT79O?=
 =?us-ascii?Q?Vu0mYLvn25hiIEwh7U6H6ejmYR1/1pJZnqjcfYVy2tDivuQjtW0atBEfFare?=
 =?us-ascii?Q?MbPkLYXYTdyQqgFMSfebXZiYCFYbJgzXsPP3Zcn6r98T2hXDQE9w+KVS//7u?=
 =?us-ascii?Q?oaRKYEYl3esaflDdjrLj+Ef1dxxDaH8xvRLp07n/DRBtoYp98FTD8OiHa7/9?=
 =?us-ascii?Q?uEWhSkosjL1KWixIHCO5c9BFOekGrh1nE7AXyKAZcCxRLnEzab/0Hmpby5ew?=
 =?us-ascii?Q?FSpR+sbE48Ds6R1ZqJFDkEd3UNiOCn1vR97GqkZ2uCdqWFXNBLp5usGinTCM?=
 =?us-ascii?Q?DweV0xobGtj2CdXRL38yyJxLhT3Yw5TqxBy4ouqWrOLmJKDm8ONJzkmNLtwu?=
 =?us-ascii?Q?PEV1nrq9bor3rpytTfSLwB8zS2nslMJ4VrR5kIhlUtRgsASBRFhOiSbEfWnv?=
 =?us-ascii?Q?POIyg6CcCvjtUYOiJ7SFZxHIQMe2NrXUSNE9tBBfnu1lymfGWc+JyoN07q6U?=
 =?us-ascii?Q?oVVT1w2Tk1eZ7t0zIrxqnh7q0GWJE6QYfIF66JpDnPpiznvxogORXRmO+Xrx?=
 =?us-ascii?Q?2bNyscdkGLcdUNkwZNy28SkzQ1IBMFiLRIsvylfwI8SuXzAq1h/2SjZQQSJ3?=
 =?us-ascii?Q?7/u0YlVxsSpVs1fkTSo5wWAv5j05Yu4WfC9atMFRUCWXbJy4j1n25Vft/Cne?=
 =?us-ascii?Q?nLYrdLZ4vPp0lNql8O72Qs8jazuuTVMz6tOMasVL2b0sZ1ynF/B8ZvZODCKB?=
 =?us-ascii?Q?Z1RjKRWEQX2gYU+hoVLR9yjSHVr36yiP33tciM8mdZ9yd94V3PuO5eHTuIAi?=
 =?us-ascii?Q?1NFzSltHfN3nX7TNWl0rKN97eNpOPUSg9mzmKkmR0fT8GiHDPhgdak8979Ai?=
 =?us-ascii?Q?+PCMJqbzLUfcXBJNpwm8j0zB7ZVTqSekWkjAWbZzLkj9W4tL56vwxDII5G9a?=
 =?us-ascii?Q?zU2qGo0+7wS3P5zESAcXViYewbA/9YIoSiEA+LXPLzKBMD32Gadp6sDupWAd?=
 =?us-ascii?Q?GUtNipMJ/eE8BCaRHawfHTdpJWWZURJknYmfanJLs1XbB3nBb2/FlnKM7NJf?=
 =?us-ascii?Q?lFEsLrqS6sKPPcu+lPIxKez9qL5ws0TBfwWKKwst2aWqbMf2sGG/6MdRTYO/?=
 =?us-ascii?Q?/lwIq2RL/i0WLEHzY+omO/m1LBZsIWcTcjFodPaBsjnk2HvQPOjcOGKO4I3p?=
 =?us-ascii?Q?BjyU4qujzUOsoPsz6TYrOdz4jpAxdQ7YTGuZ9HhzJsc/Kb4asoYVhHoNtE95?=
 =?us-ascii?Q?Ytw4ntEQHkSGvz/16W1iC0ksTg6905OmQ7TO+u+tFCnI76k/DZn215eXFQCB?=
 =?us-ascii?Q?4oi9uMYnV6bSCuuCPRjLqTuz2MmwE6up?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N7TgLqWxkPe5jLrODuvBS7wQbKhs/it/34XF5RJR2UtcTnFlX/ioRfACG+RY?=
 =?us-ascii?Q?2UpmYCmz5cDcxZH8OGHeHKEx3QXXoHfr5U0ZJCMAavucfF04Gm7AVZAh9IPr?=
 =?us-ascii?Q?VmTRPqn9Li3+PF8pGAKHcZ6q9SEYHm6eOpNX67CyGcUVQArISFAd9QpaDnI3?=
 =?us-ascii?Q?xoG+0EsKqphicRgcYv0dVWU0iXEf6d6MzTlma1Hy0m2Axa5WAtVZhTWmtkIH?=
 =?us-ascii?Q?HRCOUG+LR8Dhf+Fju7ZvoOQOaQLjocblsR9/anpyKWufJIy6d1EAIHrgw5Gt?=
 =?us-ascii?Q?rbbiHPMDsNxi/eHyze8CINPJEqwuI9lhaYtzWGGh47BhRmf/kzy+y4a02onM?=
 =?us-ascii?Q?zUGSqcJn9lbRa8ogG8RBpOKeD8CEoKaiM8WbawQNf7X3FJdtVx0179tVZnE+?=
 =?us-ascii?Q?07DaQRlhDI8YMz3r02xPO4Np5NcPCVTQr5HMRYQCAWpMtSGPZMxuGjiiSPxD?=
 =?us-ascii?Q?KyTs3zXYKqYDlVSaFDMI++ALJTN8JMTjdRHbZ1wz9uaJEAdEBASbQS82x4x5?=
 =?us-ascii?Q?A4rg8daczk7trHOdbGDrC1VGZ+G6NVQEeWdabAd7GJnyq04Ekn3guGv2N03S?=
 =?us-ascii?Q?UQLrA4ZuIJRWaMbKKONQanEqj1ft6XxyBRVIu4P2wuO0YLzhYsK1CH1T0kBi?=
 =?us-ascii?Q?lRYi5Nhk6lOTyL6ruG3+psYmykAM207n4iAynqKZerPThFLFTINFIAGffiQY?=
 =?us-ascii?Q?07bk5zov5vdGwYVy2tvJ2H8Xlt8OibO8CLZbH922IJUAndlyDuo/tkLrH4OZ?=
 =?us-ascii?Q?iiZ8ATtwbY5KedBgMjU5YGVPiHImqnxiEek8eEZ1uCfVDWfa7YTy2Y3ftejX?=
 =?us-ascii?Q?VVr8eLOzlsfj43Z+ZRB33g41VofUUUnWrIAt5PtDHB8YkNWpNyoEz02TcN8f?=
 =?us-ascii?Q?9+USiP5smUJLOxdocCe0/2yzbtwa9t1YAP0+UMCU/3cpnZwFCIEn+DP1gYVl?=
 =?us-ascii?Q?BMQ70mOo/GOX54BhiIEjmdgHFhOkxARb/vPEKAjsplOawunSzo9WJpqMPDL7?=
 =?us-ascii?Q?Y0yexfSC5nbvu2c340kTqCUeMgh3VJyyJ+KD5BCYtIBhEVBPuQxlK3aaQ8bk?=
 =?us-ascii?Q?gWQcKkeaIhTRuvq2PcytwNoOn4LMt2+VzD86lKiXOtxNMLestomu8Z57r4Od?=
 =?us-ascii?Q?4WL4yq8MJw95R+2cuXVZjTadyeDkvVdBzFpWrAjyKGtUPfO/wRUX8/8vybGu?=
 =?us-ascii?Q?yeN5X+bCnpiYRPB2zTvLju6m6eDUVwVGbEGlQJoCa0xQ6MUOWtzmml/x1eEC?=
 =?us-ascii?Q?F3T2oUjanulf/fDx5LQk0U/mbxDt5xfcDBCBlHZud/8Bogg13zVQqe0pP6xO?=
 =?us-ascii?Q?HX/p9ppq6zq6mS93LkqaTXwqjKo+n+yhPaFX1NhxTv2w2kuufLmNUqi3q5I9?=
 =?us-ascii?Q?EmqGxsfdk+ncdD7YRKZaNCLexzDu6RD04Krf+3Y/LYOJknF90kv+8mEqlzKc?=
 =?us-ascii?Q?lGr3b1g3H7t8QsD+v5VdbrZrGLt1q4e0I6AQw1aTL67OlOLsbXuMTUbdx55M?=
 =?us-ascii?Q?a8U69zi7MMVgPqa4flq9d0JxlcWabe9L8jGhdWT8sDeZYUkzId/ZHZOxcEhO?=
 =?us-ascii?Q?5QuypkGJkWOWZUoqbBMTgHi75xyppah5/jUdhLE3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cca2cf2-eb65-4f75-e47b-08de01bb6c36
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:56:02.1994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9+8w+E5FpaPaDpP0uN5nb85tK79Kyn4KiiP4XtQFk3ZnSi3+C4Qljrg2e0e+27KrdY+9yYB1WTocoGVQkmrgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
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

On Thu, Oct 02, 2025 at 11:48:26AM +0300, Alexandr Sapozhnkiov wrote:
> From: Alexandr Sapozhnikov <alsp705@gmail.com>

About the subject, this is not just a 5.10 kernel issue.
This code is the current code in our tip.
So this needs to target drm-tip branch, and then Cc stable
and perhaps a Fixes: tag.

> 
> In the drm_vma_node_allow function, kmalloc may 
> return NULL, in which case the file element will not be 
> added to the mmo->vma_node list. It would be good to 
> not ignore this event, but at least log an error message.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index a2195e28b625..adaef8f09d59 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>  	mmo = insert_mmo(obj, mmo);
>  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>  out:
> -	if (file)
> -		drm_vma_node_allow_once(&mmo->vma_node, file);
> +	if (file) {
> +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> +		if (err)

perhaps we also need to drm_vma_offset_remove here?
I mean... honest question, doubt here. Is there any further clean-up needed?

> +			goto err;
> +	}
>  	return mmo;
>  
>  err:
> -- 
> 2.43.0
> 
