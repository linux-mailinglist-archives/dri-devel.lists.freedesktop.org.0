Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA894D5E3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C208710E05F;
	Fri,  9 Aug 2024 17:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QRvROvl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3C310E05F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 17:58:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B8D6961750;
 Fri,  9 Aug 2024 17:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3FAC32782;
 Fri,  9 Aug 2024 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723226302;
 bh=DxL8HNz0O+ryzWyfsA6C9wCd/wXfyjYBBqmvUecssDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QRvROvl2bllmqnyALF6Jeo8hS9QwzJFnJd6kZz4GU0FurSczGU5xIZm6FMJDPZLjS
 jiDwv1zLwa1MWipXGKWM5Yf57/ESflyM+1sssCbbwL/fAzXZ/pOL66nZ6kirhhZiu4
 IsG/xYPFERP6tgPzKtNTgB1WjUUZwesYU1JzKeyg2kOkwJwNYjcMVP4pZQHtc85gjl
 VTRPe6rFRIj9r6WhhjYce9S3d/i4ArNh7cY+Uq7boC1RPmrBWbCHn+V0H/fP54rcbk
 N/JZG5IENLbDqZyMFJEigryEHnkFGslZGg4ihPF2sDjnSEr41pFSXCmro01IOaz4+e
 BnOiONSsXjfDg==
Date: Fri, 9 Aug 2024 11:58:21 -0600
From: Rob Herring <robh@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: st,stm32-ltdc: Document
 stm32mp25 compatible
Message-ID: <20240809175821.GA927825-robh@kernel.org>
References: <20240809151314.221746-1-yannick.fertre@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809151314.221746-1-yannick.fertre@foss.st.com>
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

On Fri, Aug 09, 2024 at 05:13:14PM +0200, Yannick Fertre wrote:
> Add "st,stm32mp25-ltdc" compatible for SOC MP25. This new SOC introduce
> new clocks (bus, ref & lvds). Bus clock was separated from lcd clock.
> New sources are possible for lcd clock (lvds / ref).
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
> Changes in v2: Rework clock property.
>  .../bindings/display/st,stm32-ltdc.yaml       | 51 +++++++++++++++----
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> index d6ea4d62a2cf..cc578ad9f040 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> @@ -12,7 +12,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: st,stm32-ltdc
> +    enum:
> +      - st,stm32-ltdc
> +      - st,stm32mp25-ltdc
>  
>    reg:
>      maxItems: 1
> @@ -23,13 +25,6 @@ properties:
>        - description: errors interrupt line.
>      minItems: 1
>  
> -  clocks:
> -    maxItems: 1
> -
> -  clock-names:
> -    items:
> -      - const: lcd

No, keep these at the top-level. Add to the list and add 'minItems: 1'. 
Then in the if/then schema, just use minItems/maxItems to limit the 
number of entries.

> -
>    resets:
>      maxItems: 1
>  
> @@ -46,11 +41,47 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - clock-names
>    - resets
>    - port
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - st,stm32mp25-ltdc
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +          items:
> +            - description: Lcd Clock
> +            - description: Bus Clock
> +            - description: Reference Clock
> +            - description: Lvds Clock
> +        clock-names:
> +          items:
> +            - const: lcd
> +            - const: bus
> +            - const: ref
> +            - const: lvds
> +      required:
> +        - clocks
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +          items:
> +            - description: Lcd Clock
> +        clock-names:
> +          items:
> +            - const: lcd
> +      required:
> +        - clocks
> +        - clock-names
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 
