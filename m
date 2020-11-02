Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9922A2BD3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371F36EB84;
	Mon,  2 Nov 2020 13:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BA86E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 10:19:37 +0000 (UTC)
Date: Mon, 02 Nov 2020 10:19:21 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/4] dt-bindings: display: Add ABT Y030XX067A
 =?UTF-8?Q?panel=0D=0A?= bindings
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <9CZ5JQ.CWYPSJ8EDOW4@crapouillou.net>
In-Reply-To: <20201101122900.GB1269759@ravnborg.org>
References: <20201101093150.8071-1-paul@crapouillou.net>
 <20201101093150.8071-3-paul@crapouillou.net>
 <20201101122900.GB1269759@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe Branchereau <cbranchereau@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le dim. 1 nov. 2020 =E0 13:29, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> On Sun, Nov 01, 2020 at 09:31:48AM +0000, Paul Cercueil wrote:
>>  The Asia Better Technology (ABT) Y030XX067A panel is a 3.0" 320x480
>>  24-bit IPS LCD panel. Its particularity is that it has non-square =

>> pixels
>>  (as it is 4:3 for a resolution of 320x480), and that it requires odd
>>  lines to be sent as RGB and even lines to be sent as GRB on its =

>> 8-bit
>>  bus.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   .../display/panel/abt,y030xx067a.yaml         | 54 =

>> +++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>   create mode 100644 =

>> Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
>> =

>>  diff --git =

>> a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml =

>> b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
>>  new file mode 100644
>>  index 000000000000..6407e8bf45fa
>>  --- /dev/null
>>  +++ =

>> b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
>>  @@ -0,0 +1,54 @@
>>  +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id: =

>> http://devicetree.org/schemas/display/panel/abt,y030xx067a.yaml#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +
>>  +title: Asia Better Technology 3.0" (320x480 pixels) 24-bit IPS LCD =

>> panel
>>  +
>>  +description: |
>>  +  The panel must obey the rules for a SPI slave device as =

>> specified in
>>  +  spi/spi-controller.yaml
>>  +
>>  +maintainers:
>>  +  - Paul Cercueil <paul@crapouillou.net>
>>  +
>>  +allOf:
>>  +  - $ref: panel-common.yaml#
>>  +
>>  +properties:
>>  +  compatible:
>>  +    const: abt,y030xx067a
>>  +
>>  +  backlight: true
>>  +  port: true
>>  +  power-supply: true
>>  +  reg: true
>>  +  reset-gpios: true
> =

> The binding is missing:
> required:
>   - compatible
>   - reg
>   - power-supply
>   - reset-gpios
>   - ...
> =

> additionalProperties: false
> =

> So r-b only with these added.

Stupid mistake, sorry about that.

I'll V2.

-Paul

> =

> 	Sam
> =

>>  +
>>  +examples:
>>  +  - |
>>  +    #include <dt-bindings/gpio/gpio.h>
>>  +
>>  +    spi {
>>  +        #address-cells =3D <1>;
>>  +        #size-cells =3D <0>;
>>  +
>>  +        panel@0 {
>>  +            compatible =3D "abt,y030xx067a";
>>  +            reg =3D <0>;
>>  +
>>  +            spi-max-frequency =3D <3125000>;
>>  +
>>  +            reset-gpios =3D <&gpe 2 GPIO_ACTIVE_LOW>;
>>  +
>>  +            backlight =3D <&backlight>;
>>  +            power-supply =3D <&vcc>;
>>  +
>>  +            port {
>>  +                panel_input: endpoint {
>>  +                    remote-endpoint =3D <&panel_output>;
>>  +                };
>>  +            };
>>  +        };
>>  +    };
>>  --
>>  2.28.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
