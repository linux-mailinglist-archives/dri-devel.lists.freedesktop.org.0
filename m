Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1761C99A644
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 16:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A018A10EAF2;
	Fri, 11 Oct 2024 14:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MraT0TRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F2B10EAF2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 14:27:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E722FA405BC;
 Fri, 11 Oct 2024 14:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD10C4CEC3;
 Fri, 11 Oct 2024 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728656831;
 bh=pUd9AMdtvemQ98FlMluaPmqLuijLZiDm9z3uByCDb8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MraT0TRZ+85TeEd3wb1RuFlN9IT8vBcK35E9VxW0iq+VprEF69kk2WTAJdNReynhg
 EVfh+0M96X/fDjxXlTYIsAN4O2du+oecC3eyBzbb/oS33oRzJ/Cc7a/L9VqDlMXknV
 RYqFe5D+8NmRqi9Uh5vDJ3pnRZjiszoElr/df1sgiZ732MT1kwjIPnTejYfs9NlKui
 4RIfSGPlE7t3is56gdSGe04ruAVmnyFUT954EdFCBIEdS/Xpe9/pqCmy8/3eyffCSL
 0PX0Aj9QN/8hKXPWTVhsaY7YG8TLyKz4Jyqxk4aOaVySvX/Tp9xiV7IN/5Zm4+g19d
 uWHmyqW6x+uIw==
Date: Fri, 11 Oct 2024 09:27:09 -0500
From: Rob Herring <robh@kernel.org>
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Samsung
 S6E88A0-AMS427AP24 bindings
Message-ID: <20241011142709.GA2289410-robh@kernel.org>
References: <cover.1728582727.git.jahau@rocketmail.com>
 <3d754a2ee538d4c99ab71340706297d54b767c35.1728582727.git.jahau@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d754a2ee538d4c99ab71340706297d54b767c35.1728582727.git.jahau@rocketmail.com>
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

On Thu, Oct 10, 2024 at 08:31:48PM +0200, Jakob Hauser wrote:
> Add bindings for Samsung AMS427AP24 panel with S6E88A0 controller.
> 
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
> Patch is based on https://gitlab.freedesktop.org/drm/misc/kernel.git
> current branch drm-misc-next.
> ---
>  .../panel/samsung,s6e88a0-ams427ap24.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
> new file mode 100644
> index 000000000000..7010d3bbd07f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e88a0-ams427ap24.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung AMS427AP24 panel with S6E88A0 controller
> +
> +maintainers:
> +  - Jakob Hauser <jahau@rocketmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e88a0-ams427ap24
> +
> +  reg:
> +    maxItems: 1
> +
> +  port: true
> +  reset-gpios: true
> +
> +  vdd3-supply:
> +    description: core voltage supply
> +
> +  vci-supply:
> +    description: voltage supply for analog circuits
> +
> +  flip-horizontal:
> +    description: boolean to flip image horizontally
> +    type: boolean

This is already used in another panel. Please move it to 
panel-common.yaml.

> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +  - reset-gpios
> +  - vdd3-supply
> +  - vci-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            panel@0 {
> +                    compatible = "samsung,s6e88a0-ams427ap24";
> +                    reg = <0>;
> +
> +                    vdd3-supply = <&pm8916_l17>;
> +                    vci-supply = <&pm8916_l6>;
> +                    reset-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
> +                    flip-horizontal;
> +
> +                    port {
> +                            panel_in: endpoint {
> +                                    remote-endpoint = <&mdss_dsi0_out>;
> +                            };
> +                    };
> +            };
> +    };
> -- 
> 2.39.5
> 
