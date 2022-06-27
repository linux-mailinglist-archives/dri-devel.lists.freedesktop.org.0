Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D155BC29
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502B610F42D;
	Mon, 27 Jun 2022 21:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D20310F417
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 21:34:55 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id b7so12539881ljr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r50n64wyDXc98klCxenqB007ebeUTjgGTq3cHnewLs4=;
 b=eTl8RIM33/VhG6tyN0u1F7fh7bD9vwV9Nzl/DTA5Ny2T+C6Zz9CjWOXxw7tIRCfdSF
 JYJ+vK6VW6ow6XLR5ZnJoODpvohnt2Z+3t+vZDZHvM57s96TKZNFnlBSRDHDoYRnNnyQ
 N0k44RLYsM83fxNhFomNU3IiMDIB4LHzbT4UomKmLLPc0fcxeMBuZkZoILf+4d9CFzu5
 UGEjxpB5ZDTuXmtB4swbT0dDHmqosyfnMddfaHNphkAj8y6jxGlSDFIcL0nXRbbh3k9b
 NayiDEFJxxACHU3nhoe6LL8qnnNmGMIoh2ujOpxj9PuVm+6S9FPq9eujRABge7XAKiJx
 lZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r50n64wyDXc98klCxenqB007ebeUTjgGTq3cHnewLs4=;
 b=mqzWWVj9HGMnV63l+l2xi1Kcm2XOl/R07Ql3ulBJFP6jZm5j1HC3JF93xCNVZCf6k9
 lNNOm2kjHPQ79dSbp+t5S28DpIE3Yr1DrMNO7S6YxRWQveqTiGWyHoifzSzmpeqf0P3c
 nO0B/AMXYTHj467OvMNf0aP5VeV2dtq9JyvK9vxZjkOQcIwZFAaBJHYH4ytwIMZaFlrc
 DpkIA7qSo3doATJmuqm86OS4pGBbOZ/VgqI9mfVFHjwWQ5gD71tah5PnvXiQ93+239wY
 sR+IAPWhdpgab/YrHG/58NqwLBRSuUy/i7LGuQCZO6LfUWjPMotMdPaHQH0lY2u/fFCF
 Vezg==
X-Gm-Message-State: AJIora8OSN0plezWxp2bPySRgOFUB/+Cuci3VnG9vcrOMAB3XBJRGyPl
 /Dm60GPVYzwN+RiimTWHCfI=
X-Google-Smtp-Source: AGRyM1s2Xww9mZJQuItbTSCpLvPnTOre5lxdTZAquDOY9Sz5QQprbSClbPdC4vgd++PPS48AGvyOcw==
X-Received: by 2002:a2e:702:0:b0:253:bc1a:8a8c with SMTP id
 2-20020a2e0702000000b00253bc1a8a8cmr7961986ljh.128.1656365693778; 
 Mon, 27 Jun 2022 14:34:53 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 y1-20020ac24461000000b0047fb3ea0659sm1929044lfl.292.2022.06.27.14.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 14:34:53 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:34:50 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v2 05/16] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Message-ID: <20220627213450.ukqai4bsjzcwhnlp@mobilestation>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-6-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627194003.2395484-6-mail@conchuod.ie>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 27, 2022 at 08:39:53PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Add a custom compatible that
> supports the 6 interrupt configuration which falls back to the standard
> binding which is currently the one in use in the devicetree entry.
> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58

I believe what you've got here is the per-channel IRQs, which is
activated for the DW AXI DMAC by setting IP-core synthesize parameter
DMAX_INTR_IO_TYPE=1 (CHANNEL AND COMMONREG). That's why there are six
IRQ signals and six DMA-channels available.

Seeing such setting isn't the Canaan k210 specific, but is the DW AXI
DMA controller common property, what would be right in this case is to
unconditionally extend the number of IRQs in the DT-bindings schema.

Please note the DW AXI DMAC driver currently doesn't support the
per-channel IRQs. So most likely the DMA will only work with using the
channel 0 only.

-Sergey

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
>           #dma-cells = <1>;
>           dma-channels = <4>;
>           snps,dma-masters = <2>;
> -- 
> 2.36.1
> 
