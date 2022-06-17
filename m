Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB154FBAB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 18:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6CB10E8FC;
	Fri, 17 Jun 2022 16:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A110E742;
 Fri, 17 Jun 2022 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655484957; x=1687020957;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/odMKvqdDD55/Cy89zhNptIEA7mAb5h4QUqhUspi8Sk=;
 b=CGGAGCteNOSGAZyC5r5MyPpDCgMk5LWYGo74P89d78LBWFMrdusQ0lr4
 4Ckpxaf+fDf+eWUOQUg6AevG4Nv+/Ob3WYEyQdGmmlg9pK5eEGECa3HOw
 /s3GbSbj6NTGtuEQ/sEaoDkzePwQm1XbSnW86LNED6AwYvGrxuz6rG1ft
 k7wR6bP7/8JOdihlH4M1BQwpPpt8eBY0I/3mY5OpeH1Z11q5s8QzU796+
 Ffjbytz6/hHUDsczDtm8EtV0z3DxLvybqMfKm10al8q5bpj35jX5HHHRV
 rUVaiZ+P31aiJl+uCl5opZajeGI1uj+nBMAYC9COC9toMIJu/bmKDALs8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279537350"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="279537350"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 05:16:43 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="688274187"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.175])
 ([10.249.254.175])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 05:16:11 -0700
Message-ID: <bb21b933-5ef5-8e18-a0f7-3438dfb10344@linux.intel.com>
Date: Fri, 17 Jun 2022 14:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH 04/10] drm/i915: remove intel_memory_region
 avail
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-5-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220525184337.491763-5-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/25/22 20:43, Matthew Auld wrote:
> No longer used.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   drivers/gpu/drm/i915/intel_memory_region.c | 4 +---
>   drivers/gpu/drm/i915/intel_memory_region.h | 1 -
>   2 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index 94ee26e99549..9a4a7fb55582 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -198,8 +198,7 @@ void intel_memory_region_debug(struct intel_memory_region *mr,
>   	if (mr->region_private)
>   		ttm_resource_manager_debug(mr->region_private, printer);
>   	else
> -		drm_printf(printer, "total:%pa, available:%pa bytes\n",
> -			   &mr->total, &mr->avail);
> +		drm_printf(printer, "total:%pa bytes\n", &mr->total);
>   }
>   
>   static int intel_memory_region_memtest(struct intel_memory_region *mem,
> @@ -242,7 +241,6 @@ intel_memory_region_create(struct drm_i915_private *i915,
>   	mem->min_page_size = min_page_size;
>   	mem->ops = ops;
>   	mem->total = size;
> -	mem->avail = mem->total;
>   	mem->type = type;
>   	mem->instance = instance;
>   
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index 2214f251bec3..2953ed5c3248 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -75,7 +75,6 @@ struct intel_memory_region {
>   	resource_size_t io_size;
>   	resource_size_t min_page_size;
>   	resource_size_t total;
> -	resource_size_t avail;
>   
>   	u16 type;
>   	u16 instance;

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



