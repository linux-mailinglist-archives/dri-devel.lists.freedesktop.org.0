Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC38173FD2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 19:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184486F4B0;
	Fri, 28 Feb 2020 18:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9211F6F4B1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 18:42:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2EED82004C;
 Fri, 28 Feb 2020 19:42:44 +0100 (CET)
Date: Fri, 28 Feb 2020 19:42:42 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT
 Schema
Message-ID: <20200228184242.GA20089@ravnborg.org>
References: <cover.1582913973.git.hns@goldelico.com>
 <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=r_1tXGB3AAAA:8 a=ztCEdXhiAAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8
 a=pSfg_kgG_YkFMEKRir4A:9 a=qn4TxXM_sh0ilUaX:21 a=kcv_VjDv9XC6Jkun:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=nCm3ceeH17rKjHWsMeRo:22 a=AjGcO6oz07-iQ99wixmX:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 devicetree@vger.kernel.org,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 letux-kernel@openphoenux.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus.

On Fri, Feb 28, 2020 at 07:19:26PM +0100, H. Nikolaus Schaller wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the LCD controller on the jz4780 SoC
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org

As this patch was sent to you and you forward it you need to
testify that this is OK.
To do so follow the rules of the Developemnt Certificate of Origin
as can be found in SubmittingPatches.rst.

In other words - you need to add your Signed-off-by: xxx <mail>
to the patch.
In the end we want to be able to see the patch the patch has taken
reading the Signed-off-by: lines from top to bottom.

Please check other patches in this series for the same issue.

	Sam

> ---
>  .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> new file mode 100644
> index 000000000000..c71415a3a342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
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
> +
> +description: |
> +  LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: ingenic,jz4780-lcd
> +
> +  reg:
> +    maxItems: 1
> +    description: the address & size of the LCD controller registers
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the interrupt provided by parent
> +
> +  clocks:
> +    maxItems: 2
> +    description: Clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK
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
> +        compatible = "ingenic,jz4780-lcd";
> +        reg = <0x13050000 0x1800>;
> +
> +        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +        clock-names = "lcd_clk", "lcd_pixclk";
> +
> +        interrupt-parent = <&intc>;
> +        interrupts = <31>;
> +
> +        jz4780_lcd_out: port {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            jz4780_out_hdmi: endpoint@0 {
> +                reg = <0>;
> +                remote-endpoint = <&hdmi_in_lcd>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.23.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
