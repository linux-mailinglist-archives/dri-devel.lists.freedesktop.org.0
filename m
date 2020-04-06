Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEE019FE13
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 21:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D436E0E3;
	Mon,  6 Apr 2020 19:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358616E0E3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:29:17 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3278F2072F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 19:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586200793;
 bh=zdj7yojVhBaB/Gk/gXB9gngRJZ5TCmP70WrifeTeWPo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kesdoxmkVgj2Dqv1tQt4fCw9H0dMsOgGP9qPRjv6lxpDGHTZFQ1uelps6tnsNLOnV
 9nh0Bo+fqKkQzQGZ419+d2v7FAG5G+QsZIATy+uKnjZeOBlQSb+tW7Q+Cgyo0nqrRD
 y8IuKO4hOpB0d8gYWFzx/ahsF9E58viGQiCokusg=
Received: by mail-qt1-f182.google.com with SMTP id b10so714317qtt.9
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 12:19:53 -0700 (PDT)
X-Gm-Message-State: AGi0PuZNW4IwPtZBGFwJ8Q8jYAglxNYdejlvPA/p7LjUxt3h48VyxzYI
 smj9mH7mstOZUCAc4A5TGsFBZyRbWK/FB5NC8g==
X-Google-Smtp-Source: APiQypJ1VgDGdNpHhWosDRaYn1Rfz/zEmplt4aAY7f96THP6EXWe5/sr8OVtCQdWt8FkwVCSRsBVmdwCf83I3b/uFa0=
X-Received: by 2002:ac8:2668:: with SMTP id v37mr1115420qtv.143.1586200792283; 
 Mon, 06 Apr 2020 12:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXJcw0eGY7J=JcGv6Hs9E_GCybsYSeKKeH5pAH8nkdTrg@mail.gmail.com>
 <20200406110924.GB4757@pendragon.ideasonboard.com>
 <CAMuHMdWhj1uS6v1bb0ntsP_b29Sgw+M6KHPceDxmeF3329Aw=g@mail.gmail.com>
In-Reply-To: <CAMuHMdWhj1uS6v1bb0ntsP_b29Sgw+M6KHPceDxmeF3329Aw=g@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 6 Apr 2020 13:19:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKhdQdfX4bHe2dxR_TiK2jWpdY=pacHOme+qaJ-MdN_fg@mail.gmail.com>
Message-ID: <CAL_JsqKhdQdfX4bHe2dxR_TiK2jWpdY=pacHOme+qaJ-MdN_fg@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas,lvds: Convert
 binding to YAML
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 5:40 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Laurent,
>
> On Mon, Apr 6, 2020 at 1:09 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Mon, Apr 06, 2020 at 10:47:37AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Apr 6, 2020 at 1:24 AM Laurent Pinchart wrote:
> > > > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > > > +if:
> > > > +  properties:
> > > > +    compatible:
> > > > +      enum:
> > > > +        - renesas,r8a774c0-lvds
> > > > +        - renesas,r8a77990-lvds
> > > > +        - renesas,r8a77995-lvds
> > > > +then:
> > > > +  properties:
> > > > +    clocks:
> > > > +      minItems: 1
> > > > +      maxItems: 4
> > > > +      items:
> > > > +        - description: Functional clock
> > > > +        - description: EXTAL input clock
> > > > +        - description: DU_DOTCLKIN0 input clock
> > > > +        - description: DU_DOTCLKIN1 input clock
> > > > +
> > > > +    clock-names:
> > > > +      minItems: 1
> > > > +      maxItems: 4
> > > > +      items:
> > > > +        - const: fck
> > > > +        # The LVDS encoder can use the EXTAL or DU_DOTCLKINx clocks.
> > > > +        # These clocks are optional.
> > > > +        - enum:
> > > > +          - extal
> > > > +          - dclkin.0
> > > > +          - dclkin.1
> > > > +        - enum:
> > > > +          - extal
> > > > +          - dclkin.0
> > > > +          - dclkin.1
> > > > +        - enum:
> > > > +          - extal
> > > > +          - dclkin.0
> > > > +          - dclkin.1
> > >
> > > Can the duplication of the last 3 entries be avoided?
> > > Perhaps like in
> > > Documentation/devicetree/bindings/serial/renesas,scif.yaml?
> >
> > I'd love to, if you can tell me how to make sure the fck entry is
> > mandatory. The following
> >
> >   minItems: 1
> >   maxItems: 4
> >   items:
> >     enum:
> >       - fck
> >       - extal
> >       - dclkin.0
> >       - dclkin.1
> >
> > passes the checks, but would accept
> >
> >         clock-names = "extal";
> >
> > which is not valid. Your
> > Documentation/devicetree/bindings/serial/renesas,scif.yaml bindings
> > suffer from the same problem :-)
>
> Hmm....
>
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > > > +
> > > > +    lvds@feb90000 {
> > > > +        compatible = "renesas,r8a7795-lvds";
> > > > +        reg = <0 0xfeb90000 0 0x14>;
> > >
> > > Examples are built with #{address,size}-cells = <1>.
> >
> > Are they ? I don't get any failure from make dt_binding_check.
>
> Hmm... And you do have "reg: maxItems: 1"...

At first glance I was expecting an error too, but there isn't. As far
as the schema is concerned, it's valid because it's a single entry
(i.e. one entry in <>). And then dtc can only check that reg is a
multiple of 2. The size check does work where we have more constraints
like I2C.

If we enforce bracketing, then we should be able to check these.
Otherwise, knowing both the cell sizes and number of entries is a
problem. With bracketing, we can split those checks. I'd been thinking
checking cell sizes would be easier in dtc (we're already doing that
in lots of cases), but thinking about it some more there is a way to
do this with schema:

if:
  properties:
    '#address-cells':
      const: 2
    '#size-cells':
      const: 2
  required:
    - '#address-cells'
    - '#size-cells'
then:
  patternProperties:
    '@':
      properties:
        reg:
          items:
            minItems: 4
            maxItems: 4
      required:
        - reg

...and copy-n-paste for each size combination.

I imagine implementing this will result in another set of fixes.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
