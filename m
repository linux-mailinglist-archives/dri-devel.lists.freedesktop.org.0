Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F56EDA66
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 04:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35A710E585;
	Tue, 25 Apr 2023 02:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC1210E585
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 02:58:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D3A175B;
 Tue, 25 Apr 2023 04:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1682391525;
 bh=HIuAn28NxFXj/Q/jaDa9uJMDtQZhMt10o46khfhmUrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jvOdaUVY633oD0we8rZN87f/W0ntol6zJEVpDt85sTlVv/fh1LOC86+MGoQZ27SXY
 mGR5Yc63EcnRJ/PHHrUC9rGU+M0b0dEOM8X3ztLtDpmzyFeYDPIkYty2G+DRvRj2Yv
 CUpeOH3NjlA74O8DAoR/aXGo+KUT+ERgQeXiv4k8=
Date: Tue, 25 Apr 2023 05:59:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v8 3/5] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/V2L DU bindings
Message-ID: <20230425025907.GB11371@pendragon.ideasonboard.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230424161024.136316-4-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Mon, Apr 24, 2023 at 05:10:22PM +0100, Biju Das wrote:
> Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v7->v8:
>  * Fixed the typo vsp2->du
>  * Added Rb tag from Rob as the change is trivial.
> v7:
>  * New patch.
> ---
>  .../devicetree/bindings/display/renesas,rzg2l-du.yaml    | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index ab99e7d57a7d..98686ea84d53 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -16,8 +16,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - renesas,r9a07g044-du # RZ/G2{L,LC}
> +    oneOf:
> +      - enum:
> +          - renesas,r9a07g044-du # RZ/G2{L,LC}
> +      - items:
> +          - enum:
> +              - renesas,r9a07g054-du    # RZ/V2L
> +          - const: renesas,r9a07g044-du # RZ/G2L fallback
>  
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart
