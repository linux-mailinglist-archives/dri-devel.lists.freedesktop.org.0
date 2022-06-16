Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4255F54EC88
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 23:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE55910ECBC;
	Thu, 16 Jun 2022 21:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFB110ECB8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:28:16 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id v7so1791880ilo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p2fPALb1JPQ4AHcfCxgMf5Jxk8npv4hWtBM7JpKyakw=;
 b=NVRSXHB+uDoFs7hV87/R5UDhXKEIA2JFiGLcsVq9zLNYHdkNJysS0TamWp04e0eyh7
 5UWR3jxrFQ1Cxs+MAB5MY4cBx9Na8D15Cz6qQoo0W8RXA0CJnyT0cm409BWWMVJ/qyVI
 9wtpXMcjXdoQtAvN4msPX7JGQtQiWbbxH7uspsACwTXPmbI4GrAJSVVTl6QefFNQUM2d
 EI6LD/9AmRgUwXd96McHWv+oJXm9dI6kPI6InUOlw8IiufYLQH3ICSZUykNJmx2JBFTh
 g79Ahb1WJNA6T+ocBSdYZsZZcxAKve8pmVEF1PFWeTW+X4qFw7gGQTJfrOQX2X7qcTHi
 6swQ==
X-Gm-Message-State: AJIora/t+GGPsrBah34pAMsjwn+YM0MvE6nEdzucFh6bTwMwSCJ8kGzp
 C/O0bgUoRlqyEhzI/M5eyg==
X-Google-Smtp-Source: AGRyM1vXz8zr1qepnCDtLqZTRG9xKb9gNBJydHo8HDS0dVqWruV80818zrXGU2iTTEoR7y/TLi/J4w==
X-Received: by 2002:a05:6e02:1bc8:b0:2d4:342:9c68 with SMTP id
 x8-20020a056e021bc800b002d403429c68mr4075981ilv.254.1655414896016; 
 Thu, 16 Jun 2022 14:28:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a02a688000000b003314f874ac8sm1357939jam.36.2022.06.16.14.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 14:28:15 -0700 (PDT)
Received: (nullmailer pid 4024739 invoked by uid 1000);
 Thu, 16 Jun 2022 21:28:13 -0000
Date: Thu, 16 Jun 2022 15:28:13 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220616212813.GA3991754-robh@kernel.org>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-2-rex-bc.chen@mediatek.com>
 <20220614202336.GA2400714-robh@kernel.org>
 <aeebb6879d62865f8baf037e541c568eb9310f23.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeebb6879d62865f8baf037e541c568eb9310f23.camel@mediatek.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 deller@gmx.de, Project_Global_Chrome_Upstream_Group@mediatek.com,
 wenst@chromium.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, msp@baylibre.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, granquet@baylibre.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 09:22:16PM +0800, Rex-BC Chen wrote:
> On Tue, 2022-06-14 at 14:23 -0600, Rob Herring wrote:
> > On Fri, Jun 10, 2022 at 06:55:13PM +0800, Bo-Chen Chen wrote:
> > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > 
> > > This controller is present on several mediatek hardware. Currently
> > > mt8195 and mt8395 have this controller without a functional
> > > difference,
> > > so only one compatible field is added.
> > > 
> > > The controller can have two forms, as a normal display port and as
> > > an
> > > embedded display port.
> > > 
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > [Bo-Chen: Fix reviewers' comment]
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >  .../display/mediatek/mediatek,dp.yaml         | 101
> > > ++++++++++++++++++
> > >  1 file changed, 101 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > > ml
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > > ml
> > > new file mode 100644
> > > index 000000000000..10f50a0dcf49
> > > --- /dev/null
> > > +++
> > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya
> > > ml
> > > @@ -0,0 +1,101 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml*__;Iw!!CTRNKA9wMg0ARbw!yqAl1KhfbHqHN7-5aeqhzqeOVhPU_Z5beko5q-y-s5pcfp1WL5oVGvY5UF4EfWm4PWjc5mjBwyBUMsr_RI45ipbhsw$
> > >  
> > > +$schema: 
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!yqAl1KhfbHqHN7-5aeqhzqeOVhPU_Z5beko5q-y-s5pcfp1WL5oVGvY5UF4EfWm4PWjc5mjBwyBUMsr_RI5WzYKENQ$
> > >  
> > > +
> > > +title: MediaTek Display Port Controller
> > > +
> > > +maintainers:
> > > +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > +  - Jitao shi <jitao.shi@mediatek.com>
> > > +
> > > +description: |
> > > +  Device tree bindings for the MediaTek display port and
> > > +  embedded display port controller present on some MediaTek SoCs.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8195-dp-tx
> > > +      - mediatek,mt8195-edp-tx
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  nvmem-cells:
> > > +    maxItems: 1
> > > +    description: efuse data for display port calibration
> > > +
> > > +  nvmem-cell-names:
> > > +    const: dp_calibration_data
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Input endpoint of the controller, usually
> > > dp_intf
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Output endpoint of the controller
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +  max-lanes:
> > > +    maxItems: 1
> > > +    description: maximum number of lanes supported by the
> > > hardware.
> > 
> > We already have a 'data-lanes' property defined in 
> > 'video-interfaces.yaml' that can serve this purpose.
> > 
> 
> Hello Rob,
> 
> Thanks for review.
> From the description of video-interfaces.yaml, I think it's not quite
> match what we need. We only need this value be one of "1,2,4".

data-lanes = <0>;
data-lanes = <0 1>;
data-lanes = <0 1 2 3>;

Limiting the number of lanes to something less than the max is exactly 
how this property is used in addition to being able to show the mapping 
of lanes.

Rob
