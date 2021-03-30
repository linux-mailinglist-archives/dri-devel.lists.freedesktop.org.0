Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF7C34E931
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 15:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603496E8F8;
	Tue, 30 Mar 2021 13:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A31D6E8F8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 13:35:24 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:2d37:13aa:2f32:9c00] (unknown
 [IPv6:2a02:810a:880:f54:2d37:13aa:2f32:9c00])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 45ED91F454B8;
 Tue, 30 Mar 2021 14:35:22 +0100 (BST)
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add analogix,anx7688.yaml
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-2-dafna.hirschfeld@collabora.com>
 <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
 <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
 <YEJL+T7IaW8Asq1Q@pendragon.ideasonboard.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <7729b82c-ff87-8d05-366c-4c0a6b85a8f2@collabora.com>
Date: Tue, 30 Mar 2021 15:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YEJL+T7IaW8Asq1Q@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: megous@megous.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 linux-usb@vger.kernel.org, narmstrong@baylibre.com, airlied@linux.ie,
 enric.balletbo@collabora.com, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, drinkcat@chromium.org, hsinyi@chromium.org,
 chunkuang.hu@kernel.org, robh+dt@kernel.org, kernel@collabora.com,
 dafna3@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 05.03.21 16:19, Laurent Pinchart wrote:
> Hi Dafna,
> 
> On Fri, Mar 05, 2021 at 04:14:03PM +0100, Dafna Hirschfeld wrote:
>> On 05.03.21 15:34, Laurent Pinchart wrote:
>>> On Fri, Mar 05, 2021 at 01:43:50PM +0100, Dafna Hirschfeld wrote:
>>>> ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
>>>> DisplayPort 1.3 Ultra-HDi (4096x2160p60).
>>>> The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer
>>>> along with the DisplayPort Alternate Mode signaling over USB Type-C.
>>>> Additionally, an on-chip microcontroller (OCM) is available to manage the
>>>> signal switching, Channel Configuration (CC) detection, USB Power
>>>> Delivery (USB-PD), Vendor Defined Message (VDM) protocol support and other
>>>> functions as defined in the USB TypeC and USB Power Delivery
>>>> specifications.
>>>>
>>>> ANX7688 is found on Acer Chromebook R13 (elm) and on
>>>> Pine64 PinePhone.
>>>>
>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> ---
>>>>    .../bindings/usb/analogix,anx7688.yaml        | 177 ++++++++++++++++++
>>>>    1 file changed, 177 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml b/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>>>> new file mode 100644
>>>> index 000000000000..6c4dd6b4b28b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
>>>> @@ -0,0 +1,177 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/usb/analogix,anx7688.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Analogix ANX7688 Type-C Port Controller with HDMI to DP conversion
>>>> +
>>>> +maintainers:
>>>> +  - Nicolas Boichat <drinkcat@chromium.org>
>>>> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> +
>>>> +description: |
>>>> +  ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
>>>> +  DisplayPort 1.3 Ultra-HDi (4096x2160p60).
>>>> +  The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer along with
>>>> +  the DisplayPort Alternate Mode signaling over USB Type-C. Additionally,
>>>> +  an on-chip microcontroller (OCM) is available to manage the signal switching,
>>>> +  Channel Configuration (CC) detection, USB Power Delivery (USB-PD), Vendor
>>>> +  Defined Message (VDM) protocol support and other functions as defined in the
>>>> +  USB TypeC and USB Power Delivery specifications.
>>>> +
>>>> +
>>>
>>> Extra blank line ?
>>>
>>>> +properties:
>>>> +  compatible:
>>>> +    const: analogix,anx7688
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  avdd33-supply:
>>>> +    description: 3.3V Analog core supply voltage.
>>>> +
>>>> +  dvdd18-supply:
>>>> +    description: 1.8V Digital I/O supply voltage.
>>>> +
>>>> +  avdd18-supply:
>>>> +    description: 1.8V Analog core power supply voltage.
>>>> +
>>>> +  avdd10-supply:
>>>> +    description: 1.0V Analog core power supply voltage.
>>>> +
>>>> +  dvdd10-supply:
>>>> +    description: 1.0V Digital core supply voltage.
>>>> +
>>>
>>> That's lots of supplies. If there's a reasonable chance that some of
>>> them will always be driven by the same regulator (especially if the
>>> ANX7688 documentation requires that), then they could be grouped. For
>>> instance dvdd18-supply and avdd18-supply could be grouped into
>>> vdd18-supply. It would still allow us to extend the bindings in a
>>> backward compatible way later if a system uses different regulators. You
>>> have more information about the hardware than I do, so it's your call.

Can you explain what do you mean by 'grouped' ?
Do you mean that instead of having two properties dvdd18-supply and avdd18-supply
I have only one property vdd18-supply?

>>>
>>>> +  hdmi5v-supply:
>>>> +    description: 5V power supply for the HDMI.
>>>> +
>>>> +  hdmi_vt-supply:
>>>> +    description: Termination voltage for HDMI input.
>>>
>>> Maybe hdmi-vt-supply ?
>>>
>>>> +
>>>> +  clocks:
>>>> +    description: The input clock specifier.
>>>> +    maxItems: 1
>>>
>>> How about
>>>
>>>       items:
>>>         - description: The input clock specifier.
>>>
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: xtal
>>>> +
>>>> +  hpd-gpios:
>>>> +    description: |
>>>> +      In USB Type-C applications, DP_HPD has no use. In standard DisplayPort
>>>> +      applications, DP_HPD is used as DP hot-plug.
>>>> +    maxItems: 1
>>>> +
>>>> +  enable-gpios:
>>>> +    description: Chip power down control. No internal pull-down or pull-up resistor.
>>>> +    maxItems: 1
>>>> +
>>>> +  reset-gpios:
>>>> +    description: Reset input signal. Active low.
>>>> +    maxItems: 1
>>>> +
>>>> +  vbus-det-gpios:
>>>> +    description: |
>>>> +      An input gpio for VBUS detection and high voltage detection,
>>>> +      external resistance divide VBUS voltage to 1/8.
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    description: |
>>>> +      The interrupt notifies 4 possible events - TCPC ALERT int, PD int, DP int, HDMI int.
>>>> +    maxItems: 1
>>>> +
>>>> +  cabledet-gpios:
>>>> +    description: An output gpio, indicates by the device that a cable is plugged.
>>>> +    maxItems: 1
>>>> +
>>>> +  vbus-ctrl-gpios:
>>>> +    description:
>>>> +      External VBUS power path. Enable VBUS source and disable VBUS sink or vice versa.
>>>> +    maxItems: 1
>>>> +
>>>> +  vconn-en1-gpios:
>>>> +    description: Controls the VCONN switch on the CC1 pin.
>>>> +    maxItems: 1
>>>> +
>>>> +  vconn-en2-gpios:
>>>> +    description: Controls the VCONN switch on the CC2 pin.
>>>> +    maxItems: 1
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    properties:
>>>> +      port@0:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: Video port for HDMI input.
>>>> +
>>>> +      port@1:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: USB port for the USB3 input.
>>>> +
>>>> +      port@2:
>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>> +        description: USB Type-c connector, see connector/usb-connector.yaml.
>>>> +
>>>> +    required:
>>>> +      - port@0
>>>
>>> As all the ports exist at the hardware level, should they always be
>>> present ? The endpoints are optional of course, in case a port isn't
>>> connected on a particular system.
>>>
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>
>>> Shouldn't clocks and regulators be also required ?
>>
>> hmm, theoretically yes. Practically, in the case of Acer R13 (mediatek elm) device,
>> the ANX7688 is powered up and controlled by the Embedded Controller. The kernel only
>> needs to read few registers from that device for the drm bridge driver.
>> (also mentioned that in the cover letter).
> 
> This may not be a popular opinion, but if the ANX7688 is fully
> controlled by the EC, I wonder if we shouldn't have an "EC DRM bridge"
> driver that would interrogate the EC instead :-)

But the driver in patch 2/2 do access the anx7688 device with I2C.
It does interrogate the EC.

> 
> Is there a risk of bus conflicts if the EC and the main SoC try to
> access the ANX7688 over I2C at the same time ?

The SoC access the anx7688 though something called 'i2c-tunnel' (see google,cros-ec-i2c-tunnel.yaml)
So the I2C tunnels though the EC (I don't know how this is really implemented to be honest).


Thanks,
Dafna

> 
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +
>>>> +    i2c0 {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        anx7688: anx7688@2c {
>>>> +            compatible = "analogix,anx7688";
>>>> +            reg = <0x2c>;
>>>> +            avdd33-supply = <&reg_dcdc1>;
>>>> +            dvdd18-supply = <&reg_ldo_io1>;
>>>> +            avdd18-supply = <&reg_ldo_io1>;
>>>> +            avdd10-supply = <&reg_anx1v0>;
>>>> +            dvdd10-supply = <&reg_anx1v0>;
>>>> +            hdmi_vt-supply = <&reg_dldo1>;
>>>> +            enable-gpios = <&pio 3 10 GPIO_ACTIVE_LOW>; /* PD10 */
>>>> +            reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
>>>> +            interrupt-parent = <&r_pio>;
>>>> +            interrupts = <0 11 IRQ_TYPE_EDGE_FALLING>; /* PL11 */
>>>> +            cabledet-gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
>>>> +            vconn-en1-gpios = <&pio 3 9 GPIO_ACTIVE_LOW>; /* PD9 */
>>>> +            vconn-en2-gpios = <&pio 3 9 GPIO_ACTIVE_LOW>; /* PD9 */
>>>> +            ports {
>>>> +                #address-cells = <1>;
>>>> +                #size-cells = <0>;
>>>> +
>>>> +                port@0 {
>>>> +                    reg = <0>;
>>>> +                    anx7688_in0: endpoint {
>>>> +                        remote-endpoint = <&hdmi0_out>;
>>>> +                    };
>>>> +                };
>>>> +
>>>> +                port@1 {
>>>> +                    reg = <1>;
>>>> +                    anx7688_in1: endpoint {
>>>> +                        remote-endpoint = <&usbdrd_phy_ss>;
>>>> +                    };
>>>> +                };
>>>> +                port@2 {
>>>> +                    reg = <2>;
>>>> +                    anx7688_out: endpoint {
>>>> +                        remote-endpoint = <&typec_connector>;
>>>> +                    };
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
