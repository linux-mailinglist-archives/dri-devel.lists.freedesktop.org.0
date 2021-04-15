Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029873610DD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 19:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252B56EA9E;
	Thu, 15 Apr 2021 17:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E2C6EA9A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 17:17:01 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id l131so19961529oih.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YYLOaQnglx4dad9cfruRutaGW58rxzQ9HsSlgbdoo3k=;
 b=BUTKRFOOkKQtgjkD5PaYYFKqAKF6wFR9QtchU3yDMg5FZq8D3NZqujssISknscNqol
 gBXb0BypeckKhMK51PAMZpA7lj/OYZCkefQ91Mh5i+M+RxBamdiH/o/BRcpKnhcWOsys
 aJ3n/NLZTa1CRJ1X2WmZBwOW2tzwVNwtw8gUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YYLOaQnglx4dad9cfruRutaGW58rxzQ9HsSlgbdoo3k=;
 b=iTKI4os4gfFSWrLowowTGHb/Y+EyKmOJUIV/ssOAgnepPO2F37+rNPce4dVIxHXW+F
 3TqG2CfvTErr+qMNm7kAWW0CnY+2IqHanAcMkxVEl7S/LELW+nLlCqsRFNDPTr476mlr
 6mo5HIUv2zjd5rcC7cqzPosSsIYAv6EWUQiTYs/7BJNhIGwoaRx6fXimN7qNADztLPAR
 hznw0ISfB6+lwZVt/tp4+tX7BqRGJCluajuJxFzvFsCANjgjZXhyuLRCzsq3vPUNct3S
 qbkU29VuJvWjkTWTafynEFEyNdUYrkmi3aAIVBnb6m+EPzjb3U9fXtoE8a6J4gpQZK1u
 dPeA==
X-Gm-Message-State: AOAM532IRfxwXhL+OnvHKO2Fe84A9FW5iqcry+lIkE5erUGc0xC3YGNh
 KJ6iFlz53DQui4BAJhp3KHpmptXfP/o9lUTDkY8Mc+QyAiY=
X-Google-Smtp-Source: ABdhPJzTNcEFtqmC41aphMVY0y1lSscPmd+xg19yCWfIdfbrGX8zfHISaQJzvj6ili/T2t7GKWY6nOaWi2w5yb3YaLw=
X-Received: by 2002:aca:4188:: with SMTP id o130mr3287281oia.101.1618507020440; 
 Thu, 15 Apr 2021 10:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210328225709.18541-1-daniele.ceraolospurio@intel.com>
 <20210328225709.18541-13-daniele.ceraolospurio@intel.com>
In-Reply-To: <20210328225709.18541-13-daniele.ceraolospurio@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Apr 2021 19:16:49 +0200
Message-ID: <CAKMK7uG45gvnKRaNyCKSmuJ0=+hftPe6rvrCHMtxX8AU5H+ckg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 12/16] drm/i915/uapi: introduce
 drm_i915_gem_create_ext
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, 
 Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 12:58 AM Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>
> Same old gem_create but with now with extensions support. This is needed
> to support various upcoming usecases. For now we use the extensions
> mechanism to support PAVP.
>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Telukuntla Sreedhar <sreedhar.telukuntla@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 41 ++++++++++++++++++-

gem changes need to be cc'ed to dri-devel. Also adding Jason on this,
since he just reviewed the gem_create_ext rfc from Matt.
-Daniel

>  drivers/gpu/drm/i915/i915_drv.c            |  2 +-
>  include/uapi/drm/i915_drm.h                | 47 ++++++++++++++++++++++
>  3 files changed, 88 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 45d60e3d98e3..3ad3413c459f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -7,6 +7,7 @@
>  #include "gem/i915_gem_region.h"
>
>  #include "i915_drv.h"
> +#include "i915_user_extensions.h"
>
>  static int
>  i915_gem_create(struct drm_file *file,
> @@ -91,6 +92,35 @@ i915_gem_dumb_create(struct drm_file *file,
>                                &args->size, &args->handle);
>  }
>
> +struct create_ext {
> +       struct drm_i915_private *i915;
> +};
> +
> +static int __create_setparam(struct drm_i915_gem_object_param *args,
> +                            struct create_ext *ext_data)
> +{
> +       if (!(args->param & I915_OBJECT_PARAM)) {
> +               DRM_DEBUG("Missing I915_OBJECT_PARAM namespace\n");
> +               return -EINVAL;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int create_setparam(struct i915_user_extension __user *base, void *data)
> +{
> +       struct drm_i915_gem_create_ext_setparam ext;
> +
> +       if (copy_from_user(&ext, base, sizeof(ext)))
> +               return -EFAULT;
> +
> +       return __create_setparam(&ext.param, data);
> +}
> +
> +static const i915_user_extension_fn create_extensions[] = {
> +       [I915_GEM_CREATE_EXT_SETPARAM] = create_setparam,
> +};
> +
>  /**
>   * Creates a new mm object and returns a handle to it.
>   * @dev: drm device pointer
> @@ -102,10 +132,19 @@ i915_gem_create_ioctl(struct drm_device *dev, void *data,
>                       struct drm_file *file)
>  {
>         struct drm_i915_private *i915 = to_i915(dev);
> -       struct drm_i915_gem_create *args = data;
> +       struct create_ext ext_data = { .i915 = i915 };
> +       struct drm_i915_gem_create_ext *args = data;
> +       int ret;
>
>         i915_gem_flush_free_objects(i915);
>
> +       ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
> +                                  create_extensions,
> +                                  ARRAY_SIZE(create_extensions),
> +                                  &ext_data);
> +       if (ret)
> +               return ret;
> +
>         return i915_gem_create(file,
>                                intel_memory_region_by_type(i915,
>                                                            INTEL_MEMORY_SYSTEM),
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 02d5b2b6ee39..f13e1ca2087b 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1707,7 +1707,7 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
>         DRM_IOCTL_DEF_DRV(I915_GEM_THROTTLE, i915_gem_throttle_ioctl, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(I915_GEM_ENTERVT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>         DRM_IOCTL_DEF_DRV(I915_GEM_LEAVEVT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> -       DRM_IOCTL_DEF_DRV(I915_GEM_CREATE, i915_gem_create_ioctl, DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(I915_GEM_CREATE_EXT, i915_gem_create_ioctl, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(I915_GEM_PREAD, i915_gem_pread_ioctl, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(I915_GEM_PWRITE, i915_gem_pwrite_ioctl, DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(I915_GEM_MMAP, i915_gem_mmap_ioctl, DRM_RENDER_ALLOW),
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 7a2088eccc9f..d5e502269a55 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -392,6 +392,7 @@ typedef struct _drm_i915_sarea {
>  #define DRM_IOCTL_I915_GEM_ENTERVT     DRM_IO(DRM_COMMAND_BASE + DRM_I915_GEM_ENTERVT)
>  #define DRM_IOCTL_I915_GEM_LEAVEVT     DRM_IO(DRM_COMMAND_BASE + DRM_I915_GEM_LEAVEVT)
>  #define DRM_IOCTL_I915_GEM_CREATE      DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE, struct drm_i915_gem_create)
> +#define DRM_IOCTL_I915_GEM_CREATE_EXT   DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE, struct drm_i915_gem_create_ext)
>  #define DRM_IOCTL_I915_GEM_PREAD       DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_PREAD, struct drm_i915_gem_pread)
>  #define DRM_IOCTL_I915_GEM_PWRITE      DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_PWRITE, struct drm_i915_gem_pwrite)
>  #define DRM_IOCTL_I915_GEM_MMAP                DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct drm_i915_gem_mmap)
> @@ -729,6 +730,27 @@ struct drm_i915_gem_create {
>         __u32 pad;
>  };
>
> +struct drm_i915_gem_create_ext {
> +       /**
> +        * Requested size for the object.
> +        *
> +        * The (page-aligned) allocated size for the object will be returned.
> +        */
> +       __u64 size;
> +       /**
> +        * Returned handle for the object.
> +        *
> +        * Object handles are nonzero.
> +        */
> +       __u32 handle;
> +       __u32 pad;
> +#define I915_GEM_CREATE_EXT_SETPARAM (1u << 0)
> +#define I915_GEM_CREATE_EXT_FLAGS_UNKNOWN \
> +       (-(I915_GEM_CREATE_EXT_SETPARAM << 1))
> +       __u64 extensions;
> +
> +};
> +
>  struct drm_i915_gem_pread {
>         /** Handle for the object being read. */
>         __u32 handle;
> @@ -1720,6 +1742,31 @@ struct drm_i915_gem_context_param {
>         __u64 value;
>  };
>
> +struct drm_i915_gem_object_param {
> +       /* Object handle (0 for I915_GEM_CREATE_EXT_SETPARAM) */
> +       __u32 handle;
> +
> +       /* Data pointer size */
> +       __u32 size;
> +
> +/*
> + * I915_OBJECT_PARAM:
> + *
> + * Select object namespace for the param.
> + */
> +#define I915_OBJECT_PARAM  (1ull << 32)
> +
> +       __u64 param;
> +
> +       /* Data value or pointer */
> +       __u64 data;
> +};
> +
> +struct drm_i915_gem_create_ext_setparam {
> +       struct i915_user_extension base;
> +       struct drm_i915_gem_object_param param;
> +};
> +
>  /**
>   * Context SSEU programming
>   *
> --
> 2.29.2
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
