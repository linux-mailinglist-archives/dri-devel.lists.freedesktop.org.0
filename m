Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6E30D249
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 05:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB2489E1D;
	Wed,  3 Feb 2021 04:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B0A89E1D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 04:03:09 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id g13so7887935uaw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 20:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRmcBS+D8ie4DR9UuABqvgaIR3BnrLM49K5MwM/jb2k=;
 b=Cnkmlci4Z9x+W9PJgvly/S+T/Xk7q2JAM0NOGhqlpC7cCWxjELth6QexjoNksXnl6A
 8s+rwaY5mTIEe4ADvKzRHYkx7aSYUlCpD4R4kj0eZ4g0FW05K0f+7JiWwws/L8HU0LbI
 nMCwrt8I+1VHLGlwxeOCno6OZ/UhCde+lxvCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRmcBS+D8ie4DR9UuABqvgaIR3BnrLM49K5MwM/jb2k=;
 b=ODl8SijqRvz0yhH/NEMAuSF0P6LcTSa+GvoEMThp7awmopYVSmkKB+kQ+eXzzWcgEq
 zRguF/qU1vlEX8sni8IySJyeRmfFZxbX8X3J7rElBhXxlmqO3c7OdCnF8obg+DGI3WPp
 6RAV/GNXvJfBia/SHRXzifIPvXhmOyDpvk6wFiwrGyB+6mELvhiJTNNyRIVT2b17Ocdg
 V345196Zj/Cf+bY40pgVy5BUsH/aA0maaJ7v5OQQ29FsR1VE4VWZXhMeOmT2VBSXvUVq
 jODLfbkzT6EM+NuWyR5D0s/KyzgtjIfJPZDq3p7Z9pci+I5kvjh+vMpCJw3zqOGmr9pM
 dsIA==
X-Gm-Message-State: AOAM5319m44czTsVe71c75rl12RhExM9ZWsrhjMCaMWoHvUNGCzhWTHL
 2DGVuJFulKtdcqjcbkwD4MQrOrTHwAAFQHtlMVCUSA==
X-Google-Smtp-Source: ABdhPJzKgdO699d7NEidKkYUFGCitxzY1h0GLirMYgqHTXBy0DPlWTL+v/D9UP+CXksw/KwcJdfdGHR++aPPOFRquR8=
X-Received: by 2002:ab0:3043:: with SMTP id x3mr748227ual.88.1612324988471;
 Tue, 02 Feb 2021 20:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20210201034755.15793-1-jitao.shi@mediatek.com>
In-Reply-To: <20210201034755.15793-1-jitao.shi@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 3 Feb 2021 12:02:57 +0800
Message-ID: <CANMq1KA4nXBuy50pANw1MKbOm0DKNBgBTcHTmMoPFEq-GskKxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fine tune the data lane trail by project dts
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 cawa cheng <cawa.cheng@mediatek.com>, shuijing.li@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 1, 2021 at 11:48 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
>
> Some panels or bridges require customized hs_da_trail time.
> So add a property in devicetree for this panels and bridges.

Since this changes the device tree, you also need to upload a binding
document change.

>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 8c70ec39bfe1..6e7092fa2fee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -194,6 +194,7 @@ struct mtk_dsi {
>         struct clk *hs_clk;
>
>         u32 data_rate;
> +       u32 da_trail_delta;
>
>         unsigned long mode_flags;
>         enum mipi_dsi_pixel_format format;
> @@ -234,7 +235,7 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
>         timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
>         timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
>                              timing->da_hs_prepare;
> -       timing->da_hs_trail = timing->da_hs_prepare + 1;
> +       timing->da_hs_trail = timing->da_hs_prepare + 1 + dsi->da_trail_delta;
>
>         timing->ta_go = 4 * timing->lpx - 2;
>         timing->ta_sure = timing->lpx + 2;
> @@ -1094,6 +1095,13 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>                 goto err_unregister_host;
>         }
>
> +       ret = of_property_read_u32_index(dev->of_node, "da_trail_delta", 0,
> +                                        &dsi->da_trail_delta);
> +       if (ret) {
> +               dev_info(dev, "Can't get da_trail_delta, keep it as 0: %d\n", ret);
> +               dsi->da_trail_delta = 0;
> +       }
> +
>         comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DSI);
>         if (comp_id < 0) {
>                 dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
> --
> 2.12.5
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
