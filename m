Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FAD38AFF1
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 15:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F5F6E159;
	Thu, 20 May 2021 13:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0CC6E2E3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 13:25:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C73B610A1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621517120;
 bh=ZGR0d1utfxvQm3s0niYerfupf8fQvgD1F1Vf6QEpFTQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IXW65ZzioDVPpl+gzUyMI7M0QoFYoDQ0n55Jigm9jcR1TrXz764f5RO555kqg1dgS
 +59mcs5flYcU+0f1rFAoFe9rsMmFbdg6NdLm97gxNtobggpXUyFZrdolLMEiypJY5E
 cKA3ALOxntTIfnBmr94MP95KzRU7w2Qj4WyArEzPGceHu6fcpBcJSUAzuhQEjeBIC0
 HCw/kXVbZsToel77d5YBHK4zxdRsL9rbmbT6u1XtU4j4JiCqI9OMV5lsQbSElz+NJ/
 sU4yw79M9FHu5fq9GK62cYcRgvw6/MUSq8M0chxk840k/b5ooVe+7hT0pbretYqesF
 MjgN9G723EnIw==
Received: by mail-ej1-f44.google.com with SMTP id lz27so25250318ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 06:25:20 -0700 (PDT)
X-Gm-Message-State: AOAM532XuGoJQHaWRm4xyEd6FyrbKdaQJNRQPG8Dun1qY5E2yB9AVCZd
 6RvaF9Z4SQeZ6y/aGOyFnzumfWuxHjRNgJU0/Q==
X-Google-Smtp-Source: ABdhPJyYRw8Cvw8jFOxekcPR1d+Gtnv+Q16LLY5HiWSVWHW/5gWy/2iRMsHIUVSQpFkOEVzkI/Xk0CeumJ0LRI12PjY=
X-Received: by 2002:a17:907:724b:: with SMTP id
 ds11mr4688567ejc.108.1621517119203; 
 Thu, 20 May 2021 06:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
 <20210519200156.GA3535665@robh.at.kernel.org>
 <CAD=FV=XNaB8fVvwwHPgo8wPmG3EmJ68u_3o8qpPXn4YobNokAA@mail.gmail.com>
In-Reply-To: <CAD=FV=XNaB8fVvwwHPgo8wPmG3EmJ68u_3o8qpPXn4YobNokAA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 May 2021 08:25:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL9p1nOQs5V5xN167E860Gm+3dTRaOwpv2X+AP=cM1Q_g@mail.gmail.com>
Message-ID: <CAL_JsqL9p1nOQs5V5xN167E860Gm+3dTRaOwpv2X+AP=cM1Q_g@mail.gmail.com>
Subject: Re: [PATCH v7 03/10] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
To: Doug Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 4:06 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, May 19, 2021 at 1:02 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, May 17, 2021 at 01:09:00PM -0700, Douglas Anderson wrote:
> > > We want to be able to list an eDP panel as a child of a ti-sn65dsi86
> > > node to represent the fact that the panel is connected to the bridge's
> > > DP AUX bus. Though the panel and the bridge chip are connected in
> > > several ways, the DP AUX bus is the primary control interface between
> > > the two and thus makes the most sense to model in device tree
> > > hierarchy.
> > >
> > > Listing a panel in this way makes it possible for the panel driver to
> > > easily get access to the DP AUX bus that it resides on, which can be
> > > useful to help in auto-detecting the panel and for turning on various
> > > bits.
> > >
> > > NOTE: it's still possible to continue using the bridge chip and point
> > > to a panel that _isn't_ listed as a child of the bridge chip (since
> > > it's worked that way previously), but that should be deprecated since
> > > there is no downside to listing the panel under the bridge chip.
> > >
> > > The idea for this bus's design was hashed out over IRC [1].
> > >
> > > [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > Possibly we might want something fancier that could be included by
> > > other eDP controller bindings. If we want to do this, I'd love to be
> > > pointed at a good example to follow.
> > >
> > > Changes in v7:
> > > - ti-sn65dsi86: Add aux-bus child patch new for v7.
> > >
> > >  .../bindings/display/bridge/ti,sn65dsi86.yaml | 22 ++++++++++++++++++-
> > >  1 file changed, 21 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > index 26932d2e86ab..51f5a29e216c 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > @@ -70,6 +70,11 @@ properties:
> > >      const: 1
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > >
> > > +  aux-bus:
> >
> > As this is a node:
> >
> > type: object
> >
> > > +    description:
> > > +      It is recommended that you place your panel under the aux-bus node
> > > +      here to represent the control hierarchy.
> > > +
> > >    ports:
> > >      $ref: /schemas/graph.yaml#/properties/ports
> > >
> > > @@ -201,11 +206,26 @@ examples:
> > >
> > >            port@1 {
> > >              reg = <1>;
> > > -            endpoint {
> > > +            sn65dsi86_out: endpoint {
> > >                remote-endpoint = <&panel_in_edp>;
> > >              };
> > >            };
> > >          };
> > > +
> > > +        aux-bus {
> > > +          panel {
> >
> > We should perhaps have a separate aux-bus schema.
>
> Yeah. Before spending lots of time digging into how to do this I
> wanted to see if anyone was going to give me a big-old NAK on the
> whole approach. ;-)
>
> I guess I'd make a file called "dp-aux-bus.yaml" (maybe right under
> bindings/display?) and then I'd include it like this:
>
> aux-bus:
>   $ref: "../dp-aux-bus.yaml#"

Right.

> > Something should
> > define the child node is 'panel' and nothing else.
>
> At the moment the code also requires that the node name is 'aux-bus'.
> Any objections to that?

No. There's 2 ways to do that. The above does and adding $nodename in
dp-aux-bus.yaml will. The latter also means the schema will be applied
automatically to any node named 'aux-bus'. That means the schema will
be applied twice unless you have 'select: false'. The main advantage
of the latter case is it gets applied even without all the users
converted to schema.

> > Though perhaps
> > connectors are valid too?
>
> They might be. We could always add it later?

Sure.

Rob
