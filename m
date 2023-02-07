Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F668D3A5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDAA10E4BB;
	Tue,  7 Feb 2023 10:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C6710E1D8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:07:56 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id w24so5458336iow.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OUtfbS0GC3JJK/B5YtNwMVsFna40Ybwka57jHZjmmOU=;
 b=hT7TG39dijBvF0NlSxhfd0VPQvVGxZCZkeozw6VL2COqlxBvf/BM2Nt30mV7W4WzuB
 mjBqUdwrVdHGFuopwTRuTbwO+C0jeAadUVyE+jEpSIGsTv3FkzvV6O/9l4jxnuzHX7cU
 icRfMxUabw9wpgWXtEq/HBlhpq7ox3Eo07l6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OUtfbS0GC3JJK/B5YtNwMVsFna40Ybwka57jHZjmmOU=;
 b=ioMKKNJkDKvyCK0ZHba7o+YscsXWWLxvtZCFF8j15nqkU69JrBnrjqmXWJyUS++DO9
 0AwAjzITZmM+d5sUKvjRlDx0eAbhnVJye7zR3bn1+EFLesUNLUd4lh/6K3wO7lq7RdCQ
 Rl0XtPUaXmBJQmbxAFNZ+MmCW08iDuo9GHNiTJxicU7HhIqwP9ln3CNkibpH2t2pWI+p
 E81muQ8f7h8op1q+j6qd9759vBZGyjuHeitDcWD1xfH3GGDzIO1uRoHIfnebbyzmF8vJ
 2wd98h6FS0S31eGEF+U3QG7TqQEIl7yQw6vWWFK+DW4C5I+bETcSDMujoeJp74afzMlp
 Io4Q==
X-Gm-Message-State: AO0yUKViaZpS660y1rJejZL8fMBEdoXQLgxrWO7bU+9hlr6K/s/n8L2u
 6KK4ShT9oo9Dv6kkC6Lqyj+S5dP9j8oHVvJPiGeT8A==
X-Google-Smtp-Source: AK7set92k3NRrPN2he11BGdlbGn60K3DywK0CbxSsYhZFMP0yqz9TN0nMnTZIMoiK0OGrH+RzO7evGw5Dv6xxrzg//4=
X-Received: by 2002:a02:ca50:0:b0:3b2:a6c0:2879 with SMTP id
 i16-20020a02ca50000000b003b2a6c02879mr1987635jal.7.1675764475679; Tue, 07 Feb
 2023 02:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20230116110820.2615650-1-treapking@chromium.org>
 <20230116110820.2615650-2-treapking@chromium.org>
 <20230117201703.GA3555326-robh@kernel.org>
In-Reply-To: <20230117201703.GA3555326-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 7 Feb 2023 18:07:44 +0800
Message-ID: <CAEXTbpdOg_un9rWD+QeS1rJLW8wHzDOnkJ-i6R0WNvAU4THEGQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add GPIO display mux
 binding
To: Rob Herring <robh@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for the review.


On Wed, Jan 18, 2023 at 4:17 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 16, 2023 at 07:08:19PM +0800, Pin-yen Lin wrote:
> > From: Nicolas Boichat <drinkcat@chromium.org>
> >
> > Add bindings for Generic GPIO mux driver.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Referenced existing dt-binding schemas from graph.yaml
> > - Added ddc-i2c-bus into the bindings
> >
> >  .../bindings/display/bridge/gpio-mux.yaml     | 95 +++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > new file mode 100644
> > index 000000000000..da29ba078f05
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic display mux (1 input, 2 outputs)
> > +
> > +maintainers:
> > +  - Nicolas Boichat <drinkcat@chromium.org>
> > +
> > +description: |
> > +  This bindings describes a simple display (e.g. HDMI) mux, that has 1
> > +  input, and 2 outputs. The mux status is controlled by hardware, and
> > +  its status is read back using a GPIO.
> > +
> > +properties:
> > +  compatible:
> > +    const: gpio-display-mux
> > +
> > +  detect-gpios:
> > +    maxItems: 1
> > +    description: GPIO that indicates the active output
>
> What are we detecting? That implies an input, but this is selecting the
> output path, right? Or what does 'mux status is controlled by hardware'
> mean exactly? Something else? That does not sound very generic.

The GPIO (or any kind of MUX) is an input that indicates where the
output should go. The actual "output selection" procedure is done in
the driver. That is, the driver monitors this GPIO and selects the
output path accordingly. In our use case, the GPIO is reported by the
embedded controller on the device.

[1] listed other similar bridges that can leverage this driver, so we
called this driver "generic".

[1]: https://lore.kernel.org/all/CAJMQK-jGw8kJFNjoHjeZUL+3NCiOS2hgGERnAnMwNsL_cm_J=Q@mail.gmail.com/

>
> In any case, we have a common mux binding so any kind of mux control
> could be used here, not just GPIO. Then you can make this just a generic
> display mux.

Thanks for sharing this, I'll update the binding in the next version.
>
> > +
> > +  ddc-i2c-bus:
> > +    description: phandle link to the I2C controller used for DDC EDID probing
> > +    $ref: /schemas/types.yaml#/definitions/phandle
>
> This belongs in the connector node(s).

The HDMI bridge before the MUX doesn't (and doesn't have to) know that
its next bridge is a MUX. We put it here so that the HDMI bridge can
parse the phandle and get the bus node.

Regards,
Pin-yen

>
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: |
> > +          Video port for input.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: |
> > +          2 video ports for output.
> > +          The reg value in the endpoints matches the GPIO status: when
> > +          GPIO is asserted, endpoint with reg value <1> is selected.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - detect-gpios
> > +  - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    hdmi_mux: hdmi_mux {
> > +      compatible = "gpio-display-mux";
> > +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> > +      pinctrl-names = "default";
> > +      pinctrl-0 = <&hdmi_mux_pins>;
> > +      ddc-i2c-bus = <&hdmiddc0>;
> > +
> > +      ports {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 { /* input */
> > +          reg = <0>;
> > +
> > +          hdmi_mux_in: endpoint {
> > +            remote-endpoint = <&hdmi0_out>;
> > +          };
> > +        };
> > +
> > +        port@1 { /* output */
> > +          reg = <1>;
> > +
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          hdmi_mux_out_anx: endpoint@0 {
> > +            reg = <0>;
> > +            remote-endpoint = <&dp_bridge_in>;
> > +          };
> > +
> > +          hdmi_mux_out_hdmi: endpoint@1 {
> > +            reg = <1>;
> > +            remote-endpoint = <&hdmi_connector_in>;
> > +          };
> > +        };
> > +      };
> > +    };
> > --
> > 2.39.0.314.g84b9a713c41-goog
> >
