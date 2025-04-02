Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F160A78BC5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E703810E730;
	Wed,  2 Apr 2025 10:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IdlW/s+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E2710E72E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:14:50 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3031354f134so8539703a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743588889; x=1744193689;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lw7No9CatrhunZQ4Ziy751N/t8utTcZj0hKQTdSN9jk=;
 b=IdlW/s+rx+VHXgT8QxJ31rVOcHwUs0YYxJ9VP9q3fxy8YJ+q3Uyd4VuNa+JIQbpJO8
 HVkV25nK8d1TmY3RqqkKIXMsXL5zhVD7V7ULjhirn+nYwh4f8SShUTV2sHwc87JDbZ6D
 Lm9N5zm76/LIlhQb2w++l7O3yullZjGdjqDTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743588889; x=1744193689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lw7No9CatrhunZQ4Ziy751N/t8utTcZj0hKQTdSN9jk=;
 b=lviP3RL1BJAx22LBuSe7k4W/RAn/qOOwQOA9v2UFXASqteICcdN0+/aODCpvVlAX8R
 kB7HqdaPNRg4w1NdTKPbVZc7eXEwCsKDaytIb/RR032eVnNOKXg3E+aKy1IXDpQ44rB0
 TFreQwQVQ+bewJKmawo1ZAmErbWnt0gbwdL9eKLJd8+U9ciAu6AtQCBK5ge8MrwDqi3m
 lezxwtbcSLg+KdQgUcwTgCXz9RukJi5CWuOVuC8BLSgHeoyEYVjLZxbSe6i9750Oheg+
 JqP6Wh7bDLWFEHEX3lz3bsAZ3yR8amkGbCLVNqQe8rS7Fp2kyzNJ6QCGrBH0x8uFvcaH
 6zag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa7dWWBz7aEMIhQXz5k2dxz0vaC69Sx9eI7F293+C2begjpYx32bpoLeL3WfDLKxIApE2v/UrpoB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkeTNI5oL3MxMxBR2Ce3ix1T+wAf3PHeIwdxANiLRTy9hYLGhZ
 xDkt18n3CU1TQKX8MIIc8qW7eUyGsUiQqYKW1f5ICMbWaa6SLelRf+UzA8/BAkDaIaUnHOsDPbe
 dug6q8ZAhsHbHrxKnI5UboZ1xTV9YPKFbzqyB
X-Gm-Gg: ASbGncsrhpRHobxeku2NltIavTiOflbDkJ8k+U8DARFJnvROQ+4PAY5NY/tDdKlAJPw
 CyuNPK/KBDnzSrrHcxXYpSUFE4iHUynkyLzTp5dh8f1a8+G4TrGgWtI1dJq5FXH+gDdUWCWm/Eg
 Q8mgmDWFpGxo3n4geX7spjm7N/PwZ8uteTf6UoSfT3fGkcQkrbh0Yn
X-Google-Smtp-Source: AGHT+IH4KbDIAmz8gZLfVjOiL+nuNvvi6uk1SQsIGj72ELmQEPT6v+Qk+JdsGhfa3B8h399dfK9zguZ+jHJ7xZMou58=
X-Received: by 2002:a17:90a:d2ce:b0:2ff:5a9d:9390 with SMTP id
 98e67ed59e1d1-30531f957a3mr24885869a91.8.1743588889523; Wed, 02 Apr 2025
 03:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
 <20250402083628.20111-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:14:36 +0800
X-Gm-Features: AQ5f1Jooc0a6tL_Gl6htqIUeZsyBaGUQis_xndlOKQ_9u_xfpEMy_zMefycOXDw
Message-ID: <CAGXv+5HUJUL342uMA7wjmm8TsBUveVa0i8k+BfB2aZXd--AoKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] drm/mediatek: mtk_drm_drv: Fix kobject put for
 mtk_mutex device ptr
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
 ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
 bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
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

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This driver is taking a kobject for mtk_mutex only once per mmsys
> device for each drm-mediatek driver instance, differently from the
> behavior with other components, but it is decrementing the kobj's
> refcount in a loop and once per mmsys: this is not right and will
> result in a refcount_t underflow warning when mediatek-drm returns
> multiple probe deferrals in one boot (or when manually bound and
> unbound).
>
> Besides that, the refcount for mutex_dev was not decremented for
> error cases in mtk_drm_bind(), causing another refcount_t warning
> but this time for overflow, when the failure happens not during
> driver bind but during component bind.
>
> In order to fix one of the reasons why this is happening, remove
> the put_device(xx->mutex_dev) loop from the mtk_drm_kms_init()'s
> put_mutex_dev label (and drop the label) and add a single call to
> correctly free the single incremented refcount of mutex_dev to
> the mtk_drm_unbind() function to fix the refcount_t underflow.
>
> Moreover, add the same call to the error cases in mtk_drm_bind()
> to fix the refcount_t overflow.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index e09578756de0..a8fbccb50c74 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -464,7 +464,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>
>         ret =3D drmm_mode_config_init(drm);
>         if (ret)
> -               goto put_mutex_dev;
> +               return ret;
>
>         drm->mode_config.min_width =3D 64;
>         drm->mode_config.min_height =3D 64;
> @@ -483,7 +483,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                 drm->dev_private =3D private->all_drm_private[i];
>                 ret =3D component_bind_all(private->all_drm_private[i]->d=
ev, drm);
>                 if (ret)
> -                       goto put_mutex_dev;
> +                       return ret;
>         }
>
>         /*
> @@ -576,9 +576,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>  err_component_unbind:
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 component_unbind_all(private->all_drm_private[i]->dev, dr=
m);
> -put_mutex_dev:
> -       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> -               put_device(private->all_drm_private[i]->mutex_dev);
>
>         return ret;
>  }
> @@ -649,8 +646,10 @@ static int mtk_drm_bind(struct device *dev)
>                 return 0;
>
>         drm =3D drm_dev_alloc(&mtk_drm_driver, dev);
> -       if (IS_ERR(drm))
> -               return PTR_ERR(drm);
> +       if (IS_ERR(drm)) {
> +               ret =3D PTR_ERR(drm);
> +               goto err_put_dev;
> +       }
>
>         private->drm_master =3D true;
>         drm->dev_private =3D private;
> @@ -676,6 +675,8 @@ static int mtk_drm_bind(struct device *dev)
>         drm_dev_put(drm);
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->drm =3D NULL;
> +err_put_dev:
> +       put_device(private->mutex_dev);
>         return ret;
>  }
>
> @@ -688,6 +689,8 @@ static void mtk_drm_unbind(struct device *dev)
>                 drm_dev_unregister(private->drm);
>                 mtk_drm_kms_deinit(private->drm);
>                 drm_dev_put(private->drm);
> +
> +               put_device(private->mutex_dev);
>         }
>         private->mtk_drm_bound =3D false;
>         private->drm_master =3D false;
> --
> 2.48.1
>
