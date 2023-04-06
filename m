Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16C66D9262
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9550410E215;
	Thu,  6 Apr 2023 09:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E566B10E215;
 Thu,  6 Apr 2023 09:12:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y20so50000256lfj.2;
 Thu, 06 Apr 2023 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680772328; x=1683364328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RVMuuQ3WL8W/2yVdMoSN76pKRdF4P4E3Q+WmZ/7HtQk=;
 b=qYXtlH/EveQYfuPvlk0pEmDcozgAGop7TJnI8xWR/VZZNOTAwR60eqWAgghY+/sH9y
 Jb2vEHO7GLmYSKUlJEu4A1E96Jusar+DpyKlTYKXoIP18xPawjmrTDkM2EERDKRjFNvR
 BYV9/cZgaLtS1cpUh/IsIEj1yIkgWvurKJ8hcJWzaGzdZeJlZXg47ADbCkXFzFgI7mJg
 YqI2yS2ciRO16xjUo0L6jlvExFvTIxDz+uvtt0is2+BTBf5tr+wBFU2g5HJgJrQu7zEU
 +bdTx/6l8PINCNDqxPnvpyw84/mcWH5kdVatSujmxER7/8toKMju+nntc1mJ5mxIz5Vw
 HwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680772328; x=1683364328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RVMuuQ3WL8W/2yVdMoSN76pKRdF4P4E3Q+WmZ/7HtQk=;
 b=GPFInwpBCAxNJLUGnChiEdf0ho6U17dCY7Li0U3EGs1+zMQoVVyY9K4z3xz4QtyNzw
 +9FGOBz2MdziASnNOWHt5QpqzhQVVKi184YgU9Dcc/Fh2eJo9lNizqOZxTlA+HNzpGNH
 uLJ702+YqgLzq2r2DfcqM0jezvu0jnWN3dEB0HPT2rT6G+4+72QdJFBeJpeOnfSRo4Zv
 abQcjNOJWW0KkXOiBU8YXsqtDrFtr6iuIlBvhguFT0df/osgF0LEcIIX7FdAcGRIlAj5
 AL6wewBd9jxgNvLOZ2lwHd7ZyMTD1/ZRHxNfmm5Ra0pEJEL2SunqHsJU+gaEofNAxwl7
 jPIg==
X-Gm-Message-State: AAQBX9dN3r+muaKxCDr47vLDbO3RS9rmp+RLyRnDHfVikT6PG6APf+v8
 EyolEAckwYtzYJiW3VtVwSi/YIwXSU1i0i6CiTMJul1ro50=
X-Google-Smtp-Source: AKy350Z2vEFRMRaOA7nZ1cQl5HHxxBhoUJxInF9czVfhDPiHtX4F+z3bnI5Ll2mRSClB+pxrKrC9rmKiXW+X21qOj9M=
X-Received: by 2002:ac2:5619:0:b0:4d5:ca32:6ed8 with SMTP id
 v25-20020ac25619000000b004d5ca326ed8mr1757464lfd.6.1680772327547; Thu, 06 Apr
 2023 02:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
In-Reply-To: <20230401063830.438127-8-fei.yang@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 6 Apr 2023 10:11:40 +0100
Message-ID: <CAM0jSHOSeyMWw_GEaY-T2iDKyZ8U5fVH9J5sC1mtxzQXz=erGA@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/i915: Allow user to set cache at BO creation
To: fei.yang@intel.com
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 1 Apr 2023 at 07:37, <fei.yang@intel.com> wrote:
>
> From: Fei Yang <fei.yang@intel.com>
>
> To comply with the design that buffer objects shall have immutable
> cache setting through out its life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.

Do we forbid {set, get}_caching, when combined with this new extension
on the same BO? There is some documentation in @cache_dirty. The
concern is being able to subvert the flush-on-acquire for non-LLC.

>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 33 ++++++++++++++++++++
>  include/uapi/drm/i915_drm.h                | 36 ++++++++++++++++++++++
>  tools/include/uapi/drm/i915_drm.h          | 36 ++++++++++++++++++++++
>  3 files changed, 105 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index e76c9703680e..1c6e2034d28e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -244,6 +244,7 @@ struct create_ext {
>         unsigned int n_placements;
>         unsigned int placement_mask;
>         unsigned long flags;
> +       unsigned int pat_index;
>  };
>
>  static void repr_placements(char *buf, size_t size,
> @@ -393,11 +394,39 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
>         return 0;
>  }
>
> +static int ext_set_pat(struct i915_user_extension __user *base, void *data)
> +{
> +       struct create_ext *ext_data = data;
> +       struct drm_i915_private *i915 = ext_data->i915;
> +       struct drm_i915_gem_create_ext_set_pat ext;
> +       unsigned int max_pat_index;
> +
> +       BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=
> +                    offsetofend(struct drm_i915_gem_create_ext_set_pat, rsvd));
> +
> +       if (copy_from_user(&ext, base, sizeof(ext)))
> +               return -EFAULT;
> +
> +       max_pat_index = INTEL_INFO(i915)->max_pat_index;
> +
> +       if (ext.pat_index > max_pat_index) {
> +               drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
> +                       ext.pat_index);
> +               return -EINVAL;
> +       }
> +
> +       ext_data->pat_index = ext.pat_index;
> +
> +       return 0;
> +}
> +
>  static const i915_user_extension_fn create_extensions[] = {
>         [I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>         [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
> +       [I915_GEM_CREATE_EXT_SET_PAT] = ext_set_pat,
>  };
>
> +#define PAT_INDEX_NOT_SET      0xffff
>  /**
>   * Creates a new mm object and returns a handle to it.
>   * @dev: drm device pointer
> @@ -417,6 +446,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>         if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>                 return -EINVAL;
>
> +       ext_data.pat_index = PAT_INDEX_NOT_SET;
>         ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
>                                    create_extensions,
>                                    ARRAY_SIZE(create_extensions),
> @@ -453,5 +483,8 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>         if (IS_ERR(obj))
>                 return PTR_ERR(obj);
>
> +       if (ext_data.pat_index != PAT_INDEX_NOT_SET)
> +               i915_gem_object_set_pat_index(obj, ext_data.pat_index);
> +
>         return i915_gem_publish(obj, file, &args->size, &args->handle);
>  }
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index dba7c5a5b25e..03c5c314846e 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3630,9 +3630,13 @@ struct drm_i915_gem_create_ext {
>          *
>          * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>          * struct drm_i915_gem_create_ext_protected_content.
> +        *
> +        * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +        * struct drm_i915_gem_create_ext_set_pat.
>          */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>         __u64 extensions;
>  };
>
> @@ -3747,6 +3751,38 @@ struct drm_i915_gem_create_ext_protected_content {
>         __u32 flags;
>  };
>
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *              .pat_index = 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext = {
> + *              .size = PAGE_SIZE,
> + *              .extensions = (uintptr_t)&set_pat_ext,
> + *      };
> + *
> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *      if (err) ...
> + */
> +struct drm_i915_gem_create_ext_set_pat {
> +       /** @base: Extension link. See struct i915_user_extension. */
> +       struct i915_user_extension base;
> +       /** @pat_index: PAT index to be set */
> +       __u32 pat_index;
> +       /** @rsvd: reserved for future use */
> +       __u32 rsvd;
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>
> diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/i915_drm.h
> index 8df261c5ab9b..8cdcdb5fac26 100644
> --- a/tools/include/uapi/drm/i915_drm.h
> +++ b/tools/include/uapi/drm/i915_drm.h
> @@ -3607,9 +3607,13 @@ struct drm_i915_gem_create_ext {
>          *
>          * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>          * struct drm_i915_gem_create_ext_protected_content.
> +        *
> +        * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +        * struct drm_i915_gem_create_ext_set_pat.
>          */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>         __u64 extensions;
>  };
>
> @@ -3724,6 +3728,38 @@ struct drm_i915_gem_create_ext_protected_content {
>         __u32 flags;
>  };
>
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *              .pat_index = 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext = {
> + *              .size = PAGE_SIZE,
> + *              .extensions = (uintptr_t)&set_pat_ext,
> + *      };
> + *
> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *      if (err) ...
> + */
> +struct drm_i915_gem_create_ext_set_pat {
> +       /** @base: Extension link. See struct i915_user_extension. */
> +       struct i915_user_extension base;
> +       /** @pat_index: PAT index to be set */
> +       __u32 pat_index;
> +       /** @rsvd: reserved for future use */
> +       __u32 rsvd;
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>
> --
> 2.25.1
>
