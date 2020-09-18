Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BB26EA63
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 03:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664446E0E0;
	Fri, 18 Sep 2020 01:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9506E0E0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 01:18:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEA9C2D7;
 Fri, 18 Sep 2020 03:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600391934;
 bh=02NFRVixNe7RIS+1uISxKS+ADE5ZLhxTdmlJT+2xOts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qDMzjoIXOun4pXzN4V74w+3JyTiDo9GKAwfF+dfnUTUv62yNmjfFFqTchRHaC/bj4
 wHhiE/L1/qyL79FoCKXpxOWG9bb2rhsxw6Awz1aT5BCBnwB3XhgLIY5G+6e8e2PnSH
 okORvFIxnXwsAnFK3dGYTgtkT9DkcHXBmREtUG6E=
Date: Fri, 18 Sep 2020 04:18:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: ti,am65x-dss: add missing
 properties to dt-schema
Message-ID: <20200918011823.GD589@pendragon.ideasonboard.com>
References: <20200916131009.221252-1-tomi.valkeinen@ti.com>
 <20200916131009.221252-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916131009.221252-2-tomi.valkeinen@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Sep 16, 2020 at 04:10:08PM +0300, Tomi Valkeinen wrote:
> Add assigned-clocks, assigned-clock-parents and dma-coherent optional
> properties.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/ti/ti,am65x-dss.yaml  | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 4f9185462ed3..4dc30738ee57 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -55,6 +55,14 @@ properties:
>        - const: vp1
>        - const: vp2
>  
> +  assigned-clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  assigned-clock-parents:
> +    minItems: 1
> +    maxItems: 3
> +

Those properties can occur in any node that has clocks. Do we need to
specify them explicitly in every schema ?

>    interrupts:
>      maxItems: 1
>  
> @@ -62,6 +70,9 @@ properties:
>      maxItems: 1
>      description: phandle to the associated power domain
>  
> +  dma-coherent:
> +    type: boolean
> +
>    ports:
>      type: object
>      description:

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
