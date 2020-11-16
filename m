Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084252B50F4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 20:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0935A6EA2E;
	Mon, 16 Nov 2020 19:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516556EA2E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 19:23:47 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t16so19925873oie.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 11:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YHp22h0sVh8aF3zAeJ2CnzjjIElJ5AdSSWhtA5Wjy5w=;
 b=R4qDFjoPEiMsw+wgdUeuZbNRunsdly3pFix958yJX5BKov5Os0slsIF8m7A8Ao1EWi
 amAgRVDJsoImmg0Og34W8cXldERB0piEJhE+OitIGZfiDR8zAAP6uv8BJWc1HU5As5wX
 1GHqhce/1J3XiT6x85NTcd/cVG8WwAIM43Emp9VDr9yS288luoEmjBQ6KSQi2pNgkvOm
 73HhOnYp3Cm7RI3N1sfdXnEwi3PicNCsDgb14HpMc244e4dZtmw0jY9LewzLI7F9RDFh
 BhbaA7wrfsykyWEuZFiI8FV4eNlB+mNvAK8U9iT8YysEMtTOuc63nxRnOM6M2zTqGH+1
 L1Nw==
X-Gm-Message-State: AOAM531ORbNlWqSnjgWePG1HdszZ36Re+HXaKx3HEH0QCjBLgazC0A1X
 5X7MHgW56p3MGMMGo0hdfg==
X-Google-Smtp-Source: ABdhPJzFCZdH0TcC7gxkghxyOwwj30pxT2y5PWpUPrPv74uo7FaLf9G8rZRnE+MWX1TFD3LMRU98LQ==
X-Received: by 2002:aca:418b:: with SMTP id o133mr171767oia.18.1605554626560; 
 Mon, 16 Nov 2020 11:23:46 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c18sm4054429oob.45.2020.11.16.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 11:23:45 -0800 (PST)
Received: (nullmailer pid 1990886 invoked by uid 1000);
 Mon, 16 Nov 2020 19:23:45 -0000
Date: Mon, 16 Nov 2020 13:23:45 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
Message-ID: <20201116192345.GA1985442@bogus>
References: <1605161831-10740-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605161831-10740-1-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 02:17:11PM +0800, Liu Ying wrote:
> To complement panel-simple.yaml, create panel-simple-lvds-dual-ports.yaml.
> panel-simple-lvds-dual-ports.yaml is for all simple LVDS panels that
> have dual LVDS ports and require only a single power-supply.
> The first port receives odd pixels, and the second port receives even pixels.
> Optionally, a backlight and an enable GPIO can be specified as properties.
> 
> Panels with swapped pixel order, if any, need dedicated bindings.
> 
> Migrate 'auo,g133han01', 'auo,g185han01', 'auo,g190ean01',
> 'koe,tx26d202vm0bwa' and 'nlt,nl192108ac18-02d' over to the new file.
> 
> The objectives with one file for all the simple LVDS panels with dual ports are:
> - Make it simpler to add bindings for this kind of LVDS panels
> - Keep the number of bindings file lower
> - Keep the binding documentation for this kind of LVDS panels more consistent
> - Make it possible for drivers to get pixel order via
>   drm_of_lvds_get_dual_link_pixel_order(), as the optional 'ports' property is
>   allowed
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Do not allow 'port' property. (Rob)
> * Define port number. (Rob)
> * Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels' properties. (Rob)
> 
> v1->v2:
> * Correct pixel order in example LVDS panel node.
> 
>  .../panel/panel-simple-lvds-dual-ports.yaml        | 126 +++++++++++++++++++++
>  .../bindings/display/panel/panel-simple.yaml       |  10 --
>  2 files changed, 126 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> new file mode 100644
> index 00000000..d30ae82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple LVDS panels with one power supply and dual LVDS ports
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the LVDS panels that
> +  has dual LVDS ports and requires only a single power-supply.
> +  The first port receives odd pixels, and the second port receives even pixels.
> +  There are optionally a backlight and an enable GPIO.
> +  The panel may use an OF graph binding for the association to the display,
> +  or it may be a direct child node of the display.
> +
> +  If the panel is more advanced a dedicated binding file is required.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +    # compatible must be listed in alphabetical order, ordered by compatible.
> +    # The description in the comment is mandatory for each compatible.
> +
> +        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
> +      - auo,g133han01
> +        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
> +      - auo,g185han01
> +        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> +      - auo,g190ean01
> +        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
> +      - koe,tx26d202vm0bwa
> +        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> +      - nlt,nl192108ac18-02d
> +
> +  ports:
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: The sink for odd pixels.
> +        properties:
> +          reg:
> +            const: 0
> +
> +          dual-lvds-odd-pixels: true

Needs a type and description.

> +
> +        required:
> +          - reg
> +          - dual-lvds-odd-pixels
> +
> +      port@1:
> +        type: object
> +        description: The sink for even pixels.
> +        properties:
> +          reg:
> +            const: 1
> +
> +          dual-lvds-even-pixels: true

Needs a type and description.

> +
> +        required:
> +          - reg
> +          - dual-lvds-even-pixels
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +  backlight: true
> +  enable-gpios: true
> +  power-supply: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply
> +
> +examples:
> +  - |
> +    panel: panel-lvds {
> +      compatible = "koe,tx26d202vm0bwa";
> +      power-supply = <&vdd_lcd_reg>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          dual-lvds-odd-pixels;
> +          reg = <0>;
> +
> +          panel_lvds0_in: endpoint {
> +            remote-endpoint = <&lvds0_out>;
> +          };
> +        };
> +
> +        port@1 {
> +          dual-lvds-even-pixels;
> +          reg = <1>;
> +
> +          panel_lvds1_in: endpoint {
> +            remote-endpoint = <&lvds1_out>;
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index f9750b0..62618e4 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -57,14 +57,8 @@ properties:
>        - auo,g104sn02
>          # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
>        - auo,g121ean01
> -        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
> -      - auo,g133han01
>          # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
>        - auo,g156xtn01
> -        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
> -      - auo,g185han01
> -        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> -      - auo,g190ean01
>          # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
>        - auo,p320hvn03
>          # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
> @@ -167,8 +161,6 @@ properties:
>        - kingdisplay,kd116n21-30nv-a010
>          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
>        - koe,tx14d24vm1bpa
> -        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
> -      - koe,tx26d202vm0bwa
>          # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
>        - koe,tx31d200vm0baa
>          # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> @@ -205,8 +197,6 @@ properties:
>        - neweast,wjfh116008a
>          # Newhaven Display International 480 x 272 TFT LCD panel
>        - newhaven,nhd-4.3-480272ef-atxl
> -        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> -      - nlt,nl192108ac18-02d
>          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
>        - nvd,9128
>          # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
