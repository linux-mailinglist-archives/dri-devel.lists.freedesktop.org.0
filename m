Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015427852C4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FA310E3F0;
	Wed, 23 Aug 2023 08:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5123110E3F0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:35:01 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-48d11d1a251so1130223e0c.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692779700; x=1693384500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmMZFZ62OdIAtWcX5zw3zpQ/Qr+ShV602MOY+LKIebw=;
 b=aSQ7medMm32HRzU8weU8tNYTnPBrEEFQ41Kbmbur21/iF3yhiy/NKXSjPFkJmK47ce
 bLOyRL2bjw153X6Zfwi5lIUgdDgBV2F3vQilek37DvEZdVgNnc4KT3GmiQLXPZQAlUJC
 qynbBKaZYR7QVIC3/bxEKKUVTr1QP0b3/ezgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692779700; x=1693384500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmMZFZ62OdIAtWcX5zw3zpQ/Qr+ShV602MOY+LKIebw=;
 b=D7L/M2uPnph556TuMXsX5p5yDeDj/lQ36ZQJvITyQo+eMKShe9A1o9m96/B1JBIodD
 93J4rPVLCI1sppfLKoEe/N+AKfPvyVvYUh1LiXWLGYHptt/aPv4QrN3+penesHL/oRXl
 7B7gjiQlyu44VH0OcQ9zgPuJCG75ZxZfX68KvcZ7fEuFv2+r83wxmR6TH72Ama/XNsmx
 /1XNC5uOznGA5GaHUtXAwjPYgRZbTNZKvCj79QbEZa8A3W+2FFQ8kkJ4ObzYHNNU+h9w
 SPXDhdbhtW49OKtARlN3uD1z8G/k+OB3+tR7k8+5kBqcKsOvVWWbPv5PjToBj/V1vBst
 zAxQ==
X-Gm-Message-State: AOJu0YyvPWF01tojrqYeJ7qjm+tVrJvHCA4nwuT1K+4OTIXix3cQtKUv
 bIVWcuWCUDYO1TfHI9YsOlKovaamexneK2CQHU+Q8g==
X-Google-Smtp-Source: AGHT+IGSDVGVupZv/MLbXhRgCOL+pMnSbFh3lgLbXxMSB5Hcf2CbFqQt0tXsFwyI797JMNTB1vUE2gYu9sF1UiFPuZQ=
X-Received: by 2002:a1f:cd85:0:b0:48d:2a1:5d26 with SMTP id
 d127-20020a1fcd85000000b0048d02a15d26mr9307618vkg.4.1692779700344; Wed, 23
 Aug 2023 01:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230823082549.24756-1-shuijing.li@mediatek.com>
In-Reply-To: <20230823082549.24756-1-shuijing.li@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 23 Aug 2023 16:34:49 +0800
Message-ID: <CAGXv+5FKpt0uxPPBTd0D0+PSD068NJFSf2AuQ5nckK8KW7WNag@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Support IGT in dp driver
To: Shuijing Li <shuijing.li@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 4:25=E2=80=AFPM Shuijing Li <shuijing.li@mediatek.c=
om> wrote:
>
> Support IGT (Intel GPU Tools) in Mediatek DisplayPort driver

The commit message makes little sense.

First of all, you are changing the DSI driver, not the DisplayPort driver.

Second, the subject should say what was changed. In this case it would be
something like "Add mode_valid callback to DSI bridge". "Support IGT" is
*why* the change was done, should only be mentioned in the commit message
body, and you could be more specific about which test in IGT needs it.

ChenYu

> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 7d5250351193..a494e04f0ddf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -806,6 +806,25 @@ static void mtk_dsi_bridge_atomic_post_disable(struc=
t drm_bridge *bridge,
>         mtk_dsi_poweroff(dsi);
>  }
>
> +static enum drm_mode_status
> +mtk_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +                         const struct drm_display_info *info,
> +                         const struct drm_display_mode *mode)
> +{
> +       struct mtk_dsi *dsi =3D bridge_to_dsi(bridge);
> +       u32 bpp;
> +
> +       if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> +               bpp =3D 16;
> +       else
> +               bpp =3D 24;
> +
> +       if (mode->clock * bpp / dsi->lanes > 1500000)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs =3D {
>         .attach =3D mtk_dsi_bridge_attach,
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> @@ -815,6 +834,7 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_f=
uncs =3D {
>         .atomic_pre_enable =3D mtk_dsi_bridge_atomic_pre_enable,
>         .atomic_post_disable =3D mtk_dsi_bridge_atomic_post_disable,
>         .atomic_reset =3D drm_atomic_helper_bridge_reset,
> +       .mode_valid =3D mtk_dsi_bridge_mode_valid,
>         .mode_set =3D mtk_dsi_bridge_mode_set,
>  };
>
> --
> 2.40.1
>
