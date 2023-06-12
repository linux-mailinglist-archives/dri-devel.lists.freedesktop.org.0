Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A563972C9A8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDC58922E;
	Mon, 12 Jun 2023 15:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E144C10E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:18:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C12BD621CB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE53C433A1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686583103;
 bh=Xb1HsQlSrZkn1qAf6y9yA3U1APG6n0vq1EUnF8SnDe0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fqXHTN/wQrrur4issS6zsCoMz5NmQnl7VT4HbZNJkSb2A6NQJCSmVt7iUx8Q29Xrc
 NQiaky8PGWu3+fNiURrclPcr2WCAVXNErDnjaE/IrAXX852/8bVE6WWIUiLYd5+XRh
 VCcF2EeWuwloOSjUpHRvV8EjxjBGktr+8vsHBqZdHfTU+TMjBL127g16HoSD/X+kNo
 1FjV+EXhWH1Col98ixaEO8Kp+UqKgcQ8T7F6YxvFtKF4tmfxOLKtJ0T2UY3gBm1qLt
 8a+BSr+defk/TtY0XAvgiDFVPLaiKWVhNthAkDg/oanNftBU64k/UiapGCs9IFExoT
 QjklEWjQQU2qQ==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b1a86cdec6so51819781fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:18:22 -0700 (PDT)
X-Gm-Message-State: AC+VfDyA/UirJtqVnrAEUEPoZLBdMstAJhNAPsGhS8R4a/Fku16rbzKz
 0G7zYZRHGmajb7bk8PMq0mcKo22Qnp/HImciUQ==
X-Google-Smtp-Source: ACHHUZ6Qp/Vp5TeOAkJlOh2/kbCsJgPNg3Io8FKtSRoRf3G6btpi5WFRobLqjBxP13VeT3s5wljRrxAoMUiqzEK306c=
X-Received: by 2002:a2e:9d8a:0:b0:2ad:95dd:8802 with SMTP id
 c10-20020a2e9d8a000000b002ad95dd8802mr2876142ljj.38.1686583101104; Mon, 12
 Jun 2023 08:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-3-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1681366162-4949-3-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Jun 2023 23:18:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-QwzY55V-dFcb2z69fRQwtoAat7ZKdScW29=3Lfe_LGA@mail.gmail.com>
Message-ID: <CAAOTY_-QwzY55V-dFcb2z69fRQwtoAat7ZKdScW29=3Lfe_LGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, shuijing.li@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Xinlei:

Reorder this patch after patch "[3/3] drm/mediatek: dsi: Add dsi
cmdq_ctl to send panel initial code"

Regards,
Chun-Kuang.

<xinlei.lee@mediatek.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=8813=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=882:09=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> Add the compatible because there are different definitions for cmdq
> register bit control in mt8188.
>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
>  drivers/gpu/drm/mediatek/mtk_dsi.c     | 8 ++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a13b36ac03a1..9ba05961479d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -654,6 +654,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DSI },
>         { .compatible =3D "mediatek,mt8186-dsi",
>           .data =3D (void *)MTK_DSI },
> +       { .compatible =3D "mediatek,mt8188-dsi",
> +         .data =3D (void *)MTK_DSI },
>         { }
>  };
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 7d5250351193..500a3054282d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1208,6 +1208,12 @@ static const struct mtk_dsi_driver_data mt8186_dsi=
_driver_data =3D {
>         .has_size_ctl =3D true,
>  };
>
> +static const struct mtk_dsi_driver_data mt8188_dsi_driver_data =3D {
> +       .reg_cmdq_off =3D 0xd00,
> +       .has_shadow_ctl =3D true,
> +       .has_size_ctl =3D true,
> +};
> +
>  static const struct of_device_id mtk_dsi_of_match[] =3D {
>         { .compatible =3D "mediatek,mt2701-dsi",
>           .data =3D &mt2701_dsi_driver_data },
> @@ -1217,6 +1223,8 @@ static const struct of_device_id mtk_dsi_of_match[]=
 =3D {
>           .data =3D &mt8183_dsi_driver_data },
>         { .compatible =3D "mediatek,mt8186-dsi",
>           .data =3D &mt8186_dsi_driver_data },
> +       { .compatible =3D "mediatek,mt8188-dsi",
> +         .data =3D &mt8188_dsi_driver_data },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
> --
> 2.18.0
>
