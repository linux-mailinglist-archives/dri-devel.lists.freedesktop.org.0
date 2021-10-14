Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845342E27E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 22:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38226E1B5;
	Thu, 14 Oct 2021 20:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC386E1B5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 20:14:01 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id e63so9975404oif.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n01/kMhBv8uu3x49TKo7ZBWRbu8OqDI9V8qJAm3R2B8=;
 b=5uLYdGWyXFMHVwNcMUWi8hjVSwYxlab07Qt/bYNYEZisc+zP1KH1VGfCeuTb96a5dG
 QJJ17D+bgFdEWiSUxc5T7GxLymI7fKKepMSPRPThxyl/aLFYy09FB0byM9uWJSUv3e90
 9DPKEm65hpXwQGPG2bHexxYyt53fqkRdcHi8sGzd3QVKxIgBUfCr3zGrMToVhZzn9D1B
 tk8C7nPQUjPpTRRBt0ZiKtIbQQPxoX+usLGau46FrFolFMzsznYg1HWyY7DsevDAZyQ0
 NllY4uBbnlOSr9fSgit9f/i5ll6NOj9qzCr9b6I8uO5TSVyB4fbz4wCgYj2049K2tqyH
 oNZw==
X-Gm-Message-State: AOAM533XyBs/E5SMS9j2PQRuHl2Ls40zTFwYbY/be753iB3xkCvnRWwM
 WnF78/zifeoS0FyGU+u9Pg==
X-Google-Smtp-Source: ABdhPJylamsqgwOrb1R27CJzlReJ/tvs5wnqclVDFJam9KoT/CoZ/dpZdg/PEi9S05FbNJ38RN2slg==
X-Received: by 2002:a05:6808:1686:: with SMTP id
 bb6mr5614190oib.40.1634242440953; 
 Thu, 14 Oct 2021 13:14:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m23sm629041oom.34.2021.10.14.13.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 13:14:00 -0700 (PDT)
Received: (nullmailer pid 3845806 invoked by uid 1000);
 Thu, 14 Oct 2021 20:13:59 -0000
Date: Thu, 14 Oct 2021 15:13:59 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 tomi.valkeinen@ti.com, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/bridge: tc358764: Convert to YAML
 binding
Message-ID: <YWiPh5QjOXzq0ut4@robh.at.kernel.org>
References: <20211006135150.504897-1-angelogioacchino.delregno@collabora.com>
 <YWSakiB4OFqGzAiw@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWSakiB4OFqGzAiw@ravnborg.org>
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

On Mon, Oct 11, 2021 at 10:12:02PM +0200, Sam Ravnborg wrote:
> Hi AngeloGioacchino,
> 
> On Wed, Oct 06, 2021 at 03:51:50PM +0200, AngeloGioacchino Del Regno wrote:
> > Convert the Toshiba TC358764 txt documentation to YAML.
> > 
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Thanks for all these conversions to DT-schema.
> 
> It would be very good if the changelog could document the warnings they
> triggers when they are used to check the existing dts files.
> This is a good way to document that the warnings are expected.

Really what's missing is adding 'ports'.

I'm fine with just a note below '---' on the intent WRT dtbs_check. I 
assume the intent is to fix the one case which is fine given there is 
only 1. The graph parsing code doesn't care which way is done and we 
prefer having 'ports'.

> 
> While waiting for Rob to review, here is one small nit. See inline
> comment below.
> 
> My personal preference is to use 4 spaces for indent in the examples.
> But two is perfectly fine and there is today no rule for it.
> 
> When you are resending these, then it would be nice with a cover letter
> and all patches in one series. You can then use the cover letter both to
> tell on a higher level what was changed since v1 and to give a status on the
> conversion effort. I hope you have converted all bridge DT-schemas.
> 
> 	Sam
> 
> > ---
> >  .../display/bridge/toshiba,tc358764.txt       | 35 -------
> >  .../display/bridge/toshiba,tc358764.yaml      | 94 +++++++++++++++++++
> >  2 files changed, 94 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
> > deleted file mode 100644
> > index 8f9abf28a8fa..000000000000
> > --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -TC358764 MIPI-DSI to LVDS panel bridge
> > -
> > -Required properties:
> > -  - compatible: "toshiba,tc358764"
> > -  - reg: the virtual channel number of a DSI peripheral
> > -  - vddc-supply: core voltage supply, 1.2V
> > -  - vddio-supply: I/O voltage supply, 1.8V or 3.3V
> > -  - vddlvds-supply: LVDS1/2 voltage supply, 3.3V
> > -  - reset-gpios: a GPIO spec for the reset pin
> > -
> > -The device node can contain following 'port' child nodes,
> > -according to the OF graph bindings defined in [1]:
> > -  0: DSI Input, not required, if the bridge is DSI controlled
> > -  1: LVDS Output, mandatory
> > -
> > -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> > -
> > -Example:
> > -
> > -	bridge@0 {
> > -		reg = <0>;
> > -		compatible = "toshiba,tc358764";
> > -		vddc-supply = <&vcc_1v2_reg>;
> > -		vddio-supply = <&vcc_1v8_reg>;
> > -		vddlvds-supply = <&vcc_3v3_reg>;
> > -		reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -		port@1 {
> > -			reg = <1>;
> > -			lvds_ep: endpoint {
> > -				remote-endpoint = <&panel_ep>;
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
> > new file mode 100644
> > index 000000000000..267a870b6b0b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
> > @@ -0,0 +1,94 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358764.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toshiba TC358764 MIPI-DSI to LVDS bridge
> > +
> > +maintainers:
> > +  - Andrzej Hajda <a.hajda@samsung.com>
> > +
> > +description: |
> > +  The TC358764 is bridge device which converts MIPI DSI or MIPI DPI to DP/eDP.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - toshiba,tc358764
> > +
> > +  reg:
> > +    description: Virtual channel number of a DSI peripheral
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description: GPIO connected to the reset pin.
> > +    maxItems: 1
> > +
> > +  vddc-supply:
> > +    description: Core voltage supply, 1.2V
> > +
> > +  vddio-supply:
> > +    description: I/O voltage supply, 1.8V or 3.3V
> > +
> > +  vddlvds-supply:
> > +    description: LVDS1/2 voltage supply, 3.3V
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Video port for MIPI DSI input, if the bridge DSI controlled
> Fix: ..., if the bridge is DSI controlled
> 
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Video port for LVDS output (panel or connector).
> > +
> > +    required:
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vddc-supply
> > +  - vddio-supply
> > +  - vddlvds-supply
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c1 {

i2c {

> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      bridge@0 {
> > +        compatible = "toshiba,tc358764";
> > +        reg = <0>;
> > +        vddc-supply = <&vcc_1v2_reg>;
> > +        vddio-supply = <&vcc_1v8_reg>;
> > +        vddlvds-supply = <&vcc_3v3_reg>;
> > +        reset-gpios = <&gpd1 6 GPIO_ACTIVE_LOW>;
> > +
> > +        ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@1 {
> > +            reg = <1>;
> > +            lvds_ep: endpoint {
> > +              remote-endpoint = <&panel_ep>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> > +
> > +...
> > -- 
> > 2.33.0
> 
