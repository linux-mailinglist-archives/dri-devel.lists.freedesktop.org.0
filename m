Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE47F4D6203
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 14:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFA810E56F;
	Fri, 11 Mar 2022 13:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D89A10E56F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1647003923; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7m9TXBNiZRYoA89hrhRuwOoSnJmPIkD1Cv1P/g9Zqs=;
 b=MERMw+6FOV88njYAS6yz22ak8ZLlwjn5VZpMTKAo+HLXBEOKm9tjFjqVYBr5HezTJTCVX2
 WRBxmoVcV7NWi80UA4LMICfxKThgDrkogBja1UfNQ8SdhiUBOoV1RlZzuNHmolr0Pekhvd
 oLLv5z7WMetYIiLObDiEy2M8urjYEIk=
Date: Fri, 11 Mar 2022 13:05:13 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/4] dt-bindings: display/panel: Add Leadtek
 ltk035c5444t
To: Rob Herring <robh@kernel.org>
Message-Id: <PC0L8R.DOJJ0CSJMHTW@crapouillou.net>
In-Reply-To: <Yip8AiKNOILjf0uj@robh.at.kernel.org>
References: <20220308130643.260683-1-cbranchereau@gmail.com>
 <20220308130643.260683-5-cbranchereau@gmail.com>
 <Yip8AiKNOILjf0uj@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Christophe Branchereau <cbranchereau@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Le jeu., mars 10 2022 at 16:30:26 -0600, Rob Herring <robh@kernel.org>=20
a =E9crit :
> On Tue, Mar 08, 2022 at 02:06:43PM +0100, Christophe Branchereau=20
> wrote:
>>  Add binding for the leadtek ltk035c5444t, which is a 640x480
>>  mipi-dbi over spi / 24-bit RGB panel based on the newvision
>>  NV03052C chipset.
>>=20
>>  It is found in the Anbernic RG350M mips handheld.
>>=20
>>  Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
>>  ---
>>   .../panel/leadtek,ltk035c5444t-spi.yaml       | 59=20
>> +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-spi=
.yaml
>=20
> We have 18 SPI based panels already:
>=20
> $ git grep -i 'spi.* {'=20
> Documentation/devicetree/bindings/display/panel/
> Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml: =20
>   spi {
> Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml: =20
>   spi {
> Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml: =20
>   spi {
> Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml: =20
>   spi {
> Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml:=20
>    spi {
> Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.=
yaml:=20
>    spi {
> Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml:   =20
> spi {
> Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml:=20
>    spi {
> Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml: =20
>   spi0 {
> Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml: =20
>   spi {
> Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml:=20
>    spi {
> Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml:=20
>    spi {
> Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml:=20
>    spi {
> Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml:=20
>    spi {
> Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml:=20
>    spi {
> Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml: =20
>   spi {
> Documentation/devicetree/bindings/display/panel/tpo,td.yaml:    spi {
> Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml:   =20
> spi {
>=20
> Most except for the Samsung ones look like they'd fit in our=20
> definition
> of 'simple panels' which primarily means 1 supply.
>=20
> So I think it is time for a panel-simple-spi.yaml binding to combine=20
> all
> these. But I'm not going to make the person adding the 19th case to do
> that, and this otherwise looks fine:
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

I actually thought you sent a patch for this already (I remember you=20
talking about it last a binding for a new SPI panel has been added).

I will work on it next week - provided Cristophe's patch has been=20
merged before.

Cheers,
-Paul

>=20
> With one nit fixed below:
>=20
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-s=
pi.yaml=20
>> b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-s=
pi.yaml
>>  new file mode 100644
>>  index 000000000000..9b6f1810adab
>>  --- /dev/null
>>  +++=20
>> b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-s=
pi.yaml
>>  @@ -0,0 +1,59 @@
>>  +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id:=20
>> http://devicetree.org/schemas/display/panel/leadtek,ltk035c5444t-spi.yam=
l#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +
>>  +title: Leadtek ltk035c5444t 3.5" (640x480 pixels) 24-bit IPS LCD=20
>> panel
>>  +
>>  +maintainers:
>>  +  - Paul Cercueil <paul@crapouillou.net>
>>  +  - Christophe Branchereau <cbranchereau@gmail.com>
>>  +
>>  +allOf:
>>  +  - $ref: panel-common.yaml#
>>  +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>>  +
>>  +properties:
>>  +  compatible:
>>  +    const: leadtek,ltk035c5444t-spi
>=20
> '-spi' is redundant, so drop.
>=20
>>  +
>>  +  backlight: true
>>  +  port: true
>>  +  power-supply: true
>>  +  reg: true
>>  +  reset-gpios: true
>>  +
>>  +required:
>>  +  - compatible
>>  +  - power-supply
>>  +  - reset-gpios
>>  +
>>  +unevaluatedProperties: false
>>  +
>>  +examples:
>>  +  - |
>>  +    #include <dt-bindings/gpio/gpio.h>
>>  +
>>  +    spi {
>>  +        #address-cells =3D <1>;
>>  +        #size-cells =3D <0>;
>>  +        panel@0 {
>>  +            compatible =3D "leadtek,ltk035c5444t-spi";
>=20
> And update the example...
>=20
>>  +            reg =3D <0>;
>>  +
>>  +            spi-3wire;
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
>>  2.34.1
>>=20
>>=20


