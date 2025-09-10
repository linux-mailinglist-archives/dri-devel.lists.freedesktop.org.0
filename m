Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D24B51A0F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BB410E937;
	Wed, 10 Sep 2025 14:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dN0wJOtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E407410E937
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 14:48:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B08A044351;
 Wed, 10 Sep 2025 14:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607FFC4CEF7;
 Wed, 10 Sep 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757515719;
 bh=YlY//Pvz8+fMkbtb+RnIB4jbU50kH014LcVifhtNo2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dN0wJOtDOVFSWz3OD3pu1qROLgPzvE1lQ4NFgkhOwW0BXocTJajpVUlj37ka45TOI
 d5JGpAxX43CCT1KuHn9YxPJNbmVfqR2tmf6WKjLdgLvQqauln+6jNDmw+oN3Rj28e1
 oC6UyhzMdvt3/Sd9xH7P8SZtPxXUcyM/w5wFd/kh+V6Ez/eE9nr6rXkmQWZZXZdll9
 ggegkxc6PqC4hwI5vVRm1xlhqGOclA/5VPzHdkxUcit1CG6PFldqWKUHtzjZWiPpv0
 l6JnNmy8/PvX4Nur68jo7PO1HmPm2QY7R/CSYK2V4/X8Gh8JJl+t7358fFaiWk6qhE
 DF9hdiu/FZyHg==
Date: Wed, 10 Sep 2025 09:48:38 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: document Sharp
 LQ079L1SX01 panel
Message-ID: <20250910144838.GA4169578-robh@kernel.org>
References: <20250909073831.91881-1-clamor95@gmail.com>
 <20250909073831.91881-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909073831.91881-2-clamor95@gmail.com>
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

On Tue, Sep 09, 2025 at 10:38:30AM +0300, Svyatoslav Ryhel wrote:
> Document Sharp LQ079L1SX01 panel found in Xiaomi Mi Pad.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/sharp,lq079l1sx01.yaml      | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
> new file mode 100644
> index 000000000000..1dbb4a4bb772
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sharp,lq079l1sx01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp Microelectronics 7.9" WQXGA TFT LCD panel
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:

Needs '>' modifier to maintain paragraph formatting.

> +  This panel requires a dual-channel DSI host to operate and it supports
> +  only left-right split mode, where each channel drives the left or right
> +  half of the screen and only video mode.
> +
> +  Each of the DSI channels controls a separate DSI peripheral.
> +  The peripheral driven by the first link (DSI-LINK1), left one, is
> +  considered the primary peripheral and controls the device.
> +
> +allOf:
> +  - $ref: panel-common-dual.yaml#
> +
> +properties:
> +  compatible:
> +    const: sharp,lq079l1sx01
> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: regulator that supplies the analog voltage
> +
> +  vddio-supply:
> +    description: regulator that supplies the I/O voltage
> +
> +  vsp-supply:
> +    description: positive boost supply regulator
> +
> +  vsn-supply:
> +    description: negative boost supply regulator
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  backlight: true
> +  ports: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - vddio-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi0 {

dsi {

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "sharp,lq079l1sx01";
> +            reg = <0>;
> +
> +            reset-gpios = <&gpio 59 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&avdd_lcd>;
> +            vddio-supply = <&vdd_lcd_io>;
> +            vsp-supply = <&vsp_5v5_lcd>;
> +            vsn-supply = <&vsn_5v5_lcd>;
> +
> +            backlight = <&backlight>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    panel_in0: endpoint {
> +                        remote-endpoint = <&dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    panel_in1: endpoint {
> +                        remote-endpoint = <&dsi1_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.48.1
> 
