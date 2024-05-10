Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E967E8C28CE
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 18:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D30710EE6D;
	Fri, 10 May 2024 16:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m2AsaBUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF07110EE56
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 16:36:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 28D20CE1E39;
 Fri, 10 May 2024 16:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274A5C113CC;
 Fri, 10 May 2024 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715358987;
 bh=mp8a9uWEDeM5bKN7SHl84RssnBPGlObtm24gPhRFHUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m2AsaBUrxreYIiBe0A32CZ3MTKcLJCo9Rj9nW3hXruyJ+nhC86BrpGZEXzGTsjbwL
 upPL/8AP+WNkxiC+/D3eJ3/11S8yubJ4VHtTevDB5nmQ23Xda0DuTHCuOyKXzBwPYX
 EuhFyWgAfVvqDTGH8pBCBWyg4LyefgwzDCDGZ+AT1nZhtlMDZvGKXlw/JXQy3LbAz5
 1/gecTuHz4aurtGdS/08PzwuhN6NHLx/7clihXAz7811hy7C0p5/BnQxvG9AynxeOw
 5oenUYnapIH6RFiaf8XZ8hMinWIH9j72tpiMwEXV9V8ucRRDzQa4tSRLvskUVNDIsw
 QpT3RwCefBSCg==
Date: Fri, 10 May 2024 11:36:25 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 Paul Kocialkowski <contact@paulk.fr>,
 =?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: add GE SUNH hotplug addon
 connector
Message-ID: <20240510163625.GA336987-robh@kernel.org>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
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

On Fri, May 10, 2024 at 09:10:37AM +0200, Luca Ceresoli wrote:
> Add bindings for the GE SUNH add-on connector. This is a physical,
> hot-pluggable connector that allows to attach and detach at runtime an
> add-on adding peripherals on non-discoverable busses.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> NOTE: the second and third examples fail 'make dt_binding_check' because
>       they are example of DT overlay code -- I'm not aware of a way to
>       validate overlay examples as of now
> 
> This patch is new in v2.
> ---
>  .../connector/ge,sunh-addon-connector.yaml         | 197 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 202 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml b/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
> new file mode 100644
> index 000000000000..c7ac62e5f2c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
> @@ -0,0 +1,197 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/ge,sunh-addon-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GE SUNH hotplug add-on connector
> +
> +maintainers:
> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +description:
> +  Represent the physical connector present on GE SUNH devices that allows
> +  to attach and detach at runtime an add-on adding peripherals on
> +  non-discoverable busses.
> +
> +  This connector has status GPIOs to notify the connection status to the
> +  CPU and a reset GPIO to allow the CPU to reset all the peripherals on the
> +  add-on. It also has a 4-lane MIPI DSI bus.
> +
> +  Add-on removal can happen at any moment under user control and without
> +  prior notice to the CPU, making all of its components not usable
> +  anymore. Later on, the same or a different add-on model can be connected.

Is there any documentation for this connector?

Is the connector supposed to be generic in that any board with any SoC 
could have it? If so, the connector needs to be able to remap things so 
overlays aren't tied to the base dts, but only the connector. If not, 
then doing that isn't required, but still a good idea IMO.

> +
> +properties:
> +  compatible:
> +    const: ge,sunh-addon-connector
> +
> +  reset-gpios:
> +    description: An output GPIO to reset the peripherals on the add-on.
> +    maxItems: 1
> +
> +  plugged-gpios:
> +    description: An input GPIO that is asserted if and only if an add-on is
> +      physically connected.
> +    maxItems: 1
> +
> +  powergood-gpios:
> +    description: An input GPIO that is asserted if and only if power rails
> +      on the add-on are stable.
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description: OF graph bindings modeling the MIPI DSI bus across the
> +      connector. The connector splits the video pipeline in a fixed part
> +      and a removable part.
> +
> +      The fixed part of the video pipeline includes all components up to
> +      the display controller and 0 or more bridges. The removable part
> +      includes any bridges and any other components up to the panel.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The MIPI DSI bus line from the CPU to the connector.
> +          The remote-endpoint sub-node must point to the last non-removable
> +          component of the video pipeline.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +        description: The MIPI DSI bus line from the connector to the
> +          add-on. The remote-endpoint sub-node must point to the first
> +          add-on component of the video pipeline. As it describes the
> +          hot-pluggable hardware, the endpoint node cannot be filled until
> +          an add-on is detected, so this needs to be done by a device tree
> +          overlay at runtime.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  # Main DTS describing the "main" board up to the connector
> +  - |
> +    / {
> +        #include <dt-bindings/gpio/gpio.h>
> +
> +        addon_connector: addon-connector {

Just 'connector' for the node name.

> +            compatible = "ge,sunh-addon-connector";
> +            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
> +            plugged-gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
> +            powergood-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    hotplug_conn_dsi_in: endpoint {
> +                        remote-endpoint = <&previous_bridge_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    hotplug_conn_dsi_out: endpoint {
> +                        // remote-endpoint to be added by overlay
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +  # "base" overlay describing the common components on every add-on that
> +  # are required to read the model ID

This is located on the add-on board, right?

Is it really any better to have this as a separate overlay rather than 
just making it an include? Better to have just 1 overlay per board 
applied atomically than splitting it up.

> +  - |
> +    &i2c1 {

Generally, I think everything on an add-on board should be underneath 
the connector node. For starters, that makes controlling probing and 
removal of devices easier. For example, you'll want to handle 
reset-gpios and powergood-gpios before any devices 'appear'. Otherwise, 
you add devices on i2c1, start probing them, and then reset them at some 
async time?

For i2c, it could look something like this:

connector {
  i2c {
	i2c-parent = <&i2c1>;

	eeprom@50 {...};
  };
};

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        eeprom@50 {
> +            compatible = "atmel,24c64";
> +            reg = <0x50>;
> +
> +            nvmem-layout {
> +                compatible = "fixed-layout";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                addon_model_id: addon-model-id@400 {
> +                    reg = <0x400 0x1>;
> +                };
> +            };
> +        };
> +    };
> +
> +    &addon_connector {
> +        nvmem-cells = <&addon_model_id>;
> +        nvmem-cell-names = "id";
> +    };

It's kind of sad that an addon board has an eeprom to identify it, but 
it's not itself discoverable...

Do you load the first overlay and then from it decide which 
specific overlay to apply?

Rob
