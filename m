Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC66B2FC7D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9AB10E10E;
	Thu, 21 Aug 2025 14:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cRWFxu/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E936110E070
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:28:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 799A440426
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EFBC2BC87
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755786517;
 bh=EMbz8+HtiX+wFGU2pxupJmg8opMHOLpXmJiRY9CoOkI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cRWFxu/BPNpqodDqvt1FLl5BcGeujMeWAQcrQgctw9TvOthgFPwJv1EskTamU7fst
 mQzi80HtrNlWRLg8/x71MRaPtHwEuWMxVGi67R1kGUrxlAA6QFv8jFd5QoSlaTNJc9
 VsHsCf5X8u9pKEhGkTtbvc8EN3W6Ae2VU/fRH/Ow3b4FO95fADdG3ogjEWMdNd/lD/
 MQ5A6HSKcraqM1G8VqbvE9p2wcJmdnN5Lcp9SHT1IF+AJxNJwqIz3ABs1IVIbYmzES
 o/3J9fZQXk4/j33zoTvzyRiIXVcQsND7pDp6sn7sm1vM2daBOnRpjj8tQfvpxPSGjL
 0VVxJB8bhvpIw==
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-61a8b640e34so2164828a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWmM9cZ65kD86jhmvauwjcyikKvQqnkjl0iEYltMzEH4infrqlAmA5cFwRjSzWiAhmcxCW3waMw2UI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg0w1kWJzlQZpISskATgAE2iJrY2UwTH15pXkODtVxTG3dZK1p
 vIyo1qyu7/mp9RGukeKU+o+SS/e8F+MNSMtX3sYnQzEMvdE0T7lAMvBeafiUbK/b3cDhw4oB1+t
 XuPFxVUDwN4Rag2Sf7SbtPndCxP3cBw==
X-Google-Smtp-Source: AGHT+IFBppYBOkX44YlxMo5/Wkh7Q5eWgNuxdz5vrG5HqTxZPVhTa0iHjCUIJQBUOqi7fhL4+BSSlpYJWfsZYnSvbZ0=
X-Received: by 2002:a05:6402:1ece:b0:61a:9385:c798 with SMTP id
 4fb4d7f45d1cf-61bf8747b36mr1919506a12.37.1755786515468; Thu, 21 Aug 2025
 07:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-5-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-5-ariel.dalessandro@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Aug 2025 09:28:23 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+K72Kof-Z3q2DSh3FKO64npLF6hDJnqnTzNBUoOoVQFA@mail.gmail.com>
X-Gm-Features: Ac12FXyETnp9uvywF5eryvs_DLFHAynyRYtV9sBUVnGCpXqqypbV2hkfxFtEdCo
Message-ID: <CAL_Jsq+K72Kof-Z3q2DSh3FKO64npLF6hDJnqnTzNBUoOoVQFA@mail.gmail.com>
Subject: Re: [PATCH v1 04/14] net: dt-bindings: Convert Marvell 8897/8997
 bindings to YAML
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
 krzk+dt@kernel.org, kuba@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
 linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
 minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, 
 pabeni@redhat.com, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 20, 2025 at 12:15=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:
>
> Convert the existing text-based DT bindings for Marvell 8897/8997
> (sd8897/sd8997) bluetooth devices controller to a YAML schema.
>
> While here, bindings for "usb1286,204e" (USB interface) are dropped from
> the YAML definition as these are currently documented in file:
>
> - Documentation/devicetree/bindings/net/btusb.txt
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/net/marvell,sd8897-bt.yaml       | 91 +++++++++++++++++++

This needs to move to net/bluetooth/

>  .../bindings/net/marvell-bt-8xxx.txt          | 83 -----------------
>  2 files changed, 91 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-=
bt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx=
.txt
>
> diff --git a/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml=
 b/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
> new file mode 100644
> index 0000000000000..6539868c08b8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/marvell,sd8897-bt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell 8897/8997 (sd8897/sd8997) bluetooth devices (SDIO)
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +

Needs a $ref to bluetooth-controller.yaml

> +properties:
> +  compatible:
> +    enum:
> +      - marvell,sd8897-bt
> +      - marvell,sd8997-bt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  marvell,cal-data:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      Calibration data downloaded to the device during initialization.
> +    minItems: 28

Just: maxItems: 28

> +
> +  marvell,wakeup-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Wakeup pin number of the bluetooth chip. Used by firmware to wakeu=
p host
> +      system.
> +
> +  marvell,wakeup-gap-ms:

This unfortunately needs a uint16 type. That will cause a warning
which has to be fixed on the dtschema side.

> +    description:
> +      Wakeup latency of the host platform. Required by the chip sleep fe=
ature.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/pinctrl/rockchip.h>

Please drop this and just use a number below.

> +
> +    sdio0 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        btmrvl: btmrvl@2 {
> +            compatible =3D "marvell,sd8897-bt";
> +            reg =3D <2>;
> +            interrupt-parent =3D <&gpio4>;
> +            interrupts =3D <RK_PD7 IRQ_TYPE_LEVEL_LOW>;
> +            marvell,wakeup-pin =3D /bits/ 16 <13>;
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&bt_host_wake_l>;
> +        };
> +    };

I would drop this example.

> +
> +    mmc3 {

mmc {

> +        vmmc-supply =3D <&wlan_en_reg>;
> +        bus-width =3D <4>;
> +        cap-power-off-card;
> +        keep-power-in-suspend;
> +
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        bluetooth: bluetooth@2 {

Drop the label.

> +            compatible =3D "marvell,sd8897-bt";
> +            reg =3D <2>;
> +            interrupt-parent =3D <&pio>;
> +            interrupts =3D <119 IRQ_TYPE_LEVEL_LOW>;
> +
> +            marvell,cal-data =3D /bits/ 8 <
> +                0x37 0x01 0x1c 0x00 0xff 0xff 0xff 0xff 0x01 0x7f 0x04 0=
x02
> +                0x00 0x00 0xba 0xce 0xc0 0xc6 0x2d 0x00 0x00 0x00 0x00 0=
x00
> +                0x00 0x00 0xf0 0x00>;
> +            marvell,wakeup-pin =3D /bits/ 16 <0x0d>;
> +            marvell,wakeup-gap-ms =3D /bits/ 16 <0x64>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt b/=
Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
> deleted file mode 100644
> index 957e5e5c2927c..0000000000000
> --- a/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -Marvell 8897/8997 (sd8897/sd8997) bluetooth devices (SDIO or USB based)
> -------
> -The 8997 devices supports multiple interfaces. When used on SDIO interfa=
ces,
> -the btmrvl driver is used and when used on USB interface, the btusb driv=
er is
> -used.
> -
> -Required properties:
> -
> -  - compatible : should be one of the following:
> -       * "marvell,sd8897-bt" (for SDIO)
> -       * "marvell,sd8997-bt" (for SDIO)
> -       * "usb1286,204e"      (for USB)
> -
> -Optional properties:
> -
> -  - marvell,cal-data: Calibration data downloaded to the device during
> -                     initialization. This is an array of 28 values(u8).
> -                     This is only applicable to SDIO devices.
> -
> -  - marvell,wakeup-pin: It represents wakeup pin number of the bluetooth=
 chip.
> -                       firmware will use the pin to wakeup host system (=
u16).
> -  - marvell,wakeup-gap-ms: wakeup gap represents wakeup latency of the h=
ost
> -                     platform. The value will be configured to firmware.=
 This
> -                     is needed to work chip's sleep feature as expected =
(u16).
> -  - interrupt-names: Used only for USB based devices (See below)
> -  - interrupts : specifies the interrupt pin number to the cpu. For SDIO=
, the
> -                driver will use the first interrupt specified in the int=
errupt
> -                array. For USB based devices, the driver will use the in=
terrupt
> -                named "wakeup" from the interrupt-names and interrupt ar=
rays.
> -                The driver will request an irq based on this interrupt n=
umber.
> -                During system suspend, the irq will be enabled so that t=
he
> -                bluetooth chip can wakeup host platform under certain
> -                conditions. During system resume, the irq will be disabl=
ed
> -                to make sure unnecessary interrupt is not received.
> -
> -Example:
> -
> -IRQ pin 119 is used as system wakeup source interrupt.
> -wakeup pin 13 and gap 100ms are configured so that firmware can wakeup h=
ost
> -using this device side pin and wakeup latency.
> -
> -Example for SDIO device follows (calibration data is also available in
> -below example).
> -
> -&mmc3 {
> -       vmmc-supply =3D <&wlan_en_reg>;
> -       bus-width =3D <4>;
> -       cap-power-off-card;
> -       keep-power-in-suspend;
> -
> -       #address-cells =3D <1>;
> -       #size-cells =3D <0>;
> -       btmrvl: bluetooth@2 {
> -               compatible =3D "marvell,sd8897-bt";
> -               reg =3D <2>;
> -               interrupt-parent =3D <&pio>;
> -               interrupts =3D <119 IRQ_TYPE_LEVEL_LOW>;
> -
> -               marvell,cal-data =3D /bits/ 8 <
> -                       0x37 0x01 0x1c 0x00 0xff 0xff 0xff 0xff 0x01 0x7f=
 0x04 0x02
> -                       0x00 0x00 0xba 0xce 0xc0 0xc6 0x2d 0x00 0x00 0x00=
 0x00 0x00
> -                       0x00 0x00 0xf0 0x00>;
> -               marvell,wakeup-pin =3D /bits/ 16 <0x0d>;
> -               marvell,wakeup-gap-ms =3D /bits/ 16 <0x64>;
> -       };
> -};
> -
> -Example for USB device:
> -
> -&usb_host1_ohci {
> -    #address-cells =3D <1>;
> -    #size-cells =3D <0>;
> -
> -    mvl_bt1: bt@1 {
> -       compatible =3D "usb1286,204e";
> -       reg =3D <1>;
> -       interrupt-parent =3D <&gpio0>;
> -       interrupt-names =3D "wakeup";
> -       interrupts =3D <119 IRQ_TYPE_LEVEL_LOW>;
> -       marvell,wakeup-pin =3D /bits/ 16 <0x0d>;
> -       marvell,wakeup-gap-ms =3D /bits/ 16 <0x64>;
> -    };
> -};
> --
> 2.50.1
>
