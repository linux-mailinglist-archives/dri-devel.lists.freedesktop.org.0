Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D21316EB7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 19:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5B36ECC7;
	Wed, 10 Feb 2021 18:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA3E6ECC7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 18:33:09 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id d20so3099655oiw.10
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 10:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ExCRBdXsCjYNNlIpqbTBSerlJezoNKbz4ZxiZ2tP6tg=;
 b=Ai20kfwTHG601lj34o1y3MhvWwNpv5j9J4jB/18iLKtbtUIAqNWyN00Lli/f6Pv5+m
 mowByAPU9wVoWhJYIhtPBIuzzzY9Q1qSHBqqNtvIWSN9lO9Y6VnI30CpwLt8xG9az5K1
 vhyuFT9BMyDOkzbkESM8Uv3jAElH95aCPPjd/SBuFhwCMb0Qeycox/on/D5rGvAUd9PE
 nv5wQchPp7EuYXSiyvGtDtmQOqTfRfSqOc8we8TfKNhQiZuQO+9aGSyUkZDMvSS+eEy+
 ZT/kptYQbcX4Fhez3Wx1QKDylP5MhDmWwDADk9jYZzrrqiV3ftU6H6/wAixsLNb8G3Zg
 jJqA==
X-Gm-Message-State: AOAM533HpnttSbNZKzpDCIFKHAyzin38bkCo90ZB5Khza9MYgqAf8mdg
 c/CxhNvsuZlTk7XXhXqbAA==
X-Google-Smtp-Source: ABdhPJx1M6e9yvwkwtZLgqUaKfPz2KVz+Nh/oZ0X7p792CY2tibsXGUO4RZCZqk21NyHpoe4zD9F2A==
X-Received: by 2002:aca:d908:: with SMTP id q8mr184308oig.67.1612981988380;
 Wed, 10 Feb 2021 10:33:08 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u15sm590492oiu.28.2021.02.10.10.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 10:33:07 -0800 (PST)
Received: (nullmailer pid 2500804 invoked by uid 1000);
 Wed, 10 Feb 2021 18:33:06 -0000
Date: Wed, 10 Feb 2021 12:33:06 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v6] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
Message-ID: <20210210183306.GA2407269@robh.at.kernel.org>
References: <1612879992-5908-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612879992-5908-1-git-send-email-victor.liu@nxp.com>
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

On Tue, Feb 09, 2021 at 10:13:12PM +0800, Liu Ying wrote:
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
>   drm_of_lvds_get_dual_link_pixel_order(), as the 'ports' property is required
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
> v5->v6:
> * Use OF graph schema.
> * Drop Rob's R-b tag, as review is needed.
> 
> v4->v5:
> * Require the 'ports' property and update commit message accordingly. (Rob)
> * Add Rob's R-b tag.
> 
> v3->v4:
> * Add type and descriptions for dual-lvds-{odd,even}-pixels properties.
>   Also, update descriptions for port@0 and port@1 properties accordingly. (Rob)
> 
> v2->v3:
> * Do not allow 'port' property. (Rob)
> * Define port number. (Rob)
> * Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels' properties. (Rob)
> 
> v1->v2:
> * Correct pixel order in example LVDS panel node.
> 
>  .../panel/panel-simple-lvds-dual-ports.yaml        | 116 +++++++++++++++++++++
>  .../bindings/display/panel/panel-simple.yaml       |  10 --
>  2 files changed, 116 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> new file mode 100644
> index 00000000..274e89b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> @@ -0,0 +1,116 @@
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
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port

If you have any extra properties as you do, then you use 
'#/$defs/port-base'.

> +        description: The first sink port.
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +            description: The first sink port for odd pixels.
> +
> +        required:
> +          - dual-lvds-odd-pixels
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The second sink port.
> +
> +        properties:
> +          dual-lvds-even-pixels:
> +            type: boolean
> +            description: The second sink port for even pixels.
> +
> +        required:
> +          - dual-lvds-even-pixels
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  backlight: true
> +  enable-gpios: true
> +  power-supply: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - ports
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
> index 35b42ee..e7718d2 100644
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
> @@ -171,8 +165,6 @@ properties:
>        - kingdisplay,kd116n21-30nv-a010
>          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
>        - koe,tx14d24vm1bpa
> -        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
> -      - koe,tx26d202vm0bwa
>          # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS panel
>        - koe,tx31d200vm0baa
>          # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> @@ -209,8 +201,6 @@ properties:
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
