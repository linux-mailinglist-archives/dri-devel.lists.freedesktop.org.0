Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F69F4A2C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB2310E1E7;
	Tue, 17 Dec 2024 11:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D7tOTCAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF27710E1E7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:44:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E1674C7;
 Tue, 17 Dec 2024 12:44:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734435846;
 bh=frszXIwNC27Drg/aFfoE6hHQ9Kenq+Ofhsp9YXnj7LI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D7tOTCAejLMebYWePjmpXLJZDVazu6g0wLrEuDl7Clqz58qugAlnKy0tGLDcLZWct
 rm36700r4ETAKgDSYIA22caeSA7OFc3yPnh+xU2/+dCHpLQFaT+YxKHYaYsdgYCZXk
 t6LZ2BSGA5gmmT/bXDiMKIUWTLBMgbIzr2N7NnXg=
Date: Tue, 17 Dec 2024 13:44:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: display: renesas,du: Add missing
 constraints
Message-ID: <20241217114441.GC32392@pendragon.ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
 <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
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

On Tue, Dec 17, 2024 at 07:31:37AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
> 
> Also add the minItems and maxItems to the top level properties.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index c5b9e6812bce..ef4568118e94 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -77,6 +77,8 @@ properties:
>  
>    renesas,cmms:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        maxItems: 1
>      description:
> @@ -85,6 +87,8 @@ properties:
>  
>    renesas,vsps:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        items:
>          - description: phandle to VSP instance that serves the DU channel
> @@ -489,9 +493,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 4
> +          maxItems: 4
>  
>          renesas,vsps:
>            minItems: 4
> +          maxItems: 4
>  
>        required:
>          - clock-names
> @@ -558,9 +564,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 3
> +          maxItems: 3
>  
>          renesas,vsps:
>            minItems: 3
> +          maxItems: 3
>  
>        required:
>          - clock-names
> @@ -627,9 +635,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 3
> +          maxItems: 3
>  
>          renesas,vsps:
>            minItems: 3
> +          maxItems: 3
>  
>        required:
>          - clock-names
> @@ -683,7 +693,7 @@ allOf:
>              - port@1
>  
>          renesas,vsps:
> -          minItems: 1
> +          maxItems: 1
>  
>        required:
>          - clock-names
> @@ -746,9 +756,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 2
> +          maxItems: 2
>  
>          renesas,vsps:
>            minItems: 2
> +          maxItems: 2
>  
>        required:
>          - clock-names
> @@ -799,6 +811,7 @@ allOf:
>  
>          renesas,vsps:
>            minItems: 2
> +          maxItems: 2
>  
>        required:
>          - clock-names

-- 
Regards,

Laurent Pinchart
