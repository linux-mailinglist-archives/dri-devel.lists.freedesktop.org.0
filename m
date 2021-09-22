Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85155414F51
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 19:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4BD6E02E;
	Wed, 22 Sep 2021 17:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0846E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 17:40:54 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id 42so2389216uar.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 10:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tvtYY0msHjnoC+I/Lu672obi3mQrOmz8sSMZ/dhCgcM=;
 b=dd49QXHyCdrQn8DXB7Cuk9r5otCke8rPGMOOo8daESQF7dKedj9LYgoDbtgmIZ9/Kl
 nXu/+Czl/CqIdTlbN+uhdiX9N+/zY3qeApBguE2CZxa6O1QST0371aYPIR98wT+KEhx6
 z3+faHWitgLcKcYMa52Djh2vL669MLn+5ZiXq2qqS4AZ7+ElxDONbIvSJ4FSN2ck9TEu
 zBjJxNIwD2G03L3q13BeKqwARfqtgeCFAZ4u6tDjuw9wC4+dgs+MfZC3WbzV5kEj/iwD
 ZOIKZYur+UxW5308VeVP08aEDm1odbCuZjAovKU88vNdeJW5clWRGq/87GSm5SlsM6ZL
 5jsA==
X-Gm-Message-State: AOAM533eN9g4MKkhsIZ7skiSLQCKz+D1TgaLqL5OCdje3Gf8S11jAjHu
 0vRVgBPHn8MYlSNYeguBc7HnIs1YSiuHhpPsyk9JSFRF87w=
X-Google-Smtp-Source: ABdhPJzd6iDf31R8aoIZCqnSwnmWaUJ7hUGbaC3Wu5rohHlUdjjVsD/K6aFxIKOAYsQD2BBiS+LwneCYtSPWWyKiJjw=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr635558ual.122.1632332452990; 
 Wed, 22 Sep 2021 10:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
 <CAMuHMdVmTcERvHhLLDrZyC_TDLPU89ksitn0WduJkKqpePCKdg@mail.gmail.com>
 <YUqGWa6q+wYq2vAt@pendragon.ideasonboard.com>
 <CAMuHMdXRhOmj4upp6Zsn3yb5bRdpg8hrgATWJCA6bSdvD=e1qw@mail.gmail.com>
 <YUrkiDnlDYabSi9T@pendragon.ideasonboard.com>
In-Reply-To: <YUrkiDnlDYabSi9T@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Sep 2021 19:40:41 +0200
Message-ID: <CAMuHMdUKsSA8_BD9KksVKAcOYdqTLhu_Wm=rwD3tfb=yceh7EQ@mail.gmail.com>
Subject: Re: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add binding
 for R-Car MIPI DSI/CSI-2 TX
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Sep 22, 2021 at 10:08 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Sep 22, 2021 at 08:43:57AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Sep 22, 2021 at 3:27 AM Laurent Pinchart wrote:
> > > On Tue, Sep 21, 2021 at 05:53:52PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Jul 28, 2021 at 6:26 PM Laurent Pinchart wrote:
> > > > > The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> > > > > can operate in either DSI or CSI-2 mode, with up to four data lanes.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > > > > @@ -0,0 +1,118 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> > > > > +
> > > > > +maintainers:
> > > > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > +
> > > > > +description: |
> > > > > +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> > > > > +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> > > > > +  to four data lanes.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    items:
> > > > > +      - description: Functional clock
> > > > > +      - description: DSI (and CSI-2) functional clock
> > > > > +      - description: PLL reference clock
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: fck
> > > > > +      - const: dsi
> > > > > +      - const: pll
> > > >
> > > > No interrupts?
> > > > The hardware manual says there are 9 interrupts.
> > >
> > > Who comes up with such insanely high numbers of interrupts ? :-)
> > >
> > > What the hardware manual doesn't document is how interrupts are mapped.
> > > There's indeed 9 of them, and there are 9 interrupt sources, but that's
> > > all we know. I can easily add a
> > >
> > >   interrupts:
> > >     maxItems: 9
> > >
> > > but I can add interrupt names without additional information. It may be
> > > possible to deduce some of the interrupt mappings from experiments, but
> > > not all of them. What do you think would be a good way forward ? Leave
> > > the interrupts out for now as we don't have the information ? Only list
> > > the interrupts but not their names ? Something else ?
> >
> > I think what we did in the past is not list the interrupts at all.
> > They can be added once we receive more documentation.
>
> Sounds good to me, as that's what this patch does already ;-) A R-b or
> A-b tag is welcome.

Your wish is my command...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
