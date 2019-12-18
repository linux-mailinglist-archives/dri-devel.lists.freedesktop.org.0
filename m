Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF790125315
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 21:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E586EA71;
	Wed, 18 Dec 2019 20:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32B06EA71
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 20:20:21 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k14so3981123otn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 12:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5ftNpWYyKl69z1Op+T0ZEjpd3DQ5nYjH7jvgxCSreFA=;
 b=o3MMgG8GADwNTeDE90bNxGVqN2RHrPGTzVQUXPzOsXnF7JxJ+PCR+dJxqq1S3qS9Yj
 Uxs+egyWkfQ46pTx1TwskTlAgy3b0xzezmTYUJOKeoVDz4XtroBzyJLU9x/wn5WUW4M9
 InU0ahjocgLtpAWEEo2EdZgl+q0oDSmYiQd7O/6DMLHy07QbMeDJ0CBa8C8/vkC6Fzr3
 4OPzOh+W1jq+6kdKsfTU/BKp3tM7gB8tvGlv2hJt9/jrLnZgTgG3osj8GBnXTyJ5+OqQ
 eTeU5LRhnq2PYyH/HZRuTyyi039m7Dux5p3kwAZeQxC/9x7hEcLoPQ3LjRUAgDntrHA5
 InOA==
X-Gm-Message-State: APjAAAWSRLsn5xgWhfNH2dW7MswoXskbvQq8uaqjo/OXHbj/e6FjjRlR
 Gjp69sa3Nlimve4LetWv+A==
X-Google-Smtp-Source: APXvYqxEKkkc4eUcU32G8cCC0HDWRY1ZBkEZlpsBb0kXZRCZgzaryBbWtD6Knj0ZDfA2aholr6kBuQ==
X-Received: by 2002:a9d:7501:: with SMTP id r1mr1785228otk.196.1576700421108; 
 Wed, 18 Dec 2019 12:20:21 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r25sm1196527otk.2.2019.12.18.12.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 12:20:19 -0800 (PST)
Date: Wed, 18 Dec 2019 14:20:18 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20191218202018.GA7282@bogus>
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1576590361-28244-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576590361-28244-6-git-send-email-fabrizio.castro@bp.renesas.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Magnus Damm <magnus.damm@gmail.com>,
 ebiharaml@si-linux.co.jp, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 01:46:00PM +0000, Fabrizio Castro wrote:
> Add binding for the idk-2121wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> v5->v6:
> * No change
> 
> v4->v5:
> * No change
> 
> v3->v4:
> * Absorbed patch "dt-bindings: display: Add bindings for LVDS
>   bus-timings"
> * Big restructuring after Rob's and Laurent's comments
> 
> v2->v3:
> * New patch
> ---
>  .../display/panel/advantech,idk-2121wr.yaml        | 128 +++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> new file mode 100644
> index 0000000..24cd38b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/advantech,idk-2121wr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Advantech IDK-2121WR 21.5" Full-HD dual-LVDS panel
> +
> +maintainers:
> +  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |
> +  The IDK-2121WR from Advantech is a Full-HD dual-LVDS panel.
> +  A dual-LVDS interface is a dual-link connection with even pixels traveling
> +  on one link, and with odd pixels traveling on the other link.
> +
> +  The panel expects odd pixels on the first port, and even pixels on the
> +  second port, therefore the ports must be marked accordingly (with either
> +  dual-lvds-odd-pixels or dual-lvds-even-pixels).
> +

Needs to reference lvds.yaml here.

> +properties:
> +  compatible:
> +    items:
> +      - const: advantech,idk-2121wr
> +      - {} # panel-lvds, but not listed here to avoid false select
> +
> +  width-mm:
> +    const: 476
> +
> +  height-mm:
> +    const: 268
> +
> +  data-mapping:
> +    const: vesa-24
> +
> +  ports:
> +    type: object
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0

No need for these 2. Can assume they are defined in common binding.

> +
> +      port@0:
> +        type: object
> +        description: The sink for odd pixels.
> +        properties:
> +          reg:
> +            const: 0
> +
> +          dual-lvds-odd-pixels: true
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
> +
> +        required:
> +          - reg
> +          - dual-lvds-even-pixels


port@0 and port@1 both required?

> +
> +  panel-timing: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - width-mm
> +  - height-mm
> +  - data-mapping
> +  - panel-timing
> +  - ports

No need to repeat what's required by lvds.yaml.

> +
> +examples:
> +  - |+
> +    panel-lvds {
> +      compatible = "advantech,idk-2121wr", "panel-lvds";
> +
> +      width-mm = <476>;
> +      height-mm = <268>;
> +
> +      data-mapping = "vesa-24";
> +
> +      panel-timing {
> +        clock-frequency = <148500000>;
> +        hactive = <1920>;
> +        vactive = <1080>;
> +        hsync-len = <44>;
> +        hfront-porch = <88>;
> +        hback-porch = <148>;
> +        vfront-porch = <4>;
> +        vback-porch = <36>;
> +        vsync-len = <5>;
> +      };
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          dual-lvds-odd-pixels;
> +          panel_in0: endpoint {
> +            remote-endpoint = <&lvds0_out>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          dual-lvds-even-pixels;
> +          panel_in1: endpoint {
> +            remote-endpoint = <&lvds1_out>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
