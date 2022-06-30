Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA35625B5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 23:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A3F1122BF;
	Thu, 30 Jun 2022 21:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7861122BF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 21:55:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a13so593433lfr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=80eW9Jq1ijIJLJtHfGhI83NTX/9vTLnN/UmyaBuaW4E=;
 b=AkPzOgMfGFfZSjZD7jfIt2VIntAlLoUSr3SbzTZY0tvDU2JAbZAB5jwCcqhRCkAM2f
 SZMaXzambC5XvJqoJSqZhCYJjt3IvVCp+6BwaWT4/O99SY2jx12hO35bgEKhKuKxejcQ
 dE2URnyS5yf1nh9ijeSAcPycHs2KVfpVtk/PdoQ7jD6COfYLF+mrcrO6e33CUzwQZPGY
 APDYTngSt7Y+GPy5o8I+w1G0pNyoFvpS1MDQY6Dnc7Ax6wnu+jMdv5Clu6vCV+9thnMt
 x6/8Y8TfDG/rsDa4DJ2sM0E7/R76fWr9+E3VerI/dstVRhBOWwsbw1sjWfdYFwEvwyeZ
 Vx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=80eW9Jq1ijIJLJtHfGhI83NTX/9vTLnN/UmyaBuaW4E=;
 b=pOEDMYN8OI7nCJlpig8cb1sUb8Ju1SkYYOG363i32aqWZJH29zpx1vbtPOdnbcmfsl
 uRViouk1/stbDTe4CQoSJaw0+Igejk3wGY7wuBdwihcrnyka44WIyfQ6D14tXsxk/vEL
 KQYT2QEBBWRcf8BLZuQ7G8bM9ZueoaSWx/sgd1OskjOBwZE1RaF9toAd5/fA6/5yoIEt
 IkwyQ0z7s/Lxq5GYIbjerd0BvXuVCZNkohiJceb41hh2mi1oKHDZHqPMDoOF2fqU7dYz
 68c0Rp3i1z4eeA6ma0Y6HZ6yEb2wy3Vi25XfKLTOkYRW49kestOOF1hyh8xqM7FOFG4F
 e/bA==
X-Gm-Message-State: AJIora96qsDyQtwxBUv2YufEAEvT/ytGspd/IjEDzQwlF/HPu5mg175r
 DQjyhmOUno/RzXm773W0oPs=
X-Google-Smtp-Source: AGRyM1uQwi4ck8oI9eCwLDrSO3GQoKmA3R5saWkWWfnF2szv6WIcphr08hrqWMNbe4QePSuxVMEb9g==
X-Received: by 2002:a05:6512:118f:b0:47f:6a1a:20d4 with SMTP id
 g15-20020a056512118f00b0047f6a1a20d4mr6526103lfr.428.1656626143761; 
 Thu, 30 Jun 2022 14:55:43 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 e12-20020ac24e0c000000b00478a311d399sm3304595lfr.0.2022.06.30.14.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 14:55:43 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:55:40 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 05/15] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <20220630215540.cifnzovya57bgbsw@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-6-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-6-mail@conchuod.ie>
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

On Wed, Jun 29, 2022 at 07:43:34PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Support the 6 interrupt
> configuration by unconditionally extending the binding to a maximum of
> 8 per-channel interrupts thereby matching the number of possible
> channels.
> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 4324a94b26b2..e33ef22aec9c 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -34,7 +34,9 @@ properties:
>        - const: axidma_apb_regs
>  
>    interrupts:

> -    maxItems: 1
> +    description: per channel interrupts

Description is inaccurate. It's either combined or per-channel IRQs.

Other than that:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> +    minItems: 1
> +    maxItems: 8
>  
>    clocks:
>      items:
> -- 
> 2.36.1
> 
