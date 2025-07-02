Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A47AF0AB8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 07:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CB210E6A6;
	Wed,  2 Jul 2025 05:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JqqgeJTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011CD10E309;
 Wed,  2 Jul 2025 05:28:12 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-2ea08399ec8so3635309fac.1; 
 Tue, 01 Jul 2025 22:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751434092; x=1752038892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ku/YUSwD6veusJANDTdI7XQ5HBiWgVAOu1aBi8VM6wo=;
 b=JqqgeJTvRDrnyrWTxJqBstt4dsQZ8XBez3Y4FD999B7HRWbNTv0r8z0KQUF648glkb
 abq9PibpR2zfB5Q2aCmahEjZIn5Zei8DQc4WJMm01ttUr/XWFfC+tRUAHEnfG4bp9T99
 p5wj9fegcX10v1z1tV8PoqbsMaCkhuZdsiUtBRYmZYlvRxiInCoBhrrrMCPZKdrsYqEx
 P8+JwvbUTHdM83qPX8QK0yfvM0ER4iISSqpb9xcpNfmXTbLFpyvHqWnU2yuOFzamVqOE
 SwrLq+CvMv/4/PzmXwqyzYz91GVxH9+fwslrc2dcm6C3YOoW33XKXKUKvHWTQj1vme5Y
 EHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751434092; x=1752038892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ku/YUSwD6veusJANDTdI7XQ5HBiWgVAOu1aBi8VM6wo=;
 b=ebA7V7eqLtbFqGaLfUutrsXGcgWENotFBdAwnQ4g++I8m9WfHk3x8kGKwowHiev3B2
 +ZzhqUxXBOx3OuZ5gRjt4Q/e0SuAzzpFbD6qne8j2xM/6MO2LXhq1I6odS6XVfnwcDGu
 Jc12hz9uiXK2qj6FYE5lPVuLfpLtdsLIAI5R1DCb0Sg8azp9voOAecd66xT5Jfay1NfD
 dzSMCXFfQDWFI8eFJSd5jLkBMZH+LwLDO+lByikPmRY32erRD6A+eY/wLJC8tbXrvJ8N
 8IqPvY8gLeB3PcwH/W9u3UqTyIeKcKGIxfZRhCm+7tMiqYFwCirFCsBUP69fmzDgqC5b
 2Q6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU98iyzs7XhUagRoQhB6Ggz2h5Ny1F08vgvq4xf7sJ4i+BJx5rgTP5fU+O1Q22tulMEAlGh01ycDKE=@lists.freedesktop.org,
 AJvYcCVnrcl8ifWzUuTTNIMcnkghZkflDqenX19TTKnQHxTlpqb6zA1Q3I7DMNgg3KVtlROR2SBByAMXaxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPASB+9VMO6GXda9iGcmXvqmpo6SHDfZcOzAW+PDEx+IZXfRXg
 q+u7UrmwWjK4vsN9fXE3VXH6LVISwc9SFJl3NUVc/EpXPuCpMZW9W+XKhjpKrgpcjsYFH2tWKaY
 G5eQN4Z5maytgNLFdyg5pQ4c7UEpEWpw=
X-Gm-Gg: ASbGncv/SugXcDAUUAMSsMEJ7UFBbssmXaJjisGaQs3eE8JuP2IQ8nk7CoQhZHge5kH
 52JJ2Z/R+1zHQ+EEISeHrfpD2VEH3suB9qPILkzFEZ00SuKhk9s7aIbZ79LH2XOi/Whjb4AJsyS
 kGOfJQGK6wir2su65DPm8MXQEmKg+QGUoVKBMIWsmwEmrofsoYohKJ
X-Google-Smtp-Source: AGHT+IGP3HL9dzO1+sRCXHLM5LV0Pz+1TYYAzX4Te0ZB2ZuhpgGNa4k3+1L5qWfRy7VREDmr1EcoJUfCjN6o2/RnPlU=
X-Received: by 2002:a05:6870:cd90:b0:2bc:7e72:2110 with SMTP id
 586e51a60fabf-2f5a8c4ed1emr996388fac.13.1751434091971; Tue, 01 Jul 2025
 22:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-13-ville.syrjala@linux.intel.com>
In-Reply-To: <20250701090722.13645-13-ville.syrjala@linux.intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 2 Jul 2025 07:28:00 +0200
X-Gm-Features: Ac12FXzGnGbYKFE2qIKkHtngtS3RMOUOgTbnWU4Z3aAk75eN4MlSMyKox9ohQTs
Message-ID: <CAMeQTsYR-EFs2_ZmUve0gNCWfoon=PjHPRZpOaHJJ60x2VZxfQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] drm/gma500: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 1, 2025 at 11:08=E2=80=AFAM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookup.
>
> For the fbdev case a manual drm_get_format_info() lookup
> is needed.
>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/fbdev.c       |  5 ++++-
>  drivers/gpu/drm/gma500/framebuffer.c | 14 +++++++-------
>  drivers/gpu/drm/gma500/psb_drv.h     |  1 +
>  3 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbde=
v.c
> index 8edefea2ef59..d32689cb0e23 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -203,7 +203,10 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helpe=
r *fb_helper,
>                 return PTR_ERR(backing);
>         obj =3D &backing->base;
>
> -       fb =3D psb_framebuffer_create(dev, &mode_cmd, obj);
> +       fb =3D psb_framebuffer_create(dev,
> +                                   drm_get_format_info(dev, mode_cmd.pix=
el_format,
> +                                                       mode_cmd.modifier=
[0]),
> +                                   &mode_cmd, obj);
>         if (IS_ERR(fb)) {
>                 ret =3D PTR_ERR(fb);
>                 goto err_drm_gem_object_put;
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma50=
0/framebuffer.c
> index f9ade8361354..e69b537ded6b 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -29,25 +29,23 @@ static const struct drm_framebuffer_funcs psb_fb_func=
s =3D {
>   */
>  static int psb_framebuffer_init(struct drm_device *dev,
>                                         struct drm_framebuffer *fb,
> +                                       const struct drm_format_info *inf=
o,
>                                         const struct drm_mode_fb_cmd2 *mo=
de_cmd,
>                                         struct drm_gem_object *obj)
>  {
> -       const struct drm_format_info *info;
>         int ret;
>
>         /*
>          * Reject unknown formats, YUV formats, and formats with more tha=
n
>          * 4 bytes per pixel.
>          */
> -       info =3D drm_get_format_info(dev, mode_cmd->pixel_format,
> -                                  mode_cmd->modifier[0]);
> -       if (!info || !info->depth || info->cpp[0] > 4)
> +       if (!info->depth || info->cpp[0] > 4)
>                 return -EINVAL;
>
>         if (mode_cmd->pitches[0] & 63)
>                 return -EINVAL;
>
> -       drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
> +       drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>         fb->obj[0] =3D obj;
>         ret =3D drm_framebuffer_init(dev, fb, &psb_fb_funcs);
>         if (ret) {
> @@ -60,6 +58,7 @@ static int psb_framebuffer_init(struct drm_device *dev,
>  /**
>   *     psb_framebuffer_create  -       create a framebuffer backed by gt
>   *     @dev: our DRM device
> + *     @info: pixel format information
>   *     @mode_cmd: the description of the requested mode
>   *     @obj: the backing object
>   *
> @@ -69,6 +68,7 @@ static int psb_framebuffer_init(struct drm_device *dev,
>   *     TODO: review object references
>   */
>  struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
> +                                              const struct drm_format_in=
fo *info,
>                                                const struct drm_mode_fb_c=
md2 *mode_cmd,
>                                                struct drm_gem_object *obj=
)
>  {
> @@ -79,7 +79,7 @@ struct drm_framebuffer *psb_framebuffer_create(struct d=
rm_device *dev,
>         if (!fb)
>                 return ERR_PTR(-ENOMEM);
>
> -       ret =3D psb_framebuffer_init(dev, fb, mode_cmd, obj);
> +       ret =3D psb_framebuffer_init(dev, fb, info, mode_cmd, obj);
>         if (ret) {
>                 kfree(fb);
>                 return ERR_PTR(ret);
> @@ -112,7 +112,7 @@ static struct drm_framebuffer *psb_user_framebuffer_c=
reate
>                 return ERR_PTR(-ENOENT);
>
>         /* Let the core code do all the work */
> -       fb =3D psb_framebuffer_create(dev, cmd, obj);
> +       fb =3D psb_framebuffer_create(dev, info, cmd, obj);
>         if (IS_ERR(fb))
>                 drm_gem_object_put(obj);
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/ps=
b_drv.h
> index 7f77cb2b2751..0b27112ec46f 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -594,6 +594,7 @@ extern void psb_modeset_cleanup(struct drm_device *de=
v);
>
>  /* framebuffer */
>  struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
> +                                              const struct drm_format_in=
fo *info,
>                                                const struct drm_mode_fb_c=
md2 *mode_cmd,
>                                                struct drm_gem_object *obj=
);
>
> --
> 2.49.0
>
