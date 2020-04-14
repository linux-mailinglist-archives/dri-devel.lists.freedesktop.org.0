Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D71A8A52
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB3789FC3;
	Tue, 14 Apr 2020 18:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5B89FC3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:57:27 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i22so724468otp.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S4V0K4DXloHPwiW2ZAuipSmnqt0O7XyONIjKHMDXTA8=;
 b=tTk0JPChO1Hr6wWMVoE2udoO4Ka956T0F6ssgjNvyOsW/KnUmU/g5o6eMNBS0fF5Ej
 9IY32idgnnVqeEC/bhYmTc6sMn7FHPUZZ7EXxb4pQl6lX+HN2SUltC0cgN5dQ+Zk6Mro
 v1iQDPSCUzglYSXhW7K/9kJlY7wfoDuaQ/Xljs9rLXQVyRVoJXkCvRehyvbNnSdo4OYH
 9ZT9ONACB+BiE6Mie2XY6gNMOP1oBemu5yZOEUwXr5y+j2PIdndbnNL0B398rhIUNwYJ
 YIHgllUavn3nwHMbMEt27JgFRPIu6OXJFcHuBTC3IVqYDKT8ABTVw+35BBZE9TcXMpkm
 HmtA==
X-Gm-Message-State: AGi0Pua2+yuOx4xQjy4rONaReq2Ej7KIKKTvRipLEDiRf0nh5Il3y4cJ
 ByHV0X11slIL154oxK5txw==
X-Google-Smtp-Source: APiQypKI77UPIxMD8w1IXEHDuJFuSTM92fqT4/xAc4vWPFbAk2SzZ33WE5qLXfrRfERU75j9SKay6w==
X-Received: by 2002:a9d:77d5:: with SMTP id w21mr8197777otl.5.1586890646394;
 Tue, 14 Apr 2020 11:57:26 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j3sm1210071otq.22.2020.04.14.11.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:57:25 -0700 (PDT)
Received: (nullmailer pid 13838 invoked by uid 1000);
 Tue, 14 Apr 2020 18:57:24 -0000
Date: Tue, 14 Apr 2020 13:57:24 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 30/36] dt-bindings: display: convert sharp, lq101r1sx01
 to DT Schema
Message-ID: <20200414185724.GA9292@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-31-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-31-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 09:51:03PM +0200, Sam Ravnborg wrote:
> This binding describes a panel with a secondary channel.
> 
> v2:
>   - add check for required properties if link2 is present (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sharp,lq101r1sx01.txt       | 49 -----------
>  .../display/panel/sharp,lq101r1sx01.yaml      | 85 +++++++++++++++++++
>  2 files changed, 85 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
> deleted file mode 100644
> index f522bb8e47e1..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -Sharp Microelectronics 10.1" WQXGA TFT LCD panel
> -
> -This panel requires a dual-channel DSI host to operate. It supports two modes:
> -- left-right: each channel drives the left or right half of the screen
> -- even-odd: each channel drives the even or odd lines of the screen
> -
> -Each of the DSI channels controls a separate DSI peripheral. The peripheral
> -driven by the first link (DSI-LINK1), left or even, is considered the primary
> -peripheral and controls the device. The 'link2' property contains a phandle
> -to the peripheral driven by the second link (DSI-LINK2, right or odd).
> -
> -Note that in video mode the DSI-LINK1 interface always provides the left/even
> -pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
> -is possible to program either link to drive the left/even or right/odd pixels
> -but for the sake of consistency this binding assumes that the same assignment
> -is chosen as for video mode.
> -
> -Required properties:
> -- compatible: should be "sharp,lq101r1sx01"
> -- reg: DSI virtual channel of the peripheral
> -
> -Required properties (for DSI-LINK1 only):
> -- link2: phandle to the DSI peripheral on the secondary link. Note that the
> -  presence of this property marks the containing node as DSI-LINK1.
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -Optional properties (for DSI-LINK1 only):
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	dsi@54300000 {
> -		panel: panel@0 {
> -			compatible = "sharp,lq101r1sx01";
> -			reg = <0>;
> -
> -			link2 = <&secondary>;
> -
> -			power-supply = <...>;
> -			backlight = <...>;
> -		};
> -	};
> -
> -	dsi@54400000 {
> -		secondary: panel@0 {
> -			compatible = "sharp,lq101r1sx01";
> -			reg = <0>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> new file mode 100644
> index 000000000000..956608cada77
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sharp,lq101r1sx01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp Microelectronics 10.1" WQXGA TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <treding@nvidia.com>
> +
> +description: |
> +  This panel requires a dual-channel DSI host to operate. It supports two modes:
> +  - left-right: each channel drives the left or right half of the screen
> +  - even-odd: each channel drives the even or odd lines of the screen
> +
> +  Each of the DSI channels controls a separate DSI peripheral. The peripheral
> +  driven by the first link (DSI-LINK1), left or even, is considered the primary
> +  peripheral and controls the device. The 'link2' property contains a phandle
> +  to the peripheral driven by the second link (DSI-LINK2, right or odd).
> +
> +  Note that in video mode the DSI-LINK1 interface always provides the left/even
> +  pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
> +  is possible to program either link to drive the left/even or right/odd pixels
> +  but for the sake of consistency this binding assumes that the same assignment
> +  is chosen as for video mode.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sharp,lq101r1sx01
> +
> +  reg: true
> +  power-supply: true
> +  backlight: true
> +
> +  link2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the DSI peripheral on the secondary link. Note that the
> +      presence of this property marks the containing node as DSI-LINK1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +if:
> +  required:
> +    - link2
> +then:
> +  required:
> +    - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi0 {

Probably should put a reg property and unit-address here so the 
dsi-controller schema will match on these.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel: panel@0 {
> +            compatible = "sharp,lq101r1sx01";
> +            reg = <0>;
> +
> +            link2 = <&secondary>;
> +
> +            power-supply = <&power>;
> +            backlight = <&backlight>;
> +        };
> +    };
> +
> +    dsi1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        secondary: panel@0 {
> +            compatible = "sharp,lq101r1sx01";
> +            reg = <0>;
> +        };
> +    };
> +
> +...
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
