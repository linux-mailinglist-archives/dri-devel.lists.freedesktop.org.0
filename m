Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD6552BCE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B34310F896;
	Tue, 21 Jun 2022 07:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705CE10E438
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 20:56:59 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a11so4437516ljb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I1q6whSBjY67mrzgmnGkRh2MNzKa13E3jo+SVBhTEQg=;
 b=XqDUXO3E0jN9GQ9iGhmoxij0PahkYfXP61nSCTKCx/fvSoFpRgDWoLiqAgCUJw1PnX
 GdUgZ6dYoT0Uit7ykMaMR28omMbZ7gDLoi3NlWPpOtwarIrAKYFsFwlDEOerY9w8oIh9
 rbNjhalyLNI+e+pBOTtZlMUNIOGbQPKrYkgGGE49HLjM86guD1yX+eIVXs28qYEpQbEL
 6u9TJxb58aw5NaSuOkvrVJyyneGqycdZCp/nKqOuDGx84SLdx3Jj79iGAZlYRrBgW6bm
 FIeQBMEkq8FhjglPxtSJNnSUrVC7AertpkEpoopILkV/YW/Fu3kY37aS2zC50BoszzoE
 3eOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I1q6whSBjY67mrzgmnGkRh2MNzKa13E3jo+SVBhTEQg=;
 b=VU0kXZbhIcdXVsYB9dhCvjRPcOIrGtE7BN4YsGv1wKFCV5jAikKBjUezsb1YNJ+Gfa
 MT7eLOCQAbzNKIMBGfBCRBcMbX+OGxYwRkwIBnCybuztW/rHX8cbXXPlqh03Mx5bX9zj
 HHZiB78KrJTnb4CcHKU8OLuAOPxMM/16DwpHdFzyCHdurBtOyAeXOvQrERabpkADvTTb
 E/y7KhkPpq+UsknWP1ncMTbyUmSFbD0tCMhGlk2T/L7MQLHvCc0at7cgwKZ6R9YkxRw3
 R1V81jiWkbWG4XX9CzTdgxaaIfRIU70ghTZswRWv4JmcGAlJ3H6uC12reJd1BcV+rFuD
 bzKA==
X-Gm-Message-State: AJIora8iaZkaicejIXh9rcy8RSBNZlWThYlvAOIrlNYVutjwr3JA8IAR
 Af+Vzh7GxwyOkywfio1gwLs=
X-Google-Smtp-Source: AGRyM1to9l7DPfbxuwJzqkPzvrt6m3YRq/lqE+tbkd+LRqyrjxLhnrSzMA6Azd9ZVxOZ5l1LL1DhCQ==
X-Received: by 2002:a05:651c:2107:b0:255:beb0:9969 with SMTP id
 a7-20020a05651c210700b00255beb09969mr12785405ljq.157.1655758617786; 
 Mon, 20 Jun 2022 13:56:57 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
 by smtp.gmail.com with ESMTPSA id
 i17-20020ac25b51000000b004778632bff6sm1893799lfp.59.2022.06.20.13.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:56:57 -0700 (PDT)
Date: Mon, 20 Jun 2022 23:56:54 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220620205654.g7fyipwytbww5757@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-7-mail@conchuod.ie>
X-Mailman-Approved-At: Tue, 21 Jun 2022 07:24:08 +0000
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

On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> this.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index e25d44c218f2..f2b9e3f062cd 100644
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

You can just use a more relaxed constraint "enum: [1 2 4 8]" here
irrespective from the compatible string. The modern DW APB SSI
controllers of v.4.* and newer also support the enhanced SPI Modes too
(Dual, Quad and Octal). Since the IP-core version is auto-detected at
run-time there is no way to create a DT-schema correctly constraining
the Rx/Tx SPI bus widths. So let's keep the
compatible-string-independent "patternProperties" here but just extend
the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
properties values.

Note the DW APB SSI/AHB SSI driver currently doesn't support the
enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
activated by means of the corresponding CSR. So most likely the DW AHB
SSI controllers need some specific setups too.

-Sergey

>  
>  unevaluatedProperties: false
>  
> -- 
> 2.36.1
> 
