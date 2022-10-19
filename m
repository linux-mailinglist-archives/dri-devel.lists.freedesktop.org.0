Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362FC604BAF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD65310F283;
	Wed, 19 Oct 2022 15:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C32710F283
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 15:37:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id d26so40876782ejc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XAm6L0DMrBfvhKiS0CKSKcNGjrlznN+VXy5BMzHTKe0=;
 b=ev+AGbYnswADLymKG7gZAE9DQ3YiyUdpUAFrnC552vr0dcbNjCuWEGXg1VCLbr4LlQ
 5f9K6su2qRHna7DfpL8luBpDcNhJJ9eYAQ8zjRKHFX9uqv9y8EPsvUrHH0c4l9fsVkp+
 YDgeVxRsBuTS4iBCqsL5+sq+EHpfTqtb/FUeMOeThsDAp1e16gvJIr4tTCTXedBU7mhV
 t/haTsdGGott89kcLAdrbrDMkhVAWrmQAkTlsNmH9uZ8v/4H37QFJJrd6ZFiFMXFXFUu
 rkSyonQqwFRyGJ8Kn0wQ3z/xLRcTxdcQCKw0oEyVhohNsWFjALddTu5JZ5zbfSQQj2r7
 aAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XAm6L0DMrBfvhKiS0CKSKcNGjrlznN+VXy5BMzHTKe0=;
 b=Ij7Uvc+OqllhNWqhJZbWlx+AjzIqZjgTHavAR8zsVZgmDqxTIh5CJedlssdbVDvzU+
 VIUYBlje6ocXUBBCphSEPGAdbOhP467u1sfNbbDq8ux2wJB1DvyGopSDk9gOqF/j1q18
 ZmklGMTeYbByUWugUHoRVwX59idd5iLBZ5vJm1sbLUHmyFs5tcv2BtWRlzpKkuNSbUdT
 PqNX/zdIlehchf4M8e4pKWNGRsv8TuWNKbrUX65xZJqUH+hboZKXOJdOmb9BkKR0EeqJ
 h68NpZlzOqUonyWylsxq8i958nGs39zz3QeqWGpRcygrSmJJdZrQ6Hc+o+awutWXFYMl
 5Hhw==
X-Gm-Message-State: ACrzQf1oPw3PQzer2hpdTN6h7KXeneSvQiXShpw1+/veLtsO2JypfyY4
 Qj4lO3jxDJeru9W48R30rZg5irtAU6sEVUUfNm4ekg==
X-Google-Smtp-Source: AMsMyM41v7jE3Y52qXzK/nxnAxDyMdWUhttq5QKgPvsdrPJCXW9qEX5Nf0Cj6iVf1dsgxPOH9pF+fDwp550sGkB1byQ=
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr7584669ejb.294.1666193843591; Wed, 19
 Oct 2022 08:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-3-max.oss.09@gmail.com>
 <Y0gLdQleE64FQgn9@gaggiata.pivistrello.it>
 <CAPY8ntAszGzcp4XC=XKMHJvzCC9LHHf24pt=nZAUFKcK5=JM_Q@mail.gmail.com>
 <Y0tfRhn/f1FiGDi4@pendragon.ideasonboard.com>
In-Reply-To: <Y0tfRhn/f1FiGDi4@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 19 Oct 2022 16:37:08 +0100
Message-ID: <CAPY8ntDwAJ3e5sdqD2up=12G1kMW7pczNhDZnWKzg1Yt8FqCrg@mail.gmail.com>
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
 Max Krummenacher <max.oss.09@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 max.krummenacher@toradex.com, francesco.dolcini@toradex.com,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On Sun, 16 Oct 2022 at 02:33, Laurent Pinchart
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
>
> At the software level, there are also multiple options:
>
> - Both sides could specify the device configuration in DT, using media
>   bus codes or any other set of standard or device-specific properties.
>   As this would specify a single configuration, it would map quite fine
>   to the first two hardware cases. Each driver would read its own
>   properties and configure the device accordingly. There would be no
>   need for communication between the drivers at runtime in this case.
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
>
> - The two sides could communicate at runtime to dynamically negotiate
>   their configuration. Some form of runtime configuration is required to
>   fully support the third hardware case, and it could also support the
>   other two cases.
>
>   The trouble here, beside how to express the required data in DT, is
>   how that communication would be handled. Let's consider a case where
>   data lines are "remapped":
>
>   - The display controller that has a D[23:0] output bus
>   - The panel that has a D[17:0] bus
>   - The data lines connections from the display controller to the panel
>     are D[23:18] -> D[17:12], D[15:10] -> D[11:6], D[7:2] -> D[5:0],
>     with the display controller's D[17:16], D[9:8] and D[1:0] outputs
>     unconnected
>   - The panel only supports RGB666
>   - The display controller supports both RGB888 and RGB666, and outputs
>     RGB666 as 00RRRRRR00GGGGGG00BBBBBB

Note that you're also effectively advocating for dropping all BGRxxx
variants from panel definitions, as well as the CPAD variants. All of
those would be handled in the wiring description. Not an issue, just
worth flagging.

>   This means that the only possibly configuration is the display
>   controller outputting RGB888 and the panel receiving RGB666. If we
>   expressed that as media bus codes in DT, the panel would would
>   communicate its RGB666 input format to the display controller, which
>   wouldn't know that it would have to output RGB888.
>
>   Of course, in this particular example, only one hardware configuration
>   is possible, so we could support it by specifying the media bus code
>   in both DT nodes, but that won't scale to cases where multiple
>   configurations are possible.

I'll agree that the existing framework is broken in many cases, but
it's broken for ALL panel drivers, not just panel-dpi.
Any of the current drivers with specific compatible strings that
provide two or more bus formats have no mechanism for negotiating or
being told which has been chosen.
Any mapping that isn't 1:1 can't be represented.

This binding change for dpi-panel is just to bring it up to the same
level of brokenness as all other panels.
Yes it's DT ABI, but almost all the issues raised are about other brokenness.

> The easy optin is to consider that most use cases are in the first two
> hardware categories, specify the media bus code in DT on both sides, and
> consider that support for the third category can be added later. I'm
> worried that we would then corner ourselves, as explained above, because
> this scheme requires all devices involved to specify their hardcoded
> configuration in DT.
>
> Will there then be a path forward that wouldn't
> break the DT ABI ? Even if there was, it would mean that all driver
> would then need to support two sets of DT properties, leading to a
> painful transition period on the driver side.

Very few displays need to read their format from DT - dpi-panel is the
only one as it allows a level of configuration from DT.
If the panel driver has a defined compatible string, then the
format(s) is/are in the code and not DT.

Once you get beyond the one entry in DT, it's an internal kernel API
and therefore can be reworked at a later date.


If and when someone needs to extend DPI transmitters to read DT for
simple mappings, then create and use a helper function to do the
parsing. Currently the helper would return a MEDIA_BUS_FMT_ code, but
internally it can have gone through the correct sets of hoops to
either read DT, follow the bridge chain with
atomic_get_input_bus_fmts, or otherwise find the panel to get a
format. (This assumes that there is one true and correct method for
getting the format which is implemented by all drivers).

Should there be a situation further down the road where there is a
need to extend that further, then a new helper function needs to be
added that is able to read either DT API and convert between them. The
existing helper will also need updating to support conversion from the
new DT API.
Converting from a "bus-format" to a more complete description for a
new driver should be trivial with a lookup table. Converting from a
new DT API to a single mbus format should be possible (reverse the
previous lookup table), but you have to accept that there are new DT
configurations that can not be expressed by mbus format, and therefore
that the helper function can return an error.

DPI transmitter drivers can be converted to the new helper as
required, or potentially if they can't support arbitrary routing then
they stay on the old helper forever as it will work both new and old
bindings.


Does this one patch for one driver really back ourselves into a corner
that can't be handled?

The one case I can think of as potentially an issue is if *bus_formats
is removed totally from struct drm_display_info to be replaced by
something else more generic. Under that situation you may need to
match up an existing DT file using bus-format for a padded or BGR
format with a brave new world where the panel advertises a DPI
descriptor that is normally 1:1 and the DPI transmitter has the
mapping. Even then I think is is possible as the DPI transmitter won't
have a mapping in the old DT. It will then be looking at the
configuration provided by the panel which will be one of the standard
table lookups for an MEDIA_BUS_FMT_xxx_, and that gets us back to the
same configuration as before.

Thanks.
  Dave

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
