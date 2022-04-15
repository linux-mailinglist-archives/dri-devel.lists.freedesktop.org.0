Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE10C5028BD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 13:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA35410E183;
	Fri, 15 Apr 2022 11:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D3810E183
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 11:14:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-71-107-nat.elisa-mobile.fi
 [85.76.71.107])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E5F8482;
 Fri, 15 Apr 2022 13:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650021244;
 bh=qzpqaJiap4/DKYJZDwgAmyj6MPeXNP+N02wxXKN4cGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RQwxV/pyn48mqyN34K9eBfLiqTeSEKCeQs2dYVMVOKOt3zyUPzkSuuPPueR9onMY1
 klR6ZwpxkTgBST0aPM6/Shielw3JNBv8sn9C1AdKnkzpV5Yk8D8o4O4kR6CC7vOExD
 pnvFlVQS84Rb8pOUfPf6zjT8i1jY6Mw7dVo7Qc88=
Date: Fri, 15 Apr 2022 14:14:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Message-ID: <YllTed2IIAwWva6F@pendragon.ideasonboard.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Wed, Mar 16, 2022 at 01:10:54PM +0000, Biju Das wrote:
> Extend the Renesas DU display bindings to support the r9a07g044l
> DU module found on RZ/G2L LCDC.

Stupid question, but as this DU and the R-Car DU are completely
different pieces of hardware, wouldn't a separate bindings file make
sense ?

The DT description in this patch looks good to me.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description.
>  * Removed LCDC references
>  * Changed clock name from du.0->aclk
>  * Changed reset name from du.0->du
> RFC->v1:
>  * Changed  minItems->maxItems for renesas,vsps.
> RFC:
>  https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-18-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index 13efea574584..f560608bf4e8 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -40,6 +40,7 @@ properties:
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
>  
>    reg:
>      maxItems: 1
> @@ -824,6 +825,59 @@ allOf:
>          - reset-names
>          - renesas,vsps
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r9a07g044l
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +            - description: Register access clock
> +            - description: Video clock
> +
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pclk
> +            - const: vclk
> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DSI 0
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +        renesas,vsps:
> +          maxItems: 1
> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>  
>  examples:

-- 
Regards,

Laurent Pinchart
