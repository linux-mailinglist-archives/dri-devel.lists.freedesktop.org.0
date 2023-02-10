Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A869194A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 08:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447EE10EC73;
	Fri, 10 Feb 2023 07:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE9310EC73
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 07:38:11 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id j17so1625213ioa.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 23:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sH6WBMIYjOrjkH/731UIBZAsfjfVbMVBCIgRS34cgKk=;
 b=Fe2eLtjJLCwCT5mjjaOcyhU9LHroO1VFce8GA6kOXZOtOO1loppZhJi0f+d5S/XcZa
 gUhbP7U+Z8crCLL204zmBCuDFdWoRpx5VblEOafV7ONWHW7VV9FHgtOJeXHfNOQw0kn+
 0vOFqgzajHL07LDo0QMuEekRU1mV/tNJNIDOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sH6WBMIYjOrjkH/731UIBZAsfjfVbMVBCIgRS34cgKk=;
 b=oGvTBR8LfZS1l1L49rePZbibOMuFsWTlz6IoW6UzKKD0Adn85RqlfsGM6jbyctNoyz
 D+ijRq3ZG5CESYtMH4Y+XjlQq+CDeTeWIgTpL80wPAQjCSA6RLsq7R4bES1DhliOsShG
 RX/yOndbCNFJm2VQPf5HvNgQq7WxDWCcrZBa7sQBpAIYLqKIx+rfuzA783HATLvOtQ6g
 tXQmcbeEQ9fgQFfUBVCd9MRzQkpweE4wK1Z20Ve+8TOg5PWPlyz7Z6ZXndlL0M6jfJX2
 gXYg7Km30KkbeDOYcAChkd4Y9s7+rBehIhAYW9y3Czb7lZdRE1We6EjhZlqzUt297F/A
 G1+g==
X-Gm-Message-State: AO0yUKUEwcGgSqgbMWpTIGGO77Ra61DJylYAV4VVSFWEwWI/o4iT7yhu
 +Rp99JW+XB/dOzTB2lOa6s9zS33xa9EUdn8JBQ4Aqw==
X-Google-Smtp-Source: AK7set/gx4TdacLbs0+/wfrvnIrUVSLZGEzR1Zu0S5V34Avy7nZFwCtAuXpEjElIVZdXZPwaeLkLAtTf8V2q6DIpRAI=
X-Received: by 2002:a02:c816:0:b0:3c2:8c48:377a with SMTP id
 p22-20020a02c816000000b003c28c48377amr7201617jao.115.1676014691042; Thu, 09
 Feb 2023 23:38:11 -0800 (PST)
MIME-Version: 1.0
References: <20230116110820.2615650-1-treapking@chromium.org>
 <20230116110820.2615650-2-treapking@chromium.org>
 <20230117201703.GA3555326-robh@kernel.org>
 <CAEXTbpdOg_un9rWD+QeS1rJLW8wHzDOnkJ-i6R0WNvAU4THEGQ@mail.gmail.com>
 <Y+InK8qF0Izlv6s6@pendragon.ideasonboard.com>
 <CAEXTbpc=2BOvcXDj-Bff7y3yZjaYr61RBphLiCkkUVzGFnVgKg@mail.gmail.com>
 <Y+JsWQZMKCuPSbeO@pendragon.ideasonboard.com>
In-Reply-To: <Y+JsWQZMKCuPSbeO@pendragon.ideasonboard.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 10 Feb 2023 15:38:00 +0800
Message-ID: <CAEXTbpf+wK8hLmN=E=Z7zaM+p0OW5sNW83pq9HFmdwWsE7uM=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add GPIO display mux
 binding
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, Feb 7, 2023 at 11:21 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Pin-yen,
>
> On Tue, Feb 07, 2023 at 06:30:36PM +0800, Pin-yen Lin wrote:
> > On Tue, Feb 7, 2023 at 6:25 PM Laurent Pinchart wrote:
> > > On Tue, Feb 07, 2023 at 06:07:44PM +0800, Pin-yen Lin wrote:
> > > > On Wed, Jan 18, 2023 at 4:17 AM Rob Herring wrote:
> > > > > On Mon, Jan 16, 2023 at 07:08:19PM +0800, Pin-yen Lin wrote:
> > > > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > > > >
> > > > > > Add bindings for Generic GPIO mux driver.
> > > > > >
> > > > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > > > > ---
> > > > > >
> > > > > > Changes in v2:
> > > > > > - Referenced existing dt-binding schemas from graph.yaml
> > > > > > - Added ddc-i2c-bus into the bindings
> > > > > >
> > > > > >  .../bindings/display/bridge/gpio-mux.yaml     | 95 +++++++++++++++++++
> > > > > >  1 file changed, 95 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..da29ba078f05
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > > > @@ -0,0 +1,95 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Generic display mux (1 input, 2 outputs)
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Nicolas Boichat <drinkcat@chromium.org>
> > > > > > +
> > > > > > +description: |
> > > > > > +  This bindings describes a simple display (e.g. HDMI) mux, that has 1
> > > > > > +  input, and 2 outputs. The mux status is controlled by hardware, and
> > > > > > +  its status is read back using a GPIO.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: gpio-display-mux
> > > > > > +
> > > > > > +  detect-gpios:
> > > > > > +    maxItems: 1
> > > > > > +    description: GPIO that indicates the active output
> > > > >
> > > > > What are we detecting? That implies an input, but this is selecting the
> > > > > output path, right? Or what does 'mux status is controlled by hardware'
> > > > > mean exactly? Something else? That does not sound very generic.
> > > >
> > > > The GPIO (or any kind of MUX) is an input that indicates where the
> > > > output should go. The actual "output selection" procedure is done in
> > > > the driver. That is, the driver monitors this GPIO and selects the
> > > > output path accordingly. In our use case, the GPIO is reported by the
> > > > embedded controller on the device.
> > > >
> > > > [1] listed other similar bridges that can leverage this driver, so we
> > > > called this driver "generic".
> > > >
> > > > [1]: https://lore.kernel.org/all/CAJMQK-jGw8kJFNjoHjeZUL+3NCiOS2hgGERnAnMwNsL_cm_J=Q@mail.gmail.com/
> > > >
> > > > > In any case, we have a common mux binding so any kind of mux control
> > > > > could be used here, not just GPIO. Then you can make this just a generic
> > > > > display mux.
> > > >
> > > > Thanks for sharing this, I'll update the binding in the next version.
> > > >
> > > > > > +
> > > > > > +  ddc-i2c-bus:
> > > > > > +    description: phandle link to the I2C controller used for DDC EDID probing
> > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > >
> > > > > This belongs in the connector node(s).
> > > >
> > > > The HDMI bridge before the MUX doesn't (and doesn't have to) know that
> > > > its next bridge is a MUX. We put it here so that the HDMI bridge can
> > > > parse the phandle and get the bus node.
> > >
> > > How does that work, does the HDMI encoder driver parse the ddc-i2c-bus
> > > property of the next DT node in the OF graph ?
> >
> > Yes. In our use case, mtk_hdmi.c[2] checks the remote node of its
> > output port to get the bus phandle. sun4i_hdmi_enc.c[3] seems to use a
> > similar approach as well.
>
> Peeking into nodes of other devices is a bad practice. I don't know how
> the code you mention below got merged, but I'm pretty sure I would have
> flagged it if I had reviewed the patches :-)
>
> The ddc-i2c-bus property should instead be specified in the node where
> it logically belongs (in this case, the connector node), and handled by
> the connector driver. You can then use drm_bridge operations to tie
> things together, like done in the drm_bridge_connector helper. I'd
> recommend using the drm_bridge_connector helper if you can, either
> as-is, or by extending it.

So, even if the connector does not have its own i2c controller, we
should put ddc-i2c-bus property in the connector DT node and tell the
DRM core that this bridge (driver) has the ability to read EDID?

If so, I'll fix up the mtk_hdmi.c driver and update the anx7688 driver
in the next version.

Regards,
Pin-yen
>
> > [2]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mediatek/mtk_hdmi.c#L1500
> > [3]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c#L240
> >
> > > > > > +
> > > > > > +  ports:
> > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > +
> > > > > > +    properties:
> > > > > > +      port@0:
> > > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > +        description: |
> > > > > > +          Video port for input.
> > > > > > +
> > > > > > +      port@1:
> > > > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > +        description: |
> > > > > > +          2 video ports for output.
> > > > > > +          The reg value in the endpoints matches the GPIO status: when
> > > > > > +          GPIO is asserted, endpoint with reg value <1> is selected.
> > > > > > +
> > > > > > +    required:
> > > > > > +      - port@0
> > > > > > +      - port@1
> > > > > > +
> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +  - detect-gpios
> > > > > > +  - ports
> > > > > > +
> > > > > > +unevaluatedProperties: false
> > > > > > +
> > > > > > +examples:
> > > > > > +  - |
> > > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > > +    hdmi_mux: hdmi_mux {
> > > > > > +      compatible = "gpio-display-mux";
> > > > > > +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> > > > > > +      pinctrl-names = "default";
> > > > > > +      pinctrl-0 = <&hdmi_mux_pins>;
> > > > > > +      ddc-i2c-bus = <&hdmiddc0>;
> > > > > > +
> > > > > > +      ports {
> > > > > > +        #address-cells = <1>;
> > > > > > +        #size-cells = <0>;
> > > > > > +
> > > > > > +        port@0 { /* input */
> > > > > > +          reg = <0>;
> > > > > > +
> > > > > > +          hdmi_mux_in: endpoint {
> > > > > > +            remote-endpoint = <&hdmi0_out>;
> > > > > > +          };
> > > > > > +        };
> > > > > > +
> > > > > > +        port@1 { /* output */
> > > > > > +          reg = <1>;
> > > > > > +
> > > > > > +          #address-cells = <1>;
> > > > > > +          #size-cells = <0>;
> > > > > > +
> > > > > > +          hdmi_mux_out_anx: endpoint@0 {
> > > > > > +            reg = <0>;
> > > > > > +            remote-endpoint = <&dp_bridge_in>;
> > > > > > +          };
> > > > > > +
> > > > > > +          hdmi_mux_out_hdmi: endpoint@1 {
> > > > > > +            reg = <1>;
> > > > > > +            remote-endpoint = <&hdmi_connector_in>;
> > > > > > +          };
> > > > > > +        };
> > > > > > +      };
> > > > > > +    };
>
> --
> Regards,
>
> Laurent Pinchart
