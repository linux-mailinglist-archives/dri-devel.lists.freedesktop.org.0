Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BCD403DBA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 18:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2A16E20E;
	Wed,  8 Sep 2021 16:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235336E20C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 16:42:45 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id me10so5418395ejb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nKWhFBvTNvr6kXG24dXWAS0ynp45lxdt0NtADhBspBg=;
 b=Yq/H48Mgv8sl96NnpWEGJR9/3bVSo7zMBq9DRZxwAY0SVl8e0x2MH24pEfuRstpxMF
 io+NrHuCD4imwwAqSs41EE1P9UZ/JV7Tuen785pZjQiqpBuKkIqX1SWEaQIJ2WQV4A7K
 S76ZmrnfXLPu5ywFzaPRdaHDENcwLppb0/rpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nKWhFBvTNvr6kXG24dXWAS0ynp45lxdt0NtADhBspBg=;
 b=7ZRiGEFHyu69ewxBEzUxUACLgJrpjTWsRRoHvPpezdyMvE/48zYU0TrAvxX6M+HoiX
 v1YdNzPuIb/+SkCP6pe15gtDTDz0Z5BVA6VA8d1R6YdIZhuGOMkC76ofe+I4KH8B147L
 iIprxIHSlW0nfCsl/neWk0CDOP6/cLKDNerjGIUYq4V318r07fhu662nw232INB0nCil
 SMNoIg6nJ3IV/Bokv1AQg2EVXdQuROinwKIwrWRz+zBFzyZHoE3zmuqjHINNOfayvBcY
 TSxN7urb4rLZ9bKbrd+A5tYj+viHM86Umg6ACxGWWnnN6EqDEoGCabSi3wZzXAek86zd
 1ZeQ==
X-Gm-Message-State: AOAM533pDzo28jOWqTw0eFXYyhTpHAvsdKOzlKRUh0VE4Qo4zD85dDyi
 +vKNe8NqzmBvAnmAtJrPU3OEww==
X-Google-Smtp-Source: ABdhPJxhyKrfVtlfxYslVFr/rUdp+aEC4gUi0uP3tDC5hZ8rgV3qASxpwFJ7iX3caDMh8yXgsS2uIw==
X-Received: by 2002:a17:907:766e:: with SMTP id
 kk14mr772595ejc.339.1631119363619; 
 Wed, 08 Sep 2021 09:42:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h8sm1386676ejj.22.2021.09.08.09.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 09:42:42 -0700 (PDT)
Date: Wed, 8 Sep 2021 18:42:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/8] drm/i915/xehp: Define compute class and
 engine
Message-ID: <YTjoAWIUt05HsoBj@phenom.ffwll.local>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
 <20210907171916.2548047-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907171916.2548047-2-matthew.d.roper@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Sep 07, 2021 at 10:19:09AM -0700, Matt Roper wrote:
> Introduce a Compute Command Streamer (CCS), which has access to
> the media and GPGPU pipelines (but not the 3D pipeline).
> 
> To begin with, define the compute class/engine common functions, based
> on the existing render ones.
> 
> Bspec: 46167, 45544
> Original-patch-by: Michel Thierry
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Szymon Morek <szymon.morek@intel.com>
> UMD (compute): https://github.com/intel/compute-runtime/pull/451
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 28 ++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_engine_types.h |  9 ++++++-
>  drivers/gpu/drm/i915/gt/intel_engine_user.c  |  5 +++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h  | 13 +++++----
>  drivers/gpu/drm/i915/i915_reg.h              |  8 ++++++
>  include/uapi/drm/i915_drm.h                  |  1 +
>  6 files changed, 57 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 332efea696a5..69944bd8c19d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -153,6 +153,34 @@ static const struct engine_info intel_engines[] = {
>  			{ .graphics_ver = 12, .base = XEHP_VEBOX4_RING_BASE }
>  		},
>  	},
> +	[CCS0] = {
> +		.class = COMPUTE_CLASS,
> +		.instance = 0,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = GEN12_COMPUTE0_RING_BASE }
> +		}
> +	},
> +	[CCS1] = {
> +		.class = COMPUTE_CLASS,
> +		.instance = 1,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = GEN12_COMPUTE1_RING_BASE }
> +		}
> +	},
> +	[CCS2] = {
> +		.class = COMPUTE_CLASS,
> +		.instance = 2,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = GEN12_COMPUTE2_RING_BASE }
> +		}
> +	},
> +	[CCS3] = {
> +		.class = COMPUTE_CLASS,
> +		.instance = 3,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = GEN12_COMPUTE3_RING_BASE }
> +		}
> +	},
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index bfbfe53c23dd..dcb9d8b2362a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -33,7 +33,8 @@
>  #define VIDEO_ENHANCEMENT_CLASS	2
>  #define COPY_ENGINE_CLASS	3
>  #define OTHER_CLASS		4
> -#define MAX_ENGINE_CLASS	4
> +#define COMPUTE_CLASS		5
> +#define MAX_ENGINE_CLASS	5
>  #define MAX_ENGINE_INSTANCE	7
>  
>  #define I915_MAX_SLICES	3
> @@ -95,6 +96,7 @@ struct i915_ctx_workarounds {
>  
>  #define I915_MAX_VCS	8
>  #define I915_MAX_VECS	4
> +#define I915_MAX_CCS	4
>  
>  /*
>   * Engine IDs definitions.
> @@ -117,6 +119,11 @@ enum intel_engine_id {
>  	VECS2,
>  	VECS3,
>  #define _VECS(n) (VECS0 + (n))
> +	CCS0,
> +	CCS1,
> +	CCS2,
> +	CCS3,
> +#define _CCS(n) (CCS0 + (n))
>  	I915_NUM_ENGINES
>  #define INVALID_ENGINE ((enum intel_engine_id)-1)
>  };
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 8f8bea08e734..d981621a7c30 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -47,6 +47,7 @@ static const u8 uabi_classes[] = {
>  	[COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
>  	[VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
>  	[VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[COMPUTE_CLASS] = I915_ENGINE_CLASS_COMPUTE,
>  };
>  
>  static int engine_cmp(void *priv, const struct list_head *A,
> @@ -139,6 +140,7 @@ const char *intel_engine_class_repr(u8 class)
>  		[COPY_ENGINE_CLASS] = "bcs",
>  		[VIDEO_DECODE_CLASS] = "vcs",
>  		[VIDEO_ENHANCEMENT_CLASS] = "vecs",
> +		[COMPUTE_CLASS] = "ccs",
>  	};
>  
>  	if (class >= ARRAY_SIZE(uabi_names) || !uabi_names[class])
> @@ -162,6 +164,7 @@ static int legacy_ring_idx(const struct legacy_ring *ring)
>  		[COPY_ENGINE_CLASS] = { BCS0, 1 },
>  		[VIDEO_DECODE_CLASS] = { VCS0, I915_MAX_VCS },
>  		[VIDEO_ENHANCEMENT_CLASS] = { VECS0, I915_MAX_VECS },
> +		[COMPUTE_CLASS] = { CCS0, I915_MAX_CCS },
>  	};
>  
>  	if (GEM_DEBUG_WARN_ON(ring->class >= ARRAY_SIZE(map)))
> @@ -190,7 +193,7 @@ static void add_legacy_ring(struct legacy_ring *ring,
>  void intel_engines_driver_register(struct drm_i915_private *i915)
>  {
>  	struct legacy_ring ring = {};
> -	u8 uabi_instances[4] = {};
> +	u8 uabi_instances[5] = {};
>  	struct list_head *it, *next;
>  	struct rb_node **p, *prev;
>  	LIST_HEAD(engines);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index fa4be13c8854..3f9007e4e895 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -45,8 +45,8 @@
>  #define GUC_VIDEO_CLASS			1
>  #define GUC_VIDEOENHANCE_CLASS		2
>  #define GUC_BLITTER_CLASS		3
> -#define GUC_RESERVED_CLASS		4
> -#define GUC_LAST_ENGINE_CLASS		GUC_RESERVED_CLASS
> +#define GUC_COMPUTE_CLASS		4
> +#define GUC_LAST_ENGINE_CLASS		GUC_COMPUTE_CLASS
>  #define GUC_MAX_ENGINE_CLASSES		16
>  #define GUC_MAX_INSTANCES_PER_CLASS	32
>  
> @@ -154,17 +154,20 @@ static inline u8 engine_class_to_guc_class(u8 class)
>  	BUILD_BUG_ON(GUC_BLITTER_CLASS != COPY_ENGINE_CLASS);
>  	BUILD_BUG_ON(GUC_VIDEO_CLASS != VIDEO_DECODE_CLASS);
>  	BUILD_BUG_ON(GUC_VIDEOENHANCE_CLASS != VIDEO_ENHANCEMENT_CLASS);
> +	BUILD_BUG_ON(GUC_COMPUTE_CLASS != (COMPUTE_CLASS - 1));
>  	GEM_BUG_ON(class > MAX_ENGINE_CLASS || class == OTHER_CLASS);
>  
> -	return class;
> +	/* the GuC arrays don't include OTHER_CLASS */
> +	return class < OTHER_CLASS ? class : class - 1;
>  }
>  
>  static inline u8 guc_class_to_engine_class(u8 guc_class)
>  {
> +	BUILD_BUG_ON(GUC_COMPUTE_CLASS != OTHER_CLASS);
> +	BUILD_BUG_ON(GUC_LAST_ENGINE_CLASS != (MAX_ENGINE_CLASS - 1));
>  	GEM_BUG_ON(guc_class > GUC_LAST_ENGINE_CLASS);
> -	GEM_BUG_ON(guc_class == GUC_RESERVED_CLASS);
>  
> -	return guc_class;
> +	return guc_class < GUC_COMPUTE_CLASS ? guc_class : guc_class + 1;
>  }
>  
>  /* Work item for submitting workloads into work queue of GuC. */
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index c2853cc005ee..33d6aa0b07c1 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2528,6 +2528,10 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define GEN11_VEBOX2_RING_BASE		0x1d8000
>  #define XEHP_VEBOX3_RING_BASE		0x1e8000
>  #define XEHP_VEBOX4_RING_BASE		0x1f8000
> +#define GEN12_COMPUTE0_RING_BASE	0x1a000
> +#define GEN12_COMPUTE1_RING_BASE	0x1c000
> +#define GEN12_COMPUTE2_RING_BASE	0x1e000
> +#define GEN12_COMPUTE3_RING_BASE	0x26000
>  #define BLT_RING_BASE		0x22000
>  #define RING_TAIL(base)		_MMIO((base) + 0x30)
>  #define RING_HEAD(base)		_MMIO((base) + 0x34)
> @@ -8100,6 +8104,10 @@ enum {
>  #define  GEN11_KCR			(19)
>  #define  GEN11_GTPM			(16)
>  #define  GEN11_BCS			(15)
> +#define  GEN12_CCS3			(7)
> +#define  GEN12_CCS2			(6)
> +#define  GEN12_CCS1			(5)
> +#define  GEN12_CCS0			(4)
>  #define  GEN11_RCS0			(0)
>  
>  #define GEN11_GT_INTR_DW1		_MMIO(0x19001c)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index bde5860b3686..9540f33523d8 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -166,6 +166,7 @@ enum drm_i915_gem_engine_class {

Please add kerneldoc for any updated/new uapi.
-Daniel

>  	I915_ENGINE_CLASS_COPY		= 1,
>  	I915_ENGINE_CLASS_VIDEO		= 2,
>  	I915_ENGINE_CLASS_VIDEO_ENHANCE	= 3,
> +	I915_ENGINE_CLASS_COMPUTE	= 4,
>  
>  	/* should be kept compact */
>  
> -- 
> 2.25.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
