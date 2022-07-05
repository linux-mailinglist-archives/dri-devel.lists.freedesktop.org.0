Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C3566E99
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 14:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F3514B518;
	Tue,  5 Jul 2022 12:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604BD18AB52
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 12:46:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB1F0B817D3;
 Tue,  5 Jul 2022 12:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A7BC341CB;
 Tue,  5 Jul 2022 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657025167;
 bh=wAEDIpJKEpqow07OA5pbiA0C6VtRvMKO1qtrFbDdCFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F1zWy3llLirCMHGf9oUncrDC/YFjZyTLRq8g3aGTJpZatIfnJET0NC0gnzAOEdr2n
 LBKUBdh5gaukjcT6H01UyFyR1g3lElraTjEWOXwlu3L+XH1FqHxwkoz84MEHbDLZZS
 eZ7WTHq7q/c3I0uPyb7wS7aieCwKK84nmRl7LaVwFRCiR7/fpeSy+ezZvVLR5oazeo
 +8rDVpEmi2KIs/N5QTg7RoE7sDKNODVpStI+T1WWd9jlCgJ2LwPqsLi629VFCOdZNa
 34Q7G2rXUbrzbjGnEGGG6k9533cawbC447VyAxsPMu9Lq8RQf5jfsUjcD80ZuDWNNB
 mQCzFe7dd4CQQ==
Date: Tue, 5 Jul 2022 18:16:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 04/14] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Message-ID: <YsQyi3Mx99m8fnGu@matsya>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-5-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701192300.2293643-5-conor@kernel.org>
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
 Dillon Min <dillon.minfei@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01-07-22, 20:22, Conor Dooley wrote:
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
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml          | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 4324a94b26b2..98c2ab18d04f 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -34,7 +34,12 @@ properties:
>        - const: axidma_apb_regs
>  
>    interrupts:
> -    maxItems: 1
> +    description: |

rob asked you to drop this in last patch, pls fix that and send with his
ack

> +      If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
> +      will be per-channel interrupts. Otherwise, this is a single combined IRQ
> +      for all channels.
> +    minItems: 1
> +    maxItems: 8
>  
>    clocks:
>      items:
> -- 
> 2.37.0

-- 
~Vinod
