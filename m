Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2DBA5BA2C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 08:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A210E51B;
	Tue, 11 Mar 2025 07:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hBlgToLC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97C810E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 07:51:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BA36AA45E07;
 Tue, 11 Mar 2025 07:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B819EC4CEE9;
 Tue, 11 Mar 2025 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741679511;
 bh=sgPc3Qvg0vgmi1gbRN19F9lZOqeVer1XVd9n2oDi5Nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBlgToLCWNhHLQM49b0jfSigvXzWgDtpL4wroyDom0phMXBTPN/44Iqyvdw1dr4He
 48/fKjrsIbLP82a0DaqlamJ6Nc/ZXp9W8dUS2g3AV2dD4ufXMyyed9zWq4jsaQ5R30
 wP+MyCVPxyX0eqD9FGpOiROcux4u3HxxeHRiw3KVuquuzbphqV62qdPjBs7AA/aCvX
 1uyVADxfKpDtjqwCXCqmYAr0F98W0y+XQbWI/ASI+Tyf+r0caRUDXQnCddp36vyFiy
 4C/huKSzMg593dmW4vrZJZRhvSIBf3utvIDxILeOHV0x68VWaTgjb6JEGjG7u40wJK
 Fix209mp90HcQ==
Date: Tue, 11 Mar 2025 08:51:48 +0100
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
 Darren Etheridge <detheridge@ti.com>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v3 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20250311-bizarre-debonair-macaque-451c4f@krzk-bin>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
 <20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com>
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

On Mon, Mar 10, 2025 at 01:10:26PM +0000, Matt Coster wrote:
> Unlike AXE-1-16M, BXS-4-64 uses two power domains.
> 
> Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
> integration in the TI k3-j721s2.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v3:
> - Include adding the second power domain so it's in context
> - Remove unnecessary example
> - Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com
> Changes in v2:
> - Use normal reg syntax for 64-bit values
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 34 +++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 5c16b2881447c9cda78e5bb46569e2f675d740c4..d9409d33154d429019776ddbf9d123b33f8c9740 100644
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
>        # This legacy combination of compatible strings was introduced early on
>        # before the more specific GPU identifiers were used.
> @@ -49,6 +54,7 @@ properties:
>    power-domain-names:
>      items:
>        - const: a
> +      - const: b

No, you just affected old device claiming it has two items. What's more,
it's not synced with power-domains. Both properties must have the same
constraints, but above power domains have "anything".

>  
>    dma-coherent: true
>  
> @@ -74,12 +80,38 @@ allOf:
>          - power-domains
>          - power-domain-names
>  
> +  # Cores with one power domain

Drop

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,img-axe-1-16m
> +    then:
> +      properties:
> +        power-domain-names:
> +          minItems: 1

Drop

> +          maxItems: 1
> +
> +  # Cores with two power domains

Drop

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,img-bxs-4-64
> +    then:
> +      properties:
> +        power-domain-names:
> +          minItems: 2
> +          maxItems: 2

Missing constraints for power-domains.

Best regards,
Krzysztof

