Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E276911F0E3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 09:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94686E328;
	Sat, 14 Dec 2019 08:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EC56E328
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 08:21:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0910B804F6;
 Sat, 14 Dec 2019 09:21:47 +0100 (CET)
Date: Sat, 14 Dec 2019 09:21:45 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v5 3/4] dt-bindings: Add binding for IT6505.
Message-ID: <20191214082145.GD22818@ravnborg.org>
References: <1575957299-12977-1-git-send-email-allen.chen@ite.com.tw>
 <1575957299-12977-4-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575957299-12977-4-git-send-email-allen.chen@ite.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Ns9eNvu6AAAA:8
 a=cm27Pg_UAAAA:8 a=gEfo2CItAAAA:8 a=7gkXJVJtAAAA:8 a=Dou_bMkpY0JcbTnmFP0A:9
 a=CjuIK1q_8ugA:10 a=LZLx1i01EnjtqRv10NxV:22 a=xmb-EsYY8bH0VWELuYED:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Allen.

On Tue, Dec 10, 2019 at 01:53:41PM +0800, allen wrote:
> Add a DT binding documentation for IT6505.
> 
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml        | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> new file mode 100644
> index 00000000..23a106a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: GPL-2.0
Please dual license new bindings like this:

(GPL-2.0-only OR BSD-2-Clause)


> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/ite,it6505.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE it6505 Device Tree Bindings
> +
> +maintainers:
> +  - Allen Chen <allen.chen@ite.com.tw>
> +
> +description: |
> +  The IT6505 is a high-performance DisplayPort 1.1a transmitter,
> +fully compliant with DisplayPort 1.1a, HDCP 1.3 specifications.
> +The IT6505 supports color depth of up to 36 bits (12 bits/color)
> +and ensures robust transmission of high-quality uncompressed video
> +content, along with uncompressed and compressed digital audio content.
Can we get consistent indent of the text here.
With this fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> +
> +  Aside from the various video output formats supported, the IT6505
> +also encodes and transmits up to 8 channels of I2S digital audio,
> +with sampling rate up to 192kHz and sample size up to 24 bits.
> +In addition, an S/PDIF input port takes in compressed audio of up to
> +192kHz frame rate.
> +
> +  Each IT6505 chip comes preprogrammed with an unique HDCP key,
> +in compliance with the HDCP 1.3 standard so as to provide secure
> +transmission of high-definition content. Users of the IT6505 need not
> +purchase any HDCP keys or ROMs.
> +
> +properties:
> +  compatible:
> +    const: ite,it6505
> +
> +  reg:
> +    - maxItems: 1
> +    - description: i2c address of the bridge
> +
> +  ovdd-supply:
> +    - maxItems: 1
> +    - description: I/O voltage
> +
> +  pwr18-supply:
> +    - maxItems: 1
> +    - description: core voltage
> +
> +  interrupts:
> +    - maxItems: 1
> +    - description: interrupt specifier of INT pin
> +
> +  reset-gpios:
> +    - maxItems: 1
> +    - description: gpio specifier of RESET pin
> +
> +  hpd-gpios:
> +    - maxItems: 1
> +    - description:
> +        - Hotplug detect GPIO
> +        - Indicates which GPIO should be used for hotplug detection
> +
> +  extcon:
> +    - maxItems: 1
> +    - description: extcon specifier for the Power Delivery
> +
> +  port:
> +    - type: object
> +    - description: A port node pointing to DPI host port node
> +
> +required:
> +  - compatible
> +  - reg
> +  - ovdd-supply
> +  - pwr18-supply
> +  - interrupts
> +  - reset-gpios
> +  - hpd-gpios
> +  - extcon
> +
> +examples:
> +  - |
> +    dp-bridge@5c {
> +        compatible = "ite,it6505";
> +        interrupts = <152 IRQ_TYPE_EDGE_RISING 152 0>;
> +        reg = <0x5c>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&it6505_pins>;
> +        ovdd-supply = <&mt6358_vsim1_reg>;
> +        pwr18-supply = <&it6505_pp18_reg>;
> +        reset-gpios = <&pio 179 1>;
> +        hpd-gpios = <&pio 9 0>;
> +        extcon = <&usbc_extcon>;
> +
> +        port {
> +            it6505_in: endpoint {
> +                remote-endpoint = <&dpi_out>;
> +            };
> +        };
> +    };
> +
> +---
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
