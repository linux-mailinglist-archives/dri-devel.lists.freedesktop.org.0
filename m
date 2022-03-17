Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E04DCF23
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 21:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C9F10E768;
	Thu, 17 Mar 2022 20:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B710E75C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1647547824; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBhB5mnj+yU5UQCD6yhog64770XneXJJnfqfginvPmo=;
 b=eIHZgUYBBumSPI4xw5meu79N9cSbfki0qgEzFAf/RVYUvpkeFP4EkLreDOAlI+5YSidDqX
 c6BqiOViZLrayAJTMhSeN9IYJXETgI0f5ZqnktWoBauBv7mzqNwgrAi3uS8UFmwXzi/aWc
 TMl+T5IsLybiEqIOSn6YeyoWf2HzXAo=
Date: Thu, 17 Mar 2022 20:10:14 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 4/4] dt-bindings: display/panel: Add Leadtek
 ltk035c5444t
To: Christophe Branchereau <cbranchereau@gmail.com>
Message-Id: <21OW8R.3JWZ0IT11MIP2@crapouillou.net>
In-Reply-To: <20220311170240.173846-5-cbranchereau@gmail.com>
References: <20220311170240.173846-1-cbranchereau@gmail.com>
 <20220311170240.173846-5-cbranchereau@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le ven., mars 11 2022 at 18:02:40 +0100, Christophe Branchereau=20
<cbranchereau@gmail.com> a =E9crit :
> Add binding for the leadtek ltk035c5444t, which is a 640x480
> mipi-dbi over spi / 24-bit RGB panel based on the newvision
> NV03052C chipset.
>=20
> It is found in the Anbernic RG350M mips handheld.
>=20
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>

Applied to drm-misc-next.

Thanks,
-Paul

> ---
>  .../display/panel/leadtek,ltk035c5444t.yaml   | 59=20
> +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.ya=
ml=20
> b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.ya=
ml
> new file mode 100644
> index 000000000000..817a9bed7d5a
> --- /dev/null
> +++=20
> b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.ya=
ml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id:=20
> http://devicetree.org/schemas/display/panel/leadtek,ltk035c5444t.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Leadtek ltk035c5444t 3.5" (640x480 pixels) 24-bit IPS LCD=20
> panel
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +  - Christophe Branchereau <cbranchereau@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: leadtek,ltk035c5444t
> +
> +  backlight: true
> +  port: true
> +  power-supply: true
> +  reg: true
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - power-supply
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        panel@0 {
> +            compatible =3D "leadtek,ltk035c5444t";
> +            reg =3D <0>;
> +
> +            spi-3wire;
> +            spi-max-frequency =3D <3125000>;
> +
> +            reset-gpios =3D <&gpe 2 GPIO_ACTIVE_LOW>;
> +
> +            backlight =3D <&backlight>;
> +            power-supply =3D <&vcc>;
> +
> +            port {
> +                panel_input: endpoint {
> +                    remote-endpoint =3D <&panel_output>;
> +                };
> +            };
> +        };
> +    };
> --
> 2.35.1
>=20


