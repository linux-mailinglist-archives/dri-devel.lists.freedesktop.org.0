Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F012034C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 12:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06886E4BB;
	Mon, 16 Dec 2019 11:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431866E4BB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:07:32 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z8so4614807ioh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfZaSbdFEASJkf9WsXHl71dcv4ETqMgnXgcnwp3Mq+I=;
 b=dP+KqavQmuo0QMDmi4neiVk93gyhwe17pjwdfjNCR4kaW410MUv5U9XBebG0Af2JUg
 uSjY0f9+4haCQspqumE1JA6bnz8vOxRbsSA26BD2mrXZCVUyRjkx08KynOVeOGtZ0Ok4
 rzKSsE7NpKWocqf5Jm4pm2f4YI9vDE48P61aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfZaSbdFEASJkf9WsXHl71dcv4ETqMgnXgcnwp3Mq+I=;
 b=ZsOEBMbI0fXiKvYMcoaQD5qfhk+ZGrJItnmsZoDzYg0NdsOGvA7OOTa/81kxwG5ONB
 lir9t479vL+oreJeJxLmyF8UmCFFhfmxuEBFJZIXWcYUuhg25AzL4XrRwnAzFwuGxbBI
 VGPR1DyT1Myu7mvBSajOBDVKZbFOClXqcSLQXOyFqLnl+E0LnZ+4jjApWqhP4Gx8BIS3
 Eo4g0dMe1v0SleTNsQiucRQ9hffDWt1zM5eowkeYA1ByPLd4HH5w4pQ/wQSakNF7zz6s
 XAMu31bMVJ6K5Yopn8j1thsSM/u1OmILvAVDhXJGHR6EPUmqHmgTWjoVErcpFa5GVF9T
 rxqQ==
X-Gm-Message-State: APjAAAXihMXgmAr7bSkW7w6HKuoaHDHnWM71B8dvXBRkMIcFcR0y4l25
 xvsBMHZ4KQcmpXpHcGDveMGq/ywWaJ+QDflf0f35Nw==
X-Google-Smtp-Source: APXvYqxYm4/U2soHztfqAotrtRHQmYHhxvY2dRK0oTC0bL7+7SnLpoXa+xv9qJGP1N2VQheZkh2UqTeKeOZ/EbOzqgQ=
X-Received: by 2002:a5d:97c9:: with SMTP id k9mr17260864ios.297.1576494451527; 
 Mon, 16 Dec 2019 03:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
 <20191203134816.5319-2-jagan@amarulasolutions.com>
 <20191204133600.gnv6dnhk6upe7xod@gilmour.lan>
In-Reply-To: <20191204133600.gnv6dnhk6upe7xod@gilmour.lan>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 16 Dec 2019 16:37:20 +0530
Message-ID: <CAMty3ZDU57Hj3ZSBC6sSMFWN9-HQadA03hmXUNUVS1W0UQQ3DA@mail.gmail.com>
Subject: Re: [PATCH v12 1/7] dt-bindings: sun6i-dsi: Document A64 MIPI-DSI
 controller
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 4, 2019 at 7:06 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Dec 03, 2019 at 07:18:10PM +0530, Jagan Teki wrote:
> > The MIPI DSI controller in Allwinner A64 is similar to A33.
> >
> > But unlike A33, A64 doesn't have DSI_SCLK gating so it is valid
> > to have separate compatible for A64 on the same driver.
> >
> > DSI_SCLK uses mod clock-names on dt-bindings, so the same
> > is not required for A64.
> >
> > On that note
> > - A64 require minimum of 1 clock like the bus clock
> > - A33 require minimum of 2 clocks like both bus, mod clocks
> >
> > So, update dt-bindings so-that it can document both A33,
> > A64 bindings requirements.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v12:
> > - Use 'enum' instead of oneOf+const
> >
> >  .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 20 +++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > index dafc0980c4fa..b91446475f35 100644
> > --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > @@ -15,7 +15,9 @@ properties:
> >    "#size-cells": true
> >
> >    compatible:
> > -    const: allwinner,sun6i-a31-mipi-dsi
> > +    enum:
> > +      - allwinner,sun6i-a31-mipi-dsi
> > +      - allwinner,sun50i-a64-mipi-dsi
> >
> >    reg:
> >      maxItems: 1
> > @@ -24,6 +26,8 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > +    minItems: 1
> > +    maxItems: 2
> >      items:
> >        - description: Bus Clock
> >        - description: Module Clock
> > @@ -63,13 +67,25 @@ required:
> >    - reg
> >    - interrupts
> >    - clocks
> > -  - clock-names
> >    - phys
> >    - phy-names
> >    - resets
> >    - vcc-dsi-supply
> >    - port
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +         compatible:
> > +           contains:
> > +             const: allwinner,sun6i-a31-mipi-dsi
> > +      then:
> > +        properties:
> > +          clocks:
> > +            minItems: 2
> > +        required:
> > +          - clock-names
> > +
>
> Your else condition should check that the number of clocks items is 1
> on the A64

But the minItems mentioned as 1 in clocks, which is unchanged number
by default. doesn't it sufficient?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
