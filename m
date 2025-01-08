Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA445A06971
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 00:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E55210E966;
	Wed,  8 Jan 2025 23:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VuNtBX7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF5A10E966
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 23:31:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4FF48A41BB5;
 Wed,  8 Jan 2025 23:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7DDC4CED3;
 Wed,  8 Jan 2025 23:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736379083;
 bh=hGzh6Ux0equEOkz0+aeV+MQwWoU7zw3mDv7K/oHfxJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VuNtBX7gO9+r+kRfw5uE/mylZqfhHuk6TrQGv6FcAiOMa/afIdcIwtJlAuUhxkqEJ
 aL28jKgy+1KXiTElsi7FNtMlsaowk8YaId0DYdjfZO3NoGHAXRhn/5EHJTwcCPE7lk
 Tyg0TcgFJ+iTbPexED2K1JjcIXIqf8dAri4hbc63Fb/npIm5uqIE50p32fXDw6KYCv
 2/uXdqdceLDJOTMI3YCGve0lLtJ9vyAuvjXcvc7hFkhXNSiVt3jmHIKS0fcKEkFB1l
 juFvd5ZsT0Z6QlSL6KFMGNlpnSZGwR0Y/7EF9HGHktEYyA0N1ngq2/wh7qylEjxWIA
 qokiP1TX1M2rg==
Date: Wed, 8 Jan 2025 17:31:22 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, daniel@fooishbar.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v9 10/11] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <20250108233122.GA1227227-robh@kernel.org>
References: <20250108115233.17729-1-andyshrk@163.com>
 <20250108115233.17729-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108115233.17729-11-andyshrk@163.com>
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

On Wed, Jan 08, 2025 at 07:52:27PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v9:
> - Drop 'vop-' prefix of interrupt-names.
> - Add blank line between DT properties
> - Remove list interrupt-names in top level

That's the opposite of what we usually want...

> 
> Changes in v8:
> - Fix dt_binding_check errors
> - ordered by soc name
> - Link to the previous version:
>   https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u
> 
> Changes in v4:
> - describe constraint SOC by SOC, as interrupts of rk3576 is very
>   different from others
> - Drop Krzysztof's Reviewed-by, as this version changed a lot.
> 
> Changes in v3:
> - ordered by soc name
> - Add description for newly added interrupt
> 
> Changes in v2:
> - Add dt bindings
> 
>  .../display/rockchip/rockchip-vop2.yaml       | 83 +++++++++++++++----
>  1 file changed, 67 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> index 2531726af306..44256cdcb877 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - rockchip,rk3566-vop
>        - rockchip,rk3568-vop
> +      - rockchip,rk3576-vop
>        - rockchip,rk3588-vop
>  
>    reg:
> @@ -37,10 +38,17 @@ properties:
>        - const: gamma-lut
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
>      description:
> -      The VOP interrupt is shared by several interrupt sources, such as
> -      frame start (VSYNC), line flag and other status interrupts.
> +      For VOP version under rk3576, the interrupt is shared by several interrupt
> +      sources, such as frame start (VSYNC), line flag and other interrupt status.
> +      For VOP version from rk3576 there is a system interrupt for bus error, and
> +      every video port has it's independent interrupts for vsync and other video
> +      port related error interrupts.
> +
> +  interrupt-names:
> +    maxItems: 4
>  
>    # See compatible-specific constraints below.
>    clocks:
> @@ -120,43 +128,86 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-vop
> +            enum:
> +              - rockchip,rk3566-vop
> +              - rockchip,rk3568-vop
>      then:
>        properties:
>          clocks:
> -          minItems: 7
> +          minItems: 5
> +
>          clock-names:
> -          minItems: 7
> +          minItems: 5
>  
>          ports:
>            required:
>              - port@0
>              - port@1
>              - port@2
> -            - port@3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3576-vop
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +
> +        clock-names:
> +          minItems: 5
> +
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +        interrupts:
> +          items:
> +            - description: vop system interrupt, such as axi bus error
> +            - description: interrupts for video port0, such as vsync, dsp_hold.
> +            - description: interrupts for video port1, such as vsync, dsp_hold.
> +            - description: interrupts for video port2, such as vsync, dsp_hold.
> +
> +        interrupt-names:
> +          items:
> +            - const: sys
> +            - const: vp0
> +            - const: vp1
> +            - const: vp2
>  
>        required:
>          - rockchip,grf
> -        - rockchip,vo1-grf
> -        - rockchip,vop-grf
>          - rockchip,pmu
>  
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-vop
> +    then:
>        properties:
> -        rockchip,vo1-grf: false
> -        rockchip,vop-grf: false
> -        rockchip,pmu: false
> -
>          clocks:
> -          maxItems: 5
> +          minItems: 7
> +
>          clock-names:
> -          maxItems: 5
> +          minItems: 7
>  
>          ports:
>            required:
>              - port@0
>              - port@1
>              - port@2
> +            - port@3
> +
> +      required:
> +        - rockchip,grf
> +        - rockchip,vo1-grf
> +        - rockchip,vop-grf
> +        - rockchip,pmu

Where do the existing platforms have a constraint of only 1 interrupt?

And now while rk3576 has defined interrupt-names, all the other can have 
4 entries with anything.

Rob
