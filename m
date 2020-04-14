Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E71A8957
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723956E50D;
	Tue, 14 Apr 2020 18:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060F46E50D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:25:52 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id e20so697788otl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dD0ZWW42NAG1gRumaqOnEXSg/sKXKfXPIbvoNmXY8HM=;
 b=UpiEtDWEryRQ+hhSbwC/KqnxL7xsG+TmVRxOJJZTRl35GAtR79fNaNOmrWMKqtBGwI
 14o8VyGxApU/6GQATyW4nry5aJqJ1sBY3It4V0FxUn9vLbhsJnZwBvYZH/fteJvCV0K3
 LRFmoRtKe0kSCDZ0KJu6jGAfXbPjXHJKlT7KlhoINRnIHcc5Ubvp6FodlmCNsQSHN2+d
 E1hvqilROp1PA70NmL+7tj8cuxhpidGlpkQ6qC1ngr4dQVjff6Fl2kjqSdbixy6Sp9iR
 YLRECoU+Pk7T1rUXku+A62hw20uTSNA8Vt/jRIlnhUCivUw60X4ab1A7TKTf1alT8c1e
 DRBw==
X-Gm-Message-State: AGi0PuaDLSpy5ExRHqFSobScyANQKqak1HJ7hwVBnCQkOr8TDgafitei
 gh+w6ay8D8rpr7lEO2yHjw==
X-Google-Smtp-Source: APiQypLTQ+JWMb4O8WO7JeWbNb15oh1VRbQbgkZtfsEiWTGIDqZ+ppH/wFL7hXDLjdW1jt2onHjj1g==
X-Received: by 2002:a9d:6413:: with SMTP id h19mr17984845otl.203.1586888751210; 
 Tue, 14 Apr 2020 11:25:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n184sm1183752oia.40.2020.04.14.11.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:25:50 -0700 (PDT)
Received: (nullmailer pid 16456 invoked by uid 1000);
 Tue, 14 Apr 2020 18:25:49 -0000
Date: Tue, 14 Apr 2020 13:25:49 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 06/36] dt-bindings: display: convert boe, himax8279d to
 DT Schema
Message-ID: <20200414182549.GA11086@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-7-sam@ravnborg.org>
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
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 09:50:39PM +0200, Sam Ravnborg wrote:
> v2:
>   - Fix entry in MAINTAINERS
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/boe,himax8279d.txt | 24 --------
>  .../display/panel/boe,himax8279d.yaml         | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 60 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
> deleted file mode 100644
> index 3caea2172b1b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Boe Himax8279d 1200x1920 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "boe,himax8279d8p" and one of: "boe,himax8279d10p"
> -- reg: DSI virtual channel of the peripheral
> -- enable-gpios: panel enable gpio
> -- pp33-gpios: a GPIO phandle for the 3.3v pin that provides the supply voltage
> -- pp18-gpios: a GPIO phandle for the 1.8v pin that provides the supply voltage
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	&mipi_dsi {
> -		panel {
> -			compatible = "boe,himax8279d8p", "boe,himax8279d10p";
> -			reg = <0>;
> -			backlight = <&backlight>;
> -			enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
> -			pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
> -			pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
> new file mode 100644
> index 000000000000..e42b6a8ae176
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/boe,himax8279d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Boe Himax8279d 1200x1920 TFT LCD panel
> +
> +maintainers:
> +  - Jerry Han <jerry.han.hq@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: boe,himax8279d8p
> +      - const: boe,himax8279d10p
> +
> +  backlight: true
> +  enable-gpios: true
> +  reg: true
> +
> +  pp33-gpios:
> +    maxItems: 1
> +    description: GPIO for the 3.3v pin that provides the supply voltage
> +
> +  pp18-gpios:
> +    maxItems: 1
> +    description: GPIO for the 1.8v pin that provides the supply voltage
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - pp33-gpios
> +  - pp18-gpios
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
> +        panel {

panel@0

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Double check the others. I won't repeat myself.

> +            compatible = "boe,himax8279d8p", "boe,himax8279d10p";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
> +            pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
> +            pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b99fa16ba08..dba84e7726b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5255,7 +5255,7 @@ DRM DRIVER FOR BOE HIMAX8279D PANELS
>  M:	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
>  S:	Maintained
>  F:	drivers/gpu/drm/panel/panel-boe-himax8279d.c
> -F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
> +F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
>  
>  DRM DRIVER FOR FARADAY TVE200 TV ENCODER
>  M:	Linus Walleij <linus.walleij@linaro.org>
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
