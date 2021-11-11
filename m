Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C611344DA7F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 17:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA0289BCD;
	Thu, 11 Nov 2021 16:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B253589BCD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 16:31:24 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z21so26381691edb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2W/CJnbZvaclrdnTWqFvW5r3qoblU7sV66cxT+4XUYk=;
 b=QZVeh2HTaIPC4eZQZC+/jsl6xl96fBlcvKxZIBARGeZmF34gFvKjGoMcZ6SZfOjZ+0
 dD0Wam8t8DTEiJ6t1haFC78pvk/FgXeuOjuxmFAS1MLl/Cot8J7zYGLlaDn0ZZFvlHN+
 AmMTIR2xGG8sFJtZHLB6HtuWUhVEhtt7L7AEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2W/CJnbZvaclrdnTWqFvW5r3qoblU7sV66cxT+4XUYk=;
 b=ciBiiN83/c8A93o992PNOq8t7OoXSTzCOj16An2YNHEfmQq06Pk/rAtw1Rg5sfoCEZ
 LawB5cFaMqf0aFu/Ymar5Y6lhb1ESHKwrf+BEmeAX5AFArKGIaLfSYttXETuhNz4ERBZ
 MAuBcipxTuZEwqn3ftoRGXuTGq4OoVVIsuxZR0LEOgt8T9dJ/Jn0pSps4ht0C9GsV213
 vVEQM01rx0PMnxPF5/F1g+V9eY4GDyoQenEn/nP9F/nnjxTSdA4++QCN+41Ow4VvnhyI
 SlZ2/pwLUOoRatl4cXtNdyuGzeM3tBkXtxC611gGe4ER/LXm5TlEOzSTBr1BCgmOcPrx
 jOlA==
X-Gm-Message-State: AOAM532MMxXUb2dUVzqhUJXVFEJMgyPiTEcFdW7o7nP2k4kzA26+DqVe
 BIw0c18tXAdbBvY/GruO7ONppqvxdEoMbH7X8cyF5g==
X-Google-Smtp-Source: ABdhPJxQKs37pCERI5cN22bck98CiSH+JurGR8wJGn8XxiTi2OyxFS6les3G4QX7RPcXOfvUetkwMQf7HIdMXlr+Mo4=
X-Received: by 2002:a17:907:1c82:: with SMTP id
 nb2mr10745488ejc.218.1636648281498; 
 Thu, 11 Nov 2021 08:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
 <20211111101456.584061-3-jagan@amarulasolutions.com>
 <0bcc7911-e747-68af-05bc-902b22b94673@denx.de>
In-Reply-To: <0bcc7911-e747-68af-05bc-902b22b94673@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 11 Nov 2021 22:01:10 +0530
Message-ID: <CAMty3ZDFtdqcnPMCRU0d+=O_WQF+ejyP9q73Fst-hjg-oxE5Ug@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] arm64: dts: imx8mm: Add MIPI DSI pipeline
To: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dae <inki.dae@samsung.com>
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
Cc: Peng Fan <peng.fan@nxp.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 3:51 PM Marek Vasut <marex@denx.de> wrote:
>
> On 11/11/21 11:14 AM, Jagan Teki wrote:
>
> [...]
>
> > +                     dsi: dsi@32e10000 {
> > +                             compatible = "fsl,imx8mm-mipi-dsim";
> > +                             reg = <0x32e10000 0x400>;
> > +                             clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > +                                      <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > +                             clock-names = "bus_clk", "sclk_mipi";
> > +                             assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> > +                                               <&clk IMX8MM_VIDEO_PLL1_OUT>,
> > +                                               <&clk IMX8MM_CLK_DSI_PHY_REF>;
> > +                             assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> > +                                                      <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> > +                                                      <&clk IMX8MM_VIDEO_PLL1_OUT>;
> > +                             assigned-clock-rates = <266000000>, <594000000>, <27000000>;
> > +                             interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > +                             phys = <&mipi_phy 0>;
> > +                             phy-names = "dsim";
> > +                             power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
> > +                             samsung,burst-clock-frequency = <891000000>;
> > +                             samsung,esc-clock-frequency = <54000000>;
> > +                             samsung,pll-clock-frequency = <27000000>;
> > +                             status = "disabled";
>
>
> This 27 MHz is really IMX8MM_CLK_DSI_PHY_REF and
> samsung,burst-clock-frequency is really the DSI link clock which is
> panel/bridge specific ... but, why do we need to specify such policy in
> DT rather than have the panel/bridge drivers negotiate the best clock
> settings with DSIM bridge driver ? This should be something which should
> be implemented in the DRM subsystem, not hard-coded in DT. These ad-hoc
> samsung,*-clock-frequency properties shouldn't even be needed then.

This look confusion for me, all three clock are used it directly from
exynos. and these indeed are computing pll for this bridge and clock
control of dsim registers are updated from this out come values. No
thoughts as of now how to handle these externally and update the
internal register based on those out come values.

>
> Also, are the DSIM bindings stable now ?

Issue still lies on exynos dsi side, the final driver is not binding
properly. I'm trying to send the next version patches only for
existing exynos dsi to convert into bridge. and subsequently adding
i.mx8mm specifics. More problem for me to test it on exynos boards, i
don't have any either.

Jagan.
