Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B83ABA7B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 19:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54D16E94A;
	Thu, 17 Jun 2021 17:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCDD6E94A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 17:17:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so4160879wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fpkuoa/8ERN6XuW+rircW3wqdXM7/8bze/yACWh3D+o=;
 b=O/MFPuOidmVGB4GlB+MjK6OkD6udb9dsrnpgM/a4id2oKgrIGhHQsYiCeO3g8daL/r
 QPuHSZ/ieEUERm+0TqkVKPu9eleZNUtwDHZTqaNg0Yq/LAK5A/bG2wT66PyOanqqKaT/
 VeQI995rc4Oz7VEPKOJC65V8sd9PsY1lUnGjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fpkuoa/8ERN6XuW+rircW3wqdXM7/8bze/yACWh3D+o=;
 b=ORX5FKHiQBqKNeMaMtU/nUMloEhYSowlb9RxpoZB0oEtlY8zw8eQqv8Y33WifMUL9D
 elgLnwbUxAibB2ieoAhjfyyFLL1ciwxcln2cs2jCKAGPR1DUEEVRIxFDP114DrnHz70r
 813QhkVaCCRthqERERl0z0zMgWr9eKRcdKMKKvXAeCVXZia3zroTIqX41nk4A1uT8Egl
 IKil8t4s4El7eYB2sEjLnGh4Io5yXoAJ7YiGhGU8GgVPeQF10w5/pYkpK+T8CbC4GIAG
 NL62qTYlROIvN5V3HOi5es37hzacSfYb1KxOUPcuuHHPKYfyPUhJcEvZ3/GiXE5g+Rgw
 qgPQ==
X-Gm-Message-State: AOAM531IGoLn39Bd9xW58JOIDJZMDetbbFAj6kxy6484lrXExmPwTS1B
 rotv+ahT1UqioZlyeAyo8N88Pw==
X-Google-Smtp-Source: ABdhPJw2OPNVt0Gz7Xd3cxOUf6Lc+/1f0zxcr1OIBZ4pbBAdRXGu+qB5H/WnqTYI9L5etAIJ/FOyHA==
X-Received: by 2002:a1c:21c5:: with SMTP id h188mr6436656wmh.165.1623950230639; 
 Thu, 17 Jun 2021 10:17:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n7sm8086497wmq.37.2021.06.17.10.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:17:10 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:17:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: Document the Virtual Engine uAPI
Message-ID: <YMuDlNtXajUYcbqo@phenom.ffwll.local>
References: <20210614090959.1527987-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614090959.1527987-1-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 10:09:59AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> A little bit of documentation covering the topics of engine discovery,
> context engine maps and virtual engines. It is not very detailed but
> supposed to be a starting point of giving a brief high level overview of
> general principles and intended use cases.
> 
> v2:
>  * Have the text in uapi header and link from there.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

What I meant was the kerneldoc directly as kerneldoc for the uapi structs,
like Matt has done for e.g. drm_i915_gem_create_ext_memory_regions.

But then I also realized that Matt hasn't set up the include for this, so
it's not automatic at all yet :-/
-Daniel

> ---
>  Documentation/gpu/i915.rst  |  18 ++++
>  include/uapi/drm/i915_drm.h | 188 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 206 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 42ce0196930a..00aa55bbe0fd 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -335,6 +335,24 @@ for execution also include a list of all locations within buffers that
>  refer to GPU-addresses so that the kernel can edit the buffer correctly.
>  This process is dubbed relocation.
>  
> +Engine Discovery uAPI
> +---------------------
> +
> +.. kernel-doc:: include/uapi/drm/i915_drm.h
> +   :doc: Engine Discovery uAPI
> +
> +Context Engine Map uAPI
> +-----------------------
> +
> +.. kernel-doc:: include/uapi/drm/i915_drm.h
> +   :doc: Context Engine Map uAPI
> +
> +Virtual Engine uAPI
> +-------------------
> +
> +.. kernel-doc:: include/uapi/drm/i915_drm.h
> +   :doc: Virtual Engine uAPI
> +
>  Locking Guidelines
>  ------------------
>  
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index a1cb4aa035a9..2f70c48567c0 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1806,6 +1806,69 @@ struct drm_i915_gem_context_param_sseu {
>  	__u32 rsvd;
>  };
>  
> +/**
> + * DOC: Virtual Engine uAPI
> + *
> + * Virtual engine is a concept where userspace is able to configure a set of
> + * physical engines, submit a batch buffer, and let the driver execute it on any
> + * engine from the set as it sees fit.
> + *
> + * This is primarily useful on parts which have multiple instances of a same
> + * class engine, like for example GT3+ Skylake parts with their two VCS engines.
> + *
> + * For instance userspace can enumerate all engines of a certain class using the
> + * previously described `Engine Discovery uAPI`_. After that userspace can
> + * create a GEM context with a placeholder slot for the virtual engine (using
> + * `I915_ENGINE_CLASS_INVALID` and `I915_ENGINE_CLASS_INVALID_NONE` for class
> + * and instance respectively) and finally using the
> + * `I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE` extension place a virtual engine in
> + * the same reserved slot.
> + *
> + * Example of creating a virtual engine and submitting a batch buffer to it:
> + *
> + * .. code-block:: C
> + *
> + * 	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(virtual, 2) = {
> + * 		.base.name = I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE,
> + * 		.engine_index = 0, // Place this virtual engine into engine map slot 0
> + * 		.num_siblings = 2,
> + * 		.engines = { { I915_ENGINE_CLASS_VIDEO, 0 },
> + * 			     { I915_ENGINE_CLASS_VIDEO, 1 }, },
> + * 	};
> + * 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
> + * 		.engines = { { I915_ENGINE_CLASS_INVALID,
> + * 			       I915_ENGINE_CLASS_INVALID_NONE } },
> + * 		.extensions = to_user_pointer(&virtual), // Chains after load_balance extension
> + * 	};
> + * 	struct drm_i915_gem_context_create_ext_setparam p_engines = {
> + * 		.base = {
> + * 			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> + * 		},
> + * 		.param = {
> + * 			.param = I915_CONTEXT_PARAM_ENGINES,
> + * 			.value = to_user_pointer(&engines),
> + * 			.size = sizeof(engines),
> + * 		},
> + * 	};
> + * 	struct drm_i915_gem_context_create_ext create = {
> + * 		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> + * 		.extensions = to_user_pointer(&p_engines);
> + * 	};
> + *
> + * 	ctx_id = gem_context_create_ext(drm_fd, &create);
> + *
> + * 	// Now we have created a GEM context with its engine map containing a
> + * 	// single virtual engine. Submissions to this slot can go either to
> + * 	// vcs0 or vcs1, depending on the load balancing algorithm used inside
> + * 	// the driver. The load balancing is dynamic from one batch buffer to
> + * 	// another and transparent to userspace.
> + *
> + * 	...
> + * 	execbuf.rsvd1 = ctx_id;
> + * 	execbuf.flags = 0; // Submits to index 0 which is the virtual engine
> + * 	gem_execbuf(drm_fd, &execbuf);
> + */
> +
>  /*
>   * i915_context_engines_load_balance:
>   *
> @@ -1882,6 +1945,61 @@ struct i915_context_engines_bond {
>  	struct i915_engine_class_instance engines[N__]; \
>  } __attribute__((packed)) name__
>  
> +/**
> + * DOC: Context Engine Map uAPI
> + *
> + * Context engine map is a new way of addressing engines when submitting batch-
> + * buffers, replacing the existing way of using identifiers like `I915_EXEC_BLT`
> + * inside the flags field of `struct drm_i915_gem_execbuffer2`.
> + *
> + * To use it created GEM contexts need to be configured with a list of engines
> + * the user is intending to submit to. This is accomplished using the
> + * `I915_CONTEXT_PARAM_ENGINES` parameter and `struct
> + * i915_context_param_engines`.
> + *
> + * For such contexts the `I915_EXEC_RING_MASK` field becomes an index into the
> + * configured map.
> + *
> + * Example of creating such context and submitting against it:
> + *
> + * .. code-block:: C
> + *
> + * 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 2) = {
> + * 		.engines = { { I915_ENGINE_CLASS_RENDER, 0 },
> + * 			     { I915_ENGINE_CLASS_COPY, 0 } }
> + * 	};
> + * 	struct drm_i915_gem_context_create_ext_setparam p_engines = {
> + * 		.base = {
> + * 			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> + * 		},
> + * 		.param = {
> + * 			.param = I915_CONTEXT_PARAM_ENGINES,
> + * 			.value = to_user_pointer(&engines),
> + * 			.size = sizeof(engines),
> + * 		},
> + * 	};
> + * 	struct drm_i915_gem_context_create_ext create = {
> + * 		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> + * 		.extensions = to_user_pointer(&p_engines);
> + * 	};
> + *
> + * 	ctx_id = gem_context_create_ext(drm_fd, &create);
> + *
> + * 	// We have now created a GEM context with two engines in the map:
> + * 	// Index 0 points to rcs0 while index 1 points to bcs0. Other engines
> + * 	// will not be accessible from this context.
> + *
> + * 	...
> + * 	execbuf.rsvd1 = ctx_id;
> + * 	execbuf.flags = 0; // Submits to index 0, which is rcs0 for this context
> + * 	gem_execbuf(drm_fd, &execbuf);
> + *
> + * 	...
> + * 	execbuf.rsvd1 = ctx_id;
> + * 	execbuf.flags = 1; // Submits to index 0, which is bcs0 for this context
> + * 	gem_execbuf(drm_fd, &execbuf);
> + */
> +
>  struct i915_context_param_engines {
>  	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
>  #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
> @@ -2375,6 +2493,76 @@ struct drm_i915_query_topology_info {
>  	__u8 data[];
>  };
>  
> +/**
> + * DOC: Engine Discovery uAPI
> + *
> + * Engine discovery uAPI is a way of enumerating physical engines present in a
> + * GPU associated with an open i915 DRM file descriptor. This supersedes the old
> + * way of using `DRM_IOCTL_I915_GETPARAM` and engine identifiers like
> + * `I915_PARAM_HAS_BLT`.
> + *
> + * The need for this interface came starting with Icelake and newer GPUs, which
> + * started to establish a pattern of having multiple engines of a same class,
> + * where not all instances were always completely functionally equivalent.
> + *
> + * Entry point for this uapi is `DRM_IOCTL_I915_QUERY` with the
> + * `DRM_I915_QUERY_ENGINE_INFO` as the queried item id.
> + *
> + * Example for getting the list of engines:
> + *
> + * .. code-block:: C
> + *
> + * 	struct drm_i915_query_engine_info *info;
> + * 	struct drm_i915_query_item item = {
> + * 		.query_id = DRM_I915_QUERY_ENGINE_INFO;
> + * 	};
> + * 	struct drm_i915_query query = {
> + * 		.num_items = 1,
> + * 		.items_ptr = (uintptr_t)&item,
> + * 	};
> + * 	int err, i;
> + *
> + * 	// First query the size of the blob we need, this needs to be large
> + * 	// enough to hold our array of engines. The kernel will fill out the
> + * 	// item.length for us, which is the number of bytes we need.
> + * 	//
> + * 	// Alternatively a large buffer can be allocated straight away enabling
> + * 	// querying in one pass, in which case item.length should contain the
> + * 	// length of the provided buffer.
> + * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> + * 	if (err) ...
> + *
> + * 	info = calloc(1, item.length);
> + * 	// Now that we allocated the required number of bytes, we call the ioctl
> + * 	// again, this time with the data_ptr pointing to our newly allocated
> + * 	// blob, which the kernel can then populate with info on all engines.
> + * 	item.data_ptr = (uintptr_t)&info,
> + *
> + * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> + * 	if (err) ...
> + *
> + * 	// We can now access each engine in the array
> + * 	for (i = 0; i < info->num_engines; i++) {
> + * 		struct drm_i915_engine_info einfo = info->engines[i];
> + * 		u16 class = einfo.engine.class;
> + * 		u16 instance = einfo.engine.instance;
> + * 		....
> + * 	}
> + *
> + * 	free(info);
> + *
> + * Each of the enumerated engines, apart from being defined by its class and
> + * instance (see `struct i915_engine_class_instance`), also can have flags and
> + * capabilities defined as documented in i915_drm.h.
> + *
> + * For instance video engines which support HEVC encoding will have the
> + * `I915_VIDEO_CLASS_CAPABILITY_HEVC` capability bit set.
> + *
> + * Engine discovery only fully comes to its own when combined with the new way
> + * of addressing engines when submitting batch buffers using contexts with
> + * engine maps configured.
> + */
> +
>  /**
>   * struct drm_i915_engine_info
>   *
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
