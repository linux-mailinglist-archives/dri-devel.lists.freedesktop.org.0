Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969E44B34F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 20:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB63989590;
	Tue,  9 Nov 2021 19:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9DF890E9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 19:36:01 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v11so786096edc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 11:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ISpyleFQBBn4Ln0pnbEoPVGjaacshDcsG4KdixbCt14=;
 b=aP2nbUtw9a9XXh/yK60NFHyCWWfw3pmFeBGofEBC6PGt3OaZgjRax6x0KPZLeZwi6H
 CrJqwzjGZMYTN3AwZOyKwxV00JLv274KCIzECdLliiCcbbUDs79OcfYNii+MwCpZergT
 WWiL9zKONnMiPxas69kTPanmT/jPADE7igJoQG82LIGj4Ya0Y2TdXPTvxaUW0z71UXSS
 oHhy7Ngcqw5CHON9+SWuz7YqLr8wpAcfssj3GHwtUJQExyfAT8i6avc5la8ogXcWPw7N
 KhbnztKMYQ6wBjX7RAZHkLsx6D2N9/z+PYPZvXoPiYnLDgU/Or1ELWE8HNo7rNEBkOns
 jzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISpyleFQBBn4Ln0pnbEoPVGjaacshDcsG4KdixbCt14=;
 b=5lNh/YAA4+u+JQ13l7aVecg+NTLWgjbcVcR2zsm8j4aPMyuvDZ710We+PJyq/Qq0zr
 f9bpu4idSYbgo1MKl1iGtMkfnHfd+uNCFu4NK2CpVmLB0j7sw5GOEgddwdQYOMdfoDip
 au6eN4fRVp9GP3MO+0rRgKVRu7XrxRrb9ERW4ELby5tdxJ8XleWFFXgzvU1jW9gtZM8V
 4c/8cTiu+eqFfd/4ksKrNunkBaaFFrzL8JdRGH5bMV2mcG0llsoHMdAXX3XQ1tMBNOq2
 WfoZ1tk5k6aRZ/l/RGEQ6f+qNJbRuiY5hbRQixCY2gnYrib94MFJGN8JjTg8qdzPhV6D
 AFXw==
X-Gm-Message-State: AOAM532sqCUTsCXBdFC7RCdOZWxAmQAdWEHeqc2an9Ixpej/b47F0O6p
 ym7e1n5c+Ut2LMIscnn60kKWUIW4oWWZyaVhU+I=
X-Google-Smtp-Source: ABdhPJxh4VrAbGrgrgIfzJfgrRF2itcpdyh5Sr5FnV1Shu/waI8MmvMSdeLrmSj2jDA2AQnIN3cRHDVxEzS886pyBag=
X-Received: by 2002:a17:906:1993:: with SMTP id
 g19mr11509845ejd.50.1636486559441; 
 Tue, 09 Nov 2021 11:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20211109173357.780-1-tharvey@gateworks.com>
In-Reply-To: <20211109173357.780-1-tharvey@gateworks.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 9 Nov 2021 13:35:47 -0600
Message-ID: <CAHCN7xJAW40xvLpBttWRfbv=Pz=HeCbX+g2uZa6CabiqLqG3PA@mail.gmail.com>
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
> +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";

The compatible "imx6sx-lcdif" implies MXSFB_V6.  FWICT, it is like
MXSFB_V4, but with overlays and those overlays have more registers
configured in the mxsfb_kms driver.  Have you tried using imx28-lcdif
to see if it makes a difference?

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

Just through visual inspection, it appears that the
IMX8MM_CLK_DISP_AXI and IMX8MM_CLK_DISP_APB clock-parents and rates
are already set in the pgc_dispmix, so I think it's safe to reduce
those lines to just assigning IMX8MM_CLK_LCDIF_PIXEL to the
IMX8MM_VIDEO_PLL1_OUT with the assigned-clock-rate set to 594000000.

adam



> +                               interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_LCDIF>;
> +                               status = "disabled";
> +
> +                               port@0 {
> +                                       reg = <0>;
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
