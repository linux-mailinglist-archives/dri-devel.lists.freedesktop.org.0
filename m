Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F923DBCFF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 18:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCB16E40A;
	Fri, 30 Jul 2021 16:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193FB6E40A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 16:23:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEFDC6101C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627662201;
 bh=FW5LB4/droceMkapj9/opDRSSB08Hj67ZWxOidv6Bak=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pi4Pi51yNSIBNhSaMwGePr9C1LErMMOjm7VEeu4XA+T1AoBJXCXLGmB8IrxI1e9M9
 nQnmJWRnj1dEdcCOyUhUASV58lg6mp8Q9Ch3HUwvo+M1dye9AB0F+qXy56B2fcuIL/
 7yekJ7i6GVA27N22fvtF6si8l9zFY4GT5rxgQq2NQAS5Dq0oMzhdZOivz31N74h7Nk
 aHOOn63rsKKmynnbkepxhaPwWuzDvmlg+3JxANOZXAENVNOzRAfw28Hod0z5Ejznzw
 M68M4cIHmzUAo0PYkJMwhcdiiHP27Sm3RhbIw2ew0QAaHWd8z7SZn4SYwA/sDM82Ju
 Son813H1X1wtg==
Received: by mail-ed1-f43.google.com with SMTP id da26so13993538edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 09:23:21 -0700 (PDT)
X-Gm-Message-State: AOAM530iyi8nJHFKLjCzcqAW6lDcMfmpEjqRi3AL0xA7PiS9zf1UEUxT
 lTpnoBUs3ElCDfyw58wpu1BgeL0g0F8yZKDrdA==
X-Google-Smtp-Source: ABdhPJzMdtcUi1zO0dPd4SSrt2q34Yx/1YxBJlURSGlVXMthQEd0rhojXPsJpfAwWhNd3aUVC/s1oj1cE69g15qMsjo=
X-Received: by 2002:a05:6402:718:: with SMTP id
 w24mr3884876edx.49.1627662200337; 
 Fri, 30 Jul 2021 09:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627459111-2907-7-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1627459111-2907-7-git-send-email-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 31 Jul 2021 00:23:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_95Qpv-RjxzWteQ-+p=P0siC2c0vAQdkx-V7bfCwgn34g@mail.gmail.com>
Message-ID: <CAAOTY_95Qpv-RjxzWteQ-+p=P0siC2c0vAQdkx-V7bfCwgn34g@mail.gmail.com>
Subject: Re: [PATCH 7/9] phy: phy-mtk-hdmi: convert to
 devm_platform_ioremap_resource
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-phy@lists.infradead.org, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eddie Hung <eddie.hung@mediatek.com>
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

Hi, Chunfeng:

Chunfeng Yun <chunfeng.yun@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=882=
8=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:59=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Use devm_platform_ioremap_resource to simplify code

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/p=
hy-mtk-hdmi.c
> index 8ad8f717ef43..5fb4217fb8e0 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -100,7 +100,6 @@ static int mtk_hdmi_phy_probe(struct platform_device =
*pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct mtk_hdmi_phy *hdmi_phy;
> -       struct resource *mem;
>         struct clk *ref_clk;
>         const char *ref_clk_name;
>         struct clk_init_data clk_init =3D {
> @@ -116,11 +115,9 @@ static int mtk_hdmi_phy_probe(struct platform_device=
 *pdev)
>         if (!hdmi_phy)
>                 return -ENOMEM;
>
> -       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       hdmi_phy->regs =3D devm_ioremap_resource(dev, mem);
> -       if (IS_ERR(hdmi_phy->regs)) {
> +       hdmi_phy->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(hdmi_phy->regs))
>                 return PTR_ERR(hdmi_phy->regs);
> -       }
>
>         ref_clk =3D devm_clk_get(dev, "pll_ref");
>         if (IS_ERR(ref_clk)) {
> --
> 2.18.0
>
