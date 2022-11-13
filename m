Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA79627380
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 00:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3505E10E24D;
	Sun, 13 Nov 2022 23:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDC810E24D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 23:34:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4387A60DD8
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 23:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C5BC433D6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668382454;
 bh=qAqHRLjgH1Z78cZZXlR1l2VU3CVTYWFxyboPeadk8Lg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=USV2DdzmKvfV1pNyBC2N0uRvMMGCR8N2fGmeAeOUru9d4t8C97H8qI9g16dYC+sdF
 N/LgIhRuXSnD2WZCoXC9PB0cziHKYJ+u6+F0p/mHZrQewruI70BdWAaJCFm4yJNLi5
 nU37q/kFYiunlIiRCc91I8oE7nUO7SBQIOJGd9lluOgTuDn/XMtPW6zoD60p512Skl
 VAsm1X80nyiAMGetQG+ClUMuzDetlF7NLqITiF5WuvXkikTm73mN+rn3lPZnTuRCtn
 fzDSufB98+HUllPTjbN2yuLYxKYitA7cxDJGlUzLTaj+BnQ/e2rP1x6IlOEuFkYGym
 09kUz8rf4nOhg==
Received: by mail-ot1-f46.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso5822912otb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 15:34:14 -0800 (PST)
X-Gm-Message-State: ANoB5pnS3UL/YUsy+6UPecRi1ZBInpWodKJtqM+zWZadP4EGevmjqdgv
 lMriMn5vGBgkRdLfvhPfQngMXtaJKuUin3yfdQ==
X-Google-Smtp-Source: AA0mqf45+HuGE5seimLLJAfjPAwkfwMduSg/tJPjE7vi7m7eddcBfPkq/IbcnwKPOkfdj5XXlI9YM4JNrPwRFu5Jnm8=
X-Received: by 2002:a9d:4b02:0:b0:661:b04c:41d9 with SMTP id
 q2-20020a9d4b02000000b00661b04c41d9mr5380307otf.92.1668382453776; Sun, 13 Nov
 2022 15:34:13 -0800 (PST)
MIME-Version: 1.0
References: <1667988059-8635-1-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1667988059-8635-1-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 14 Nov 2022 07:33:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-6Y5LmmkJXL5gigwuZjAfQHOJAoy_G+NYUmfgjxuef_w@mail.gmail.com>
Message-ID: <CAAOTY_-6Y5LmmkJXL5gigwuZjAfQHOJAoy_G+NYUmfgjxuef_w@mail.gmail.com>
Subject: Re: [PATCH v4] drm: mediatek: Modify dpi power on/off sequence.
To: xinlei.lee@mediatek.com
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Xinlei:

<xinlei.lee@mediatek.com> =E6=96=BC 2022=E5=B9=B411=E6=9C=889=E6=97=A5 =E9=
=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> Modify dpi power on/off sequence so that the first gpio operation will ta=
ke effect.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 6bd4763fd532 ("drm/mediatek: set dpi pin mode to gpio low to avoid=
 leakage current")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
> change note:
> v3: Moved pull-down pin control after mtk_dpi_power_off.
>
> v2: Remove the empty line between Fixes: and S-o-b.
>
> v1: Rebase on linus/master v6.1-rc1. Change nothing.
>
> Because dpi power_on/off is protected by dpi->refcount, the first time
> it cannot be powered on and off successfully, it will cause leakage.
> ---
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 508a6d994e83..1f5d39a4077c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -461,9 +461,6 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>         if (--dpi->refcount !=3D 0)
>                 return;
>
> -       if (dpi->pinctrl && dpi->pins_gpio)
> -               pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> -
>         mtk_dpi_disable(dpi);
>         clk_disable_unprepare(dpi->pixel_clk);
>         clk_disable_unprepare(dpi->engine_clk);
> @@ -488,9 +485,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>                 goto err_pixel;
>         }
>
> -       if (dpi->pinctrl && dpi->pins_dpi)
> -               pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> -
>         return 0;
>
>  err_pixel:
> @@ -721,12 +715,18 @@ static void mtk_dpi_bridge_disable(struct drm_bridg=
e *bridge)
>         struct mtk_dpi *dpi =3D bridge_to_dpi(bridge);
>
>         mtk_dpi_power_off(dpi);
> +
> +       if (dpi->pinctrl && dpi->pins_gpio)
> +               pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
>  }
>
>  static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
>  {
>         struct mtk_dpi *dpi =3D bridge_to_dpi(bridge);
>
> +       if (dpi->pinctrl && dpi->pins_dpi)
> +               pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> +
>         mtk_dpi_power_on(dpi);
>         mtk_dpi_set_display_mode(dpi, &dpi->mode);
>         mtk_dpi_enable(dpi);
> --
> 2.18.0
>
