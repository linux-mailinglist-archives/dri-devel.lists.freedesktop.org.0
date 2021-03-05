Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3632F943
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 11:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C336E4D4;
	Sat,  6 Mar 2021 10:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 363 seconds by postgrey-1.36 at gabe;
 Fri, 05 Mar 2021 17:30:44 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5ED6EC06
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1614965077; bh=5Y+9PdnDq+BMTwfZCHboxIyKzCWxFiVB0rNq3zU7Vbk=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=UbOJJomFwtAtzPxgqchpo3YN54Agn9GrD/hgCsktzFSqUirjtbFS8wKbe3AaLMkh2
 bpmkZzvWfDfXupyxlwE2QFCQvUG2chxyqYekMPJMWcmhG3WVMvooX0KwcgQNf2dkia
 pR5kGj0wHHeSUDxF6pH88CHsZBQB1VGnyY2oow24=
Date: Fri, 5 Mar 2021 18:24:37 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add analogix,anx7688.yaml
Message-ID: <20210305172437.meu45ol7d4c3w2lr@core.my.home>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-2-dafna.hirschfeld@collabora.com>
 <YEJBgEPO4J5+/HhD@pendragon.ideasonboard.com>
 <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35f505ee-d939-4b42-490b-321b961bdec3@collabora.com>
X-Mailman-Approved-At: Sat, 06 Mar 2021 10:04:47 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, drinkcat@chromium.org,
 narmstrong@baylibre.com, airlied@linux.ie, enric.balletbo@collabora.com,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, jonas@kwiboo.se, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 chunkuang.hu@kernel.org, kernel@collabora.com, dafna3@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dafna,

On Fri, Mar 05, 2021 at 04:14:03PM +0100, Dafna Hirschfeld wrote:
> Hi
> 
> On 05.03.21 15:34, Laurent Pinchart wrote:
> > Hi Dafna,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Mar 05, 2021 at 01:43:50PM +0100, Dafna Hirschfeld wrote:
> > > ANX7688 is a USB Type-C port controller with a MUX. It converts HDMI 2.0 to
> > > DisplayPort 1.3 Ultra-HDi (4096x2160p60).
> > > The integrated crosspoint switch (the MUX) supports USB 3.1 data transfer
> > > along with the DisplayPort Alternate Mode signaling over USB Type-C.
> > > Additionally, an on-chip microcontroller (OCM) is available to manage the
> > > signal switching, Channel Configuration (CC) detection, USB Power
> > > Delivery (USB-PD), Vendor Defined Message (VDM) protocol support and other
> > > functions as defined in the USB TypeC and USB Power Delivery
> > > specifications.
> > > 
> > > ANX7688 is found on Acer Chromebook R13 (elm) and on
> > > Pine64 PinePhone.

Thanks for your work on the bindings. :) It would be great to find something
acceptable for mainlining.

A few comments based on my experience implementing the USB-PD part for PinePhone
are bellow.

> > > +properties:
> > > +  compatible:
> > > +    const: analogix,anx7688
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  avdd33-supply:
> > > +    description: 3.3V Analog core supply voltage.
> > > +
> > > +  dvdd18-supply:
> > > +    description: 1.8V Digital I/O supply voltage.
> > > +
> > > +  avdd18-supply:
> > > +    description: 1.8V Analog core power supply voltage.
> > > +
> > > +  avdd10-supply:
> > > +    description: 1.0V Analog core power supply voltage.
> > > +
> > > +  dvdd10-supply:
> > > +    description: 1.0V Digital core supply voltage.
> > > +
> > 
> > That's lots of supplies. If there's a reasonable chance that some of
> > them will always be driven by the same regulator (especially if the
> > ANX7688 documentation requires that), then they could be grouped. For
> > instance dvdd18-supply and avdd18-supply could be grouped into
> > vdd18-supply. It would still allow us to extend the bindings in a
> > backward compatible way later if a system uses different regulators. You
> > have more information about the hardware than I do, so it's your call.

On PinePhone, AVDD and DVDD for 1.0V are just separately fitlered outputs
from the same regulator. So it would work there to just use vdd18 and
vdd10. The same is true for reference design, so it's probably safe
to assume this can be simplified.

> > > +  hdmi5v-supply:
> > > +    description: 5V power supply for the HDMI.
> > > +
> > > +  hdmi_vt-supply:
> > > +    description: Termination voltage for HDMI input.
> > 
> > Maybe hdmi-vt-supply ?
> > 
> > > +
> > > +  clocks:
> > > +    description: The input clock specifier.
> > > +    maxItems: 1
> > 
> > How about
> > 
> >      items:
> >        - description: The input clock specifier.
> > 
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: xtal
> > > +
> > > +  hpd-gpios:
> > > +    description: |
> > > +      In USB Type-C applications, DP_HPD has no use. In standard DisplayPort
> > > +      applications, DP_HPD is used as DP hot-plug.
> > > +    maxItems: 1

On PinePhone this is wired to a HDMI port on the SoC, and HPD is handled by the
sun4i HDMI DRM driver. Seems like HPD will be handled by HDMI controller on
many/all? other platforms too. Why have it here?

> > > +  enable-gpios:
> > > +    description: Chip power down control. No internal pull-down or pull-up resistor.
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    description: Reset input signal. Active low.
> > > +    maxItems: 1
> > > +
> > > +  vbus-det-gpios:
> > > +    description: |
> > > +      An input gpio for VBUS detection and high voltage detection,
> > > +      external resistance divide VBUS voltage to 1/8.
> > > +    maxItems: 1

Why have this in the bindings? It seems that this is handled internally by the
ANX7688 via OCM firmware. And it's not really gpio either, it's an analog input
with AD converter hooked to it internally.

> > > +  interrupts:
> > > +    description: |
> > > +      The interrupt notifies 4 possible events - TCPC ALERT int, PD int, DP int, HDMI int.
> > > +    maxItems: 1
> > > +
> > > +  cabledet-gpios:
> > > +    description: An output gpio, indicates by the device that a cable is plugged.
> > > +    maxItems: 1
> > > +
> > > +  vbus-ctrl-gpios:
> > > +    description:
> > > +      External VBUS power path. Enable VBUS source and disable VBUS sink or vice versa.
> > > +    maxItems: 1

VBUS control seems to be already modelled by the usb-connector bindings. Why
have this here?

> > > +  vconn-en1-gpios:
> > > +    description: Controls the VCONN switch on the CC1 pin.
> > > +    maxItems: 1
> > > +
> > > +  vconn-en2-gpios:
> > > +    description: Controls the VCONN switch on the CC2 pin.
> > > +    maxItems: 1

VCONN is a voltage regulator that can be enabled either on CC1 or CC2
pin, or disabled completely. This control is *partially* performed in reference
design directly by the OCM. OCM only decides which CC pin to switch
the VCONN regulator to, and informs the SoC when the base VCONN regulator
for the switches needs to be enabled.

So vconn-en1/2 gpios are irrelevant to the driver, but the driver needs
to control VCONN power supply somehow and defer control over it to the OCM.

I don't know how to express it in the bindings. Maybe a vconn-supply here
on the anx7688 node?

It may also be part of the usb-connector binding, but this is really when it
comes to anx7688 a parent regulator for the switches, and switches are not
controlled by this driver, just their parent regulator is.

Any ideas?

kind regards,
	o.

> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Video port for HDMI input.
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: USB port for the USB3 input.
> > > +
> > > +      port@2:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: USB Type-c connector, see connector/usb-connector.yaml.
> > > +
> > > +    required:
> > > +      - port@0
> > 
> > As all the ports exist at the hardware level, should they always be
> > present ? The endpoints are optional of course, in case a port isn't
> > connected on a particular system.
> > 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > 
> > Shouldn't clocks and regulators be also required ?
> 
> hmm, theoretically yes. Practically, in the case of Acer R13 (mediatek elm) device,
> the ANX7688 is powered up and controlled by the Embedded Controller. The kernel only
> needs to read few registers from that device for the drm bridge driver.
> (also mentioned that in the cover letter).
> 
> Thanks,
> Dafna
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
