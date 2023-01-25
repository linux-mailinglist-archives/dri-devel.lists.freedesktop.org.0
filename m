Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC867BE32
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D4B10E8B8;
	Wed, 25 Jan 2023 21:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8698710E8BE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 21:24:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 788B06E0;
 Wed, 25 Jan 2023 22:24:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674681875;
 bh=CGjkttHwfRgsm0kmNSWXGmUO2uiFOubL40Z4ufN3diE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DYNfZB90LBlzqeqpYUKkw/t7qika5Xh8hsfjNpvedPyon8jAJqxXvGrcGW62dh0kN
 EdP0ryaw1oDv/Wj2LqhWqfos2sPzSq+jGOdde9XWLv0h8OIVxGhXxRyovNUl9GOJHQ
 LXvQhWGU3LepUX5xLSLKHY1OOLqc9K7QAR9oVp4U=
Date: Wed, 25 Jan 2023 23:24:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonathan Cormier <jcormier@criticallink.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tfp410: Add tfp410 i2c
 example
Message-ID: <Y9GeD/vXZ1RJ1MLZ@pendragon.ideasonboard.com>
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
 <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Williamson <michael.williamson@criticallink.com>,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thank you for the patch.

On Wed, Jan 25, 2023 at 04:09:09PM -0500, Jonathan Cormier wrote:
> Add a i2c example with HDMI connector
> 
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>  .../bindings/display/bridge/ti,tfp410.yaml         | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> index 4c5dd8ec2951..456214f14b47 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> @@ -116,4 +116,46 @@ examples:
>          };
>      };
>  
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;

Please use 4 spaces for indentation, as in the other example.

> +
> +      hdmi_encoder: tfp410@38 {
> +        compatible = "ti,tfp410";
> +        reg = <0x38>;
> +
> +        ports {
> +          address-cells = <1>;
> +          size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            tfp410_in: endpoint {
> +              remote-endpoint = <&dpi1_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            tfp410_out: endpoint {
> +              remote-endpoint = <&hdmi_connector_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +    hdmi: hdmi_connector {
> +      compatible = "hdmi-connector";
> +      label = "hdmi";
> +      type = "a";
> +      ddc-i2c-bus = <&i2c1>;
> +      port {
> +        hdmi_connector_in: endpoint {
> +          remote-endpoint = <&tfp410_out>;
> +        };
> +      };
> +    };
> +

You can drop the hdmi connector, the example will still validate.

>  ...

-- 
Regards,

Laurent Pinchart
