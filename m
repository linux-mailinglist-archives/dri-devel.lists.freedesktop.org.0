Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9A3AFB4B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 05:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EA46E082;
	Tue, 22 Jun 2021 03:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1543F6E07B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 03:09:13 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id l1so32138056ejb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 20:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7niPUm2hSmXvDTZIayC2hRqOTqKfDH7sAfKGCNr3PSo=;
 b=Zx+57caGKfxlamUwXIlwuTe4G3ODjn+B6ted2HuK2+zIn7+TrVW2gdJcV3WxdX5s3N
 SZi/s1vDnktJkDb75Rju2zcYWol/4DqSJqO1AFsyRyAkqLmz5TRLavUZaK6+F9eqe9DK
 +xMHz+ytlIDL9ZwD+iy7cWeQ6KpavudGFcfEv2upbHvnoBjqpzH7oSy4rQKuvad1IQLV
 HLjWxc92fWmYc7nICmQ8qQI+XJ/BhU8mu+32kUgvtdIa1TjBAwWiCax9EeefIJvYK/pl
 VliD4SK7A5llEdkqCGaH2HgG81kNYg7Li/DSB4R7v6TgU0BHQ9uuxEsv10X7Yvnnbdz+
 qCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7niPUm2hSmXvDTZIayC2hRqOTqKfDH7sAfKGCNr3PSo=;
 b=oL6n2kK2Mz4DVcpRL+gKz8pXwV65eRNv5RQVC8VTeTz91NgNbpwSUynGa/nA9Ouf6h
 /GxiQ4L794hcq4ypjuuw5FXCET4Co9QcQaXzGq+Zrxnzt400tdqEKb1zf45Tt3RM1Zr9
 VGbZ2K7yP9Co5BbdKPMvGbfatkqtKEwdHkhclFONxBYa+ytQsS5hljLgokomZiWNBC5O
 BKT8IzxCTGyKN4KYlomWks6Dw3XwqYRDD/uIDBt+OSerKZenBjFFNMxQWXvdwUNTsA7M
 WEG4u1Uut4A+eNUj+k0hhEWq1WajBZMLetqJa/2l9Vsow7Pu9aGdbCE9L5Oo6BqqZz+8
 LSKw==
X-Gm-Message-State: AOAM533xZkeRErsASuktgZ5GCQwodlAot5UDKVNM01BUIIWMCLOuXwj5
 buyKR7hWvu3ldpHt0DLGoMXYTIi8WTe9Dhp7FfY=
X-Google-Smtp-Source: ABdhPJzozl3nK5cYfHbxs2Xty143R2O1VPZnWLAKoR/K4faLM/z8uiVuXlXqTrzTGoJdLISQuhOYfLCbJqd47LLTINE=
X-Received: by 2002:a17:907:1611:: with SMTP id
 hb17mr1418947ejc.450.1624331351539; 
 Mon, 21 Jun 2021 20:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-8-jagan@amarulasolutions.com>
In-Reply-To: <20210621072424.111733-8-jagan@amarulasolutions.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 21 Jun 2021 22:09:00 -0500
Message-ID: <CAHCN7x+RKuOwBEFC5ySHJuFiC26ZdYuv620+5FiTfrh-3y2-Lg@mail.gmail.com>
Subject: Re: [RFC PATCH 7/9] arm64: dts: imx8mm: Add eLCDIF node support
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-amarula@amarulasolutions.com,
 Tomasz Figa <t.figa@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 2:25 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add eLCDIF controller node for i.MX8MM.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index fe5485ee9419..5f68182ed3a6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -1030,6 +1030,25 @@ aips4: bus@32c00000 {
>                         #size-cells = <1>;
>                         ranges = <0x32c00000 0x32c00000 0x400000>;
>
> +                       lcdif: lcdif@32e00000 {
> +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";

Based on a comment I read from Marek [1] from this patch series for
the driver, I think fallback compatible should be fsl,imx28-lcdif.

"The iMX8MM and iMX8MN do not support the overlay plane, so they are MXSFB V4"

[1] - https://patchwork.kernel.org/project/dri-devel/patch/20210620224834.189411-1-marex@denx.de/

adam

> +                               reg = <0x32e00000 0x10000>;
> +                               clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
> +                                        <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
> +                                        <&clk IMX8MM_CLK_DISP_APB_ROOT>;
> +                               clock-names = "pix", "disp_axi", "axi";
> +                               assigned-clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
> +                                                 <&clk IMX8MM_CLK_DISP_AXI>,
> +                                                 <&clk IMX8MM_CLK_DISP_APB>;
> +                               assigned-clock-parents = <&clk IMX8MM_VIDEO_PLL1_OUT>,
> +                                                        <&clk IMX8MM_SYS_PLL2_1000M>,
> +                                                        <&clk IMX8MM_SYS_PLL1_800M>;
> +                               assigned-clock-rate = <594000000>, <500000000>, <200000000>;
> +                               interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                               power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_LCDIF>;
> +                               status = "disabled";
> +                       };
> +
>                         dispmix_blk_ctl: blk-ctl@32e28000 {
>                                 compatible = "fsl,imx8mm-dispmix-blk-ctl", "syscon";
>                                 reg = <0x32e28000 0x100>;
> --
> 2.25.1
>
