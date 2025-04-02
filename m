Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D26DA78BD3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A2E892A6;
	Wed,  2 Apr 2025 10:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Zh1+QRWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7777410E72E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:19:39 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-301302a328bso11202893a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743589179; x=1744193979;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=;
 b=Zh1+QRWByfGcRMDreWPnozV7YhM9uqAbpEvp9jKGzxOEHIed/R33XYcUfJMo/y4m5n
 HYNk/VK1/7C6Idzl5upOa3ygdxZ78QjF/q7RIOFD/5XUjoay5AVZEvvmlAQo5SoFN8Tr
 Qpy3dzxXUSjyJPCLxIVm1FF4ACv2BlxJfojzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743589179; x=1744193979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=;
 b=c1BFwAda9q2xO4Tfd7qwhcHNMuL3/tYGI5XE5C22EpGlsnVPNnEbJyhsqD9KDq2pNt
 2APKg5SZgg0TtrtBRf3ib135A5/4keruaNtJ9nEgHnSR5eG8zT+Z3VHo1qlJz7MAG2/D
 XJDxz4PiiP/XLUs7VIZXNyBTdCm/zalGmlOcd4uckwEW1cQfVTuc/flVPvmoCx0EJCN/
 XlhIMNZCZZ4VvfT4W08IAb42MpjmayvnSoemzZLZTjrI7Y2oNPv3qwawh9AAJiuB/Lfe
 LBJSgL5pdFHC+Wp00jceccllUEo7LOxnAvHJPs8IhFJt9sC4gC67E9I8tkco3YwYESs0
 gzBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvdDfVmeFqhuDCVKu+AdAd4HTqdldZLOz1vyy/7yJf31hHIvvTvCy5pzIgU2aZZC765YO8DxhWCGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGCeCAnRGjcWNGH0ZzH3ScuX1H6lAM05OqffSVMRZBxtqmRVrA
 HPlTDrou+USBJSN9fGUax0sLHDyoCFEcrgldBiQT6MF1jjWL/8jix8qGRbVQAl0HHtFrOX3g6H0
 yjxIZn9s1Dy6OUMRNqV4G9mSnZg0PkBDBRI1V
X-Gm-Gg: ASbGncsnhVjeDQPyrSF5iu15SRHJiq144JQVuxAOc/dRk9965y4Ip1QBsJFzlzSxSIT
 rKZdqVMVtX6H6sEkNjrbVv2NOKXCBiIgS5WlFUccDnjc6V7KWTF4KYKWimhyploBBquY02AE9Hw
 X0Op7c8FX+2RajBrTj/2jE1trDWAs45M/2NPSsVkZlypWIQXYc0rhn
X-Google-Smtp-Source: AGHT+IFc/gdat5Dr87A+81uJRFZWgnUw8FjScnpjhEXBVgVwotYa3CxXqBYBb5s66JTrRULG7QmLlhlnerHeo7QspTI=
X-Received: by 2002:a17:90b:3b50:b0:301:1bce:c258 with SMTP id
 98e67ed59e1d1-3053215e7femr19031005a91.22.1743589179070; Wed, 02 Apr 2025
 03:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
 <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:19:24 +0800
X-Gm-Features: AQ5f1Jr24z9TQrfYXn99ssRwXfkIHJUxBLD8IHIrUHUVmb0Bwvezsgoy_EISkMk
Message-ID: <CAGXv+5H1aww6Adf=EKCkpC8oCkdRLEHP5_fwtfU1BzEsnyi7NA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] drm/mediatek: mtk_drm_drv: Unbind secondary mmsys
 components on err
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
> When calling component_bind_all(), if a component that is included
> in the list fails, all of those that have been successfully bound
> will be unbound, but this driver has two components lists for two
> actual devices, as in, each mmsys instance has its own components
> list.
>
> In case mmsys0 (or actually vdosys0) is able to bind all of its
> components, but the secondary one fails, all of the components of
> the first are kept bound, while the ones of mmsys1/vdosys1 are
> correctly cleaned up.
>
> This is not right because, in case of a failure, the components
> are re-bound for all of the mmsys/vdosys instances without caring
> about the ones that were previously left in a bound state.
>
> Fix that by calling component_unbind_all() on all of the previous
> component masters that succeeded binding all subdevices when any
> of the other masters errors out.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Makes sense.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6b31df587507..2d6562b29755 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -482,8 +482,11 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
>                 drm->dev_private =3D private->all_drm_private[i];
>                 ret =3D component_bind_all(private->all_drm_private[i]->d=
ev, drm);
> -               if (ret)
> +               if (ret) {
> +                       while (--i >=3D 0)
> +                               component_unbind_all(private->all_drm_pri=
vate[i]->dev, drm);
>                         return ret;
> +               }
>         }
>
>         /*
> --
> 2.48.1
>
