Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616262612EC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 16:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6136E849;
	Tue,  8 Sep 2020 14:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8B86E849
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 14:47:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3646247;
 Tue,  8 Sep 2020 16:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599576410;
 bh=RSK952bhlHi49suHIZc7d6qiORR1jel+b2zV6JRNGfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nerJ56Bo/ACyXiuYStye+Z40isGeZr0T2w7UunIrue9jbV1y0Tp/EGavuLZCwNJLJ
 Xqlrz+7LrtNvNUdobIaX68MI0x5n5vtmqPihbFui2aeIU8XngIcl4e3C7mOP8SNIF2
 4jmQZ60eIe9n7jRtWNFavPQA9IPrxPW6Z76owfjA=
Date: Tue, 8 Sep 2020 17:46:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: renesas: dw-hdmi: tidyup
 example compatible.
Message-ID: <20200908144623.GB11405@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhlrtwp.wl-kuninori.morimoto.gx@renesas.com>
 <6e1eedf0-d05f-81cd-e437-33fc4c7337f3@ideasonboard.com>
 <20200908144317.GA11405@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908144317.GA11405@pendragon.ideasonboard.com>
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 05:43:25PM +0300, Laurent Pinchart wrote:
> Hi Kieran,
> 
> On Tue, Sep 08, 2020 at 03:18:20PM +0100, Kieran Bingham wrote:
> > On 08/09/2020 01:34, Kuninori Morimoto wrote:
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > 
> > > required is "renesas,r8a7795-hdmi", instead of "renesas,r8a7795-dw-hdmi"
> > 
> > Hrm, technically the driver will currently only match on :
> >   "renesas,rcar-gen3-hdmi"
> > 
> > But I see how the '-dw-' has probably snuck in from other devices, and
> > is inappropriate.
> > 
> > Perhaps this should be more clear that it matches on the generic compatible:
> > 	renesas,rcar-gen3-hdmi
> > 
> > (or a combination of both?)
> >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > But if the generic isn't required, then this patch alone does fix what I
> > would call an error, so ...
> 
> You're right, the generic compatible string should be required. I'll
> update this patch accordingly, and will address the bindings as part of
> the conversion to YAML.

Proposed new commit:

commit cc487cbb06d841ca76efade63201a41bd04f6015
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date:   Tue Sep 8 09:34:11 2020 +0900

    dt-bindings: display: renesas: dw-hdmi: Tidyup example compatible

    The DT example erronously uses the "renesas,r8a7795-dw-hdmi", when the
    correct value is "renesas,r8a7795-hdmi". It is furthermore missing the
    generic "renesas,rcar-gen3-hdmi" compatible string. Fix it.

    Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
    Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
    Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
    [Add "renesas,rcar-gen3-hdmi" and rework commit message]
    Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index f275997ab947..9c56c5169a88 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -43,7 +43,7 @@ Optional properties:
 Example:

 	hdmi0: hdmi@fead0000 {
-		compatible = "renesas,r8a7795-dw-hdmi";
+		compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
 		reg = <0 0xfead0000 0 0x10000>;
 		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;

> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > We could always make this more clear when converting to YAML.
> >
> > > ---
> > >  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt      | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> > > index 819f3e31013c..e6526ab485d0 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> > > @@ -42,7 +42,7 @@ Optional properties:
> > >  Example:
> > >  
> > >  	hdmi0: hdmi@fead0000 {
> > > -		compatible = "renesas,r8a7795-dw-hdmi";
> > > +		compatible = "renesas,r8a7795-hdmi";
> > >  		reg = <0 0xfead0000 0 0x10000>;
> > >  		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
> > >  		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
