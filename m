Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D98414219
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 08:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AE26EA42;
	Wed, 22 Sep 2021 06:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56886EA42
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 06:44:09 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id k10so1842261vsp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2pUM5brNJqaej4iEqyIsIxjV6XIoFcwAAQ7Oqy6DEk=;
 b=cAWu6rkbBa/oz8j56N7LPSb7A3DqcqJZq9vY2qUUYoN8L4aDKkcStA4pfoLrYYnbDN
 /lUtHJxjApXkTl7UHhhSZSr7IIubCVjdOqmanC2SqU26Fv//RAD+siXkPWINumVYEJ2e
 DPYc/PLkoJD4Jw/BNWygfdSw8/wCtKYURn14SPBw7zuT7VbXArh+KcvTAJCW2K31ZcdT
 P5ZP4Nm6PYWmanQJf88SuB1+zMDKcg4+HfjuzvQMXIW5oYEjm477EF4ObR/k7R9cR/l0
 WS4RCluzwLJb7ovW1fyU4Rk4e6JzMpzGMA4rB9RGFiDB9Ryuw2D4f9ML6kESGtAWevWu
 S1GA==
X-Gm-Message-State: AOAM53117mxRZq4fxwlzc0C231kMzSfTJFvadGkZfGz0uJ5XlCQ3kB+x
 Yvq8NWsmoltHUUBWItJOj93p0K/zmYWu4aWZbFo=
X-Google-Smtp-Source: ABdhPJwKxJBZAXv/SC7mdaGufQfqAQXm0UqBb5rpyK8VQIckPSoy5NjMixQOSxEm1nfiSw2knEhc9WDFntv0vlUHgXM=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr23885496vsl.37.1632293048964; 
 Tue, 21 Sep 2021 23:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
 <CAMuHMdVmTcERvHhLLDrZyC_TDLPU89ksitn0WduJkKqpePCKdg@mail.gmail.com>
 <YUqGWa6q+wYq2vAt@pendragon.ideasonboard.com>
In-Reply-To: <YUqGWa6q+wYq2vAt@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Sep 2021 08:43:57 +0200
Message-ID: <CAMuHMdXRhOmj4upp6Zsn3yb5bRdpg8hrgATWJCA6bSdvD=e1qw@mail.gmail.com>
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

On Wed, Sep 22, 2021 at 3:27 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Sep 21, 2021 at 05:53:52PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Jul 28, 2021 at 6:26 PM Laurent Pinchart wrote:
> > > The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> > > can operate in either DSI or CSI-2 mode, with up to four data lanes.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > > @@ -0,0 +1,118 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > +
> > > +description: |
> > > +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> > > +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> > > +  to four data lanes.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Functional clock
> > > +      - description: DSI (and CSI-2) functional clock
> > > +      - description: PLL reference clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: fck
> > > +      - const: dsi
> > > +      - const: pll
> >
> > No interrupts?
> > The hardware manual says there are 9 interrupts.
>
> Who comes up with such insanely high numbers of interrupts ? :-)
>
> What the hardware manual doesn't document is how interrupts are mapped.
> There's indeed 9 of them, and there are 9 interrupt sources, but that's
> all we know. I can easily add a
>
>   interrupts:
>     maxItems: 9
>
> but I can add interrupt names without additional information. It may be
> possible to deduce some of the interrupt mappings from experiments, but
> not all of them. What do you think would be a good way forward ? Leave
> the interrupts out for now as we don't have the information ? Only list
> the interrupts but not their names ? Something else ?

I think what we did in the past is not list the interrupts at all.
They can be added once we receive more documentation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
