Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21917B390F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 19:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E294A10E147;
	Fri, 29 Sep 2023 17:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E05B10E147
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 17:42:33 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qmHVR-0006iq-QQ; Fri, 29 Sep 2023 19:42:25 +0200
Message-ID: <246c5d9c6d591a1f54ac343b5edd4284ad1dd74f.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: imx: add binding for
 i.MX8MP HDMI PVI
From: Lucas Stach <l.stach@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 29 Sep 2023 19:42:24 +0200
In-Reply-To: <20230929184835.1de69182@booty>
References: <20230928125536.1782715-1-l.stach@pengutronix.de>
 <20230929184835.1de69182@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luca,

Am Freitag, dem 29.09.2023 um 18:48 +0200 schrieb Luca Ceresoli:
> Hi Lucas,
>=20
> On Thu, 28 Sep 2023 14:55:35 +0200
> Lucas Stach <l.stach@pengutronix.de> wrote:
>=20
> > Add binding for the i.MX8MP HDMI parallel video interface block.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,i=
mx8mp-hdmi-pvi.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-h=
dmi-pvi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdm=
i-pvi.yaml
> > new file mode 100644
> > index 000000000000..df29006b4090
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi=
.yaml
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pvi.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP HDMI Parallel Video Interface
> > +
> > +maintainers:
> > +  - Lucas Stach <l.stach@pengutronix.de>
> > +
> > +description: |
> > +  The HDMI parallel video interface is a timing and sync generator blo=
ck in the
> > +  i.MX8MP SoC, that sits between the video source and the HDMI TX cont=
roller.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx8mp-hdmi-pvi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input from the LCDIF controller.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output to the HDMI TX controller.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
>=20
> Sure it is required? In the imx8mp.dtsi I have, which comes for a patch
> you sent previously, there is no 'interrupts' property, and HDMI works.
>=20
Yes, the driver doesn't use/enforce this interrupt at the moment and
will work without it. But since the IRQ is present in the only known HW
implementation of this IP, I don't see a reason to make it optional in
the DT, as that's just proper description of the HW.

> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/power/imx8mp-power.h>
> > +
> > +    display-bridge@32fc4000 {
> > +        compatible =3D "fsl,imx8mp-hdmi-pvi";
> > +        reg =3D <0x32fc4000 0x40>;
>=20
> The device has up to register 0x40, thus I guess the second value should
> be 0x44 here. Or maybe 0x100, just to be comfortable. :)
>=20
Right, I'll fix that.

Regards,
Lucas

