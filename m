Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617B9D3566
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 09:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8490910E3A5;
	Wed, 20 Nov 2024 08:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ObZu/x8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C00610E3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 08:28:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 12C51A41DD0;
 Wed, 20 Nov 2024 08:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35851C4CECD;
 Wed, 20 Nov 2024 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732091338;
 bh=r5LJKMh22+WU9zlQmk8oS8zbTaFxi6bJT9D41aUjabE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ObZu/x8cTiiCQ4uqMKDf8ML2Grv1dygO0z0nUV6xGSv4CMHxYvsSXb+2EFsBETV+G
 FaGn6ZOeJrnlqxCzNBCUHWS8cOIGbHBM8fL6I0sMPB7eUbNft3TOnAxkY3fxFSupAw
 J+ivIPke741EE6xaoP6O9r8F3kUjiGamyl73MLjbd3+Sskmy9hs2l89lT83t+xVPz3
 8B86Wg3oI6XSPJl0I8/lfOjJmvY0xXU9DdK/UzvH75IzeDwBplqzw7Gz/89+5v+3p0
 RKbD7dN8nSBukFimzgS/D0m8fVMucJQBKlu+9lbhfFak6N9t74tporu/FT5z2DYMh7
 1ZGOGoq3ikZfQ==
Date: Wed, 20 Nov 2024 09:28:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH v2 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <jgabneyvumignjvgy3l7bmjccyxradhl4fguocrynymn5ii7uh@zpdvdsizpm3c>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
 <20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com>
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

On Mon, Nov 18, 2024 at 01:02:00PM +0000, Matt Coster wrote:
> Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
> integration in the TI k3-j721s2.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v2:
> - Use normal reg syntax for 64-bit values
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 9dc55a6d0d4023983a3fc480340351f3fa974ce5..b620baa56a4caa41246f7b53064d0e3309bdda8e 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -18,6 +18,11 @@ properties:
>                - ti,am62-gpu
>            - const: img,img-axe-1-16m
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - ti,j721s2-gpu
> +          - const: img,img-bxs-4-64
> +          - const: img,img-rogue
>  
>        # This legacy combination of compatible strings was introduced early on before the more
>        # specific GPU identifiers were used. Keep it around here for compatibility, but never use
> @@ -78,6 +83,18 @@ allOf:
>        properties:
>          power-domains:
>            maxItems: 1
> +  # Cores with two power domains
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:

Nope

> +              - const: img,img-bxs-4-64
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2
> +          maxItems: 2

You need to constrain power-domain-names. Same for other variants.


>    # Vendor integrations using a single clock domain
>    - if:
>        properties:
> @@ -85,6 +102,7 @@ allOf:
>            contains:
>              anyOf:
>                - const: ti,am62-gpu
> +              - const: ti,j721s2-gpu
>      then:
>        properties:
>          clocks:
> @@ -105,3 +123,26 @@ examples:
>          power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
>          power-domain-names = "a";
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>

Drop. No difference in this example.

Best regards,
Krzysztof

