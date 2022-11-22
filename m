Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD7963339F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 04:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884510E362;
	Tue, 22 Nov 2022 03:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCF610E360
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 03:00:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B633890;
 Tue, 22 Nov 2022 04:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669086043;
 bh=Z5nJ8q0xaYleeoTP9dGIkZ/5BZsSiq7N4M/09+3v7TE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uwg14CrsCvoLYn1GybJu1yEasa8M/aCDZgmTv/ayiWL59b7EkjIxalTfIzBv9Yjmi
 EV6AHH+QkiEuC1CfV4EWnqmOa9722eZNVg6iwaw/VggLENkG7FlLAYCUa5J++HRRbH
 q8OS/ObpjnT+i3vawFvsIywPZZYJeRS9ueVMJhJ4=
Date: Tue, 22 Nov 2022 05:00:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v1 4/8] arm64: dts: renesas: r8a779g0: Add display
 related data
Message-ID: <Y3w7TLxwWKez8IVu@pendragon.ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-5-tomi.valkeinen@ideasonboard.com>
 <166869741913.50677.3537704052215375530@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166869741913.50677.3537704052215375530@Monstersaurus>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 03:03:39PM +0000, Kieran Bingham wrote:
> Quoting Tomi Valkeinen (2022-11-17 12:25:43)
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > 
> > Add DT nodes for components needed to get the DSI output working:
> > - FCPv
> > - VSPd
> > - DU
> > - DSI
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 129 ++++++++++++++++++++++
> >  1 file changed, 129 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > index 45d8d927ad26..31d4930c5adc 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > @@ -1207,6 +1207,135 @@ prr: chipid@fff00044 {
> >                         compatible = "renesas,prr";
> >                         reg = <0 0xfff00044 0 4>;
> >                 };
> 
> I think these nodes are supposed to be in sort order based on the
> register address in memory.
> 
> Disregarding sort order, I'll review the node contents.
> 
> I would probably s/data/nodes/ in $SUBJECT too.
> 
> > +
> > +               fcpvd0: fcp@fea10000 {
> > +                       compatible = "renesas,fcpv";
> > +                       reg = <0 0xfea10000 0 0x200>;
> > +                       clocks = <&cpg CPG_MOD 508>;
> > +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 508>;
> > +               };
> > +
> > +               fcpvd1: fcp@fea11000 {
> > +                       compatible = "renesas,fcpv";
> > +                       reg = <0 0xfea11000 0 0x200>;
> > +                       clocks = <&cpg CPG_MOD 509>;
> > +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 509>;
> > +               };
> 
> I'm intrigued at the length of 0x200 as I only see 3 registers up to
> 0x0018 ..
> 
> But all existing platforms with fcpv* set 0x200 ... so lets cargo cult it up... :-)
> 
> > +
> > +               vspd0: vsp@fea20000 {
> > +                       compatible = "renesas,vsp2";
> > +                       reg = <0 0xfea20000 0 0x5000>;
> 
> """
> Below are the base addresses of each VSP unit. VSPX has 32Kbyte address
> space. VSPD has 28Kbyte address space.
> """
> 
> Hrm : 28K is 0x7000
> 
> RPf n OSD CLUT Table: H’4000 + H’0400*n to H’43fc + H’0400*n
> 
>  0x43fc+(0x400*5)
> 	22524	[0x57fc]
> 
> So this needs to be /at least/ 0x6000 (Would 0x5800 be odd?) and perhaps as it clearly states
> 28k, we should just set it to 0x7000.

I'd go for 0x7000 indeed.

> > +                       interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 830>;
> > +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 830>;
> > +
> > +                       renesas,fcp = <&fcpvd0>;
> > +               };
> > +
> > +               vspd1: vsp@fea28000 {
> > +                       compatible = "renesas,vsp2";
> > +                       reg = <0 0xfea28000 0 0x5000>;
> 
> Same here of course (reg = <0 0xfea28000 0 0x7000>)
> 
> > +                       interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 831>;
> > +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 831>;
> > +
> > +                       renesas,fcp = <&fcpvd1>;
> > +               };
> > +
> > +               du: display@feb00000 {
> > +                       compatible = "renesas,du-r8a779g0";
> > +                       reg = <0 0xfeb00000 0 0x40000>;
> > +                       interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 411>;
> > +                       clock-names = "du.0";
> > +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 411>;
> > +                       reset-names = "du.0";
> > +                       renesas,vsps = <&vspd0 0>, <&vspd1 0>;
> > +
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@0 {
> > +                                       reg = <0>;
> > +                                       du_out_dsi0: endpoint {
> > +                                               remote-endpoint = <&dsi0_in>;
> > +                                       };
> > +                               };
> > +
> > +                               port@1 {
> > +                                       reg = <1>;
> > +                                       du_out_dsi1: endpoint {
> > +                                               remote-endpoint = <&dsi1_in>;
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> > +
> > +               dsi0: dsi-encoder@fed80000 {
> > +                       compatible = "renesas,r8a779g0-dsi-csi2-tx";
> > +                       reg = <0 0xfed80000 0 0x10000>;
> > +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +                       clocks = <&cpg CPG_MOD 415>,
> > +                                <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> > +                                <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> > +                       clock-names = "fck", "dsi", "pll";
> > +                       resets = <&cpg 415>;
> 
> blank line here to separate it, and highlight that it's disabled? (Like
> is done for DU?
> 
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@0 {
> > +                                       reg = <0>;
> > +                                       dsi0_in: endpoint {
> > +                                               remote-endpoint = <&du_out_dsi0>;
> > +                                       };
> > +                               };
> > +
> > +                               port@1 {
> > +                                       reg = <1>;
> > +                               };
> > +                       };
> > +               };
> > +
> > +               dsi1: dsi-encoder@fed90000 {
> > +                       compatible = "renesas,r8a779g0-dsi-csi2-tx";
> > +                       reg = <0 0xfed90000 0 0x10000>;
> > +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +                       clocks = <&cpg CPG_MOD 416>,
> > +                                <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> > +                                <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> > +                       clock-names = "fck", "dsi", "pll";
> > +                       resets = <&cpg 416>;
> 
> Same.
> 
> With the VSPD register ranges increased accordingly:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > +                       status = "disabled";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@0 {
> > +                                       reg = <0>;
> > +                                       dsi1_in: endpoint {
> > +                                               remote-endpoint = <&du_out_dsi1>;
> > +                                       };
> > +                               };
> > +
> > +                               port@1 {
> > +                                       reg = <1>;
> > +                               };
> > +                       };
> > +               };
> > +

Extra blank line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >         };
> >  
> >         timer {

-- 
Regards,

Laurent Pinchart
