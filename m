Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB45C4F749
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 19:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D59A10E643;
	Tue, 11 Nov 2025 18:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FEv3k7ov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA00010E641
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 18:36:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0038F60202;
 Tue, 11 Nov 2025 18:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC58AC4CEFB;
 Tue, 11 Nov 2025 18:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762886182;
 bh=MLA0kcDfWzKpCJ6CWESU5UcMSFv8Ue3BKYYBjOpvKVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FEv3k7ovvJHxbpWPTRea/2WRnxr5ExTq1wAZf1hHPKxbnACMrDeQmsw+KyWRRCnFU
 1Sjx4zy7Z+ObGPRJ0+65/kXkdEieSLkNd+zilAwCZL+5K9+ADdGnxpYjBt7QMXyuy+
 jWuxBxbBDQJ14uBIxgMa1sqQVbMLpH5V1j1lp9EFdNyw6ZN2BZAwQuSifluZYf7Dl0
 YE6MugGcUOJL6KelKgtRpb1+rO71WpGlQxBG4QmuVc3B4cwM2olVSsHvdMqfMuaBsI
 sfHLE6OgnWFyrKqx9WWtFmnMldl/6OHWqxngxGIzPVPBFp5EYBkT2avD86cyvv06ZB
 PPOn+VIxVpDyQ==
Date: Tue, 11 Nov 2025 18:36:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Icenowy Zheng <uwu@icenowy.me>,
 Maud Spierings <maudspierings@gocontroll.com>,
 Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add vout-subsystem
 IP block
Message-ID: <20251111-unsaid-rockslide-67b88b2e34bd@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
 <20251111-massager-twistable-1e88f03d82f8@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7Zn5DUxOsE/fr2EG"
Content-Disposition: inline
In-Reply-To: <20251111-massager-twistable-1e88f03d82f8@spud>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7Zn5DUxOsE/fr2EG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 06:18:16PM +0000, Conor Dooley wrote:
> On Sat, Nov 08, 2025 at 02:04:35AM +0100, Michal Wilczynski wrote:
> > Add the dt-binding documentation for the StarFive JH7110 Video Output
> > (VOUT) subsystem.
> >=20
> > This node acts as a parent for all devices within the VOUT power domain,
> > including the DC8200 display controller, the VOUTCRG clock generator,
> > and the HDMI MFD block. Its driver is responsible for managing the
> > shared power domain and top-level bus clocks for these children.
> >=20
> > It is a bit similar to the display subsystem qcom,sdm845-mdss DT node.
> >=20
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> >  .../starfive/starfive,jh7110-vout-subsystem.yaml   | 156 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   5 +
> >  2 files changed, 161 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh=
7110-vout-subsystem.yaml b/Documentation/devicetree/bindings/soc/starfive/s=
tarfive,jh7110-vout-subsystem.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..4ad9423ea139a537b4cfea2=
6b0ed4ed263aa14a1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vo=
ut-subsystem.yaml
> > @@ -0,0 +1,156 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-vout-s=
ubsystem.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7110 VOUT (Video Output) Subsystem
> > +
> > +maintainers:
> > +  - Michal Wilczynski <m.wilczynski@samsung.com>
> > +
> > +description:
> > +  The JH7110 video output subsystem is an IP block that contains
> > +  the display controller (DC8200), HDMI controller/PHY, and VOUT
> > +  clock generator (VOUTCRG).
> > +
> > +properties:
> > +  compatible:
> > +    const: starfive,jh7110-vout-subsystem
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  ranges: true
> > +
> > +  '#address-cells':
> > +    const: 2
> > +
> > +  '#size-cells':
> > +    const: 2
> > +
> > +patternProperties:
> > +  "^display@[0-9a-f]+$":
>=20
> Personally I'd like to see these being regular properties, since there's
> exactly one possible setup for this.
>=20
> > +    type: object
> > +    description: Verisilicon DC8200 Display Controller node.
>=20
> Can you add the relevant references here instead of allowing any object?

I don't think that if you did, this would pass the binding checks,
because there's no "verisilicon,dc" binding. I think I saw one in
progress, but without the soc-specific compatible that I am going to
require here - if for no reason other than making sure that the clocks
etc are provided correctly for this device.

>=20
> Cheers,
> Conor.
>=20
> > +
> > +  "^hdmi@[0-9a-f]+$":
> > +    type: object
> > +    description: StarFive HDMI MFD (PHY + Controller) node.
> > +
> > +  "^clock-controller@[0-9a-f]+$":
> > +    type: object
> > +    description: StarFive VOUT Clock Generator (VOUTCRG) node.
> > +
> > +  "^syscon@[0-9a-f]+$":
> > +    type: object
> > +    description: StarFive VOUT Syscon node.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - power-domains
> > +  - clocks
> > +  - resets
> > +  - ranges
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> > +    #include <dt-bindings/power/starfive,jh7110-pmu.h>
> > +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        vout_subsystem: display-subsystem@29400000 {
> > +            compatible =3D "starfive,jh7110-vout-subsystem";
> > +            reg =3D <0x0 0x29400000 0x0 0x200000>;
> > +            #address-cells =3D <2>;
> > +            #size-cells =3D <2>;
> > +            ranges;
> > +
> > +            power-domains =3D <&pwrc JH7110_PD_VOUT>;
> > +            clocks =3D <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
> > +            resets =3D <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
> > +
> > +            dc8200: display@29400000 {
> > +                compatible =3D "verisilicon,dc";
> > +                reg =3D <0x0 0x29400000 0x0 0x2800>;
> > +                interrupts =3D <95>;
> > +                clocks =3D <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
> > +                         <&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
> > +                         <&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
> > +                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
> > +                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX1>;
> > +                clock-names =3D "core", "axi", "ahb", "pix0", "pix1";
> > +                resets =3D <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
> > +                         <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
> > +                         <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
> > +                reset-names =3D "axi", "ahb", "core";
> > +            };
> > +
> > +            hdmi_mfd: hdmi@29590000 {
> > +                compatible =3D "starfive,jh7110-hdmi-mfd";
> > +                reg =3D <0x0 0x29590000 0x0 0x4000>;
> > +                interrupts =3D <99>;
> > +
> > +                hdmi_phy: phy {
> > +                    compatible =3D "starfive,jh7110-inno-hdmi-phy";
> > +                    clocks =3D <&xin24m>;
> > +                    clock-names =3D "refoclk";
> > +                    #clock-cells =3D <0>;
> > +                    clock-output-names =3D "hdmi_pclk";
> > +                    #phy-cells =3D <0>;
> > +                };
> > +
> > +                hdmi_controller: controller {
> > +                    compatible =3D "starfive,jh7110-inno-hdmi-controll=
er";
> > +                    interrupts =3D <99>;
> > +                    clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> > +                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> > +                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> > +                             <&hdmi_phy>;
> > +                    clock-names =3D "sys", "mclk", "bclk", "pclk";
> > +                    resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> > +                    reset-names =3D "hdmi_tx";
> > +                    phys =3D <&hdmi_phy>;
> > +                    phy-names =3D "hdmi-phy";
> > +                };
> > +            };
> > +
> > +            voutcrg: clock-controller@295c0000 {
> > +                compatible =3D "starfive,jh7110-voutcrg";
> > +                reg =3D <0x0 0x295c0000 0x0 0x10000>;
> > +                clocks =3D <&syscrg JH7110_SYSCLK_VOUT_SRC>,
> > +                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
> > +                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
> > +                         <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
> > +                         <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
> > +                         <&hdmi_phy>;
> > +                clock-names =3D "vout_src", "vout_top_ahb",
> > +                              "vout_top_axi", "vout_top_hdmitx0_mclk",
> > +                              "i2stx0_bclk", "hdmitx0_pixelclk";
> > +                resets =3D <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
> > +                reset-names =3D "vout_top";
> > +                #clock-cells =3D <1>;
> > +                #reset-cells =3D <1>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 348caaaa929a519bc0ec5c0c7b587468ef7532d5..99434e54dc39494153677a6=
ca359d70f2ba2ddb3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24044,6 +24044,11 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> >  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > =20
> > +STARFIVE JH7110 DISPLAY SUBSYSTEM
> > +M:	Michal Wilczynski <m.wilczynski@samsung.com>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout=
-subsystem.yaml
> > +
> >  STARFIVE JH7110 DPHY RX DRIVER
> >  M:	Jack Zhu <jack.zhu@starfivetech.com>
> >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> >=20
> > --=20
> > 2.34.1
> >=20



--7Zn5DUxOsE/fr2EG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaROCHQAKCRB4tDGHoIJi
0scgAP9ALSAYikt1D0zcD9C01OSOyLuRvo0MJ3+AORXfCO3hLAD+PsNzAJIRhK0d
u2VYjsrI+kH+0FPeeIuplTwwrNRkGgs=
=BbDd
-----END PGP SIGNATURE-----

--7Zn5DUxOsE/fr2EG--
