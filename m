Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56653AD00
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 20:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BBB10F47A;
	Wed,  1 Jun 2022 18:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAC110F47A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 18:47:13 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so3867830fac.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 11:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BpEiiB8zVcuCrCk2bsjNqQCXUo6W+A/7ZvIlEFJ0600=;
 b=4RkS1Yyf3vg3CaPbvQ7pdWDgjND7aXSs9aT+nsvCwt9+VPbc0JaeaT6EmFC4pn5hi7
 lnwD/OuJQaYkj1vYQmLO8L1J2QbnE2mWBFAlvV9PVncSBookC2+RulwP2DTnyI7JLCjP
 kbo0I7GNkeIO4d9bQ21PFKAyQUtas0fOd66nKm0izZeF2+GjbDbWtzOlxS2peSjKj5Hx
 8QiBfOs3NF54AtF3Z25NomQ7d+2batK16OKTB0l79/yB4IuVJyMKYkk0tnB4TlXEVAxw
 W43c9UHOxvGhJ/a4ofvk8N2tO68mnYlpNhFhqfivy8fF2ppHph7KZQ1E8i3fChpXrdQz
 a0hg==
X-Gm-Message-State: AOAM5307Rd0ToaA0i4dmLP7cDVbPrWipB9LEIFj9XMU0yqiOWBhX/ArH
 En/2htUGaHfM6a4G64omFA==
X-Google-Smtp-Source: ABdhPJyX5bZMQUJDsNtFITnapRJKekczXfA75TW+eMztGj93S5/Ele4MFys9QeG0ABJjDOQVNxdf9g==
X-Received: by 2002:a05:6870:599:b0:f1:67f6:5860 with SMTP id
 m25-20020a056870059900b000f167f65860mr17570575oap.114.1654109232930; 
 Wed, 01 Jun 2022 11:47:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j6-20020a056830270600b0060603221264sm1073444otu.52.2022.06.01.11.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:47:12 -0700 (PDT)
Received: (nullmailer pid 205923 invoked by uid 1000);
 Wed, 01 Jun 2022 18:47:11 -0000
Date: Wed, 1 Jun 2022 13:47:11 -0500
From: Rob Herring <robh@kernel.org>
To: Max Fierke <max@maxfierke.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: Add bindings for ClockworkPi
 CWD686
Message-ID: <20220601184711.GA201654-robh@kernel.org>
References: <20220601051748.1305450-1-max@maxfierke.com>
 <20220601051748.1305450-3-max@maxfierke.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601051748.1305450-3-max@maxfierke.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 12:17:47AM -0500, Max Fierke wrote:
> The CWD686 is a 6.86" IPS LCD panel used as the primary
> display in the ClockworkPi DevTerm portable (all cores)
> 
> Signed-off-by: Max Fierke <max@maxfierke.com>
> ---
>  .../display/panel/clockworkpi,cwd686.yaml     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml

You probably can simply add this to panel-simple-dsi.yaml. It mainly 
depends on how many power supplies this panel has.

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml b/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml
> new file mode 100644
> index 000000000000..935a33b9305f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/clockworkpi,cwd686.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/clockworkpi,cwd686.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ClockworkPi CWD686 6.86" IPS LCD panel
> +
> +maintainers:
> +  - Max Fierke <max@maxfierke.com>
> +
> +description: |
> +  The ClockworkPi CWD686 is a 6.86" ICNL9707-based IPS LCD panel used within the
> +  ClockworkPi DevTerm series of portable devices. The panel has a 480x1280
> +  resolution and uses 24 bit RGB per pixel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: clockworkpi,cwd686
> +
> +  reg:
> +    description: DSI virtual channel used by that screen
> +    maxItems: 1
> +
> +  reset-gpios: true
> +  rotation: true
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +        compatible = "gpio-backlight";
> +        gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "clockworkpi,cwd686";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
> +            rotation = <90>;
> +        };
> +    };
> -- 
> 2.36.1
> 
> 
