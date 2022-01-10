Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B9489437
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3912AE3D;
	Mon, 10 Jan 2022 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8A812AE36
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:51:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA002A50;
 Mon, 10 Jan 2022 09:51:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641804673;
 bh=rGzc5rUjmJsejms3ZrLe/Z/dM1/lyxsEdelYlzXgkHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5zgFufXtugVGnjHyea6+l4u5wlRlVRICIpz1U/q0qpcUQ9mOxbo68YrwxVvSh+Di
 O37xM5XFMRE6m0/jx+a+ozPRN5N/enZqoI5kzgexkjgNchtFqy0n4adNMbtiqAGYYC
 vcvW9xIptnNrLiNJ1+/IvP7DGb3ykzXl7dVZRgpY=
Date: Mon, 10 Jan 2022 10:51:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
Message-ID: <YdvzeJ09N6Zqa+EJ@pendragon.ideasonboard.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
 <CAMuHMdVqUcjRQHD898Ja4R0X3QpXvTODE8=pG7UjJ-NtHTFSDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVqUcjRQHD898Ja4R0X3QpXvTODE8=pG7UjJ-NtHTFSDA@mail.gmail.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Mon, Jan 10, 2022 at 09:43:58AM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 29, 2021 at 5:56 PM Laurent Pinchart wrote:
> > On Fri, Dec 24, 2021 at 08:23:08AM +0300, Nikita Yushchenko wrote:
> > > Add the missing lvds0 node for the R-Car M3-W+ SoC.
> > >
> > > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 27 +++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > > index 86d59e7e1a87..a34d5b1d6431 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > > @@ -2718,6 +2718,33 @@ du_out_hdmi0: endpoint {
> > >                               port@2 {
> > >                                       reg = <2>;
> > >                                       du_out_lvds0: endpoint {
> > > +                                             remote-endpoint = <&lvds0_in>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             lvds0: lvds@feb90000 {
> > > +                     compatible = "renesas,r8a77961-lvds";
> > > +                     reg = <0 0xfeb90000 0 0x14>;
> > > +                     clocks = <&cpg CPG_MOD 727>;
> > > +                     power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> > > +                     resets = <&cpg 727>;
> > > +                     status = "disabled";
> > > +
> > > +                     ports {
> > > +                             #address-cells = <1>;
> > > +                             #size-cells = <0>;
> > > +
> > > +                             port@0 {
> > > +                                     reg = <0>;
> > > +                                     lvds0_in: endpoint {
> > > +                                             remote-endpoint = <&du_out_lvds0>;
> > > +                                     };
> > > +                             };
> > > +                             port@1 {
> > > +                                     reg = <1>;
> > > +                                     lvds0_out: endpoint {
> > >                                       };
> >
> > Endpoints must have a remote-endpoint property. Let's drop the endpoint
> > here and keep the port only, the endpoint can be declared in board
> > files.
> >
> > If you're fine with this change I can make it when applying the patch.
> 
> Isn't this patch for me to apply to renesas-devel?

Even better indeed :-)

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
