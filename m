Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390717711F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1107C6EA13;
	Tue,  3 Mar 2020 08:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD87A6E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 19:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583176271; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qUmHkSVvfOQ5Yez5YuN7iPqIHHCEuQ8Hl+LgCyysZ2Q=;
 b=BlykB7esCbADKOpKOWvsF8w+P1xUQvIHP69KiK3i5TAjC1e4cmyehG9seXh2uM72hjU4De
 LtpjoJdkiGjMLoK0e+x7J84RRbY1IzMR9cjbk3AOrS3l8cG+mJW+1Xwshp3b0nLOIOXNcn
 QvgAPyYOMfmzPgqGwwPfBotzZ92pzYc=
Date: Mon, 02 Mar 2020 16:10:47 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT
 Schema
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1583176247.3.2@crapouillou.net>
In-Reply-To: <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Andi Kleen <ak@linux.intel.com>, Paul Burton <paulburton@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 letux-kernel@openphoenux.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,


Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller =

<hns@goldelico.com> a =E9crit :
> From: Sam Ravnborg <sam@ravnborg.org>
> =

> Add DT bindings for the LCD controller on the jz4780 SoC
> Based on .txt binding from Zubair Lutfullah Kakakhel

If you mean Documentation/devicetree/bindings/display/ingenic,lcd.txt =

then it was written by me.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 =

> +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 =

> Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> =

> diff --git =

> a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml =

> b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> new file mode 100644
> index 000000000000..c71415a3a342
> --- /dev/null
> +++ =

> b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-lcd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 LCD Controller
> +
> +maintainers:
> +  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> +  - H. Nikolaus Schaller <hns@goldelico.com>

I'm the author of the driver, please put me here; and remove Zubair, =

which 1. didn't touch the DRM driver at all, and 2. isn't working at =

ImgTec anymore. Also, no need to put yourself here, unless you maintain =

the Ingenic DRM/KMS driver.

> +
> +description: |
> +  LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
> +
> +properties:

You should add a '$nodename' property.

> +  compatible:
> +    items:
> +      - const: ingenic,jz4780-lcd

The .txt lists more compatible strings. Please add them all.

> +
> +  reg:
> +    maxItems: 1
> +    description: the address & size of the LCD controller registers

Drop the description here,

> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent

and here.

> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for the JZ4780_CLK_TVE =

> JZ4780_CLK_LCD0PIXCLK

Add one 'description:' per item.

> +
> +  clock-names:
> +    items:
> +      - const: lcd_clk
> +      - const: lcd_pixclk
> +
> +  port:
> +    type: object
> +    description: |
> +      A port node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +required:
> +    - compatible
> +    - reg
> +    - interrupts
> +    - clocks
> +    - clock-names
> +    - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +    lcd: jz4780-lcdk@0x13050000 {

The node name does not comply with the DT spec, it should be =

'lcd-controller'.

Cheers,
-Paul

> +        compatible =3D "ingenic,jz4780-lcd";
> +        reg =3D <0x13050000 0x1800>;
> +
> +        clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +        clock-names =3D "lcd_clk", "lcd_pixclk";
> +
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <31>;
> +
> +        jz4780_lcd_out: port {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            jz4780_out_hdmi: endpoint@0 {
> +                reg =3D <0>;
> +                remote-endpoint =3D <&hdmi_in_lcd>;
> +            };
> +        };
> +    };
> +
> +...
> --
> 2.23.0
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
