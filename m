Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F618C475
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 02:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A034F6E0F8;
	Fri, 20 Mar 2020 01:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6936E0F8;
 Fri, 20 Mar 2020 01:01:32 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id q9so4373650iod.4;
 Thu, 19 Mar 2020 18:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ot6m4hY0BwqCmo0YvvIottBecwmdUoxIdqh0iIdJLaE=;
 b=Kw4c5tQUHzcd/e1ybN654QCz1VfoF9hneaQkj8iLFKRFZeSFK2HZHmvKmLJhKN89NB
 qNGP+eoq/fvcdMCYCi8EptCp26MuR0UxUYFHmA7hFVD+MolZZrE9qjoFEfk9URQnoHMN
 sqtKiXpxNBUNHZ2fWjO2hmuFlLQzQgX7vR/La9W4s+Sprgjwsj1wEDYlz+2TBiKBm96I
 3zgIFkbLrYEq7ylhAiM7eGPq5s6r/2XeC4o09stUk9lNwfzsKakemMaACujoO0NfVL8w
 aALvHhynRqO1we16KjCQz8U+T4dkYsMTQmz2AqxkoruHzpOadrEclBn9yVCeX/RishDY
 qW4Q==
X-Gm-Message-State: ANhLgQ3HzYX7byLwPZ30USlo1n+jQADFFl0BScqENLKVBD/LFL16MlP/
 ZsVa6Ll1ZNLEd0A/EX93AQ==
X-Google-Smtp-Source: ADFU+vveriY9yvP9Jzlx6UROYD7yZzJxkqX2tb0ZEVFvDtSMM5LsoOiJpdoQMBneWm4Sh8Le1oz4Cg==
X-Received: by 2002:a5e:9b09:: with SMTP id j9mr5198775iok.114.1584666091207; 
 Thu, 19 Mar 2020 18:01:31 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id s18sm1290993ioc.0.2020.03.19.18.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 18:01:30 -0700 (PDT)
Received: (nullmailer pid 17809 invoked by uid 1000);
 Fri, 20 Mar 2020 01:01:27 -0000
Date: Thu, 19 Mar 2020 19:01:27 -0600
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200320010127.GA8379@bogus>
References: <20200316041647.27953-1-harigovi@codeaurora.org>
 <20200316041647.27953-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316041647.27953-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 09:46:46AM +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
> Changes in v4:
> 	- Updating license identifier.
> 	- Moving yaml file inside panel directory.
> 	- Removing pinctrl entries.
> 	- Adding documentation for reset-gpios.
> Changes in v5:
> 	- No changes. Updated 2/2 Patch.
> Changes in v6:
> 	- Removing patternProperties.
> 	- Added " |" after description.
> 	- Setting port and reset-gpios to true.
> 	- Removing @ae94000 for dsi node.
> Changes in v7:
> 	- Added reg property.
> 
>  .../display/panel/visionox,rm69299.yaml       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100644
> index 000000000000..6ea1a7be3787
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Visionox model RM69299 Panels Device Tree Bindings.
> +
> +maintainers:
> + - Harigovindan P <harigovi@codeaurora.org>
> +
> +description: |
> + This binding is for display panels using a Visionox RM692999 panel.
> +
> +allOf:
> + - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: visionox,rm69299-1080p-display
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdda supply voltage.
> +
> +  vdd3p3-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdd3p3 supply voltage.
> +
> +  ports:
> +    type: object
> +    description: |
> +      A node containing DSI input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +      properties:
> +        port: true

Need:

       additionalProperties: false


> +
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        reg = <0x0ae94000 0x400>;

Either drop 'reg' or add a unit-address.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "visionox,rm69299-1080p-display";
> +            reg = <0x0ae94000 0x400>;

Wrong address.

> +
> +            vdda-supply = <&src_pp1800_l8c>;
> +            vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +            reset-gpios = <&pm6150l_gpio 3 0>;
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {

This will fail with the above change.

> +                            reg = <0>;
> +                            panel0_in: endpoint {
> +                                remote-endpoint = <&dsi0_out>;
> +                            };
> +                    };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
