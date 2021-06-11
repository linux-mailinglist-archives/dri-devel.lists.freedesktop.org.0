Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B73A4696
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 18:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4116F395;
	Fri, 11 Jun 2021 16:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F3D6F38A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 16:35:12 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 x22-20020a4a62160000b0290245cf6b7feeso840127ooc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8+VfhakVMOMCfkN1aeqZv3IRwZIYZy7cCGoNsrx02k=;
 b=PCApNfQMon7QGAQcF4cIvq1bo6PKe7w9j0frmZtuMDBrWmFr/0a8mMgQrPHB74JJAt
 n+Gj/LD4bCWRmUveM6iOXbLdbOHb5NDeqytrn4+B6fqzZ9IJ5IHlVk5/+w3QBFYOTz49
 dpSS/jMfNRGGOR5TJ7hYG2EN601szxdB/wpbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8+VfhakVMOMCfkN1aeqZv3IRwZIYZy7cCGoNsrx02k=;
 b=LtXz1qa8FM9SU/ffn/xgcMTSPjr1Pe7amCI8tIuQar57aqoR9504o+uvPkweFiIUXd
 AfD8mdEghJLZSNzSPfD/JreoX48Q/R98jfQyBJCxqBV4PoK5pnUIYfDq5KscTtZMbOU7
 7xZFcp9YUlHqDbTRjYS8Gmb/86jk7S3Sq9PkFQ/DB8/SiXDXbqTzef9ai1YTWvP+RovC
 TDEwlhibRoF042YZvHvm3Ijk0DCYNHlqvgcRPHUh0G+14NrEf5r2epDwvCaLTQQDCgjr
 kO6z8e1MR75x3j7yHHwzRBmG4vg+/QsdYteQjIGolMAttq0U6B5dBSotwDNRDq38/qwt
 LQDQ==
X-Gm-Message-State: AOAM531cfby69r45IFGe/ie2joIhsPxMQ/MNePQSVTJvpRwlfchYv/tw
 GBnnsHyqTqyXYTsDEwnkxUlRHG9I/jVtk5A7nbX58A==
X-Google-Smtp-Source: ABdhPJyJjd+GuCZmlMNkgZCeZ9+naXLINbrG1wRxL+su0PnFd24LFXHPXdCBCn65ZaYzL/PnuGAtNBGEpDWYECyklmQ=
X-Received: by 2002:a4a:d4c7:: with SMTP id r7mr3769531oos.85.1623429311372;
 Fri, 11 Jun 2021 09:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210611163109.1085592-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210611163109.1085592-1-tvrtko.ursulin@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 11 Jun 2021 18:35:00 +0200
Message-ID: <CAKMK7uEfOt5zET0LL-noxHybWGefBK580Dn_zOyL4oKyhwGDnA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Document the Virtual Engine uAPI
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

On Fri, Jun 11, 2021 at 6:31 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> A little bit of documentation covering the topics of engine discovery,
> context engine maps and virtual engines. It is not very detailed but
> supposed to be a starting point of giving a brief high level overview of
> general principles and intended use cases.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This is great stuff, but I think it'd be better within the uapi
headers and then pulled in. It's not very customary, but you can write
very extensive kerneldoc for an uapi struct, and I think for uapi
that's a pretty good approach. So including all the examples and
everything.

I'm bringing this up and the very next section is the Locking guide.
And clearly that thing did not work out as documentation, I feel like
just dumping lots of docs into i915.rst is a good place for where they
disappear and get forgotten :-(

Thanks, Daniel

> ---
>  Documentation/gpu/i915.rst | 184 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 184 insertions(+)
>
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 42ce0196930a..8e5ab299c31f 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -335,6 +335,190 @@ for execution also include a list of all locations within buffers that
>  refer to GPU-addresses so that the kernel can edit the buffer correctly.
>  This process is dubbed relocation.
>
> +Engine Discovery uAPI
> +---------------------
> +
> +Engine discovery uAPI is a way of enumerating physical engines present in a GPU
> +associated with an open i915 DRM file descriptor. This supersedes the old way of
> +using `DRM_IOCTL_I915_GETPARAM` and engine identifiers like
> +`I915_PARAM_HAS_BLT`.
> +
> +The need for this interface came starting with Icelake and newer GPUs, which
> +started to establish a pattern of having multiple engines of a same class, where
> +not all instances were always completely functionally equivalent.
> +
> +Entry point for this uapi is `DRM_IOCTL_I915_QUERY` with the
> +`DRM_I915_QUERY_ENGINE_INFO` as the queried item id.
> +
> +Example for getting the list of engines:
> +
> +.. code-block:: C
> +
> +       struct drm_i915_query_engine_info *info;
> +       struct drm_i915_query_item item = {
> +               .query_id = DRM_I915_QUERY_ENGINE_INFO;
> +       };
> +       struct drm_i915_query query = {
> +               .num_items = 1,
> +               .items_ptr = (uintptr_t)&item,
> +       };
> +       int err, i;
> +
> +       // First query the size of the blob we need, this needs to be large
> +       // enough to hold our array of engines. The kernel will fill out the
> +       // item.length for us, which is the number of bytes we need.
> +       //
> +       // Alternatively a large buffer can be allocated straight away enabling
> +       // querying in one pass, in which case item.length should contain the
> +       // length of the provided buffer.
> +       err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> +       if (err) ...
> +
> +       info = calloc(1, item.length);
> +       // Now that we allocated the required number of bytes, we call the ioctl
> +       // again, this time with the data_ptr pointing to our newly allocated
> +       // blob, which the kernel can then populate with info on all engines.
> +       item.data_ptr = (uintptr_t)&info,
> +
> +       err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
> +       if (err) ...
> +
> +       // We can now access each engine in the array
> +       for (i = 0; i < info->num_engines; i++) {
> +               struct drm_i915_engine_info einfo = info->engines[i];
> +               u16 class = einfo.engine.class;
> +               u16 instance = einfo.engine.instance;
> +               ....
> +       }
> +
> +       free(info);
> +
> +Each of the enumerated engines, apart from being defined by its class and
> +instance (see `struct i915_engine_class_instance`), also can have flags and
> +capabilities defined as documented in i915_drm.h.
> +
> +For instance video engines which support HEVC encoding will have the
> +`I915_VIDEO_CLASS_CAPABILITY_HEVC` capability bit set.
> +
> +Engine discovery only fully comes to its own when combined with the new way of
> +addressing engines when submitting batch buffers using contexts with engine
> +maps configured.
> +
> +Context Engine Map uAPI
> +-----------------------
> +
> +Context engine map is a new way of addressing engines when submitting batch-
> +buffers, replacing the existing way of using identifiers like `I915_EXEC_BLT`
> +inside the flags field of `struct drm_i915_gem_execbuffer2`.
> +
> +To use it created GEM contexts need to be configured with a list of engines
> +the user is intending to submit to. This is accomplished using the
> +`I915_CONTEXT_PARAM_ENGINES` parameter and `struct i915_context_param_engines`.
> +
> +For such contexts the `I915_EXEC_RING_MASK` field becomes an index into the
> +configured map.
> +
> +Example of creating such context and submitting against it:
> +
> +.. code-block:: C
> +
> +       I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 2) = {
> +               .engines = { { I915_ENGINE_CLASS_RENDER, 0 },
> +                            { I915_ENGINE_CLASS_COPY, 0 } }
> +       };
> +       struct drm_i915_gem_context_create_ext_setparam p_engines = {
> +               .base = {
> +                       .name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> +               },
> +               .param = {
> +                       .param = I915_CONTEXT_PARAM_ENGINES,
> +                       .value = to_user_pointer(&engines),
> +                       .size = sizeof(engines),
> +               },
> +       };
> +       struct drm_i915_gem_context_create_ext create = {
> +               .flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> +               .extensions = to_user_pointer(&p_engines);
> +       };
> +
> +       ctx_id = gem_context_create_ext(drm_fd, &create);
> +
> +       // We have now created a GEM context with two engines in the map:
> +       // Index 0 points to rcs0 while index 1 points to bcs0. Other engines
> +       // will not be accessible from this context.
> +
> +       ...
> +       execbuf.rsvd1 = ctx_id;
> +       execbuf.flags = 0; // Submits to index0, which is rcs0 for this context
> +       gem_execbuf(drm_fd, &execbuf);
> +
> +       ...
> +       execbuf.rsvd1 = ctx_id;
> +       execbuf.flags = 1; // Submits to index0, which is bcs0 for this context
> +       gem_execbuf(drm_fd, &execbuf);
> +
> +Virtual Engine uAPI
> +-------------------
> +
> +Virtual engine is a concept where userspace is able to configure a set of
> +physical engines, submit a batch buffer, and let the driver execute it on any
> +engine from the set as it sees fit.
> +
> +This is primarily useful on parts which have multiple instances of a same class
> +engine, like for example GT3+ Skylake parts with their two VCS engines.
> +
> +For instance userspace can enumerate all engines of a certain class using the
> +previously described `Engine Discovery uAPI`_. After
> +that userspace can create a GEM context with a placeholder slot for the virtual
> +engine (using `I915_ENGINE_CLASS_INVALID` and `I915_ENGINE_CLASS_INVALID_NONE`
> +for class and instance respectively) and finally using the
> +`I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE` extension place a virtual engine in the
> +same reserved slot.
> +
> +Example of creating a virtual engine and submitting a batch buffer to it:
> +
> +.. code-block:: C
> +
> +       I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(virtual, 2) = {
> +               .base.name = I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE,
> +               .engine_index = 0, // Place this virtual engine into engine map slot 0
> +               .num_siblings = 2,
> +               .engines = { { I915_ENGINE_CLASS_VIDEO, 0 },
> +                            { I915_ENGINE_CLASS_VIDEO, 1 }, },
> +       };
> +       I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
> +               .engines = { { I915_ENGINE_CLASS_INVALID,
> +                              I915_ENGINE_CLASS_INVALID_NONE } },
> +               .extensions = to_user_pointer(&virtual), // Chains with the load_balance extension
> +       };
> +       struct drm_i915_gem_context_create_ext_setparam p_engines = {
> +               .base = {
> +                       .name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> +               },
> +               .param = {
> +                       .param = I915_CONTEXT_PARAM_ENGINES,
> +                       .value = to_user_pointer(&engines),
> +                       .size = sizeof(engines),
> +               },
> +       };
> +       struct drm_i915_gem_context_create_ext create = {
> +               .flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> +               .extensions = to_user_pointer(&p_engines);
> +       };
> +
> +       ctx_id = gem_context_create_ext(drm_fd, &create);
> +
> +       // Now we have created a GEM context with its engine map containing a
> +       // single virtual engine. Submissions to this slot can go either to
> +       // vcs0 or vcs1, depending on the load balancing algorithm used inside
> +       // the driver. The load balancing is dynamic from one batch buffer to
> +       // another and transparent to userspace.
> +
> +       ...
> +       execbuf.rsvd1 = ctx_id;
> +       execbuf.flags = 0; // Submits to index0 which is the virtual engine
> +       gem_execbuf(drm_fd, &execbuf);
> +
>  Locking Guidelines
>  ------------------
>
> --
> 2.30.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
