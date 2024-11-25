Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B09D89D9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB68A10E691;
	Mon, 25 Nov 2024 16:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4PJcUU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4A310E68E;
 Mon, 25 Nov 2024 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732550433; x=1764086433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u34U1w/Nb9zsDihLGzvp6IXMWo3+Y2gkJ8hA4jtbkJQ=;
 b=I4PJcUU3Nd1ucBFcOvSYs31x8sr1doo5lcjj3lutf07Is+uhhyOudHMQ
 8NWiQK0txFGT378ZAK0IqD/wtP4iZLn8HSdYY1DNQku21/D2/0nC/PMow
 E2UcfSgmVKdFifSWiQjfdt9/UvmGNnBijUtuI6UW0/szYoOTjeeYgYJhl
 D1ubSRbRZdvT31VJXtGie+tP88Avo1g20jM7QL1LyveZrzVdbgy0Zldl8
 TmN2aV0VIV1g9t9h2iaNcU8l7vybsaaKKYcj9OK5GJr3MzzbeKfMQnq9B
 NDW5BmY+AMGWEiRfSCkbgXj6yMIA3zPMm61Hn8AaspM6+CV1oUqaU8mdW w==;
X-CSE-ConnectionGUID: ZiyQYY+rRKSe4Q3WfS48/w==
X-CSE-MsgGUID: RqmJOlC3QmOs4/gEIrVzjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32039183"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="32039183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:00:32 -0800
X-CSE-ConnectionGUID: yh89ybCvQfKsgNfgtNfGqw==
X-CSE-MsgGUID: tAIoK17PR/SHd8URBGBmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="95406714"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 08:00:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 08:00:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 08:00:32 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 08:00:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xS5KfaPUcDS8x/l9AIaBEH8Nc7zbv6MKp6daJoJG/NmJjd7et7WXsDiGm5/nSslnSzUtXWULAuvVAGngK2qisGXWhW8hyf7ZNr0WLlA+WdqY7DnDcoqCihaKVMin0mhUS7xCXFhG18gloCGdp0GDEHqTaoppY47NQZnBsThY3ppnvOMBRiqzkwYNgSm59/VIQijCpX2+O7hCXY4STFHE1D6wqwmjkYoh3HGlPARiwFKaW+s5Td/C2t18AxgT6Tm/GaYw9WCGOBZT7ZCjNhW1zLnimRqXrLL6dnn8mfQrj86hdRJDNpy9cz5BXbMS2dR5cPWG0dmr7p/LoAQSPzNc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6xupLyf9tb1ydLMZyCDKEtoukZ/yS96iI2PNz0yhhY=;
 b=faN7j347VIHUnoQMGDYLpB9+LkMTYvLcvQll/PrM4D6wiULijDQs/6QZ3XdrL7Rkzhrk0v0jVrL+9UT6FU7g9aCYPKTdhsZNLcjGZ/LWkhptfZm1RwBAW5HuBEONSsdSNdg/pvfJkjsKxek3qa+15kFB+lS1DJE/SUQ9eQ1X6VTzVWwy96PDG0I6SiH6OKUrKDlOhOuCj5J80CDfYaJqhK3jDKihMcULAdPcDR1hyP0U9KrGw2kYmDYfWvaQ95CkYA91HjHyfW5Rsg/R1QuDruPvDfT3Q1+34pnkwbxs/YEyKcBQXdVAwTa5ESWbAaI4ABpT525pp/funFigG8ULrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB6492.namprd11.prod.outlook.com (2603:10b6:208:3a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 16:00:26 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Mon, 25 Nov 2024
 16:00:25 +0000
Date: Mon, 25 Nov 2024 11:00:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhang He <zhanghe9702@163.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915: Fixed an typo in i915_gem_gtt.c
Message-ID: <Z0SfDbx5C4sMvIQg@intel.com>
References: <20241120123245.71101-1-zhanghe9702@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241120123245.71101-1-zhanghe9702@163.com>
X-ClientProxiedBy: MW4PR04CA0268.namprd04.prod.outlook.com
 (2603:10b6:303:88::33) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc89b97-3feb-4bcb-fbe4-08dd0d6a4595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XKGkbI9begbU6EZRCMgWjq3oLwpx5/aWmfAECnJVRNtjuodd0NGwE3L87qXf?=
 =?us-ascii?Q?585sXQE0x50ZbkbuuI1YO4MCrL/yEraGoc8InD4/T9xWpDYcb2d29dolQZUT?=
 =?us-ascii?Q?cggf8ex0BdwPPn4qI3NvGbodSOlOQF9AetCk80H9LE9ihSIRW4ywoVBhtDpf?=
 =?us-ascii?Q?FB5VIzhEluvt9LCFVB2XPmOCwm6BWhcrv4TPs6B5xoy/Soj4WbOLK9FOvJVY?=
 =?us-ascii?Q?sAWP3ffYd92YJAZljuOMUnQxanfINcEeRoQKbQivQqueWZwC3zZTvsjVCh+v?=
 =?us-ascii?Q?VQbq++s+qQ1otSLahfbvafRYFAdUnV485rbq+gcYo5Zi8Ffe7k/uJONkEFtw?=
 =?us-ascii?Q?0/bVUpWy3YMf6t5Jp3Y7RGd2oMkDyNVn4RwDqA+vkQ2BgNUr1zkksu21XzN1?=
 =?us-ascii?Q?tw0fX+Hvjc9dSt9FbhIj6Kh0ZIvUaXYAzrWXYMRx2naLX6c75BmstGofg7yF?=
 =?us-ascii?Q?cfTMQYzCAlBAB2EdREfbE4FIV6FcOvuh/4u7lI5Z3AuvOU4oSe0rkBT9/Ha8?=
 =?us-ascii?Q?Lw0n3aAZjngkdB6BJUaNVLecg4Jajd27Iz59sncfKb3klYs/4C5YeSQf5PGS?=
 =?us-ascii?Q?1N4+Iuh3/gb6PjE/ySq1E6ZFuqRX8OecSqoiGoEewRALEZQ+IDV9JbLZ9W0L?=
 =?us-ascii?Q?GDCAKZe23rfP45Hbkc2FVnCm8Pglmfvr6/LDXwkXbUNi5axZVSQxjiNcU4vH?=
 =?us-ascii?Q?CUWZOAT4vNi21oaqr6X1el4A873rYGcvHolucmvhF3zcUW2WqWDJkJlw758D?=
 =?us-ascii?Q?VcDcTGssU/BOl+WNABoy/Egv+mrQS1K8Uysp6d1IHFzdSBkyqdGqufw2b7YQ?=
 =?us-ascii?Q?v+/acxb4OHUa20RUOOjb5UdWDv1YAb+tOjOGPHNgC0BOxYODJK2WCufkDc5c?=
 =?us-ascii?Q?CbjcmcXJVuQAstFSA82qleTUJoSaVhfo/FDBaQyqOJmbAD9+2Psb+7oH761c?=
 =?us-ascii?Q?iECTElfY5ASxj4w5awZf9kJDz8WISDx+uu6aKOuY5tO9m/6FMMfW0XrSYxMn?=
 =?us-ascii?Q?Wv/FZMNOohd639dj5msrj+a/vXf6t02yr4+iFHcEl0XNv1h/UqbRmIYm8mlj?=
 =?us-ascii?Q?6hJGPdC6BgayD35asCcGDSQoElblB+HFjkPCQaIL9bRJJFviEK+ik1k4YhUP?=
 =?us-ascii?Q?KaQdKLtMkD1PpHO9iTrmpUXgwj1Ta5qxwRD0AYA/BOluEB1sbLIAV6JSO6Ee?=
 =?us-ascii?Q?VvlgxgCrHPePBmI1WeP6WPDhyJ7j7gIar8fDQBRZiF14Irk3dcNlnPNq4YnB?=
 =?us-ascii?Q?KfRSamp4NeWyrwAPpqxbzQicUnrhH5T5lpL2ngbpUESauhU4FavOsJwedqDj?=
 =?us-ascii?Q?Kd/gFTXIVgM/eztclDuQ9uuqJbiIj6ZZpTA9WKoVLdoF1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJJ8Jc4b6XzHyBDvOZpzQp9sd12dzglgXdn87+5mF8pzhKdn5O3UTRSPnIJS?=
 =?us-ascii?Q?Ku4m88jNh8JdEVuH8ePNxh8pXJKhaShwOaa5nXGHhOjtYI1c3supgblGiitd?=
 =?us-ascii?Q?hK1NJfEPIvKDkoallCVtgumuCA32736FiZMhpafB2F99FZJJvFWeE/StT6wo?=
 =?us-ascii?Q?XfCteJpiSfzxGl2XAqyObhUsXikU0OZROBya+dqAaPkMFHVT+qP7/bMWsY6g?=
 =?us-ascii?Q?87+6HfARZkypA9eWt88MOEJFv3bw8qPyY5ciSipdxlI23WxsRQ+OljvNhOmm?=
 =?us-ascii?Q?lldLnd3u9FiWQ/y5mYZRb+ks4PVCk6NG7Sk8B9oHtf8l95L8B+/CxwnL9os4?=
 =?us-ascii?Q?Zzxr+Y8cPCztqWsrPw977PXj244jusFTRGuEEa+yC+Q7jyXrLuNgKSe3ar13?=
 =?us-ascii?Q?7hn3ZmRWzFptNdVQx8yuH/bQuulnKV/yVn1hX8YGQad3En8yUwYhq/Rm8qEK?=
 =?us-ascii?Q?I4VLKs285fXQtE8v0/2dWsta9rOAfF4KCA1jyKbERwIHC+aGZqTMcez/5mAl?=
 =?us-ascii?Q?4Q5Yh0+Wi2XUl95AlB+Gjnf4ugzL+bKZl0EOhM3o2rVQcC/9YaZMGUyNSCM3?=
 =?us-ascii?Q?uRxipIZj35zdvdJkwcyWnqseBin8GAPAINFODWda/b5tjqRDBYEUrW/3MY8b?=
 =?us-ascii?Q?eXfYhdn1Nb6RbW11VU6aR527pz41igzQLzS8c4kL698AMnEepM71r68zP6wO?=
 =?us-ascii?Q?0brMsdhcXkdVRuAocezH7rVR6Cr3VODy4TeqkrExKnoq6nebSYzV0VTLMZ98?=
 =?us-ascii?Q?uU7qmkN68dv9NoIdU2gJREpoifvlX922WPqzaBeUm9pyNiTVI39Oj5ffYZ4D?=
 =?us-ascii?Q?BxToLECEOi3TmNgywBjgdGv0EBAyW9vdOuGYGmOWJocOBN1m+zfNCLgRoi8Y?=
 =?us-ascii?Q?Uumm8qGAv/TblvBPApTXoSLq4BaMug6Ebim9AHRTKT6a1c8DB6W1epWQp3u0?=
 =?us-ascii?Q?YiTEVEUOOaaw0vDl/58Y9zYEzrc97uVlpqQTbJs5U3CuDx2DzIgmVuFF0MT8?=
 =?us-ascii?Q?nPMPb+HqYQ0p+lUWUIzJKQwJtDqEBFvVOQC3E7rJpd4Xn9nkAGrOl61JJxf2?=
 =?us-ascii?Q?xkTXT4oO5LIC45kyRgK+CC9pDlV17Yfr/eR+wFyVffu4YAGYkgzyLdKDdSkS?=
 =?us-ascii?Q?jYyxOks5fHns3CsFhUliXnkkq46sFrCIzDIOw3+7SrJ5t7K6Ctgx4KxRVesf?=
 =?us-ascii?Q?AxZgjvvxBDiP6X8x5yFLCipMTxZA6/aaCST2BGJ/3MViFz/Yy8/RnW8lbXD1?=
 =?us-ascii?Q?4xGxa1fI0CnWtN1SIJHwNySRzsFJhqMDvAwwnXU+v2wUU3cEvpulWfiq5KbP?=
 =?us-ascii?Q?6Vhh22m5H4xZxAc0Xi7jEhKkCU4k/wN6a2v0KgQ26E43NGxAFzixdmHLTxT0?=
 =?us-ascii?Q?Rk8wZFC7dc2I6Km9LkAEKe0S2PbMR4sAXAjn4rossbr6JcX801ZEjxbQG/Uz?=
 =?us-ascii?Q?3S1G1q+ujmafSxjSOIqdAoFD2f9Af640o3a4yr6yPEGRlpVj2fzmiLgcvVkA?=
 =?us-ascii?Q?g4r7riV2NPEHmnrSl04Gl3jYIJ027mk0cppf7g3TAC08alpLqc6j8rfllmw9?=
 =?us-ascii?Q?+RIbkQTZATpo5ipJI4w+FsYIGiq5ZomUpQt+nqkJO/IHwFc8DcqkgcR/p5GP?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc89b97-3feb-4bcb-fbe4-08dd0d6a4595
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 16:00:25.5871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yDtdvDf//WNH8O0RsIttcu3rkKhJoVGK3xUxD1bXojb4pfwEskSEsmoq4eM26rRmU2DO/L9TNEiZXW1Q5VQkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6492
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

On Wed, Nov 20, 2024 at 08:32:45PM +0800, Zhang He wrote:
> in function `i915_gem_gtt_reserve` @node comment,
> i915_vma has no `mode` member, `i915_vma.node` is the correct name
> 
> Signed-off-by: Zhang He <zhanghe9702@163.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed to drm-intel-next. Thanks for the patch

> ---
>  drivers/gpu/drm/i915/i915_gem_gtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> index a9662cc6ed1e..25295eb626dc 100644
> --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> @@ -71,7 +71,7 @@ void i915_gem_gtt_finish_pages(struct drm_i915_gem_object *obj,
>   * i915_gem_gtt_reserve - reserve a node in an address_space (GTT)
>   * @vm: the &struct i915_address_space
>   * @ww: An optional struct i915_gem_ww_ctx.
> - * @node: the &struct drm_mm_node (typically i915_vma.mode)
> + * @node: the &struct drm_mm_node (typically i915_vma.node)
>   * @size: how much space to allocate inside the GTT,
>   *        must be #I915_GTT_PAGE_SIZE aligned
>   * @offset: where to insert inside the GTT,
> -- 
> 2.43.0
> 
