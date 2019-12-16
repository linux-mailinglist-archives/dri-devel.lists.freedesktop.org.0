Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC4211FFC0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6386E433;
	Mon, 16 Dec 2019 08:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72EF6E171
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 07:16:49 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id z12so4589246iln.11
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 23:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DdW2X0TaM/Yjl1cs8WJAfaWb8b937afv0ai4eAXIEbQ=;
 b=ha9L17WAZBqCDEiESxhWvrNiQOpHmRyoVhTON48lus8d3oYRR3rIxvfPGWw1YPCSrl
 wYa2PqtQQIyQ65YCU6knRNnaLZxgn8GLNj4kMLfTA/FhkTmPaZPvLA9hUUNHoEk3G9As
 09om+raRs1ka5EgN3yL7DTjgKQLTiYDsNjVSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DdW2X0TaM/Yjl1cs8WJAfaWb8b937afv0ai4eAXIEbQ=;
 b=BpiAdmnnoIJFeGF9d1buIWtwvspTmDpIDajsVyXVfTlpjh7zskYo3bGa/osUR7dH6a
 iZfpO2KDneOfsLatLh2nk4+59kf7+KiUchtyPXXYFQd5bSVKcDZ/ZqdRtXpIkvISP0Gq
 rUP9IqgOACwddeK8LnUAypgqA8J/yK0+Ny4rSc0No0J6zaFRX/DeAb8PnUSBjLcNzgQM
 mz6AIacW1HIKjU/SdSTOsBXtbi5QJHqk93pmyEkLk3nLv52WdY5rvLStxCewAm0SZE9t
 CLFxLTIT1Q8cGHYTIiNAXK+UlSVve6zJZxGYhfUXxEDKi+q1IFUfHCCbplI70uM7KZQl
 d7vg==
X-Gm-Message-State: APjAAAXBZtYBj3wzH8SCrWUNMazY4T/NOhMWa0jUqoP0eXunsJ8rwHEm
 pLSpeH8+hkMuF+fhxo9aspUnJBKb93W8jXIKKfDhQ0ZzwtZ52w==
X-Google-Smtp-Source: APXvYqx3LVRZM6HCeLKsjVRJpN93LQNOQCxa7ygHr779jDj9jz6qFUfOmbd97fsgpcFQeRAI55T1yDrqMsqHtxzf2MY=
X-Received: by 2002:a92:5d88:: with SMTP id e8mr11295212ilg.106.1576480608958; 
 Sun, 15 Dec 2019 23:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-4-hsinyi@chromium.org>
 <CAL_Jsq+jkgDj6-SH1FrnjB1CQmf33=XUwN3N_fw_aJsQm3Fq9A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+jkgDj6-SH1FrnjB1CQmf33=XUwN3N_fw_aJsQm3Fq9A@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 16 Dec 2019 15:16:23 +0800
Message-ID: <CAJMQK-iwF78=2PDMxp=cvS3sotNi7kjj1ZoVO9q_axejUPdLYA@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: Add GPIO display mux
 binding
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 14, 2019 at 5:29 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Dec 11, 2019 at 12:19 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > From: Nicolas Boichat <drinkcat@chromium.org>
> >
> > Add bindings for Generic GPIO mux driver.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Change from RFC to v1:
> > - txt to yaml
> > ---
> >  .../bindings/display/bridge/gpio-mux.yaml     | 89 +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > new file mode 100644
> > index 000000000000..cef098749066
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic display mux (1 input, 2 outputs)
>
> What makes it generic? Doesn't the mux chip have power supply,
> possibly a reset line or not, etc.? What about a mux where the GPIO
> controls the mux?
>
> Generally, we avoid 'generic' bindings because h/w is rarely generic.
> You can have a generic driver which works on multiple devices.
>
Then how about making it mt8173-oak-gpio-mux? Since this is currently
only used in this board.

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
> > +
> > +  ports:
> > +    type: object
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: |
> > +          Video port for input.
> > +
> > +      port@1:
> > +        type: object
> > +        description: |
> > +          2 video ports for output.
> > +          The reg value in the endpoints matches the GPIO status: when
> > +          GPIO is asserted, endpoint with reg value <1> is selected.
>
> You should describe 'endpoint@0' and 'endpoint@1' here too.
Will add in next version, thanks
>
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
> > +examples:
> > +  - |
> > +    hdmi_mux: hdmi_mux {
> > +      compatible = "gpio-display-mux";
> > +      status = "okay";
>
> Don't show status in examples.
>
> > +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> > +      pinctrl-names = "default";
> > +      pinctrl-0 = <&hdmi_mux_pins>;
> > +      ddc-i2c-bus = <&hdmiddc0>;
>
> Not documented. Is the i2c bus muxed too? If not, then this is in the
> wrong place.
>
It's muxed, but this is required because of [1], so it should be
removed in this example.

[1]https://elixir.bootlin.com/linux/v5.5-rc2/source/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt#L24
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
> > +            remote-endpoint = <&anx7688_in>;
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
> > 2.24.0.525.g8f36a354ae-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
