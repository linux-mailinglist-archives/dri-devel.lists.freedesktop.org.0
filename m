Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E94177127
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77DE6EA2B;
	Tue,  3 Mar 2020 08:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EEB6E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583176813; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9b0Z/Qba7LUP/RrSMDKMHs9SQ88poHoZJgYnVCQFASA=;
 b=d0MKOFwQvBM6ClQa3yJHcMLwqnFovSbXy6cAQd+XKMeESguGlK4NDxP3myaRBaTVDvLJpD
 mPGCFhxHF+bJlFt69p4zpUGcDFAXl7UCG36KcDmYg19DagklpthXmJ9fWu8kzJMlrsTQJJ
 2yrP7XgiI383KknSTRt8OErBlYnXfLg=
Date: Mon, 02 Mar 2020 16:19:47 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v2 2/8] dt-bindings: display: add ingenic-jz4780-hdmi DT
 Schema
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <1583176788.3.3@crapouillou.net>
In-Reply-To: <0fb2f39437ea04fb4de889aac001b44f4b0a77e8.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
 <0fb2f39437ea04fb4de889aac001b44f4b0a77e8.1582913973.git.hns@goldelico.com>
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

> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
> Based on .txt binding from Zubair Lutfullah Kakakhel
> =

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-hdmi.yaml | 83 =

> +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 =

> Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> =

> diff --git =

> a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml =

> b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> new file mode 100644
> index 000000000000..9b71c427bd69
> --- /dev/null
> +++ =

> b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
> +
> +maintainers:
> +  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> +  - H. Nikolaus Schaller <hns@goldelico.com>

Did Zubair write this glue driver? He's been MIA for a while, doesn't =

work at ImgTec anymore, and this email doesn't work.

> +
> +description: |
> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys =

> DesignWare HDMI 1.4
> +  TX controller IP with accompanying PHY IP.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ingenic,jz4780-hdmi
> +
> +  reg:
> +    maxItems: 1
> +    description: the address & size of the LCD controller registers

Remove the description here,

> +
> +  reg-io-width:
> +    const: 4
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent

and here.

The rule is that if there is only one "reg", "interrupts" or "clocks" =

entry then a description is not needed as it's pretty obvious what it's =

for.

> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for isrf and iahb clocks

You need two 'description:' like this:

clocks:
  items:
    - description: ISRF clock
    - description: IAHB clock

Cheers,
-Paul

> +
> +  clock-names:
> +    items:
> +      - const: isfr
> +      - const: iahb
> +
> +  ddc-i2c-bus: true
> +  ports: true
> +
> +required:
> +    - compatible
> +    - clocks
> +    - clock-names
> +    - ports
> +    - reg-io-width
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +
> +    hdmi: hdmi@10180000 {
> +        compatible =3D "ingenic,jz4780-hdmi";
> +        reg =3D <0x10180000 0x8000>;
> +        reg-io-width =3D <4>;
> +        ddc-i2c-bus =3D <&i2c4>;
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <3>;
> +        clocks =3D <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
> +        clock-names =3D "isfr", "iahb";
> +
> +        ports {
> +            hdmi_in: port {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                hdmi_in_lcd: endpoint@0 {
> +                    reg =3D <0>;
> +                    remote-endpoint =3D <&jz4780_out_hdmi>;
> +                };
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
