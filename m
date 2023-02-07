Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458E168D43F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA0B10E4B9;
	Tue,  7 Feb 2023 10:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2BB10E4B9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:30:48 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id z17so2586792ilm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 02:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CrnWC2vq7cfS1XxDVgaKiK4PjiOANl3SGgF7pdOJ6ws=;
 b=DfMk37dxnyYKBxPbzVrBh5P5sgUkehTIkLO2YITtupW22cDLjTlfFyYyEvi/eHCb4B
 C/T1GzS3KnmaBygKNT3zeFpOrKXrA4NWPZ1ZYlVjFDYoIgmPC6u3jv81PMBL9LWZmWZC
 MNzA3bIHJY7tW5iiN6utZ9zJOFHlyACKNtrfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CrnWC2vq7cfS1XxDVgaKiK4PjiOANl3SGgF7pdOJ6ws=;
 b=XMPqNC/uSTCQj7HDxAh+3VbNuSZeoFq6Awt21+iVVFnuXVWo5kFTuX2zn5D68rGwS3
 hGidBQciAv8p0FJeX972FPOVz1uhtySLtBdlmFgXkFXijk8RZqSG8ZujbPHjsdhhwu9T
 B0wPpZXAh1w+WZyY2NWv0YGzpTVlBp2C0li5G5BWLtZKpN3uHuCV0oKQr6tmsrCkD+kh
 CWJ1pYU1gF5S2qdf1OeK7JgqMSg4Un3ZM35J1/0I1gb8YBIleh5AAl1rURcKeSX73psR
 Sy7LBX2tLIuqXgQm236Vf10uIGR4J+lC1caJjdqOOLZzmrEf6nY0H9KFEa/6c3kBfNu0
 +Q+A==
X-Gm-Message-State: AO0yUKXtACaTGMoWk9d9IRIQkFcMjSkrLUvxs5mxDrdDGQdkgcWfASSO
 Cgf2zFSgLBjCxUQ+axzHQqfUzqViUBu/kikTsgbxpw==
X-Google-Smtp-Source: AK7set/wsra7EdVB8Smu94+VhV+bptsd3VX5psGkE3p+kmw9MJS5xvgvd/3QUVFxYhT+nocGMhiRYMQkXZPDg4uPLc0=
X-Received: by 2002:a92:9406:0:b0:313:bfa3:84f8 with SMTP id
 c6-20020a929406000000b00313bfa384f8mr2336646ili.27.1675765847731; Tue, 07 Feb
 2023 02:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20230116110820.2615650-1-treapking@chromium.org>
 <20230116110820.2615650-2-treapking@chromium.org>
 <20230117201703.GA3555326-robh@kernel.org>
 <CAEXTbpdOg_un9rWD+QeS1rJLW8wHzDOnkJ-i6R0WNvAU4THEGQ@mail.gmail.com>
 <Y+InK8qF0Izlv6s6@pendragon.ideasonboard.com>
In-Reply-To: <Y+InK8qF0Izlv6s6@pendragon.ideasonboard.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 7 Feb 2023 18:30:36 +0800
Message-ID: <CAEXTbpc=2BOvcXDj-Bff7y3yZjaYr61RBphLiCkkUVzGFnVgKg@mail.gmail.com>
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

On Tue, Feb 7, 2023 at 6:25 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Feb 07, 2023 at 06:07:44PM +0800, Pin-yen Lin wrote:
> > On Wed, Jan 18, 2023 at 4:17 AM Rob Herring wrote:
> > > On Mon, Jan 16, 2023 at 07:08:19PM +0800, Pin-yen Lin wrote:
> > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > >
> > > > Add bindings for Generic GPIO mux driver.
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > > ---
> > > >
> > > > Changes in v2:
> > > > - Referenced existing dt-binding schemas from graph.yaml
> > > > - Added ddc-i2c-bus into the bindings
> > > >
> > > >  .../bindings/display/bridge/gpio-mux.yaml     | 95 +++++++++++++++++++
> > > >  1 file changed, 95 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > new file mode 100644
> > > > index 000000000000..da29ba078f05
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > @@ -0,0 +1,95 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Generic display mux (1 input, 2 outputs)
> > > > +
> > > > +maintainers:
> > > > +  - Nicolas Boichat <drinkcat@chromium.org>
> > > > +
> > > > +description: |
> > > > +  This bindings describes a simple display (e.g. HDMI) mux, that has 1
> > > > +  input, and 2 outputs. The mux status is controlled by hardware, and
> > > > +  its status is read back using a GPIO.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: gpio-display-mux
> > > > +
> > > > +  detect-gpios:
> > > > +    maxItems: 1
> > > > +    description: GPIO that indicates the active output
> > >
> > > What are we detecting? That implies an input, but this is selecting the
> > > output path, right? Or what does 'mux status is controlled by hardware'
> > > mean exactly? Something else? That does not sound very generic.
> >
> > The GPIO (or any kind of MUX) is an input that indicates where the
> > output should go. The actual "output selection" procedure is done in
> > the driver. That is, the driver monitors this GPIO and selects the
> > output path accordingly. In our use case, the GPIO is reported by the
> > embedded controller on the device.
> >
> > [1] listed other similar bridges that can leverage this driver, so we
> > called this driver "generic".
> >
> > [1]: https://lore.kernel.org/all/CAJMQK-jGw8kJFNjoHjeZUL+3NCiOS2hgGERnAnMwNsL_cm_J=Q@mail.gmail.com/
> >
> > > In any case, we have a common mux binding so any kind of mux control
> > > could be used here, not just GPIO. Then you can make this just a generic
> > > display mux.
> >
> > Thanks for sharing this, I'll update the binding in the next version.
> >
> > > > +
> > > > +  ddc-i2c-bus:
> > > > +    description: phandle link to the I2C controller used for DDC EDID probing
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > >
> > > This belongs in the connector node(s).
> >
> > The HDMI bridge before the MUX doesn't (and doesn't have to) know that
> > its next bridge is a MUX. We put it here so that the HDMI bridge can
> > parse the phandle and get the bus node.
>
> How does that work, does the HDMI encoder driver parse the ddc-i2c-bus
> property of the next DT node in the OF graph ?

Yes. In our use case, mtk_hdmi.c[2] checks the remote node of its
output port to get the bus phandle. sun4i_hdmi_enc.c[3] seems to use a
similar approach as well.

[2]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mediatek/mtk_hdmi.c#L1500
[3]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c#L240

Regards,
Pin-yen
>
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description: |
> > > > +          Video port for input.
> > > > +
> > > > +      port@1:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description: |
> > > > +          2 video ports for output.
> > > > +          The reg value in the endpoints matches the GPIO status: when
> > > > +          GPIO is asserted, endpoint with reg value <1> is selected.
> > > > +
> > > > +    required:
> > > > +      - port@0
> > > > +      - port@1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - detect-gpios
> > > > +  - ports
> > > > +
> > > > +unevaluatedProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > +    hdmi_mux: hdmi_mux {
> > > > +      compatible = "gpio-display-mux";
> > > > +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> > > > +      pinctrl-names = "default";
> > > > +      pinctrl-0 = <&hdmi_mux_pins>;
> > > > +      ddc-i2c-bus = <&hdmiddc0>;
> > > > +
> > > > +      ports {
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        port@0 { /* input */
> > > > +          reg = <0>;
> > > > +
> > > > +          hdmi_mux_in: endpoint {
> > > > +            remote-endpoint = <&hdmi0_out>;
> > > > +          };
> > > > +        };
> > > > +
> > > > +        port@1 { /* output */
> > > > +          reg = <1>;
> > > > +
> > > > +          #address-cells = <1>;
> > > > +          #size-cells = <0>;
> > > > +
> > > > +          hdmi_mux_out_anx: endpoint@0 {
> > > > +            reg = <0>;
> > > > +            remote-endpoint = <&dp_bridge_in>;
> > > > +          };
> > > > +
> > > > +          hdmi_mux_out_hdmi: endpoint@1 {
> > > > +            reg = <1>;
> > > > +            remote-endpoint = <&hdmi_connector_in>;
> > > > +          };
> > > > +        };
> > > > +      };
> > > > +    };
>
> --
> Regards,
>
> Laurent Pinchart
