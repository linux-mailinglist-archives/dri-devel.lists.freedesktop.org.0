Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06DE402EE6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 21:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4E6E0B8;
	Tue,  7 Sep 2021 19:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135C96E0B8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 19:17:44 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id t19so125913vkk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 12:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HybJMlAw2y2ijeDg8NtpVEMi7UblwoRmrxRA4Rveu7I=;
 b=d5FrPSnS7tzgy5AgFrc5ZKk2Ti10LVC7rTJLunlzFMZ9yCEch49B7T8o820ye6ySsm
 GGOvjq0HGGcMSUFQ6uSchfkm5fUt1/7R2QGyR7kCMCR9cLig3NOrRcYfSfi9qZWNiaFK
 i5pp1rvvmM3KdvzjV99DTX09Q+ZkSv1rac53VuYBZ8dUWQcT0A9R9GQg0lJpLndrfS0c
 cf58nW/hwA7WlhLqVjysjXz7ZCR1uCUxodprhwTXqApu2AwHLXtkw39/pgQ+jsZH/CAb
 p+b+QgsodD0zwYTz1usqtzX0LfCn2ZG3SMT7RwkC94/IG8jmSuRyZJIvLQMSXeo76yz7
 y4pA==
X-Gm-Message-State: AOAM5324awxOq3Nwo8j6XX0XjdrPQ0tPCYE5EATRg2H+lxHdQmKBP1pI
 tofZlABIkTHG9PfGMToYCEFoO3tV4rcu2IHd4i8=
X-Google-Smtp-Source: ABdhPJyIH0Mriu2yKBIMyY3xYIxiPRQzP7kDyByVOL/e44hGiXY917Ry3aMp6jg6SHq1PM2/3dQZEiN5LGPiKBwRQ6U=
X-Received: by 2002:a1f:d247:: with SMTP id j68mr9449607vkg.7.1631042263032;
 Tue, 07 Sep 2021 12:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210901233655.1602308-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdXHAfg3_VoeXUBT2-QceLR9KQ3pWjz+5=-wK1QRxK14bw@mail.gmail.com>
 <YTezLHrRt/YpOlJZ@robh.at.kernel.org>
In-Reply-To: <YTezLHrRt/YpOlJZ@robh.at.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Sep 2021 21:17:31 +0200
Message-ID: <CAMuHMdXGK=+W=C3c9GV8br9ZvQpAhj4ePiq7m1N8YBo1vzZjvQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: renesas,
 du: Provide bindings for r8a779a0
To: Rob Herring <robh@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

Hi Rob,

On Tue, Sep 7, 2021 at 8:45 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Sep 06, 2021 at 10:13:07AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Sep 2, 2021 at 1:39 AM Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >
> > > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > ---
> > > v2:
> > >  - Collected Laurent's tag
> > >  - Remove clock-names requirement
> > >  - Specify only a single clock
> >
> > Thanks for the update!
> >
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > @@ -39,6 +39,7 @@ properties:
> > >        - renesas,du-r8a77980 # for R-Car V3H compatible DU
> > >        - renesas,du-r8a77990 # for R-Car E3 compatible DU
> > >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > > +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -773,6 +774,55 @@ allOf:
> > >          - reset-names
> > >          - renesas,vsps
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,du-r8a779a0
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: Functional clock
> > > +
> > > +        clock-names:
> > > +          maxItems: 1
> > > +          items:
> > > +            - const: du
> > > +
> > > +        interrupts:
> > > +          maxItems: 2
> > > +
> > > +        resets:
> > > +          maxItems: 1
> > > +
> > > +        reset-names:
> > > +          items:
> > > +            - const: du.0
> >
> > This is now inconsistent with clock-names, which doesn't use a suffix.
>
> But it is consistent with all the other cases of 'reset-names'. The
> problem is 'clock-names' is not consistent and should be 'du.0'.

True.

> Ideally, the if/them schemas should not be defining the names. That
> should be at the top level and the if/them schema just limits the number
> of entries. That's not always possible, but I think is for clocks and
> resets in this case.

It's a bit tricky.
For clocks, there's usually one clock per channel, but not always.
Plus clocks for external inputs, if present.
For resets, there's one reset for a group of channels, with the number
of channels in a group depending on the SoC family.
And then there's the special casing for SoCs where there's a gap in
the channel numbering...

Still wondering if it would be better to have one device node per
channel, and companion links...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
