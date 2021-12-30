Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F87481E1A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 17:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7670210E141;
	Thu, 30 Dec 2021 16:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A1E10E141
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 16:31:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B38DD61642
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 16:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD40C36AEB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640881906;
 bh=DoMqZeSp31c4BdQxbZ15ZYyN+jInAOYa+pzWvuj1V+Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WAxEl4NOgOsftPaDpXfRWoi1nj9/3fBgHhYhGl4tT7fwXxVvRzy6i6pyh+KoCXk0q
 8RZ7JiL0yOC2GV7fDTUlnobaRHJNyofs7qQrBSputf0GNixgO/AaaYPWBjJVLuX09g
 UY6WwzrRDOkUyfrqtsQDdbV4pMqS7s5C56us+39ouMSTW/lGGrTDskGcyRNQ3UHYB+
 GzoO+xEf1ZGOZ9l70xvInPjANXpy5a0HDHDbURl+5luZuHGzm+wJmjUq/qdadbs3jB
 fYYvy6Ti9nRD/RK0j5WLKPou7gV351lmqiFPF1RO9IMihDfLLgbQ3+jVzA28Y0Ye6J
 +aok3dSqdoFRg==
Received: by mail-ed1-f43.google.com with SMTP id j6so99887160edw.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 08:31:46 -0800 (PST)
X-Gm-Message-State: AOAM531T9De/O/dMRNjQzH4HLOIutcW86YI6ZvSEl7hNM8bpNGr3fvfg
 47QrQkGEgYpyCPRLd3HrFo/iS6AdENAFsU2K5Q==
X-Google-Smtp-Source: ABdhPJwwoCM4BACwhBGiZnGRAg9C++hI21NbvZwOdn/dltz/26/69d6R/OprjtD1A4ewX0f1NC+U3pEDXI3uVMzy1AQ=
X-Received: by 2002:a17:907:629a:: with SMTP id
 nd26mr26535652ejc.680.1640881904439; 
 Thu, 30 Dec 2021 08:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20211224082103.7658-1-linmq006@gmail.com>
In-Reply-To: <20211224082103.7658-1-linmq006@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 31 Dec 2021 00:31:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-7-BrnkPk_5V5y20F6fX3X8Vm0tcYAA=1DNCnxjvNF8A@mail.gmail.com>
Message-ID: <CAAOTY_-7-BrnkPk_5V5y20F6fX3X8Vm0tcYAA=1DNCnxjvNF8A@mail.gmail.com>
Subject: Re: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-phy@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Miaoqian:

Miaoqian Lin <linmq006@gmail.com> =E6=96=BC 2021=E5=B9=B412=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The of_device_get_match_data() function may return NULL.
> Add check to prevent potential null dereference.
>
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediat=
ek/phy-mtk-mipi-dsi.c
> index 28ad9403c441..67b005d5b9e3 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> @@ -146,6 +146,8 @@ static int mtk_mipi_tx_probe(struct platform_device *=
pdev)
>                 return -ENOMEM;
>
>         mipi_tx->driver_data =3D of_device_get_match_data(dev);
> +       if (!mipi_tx->driver_data)

I'm confused. mtk_mipi_tx_probe() is called because this device node's
compatible match one in mtk_mipi_tx_match[]. So I think the return
value of of_device_get_match_data(dev) would not be NULL. If this is
true, this checking is redundant.

Regards,
Chun-Kuang.

> +               return -ENODEV;
>
>         mipi_tx->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(mipi_tx->regs))
> --
> 2.17.1
>
