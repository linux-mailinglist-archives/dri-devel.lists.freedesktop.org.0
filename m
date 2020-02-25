Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726916EDB6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A546E8F5;
	Tue, 25 Feb 2020 18:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337FF6E8F5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:16:57 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id d62so206884oia.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7UyTeMzaTbOixtQKcOlo1zEfQ//tLMtgH0J7yCWDsaI=;
 b=kOcUMspWO4rx1+u7qW/P8PCke5lI5BYkYIJR210CGnL2Jxk+bg9YLi597kXcOpI1qq
 FEbsAmiuz2BW8Of51BXVKt5LaJGxTLww8KuCTlQAW8O6x5mbTHk6sMLm7qvSh7amhpla
 MLb2YFUslx7QocujDr4m/nYvBZ9+vqgLNPGXksn++q3DtKGABDo2ubge+yBOhwJAzrJv
 1nTkG1N3FMNdZE8yBZ/ym5KD3oKdW+XgY6njtxxVVU3K5jKv15aNPPoqp+oIrahC5IcX
 2wpwIiJvJQhHAjD32Ycimzf2Yr5x1NCW4Uq+/E7f6TpNojcmStXFgNwBOPTuHWuaXeIV
 E1Nw==
X-Gm-Message-State: APjAAAXT+FlZ7pjnoyjhax4/hREFUzhido1hoCxF9Nj0OD6s8+MIaaEb
 4Kit6E7OO1w5gBpXoGdEHA==
X-Google-Smtp-Source: APXvYqyG5jtbTR8e+2eatGO7AOO/3BLqG2/NHQ3384FNvtFffmk1sB1TsteHHtEFBpdhQlFHBTXPqA==
X-Received: by 2002:aca:190b:: with SMTP id l11mr175520oii.65.1582654616272;
 Tue, 25 Feb 2020 10:16:56 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c10sm5886903otl.77.2020.02.25.10.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:16:55 -0800 (PST)
Received: (nullmailer pid 3615 invoked by uid 1000);
 Tue, 25 Feb 2020 18:16:54 -0000
Date: Tue, 25 Feb 2020 12:16:54 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 06/89] dt-bindings: clock: Add a binding for the RPi
 Firmware clocks
Message-ID: <20200225181654.GA694@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <9166f3acdc2a64e3f3ca1cd2e283005ee2df37c9.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9166f3acdc2a64e3f3ca1cd2e283005ee2df37c9.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2020 at 10:06:08AM +0100, Maxime Ripard wrote:
> The firmare running on the RPi VideoCore can be used to discover and
> change the various clocks running in the BCM2711. Since devices will
> need to use them through the DT, let's add a pretty simple binding.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
> new file mode 100644
> index 000000000000..d37bc311321d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/raspberrypi,firmware-clocks.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RaspberryPi Firmware Clocks Device Tree Bindings
> +
> +maintainers:
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  compatible:
> +    const: raspberrypi,firmware-clocks
> +
> +  raspberrypi,firmware:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: >
> +      Phandle to the mailbox node to communicate with the firmware.

Can't this be a child node of the phandle instead? Or just add 
'#clock-cells' to the firmware node.

> +
> +required:
> +  - "#clock-cells"
> +  - compatible
> +  - raspberrypi,firmware
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    firmware_clocks: firmware-clocks {
> +        compatible = "raspberrypi,firmware-clocks";
> +        raspberrypi,firmware = <&firmware>;
> +        #clock-cells = <1>;
> +    };
> +
> +...
> -- 
> git-series 0.9.1
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
