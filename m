Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55B18D58B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 18:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E496E0CE;
	Fri, 20 Mar 2020 17:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8586E0CE;
 Fri, 20 Mar 2020 17:17:09 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id m9so6270419ilq.12;
 Fri, 20 Mar 2020 10:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9OK3///UPiMOnkmWOFd8fgSlK68ma0DB6jw3LiUD5r8=;
 b=E6KuG3uKQxOr8/TAAxUjeV7Y4SekJb5A/hE+kp0XmXWQ40HoBj/xOJJPpqvxIpMy5G
 Rc0LKBqp3pPOpqf9iMSUVFJXIygzTOPlR4dvq3CgetiliSXfqOWY1NEDDG+HhE5jVRZN
 ItijOlKsA2ywclRenTIkmiu6PJcwNwweYbUkPtY5nGzGoZGc+AzHZVp4BfTjtg3Xg9bK
 f5KWm968AomfKRJqsoG2+9Pv4jL1lSdB2kW1lX2YwPWU+W3wigvK0hL5mFAOTL8iak7I
 MjGI1nkSRmAjkMeLU5BsHI/mmIYZ7sV5Jr6eUEagT4vxjR3nxn8VAsUm0dX5yhYB6Z6u
 cbwQ==
X-Gm-Message-State: ANhLgQ0fcBJlrQd8eON9GZNxLoB5CVcRKV4EpfJs2fDHeSapp2hg9dlm
 PWAAa7mw9DafITP/t43W2g==
X-Google-Smtp-Source: ADFU+vvZUodp/Fin0OQjreZzAxRNuiORq055kbbShVYM1dF8DDhPkidm1KJGDzgmqULC2WS38SU3/A==
X-Received: by 2002:a92:608:: with SMTP id x8mr8994332ilg.120.1584724628885;
 Fri, 20 Mar 2020 10:17:08 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id r9sm1933289ioa.44.2020.03.20.10.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 10:17:08 -0700 (PDT)
Received: (nullmailer pid 15045 invoked by uid 1000);
 Fri, 20 Mar 2020 17:17:06 -0000
Date: Fri, 20 Mar 2020 11:17:06 -0600
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200320171706.GA15934@bogus>
References: <20200320054409.32509-1-harigovi@codeaurora.org>
 <20200320054409.32509-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320054409.32509-2-harigovi@codeaurora.org>
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

On Fri, Mar 20, 2020 at 11:14:08AM +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
>     - Removed unwanted properties from description.
>     - Creating source files without execute permissions(Rob Herring).
> Changes in v3:
>     - Changing txt file into yaml
> Changes in v4:
>     - Updating license identifier.
>     - Moving yaml file inside panel directory.
>     - Removing pinctrl entries.
>     - Adding documentation for reset-gpios.
> Changes in v5:
>     - No changes. Updated 2/2 Patch.
> Changes in v6:
>     - Removing patternProperties.
>     - Added " |" after description.
>     - Setting port and reset-gpios to true.
>     - Removing @ae94000 for dsi node.
> Changes in v7:
>     - Added reg property.
> Changes in v8:
>     - Rearranged additionalProperties.

Still not right...

>     - Dropping improper reg property.
> 
>  .../display/panel/visionox,rm69299.yaml       | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100644
> index 000000000000..5fd277602a66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,73 @@
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

This is not taking effect because it's just description. You need to 
indent 2 fewer spaces.

'port' is not equal to 'port@0' which the example has. So fix the 
example.

And you need to add 'additionalProperties: false' here at the same level 
as 'properties'.

> +
> +  reset-gpios: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - reset-gpios
> +
> +examples:
> +  - |
> +    panel {
> +        compatible = "visionox,rm69299-1080p-display";
> +
> +        vdda-supply = <&src_pp1800_l8c>;
> +        vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +        reset-gpios = <&pm6150l_gpio 3 0>;
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                panel0_in: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
