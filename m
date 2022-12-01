Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36BB63EFCE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 12:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC8510E147;
	Thu,  1 Dec 2022 11:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5BD10E147
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 11:45:07 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id 124so1295662vsv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 03:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qE/q8OTGX/vukPXHLJF5f0ZobL7IbidYs5xkC1/4Glo=;
 b=EzvNjsK/64biWBOqAzlM7ZmFo/qswGF8E2psYeSj0xdD6287yOJeqmtxtWiDCeeRne
 HLae+HG1stNZu59moUdMxeVYOQDp9sfWFNA6V3VypSXCAVupelhw74Ch1etHO5XDWI0m
 ybBlh0c2Z/irb2/MSL4MDBPlinBeHrffEoJ60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qE/q8OTGX/vukPXHLJF5f0ZobL7IbidYs5xkC1/4Glo=;
 b=P1i4e2qckceRUO8FYs7zSc3Vz0qROs41Sopb7EiXYHKl4yb7pnu1U43BqH5pLN6bA+
 g505x1eIJbd7PirJQpbzj6HfnTLcGRQCG+dcD61X4v8IhNPHaMQmTC1Zvjn5RVmIqn1V
 wprhOnzmSPAdzcmfm8MSzcNqOPMwc+h4ejR+FJKvpmfrOHZMxQqxNxufhpDyykLQ84dy
 AkN7/u8VRkJP9lKMhgOMQKHichz6NIH7TpOZU8WvT3lBOV0Qa2Xqlcdy/FHKBoS83bie
 NKULLNtdWdoMbdGDMLiKC1RGrWRAIj2B36BViC53QdrwmrdDIrvOK6D+DoAHFslqZV0W
 RLAA==
X-Gm-Message-State: ANoB5pk0FvDGrdEFFHhwSZvghCv4PJNOUv/rTZ4R9r8YUtbG1Wn1VsYU
 nw7Ol7nIN+bw97VQtQq95YwJVSEcvjjSnznu2HYHDg==
X-Google-Smtp-Source: AA0mqf4u5I2OZaSiq21veOJJ1DavEQccozE6Z/lEVW/v7HrTmm4H19hg9RZ5yAmVKH9lnRtk1UUPSAMKL03w0XsTCgg=
X-Received: by 2002:a67:c98e:0:b0:3ad:3d65:22b with SMTP id
 y14-20020a67c98e000000b003ad3d65022bmr28646035vsk.65.1669895106580; Thu, 01
 Dec 2022 03:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-6-nancy.lin@mediatek.com>
In-Reply-To: <20221107072243.15748-6-nancy.lin@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Dec 2022 19:44:55 +0800
Message-ID: <CAGXv+5Hj-H6Q3N+j2tEntd9M=9p0o7TxWYn_4aawhqFUbX7+PQ@mail.gmail.com>
Subject: Re: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, nfraprado@collabora.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, wim@linux-watchdog.org,
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 3:23 PM Nancy.Lin <nancy.lin@mediatek.com> wrote:
>
> Simplify code for update  mmsys reg.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 45 ++++++++++++--------------------
>  1 file changed, 16 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 9a327eb5d9d7..73c8bd27e6ae 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c

[...]

> @@ -124,27 +129,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  {
>         struct mtk_mmsys *mmsys =3D dev_get_drvdata(dev);
>         const struct mtk_mmsys_routes *routes =3D mmsys->data->routes;
> -       u32 reg;
>         int i;
>
>         for (i =3D 0; i < mmsys->data->num_routes; i++)
> -               if (cur =3D=3D routes[i].from_comp && next =3D=3D routes[=
i].to_comp) {
> -                       reg =3D readl_relaxed(mmsys->regs + routes[i].add=
r);
> -                       reg &=3D ~routes[i].mask;
> -                       writel_relaxed(reg, mmsys->regs + routes[i].addr)=
;
> -               }
> +               if (cur =3D=3D routes[i].from_comp && next =3D=3D routes[=
i].to_comp)
> +                       mtk_mmsys_update_bits(mmsys, routes[i].addr, rout=
es[i].mask, 0);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>
> -static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u=
32 mask, u32 val)
> -{
> -       u32 tmp;
> -
> -       tmp =3D readl_relaxed(mmsys->regs + offset);
> -       tmp =3D (tmp & ~mask) | val;
> -       writel_relaxed(tmp, mmsys->regs + offset);
> -}
> -
>  void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>  {
>         if (val)

This hunk now doesn't apply due to

    soc: mediatek: Add all settings to mtk_mmsys_ddp_dpi_fmt_config func

touching mtk_mmsys_ddp_dpi_fmt_config() as well. It's trivial to resolve
though.

ChenYu
