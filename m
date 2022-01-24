Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E2498441
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0226A10E155;
	Mon, 24 Jan 2022 16:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E01D10E155
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:08:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF578B81107
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD07C36AE2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643040496;
 bh=v/1Mdi0GQmm3GAy3P/eMFH5Uo2OJ/ATOxLRbaHoXA28=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fBC2LpHA7aVzlyXKvP/miH5jN99Sa3bofDbZUV3aRP9a2/1+hmpVM5NvUw5m6Go61
 S1D6VPLrN/sR6lo9/gphqv53Uq60Iu0O855GUsUftnC8cLa+o5Ba/Ozv/TMBQwvYJF
 Og4G0ZH8XdE5SoVcUuztUvyjbeij0gK8WJLqR+lqArLHYjgy8xQUPWg26rsGWbtt40
 siXJXaTUOjYncjxHmjgNzyQqQu8Cn/Fu+q53E6zRx6Za0LpXfunn7T7cz5JFl+1Yhu
 jhZVH0sbbYOVWFtQuhA3rbt6SOMAISRD0+aTmLTNzSlIwKrZ0zV3LmGhomhZtKCtaW
 qEyRNWpPqufiw==
Received: by mail-ej1-f44.google.com with SMTP id jx6so22775268ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:08:16 -0800 (PST)
X-Gm-Message-State: AOAM533NbOHqQavUepak5yMLTo49OvkuMtD1cnl81Y/RZwted08ntS7B
 Ouy4ef7xkK6hze/tA5TEMsjoYTbsJEgKF4k0SQ==
X-Google-Smtp-Source: ABdhPJz42SdkWmW25h8uW2qM870ShYKpO/fRnP97RjloiIm5qNtz5j41zAma6k0GmiuoIpRPP+Y8aC3XkFNloNvMlNU=
X-Received: by 2002:a17:906:d184:: with SMTP id
 c4mr12753924ejz.20.1643040494825; 
 Mon, 24 Jan 2022 08:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20220123172520.48741-1-noralf@tronnes.org>
 <20220123172520.48741-2-noralf@tronnes.org>
In-Reply-To: <20220123172520.48741-2-noralf@tronnes.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 24 Jan 2022 10:08:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJU_WFeJDt5jqLN9BQN2j_TCf3+0hKvbNSYwmg-2DSF=Q@mail.gmail.com>
Message-ID: <CAL_JsqJU_WFeJDt5jqLN9BQN2j_TCf3+0hKvbNSYwmg-2DSF=Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, maxime@cerno.tech, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 23, 2022 at 11:25 AM Noralf Tr=C3=B8nnes <noralf@tronnes.org> w=
rote:
>
> Add binding for MIPI DBI compatible SPI panels.

I'm sure we already have MIPI DBI panels. What's this for?

>
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> ---
>  .../display/panel/panel-mipi-dbi-spi.yaml     | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-mipi-dbi-spi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-d=
bi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-db=
i-spi.yaml
> new file mode 100644
> index 000000000000..d6c8accb045c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.=
yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dbi-spi.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI DBI SPI Panels Device Tree Bindings
> +
> +maintainers:
> +  - Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> +
> +description:
> +  This binding is for display panels using a MIPI DBI controller
> +  in SPI mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: panel-mipi-dbi-spi

Does the MIPI spec define how to power on a DBI panel with regulators,
enable/reset lines, etc. and all the timing constraints between those?
If not, then this compatible on its own is useless. It's fine as a
fallback if it's presence means the panel uses only standard DBI
commands and no vendor specific commands.

> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The name of the display panel.
> +
> +  write-only:
> +    type: boolean
> +    description:
> +      Controller is not readable (ie. MISO is not wired up).
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: |
> +      Controller data/command selection (D/CX) in 4-line SPI mode.
> +      If not set, the controller is in 3-line SPI mode.
> +
> +  backlight: true
> +  reg: true
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - model
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            display@0{
> +                    compatible =3D "panel-mipi-dbi-spi";
> +                    model =3D "sainsmart18";
> +                    reg =3D <0>;
> +                    spi-max-frequency =3D <40000000>;
> +                    dc-gpios =3D <&gpio 24 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios =3D <&gpio 25 GPIO_ACTIVE_HIGH>;
> +                    write-only;
> +            };
> +    };
> +
> +...
> --
> 2.33.0
>
