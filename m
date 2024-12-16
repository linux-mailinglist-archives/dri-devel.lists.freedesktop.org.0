Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEE9F2EB5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4425510E5A3;
	Mon, 16 Dec 2024 11:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JldSboMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D591510E5A3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 11:02:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 541EC13C;
 Mon, 16 Dec 2024 12:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734346900;
 bh=udCyMjh1CS/PW2tV7THb/yDetlsCfrLAJU/dKWJECDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JldSboMbkpZz4y5srS00h2SA/bseewLAeGFVQPMcLU/0vLlG7QiYLap4PYdJu4ton
 FrkOqOVsrfSAqACA0wSg62pdsVYLlikZSEN1CSP5wKVAZj+e5AxStyJQtagJVLaLk+
 9fq+/ZfWoWMgETLXlyW3NwfD4uEK3ErA/i5eoBWE=
Date: Mon, 16 Dec 2024 13:02:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
Subject: Re: [PATCH v4 4/7] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <20241216110200.GE31128@pendragon.ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-4-f8e41425207b@ideasonboard.com>
 <5xualllquamelkxnjqe32lasba5wkgxzy2jnbfyvoot2mz26bg@ns2bdnhpqknv>
 <78de3f8c-2f6c-4996-ba50-05bd956c6305@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78de3f8c-2f6c-4996-ba50-05bd956c6305@ideasonboard.com>
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

On Mon, Dec 16, 2024 at 12:56:09PM +0200, Tomi Valkeinen wrote:
> On 16/12/2024 10:00, Krzysztof Kozlowski wrote:
> > On Fri, Dec 13, 2024 at 04:03:00PM +0200, Tomi Valkeinen wrote:
> >>   
> >> -    required:
> >> -      - port@0
> >> -      - port@1
> >> -
> >>       unevaluatedProperties: false
> >>   
> >>     renesas,cmms:
> >> @@ -817,6 +814,54 @@ allOf:
> >>           - reset-names
> >>           - renesas,vsps
> >>   
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - renesas,du-r8a779h0
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: Functional clock
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: du.0
> >> +
> >> +        interrupts:
> >> +          maxItems: 1
> >> +
> >> +        resets:
> > 
> > No minItems here...
> > 
> >> +          maxItems: 1
> >> +
> >> +        reset-names:
> >> +          items:
> >> +            - const: du.0
> >> +
> >> +        ports:
> >> +          properties:
> >> +            port@0:
> >> +              description: DSI 0
> >> +            port@1: false
> >> +            port@2: false
> >> +            port@3: false
> >> +
> >> +          required:
> >> +            - port@0
> >> +
> >> +        renesas,vsps:
> >> +          minItems: 1
> > 
> > so drop minItems here as well.
> 
> Ok. I wanted to be consistent with the other vsps entries in the file, 
> so I added both min and max items. But I can drop it.

I'd favour consistency with the other vsps entries, but not enough to
fight over it.

-- 
Regards,

Laurent Pinchart
