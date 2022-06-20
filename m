Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE6E55122C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 10:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47A110E0F8;
	Mon, 20 Jun 2022 08:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EEC10E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 08:08:57 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id c1so14533051qvi.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6iOgcYMqJ9zOwx1P0bKGX4G545U6AIxu9kHxZeyUd0=;
 b=eUV8dv2CJUsUn+XVA7Y5Whkcr1Yix5Wyz42kSI+cdxiH6mYVta9x58J9xMaOspXaRb
 zHh1A6F8Uw/cIo5VCgdA2X9FZ8L2fgVBKBj+3w456iZYuxfirpHrH2D4hckUjpdQHOwE
 iy1PJV59kOh5Flnr2TyZmjM9vG66sMBsO7qgNvaKGjfZDm59v6RvQYS843FTtXTNnMW4
 XcgK0rzMaeRuZrl9RP9U85JhSI6LbG8bUQMUg+o0m30MPIvq+O+f+WS8eXDfnqfl5jOV
 7c+G2Mqm/UTZrXueX3b7AHInm/aAfYnfQXfMBKYUEHzuM7UQETpvjQnDn41vVzjJmHLB
 XeRg==
X-Gm-Message-State: AJIora+zNoRDbvT2oFf6b34Ywsn+A9U3n2rGs9wgEKrBXrtkroiSX0C/
 ZLywz8tE303oGu8MTAUL0PJyPxaPz8dHug==
X-Google-Smtp-Source: AGRyM1tSXpum5ZjiDT2AZx1L4eOqAPss0Z1dEdC7yC1sF1mzIg/SIRlIm8eyNH1pyO9QG1kQ18+5/w==
X-Received: by 2002:ac8:594a:0:b0:305:344d:b3f2 with SMTP id
 10-20020ac8594a000000b00305344db3f2mr18434951qtz.102.1655712535983; 
 Mon, 20 Jun 2022 01:08:55 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 y17-20020a37f611000000b006a69f6793c5sm10594324qkj.14.2022.06.20.01.08.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 01:08:55 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id x38so17585544ybd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:08:55 -0700 (PDT)
X-Received: by 2002:a25:bd41:0:b0:668:c259:f6c2 with SMTP id
 p1-20020a25bd41000000b00668c259f6c2mr15091616ybm.365.1655712136748; Mon, 20
 Jun 2022 01:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
In-Reply-To: <20220618123035.563070-7-mail@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jun 2022 10:02:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
Message-ID: <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
To: Conor Dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="UTF-8"
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
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Conor,

On Sat, Jun 18, 2022 at 2:32 PM Conor Dooley <mail@conchuod.ie> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> this.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -135,19 +135,41 @@ properties:
>        of the designware controller, and the upper limit is also subject to
>        controller configuration.
>
> -patternProperties:
> -  "^.*@[0-9a-f]+$":
> -    type: object
> -    properties:
> -      reg:
> -        minimum: 0
> -        maximum: 3
> -
> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: snps,dwc-ssi-1.01a
> +
> +then:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 4
> +
> +        spi-tx-bus-width:
> +          const: 4

These two also depend on the board (SPI device + wiring).
So all of [1, 2, 4] are valid values.

> +
> +else:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 1
> +
> +        spi-tx-bus-width:
> +          const: 1
>
>  unevaluatedProperties: false

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
