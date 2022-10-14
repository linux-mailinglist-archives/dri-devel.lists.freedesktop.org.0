Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 141985FEFD9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 16:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D5B10EAF1;
	Fri, 14 Oct 2022 14:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FC810E4C9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 14:09:07 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id m15so6968973edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 07:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0I2KNI4nZ/rnGdP2xkrpO80Fl1QZU2oaR1etLcD9yFM=;
 b=SITLdc7i/PaZJe5PyHZGMEbJpqVUx/Az4uqyuRN2KP1LZkI24ii1HhTzzsDfs8rD4P
 VWs+X77bikOrwp3Wunwypwlaa2aY107B3gA/1dhadL8DRBkrGPn+6BIADSSBhwgl7Hlg
 AYu2+Q4tcS86PlVwg7Fi0YWr5pSe+wk98WVFIGYsnecVWWMeMu9UmUQrDC1Qsyf9P93e
 JBSElEqmfna6UAIMb1Aj14430gfyRts0UkDkBkNQjRIXABKQyMPIsi9bFiXotdT87e3s
 t9k66tlvZjRxblu4B7s6No/S2NMItEg8nZCS2v0xqRPlzpueNAS8BQZApyhKmVkTON7V
 kssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0I2KNI4nZ/rnGdP2xkrpO80Fl1QZU2oaR1etLcD9yFM=;
 b=RnfZ5wSiO56PO/7IKqnCefrycEpLTPQdQ5e2gi3GOY3hNJB8aNVX79XYxmmk0oqMvj
 cvqOLiTre3+1pakg0yfqP5slhup9+nxvgUxYw1ub19wtW4yFwVm60NiD1topu2i0vICG
 AmtYBLHaweurzTvKNfKzLm5FJGvcO5iVOMdtdIdKHd+gHdhioyn4D5ncRsfkfLemtCt2
 2qpxpzql3D68Z0fRGymjaSkbu90qAPEBlmsA3cWkybQi3Bb/u6dX0W1IIx8WHWUnyeSj
 /iKEbVKtlmgpl8Jj1u88elZNveFQeNm4wnMZhmK9gEWZHCVE5Mf7l34xQp025u/4yjkb
 Q0YA==
X-Gm-Message-State: ACrzQf33CeTnqGMg7jCNog6ItBwvN3P6npijrPe+cf0wrlMRR5VEAH71
 US4IpRDFKBqiMkWIU8BMqxQTmZRGeBuHEmfWUqPEHA==
X-Google-Smtp-Source: AMsMyM5UMZKfQ/zYfqxeGsgPmpkERZbTn3RGjbe2yi2Obn6ebsepBsnKm/jXLUxpk2tMPvNS6vEXjxEDiN96wVkPLGw=
X-Received: by 2002:a05:6402:22ef:b0:458:bfe5:31a3 with SMTP id
 dn15-20020a05640222ef00b00458bfe531a3mr4403660edb.6.1665756545733; Fri, 14
 Oct 2022 07:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-3-max.oss.09@gmail.com>
 <Y0gLdQleE64FQgn9@gaggiata.pivistrello.it>
In-Reply-To: <Y0gLdQleE64FQgn9@gaggiata.pivistrello.it>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 14 Oct 2022 15:08:49 +0100
Message-ID: <CAPY8ntAszGzcp4XC=XKMHJvzCC9LHHf24pt=nZAUFKcK5=JM_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: add new bus-format property
 for panel-dpi
To: francesco.dolcini@toradex.com
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
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 max.krummenacher@toradex.com,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Francesco

On Thu, 13 Oct 2022 at 13:58, Francesco Dolcini <francesco@dolcini.it> wrote:
>
> Hello Max, Marek, Dave et al.
>
> On Tue, Jun 28, 2022 at 08:18:36PM +0200, Max Krummenacher wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > The property is used to set the enum bus_format and infer the bpc
> > for a panel defined by 'panel-dpi'.
> > This specifies how the panel is connected to the display interface.
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >
>
> <snip>
>
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index dae0676b5c6e..52f5db03b6a8 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -26,7 +26,28 @@ properties:
> >    height-mm: true
> >    label: true
> >    panel-timing: true
> > -  port: true
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    description:
> > +      Input port node, receives the panel data.
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +
> > +        properties:
> > +          bus-format:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0x1001
> > +            maximum: 0x1fff
> > +            description: |
> > +              Describes how the display panel is connected to the display interface.
> > +              Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
> > +              The mapping between the color/significance of the panel lines to the
> > +              parallel data lines are defined in:
> > +              https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
> > +
>
> Last month I had the chance to talk in person about this topic with
> Dave, Marek and Max in Dublin.
>
> My understanding is that this change is addressing a general need, Dave
> confirmed me they have a downstream patch for raspberrypi [1].
>
> From what I could tell the only concern is about the actual encoding of
> this `bus-format` property.
>
> I am personally convinced that a simple enum is the way to go, I think
> that Marek proposal is adding complexity and not flexibility (from my
> understanding Dave is on the same page, just correct me if I
> misunderstood you).

Yes I agree with you here.

This binding is for the panel, and currently the only path to pass the
panel mode to the DPI transmitter is one or more MEDIA_BUS_FMT_* enums
in struct drm_display_info *bus_formats.

Looking at Marek's comment over DSI and data-lanes, yes both source
and sink could advertise a data-lanes property to cover the condition
where they aren't wired up in a 1:1 fashion. Reality is that most
drivers don't support reordering the lanes - looking at the bindings,
only one (msm) documents the use of data-lanes on the host side.
rcar_mipi_dsi looks at the number of lanes specified only, and then
checks that the number requested by the device is <= the number
configured.

As I see it, the comparison here is that this "bus-format" property is
the equivalent of the data-lanes on the sink, and is the desired
number of lanes value passed from sink to source (one integer, not a
mapping).
If the source can reorder the lanes, then that is a property of the
source. This binding is for the sink, and so isn't a reasonable
comparison. It also doesn't have to be called "bus-format" on the
source, and can take a totally different form.
I'll admit that I know data-lane configuration more from CSI2, but
within V4L2 it is the node that can support reordering that should
have the lanes in a non-incrementing order, and that is normally the
SoC rather than the sensor. The same would seem to apply here - it's
the SoC that can remap the signals, not the panel.

It could be argued that for DPI the panel should only advertise the
panel's bit depth for each channel, not the padding. The panel is
generic and could handle any wiring/padding options, and it isn't
necessarily a simple 16/18/24/32 bit bus representation, just a
collection of N wires.
Padding and wiring is a function of the DPI transmitter / SoC, or
potentially an interconnect node between the two.

> The current proposal is already encoding the exact bit placing as
> described in Documentation/userspace-api/media/v4l/subdev-formats.rst [2],
> this enumeration can be extended to address any future needs
> and I would not invent a new one to define the exact same
> things (and using the same enum was also suggested by Rob).
>
> Marek: you told me that you had some concern about some valid use case
> not covered by this solution, would you mind explaining why that would
> not be covered with an addition on this enumeration?

All the MEDIA_BUS_FMT_* enums are explicitly defined with regard to
the colour component bit positions. Should someone be in the position
of needing to implement a YUV or similar DPI display, converting these
enums into the relevant new structure will be straightforward, so
backwards compatibility can be achieved easily.

  Dave

> Any other opinion on this topic? How can we move this forward?
>
> Francesco
>
> [1] https://github.com/raspberrypi/linux/commit/8e43f1898191b43aa7ed6e6ca3a4cd28709af86d
> [2] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/subdev-formats.html
>
