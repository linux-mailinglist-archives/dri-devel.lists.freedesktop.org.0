Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF3CF4995
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3691510E325;
	Mon,  5 Jan 2026 16:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Zl0RjHbG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336FD10E325
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:11:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1767629495; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HFPkpi3yUt2retBX3XruNmVKRhLugIWUtSku85zjLKmrEPbhagqb6VEPHqvjft5uymwswCMrdMbPUh8kAC+XU8Qt5CK2TPKjkKalykSR0xnplEcfK4AgWNjAVx3uLYlWnwJHvkJBR2gg2URbV9sUh2XU2wI3+XuF3YwJrx6SUQU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1767629495;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TsUBNyZy9Y8U68MehXtbryg/+pqq1ZDESAgD5LeM2oE=; 
 b=dvrqO+J+vBouU/c1lunfd4L19pTxn9BJKF9jYYImddGCntzHcCSkJRJoNFvl22N3vsXM1z0C92VHlUMzAZuXyIkDDPah93d+/Wq/QkWU8uPDYvtFeAzHtV3x1KO59NRC9SfUmrxDWNOygYPx0Rr/qr4i0HpY3Y4cIQ30smZdH+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767629495; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=TsUBNyZy9Y8U68MehXtbryg/+pqq1ZDESAgD5LeM2oE=;
 b=Zl0RjHbGG4ePiC5rg+Ouv9+o67810a4y9QZkBvPiRX+OJJ7J10dijLKO0ss9sXta
 RKBINZ99rLgumWFz+daBMc/Ti1hLS0CBvX+gICkWe14wGqgvEO61AFfKj62tQ0q37Fy
 DTGVuaPVEHF4UB/yVeBbFc3XZuzYsaPudrkYUYaYRfeanntjEqFUTGnj97v7cXR28JY
 Umc3iToZbX0GyPfiAbm9fzWPcQWjNtYz6+6i2P8Rp89UPCn57I+2nUq5G0ZrKuu1Jci
 weAiS5Or1saJBtv/fN9vWcEb3FHe7A3awgfYLakNokcUsPYHZAi6JRpxDOk4jiTvWAf
 N7ZtTd4Lfg==
Received: by mx.zohomail.com with SMTPS id 1767629491804668.4612361380402;
 Mon, 5 Jan 2026 08:11:31 -0800 (PST)
Message-ID: <a838dc0f8bd39c6d9da95f5fd137eba8c131c58a.camel@icenowy.me>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
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
Date: Tue, 06 Jan 2026 00:11:16 +0800
In-Reply-To: <20260105154656.GA2585570-robh@kernel.org>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
 <20260105154656.GA2585570-robh@kernel.org>
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

=E5=9C=A8 2026-01-05=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 09:46 -0600=EF=BC=
=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Dec 25, 2025 at 12:11:58AM +0800, Icenowy Zheng wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >=20
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
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > Changes in v4:
> > - Added a comment for "verisilicon,dc" that says the ID/revision is
> > =C2=A0 discoverable via registers.
> > - Removed clock minItems constraint w/o specific compatible
> > strings.
> >=20
> > Changes in v3:
> > - Added SoC-specific compatible string, and arm the binding with
> > clock /
> > =C2=A0 port checking for the specific SoC (with a 2-output DC).
> >=20
> > Changes in v2:
> > - Fixed misspelt "versilicon" in title.
> > - Moved minItems in clock properties to be earlier than items.
> > - Re-aligned multi-line clocks and resets in example.
> >=20
> > =C2=A0.../bindings/display/verisilicon,dc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 144
> > ++++++++++++++++++
> > =C2=A01 file changed, 144 insertions(+)
> > =C2=A0create mode 100644
> > Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > new file mode 100644
> > index 0000000000000..fe64cc1466690
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > @@ -0,0 +1,144 @@
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
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - thead,th1520-=
dc8200
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: verisilicon,dc # DC IPs have d=
iscoverable
> > ID/revision registers
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
> > +
> > +=C2=A0 clock-names:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: axi
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: ahb
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: pix0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: pix1
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
ut channel , endpoint 0 should
> > be
>=20
> No space before comma. Or perhaps should be a period instead.

Well I don't know why I inserted such a space, will remove it.

>=20
>=20
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supports. Follo=
w the same endpoint addressing rule with
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the first port.
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
> > +allOf:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st: thead,th1520-dc8200
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 5
>=20
> That's already implicitly the min. Perhaps you wanted 'minItems: 4'
> on=20
> the clocks and clock-names definitions for versions with only 1
> output?

Previously I specified minItems: 4 in the general part, however this
does not play well when some of core/axi/ahb clocks are not present.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ports:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - p=
ort@0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - p=
ort@1
>=20
> It is valid to omit these if the output is present, but unused.

Well this sounds reasonable, although my driver does not play well if
only a port@1 is defined w/o port@0 .

Considering the previous two snippets, should I just remove this if
part?

>=20
> > +
> > +additionalProperties: false
> > +
=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=3D
