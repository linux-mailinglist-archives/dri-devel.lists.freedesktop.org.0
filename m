Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAAC245CFC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3B56E420;
	Mon, 17 Aug 2020 07:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9656E203
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 11:09:25 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id x10so3062222ybj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+FdrfrzUYGESkY5nR/Iw5dDnYK/s8TkEFw8YlZ8IoPA=;
 b=hhFDjW9tbqs1Ztzrt/0JJWGsCwXM8Khk4AIkUF+5JlNcxp4f0JlCocua2RnfhPbG8x
 hoCLrrI2CzIo9DVV/uk1BD+2BFMmyKjhT4j+udkBY+B3lpOHX38IEwXpa4PapwCGN+72
 SPpBRoX3A3V+ANN0jV1BzwxpMWCTnUpbusGIw0uAXBVVgahS5r8EG8rwLxVdIjcR9L0Y
 MR6UhaEwfR8ncUixSfXQpHx/7HrZccRMfNeDJYbCSHgRLdwOl6j9VRPTC/SuUQF8/wci
 TvjBP4NM55Ylx9aCH3BkmVtljB+/NbfyjXHkPHy318NyyQKn6XIMMirqtsaYE8yr40A5
 demA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+FdrfrzUYGESkY5nR/Iw5dDnYK/s8TkEFw8YlZ8IoPA=;
 b=H61sQ+J82rLd8zFeUFhzRWpCKWHxk8BjTR2RLTL5nuZGYl/LwksxNQZEkiX7gW5W1V
 OgCgTlTmRUTG/d4TCynaVVFhSiINkUqhjIl0i31uAzpqv02dyyuONm9+T1Y4cIszriQ0
 a0W1WUC7ixbY6R6aYoFw7S/4aYieJ6H3z8Xh/XAu5HtWuPS11m3qJXlIkfUuqCOThGVx
 OHGruMgnkOLSaK39//xNRbT+b8I3aMIoZkbc2fKSRvLV3JgJrpOTdvEpzhBEdEiAOHAR
 sPfpiNATmTTstnY9NRhdFd6SIASqgzZTp3T93UIB5b2WM7koGDkrlNWl3oY8Vx6dsiL2
 LXVg==
X-Gm-Message-State: AOAM531mbsNh2eZ/4L4g6cVkCLpdXJp0BcyttRnX9hQwY2XguxZyVfnC
 o9VmMy4rR/9r5CSQK1P4AdVmn0A3VupuetE0dw4=
X-Google-Smtp-Source: ABdhPJxKeZMHzQR81am/qi1CITAjrBfwbP5SaZgc5j843o+QifzGhzSPXvA2PGEL0nrcsoL7/vIHQXSUoMFWAiiCDBM=
X-Received: by 2002:a25:c743:: with SMTP id w64mr5573010ybe.127.1597316964657; 
 Thu, 13 Aug 2020 04:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
 <CA+V-a8svAuDx51vuTCH4w5g0oF9qf8sWAEjMDMm+0+9u-UQhQw@mail.gmail.com>
 <20200813105910.GB6057@pendragon.ideasonboard.com>
In-Reply-To: <20200813105910.GB6057@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Aug 2020 12:08:58 +0100
Message-ID: <CA+V-a8sRQ_R4UGkSjrZ7Rq5nUqTwPtbvuuT0t69mM8M8ZeTkRQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,
 du: Document r8a774e1 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, Aug 13, 2020 at 11:59 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Thu, Aug 13, 2020 at 11:38:03AM +0100, Lad, Prabhakar wrote:
> > On Thu, Aug 13, 2020 at 10:05 AM Geert Uytterhoeven wrote:
> > > On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar wrote:
> > > > From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > >
> > > > Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
> > > >
> > > > Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > > index 51cd4d162770..67cded5ad827 100644
> > > > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > > > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > > @@ -10,6 +10,7 @@ Required Properties:
> > > >      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
> > > >      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
> > > >      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> > > > +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
> > > >      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> > > >      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> > > >      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> > > > @@ -75,6 +76,7 @@ corresponding to each DU output.
> > > >   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
> > > >   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
> > > >   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> > > > + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
> > >
> > > As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
> > > instead of port 2?
> > >
> > > I know we did it the same for R-Car M3-N and RZ/G2N.
> > > But my main worry is adding support for R-Car H3-N later.
>
> Why should we do so ? The port number here isn't tied to the DU channel
> number. It only identifies the output port. Many DUs can route DU
> channel outputs to different output ports.
>
The binding document (renesas,du.txt) does state that "The following
table lists for each supported model the port number corresponding to
each DU output.", hence the confusion.

Cheers,
Prabhakar

> > I do agree too, with the below diff I tested the LVDS output on RZ/G2N
> > Rev2 board and things work fine. But only thing it doesn't explain is
> > why does LVDS work on DU2 for G2[H/N] boards :D
> >
> > Geert, Laurent, Kieran If you agree with the below changes I shall
> > post a proper patch fixing it for RZ/G2[HN]
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> > index d661724fc28a..0b087d287202 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> > @@ -2540,8 +2540,8 @@
> >                                                 remote-endpoint =
> > <&dw_hdmi0_in>;
> >                                         };
> >                                 };
> > -                               port@2 {
> > -                                       reg = <2>;
> > +                               port@3 {
> > +                                       reg = <3>;
> >                                         du_out_lvds0: endpoint {
> >                                                 remote-endpoint = <&lvds0_in>;
> >                                         };
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 3e67cf70f040..419d81c7763e 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -153,7 +153,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a774b1_info = {
> >                 },
> >                 [RCAR_DU_OUTPUT_LVDS0] = {
> >                         .possible_crtcs = BIT(0),
> > -                       .port = 2,
> > +                       .port = 3,
> >                 },
> >         },
> >         .num_lvds = 1,
> >
> > > >   R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
> > > >   R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
> > > >   R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -
> > >
> > > Apart from that:
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
