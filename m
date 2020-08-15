Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBE82451E4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 23:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064D86E183;
	Sat, 15 Aug 2020 21:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF44A6E183
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:28:43 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6EA3080548;
 Sat, 15 Aug 2020 23:28:41 +0200 (CEST)
Date: Sat, 15 Aug 2020 23:28:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: Add Mantix MLAF057WE51-X panel
 bindings
Message-ID: <20200815212840.GC1244923@ravnborg.org>
References: <cover.1597526107.git.agx@sigxcpu.org>
 <c171b488e883e26eaef7906c007a5cabcbf9e33d.1597526107.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c171b488e883e26eaef7906c007a5cabcbf9e33d.1597526107.git.agx@sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
 a=cjlgXKyR3KIVCA3-0ZEA:9 a=wPNLvfGTeEIA:10 a=iBZjaW-pnkserzjvUTHh:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 15, 2020 at 11:16:21PM +0200, Guido G=FCnther wrote:
> The panel uses a Focaltech FT8006p, the touch part is handled by the
> already existing edt-ft5x06.
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I assume you will apply yourself, otherwise I will do so when we have
seen a backmerge.

	Sam

> ---
>  .../display/panel/mantix,mlaf057we51-x.yaml   | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/manti=
x,mlaf057we51-x.yaml
> =

> diff --git a/Documentation/devicetree/bindings/display/panel/mantix,mlaf0=
57we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,mlaf=
057we51-x.yaml
> new file mode 100644
> index 0000000000000..937323cc9aaac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-=
x.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/mantix,mlaf057we51-x.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mantix MLAF057WE51-X 5.7" 720x1440 TFT LCD panel
> +
> +maintainers:
> +  - Guido G=FCnther <agx@sigxcpu.org>
> +
> +description:
> +  Mantix MLAF057WE51 X is a 720x1440 TFT LCD panel connected using
> +  a MIPI-DSI video interface.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mantix,mlaf057we51-x
> +
> +  port: true
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  avdd-supply:
> +    description: Positive analog power supply
> +
> +  avee-supply:
> +    description: Negative analog power supply
> +
> +  vddi-supply:
> +    description: 1.8V I/O voltage supply
> +
> +  reset-gpios: true
> +
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - avee-supply
> +  - vddi-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        panel@0 {
> +            compatible =3D "mantix,mlaf057we51-x";
> +            reg =3D <0>;
> +            avdd-supply =3D <&reg_avdd>;
> +            avee-supply =3D <&reg_avee>;
> +            vddi-supply =3D <&reg_1v8_p>;
> +            reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> +            backlight =3D <&backlight>;
> +        };
> +    };
> +
> +...
> -- =

> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
