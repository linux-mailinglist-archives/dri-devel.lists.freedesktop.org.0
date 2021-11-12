Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87D44DF3B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 01:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707E6E94D;
	Fri, 12 Nov 2021 00:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90DD6E94D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 00:38:21 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id x64so7024072pfd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6V0YnnkWAGWiDmZp2NjWEznJa73Yi3xUG8ZLOn1q/Ek=;
 b=cLMvhV4oZxE15N+mSTNdBHjBLxrKePFf01qAgNgyJX1bbqJZzZ5HQyQP1FAjVqrrVZ
 HZDefmqrgCsWGUCxfRxJxIPr2gddCZPSeYxU39sJCqPLesoAgPxAtP9gD/0dRRBViyhq
 MlSnrLdRhIP5mQ7331JLVanifvBZZ1M4vT5dEEph+zp6lsJmMKuqBVZVCwgHWTOTkfX/
 rPcIYr61SUJubQFPuti0aU/Z438en7VsYAbuPamf5TKFE3SjyYbkX9hd7feZfK0ewsOz
 DRVnKk5BEgYQLcnAtxXAM2ySdAFSA0OEeA5CQZxrcfK0eri0khoO4G6r8Wn/v2IRuwVN
 dVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6V0YnnkWAGWiDmZp2NjWEznJa73Yi3xUG8ZLOn1q/Ek=;
 b=yKqYakqoFRj83kCEabnCJ7USzDLR9wxjQ+BMT+3PfkKmJt8ynoITKh4pks2f/8ubwG
 G2fm9HM8upjOgD1jUP862w3ooJn3du2VYqzzENNByigYY2Iy5WS5Y0tLwTjl2q7Aq0Lv
 cbvHeGrIo8RqqH5vXKd9g/Us3c2MjLcmpIdy2YQhOMVeQiRqPPE8NIvbYYpZqCPS9k1g
 DfF0tsbTDDmgXPRJw4ftfQS/Uo4TXA/snnOMSIs32P6JdqTqojNrDa2gnBI2+4azj6dM
 facNM5+oAEqh8f+yD+ENkeyHcYJW7xRNq1IvDsWV3vFiJvf/SQ0jX3piwR9onKdvMdJ0
 PUNQ==
X-Gm-Message-State: AOAM5336yaC0AHi0qupD1zlP72ey7oQQcnJB2SmznPbyETkabv5Ju9c8
 jlMQnIf23NHggsNAbhUV/hvbuHkDtVFvGqjRki8nFg==
X-Google-Smtp-Source: ABdhPJxaCFDAIhmCkXGL8hllEw8h73+sJwzBBj0q4Odpc93JOWrcVnEA1nrzNasBIza5BdOzQ0Lp3M4dqoieeVJ5FR4=
X-Received: by 2002:a63:5f56:: with SMTP id t83mr7396167pgb.432.1636677501335; 
 Thu, 11 Nov 2021 16:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
 <20211111101456.584061-2-jagan@amarulasolutions.com>
In-Reply-To: <20211111101456.584061-2-jagan@amarulasolutions.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 11 Nov 2021 16:38:10 -0800
Message-ID: <CAJ+vNU0fdSmhQqw-__8ndkeXrbwFEKOb5G0wukfG7h9g6YKJ8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] arm64: dts: imx8mm: Add eLCDIF node support
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
> Add eLCDIF controller node for i.MX8MM.
>

Jagan,

It doesn't look like you sent this to the Device Tree mainling list so
I added that to cc.

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index c2f3f118f82e..caeb93313413 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -1068,6 +1068,25 @@ aips4: bus@32c00000 {
>                         #size-cells = <1>;
>                         ranges = <0x32c00000 0x32c00000 0x400000>;
>
> +                       lcdif: lcdif@32e00000 {
> +                               compatible = "fsl,imx28-lcdif";
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
> +                       };
> +
>                         disp_blk_ctrl: blk-ctrl@32e28000 {
>                                 compatible = "fsl,imx8mm-disp-blk-ctrl", "syscon";
>                                 reg = <0x32e28000 0x100>;
> --
> 2.25.1
>
