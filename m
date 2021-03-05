Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718332EE4B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD826EB58;
	Fri,  5 Mar 2021 15:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD116EB58
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:19:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF8C4CC;
 Fri,  5 Mar 2021 16:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614957592;
 bh=OJaSeqHuYX4URWLTn0r4dTt7CYEu53v9sGWUz0AdWqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r6OXEZOcCitV4MvEGH7aJ510S5qKfHLYCNXrVody+ALgDxGySoRAgHh5duY546TM2
 lgsQssiDUR3N54Ym308GGYr8/ZfRUrnRpATayxH93zOGisXT8ZMhcEA1M1vs6qRiSl
 xYbwW/Lmk0Rb2fwdv9qDqrFMrlobU9ve9Er8JKa8=
Date: Fri, 5 Mar 2021 17:19:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add analogix,anx7688.yaml
Message-ID: <YEJL+T7IaW8Asq1Q@pendragon.ideasonboard.com>
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-2-dafna.hirschfeld@collabora.com>
 <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
 <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dafna,

On Fri, Mar 05, 2021 at 04:14:03PM +0100, Dafna Hirschfeld wrote:
> On 05.03.21 15:34, Laurent Pinchart wrote:
> > On Fri, Mar 05, 2021 at 01:43:50PM +0100, Dafna Hirschfeld wrote:
> >> ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
> >> DisplayPort 1.3 Ultra-HDi (4096x2160p60).
> >> The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer
> >> along with the DisplayPort Alternate Mode signaling over USB Type-C.
> >> Additionally, an on-chip microcontroller (OCM) is available to manage the
> >> signal switching, Channel Configuration (CC) detection, USB Power
> >> Delivery (USB-PD), Vendor Defined Message (VDM) protocol support and other
> >> functions as defined in the USB TypeC and USB Power Delivery
> >> specifications.
> >>
> >> ANX7688 is found on Acer Chromebook R13 (elm) and on
> >> Pine64 PinePhone.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>   .../bindings/usb/analogix,anx7688.yaml        | 177 ++++++++++++++++++
> >>   1 file changed, 177 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml b/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
> >> new file mode 100644
> >> index 000000000000..6c4dd6b4b28b
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/usb/analogix,anx7688.yaml
> >> @@ -0,0 +1,177 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/usb/analogix,anx7688.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Analogix ANX7688 Type-C Port Controller with HDMI to DP conversion
> >> +
> >> +maintainers:
> >> +  - Nicolas Boichat <drinkcat@chromium.org>
> >> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> +
> >> +description: |
> >> +  ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
> >> +  DisplayPort 1.3 Ultra-HDi (4096x2160p60).
> >> +  The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer along with
> >> +  the DisplayPort Alternate Mode signaling over USB Type-C. Additionally,
> >> +  an on-chip microcontroller (OCM) is available to manage the signal switching,
> >> +  Channel Configuration (CC) detection, USB Power Delivery (USB-PD), Vendor
> >> +  Defined Message (VDM) protocol support and other functions as defined in the
> >> +  USB TypeC and USB Power Delivery specifications.
> >> +
> >> +
> > 
> > Extra blank line ?
> > 
> >> +properties:
> >> +  compatible:
> >> +    const: analogix,anx7688
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  avdd33-supply:
> >> +    description: 3.3V Analog core supply voltage.
> >> +
> >> +  dvdd18-supply:
> >> +    description: 1.8V Digital I/O supply voltage.
> >> +
> >> +  avdd18-supply:
> >> +    description: 1.8V Analog core power supply voltage.
> >> +
> >> +  avdd10-supply:
> >> +    description: 1.0V Analog core power supply voltage.
> >> +
> >> +  dvdd10-supply:
> >> +    description: 1.0V Digital core supply voltage.
> >> +
> > 
> > That's lots of supplies. If there's a reasonable chance that some of
> > them will always be driven by the same regulator (especially if the
> > ANX7688 documentation requires that), then they could be grouped. For
> > instance dvdd18-supply and avdd18-supply could be grouped into
> > vdd18-supply. It would still allow us to extend the bindings in a
> > backward compatible way later if a system uses different regulators. You
> > have more information about the hardware than I do, so it's your call.
> > 
> >> +  hdmi5v-supply:
> >> +    description: 5V power supply for the HDMI.
> >> +
> >> +  hdmi_vt-supply:
> >> +    description: Termination voltage for HDMI input.
> > 
> > Maybe hdmi-vt-supply ?
> > 
> >> +
> >> +  clocks:
> >> +    description: The input clock specifier.
> >> +    maxItems: 1
> > 
> > How about
> > 
> >      items:
> >        - description: The input clock specifier.
> > 
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: xtal
> >> +
> >> +  hpd-gpios:
> >> +    description: |
> >> +      In USB Type-C applications, DP_HPD has no use. In standard DisplayPort
> >> +      applications, DP_HPD is used as DP hot-plug.
> >> +    maxItems: 1
> >> +
> >> +  enable-gpios:
> >> +    description: Chip power down control. No internal pull-down or pull-up resistor.
> >> +    maxItems: 1
> >> +
> >> +  reset-gpios:
> >> +    description: Reset input signal. Active low.
> >> +    maxItems: 1
> >> +
> >> +  vbus-det-gpios:
> >> +    description: |
> >> +      An input gpio for VBUS detection and high voltage detection,
> >> +      external resistance divide VBUS voltage to 1/8.
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    description: |
> >> +      The interrupt notifies 4 possible events - TCPC ALERT int, PD int, DP int, HDMI int.
> >> +    maxItems: 1
> >> +
> >> +  cabledet-gpios:
> >> +    description: An output gpio, indicates by the device that a cable is plugged.
> >> +    maxItems: 1
> >> +
> >> +  vbus-ctrl-gpios:
> >> +    description:
> >> +      External VBUS power path. Enable VBUS source and disable VBUS sink or vice versa.
> >> +    maxItems: 1
> >> +
> >> +  vconn-en1-gpios:
> >> +    description: Controls the VCONN switch on the CC1 pin.
> >> +    maxItems: 1
> >> +
> >> +  vconn-en2-gpios:
> >> +    description: Controls the VCONN switch on the CC2 pin.
> >> +    maxItems: 1
> >> +
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@0:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Video port for HDMI input.
> >> +
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: USB port for the USB3 input.
> >> +
> >> +      port@2:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: USB Type-c connector, see connector/usb-connector.yaml.
> >> +
> >> +    required:
> >> +      - port@0
> > 
> > As all the ports exist at the hardware level, should they always be
> > present ? The endpoints are optional of course, in case a port isn't
> > connected on a particular system.
> > 
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> > 
> > Shouldn't clocks and regulators be also required ?
> 
> hmm, theoretically yes. Practically, in the case of Acer R13 (mediatek elm) device,
> the ANX7688 is powered up and controlled by the Embedded Controller. The kernel only
> needs to read few registers from that device for the drm bridge driver.
> (also mentioned that in the cover letter).

This may not be a popular opinion, but if the ANX7688 is fully
controlled by the EC, I wonder if we shouldn't have an "EC DRM bridge"
driver that would interrogate the EC instead :-)

Is there a risk of bus conflicts if the EC and the main SoC try to
access the ANX7688 over I2C at the same time ?

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/gpio/gpio.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    i2c0 {
> >> +        #address-cells = <1>;
> >> +        #size-cells = <0>;
> >> +
> >> +        anx7688: anx7688@2c {
> >> +            compatible = "analogix,anx7688";
> >> +            reg = <0x2c>;
> >> +            avdd33-supply = <&reg_dcdc1>;
> >> +            dvdd18-supply = <&reg_ldo_io1>;
> >> +            avdd18-supply = <&reg_ldo_io1>;
> >> +            avdd10-supply = <&reg_anx1v0>;
> >> +            dvdd10-supply = <&reg_anx1v0>;
> >> +            hdmi_vt-supply = <&reg_dldo1>;
> >> +            enable-gpios = <&pio 3 10 GPIO_ACTIVE_LOW>; /* PD10 */
> >> +            reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> >> +            interrupt-parent = <&r_pio>;
> >> +            interrupts = <0 11 IRQ_TYPE_EDGE_FALLING>; /* PL11 */
> >> +            cabledet-gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
> >> +            vconn-en1-gpios = <&pio 3 9 GPIO_ACTIVE_LOW>; /* PD9 */
> >> +            vconn-en2-gpios = <&pio 3 9 GPIO_ACTIVE_LOW>; /* PD9 */
> >> +            ports {
> >> +                #address-cells = <1>;
> >> +                #size-cells = <0>;
> >> +
> >> +                port@0 {
> >> +                    reg = <0>;
> >> +                    anx7688_in0: endpoint {
> >> +                        remote-endpoint = <&hdmi0_out>;
> >> +                    };
> >> +                };
> >> +
> >> +                port@1 {
> >> +                    reg = <1>;
> >> +                    anx7688_in1: endpoint {
> >> +                        remote-endpoint = <&usbdrd_phy_ss>;
> >> +                    };
> >> +                };
> >> +                port@2 {
> >> +                    reg = <2>;
> >> +                    anx7688_out: endpoint {
> >> +                        remote-endpoint = <&typec_connector>;
> >> +                    };
> >> +                };
> >> +            };
> >> +        };
> >> +    };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
