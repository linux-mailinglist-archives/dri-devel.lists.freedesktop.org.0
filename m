Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D39F4A1B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDC510E224;
	Tue, 17 Dec 2024 11:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o06c0iOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC82E10E224
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:42:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC1BF4C7;
 Tue, 17 Dec 2024 12:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734435713;
 bh=/rYOAc8y4xEE7cn1aBZucNkEfLE/Pmtkk79KqNgF9j4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o06c0iOVU3ndycoPKNCasdwF6VUpwytQgSQfuOK2rjZjt886XIfFjQKhMLoxNlaYC
 nughHi0KMlOrmN0MTWSKmWRMqc6VpZ11qW8xzDbDaAsCDRtmsE9QR3H0EaOG8CHrol
 85GqP6uN+co5qb9NY/ayyJ7pA1eGGQq+TsmhgUCs=
Date: Tue, 17 Dec 2024 13:42:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
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
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
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
Message-ID: <20241217114227.GB32392@pendragon.ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
 <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
 <CAMuHMdUczNArF7JSfjrb11OTpd8LvHv5-gUFPFCayr+Qezsbbg@mail.gmail.com>
 <f10be07d-6bfa-4d09-9a45-81179592ec5c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f10be07d-6bfa-4d09-9a45-81179592ec5c@ideasonboard.com>
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

On Tue, Dec 17, 2024 at 11:59:53AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 17/12/2024 10:14, Geert Uytterhoeven wrote:
> > Hi Tomi,
> > 
> > On Tue, Dec 17, 2024 at 6:32 AM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> >> properties. As the amount of cmms or vsps is always a fixed amount, set
> >> the maxItems to match the minItems.
> >>
> >> Also add the minItems and maxItems to the top level properties.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > 
> > Thanks for your patch!
> > 
> >> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> >> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> >> @@ -77,6 +77,8 @@ properties:
> >>
> >>     renesas,cmms:
> >>       $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    minItems: 1
> >> +    maxItems: 4
> >>       items:
> >>         maxItems: 1
> >>       description:
> >> @@ -85,6 +87,8 @@ properties:
> >>
> >>     renesas,vsps:
> >>       $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    minItems: 1
> >> +    maxItems: 4
> >>       items:
> >>         items:
> >>           - description: phandle to VSP instance that serves the DU channel
> >> @@ -489,9 +493,11 @@ allOf:
> >>
> >>           renesas,cmms:
> >>             minItems: 4
> >> +          maxItems: 4
> >>
> >>           renesas,vsps:
> >>             minItems: 4
> >> +          maxItems: 4
> > 
> > AFAIK these two additions are not needed, as they already match the
> > values defined at the top level.
> 
> But if we add a new SoC, which has 5 vsps, we would need to increase the 
> values in the top level. Which would then mean these are needed, and I'm 
> sure adding them could be missed.

Let's keep things consistent with maxItems specified everywhere (my
preference is to not specify the items count at the top level hereas I
don't see any value in doing so, but I won't fight on that one if it's
what it takes to get the bindings merged).

-- 
Regards,

Laurent Pinchart
