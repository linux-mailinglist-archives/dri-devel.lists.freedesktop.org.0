Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BFD55BC15
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31F010E884;
	Mon, 27 Jun 2022 21:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE9310E6A3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 21:13:19 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s10so12467897ljh.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Apd1Cl8iWlr7VPj1iuOe666SC1Q2pQo9qEBUCr9vf6Q=;
 b=ilyEOtv07N3ArdjBB7bMKwAqjb/e0wlxydgdur1zOwDRqzH4IPqX2FlQxVaGAXw6Kc
 Gc0VmznO21rzcUs44XvprgCJ41kZL5S9X1gx6kQ+guwTI6uiSc4zItEWOnsDW3kNAVlF
 sfGw15jYmTuWW1FxW/Lb57dg0O1NF3p/fPa5o15TUnzZIQmB98u2AvQRL0iesgljp0tc
 xc9//5AKa4Iw3dQz5Ksx+KmaP7act61c7ia75qFkgn5dlsfLCparb572EaPCLMdTHnjX
 0Dp5EEprtNhtw/ZXAV6oYcWZi6HDJptcetDIzhKexpPO7ZBBmv8UMK0X2PqLjPdeMC7b
 JSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Apd1Cl8iWlr7VPj1iuOe666SC1Q2pQo9qEBUCr9vf6Q=;
 b=a9buj0XLQdi0DhbFjUeNc3drklLmroAPrDutmDdvphNUkGgGNOQ0JYqxnZs661qTwR
 re5aAbXLqwRaluCk5o7uhlh58ptSZFrfZJ3n0/OjbN8NWJ1gLOtQZ6nalLQA93gkXDzS
 riThgAUY4ihkThtF5SXnTCGCh9iSLRg5xeTL0t1lfiX8ou5oW3azyVZf7RlfSPUSqUAv
 PXsQqoOOuVWFOT4j4wxMHtEJ4kvrrgtAQ/DUuw+kHFGU7kqpbF+Sy2QdPSO4+UiqiiNx
 tj5y+UBvFnjMz/iNL5IXOi+1H/e/VAp03hpdJ0JjtP1kyz0QjpIBVUjbVpBfdk5Hdj4u
 aAOQ==
X-Gm-Message-State: AJIora8v6wwY2ocqv0MTblzwx9omkmChsaSBSu+2z69ga2+rYm5GTqIQ
 smJNWPWVRjgFqqleHDs1QGw=
X-Google-Smtp-Source: AGRyM1t9VxFwTJAlhP264dX7IvF0c94LGOWuU36vJO57G/WRfCPD7iXEUNRYkA0yEtu/rvZ1Rje57Q==
X-Received: by 2002:a2e:9191:0:b0:25a:8858:f60d with SMTP id
 f17-20020a2e9191000000b0025a8858f60dmr7495670ljg.423.1656364397334; 
 Mon, 27 Jun 2022 14:13:17 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a2eb529000000b0025bc79181b4sm358400ljm.36.2022.06.27.14.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 14:13:16 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:13:14 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v2 06/16] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Message-ID: <20220627211314.dc2hempelyl5ayjg@mobilestation>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-7-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627194003.2395484-7-mail@conchuod.ie>
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

On Mon, Jun 27, 2022 at 08:39:54PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware timer but
> according to the documentation & devicetree it has 2 interrupts rather
> than the standard one. Add a custom compatible that supports the 2
> interrupt configuration and falls back to the standard binding (which
> is currently the one in use in the devicetree entry).
> 

> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58

Firstly, it's page 51 in the framework of the document pages
enumeration.

Judging by the comment in the document above and what the HW reference
manual says regarding the IRQ signals, what you really have on K210 is
the DW APB Timer IP-cores each configured with two embedded timers.
It's done by the IP-core synthesize parameter NUM_TIMERS={1..8}, which
in your case equals to 2. A similar situation is on our SoC and, for
instance, here:

arch/arm/boot/dts/berlin2q.dtsi
arch/arm/boot/dts/berlin2.dtsi
arch/arm/boot/dts/berlin2cd.dtsi
(Though the Berlin2 APB Timer have been configured with 8 timers.)

So the correct modification would be:
1. Split up the nodes into two ones with one IRQ per each node.
2. Make sure I was right by testing the new dts out.
3. Update the DT-node only and leave the DT-bindings as is.

-Sergey

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
