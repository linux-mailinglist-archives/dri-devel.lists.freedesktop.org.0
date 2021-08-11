Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A11C3E97F3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 20:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D23A6E1A3;
	Wed, 11 Aug 2021 18:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FCD6E1A3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 18:52:00 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id t3so3867832plg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 11:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+NqNQJXFf5VMDea9SqmxIiAq1Aqxjz2mlCFVqeoTl0=;
 b=oMvp1HpefuupopvGopPeUKqD0gZ5vPHMoEA4/9uU+wrzPTE00yWYu89LCGj/SgpiGZ
 VR5EyaC3wY0AQ4EXPSDxhNks+Yd9WOO5RIqMTeS3JZUjyhuchXqy3WJsWH2rnWgsdrya
 LkGNwZ9fpGkMr+R7vU6gMMlhDOC/vR6JT1L1nqbBL78Xyt3bt3Zw/zkQYs02uZexavnD
 OS83n0rS7q/5TKqZh5enIHYSwS6b2k/hjjg2PIOvMEChKy15q3hRy/DQ1TZ0RHn2XryE
 T7XVs/1p+K+8KxH8qKcwQe5nm2dXR9cG0w9vjYjAMtvYHYhqpbUQ2uNvs4tG1mOwMdhr
 eCuQ==
X-Gm-Message-State: AOAM532SnynkqjPizmMSlaOlmCZPUK6aXa8UDQmELrxsBino0Z/80ZEF
 JRKaJKaf//Qjx8E9Z0S2Ng==
X-Google-Smtp-Source: ABdhPJw2EUF+rrg+K5zpy3SmJDclmp5BOOvJMKX5mwcfU9Q7hj+SPfmwbPaHXNTErwiV+X8SsIfbsw==
X-Received: by 2002:a17:90a:6c45:: with SMTP id
 x63mr11869591pjj.0.1628707919654; 
 Wed, 11 Aug 2021 11:51:59 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id g4sm197697pgs.42.2021.08.11.11.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 11:51:59 -0700 (PDT)
Received: (nullmailer pid 86823 invoked by uid 1000);
 Wed, 11 Aug 2021 18:51:56 -0000
Date: Wed, 11 Aug 2021 12:51:56 -0600
From: Rob Herring <robh@kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Truly NT35521 panel
 support
Message-ID: <YRQcTLK1ffM1TEbX@robh.at.kernel.org>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804081352.30595-2-shawn.guo@linaro.org>
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

On Wed, Aug 04, 2021 at 04:13:51PM +0800, Shawn Guo wrote:
> The Truly NT35521 is a 5.24" 1280x720 DSI panel, and the backlight is
> managed through DSI link.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../bindings/display/panel/truly,nt35521.yaml | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml b/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> new file mode 100644
> index 000000000000..4727c3df6eb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/truly,nt35521.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Truly NT35521 5.24" 1280x720 MIPI-DSI Panel
> +
> +maintainers:
> +  - Shawn Guo <shawn.guo@linaro.org>
> +
> +description: |
> +  The Truly NT35521 is a 5.24" 1280x720 MIPI-DSI panel.  The panel backlight
> +  is managed through DSI link.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: truly,nt35521
> +
> +  reg: true
> +
> +  reset-gpios: true
> +
> +  enable-gpios: true
> +
> +  pwr-positive5-gpios:
> +    maxItems: 1
> +
> +  pwr-negative5-gpios:
> +    maxItems: 1

Are these +/-5V supplies? If so, they should be modeled with 
gpio-regulator perhaps unless the panel connection could only ever be 
GPIOs.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - enable-gpios
> +  - pwr-positive5-gpios
> +  - pwr-negative5-gpios
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
> +            compatible = "truly,nt35521";
> +            reg = <0>;
> +            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
> +            pwr-positive5-gpios = <&msmgpio 114 GPIO_ACTIVE_HIGH>;
> +            pwr-negative5-gpios = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
> +            enable-gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +...
> -- 
> 2.17.1
> 
> 
