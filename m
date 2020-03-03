Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A03177C3A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 17:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE026E0F0;
	Tue,  3 Mar 2020 16:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599CE6E0F0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 16:46:24 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id r18so2824113vso.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 08:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jGMdUjCq8R4qBnE1RypshC1fOghsE0hgkV82lXmBhgA=;
 b=oyFoBD6UfdW3/4QwmRDLV6/7AQL8IvPPi4cfJ3omNboLG8FNgUriecpVqJAy5aqAWD
 Xr+Gye29M8/cMep5Nj6ebMBMTvTYuYb/j6VqKQ3KJz9v2KDUYcQoCbvjGKU1sShp0ioa
 3NT0VZoA0vE94/V1SMmFyFg9gNCSh4GDTkCWug987ImwVVPJ1uTaZ6PL7v6wRqsLyCo/
 2j8f9dly/mDle/vfn2OeiBw5RO0mMiB2qpdv4ZO95xUSBEOOIivJeikEnz9JOEypOhM1
 B8qvrxvN0awGCIJhRJ8Z/vebnppD/xjZR108ZNbpGexX5WhpE12YjM+Y7hJoS1PyS9Op
 vxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jGMdUjCq8R4qBnE1RypshC1fOghsE0hgkV82lXmBhgA=;
 b=MenVX70sxeCN+ioUSaxV2OfxtJebYx7A/nEAWeem9FykMMIHidhnxsf8OUsvvGltC3
 5eRD8EJFUjXkh44KWrtrNCdESJwal+nYx689tMjRk3LNyjubmxe4PtzqgxuiwhgQ+Scu
 0Z2fqd0tfTmB+PuoIL09XJjQQLi9whKQId2iLEkiqX1RMbnsEApt1ky+6/nzSj9uQESU
 nC6dfnSTkb6280UvQHhp0sW5A+Mm56BOfx4CE2L+d52jpqwZZYoGYJRj175tWuOKiTx3
 Ovy5yVZ5NHUGS7kpA2WUNFOX4GLO4W/xpT4hD/4mvCJoD1IT9xPi0kENpf/N8LUa4tcx
 r1lg==
X-Gm-Message-State: ANhLgQ1Vv6fGeNR9iEkcfdaLWffC1C30T20fkY82IR3I1hVq2YsScsEl
 3MKGDcjvUwlXVYLZTGL3MhJ+fjn0lMhLiSORWig=
X-Google-Smtp-Source: ADFU+vtLGiUkS0lRZdMmraE16KSzLpiAtz0mHgo6n+jMNi5hH5sfza0IXm+Zb4sFeB4pIiTsXQUP3+J2Q86xhkXw7mA=
X-Received: by 2002:a05:6102:9c7:: with SMTP id
 g7mr2962023vsi.186.1583253983398; 
 Tue, 03 Mar 2020 08:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20200303120136.18294-1-andrzej.p@collabora.com>
 <20200303120136.18294-3-andrzej.p@collabora.com>
In-Reply-To: <20200303120136.18294-3-andrzej.p@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 3 Mar 2020 16:45:51 +0000
Message-ID: <CACvgo51Me=NPykuBpd6=A1rMCO2mHQCToCS4d2dkQG3UAaLkJw@mail.gmail.com>
Subject: Re: [PATCHv6 2/6] drm/core: Add drm_afbc_framebuffer and a
 corresponding helper
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Tue, 3 Mar 2020 at 12:01, Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> The new struct contains afbc-specific data.
>
> The new function can be used by drivers which support afbc to complete
> the preparation of struct drm_afbc_framebuffer. It must be called after
> allocating the said struct and calling drm_gem_fb_init_with_funcs().
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 121 +++++++++++++++++++
>  include/drm/drm_framebuffer.h                |  45 +++++++
>  include/drm/drm_gem_framebuffer_helper.h     |  11 ++
>  3 files changed, 177 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 388a080cd2df..2a30f5b6829f 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -21,6 +21,13 @@
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>
> +#define AFBC_HEADER_SIZE               16
> +#define AFBC_TH_LAYOUT_ALIGNMENT       8
> +#define AFBC_HDR_ALIGN                 64
> +#define AFBC_SUPERBLOCK_PIXELS         256
> +#define AFBC_SUPERBLOCK_ALIGNMENT      128
> +#define AFBC_TH_BODY_START_ALIGNMENT   4096
> +
>  /**
>   * DOC: overview
>   *
> @@ -302,6 +309,120 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>
> +/**
> + * drm_afbc_get_superblock_wh - extract afbc block width/height from modifier
> + * @modifier: the modifier to be looked at
> + * @w: address of a place to store the block width
> + * @h: address of a place to store the block height
> + *
> + * Returns: true if the modifier describes a supported block size
> + */
> +bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h)
> +{
> +       switch (modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
> +       case AFBC_FORMAT_MOD_BLOCK_SIZE_16x16:
> +               *w = 16;
> +               *h = 16;
> +               break;
> +       case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8:
> +               *w = 32;
> +               *h = 8;
> +               break;
> +       /* no user exists yet - fall through */
> +       case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
> +       case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
> +       default:
> +               DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
> +                             modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
> +               return false;
> +       }
> +       return true;
> +}
> +EXPORT_SYMBOL_GPL(drm_afbc_get_superblock_wh);
> +
> +static int drm_gem_afbc_min_size(struct drm_device *dev,
> +                                const struct drm_mode_fb_cmd2 *mode_cmd,
> +                                struct drm_afbc_framebuffer *afbc_fb)
> +{
> +       const struct drm_format_info *info;
> +       u32 n_blocks, w_alignment, h_alignment, hdr_alignment;
> +       u32 tmp_bpp; /* remove when all users properly encode cpp in drm_format_info */
> +
> +       if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &afbc_fb->block_width, &afbc_fb->block_height))
> +               return -EINVAL;
> +
> +       /* tiled header afbc */
> +       w_alignment = afbc_fb->block_width;
> +       h_alignment = afbc_fb->block_height;
> +       hdr_alignment = AFBC_HDR_ALIGN;
> +       if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
> +               w_alignment *= AFBC_TH_LAYOUT_ALIGNMENT;
> +               h_alignment *= AFBC_TH_LAYOUT_ALIGNMENT;
> +               hdr_alignment = AFBC_TH_BODY_START_ALIGNMENT;
> +       }
> +
> +       afbc_fb->aligned_width = ALIGN(mode_cmd->width, w_alignment);
> +       afbc_fb->aligned_height = ALIGN(mode_cmd->height, h_alignment);
> +       afbc_fb->offset = mode_cmd->offsets[0];
> +
> +       /* Change to always using info->cpp[0] when all users properly encode it */
> +       info = drm_get_format_info(dev, mode_cmd);
> +       tmp_bpp = info->cpp[0] ? info->cpp[0] * 8 : afbc_fb->bpp;
> +
> +       n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height) / AFBC_SUPERBLOCK_PIXELS;
> +       afbc_fb->afbc_size = ALIGN(n_blocks * AFBC_HEADER_SIZE, hdr_alignment);
> +       afbc_fb->afbc_size += n_blocks * ALIGN(tmp_bpp * AFBC_SUPERBLOCK_PIXELS / 8, AFBC_SUPERBLOCK_ALIGNMENT);
> +
> +       return 0;
> +}
> +
> +/**
> + * drm_gem_fb_afbc_init() - Helper function for drivers using afbc to
> + *                         fill and validate all the afbc-specific
> + *                         struct drm_afbc_framebuffer members
> + *
> + * @dev: DRM device
> + * @afbc_fb: afbc-specific framebuffer
> + * @mode_cmd: Metadata from the userspace framebuffer creation request
> + * @afbc_fb: afbc framebuffer
> + *
> + * This function can be used by drivers which support afbc to complete
> + * the preparation of struct drm_afbc_framebuffer. It must be called after
> + * allocating the said struct and calling drm_gem_fb_init_with_funcs().
> + *
> + * Returns:
> + * Zero on success or a negative error value on failure.
> + */
> +int drm_gem_fb_afbc_init(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
> +                        struct drm_afbc_framebuffer *afbc_fb)
> +{
> +       const struct drm_format_info *info;
> +       struct drm_gem_object **objs;
> +       int ret = -EINVAL, i;
> +
> +       objs = afbc_fb->base.obj;
> +       info = drm_get_format_info(dev, mode_cmd);
> +       if (!info)
> +               goto error;
> +
> +       ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc_fb);
> +       if (ret < 0)
> +               goto error;
> +
> +       if (objs[0]->size < afbc_fb->afbc_size) {
> +               ret = -EINVAL;
> +               goto error;
> +       }
> +
> +       return 0;
> +
> +error:
> +       for (i = 0; i < info->num_planes; i++)
> +               drm_gem_object_put_unlocked(objs[i]);
> +
Here we put and object we did not get. This type of asymmetric API
usage isn't common, thus it's fairly fragile.
Let's leave the put in the caller.

> +       return ret;
> +}
> +
>  /**
>   * drm_gem_fb_prepare_fb() - Prepare a GEM backed framebuffer
>   * @plane: Plane
> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
> index c0e0256e3e98..e9f1b0e2968d 100644
> --- a/include/drm/drm_framebuffer.h
> +++ b/include/drm/drm_framebuffer.h
> @@ -297,4 +297,49 @@ int drm_framebuffer_plane_width(int width,
>  int drm_framebuffer_plane_height(int height,
>                                  const struct drm_framebuffer *fb, int plane);
>
> +/**
> + * struct drm_afbc_framebuffer - a special afbc frame buffer object
> + *
> + * A derived class of struct drm_framebuffer, dedicated for afbc use cases.
> + */
> +struct drm_afbc_framebuffer {
> +       /**
> +        * @base: base framebuffer structure.
> +        */
> +       struct drm_framebuffer base;
> +       /**
> +        * @block_widht: width of a single afbc block
> +        */
> +       u32 block_width;
> +       /**
> +        * @block_widht: height of a single afbc block
> +        */
> +       u32 block_height;
> +       /**
> +        * @aligned_width: aligned frame buffer width
> +        */
> +       u32 aligned_width;
> +       /**
> +        * @aligned_height: aligned frame buffer height
> +        */
> +       u32 aligned_height;
> +       /**
> +        * @offset: offset of the first afbc header
> +        */
> +       u32 offset;
> +       /**
> +        * @afbc_size: minimum size of afbc buffer
> +        */
> +       u32 afbc_size;
> +       /**
> +        * @bpp: bpp value for this afbc buffer
> +        * To be removed when users such as malidp
> +        * properly store the cpp in drm_format_info.
> +        * New users should not start using this field.
> +        */
Are you planning to look into this? Alternatively let's add an entry
in Documentation/gpu/todo.rst.

Nit: Line wrap the newly introduced code to 80 columns.
IIRC scripts/checkpatch.pl will complain loudly about it.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
