Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE444B41E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75826E50B;
	Tue,  9 Nov 2021 20:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01976E85E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 20:40:53 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id y7so870699plp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jg4Y3FhoTOtBIKgUBAmUixI61w9Qv3QONojV89aivDk=;
 b=Jgk4MVsoFxaWm37gHuAbk13EM1HTiwwnpCG7nvCqZYSCurkYVFjvo/uZ77xik9VyNE
 TTujn3iW7GhphrkX1OJ4LjCYeutlnxnQsKlCNersvUy4MlzzsyHw956+RpIrjBXUntwX
 92Pqko8DdN7Mqp+GHOd6jloTKuQH89Pj26jEZ2dR9YuAUXKOTqAg+NFr86j3do98D0BM
 Yk4Y+77yxGcVW8cNQ2nKx7u6qGfhrCjG67wz3UXsLOEMgIVZ31guf7XHSqN3s610HjdS
 Y6TWggfWKo29ANmrN7IoFTLwWCiDixu924Sn+KBAM3M+qn8UpmFTn/D5hW79hR7ebbAi
 dspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jg4Y3FhoTOtBIKgUBAmUixI61w9Qv3QONojV89aivDk=;
 b=up2dNN9BjQR8Fwo+IepPoNiYSWimBWeo/FvdRa3sYv5xSBVdiSBCXdrPYT9A3xipuq
 mOBI0GK1qQBFOfXlIlDFkdief3J3uMYdwDzfWhqulhGaACotHsLzMFr7Uo4TB2sLAb0w
 OSUnXDjU83ELr3T/LdiEBCpfZ5213WWrB1Y4x4lrCt2DuYGXshKX/TmW5WFQCUYwPTzH
 v1fYt97U1mwkLERI/iBni0g3X9+MqljWWxNG7549vj7EX/GJIWWg8KNnxzOCld904YHE
 T4KAX0j19fKR2k15Ba8UpyrrOb8b7noMT9N7m36tLaCKLk5+/lsNG1xqj2bsy2LgKP9h
 MvNw==
X-Gm-Message-State: AOAM533vKMTxXZfPGsG9mWaZmRNZyXtLP+E2IknJUavDH2J0zLFCmmFk
 jw8YxsNc9/kNonb3QR+xQrVDkyfMAzcNiObf7Lc8WA==
X-Google-Smtp-Source: ABdhPJzKG2gDRBlnkaoNHt57Wyfbl1xt6LJKxhGb48yYGv9IChbPwKgEUj/2kGfxhOlHSusZ6PJVwD1LzHVy7+6klTk=
X-Received: by 2002:a17:902:b907:b0:13f:ccaf:9ed8 with SMTP id
 bf7-20020a170902b90700b0013fccaf9ed8mr10345345plb.46.1636490453486; Tue, 09
 Nov 2021 12:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20211109173357.780-1-tharvey@gateworks.com>
 <CAHCN7xJAW40xvLpBttWRfbv=Pz=HeCbX+g2uZa6CabiqLqG3PA@mail.gmail.com>
In-Reply-To: <CAHCN7xJAW40xvLpBttWRfbv=Pz=HeCbX+g2uZa6CabiqLqG3PA@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 9 Nov 2021 12:40:42 -0800
Message-ID: <CAJ+vNU0nC2X6T61MsMcmd+GaUHK4FtfF=wJ4SF3mt0AeUpZvDg@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: imx8mm: Add MIPI and LCDIF nodes
To: Adam Ford <aford173@gmail.com>
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

On Tue, Nov 9, 2021 at 11:36 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Tue, Nov 9, 2021 at 11:34 AM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Add nodes for MIPI DSI and LCDIF on IMX8MM
> >
> > I'm currently working with a set of patches to convert drm/exynos
> > to a bridge [1] and add IMX8MM support [2] in order to get IMX8MM DSI
> > working for display with a Raspberry Pi DSI touchscreen compatible with
> > a Toshiba TC358762 DSI bridge and Powertip PH800480T013-IDF02
> > touchscreen.
> >
> > I had this working on a 5.10 kernel with the old blk-ctl and
> > power-domain drivers that didn't make it into mainline but my 5.15
> > series with blk-ctl backported from next hangs right after
> > "[drm] Initialized mxsfb-drm 1.0.0 20160824 for 32e00000.lcdif on minor 0"
> > so I assume I have a power-domain not getting enabled.
> >
> > Please let me know if you see an issue with the way I've configured
> > power-domain or clocks here.
> >
> > Best Regards,
> >
> > Tim
> > [1] https://patchwork.kernel.org/project/dri-devel/list/?series=347439&archive=both&state=*
> > [2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=359775&archive=both&state=*
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 68 +++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > index 208a0ed840f4..195dcbff7058 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > @@ -188,6 +188,12 @@
> >                 clock-output-names = "clk_ext4";
> >         };
> >
> > +       mipi_phy: mipi-video-phy {
> > +               compatible = "fsl,imx8mm-mipi-video-phy";
> > +               syscon = <&disp_blk_ctrl>;
> > +               #phy-cells = <1>;
> > +       };
> > +
> >         psci {
> >                 compatible = "arm,psci-1.0";
> >                 method = "smc";
> > @@ -1068,6 +1074,68 @@
> >                         #size-cells = <1>;
> >                         ranges = <0x32c00000 0x32c00000 0x400000>;
> >
> > +                       lcdif: lcdif@32e00000 {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";
>
> The compatible "imx6sx-lcdif" implies MXSFB_V6.  FWICT, it is like
> MXSFB_V4, but with overlays and those overlays have more registers
> configured in the mxsfb_kms driver.  Have you tried using imx28-lcdif
> to see if it makes a difference?

Adam,

Yes, I see now a discussion regarding this [1]. Changing to
'imx28-lcdif' still hangs.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20210620224834.189411-1-marex@denx.de/

>
> > +                               reg = <0x32e00000 0x10000>;
> > +                               clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
> > +                                        <&clk IMX8MM_CLK_DISP_AXI_ROOT>,
> > +                                        <&clk IMX8MM_CLK_DISP_APB_ROOT>;
> > +                               clock-names = "pix", "disp_axi", "axi";
> > +                               assigned-clocks = <&clk IMX8MM_CLK_LCDIF_PIXEL>,
> > +                                                 <&clk IMX8MM_CLK_DISP_AXI>,
> > +                                                 <&clk IMX8MM_CLK_DISP_APB>;
> > +                               assigned-clock-parents = <&clk IMX8MM_VIDEO_PLL1_OUT>,
> > +                                                        <&clk IMX8MM_SYS_PLL2_1000M>,
> > +                                                        <&clk IMX8MM_SYS_PLL1_800M>;
> > +                               assigned-clock-rate = <594000000>, <500000000>, <200000000>;
>
> Just through visual inspection, it appears that the
> IMX8MM_CLK_DISP_AXI and IMX8MM_CLK_DISP_APB clock-parents and rates
> are already set in the pgc_dispmix, so I think it's safe to reduce
> those lines to just assigning IMX8MM_CLK_LCDIF_PIXEL to the
> IMX8MM_VIDEO_PLL1_OUT with the assigned-clock-rate set to 594000000.
>

Ok, that makes sense.

Incidentally I added some debug prints in imx_pgc_power_{up,down} and
find we hang at:
imx_pgc_power_down mipi

Best Regards,

Tim
