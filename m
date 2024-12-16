Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122239F2EAD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCB910E0B8;
	Mon, 16 Dec 2024 11:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SMlth3zu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443F810E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 11:00:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 392B77E1;
 Mon, 16 Dec 2024 12:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734346807;
 bh=oAt7KRdJ/jQfbkitGGkqyOeJ/rn5yv50BSyyPLvTaHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SMlth3zujCY5XCF3+mAIBcCeJtZ21mPYPM/44PuoAd2jcxOB8gR02LRGOayRnY/Rx
 HAePBlz41ASaqjvazU+sMqcr/flrnKxwqvrhYVwKECanZMiwMISYMzNmWNWwhKTI+o
 v+3MxpiTibS4bzpowAAGzQp4szFQPLtdm4wtayNI=
Date: Mon, 16 Dec 2024 13:00:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
Subject: Re: [PATCH v4 3/7] dt-bindings: display: renesas,du: Add missing
 maxItems
Message-ID: <20241216110027.GD31128@pendragon.ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
 <20241213-rcar-gh-dsi-v4-3-f8e41425207b@ideasonboard.com>
 <l2r53ipif43k7kkjqc66z2mq6tyw6niiz4t4nnfge23hygx2pw@xrgk4mv5ljzx>
 <20241216083239.GC32204@pendragon.ideasonboard.com>
 <12d157af-e309-4c8d-9c14-bd0e9da8194d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12d157af-e309-4c8d-9c14-bd0e9da8194d@kernel.org>
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

On Mon, Dec 16, 2024 at 11:42:30AM +0100, Krzysztof Kozlowski wrote:
> On 16/12/2024 09:32, Laurent Pinchart wrote:
> > On Mon, Dec 16, 2024 at 08:58:49AM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Dec 13, 2024 at 04:02:59PM +0200, Tomi Valkeinen wrote:
> >>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>
> >>> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> >>> properties. As the amount of cmms or vsps is always a fixed amount, set
> >>> the maxItems to match the minItems.
> >>>
> >>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/display/renesas,du.yaml | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>
> >> The top level property should define widest constraints as well.
> > 
> > I'm curious, why is that ? I understand why a top-level default would
> > make sense when it's optionally overridden by model-specific values, but
> > in this case there's no such default. Every SoC has its own fixed value.
> 
> Because otherwise top level property does not have proper description
> and we expect properties to be defined at top-level.

Is it invalid YAML schema to have

  renesas,cmms:
    description: ......

with the min/maxItems in the conditional blocks ? Or did you mean, by
proper description, not just the description field ? We could have

  renesas,cmms:
    description: ......
    minItems: 1
    maxItems: 256

but I really don't see what that would bring from a documentation point
of view. Are there tools that depend on minItems and maxItems being
present at the top level ?

-- 
Regards,

Laurent Pinchart
