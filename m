Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5273C44B995
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 01:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077856E416;
	Wed, 10 Nov 2021 00:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827AD6E416
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 00:24:57 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c8so3203867ede.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 16:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cbV1zZ53Ye+VsWDk6PAcIMOeQNeEh9gJGX69zuF5qCY=;
 b=amP0VyF2u6MbwusnnCkzmrEAl6rT2/KtCm3C8sxGEb8JsKS2BdKKzPTs1+F9Ea0V0L
 x5T3B/U0RC0kS1TJKlWj28FopXHXzzgXtZdHoEjJQlNLiSeF/diYh3Ws85TewHaV5QqK
 qnAwHfitAVboKaoZo0nuIVCwv1MAS8aRPjAZSm4KiBwRjMeFiGdQkPk+vRjtWKtXRAok
 QeyzxMSNSvo3Z2ha1EgvYao9CBLxxWFD1R11zQ2+9OVmi713O35w65Llb8r6ZBx+gspa
 0rPzQPMf7/IjOQW2Op+DAejmHskCmJ3vKOONoHgrR2kH2wh2sfKKlMr64IlqMkkQQRlp
 F66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cbV1zZ53Ye+VsWDk6PAcIMOeQNeEh9gJGX69zuF5qCY=;
 b=NyAKjWvCChEzrPPjGUqDou9b4AqY3rrFMk6dZqK9u6rDx5uZMoYkGHZmlk1AFK3keu
 5DoSSktTK7wQzwm6zt6on8psGz+FdCMx8kXa2Fxq0wCsMjh2qWhF+orfdWPon4x2dPOP
 YRULaCTY3RnE+QJU/i6fkZESiPvv10duh4+TxcNGDY8bLaQJGYjJm6M+hAkHLZk0Q3Ps
 PN9BWooz/Tt8bDYRFdxaBbzo4q90p/qupegwo9noFniDbIYMm8dHX7BVWmDoGZnpFx9B
 SsWv5d6wfNIfA+DiAWsX8UMN91BKpylYDu40E1jC/ilwmOe6ijyw+PRc+fySF2HnxIEQ
 O/bw==
X-Gm-Message-State: AOAM533Uy1mn18FFOTF7yqNCJfU1xoI5J8cLxel0QkWYveWItH9Vt1M9
 HNpadB++umCcGVh34/RgK1Uj/44q44xjfk+MPP46k/oYL70=
X-Google-Smtp-Source: ABdhPJxh+76brtUKZ4As5AwcNuq2tM7FYtS2W51h2JQVa6HBbKJvYbAAARiQ9+qtS5xkfu2sCuLMdUTYMECylXEnkDI=
X-Received: by 2002:a17:906:ca18:: with SMTP id
 jt24mr14765582ejb.325.1636503895724; 
 Tue, 09 Nov 2021 16:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20211109173357.780-1-tharvey@gateworks.com>
In-Reply-To: <20211109173357.780-1-tharvey@gateworks.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 9 Nov 2021 18:24:44 -0600
Message-ID: <CAHCN7xKBMRRUO87Y9cn-885ESWvKbz_-EzGS9q3oXKy8KmpMpA@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: imx8mm: Add MIPI and LCDIF nodes
To: Tim Harvey <tharvey@gateworks.com>
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
Cc: Marek Vasut <marex@denx.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 9, 2021 at 11:34 AM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Add nodes for MIPI DSI and LCDIF on IMX8MM
>
> I'm currently working with a set of patches to convert drm/exynos
> to a bridge [1] and add IMX8MM support [2] in order to get IMX8MM DSI
> working for display with a Raspberry Pi DSI touchscreen compatible with
> a Toshiba TC358762 DSI bridge and Powertip PH800480T013-IDF02
> touchscreen.
>
> I had this working on a 5.10 kernel with the old blk-ctl and
> power-domain drivers that didn't make it into mainline but my 5.15
> series with blk-ctl backported from next hangs right after
> "[drm] Initialized mxsfb-drm 1.0.0 20160824 for 32e00000.lcdif on minor 0"
> so I assume I have a power-domain not getting enabled.
>
> Please let me know if you see an issue with the way I've configured
> power-domain or clocks here.
>
> Best Regards,
>
> Tim
> [1] https://patchwork.kernel.org/project/dri-devel/list/?series=347439&archive=both&state=*
> [2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=359775&archive=both&state=*
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 68 +++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index 208a0ed840f4..195dcbff7058 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -188,6 +188,12 @@
>                 clock-output-names = "clk_ext4";
>         };
>
> +       mipi_phy: mipi-video-phy {
> +               compatible = "fsl,imx8mm-mipi-video-phy";
> +               syscon = <&disp_blk_ctrl>;
> +               #phy-cells = <1>;
> +       };
> +
>         psci {
>                 compatible = "arm,psci-1.0";
>                 method = "smc";
> @@ -1068,6 +1074,68 @@
>                         #size-cells = <1>;
>                         ranges = <0x32c00000 0x32c00000 0x400000>;
>
> +                       lcdif: lcdif@32e00000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;

If there is only 1 port I don't think you need address-cells and
size-cells.  See more below....

> +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";
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
> +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_LCDIF>;
> +                               status = "disabled";
> +
> +                               port@0 {
> +                                       reg = <0>;

This should be just "port {" and we can get rid of the @0 and the "reg=0"

This eliminates some build warnings.
> +
> +                                       lcdif_to_dsim: endpoint {
> +                                               remote-endpoint = <&dsim_from_lcdif>;
> +                                       };
> +                               };
> +                       };
> +
> +                       mipi_dsi: mipi_dsi@32e10000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;

I think this should move into a sub node...see below

> +                               compatible = "fsl,imx8mm-mipi-dsim";
> +                               reg = <0x32e10000 0x400>;
> +                               clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +                                        <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +                               clock-names = "bus_clk", "sclk_mipi";
> +                               assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +                                                 <&clk IMX8MM_VIDEO_PLL1_OUT>,
> +                                                 <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +                               assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> +                                                        <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> +                                                        <&clk IMX8MM_VIDEO_PLL1_OUT>;
> +                               assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> +                               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&mipi_phy 0>;
> +                               phy-names = "dsim";

I think the mipi_phy is the equivalent to the mipi_rst_mask in the
power domain I added to the CSI.  Looking through the NXP 5.10 kernel,
 BIT(17) is the reset for the MIPI_DSI.  I haven't tried it yet, but
it makes me assume that BIT(16) is for the MIPI_CSI.

Both bits are set in the imx-atf code, and the documentation isn't
clear, but I tweaked the blk-ctrl driver to only set BIT(16) for the
mipi_rst_mask on the CSI.  I still get some hanging, so it's not any
better that way.

> +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
> +                               samsung,burst-clock-frequency = <891000000>;
> +                               samsung,esc-clock-frequency = <54000000>;
> +                               samsung,pll-clock-frequency = <27000000>;
> +                               status = "disabled";
> +

Add a subnode called "ports" and move address-cells and size-cells
into it along wtih "port@0"

> +                               port@0 {
> +                                       reg = <0>;
> +
> +                                       dsim_from_lcdif: endpoint {
> +                                               remote-endpoint = <&lcdif_to_dsim>;
> +                                       };
> +                               };
> +                       };
> +
>                         csi: csi@32e20000 {
>                                 compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
>                                 reg = <0x32e20000 0x1000>;
> --
> 2.17.1
>
