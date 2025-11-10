Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65914C451DD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 07:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D04610E049;
	Mon, 10 Nov 2025 06:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lm5OedKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D0E10E049
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 06:45:24 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-93515cb8c2bso1559805241.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Nov 2025 22:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762757123; x=1763361923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJ7LYF5rARcfLsBpxePOybR+1y8/o3ZLz4XlyN978+M=;
 b=lm5OedKfGW4fT5BlaaSuxGsm5oa7T8I4fzWLNU21e50d+U7unlePENb9XgBf+JppJr
 +fU4/Wqstr/QjudZWsewUbXfj8REX2O0fYa8sB+F/Nc8LQHljA3D0w2mH0Qvtg2gSiPu
 jNh5ATqFk2Ucuoi4S9yUQCxdpx1pvI2ln0iE9I53bBsBktzmVYe+f6/eNuigc1D8dLkK
 bbsjO73QduyyEBpU2Tex1iNpfCvHKR96hLThyvwM4R9U387p9YSqxNJcDslDhlcuwLum
 hUHLukoNwYSx69rzjVnf2BjdCce55AkiyfHiWnL6GKLYFQzPToWpbdKg1QRPAsQa1rvb
 ymPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762757123; x=1763361923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TJ7LYF5rARcfLsBpxePOybR+1y8/o3ZLz4XlyN978+M=;
 b=KveO6ezHOgR19E8NSsFktFwPik2Goc0c0w/VY6tBzJC1Bzd4NZ1vsBaxahyxvVEHW+
 5zIfEYkfN45pic6aF/U0ZcQS6wWHcmnTfr5jhTO0bvgBZPs2g0FvxVb6k4Lr6h0gWOfQ
 VG8nKP7qfWUD10PAlyHyLHXCX4teuXvhDNpsPpzvxh+aAzQ8eRkT0LHOwA4POOEYzY3r
 dZKxeXoU/OuLV3Z3ED5Re/4eLwAN9DL/Ca9qUARB3rWxRjsH0bQCo3dg0rtcI5n+BMkd
 eFa2d1MeQr4di8I2RQzugiyoPk/cjRmDi/YHq2qxYvH/a30+gwytv/buvsRCmYO6HHnW
 g2hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp4+64U3ZhVj4oWpN7bqYM+DKv89QFfAizHmSD/uY/djdw37mJ9TN2ADsSNc+eItsvwGfuq5fAaTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXe3giGcKFX34lpikp00C0UEvidfzi345dGuX6OJWwzHPrcmGi
 aG6HgZkDy4KdPKFGDtEVzNI1dOdjDAUXym2X+XvkQlgmaK2EohAl1469hLwYc27QeZvbXLPi2GN
 U3rDXfbIMz4l7TO4AOHcllzmDioJD1l4=
X-Gm-Gg: ASbGncvj+EDBET+70XqwS79iHdpnRSd4AipwX18yoO58iner6eMpenm3v1W1CnCLd9G
 WVi4xM6kekdaBCmCmNlijFivAH29YzB4h2Ob6dNLCxjI2s1bppk+aGFK1QMJE8sxq+I9fc/ARXq
 WSnhMjIQaPQKMPuINVMT+a/TapI2Ba0PCYVY9uB/e7doRA8xvgzowdrDpKsGL1W9Gin+/CmlrL5
 jrCZumpLq6piauBumWxpnrEqQT/m3Oi7B3HREZ87NjbMscS7RTgSsaYYTgrT2Sn3hRjgQ==
X-Google-Smtp-Source: AGHT+IF+gs9QIahGISXKJRHjGuXprvZlDgmBa+ZvpM71d+5sssU4cyVVLoFXELWcuPET2oDoTXg/lkyadapsy4GEvcw=
X-Received: by 2002:a05:6102:c51:b0:5dd:a69a:b935 with SMTP id
 ada2fe7eead31-5ddc468ea63mr2373148137.16.1762757123612; Sun, 09 Nov 2025
 22:45:23 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3@epcas2p4.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <20250929043110.3631025-4-hy_fifty.lee@samsung.com>
In-Reply-To: <20250929043110.3631025-4-hy_fifty.lee@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Nov 2025 15:44:46 +0900
X-Gm-Features: AWmQ_bnm9xQ99kNtPGcygx_UKQxpZ_ctsO76xXZQ0SPcCmu0BnofZ2Xoq2-JZF4
Message-ID: <CAAQKjZMDe-nXN14qQQTHR9HMwqCcbTospjMg_P98G0e=XAO5NQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/exynos: Move mode_config setup from fb.c to drv.c
To: Hoyoung Lee <hy_fifty.lee@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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

2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:29, H=
oyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Relocate exynos_drm_mode_config_init() and the mode_config funcs/helpers
> from exynos_drm_fb.c to exynos_drm_drv.c, and invoke
> drm_mode_config_init() from inside exynos_drm_mode_config_init().
>
> Rationale: resolve the historical fb.c placement, align with common DRM
> layering (mode_config is device-wide policy that belongs in the core
> driver), and make initialization order explicit before creating KMS
> objects and binding components.
>
> No functional change intended.

This patch looks fine to me.
However, since the second patch should be applied first, please repost
them as v2.

Thanks,
Inki Dae

>
> Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 47 ++++++++++++++++++++++---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c  | 34 ++----------------
>  drivers/gpu/drm/exynos/exynos_drm_fb.h  |  7 ++--
>  3 files changed, 49 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 1aea71778ab1..6362cd417a4e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -233,6 +233,43 @@ static struct component_match *exynos_drm_match_add(=
struct device *dev)
>         return match ?: ERR_PTR(-ENODEV);
>  }
>
> +static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helper=
s =3D {
> +       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs =
=3D {
> +       .fb_create =3D exynos_user_fb_create,
> +       .atomic_check =3D drm_atomic_helper_check,
> +       .atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static int exynos_drm_mode_config_init(struct drm_device *dev)
> +{
> +       int ret;
> +
> +       ret =3D drmm_mode_config_init(dev);
> +       if (ret)
> +               return ret;
> +
> +       dev->mode_config.min_width =3D 0;
> +       dev->mode_config.min_height =3D 0;
> +
> +       /*
> +        * set max width and height as default value(4096x4096).
> +        * this value would be used to check framebuffer size limitation
> +        * at drm_mode_addfb().
> +        */
> +       dev->mode_config.max_width =3D 4096;
> +       dev->mode_config.max_height =3D 4096;
> +
> +       dev->mode_config.funcs =3D &exynos_drm_mode_config_funcs;
> +       dev->mode_config.helper_private =3D &exynos_drm_mode_config_helpe=
rs;
> +
> +       dev->mode_config.normalize_zpos =3D true;
> +
> +       return 0;
> +}
> +
>  static int exynos_drm_bind(struct device *dev)
>  {
>         struct exynos_drm_private *private;
> @@ -257,9 +294,9 @@ static int exynos_drm_bind(struct device *dev)
>         dev_set_drvdata(dev, drm);
>         drm->dev_private =3D (void *)private;
>
> -       drmm_mode_config_init(drm);
> -
> -       exynos_drm_mode_config_init(drm);
> +       ret =3D exynos_drm_mode_config_init(drm);
> +       if (ret)
> +               goto err_free_private;
>
>         /* setup possible_clones. */
>         clone_mask =3D 0;
> @@ -272,7 +309,7 @@ static int exynos_drm_bind(struct device *dev)
>         /* Try to bind all sub drivers. */
>         ret =3D component_bind_all(drm->dev, drm);
>         if (ret)
> -               goto err_mode_config_cleanup;
> +               goto err_free_private;
>
>         ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
>         if (ret)
> @@ -296,7 +333,7 @@ static int exynos_drm_bind(struct device *dev)
>         drm_kms_helper_poll_fini(drm);
>  err_unbind_all:
>         component_unbind_all(drm->dev, drm);
> -err_mode_config_cleanup:
> +err_free_private:
>         exynos_drm_cleanup_dma(drm);
>         kfree(private);
>         dev_set_drvdata(dev, NULL);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exy=
nos/exynos_drm_fb.c
> index ddd73e7f26a3..c118a079d308 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -8,8 +8,7 @@
>   *     Seung-Woo Kim <sw0312.kim@samsung.com>
>   */
>
> -#include <drm/drm_atomic.h>
> -#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_modeset_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_fourcc.h>
> @@ -93,7 +92,7 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
>         return ERR_PTR(ret);
>  }
>
> -static struct drm_framebuffer *
> +struct drm_framebuffer *
>  exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv=
,
>                       const struct drm_format_info *info,
>                       const struct drm_mode_fb_cmd2 *mode_cmd)
> @@ -150,32 +149,3 @@ dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebu=
ffer *fb, int index)
>         exynos_gem =3D to_exynos_gem(fb->obj[index]);
>         return exynos_gem->dma_addr + fb->offsets[index];
>  }
> -
> -static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helper=
s =3D {
> -       .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> -};
> -
> -static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs =
=3D {
> -       .fb_create =3D exynos_user_fb_create,
> -       .atomic_check =3D drm_atomic_helper_check,
> -       .atomic_commit =3D drm_atomic_helper_commit,
> -};
> -
> -void exynos_drm_mode_config_init(struct drm_device *dev)
> -{
> -       dev->mode_config.min_width =3D 0;
> -       dev->mode_config.min_height =3D 0;
> -
> -       /*
> -        * set max width and height as default value(4096x4096).
> -        * this value would be used to check framebuffer size limitation
> -        * at drm_mode_addfb().
> -        */
> -       dev->mode_config.max_width =3D 4096;
> -       dev->mode_config.max_height =3D 4096;
> -
> -       dev->mode_config.funcs =3D &exynos_drm_mode_config_funcs;
> -       dev->mode_config.helper_private =3D &exynos_drm_mode_config_helpe=
rs;
> -
> -       dev->mode_config.normalize_zpos =3D true;
> -}
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exy=
nos/exynos_drm_fb.h
> index fdc6cb40cc9c..0c79ce5d4a8d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
> @@ -19,8 +19,11 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
>                             struct exynos_drm_gem **exynos_gem,
>                             int count);
>
> -dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)=
;
> +struct drm_framebuffer *
> +exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv=
,
> +                     const struct drm_format_info *info,
> +                     const struct drm_mode_fb_cmd2 *mode_cmd);
>
> -void exynos_drm_mode_config_init(struct drm_device *dev);
> +dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)=
;
>
>  #endif
> --
> 2.34.1
>
>
