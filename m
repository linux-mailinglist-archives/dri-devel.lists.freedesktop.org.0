Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E983D57A7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FFC6EAC9;
	Mon, 26 Jul 2021 10:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CD86EAC9;
 Mon, 26 Jul 2021 10:38:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="211924080"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="211924080"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:38:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="416505654"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:38:11 -0700
Date: Mon, 26 Jul 2021 06:38:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 25/30] drm/i915/gt: rename CNL references in intel_engine.h
Message-ID: <YP6QkRJybZ1wjDPd@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-26-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-26-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:11:09PM -0700, Lucas De Marchi wrote:
> With the removal of CNL, let's consider ICL as the first platform using
> that index.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


(
I got myself thinking that some patches like this could be squashed into others,
and a few of them made with coccinele, but in the end I like the approach you
took. It's been very easy to review this series...
)


> ---
>  drivers/gpu/drm/i915/gt/intel_engine.h | 2 +-
>  drivers/gpu/drm/i915/i915_drv.h        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index f911c1224ab2..dfb400766db5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -179,7 +179,7 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
>  
>  #define I915_HWS_CSB_BUF0_INDEX		0x10
>  #define I915_HWS_CSB_WRITE_INDEX	0x1f
> -#define CNL_HWS_CSB_WRITE_INDEX		0x2f
> +#define ICL_HWS_CSB_WRITE_INDEX		0x2f
>  
>  void intel_engine_stop(struct intel_engine_cs *engine);
>  void intel_engine_cleanup(struct intel_engine_cs *engine);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index d118834a4ed9..dd2d196050d4 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1959,8 +1959,8 @@ int remap_io_sg(struct vm_area_struct *vma,
>  
>  static inline int intel_hws_csb_write_index(struct drm_i915_private *i915)
>  {
> -	if (GRAPHICS_VER(i915) >= 10)
> -		return CNL_HWS_CSB_WRITE_INDEX;
> +	if (GRAPHICS_VER(i915) >= 11)
> +		return ICL_HWS_CSB_WRITE_INDEX;
>  	else
>  		return I915_HWS_CSB_WRITE_INDEX;
>  }
> -- 
> 2.31.1
> 
