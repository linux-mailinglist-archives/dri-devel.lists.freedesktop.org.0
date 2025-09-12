Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F169B55949
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 00:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC5910ECE8;
	Fri, 12 Sep 2025 22:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hu/SOl5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF2310ECE8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 22:35:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D59C6000A;
 Fri, 12 Sep 2025 22:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB511C4CEF1;
 Fri, 12 Sep 2025 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757716555;
 bh=2CnoRP2z2CLiNDktcdk7xPf8rU6fPu5yFoEfsAQ+Ojs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hu/SOl5u4tRtqyhIOiqYNA6XR+OljawU94WoV3xl2KyKukaDgM3hrqX1oeitvy3fe
 xl5QuU3ysL1uJUsjgCMz1KBdUHW7TrgQc5lE1NRoP7oqzXuicalQzfseXQPZZVv1AW
 64r5Me63yOJf0e2v9qKH4UHZoXbB9O3QrAOun2q1UvEElh09kY7ryfg8mPjtdplex0
 Qqy6SZ/6x6jTUcsJzY0SPPCenlwjeCZc+ypWUuk8gpDl0ejgeOwhjvVkxqHpbvraua
 4EQ6RnAnqNrFmjxjPeF8OAaTvof5TB4h8WptdYxIlSygut+PuL7dgiOheOYXmRnVyG
 ZANYc3XlgMgaA==
Date: Fri, 12 Sep 2025 17:35:54 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: bridge: convert
 megachips-stdpxxxx-ge-b850v3-fw.txt to yaml
Message-ID: <20250912223554.GA1536924-robh@kernel.org>
References: <20250912181419.1114695-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912181419.1114695-1-Frank.Li@nxp.com>
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

On Fri, Sep 12, 2025 at 02:14:18PM -0400, Frank Li wrote:
> Convert megachips-stdpxxxx-ge-b850v3-fw.txt to yaml format.
> 
> Additional changes:
> - Only keep one example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../megachips,stdp2690-ge-b850v3-fw.yaml      | 105 ++++++++++++++++++
>  .../megachips-stdpxxxx-ge-b850v3-fw.txt       |  91 ---------------
>  2 files changed, 105 insertions(+), 91 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml b/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
> new file mode 100644
> index 0000000000000..6b5cfc41f7414
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GE B850v3 video bridge
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description: |
> +   STDP4028-ge-b850v3-fw bridges (LVDS-DP)
> +   STDP2690-ge-b850v3-fw bridges (DP-DP++)
> +
> +   The video processing pipeline on the second output on the GE B850v3:
> +
> +   Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output
> +
> +   Each bridge has a dedicated flash containing firmware for supporting the custom
> +   design. The result is that, in this design, neither the STDP4028 nor the
> +   STDP2690 behave as the stock bridges would. The compatible strings include the
> +   suffix "-ge-b850v3-fw" to make it clear that the driver is for the bridges with
> +   the firmware specific for the GE B850v3.
> +
> +   The hardware do not provide control over the video processing pipeline, as the
> +   two bridges behaves as a single one. The only interfaces exposed by the
> +   hardware are EDID, HPD, and interrupts.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - megachips,stdp4028-ge-b850v3-fw
> +      - megachips,stdp2690-ge-b850v3-fw
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port

Need to state this is the input port.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port

And this is the output.

Aren't both required as well?

> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: megachips,stdp4028-ge-b850v3-fw
> +    then:
> +      required:
> +        - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        bridge@73 {
> +            compatible = "megachips,stdp4028-ge-b850v3-fw";
> +            reg = <0x73>;
> +            interrupt-parent = <&gpio2>;
> +            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    endpoint {
> +                        remote-endpoint = <&lvds0_out>;
> +                    };
> +
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    endpoint {
> +                        remote-endpoint = <&stdp2690_in>;
> +                    };
> +               };
> +            };
> +        };
> +    };
> +
