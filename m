Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D55B798C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 20:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ED310E1AD;
	Tue, 13 Sep 2022 18:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D5110E134;
 Tue, 13 Sep 2022 18:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663093721; x=1694629721;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BTsfLzI0tVlzUWOBdavAOYQc+Pzx4o+CuINtZ68syYs=;
 b=mxLS4RBppTQpP7E/q12M0kWXfHsyQSn9Y6Fb6RW7FTr4OnK70scSiw8a
 YRfT1+OLonS0w5qt3kkUsRtqEJeYLxiPfcSVP5nmefkybKMM0r5d41F05
 d5EPi5FKFWG9TlkfnbdEmPxYSxU/c3JlZlgjveH2w3gFB0xfUpVR+9lvs
 D2IYQ4gNow5VUvrVKKKPGbmoAp2w4GzzdGwJxWy4ddZmzc9NU10xeU7sa
 myvKu1iJQeSHgVn+W+scap1g+FP9HreiYdStWjiqzrXLW98BevS/OvUOX
 PpYLOKNUKiU3D8RClL1efiXrPoBHTDo14XiCAJuuW1wGMtfeVB/9HhfSc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="324465097"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="324465097"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:28:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="678687633"
Received: from baumeish-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:28:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>, evan.quan@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, patrik.r.jakobsson@gmail.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, lijo.lazar@amd.com,
 matthew.brost@intel.com, John.C.Harrison@Intel.com,
 daniele.ceraolospurio@intel.com, cuigaosheng1@huawei.com
Subject: Re: [PATCH 6/6] drm/i915: remove unused i915_gem_lmem_obj_ops
 declaration
In-Reply-To: <20220913024847.552254-7-cuigaosheng1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220913024847.552254-1-cuigaosheng1@huawei.com>
 <20220913024847.552254-7-cuigaosheng1@huawei.com>
Date: Tue, 13 Sep 2022 21:28:31 +0300
Message-ID: <874jxb3z8w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Sep 2022, Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
> i915_gem_lmem_obj_ops has been removed since
> commit 213d50927763 ("drm/i915/ttm: Introduce a TTM i915
> gem object backend"), so remove it.

Thanks, pushed this one patch to drm-intel-gt-next.

BR,
Jani.

>
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> index 1b88ea13435c..5a7a14e85c3f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> @@ -12,8 +12,6 @@ struct drm_i915_private;
>  struct drm_i915_gem_object;
>  struct intel_memory_region;
>  
> -extern const struct drm_i915_gem_object_ops i915_gem_lmem_obj_ops;
> -
>  void __iomem *
>  i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
>  			    unsigned long n,

-- 
Jani Nikula, Intel Open Source Graphics Center
