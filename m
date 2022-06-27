Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192C55BC7D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 01:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0043510E562;
	Mon, 27 Jun 2022 23:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9EA10E562
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:30:29 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id a7so1987117ilj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x8JlGuBlsyv8u11qNoGLGDrkEldcGlScrLvA1xIrWcM=;
 b=gTJr7LtFrBMvAapJyIrWdB/iGT5PUJ4qQ1wzl3z7IfhCft1qebEa2JRxbtzzGt+Jxa
 3RiviO/lHoPzNA4XbDuxKSn8wGuP7VwAAGppi0+xGDTVgM2Vs0Jg61BtbRu3qiyp64EJ
 UawNfFu/aLK6DJ9NUKXU6b4xa8+yYrsn2M7iSWPTfAwQPiz9+FVWgJlTPgxCgZX4k0IU
 oznD+616w7O52/2M/ZK3U45gPmanQVENdhZeDFbPg6P7oThxGNoyqyPv6s0j1OQ2HYGr
 8MJ5d8YMEwWpW7qIqB5BlAdJ9KgCXLO3leWMgAf6sHefBm5QQE3wMM3lCylLdZsOVQkX
 x/WQ==
X-Gm-Message-State: AJIora+nJZi2OSvCeoHWzod7ziCmDBus1mRmiJ/g9/Ui28LXk7ZkNtRy
 8XKBW3YfXLbYCpwN2W1rHQ==
X-Google-Smtp-Source: AGRyM1v++vx5C2PZ1+V37WXzVu58JZoOtbgG4MxkB9S8u2iPl6cebvqf5cCXt4rpl+8ThnjePE2X0Q==
X-Received: by 2002:a05:6e02:1d19:b0:2d9:1705:892b with SMTP id
 i25-20020a056e021d1900b002d91705892bmr8430986ila.61.1656372628833; 
 Mon, 27 Jun 2022 16:30:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a5d9290000000b00672f405e911sm5910587iom.38.2022.06.27.16.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 16:30:28 -0700 (PDT)
Received: (nullmailer pid 3169022 invoked by uid 1000);
 Mon, 27 Jun 2022 23:30:25 -0000
Date: Mon, 27 Jun 2022 17:30:25 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH 05/14] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Message-ID: <20220627233025.GA3167724-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-6-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-6-mail@conchuod.ie>
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

On Sat, Jun 18, 2022 at 01:30:27PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware timer but
> according to the documentation & devicetree it has 2 interrupts rather
> than the standard one. Add a custom compatible that supports the 2
> interrupt configuration and falls back to the standard binding (which
> is currently the one in use in the devicetree entry).
> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/snps,dw-apb-timer.yaml     | 28 +++++++++++++++----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> index d33c9205a909..9a76acc7a66f 100644
> --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> @@ -12,6 +12,9 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - const: canaan,k210-apb-timer
> +          - const: snps,dw-apb-timer
>        - const: snps,dw-apb-timer
>        - enum:
>            - snps,dw-apb-timer-sp
> @@ -21,9 +24,6 @@ properties:
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    maxItems: 1
> -
>    resets:
>      maxItems: 1
>  
> @@ -41,7 +41,23 @@ properties:
>  
>    clock-frequency: true
>  
> -additionalProperties: false
> +unevaluatedProperties: false
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: canaan,k210-apb-timer
> +
> +then:
> +  properties:
> +    interrupts:
> +      maxItems: 2

When more than 1, you need to define what they are and the order.

> +
> +else:
> +  properties:
> +    interrupts:
> +      maxItems: 1
>  
>  required:
>    - compatible
> @@ -60,8 +76,8 @@ oneOf:
>  examples:
>    - |
>      timer@ffe00000 {
> -      compatible = "snps,dw-apb-timer";
> -      interrupts = <0 170 4>;
> +      compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
> +      interrupts = <0 170 4>, <0 170 4>;
>        reg = <0xffe00000 0x1000>;
>        clocks = <&timer_clk>, <&timer_pclk>;
>        clock-names = "timer", "pclk";
> -- 
> 2.36.1
> 
> 
