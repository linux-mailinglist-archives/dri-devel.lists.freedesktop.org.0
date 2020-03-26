Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4045F1946F2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 20:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5D66E911;
	Thu, 26 Mar 2020 19:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73A56E90F;
 Thu, 26 Mar 2020 19:02:55 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id y24so7232908ioa.8;
 Thu, 26 Mar 2020 12:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=913nXdxioKFyBXx/HO1CiaF3q6eac3NnTWagXaXe9gM=;
 b=QxVD2otBlXH39dEa8t/xho182EAy9209Nuc4JN9dpYvPCNO2/UeGmJWUxeGJSJ7p1K
 lDZl0sW/xvL1zOtJpn0BDxoPCEFidspJLO0+2KDtNXgP0CX2CV5ji8kcT+qm2FR7DWzD
 FGl/j6fj82tH6boUMYM0dI4C8Z+GVu5EIVB21RGfSBj24P+I8EFPF+lZQVXViGDlMmhh
 QUqABdVz3Yx2ql5whwAeJ3vj4G/Vv5LWiVMx7fGk/vzyuEpJk1oLt0eOkKwYj44C5L3c
 Y1TK1EXjLzhO0w3L7mJ5Nsz7jfClNIrJBhHzZ7MSKyxG0Qf1dVPZmtqHWQt3XtpZg1d2
 QTUA==
X-Gm-Message-State: ANhLgQ1uTVoXOWdaH8xujpr1QXBgv4TsNPCS/okqre0z9lk2V9QvIOF5
 vXkky6CESci+l9V53Of85A==
X-Google-Smtp-Source: ADFU+vtcHtx/pWLZ5r+4OrJlDvMhktQM3VWwN1mtU/cnSTzgT5KMfVdBgp6bEq0yg6SjHaY9I5/E8g==
X-Received: by 2002:a6b:e316:: with SMTP id u22mr9211014ioc.1.1585249374945;
 Thu, 26 Mar 2020 12:02:54 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id c88sm1079423ill.15.2020.03.26.12.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:02:54 -0700 (PDT)
Received: (nullmailer pid 15089 invoked by uid 1000);
 Thu, 26 Mar 2020 19:02:53 -0000
Date: Thu, 26 Mar 2020 13:02:53 -0600
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200326190253.GA5029@bogus>
References: <20200323050316.32108-1-harigovi@codeaurora.org>
 <20200323050316.32108-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323050316.32108-2-harigovi@codeaurora.org>
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

On Mon, Mar 23, 2020 at 10:33:15AM +0530, Harigovindan P wrote:
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
>     - Dropping improper reg property.
> Changes in v9:
>     - Adding additionalProperties at the same level as
>       'properties'
>     - Adding properties for "ports" which includes:
>       -> #address-cells
>       -> #size-cells
>       -> port@0
> 
>  .../display/panel/visionox,rm69299.yaml       | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml

Wrong file mode.

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100755
> index 000000000000..2dd4d9471fa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,82 @@
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
> +      A ports node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:

As I said before, fix the example. You don't need 'ports' nor a unit 
address as there is only 1 port.

All you need instead of 'ports' is 'port: true' because 
panel-common.yaml defines it.

And 'port' should be required.

> +        type: object
> +        description: |
> +          Input endpoints of the controller.
> +
> +  reset-gpios: true
> +
> +  additionalProperties: false

You are defining a property called 'additionalProperties'. Remove the 
indentation.

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
> +
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
