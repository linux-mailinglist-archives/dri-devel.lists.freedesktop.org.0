Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BDC3C5E68
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBD689B0C;
	Mon, 12 Jul 2021 14:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7189B0C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:34:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id w13so11564942wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F6Lqro/VmaC5bpPEEZt2OJdm8+CajguaQspToRgf39s=;
 b=hjhS3J0OOEUBw7/N2acW3bwqc8OsvZDQqcYkK3E2/CJnIJnlamQecks0mlHDhywR5i
 Plmur+xkuw0qrzTQ6hDvV8F+KKRooLLNB4RTOyTi6AUey+r/ZPIiCi3/Mbq4EXvCij5p
 xdiGO98rlYvlNvT+j65tCTwC0phq+8tdvd+Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F6Lqro/VmaC5bpPEEZt2OJdm8+CajguaQspToRgf39s=;
 b=PbI9zWgmhmc2x6e8DdO7Hyhw8B0/QT8q0XOM9QeiqLP/qe8VTAKhSGbJdFpAUD2UfY
 +WW93dXOlJmnkD3kPkM2b+scc//a2vzU4r56WzdNx+eDUB1jPb8xyZWmM0x9IO5HBxoF
 78TLoAjJ38om1obrodUlVgxLZRr1pPIE1xxpa0U1F43yL6lWxOpr/foeF0V6oMS+UWdE
 47ifwVRhSsSiGBvdByGK8vIPD9MPp0fXdqY1s8VsQQwhEcwG5yUtRExxaKbQSeOyc/DC
 KZwXI2y8PAtXeSr3Msia+e+uDk4BrSI2HZUHqzJ9nPCApkRVf2fs3nbd+1n0SVJufjgt
 LY4Q==
X-Gm-Message-State: AOAM531evFkDA/1zqNTXoik4zxQEOKCM8V+E/NuY38w/OOl0Ob6qbv4p
 a7BWqnjI/NaQ4aYsmO4zBRr5Fg==
X-Google-Smtp-Source: ABdhPJw4aDfGm1VpjlClPRzuZJwQBgCbalXapxn2nNE/iqEqh7/j+6U0cotXuSTh1WTBEYxOlVFBRQ==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr57143869wmb.65.1626100455955; 
 Mon, 12 Jul 2021 07:34:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x9sm9573362wrm.82.2021.07.12.07.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:34:15 -0700 (PDT)
Date: Mon, 12 Jul 2021 16:34:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 2/2] drm/i915/uapi: Add docs about immutability of engine
 sets and VMs
Message-ID: <YOxS5cidWjsKKcT8@phenom.ffwll.local>
References: <20210710212447.785288-1-jason@jlekstrand.net>
 <20210710212447.785288-3-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210710212447.785288-3-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 10, 2021 at 04:24:47PM -0500, Jason Ekstrand wrote:
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/uapi/drm/i915_drm.h | 39 ++++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index e334a8b14ef2d..b6bfbda1258c8 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1676,15 +1676,25 @@ struct drm_i915_gem_context_param {
>   */
>  #define I915_CONTEXT_PARAM_RECOVERABLE	0x8
>  
> -	/*
> -	 * The id of the associated virtual memory address space (ppGTT) of
> -	 * this context. Can be retrieved and passed to another context
> -	 * (on the same fd) for both to use the same ppGTT and so share
> -	 * address layouts, and avoid reloading the page tables on context
> -	 * switches between themselves.
> -	 *
> -	 * See DRM_I915_GEM_VM_CREATE and DRM_I915_GEM_VM_DESTROY.
> -	 */
> +/*

So the annoying thing here is that this way it's not picked up by the
kerneldoc machinery.

I think what Matt has done is included parameters as an item list in the
relevant struct kerneldoc, which seems like the most reasonable thing to
do with them.

That means some mild duplication for get/set parts, but since we've made
the uapi very asymmetric in that, that's probably a feature.

> + * The id of the associated virtual memory address space (ppGTT) of
> + * this context. Can be retrieved and passed to another context
> + * (on the same fd) for both to use the same ppGTT and so share
> + * address layouts, and avoid reloading the page tables on context
> + * switches between themselves.
> + *
> + * The VM id should only be set via I915_CONTEXT_CREATE_EXT_SETPARAM.
> + *
> + * On GPUs with graphics version 12 and earlier, it may also be set via
> + * DRM_IOCTL_I915_GEM_CONTEXT_SETPARAM.  However, this is only for
> + * backwards compatibility with old userspace and should be considered
> + * deprecated.  Starting with graphics version 13, it can only be set via
> + * I915_CONTEXT_CREATE_EXT_SETPARAM.  When using setparam, it may only be
> + * set once for each context and, once the context has been used with any
> + * ioctl other than I915_CONTEXT_CREATE_EXT_SETPARAM, it may not be set.
> + *
> + * See DRM_I915_GEM_VM_CREATE and DRM_I915_GEM_VM_DESTROY.

Again for kerneldoc linking to the struct of the ioctl is probably better,
since then you get a link.

> + */
>  #define I915_CONTEXT_PARAM_VM		0x9
>  
>  /*
> @@ -1700,8 +1710,15 @@ struct drm_i915_gem_context_param {
>   * to specify a gap in the array that can be filled in later, e.g. by a
>   * virtual engine used for load balancing.
>   *
> - * Setting the number of engines bound to the context to 0, by passing a zero
> - * sized argument, will revert back to default settings.
> + * The engine set should only be set via I915_CONTEXT_CREATE_EXT_SETPARAM.
> + *
> + * On GPUs with graphics version 12 and earlier, it may also be set via
> + * DRM_IOCTL_I915_GEM_CONTEXT_SETPARAM.  However, this is only for
> + * backwards compatibility with old userspace and should be considered
> + * deprecated.  Starting with graphics version 13, it can only be set via
> + * I915_CONTEXT_CREATE_EXT_SETPARAM.  When using setparam, it may only be
> + * set once for each context and, once the context has been used with any
> + * ioctl other than I915_CONTEXT_CREATE_EXT_SETPARAM, it may not be set.
>   *
>   * See struct i915_context_param_engines.

Maybe we should push most of the docs for params with structs into the
struct's kerneldoc?
-Daniel

>   *
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
