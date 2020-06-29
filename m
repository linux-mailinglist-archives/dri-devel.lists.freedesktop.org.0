Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2605F20CD2D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 10:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A956E41F;
	Mon, 29 Jun 2020 08:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665856E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:11:45 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 68F48804A4;
 Mon, 29 Jun 2020 10:11:42 +0200 (CEST)
Date: Mon, 29 Jun 2020 10:11:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 6/4] dt-bindings: display: renesas: lvds: RZ/G2E needs
 renesas,companion too
Message-ID: <20200629081140.GG227119@ravnborg.org>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWL9xhzbVhZ6N1xbh+YmP_RBMO4H1uMXXexbJXq6amcLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWL9xhzbVhZ6N1xbh+YmP_RBMO4H1uMXXexbJXq6amcLA@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=yC-0_ovQAAAA:8 a=tBb2bbeoAAAA:8
 a=e5mUnYsNAAAA:8 a=vFHsjM1-0c_F3_rMw0gA:9 a=CjuIK1q_8ugA:10
 a=CojVow1nldcA:10 a=D0XLA9XvdZm18NrgonBM:22 a=QsnFDINu91a9xkgZirup:22
 a=Oj-tNtZlA1e06AYgeCfH:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 08:44:19AM +0200, Geert Uytterhoeven wrote:
> On Thu, May 14, 2020 at 1:39 AM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Document RZ/G2E support for property renesas,companion.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> > @@ -81,9 +81,9 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description:
> >        phandle to the companion LVDS encoder. This property is mandatory
> > -      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> > -      the second encoder to be used as a companion in dual-link mode. It
> > -      shall not be set for any other LVDS encoder.
> > +      for the first LVDS encoder on D3, R-Car E3 and RZ/G2E SoCs, and shall
> 
> R-Car D3 and E3, and RZ/G2E SoCs
> 
> > +      point to the second encoder to be used as a companion in dual-link mode.
> > +      It shall not be set for any other LVDS encoder.

Laurent, I assume you will re-spin a ne version wth the changelog
corrected.

	Sam

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
