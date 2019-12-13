Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422BA11ED47
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 22:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35C86EDE1;
	Fri, 13 Dec 2019 21:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67396EDE1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 21:57:33 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED587214AF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 21:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576274253;
 bh=tlc6zX/LTEyF5wczNgFfQrREIesmdwXR+IfQ/HzAsqI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tChdrOHwVR4yyTwtdacNPGDfpaUcoEv5vr9cdDrJpGeOrt/Hx5hrwbqCGhYABt3GS
 SatKHBkbyHAb6PJsDxv8ggo5DJxQwpdTWFSiVgBwQneu9JEc9J2mrZIWIQk+A1uWMi
 Ypwv7fTg+nj0urq23lVAXX1RvM2+Oa+H8yM2IPK4=
Received: by mail-io1-f43.google.com with SMTP id a22so1193021ios.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 13:57:33 -0800 (PST)
X-Gm-Message-State: APjAAAVIDNWufktUbW7449YKXOCWBMNC2rYDLZpjFs91on5GuxR2mq/i
 tgH+48yY3gXSb6LvMRDhTuhb0+vlBujABm11aw==
X-Google-Smtp-Source: APXvYqyLVGyr/ou6/zCUSR6nbqEvM4qZSGd5lkUZviadNs7lGm/zXP4dZkMOJJThzBpo59gYWshwpV/gf0X0NWtCe7c=
X-Received: by 2002:a05:620a:135b:: with SMTP id
 c27mr1536497qkl.119.1576245251094; 
 Fri, 13 Dec 2019 05:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-4-hsinyi@chromium.org>
In-Reply-To: <20191211061911.238393-4-hsinyi@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 13 Dec 2019 07:53:59 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+jkgDj6-SH1FrnjB1CQmf33=XUwN3N_fw_aJsQm3Fq9A@mail.gmail.com>
Message-ID: <CAL_Jsq+jkgDj6-SH1FrnjB1CQmf33=XUwN3N_fw_aJsQm3Fq9A@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: Add GPIO display mux
 binding
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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

On Wed, Dec 11, 2019 at 12:19 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> From: Nicolas Boichat <drinkcat@chromium.org>
>
> Add bindings for Generic GPIO mux driver.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change from RFC to v1:
> - txt to yaml
> ---
>  .../bindings/display/bridge/gpio-mux.yaml     | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> new file mode 100644
> index 000000000000..cef098749066
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic display mux (1 input, 2 outputs)

What makes it generic? Doesn't the mux chip have power supply,
possibly a reset line or not, etc.? What about a mux where the GPIO
controls the mux?

Generally, we avoid 'generic' bindings because h/w is rarely generic.
You can have a generic driver which works on multiple devices.

> +
> +maintainers:
> +  - Nicolas Boichat <drinkcat@chromium.org>
> +
> +description: |
> +  This bindings describes a simple display (e.g. HDMI) mux, that has 1
> +  input, and 2 outputs. The mux status is controlled by hardware, and
> +  its status is read back using a GPIO.
> +
> +properties:
> +  compatible:
> +    const: gpio-display-mux
> +
> +  detect-gpios:
> +    maxItems: 1
> +    description: GPIO that indicates the active output
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Video port for input.
> +
> +      port@1:
> +        type: object
> +        description: |
> +          2 video ports for output.
> +          The reg value in the endpoints matches the GPIO status: when
> +          GPIO is asserted, endpoint with reg value <1> is selected.

You should describe 'endpoint@0' and 'endpoint@1' here too.

> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - detect-gpios
> +  - ports
> +
> +examples:
> +  - |
> +    hdmi_mux: hdmi_mux {
> +      compatible = "gpio-display-mux";
> +      status = "okay";

Don't show status in examples.

> +      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&hdmi_mux_pins>;
> +      ddc-i2c-bus = <&hdmiddc0>;

Not documented. Is the i2c bus muxed too? If not, then this is in the
wrong place.

> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 { /* input */
> +          reg = <0>;
> +
> +          hdmi_mux_in: endpoint {
> +            remote-endpoint = <&hdmi0_out>;
> +          };
> +        };
> +
> +        port@1 { /* output */
> +          reg = <1>;
> +
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          hdmi_mux_out_anx: endpoint@0 {
> +            reg = <0>;
> +            remote-endpoint = <&anx7688_in>;
> +          };
> +
> +          hdmi_mux_out_hdmi: endpoint@1 {
> +            reg = <1>;
> +            remote-endpoint = <&hdmi_connector_in>;
> +          };
> +        };
> +      };
> +    };
> --
> 2.24.0.525.g8f36a354ae-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
