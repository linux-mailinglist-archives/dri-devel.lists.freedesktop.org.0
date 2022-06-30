Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A3562597
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 23:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FE3112638;
	Thu, 30 Jun 2022 21:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1C911258C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 21:52:00 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x3so643592lfd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 14:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NrGas5lulMJdCQFvtdHCPkDfHPqr2UrmNuzK4irkMDQ=;
 b=qNhf+eF3ou+OVuBeZcYuSohm7adWxuKi6Yti0wH8bSh+rn6DndIf7DuGYB1f4KK8qt
 DQh7A3jNA52nPGbBERaiWj+hhdug4lHLUcYgbylBVnN1M1rmnL4bHVXl9so2OAk70Kol
 ppPogOM7Yfz5iZIO7ZCRIJrAxmaPYXsarHk0xmmqdn0cMqNbblQh3pyw2vY/FtMgJd5y
 hCQtcbwDeYyKxHz0lXeQPvCW4k5sS7l2OGN6ra/IfS/OBFcMG7EvKJhz4Qi0RLZVnkms
 eTpsxPnvbqwvQr/Y+dzniw6/aIav/3pP1gfyXYwGI+HaXsv6x2RppynNq4a0m+ieGc0n
 IN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NrGas5lulMJdCQFvtdHCPkDfHPqr2UrmNuzK4irkMDQ=;
 b=J+SSKi6rVwfJTcTnOML1oXo59wgMBB69HLt0Vow1hr8H3oanYzE+xNMXubyjY9c0jQ
 qII8XtTOyDgH4i7oL8hfOhIxlnykKXnQ8VvL8oXYUw2OfpMTsD8OQ70fLXKnHz/8vPSL
 6rFF5mYfVD0qOM9tN/W5xdp/1h9iLsPHTsP9gUFJNRVGchOey+wwAgy+zhNCCfcO19fr
 Lozli+FH4Noh0URtAOs/qmqCFx/q6EabZvhR+0EErJ4ogfim9s2Jz6SEdty2iwwjpDsZ
 NP5b7821paq8d1SC1ZPZIjGDaqFEy3bQu21DKdjkIp4RnA41kxbVMn2fPGY5lWi3hMTx
 In/g==
X-Gm-Message-State: AJIora/VCSUjB2HiXRL+neAS88Zdti1Rq1aUwXZ4+BJDFferBvT2bniN
 nIOjmox3bNSoMwOJ11+hQmM=
X-Google-Smtp-Source: AGRyM1smx3NRBQNbNVKAperCZ6SfrYZXWBWZAqtLbA5mlnisA9vFR0m9cfl7wPwPzhY7YfaqPG1NNw==
X-Received: by 2002:a05:6512:2292:b0:47f:68b3:3c21 with SMTP id
 f18-20020a056512229200b0047f68b33c21mr7126215lfu.316.1656625918646; 
 Thu, 30 Jun 2022 14:51:58 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056512325000b0047f963bf815sm3293106lfr.93.2022.06.30.14.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 14:51:58 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:51:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 08/15] riscv: dts: canaan: fix the k210's timer nodes
Message-ID: <20220630215155.xzhtfkolgy2iubqe@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-9-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-9-mail@conchuod.ie>
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
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 07:43:37PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The timers on the k210 have non standard interrupt configurations,
> which leads to dtbs_check warnings:
> 
> k210_generic.dtb: timer@502d0000: interrupts: [[14], [15]] is too long
> From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> 
> Split the timer nodes in two, so that the second timer in the IP block
> can actually be accessed & in the process solve the dtbs_check warning.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Just to note. IMO the DW APB Timer driver has been incorrectly
designed in the first place. The dts-node is supposed to describe the
whole IP-core timers set as the original Canaan k210 DT-file expected,
since there are common CSRs in the registers range, which currently
get to be unreachable. But since the DT-bindings has already been
defined that way in the framework of DW APB Timer driver alas there
is nothing we can do to fix it.

-Sergey

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 46 +++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index cd4eae82d8b2..72f70128d751 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -319,28 +319,58 @@ fpioa: pinmux@502b0000 {
>  
>  			timer0: timer@502d0000 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502D0000 0x100>;
> -				interrupts = <14>, <15>;
> +				reg = <0x502D0000 0x14>;
> +				interrupts = <14>;
>  				clocks = <&sysclk K210_CLK_TIMER0>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
>  				resets = <&sysrst K210_RST_TIMER0>;
>  			};
>  
> -			timer1: timer@502e0000 {
> +			timer1: timer@502d0014 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502E0000 0x100>;
> -				interrupts = <16>, <17>;
> +				reg = <0x502D0014 0x14>;
> +				interrupts = <15>;
> +				clocks = <&sysclk K210_CLK_TIMER0>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER0>;
> +			};
> +
> +			timer2: timer@502e0000 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502E0000 0x14>;
> +				interrupts = <16>;
>  				clocks = <&sysclk K210_CLK_TIMER1>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
>  				resets = <&sysrst K210_RST_TIMER1>;
>  			};
>  
> -			timer2: timer@502f0000 {
> +			timer3: timer@502e0014 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502E0014 0x114>;
> +				interrupts = <17>;
> +				clocks = <&sysclk K210_CLK_TIMER1>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER1>;
> +			};
> +
> +			timer4: timer@502f0000 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502F0000 0x14>;
> +				interrupts = <18>;
> +				clocks = <&sysclk K210_CLK_TIMER2>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER2>;
> +			};
> +
> +			timer5: timer@502f0014 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502F0000 0x100>;
> -				interrupts = <18>, <19>;
> +				reg = <0x502F0014 0x14>;
> +				interrupts = <19>;
>  				clocks = <&sysclk K210_CLK_TIMER2>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
> -- 
> 2.36.1
> 
