Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA331265574
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 01:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982D86E260;
	Thu, 10 Sep 2020 23:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212FC6E260
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 23:22:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51BD13B;
 Fri, 11 Sep 2020 01:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599780164;
 bh=RkOent6SZnyIBOjwmfXF7Wo+KuirlW7Ga/CAbVIH9CI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dn+Jwfx7UY7LuBwBMLsfM2r3c594YqtnwTPj/eB1Vqu4fQj0WnytZ3btYAByeK4Sp
 qc3axucZ9Dnr9VhxHhnjOk/16PIY8QT7Y+uCVAClgB1WJu+gFGZ8EJI1Aw0VXoVYIo
 h3ha5s7N90mox3Uw+TDSDorHdMRXufYUChfPfG6E=
Date: Fri, 11 Sep 2020 02:22:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: renesas: r8a77961: Add DU device
 nodes
Message-ID: <20200910232216.GK3940@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUmfavKH03LRj4WNoOEbu+oY64_Mic74zCfFbK4rO9KSw@mail.gmail.com>
 <87wo11te4z.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wo11te4z.wl-kuninori.morimoto.gx@renesas.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Morimoto-san,

On Fri, Sep 11, 2020 at 08:20:56AM +0900, Kuninori Morimoto wrote:
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > This patch adds DU device nodes for R-Car M3-W+ (r8a77961) SoC.
> > > This patch was tested on R-Car M3-W+ Salvator-XS board.
> > >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
>
> (snip)
>
> > >                 du: display@feb00000 {
> > > +                       compatible = "renesas,du-r8a77961";
> > >                         reg = <0 0xfeb00000 0 0x70000>;
> > > -                       /* placeholder */
> > > +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> > > +                                <&cpg CPG_MOD 722>;
> > > +                       clock-names = "du.0", "du.1", "du.2";
> > > +                       resets = <&cpg 724>, <&cpg 722>;
> > > +                       reset-names = "du.0", "du.2";
> > > +
> > > +                       renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> > > +                       status = "disabled";
> > 
> > Do you want support for CMMs?
> 
> I'm not sure how it works.
> Thus I dropped such features from initial support.
> 
> I hope Laurent or Kieran will support it
> when he received physical board.

I'll be happy to do so :-)

> Some comment for iommu.
> 
> Thank you for your help !!

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
