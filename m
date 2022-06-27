Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B2E55BC79
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 01:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA0310E46F;
	Mon, 27 Jun 2022 23:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF4710E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:22:44 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id h20so7050798ilj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3lHtHF5zI7QaQustjx+BDaBkfu/L3JJ+u5pFItRPzJ4=;
 b=PPHZaRd54w11+Uq6FsOeEvK3Jb0zMG4e5aLxpFlgsQqHcLqPrfECbdRR/tHR+XEVP9
 KgqPsnyGLMU+20vPZH3Jts1K0kOsar8Komu73lDXx29SStgmzkupOgfqDLHej4oIKnJM
 HBLHOyNGYMaXWXq8/bXQADgWmL+zcWAlFf7c/uQHmfByzyjry7Zu6jJQAz2zjchkyTQc
 9RQeGgLxMzBpRd7A+aoGrakOtiwlIWujcS3U77VMEV8r8vbOIrcbGT3B5X1nH+e3GHv8
 zGDChoAQWDfAtbIF34OnAU9PBitofFwYRf+hhgmU18TR2FcIvxS/vLXkJBfNIoRNDyX8
 lj+Q==
X-Gm-Message-State: AJIora/3xYSVvggSMnX0ykrcdZkkehVcJO1PZmFWKntrXDC2Hi2gy1MA
 16nV8UhkeV8/Jb6xEigilA==
X-Google-Smtp-Source: AGRyM1uuZgM8JkppOyMZE7iD5zoRFs4rpAokBWSho/964cJTForbd85QtIKVpY1IbCabypfEAIEcAA==
X-Received: by 2002:a05:6e02:154d:b0:2da:9539:3093 with SMTP id
 j13-20020a056e02154d00b002da95393093mr4871207ilu.131.1656372163678; 
 Mon, 27 Jun 2022 16:22:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a92d703000000b002d9344d4d6bsm5094310iln.79.2022.06.27.16.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 16:22:43 -0700 (PDT)
Received: (nullmailer pid 3158136 invoked by uid 1000);
 Mon, 27 Jun 2022 23:22:40 -0000
Date: Mon, 27 Jun 2022 17:22:40 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH 03/14] ASoC: dt-bindings: convert designware-i2s to
 dt-schema
Message-ID: <20220627232240.GA3156149-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-4-mail@conchuod.ie>
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

On Sat, Jun 18, 2022 at 01:30:25PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the Synopsys DesignWare I2S controller binding to dt-schema.
> There was no listed maintainer but Jose Abreu was the last editor of the
> txt binding so add him as maintainer.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/sound/designware-i2s.txt         | 35 -------
>  .../bindings/sound/snps,designware-i2s.yaml   | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/designware-i2s.txt b/Documentation/devicetree/bindings/sound/designware-i2s.txt
> deleted file mode 100644
> index 6a536d570e29..000000000000
> --- a/Documentation/devicetree/bindings/sound/designware-i2s.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DesignWare I2S controller
> -
> -Required properties:
> - - compatible : Must be "snps,designware-i2s"
> - - reg : Must contain the I2S core's registers location and length
> - - clocks : Pairs of phandle and specifier referencing the controller's
> -   clocks. The controller expects one clock: the clock used as the sampling
> -   rate reference clock sample.
> - - clock-names : "i2sclk" for the sample rate reference clock.
> - - dmas: Pairs of phandle and specifier for the DMA channels that are used by
> -   the core. The core expects one or two dma channels: one for transmit and
> -   one for receive.
> - - dma-names : "tx" for the transmit channel, "rx" for the receive channel.
> -
> -Optional properties:
> - - interrupts: The interrupt line number for the I2S controller. Add this
> -   parameter if the I2S controller that you are using does not support DMA.
> -
> -For more details on the 'dma', 'dma-names', 'clock' and 'clock-names'
> -properties please check:
> -	* resource-names.txt
> -	* clock/clock-bindings.txt
> -	* dma/dma.txt
> -
> -Example:
> -
> -	soc_i2s: i2s@7ff90000 {
> -		compatible = "snps,designware-i2s";
> -		reg = <0x0 0x7ff90000 0x0 0x1000>;
> -		clocks = <&scpi_i2sclk 0>;
> -		clock-names = "i2sclk";
> -		#sound-dai-cells = <0>;
> -		dmas = <&dma0 5>;
> -		dma-names = "tx";
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> new file mode 100644
> index 000000000000..5ac9c00157bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/snps,designware-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DesignWare I2S controller
> +
> +maintainers:
> +  - Jose Abreu <joabreu@synopsys.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: canaan,k210-i2s
> +          - const: snps,designware-i2s
> +      - enum:
> +          - snps,designware-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      The interrupt line number for the I2S controller. Add this
> +      parameter if the I2S controller that you are using does not
> +      support DMA.
> +    maxItems: 1
> +
> +  clocks:
> +    description: Sampling rate reference clock

How many?

> +
> +  clock-names:
> +    const: i2sclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    items:
> +      - description: TX DMA Channel
> +      - description: RX DMA Channel
> +    minItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +    minItems: 1
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: canaan,k210-i2s
> +
> +then:
> +  properties:
> +    "#sound-dai-cells":
> +      const: 1
> +
> +else:
> +  properties:
> +    "#sound-dai-cells":
> +      const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +oneOf:
> +  - required:
> +      - dmas
> +      - dma-names
> +  - required:
> +      - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc_i2s: i2s@7ff90000 {
> +      compatible = "snps,designware-i2s";
> +      reg = <0x7ff90000 0x1000>;
> +      clocks = <&scpi_i2sclk 0>;
> +      clock-names = "i2sclk";
> +      #sound-dai-cells = <0>;
> +      dmas = <&dma0 5>;
> +      dma-names = "tx";
> +    };
> -- 
> 2.36.1
> 
> 
