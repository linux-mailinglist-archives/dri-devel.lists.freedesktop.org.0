Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE641AE8777
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 17:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D39110E232;
	Wed, 25 Jun 2025 15:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SkTnQF1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5990510E232
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 15:08:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C3C505C551C;
 Wed, 25 Jun 2025 15:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1312C4CEEA;
 Wed, 25 Jun 2025 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750864085;
 bh=JmhAkoif1otrp384soDK37/o6hqYnuIKtKUb9uvXqk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SkTnQF1kyikqilYsD7Cczd6oJ8b1ODVaVkobfCt2Vx/C1mGrS3OEP/0IPQEIY024y
 klkF+vtj6vKHtgnKajEtGt8/uTXf0OLUA5RwfIvl24T1XdGW9bxiLGfgcrK6yaehC5
 rSu6aPzzOLMUc+hVINWtEmCPCo8Uo8QcpPQWRIz675T2H4/2GSSfTlO8+8WHiczNlP
 mXGyBWv+D2H8Vnj5PSx+4p0q6brFUrCqyY9MoDTaAfLRJx8drbwr3g24Gum3FgOJbN
 b3Xpjv/JucxgDLzwqJH7eoG5upgbyI3UfXrGH75udDUmJo9IwBQ3pYmGKyjQ9IjfWK
 3Ocx9DbtPgFwQ==
Date: Wed, 25 Jun 2025 10:08:04 -0500
From: Rob Herring <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document Synaptics
 TDDI panel driver
Message-ID: <20250625150804.GA1201460-robh@kernel.org>
References: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
 <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-panel-synaptics-tddi-v2-1-7a62ab1d13c7@disroot.org>
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

On Wed, Jun 25, 2025 at 03:38:44PM +0530, Kaustabh Chakraborty wrote:
> Document the driver for Synaptics TDDI (Touch/Display Integration) panels.

We document the h/w, not 'the driver'.

> Along with the MIPI-DSI panel, these devices also have an in-built LED
> backlight device and a touchscreen, all packed together in a single chip.
> Also, add compatibles for supported panels - TD4101 and TD4300.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/panel/synaptics,td4300-panel.yaml      | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..10ac24afdfbc43ca6913bf8a343413eed81f12ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,td4300-panel.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/synaptics,td4300-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics TDDI Display Panel Controller
> +
> +maintainers:
> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - syna,td4101-panel
> +      - syna,td4300-panel

Can a TD4101 be anything other than a panel (controller)? If not, then 
'-panel' is redundant.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vio-supply:
> +    description: core I/O voltage supply
> +
> +  vsn-supply:
> +    description: negative voltage supply for analog circuits
> +
> +  vsp-supply:
> +    description: positive voltage supply for analog circuits
> +
> +  backlight-gpios:
> +    maxItems: 1
> +    description: backlight enable GPIO
> +
> +  reset-gpios: true
> +  width-mm: true
> +  height-mm: true
> +  panel-timing: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "synaptics,td4300-panel";
> +            reg = <0>;
> +
> +            vio-supply = <&panel_vio_reg>;
> +            vsn-supply = <&panel_vsn_reg>;
> +            vsp-supply = <&panel_vsp_reg>;
> +
> +            backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&gpd3 4 GPIO_ACTIVE_LOW>;
> +
> +            width-mm = <68>;
> +            height-mm = <121>;
> +
> +            panel-timing {
> +                clock-frequency = <144389520>;
> +
> +                hactive = <1080>;
> +                hsync-len = <4>;
> +                hfront-porch = <120>;
> +                hback-porch = <32>;
> +
> +                vactive = <1920>;
> +                vsync-len = <2>;
> +                vfront-porch = <21>;
> +                vback-porch = <4>;
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.49.0
> 
