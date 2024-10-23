Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D473E9AD5E1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 22:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634D010E864;
	Wed, 23 Oct 2024 20:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0559010E7A4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 13:23:24 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <r.czerwinski@pengutronix.de>)
 id 1t3bKb-0005DN-Kh; Wed, 23 Oct 2024 15:23:21 +0200
Message-ID: <e729be591e47e4a63f740ffbec9047abc12f78b0.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: add YAML schema for
 LXD M9189A
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>,  dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Cc: kernel@pengutronix.de, Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Wed, 23 Oct 2024 15:23:20 +0200
In-Reply-To: <20241023124411.1153552-2-r.czerwinski@pengutronix.de>
References: <20241023124411.1153552-1-r.czerwinski@pengutronix.de>
 <20241023124411.1153552-2-r.czerwinski@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: r.czerwinski@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 23 Oct 2024 20:55:47 +0000
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

Hi,
On Wed, 2024-10-23 at 14:44 +0200, Rouven Czerwinski wrote:
> The LXD M9189A is a 1024x600 MIPI-DSI panel.
>=20
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> ---
> =C2=A0.../bindings/display/panel/lxd,m9189a.yaml=C2=A0=C2=A0=C2=A0 | 64
> +++++++++++++++++++
> =C2=A01 file changed, 64 insertions(+)
> =C2=A0create mode 100644
> Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
> b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
> new file mode 100644
> index 0000000000000..49cee8865cae1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lxd,m9189a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LXD M9189 DSI Display Panel
                   ^ is missing an A
> +
> +maintainers:
> +=C2=A0 - Rouven Czerwinski <r.czerwinski@pengutronix.de>
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 const: ronbo,rb070d30

This is the wrong compatible.

> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 standby-gpios:
> +=C2=A0=C2=A0=C2=A0 description: GPIO used for the standby pin
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 reset-gpios:
> +=C2=A0=C2=A0=C2=A0 description: GPIO used for the reset pin
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 vdd-supply:
> +=C2=A0=C2=A0=C2=A0 description: Power regulator
> +
> +=C2=A0 backlight:
> +=C2=A0=C2=A0=C2=A0 description: Backlight used by the panel
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - reg
> +=C2=A0 - standby-gpios
> +=C2=A0 - reset-gpios
> +=C2=A0 - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/gpio/gpio.h>
> +
> +=C2=A0=C2=A0=C2=A0 dsi {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panel@0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "lxd,m9189a";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backlight =3D <&backlight>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-gpios =3D <&gpio3 25 GP=
IO_ACTIVE_LOW>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 standby-gpios =3D <&gpio5 22 =
GPIO_ACTIVE_LOW>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mipi_panel_in: en=
dpoint {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remot=
e-endpoint =3D <&mipi_dsi_out>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0 };

Fixed both for a v2 of this series, will wait for more feedback before
resending.

Best Regards,
Rouven Czerwinski

