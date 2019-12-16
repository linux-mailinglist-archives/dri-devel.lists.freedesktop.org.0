Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91222121048
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E386E832;
	Mon, 16 Dec 2019 16:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062206E832
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:59:21 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id t26so7272628ioi.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wT7SZ+OLO630PVI5NYrvDjy+jNlP7/vPSuqmUxImjRI=;
 b=mvCGoG390lkQhIGt10C5uJOnQlDLqM7ckcj5+vO5/E5UBpBhaLT0+k2/e7I4DLcEeY
 2ifgfrg+zjpexA6m1T2Ge1sRCpRRTyvEIhEZTAMP9J664HhTWziOuDAb1+iyH7srY7PA
 ozqRWgCYhHDvJDJ5yuT6pDwnFshn+bjNE7YmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wT7SZ+OLO630PVI5NYrvDjy+jNlP7/vPSuqmUxImjRI=;
 b=Qvh5f8RVId+P8mFgu8qfaTlH6A0vK+eWgLF9yishPYfhnhdg7e10iPXMFiP33duqYd
 GRmN8h/BICeG4T8SHClkFyIdwQy6vGuke7JwyiDG4v6OwCV7jzQ3f6RemwVPrAydnIAb
 IcqT9A31gM3HJWoAxexT3rcondBQ7BxpRjEY0XgTMjb0hHchroOMnyhBZA83wYBjdvtc
 KmXqJYZNhX24RdqIwBDccKxRD1kVr81MtfCUo5IKFR9A7zNMOpNbeq5ysCM9dSgfyJlH
 1vJ3kDrWB5ZkE3ymFPL1u20rZkLNIyqW1UavGDEBteaClSF8DLyrqXqxc3hQWsZhsr2V
 huYQ==
X-Gm-Message-State: APjAAAVcsq5On7pxtc/h+9i3Hk1zLCks2k+ZsCYOf7D+/DfaYAOZlErN
 gX4lQAU4cygKfKF6aM8G2xBgfLVxjuQh+pOoA1z0fTXMu1A=
X-Google-Smtp-Source: APXvYqxdRoeWD1Tywgum5/3SAGtinVvAq8t3n49rScn14Yz2lW3axKTMURLW3omvXjZ5mdfPRnnhCaLiPDyJLxS1qSY=
X-Received: by 2002:a05:6602:2504:: with SMTP id
 i4mr19060859ioe.173.1576515559642; 
 Mon, 16 Dec 2019 08:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20191203134816.5319-1-jagan@amarulasolutions.com>
 <20191203134816.5319-2-jagan@amarulasolutions.com>
 <20191204133600.gnv6dnhk6upe7xod@gilmour.lan>
 <CAMty3ZDU57Hj3ZSBC6sSMFWN9-HQadA03hmXUNUVS1W0UQQ3DA@mail.gmail.com>
 <20191216112042.f4xvlgnbm4dk6wkq@gilmour.lan>
In-Reply-To: <20191216112042.f4xvlgnbm4dk6wkq@gilmour.lan>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 16 Dec 2019 22:29:08 +0530
Message-ID: <CAMty3ZBU-XaxR_vM5L2yVbhR5ftfbtDn3jP00qCxBF+owVyqDQ@mail.gmail.com>
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

On Mon, Dec 16, 2019 at 4:50 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Dec 16, 2019 at 04:37:20PM +0530, Jagan Teki wrote:
> > On Wed, Dec 4, 2019 at 7:06 PM Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Tue, Dec 03, 2019 at 07:18:10PM +0530, Jagan Teki wrote:
> > > > The MIPI DSI controller in Allwinner A64 is similar to A33.
> > > >
> > > > But unlike A33, A64 doesn't have DSI_SCLK gating so it is valid
> > > > to have separate compatible for A64 on the same driver.
> > > >
> > > > DSI_SCLK uses mod clock-names on dt-bindings, so the same
> > > > is not required for A64.
> > > >
> > > > On that note
> > > > - A64 require minimum of 1 clock like the bus clock
> > > > - A33 require minimum of 2 clocks like both bus, mod clocks
> > > >
> > > > So, update dt-bindings so-that it can document both A33,
> > > > A64 bindings requirements.
> > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > ---
> > > > Changes for v12:
> > > > - Use 'enum' instead of oneOf+const
> > > >
> > > >  .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 20 +++++++++++++++++--
> > > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > > index dafc0980c4fa..b91446475f35 100644
> > > > --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > > @@ -15,7 +15,9 @@ properties:
> > > >    "#size-cells": true
> > > >
> > > >    compatible:
> > > > -    const: allwinner,sun6i-a31-mipi-dsi
> > > > +    enum:
> > > > +      - allwinner,sun6i-a31-mipi-dsi
> > > > +      - allwinner,sun50i-a64-mipi-dsi
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -24,6 +26,8 @@ properties:
> > > >      maxItems: 1
> > > >
> > > >    clocks:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > >      items:
> > > >        - description: Bus Clock
> > > >        - description: Module Clock
> > > > @@ -63,13 +67,25 @@ required:
> > > >    - reg
> > > >    - interrupts
> > > >    - clocks
> > > > -  - clock-names
> > > >    - phys
> > > >    - phy-names
> > > >    - resets
> > > >    - vcc-dsi-supply
> > > >    - port
> > > >
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +         compatible:
> > > > +           contains:
> > > > +             const: allwinner,sun6i-a31-mipi-dsi
> > > > +      then:
> > > > +        properties:
> > > > +          clocks:
> > > > +            minItems: 2
> > > > +        required:
> > > > +          - clock-names
> > > > +
> > >
> > > Your else condition should check that the number of clocks items is 1
> > > on the A64
> >
> > But the minItems mentioned as 1 in clocks, which is unchanged number
> > by default. doesn't it sufficient?
>
> In the main schema, it's said that the clocks property can have one or
> two elements (to cover the A31 case that has one, and the A64 case
> that has 2).
>
> This is fine.
>
> Later on, you enforce that the A64 has two elements, and this is fine
> too.

Actually A31 case has 2 and A64 case has 1.

>
> However, you never check that on the A31 you only have one clock, and
> you could very well have two and no one would notice.

I did check A31 case for 2 but not in A64. this is what you mean? so
adding A64 check like below would fine?

allOf:
  - if:
      properties:
         compatible:
           contains:
             const: allwinner,sun6i-a31-mipi-dsi
      then:
        properties:
          clocks:
            minItems: 2
        required:
          - clock-names
  - if:
      properties:
         compatible:
           contains:
             const: allwinner,sun50i-a64-mipi-dsi
      then:
        properties:
          clocks:
            minItems: 1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
