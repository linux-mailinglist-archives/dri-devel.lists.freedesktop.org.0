Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927008FD110
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 16:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D309C10E0CC;
	Wed,  5 Jun 2024 14:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b+HGNOjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9E010E0CC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 14:45:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 969E8CE1802;
 Wed,  5 Jun 2024 14:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BC0C2BD11;
 Wed,  5 Jun 2024 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717598734;
 bh=mHx8HVUaCOXB9TNFRsb/Kr5+jRe8xYJtJCTxzswwyL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b+HGNOjLTmLvbLanSFpFvA22GtGdn4J0i3MW2C5W4vRitwIq5oiSsfak1fBtzSLLr
 eTB/yjYVnzdgcPNUn7xbSGXexZSgk4GVvGRR0A5mhG9xTe5Hnh5X1gDP9owkFQYKbs
 1EFC0SX8fgXlR/LRX7/yh925kcgccJU9pzYnO43yQBilSDoet1YyRanpsZRCbH3uwn
 jkPqU8K2EvZAgER8jcR7EXLDmfUh1AgoTw9Vl3TgA0du0pWTJcG8ebTPkFyXZYfpoT
 OBXDbACxvLYopLguh082VMxKZEFA8+YvKYBi8J1z9vDxfOFKUXqoCwkNDF7L9tSbXT
 GiDej3pcclA8g==
Date: Wed, 5 Jun 2024 08:45:31 -0600
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
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: add GE SUNH hotplug addon
 connector
Message-ID: <20240605144531.GA2642279-robh@kernel.org>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-1-ec32f2c66d56@bootlin.com>
 <20240510163625.GA336987-robh@kernel.org>
 <20240514185125.58225238@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240514185125.58225238@booty>
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

On Tue, May 14, 2024 at 06:51:25PM +0200, Luca Ceresoli wrote:
> Hello Rob,
> 
> +cc Srinivas and Miquèl for the NVMEM cell discussion below
> 
> On Fri, 10 May 2024 11:36:25 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Fri, May 10, 2024 at 09:10:37AM +0200, Luca Ceresoli wrote:
> > > Add bindings for the GE SUNH add-on connector. This is a physical,
> > > hot-pluggable connector that allows to attach and detach at runtime an
> > > add-on adding peripherals on non-discoverable busses.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [...]
> 
> > > +++ b/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
> > > @@ -0,0 +1,197 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/connector/ge,sunh-addon-connector.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: GE SUNH hotplug add-on connector
> > > +
> > > +maintainers:
> > > +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > +
> > > +description:
> > > +  Represent the physical connector present on GE SUNH devices that allows
> > > +  to attach and detach at runtime an add-on adding peripherals on
> > > +  non-discoverable busses.
> > > +
> > > +  This connector has status GPIOs to notify the connection status to the
> > > +  CPU and a reset GPIO to allow the CPU to reset all the peripherals on the
> > > +  add-on. It also has a 4-lane MIPI DSI bus.
> > > +
> > > +  Add-on removal can happen at any moment under user control and without
> > > +  prior notice to the CPU, making all of its components not usable
> > > +  anymore. Later on, the same or a different add-on model can be connected.  
> > 
> > Is there any documentation for this connector?
> > 
> > Is the connector supposed to be generic in that any board with any SoC 
> > could have it? If so, the connector needs to be able to remap things so 
> > overlays aren't tied to the base dts, but only the connector. If not, 
> > then doing that isn't required, but still a good idea IMO.
> 
> It is not generic. The connector pinout is very specific to this
> product, and there is no public documentation.
> 
> > > +examples:
> > > +  # Main DTS describing the "main" board up to the connector
> > > +  - |
> > > +    / {
> > > +        #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +        addon_connector: addon-connector {  
> > 
> > Just 'connector' for the node name.
> 
> OK
> 
> > > +            compatible = "ge,sunh-addon-connector";
> > > +            reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
> > > +            plugged-gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
> > > +            powergood-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
> > > +
> > > +            ports {
> > > +                #address-cells = <1>;
> > > +                #size-cells = <0>;
> > > +
> > > +                port@0 {
> > > +                    reg = <0>;
> > > +
> > > +                    hotplug_conn_dsi_in: endpoint {
> > > +                        remote-endpoint = <&previous_bridge_out>;
> > > +                    };
> > > +                };
> > > +
> > > +                port@1 {
> > > +                    reg = <1>;
> > > +
> > > +                    hotplug_conn_dsi_out: endpoint {
> > > +                        // remote-endpoint to be added by overlay
> > > +                    };
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +  # "base" overlay describing the common components on every add-on that
> > > +  # are required to read the model ID  
> > 
> > This is located on the add-on board, right?
> 
> Exactly. Each add-on has an EEPROM with the add-on model ID stored
> along with other data.
> 
> > Is it really any better to have this as a separate overlay rather than 
> > just making it an include? Better to have just 1 overlay per board 
> > applied atomically than splitting it up.
> 
> (see below)
> 
> > > +  - |
> > > +    &i2c1 {  
> > 
> > Generally, I think everything on an add-on board should be underneath 
> > the connector node. For starters, that makes controlling probing and 
> > removal of devices easier. For example, you'll want to handle 
> > reset-gpios and powergood-gpios before any devices 'appear'. Otherwise, 
> > you add devices on i2c1, start probing them, and then reset them at some 
> > async time?
> 
> This is not a problem because the code is asserting reset before
> loading the first overlay. From patch 5/5:

What if the bootloader happened to load the overlay already? Or you 
kexec into a new kernel?

Keeping things underneath a connector node makes managing the 
dependencies easier. It also can allow us to have some control over what 
overlays can and can't modify. It also reflects reality that these 
devices sit behind the connector.

> 
>     static int sunh_conn_attach(struct sunh_conn *conn)
>     {
> 	int err;
> 
> 	/* Reset the plugged board in order to start from a stable state */
> 	sunh_conn_reset(conn, false);
> 
> 	err = sunh_conn_load_base_overlay(conn);
>         ...
>     }
> 
> > For i2c, it could look something like this:
> > 
> > connector {
> >   i2c {
> > 	i2c-parent = <&i2c1>;
> > 
> > 	eeprom@50 {...};
> >   };
> > };
> 
> I think this can be done, but I need to evaluate what is needed in the
> driver code to support it.
> 
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        eeprom@50 {
> > > +            compatible = "atmel,24c64";
> > > +            reg = <0x50>;
> > > +
> > > +            nvmem-layout {
> > > +                compatible = "fixed-layout";
> > > +                #address-cells = <1>;
> > > +                #size-cells = <1>;
> > > +
> > > +                addon_model_id: addon-model-id@400 {
> > > +                    reg = <0x400 0x1>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +    &addon_connector {
> > > +        nvmem-cells = <&addon_model_id>;
> > > +        nvmem-cell-names = "id";
> > > +    };  
> > 
> > It's kind of sad that an addon board has an eeprom to identify it, but 
> > it's not itself discoverable...
> 
> Not sure I got what you mean exactly here, sorry.

Only that to be discoverable, you shouldn't need DT.

> The add-on board is discoverable in the sense that it has a GPIO
> (actually two) to be notified of plug/unplug, and it has a way to
> describe itself by reading a model ID. Conceptually this is what HDMI
> monitors do: an HPD pin and an EEPROM at a fixed address with data at
> fixed locations.
>
> If you mean the addon_connector node might be avoided, then I kind of
> agree, but this seems not what the NVMEM DT representation expects so
> I'm not sure removing it would be correct in the first place.
> 
> Srinivas, do you have any insights to share about this? The topic is a
> device tree overlay that describes a hotplug-removable add-on, and in
> particular the EEPROM present on all add-ons to provide the add-on
> model ID.
> 
> > Do you load the first overlay and then from it decide which 
> > specific overlay to apply?
> 
> Exactly.
> 
> The first overlay (the example you quoted above) describes enough to
> reach the model ID in the EEPROM, and this is identical for all add-on
> models. The second add-on is model-specific, there is one for each
> model, and the model ID allows to know which one to load.

So you don't really need an overlay for this unless the EEPROM model 
changes or the model-id offset changes.

I suppose nvmem needs something in DT to register a region. That's 
really nvmem's problem, but I guess what you have is fine.

Rob
