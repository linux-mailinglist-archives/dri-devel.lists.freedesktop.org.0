Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9582438FF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3606E9B1;
	Thu, 13 Aug 2020 10:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540386E9B1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:59:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83D07551;
 Thu, 13 Aug 2020 12:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597316364;
 bh=MkCO5WRnwp35q3JzVhLn32/9iCBNr/ShuvAxpwbx+0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OEs+ZoQnEGKW2rKPrLo5ZB2ySsOpJ9yrxXrpapBX+kUbnKBvv70r3Vpd7R6fRFpsS
 QJKuhIM+9V/ZzqJ1LP/wkLMTGhx8/NE9nz9F6nLZA5BuiHnSkavsxaC8VJvulh8ppE
 /tEeOHeoESQX91aKUCO0J5nm9nRkgCTmbsdI3aTw=
Date: Thu, 13 Aug 2020 13:59:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,du: Document r8a774e1
 bindings
Message-ID: <20200813105910.GB6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
 <CA+V-a8svAuDx51vuTCH4w5g0oF9qf8sWAEjMDMm+0+9u-UQhQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8svAuDx51vuTCH4w5g0oF9qf8sWAEjMDMm+0+9u-UQhQw@mail.gmail.com>
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

Hello,

On Thu, Aug 13, 2020 at 11:38:03AM +0100, Lad, Prabhakar wrote:
> On Thu, Aug 13, 2020 at 10:05 AM Geert Uytterhoeven wrote:
> > On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar wrote:
> > > From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > >
> > > Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
> > >
> > > Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > index 51cd4d162770..67cded5ad827 100644
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > @@ -10,6 +10,7 @@ Required Properties:
> > >      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
> > >      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
> > >      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> > > +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
> > >      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> > >      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> > >      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> > > @@ -75,6 +76,7 @@ corresponding to each DU output.
> > >   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
> > >   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
> > >   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> > > + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
> >
> > As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
> > instead of port 2?
> >
> > I know we did it the same for R-Car M3-N and RZ/G2N.
> > But my main worry is adding support for R-Car H3-N later.

Why should we do so ? The port number here isn't tied to the DU channel
number. It only identifies the output port. Many DUs can route DU
channel outputs to different output ports.

> I do agree too, with the below diff I tested the LVDS output on RZ/G2N
> Rev2 board and things work fine. But only thing it doesn't explain is
> why does LVDS work on DU2 for G2[H/N] boards :D
> 
> Geert, Laurent, Kieran If you agree with the below changes I shall
> post a proper patch fixing it for RZ/G2[HN]
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index d661724fc28a..0b087d287202 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -2540,8 +2540,8 @@
>                                                 remote-endpoint =
> <&dw_hdmi0_in>;
>                                         };
>                                 };
> -                               port@2 {
> -                                       reg = <2>;
> +                               port@3 {
> +                                       reg = <3>;
>                                         du_out_lvds0: endpoint {
>                                                 remote-endpoint = <&lvds0_in>;
>                                         };
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 3e67cf70f040..419d81c7763e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -153,7 +153,7 @@ static const struct rcar_du_device_info
> rcar_du_r8a774b1_info = {
>                 },
>                 [RCAR_DU_OUTPUT_LVDS0] = {
>                         .possible_crtcs = BIT(0),
> -                       .port = 2,
> +                       .port = 3,
>                 },
>         },
>         .num_lvds = 1,
> 
> > >   R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
> > >   R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
> > >   R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -
> >
> > Apart from that:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
