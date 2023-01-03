Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC665C9C3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBED10E27C;
	Tue,  3 Jan 2023 22:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F2810E27C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 22:47:04 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-15027746720so23375278fac.13
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 14:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6mcl+WKAjzk5zc4+mR7CPDSs9L/Dp+acWM357LF0oA=;
 b=hV7t7oWIh5XtO6BL2LW5JZJHixj2rSd0UCmVlKf4ZDdP62/4jWTc/TxI8nDLE9+Swn
 RnxnqV88L4PS7vZpnwd1xBCYzw/LEiIKjxTbFFQnkvDjEhqHKr1Yn4afcLgWkfdDxMZs
 k+XCy5VTtiePY2nptg4vhhJu0XR5YhYdQJYtem1gKOeiXchwYlf111bQoWDOXKriC9wH
 kH+ifntJv+5k2rWyUeW21Z065+pHdtAZoDv6KfdVubBBGKocuQNUjjbTHDVtNbSsiT9q
 1LKEXxyvE3ozX+zeX5NsqGFXA9qTllvjy6GxdYWmhtgYfECoKvxgMO/TpAddSJjGI+XN
 SDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6mcl+WKAjzk5zc4+mR7CPDSs9L/Dp+acWM357LF0oA=;
 b=WYQ8Hyxu6LChbcDBU+pU0dhN/ZIY1Svdw9H3S7ZvW8/3LSBEOnPC9x2FfGzeUHI65u
 aXMebg2JH0fVrVeERFhvNp/DSKw8pNXwa+7ixWooGhxQM4mDl1YfTMB2b1x+Qkn/rofR
 QsA2n60vgnWTt2q+w4WGC+yVjtgdSc0F8S57Vhh3B20Cz124JOPWbCr9kWG4Zq6FLcN9
 rnWULf4zfPI09WTq+DJSoIsghsf62fsC47yo4LG0Z7Ze12LKS+ACsyEe060nR5PLHot0
 /PAFWtBAq5NLBFMEZERHbm0X/OWRx912ahIexsnZtGEr3H9WXmsUZgYZUusOfiBaauDX
 K4sw==
X-Gm-Message-State: AFqh2kr7lfNm44q3bTrFwwRzmC+i3Q6TDG3HFt5LcmYXge1h/hoHfvdp
 0dN0zEgeZZLzxYVIbItNZPzXZYSOl4zqk9ysNAv/5NJY
X-Google-Smtp-Source: AMrXdXvDINGHmQYgyjz92ipfk2To8P6XMulXhRSBR2luFN6oEUFfzuGuSXbd250RgOEV4NoqqMnUEk/OxBIJ1rr7Dk8=
X-Received: by 2002:a05:6870:4d14:b0:144:5f0d:9fcb with SMTP id
 pn20-20020a0568704d1400b001445f0d9fcbmr2461512oab.38.1672786023700; Tue, 03
 Jan 2023 14:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20230103125322.855089-1-mcanal@igalia.com>
In-Reply-To: <20230103125322.855089-1-mcanal@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 Jan 2023 14:46:50 -0800
Message-ID: <CAF6AEGt5g6+z3=LmTuP27pvbKYrL0YdLpDJCQmV=VHE6FeJ+Kg@mail.gmail.com>
Subject: Re: [PATCH] drm/gem: Check for valid formats
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drive-by thought/concern, what are the odds that there is some wayland
compositor out there that creates an fb for every window surface, even
if it later decides to composite on the GPU because the display does
not support the format?  It seems like there is a non-zero chance of
breaking userspace..

BR,
-R

On Tue, Jan 3, 2023 at 4:55 AM Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> Currently, drm_gem_fb_create() doesn't check if the pixel format is
> supported, which can lead to the acceptance of invalid pixel formats
> e.g. the acceptance of invalid modifiers. Therefore, add a check for
> valid formats on drm_gem_fb_create().
>
> Moreover, note that this check is only valid for atomic drivers,
> because, for non-atomic drivers, checking drm_any_plane_has_format() is
> not possible since the format list for the primary plane is fake, and
> we'd therefor reject valid formats.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  Documentation/gpu/todo.rst                   | 7 ++-----
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 9 +++++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 1f8a5ebe188e..68bdafa0284f 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -276,11 +276,8 @@ Various hold-ups:
>  - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the cu=
stom fb
>    setup code can't be deleted.
>
> -- Many drivers wrap drm_gem_fb_create() only to check for valid formats.=
 For
> -  atomic drivers we could check for valid formats by calling
> -  drm_plane_check_pixel_format() against all planes, and pass if any pla=
ne
> -  supports the format. For non-atomic that's not possible since like the=
 format
> -  list for the primary plane is fake and we'd therefor reject valid form=
ats.
> +- Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() chec=
ks for
> +  valid formats for atomic drivers.
>
>  - Many drivers subclass drm_framebuffer, we'd need a embedding compatibl=
e
>    version of the varios drm_gem_fb_create functions. Maybe called
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/d=
rm/drm_gem_framebuffer_helper.c
> index e93533b86037..b8a615a138cd 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>
>  #include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem.h>
> @@ -164,6 +165,14 @@ int drm_gem_fb_init_with_funcs(struct drm_device *de=
v,
>                 return -EINVAL;
>         }
>
> +       if (drm_drv_uses_atomic_modeset(dev) &&
> +           !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> +                                     mode_cmd->modifier[0])) {
> +               drm_dbg(dev, "Unsupported pixel format %p4cc / modifier 0=
x%llx\n",
> +                       &mode_cmd->pixel_format, mode_cmd->modifier[0]);
> +               return -EINVAL;
> +       }
> +
>         for (i =3D 0; i < info->num_planes; i++) {
>                 unsigned int width =3D mode_cmd->width / (i ? info->hsub =
: 1);
>                 unsigned int height =3D mode_cmd->height / (i ? info->vsu=
b : 1);
> --
> 2.38.1
>
