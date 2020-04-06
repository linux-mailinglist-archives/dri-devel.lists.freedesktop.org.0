Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5619F4E2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806FF6E378;
	Mon,  6 Apr 2020 11:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44DA6E378
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 11:40:28 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 22so15003821otf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 04:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbg7DIum6KX3viMdVj5pwqj5cNuHsNuoxpYrRpMdwUo=;
 b=OagfdVo/nccUjYIQg4yc/+8jk/ZYXEMcisnezfcrRMPAeOF9K0HLOpk9GoQb3woWEy
 EkMtMh9D1MUntq//u8hXSAUxo4S2JD3qGCe5YaGk9FVR+LyhCQk2xrMVjSb6CCpwFqd3
 a/QwzcDkEzt5cO/t/ezW6KgwHcRB5miHftI/8/h6x/I6dES/AHdpyuWbvyXCv1TNddOo
 LmGBPzgrrltEjQ9uw8ZlsfLGQShBiMHLJdZC8C2/1tvA5dNBiu3PQymZWfeZc5nrZcH9
 kzHIjk7N6Z2INehL9BoHq2X3q2wkIADU26mLJNx5ZA0R/aatdPLUmfXTr/NIHDc5QHTi
 oQJg==
X-Gm-Message-State: AGi0PuZmE8WgTqOFlKYhes0nhRQxkgSupo9xHK44d5CQMT+iCUg3JLTy
 KaDY1GwxBzCNSN3yZV4H1EBk57t6XKXN8LQbS/c=
X-Google-Smtp-Source: APiQypKPqvJRqeOqzC4j+4scy+dkCgEgdJpmPPaKExBorHuKEyGk71KwouiImwTYTgXWTESJfoVc8xJbRu11OFUXFTY=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr16783289otl.145.1586173227928; 
 Mon, 06 Apr 2020 04:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXJcw0eGY7J=JcGv6Hs9E_GCybsYSeKKeH5pAH8nkdTrg@mail.gmail.com>
 <20200406110924.GB4757@pendragon.ideasonboard.com>
In-Reply-To: <20200406110924.GB4757@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Apr 2020 13:40:16 +0200
Message-ID: <CAMuHMdWhj1uS6v1bb0ntsP_b29Sgw+M6KHPceDxmeF3329Aw=g@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas,lvds: Convert
 binding to YAML
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Apr 6, 2020 at 1:09 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Apr 06, 2020 at 10:47:37AM +0200, Geert Uytterhoeven wrote:
> > On Mon, Apr 6, 2020 at 1:24 AM Laurent Pinchart wrote:
> > > Convert the Renesas R-Car LVDS encoder text binding to YAML.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      enum:
> > > +        - renesas,r8a774c0-lvds
> > > +        - renesas,r8a77990-lvds
> > > +        - renesas,r8a77995-lvds
> > > +then:
> > > +  properties:
> > > +    clocks:
> > > +      minItems: 1
> > > +      maxItems: 4
> > > +      items:
> > > +        - description: Functional clock
> > > +        - description: EXTAL input clock
> > > +        - description: DU_DOTCLKIN0 input clock
> > > +        - description: DU_DOTCLKIN1 input clock
> > > +
> > > +    clock-names:
> > > +      minItems: 1
> > > +      maxItems: 4
> > > +      items:
> > > +        - const: fck
> > > +        # The LVDS encoder can use the EXTAL or DU_DOTCLKINx clocks.
> > > +        # These clocks are optional.
> > > +        - enum:
> > > +          - extal
> > > +          - dclkin.0
> > > +          - dclkin.1
> > > +        - enum:
> > > +          - extal
> > > +          - dclkin.0
> > > +          - dclkin.1
> > > +        - enum:
> > > +          - extal
> > > +          - dclkin.0
> > > +          - dclkin.1
> >
> > Can the duplication of the last 3 entries be avoided?
> > Perhaps like in
> > Documentation/devicetree/bindings/serial/renesas,scif.yaml?
>
> I'd love to, if you can tell me how to make sure the fck entry is
> mandatory. The following
>
>   minItems: 1
>   maxItems: 4
>   items:
>     enum:
>       - fck
>       - extal
>       - dclkin.0
>       - dclkin.1
>
> passes the checks, but would accept
>
>         clock-names = "extal";
>
> which is not valid. Your
> Documentation/devicetree/bindings/serial/renesas,scif.yaml bindings
> suffer from the same problem :-)

Hmm....

> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > > +
> > > +    lvds@feb90000 {
> > > +        compatible = "renesas,r8a7795-lvds";
> > > +        reg = <0 0xfeb90000 0 0x14>;
> >
> > Examples are built with #{address,size}-cells = <1>.
>
> Are they ? I don't get any failure from make dt_binding_check.

Hmm... And you do have "reg: maxItems: 1"...


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
