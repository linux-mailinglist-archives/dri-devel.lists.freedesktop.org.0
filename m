Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A82A93698
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 13:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AE610EB92;
	Fri, 18 Apr 2025 11:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=agner.ch header.i=@agner.ch header.b="vxSi13ww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 502 seconds by postgrey-1.36 at gabe;
 Fri, 18 Apr 2025 11:33:28 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CDB10EB91
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:33:28 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 460E25C3AFC;
 Fri, 18 Apr 2025 13:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1744975500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOzG+fEM39s2zzvOzq9Nh3CClcu3NIbRag3rdoSGJsM=;
 b=vxSi13wwKpcwLfzRx7RbsGs7XfIfI+2RcWMld/VZs16VBmE9bazgiOWAHKTJ4NKwxGMQCJ
 pj6i9gBkfQBtUTXqlip0C9bi5pzSFkfnE8/DMhYx4NnfwJ5FyqUhhL3LoROsE9d7dWKnXz
 fRUsS+BwEoqnYnnBC5BP0dgRHkFZMHA=
MIME-Version: 1.0
Date: Fri, 18 Apr 2025 13:25:00 +0200
From: Stefan Agner <stefan@agner.ch>
To: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl,dcu.txt to
 yaml format
In-Reply-To: <20250417151934.3570681-1-Frank.Li@nxp.com>
References: <20250417151934.3570681-1-Frank.Li@nxp.com>
Message-ID: <9fe744c4deaa9154e201a39874b54f75@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On 2025-04-17 17:19, Frank Li wrote:
> Convert fsl,dcu.txt to yaml format.
> 
> Additional changes:
> - remove label in example.
> - change node to display-controller in example.
> - use 32bit address in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  .../devicetree/bindings/display/fsl,dcu.txt   | 34 ----------
>  .../bindings/display/fsl,ls1021a-dcu.yaml     | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 69 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/fsl,dcu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,dcu.txt b/Documentation/devicetree/bindings/display/fsl,dcu.txt
> deleted file mode 100644
> index 63ec2a624aa94..0000000000000
> --- a/Documentation/devicetree/bindings/display/fsl,dcu.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Device Tree bindings for Freescale DCU DRM Driver
> -
> -Required properties:
> -- compatible:		Should be one of
> -	* "fsl,ls1021a-dcu".
> -	* "fsl,vf610-dcu".
> -
> -- reg:			Address and length of the register set for dcu.
> -- clocks:		Handle to "dcu" and "pix" clock (in the order below)
> -			This can be the same clock (e.g. LS1021a)
> -			See ../clocks/clock-bindings.txt for details.
> -- clock-names:		Should be "dcu" and "pix"
> -			See ../clocks/clock-bindings.txt for details.
> -- big-endian		Boolean property, LS1021A DCU registers are big-endian.
> -- port			Video port for the panel output
> -
> -Optional properties:
> -- fsl,tcon:		The phandle to the timing controller node.
> -
> -Examples:
> -dcu: dcu@2ce0000 {
> -	compatible = "fsl,ls1021a-dcu";
> -	reg = <0x0 0x2ce0000 0x0 0x10000>;
> -	clocks = <&platform_clk 0>, <&platform_clk 0>;
> -	clock-names = "dcu", "pix";
> -	big-endian;
> -	fsl,tcon = <&tcon>;
> -
> -	port {
> -		dcu_out: endpoint {
> -			remote-endpoint = <&panel_out>;
> -	     };
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
> new file mode 100644
> index 0000000000000..7246c89271a8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale DCU DRM Driver
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,ls1021a-dcu
> +      - fsl,vf610-dcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: dcu
> +      - const: pix
> +
> +  big-endian: true
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: Video port for the panel output
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +  fsl,tcon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle to the timing controller node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    display-controller@2ce0000 {
> +        compatible = "fsl,ls1021a-dcu";
> +        reg = <0x2ce0000 0x10000>;
> +        clocks = <&platform_clk 0>, <&platform_clk 0>;
> +        clock-names = "dcu", "pix";
> +        big-endian;
> +        fsl,tcon = <&tcon>;
> +
> +        port {
> +            endpoint {
> +                remote-endpoint = <&panel_out>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e0716554203..02504134e1f5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7894,7 +7894,7 @@ M:	Alison Wang <alison.wang@nxp.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
> +F:	Documentation/devicetree/bindings/display/fsl,ls1021a-dcu.yaml
>  F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
>  F:	drivers/gpu/drm/fsl-dcu/
