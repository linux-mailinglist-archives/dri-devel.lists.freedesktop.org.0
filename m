Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AFB546F34
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 23:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C9911A284;
	Fri, 10 Jun 2022 21:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE3211A282
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 21:25:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D10B7B83755
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 21:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE89C3411F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 21:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654896317;
 bh=+yOYQf/molwfJfp3mc62IB7uUe79xlOHDuVNNoHLbxQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PWDDxD/MTpJXCcqo8cDBRdQPlRHGDZEVW2HsxMG6PD/E53sbqsEaK+/jfvyqUHr/3
 d95HuTziadxlfer9hgoZqy8qNANzuuoh525MaZVb5XwHabSscUQGsSp/4SDTl4KBQ4
 Me8KJ/vVhuT1g2hiSW3cxrCYndp09x0BoR+MrGr+//GqYr4CT02mIazMC0E8bMZG16
 EhW5gIAFqKUoIuRFqzaGHREtqlFDpyFQLMyZXT71GUDfzH+Jx1wEWSD0ILinNbwOsM
 Vg93mTsRJGCs9qrMTbuaqR9L2FSsK5nFbY5XX3NSPCnamLaVHxYzLc9daW48g7B4we
 iiP9TIje/5R4A==
Received: by mail-vk1-f181.google.com with SMTP id g15so113981vkm.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 14:25:17 -0700 (PDT)
X-Gm-Message-State: AOAM532SDZZUjChZqgOcy5vuwAc+fQC9oezujI5n5gNrVQGoTHYuXBCB
 Sv4s/XmBBsbN389IAdBGuaj/p6l2nLDPOhJDUA==
X-Google-Smtp-Source: ABdhPJznf30KHWe8+z+YOq+izPos96vlalgcSMg0OYweCf6ENJfJTZBrfLeqOWSlufxTTtn0BIGqeF6S2vYhe3jMi2M=
X-Received: by 2002:a1f:aac7:0:b0:35e:1c45:def with SMTP id
 t190-20020a1faac7000000b0035e1c450defmr11545955vke.35.1654896316529; Fri, 10
 Jun 2022 14:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220610203818.2193593-1-robh@kernel.org>
 <YqOvmrDGgS0AubU4@ravnborg.org>
In-Reply-To: <YqOvmrDGgS0AubU4@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Jun 2022 15:25:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJmkp=LUa+TmFo=3dZAKPhPNMGFWj5jyHq_Q9RxZqz4qw@mail.gmail.com>
Message-ID: <CAL_JsqJmkp=LUa+TmFo=3dZAKPhPNMGFWj5jyHq_Q9RxZqz4qw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel-simple: Add Arm virtual
 platforms display
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Andre Przywara <andre.przywara@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 2:55 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob,
>
> On Fri, Jun 10, 2022 at 02:38:18PM -0600, Rob Herring wrote:
> > 'arm,rtsm-display' is a panel for Arm, Ltd. virtual platforms (e.g. FVP).
> > The binding has been in use for a long time, but was never documented.
> >
> > Some users and an example have a 'panel-dpi' compatible, but that's not
> > needed without a 'panel-timing' node which none of the users have since
> > commit 928faf5e3e8d ("arm64: dts: fvp: Remove panel timings"). The
> > example does have a 'panel-timing' node, but it should not for the
> > same reasons the node was removed in the dts files. So update the
> > example in arm,pl11x.yaml to match the schema.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/display/arm,pl11x.yaml           | 15 +-------------
> >  .../bindings/display/panel/panel-simple.yaml  | 20 +++++++++++++------
> >  2 files changed, 15 insertions(+), 20 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/arm,pl11x.yaml b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
> > index b545c6d20325..6cc9045e5c68 100644
> > --- a/Documentation/devicetree/bindings/display/arm,pl11x.yaml
> > +++ b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
> > @@ -159,25 +159,12 @@ examples:
> >      };
> >
> >      panel {
> > -        compatible = "arm,rtsm-display", "panel-dpi";
> > -        power-supply = <&vcc_supply>;
> > +        compatible = "arm,rtsm-display";
> >
> >          port {
> >              clcd_panel: endpoint {
> >                  remote-endpoint = <&clcd_pads>;
> >              };
> >          };
> > -
> > -        panel-timing {
> > -            clock-frequency = <25175000>;
> > -            hactive = <640>;
> > -            hback-porch = <40>;
> > -            hfront-porch = <24>;
> > -            hsync-len = <96>;
> > -            vactive = <480>;
> > -            vback-porch = <32>;
> > -            vfront-porch = <11>;
> > -            vsync-len = <2>;
> > -        };
> >      };
> >  ...
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 21ba90c9fe33..97afd276c54a 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -19,9 +19,6 @@ description: |
> >
> >    If the panel is more advanced a dedicated binding file is required.
> >
> > -allOf:
> > -  - $ref: panel-common.yaml#
> > -
> >  properties:
> >
> >    compatible:
> > @@ -35,6 +32,8 @@ properties:
> >        - ampire,am-480272h3tmqw-t01h
> >          # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
> >        - ampire,am800480r3tmqwa1h
> > +        # Arm, Ltd. Virtual Platforms Display
> > +      - arm,rtsm-display
> >          # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> >        - auo,b101aw03
> >          # AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> > @@ -340,9 +339,18 @@ properties:
> >
> >  additionalProperties: false
> >
> > -required:
> > -  - compatible
> > -  - power-supply
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +  - if:
> > +      # Most 'simple' panels must have a single supply, but a virtual display does not
> > +      not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              const: arm,rtsm-display
> > +    then:
> > +      required:
> > +        - power-supply
>
> Sorry, but I do not like this change. The beauty of panel-simple is that
> this is a collection of simple display with identical bindings because
> the HW is more or less the same (in general - not in details like size
> etc).
>
> Any panels that requires more are pushed out to their own binding and
> for arm,rtsm-display that would be better.

But I require less...

> It is not this single exceptions that bothers me, it is the many
> exceptions we will have in a few years from now.

Fair enough, I'll make it a separate file.

Rob
