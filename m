Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7D6AC3EA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 15:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6761D10E109;
	Mon,  6 Mar 2023 14:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B4010E109
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 14:51:57 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id y11so10637123plg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 06:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678114316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0Y9LfEsQikWSAiIDISu3D4c7Wwnrv6zc2XeGubCaSU=;
 b=oeQ/6OlPd9b4fiu+Ueael7UiUEWfTiLUczFOCcv5ilimmYDVvwMwPXyTQ0BlpBDpAe
 PUOLuLHJXQoAi27O7CzH/+NJrysTQCJTcQNTNk143dwfEUr0da7yg1CnCjjq2VroOwPT
 t2KNuLVblKjIvpm5Y4zXBSvPhAl7GDJXfyw/A5BQtavbdyx3K6Isx8Fu3OxmRa8ALpmn
 vvV61UmUexgfMMVLUlSb1Vb/9N5r0qA6d5Joh7SBN0sXqdiPwZ/viCL4Ai8nAKQazzhQ
 nU7CEtl4rRfYr6Y3//JEYbK7K0XQhAhk/HlD5yYABeSPET2G4su+02Aa3s00BZVCeZjD
 9+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0Y9LfEsQikWSAiIDISu3D4c7Wwnrv6zc2XeGubCaSU=;
 b=nd2M8f3CAhB3JhWzS3kEn4BeFTWaYs4r5mn+ajRjBlxGCVNdEJ3HwVOG5wIAkqvIjC
 m7RbeGNvZ6JtDp7a8Thy9xYfTznxWvDnKD6k3LLaj3kng6JK/2650Q6vclYyuL1e/kDc
 XXrwICrZ6itujup+PnDoHxOV+W4Yzpkqk7rc2rfAQ75YPcB/yXSMBGwcFnYVMeqGFzOy
 ma84yYP4zGheZTmfArr7iIXWtA3kMc4A4gntxiB0fDJzURKaUO/IYEzzAqu4rZQtXBSI
 P3SuGdmctIqYnOY57Kk1SX/tnFv9BboVaSAGVJl2NtWZ6DtFdjCzYsIsTyDEHYr32t3G
 qGqQ==
X-Gm-Message-State: AO0yUKUnSy0pHbtHc7SZpFVoqNf+CO9ssAI6UwFjpw/s132GpsTGNrbM
 YtjajgwCtVco2r14yhGWlRpNuqC5vbzWAKVj4XKS5O1i
X-Google-Smtp-Source: AK7set9cpnp5Qv3s1LcXhvXzAiSUcKTJzZdqg7ua+P2L7JQ/BFPjNsL/3IpY4eUTVkqjHtGophDn0p/aBqXYyL9F7Rk=
X-Received: by 2002:a17:903:281:b0:19a:fdca:e3f1 with SMTP id
 j1-20020a170903028100b0019afdcae3f1mr4548634plr.3.1678114316463; Mon, 06 Mar
 2023 06:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20230223121733.12549-1-tzimmermann@suse.de>
 <20230223121733.12549-6-tzimmermann@suse.de>
In-Reply-To: <20230223121733.12549-6-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 6 Mar 2023 15:51:45 +0100
Message-ID: <CAMeQTsZPKEB4srFtOVLB9ojJsgMmmxYVPCpp2Lf_WDejrd75-Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/gma500: Inline psbfb_create() into psbfb_probe()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 1:17=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Inline psbfb_create() into its only caller psbfb_probe(). Streamline
> the color-depth selection.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/fbdev.c | 65 ++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbde=
v.c
> index 2c511359a7c6..083233692c55 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -137,31 +137,49 @@ static const struct fb_ops psb_fbdev_ops =3D {
>   * struct drm_fb_helper_funcs
>   */
>
> -static int psbfb_create(struct drm_fb_helper *fb_helper,
> -                       struct drm_fb_helper_surface_size *sizes)
> +static int psbfb_probe(struct drm_fb_helper *fb_helper,

Should this now be psb_fbdev_probe() ?


> +                      struct drm_fb_helper_surface_size *sizes)
>  {
>         struct drm_device *dev =3D fb_helper->dev;
>         struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
>         struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>         struct fb_info *info;
>         struct drm_framebuffer *fb;
> -       struct drm_mode_fb_cmd2 mode_cmd;
> +       struct drm_mode_fb_cmd2 mode_cmd =3D { };
>         int size;
>         int ret;
>         struct psb_gem_object *backing;
>         struct drm_gem_object *obj;
>         u32 bpp, depth;
>
> -       mode_cmd.width =3D sizes->surface_width;
> -       mode_cmd.height =3D sizes->surface_height;
> +       /* No 24-bit packed mode */
> +       if (sizes->surface_bpp =3D=3D 24) {
> +               sizes->surface_bpp =3D 32;
> +               sizes->surface_depth =3D 24;
> +       }
>         bpp =3D sizes->surface_bpp;
>         depth =3D sizes->surface_depth;
>
> -       /* No 24bit packed */
> -       if (bpp =3D=3D 24)
> -               bpp =3D 32;
> +       /*
> +        * If the mode does not fit in 32 bit then switch to 16 bit to ge=
t
> +        * a console on full resolution. The X mode setting server will
> +        * allocate its own 32-bit GEM framebuffer.
> +        */
> +       size =3D ALIGN(sizes->surface_width * DIV_ROUND_UP(bpp, 8), 64) *
> +                    sizes->surface_height;
> +       size =3D ALIGN(size, PAGE_SIZE);
> +
> +       if (size > dev_priv->vram_stolen_size) {
> +               sizes->surface_bpp =3D 16;
> +               sizes->surface_depth =3D 16;
> +       }
> +       bpp =3D sizes->surface_bpp;
> +       depth =3D sizes->surface_depth;
>
> +       mode_cmd.width =3D sizes->surface_width;
> +       mode_cmd.height =3D sizes->surface_height;
>         mode_cmd.pitches[0] =3D ALIGN(mode_cmd.width * DIV_ROUND_UP(bpp, =
8), 64);
> +       mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(bpp, depth);
>
>         size =3D mode_cmd.pitches[0] * mode_cmd.height;
>         size =3D ALIGN(size, PAGE_SIZE);
> @@ -180,8 +198,6 @@ static int psbfb_create(struct drm_fb_helper *fb_help=
er,
>                 goto err_drm_gem_object_put;
>         }
>
> -       mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(bpp, depth);
> -
>         fb =3D psb_framebuffer_create(dev, &mode_cmd, obj);
>         if (IS_ERR(fb)) {
>                 ret =3D PTR_ERR(fb);
> @@ -217,35 +233,6 @@ static int psbfb_create(struct drm_fb_helper *fb_hel=
per,
>         return ret;
>  }
>
> -static int psbfb_probe(struct drm_fb_helper *fb_helper,
> -                               struct drm_fb_helper_surface_size *sizes)
> -{
> -       struct drm_device *dev =3D fb_helper->dev;
> -       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> -       unsigned int fb_size;
> -       int bytespp;
> -
> -       bytespp =3D sizes->surface_bpp / 8;
> -       if (bytespp =3D=3D 3)       /* no 24bit packed */
> -               bytespp =3D 4;
> -
> -       /*
> -        * If the mode will not fit in 32bit then switch to 16bit to get
> -        * a console on full resolution. The X mode setting server will
> -        * allocate its own 32bit GEM framebuffer
> -        */
> -       fb_size =3D ALIGN(sizes->surface_width * bytespp, 64) *
> -                 sizes->surface_height;
> -       fb_size =3D ALIGN(fb_size, PAGE_SIZE);
> -
> -       if (fb_size > dev_priv->vram_stolen_size) {
> -               sizes->surface_bpp =3D 16;
> -               sizes->surface_depth =3D 16;
> -       }
> -
> -       return psbfb_create(fb_helper, sizes);
> -}
> -
>  static const struct drm_fb_helper_funcs psb_fb_helper_funcs =3D {
>         .fb_probe =3D psbfb_probe,
>  };
> --
> 2.39.2
>
