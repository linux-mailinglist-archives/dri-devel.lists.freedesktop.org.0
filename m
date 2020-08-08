Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F76B23F8EE
	for <lists+dri-devel@lfdr.de>; Sat,  8 Aug 2020 23:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4CE6E267;
	Sat,  8 Aug 2020 21:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411CC6E267
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 21:05:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi
 [85.76.78.184])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0239F9;
 Sat,  8 Aug 2020 23:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1596920720;
 bh=AC6WiCHH+dGr8IJos7KFwBjM3cGjKVSu3ec5odbnuqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tXwtVQjPzV4sLbaMNwCIziShtaJ5SBIJ1MR1n28bg6BvaQAc3d0D/cBH0CQ/f1HPM
 Qdar0v+DyCxxl1K1mRMJBW/zZysT8Q37JOSDsXnEOGA0GLRXJgc9E1rLUosLOGREhQ
 SWF1GgAwXyILLpHgaAgDPSNTcWAHU1jdgbeU+KH8=
Date: Sun, 9 Aug 2020 00:05:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/7] dt-bindings: display: renesas, lvds: Document r8a7742
 bindings
Message-ID: <20200808210507.GP6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808210321.GO6186@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200808210321.GO6186@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 09, 2020 at 12:03:27AM +0300, Laurent Pinchart wrote:
> Hi Prabhakar,
> 
> Thank you for the patch.
> 
> On Fri, Aug 07, 2020 at 06:49:50PM +0100, Lad Prabhakar wrote:
> > Document the RZ/G1H (R8A7742) LVDS bindings.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I actually spoke too soon, this binding has been concerted to YAML in
drm-next. I can fix this when applying, no need to resubmit just for
this.

> > ---
> >  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > index c62ce2494ed9..40aa809f41cd 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -7,6 +7,7 @@ Gen2, R-Car Gen3 and RZ/G SoCs.
> >  Required properties:
> >  
> >  - compatible : Shall contain one of
> > +  - "renesas,r8a7742-lvds" for R8A7742 (RZ/G1H) compatible LVDS encoders
> >    - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
> >    - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
> >    - "renesas,r8a774a1-lvds" for R8A774A1 (RZ/G2M) compatible LVDS encoders

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
