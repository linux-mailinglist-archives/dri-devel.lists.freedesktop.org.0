Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33FCA93696
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 13:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB9F10EB91;
	Fri, 18 Apr 2025 11:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=agner.ch header.i=@agner.ch header.b="dX8qWiKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1BE10EB92
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:33:28 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 561C85C7BA3;
 Fri, 18 Apr 2025 13:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1744975558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krcPW3xQmI9oeveLweMBHhaeN0TqPUgvWS0+byQMh20=;
 b=dX8qWiKgbtmrdAvh3d+dfLRQ/O3Zc4GB1g6GUNuSfDMJ9z4qQIgHSPQNvCYLCwswJmM7aW
 OM5CXSJ2ZE5FZ3i9L7ZVuC3/+WNUGVlMFP2AIgGp5sZJ+PLAQ0Had5Uq87+v8WwIh1aTao
 afuXiHkMZE/XFehz8bXiXiWKV1fbuz8=
MIME-Version: 1.0
Date: Fri, 18 Apr 2025 13:25:57 +0200
From: Stefan Agner <stefan@agner.ch>
To: Frank Li <Frank.Li@nxp.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl,tcon.txt to
 yaml format
In-Reply-To: <20250417151134.3569837-1-Frank.Li@nxp.com>
References: <20250417151134.3569837-1-Frank.Li@nxp.com>
Message-ID: <31079c1f420febe688a84a292786d646@agner.ch>
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

On 2025-04-17 17:11, Frank Li wrote:
> Convert fsl,tcon.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  .../devicetree/bindings/display/fsl,tcon.txt  | 17 --------
>  .../bindings/display/fsl,vf610-tcon.yaml      | 43 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 44 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/fsl,tcon.txt
>  create mode 100644 Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,tcon.txt b/Documentation/devicetree/bindings/display/fsl,tcon.txt
> deleted file mode 100644
> index 475008747801e..0000000000000
> --- a/Documentation/devicetree/bindings/display/fsl,tcon.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Device Tree bindings for Freescale TCON Driver
> -
> -Required properties:
> -- compatible:		Should be one of
> -	* "fsl,vf610-tcon".
> -
> -- reg:			Address and length of the register set for tcon.
> -- clocks:		From common clock binding: handle to tcon ipg clock.
> -- clock-names:		From common clock binding: Shall be "ipg".
> -
> -Examples:
> -timing-controller@4003d000 {
> -	compatible = "fsl,vf610-tcon";
> -	reg = <0x4003d000 0x1000>;
> -	clocks = <&clks VF610_CLK_TCON0>;
> -	clock-names = "ipg";
> -};
> diff --git a/Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml b/Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
> new file mode 100644
> index 0000000000000..06bd680524a56
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/fsl,vf610-tcon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale TCON
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,vf610-tcon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ipg
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
> +    #include <dt-bindings/clock/vf610-clock.h>
> +
> +    timing-controller@4003d000 {
> +        compatible = "fsl,vf610-tcon";
> +        reg = <0x4003d000 0x1000>;
> +        clocks = <&clks VF610_CLK_TCON0>;
> +        clock-names = "ipg";
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e0716554203..a1e4c9a6038cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7895,7 +7895,7 @@ L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
> -F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
> +F:	Documentation/devicetree/bindings/display/fsl,vf610-tcon.yaml
>  F:	drivers/gpu/drm/fsl-dcu/
>  
>  DRM DRIVERS FOR FREESCALE IMX 5/6
