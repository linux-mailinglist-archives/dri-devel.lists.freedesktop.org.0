Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F238985F
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 23:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CA66EE96;
	Wed, 19 May 2021 21:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E406EE96
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 21:06:19 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id e8so4308333qvp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rrV0j7YUVvQ9ro0u0QUGjNvrEZGZrHvU5ryrt5YfeRs=;
 b=U1IFwZKjSALWLmQnkWT+FZ6THaCzRnuvs9LNdLOH1gdUwrJcSljJp2mdbv0j0f67Hp
 GGdvJkHB5QAc8gaH+BnQ61h+VgY4bkBdafPs/9u0BfMU7hzI8Ot6rMCdrAdfNeTZVI21
 wip7kua1Tq13mnLBds/XBerje9kPZExpHBe5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rrV0j7YUVvQ9ro0u0QUGjNvrEZGZrHvU5ryrt5YfeRs=;
 b=sXbf6R+u5mjyYhIsJFX0bS5RwZ7X9/NK29KjvWjVigj8tS4t73x+cznoBFpOJCvilh
 rEpiYHJAP51FdN5QR/4aeGqtvUbspFsL/GRACI9W2s7lBgEGLptbHAV2e/Q3I9KHLYpU
 WURzPJ1CkZOj4NLSamWaz8e5SfzcN6iRFda3AN4+bIVccB/ZXL3LBf0YRZHR/df6ri46
 0c+57Obj95kl15MWLJKcs/m/lwq3lQgvVkgxEM52UoEfNUS1YgflZxVmTjGNeLpsA5eG
 WBh3lnLpDSY14iub2u05CnKwO+g7g+xIuswSFMqanGki8SwjtaKSw7I5eNgftsIIqFTA
 N9GA==
X-Gm-Message-State: AOAM530mtjWhwRx+AxzHP8sTWdD22tg0proos6+vhq/FCb2qnvTGnx6z
 8VXsVxb24h3BAIqlIt2p/f9Scuxzvftm2A==
X-Google-Smtp-Source: ABdhPJx6TRTzQq5QKfqFZ9JqJJEXcHhSiBVz1bPYWjsJopCSv4kAM5b8qap6CdWQTtwEku0wWHG9PA==
X-Received: by 2002:ad4:4f21:: with SMTP id fc1mr1702885qvb.16.1621458378373; 
 Wed, 19 May 2021 14:06:18 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id t12sm443401qti.22.2021.05.19.14.06.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 14:06:17 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id y2so19892221ybq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:06:17 -0700 (PDT)
X-Received: by 2002:a25:734e:: with SMTP id o75mr2168098ybc.405.1621458376733; 
 Wed, 19 May 2021 14:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
 <20210519200156.GA3535665@robh.at.kernel.org>
In-Reply-To: <20210519200156.GA3535665@robh.at.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 May 2021 14:06:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNaB8fVvwwHPgo8wPmG3EmJ68u_3o8qpPXn4YobNokAA@mail.gmail.com>
Message-ID: <CAD=FV=XNaB8fVvwwHPgo8wPmG3EmJ68u_3o8qpPXn4YobNokAA@mail.gmail.com>
Subject: Re: [PATCH v7 03/10] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
To: Rob Herring <robh@kernel.org>
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

Hi,

On Wed, May 19, 2021 at 1:02 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 17, 2021 at 01:09:00PM -0700, Douglas Anderson wrote:
> > We want to be able to list an eDP panel as a child of a ti-sn65dsi86
> > node to represent the fact that the panel is connected to the bridge's
> > DP AUX bus. Though the panel and the bridge chip are connected in
> > several ways, the DP AUX bus is the primary control interface between
> > the two and thus makes the most sense to model in device tree
> > hierarchy.
> >
> > Listing a panel in this way makes it possible for the panel driver to
> > easily get access to the DP AUX bus that it resides on, which can be
> > useful to help in auto-detecting the panel and for turning on various
> > bits.
> >
> > NOTE: it's still possible to continue using the bridge chip and point
> > to a panel that _isn't_ listed as a child of the bridge chip (since
> > it's worked that way previously), but that should be deprecated since
> > there is no downside to listing the panel under the bridge chip.
> >
> > The idea for this bus's design was hashed out over IRC [1].
> >
> > [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Possibly we might want something fancier that could be included by
> > other eDP controller bindings. If we want to do this, I'd love to be
> > pointed at a good example to follow.
> >
> > Changes in v7:
> > - ti-sn65dsi86: Add aux-bus child patch new for v7.
> >
> >  .../bindings/display/bridge/ti,sn65dsi86.yaml | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > index 26932d2e86ab..51f5a29e216c 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > @@ -70,6 +70,11 @@ properties:
> >      const: 1
> >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> >
> > +  aux-bus:
>
> As this is a node:
>
> type: object
>
> > +    description:
> > +      It is recommended that you place your panel under the aux-bus node
> > +      here to represent the control hierarchy.
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > @@ -201,11 +206,26 @@ examples:
> >
> >            port@1 {
> >              reg = <1>;
> > -            endpoint {
> > +            sn65dsi86_out: endpoint {
> >                remote-endpoint = <&panel_in_edp>;
> >              };
> >            };
> >          };
> > +
> > +        aux-bus {
> > +          panel {
>
> We should perhaps have a separate aux-bus schema.

Yeah. Before spending lots of time digging into how to do this I
wanted to see if anyone was going to give me a big-old NAK on the
whole approach. ;-)

I guess I'd make a file called "dp-aux-bus.yaml" (maybe right under
bindings/display?) and then I'd include it like this:

aux-bus:
  $ref: "../dp-aux-bus.yaml#"


> Something should
> define the child node is 'panel' and nothing else.

At the moment the code also requires that the node name is 'aux-bus'.
Any objections to that?


> Though perhaps
> connectors are valid too?

They might be. We could always add it later?
