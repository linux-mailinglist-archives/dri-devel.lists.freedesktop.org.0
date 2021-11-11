Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 966CB44D4F3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4420D89B8F;
	Thu, 11 Nov 2021 10:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55E789B8F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 10:21:24 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A255D83698;
 Thu, 11 Nov 2021 11:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1636626082;
 bh=taxzubYHokxok37uAwk0gHFE5shPHpfxCAl1Vif9c3g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=P67BiVh9swn/KhxxVpVzA+StqKlC3kMC0arGNCJFZ+KGldUIO6LGFYysM1Guyie+8
 kCy79ue4+dKC35iVxDqqcqPACjnt4gt76xaJDvsJRo7/HMyeAAA17GKu6ckv41MhBh
 lDiEVrg4VV/Gm3fNdh1pYpmpr10rNCsQamr4D4jvkzdRyIdtkmJDJ8X4N7yfIVxmOl
 ZxjuqtovDcXKV7m2Da6D+jOMGDCk+EO5yE1uvkvrq3pAodZJVg48Cpc4jHJzelC4wp
 WY+EjehxLQF/73O8Na8Gt6Z8dlIrOk7d9x5Rv4UxbKCHndiMHjo/6wLuMCnhl5M41+
 SD+57FT9/IMtA==
Subject: Re: [RFC PATCH v2 2/3] arm64: dts: imx8mm: Add MIPI DSI pipeline
To: Jagan Teki <jagan@amarulasolutions.com>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
 <20211111101456.584061-3-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <0bcc7911-e747-68af-05bc-902b22b94673@denx.de>
Date: Thu, 11 Nov 2021 11:21:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111101456.584061-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/21 11:14 AM, Jagan Teki wrote:

[...]

> +			dsi: dsi@32e10000 {
> +				compatible = "fsl,imx8mm-mipi-dsim";
> +				reg = <0x32e10000 0x400>;
> +				clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +					 <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +				clock-names = "bus_clk", "sclk_mipi";
> +				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +						  <&clk IMX8MM_VIDEO_PLL1_OUT>,
> +						  <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> +							 <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> +							 <&clk IMX8MM_VIDEO_PLL1_OUT>;
> +				assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> +				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&mipi_phy 0>;
> +				phy-names = "dsim";
> +				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
> +				samsung,burst-clock-frequency = <891000000>;
> +				samsung,esc-clock-frequency = <54000000>;
> +				samsung,pll-clock-frequency = <27000000>;
> +				status = "disabled";


This 27 MHz is really IMX8MM_CLK_DSI_PHY_REF and 
samsung,burst-clock-frequency is really the DSI link clock which is 
panel/bridge specific ... but, why do we need to specify such policy in 
DT rather than have the panel/bridge drivers negotiate the best clock 
settings with DSIM bridge driver ? This should be something which should 
be implemented in the DRM subsystem, not hard-coded in DT. These ad-hoc 
samsung,*-clock-frequency properties shouldn't even be needed then.

Also, are the DSIM bindings stable now ?
