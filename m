Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1B68DCCB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 16:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCF310E1B1;
	Tue,  7 Feb 2023 15:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A40E10E1B1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 15:21:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 774C34AF;
 Tue,  7 Feb 2023 16:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1675783259;
 bh=zNeqV5rEJ6QD24SL/I57YlWT7uP7NrrpeInbjDFscnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OWXIcsieV9JnfRe/9elWLtZeo36LO67+GdhMcG7AzNfQAEBeS3BZnMq5wMxXQ0v3Y
 0OEFa4BWHX5VDUodegggK4/HKP9uaVdQs49a2rcM0AoqT6LEn7i81hFeR9qnzzV9Iq
 OjTx6p8Ir3JmHED2jpznJq8nP8Ihk8i4ZEntpeZk=
Date: Tue, 7 Feb 2023 17:20:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add GPIO display
 mux binding
Message-ID: <Y+JsWQZMKCuPSbeO@pendragon.ideasonboard.com>
References: <20230116110820.2615650-1-treapking@chromium.org>
 <20230116110820.2615650-2-treapking@chromium.org>
 <20230117201703.GA3555326-robh@kernel.org>
 <CAEXTbpdOg_un9rWD+QeS1rJLW8wHzDOnkJ-i6R0WNvAU4THEGQ@mail.gmail.com>
 <Y+InK8qF0Izlv6s6@pendragon.ideasonboard.com>
 <CAEXTbpc=2BOvcXDj-Bff7y3yZjaYr61RBphLiCkkUVzGFnVgKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEXTbpc=2BOvcXDj-Bff7y3yZjaYr61RBphLiCkkUVzGFnVgKg@mail.gmail.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Pin-yen,

On Tue, Feb 07, 2023 at 06:30:36PM +0800, Pin-yen Lin wrote:
> On Tue, Feb 7, 2023 at 6:25 PM Laurent Pinchart wrote:
> > On Tue, Feb 07, 2023 at 06:07:44PM +0800, Pin-yen Lin wrote:
> > > On Wed, Jan 18, 2023 at 4:17 AM Rob Herring wrote:
> > > > On Mon, Jan 16, 2023 at 07:08:19PM +0800, Pin-yen Lin wrote:
> > > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > > >
> > > > > Add bindings for Generic GPIO mux driver.
> > > > >
> > > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > > > ---
> > > > >
> > > > > Changes in v2:
> > > > > - Referenced existing dt-binding schemas from graph.yaml
> > > > > - Added ddc-i2c-bus into the bindings
> > > > >
> > > > >  .../bindings/display/bridge/gpio-mux.yaml     | 95 +++++++++++++++++++
> > > > >  1 file changed, 95 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..da29ba078f05
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > > @@ -0,0 +1,95 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Generic display mux (1 input, 2 outputs)
> > > > > +
> > > > > +maintainers:
> > > > > +  - Nicolas Boichat <drinkcat@chromium.org>
> > > > > +
> > > > > +description: |
> > > > > +  This bindings describes a simple display (e.g. HDMI) mux, that has 1
> > > > > +  input, and 2 outputs. The mux status is controlled by hardware, and
> > > > > +  its status is read back using a GPIO.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: gpio-display-mux
> > > > > +
> > > > > +  detect-gpios:
> > > > > +    maxItems: 1
> > > > > +    description: GPIO that indicates the active output
> > > >
> > > > What are we detecting? That implies an input, but this is selecting the
> > > > output path, right? Or what does 'mux status is controlled by hardware'
> > > > mean exactly? Something else? That does not sound very generic.
> > >
> > > The GPIO (or any kind of MUX) is an input that indicates where the
> > > output should go. The actual "output selection" procedure is done in
> > > the driver. That is, the driver monitors this GPIO and selects the
> > > output path accordingly. In our use case, the GPIO is reported by the
> > > embedded controller on the device.
> > >
> > > [1] listed other similar bridges that can leverage this driver, so we
> > > called this driver "generic".
> > >
> > > [1]: https://lore.kernel.org/all/CAJMQK-jGw8kJFNjoHjeZUL+3NCiOS2hgGERnAnMwNsL_cm_J=Q@mail.gmail.com/
> > >
> > > > In any case, we have a common mux binding so any kind of mux control
> > > > could be used here, not just GPIO. Then you can make this just a generic
> > > > display mux.
> > >
> > > Thanks for sharing this, I'll update the binding in the next version.
> > >
> > > > > +
> > > > > +  ddc-i2c-bus:
> > > > > +    description: phandle link to the I2C controller used for DDC EDID probing
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > >
> > > > This belongs in the connector node(s).
> > >
> > > The HDMI bridge before the MUX doesn't (and doesn't have to) know that
> > > its next bridge is a MUX. We put it here so that the HDMI bridge can
> > > parse the phandle and get the bus node.
> >
> > How does that work, does the HDMI encoder driver parse the ddc-i2c-bus
> > property of the next DT node in the OF graph ?
> 
> Yes. In our use case, mtk_hdmi.c[2] checks the remote node of its
> output port to get the bus phandle. sun4i_hdmi_enc.c[3] seems to use a
> similar approach as well.

Peeking into nodes of other devices is a bad practice. I don't know how
the code you mention below got merged, but I'm pretty sure I would have
flagged it if I had reviewed the patches :-)

The ddc-i2c-bus property should instead be specified in the node where
it logically belongs (in this case, the connector node), and handled by
the connector driver. You can then use drm_bridge operations to tie
things together, like done in the drm_bridge_connector helper. I'd
recommend using the drm_bridge_connector helper if you can, either
as-is, or by extending it.

> [2]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mediatek/mtk_hdmi.c#L1500
> [3]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c#L240
> 
> > > > > +
> > > > > +  ports:
> > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > +
> > > > > +    properties:
> > > > > +      port@0:
> > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > +        description: |
> > > > > +          Video port for input.
> > > > > +
> > > > > +      port@1:
> > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > +        description: |
> > > > > +          2 video ports for output.
> > > > > +          The reg value in the endpoints matches the GPIO status: when
> > > > > +          GPIO is asserted, endpoint with reg value <1> is selected.
> > > > > +
> > > > > +    required:
> > > > > +      - port@0
> > > > > +      - port@1
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - detect-gpios
> > > > > +  - ports
> > > > > +
> > > > > +unevaluatedProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > +    hdmi_mux: hdmi_mux {
> > > > > +      compatible = "gpio-display-mux";
> > > > > +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> > > > > +      pinctrl-names = "default";
> > > > > +      pinctrl-0 = <&hdmi_mux_pins>;
> > > > > +      ddc-i2c-bus = <&hdmiddc0>;
> > > > > +
> > > > > +      ports {
> > > > > +        #address-cells = <1>;
> > > > > +        #size-cells = <0>;
> > > > > +
> > > > > +        port@0 { /* input */
> > > > > +          reg = <0>;
> > > > > +
> > > > > +          hdmi_mux_in: endpoint {
> > > > > +            remote-endpoint = <&hdmi0_out>;
> > > > > +          };
> > > > > +        };
> > > > > +
> > > > > +        port@1 { /* output */
> > > > > +          reg = <1>;
> > > > > +
> > > > > +          #address-cells = <1>;
> > > > > +          #size-cells = <0>;
> > > > > +
> > > > > +          hdmi_mux_out_anx: endpoint@0 {
> > > > > +            reg = <0>;
> > > > > +            remote-endpoint = <&dp_bridge_in>;
> > > > > +          };
> > > > > +
> > > > > +          hdmi_mux_out_hdmi: endpoint@1 {
> > > > > +            reg = <1>;
> > > > > +            remote-endpoint = <&hdmi_connector_in>;
> > > > > +          };
> > > > > +        };
> > > > > +      };
> > > > > +    };

-- 
Regards,

Laurent Pinchart
