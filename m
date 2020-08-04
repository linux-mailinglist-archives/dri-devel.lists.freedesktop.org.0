Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC323BECD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 19:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2C36E48D;
	Tue,  4 Aug 2020 17:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C313E6E48D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 17:22:39 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83249206D4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596561759;
 bh=Xoip3bOYIImGhy7ogd9kynyso6cxechck06IVDrtLW4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=z+7sr2ZWgk+EKMuu+lTtzdVoIX9WLhXg2tgNLJo08WroVrlO10uHXblY4NKS/vZb1
 Q7vxKuyAMR8TACbBPMc23u8Qbpsli3avO2zBd5Vxdtt9f0QgBGe+kpYHhGtILJfg3c
 dhOJRJ2wdu/MsQRautvAfLtzmPJT7Dl9z802SUEg=
Received: by mail-oi1-f169.google.com with SMTP id v13so20395229oiv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 10:22:39 -0700 (PDT)
X-Gm-Message-State: AOAM532TW/4kcoUHWo/K6HAuwnOdEYxy6KpE50z02IucExMz1vD+xbxL
 KtymE1vfTl3mklWbRfI3uLce5fDLrrUsPN59KA==
X-Google-Smtp-Source: ABdhPJwkisncqagQYnRqj5kYxbVToGGengOKjQOWBvV6rwXKDIFKaESd49zyc6uwCxQY+hCjnV7BMm8OuxgHZCg7q+E=
X-Received: by 2002:aca:bb82:: with SMTP id l124mr4339078oif.106.1596561758805; 
 Tue, 04 Aug 2020 10:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-2-linux@fw-web.de>
 <trinity-aa434d4a-b151-4595-93cc-a222bf12522d-1596561528040@3c-app-gmx-bap28>
In-Reply-To: <trinity-aa434d4a-b151-4595-93cc-a222bf12522d-1596561528040@3c-app-gmx-bap28>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 4 Aug 2020 11:22:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+bQccA5u8ohh24oUSmhPA_+kE9Q_S_yUL-8nizVWK4-A@mail.gmail.com>
Message-ID: <CAL_Jsq+bQccA5u8ohh24oUSmhPA_+kE9Q_S_yUL-8nizVWK4-A@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
To: Frank Wunderlich <frank-w@public-files.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 4, 2020 at 11:19 AM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> CC Rob Herring and devicetree-list

Resend or it is not in my patchwork queue.

But this is simple enough:

Acked-by: Rob Herring <robh@kernel.org>

>
> > Gesendet: Dienstag, 04. August 2020 um 18:55 Uhr
> > Von: "Frank Wunderlich" <linux@fw-web.de>
> > An: linux-mediatek@lists.infradead.org
> > Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, "Matthias Brugger" <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
> > Betreff: [PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
> >
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > mt7623 uses mt2701/mt8173 for drm, but have own compatibles
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 2 +-
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 2 +-
> >  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
> >  .../devicetree/bindings/display/mediatek/mediatek,hdmi.txt    | 4 ++++
> >  4 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > index b91e709db7a4..121220745d46 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> > @@ -43,7 +43,7 @@ Required properties (all function blocks):
> >       "mediatek,<chip>-dpi"                   - DPI controller, see mediatek,dpi.txt
> >       "mediatek,<chip>-disp-mutex"            - display mutex
> >       "mediatek,<chip>-disp-od"               - overdrive
> > -  the supported chips are mt2701, mt2712 and mt8173.
> > +  the supported chips are mt2701, mt7623, mt2712 and mt8173.
> >  - reg: Physical base address and length of the function block register space
> >  - interrupts: The interrupt signal from the function block (required, except for
> >    merge and split function blocks).
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> > index 77def4456706..dc1ebd13cc88 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> > @@ -7,7 +7,7 @@ output bus.
> >
> >  Required properties:
> >  - compatible: "mediatek,<chip>-dpi"
> > -  the supported chips are mt2701 , mt8173 and mt8183.
> > +  the supported chips are mt2701, mt7623, mt8173 and mt8183.
> >  - reg: Physical base address and length of the controller's registers
> >  - interrupts: The interrupt signal from the function block.
> >  - clocks: device clocks
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > index 8e4729de8c85..f06f24d405a5 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> > @@ -7,7 +7,7 @@ channel output.
> >
> >  Required properties:
> >  - compatible: "mediatek,<chip>-dsi"
> > -  the supported chips are mt2701, mt8173 and mt8183.
> > +- the supported chips are mt2701, mt7623, mt8173 and mt8183.
> >  - reg: Physical base address and length of the controller's registers
> >  - interrupts: The interrupt signal from the function block.
> >  - clocks: device clocks
> > @@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
> >
> >  Required properties:
> >  - compatible: "mediatek,<chip>-mipi-tx"
> > -  the supported chips are mt2701, mt8173 and mt8183.
> > +- the supported chips are mt2701, 7623, mt8173 and mt8183.
> >  - reg: Physical base address and length of the controller's registers
> >  - clocks: PLL reference clock
> >  - clock-output-names: name of the output clock line to the DSI encoder
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> > index 7b124242b0c5..6b1c586403e4 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> > @@ -6,6 +6,7 @@ its parallel input.
> >
> >  Required properties:
> >  - compatible: Should be "mediatek,<chip>-hdmi".
> > +- the supported chips are mt2701, mt7623 and mt8173
> >  - reg: Physical base address and length of the controller's registers
> >  - interrupts: The interrupt signal from the function block.
> >  - clocks: device clocks
> > @@ -32,6 +33,7 @@ The HDMI CEC controller handles hotplug detection and CEC communication.
> >
> >  Required properties:
> >  - compatible: Should be "mediatek,<chip>-cec"
> > +- the supported chips are mt7623 and mt8173
> >  - reg: Physical base address and length of the controller's registers
> >  - interrupts: The interrupt signal from the function block.
> >  - clocks: device clock
> > @@ -44,6 +46,7 @@ The Mediatek's I2C controller is used to interface with I2C devices.
> >
> >  Required properties:
> >  - compatible: Should be "mediatek,<chip>-hdmi-ddc"
> > +- the supported chips are mt7623 and mt8173
> >  - reg: Physical base address and length of the controller's registers
> >  - clocks: device clock
> >  - clock-names: Should be "ddc-i2c".
> > @@ -56,6 +59,7 @@ output and drives the HDMI pads.
> >
> >  Required properties:
> >  - compatible: "mediatek,<chip>-hdmi-phy"
> > +- the supported chips are mt2701, mt7623 and mt8173
> >  - reg: Physical base address and length of the module's registers
> >  - clocks: PLL reference clock
> >  - clock-names: must contain "pll_ref"
> > --
> > 2.25.1
> >
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
