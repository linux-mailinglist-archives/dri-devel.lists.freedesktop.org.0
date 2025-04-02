Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58818A78BCE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9818110E739;
	Wed,  2 Apr 2025 10:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kyHne2d6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ACD10E739
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:18:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-30362ee1312so11538024a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743589135; x=1744193935;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0D56V4bGfpX/TU9e5gmFluYXKUdNZrEsrQeh3MS0+Bo=;
 b=kyHne2d6e+aFuoAG9nkPqHQqPh8LU0+D15i/SSOv49loFV3/cI+/jVfNfH5VuTev0M
 anLfq8/0rlMelYP02owR601lwtx4NO4TSID6Y7TnnNiKAiU9177044R7A6PrDnvMAMyp
 0aDDCD2PsiXWrNsEGcFnAlmdcGfqSh3C83ZdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743589135; x=1744193935;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0D56V4bGfpX/TU9e5gmFluYXKUdNZrEsrQeh3MS0+Bo=;
 b=OhOI8sB0jMC8vblzr5NVpsji7I/tR5xhl9dsz/OXwUuULSWoos2D01o1IHhK/yUxvp
 5I7CXbz0mm2dh0sDIa+mgikJG2e82tinW24ywkhU12CvkTr2cK95PrAqdszDVcA6H+2O
 +fyOWUyb5FDCnMq4LcPsmh0y0V5D3Oa1H+++kq7kNNtOMRII5WvNAcHCDGXScg7IT5cg
 Knt8QGJ6gDCaNkEfqn/wEosxJ+J1M38z2EgRtiDHO8+WygzJ/8e2G6vll/8JC3QWC76W
 xLyWe3uESUOf5q19NvBWVOU7u9hY5CWqaCSQT/6mjhBUfx8i1i9Zvb7Ca+krN2xRBsXG
 cU9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9NXjbFdalhXrEgbKqvnDS72FpecC/cxp2VshPZZfGqktnSzYrQZYe/ui1RsFiP4JKXoGpaG27Leg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoGI1ylV5FPO8hinac4KpSDm1szC9O0ggUZ8HIJI2d8D8sm+Jb
 ai2TB9gdWYNhrL8+NSnAyVR3OF07W08VNegDmy8Gs5lqgQV7wTt9NJKWFNh8xujr+eMtACFCGzH
 y8925TBGH91EHLGcFYOIgI9z+jXkt9lCnChBK
X-Gm-Gg: ASbGncsvsorWlLTyWVuY2Mg7WiYl6jVkhW9xmcUr8LFH5m7HOzgo4SXKPIflyFv9d2M
 ZQ3iOGM00oE7dmoX+MEzIv1W38rrIRnDTdJ/Tl3xeLEaZSlv6P+0wxnHxXYg90lIiAl9SeVB/pF
 q6g+NUWlfEpN9aRdQUNCPVT9Kn3zCFoN+E5bMg7AjqqUz+5KEF4wVV
X-Google-Smtp-Source: AGHT+IGQrnkGyKn8dVTSUjKIJxy2/wcmbcJv3W5smbWJ2t/E7cpQH6SMGOxQZ5dG0vuNvno9IYMLbv3UhEax8FtatNA=
X-Received: by 2002:a17:90a:c88b:b0:2ff:7c2d:6ff3 with SMTP id
 98e67ed59e1d1-3056ef48b43mr2719742a91.35.1743589134726; Wed, 02 Apr 2025
 03:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
 <20250402083628.20111-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:18:41 +0800
X-Gm-Features: AQ5f1Jr3BoD2em-LznhL9zgkOSxDEEueTpI7DlFY2HYoRHnyStO_tGh8xaXUAvA
Message-ID: <CAGXv+5GsoHN5mVe_kEP+oAzxa9HqgfhoiDqvO3xiQurFrvQ3qA@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] drm/mediatek: Fix kobject put for component
 sub-drivers
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
> In function mtk_drm_get_all_priv(), this driver is incrementing

              ^ mtk_drm_get_all_drm_priv()

> the refcount for the sub-drivers of mediatek-drm with a call to
> device_find_child() when taking a reference to all of those child
> devices.

Looking closer, that function is also missing a platform_device_put()
to match of_find_device_by_node().

> When the component bind fails multiple times this results in a
> refcount_t overflow, as the reference count is never decremented:
> fix that by adding a call to put_device() for all of the mmsys
> devices in a loop, in error cases of mtk_drm_bind() and in the
> mtk_drm_unbind() callback.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a8fbccb50c74..6b31df587507 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -676,6 +676,10 @@ static int mtk_drm_bind(struct device *dev)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->drm =3D NULL;
>  err_put_dev:
> +       for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
> +               /* For device_find_child in mtk_drm_get_all_priv() */
> +               put_device(private->all_drm_private[i]->dev);
> +       }
>         put_device(private->mutex_dev);
>         return ret;
>  }
> @@ -683,6 +687,7 @@ static int mtk_drm_bind(struct device *dev)
>  static void mtk_drm_unbind(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> +       int i;
>
>         /* for multi mmsys dev, unregister drm dev in mmsys master */
>         if (private->drm_master) {
> @@ -690,6 +695,10 @@ static void mtk_drm_unbind(struct device *dev)
>                 mtk_drm_kms_deinit(private->drm);
>                 drm_dev_put(private->drm);
>
> +               for (i =3D 0; i < private->data->mmsys_dev_num; i++) {

Just FYI you can also declare the int within the for statement.

ChenYu

> +                       /* For device_find_child in mtk_drm_get_all_priv(=
) */
> +                       put_device(private->all_drm_private[i]->dev);
> +               }
>                 put_device(private->mutex_dev);
>         }
>         private->mtk_drm_bound =3D false;
> --
> 2.48.1
>
