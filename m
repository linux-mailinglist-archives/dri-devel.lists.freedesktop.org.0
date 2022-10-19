Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316426045FC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 14:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E1210EF9F;
	Wed, 19 Oct 2022 12:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F350F10EAD4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 12:53:14 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id bh13so16165006pgb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 05:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y81h2vug6ZFljaTYznjsrWUdpzznggvoDmvJtXu5Hj8=;
 b=Vrq3Og4l0aTsPavvn6d70G0q5JTPrth0Dfnu3dFhIhlCoHwMH2uH4INdtooLYIsQgH
 T5/E1bkLdEK9n6B+FKRNRk4efccTlhLh7ZgsygLv5FkR/jL4ZOypsUJgTrHxpFMh+bIr
 y6B6KuAJ5VlN88toFuz7AZXbkPj4o8Q2fkB0m2nRFtm3WAc2dY5dO/QvMmn18/uknn7S
 TUq65jD7Rdn1lFxWD1ZmUum5voa5X9a28JrL5YURD8hndHTbfNnoSelhDlsj7VbYHSW6
 Kgx8uVcx9+uWcXpEjSmOJpv1a2Jm3N5+E02RyKNLlhks4z8MRLfeK2acEIyKdI5eJV8e
 YfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y81h2vug6ZFljaTYznjsrWUdpzznggvoDmvJtXu5Hj8=;
 b=QD1b0+j+jkbzhRxAhiDRgCOEbmOr2BojR16NCDwgAeLrsLEqNL4lbEODIzu3k4BQgS
 PyBi1Qq7bjwDuQBdu0kQpOc9V5AoDI75s9UiKZL7Wcpmg6BWdF6kIANukHOgO5x14DHE
 yT/OMUl/VzcD2F4/BOtPu9hnzuXEa0Wro7Hc99xn/ju2vIba9XHYw5jHXH0J72Y3Jt/C
 A32/HPJeBUESTyPD/SUVmydOYXBjevBJFgvx8k10HoAGZLJ7Unw6J/iJpX8tqhZsnujv
 7Q3xIkMOnpfVU4DkmS34rkzJjjPvD+i+ODKqyzO49sxF7/9e7QGLESqVyrmsPMhsCdW7
 y3+A==
X-Gm-Message-State: ACrzQf3nX79GV7Pzi1TBeTUCIUIv/shNKkcl+JDd8RvFP0nmVyaaWvsa
 CB18LhmkCDv7JEnpZk3zTKqSMC0969gta4eWVhI=
X-Google-Smtp-Source: AMsMyM5WH7dUW2PP90Zh8tbWF1+DbpPMVYBEJO4Ks75ZeaHN6v2UsMZ2w92ONL2mAe/35cc9OV0emMBjkQesWAJ1eGw=
X-Received: by 2002:a63:2a97:0:b0:457:23e9:586d with SMTP id
 q145-20020a632a97000000b0045723e9586dmr7117267pgq.190.1666183994498; Wed, 19
 Oct 2022 05:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-3-max.oss.09@gmail.com>
 <Y0gLdQleE64FQgn9@gaggiata.pivistrello.it>
 <CAPY8ntAszGzcp4XC=XKMHJvzCC9LHHf24pt=nZAUFKcK5=JM_Q@mail.gmail.com>
 <Y0tfRhn/f1FiGDi4@pendragon.ideasonboard.com>
In-Reply-To: <Y0tfRhn/f1FiGDi4@pendragon.ideasonboard.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 19 Oct 2022 14:53:03 +0200
Message-ID: <CAEHkU3W_8vGOPprMW=K3dKJc6AQQPCNVTwOP+aii_o4ohfmYQw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: add new bus-format property
 for panel-dpi
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, max.krummenacher@toradex.com,
 francesco.dolcini@toradex.com,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent


On Sun, Oct 16, 2022 at 3:33 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Fri, Oct 14, 2022 at 03:08:49PM +0100, Dave Stevenson wrote:
> > On Thu, 13 Oct 2022 at 13:58, Francesco Dolcini wrote:
> > > On Tue, Jun 28, 2022 at 08:18:36PM +0200, Max Krummenacher wrote:
> > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > >
> > > > The property is used to set the enum bus_format and infer the bpc
> > > > for a panel defined by 'panel-dpi'.
> > > > This specifies how the panel is connected to the display interface.
> > > >
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > >
> > >
> > > <snip>
> > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > > index dae0676b5c6e..52f5db03b6a8 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > > @@ -26,7 +26,28 @@ properties:
> > > >    height-mm: true
> > > >    label: true
> > > >    panel-timing: true
> > > > -  port: true
> > > > +
> > > > +  port:
> > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +    description:
> > > > +      Input port node, receives the panel data.
> > > > +
> > > > +    properties:
> > > > +      endpoint:
> > > > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > +
> > > > +        properties:
> > > > +          bus-format:
> > > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > > +            minimum: 0x1001
> > > > +            maximum: 0x1fff
> > > > +            description: |
> > > > +              Describes how the display panel is connected to the display interface.
> > > > +              Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
> > > > +              The mapping between the color/significance of the panel lines to the
> > > > +              parallel data lines are defined in:
> > > > +              https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
> > > > +
> > >
> > > Last month I had the chance to talk in person about this topic with
> > > Dave, Marek and Max in Dublin.
> > >
> > > My understanding is that this change is addressing a general need, Dave
> > > confirmed me they have a downstream patch for raspberrypi [1].
> > >
> > > From what I could tell the only concern is about the actual encoding of
> > > this `bus-format` property.
> > >
> > > I am personally convinced that a simple enum is the way to go, I think
> > > that Marek proposal is adding complexity and not flexibility (from my
> > > understanding Dave is on the same page, just correct me if I
> > > misunderstood you).
> >
> > Yes I agree with you here.
> >
> > This binding is for the panel, and currently the only path to pass the
> > panel mode to the DPI transmitter is one or more MEDIA_BUS_FMT_* enums
> > in struct drm_display_info *bus_formats.
> >
> > Looking at Marek's comment over DSI and data-lanes, yes both source
> > and sink could advertise a data-lanes property to cover the condition
> > where they aren't wired up in a 1:1 fashion. Reality is that most
> > drivers don't support reordering the lanes - looking at the bindings,
> > only one (msm) documents the use of data-lanes on the host side.
> > rcar_mipi_dsi looks at the number of lanes specified only, and then
> > checks that the number requested by the device is <= the number
> > configured.
> >
> > As I see it, the comparison here is that this "bus-format" property is
> > the equivalent of the data-lanes on the sink, and is the desired
> > number of lanes value passed from sink to source (one integer, not a
> > mapping).
> > If the source can reorder the lanes, then that is a property of the
> > source. This binding is for the sink, and so isn't a reasonable
> > comparison. It also doesn't have to be called "bus-format" on the
> > source, and can take a totally different form.
> > I'll admit that I know data-lane configuration more from CSI2, but
> > within V4L2 it is the node that can support reordering that should
> > have the lanes in a non-incrementing order, and that is normally the
> > SoC rather than the sensor. The same would seem to apply here - it's
> > the SoC that can remap the signals, not the panel.
> >
> > It could be argued that for DPI the panel should only advertise the
> > panel's bit depth for each channel, not the padding. The panel is
> > generic and could handle any wiring/padding options, and it isn't
> > necessarily a simple 16/18/24/32 bit bus representation, just a
> > collection of N wires.
> > Padding and wiring is a function of the DPI transmitter / SoC, or
> > potentially an interconnect node between the two.
>
> Sooo... I'm not sure where to start :-)
>
> I think the trouble when describing the connection between a source and
> a sink in DT is that none of the source or sink is an ideal place to
> describe properties of the connection.
>
> For DSI we have it relatively easy, as we only have to describe the
> number of lanes that are routed on the board and possibly how the lanes
> are rearranged. The former is a value that is common between the source
> and the sink, that's the easiest case, it can be specified in both DT
> nodes. The latter is a bit more complicated, and was solved by allowing
> specifying lane reordering on both the source and the sink. As there is
> typically only one of the two components that will support lane
> reordering (if any), DTs will usually specify a 1:1 mapping on one side,
> and possibly reorder on the other side. If both the source and the sink
> support reordering, setting data-lanes = <1 2> on both sides would lead
> to a different configuration than data-lanes = <2 1>, but both would
> work the same (I'm not sure why anyone would want the latter though).
> There may thus be multiple ways to describe a working setup, but that's
> fine, the complexity is manageable, and any hardware configuration can
> be described.
>
> The nice thing with DSI is that the actual data format doesn't depend on
> the board configuration (provided of course that enough lanes are
> available to sustain the required bandwidth). For DPI, things can be
> more difficult. In the test below, "format" refers to how data bits are
> mapped to hardware lines, similarly in concept to the media bus codes.
>
> I see three different cases at the hardware level:
>
> - Either or both the sink or the source support a single format. This
>   means that the side that supports multiple formats will always use the
>   same format. If data lines are rearranged, the format output by the
>   source may not match the format received by the sink, but the hardware
>   configuration of both the sink and the source is effectively fixed to
>   system-specific values.
>
> - Both the sink and the source support multiple formats, but only one
>   combination of formats is possible with how the data lines are routed.
>   This case is very similar to the previous one at the hardware level,
>   only one configuration is possible.
>
> - Both the sink and the source support multiple formats, and multiple
>   format combinations can lead to working configurations. This isn't an
>   uncommon case, there are DPI panels with 24 data lines that can
>   support both RGB666 and RGB888.


I see a panel-dpi compatible panel to be a fixed format only.
I.e. The panel itself supports one and only one format. It is the
hardware designers' choice how to connect the panel. I agree that at
a HW level it is possible to connect a panel that supports RGB888 to
18 data lanes in a RGB666 configuration and whatever other combination
you can think of, however once the HW is set the format is fixed.

If a panel can change its format by e.g. strapping pins it is still
in the hardware designers hand to set the format.

Should the panel be able to adapt its format then one would either
need a communication channel from the panel to the source which
transport the information what format the panel decided to use or,
more likely, the panel-dpi driver would need to set the used
format by some communication (GPIO/I2C/SPI...). However both cases
are outside of what panel-simple or panel-dpi can do. Those would
be the panels which need and merit their specific drivers.

>
> At the software level, there are also multiple options:
>
> - Both sides could specify the device configuration in DT, using media
>   bus codes or any other set of standard or device-specific properties.
>   As this would specify a single configuration, it would map quite fine
>   to the first two hardware cases. Each driver would read its own
>   properties and configure the device accordingly. There would be no
>   need for communication between the drivers at runtime in this case.

In my view of things that format specifies the connection between
the display controller and the panel. I.e. how is data represented
between the two endpoints.
If the controller outputs its data in one format and the panel
expects it in a different format you will unlikely display what
is intended.
So at least for the panel-dpi case it makes more sense that only
one side (the side which has it fixed, i.e. the panel) sets it.

>
>   This could also support the third hardware case, but would limit it to
>   one of the supported configurations, without allowing the other ones
>   to be selected at runtime.
>
>   This scheme is similar to data-lanes, in the sense that each side
>   reads its own hardcoded configuration from DT. It does however differ
>   in that the data format gets hardcoded as well, unlike DSI where the
>   data formats needs to be communicated at runtime between the drivers.
>   As, like DSI, it requires both sides to specify their hardware
>   configuration in DT, interoperability between sources and sinks would
>   require all DT bindings for all DPI devices to adhere to this. They
>   may not have to specify their configuration using the same set of
>   properties, but they would all need to specify it in DT. This would
>   thus, I think, lead to a dead end for the third hardware case.

If source and sink would be able to negotiate one of many possible
formats at runtime this can no longer be handled by a panel-simple
provided driver. It would also no longer be a DT responsibility.
I.e. it would go into (optional?) API functionality between the source
and sink.
The HW as described here has the panel connected per
MEDIA_BUS_FMT_RGB666_1X24-CPAD
LO (which does not exist and would be
described as MEDIA_BUS_FMT_RGB888_1X24) and the display controller
supports MEDIA_BUS_FMT_RGB888_1X24 and MEDIA_BUS_FMT_RGB666_1X24_CPADHI.
So the display controller would choose MEDIA_BUS_FMT_RGB888_1X24 for
its configuration.

And again, it's the HW designers responsibility to connect the panel
in a way compatible with what the particular display controller can
produce.

So I still see the solution that a panel-dpi in the DT specifies
the format in its endpoint and the display controller does read it
from there as a way forward.

Max


>
> The easy optin is to consider that most use cases are in the first two
> hardware categories, specify the media bus code in DT on both sides, and
> consider that support for the third category can be added later. I'm
> worried that we would then corner ourselves, as explained above, because
> this scheme requires all devices involved to specify their hardcoded
> configuration in DT. Will there then be a path forward that wouldn't
> break the DT ABI ? Even if there was, it would mean that all driver
> would then need to support two sets of DT properties, leading to a
> painful transition period on the driver side.
>
> > > The current proposal is already encoding the exact bit placing as
> > > described in Documentation/userspace-api/media/v4l/subdev-formats.rst [2],
> > > this enumeration can be extended to address any future needs
> > > and I would not invent a new one to define the exact same
> > > things (and using the same enum was also suggested by Rob).
> > >
> > > Marek: you told me that you had some concern about some valid use case
> > > not covered by this solution, would you mind explaining why that would
> > > not be covered with an addition on this enumeration?
> >
> > All the MEDIA_BUS_FMT_* enums are explicitly defined with regard to
> > the colour component bit positions. Should someone be in the position
> > of needing to implement a YUV or similar DPI display, converting these
> > enums into the relevant new structure will be straightforward, so
> > backwards compatibility can be achieved easily.
> >
> > > Any other opinion on this topic? How can we move this forward?
> > >
> > > Francesco
> > >
> > > [1] https://github.com/raspberrypi/linux/commit/8e43f1898191b43aa7ed6e6ca3a4cd28709af86d
> > > [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html
>
> --
> Regards,
>
> Laurent Pinchart
