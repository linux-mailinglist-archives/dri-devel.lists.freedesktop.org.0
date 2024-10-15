Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A232899EE1F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 15:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6710F10E06E;
	Tue, 15 Oct 2024 13:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kaSTKnHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122AB10E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 13:48:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F9825C553D;
 Tue, 15 Oct 2024 13:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8040C4CEC6;
 Tue, 15 Oct 2024 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729000084;
 bh=/NmfRsrehmeVAhyHDDve2yS9vV0V1XSran4v1dvYbn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kaSTKnHdTsmNQLGgh9abZGKDCqSpFnT13kTPLP9Y0s1KaqxBaR1lfvW3ZMqA642L6
 XrSGjYffLr6DeVcuUQAfPybqRYg4ygD6XQ2YwpsH+42oe7xFPPrnbIVB8rIRPsn/11
 59sapKV5O7/GohV4PBVKShUFwW9a9Iq904+/LSBZUNKI6AOlFt+lL9EuHe2ADC6CV4
 zNn/WiuOQT4UrbLfbrqThg4x+G2ZTueQdJPSVDVjQGdUxUtd8LOtJLxV0BvOb6ry49
 DNsiFvoelNxka/2Jt5cx0kdVZTLBKYsV83AaIiSQu79dM3NnZWnu7B6fU3t+pJAwn7
 PxZmMsCngPbpA==
Date: Tue, 15 Oct 2024 08:48:02 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com, sui.jingfeng@linux.dev, michael@walle.cc,
 sjoerd@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
 Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v12 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
Message-ID: <20241015134802.GB447702-robh@kernel.org>
References: <20241014085148.71105-1-angelogioacchino.delregno@collabora.com>
 <20241014085148.71105-2-angelogioacchino.delregno@collabora.com>
 <CAL_Jsq+hpTPCkuXoCF88nyS_D+iFZB5osrt1q04RxffDsY7cXw@mail.gmail.com>
 <ec14b01e-7237-4f52-82a6-b8de42fb120b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec14b01e-7237-4f52-82a6-b8de42fb120b@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 15, 2024 at 10:32:22AM +0200, AngeloGioacchino Del Regno wrote:
> Il 14/10/24 19:36, Rob Herring ha scritto:
> > On Mon, Oct 14, 2024 at 3:51 AM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > The display IPs in MediaTek SoCs support being interconnected with
> > > different instances of DDP IPs (for example, merge0 or merge1) and/or
> > > with different DDP IPs (for example, rdma can be connected with either
> > > color, dpi, dsi, merge, etc), forming a full Display Data Path that
> > > ends with an actual display.
> > > 
> > > The final display pipeline is effectively board specific, as it does
> > > depend on the display that is attached to it, and eventually on the
> > > sensors supported by the board (for example, Adaptive Ambient Light
> > > would need an Ambient Light Sensor, otherwise it's pointless!), other
> > > than the output type.
> > > 
> > > Add support for OF graphs to most of the MediaTek DDP (display) bindings
> > > to add flexibility to build custom hardware paths, hence enabling board
> > > specific configuration of the display pipeline and allowing to finally
> > > migrate away from using hardcoded paths.
> > > 
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> > > Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   .../display/mediatek/mediatek,aal.yaml        | 40 +++++++++++++++++++
> > >   .../display/mediatek/mediatek,ccorr.yaml      | 21 ++++++++++
> > >   .../display/mediatek/mediatek,color.yaml      | 22 ++++++++++
> > >   .../display/mediatek/mediatek,dither.yaml     | 22 ++++++++++
> > >   .../display/mediatek/mediatek,dpi.yaml        | 25 +++++++++++-
> > >   .../display/mediatek/mediatek,dsc.yaml        | 24 +++++++++++
> > >   .../display/mediatek/mediatek,dsi.yaml        | 27 ++++++++++++-
> > >   .../display/mediatek/mediatek,ethdr.yaml      | 22 ++++++++++
> > >   .../display/mediatek/mediatek,gamma.yaml      | 19 +++++++++
> > >   .../display/mediatek/mediatek,merge.yaml      | 23 +++++++++++
> > >   .../display/mediatek/mediatek,od.yaml         | 22 ++++++++++
> > >   .../display/mediatek/mediatek,ovl-2l.yaml     | 22 ++++++++++
> > >   .../display/mediatek/mediatek,ovl.yaml        | 22 ++++++++++
> > >   .../display/mediatek/mediatek,postmask.yaml   | 21 ++++++++++
> > >   .../display/mediatek/mediatek,rdma.yaml       | 22 ++++++++++
> > >   .../display/mediatek/mediatek,ufoe.yaml       | 21 ++++++++++
> > >   16 files changed, 372 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> > > index cf24434854ff..47ddba5c41af 100644
> > > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> > > @@ -62,6 +62,27 @@ properties:
> > >       $ref: /schemas/types.yaml#/definitions/phandle-array
> > >       maxItems: 1
> > > 
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description:
> > > +      Input and output ports can have multiple endpoints, each of those
> > > +      connects to either the primary, secondary, etc, display pipeline.
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: AAL input port
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          AAL output to the next component's input, for example could be one
> > > +          of many gamma, overdrive or other blocks.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > > @@ -89,5 +110,24 @@ examples:
> > >              power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> > >              clocks = <&mmsys CLK_MM_DISP_AAL>;
> > >              mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
> > > +
> > > +           ports {
> > > +               #address-cells = <1>;
> > > +               #size-cells = <0>;
> > > +
> > > +               port@0 {
> > > +                   reg = <0>;
> > > +                   aal0_in: endpoint {
> > > +                       remote-endpoint = <&ccorr0_out>;
> > > +                   };
> > > +               };
> > > +
> > > +               port@1 {
> > > +                   reg = <1>;
> > > +                   aal0_out: endpoint {
> > > +                       remote-endpoint = <&gamma0_in>;
> > > +                   };
> > > +               };
> > > +           };
> > >          };
> > >       };
> > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> > > index 9f8366763831..fca8e7bb0cbc 100644
> > > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> > > @@ -57,6 +57,27 @@ properties:
> > >       $ref: /schemas/types.yaml#/definitions/phandle-array
> > >       maxItems: 1
> > > 
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description:
> > > +      Input and output ports can have multiple endpoints, each of those
> > > +      connects to either the primary, secondary, etc, display pipeline.
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: CCORR input port
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          CCORR output to the input of the next desired component in the
> > > +          display pipeline, usually only one of the available AAL blocks.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> > > index 7df786bbad20..6160439ce4d7 100644
> > > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> > > @@ -65,6 +65,28 @@ properties:
> > >       $ref: /schemas/types.yaml#/definitions/phandle-array
> > >       maxItems: 1
> > > 
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description:
> > > +      Input and output ports can have multiple endpoints, each of those
> > > +      connects to either the primary, secondary, etc, display pipeline.
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: COLOR input port
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          COLOR output to the input of the next desired component in the
> > > +          display pipeline, for example one of the available CCORR or AAL
> > > +          blocks.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> > > index 6fceb1f95d2a..abaf27916d13 100644
> > > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
> > > @@ -56,6 +56,28 @@ properties:
> > >       $ref: /schemas/types.yaml#/definitions/phandle-array
> > >       maxItems: 1
> > > 
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description:
> > > +      Input and output ports can have multiple endpoints, each of those
> > > +      connects to either the primary, secondary, etc, display pipeline.
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: DITHER input, usually from a POSTMASK or GAMMA block.
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          DITHER output to the input of the next desired component in the
> > > +          display pipeline, for example one of the available DSC compressors,
> > > +          DP_INTF, DSI, LVDS or others.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > > index 3a82aec9021c..b567e3d58aa1 100644
> > > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > > @@ -71,13 +71,34 @@ properties:
> > >         Output port node. This port should be connected to the input port of an
> > >         attached HDMI, LVDS or DisplayPort encoder chip.
> > > 
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: DPI input port
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: DPI output to an HDMI, LVDS or DisplayPort encoder input
> > 
> > This is wrong. The existing 'port' is the output. 'port' and 'port@0'
> > are treated as the same thing. Since you are adding an input port, the
> > new port has to be 'port@1' (or any number but 0).
> > 
> > I haven't looked at the driver code, but it should request port 0 and
> > always get the output port. And requesting port 1 will return an error
> > or the input port.
> 
> Hello Rob,
> 
> I want to remind you that in v2 of this series you said that it'd be wrong for
> port@0 to be an output, I replied that you misread that as I had modeled it indeed
> as an input, and then you gave me your Reviewed-by tag.

I have not misread it. Then I guess I forgot about it and missed it the 
next time on v3.

> Anyway - I get your concern about the previous behavior of `port`, but I chose to
> model this that way purely for consistency.
> 
> First of all - the driver(s) will check if we're feeding a full graph, as it will
> indeed first check if port@1 is present: if it is, then it follows this scheme with
> port@0 as INPUT and port@1 as OUTPUT.
> If the component in port@0 is an OUTPUT, the bridge attach will fail.
> 
> Getting to bindings themselves, then... it would be a mistake to model port@0 as an
> output and port@1 as an input, because that would be not only inconsistent with the
> DRM Bridge bindings, but would be highly confusing when reading the devicetree.

Somewhat confusing, yes. Highly, no. Put a comment in the DT.

> Please note that the bridge bindings are always declaring port@0 as an INPUT and
> other ports as OUTPUT(s).

There is no guarantee on that. Port numbering is local to the bridge and 
opaque to anything outside that bridge. That is why you have to document 
what each port represents.

Would we have followed that convention if all the ports were defined 
from the start? Certainly. But that didn't happen and you are stuck with 
the existing binding and ABI.

> As an example, you can check display/bridge/analogix,anx7625.yaml or
> display/bridge/samsung,mipi-dsim.yaml (and others) for bridges, otherwise
> display/st,stm32mp25-lvds.yaml or display/allwinner,sun4i-a10-display-frontend.yaml
> (and others) for display controllers, which do all conform to this logic, where
> the input is always @0, and the output is @1.
> 
> Of course, doing this required me to do extra changes to the MTK DRM drivers to
> actually be retro-compatible with the old devicetrees as I explained before.

You can't fix existing software...

If you want to break the ABI, then that's ultimately up to you and 
Mediatek maintainers to decide0. This case is easy to avoid, why would 
you knowingly break the ABI here. OTOH, this seems like a big enough 
change I would imagine it is a matter of time before supporting a 
missing OF graph for the components will be a problem.

Rob
