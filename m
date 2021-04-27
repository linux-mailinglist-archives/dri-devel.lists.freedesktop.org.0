Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C5A36C1C6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E7189FF9;
	Tue, 27 Apr 2021 09:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD1E89FF9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:32:52 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 26-20020a05600c22dab029013efd7879b8so4786482wmg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qqB+S72Kt0jeXIT+GwCPkd91WNyg118PnRWigzmTcUI=;
 b=GLJX/M9esFg5o5sGKlHREF35TeE7QdywcwlQG55h8qIB7aZiEmhc00tck9xmCYcZTo
 TJez+ZNAs/VryiFEIOFSESn5iSE58aQGXgY62AaToK7QV//YdUO+d7/LxL3HTn96ENVp
 Yo4qellkAJ2gAF7gzusiKTraziR+OxmTxY1qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qqB+S72Kt0jeXIT+GwCPkd91WNyg118PnRWigzmTcUI=;
 b=ZIYQu4NwGdnrdAfTSJB9s2OSrkpf2h2eg8CuIZAtLJSPOOtcTYSkmfHjVv4V/5Sq3L
 JEAviGKa5C66VQ6MYIQI9mDSgPK71BNnh0qMRYed4Nfb43u0QKJMW1fovCEc4rkRECKy
 3OdBf7Aq8MfMuLtKKAYjYhoG7GFzxQp+Txxgp7RI1QY7xjhxXiAAiU4AvrUBYvmVzPvY
 T2VoFC8kTImKKeu9BhSFlQOzIsNQykh45+RbN2zTln9P4DCm/ypC2cuMMU76N4cRZL8F
 h/4YJCfU4FbtMaSldFk12up9RIpV7r1bkhw4jxAOQJ9VCTPEzW0uqQynIBomvS/BI2F8
 gyQA==
X-Gm-Message-State: AOAM531xcHlBjaVMV7oIWzUWu8DahtSJzEqIBPeHUNvUcshxWvvc7hD0
 vDxxPXEgTMLXWjXo0O+qDittrw==
X-Google-Smtp-Source: ABdhPJyixuL7Mz8cmFiUSm2bDFuUXb+awHskYE4sAP99hZgVCpOitUQ5WJaMkxTFCG5dep0vEZV4Ag==
X-Received: by 2002:a05:600c:2141:: with SMTP id
 v1mr23843589wml.22.1619515970891; 
 Tue, 27 Apr 2021 02:32:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 3sm10006561wms.30.2021.04.27.02.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:32:50 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:32:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 01/21] drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
Message-ID: <YIfaQJeZdIHlJ30D@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-2-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-2-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 05:31:11PM -0500, Jason Ekstrand wrote:
> This reverts commit 88be76cdafc7 ("drm/i915: Allow userspace to specify
> ringsize on construction").  This API was originally added for OpenCL
> but the compute-runtime PR has sat open for a year without action so we
> can still pull it out if we want.  I argue we should drop it for three
> reasons:
> =

>  1. If the compute-runtime PR has sat open for a year, this clearly
>     isn't that important.
> =

>  2. It's a very leaky API.  Ring size is an implementation detail of the
>     current execlist scheduler and really only makes sense there.  It
>     can't apply to the older ring-buffer scheduler on pre-execlist
>     hardware because that's shared across all contexts and it won't
>     apply to the GuC scheduler that's in the pipeline.
> =

>  3. Having userspace set a ring size in bytes is a bad solution to the
>     problem of having too small a ring.  There is no way that userspace
>     has the information to know how to properly set the ring size so
>     it's just going to detect the feature and always set it to the
>     maximum of 512K.  This is what the compute-runtime PR does.  The
>     scheduler in i915, on the other hand, does have the information to
>     make an informed choice.  It could detect if the ring size is a
>     problem and grow it itself.  Or, if that's too hard, we could just
>     increase the default size from 16K to 32K or even 64K instead of
>     relying on userspace to do it.
> =

> Let's drop this API for now and, if someone decides they really care
> about solving this problem, they can do it properly.
> =

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Two things:
- I'm assuming you have an igt change to make sure we get EINVAL for both
  set and getparam now? Just to make sure.

- intel_context->ring is either a ring pointer when CONTEXT_ALLOC_BIT is
  set in ce->flags, or the size of the ring stored in the pointer if not.
  I'm seriously hoping you get rid of this complexity with your
  proto-context series, and also delete __intel_context_ring_size() in the
  end. That function has no business existing imo.

  If not, please make sure that's the case.

Aside from these patch looks good.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/Makefile                 |  1 -
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 85 +------------------
>  drivers/gpu/drm/i915/gt/intel_context_param.c | 63 --------------
>  drivers/gpu/drm/i915/gt/intel_context_param.h |  3 -
>  include/uapi/drm/i915_drm.h                   | 20 +----
>  5 files changed, 4 insertions(+), 168 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c
> =

> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index d0d936d9137bc..afa22338fa343 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -88,7 +88,6 @@ gt-y +=3D \
>  	gt/gen8_ppgtt.o \
>  	gt/intel_breadcrumbs.o \
>  	gt/intel_context.o \
> -	gt/intel_context_param.o \
>  	gt/intel_context_sseu.o \
>  	gt/intel_engine_cs.o \
>  	gt/intel_engine_heartbeat.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.c
> index fd8ee52e17a47..e52b85b8f923d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1335,63 +1335,6 @@ static int set_ppgtt(struct drm_i915_file_private =
*file_priv,
>  	return err;
>  }
>  =

> -static int __apply_ringsize(struct intel_context *ce, void *sz)
> -{
> -	return intel_context_set_ring_size(ce, (unsigned long)sz);
> -}
> -
> -static int set_ringsize(struct i915_gem_context *ctx,
> -			struct drm_i915_gem_context_param *args)
> -{
> -	if (!HAS_LOGICAL_RING_CONTEXTS(ctx->i915))
> -		return -ENODEV;
> -
> -	if (args->size)
> -		return -EINVAL;
> -
> -	if (!IS_ALIGNED(args->value, I915_GTT_PAGE_SIZE))
> -		return -EINVAL;
> -
> -	if (args->value < I915_GTT_PAGE_SIZE)
> -		return -EINVAL;
> -
> -	if (args->value > 128 * I915_GTT_PAGE_SIZE)
> -		return -EINVAL;
> -
> -	return context_apply_all(ctx,
> -				 __apply_ringsize,
> -				 __intel_context_ring_size(args->value));
> -}
> -
> -static int __get_ringsize(struct intel_context *ce, void *arg)
> -{
> -	long sz;
> -
> -	sz =3D intel_context_get_ring_size(ce);
> -	GEM_BUG_ON(sz > INT_MAX);
> -
> -	return sz; /* stop on first engine */
> -}
> -
> -static int get_ringsize(struct i915_gem_context *ctx,
> -			struct drm_i915_gem_context_param *args)
> -{
> -	int sz;
> -
> -	if (!HAS_LOGICAL_RING_CONTEXTS(ctx->i915))
> -		return -ENODEV;
> -
> -	if (args->size)
> -		return -EINVAL;
> -
> -	sz =3D context_apply_all(ctx, __get_ringsize, NULL);
> -	if (sz < 0)
> -		return sz;
> -
> -	args->value =3D sz;
> -	return 0;
> -}
> -
>  int
>  i915_gem_user_to_context_sseu(struct intel_gt *gt,
>  			      const struct drm_i915_gem_context_param_sseu *user,
> @@ -2037,11 +1980,8 @@ static int ctx_setparam(struct drm_i915_file_priva=
te *fpriv,
>  		ret =3D set_persistence(ctx, args);
>  		break;
>  =

> -	case I915_CONTEXT_PARAM_RINGSIZE:
> -		ret =3D set_ringsize(ctx, args);
> -		break;
> -
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
> +	case I915_CONTEXT_PARAM_RINGSIZE:
>  	default:
>  		ret =3D -EINVAL;
>  		break;
> @@ -2069,18 +2009,6 @@ static int create_setparam(struct i915_user_extens=
ion __user *ext, void *data)
>  	return ctx_setparam(arg->fpriv, arg->ctx, &local.param);
>  }
>  =

> -static int copy_ring_size(struct intel_context *dst,
> -			  struct intel_context *src)
> -{
> -	long sz;
> -
> -	sz =3D intel_context_get_ring_size(src);
> -	if (sz < 0)
> -		return sz;
> -
> -	return intel_context_set_ring_size(dst, sz);
> -}
> -
>  static int clone_engines(struct i915_gem_context *dst,
>  			 struct i915_gem_context *src)
>  {
> @@ -2125,12 +2053,6 @@ static int clone_engines(struct i915_gem_context *=
dst,
>  		}
>  =

>  		intel_context_set_gem(clone->engines[n], dst);
> -
> -		/* Copy across the preferred ringsize */
> -		if (copy_ring_size(clone->engines[n], e->engines[n])) {
> -			__free_engines(clone, n + 1);
> -			goto err_unlock;
> -		}
>  	}
>  	clone->num_engines =3D n;
>  	i915_sw_fence_complete(&e->fence);
> @@ -2490,11 +2412,8 @@ int i915_gem_context_getparam_ioctl(struct drm_dev=
ice *dev, void *data,
>  		args->value =3D i915_gem_context_is_persistent(ctx);
>  		break;
>  =

> -	case I915_CONTEXT_PARAM_RINGSIZE:
> -		ret =3D get_ringsize(ctx, args);
> -		break;
> -
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
> +	case I915_CONTEXT_PARAM_RINGSIZE:
>  	default:
>  		ret =3D -EINVAL;
>  		break;
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.c b/drivers/gpu/=
drm/i915/gt/intel_context_param.c
> deleted file mode 100644
> index 65dcd090245d6..0000000000000
> --- a/drivers/gpu/drm/i915/gt/intel_context_param.c
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright =A9 2019 Intel Corporation
> - */
> -
> -#include "i915_active.h"
> -#include "intel_context.h"
> -#include "intel_context_param.h"
> -#include "intel_ring.h"
> -
> -int intel_context_set_ring_size(struct intel_context *ce, long sz)
> -{
> -	int err;
> -
> -	if (intel_context_lock_pinned(ce))
> -		return -EINTR;
> -
> -	err =3D i915_active_wait(&ce->active);
> -	if (err < 0)
> -		goto unlock;
> -
> -	if (intel_context_is_pinned(ce)) {
> -		err =3D -EBUSY; /* In active use, come back later! */
> -		goto unlock;
> -	}
> -
> -	if (test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
> -		struct intel_ring *ring;
> -
> -		/* Replace the existing ringbuffer */
> -		ring =3D intel_engine_create_ring(ce->engine, sz);
> -		if (IS_ERR(ring)) {
> -			err =3D PTR_ERR(ring);
> -			goto unlock;
> -		}
> -
> -		intel_ring_put(ce->ring);
> -		ce->ring =3D ring;
> -
> -		/* Context image will be updated on next pin */
> -	} else {
> -		ce->ring =3D __intel_context_ring_size(sz);
> -	}
> -
> -unlock:
> -	intel_context_unlock_pinned(ce);
> -	return err;
> -}
> -
> -long intel_context_get_ring_size(struct intel_context *ce)
> -{
> -	long sz =3D (unsigned long)READ_ONCE(ce->ring);
> -
> -	if (test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
> -		if (intel_context_lock_pinned(ce))
> -			return -EINTR;
> -
> -		sz =3D ce->ring->size;
> -		intel_context_unlock_pinned(ce);
> -	}
> -
> -	return sz;
> -}
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.h b/drivers/gpu/=
drm/i915/gt/intel_context_param.h
> index 3ecacc675f414..dffedd983693d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_param.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_param.h
> @@ -10,9 +10,6 @@
>  =

>  #include "intel_context.h"
>  =

> -int intel_context_set_ring_size(struct intel_context *ce, long sz);
> -long intel_context_get_ring_size(struct intel_context *ce);
> -
>  static inline int
>  intel_context_set_watchdog_us(struct intel_context *ce, u64 timeout_us)
>  {
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 6a34243a7646a..6eefbc6dec01f 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1721,24 +1721,8 @@ struct drm_i915_gem_context_param {
>   */
>  #define I915_CONTEXT_PARAM_PERSISTENCE	0xb
>  =

> -/*
> - * I915_CONTEXT_PARAM_RINGSIZE:
> - *
> - * Sets the size of the CS ringbuffer to use for logical ring contexts. =
This
> - * applies a limit of how many batches can be queued to HW before the ca=
ller
> - * is blocked due to lack of space for more commands.
> - *
> - * Only reliably possible to be set prior to first use, i.e. during
> - * construction. At any later point, the current execution must be flush=
ed as
> - * the ring can only be changed while the context is idle. Note, the rin=
gsize
> - * can be specified as a constructor property, see
> - * I915_CONTEXT_CREATE_EXT_SETPARAM, but can also be set later if requir=
ed.
> - *
> - * Only applies to the current set of engine and lost when those engines
> - * are replaced by a new mapping (see I915_CONTEXT_PARAM_ENGINES).
> - *
> - * Must be between 4 - 512 KiB, in intervals of page size [4 KiB].
> - * Default is 16 KiB.
> +/* This API has been removed.  On the off chance someone somewhere has
> + * attempted to use it, never re-use this context param number.
>   */
>  #define I915_CONTEXT_PARAM_RINGSIZE	0xc
>  /* Must be kept compact -- no holes and well documented */
> -- =

> 2.31.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
