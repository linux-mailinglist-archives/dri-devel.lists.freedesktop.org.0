Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A344DF34
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 01:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DFF6E9A2;
	Fri, 12 Nov 2021 00:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940EE6E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 00:36:59 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id n85so6975310pfd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6wBzxs2vTAMcv/J9u+OybiBdroBp59bgycTGw8HIpM=;
 b=qUi+Sh/Y7/5cYaVesftwnN+AXUfY08JNi8xdCSfFL7QrR3oBfuGelJ2+HcBCGX7aLD
 8vqPI03V9Bs88FH99EisjRgLrCIRkvzSj++iZ0kFR7e6ZkKRj7gEVVFweq7ExK/PA169
 0UiGxOa5S+pybGuCDR7+f0t74CvrecGqSL2GISkoQYH6lczTJip7WbAoK1j65SYyR+XM
 gkJxNc3uXQCkCwM4pf6PpvQWaJUWonwgyfC0Z3BtihCq5PtUWVsrMmw2ByaJVxttOBN2
 Tw3V2eVqygNoGRRz8krOfLNagAmg7pWNeJSt1If1diUHPJ/FeHj6q9dRMAb/oMWr4TzA
 0GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6wBzxs2vTAMcv/J9u+OybiBdroBp59bgycTGw8HIpM=;
 b=D1WZrFBjq4WnbGaljN9cy+cMI3FLr4ou7oaNokbXJ4kPqCCXXU8v40W0k1WGwOqBVa
 u/WdiNxt61TdCpf9fxOCZ3vnVaxzxttGFUABoP3vp/9GUt0KzbnMntORdOz+ACKGu5LL
 fMKz6Y+wQW4Sw96tq9Txo8suGnIa03cpvdh7o76qJiIo8Ga8kc9EoWh49gLIVcZ5ZDWh
 OTj8iYTLpXLwv2SCzu5ojt2FuqxT9B0viEl675LFxqXUVEFlvuLSeSMxSiY99qXmNhdB
 amF9E3DrvAI/ck6bMqOFV5xiv9t8ctXygB+IDvP6mS/etFz78rctgME76oGQffhCk5NU
 uFMw==
X-Gm-Message-State: AOAM53091AvOfOcFqSGwe/841HExn8daEaWIF3TZmST3DpubYo09RHlp
 NpqVlAB72Y7sCcFiQ7g9BUmlpk23Ax9w87Gys+dtaQ==
X-Google-Smtp-Source: ABdhPJyEuWQYQMmqBAEeskiNnGVCSkkFSoDOsoWXBmUkyHvskYzQQ2kvrOnjM5RktCJ9LsGhLwGT688nLfPukZMoYX8=
X-Received: by 2002:a63:191d:: with SMTP id z29mr1881558pgl.358.1636677419131; 
 Thu, 11 Nov 2021 16:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
 <20211111101456.584061-3-jagan@amarulasolutions.com>
In-Reply-To: <20211111101456.584061-3-jagan@amarulasolutions.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 11 Nov 2021 16:36:47 -0800
Message-ID: <CAJ+vNU3f=n71=7PbFh0OS+c8fqgst5W3r_wkfKYEn6tfXZiPFw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] arm64: dts: imx8mm: Add MIPI DSI pipeline
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
Cc: Marek Vasut <marex@denx.de>,
 Device Tree Mailing List <devicetree@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 2:15 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add MIPI DSI pipeline for i.MX8MM.
>
> Video pipeline start from eLCDIF to MIPI DSI and respective
> Panel or Bridge on the backend side.
>
> Add support for it.

Jagan,

Thanks for your continued work on IMX8MM DSI support!

It doesn't look like you sent this to the Device Tree mainling list so
I added that to cc.

>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 55 +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index caeb93313413..eddf3a467fd2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -188,6 +188,12 @@ clk_ext4: clock-ext4 {
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
> @@ -1085,6 +1091,55 @@ lcdif: lcdif@32e00000 {
>                                 interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>                                 power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_LCDIF>;
>                                 status = "disabled";
> +
> +                               port {
> +                                       lcdif_out_dsi: endpoint {
> +                                               remote-endpoint = <&dsi_in_lcdif>;
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi: dsi@32e10000 {

I wonder if this should this be 'mipi_dsi' like the CSI bindings
Adam's submitted here:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20211106155427.753197-2-aford173@gmail.com/

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
> +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
> +                               samsung,burst-clock-frequency = <891000000>;
> +                               samsung,esc-clock-frequency = <54000000>;
> +                               samsung,pll-clock-frequency = <27000000>;
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;

I don't think the '#address-cells' and '#size-cells' are needed here
but I defer to the dt experts!

> +
> +                                               dsi_in_lcdif: endpoint@0 {
> +                                                       reg = <0>;

Per Adam's comment to my posting this should be just "port {" and we
can get rid of the @0 and the "reg=0"

Best regards,

Tim

> +                                                       remote-endpoint = <&lcdif_out_dsi>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                       };
> +                               };
>                         };
>
>                         disp_blk_ctrl: blk-ctrl@32e28000 {
> --
> 2.25.1
>
