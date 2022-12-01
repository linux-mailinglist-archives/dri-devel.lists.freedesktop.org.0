Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7863FBCB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A5F10E021;
	Thu,  1 Dec 2022 23:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E0A10E021
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 23:16:38 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id v13so3701775oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 15:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNRL/xeucB6+OrmUshP7jeXkdDiSosMVb1WPEhPiXKc=;
 b=3nTila/xhpsRM3nkwXK0SrougLAja7o2EoLNCPLxthQiMH7QvbqE7/xXQZHHhqMlRe
 POMLnZ6aU0ctb8fWC0LO9CXo6Z+XUS47xz5J+RZSuc1DMCV6KwducclQ3V/MM/niJ5WI
 h8vrhDQrjYmyfu5wXxkHMXndj72bqM/X/jzImn8x0HgJ0MCUasdqVqN2A2RVmZTznb35
 sBWaeItsTiKTQGfdY66CCAbYmfwmz2h4wv8vIRtf4WHzHDFFth6pDhXhY9xynHBfDGfW
 sheuHRfMt7kMtGpnTLa1IWDPn2cBn0/jFOg8+7B4QwnRg5Vx98gY/BahegbH0sAayClf
 9QdQ==
X-Gm-Message-State: ANoB5plKTUNyxcVq2oRKvbejVyYiVWnseYkDmOdHwtOA0AFEpESBVBaM
 c0DtZKxKYDyNrJPQHATxmA==
X-Google-Smtp-Source: AA0mqf6muhWWfnkoFwIXqCBePQ/MBBdAE6jdhns/DS7Zug2GZHo7VgeRSyRh9WVHfv7OuXgP60TIFQ==
X-Received: by 2002:a05:6808:648:b0:35a:1139:37fb with SMTP id
 z8-20020a056808064800b0035a113937fbmr25391098oih.158.1669936597744; 
 Thu, 01 Dec 2022 15:16:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a7-20020a9d4707000000b0066e7e4b2f76sm430735otf.17.2022.12.01.15.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 15:16:37 -0800 (PST)
Received: (nullmailer pid 1663520 invoked by uid 1000);
 Thu, 01 Dec 2022 23:16:36 -0000
Date: Thu, 1 Dec 2022 17:16:36 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 02/21] dt-bindings: display: tegra: vi: add 'vip'
 property and example
Message-ID: <20221201231636.GA1660613-robh@kernel.org>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-3-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128152336.133953-3-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 04:23:17PM +0100, Luca Ceresoli wrote:
> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
> input module. Add it to the allowed properties and augment the existing
> nvidia,tegra20-vi example to show a 'vip' property.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
> - rename "i2c3" -> "ic2"
> - add review tag
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> index 782a4b10150a..5b5583c2b562 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> @@ -74,6 +74,22 @@ properties:
>    avdd-dsi-csi-supply:
>      description: DSI/CSI power supply. Must supply 1.2 V.
>  
> +  vip:
> +    $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input from the VIP (parallel input capture) module
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/properties/endpoint

You can drop 'endpoint'. You only need port nodes if there's no extra 
properties in the endpoints.

> +
>  patternProperties:
>    "^csi@[0-9a-f]+$":
>      type: object
> @@ -109,6 +125,22 @@ examples:
>      #include <dt-bindings/clock/tegra20-car.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        camera@48 {
> +            compatible = "aptina,mt9v111";
> +            reg = <0x48>;
> +            clocks = <&camera_clk>;
> +
> +            port {
> +                mt9v111_out: endpoint {
> +                    remote-endpoint = <&vi_vip_in>;
> +                };
> +            };
> +        };
> +    };
> +
>      vi@54080000 {
>          compatible = "nvidia,tegra20-vi";
>          reg = <0x54080000 0x00040000>;
> @@ -116,6 +148,42 @@ examples:
>          clocks = <&tegra_car TEGRA20_CLK_VI>;
>          resets = <&tegra_car 100>;
>          reset-names = "vi";
> +
> +        vip {
> +            compatible = "nvidia,tegra20-vip";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            channel@0 {
> +                reg = <0>;
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                        reg = <0>;
> +                        vi_vip_in: endpoint {
> +                            remote-endpoint = <&mt9v111_out>;
> +                        };
> +                    };
> +                    port@1 {
> +                        reg = <1>;
> +                        vi_vip_out: endpoint {
> +                            remote-endpoint = <&vi_in>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                vi_in: endpoint {
> +                    remote-endpoint = <&vi_vip_out>;
> +                };
> +            };
> +        };
>      };
>  
>    - |
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92c762f85f17..0c97ce22735d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20320,6 +20320,7 @@ M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-tegra@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
>  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
>  
>  TEGRA XUSB PADCTL DRIVER
> -- 
> 2.34.1
> 
> 
