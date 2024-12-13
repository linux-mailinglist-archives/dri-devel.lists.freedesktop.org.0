Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52A9F1284
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 17:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA78410E25B;
	Fri, 13 Dec 2024 16:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mJnvKbi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0539410E25B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 16:46:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07B21465;
 Fri, 13 Dec 2024 17:45:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734108324;
 bh=M8kcQm2A0ykm55axI3kDdeYhrMewZUX1CR/r0W7/ncU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJnvKbi1XTtUpAOhk1oNAuwTRxLq6PdodzjHwaWfSPT1zZ25ymT+Idk2kOPmxIlzX
 Fmv/2mL0Jr2fVFdq22MHWsA3t80mVE+kJQxRcSXq9+ekcpzdg4EQJRzOUhzOctEeDk
 Sw1MP6/DuoQuoqnj6cfGf7CE1COc70mNUrALakHk=
Date: Fri, 13 Dec 2024 18:45:41 +0200
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
Subject: Re: [PATCH v4 3/7] dt-bindings: display: renesas,du: Add missing
 maxItems
Message-ID: <20241213164541.GA8294@pendragon.ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
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

Hi Tomi,

Thank you for the patch.

On Fri, Dec 13, 2024 at 04:02:59PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index c5b9e6812bce..e5fbc4ffe29c 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -489,9 +489,11 @@ allOf:
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
> @@ -558,9 +560,11 @@ allOf:
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
> @@ -627,9 +631,11 @@ allOf:
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
> @@ -684,6 +690,7 @@ allOf:
>  
>          renesas,vsps:
>            minItems: 1
> +          maxItems: 1
>  
>        required:
>          - clock-names
> @@ -746,9 +753,11 @@ allOf:
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
> @@ -799,6 +808,7 @@ allOf:
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
