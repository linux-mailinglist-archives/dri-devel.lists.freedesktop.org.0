Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6A29F2B4E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406FD10E3CD;
	Mon, 16 Dec 2024 08:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BbEOKr7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A2D10E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1A606A40CB9;
 Mon, 16 Dec 2024 07:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB02C4CED0;
 Mon, 16 Dec 2024 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734336030;
 bh=cleT8kKGNwdfGdbgCrYsfy4Dtbwt4FlTlSPcSnCBNXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BbEOKr7jhXXOqYyzom4UkeSPHyG3yI9GhbrK8snkf0zLbjbc9jner7fIciCJ5Zqqp
 2xTRoC0/cnrjODXjbpTtw4bSyZizR0khDbY0Bz5+ypVLn6njDfBroJO1UKoOjnUi6x
 TBhLuJWe1sOZDgRYK0tAKbFGV5CG4lItdR7ijvnTKJ1R+h7CfZXIM9yQ9ywHuCtBDt
 ncQS4ulsLX+HKUxAXG0jJuKXj1tN/Kc7CH/9Bvzu2ivA3lDN7PcwQ8m0lqkECihQL2
 dRfYTeS9aSDT9kSXpPfnbfGKcrGTkRdnZhPP7moVABNT1dT4yZMVsw1lwugyZbmZ0N
 GVWohM7bWd54A==
Date: Mon, 16 Dec 2024 09:00:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <5xualllquamelkxnjqe32lasba5wkgxzy2jnbfyvoot2mz26bg@ns2bdnhpqknv>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-4-f8e41425207b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-rcar-gh-dsi-v4-4-f8e41425207b@ideasonboard.com>
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

On Fri, Dec 13, 2024 at 04:03:00PM +0200, Tomi Valkeinen wrote:
>  
> -    required:
> -      - port@0
> -      - port@1
> -
>      unevaluatedProperties: false
>  
>    renesas,cmms:
> @@ -817,6 +814,54 @@ allOf:
>          - reset-names
>          - renesas,vsps
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779h0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Functional clock
> +
> +        clock-names:
> +          items:
> +            - const: du.0
> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:

No minItems here...

> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI 0
> +            port@1: false
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +
> +        renesas,vsps:
> +          minItems: 1

so drop minItems here as well.

Best regards,
Krzysztof

