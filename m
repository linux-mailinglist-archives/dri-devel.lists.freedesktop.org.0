Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48562DEF4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9161D10E61C;
	Thu, 17 Nov 2022 15:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5C710E61C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:03:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86CED929;
 Thu, 17 Nov 2022 16:03:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668697421;
 bh=LyYn0sdB63GI65NHTIo4dhBHSGZrdHRZMyOLF8zyaCQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QXq+U4W1eyGgKAhpZ901UsMyA60SLLlr5yVjlSCVDpraDu71kVExb1hPsLS/qp+Yn
 MjzllUhC1dw53L9ylHUHeq6ajdEs4DzOg7683MPFijwFnocy9g110cdzF9B1z45jFo
 mf0sphZHPV7xVOUziKFiprR5bwZiq2tk7rc/+aQQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221117122547.809644-5-tomi.valkeinen@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-5-tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 4/8] arm64: dts: renesas: r8a779g0: Add display related
 data
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 17 Nov 2022 15:03:39 +0000
Message-ID: <166869741913.50677.3537704052215375530@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tomi Valkeinen (2022-11-17 12:25:43)
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> Add DT nodes for components needed to get the DSI output working:
> - FCPv
> - VSPd
> - DU
> - DSI
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 129 ++++++++++++++++++++++
>  1 file changed, 129 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 45d8d927ad26..31d4930c5adc 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -1207,6 +1207,135 @@ prr: chipid@fff00044 {
>                         compatible =3D "renesas,prr";
>                         reg =3D <0 0xfff00044 0 4>;
>                 };

I think these nodes are supposed to be in sort order based on the
register address in memory.

Disregarding sort order, I'll review the node contents.

I would probably s/data/nodes/ in $SUBJECT too.


> +
> +               fcpvd0: fcp@fea10000 {
> +                       compatible =3D "renesas,fcpv";
> +                       reg =3D <0 0xfea10000 0 0x200>;
> +                       clocks =3D <&cpg CPG_MOD 508>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 508>;
> +               };
> +
> +               fcpvd1: fcp@fea11000 {
> +                       compatible =3D "renesas,fcpv";
> +                       reg =3D <0 0xfea11000 0 0x200>;
> +                       clocks =3D <&cpg CPG_MOD 509>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 509>;
> +               };

I'm intrigued at the length of 0x200 as I only see 3 registers up to
0x0018 ..

But all existing platforms with fcpv* set 0x200 ... so lets cargo cult it u=
p... :-)

> +
> +               vspd0: vsp@fea20000 {
> +                       compatible =3D "renesas,vsp2";
> +                       reg =3D <0 0xfea20000 0 0x5000>;

"""
Below are the base addresses of each VSP unit. VSPX has 32Kbyte address
space. VSPD has 28Kbyte address space.
"""

Hrm : 28K is 0x7000

RPf n OSD CLUT Table: H=E2=80=994000 + H=E2=80=990400*n to H=E2=80=9943fc +=
 H=E2=80=990400*n

 0x43fc+(0x400*5)
	22524	[0x57fc]

So this needs to be /at least/ 0x6000 (Would 0x5800 be odd?) and perhaps as=
 it clearly states
28k, we should just set it to 0x7000.



> +                       interrupts =3D <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD 830>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 830>;
> +
> +                       renesas,fcp =3D <&fcpvd0>;
> +               };
> +
> +               vspd1: vsp@fea28000 {
> +                       compatible =3D "renesas,vsp2";
> +                       reg =3D <0 0xfea28000 0 0x5000>;

Same here of course (reg =3D <0 0xfea28000 0 0x7000>)


> +                       interrupts =3D <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD 831>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 831>;
> +
> +                       renesas,fcp =3D <&fcpvd1>;
> +               };
> +
> +               du: display@feb00000 {
> +                       compatible =3D "renesas,du-r8a779g0";
> +                       reg =3D <0 0xfeb00000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD 411>;
> +                       clock-names =3D "du.0";
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 411>;
> +                       reset-names =3D "du.0";
> +                       renesas,vsps =3D <&vspd0 0>, <&vspd1 0>;
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       du_out_dsi0: endpoint {
> +                                               remote-endpoint =3D <&dsi=
0_in>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       du_out_dsi1: endpoint {
> +                                               remote-endpoint =3D <&dsi=
1_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               dsi0: dsi-encoder@fed80000 {
> +                       compatible =3D "renesas,r8a779g0-dsi-csi2-tx";
> +                       reg =3D <0 0xfed80000 0 0x10000>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       clocks =3D <&cpg CPG_MOD 415>,
> +                                <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> +                                <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> +                       clock-names =3D "fck", "dsi", "pll";
> +                       resets =3D <&cpg 415>;

blank line here to separate it, and highlight that it's disabled? (Like
is done for DU?

> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       dsi0_in: endpoint {
> +                                               remote-endpoint =3D <&du_=
out_dsi0>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                               };
> +                       };
> +               };
> +
> +               dsi1: dsi-encoder@fed90000 {
> +                       compatible =3D "renesas,r8a779g0-dsi-csi2-tx";
> +                       reg =3D <0 0xfed90000 0 0x10000>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       clocks =3D <&cpg CPG_MOD 416>,
> +                                <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> +                                <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> +                       clock-names =3D "fck", "dsi", "pll";
> +                       resets =3D <&cpg 416>;

Same.

With the VSPD register ranges increased accordingly:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       dsi1_in: endpoint {
> +                                               remote-endpoint =3D <&du_=
out_dsi1>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                               };
> +                       };
> +               };
> +
>         };
> =20
>         timer {
> --=20
> 2.34.1
>
