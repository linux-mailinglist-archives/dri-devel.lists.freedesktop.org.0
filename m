Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA323950A31
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 18:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EF210E38B;
	Tue, 13 Aug 2024 16:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j5TkZNoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA31A10E38B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 16:32:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BD2CDCE10C5;
 Tue, 13 Aug 2024 16:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3E4C4AF09;
 Tue, 13 Aug 2024 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723566741;
 bh=HuyCj2tPGVO2IiAHdy0cfOexKXFnn+hyoO6SKOtDQko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j5TkZNoVMcsBgfpVjTlXUuMIILDxDwbSuagPpj+O55WlDHV4IRlSvnc7tPeSffXhf
 x4xmAJcB72OPQCdZt8yPntPAEOcyiHBHI6FCAKiyhG1gG1Kb/SAmbI6lAmGZirLGJ8
 FOL07CVmPnMDGaIqpzz4ZaAmWziHGr8a0MyiXJvbN4vq7yIcKrK2rYzzEiHA0FiTnP
 5ojyZWao6e3ZEVhE75CYg6y6dueLHzmsjjqxsVF2LsTP3LAY+T5k8o2dT4Fqe2YX6q
 b8nAn1bo68Oy182SbHJb0bU0GZlN9HymjTpnL3PNsr73uURBR+V/jl2Y5qqZanIBkV
 q99/SzwaAN6KA==
Date: Tue, 13 Aug 2024 10:32:20 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240813163220.GA1164014-robh@kernel.org>
References: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
 <20240805155242.151661-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805155242.151661-2-biju.das.jz@bp.renesas.com>
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

On Mon, Aug 05, 2024 at 04:52:35PM +0100, Biju Das wrote:
> Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> SoC, but has only DPI interface.
> 
> While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> SoCs. Currently there is no user for the DPI interface and hence there
> won't be any ABI breakage for adding port@1 as required property for
> RZ/G2L and RZ/V2L SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced ports->port property for RZ/G2UL as it supports only DPI.
>    and retained ports property for RZ/{G2L,V2L} as it supports both DSI
>    and DPI output interface.

Why? Having port and ports is just a needless complication.

>  * Added missing blank line before example.
>  * Dropped tags from Conor and Geert as there are new changes.
> v1->v2:
>  * Updated commit description related to non ABI breakage.
>  * Added Ack from Conor.
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 35 +++++++++++++++++--
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 08e5b9478051..ca01bf26c4c0 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
>        - items:
>            - enum:
> @@ -60,8 +61,9 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          unevaluatedProperties: false
>  
> -    required:
> -      - port@0
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Connection to the DU output video port.
>  
>      unevaluatedProperties: false
>  
> @@ -83,11 +85,38 @@ required:
>    - clock-names
>    - resets
>    - power-domains
> -  - ports
>    - renesas,vsps
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043u-du
> +    then:
> +      properties:
> +        port:
> +          description: DPI

This is equivalent to 'port@0'. IMO, this case should have a 'port@1' 
node so that DPI interface is *always* the same port.

> +
> +      required:
> +        - port
> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: DPI
> +
> +          required:
> +            - port@0
> +            - port@1
> +      required:
> +        - ports
> +
>  examples:
>    # RZ/G2L DU
>    - |
> -- 
> 2.43.0
> 
