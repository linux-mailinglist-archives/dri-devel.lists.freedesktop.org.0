Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67FBB276FC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E6B10E34E;
	Fri, 15 Aug 2025 03:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="LS5KR8iu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AA810E34E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 03:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755229378; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IYc7oUYv/M7LN3plnwit6tzP1SexwbR+mZSzeKRKyA8Qo50ujhSYd/9O33JBNixnfENQqvr7xJJUey9s8Is29aQCXfgirBA+WWIGEY4gqrzVNH+MyUY845fqHHe/lMp6IMxs31YceTpS33zel3ks0Ei6cF6MnDfge2XTyK0tztg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755229378;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ubBB49UP+aj7PcGViP/TgfEwXSbUXxGnULBNFVNl/sI=; 
 b=T+rZKmICuhh43mOZ8RScUn1kAegbUtGQKlZFqQdM+xiWjsY4TYGuzwPB+67twLzcEpo6QVvaHo/OTVzVuQHI9cBdmCCOHhIQVa6oOLK1ia1aTdtV5rA3mtsElGlV9agM0JaE6wOk9c1ofoSvejy6r13RCc03bSIin13oy962VfY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755229378; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=ubBB49UP+aj7PcGViP/TgfEwXSbUXxGnULBNFVNl/sI=;
 b=LS5KR8iugdUd9O8SwXfh0w7c3TbrT6bRhCLUdCs52KsDcmN4WORA8197F0/0VfqN
 AP1FQOrYG6yh2hE/IXmn/soEZCNa1FySfovaVPlUA1zUSVeHC3xIGyr8z3fARpScUv+
 5ycoPXQFD42A/nqVK9YdiOpOrZ+WI2oDA1FouVJKvUVntPLXdzmnBeIondgh0HwSxkF
 KkmnSdZ0YKMfPahSETFVwoc+wLzzzcjk3L2dqpYAHHedf5WVYpSFaXi4qwrkRaRbibf
 eQXx2xAsedpIXlVT1H8Kl9rPbT49EKXi5/pHdq31tuXrhAJ+UQL56TcFCPDc5blTYro
 kokGlZbe9A==
Received: by mx.zohomail.com with SMTPS id 1755229376429131.19414845474012;
 Thu, 14 Aug 2025 20:42:56 -0700 (PDT)
Message-ID: <ba53d9f3c02957790c5744133668e8cf1f5a9216.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/8] dt-bindings: display: add versilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao
 Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Fri, 15 Aug 2025 11:42:45 +0800
In-Reply-To: <20250814220444.GA3988176-robh@kernel.org>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-3-uwu@icenowy.me>
 <20250814220444.GA3988176-robh@kernel.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2025-08-14=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 17:04 -0500=EF=BC=
=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Aug 15, 2025 at 12:40:42AM +0800, Icenowy Zheng wrote:
> > Verisilicon has a series of display controllers prefixed with DC
> > and
> > with self-identification facility like their GC series GPUs.
> >=20
> > Add a device tree binding for it.
> >=20
> > Depends on the specific DC model, it can have either one or two
> > display
> > outputs, and each display output could be set to DPI signal or "DP"
> > signal (which seems to be some plain parallel bus to HDMI
> > controllers).
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > =C2=A0.../bindings/display/verisilicon,dc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 127
> > ++++++++++++++++++
> > =C2=A01 file changed, 127 insertions(+)
> > =C2=A0create mode 100644
> > Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > new file mode 100644
> > index 0000000000000..2f71a811786aa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Verisilicon DC-series display controllers
> > +
> > +maintainers:
> > +=C2=A0 - Icenowy Zheng <uwu@icenowy.me>
> > +
> > +properties:
> > +=C2=A0 $nodename:
> > +=C2=A0=C2=A0=C2=A0 pattern: "^display@[0-9a-f]+$"
> > +
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: verisilicon,dc
>=20
> If the clocks or resets varies by platform, then you need an SoC=20
> specific compatible still. If these clocks/resets are straight from
> the=20
> RTL and any other number of clocks/resets is wrong, then we can stick
> with just this compatible.

I deduced this 5 clocks pattern based on block diagrams on two SoCs's
manual, see [1] page 528 and [2] page 7 (page 1 shown on the footer).

Well, ironically, neither of BSP device tree of these two SoCs ([3]
[4]) list 5 clocks in the dc8200 device tree node, but the extra clocks
mostly look nonsense (even things like JH7110_SYSCLK_NOC_BUS_DISP_AXI
appeared in [4]).

[1]
https://doc-en.rvspace.org/JH7110/PDF/JH7110_TRM_StarFive_Preliminary_V2.pd=
f

[2]
https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/raw/main/docs/TH1=
520%20Video%20Output%20User%20Manual.pdf


[3]
https://github.com/revyos/th1520-linux-kernel/blob/th1520-lts/arch/riscv/bo=
ot/dts/thead/th1520.dtsi#L1702


[4]=20
https://github.com/starfive-tech/linux/blob/JH7110_VisionFive2_6.12.y_devel=
/arch/riscv/boot/dts/starfive/jh7110.dtsi#L1576

>=20
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DC Core clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DMA AXI bus clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Configuration AHB bus cl=
ock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Pixel clock of output 0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Pixel clock of output 1
> > +=C2=A0=C2=A0=C2=A0 minItems: 4
>=20
> Generally we put this before 'items'.

Sounds reasonable, although I might add explicit maxItems: 5 if put
before items.

>=20
> > +
> > +=C2=A0 clock-names:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: axi
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ahb
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: pix0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: pix1
> > +=C2=A0=C2=A0=C2=A0 minItems: 4
> > +
> > +=C2=A0 resets:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DC Core reset
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DMA AXI bus reset
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Configuration AHB bus re=
set
> > +
> > +=C2=A0 reset-names:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: axi
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ahb
> > +
> > +=C2=A0 ports:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@0:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/graph.yaml#/=
properties/port
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: The first outp=
ut channel, endpoint 0 should
> > be
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 used for DPI fo=
rmat output and endpoint 1 should be used
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for DP format o=
utput.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@1:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/graph.yaml#/=
properties/port
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: The second out=
put channel if the DC variant
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supports and us=
ed. Follow the same endpoint addressing
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rule with the f=
irst port.
> > +
> > +=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - port@0
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - reg
> > +=C2=A0 - interrupts
> > +=C2=A0 - clocks
> > +=C2=A0 - clock-names
> > +=C2=A0 - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/reset/thead,th1520-reset.h>
> > +=C2=A0=C2=A0=C2=A0 soc {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 display@ffef600000 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "verisilicon=
,dc";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0xff 0xef600000 0x=
0 0x100000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <93 IRQ_TYPE=
_LEVEL_HIGH>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&clk_vo CLK_DPU=
_CCLK>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&clk_vo =
CLK_DPU_ACLK>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&clk_vo =
CLK_DPU_HCLK>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&clk_vo =
CLK_DPU_PIXELCLK0>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&clk_vo =
CLK_DPU_PIXELCLK1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D "core", "ax=
i", "ahb", "pix0", "pix1";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resets =3D <&rst TH1520_RES=
ET_ID_DPU_CORE>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&rst TH1=
520_RESET_ID_DPU_AXI>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&rst TH1=
520_RESET_ID_DPU_AHB>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-names =3D "core", "ax=
i", "ahb";
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ports {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =
=3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D=
 <0>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port@1 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #ad=
dress-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #si=
ze-cells =3D <0>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpu=
_out_dp1: endpoint@1 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 reg =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 remote-endpoint =3D <&hdmi_in>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +=C2=A0=C2=A0=C2=A0 };
> > --=20
> > 2.50.1
> >=20

