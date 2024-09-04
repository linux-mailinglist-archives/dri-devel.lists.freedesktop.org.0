Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E496B1FD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F2F10E1BD;
	Wed,  4 Sep 2024 06:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QfntRqHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057A010E1BD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:41:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 989115C56F2;
 Wed,  4 Sep 2024 06:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4791C4CEC2;
 Wed,  4 Sep 2024 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725432061;
 bh=eiq22ISFTh3GnEYkyoLA51ihfk67BUTzt69jnSPsNV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QfntRqHhVlZQKTEmmXJG2IDX43TFrBfPq/UEPtSr5Pz1eN+Kn8ZmtXtrfoIcdCyOa
 U54LN6tTYMt4mVRXGqtdzeuziYV1CvMHS9OiAPaNfB5jTOLzKUkR7vOyOWMLGgZRBi
 pQy25Wi3EtwJUYXSz5MU8xvgjFULJA/7M4VLk9EMcXXaKS8pD740KT9fID/43rrIHj
 k6n6d9GKtA9sMNvDo4frzRaBnaLGSH0s0q2dU1nKLkyYnwc/Bw4qfSN9ghS4TDcHy3
 zeiYRZqNas6ay7yW/0hjy4ym49mP+1sYkRlrr2T6TT1IH20P8HFBW3IcC4bn7WWZel
 BhUlWv5LiN+BQ==
Date: Wed, 4 Sep 2024 08:40:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: mripard@kernel.org, marex@denx.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: lcdif: Document the dmas/dma-names properties
Message-ID: <laht7vjo23axdssodmn2fdd56vtxprahqenropjzkv6qs5he6k@p5emhlf2j6yt>
References: <20240903162729.1151134-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903162729.1151134-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 03, 2024 at 01:27:29PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX28 has an RX DMA channel associated with the LCDIF controller.
> 
> Document the 'dmas' and 'dma-names' properties to fix the following
> dt-schema warnings:
> 
> lcdif@80030000: 'dma-names', 'dmas' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../bindings/display/fsl,lcdif.yaml           | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 0681fc49aa1b..dd462abd61f8 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -50,6 +50,14 @@ properties:
>        - const: disp_axi
>      minItems: 1
>  
> +  dmas:
> +    items:
> +      - description: DMA specifier for the RX DMA channel.
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +
>    interrupts:
>      items:
>        - description: LCDIF DMA interrupt
> @@ -156,6 +164,17 @@ allOf:
>          interrupts:
>            maxItems: 1
>  
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - fsl,imx28-lcdif
> +    then:
> +      properties:
> +        dmas: false
> +        dma-names: false

Missing blank line.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

