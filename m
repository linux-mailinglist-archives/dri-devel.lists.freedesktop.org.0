Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8FB56D78
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 02:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7C910E264;
	Mon, 15 Sep 2025 00:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rvlOtZTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF9910E264
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:39:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9EAB244541;
 Mon, 15 Sep 2025 00:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFDBC4CEF0;
 Mon, 15 Sep 2025 00:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757896764;
 bh=vDxmUu7YJlQgVbF88x8fTIcNgzFy6exjw8d6QlvDjNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rvlOtZTuBn0PODzXNM327Z8d8TnEu0ZpwbDWDh3SZGa/WHvx0pU5yuSw9K8eEFirt
 ODmnsYgjsbFcbUFCUz3bupVb4Af0On5PirAd7LIvrFjmojuDHMAXt8KSlsfEjhLqEM
 VMlEGN3d48PpuyGiySUbvz6sj9QQx/h3Aca3AbbgPlh1ct7d70h8TVaVRvYUnJcU/s
 sdCxuhwrxk7LCSkY7evmGtv0HLoGdNtVM2cHN3NTI/h0Z6lsR/togxYouk6fxRyPfS
 vHOR5urm4fKSdZoSzYtA/I0hewozcqRfwFKNwhkAY3vU+h7vkaTMHr1Uc4gTiOWJvd
 PPUA53yDQ8RyQ==
Date: Sun, 14 Sep 2025 19:39:23 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Amir Dahan <system64fumo@protonmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Add devicetree
 documentation for lg,sw49410
Message-ID: <20250915003923.GA2318579-robh@kernel.org>
References: <20250910-judyln-panel-v1-0-825c74403bbb@postmarketos.org>
 <20250910-judyln-panel-v1-2-825c74403bbb@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-judyln-panel-v1-2-825c74403bbb@postmarketos.org>
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

On Wed, Sep 10, 2025 at 08:08:21PM -0700, Paul Sajna wrote:
> Document how to use lg,sw49410 in a devicetree
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  .../bindings/display/panel/lg,sw49410.yaml         | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)

Looks like you can just add the compatible to panel-simple.yaml. All the 
properties here are valid for it. And whether you use the simple driver 
or not doesn't matter.

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw49410.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw49410.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7e0db98687d9cfc4da7137e8781752e1401d5ed7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lg,sw49410.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lg,sw49410.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LG SW49410 MIPI-DSI panels
> +
> +maintainers:
> +  - Paul Sajna <hello@paulsajna.com>
> +
> +description:
> +  LG SW49410 6.1" 1440x3120  panel found in LG G7 ThinQ smartphone.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: lg,sw49410
> +
> +  reg:
> +    maxItems: 1
> +
> +  backlight:
> +    description: Backlight device reference
> +
> +  reset-gpios:
> +    description: Reset pin reference
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        display_panel: panel@0 {
> +            reg = <0>;
> +            compatible = "lg,sw49410";
> +
> +            backlight = <&pmi8998_wled>;
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +            pinctrl-names = "default", "sleep";
> +            pinctrl-0 = <&sde_dsi_active &sde_te_active>;
> +            pinctrl-1 = <&sde_dsi_sleep &sde_te_sleep>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&mdss_dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.51.0
> 
