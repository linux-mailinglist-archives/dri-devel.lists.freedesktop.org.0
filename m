Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4DBA86F1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 10:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470710E3CA;
	Mon, 29 Sep 2025 08:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TCBsStA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF78A10E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 08:42:47 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-30cce50dfb4so3755819fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759135367; x=1759740167; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0zDmiuAjQnd3YFVdPRcO8sxmuNMlpTgQ5OfVuUe4lk=;
 b=TCBsStA8JILSWFbQzmxSdGg0Jkt8MKIYDg2RvBWTUFz4HmU82Iey7HWhsNmhzDEG+E
 AOoXphtG3LMPIAs7ru/6KafPVKLw0C5yMr+5mC9RAbB4ljUP3tp0r9muqWafBxIDAb9Y
 9pHHkCaeaySy2p1u7SDi7shKDZP0VuK41ZlFfGzu0jUxnZoeEDtnPzO1QHMTEBmFkeJt
 bZ7lldXNrqn6RLs28pn6r9VXiK5CfytpJMXfaSX0FGxckzV3k1aub8LleBjVuADp/XBv
 nr4teREJPAUcuVwScHYE6cU63OQ81W+oGv5edk4v6nJPP/EM5uUeBKSTDLwaV2a0Z6jy
 QEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759135367; x=1759740167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0zDmiuAjQnd3YFVdPRcO8sxmuNMlpTgQ5OfVuUe4lk=;
 b=nGx4qXHyfuOod/KtyFzoNn7MwwAdnNARwlePILpwaQSb5DQSYWxXFyG03icyy+upKc
 kv4EE8CDkQO8h49GkKmIeEohAhekQXanOPPtt5i3iEgJl6/GcR9J1UVg0DSRMxbtUmMt
 Pv9t/7cXPnCa7H2nfKsy1Sb99s/SXDlBVjXOgbjBNtS3XXK3ovRmqkZNx5g9U4LoKrjg
 aN8DQlLmEbfnW8wytVUp9cgK90/0rllYPJDjSc+k006L25EPX/U1SLr3peHIqgBGyyxH
 HwdIAMTC/aIDSnWMYSQlC0RmFop8u5FejY+y1rAOWUfuyTvb7PILpZF8QQ4Zp0e4trjd
 xgdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMfZhxaXgfSe5UmvN3Jde/M28KNV882iHLOMbOUYDH9f/HoKztuFA45PsXJhk93nkO+Vfn1x6/YWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8TTvDuakhfeajrdsnvbBGl1QoW66f2UtE59KlrPFTkc1CV9AZ
 6jFXPDkNy8LAolfzx0mYO2h+lzGEmz7kWvQMY+3IP9MJIWvSZWafqsFmaeQlqZhGKbhwMHm3XRt
 MN1I/5/U2vPzMAvPrRz2LMxJDQ4bF2lk=
X-Gm-Gg: ASbGncvXOm8avE0cQRz0S9pQpHlRX3TCzEFfiU+LEacalzVnaJ0g+0S1/+UZ4cKZsya
 S9sQ49tKQPzfYBuJrNg8eWixhyj6hrXR43T5hGf9I6mYwcby4AEaIjkmnUtfxoxQ5oXjrDn0i8e
 gE35HJrmaxY1QaL8+v7kXQ1USZJwX3KuraeSJ7JhuyDhN3GXGOBZhS9DclvVl08wi0yFu5MUddS
 1Song==
X-Google-Smtp-Source: AGHT+IHU48TVMbZZ06BaX2FHhCjQJf/jbyynsWhPW3xkS0ZMHJ1S9oJLl04cYsCwruSXc+40zt/vYmmKqUSj/dJQZIs=
X-Received: by 2002:a05:6870:f62a:b0:34b:f75a:7d74 with SMTP id
 586e51a60fabf-35eeaa48c43mr7103886fac.42.1759135366721; Mon, 29 Sep 2025
 01:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250929082338.18845-1-tzimmermann@suse.de>
In-Reply-To: <20250929082338.18845-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 29 Sep 2025 10:42:35 +0200
X-Gm-Features: AS18NWDvrzOYI2jOMxfCt8yOHbOV5vo3frPYW5dz6_9F-IIi9v5mUjFhty28Tfc
Message-ID: <CAMeQTsYCoTY9Hmh_Ww-sBFvgQKnbDzLDSgF_yzmOXiyVuKG3BQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 Stefan Christ <contact@stefanchrist.eu>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org
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

On Mon, Sep 29, 2025 at 10:26=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Remove psb_fbdev_fb_setcolreg(), which hasn't been called in almost
> a decade.
>
> Gma500 commit 4d8d096e9ae8 ("gma500: introduce the framebuffer support
> code") added the helper psb_fbdev_fb_setcolreg() for setting the fbdev
> palette via fbdev's fb_setcolreg callback. Later
> commit 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for
> fb_ops") set several default helpers for fbdev emulation, including
> fb_setcmap.
>
> The fbdev subsystem always prefers fb_setcmap over fb_setcolreg. [1]
> Hence, the gma500 code is no longer in use and gma500 has been using
> drm_fb_helper_setcmap() for several years without issues.
>
> Fixes: 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for fb_op=
s")
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Stefan Christ <contact@stefanchrist.eu>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.10+
> Link: https://elixir.bootlin.com/linux/v6.16.9/source/drivers/video/fbdev=
/core/fbcmap.c#L246 # [1]
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/fbdev.c | 43 ----------------------------------
>  1 file changed, 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbde=
v.c
> index 32d31e5f5f1a..a6af21514cff 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -50,48 +50,6 @@ static const struct vm_operations_struct psb_fbdev_vm_=
ops =3D {
>   * struct fb_ops
>   */
>
> -#define CMAP_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_val)=
) >> 16)
> -
> -static int psb_fbdev_fb_setcolreg(unsigned int regno,
> -                                 unsigned int red, unsigned int green,
> -                                 unsigned int blue, unsigned int transp,
> -                                 struct fb_info *info)
> -{
> -       struct drm_fb_helper *fb_helper =3D info->par;
> -       struct drm_framebuffer *fb =3D fb_helper->fb;
> -       uint32_t v;
> -
> -       if (!fb)
> -               return -ENOMEM;
> -
> -       if (regno > 255)
> -               return 1;
> -
> -       red =3D CMAP_TOHW(red, info->var.red.length);
> -       blue =3D CMAP_TOHW(blue, info->var.blue.length);
> -       green =3D CMAP_TOHW(green, info->var.green.length);
> -       transp =3D CMAP_TOHW(transp, info->var.transp.length);
> -
> -       v =3D (red << info->var.red.offset) |
> -           (green << info->var.green.offset) |
> -           (blue << info->var.blue.offset) |
> -           (transp << info->var.transp.offset);
> -
> -       if (regno < 16) {
> -               switch (fb->format->cpp[0] * 8) {
> -               case 16:
> -                       ((uint32_t *) info->pseudo_palette)[regno] =3D v;
> -                       break;
> -               case 24:
> -               case 32:
> -                       ((uint32_t *) info->pseudo_palette)[regno] =3D v;
> -                       break;
> -               }
> -       }
> -
> -       return 0;
> -}
> -
>  static int psb_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct=
 *vma)
>  {
>         if (vma->vm_pgoff !=3D 0)
> @@ -135,7 +93,6 @@ static const struct fb_ops psb_fbdev_fb_ops =3D {
>         .owner =3D THIS_MODULE,
>         __FB_DEFAULT_IOMEM_OPS_RDWR,
>         DRM_FB_HELPER_DEFAULT_OPS,
> -       .fb_setcolreg =3D psb_fbdev_fb_setcolreg,
>         __FB_DEFAULT_IOMEM_OPS_DRAW,
>         .fb_mmap =3D psb_fbdev_fb_mmap,
>         .fb_destroy =3D psb_fbdev_fb_destroy,
> --
> 2.51.0
>
