Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD0431F59
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 16:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362AB6E05F;
	Mon, 18 Oct 2021 14:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCA56E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:19:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r10so41659524wra.12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rO3u8W1re/ntjdP9B4sW4LejsVx7mXqMR7pW2tEhW4Q=;
 b=O1+Nn4hkoQfSRaziBOLEs2H+RirbluSCSD2tQr2FERY9FAdMZDgS4CIeefn/xx37rH
 IAO7Knk0l1HaAtY6Ao88to0IiCogKf3A7qSuF9m6WAs3AOLOfp6VBcEpsFjgIolVmWlo
 IF3if4zl55WYSoLr+JIK1zCHCSaJKFgnWKgbzV7RNp5zvBKAKdJ18ErF0Ro/f64fPWBb
 4H0CTJOn9w0dkOq9zN/9iMra26JvcTahNTop4fNcPzhu3pYg5v/RAMzxx63E4z8hz1Af
 iXxBddPkSiPkh6BvUsQVcV8D4Zx1xCFgfsP39ah0399lXTwni8cKxn/jDFVvMGN+FFkn
 JQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rO3u8W1re/ntjdP9B4sW4LejsVx7mXqMR7pW2tEhW4Q=;
 b=Y1Lm8nehNjuqA17QUCl62gsHXKjETkf9dSZlwNv3qBXNLZOf92lO13VK3WV7ZbUd7Z
 W1i7cpsg/wGrZXACJ4prtpZd2kvttyVMnR4g5VuvSIF84UuD0oDeBUmFLgFzBOJYLZs0
 CAK7+tplrJ9EPyCqQ7/JEc7W9i7HebE5o2TOuO0ZenqH7ocSbvkzj+pqDysBiLFCmeiI
 Eu+VMq7aQgdSgzJgR8WZ2+KqUwNyNyTzATJu74dwStR5l5cPdEy8xVybMSsL1NSEH50R
 R4CKL5bgoqijM6thW9ZtXX/dU6p+Az+Nghr/MuWwOF4UhlM9OT6RgSi+IOvM2R48uXXJ
 T2TQ==
X-Gm-Message-State: AOAM5330UgLe+SRtmCkeU7IP2W7Kpvf0BrpFA7UyR05xhvLDXIlbt/WI
 EZgomXyA6rq4SIE40e7fwB52vA==
X-Google-Smtp-Source: ABdhPJx6QFnBuYrXhffPsvdEadj2vqw25nodwUVxgLLLJThHk6Zdq74Bt+K0UKskiB3M9DghQfMYMA==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr36415532wrn.215.1634566750156; 
 Mon, 18 Oct 2021 07:19:10 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id a2sm12835406wru.82.2021.10.18.07.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:19:09 -0700 (PDT)
Date: Mon, 18 Oct 2021 16:19:08 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <20211018141908.fuevv2m66fw3xg36@blmsp>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
 <YWTaJOXGgF2bHznv@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YWTaJOXGgF2bHznv@robh.at.kernel.org>
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

Hi Rob,

On Mon, Oct 11, 2021 at 07:43:16PM -0500, Rob Herring wrote:
> On Mon, Oct 11, 2021 at 11:46:19AM +0200, Markus Schneider-Pargmann wrote:
> > This controller is present on several mediatek hardware. Currently
> > mt8195 and mt8395 have this controller without a functional difference,
> > so only one compatible field is added.
> > 
> > The controller can have two forms, as a normal display port and as an
> > embedded display port.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > new file mode 100644
> > index 000000000000..f7a35962c23b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Display Port Controller
> > +
> > +maintainers:
> > +  - CK Hu <ck.hu@mediatek.com>
> > +  - Jitao shi <jitao.shi@mediatek.com>
> > +
> > +description: |
> > +  Device tree bindings for the Mediatek (embedded) Display Port controller
> > +  present on some Mediatek SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8195-edp_tx
> > +      - mediatek,mt8195-dp_tx
> 
> Are these blocks different?

Good point, the registers of these blocks are described in its own
chapter each. Also I do need to distinguish between both in the driver.
Would you suggest making this distinction differently or keep it as two
compatibles?

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: faxi clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: faxi
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input endpoint of the controller, usually dp_intf
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output endpoint of the controller
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/mt8195-power.h>
> > +    dp_tx: edp_tx@1c500000 {
> > +        compatible = "mediatek,mt8195-edp_tx";
> > +        reg = <0 0x1c500000 0 0x8000>;
> > +        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
> > +        pinctrl-names = "default";
> > +        pinctrl-0 = <&edp_pin>;
> > +        status = "okay";
> 
> Don't show status in examples.

Fixed.

Thank you Rob.

Best,
Markus

> 
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                edp_in: endpoint {
> > +                    remote-endpoint = <&dp_intf0_out>;
> > +                };
> > +            };
> > +            port@1 {
> > +                reg = <1>;
> > +                edp_out: endpoint {
> > +                	remote-endpoint = <&panel_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.33.0
> > 
> > 
