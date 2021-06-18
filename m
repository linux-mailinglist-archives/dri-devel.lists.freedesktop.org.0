Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB91C3AD3DB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 22:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49BF6EA9F;
	Fri, 18 Jun 2021 20:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBABA6EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 20:46:37 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r16so11946593oiw.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 13:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4r+iYIGM1ml79iopoQSxZrDqgwYn+xcCIA80yctC5/g=;
 b=jXPOpgJrRFBzbjsB0OIPjQ/s3KAfysdoYFZ9IiD7MPLFDWHpwo99gHGPDr31IomKer
 VeMJkbiM+sySVMDgfPRT4599nqHxyRvQ5SILuIsuleRwgKAkqWHmmKgIvdwsi+kjdUqm
 oOuy9Uhmm6HuSY6NOA7UyqVBDKJVxc32Yn5vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4r+iYIGM1ml79iopoQSxZrDqgwYn+xcCIA80yctC5/g=;
 b=dOZqGcBxveg/WMAeAAfJxj9FUrYyxjMoXfrM50foc+MBEgCERhF98SY4ljUcA+NpmG
 t8wf4ipmClo1GfuHBrzNm7ud+TlOXBcdJ6L9iTq94CmaY5ota1ZqjBOEJvSR9WkWr5Gu
 xZZhuU8lP4seC7jSxpNXWgfPOPHKzCw9kJnX970bHDUor6OJhme4Z1ncPZk3kwGA5Rdc
 0ZgZMymT+a1xpqfdFkE4+XmSjDwAooZY5iVWs9FfpZUauO1aJ57bUWTag91N3GoNLFft
 KBpLOG9bmmm/sxJ7ssP2bPfJyyZqNC8QzXM6XTKZTd+AtVG/4qBTxDichlX0gKJX5yCg
 fZCg==
X-Gm-Message-State: AOAM530lsljqaHFJAANmG2o8/9iXgUKJJTL5GVm/tC0DekyXHVWhqMiB
 X2vSHaOsi57tzXhAnNx/l96C4kud99eqNj0MomZKhw==
X-Google-Smtp-Source: ABdhPJySdcgUyRePHlcyv+ZbElBFPLIiUZAgj2j8qk5e3XatUrNLDeYLL1NMPFmgIuOXMfNiVLuMZ+Jq12cqAv7S37U=
X-Received: by 2002:aca:530f:: with SMTP id h15mr8910424oib.128.1624049196871; 
 Fri, 18 Jun 2021 13:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210618150036.2507653-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210618150036.2507653-1-tvrtko.ursulin@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Jun 2021 22:46:25 +0200
Message-ID: <CAKMK7uFPXPwWuL=3dR1gnCX-yGUPLOjK5Q1Vo=KHLzENm8oPFg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/i915: Document the Virtual Engine uAPI
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: intel-gfx <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 5:00 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
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
> v4:
>  * Link from driver-uapi.rst.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Apologies for the confusion :-/

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Imo just push, it's good stuff at the right place, and it's much
easier to polish&integrate docs better once something is there. I've
read through it and it looks all nice.
-Daniel


> ---
>  Documentation/gpu/driver-uapi.rst |  21 ++++
>  include/uapi/drm/i915_drm.h       | 188 ++++++++++++++++++++++++++++++
>  2 files changed, 209 insertions(+)
>
> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
> index 4411e6919a3d..27d0fbe33e87 100644
> --- a/Documentation/gpu/driver-uapi.rst
> +++ b/Documentation/gpu/driver-uapi.rst
> @@ -5,4 +5,25 @@ DRM Driver uAPI
>  drm/i915 uAPI
>  =============
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
> +i915_drm.h
> +----------
>  .. kernel-doc:: include/uapi/drm/i915_drm.h
> +   :internal:
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index a1cb4aa035a9..2f70c48567c0 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1806,6 +1806,69 @@ struct drm_i915_gem_context_param_sseu {
>         __u32 rsvd;
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
> + *     I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(virtual, 2) = {
> + *             .base.name = I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE,
> + *             .engine_index = 0, // Place this virtual engine into engine map slot 0
> + *             .num_siblings = 2,
> + *             .engines = { { I915_ENGINE_CLASS_VIDEO, 0 },
> + *                          { I915_ENGINE_CLASS_VIDEO, 1 }, },
> + *     };
> + *     I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
> + *             .engines = { { I915_ENGINE_CLASS_INVALID,
> + *                            I915_ENGINE_CLASS_INVALID_NONE } },
> + *             .extensions = to_user_pointer(&virtual), // Chains after load_balance extension
> + *     };
> + *     struct drm_i915_gem_context_create_ext_setparam p_engines = {
> + *             .base = {
> + *                     .name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> + *             },
> + *             .param = {
> + *                     .param = I915_CONTEXT_PARAM_ENGINES,
> + *                     .value = to_user_pointer(&engines),
> + *                     .size = sizeof(engines),
> + *             },
> + *     };
> + *     struct drm_i915_gem_context_create_ext create = {
> + *             .flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> + *             .extensions = to_user_pointer(&p_engines);
> + *     };
> + *
> + *     ctx_id = gem_context_create_ext(drm_fd, &create);
> + *
> + *     // Now we have created a GEM context with its engine map containing a
> + *     // single virtual engine. Submissions to this slot can go either to
> + *     // vcs0 or vcs1, depending on the load balancing algorithm used inside
> + *     // the driver. The load balancing is dynamic from one batch buffer to
> + *     // another and transparent to userspace.
> + *
> + *     ...
> + *     execbuf.rsvd1 = ctx_id;
> + *     execbuf.flags = 0; // Submits to index 0 which is the virtual engine
> + *     gem_execbuf(drm_fd, &execbuf);
> + */
> +
>  /*
>   * i915_context_engines_load_balance:
>   *
> @@ -1882,6 +1945,61 @@ struct i915_context_engines_bond {
>         struct i915_engine_class_instance engines[N__]; \
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
> + *     I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 2) = {
> + *             .engines = { { I915_ENGINE_CLASS_RENDER, 0 },
> + *                          { I915_ENGINE_CLASS_COPY, 0 } }
> + *     };
> + *     struct drm_i915_gem_context_create_ext_setparam p_engines = {
> + *             .base = {
> + *                     .name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> + *             },
> + *             .param = {
> + *                     .param = I915_CONTEXT_PARAM_ENGINES,
> + *                     .value = to_user_pointer(&engines),
> + *                     .size = sizeof(engines),
> + *             },
> + *     };
> + *     struct drm_i915_gem_context_create_ext create = {
> + *             .flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> + *             .extensions = to_user_pointer(&p_engines);
> + *     };
> + *
> + *     ctx_id = gem_context_create_ext(drm_fd, &create);
> + *
> + *     // We have now created a GEM context with two engines in the map:
> + *     // Index 0 points to rcs0 while index 1 points to bcs0. Other engines
> + *     // will not be accessible from this context.
> + *
> + *     ...
> + *     execbuf.rsvd1 = ctx_id;
> + *     execbuf.flags = 0; // Submits to index 0, which is rcs0 for this context
> + *     gem_execbuf(drm_fd, &execbuf);
> + *
> + *     ...
> + *     execbuf.rsvd1 = ctx_id;
> + *     execbuf.flags = 1; // Submits to index 0, which is bcs0 for this context
> + *     gem_execbuf(drm_fd, &execbuf);
> + */
> +
>  struct i915_context_param_engines {
>         __u64 extensions; /* linked chain of extension blocks, 0 terminates */
>  #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
> @@ -2375,6 +2493,76 @@ struct drm_i915_query_topology_info {
>         __u8 data[];
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
> + *     struct drm_i915_query_engine_info *info;
> + *     struct drm_i915_query_item item = {
> + *             .query_id = DRM_I915_QUERY_ENGINE_INFO;
> + *     };
> + *     struct drm_i915_query query = {
> + *             .num_items = 1,
> + *             .items_ptr = (uintptr_t)&item,
> + *     };
> + *     int err, i;
> + *
> + *     // First query the size of the blob we need, this needs to be large
> + *     // enough to hold our array of engines. The kernel will fill out the
> + *     // item.length for us, which is the number of bytes we need.
> + *     //
> + *     // Alternatively a large buffer can be allocated straight away enabling
> + *     // querying in one pass, in which case item.length should contain the
> + *     // length of the provided buffer.
> + *     err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> + *     if (err) ...
> + *
> + *     info = calloc(1, item.length);
> + *     // Now that we allocated the required number of bytes, we call the ioctl
> + *     // again, this time with the data_ptr pointing to our newly allocated
> + *     // blob, which the kernel can then populate with info on all engines.
> + *     item.data_ptr = (uintptr_t)&info,
> + *
> + *     err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> + *     if (err) ...
> + *
> + *     // We can now access each engine in the array
> + *     for (i = 0; i < info->num_engines; i++) {
> + *             struct drm_i915_engine_info einfo = info->engines[i];
> + *             u16 class = einfo.engine.class;
> + *             u16 instance = einfo.engine.instance;
> + *             ....
> + *     }
> + *
> + *     free(info);
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
