Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43655BC7C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 01:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F276110E34A;
	Mon, 27 Jun 2022 23:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9F910E34A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:29:22 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id y18so11259475iof.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9G9xzfoHgo3vygEsJjR4zL+mofIOaG7ELAHu9EXTEgk=;
 b=tY6uk1kJGgWPf3OTe+Q2jgMZR0KYjI8vqzuTuk3iuscochFcf5KT9nwXeHv+FxneZc
 9hMBw5X5XsCrBaUBkCucfGpgdo8RnvwoGaGsUbXWhMZ8r437oITfngn+iCLJ3nEWMRvq
 yEDtHUMq2SUzn27q40QgR2OMv3UnULYT5SXoayKm5TIZN1qZ7YP1LmxANs64CLUc5PEp
 6sTHyPrFvxU+HVNnARDehdYbecjjdFp+Xke1yPfzrmXb03iDFGv0TZddS9x1vTUPHl7+
 ZFsTMgCsFhPsaOZ0I8hxOOP9N0t6XZCOXzTgT/hepYnTyWWi/SiczBrkaAlJmg6iyxF9
 +TcA==
X-Gm-Message-State: AJIora9cloumTBECOEaynZrBDdbwZamos3qDOu6jwNbiHw+8kp5xz1oD
 Zy0mXQL72uBnnYmLMwBuhDkXndJ6KA==
X-Google-Smtp-Source: AGRyM1sVaI1eYRG04ScJ+CraadBpgnU6qQ4m5lVSPiS05KYADu+ifYinUFBXyTBFNfTqo7J/F/cw+w==
X-Received: by 2002:a05:6602:729:b0:675:243e:a859 with SMTP id
 g9-20020a056602072900b00675243ea859mr6337527iox.58.1656372562103; 
 Mon, 27 Jun 2022 16:29:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 i39-20020a023b67000000b00339e90e57e6sm5279502jaf.104.2022.06.27.16.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 16:29:21 -0700 (PDT)
Received: (nullmailer pid 3167512 invoked by uid 1000);
 Mon, 27 Jun 2022 23:29:19 -0000
Date: Mon, 27 Jun 2022 17:29:19 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Message-ID: <20220627232919.GA3158390-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-5-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 18, 2022 at 01:30:26PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Add a custom compatible that
> supports the 6 interrupt configuration which falls back to the standard
> binding which is currently the one in use in the devicetree entry.

But it works with only 1 interrupt?

> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 4324a94b26b2..bc85598151ef 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -18,9 +18,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - snps,axi-dma-1.01a
> -      - intel,kmb-axi-dma
> +    oneOf:
> +      - items:
> +          - const: canaan,k210-axi-dma
> +          - const: snps,axi-dma-1.01a

I would drop this depending on your need for compatibility. Are you sure 
on the IP version? It's not really compatible if the number of 
interrupts is different.

> +      - enum:
> +          - snps,axi-dma-1.01a
> +          - intel,kmb-axi-dma
>  
>    reg:
>      minItems: 1
> @@ -33,9 +37,6 @@ properties:
>        - const: axidma_ctrl_regs
>        - const: axidma_apb_regs
>  
> -  interrupts:
> -    maxItems: 1
> -
>    clocks:
>      items:
>        - description: Bus Clock
> @@ -92,6 +93,22 @@ properties:
>      minimum: 1
>      maximum: 256
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: canaan,k210-axi-dma
> +
> +then:
> +  properties:
> +    interrupts:
> +      maxItems: 6
> +
> +else:
> +  properties:
> +    interrupts:
> +      maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -105,7 +122,7 @@ required:
>    - snps,priority
>    - snps,block-size
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -113,12 +130,12 @@ examples:
>       #include <dt-bindings/interrupt-controller/irq.h>
>       /* example with snps,dw-axi-dmac */
>       dmac: dma-controller@80000 {
> -         compatible = "snps,axi-dma-1.01a";
> +         compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
>           reg = <0x80000 0x400>;
>           clocks = <&core_clk>, <&cfgr_clk>;
>           clock-names = "core-clk", "cfgr-clk";
>           interrupt-parent = <&intc>;
> -         interrupts = <27>;
> +         interrupts = <27>, <28>, <29>, <30>, <31>, <32>;

Does the example really need changing? The old one was correct, right?

>           #dma-cells = <1>;
>           dma-channels = <4>;
>           snps,dma-masters = <2>;
> -- 
> 2.36.1
> 
> 
