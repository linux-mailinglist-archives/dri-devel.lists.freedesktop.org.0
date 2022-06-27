Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEC055BBFA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 22:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885E8112B8B;
	Mon, 27 Jun 2022 20:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61258112B8B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 20:21:55 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g4so18532018lfv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aEWNCuKRy84iEbBoB1dMIfYVeUetfldA1vTgDU/ZzpE=;
 b=geDEG3yd1mYJXt6c1aZqzKWP/aSMvf/tfBT02vnFiFO+9ETRIt4umK1PW+NPrV4xAH
 IPwGcjymmEkEzhhk9+XfpXmXGl1Hw9JVqezOplwRathZX7199rU+Z7wL341nIIuFtkZf
 rX2nPa+o+ldHMvBiVu03vmITAtU3+Jlc/PAYiJ2mr2uSfK25+/LYPfwM6msaBK3V5YU+
 /HKZtnsRBNWbAUETnWCFuG2fuIB/wg1zNavS4iltt3gKSZOGaTwwTY6EMCMZedVNKp41
 XYAPLMzh0ibM9cjqHXGiaOyXJy6HDQQZ/imNX5A24xcPor78JRMcqOv2q4TJSZyyxRKh
 dSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aEWNCuKRy84iEbBoB1dMIfYVeUetfldA1vTgDU/ZzpE=;
 b=DID/M+Ue3oHGfn1fYD++H1/RJ72ICVXA+BHSLHoe0d7aUUrqy5eh3tkP7ummUhFivn
 1LmFbmL5gBwH2Gc96MCSUoKxl/f6AKrtun0/6ulTSHUPUMZawtsQvY33B0zpuX/8qA+n
 ao++eYQb2HRjDEi5nFcpf/92BgdsmC8jNkJN5EPN8AA75XJHT6SDMd27Vp8w9uNKkrqz
 IYy/KwL+IXEjWR3eLpwHoOPcVu40557KCyJ2lXRo/TiByVlw4hlHSffVP9esJ8xL7scX
 0oW05CZLpazAJAZsiW8azoM/GKDGwWgcUKAJFL1GjUZ26qVtwbzDls8ko+P5SMjO3Nyv
 e7ww==
X-Gm-Message-State: AJIora8lW6XDRmXv/LrukKxC/glVjxmpQ/1ynSUkJnd5cIQ3F3Dd3uVW
 0auhZLTnM3u2iGGD+78sT+1iZQoGtEyV8Q==
X-Google-Smtp-Source: AGRyM1va63TpZ/BKlBrasRzo3hQuwImYd1Viwhj3pBKVD/eIotL0NPskkSjb7q5nOJbI3zAauoeozw==
X-Received: by 2002:a05:6512:3d8f:b0:47f:a083:a989 with SMTP id
 k15-20020a0565123d8f00b0047fa083a989mr9505126lfv.646.1656361313593; 
 Mon, 27 Jun 2022 13:21:53 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a0565123a8400b004796e1555eesm1917694lfu.199.2022.06.27.13.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 13:21:52 -0700 (PDT)
Date: Mon, 27 Jun 2022 23:21:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v2 04/16] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220627202149.624eu7w2gzw7jchd@mobilestation>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627194003.2395484-5-mail@conchuod.ie>
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

On Mon, Jun 27, 2022 at 08:39:52PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
> Canaan k210 is wired up for a width of 4.
> Quoting Serge:
> The modern DW APB SSI controllers of v.4.* and newer also support the
> enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
> version is auto-detected at run-time there is no way to create a
> DT-schema correctly constraining the Rx/Tx SPI bus widths.
> /endquote
> 
> As such, drop the restriction on only supporting a bus width of 1.
> 
> Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Serge, I dropped your R-b when I swapped to the default
> property since it changed the enum.
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index e25d44c218f2..0a43d6e0ef91 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -143,12 +143,6 @@ patternProperties:
>          minimum: 0
>          maximum: 3
>  

> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> -

My comment was:
> > > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> >
> > 8 too? sure.
Then Rob said:
> Then no constraints needed because the common definition already has
> this presumably.

IMO preserving the device-specific constraints even if they match the
generic ones has some maintainability benefits. What if you get to
discover a new HW which supports Hexal mode? Then you would have
needed to update the common schema constraints. But that would have
caused permitting the unsupported bus-mode for all the schemas, which
isn't correct. So as I see it the explicit bus-width enumeration would
be ok to have here. But I'll leave it for Rob to make a final
decision.

Rob

>  unevaluatedProperties: false
>  
>  required:
> -- 
> 2.36.1
> 
