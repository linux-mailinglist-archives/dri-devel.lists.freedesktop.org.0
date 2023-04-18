Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757886E6E80
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 23:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F335D10E03A;
	Tue, 18 Apr 2023 21:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6040B10E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 21:45:10 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-6a60460a23dso501452a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 14:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681854309; x=1684446309;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKpSiwDvkIJ4Ee0IkVP1leE3m81/FJq1JLmHBimQnb0=;
 b=Ym2VPgsjPLCxW79yDn2EMxEFg5JopFyGEZxkfSyjAPWBTu0oC2Ac9PFu9BvNLkchRk
 tcCgzDob09dDISYGPk9zepzi6XDakyCiqXsJ4AISrSsiOG+pzrO+LbgbybJtOlYDpLU1
 zCvT/4f78nHPIFWrVIs2XgUdGYzR0VPbdh5GGXesh8bY3jv05ullFKTgO8iZYZQU53pZ
 VJWOqPn+wS5iOVxhNGO+fwYtIbUbxkFMLykHYyC3Zyn0FrRXiV2IX2hV65QIzXn8FGOv
 Zj5m1rAVmxbKY3vggbWkzKMACtOnavVA5zp4qHuF4OFFVqqOjM67RngvaZ0iPnzGLNDJ
 MWBg==
X-Gm-Message-State: AAQBX9dfsmvaEIYR/4D7dDAbdQkyr0XpjNDBkCOD0LC4TmcOEK2nVbLR
 UzibOVrB4PSWwfUNMIeWjw==
X-Google-Smtp-Source: AKy350YOCKZIn8qwH+HZXgrE3U7IfJnx4tOh/Ek/I9oSrTeZ/BLeqYlOwRESU5x2BXf1lvF6X1eWUA==
X-Received: by 2002:a05:6871:8a1:b0:177:b208:af7c with SMTP id
 r33-20020a05687108a100b00177b208af7cmr1978130oaq.54.1681854309097; 
 Tue, 18 Apr 2023 14:45:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r4-20020a056870414400b0017ae909afe8sm6086325oad.34.2023.04.18.14.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:45:08 -0700 (PDT)
Received: (nullmailer pid 2383368 invoked by uid 1000);
 Tue, 18 Apr 2023 21:45:07 -0000
Date: Tue, 18 Apr 2023 16:45:07 -0500
From: Rob Herring <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: panel: Add Samsung S6D7AA0 LCD
 controller bindings
Message-ID: <20230418214507.GA2380126-robh@kernel.org>
References: <20230416100139.13741-1-aweber.kernel@gmail.com>
 <20230416100139.13741-2-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416100139.13741-2-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 16, 2023 at 12:01:37PM +0200, Artur Weber wrote:
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  .../display/panel/samsung,s6d7aa0.yaml        | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> new file mode 100644
> index 000000000000..969cef7738b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6D7AA0 MIPI-DSI LCD panel controller
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6d7aa0-lsl080al02
> +
> +  reg: true
> +  reset-gpios: true
> +  backlight: true
> +
> +  enable-supply:
> +    description: Enable supply

If there's only a single supply, then why not use panel-simple-dsi.yaml?

> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - enable-supply
> +  - backlight
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
> +            compatible = "samsung,s6d7aa0-lsl080al02";
> +            reg = <0>;
> +            enable-supply = <&lcd_enable_supply>;
> +            reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
> +            backlight = <&backlight>;
> +        };
> +    };
> +
> +...
> -- 
> 2.40.0
> 
