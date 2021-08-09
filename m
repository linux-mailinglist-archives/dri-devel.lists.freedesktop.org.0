Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131243E47E0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4739089B7D;
	Mon,  9 Aug 2021 14:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0334F89B7D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:45:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C2BC61051
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628520304;
 bh=95QsABHXN+pKNxd1hFR4tyhFhuhVRX4HItHjBlDAOAM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZHHc2tqQt4FtLxY3aH4lGfE3tn50kdJD0e6njJSMxYHMB/2u1a150CuHr67VD3wfG
 CgAcy29+9FWnwthQBGb1NuD5jcOC21zUsG3dPdQmSNiYLWBb2uYi6cIIPMiFOXtpls
 OhI09RLY5jwhcvlbdbxP69f3Fk8voUeu+3X+EHhHiS3J88UDQFa0Zg6JT+JztDLHUE
 GwYqvqGQUlmFEPlv5wB3ZvWNCuD5YoGoWaI69DkgujioU5euX/MKOdbsQp+7HZr/w7
 NZUhExbNiy1LJ//dVeUhOhmpI3ubH+pJFcns5NlPqxRN1EDOuQp7K65K6LeeaPiO0k
 dacPEHNlPdsQw==
Received: by mail-ej1-f43.google.com with SMTP id qk33so29378229ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:45:04 -0700 (PDT)
X-Gm-Message-State: AOAM530rwe6V8h9pWv3rQs1F1Yb0STekusaBVsEqErh8PFP1PSI94FGV
 1sqxbII6/+rCTV2uLTW8EGk7Iu1ylnh+r3kWSg==
X-Google-Smtp-Source: ABdhPJzN+KSXTc2XGkL/912N2+WxTOmmqX40r8nDWbVnU03DlFFuQZ0jsZTTmMWJ4Ylfu7wo2OO4OoF580G8wMPF7Kw=
X-Received: by 2002:a17:907:98fb:: with SMTP id
 ke27mr1266398ejc.303.1628520303167; 
 Mon, 09 Aug 2021 07:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210808134117.66798-1-jitao.shi@mediatek.com>
 <20210808134117.66798-2-jitao.shi@mediatek.com>
In-Reply-To: <20210808134117.66798-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 22:44:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_90UteUjOgJ5w7vKW6amXCfps7=SennwYYk2=TUrr6aYA@mail.gmail.com>
Message-ID: <CAAOTY_90UteUjOgJ5w7vKW6amXCfps7=SennwYYk2=TUrr6aYA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] drm/mediatek: force hsa hbp hfp packets multiple
 of lanenum to avoid screen shift
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 stonea168@163.com, huijuan.xie@mediatek.com, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com, 
 Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>
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

Hi, Jitao:

Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=888=E6=97=
=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=889:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The bridge chip ANX7625 requires the packets on lanes aligned at the end,
> or ANX7625 will shift the screen.

In anx7625_attach_dsi(), it call mipi_dsi_attach(), and it call into
mtk_dsi_host_attach().
I would like to pass this information from anx7623 driver to mtk_dsi
driver when attach.

Regards,
Chun-Kuang.

>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index ae403c67cbd9..033234d51e86 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -194,6 +194,8 @@ struct mtk_dsi {
>         struct clk *hs_clk;
>
>         u32 data_rate;
> +       /* force dsi line end without dsi_null data */
> +       bool force_dsi_end_without_null;
>
>         unsigned long mode_flags;
>         enum mipi_dsi_pixel_format format;
> @@ -499,6 +501,13 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi=
 *dsi)
>                 DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\=
n");
>         }
>
> +       if (dsi->force_dsi_end_without_null) {
> +               horizontal_sync_active_byte =3D roundup(horizontal_sync_a=
ctive_byte, dsi->lanes) - 2;
> +               horizontal_frontporch_byte =3D roundup(horizontal_frontpo=
rch_byte, dsi->lanes) - 2;
> +               horizontal_backporch_byte =3D roundup(horizontal_backporc=
h_byte, dsi->lanes) - 2;
> +               horizontal_backporch_byte -=3D (vm->hactive * dsi_tmp_buf=
_bpp + 2) % dsi->lanes;
> +       }
> +
>         writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
>         writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>         writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> @@ -1095,6 +1104,10 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>         dsi->bridge.of_node =3D dev->of_node;
>         dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>
> +       if (dsi->next_bridge)
> +               dsi->force_dsi_end_without_null =3D of_device_is_compatib=
le(dsi->next_bridge->of_node,
> +                                                                        =
 "analogix,anx7625");
> +
>         drm_bridge_add(&dsi->bridge);
>
>         ret =3D component_add(&pdev->dev, &mtk_dsi_component_ops);
> --
> 2.25.1
